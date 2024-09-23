@implementation AXLogInvertColorsTraversal

void __AXLogInvertColorsTraversal_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXInvertColorsTraversal");
  v1 = (void *)AXLogInvertColorsTraversal___logObj;
  AXLogInvertColorsTraversal___logObj = (uint64_t)v0;

}

@end
