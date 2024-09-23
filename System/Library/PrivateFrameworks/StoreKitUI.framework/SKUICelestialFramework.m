@implementation SKUICelestialFramework

void *__SKUICelestialFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/Celestial.framework/Celestial", 1);
  SKUICelestialFramework_sHandle = (uint64_t)result;
  return result;
}

@end
