@implementation RBTimeProvider

- (void)executeAfter:(double)a3 onQueue:(id)a4 block:(id)a5
{
  int64_t v6;
  id v7;
  dispatch_time_t v8;
  NSObject *queue;

  v6 = (uint64_t)(a3 * 1000000000.0);
  v7 = a5;
  queue = a4;
  v8 = dispatch_time(0, v6);
  dispatch_after(v8, queue, v7);

}

- (id)executeWithCancellingAfter:(double)a3 onQueue:(id)a4 block:(id)a5
{
  int64_t v6;
  id v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  void *v11;

  v6 = (uint64_t)(a3 * 1000000000.0);
  v7 = a5;
  v8 = a4;
  v9 = dispatch_time(0, v6);
  v10 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v8);

  dispatch_set_context(v10, v10);
  dispatch_source_set_timer(v10, v9, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_source_set_event_handler(v10, v7);

  dispatch_activate(v10);
  +[RBTimeProviderEvent eventWithSource:](RBTimeProviderEvent, "eventWithSource:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  return (id)sharedInstance_result;
}

void __32__RBTimeProvider_sharedInstance__block_invoke()
{
  RBTimeProvider *v0;
  void *v1;

  v0 = objc_alloc_init(RBTimeProvider);
  v1 = (void *)sharedInstance_result;
  sharedInstance_result = (uint64_t)v0;

}

- (double)startTimeForProcess:(id)a3
{
  double result;

  objc_msgSend(a3, "processStartTime");
  return result;
}

@end
