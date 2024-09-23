@implementation SBActivationInfoViewController

- (SBActivationInfoViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SBActivationInfoViewController *v4;
  void *v5;
  uint64_t v6;
  NSString *serial;
  NSString *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBActivationInfoViewController;
  v4 = -[SBActivationInfoViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    objc_msgSend((id)SBApp, "telephonyStateProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:", v4);

    v6 = MGCopyAnswer();
    serial = v4->_serial;
    if (v6)
      v8 = (NSString *)v6;
    else
      v8 = 0;
    v4->_serial = v8;

    -[SBActivationInfoViewController _updateMobileEquipmentInfo](v4, "_updateMobileEquipmentInfo");
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend((id)SBApp, "telephonyStateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBActivationInfoViewController;
  -[SBActivationInfoViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  id v3;
  UITableView *v4;
  UITableView *activationInfoTableView;
  UITableView *v6;
  void *v7;
  UITableView *v8;
  void *v9;
  UIButton *v10;
  UIButton *regulatoryInfoButton;
  UIButton *v12;
  void *v13;
  void *v14;
  UIButton *v15;
  void *v16;
  id v17;
  UIButton *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CEAA58]);
  v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  activationInfoTableView = self->_activationInfoTableView;
  self->_activationInfoTableView = v4;

  v6 = self->_activationInfoTableView;
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView setBackgroundColor:](v6, "setBackgroundColor:", v7);

  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_activationInfoTableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITableView setBounces:](self->_activationInfoTableView, "setBounces:", 0);
  -[UITableView setSectionFooterHeight:](self->_activationInfoTableView, "setSectionFooterHeight:", 0.0);
  v8 = self->_activationInfoTableView;
  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView setSeparatorColor:](v8, "setSeparatorColor:", v9);

  -[UITableView setDataSource:](self->_activationInfoTableView, "setDataSource:", self);
  -[UITableView setDelegate:](self->_activationInfoTableView, "setDelegate:", self);
  -[UITableView reloadData](self->_activationInfoTableView, "reloadData");
  -[UITableView sizeToFit](self->_activationInfoTableView, "sizeToFit");
  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
  v10 = (UIButton *)objc_claimAutoreleasedReturnValue();
  regulatoryInfoButton = self->_regulatoryInfoButton;
  self->_regulatoryInfoButton = v10;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_regulatoryInfoButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v12 = self->_regulatoryInfoButton;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("REGULATORY_INFO_BUTTON_LABEL"), CFSTR("Regulatory"), CFSTR("SpringBoard"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](v12, "setTitle:forState:", v14, 0);

  if (_os_feature_enabled_impl())
  {
    v15 = self->_regulatoryInfoButton;
    -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v15, "setTintColor:", v16);

  }
  -[UIButton sizeToFit](self->_regulatoryInfoButton, "sizeToFit");
  v17 = objc_alloc(MEMORY[0x1E0CEA9E0]);
  v18 = self->_regulatoryInfoButton;
  v38[0] = self->_activationInfoTableView;
  v38[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v17, "initWithArrangedSubviews:", v19);

  objc_msgSend(v20, "setAxis:", 1);
  objc_msgSend(v20, "setAlignment:", 3);
  objc_msgSend(v20, "setDistribution:", 3);
  objc_msgSend(v20, "setSpacing:", 24.0);
  objc_storeStrong((id *)&self->_containerView, v20);
  -[UIView systemLayoutSizeFittingSize:](self->_containerView, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0CEB980], *(double *)(MEMORY[0x1E0CEB980] + 8));
  v22 = v21;
  -[UITableView heightAnchor](self->_activationInfoTableView, "heightAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView contentSize](self->_activationInfoTableView, "contentSize");
  objc_msgSend(v23, "constraintEqualToConstant:", v22 + v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v26) = 1132068864;
  objc_msgSend(v25, "setPriority:", v26);
  objc_storeStrong((id *)&self->_activationInfoTableViewHeight, v25);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "userInterfaceIdiom");

  if ((v28 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "readableWidth");
    v31 = v30;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bounds");
    v31 = v32;
  }

  -[UITableView widthAnchor](self->_activationInfoTableView, "widthAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToConstant:", v31);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBActivationInfoViewController setView:](self, "setView:", self->_containerView);
  v35 = (void *)MEMORY[0x1E0CB3718];
  v37[0] = v34;
  v37[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "activateConstraints:", v36);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBActivationInfoViewController;
  -[SBActivationInfoViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[UITableView reloadData](self->_activationInfoTableView, "reloadData");
}

