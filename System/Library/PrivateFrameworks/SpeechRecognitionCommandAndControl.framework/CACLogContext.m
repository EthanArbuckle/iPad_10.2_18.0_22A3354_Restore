@implementation CACLogContext

void __CACLogContext_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "Context");
  v1 = (void *)CACLogContext_sLogContext;
  CACLogContext_sLogContext = (uint64_t)v0;

}

@end
