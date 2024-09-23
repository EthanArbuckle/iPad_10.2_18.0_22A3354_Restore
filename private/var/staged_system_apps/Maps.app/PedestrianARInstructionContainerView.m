@implementation PedestrianARInstructionContainerView

- (PedestrianARInstructionContainerView)initWithMapViewDelegate:(id)a3 navigationService:(id)a4
{
  id v6;
  id v7;
  double y;
  double width;
  double height;
  PedestrianARInstructionContainerView *v11;
  id v12;
  NSObject *v13;
  UILabel *v14;
  double v15;
  void *v16;
  UILabel *topLabel;
  UILabel *v18;
  double v19;
  void *v20;
  UILabel *bottomLabel;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSLayoutConstraint *leadingConstraint;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSLayoutConstraint *trailingConstraint;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSLayoutConstraint *bottomConstraint;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id WeakRetained;
  id v47;
  id v49;
  NSObject *v50;
  id v51;
  NSObject *v52;
  char *v53;
  id v54;
  NSObject *v55;
  id v56;
  NSObject *v57;
  char *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  objc_super v64;
  _QWORD v65[4];
  _QWORD v66[2];
  uint8_t buf[4];
  const char *v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  int v72;
  __int16 v73;
  const char *v74;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v49 = sub_1004318FC();
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v68 = "-[PedestrianARInstructionContainerView initWithMapViewDelegate:navigationService:]";
      v69 = 2080;
      v70 = "PedestrianARInstructionContainerView.m";
      v71 = 1024;
      v72 = 70;
      v73 = 2080;
      v74 = "mapViewDelegate != nil";
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v51 = sub_1004318FC();
      v52 = objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v53 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v68 = v53;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v7)
  {
    v54 = sub_1004318FC();
    v55 = objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v68 = "-[PedestrianARInstructionContainerView initWithMapViewDelegate:navigationService:]";
      v69 = 2080;
      v70 = "PedestrianARInstructionContainerView.m";
      v71 = 1024;
      v72 = 71;
      v73 = 2080;
      v74 = "navigationService != nil";
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v56 = sub_1004318FC();
      v57 = objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        v58 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v68 = v58;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v64.receiver = self;
  v64.super_class = (Class)PedestrianARInstructionContainerView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v11 = -[PedestrianARInstructionContainerView initWithFrame:](&v64, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v11)
  {
    v12 = sub_1004365D4();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v68 = (const char *)v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeWeak((id *)&v11->_mapViewDelegate, v6);
    objc_storeWeak((id *)&v11->_navigationService, v7);
    v63 = v6;
    v14 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v15) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v14, "setContentCompressionResistancePriority:forAxis:", 1, v15);
    -[UILabel setNumberOfLines:](v14, "setNumberOfLines:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v14, "setTextColor:", v16);

    -[UILabel setLineBreakMode:](v14, "setLineBreakMode:", 0);
    -[UILabel setLineBreakStrategy:](v14, "setLineBreakStrategy:", 1);
    v62 = v7;
    topLabel = v11->_topLabel;
    v11->_topLabel = v14;

    v18 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v19) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v18, "setContentCompressionResistancePriority:forAxis:", 1, v19);
    -[UILabel setNumberOfLines:](v18, "setNumberOfLines:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v18, "setTextColor:", v20);

    -[UILabel setLineBreakMode:](v18, "setLineBreakMode:", 0);
    -[UILabel setLineBreakStrategy:](v18, "setLineBreakStrategy:", 1);
    bottomLabel = v11->_bottomLabel;
    v11->_bottomLabel = v18;

    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[PedestrianARInstructionContainerView addSubview:](v11, "addSubview:", v11->_topLabel);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v11->_topLabel, "leadingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView safeAreaLayoutGuide](v11, "safeAreaLayoutGuide"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, 26.0));
    leadingConstraint = v11->_leadingConstraint;
    v11->_leadingConstraint = (NSLayoutConstraint *)v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v11->_topLabel, "trailingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView safeAreaLayoutGuide](v11, "safeAreaLayoutGuide"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "trailingAnchor"));
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29, -26.0));
    trailingConstraint = v11->_trailingConstraint;
    v11->_trailingConstraint = (NSLayoutConstraint *)v30;

    v66[0] = v11->_leadingConstraint;
    v66[1] = v11->_trailingConstraint;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v66, 2));
    objc_msgSend(v61, "addObjectsFromArray:", v32);

    -[PedestrianARInstructionContainerView addSubview:](v11, "addSubview:", v11->_bottomLabel);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v11->_bottomLabel, "bottomAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView safeAreaLayoutGuide](v11, "safeAreaLayoutGuide"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bottomAnchor"));
    v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v35, -24.0));
    bottomConstraint = v11->_bottomConstraint;
    v11->_bottomConstraint = (NSLayoutConstraint *)v36;

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v11->_bottomLabel, "leadingAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v11->_topLabel, "leadingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v59));
    v65[0] = v38;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v11->_bottomLabel, "trailingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v11->_topLabel, "trailingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v40));
    v65[1] = v41;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v11->_bottomLabel, "topAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v11->_topLabel, "bottomAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v43, 9.0));
    v65[2] = v44;
    v65[3] = v11->_bottomConstraint;
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v65, 4));
    objc_msgSend(v61, "addObjectsFromArray:", v45);

    v6 = v63;
    v7 = v62;

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v61);
    WeakRetained = objc_loadWeakRetained((id *)&v11->_mapViewDelegate);
    objc_msgSend(WeakRetained, "registerObserver:", v11);

    v47 = objc_loadWeakRetained((id *)&v11->_navigationService);
    objc_msgSend(v47, "registerObserver:", v11);

    -[PedestrianARInstructionContainerView _updateUI](v11, "_updateUI");
  }

  return v11;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  id v6;
  objc_super v7;
  uint8_t buf[4];
  PedestrianARInstructionContainerView *v9;

  v3 = sub_1004365D4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocating", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_mapViewDelegate);
  objc_msgSend(WeakRetained, "unregisterObserver:", self);

  v6 = objc_loadWeakRetained((id *)&self->_navigationService);
  objc_msgSend(v6, "unregisterObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)PedestrianARInstructionContainerView;
  -[PedestrianARInstructionContainerView dealloc](&v7, "dealloc");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PedestrianARInstructionContainerView;
  -[PedestrianARInstructionContainerView layoutSubviews](&v3, "layoutSubviews");
  -[PedestrianARInstructionContainerView _updateUI](self, "_updateUI");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSComparisonResult v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PedestrianARInstructionContainerView;
  -[PedestrianARInstructionContainerView traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  if (!v4
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView traitCollection](self, "traitCollection")),
        v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory")),
        v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory")),
        v8 = UIContentSizeCategoryCompareToCategory(v6, v7),
        v7,
        v6,
        v5,
        v8))
  {
    -[PedestrianARInstructionContainerView _updateUI](self, "_updateUI");
  }

}

