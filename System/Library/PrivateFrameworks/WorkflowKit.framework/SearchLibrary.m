@implementation SearchLibrary

void *__SearchLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/Search.framework/Search", 2);
  SearchLibrary_sLib = (uint64_t)result;
  return result;
}

@end
