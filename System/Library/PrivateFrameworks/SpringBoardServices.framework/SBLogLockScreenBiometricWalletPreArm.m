@implementation SBLogLockScreenBiometricWalletPreArm

void __SBLogLockScreenBiometricWalletPreArm_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBBiometricLoggingSubsystem, "WalletPreArm");
  v1 = (void *)SBLogLockScreenBiometricWalletPreArm___logObj;
  SBLogLockScreenBiometricWalletPreArm___logObj = (uint64_t)v0;

}

@end
