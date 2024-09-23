@implementation WCLogForCategory

void __WCLogForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;

  v0 = os_log_create("com.apple.weather", "Weather");
  v1 = (void *)WCLogForCategory_logObjects[0];
  WCLogForCategory_logObjects[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.weather", "DefaultLocations");
  v3 = (void *)qword_1ED20FC08;
  qword_1ED20FC08 = (uint64_t)v2;

  v4 = os_log_create("com.apple.weather", "KVSMigration");
  v5 = (void *)qword_1ED20FC10;
  qword_1ED20FC10 = (uint64_t)v4;

}

@end
