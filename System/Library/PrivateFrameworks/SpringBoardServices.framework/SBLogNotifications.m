@implementation SBLogNotifications

void __SBLogNotifications_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "Notifications");
  v1 = (void *)SBLogNotifications___logObj;
  SBLogNotifications___logObj = (uint64_t)v0;

}

@end
