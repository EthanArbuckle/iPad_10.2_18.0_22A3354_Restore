@implementation UIScenePresentationLog

void __UIScenePresentationLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FrontBoard", "ScenePresentation");
  v1 = (void *)UIScenePresentationLog___instance;
  UIScenePresentationLog___instance = (uint64_t)v0;

}

@end
