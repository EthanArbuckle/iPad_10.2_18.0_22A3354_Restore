@implementation CHASActivitySetupMetricsCollectionViewController

- (CHASActivitySetupMetricsCollectionViewController)init
{
  return -[CHASActivitySetupMetricsCollectionViewController initWithPresentationContext:](self, "initWithPresentationContext:", 0);
}

- (CHASActivitySetupMetricsCollectionViewController)initWithPresentationContext:(int64_t)a3
{
  CHASActivitySetupMetricsCollectionViewController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CHASActivitySetupMetricsCollectionViewController;
  result = -[CHASActivitySetupMetricsCollectionViewController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v5, "initWithTitle:detailText:icon:adoptTableViewScrollView:", &stru_1007AE1D0, 0, 0, 1);
  if (result)
    result->_presentationContext = a3;
  return result;
}

- (CHASActivitySetupMetricsCollectionViewController)initWithPresentationContext:(int64_t)a3 pregnancyStateProvider:(id)a4
{
  id v7;
  CHASActivitySetupMetricsCollectionViewController *v8;
  CHASActivitySetupMetricsCollectionViewController *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CHASActivitySetupMetricsCollectionViewController;
  v8 = -[CHASActivitySetupMetricsCollectionViewController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v11, "initWithTitle:detailText:icon:adoptTableViewScrollView:", &stru_1007AE1D0, 0, 0, 1);
  v9 = v8;
  if (v8)
  {
    v8->_presentationContext = a3;
    objc_storeStrong((id *)&v8->_pregnancyStateProvider, a4);
  }

  return v9;
}

