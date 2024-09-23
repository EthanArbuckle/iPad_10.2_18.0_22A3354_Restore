@implementation IMSharedUtilitiesLibrary

void *__IMSharedUtilitiesLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/IMSharedUtilities.framework/IMSharedUtilities", 2);
  IMSharedUtilitiesLibrary_sLib = (uint64_t)result;
  return result;
}

@end
