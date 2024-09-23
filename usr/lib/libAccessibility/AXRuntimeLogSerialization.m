@implementation AXRuntimeLogSerialization

void __AXRuntimeLogSerialization_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXRuntimeSerialization");
  v1 = (void *)AXRuntimeLogSerialization___logObj;
  AXRuntimeLogSerialization___logObj = (uint64_t)v0;

}

@end
