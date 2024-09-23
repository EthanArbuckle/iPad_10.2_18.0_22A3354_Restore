@implementation IconServicesLibrary

void *__IconServicesLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2);
  IconServicesLibrary_sLib = (uint64_t)result;
  return result;
}

@end
