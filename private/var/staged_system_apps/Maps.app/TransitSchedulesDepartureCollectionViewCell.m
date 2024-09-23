@implementation TransitSchedulesDepartureCollectionViewCell

- (TransitSchedulesDepartureCollectionViewCell)init
{
  TransitSchedulesDepartureCollectionViewCell *v2;
  TransitSchedulesDepartureCollectionViewCell *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TransitSchedulesDepartureCollectionViewCell;
  v2 = -[TransitSchedulesDepartureCollectionViewCell init](&v5, "init");
  v3 = v2;
  if (v2)
    -[TransitSchedulesDepartureCollectionViewCell configureViews](v2, "configureViews");
  return v3;
}

- (TransitSchedulesDepartureCollectionViewCell)initWithFrame:(CGRect)a3
{
  TransitSchedulesDepartureCollectionViewCell *v3;
  TransitSchedulesDepartureCollectionViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TransitSchedulesDepartureCollectionViewCell;
  v3 = -[TransitSchedulesDepartureCollectionViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[TransitSchedulesDepartureCollectionViewCell configureViews](v3, "configureViews");
  return v4;
}

- (void)configureViews
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  unint64_t v17;
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
  id v40;
  id v41;
  _QWORD v42[7];

  v41 = objc_alloc_init((Class)MKVibrantView);
  -[TransitSchedulesDepartureCollectionViewCell setBackgroundView:](self, "setBackgroundView:", v41);
  objc_msgSend(v41, "_setCornerRadius:", 10.0);
  -[TransitSchedulesDepartureCollectionViewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("TransitSchedulesDepartureCollectionViewCell"));
  v40 = objc_alloc_init((Class)UIView);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemBackgroundColor](UIColor, "tertiarySystemBackgroundColor"));
  objc_msgSend(v40, "setBackgroundColor:", v3);

  -[TransitSchedulesDepartureCollectionViewCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", v40);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "layer"));
  objc_msgSend(v4, "setCornerRadius:", 10.0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell contentView](self, "contentView"));
  v6 = objc_alloc_init((Class)UILabel);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "setTextAlignment:", 1);
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("TransitSchedulesDepartureCollectionViewCellTimeLabel"));
  objc_msgSend(v5, "addSubview:", v6);
  -[TransitSchedulesDepartureCollectionViewCell setTimeLabel:](self, "setTimeLabel:", v6);
  v7 = objc_alloc_init((Class)UILabel);
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "setTextAlignment:", 1);
  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("TransitSchedulesDepartureCollectionViewCellStatusLabel"));
  objc_msgSend(v5, "addSubview:", v7);
  -[TransitSchedulesDepartureCollectionViewCell setLiveStatusLabel:](self, "setLiveStatusLabel:", v7);
  -[TransitSchedulesDepartureCollectionViewCell updateCellStyling](self, "updateCellStyling");
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstBaselineAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell _selectedTimeLabelFontProvider](self, "_selectedTimeLabelFontProvider"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v37, v36, 25.0));
  v42[0] = v35;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, 15.0));
  v42[1] = v32;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v28 = v5;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, -15.0));
  v42[2] = v29;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstBaselineAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastBaselineAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell _selectedTimeLabelFontProvider](self, "_selectedTimeLabelFontProvider"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v25, v24, 18.0));
  v42[3] = v23;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastBaselineAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell _selectedStatusLabelFontProvider](self, "_selectedStatusLabelFontProvider"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v20, v19, -11.0));
  v42[4] = v18;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, 15.0));
  v42[5] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, -15.0));
  v42[6] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 7));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

  LODWORD(v15) = 1148846080;
  objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 0, v15);
  LODWORD(v16) = 1148846080;
  objc_msgSend(v7, "setContentCompressionResistancePriority:forAxis:", 0, v16);
  -[TransitSchedulesDepartureCollectionViewCell setIsAccessibilityElement:](self, "setIsAccessibilityElement:", 1);
  v17 = (unint64_t)-[TransitSchedulesDepartureCollectionViewCell accessibilityTraits](self, "accessibilityTraits");
  -[TransitSchedulesDepartureCollectionViewCell setAccessibilityTraits:](self, "setAccessibilityTraits:", UIAccessibilityTraitButton | v17);

}

