@implementation PBUIRenderingLogLocalRenderer

void __PBUIRenderingLogLocalRenderer_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.paperboard.rendering", "LocalRenderer");
  v1 = (void *)PBUIRenderingLogLocalRenderer___logObj;
  PBUIRenderingLogLocalRenderer___logObj = (uint64_t)v0;

}

@end
