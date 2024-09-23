@implementation RCProgressOverlay

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCProgressOverlay;
  -[RCProgressOverlay setFrame:](&v4, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[RCProgressOverlay setNeedsLayout](self, "setNeedsLayout");
}

- (void)setProgress:(float)a3
{
  double v4;
  id v5;

  self->_progress = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCProgressOverlay progressIndicator](self, "progressIndicator"));
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setProgress:", v4);

}

- (RCEditingProgressIndicator)progressIndicator
{
  RCEditingProgressIndicator *progressIndicator;
  RCEditingProgressIndicator *v4;
  RCEditingProgressIndicator *v5;
  void *v6;
  void *v7;

  progressIndicator = self->_progressIndicator;
  if (!progressIndicator)
  {
    v4 = objc_opt_new(RCEditingProgressIndicator);
    v5 = self->_progressIndicator;
    self->_progressIndicator = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCProgressOverlay progressIndicatorColor](self, "progressIndicatorColor"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCProgressOverlay progressIndicatorColor](self, "progressIndicatorColor"));
      -[RCEditingProgressIndicator setProgressColor:](self->_progressIndicator, "setProgressColor:", v7);

    }
    -[RCProgressOverlay progress](self, "progress");
    -[RCEditingProgressIndicator setProgress:](self->_progressIndicator, "setProgress:");
    progressIndicator = self->_progressIndicator;
  }
  return progressIndicator;
}

- (void)setProgressIndicatorColor:(id)a3
{
  id v4;
  void *v5;
  id v6;

  self->_progressIndicatorColor = (UIColor *)a3;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCProgressOverlay progressIndicator](self, "progressIndicator"));
  objc_msgSend(v5, "setProgressColor:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCProgressOverlay textLabel](self, "textLabel"));
  objc_msgSend(v6, "setTextColor:", v4);

}

- (void)setStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  self->_style = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[RCProgressOverlay progressIndicator](self, "progressIndicator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCProgressOverlay dimmingView](self, "dimmingView"));
  if (a3 == 1)
  {
    -[RCProgressOverlay _setupTextIfNeeded](self, "_setupTextIfNeeded");
    objc_msgSend(v5, "editingProgressIndicatorDiameterPlayback");
    objc_msgSend(v7, "setDiameter:");
    objc_msgSend(v5, "editingProgressOuterRingThicknessPlayback");
    objc_msgSend(v7, "setOuterRingThickness:");
    -[RCProgressOverlay addSubviewAndPinToEdges:](self, "addSubviewAndPinToEdges:", v6);
    -[RCProgressOverlay sendSubviewToBack:](self, "sendSubviewToBack:", v6);
  }
  else if (!a3)
  {
    objc_msgSend(v5, "editingProgressIndicatorDiameterCell");
    objc_msgSend(v7, "setDiameter:");
    objc_msgSend(v5, "editingProgressOuterRingThicknessCell");
    objc_msgSend(v7, "setOuterRingThickness:");
  }
  -[RCProgressOverlay _setupProgressIndicator](self, "_setupProgressIndicator");

}

- (void)setDimmingBackgroundColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCProgressOverlay dimmingView](self, "dimmingView"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (UIColor)dimmingBackgroundColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCProgressOverlay dimmingView](self, "dimmingView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "backgroundColor"));

  return (UIColor *)v3;
}

