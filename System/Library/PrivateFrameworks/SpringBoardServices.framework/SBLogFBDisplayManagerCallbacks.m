@implementation SBLogFBDisplayManagerCallbacks

void __SBLogFBDisplayManagerCallbacks_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "FBDisplayManagerCallbacks");
  v1 = (void *)SBLogFBDisplayManagerCallbacks___logObj;
  SBLogFBDisplayManagerCallbacks___logObj = (uint64_t)v0;

}

@end
