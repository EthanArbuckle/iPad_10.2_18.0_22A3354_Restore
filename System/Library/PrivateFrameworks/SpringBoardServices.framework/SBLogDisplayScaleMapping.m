@implementation SBLogDisplayScaleMapping

void __SBLogDisplayScaleMapping_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "DisplayScaleMapping");
  v1 = (void *)SBLogDisplayScaleMapping___logObj;
  SBLogDisplayScaleMapping___logObj = (uint64_t)v0;

}

@end