- (BOOL)showPregnancy
{
  void *v3;
  void *v4;
  unsigned int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "features"));
  v5 = objc_msgSend(v4, "seahorse");

  return v5 && self->_presentationContext != 0;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t active;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  unsigned __int8 v11;
  void *v12;
  BOOL *p_showWheelchair;
  FIUIPregnancyStateProvider *v14;
  FIUIPregnancyStateProvider *pregnancyStateProvider;
  FIUIHealthSettingsDataSource *v16;
  FIUIHealthSettingsDataSource *healthSettingsDataSource;
  void *v18;
  void *v19;
  uint64_t v20;
  NSBundle *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSBundle *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  CHASActivitySetupContentSizedTableView *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  UIView *v39;
  UIView *footerView;
  void *v41;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)CHASActivitySetupMetricsCollectionViewController;
  -[CHASActivitySetupMetricsCollectionViewController viewDidLoad](&v42, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupMetricsCollectionViewController delegate](self, "delegate"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupMetricsCollectionViewController delegate](self, "delegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activePairingDevice"));

  }
  else
  {
    active = FIGetActivePairedDevice();
    v5 = (void *)objc_claimAutoreleasedReturnValue(active);
  }

  v7 = FIUIHealthStoreForDevice(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(objc_alloc((Class)FIActivitySettingsController), "initWithHealthStore:", v8);
  objc_msgSend(v9, "populateExistingCharacteristics");
  v10 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("E5E86144-6C47-4545-8F52-A5D468C1DA85"));
  v11 = objc_msgSend(v5, "supportsCapability:", v10);
  if ((v11 & 1) != 0 || objc_msgSend(v9, "wheelchairUse") != (id)2)
  {
    p_showWheelchair = &self->_showWheelchair;
    self->_showWheelchair = v11;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior"));
    p_showWheelchair = &self->_showWheelchair;
    self->_showWheelchair = objc_msgSend(v12, "isStandalonePhoneFitnessMode");

  }
  if (!self->_pregnancyStateProvider)
  {
    v14 = (FIUIPregnancyStateProvider *)objc_msgSend(objc_alloc((Class)FIUIPregnancyStateProvider), "initWithHealthStore:", v8);
    pregnancyStateProvider = self->_pregnancyStateProvider;
    self->_pregnancyStateProvider = v14;

  }
  v16 = (FIUIHealthSettingsDataSource *)objc_msgSend(objc_alloc((Class)FIUIHealthSettingsDataSource), "initWithActivitySettingsController:showWheelchair:pregnancyStateProvider:showPregnancy:", v9, *p_showWheelchair, self->_pregnancyStateProvider, -[CHASActivitySetupMetricsCollectionViewController showPregnancy](self, "showPregnancy"));
  healthSettingsDataSource = self->_healthSettingsDataSource;
  self->_healthSettingsDataSource = v16;

  -[FIUIHealthSettingsDataSource setDelegate:](self->_healthSettingsDataSource, "setDelegate:", self);
  -[CHASActivitySetupMetricsCollectionViewController _determinePresentationContextIfNeededWithHealthStore:](self, "_determinePresentationContextIfNeededWithHealthStore:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupMetricsCollectionViewController navigationController](self, "navigationController"));
  self->_isNavigationBarHidden = objc_msgSend(v18, "isNavigationBarHidden");

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupMetricsCollectionViewController headerView](self, "headerView"));
  v21 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v20));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("SET_UP_ACTIVITY"), &stru_1007AE1D0, CFSTR("ActivitySetup")));
  objc_msgSend(v19, "setTitle:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupMetricsCollectionViewController headerView](self, "headerView"));
  v26 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v25));
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("SET_UP_ACTIVITY_DETAIL"), &stru_1007AE1D0, CFSTR("ActivitySetup")));
  objc_msgSend(v24, "setDetailText:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupMetricsCollectionViewController _titleForConfirmButton](self, "_titleForConfirmButton"));
  objc_msgSend(v29, "addTarget:action:forControlEvents:", self, "tappedConfirm:", 64);
  v31 = BPSPillSelectedColor(objc_msgSend(v29, "setTitle:forState:", v30, 0));
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  objc_msgSend(v29, "setTintColor:", v32);

  objc_msgSend(v29, "setAccessibilityIdentifier:", CFSTR("Fitness.ActivitySetupMetrics.ConfirmButton"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupMetricsCollectionViewController buttonTray](self, "buttonTray"));
  objc_msgSend(v33, "addButton:", v29);

  v34 = -[CHASActivitySetupContentSizedTableView initWithFrame:style:]([CHASActivitySetupContentSizedTableView alloc], "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[CHASActivitySetupContentSizedTableView setTranslatesAutoresizingMaskIntoConstraints:](v34, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CHASActivitySetupContentSizedTableView setDelegate:](v34, "setDelegate:", self);
  v35 = BPSSeparatorColor(-[CHASActivitySetupContentSizedTableView setDataSource:](v34, "setDataSource:", self));
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  -[CHASActivitySetupContentSizedTableView setSeparatorColor:](v34, "setSeparatorColor:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors keyColors](ARUIMetricColors, "keyColors"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "nonGradientTextColor"));
  -[CHASActivitySetupContentSizedTableView _setAccessoryBaseColor:](v34, "_setAccessoryBaseColor:", v38);

  -[CHASActivitySetupMetricsCollectionViewController setShouldAdjustButtonTrayForKeyboard:](self, "setShouldAdjustButtonTrayForKeyboard:", 1);
  v39 = (UIView *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupMetricsCollectionViewController _makeFooterView](self, "_makeFooterView"));
  footerView = self->_footerView;
  self->_footerView = v39;

  -[CHASActivitySetupMetricsCollectionViewController setTableView:](self, "setTableView:", v34);
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v41, "addObserver:selector:name:object:", self, "_contentSizeDidChange", UIContentSizeCategoryDidChangeNotification, 0);

}

- (id)_titleForConfirmButton
{
  void *v2;
  unint64_t presentationContext;
  NSBundle *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  NSBundle *v9;

  presentationContext = self->_presentationContext;
  if (presentationContext >= 6)
  {
    if (presentationContext != 6)
      return v2;
    v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, a2));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v6 = v5;
    v7 = CFSTR("SET_UP_DONE");
  }
  else
  {
    v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, a2));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = v5;
    v7 = CFSTR("SET_UP_CONTINUE");
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1007AE1D0, CFSTR("ActivitySetup")));

  return v2;
}

- (void)tappedConfirm:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __objc2_class *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;

  v4 = a3;
  if (self->_isNavigationBarHidden)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupMetricsCollectionViewController navigationController](self, "navigationController"));
    objc_msgSend(v5, "setNavigationBarHidden:animated:", 1, 0);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIHealthSettingsDataSource editedSettingsController](self->_healthSettingsDataSource, "editedSettingsController"));
  objc_msgSend(v6, "commmitWithError:", 0);

  switch(self->_presentationContext)
  {
    case 0:
      _HKInitializeLogging(v7, v8);
      v9 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_FAULT))
        sub_1005F2490((uint64_t)&self->_presentationContext, v9, v10, v11, v12, v13, v14, v15);
      goto LABEL_6;
    case 1:
      goto LABEL_9;
    case 2:
      _HKInitializeLogging(v7, v8);
      v17 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_FAULT))
        sub_1005F2490((uint64_t)&self->_presentationContext, v17, v18, v19, v20, v21, v22, v23);
