@implementation ManagedConfigurationLibrary

void *__ManagedConfigurationLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/ManagedConfiguration.framework/ManagedConfiguration", 2);
  ManagedConfigurationLibrary_sLib = (uint64_t)result;
  return result;
}

void *__ManagedConfigurationLibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2);
  ManagedConfigurationLibrary_sLib_0 = (uint64_t)result;
  return result;
}

void *__ManagedConfigurationLibrary_block_invoke_1()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2);
  ManagedConfigurationLibrary_sLib_1 = (uint64_t)result;
  return result;
}

void *__ManagedConfigurationLibrary_block_invoke_2()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2);
  ManagedConfigurationLibrary_sLib_2 = (uint64_t)result;
  return result;
}

void *__ManagedConfigurationLibrary_block_invoke_3()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2);
  ManagedConfigurationLibrary_sLib_3 = (uint64_t)result;
  return result;
}

@end
