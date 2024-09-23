@implementation SCRCLogVoiceOver

void __SCRCLogVoiceOver_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.accessibility", "VoiceOver");
  v1 = (void *)SCRCLogVoiceOver_Log;
  SCRCLogVoiceOver_Log = (uint64_t)v0;

}

@end
