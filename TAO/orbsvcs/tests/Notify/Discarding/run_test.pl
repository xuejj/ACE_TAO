eval '(exit $?0)' && eval 'exec perl -S $0 ${1+"$@"}'
    & eval 'exec perl -S $0 $argv:q'
    if 0;

# $Id$
# -*- perl -*-

use lib "$ENV{ACE_ROOT}/bin";
use PerlACE::Run_Test;

PerlACE::add_lib_path ('../lib');

PerlACE::check_privilege_group();

$ior = PerlACE::LocalFile ("supplier.ior");
$namingior = PerlACE::LocalFile ("naming.ior");
$notifyior = PerlACE::LocalFile ("notify.ior");
$notify_conf = PerlACE::LocalFile ("notify$PerlACE::svcconf_ext");
$status = 0;
$deadline = 0;

foreach my $arg (@ARGV) {
  if ($arg eq "-d") {
    $deadline = 1;
  }
  else {
    print "Usage: $0 [-d]\n" .
          "       -d specifies that deadline discarding be tested.\n";
    exit(0);
  }
}

unlink $notifyior;

$port = PerlACE::uniqueid () + 10001;
$NS = new PerlACE::Process ("../../../Naming_Service/Naming_Service",
                            "-ORBEndpoint iiop://localhost:$port " .
                            "-o $namingior");
$TS = new PerlACE::Process ("../../../Notify_Service/Notify_Service",
                            "-ORBInitRef NameService=iioploc://" .
                            "localhost:$port/NameService " .
                            "-IORoutput $notifyior -ORBSvcConf " .
                            "$notify_conf");
$STS = new PerlACE::Process ("Structured_Supplier",
                             "-ORBInitRef NameService=iioploc://" .
                             "localhost:$port/NameService");
$STC = new PerlACE::Process ("Structured_Consumer");

$SES = new PerlACE::Process ("Sequence_Supplier",
                             "-ORBInitRef NameService=iioploc://" .
                             "localhost:$port/NameService");
$SEC = new PerlACE::Process ("Sequence_Consumer");

unlink $ior;
unlink $notifyior;
unlink $namingior;

$client_args = "-ORBInitRef NameService=iioploc://localhost:" .
               "$port/NameService";
$NS->Spawn ();

if (PerlACE::waitforfile_timed ($namingior, $PerlACE::wait_interval_for_process_creation) == -1) {
      print STDERR "ERROR: waiting for the naming service to start\n";
      $NS->Kill ();
      exit 1;
}

$TS->Spawn ();

if (PerlACE::waitforfile_timed ($notifyior, $PerlACE::wait_interval_for_process_creation) == -1) {
    print STDERR "ERROR: waiting for the notify service to start\n";
    $TS->Kill ();
    $NS->Kill ();
    exit 1;
}

@policies = ("fifo", "priority", "lifo");
if ($deadline) {
  push(@policies, "deadline");
}

@server_opts = ("", "", "", " -d");
for($i = 0; $i <= $#policies; $i++) {
  $discard_policy = $policies[$i];
  print "****** Structured Supplier -> Structured Consumer with the " .
        "$discard_policy policy ******\n";

  unlink $ior;
  $STS->Arguments($STS->Arguments() . $server_opts[$i]);
  $STS->Spawn ();

  if (PerlACE::waitforfile_timed ($ior, $PerlACE::wait_interval_for_process_creation) == -1) {
      print STDERR "ERROR: waiting for the supplier to start\n";
      $STS->Kill ();
      $TS->Kill ();
      $NS->Kill ();
      $status = 1;
      last;
  }

  $STC->Arguments($client_args . " -d $discard_policy");
  $client = $STC->SpawnWaitKill (20);
  if ($client != 0) {
    $status = 1;
    last;
  }
  $server = $STS->WaitKill (5);
  if ($server != 0) {
    $status = 1;
    last;
  }
}

if ($status == 0) {
  for($i = 0; $i <= $#policies; $i++) {
    $discard_policy = $policies[$i];
    print "***** Structured Supplier -> Sequence Consumer with the " .
          "$discard_policy policy *****\n";

    unlink $ior;
    $STS->Arguments($STS->Arguments() . $server_opts[$i]);
    $STS->Spawn ();

    if (PerlACE::waitforfile_timed ($ior, $PerlACE::wait_interval_for_process_creation) == -1) {
        print STDERR "ERROR: waiting for the supplier to start\n";
        $STS->Kill ();
        $TS->Kill ();
        $NS->Kill ();
        $status = 1;
        last;
    }

    $SEC->Arguments($client_args . " -d $discard_policy");
    $client = $SEC->SpawnWaitKill (20);
    if ($client != 0) {
      $status = 1;
      last;
    }
    $server = $STS->WaitKill (5);
    if ($server != 0) {
      $status = 1;
      last;
    }
  }
}

if ($status == 0) {
  for($i = 0; $i <= $#policies; $i++) {
    $discard_policy = $policies[$i];
    print "**** Sequence Supplier -> Sequence Consumer with the " .
          "$discard_policy policy ****\n";

    unlink $ior;
    $SES->Arguments($SES->Arguments() . $server_opts[$i]);
    $SES->Spawn ();

    if (PerlACE::waitforfile_timed ($ior, $PerlACE::wait_interval_for_process_creation) == -1) {
        print STDERR "ERROR: waiting for the supplier to start\n";
        $SES->Kill ();
        $TS->Kill ();
        $NS->Kill ();
        $status = 1;
        last;
    }

    $SEC->Arguments($client_args . " -d $discard_policy");
    $client = $SEC->SpawnWaitKill (20);
    if ($client != 0) {
      $status = 1;
      last;
    }
    $server = $SES->WaitKill (5);
    if ($server != 0) {
      $status = 1;
      last;
    }
  }
}

if ($status == 0) {
  for($i = 0; $i <= $#policies; $i++) {
    $discard_policy = $policies[$i];
    print "**** Sequence Supplier -> Structured Consumer with the " .
          "$discard_policy policy ****\n";

    unlink $ior;
    $SES->Arguments($SES->Arguments() . $server_opts[$i]);
    $SES->Spawn ();

    if (PerlACE::waitforfile_timed ($ior, $PerlACE::wait_interval_for_process_creation) == -1) {
        print STDERR "ERROR: waiting for the supplier to start\n";
        $SES->Kill ();
        $TS->Kill ();
        $NS->Kill ();
        $status = 1;
        last;
    }

    $STC->Arguments($client_args . " -d $discard_policy");
    $client = $STC->SpawnWaitKill (20);
    if ($client != 0) {
      $status = 1;
      last;
    }
    $server = $SES->WaitKill (5);
    if ($server != 0) {
      $status = 1;
      last;
    }
  }
}

$TS->Kill ();
$NS->Kill ();

unlink $ior;
unlink $notifyior;
unlink $namingior;


exit $status;