LABEL_9:
      v16 = CHASActivitySetupViewController;
      goto LABEL_11;
    case 3:
LABEL_6:
      v16 = CHASActivitySetupOnboardingViewController;
      goto LABEL_11;
    case 4:
      v16 = CHASActivitySetupThreeRingsOnboardingViewController;
LABEL_11:
      v24 = objc_msgSend([v16 alloc], "initWithPresentationContext:", self->_presentationContext);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupMetricsCollectionViewController delegate](self, "delegate"));
      objc_msgSend(v24, "setDelegate:", v25);

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupMetricsCollectionViewController navigationController](self, "navigationController"));
      objc_msgSend(v26, "pushViewController:animated:", v24, 1);

      goto LABEL_12;
    case 5:
      v24 = (id)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupMetricsCollectionViewController delegate](self, "delegate"));
      objc_msgSend(v24, "buddyControllerDone:", self);
LABEL_12:

      break;
    case 6:
      -[CHASActivitySetupMetricsCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
      break;
    default:
      break;
  }

}

- (id)_makeFooterView
{
  id v3;
  double y;
  double width;
  double height;
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  NSBundle *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
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
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];

  v3 = objc_alloc((Class)UIView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v8 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior"));
  v10 = objc_msgSend(v9, "isStandalonePhoneFitnessMode");
  v12 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (v10)
    v15 = CFSTR("ABOUT_WHEELCHAIR_USE_FOOTER_STANDALONE");
  else
    v15 = CFSTR("ABOUT_WHEELCHAIR_USE_FOOTER");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_1007AE1D0, CFSTR("ActivitySetup")));
  objc_msgSend(v8, "setText:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  objc_msgSend(v8, "setTextColor:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleFootnote));
  objc_msgSend(v8, "setFont:", v18);

  objc_msgSend(v8, "setLineBreakMode:", 0);
  objc_msgSend(v8, "setNumberOfLines:", 0);
  objc_msgSend(v7, "addSubview:", v8);
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32, 10.0));
  v34[0] = v31;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v19));
  v34[1] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
  v34[2] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v29 = v7;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, -10.0));
  v34[3] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v27);

  return v29;
}

- (void)_contentSizeDidChange
{
  UIView *v3;
  UIView *footerView;

  v3 = (UIView *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupMetricsCollectionViewController _makeFooterView](self, "_makeFooterView"));
  footerView = self->_footerView;
  self->_footerView = v3;

}

