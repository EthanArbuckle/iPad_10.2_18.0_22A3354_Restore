@implementation PLSearchUIParsecAnalyticsGetLog

void __PLSearchUIParsecAnalyticsGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.ui.search", "SearchUIParsecAnalytics");
  v1 = (void *)PLSearchUIParsecAnalyticsGetLog_log;
  PLSearchUIParsecAnalyticsGetLog_log = (uint64_t)v0;

}

@end
