@implementation SBLogUIRemoteVC

void __SBLogUIRemoteVC_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DAB4F8], "UIRemoteVC");
  v1 = (void *)SBLogUIRemoteVC___logObj;
  SBLogUIRemoteVC___logObj = (uint64_t)v0;

}

@end
