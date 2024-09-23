@implementation PSUICarrierSpaceOptInSplashScreen

- (PSUICarrierSpaceOptInSplashScreen)initWithParent:(id)a3
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
  PSUICarrierSpaceOptInSplashScreen *v13;
  void *v14;
  void *v15;
  id WeakRetained;
  void *v17;
  uint64_t v18;
  OBBoldTrayButton *continueButton;
  OBBoldTrayButton *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  objc_super v26;

  obj = a3;
  +[PSUICoreTelephonyCarrierBundleCache sharedInstance](PSUICoreTelephonyCarrierBundleCache, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeDataCarrierName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("⁠-⁠"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SPLASH_SCREEN_TITLE"), &stru_24D5028C8, CFSTR("CarrierSpaceOptIn"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SPLASH_SCREEN_EXPLANATION"), &stru_24D5028C8, CFSTR("CarrierSpaceOptIn"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)PSUICarrierSpaceOptInSplashScreen;
  v13 = -[PSUICarrierSpaceOptInSplashScreen initWithTitle:detailText:icon:](&v26, sel_initWithTitle_detailText_icon_, v8, v12, 0);

  if (v13)
  {
    objc_storeWeak((id *)&v13->_listController, obj);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("BACK_BUTTON_NAME"), &stru_24D5028C8, CFSTR("CarrierSpaceOptIn"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&v13->_listController);
    objc_msgSend(WeakRetained, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackButtonTitle:", v15);

    objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
    v18 = objc_claimAutoreleasedReturnValue();
    continueButton = v13->_continueButton;
    v13->_continueButton = (OBBoldTrayButton *)v18;

    v20 = v13->_continueButton;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("CONTINUE_BUTTON"), &stru_24D5028C8, CFSTR("CarrierSpaceOptIn"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBBoldTrayButton setTitle:forState:](v20, "setTitle:forState:", v22, 0);

    -[OBBoldTrayButton addTarget:action:forControlEvents:](v13->_continueButton, "addTarget:action:forControlEvents:", v13, sel_continueButtonPressed, 64);
    -[PSUICarrierSpaceOptInSplashScreen buttonTray](v13, "buttonTray");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addButton:", v13->_continueButton);

  }
  return v13;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSUICarrierSpaceOptInSplashScreen;
  -[PSUICarrierSpaceOptInSplashScreen viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[OBBoldTrayButton setEnabled:](self->_continueButton, "setEnabled:", 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PSUICarrierSpaceOptInSplashScreen;
  -[PSUICarrierSpaceOptInSplashScreen viewWillDisappear:](&v3, sel_viewWillDisappear_, a3);
}

- (void)continueButtonPressed
{
  NSObject *v3;
  void (**continueButtonAction)(void);
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  -[PSUICarrierSpaceOptInSplashScreen getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[PSUICarrierSpaceOptInSplashScreen continueButtonPressed]";
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s splash screen 'Continue' button pressed", (uint8_t *)&v5, 0xCu);
  }

  -[OBBoldTrayButton setEnabled:](self->_continueButton, "setEnabled:", 0);
  continueButtonAction = (void (**)(void))self->_continueButtonAction;
  if (continueButtonAction)
    continueButtonAction[2]();
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CarrierSpaceOptIn"));
}

- (id)continueButtonAction
{
  return self->_continueButtonAction;
}

- (void)setContinueButtonAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1176);
}

- (PSListController)listController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_listController);
}

- (void)setListController:(id)a3
{
  objc_storeWeak((id *)&self->_listController, a3);
}

- (OBBoldTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong(&self->_continueButtonAction, 0);
}

@end
