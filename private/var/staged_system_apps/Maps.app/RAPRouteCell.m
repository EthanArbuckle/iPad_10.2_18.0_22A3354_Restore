@implementation RAPRouteCell

- (RAPRouteCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RAPRouteCell *v4;
  RAPRouteCell *v5;
  void *v6;
  id v7;
  double y;
  double width;
  double height;
  UIView *v11;
  UIView *iconImageContainerView;
  void *v13;
  UIImageView *v14;
  UIImageView *iconImageView;
  UILabel *v16;
  UILabel *titleLabel;
  double v18;
  void *v19;
  UILabel *v20;
  UILabel *subtitleLabel;
  double v22;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)RAPRouteCell;
  v4 = -[RAPRouteCell initWithStyle:reuseIdentifier:](&v25, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[RAPRouteCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[RAPRouteCell setBackgroundColor:](v5, "setBackgroundColor:", v6);

    v7 = objc_alloc((Class)UIView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v11 = (UIView *)objc_msgSend(v7, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    iconImageContainerView = v5->_iconImageContainerView;
    v5->_iconImageContainerView = v11;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_iconImageContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteCell contentView](v5, "contentView"));
    objc_msgSend(v13, "addSubview:", v5->_iconImageContainerView);

    v14 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    iconImageView = v5->_iconImageView;
    v5->_iconImageView = v14;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_iconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v5->_iconImageView, "setContentMode:", 1);
    -[UIView addSubview:](v5->_iconImageContainerView, "addSubview:", v5->_iconImageView);
    v16 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v16;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v18) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v5->_titleLabel, "setContentHuggingPriority:forAxis:", 1, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteCell contentView](v5, "contentView"));
    objc_msgSend(v19, "addSubview:", v5->_titleLabel);

    v20 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    subtitleLabel = v5->_subtitleLabel;
    v5->_subtitleLabel = v20;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v22) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v5->_subtitleLabel, "setContentHuggingPriority:forAxis:", 1, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteCell contentView](v5, "contentView"));
    objc_msgSend(v23, "addSubview:", v5->_subtitleLabel);

    -[RAPRouteCell _setupConstraints](v5, "_setupConstraints");
    -[RAPRouteCell _setupStyling](v5, "_setupStyling");
  }
  return v5;
}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
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
  _QWORD v58[17];

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_iconImageContainerView, "heightAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToConstant:", 25.0));
  v58[0] = v56;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_iconImageContainerView, "widthAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToConstant:", 25.0));
  v58[1] = v54;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_iconImageContainerView, "leadingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteCell contentView](self, "contentView"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "leadingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:constant:", v51, 16.0));
  v58[2] = v50;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_iconImageContainerView, "centerYAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteCell contentView](self, "contentView"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "centerYAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v47));
  v58[3] = v46;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](self->_iconImageView, "centerXAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_iconImageContainerView, "centerXAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v44));
  v58[4] = v43;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_iconImageView, "centerYAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_iconImageContainerView, "centerYAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
  v58[5] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_iconImageView, "widthAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintLessThanOrEqualToConstant:", 25.0));
  v58[6] = v38;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_iconImageView, "heightAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintLessThanOrEqualToConstant:", 25.0));
  v58[7] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_iconImageContainerView, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, 10.0));
  v58[8] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteCell contentView](self, "contentView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, 16.0));
  v58[9] = v29;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteCell contentView](self, "contentView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, 40.0));
  v58[10] = v25;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_titleLabel, "topAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteCell contentView](self, "contentView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v22, 14.0));
  v58[11] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_subtitleLabel, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v19));
  v58[12] = v18;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_subtitleLabel, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v16));
  v58[13] = v15;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_subtitleLabel, "topAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintGreaterThanOrEqualToAnchor:", v3));
  v58[14] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_subtitleLabel, "firstBaselineAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_titleLabel, "lastBaselineAnchor"));
  LODWORD(v7) = 1144750080;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:priority:", v6, 20.0, v7));
  v58[15] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteCell contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_subtitleLabel, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 14.0));
  v58[16] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v58, 17));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

}

- (id)_cellBackgroundColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 0));
  v9[0] = v2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
  v9[1] = v3;
  v10[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  v10[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _dynamicColorWithColorsByTraitCollection:](UIColor, "_dynamicColorWithColorsByTraitCollection:", v6));
  return v7;
}

