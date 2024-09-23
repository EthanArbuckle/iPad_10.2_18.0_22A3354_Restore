@implementation STKSIMToolkitLog

void __STKSIMToolkitLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.telephony.simtoolkit", "default");
  v1 = (void *)STKSIMToolkitLog___log;
  STKSIMToolkitLog___log = (uint64_t)v0;

}

@end
