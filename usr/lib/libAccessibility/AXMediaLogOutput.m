@implementation AXMediaLogOutput

void __AXMediaLogOutput_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXMediaOutput");
  v1 = (void *)AXMediaLogOutput___logObj;
  AXMediaLogOutput___logObj = (uint64_t)v0;

}

@end
