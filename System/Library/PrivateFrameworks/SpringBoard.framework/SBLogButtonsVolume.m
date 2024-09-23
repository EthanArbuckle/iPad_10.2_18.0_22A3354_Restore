@implementation SBLogButtonsVolume

void __SBLogButtonsVolume_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBButtonLoggingSubsystem, "Volume");
  v1 = (void *)SBLogButtonsVolume___logObj;
  SBLogButtonsVolume___logObj = (uint64_t)v0;

}

@end
