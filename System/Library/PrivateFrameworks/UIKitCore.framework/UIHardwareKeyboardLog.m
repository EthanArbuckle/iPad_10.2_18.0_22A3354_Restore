@implementation UIHardwareKeyboardLog

void ___UIHardwareKeyboardLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.UIKit", "HardwareKeyboard");
  v1 = (void *)qword_1ECD7C7D8;
  qword_1ECD7C7D8 = (uint64_t)v0;

}

@end
