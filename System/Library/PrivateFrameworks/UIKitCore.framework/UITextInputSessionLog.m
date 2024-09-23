@implementation UITextInputSessionLog

void __UITextInputSessionLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.inputAnalytics", "UITextInputSession");
  v1 = (void *)UITextInputSessionLog___instance;
  UITextInputSessionLog___instance = (uint64_t)v0;

}

@end
