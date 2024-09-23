@implementation SBLogDisplayAssertions

void __SBLogDisplayAssertions_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "DisplayAssertions");
  v1 = (void *)SBLogDisplayAssertions___logObj;
  SBLogDisplayAssertions___logObj = (uint64_t)v0;

}

@end
