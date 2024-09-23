@implementation StoreServicesLibrary

void *__StoreServicesLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/StoreServices.framework/StoreServices", 2);
  StoreServicesLibrary_sLib = (uint64_t)result;
  return result;
}

@end
