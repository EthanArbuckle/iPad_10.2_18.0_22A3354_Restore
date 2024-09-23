@implementation CardView

- (UIView)contentView
{
  return self->_contentView;
}

- (id)initAllowingBlurred:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  CardView *v6;
  objc_super v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v5, "bounds");
  v8.receiver = self;
  v8.super_class = (Class)CardView;
  v6 = -[CardView initWithFrame:](&v8, "initWithFrame:");

  if (v6)
    -[CardView _commonInitWithBlurType:](v6, "_commonInitWithBlurType:", v3);
  return v6;
}

- (void)setOverriddenIntrinsicHeight:(double)a3
{
  id v5;
  NSObject *v6;
  double overriddenIntrinsicHeight;
  int v8;
  double v9;
  __int16 v10;
  double v11;

  if (self->_overriddenIntrinsicHeight != a3)
  {
    v5 = sub_100A7B7DC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      overriddenIntrinsicHeight = self->_overriddenIntrinsicHeight;
      v8 = 134218240;
      v9 = overriddenIntrinsicHeight;
      v10 = 2048;
      v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Cardview setting overidden height from - %f to - %f", (uint8_t *)&v8, 0x16u);
    }

    self->_overriddenIntrinsicHeight = a3;
  }
}

- (id)initAllowingBlurredForButton:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  CardView *v6;
  objc_super v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v5, "bounds");
  v8.receiver = self;
  v8.super_class = (Class)CardView;
  v6 = -[CardView initWithFrame:](&v8, "initWithFrame:");

  if (v6)
  {
    v6->_buttonCard = 1;
    -[CardView _commonInitWithBlurType:](v6, "_commonInitWithBlurType:", v3);
  }
  return v6;
}

- (CardView)initWithThickBlur
{
  void *v3;
  CardView *v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v3, "bounds");
  v6.receiver = self;
  v6.super_class = (Class)CardView;
  v4 = -[CardView initWithFrame:](&v6, "initWithFrame:");

  if (v4)
    -[CardView _commonInitWithBlurType:](v4, "_commonInitWithBlurType:", 2);
  return v4;
}

- (NSLayoutConstraint)heightConstraint
{
  NSLayoutConstraint *heightConstraint;
  void *v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *v6;

  heightConstraint = self->_heightConstraint;
  if (!heightConstraint)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_contentView, "heightAnchor"));
    v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToConstant:", self->_height));
    v6 = self->_heightConstraint;
    self->_heightConstraint = v5;

    -[NSLayoutConstraint setActive:](self->_heightConstraint, "setActive:", 1);
    heightConstraint = self->_heightConstraint;
  }
  return heightConstraint;
}

