@implementation SBLogCaptureApplication

void __SBLogCaptureApplication_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DAB4F8], "CaptureApplication");
  v1 = (void *)SBLogCaptureApplication___logObj;
  SBLogCaptureApplication___logObj = (uint64_t)v0;

}

@end
