@implementation STScreenTimeReportController

- (STScreenTimeReportController)initWithTitle:(id)a3 coordinator:(id)a4 pinControllerDelegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  STScreenTimeReportController *v11;
  _TtC20ScreenTimeSettingsUI27STAllActivityViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _TtC20ScreenTimeSettingsUI27STAllActivityViewController *appAndWebsiteActivityViewController;
  uint64_t v18;
  STNotificationSettingsGateway *notificationSettingsGateway;
  uint64_t v20;
  STDatePickerBar *datePickerBar;
  uint64_t v22;
  STDebouncer *datePickerHiddenDebouncer;
  id location;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)STScreenTimeReportController;
  v11 = -[STScreenTimeReportController initWithNibName:bundle:](&v26, sel_initWithNibName_bundle_, 0, 0);
  -[STScreenTimeReportController setTitle:](v11, "setTitle:", v8);
  objc_initWeak(&location, v11);
  v12 = [_TtC20ScreenTimeSettingsUI27STAllActivityViewController alloc];
  objc_msgSend(v9, "viewModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "me");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "altDSID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[STAllActivityViewController initWithUserAltDSID:deviceIdentifier:](v12, "initWithUserAltDSID:deviceIdentifier:", v15, 0);
  appAndWebsiteActivityViewController = v11->_appAndWebsiteActivityViewController;
  v11->_appAndWebsiteActivityViewController = (_TtC20ScreenTimeSettingsUI27STAllActivityViewController *)v16;

  objc_storeStrong((id *)&v11->_pinControllerDelegate, a5);
  v18 = objc_opt_new();
  notificationSettingsGateway = v11->_notificationSettingsGateway;
  v11->_notificationSettingsGateway = (STNotificationSettingsGateway *)v18;

  v20 = objc_opt_new();
  datePickerBar = v11->_datePickerBar;
  v11->_datePickerBar = (STDatePickerBar *)v20;

  -[STDatePickerBar updateWithCoordinator:](v11->_datePickerBar, "updateWithCoordinator:", v9);
  v22 = objc_msgSend(objc_alloc(MEMORY[0x24BE84578]), "initWithMinCoalescenceInterval:maxCoalescenceInterval:", 0.1, 1.0);
  datePickerHiddenDebouncer = v11->_datePickerHiddenDebouncer;
  v11->_datePickerHiddenDebouncer = (STDebouncer *)v22;

  -[STDebouncer setDelegate:](v11->_datePickerHiddenDebouncer, "setDelegate:", v11);
  -[STScreenTimeReportController setCoordinator:](v11, "setCoordinator:", v9);
  -[STAllActivityViewController loadViewIfNeeded](v11->_appAndWebsiteActivityViewController, "loadViewIfNeeded");
  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");

  objc_destroyWeak(&location);
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[STScreenTimeReportController setCoordinator:](self, "setCoordinator:", 0);
  v3.receiver = self;
  v3.super_class = (Class)STScreenTimeReportController;
  -[STScreenTimeReportController dealloc](&v3, sel_dealloc);
}

