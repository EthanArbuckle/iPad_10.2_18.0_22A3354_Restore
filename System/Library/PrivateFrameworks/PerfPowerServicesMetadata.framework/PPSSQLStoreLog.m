@implementation PPSSQLStoreLog

void __PPSSQLStoreLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PerfPowerServicesMetadata", "SQLMetadataStore");
  v1 = (void *)PPSSQLStoreLog___logObj;
  PPSSQLStoreLog___logObj = (uint64_t)v0;

}

@end
