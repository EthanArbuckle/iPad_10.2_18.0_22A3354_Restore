@implementation PBFLogGallery

void __PBFLogGallery_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterBoard", "Gallery");
  v1 = (void *)PBFLogGallery___logObj;
  PBFLogGallery___logObj = (uint64_t)v0;

}

@end
