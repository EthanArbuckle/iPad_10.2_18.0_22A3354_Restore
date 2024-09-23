@implementation PLBoopGetLog

void __PLBoopGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D71100], "Boop");
  v1 = (void *)PLBoopGetLog_log;
  PLBoopGetLog_log = (uint64_t)v0;

}

@end
