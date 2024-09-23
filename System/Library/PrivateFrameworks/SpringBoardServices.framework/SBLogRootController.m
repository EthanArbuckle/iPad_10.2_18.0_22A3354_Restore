@implementation SBLogRootController

void __SBLogRootController_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "RootController");
  v1 = (void *)SBLogRootController___logObj;
  SBLogRootController___logObj = (uint64_t)v0;

}

@end
