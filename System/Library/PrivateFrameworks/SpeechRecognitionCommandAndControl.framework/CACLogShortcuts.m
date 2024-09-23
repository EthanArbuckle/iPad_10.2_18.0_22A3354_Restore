@implementation CACLogShortcuts

void __CACLogShortcuts_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "SiriShortcuts");
  v1 = (void *)CACLogShortcuts_sLogShortcuts;
  CACLogShortcuts_sLogShortcuts = (uint64_t)v0;

}

@end
