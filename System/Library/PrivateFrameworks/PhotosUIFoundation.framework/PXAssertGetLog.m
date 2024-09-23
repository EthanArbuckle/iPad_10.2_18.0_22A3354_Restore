@implementation PXAssertGetLog

void __PXAssertGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x24BE71BC8], "PXAssert");
  v1 = (void *)PXAssertGetLog_log;
  PXAssertGetLog_log = (uint64_t)v0;

}

@end
