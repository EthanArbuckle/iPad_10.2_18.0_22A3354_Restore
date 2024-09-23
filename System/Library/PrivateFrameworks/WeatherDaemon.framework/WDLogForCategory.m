@implementation WDLogForCategory

void __WDLogForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create("com.apple.weather", "Weather");
  v1 = (void *)WDLogForCategory_logObjects;
  WDLogForCategory_logObjects = (uint64_t)v0;

  v2 = os_log_create("com.apple.weather", "XPC");
  v3 = (void *)qword_1EE849488;
  qword_1EE849488 = (uint64_t)v2;

}

@end
