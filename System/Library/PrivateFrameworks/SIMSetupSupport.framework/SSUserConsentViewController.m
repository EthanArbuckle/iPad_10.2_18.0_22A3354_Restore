@implementation SSUserConsentViewController

- (SSUserConsentViewController)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SSUserConsentViewController *v7;
  SSUserConsentViewController *v8;
  objc_super v10;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ACTIVATE_ESIM"), &stru_24DEF4290, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("INSTALL_ESIM_CONSENT_DETAIL"), &stru_24DEF4290, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10.receiver = self;
  v10.super_class = (Class)SSUserConsentViewController;
  v7 = -[SSUserConsentViewController initWithTitle:detailText:symbolName:](&v10, sel_initWithTitle_detailText_symbolName_, v4, v6, CFSTR("antenna.radiowaves.left.and.right"));
  v8 = v7;
  if (v7)
    -[SSUserConsentViewController setModalInPresentation:](v7, "setModalInPresentation:", 1);

  return v8;
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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SSUserConsentViewController;
  -[TSOBWelcomeController viewDidLoad](&v11, sel_viewDidLoad);
  -[SSUserConsentViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  +[OBBoldTrayButton boldButton](SSOBBoldTrayButton, "boldButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_24DEF4290, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:forState:", v8, 0);

  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__continueButtonTapped, 64);
  -[SSUserConsentViewController buttonTray](self, "buttonTray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addButton:", v6);

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidesBackButton:animated:", 1, 0);

  -[SSUserConsentViewController _continueButtonTapped](self, "_continueButtonTapped");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSUserConsentViewController;
  -[OBBaseWelcomeController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[SSUserConsentViewController _setNavigationItems](self, "_setNavigationItems");
}

- (BOOL)customizeSpinner
{
  return self->_animating;
}

- (void)_continueButtonTapped
{
  void *v3;
  void *v4;
  id WeakRetained;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CONNECTING"), &stru_24DEF4290, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController _showButtonTraySpinnerWithBusyText:](self, "_showButtonTraySpinnerWithBusyText:", v4);

  +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v6, "resumePlanProvisioning:userConsent:", 1, objc_msgSend(WeakRetained, "signupUserConsentResponse"));

}

- (void)_cancelButtonTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "userDidTapCancel");

}

- (void)_setNavigationItems
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonTapped);
  v3 = +[TSUtilities isPad](TSUtilities, "isPad");
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "setRightBarButtonItem:", v6);
  else
    objc_msgSend(v4, "setLeftBarButtonItem:animated:", v6, 0);

}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (NSArray)cachedButtons
{
  return (NSArray *)objc_getProperty(self, a2, 1184, 1);
}

- (void)setCachedButtons:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1184);
}

- (SSSpinner)spinner
{
  return (SSSpinner *)objc_getProperty(self, a2, 1192, 1);
}

- (void)setSpinner:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1192);
}

- (UIView)spinnerContainer
{
  return (UIView *)objc_getProperty(self, a2, 1200, 1);
}

- (void)setSpinnerContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1200);
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
  objc_storeStrong((id *)&self->_spinnerContainer, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_cachedButtons, 0);
}

@end
