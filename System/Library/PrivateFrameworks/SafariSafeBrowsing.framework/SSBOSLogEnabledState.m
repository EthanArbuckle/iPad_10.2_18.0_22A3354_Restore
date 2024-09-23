@implementation SSBOSLogEnabledState

void __SSBOSLogEnabledState_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Safari.SafeBrowsing", "EnabledState");
  v1 = (void *)SSBOSLogEnabledState_log;
  SSBOSLogEnabledState_log = (uint64_t)v0;

}

@end
