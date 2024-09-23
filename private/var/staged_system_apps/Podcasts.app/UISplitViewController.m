@implementation UISplitViewController

- (UIViewController)mt_masterViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UISplitViewController viewControllers](self, "viewControllers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  return (UIViewController *)v3;
}

- (UIViewController)mt_detailViewController
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UISplitViewController viewControllers](self, "viewControllers"));
  v4 = objc_msgSend(v3, "count");

  if ((unint64_t)v4 < 2)
  {
    v6 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UISplitViewController viewControllers](self, "viewControllers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 1));

  }
  return (UIViewController *)v6;
}

@end
