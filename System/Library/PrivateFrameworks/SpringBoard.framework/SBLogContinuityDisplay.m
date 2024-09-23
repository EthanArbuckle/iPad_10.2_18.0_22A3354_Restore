@implementation SBLogContinuityDisplay

void __SBLogContinuityDisplay_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DAB4F8], "ContinuityDisplay");
  v1 = (void *)SBLogContinuityDisplay___logObj;
  SBLogContinuityDisplay___logObj = (uint64_t)v0;

}

@end
