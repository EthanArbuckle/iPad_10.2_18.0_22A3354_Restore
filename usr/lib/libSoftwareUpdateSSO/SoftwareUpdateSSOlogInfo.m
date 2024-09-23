@implementation SoftwareUpdateSSOlogInfo

void __SoftwareUpdateSSOlogInfo_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SoftwareUpdateSSO", "Notice");
  v1 = (void *)SoftwareUpdateSSOlogInfo_infoLog;
  SoftwareUpdateSSOlogInfo_infoLog = (uint64_t)v0;

}

@end
