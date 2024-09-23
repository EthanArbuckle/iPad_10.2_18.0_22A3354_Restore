@implementation StatusIndicatorView

- (id)initForLimitedMode:(BOOL)a3
{
  id result;

  result = -[StatusIndicatorView initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (result)
    *((_BYTE *)result + 9) = a3;
  return result;
}

- (StatusIndicatorView)initWithFrame:(CGRect)a3
{
  StatusIndicatorView *v3;
  StatusIndicatorView *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  UIView *v8;
  UIView *contentView;
  UILabel *v10;
  UILabel *label;
  void *v12;
  UIImageView *v13;
  UIImageView *disclosure;
  uint64_t v15;
  CALayer *extraLabelShadowLayer;
  void *v17;
  uint64_t v18;
  CALayer *extraDisclosureShadowLayer;
  void *v20;
  void *v26;
  void *v27;
  uint64_t v28;
  NSLayoutConstraint *labelTrailingConstraintWithDisclosureHidden;
  void *v30;
  void *v31;
  uint64_t v32;
  NSLayoutConstraint *labelTrailingConstraintWithDisclosureShown;
  void *v34;
  void *v35;
  uint64_t v36;
  NSLayoutConstraint *contentViewTopConstraint;
  void *v38;
  void *v39;
  uint64_t v40;
  NSLayoutConstraint *contentViewBottomConstraint;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  objc_super v63;
  _QWORD v64[8];

  v63.receiver = self;
  v63.super_class = (Class)StatusIndicatorView;
  v3 = -[StatusIndicatorView initWithFrame:](&v63, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[StatusIndicatorView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    v8 = (UIView *)objc_alloc_init((Class)UIView);
    contentView = v4->_contentView;
    v4->_contentView = v8;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setAccessibilityIdentifier:](v4->_contentView, "setAccessibilityIdentifier:", CFSTR("StatusIndicatorContent"));
    -[StatusIndicatorView addSubview:](v4, "addSubview:", v4->_contentView);
    v10 = (UILabel *)objc_alloc_init((Class)UILabel);
    label = v4->_label;
    v4->_label = v10;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[StatusIndicatorView _labelFont](v4, "_labelFont"));
    -[UILabel setFont:](v4->_label, "setFont:", v12);

    -[UILabel setNumberOfLines:](v4->_label, "setNumberOfLines:", 1);
    -[UILabel setAccessibilityIdentifier:](v4->_label, "setAccessibilityIdentifier:", CFSTR("StatusIndicatorLabel"));
    -[UIView addSubview:](v4->_contentView, "addSubview:", v4->_label);
    v13 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    disclosure = v4->_disclosure;
    v4->_disclosure = v13;

    -[UIImageView setHidden:](v4->_disclosure, "setHidden:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_disclosure, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setAccessibilityIdentifier:](v4->_disclosure, "setAccessibilityIdentifier:", CFSTR("StatusIndicatorDisclosure"));
    -[UIView addSubview:](v4->_contentView, "addSubview:", v4->_disclosure);
    v15 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    extraLabelShadowLayer = v4->_extraLabelShadowLayer;
    v4->_extraLabelShadowLayer = (CALayer *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel layer](v4->_label, "layer"));
    objc_msgSend(v17, "insertSublayer:atIndex:", v4->_extraLabelShadowLayer, 0);

    -[CALayer setActions:](v4->_extraLabelShadowLayer, "setActions:", 0);
    v18 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    extraDisclosureShadowLayer = v4->_extraDisclosureShadowLayer;
    v4->_extraDisclosureShadowLayer = (CALayer *)v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v4->_disclosure, "layer"));
    objc_msgSend(v20, "insertSublayer:atIndex:", v4->_extraDisclosureShadowLayer, 0);

    -[CALayer setActions:](v4->_extraDisclosureShadowLayer, "setActions:", 0);
    __asm { FMOV            V0.2D, #-8.0 }
    *(_OWORD *)&v4->_touchInsets.top = _Q0;
    *(_OWORD *)&v4->_touchInsets.bottom = _Q0;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_label, "trailingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v4->_contentView, "trailingAnchor"));
    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, -10.0));
    labelTrailingConstraintWithDisclosureHidden = v4->_labelTrailingConstraintWithDisclosureHidden;
    v4->_labelTrailingConstraintWithDisclosureHidden = (NSLayoutConstraint *)v28;

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_label, "trailingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v4->_disclosure, "leadingAnchor"));
    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, -6.0));
    labelTrailingConstraintWithDisclosureShown = v4->_labelTrailingConstraintWithDisclosureShown;
    v4->_labelTrailingConstraintWithDisclosureShown = (NSLayoutConstraint *)v32;

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v4->_contentView, "topAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[StatusIndicatorView topAnchor](v4, "topAnchor"));
    v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v35));
    contentViewTopConstraint = v4->_contentViewTopConstraint;
    v4->_contentViewTopConstraint = (NSLayoutConstraint *)v36;

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v4->_contentView, "bottomAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[StatusIndicatorView bottomAnchor](v4, "bottomAnchor"));
    v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v39));
    contentViewBottomConstraint = v4->_contentViewBottomConstraint;
    v4->_contentViewBottomConstraint = (NSLayoutConstraint *)v40;

    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v4->_label, "firstBaselineAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v4->_contentView, "topAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:constant:", v61, 20.0));
    v64[0] = v60;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v4->_label, "firstBaselineAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v4->_contentView, "bottomAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:constant:", v58, -10.0));
    v64[1] = v57;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_label, "leadingAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v4->_contentView, "leadingAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:constant:", v54, 10.0));
    v64[2] = v53;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView firstBaselineAnchor](v4->_disclosure, "firstBaselineAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v4->_label, "firstBaselineAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v51));
    v64[3] = v42;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v4->_disclosure, "trailingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v4->_contentView, "trailingAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44, -6.0));
    v64[4] = v45;
    v64[5] = v4->_contentViewTopConstraint;
    v64[6] = v4->_contentViewBottomConstraint;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v4->_contentView, "centerXAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[StatusIndicatorView centerXAnchor](v4, "centerXAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v47));
    v64[7] = v48;
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v64, 8));
    objc_msgSend(v56, "addObjectsFromArray:", v49);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v56);
  }
  return v4;
}

