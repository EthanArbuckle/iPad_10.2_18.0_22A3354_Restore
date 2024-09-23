@implementation CACLogElementEvaluation

void __CACLogElementEvaluation_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "ElementEvaluation");
  v1 = (void *)CACLogElementEvaluation_sLogElementEvaluation;
  CACLogElementEvaluation_sLogElementEvaluation = (uint64_t)v0;

}

@end
