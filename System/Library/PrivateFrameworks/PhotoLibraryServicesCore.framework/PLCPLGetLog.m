@implementation PLCPLGetLog

void __PLCPLGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D710F8], "CPL");
  v1 = (void *)PLCPLGetLog_log;
  PLCPLGetLog_log = (uint64_t)v0;

}

@end
