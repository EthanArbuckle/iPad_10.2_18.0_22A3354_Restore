@implementation PSGLoggingFacility

void ___PSGLoggingFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.preferences.GeneralSettings", "log");
  v1 = (void *)_PSGLoggingFacility_oslog;
  _PSGLoggingFacility_oslog = (uint64_t)v0;

}

@end
