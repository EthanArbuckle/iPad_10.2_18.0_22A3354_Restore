@implementation WTIATextAssistantLog

void __WTIATextAssistantLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.InputAnalytics", "TextAssistant");
  v1 = (void *)WTIATextAssistantLog___instance;
  WTIATextAssistantLog___instance = (uint64_t)v0;

}

@end
