@implementation CarplayCollapsedAllDayTableViewCell

+ (id)reuseIdentifier
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BCC88;
  block[3] = &unk_1001B2DA0;
  block[4] = a1;
  if (qword_1001F6378 != -1)
    dispatch_once(&qword_1001F6378, block);
  return (id)qword_1001F6370;
}

- (CarplayCollapsedAllDayTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CarplayCollapsedAllDayTableViewCell *v4;
  void *v5;
  UIView *v6;
  UIView *occurrenceCellSuperview;
  void *v8;
  void *v9;
  UIView *v10;
  UIView *allDaySuperview;
  void *v12;
  void *v13;
  CollapsedCellBackgroundView *v14;
  UIView *coloredBackgroundView;
  void *v16;
  void *v17;
  UILabel *v18;
  UILabel *primaryLabel;
  void *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CarplayCollapsedAllDayTableViewCell;
  v4 = -[CarplayCollapsedAllDayTableViewCell initWithStyle:reuseIdentifier:](&v23, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[CarplayCollapsedAllDayTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = objc_opt_new(UIView);
    occurrenceCellSuperview = v4->_occurrenceCellSuperview;
    v4->_occurrenceCellSuperview = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIView setBackgroundColor:](v4->_occurrenceCellSuperview, "setBackgroundColor:", v8);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_occurrenceCellSuperview, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setHidden:](v4->_occurrenceCellSuperview, "setHidden:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayCollapsedAllDayTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v9, "addSubview:", v4->_occurrenceCellSuperview);

    v10 = objc_opt_new(UIView);
    allDaySuperview = v4->_allDaySuperview;
    v4->_allDaySuperview = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIView setBackgroundColor:](v4->_allDaySuperview, "setBackgroundColor:", v12);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_allDaySuperview, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayCollapsedAllDayTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v13, "addSubview:", v4->_allDaySuperview);

    v14 = -[CollapsedCellBackgroundView initWithFrame:]([CollapsedCellBackgroundView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    coloredBackgroundView = v4->_coloredBackgroundView;
    v4->_coloredBackgroundView = &v14->super;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_coloredBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayCollapsedAllDayTableViewCell normalPlatterBackgroundColor](v4, "normalPlatterBackgroundColor"));
    -[UIView setBackgroundColor:](v4->_coloredBackgroundView, "setBackgroundColor:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v4->_coloredBackgroundView, "layer"));
    objc_msgSend(v17, "setMasksToBounds:", 1);

    -[UIView addSubview:](v4->_allDaySuperview, "addSubview:", v4->_coloredBackgroundView);
    v18 = objc_opt_new(UILabel);
    primaryLabel = v4->_primaryLabel;
    v4->_primaryLabel = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayCollapsedAllDayTableViewCell primaryTextLabelFont](v4, "primaryTextLabelFont"));
    -[UILabel setFont:](v4->_primaryLabel, "setFont:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayCollapsedAllDayTableViewCell normalPrimaryTextColor](v4, "normalPrimaryTextColor"));
    -[UILabel setTextColor:](v4->_primaryLabel, "setTextColor:", v21);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_primaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v4->_primaryLabel, "setNumberOfLines:", 1);
    -[UIView addSubview:](v4->_allDaySuperview, "addSubview:", v4->_primaryLabel);
    -[CarplayCollapsedAllDayTableViewCell _setupConstraints](v4, "_setupConstraints");
  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  BOOL v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  v15.receiver = self;
  v15.super_class = (Class)CarplayCollapsedAllDayTableViewCell;
  -[CarplayCollapsedAllDayTableViewCell layoutSubviews](&v15, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayCollapsedAllDayTableViewCell layer](self, "layer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mask"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayCollapsedAllDayTableViewCell layer](self, "layer"));
    objc_msgSend(v5, "bounds");
    v17.origin.x = v6;
    v17.origin.y = v7;
    v17.size.width = v8;
    v17.size.height = v9;
    v16.origin.x = CGRectZero.origin.x;
    v16.origin.y = CGRectZero.origin.y;
    v16.size.width = CGRectZero.size.width;
    v16.size.height = CGRectZero.size.height;
    v10 = CGRectEqualToRect(v16, v17);

    if (!v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 1.0)));
      objc_msgSend(v11, "setBackgroundColor:", objc_msgSend(v12, "CGColor"));

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayCollapsedAllDayTableViewCell layer](self, "layer"));
      objc_msgSend(v13, "bounds");
      objc_msgSend(v11, "setFrame:");

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayCollapsedAllDayTableViewCell layer](self, "layer"));
      objc_msgSend(v14, "setMask:", v11);

    }
  }
}

