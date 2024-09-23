@implementation PLCloudCopyDefaultSerialQueueAttributes

void __PLCloudCopyDefaultSerialQueueAttributes_block_invoke()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v2, QOS_CLASS_BACKGROUND, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)PLCloudCopyDefaultSerialQueueAttributes_attr;
  PLCloudCopyDefaultSerialQueueAttributes_attr = v0;

}

@end
