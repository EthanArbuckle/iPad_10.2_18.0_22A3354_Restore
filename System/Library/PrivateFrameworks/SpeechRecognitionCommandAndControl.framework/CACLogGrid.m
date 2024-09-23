@implementation CACLogGrid

void __CACLogGrid_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "Grid");
  v1 = (void *)CACLogGrid_sLogGrid;
  CACLogGrid_sLogGrid = (uint64_t)v0;

}

@end
