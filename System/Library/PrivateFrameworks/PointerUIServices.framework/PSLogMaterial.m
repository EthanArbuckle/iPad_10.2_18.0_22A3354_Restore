@implementation PSLogMaterial

void __PSLogMaterial_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PointerUI", "Material");
  v1 = (void *)PSLogMaterial___logObj;
  PSLogMaterial___logObj = (uint64_t)v0;

}

@end
