@implementation PUPhotoEditAutomationLog

void __PUPhotoEditAutomationLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.ui", "PhotoEditAutomation");
  v1 = (void *)PUPhotoEditAutomationLog_log;
  PUPhotoEditAutomationLog_log = (uint64_t)v0;

}

@end
