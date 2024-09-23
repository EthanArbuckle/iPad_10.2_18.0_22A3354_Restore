@implementation SBLogAuthenticationController

void __SBLogAuthenticationController_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBAuthLoggingSubsystem, "Controller");
  v1 = (void *)SBLogAuthenticationController___logObj;
  SBLogAuthenticationController___logObj = (uint64_t)v0;

}

@end
