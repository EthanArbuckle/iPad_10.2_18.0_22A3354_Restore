@implementation SpotlightCell

+ (int64_t)cellStyle
{
  return 0;
}

+ (id)bundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)bundle_sSpotlightBundle;
  if (!bundle_sSpotlightBundle)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)bundle_sSpotlightBundle;
    bundle_sSpotlightBundle = v3;

    v2 = (void *)bundle_sSpotlightBundle;
  }
  return v2;
}

- (BOOL)canReload
{
  return 1;
}

@end
