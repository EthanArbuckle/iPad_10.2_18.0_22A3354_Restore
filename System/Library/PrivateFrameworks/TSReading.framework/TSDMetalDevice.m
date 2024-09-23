@implementation TSDMetalDevice

void __TSDMetalDevice_block_invoke()
{
  id v0;
  void *v1;

  v0 = MTLCreateSystemDefaultDevice();
  v1 = (void *)TSDMetalDevice_s_metalDevice;
  TSDMetalDevice_s_metalDevice = (uint64_t)v0;

}

@end
