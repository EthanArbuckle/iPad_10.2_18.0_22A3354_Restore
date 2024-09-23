@implementation UIKeyboardLayoutGuideLogger

void ___UIKeyboardLayoutGuideLogger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.UIKit", "KeyboardLayoutGuide");
  v1 = (void *)_MergedGlobals_3_24;
  _MergedGlobals_3_24 = (uint64_t)v0;

}

@end
