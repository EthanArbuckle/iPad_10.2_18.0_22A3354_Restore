@implementation RoutePlanningOptionsViewController

+ (BOOL)useCollectionView
{
  return 1;
}

+ (Class)_dataSourceClass
{
  return (Class)objc_opt_class(RoutePlanningOptionsDataSource, a2);
}

- (int64_t)collectionViewListLayoutAppearanceStyle
{
  return 2 * (sub_1002A8AA0(self) != 5);
}

- (int64_t)collectionViewConfigurationSeparatorStyle
{
  return sub_1002A8AA0(self) != 5;
}

- (BOOL)shouldCollapseFirstCollectionViewSectionHeader
{
  return 1;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  if (self->_didStartObservingUnsavedChanges)
  {
    self->_didStartObservingUnsavedChanges = 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController routeOptionsDataSource](self, "routeOptionsDataSource"));
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("hasUnsavedChanges"), &unk_1014D2F88);

  }
  if (self->_didStartObservingCollectionViewBounds)
  {
    self->_didStartObservingCollectionViewBounds = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("bounds"), &unk_1014D2F90);

  }
  v5.receiver = self;
  v5.super_class = (Class)RoutePlanningOptionsViewController;
  -[RoutePlanningOptionsViewController dealloc](&v5, "dealloc");
}

- (RoutePlanningOptionsViewController)initWithDataCoordinator:(id)a3 automaticallySaveChanges:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  RoutePlanningOptionsViewController *v10;
  RoutePlanningOptionsViewController *v11;
  PreferenceValuesDataSource *v12;
  PreferenceValuesDataSource *dataSource;
  PreferenceValuesDataSource *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id completionHandler;
  objc_super v23;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v23.receiver = self;
  v23.super_class = (Class)RoutePlanningOptionsViewController;
  v10 = -[RoutePlanningOptionsViewController initWithNibName:bundle:](&v23, "initWithNibName:bundle:", 0, 0);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_dataCoordinator, v8);
    v12 = (PreferenceValuesDataSource *)objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(v11), "_dataSourceClass"));
    -[PreferenceValuesDataSource setDelegate:](v12, "setDelegate:", v11);
    -[PreferenceValuesDataSource setDataCoordinator:](v12, "setDataCoordinator:", v8);
    -[PreferenceValuesDataSource setAutomaticallySaveChanges:](v12, "setAutomaticallySaveChanges:", v6);
    if ((-[PreferenceValuesDataSource automaticallySaveChanges](v12, "automaticallySaveChanges") & 1) == 0)
    {
      v11->_didStartObservingUnsavedChanges = 1;
      -[PreferenceValuesDataSource addObserver:forKeyPath:options:context:](v12, "addObserver:forKeyPath:options:context:", v11, CFSTR("hasUnsavedChanges"), 1, &unk_1014D2F88);
    }
    dataSource = v11->super._dataSource;
    v11->super._dataSource = v12;
    v14 = v12;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v11, "cardPresentationController"));
    objc_msgSend(v15, "setPresentedModally:", 1);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v11, "cardPresentationController"));
    objc_msgSend(v16, "setAllowsSwipeToDismiss:", 0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v11, "cardPresentationController"));
    objc_msgSend(v17, "setDefaultContaineeLayout:", 5);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v11, "cardPresentationController"));
    objc_msgSend(v18, "setTakesAvailableHeight:", 1);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v11, "cardPresentationController"));
    objc_msgSend(v19, "setHideGrabber:", 1);

    v20 = objc_msgSend(v9, "copy");
    completionHandler = v11->_completionHandler;
    v11->_completionHandler = v20;

  }
  return v11;
}

- (RoutePlanningOptionsDataSource)routeOptionsDataSource
{
  return (RoutePlanningOptionsDataSource *)self->super._dataSource;
}

