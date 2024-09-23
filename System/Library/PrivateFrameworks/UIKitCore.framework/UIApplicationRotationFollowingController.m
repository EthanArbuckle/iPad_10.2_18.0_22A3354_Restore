@implementation UIApplicationRotationFollowingController

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  unint64_t v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  unint64_t v11;
  char v12;

  -[UIApplicationRotationFollowingController _topMostWindow](self, "_topMostWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController _safePrimaryViewControllerForAutorotationBelowWindow:](self, "_safePrimaryViewControllerForAutorotationBelowWindow:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_overrideInterfaceOrientationMechanics");
  if (v5)
  {
    v6 = 1 << v5;
LABEL_13:
    v7 = v6;
    goto LABEL_14;
  }
  if (!objc_msgSend(v4, "shouldAutorotate")
    || (v7 = objc_msgSend(v4, "__supportedInterfaceOrientations")) == 0)
  {
    if ((objc_msgSend((id)UIApp, "isFrontBoard") & 1) != 0
      || (objc_msgSend(v3, "windowScene"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v8,
          (isKindOfClass & 1) == 0))
    {
      v11 = objc_msgSend((id)UIApp, "_frontMostAppOrientation");
    }
    else
    {
      objc_msgSend(v3, "windowScene");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "interfaceOrientation");

    }
    if (v11 <= 1)
      v12 = 1;
    else
      v12 = v11;
    v6 = 1 << v12;
    goto LABEL_13;
  }
LABEL_14:

  return v7;
}

- (id)_topMostWindow
{
  void *v2;
  void *v3;

  -[UIViewController _window](self, "_window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "_topMostWindow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)shouldAutorotate
{
  void *v3;
  void *v4;
  char v5;

  -[UIViewController _window](self, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_isHostedInAnotherProcess"))
  {
    -[UIViewController _window](self, "_window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_isTextEffectsWindowHosting");

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (int64_t)_preferredInterfaceOrientationGivenCurrentOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  int64_t v11;
  void *v12;
  char isKindOfClass;
  id v14;
  objc_super v16;
  objc_super v17;

  -[UIApplicationRotationFollowingController _topMostWindow](self, "_topMostWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController _safeWindowForAutorotationBelowWindow:](self, "_safeWindowForAutorotationBelowWindow:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rootViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_safeViewControllerForSupportedInterfaceOrientationsWithDismissCheck:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v14 = -[UIViewController _preferredInterfaceOrientationGivenCurrentOrientation:](&v16, sel__preferredInterfaceOrientationGivenCurrentOrientation_, a3, self, UIApplicationRotationFollowingController, v17.receiver, v17.super_class);
LABEL_10:
    v11 = (int64_t)v14;
    goto LABEL_11;
  }
  -[UIViewController _window](self, "_window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_isTextEffectsWindowHosting");

  if ((v10 & 1) != 0 || (v11 = objc_msgSend(v8, "_overrideInterfaceOrientationMechanics")) == 0)
  {
    if ((objc_msgSend(v8, "shouldAutorotate") & 1) != 0
      || (-[UIViewController _window](self, "_window"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v12,
          (isKindOfClass & 1) == 0))
    {
      v14 = (id)objc_msgSend(v8, "_preferredInterfaceOrientationGivenCurrentOrientation:", a3);
    }
    else
    {
      v14 = -[UIViewController _preferredInterfaceOrientationGivenCurrentOrientation:](&v17, sel__preferredInterfaceOrientationGivenCurrentOrientation_, a3, v16.receiver, v16.super_class, self, UIApplicationRotationFollowingController);
    }
    goto LABEL_10;
  }
LABEL_11:

  return v11;
}

- (UIApplicationRotationFollowingController)initWithNibName:(id)a3 bundle:(id)a4
{
  UIApplicationRotationFollowingController *v4;
  UIApplicationRotationFollowingController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIApplicationRotationFollowingController;
  v4 = -[UIViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[UIViewController _setIgnoreAppSupportedOrientations:](v4, "_setIgnoreAppSupportedOrientations:", 1);
  return v5;
}

- (void)window:(id)a3 setupWithInterfaceOrientation:(int64_t)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  int v15;
  double v16;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UIApplicationRotationFollowingController;
  -[UIViewController window:setupWithInterfaceOrientation:](&v17, sel_window_setupWithInterfaceOrientation_, v6, a4);
  if (-[UIApplicationRotationFollowingController sizesWindowToScene](self, "sizesWindowToScene"))
  {
    objc_msgSend(v6, "windowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_referenceBounds");
    v9 = v8;
    v11 = v10;
  }
  else
  {
    objc_msgSend(v6, "screen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fixedCoordinateSpace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v9 = v13;
    v11 = v14;

  }
  if ((unint64_t)(a4 - 3) <= 1)
  {
    v15 = objc_msgSend((id)objc_opt_class(), "_transformLayerRotationsAreEnabled");
    if (v15)
      v16 = v9;
    else
      v16 = v11;
    if (v15)
      v9 = v11;
    v11 = v16;
  }
  objc_msgSend(v6, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v9, v11);

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  char v3;
  _BOOL4 v5;

  v3 = a3;
  v5 = -[UIApplicationRotationFollowingController shouldAutorotate](self, "shouldAutorotate");
  if (v5)
    LOBYTE(v5) = (-[UIViewController __supportedInterfaceOrientations](self, "__supportedInterfaceOrientations") & (1 << v3)) != 0;
  return v5;
}

- (id)__autorotationSanityCheckObjectFromSource:(id)a3 selector:(SEL)a4
{
  id v6;
  void *v7;

  v6 = a3;
  NSStringFromSelector(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Rotation error: %@ %@ returned a UIApplicationRotationFollowingController %@"), v6, v7, self);

  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)sizesWindowToScene
{
  return self->_sizesWindowToScene;
}

- (void)setSizesWindowToScene:(BOOL)a3
{
  self->_sizesWindowToScene = a3;
}

@end