- (void)_commonInitWithBlurType:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  CardCustomBorderView *v14;
  CardCustomBorderView *customBorderView;
  id v16;
  void *v17;
  UIVisualEffectView *v18;
  UIVisualEffectView *blurView;
  UIVisualEffectView *v20;
  UIVisualEffectView *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  double y;
  double width;
  double height;
  UIView *v29;
  UIView *contentView;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSLayoutConstraint *v35;
  NSLayoutConstraint *topConstraint;
  void *v37;
  void *v38;
  void *v39;
  NSLayoutConstraint *v40;
  NSLayoutConstraint *bottomConstraint;
  NSLayoutConstraint *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  UIView *v52;
  UIView *shadowView;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  _QWORD v70[8];

  self->_canAddSubviews = 1;
  -[CardView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[CardView setBackgroundColor:](self, "setBackgroundColor:", v13);

  v14 = -[CardCustomBorderView initWithFrame:]([CardCustomBorderView alloc], "initWithFrame:", v6, v8, v10, v12);
  customBorderView = self->_customBorderView;
  self->_customBorderView = v14;

  -[CardCustomBorderView setButtonCard:](self->_customBorderView, "setButtonCard:", self->_buttonCard);
  -[CardView addSubview:](self, "addSubview:", self->_customBorderView);
  if (a3 == 2)
  {
    v16 = objc_alloc((Class)UIVisualEffectView);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 8));
    v18 = (UIVisualEffectView *)objc_msgSend(v16, "initWithEffect:", v17);
    blurView = self->_blurView;
    self->_blurView = v18;

    -[UIVisualEffectView _setGroupName:](self->_blurView, "_setGroupName:", CFSTR("CardView"));
  }
  else
  {
    v20 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue(+[MapsTheme visualEffectViewAllowingBlur:](MapsTheme, "visualEffectViewAllowingBlur:", a3 != 0));
    v21 = self->_blurView;
    self->_blurView = v20;

  }
  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_blurView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_blurView, "contentView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "layer"));
  objc_msgSend(v23, "setAllowsGroupOpacity:", 0);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_blurView, "contentView"));
  objc_msgSend(v24, "setClipsToBounds:", 1);

  -[CardView addSubview:](self, "addSubview:", self->_blurView);
  v25 = objc_alloc((Class)UIView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v29 = (UIView *)objc_msgSend(v25, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  contentView = self->_contentView;
  self->_contentView = v29;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_blurView, "contentView"));
  objc_msgSend(v31, "addSubview:", self->_contentView);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_contentView, "topAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_blurView, "contentView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "topAnchor"));
  v35 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v34));
  topConstraint = self->_topConstraint;
  self->_topConstraint = v35;

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_blurView, "contentView"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "bottomAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_contentView, "bottomAnchor"));
  v40 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v39));
  bottomConstraint = self->_bottomConstraint;
  self->_bottomConstraint = v40;

  v42 = self->_bottomConstraint;
  v70[0] = self->_topConstraint;
  v70[1] = v42;
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_contentView, "leadingAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_blurView, "contentView"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "leadingAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:", v67));
  v70[2] = v66;
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_contentView, "trailingAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_blurView, "contentView"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "trailingAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:", v63));
  v70[3] = v62;
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[CardView topAnchor](self, "topAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](self->_blurView, "topAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:", v60));
  v70[4] = v59;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[CardView bottomAnchor](self, "bottomAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](self->_blurView, "bottomAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v57));
  v70[5] = v56;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CardView leadingAnchor](self, "leadingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_blurView, "contentView"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "leadingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v45));
  v70[6] = v46;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CardView trailingAnchor](self, "trailingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_blurView, "contentView"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "trailingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v49));
  v70[7] = v50;
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v70, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v51);

  v52 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  shadowView = self->_shadowView;
  self->_shadowView = v52;

  v54 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.0599999987));
  -[UIView setBackgroundColor:](self->_shadowView, "setBackgroundColor:", v54);

  -[UIView setUserInteractionEnabled:](self->_shadowView, "setUserInteractionEnabled:", 0);
  -[UIView _setCornerRadius:](self->_shadowView, "_setCornerRadius:", _UISheetCornerRadius);
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[CardView contentView](self, "contentView"));
  objc_msgSend(v55, "addSubview:", self->_shadowView);

  -[UIView setAlpha:](self->_shadowView, "setAlpha:", 0.0);
  self->_canAddSubviews = 0;
}

- (void)didAddSubview:(id)a3
{
  id v4;
  Class v5;
  objc_super v6;

  v4 = a3;
  v5 = NSClassFromString(CFSTR("_UIDebugColorBoundsView"));
  objc_opt_isKindOfClass(v4, v5);
  v6.receiver = self;
  v6.super_class = (Class)CardView;
  -[CardView didAddSubview:](&v6, "didAddSubview:", v4);

}

