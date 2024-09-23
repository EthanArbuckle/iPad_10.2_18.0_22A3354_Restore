@implementation PPSDataStreamLog

void __PPSDataStreamLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "DataStream");
  v1 = (void *)PPSDataStreamLog___logObj;
  PPSDataStreamLog___logObj = (uint64_t)v0;

}

@end
