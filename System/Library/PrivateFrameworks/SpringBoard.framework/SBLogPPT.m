@implementation SBLogPPT

void __SBLogPPT_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DAB4F8], "PPT");
  v1 = (void *)SBLogPPT___logObj;
  SBLogPPT___logObj = (uint64_t)v0;

}

@end
