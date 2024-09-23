@implementation PSLogTransform

void __PSLogTransform_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PointerUI", "Transform");
  v1 = (void *)PSLogTransform___logObj;
  PSLogTransform___logObj = (uint64_t)v0;

}

@end
