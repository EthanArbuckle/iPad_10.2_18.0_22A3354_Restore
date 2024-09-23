@implementation TIQueueLow

void ___TIQueueLow_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_UTILITY, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create(0, v2);
  v1 = (void *)_TIQueueLow::sQueue;
  _TIQueueLow::sQueue = (uint64_t)v0;

}

@end
