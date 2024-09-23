@implementation SBLogButtonsRinger

void __SBLogButtonsRinger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBButtonLoggingSubsystem, "Ringer");
  v1 = (void *)SBLogButtonsRinger___logObj;
  SBLogButtonsRinger___logObj = (uint64_t)v0;

}

@end
