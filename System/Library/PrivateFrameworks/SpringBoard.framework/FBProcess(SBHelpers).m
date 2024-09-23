@implementation FBProcess(SBHelpers)

- (id)sb_bundleIdentifierWithFallback
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(a1, "handle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (uint64_t)sb_isProbablyUIApplication
{
  _BOOL8 v2;
  void *v3;
  void *v4;

  if ((objc_msgSend(a1, "isApplicationProcess") & 1) != 0)
    return 1;
  objc_msgSend(a1, "sb_bundleIdentifierWithFallback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _SBApp(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v4 != 0;

  return v2;
}

@end
