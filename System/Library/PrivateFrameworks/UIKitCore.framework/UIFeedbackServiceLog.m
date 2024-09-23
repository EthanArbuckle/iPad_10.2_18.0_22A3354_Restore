@implementation UIFeedbackServiceLog

void __UIFeedbackServiceLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.UIKit", "UIFeedbackService");
  v1 = (void *)UIFeedbackServiceLog___instance;
  UIFeedbackServiceLog___instance = (uint64_t)v0;

}

@end
