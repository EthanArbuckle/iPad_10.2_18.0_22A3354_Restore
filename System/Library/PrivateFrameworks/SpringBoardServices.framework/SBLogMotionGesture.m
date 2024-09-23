@implementation SBLogMotionGesture

void __SBLogMotionGesture_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "MotionGesture");
  v1 = (void *)SBLogMotionGesture___logObj;
  SBLogMotionGesture___logObj = (uint64_t)v0;

}

@end
