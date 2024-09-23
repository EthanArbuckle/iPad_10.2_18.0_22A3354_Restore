@implementation STKUSSDLog

void __STKUSSDLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.telephony.ussd", "default");
  v1 = (void *)STKUSSDLog___log;
  STKUSSDLog___log = (uint64_t)v0;

}

@end
