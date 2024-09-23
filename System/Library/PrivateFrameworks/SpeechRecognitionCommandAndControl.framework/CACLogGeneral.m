@implementation CACLogGeneral

void __CACLogGeneral_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "General");
  v1 = (void *)CACLogGeneral_sLogGeneral;
  CACLogGeneral_sLogGeneral = (uint64_t)v0;

}

@end