- (void)setCoordinator:(id)a3
{
  STRootViewModelCoordinator *v4;
  STRootViewModelCoordinator *coordinator;
  STRootViewModelCoordinator *v6;

  v4 = (STRootViewModelCoordinator *)a3;
  -[STRootViewModelCoordinator removeObserver:forKeyPath:context:](self->_coordinator, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.viewModel.selectedCoreDuetIdentifier"), "KVOContextScreenTimeReportController");
  -[STRootViewModelCoordinator removeObserver:forKeyPath:context:](self->_coordinator, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.viewModel.selectedUsageReport"), "KVOContextScreenTimeReportController");
  -[STRootViewModelCoordinator removeObserver:forKeyPath:context:](self->_coordinator, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.devices"), "KVOContextScreenTimeReportController");
  -[STRootViewModelCoordinator removeObserver:forKeyPath:context:](self->_coordinator, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.viewModel.selectedItemDisplayName"), "KVOContextScreenTimeReportController");
  coordinator = self->_coordinator;
  self->_coordinator = v4;
  v6 = v4;

  -[STRootViewModelCoordinator addObserver:forKeyPath:options:context:](self->_coordinator, "addObserver:forKeyPath:options:context:", self, CFSTR("usageDetailsCoordinator.devices"), 7, "KVOContextScreenTimeReportController");
  -[STRootViewModelCoordinator addObserver:forKeyPath:options:context:](self->_coordinator, "addObserver:forKeyPath:options:context:", self, CFSTR("usageDetailsCoordinator.viewModel.selectedItemDisplayName"), 5, "KVOContextScreenTimeReportController");
  -[STRootViewModelCoordinator addObserver:forKeyPath:options:context:](self->_coordinator, "addObserver:forKeyPath:options:context:", self, CFSTR("usageDetailsCoordinator.viewModel.selectedCoreDuetIdentifier"), 5, "KVOContextScreenTimeReportController");
  -[STRootViewModelCoordinator addObserver:forKeyPath:options:context:](self->_coordinator, "addObserver:forKeyPath:options:context:", self, CFSTR("usageDetailsCoordinator.viewModel.selectedUsageReport"), 7, "KVOContextScreenTimeReportController");

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
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
  uint8_t buf[16];
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)STScreenTimeReportController;
  -[STScreenTimeReportController viewDidLoad](&v33, sel_viewDidLoad);
  -[STScreenTimeReportController appAndWebsiteActivityViewController](self, "appAndWebsiteActivityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STScreenTimeReportController addChildViewController:](self, "addChildViewController:", v3);
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[STScreenTimeReportController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);
  _NSDictionaryOfVariableBindings(CFSTR("contentView"), v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0x24BDD1000uLL;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[contentView]|"), 0, 0, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[contentView]|"), 0, 0, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STScreenTimeReportController datePickerBar](self, "datePickerBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v5;
  if (v10)
  {
    objc_msgSend(v5, "addSubview:", v10);
    objc_msgSend(v5, "readableContentGuide");
    v28 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topAnchor");
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)v12;
    objc_msgSend(v13, "constraintEqualToAnchor:", v12);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[STScreenTimeReportController setDatePickerTopConstraint:](self, "setDatePickerTopConstraint:", v26);
    objc_msgSend(v10, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v12);
    v27 = v8;
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[STScreenTimeReportController setDatePickerBottomConstraint:](self, "setDatePickerBottomConstraint:", v15);
    v16 = objc_alloc(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v10, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v17);
    v30 = v3;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trailingAnchor");
    v29 = v4;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingAnchor");
    v20 = v9;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v16, "initWithObjects:", v15, v18, v22, 0);

    v9 = v20;
    v7 = 0x24BDD1000;

    v4 = v29;
    v3 = v30;

    v6 = v28;
    v8 = v27;

  }
  else
  {
    v23 = (void *)objc_opt_new();
  }
  objc_msgSend(v23, "addObjectsFromArray:", v8);
  objc_msgSend(v23, "addObjectsFromArray:", v9);
  objc_msgSend(*(id *)(v7 + 1576), "activateConstraints:", v23);
  objc_msgSend(v3, "didMoveToParentViewController:", self);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STScreenTimeReportController.viewDidLoad", buf, 2u);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v10 = a3;
  v11 = a5;
  if (a6 == "KVOContextScreenTimeReportController")
  {
    -[STScreenTimeReportController coordinator](self, "coordinator");

    if (objc_msgSend(v10, "isEqualToString:", CFSTR("usageDetailsCoordinator.viewModel.selectedUsageReport")))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v13)
      {

        v12 = 0;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 == v15)
      {

        v14 = 0;
      }
      -[STScreenTimeReportController _selectedUsageReportDidChangeFrom:to:](self, "_selectedUsageReportDidChangeFrom:to:", v12, v14);
    }
    else
    {
      -[STScreenTimeReportController coordinator](self, "coordinator");

      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("usageDetailsCoordinator.devices")))
      {
        -[STScreenTimeReportController coordinator](self, "coordinator");

        if (objc_msgSend(v10, "isEqualToString:", CFSTR("usageDetailsCoordinator.viewModel.selectedItemDisplayName")))
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12 == v18)
          {

            v12 = 0;
          }
          -[STScreenTimeReportController setTitle:](self, "setTitle:", v12);
        }
        else
        {
          -[STScreenTimeReportController coordinator](self, "coordinator");

          if (!objc_msgSend(v10, "isEqualToString:", CFSTR("usageDetailsCoordinator.viewModel.selectedCoreDuetIdentifier")))goto LABEL_17;
          objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12 == v19)
          {

            v12 = 0;
          }
          -[STScreenTimeReportController _selectedCoreDuetIdentifierDidChange:](self, "_selectedCoreDuetIdentifierDidChange:", v12);
        }
        goto LABEL_16;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v16)
      {

        v12 = 0;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 == v17)
      {

        v14 = 0;
      }
      -[STScreenTimeReportController _devicesDidChangeFrom:to:](self, "_devicesDidChangeFrom:to:", v12, v14);
    }

