@implementation CarETAExpandedSign

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (CarETAExpandedSign)initWithDataSource:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  double y;
  double width;
  double height;
  CarETAExpandedSign *v11;
  CarETAExpandedSign *v12;
  UILabel *v13;
  UILabel *etaLabel;
  double v15;
  double v16;
  double v17;
  double v18;
  CarFocusableButton *v19;
  CarFocusableButton *expandButton;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  CarCardRoundedButton *v29;
  CarCardRoundedButton *stopsButton;
  id v31;
  uint64_t v32;
  SharedTripSuggestionsDataSource *v33;
  SharedTripSuggestionsDataSource *suggestionDataSource;
  CarCardRoundedButton *v35;
  CarCardRoundedButton *endButton;
  double v37;
  UIStackView *v38;
  UIStackView *buttonsStackView;
  double v40;
  double v41;
  void *v42;
  objc_super v44;
  _QWORD v45[2];

  v6 = a3;
  v7 = a4;
  v44.receiver = self;
  v44.super_class = (Class)CarETAExpandedSign;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v11 = -[CarETAExpandedSign initWithFrame:](&v44, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v12 = v11;
  if (v11)
  {
    -[CarETAExpandedSign setAccessibilityIdentifier:](v11, "setAccessibilityIdentifier:", CFSTR("CarETAExpandedSign"));
    objc_storeWeak((id *)&v12->_delegate, v7);
    objc_storeWeak((id *)&v12->_dataSource, v6);
    v13 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    etaLabel = v12->_etaLabel;
    v12->_etaLabel = v13;

    -[UILabel setAccessibilityIdentifier:](v12->_etaLabel, "setAccessibilityIdentifier:", CFSTR("EtaLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v12->_etaLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v15) = 1132068864;
    -[UILabel setContentHuggingPriority:forAxis:](v12->_etaLabel, "setContentHuggingPriority:forAxis:", 0, v15);
    LODWORD(v16) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v12->_etaLabel, "setContentHuggingPriority:forAxis:", 1, v16);
    LODWORD(v17) = 1144750080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v12->_etaLabel, "setContentCompressionResistancePriority:forAxis:", 0, v17);
    LODWORD(v18) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v12->_etaLabel, "setContentCompressionResistancePriority:forAxis:", 1, v18);
    -[CarETAExpandedSign addSubview:](v12, "addSubview:", v12->_etaLabel);
    v19 = -[CarFocusableButton initWithFrame:]([CarFocusableButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    expandButton = v12->_expandButton;
    v12->_expandButton = v19;

    -[CarFocusableButton setAccessibilityIdentifier:](v12->_expandButton, "setAccessibilityIdentifier:", CFSTR("ExpandButton"));
    -[CarFocusableButton setTranslatesAutoresizingMaskIntoConstraints:](v12->_expandButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v21) = 1144750080;
    -[CarFocusableButton setContentHuggingPriority:forAxis:](v12->_expandButton, "setContentHuggingPriority:forAxis:", 0, v21);
    LODWORD(v22) = 1148846080;
    -[CarFocusableButton setContentCompressionResistancePriority:forAxis:](v12->_expandButton, "setContentCompressionResistancePriority:forAxis:", 0, v22);
    LODWORD(v23) = 1148846080;
    -[CarFocusableButton setContentCompressionResistancePriority:forAxis:](v12->_expandButton, "setContentCompressionResistancePriority:forAxis:", 1, v23);
    -[MapsLargerHitTargetButton setTouchInsets:](v12->_expandButton, "setTouchInsets:", -10.0, -120.0, -10.0, -10.0);
    -[CarFocusableButton addTarget:action:forControlEvents:](v12->_expandButton, "addTarget:action:forControlEvents:", v12, "_buttonTapped:", 64);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("CarPlay_Expand"), CFSTR("localized string not found"), 0));
    v45[0] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("CarPlay_Up"), CFSTR("localized string not found"), 0));
    v45[1] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 2));
    -[CarFocusableButton setAccessibilityUserInputLabels:](v12->_expandButton, "setAccessibilityUserInputLabels:", v28);

    -[CarETAExpandedSign addSubview:](v12, "addSubview:", v12->_expandButton);
    v29 = -[CarCardRoundedButton initWithFrame:]([CarCardRoundedButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    stopsButton = v12->_stopsButton;
    v12->_stopsButton = v29;

    -[CarCardRoundedButton setAccessibilityIdentifier:](v12->_stopsButton, "setAccessibilityIdentifier:", CFSTR("StopsButton"));
    -[CarCardRoundedButton setTranslatesAutoresizingMaskIntoConstraints:](v12->_stopsButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarCardRoundedButton setContentHorizontalAlignment:](v12->_stopsButton, "setContentHorizontalAlignment:", 1);
    v31 = -[CarCardRoundedButton addTarget:action:forControlEvents:](v12->_stopsButton, "addTarget:action:forControlEvents:", v12, "_buttonTapped:", 64);
    if (MSPSharedTripSharingAvailable(v31, v32))
    {
      v33 = -[SharedTripSuggestionsDataSource initWithSoftCellCap:includeActiveContacts:]([SharedTripSuggestionsDataSource alloc], "initWithSoftCellCap:includeActiveContacts:", GEOConfigGetUInteger(MapsConfig_SharedTripMaximumNumberOfSuggestionsFromPeopleSuggester, off_1014B5618), 1);
      suggestionDataSource = v12->_suggestionDataSource;
      v12->_suggestionDataSource = v33;

      -[SharedTripSuggestionsDataSource setDelegate:](v12->_suggestionDataSource, "setDelegate:", v12);
    }
    v35 = -[CarCardRoundedButton initWithFrame:]([CarCardRoundedButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    endButton = v12->_endButton;
    v12->_endButton = v35;

    -[CarCardRoundedButton setAccessibilityIdentifier:](v12->_endButton, "setAccessibilityIdentifier:", CFSTR("EndButton"));
    -[CarCardRoundedButton setTranslatesAutoresizingMaskIntoConstraints:](v12->_endButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v37) = 1148846080;
    -[CarCardRoundedButton setContentCompressionResistancePriority:forAxis:](v12->_endButton, "setContentCompressionResistancePriority:forAxis:", 1, v37);
    -[CarCardRoundedButton addTarget:action:forControlEvents:](v12->_endButton, "addTarget:action:forControlEvents:", v12, "_buttonTapped:", 64);
    v38 = (UIStackView *)objc_alloc_init((Class)UIStackView);
    buttonsStackView = v12->_buttonsStackView;
    v12->_buttonsStackView = v38;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v12->_buttonsStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v40) = 1144766464;
    -[UIStackView setContentCompressionResistancePriority:forAxis:](v12->_buttonsStackView, "setContentCompressionResistancePriority:forAxis:", 1, v40);
    LODWORD(v41) = 1148846080;
    -[UIStackView setContentCompressionResistancePriority:forAxis:](v12->_buttonsStackView, "setContentCompressionResistancePriority:forAxis:", 0, v41);
    -[UIStackView setAxis:](v12->_buttonsStackView, "setAxis:", 1);
    -[UIStackView setDistribution:](v12->_buttonsStackView, "setDistribution:", 1);
    -[UIStackView setSpacing:](v12->_buttonsStackView, "setSpacing:", 2.0);
    -[CarETAExpandedSign addSubview:](v12, "addSubview:", v12->_buttonsStackView);
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutManager sharedInstance](TrafficIncidentLayoutManager, "sharedInstance"));
    objc_msgSend(v42, "addObserver:", v12);

    -[CarETAExpandedSign _rebuildButtons](v12, "_rebuildButtons");
    -[CarETAExpandedSign _setupConstraints](v12, "_setupConstraints");
    -[CarETAExpandedSign _updateSharingButtonDisabledTitle](v12, "_updateSharingButtonDisabledTitle");
    -[CarETAExpandedSign _updateStyling](v12, "_updateStyling");
    -[CarETAExpandedSign _updateContent](v12, "_updateContent");
  }

  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutManager sharedInstance](TrafficIncidentLayoutManager, "sharedInstance"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CarETAExpandedSign;
  -[CarETAExpandedSign dealloc](&v4, "dealloc");
}

