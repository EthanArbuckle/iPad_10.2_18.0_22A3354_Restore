@implementation CACLogFindAndSelect

void __CACLogFindAndSelect_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "FindAndSelect");
  v1 = (void *)CACLogFindAndSelect_sLogFindAndSelect;
  CACLogFindAndSelect_sLogFindAndSelect = (uint64_t)v0;

}

@end