- (void)viewDidLoad
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
  uint64_t v16;
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)RoutePlanningOptionsViewController;
  -[PreferencesValuesContaineeViewController viewDidLoad](&v19, "viewDidLoad");
  -[RoutePlanningOptionsViewController setPreferredContentSize:](self, "setPreferredContentSize:", 282.0, 282.0);
  objc_initWeak(&location, self);
  objc_copyWeak(&v17, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController routeOptionsDataSource](self, "routeOptionsDataSource", _NSConcreteStackBlock, 3221225472, sub_1006F5BA8, &unk_1011C0D08));
  objc_msgSend(v3, "setAnalyticsTargetProvider:", &v16);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
  +[RoutePlanningOptionsDataSource registerCellsInCollectionView:](RoutePlanningOptionsDataSource, "registerCellsInCollectionView:", v6);

  self->_didStartObservingCollectionViewBounds = 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
  objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("contentSize"), 3, &unk_1014D2F90);

  if (sub_1002A8AA0(self) == 5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController view](self, "view"));
    objc_msgSend(v9, "setBackgroundColor:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController modalHeaderView](self, "modalHeaderView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomHairline"));
    objc_msgSend(v11, "setHidden:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController modalHeaderView](self, "modalHeaderView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingButton"));
    objc_msgSend(v13, "setHidden:", 1);

    -[RoutePlanningOptionsViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController view](self, "view"));
    objc_msgSend(v15, "setBackgroundColor:", v14);

  }
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)setupSubviews
{
  void *v3;
  uint64_t v4;
  ModalCardHeaderView *v5;
  uint64_t v6;
  void *v7;
  ModalCardHeaderView *v8;
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
  uint64_t v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
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
  objc_super v58;
  _QWORD v59[2];

  v58.receiver = self;
  v58.super_class = (Class)RoutePlanningOptionsViewController;
  -[PreferencesValuesContaineeViewController setupSubviews](&v58, "setupSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("RoutePlanningOptionsContentView"));

  v4 = sub_1002A8AA0(self);
  v5 = [ModalCardHeaderView alloc];
  if (v4 == 5)
    v6 = objc_claimAutoreleasedReturnValue(+[ModalCardHeaderConfiguration popoverCardHeaderConfiguration](ModalCardHeaderConfiguration, "popoverCardHeaderConfiguration"));
  else
    v6 = objc_claimAutoreleasedReturnValue(+[ModalCardHeaderConfiguration defaultModalCardHeaderConfiguration](ModalCardHeaderConfiguration, "defaultModalCardHeaderConfiguration"));
  v7 = (void *)v6;
  v8 = -[ModalCardHeaderView initWithConfiguration:](v5, "initWithConfiguration:", v6);
  -[RoutePlanningOptionsViewController setModalHeaderView:](self, "setModalHeaderView:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController modalHeaderView](self, "modalHeaderView"));
  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("RoutePlanningOptionsHeader"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController modalHeaderView](self, "modalHeaderView"));
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController modalHeaderView](self, "modalHeaderView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingButton"));
  objc_msgSend(v12, "setHidden:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController modalHeaderView](self, "modalHeaderView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingButton"));
  objc_msgSend(v14, "setHidden:", 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController dataCoordinator](self, "dataCoordinator"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController _titleForTransportType:](self, "_titleForTransportType:", objc_msgSend(v15, "transportType")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController modalHeaderView](self, "modalHeaderView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "titleLabel"));
  objc_msgSend(v18, "setText:", v16);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController modalHeaderView](self, "modalHeaderView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bottomHairline"));
  objc_msgSend(v20, "setHidden:", v4 != 5);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController modalHeaderView](self, "modalHeaderView"));
  objc_msgSend(v21, "addSubview:", v22);

  v23 = objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController modalHeaderView](self, "modalHeaderView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  LODWORD(v25) = 1148846080;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v23, "_maps_constraintsEqualToEdgesOfView:priority:", v24, v25));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "allConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController routeOptionsDataSource](self, "routeOptionsDataSource"));
  LOBYTE(v23) = objc_msgSend(v28, "automaticallySaveChanges");

  if ((v23 & 1) != 0)
  {
    if (v4 != 5)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController modalHeaderView](self, "modalHeaderView"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "trailingButton"));
      objc_msgSend(v30, "setHidden:", 0);

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController modalHeaderView](self, "modalHeaderView"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "trailingButton"));
      v33 = sub_1009A992C();
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      objc_msgSend(v32, "setTitle:forState:", v34, 0);

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController modalHeaderView](self, "modalHeaderView"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "trailingButton"));
      objc_msgSend(v36, "addTarget:action:forControlEvents:", self, "_didTapDoneButton:", 64);

    }
  }
  else
  {
    if (v4 == 5)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
      objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[RoutePlanningOptionsViewController setCancelButton:](self, "setCancelButton:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
      objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[RoutePlanningOptionsViewController setApplyButton:](self, "setApplyButton:", v40);
      v41 = objc_alloc((Class)UIStackView);
      v59[0] = v39;
      v59[1] = v40;
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v59, 2));
      v43 = objc_msgSend(v41, "initWithArrangedSubviews:", v42);

      objc_msgSend(v43, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v43, "setAxis:", 0);
      objc_msgSend(v43, "setSpacing:", 1.17549435e-38);
      objc_msgSend(v43, "setAlignment:", 0);
      objc_msgSend(v43, "setDistribution:", 1);
      objc_msgSend(v43, "setAccessibilityIdentifier:", CFSTR("RoutePlanningOptionsStackView"));
      -[RoutePlanningOptionsViewController setStackView:](self, "setStackView:", v43);
      v44 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      objc_msgSend(v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v44, "setAccessibilityIdentifier:", CFSTR("FooterView"));
      objc_msgSend(v44, "addSubview:", v43);
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
      objc_msgSend(v45, "addSubview:", v44);

      -[RoutePlanningOptionsViewController setFooterView:](self, "setFooterView:", v44);
    }
    else
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController modalHeaderView](self, "modalHeaderView"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "leadingButton"));
      -[RoutePlanningOptionsViewController setCancelButton:](self, "setCancelButton:", v38);

      v39 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController modalHeaderView](self, "modalHeaderView"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "trailingButton"));
      -[RoutePlanningOptionsViewController setApplyButton:](self, "setApplyButton:", v40);
    }

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController cancelButton](self, "cancelButton"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("Cancel [Route Options, Catalyst]"), CFSTR("localized string not found"), 0));
    objc_msgSend(v46, "setTitle:forState:", v48, 0);

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController cancelButton](self, "cancelButton"));
    objc_msgSend(v49, "setAccessibilityIdentifier:", CFSTR("CancelButton"));

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController cancelButton](self, "cancelButton"));
    objc_msgSend(v50, "setHidden:", 0);

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController cancelButton](self, "cancelButton"));
    objc_msgSend(v51, "addTarget:action:forControlEvents:", self, "_didTapCancelButton:", 64);

    v52 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController applyButton](self, "applyButton"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("Apply [Route Options, Catalyst]"), CFSTR("localized string not found"), 0));
    objc_msgSend(v52, "setTitle:forState:", v54, 0);

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController applyButton](self, "applyButton"));
    objc_msgSend(v55, "setAccessibilityIdentifier:", CFSTR("ApplyButton"));

    v56 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController applyButton](self, "applyButton"));
    objc_msgSend(v56, "setHidden:", 0);

    v57 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController applyButton](self, "applyButton"));
    objc_msgSend(v57, "addTarget:action:forControlEvents:", self, "_didTapDoneButton:", 64);

    -[RoutePlanningOptionsViewController _updateDoneButtonIfNeeded](self, "_updateDoneButtonIfNeeded");
  }
}

