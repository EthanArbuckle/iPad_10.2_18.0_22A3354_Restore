@implementation UIWindow(SBWindowScene)

- (id)_sbWindowScene
{
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  objc_msgSend(a1, "windowScene");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_class();
  v3 = v1;
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

  if (!v5)
  {
    v6 = objc_opt_class();
    v7 = v3;
    if (v6)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v9 = v8;

    objc_msgSend(v9, "associatedWindowScene");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_sbDisplayConfiguration
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_sbWindowScene");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_sbDisplayConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