- (void)setProminent:(BOOL)a3
{
  -[StatusIndicatorView setProminent:allowSkip:animated:](self, "setProminent:allowSkip:animated:", a3, 1, 0);
}

- (void)setProminent:(BOOL)a3 allowSkip:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  NSDate *v7;
  NSDate *dateBecameProminent;
  id v9;
  NSObject *v10;
  const char *v11;
  NSDate *v13;
  double v14;
  double v15;
  double v16;
  id v17;
  NSObject *v18;
  NSDate *v19;
  id v20;
  int v21;
  const char *v22;

  v5 = a5;
  if (a3)
  {
    if (self->_limitedMode)
      return;
    self->_prominent = 1;
    v7 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    dateBecameProminent = self->_dateBecameProminent;
    self->_dateBecameProminent = v7;

    v9 = sub_10043302C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    v21 = 136315138;
    v22 = "-[StatusIndicatorView setProminent:allowSkip:animated:]";
    v11 = "%s became prominent";
    goto LABEL_16;
  }
  v13 = self->_dateBecameProminent;
  if (v13 || !a4)
  {
    -[NSDate timeIntervalSinceNow](v13, "timeIntervalSinceNow");
    v15 = v14;
    -[NSDate timeIntervalSinceNow](self->_dateBecameProminent, "timeIntervalSinceNow");
    if (v15 < 0.0)
      v16 = -v16;
    if (v16 > 5.0 || !a4)
    {
      self->_prominent = 0;
      v19 = self->_dateBecameProminent;
      self->_dateBecameProminent = 0;

      v20 = sub_10043302C();
      v10 = objc_claimAutoreleasedReturnValue(v20);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
LABEL_17:

        -[StatusIndicatorView _updateIndicatorProminenceAnimated:](self, "_updateIndicatorProminenceAnimated:", v5);
        return;
      }
      v21 = 136315138;
      v22 = "-[StatusIndicatorView setProminent:allowSkip:animated:]";
      v11 = "%s resign prominent";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, v11, (uint8_t *)&v21, 0xCu);
      goto LABEL_17;
    }
    v17 = sub_10043302C();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v21 = 136315138;
      v22 = "-[StatusIndicatorView setProminent:allowSkip:animated:]";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%s skip resign prominent", (uint8_t *)&v21, 0xCu);
    }

  }
}

- (BOOL)isVisible
{
  return self->_type > 1;
}

- (BOOL)showsDisclosure
{
  unint64_t type;

  type = self->_type;
  if (type < 8 && ((0x9Fu >> type) & 1) != 0)
    return 0;
  else
    return !-[StatusIndicatorView limitedMode](self, "limitedMode");
}

- (void)setType:(unint64_t)a3
{
  if (self->_type != a3)
  {
    self->_type = a3;
    -[StatusIndicatorView _updateIndicatorWithType:animated:](self, "_updateIndicatorWithType:animated:");
  }
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)StatusIndicatorView;
  -[StatusIndicatorView layoutSubviews](&v3, "layoutSubviews");
  -[UIView bounds](self->_contentView, "bounds");
  -[UIView _setContinuousCornerRadius:](self->_contentView, "_setContinuousCornerRadius:", CGRectGetHeight(v4) * 0.5);
}

