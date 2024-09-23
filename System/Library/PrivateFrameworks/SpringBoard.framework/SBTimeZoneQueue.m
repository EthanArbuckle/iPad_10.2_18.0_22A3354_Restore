@implementation SBTimeZoneQueue

void __SBTimeZoneQueue_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = BSDispatchQueueCreateWithQualityOfService();
  v1 = (void *)SBTimeZoneQueue___sbTimezoneQueue;
  SBTimeZoneQueue___sbTimezoneQueue = v0;

}

@end
