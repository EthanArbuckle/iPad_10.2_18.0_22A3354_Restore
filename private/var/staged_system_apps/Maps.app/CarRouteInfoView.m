@implementation CarRouteInfoView

- (CarRouteInfoView)initWithFrame:(CGRect)a3
{
  CarRouteInfoView *v3;
  CarRouteInfoView *v4;
  double v5;
  double v6;
  CarTwoPartLabel *v7;
  double v8;
  double v9;
  CarTwoPartLabel *v10;
  CarTwoPartLabel *etaLabel;
  CarTwoPartLabel *v12;
  double v13;
  double v14;
  CarTwoPartLabel *v15;
  CarTwoPartLabel *batteryLabel;
  CarTwoPartLabel *v17;
  double v18;
  double v19;
  CarTwoPartLabel *v20;
  CarTwoPartLabel *distanceLabel;
  CarTwoPartLabel *v22;
  double v23;
  double v24;
  CarTwoPartLabel *v25;
  CarTwoPartLabel *timeLabel;
  void *v27;
  uint64_t v28;
  NSArray *evLabels;
  uint64_t v30;
  NSArray *normalLabels;
  NSArray *arrangedSubviewsWidthConstraints;
  objc_super v34;
  _QWORD v35[3];
  _QWORD v36[2];

  v34.receiver = self;
  v34.super_class = (Class)CarRouteInfoView;
  v3 = -[CarRouteInfoView initWithFrame:](&v34, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CarRouteInfoView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("CarRouteInfoView"));
    LODWORD(v5) = 1144750080;
    -[CarRouteInfoView setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 0, v5);
    LODWORD(v6) = 1132068864;
    -[CarRouteInfoView setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 0, v6);
    v7 = [CarTwoPartLabel alloc];
    LODWORD(v8) = 1144700928;
    LODWORD(v9) = 1144651776;
    v10 = -[CarTwoPartLabel initWithTopLabelHorizontalCompressionResistancePriority:bottomLabelHorizontalCompressionResistancePriority:](v7, "initWithTopLabelHorizontalCompressionResistancePriority:bottomLabelHorizontalCompressionResistancePriority:", v8, v9);
    etaLabel = v4->_etaLabel;
    v4->_etaLabel = v10;

    -[CarTwoPartLabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_etaLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarTwoPartLabel setAccessibilityIdentifier:](v4->_etaLabel, "setAccessibilityIdentifier:", CFSTR("EtaLabel"));
    v12 = [CarTwoPartLabel alloc];
    LODWORD(v13) = 1144733696;
    LODWORD(v14) = 1144651776;
    v15 = -[CarTwoPartLabel initWithTopLabelHorizontalCompressionResistancePriority:bottomLabelHorizontalCompressionResistancePriority:](v12, "initWithTopLabelHorizontalCompressionResistancePriority:bottomLabelHorizontalCompressionResistancePriority:", v13, v14);
    batteryLabel = v4->_batteryLabel;
    v4->_batteryLabel = v15;

    -[CarTwoPartLabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_batteryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarTwoPartLabel setAccessibilityIdentifier:](v4->_batteryLabel, "setAccessibilityIdentifier:", CFSTR("BatteryLabel"));
    v17 = [CarTwoPartLabel alloc];
    LODWORD(v18) = 1144684544;
    LODWORD(v19) = 1144733696;
    v20 = -[CarTwoPartLabel initWithTopLabelHorizontalCompressionResistancePriority:bottomLabelHorizontalCompressionResistancePriority:](v17, "initWithTopLabelHorizontalCompressionResistancePriority:bottomLabelHorizontalCompressionResistancePriority:", v19, v18);
    distanceLabel = v4->_distanceLabel;
    v4->_distanceLabel = v20;

    -[CarTwoPartLabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_distanceLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarTwoPartLabel setAccessibilityIdentifier:](v4->_distanceLabel, "setAccessibilityIdentifier:", CFSTR("DistanceLabel"));
    v22 = [CarTwoPartLabel alloc];
    LODWORD(v23) = 1144717312;
    LODWORD(v24) = 1144668160;
    v25 = -[CarTwoPartLabel initWithTopLabelHorizontalCompressionResistancePriority:bottomLabelHorizontalCompressionResistancePriority:](v22, "initWithTopLabelHorizontalCompressionResistancePriority:bottomLabelHorizontalCompressionResistancePriority:", v23, v24);
    timeLabel = v4->_timeLabel;
    v4->_timeLabel = v25;

    -[CarTwoPartLabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_timeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarTwoPartLabel setAccessibilityIdentifier:](v4->_timeLabel, "setAccessibilityIdentifier:", CFSTR("TimeLabel"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[GuidanceETA defaultBatteryOnArrivalString](GuidanceETA, "defaultBatteryOnArrivalString"));
    -[CarTwoPartLabel setSecondaryText:](v4->_batteryLabel, "setSecondaryText:", v27);

    v36[0] = v4->_etaLabel;
    v36[1] = v4->_batteryLabel;
    v28 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 2));
    evLabels = v4->_evLabels;
    v4->_evLabels = (NSArray *)v28;

    v35[0] = v4->_etaLabel;
    v35[1] = v4->_timeLabel;
    v35[2] = v4->_distanceLabel;
    v30 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 3));
    normalLabels = v4->_normalLabels;
    v4->_normalLabels = (NSArray *)v30;

    arrangedSubviewsWidthConstraints = v4->_arrangedSubviewsWidthConstraints;
    v4->_arrangedSubviewsWidthConstraints = (NSArray *)&__NSArray0__struct;

    -[CarRouteInfoView _updateLabels](v4, "_updateLabels");
  }
  return v4;
}