- (void)setTarget:(id)a3 action:(SEL)a4
{
  objc_storeWeak(&self->_target, a3);
  self->_action = a4;
}

- (void)didTapStatusIndicatorView
{
  id *p_target;
  id WeakRetained;
  char v5;
  id v6;

  p_target = &self->_target;
  WeakRetained = objc_loadWeakRetained(&self->_target);
  v5 = objc_opt_respondsToSelector(WeakRetained, self->_action);

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained(p_target);
    objc_msgSend(v6, "performSelector:withObject:", self->_action, self);

  }
}

- (void)updateTheme
{
  unsigned int v3;
  BOOL v4;
  _BOOL8 touched;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  uint64_t v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  id v23;

  if (-[StatusIndicatorView showsDisclosure](self, "showsDisclosure"))
    v3 = -[StatusIndicatorView isProminent](self, "isProminent");
  else
    v3 = 0;
  if ((id)-[StatusIndicatorView statusBarStyle](self, "statusBarStyle") != (id)1)
  {
    if (-[StatusIndicatorView statusBarStyle](self, "statusBarStyle"))
    {
      v4 = 0;
      if (!v3)
        goto LABEL_12;
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[StatusIndicatorView traitCollection](self, "traitCollection"));
      v4 = objc_msgSend(v12, "userInterfaceStyle") == (id)2;

      if (!v3)
        goto LABEL_12;
    }
LABEL_9:
    touched = self->_touched;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[StatusIndicatorView theme](self, "theme"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "statusIndicatorBackgroundColor:", touched));
    -[UIView setBackgroundColor:](self->_contentView, "setBackgroundColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[StatusIndicatorView theme](self, "theme"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "statusIndicatorTextColorForStyleLightContent:", 0));
    -[UILabel setTextColor:](self->_label, "setTextColor:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[StatusIndicatorView theme](self, "theme"));
    v23 = v10;
    goto LABEL_10;
  }
  v4 = 1;
  if (v3)
    goto LABEL_9;
LABEL_12:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UIView setBackgroundColor:](self->_contentView, "setBackgroundColor:", v13);

  v14 = self->_touched;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[StatusIndicatorView theme](self, "theme"));
  v16 = v15;
  if (!v4)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "statusIndicatorTextColorForStyleDefault:", v14));
    -[UILabel setTextColor:](self->_label, "setTextColor:", v20);

    v21 = self->_touched;
    v23 = (id)objc_claimAutoreleasedReturnValue(-[StatusIndicatorView theme](self, "theme"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "statusIndicatorTextColorForStyleDefault:", v21));
    goto LABEL_17;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "statusIndicatorTextColorForStyleLightContent:", v14));
  -[UILabel setTextColor:](self->_label, "setTextColor:", v17);

  v18 = self->_touched;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[StatusIndicatorView theme](self, "theme"));
  v23 = v10;
  if (v18)
  {
    v11 = 1;
    goto LABEL_15;
  }
LABEL_10:
  v11 = 0;
LABEL_15:
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "statusIndicatorTextColorForStyleLightContent:", v11));
LABEL_17:
  v22 = (void *)v19;
  -[UIImageView setTintColor:](self->_disclosure, "setTintColor:", v19);

}

- (double)_topPadding
{
  uint64_t v2;
  double result;

  v2 = sub_1002A8AA0(self);
  result = 0.0;
  if (v2 == 5)
    return 13.0;
  return result;
}

