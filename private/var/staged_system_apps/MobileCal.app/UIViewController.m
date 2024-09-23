@implementation UIViewController

- (UINavigationController)viewControllerToShowFrom
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController targetViewControllerForAction:sender:](self, "targetViewControllerForAction:sender:", "showViewController:sender:animated:completion:", 0));
  v3 = objc_opt_class(UINavigationController);
  v4 = 0;
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = v2;

  return (UINavigationController *)v4;
}

- (void)setModalPresentationDelegate:(id)a3
{
  id AssociatedObject;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v8 = a3;
  AssociatedObject = objc_getAssociatedObject(self, &unk_1001F6110);
  v5 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v6 = objc_opt_class(UIViewController);
  if ((objc_opt_isKindOfClass(v8, v6) & 1) != 0 && (objc_msgSend(v5, "isEqual:", v8) & 1) == 0)
  {
    v7 = v8;

    objc_setAssociatedObject(self, &unk_1001F6110, v7, 0);
    v5 = v7;
  }

}

- (UIViewController)modalPresentationDelegate
{
  id AssociatedObject;
  void *v3;
  uint64_t v4;
  id v5;

  AssociatedObject = objc_getAssociatedObject(self, &unk_1001F6110);
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = objc_opt_class(UIViewController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;

  return (UIViewController *)v5;
}

- (int64_t)presentationStyleOverrideForChildViewControllers
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController ekui_futureTraitCollection](self, "ekui_futureTraitCollection"));
  if (!objc_msgSend(v3, "horizontalSizeClass"))
  {

    return 6;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController ekui_futureTraitCollection](self, "ekui_futureTraitCollection"));
  v5 = objc_msgSend(v4, "horizontalSizeClass");

  if (v5 == (id)1)
    return 6;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController ekui_futureTraitCollection](self, "ekui_futureTraitCollection"));
  v7 = objc_msgSend(v6, "horizontalSizeClass");

  if (v7 != (id)2)
    return -1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController ekui_futureTraitCollection](self, "ekui_futureTraitCollection"));
  v9 = objc_msgSend(v8, "verticalSizeClass");

  if (v9 == (id)1)
    return 1;
  else
    return 7;
}

- (BOOL)prefersForcedModalShowViewController
{
  return 0;
}

- (BOOL)prefersToBePresentedFromApplicationRootViewController
{
  return 0;
}

- (BOOL)prefersToBePresentedFromUINavigationController
{
  return 0;
}

@end
