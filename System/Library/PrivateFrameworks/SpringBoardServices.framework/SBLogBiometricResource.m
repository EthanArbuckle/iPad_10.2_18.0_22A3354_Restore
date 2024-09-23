@implementation SBLogBiometricResource

void __SBLogBiometricResource_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBBiometricLoggingSubsystem, "Resource");
  v1 = (void *)SBLogBiometricResource___logObj;
  SBLogBiometricResource___logObj = (uint64_t)v0;

}

@end
