@implementation PXMediaProvider

void __43__PXMediaProvider_Preheating__preheatQueue__block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;
  void *v4;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_initially_inactive(v1);
  attr = objc_claimAutoreleasedReturnValue();

  v2 = dispatch_queue_create("com.apple.photos.mediaProvider.shared-preheat-queue", attr);
  v3 = (void *)preheatQueue_sharedPreheatQueue;
  preheatQueue_sharedPreheatQueue = (uint64_t)v2;

  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheduleMainQueueTask:", &__block_literal_global_2_186066);

}

void __43__PXMediaProvider_Preheating__preheatQueue__block_invoke_2()
{
  dispatch_activate((dispatch_object_t)preheatQueue_sharedPreheatQueue);
}

@end