- (RCProgressOverlay)initWithCoder:(id)a3
{
  RCProgressOverlay *v3;
  RCProgressOverlay *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCProgressOverlay;
  v3 = -[RCProgressOverlay initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[RCProgressOverlay _commonInit](v3, "_commonInit");
  return v4;
}

- (RCProgressOverlay)initWithFrame:(CGRect)a3
{
  RCProgressOverlay *v3;
  RCProgressOverlay *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCProgressOverlay;
  v3 = -[RCProgressOverlay initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[RCProgressOverlay _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  UIView *v3;

  v3 = objc_opt_new(UIView);
  -[UIView setAlpha:](v3, "setAlpha:", 1.0);
  -[RCProgressOverlay setDimmingView:](self, "setDimmingView:", v3);

}

- (void)presentInView:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[RCProgressOverlay setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCProgressOverlay superview](self, "superview"));

  v5 = v6;
  if (v4 != v6)
  {
    objc_msgSend(v6, "addSubviewAndPinToEdges:", self);
    -[RCProgressOverlay setAlpha:](self, "setAlpha:", 1.0);
    v5 = v6;
  }

}

- (void)dismiss
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCProgressOverlay superview](self, "superview"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v4, "progressViewDisplayDismissTime");
    v5[4] = self;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004E784;
    v6[3] = &unk_1001AB588;
    v6[4] = self;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10004E790;
    v5[3] = &unk_1001ABE38;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v6, v5);

  }
}

- (void)_setupProgressIndicator
{
  int64_t v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCProgressOverlay progressIndicator](self, "progressIndicator"));
  -[RCProgressOverlay progress](self, "progress");
  objc_msgSend(v4, "setProgress:");
  v3 = -[RCProgressOverlay style](self, "style");
  if (v3 == 1)
  {
    -[RCProgressOverlay addSubviewAndCenter:](self, "addSubviewAndCenter:", v4);
  }
  else if (!v3)
  {
    -[RCProgressOverlay addSubview:](self, "addSubview:", v4);
  }
  -[RCProgressOverlay bringSubviewToFront:](self, "bringSubviewToFront:", v4);

}

- (void)_setupTextIfNeeded
{
  UILabel *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v3 = (UILabel *)objc_claimAutoreleasedReturnValue(-[RCProgressOverlay textLabel](self, "textLabel"));
  if (!v3)
  {
    v3 = objc_opt_new(UILabel);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[RCProgressOverlay setTextLabel:](self, "setTextLabel:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SAVING_CHANGES"), &stru_1001B2BC0, 0));
    -[UILabel setText:](v3, "setText:", v5);

    -[UILabel setTextAlignment:](v3, "setTextAlignment:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v6, "progressTextFontSize");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
    -[UILabel setFont:](v3, "setFont:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCProgressOverlay progressIndicator](self, "progressIndicator"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "progressColor"));
    -[UILabel setTextColor:](v3, "setTextColor:", v9);

    -[RCProgressOverlay addSubview:](self, "addSubview:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCProgressOverlay progressIndicator](self, "progressIndicator"));
    objc_msgSend(v6, "progressTextYSpacing");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 3, 0, v10, 4, 1.0, v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCProgressOverlay progressIndicator](self, "progressIndicator"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 9, 0, v13, 9, 1.0, 0.0));

    v16[0] = v12;
    v16[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
    -[RCProgressOverlay addConstraints:](self, "addConstraints:", v15);

  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  float v15;
  double v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)RCProgressOverlay;
  -[RCProgressOverlay layoutSubviews](&v18, "layoutSubviews");
  if (!-[RCProgressOverlay style](self, "style"))
  {
    -[RCProgressOverlay frame](self, "frame");
    v4 = v3;
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCProgressOverlay progressIndicator](self, "progressIndicator"));
    objc_msgSend(v7, "frame");
    v9 = v8;
    v11 = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCProgressOverlay progressIndicator](self, "progressIndicator"));
    objc_msgSend(v12, "diameter");
    v14 = v13;

    v15 = (v6 - v11) * 0.5;
    v16 = roundf(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCProgressOverlay progressIndicator](self, "progressIndicator"));
    objc_msgSend(v17, "setFrame:", v4 - v9, v16, v14, v14);

  }
}

- (void)restyle
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RCProgressOverlay progressIndicator](self, "progressIndicator"));
  objc_msgSend(v2, "restyle");

}

- (int64_t)style
{
  return self->_style;
}

- (float)progress
{
  return self->_progress;
}

- (UIColor)progressIndicatorColor
{
  return self->_progressIndicatorColor;
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingView, a3);
}

- (void)setProgressIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_progressIndicator, a3);
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_progressIndicator, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
}

@end
