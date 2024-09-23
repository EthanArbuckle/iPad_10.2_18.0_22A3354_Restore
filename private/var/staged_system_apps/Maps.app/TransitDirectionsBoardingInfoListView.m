@implementation TransitDirectionsBoardingInfoListView

+ (id)defaultFinalButtonTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Transit Boarding Info] More"), CFSTR("localized string not found"), 0));

  return v3;
}

- (double)_contentBottomAnchorAdjustment
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  if (sub_1002A8AA0(self) == 5)
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  else
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  v3 = v2;
  objc_msgSend(v2, "descender");
  v5 = v4;

  return v5;
}

- (TransitDirectionsBoardingInfoListView)initWithFrame:(CGRect)a3
{
  TransitDirectionsBoardingInfoListView *v3;
  TransitDirectionsBoardingInfoListView *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSString *buttonTitle;
  UIScrollView *v11;
  UIScrollView *scrollView;
  double v13;
  UIStackView *v14;
  UIStackView *stackView;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
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
  objc_super v51;
  _QWORD v52[9];

  v51.receiver = self;
  v51.super_class = (Class)TransitDirectionsBoardingInfoListView;
  v3 = -[TransitDirectionsBoardingInfoListView initWithFrame:](&v51, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[TransitDirectionsBoardingInfoListView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    v8 = objc_msgSend((id)objc_opt_class(v4), "defaultFinalButtonTitle");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    buttonTitle = v4->_buttonTitle;
    v4->_buttonTitle = (NSString *)v9;

    v4->_scrollBehavior = 1;
    v11 = (UIScrollView *)objc_msgSend(objc_alloc((Class)UIScrollView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    scrollView = v4->_scrollView;
    v4->_scrollView = v11;

    -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](v4->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIScrollView setDelegate:](v4->_scrollView, "setDelegate:", v4);
    -[UIScrollView setDirectionalLockEnabled:](v4->_scrollView, "setDirectionalLockEnabled:", 1);
    -[UIScrollView setAlwaysBounceVertical:](v4->_scrollView, "setAlwaysBounceVertical:", 0);
    -[UIScrollView setShowsVerticalScrollIndicator:](v4->_scrollView, "setShowsVerticalScrollIndicator:", 0);
    -[UIScrollView setShowsHorizontalScrollIndicator:](v4->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
    -[UIScrollView setClipsToBounds:](v4->_scrollView, "setClipsToBounds:", 0);
    LODWORD(v13) = 1148846080;
    -[UIScrollView setContentCompressionResistancePriority:forAxis:](v4->_scrollView, "setContentCompressionResistancePriority:forAxis:", 1, v13);
    -[TransitDirectionsBoardingInfoListView addSubview:](v4, "addSubview:", v4->_scrollView);
    v14 = (UIStackView *)objc_msgSend(objc_alloc((Class)UIStackView), "initWithArrangedSubviews:", &__NSArray0__struct);
    stackView = v4->_stackView;
    v4->_stackView = v14;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v4->_stackView, "setAxis:", 0);
    -[UIStackView setAlignment:](v4->_stackView, "setAlignment:", 1);
    -[UIStackView setDistribution:](v4->_stackView, "setDistribution:", 3);
    v16 = sub_1002A8AA0(v4);
    v17 = 32.0;
    if (v16 == 5)
      v17 = 0.0;
    -[UIStackView setSpacing:](v4->_stackView, "setSpacing:", v17);
    LODWORD(v18) = 1132068864;
    -[UIStackView setContentHuggingPriority:forAxis:](v4->_stackView, "setContentHuggingPriority:forAxis:", 0, v18);
    LODWORD(v19) = 1148846080;
    -[UIStackView setContentHuggingPriority:forAxis:](v4->_stackView, "setContentHuggingPriority:forAxis:", 1, v19);
    LODWORD(v20) = 1132068864;
    -[UIStackView setContentCompressionResistancePriority:forAxis:](v4->_stackView, "setContentCompressionResistancePriority:forAxis:", 0, v20);
    LODWORD(v21) = 1148846080;
    -[UIStackView setContentCompressionResistancePriority:forAxis:](v4->_stackView, "setContentCompressionResistancePriority:forAxis:", 1, v21);
    -[UIScrollView addSubview:](v4->_scrollView, "addSubview:", v4->_stackView);
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](v4->_scrollView, "topAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoListView topAnchor](v4, "topAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v49));
    v52[0] = v48;
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](v4->_scrollView, "leadingAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoListView leadingAnchor](v4, "leadingAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v46));
    v52[1] = v45;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](v4->_scrollView, "bottomAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoListView bottomAnchor](v4, "bottomAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v43));
    v52[2] = v42;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](v4->_scrollView, "trailingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoListView trailingAnchor](v4, "trailingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
    v52[3] = v39;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v4->_stackView, "topAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](v4->_scrollView, "topAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
    v52[4] = v36;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v4->_stackView, "bottomAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](v4->_scrollView, "bottomAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
    v52[5] = v33;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v4->_stackView, "leadingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](v4->_scrollView, "leadingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v22));
    v52[6] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v4->_stackView, "trailingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](v4->_scrollView, "trailingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
    v52[7] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView heightAnchor](v4->_scrollView, "heightAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView heightAnchor](v4->_stackView, "heightAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));
    v52[8] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v52, 9));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);

  }
  return v4;
}

