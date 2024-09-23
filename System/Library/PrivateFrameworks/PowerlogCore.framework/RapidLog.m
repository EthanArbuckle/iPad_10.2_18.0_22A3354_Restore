@implementation RapidLog

void __RapidLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "Rapid");
  v1 = (void *)RapidLog__RapidLog;
  RapidLog__RapidLog = (uint64_t)v0;

}

@end
