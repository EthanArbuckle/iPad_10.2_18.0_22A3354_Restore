@implementation RBPowerlogEvent

void __RBPowerlogEvent_block_invoke()
{
  RBPLEventQueue *v0;
  void *v1;

  v0 = objc_alloc_init(RBPLEventQueue);
  v1 = (void *)RBPowerlogEvent_eventQueue;
  RBPowerlogEvent_eventQueue = (uint64_t)v0;

}

@end