- (void)_updateUI
{
  -[PedestrianARInstructionContainerView _updateFonts](self, "_updateFonts");
  -[PedestrianARInstructionContainerView _updateConstraints](self, "_updateConstraints");
  -[PedestrianARInstructionContainerView _updateLabelsForCurrentState](self, "_updateLabelsForCurrentState");
}

- (void)_updateFonts
{
  unsigned int v3;
  id *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = -[PedestrianARInstructionContainerView _isLandscape](self, "_isLandscape");
  v4 = (id *)&UIContentSizeCategoryAccessibilityMedium;
  if (!v3)
    v4 = (id *)&UIContentSizeCategoryAccessibilityLarge;
  v5 = *v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView traitCollection](self, "traitCollection"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_maps_traitCollectionWithMaximumContentSizeCategory:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", UIFontTextStyleTitle2, v11, UIFontWeightBold));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView topLabel](self, "topLabel"));
  objc_msgSend(v8, "setFont:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", UIFontTextStyleTitle1, v11, UIFontWeightBold));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView bottomLabel](self, "bottomLabel"));
  objc_msgSend(v10, "setFont:", v9);

}

- (void)_updateConstraints
{
  unsigned int v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  int v17;
  PedestrianARInstructionContainerView *v18;

  v3 = -[PedestrianARInstructionContainerView _isLandscape](self, "_isLandscape");
  v4 = sub_1004365D4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v6)
    {
      v17 = 134349056;
      v18 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Updating constraints for landscape", (uint8_t *)&v17, 0xCu);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView leadingConstraint](self, "leadingConstraint"));
    objc_msgSend(v7, "setConstant:", 0.0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView trailingConstraint](self, "trailingConstraint"));
    objc_msgSend(v8, "setConstant:", 0.0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView traitCollection](self, "traitCollection"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "preferredContentSizeCategory"));
    v11 = sub_1002A8950(v10, UIContentSizeCategoryExtraExtraExtraLarge);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView bottomConstraint](self, "bottomConstraint"));
    v13 = v12;
    if (v11 == 1)
      v14 = -16.0;
    else
      v14 = -18.0;
  }
  else
  {
    if (v6)
    {
      v17 = 134349056;
      v18 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Updating constraints for portrait", (uint8_t *)&v17, 0xCu);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView leadingConstraint](self, "leadingConstraint"));
    objc_msgSend(v15, "setConstant:", 26.0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView trailingConstraint](self, "trailingConstraint"));
    objc_msgSend(v16, "setConstant:", -26.0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView bottomConstraint](self, "bottomConstraint"));
    v13 = v12;
    v14 = -24.0;
  }
  objc_msgSend(v12, "setConstant:", v14);

}

- (NSArray)_guidanceInfos
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView mapViewDelegate](self, "mapViewDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentFeatureMapping"));
  v4 = sub_10039DCD4(v3, &stru_1011B6C10);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return (NSArray *)v5;
}

- (MNGuidanceARInfo)_currentGuidanceInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView mapViewDelegate](self, "mapViewDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentFeature"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView mapViewDelegate](self, "mapViewDelegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "guidanceInfoForFeature:", v4));

  }
  else
  {
    v6 = 0;
  }

  return (MNGuidanceARInfo *)v6;
}

- (NSArray)_continueGuidanceInfos
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView _guidanceInfos](self, "_guidanceInfos"));
  v3 = sub_10039E080(v2, &stru_1011B6C50);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return (NSArray *)v4;
}

- (id)_sortedContinueGuidanceInfos
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v10;
  PedestrianARInstructionContainerView *v11;
  __int16 v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView _continueGuidanceInfos](self, "_continueGuidanceInfos"));
  v4 = sub_1004365D4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v10 = 134349314;
    v11 = self;
    v12 = 2112;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Will sort continue guidance infos: %@", (uint8_t *)&v10, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortedArrayUsingComparator:", &stru_1011B6C90));
  v7 = sub_1004365D4();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = 134349314;
    v11 = self;
    v12 = 2112;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}p] Did sort continue guidance infos: %@", (uint8_t *)&v10, 0x16u);
  }

  return v6;
}

- (NSArray)_maneuverGuidanceInfos
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView _guidanceInfos](self, "_guidanceInfos"));
  v3 = sub_10039E080(v2, &stru_1011B6CB0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return (NSArray *)v4;
}

- (id)_sortedManeuverGuidanceInfos
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v10;
  PedestrianARInstructionContainerView *v11;
  __int16 v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView _maneuverGuidanceInfos](self, "_maneuverGuidanceInfos"));
  v4 = sub_1004365D4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v10 = 134349314;
    v11 = self;
    v12 = 2112;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Will sort maneuver guidance infos: %@", (uint8_t *)&v10, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortedArrayUsingComparator:", &stru_1011B6CD0));
  v7 = sub_1004365D4();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = 134349314;
    v11 = self;
    v12 = 2112;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}p] Did sort maneuver guidance infos: %@", (uint8_t *)&v10, 0x16u);
  }

  return v6;
}

