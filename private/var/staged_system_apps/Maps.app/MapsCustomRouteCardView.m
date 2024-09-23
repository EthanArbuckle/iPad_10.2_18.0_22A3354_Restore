@implementation MapsCustomRouteCardView

- (MapsCustomRouteCardView)initWithCoder:(id)a3
{
  MapsCustomRouteCardView *v3;
  MapsCustomRouteCardView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MapsCustomRouteCardView;
  v3 = -[MapsCustomRouteCardView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[MapsCustomRouteCardView _commonInit](v3, "_commonInit");
  return v4;
}

- (MapsCustomRouteCardView)initWithFrame:(CGRect)a3
{
  MapsCustomRouteCardView *v3;
  MapsCustomRouteCardView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MapsCustomRouteCardView;
  v3 = -[MapsCustomRouteCardView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MapsCustomRouteCardView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  NSMeasurement *v9;
  NSMeasurement *zeroMeters;
  UIView *v11;
  UIView *summaryContainer;
  void *v13;
  UILabel *v14;
  UILabel *distanceLabel;
  MapsThemeMultiPartLabel *v16;
  MapsThemeMultiPartLabel *descriptionLabel;
  UITextView *v18;
  UITextView *disclaimerLabel;
  void *v20;
  MultilineStackView *v21;
  MultilineStackView *buttonStackView;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  unsigned int v28;
  uint64_t v29;
  void *v30;
  UIButton *v31;
  UIButton *directionsButton;
  double v33;
  void *v34;
  UIButton *v35;
  UIButton *saveToLibraryButton;
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
  NSLayoutConstraint *v48;
  NSLayoutConstraint *disclaimerLabelBottomConstraint;
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
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  _QWORD v89[15];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  self->_isMetric = objc_msgSend(v3, "_navigation_distanceUsesMetricSystem");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = MNLocaleDidChangeNotification();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_unitsDidChange", v6, 0);

  v7 = objc_alloc((Class)NSMeasurement);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUnitLength meters](NSUnitLength, "meters"));
  v9 = (NSMeasurement *)objc_msgSend(v7, "initWithDoubleValue:unit:", v8, 0.0);
  zeroMeters = self->_zeroMeters;
  self->_zeroMeters = v9;

  v11 = objc_opt_new(UIView);
  summaryContainer = self->_summaryContainer;
  self->_summaryContainer = v11;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_summaryContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &stru_1011DD6D0));
  -[UIView setBackgroundColor:](self->_summaryContainer, "setBackgroundColor:", v13);

  -[UIView _setContinuousCornerRadius:](self->_summaryContainer, "_setContinuousCornerRadius:", 12.0);
  v14 = objc_opt_new(UILabel);
  distanceLabel = self->_distanceLabel;
  self->_distanceLabel = v14;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_distanceLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v16 = objc_opt_new(MapsThemeMultiPartLabel);
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v16;

  -[MapsThemeMultiPartLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MapsThemeMultiPartLabel setNumberOfLines:](self->_descriptionLabel, "setNumberOfLines:", 1);
  v18 = objc_opt_new(UITextView);
  disclaimerLabel = self->_disclaimerLabel;
  self->_disclaimerLabel = v18;

  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_disclaimerLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITextView setEditable:](self->_disclaimerLabel, "setEditable:", 0);
  -[UITextView setScrollEnabled:](self->_disclaimerLabel, "setScrollEnabled:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UITextView setBackgroundColor:](self->_disclaimerLabel, "setBackgroundColor:", v20);

  v21 = -[MultilineStackView initWithHorizontalArrangement:verticalArrangement:]([MultilineStackView alloc], "initWithHorizontalArrangement:verticalArrangement:", 3, 0);
  buttonStackView = self->_buttonStackView;
  self->_buttonStackView = v21;

  -[MultilineStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_buttonStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v23 = kMUPlaceHorizontalStackSpacing;
  -[MultilineStackView setInterItemHorizontalPadding:](self->_buttonStackView, "setInterItemHorizontalPadding:", kMUPlaceHorizontalStackSpacing);
  -[MultilineStackView setInterItemVerticalPadding:](self->_buttonStackView, "setInterItemVerticalPadding:", v23);
  LODWORD(v24) = 1148846080;
  -[MultilineStackView setContentHuggingPriority:forAxis:](self->_buttonStackView, "setContentHuggingPriority:forAxis:", 1, v24);
  LODWORD(v25) = 1148846080;
  -[MultilineStackView setContentCompressionResistancePriority:forAxis:](self->_buttonStackView, "setContentCompressionResistancePriority:forAxis:", 1, v25);
  -[MultilineStackView setAccessibilityIdentifier:](self->_buttonStackView, "setAccessibilityIdentifier:", CFSTR("ButtonStackView"));
  -[MultilineStackView setRowHeightBlock:](self->_buttonStackView, "setRowHeightBlock:", &stru_1011DD6F0);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute origin](self->_route, "origin"));
  if (objc_msgSend(v26, "isCurrentLocation"))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
    v28 = objc_msgSend(v27, "currentCountrySupportsNavigation");
    v29 = 1;
    if (!v28)
      v29 = 2;
    v87 = v29;

  }
  else
  {
    v87 = 2;
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration _maps_primaryCardFooterActionButtonConfiguration](UIButtonConfiguration, "_maps_primaryCardFooterActionButtonConfiguration"));
  v31 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v30, 0));
  directionsButton = self->_directionsButton;
  self->_directionsButton = v31;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_directionsButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v33) = 1148846080;
  -[UIButton setContentCompressionResistancePriority:forAxis:](self->_directionsButton, "setContentCompressionResistancePriority:forAxis:", 1, v33);
  -[UIButton setAccessibilityIdentifier:](self->_directionsButton, "setAccessibilityIdentifier:", CFSTR("DirectionsButton"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration _maps_secondaryCardFooterActionButtonConfiguration](UIButtonConfiguration, "_maps_secondaryCardFooterActionButtonConfiguration"));
  v35 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v34, 0));
  saveToLibraryButton = self->_saveToLibraryButton;
  self->_saveToLibraryButton = v35;

  -[UIButton addTarget:action:forControlEvents:](self->_saveToLibraryButton, "addTarget:action:forControlEvents:", self, "_pressedSaveToLibrary", 64);
  -[MapsCustomRouteCardView _updateDirectionsButtonWithSuggestedMode:](self, "_updateDirectionsButtonWithSuggestedMode:", v87);
  -[UIView addSubview:](self->_summaryContainer, "addSubview:", self->_distanceLabel);
  -[UIView addSubview:](self->_summaryContainer, "addSubview:", self->_descriptionLabel);
  -[UIView addSubview:](self->_summaryContainer, "addSubview:", self->_disclaimerLabel);
  -[MapsCustomRouteCardView addSubview:](self, "addSubview:", self->_summaryContainer);
  -[MapsCustomRouteCardView addSubview:](self, "addSubview:", self->_buttonStackView);
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_summaryContainer, "topAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteCardView topAnchor](self, "topAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "constraintEqualToAnchor:", v86));
  v89[0] = v85;
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_summaryContainer, "leadingAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteCardView leadingAnchor](self, "leadingAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:constant:", v83, 16.0));
  v89[1] = v82;
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_summaryContainer, "trailingAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteCardView trailingAnchor](self, "trailingAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:constant:", v80, -16.0));
  v89[2] = v79;
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_distanceLabel, "leadingAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_summaryContainer, "leadingAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:constant:", v77, 14.0));
  v89[3] = v76;
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_distanceLabel, "trailingAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_summaryContainer, "trailingAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:constant:", v74, -14.0));
  v89[4] = v73;
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_distanceLabel, "topAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_summaryContainer, "topAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:constant:", v71, 12.0));
  v89[5] = v70;
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeMultiPartLabel leadingAnchor](self->_descriptionLabel, "leadingAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_distanceLabel, "leadingAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v68));
  v89[6] = v67;
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeMultiPartLabel trailingAnchor](self->_descriptionLabel, "trailingAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_distanceLabel, "trailingAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v65));
  v89[7] = v64;
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeMultiPartLabel topAnchor](self->_descriptionLabel, "topAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_distanceLabel, "bottomAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:constant:", v62, -7.0));
  v89[8] = v61;
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView leadingAnchor](self->_disclaimerLabel, "leadingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_summaryContainer, "leadingAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:constant:", v59, 8.0));
  v89[9] = v58;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView trailingAnchor](self->_disclaimerLabel, "trailingAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_summaryContainer, "trailingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:constant:", v56, -10.0));
  v89[10] = v55;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineStackView leadingAnchor](self->_buttonStackView, "leadingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteCardView leadingAnchor](self, "leadingAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:constant:", v53, 16.0));
  v89[11] = v52;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineStackView trailingAnchor](self->_buttonStackView, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteCardView trailingAnchor](self, "trailingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:constant:", v37, -16.0));
  v89[12] = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineStackView topAnchor](self->_buttonStackView, "topAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_summaryContainer, "bottomAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, 16.0));
  v89[13] = v41;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineStackView bottomAnchor](self->_buttonStackView, "bottomAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteCardView bottomAnchor](self, "bottomAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v43));
  v89[14] = v44;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v89, 15));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v45);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView bottomAnchor](self->_disclaimerLabel, "bottomAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_summaryContainer, "bottomAnchor"));
  v48 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v47));
  disclaimerLabelBottomConstraint = self->_disclaimerLabelBottomConstraint;
  self->_disclaimerLabelBottomConstraint = v48;

  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v50, "addObserver:selector:name:object:", self, "_updateOfflineSubscription", CFSTR("OfflineMapsSubscriptionsDidChangeNotification"), 0);

  _GEOConfigAddDelegateListenerForKey(MapsConfig_RouteCreationAvailable, off_1014B55A8, &_dispatch_main_q, self);
}

