@implementation CACLogDictationCommands

void __CACLogDictationCommands_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "DictationCommands");
  v1 = (void *)CACLogDictationCommands_sLogDictationCommands;
  CACLogDictationCommands_sLogDictationCommands = (uint64_t)v0;

}

@end
