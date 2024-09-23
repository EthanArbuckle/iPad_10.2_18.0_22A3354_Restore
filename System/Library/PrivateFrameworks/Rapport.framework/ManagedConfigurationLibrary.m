@implementation ManagedConfigurationLibrary

void *__ManagedConfigurationLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2);
  ManagedConfigurationLibrary_sLib = (uint64_t)result;
  return result;
}

@end
