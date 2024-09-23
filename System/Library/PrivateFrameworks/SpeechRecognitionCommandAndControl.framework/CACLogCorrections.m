@implementation CACLogCorrections

void __CACLogCorrections_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "Corrections");
  v1 = (void *)CACLogCorrections_sLogCorrections;
  CACLogCorrections_sLogCorrections = (uint64_t)v0;

}

@end
