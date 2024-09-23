@implementation SLDaemonLogHandle

void __SLDaemonLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SocialLayerDaemon", "General");
  v1 = (void *)SLDaemonLogHandle_osLog;
  SLDaemonLogHandle_osLog = (uint64_t)v0;

}

@end
