@implementation VUICDefaultLogObject

void __VUICDefaultLogObject_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.VideosUICore", "Default");
  v1 = (void *)VUICDefaultLogObject_logger;
  VUICDefaultLogObject_logger = (uint64_t)v0;

}

@end
