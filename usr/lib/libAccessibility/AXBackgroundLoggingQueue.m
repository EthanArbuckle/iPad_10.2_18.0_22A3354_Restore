@implementation AXBackgroundLoggingQueue

void ___AXBackgroundLoggingQueue_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_BACKGROUND, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("_AXBackgroundLoggingQueue", attr);
  v2 = (void *)_AXBackgroundLoggingQueue__queue;
  _AXBackgroundLoggingQueue__queue = (uint64_t)v1;

}

@end
