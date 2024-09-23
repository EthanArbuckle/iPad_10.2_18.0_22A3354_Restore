@implementation MobileKeyBagLibrary

void *__MobileKeyBagLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/MobileKeyBag.framework/MobileKeyBag", 2);
  MobileKeyBagLibrary_sLib = (uint64_t)result;
  return result;
}

@end
