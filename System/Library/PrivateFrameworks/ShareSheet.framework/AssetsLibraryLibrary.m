@implementation AssetsLibraryLibrary

void *__AssetsLibraryLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/AssetsLibrary.framework/AssetsLibrary", 2);
  AssetsLibraryLibrary_sLib = (uint64_t)result;
  return result;
}

void *__AssetsLibraryLibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/AssetsLibrary.framework/AssetsLibrary", 2);
  AssetsLibraryLibrary_sLib_0 = (uint64_t)result;
  return result;
}

@end
