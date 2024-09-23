@implementation AXLogVisualAlerts

void __AXLogVisualAlerts_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXVisualAlerts");
  v1 = (void *)AXLogVisualAlerts___logObj;
  AXLogVisualAlerts___logObj = (uint64_t)v0;

}

@end
