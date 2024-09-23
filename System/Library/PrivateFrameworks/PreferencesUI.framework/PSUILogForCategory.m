@implementation PSUILogForCategory

void __PSUILogForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;

  v0 = os_log_create("com.apple.SettingsAndCoreApps.PreferencesUI", "Base");
  v1 = (void *)PSUILogForCategory_logObjects;
  PSUILogForCategory_logObjects = (uint64_t)v0;

  v2 = os_log_create("com.apple.SettingsAndCoreApps.PreferencesUI", "Passcode");
  v3 = (void *)qword_253E97BF8;
  qword_253E97BF8 = (uint64_t)v2;

  v4 = os_log_create("com.apple.SettingsAndCoreApps.PreferencesUI", "Data Migrator");
  v5 = (void *)qword_253E97C00;
  qword_253E97C00 = (uint64_t)v4;

  v6 = os_log_create("com.apple.SettingsAndCoreApps.PreferencesUI", "Signposts");
  v7 = (void *)qword_253E97C08;
  qword_253E97C08 = (uint64_t)v6;

}

@end
