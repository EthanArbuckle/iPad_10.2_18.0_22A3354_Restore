@implementation AXLogAirPodSettings

void __AXLogAirPodSettings_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXAirPodSettings");
  v1 = (void *)AXLogAirPodSettings___logObj;
  AXLogAirPodSettings___logObj = (uint64_t)v0;

}

@end
