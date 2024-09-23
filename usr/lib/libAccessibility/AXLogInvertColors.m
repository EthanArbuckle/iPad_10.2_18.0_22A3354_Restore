@implementation AXLogInvertColors

void __AXLogInvertColors_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXInvertColors");
  v1 = (void *)AXLogInvertColors___logObj;
  AXLogInvertColors___logObj = (uint64_t)v0;

}

@end
