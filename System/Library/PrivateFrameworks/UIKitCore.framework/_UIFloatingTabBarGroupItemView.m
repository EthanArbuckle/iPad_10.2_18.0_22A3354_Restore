@implementation _UIFloatingTabBarGroupItemView

- (_UIFloatingTabBarGroupItemView)initWithImage:(id)a3 needsPunchOut:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _UIFloatingTabBarGroupItemView *v7;
  _UIFloatingTabBarGroupItemView *v8;
  void *v9;
  void *v10;
  UIImageView *v11;
  void *v12;
  void *v13;
  UIView *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  UIView *punchOutView;
  objc_super v20;

  v4 = a4;
  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_UIFloatingTabBarGroupItemView;
  v7 = -[UIView initWithFrame:](&v20, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v8 = v7;
  if (v7)
  {
    -[UIView traitCollection](v7, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _UIFloatingTabBarGetPlatformMetrics(objc_msgSend(v9, "userInterfaceIdiom"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v6);
    -[UIImageView setContentMode:](v11, "setContentMode:", 1);
    objc_msgSend(v10, "symbolConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v11, "setPreferredSymbolConfiguration:", v12);

    +[UIColor systemFillColor](UIColor, "systemFillColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v11, "setBackgroundColor:", v13);

    -[UIView setClipsToBounds:](v11, "setClipsToBounds:", 1);
    -[UIView addSubview:](v8, "addSubview:", v11);
    objc_storeStrong((id *)&v8->_imageView, v11);
    if (v4)
    {
      v14 = objc_alloc_init(UIView);
      v15 = *MEMORY[0x1E0CD2C50];
      -[UIView layer](v14, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setCompositingFilter:", v15);

      +[UIColor blackColor](UIColor, "blackColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v14, "setBackgroundColor:", v17);

      -[UIView addSubview:](v11, "addSubview:", v14);
      punchOutView = v8->_punchOutView;
      v8->_punchOutView = v14;

    }
  }

  return v8;
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  objc_super v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v32.receiver = self;
  v32.super_class = (Class)_UIFloatingTabBarGroupItemView;
  -[UIView layoutSubviews](&v32, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UIFloatingTabBarGroupItemView imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[_UIFloatingTabBarGroupItemView imageView](self, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_setContinuousCornerRadius:", fmin(v8, v10) * 0.5);

  -[_UIFloatingTabBarGroupItemView punchOutView](self, "punchOutView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[UIView traitCollection](self, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _UIFloatingTabBarGetPlatformMetrics(objc_msgSend(v14, "userInterfaceIdiom"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "groupItemSpacing");
    v17 = -(v8 * 0.5 + v16);
    v33.origin.x = v4;
    v33.origin.y = v6;
    v33.size.width = v8;
    v33.size.height = v10;
    v34 = CGRectOffset(v33, v17, 0.0);
    x = v34.origin.x;
    y = v34.origin.y;
    width = v34.size.width;
    height = v34.size.height;
    objc_msgSend(v15, "groupItemPunchOutWidth");
    v23 = -v22;
    objc_msgSend(v15, "groupItemPunchOutWidth");
    v25 = -v24;
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    v36 = CGRectInset(v35, v23, v25);
    v26 = v36.origin.x;
    v27 = v36.origin.y;
    v28 = v36.size.width;
    v29 = v36.size.height;
    -[_UIFloatingTabBarGroupItemView punchOutView](self, "punchOutView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFrame:", v26, v27, v28, v29);

    -[_UIFloatingTabBarGroupItemView punchOutView](self, "punchOutView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "_setContinuousCornerRadius:", fmin(v28, v29) * 0.5);

  }
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIView)punchOutView
{
  return self->_punchOutView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_punchOutView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