- (void)viewDidLayoutSubviews
{
  NSLayoutConstraint *activationInfoTableViewHeight;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBActivationInfoViewController;
  -[SBActivationInfoViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  activationInfoTableViewHeight = self->_activationInfoTableViewHeight;
  -[UITableView contentSize](self->_activationInfoTableView, "contentSize");
  -[NSLayoutConstraint setConstant:](activationInfoTableViewHeight, "setConstant:", v4);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)subscriptionInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__SBActivationInfoViewController_subscriptionInfoDidChangeForStateProvider_slot___block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __81__SBActivationInfoViewController_subscriptionInfoDidChangeForStateProvider_slot___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_telephonyStateChanged");
}

- (void)mobileEquipmentInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__SBActivationInfoViewController_mobileEquipmentInfoDidChangeForStateProvider_slot___block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __84__SBActivationInfoViewController_mobileEquipmentInfoDidChangeForStateProvider_slot___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_telephonyStateChanged");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[NSArray objectAtIndexedSubscript:](self->_mobileEquipmentInfo, "objectAtIndexedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("ACTIVATION_INFO_CELL_ID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[SBActivationInfoViewController _activationInfoCell](self, "_activationInfoCell");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  v11 = objc_msgSend(v6, "section");
  v12 = objc_msgSend(v6, "row");

  -[NSArray objectAtIndexedSubscript:](self->_mobileEquipmentInfo, "objectAtIndexedSubscript:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), &stru_1E8EC7EC0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v18);

  objc_msgSend(v10, "detailTextLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAdjustsFontSizeToFitWidth:", 1);

  objc_msgSend(v10, "detailTextLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setMinimumScaleFactor:", 0.5);

  objc_msgSend(v10, "detailTextLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setText:", v16);

  return v10;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_mobileEquipmentInfo, "count", a3);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E0CEBC10];
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 2.22507386e-308;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("ACTIVATION_INFO_HEADER_ID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA78]), "initWithReuseIdentifier:", CFSTR("ACTIVATION_INFO_HEADER_ID"));
    -[SBActivationInfoViewController _backgroundViewForHeaderView:](self, "_backgroundViewForHeaderView:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundView:", v7);

  }
  objc_msgSend(v6, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBActivationInfoViewController _titleForHeaderInSection:](self, "_titleForHeaderInSection:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  return v6;
}

- (void)_telephonyStateChanged
{
  -[SBActivationInfoViewController _updateMobileEquipmentInfo](self, "_updateMobileEquipmentInfo");
  -[UITableView reloadData](self->_activationInfoTableView, "reloadData");
}

- (void)_updateMobileEquipmentInfo
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *meid;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  NSArray *mobileSubscriptionInfo;
  void *v15;
  void *v16;
  NSArray *v17;
  NSArray *mobileEquipmentInfo;
  id v19;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasCellularData");

  if (v4)
  {
    +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_primaryMobileEquipmentInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "MEID");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    meid = self->_meid;
    self->_meid = v7;

    if (v6)
    {
      -[SBActivationInfoViewController _processMobileEquipmentInfo:](self, "_processMobileEquipmentInfo:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v9);

    }
    +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_secondaryMobileEquipmentInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[SBActivationInfoViewController _processMobileEquipmentInfo:](self, "_processMobileEquipmentInfo:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v12);

    }
    -[SBActivationInfoViewController _processMobileSubscriptionInfo](self, "_processMobileSubscriptionInfo");
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    mobileSubscriptionInfo = self->_mobileSubscriptionInfo;
    self->_mobileSubscriptionInfo = v13;

  }
  -[SBActivationInfoViewController _processDeviceInfo](self, "_processDeviceInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v19;
  if (v15)
  {
    objc_msgSend(v19, "insertObject:atIndex:", v15, 0);
    v16 = v19;
  }
  v17 = (NSArray *)objc_msgSend(v16, "copy");
  mobileEquipmentInfo = self->_mobileEquipmentInfo;
  self->_mobileEquipmentInfo = v17;

}

- (id)_processMobileSubscriptionInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_primarySubscriptionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "SIMLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uppercaseString");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = CFSTR("PRIMARY");
    if (v6)
      v8 = (__CFString *)v6;
    v9 = v8;

  }
  else
  {
    v9 = CFSTR(" ");
  }
  +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_secondarySubscriptionInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "SIMLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uppercaseString");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = CFSTR("SECONDARY");
    if (v13)
      v15 = (__CFString *)v13;
    v16 = v15;

    objc_msgSend(v2, "addObject:", v9);
    objc_msgSend(v2, "addObject:", v16);

  }
  else
  {

    v9 = CFSTR(" ");
    objc_msgSend(v2, "addObject:", CFSTR(" "));
  }
  v17 = (void *)objc_msgSend(v2, "copy");

  return v17;
}

