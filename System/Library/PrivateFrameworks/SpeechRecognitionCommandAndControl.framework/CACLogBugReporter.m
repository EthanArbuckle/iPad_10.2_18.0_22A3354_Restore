@implementation CACLogBugReporter

void __CACLogBugReporter_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "BugReporter");
  v1 = (void *)CACLogBugReporter_sLogBugReporter;
  CACLogBugReporter_sLogBugReporter = (uint64_t)v0;

}

@end