- (void)layoutSubviews
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  CGRect v20;

  v19.receiver = self;
  v19.super_class = (Class)CardView;
  -[CardView layoutSubviews](&v19, "layoutSubviews");
  -[CardView bounds](self, "bounds");
  v20.origin.x = v3;
  v20.origin.y = v4;
  v20.size.width = v5;
  v20.size.height = v6;
  if (!CGRectEqualToRect(self->_savedBounds, v20))
  {
    -[CardView bounds](self, "bounds");
    self->_savedBounds.origin.x = v7;
    self->_savedBounds.origin.y = v8;
    self->_savedBounds.size.width = v9;
    self->_savedBounds.size.height = v10;
    -[CardView bounds](self, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    -[UIView setFrame:](self->_shadowView, "setFrame:");
    -[CardCustomBorderView setFrame:](self->_customBorderView, "setFrame:", v12, v14, v16, v18);
    -[UIVisualEffectView setFrame:](self->_blurView, "setFrame:", v12, v14, v16, v18);
  }
}

- (void)setBlurGroupName:(id)a3
{
  NSString *v4;
  NSString *blurGroupName;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  blurGroupName = self->_blurGroupName;
  self->_blurGroupName = v4;

  -[UIVisualEffectView _setGroupName:](self->_blurView, "_setGroupName:", v6);
}

- (void)setCaptureView:(id)a3
{
  UIVisualEffectView *blurView;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  blurView = self->_blurView;
  v5 = objc_opt_class(UIVisualEffectView);
  if ((objc_opt_isKindOfClass(blurView, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView _captureView](self->_blurView, "_captureView"));

    if (!v6)
    {
      -[UIVisualEffectView _setGroupName:](self->_blurView, "_setGroupName:", self->_blurGroupName);
      -[UIVisualEffectView _setCaptureView:](self->_blurView, "_setCaptureView:", v7);
    }
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  id v8;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CardView;
  -[CardView traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v5);
  if (v5
    && (v6 = objc_msgSend(v5, "userInterfaceStyle"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[CardView traitCollection](self, "traitCollection")),
        v6 == objc_msgSend(v3, "userInterfaceStyle")))
  {

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CardView traitCollection](self, "traitCollection"));
    v8 = objc_msgSend(v7, "userInterfaceStyle");

    if (v5)
    if (v8)
      -[CardView updateTheme](self, "updateTheme");
  }

}

- (void)updateTheme
{
  -[MapsThemeView updateTheme](self->_customBorderView, "updateTheme");
}

- (void)_setCornerRadiusWithMaskedCorners:(unint64_t)a3 cornerRadius:(double)a4
{
  uint64_t v6;
  UIVisualEffectView *v7;

  v7 = self->_blurView;
  v6 = objc_opt_class(UIVisualEffectView);
  if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
    -[UIVisualEffectView _setCornerRadius:continuous:maskedCorners:](v7, "_setCornerRadius:continuous:maskedCorners:", 0, a3, a4);
  else
    -[UIVisualEffectView _setCornerRadius:](v7, "_setCornerRadius:", a4);

}

- (void)setHeight:(double)a3
{
  id v5;
  NSObject *v6;
  double height;
  void *v8;
  int v9;
  double v10;
  __int16 v11;
  double v12;

  if (self->_height != a3)
  {
    v5 = sub_100A7B7DC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      height = self->_height;
      v9 = 134218240;
      v10 = height;
      v11 = 2048;
      v12 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Card view setHeight from - %f to - %f", (uint8_t *)&v9, 0x16u);
    }

    self->_height = a3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CardView heightConstraint](self, "heightConstraint"));
    objc_msgSend(v8, "setConstant:", a3);

  }
}

