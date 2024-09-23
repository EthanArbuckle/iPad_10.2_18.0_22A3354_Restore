@implementation AXSupportLogCommon

void __AXSupportLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXSupportCommon");
  v1 = (void *)AXSupportLogCommon___logObj;
  AXSupportLogCommon___logObj = (uint64_t)v0;

}

@end
