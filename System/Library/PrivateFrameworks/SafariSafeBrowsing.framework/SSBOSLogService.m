@implementation SSBOSLogService

void __SSBOSLogService_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Safari.SafeBrowsing", "Service");
  v1 = (void *)SSBOSLogService_log;
  SSBOSLogService_log = (uint64_t)v0;

}

@end
