@implementation SBLogLockScreenMesaHomeButtonPasscodeRecognizer

void __SBLogLockScreenMesaHomeButtonPasscodeRecognizer_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBBiometricLoggingSubsystem, "HomeButtonPasscodeRecognizer");
  v1 = (void *)SBLogLockScreenMesaHomeButtonPasscodeRecognizer___logObj;
  SBLogLockScreenMesaHomeButtonPasscodeRecognizer___logObj = (uint64_t)v0;

}

@end
