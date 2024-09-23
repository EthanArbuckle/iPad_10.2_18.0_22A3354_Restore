@implementation PPSReaderLog

void __PPSReaderLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PerfPowerServicesReader", ");
  v1 = (void *)PPSReaderLog___logObj;
  PPSReaderLog___logObj = (uint64_t)v0;

}

@end
