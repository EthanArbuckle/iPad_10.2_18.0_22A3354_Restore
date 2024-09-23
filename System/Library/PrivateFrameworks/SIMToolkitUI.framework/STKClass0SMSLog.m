@implementation STKClass0SMSLog

void __STKClass0SMSLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.telephony.class0sms", "default");
  v1 = (void *)STKClass0SMSLog___log;
  STKClass0SMSLog___log = (uint64_t)v0;

}

@end
