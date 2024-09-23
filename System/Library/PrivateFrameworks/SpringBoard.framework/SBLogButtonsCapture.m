@implementation SBLogButtonsCapture

void __SBLogButtonsCapture_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBButtonLoggingSubsystem, "Capture");
  v1 = (void *)SBLogButtonsCapture___logObj;
  SBLogButtonsCapture___logObj = (uint64_t)v0;

}

@end
