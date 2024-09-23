@implementation OfflineMapDeviceDetailsSectionController

+ (id)_keyPathsToObserve
{
  return &off_1012737D0;
}

- (OfflineMapDeviceDetailsSectionController)initWithSubscriptionInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  OfflineMapDeviceDetailsSectionController *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v7 = -[OfflineMapDeviceDetailsSectionController initWithSubscriptionInfo:deviceName:](self, "initWithSubscriptionInfo:deviceName:", v4, v6);

  return v7;
}

- (OfflineMapDeviceDetailsSectionController)initWithSubscriptionInfo:(id)a3 deviceName:(id)a4
{
  id v6;
  OfflineMapDeviceDetailsSectionController *v7;
  NSString *v8;
  NSString *deviceName;
  OfflineMapDeviceDetailsSectionController *v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OfflineMapDeviceDetailsSectionController;
  v7 = -[OfflineMapSectionController initWithSubscriptionInfo:](&v12, "initWithSubscriptionInfo:", a3);
  if (v7)
  {
    v8 = (NSString *)objc_msgSend(v6, "copy");
    deviceName = v7->_deviceName;
    v7->_deviceName = v8;

    -[OfflineMapDeviceDetailsSectionController _commonInit](v7, "_commonInit");
    v10 = v7;
  }

  return v7;
}

- (id)_subscriptionState
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSectionController subscriptionInfo](self, "subscriptionInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "state"));

  return v3;
}