- (id)_scrollView
{
  return self->_scrollView;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TransitDirectionsBoardingInfoListView;
  -[TransitDirectionsBoardingInfoListView layoutSubviews](&v5, "layoutSubviews");
  if (self->_needsResetContentOffset)
  {
    self->_needsResetContentOffset = 0;
    -[UIStackView setNeedsLayout](self->_stackView, "setNeedsLayout");
    -[UIStackView layoutIfNeeded](self->_stackView, "layoutIfNeeded");
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
    -[TransitDirectionsBoardingInfoListView _targetContentOffsetForView:](self, "_targetContentOffsetForView:", v4);
    -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:");

  }
}

- (void)setBoardingInfo:(id)a3
{
  id v5;
  GEOTransitBoardingInfo *boardingInfo;
  id v7;
  unsigned int v8;
  NSArray *preboardingStrings;
  unint64_t v10;

  v5 = a3;
  boardingInfo = self->_boardingInfo;
  v10 = (unint64_t)v5;
  v7 = boardingInfo;
  if (v10 | (unint64_t)v7
    && (v8 = objc_msgSend((id)v10, "isEqual:", v7), v7, (id)v10, !v8))
  {
    objc_storeStrong((id *)&self->_boardingInfo, a3);
    preboardingStrings = self->_preboardingStrings;
    self->_preboardingStrings = 0;

    -[TransitDirectionsBoardingInfoListView _rebuildListView](self, "_rebuildListView");
  }
  else if (self->_boardingInfo)
  {
    -[TransitDirectionsBoardingInfoListView _dropPastDepartures](self, "_dropPastDepartures");
    -[TransitDirectionsBoardingInfoListView _refreshAllInfoViews](self, "_refreshAllInfoViews");
  }

}

