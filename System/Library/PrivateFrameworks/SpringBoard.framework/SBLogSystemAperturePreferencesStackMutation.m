@implementation SBLogSystemAperturePreferencesStackMutation

void __SBLogSystemAperturePreferencesStackMutation_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DAB4F8], "SystemAperturePreferencesStackMutation");
  v1 = (void *)SBLogSystemAperturePreferencesStackMutation___logObj;
  SBLogSystemAperturePreferencesStackMutation___logObj = (uint64_t)v0;

}

@end
