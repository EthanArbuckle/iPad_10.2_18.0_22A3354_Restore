@implementation TimeSyncPortCreateFromClock

void __TimeSyncPortCreateFromClock_block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 258);
  v1 = (void *)_timeSyncPortRefs;
  _timeSyncPortRefs = v0;

  v2 = dispatch_queue_create("com.apple.timesync.timesyncportinterface", 0);
  v3 = (void *)_timeSyncPortInterfaceQueue;
  _timeSyncPortInterfaceQueue = (uint64_t)v2;

}

@end
