@implementation STBlockingUILog

+ (OS_os_log)log
{
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, &__block_literal_global);
  return (OS_os_log *)(id)log_log;
}

void __22__STBlockingUILog_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ScreenTimeUI", "blockingUI");
  v1 = (void *)log_log;
  log_log = (uint64_t)v0;

}

@end
