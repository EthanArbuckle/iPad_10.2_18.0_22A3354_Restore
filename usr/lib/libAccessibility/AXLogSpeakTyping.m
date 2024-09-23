@implementation AXLogSpeakTyping

void __AXLogSpeakTyping_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXSpeakTyping");
  v1 = (void *)AXLogSpeakTyping___logObj;
  AXLogSpeakTyping___logObj = (uint64_t)v0;

}

@end
