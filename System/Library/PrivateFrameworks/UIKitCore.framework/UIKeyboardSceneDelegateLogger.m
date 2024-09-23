@implementation UIKeyboardSceneDelegateLogger

void ___UIKeyboardSceneDelegateLogger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.UIKit", "KeyboardSceneDelegate");
  v1 = (void *)qword_1ECD7D950;
  qword_1ECD7D950 = (uint64_t)v0;

}

@end