- (void)_updateLabels
{
  GuidanceETA *latestETA;
  double v4;
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
  GuidanceETA *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  unsigned int v28;
  double v29;
  id v30;

  latestETA = self->_latestETA;
  if (!latestETA)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[GuidanceETA invalidValueString](GuidanceETA, "invalidValueString"));
    -[CarTwoPartLabel setPrimaryText:](self->_distanceLabel, "setPrimaryText:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[GuidanceETA defaultDistanceUnit](GuidanceETA, "defaultDistanceUnit"));
    -[CarTwoPartLabel setSecondaryText:](self->_distanceLabel, "setSecondaryText:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[GuidanceETA defaultDistanceUnitAccessibility](GuidanceETA, "defaultDistanceUnitAccessibility"));
    -[CarTwoPartLabel setSecondaryAccessibilityText:](self->_distanceLabel, "setSecondaryAccessibilityText:", v7);

    -[CarTwoPartLabel setPrimaryText:](self->_timeLabel, "setPrimaryText:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[GuidanceETA defaultTimeUnit](GuidanceETA, "defaultTimeUnit"));
    -[CarTwoPartLabel setSecondaryText:](self->_timeLabel, "setSecondaryText:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[GuidanceETA defaultTimeUnitAccessibility](GuidanceETA, "defaultTimeUnitAccessibility"));
    -[CarTwoPartLabel setSecondaryAccessibilityText:](self->_timeLabel, "setSecondaryAccessibilityText:", v9);

    -[CarTwoPartLabel setPrimaryText:](self->_etaLabel, "setPrimaryText:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[GuidanceETA defaultArrivalString](GuidanceETA, "defaultArrivalString"));
    -[CarTwoPartLabel setSecondaryText:](self->_etaLabel, "setSecondaryText:", v10);

    -[CarTwoPartLabel setPrimaryText:](self->_batteryLabel, "setPrimaryText:", v5);
LABEL_8:

    goto LABEL_9;
  }
  -[GuidanceETA remainingDistance](latestETA, "remainingDistance");
  if (v4 >= 0.0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA distanceValue](self->_latestETA, "distanceValue"));
    -[CarTwoPartLabel setPrimaryText:](self->_distanceLabel, "setPrimaryText:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA distanceUnit](self->_latestETA, "distanceUnit"));
    -[CarTwoPartLabel setSecondaryText:](self->_distanceLabel, "setSecondaryText:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA distanceUnitAccessibility](self->_latestETA, "distanceUnitAccessibility"));
    -[CarTwoPartLabel setSecondaryAccessibilityText:](self->_distanceLabel, "setSecondaryAccessibilityText:", v13);

  }
  else
  {
    -[CarTwoPartLabel setPrimaryText:](self->_distanceLabel, "setPrimaryText:", 0);
    -[CarTwoPartLabel setSecondaryText:](self->_distanceLabel, "setSecondaryText:", 0);
    -[CarTwoPartLabel setSecondaryAccessibilityText:](self->_distanceLabel, "setSecondaryAccessibilityText:", 0);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA timeValue](self->_latestETA, "timeValue"));
  -[CarTwoPartLabel setPrimaryText:](self->_timeLabel, "setPrimaryText:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA timeUnit](self->_latestETA, "timeUnit"));
  -[CarTwoPartLabel setSecondaryText:](self->_timeLabel, "setSecondaryText:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA timeUnitAccessibility](self->_latestETA, "timeUnitAccessibility"));
  -[CarTwoPartLabel setSecondaryAccessibilityText:](self->_timeLabel, "setSecondaryAccessibilityText:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA etaDateStringWithAMPMSymbol:allowTimeZone:](self->_latestETA, "etaDateStringWithAMPMSymbol:allowTimeZone:", 0, 0));
  -[CarTwoPartLabel setPrimaryText:](self->_etaLabel, "setPrimaryText:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA arrivalTimeBottomString](self->_latestETA, "arrivalTimeBottomString"));
  -[CarTwoPartLabel setSecondaryText:](self->_etaLabel, "setSecondaryText:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA arrivalBatteryCharge](self->_latestETA, "arrivalBatteryCharge"));
  if (v19)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleFootnote, UIFontWeightBold));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA batteryChargeStringWithFont:](self->_latestETA, "batteryChargeStringWithFont:", v5));
    -[CarTwoPartLabel setPrimaryAttributedText:](self->_batteryLabel, "setPrimaryAttributedText:", v20);

    goto LABEL_8;
  }
LABEL_9:
  v21 = self->_latestETA;
  if (v21)
  {
    v22 = 0;
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteInfoView arrangedSubviews](self, "arrangedSubviews"));
    v22 = objc_msgSend(v23, "count") == (id)2;

    v21 = self->_latestETA;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA arrivalBatteryCharge](v21, "arrivalBatteryCharge"));
  if (v24)
    v25 = 1;
  else
    v25 = v22;

  v26 = 5;
  if (v25)
    v26 = 4;
  v30 = *(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CarRouteInfoView__etaLabel[v26]);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteInfoView arrangedSubviews](self, "arrangedSubviews"));
  v28 = objc_msgSend(v27, "isEqualToArray:", v30);

  if (v28)
  {
    -[CarRouteInfoView _updateWidthAndSpaceConstraints](self, "_updateWidthAndSpaceConstraints");
  }
  else
  {
    v29 = 8.0;
    if (v25)
      v29 = 12.0;
    -[CarRouteInfoView setSpacing:](self, "setSpacing:", v29);
    -[CarRouteInfoView setArrangedSubviews:](self, "setArrangedSubviews:", v30);
    -[CarRouteInfoView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[CarRouteInfoView setNeedsLayout](self, "setNeedsLayout");
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
    -[CarRouteInfoView _updateLabels](self, "_updateLabels");
    v5 = v6;
  }

}

