@implementation PHFrecentNavigationController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  _QWORD v16[2];

  v15.receiver = self;
  v15.super_class = (Class)PHFrecentNavigationController;
  -[PHFrecentNavigationController viewDidLoad](&v15, "viewDidLoad");
  -[PHFrecentNavigationController _setClipUnderlapWhileTransitioning:](self, "_setClipUnderlapWhileTransitioning:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHFrecentNavigationController navigationBar](self, "navigationBar"));
  objc_msgSend(v3, "setBarStyle:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHFrecentNavigationController navigationBar](self, "navigationBar"));
  objc_msgSend(v4, "setTranslucent:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHFrecentNavigationController navigationBar](self, "navigationBar"));
  objc_msgSend(v5, "_setHidesShadow:", 1);

  v6 = objc_alloc_init((Class)UIImage);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHFrecentNavigationController navigationBar](self, "navigationBar"));
  objc_msgSend(v7, "setBackgroundImage:forBarPosition:barMetrics:", v6, 0, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 2));
  v16[0] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "rootViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "backdropView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "captureGroup"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIVisualEffect _effectCopyingFromCaptureGroup:](UIVisualEffect, "_effectCopyingFromCaptureGroup:", v11));
  v16[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHFrecentNavigationController navigationBar](self, "navigationBar"));
  objc_msgSend(v14, "setBackgroundEffects:", v13);

}

@end
