@implementation SBLogSystemUIScene

void __SBLogSystemUIScene_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "SystemUIScene");
  v1 = (void *)SBLogSystemUIScene___logObj;
  SBLogSystemUIScene___logObj = (uint64_t)v0;

}

@end
