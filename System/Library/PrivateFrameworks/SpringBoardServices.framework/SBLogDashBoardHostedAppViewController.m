@implementation SBLogDashBoardHostedAppViewController

void __SBLogDashBoardHostedAppViewController_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "DashBoardHostedAppViewController");
  v1 = (void *)SBLogDashBoardHostedAppViewController___logObj;
  SBLogDashBoardHostedAppViewController___logObj = (uint64_t)v0;

}

@end
