@implementation SBLogCommon

void __SBLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "Common");
  v1 = (void *)SBLogCommon___logObj;
  SBLogCommon___logObj = (uint64_t)v0;

}

@end