- (CarCardRoundedButton)shareTripButton
{
  CarCardRoundedButton *shareTripButton;
  CarCardRoundedButton *v4;
  CarCardRoundedButton *v5;
  CarCardRoundedButton *v6;
  void *v7;

  shareTripButton = self->_shareTripButton;
  if (!shareTripButton)
  {
    v4 = -[CarCardRoundedButton initWithFrame:]([CarCardRoundedButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_shareTripButton;
    self->_shareTripButton = v4;

    -[CarCardRoundedButton setTranslatesAutoresizingMaskIntoConstraints:](self->_shareTripButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarCardRoundedButton setContentHorizontalAlignment:](self->_shareTripButton, "setContentHorizontalAlignment:", 1);
    -[CarCardRoundedButton addTarget:action:forControlEvents:](self->_shareTripButton, "addTarget:action:forControlEvents:", self, "_buttonTapped:", 64);
    v6 = self->_shareTripButton;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemSecondaryColor](UIColor, "_carSystemSecondaryColor"));
    -[CarFocusableButton setTitleColor:forState:](v6, "setTitleColor:forState:", v7, 2);

    shareTripButton = self->_shareTripButton;
  }
  return shareTripButton;
}

- (CarCardRoundedButton)reportIncidentButton
{
  void *v3;
  unsigned int v4;
  CarCardRoundedButton *reportIncidentButton;
  CarCardRoundedButton *v6;
  CarCardRoundedButton *v7;
  CarCardRoundedButton *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutManager sharedInstance](TrafficIncidentLayoutManager, "sharedInstance"));
  v4 = objc_msgSend(v3, "isIncidentReportingEnabled");

  if (v4)
  {
    reportIncidentButton = self->_reportIncidentButton;
    if (!reportIncidentButton)
    {
      v6 = -[CarCardRoundedButton initWithFrame:]([CarCardRoundedButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      v7 = self->_reportIncidentButton;
      self->_reportIncidentButton = v6;

      -[CarCardRoundedButton setTranslatesAutoresizingMaskIntoConstraints:](self->_reportIncidentButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[CarCardRoundedButton setContentHorizontalAlignment:](self->_reportIncidentButton, "setContentHorizontalAlignment:", 1);
      -[CarCardRoundedButton addTarget:action:forControlEvents:](self->_reportIncidentButton, "addTarget:action:forControlEvents:", self, "_buttonTapped:", 64);
      reportIncidentButton = self->_reportIncidentButton;
    }
    v8 = reportIncidentButton;
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (NSArray)stackedButtons
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_opt_new(NSMutableArray);
  -[NSMutableArray addObject:](v3, "addObject:", self->_stopsButton);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAExpandedSign shareTripButton](self, "shareTripButton"));

  if (v4)
    -[NSMutableArray addObject:](v3, "addObject:", self->_shareTripButton);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAExpandedSign reportIncidentButton](self, "reportIncidentButton"));

  if (v5)
    -[NSMutableArray addObject:](v3, "addObject:", self->_reportIncidentButton);
  -[NSMutableArray addObject:](v3, "addObject:", self->_endButton);
  v6 = -[NSMutableArray copy](v3, "copy");

  return (NSArray *)v6;
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
  NSMutableArray *v32;
  _QWORD v33[4];
  _QWORD v34[5];

  v32 = objc_opt_new(NSMutableArray);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_etaLabel, "firstBaselineAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAExpandedSign topAnchor](self, "topAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v28, 28.0));
  v34[0] = v26;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_etaLabel, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAExpandedSign leadingAnchor](self, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, 10.0));
  v34[1] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_etaLabel, "trailingAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton leadingAnchor](self->_expandButton, "leadingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v3, -10.0));
  v34[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton firstBaselineAnchor](self->_expandButton, "firstBaselineAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAExpandedSign topAnchor](self, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6, 29.0));
  v34[3] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton trailingAnchor](self->_expandButton, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAExpandedSign trailingAnchor](self, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, -8.5));
  v34[4] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 5));
  -[NSMutableArray addObjectsFromArray:](v32, "addObjectsFromArray:", v11);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_buttonsStackView, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_etaLabel, "lastBaselineAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v29, 14.0));
  v33[0] = v27;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_buttonsStackView, "leadingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAExpandedSign leadingAnchor](self, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v12, 10.0));
  v33[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_buttonsStackView, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAExpandedSign trailingAnchor](self, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, -10.0));
  v33[2] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_buttonsStackView, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAExpandedSign bottomAnchor](self, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, -10.0));
  v33[3] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 4));
  -[NSMutableArray addObjectsFromArray:](v32, "addObjectsFromArray:", v20);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v32);
}

