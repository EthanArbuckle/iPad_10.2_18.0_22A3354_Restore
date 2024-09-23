@implementation ZL17CoreMotionLibraryv

void *___ZL17CoreMotionLibraryv_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreMotion.framework/CoreMotion", 2);
  CoreMotionLibrary(void)::sLib = (uint64_t)result;
  return result;
}

@end
