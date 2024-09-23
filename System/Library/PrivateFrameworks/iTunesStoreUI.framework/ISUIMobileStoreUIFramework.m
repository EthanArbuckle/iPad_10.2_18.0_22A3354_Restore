@implementation ISUIMobileStoreUIFramework

void *__ISUIMobileStoreUIFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/MobileStoreUI.framework/MobileStoreUI", 1);
  ISUIMobileStoreUIFramework_sHandle = (uint64_t)result;
  return result;
}

@end
