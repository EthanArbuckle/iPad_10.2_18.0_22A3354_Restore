@implementation CarTrafficAlertView

- (CarTrafficAlertView)initWithDelegate:(id)a3 trafficAlert:(id)a4
{
  id v6;
  id v7;
  CarTrafficAlertView *v8;
  CarTrafficAlertView *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CarTrafficAlertView;
  v8 = -[CarTrafficAlertView initWithFrame:](&v11, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_trafficAlert, a4);
    -[CarTrafficAlertView _commonInit](v9, "_commonInit");
  }

  return v9;
}

- (CarTrafficAlertView)initWithDelegate:(id)a3 incidentLayoutItem:(id)a4
{
  id v6;
  id v7;
  CarTrafficAlertView *v8;
  CarTrafficAlertView *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CarTrafficAlertView;
  v8 = -[CarTrafficAlertView initWithFrame:](&v11, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_incidentLayoutItem, a4);
    -[CarTrafficAlertView _commonInit](v9, "_commonInit");
  }

  return v9;
}

- (void)_commonInit
{
  CarFocusableButton *v3;
  CarFocusableButton *closeButton;
  id v5;
  double y;
  double width;
  double height;
  UILabel *v9;
  UILabel *primaryLabel;
  void *v11;
  void *v12;
  double v13;
  UILabel *v14;
  UILabel *secondaryLabel;
  void *v16;
  void *v17;
  double v18;
  UILabel *v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  CarCardRoundedButton *v24;
  CarCardRoundedButton *cancelButton;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CarFocusableProgressButton *v31;
  CarFocusableProgressButton *acceptButton;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  UIStackView *v40;
  UIStackView *buttonStack;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
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
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  double v83;
  double v84;
  _QWORD v85[14];

  -[CarTrafficAlertView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("CarTrafficAlertView"));
  v3 = (CarFocusableButton *)objc_claimAutoreleasedReturnValue(+[CarFocusableButton closeButton](CarFocusableButton, "closeButton"));
  closeButton = self->_closeButton;
  self->_closeButton = v3;

  -[CarFocusableButton setAccessibilityIdentifier:](self->_closeButton, "setAccessibilityIdentifier:", CFSTR("CloseButton"));
  -[CarFocusableButton addTarget:action:forControlEvents:](self->_closeButton, "addTarget:action:forControlEvents:", self);
  -[CarTrafficAlertView addSubview:](self, "addSubview:", self->_closeButton);
  v5 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v9 = (UILabel *)objc_msgSend(v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v9;

  -[UILabel setAccessibilityIdentifier:](self->_primaryLabel, "setAccessibilityIdentifier:", CFSTR("PrimaryLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_primaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setLineBreakMode:](self->_primaryLabel, "setLineBreakMode:", 4);
  -[UILabel setNumberOfLines:](self->_primaryLabel, "setNumberOfLines:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleBody, UIFontWeightBold));
  -[UILabel setFont:](self->_primaryLabel, "setFont:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_primaryLabel, "setTextColor:", v12);

  LODWORD(v13) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_primaryLabel, "setContentCompressionResistancePriority:forAxis:", 1, v13);
  -[CarTrafficAlertView addSubview:](self, "addSubview:", self->_primaryLabel);
  v14 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = v14;

  -[UILabel setAccessibilityIdentifier:](self->_secondaryLabel, "setAccessibilityIdentifier:", CFSTR("SecondaryLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_secondaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setLineBreakMode:](self->_secondaryLabel, "setLineBreakMode:", 4);
  -[UILabel setNumberOfLines:](self->_secondaryLabel, "setNumberOfLines:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleFootnote, UIFontWeightRegular));
  -[UILabel setFont:](self->_secondaryLabel, "setFont:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_secondaryLabel, "font"));
  objc_msgSend(v17, "pointSize");
  v19 = self->_secondaryLabel;
  if (10.0 / v18 > 1.0)
  {
    -[UILabel setMinimumScaleFactor:](v19, "setMinimumScaleFactor:", 1.0);
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](v19, "font"));
    objc_msgSend(v20, "pointSize");
    -[UILabel setMinimumScaleFactor:](self->_secondaryLabel, "setMinimumScaleFactor:", 10.0 / v21);

  }
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_secondaryLabel, "setAdjustsFontSizeToFitWidth:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemPrimaryColor](UIColor, "_carSystemPrimaryColor"));
  -[UILabel setTextColor:](self->_secondaryLabel, "setTextColor:", v22);

  LODWORD(v23) = 1148829696;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_secondaryLabel, "setContentCompressionResistancePriority:forAxis:", 1, v23);
  -[CarTrafficAlertView addSubview:](self, "addSubview:", self->_secondaryLabel);
  v24 = -[CarCardRoundedButton initWithFrame:]([CarCardRoundedButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  cancelButton = self->_cancelButton;
  self->_cancelButton = v24;

  -[CarCardRoundedButton setAccessibilityIdentifier:](self->_cancelButton, "setAccessibilityIdentifier:", CFSTR("CancelButton"));
  -[CarCardRoundedButton setTranslatesAutoresizingMaskIntoConstraints:](self->_cancelButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleSubheadline, UIFontWeightRegular));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton titleLabel](self->_cancelButton, "titleLabel"));
  objc_msgSend(v27, "setFont:", v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemQuaternaryColor](UIColor, "_carSystemQuaternaryColor"));
  -[CarFocusableButton setNonFocusedBackgroundColor:](self->_cancelButton, "setNonFocusedBackgroundColor:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[CarFocusableButton setNonFocusedTintColor:](self->_cancelButton, "setNonFocusedTintColor:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
  -[CarFocusableButton setFocusedBackgroundColor:](self->_cancelButton, "setFocusedBackgroundColor:", v30);

  -[CarFocusableButton setModifiesBackgroundColor:](self->_cancelButton, "setModifiesBackgroundColor:", 1);
  -[CarCardRoundedButton addTarget:action:forControlEvents:](self->_cancelButton, "addTarget:action:forControlEvents:", self, "_buttonTapped:", 64);
  v31 = -[CarCardRoundedButton initWithFrame:]([CarFocusableProgressButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  acceptButton = self->_acceptButton;
  self->_acceptButton = v31;

  -[CarFocusableProgressButton setAccessibilityIdentifier:](self->_acceptButton, "setAccessibilityIdentifier:", CFSTR("AcceptButton"));
  -[CarFocusableProgressButton setTranslatesAutoresizingMaskIntoConstraints:](self->_acceptButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleSubheadline, UIFontWeightRegular));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableProgressButton titleLabel](self->_acceptButton, "titleLabel"));
  objc_msgSend(v34, "setFont:", v33);

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemQuaternaryColor](UIColor, "_carSystemQuaternaryColor"));
  -[CarFocusableButton setNonFocusedBackgroundColor:](self->_acceptButton, "setNonFocusedBackgroundColor:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[CarFocusableButton setNonFocusedTintColor:](self->_acceptButton, "setNonFocusedTintColor:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
  -[CarFocusableButton setFocusedBackgroundColor:](self->_acceptButton, "setFocusedBackgroundColor:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
  -[CarFocusableProgressButton setProgressFillColor:](self->_acceptButton, "setProgressFillColor:", v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
  -[CarFocusableProgressButton setProgressFillFocusedColor:](self->_acceptButton, "setProgressFillFocusedColor:", v39);

  -[CarFocusableButton setModifiesBackgroundColor:](self->_acceptButton, "setModifiesBackgroundColor:", 1);
  -[CarFocusableProgressButton setProgress:](self->_acceptButton, "setProgress:", 0.0);
  -[CarFocusableProgressButton addTarget:action:forControlEvents:](self->_acceptButton, "addTarget:action:forControlEvents:", self, "_buttonTapped:", 64);
  v40 = (UIStackView *)objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  buttonStack = self->_buttonStack;
  self->_buttonStack = v40;

  -[UIStackView setAccessibilityIdentifier:](self->_buttonStack, "setAccessibilityIdentifier:", CFSTR("ButtonStack"));
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_buttonStack, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_buttonStack, "setAxis:", 1);
  -[UIStackView setDistribution:](self->_buttonStack, "setDistribution:", 2);
  -[UIStackView setSpacing:](self->_buttonStack, "setSpacing:", 2.0);
  -[CarTrafficAlertView addSubview:](self, "addSubview:", self->_buttonStack);
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView topAnchor](self, "topAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_primaryLabel, "firstBaselineAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToAnchor:constant:", v81, -24.0));
  v85[0] = v80;
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_primaryLabel, "leadingAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView leadingAnchor](self, "leadingAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToAnchor:constant:", v78, 10.0));
  v85[1] = v77;
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_primaryLabel, "lastBaselineAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_secondaryLabel, "firstBaselineAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:constant:", v75, -18.0));
  v85[2] = v74;
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton topAnchor](self->_closeButton, "topAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_primaryLabel, "topAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:", v72));
  v85[3] = v71;
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton leadingAnchor](self->_closeButton, "leadingAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_primaryLabel, "trailingAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:constant:", v69, 10.0));
  v85[4] = v68;
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton trailingAnchor](self->_closeButton, "trailingAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView trailingAnchor](self, "trailingAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:constant:", v66, -10.0));
  v85[5] = v65;
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_secondaryLabel, "leadingAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView leadingAnchor](self, "leadingAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:constant:", v63, 10.0));
  v85[6] = v62;
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_secondaryLabel, "trailingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView trailingAnchor](self, "trailingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:constant:", v60, -10.0));
  v85[7] = v59;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton heightAnchor](self->_cancelButton, "heightAnchor"));
  +[CarCardRoundedButton buttonMetrics](CarCardRoundedButton, "buttonMetrics");
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToConstant:", v84));
  v85[8] = v57;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableProgressButton heightAnchor](self->_acceptButton, "heightAnchor"));
  +[CarCardRoundedButton buttonMetrics](CarCardRoundedButton, "buttonMetrics");
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToConstant:", v83));
  v85[9] = v55;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_buttonStack, "topAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_secondaryLabel, "lastBaselineAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:constant:", v53, 10.0));
  v85[10] = v52;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_buttonStack, "leadingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView leadingAnchor](self, "leadingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:constant:", v42, 10.0));
  v85[11] = v43;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_buttonStack, "trailingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView trailingAnchor](self, "trailingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:constant:", v45, -10.0));
  v85[12] = v46;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_buttonStack, "bottomAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView bottomAnchor](self, "bottomAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:constant:", v48, -10.0));
  v85[13] = v49;
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v85, 14));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v50);

  -[CarTrafficAlertView _updateView](self, "_updateView");
}

