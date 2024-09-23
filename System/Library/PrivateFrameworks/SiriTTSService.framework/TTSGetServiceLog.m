@implementation TTSGetServiceLog

void __TTSGetServiceLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.siri.tts", "service");
  v1 = (void *)TTSGetServiceLog_log;
  TTSGetServiceLog_log = (uint64_t)v0;

}

@end
