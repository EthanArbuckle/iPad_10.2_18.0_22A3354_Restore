@implementation HomeUILibrary

void *__HomeUILibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/HomeUI.framework/HomeUI", 2);
  HomeUILibrary_sLib = (uint64_t)result;
  return result;
}

void *__HomeUILibrary_block_invoke_5871()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/HomeUI.framework/HomeUI", 2);
  HomeUILibrary_sLib_5872 = (uint64_t)result;
  return result;
}

@end
