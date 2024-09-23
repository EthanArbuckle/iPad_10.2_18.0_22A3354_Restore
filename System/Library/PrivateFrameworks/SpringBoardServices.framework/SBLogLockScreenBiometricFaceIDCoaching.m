@implementation SBLogLockScreenBiometricFaceIDCoaching

void __SBLogLockScreenBiometricFaceIDCoaching_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBBiometricLoggingSubsystem, "FaceIDCoaching");
  v1 = (void *)SBLogLockScreenBiometricFaceIDCoaching___logObj;
  SBLogLockScreenBiometricFaceIDCoaching___logObj = (uint64_t)v0;

}

@end
