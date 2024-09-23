@implementation AXLogLookingGlass

void __AXLogLookingGlass_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXLookingGlass");
  v1 = (void *)AXLogLookingGlass___logObj;
  AXLogLookingGlass___logObj = (uint64_t)v0;

}

@end