- (void)_determinePresentationContextIfNeededWithHealthStore:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  if (!self->_presentationContext)
  {
    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100080B2C;
    v8[3] = &unk_100778E18;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    FIUIUserHasExistingMoveGoal(v9, v8, v5, v6, v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

- (BOOL)holdBeforeDisplaying
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  char v12;
  _QWORD block[5];
  uint8_t buf[4];
  unsigned int v16;
  __int16 v17;
  unsigned int v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupMetricsCollectionViewController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "setupFlowUserInfo"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", BPSPairingFlowIsTinkerPairing));
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", BPSPairingFlowIsTinkerHealthSharingEnabled));
  v8 = objc_msgSend(v7, "BOOLValue");

  _HKInitializeLogging(v9, v10);
  v11 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v16 = v6;
    v17 = 1024;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CHASActivitySetupMetricsCollectionViewController - controllerNeedsToRun: isTinkerPairing %d isTinkerHealthSharingEnabled %d", buf, 0xEu);
  }
  v12 = v6 ^ 1 | v8;
  if ((v12 & 1) == 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008106C;
    block[3] = &unk_100777E20;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }

  return v12 ^ 1;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v6 = a3;
  v7 = v6;
  if (self->_showWheelchair && (char *)objc_msgSend(v6, "numberOfSections") - 1 == (_BYTE *)a4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupMetricsCollectionViewController tableView](self, "tableView"));
    objc_msgSend(v8, "frame");
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupMetricsCollectionViewController tableView](self, "tableView"));
    objc_msgSend(v11, "directionalLayoutMargins");
    v13 = v10 - v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupMetricsCollectionViewController tableView](self, "tableView"));
    objc_msgSend(v14, "directionalLayoutMargins");
    v16 = v13 - v15;

    LODWORD(v17) = 1148846080;
    LODWORD(v18) = 1112014848;
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_footerView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v16, 1.79769313e308, v17, v18);
    v20 = v19;
  }
  else
  {
    v20 = UITableViewAutomaticDimension;
  }

  return v20;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  UIView *v7;

  v6 = a3;
  if (self->_showWheelchair
    && -[FIUIHealthSettingsDataSource wheelchairSectionIndex](self->_healthSettingsDataSource, "wheelchairSectionIndex") == (id)a4)
  {
    v7 = self->_footerView;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return -[FIUIHealthSettingsDataSource shouldHighlightRowAtIndexPath:](self->_healthSettingsDataSource, "shouldHighlightRowAtIndexPath:", a4);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  UITableViewCell *v7;
  void *v8;
  UITableViewCell **p_selectedCell;
  UITableViewCell *selectedCell;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(v11, "deselectRowAtIndexPath:animated:", v6, 1);
  if (-[FIUIHealthSettingsDataSource shouldBypassFirstResponderAction:](self->_healthSettingsDataSource, "shouldBypassFirstResponderAction:", v6))
  {
    -[CHASActivitySetupMetricsCollectionViewController didTapEditPregnancy](self, "didTapEditPregnancy");
  }
  else
  {
    v7 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cellForRowAtIndexPath:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupMetricsCollectionViewController view](self, "view"));
    objc_msgSend(v8, "endEditing:", 1);

    p_selectedCell = &self->_selectedCell;
    selectedCell = self->_selectedCell;
    if (v7 == selectedCell)
    {
      *p_selectedCell = 0;

      -[CHASActivitySetupMetricsCollectionViewController _endEditingAndDiscardChanges:](self, "_endEditingAndDiscardChanges:", 0);
    }
    else
    {
      if (selectedCell)
      {
        -[UITableViewCell resignFirstResponder](selectedCell, "resignFirstResponder");
        -[FIUIHealthSettingsDataSource cellDidResignFirstResponder:](self->_healthSettingsDataSource, "cellDidResignFirstResponder:", *p_selectedCell);
      }
      else
      {
        -[CHASActivitySetupMetricsCollectionViewController _startEdit](self, "_startEdit");
      }
      -[UITableViewCell becomeFirstResponder](v7, "becomeFirstResponder");
      -[FIUIHealthSettingsDataSource cellDidBecomeFirstResponder:](self->_healthSettingsDataSource, "cellDidBecomeFirstResponder:", v7);
      objc_storeStrong((id *)&self->_selectedCell, v7);
    }

  }
}

- (void)_cancel
{
  -[CHASActivitySetupMetricsCollectionViewController _endEditingAndDiscardChanges:](self, "_endEditingAndDiscardChanges:", 1);
}

- (void)_done
{
  -[CHASActivitySetupMetricsCollectionViewController _endEditingAndDiscardChanges:](self, "_endEditingAndDiscardChanges:", 0);
}

- (void)_startEdit
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  if (self->_isNavigationBarHidden)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupMetricsCollectionViewController navigationController](self, "navigationController"));
    objc_msgSend(v3, "setNavigationBarHidden:animated:", 0, 0);

  }
  v4 = objc_alloc((Class)UIBarButtonItem);
  v5 = FIUIBundle(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DONE_BUTTON"), &stru_1007AE1D0, CFSTR("Localizable")));
  v15 = objc_msgSend(v4, "initWithTitle:style:target:action:", v7, 2, self, "_done");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupMetricsCollectionViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v8, "setRightBarButtonItem:", v15);

  v9 = objc_alloc((Class)UIBarButtonItem);
  v10 = FIUIBundle(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CANCEL_BUTTON"), &stru_1007AE1D0, CFSTR("Localizable")));
  v13 = objc_msgSend(v9, "initWithTitle:style:target:action:", v12, 0, self, "_cancel");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupMetricsCollectionViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v14, "setLeftBarButtonItem:", v13);

  -[FIUIHealthSettingsDataSource startEditing](self->_healthSettingsDataSource, "startEditing");
}

