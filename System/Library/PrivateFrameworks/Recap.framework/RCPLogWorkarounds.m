@implementation RCPLogWorkarounds

void __RCPLogWorkarounds_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.recap", "Workarounds");
  v1 = (void *)RCPLogWorkarounds___logObj;
  RCPLogWorkarounds___logObj = (uint64_t)v0;

}

@end
