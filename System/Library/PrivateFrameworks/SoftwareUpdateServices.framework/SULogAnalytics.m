@implementation SULogAnalytics

void __SULogAnalytics_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.softwareupdateservices", "SUAnalytics");
  v1 = (void *)SULogAnalytics___instance;
  SULogAnalytics___instance = (uint64_t)v0;

}

@end
