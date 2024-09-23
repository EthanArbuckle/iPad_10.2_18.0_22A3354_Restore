@implementation PUILogForCategory

void __PUILogForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create("com.apple.SettingsAndCoreApps.PrivacySettings", "PrivacySettings");
  v1 = (void *)PUILogForCategory_logObjects[0];
  PUILogForCategory_logObjects[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.SettingsAndCoreApps.PrivacySettings", "Signposts");
  v3 = (void *)qword_1F02D3CF0;
  qword_1F02D3CF0 = (uint64_t)v2;

}

@end