LABEL_16:
    goto LABEL_17;
  }
  v20.receiver = self;
  v20.super_class = (Class)STScreenTimeReportController;
  -[STScreenTimeReportController observeValueForKeyPath:ofObject:change:context:](&v20, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, v11, a6);
LABEL_17:

}

- (void)_selectedUsageReportDidChangeFrom:(id)a3 to:(id)a4
{
  id v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  if (v16 != v6)
  {
    v7 = objc_msgSend(v16, "isEqual:", v6);
    if (v6)
    {
      if ((v7 & 1) == 0)
      {
        objc_msgSend(v6, "type");
        objc_msgSend(v6, "reportDateInterval");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "startDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeIntervalSinceReferenceDate");
        v11 = v10;

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f"), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "postNotificationName:object:", *MEMORY[0x24BE84918], v12);
        -[STScreenTimeReportController datePickerBar](self, "datePickerBar");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[STScreenTimeReportController coordinator](self, "coordinator");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "updateWithCoordinator:", v15);

      }
    }
  }

}

- (void)_devicesDidChangeFrom:(id)a3 to:(id)a4
{
  id v6;
  _BOOL4 v7;
  unint64_t v8;
  id v9;

  v6 = a4;
  v7 = (unint64_t)objc_msgSend(a3, "count") < 2;
  v8 = objc_msgSend(v6, "count");

  if (((v7 ^ (v8 > 1)) & 1) == 0)
  {
    -[STScreenTimeReportController coordinator](self, "coordinator");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    +[STDevicesMenu updateWithCoordinator:viewController:](STDevicesMenu, "updateWithCoordinator:viewController:", v9, self);

  }
}

- (void)_selectedCoreDuetIdentifierDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[STScreenTimeReportController coordinator](self, "coordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "me");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "altDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BE84580], "deviceIdentifierByCoreDuetIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
    -[STScreenTimeReportController appAndWebsiteActivityViewController](self, "appAndWebsiteActivityViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateWithUserAltDSID:deviceIdentifier:", v7, v9);

  }
  else
  {
    -[STScreenTimeReportController appAndWebsiteActivityViewController](self, "appAndWebsiteActivityViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateWithUserAltDSID:deviceIdentifier:", 0, 0);
  }

}

- (void)_dateModeDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (int)objc_msgSend(v4, "intValue");

  -[STScreenTimeReportController coordinator](self, "coordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "usageDetailsCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewModel");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v5 == 1)
      objc_msgSend(v8, "setSelectedDay:", 0x7FFFFFFFFFFFFFFFLL);
  }
  else
  {
    objc_msgSend(v8, "selectToday");
  }

}

