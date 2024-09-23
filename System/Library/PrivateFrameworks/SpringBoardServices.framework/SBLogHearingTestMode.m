@implementation SBLogHearingTestMode

void __SBLogHearingTestMode_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "HearingTestMode");
  v1 = (void *)SBLogHearingTestMode___logObj;
  SBLogHearingTestMode___logObj = (uint64_t)v0;

}

@end
