@implementation WLKSystemLogObject

void __WLKSystemLogObject_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WatchListKit", "System");
  v1 = (void *)WLKSystemLogObject_logger;
  WLKSystemLogObject_logger = (uint64_t)v0;

}

@end
