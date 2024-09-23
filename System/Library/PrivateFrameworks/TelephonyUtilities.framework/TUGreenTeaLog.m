@implementation TUGreenTeaLog

void __TUGreenTeaLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.greentea", "calls");
  v1 = (void *)TUGreenTeaLog_TUGreenTeaLog;
  TUGreenTeaLog_TUGreenTeaLog = (uint64_t)v0;

}

@end
