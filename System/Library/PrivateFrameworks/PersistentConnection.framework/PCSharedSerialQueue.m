@implementation PCSharedSerialQueue

void __PCSharedSerialQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("PCSharedSerialQueue", 0);
  v1 = (void *)PCSharedSerialQueue_sQueue;
  PCSharedSerialQueue_sQueue = (uint64_t)v0;

}

@end