- (id)viewForFirstBaselineLayout
{
  return -[CarTwoPartLabel viewForFirstBaselineLayout](self->_etaLabel, "viewForFirstBaselineLayout");
}

- (id)viewForLastBaselineLayout
{
  return -[CarTwoPartLabel viewForLastBaselineLayout](self->_etaLabel, "viewForLastBaselineLayout");
}

- (void)setArrangedSubviews:(id)a3
{
  NSArray **p_arrangedSubviews;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  NSMutableArray *v11;
  NSMutableArray *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSArray *spacerConstraints;
  NSMutableArray *v31;
  NSArray *arrangedSubviewsWidthConstraints;
  NSMutableArray *v33;
  id v34;
  NSMutableArray *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  v34 = a3;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  p_arrangedSubviews = &self->_arrangedSubviews;
  v6 = self->_arrangedSubviews;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i), "removeFromSuperview");
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v8);
  }

  objc_storeStrong((id *)&self->_arrangedSubviews, a3);
  v11 = objc_opt_new(NSMutableArray);
  v35 = objc_opt_new(NSMutableArray);
  v12 = objc_opt_new(NSMutableArray);
  if (-[NSArray count](*p_arrangedSubviews, "count"))
  {
    v13 = 0;
    do
    {
      if (v13)
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](*p_arrangedSubviews, "objectAtIndexedSubscript:", v13 - 1));
      else
        v14 = 0;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](*p_arrangedSubviews, "objectAtIndexedSubscript:", v13));
      -[CarRouteInfoView addSubview:](self, "addSubview:", v15);
      v16 = objc_opt_class(CarTwoPartLabel);
      if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0)
        +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("There isn't support for other views"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "heightAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteInfoView heightAnchor](self, "heightAnchor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
      -[NSMutableArray addObject:](v11, "addObject:", v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "centerYAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteInfoView centerYAnchor](self, "centerYAnchor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
      -[NSMutableArray addObject:](v11, "addObject:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
      if (v13)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
        -[CarRouteInfoView spacing](self, "spacing");
        v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24));

        -[NSMutableArray addObject:](v11, "addObject:", v25);
        -[NSMutableArray addObject:](v35, "addObject:", v25);
        v23 = (void *)v25;
      }
      else
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteInfoView leadingAnchor](self, "leadingAnchor"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v26));
        -[NSMutableArray addObject:](v11, "addObject:", v27);

      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "widthAnchor"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToConstant:", 0.0));

      -[NSMutableArray addObject:](v11, "addObject:", v29);
      -[NSMutableArray addObject:](v12, "addObject:", v29);

      ++v13;
    }
    while (v13 < -[NSArray count](*p_arrangedSubviews, "count"));
  }
  spacerConstraints = self->_spacerConstraints;
  self->_spacerConstraints = &v35->super;
  v31 = v35;

  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_arrangedSubviewsWidthConstraints);
  arrangedSubviewsWidthConstraints = self->_arrangedSubviewsWidthConstraints;
  self->_arrangedSubviewsWidthConstraints = &v12->super;
  v33 = v12;

  -[CarRouteInfoView _updateWidthAndSpaceConstraints](self, "_updateWidthAndSpaceConstraints");
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v11);

}

