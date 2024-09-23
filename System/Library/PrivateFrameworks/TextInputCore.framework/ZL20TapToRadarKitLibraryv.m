@implementation ZL20TapToRadarKitLibraryv

void *___ZL20TapToRadarKitLibraryv_block_invoke()
{
  void *result;

  result = dlopen("/AppleInternal/Library/Frameworks/TapToRadarKit.framework/TapToRadarKit", 2);
  TapToRadarKitLibrary(void)::sLib = (uint64_t)result;
  return result;
}

@end
