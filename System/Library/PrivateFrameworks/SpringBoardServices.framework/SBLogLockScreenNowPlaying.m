@implementation SBLogLockScreenNowPlaying

void __SBLogLockScreenNowPlaying_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "LockScreenNowPlaying");
  v1 = (void *)SBLogLockScreenNowPlaying___logObj;
  SBLogLockScreenNowPlaying___logObj = (uint64_t)v0;

}

@end
