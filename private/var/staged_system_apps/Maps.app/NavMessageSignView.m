@implementation NavMessageSignView

- (id)_defaultSignLayoutDelegate
{
  return +[NavSignLayoutDelegateManager defaultMessageSignLayoutDelegate](NavSignLayoutDelegateManager, "defaultMessageSignLayoutDelegate");
}

- (void)_setupSubviews
{
  UIActivityIndicatorView *v3;
  UIActivityIndicatorView *spinner;
  void *v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NavMessageSignView;
  -[NavSignView _setupSubviews](&v8, "_setupSubviews");
  v3 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 101);
  spinner = self->_spinner;
  self->_spinner = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[UIActivityIndicatorView setColor:](self->_spinner, "setColor:", v5);

  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v6) = 1148846080;
  -[UIActivityIndicatorView setContentCompressionResistancePriority:forAxis:](self->_spinner, "setContentCompressionResistancePriority:forAxis:", 0, v6);
  LODWORD(v7) = 1148846080;
  -[UIActivityIndicatorView setContentCompressionResistancePriority:forAxis:](self->_spinner, "setContentCompressionResistancePriority:forAxis:", 1, v7);
  -[UIActivityIndicatorView setHidesWhenStopped:](self->_spinner, "setHidesWhenStopped:", 1);
  -[NavMessageSignView addSubview:](self, "addSubview:", self->_spinner);
}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *majorLabelMinWidthConstraint;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *minSideMarginConstraint;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSLayoutConstraint *v19;
  NSLayoutConstraint *spinnerLeadingMajorLabelConstraint;
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
  void *v31;
  void *v32;
  objc_super v33;
  _QWORD v34[5];

  v33.receiver = self;
  v33.super_class = (Class)NavMessageSignView;
  -[NavSignView _setupConstraints](&v33, "_setupConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavMessageSignView leadingAnchor](self, "leadingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavMessageSignView spinner](self, "spinner"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "anchorWithOffsetToAnchor:", v5));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavMessageSignView trailingAnchor](self, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "anchorWithOffsetToAnchor:", v8));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "widthAnchor"));
  v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintGreaterThanOrEqualToConstant:", 0.0));
  majorLabelMinWidthConstraint = self->_majorLabelMinWidthConstraint;
  self->_majorLabelMinWidthConstraint = v11;

  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintGreaterThanOrEqualToConstant:", 0.0));
  minSideMarginConstraint = self->_minSideMarginConstraint;
  self->_minSideMarginConstraint = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavMessageSignView spinner](self, "spinner"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
  spinnerLeadingMajorLabelConstraint = self->_spinnerLeadingMajorLabelConstraint;
  self->_spinnerLeadingMajorLabelConstraint = v19;

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[NavMessageSignView spinner](self, "spinner"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "centerYAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "centerYAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));
  v34[0] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavMessageSignView majorLabelMinWidthConstraint](self, "majorLabelMinWidthConstraint"));
  v34[1] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[NavMessageSignView minSideMarginConstraint](self, "minSideMarginConstraint"));
  v34[2] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[NavMessageSignView spinnerLeadingMajorLabelConstraint](self, "spinnerLeadingMajorLabelConstraint"));
  v34[3] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:multiplier:", v30, 1.0));
  v34[4] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);

}

- (void)_updateConstraints
{
  void *v3;
  unsigned int v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NavMessageSignView;
  -[NavSignView _updateConstraints](&v15, "_updateConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavMessageSignView spinner](self, "spinner"));
  v4 = objc_msgSend(v3, "isHidden");

  if (-[NavSignView hasMajorText](self, "hasMajorText"))
    v5 = 1.0;
  else
    v5 = 0.0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavMessageSignView majorLabelMinWidthConstraint](self, "majorLabelMinWidthConstraint"));
  objc_msgSend(v6, "setConstant:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  objc_msgSend(v7, "navSignView:textLeadingMarginForMajorText:", self, 1);
  v9 = v8;

  if (v4)
    v9 = 0.0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavMessageSignView spinnerLeadingMajorLabelConstraint](self, "spinnerLeadingMajorLabelConstraint"));
  objc_msgSend(v10, "setConstant:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView signLayoutDelegate](self, "signLayoutDelegate"));
  objc_msgSend(v11, "contentSideMarginForSign:", self);
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavMessageSignView minSideMarginConstraint](self, "minSideMarginConstraint"));
  objc_msgSend(v14, "setConstant:", v13);

}

+ (id)reroutingMessageSign
{
  NavMessageSignView *v2;

  v2 = -[NavSignView initWithFrame:]([NavMessageSignView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[NavMessageSignView setMessageType:](v2, "setMessageType:", 1);
  return v2;
}

+ (id)failedToRerouteMessageSign
{
  NavMessageSignView *v2;

  v2 = -[NavSignView initWithFrame:]([NavMessageSignView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[NavMessageSignView setMessageType:](v2, "setMessageType:", 2);
  return v2;
}

- (id)accessibilityIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self);
  return NSStringFromClass(v2);
}

- (void)setMessageType:(int64_t)a3
{
  if (self->_messageType != a3)
  {
    self->_messageType = a3;
    if (a3 == 2)
    {
      -[NavMessageSignView _configureForFailedToReroute](self, "_configureForFailedToReroute");
    }
    else if (a3 == 1)
    {
      -[NavMessageSignView _configureForRerouting](self, "_configureForRerouting");
    }
  }
}

- (void)_configureForRerouting
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[NavSignView clearContent](self, "clearContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Rerouting..."), CFSTR("localized string not found"), 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mkServerFormattedString"));

  if (v5)
  {
    v10 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  objc_msgSend(v7, "setTextAlternatives:", v6);

  if (v5)
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  objc_msgSend(v8, "setTextAlternatives:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavMessageSignView spinner](self, "spinner"));
  objc_msgSend(v9, "startAnimating");

}

- (void)_configureForFailedToReroute
{
  void *v3;
  void *v4;
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
  void *v15;

  -[NavSignView clearContent](self, "clearContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Rerouting..."), CFSTR("localized string not found"), 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mkServerFormattedString"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Data connection required"), CFSTR("localized string not found"), 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mkServerFormattedString"));

  if (v5)
  {
    v15 = v5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  }
  else
  {
    v9 = 0;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  objc_msgSend(v10, "setTextAlternatives:", v9);

  if (v5)
  if (v8)
  {
    v14 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  }
  else
  {
    v11 = 0;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  objc_msgSend(v12, "setTextAlternatives:", v11);

  if (v8)
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavMessageSignView spinner](self, "spinner"));
  objc_msgSend(v13, "startAnimating");

}

- (int64_t)messageType
{
  return self->_messageType;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (NSLayoutConstraint)majorLabelMinWidthConstraint
{
  return self->_majorLabelMinWidthConstraint;
}

- (NSLayoutConstraint)spinnerLeadingMajorLabelConstraint
{
  return self->_spinnerLeadingMajorLabelConstraint;
}

- (NSLayoutConstraint)minSideMarginConstraint
{
  return self->_minSideMarginConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minSideMarginConstraint, 0);
  objc_storeStrong((id *)&self->_spinnerLeadingMajorLabelConstraint, 0);
  objc_storeStrong((id *)&self->_majorLabelMinWidthConstraint, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