- (void)dealloc
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  if (self->_offlineSubscription)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = objc_msgSend(&off_1012740B8, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(&off_1012740B8);
          -[MapDataSubscriptionInfo addObserver:forKeyPath:options:context:](self->_offlineSubscription, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v6), 0, off_1014B7FD0);
          v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        v4 = objc_msgSend(&off_1012740B8, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }
  }
  GEOConfigRemoveDelegateListenerForAllKeys(self, a2);
  v7.receiver = self;
  v7.super_class = (Class)MapsCustomRouteCardView;
  -[MapsCustomRouteCardView dealloc](&v7, "dealloc");
}

- (void)_pressedNav
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_1004320DC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "pressed go", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteCardView delegate](self, "delegate"));
  objc_msgSend(v5, "pressedNavigation");

}

- (void)_pressedStepping
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_1004320DC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "pressed stepping", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteCardView delegate](self, "delegate"));
  objc_msgSend(v5, "pressedStepping");

}

- (void)_pressedRoutePlanning
{
  id v3;
  NSObject *v4;
  dispatch_time_t v5;
  void *v6;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = sub_1004320DC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "pressed route planning", buf, 2u);
  }

  -[UIButton setEnabled:](self->_directionsButton, "setEnabled:", 0);
  v5 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100996C54;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteCardView delegate](self, "delegate"));
  objc_msgSend(v6, "pressedRoutePlanning");

}

