@implementation UIViewController(PKUIUtilities)

- (id)pkui_frontMostViewController
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v2 = (void *)MEMORY[0x1A1AE621C]();
  objc_msgSend(a1, "presentedViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3 || (void *)v3 == a1)
  {
    v7 = a1;
  }
  else
  {
    while (1)
    {
      objc_msgSend(v4, "presentedViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5 || v4 == v5)
        break;
      v6 = v4;
      v4 = v5;

    }
    v7 = v4;
    v4 = v7;
  }
  v8 = v7;

  objc_autoreleasePoolPop(v2);
  return v8;
}

- (uint64_t)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 0;
}

- (uint64_t)pkui_userInterfaceIdiomSupportsLargeLayouts
{
  void *v1;
  unint64_t v2;
  uint64_t v3;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "userInterfaceIdiom");
  v3 = (v2 < 7) & (0x62u >> v2);

  return v3;
}

@end
