@implementation SBLogCameraActivation

void __SBLogCameraActivation_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DAB4F8], "CameraActivation");
  v1 = (void *)SBLogCameraActivation___logObj;
  SBLogCameraActivation___logObj = (uint64_t)v0;

}

@end
