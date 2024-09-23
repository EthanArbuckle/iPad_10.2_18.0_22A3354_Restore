@implementation TSCellularSetupTimeoutFailureViewController

- (TSCellularSetupTimeoutFailureViewController)initWithTimeoutReason:(int64_t)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  TSCellularSetupTimeoutFailureViewController *v12;
  const __CFString *v13;
  TSCellularSetupTimeoutFailureViewController *v14;
  TSCellularSetupTimeoutFailureViewController *v15;
  objc_super v17;
  objc_super v18;

  self->_timeoutReason = a3;
  v5 = +[TSUtilities inBuddy](TSUtilities, "inBuddy");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3 == 1)
  {
    if (v5)
      v8 = CFSTR("ERROR_TRANSFER_ITEM_CONSENT_TIMEOUT_MESSAGE_BUDDY");
    else
      v8 = CFSTR("ERROR_TRANSFER_ITEM_CONSENT_TIMEOUT_MESSAGE");
    objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24DEF4290, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ERROR_TRANSFER_ITEM_ACTIVATION_TIMEOUT_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[OBTableWelcomeController initWithTitle:detailText:symbolName:](&v18, sel_initWithTitle_detailText_symbolName_, v11, v9, 0, v17.receiver, v17.super_class, self, TSCellularSetupTimeoutFailureViewController);
  }
  else
  {
    if (v5)
      v13 = CFSTR("ACTIVATE_EXCEED_DETAIL");
    else
      v13 = CFSTR("ACTIVATE_EXCEED_DETAIL_POSTBUDDY");
    objc_msgSend(v6, "localizedStringForKey:value:table:", v13, &stru_24DEF4290, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ACTIVATE_EXCEED_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[OBTableWelcomeController initWithTitle:detailText:symbolName:](&v17, sel_initWithTitle_detailText_symbolName_, v11, v9, CFSTR("antenna.radiowaves.left.and.right"), self, TSCellularSetupTimeoutFailureViewController, v18.receiver, v18.super_class);
  }
  v14 = v12;

  v15 = v14;
  return v15;
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
  void *v18;
  OBLinkTrayButton *v19;
  OBLinkTrayButton *skipButton;
  OBLinkTrayButton *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)TSCellularSetupTimeoutFailureViewController;
  -[TSOBTableWelcomeController viewDidLoad](&v26, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularSetupTimeoutFailureViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v6 = (OBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
  continueButton = self->_continueButton;
  self->_continueButton = v6;

  -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_continueButton, "addTarget:action:forControlEvents:", self, sel__continueButtonTapped, 64);
  LODWORD(v4) = +[TSUtilities inBuddy](TSUtilities, "inBuddy");
  v8 = self->_continueButton;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((_DWORD)v4)
    v11 = CFSTR("CONTINUE");
  else
    v11 = CFSTR("DONE");
  objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_24DEF4290, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBoldTrayButton setTitle:forState:](v8, "setTitle:forState:", v12, 0);

  -[TSCellularSetupTimeoutFailureViewController buttonTray](self, "buttonTray");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addButton:", self->_continueButton);

  -[OBBoldTrayButton setEnabled:](self->_continueButton, "setEnabled:", 1);
  if (!+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    -[TSCellularSetupTimeoutFailureViewController navigationController](self, "navigationController");
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

  if (+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    if (self->_timeoutReason == 1)
    {
      -[OBBaseWelcomeController navigationItem](self, "navigationItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setHidesBackButton:animated:", 0, 0);

      objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
      v19 = (OBLinkTrayButton *)objc_claimAutoreleasedReturnValue();
      skipButton = self->_skipButton;
      self->_skipButton = v19;

      -[OBLinkTrayButton setRole:](self->_skipButton, "setRole:", 2);
      v21 = self->_skipButton;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("FINISH_SETUP"), &stru_24DEF4290, CFSTR("Localizable"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBLinkTrayButton setTitle:forState:](v21, "setTitle:forState:", v23, 0);

      -[OBLinkTrayButton addTarget:action:forControlEvents:](self->_skipButton, "addTarget:action:forControlEvents:", self, sel__continueButtonTapped, 64);
      -[TSCellularSetupTimeoutFailureViewController buttonTray](self, "buttonTray");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addButton:", self->_skipButton);

      -[TSCellularSetupTimeoutFailureViewController buttonTray](self, "buttonTray");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[OBBoldTrayButton setEnabled:](self->_continueButton, "setEnabled:", 0);
    }
  }
}

- (void)_continueButtonTapped
{
  id v3;

  if (self->_timeoutReason == 1)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("ss.user.canceled"), CFSTR("cancel.button.event"));
  }
  else
  {
    -[TSCellularSetupTimeoutFailureViewController delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewControllerDidComplete:", self);
  }

}

- (BOOL)isStartOverRequiredOnBackButtonTapped
{
  return 1;
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
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
}

@end