- (void)_updateWidthAndSpaceConstraints
{
  void *v3;
  double Width;
  double v5;
  double v6;
  double v7;
  NSNumber *v8;
  NSNumber *v9;
  NSNumber *renderedInWidth;
  double v11;
  double v12;
  NSMutableArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  double v18;
  id v19;
  NSObject *v20;
  _BOOL4 v21;
  unint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  NSObject *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  NSMutableArray *v38;
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;
  _BYTE v43[128];
  CGRect v44;
  CGRect v45;

  v3 = -[NSArray count](self->_arrangedSubviews, "count");
  if (v3 == (void *)-[NSArray count](self->_arrangedSubviewsWidthConstraints, "count")
    && -[NSArray count](self->_arrangedSubviews, "count"))
  {
    -[CarRouteInfoView frame](self, "frame");
    Width = CGRectGetWidth(v44);
    v5 = (double)(-[NSArray count](self->_arrangedSubviews, "count") - 1);
    -[CarRouteInfoView spacing](self, "spacing");
    v7 = Width - v5 * v6;
    if (v7 <= 0.0)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v13 = self->_arrangedSubviewsWidthConstraints;
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v34 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i), "setConstant:", 0.0);
          }
          v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
        }
        while (v15);
      }
LABEL_24:

      return;
    }
    -[CarRouteInfoView frame](self, "frame");
    v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CGRectGetWidth(v45));
    v9 = (NSNumber *)objc_claimAutoreleasedReturnValue(v8);
    renderedInWidth = self->_renderedInWidth;
    self->_renderedInWidth = v9;

    if (self->_arrangedSubviews == self->_evLabels)
    {
      -[CarRouteInfoView _updateWidthConstraintsForEVWithAvailableWidth:](self, "_updateWidthConstraintsForEVWithAvailableWidth:", v7);
      v12 = v18;
    }
    else
    {
      -[CarRouteInfoView _updateWidthConstraintsByCompressionResistanceWithAvailableWidth:](self, "_updateWidthConstraintsByCompressionResistanceWithAvailableWidth:", v7);
      v12 = v11;
      if (v11 < v7)
      {
        -[CarRouteInfoView _updateSpacerConstraintsToAbsorbWidth:](self, "_updateSpacerConstraintsToAbsorbWidth:", v7 - v11);
LABEL_17:
        v19 = sub_10064CF8C();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);

        if (!v21)
          return;
        v13 = objc_opt_new(NSMutableArray);
        if (-[NSArray count](self->_arrangedSubviewsWidthConstraints, "count"))
        {
          v22 = 0;
          do
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_arrangedSubviews, "objectAtIndexedSubscript:", v22));
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_arrangedSubviewsWidthConstraints, "objectAtIndexedSubscript:", v22));
            objc_msgSend(v23, "topLabelIntrinsicWidth");
            v26 = v25;
            objc_msgSend(v23, "bottomLabelIntrinsicWidth");
            v28 = v27;
            objc_msgSend(v24, "constant");
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CarTwoPartLabel %p; intrinsicWidths: top %f, bottom %f; assignedWidth: %f>"),
                              v23,
                              v26,
                              v28,
                              v29));
            -[NSMutableArray addObject:](v13, "addObject:", v30);

            ++v22;
          }
          while (v22 < -[NSArray count](self->_arrangedSubviewsWidthConstraints, "count"));
        }
        v31 = sub_10064CF8C();
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543874;
          v38 = v13;
          v39 = 2048;
          v40 = v7;
          v41 = 2048;
          v42 = v12;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Drawing labels %{public}@ in availableWidth: %f, contentWidth: %f", buf, 0x20u);
        }

        goto LABEL_24;
      }
    }
    -[CarRouteInfoView _resetSpacerConstraints](self, "_resetSpacerConstraints");
    goto LABEL_17;
  }
}

