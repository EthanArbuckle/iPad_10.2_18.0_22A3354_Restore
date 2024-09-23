@implementation CarETAOnlyGuidanceSign

+ ($59E334741CCDBB9B6DD47BAE86BD9633)viewMetrics
{
  *retstr = *($59E334741CCDBB9B6DD47BAE86BD9633 *)ymmword_100E3F058;
  return result;
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (CarETAOnlyGuidanceSign)initWithFrame:(CGRect)a3
{
  CarETAOnlyGuidanceSign *v3;
  double v4;
  CarETAOnlyGuidanceSign *v5;
  id v6;
  double y;
  double width;
  double height;
  UILabel *v10;
  UILabel *titleLabel;
  void *v12;
  void *v13;
  double v14;
  double v15;
  UILabel *v16;
  UILabel *subtitleLabel;
  void *v18;
  void *v19;
  double v20;
  double v21;
  UILabel *v22;
  UILabel *evArrivalInfoLabel;
  void *v24;
  void *v25;
  double v26;
  double v27;
  NSMutableArray *v28;
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
  objc_super v57;

  v57.receiver = self;
  v57.super_class = (Class)CarETAOnlyGuidanceSign;
  v3 = -[CarETAOnlyGuidanceSign initWithFrame:](&v57, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v3;
  if (v3)
  {
    LODWORD(v4) = 1148829696;
    -[CarETAOnlyGuidanceSign setContentHuggingPriority:forAxis:](v3, "setContentHuggingPriority:forAxis:", 1, v4);
    -[CarETAOnlyGuidanceSign setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", CFSTR("ETAOnlyGuidanceSign"));
    v5->_showsEvLabel = 0;
    v6 = objc_alloc((Class)UILabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v10 = (UILabel *)objc_msgSend(v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v10;

    -[UILabel setAccessibilityIdentifier:](v5->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCallout, UIFontWeightSemibold));
    -[UILabel setFont:](v5->_titleLabel, "setFont:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v5->_titleLabel, "setTextColor:", v13);

    -[UILabel setLineBreakMode:](v5->_titleLabel, "setLineBreakMode:", 4);
    -[UILabel setNumberOfLines:](v5->_titleLabel, "setNumberOfLines:", 3);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v14) = 1148829696;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v14);
    LODWORD(v15) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v5->_titleLabel, "setContentHuggingPriority:forAxis:", 1, v15);
    -[CarETAOnlyGuidanceSign addSubview:](v5, "addSubview:", v5->_titleLabel);
    v16 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    subtitleLabel = v5->_subtitleLabel;
    v5->_subtitleLabel = v16;

    -[UILabel setAccessibilityIdentifier:](v5->_subtitleLabel, "setAccessibilityIdentifier:", CFSTR("SubtitleLabel"));
    -[UILabel setLineBreakMode:](v5->_subtitleLabel, "setLineBreakMode:", 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCaption1, UIFontWeightRegular));
    -[UILabel setFont:](v5->_subtitleLabel, "setFont:", v18);

    -[UILabel setAdjustsFontSizeToFitWidth:](v5->_subtitleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](v5->_subtitleLabel, "setMinimumScaleFactor:", 0.699999988);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemPrimaryColor](UIColor, "_carSystemPrimaryColor"));
    -[UILabel setTextColor:](v5->_subtitleLabel, "setTextColor:", v19);

    LODWORD(v20) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_subtitleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v20);
    LODWORD(v21) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v5->_subtitleLabel, "setContentHuggingPriority:forAxis:", 1, v21);
    -[CarETAOnlyGuidanceSign addSubview:](v5, "addSubview:", v5->_subtitleLabel);
    v22 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    evArrivalInfoLabel = v5->_evArrivalInfoLabel;
    v5->_evArrivalInfoLabel = v22;

    -[UILabel setAccessibilityIdentifier:](v5->_evArrivalInfoLabel, "setAccessibilityIdentifier:", CFSTR("EVArrivalInfoLabel"));
    -[UILabel setLineBreakMode:](v5->_evArrivalInfoLabel, "setLineBreakMode:", 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCaption1, UIFontWeightRegular));
    -[UILabel setFont:](v5->_evArrivalInfoLabel, "setFont:", v24);

    -[UILabel setAdjustsFontSizeToFitWidth:](v5->_evArrivalInfoLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](v5->_evArrivalInfoLabel, "setMinimumScaleFactor:", 0.699999988);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_evArrivalInfoLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemPrimaryColor](UIColor, "_carSystemPrimaryColor"));
    -[UILabel setTextColor:](v5->_evArrivalInfoLabel, "setTextColor:", v25);

    LODWORD(v26) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_evArrivalInfoLabel, "setContentCompressionResistancePriority:forAxis:", 1, v26);
    LODWORD(v27) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v5->_evArrivalInfoLabel, "setContentHuggingPriority:forAxis:", 1, v27);
    -[CarETAOnlyGuidanceSign addSubview:](v5, "addSubview:", v5->_evArrivalInfoLabel);
    v28 = objc_opt_new(NSMutableArray);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v5->_titleLabel, "firstBaselineAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign topAnchor](v5, "topAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, 13.0));
    -[NSMutableArray addObject:](v28, "addObject:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5->_titleLabel, "leadingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign leadingAnchor](v5, "leadingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, 10.0));
    -[NSMutableArray addObject:](v28, "addObject:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v5->_titleLabel, "trailingAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign trailingAnchor](v5, "trailingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, -10.0));
    -[NSMutableArray addObject:](v28, "addObject:", v37);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v5->_subtitleLabel, "firstBaselineAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v5->_titleLabel, "lastBaselineAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39, 18.0));
    -[NSMutableArray addObject:](v28, "addObject:", v40);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5->_subtitleLabel, "leadingAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign leadingAnchor](v5, "leadingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:constant:", v42, 10.0));
    -[NSMutableArray addObject:](v28, "addObject:", v43);

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v5->_subtitleLabel, "trailingAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign trailingAnchor](v5, "trailingAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:constant:", v45, -10.0));
    -[NSMutableArray addObject:](v28, "addObject:", v46);

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v5->_evArrivalInfoLabel, "firstBaselineAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v5->_subtitleLabel, "lastBaselineAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:constant:", v48, 16.0));
    -[NSMutableArray addObject:](v28, "addObject:", v49);

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5->_evArrivalInfoLabel, "leadingAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign leadingAnchor](v5, "leadingAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:constant:", v51, 10.0));
    -[NSMutableArray addObject:](v28, "addObject:", v52);

    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v5->_evArrivalInfoLabel, "trailingAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign trailingAnchor](v5, "trailingAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, -10.0));
    -[NSMutableArray addObject:](v28, "addObject:", v55);

    -[CarETAOnlyGuidanceSign _refreshBottomConstraint](v5, "_refreshBottomConstraint");
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

  }
  return v5;
}

