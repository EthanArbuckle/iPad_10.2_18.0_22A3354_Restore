@implementation SBLogAuthenticationRequests

void __SBLogAuthenticationRequests_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBAuthLoggingSubsystem, "Requests");
  v1 = (void *)SBLogAuthenticationRequests___logObj;
  SBLogAuthenticationRequests___logObj = (uint64_t)v0;

}

@end
