@implementation RWIMessageDumpStateLog

void __RWIMessageDumpStateLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WebInspector", "dump-state");
  v1 = (void *)RWIMessageDumpStateLog_dumpStateLog;
  RWIMessageDumpStateLog_dumpStateLog = (uint64_t)v0;

}

@end