- (void)_commonInit
{
  UIView *v3;
  UIView *containerView;
  _UNKNOWN **v5;
  SectionHeaderView *v6;
  SectionHeaderView *sectionHeader;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MUPlaceVerticalCardContainerView *v16;
  MUPlaceVerticalCardContainerView *stackView;
  double v18;
  MUPlaceSectionView *v19;
  MUPlaceSectionView *sectionView;
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
  OfflineMapDeviceStateRowView *v36;
  OfflineMapDeviceStateRowView *stateRow;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  _QWORD v49[2];
  _QWORD v50[3];
  _QWORD v51[4];

  v3 = (UIView *)objc_alloc_init((Class)UIView);
  containerView = self->_containerView;
  self->_containerView = v3;

  v5 = MKPlaceCollectionsLogicController_ptr;
  if (MapsFeature_IsEnabled_StandaloneWatchOffline(-[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0)))
  {
    v6 = objc_alloc_init(SectionHeaderView);
    sectionHeader = self->_sectionHeader;
    self->_sectionHeader = v6;

    -[SectionHeaderView setTitle:](self->_sectionHeader, "setTitle:", self->_deviceName);
    -[SectionHeaderView setFirstNonEmptySection:](self->_sectionHeader, "setFirstNonEmptySection:", 1);
    -[SectionHeaderView setShowsBottomHairline:](self->_sectionHeader, "setShowsBottomHairline:", 0);
    -[SectionHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_sectionHeader, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = objc_alloc_init((Class)UIView);
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v8, "addSubview:", self->_sectionHeader);
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView topAnchor](self->_sectionHeader, "topAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v45));
    v51[0] = v43;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView leadingAnchor](self->_sectionHeader, "leadingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:constant:", v39, 16.0));
    v51[1] = v38;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView trailingAnchor](self->_sectionHeader, "trailingAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
    v51[2] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView bottomAnchor](self->_sectionHeader, "bottomAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
    v51[3] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

    v5 = MKPlaceCollectionsLogicController_ptr;
    v48 = v8;
    -[UIView addSubview:](self->_containerView, "addSubview:", v8);
  }
  else
  {
    v48 = 0;
  }
  v16 = (MUPlaceVerticalCardContainerView *)objc_msgSend(objc_alloc((Class)MUPlaceVerticalCardContainerView), "initWithShowsSeparators:", 1);
  stackView = self->_stackView;
  self->_stackView = v16;

  -[MUPlaceVerticalCardContainerView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v18) = 1148846080;
  -[MUPlaceVerticalCardContainerView setContentHuggingPriority:forAxis:](self->_stackView, "setContentHuggingPriority:forAxis:", 1, v18);
  v19 = (MUPlaceSectionView *)objc_claimAutoreleasedReturnValue(+[MUPlaceSectionView cardShadowSectionViewForContentView:sectionHeaderViewModel:](MUPlaceSectionView, "cardShadowSectionViewForContentView:sectionHeaderViewModel:", self->_stackView, 0));
  sectionView = self->_sectionView;
  self->_sectionView = v19;

  -[MUPlaceSectionView setTranslatesAutoresizingMaskIntoConstraints:](self->_sectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_sectionView);
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MUPlaceSectionView leadingAnchor](self->_sectionView, "leadingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_containerView, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v42));
  v50[0] = v40;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MUPlaceSectionView trailingAnchor](self->_sectionView, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_containerView, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
  v50[1] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MUPlaceSectionView bottomAnchor](self->_sectionView, "bottomAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_containerView, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
  v50[2] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5[304], "arrayWithObjects:count:", v50, 3));
  v46 = objc_msgSend(v27, "mutableCopy");

  if (v48)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "topAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_containerView, "topAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v29));
    v49[0] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MUPlaceSectionView topAnchor](self->_sectionView, "topAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "bottomAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v32));
    v49[1] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v49, 2));
    v35 = v46;
    objc_msgSend(v46, "addObjectsFromArray:", v34);

  }
  else
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MUPlaceSectionView topAnchor](self->_sectionView, "topAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_containerView, "topAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v29));
    v35 = v46;
    objc_msgSend(v46, "addObject:", v30);
  }

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v35);
  v36 = -[OfflineMapDeviceStateRowView initWithFrame:]([OfflineMapDeviceStateRowView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  stateRow = self->_stateRow;
  self->_stateRow = v36;

  -[OfflineMapDeviceStateRowView setAccessibilityIdentifier:](self->_stateRow, "setAccessibilityIdentifier:", CFSTR("DownloadStateRowView"));
  -[OfflineMapDeviceDetailsSectionController _updateStateRow](self, "_updateStateRow");
  -[OfflineMapDeviceDetailsSectionController _updateRowViews](self, "_updateRowViews");
  -[OfflineMapDeviceDetailsSectionController _registerKVOObservers](self, "_registerKVOObservers");

}

- (void)dealloc
{
  objc_super v3;

  -[OfflineMapDeviceDetailsSectionController _unregisterKVOObservers](self, "_unregisterKVOObservers");
  v3.receiver = self;
  v3.super_class = (Class)OfflineMapDeviceDetailsSectionController;
  -[OfflineMapDeviceDetailsSectionController dealloc](&v3, "dealloc");
}

- (void)_registerKVOObservers
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSectionController subscriptionInfo](self, "subscriptionInfo"));
  if (v3)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = objc_msgSend((id)objc_opt_class(self), "_keyPathsToObserve", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), 0, off_1014AC4D8);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)_unregisterKVOObservers
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSectionController subscriptionInfo](self, "subscriptionInfo"));
  if (v3)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = objc_msgSend((id)objc_opt_class(self), "_keyPathsToObserve", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), off_1014AC4D8);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)setSubscriptionInfo:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapSectionController subscriptionInfo](self, "subscriptionInfo"));

  if (v5 != v4)
  {
    -[OfflineMapDeviceDetailsSectionController _unregisterKVOObservers](self, "_unregisterKVOObservers");
    v6.receiver = self;
    v6.super_class = (Class)OfflineMapDeviceDetailsSectionController;
    -[OfflineMapSectionController setSubscriptionInfo:](&v6, "setSubscriptionInfo:", v4);
    -[OfflineMapDeviceDetailsSectionController _registerKVOObservers](self, "_registerKVOObservers");
  }

}

- (id)sectionView
{
  return self->_containerView;
}

- (void)setLastUpdatedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdatedDate, a3);
  -[OfflineMapDeviceDetailsSectionController _updateStateRow](self, "_updateStateRow");
}