- (id)_selectedTimeLabelFontProvider
{
  return objc_retainBlock(&stru_1011E7A18);
}

- (id)_selectedStatusLabelFontProvider
{
  return objc_retainBlock(&stru_1011E7AB8);
}

- (void)setDeparture:(id)a3 withReferenceDate:(id)a4 timeZone:(id)a5 timeDisplayStyle:(unint64_t)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;

  v16 = a3;
  v11 = a4;
  v12 = a5;
  if (-[GEOTransitDeparture isEqual:](self->_departure, "isEqual:", v16))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureBaseViewCell timeZone](self, "timeZone"));
    if (objc_msgSend(v13, "isEqual:", v12)
      && -[TransitSchedulesDepartureBaseViewCell timeDisplayStyle](self, "timeDisplayStyle") == a6)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureBaseViewCell referenceDate](self, "referenceDate"));
      v15 = objc_msgSend(v14, "isEqualToDate:", v11);

      if ((v15 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
  }
  objc_storeStrong((id *)&self->_departure, a3);
  -[TransitSchedulesDepartureBaseViewCell setTimeDisplayStyle:](self, "setTimeDisplayStyle:", a6);
  -[TransitSchedulesDepartureCollectionViewCell setReferenceDate:](self, "setReferenceDate:", v11);
  -[TransitSchedulesDepartureBaseViewCell setTimeZone:](self, "setTimeZone:", v12);
  -[TransitSchedulesDepartureCollectionViewCell updateStrings](self, "updateStrings");
LABEL_8:

}

- (void)setReferenceDate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TransitSchedulesDepartureCollectionViewCell;
  -[TransitSchedulesDepartureBaseViewCell setReferenceDate:](&v4, "setReferenceDate:", a3);
  -[TransitSchedulesDepartureCollectionViewCell updateStrings](self, "updateStrings");
}

- (id)attributedTimeString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSAttributedStringKey v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell departure](self, "departure"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureBaseViewCell timeStringForDeparture:](self, "timeStringForDeparture:", v3));
  v10 = NSForegroundColorAttributeName;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell timeTextColor](self, "timeTextColor"));
  v11 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell realTimeStatusIndicatorColor](self, "realTimeStatusIndicatorColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString _mapkit_attributedLiveTransitStringFromDepartureString:departure:textAttributes:darkMode:symbolOverrideColor:](NSAttributedString, "_mapkit_attributedLiveTransitStringFromDepartureString:departure:textAttributes:darkMode:symbolOverrideColor:", v4, v3, v6, -[TransitSchedulesDepartureCollectionViewCell _mapkit_isDarkModeEnabled](self, "_mapkit_isDarkModeEnabled"), v7));

  return v8;
}

- (void)updateStrings
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
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell attributedTimeString](self, "attributedTimeString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell timeLabel](self, "timeLabel"));
  objc_msgSend(v4, "setAttributedText:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell statusString](self, "statusString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell liveStatusLabel](self, "liveStatusLabel"));
  objc_msgSend(v6, "setAttributedText:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[Transit Schedule] Departure cell accessibility label"), CFSTR("localized string not found"), 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell timeLabel](self, "timeLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accessibilityLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell liveStatusLabel](self, "liveStatusLabel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accessibilityLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v9, v11));
  -[TransitSchedulesDepartureCollectionViewCell setAccessibilityLabel:](self, "setAccessibilityLabel:", v12);

}

- (id)statusStringAttributes
{
  void *v2;
  void *v3;
  NSAttributedStringKey v5;
  void *v6;

  v5 = NSForegroundColorAttributeName;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell statusStringTextColor](self, "statusStringTextColor"));
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));

  return v3;
}

