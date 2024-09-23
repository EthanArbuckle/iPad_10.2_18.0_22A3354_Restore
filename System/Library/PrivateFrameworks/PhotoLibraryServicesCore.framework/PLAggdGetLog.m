@implementation PLAggdGetLog

void __PLAggdGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D710F8], "Aggd");
  v1 = (void *)PLAggdGetLog_log;
  PLAggdGetLog_log = (uint64_t)v0;

}

@end
