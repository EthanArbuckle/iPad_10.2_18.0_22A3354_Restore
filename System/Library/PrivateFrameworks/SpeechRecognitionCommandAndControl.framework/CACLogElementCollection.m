@implementation CACLogElementCollection

void __CACLogElementCollection_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "ElementCollection");
  v1 = (void *)CACLogElementCollection_sLogElementCollection;
  CACLogElementCollection_sLogElementCollection = (uint64_t)v0;

}

@end