- (void)_updateRowViews
{
  void *v3;
  void *v4;
  void *v5;
  char *v6;
  unint64_t v7;
  id *p_waitingReasonRow;
  OfflineMapDeviceExplanatoryRowView *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  double y;
  double width;
  double height;
  void *i;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDeviceDetailsSectionController _subscriptionState](self, "_subscriptionState"));
  v5 = v4;
  if (v4)
  {
    v6 = (char *)objc_msgSend(v4, "loadState");
    if ((unint64_t)(v6 - 1) < 2)
      goto LABEL_11;
    if (v6 == (char *)3 || !v6)
    {
      v7 = (unint64_t)objc_msgSend(v5, "downloadState");
      if (v7 <= 5)
      {
        if (((1 << v7) & 0x31) != 0)
        {
          p_waitingReasonRow = (id *)&self->_waitingReasonRow;
          if (!self->_waitingReasonRow)
          {
            v9 = objc_alloc_init(OfflineMapDeviceExplanatoryRowView);
            v10 = *p_waitingReasonRow;
            *p_waitingReasonRow = v9;

            objc_msgSend(*p_waitingReasonRow, "setAccessibilityIdentifier:", CFSTR("WaitingRowView"));
          }
          v11 = objc_msgSend(v5, "downloadState");
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", GEOMapDataSubscriptionStateWaitingReasonKey));
          v14 = objc_msgSend(v13, "unsignedIntegerValue");
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
          -[OfflineMapDeviceDetailsSectionController _updateWaitingRowWithDownloadState:waitingReasons:userInfo:](self, "_updateWaitingRowWithDownloadState:waitingReasons:userInfo:", v11, v14, v15);

          goto LABEL_12;
        }
        if (((1 << v7) & 6) == 0)
          goto LABEL_13;
LABEL_11:
        -[OfflineMapDeviceDetailsSectionController _updateStateRow](self, "_updateStateRow");
        p_waitingReasonRow = (id *)&self->_stateRow;
LABEL_12:
        objc_msgSend(v3, "addObject:", *p_waitingReasonRow);
      }
    }
  }
LABEL_13:
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDeviceDetailsSectionController _actions](self, "_actions"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v27;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v16);
        v24 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v25 = objc_msgSend(objc_alloc((Class)MUButtonCellRowView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
        objc_msgSend(v25, "setViewModel:", v24);
        objc_msgSend(v3, "addObject:", v25);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v18);
  }
  -[MUPlaceVerticalCardContainerView setRowViews:](self->_stackView, "setRowViews:", v3);

}

- (id)_actions
{
  return &__NSArray0__struct;
}

- (void)_updateStateRow
{
  void *v3;
  char *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSRelativeDateTimeFormatter *v11;
  NSRelativeDateTimeFormatter *dateTimeFormatter;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  MUCircleProgressObservingView *progressView;
  MUCircleProgressObservingView *v26;
  MUCircleProgressObservingView *v27;
  void *v28;
  void *v29;
  NSRelativeDateTimeFormatter *v30;
  void *v31;
  void **v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  id v36;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDeviceDetailsSectionController _subscriptionState](self, "_subscriptionState"));
  v4 = (char *)objc_msgSend(v3, "loadState");
  if ((unint64_t)(v4 - 1) < 2)
  {
    if (!self->_dateTimeFormatter)
    {
      v11 = (NSRelativeDateTimeFormatter *)objc_alloc_init((Class)NSRelativeDateTimeFormatter);
      dateTimeFormatter = self->_dateTimeFormatter;
      self->_dateTimeFormatter = v11;

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](NSLocale, "autoupdatingCurrentLocale"));
      -[NSRelativeDateTimeFormatter setLocale:](self->_dateTimeFormatter, "setLocale:", v13);

      -[NSRelativeDateTimeFormatter setDateTimeStyle:](self->_dateTimeFormatter, "setDateTimeStyle:", 1);
      -[NSRelativeDateTimeFormatter setFormattingContext:](self->_dateTimeFormatter, "setFormattingContext:", 2);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Last Updated [Offline Maps Details]"), CFSTR("localized string not found"), CFSTR("Offline")));
    -[OfflineMapDeviceStateRowView setLabelText:](self->_stateRow, "setLabelText:", v15);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapDeviceDetailsSectionController lastUpdatedDate](self, "lastUpdatedDate"));
    if (v7)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v16, "timeIntervalSinceDate:", v7);
      v18 = v17;

      if (v18 >= 60.0)
      {
        v30 = self->_dateTimeFormatter;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
        v22 = objc_claimAutoreleasedReturnValue(-[NSRelativeDateTimeFormatter localizedStringForDate:relativeToDate:](v30, "localizedStringForDate:relativeToDate:", v7, v20));
        goto LABEL_20;
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v20 = v19;
      v21 = CFSTR("MAP_DETAILS_LAST_UPDATED_VALUE_JUST_NOW");
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v20 = v19;
      v21 = CFSTR("MAP_DETAILS_LAST_UPDATED_VALUE_NEVER");
    }
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", v21, CFSTR("localized string not found"), CFSTR("Offline")));
LABEL_20:
    v31 = (void *)v22;
    -[OfflineMapDeviceStateRowView setValueText:](self->_stateRow, "setValueText:", v22);

    -[OfflineMapDeviceStateRowView setTrailingAccessoryView:](self->_stateRow, "setTrailingAccessoryView:", 0);
