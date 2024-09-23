@implementation PSLogClipping

void __PSLogClipping_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PointerUI", "Clipping");
  v1 = (void *)PSLogClipping___logObj;
  PSLogClipping___logObj = (uint64_t)v0;

}

@end