- (void)setPreboardingStrings:(id)a3
{
  id v5;
  NSArray *preboardingStrings;
  id v7;
  unsigned int v8;
  GEOTransitBoardingInfo *boardingInfo;
  unint64_t v10;

  v5 = a3;
  preboardingStrings = self->_preboardingStrings;
  v10 = (unint64_t)v5;
  v7 = preboardingStrings;
  if (v10 | (unint64_t)v7
    && (v8 = objc_msgSend((id)v10, "isEqual:", v7), v7, (id)v10, !v8))
  {
    objc_storeStrong((id *)&self->_preboardingStrings, a3);
    boardingInfo = self->_boardingInfo;
    self->_boardingInfo = 0;

    -[TransitDirectionsBoardingInfoListView _rebuildListView](self, "_rebuildListView");
  }
  else if (self->_preboardingStrings)
  {
    -[TransitDirectionsBoardingInfoListView _refreshAllInfoViews](self, "_refreshAllInfoViews");
  }

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8);
        v10 = objc_opt_class(TransitDirectionsBoardingInfoView);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
          v11 = v9;
        else
          v11 = 0;
        v12 = v11;

        objc_msgSend(v12, "setHighlighted:", v3);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)_dropPastDepartures
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = objc_alloc((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews"));
  v5 = objc_msgSend(v3, "initWithArray:", v4);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "entry"));

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "entry"));
          v14 = -[TransitDirectionsBoardingInfoListView _shouldIncludeEntry:](self, "_shouldIncludeEntry:", v13);

          if ((v14 & 1) == 0)
          {
            objc_msgSend(v5, "removeObject:", v11);
            -[UIStackView removeArrangedSubview:](self->_stackView, "removeArrangedSubview:", v11);
            objc_msgSend(v11, "removeFromSuperview");
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  -[TransitDirectionsBoardingInfoListView _processUpcomingInfoViews:](self, "_processUpcomingInfoViews:", v5);
  -[TransitDirectionsBoardingInfoListView _applyUpdatedInfoViewsIfNeeded:](self, "_applyUpdatedInfoViewsIfNeeded:", v5);

}

- (BOOL)_shouldIncludeEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  char IsImminentDepartureTimeInterval;
  BOOL v11;

  v4 = a3;
  v5 = v4;
  if (self->_dropsPastDepartures)
  {
    if (objc_msgSend(v4, "hasExpectedDepartureTime"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKTransitItemReferenceDateUpdater referenceDate](MKTransitItemReferenceDateUpdater, "referenceDate"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v5, "expectedDepartureTime")));
      objc_msgSend(v7, "timeIntervalSinceDate:", v6);
      v9 = v8;
      IsImminentDepartureTimeInterval = GEOTransitDepartureIsImminentDepartureTimeInterval(v8);
      if (v9 >= 0.0)
        v11 = 1;
      else
        v11 = IsImminentDepartureTimeInterval;

    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (id)_viewForEntry:(id)a3
{
  id v4;
  TransitDirectionsBoardingInfoView *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = -[TransitDirectionsBoardingInfoView initWithFrame:]([TransitDirectionsBoardingInfoView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (objc_msgSend(v4, "hasClearExitPlanInfo")
    && (objc_msgSend(v4, "clearExitPlanInfo") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    if ((objc_msgSend(v4, "hasExitPlanInfoOverride") & 1) != 0)
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "exitPlanInfoOverride"));
    else
      v7 = objc_claimAutoreleasedReturnValue(-[GEOTransitBoardingInfo exitPlanInfo](self->_boardingInfo, "exitPlanInfo"));
    v6 = (void *)v7;
  }
  -[TransitDirectionsBoardingInfoView setBoardingInfoEntry:exitPlan:](v5, "setBoardingInfoEntry:exitPlan:", v4, v6);

  return v5;
}

- (id)_viewForInstruction:(id)a3
{
  id v3;
  TransitDirectionsBoardingInfoView *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v3 = a3;
  v4 = -[TransitDirectionsBoardingInfoView initWithFrame:]([TransitDirectionsBoardingInfoView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
  if (objc_msgSend(v3, "hasPrimaryText"))
  {
    v6 = objc_alloc((Class)GEOComposedString);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "primaryText"));
    v8 = objc_msgSend(v6, "initWithGeoFormattedString:", v7);
    objc_msgSend(v5, "addObject:", v8);

  }
  if (objc_msgSend(v3, "hasSecondaryText"))
  {
    v9 = objc_alloc((Class)GEOComposedString);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "secondaryText"));
    v11 = objc_msgSend(v9, "initWithGeoFormattedString:", v10);
    objc_msgSend(v5, "addObject:", v11);

  }
  v12 = objc_msgSend(v5, "copy");
  -[TransitDirectionsBoardingInfoView setPreboardingStrings:](v4, "setPreboardingStrings:", v12);

  return v4;
}

