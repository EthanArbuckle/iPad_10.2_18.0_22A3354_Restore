@implementation AXLogUnitTesting

void __AXLogUnitTesting_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXUnitTesting");
  v1 = (void *)AXLogUnitTesting___logObj;
  AXLogUnitTesting___logObj = (uint64_t)v0;

}

@end
