@implementation AXLogBackTap

void __AXLogBackTap_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXBackTap");
  v1 = (void *)AXLogBackTap___logObj;
  AXLogBackTap___logObj = (uint64_t)v0;

}

@end
