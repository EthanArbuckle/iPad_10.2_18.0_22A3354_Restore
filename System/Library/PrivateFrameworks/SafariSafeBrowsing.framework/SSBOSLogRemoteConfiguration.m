@implementation SSBOSLogRemoteConfiguration

void __SSBOSLogRemoteConfiguration_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Safari.SafeBrowsing", "RemoteConfiguration");
  v1 = (void *)SSBOSLogRemoteConfiguration_log;
  SSBOSLogRemoteConfiguration_log = (uint64_t)v0;

}

@end
