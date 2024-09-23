@implementation CACLogWordParse

void __CACLogWordParse_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "WordParse");
  v1 = (void *)CACLogWordParse_sLogWordParse;
  CACLogWordParse_sLogWordParse = (uint64_t)v0;

}

@end
