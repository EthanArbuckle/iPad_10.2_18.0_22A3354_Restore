@implementation SBLogButtonsCamera

void __SBLogButtonsCamera_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBButtonLoggingSubsystem, "Camera");
  v1 = (void *)SBLogButtonsCamera___logObj;
  SBLogButtonsCamera___logObj = (uint64_t)v0;

}

@end
