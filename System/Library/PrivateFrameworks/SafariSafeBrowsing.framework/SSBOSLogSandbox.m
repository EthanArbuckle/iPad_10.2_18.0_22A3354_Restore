@implementation SSBOSLogSandbox

void __SSBOSLogSandbox_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Safari.SafeBrowsing", "Sandbox");
  v1 = (void *)SSBOSLogSandbox_log;
  SSBOSLogSandbox_log = (uint64_t)v0;

}

@end
