@implementation VideoSubscriberAccountLibrary

void *__VideoSubscriberAccountLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PublicFrameworks/VideoSubscriberAccount.framework/VideoSubscriberAccount", 2);
  VideoSubscriberAccountLibrary_sLib = (uint64_t)result;
  return result;
}

@end
