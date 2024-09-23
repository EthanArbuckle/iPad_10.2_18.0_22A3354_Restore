@implementation WLKNetworkingLogObject

void __WLKNetworkingLogObject_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WatchListKit", "Networking");
  v1 = (void *)WLKNetworkingLogObject_logger;
  WLKNetworkingLogObject_logger = (uint64_t)v0;

}

@end
