@implementation CarFocusableProgressButton

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CarFocusableProgressButton;
  -[CarFocusableButton didMoveToWindow](&v3, "didMoveToWindow");
  -[CarFocusableProgressButton _insertFillViewIfNecessary](self, "_insertFillViewIfNecessary");
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  v8.receiver = self;
  v8.super_class = (Class)CarFocusableProgressButton;
  -[CarCardRoundedButton titleRectForContentRect:](&v8, "titleRectForContentRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (!self->_progressBarHidden)
    v5 = v5 + -4.0;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)_insertFillViewIfNecessary
{
  id v3;
  double y;
  double width;
  double height;
  UIView *v7;
  UIView *barView;
  void *v9;
  void *v10;
  void *v11;
  UIView *v12;
  UIView *fillView;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *horizontalConstraint;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSLayoutConstraint *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[8];

  if (!self->_fillView)
  {
    v3 = objc_alloc((Class)UIView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v7 = (UIView *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    barView = self->_barView;
    self->_barView = v7;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_barView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setUserInteractionEnabled:](self->_barView, "setUserInteractionEnabled:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemQuaternaryColor](UIColor, "_carSystemQuaternaryColor"));
    -[UIView setBackgroundColor:](self->_barView, "setBackgroundColor:", v9);

    -[UIView setAccessibilityIdentifier:](self->_barView, "setAccessibilityIdentifier:", CFSTR("BarView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_barView, "layer"));
    objc_msgSend(v10, "setCornerRadius:", 2.0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_barView, "layer"));
    objc_msgSend(v11, "setMasksToBounds:", 1);

    -[CarFocusableProgressButton addSubview:](self, "addSubview:", self->_barView);
    v12 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    fillView = self->_fillView;
    self->_fillView = v12;

    -[UIView setAccessibilityIdentifier:](self->_fillView, "setAccessibilityIdentifier:", CFSTR("FillView"));
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_fillView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setUserInteractionEnabled:](self->_fillView, "setUserInteractionEnabled:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableProgressButton progressFillColor](self, "progressFillColor"));
    -[UIView setBackgroundColor:](self->_fillView, "setBackgroundColor:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_fillView, "layer"));
    objc_msgSend(v15, "setCornerRadius:", 2.0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_fillView, "layer"));
    objc_msgSend(v16, "setMasksToBounds:", 1);

    -[UIView addSubview:](self->_barView, "addSubview:", self->_fillView);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableProgressButton titleLabel](self, "titleLabel"));
    -[CarFocusableProgressButton bringSubviewToFront:](self, "bringSubviewToFront:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_fillView, "trailingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_barView, "leadingAnchor"));
    v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
    horizontalConstraint = self->_horizontalConstraint;
    self->_horizontalConstraint = v20;

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_barView, "bottomAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableProgressButton bottomAnchor](self, "bottomAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, -5.0));
    v44[0] = v41;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_barView, "leadingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableProgressButton leadingAnchor](self, "leadingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, 8.0));
    v44[1] = v38;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_barView, "trailingAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableProgressButton trailingAnchor](self, "trailingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:constant:", v36, -8.0));
    v44[2] = v35;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_barView, "heightAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToConstant:", 4.0));
    v44[3] = v33;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_fillView, "topAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_barView, "topAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v22));
    v44[4] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_fillView, "bottomAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_barView, "bottomAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
    v44[5] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_fillView, "leadingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_barView, "leadingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));
    v30 = self->_horizontalConstraint;
    v44[6] = v29;
    v44[7] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 8));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

  }
}

