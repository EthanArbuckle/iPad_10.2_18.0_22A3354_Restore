@implementation REMDispatchQueue

+ (id)storeQueue
{
  if (storeQueue_onceToken != -1)
    dispatch_once(&storeQueue_onceToken, &__block_literal_global_37);
  return (id)storeQueue___sQueue;
}

void __30__REMDispatchQueue_storeQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_initially_inactive(v0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.reminderkit.store", attr);
  v2 = (void *)storeQueue___sQueue;
  storeQueue___sQueue = (uint64_t)v1;

  dispatch_set_qos_class_fallback();
  dispatch_activate((dispatch_object_t)storeQueue___sQueue);

}

@end
