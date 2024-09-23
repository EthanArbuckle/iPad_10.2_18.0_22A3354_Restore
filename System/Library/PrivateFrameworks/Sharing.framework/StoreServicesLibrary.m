@implementation StoreServicesLibrary

void *__StoreServicesLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/StoreServices.framework/StoreServices", 2);
  StoreServicesLibrary_sLib = (uint64_t)result;
  return result;
}

void *__StoreServicesLibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/StoreServices.framework/StoreServices", 2);
  StoreServicesLibrary_sLib_0 = (uint64_t)result;
  return result;
}

void *__StoreServicesLibrary_block_invoke_1()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/StoreServices.framework/StoreServices", 2);
  StoreServicesLibrary_sLib_1 = (uint64_t)result;
  return result;
}

@end
