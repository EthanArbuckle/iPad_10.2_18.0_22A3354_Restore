@implementation SBLogHardwareButtonService

void __SBLogHardwareButtonService_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "HardwareButtonService");
  v1 = (void *)SBLogHardwareButtonService___logObj;
  SBLogHardwareButtonService___logObj = (uint64_t)v0;

}

@end
