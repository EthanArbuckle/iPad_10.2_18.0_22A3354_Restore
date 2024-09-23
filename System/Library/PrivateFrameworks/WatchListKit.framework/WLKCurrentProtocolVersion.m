@implementation WLKCurrentProtocolVersion

void __WLKCurrentProtocolVersion_block_invoke()
{
  uint64_t v0;
  void *v1;

  WLKProtocolVersionOverride();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)WLKCurrentProtocolVersion_overrideValue;
  WLKCurrentProtocolVersion_overrideValue = v0;

  if (WLKCurrentProtocolVersion_overrideValue)
    NSLog(CFSTR("[WLKNetworkRequestTypes] using protocol version override %@"), WLKCurrentProtocolVersion_overrideValue);
}

@end
