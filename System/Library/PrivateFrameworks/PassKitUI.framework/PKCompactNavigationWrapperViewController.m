@implementation PKCompactNavigationWrapperViewController

- (PKCompactNavigationWrapperViewController)initWithWrappedViewController:(id)a3 type:(int64_t)a4
{

  return 0;
}

- (PKCompactNavigationWrapperViewController)initWithWrappedViewController:(id)a3 parentNavigationController:(id)a4
{
  id v6;
  PKCompactNavigationWrapperViewController *v7;
  PKCompactNavigationWrapperViewController *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)PKCompactNavigationWrapperViewController;
  v7 = -[PKWrapperViewController initWithWrappedViewController:type:](&v10, sel_initWithWrappedViewController_type_, a3, 1);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_parentNavigationController, v6);
    v8->_needsInitialLayout = 1;
  }

  return v8;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKCompactNavigationWrapperViewController;
  -[PKWrapperViewController loadView](&v7, sel_loadView);
  -[PKCompactNavigationWrapperViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizesSubviews:", 0);

  -[PKWrapperViewController wrappedViewController](self, "wrappedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAnchorPoint:", 0.5, 0.0);

}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id WeakRetained;
  double *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  objc_super v27;
  UIEdgeInsets result;

  v6 = a3;
  -[PKWrapperViewController wrappedViewController](self, "wrappedViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 != v6)
  {

LABEL_3:
    v27.receiver = self;
    v27.super_class = (Class)PKCompactNavigationWrapperViewController;
    -[PKCompactNavigationWrapperViewController _edgeInsetsForChildViewController:insetsAreAbsolute:](&v27, sel__edgeInsetsForChildViewController_insetsAreAbsolute_, v6, a4);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    goto LABEL_12;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentNavigationController);

  if (!WeakRetained)
    goto LABEL_3;
  if (a4)
    *a4 = 1;
  v17 = (double *)MEMORY[0x1E0DC49E8];
  v9 = *MEMORY[0x1E0DC49E8];
  -[PKCompactNavigationWrapperViewController viewIfLoaded](self, "viewIfLoaded");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v18, "safeAreaInsets");
    v9 = fmax(v20, v9);
  }
  v13 = v17[2];
  objc_msgSend(WeakRetained, "viewIfLoaded");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v21, "safeAreaInsets");
    v13 = fmax(v22, v13);
  }
  v11 = v17[1];
  v15 = v17[3];

LABEL_12:
  v23 = v9;
  v24 = v11;
  v25 = v13;
  v26 = v15;
  result.right = v26;
  result.bottom = v25;
  result.left = v24;
  result.top = v23;
  return result;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PKCompactNavigationWrapperViewController;
  -[PKWrapperViewController viewWillLayoutSubviews](&v17, sel_viewWillLayoutSubviews);
  -[PKCompactNavigationWrapperViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKWrapperViewController wrappedViewController](self, "wrappedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[PKCompactNavigationWrapperViewController navigationController](self, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "navigationBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  self->_navigationBarHeight = v16;

  -[PKCompactNavigationWrapperViewController _wrappedViewControllerFrameForBounds:navigationBarHeight:](self, "_wrappedViewControllerFrameForBounds:navigationBarHeight:", v7, v9, v11, v13, self->_navigationBarHeight);
  objc_msgSend(v5, "setFrame:");

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKCompactNavigationWrapperViewController;
  -[PKCompactNavigationWrapperViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  if (self->_hasExplicitTargetNavigationHeight)
    self->_needsInitialLayout = 0;
}

- (void)didMoveToParentViewController:(id)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKCompactNavigationWrapperViewController;
  -[PKCompactNavigationWrapperViewController didMoveToParentViewController:](&v6, sel_didMoveToParentViewController_);
  if (a3)
  {
    -[PKCompactNavigationWrapperViewController viewIfLoaded](self, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsLayout");

  }
}

- (void)setTargetNavigationHeight:(double)a3
{
  double navigationBarHeight;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  if (!self->_hasExplicitTargetNavigationHeight)
    goto LABEL_4;
  if (self->_targetNavigationHeight != a3)
    goto LABEL_4;
  navigationBarHeight = self->_navigationBarHeight;
  -[PKCompactNavigationWrapperViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;

  if (navigationBarHeight != v9)
  {
LABEL_4:
    self->_targetNavigationHeight = a3;
    self->_hasExplicitTargetNavigationHeight = 1;
    -[PKCompactNavigationWrapperViewController viewIfLoaded](self, "viewIfLoaded");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNeedsLayout");

  }
}

- (CGRect)_wrappedViewControllerFrameForBounds:(CGRect)a3 navigationBarHeight:(double)a4
{
  CGFloat width;
  CGFloat y;
  CGFloat x;
  char v9;
  double targetNavigationHeight;
  double v11;
  double v12;
  double v13;
  CGRect result;

  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = -[PKWrapperViewController edgesForExtendedLayout](self, "edgesForExtendedLayout", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (self->_hasExplicitTargetNavigationHeight)
  {
    targetNavigationHeight = self->_targetNavigationHeight;
    if ((v9 & 1) == 0)
      targetNavigationHeight = fmax(targetNavigationHeight - a4, 0.0);
  }
  else if ((v9 & 1) != 0)
  {
    targetNavigationHeight = a4;
  }
  else
  {
    targetNavigationHeight = 0.0;
  }
  v11 = x;
  v12 = y;
  v13 = width;
  result.size.height = targetNavigationHeight;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)needsInitialLayout
{
  return self->_needsInitialLayout;
}

- (BOOL)hasExplicitTargetNavigationHeight
{
  return self->_hasExplicitTargetNavigationHeight;
}

- (double)targetNavigationHeight
{
  return self->_targetNavigationHeight;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentNavigationController);
}

@end
