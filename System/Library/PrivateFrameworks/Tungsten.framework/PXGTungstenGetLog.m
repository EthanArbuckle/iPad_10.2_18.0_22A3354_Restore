@implementation PXGTungstenGetLog

void __PXGTungstenGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x24BE71BC8], "Tungsten");
  v1 = (void *)PXGTungstenGetLog_log;
  PXGTungstenGetLog_log = (uint64_t)v0;

}

@end
