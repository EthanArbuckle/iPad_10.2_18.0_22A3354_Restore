@implementation STKCommonLog

void __STKCommonLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.telephony.stk", "common");
  v1 = (void *)STKCommonLog___log;
  STKCommonLog___log = (uint64_t)v0;

}

@end
