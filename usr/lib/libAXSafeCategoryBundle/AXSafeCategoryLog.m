@implementation AXSafeCategoryLog

void ___AXSafeCategoryLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXValidations");
  v1 = (void *)_AXSafeCategoryLog__LogObject;
  _AXSafeCategoryLog__LogObject = (uint64_t)v0;

}

@end
