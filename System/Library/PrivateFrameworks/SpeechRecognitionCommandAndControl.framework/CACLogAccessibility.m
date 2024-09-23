@implementation CACLogAccessibility

void __CACLogAccessibility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "Accessibility");
  v1 = (void *)CACLogAccessibility_sLogAccessibility;
  CACLogAccessibility_sLogAccessibility = (uint64_t)v0;

}

@end
