@implementation WTIAWritingToolsLog

void __WTIAWritingToolsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.inputAnalytics.writingTools", "IAWritingTools");
  v1 = (void *)WTIAWritingToolsLog___instance;
  WTIAWritingToolsLog___instance = (uint64_t)v0;

}

@end
