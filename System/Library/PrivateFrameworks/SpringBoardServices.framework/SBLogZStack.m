@implementation SBLogZStack

void __SBLogZStack_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "ZStack");
  v1 = (void *)SBLogZStack___logObj;
  SBLogZStack___logObj = (uint64_t)v0;

}

@end
