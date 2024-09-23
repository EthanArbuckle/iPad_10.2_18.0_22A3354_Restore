@implementation _UIAlertControllerShimPresenterWindow

- (_UIAlertControllerShimPresenterWindow)init
{
  _UIAlertControllerShimPresenterWindow *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIAlertControllerShimPresenterWindow;
  v2 = -[UIApplicationRotationFollowingWindow init](&v7, sel_init);
  if (v2)
  {
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bounds");
      -[UIWindow setFrame:](v2, "setFrame:");

    }
    -[UIView setOpaque:](v2, "setOpaque:", 0);
    +[UIColor clearColor](UIColor, "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v2, "setBackgroundColor:", v4);

    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindow setScreen:](v2, "setScreen:", v5);

    -[UIWindow setWindowLevel:](v2, "setWindowLevel:", 2000.0);
    -[UIWindow setHidden:](v2, "setHidden:", 1);
  }
  return v2;
}

- (_UIAlertControllerShimPresenterWindow)initWithWindowScene:(id)a3
{
  _UIAlertControllerShimPresenterWindow *v3;
  _UIAlertControllerShimPresenterWindow *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIAlertControllerShimPresenterWindow;
  v3 = -[UIApplicationRotationFollowingWindow initWithWindowScene:](&v7, sel_initWithWindowScene_, a3);
  v4 = v3;
  if (v3)
  {
    -[UIView setOpaque:](v3, "setOpaque:", 0);
    +[UIColor clearColor](UIColor, "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[UIWindow setWindowLevel:](v4, "setWindowLevel:", 2000.0);
    -[UIWindow setHidden:](v4, "setHidden:", 1);
  }
  return v4;
}

- (id)_presentationViewController
{
  void *v3;
  UIApplicationRotationFollowingController *v4;

  -[UIWindow rootViewController](self, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(UIApplicationRotationFollowingController);
    -[UIApplicationRotationFollowingController setSizesWindowToScene:](v4, "setSizesWindowToScene:", 1);
    -[UIWindow setRootViewController:](self, "setRootViewController:", v4);

  }
  return -[UIWindow rootViewController](self, "rootViewController");
}

- (void)presentAlertController:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL8 v6;
  id v9;
  void (**v10)(id, BOOL);
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  _QWORD v20[4];
  void (**v21)(id, BOOL);

  v6 = a4;
  v9 = a3;
  v10 = (void (**)(id, BOOL))a5;
  -[_UIAlertControllerShimPresenterWindow _presentationViewController](self, "_presentationViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentedViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v11, "presentedViewController");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13 != v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIAlertControllerShimPresenter.m"), 363, CFSTR("Multiple alert controllers assigned to the same window %@"), self);

      if (!v10)
        goto LABEL_8;
      goto LABEL_4;
    }
    if (v10)
    {
LABEL_4:
      objc_msgSend(v11, "presentedViewController");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v10[2](v10, v14 == v9);

    }
  }
  else
  {
    +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "windowLevel");
    v17 = v16 + 1.0;

    -[UIWindow windowLevel](self, "windowLevel");
    if (v17 >= v18)
      v18 = v17;
    -[UIWindow setWindowLevel:](self, "setWindowLevel:", v18);
    -[UIWindow makeKeyWindow](self, "makeKeyWindow");
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __89___UIAlertControllerShimPresenterWindow_presentAlertController_animated_completionBlock___block_invoke;
    v20[3] = &unk_1E16B1BF8;
    v21 = v10;
    objc_msgSend(v11, "presentViewController:animated:completion:", v9, v6, v20);

  }
LABEL_8:

}

- (UIAlertController)alertController
{
  void *v2;
  void *v3;

  -[_UIAlertControllerShimPresenterWindow _presentationViewController](self, "_presentationViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIAlertController *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertController, 0);
}

@end