- (id)initialConstraints
{
  id v3;
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
  void *v58;
  void *v59;
  void *v60;
  objc_super v61;
  _QWORD v62[11];

  if (sub_1002A8AA0(self) == 5
    && (GEOConfigGetBOOL(MapsConfig_RoutePlanningMacAutomaticallySaveRouteOptions, off_1014B38F8) & 1) == 0)
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "leadingAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "leadingAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v57));
    v62[0] = v56;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "trailingAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "trailingAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v52));
    v62[1] = v51;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController footerView](self, "footerView"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "leadingAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "leadingAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v47));
    v62[2] = v46;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "trailingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController footerView](self, "footerView"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "trailingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
    v62[3] = v41;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "topAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "topAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
    v62[4] = v36;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController footerView](self, "footerView"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "topAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bottomAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v32));
    v62[5] = v31;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bottomAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController footerView](self, "footerView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bottomAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
    v62[6] = v26;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController stackView](self, "stackView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController footerView](self, "footerView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v22, 1.0));
    v62[7] = v21;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController footerView](self, "footerView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController stackView](self, "stackView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v17, 1.0));
    v62[8] = v16;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController stackView](self, "stackView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController footerView](self, "footerView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v7, 1.0));
    v62[9] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController footerView](self, "footerView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController stackView](self, "stackView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v12, 1.0));
    v62[10] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v62, 11));

    return v14;
  }
  else
  {
    v61.receiver = self;
    v61.super_class = (Class)RoutePlanningOptionsViewController;
    v3 = -[PreferencesValuesContaineeViewController initialConstraints](&v61, "initialConstraints");
    return (id)objc_claimAutoreleasedReturnValue(v3);
  }
}

