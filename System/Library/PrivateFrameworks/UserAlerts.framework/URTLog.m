@implementation URTLog

void __URTLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.UserAlerts", "UserAlerts");
  v1 = (void *)URTLog_logger;
  URTLog_logger = (uint64_t)v0;

}

@end
