@implementation SSBOSLogPlatform

void __SSBOSLogPlatform_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Safari.SafeBrowsing", "Platform");
  v1 = (void *)SSBOSLogPlatform_log;
  SSBOSLogPlatform_log = (uint64_t)v0;

}

@end
