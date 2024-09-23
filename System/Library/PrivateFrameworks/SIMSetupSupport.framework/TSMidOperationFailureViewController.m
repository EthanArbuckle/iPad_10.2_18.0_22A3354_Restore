@implementation TSMidOperationFailureViewController

- (TSMidOperationFailureViewController)initWithPlanItemError:(id)a3 updatePlanItem:(id)a4 withBackButton:(BOOL)a5 forCarrier:(id)a6 withCarrierErrorCode:(id)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  TSMidOperationFailureViewController *v24;
  TSMidOperationFailureViewController *v25;
  uint64_t v26;
  NSDictionary *errorHeaderDetail;
  id v28;
  uint64_t v29;
  CoreTelephonyClient *client;
  UIBarButtonItem *cancelButton;
  uint64_t v32;
  UIBarButtonItem *v33;
  void *v34;
  id v36;
  id obj;
  id v38;
  id v39;
  void *v40;
  id v41;
  objc_super v42;

  v13 = a3;
  obj = a4;
  v41 = a4;
  v14 = a6;
  v15 = a7;
  v40 = v14;
  +[TSUtilities getErrorTitleDetail:forCarrier:](TSUtilities, "getErrorTitleDetail:forCarrier:", v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ErrorHeader"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ErrorDetail"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = a3;
  v39 = a6;
  if (v15 && objc_msgSend(v15, "length"))
  {
    v19 = (void *)MEMORY[0x24BDD17C8];
    v36 = v13;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("ERROR_CODE"), &stru_24DEF4290, CFSTR("Localizable"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: %@"), v21, v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n\n%@"), v18, v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v23;
    v13 = v36;
  }
  else
  {
    v22 = 0;
  }
  v42.receiver = self;
  v42.super_class = (Class)TSMidOperationFailureViewController;
  v24 = -[TSMidOperationFailureViewController initWithTitle:detailText:icon:](&v42, sel_initWithTitle_detailText_icon_, v17, v18, 0);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_updatePlanItem, obj);
    objc_storeStrong((id *)&v25->_planItemError, v38);
    objc_storeStrong((id *)&v25->_carrierName, v39);
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v16);
    v26 = objc_claimAutoreleasedReturnValue();
    errorHeaderDetail = v25->_errorHeaderDetail;
    v25->_errorHeaderDetail = (NSDictionary *)v26;

    v25->_withBackButton = a5;
    v25->_isContinueByUser = 0;
    v28 = objc_alloc(MEMORY[0x24BDC2810]);
    v29 = objc_msgSend(v28, "initWithQueue:", MEMORY[0x24BDAC9B8]);
    client = v25->_client;
    v25->_client = (CoreTelephonyClient *)v29;

    cancelButton = v25->_cancelButton;
    v25->_cancelButton = 0;

    if (+[TSUtilities isRegRestActiveLocationServiceOff:](TSUtilities, "isRegRestActiveLocationServiceOff:", v25->_planItemError)|| +[TSUtilities isRegRestActiveLocationAuthorizedOff:](TSUtilities, "isRegRestActiveLocationAuthorizedOff:", v25->_planItemError))
    {
      if (+[TSUtilities isPad](TSUtilities, "isPad"))
      {
        v32 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v25, sel__userDidTapCancel);
        v33 = v25->_cancelButton;
        v25->_cancelButton = (UIBarButtonItem *)v32;

      }
    }
  }
  if (v22 && objc_msgSend(v22, "length"))
  {
    -[TSMidOperationFailureViewController headerView](v25, "headerView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addDetailLabel:withErrorCodeSubstr:", v18, v22);

  }
  return v25;
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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TSMidOperationFailureViewController;
  -[TSOBWelcomeController viewDidLoad](&v13, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSMidOperationFailureViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__doneButtonTapped, 64);
  -[NSDictionary objectForKeyedSubscript:](self->_errorHeaderDetail, "objectForKeyedSubscript:", CFSTR("ErrorButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:forState:", v7, 0);

  -[TSMidOperationFailureViewController buttonTray](self, "buttonTray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addButton:", v6);

  objc_msgSend(v6, "setEnabled:", 1);
  if (!self->_withBackButton)
  {
    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidesBackButton:animated:", 1, 0);

  }
  -[TSMidOperationFailureViewController setDefaultNavigationItems:](self, "setDefaultNavigationItems:", self);
  if (!+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    -[TSMidOperationFailureViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "navigationBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v12);

  }
}

- (void)_locationServiceButtonAction
{
  void *v3;
  int v4;
  NSInteger v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;

  if (+[TSUtilities isPad](TSUtilities, "isPad"))
  {
    if (+[TSUtilities isGreenTeaCapable](TSUtilities, "isGreenTeaCapable"))
    {
      -[NSError domain](self->_planItemError, "domain");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE158B0]);

      if (v4)
      {
        v5 = -[NSError code](self->_planItemError, "code");
        if (v5 == 63)
        {
          objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
          v9 = (id)objc_claimAutoreleasedReturnValue();
          v6 = (void *)MEMORY[0x24BDBCF48];
          v7 = CFSTR("prefs:root=Privacy&path=LOCATION/SYSTEM_SERVICES");
          goto LABEL_9;
        }
        if (v5 == 62)
        {
          objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
          v9 = (id)objc_claimAutoreleasedReturnValue();
          v6 = (void *)MEMORY[0x24BDBCF48];
          v7 = CFSTR("prefs:root=Privacy&path=LOCATION");
LABEL_9:
          objc_msgSend(v6, "URLWithString:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "openSensitiveURL:withOptions:", v8, 0);

        }
      }
    }
  }
}

