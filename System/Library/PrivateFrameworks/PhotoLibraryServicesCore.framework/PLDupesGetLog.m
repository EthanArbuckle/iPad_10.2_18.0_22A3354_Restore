@implementation PLDupesGetLog

void __PLDupesGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D710F8], "Dupes");
  v1 = (void *)PLDupesGetLog_log;
  PLDupesGetLog_log = (uint64_t)v0;

}

@end
