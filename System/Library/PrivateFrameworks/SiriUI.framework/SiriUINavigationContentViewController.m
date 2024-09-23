@implementation SiriUINavigationContentViewController

- (void)loadView
{
  _SiriUINavigationContentView *v3;

  v3 = objc_alloc_init(_SiriUINavigationContentView);
  -[SiriUINavigationContentViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SiriUINavigationContentViewController;
  -[SiriUINavigationContentViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[SiriUINavigationContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (id)title
{
  void *v2;
  void *v3;

  -[SiriUINavigationContentViewController contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)prepareForDrillInAnimation
{
  void *v2;
  id v3;

  -[SiriUINavigationContentViewController _navigationContentView](self, "_navigationContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentView");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "prepareForDrillInAnimation");

}

- (void)setContentViewController:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIViewController *v9;

  v9 = (UIViewController *)a3;
  if (self->_contentViewController != v9)
  {
    -[SiriUINavigationContentViewController contentViewController](self, "contentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromParentViewController");
    -[SiriUINavigationContentViewController _navigationContentView](self, "_navigationContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentView:", 0);

    objc_msgSend(v5, "didMoveToParentViewController:", 0);
    objc_storeStrong((id *)&self->_contentViewController, a3);
    -[SiriUINavigationContentViewController addChildViewController:](self, "addChildViewController:", v9);
    -[SiriUINavigationContentViewController _navigationContentView](self, "_navigationContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](v9, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContentView:", v8);

    -[UIViewController didMoveToParentViewController:](v9, "didMoveToParentViewController:", self);
  }

}

- (BOOL)isContentLayoutEnabled
{
  void *v2;
  char v3;

  -[SiriUINavigationContentViewController _navigationContentView](self, "_navigationContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isContentLayoutEnabled");

  return v3;
}

- (void)setContentLayoutEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SiriUINavigationContentViewController _navigationContentView](self, "_navigationContentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentLayoutEnabled:", v3);

}

- (BOOL)hasContentAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGPoint v35;

  y = a3.y;
  x = a3.x;
  -[SiriUINavigationContentViewController contentPlatterViewController](self, "contentPlatterViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    return 0;
  -[SiriUINavigationContentViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUINavigationContentViewController contentPlatterViewController](self, "contentPlatterViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertPoint:toView:", v9, x, y);
  v11 = v10;
  v13 = v12;

  -[SiriUINavigationContentViewController contentPlatterViewController](self, "contentPlatterViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  if (SiriUIDeviceIsPad())
  {
    v24 = v17;
    v25 = v19;
    v26 = v21;
    v27 = v23;
  }
  else
  {
    -[SiriUINavigationContentViewController _navigationContentView](self, "_navigationContentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "safeAreaInsets");
    v30 = v29;
    v32 = v31;

    v24 = v17 - v30;
    v25 = v19 - v30;
    v33 = -v32 - v30;
    v26 = v21 - v33;
    v27 = v23 - v33;
  }
  v35.x = v11;
  v35.y = v13;
  return CGRectContainsPoint(*(CGRect *)&v24, v35);
}

- (void)contentViewDidUpdateSize
{
  void *v3;
  void *v4;
  id v5;

  -[SiriUINavigationContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

  -[SiriUINavigationContentViewController contentViewController](self, "contentViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (id)_navigationContentView
{
  void *v2;
  void *v3;
  id v4;

  -[SiriUINavigationContentViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (SiriSharedUIContentPlatterViewController)contentPlatterViewController
{
  void *v2;
  void *v3;
  SiriSharedUIContentPlatterViewController *v4;

  -[SiriUINavigationContentViewController contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
