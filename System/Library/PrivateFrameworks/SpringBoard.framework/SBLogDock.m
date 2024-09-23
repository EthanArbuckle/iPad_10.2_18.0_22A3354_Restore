@implementation SBLogDock

void __SBLogDock_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DAB4F8], "Dock");
  v1 = (void *)SBLogDock___logObj;
  SBLogDock___logObj = (uint64_t)v0;

}

@end