- (double)heightForLayout:(unint64_t)a3
{
  double result;
  void *v6;
  unint64_t v7;
  void *v8;
  double v9;
  double v10;
  objc_super v11;
  objc_super v12;

  if (sub_1002A8AA0(self) == 5)
  {
    -[ContaineeViewController heightForLayout:](&v12, "heightForLayout:", a3, v11.receiver, v11.super_class, self, RoutePlanningOptionsViewController);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v7 = (unint64_t)objc_msgSend(v6, "containerStyle");
    if (v7 <= 7 && ((1 << v7) & 0xE3) != 0)
    {

      result = -1.0;
      if (a3 == 5)
        -[ContaineeViewController heightForLayout:](&v11, "heightForLayout:", 2, self, RoutePlanningOptionsViewController, v12.receiver, v12.super_class);
    }
    else
    {

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v8, "availableHeight");
      v10 = v9;

      return v10;
    }
  }
  return result;
}

- (void)_updatePreferredContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  if (-[RoutePlanningOptionsViewController isViewLoaded](self, "isViewLoaded")
    && sub_1002A8AA0(self) == 5)
  {
    self->_inUpdatePreferredContentSize = 1;
    -[RoutePlanningOptionsViewController _calculatePreferredContentSize](self, "_calculatePreferredContentSize");
    v4 = v3;
    v6 = v5;
    -[RoutePlanningOptionsViewController preferredContentSize](self, "preferredContentSize");
    if (v4 != v8 || v6 != v7)
      -[RoutePlanningOptionsViewController setPreferredContentSize:](self, "setPreferredContentSize:", v4, v6);
    self->_inUpdatePreferredContentSize = 0;
  }
}

- (CGSize)_calculatePreferredContentSize
{
  unsigned int v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double height;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  v3 = -[RoutePlanningOptionsViewController isViewLoaded](self, "isViewLoaded");
  v4 = 282.0;
  if (v3)
  {
    v5 = sub_1002A8AA0(self);
    v4 = 282.0;
    if (v5 == 5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController view](self, "view"));
      objc_msgSend(v6, "layoutIfNeeded");

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
      height = UILayoutFittingCompressedSize.height;
      objc_msgSend(v7, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, height);
      v10 = v9;

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PreferencesValuesContaineeViewController collectionView](self, "collectionView"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "collectionViewLayout"));
      objc_msgSend(v12, "collectionViewContentSize");
      v14 = v13;

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController footerView](self, "footerView"));
      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController footerView](self, "footerView"));
        objc_msgSend(v16, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, height);
        v18 = v17;

      }
      else
      {
        v18 = 0.0;
      }

      v4 = v10 + v14 + v18;
    }
  }
  v19 = 282.0;
  result.height = v4;
  result.width = v19;
  return result;
}

