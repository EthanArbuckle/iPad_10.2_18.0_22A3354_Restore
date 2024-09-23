@implementation PLSearchIndexGetLog

void __PLSearchIndexGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D710F8], "SearchIndex");
  v1 = (void *)PLSearchIndexGetLog_log;
  PLSearchIndexGetLog_log = (uint64_t)v0;

}

@end