- (void)_rebuildButtons
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_buttonsStackView, "arrangedSubviews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAExpandedSign stackedButtons](self, "stackedButtons"));
  if ((objc_msgSend(v3, "isEqualToArray:", v4) & 1) == 0)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_buttonsStackView, "arrangedSubviews", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          -[UIStackView _maps_removeArrangedSubview:](self->_buttonsStackView, "_maps_removeArrangedSubview:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9));
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    -[UIStackView _maps_setArrangedSubviews:](self->_buttonsStackView, "_maps_setArrangedSubviews:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v11 = sub_10039DCD4(v4, &stru_1011AF580);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    objc_msgSend(v10, "addObjectsFromArray:", v12);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v10);
  }

}

- (void)_updateContent
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  CarCardRoundedButton *shareTripButton;
  void *v13;
  void *v14;
  id v15;
  CarCardRoundedButton *reportIncidentButton;
  void *v17;
  void *v18;
  CarCardRoundedButton *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  CarCardRoundedButton *stopsButton;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  CarCardRoundedButton *v33;
  void *v34;
  void *v35;
  CarCardRoundedButton *v36;
  id v37;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAExpandedSign dataSource](self, "dataSource"));
  v4 = objc_msgSend(v3, "isSharingTrip");

  -[CarFocusableButton setEnabled:](self->_shareTripButton, "setEnabled:", -[CarETAExpandedSign _shouldEnableShareTripButton](self, "_shouldEnableShareTripButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  if (objc_msgSend(v5, "canAddReceivers"))
  {
    -[CarCardRoundedButton setHidden:](self->_shareTripButton, "setHidden:", 0);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "receivers"));
    -[CarCardRoundedButton setHidden:](self->_shareTripButton, "setHidden:", objc_msgSend(v7, "count") == 0);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = v8;
  if (v4)
    v10 = CFSTR("CarPlay_ShareTripButton_Sharing");
  else
    v10 = CFSTR("CarPlay_ShareTripButton_NotSharing");
  if (v4)
    v11 = CFSTR("person.crop.circle.badge.checkmark");
  else
    v11 = CFSTR("person.crop.circle.badge.plus");
  v37 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, CFSTR("localized string not found"), 0));

  -[CarCardRoundedButton setTitle:forState:](self->_shareTripButton, "setTitle:forState:", v37, 0);
  shareTripButton = self->_shareTripButton;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:textStyle:](UIImage, "_mapsCar_systemImageNamed:textStyle:", v11, UIFontTextStyleTitle3));
  -[CarCardRoundedButton setImage:forState:](shareTripButton, "setImage:forState:", v13, 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutManager sharedInstance](TrafficIncidentLayoutManager, "sharedInstance"));
  v15 = objc_msgSend(v14, "isIncidentReportingEnabled");

  -[CarFocusableButton setEnabled:](self->_reportIncidentButton, "setEnabled:", v15);
  reportIncidentButton = self->_reportIncidentButton;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Report [Nav Tray, Incident Report]"), CFSTR("localized string not found"), 0));
  -[CarCardRoundedButton setTitle:forState:](reportIncidentButton, "setTitle:forState:", v18, 0);

  v19 = self->_reportIncidentButton;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:textStyle:](UIImage, "_mapsCar_systemImageNamed:textStyle:", CFSTR("exclamationmark.bubble.fill"), UIFontTextStyleTitle3));
  -[CarCardRoundedButton setImage:forState:](v19, "setImage:forState:", v20, 0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAExpandedSign dataSource](self, "dataSource"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "upcomingWaypoints"));
  v23 = sub_10039E080(v22, &stru_1011AF5A0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = objc_msgSend(v24, "count");

  stopsButton = self->_stopsButton;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v28 = v27;
  if ((unint64_t)v25 < 2)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("CarPlay_AddStop"), CFSTR("localized string not found"), 0));
    -[CarCardRoundedButton setTitle:forState:](stopsButton, "setTitle:forState:", v35, 0);

    v36 = self->_stopsButton;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:textStyle:weight:](UIImage, "_mapsCar_systemImageNamed:textStyle:weight:", CFSTR("plus.circle.fill"), UIFontTextStyleTitle3, 6));
    -[CarCardRoundedButton setImage:forState:](v36, "setImage:forState:", v31, 0);
  }
  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("CarPlay_EditStops"), CFSTR("localized string not found"), 0));
    -[CarCardRoundedButton setTitle:forState:](stopsButton, "setTitle:forState:", v29, 0);

    v30 = +[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleTitle3, UIFontWeightForImageSymbolWeight(UIImageSymbolWeightSemibold));
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v31));
    v33 = self->_stopsButton;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", CFSTR("pin.point.of.interest.2.fill"), v32));
    -[CarCardRoundedButton setImage:forState:](v33, "setImage:forState:", v34, 0);

  }
}

