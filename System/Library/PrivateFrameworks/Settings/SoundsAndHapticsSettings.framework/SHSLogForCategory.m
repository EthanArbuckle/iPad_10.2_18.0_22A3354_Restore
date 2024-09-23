@implementation SHSLogForCategory

void __SHSLogForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create("com.apple.settings.SoundsAndHaptics", "Base");
  v1 = (void *)SHSLogForCategory_logObjects[0];
  SHSLogForCategory_logObjects[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.settings.SoundsAndHaptics", "Volume");
  v3 = (void *)qword_253E97A68;
  qword_253E97A68 = (uint64_t)v2;

}

@end
