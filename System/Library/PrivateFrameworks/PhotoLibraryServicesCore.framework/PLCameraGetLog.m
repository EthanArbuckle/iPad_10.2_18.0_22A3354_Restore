@implementation PLCameraGetLog

void __PLCameraGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.camera", "Camera");
  v1 = (void *)PLCameraGetLog_log;
  PLCameraGetLog_log = (uint64_t)v0;

}

@end
