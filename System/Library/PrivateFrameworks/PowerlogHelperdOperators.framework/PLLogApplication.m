@implementation PLLogApplication

void __PLLogApplication_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "application");
  v1 = (void *)PLLogApplication___logObj;
  PLLogApplication___logObj = (uint64_t)v0;

}

@end
