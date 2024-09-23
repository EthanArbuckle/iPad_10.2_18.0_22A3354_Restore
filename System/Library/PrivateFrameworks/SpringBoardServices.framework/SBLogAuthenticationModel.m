@implementation SBLogAuthenticationModel

void __SBLogAuthenticationModel_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBAuthLoggingSubsystem, "Model");
  v1 = (void *)SBLogAuthenticationModel___logObj;
  SBLogAuthenticationModel___logObj = (uint64_t)v0;

}

@end
