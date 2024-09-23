@implementation SBLogCameraCaptureRestriction

void __SBLogCameraCaptureRestriction_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "CameraCaptureRestriction");
  v1 = (void *)SBLogCameraCaptureRestriction___logObj;
  SBLogCameraCaptureRestriction___logObj = (uint64_t)v0;

}

@end
