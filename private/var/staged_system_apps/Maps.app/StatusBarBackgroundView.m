@implementation StatusBarBackgroundView

- (StatusBarBackgroundView)initWithSafeAreaTopLayoutAnchor:(id)a3
{
  id v5;
  StatusBarBackgroundView *v6;
  StatusBarBackgroundView *v7;
  StatusBarBackgroundViewStyle *v8;
  void *v9;
  StatusBarBackgroundViewStyle *v10;
  StatusBarBackgroundViewStyle *style;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)StatusBarBackgroundView;
  v6 = -[StatusBarBackgroundView initWithFrame:](&v13, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_safeAreaTopLayoutAnchor, a3);
    v8 = [StatusBarBackgroundViewStyle alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v10 = -[StatusBarBackgroundViewStyle initWithColor:](v8, "initWithColor:", v9);
    style = v7->_style;
    v7->_style = v10;

    v7->_statusBarBackgroundViewAlphaChannelEnabled = GEOConfigGetBOOL(MapsConfig_StatusBarBackgroundViewAlphaChannelEnabled, off_1014B5628);
  }

  return v7;
}

- (void)setStyle:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  id v9;

  v5 = a3;
  v6 = self->_style;
  v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    v9 = (id)v7;
    v8 = objc_msgSend((id)v6, "isEqual:", v7);

    v7 = (unint64_t)v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_style, a3);
      -[StatusBarBackgroundView _updateContent](self, "_updateContent");
      v7 = (unint64_t)v9;
    }
  }

}

- (void)setAdditionalColor:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  id v9;

  v5 = a3;
  v6 = self->_additionalColor;
  v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    v9 = (id)v7;
    v8 = objc_msgSend((id)v6, "isEqual:", v7);

    v7 = (unint64_t)v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_additionalColor, a3);
      -[MUBlurView setOverlayColor:](self->_blurView, "setOverlayColor:", v9);
      v7 = (unint64_t)v9;
    }
  }

}

- (void)_updateContent
{
  void *v3;
  char *v4;
  void *v5;
  MUBlurView *v6;
  MUBlurView *blurView;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[StatusBarBackgroundView style](self, "style"));
  v4 = (char *)objc_msgSend(v3, "type");

  if ((unint64_t)(v4 - 1) >= 3)
  {
    if (!v4)
    {
      -[StatusBarBackgroundView _removeBlurView](self, "_removeBlurView");
      v9 = (id)objc_claimAutoreleasedReturnValue(-[StatusBarBackgroundView style](self, "style"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "color"));
      -[StatusBarBackgroundView setBackgroundColor:](self, "setBackgroundColor:", v8);

    }
  }
  else
  {
    -[StatusBarBackgroundView _removeBlurView](self, "_removeBlurView");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[StatusBarBackgroundView setBackgroundColor:](self, "setBackgroundColor:", v5);

    v6 = (MUBlurView *)objc_claimAutoreleasedReturnValue(-[StatusBarBackgroundView _blurView](self, "_blurView"));
    blurView = self->_blurView;
    self->_blurView = v6;

    -[StatusBarBackgroundView _addBlurView:](self, "_addBlurView:", self->_blurView);
  }
}

- (void)_removeBlurView
{
  MUBlurView *blurView;
  NSLayoutConstraint *blurViewBottomConstraint;

  -[MUBlurView removeFromSuperview](self->_blurView, "removeFromSuperview");
  blurView = self->_blurView;
  self->_blurView = 0;

  blurViewBottomConstraint = self->_blurViewBottomConstraint;
  self->_blurViewBottomConstraint = 0;

}

