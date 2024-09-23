@implementation PLLogCoalition

void __PLLogCoalition_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "coalition");
  v1 = (void *)PLLogCoalition___logObj;
  PLLogCoalition___logObj = (uint64_t)v0;

}

@end