- (id)constraintsForPositionInStatusBarBackgroundView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];

  v4 = a3;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[StatusIndicatorView topAnchor](self, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "safeAreaTopLayoutAnchor"));
  -[StatusIndicatorView _topPadding](self, "_topPadding");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v17));
  v19[0] = v16;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StatusIndicatorView bottomAnchor](self, "bottomAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
  v19[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[StatusIndicatorView leadingAnchor](self, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  v19[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[StatusIndicatorView trailingAnchor](self, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
  v19[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 4));

  return v14;
}

- (id)initialConstraintsForAnimatingPositionInStatusBarBackgroundView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];

  v4 = a3;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[StatusIndicatorView topAnchor](self, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "safeAreaTopLayoutAnchor"));
  -[StatusIndicatorView _topPadding](self, "_topPadding");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v17));
  v19[0] = v16;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StatusIndicatorView bottomAnchor](self, "bottomAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "safeAreaTopLayoutAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
  v19[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[StatusIndicatorView leadingAnchor](self, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  v19[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[StatusIndicatorView trailingAnchor](self, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
  v19[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 4));

  return v14;
}

- (void)updateWithStatusBarStyle:(int64_t)a3
{
  if (-[StatusIndicatorView statusBarStyle](self, "statusBarStyle") != a3)
  {
    -[StatusIndicatorView setStatusBarStyle:](self, "setStatusBarStyle:", a3);
    -[StatusIndicatorView updateTheme](self, "updateTheme");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)StatusIndicatorView;
  v4 = a3;
  -[MapsThemeView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StatusIndicatorView traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[StatusIndicatorView updateTheme](self, "updateTheme");
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double top;
  double left;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  -[StatusIndicatorView bounds](self, "bounds", a4);
  top = self->_touchInsets.top;
  left = self->_touchInsets.left;
  v15.origin.x = v9 + left;
  v15.origin.y = v10 + top;
  v15.size.width = v11 - (left + self->_touchInsets.right);
  v15.size.height = v12 - (top + self->_touchInsets.bottom);
  v14.x = x;
  v14.y = y;
  return CGRectContainsPoint(v15, v14);
}

- (id)_labelFont
{
  void *v3;

  if (-[StatusIndicatorView showsDisclosure](self, "showsDisclosure")
    && -[StatusIndicatorView isProminent](self, "isProminent"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_boldSystemFontWithFixedSize:](UIFont, "_maps_boldSystemFontWithFixedSize:", 15.0));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_systemFontWithFixedSize:](UIFont, "_maps_systemFontWithFixedSize:", 13.0));
  }
  return v3;
}

- (void)_updateIndicatorProminenceAnimated:(BOOL)a3
{
  _BOOL4 v3;
  unsigned __int8 v5;
  __CFString *v6;
  id v7;
  _QWORD *v8;
  id v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;
  unsigned __int8 v15;

  v3 = a3;
  v5 = -[StatusIndicatorView isProminent](self, "isProminent");
  v6 = sub_10079C294(self->_type);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10047468C;
  v13[3] = &unk_1011AC838;
  v13[4] = self;
  v15 = v5;
  v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  v14 = v7;
  v8 = objc_retainBlock(v13);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100474B4C;
  v11[3] = &unk_1011ACCB8;
  v11[4] = self;
  v9 = v7;
  v12 = v9;
  v10 = objc_retainBlock(v11);
  if (v3)
  {
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v8, v10, 0.25);
  }
  else
  {
    ((void (*)(_QWORD *))v8[2])(v8);
    ((void (*)(_QWORD *, uint64_t))v10[2])(v10, 1);
  }

}

- (void)_updateIndicatorWithType:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  NSObject *v8;
  _BOOL8 v9;
  _QWORD v10[5];
  BOOL v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  unint64_t v15;

  v4 = a4;
  v7 = sub_10043302C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[StatusIndicatorView _updateIndicatorWithType:animated:]";
    v14 = 2048;
    v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s type = %lu", buf, 0x16u);
  }

  v9 = !self->_limitedMode && -[StatusIndicatorView showsDisclosure](self, "showsDisclosure");
  -[StatusIndicatorView setProminent:allowSkip:animated:](self, "setProminent:allowSkip:animated:", v9, 0, v4);
  -[UIImageView setHidden:](self->_disclosure, "setHidden:", v9 ^ 1);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100474CB4;
  v10[3] = &unk_1011ACE58;
  v10[4] = self;
  v11 = v9;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v10);
}

