@implementation SYDGetAnalyticsLog

void __SYDGetAnalyticsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.kvs", "Analytics");
  v1 = (void *)SYDGetAnalyticsLog_log;
  SYDGetAnalyticsLog_log = (uint64_t)v0;

}

@end