- (id)statusString
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  _QWORD v33[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell statusStringAttributes](self, "statusStringAttributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell departure](self, "departure"));
  v5 = objc_msgSend(v4, "isCanceled");

  if (v5)
  {
    v6 = objc_alloc((Class)NSAttributedString);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    v9 = CFSTR("Schedules Departure cell status - Canceled");
LABEL_5:
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, CFSTR("localized string not found"), 0));
    v15 = objc_msgSend(v6, "initWithString:attributes:", v14, v3);

    goto LABEL_13;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell departure](self, "departure"));
  v11 = objc_msgSend(v10, "liveStatus") == 0;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell departure](self, "departure"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureBaseViewCell referenceDate](self, "referenceDate"));
  LODWORD(v11) = objc_msgSend(v12, "isPastDepartureRelativeToDate:usingGracePeriod:", v13, v11);

  if ((_DWORD)v11)
  {
    v6 = objc_alloc((Class)NSAttributedString);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    v9 = CFSTR("Schedules Departure cell status - Departed");
    goto LABEL_5;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell departure](self, "departure"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "liveStatusString"));

  if (v17)
  {
    v18 = objc_alloc((Class)MKServerFormattedStringParameters);
    MKFormattedStringOptionsMakeDefault(v33);
    v19 = objc_msgSend(v18, "initWithOptions:variableOverrides:", v33, 0);
    v20 = objc_msgSend(objc_alloc((Class)MKServerFormattedString), "initWithGeoServerString:parameters:", v17, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "multiPartAttributedStringWithAttributes:", &__NSDictionary0__struct));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "attributedString"));

    if (-[TransitSchedulesDepartureCollectionViewCell isSelected](self, "isSelected"))
    {
      v15 = v22;
    }
    else
    {
      v29 = objc_alloc((Class)NSAttributedString);
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "string"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell statusStringAttributes](self, "statusStringAttributes"));
      v15 = objc_msgSend(v29, "initWithString:attributes:", v30, v31);

    }
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell departure](self, "departure"));
    v19 = (id)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureBaseViewCell emphasizedLowFrequencyDepartureDateForDeparture:](self, "emphasizedLowFrequencyDepartureDateForDeparture:", v23));

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell dateFormatter](self, "dateFormatter"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringFromDate:", v19));

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell departure](self, "departure"));
    v27 = -[TransitSchedulesDepartureBaseViewCell effectiveLiveStatusForDeparture:](self, "effectiveLiveStatusForDeparture:", v26);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_formattedDescriptionForLiveStatus:updatedDepartureTimeString:](NSString, "_navigation_formattedDescriptionForLiveStatus:updatedDepartureTimeString:", v27, v25));
    v15 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v28, v3);

  }
LABEL_13:

  return v15;
}

- (id)dateFormatter
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100689F9C;
  block[3] = &unk_1011AC860;
  block[4] = self;
  if (qword_1014D2D70 != -1)
    dispatch_once(&qword_1014D2D70, block);
  return (id)qword_1014D2D68;
}

- (void)updateCellStyling
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell attributedTimeString](self, "attributedTimeString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell timeLabel](self, "timeLabel"));
  objc_msgSend(v4, "setAttributedText:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell statusString](self, "statusString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell liveStatusLabel](self, "liveStatusLabel"));
  objc_msgSend(v6, "setAttributedText:", v5);

  -[TransitSchedulesDepartureCollectionViewCell updateTimeLabelFont](self, "updateTimeLabelFont");
  -[TransitSchedulesDepartureCollectionViewCell updateLiveStatusLabelFont](self, "updateLiveStatusLabelFont");
  -[TransitSchedulesDepartureCollectionViewCell updateShadow](self, "updateShadow");
  -[TransitSchedulesDepartureCollectionViewCell invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)updateTimeLabelFont
{
  void *v3;
  void *v4;
  Block_layout *v5;

  if ((-[TransitSchedulesDepartureCollectionViewCell isSelected](self, "isSelected") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell _selectedTimeLabelFontProvider](self, "_selectedTimeLabelFontProvider"));
    v5 = objc_retainBlock(v3);

  }
  else
  {
    v5 = objc_retainBlock(&stru_1011E7A58);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell timeLabel](self, "timeLabel"));
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v4, v5);

}

