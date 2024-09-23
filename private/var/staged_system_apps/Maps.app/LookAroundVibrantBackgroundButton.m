@implementation LookAroundVibrantBackgroundButton

+ (id)customButtonWithImage:(id)a3 title:(id)a4 target:(id)a5 action:(SEL)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "buttonWithType:", 0));
  v14 = v13;
  if (v10)
    objc_msgSend(v13, "setImage:forState:", v10, 0);
  if (v11)
    objc_msgSend(v14, "setTitle:forState:", v11, 0);
  objc_msgSend(v14, "addTarget:action:forControlEvents:", v12, a6, 64);

  return v14;
}

- (void)_commonInit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIImage *v7;
  MKVibrantView *v8;
  MKVibrantView *vibrantView;
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
  _QWORD v23[4];

  -[LookAroundVibrantBackgroundButton setAdjustsImageWhenHighlighted:](self, "setAdjustsImageWhenHighlighted:", 0);
  -[LookAroundVibrantBackgroundButton _setCornerRadius:](self, "_setCornerRadius:", 8.0);
  -[LookAroundVibrantBackgroundButton setContentVerticalAlignment:](self, "setContentVerticalAlignment:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithScale:](UIImageSymbolConfiguration, "configurationWithScale:", 3));
  -[LookAroundVibrantBackgroundButton setPreferredSymbolConfiguration:forImageInState:](self, "setPreferredSymbolConfiguration:forImageInState:", v3, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundVibrantBackgroundButton titleLabel](self, "titleLabel"));
  objc_msgSend(v4, "setNumberOfLines:", 2);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundVibrantBackgroundButton titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setTextAlignment:", 4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundVibrantBackgroundButton titleLabel](self, "titleLabel"));
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v6, &stru_1011CA0F0);

  v7 = objc_opt_new(UIImage);
  -[LookAroundVibrantBackgroundButton setBackgroundImage:forState:](self, "setBackgroundImage:forState:", v7, 0);

  v8 = (MKVibrantView *)objc_msgSend(objc_alloc((Class)MKVibrantView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  vibrantView = self->_vibrantView;
  self->_vibrantView = v8;

  -[MKVibrantView _setCornerRadius:](self->_vibrantView, "_setCornerRadius:", 8.0);
  -[MKVibrantView setTranslatesAutoresizingMaskIntoConstraints:](self->_vibrantView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKVibrantView setUserInteractionEnabled:](self->_vibrantView, "setUserInteractionEnabled:", 0);
  -[LookAroundVibrantBackgroundButton addSubview:](self, "addSubview:", self->_vibrantView);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantView topAnchor](self->_vibrantView, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundVibrantBackgroundButton topAnchor](self, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
  v23[0] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantView bottomAnchor](self->_vibrantView, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundVibrantBackgroundButton bottomAnchor](self, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v10));
  v23[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantView leadingAnchor](self->_vibrantView, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundVibrantBackgroundButton leadingAnchor](self, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
  v23[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantView trailingAnchor](self->_vibrantView, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundVibrantBackgroundButton trailingAnchor](self, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
  v23[3] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

  -[LookAroundVibrantBackgroundButton updateTheme](self, "updateTheme");
}

- (LookAroundVibrantBackgroundButton)init
{
  LookAroundVibrantBackgroundButton *v2;
  LookAroundVibrantBackgroundButton *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LookAroundVibrantBackgroundButton;
  v2 = -[LookAroundVibrantBackgroundButton init](&v5, "init");
  v3 = v2;
  if (v2)
    -[LookAroundVibrantBackgroundButton _commonInit](v2, "_commonInit");
  return v3;
}

- (LookAroundVibrantBackgroundButton)initWithFrame:(CGRect)a3
{
  LookAroundVibrantBackgroundButton *v3;
  LookAroundVibrantBackgroundButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LookAroundVibrantBackgroundButton;
  v3 = -[LookAroundVibrantBackgroundButton initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[LookAroundVibrantBackgroundButton _commonInit](v3, "_commonInit");
  return v4;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  double v25;
  BOOL v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  objc_super v32;
  objc_super v33;
  CGRect v34;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v33.receiver = self;
  v33.super_class = (Class)LookAroundVibrantBackgroundButton;
  -[LookAroundVibrantBackgroundButton imageRectForContentRect:](&v33, "imageRectForContentRect:");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  if (!CGRectIsEmpty(v34))
  {
    v32.receiver = self;
    v32.super_class = (Class)LookAroundVibrantBackgroundButton;
    -[LookAroundVibrantBackgroundButton titleRectForContentRect:](&v32, "titleRectForContentRect:", x, y, width, height);
    v17 = width + -34.0 - v13;
    if (v16 >= v17)
      v18 = width + -34.0 - v13;
    else
      v18 = v16;
    v19 = fmax(v16 - v17, 0.0);
    v20 = width * -0.5 + v18 * -0.5 + 34.0;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v22 = objc_msgSend(v21, "userInterfaceLayoutDirection");

    v23 = -v20;
    v24 = -v19;
    if (v22 != (id)1)
    {
      v24 = v19;
      v23 = v20;
    }
    v25 = v24 * 0.5;
    v26 = v24 == 0.0;
    v27 = -0.0;
    if (!v26)
      v27 = v25;
    v9 = v9 + v27 - v23;
  }
  v28 = v9;
  v29 = v11;
  v30 = v13;
  v31 = v15;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  double v25;
  BOOL v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  objc_super v32;
  objc_super v33;
  CGRect v34;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v33.receiver = self;
  v33.super_class = (Class)LookAroundVibrantBackgroundButton;
  -[LookAroundVibrantBackgroundButton titleRectForContentRect:](&v33, "titleRectForContentRect:");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  if (!CGRectIsEmpty(v34))
  {
    v32.receiver = self;
    v32.super_class = (Class)LookAroundVibrantBackgroundButton;
    -[LookAroundVibrantBackgroundButton imageRectForContentRect:](&v32, "imageRectForContentRect:", x, y, width, height);
    v17 = width + -34.0 - v16;
    if (v13 >= v17)
      v18 = width + -34.0 - v16;
    else
      v18 = v13;
    v19 = fmax(v13 - v17, 0.0);
    v20 = v18 * 0.5 - width * 0.5 - v16 * 0.5 + 17.0;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v22 = objc_msgSend(v21, "userInterfaceLayoutDirection");

    v23 = -v20;
    v24 = -v19;
    if (v22 != (id)1)
    {
      v24 = v19;
      v23 = v20;
    }
    v25 = v24 * 0.5;
    v26 = v24 == 0.0;
    if (v24 != 0.0)
      v13 = v18;
    v27 = -0.0;
    if (!v26)
      v27 = v25;
    v9 = v9 + v27 + v23;
    v15 = height;
    v11 = y;
  }
  v28 = v9;
  v29 = v11;
  v30 = v13;
  v31 = v15;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LookAroundVibrantBackgroundButton;
  -[LookAroundVibrantBackgroundButton setHighlighted:](&v4, "setHighlighted:", a3);
  -[LookAroundVibrantBackgroundButton updateTheme](self, "updateTheme");
}

- (void)setImage:(id)a3 title:(id)a4
{
  id v6;

  v6 = a4;
  -[LookAroundVibrantBackgroundButton setImage:forState:](self, "setImage:forState:", a3, 0);
  -[LookAroundVibrantBackgroundButton setTitle:forState:](self, "setTitle:forState:", v6, 0);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LookAroundVibrantBackgroundButton;
  -[LookAroundVibrantBackgroundButton layoutSubviews](&v3, "layoutSubviews");
  -[LookAroundVibrantBackgroundButton sendSubviewToBack:](self, "sendSubviewToBack:", self->_vibrantView);
}

- (void)updateTheme
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v3 = -[LookAroundVibrantBackgroundButton tintAdjustmentMode](self, "tintAdjustmentMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundVibrantBackgroundButton mk_theme](self, "mk_theme"));
  v5 = v4;
  if (v3 == (id)2)
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "disabledActionRowTextColor"));
  else
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tintColor"));
  v13 = (id)v6;

  -[LookAroundVibrantBackgroundButton setTitleColor:forState:](self, "setTitleColor:forState:", v13, 0);
  v7 = -[LookAroundVibrantBackgroundButton isHighlighted](self, "isHighlighted");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundVibrantBackgroundButton mk_theme](self, "mk_theme"));
  v9 = v8;
  if (v7)
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "buttonHighlightedColor"));
  else
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "buttonNormalColor"));
  v11 = (void *)v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantView contentView](self->_vibrantView, "contentView"));
  objc_msgSend(v12, "setBackgroundColor:", v11);

}

- (MKVibrantView)vibrantView
{
  return self->_vibrantView;
}

- (void)setVibrantView:(id)a3
{
  objc_storeStrong((id *)&self->_vibrantView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrantView, 0);
}

@end