- (void)_dateModePickerDidAppear
{
  id v2;

  -[STScreenTimeReportController datePickerHiddenDebouncer](self, "datePickerHiddenDebouncer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounce:", MEMORY[0x24BDBD1C8]);

}

- (void)_dateModePickerDidDisappear
{
  id v2;

  -[STScreenTimeReportController datePickerHiddenDebouncer](self, "datePickerHiddenDebouncer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounce:", MEMORY[0x24BDBD1C0]);

}

- (void)_didTapShowTodayButton:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[STScreenTimeReportController coordinator](self, "coordinator", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "usageDetailsCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectToday");

}

- (void)_didTapShowThisWeekButton:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[STScreenTimeReportController coordinator](self, "coordinator", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "usageDetailsCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedWeek:", 0);

}

- (void)_didTapNotificationsLink:(id)a3
{
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
  id WeakRetained;
  id v16;

  objc_msgSend(a3, "object");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[STScreenTimeReportController notificationSettingsGateway](self, "notificationSettingsGateway");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationSettingsForBundleIdentifier:", v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE844B8], "sharedCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appInfoForBundleIdentifier:", v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(v7, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[STScreenTimeReportController pinControllerDelegate](self, "pinControllerDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, v10, 0, 0, 0, 2, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    PSBundlePathForPreferenceBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE75B68]);

    objc_msgSend(v11, "setObject:forKeyedSubscript:", *MEMORY[0x24BE84910], *MEMORY[0x24BE759F8]);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE758E8]);
    objc_msgSend(v11, "setControllerLoadAction:", sel_lazyLoadBundle_);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE84920]);
    objc_msgSend(v11, "setIdentifier:", v16);
    -[STScreenTimeReportController pinControllerDelegate](self, "pinControllerDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "selectSpecifier:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setParentController:", self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_rootController);
    objc_msgSend(v14, "setRootController:", WeakRetained);

    objc_msgSend(v14, "setSpecifier:", v11);
    -[STScreenTimeReportController showController:animate:](self, "showController:animate:", v14, 1);

  }
}

- (void)_didTapEditLimitLink:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[STScreenTimeReportController viewIfLoaded](self, "viewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v12, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[STScreenTimeReportController coordinator](self, "coordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeAllowancesCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allowancesByIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[STScreenTimeReportController _editLimit:isNewLimit:](self, "_editLimit:isNewLimit:", v11, 0);
  }

}

- (void)_didPressAddApplicationLimitButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[STScreenTimeReportController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STScreenTimeReportController coordinator](self, "coordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isPasscodeEnabled");
    v10 = v7;
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setBehaviorType:", v9);
    if (v10)
    {
      v13[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBundleIdentifiers:", v12);

    }
    -[STScreenTimeReportController _editLimit:isNewLimit:](self, "_editLimit:isNewLimit:", v11, 1);

  }
}

- (void)_didPressAddCategoryLimitButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[STScreenTimeReportController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STScreenTimeReportController coordinator](self, "coordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isPasscodeEnabled");
    v10 = v7;
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setBehaviorType:", v9);
    if (v10)
    {
      v13[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCategoryIdentifiers:", v12);

    }
    -[STScreenTimeReportController _editLimit:isNewLimit:](self, "_editLimit:isNewLimit:", v11, 1);

  }
}

- (void)_didPressAddWebDomainLimitButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[STScreenTimeReportController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STScreenTimeReportController coordinator](self, "coordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isPasscodeEnabled");
    v10 = v7;
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setBehaviorType:", v9);
    if (v10)
    {
      v13[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWebDomains:", v12);

    }
    -[STScreenTimeReportController _editLimit:isNewLimit:](self, "_editLimit:isNewLimit:", v11, 1);

  }
}

- (void)_didTapBarMark:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = (objc_class *)MEMORY[0x24BDBCE60];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "doubleValue");
  v14 = (id)objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:");

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components:fromDate:", 512, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "weekday");

  -[STScreenTimeReportController coordinator](self, "coordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "usageDetailsCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "viewModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setSelectedDay:", v10);
}

