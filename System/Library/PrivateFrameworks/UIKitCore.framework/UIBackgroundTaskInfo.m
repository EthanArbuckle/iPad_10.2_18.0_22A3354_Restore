@implementation UIBackgroundTaskInfo

void __53___UIBackgroundTaskInfo_backgroundTaskAssertionQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.uikit.backgroundTaskAssertionQueue", 0);
  v1 = (void *)qword_1ECD7DE80;
  qword_1ECD7DE80 = (uint64_t)v0;

}

@end