- (double)_updateWidthConstraintsForEVWithAvailableWidth:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  NSArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  double v14;
  double v15;
  double v16;
  double v17;
  NSUInteger v18;
  unint64_t v19;
  void *v20;
  void *v21;
  double v22;
  unint64_t v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  -[CarTwoPartLabel topLabelIntrinsicWidth](self->_etaLabel, "topLabelIntrinsicWidth");
  v6 = v5;
  -[CarTwoPartLabel topLabelIntrinsicWidth](self->_batteryLabel, "topLabelIntrinsicWidth");
  v8 = v6 + v7;
  if (v6 + v7 <= a3)
  {
    -[CarTwoPartLabel intrinsicContentSize](self->_etaLabel, "intrinsicContentSize");
    v15 = v14;
    -[CarTwoPartLabel intrinsicContentSize](self->_batteryLabel, "intrinsicContentSize");
    v17 = v15 + v16;
    v18 = -[NSArray count](self->_arrangedSubviewsWidthConstraints, "count");
    if (v17 <= a3)
    {
      if (v18)
      {
        v23 = 0;
        do
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_arrangedSubviews, "objectAtIndexedSubscript:", v23));
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_arrangedSubviewsWidthConstraints, "objectAtIndexedSubscript:", v23));
          objc_msgSend(v24, "intrinsicContentSize");
          objc_msgSend(v25, "setConstant:");

          ++v23;
        }
        while (v23 < -[NSArray count](self->_arrangedSubviewsWidthConstraints, "count"));
      }
      return v17;
    }
    else if (v18)
    {
      v19 = 0;
      do
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_arrangedSubviews, "objectAtIndexedSubscript:", v19));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_arrangedSubviewsWidthConstraints, "objectAtIndexedSubscript:", v19));
        objc_msgSend(v20, "topLabelIntrinsicWidth");
        objc_msgSend(v21, "setConstant:", (a3 - v8) * 0.5 + v22);

        ++v19;
      }
      while (v19 < -[NSArray count](self->_arrangedSubviewsWidthConstraints, "count"));
    }
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = self->_arrangedSubviewsWidthConstraints;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i), "setConstant:", a3 * 0.5, (_QWORD)v27);
        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v11);
    }

  }
  return a3;
}

