@implementation SBLogPIP

void __SBLogPIP_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "PIP");
  v1 = (void *)SBLogPIP___logObj;
  SBLogPIP___logObj = (uint64_t)v0;

}

@end
