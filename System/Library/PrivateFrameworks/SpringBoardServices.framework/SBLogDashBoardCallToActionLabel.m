@implementation SBLogDashBoardCallToActionLabel

void __SBLogDashBoardCallToActionLabel_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "DashBoardCallToActionLabel");
  v1 = (void *)SBLogDashBoardCallToActionLabel___logObj;
  SBLogDashBoardCallToActionLabel___logObj = (uint64_t)v0;

}

@end
