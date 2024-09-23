@implementation _TVModalPageBezelViewController

- (_TVModalPageBezelViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  _TVModalPageBezelViewController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVModalPageBezelViewController;
  result = -[_TVModalPageBezelViewController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, a3, a4);
  if (result)
    result->_contentSize = (CGSize)xmmword_222E77270;
  return result;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_TVModalPageBezelViewController;
  -[_TVModalPageBezelViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[UIViewController view](self->_contentViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", self->_bezelCornerRadius);

  -[UIViewController view](self->_contentViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_bezelBackgroundColor)
  {
    objc_msgSend(v5, "setBackgroundColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v7);

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  v15.receiver = self;
  v15.super_class = (Class)_TVModalPageBezelViewController;
  -[_TVModalPageBezelViewController viewDidLayoutSubviews](&v15, sel_viewDidLayoutSubviews);
  -[_TVModalPageBezelViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIViewController view](self->_contentViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16.origin.x = v5;
  v16.origin.y = v7;
  v16.size.width = v9;
  v16.size.height = v11;
  CGRectGetWidth(v16);
  v17.origin.x = v5;
  v17.origin.y = v7;
  v17.size.width = v9;
  v17.size.height = v11;
  CGRectGetHeight(v17);
  -[_TVModalPageBezelViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  UIRectCenteredIntegralRect();
  objc_msgSend(v12, "setFrame:");

  -[UIViewController view](self->_contentViewController, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAutoresizingMask:", 45);

}

- (void)setBezelCornerRadius:(double)a3
{
  void *v4;
  id v5;

  if (vabdd_f64(self->_bezelCornerRadius, a3) > 0.00000011920929)
  {
    self->_bezelCornerRadius = a3;
    -[UIViewController view](self->_contentViewController, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCornerRadius:", self->_bezelCornerRadius);

  }
}

- (void)setBezelBackgroundColor:(id)a3
{
  id *p_bezelBackgroundColor;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  p_bezelBackgroundColor = (id *)&self->_bezelBackgroundColor;
  v9 = a3;
  if ((objc_msgSend(*p_bezelBackgroundColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_bezelBackgroundColor, a3);
    -[UIViewController view](self->_contentViewController, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (*p_bezelBackgroundColor)
    {
      objc_msgSend(v6, "setBackgroundColor:");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBackgroundColor:", v8);

    }
  }

}

- (void)setContentSize:(CGSize)a3
{
  id v4;

  if (a3.width <= 0.0)
    a3.width = 524.0;
  if (a3.height <= 0.0)
    a3.height = 547.0;
  if (self->_contentSize.width != a3.width || self->_contentSize.height != a3.height)
  {
    self->_contentSize = a3;
    -[_TVModalPageBezelViewController view](self, "view");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

  }
}

- (void)setContentViewController:(id)a3
{
  UIViewController *v5;
  UIViewController **p_contentViewController;
  UIViewController *contentViewController;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIViewController *v12;

  v5 = (UIViewController *)a3;
  p_contentViewController = &self->_contentViewController;
  contentViewController = self->_contentViewController;
  v12 = v5;
  if (contentViewController != v5)
  {
    if (contentViewController)
    {
      -[UIViewController willMoveToParentViewController:](contentViewController, "willMoveToParentViewController:", 0);
      -[UIViewController view](*p_contentViewController, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeFromSuperview");

      -[UIViewController removeFromParentViewController](*p_contentViewController, "removeFromParentViewController");
    }
    objc_storeStrong((id *)&self->_contentViewController, a3);
    if (*p_contentViewController)
    {
      -[_TVModalPageBezelViewController addChildViewController:](self, "addChildViewController:");
      -[_TVModalPageBezelViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](*p_contentViewController, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", v10);

      -[UIViewController didMoveToParentViewController:](*p_contentViewController, "didMoveToParentViewController:", self);
      -[_TVModalPageBezelViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setNeedsLayout");

    }
  }

}

- (double)bezelCornerRadius
{
  return self->_bezelCornerRadius;
}

- (UIColor)bezelBackgroundColor
{
  return self->_bezelBackgroundColor;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_bezelBackgroundColor, 0);
}

@end
