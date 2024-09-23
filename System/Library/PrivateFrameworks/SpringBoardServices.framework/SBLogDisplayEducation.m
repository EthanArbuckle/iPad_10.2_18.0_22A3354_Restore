@implementation SBLogDisplayEducation

void __SBLogDisplayEducation_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "DisplayEducation");
  v1 = (void *)SBLogDisplayEducation___logObj;
  SBLogDisplayEducation___logObj = (uint64_t)v0;

}

@end
