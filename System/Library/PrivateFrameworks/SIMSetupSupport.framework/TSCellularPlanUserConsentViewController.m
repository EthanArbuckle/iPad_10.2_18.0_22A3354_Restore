@implementation TSCellularPlanUserConsentViewController

+ (void)calculateTitleAndDetailsWithName:(id)a3 consentType:(unint64_t)a4 title:(id *)a5 details:(id *)a6
{
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  uint64_t v33;
  uint64_t v34;

  v9 = a3;
  switch(a4)
  {
    case 0uLL:
      _TSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[TSCellularPlanUserConsentViewController calculateTitleAndDetailsWithName:consentType:title:details:].cold.1(v10);

      goto LABEL_5;
    case 1uLL:
LABEL_5:
      v11 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ACTIVATE_ESIM"), &stru_24DEF4290, CFSTR("Localizable"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v13);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      if (!v9)
        goto LABEL_20;
      v14 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("APP_USER_CONSENT_DETAIL_%@");
      goto LABEL_14;
    case 2uLL:
      v18 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CONSENT_NEW_PROFILE_POLICY_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", v20);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      v21 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v23 = CFSTR("CONSENT_NEW_PLAN_CANNOT_BE_DELETED_%@_%@");
        goto LABEL_11;
      }
      v32 = CFSTR("CONSENT_NEW_PLAN_CANNOT_BE_DELETED_NO_NAME");
      goto LABEL_17;
    case 3uLL:
      v24 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("CONSENT_NEW_PROFILE_POLICY_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", v26);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      v21 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v23 = CFSTR("CONSENT_NEW_PLAN_CANNOT_BE_DISABLED_%@_%@");
LABEL_11:
        objc_msgSend(v22, "localizedStringForKey:value:table:", v23, &stru_24DEF4290, CFSTR("Localizable"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", v27, v9, v9);
      }
      else
      {
        v32 = CFSTR("CONSENT_NEW_PLAN_CANNOT_BE_DISABLED_NO_NAME");
LABEL_17:
        objc_msgSend(v22, "localizedStringForKey:value:table:", v32, &stru_24DEF4290, CFSTR("Localizable"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", v27, v33, v34);
      }
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_19;
    case 4uLL:
      v28 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("ACTIVATE_ESIM"), &stru_24DEF4290, CFSTR("Localizable"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringWithFormat:", v30);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v14 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v17 = CFSTR("GENERAL_USER_CONSENT_COMMON_DETAIL_%@");
LABEL_14:
        objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_24DEF4290, CFSTR("Localizable"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", v31, v9);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("GENERAL_USER_CONSENT_COMMON_DETAIL"), &stru_24DEF4290, CFSTR("Localizable"));
        *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

      }
LABEL_20:

      return;
    default:
      goto LABEL_20;
  }
}

- (TSCellularPlanUserConsentViewController)initWithName:(id)a3 consentType:(unint64_t)a4 requireAdditionalConsent:(BOOL)a5
{
  id v8;
  id v9;
  TSCellularPlanUserConsentViewController *v10;
  TSCellularPlanUserConsentViewController *v11;
  objc_super v13;
  id v14;
  id v15;

  v14 = 0;
  v15 = 0;
  +[TSCellularPlanUserConsentViewController calculateTitleAndDetailsWithName:consentType:title:details:](TSCellularPlanUserConsentViewController, "calculateTitleAndDetailsWithName:consentType:title:details:", a3, a4, &v15, &v14);
  v8 = v15;
  v9 = v14;
  v13.receiver = self;
  v13.super_class = (Class)TSCellularPlanUserConsentViewController;
  v10 = -[TSCellularPlanUserConsentViewController initWithTitle:detailText:symbolName:](&v13, sel_initWithTitle_detailText_symbolName_, v8, v9, CFSTR("antenna.radiowaves.left.and.right"));
  v11 = v10;
  if (v10)
  {
    -[TSCellularPlanUserConsentViewController setModalInPresentation:](v10, "setModalInPresentation:", 1);
    v11->_consentType = a4;
    v11->_requireAdditionalConsent = a5;
  }

  return v11;
}

- (TSCellularPlanUserConsentViewController)initWithConfirmationCode:(id)a3 consentType:(unint64_t)a4 requireAdditionalConsent:(BOOL)a5 confirmationCode:(id)a6 acceptButtonTapped:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  TSCellularPlanUserConsentViewController *v16;
  TSCellularPlanUserConsentViewController *v17;
  objc_super v19;
  id v20;
  id v21;

  v13 = a6;
  v20 = 0;
  v21 = 0;
  +[TSCellularPlanUserConsentViewController calculateTitleAndDetailsWithName:consentType:title:details:](TSCellularPlanUserConsentViewController, "calculateTitleAndDetailsWithName:consentType:title:details:", a3, a4, &v21, &v20);
  v14 = v21;
  v15 = v20;
  v19.receiver = self;
  v19.super_class = (Class)TSCellularPlanUserConsentViewController;
  v16 = -[TSCellularPlanUserConsentViewController initWithTitle:detailText:symbolName:](&v19, sel_initWithTitle_detailText_symbolName_, v14, v15, CFSTR("antenna.radiowaves.left.and.right"));
  v17 = v16;
  if (v16)
  {
    v16->_consentType = a4;
    v16->_requireAdditionalConsent = a5;
    objc_storeStrong((id *)&v16->_confirmationCode, a6);
    v17->_acceptButtonTapped = a7;
  }

  return v17;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  SSOBBoldTrayButton *v9;
  SSOBBoldTrayButton *acceptButton;
  SSOBBoldTrayButton *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)TSCellularPlanUserConsentViewController;
  -[TSOBWelcomeController viewDidLoad](&v22, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateTrayButtonText_, CFSTR("esim.install.state.changed"), 0);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanUserConsentViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v4);

  switch(self->_consentType)
  {
    case 0uLL:
    case 1uLL:
    case 4uLL:
      v7 = 0;
      v8 = CFSTR("CONTINUE");
      break;
    case 2uLL:
    case 3uLL:
      v7 = 1;
      v8 = CFSTR("CONSENT_POLICY_ALLOW");
      break;
    default:
      v8 = 0;
      v7 = 0;
      break;
  }
  +[OBBoldTrayButton boldButton](SSOBBoldTrayButton, "boldButton");
  v9 = (SSOBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
  acceptButton = self->_acceptButton;
  self->_acceptButton = v9;

  v11 = self->_acceptButton;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", v8, &stru_24DEF4290, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSOBBoldTrayButton setTitle:forState:](v11, "setTitle:forState:", v13, 0);

  -[SSOBBoldTrayButton addTarget:action:forControlEvents:](self->_acceptButton, "addTarget:action:forControlEvents:", self, sel__acceptButtonTapped, 64);
  if (self->_acceptButtonTapped)
    -[TSCellularPlanUserConsentViewController _acceptButtonTapped](self, "_acceptButtonTapped");
  -[TSCellularPlanUserConsentViewController buttonTray](self, "buttonTray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addButton:", self->_acceptButton);

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CONSENT_POLICY_DECLINE"), &stru_24DEF4290, CFSTR("Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTitle:forState:", v17, 0);

    objc_msgSend(v15, "addTarget:action:forControlEvents:", self, sel__declineButtonTapped, 64);
    -[TSCellularPlanUserConsentViewController buttonTray](self, "buttonTray");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addButton:", v15);

  }
  -[TSCellularPlanUserConsentViewController _setNavigationItems](self, "_setNavigationItems");
  if (!+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    -[TSCellularPlanUserConsentViewController navigationController](self, "navigationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "navigationBar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBackgroundColor:", v21);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t consentType;
  void *v13;
  void *v14;
  id WeakRetained;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TSCellularPlanUserConsentViewController;
  -[TSCellularPlanUserConsentViewController viewWillDisappear:](&v16, sel_viewWillDisappear_, a3);
  if (!self->_didReceiveResponse)
  {
    _TSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[TSCellularPlanUserConsentViewController viewWillDisappear:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

    consentType = self->_consentType;
    +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (consentType == 1)
      objc_msgSend(v13, "resumePlanProvisioning:userConsent:", 0, 0);
    else
      objc_msgSend(v13, "provideUserResponse:confirmationCode:", 2, &stru_24DEF4290);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "receivedResponse");

}

- (void)_setNavigationItems
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "setDefaultNavigationItems:", self);

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonTapped);
  if (+[TSUtilities isPad](TSUtilities, "isPad"))
  {
    if (!+[TSUtilities inBuddy](TSUtilities, "inBuddy") && !self->_acceptButtonTapped)
    {
      -[OBBaseWelcomeController navigationItem](self, "navigationItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setRightBarButtonItem:", v6);

    }
    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidesBackButton:animated:", 1, 0);
    goto LABEL_8;
  }
  if (!self->_acceptButtonTapped)
  {
    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLeftBarButtonItem:", v6);
LABEL_8:

  }
}

