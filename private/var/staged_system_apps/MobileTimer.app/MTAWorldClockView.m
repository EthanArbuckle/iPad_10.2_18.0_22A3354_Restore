@implementation MTAWorldClockView

- (MTAWorldClockView)initWithFrame:(CGRect)a3
{
  MTAWorldClockView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UILabel *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UILabel *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  UILabel *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSDateFormatter *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)MTAWorldClockView;
  v3 = -[MTAWorldClockView initWithFrame:](&v44, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTUIAnalogClockView analogClockWithStyle:](MTUIAnalogClockView, "analogClockWithStyle:", 1));
    -[MTAWorldClockView setAnalogClock:](v3, "setAnalogClock:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView analogClock](v3, "analogClock"));
    objc_msgSend(v5, "setRunMode:", 2);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView analogClock](v3, "analogClock"));
    -[MTAWorldClockView addSubview:](v3, "addSubview:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    v8 = objc_opt_new(UILabel);
    -[MTAWorldClockView setCityNameLabel:](v3, "setCityNameLabel:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView cityNameLabel](v3, "cityNameLabel"));
    objc_msgSend(v9, "setFont:", v7);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView cityNameLabel](v3, "cityNameLabel"));
    objc_msgSend(v10, "setAdjustsFontForContentSizeCategory:", 1);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_primaryTextColor](UIColor, "mtui_primaryTextColor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView cityNameLabel](v3, "cityNameLabel"));
    objc_msgSend(v12, "setTextColor:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView cityNameLabel](v3, "cityNameLabel"));
    objc_msgSend(v13, "setTextAlignment:", 1);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView cityNameLabel](v3, "cityNameLabel"));
    -[MTAWorldClockView addSubview:](v3, "addSubview:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
    v16 = objc_opt_new(UILabel);
    -[MTAWorldClockView setTimeZoneOffsetLabel:](v3, "setTimeZoneOffsetLabel:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView timeZoneOffsetLabel](v3, "timeZoneOffsetLabel"));
    objc_msgSend(v17, "setFont:", v15);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView timeZoneOffsetLabel](v3, "timeZoneOffsetLabel"));
    objc_msgSend(v18, "setAdjustsFontForContentSizeCategory:", 1);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_secondaryTextColor](UIColor, "mtui_secondaryTextColor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView timeZoneOffsetLabel](v3, "timeZoneOffsetLabel"));
    objc_msgSend(v20, "setTextColor:", v19);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView timeZoneOffsetLabel](v3, "timeZoneOffsetLabel"));
    objc_msgSend(v21, "setTextAlignment:", 1);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView timeZoneOffsetLabel](v3, "timeZoneOffsetLabel"));
    -[MTAWorldClockView addSubview:](v3, "addSubview:", v22);

    v23 = objc_opt_new(UILabel);
    -[MTAWorldClockView setSunriseLabel:](v3, "setSunriseLabel:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView sunriseLabel](v3, "sunriseLabel"));
    objc_msgSend(v24, "setFont:", v15);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView sunriseLabel](v3, "sunriseLabel"));
    objc_msgSend(v25, "setAdjustsFontForContentSizeCategory:", 1);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_secondaryTextColor](UIColor, "mtui_secondaryTextColor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView sunriseLabel](v3, "sunriseLabel"));
    objc_msgSend(v27, "setTextColor:", v26);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView sunriseLabel](v3, "sunriseLabel"));
    objc_msgSend(v28, "setTextAlignment:", 1);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView sunriseLabel](v3, "sunriseLabel"));
    objc_msgSend(v29, "setAdjustsFontSizeToFitWidth:", 1);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView sunriseLabel](v3, "sunriseLabel"));
    -[MTAWorldClockView addSubview:](v3, "addSubview:", v30);

    v31 = objc_opt_new(UILabel);
    -[MTAWorldClockView setSunsetLabel:](v3, "setSunsetLabel:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView sunsetLabel](v3, "sunsetLabel"));
    objc_msgSend(v32, "setFont:", v15);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView sunsetLabel](v3, "sunsetLabel"));
    objc_msgSend(v33, "setAdjustsFontForContentSizeCategory:", 1);

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_secondaryTextColor](UIColor, "mtui_secondaryTextColor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView sunsetLabel](v3, "sunsetLabel"));
    objc_msgSend(v35, "setTextColor:", v34);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView sunsetLabel](v3, "sunsetLabel"));
    objc_msgSend(v36, "setTextAlignment:", 1);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView sunsetLabel](v3, "sunsetLabel"));
    -[MTAWorldClockView addSubview:](v3, "addSubview:", v37);

    v38 = objc_opt_new(NSDateFormatter);
    -[MTAWorldClockView setTimeFormatter:](v3, "setTimeFormatter:", v38);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView timeFormatter](v3, "timeFormatter"));
    objc_msgSend(v39, "setDateStyle:", 0);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView timeFormatter](v3, "timeFormatter"));
    objc_msgSend(v40, "setTimeStyle:", 1);

    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](NSLocale, "autoupdatingCurrentLocale"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView timeFormatter](v3, "timeFormatter"));
    objc_msgSend(v42, "setLocale:", v41);

  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double MidX;
  CGFloat v11;
  void *v12;
  double Width;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double MaxY;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double Height;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  void *v70;
  objc_super v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  v71.receiver = self;
  v71.super_class = (Class)MTAWorldClockView;
  -[MTAWorldClockView layoutSubviews](&v71, "layoutSubviews");
  -[MTAWorldClockView updateLabelAdjustFontSize](self, "updateLabelAdjustFontSize");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView analogClock](self, "analogClock"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  -[MTAWorldClockView bounds](self, "bounds");
  MidX = CGRectGetMidX(v72);
  v73.origin.y = 24.0;
  v73.origin.x = v5;
  v73.size.width = v7;
  v73.size.height = v9;
  v11 = MidX + CGRectGetWidth(v73) * -0.5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView analogClock](self, "analogClock"));
  objc_msgSend(v12, "setFrame:", v11, 24.0, v7, v9);

  -[MTAWorldClockView bounds](self, "bounds");
  Width = CGRectGetWidth(v74);
  -[MTAWorldClockView layoutMargins](self, "layoutMargins");
  v15 = Width - v14;
  -[MTAWorldClockView layoutMargins](self, "layoutMargins");
  v17 = v15 - v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView cityNameLabel](self, "cityNameLabel"));
  objc_msgSend(v18, "sizeToFit");

  v75.origin.y = 24.0;
  v75.origin.x = v11;
  v75.size.width = v7;
  v75.size.height = v9;
  MaxY = CGRectGetMaxY(v75);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView cityNameLabel](self, "cityNameLabel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "font"));
  objc_msgSend(v21, "_scaledValueForValue:", 30.0);
  v23 = MaxY + v22;

  -[MTAWorldClockView layoutMargins](self, "layoutMargins");
  v25 = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView cityNameLabel](self, "cityNameLabel"));
  objc_msgSend(v26, "_firstBaselineOffsetFromTop");
  v28 = v23 - v27;

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView cityNameLabel](self, "cityNameLabel"));
  objc_msgSend(v29, "frame");
  Height = CGRectGetHeight(v76);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView cityNameLabel](self, "cityNameLabel"));
  objc_msgSend(v31, "setFrame:", v25, v28, v17, Height);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView timeZoneOffsetLabel](self, "timeZoneOffsetLabel"));
  objc_msgSend(v32, "sizeToFit");

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView timeZoneOffsetLabel](self, "timeZoneOffsetLabel"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "font"));
  objc_msgSend(v34, "_scaledValueForValue:", 20.0);
  v36 = v23 + v35;

  -[MTAWorldClockView layoutMargins](self, "layoutMargins");
  v38 = v37;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView timeZoneOffsetLabel](self, "timeZoneOffsetLabel"));
  objc_msgSend(v39, "_firstBaselineOffsetFromTop");
  v41 = v36 - v40;

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView timeZoneOffsetLabel](self, "timeZoneOffsetLabel"));
  objc_msgSend(v42, "frame");
  v43 = CGRectGetHeight(v77);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView timeZoneOffsetLabel](self, "timeZoneOffsetLabel"));
  objc_msgSend(v44, "setFrame:", v38, v41, v17, v43);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView sunriseLabel](self, "sunriseLabel"));
  objc_msgSend(v45, "sizeToFit");

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView sunriseLabel](self, "sunriseLabel"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "font"));
  objc_msgSend(v47, "_scaledValueForValue:", 20.0);
  v49 = v36 + v48;

  -[MTAWorldClockView layoutMargins](self, "layoutMargins");
  v51 = v50;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView sunriseLabel](self, "sunriseLabel"));
  objc_msgSend(v52, "_firstBaselineOffsetFromTop");
  v54 = v49 - v53;

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView sunriseLabel](self, "sunriseLabel"));
  objc_msgSend(v55, "frame");
  v56 = CGRectGetHeight(v78);

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView sunriseLabel](self, "sunriseLabel"));
  objc_msgSend(v57, "setFrame:", v51, v54, v17, v56);

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView sunsetLabel](self, "sunsetLabel"));
  objc_msgSend(v58, "sizeToFit");

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView sunsetLabel](self, "sunsetLabel"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "font"));
  objc_msgSend(v60, "_scaledValueForValue:", 20.0);
  v62 = v49 + v61;

  -[MTAWorldClockView layoutMargins](self, "layoutMargins");
  v64 = v63;
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView sunsetLabel](self, "sunsetLabel"));
  objc_msgSend(v65, "_firstBaselineOffsetFromTop");
  v67 = v62 - v66;

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView sunsetLabel](self, "sunsetLabel"));
  objc_msgSend(v68, "frame");
  v69 = CGRectGetHeight(v79);

  v70 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView sunsetLabel](self, "sunsetLabel"));
  objc_msgSend(v70, "setFrame:", v64, v67, v17, v69);

}

