@implementation AppIntentsQueue

void ___AppIntentsQueue_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("PXPhotosContentController", attr);
  v2 = (void *)_AppIntentsQueue_serialQueue;
  _AppIntentsQueue_serialQueue = (uint64_t)v1;

}

void ___AppIntentsQueue_block_invoke_77898()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("PXCuratedLibraryUIViewController", attr);
  v2 = (void *)_AppIntentsQueue_serialQueue_77897;
  _AppIntentsQueue_serialQueue_77897 = (uint64_t)v1;

}

@end
