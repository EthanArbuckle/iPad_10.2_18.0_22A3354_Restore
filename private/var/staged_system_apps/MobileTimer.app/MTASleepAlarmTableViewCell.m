@implementation MTASleepAlarmTableViewCell

- (MTASleepAlarmTableViewCell)init
{
  return -[MTASleepAlarmTableViewCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", 0, off_1000BF000);
}

- (MTASleepAlarmTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MTASleepAlarmTableViewCell *v4;
  id v5;
  double y;
  double width;
  double height;
  MTUIDigitalClockLabel *v9;
  MTUIDigitalClockLabel *digitalClockLabel;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UILabel *v17;
  UILabel *detailLabel;
  void *v19;
  void *v20;
  void *v21;
  MTASleepAlarmTableViewCell *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)MTASleepAlarmTableViewCell;
  v4 = -[MTASleepAlarmTableViewCell initWithStyle:reuseIdentifier:](&v24, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc((Class)MTUIDigitalClockLabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v9 = (MTUIDigitalClockLabel *)objc_msgSend(v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    digitalClockLabel = v4->_digitalClockLabel;
    v4->_digitalClockLabel = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mtui_thinTimeFont](UIFont, "mtui_thinTimeFont"));
    -[MTUIDigitalClockLabel setFont:](v4->_digitalClockLabel, "setFont:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mtui_defaultTimeDesignatorFont](UIFont, "mtui_defaultTimeDesignatorFont"));
    -[MTUIDigitalClockLabel setTimeDesignatorFont:](v4->_digitalClockLabel, "setTimeDesignatorFont:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MTUIDigitalClockLabel setBackgroundColor:](v4->_digitalClockLabel, "setBackgroundColor:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIDigitalClockLabel dateLabel](v4->_digitalClockLabel, "dateLabel"));
    objc_msgSend(v14, "setLineBreakMode:", 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTUIDigitalClockLabel dateLabel](v4->_digitalClockLabel, "dateLabel"));
    objc_msgSend(v15, "setNumberOfLines:", 0);

    -[MTUIDigitalClockLabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_digitalClockLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v16, "addSubview:", v4->_digitalClockLabel);

    v17 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    detailLabel = v4->_detailLabel;
    v4->_detailLabel = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:maximumContentSizeCategory:](UIFont, "_preferredFontForTextStyle:maximumContentSizeCategory:", UIFontTextStyleSubheadline, UIContentSizeCategoryAccessibilityLarge));
    -[UILabel setFont:](v4->_detailLabel, "setFont:", v19);

    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_detailLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setNumberOfLines:](v4->_detailLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v4->_detailLabel, "setLineBreakMode:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_detailLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v20, "addSubview:", v4->_detailLabel);

    -[MTASleepAlarmTableViewCell setupChangeButton](v4, "setupChangeButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_cellHighlightColor](UIColor, "mtui_cellHighlightColor"));
    -[MTASleepAlarmTableViewCell setSelectedBackgroundColor:](v4, "setSelectedBackgroundColor:", v21);

    -[MTASleepAlarmTableViewCell setupSharedLayoutConstraint](v4, "setupSharedLayoutConstraint");
    v22 = v4;
  }

  return v4;
}

