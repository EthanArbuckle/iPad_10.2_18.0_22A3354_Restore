@implementation AXTTSLogRange

void __AXTTSLogRange_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXTTSRange");
  v1 = (void *)AXTTSLogRange___logObj;
  AXTTSLogRange___logObj = (uint64_t)v0;

}

@end
