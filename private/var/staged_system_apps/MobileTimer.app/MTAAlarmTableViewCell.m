@implementation MTAAlarmTableViewCell

- (void)refreshUI:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  unsigned __int8 v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  NSBundle *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
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

  v4 = a4;
  v33 = a3;
  v6 = objc_msgSend(v33, "isSleepAlarm");
  v7 = objc_msgSend(v33, "repeatSchedule");
  if ((v6 & 1) != 0)
    v8 = DateMaskToString(v7, 0, 1, 0, 0);
  else
    v8 = DetailDateMaskToString(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell digitalClockLabel](self, "digitalClockLabel"));
  objc_msgSend(v10, "setHour:minute:", objc_msgSend(v33, "hour"), objc_msgSend(v33, "minute"));

  if ((objc_msgSend(v33, "isSleepAlarm") & 1) != 0)
    v11 = 0;
  else
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "displayTitle"));
  v12 = v11;
  if (objc_msgSend(v12, "length"))
  {
    v14 = v12;
    if (!objc_msgSend(v9, "length"))
      goto LABEL_12;
    v15 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MTAAlarmTableViewCell, v13));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("ALARM_DETAIL_FORMAT"), &stru_10009A4D0, CFSTR("Localizable")));

    v14 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", v17, v12, v9);
  }
  else
  {
    v14 = v9;
    v17 = v12;
  }

LABEL_12:
  -[MTAAlarmTableViewCell setIsSleepAlarm:](self, "setIsSleepAlarm:", objc_msgSend(v33, "isSleepAlarm"));
  v18 = objc_msgSend(v33, "isSleepAlarm");
  v19 = objc_msgSend(v33, "isEnabled");
  v20 = v19;
  if (v18)
  {
    if (!(_DWORD)v19)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell enabledSwitch](self, "enabledSwitch"));
      objc_msgSend(v24, "setOn:animated:", 0, 0);

      goto LABEL_18;
    }
    v20 = objc_msgSend(v33, "sleepSchedule");
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell enabledSwitch](self, "enabledSwitch"));
  objc_msgSend(v21, "setOn:animated:", v20, 0);

  if ((v20 & 1) != 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_primaryTextColor](UIColor, "mtui_primaryTextColor"));
    v23 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_primaryTextColor](UIColor, "mtui_primaryTextColor"));
    goto LABEL_19;
  }
LABEL_18:
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_disabledTextColor](UIColor, "mtui_disabledTextColor"));
  v23 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_disabledTextColor](UIColor, "mtui_disabledTextColor"));
LABEL_19:
  v25 = (void *)v23;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_backgroundColor](UIColor, "mtui_backgroundColor"));
  if (v4)
  {
    +[UIView beginAnimations:context:](UIView, "beginAnimations:context:", CFSTR("RefreshAlarmTableViewCell"), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell digitalClockLabel](self, "digitalClockLabel"));
    objc_msgSend(v27, "setTextColor:", v22);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell detailLabel](self, "detailLabel"));
    objc_msgSend(v28, "setText:", v14);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell detailLabel](self, "detailLabel"));
    objc_msgSend(v29, "setTextColor:", v25);

    -[MTAAlarmTableViewCell internalSetBackgroundColor:](self, "internalSetBackgroundColor:", v26);
    +[UIView commitAnimations](UIView, "commitAnimations");
  }
  else
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell digitalClockLabel](self, "digitalClockLabel"));
    objc_msgSend(v30, "setTextColor:", v22);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell detailLabel](self, "detailLabel"));
    objc_msgSend(v31, "setText:", v14);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell detailLabel](self, "detailLabel"));
    objc_msgSend(v32, "setTextColor:", v25);

    -[MTAAlarmTableViewCell internalSetBackgroundColor:](self, "internalSetBackgroundColor:", v26);
  }
  -[MTAAlarmTableViewCell setupConstraints](self, "setupConstraints");

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
  NSMutableArray *v29;

  v29 = objc_opt_new(NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell digitalClockLabel](self, "digitalClockLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layoutMarginsGuide"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v7));
  -[NSMutableArray addObject:](v29, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell digitalClockLabel](self, "digitalClockLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstBaselineAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell contentView](self, "contentView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, 60.0));
  -[NSMutableArray addObject:](v29, "addObject:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell detailLabel](self, "detailLabel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell digitalClockLabel](self, "digitalClockLabel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v17));
  -[NSMutableArray addObject:](v29, "addObject:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell detailLabel](self, "detailLabel"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell digitalClockLabel](self, "digitalClockLabel"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, -3.0));
  -[NSMutableArray addObject:](v29, "addObject:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell detailLabel](self, "detailLabel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell digitalClockLabel](self, "digitalClockLabel"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v27));
  -[NSMutableArray addObject:](v29, "addObject:", v28);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);
}

