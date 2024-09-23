@implementation UIKBFeedbackLog

void ___UIKBFeedbackLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.UIKit", "UIKBFeedbackGenerator");
  v1 = (void *)qword_1ECD7D5E0;
  qword_1ECD7D5E0 = (uint64_t)v0;

}

@end