- (void)_rebuildListView
{
  id v3;
  GEOTransitBoardingInfo *boardingInfo;
  TransitDirectionsBoardingInfoView *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  boardingInfo = self->_boardingInfo;
  if (boardingInfo)
  {
    v5 = (TransitDirectionsBoardingInfoView *)objc_claimAutoreleasedReturnValue(-[GEOTransitBoardingInfo entrys](boardingInfo, "entrys"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = -[TransitDirectionsBoardingInfoView countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          if (-[TransitDirectionsBoardingInfoListView _shouldIncludeEntry:](self, "_shouldIncludeEntry:", v10))
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoListView _viewForEntry:](self, "_viewForEntry:", v10));
            objc_msgSend(v3, "addObject:", v11);

          }
        }
        v7 = -[TransitDirectionsBoardingInfoView countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
    goto LABEL_14;
  }
  if (self->_preboardingStrings)
  {
    v5 = -[TransitDirectionsBoardingInfoView initWithFrame:]([TransitDirectionsBoardingInfoView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[TransitDirectionsBoardingInfoView setPreboardingStrings:](v5, "setPreboardingStrings:", self->_preboardingStrings);
    objc_msgSend(v3, "addObject:", v5);
LABEL_14:

  }
  -[TransitDirectionsBoardingInfoListView _processUpcomingInfoViews:](self, "_processUpcomingInfoViews:", v3);
  -[TransitDirectionsBoardingInfoListView _applyUpdatedInfoViewsIfNeeded:](self, "_applyUpdatedInfoViewsIfNeeded:", v3);

}

- (void)_processUpcomingInfoViews:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  char *v20;
  id v21;
  _QWORD v22[6];
  BOOL v23;

  v21 = a3;
  v4 = objc_alloc((Class)NSSet);
  v5 = sub_10039DCD4(v21, &stru_1011DEB78);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v4, "initWithArray:", v6);

  if (!objc_msgSend(v7, "count")
    && -[GEOTransitBoardingInfo hasSummaryTimeInstruction](self->_boardingInfo, "hasSummaryTimeInstruction"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
    if ((objc_msgSend(v8, "isInternalInstall") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v10 = objc_msgSend(v9, "BOOLForKey:", CFSTR("__internal_MapsTransitDebugSuppressSummaryBoardingInfo"));

      if ((v10 & 1) != 0)
      {
        if (!objc_msgSend(v21, "count"))
          goto LABEL_13;
LABEL_8:
        if (!-[GEOTransitBoardingInfo hasEndTimeInstruction](self->_boardingInfo, "hasEndTimeInstruction", v21))goto LABEL_15;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lastObject"));
        v12 = objc_msgSend(v11, "entryType");

        if (v12 == (id)2)
          goto LABEL_15;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTransitBoardingInfo endTimeInstruction](self->_boardingInfo, "endTimeInstruction"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoListView _viewForInstruction:](self, "_viewForInstruction:", v13));

        objc_msgSend(v14, "setEntryType:", 2);
        goto LABEL_14;
      }
    }
    else
    {

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTransitBoardingInfo summaryTimeInstruction](self->_boardingInfo, "summaryTimeInstruction", v21));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoListView _viewForInstruction:](self, "_viewForInstruction:", v15));
    objc_msgSend(v16, "setEntryType:", 1);
    objc_msgSend(v21, "removeAllObjects");
    objc_msgSend(v21, "addObject:", v16);

    if (objc_msgSend(v21, "count"))
      goto LABEL_15;
    goto LABEL_13;
  }
  if (objc_msgSend(v21, "count", v21))
    goto LABEL_8;
LABEL_13:
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTransitBoardingInfo entrys](self->_boardingInfo, "entrys", v21));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoListView _viewForEntry:](self, "_viewForEntry:", v18));

LABEL_14:
  objc_msgSend(v21, "addObject:", v14);

