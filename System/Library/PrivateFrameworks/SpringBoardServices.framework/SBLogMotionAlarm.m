@implementation SBLogMotionAlarm

void __SBLogMotionAlarm_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "MotionAlarm");
  v1 = (void *)SBLogMotionAlarm___logObj;
  SBLogMotionAlarm___logObj = (uint64_t)v0;

}

@end
