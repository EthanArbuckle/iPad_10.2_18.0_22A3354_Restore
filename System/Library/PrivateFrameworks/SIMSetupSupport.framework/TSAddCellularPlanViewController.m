@implementation TSAddCellularPlanViewController

- (TSAddCellularPlanViewController)initWithType:(unint64_t)a3 allowDismiss:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  TSAddCellularPlanViewController *v14;
  TSAddCellularPlanViewController *v15;
  objc_super v17;

  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SET_UP_CELLULAR"), &stru_24DEF4290, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("ADD_CELLULAR_PLAN_DETAIL");
  }
  else if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("FINISH_SETTING_UP_CELLULAR_PLAN_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("FINISH_SETTING_UP_CELLULAR_PLAN_DESCRIPTION");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ADD_CELLULAR_PLAN_TITLE_ADD_PLAN"), &stru_24DEF4290, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("ADD_CELLULAR_PLAN_DETAIL_ADD_PLAN");
  }
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_24DEF4290, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v17.receiver = self;
  v17.super_class = (Class)TSAddCellularPlanViewController;
  v14 = -[TSAddCellularPlanViewController initWithTitle:detailText:icon:](&v17, sel_initWithTitle_detailText_icon_, v7, v13, 0);
  v15 = v14;
  if (v14)
    v14->_allowDismiss = a4;

  return v15;
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
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TSAddCellularPlanViewController;
  -[TSOBWelcomeController viewDidLoad](&v15, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSAddCellularPlanViewController navigationController](self, "navigationController");
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

  -[TSAddCellularPlanViewController buttonTray](self, "buttonTray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addButton:", v6);

  if (self->_allowDismiss)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonTapped);
    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLeftBarButtonItem:", v10);

  }
  if (!+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    -[TSAddCellularPlanViewController navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "navigationBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v14);

  }
}

- (void)_cancelButtonTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "userDidTapCancel");

}

- (void)_doneButtonTapped
{
  id WeakRetained;

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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
