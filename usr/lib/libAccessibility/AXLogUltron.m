@implementation AXLogUltron

void __AXLogUltron_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXUltron");
  v1 = (void *)AXLogUltron___logObj;
  AXLogUltron___logObj = (uint64_t)v0;

}

@end
