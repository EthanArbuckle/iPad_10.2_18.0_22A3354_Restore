@implementation PLCameraTaskConstraintsGetLog

void __PLCameraTaskConstraintsGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D710F8], "CameraTaskConstraints");
  v1 = (void *)PLCameraTaskConstraintsGetLog_log;
  PLCameraTaskConstraintsGetLog_log = (uint64_t)v0;

}

@end
