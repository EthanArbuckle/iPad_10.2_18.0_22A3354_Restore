@implementation MAAsset(UIReferenceLibraryViewControllerAdditions_Private)

- (uint64_t)_formatVersion
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "attributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("_CompatibilityVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (uint64_t)_contentVersion
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "attributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("_ContentVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

@end
