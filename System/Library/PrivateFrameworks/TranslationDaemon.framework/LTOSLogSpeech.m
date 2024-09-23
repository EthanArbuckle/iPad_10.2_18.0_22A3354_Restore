@implementation LTOSLogSpeech

void ___LTOSLogSpeech_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Translation", "Speech");
  v1 = (void *)_LTOSLogSpeech_log;
  _LTOSLogSpeech_log = (uint64_t)v0;

}

@end
