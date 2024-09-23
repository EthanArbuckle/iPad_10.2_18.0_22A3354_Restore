@implementation SBLogSystemActionDataSource

void __SBLogSystemActionDataSource_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DAB4F8], "SystemActionDataSource");
  v1 = (void *)SBLogSystemActionDataSource___logObj;
  SBLogSystemActionDataSource___logObj = (uint64_t)v0;

}

@end
