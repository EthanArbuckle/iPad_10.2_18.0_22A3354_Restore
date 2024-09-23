@implementation AppleAccountLibraryCore

uint64_t __AppleAccountLibraryCore_block_invoke()
{
  uint64_t result;

  result = _sl_dlopen();
  AppleAccountLibraryCore_frameworkLibrary = result;
  return result;
}

@end
