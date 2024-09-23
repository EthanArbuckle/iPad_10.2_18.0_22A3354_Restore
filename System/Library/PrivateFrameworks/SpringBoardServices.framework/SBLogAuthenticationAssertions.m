@implementation SBLogAuthenticationAssertions

void __SBLogAuthenticationAssertions_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBAuthLoggingSubsystem, "Assertions");
  v1 = (void *)SBLogAuthenticationAssertions___logObj;
  SBLogAuthenticationAssertions___logObj = (uint64_t)v0;

}

@end
