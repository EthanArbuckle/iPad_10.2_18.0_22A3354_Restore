@implementation SBLogAlertItemStack

void __SBLogAlertItemStack_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DAB4F8], "AlertItemStack");
  v1 = (void *)SBLogAlertItemStack___logObj;
  SBLogAlertItemStack___logObj = (uint64_t)v0;

}

@end
