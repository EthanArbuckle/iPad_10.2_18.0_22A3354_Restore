@implementation SFLogForCategory

void __SFLogForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  os_log_t v8;
  void *v9;

  v0 = os_log_create("com.apple.settings.SettingsFoundation", "Base");
  v1 = (void *)SFLogForCategory_logObjects[0];
  SFLogForCategory_logObjects[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.settings.SettingsFoundation", "Legal");
  v3 = (void *)qword_253D29B88;
  qword_253D29B88 = (uint64_t)v2;

  v4 = os_log_create("com.apple.settings.SettingsFoundation", "Signposts");
  v5 = (void *)qword_253D29B90;
  qword_253D29B90 = (uint64_t)v4;

  v6 = os_log_create("com.apple.settings.SettingsFoundation", "DeviceAttributes");
  v7 = (void *)qword_253D29B98;
  qword_253D29B98 = (uint64_t)v6;

  v8 = os_log_create("com.apple.settings.SettingsFoundation", "SettingsAnalytics");
  v9 = (void *)qword_253D29BA0;
  qword_253D29BA0 = (uint64_t)v8;

}

@end
