@implementation TSQRCodeScanFlow

- (TSQRCodeScanFlow)initWithBackButton:(BOOL)a3
{
  TSQRCodeScanFlow *v4;
  uint64_t v5;
  UIBarButtonItem *cancelButton;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSQRCodeScanFlow;
  v4 = -[TSSIMSetupFlow init](&v9, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v4, sel_userDidTapCancel);
    cancelButton = v4->_cancelButton;
    v4->_cancelButton = (UIBarButtonItem *)v5;

    v4->_withBackButton = a3;
    v4->_confirmationCodeRequired = 0;
    v4->_userConsentType = 0;
    v4->_isPreinstallingViewControllerActive = 1;
    v4->_signupUserConsentResponse = 0;
    +[TSUserInPurchaseFlowAssertion sharedInstance](TSUserInPurchaseFlowAssertion, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assertUserInPurchaseFlowStartOver:caller:", 0, v4);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[TSUserInPurchaseFlowAssertion sharedInstance](TSUserInPurchaseFlowAssertion, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deassertUserInPurchaseFlowWithForce:caller:", 0, self);

  +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetDelegate:", self);

  v5.receiver = self;
  v5.super_class = (Class)TSQRCodeScanFlow;
  -[TSQRCodeScanFlow dealloc](&v5, sel_dealloc);
}

- (id)firstViewController
{
  void *v3;
  TSCellularPlanScanViewController *v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  v4 = -[TSCellularPlanScanViewController initWithBackButton:]([TSCellularPlanScanViewController alloc], "initWithBackButton:", self->_withBackButton);
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = objc_opt_class();
    v9 = 2080;
    v10 = "-[TSQRCodeScanFlow firstViewController]";
    _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "first view controller : %@ @%s", (uint8_t *)&v7, 0x16u);
  }

  -[TSCellularPlanScanViewController setDelegate:](v4, "setDelegate:", self);
  -[TSSIMSetupFlow setTopViewController:](self, "setTopViewController:", v4);
  return v4;
}