- (id)dataSource
{
  void *trafficAlert;

  trafficAlert = self->_trafficAlert;
  if (!trafficAlert)
    trafficAlert = self->_incidentLayoutItem;
  return trafficAlert;
}

- (void)setTrafficAlert:(id)a3
{
  objc_storeStrong((id *)&self->_trafficAlert, a3);
  -[CarTrafficAlertView _updateView](self, "_updateView");
}

- (void)setIncidentLayoutItem:(id)a3
{
  TrafficIncidentLayoutItem *v5;
  TrafficIncidentLayoutItem *v6;

  v5 = (TrafficIncidentLayoutItem *)a3;
  if (self->_incidentLayoutItem != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_incidentLayoutItem, a3);
    -[CarTrafficAlertView _updateView](self, "_updateView");
    v5 = v6;
  }

}

- (void)setProgressBarHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView acceptButton](self, "acceptButton"));
  objc_msgSend(v4, "setProgressBarHidden:", v3);

}

- (BOOL)progressBarHidden
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView acceptButton](self, "acceptButton"));
  v3 = objc_msgSend(v2, "progressBarHidden");

  return v3;
}

- (void)setAcceptProgress:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView acceptButton](self, "acceptButton"));
  objc_msgSend(v4, "setProgress:", a3);

}

