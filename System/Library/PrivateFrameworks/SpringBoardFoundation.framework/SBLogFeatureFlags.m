@implementation SBLogFeatureFlags

void __SBLogFeatureFlags_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DAB4F8], "FeatureFlags");
  v1 = (void *)SBLogFeatureFlags___logObj;
  SBLogFeatureFlags___logObj = (uint64_t)v0;

}

@end
