@implementation SIMSetupSupportLibrary

void *__SIMSetupSupportLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SIMSetupSupport.framework/SIMSetupSupport", 2);
  SIMSetupSupportLibrary_sLib = (uint64_t)result;
  return result;
}

@end
