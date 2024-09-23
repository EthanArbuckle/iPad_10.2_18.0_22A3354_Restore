@implementation AppStoreDaemonLibrary

void *__AppStoreDaemonLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AppStoreDaemon.framework/AppStoreDaemon", 2);
  AppStoreDaemonLibrary_sLib = (uint64_t)result;
  return result;
}

@end
