@implementation SSBOSLogXPC

void __SSBOSLogXPC_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Safari.SafeBrowsing", "XPC");
  v1 = (void *)SSBOSLogXPC_log;
  SSBOSLogXPC_log = (uint64_t)v0;

}

@end
