@implementation HomeLibrary

void *__HomeLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/Home.framework/Home", 2);
  HomeLibrary_sLib = (uint64_t)result;
  return result;
}

@end
