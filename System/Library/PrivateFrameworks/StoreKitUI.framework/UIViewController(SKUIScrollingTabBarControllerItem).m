@implementation UIViewController(SKUIScrollingTabBarControllerItem)

- (id)scrollingTabBarController
{
  id v1;
  void *v2;

  v1 = a1;
  do
  {
    v2 = v1;
    objc_msgSend(v1, "parentViewController");
    v1 = (id)objc_claimAutoreleasedReturnValue();

    if (!v1)
      break;
    objc_opt_class();
  }
  while ((objc_opt_isKindOfClass() & 1) == 0);
  return v1;
}

@end