- (MTAAlarmTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MTAAlarmTableViewCell *v4;
  UIView *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  UISwitch *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  double y;
  double width;
  double height;
  MTUIDigitalClockLabel *v25;
  MTUIDigitalClockLabel *digitalClockLabel;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  UILabel *v31;
  UILabel *detailLabel;
  void *v33;
  void *v34;
  void *v35;
  MTAAlarmTableViewCell *v36;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)MTAAlarmTableViewCell;
  v4 = -[MTAAlarmTableViewCell initWithStyle:reuseIdentifier:](&v38, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_opt_new(UIView);
    -[MTAAlarmTableViewCell setDeadZone:](v4, "setDeadZone:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell deadZone](v4, "deadZone"));
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell contentView](v4, "contentView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell deadZone](v4, "deadZone"));
    objc_msgSend(v7, "addSubview:", v8);

    v9 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v4, 0);
    -[MTAAlarmTableViewCell setRecognizer:](v4, "setRecognizer:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell deadZone](v4, "deadZone"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell recognizer](v4, "recognizer"));
    objc_msgSend(v10, "addGestureRecognizer:", v11);

    -[MTAAlarmTableViewCell setEditingAccessoryType:](v4, "setEditingAccessoryType:", 1);
    v12 = objc_opt_new(UISwitch);
    -[MTAAlarmTableViewCell setEnabledSwitch:](v4, "setEnabledSwitch:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell enabledSwitch](v4, "enabledSwitch"));
    objc_msgSend(v14, "setOnTintColor:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_switchTintColor](UIColor, "mtui_switchTintColor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell enabledSwitch](v4, "enabledSwitch"));
    objc_msgSend(v16, "setTintColor:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell enabledSwitch](v4, "enabledSwitch"));
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell enabledSwitch](v4, "enabledSwitch"));
    objc_msgSend(v18, "addTarget:action:forControlEvents:", v4, "_alarmActiveChanged:", 4096);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell contentView](v4, "contentView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell enabledSwitch](v4, "enabledSwitch"));
    objc_msgSend(v19, "addSubview:", v20);

    v21 = objc_alloc((Class)MTUIDigitalClockLabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v25 = (MTUIDigitalClockLabel *)objc_msgSend(v21, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    digitalClockLabel = v4->_digitalClockLabel;
    v4->_digitalClockLabel = v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mtui_thinTimeFont](UIFont, "mtui_thinTimeFont"));
    -[MTUIDigitalClockLabel setFont:](v4->_digitalClockLabel, "setFont:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mtui_defaultTimeDesignatorFont](UIFont, "mtui_defaultTimeDesignatorFont"));
    -[MTUIDigitalClockLabel setTimeDesignatorFont:](v4->_digitalClockLabel, "setTimeDesignatorFont:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MTUIDigitalClockLabel setBackgroundColor:](v4->_digitalClockLabel, "setBackgroundColor:", v29);

    -[MTUIDigitalClockLabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_digitalClockLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v30, "addSubview:", v4->_digitalClockLabel);

    v31 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    detailLabel = v4->_detailLabel;
    v4->_detailLabel = v31;

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:maximumContentSizeCategory:](UIFont, "_preferredFontForTextStyle:maximumContentSizeCategory:", UIFontTextStyleSubheadline, UIContentSizeCategoryAccessibilityLarge));
    -[UILabel setFont:](v4->_detailLabel, "setFont:", v33);

    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_detailLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setNumberOfLines:](v4->_detailLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v4->_detailLabel, "setLineBreakMode:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_detailLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v34, "addSubview:", v4->_detailLabel);

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_cellHighlightColor](UIColor, "mtui_cellHighlightColor"));
    -[MTAAlarmTableViewCell setSelectedBackgroundColor:](v4, "setSelectedBackgroundColor:", v35);

    -[MTAAlarmTableViewCell setupSharedLayoutConstraint](v4, "setupSharedLayoutConstraint");
    v36 = v4;
  }

  return v4;
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
  NSArray *v41;

  regularLayoutConstraints = self->_regularLayoutConstraints;
  if (!regularLayoutConstraints)
  {
    v4 = objc_opt_new(NSMutableArray);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell deadZone](self, "deadZone"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell digitalClockLabel](self, "digitalClockLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v8));
    -[NSMutableArray addObject:](v4, "addObject:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell deadZone](self, "deadZone"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell contentView](self, "contentView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, 16.0));
    -[NSMutableArray addObject:](v4, "addObject:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell deadZone](self, "deadZone"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "heightAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell contentView](self, "contentView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "heightAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
    -[NSMutableArray addObject:](v4, "addObject:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell enabledSwitch](self, "enabledSwitch"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell digitalClockLabel](self, "digitalClockLabel"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23, 16.0));
    -[NSMutableArray addObject:](v4, "addObject:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell contentView](self, "contentView"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell detailLabel](self, "detailLabel"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "lastBaselineAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v28, 16.0));
    -[NSMutableArray addObject:](v4, "addObject:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell enabledSwitch](self, "enabledSwitch"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "trailingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell contentView](self, "contentView"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "layoutMarginsGuide"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v34));
    -[NSMutableArray addObject:](v4, "addObject:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell enabledSwitch](self, "enabledSwitch"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "bottomAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell digitalClockLabel](self, "digitalClockLabel"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "firstBaselineAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v39));
    -[NSMutableArray addObject:](v4, "addObject:", v40);

    v41 = self->_regularLayoutConstraints;
    self->_regularLayoutConstraints = &v4->super;

    regularLayoutConstraints = self->_regularLayoutConstraints;
  }
  return regularLayoutConstraints;
}