- (void)_updateLabelsForCurrentState
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  unsigned __int8 v9;
  double v10;
  double v11;
  double Double;
  double v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  double v17;
  double v18;
  id v19;
  NSObject *v20;
  _BYTE *v21;
  _BYTE *v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  char IsRightToLeft;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  NSObject *v48;
  const __CFString *v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  NSObject *v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  id v71;
  NSObject *v72;
  const __CFString *v73;
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
  id v84;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  NSObject *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  uint64_t v96;
  id v97;
  NSObject *v98;
  void *v99;
  id v100;
  NSObject *v101;
  _QWORD v102[4];
  NSObject *v103;
  _BYTE buf[24];
  double v105;
  __int16 v106;
  void *v107;
  __int16 v108;
  void *v109;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView _currentGuidanceInfo](self, "_currentGuidanceInfo"));
  if (v3)
    goto LABEL_5;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView _sortedManeuverGuidanceInfos](self, "_sortedManeuverGuidanceInfos"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  if (v5)
  {
    v3 = v5;

    goto LABEL_5;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView _sortedContinueGuidanceInfos](self, "_sortedContinueGuidanceInfos"));
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

  if (v3)
  {
LABEL_5:
    if (objc_msgSend(v3, "eventType") == 1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView _sortedManeuverGuidanceInfos](self, "_sortedManeuverGuidanceInfos"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
LABEL_7:

LABEL_28:
      v30 = sub_1004365D4();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapsShortDescription"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject mapsShortDescription](v8, "mapsShortDescription"));
        *(_DWORD *)buf = 134349570;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v32;
        *(_WORD *)&buf[22] = 2112;
        v105 = *(double *)&v33;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "[%{public}p] Will display instruction text for current guidance info: %@, next guidance info: %@", buf, 0x20u);

      }
      IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft(v34);
      if (objc_msgSend(v3, "eventType") != 1
        || (objc_msgSend(v3, "maneuverType") == 17 || objc_msgSend(v3, "maneuverType") == 85)
        && !v8)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView topLabel](self, "topLabel"));
        objc_msgSend(v43, "setAttributedText:", 0);

        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "instructionString"));
        if (v44)
        {
          v45 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView _customComposedStringForCurrentGuidanceInfo](self, "_customComposedStringForCurrentGuidanceInfo"));
          v46 = objc_msgSend(objc_alloc((Class)MKServerFormattedString), "initWithComposedString:", v45);
          v47 = sub_1004365D4();
          v48 = objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            if (objc_msgSend(v3, "maneuverType") == 17)
            {
              v49 = CFSTR("StartOn");
            }
            else if (objc_msgSend(v3, "maneuverType") == 85)
            {
              v49 = CFSTR("Resume");
            }
            else
            {
              v49 = CFSTR("Maneuver");
            }
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapsLongDescription"));
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "instructionString"));
            *(_DWORD *)buf = 134350082;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v49;
            *(_WORD *)&buf[22] = 2112;
            v105 = *(double *)&v52;
            v106 = 2112;
            v107 = v53;
            v108 = 2112;
            v109 = v45;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "[%{public}p] Configured for %@ guidance type with maneuver guidance info: %@, original string: %@, custom override string: %@", buf, 0x34u);

          }
        }
        else
        {
          v50 = (id)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView _currentGuidanceInfo](self, "_currentGuidanceInfo"));
          if (v3 == v50)
            v51 = objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView _customVariableOverridesForCurrentGuidanceInfo](self, "_customVariableOverridesForCurrentGuidanceInfo"));
          else
            v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "variableOverrides"));
          v45 = (void *)v51;

          v68 = objc_alloc((Class)MKServerFormattedStringParameters);
          buf[0] = 1;
          memset(&buf[1], 0, 17);
          buf[18] = IsRightToLeft;
          *(_DWORD *)&buf[19] = 0;
          buf[23] = 0;
          v105 = 0.0;
          v48 = objc_msgSend(v68, "initWithOptions:variableOverrides:", buf, v45);
          v69 = objc_alloc((Class)MKServerFormattedString);
          v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "instruction"));
          v46 = objc_msgSend(v69, "initWithGeoServerString:parameters:", v70, v48);

          v71 = sub_1004365D4();
          v72 = objc_claimAutoreleasedReturnValue(v71);
          if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
          {
            if (objc_msgSend(v3, "maneuverType") == 17)
            {
              v73 = CFSTR("StartOn");
            }
            else if (objc_msgSend(v3, "maneuverType") == 85)
            {
              v73 = CFSTR("Resume");
            }
            else
            {
              v73 = CFSTR("Maneuver");
            }
            v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapsLongDescription"));
            v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "variableOverrides"));
            *(_DWORD *)buf = 134350082;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v73;
            *(_WORD *)&buf[22] = 2112;
            v105 = *(double *)&v74;
            v106 = 2112;
            v107 = v75;
            v108 = 2112;
            v109 = v45;
            _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "[%{public}p] Configured for %@ guidance type with maneuver guidance info: %@, maneuver variable overrides: %@, custom variable overrides: %@", buf, 0x34u);

          }
        }

        v76 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView bottomLabel](self, "bottomLabel"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView _stringAttributesForGuidanceInfo:label:](self, "_stringAttributesForGuidanceInfo:label:", v3, v76));

        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "multiPartAttributedStringWithAttributes:", v54));
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "attributedString"));

        v58 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView bottomLabel](self, "bottomLabel"));
        objc_msgSend(v58, "setAttributedText:", v56);
      }
      else
      {
        v36 = objc_alloc((Class)MKServerFormattedStringParameters);
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "variableOverrides"));
        buf[0] = 1;
        memset(&buf[1], 0, 17);
        buf[18] = IsRightToLeft;
        *(_DWORD *)&buf[19] = 0;
        buf[23] = 0;
        v105 = 0.0;
        v38 = objc_msgSend(v36, "initWithOptions:variableOverrides:", buf, v37);

        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "instructionString"));
        v40 = objc_alloc((Class)MKServerFormattedString);
        v100 = v38;
        if (v39)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "instructionString"));
          v42 = objc_msgSend(v40, "initWithComposedString:", v41);
        }
        else
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "instruction"));
          v42 = objc_msgSend(v40, "initWithGeoServerString:parameters:", v41, v38);
        }
        v54 = v42;

        v55 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView topLabel](self, "topLabel"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView _stringAttributesForGuidanceInfo:label:](self, "_stringAttributesForGuidanceInfo:label:", v3, v55));

        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "multiPartAttributedStringWithAttributes:", v56));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "attributedString"));

        v59 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView topLabel](self, "topLabel"));
        objc_msgSend(v59, "setAttributedText:", v58);

        v101 = v8;
        if (v8)
        {
          v60 = objc_alloc((Class)MKServerFormattedStringParameters);
          v61 = v8;
          v62 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject variableOverrides](v8, "variableOverrides"));
          buf[0] = 1;
          memset(&buf[1], 0, 17);
          buf[18] = IsRightToLeft;
          *(_DWORD *)&buf[19] = 0;
          buf[23] = 0;
          v105 = 0.0;
          v63 = objc_msgSend(v60, "initWithOptions:variableOverrides:", buf, v62);

          v64 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject instructionString](v61, "instructionString"));
          v65 = objc_alloc((Class)MKServerFormattedString);
          if (v64)
          {
            v66 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject instructionString](v61, "instructionString"));
            v67 = objc_msgSend(v65, "initWithComposedString:", v66);
          }
          else
          {
            v66 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject instruction](v61, "instruction"));
            v67 = objc_msgSend(v65, "initWithGeoServerString:parameters:", v66, v63);
          }
          v78 = v67;

          v79 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView bottomLabel](self, "bottomLabel"));
          v80 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView _stringAttributesForGuidanceInfo:label:](self, "_stringAttributesForGuidanceInfo:label:", v61, v79));

          v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "multiPartAttributedStringWithAttributes:", v80));
          v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "attributedString"));

          v83 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView bottomLabel](self, "bottomLabel"));
          objc_msgSend(v83, "setAttributedText:", v82);

        }
        else
        {
          v63 = (id)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView bottomLabel](self, "bottomLabel"));
          objc_msgSend(v63, "setAttributedText:", 0);
        }

        v84 = sub_1004365D4();
        v85 = objc_claimAutoreleasedReturnValue(v84);
        if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
        {
          v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapsLongDescription"));
          v87 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject mapsLongDescription](v101, "mapsLongDescription"));
          v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "variableOverrides"));
          v89 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject variableOverrides](v101, "variableOverrides"));
          *(_DWORD *)buf = 134350082;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v86;
          *(_WORD *)&buf[22] = 2112;
          v105 = *(double *)&v87;
          v106 = 2112;
          v107 = v88;
          v108 = 2112;
          v109 = v89;
          _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_INFO, "[%{public}p] Configured for Continue guidance type with continue guidance info: %@, maneuver guidance info: %@, continue variable overrides: %@, maneuver variable overrides: %@", buf, 0x34u);

        }
        v46 = v100;
        v8 = v101;
      }

      goto LABEL_67;
    }
    v9 = objc_msgSend(v3, "isArrival");
    -[PedestrianARInstructionContainerView _distanceToCurrentARFeature](self, "_distanceToCurrentARFeature");
    v11 = v10;
    if ((v9 & 1) != 0)
    {
      Double = GEOConfigGetDouble(MapsConfig_PedestrianARInstructionArrivedDistanceThreshold, off_1014B42E8);
      if (v11 < Double)
      {
        v13 = Double;
        v14 = sub_1004365D4();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349568;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v11;
          *(_WORD *)&buf[22] = 2048;
          v105 = v13;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}p] Current maneuver guidance info is sufficiently close to arrival (%f < %f); showing arrival UI",
            buf,
            0x20u);
        }

        v16 = objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView _arrivedContinueGuidanceInfo](self, "_arrivedContinueGuidanceInfo"));
        v8 = objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView _arrivedManeuverGuidanceInfo](self, "_arrivedManeuverGuidanceInfo"));
        v3 = (id)v16;
        goto LABEL_28;
      }
    }
    else
    {
      v17 = GEOConfigGetDouble(MapsConfig_PedestrianARInstructionNextManeuverDistanceThreshold, off_1014B42F8);
      if (v11 < v17)
      {
        v18 = v17;
        v19 = sub_1004365D4();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349568;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v11;
          *(_WORD *)&buf[22] = 2048;
          v105 = v18;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[%{public}p] Current maneuver guidance info is too close (%f < %f); skipping to next one",
            buf,
            0x20u);
        }

        v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView _sortedManeuverGuidanceInfos](self, "_sortedManeuverGuidanceInfos"));
        v21 = objc_msgSend(v7, "indexOfObject:", v3);
        if (v21 == (_BYTE *)0x7FFFFFFFFFFFFFFFLL || (v22 = v21, v21 == (char *)objc_msgSend(v7, "count") - 1))
        {
          v23 = sub_1004318FC();
          v24 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = "-[PedestrianARInstructionContainerView _updateLabelsForCurrentState]";
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "PedestrianARInstructionContainerView.m";
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v105) = 273;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
          }

          if (sub_100A70734())
          {
            v25 = sub_1004318FC();
            v26 = objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v27;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

            }
          }
          v28 = sub_1004365D4();
          v29 = objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134349314;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v7;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "[%{public}p] Cannot skip ahead to next maneuver because there aren't enough maneuvers: %@", buf, 0x16u);
          }
          v8 = 0;
        }
        else
        {
          v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v22 + 1));
          v94 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView _continueGuidanceInfos](self, "_continueGuidanceInfos"));
          v102[0] = _NSConcreteStackBlock;
          v102[1] = 3221225472;
          v102[2] = sub_100437DB0;
          v102[3] = &unk_1011B6CF8;
          v8 = v93;
          v103 = v8;
          v95 = sub_10039E1FC(v94, v102);
          v96 = objc_claimAutoreleasedReturnValue(v95);

          v97 = sub_1004365D4();
          v98 = objc_claimAutoreleasedReturnValue(v97);
          if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
          {
            v99 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject mapsShortDescription](v8, "mapsShortDescription"));
            *(_DWORD *)buf = 134349314;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v99;
            _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_INFO, "[%{public}p] Skipping ahead to maneuver: %@", buf, 0x16u);

          }
          v29 = v103;
          v3 = (id)v96;
        }

        goto LABEL_7;
      }
    }
    v8 = 0;
    goto LABEL_28;
  }
  v90 = sub_1004365D4();
  v91 = objc_claimAutoreleasedReturnValue(v90);
  if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    *(_QWORD *)&buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_INFO, "[%{public}p] There is no current guidance info nor continue guidance info; cannot update labels",
      buf,
      0xCu);
  }

  v92 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView topLabel](self, "topLabel"));
  objc_msgSend(v92, "setText:", 0);

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView bottomLabel](self, "bottomLabel"));
  objc_msgSend(v3, "setText:", 0);
