@implementation SBLogLockScreenMesaHomeButtonSuppressAfterUnlockRecognizer

void __SBLogLockScreenMesaHomeButtonSuppressAfterUnlockRecognizer_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBBiometricLoggingSubsystem, "HomeButtonSuppressAfterUnlockRecognizer");
  v1 = (void *)SBLogLockScreenMesaHomeButtonSuppressAfterUnlockRecognizer___logObj;
  SBLogLockScreenMesaHomeButtonSuppressAfterUnlockRecognizer___logObj = (uint64_t)v0;

}

@end
