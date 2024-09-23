@implementation SBSEventObserverStopObservingAllEvents

uint64_t __SBSEventObserverStopObservingAllEvents_block_invoke()
{
  xpc_set_event();
  return 1;
}

@end
