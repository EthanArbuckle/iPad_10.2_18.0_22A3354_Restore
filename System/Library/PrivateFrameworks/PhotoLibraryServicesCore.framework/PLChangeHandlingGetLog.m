@implementation PLChangeHandlingGetLog

void __PLChangeHandlingGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D710F8], "ChangeHandling");
  v1 = (void *)PLChangeHandlingGetLog_log;
  PLChangeHandlingGetLog_log = (uint64_t)v0;

}

@end