- (void)_updateContents
{
  id v3;
  double v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
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
  unsigned int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  NSAttributedStringKey v43;
  id v44;

  v3 = objc_alloc_init((Class)NSMutableParagraphStyle);
  LODWORD(v4) = 1036831949;
  objc_msgSend(v3, "setHyphenationFactor:", v4);
  objc_msgSend(v3, "setLineBreakMode:", 4);
  v43 = NSParagraphStyleAttributeName;
  v44 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
  v6 = objc_alloc((Class)NSAttributedString);
  v7 = objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign title](self, "title"));
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = &stru_1011EB268;
  v10 = objc_msgSend(v6, "initWithString:attributes:", v9, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign titleLabel](self, "titleLabel"));
  objc_msgSend(v11, "setAttributedText:", v10);

  v12 = 40;
  if (self->_numberOfStops)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Number of stops [Route Genius]"), CFSTR("localized string not found"), 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, self->_numberOfStops));

  }
  else
  {
    v15 = 0;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign latestETA](self, "latestETA"));

  if (v16)
  {
    v42 = v3;
    v17 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("00:00 ETA [CarPlay]"), CFSTR("localized string not found"), 0));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign latestETA](self, "latestETA"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "etaDateStringWithAMPMSymbol:allowTimeZone:", 0, 0));

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v12));
    objc_msgSend(v17, "addObject:", v21);
    if (v15)
    {
      v22 = v5;
      v23 = v15;
      objc_msgSend(v17, "addObject:", v15);
    }
    else
    {
      v23 = 0;
      v22 = v5;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign latestETA](self, "latestETA"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringWithMinutes:andAbbreviationType:](NSString, "_navigation_stringWithMinutes:andAbbreviationType:", objc_msgSend(v25, "remainingMinutes"), 1));

      objc_msgSend(v17, "addObject:", v26);
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR(" · [List view details separator]"), CFSTR("localized string not found"), 0));

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "componentsJoinedByString:", v28));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v30, "setText:", v29);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v31, "setNumberOfLines:", 1);

    v5 = v22;
    v15 = v23;
    v3 = v42;
  }
  else if (v15)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v24, "setNumberOfLines:", 0);

    v17 = (id)objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v17, "setText:", v15);
  }
  else
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign subtitleOverride](self, "subtitleOverride"));

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign subtitleLabel](self, "subtitleLabel"));
    v39 = v38;
    if (v37)
    {
      objc_msgSend(v38, "setNumberOfLines:", 0);

      v17 = (id)objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign subtitleOverride](self, "subtitleOverride"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign subtitleLabel](self, "subtitleLabel"));
      objc_msgSend(v40, "setText:", v17);
    }
    else
    {
      objc_msgSend(v38, "setNumberOfLines:", 1);

      v17 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Car_PROACTIVE_Calculating ETA"), CFSTR("localized string not found"), 0));
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign subtitleLabel](self, "subtitleLabel"));
      objc_msgSend(v41, "setText:", v40);

    }
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign latestETA](self, "latestETA"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "arrivalBatteryCharge"));
  -[CarETAOnlyGuidanceSign setShowsEvLabel:](self, "setShowsEvLabel:", v33 != 0);

  v34 = -[CarETAOnlyGuidanceSign showsEvLabel](self, "showsEvLabel");
  if (v34)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign latestETA](self, "latestETA"));
    v12 = objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCaption1, UIFontWeightRegular));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "extendedArrivalBatteryChargeStringWithFont:", v12));
  }
  else
  {
    v35 = 0;
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign evArrivalInfoLabel](self, "evArrivalInfoLabel"));
  objc_msgSend(v36, "setAttributedText:", v35);

  if (v34)
  {

  }
}

