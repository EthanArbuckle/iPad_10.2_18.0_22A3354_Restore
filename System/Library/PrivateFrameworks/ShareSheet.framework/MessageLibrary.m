@implementation MessageLibrary

void *__MessageLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/Message.framework/Message", 2);
  MessageLibrary_sLib = (uint64_t)result;
  return result;
}

@end
