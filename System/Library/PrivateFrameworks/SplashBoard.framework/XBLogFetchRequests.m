@implementation XBLogFetchRequests

void __XBLogFetchRequests_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SplashBoard", "FetchRequests");
  v1 = (void *)XBLogFetchRequests___logObj;
  XBLogFetchRequests___logObj = (uint64_t)v0;

}

@end