- (void)configureWithAllDayCount:(int64_t)a3 birthdayCount:(int64_t)a4
{
  void *v7;

  -[CarplayCollapsedAllDayTableViewCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  self->_allDayCount = a3;
  self->_birthdayCount = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayCollapsedAllDayTableViewCell _cellTitle](self, "_cellTitle"));
  -[UILabel setText:](self->_primaryLabel, "setText:", v7);

  -[CarplayCollapsedAllDayTableViewCell forceUpdateOfAllElements](self, "forceUpdateOfAllElements");
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)forceUpdateOfAllElements
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayCollapsedAllDayTableViewCell normalPlatterBackgroundColor](self, "normalPlatterBackgroundColor"));
  -[UIView setBackgroundColor:](self->_coloredBackgroundView, "setBackgroundColor:", v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarplayCollapsedAllDayTableViewCell normalPrimaryTextColor](self, "normalPrimaryTextColor"));
  -[UILabel setTextColor:](self->_primaryLabel, "setTextColor:", v4);

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
  void *v41;
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
  _QWORD v60[16];

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_allDaySuperview, "leadingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayCollapsedAllDayTableViewCell contentView](self, "contentView"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "leadingAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v57));
  v60[0] = v56;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_allDaySuperview, "trailingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayCollapsedAllDayTableViewCell contentView](self, "contentView"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "trailingAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v53));
  v60[1] = v52;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_allDaySuperview, "topAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayCollapsedAllDayTableViewCell contentView](self, "contentView"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "topAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v49));
  v60[2] = v48;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_allDaySuperview, "bottomAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayCollapsedAllDayTableViewCell contentView](self, "contentView"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "bottomAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v45));
  v60[3] = v44;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_occurrenceCellSuperview, "leadingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayCollapsedAllDayTableViewCell contentView](self, "contentView"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
  v60[4] = v40;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_occurrenceCellSuperview, "trailingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayCollapsedAllDayTableViewCell contentView](self, "contentView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "trailingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
  v60[5] = v36;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_occurrenceCellSuperview, "topAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayCollapsedAllDayTableViewCell contentView](self, "contentView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
  v60[6] = v32;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_occurrenceCellSuperview, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayCollapsedAllDayTableViewCell contentView](self, "contentView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "bottomAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
  v60[7] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_coloredBackgroundView, "topAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_allDaySuperview, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
  v60[8] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_coloredBackgroundView, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_allDaySuperview, "bottomAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
  v60[9] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_coloredBackgroundView, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_allDaySuperview, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v60[10] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_coloredBackgroundView, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_allDaySuperview, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v17));
  v60[11] = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_primaryLabel, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_coloredBackgroundView, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v14, 8.0));
  v60[12] = v13;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_primaryLabel, "bottomAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_coloredBackgroundView, "bottomAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4, -8.0));
  v60[13] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_primaryLabel, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_coloredBackgroundView, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintLessThanOrEqualToAnchor:constant:", v7, -8.0));
  v60[14] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_primaryLabel, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_coloredBackgroundView, "leadingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, 16.5));
  v60[15] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v60, 16));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (id)primaryTextLabelFont
{
  return +[UIFont _preferredFontForTextStyle:addingSymbolicTraits:](UIFont, "_preferredFontForTextStyle:addingSymbolicTraits:", UIFontTextStyleBody, 2);
}

- (id)normalPrimaryTextColor
{
  void *v2;

  if (-[CarplayCollapsedAllDayTableViewCell isHighlighted](self, "isHighlighted"))
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
  else
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
  return v2;
}

- (id)normalTopTimeTextColor
{
  return +[UIColor _carSystemPrimaryColor](UIColor, "_carSystemPrimaryColor");
}

- (id)normalPlatterBackgroundColor
{
  void *v2;

  if (-[CarplayCollapsedAllDayTableViewCell isHighlighted](self, "isHighlighted"))
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
  else
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemQuaternaryColor](UIColor, "_carSystemQuaternaryColor"));
  return v2;
}

- (id)_cellTitle
{
  double v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t *p_birthdayCount;
  __CFString *v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;

  if (self->_allDayCount)
  {
    *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v4, v3));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("num_all_day_events_carplay_list"), &stru_1001B67C0, 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, self->_allDayCount));

    p_birthdayCount = &self->_birthdayCount;
    if (!self->_birthdayCount)
    {
      if (v7)
      {
        v9 = 0;
LABEL_11:
        v19 = v7;

        v9 = v19;
        return v9;
      }
LABEL_13:
      v9 = &stru_1001B67C0;
      return v9;
    }
  }
  else
  {
    p_birthdayCount = &self->_birthdayCount;
    if (!self->_birthdayCount)
      goto LABEL_13;
    v7 = 0;
  }
  *(_QWORD *)&v10 = objc_opt_class(self).n128_u64[0];
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v11, v10));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("num_birthday_events_carplay_list"), &stru_1001B67C0, 0));
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, *p_birthdayCount));

  if (!v7 || !v9)
  {
    if (v7)
      goto LABEL_11;
    if (v9)
      return v9;
    goto LABEL_13;
  }
  *(_QWORD *)&v14 = objc_opt_class(self).n128_u64[0];
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v15, v14));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("%@, %@"), &stru_1001B67C0, 0));
  v18 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v17, v7, v9));

  v9 = (__CFString *)v18;
  return v9;
}

- (void)crossfadeToCell:(id)a3
{
  id v4;
  void *v5;
  UIView *occurrenceCellSuperview;
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
  _QWORD v25[4];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  occurrenceCellSuperview = self->_occurrenceCellSuperview;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
  -[UIView addSubview:](occurrenceCellSuperview, "addSubview:", v7);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_occurrenceCellSuperview, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
  v25[0] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_occurrenceCellSuperview, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v18));
  v25[1] = v17;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_occurrenceCellSuperview, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  v25[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_occurrenceCellSuperview, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
  v25[3] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

  +[UIView transitionFromView:toView:duration:options:completion:](UIView, "transitionFromView:toView:duration:options:completion:", self->_allDaySuperview, self->_occurrenceCellSuperview, 5243136, 0, 0.3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_occurrenceCellSuperview, 0);
  objc_storeStrong((id *)&self->_allDaySuperview, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_coloredBackgroundView, 0);
}

@end
