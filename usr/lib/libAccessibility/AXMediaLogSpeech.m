@implementation AXMediaLogSpeech

void __AXMediaLogSpeech_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXMediaSpeech");
  v1 = (void *)AXMediaLogSpeech___logObj;
  AXMediaLogSpeech___logObj = (uint64_t)v0;

}

@end
