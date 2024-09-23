@implementation TSUserConsentViewController

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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  uint64_t v28;
  uint64_t v29;

  v9 = a3;
  switch(a4)
  {
    case 0uLL:
      _TSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[TSUserConsentViewController calculateTitleAndDetailsWithName:consentType:title:details:].cold.1(v10);

      goto LABEL_5;
    case 1uLL:
    case 4uLL:
LABEL_5:
      v11 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("GENERAL_USER_CONSENT_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v13);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v14 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("GENERAL_USER_CONSENT_COMMON_DETAIL_%@"), &stru_24DEF4290, CFSTR("Localizable"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", v16, v9);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("GENERAL_USER_CONSENT_COMMON_DETAIL"), &stru_24DEF4290, CFSTR("Localizable"));
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
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
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v22 = CFSTR("CONSENT_NEW_PLAN_CANNOT_BE_DELETED_%@_%@");
        goto LABEL_12;
      }
      v27 = CFSTR("CONSENT_NEW_PLAN_CANNOT_BE_DELETED_NO_NAME");
      goto LABEL_15;
    case 3uLL:
      v23 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("CONSENT_NEW_PROFILE_POLICY_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", v25);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      v21 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v22 = CFSTR("CONSENT_NEW_PLAN_CANNOT_BE_DISABLED_%@_%@");
LABEL_12:
        objc_msgSend(v17, "localizedStringForKey:value:table:", v22, &stru_24DEF4290, CFSTR("Localizable"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", v26, v9, v9);
      }
      else
      {
        v27 = CFSTR("CONSENT_NEW_PLAN_CANNOT_BE_DISABLED_NO_NAME");
LABEL_15:
        objc_msgSend(v17, "localizedStringForKey:value:table:", v27, &stru_24DEF4290, CFSTR("Localizable"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", v26, v28, v29);
      }
      *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
LABEL_18:

      return;
    default:
      goto LABEL_18;
  }
}

- (TSUserConsentViewController)initWithConsentType:(unint64_t)a3 name:(id)a4
{
  id v6;
  id v7;
  TSUserConsentViewController *v8;
  TSUserConsentViewController *v9;
  objc_super v11;
  id v12;
  id v13;

  v12 = 0;
  v13 = 0;
  +[TSUserConsentViewController calculateTitleAndDetailsWithName:consentType:title:details:](TSUserConsentViewController, "calculateTitleAndDetailsWithName:consentType:title:details:", a4, a3, &v13, &v12);
  v6 = v13;
  v7 = v12;
  v11.receiver = self;
  v11.super_class = (Class)TSUserConsentViewController;
  v8 = -[TSUserConsentViewController initWithTitle:detailText:icon:](&v11, sel_initWithTitle_detailText_icon_, v6, v7, 0);
  v9 = v8;
  if (v8)
  {
    -[TSUserConsentViewController setModalInPresentation:](v8, "setModalInPresentation:", 1);
    v9->_consentType = a3;
    v9->_userConsentResponse = 0;
  }

  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)TSUserConsentViewController;
  -[TSOBWelcomeController viewDidLoad](&v19, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSUserConsentViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v3);

  switch(self->_consentType)
  {
    case 0uLL:
    case 1uLL:
    case 4uLL:
      v6 = 0;
      v7 = CFSTR("ACTIVATE_ESIM");
      break;
    case 2uLL:
    case 3uLL:
      v6 = 1;
      v7 = CFSTR("CONSENT_POLICY_ALLOW");
      break;
    default:
      v7 = 0;
      v6 = 0;
      break;
  }
  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", v7, &stru_24DEF4290, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v10, 0);

  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__acceptButtonTapped, 64);
  -[TSUserConsentViewController buttonTray](self, "buttonTray");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addButton:", v8);

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CONSENT_POLICY_DECLINE"), &stru_24DEF4290, CFSTR("Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:forState:", v14, 0);

    objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel__declineButtonTapped, 64);
    -[TSUserConsentViewController buttonTray](self, "buttonTray");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addButton:", v12);

  }
  -[TSUserConsentViewController _setNavigationItems](self, "_setNavigationItems");
  if (!+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    -[TSUserConsentViewController navigationController](self, "navigationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "navigationBar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackgroundColor:", v18);

  }
}

- (void)_setNavigationItems
{
  id WeakRetained;
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "setDefaultNavigationItems:", self);

  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonTapped);
  v4 = +[TSUtilities isPad](TSUtilities, "isPad");
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "setRightBarButtonItem:", v7);

    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidesBackButton:animated:", 1, 0);
  }
  else
  {
    objc_msgSend(v5, "setLeftBarButtonItem:", v7);
  }

}

- (void)_acceptButtonTapped
{
  id WeakRetained;

  self->_userConsentResponse = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "viewControllerDidComplete:", self);

}

- (void)_declineButtonTapped
{
  id WeakRetained;

  self->_userConsentResponse = 2;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "viewControllerDidComplete:", self);

}

- (void)_cancelButtonTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "viewControllerDidComplete:", self);

}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (unint64_t)userConsentResponse
{
  return self->_userConsentResponse;
}

- (void)setUserConsentResponse:(unint64_t)a3
{
  self->_userConsentResponse = a3;
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

+ (void)calculateTitleAndDetailsWithName:(os_log_t)log consentType:title:details:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "+[TSUserConsentViewController calculateTitleAndDetailsWithName:consentType:title:details:]";
  _os_log_error_impl(&dword_21B647000, log, OS_LOG_TYPE_ERROR, "[E]No conent type, default to general consent @%s", (uint8_t *)&v1, 0xCu);
}

@end