- (void)firstViewController:(id)a3
{
  id v5;
  id v6;

  if (a3)
  {
    v5 = a3;
    -[TSQRCodeScanFlow firstViewController](self, "firstViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a3 + 2))(v5, v6);

  }
}

- (id)nextViewControllerFrom:(id)a3
{
  id v4;
  TSSubFlowViewController *v5;
  void *v6;
  void *v7;
  TSSubFlowViewController *v8;
  id v9;
  TSCellularPlanConfirmationCodeViewController *v10;
  void *v11;
  TSCellularPlanCardInfoViewController *v12;
  TSCellularPlanUserConsentViewController *v13;
  NSString *name;
  unint64_t userConsentType;
  _BOOL8 v16;
  TSSubFlowViewController *v17;
  void *v18;
  void *v19;
  TSSubFlowViewController *v20;
  void *v21;
  _QWORD v23[5];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!+[TSUtilities isRegulatoryRestrictionActive:](TSUtilities, "isRegulatoryRestrictionActive:", self->_planInstallError))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v4;
      if (objc_msgSend(v9, "confirmationCodeRequired"))
      {
        v10 = [TSCellularPlanConfirmationCodeViewController alloc];
        objc_msgSend(v9, "fauxCardData");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[TSCellularPlanConfirmationCodeViewController initWithCardData:](v10, "initWithCardData:", v11);
LABEL_6:

LABEL_29:
        goto LABEL_30;
      }
      if (self->_confirmationCodeRequired)
      {
        v8 = -[TSCellularPlanConfirmationCodeViewController initAsMidOperationWithCarrierName:]([TSCellularPlanConfirmationCodeViewController alloc], "initAsMidOperationWithCarrierName:", self->_name);
        self->_confirmationCodeRequired = 0;
        goto LABEL_29;
      }
      if (objc_msgSend(v9, "manualCardInfoEntry"))
      {
        v12 = objc_alloc_init(TSCellularPlanCardInfoViewController);
      }
      else
      {
        if ((objc_msgSend(v9, "transferViaQRCode") & 1) != 0)
        {
          if (!objc_msgSend(v9, "transferViaQRCode"))
          {
            v8 = 0;
            goto LABEL_29;
          }
          self->_isPreinstallingViewControllerActive = 0;
          v20 = [TSSubFlowViewController alloc];
          v26[0] = CFSTR("FlowTypeKey");
          v26[1] = CFSTR("SkipActivatingPane");
          v27[0] = &unk_24DF23500;
          v27[1] = MEMORY[0x24BDBD1C8];
          v26[2] = CFSTR("PlanSetupTypeKey");
          v27[2] = &unk_24DF23518;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[TSSIMSetupFlow navigationController](self, "navigationController");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = -[TSSubFlowViewController initWithOptions:navigationController:](v20, "initWithOptions:navigationController:", v11, v21);

          goto LABEL_6;
        }
        v12 = -[TSCellularPlanUserConsentViewController initWithName:consentType:requireAdditionalConsent:]([TSCellularPlanUserConsentViewController alloc], "initWithName:consentType:requireAdditionalConsent:", self->_name, 4, self->_userConsentType != 0);
      }
LABEL_28:
      v8 = (TSSubFlowViewController *)v12;
      goto LABEL_29;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (self->_confirmationCodeRequired)
      {
        v8 = -[TSCellularPlanConfirmationCodeViewController initAsMidOperationWithCarrierName:]([TSCellularPlanConfirmationCodeViewController alloc], "initAsMidOperationWithCarrierName:", self->_name);
        self->_confirmationCodeRequired = 0;
        goto LABEL_30;
      }
      v13 = [TSCellularPlanUserConsentViewController alloc];
      name = self->_name;
      v16 = self->_userConsentType != 0;
      userConsentType = 4;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "confirmationCode");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v12 = -[TSCellularPlanUserConsentViewController initWithConfirmationCode:consentType:requireAdditionalConsent:confirmationCode:acceptButtonTapped:]([TSCellularPlanUserConsentViewController alloc], "initWithConfirmationCode:consentType:requireAdditionalConsent:confirmationCode:acceptButtonTapped:", self->_name, 4, self->_userConsentType != 0, v9, 0);
        goto LABEL_28;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v8 = 0;
        goto LABEL_30;
      }
      if (objc_msgSend(v4, "consentType") != 4 || (self->_userConsentType & 0xFFFFFFFFFFFFFFFELL) != 2)
      {
        self->_isPreinstallingViewControllerActive = 0;
        v17 = [TSSubFlowViewController alloc];
        v24[0] = CFSTR("FlowTypeKey");
        v24[1] = CFSTR("SkipActivatingPane");
        v25[0] = &unk_24DF23500;
        v25[1] = MEMORY[0x24BDBD1C8];
        v24[2] = CFSTR("PlanSetupTypeKey");
        v25[2] = &unk_24DF23530;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[TSSIMSetupFlow navigationController](self, "navigationController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[TSSubFlowViewController initWithOptions:navigationController:](v17, "initWithOptions:navigationController:", v18, v19);

        goto LABEL_30;
      }
      v13 = [TSCellularPlanUserConsentViewController alloc];
      name = self->_name;
      userConsentType = self->_userConsentType;
      v16 = 0;
    }
    v8 = -[TSCellularPlanUserConsentViewController initWithName:consentType:requireAdditionalConsent:](v13, "initWithName:consentType:requireAdditionalConsent:", name, userConsentType, v16);
    goto LABEL_30;
  }
  self->_isPreinstallingViewControllerActive = 0;
  v5 = [TSSubFlowViewController alloc];
  v28[0] = CFSTR("FlowTypeKey");
  v28[1] = CFSTR("SkipActivatingPane");
  v29[0] = &unk_24DF23500;
  v29[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSSIMSetupFlow navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TSSubFlowViewController initWithOptions:navigationController:](v5, "initWithOptions:navigationController:", v6, v7);

  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __43__TSQRCodeScanFlow_nextViewControllerFrom___block_invoke;
  v23[3] = &unk_24DEF29A8;
  v23[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], v23);
