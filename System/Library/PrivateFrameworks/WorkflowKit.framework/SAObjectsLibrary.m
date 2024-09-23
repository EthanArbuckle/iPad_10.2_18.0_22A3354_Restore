@implementation SAObjectsLibrary

void *__SAObjectsLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SAObjects.framework/SAObjects", 2);
  SAObjectsLibrary_sLib = (uint64_t)result;
  return result;
}

void *__SAObjectsLibrary_block_invoke_60895()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SAObjects.framework/SAObjects", 2);
  SAObjectsLibrary_sLib_60893 = (uint64_t)result;
  return result;
}

@end
