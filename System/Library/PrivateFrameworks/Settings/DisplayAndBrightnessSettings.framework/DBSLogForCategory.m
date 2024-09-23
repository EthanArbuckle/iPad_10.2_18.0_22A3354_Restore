@implementation DBSLogForCategory

void __DBSLogForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create("com.apple.settings.displayandbrightness", "Base");
  v1 = (void *)DBSLogForCategory_logObjects[0];
  DBSLogForCategory_logObjects[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.settings.displayandbrightness", "Display Zoom");
  v3 = (void *)qword_255918310;
  qword_255918310 = (uint64_t)v2;

}

@end
