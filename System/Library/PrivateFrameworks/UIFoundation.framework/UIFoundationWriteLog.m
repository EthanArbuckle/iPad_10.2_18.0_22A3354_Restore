@implementation UIFoundationWriteLog

void ____UIFoundationWriteLog_block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.UIFoundation", *(const char **)(a1 + 32));
  v2 = (void *)__UIFoundationWriteLog_uifoundationLog;
  __UIFoundationWriteLog_uifoundationLog = (uint64_t)v1;

}

@end
