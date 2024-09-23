@implementation SBLogDisplayControlling

void __SBLogDisplayControlling_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "DisplayControlling");
  v1 = (void *)SBLogDisplayControlling___logObj;
  SBLogDisplayControlling___logObj = (uint64_t)v0;

}

@end