- (double)acceptProgress
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView acceptButton](self, "acceptButton"));
  objc_msgSend(v2, "progress");
  v4 = v3;

  return v4;
}

- (void)_updateView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned __int8 v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  void *i;
  uint64_t v50;
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
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView primaryLabel](self, "primaryLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primaryString"));
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    if (qword_1014D2A28 != -1)
      dispatch_once(&qword_1014D2A28, &stru_1011BCC60);
    v8 = objc_alloc((Class)NSAttributedString);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView dataSource](self, "dataSource"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "primaryString"));
    v11 = (void *)v10;
    if (v10)
      v12 = (const __CFString *)v10;
    else
      v12 = &stru_1011EB268;
    v13 = objc_msgSend(v8, "initWithString:attributes:", v12, qword_1014D2A30);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView primaryLabel](self, "primaryLabel"));
    objc_msgSend(v14, "setAttributedText:", v13);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView secondaryLabel](self, "secondaryLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "text"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView dataSource](self, "dataSource"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "secondaryString"));
  v19 = objc_msgSend(v16, "isEqualToString:", v18);

  if ((v19 & 1) == 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView dataSource](self, "dataSource"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "secondaryString"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView secondaryLabel](self, "secondaryLabel"));
    objc_msgSend(v22, "setText:", v21);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView acceptButton](self, "acceptButton"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "titleLabel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "text"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView dataSource](self, "dataSource"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "acceptString"));
  v28 = objc_msgSend(v25, "isEqualToString:", v27);

  if ((v28 & 1) == 0)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView acceptButton](self, "acceptButton"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView dataSource](self, "dataSource"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "acceptString"));
    objc_msgSend(v29, "setTitle:forState:", v31, 0);

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView dataSource](self, "dataSource"));
  v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "cancelString"));
  if (!v33)
  {

LABEL_16:
    if ((v28 & 1) != 0)
      return;
    goto LABEL_17;
  }
  v34 = (void *)v33;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView cancelButton](self, "cancelButton"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "titleLabel"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "text"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView dataSource](self, "dataSource"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "cancelString"));
  v40 = objc_msgSend(v37, "isEqualToString:", v39);

  if ((v40 & 1) != 0)
    goto LABEL_16;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView cancelButton](self, "cancelButton"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView dataSource](self, "dataSource"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "cancelString"));
  objc_msgSend(v41, "setTitle:forState:", v43, 0);

