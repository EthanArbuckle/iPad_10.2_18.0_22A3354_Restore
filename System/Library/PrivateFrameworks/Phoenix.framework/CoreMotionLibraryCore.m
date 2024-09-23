@implementation CoreMotionLibraryCore

uint64_t __CoreMotionLibraryCore_block_invoke()
{
  uint64_t result;

  result = _sl_dlopen();
  CoreMotionLibraryCore_frameworkLibrary = result;
  return result;
}

@end
