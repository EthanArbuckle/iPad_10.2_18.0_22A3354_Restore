@implementation WorldClockDebugLog

void __WorldClockDebugLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SpotlightServices", "WorldClock");
  v1 = (void *)WorldClockDebugLog_log;
  WorldClockDebugLog_log = (uint64_t)v0;

}

@end
