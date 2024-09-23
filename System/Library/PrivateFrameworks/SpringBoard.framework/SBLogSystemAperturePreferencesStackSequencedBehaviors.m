@implementation SBLogSystemAperturePreferencesStackSequencedBehaviors

void __SBLogSystemAperturePreferencesStackSequencedBehaviors_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DAB4F8], "SystemAperturePreferencesStackSequencedBehaviors");
  v1 = (void *)SBLogSystemAperturePreferencesStackSequencedBehaviors___logObj;
  SBLogSystemAperturePreferencesStackSequencedBehaviors___logObj = (uint64_t)v0;

}

@end
