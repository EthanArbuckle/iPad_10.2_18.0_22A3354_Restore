@implementation AXRuntimeLogCommon

void __AXRuntimeLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXRuntimeCommon");
  v1 = (void *)AXRuntimeLogCommon___logObj;
  AXRuntimeLogCommon___logObj = (uint64_t)v0;

}

@end
