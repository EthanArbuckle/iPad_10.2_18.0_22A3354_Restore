@implementation SSVAppstoreDaemonFramework

void *__SSVAppstoreDaemonFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AppStoreDaemon.framework/AppStoreDaemon", 1);
  SSVAppstoreDaemonFramework_sHandle = (uint64_t)result;
  return result;
}

@end
