@implementation WLKAppVisibilityLogObject

void __WLKAppVisibilityLogObject_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WatchListKit", "Visibility");
  v1 = (void *)WLKAppVisibilityLogObject_logger;
  WLKAppVisibilityLogObject_logger = (uint64_t)v0;

}

@end