- (void)setupSharedLayoutConstraint
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
  void *v16;
  void *v17;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  NSMutableArray *v50;

  v50 = objc_opt_new(NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell digitalClockLabel](self, "digitalClockLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layoutMarginsGuide"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v7));
  -[NSMutableArray addObject:](v50, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell digitalClockLabel](self, "digitalClockLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstBaselineAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell contentView](self, "contentView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, 60.0));
  -[MTASleepAlarmTableViewCell setClockLabelBaselineToTopConstraint:](self, "setClockLabelBaselineToTopConstraint:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell clockLabelBaselineToTopConstraint](self, "clockLabelBaselineToTopConstraint"));
  -[NSMutableArray addObject:](v50, "addObject:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell digitalClockLabel](self, "digitalClockLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "heightAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToConstant:", 0.0));
  -[MTASleepAlarmTableViewCell setClockLabelHeightConstraint:](self, "setClockLabelHeightConstraint:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell clockLabelHeightConstraint](self, "clockLabelHeightConstraint"));
  -[NSMutableArray addObject:](v50, "addObject:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell detailLabel](self, "detailLabel"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell digitalClockLabel](self, "digitalClockLabel"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v22));
  -[NSMutableArray addObject:](v50, "addObject:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell detailLabel](self, "detailLabel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell digitalClockLabel](self, "digitalClockLabel"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bottomAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27, 0.0));
  -[MTASleepAlarmTableViewCell setClockLabelDetailLabelSpaceConstraint:](self, "setClockLabelDetailLabelSpaceConstraint:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell clockLabelDetailLabelSpaceConstraint](self, "clockLabelDetailLabelSpaceConstraint"));
  -[NSMutableArray addObject:](v50, "addObject:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell detailLabel](self, "detailLabel"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell digitalClockLabel](self, "digitalClockLabel"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v33));
  -[NSMutableArray addObject:](v50, "addObject:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell changeButton](self, "changeButton"));
  objc_msgSend(v35, "bounds");
  v37 = v36;

  LODWORD(v35) = _os_feature_enabled_impl("UIKit", "ui_consistency");
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell changeButton](self, "changeButton"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "widthAnchor"));
  v40 = v39;
  v41 = v37 + 24.0;
  if ((_DWORD)v35)
    v41 = v37;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToConstant:", v41));
  -[NSMutableArray addObject:](v50, "addObject:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell changeButton](self, "changeButton"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "heightAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell changeButton](self, "changeButton"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "titleLabel"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "font"));
  objc_msgSend(v47, "lineHeight");
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToConstant:", ceil(v48) + 12.0));
  -[NSMutableArray addObject:](v50, "addObject:", v49);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v50);
}

- (void)setupChangeButton
{
  void *v3;
  void *v4;
  void *v5;
  UIButton *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
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
  id v29;

  if (_os_feature_enabled_impl("UIKit", "ui_consistency"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.MobileTimerUI")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SLEEP_ALARM_CHANGE"), &stru_10009A4D0, CFSTR("MobileTimerUI_Burrito")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTAUtilities pillButtonWithTitle:](MTAUtilities, "pillButtonWithTitle:", v4));
    -[MTASleepAlarmTableViewCell setChangeButton:](self, "setChangeButton:", v5);

  }
  else
  {
    v6 = objc_opt_new(UIButton);
    -[MTASleepAlarmTableViewCell setChangeButton:](self, "setChangeButton:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell changeButton](self, "changeButton"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.MobileTimerUI")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SLEEP_ALARM_CHANGE"), &stru_10009A4D0, CFSTR("MobileTimerUI_Burrito")));
    objc_msgSend(v7, "setTitle:forState:", v9, 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_buttonBackgroundColor](UIColor, "mtui_buttonBackgroundColor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell changeButton](self, "changeButton"));
    objc_msgSend(v11, "setTintColor:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_buttonBackgroundColor](UIColor, "mtui_buttonBackgroundColor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell changeButton](self, "changeButton"));
    objc_msgSend(v13, "setBackgroundColor:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell changeButton](self, "changeButton"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "titleLabel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "font"));
    objc_msgSend(v16, "lineHeight");
    v18 = ceil(v17) * 0.5 + 6.0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell changeButton](self, "changeButton"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "layer"));
    objc_msgSend(v20, "setCornerRadius:", v18);

    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell changeButton](self, "changeButton"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_tintColor](UIColor, "mtui_tintColor"));
    objc_msgSend(v3, "setTitleColor:forState:", v4, 0);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell changeButton](self, "changeButton"));
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell changeButton](self, "changeButton"));
  objc_msgSend(v22, "addTarget:action:forControlEvents:", self, "_changeButtonPressed:", 64);

  v29 = (id)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:maximumContentSizeCategory:](UIFont, "_preferredFontForTextStyle:maximumContentSizeCategory:", UIFontTextStyleSubheadline, UIContentSizeCategoryAccessibilityLarge));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "familyName"));
  objc_msgSend(v29, "pointSize");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithFamilyName:traits:size:](UIFont, "fontWithFamilyName:traits:size:", v23, 2));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell changeButton](self, "changeButton"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "titleLabel"));
  objc_msgSend(v26, "setFont:", v24);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell changeButton](self, "changeButton"));
  objc_msgSend(v27, "sizeToFit");

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell contentView](self, "contentView"));
  objc_msgSend(v28, "addSubview:", self->_changeButton);

}

