@implementation CarSpinnerGuidanceSign

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (CarSpinnerGuidanceSign)initWithDestination:(unint64_t)a3
{
  double y;
  double width;
  double height;
  CarSpinnerGuidanceSign *v7;
  CarSpinnerGuidanceSign *v8;
  UIActivityIndicatorView *v9;
  UIActivityIndicatorView *activityIndicator;
  UILabel *v11;
  UILabel *primaryLabel;
  UILabel *v13;
  UILabel *messageLabel;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
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
  objc_super v42;
  _QWORD v43[8];

  v42.receiver = self;
  v42.super_class = (Class)CarSpinnerGuidanceSign;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = -[CarSpinnerGuidanceSign initWithFrame:](&v42, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v8 = v7;
  if (v7)
  {
    -[CarSpinnerGuidanceSign setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", CFSTR("CarSpinnerGuidanceSign"));
    v8->_destination = a3;
    v9 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
    activityIndicator = v8->_activityIndicator;
    v8->_activityIndicator = v9;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v8->_activityIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIActivityIndicatorView setAccessibilityIdentifier:](v8->_activityIndicator, "setAccessibilityIdentifier:", CFSTR("ActivityIndicator"));
    -[CarSpinnerGuidanceSign addSubview:](v8, "addSubview:", v8->_activityIndicator);
    v11 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    primaryLabel = v8->_primaryLabel;
    v8->_primaryLabel = v11;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_primaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAccessibilityIdentifier:](v8->_primaryLabel, "setAccessibilityIdentifier:", CFSTR("PrimaryLabel"));
    -[CarSpinnerGuidanceSign addSubview:](v8, "addSubview:", v8->_primaryLabel);
    v13 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    messageLabel = v8->_messageLabel;
    v8->_messageLabel = v13;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_messageLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAccessibilityIdentifier:](v8->_messageLabel, "setAccessibilityIdentifier:", CFSTR("MessageLabel"));
    -[CarSpinnerGuidanceSign addSubview:](v8, "addSubview:", v8->_messageLabel);
    v8->_showMessage = 0;
    -[CarSpinnerGuidanceSign _updateStyling](v8, "_updateStyling");
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v8->_primaryLabel, "topAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CarSpinnerGuidanceSign topAnchor](v8, "topAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:constant:", v40, 10.0));
    v43[0] = v39;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v8->_primaryLabel, "leadingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CarSpinnerGuidanceSign leadingAnchor](v8, "leadingAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, 10.0));
    v43[1] = v36;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarSpinnerGuidanceSign trailingAnchor](v8, "trailingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v8->_primaryLabel, "trailingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, 10.0));
    v43[2] = v33;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView topAnchor](v8->_activityIndicator, "topAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v8->_primaryLabel, "bottomAnchor"));
    LODWORD(v15) = 1148829696;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:priority:", v31, 7.0, v15));
    v43[3] = v30;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView topAnchor](v8->_activityIndicator, "topAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v8->_primaryLabel, "bottomAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintGreaterThanOrEqualToAnchor:", v28));
    v43[4] = v27;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerXAnchor](v8->_activityIndicator, "centerXAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarSpinnerGuidanceSign centerXAnchor](v8, "centerXAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v16));
    v43[5] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v8->_messageLabel, "leadingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v8->_primaryLabel, "leadingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
    v43[6] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v8->_primaryLabel, "trailingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v8->_messageLabel, "trailingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
    v43[7] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 8));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

  }
  return v8;
}

- (void)setPrimaryString:(id)a3
{
  NSString *v4;
  NSString *primaryString;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  primaryString = self->_primaryString;
  self->_primaryString = v4;

  -[UILabel setText:](self->_primaryLabel, "setText:", self->_primaryString);
}

- (void)setMessageString:(id)a3
{
  NSString *v4;
  NSString *messageString;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  messageString = self->_messageString;
  self->_messageString = v4;

  -[UILabel setText:](self->_messageLabel, "setText:", self->_messageString);
}

