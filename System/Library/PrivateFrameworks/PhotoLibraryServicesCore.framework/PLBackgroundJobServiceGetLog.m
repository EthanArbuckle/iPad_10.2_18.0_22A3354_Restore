@implementation PLBackgroundJobServiceGetLog

void __PLBackgroundJobServiceGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D710F8], "BackgroundJobService");
  v1 = (void *)PLBackgroundJobServiceGetLog_log;
  PLBackgroundJobServiceGetLog_log = (uint64_t)v0;

}

@end
