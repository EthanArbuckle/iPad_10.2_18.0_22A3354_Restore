@implementation VUICImageLogObject

void __VUICImageLogObject_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.VideosUICore", "Image");
  v1 = (void *)VUICImageLogObject_logger;
  VUICImageLogObject_logger = (uint64_t)v0;

}

@end
