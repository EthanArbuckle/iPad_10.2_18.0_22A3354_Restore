@implementation SBLogDashBoardScrollGestures

void __SBLogDashBoardScrollGestures_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "DashBoardScrollGestures");
  v1 = (void *)SBLogDashBoardScrollGestures___logObj;
  SBLogDashBoardScrollGestures___logObj = (uint64_t)v0;

}

@end
