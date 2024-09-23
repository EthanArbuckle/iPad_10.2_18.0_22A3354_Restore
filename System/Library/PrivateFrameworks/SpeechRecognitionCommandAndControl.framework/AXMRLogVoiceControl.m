@implementation AXMRLogVoiceControl

void __AXMRLogVoiceControl_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXMRVoiceControl");
  v1 = (void *)AXMRLogVoiceControl_sMRLogVoiceControl;
  AXMRLogVoiceControl_sMRLogVoiceControl = (uint64_t)v0;

}

@end
