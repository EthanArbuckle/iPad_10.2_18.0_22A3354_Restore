@implementation SBLogSystemActionControl

void __SBLogSystemActionControl_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DAB4F8], "SystemActionControl");
  v1 = (void *)SBLogSystemActionControl___logObj;
  SBLogSystemActionControl___logObj = (uint64_t)v0;

}

@end
