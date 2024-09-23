@implementation UIAnimationLog

void ___UIAnimationLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.UIKit", "UIInProcessAnimationLog");
  v1 = (void *)qword_1ECD82460;
  qword_1ECD82460 = (uint64_t)v0;

}

@end