LABEL_15:
  v19 = objc_msgSend(v7, "count");
  if (objc_msgSend(v21, "count"))
    v20 = (char *)objc_msgSend(v21, "count") - 1;
  else
    v20 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1009DB91C;
  v22[3] = &unk_1011DEBA0;
  v23 = (unint64_t)v19 > 1;
  v22[4] = self;
  v22[5] = v20;
  objc_msgSend(v21, "enumerateObjectsUsingBlock:", v22);

}

- (void)_applyUpdatedInfoViewsIfNeeded:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unsigned __int8 v7;
  unint64_t v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews"));
  v8 = (unint64_t)v4;
  v6 = v5;
  if (v8 | v6)
  {
    v7 = objc_msgSend((id)v8, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      -[UIStackView _maps_setArrangedSubviews:](self->_stackView, "_maps_setArrangedSubviews:", v8);
      -[TransitDirectionsBoardingInfoListView _updateFixedWidthConstraints](self, "_updateFixedWidthConstraints");
      -[UIScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", (unint64_t)objc_msgSend((id)v8, "count") > 1);
      self->_needsResetContentOffset = 1;
      -[TransitDirectionsBoardingInfoListView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)setDropPastDepartures:(BOOL)a3
{
  if (self->_dropsPastDepartures != a3)
  {
    self->_dropsPastDepartures = a3;
    -[TransitDirectionsBoardingInfoListView _rebuildListView](self, "_rebuildListView");
  }
}

- (void)_refreshAllInfoViews
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "_refreshContent");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)setFinalButtonTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;

  objc_storeStrong((id *)&self->_buttonTitle, a3);
  v9 = a3;
  v10 = a4;
  objc_storeWeak(&self->_buttonTarget, v10);
  self->_buttonAction = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));

  objc_msgSend(v12, "setButtonTitle:target:action:", v9, v10, a5);
}

- (void)_updateFixedWidthConstraints
{
  void *v3;
  id v4;
  id v5;
  BOOL v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  BOOL v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews"));
  v4 = objc_msgSend(v3, "count");

  v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v4);
  v6 = sub_1002A8AA0(self) == 5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1009DBD9C;
  v9[3] = &unk_1011DEBC8;
  v12 = v6;
  v10 = v5;
  v11 = v4;
  v9[4] = self;
  v8 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v8);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  UIView *v4;
  UIView *closestViewWhenDragBegan;

  if (self->_scrollBehavior == 1)
  {
    objc_msgSend(a3, "contentOffset");
    v4 = (UIView *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoListView _closestViewToPoint:fromEdge:](self, "_closestViewToPoint:fromEdge:", 0));
    closestViewWhenDragBegan = self->_closestViewWhenDragBegan;
    self->_closestViewWhenDragBegan = v4;

  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;
  double v8;
  double y;
  unsigned int v10;
  unint64_t scrollBehavior;
  uint64_t v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  uint64_t v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v27;
  UIView *closestViewWhenDragBegan;
  id v29;

  x = a4.x;
  v8 = a5->x;
  y = a5->y;
  v10 = -[TransitDirectionsBoardingInfoListView _mapkit_isRTL](self, "_mapkit_isRTL", a3, a4.x, a4.y);
  scrollBehavior = self->_scrollBehavior;
  if (scrollBehavior == 1)
  {
    v18 = -[UIStackView _mapkit_isRTL](self->_stackView, "_mapkit_isRTL");
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews"));
    v20 = v19;
    if (v18)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "reverseObjectEnumerator"));
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allObjects"));

      v20 = (void *)v22;
    }
    v23 = (char *)objc_msgSend(v20, "indexOfObject:", self->_closestViewWhenDragBegan);
    if (v23 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = 0;
    }
    else
    {
      v24 = v23;
      if (x < 0.0 || v23 >= (char *)objc_msgSend(v20, "count") - 1)
      {
        v27 = x < 0.0 && v24 != 0;
        v25 = v27 << 63 >> 63;
      }
      else
      {
        v25 = 1;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndexedSubscript:", &v24[v25]));
    }
    closestViewWhenDragBegan = self->_closestViewWhenDragBegan;
    self->_closestViewWhenDragBegan = 0;

    if (v13)
      goto LABEL_7;
  }
  else if (!scrollBehavior)
  {
    v12 = x < 0.0 ? 2 : 8;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoListView _closestViewToPoint:fromEdge:](self, "_closestViewToPoint:fromEdge:", v12, v8, y));
    if (v13)
    {
LABEL_7:
      -[TransitDirectionsBoardingInfoListView _targetContentOffsetForView:](self, "_targetContentOffsetForView:", v13);
      a5->x = v14;
      a5->y = v15;

    }
  }
  v16 = -x;
  if (!v10)
    v16 = x;
  if (v16 < 0.0)
    v17 = 227;
  else
    v17 = 236;
  v29 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v29, "captureUserAction:onTarget:eventValue:", v17, self->_targetForAnalytics, 0);

}

