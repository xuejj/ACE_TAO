# $Id$

eval '(exit $?0)' && eval 'exec perl -S $0 ${1+"$@"}'
    & eval 'exec perl -S $0 $argv:q'
    if 0;

use Env (ACE_ROOT);
use lib "$ACE_ROOT/bin";
use PerlACE::Run_Test;

$ior = "Messenger.ior";
unlink $ior;

# start MessengerServer
$S = new PerlACE::Process("MessengerServer");
$S->Spawn();
if (PerlACE::waitforfile_timed ($ior, $PerlACE::wait_interval_for_process_creation) == -1) {
    print STDERR "ERROR: cannot find file $ior\n";
    $S->Kill(); 
    exit 1;
}

# start MessengerClient
select undef, undef, undef, .5;
$C = new PerlACE::Process("MessengerClient", " -ORBInitRef Messenger=file://$ior");

if ($C->SpawnWaitKill(15) != 0) {
     $S->Kill();
     exit (1);
}

# clean-up 
$S->Kill();
#unlink $ior;

exit 0;