- (void)_acceptButtonTapped
{
  const char *v2;
  int v3;
  const char *v4;
  __int16 v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 1200))
    v2 = "Yes";
  else
    v2 = "No";
  v3 = 136315394;
  v4 = v2;
  v5 = 2080;
  v6 = "-[TSCellularPlanUserConsentViewController _acceptButtonTapped]";
  _os_log_debug_impl(&dword_21B647000, a2, OS_LOG_TYPE_DEBUG, "[Db] more consent: %s @%s", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_declineButtonTapped
{
  OUTLINED_FUNCTION_0_2(&dword_21B647000, a1, a3, "[Db] declined @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_cancelButtonTapped
{
  OUTLINED_FUNCTION_0_2(&dword_21B647000, a1, a3, "[Db] cancelled @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (BOOL)customizeSpinner
{
  return self->_animating;
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
  return (NSArray *)objc_getProperty(self, a2, 1208, 1);
}

- (void)setCachedButtons:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1208);
}

- (SSSpinner)spinner
{
  return (SSSpinner *)objc_getProperty(self, a2, 1216, 1);
}

- (void)setSpinner:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1216);
}

- (UIView)spinnerContainer
{
  return (UIView *)objc_getProperty(self, a2, 1224, 1);
}

- (void)setSpinnerContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1224);
}

- (unint64_t)consentType
{
  return self->_consentType;
}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SSOBBoldTrayButton)acceptButton
{
  return (SSOBBoldTrayButton *)objc_getProperty(self, a2, 1240, 1);
}

- (void)setAcceptButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1240);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spinnerContainer, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_cachedButtons, 0);
  objc_storeStrong((id *)&self->_confirmationCode, 0);
}

+ (void)calculateTitleAndDetailsWithName:(os_log_t)log consentType:title:details:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "+[TSCellularPlanUserConsentViewController calculateTitleAndDetailsWithName:consentType:title:details:]";
  _os_log_error_impl(&dword_21B647000, log, OS_LOG_TYPE_ERROR, "[E]No conent type, default to general consent @%s", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)viewWillDisappear:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_21B647000, a1, a3, "[Db] No user response, cancelling @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
