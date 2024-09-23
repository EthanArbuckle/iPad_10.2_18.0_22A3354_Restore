@implementation SBLogPrototypeController

void __SBLogPrototypeController_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "PrototypeController");
  v1 = (void *)SBLogPrototypeController___logObj;
  SBLogPrototypeController___logObj = (uint64_t)v0;

}

@end
