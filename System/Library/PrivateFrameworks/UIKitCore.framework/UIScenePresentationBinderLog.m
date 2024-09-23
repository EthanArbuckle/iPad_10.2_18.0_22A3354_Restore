@implementation UIScenePresentationBinderLog

void __UIScenePresentationBinderLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FrontBoard", "ScenePresentationBinder");
  v1 = (void *)UIScenePresentationBinderLog___instance;
  UIScenePresentationBinderLog___instance = (uint64_t)v0;

}

@end