- (void)setProgress:(double)a3
{
  BOOL v4;
  double v5;

  if (self->_progress != a3)
  {
    v4 = a3 > 1.0 || a3 < 0.0;
    v5 = fmin(fmax(a3, 0.0), 1.0);
    if (v4)
      a3 = v5;
    self->_progress = a3;
    -[CarFocusableProgressButton _updateProgressConstraint](self, "_updateProgressConstraint");
    -[CarFocusableProgressButton layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setProgessFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_progressFillColor, a3);
  -[CarFocusableProgressButton _updateColors](self, "_updateColors");
}

- (void)setProgressFillFocusedColor:(id)a3
{
  objc_storeStrong((id *)&self->_progressFillFocusedColor, a3);
  -[CarFocusableProgressButton _updateColors](self, "_updateColors");
}

- (void)setProgressBarHidden:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_progressBarHidden != a3)
  {
    v3 = a3;
    self->_progressBarHidden = a3;
    -[UIView setHidden:](self->_fillView, "setHidden:");
    -[UIView setHidden:](self->_barView, "setHidden:", v3);
    -[CarFocusableProgressButton setNeedsLayout](self, "setNeedsLayout");
    -[CarFocusableProgressButton layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)focusDidChange:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarFocusableProgressButton;
  -[CarFocusableButton focusDidChange:](&v4, "focusDidChange:", a3);
  -[CarFocusableProgressButton _updateColors](self, "_updateColors");
  -[CarFocusableProgressButton _updateProgressConstraint](self, "_updateProgressConstraint");
}

- (void)_updateColors
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (-[CarFocusableProgressButton isFocused](self, "isFocused"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemTertiaryColor](UIColor, "_carSystemTertiaryColor"));
    -[UIView setBackgroundColor:](self->_barView, "setBackgroundColor:", v3);

    v4 = objc_claimAutoreleasedReturnValue(-[CarFocusableProgressButton progressFillFocusedColor](self, "progressFillFocusedColor"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemQuaternaryColor](UIColor, "_carSystemQuaternaryColor"));
    -[UIView setBackgroundColor:](self->_barView, "setBackgroundColor:", v5);

    v4 = objc_claimAutoreleasedReturnValue(-[CarFocusableProgressButton progressFillColor](self, "progressFillColor"));
  }
  v6 = (id)v4;
  -[UIView setBackgroundColor:](self->_fillView, "setBackgroundColor:", v4);

}

- (void)_updateProgressConstraint
{
  double progress;
  CGFloat Width;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  CGRect v15;

  if (self->_fillView)
  {
    progress = self->_progress;
    -[UIView bounds](self->_barView, "bounds");
    Width = CGRectGetWidth(v15);
    v6 = UIRoundToViewScale(self, v5, progress * Width);
    -[NSLayoutConstraint constant](self->_horizontalConstraint, "constant");
    if (vabdd_f64(v6, v7) > 2.22044605e-16)
      -[NSLayoutConstraint setConstant:](self->_horizontalConstraint, "setConstant:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%.2f"), CFSTR("FillView.Progress="), *(_QWORD *)&self->_progress));
    -[UIView setAccessibilityIdentifier:](self->_fillView, "setAccessibilityIdentifier:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_fillView, "layer"));
    objc_msgSend(v9, "removeAnimationForKey:", CFSTR("backgroundColor"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableProgressButton layer](self, "layer"));
    objc_msgSend(v10, "removeAnimationForKey:", CFSTR("backgroundColor"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableProgressButton titleLabel](self, "titleLabel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layer"));
    objc_msgSend(v12, "removeAnimationForKey:", CFSTR("backgroundColor"));

    v14 = (id)objc_claimAutoreleasedReturnValue(-[CarFocusableProgressButton titleLabel](self, "titleLabel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layer"));
    objc_msgSend(v13, "removeAnimationForKey:", CFSTR("contents"));

  }
}

- (double)progress
{
  return self->_progress;
}

- (UIColor)progressFillColor
{
  return self->_progressFillColor;
}

- (void)setProgressFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_progressFillColor, a3);
}

- (UIColor)progressFillFocusedColor
{
  return self->_progressFillFocusedColor;
}

- (BOOL)progressBarHidden
{
  return self->_progressBarHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressFillFocusedColor, 0);
  objc_storeStrong((id *)&self->_progressFillColor, 0);
  objc_storeStrong((id *)&self->_horizontalConstraint, 0);
  objc_storeStrong((id *)&self->_barView, 0);
  objc_storeStrong((id *)&self->_fillView, 0);
}

@end
