@implementation SBLogPhoneUnlockWithWatch

void __SBLogPhoneUnlockWithWatch_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "PhoneUnlockWithWatch");
  v1 = (void *)SBLogPhoneUnlockWithWatch___logObj;
  SBLogPhoneUnlockWithWatch___logObj = (uint64_t)v0;

}

@end
