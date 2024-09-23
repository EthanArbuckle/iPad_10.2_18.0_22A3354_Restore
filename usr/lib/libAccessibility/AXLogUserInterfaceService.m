@implementation AXLogUserInterfaceService

void __AXLogUserInterfaceService_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXUserInterfaceService");
  v1 = (void *)AXLogUserInterfaceService___logObj;
  AXLogUserInterfaceService___logObj = (uint64_t)v0;

}

@end
