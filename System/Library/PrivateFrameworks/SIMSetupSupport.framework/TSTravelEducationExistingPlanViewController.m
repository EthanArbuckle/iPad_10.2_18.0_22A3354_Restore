@implementation TSTravelEducationExistingPlanViewController

- (TSTravelEducationExistingPlanViewController)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  dispatch_queue_t v7;
  CoreTelephonyClient *v8;
  CoreTelephonyClient *client;
  TSTravelEducationExistingPlanViewController *v10;
  objc_super v12;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("TRAVEL_EXISTING_PLAN_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TRAVEL_EXISTING_PLAN_BODY"), &stru_24DEF4290, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = dispatch_queue_create(CFSTR("Core Analytics"), 0);
  v8 = (CoreTelephonyClient *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2810]), "initWithQueue:", v7);
  client = self->_client;
  self->_client = v8;

  v12.receiver = self;
  v12.super_class = (Class)TSTravelEducationExistingPlanViewController;
  v10 = -[TSTravelEducationExistingPlanViewController initWithTitle:detailText:symbolName:](&v12, sel_initWithTitle_detailText_symbolName_, v4, v6, CFSTR("antenna.radiowaves.left.and.right"));

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
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TSTravelEducationExistingPlanViewController;
  -[TSOBWelcomeController viewDidLoad](&v14, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__doneButtonTapped, 64);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_24DEF4290, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:forState:", v5, 0);

  -[TSTravelEducationExistingPlanViewController buttonTray](self, "buttonTray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addButton:", v3);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonTapped);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItem:", v7);

  -[TSTravelEducationExistingPlanViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidesBackButton:", 0);

  -[TSTravelEducationExistingPlanViewController navigationController](self, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "navigationBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v13);

}

- (void)_cancelButtonTapped
{
  CoreTelephonyClient *client;
  id WeakRetained;
  uint64_t v5;

  client = self->_client;
  v5 = 0;
  -[CoreTelephonyClient sendTravelBuddyCAEvent:carrierName:error:](client, "sendTravelBuddyCAEvent:carrierName:error:", CFSTR("Existing Plan View Controller_Cancel"), &stru_24DEF4290, &v5);
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
  -[CoreTelephonyClient sendTravelBuddyCAEvent:carrierName:error:](client, "sendTravelBuddyCAEvent:carrierName:error:", CFSTR("Existing Plan View Controller_Done"), &stru_24DEF4290, &v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "viewControllerDidComplete:", self);

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
