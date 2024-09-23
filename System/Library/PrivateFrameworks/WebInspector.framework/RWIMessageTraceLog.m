@implementation RWIMessageTraceLog

void __RWIMessageTraceLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WebInspector", "message-trace");
  v1 = (void *)RWIMessageTraceLog_messageTraceLog;
  RWIMessageTraceLog_messageTraceLog = (uint64_t)v0;

}

@end
