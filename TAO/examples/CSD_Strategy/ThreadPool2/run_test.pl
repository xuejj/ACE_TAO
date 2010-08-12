eval '(exit $?0)' && eval 'exec perl -S $0 ${1+"$@"}'
     & eval 'exec perl -S $0 $argv:q'
     if 0;

# $Id$
# -*- perl -*-

use lib "$ENV{ACE_ROOT}/bin";
use PerlACE::Run_Test;

$status = 0;

$iorfname_prefix = "server";
$num_servants=10;
$num_clients_per_servant=4;
$num_clients=$num_servants * $num_clients_per_servant;

#Delete old ior files.
for (my $i = 0; $i < $num_servants; $i++) {
  $servant_id = sprintf("%02d", ($i + 1));
  $iorfile[$i] = PerlACE::LocalFile($iorfname_prefix . "_$servant_id.ior");
    
  unlink $iorfile[$i];
}

if (PerlACE::is_vxworks_test()) {
    $SV  = new PerlACE::ProcessVX ("server_main", "-p $iorfname_prefix -s $num_servants -c $num_clients");
}
else {
    $SV  = new PerlACE::Process ("server_main", "-p $iorfname_prefix -s $num_servants -c $num_clients");
}

$SV->Spawn ();

# Wait for the servant ior files created by server.
for (my $i = 0; $i < $num_servants; $i++) {
  $servant_id = sprintf("%02d", ($i + 1));
  $iorfile[$i] = PerlACE::LocalFile($iorfname_prefix . "_$servant_id.ior");
    
  if (PerlACE::waitforfile_timed ($iorfile[$i],
                        $PerlACE::wait_interval_for_process_creation) == -1) {
    print STDERR "ERROR: cannot find file <$iorfile[$i]>\n";
    $SV->Kill (); $SV->TimedWait (1);
    exit 1;
  }
}

$count = 0;

for (my $i = 0; $i < $num_servants; $i++) { 
  for ($j = 0; $j < $num_clients_per_servant; $j++) {
    $CLS[$count] = new PerlACE::Process ("client_main", " -i file://$iorfile[$i]");
    $CLS[$count]->Spawn ();
    $count ++;
  }
}

for (my $i = 0; $i < $num_clients; $i++) {
  $client = $CLS[$i]->WaitKill (60);

  if ($client != 0) {
    print STDERR "ERROR: client $i returned $client\n";
    $status = 1;
  }
}

$server = $SV->WaitKill (60);

if ($server != 0) {
    print STDERR "ERROR: server returned $server\n";
    $status = 1;
}

#Delete ior files generated by this run.
for (my $i = 0; $i < $num_servants; $i++) {
  $servant_id = sprintf("%02d", ($i + 1));
  $iorfile[$i] = PerlACE::LocalFile($iorfname_prefix . "_$servant_id.ior");
  
  unlink $iorfile[$i];
}

exit $status;