LABEL_67:

}

- (id)_stringAttributesForGuidanceInfo:(id)a3 label:(id)a4
{
  char *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  PedestrianARInstructionContainerView *v25;
  id v26;
  int v27;
  PedestrianARInstructionContainerView *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  _QWORD v33[2];
  _QWORD v34[2];

  v6 = (char *)a3;
  v33[0] = MKServerFormattedStringArtworkArrowFillColorAttributeKey;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v34[0] = v8;
  v33[1] = MKServerFormattedStringArtworkJunctionFillColorAttributeKey;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorWithAlphaComponent:", 0.3));
  v34[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 2));

  v12 = objc_msgSend(v11, "mutableCopy");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "font"));

  objc_msgSend(v12, "setObject:forKey:", v13, NSFontAttributeName);
  v14 = objc_alloc_init((Class)NSMutableParagraphStyle);
  objc_msgSend(v14, "setLineBreakStrategy:", 1);
  objc_msgSend(v12, "setObject:forKey:", v14, NSParagraphStyleAttributeName);
  if (objc_msgSend(v6, "eventType") == 2 && objc_msgSend(v6, "isArrival"))
  {
    v15 = objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView _arrivalIcon](self, "_arrivalIcon"));
    if (v15)
    {
      v16 = v15;
      v17 = sub_1004365D4();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v27 = 134349314;
        v28 = self;
        v29 = 2112;
        v30 = v6;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "[%{public}p] Generated arrival icon for guidance info: %@", (uint8_t *)&v27, 0x16u);
      }

      objc_msgSend(v12, "setObject:forKey:", v16, MKServerFormattedStringArtworkArrivalIconImageKey);
      -[PedestrianARInstructionContainerView _iconSideLengthForArrival:](self, "_iconSideLengthForArrival:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      objc_msgSend(v12, "setObject:forKey:", v19, MKServerFormattedStringArtworkSideLengthAttributeKey);

    }
    else
    {
      v21 = sub_1004318FC();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v27 = 136315650;
        v28 = (PedestrianARInstructionContainerView *)"-[PedestrianARInstructionContainerView _stringAttributesForGuidanceInfo:label:]";
        v29 = 2080;
        v30 = "PedestrianARInstructionContainerView.m";
        v31 = 1024;
        v32 = 365;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v27, 0x1Cu);
      }

      if (sub_100A70734())
      {
        v23 = sub_1004318FC();
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = (PedestrianARInstructionContainerView *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v27 = 138412290;
          v28 = v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v27, 0xCu);

        }
      }
      v26 = sub_1004365D4();
      v16 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v27 = 134349314;
        v28 = self;
        v29 = 2112;
        v30 = v6;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[%{public}p] Could not generate arrival icon for guidance info: %@", (uint8_t *)&v27, 0x16u);
      }
    }
  }
  else
  {
    -[PedestrianARInstructionContainerView _iconSideLengthForArrival:](self, "_iconSideLengthForArrival:", 0);
    v16 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v12, "setObject:forKey:", v16, MKServerFormattedStringArtworkSideLengthAttributeKey);
  }

  return v12;
}

