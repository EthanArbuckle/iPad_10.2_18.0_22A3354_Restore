@implementation LoadStoreKitUI

void *__LoadStoreKitUI_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/StoreKitUI.framework/StoreKitUI", 2);
  LoadStoreKitUI_frameworkLibrary = (uint64_t)result;
  return result;
}

@end
