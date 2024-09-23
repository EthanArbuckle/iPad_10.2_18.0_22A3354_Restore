@implementation AXLogTemp

void __AXLogTemp_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXTemp");
  v1 = (void *)AXLogTemp___logObj;
  AXLogTemp___logObj = (uint64_t)v0;

}

@end