- (void)_pressedSaveToLibrary
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_1004320DC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "pressed save to library", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteCardView delegate](self, "delegate"));
  objc_msgSend(v5, "pressedSaveToLibrary");

}

- (void)_unitsDidChange
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  self->_isMetric = objc_msgSend(v3, "_navigation_distanceUsesMetricSystem");

  -[MapsCustomRouteCardView _updateGraphView](self, "_updateGraphView");
}

- (void)_updateGraphView
{
  void *v3;
  UIViewController *graphViewController;
  double v5;
  NSNumber *v6;
  NSNumber *renderedGraphWidth;
  void *v8;
  void *v9;
  _BOOL8 isMetric;
  void *v11;
  UIViewController *v12;
  UIViewController *v13;
  UIViewController *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
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
  void **v33;
  id v34;
  NSObject *v35;
  id v36;
  char *v37;
  double v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  CGRect v55;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_graphViewController, "view"));
  objc_msgSend(v3, "removeFromSuperview");

  graphViewController = self->_graphViewController;
  self->_graphViewController = 0;

  -[MapsCustomRouteCardView frame](self, "frame");
  v5 = CGRectGetWidth(v55) + -32.0;
  if (v5 >= 2.22044605e-16)
  {
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v5));
    renderedGraphWidth = self->_renderedGraphWidth;
    self->_renderedGraphWidth = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsElevationChartStyle navigationLineStyle](_TtC4Maps23MapsElevationChartStyle, "navigationLineStyle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute elevationProfile](self->_route, "elevationProfile"));
    isMetric = self->_isMetric;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteCardView traitCollection](self, "traitCollection"));
    v12 = (UIViewController *)objc_claimAutoreleasedReturnValue(+[MapsElevationGraphViewController makeHostingControllerFor:width:isMetric:traitCollection:shouldHighlight:chartStyle:currentPosition:](_TtC4Maps32MapsElevationGraphViewController, "makeHostingControllerFor:width:isMetric:traitCollection:shouldHighlight:chartStyle:currentPosition:", v9, isMetric, v11, 0, v8, self->_zeroMeters, v5));
    v13 = self->_graphViewController;
    self->_graphViewController = v12;

    v14 = self->_graphViewController;
    if (v14)
    {
      v45 = v8;
      v15 = objc_claimAutoreleasedReturnValue(-[UIViewController view](v14, "view"));
      -[NSObject setTranslatesAutoresizingMaskIntoConstraints:](v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[NSObject setUserInteractionEnabled:](v15, "setUserInteractionEnabled:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      -[NSObject setBackgroundColor:](v15, "setBackgroundColor:", v16);

      -[UIView addSubview:](self->_summaryContainer, "addSubview:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute elevationProfile](self->_route, "elevationProfile"));
      v40 = objc_msgSend(v17, "isValid");

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute elevationProfile](self->_route, "elevationProfile"));
      v19 = 0.0;
      if (objc_msgSend(v18, "isValid"))
        v20 = 82.0;
      else
        v20 = 0.0;

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute elevationProfile](self->_route, "elevationProfile"));
      if (objc_msgSend(v21, "isValid"))
        v19 = 10.0;

      v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject leadingAnchor](v15, "leadingAnchor"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_summaryContainer, "leadingAnchor"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v43));
      v48[0] = v42;
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject trailingAnchor](v15, "trailingAnchor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_summaryContainer, "trailingAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v22));
      v48[1] = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject heightAnchor](v15, "heightAnchor"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToConstant:", v20));
      v48[2] = v25;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject topAnchor](v15, "topAnchor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeMultiPartLabel bottomAnchor](self->_descriptionLabel, "bottomAnchor"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, v19));
      v48[3] = v28;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);

      if (-[GEOComposedRoute source](self->_route, "source") == (id)2)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bottomAnchor](v15, "bottomAnchor"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView topAnchor](self->_disclaimerLabel, "topAnchor"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v31));
        v46 = v32;
        v33 = &v46;
      }
      else
      {
        if (v40)
          v38 = -8.0;
        else
          v38 = -3.0;
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bottomAnchor](v15, "bottomAnchor"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_summaryContainer, "bottomAnchor"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, v38));
        v47 = v32;
        v33 = &v47;
      }
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 1));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v39);

      v8 = v45;
    }
    else
    {
      v34 = sub_1004318FC();
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v50 = "-[MapsCustomRouteCardView _updateGraphView]";
        v51 = 2080;
        v52 = "MapsCustomRouteCardView.m";
        v53 = 1024;
        v54 = 288;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
      }

      if (!sub_100A70734())
        goto LABEL_21;
      v36 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v37 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v50 = v37;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }

