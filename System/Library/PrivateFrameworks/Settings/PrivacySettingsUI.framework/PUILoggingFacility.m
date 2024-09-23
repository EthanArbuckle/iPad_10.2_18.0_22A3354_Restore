@implementation PUILoggingFacility

void ___PUILoggingFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.preferences.PrivacySettings", "log");
  v1 = (void *)_PUILoggingFacility_oslog;
  _PUILoggingFacility_oslog = (uint64_t)v0;

}

@end
