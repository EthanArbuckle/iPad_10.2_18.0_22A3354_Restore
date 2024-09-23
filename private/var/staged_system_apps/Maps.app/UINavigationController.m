@implementation UINavigationController

- (UIViewController)rootViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController viewControllers](self, "viewControllers"));
  if (objc_msgSend(v2, "count"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectAtIndexedSubscript:", 0));
  else
    v3 = 0;

  return (UIViewController *)v3;
}

@end