- (id)_titleForTransportType:(int64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  char *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;

  if (sub_1002A8AA0(self) == 5)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v4;
    v6 = CFSTR("Route Options [Card Header Title]");
LABEL_8:
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

    return v7;
  }
  if ((unint64_t)(a3 - 1) < 2)
    goto LABEL_6;
  if (a3 == 3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v4;
    v6 = CFSTR("Prefer [Card Header Title]");
    goto LABEL_8;
  }
  if (a3 == 5)
  {
LABEL_6:
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v4;
    v6 = CFSTR("Avoid Options [Card Header Title]");
    goto LABEL_8;
  }
  v9 = sub_1004318FC();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v14 = 136315650;
    v15 = "-[RoutePlanningOptionsViewController _titleForTransportType:]";
    v16 = 2080;
    v17 = "RoutePlanningOptionsViewController.m";
    v18 = 1024;
    v19 = 372;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v14, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v11 = sub_1004318FC();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v14 = 138412290;
      v15 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);

    }
  }
  return 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  _BOOL4 inUpdatePreferredContentSize;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (a6 == &unk_1014D2F88)
  {
    -[RoutePlanningOptionsViewController _updateDoneButtonIfNeeded](self, "_updateDoneButtonIfNeeded");
  }
  else if (a6 == &unk_1014D2F90)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", NSKeyValueChangeOldKey));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) == 0)
    {
      inUpdatePreferredContentSize = self->_inUpdatePreferredContentSize;
      v18 = sub_10043214C();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
      if (inUpdatePreferredContentSize)
      {
        if (v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", NSKeyValueChangeOldKey));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
          *(_DWORD *)buf = 138412546;
          v27 = v21;
          v28 = 2112;
          v29 = v22;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[Options] Ignoring collection size change from %@ to %@", buf, 0x16u);

        }
      }
      else
      {
        if (v20)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", NSKeyValueChangeOldKey));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
          *(_DWORD *)buf = 138412546;
          v27 = v23;
          v28 = 2112;
          v29 = v24;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[Options] collection size did change from %@ to %@", buf, 0x16u);

        }
        -[RoutePlanningOptionsViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
      }
    }
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)RoutePlanningOptionsViewController;
    -[RoutePlanningOptionsViewController observeValueForKeyPath:ofObject:change:context:](&v25, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (void)_updateDoneButtonIfNeeded
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController applyButton](self, "applyButton"));

  if (v3)
  {
    v4 = sub_1002A8AA0(self);
    v7 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController routeOptionsDataSource](self, "routeOptionsDataSource"));
    v5 = objc_msgSend(v7, "hasUnsavedChanges");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController applyButton](self, "applyButton"));
    if (v4 == 5)
      objc_msgSend(v6, "setHidden:", v5 ^ 1);
    else
      objc_msgSend(v6, "setEnabled:", v5);

  }
}

- (void)handleDismissAction:(id)a3
{
  -[RoutePlanningOptionsViewController _didTapCancelButton:](self, "_didTapCancelButton:", a3);
}

- (void)_didTapCancelButton:(id)a3
{
  void *v4;
  void *v5;
  id completionHandler;
  void (**v7)(id, RoutePlanningOptionsViewController *, id);
  id v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController routeOptionsDataSource](self, "routeOptionsDataSource"));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 18, -[RoutePlanningOptionsViewController _analyticsTargetForTransportType:](self, "_analyticsTargetForTransportType:", objc_msgSend(v5, "transportType")), 0);

  completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    v7 = (void (**)(id, RoutePlanningOptionsViewController *, id))objc_retainBlock(completionHandler);
    v8 = self->_completionHandler;
    self->_completionHandler = 0;

    v7[2](v7, self, v9);
  }

}

- (void)_didTapDoneButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id completionHandler;
  void (**v8)(id, RoutePlanningOptionsViewController *, id);
  id v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController routeOptionsDataSource](self, "routeOptionsDataSource"));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 17, -[RoutePlanningOptionsViewController _analyticsTargetForTransportType:](self, "_analyticsTargetForTransportType:", objc_msgSend(v5, "transportType")), 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController routeOptionsDataSource](self, "routeOptionsDataSource"));
  objc_msgSend(v6, "_updateCoordinatorWithPreferences");

  completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    v8 = (void (**)(id, RoutePlanningOptionsViewController *, id))objc_retainBlock(completionHandler);
    v9 = self->_completionHandler;
    self->_completionHandler = 0;

    v8[2](v8, self, v10);
  }

}