LABEL_21:
  }
}

- (void)_updateDisclaimerLabel
{
  id v3;
  NSLayoutConstraint *disclaimerLabelBottomConstraint;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
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
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[2];
  _QWORD v39[2];

  v3 = -[GEOComposedRoute source](self->_route, "source");
  disclaimerLabelBottomConstraint = self->_disclaimerLabelBottomConstraint;
  if (v3 == (id)2)
  {
    -[NSLayoutConstraint setActive:](disclaimerLabelBottomConstraint, "setActive:", 1);
    -[UITextView setAlpha:](self->_disclaimerLabel, "setAlpha:", 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute disclaimerText](self->_route, "disclaimerText"));
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[Curated route viewing] Safety disclaimer text"), CFSTR("localized string not found"), 0));

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute disclaimerURL](self->_route, "disclaimerURL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayTitle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("[Curated route viewing] Learn more tappable link"), CFSTR("localized string not found"), 0));

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("[Curated route viewing] Safety disclaimer concatination"), CFSTR("localized string not found"), 0));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v7, v13));

    v17 = v7;
    v38[0] = NSFontAttributeName;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleFootnote, UIFontWeightMedium));
    v39[0] = v18;
    v38[1] = NSForegroundColorAttributeName;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v39[1] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 2));

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute storageID](self->_route, "storageID"));
    v22 = objc_alloc((Class)NSMutableAttributedString);
    if (v21)
    {
      v23 = objc_msgSend(v22, "initWithString:attributes:", v7, v20);
    }
    else
    {
      v23 = objc_msgSend(v22, "initWithString:attributes:", v35, v20);
      v24 = objc_msgSend(v35, "rangeOfString:", v13);
      v33 = v25;
      v34 = v24;
      v36[0] = NSForegroundColorAttributeName;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
      v37[0] = v26;
      v36[1] = NSFontAttributeName;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleFootnote, UIFontWeightSemibold));
      v37[1] = v27;
      v36[2] = NSLinkAttributeName;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute disclaimerURL](self->_route, "disclaimerURL"));
      v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "url"));
      v30 = (void *)v29;
      v31 = CFSTR("https://nps.gov");
      if (v29)
        v31 = (const __CFString *)v29;
      v37[2] = v31;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 3));

      objc_msgSend(v23, "setAttributes:range:", v32, v34, v33);
    }
    -[UITextView setAttributedText:](self->_disclaimerLabel, "setAttributedText:", v23);

  }
  else
  {
    -[NSLayoutConstraint setActive:](disclaimerLabelBottomConstraint, "setActive:", 0);
    -[UITextView setAlpha:](self->_disclaimerLabel, "setAlpha:", 0.0);
  }
}