- (void)_updateStyling
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  CarFocusableButton *expandButton;
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
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  CarCardRoundedButton *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  CarCardRoundedButton *endButton;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _QWORD v47[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontWeightSemibold));
  -[UILabel setFont:](self->_etaLabel, "setFont:", v3);

  -[UILabel setMinimumScaleFactor:](self->_etaLabel, "setMinimumScaleFactor:", 0.800000012);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_etaLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setNumberOfLines:](self->_etaLabel, "setNumberOfLines:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_etaLabel, "setTextColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("00:00 ETA [CarPlay]"), CFSTR("localized string not found"), 0));

  v41 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringToIndex:", 2));
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("%@"));

  if (v8)
    v9 = 4;
  else
    v9 = 3;
  -[UILabel setLineBreakMode:](self->_etaLabel, "setLineBreakMode:", v9);
  expandButton = self->_expandButton;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:textStyle:weight:](UIImage, "_mapsCar_systemImageNamed:textStyle:weight:", CFSTR("chevron.down.circle.fill"), UIFontTextStyleTitle3, 6));
  -[CarFocusableButton setImage:forState:](expandButton, "setImage:forState:", v11, 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
  -[CarFocusableButton setFocusedTintColor:](self->_expandButton, "setFocusedTintColor:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemTertiaryColor](UIColor, "_carSystemTertiaryColor"));
  -[CarFocusableButton setNonFocusedTintColor:](self->_expandButton, "setNonFocusedTintColor:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CarPlay_Collapse"), CFSTR("localized string not found"), 0));
  v47[0] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CarPlay_Close"), CFSTR("localized string not found"), 0));
  v47[1] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CarPlay_Down"), CFSTR("localized string not found"), 0));
  v47[2] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 3));
  -[CarFocusableButton setAccessibilityUserInputLabels:](self->_expandButton, "setAccessibilityUserInputLabels:", v20);

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAExpandedSign stackedButtons](self, "stackedButtons"));
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v24)
          objc_enumerationMutation(v21);
        v26 = *(CarCardRoundedButton **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton titleLabel](v26, "titleLabel"));
        objc_msgSend(v27, "setMinimumScaleFactor:", 0.800000012);

        v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton titleLabel](v26, "titleLabel"));
        objc_msgSend(v28, "setAdjustsFontSizeToFitWidth:", 1);

        v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton titleLabel](v26, "titleLabel"));
        objc_msgSend(v29, "setNumberOfLines:", 2);

        if (v26 != self->_endButton)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
          -[CarFocusableButton setNonFocusedTintColor:](v26, "setNonFocusedTintColor:", v30);

          v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemQuaternaryColor](UIColor, "_carSystemQuaternaryColor"));
          -[CarFocusableButton setNonFocusedBackgroundColor:](v26, "setNonFocusedBackgroundColor:", v31);

        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v23);
  }

  endButton = self->_endButton;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("CarPlay_EndRoute"), CFSTR("localized string not found"), 0));
  -[CarCardRoundedButton setTitle:forState:](endButton, "setTitle:forState:", v34, 0);

  -[CarCardRoundedButton setContentHorizontalAlignment:](self->_endButton, "setContentHorizontalAlignment:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton titleLabel](self->_endButton, "titleLabel"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCallout, UIFontWeightBold));
  objc_msgSend(v35, "setFont:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  -[CarFocusableButton setNonFocusedTintColor:](self->_endButton, "setNonFocusedTintColor:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
  -[CarFocusableButton setFocusedTintColor:](self->_endButton, "setFocusedTintColor:", v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  -[CarFocusableButton setNonFocusedBackgroundColor:](self->_endButton, "setNonFocusedBackgroundColor:", v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
  -[CarFocusableButton setFocusedBackgroundColor:](self->_endButton, "setFocusedBackgroundColor:", v40);

}

- (void)_updateSharingButtonDisabledTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  _QWORD v20[2];
  _QWORD v21[2];
  NSAttributedStringKey v22;
  void *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CarPlay_ShareTripButton_NotSharing"), CFSTR("localized string not found"), 0));

  LODWORD(v3) = -[SharedTripSuggestionsDataSource isRefreshing](self->_suggestionDataSource, "isRefreshing");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = v5;
  if ((_DWORD)v3)
    v7 = CFSTR("CarPlay_ShareTripButton_LoadingContacts");
  else
    v7 = CFSTR("CarPlay_ShareTripButton_NoContacts");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, CFSTR("localized string not found"), 0));

  v9 = objc_alloc((Class)NSMutableAttributedString);
  v22 = NSForegroundColorAttributeName;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemSecondaryColor](UIColor, "_carSystemSecondaryColor"));
  v23 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
  v12 = objc_msgSend(v9, "initWithString:attributes:", v4, v11);

  v13 = objc_alloc((Class)NSAttributedString);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n%@"), v8));
  v20[0] = NSForegroundColorAttributeName;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemSecondaryColor](UIColor, "_carSystemSecondaryColor"));
  v21[0] = v15;
  v20[1] = NSFontAttributeName;
  +[CarCardRoundedButton buttonMetrics](CarCardRoundedButton, "buttonMetrics");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", v19, UIFontWeightMedium));
  v21[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
  v18 = objc_msgSend(v13, "initWithString:attributes:", v14, v17);
  objc_msgSend(v12, "appendAttributedString:", v18);

  -[CarCardRoundedButton setAttributedTitle:forState:](self->_shareTripButton, "setAttributedTitle:forState:", v12, 2);
}

