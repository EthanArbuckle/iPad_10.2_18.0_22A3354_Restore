@implementation SBLogDashBoard

void __SBLogDashBoard_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "DashBoard");
  v1 = (void *)SBLogDashBoard___logObj;
  SBLogDashBoard___logObj = (uint64_t)v0;

}

@end
