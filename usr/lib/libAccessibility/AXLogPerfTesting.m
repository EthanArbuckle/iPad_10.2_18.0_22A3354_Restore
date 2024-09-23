@implementation AXLogPerfTesting

void __AXLogPerfTesting_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXPerfTesting");
  v1 = (void *)AXLogPerfTesting___logObj;
  AXLogPerfTesting___logObj = (uint64_t)v0;

}

@end
