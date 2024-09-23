@implementation AXLogAssetLoader

void __AXLogAssetLoader_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXAssetLoader");
  v1 = (void *)AXLogAssetLoader___logObj;
  AXLogAssetLoader___logObj = (uint64_t)v0;

}

@end
