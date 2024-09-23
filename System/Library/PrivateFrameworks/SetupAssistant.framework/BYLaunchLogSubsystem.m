@implementation BYLaunchLogSubsystem

void ___BYLaunchLogSubsystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.purplebuddy", "launch");
  v1 = (void *)_BYLaunchLogSubsystem_oslog;
  _BYLaunchLogSubsystem_oslog = (uint64_t)v0;

}

@end