- (void)setLayoutStyle:(unint64_t)a3
{
  double v5;
  CardView *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;

  self->_style = a3;
  if (-[CardCustomBorderView cardCustomBorder](self->_customBorderView, "cardCustomBorder"))
    v5 = _UISheetCornerRadius;
  else
    v5 = 9.0;
  if (a3 == 7)
  {
    -[CardCustomBorderView setHidden:](self->_customBorderView, "setHidden:", 1);
    -[CardCustomBorderView setCardCustomBorder:](self->_customBorderView, "setCardCustomBorder:", 0);
    v8 = 0.0;
    v6 = self;
    v7 = 0;
  }
  else
  {
    if (a3 == 6)
    {
      -[CardCustomBorderView setHidden:](self->_customBorderView, "setHidden:", 0);
      -[CardCustomBorderView setCardCustomBorder:](self->_customBorderView, "setCardCustomBorder:", 2);
      v6 = self;
      v7 = 15;
    }
    else
    {
      -[CardCustomBorderView setHidden:](self->_customBorderView, "setHidden:", 0);
      if (a3 - 2 >= 3)
        v9 = 1;
      else
        v9 = 3;
      -[CardCustomBorderView setCardCustomBorder:](self->_customBorderView, "setCardCustomBorder:", v9);
      v6 = self;
      v7 = 3;
    }
    v8 = v5;
  }
  -[CardView _setCornerRadiusWithMaskedCorners:cornerRadius:](v6, "_setCornerRadiusWithMaskedCorners:cornerRadius:", v7, v8);
}

- (void)showShadow:(BOOL)a3 animated:(BOOL)a4
{
  Block_layout *v4;
  double v5;
  void ***v6;
  UIView *shadowView;
  double v8;
  void **v9;
  uint64_t v10;
  id (*v11)(uint64_t);
  void *v12;
  CardView *v13;
  void **v14;
  uint64_t v15;
  id (*v16)(uint64_t);
  void *v17;
  CardView *v18;

  if (a3)
  {
    if (a4)
    {
      v14 = _NSConcreteStackBlock;
      v15 = 3221225472;
      v16 = sub_100A7C690;
      v17 = &unk_1011AC860;
      v18 = self;
      v4 = &stru_1011E1038;
      v5 = 0.25;
      v6 = &v14;
LABEL_6:
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v6, v4, v5, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
      return;
    }
    shadowView = self->_shadowView;
    v8 = 1.0;
  }
  else
  {
    if (a4)
    {
      v9 = _NSConcreteStackBlock;
      v10 = 3221225472;
      v11 = sub_100A7C6AC;
      v12 = &unk_1011AC860;
      v13 = self;
      v4 = &stru_1011E1058;
      v5 = 0.25;
      v6 = &v9;
      goto LABEL_6;
    }
    shadowView = self->_shadowView;
    v8 = 0.0;
  }
  -[UIView setAlpha:](shadowView, "setAlpha:", v8);
}

- (CGSize)intrinsicContentSize
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  id v7;
  NSObject *v8;
  NSString *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  NSSize v18;
  CGSize result;

  -[CardView overriddenIntrinsicHeight](self, "overriddenIntrinsicHeight");
  if (v3 == 0.0)
  {
    v15.receiver = self;
    v15.super_class = (Class)CardView;
    -[CardView intrinsicContentSize](&v15, "intrinsicContentSize");
    v4 = v11;
    v6 = v12;
  }
  else
  {
    v4 = UIViewNoIntrinsicMetric;
    -[CardView overriddenIntrinsicHeight](self, "overriddenIntrinsicHeight");
    v6 = v5;
    v7 = sub_100A7B7DC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v18.width = UIViewNoIntrinsicMetric;
      v18.height = v6;
      v9 = NSStringFromSize(v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 138412290;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Card view intrinsicContentSize - %@", buf, 0xCu);

    }
  }
  v13 = v4;
  v14 = v6;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CardViewDelegate)delegate
{
  return (CardViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)blurGroupName
{
  return self->_blurGroupName;
}

- (BOOL)hideGrabber
{
  return self->_hideGrabber;
}

- (void)setHideGrabber:(BOOL)a3
{
  self->_hideGrabber = a3;
}

- (BOOL)showFooterGrabber
{
  return self->_showFooterGrabber;
}

- (void)setShowFooterGrabber:(BOOL)a3
{
  self->_showFooterGrabber = a3;
}

- (double)height
{
  return self->_height;
}

- (double)overriddenIntrinsicHeight
{
  return self->_overriddenIntrinsicHeight;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_blurGroupName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_customBorderView, 0);
}

@end