- (void)setupConstraints
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id obj;

  if (-[MTAAlarmTableViewCell _shouldUseRegularLayout](self, "_shouldUseRegularLayout"))
    v3 = objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell regularLayoutConstraints](self, "regularLayoutConstraints"));
  else
    v3 = objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell accessibilitySizeLayoutConstraints](self, "accessibilitySizeLayoutConstraints"));
  obj = (id)v3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell currentConstraints](self, "currentConstraints"));

  v5 = obj;
  if (v4 != obj)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell currentConstraints](self, "currentConstraints"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell currentConstraints](self, "currentConstraints"));
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v7);

    }
    objc_storeStrong((id *)&self->_currentConstraints, obj);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell currentConstraints](self, "currentConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v8);

    v5 = obj;
  }

}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTAAlarmTableViewCell;
  -[MTAAlarmTableViewCell setSelected:animated:](&v5, "setSelected:animated:", a3, a4);
  -[MTAAlarmTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_recognizer, a3);
}

- (void)setIsSleepAlarm:(BOOL)a3
{
  self->_isSleepAlarm = a3;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTAAlarmTableViewCell;
  -[MTAAlarmTableViewCell setHighlighted:animated:](&v5, "setHighlighted:animated:", a3, a4);
  -[MTAAlarmTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setEnabledSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_enabledSwitch, a3);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  double v9;
  double *v10;
  void *v11;
  objc_super v12;

  v4 = a4;
  v5 = a3;
  if (!-[MTAAlarmTableViewCell isSleepAlarm](self, "isSleepAlarm"))
  {
    if (v4)
      +[UIView beginAnimations:context:](UIView, "beginAnimations:context:", CFSTR("EditingAlarmTableViewCell"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell enabledSwitch](self, "enabledSwitch"));
    v8 = v7;
    v9 = 1.0;
    if (v5)
    {
      v9 = 0.0;
      v10 = (double *)&MTUIAlarmTableViewInsetEdit;
    }
    else
    {
      v10 = (double *)&MTUIAlarmTableViewInsetRegular;
    }
    objc_msgSend(v7, "setAlpha:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell recognizer](self, "recognizer"));
    objc_msgSend(v11, "setEnabled:", v5 ^ 1);

    -[MTAAlarmTableViewCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, *v10, 0.0, 0.0);
    if (v4)
      +[UIView commitAnimations](UIView, "commitAnimations");
  }
  v12.receiver = self;
  v12.super_class = (Class)MTAAlarmTableViewCell;
  -[MTAAlarmTableViewCell setEditing:animated:](&v12, "setEditing:animated:", v5, v4);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setDeadZone:(id)a3
{
  objc_storeStrong((id *)&self->_deadZone, a3);
}

- (UITapGestureRecognizer)recognizer
{
  return self->_recognizer;
}

- (BOOL)isSleepAlarm
{
  return self->_isSleepAlarm;
}

- (void)internalSetBackgroundColor:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTAAlarmTableViewCell;
  -[MTAAlarmTableViewCell setBackgroundColor:](&v3, "setBackgroundColor:", a3);
}

- (UISwitch)enabledSwitch
{
  return self->_enabledSwitch;
}

- (MTUIDigitalClockLabel)digitalClockLabel
{
  return self->_digitalClockLabel;
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (UIView)deadZone
{
  return self->_deadZone;
}

- (NSArray)currentConstraints
{
  return self->_currentConstraints;
}

- (BOOL)_shouldUseRegularLayout
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGRect v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell traitCollection](self, "traitCollection"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (!IsAccessibilityCategory)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell detailLabel](self, "detailLabel"));
  objc_msgSend(v6, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell enabledSwitch](self, "enabledSwitch"));
  objc_msgSend(v9, "intrinsicContentSize");
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell contentView](self, "contentView"));
  objc_msgSend(v12, "bounds");
  v13 = CGRectGetWidth(v19) - v11;
  -[MTAAlarmTableViewCell layoutMargins](self, "layoutMargins");
  v15 = v14;
  -[MTAAlarmTableViewCell layoutMargins](self, "layoutMargins");
  v17 = v13 + (v15 + v16) * -2.0;

  return v17 - v8 > 16.0;
}