- (CGPoint)_targetContentOffsetForView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double x;
  double v8;
  CGFloat y;
  double Width;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "frame");
    x = v6;
    y = v8;
    if (-[UIStackView _mapkit_isRTL](self->_stackView, "_mapkit_isRTL"))
    {
      -[UIScrollView bounds](self->_scrollView, "bounds");
      Width = CGRectGetWidth(v17);
      objc_msgSend(v5, "bounds");
      v11 = Width - CGRectGetWidth(v18);
      v12 = 0.0;
      if (v11 >= 0.0)
      {
        -[UIScrollView bounds](self->_scrollView, "bounds", 0.0);
        v13 = CGRectGetWidth(v19);
        objc_msgSend(v5, "bounds");
        v12 = v13 - CGRectGetWidth(v20);
      }
      x = x - v12;
    }
  }
  else
  {
    x = CGPointZero.x;
    y = CGPointZero.y;
  }

  v14 = x;
  v15 = y;
  result.y = v15;
  result.x = v14;
  return result;
}

- (id)_closestViewToPoint:(CGPoint)a3 fromEdge:(unint64_t)a4
{
  CGFloat y;
  CGFloat x;
  unint64_t v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  CGFloat v25;
  CGFloat width;
  CGFloat height;
  double v28;
  double v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  CGPoint v36;
  CGRect v37;
  CGRect v38;

  y = a3.y;
  x = a3.x;
  if (a4 == 8 || a4 == 2)
    v8 = a4;
  else
    v8 = 8;
  v9 = -[UIStackView _mapkit_isRTL](self->_stackView, "_mapkit_isRTL");
  if (v8 == 8)
    v10 = v9;
  else
    v10 = 1;
  if (v8 == 2)
    v11 = v9;
  else
    v11 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews"));
  v13 = v12;
  if (v10 == 1 && v11 == 0)
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "reverseObjectEnumerator"));
  else
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectEnumerator"));
  v16 = (void *)v15;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = *(_QWORD *)v32;
LABEL_21:
    v22 = 0;
    v23 = v20;
    while (1)
    {
      if (*(_QWORD *)v32 != v21)
        objc_enumerationMutation(v17);
      v20 = *(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v22);

      objc_msgSend(v20, "frame", (_QWORD)v31);
      v24 = v37.origin.x;
      v25 = v37.origin.y;
      width = v37.size.width;
      height = v37.size.height;
      v28 = CGRectGetWidth(v37) * 0.349999994;
      v29 = -v28;
      if (v8 != 8)
        v29 = v28;
      v38.origin.x = v24 + v29;
      v38.origin.y = v25;
      v38.size.width = width;
      v38.size.height = height;
      v36.x = x;
      v36.y = y;
      if (CGRectContainsPoint(v38, v36))
        break;
      v22 = (char *)v22 + 1;
      v23 = v20;
      if (v19 == v22)
      {
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v19)
          goto LABEL_21;
        break;
      }
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)setTargetForAnalytics:(int)a3
{
  self->_targetForAnalytics = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_buttonTarget);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_preboardingStrings, 0);
  objc_storeStrong((id *)&self->_boardingInfo, 0);
  objc_storeStrong((id *)&self->_closestViewWhenDragBegan, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
