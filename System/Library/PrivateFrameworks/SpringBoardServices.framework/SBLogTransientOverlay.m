@implementation SBLogTransientOverlay

void __SBLogTransientOverlay_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "TransientOverlay");
  v1 = (void *)SBLogTransientOverlay___logObj;
  SBLogTransientOverlay___logObj = (uint64_t)v0;

}

@end