- (void)setShowsEvLabel:(BOOL)a3
{
  if (self->_showsEvLabel != a3)
  {
    self->_showsEvLabel = a3;
    -[CarETAOnlyGuidanceSign _refreshBottomConstraint](self, "_refreshBottomConstraint");
  }
}

- (void)setTitle:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", self->_title) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_title, a3);
    -[CarETAOnlyGuidanceSign _updateContents](self, "_updateContents");
  }

}

- (void)setNumberOfStops:(unint64_t)a3
{
  if (self->_numberOfStops != a3)
  {
    self->_numberOfStops = a3;
    -[CarETAOnlyGuidanceSign _updateContents](self, "_updateContents");
  }
}

- (void)setSubtitleOverride:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", self->_subtitleOverride) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_subtitleOverride, a3);
    -[CarETAOnlyGuidanceSign _updateContents](self, "_updateContents");
  }

}

- (void)setLatestETA:(id)a3
{
  GuidanceETA *v5;
  GuidanceETA *v6;

  v5 = (GuidanceETA *)a3;
  if (self->_latestETA != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_latestETA, a3);
    -[CarETAOnlyGuidanceSign _updateContents](self, "_updateContents");
    v5 = v6;
  }

}

- (void)_refreshBottomConstraint
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *v10;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *bottomConstraint;

  if (self->_bottomConstraint)
  {
    bottomConstraint = self->_bottomConstraint;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &bottomConstraint, 1));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v3);

  }
  v4 = 3;
  if (!self->_showsEvLabel)
    v4 = 2;
  v5 = *(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CarETAOnlyGuidanceSign__showsEvLabel[v4]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastBaselineAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign bottomAnchor](self, "bottomAnchor"));
  LODWORD(v8) = 1148829696;
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:priority:", v7, 0.0, v8));
  v10 = self->_bottomConstraint;
  self->_bottomConstraint = v9;

  v12 = self->_bottomConstraint;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v11);
}

- (id)viewForLastBaselineLayout
{
  void *v3;

  if (-[CarETAOnlyGuidanceSign showsEvLabel](self, "showsEvLabel"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign evArrivalInfoLabel](self, "evArrivalInfoLabel"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAOnlyGuidanceSign subtitleLabel](self, "subtitleLabel"));
  return v3;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitleOverride
{
  return self->_subtitleOverride;
}

- (unint64_t)numberOfStops
{
  return self->_numberOfStops;
}

- (GuidanceETA)latestETA
{
  return self->_latestETA;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UILabel)evArrivalInfoLabel
{
  return self->_evArrivalInfoLabel;
}

- (void)setEvArrivalInfoLabel:(id)a3
{
  objc_storeStrong((id *)&self->_evArrivalInfoLabel, a3);
}

- (BOOL)showsEvLabel
{
  return self->_showsEvLabel;
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evArrivalInfoLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_latestETA, 0);
  objc_storeStrong((id *)&self->_subtitleOverride, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
}

@end
