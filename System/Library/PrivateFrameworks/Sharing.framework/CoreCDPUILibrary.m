@implementation CoreCDPUILibrary

void *__CoreCDPUILibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CoreCDPUI.framework/CoreCDPUI", 2);
  CoreCDPUILibrary_sLib = (uint64_t)result;
  return result;
}

@end