- (void)updateLabelAdjustFontSize
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView cityNameLabel](self, "cityNameLabel"));
  v7 = v6;
  if (IsAccessibilityCategory)
  {
    objc_msgSend(v6, "setAdjustsFontSizeToFitWidth:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView sunsetLabel](self, "sunsetLabel"));
    objc_msgSend(v8, "setAdjustsFontSizeToFitWidth:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView sunriseLabel](self, "sunriseLabel"));
    objc_msgSend(v9, "setAdjustsFontSizeToFitWidth:", 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView timeZoneOffsetLabel](self, "timeZoneOffsetLabel"));
    v14 = v10;
    v11 = 0;
  }
  else
  {
    objc_msgSend(v6, "setAdjustsFontSizeToFitWidth:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView sunsetLabel](self, "sunsetLabel"));
    objc_msgSend(v12, "setAdjustsFontSizeToFitWidth:", 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView sunriseLabel](self, "sunriseLabel"));
    objc_msgSend(v13, "setAdjustsFontSizeToFitWidth:", 1);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView timeZoneOffsetLabel](self, "timeZoneOffsetLabel"));
    v14 = v10;
    v11 = 1;
  }
  objc_msgSend(v10, "setAdjustsFontSizeToFitWidth:", v11);

}

+ (double)preferredHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
  +[MTUIAnalogClockView sizeForStyle:](MTUIAnalogClockView, "sizeForStyle:", 1);
  v5 = v4 + 24.0;
  objc_msgSend(v2, "_scaledValueForValue:", 30.0);
  v7 = v6 + v5;
  objc_msgSend(v3, "_scaledValueForValue:", 20.0);
  v9 = v8 + v7;
  objc_msgSend(v3, "_scaledValueForValue:", 20.0);
  v11 = v10 + v9;
  objc_msgSend(v3, "_scaledValueForValue:", 20.0);
  v13 = v12 + v11 + 26.0;

  return v13;
}

