@implementation SBLogFocusModes

void __SBLogFocusModes_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "FocusModes");
  v1 = (void *)SBLogFocusModes___logObj;
  SBLogFocusModes___logObj = (uint64_t)v0;

}

@end
