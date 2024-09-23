@implementation _UITabBarControllerVisualStyle_CarPlay

- (int64_t)tabBarPosition
{
  return 2;
}

- (unint64_t)defaultMaxItems
{
  return 5;
}

- (BOOL)supportsFocusGestures
{
  void *v2;
  void *v3;
  BOOL v4;

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (objc_msgSend(v3, "interactionModel") & 2) != 0 || objc_msgSend(v3, "primaryInteractionModel") == 8;
  return v4;
}

- (BOOL)updatesTabBarFocusHeadingOnChange
{
  return 1;
}

- (void)updateGestureRecognizers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  UITapGestureRecognizer *nudgeLeftGestureRecognizer;
  UITapGestureRecognizer *v9;
  UITapGestureRecognizer *v10;
  UITapGestureRecognizer *v11;
  UITapGestureRecognizer *nudgeRightGestureRecognizer;
  UITapGestureRecognizer *v13;
  UITapGestureRecognizer *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_UITabBarControllerVisualStyle_CarPlay;
  -[_UITabBarControllerVisualStyle updateGestureRecognizers](&v15, sel_updateGestureRecognizers);
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_UITabBarControllerVisualStyle_CarPlay supportsFocusGestures](self, "supportsFocusGestures");
  nudgeLeftGestureRecognizer = self->_nudgeLeftGestureRecognizer;
  if (v7)
  {
    if (!nudgeLeftGestureRecognizer)
    {
      v9 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__performLeftGesture_);
      v10 = self->_nudgeLeftGestureRecognizer;
      self->_nudgeLeftGestureRecognizer = v9;

      -[UIGestureRecognizer setDelegate:](self->_nudgeLeftGestureRecognizer, "setDelegate:", self);
      -[UITapGestureRecognizer setAllowedPressTypes:](self->_nudgeLeftGestureRecognizer, "setAllowedPressTypes:", &unk_1E1A94E68);
      objc_msgSend(v4, "addGestureRecognizer:", self->_nudgeLeftGestureRecognizer);
      v11 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__performRightGesture_);
      nudgeRightGestureRecognizer = self->_nudgeRightGestureRecognizer;
      self->_nudgeRightGestureRecognizer = v11;

      -[UIGestureRecognizer setDelegate:](self->_nudgeRightGestureRecognizer, "setDelegate:", self);
      -[UITapGestureRecognizer setAllowedPressTypes:](self->_nudgeRightGestureRecognizer, "setAllowedPressTypes:", &unk_1E1A94E80);
      objc_msgSend(v4, "addGestureRecognizer:", self->_nudgeRightGestureRecognizer);
    }
  }
  else if (nudgeLeftGestureRecognizer)
  {
    objc_msgSend(v4, "removeGestureRecognizer:");
    v13 = self->_nudgeLeftGestureRecognizer;
    self->_nudgeLeftGestureRecognizer = 0;

    objc_msgSend(v4, "removeGestureRecognizer:", self->_nudgeRightGestureRecognizer);
    v14 = self->_nudgeRightGestureRecognizer;
    self->_nudgeRightGestureRecognizer = 0;

  }
}

- (BOOL)shouldSuppressPresses:(id)a3 withEvent:(id)a4
{
  if (self->_nudgeLeftGestureRecognizer)
    return _UIPressesContainsPressTypes(a3, &unk_1E1A94E98);
  else
    return 0;
}

- (void)_performLeftGesture:(id)a3
{
  id v3;

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_performFocusGesture:", 4);

}

- (void)_performRightGesture:(id)a3
{
  id v3;

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_performFocusGesture:", 8);

}

- (CGRect)adjustedTabBarFrame:(CGRect)a3
{
  CGFloat height;
  double width;
  CGFloat y;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController", a3.origin.x);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeAreaInsets");
  v9 = v8;
  v11 = v10;

  v12 = width - v9 - v11;
  v13 = v9;
  v14 = y;
  v15 = height;
  result.size.height = v15;
  result.size.width = v12;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)defaultAnimatorForFromViewController:(id)a3 toViewController:(id)a4
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nudgeRightGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_nudgeLeftGestureRecognizer, 0);
}

@end
