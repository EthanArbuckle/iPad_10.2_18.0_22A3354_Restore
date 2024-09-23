@implementation VOTLogSpeech

void __VOTLogSpeech_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "VOTSpeech");
  v1 = (void *)VOTLogSpeech___logObj;
  VOTLogSpeech___logObj = (uint64_t)v0;

}

@end
