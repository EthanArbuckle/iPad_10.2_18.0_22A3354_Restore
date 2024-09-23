@implementation RESharedSerialDispatchQueue

void __RESharedSerialDispatchQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.relevanceengine.shared.utility.dispatch-queue", v2);
  v1 = (void *)RESharedSerialDispatchQueue_queue;
  RESharedSerialDispatchQueue_queue = (uint64_t)v0;

}

@end