- (void)setupConstraints
{
  uint64_t v3;
  unsigned int v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;

  if (-[MTASleepAlarmTableViewCell _shouldUseRegularLayout](self, "_shouldUseRegularLayout"))
    v3 = objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell regularLayoutConstraints](self, "regularLayoutConstraints"));
  else
    v3 = objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell accessibilitySizeLayoutConstraints](self, "accessibilitySizeLayoutConstraints"));
  obj = (id)v3;
  v4 = -[MTASleepAlarmTableViewCell _shouldUseRegularLayout](self, "_shouldUseRegularLayout");
  -[MTASleepAlarmTableViewCell _viewAvailabelWidth](self, "_viewAvailabelWidth");
  v6 = v5;
  if (v4)
  {
    -[MTASleepAlarmTableViewCell _changeButtonWidth](self, "_changeButtonWidth");
    v6 = v6 - v7 + -16.0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell digitalClockLabel](self, "digitalClockLabel"));
  objc_msgSend(v8, "sizeThatFits:", v6, 0.0);
  v10 = ceil(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell clockLabelHeightConstraint](self, "clockLabelHeightConstraint"));
  objc_msgSend(v11, "setConstant:", v10);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell currentConstraints](self, "currentConstraints"));
  v13 = obj;
  if (v12 != obj)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell currentConstraints](self, "currentConstraints"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell currentConstraints](self, "currentConstraints"));
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v15);

    }
    objc_storeStrong((id *)&self->_currentConstraints, obj);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell currentConstraints](self, "currentConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

    v13 = obj;
  }

}

- (double)_changeButtonWidth
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell changeButton](self, "changeButton"));
  objc_msgSend(v2, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  v4 = v3 + 24.0;

  return v4;
}

- (double)_viewAvailabelWidth
{
  void *v2;
  double v3;
  CGRect v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell contentView](self, "contentView"));
  objc_msgSend(v2, "frame");
  v3 = CGRectGetWidth(v5) + -32.0;

  return v3;
}

- (BOOL)_shouldUseRegularLayout
{
  void *v3;
  NSString *v4;
  NSComparisonResult v5;
  void *v6;
  double height;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell traitCollection](self, "traitCollection"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));
  v5 = UIContentSizeCategoryCompareToCategory(v4, UIContentSizeCategoryExtraExtraLarge);

  if (v5 == NSOrderedAscending)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell digitalClockLabel](self, "digitalClockLabel"));
  height = CGSizeZero.height;
  objc_msgSend(v6, "sizeThatFits:", CGSizeZero.width, height);
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell detailLabel](self, "detailLabel"));
  objc_msgSend(v10, "sizeThatFits:", CGSizeZero.width, height);
  v12 = v11;

  -[MTASleepAlarmTableViewCell _viewAvailabelWidth](self, "_viewAvailabelWidth");
  v14 = v13;
  -[MTASleepAlarmTableViewCell _changeButtonWidth](self, "_changeButtonWidth");
  v16 = v14 - v15;
  return v16 - v12 > 16.0 && v16 - v9 > 16.0;
}

