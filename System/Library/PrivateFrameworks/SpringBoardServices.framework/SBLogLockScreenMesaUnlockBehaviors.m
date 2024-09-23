@implementation SBLogLockScreenMesaUnlockBehaviors

void __SBLogLockScreenMesaUnlockBehaviors_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBBiometricLoggingSubsystem, "UnlockBehaviors");
  v1 = (void *)SBLogLockScreenMesaUnlockBehaviors___logObj;
  SBLogLockScreenMesaUnlockBehaviors___logObj = (uint64_t)v0;

}

@end
