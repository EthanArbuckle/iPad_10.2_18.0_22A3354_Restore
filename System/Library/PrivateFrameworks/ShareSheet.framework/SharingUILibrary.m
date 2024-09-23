@implementation SharingUILibrary

void *__SharingUILibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SharingUI.framework/SharingUI", 2);
  SharingUILibrary_sLib = (uint64_t)result;
  return result;
}

void *__SharingUILibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SharingUI.framework/SharingUI", 2);
  SharingUILibrary_sLib_0 = (uint64_t)result;
  return result;
}

void *__SharingUILibrary_block_invoke_1()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SharingUI.framework/SharingUI", 2);
  SharingUILibrary_sLib_1 = (uint64_t)result;
  return result;
}

@end
