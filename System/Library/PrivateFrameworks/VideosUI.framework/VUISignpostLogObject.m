@implementation VUISignpostLogObject

void __VUISignpostLogObject_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.VideosUI", "Signpost");
  v1 = (void *)VUISignpostLogObject_logger;
  VUISignpostLogObject_logger = (uint64_t)v0;

}

@end
