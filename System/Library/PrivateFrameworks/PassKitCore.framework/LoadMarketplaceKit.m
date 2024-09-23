@implementation LoadMarketplaceKit

void *__LoadMarketplaceKit_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/MarketplaceKit.framework/MarketplaceKit", 2);
  LoadMarketplaceKit_frameworkLibrary = (uint64_t)result;
  return result;
}

@end
