@implementation RUILoggingFacility

void ___RUILoggingFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.remoteui", "log");
  v1 = (void *)_RUILoggingFacility_oslog;
  _RUILoggingFacility_oslog = (uint64_t)v0;

}

@end
