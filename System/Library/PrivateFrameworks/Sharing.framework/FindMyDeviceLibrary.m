@implementation FindMyDeviceLibrary

void *__FindMyDeviceLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/FindMyDevice.framework/FindMyDevice", 2);
  FindMyDeviceLibrary_sLib = (uint64_t)result;
  return result;
}

@end
