@implementation PLLogPower

void __PLLogPower_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "Power");
  v1 = (void *)PLLogPower___logObj;
  PLLogPower___logObj = (uint64_t)v0;

}

@end