- (void)_updateDirectionsButtonWithSuggestedMode:(unint64_t)a3
{
  void *v5;
  UIButton *directionsButton;
  void *v7;
  void *v8;
  UIButton *v9;
  const char *v10;
  void *v11;
  char BOOL;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  UIButton *v21;
  void *v22;
  void *v23;
  UIButton *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  const char *v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  uint8_t buf[16];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration _maps_primaryCardFooterActionButtonConfiguration](UIButtonConfiguration, "_maps_primaryCardFooterActionButtonConfiguration"));
  if (!a3)
  {
LABEL_12:
    v27 = sub_1004320DC();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v29 = "Hiding stepping button because it is not supported";
LABEL_19:
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, v29, buf, 2u);
    goto LABEL_20;
  }
  if (a3 != 1)
  {
    if (a3 == 4)
    {
      if ((GEOConfigGetBOOL(MapsConfig_RouteCreationAvailable, off_1014B55A8) & 1) != 0)
      {
        directionsButton = self->_directionsButton;
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Directions"), CFSTR("localized string not found"), 0));
        -[UIButton setTitle:forState:](directionsButton, "setTitle:forState:", v8, 0);

        -[UIButton removeTarget:action:forControlEvents:](self->_directionsButton, "removeTarget:action:forControlEvents:", self, 0, 64);
        v9 = self->_directionsButton;
        v10 = "_pressedRoutePlanning";
LABEL_11:
        -[UIButton addTarget:action:forControlEvents:](v9, "addTarget:action:forControlEvents:", self, v10, 64);
        -[MultilineStackView addArrangedSubview:](self->_buttonStackView, "addArrangedSubview:", self->_directionsButton);
        goto LABEL_21;
      }
      v31 = sub_1004320DC();
      v28 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v29 = "Hiding route planning button because it is not supported";
        goto LABEL_19;
      }
LABEL_20:

      -[MultilineStackView removeArrangedSubview:](self->_buttonStackView, "removeArrangedSubview:", self->_directionsButton);
      goto LABEL_21;
    }
    if ((GEOConfigGetBOOL(MapsConfig_RouteCreationAvailable, off_1014B55A8) & 1) != 0)
    {
      v24 = self->_directionsButton;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Directions"), CFSTR("localized string not found"), 0));
      -[UIButton setTitle:forState:](v24, "setTitle:forState:", v26, 0);

      -[UIButton removeTarget:action:forControlEvents:](self->_directionsButton, "removeTarget:action:forControlEvents:", self, 0, 64);
      v9 = self->_directionsButton;
      v10 = "_pressedStepping";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  if (!objc_msgSend(v11, "supportsNavigation"))
  {

    goto LABEL_15;
  }
  BOOL = GEOConfigGetBOOL(MapsConfig_RouteCreationAvailable, off_1014B55A8);

  if ((BOOL & 1) == 0)
  {
LABEL_15:
    v30 = sub_1004320DC();
    v28 = objc_claimAutoreleasedReturnValue(v30);
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v29 = "Hiding GO button because it is not supported";
    goto LABEL_19;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "background"));
  objc_msgSend(v14, "setBackgroundColor:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleTitle3, UIFontWeightBold));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_cappedFont:withMaxPoint:](UIFont, "_maps_cappedFont:withMaxPoint:", v15, 34.0));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fontDescriptor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fontDescriptorWithDesign:", UIFontDescriptorSystemDesignRounded));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v18, 0.0));

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100997B78;
  v32[3] = &unk_1011AFCC0;
  v33 = v19;
  v20 = v19;
  objc_msgSend(v5, "setTitleTextAttributesTransformer:", v32);
  v21 = self->_directionsButton;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("[Route Creation] GO"), CFSTR("localized string not found"), 0));
  -[UIButton setTitle:forState:](v21, "setTitle:forState:", v23, 0);

  -[UIButton removeTarget:action:forControlEvents:](self->_directionsButton, "removeTarget:action:forControlEvents:", self, 0, 64);
  -[UIButton addTarget:action:forControlEvents:](self->_directionsButton, "addTarget:action:forControlEvents:", self, "_pressedNav", 64);
  -[MultilineStackView addArrangedSubview:](self->_buttonStackView, "addArrangedSubview:", self->_directionsButton);

LABEL_21:
  -[UIButton setConfiguration:](self->_directionsButton, "setConfiguration:", v5);
  -[MultilineStackView invalidateLayout](self->_buttonStackView, "invalidateLayout");

}

- (void)updateButtons
{
  void *v3;
  id v4;
  _QWORD *v5;
  char BOOL;
  GEOComposedRoute *route;
  void *v8;
  _BOOL4 v9;
  unint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  char *v16;
  void *v17;
  _BOOL4 v18;
  id v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id location;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  void *v34;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (self->_route)
  {
    objc_initWeak(&location, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100997F80;
    v21[3] = &unk_1011AD1E8;
    objc_copyWeak(&v23, &location);
    v4 = v3;
    v22 = v4;
    v5 = objc_retainBlock(v21);
    BOOL = GEOConfigGetBOOL(MapsConfig_RouteCreationAvailable, off_1014B55A8);
    route = self->_route;
    if ((BOOL & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute storageID](route, "storageID"));
      v9 = v8 == 0;

      if (v9)
      {
        ((void (*)(_QWORD *))v5[2])(v5);
      }
      else
      {
        v10 = self->_offlineDownloadButtonMode - 2;
        if (v10 <= 2)
          objc_msgSend(v4, "addObject:", *(Class *)((char *)&self->super.super.super.isa + *off_1011DD730[v10]));
      }
      objc_msgSend(v4, "addObject:", self->_directionsButton);
      -[MultilineStackView setArrangedSubviews:](self->_buttonStackView, "setArrangedSubviews:", v4);
      v19 = sub_1004320DC();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v26 = (const char *)v4;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Setting buttons list to %{public}@", buf, 0xCu);
      }

    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute storageID](route, "storageID"));
      v18 = v17 == 0;

      if (v18)
      {
        ((void (*)(_QWORD *))v5[2])(v5);
        -[MultilineStackView setArrangedSubviews:](self->_buttonStackView, "setArrangedSubviews:", v4);
      }
      else
      {
        -[MultilineStackView setArrangedSubviews:](self->_buttonStackView, "setArrangedSubviews:", &__NSArray0__struct);
      }
    }

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    v11 = sub_1004318FC();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("A route is required before we can show buttons in MapsCustomRouteCardView.")));
      *(_DWORD *)buf = 136316162;
      v26 = "-[MapsCustomRouteCardView updateButtons]";
      v27 = 2080;
      v28 = "MapsCustomRouteCardView.m";
      v29 = 1024;
      v30 = 426;
      v31 = 2080;
      v32 = "_route != nil";
      v33 = 2112;
      v34 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);

    }
    if (sub_100A70734())
    {
      v14 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v26 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    -[MultilineStackView setArrangedSubviews:](self->_buttonStackView, "setArrangedSubviews:", &__NSArray0__struct);
  }

}