LABEL_30:

  return v8;
}

void __43__TSQRCodeScanFlow_nextViewControllerFrom___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("transfer.failed"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));

}

- (void)viewControllerDidComplete:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isContinueByUser") & 1) == 0)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      objc_msgSend(v5, "navigationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "viewControllers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v18;
        while (2)
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v18 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = v12;
              -[TSSIMSetupFlow setTopViewController:](self, "setTopViewController:", v13);
              objc_msgSend(v5, "navigationController");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = (id)objc_msgSend(v14, "popToViewController:animated:", v13, 1);

              goto LABEL_14;
            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v9)
            continue;
          break;
        }
      }

    }
  }
  v16.receiver = self;
  v16.super_class = (Class)TSQRCodeScanFlow;
  -[TSSIMSetupFlow viewControllerDidComplete:](&v16, sel_viewControllerDidComplete_, v4);
LABEL_14:

}

- (void)setDefaultNavigationItems:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!+[TSUtilities isPad](TSUtilities, "isPad"))
  {
    objc_msgSend(v8, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidesBackButton:animated:", 1, 0);

    objc_msgSend(v8, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLeftBarButtonItem:", self->_cancelButton);
    goto LABEL_5;
  }
  v4 = +[TSUtilities inBuddy](TSUtilities, "inBuddy");
  v5 = v8;
  if (!v4)
  {
    objc_msgSend(v8, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItem:", self->_cancelButton);
LABEL_5:

    v5 = v8;
  }

}

- (void)handleError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id location[2];

  v27 = a3;
  +[TSUtilities getErrorTitleDetail:forCarrier:](TSUtilities, "getErrorTitleDetail:forCarrier:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ErrorHeader"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ErrorDetail"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(location, self);
  -[TSSIMSetupFlow topViewController](self, "topViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v11 = (void *)MEMORY[0x24BEBD3A8];
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("TRY_AGAIN"), &stru_24DEF4290, CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __32__TSQRCodeScanFlow_handleError___block_invoke;
    v38[3] = &unk_24DEF3210;
    v14 = &v40;
    objc_copyWeak(&v40, location);
    v39 = v9;
    objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 0, v38);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v15);

    if (+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_24DEF4290, CFSTR("Localizable"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24DEF4290, CFSTR("Localizable"));
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x24BEBD3A8];
    v24 = MEMORY[0x24BDAC760];
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __32__TSQRCodeScanFlow_handleError___block_invoke_2;
    v36[3] = &unk_24DEF2A20;
    objc_copyWeak(&v37, location);
    objc_msgSend(v23, "actionWithTitle:style:handler:", v22, 1, v36);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v25);

    v33[0] = v24;
    v33[1] = 3221225472;
    v33[2] = __32__TSQRCodeScanFlow_handleError___block_invoke_3;
    v33[3] = &unk_24DEF2B00;
    objc_copyWeak(&v35, location);
    v34 = v8;
    v26 = v8;
    dispatch_async(MEMORY[0x24BDAC9B8], v33);

    objc_destroyWeak(&v35);
    objc_destroyWeak(&v37);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("ERROR_OK"), &stru_24DEF4290, CFSTR("Localizable"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x24BDAC760];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __32__TSQRCodeScanFlow_handleError___block_invoke_4;
    v31[3] = &unk_24DEF2A20;
    v14 = &v32;
    objc_copyWeak(&v32, location);
    objc_msgSend(v11, "actionWithTitle:style:handler:", v18, 1, v31);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v20);

    block[0] = v19;
    block[1] = 3221225472;
    block[2] = __32__TSQRCodeScanFlow_handleError___block_invoke_5;
    block[3] = &unk_24DEF2B00;
    objc_copyWeak(&v30, location);
    v29 = v8;
    v21 = v8;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v30);
  }
  objc_destroyWeak(v14);

  objc_destroyWeak(location);
}

