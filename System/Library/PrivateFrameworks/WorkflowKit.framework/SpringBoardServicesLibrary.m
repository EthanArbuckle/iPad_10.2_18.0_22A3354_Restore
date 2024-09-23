@implementation SpringBoardServicesLibrary

void *__SpringBoardServicesLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SpringBoardServices.framework/SpringBoardServices", 2);
  SpringBoardServicesLibrary_sLib = (uint64_t)result;
  return result;
}

@end