- (void)dataSourceDidRebuildSections:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RoutePlanningOptionsViewController;
  -[PreferencesValuesContaineeViewController dataSourceDidRebuildSections:](&v4, "dataSourceDidRebuildSections:", a3);
  -[RoutePlanningOptionsViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (void)_presentRAP
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  char *v11;
  _QWORD v12[4];
  NSObject *v13;
  RoutePlanningOptionsViewController *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController routeOptionsDataSource](self, "routeOptionsDataSource"));
  v4 = (unint64_t)objc_msgSend(v3, "transportType");

  if (v4 <= 5)
  {
    if (((1 << v4) & 0x2E) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      objc_msgSend(v5, "captureUserAction:onTarget:eventValue:", 5013, -[RoutePlanningOptionsViewController _analyticsTarget](self, "_analyticsTarget"), 0);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rapPresenter"));

      if (sub_1002A8AA0(self) == 5)
      {
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_1006F74E8;
        v12[3] = &unk_1011AC8B0;
        v7 = v7;
        v13 = v7;
        v14 = self;
        -[RoutePlanningOptionsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v12);

      }
      else
      {
        -[NSObject presentReportAProblemForRouteFromEntryPoint:](v7, "presentReportAProblemForRouteFromEntryPoint:", -[RoutePlanningOptionsViewController _analyticsTarget](self, "_analyticsTarget"));
      }
LABEL_11:

      return;
    }
    v8 = sub_1004318FC();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "-[RoutePlanningOptionsViewController _presentRAP]";
      v17 = 2080;
      v18 = "RoutePlanningOptionsViewController.m";
      v19 = 1024;
      v20 = 467;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v10 = sub_1004318FC();
      v7 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v11 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v16 = v11;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
      goto LABEL_11;
    }
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  uint64_t v7;
  void *v8;
  objc_super v9;

  y = a4.y;
  v9.receiver = self;
  v9.super_class = (Class)RoutePlanningOptionsViewController;
  -[ContaineeViewController scrollViewWillEndDragging:withVelocity:targetContentOffset:](&v9, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", a3, a5, a4.x);
  if (y <= 0.0)
    v7 = 7;
  else
    v7 = 8;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v8, "captureUserAction:onTarget:eventValue:", v7, -[RoutePlanningOptionsViewController _analyticsTarget](self, "_analyticsTarget"), 0);

}

- (int)_analyticsTargetForTransportType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return 0;
  else
    return dword_100E3A140[a3 - 1];
}

- (int)_analyticsTarget
{
  RoutePlanningOptionsViewController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController routeOptionsDataSource](self, "routeOptionsDataSource"));
  LODWORD(v2) = -[RoutePlanningOptionsViewController _analyticsTargetForTransportType:](v2, "_analyticsTargetForTransportType:", objc_msgSend(v3, "transportType"));

  return (int)v2;
}

- (unint64_t)preferredPresentationStyle
{
  return self->_preferredPresentationStyle;
}

- (void)setPreferredPresentationStyle:(unint64_t)a3
{
  self->_preferredPresentationStyle = a3;
}

- (RoutePlanningDataCoordination)dataCoordinator
{
  return (RoutePlanningDataCoordination *)objc_loadWeakRetained((id *)&self->_dataCoordinator);
}

- (ModalCardHeaderView)modalHeaderView
{
  return self->_modalHeaderView;
}

- (void)setModalHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_modalHeaderView, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_footerView, a3);
}

- (UIButton)cancelButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_cancelButton);
}

- (void)setCancelButton:(id)a3
{
  objc_storeWeak((id *)&self->_cancelButton, a3);
}

- (UIButton)applyButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_applyButton);
}

- (void)setApplyButton:(id)a3
{
  objc_storeWeak((id *)&self->_applyButton, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_applyButton);
  objc_destroyWeak((id *)&self->_cancelButton);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_modalHeaderView, 0);
  objc_destroyWeak((id *)&self->_dataCoordinator);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