- (double)_updateWidthConstraintsByCompressionResistanceWithAvailableWidth:(double)a3
{
  _UNKNOWN **v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableOrderedSet *v12;
  NSMutableOrderedSet *v13;
  _UNKNOWN **v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableOrderedSet *v19;
  NSMutableOrderedSet *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  double v25;
  char *v26;
  void *v27;
  float v28;
  float v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *j;
  void *v35;
  unint64_t v36;
  void *v37;
  float v38;
  float v39;
  float v40;
  float v41;
  double v43;
  double v44;
  float v45;
  double v46;
  double v47;
  float v48;
  double v49;
  BOOL v50;
  double v51;
  BOOL v52;
  BOOL v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  id v63;
  uint64_t v64;
  char *v65;
  NSArray *obj;
  char *obja;
  NSMutableDictionary *v68;
  id v69;
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];

  v68 = objc_opt_new(NSMutableDictionary);
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = self->_arrangedSubviews;
  v71 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
  if (v71)
  {
    v69 = *(id *)v81;
    v5 = MKPlaceCollectionsLogicController_ptr;
    do
    {
      for (i = 0; i != v71; i = (char *)i + 1)
      {
        if (*(id *)v81 != v69)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)i);
        v8 = v5[370];
        objc_msgSend(v7, "topLabelPriority");
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "numberWithFloat:"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v68, "objectForKeyedSubscript:", v9));
        v11 = v10;
        if (v10)
          v12 = v10;
        else
          v12 = objc_opt_new(NSMutableOrderedSet);
        v13 = v12;

        -[NSMutableOrderedSet addObject:](v13, "addObject:", v7);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v68, "setObject:forKeyedSubscript:", v13, v9);
        v14 = v5;
        v15 = v5[370];
        objc_msgSend(v7, "bottomLabelPriority");
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "numberWithFloat:"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v68, "objectForKeyedSubscript:", v16));
        v18 = v17;
        if (v17)
          v19 = v17;
        else
          v19 = objc_opt_new(NSMutableOrderedSet);
        v20 = v19;

        -[NSMutableOrderedSet addObject:](v20, "addObject:", v7);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v68, "setObject:forKeyedSubscript:", v20, v16);

        v5 = v14;
      }
      v71 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
    }
    while (v71);
  }

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v68, "allKeys"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "sortedArrayUsingSelector:", "compare:"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "reverseObjectEnumerator"));

  v63 = v23;
  v65 = (char *)objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v76, v85, 16);
  if (v65)
  {
    v24 = 0;
    v64 = *(_QWORD *)v77;
    v25 = 0.0;
    while (1)
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v77 != v64)
          objc_enumerationMutation(v63);
        obja = v26;
        v27 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)v26);
        objc_msgSend(v27, "floatValue");
        v29 = v28;
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v68, "objectForKeyedSubscript:", v27));
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v70 = v30;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v73;
          do
          {
            for (j = 0; j != v32; j = (char *)j + 1)
            {
              if (*(_QWORD *)v73 != v33)
                objc_enumerationMutation(v70);
              v35 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)j);
              v36 = -[NSArray indexOfObject:](self->_arrangedSubviews, "indexOfObject:", v35);
              if (v36 == 0x7FFFFFFFFFFFFFFFLL
                || v36 >= -[NSArray count](self->_arrangedSubviewsWidthConstraints, "count"))
              {
                +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("arrangedSubview (%@) not found in arrangedSubviews (%@) and/or widthConstraints (%@)"), v35, self->_arrangedSubviews, self->_arrangedSubviewsWidthConstraints);
              }
              v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_arrangedSubviewsWidthConstraints, "objectAtIndexedSubscript:", v36));
              objc_msgSend(v35, "topLabelPriority");
              v39 = vabds_f32(v38, v29);
              objc_msgSend(v35, "bottomLabelPriority");
              v41 = vabds_f32(v40, v29);
              if (v39 < 2.2204e-16 && v41 < 2.2204e-16)
              {
                objc_msgSend(v35, "intrinsicContentSize");
                if ((v24 & 1) != 0)
                {
                  v24 = 1;
                  v44 = 0.0;
LABEL_65:
                  objc_msgSend(v37, "setConstant:", v44);
                  goto LABEL_66;
                }
                v44 = v46;
                v49 = v25 + v46;
                if (v49 < a3)
                {
                  v24 = 0;
                  v25 = v49;
                  goto LABEL_65;
                }
                v44 = a3 - v25 + 0.0;
LABEL_64:
                v24 = 1;
                v25 = a3;
                goto LABEL_65;
              }
              if (v39 >= 2.2204e-16)
              {
                objc_msgSend(v35, "bottomLabelIntrinsicWidth");
                v44 = v47;
                objc_msgSend(v35, "topLabelPriority");
              }
              else
              {
                objc_msgSend(v35, "topLabelIntrinsicWidth");
                v44 = v43;
                objc_msgSend(v35, "bottomLabelPriority");
              }
              v48 = v45;
              if ((v24 & 1) == 0)
              {
                v50 = v45 <= v29 || v39 >= 2.2204e-16;
                if (!v50
                  || ((v51 = 0.0, v39 >= 2.2204e-16) ? (v52 = v41 < 2.2204e-16) : (v52 = 0),
                      v52 ? (v53 = v48 <= v29) : (v53 = 1),
                      !v53))
                {
                  objc_msgSend(v35, "topLabelIntrinsicWidth");
                  v55 = v54;
                  objc_msgSend(v35, "bottomLabelIntrinsicWidth");
                  if (v55 >= v56)
                    objc_msgSend(v35, "bottomLabelIntrinsicWidth");
                  else
                    objc_msgSend(v35, "topLabelIntrinsicWidth");
                }
                v57 = v25 + v44 - v51;
                if (v57 < a3)
                {
                  if (v48 > v29)
                  {
                    objc_msgSend(v37, "constant");
                    if (v58 > v44)
                    {
                      objc_msgSend(v37, "constant");
                      v44 = v59;
                    }
                  }
                  v24 = 0;
                  v25 = v57;
                  goto LABEL_65;
                }
                v44 = a3 - v25 + v51;
                if (v48 > v29)
                {
                  objc_msgSend(v37, "constant");
                  if (v60 > v44)
                  {
                    objc_msgSend(v37, "constant");
                    v44 = v61;
                  }
                }
                goto LABEL_64;
              }
              v24 = 1;
              v44 = 0.0;
              if (v45 <= v29)
                goto LABEL_65;
