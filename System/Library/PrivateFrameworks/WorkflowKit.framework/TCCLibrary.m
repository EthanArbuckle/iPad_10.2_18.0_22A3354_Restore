@implementation TCCLibrary

void *__TCCLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/TCC.framework/TCC", 2);
  TCCLibrary_sLib = (uint64_t)result;
  return result;
}

@end
