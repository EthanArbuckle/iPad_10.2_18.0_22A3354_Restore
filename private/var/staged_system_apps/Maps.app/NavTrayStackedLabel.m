@implementation NavTrayStackedLabel

- (NavTrayStackedLabel)initWithFrame:(CGRect)a3
{
  NavTrayStackedLabel *v3;
  NavTrayStackedLabel *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NavTrayStackedLabel;
  v3 = -[NavTrayStackedLabel initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[NavTrayStackedLabel setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    -[NavTrayStackedLabel _setup](v4, "_setup");
  }
  return v4;
}

- (NavTrayStackedLabel)init
{
  NavTrayStackedLabel *v2;
  NavTrayStackedLabel *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NavTrayStackedLabel;
  v2 = -[NavTrayStackedLabel initWithFrame:](&v5, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v3 = v2;
  if (v2)
    -[NavTrayStackedLabel _setup](v2, "_setup");
  return v3;
}

- (void)_setup
{
  UILabel *v3;
  UILabel *topLabel;
  UILabel *v5;
  UILabel *bottomLabel;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *interLabelConstraint;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSLayoutConstraint *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[7];

  v3 = objc_opt_new(UILabel);
  topLabel = self->_topLabel;
  self->_topLabel = v3;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_topLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_topLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setAccessibilityIdentifier:](self->_topLabel, "setAccessibilityIdentifier:", CFSTR("TopLabel"));
  -[NavTrayStackedLabel addSubview:](self, "addSubview:", self->_topLabel);
  v5 = objc_opt_new(UILabel);
  bottomLabel = self->_bottomLabel;
  self->_bottomLabel = v5;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_bottomLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_bottomLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setAccessibilityIdentifier:](self->_bottomLabel, "setAccessibilityIdentifier:", CFSTR("BottomLabel"));
  -[NavTrayStackedLabel addSubview:](self, "addSubview:", self->_bottomLabel);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_bottomLabel, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_topLabel, "bottomAnchor"));
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
  interLabelConstraint = self->_interLabelConstraint;
  self->_interLabelConstraint = v9;

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_topLabel, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel leadingAnchor](self, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
  v31[0] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_topLabel, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel trailingAnchor](self, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
  v31[1] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_topLabel, "topAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel topAnchor](self, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
  v31[2] = v22;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_bottomLabel, "leadingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel leadingAnchor](self, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
  v31[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_bottomLabel, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel trailingAnchor](self, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
  v17 = self->_interLabelConstraint;
  v31[4] = v16;
  v31[5] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_bottomLabel, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayStackedLabel bottomAnchor](self, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
  v31[6] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 7));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

}

- (void)setInterLabelPadding:(double)a3
{
  if (vabdd_f64(self->_interLabelPadding, a3) > 2.22044605e-16)
  {
    self->_interLabelPadding = a3;
    -[NSLayoutConstraint setConstant:](self->_interLabelConstraint, "setConstant:");
    -[NavTrayStackedLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (CGSize)intrinsicContentSize
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
  CGSize result;

  -[UILabel intrinsicContentSize](self->_topLabel, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  -[UILabel intrinsicContentSize](self->_bottomLabel, "intrinsicContentSize");
  if (v4 <= v7)
    v4 = v7;
  v9 = v6 + v8;
  -[NavTrayStackedLabel interLabelPadding](self, "interLabelPadding");
  v11 = v10 + v9;
  v12 = v4;
  result.height = v11;
  result.width = v12;
  return result;
}

- (double)interLabelPadding
{
  return self->_interLabelPadding;
}

- (UILabel)topLabel
{
  return self->_topLabel;
}

- (UILabel)bottomLabel
{
  return self->_bottomLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomLabel, 0);
  objc_storeStrong((id *)&self->_topLabel, 0);
  objc_storeStrong((id *)&self->_interLabelConstraint, 0);
}

@end
