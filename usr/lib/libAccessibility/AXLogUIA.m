@implementation AXLogUIA

void __AXLogUIA_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXUIA");
  v1 = (void *)AXLogUIA___logObj;
  AXLogUIA___logObj = (uint64_t)v0;

}

@end
