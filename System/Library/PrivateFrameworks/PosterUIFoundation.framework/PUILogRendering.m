@implementation PUILogRendering

void __PUILogRendering_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterUIFoundation", "Rendering");
  v1 = (void *)PUILogRendering___logObj;
  PUILogRendering___logObj = (uint64_t)v0;

}

@end
