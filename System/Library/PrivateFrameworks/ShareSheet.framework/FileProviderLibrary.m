@implementation FileProviderLibrary

void *__FileProviderLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/FileProvider.framework/FileProvider", 2);
  FileProviderLibrary_sLib = (uint64_t)result;
  return result;
}

void *__FileProviderLibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/FileProvider.framework/FileProvider", 2);
  FileProviderLibrary_sLib_0 = (uint64_t)result;
  return result;
}

@end