- (id)_arrivalIcon
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  UIImage *ImageFromCurrentImageContext;
  void *v12;
  CGSize v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView route](self, "route"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "destination"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geoMapItem"));

  if (v5)
    v6 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithGeoMapItem:isPlaceHolderPlace:", v5, 0);
  else
    v6 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v7, "scale");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapItem _maps_markerImageForMapItem:scale:size:useMarkerFallback:](MKMapItem, "_maps_markerImageForMapItem:scale:size:useMarkerFallback:", v6, 3, 1));

  if (v8)
  {
    -[PedestrianARInstructionContainerView _iconSideLengthForArrival:](self, "_iconSideLengthForArrival:", 1);
    v10 = v9;
    v14.width = v9 + 4.0;
    v14.height = v10;
    UIGraphicsBeginImageContextWithOptions(v14, 0, 0.0);
    objc_msgSend(v8, "drawInRect:", 2.0, 0.0, v10, v10);
    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    v12 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
    UIGraphicsEndImageContext();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_arrivedContinueGuidanceInfo
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Pedestrian_AR_arrived"), CFSTR("localized string not found"), 0));

  v4 = objc_alloc((Class)MNGuidanceARInfo);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_geo_formattedString"));
  v6 = objc_msgSend(v4, "initWithEventID:type:maneuverType:instruction:variableOverrides:arrowLabel:locationCoordinate:maneuverRoadName:heading:stepIndex:", 0, 1, 18, v5, 0, 0, -180.0, -180.0, 1.79769313e308, 0.0, 0, 0);

  return v6;
}

- (id)_arrivedManeuverGuidanceInfo
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  id v21;
  id v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView _currentGuidanceInfo](self, "_currentGuidanceInfo"));
  v4 = v3;
  if (v3 && objc_msgSend(v3, "isArrival"))
  {
    v23 = objc_alloc((Class)MNGuidanceARInfo);
    v5 = objc_msgSend(v4, "eventType");
    v6 = objc_msgSend(v4, "maneuverType");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView route](self, "route"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "destination"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navDisplayName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_geo_formattedString"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "variableOverrides"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrowLabel"));
    objc_msgSend(v4, "locationCoordinate");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "maneuverRoadName"));
    objc_msgSend(v4, "heading");
    v21 = objc_msgSend(v23, "initWithEventID:type:maneuverType:instruction:variableOverrides:arrowLabel:locationCoordinate:maneuverRoadName:heading:stepIndex:", 0, v5, v6, v10, v11, v12, v14, v16, v18, v20, v19, objc_msgSend(v4, "stepIndex"));

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)_isLandscape
{
  double Width;
  CGRect v5;
  CGRect v6;

  -[PedestrianARInstructionContainerView frame](self, "frame");
  Width = CGRectGetWidth(v5);
  -[PedestrianARInstructionContainerView frame](self, "frame");
  return Width > CGRectGetHeight(v6);
}

