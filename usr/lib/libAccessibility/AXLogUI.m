@implementation AXLogUI

void __AXLogUI_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXUI");
  v1 = (void *)AXLogUI___logObj;
  AXLogUI___logObj = (uint64_t)v0;

}

@end