- (void)setButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  _DWORD v7[2];

  v3 = a3;
  v5 = sub_1004320DC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Setting buttons enabled %d", (uint8_t *)v7, 8u);
  }

  -[UIButton setEnabled:](self->_saveToLibraryButton, "setEnabled:", v3);
  -[UIButton setEnabled:](self->_directionsButton, "setEnabled:", v3);
}

- (void)setRoute:(id)a3
{
  id v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void ***v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void **v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *);
  void *v31;
  id v32;
  id v33;
  id location;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];

  v5 = a3;
  objc_storeStrong((id *)&self->_route, a3);
  objc_msgSend(v5, "distance");
  v7 = v6;
  v37[0] = NSFontAttributeName;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleTitle2, UIFontWeightSemibold));
  v38[0] = v8;
  v37[1] = NSForegroundColorAttributeName;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v38[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v37, 2));
  v11 = sub_1009005D8(v10, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[UILabel setAttributedText:](self->_distanceLabel, "setAttributedText:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "previewDurationString"));
  objc_msgSend(v5, "travelAndChargingDuration");
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "elevationProfile"));
  v35[0] = NSFontAttributeName;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  v35[1] = NSForegroundColorAttributeName;
  v36[0] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v36[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 2));
  v20 = sub_100900648(v13, v16, v19, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  -[MapsThemeMultiPartLabel setMultiPartString:](self->_descriptionLabel, "setMultiPartString:", v21);

  -[MapsCustomRouteCardView _updateGraphView](self, "_updateGraphView");
  -[MapsCustomRouteCardView _updateDisclaimerLabel](self, "_updateDisclaimerLabel");
  objc_initWeak(&location, self);
  v28 = _NSConcreteStackBlock;
  v29 = 3221225472;
  v30 = sub_100998484;
  v31 = &unk_1011DD078;
  objc_copyWeak(&v33, &location);
  v22 = v5;
  v32 = v22;
  v23 = objc_retainBlock(&v28);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager", v28, v29, v30, v31));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "lastLocation"));
  ((void (*)(void ***, void *, _QWORD))v23[2])(v23, v25, 0);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "singleLocationUpdateWithHandler:", v23));

  objc_msgSend(v27, "start");
  -[MapsCustomRouteCardView _updateOfflineSubscription](self, "_updateOfflineSubscription");

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

}

- (void)layoutSubviews
{
  NSNumber *renderedGraphWidth;
  double v4;
  double v5;
  MapsCustomRouteCardViewDelegate **p_delegate;
  id WeakRetained;
  char v8;
  id v9;
  objc_super v10;
  CGRect v11;

  v10.receiver = self;
  v10.super_class = (Class)MapsCustomRouteCardView;
  -[MapsCustomRouteCardView layoutSubviews](&v10, "layoutSubviews");
  renderedGraphWidth = self->_renderedGraphWidth;
  if (!renderedGraphWidth
    || (-[NSNumber cgFloatValue](renderedGraphWidth, "cgFloatValue"),
        v5 = v4,
        -[MapsCustomRouteCardView frame](self, "frame"),
        vabdd_f64(v5, CGRectGetWidth(v11)) >= 1.0))
  {
    -[MapsCustomRouteCardView _updateGraphView](self, "_updateGraphView");
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    v8 = objc_opt_respondsToSelector(WeakRetained, "didUpdateLayout");

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v9, "didUpdateLayout");

    }
  }
}

