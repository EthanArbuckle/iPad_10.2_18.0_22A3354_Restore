@implementation NavManeuverReroutingCell

- (NavManeuverReroutingCell)initWithFrame:(CGRect)a3
{
  NavManeuverReroutingCell *v3;
  NavManeuverReroutingCell *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  UIView *v8;
  UIView *mapsBackgroundView;
  void *v10;
  UIView *v11;
  void *v12;
  UIActivityIndicatorView *v13;
  UIActivityIndicatorView *spinnerView;
  void *v15;
  UILabel *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UIView *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
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
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  UIView *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  UILabel *v54;
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
  objc_super v76;
  _QWORD v77[15];

  v76.receiver = self;
  v76.super_class = (Class)NavManeuverReroutingCell;
  v3 = -[NavManeuverReroutingCell initWithFrame:](&v76, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[NavManeuverReroutingCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    v8 = objc_opt_new(UIView);
    mapsBackgroundView = v4->_mapsBackgroundView;
    v4->_mapsBackgroundView = v8;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_mapsBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverReroutingCell contentView](v4, "contentView"));
    objc_msgSend(v10, "addSubview:", v4->_mapsBackgroundView);

    v11 = objc_opt_new(UIView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setAccessibilityIdentifier:](v11, "setAccessibilityIdentifier:", CFSTR("SignContainerView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverReroutingCell contentView](v4, "contentView"));
    objc_msgSend(v12, "addSubview:", v11);

    v13 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 101);
    spinnerView = v4->_spinnerView;
    v4->_spinnerView = v13;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v4->_spinnerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UIActivityIndicatorView setColor:](v4->_spinnerView, "setColor:", v15);

    -[UIActivityIndicatorView setAccessibilityIdentifier:](v4->_spinnerView, "setAccessibilityIdentifier:", CFSTR("NavManeuverReroutingSpinner"));
    -[UIView addSubview:](v11, "addSubview:", v4->_spinnerView);
    v16 = objc_opt_new(UILabel);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](v16, "setTextColor:", v17);

    -[UILabel setNumberOfLines:](v16, "setNumberOfLines:", 2);
    -[UILabel setMinimumScaleFactor:](v16, "setMinimumScaleFactor:", 0.699999988);
    -[UILabel setAdjustsFontSizeToFitWidth:](v16, "setAdjustsFontSizeToFitWidth:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 30.0, UIFontWeightHeavy));
    -[UILabel setFont:](v16, "setFont:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("[NavSign] Rerouting..."), CFSTR("localized string not found"), 0));
    -[UILabel setText:](v16, "setText:", v20);

    -[UILabel setAccessibilityIdentifier:](v16, "setAccessibilityIdentifier:", CFSTR("MessageLabel"));
    -[UIView addSubview:](v11, "addSubview:", v16);
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v4->_mapsBackgroundView, "leadingAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverReroutingCell contentView](v4, "contentView"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "leadingAnchor"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v73));
    v77[0] = v72;
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v4->_mapsBackgroundView, "trailingAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverReroutingCell contentView](v4, "contentView"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "trailingAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:", v69));
    v77[1] = v68;
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v4->_mapsBackgroundView, "topAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverReroutingCell contentView](v4, "contentView"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "topAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v65));
    v77[2] = v64;
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v4->_mapsBackgroundView, "bottomAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverReroutingCell contentView](v4, "contentView"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "bottomAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v61));
    v77[3] = v60;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView leadingAnchor](v4->_spinnerView, "leadingAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v11, "leadingAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v58));
    v77[4] = v57;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerYAnchor](v4->_spinnerView, "centerYAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v11, "centerYAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v55));
    v77[5] = v53;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView widthAnchor](v4->_spinnerView, "widthAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToConstant:", 30.0));
    v77[6] = v51;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView heightAnchor](v4->_spinnerView, "heightAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToConstant:", 30.0));
    v77[7] = v49;
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v16, "leadingAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView trailingAnchor](v4->_spinnerView, "trailingAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:constant:", v46, 16.0));
    v77[8] = v45;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v16, "trailingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v11, "trailingAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v43));
    v77[9] = v42;
    v54 = v16;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v16, "topAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v11, "topAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
    v77[10] = v39;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v16, "bottomAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v11, "bottomAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
    v77[11] = v36;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v11, "centerXAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverReroutingCell contentView](v4, "contentView"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "centerXAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
    v77[12] = v32;
    v21 = v11;
    v48 = v11;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v11, "centerYAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverReroutingCell contentView](v4, "contentView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "centerYAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v24));
    v77[13] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v21, "widthAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverReroutingCell contentView](v4, "contentView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "widthAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintLessThanOrEqualToAnchor:", v28));
    v77[14] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v77, 15));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);

  }
  return v4;
}

- (void)startAnimating
{
  -[UIActivityIndicatorView setHidden:](self->_spinnerView, "setHidden:", 0);
  -[UIActivityIndicatorView startAnimating](self->_spinnerView, "startAnimating");
}

- (void)setSelectedWithLayoutProgress:(double)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = sub_1006E66E4();
  v7 = (id)objc_claimAutoreleasedReturnValue(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "colorWithAlphaComponent:", a3 * 0.239999995));
  -[UIView setBackgroundColor:](self->_mapsBackgroundView, "setBackgroundColor:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_mapsBackgroundView, 0);
}

@end
