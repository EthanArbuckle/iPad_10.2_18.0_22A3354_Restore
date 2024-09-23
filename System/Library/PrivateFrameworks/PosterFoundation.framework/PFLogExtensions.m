@implementation PFLogExtensions

void __PFLogExtensions_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterFoundation", "Extensions");
  v1 = (void *)PFLogExtensions___logObj;
  PFLogExtensions___logObj = (uint64_t)v0;

}

@end