LABEL_21:

    goto LABEL_22;
  }
  if ((v4 == (char *)3 || !v4) && (char *)objc_msgSend(v3, "downloadState") - 1 <= (char *)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("MAP_DETAILS_LOADING_STATE_LABEL"), CFSTR("localized string not found"), CFSTR("Offline")));
    -[OfflineMapDeviceStateRowView setLabelText:](self->_stateRow, "setLabelText:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "downloadProgress"));
    v8 = objc_msgSend(v3, "downloadState");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedAdditionalDescription"));
    v10 = v9;
    if (v8 == (id)1 || !objc_msgSend(v9, "length"))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("MAP_DETAILS_LOADING_STATE_VALUE_WAITING"), CFSTR("localized string not found"), CFSTR("Offline")));
      -[OfflineMapDeviceStateRowView setValueText:](self->_stateRow, "setValueText:", v24);

    }
    else
    {
      -[OfflineMapDeviceStateRowView setValueText:](self->_stateRow, "setValueText:", v10);
    }
    progressView = self->_progressView;
    if (!progressView)
    {
      v26 = (MUCircleProgressObservingView *)objc_alloc_init((Class)MUCircleProgressObservingView);
      v27 = self->_progressView;
      self->_progressView = v26;

      -[MUCircleProgressObservingView setTranslatesAutoresizingMaskIntoConstraints:](self->_progressView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 10.0));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("stop.fill"), v28));
      -[MUCircleProgressObservingView setImage:](self->_progressView, "setImage:", v29);

      -[MUCircleProgressObservingView setAccessibilityIdentifier:](self->_progressView, "setAccessibilityIdentifier:", CFSTR("DownloadProgress"));
      objc_initWeak(&location, self);
      v32 = _NSConcreteStackBlock;
      v33 = 3221225472;
      v34 = sub_10053C11C;
      v35 = &unk_1011AD260;
      objc_copyWeak(&v36, &location);
      -[MUCircleProgressObservingView setPrimaryAction:](self->_progressView, "setPrimaryAction:", &v32);
      objc_destroyWeak(&v36);
      objc_destroyWeak(&location);
      progressView = self->_progressView;
    }
    -[MUCircleProgressObservingView setProgress:](progressView, "setProgress:", v7, v32, v33, v34, v35);
    -[OfflineMapDeviceStateRowView setTrailingAccessoryView:](self->_stateRow, "setTrailingAccessoryView:", self->_progressView);

    goto LABEL_21;
  }
LABEL_22:

}

