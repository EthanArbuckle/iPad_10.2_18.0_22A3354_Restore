@implementation PLLogPowerlogHelperdLifecycleManager

void __PLLogPowerlogHelperdLifecycleManager_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "powerlogHelperdLifecycleManager");
  v1 = (void *)PLLogPowerlogHelperdLifecycleManager_log;
  PLLogPowerlogHelperdLifecycleManager_log = (uint64_t)v0;

}

@end
