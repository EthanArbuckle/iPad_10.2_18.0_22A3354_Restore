@implementation PPSCoreStorageLog

void __PPSCoreStorageLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "PPSCoreStorage");
  v1 = (void *)PPSCoreStorageLog___logObj;
  PPSCoreStorageLog___logObj = (uint64_t)v0;

}

@end
