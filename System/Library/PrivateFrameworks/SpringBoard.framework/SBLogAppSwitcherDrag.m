@implementation SBLogAppSwitcherDrag

void __SBLogAppSwitcherDrag_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DAB4F8], "AppSwitcherDrag");
  v1 = (void *)SBLogAppSwitcherDrag___logObj;
  SBLogAppSwitcherDrag___logObj = (uint64_t)v0;

}

@end