- (void)_setupStyling
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteCell _cellBackgroundColor](self, "_cellBackgroundColor"));
  -[RAPRouteCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor darkGrayColor](UIColor, "darkGrayColor"));
  -[UIImageView setTintColor:](self->_iconImageView, "setTintColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v5);

  -[UILabel setAllowsDefaultTighteningForTruncation:](self->_titleLabel, "setAllowsDefaultTighteningForTruncation:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", UIFontTextStyleHeadline, UIFontWeightBold));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v7);

  -[UILabel setAllowsDefaultTighteningForTruncation:](self->_subtitleLabel, "setAllowsDefaultTighteningForTruncation:", 1);
  v8 = (id)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:", UIFontTextStyleSubheadline));
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v8);

}

- (void)configureWithRequest:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  __objc2_prot *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  unsigned int v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  const __CFString *v24;
  const __CFString *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;

  v4 = a3;
  v5 = objc_opt_class(HistoryRAPUserDirectionRequest);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "historyItem"));
  v9 = &OBJC_PROTOCOL___MSPHistoryEntryRoute;
  v10 = objc_opt_class(HistoryEntryRecentsItem);
  v11 = v8;
  if ((objc_opt_isKindOfClass(v11, v10) & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13
    && (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "historyEntry")),
        v15 = objc_msgSend(v14, "conformsToProtocol:", v9),
        v14,
        v15))
  {
    v16 = v11;
  }
  else
  {
    v16 = 0;
  }

  if (v16)
  {
    v28 = 0;
    v29 = 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "historyEntry"));
    +[SearchResult newStartWaypointSearchResult:endWaypointSearchResult:forRouteHistoryEntry:](SearchResult, "newStartWaypointSearchResult:endWaypointSearchResult:forRouteHistoryEntry:", &v29, &v28, v17);
    v18 = v29;
    v19 = v28;

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name"));
    -[UILabel setText:](self->_titleLabel, "setText:", v20);

    objc_msgSend(v16, "timestamp");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteCell _formattedTimeStringSinceDirectionsWereTaken:](self, "_formattedTimeStringSinceDirectionsWereTaken:"));
    -[UILabel setText:](self->_subtitleLabel, "setText:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "historyEntry"));
    v23 = objc_msgSend(v22, "transportType");

    v24 = CFSTR("rp_drive");
    if (v23 == (id)2)
      v24 = CFSTR("rp_walk");
    if (v23 == (id)5)
      v25 = CFSTR("rp_cycle");
    else
      v25 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v25));
    -[UIImageView setImage:](self->_iconImageView, "setImage:", v26);

  }
  else
  {
    v27 = sub_100431F8C();
    v18 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v4;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to create a historyEntryRecentsItem from request: %@", buf, 0xCu);
    }
  }

}

- (id)_formattedTimeStringSinceDirectionsWereTaken:(double)a3
{
  double v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  double v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = CFAbsoluteTimeGetCurrent() - a3;
  if (v3 >= 60.0)
  {
    if (v3 >= 86400.0)
    {
      if (v3 >= 172800.0)
      {
        if (v3 < 604800.0)
        {
          v13 = -v3;
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -v3));
          v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter _maps_weekdayForDate:](NSDateFormatter, "_maps_weekdayForDate:", v14));

          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", v13));
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter _maps_timeForDate:](NSDateFormatter, "_maps_timeForDate:", v15));

          v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v16));
          goto LABEL_9;
        }
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -v3));
        v5 = objc_claimAutoreleasedReturnValue(+[NSDateFormatter _maps_dateStringWithoutYearForDate:](NSDateFormatter, "_maps_dateStringWithoutYearForDate:", v4));
        goto LABEL_3;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -v3));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter _maps_timeForDate:](NSDateFormatter, "_maps_timeForDate:", v10));

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("Yesterday %@ [DirectionsHistoryItemCell]");
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateComponentsFormatter _maps_stringLongFromTimeInterval:](NSDateComponentsFormatter, "_maps_stringLongFromTimeInterval:"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("%@ ago [DirectionsHistoryItemCell]");
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, CFSTR("localized string not found"), 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v4));

    goto LABEL_9;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Just now [DirectionsHistoryItemCell]"), CFSTR("localized string not found"), 0));
LABEL_3:
  v6 = (void *)v5;
LABEL_9:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconImageContainerView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end
