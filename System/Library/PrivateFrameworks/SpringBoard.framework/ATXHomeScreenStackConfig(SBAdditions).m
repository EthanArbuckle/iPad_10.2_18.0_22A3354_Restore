@implementation ATXHomeScreenStackConfig(SBAdditions)

- (uint64_t)sb_isAppPredictionStack
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "widgets");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count") == 1)
  {
    objc_msgSend(v1, "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "extensionBundleId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CF89A8]);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