- (void)_updateOfflineSubscription
{
  GEOComposedRoute *route;
  void *v4;
  void *v5;
  void *v6;
  MapDataSubscriptionInfo *v7;
  MapDataSubscriptionInfo **p_offlineSubscription;
  MapDataSubscriptionInfo *offlineSubscription;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];

  route = self->_route;
  if (route)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute boundingMapRegion](route, "boundingMapRegion"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapRegion _maps_offlineCoverageRegionForRouteBounds:](GEOMapRegion, "_maps_offlineCoverageRegionForRouteBounds:", v4));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    v7 = (MapDataSubscriptionInfo *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subscriptionInfoForRegion:", v5));

  }
  else
  {
    v7 = 0;
  }
  p_offlineSubscription = &self->_offlineSubscription;
  offlineSubscription = self->_offlineSubscription;
  if (v7 != offlineSubscription)
  {
    if (offlineSubscription)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v10 = objc_msgSend(&off_1012740D0, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v23;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v23 != v12)
              objc_enumerationMutation(&off_1012740D0);
            -[MapDataSubscriptionInfo removeObserver:forKeyPath:context:](*p_offlineSubscription, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v13), off_1014B7FD0);
            v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          v11 = objc_msgSend(&off_1012740D0, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v11);
      }
    }
    objc_storeStrong((id *)&self->_offlineSubscription, v7);
    if (*p_offlineSubscription)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v14 = objc_msgSend(&off_1012740E8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v19;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v19 != v16)
              objc_enumerationMutation(&off_1012740E8);
            -[MapDataSubscriptionInfo addObserver:forKeyPath:options:context:](*p_offlineSubscription, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v17), 0, off_1014B7FD0);
            v17 = (char *)v17 + 1;
          }
          while (v15 != v17);
          v15 = objc_msgSend(&off_1012740E8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        }
        while (v15);
      }
    }
  }
  -[MapsCustomRouteCardView _updateOfflineButtonIfNecessary](self, "_updateOfflineButtonIfNecessary");

}

- (void)_updateOfflineButtonIfNecessary
{
  MapDataSubscriptionInfo *v3;
  uint64_t v4;
  void *v5;
  id v6;
  int64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  UIButton *v13;
  MapsProgressButton *v14;
  MapsProgressButton *v15;
  void *v16;
  void *v17;
  UIButton *v18;
  UIButton *v19;
  int64_t offlineDownloadButtonMode;
  UIButton *v21;
  void *v22;
  void *v23;
  UIButton *v24;
  uint64_t v25;
  UIButton *offlineDownloadButton;
  void *v27;
  double v28;
  void *v29;
  MapsProgressButton *v30;
  MapsProgressButton *offlineDownloadProgressButton;
  UIButton *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  id location;

  v3 = self->_offlineSubscription;
  if (!GEOSupportsOfflineMaps(v3, v4))
    goto LABEL_4;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionInfo state](v3, "state"));
    v6 = objc_msgSend(v5, "loadState");

    if (v6)
    {
LABEL_4:
      v7 = 1;
      goto LABEL_11;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionInfo state](v3, "state"));
    v9 = objc_msgSend(v8, "downloadState");

    v7 = 2;
    switch((unint64_t)v9)
    {
      case 0uLL:
        break;
      case 1uLL:
      case 5uLL:
        v7 = 3;
        break;
      case 2uLL:
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionInfo state](v3, "state"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "downloadProgress"));
        v12 = objc_msgSend(v11, "isIndeterminate");

        if (v12)
          v7 = 3;
        else
          v7 = 4;
        break;
      default:
        goto LABEL_4;
    }
  }
  else
  {
    v7 = 2;
  }
LABEL_11:

  if (v7 == self->_offlineDownloadButtonMode)
    goto LABEL_26;
  self->_offlineDownloadButtonMode = v7;
  if ((unint64_t)(v7 - 2) >= 2)
  {
    if (v7 == 4)
    {
      offlineDownloadButton = self->_offlineDownloadButton;
      self->_offlineDownloadButton = 0;

      if (!self->_offlineDownloadProgressButton)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration _maps_secondaryCardFooterActionButtonConfiguration](UIButtonConfiguration, "_maps_secondaryCardFooterActionButtonConfiguration"));
        objc_msgSend(v27, "setTitleTextAttributesTransformer:", &stru_1011DD710);
        objc_msgSend(v27, "contentInsets");
        objc_msgSend(v27, "setContentInsets:", v28 + -4.0);
        objc_initWeak(&location, self);
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_100998E40;
        v41[3] = &unk_1011AF8A0;
        objc_copyWeak(&v42, &location);
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v41));
        v30 = (MapsProgressButton *)objc_claimAutoreleasedReturnValue(+[MapsProgressButton buttonWithConfiguration:primaryAction:](MapsProgressButton, "buttonWithConfiguration:primaryAction:", v27, v29));
        offlineDownloadProgressButton = self->_offlineDownloadProgressButton;
        self->_offlineDownloadProgressButton = v30;

        -[MapsProgressButton setProgressStyle:](self->_offlineDownloadProgressButton, "setProgressStyle:", 1);
        -[MapsProgressButton setFillStyle:](self->_offlineDownloadProgressButton, "setFillStyle:", 2);
        -[MapsProgressButton setAccessibilityIdentifier:](self->_offlineDownloadProgressButton, "setAccessibilityIdentifier:", CFSTR("OfflineDownloadButton"));
        objc_destroyWeak(&v42);
        objc_destroyWeak(&location);

      }
    }
    else if (v7 == 1)
    {
      v13 = self->_offlineDownloadButton;
      self->_offlineDownloadButton = 0;

      v14 = self->_offlineDownloadProgressButton;
      self->_offlineDownloadProgressButton = 0;

    }
    goto LABEL_25;
  }
  v15 = self->_offlineDownloadProgressButton;
  self->_offlineDownloadProgressButton = 0;

  if (!self->_offlineDownloadButton)
  {
    objc_initWeak(&location, self);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration _maps_secondaryCardFooterActionButtonConfiguration](UIButtonConfiguration, "_maps_secondaryCardFooterActionButtonConfiguration"));
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100998D78;
    v43[3] = &unk_1011AF8A0;
    objc_copyWeak(&v44, &location);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v43));
    v18 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v16, v17));
    v19 = self->_offlineDownloadButton;
    self->_offlineDownloadButton = v18;

    -[UIButton setAccessibilityIdentifier:](self->_offlineDownloadButton, "setAccessibilityIdentifier:", CFSTR("OfflineDownloadButton"));
    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
  }
  offlineDownloadButtonMode = self->_offlineDownloadButtonMode;
  if (offlineDownloadButtonMode == 2)
  {
    v32 = self->_offlineDownloadButton;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("ROUTE_CREATION_OFFLINE_DOWNLOAD_MAP"), CFSTR("localized string not found"), CFSTR("Offline")));
    -[UIButton setTitle:forState:](v32, "setTitle:forState:", v34, 0);

    v24 = self->_offlineDownloadButton;
    v25 = 1;
    goto LABEL_24;
  }
  if (offlineDownloadButtonMode == 3)
  {
    v21 = self->_offlineDownloadButton;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("ROUTE_CREATION_OFFLINE_DOWNLOAD_WAITING"), CFSTR("localized string not found"), CFSTR("Offline")));
    -[UIButton setTitle:forState:](v21, "setTitle:forState:", v23, 0);

    v24 = self->_offlineDownloadButton;
    v25 = 0;
