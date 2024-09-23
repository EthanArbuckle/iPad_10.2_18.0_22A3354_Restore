@implementation ICTrailingSidebarContainerViewController

- (ICTrailingSidebarContainerViewController)init
{
  ICTrailingSidebarContainerViewController *v2;
  ICTrailingSidebarContainerViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICTrailingSidebarContainerViewController;
  v2 = -[ICTrailingSidebarContainerViewController initWithNibName:bundle:](&v5, "initWithNibName:bundle:", 0, 0);
  v3 = v2;
  if (v2)
  {
    v2->_sidebarHidden = 1;
    v2->_resizesWindow = 1;
    v2->_preferredSidebarWidth = 300.0;
    -[ICTrailingSidebarContainerViewController createLayout](v2, "createLayout");
  }
  return v3;
}

- (void)setContentViewController:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[UIViewController willMoveToParentViewController:](self->_contentViewController, "willMoveToParentViewController:", 0);
  -[UIViewController removeFromParentViewController](self->_contentViewController, "removeFromParentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_contentViewController, "view"));
  objc_msgSend(v5, "removeFromSuperview");

  objc_storeStrong((id *)&self->_contentViewController, a3);
  if (v9)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICTrailingSidebarContainerViewController contentContainerView](self, "contentContainerView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
    objc_msgSend(v6, "addSubview:", v7);

    -[ICTrailingSidebarContainerViewController addChildViewController:](self, "addChildViewController:", v9);
    objc_msgSend(v9, "didMoveToParentViewController:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
    objc_msgSend(v8, "ic_addConstraintsToFillSuperview");

  }
}

- (void)setSidebarViewController:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[UIViewController willMoveToParentViewController:](self->_sidebarViewController, "willMoveToParentViewController:", 0);
  -[UIViewController removeFromParentViewController](self->_sidebarViewController, "removeFromParentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_sidebarViewController, "view"));
  objc_msgSend(v5, "removeFromSuperview");

  objc_storeStrong((id *)&self->_sidebarViewController, a3);
  if (v9)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICTrailingSidebarContainerViewController sidebarContainerView](self, "sidebarContainerView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
    objc_msgSend(v6, "addSubview:", v7);

    -[ICTrailingSidebarContainerViewController addChildViewController:](self, "addChildViewController:", v9);
    objc_msgSend(v9, "didMoveToParentViewController:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
    objc_msgSend(v8, "ic_addConstraintsToFillSuperview");

  }
}

- (void)setSidebarHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  if (self->_sidebarHidden != a3)
  {
    v3 = a3;
    -[ICTrailingSidebarContainerViewController setTransitioning:](self, "setTransitioning:", 1);
    self->_sidebarHidden = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICTrailingSidebarContainerViewController sidebarContainerView](self, "sidebarContainerView"));
    objc_msgSend(v5, "setHidden:", v3);

    v6 = 0.0;
    if (!v3)
      -[ICTrailingSidebarContainerViewController preferredSidebarWidth](self, "preferredSidebarWidth", 0.0);
    -[ICTrailingSidebarContainerViewController setSidebarWidth:](self, "setSidebarWidth:", v6);
    -[ICTrailingSidebarContainerViewController sidebarWidth](self, "sidebarWidth");
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICTrailingSidebarContainerViewController sidebarWidthConstraint](self, "sidebarWidthConstraint"));
    objc_msgSend(v9, "setConstant:", v8);

    -[ICTrailingSidebarContainerViewController setTransitioning:](self, "setTransitioning:", 0);
  }
}

- (UIView)contentContainerView
{
  UIView *contentContainerView;
  UIView *v4;
  UIView *v5;

  contentContainerView = self->_contentContainerView;
  if (!contentContainerView)
  {
    v4 = (UIView *)objc_alloc_init((Class)UIView);
    v5 = self->_contentContainerView;
    self->_contentContainerView = v4;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    contentContainerView = self->_contentContainerView;
  }
  return contentContainerView;
}

- (UIView)sidebarContainerView
{
  UIView *sidebarContainerView;
  UIView *v4;
  UIView *v5;

  sidebarContainerView = self->_sidebarContainerView;
  if (!sidebarContainerView)
  {
    v4 = (UIView *)objc_alloc_init((Class)UIView);
    v5 = self->_sidebarContainerView;
    self->_sidebarContainerView = v4;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_sidebarContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setHidden:](self->_sidebarContainerView, "setHidden:", -[ICTrailingSidebarContainerViewController isSidebarHidden](self, "isSidebarHidden"));
    sidebarContainerView = self->_sidebarContainerView;
  }
  return sidebarContainerView;
}

- (UIStackView)stackView
{
  UIStackView *stackView;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UIStackView *v8;
  UIStackView *v9;
  _QWORD v11[2];

  stackView = self->_stackView;
  if (!stackView)
  {
    v4 = objc_alloc((Class)UIStackView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICTrailingSidebarContainerViewController contentContainerView](self, "contentContainerView"));
    v11[0] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICTrailingSidebarContainerViewController sidebarContainerView](self, "sidebarContainerView"));
    v11[1] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
    v8 = (UIStackView *)objc_msgSend(v4, "initWithArrangedSubviews:", v7);
    v9 = self->_stackView;
    self->_stackView = v8;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_sidebarContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setSpacing:](self->_stackView, "setSpacing:", 9.0);
    stackView = self->_stackView;
  }
  return stackView;
}

- (void)createLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *sidebarWidthConstraint;
  void *v10;
  NSLayoutConstraint *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICTrailingSidebarContainerViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICTrailingSidebarContainerViewController stackView](self, "stackView"));
  objc_msgSend(v3, "addSubview:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICTrailingSidebarContainerViewController stackView](self, "stackView"));
  objc_msgSend(v5, "ic_addConstraintsToFillSuperview");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICTrailingSidebarContainerViewController sidebarContainerView](self, "sidebarContainerView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "widthAnchor"));
  -[ICTrailingSidebarContainerViewController sidebarWidth](self, "sidebarWidth");
  v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToConstant:"));
  sidebarWidthConstraint = self->_sidebarWidthConstraint;
  self->_sidebarWidthConstraint = v8;

  v11 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v10);

}

- (void)setPreferredSidebarWidth:(double)a3
{
  double v4;
  double v5;
  id v6;

  self->_preferredSidebarWidth = a3;
  -[ICTrailingSidebarContainerViewController sidebarWidth](self, "sidebarWidth");
  v5 = v4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ICTrailingSidebarContainerViewController sidebarWidthConstraint](self, "sidebarWidthConstraint"));
  objc_msgSend(v6, "setConstant:", v5);

}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (UIViewController)sidebarViewController
{
  return self->_sidebarViewController;
}

- (BOOL)isSidebarHidden
{
  return self->_sidebarHidden;
}

- (double)preferredSidebarWidth
{
  return self->_preferredSidebarWidth;
}

- (BOOL)resizesWindow
{
  return self->_resizesWindow;
}

- (void)setResizesWindow:(BOOL)a3
{
  self->_resizesWindow = a3;
}

- (double)sidebarWidth
{
  return self->_sidebarWidth;
}

- (void)setSidebarWidth:(double)a3
{
  self->_sidebarWidth = a3;
}

- (NSLayoutConstraint)sidebarWidthConstraint
{
  return self->_sidebarWidthConstraint;
}

- (void)setSidebarWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_sidebarWidthConstraint, a3);
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sidebarWidthConstraint, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_sidebarContainerView, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_sidebarViewController, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