- (double)_iconSideLengthForArrival:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double result;
  double v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView traitCollection](self, "traitCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  v6 = sub_1002A8950(v5, UIContentSizeCategoryExtraExtraExtraLarge);

  result = 32.0;
  if (v3)
    result = 34.0;
  v8 = 42.0;
  if (v3)
    v8 = 44.0;
  if (v6 == 1)
    return v8;
  return result;
}

- (id)_customComposedStringForCurrentGuidanceInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  char v11;
  uint64_t v12;
  _UNKNOWN **v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _UNKNOWN **v25;
  void *v26;
  const char *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  PedestrianARInstructionContainerView *v37;
  id v38;
  NSObject *v39;
  id v40;
  id v42;
  NSObject *v43;
  id v44;
  NSObject *v45;
  PedestrianARInstructionContainerView *v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  PedestrianARInstructionContainerView *v61;
  __int16 v62;
  const char *v63;
  __int16 v64;
  double v65;
  _BYTE v66[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView _currentGuidanceInfo](self, "_currentGuidanceInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "instructionString"));
  if (objc_msgSend(v2, "eventType") != 2 || !objc_msgSend(v2, "isArrival"))
    goto LABEL_26;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView navigationService](self, "navigationService"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastLocation"));

  if (!v5)
  {
    v33 = sub_1004318FC();
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v61 = (PedestrianARInstructionContainerView *)"-[PedestrianARInstructionContainerView _customComposedStringForCurrentGuidanceInfo]";
      v62 = 2080;
      v63 = "PedestrianARInstructionContainerView.m";
      v64 = 1024;
      LODWORD(v65) = 446;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v35 = sub_1004318FC();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = (PedestrianARInstructionContainerView *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v61 = v37;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    v38 = sub_1004365D4();
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      v61 = self;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "[%{public}p] Guidance info is arrival but we don't know where the user currently is; falling back to default variable overrides",
        buf,
        0xCu);
    }

    goto LABEL_26;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "defaultOptions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "arguments"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
  if (v9)
  {
    v10 = v9;
    v49 = v6;
    v50 = v5;
    v51 = v3;
    v52 = v2;
    v11 = 0;
    v12 = *(_QWORD *)v57;
    v13 = MKPlaceCollectionsLogicController_ptr;
    v53 = *(_QWORD *)v57;
    do
    {
      v14 = 0;
      v54 = v10;
      do
      {
        if (*(_QWORD *)v57 != v12)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)v14);
        if (objc_msgSend(v15, "type", v49) == 1)
        {
          -[PedestrianARInstructionContainerView _distanceToCurrentARFeature](self, "_distanceToCurrentARFeature");
          v17 = v16;
          v18 = sub_1004365D4();
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "distanceFormat"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "overrideValue"));
            v22 = v7;
            v23 = v8;
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13[411], "meters"));
            v25 = v13;
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "measurementByConvertingToUnit:", v24));
            objc_msgSend(v26, "doubleValue");
            *(_DWORD *)buf = 134349568;
            v61 = self;
            v62 = 2048;
            v63 = v27;
            v64 = 2048;
            v65 = v17;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{public}p] Replacing distance variable override (%f) with: %f", buf, 0x20u);

            v13 = v25;
            v8 = v23;
            v7 = v22;
            v12 = v53;
            v10 = v54;

          }
          v28 = objc_alloc((Class)NSMeasurement);
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13[411], "meters"));
          v30 = objc_msgSend(v28, "initWithDoubleValue:unit:", v29, v17);
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "distanceFormat"));
          objc_msgSend(v31, "setOverrideValue:", v30);

          v11 = 1;
        }
        objc_msgSend(v7, "addObject:", v15);
        v14 = (char *)v14 + 1;
      }
      while (v10 != v14);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
    }
    while (v10);

    v3 = v51;
    v2 = v52;
    v6 = v49;
    v5 = v50;
    if ((v11 & 1) != 0)
    {
      objc_msgSend(v49, "setArguments:", v7);
      v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "composedStringWithOptions:", v49));

      v3 = (void *)v32;
LABEL_26:
      v40 = v3;
      goto LABEL_27;
    }
  }
  else
  {

  }
  v42 = sub_1004318FC();
  v43 = objc_claimAutoreleasedReturnValue(v42);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v61 = (PedestrianARInstructionContainerView *)"-[PedestrianARInstructionContainerView _customComposedStringForCurrentGuidanceInfo]";
    v62 = 2080;
    v63 = "PedestrianARInstructionContainerView.m";
    v64 = 1024;
    LODWORD(v65) = 470;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v44 = sub_1004318FC();
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      v46 = (PedestrianARInstructionContainerView *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      *(_DWORD *)buf = 138412290;
      v61 = v46;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }
  v47 = sub_1004365D4();
  v48 = objc_claimAutoreleasedReturnValue(v47);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349314;
    v61 = self;
    v62 = 2112;
    v63 = (const char *)v3;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "[%{public}p] Arrival guidance info does not have distance variable override (%@); falling back to default string",
      buf,
      0x16u);
  }

  v40 = v3;
LABEL_27:

  return v40;
}

