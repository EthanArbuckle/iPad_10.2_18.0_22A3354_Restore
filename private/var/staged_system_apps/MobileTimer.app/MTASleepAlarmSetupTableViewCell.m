@implementation MTASleepAlarmSetupTableViewCell

- (void)setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
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
  NSMutableArray *v75;

  v75 = objc_opt_new(NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell titleLabel](self, "titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell layoutMarginsGuide](self, "layoutMarginsGuide"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));
  -[NSMutableArray addObject:](v75, "addObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell setupButton](self, "setupButton"));
  objc_msgSend(v8, "bounds");
  v10 = v9;

  LODWORD(v8) = _os_feature_enabled_impl("UIKit", "ui_consistency");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell setupButton](self, "setupButton"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "widthAnchor"));
  v13 = v12;
  v14 = v10 + 24.0;
  if ((_DWORD)v8)
    v14 = v10;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToConstant:", v14));
  -[NSMutableArray addObject:](v75, "addObject:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell setupButton](self, "setupButton"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "heightAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell setupButton](self, "setupButton"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "titleLabel"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "font"));
  objc_msgSend(v20, "lineHeight");
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToConstant:", ceil(v21) + 12.0));
  -[NSMutableArray addObject:](v75, "addObject:", v22);

  if (-[MTASleepAlarmSetupTableViewCell _shouldStackViews](self, "_shouldStackViews"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell setupButton](self, "setupButton"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell titleLabel](self, "titleLabel"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v26));
    -[NSMutableArray addObject:](v75, "addObject:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell titleLabel](self, "titleLabel"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "topAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell contentView](self, "contentView"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31, 16.0));
    -[NSMutableArray addObject:](v75, "addObject:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell setupButton](self, "setupButton"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "topAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell titleLabel](self, "titleLabel"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "bottomAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:", v36, 6.0));
    -[NSMutableArray addObject:](v75, "addObject:", v37);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell contentView](self, "contentView"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bottomAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell setupButton](self, "setupButton"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bottomAnchor"));
    v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:constant:", v41, 16.0));
  }
  else
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell titleLabel](self, "titleLabel"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "centerYAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell contentView](self, "contentView"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "centerYAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v46));
    -[NSMutableArray addObject:](v75, "addObject:", v47);

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell titleLabel](self, "titleLabel"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "heightAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell titleLabel](self, "titleLabel"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "font"));
    objc_msgSend(v51, "lineHeight");
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToConstant:", ceil(v52)));
    -[NSMutableArray addObject:](v75, "addObject:", v53);

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell setupButton](self, "setupButton"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "leadingAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell titleLabel](self, "titleLabel"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "trailingAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:constant:", v57, 16.0));
    -[NSMutableArray addObject:](v75, "addObject:", v58);

    v59 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell setupButton](self, "setupButton"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "centerYAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell contentView](self, "contentView"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "centerYAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v62));
    -[NSMutableArray addObject:](v75, "addObject:", v63);

    v64 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell setupButton](self, "setupButton"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "topAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell contentView](self, "contentView"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "topAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintGreaterThanOrEqualToAnchor:constant:", v67, 16.0));
    -[NSMutableArray addObject:](v75, "addObject:", v68);

    v69 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell contentView](self, "contentView"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "bottomAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell setupButton](self, "setupButton"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "bottomAnchor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintGreaterThanOrEqualToAnchor:constant:", v72, 16.0));
    -[NSMutableArray addObject:](v75, "addObject:", v73);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell setupButton](self, "setupButton"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "trailingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell layoutMarginsGuide](self, "layoutMarginsGuide"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "trailingAnchor"));
    v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v41));
  }
  v74 = (void *)v42;
  -[NSMutableArray addObject:](v75, "addObject:", v42);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v75);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setupCell
{
  UILabel *v3;
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
  id v14;

  v3 = objc_opt_new(UILabel);
  -[MTASleepAlarmSetupTableViewCell setTitleLabel:](self, "setTitleLabel:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.MobileTimerUI")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SLEEP_ALARM_NONE"), &stru_10009A4D0, CFSTR("MobileTimerUI_Burrito")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v6, "setText:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_disabledTextColor](UIColor, "mtui_disabledTextColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v8, "setTextColor:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:maximumContentSizeCategory:](UIFont, "_preferredFontForTextStyle:maximumContentSizeCategory:", UIFontTextStyleBody, UIContentSizeCategoryAccessibilityLarge));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v10, "setFont:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v11, "setAdjustsFontSizeToFitWidth:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v14 = (id)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell contentView](self, "contentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v14, "addSubview:", v13);

}