- (MTAAlarmTableViewCell)init
{
  return -[MTAAlarmTableViewCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", 0, off_1000BEF98);
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
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell digitalClockLabel](self, "digitalClockLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell contentView](self, "contentView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layoutMarginsGuide"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v9));
    -[NSMutableArray addObject:](v4, "addObject:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell enabledSwitch](self, "enabledSwitch"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell detailLabel](self, "detailLabel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, 6.0));
    -[NSMutableArray addObject:](v4, "addObject:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell enabledSwitch](self, "enabledSwitch"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell contentView](self, "contentView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layoutMarginsGuide"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "leadingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v20));
    -[NSMutableArray addObject:](v4, "addObject:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell contentView](self, "contentView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell enabledSwitch](self, "enabledSwitch"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v25, 16.0));
    -[NSMutableArray addObject:](v4, "addObject:", v26);

    v27 = self->_accessibilitySizeLayoutConstraints;
    self->_accessibilitySizeLayoutConstraints = &v4->super;

    accessibilitySizeLayoutConstraints = self->_accessibilitySizeLayoutConstraints;
  }
  return accessibilitySizeLayoutConstraints;
}

- (void)_alarmActiveChanged:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  _DWORD v9[2];

  v4 = objc_msgSend(a3, "isOn");
  v6 = MTLogForCategory(8, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = (_DWORD)v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "TableViewCell: alarm active toggled to %d", (uint8_t *)v9, 8u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewCell delegate](self, "delegate"));
  objc_msgSend(v8, "setAlarmEnabled:forCell:", v4, self);

}

- (void)willTransitionToState:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTAAlarmTableViewCell;
  -[MTAAlarmTableViewCell willTransitionToState:](&v4, "willTransitionToState:", a3);
  -[MTAAlarmTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (MTAAlarmTableViewCellDelegate)delegate
{
  return (MTAAlarmTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDigitalClockLabel:(id)a3
{
  objc_storeStrong((id *)&self->_digitalClockLabel, a3);
}

- (void)setDetailLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailLabel, a3);
}

- (void)setRegularLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_regularLayoutConstraints, a3);
}

- (void)setAccessibilitySizeLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilitySizeLayoutConstraints, a3);
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
  objc_storeStrong((id *)&self->_recognizer, 0);
  objc_storeStrong((id *)&self->_deadZone, 0);
  objc_storeStrong((id *)&self->_enabledSwitch, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_digitalClockLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
