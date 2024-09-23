@implementation SKGetOSLog

void __SKGetOSLog_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create("com.apple.storagekit", "general");
  v1 = (void *)osLogObject;
  osLogObject = (uint64_t)v0;

  v2 = os_log_create("com.apple.storagekit", "storagekit-install");
  v3 = (void *)osLogInstallObject;
  osLogInstallObject = (uint64_t)v2;

}

@end
