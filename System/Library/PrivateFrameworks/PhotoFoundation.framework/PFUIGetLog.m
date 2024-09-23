@implementation PFUIGetLog

void __PFUIGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.ui", "UI");
  v1 = (void *)PFUIGetLog_log;
  PFUIGetLog_log = (uint64_t)v0;

}

@end
