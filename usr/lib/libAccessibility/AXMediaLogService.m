@implementation AXMediaLogService

void __AXMediaLogService_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXMediaService");
  v1 = (void *)AXMediaLogService___logObj;
  AXMediaLogService___logObj = (uint64_t)v0;

}

@end
