@implementation RXSignpostLog

os_log_t __RXSignpostLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.SpeechRecognitionCore", "SRCSignposts");
  RXSignpostLog::signpostLog = (uint64_t)result;
  return result;
}

@end
