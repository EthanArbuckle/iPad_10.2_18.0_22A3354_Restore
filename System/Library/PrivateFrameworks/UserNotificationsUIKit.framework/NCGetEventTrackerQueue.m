@implementation NCGetEventTrackerQueue

void __NCGetEventTrackerQueue_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, (dispatch_qos_class_t)0xFFFF8000, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.UserNotificationsUIKit.MetricsWorkQueue", attr);
  v2 = (void *)NCGetEventTrackerQueue_metricsQueue;
  NCGetEventTrackerQueue_metricsQueue = (uint64_t)v1;

}

@end