- (void)setCity:(id)a3
{
  WorldClockCity *v5;
  WorldClockCity *city;
  unsigned __int8 v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  WorldClockCity *v15;

  v5 = (WorldClockCity *)a3;
  city = self->_city;
  if (city != v5)
  {
    v15 = v5;
    v7 = -[WorldClockCity isEqual:](city, "isEqual:", v5);
    v5 = v15;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_city, a3);
      v8 = objc_alloc((Class)NSTimeZone);
      v9 = objc_claimAutoreleasedReturnValue(-[WorldClockCity timeZone](self->_city, "timeZone"));
      v10 = objc_msgSend(v8, "initWithName:", v9);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView analogClock](self, "analogClock"));
      objc_msgSend(v11, "setTimeZone:", v10);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView analogClock](self, "analogClock"));
      LOBYTE(v9) = objc_msgSend(v12, "isStarted");

      if ((v9 & 1) == 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView analogClock](self, "analogClock"));
        objc_msgSend(v13, "updateTimeAnimated:", 0);

      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView timeFormatter](self, "timeFormatter"));
      objc_msgSend(v14, "setTimeZone:", v10);

      -[MTAWorldClockView updateDetails](self, "updateDetails");
      v5 = v15;
    }
  }

}

- (void)updateCityNameAndTime
{
  void *v3;
  void *v4;
  void *v5;
  NSBundle *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView timeFormatter](self, "timeFormatter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView analogClock](self, "analogClock"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "time"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringFromDate:", v5));

  v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MTAWorldClockView));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CITY_AND_TIME_FORMAT"), &stru_10009A4D0, CFSTR("Localizable")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView city](self, "city"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v10, v13));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView cityNameLabel](self, "cityNameLabel"));
  objc_msgSend(v12, "setText:", v11);

}

