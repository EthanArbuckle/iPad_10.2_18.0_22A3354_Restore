@implementation DockedHeaderView

- (DockedHeaderView)initWithFrame:(CGRect)a3
{
  DockedHeaderView *v3;
  DockedHeaderView *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DockedHeaderView;
  v3 = -[DockedHeaderView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[DockedHeaderView setOpaque:](v3, "setOpaque:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[DockedHeaderView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DockedHeaderView layer](v4, "layer"));
    objc_msgSend(v6, "setAllowsGroupOpacity:", 1);

    -[DockedHeaderView _createPrimaryViews](v4, "_createPrimaryViews");
  }
  return v4;
}

- (void)_createPrimaryViews
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v3 = objc_alloc((Class)UIView);
  -[DockedHeaderView bounds](self, "bounds");
  v13 = objc_msgSend(v3, "initWithFrame:");
  -[DockedHeaderView setBackgroundView:](self, "setBackgroundView:");

  v14 = (id)objc_claimAutoreleasedReturnValue(-[DockedHeaderView backgroundView](self, "backgroundView"));
  objc_msgSend(v14, "setAutoresizingMask:", 18);

  v15 = (id)objc_claimAutoreleasedReturnValue(-[DockedHeaderView backgroundView](self, "backgroundView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layer"));
  objc_msgSend(v4, "setMaskedCorners:", 3);

  v16 = (id)objc_claimAutoreleasedReturnValue(-[DockedHeaderView backgroundView](self, "backgroundView"));
  objc_msgSend(v16, "setUserInteractionEnabled:", 0);

  v17 = (id)objc_claimAutoreleasedReturnValue(-[DockedHeaderView backgroundView](self, "backgroundView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layer"));
  objc_msgSend(v5, "setAllowsGroupOpacity:", 1);

  v18 = (id)objc_claimAutoreleasedReturnValue(-[DockedHeaderView backgroundView](self, "backgroundView"));
  -[DockedHeaderView addSubview:](self, "addSubview:");

  v6 = objc_alloc((Class)UIView);
  -[DockedHeaderView bounds](self, "bounds");
  v19 = objc_msgSend(v6, "initWithFrame:");
  -[DockedHeaderView setContentView:](self, "setContentView:");

  v20 = (id)objc_claimAutoreleasedReturnValue(-[DockedHeaderView contentView](self, "contentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "layer"));
  objc_msgSend(v7, "setAllowsGroupOpacity:", 1);

  v21 = (id)objc_claimAutoreleasedReturnValue(-[DockedHeaderView contentView](self, "contentView"));
  -[DockedHeaderView addSubview:](self, "addSubview:");

  v8 = objc_alloc((Class)UILabel);
  v22 = (id)objc_claimAutoreleasedReturnValue(-[DockedHeaderView contentView](self, "contentView"));
  objc_msgSend(v22, "bounds");
  v9 = objc_msgSend(v8, "initWithFrame:");
  -[DockedHeaderView setTitleLabel:](self, "setTitleLabel:", v9);

  v23 = (id)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 17.0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DockedHeaderView titleLabel](self, "titleLabel"));
  objc_msgSend(v10, "setFont:", v23);

  v24 = (id)objc_claimAutoreleasedReturnValue(-[DockedHeaderView titleLabel](self, "titleLabel"));
  objc_msgSend(v24, "setTextAlignment:", 1);

  v25 = (id)objc_claimAutoreleasedReturnValue(-[DockedHeaderView titleLabel](self, "titleLabel"));
  objc_msgSend(v25, "setAutoresizingMask:", 18);

  v26 = (id)objc_claimAutoreleasedReturnValue(-[DockedHeaderView titleLabel](self, "titleLabel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "layer"));
  objc_msgSend(v11, "setAllowsGroupOpacity:", 1);

  v27 = (id)objc_claimAutoreleasedReturnValue(-[DockedHeaderView contentView](self, "contentView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DockedHeaderView titleLabel](self, "titleLabel"));
  objc_msgSend(v27, "addSubview:", v12);

}

- (void)setCornerRadius:(double)a3
{
  id v5;
  id v6;

  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[DockedHeaderView backgroundView](self, "backgroundView"));
    objc_msgSend(v5, "_setContinuousCornerRadius:", a3);

    v6 = (id)objc_claimAutoreleasedReturnValue(-[DockedHeaderView backgroundView](self, "backgroundView"));
    objc_msgSend(v6, "setClipsToBounds:", 1);

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
  double v11;
  double v12;
  CGFloat v13;
  void *v14;
  objc_super v15;
  CGRect v16;

  v15.receiver = self;
  v15.super_class = (Class)DockedHeaderView;
  -[DockedHeaderView layoutSubviews](&v15, "layoutSubviews");
  -[DockedHeaderView safeAreaInsets](self, "safeAreaInsets");
  v4 = v3;
  -[DockedHeaderView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  -[DockedHeaderView layoutMargins](self, "layoutMargins");
  v10 = v6 + v9;
  v12 = v8 - (v9 + v11);
  -[DockedHeaderView bounds](self, "bounds");
  v13 = CGRectGetHeight(v16) - v4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DockedHeaderView contentView](self, "contentView"));
  objc_msgSend(v14, "setFrame:", v10, 0.0, v12, v13);

}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    title = self->_title;
    self->_title = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DockedHeaderView titleLabel](self, "titleLabel"));
    objc_msgSend(v6, "setText:", v7);

  }
}

- (id)backgroundColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DockedHeaderView backgroundView](self, "backgroundView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "backgroundColor"));

  return v3;
}

- (void)setBackgroundColor:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DockedHeaderView backgroundView](self, "backgroundView"));
  objc_msgSend(v4, "setBackgroundColor:", v5);

}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (NSString)title
{
  return self->_title;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (double)bottomInset
{
  return self->_bottomInset;
}

- (void)setBottomInset:(double)a3
{
  self->_bottomInset = a3;
}

- (MUIGradientView)bottomExtensionView
{
  return self->_bottomExtensionView;
}

- (void)setBottomExtensionView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomExtensionView, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_bottomExtensionView, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