- (NSArray)regularLayoutConstraints
{
  NSArray *regularLayoutConstraints;
  NSMutableArray *v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSArray *v26;

  regularLayoutConstraints = self->_regularLayoutConstraints;
  if (!regularLayoutConstraints)
  {
    v4 = objc_opt_new(NSMutableArray);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell changeButton](self, "changeButton"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell digitalClockLabel](self, "digitalClockLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8, 16.0));
    -[NSMutableArray addObject:](v4, "addObject:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell contentView](self, "contentView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell detailLabel](self, "detailLabel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastBaselineAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, 16.0));
    -[NSMutableArray addObject:](v4, "addObject:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell changeButton](self, "changeButton"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell contentView](self, "contentView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layoutMarginsGuide"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v19));
    -[NSMutableArray addObject:](v4, "addObject:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell changeButton](self, "changeButton"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "centerYAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell contentView](self, "contentView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "centerYAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v24));
    -[NSMutableArray addObject:](v4, "addObject:", v25);

    v26 = self->_regularLayoutConstraints;
    self->_regularLayoutConstraints = &v4->super;

    regularLayoutConstraints = self->_regularLayoutConstraints;
  }
  return regularLayoutConstraints;
}

- (NSArray)accessibilitySizeLayoutConstraints
{
  NSArray *accessibilitySizeLayoutConstraints;
  NSMutableArray *v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSArray *v27;

  accessibilitySizeLayoutConstraints = self->_accessibilitySizeLayoutConstraints;
  if (!accessibilitySizeLayoutConstraints)
  {
    v4 = objc_opt_new(NSMutableArray);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell digitalClockLabel](self, "digitalClockLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell contentView](self, "contentView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layoutMarginsGuide"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v9));
    -[NSMutableArray addObject:](v4, "addObject:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell changeButton](self, "changeButton"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell detailLabel](self, "detailLabel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, 6.0));
    -[NSMutableArray addObject:](v4, "addObject:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell changeButton](self, "changeButton"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell contentView](self, "contentView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layoutMarginsGuide"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "leadingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v20));
    -[NSMutableArray addObject:](v4, "addObject:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell contentView](self, "contentView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell changeButton](self, "changeButton"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v25, 16.0));
    -[NSMutableArray addObject:](v4, "addObject:", v26);

    v27 = self->_accessibilitySizeLayoutConstraints;
    self->_accessibilitySizeLayoutConstraints = &v4->super;

    accessibilitySizeLayoutConstraints = self->_accessibilitySizeLayoutConstraints;
  }
  return accessibilitySizeLayoutConstraints;
}

- (void)internalSetBackgroundColor:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTASleepAlarmTableViewCell;
  -[MTASleepAlarmTableViewCell setBackgroundColor:](&v3, "setBackgroundColor:", a3);
}

- (void)refreshWithSleepMetadata:(id)a3
{
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v4 = objc_msgSend(v22, "displaysTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell clockLabelBaselineToTopConstraint](self, "clockLabelBaselineToTopConstraint"));
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "setConstant:", 60.0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell clockLabelDetailLabelSpaceConstraint](self, "clockLabelDetailLabelSpaceConstraint"));
    objc_msgSend(v7, "setConstant:", -3.0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mtui_thinTimeFont](UIFont, "mtui_thinTimeFont"));
    -[MTUIDigitalClockLabel setFont:](self->_digitalClockLabel, "setFont:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell digitalClockLabel](self, "digitalClockLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "alarmComponents"));
    v11 = objc_msgSend(v10, "hour");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "alarmComponents"));
    objc_msgSend(v9, "setHour:minute:", v11, objc_msgSend(v12, "minute"));

  }
  else
  {
    objc_msgSend(v5, "setConstant:", 48.0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell clockLabelDetailLabelSpaceConstraint](self, "clockLabelDetailLabelSpaceConstraint"));
    objc_msgSend(v13, "setConstant:", 0.0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTASleepAlarmTableViewCell _clockLabelTextFont](MTASleepAlarmTableViewCell, "_clockLabelTextFont"));
    -[MTUIDigitalClockLabel setFont:](self->_digitalClockLabel, "setFont:", v14);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell digitalClockLabel](self, "digitalClockLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "mainDescription"));
    objc_msgSend(v9, "setTimeLabelText:", v10);
  }

  if ((objc_msgSend(v22, "displaysTime") & 1) != 0)
    v15 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_primaryTextColor](UIColor, "mtui_primaryTextColor"));
  else
    v15 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_disabledTextColor](UIColor, "mtui_disabledTextColor"));
  v16 = (void *)v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell digitalClockLabel](self, "digitalClockLabel"));
  objc_msgSend(v17, "setTextColor:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "detailedDescription"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell detailLabel](self, "detailLabel"));
  objc_msgSend(v19, "setText:", v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell detailLabel](self, "detailLabel"));
  objc_msgSend(v20, "setTextColor:", v16);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell detailLabel](self, "detailLabel"));
  objc_msgSend(v21, "sizeToFit");

  -[MTASleepAlarmTableViewCell setupConstraints](self, "setupConstraints");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTASleepAlarmTableViewCell;
  -[MTASleepAlarmTableViewCell traitCollectionDidChange:](&v3, "traitCollectionDidChange:", a3);
}

