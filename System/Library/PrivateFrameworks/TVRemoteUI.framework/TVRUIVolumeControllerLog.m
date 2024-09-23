@implementation TVRUIVolumeControllerLog

void ___TVRUIVolumeControllerLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TVRemoteUI", "VolumeController");
  v1 = (void *)_TVRUIVolumeControllerLog_log;
  _TVRUIVolumeControllerLog_log = (uint64_t)v0;

}

@end
