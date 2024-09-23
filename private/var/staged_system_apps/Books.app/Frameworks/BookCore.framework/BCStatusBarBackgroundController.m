@implementation BCStatusBarBackgroundController

- (id)windowScene
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCStatusBarBackgroundController window](self, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "windowScene"));

  return v3;
}

- (CGRect)_statusBarFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCStatusBarBackgroundController windowScene](self, "windowScene"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "statusBarManager"));
  objc_msgSend(v4, "statusBarFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCStatusBarBackgroundController window](self, "window"));
  objc_msgSend(v11, "safeAreaInsets");
  v13 = v12;

  v14 = v6;
  v15 = v8;
  v16 = v10;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)_updateParentViewOfCardStackBackgroundView
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCStatusBarBackgroundController window](self, "window"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootViewController"));

  v4 = objc_msgSend(v6, "bc_firstVisibleChildViewControllerOfClass:includePresented:", objc_opt_class(BCCardStackViewController), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[BCStatusBarBackgroundController updateParentViewOfCardStackBackgroundViewWithParentViewController:](self, "updateParentViewOfCardStackBackgroundViewWithParentViewController:", v5);

}

- (UIView)cardStackBackgroundView
{
  UIView *cardStackBackgroundView;
  id v4;
  UIView *v5;
  void *v6;
  void *v7;
  UIView *v8;
  void *v10;

  cardStackBackgroundView = self->_cardStackBackgroundView;
  if (!cardStackBackgroundView)
  {
    v4 = objc_alloc((Class)UIVisualEffectView);
    -[BCStatusBarBackgroundController _statusBarFrame](self, "_statusBarFrame");
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 1100));
    v10 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
    -[UIView setBackgroundEffects:](v5, "setBackgroundEffects:", v7);

    v8 = self->_cardStackBackgroundView;
    self->_cardStackBackgroundView = v5;

    cardStackBackgroundView = self->_cardStackBackgroundView;
  }
  return cardStackBackgroundView;
}

+ (id)backgroundControllerForViewController:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "im_ancestorConformingToProtocol:", &OBJC_PROTOCOL___BCStatusBarBackgroundControllerProviding));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "statusBarBackgroundController"));

  return v4;
}

+ (id)backgroundControllerForWindow:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "im_ancestorConformingToProtocol:", &OBJC_PROTOCOL___BCStatusBarBackgroundControllerProviding));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "statusBarBackgroundController"));

  return v4;
}

- (BCStatusBarBackgroundController)initWithWindow:(id)a3
{
  id v4;
  BCStatusBarBackgroundController *v5;
  BCStatusBarBackgroundController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BCStatusBarBackgroundController;
  v5 = -[BCStatusBarBackgroundController init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_window, v4);

  return v6;
}

- (double)opacity
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCStatusBarBackgroundController effectiveBackgroundView](self, "effectiveBackgroundView"));
  objc_msgSend(v2, "alpha");
  v4 = v3;

  return v4;
}

- (void)setOpacity:(double)a3
{
  -[BCStatusBarBackgroundController setOpacity:animated:](self, "setOpacity:animated:", 0, a3);
}

- (void)setOpacity:(double)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  _QWORD *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  BCStatusBarBackgroundController *v12;
  double v13;

  v4 = a4;
  -[BCStatusBarBackgroundController _updateParentViewOfCardStackBackgroundView](self, "_updateParentViewOfCardStackBackgroundView");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_AD208;
  v10[3] = &unk_28C9C8;
  v13 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BCStatusBarBackgroundController effectiveBackgroundView](self, "effectiveBackgroundView"));
  v11 = v7;
  v12 = self;
  v8 = objc_retainBlock(v10);
  v9 = v8;
  if (v4)
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v8, 0.2);
  else
    ((void (*)(_QWORD *))v8[2])(v8);

}

- (void)setup
{
  -[BCStatusBarBackgroundController setOpacity:](self, "setOpacity:", 0.0);
}

- (void)updateParentViewOfCardStackBackgroundViewWithParentViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCStatusBarBackgroundController cardStackBackgroundView](self, "cardStackBackgroundView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));

  if (v5 != v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
    objc_msgSend(v7, "addSubview:", v4);

  }
}

- (UIWindow)window
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_window);
}

- (void)setWindow:(id)a3
{
  objc_storeWeak((id *)&self->_window, a3);
}

- (BOOL)useCardStack
{
  return self->_useCardStack;
}

- (void)setUseCardStack:(BOOL)a3
{
  self->_useCardStack = a3;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_cardStackBackgroundView, 0);
}

@end
