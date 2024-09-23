@implementation UIAccessibilityMathNavigationBar

- (UIAccessibilityMathNavigationBar)initWithFrame:(CGRect)a3
{
  UIAccessibilityMathNavigationBar *v3;
  UIAccessibilityMathNavigationBar *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  CGSize v11;

  v10.receiver = self;
  v10.super_class = (Class)UIAccessibilityMathNavigationBar;
  v3 = -[UIAccessibilityMathNavigationBar initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIAccessibilityMathNavigationBar _setHidesShadow:](v3, "_setHidesShadow:", 1);
    v11.width = 1.0;
    v11.height = 1.0;
    UIGraphicsBeginImageContext(v11);
    UIGraphicsGetImageFromCurrentImageContext();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resizableImageWithCapInsets:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    UIGraphicsEndImageContext();
    -[UIAccessibilityMathNavigationBar setBackgroundImage:forBarMetrics:](v4, "setBackgroundImage:forBarMetrics:", v6, 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityMathNavigationBar setBackgroundColor:](v4, "setBackgroundColor:", v7);

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityMathNavigationBar setTintColor:](v4, "setTintColor:", v8);

    -[UIAccessibilityMathNavigationBar setTranslucent:](v4, "setTranslucent:", 1);
  }
  return v4;
}

- (BOOL)accessibilityPerformEscape
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityPresentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    _AXAssert();
  objc_msgSend(v3, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = v5;
    _AXAssert();
    goto LABEL_7;
  }
  objc_msgSend(v5, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 == 1)
  {
LABEL_7:
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0, v10);
    goto LABEL_8;
  }
  v8 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);
LABEL_8:

  return 1;
}

- (void)_pushNavigationItem:(id)a3 transition:(int)a4
{
  uint64_t v4;
  objc_super v5;

  if (a4)
    v4 = 6;
  else
    v4 = 0;
  v5.receiver = self;
  v5.super_class = (Class)UIAccessibilityMathNavigationBar;
  -[UIAccessibilityMathNavigationBar _pushNavigationItem:transition:](&v5, sel__pushNavigationItem_transition_, a3, v4);
}

- (id)_popNavigationItemWithTransition:(int)a3
{
  uint64_t v3;
  objc_super v5;

  if (a3)
    v3 = 6;
  else
    v3 = 0;
  v5.receiver = self;
  v5.super_class = (Class)UIAccessibilityMathNavigationBar;
  -[UIAccessibilityMathNavigationBar _popNavigationItemWithTransition:](&v5, sel__popNavigationItemWithTransition_, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end
