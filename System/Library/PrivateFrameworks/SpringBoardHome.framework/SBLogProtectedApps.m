@implementation SBLogProtectedApps

void __SBLogProtectedApps_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DAB4F8], "ProtectedApps");
  v1 = (void *)SBLogProtectedApps___logObj;
  SBLogProtectedApps___logObj = (uint64_t)v0;

}

@end
