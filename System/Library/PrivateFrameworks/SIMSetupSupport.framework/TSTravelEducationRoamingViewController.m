@implementation TSTravelEducationRoamingViewController

- (TSTravelEducationRoamingViewController)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  dispatch_queue_t v7;
  CoreTelephonyClient *v8;
  CoreTelephonyClient *client;
  TSTravelEducationRoamingViewController *v10;
  objc_super v12;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("TRAVEL_ROAMING_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TRAVEL_ROAMING_BODY"), &stru_24DEF4290, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = dispatch_queue_create(CFSTR("Core Analytics"), 0);
  v8 = (CoreTelephonyClient *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2810]), "initWithQueue:", v7);
  client = self->_client;
  self->_client = v8;

  v12.receiver = self;
  v12.super_class = (Class)TSTravelEducationRoamingViewController;
  v10 = -[TSTravelEducationRoamingViewController initWithTitle:detailText:symbolName:](&v12, sel_initWithTitle_detailText_symbolName_, v4, v6, CFSTR("antenna.radiowaves.left.and.right"));

  return v10;
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
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)TSTravelEducationRoamingViewController;
  -[TSOBWelcomeController viewDidLoad](&v17, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSTravelEducationRoamingViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__doneButtonTapped, 64);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_24DEF4290, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:forState:", v8, 0);

  -[TSTravelEducationRoamingViewController buttonTray](self, "buttonTray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addButton:", v6);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonTapped);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRightBarButtonItem:", v10);

  -[TSTravelEducationRoamingViewController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidesBackButton:", 0);

  -[TSTravelEducationRoamingViewController navigationController](self, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "navigationBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", v16);

}

- (void)_cancelButtonTapped
{
  CoreTelephonyClient *client;
  id WeakRetained;
  uint64_t v5;

  client = self->_client;
  v5 = 0;
  -[CoreTelephonyClient sendTravelBuddyCAEvent:carrierName:error:](client, "sendTravelBuddyCAEvent:carrierName:error:", CFSTR("Roaming View Controller_Cancel"), &stru_24DEF4290, &v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "userDidTapCancel");

}

- (void)_doneButtonTapped
{
  CoreTelephonyClient *client;
  id WeakRetained;
  uint64_t v5;

  client = self->_client;
  v5 = 0;
  -[CoreTelephonyClient sendTravelBuddyCAEvent:carrierName:error:](client, "sendTravelBuddyCAEvent:carrierName:error:", CFSTR("Roaming View Controller_Done"), &stru_24DEF4290, &v5);
  -[TSTravelEducationRoamingViewController _openRoamingSettings](self, "_openRoamingSettings");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "viewControllerDidComplete:", self);

}

- (void)_openRoamingSettings
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDC1548]);
  v3 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("TRAVEL_OPEN_ROAMING_URL"), &stru_24DEF4290, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  v7 = objc_msgSend(v2, "openSensitiveURL:withOptions:error:", v6, 0, &v12);
  v8 = v12;
  if (v8)
  {
    _TSLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "localizedDescription");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = objc_msgSend(v10, "UTF8String");
      *(_DWORD *)buf = 136315650;
      v14 = v11;
      v15 = 1024;
      v16 = v7;
      v17 = 2080;
      v18 = "-[TSTravelEducationRoamingViewController _openRoamingSettings]";
      _os_log_impl(&dword_21B647000, v9, OS_LOG_TYPE_DEFAULT, "launching data roaming settings failed with error: %s, isOpened:%d\n @%s", buf, 0x1Cu);

    }
  }

}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CoreTelephonyClient)client
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 1184, 1);
}

- (void)setClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1184);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
