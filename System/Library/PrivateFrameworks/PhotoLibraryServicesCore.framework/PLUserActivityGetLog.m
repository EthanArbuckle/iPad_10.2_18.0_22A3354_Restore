@implementation PLUserActivityGetLog

void __PLUserActivityGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D71100], "UserActivity");
  v1 = (void *)PLUserActivityGetLog_log;
  PLUserActivityGetLog_log = (uint64_t)v0;

}

@end
