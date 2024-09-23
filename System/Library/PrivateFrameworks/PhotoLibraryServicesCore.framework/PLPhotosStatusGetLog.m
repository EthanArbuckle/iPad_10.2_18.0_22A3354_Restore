@implementation PLPhotosStatusGetLog

void __PLPhotosStatusGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.status", "PhotosStatus");
  v1 = (void *)PLPhotosStatusGetLog_log;
  PLPhotosStatusGetLog_log = (uint64_t)v0;

}

@end
