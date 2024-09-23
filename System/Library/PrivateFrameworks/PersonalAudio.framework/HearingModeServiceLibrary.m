@implementation HearingModeServiceLibrary

void *__HearingModeServiceLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/HearingModeService.framework/HearingModeService", 2);
  HearingModeServiceLibrary_sLib = (uint64_t)result;
  return result;
}

void *__HearingModeServiceLibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/HearingModeService.framework/HearingModeService", 2);
  HearingModeServiceLibrary_sLib_0 = (uint64_t)result;
  return result;
}

@end
