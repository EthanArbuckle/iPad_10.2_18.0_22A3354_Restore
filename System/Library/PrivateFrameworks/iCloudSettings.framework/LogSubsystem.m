@implementation LogSubsystem

void __LogSubsystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iCloudSettings", "core");
  v1 = (void *)LogSubsystem_log;
  LogSubsystem_log = (uint64_t)v0;

}

@end
