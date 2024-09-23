@implementation SVXDispatchRootQueueGetHighPriority

void __SVXDispatchRootQueueGetHighPriority_block_invoke()
{
  NSObject *inactive;
  void *v1;

  inactive = dispatch_workloop_create_inactive("com.apple.SiriVOXService.root.high-priority");
  dispatch_workloop_set_scheduler_priority();
  dispatch_activate(inactive);
  v1 = (void *)SVXDispatchRootQueueGetHighPriority_queue;
  SVXDispatchRootQueueGetHighPriority_queue = (uint64_t)inactive;

}

@end