- (id)_customVariableOverridesForCurrentGuidanceInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  PedestrianARInstructionContainerView *v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  PedestrianARInstructionContainerView *v29;
  id v30;
  NSObject *v31;
  char *v32;
  int v34;
  PedestrianARInstructionContainerView *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  double v39;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView _currentGuidanceInfo](self, "_currentGuidanceInfo"));
  if (objc_msgSend(v3, "eventType") == 2 && objc_msgSend(v3, "isArrival"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView navigationService](self, "navigationService"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastLocation"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "variableOverrides"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v6));

      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("{distance}")));
      if (v8)
      {
        -[PedestrianARInstructionContainerView _distanceToCurrentARFeature](self, "_distanceToCurrentARFeature");
        v10 = v9;
        v11 = sub_1004365D4();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("{distance}")));
          objc_msgSend(v13, "doubleValue");
          v34 = 134349568;
          v35 = self;
          v36 = 2048;
          v37 = v14;
          v38 = 2048;
          v39 = v10;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] Replacing distance variable override (%f) with: %f", (uint8_t *)&v34, 0x20u);

        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10));
        objc_msgSend(v7, "setObject:forKey:", v15, CFSTR("{distance}"));

        v16 = v7;
      }
      else
      {
        v25 = sub_1004318FC();
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v34 = 136315650;
          v35 = (PedestrianARInstructionContainerView *)"-[PedestrianARInstructionContainerView _customVariableOverridesF"
                                                        "orCurrentGuidanceInfo]";
          v36 = 2080;
          v37 = "PedestrianARInstructionContainerView.m";
          v38 = 1024;
          LODWORD(v39) = 494;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v34, 0x1Cu);
        }

        if (sub_100A70734())
        {
          v27 = sub_1004318FC();
          v28 = objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            v29 = (PedestrianARInstructionContainerView *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            v34 = 138412290;
            v35 = v29;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v34, 0xCu);

          }
        }
        v30 = sub_1004365D4();
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v32 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "variableOverrides"));
          v34 = 134349314;
          v35 = self;
          v36 = 2112;
          v37 = v32;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "[%{public}p] Arrival guidance info does not have distance variable override (%@); falling back to default va"
            "riable overrides",
            (uint8_t *)&v34,
            0x16u);

        }
        v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "variableOverrides"));
      }
      v17 = v16;

    }
    else
    {
      v18 = sub_1004318FC();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v34 = 136315650;
        v35 = (PedestrianARInstructionContainerView *)"-[PedestrianARInstructionContainerView _customVariableOverridesFor"
                                                      "CurrentGuidanceInfo]";
        v36 = 2080;
        v37 = "PedestrianARInstructionContainerView.m";
        v38 = 1024;
        LODWORD(v39) = 487;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v34, 0x1Cu);
      }

      if (sub_100A70734())
      {
        v20 = sub_1004318FC();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = (PedestrianARInstructionContainerView *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v34 = 138412290;
          v35 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v34, 0xCu);

        }
      }
      v23 = sub_1004365D4();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v34 = 134349056;
        v35 = self;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "[%{public}p] Guidance info is arrival but we don't know where the user currently is; falling back to default v"
          "ariable overrides",
          (uint8_t *)&v34,
          0xCu);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "variableOverrides"));
    }

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "variableOverrides"));
  }

  return v17;
}

- (double)_distanceToCurrentARFeature
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  PedestrianARInstructionContainerView *v22;
  id v23;
  int v25;
  PedestrianARInstructionContainerView *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView navigationService](self, "navigationService"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastLocation"));

  if (v4)
  {
    objc_msgSend(v4, "coordinate");
    v6 = v5;
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView mapViewDelegate](self, "mapViewDelegate"));
    objc_msgSend(v9, "currentFeaturePosition");
    v11 = v10;
    v13 = v12;

    v15 = GEOCalculateDistance(v14, v6, v8, v11, v13);
    v16 = sub_1004365D4();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v25 = 134350336;
      v26 = self;
      v27 = 2048;
      v28 = *(const char **)&v6;
      v29 = 2048;
      v30 = v8;
      v31 = 2048;
      v32 = v11;
      v33 = 2048;
      v34 = v13;
      v35 = 2048;
      v36 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}p] Calculated distance between user location (%f, %f) and feature location (%f, %f): %f", (uint8_t *)&v25, 0x3Eu);
    }
  }
  else
  {
    v18 = sub_1004318FC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v25 = 136315650;
      v26 = (PedestrianARInstructionContainerView *)"-[PedestrianARInstructionContainerView _distanceToCurrentARFeature]";
      v27 = 2080;
      v28 = "PedestrianARInstructionContainerView.m";
      v29 = 1024;
      LODWORD(v30) = 512;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v25, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v20 = sub_1004318FC();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = (PedestrianARInstructionContainerView *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v25 = 138412290;
        v26 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v25, 0xCu);

      }
    }
    v23 = sub_1004365D4();
    v17 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v25 = 134349056;
      v26 = self;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "[%{public}p] We don't know where the user currently is; cannot calculate distance to guidance info",
        (uint8_t *)&v25,
        0xCu);
    }
    v15 = 1.79769313e308;
  }

  return v15;
}

- (void)mapLayer:(id)a3 activeARWalkingFeatureDidUpdate:(id)a4
{
  id v6;
  id v7;
  const char *label;
  const char *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  PedestrianARInstructionContainerView *v22;
  int v23;
  PedestrianARInstructionContainerView *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  _BYTE v28[14];
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;

  v6 = a3;
  v7 = a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      v18 = sub_1004318FC();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v23 = 136316418;
        v24 = (PedestrianARInstructionContainerView *)"-[PedestrianARInstructionContainerView mapLayer:activeARWalkingFeatureDidUpdate:]";
        v25 = 2080;
        v26 = "PedestrianARInstructionContainerView.m";
        v27 = 1024;
        *(_DWORD *)v28 = 529;
        *(_WORD *)&v28[4] = 2080;
        *(_QWORD *)&v28[6] = "dispatch_get_main_queue()";
        v29 = 2080;
        v30 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v31 = 2080;
        v32 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v23,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v20 = sub_1004318FC();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = (PedestrianARInstructionContainerView *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v23 = 138412290;
          v24 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v23, 0xCu);

        }
      }
    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "feature"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARInstructionContainerView mapViewDelegate](self, "mapViewDelegate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "feature"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "guidanceInfoForFeature:", v13));

  }
  else
  {
    v14 = 0;
  }

  v15 = sub_1004365D4();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mapsShortDescription"));
    v23 = 134349570;
    v24 = self;
    v25 = 2112;
    v26 = (const char *)v7;
    v27 = 2112;
    *(_QWORD *)v28 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}p] Walking feature updated: %@ with guidance info: %@", (uint8_t *)&v23, 0x20u);

  }
  -[PedestrianARInstructionContainerView _updateLabelsForCurrentState](self, "_updateLabelsForCurrentState");

}

