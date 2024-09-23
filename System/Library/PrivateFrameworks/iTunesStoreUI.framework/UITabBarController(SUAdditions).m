@implementation UITabBarController(SUAdditions)

- (void)selectedNavigationController
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v2 = (void *)objc_msgSend(a1, "selectedViewController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v2 = (void *)objc_msgSend(v2, "navigationController");
  if (v2)
  {
    v3 = objc_msgSend(a1, "moreNavigationController");
    if (v3)
    {
      v4 = v3;
      v5 = (void *)objc_msgSend(a1, "allViewControllers");
      v6 = objc_msgSend(v5, "indexOfObjectIdenticalTo:", v2);
      if (v6 >= objc_msgSend(v5, "indexOfObjectIdenticalTo:", v4))
        return (void *)v4;
    }
  }
  return v2;
}

@end
