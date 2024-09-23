@implementation PPSStoreLog

void __PPSStoreLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PerfPowerServicesMetadata", "MetadataStore");
  v1 = (void *)PPSStoreLog___logObj;
  PPSStoreLog___logObj = (uint64_t)v0;

}

@end
