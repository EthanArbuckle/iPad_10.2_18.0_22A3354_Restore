@implementation UIKBViewControllerBackedKeyView

+ (BOOL)wantsScreenTraits
{
  return 1;
}

- (UIKBViewControllerBackedKeyView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5 screenTraits:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  UIKBViewControllerBackedKeyView *v14;
  UIKBViewControllerBackedKeyView *v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)UIKBViewControllerBackedKeyView;
  v14 = -[UIKBKeyView initWithFrame:keyplane:key:screenTraits:](&v17, sel_initWithFrame_keyplane_key_screenTraits_, a4, a5, v13, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    -[UIView setUserInteractionEnabled:](v14, "setUserInteractionEnabled:", 1);
    -[UIKBKeyView setScreenTraits:](v15, "setScreenTraits:", v13);
  }

  return v15;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_hasAncestorViewController)
    -[UIViewController willMoveToParentViewController:](self->_childViewController, "willMoveToParentViewController:", 0);
  -[UIViewController view](self->_childViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  if (self->_hasAncestorViewController)
    -[UIViewController removeFromParentViewController](self->_childViewController, "removeFromParentViewController");
  v4.receiver = self;
  v4.super_class = (Class)UIKBViewControllerBackedKeyView;
  -[UIKBKeyView dealloc](&v4, sel_dealloc);
}

- (void)setDrawFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIKBViewControllerBackedKeyView;
  -[UIKBKeyView setDrawFrame:](&v4, sel_setDrawFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)addChildViewControllerIfNeeded
{
  UIViewController *v3;
  UIViewController *childViewController;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  if (!self->_childViewController)
  {
    -[UIKBViewControllerBackedKeyView contentViewController](self, "contentViewController");
    v3 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    childViewController = self->_childViewController;
    self->_childViewController = v3;

  }
  -[UIView _viewControllerForAncestor](self, "_viewControllerForAncestor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hasAncestorViewController = v5 != 0;
  -[UIViewController view](self->_childViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9)
  {

  }
  else
  {
    -[UIViewController view](self->_childViewController, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView window](self, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 != v12)
    {
      v27 = v6;
      if (self->_hasAncestorViewController)
        objc_msgSend(v5, "addChildViewController:", self->_childViewController);
      -[UIViewController view](self->_childViewController, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addSubview:](self, "addSubview:", v13);
      objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v13, "topAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self, "topAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintEqualToAnchor:", v25);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v24;
      objc_msgSend(v13, "leadingAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self, "leadingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v22);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = v21;
      objc_msgSend(v13, "trailingAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self, "trailingAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v28[2] = v15;
      objc_msgSend(v13, "bottomAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self, "bottomAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToAnchor:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v28[3] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v19);
      if (self->_hasAncestorViewController)
        -[UIViewController didMoveToParentViewController:](self->_childViewController, "didMoveToParentViewController:", v5);

      v6 = v27;
    }
  }

}

- (void)updateForKeyplane:(id)a3 key:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIKBViewControllerBackedKeyView;
  -[UIKBKeyView updateForKeyplane:key:](&v5, sel_updateForKeyplane_key_, a3, a4);
  -[UIKBViewControllerBackedKeyView addChildViewControllerIfNeeded](self, "addChildViewControllerIfNeeded");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIKBViewControllerBackedKeyView;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[UIKBViewControllerBackedKeyView addChildViewControllerIfNeeded](self, "addChildViewControllerIfNeeded");
}

- (id)contentViewController
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childViewController, 0);
}

@end