- (void)_buttonTapped:(id)a3
{
  CarCardRoundedButton *v4;
  void *v5;
  void *v6;
  CarETAExpandedSign *v7;
  uint64_t v8;
  CarCardRoundedButton *v9;

  v4 = (CarCardRoundedButton *)a3;
  if ((CarCardRoundedButton *)self->_expandButton == v4)
  {
    v9 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAExpandedSign delegate](self, "delegate"));
    v6 = v5;
    v7 = self;
    v8 = 0;
    goto LABEL_11;
  }
  if (self->_stopsButton == v4)
  {
    v9 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAExpandedSign delegate](self, "delegate"));
    v6 = v5;
    v7 = self;
    v8 = 4;
    goto LABEL_11;
  }
  if (self->_reportIncidentButton == v4)
  {
    v9 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAExpandedSign delegate](self, "delegate"));
    v6 = v5;
    v7 = self;
    v8 = 5;
    goto LABEL_11;
  }
  if (self->_shareTripButton == v4)
  {
    v9 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAExpandedSign delegate](self, "delegate"));
    v6 = v5;
    v7 = self;
    v8 = 6;
    goto LABEL_11;
  }
  if (self->_endButton == v4)
  {
    v9 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAExpandedSign delegate](self, "delegate"));
    v6 = v5;
    v7 = self;
    v8 = 1;
