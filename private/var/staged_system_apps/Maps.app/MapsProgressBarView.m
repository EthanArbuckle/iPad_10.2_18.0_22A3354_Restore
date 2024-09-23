@implementation MapsProgressBarView

- (MapsProgressBarView)initWithFrame:(CGRect)a3
{
  MapsProgressBarView *v3;
  MapsProgressBarView *v4;
  MapsProgressBarView *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MapsProgressBarView;
  v3 = -[MapsProgressBarView initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MapsProgressBarView _customInit](v3, "_customInit");
    v5 = v4;
  }
  else
  {
    v6 = (objc_class *)objc_opt_class(0);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(0, "setAccessibilityIdentifier:", v8);

  }
  return v4;
}

- (void)_customInit
{
  UIView *v3;
  UIView *fillView;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *progressFillConstraint;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSLayoutConstraint *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];

  -[MapsProgressBarView setClipsToBounds:](self, "setClipsToBounds:", 1);
  self->_fillStyle = 0;
  v3 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  fillView = self->_fillView;
  self->_fillView = v3;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_fillView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MapsProgressBarView addSubview:](self, "addSubview:", self->_fillView);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_fillView, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsProgressBarView leadingAnchor](self, "leadingAnchor"));
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
  progressFillConstraint = self->_progressFillConstraint;
  self->_progressFillConstraint = v7;

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_fillView, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsProgressBarView topAnchor](self, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v9));
  v20[0] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_fillView, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsProgressBarView bottomAnchor](self, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
  v20[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_fillView, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsProgressBarView leadingAnchor](self, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
  v17 = self->_progressFillConstraint;
  v20[2] = v16;
  v20[3] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

}

- (void)updateTheme
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MapsProgressBarView theme](self, "theme"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "progressBarTrackTintColor"));
  -[MapsProgressBarView setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[MapsProgressBarView _updateFillTintColor](self, "_updateFillTintColor");
}

- (void)setProgress:(double)a3
{
  BOOL v3;
  double v4;

  if (self->_progress != a3)
  {
    v3 = a3 > 1.0 || a3 < 0.0;
    v4 = fmin(fmax(a3, 0.0), 1.0);
    if (v3)
      a3 = v4;
    self->_progress = a3;
    -[MapsProgressBarView _updateFillConstraint](self, "_updateFillConstraint");
  }
}

- (void)setFillStyle:(unint64_t)a3
{
  self->_fillStyle = a3;
  -[MapsProgressBarView _updateFillTintColor](self, "_updateFillTintColor");
}

- (void)layoutSubviews
{
  CGFloat v3;
  void *v4;
  CGFloat v5;
  void *v6;
  objc_super v7;
  CGRect v8;
  CGRect v9;

  v7.receiver = self;
  v7.super_class = (Class)MapsProgressBarView;
  -[MapsProgressBarView layoutSubviews](&v7, "layoutSubviews");
  -[MapsProgressBarView bounds](self, "bounds");
  v3 = CGRectGetHeight(v8) * 0.5;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsProgressBarView layer](self, "layer"));
  objc_msgSend(v4, "setCornerRadius:", v3);

  -[UIView bounds](self->_fillView, "bounds");
  v5 = CGRectGetHeight(v9) * 0.5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_fillView, "layer"));
  objc_msgSend(v6, "setCornerRadius:", v5);

  -[MapsProgressBarView _updateFillConstraint](self, "_updateFillConstraint");
}

- (void)_updateFillConstraint
{
  double progress;
  CGFloat Width;
  uint64_t v5;
  double v6;
  double v7;
  CGRect v8;

  if (self->_fillView)
  {
    progress = self->_progress;
    -[MapsProgressBarView bounds](self, "bounds");
    Width = CGRectGetWidth(v8);
    v6 = UIRoundToViewScale(self, v5, progress * Width);
    -[NSLayoutConstraint constant](self->_progressFillConstraint, "constant");
    if (vabdd_f64(v6, v7) > 2.22044605e-16)
      -[NSLayoutConstraint setConstant:](self->_progressFillConstraint, "setConstant:", v6);
  }
}

- (void)_updateFillTintColor
{
  void *v3;
  void *v4;
  unint64_t fillStyle;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsProgressBarView window](self, "window"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsProgressBarView theme](self, "theme"));
    fillStyle = self->_fillStyle;
    if (fillStyle == 2)
    {
      v8 = v4;
      v6 = objc_claimAutoreleasedReturnValue(-[MapsProgressBarView tintColor](self, "tintColor"));
    }
    else if (fillStyle == 1)
    {
      v8 = v4;
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "progressBarLightFillTintColor"));
    }
    else
    {
      if (fillStyle)
      {
LABEL_10:

        return;
      }
      v8 = v4;
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "progressBarDarkFillTintColor"));
    }
    v7 = (void *)v6;
    -[UIView setBackgroundColor:](self->_fillView, "setBackgroundColor:", v6);

    v4 = v8;
    goto LABEL_10;
  }
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MapsProgressBarView;
  -[MapsProgressBarView tintColorDidChange](&v3, "tintColorDidChange");
  -[MapsProgressBarView _updateFillTintColor](self, "_updateFillTintColor");
}

- (double)progress
{
  return self->_progress;
}

- (unint64_t)fillStyle
{
  return self->_fillStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressFillConstraint, 0);
  objc_storeStrong((id *)&self->_fillView, 0);
}

@end
