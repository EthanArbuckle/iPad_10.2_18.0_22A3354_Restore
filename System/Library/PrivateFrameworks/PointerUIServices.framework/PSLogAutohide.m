@implementation PSLogAutohide

void __PSLogAutohide_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PointerUI", "Autohide");
  v1 = (void *)PSLogAutohide___logObj;
  PSLogAutohide___logObj = (uint64_t)v0;

}

@end
