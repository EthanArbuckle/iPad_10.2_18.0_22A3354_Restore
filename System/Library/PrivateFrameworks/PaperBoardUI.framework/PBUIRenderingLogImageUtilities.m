@implementation PBUIRenderingLogImageUtilities

void __PBUIRenderingLogImageUtilities_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.paperboard.rendering", "ImageUtilities");
  v1 = (void *)PBUIRenderingLogImageUtilities___logObj;
  PBUIRenderingLogImageUtilities___logObj = (uint64_t)v0;

}

@end
