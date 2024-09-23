@implementation UIApplicationRotationFollowingControllerNoTouches

- (void)loadView
{
  UIApplicationRotationFollowingControllerView *v3;

  v3 = objc_alloc_init(UIApplicationRotationFollowingControllerView);
  -[UIViewController setView:](self, "setView:", v3);

}

- (void)_prepareForRotationToOrientation:(int64_t)a3 duration:(double)a4
{
  void *v7;
  id v8;

  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0)
  {
    -[UIViewController view](self, "view");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController window:willRotateToInterfaceOrientation:duration:](self, "window:willRotateToInterfaceOrientation:duration:", v7, a3, a4);

  }
}

- (void)_rotateToOrientation:(int64_t)a3 duration:(double)a4
{
  char v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;

  v7 = objc_msgSend((id)UIApp, "_isSpringBoard");
  -[UIViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v7 & 1) != 0)
  {
    v11 = objc_msgSend(v9, "_isTextEffectsWindow");

    if (!v11)
      return;
    -[UIViewController view](self, "view");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateForOrientation:", a3);
  }
  else
  {
    -[UIViewController window:willAnimateRotationToInterfaceOrientation:duration:](self, "window:willAnimateRotationToInterfaceOrientation:duration:", v9, a3, a4);

    -[UIViewController view](self, "view");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[UIViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", v14, v16, v18, v20);
  }

}

- (void)_finishRotationFromInterfaceOrientation:(int64_t)a3
{
  void *v5;
  id v6;

  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0)
  {
    -[UIViewController view](self, "view");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController window:didRotateFromInterfaceOrientation:](self, "window:didRotateFromInterfaceOrientation:", v5, a3);

  }
}

@end
