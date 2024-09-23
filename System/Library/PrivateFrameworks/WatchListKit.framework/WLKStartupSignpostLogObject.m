@implementation WLKStartupSignpostLogObject

void __WLKStartupSignpostLogObject_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WatchListKit", "startup");
  v1 = (void *)WLKStartupSignpostLogObject_logger;
  WLKStartupSignpostLogObject_logger = (uint64_t)v0;

}

@end