- (void)_editLimit:(id)a3 isNewLimit:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  STAllowanceDetailListController *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  id WeakRetained;
  void *v24;
  void *v25;
  _QWORD aBlock[5];
  id v27;
  BOOL v28;

  v4 = a4;
  v6 = a3;
  -[STScreenTimeReportController coordinator](self, "coordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STScreenTimeReportController pinControllerDelegate](self, "pinControllerDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BEBD3C8], "isRunningInStoreDemoMode"))
  {
    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerForFeatureNotAvailable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[STScreenTimeReportController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

  }
  else
  {
    if (objc_msgSend(v7, "isPasscodeEnabled")
      && (objc_msgSend(v7, "hasAlreadyEnteredPINForSession") & 1) == 0)
    {
      v16 = (void *)MEMORY[0x24BE75590];
      v17 = (void *)objc_opt_new();
      objc_msgSend(v17, "UUIDString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v18, v8, 0, 0, 0, 13, objc_opt_class());
      v10 = (STAllowanceDetailListController *)objc_claimAutoreleasedReturnValue();

      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[STAllowanceDetailListController setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v20, *MEMORY[0x24BE75C60]);

      -[STAllowanceDetailListController setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", &unk_24DBBE730, *MEMORY[0x24BE75E18]);
      -[STAllowanceDetailListController setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE75E10]);
      -[STAllowanceDetailListController setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], 0x24DB91010);
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __54__STScreenTimeReportController__editLimit_isNewLimit___block_invoke;
      aBlock[3] = &unk_24DB86A90;
      aBlock[4] = self;
      v27 = v6;
      v28 = v4;
      v21 = _Block_copy(aBlock);
      -[STAllowanceDetailListController setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v21, 0x24DB90C10);

      v22 = (void *)objc_opt_new();
      objc_msgSend(v22, "setParentController:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_rootController);
      objc_msgSend(v22, "setRootController:", WeakRetained);

      objc_msgSend(v22, "setSpecifier:", v10);
      v24 = (void *)objc_opt_new();
      objc_msgSend(v24, "setPinDelegate:", v8);
      objc_msgSend(v24, "setParentController:", v22);
      objc_msgSend(v22, "rootController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setRootController:", v25);

      objc_msgSend(v24, "setSpecifier:", v10);
      objc_msgSend(v8, "showController:animate:", v22, 1);

    }
    else
    {
      v10 = -[STAllowanceDetailListController initWithCoordinator:]([STAllowanceDetailListController alloc], "initWithCoordinator:", v7);
      -[STAllowanceDetailListController setAllowance:](v10, "setAllowance:", v6);
      -[STAllowanceDetailListController setDelegate:](v10, "setDelegate:", self);
      -[STAllowanceDetailListController setIsSetupController:](v10, "setIsSetupController:", v4);
      -[STAllowanceDetailListController setCreatingNewAllowance:](v10, "setCreatingNewAllowance:", v4);
      if (v4)
      {
        v11 = (void *)objc_opt_new();
        objc_msgSend(v11, "setParentController:", v8);
        v12 = objc_loadWeakRetained((id *)&self->_rootController);
        objc_msgSend(v11, "setRootController:", v12);

        objc_msgSend(v11, "setSpecifier:", self->_specifier);
        -[STAllowanceDetailListController setParentController:](v10, "setParentController:", v11);
        objc_msgSend(v11, "rootController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[STAllowanceDetailListController setRootController:](v10, "setRootController:", v13);

        objc_msgSend(v11, "specifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[STAllowanceDetailListController setSpecifier:](v10, "setSpecifier:", v14);

        objc_msgSend(v11, "showController:", v10);
        objc_msgSend(v8, "showController:animate:", v11, 1);

      }
      else
      {
        -[STAllowanceDetailListController setParentController:](v10, "setParentController:", self);
        v15 = objc_loadWeakRetained((id *)&self->_rootController);
        -[STAllowanceDetailListController setRootController:](v10, "setRootController:", v15);

        -[STAllowanceDetailListController setSpecifier:](v10, "setSpecifier:", self->_specifier);
        -[STScreenTimeReportController showController:animate:](self, "showController:animate:", v10, 1);
      }
    }

  }
}

uint64_t __54__STScreenTimeReportController__editLimit_isNewLimit___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_editLimit:isNewLimit:", *(_QWORD *)(result + 40), *(unsigned __int8 *)(result + 48));
  return result;
}

- (void)debouncer:(id)a3 didDebounce:(id)a4
{
  -[STScreenTimeReportController setDatePickerHidden:](self, "setDatePickerHidden:", objc_msgSend(a4, "BOOLValue", a3));
}

- (BOOL)isDatePickerHidden
{
  void *v3;
  char v4;
  void *v5;

  -[STScreenTimeReportController datePickerTopConstraint](self, "datePickerTopConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isActive") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[STScreenTimeReportController datePickerBottomConstraint](self, "datePickerBottomConstraint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isActive");

  }
  return v4;
}

- (void)setDatePickerHidden:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  BOOL v13;
  _QWORD v14[5];

  v3 = a3;
  -[STScreenTimeReportController viewIfLoaded](self, "viewIfLoaded");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "window");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = -[STScreenTimeReportController isDatePickerHidden](self, "isDatePickerHidden");

    if (v7 != v3)
    {
      -[STScreenTimeReportController datePickerTopConstraint](self, "datePickerTopConstraint");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setActive:", v3 ^ 1);

      -[STScreenTimeReportController datePickerBottomConstraint](self, "datePickerBottomConstraint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setActive:", v3);

      v10 = MEMORY[0x24BDAC760];
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __52__STScreenTimeReportController_setDatePickerHidden___block_invoke;
      v14[3] = &unk_24DB86440;
      v14[4] = self;
      objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 0x20000, v14, 0, 0.6, 0.0);
      v12[0] = v10;
      v12[1] = 3221225472;
      v12[2] = __52__STScreenTimeReportController_setDatePickerHidden___block_invoke_2;
      v12[3] = &unk_24DB86AB8;
      v12[4] = self;
      v13 = v3;
      objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 0x20000, v12, 0, 0.2, 0.0);
    }
  }
  else
  {

  }
}

