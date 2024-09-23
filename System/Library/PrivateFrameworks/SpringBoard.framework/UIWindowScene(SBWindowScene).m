@implementation UIWindowScene(SBWindowScene)

- (id)_sbDisplayConfiguration
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "_FBSScene");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_sbWindowScene
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = objc_opt_class();
  v3 = a1;
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

@end