- (void)_updateStyling
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 16.0));
  -[UILabel setFont:](self->_primaryLabel, "setFont:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarSpinnerGuidanceSign primaryString](self, "primaryString"));
  -[UILabel setText:](self->_primaryLabel, "setText:", v4);

  v5 = sub_100C556C4(self->_destination == 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[UILabel setTextColor:](self->_primaryLabel, "setTextColor:", v6);

  -[UILabel setMinimumScaleFactor:](self->_primaryLabel, "setMinimumScaleFactor:", 0.699999988);
  -[UILabel setNumberOfLines:](self->_primaryLabel, "setNumberOfLines:", 3);
  -[UILabel setTextAlignment:](self->_primaryLabel, "setTextAlignment:", 1);
  -[UILabel setLineBreakMode:](self->_primaryLabel, "setLineBreakMode:", 0);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_primaryLabel, "setAdjustsFontSizeToFitWidth:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarSpinnerGuidanceSign messageString](self, "messageString"));
  -[UILabel setText:](self->_messageLabel, "setText:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 12.0));
  -[UILabel setFont:](self->_messageLabel, "setFont:", v8);

  v9 = sub_100C556C4(self->_destination == 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[UILabel setTextColor:](self->_messageLabel, "setTextColor:", v10);

  -[UILabel setTextAlignment:](self->_messageLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_messageLabel, "setNumberOfLines:", 4);
  -[UILabel setLineBreakMode:](self->_messageLabel, "setLineBreakMode:", 0);
  -[UILabel setMinimumScaleFactor:](self->_messageLabel, "setMinimumScaleFactor:", 0.699999988);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_messageLabel, "setAdjustsFontSizeToFitWidth:", 1);
  v11 = 1.0;
  if (!self->_showMessage)
    v11 = 0.0;
  -[UILabel setAlpha:](self->_messageLabel, "setAlpha:", v11);
  -[UILabel setHidden:](self->_messageLabel, "setHidden:", !self->_showMessage);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel textColor](self->_primaryLabel, "textColor"));
  -[UIActivityIndicatorView setColor:](self->_activityIndicator, "setColor:", v12);

  -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
}

- (void)setShowMessage:(BOOL)a3
{
  -[CarSpinnerGuidanceSign setShowMessage:animated:](self, "setShowMessage:animated:", a3, 0);
}

- (void)setShowMessage:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  double v8;
  _QWORD v9[5];
  BOOL v10;
  _QWORD v11[5];
  BOOL v12;

  if (self->_showMessage != a3)
  {
    v4 = a4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarSpinnerGuidanceSign messageString](self, "messageString"));

    if (v7)
    {
      self->_showMessage = a3;
      -[CarSpinnerGuidanceSign setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
      -[CarSpinnerGuidanceSign setNeedsLayout](self, "setNeedsLayout");
      v8 = 0.300000012;
      if (!v4)
        v8 = 0.0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100849F8C;
      v11[3] = &unk_1011ACE58;
      v11[4] = self;
      v12 = a3;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100849FC8;
      v9[3] = &unk_1011AF4D8;
      v9[4] = self;
      v10 = a3;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v11, v9, v8);
    }
  }
}

- (void)updateConstraints
{
  void *v3;
  id v4;
  void *v5;
  NSMutableArray *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  objc_super v16;
  _QWORD v17[2];
  _QWORD v18[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSpinnerGuidanceSign dynamicConstraints](self, "dynamicConstraints"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarSpinnerGuidanceSign dynamicConstraints](self, "dynamicConstraints"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v5);

  }
  v6 = objc_opt_new(NSMutableArray);
  if (-[CarSpinnerGuidanceSign showsMessage](self, "showsMessage"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_messageLabel, "topAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView bottomAnchor](self->_activityIndicator, "bottomAnchor"));
    LODWORD(v9) = 1148829696;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:priority:", v8, 7.0, v9));
    v17[0] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarSpinnerGuidanceSign bottomAnchor](self, "bottomAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_messageLabel, "bottomAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 10.0));
    v17[1] = v13;
    v14 = v17;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarSpinnerGuidanceSign bottomAnchor](self, "bottomAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView bottomAnchor](self->_activityIndicator, "bottomAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, 10.0));
    v18[0] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_messageLabel, "topAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarSpinnerGuidanceSign bottomAnchor](self, "bottomAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
    v18[1] = v13;
    v14 = v18;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
  -[NSMutableArray addObjectsFromArray:](v6, "addObjectsFromArray:", v15);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v6);
  -[CarSpinnerGuidanceSign setDynamicConstraints:](self, "setDynamicConstraints:", v6);
  v16.receiver = self;
  v16.super_class = (Class)CarSpinnerGuidanceSign;
  -[CarSpinnerGuidanceSign updateConstraints](&v16, "updateConstraints");

}

- (CarGuidanceCardSizeProviding)sizeProvider
{
  return (CarGuidanceCardSizeProviding *)objc_loadWeakRetained((id *)&self->_sizeProvider);
}

- (void)setSizeProvider:(id)a3
{
  objc_storeWeak((id *)&self->_sizeProvider, a3);
}

- (NSString)primaryString
{
  return self->_primaryString;
}

- (NSString)messageString
{
  return self->_messageString;
}

- (BOOL)showsMessage
{
  return self->_showMessage;
}

- (NSArray)dynamicConstraints
{
  return self->_dynamicConstraints;
}

- (void)setDynamicConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicConstraints, 0);
  objc_storeStrong((id *)&self->_messageString, 0);
  objc_storeStrong((id *)&self->_primaryString, 0);
  objc_destroyWeak((id *)&self->_sizeProvider);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end
