@implementation NSBundle(UINSBundleLocalizableStringAdditions)

+ (id)currentNibLoadingBundle
{
  void *v0;
  void *v1;

  UICurrentNibLoadingBundles();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "lastObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)currentNibPath
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  UICurrentNibPaths();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "lastObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 == v2)
    v3 = 0;
  else
    v3 = v1;
  v4 = v3;

  return v4;
}

+ (void)pushNibPath:()UINSBundleLocalizableStringAdditions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  UICurrentNibPaths();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v6)
  {
    objc_msgSend(v3, "addObject:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

+ (void)pushNibLoadingBundle:()UINSBundleLocalizableStringAdditions
{
  id v3;
  id v4;

  v3 = a3;
  UICurrentNibLoadingBundles();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v3);

}

+ (void)popNibPath
{
  id v0;

  UICurrentNibPaths();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "removeLastObject");

}

+ (void)popNibLoadingBundle
{
  id v0;

  UICurrentNibLoadingBundles();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "removeLastObject");

}

@end