- (id)_processMobileEquipmentInfo:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "IMEI");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ICCID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CSN");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "isOnBootstrap");

  if (v7)
  {
    -[SBActivationInfoViewController _formattedIMEI:](self, "_formattedIMEI:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("NO_NAME"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v13 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v13;
    }
    objc_msgSend(v6, "setObject:forKey:", v11, CFSTR("IMEI:"));
    -[SBActivationInfoViewController _formattedEID:](self, "_formattedEID:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v6, "setObject:forKey:", v14, CFSTR("EID:"));
    if ((v10 & 1) == 0)
    {
      -[SBActivationInfoViewController _formattedICCID:](self, "_formattedICCID:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v15, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("NO_NAME"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
        v17 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v17;
      }
      objc_msgSend(v6, "setObject:forKey:", v15, CFSTR("ICCID:"));

    }
  }
  v18 = (void *)objc_msgSend(v6, "copy");

  return v18;
}

- (id)_processDeviceInfo
{
  void *v3;
  NSString *meid;
  NSString *v5;
  void *v6;
  uint64_t v7;
  NSString *serial;
  NSString *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  if (self->_serial || self->_meid)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    meid = self->_meid;
    if (meid)
    {
      v5 = meid;
      if (!-[NSString length](v5, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NO_NAME"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
        v7 = objc_claimAutoreleasedReturnValue();

        v5 = (NSString *)v7;
      }
      objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("MEID:"));

    }
    serial = self->_serial;
    if (serial)
    {
      v9 = serial;
      if (!-[NSString length](v9, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("NO_NAME"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
        v11 = objc_claimAutoreleasedReturnValue();

        v9 = (NSString *)v11;
      }
      objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("SN:"));

    }
  }
  else
  {
    v3 = 0;
  }
  v12 = (void *)objc_msgSend(v3, "copy");

  return v12;
}

- (id)_titleForHeaderInSection:(int64_t)a3
{
  if (!a3)
    return 0;
  -[NSArray objectAtIndexedSubscript:](self->_mobileSubscriptionInfo, "objectAtIndexedSubscript:", a3 - 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_activationInfoCell
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

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA60]), "initWithStyle:reuseIdentifier:", 1, CFSTR("ACTIVATION_INFO_CELL_ID"));
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setSelectionStyle:", 0);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB568]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailTextLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  objc_msgSend(v3, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v10);

  objc_msgSend(v3, "detailTextLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v12);

  return v3;
}

- (id)_backgroundViewForHeaderView:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;

  v3 = (objc_class *)MEMORY[0x1E0CEABB0];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = (void *)objc_msgSend(v5, "initWithFrame:", v7, v9, v11, v13);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v15);

  return v14;
}

- (id)_formattedICCID:(id)a3
{
  return -[SBActivationInfoViewController _formattedString:withSpaceAfterDigits:](self, "_formattedString:withSpaceAfterDigits:", a3, 4);
}

- (id)_formattedIMEI:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  if ((unint64_t)objc_msgSend(v3, "length") >= 3)
    objc_msgSend(v3, "insertString:atIndex:", CFSTR(" "), 2);
  if ((unint64_t)objc_msgSend(v3, "length") >= 0xA)
    objc_msgSend(v3, "insertString:atIndex:", CFSTR(" "), 9);
  if ((unint64_t)objc_msgSend(v3, "length") >= 0x11)
    objc_msgSend(v3, "insertString:atIndex:", CFSTR(" "), 16);
  return v3;
}

- (id)_formattedEID:(id)a3
{
  return -[SBActivationInfoViewController _formattedString:withSpaceAfterDigits:](self, "_formattedString:withSpaceAfterDigits:", a3, 8);
}

- (id)_formattedString:(id)a3 withSpaceAfterDigits:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    if (objc_msgSend(v6, "length") >= a4)
    {
      v8 = objc_msgSend(v6, "length");
      if (v8 > a4)
      {
        v9 = v8;
        v10 = a4;
        v11 = a4;
        do
        {
          objc_msgSend(v7, "insertString:atIndex:", CFSTR(" "), v10);
          v11 += a4;
          v10 += a4 + 1;
        }
        while (v11 < v9);
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)mobileEquipmentInfo
{
  return self->_mobileEquipmentInfo;
}

- (void)setMobileEquipmentInfo:(id)a3
{
  objc_storeStrong((id *)&self->_mobileEquipmentInfo, a3);
}

- (UIButton)regulatoryInfoButton
{
  return self->_regulatoryInfoButton;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_regulatoryInfoButton, 0);
  objc_storeStrong((id *)&self->_activationInfoTableViewHeight, 0);
  objc_storeStrong((id *)&self->_activationInfoTableView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_mobileSubscriptionInfo, 0);
  objc_storeStrong((id *)&self->_mobileEquipmentInfo, 0);
  objc_storeStrong((id *)&self->_serial, 0);
  objc_storeStrong((id *)&self->_meid, 0);
}

@end