- (id)_blurView
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t (**v15)(_QWORD, _QWORD);
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[StatusBarBackgroundView style](self, "style"));
  v4 = objc_msgSend(v3, "type");

  if (v4 == (id)1)
  {
    v5 = objc_alloc((Class)MUBlurView);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[StatusBarBackgroundView style](self, "style"));
    v7 = objc_msgSend(v5, "initWithBlurEffectStyle:", objc_msgSend(v6, "blurStyle"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[StatusBarBackgroundView style](self, "style"));
    v9 = objc_msgSend(v8, "type");

    v10 = objc_alloc((Class)MUBlurView);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[StatusBarBackgroundView style](self, "style"));
    objc_msgSend(v6, "blurRadius");
    if (v9 == (id)3)
      v7 = objc_msgSend(v10, "initWithVariableBlurWithRadius:maskImage:", -[StatusBarBackgroundView maskImage](self, "maskImage"), v11);
    else
      v7 = objc_msgSend(v10, "initWithGaussianBlurWithRadius:", v11);
  }
  v12 = v7;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[StatusBarBackgroundView additionalColor](self, "additionalColor"));
  objc_msgSend(v12, "setOverlayColor:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[StatusBarBackgroundView style](self, "style"));
  v15 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "defaultColorProvider"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[StatusBarBackgroundView theme](self, "theme"));
  v17 = ((uint64_t (**)(_QWORD, void *))v15)[2](v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  objc_msgSend(v12, "setNonBlurredColor:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[StatusBarBackgroundView style](self, "style"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "groupName"));
  objc_msgSend(v12, "setBlurGroupName:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[StatusBarBackgroundView style](self, "style"));
  if (objc_msgSend(v21, "disableBlur"))
    v22 = 2;
  else
    v22 = 0;
  objc_msgSend(v12, "setStyle:", v22);

  return v12;
}

- (void)_addBlurView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *blurViewBottomConstraint;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[4];

  v4 = a3;
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[StatusBarBackgroundView insertSubview:atIndex:](self, "insertSubview:atIndex:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[StatusBarBackgroundView bottomAnchor](self, "bottomAnchor"));
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
  blurViewBottomConstraint = self->_blurViewBottomConstraint;
  self->_blurViewBottomConstraint = v7;

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[StatusBarBackgroundView leadingAnchor](self, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v18));
  v21[0] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[StatusBarBackgroundView trailingAnchor](self, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  v21[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[StatusBarBackgroundView topAnchor](self, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
  v16 = self->_blurViewBottomConstraint;
  v21[2] = v15;
  v21[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10025C5D0;
  v20[3] = &unk_1011AC860;
  v20[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v20);
}

- (double)_blurViewBottomPadding
{
  uint64_t v3;
  double Height;
  double v5;
  double v6;
  BOOL v7;
  BOOL v8;
  double result;
  CGRect v10;

  v3 = sub_1002A8AA0(self);
  -[StatusBarBackgroundView bounds](self, "bounds");
  Height = CGRectGetHeight(v10);
  -[StatusBarBackgroundView safeAreaInsets](self, "safeAreaInsets");
  if (Height <= 0.0)
    return 0.0;
  v6 = v5;
  v7 = Height <= v5 && v3 == 1;
  v8 = v7;
  result = 8.0;
  if (v6 != 0.0 && !v8)
    return 0.0;
  return result;
}

- (CGImage)maskImage
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  CGImage *v7;
  _QWORD v9[6];
  int64x2_t v10;

  v3 = objc_alloc_init((Class)UIGraphicsImageRendererFormat);
  objc_msgSend(v3, "setScale:", 1.0);
  if (self->_statusBarBackgroundViewAlphaChannelEnabled)
    v4 = 0x7FFFLL;
  else
    v4 = 2;
  objc_msgSend(v3, "setPreferredRange:", v4);
  v5 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithBounds:format:", v3, 0.0, 0.0, 100.0, 100.0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10025C740;
  v9[3] = &unk_1011ADEC8;
  v9[4] = 0;
  v9[5] = 0;
  v10 = vdupq_n_s64(0x4059000000000000uLL);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageWithActions:", v9)));
  v7 = (CGImage *)objc_msgSend(v6, "CGImage");

  return v7;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)StatusBarBackgroundView;
  -[StatusBarBackgroundView layoutSubviews](&v3, "layoutSubviews");
  -[StatusBarBackgroundView _blurViewBottomPadding](self, "_blurViewBottomPadding");
  -[NSLayoutConstraint setConstant:](self->_blurViewBottomConstraint, "setConstant:");
}

- (void)updateTheme
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)StatusBarBackgroundView;
  -[MapsThemeView updateTheme](&v3, "updateTheme");
  -[StatusBarBackgroundView _updateContent](self, "_updateContent");
}

- (NSLayoutYAxisAnchor)safeAreaTopLayoutAnchor
{
  return self->_safeAreaTopLayoutAnchor;
}

- (StatusBarBackgroundViewStyle)style
{
  return self->_style;
}

- (UIColor)additionalColor
{
  return self->_additionalColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalColor, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_safeAreaTopLayoutAnchor, 0);
  objc_storeStrong((id *)&self->_blurViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
}

@end