- (void)_endEditingAndDiscardChanges:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  UITableViewCell *selectedCell;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  if (self->_isNavigationBarHidden)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupMetricsCollectionViewController navigationController](self, "navigationController"));
    objc_msgSend(v5, "setNavigationBarHidden:animated:", 1, 0);

  }
  selectedCell = self->_selectedCell;
  self->_selectedCell = 0;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupMetricsCollectionViewController view](self, "view"));
  objc_msgSend(v7, "endEditing:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupMetricsCollectionViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v8, "setRightBarButtonItem:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupMetricsCollectionViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v9, "setLeftBarButtonItem:", 0);

  -[FIUIHealthSettingsDataSource endEditingAndDiscardChanges:](self->_healthSettingsDataSource, "endEditingAndDiscardChanges:", v3);
}

- (void)_requestWheelchairDiagnosticsSubmissionIfNecessary
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  NSBundle *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSBundle *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSBundle *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSBundle *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSBundle *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v4 = objc_msgSend(v3, "isDiagnosticSubmissionAllowed");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    v6 = objc_msgSend(v5, "hasWheelchairDataSubmissionAllowedBeenSet");

    if ((v6 & 1) == 0)
    {
      v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v7));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("FEEDBACK_WHEELCHAIR_TITLE"), &stru_1007AE1D0, CFSTR("ActivitySetup")));
      v12 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v11));
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("FEEDBACK_WHEELCHAIR_DESCRIPTION"), &stru_1007AE1D0, CFSTR("ActivitySetup")));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v10, v14, 1));

      v17 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v16));
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("FEEDBACK_WHEELCHAIR_ALLOW"), &stru_1007AE1D0, CFSTR("ActivitySetup")));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v19, 0, &stru_100778E38));
      objc_msgSend(v15, "addAction:", v20);

      v22 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v21));
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("FEEDBACK_WHEELCHAIR_MORE_INFO"), &stru_1007AE1D0, CFSTR("ActivitySetup")));
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10008190C;
      v31[3] = &unk_100778E60;
      v31[4] = self;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v24, 0, v31));
      objc_msgSend(v15, "addAction:", v25);

      v27 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v26));
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("FEEDBACK_WHEELCHAIR_DENY"), &stru_1007AE1D0, CFSTR("ActivitySetup")));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v29, 0, &stru_100778E80));
      objc_msgSend(v15, "addAction:", v30);

      -[CHASActivitySetupMetricsCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);
    }
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (int64_t)-[FIUIHealthSettingsDataSource numberOfSectionsInTableView:](self->_healthSettingsDataSource, "numberOfSectionsInTableView:", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (int64_t)-[FIUIHealthSettingsDataSource tableView:numberOfRowsInSection:](self->_healthSettingsDataSource, "tableView:numberOfRowsInSection:", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIHealthSettingsDataSource tableView:cellForRowAtIndexPath:](self->_healthSettingsDataSource, "tableView:cellForRowAtIndexPath:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textLabel"));
  v6 = BPSTextColor();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "setTextColor:", v7);

  v8 = BPSForegroundColor();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v4, "setBackgroundColor:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessoryView"));
  v11 = BPSAccessoryColor();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v10, "setTintColor:", v12);

  v13 = objc_alloc_init((Class)UIView);
  v14 = BPSCellHightlightColor();
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v13, "setBackgroundColor:", v15);

  objc_msgSend(v4, "setSelectedBackgroundView:", v13);
  return v4;
}

- (void)wheelchairUseSwitchDidChangeTo:(BOOL)a3
{
  if (a3)
    -[CHASActivitySetupMetricsCollectionViewController _requestWheelchairDiagnosticsSubmissionIfNecessary](self, "_requestWheelchairDiagnosticsSubmissionIfNecessary");
}

- (void)didTapEditPregnancy
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("x-apple-health://MenstrualCyclesAppPlugin.healthplugin/openPregnancyOnboarding")));
  objc_msgSend(v3, "openURL:options:completionHandler:", v2, &__NSDictionary0__struct, &stru_100778EA0);

}

- (void)shouldReloadPregnancySection
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIHealthSettingsDataSource pregnancySectionIndexPath](self->_healthSettingsDataSource, "pregnancySectionIndexPath"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100081D90;
  v5[3] = &unk_100777EE0;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (id)tapToRadarMetadata
{
  return objc_msgSend(objc_alloc((Class)BPSTTRMetadata), "initWithComponent:", 2);
}

- (BPSBuddyControllerDelegate)delegate
{
  return (BPSBuddyControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)presentationContext
{
  return self->_presentationContext;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pregnancyStateProvider, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_selectedCell, 0);
  objc_storeStrong((id *)&self->_healthSettingsDataSource, 0);
}

@end
