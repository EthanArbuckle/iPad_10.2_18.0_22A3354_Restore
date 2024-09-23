@implementation AXLogEventTap

void __AXLogEventTap_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXEventTap");
  v1 = (void *)AXLogEventTap___logObj;
  AXLogEventTap___logObj = (uint64_t)v0;

}

@end
