@implementation PLLogAppDeletion

void __PLLogAppDeletion_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "appDeletion");
  v1 = (void *)PLLogAppDeletion___logObj;
  PLLogAppDeletion___logObj = (uint64_t)v0;

}

@end
