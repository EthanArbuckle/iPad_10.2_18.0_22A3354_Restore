@implementation SLFrameworkLogHandle

void __SLFrameworkLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SocialLayerFramework", "General");
  v1 = (void *)SLFrameworkLogHandle_osLog;
  SLFrameworkLogHandle_osLog = (uint64_t)v0;

}

@end
