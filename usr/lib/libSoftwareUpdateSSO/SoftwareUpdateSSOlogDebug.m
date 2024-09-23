@implementation SoftwareUpdateSSOlogDebug

void __SoftwareUpdateSSOlogDebug_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SoftwareUpdateSSO", "Debug");
  v1 = (void *)SoftwareUpdateSSOlogDebug_infoDebug;
  SoftwareUpdateSSOlogDebug_infoDebug = (uint64_t)v0;

}

@end