- (UIButton)setupButton
{
  return self->_setupButton;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void)setSetupButton:(id)a3
{
  objc_storeStrong((id *)&self->_setupButton, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MTASleepAlarmSetupTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MTASleepAlarmSetupTableViewCell *v4;
  MTASleepAlarmSetupTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTASleepAlarmSetupTableViewCell;
  v4 = -[MTASleepAlarmSetupTableViewCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", 0, a4);
  v5 = v4;
  if (v4)
    -[MTASleepAlarmSetupTableViewCell setupCell](v4, "setupCell");
  return v5;
}

- (MTASleepAlarmSetupTableViewCellDelegate)delegate
{
  return (MTASleepAlarmSetupTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)configureSetupButtonWithTitle:(id)a3 action:(SEL)a4
{
  void *v6;
  void *v7;
  UIButton *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
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
  void *v31;
  void *v32;
  id v33;

  v33 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell setupButton](self, "setupButton"));

  if (!v6)
  {
    if (_os_feature_enabled_impl("UIKit", "ui_consistency"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTAUtilities pillButtonWithTitle:](MTAUtilities, "pillButtonWithTitle:", v33));
      -[MTASleepAlarmSetupTableViewCell setSetupButton:](self, "setSetupButton:", v7);
    }
    else
    {
      v8 = objc_opt_new(UIButton);
      -[MTASleepAlarmSetupTableViewCell setSetupButton:](self, "setSetupButton:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_tintColor](UIColor, "mtui_tintColor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell setupButton](self, "setupButton"));
      objc_msgSend(v10, "setTintColor:", v9);

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_buttonBackgroundColor](UIColor, "mtui_buttonBackgroundColor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell setupButton](self, "setupButton"));
      objc_msgSend(v12, "setBackgroundColor:", v11);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell setupButton](self, "setupButton"));
      objc_msgSend(v13, "setTitle:forState:", v33, 0);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell setupButton](self, "setupButton"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_tintColor](UIColor, "mtui_tintColor"));
      objc_msgSend(v14, "setTitleColor:forState:", v15, 0);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell setupButton](self, "setupButton"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "titleLabel"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "font"));
      objc_msgSend(v17, "lineHeight");
      v19 = ceil(v18) * 0.5 + 6.0;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell setupButton](self, "setupButton"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "layer"));
      objc_msgSend(v21, "setCornerRadius:", v19);

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell setupButton](self, "setupButton"));
    objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell setupButton](self, "setupButton"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell delegate](self, "delegate"));
    objc_msgSend(v23, "addTarget:action:forControlEvents:", v24, a4, 64);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "familyName"));
    objc_msgSend(v25, "pointSize");
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithFamilyName:traits:size:](UIFont, "fontWithFamilyName:traits:size:", v26, 2));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell setupButton](self, "setupButton"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "titleLabel"));
    objc_msgSend(v29, "setFont:", v27);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell contentView](self, "contentView"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell setupButton](self, "setupButton"));
    objc_msgSend(v30, "addSubview:", v31);

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell setupButton](self, "setupButton"));
  objc_msgSend(v32, "sizeToFit");

  -[MTASleepAlarmSetupTableViewCell setupConstraints](self, "setupConstraints");
}

- (BOOL)_shouldStackViews
{
  void *v3;
  double height;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGRect v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell titleLabel](self, "titleLabel"));
  height = CGSizeZero.height;
  objc_msgSend(v3, "sizeThatFits:", CGSizeZero.width, height);
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell setupButton](self, "setupButton"));
  objc_msgSend(v7, "sizeThatFits:", CGSizeZero.width, height);
  v9 = v8 + 24.0;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmSetupTableViewCell contentView](self, "contentView"));
  objc_msgSend(v10, "bounds");
  v11 = CGRectGetWidth(v17) - v9;
  -[MTASleepAlarmSetupTableViewCell layoutMargins](self, "layoutMargins");
  v13 = v11 - v12;
  -[MTASleepAlarmSetupTableViewCell layoutMargins](self, "layoutMargins");
  v15 = v13 - v14;

  return v15 - v6 <= 16.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_setupButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
