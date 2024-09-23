@implementation WLKCurrentAPIVersion

void __WLKCurrentAPIVersion_block_invoke()
{
  uint64_t v0;
  void *v1;

  WLKAPIVersionOverride();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)WLKCurrentAPIVersion_overrideValue;
  WLKCurrentAPIVersion_overrideValue = v0;

  if (WLKCurrentAPIVersion_overrideValue)
    NSLog(CFSTR("[WLKNetworkRequestTypes] using API version override %@"), WLKCurrentAPIVersion_overrideValue);
}

@end
