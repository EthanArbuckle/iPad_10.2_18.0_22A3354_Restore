@implementation SBLogLiftToWake

void __SBLogLiftToWake_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DAB4F8], "LiftToWake");
  v1 = (void *)SBLogLiftToWake___logObj;
  SBLogLiftToWake___logObj = (uint64_t)v0;

}

@end
