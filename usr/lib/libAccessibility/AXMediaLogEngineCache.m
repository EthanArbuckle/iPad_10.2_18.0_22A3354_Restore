@implementation AXMediaLogEngineCache

void __AXMediaLogEngineCache_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXMediaEngineCache");
  v1 = (void *)AXMediaLogEngineCache___logObj;
  AXMediaLogEngineCache___logObj = (uint64_t)v0;

}

@end
