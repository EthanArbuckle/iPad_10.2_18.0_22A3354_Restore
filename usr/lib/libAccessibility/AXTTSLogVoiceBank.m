@implementation AXTTSLogVoiceBank

void __AXTTSLogVoiceBank_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "TTSVB");
  v1 = (void *)AXTTSLogVoiceBank___logObj;
  AXTTSLogVoiceBank___logObj = (uint64_t)v0;

}

@end