void __32__TSQRCodeScanFlow_handleError___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  id v9;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v4 = *(id *)(a1 + 32);
    objc_msgSend(v4, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 < 2)
    {
      objc_msgSend(v9, "setPlanInstallError:", 0);
      objc_msgSend(*(id *)(a1 + 32), "startScanning");
      objc_msgSend(v9, "receivedResponseWithVC:", v4);
    }
    else
    {
      objc_msgSend(v4, "setEntryPoint:", 1);
      v8 = objc_loadWeakRetained(v2);
      objc_msgSend(v8, "restartWith:", *(_QWORD *)(a1 + 32));

      v4 = v8;
    }

    WeakRetained = v9;
  }

}

void __32__TSQRCodeScanFlow_handleError___block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "userDidTapCancel");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "setPlanInstallError:", 0);

}

void __32__TSQRCodeScanFlow_handleError___block_invoke_3(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), 1, 0);

}

void __32__TSQRCodeScanFlow_handleError___block_invoke_4(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  char isKindOfClass;
  id v5;
  void *v6;
  id v7;
  id v8;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v5 = objc_loadWeakRetained(v1);
  v6 = v5;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "topViewController");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v7 = objc_loadWeakRetained(v1);
    objc_msgSend(v7, "setPlanInstallError:", 0);

    objc_msgSend(v8, "onError");
  }
  else
  {
    objc_msgSend(v5, "userDidTapCancel");

    v8 = objc_loadWeakRetained(v1);
    objc_msgSend(v8, "setPlanInstallError:", 0);
  }

}

void __32__TSQRCodeScanFlow_handleError___block_invoke_5(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), 1, 0);

}

- (void)planItemsUpdated:(id)a3 planListError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSError **p_planInstallError;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  NSString *v35;
  NSString *name;
  void *v37;
  NSObject *v38;
  NSString *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  unint64_t v43;
  _BOOL4 v44;
  void *v45;
  uint64_t v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  const char *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  p_planInstallError = &self->_planInstallError;
  if (self->_planInstallError)
  {
    _TSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[TSQRCodeScanFlow planItemsUpdated:planListError:].cold.2((uint64_t)p_planInstallError, v10, v11, v12, v13, v14, v15, v16);

    goto LABEL_5;
  }
  if (v7)
  {
    _TSLogDomain();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[TSQRCodeScanFlow planItemsUpdated:planListError:].cold.1((uint64_t)v8, v17, v18, v19, v20, v21, v22, v23);

    objc_msgSend(v8, "domain");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "isEqualToString:", *MEMORY[0x24BE158B0]))
    {
      v25 = objc_msgSend(v8, "code");

      if (v25 == 19)
      {
        self->_confirmationCodeRequired = 1;
        goto LABEL_5;
      }
    }
    else
    {

    }
    v44 = +[TSUtilities isRegulatoryRestrictionActive:](TSUtilities, "isRegulatoryRestrictionActive:", v8);
    objc_storeStrong((id *)&self->_planInstallError, a4);
    if (!v44)
    {
      -[TSQRCodeScanFlow handleError:](self, "handleError:", v8);
      goto LABEL_5;
    }