- (void)mapLayer:(id)a3 guidanceInfoDidUpdate:(id)a4 forFeature:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *label;
  const char *v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  char *v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  PedestrianARInstructionContainerView *v21;
  int v22;
  PedestrianARInstructionContainerView *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  _BYTE v27[14];
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v12 = dispatch_queue_get_label(0);
  if (label != v12)
  {
    v13 = !label || v12 == 0;
    if (v13 || strcmp(label, v12))
    {
      v17 = sub_1004318FC();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v22 = 136316418;
        v23 = (PedestrianARInstructionContainerView *)"-[PedestrianARInstructionContainerView mapLayer:guidanceInfoDidUpd"
                                                      "ate:forFeature:]";
        v24 = 2080;
        v25 = "PedestrianARInstructionContainerView.m";
        v26 = 1024;
        *(_DWORD *)v27 = 539;
        *(_WORD *)&v27[4] = 2080;
        *(_QWORD *)&v27[6] = "dispatch_get_main_queue()";
        v28 = 2080;
        v29 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v30 = 2080;
        v31 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v22,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v19 = sub_1004318FC();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = (PedestrianARInstructionContainerView *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v22 = 138412290;
          v23 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v22, 0xCu);

        }
      }
    }
  }
  v14 = sub_1004365D4();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapsShortDescription"));
    v22 = 134349570;
    v23 = self;
    v24 = 2112;
    v25 = v16;
    v26 = 2112;
    *(_QWORD *)v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}p] Guidance info updated: %@ for feature: %@", (uint8_t *)&v22, 0x20u);

  }
  -[PedestrianARInstructionContainerView _updateLabelsForCurrentState](self, "_updateLabelsForCurrentState");

}

- (void)mapLayer:(id)a3 updatedFeatures:(id)a4
{
  id v6;
  char *v7;
  const char *label;
  const char *v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  PedestrianARInstructionContainerView *v17;
  int v18;
  PedestrianARInstructionContainerView *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;

  v6 = a3;
  v7 = (char *)a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      v13 = sub_1004318FC();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v18 = 136316418;
        v19 = (PedestrianARInstructionContainerView *)"-[PedestrianARInstructionContainerView mapLayer:updatedFeatures:]";
        v20 = 2080;
        v21 = "PedestrianARInstructionContainerView.m";
        v22 = 1024;
        v23 = 548;
        v24 = 2080;
        v25 = "dispatch_get_main_queue()";
        v26 = 2080;
        v27 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v28 = 2080;
        v29 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v18,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v15 = sub_1004318FC();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = (PedestrianARInstructionContainerView *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v18 = 138412290;
          v19 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v18, 0xCu);

        }
      }
    }
  }
  v11 = sub_1004365D4();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v18 = 134349314;
    v19 = self;
    v20 = 2112;
    v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] Features updated: %@", (uint8_t *)&v18, 0x16u);
  }

  -[PedestrianARInstructionContainerView _updateLabelsForCurrentState](self, "_updateLabelsForCurrentState");
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  id v6;
  char *v7;
  const char *label;
  const char *v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  PedestrianARInstructionContainerView *v17;
  int v18;
  PedestrianARInstructionContainerView *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;

  v6 = a3;
  v7 = (char *)a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      v13 = sub_1004318FC();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v18 = 136316418;
        v19 = (PedestrianARInstructionContainerView *)"-[PedestrianARInstructionContainerView navigationService:didUpdate"
                                                      "MatchedLocation:]";
        v20 = 2080;
        v21 = "PedestrianARInstructionContainerView.m";
        v22 = 1024;
        v23 = 559;
        v24 = 2080;
        v25 = "dispatch_get_main_queue()";
        v26 = 2080;
        v27 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v28 = 2080;
        v29 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v18,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v15 = sub_1004318FC();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = (PedestrianARInstructionContainerView *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v18 = 138412290;
          v19 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v18, 0xCu);

        }
      }
    }
  }
  v11 = sub_1004365D4();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v18 = 134349314;
    v19 = self;
    v20 = 2112;
    v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] Got matched location update: %@", (uint8_t *)&v18, 0x16u);
  }

  -[PedestrianARInstructionContainerView _updateLabelsForCurrentState](self, "_updateLabelsForCurrentState");
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
  objc_storeStrong((id *)&self->_route, a3);
}

- (PedestrianARVKMapViewMapDelegate)mapViewDelegate
{
  return (PedestrianARVKMapViewMapDelegate *)objc_loadWeakRetained((id *)&self->_mapViewDelegate);
}

- (void)setMapViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_mapViewDelegate, a3);
}

- (MNNavigationService)navigationService
{
  return (MNNavigationService *)objc_loadWeakRetained((id *)&self->_navigationService);
}

- (void)setNavigationService:(id)a3
{
  objc_storeWeak((id *)&self->_navigationService, a3);
}

- (UILabel)topLabel
{
  return self->_topLabel;
}

- (void)setTopLabel:(id)a3
{
  objc_storeStrong((id *)&self->_topLabel, a3);
}

- (UILabel)bottomLabel
{
  return self->_bottomLabel;
}

- (void)setBottomLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bottomLabel, a3);
}

- (NSLayoutConstraint)leadingConstraint
{
  return self->_leadingConstraint;
}

- (void)setLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingConstraint, a3);
}

- (NSLayoutConstraint)trailingConstraint
{
  return self->_trailingConstraint;
}

- (void)setTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingConstraint, a3);
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
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomLabel, 0);
  objc_storeStrong((id *)&self->_topLabel, 0);
  objc_destroyWeak((id *)&self->_navigationService);
  objc_destroyWeak((id *)&self->_mapViewDelegate);
  objc_storeStrong((id *)&self->_route, 0);
}

@end
