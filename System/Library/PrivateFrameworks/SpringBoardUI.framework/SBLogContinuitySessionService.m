@implementation SBLogContinuitySessionService

void __SBLogContinuitySessionService_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x24BEB0BA8], "ContinuitySessionService");
  v1 = (void *)SBLogContinuitySessionService___logObj;
  SBLogContinuitySessionService___logObj = (uint64_t)v0;

}

@end