- (void)_disableMismatchedPlan
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412802;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  v8 = 2080;
  v9 = "-[TSMidOperationFailureViewController _disableMismatchedPlan]";
  _os_log_error_impl(&dword_21B647000, log, OS_LOG_TYPE_ERROR, "[E]Failed to disable plan: %@, error: %@ @%s", (uint8_t *)&v4, 0x20u);
}

- (void)_userDidTapCancel
{
  id v2;

  self->_isContinueByUser = 1;
  -[TSMidOperationFailureViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userDidTapCancel");

}

- (void)setDefaultNavigationItems:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (+[TSUtilities isRegRestActiveLocationServiceOff:](TSUtilities, "isRegRestActiveLocationServiceOff:", self->_planItemError)|| +[TSUtilities isRegRestActiveLocationAuthorizedOff:](TSUtilities, "isRegRestActiveLocationAuthorizedOff:", self->_planItemError))
  {
    objc_msgSend(v5, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRightBarButtonItem:", self->_cancelButton);

  }
}

- (void)_buttonAction
{
  NSError *planItemError;
  void *v4;
  int v5;
  NSInteger v6;

  planItemError = self->_planItemError;
  if (planItemError)
  {
    -[NSError domain](planItemError, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE158B0]);

    if (v5)
    {
      v6 = -[NSError code](self->_planItemError, "code");
      if ((unint64_t)(v6 - 62) >= 2)
      {
        if (v6 == 46)
          -[TSMidOperationFailureViewController _disableMismatchedPlan](self, "_disableMismatchedPlan");
      }
      else
      {
        -[TSMidOperationFailureViewController _locationServiceButtonAction](self, "_locationServiceButtonAction");
      }
    }
  }
}

- (void)_doneButtonTapped
{
  id v3;

  -[TSMidOperationFailureViewController _buttonAction](self, "_buttonAction");
  self->_isContinueByUser = 1;
  -[TSMidOperationFailureViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attemptFailed");

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

- (BOOL)isContinueByUser
{
  return self->_isContinueByUser;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_errorHeaderDetail, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_planItemError, 0);
  objc_storeStrong((id *)&self->_updatePlanItem, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
