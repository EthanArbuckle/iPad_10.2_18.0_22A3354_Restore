@implementation FRSpinnerView

+ (id)loadingFont
{
  if (qword_10010A560 != -1)
    dispatch_once(&qword_10010A560, &stru_1000DBF88);
  return (id)qword_10010A558;
}

+ (CGSize)loadingLabelSize
{
  double v2;
  double v3;
  _QWORD block[5];
  CGSize result;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100042434;
  block[3] = &unk_1000DBA48;
  block[4] = a1;
  if (qword_10010A578 != -1)
    dispatch_once(&qword_10010A578, block);
  v2 = *(double *)&qword_10010A568;
  v3 = *(double *)&qword_10010A570;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)loadingText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("LOADING"), &stru_1000DF290, 0));

  return v3;
}

+ (void)initialize
{
  id v3;

  v3 = objc_msgSend(a1, "loadingFont");
  objc_msgSend(a1, "loadingLabelSize");
}

- (FRSpinnerView)initWithFrame:(CGRect)a3
{
  return (FRSpinnerView *)-[FRSpinnerView _init](self, "_init", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (FRSpinnerView)initWithCoder:(id)a3
{
  return (FRSpinnerView *)-[FRSpinnerView _init](self, "_init", a3);
}

- (id)_init
{
  FRSpinnerView *v2;
  FRSpinnerView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FRSpinnerView;
  v2 = -[FRSpinnerView initWithFrame:](&v5, "initWithFrame:", 0.0, 0.0, 110.0, 38.0);
  v3 = v2;
  if (v2)
  {
    v2->_isAnimating = 0;
    -[FRSpinnerView _setupViews](v2, "_setupViews");
  }
  return v3;
}

- (void)_setupViews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;

  v3 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
  -[FRSpinnerView setActivityIndicator:](self, "setActivityIndicator:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpinnerView activityIndicator](self, "activityIndicator"));
  objc_msgSend(v4, "setHidesWhenStopped:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.45));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 1.0));
  v44 = (id)objc_claimAutoreleasedReturnValue(+[UIColor fr_dynamicColor:withDarkStyleVariant:](UIColor, "fr_dynamicColor:withDarkStyleVariant:", v5, v6));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpinnerView activityIndicator](self, "activityIndicator"));
  objc_msgSend(v7, "setColor:", v44);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpinnerView activityIndicator](self, "activityIndicator"));
  objc_msgSend(v8, "setAutoresizingMask:", 63);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpinnerView activityIndicator](self, "activityIndicator"));
  -[FRSpinnerView addSubview:](self, "addSubview:", v9);

  -[FRSpinnerView center](self, "center");
  v11 = v10;
  -[FRSpinnerView center](self, "center");
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpinnerView activityIndicator](self, "activityIndicator"));
  objc_msgSend(v14, "setCenter:", v11, v13);

  v15 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[FRSpinnerView setLabel:](self, "setLabel:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpinnerView label](self, "label"));
  objc_msgSend(v16, "setTextAlignment:", 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpinnerView label](self, "label"));
  objc_msgSend(v17, "setNumberOfLines:", 1);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpinnerView label](self, "label"));
  objc_msgSend(v18, "setLineBreakMode:", 0);

  v20 = objc_msgSend((id)objc_opt_class(self, v19), "loadingFont");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpinnerView label](self, "label"));
  objc_msgSend(v22, "setFont:", v21);

  v24 = objc_msgSend((id)objc_opt_class(self, v23), "loadingText");
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpinnerView label](self, "label"));
  objc_msgSend(v26, "setText:", v25);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpinnerView label](self, "label"));
  objc_msgSend(v27, "setTextColor:", v44);

  objc_msgSend((id)objc_opt_class(self, v28), "loadingLabelSize");
  v30 = v29;
  v32 = v31;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpinnerView label](self, "label"));
  objc_msgSend(v33, "setBounds:", 0.0, 0.0, v30, v32);

  -[FRSpinnerView center](self, "center");
  v35 = v34;
  -[FRSpinnerView center](self, "center");
  v37 = v36;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpinnerView activityIndicator](self, "activityIndicator"));
  objc_msgSend(v38, "bounds");
  v40 = v37 + v39;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpinnerView label](self, "label"));
  objc_msgSend(v41, "setCenter:", v35, v40);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpinnerView label](self, "label"));
  objc_msgSend(v42, "setAlpha:", 0.0);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpinnerView label](self, "label"));
  -[FRSpinnerView addSubview:](self, "addSubview:", v43);

}

- (void)startAnimating
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpinnerView activityIndicator](self, "activityIndicator"));
  v4 = objc_msgSend(v3, "isAnimating");

  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpinnerView activityIndicator](self, "activityIndicator"));
    objc_msgSend(v5, "startAnimating");

  }
  if (!-[FRSpinnerView isAnimating](self, "isAnimating"))
  {
    self->_isAnimating = 1;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100042A88;
    v6[3] = &unk_1000D9758;
    v6[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x10000, v6, 0, 0.5, 0.0);
  }
}

- (void)stopAnimating
{
  void *v3;
  unsigned int v4;
  void *v5;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpinnerView activityIndicator](self, "activityIndicator"));
  v4 = objc_msgSend(v3, "isAnimating");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpinnerView activityIndicator](self, "activityIndicator"));
    objc_msgSend(v5, "stopAnimating");

  }
  if (-[FRSpinnerView isAnimating](self, "isAnimating"))
  {
    self->_isAnimating = 0;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100042B84;
    v6[3] = &unk_1000D9758;
    v6[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v6, 0, 0.5, 0.0);
  }
}

- (BOOL)isAccessibilityElement
{
  unsigned int v3;

  v3 = -[FRSpinnerView isAnimating](self, "isAnimating");
  if (v3)
    LOBYTE(v3) = -[FRSpinnerView _accessibilityViewIsVisible](self, "_accessibilityViewIsVisible");
  return v3;
}

- (id)accessibilityElements
{
  return 0;
}

- (id)accessibilityLabel
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpinnerView label](self, "label"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  -[NSMutableArray fc_safelyAddStringIfNonNilAndNotZeroLength:](v3, "fc_safelyAddStringIfNonNilAndNotZeroLength:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpinnerView activityIndicator](self, "activityIndicator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessibilityLabel"));
  -[NSMutableArray fc_safelyAddStringIfNonNilAndNotZeroLength:](v3, "fc_safelyAddStringIfNonNilAndNotZeroLength:", v7);

  if (-[NSMutableArray count](v3, "count"))
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v3, "componentsJoinedByString:", CFSTR(", ")));
  else
    v8 = 0;

  return v8;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  UIAccessibilityTraits v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FRSpinnerView;
  v3 = -[FRSpinnerView accessibilityTraits](&v10, "accessibilityTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpinnerView label](self, "label"));
  v5 = (unint64_t)objc_msgSend(v4, "accessibilityTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRSpinnerView activityIndicator](self, "activityIndicator"));
  v7 = (unint64_t)objc_msgSend(v6, "accessibilityTraits");
  v8 = v5 | v7 | v3 | UIAccessibilityTraitHeader;

  return v8;
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
