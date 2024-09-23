@implementation XBLogFileManifest

void __XBLogFileManifest_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SplashBoard", "FileManifest");
  v1 = (void *)XBLogFileManifest___logObj;
  XBLogFileManifest___logObj = (uint64_t)v0;

}

@end