LABEL_66:

            }
            v32 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
          }
          while (v32);
        }

        v26 = obja + 1;
      }
      while (obja + 1 != v65);
      v65 = (char *)objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v76, v85, 16);
      if (!v65)
        goto LABEL_72;
    }
  }
  v25 = 0.0;
LABEL_72:

  return v25;
}

- (void)_updateSpacerConstraintsToAbsorbWidth:(double)a3
{
  NSUInteger v5;
  double v6;
  double v7;
  unint64_t v8;
  NSArray *v9;
  id v10;
  id v11;
  double v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v5 = -[NSArray count](self->_spacerConstraints, "count");
  if (v5 > 1)
  {
    v8 = v5;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = self->_spacerConstraints;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = (double)((unint64_t)a3 / v8);
      v13 = vcvtpd_u64_f64(a3 - (double)v8 * v12);
      v14 = *(_QWORD *)v25;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v9);
          v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v15);
          -[CarRouteInfoView spacing](self, "spacing");
          v18 = v17 + v12;
          if (v13)
            v19 = 1.0;
          else
            v19 = 0.0;
          objc_msgSend(v16, "setConstant:", v19 + v18);
          if (v13)
          {
            --v13;
            -[CarRouteInfoView spacing](self, "spacing");
            v21 = v20 + v12 + 1.0;
          }
          else
          {
            -[CarRouteInfoView spacing](self, "spacing");
            v21 = v22 + v12;
          }
          objc_msgSend(v16, "setConstant:", v21);
          v15 = (char *)v15 + 1;
        }
        while (v11 != v15);
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v11);
    }

  }
  else
  {
    -[CarRouteInfoView spacing](self, "spacing");
    v7 = v6 + a3;
    v23 = (id)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_spacerConstraints, "firstObject"));
    objc_msgSend(v23, "setConstant:", v7);

  }
}