LABEL_24:
    -[UIButton setEnabled:](v24, "setEnabled:", v25);
  }
LABEL_25:
  -[MapsCustomRouteCardView updateButtons](self, "updateButtons");
  v7 = self->_offlineDownloadButtonMode;
LABEL_26:
  if (v7 == 4)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionInfo state](self->_offlineSubscription, "state"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "downloadProgress"));

    objc_msgSend(v36, "fractionCompleted");
    -[MapsProgressButton setProgress:](self->_offlineDownloadProgressButton, "setProgress:");
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "byteCompletedCount"));
    if (v37)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "byteCompletedCount"));
      v39 = objc_msgSend(v38, "longLongValue");

    }
    else
    {
      v39 = objc_msgSend(v36, "completedUnitCount");
    }

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[MKRoundingByteCountFormatter stringFromByteCountWithRoundingTo1MB:](MKRoundingByteCountFormatter, "stringFromByteCountWithRoundingTo1MB:", v39));
    -[MapsProgressButton setTitle:forState:](self->_offlineDownloadProgressButton, "setTitle:forState:", v40, 0);

  }
}

- (void)_pressedOfflineDownloadButton
{
  id v3;
  NSObject *v4;
  MapDataSubscriptionInfo *offlineSubscription;
  id WeakRetained;
  void *v7;
  uint8_t v8[16];

  v3 = sub_1004320DC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "pressed offline download button", v8, 2u);
  }

  offlineSubscription = self->_offlineSubscription;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = WeakRetained;
  if (offlineSubscription)
    objc_msgSend(WeakRetained, "pressedOfflineDataManagement");
  else
    objc_msgSend(WeakRetained, "pressedOfflineDownload");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;
  _QWORD block[4];
  id v8;
  id location;

  if (off_1014B7FD0 == a6)
  {
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100998FC8;
    block[3] = &unk_1011AD260;
    objc_copyWeak(&v8, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MapsCustomRouteCardView;
    -[MapsCustomRouteCardView observeValueForKeyPath:ofObject:change:context:](&v6, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (a3.var0 == (_DWORD)MapsConfig_RouteCreationAvailable && a3.var1 == off_1014B55A8)
    -[MapsCustomRouteCardView updateButtons](self, "updateButtons");
}

- (MapsCustomRouteCardViewDelegate)delegate
{
  return (MapsCustomRouteCardViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_offlineDownloadProgressButton, 0);
  objc_storeStrong((id *)&self->_offlineDownloadButton, 0);
  objc_storeStrong((id *)&self->_offlineSubscription, 0);
  objc_storeStrong((id *)&self->_saveToLibraryButton, 0);
  objc_storeStrong((id *)&self->_directionsButton, 0);
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_graphViewController, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_disclaimerLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_disclaimerLabel, 0);
  objc_storeStrong((id *)&self->_distanceLabel, 0);
  objc_storeStrong((id *)&self->_summaryContainer, 0);
  objc_storeStrong((id *)&self->_renderedGraphWidth, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_zeroMeters, 0);
}

@end
