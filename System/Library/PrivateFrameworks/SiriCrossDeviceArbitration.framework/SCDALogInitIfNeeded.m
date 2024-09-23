@implementation SCDALogInitIfNeeded

void __SCDALogInitIfNeeded_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create("com.apple.siri", (const char *)SCDALogContext);
  v1 = (void *)SCDALogContextCore;
  SCDALogContextCore = (uint64_t)v0;

  v2 = os_log_create("com.apple.siri", (const char *)SCDALogContext);
  v3 = (void *)SCDALogContextAnalytics;
  SCDALogContextAnalytics = (uint64_t)v2;

}

@end
