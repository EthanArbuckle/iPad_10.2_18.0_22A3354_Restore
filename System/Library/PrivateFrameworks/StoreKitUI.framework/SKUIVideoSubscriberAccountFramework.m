@implementation SKUIVideoSubscriberAccountFramework

void *__SKUIVideoSubscriberAccountFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/VideoSubscriberAccount.framework/VideoSubscriberAccount", 1);
  SKUIVideoSubscriberAccountFramework_sHandle = (uint64_t)result;
  return result;
}

@end
