@implementation BKContentLoadingView

- (BKContentLoadingView)initWithFrame:(CGRect)a3 theme:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  BKContentLoadingView *v10;
  CGFloat v11;
  double v12;
  double v13;
  id v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  objc_super v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v30.receiver = self;
  v30.super_class = (Class)BKContentLoadingView;
  v10 = -[BKContentLoadingView initWithFrame:](&v30, "initWithFrame:", x, y, width, height);
  if (v10)
  {
    v11 = CGRectZero.origin.y;
    v31.origin.x = CGRectZero.origin.x;
    v31.origin.y = v11;
    v31.size.width = 142.0;
    v31.size.height = 97.0;
    v12 = CGRectGetWidth(v31);
    v32.origin.x = CGRectZero.origin.x;
    v32.origin.y = v11;
    v32.size.width = 142.0;
    v32.size.height = 97.0;
    v13 = CGRectGetHeight(v32);
    v14 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 101);
    objc_msgSend(v14, "frame");
    v15 = v33.origin.x;
    v16 = v33.origin.y;
    v17 = v33.size.width;
    v18 = v33.size.height;
    v19 = CGRectGetWidth(v33);
    v34.origin.x = v15;
    v34.origin.y = v16;
    v34.size.width = v17;
    v34.size.height = v18;
    objc_msgSend(v14, "setFrame:", floor((v12 - v19) * 0.5), floor((v13 - CGRectGetHeight(v34)) * 0.5) + -13.0, v17, v18);
    -[BKContentLoadingView addSubview:](v10, "addSubview:", v14);
    objc_storeStrong((id *)&v10->_spinner, v14);
    objc_msgSend(v14, "startAnimating");
    v20 = objc_alloc_init((Class)UILabel);
    v21 = AEBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Loading…"), &stru_1C3088, 0));
    objc_msgSend(v20, "setText:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 14.0));
    objc_msgSend(v20, "setFont:", v24);

    objc_msgSend(v20, "setFrame:", 0.0, 60.0, 142.0, 25.0);
    objc_msgSend(v20, "setTextAlignment:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v20, "setBackgroundColor:", v25);

    objc_msgSend(v20, "setOpaque:", 0);
    objc_storeStrong((id *)&v10->_label, v20);
    -[BKContentLoadingView addSubview:](v10, "addSubview:", v20);
    -[BKContentLoadingView setTheme:](v10, "setTheme:", v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentLoadingView layer](v10, "layer"));
    objc_msgSend(v26, "setCornerRadius:", 7.0);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v28 = -[BKContentLoadingView registerForTraitChanges:withAction:](v10, "registerForTraitChanges:withAction:", v27, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v10;
}

- (void)setTheme:(id)a3
{
  objc_storeStrong((id *)&self->_theme, a3);
  -[BKContentLoadingView _updateColors](self, "_updateColors");
}

- (void)_updateColors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKContentLoadingView theme](self, "theme"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentLoadingView traitCollection](self, "traitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "backgroundColorForTraitCollection:", v3));
  -[BKContentLoadingView setBackgroundColor:](self, "setBackgroundColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentTextColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentLoadingView label](self, "label"));
  objc_msgSend(v6, "setTextColor:", v5);

}

- (IMThemePage)theme
{
  return self->_theme;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_theme, 0);
}

@end
