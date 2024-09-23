@implementation NearFieldLibrary

void *__NearFieldLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/NearField.framework/NearField", 2);
  NearFieldLibrary_sLib = (uint64_t)result;
  return result;
}

@end
