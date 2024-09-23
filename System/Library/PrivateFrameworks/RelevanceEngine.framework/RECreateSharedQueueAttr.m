@implementation RECreateSharedQueueAttr

void ___RECreateSharedQueueAttr_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.RelevanceEngine.SharedQueue", 0);
  v1 = (void *)_RECreateSharedQueueAttr_SharedQueue;
  _RECreateSharedQueueAttr_SharedQueue = (uint64_t)v0;

}

@end
