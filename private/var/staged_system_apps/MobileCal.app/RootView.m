@implementation RootView

- (RootView)initWithFrame:(CGRect)a3
{
  RootView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RootView;
  v3 = -[RootView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[RootView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
}

- (void)setMainView:(id)a3
{
  UIView *v5;
  UIView *mainView;
  UIView *v7;

  v5 = (UIView *)a3;
  mainView = self->_mainView;
  if (mainView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](mainView, "removeFromSuperview");
    if (v7)
    {
      -[RootView addSubview:](self, "addSubview:", v7);
      -[RootView sendSubviewToBack:](self, "sendSubviewToBack:", v7);
    }
    -[RootView setNeedsLayout](self, "setNeedsLayout");
    objc_storeStrong((id *)&self->_mainView, a3);
    v5 = v7;
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RootView;
  -[RootView layoutSubviews](&v12, "layoutSubviews");
  -[RootView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RootView mainView](self, "mainView"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (UIView)mainView
{
  return self->_mainView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainView, 0);
}

@end
