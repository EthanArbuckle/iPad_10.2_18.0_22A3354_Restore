@implementation VUIVPAFLogObject

void __VUIVPAFLogObject_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.VideosUI", "VPAF");
  v1 = (void *)VUIVPAFLogObject_logger;
  VUIVPAFLogObject_logger = (uint64_t)v0;

}

@end
