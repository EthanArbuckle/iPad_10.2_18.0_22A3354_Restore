@implementation SBLogCFUserNotifications

void __SBLogCFUserNotifications_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "CFUserNotifications");
  v1 = (void *)SBLogCFUserNotifications___logObj;
  SBLogCFUserNotifications___logObj = (uint64_t)v0;

}

@end
