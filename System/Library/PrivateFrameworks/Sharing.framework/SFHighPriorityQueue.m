@implementation SFHighPriorityQueue

void __SFHighPriorityQueue_block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;
  pthread_attr_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  memset(&v4, 0, sizeof(v4));
  pthread_attr_init(&v4);
  pthread_attr_set_qos_class_np(&v4, QOS_CLASS_USER_INITIATED, 0);
  v0 = dispatch_pthread_root_queue_create();
  pthread_attr_destroy(&v4);
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create_with_target_V2("com.apple.sharing.HighPriority", v1, v0);
  v3 = (void *)SFHighPriorityQueue_sQueue;
  SFHighPriorityQueue_sQueue = (uint64_t)v2;

}

@end
