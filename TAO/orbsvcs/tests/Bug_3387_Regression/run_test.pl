eval '(exit $?0)' && eval 'exec perl -S $0 ${1+"$@"}'
    & eval 'exec perl -S $0 $argv:q'
    if 0;

#$Id$

use Env (ACE_ROOT);
use lib "$ACE_ROOT/bin";
use PerlACE::Run_Test;

$nsiorfile   = PerlACE::LocalFile("ns.ior");
$messiorfile = PerlACE::LocalFile("Messenger.ior");
$notify_ior  = PerlACE::LocalFile("notify.ior");
$arg_ns_ref = "-ORBInitRef NameService=file://$nsiorfile";
unlink $nsiorfile;
unlink $messiorfile;
unlink $notify_ior;
$consumer_orb_port = 12345;
$consumer_endpoint = "iiop://localhost:$consumer_orb_port";
$arg_endpoint = "-ORBEndPoint $consumer_endpoint";

# start Naming Service
$NameService = "$ENV{TAO_ROOT}/orbsvcs/Naming_Service/Naming_Service";
$NS = new PerlACE::Process($NameService, "-o $nsiorfile");
$NS->Spawn();
if (PerlACE::waitforfile_timed ($nsiorfile, 10) == -1) {
    print STDERR "ERROR: cannot find file $nsiorfile\n";
    $NS->Kill(); 
    exit 1;
}

# start Notification Service

$NotifyService = "$ENV{TAO_ROOT}/orbsvcs/Notify_Service/Notify_Service";
$NFS = new PerlACE::Process($NotifyService, "$arg_ns_ref -IORoutput $notify_ior -UseSeparateDispatchingORB 1 -ORBSvcConf NotSvc.conf");
$NFS->Spawn();
# the ior file is only used to wait for the service to start
if (PerlACE::waitforfile_timed ($notify_ior, 10) == -1) {
   print STDERR "ERROR: Timed out waiting for $notify_ior\n";
   $NS->Kill ();
   $NFS->Kill ();
   exit 1;
}

# start MessengerServer
$S = new PerlACE::Process("MessengerServer", $arg_ns_ref);
$S->Spawn();

# Wait for the MessengerServer
if (PerlACE::waitforfile_timed ($messiorfile, 10) == -1) {
   print STDERR "ERROR: Timed out waiting for $messiorfile\n";
   $S->Kill();
   $NS->Kill ();
   $NFS->Kill ();
   exit 1;
}
# start first MessengerConsumer
$MC1 = new PerlACE::Process("MessengerConsumer", "$arg_ns_ref $arg_endpoint -p 1");
$MC1->Spawn();

# start MessengerClient
$C = new PerlACE::Process("MessengerClient", $arg_ns_ref);
$C->Spawn();

# wait for first MessengerConsumer to end
$MC1->WaitKill (15);

# start second MessengerConsumer
$MC2 = new PerlACE::Process("MessengerConsumer", "$arg_ns_ref $arg_endpoint -p 2");
$MC2->Spawn();

# wait for second MessengerConsumer to end
$MC2->WaitKill (15);

$C->Kill();
$S->Kill();
$NFS->Kill();
$NS->Kill();

unlink $nsiorfile;
unlink $messiorfile;
unlink $notify_ior;

exit 0;