@implementation PLSearchUISpotlightGetLog

void __PLSearchUISpotlightGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.ui.search", "SearchUISpotlight");
  v1 = (void *)PLSearchUISpotlightGetLog_log;
  PLSearchUISpotlightGetLog_log = (uint64_t)v0;

}

@end