- (void)setMainLabelWithAlarm:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell digitalClockLabel](self, "digitalClockLabel"));
  v5 = objc_msgSend(v4, "hour");
  v6 = objc_msgSend(v4, "minute");

  objc_msgSend(v7, "setHour:minute:", v5, v6);
}

- (void)_changeButtonPressed:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  MTASleepAlarmTableViewCell *v8;

  v4 = MTLogForCategory(8, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Change button pressed %{public}@", (uint8_t *)&v7, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepAlarmTableViewCell delegate](self, "delegate"));
  objc_msgSend(v6, "changeButtonPressed");

}

- (void)willTransitionToState:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTASleepAlarmTableViewCell;
  -[MTASleepAlarmTableViewCell willTransitionToState:](&v4, "willTransitionToState:", a3);
  -[MTASleepAlarmTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTASleepAlarmTableViewCell;
  -[MTASleepAlarmTableViewCell setSelected:animated:](&v5, "setSelected:animated:", a3, a4);
  -[MTASleepAlarmTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTASleepAlarmTableViewCell;
  -[MTASleepAlarmTableViewCell setHighlighted:animated:](&v5, "setHighlighted:animated:", a3, a4);
  -[MTASleepAlarmTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

+ (id)_clockLabelTextFont
{
  if (qword_1000BFD10 != -1)
    dispatch_once(&qword_1000BFD10, &stru_100099AD8);
  return (id)qword_1000BFD08;
}

- (MTASleepAlarmTableViewCellDelegate)delegate
{
  return (MTASleepAlarmTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIButton)changeButton
{
  return self->_changeButton;
}

- (void)setChangeButton:(id)a3
{
  objc_storeStrong((id *)&self->_changeButton, a3);
}

- (MTUIDigitalClockLabel)digitalClockLabel
{
  return self->_digitalClockLabel;
}

- (void)setDigitalClockLabel:(id)a3
{
  objc_storeStrong((id *)&self->_digitalClockLabel, a3);
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void)setDetailLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailLabel, a3);
}

- (NSLayoutConstraint)clockLabelBaselineToTopConstraint
{
  return self->_clockLabelBaselineToTopConstraint;
}

- (void)setClockLabelBaselineToTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_clockLabelBaselineToTopConstraint, a3);
}

- (NSLayoutConstraint)clockLabelDetailLabelSpaceConstraint
{
  return self->_clockLabelDetailLabelSpaceConstraint;
}

- (void)setClockLabelDetailLabelSpaceConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_clockLabelDetailLabelSpaceConstraint, a3);
}

- (NSLayoutConstraint)clockLabelHeightConstraint
{
  return self->_clockLabelHeightConstraint;
}

- (void)setClockLabelHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_clockLabelHeightConstraint, a3);
}

- (void)setRegularLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_regularLayoutConstraints, a3);
}

- (void)setAccessibilitySizeLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilitySizeLayoutConstraints, a3);
}

- (NSArray)currentConstraints
{
  return self->_currentConstraints;
}

- (void)setCurrentConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_currentConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConstraints, 0);
  objc_storeStrong((id *)&self->_accessibilitySizeLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_regularLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_clockLabelHeightConstraint, 0);
  objc_storeStrong((id *)&self->_clockLabelDetailLabelSpaceConstraint, 0);
  objc_storeStrong((id *)&self->_clockLabelBaselineToTopConstraint, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_digitalClockLabel, 0);
  objc_storeStrong((id *)&self->_changeButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
