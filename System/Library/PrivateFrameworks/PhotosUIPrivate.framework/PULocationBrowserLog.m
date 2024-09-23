@implementation PULocationBrowserLog

void __PULocationBrowserLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.ui", "LocationBrowser");
  v1 = (void *)PULocationBrowserLog_log;
  PULocationBrowserLog_log = (uint64_t)v0;

}

@end