LABEL_11:
    objc_msgSend(v5, "etaCardSign:didSelectAction:", v7, v8);

    v4 = v9;
  }

}

- (NSArray)focusOrderSubItems
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", self->_expandButton));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarETAExpandedSign stackedButtons](self, "stackedButtons"));
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  v5 = objc_msgSend(v3, "copy");
  return (NSArray *)v5;
}

- (NSArray)preferredFocusEnvironments
{
  CarCardRoundedButton *stopsButton;

  stopsButton = self->_stopsButton;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &stopsButton, 1));
}

- (void)setLatestETA:(id)a3
{
  GuidanceETA *v5;
  uint64_t v6;
  void *v7;
  GuidanceETA *v8;

  v5 = (GuidanceETA *)a3;
  if (self->_latestETA != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_latestETA, a3);
    if (v8)
      v6 = objc_claimAutoreleasedReturnValue(-[GuidanceETA arrivalTimeExpandedStringIncludingAMPMSymbols:](v8, "arrivalTimeExpandedStringIncludingAMPMSymbols:", 0));
    else
      v6 = objc_claimAutoreleasedReturnValue(+[GuidanceETA invalidValueString](GuidanceETA, "invalidValueString"));
    v7 = (void *)v6;
    -[UILabel setText:](self->_etaLabel, "setText:", v6);

    v5 = v8;
  }

}

