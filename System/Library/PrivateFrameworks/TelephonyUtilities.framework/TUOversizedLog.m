@implementation TUOversizedLog

void __TUOversizedLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calls.telephonyutilities", "Oversized");
  v1 = (void *)TUOversizedLog_TUOversizedLog;
  TUOversizedLog_TUOversizedLog = (uint64_t)v0;

}

@end
