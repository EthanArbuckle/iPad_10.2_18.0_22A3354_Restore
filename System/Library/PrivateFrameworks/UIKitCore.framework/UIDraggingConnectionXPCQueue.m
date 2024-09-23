@implementation UIDraggingConnectionXPCQueue

void ___UIDraggingConnectionXPCQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.UIKit.dragQueue", v2);
  v1 = (void *)qword_1ECD77508;
  qword_1ECD77508 = (uint64_t)v0;

}

@end
