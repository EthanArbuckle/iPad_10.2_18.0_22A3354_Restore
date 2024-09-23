@implementation AXLogBluetooth

void __AXLogBluetooth_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXBluetooth");
  v1 = (void *)AXLogBluetooth___logObj;
  AXLogBluetooth___logObj = (uint64_t)v0;

}

@end