- (void)_updateWaitingRowWithDownloadState:(int64_t)a3 waitingReasons:(unint64_t)a4 userInfo:(id)a5
{
  char v5;
  id v8;
  void *v9;
  id v10;
  const __CFString *v11;
  void *v12;
  id v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;

  v5 = a4;
  v8 = a5;
  if (self->_waitingReasonRow)
  {
    v25 = v8;
    if (a3 == 4)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v10 = v9;
      v11 = CFSTR("MAP_DETAILS_STATE_DESCRIPTION_FAILED");
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", GEOMapDataSubscriptionStateWaitingMinimumBatteryLevelKey));
      v13 = objc_msgSend(v12, "unsignedIntegerValue");

      if ((v5 & 8) != 0)
      {
        v15 = MGGetBoolAnswer(CFSTR("wapi"));
        v10 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        if (v15)
          v11 = CFSTR("MAP_DETAILS_WATCH_STATE_DESCRIPTION_WAITING_PAIRED_DEVICE_WLAN");
        else
          v11 = CFSTR("MAP_DETAILS_WATCH_STATE_DESCRIPTION_WAITING_PAIRED_DEVICE_WIFI");
      }
      else
      {
        if ((v5 & 4) != 0)
        {
          v10 = objc_alloc_init((Class)NSNumberFormatter);
          objc_msgSend(v10, "setNumberStyle:", 3);
          objc_msgSend(v10, "setMaximumFractionDigits:", 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](NSLocale, "autoupdatingCurrentLocale"));
          objc_msgSend(v10, "setLocale:", v16);

          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(unint64_t)v13 / 100.0));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringFromNumber:", v17));

          LODWORD(v17) = MGGetBoolAnswer(CFSTR("wapi"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v20 = v19;
          if ((_DWORD)v17)
            v21 = CFSTR("MAP_DETAILS_WATCH_STATE_DESCRIPTION_WAITING_WLAN_POWER_MIN_BATTERY");
          else
            v21 = CFSTR("MAP_DETAILS_WATCH_STATE_DESCRIPTION_WAITING_WIFI_POWER_MIN_BATTERY");
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", v21, CFSTR("localized string not found"), CFSTR("Offline")));
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v22, v18));
          -[OfflineMapDeviceExplanatoryRowView setText:](self->_waitingReasonRow, "setText:", v23);

          goto LABEL_18;
        }
        if ((~v5 & 3) != 0)
        {
          if ((v5 & 2) != 0)
          {
            v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v10 = v9;
            v11 = CFSTR("MAP_DETAILS_WATCH_STATE_DESCRIPTION_WAITING_POWER");
            goto LABEL_17;
          }
          if ((v5 & 1) == 0)
          {
            v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v10 = v9;
            v11 = CFSTR("MAP_DETAILS_WATCH_STATE_DESCRIPTION_WAITING_GENERIC");
            goto LABEL_17;
          }
          v24 = MGGetBoolAnswer(CFSTR("wapi"));
          v10 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          if (v24)
            v11 = CFSTR("MAP_DETAILS_WATCH_STATE_DESCRIPTION_WAITING_WLAN");
          else
            v11 = CFSTR("MAP_DETAILS_WATCH_STATE_DESCRIPTION_WAITING_WIFI");
        }
        else
        {
          v14 = MGGetBoolAnswer(CFSTR("wapi"));
          v10 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          if (v14)
            v11 = CFSTR("MAP_DETAILS_WATCH_STATE_DESCRIPTION_WAITING_WLAN_POWER");
          else
            v11 = CFSTR("MAP_DETAILS_WATCH_STATE_DESCRIPTION_WAITING_WIFI_POWER");
        }
      }
      v9 = v10;
    }
LABEL_17:
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v11, CFSTR("localized string not found"), CFSTR("Offline")));
    -[OfflineMapDeviceExplanatoryRowView setText:](self->_waitingReasonRow, "setText:", v18);
LABEL_18:

    v8 = v25;
  }

}

- (void)_didStopDownload
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapDeviceDetailsSectionController actionDelegate](self, "actionDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSectionController subscriptionInfo](self, "subscriptionInfo"));
  objc_msgSend(v4, "offlineMapDetailsActionSectionControllerDidSelectPauseDownload:", v3);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if (off_1014AC4D8 == a6)
  {
    -[OfflineMapDeviceDetailsSectionController _updateRowViews](self, "_updateRowViews", a3, a4, a5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)OfflineMapDeviceDetailsSectionController;
    -[OfflineMapDeviceDetailsSectionController observeValueForKeyPath:ofObject:change:context:](&v6, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (OfflineMapDetailsActionSectionControllerDelegate)actionDelegate
{
  return (OfflineMapDetailsActionSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_waitingReasonRow, 0);
  objc_storeStrong((id *)&self->_dateTimeFormatter, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_stateRow, 0);
  objc_storeStrong((id *)&self->_sectionHeader, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end
