@implementation PPSStorageLog

void __PPSStorageLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PerfPowerServicesMetadata", "MetricSerialization");
  v1 = (void *)PPSStorageLog___logObj;
  PPSStorageLog___logObj = (uint64_t)v0;

}

@end