- (void)incidentsReportingEnablementDidUpdate
{
  void *v3;
  unsigned __int8 v4;
  CarCardRoundedButton *reportIncidentButton;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutManager sharedInstance](TrafficIncidentLayoutManager, "sharedInstance"));
  v4 = objc_msgSend(v3, "isIncidentReportingEnabled");

  if ((v4 & 1) == 0)
  {
    reportIncidentButton = self->_reportIncidentButton;
    self->_reportIncidentButton = 0;

  }
  -[CarETAExpandedSign _rebuildButtons](self, "_rebuildButtons");
  -[CarETAExpandedSign _updateContent](self, "_updateContent");
}

- (void)suggestionsDataSourceDidUpdateContactsForDisplay:(id)a3
{
  -[CarFocusableButton setEnabled:](self->_shareTripButton, "setEnabled:", -[CarETAExpandedSign _shouldEnableShareTripButton](self, "_shouldEnableShareTripButton", a3));
  -[CarETAExpandedSign _updateSharingButtonDisabledTitle](self, "_updateSharingButtonDisabledTitle");
}

- (BOOL)_shouldEnableShareTripButton
{
  BOOL v3;
  void *v4;

  if ((GEOConfigGetBOOL(MapsConfig_ShareETAEnableCarPlayUserInput, off_1014B3E48) & 1) != 0)
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource contactsForDisplay](self->_suggestionDataSource, "contactsForDisplay"));
  v3 = objc_msgSend(v4, "count") != 0;

  return v3;
}

- (GuidanceETA)latestETA
{
  return self->_latestETA;
}

- (CarETACardSignDelegate)delegate
{
  return (CarETACardSignDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setShareTripButton:(id)a3
{
  objc_storeStrong((id *)&self->_shareTripButton, a3);
}

- (void)setReportIncidentButton:(id)a3
{
  objc_storeStrong((id *)&self->_reportIncidentButton, a3);
}

- (CarETAExpandedSignDataSource)dataSource
{
  return (CarETAExpandedSignDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_reportIncidentButton, 0);
  objc_storeStrong((id *)&self->_shareTripButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_latestETA, 0);
  objc_storeStrong((id *)&self->_suggestionDataSource, 0);
  objc_storeStrong((id *)&self->_endButton, 0);
  objc_storeStrong((id *)&self->_stopsButton, 0);
  objc_storeStrong((id *)&self->_buttonsStackView, 0);
  objc_storeStrong((id *)&self->_expandButton, 0);
  objc_storeStrong((id *)&self->_etaLabel, 0);
}

@end
