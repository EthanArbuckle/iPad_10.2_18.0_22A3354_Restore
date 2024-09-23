@implementation UIKeyShortcutHUDLog

void ___UIKeyShortcutHUDLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.UIKit", "KeyShortcutHUD");
  v1 = (void *)qword_1ECD7EBA8;
  qword_1ECD7EBA8 = (uint64_t)v0;

}

@end
