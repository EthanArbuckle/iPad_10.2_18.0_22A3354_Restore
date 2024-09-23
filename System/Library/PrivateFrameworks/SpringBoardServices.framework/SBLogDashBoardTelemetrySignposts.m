@implementation SBLogDashBoardTelemetrySignposts

void __SBLogDashBoardTelemetrySignposts_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "DashBoardTelemetrySignposts");
  v1 = (void *)SBLogDashBoardTelemetrySignposts___logObj;
  SBLogDashBoardTelemetrySignposts___logObj = (uint64_t)v0;

}

@end
