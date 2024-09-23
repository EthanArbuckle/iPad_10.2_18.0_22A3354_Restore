@implementation CACLogAudio

void __CACLogAudio_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "Audio");
  v1 = (void *)CACLogAudio_sLogAudio;
  CACLogAudio_sLogAudio = (uint64_t)v0;

}

@end
