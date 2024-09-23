@implementation ReservationLabelReusableView

- (ReservationLabelReusableView)initWithFrame:(CGRect)a3
{
  ReservationLabelReusableView *v3;
  ReservationLabelReusableView *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSLayoutConstraint *leadingConstraintWithoutMargin;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSLayoutConstraint *leadingConstraintWithMargin;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UILabel *label;
  objc_super v26;
  _QWORD v27[3];

  v26.receiver = self;
  v26.super_class = (Class)ReservationLabelReusableView;
  v3 = -[ReservationLabelReusableView initWithFrame:](&v26, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[ReservationLabelReusableView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    v5 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[UILabel setTextAlignment:](v5, "setTextAlignment:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption1));
    -[UILabel setFont:](v5, "setFont:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v5, "setTextColor:", v7);

    -[ReservationLabelReusableView addSubview:](v4, "addSubview:", v5);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5, "leadingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationLabelReusableView leadingAnchor](v4, "leadingAnchor"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
    leadingConstraintWithoutMargin = v4->_leadingConstraintWithoutMargin;
    v4->_leadingConstraintWithoutMargin = (NSLayoutConstraint *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5, "leadingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationLabelReusableView layoutMarginsGuide](v4, "layoutMarginsGuide"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
    leadingConstraintWithMargin = v4->_leadingConstraintWithMargin;
    v4->_leadingConstraintWithMargin = (NSLayoutConstraint *)v15;

    v27[0] = v4->_leadingConstraintWithoutMargin;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v5, "trailingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationLabelReusableView trailingAnchor](v4, "trailingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
    v27[1] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v5, "topAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationLabelReusableView topAnchor](v4, "topAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 10.0));
    v27[2] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 3));
    -[ReservationLabelReusableView addConstraints:](v4, "addConstraints:", v23);

    label = v4->_label;
    v4->_label = v5;

  }
  return v4;
}

- (void)setMarginsRequired:(BOOL)a3
{
  if (self->_marginsRequired != a3)
  {
    self->_marginsRequired = a3;
    -[ReservationLabelReusableView _updateConstraintsForMargins](self, "_updateConstraintsForMargins");
    -[ReservationLabelReusableView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)updateConstraints
{
  objc_super v3;

  -[ReservationLabelReusableView _updateConstraintsForMargins](self, "_updateConstraintsForMargins");
  v3.receiver = self;
  v3.super_class = (Class)ReservationLabelReusableView;
  -[ReservationLabelReusableView updateConstraints](&v3, "updateConstraints");
}

- (void)_updateConstraintsForMargins
{
  void *v3;
  void *v4;
  void *v5;
  void **v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (-[ReservationLabelReusableView isMarginsRequired](self, "isMarginsRequired"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationLabelReusableView leadingConstraintWithMargin](self, "leadingConstraintWithMargin"));
    v13 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationLabelReusableView leadingConstraintWithoutMargin](self, "leadingConstraintWithoutMargin"));
    v12 = v5;
    v6 = &v12;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationLabelReusableView leadingConstraintWithoutMargin](self, "leadingConstraintWithoutMargin"));
    v11 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v8);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationLabelReusableView leadingConstraintWithMargin](self, "leadingConstraintWithMargin"));
    v10 = v5;
    v6 = &v10;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 1));
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v9);

}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (BOOL)isMarginsRequired
{
  return self->_marginsRequired;
}

- (NSLayoutConstraint)leadingConstraintWithoutMargin
{
  return self->_leadingConstraintWithoutMargin;
}

- (void)setLeadingConstraintWithoutMargin:(id)a3
{
  objc_storeStrong((id *)&self->_leadingConstraintWithoutMargin, a3);
}

- (NSLayoutConstraint)leadingConstraintWithMargin
{
  return self->_leadingConstraintWithMargin;
}

- (void)setLeadingConstraintWithMargin:(id)a3
{
  objc_storeStrong((id *)&self->_leadingConstraintWithMargin, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadingConstraintWithMargin, 0);
  objc_storeStrong((id *)&self->_leadingConstraintWithoutMargin, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