- (void)setTouched:(BOOL)a3
{
  if (self->_touched != a3)
  {
    self->_touched = a3;
    -[StatusIndicatorView updateTheme](self, "updateTheme");
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  _BOOL8 v19;
  id v20;
  CGPoint v21;
  CGRect v22;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[StatusIndicatorView window](self, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "touchesForWindow:", v6));

  v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "anyObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[StatusIndicatorView contentView](self, "contentView"));
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  objc_msgSend(v20, "locationInView:", self);
  v21.x = v17;
  v21.y = v18;
  v22.origin.x = v10;
  v22.origin.y = v12;
  v22.size.width = v14;
  v22.size.height = v16;
  self->_touchInitiallyInside = CGRectContainsPoint(v22, v21);
  v19 = objc_msgSend(v20, "tapCount") == (id)1
     && -[StatusIndicatorView showsDisclosure](self, "showsDisclosure")
     && self->_touchInitiallyInside;
  -[StatusIndicatorView setTouched:](self, "setTouched:", v19);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  _BOOL4 v19;
  _BOOL8 v20;
  id v21;
  CGPoint v22;
  CGRect v23;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[StatusIndicatorView window](self, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "touchesForWindow:", v6));

  v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "anyObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[StatusIndicatorView contentView](self, "contentView"));
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  objc_msgSend(v21, "locationInView:", self);
  v22.x = v17;
  v22.y = v18;
  v23.origin.x = v10;
  v23.origin.y = v12;
  v23.size.width = v14;
  v23.size.height = v16;
  v19 = CGRectContainsPoint(v23, v22);
  if (objc_msgSend(v21, "tapCount") == (id)1 && -[StatusIndicatorView showsDisclosure](self, "showsDisclosure"))
    v20 = self->_touchInitiallyInside && v19;
  else
    v20 = 0;
  -[StatusIndicatorView setTouched:](self, "setTouched:", v20);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[StatusIndicatorView setTouched:](self, "setTouched:", 0, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if (-[StatusIndicatorView touched](self, "touched", a3, a4))
  {
    -[StatusIndicatorView setTouched:](self, "setTouched:", 0);
    if (!self->_limitedMode)
    {
      if (-[StatusIndicatorView showsDisclosure](self, "showsDisclosure"))
        -[StatusIndicatorView didTapStatusIndicatorView](self, "didTapStatusIndicatorView");
    }
  }
}

- (BOOL)isProminent
{
  return self->_prominent;
}

- (unint64_t)type
{
  return self->_type;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (CALayer)extraLabelShadowLayer
{
  return self->_extraLabelShadowLayer;
}

- (void)setExtraLabelShadowLayer:(id)a3
{
  objc_storeStrong((id *)&self->_extraLabelShadowLayer, a3);
}

- (UIImageView)disclosure
{
  return self->_disclosure;
}

- (void)setDisclosure:(id)a3
{
  objc_storeStrong((id *)&self->_disclosure, a3);
}

- (CALayer)extraDisclosureShadowLayer
{
  return self->_extraDisclosureShadowLayer;
}

- (void)setExtraDisclosureShadowLayer:(id)a3
{
  objc_storeStrong((id *)&self->_extraDisclosureShadowLayer, a3);
}

- (int64_t)statusBarStyle
{
  return self->_statusBarStyle;
}

- (void)setStatusBarStyle:(int64_t)a3
{
  self->_statusBarStyle = a3;
}

- (NSLayoutConstraint)labelTrailingConstraintWithDisclosureHidden
{
  return self->_labelTrailingConstraintWithDisclosureHidden;
}

- (void)setLabelTrailingConstraintWithDisclosureHidden:(id)a3
{
  objc_storeStrong((id *)&self->_labelTrailingConstraintWithDisclosureHidden, a3);
}

- (NSLayoutConstraint)labelTrailingConstraintWithDisclosureShown
{
  return self->_labelTrailingConstraintWithDisclosureShown;
}

- (void)setLabelTrailingConstraintWithDisclosureShown:(id)a3
{
  objc_storeStrong((id *)&self->_labelTrailingConstraintWithDisclosureShown, a3);
}

- (NSLayoutConstraint)contentViewTopConstraint
{
  return self->_contentViewTopConstraint;
}

- (void)setContentViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewTopConstraint, a3);
}

- (NSLayoutConstraint)contentViewBottomConstraint
{
  return self->_contentViewBottomConstraint;
}

- (void)setContentViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, a3);
}

- (BOOL)limitedMode
{
  return self->_limitedMode;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (UIEdgeInsets)touchInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_touchInsets.top;
  left = self->_touchInsets.left;
  bottom = self->_touchInsets.bottom;
  right = self->_touchInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTouchInsets:(UIEdgeInsets)a3
{
  self->_touchInsets = a3;
}

- (BOOL)touched
{
  return self->_touched;
}

- (BOOL)touchInitiallyInside
{
  return self->_touchInitiallyInside;
}

- (void)setTouchInitiallyInside:(BOOL)a3
{
  self->_touchInitiallyInside = a3;
}

- (NSDate)dateBecameProminent
{
  return self->_dateBecameProminent;
}

- (void)setDateBecameProminent:(id)a3
{
  objc_storeStrong((id *)&self->_dateBecameProminent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateBecameProminent, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_labelTrailingConstraintWithDisclosureShown, 0);
  objc_storeStrong((id *)&self->_labelTrailingConstraintWithDisclosureHidden, 0);
  objc_storeStrong((id *)&self->_extraDisclosureShadowLayer, 0);
  objc_storeStrong((id *)&self->_disclosure, 0);
  objc_storeStrong((id *)&self->_extraLabelShadowLayer, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
