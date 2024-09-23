@implementation DebugUI

+ (BOOL)isDebugUrl:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "host"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("debug"));

  return v4;
}

+ (void)initializeDebugUI:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", a1, "showDebugUI");
  objc_msgSend(v5, "_setRequiresSystemGesturesToFail:", 0);
  objc_msgSend(v5, "setNumberOfTouchesRequired:", 2);
  objc_msgSend(v5, "setNumberOfTapsRequired:", 2);
  objc_msgSend(v4, "addGestureRecognizer:", v5);

}

+ (void)showDebugUI
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DebugUtil sharedApplicationIfPossible](DebugUtil, "sharedApplicationIfPossible"));
  if (v2)
  {
    v19 = v2;
    NSLog(CFSTR("Showing Debug UI"));
    v3 = (void *)showDebugUI_navController;
    if (!showDebugUI_navController)
    {
      v4 = objc_alloc((Class)UINavigationController);
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[DebugUI debugViewController](DebugUI, "debugViewController"));
      v6 = objc_msgSend(v4, "initWithRootViewController:", v5);
      v7 = (void *)showDebugUI_navController;
      showDebugUI_navController = (uint64_t)v6;

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      v9 = (char *)objc_msgSend(v8, "userInterfaceIdiom");
      objc_msgSend((id)showDebugUI_navController, "setModalPresentationStyle:", 2 * (v9 == (_BYTE *)&dword_0 + 1));

      v3 = (void *)showDebugUI_navController;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentingViewController"));

    v2 = v19;
    if (!v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "delegate"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "window"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rootViewController"));

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "presentedViewController"));
      if (v14)
      {
        do
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "presentedViewController"));

          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "presentedViewController"));
          v13 = v15;
        }
        while (v16);
      }
      else
      {
        v15 = v13;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[DebugUI createScreenShotOfPresentedViewController:](DebugUI, "createScreenShotOfPresentedViewController:", v15));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[DebugUI debugViewController](DebugUI, "debugViewController"));
      objc_msgSend(v18, "setScreenShotImage:", v17);

      objc_msgSend(v15, "presentViewController:animated:completion:", showDebugUI_navController, 1, 0);
      v2 = v19;
    }
  }

}

+ (id)debugViewController
{
  void *v2;
  IMDebugViewController *v3;
  void *v4;

  v2 = (void *)debugViewController_debugViewController;
  if (!debugViewController_debugViewController)
  {
    v3 = objc_alloc_init(IMDebugViewController);
    v4 = (void *)debugViewController_debugViewController;
    debugViewController_debugViewController = (uint64_t)v3;

    v2 = (void *)debugViewController_debugViewController;
  }
  return v2;
}

+ (id)createScreenShotOfPresentedViewController:(id)a3
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  void *v8;
  double v9;
  CGFloat v10;
  UIImage *ImageFromCurrentImageContext;
  void *v12;
  CGSize v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v8, "scale");
  v10 = v9;
  v14.width = v5;
  v14.height = v7;
  UIGraphicsBeginImageContextWithOptions(v14, 0, v10);

  objc_msgSend(v3, "bounds");
  objc_msgSend(v3, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v12 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();

  return v12;
}

@end
