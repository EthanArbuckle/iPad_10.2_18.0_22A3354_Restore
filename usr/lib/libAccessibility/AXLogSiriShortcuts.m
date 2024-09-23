@implementation AXLogSiriShortcuts

void __AXLogSiriShortcuts_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXSiriShortcuts");
  v1 = (void *)AXLogSiriShortcuts___logObj;
  AXLogSiriShortcuts___logObj = (uint64_t)v0;

}

@end
