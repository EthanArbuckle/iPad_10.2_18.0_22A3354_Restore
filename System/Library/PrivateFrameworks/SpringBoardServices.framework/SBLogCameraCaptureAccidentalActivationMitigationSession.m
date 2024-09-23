@implementation SBLogCameraCaptureAccidentalActivationMitigationSession

void __SBLogCameraCaptureAccidentalActivationMitigationSession_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "CameraCaptureAccidentalActivationMitigationSession");
  v1 = (void *)SBLogCameraCaptureAccidentalActivationMitigationSession___logObj;
  SBLogCameraCaptureAccidentalActivationMitigationSession___logObj = (uint64_t)v0;

}

@end
