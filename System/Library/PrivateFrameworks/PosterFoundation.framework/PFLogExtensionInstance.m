@implementation PFLogExtensionInstance

void __PFLogExtensionInstance_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterFoundation", "ExtensionInstance");
  v1 = (void *)PFLogExtensionInstance___logObj;
  PFLogExtensionInstance___logObj = (uint64_t)v0;

}

@end
