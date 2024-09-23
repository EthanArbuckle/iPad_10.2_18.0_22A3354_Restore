@implementation XBLogCapture

void __XBLogCapture_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SplashBoard", "Capture");
  v1 = (void *)XBLogCapture___logObj;
  XBLogCapture___logObj = (uint64_t)v0;

}

@end