LABEL_38:
    -[TSSIMSetupFlow topViewController](self, "topViewController");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSQRCodeScanFlow viewControllerDidComplete:](self, "viewControllerDidComplete:", v45);

    goto LABEL_5;
  }
  if (v6)
  {
    if (self->_isPreinstallingViewControllerActive)
    {
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v26 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      if (v26)
      {
        v27 = v26;
        v46 = 90;
        v47 = 0;
        v28 = 0;
        v29 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v49 != v29)
              objc_enumerationMutation(v6);
            v31 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
            if (objc_msgSend(v31, "isInstalling", v46, v47))
            {
              objc_msgSend(v31, "plan");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v32, "status");

              if (v33 != 6)
              {
                objc_msgSend(v31, "carrierName");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = (NSString *)objc_msgSend(v34, "copy");
                name = self->_name;
                self->_name = v35;

                objc_msgSend(v31, "iccid");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v37, "length") != 0;

                _TSLogDomain();
                v38 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                {
                  v39 = self->_name;
                  *(_DWORD *)buf = 138412546;
                  v53 = (const char *)v39;
                  v54 = 2080;
                  v55 = "-[TSQRCodeScanFlow planItemsUpdated:planListError:]";
                  _os_log_impl(&dword_21B647000, v38, OS_LOG_TYPE_DEFAULT, "installing [%@] @%s", buf, 0x16u);
                }

              }
            }
            if ((objc_msgSend(v31, "isSelected") & 1) == 0)
              objc_msgSend(v31, "isInstalling");
          }
          v27 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
        }
        while (v27);
        v8 = v47;
        if (v28)
        {
          +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "calculateInstallConsentTextTypeFor:", v6);

          switch(v41)
          {
            case 0:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
              _TSLogDomain();
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v53 = "-[TSQRCodeScanFlow planItemsUpdated:planListError:]";
                _os_log_impl(&dword_21B647000, v42, OS_LOG_TYPE_DEFAULT, "Invalid consent @%s", buf, 0xCu);
              }
              v43 = 0;
              goto LABEL_33;
            case 1:
              _TSLogDomain();
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v53 = "-[TSQRCodeScanFlow planItemsUpdated:planListError:]";
                _os_log_impl(&dword_21B647000, v42, OS_LOG_TYPE_DEFAULT, "disable not allowed @%s", buf, 0xCu);
              }
              v43 = 3;
              goto LABEL_33;
            case 2:
              _TSLogDomain();
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v53 = "-[TSQRCodeScanFlow planItemsUpdated:planListError:]";
                _os_log_impl(&dword_21B647000, v42, OS_LOG_TYPE_DEFAULT, "delete not allowed @%s", buf, 0xCu);
              }
              v43 = 2;
LABEL_33:

              self->_userConsentType = v43;
              break;
            default:
              break;
          }
          if (*((_BYTE *)&self->super.super.isa + v46))
          {
            *((_BYTE *)&self->super.super.isa + v46) = 0;
            goto LABEL_38;
          }
        }
      }
    }
  }
LABEL_5:

}

- (UIBarButtonItem)cancelButton
{
  return (UIBarButtonItem *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCancelButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)withBackButton
{
  return self->_withBackButton;
}

- (void)setWithBackButton:(BOOL)a3
{
  self->_withBackButton = a3;
}

- (BOOL)confirmationCodeRequired
{
  return self->_confirmationCodeRequired;
}

- (void)setConfirmationCodeRequired:(BOOL)a3
{
  self->_confirmationCodeRequired = a3;
}

- (BOOL)isPreinstallingViewControllerActive
{
  return self->_isPreinstallingViewControllerActive;
}

- (void)setIsPreinstallingViewControllerActive:(BOOL)a3
{
  self->_isPreinstallingViewControllerActive = a3;
}

- (unint64_t)userConsentType
{
  return self->_userConsentType;
}

- (void)setUserConsentType:(unint64_t)a3
{
  self->_userConsentType = a3;
}

- (int64_t)signupUserConsentResponse
{
  return self->_signupUserConsentResponse;
}

- (void)setSignupUserConsentResponse:(int64_t)a3
{
  self->_signupUserConsentResponse = a3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSError)planInstallError
{
  return (NSError *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPlanInstallError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planInstallError, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
}

- (void)planItemsUpdated:(uint64_t)a3 planListError:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21B647000, a2, a3, "[E]error: %@ @%s", a5, a6, a7, a8, 2u);
}

- (void)planItemsUpdated:(uint64_t)a3 planListError:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21B647000, a2, a3, "[E]received error already : %@ @%s", a5, a6, a7, a8, 2u);
}

@end
