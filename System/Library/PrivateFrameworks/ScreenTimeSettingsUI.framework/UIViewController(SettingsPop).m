@implementation UIViewController(SettingsPop)

- (void)popViewControllerAnimated:()SettingsPop
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  objc_msgSend(a1, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  objc_msgSend(a1, "navigationController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(a1, "parentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v12, "popToViewController:animated:", v9, a3);

  }
  else
  {
    v11 = (id)objc_msgSend(v12, "popToViewController:animated:", a1, a3);
  }

}

@end