- (void)updateLiveStatusLabelFont
{
  void *v3;
  void *v4;
  Block_layout *v5;

  if ((-[TransitSchedulesDepartureCollectionViewCell isSelected](self, "isSelected") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell _selectedStatusLabelFontProvider](self, "_selectedStatusLabelFontProvider"));
    v5 = objc_retainBlock(v3);

  }
  else
  {
    v5 = objc_retainBlock(&stru_1011E7A78);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell liveStatusLabel](self, "liveStatusLabel"));
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v4, v5);

}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TransitSchedulesDepartureCollectionViewCell;
  -[TransitSchedulesDepartureCollectionViewCell setSelected:](&v4, "setSelected:", a3);
  -[TransitSchedulesDepartureCollectionViewCell updateCellStyling](self, "updateCellStyling");
}

- (void)updateShadow
{
  void *v3;
  id v4;
  id v5;
  double v6;
  float v7;
  double v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell selectedBackgroundView](self, "selectedBackgroundView"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));

  if (-[TransitSchedulesDepartureCollectionViewCell isSelected](self, "isSelected"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorWithAlphaComponent:", 0.140000001)));
    objc_msgSend(v9, "setShadowColor:", objc_msgSend(v5, "CGColor"));

    v6 = 1.0;
    v7 = 1.0;
  }
  else
  {
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
    objc_msgSend(v9, "setShadowColor:", objc_msgSend(v4, "CGColor"));
    v7 = 0.0;
    v6 = 0.0;
  }

  objc_msgSend(v9, "setShadowOffset:", 0.0, v6);
  objc_msgSend(v9, "setShadowRadius:", v6);
  *(float *)&v8 = v7;
  objc_msgSend(v9, "setShadowOpacity:", v8);

}

- (id)timeTextColor
{
  unsigned __int8 v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = -[TransitSchedulesDepartureCollectionViewCell isSelected](self, "isSelected");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v4 = v3;
  if ((v2 & 1) == 0)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorWithAlphaComponent:", 0.699999988));

    v4 = (void *)v5;
  }
  return v4;
}

- (id)realTimeStatusIndicatorColor
{
  void *v3;
  void *v4;

  if (-[TransitSchedulesDepartureCollectionViewCell isSelected](self, "isSelected"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell liveStatusColor](self, "liveStatusColor"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorWithAlphaComponent:", 0.800000012));

  }
  return v3;
}

- (id)statusStringTextColor
{
  void *v3;
  void *v4;

  if (-[TransitSchedulesDepartureCollectionViewCell isSelected](self, "isSelected"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell liveStatusColor](self, "liveStatusColor"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorWithAlphaComponent:", 0.400000006));

  }
  return v3;
}

- (id)liveStatusColor
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  int64_t v7;
  uint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell departure](self, "departure"));
  v4 = objc_msgSend(v3, "isPastDeparture");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCollectionViewCell departure](self, "departure"));
    v7 = -[TransitSchedulesDepartureBaseViewCell effectiveLiveStatusForDeparture:](self, "effectiveLiveStatusForDeparture:", v6);

    v8 = MKTransitLiveDepartureColorForViewWithLiveStatus(self, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }
  return v5;
}

- (GEOTransitDeparture)departure
{
  return self->_departure;
}

- (void)setDeparture:(id)a3
{
  objc_storeStrong((id *)&self->_departure, a3);
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timeLabel, a3);
}

- (UILabel)liveStatusLabel
{
  return self->_liveStatusLabel;
}

- (void)setLiveStatusLabel:(id)a3
{
  objc_storeStrong((id *)&self->_liveStatusLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liveStatusLabel, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_departure, 0);
}

@end
