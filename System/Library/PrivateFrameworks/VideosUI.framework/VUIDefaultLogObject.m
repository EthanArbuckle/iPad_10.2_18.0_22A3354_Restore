@implementation VUIDefaultLogObject

void __VUIDefaultLogObject_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.VideosUI", "Default");
  v1 = (void *)VUIDefaultLogObject_logger;
  VUIDefaultLogObject_logger = (uint64_t)v0;

}

@end
