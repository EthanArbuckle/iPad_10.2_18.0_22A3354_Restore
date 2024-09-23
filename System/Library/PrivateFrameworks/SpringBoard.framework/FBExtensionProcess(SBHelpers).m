@implementation FBExtensionProcess(SBHelpers)

- (id)sb_bundleIdentifierWithFallback
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  objc_msgSend(a1, "extensionInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&off_1EFE6FBD8;
    objc_msgSendSuper2(&v8, sel_sb_bundleIdentifierWithFallback);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

@end