- (void)_resetSpacerConstraints
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_spacerConstraints;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7);
        -[CarRouteInfoView spacing](self, "spacing", (_QWORD)v9);
        objc_msgSend(v8, "setConstant:");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double Width;
  double v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[4];
  double v12;
  __int16 v13;
  double v14;
  CGRect v15;

  v10.receiver = self;
  v10.super_class = (Class)CarRouteInfoView;
  -[CarRouteInfoView layoutSubviews](&v10, "layoutSubviews");
  -[NSNumber cgFloatValue](self->_renderedInWidth, "cgFloatValue");
  v4 = v3;
  -[CarRouteInfoView frame](self, "frame");
  Width = CGRectGetWidth(v15);
  v6 = vabdd_f64(Width, v4);
  if (self->_renderedInWidth)
    v7 = v6 < 1.0;
  else
    v7 = 0;
  if (!v7)
  {
    v8 = sub_10064CF8C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v12 = v4;
      v13 = 2048;
      v14 = Width;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Re-drawing due to frame width changing from %f to %f", buf, 0x16u);
    }

    -[CarRouteInfoView _updateWidthAndSpaceConstraints](self, "_updateWidthAndSpaceConstraints");
  }
}

- (GuidanceETA)latestETA
{
  return self->_latestETA;
}

- (NSArray)arrangedSubviews
{
  return self->_arrangedSubviews;
}

- (double)spacing
{
  return self->_spacing;
}

- (void)setSpacing:(double)a3
{
  self->_spacing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrangedSubviews, 0);
  objc_storeStrong((id *)&self->_latestETA, 0);
  objc_storeStrong((id *)&self->_renderedInWidth, 0);
  objc_storeStrong((id *)&self->_arrangedSubviewsWidthConstraints, 0);
  objc_storeStrong((id *)&self->_spacerConstraints, 0);
  objc_storeStrong((id *)&self->_normalLabels, 0);
  objc_storeStrong((id *)&self->_evLabels, 0);
  objc_storeStrong((id *)&self->_batteryLabel, 0);
  objc_storeStrong((id *)&self->_distanceLabel, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_etaLabel, 0);
}

@end
