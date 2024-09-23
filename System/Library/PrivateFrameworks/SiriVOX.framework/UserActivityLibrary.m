@implementation UserActivityLibrary

void *__UserActivityLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/UserActivity.framework/UserActivity", 2);
  UserActivityLibrary_sLib = (uint64_t)result;
  return result;
}

@end
