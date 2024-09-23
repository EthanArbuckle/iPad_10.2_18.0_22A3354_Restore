@implementation RXOSLog

os_log_t __RXOSLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.SpeechRecognitionCore", "SRCLogs");
  RXOSLog::signpostLog = (uint64_t)result;
  return result;
}

@end
