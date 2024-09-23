@implementation CACLogAdditionalLogging

void __CACLogAdditionalLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "AdditionalLogging");
  v1 = (void *)CACLogAdditionalLogging_sLogAdditionalLogging;
  CACLogAdditionalLogging_sLogAdditionalLogging = (uint64_t)v0;

}

@end