void __52__STScreenTimeReportController_setDatePickerHidden___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

void __52__STScreenTimeReportController_setDatePickerHidden___block_invoke_2(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  else
    v1 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "datePickerBar");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

- (void)allowanceDetailController:(id)a3 didSaveAllowance:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  STScreenTimeReportController *v13;

  v6 = a3;
  v7 = a4;
  -[STScreenTimeReportController coordinator](self, "coordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeAllowancesCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __75__STScreenTimeReportController_allowanceDetailController_didSaveAllowance___block_invoke;
  v11[3] = &unk_24DB86690;
  v12 = v6;
  v13 = self;
  v10 = v6;
  objc_msgSend(v9, "saveAllowance:completionHandler:", v7, v11);

}

void __75__STScreenTimeReportController_allowanceDetailController_didSaveAllowance___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  if (v3)
  {
    +[STUILog persistence](STUILog, "persistence");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __75__STScreenTimeReportController_allowanceDetailController_didSaveAllowance___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "isSetupController"))
    objc_msgSend(*(id *)(a1 + 40), "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)allowanceDetailController:(id)a3 didDeleteAllowance:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v5 = a4;
  -[STScreenTimeReportController coordinator](self, "coordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeAllowancesCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __77__STScreenTimeReportController_allowanceDetailController_didDeleteAllowance___block_invoke;
  v8[3] = &unk_24DB866E0;
  v8[4] = self;
  objc_msgSend(v7, "deleteAllowance:completionHandler:", v5, v8);

}

void __77__STScreenTimeReportController_allowanceDetailController_didDeleteAllowance___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  if (v3)
  {
    +[STUILog persistence](STUILog, "persistence");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __77__STScreenTimeReportController_allowanceDetailController_didDeleteAllowance___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  }
  objc_msgSend(*(id *)(a1 + 32), "popViewControllerAnimated:", 1);

}

