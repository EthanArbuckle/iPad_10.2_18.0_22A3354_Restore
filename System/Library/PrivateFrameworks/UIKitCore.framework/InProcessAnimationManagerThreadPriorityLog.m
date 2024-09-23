@implementation InProcessAnimationManagerThreadPriorityLog

void ___InProcessAnimationManagerThreadPriorityLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.UIKit", "UIInProcessAnimationLog");
  v1 = (void *)_MergedGlobals_949;
  _MergedGlobals_949 = (uint64_t)v0;

}

@end