- (void)updateDetails
{
  void *v3;
  void *v4;
  void *v5;
  _BYTE *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[MTAWorldClockView updateCityNameAndTime](self, "updateCityNameAndTime");
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView analogClock](self, "analogClock"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timeZone"));
  v6 = objc_msgSend(v5, "secondsFromGMTForDate:", v12);
  v7 = v6 - (_BYTE *)objc_msgSend(v3, "secondsFromGMTForDate:", v12);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView analogClock](self, "analogClock"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "time"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTUIWorldClockCellView dayAndTimeZoneOffsetStringFromDate:withTimeZoneOffset:timeZoneAbbreviation:spaceBeforeTimeDesignator:](MTUIWorldClockCellView, "dayAndTimeZoneOffsetStringFromDate:withTimeZoneOffset:timeZoneAbbreviation:spaceBeforeTimeDesignator:", v9, v7, 0, 1));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView timeZoneOffsetLabel](self, "timeZoneOffsetLabel"));
  objc_msgSend(v11, "setText:", v10);

  -[MTAWorldClockView updateSunriseAndSunsetLabel](self, "updateSunriseAndSunsetLabel");
}

- (void)updateSunriseAndSunsetLabel
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002AC5C;
  block[3] = &unk_100099320;
  block[4] = self;
  dispatch_async(v4, block);

}

- (int64_t)runMode
{
  return 0;
}

- (void)updateTime
{
  -[MTAWorldClockView setMinute:](self, "setMinute:", vcvtmd_s64_f64(CFAbsoluteTimeGetCurrent() / 60.0));
  -[MTAWorldClockView updateCityNameAndTime](self, "updateCityNameAndTime");
}

- (void)start
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView analogClock](self, "analogClock"));
  objc_msgSend(v3, "start");

  +[MTUIAnalogClockView registerClock:](MTUIAnalogClockView, "registerClock:", self);
}

- (void)stop
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockView analogClock](self, "analogClock"));
  objc_msgSend(v3, "stop");

  +[MTUIAnalogClockView unregisterClock:](MTUIAnalogClockView, "unregisterClock:", self);
}

- (void)updateTimeContinuously:(int64_t)a3
{
  if (-[MTAWorldClockView minute](self, "minute") != a3)
  {
    -[MTAWorldClockView setMinute:](self, "setMinute:", a3);
    -[MTAWorldClockView updateTime](self, "updateTime");
  }
}

- (double)updateInterval
{
  return 1.0;
}

- (double)coarseUpdateInterval
{
  return 60.0;
}

- (WorldClockCity)city
{
  return self->_city;
}

- (MTUIAnalogClockView)analogClock
{
  return self->_analogClock;
}

- (void)setAnalogClock:(id)a3
{
  objc_storeStrong((id *)&self->_analogClock, a3);
}

- (UILabel)cityNameLabel
{
  return self->_cityNameLabel;
}

- (void)setCityNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_cityNameLabel, a3);
}

- (UILabel)timeZoneOffsetLabel
{
  return self->_timeZoneOffsetLabel;
}

- (void)setTimeZoneOffsetLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timeZoneOffsetLabel, a3);
}

- (UILabel)sunriseLabel
{
  return self->_sunriseLabel;
}

- (void)setSunriseLabel:(id)a3
{
  objc_storeStrong((id *)&self->_sunriseLabel, a3);
}

- (UILabel)sunsetLabel
{
  return self->_sunsetLabel;
}

- (void)setSunsetLabel:(id)a3
{
  objc_storeStrong((id *)&self->_sunsetLabel, a3);
}

- (int64_t)minute
{
  return self->_minute;
}

- (void)setMinute:(int64_t)a3
{
  self->_minute = a3;
}

- (NSDateFormatter)timeFormatter
{
  return self->_timeFormatter;
}

- (void)setTimeFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_timeFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_sunsetLabel, 0);
  objc_storeStrong((id *)&self->_sunriseLabel, 0);
  objc_storeStrong((id *)&self->_timeZoneOffsetLabel, 0);
  objc_storeStrong((id *)&self->_cityNameLabel, 0);
  objc_storeStrong((id *)&self->_analogClock, 0);
  objc_storeStrong((id *)&self->_city, 0);
}

@end
