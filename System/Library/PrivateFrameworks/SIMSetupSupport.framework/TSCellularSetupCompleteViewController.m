@implementation TSCellularSetupCompleteViewController

- (TSCellularSetupCompleteViewController)initWithPhoneNumber:(id)a3 planName:(id)a4 planActiveOnSource:(BOOL)a5
{
  void *v5;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  TSCellularSetupCompleteViewController *v22;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  if (a5)
  {
    v11 = objc_msgSend(v9, "length");
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v11)
    {
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_COMPLETE_DETAIL_PHONENUMBER_%@"), &stru_24DEF4290, CFSTR("Localizable"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[TSUtilities formattedPhoneNumber:withCountryCode:](TSUtilities, "formattedPhoneNumber:withCountryCode:", v9, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", v15, v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

      goto LABEL_11;
    }
    v17 = CFSTR("CELLULAR_PLAN_COMPLETE_DETAIL_%@");
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v17 = CFSTR("CELLULAR_PLAN_COMPLETE_DETAIL_FOR_DISABLED_ESIM_%@");
  }
  objc_msgSend(v13, "localizedStringForKey:value:table:", v17, &stru_24DEF4290, CFSTR("Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v10, "length");
  v19 = v10;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TRANSFER_PLAN_ITEM_TITLE_NO_CARRIER_NAME"), &stru_24DEF4290, CFSTR("Localizable"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "stringWithFormat:", v15, v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {

    goto LABEL_10;
  }
LABEL_11:

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_COMPLETE_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)TSCellularSetupCompleteViewController;
  v22 = -[TSCellularSetupCompleteViewController initWithTitle:detailText:symbolName:](&v24, sel_initWithTitle_detailText_symbolName_, v21, v16, CFSTR("antenna.radiowaves.left.and.right"));

  return v22;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  OBBoldTrayButton *v6;
  OBBoldTrayButton *continueButton;
  OBBoldTrayButton *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)TSCellularSetupCompleteViewController;
  -[TSOBWelcomeController viewDidLoad](&v18, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularSetupCompleteViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v6 = (OBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
  continueButton = self->_continueButton;
  self->_continueButton = v6;

  -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_continueButton, "addTarget:action:forControlEvents:", self, sel__continueButtonTapped, 64);
  LODWORD(v3) = +[TSUtilities inBuddy](TSUtilities, "inBuddy");
  v8 = self->_continueButton;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((_DWORD)v3)
    v11 = CFSTR("CONTINUE");
  else
    v11 = CFSTR("DONE");
  objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_24DEF4290, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBoldTrayButton setTitle:forState:](v8, "setTitle:forState:", v12, 0);

  -[TSCellularSetupCompleteViewController buttonTray](self, "buttonTray");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addButton:", self->_continueButton);

  -[OBBoldTrayButton setEnabled:](self->_continueButton, "setEnabled:", 1);
  if (!+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    -[TSCellularSetupCompleteViewController navigationController](self, "navigationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "navigationBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v16);

  }
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHidesBackButton:animated:", 1, 0);

}

- (void)_continueButtonTapped
{
  id v3;

  -[TSCellularSetupCompleteViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllerDidComplete:", self);

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
  objc_storeStrong(&self->viewController, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
}

@end
