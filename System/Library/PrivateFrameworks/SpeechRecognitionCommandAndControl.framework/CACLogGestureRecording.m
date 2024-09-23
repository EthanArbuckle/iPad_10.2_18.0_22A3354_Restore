@implementation CACLogGestureRecording

void __CACLogGestureRecording_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "GestureRecording");
  v1 = (void *)CACLogGestureRecording_sLogGestureRecording;
  CACLogGestureRecording_sLogGestureRecording = (uint64_t)v0;

}

@end
