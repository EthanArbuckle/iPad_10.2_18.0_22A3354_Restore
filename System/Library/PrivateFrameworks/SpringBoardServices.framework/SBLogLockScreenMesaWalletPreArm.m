@implementation SBLogLockScreenMesaWalletPreArm

void __SBLogLockScreenMesaWalletPreArm_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBBiometricLoggingSubsystem, "WalletPreArm");
  v1 = (void *)SBLogLockScreenMesaWalletPreArm___logObj;
  SBLogLockScreenMesaWalletPreArm___logObj = (uint64_t)v0;

}

@end
