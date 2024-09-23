@implementation AMFDRPlatformDefaultCopyProductTypeNative

const __CFString *___AMFDRPlatformDefaultCopyProductTypeNative_block_invoke()
{
  const __CFString *result;

  result = AMFDRSealingMapCallMGCopyAnswer(CFSTR("ProductType"), 0);
  _AMFDRPlatformDefaultCopyProductTypeNative_productType = (uint64_t)result;
  return result;
}

@end
