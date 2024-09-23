@implementation SBLogLockScreenBiometricCoordinator

void __SBLogLockScreenBiometricCoordinator_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBBiometricLoggingSubsystem, "Coordinator");
  v1 = (void *)SBLogLockScreenBiometricCoordinator___logObj;
  SBLogLockScreenBiometricCoordinator___logObj = (uint64_t)v0;

}

@end
