@implementation AXLogBrokenHomeButton

void __AXLogBrokenHomeButton_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXBrokenHomeButton");
  v1 = (void *)AXLogBrokenHomeButton___logObj;
  AXLogBrokenHomeButton___logObj = (uint64_t)v0;

}

@end
