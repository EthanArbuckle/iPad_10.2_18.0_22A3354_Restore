@implementation CAReportingUtilityGetReportingServerQueue

void __CAReportingUtilityGetReportingServerQueue_block_invoke()
{
  const char *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v0 = (const char *)objc_msgSend(CFSTR("com.apple.coreaudio.reporting.server"), "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INTERACTIVE, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create(v0, v1);
  v3 = (void *)CAReportingUtilityGetReportingServerQueue::gReportingServerQueue;
  CAReportingUtilityGetReportingServerQueue::gReportingServerQueue = (uint64_t)v2;

}

@end
