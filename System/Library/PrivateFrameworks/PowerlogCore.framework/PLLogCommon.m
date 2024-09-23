@implementation PLLogCommon

void __PLLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", ");
  v1 = (void *)PLLogCommon___logObj;
  PLLogCommon___logObj = (uint64_t)v0;

}

@end
