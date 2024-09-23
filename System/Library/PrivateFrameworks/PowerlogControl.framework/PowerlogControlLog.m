@implementation PowerlogControlLog

void __PowerlogControlLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "control");
  v1 = (void *)PowerlogControlLog___logObj;
  PowerlogControlLog___logObj = (uint64_t)v0;

}

@end
