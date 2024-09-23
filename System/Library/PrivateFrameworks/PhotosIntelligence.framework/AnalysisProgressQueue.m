@implementation AnalysisProgressQueue

void ___AnalysisProgressQueue_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x24BDAC9C0], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.photos.libraryProcessingProgress.analysis-progress-fetching", attr);
  v2 = (void *)_AnalysisProgressQueue__serial_queue;
  _AnalysisProgressQueue__serial_queue = (uint64_t)v1;

}

@end
