@implementation PBFLogReloadDescriptors

void __PBFLogReloadDescriptors_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterBoard", "ReloadDescriptors");
  v1 = (void *)PBFLogReloadDescriptors___logObj;
  PBFLogReloadDescriptors___logObj = (uint64_t)v0;

}

@end
