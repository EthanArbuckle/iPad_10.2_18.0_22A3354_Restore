@implementation STSharedContainerSizingQueue

void __STSharedContainerSizingQueue_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.settings.storage.containersizing", attr);
  v2 = (void *)STSharedContainerSizingQueue_queue;
  STSharedContainerSizingQueue_queue = (uint64_t)v1;

}

@end
