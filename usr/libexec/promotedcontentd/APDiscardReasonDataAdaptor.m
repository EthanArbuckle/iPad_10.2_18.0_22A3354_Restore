@implementation APDiscardReasonDataAdaptor

+ (id)identifier
{
  return CFSTR("com.apple.ap.marketplace.discard_reasons");
}

- (id)_biomeStream
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = BiomeLibrary(self, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "AdPlatforms"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "MarketplaceHealth"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "DiscardReasons"));

  return v6;
}

@end
