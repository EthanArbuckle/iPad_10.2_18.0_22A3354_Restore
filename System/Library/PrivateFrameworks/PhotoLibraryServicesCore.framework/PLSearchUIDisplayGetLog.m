@implementation PLSearchUIDisplayGetLog

void __PLSearchUIDisplayGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.ui.search", "SearchUIDisplay");
  v1 = (void *)PLSearchUIDisplayGetLog_log;
  PLSearchUIDisplayGetLog_log = (uint64_t)v0;

}

@end