LABEL_17:
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView buttonStack](self, "buttonStack", 0));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "arrangedSubviews"));

  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v47; i = (char *)i + 1)
      {
        if (*(_QWORD *)v63 != v48)
          objc_enumerationMutation(v45);
        v50 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView buttonStack](self, "buttonStack"));
        objc_msgSend(v51, "_maps_removeArrangedSubview:", v50);

      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
    }
    while (v47);
  }

  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView cancelButton](self, "cancelButton"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "titleLabel"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "text"));

  if (v55)
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView cancelButton](self, "cancelButton"));
    objc_msgSend(v52, "addObject:", v56);

  }
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView acceptButton](self, "acceptButton"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "titleLabel"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "text"));

  if (v59)
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView acceptButton](self, "acceptButton"));
    objc_msgSend(v52, "addObject:", v60);

  }
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView buttonStack](self, "buttonStack"));
  objc_msgSend(v61, "_maps_setArrangedSubviews:", v52);

}

- (void)_buttonTapped:(id)a3
{
  unsigned int v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  CarTrafficAlertView *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  if (self->_trafficAlert)
    v4 = +[CarTrafficAlertCardViewController alertVotable:](CarTrafficAlertCardViewController, "alertVotable:");
  else
    v4 = 0;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView acceptButton](self, "acceptButton"));

  if (v5 == v12)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView delegate](self, "delegate"));
    v8 = v9;
    if (v4)
      v11 = 3;
    else
      v11 = 1;
    goto LABEL_14;
  }
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView cancelButton](self, "cancelButton"));

  if (v6 == v12)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView delegate](self, "delegate"));
    v8 = v9;
    if (v4)
      v11 = 4;
    else
      v11 = 2;
LABEL_14:
    v10 = self;
    goto LABEL_16;
  }
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView closeButton](self, "closeButton"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView delegate](self, "delegate"));
  v9 = v8;
  v10 = self;
  if (v7 == v12)
    v11 = 5;
  else
    v11 = 0;
LABEL_16:
  objc_msgSend(v9, "trafficAlertView:didDismissWithResult:", v10, v11);

}

- (NSArray)focusOrderSubItems
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView closeButton](self, "closeButton"));
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView buttonStack](self, "buttonStack"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrangedSubviews"));
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  return (NSArray *)v3;
}

- (NSArray)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView buttonStack](self, "buttonStack"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrangedSubviews"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView acceptButton](self, "acceptButton"));
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if (!v6)
    return (NSArray *)&__NSArray0__struct;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertView acceptButton](self, "acceptButton"));
  v10 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

  return (NSArray *)v8;
}

- (CarTrafficAlertViewDelegate)delegate
{
  return (CarTrafficAlertViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MNTrafficIncidentAlert)trafficAlert
{
  return self->_trafficAlert;
}

- (TrafficIncidentLayoutItem)incidentLayoutItem
{
  return self->_incidentLayoutItem;
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLabel, a3);
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabel, a3);
}

- (CarFocusableButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (UIStackView)buttonStack
{
  return (UIStackView *)objc_getProperty(self, a2, 56, 1);
}

- (void)setButtonStack:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (CarCardRoundedButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (CarFocusableProgressButton)acceptButton
{
  return self->_acceptButton;
}

- (void)setAcceptButton:(id)a3
{
  objc_storeStrong((id *)&self->_acceptButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_buttonStack, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_incidentLayoutItem, 0);
  objc_storeStrong((id *)&self->_trafficAlert, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