- (void)allowanceDetailControllerDidCancel:(id)a3
{
  -[STScreenTimeReportController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)setParentController:(id)a3
{
  objc_storeWeak((id *)&self->_parentController, a3);
}

- (id)parentController
{
  return objc_loadWeakRetained((id *)&self->_parentController);
}

- (void)setRootController:(id)a3
{
  objc_storeWeak((id *)&self->_rootController, a3);
}

- (id)rootController
{
  return objc_loadWeakRetained((id *)&self->_rootController);
}

- (void)setSpecifier:(id)a3
{
  PSSpecifier *v5;
  PSSpecifier *v6;

  v5 = (PSSpecifier *)a3;
  if (self->_specifier != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_specifier, a3);
    v5 = v6;
  }

}

- (id)specifier
{
  return self->_specifier;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  objc_msgSend(MEMORY[0x24BE75578], "setPreferenceValue:specifier:", a3, a4);
}

- (id)readPreferenceValue:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE75578], "readPreferenceValue:", a3);
}

- (void)showController:(id)a3
{
  -[STScreenTimeReportController showController:animate:](self, "showController:animate:", a3, 1);
}

- (void)showController:(id)a3 animate:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  if (v4)
  {
    -[STScreenTimeReportController showViewController:sender:](self, "showViewController:sender:", v8, self);
    v6 = v8;
  }
  else
  {
    -[STScreenTimeReportController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushViewController:animated:", v8, 0);

    v6 = v7;
  }

}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (STRootViewModelCoordinator)coordinator
{
  return self->_coordinator;
}

- (_TtC20ScreenTimeSettingsUI27STAllActivityViewController)appAndWebsiteActivityViewController
{
  return (_TtC20ScreenTimeSettingsUI27STAllActivityViewController *)objc_getProperty(self, a2, 1000, 1);
}

- (STPINListViewController)pinControllerDelegate
{
  return (STPINListViewController *)objc_getProperty(self, a2, 1008, 1);
}

- (STDatePickerBar)datePickerBar
{
  return (STDatePickerBar *)objc_getProperty(self, a2, 1016, 1);
}

- (STDebouncer)datePickerHiddenDebouncer
{
  return (STDebouncer *)objc_getProperty(self, a2, 1024, 1);
}

- (NSLayoutConstraint)datePickerTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setDatePickerTopConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (NSLayoutConstraint)datePickerBottomConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setDatePickerBottomConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1040);
}

- (STNotificationSettingsGateway)notificationSettingsGateway
{
  return self->_notificationSettingsGateway;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationSettingsGateway, 0);
  objc_storeStrong((id *)&self->_datePickerBottomConstraint, 0);
  objc_storeStrong((id *)&self->_datePickerTopConstraint, 0);
  objc_storeStrong((id *)&self->_datePickerHiddenDebouncer, 0);
  objc_storeStrong((id *)&self->_datePickerBar, 0);
  objc_storeStrong((id *)&self->_pinControllerDelegate, 0);
  objc_storeStrong((id *)&self->_appAndWebsiteActivityViewController, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_destroyWeak((id *)&self->_rootController);
  objc_destroyWeak((id *)&self->_parentController);
}

void __75__STScreenTimeReportController_allowanceDetailController_didSaveAllowance___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_219AB4000, a2, a3, "Failed to save limit: %{public}@", a5, a6, a7, a8, 2u);
}

void __77__STScreenTimeReportController_allowanceDetailController_didDeleteAllowance___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_219AB4000, a2, a3, "Failed to delete limit: %{public}@", a5, a6, a7, a8, 2u);
}

@end
