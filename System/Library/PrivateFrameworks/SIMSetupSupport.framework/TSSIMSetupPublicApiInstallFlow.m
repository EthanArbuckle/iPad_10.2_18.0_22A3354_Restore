@implementation TSSIMSetupPublicApiInstallFlow

- (TSSIMSetupPublicApiInstallFlow)initWithAppName:(id)a3 requireSetup:(BOOL)a4 skipGeneralInstallConsent:(BOOL)a5
{
  id v7;
  TSSIMSetupPublicApiInstallFlow *v8;
  uint64_t v9;
  NSString *installName;
  void *v11;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TSSIMSetupPublicApiInstallFlow;
  v8 = -[TSSIMSetupFlow init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    installName = v8->_installName;
    v8->_installName = (NSString *)v9;

    v8->_userConsentType = 0;
    v8->_signupConsentResponse = 0;
    v8->_skipGeneralInstallConsent = a5;
    +[TSUserInPurchaseFlowAssertion sharedInstance](TSUserInPurchaseFlowAssertion, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assertUserInPurchaseFlowStartOver:caller:", 0, v8);

  }
  return v8;
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
  v5.super_class = (Class)TSSIMSetupPublicApiInstallFlow;
  -[TSSIMSetupPublicApiInstallFlow dealloc](&v5, sel_dealloc);
}

- (id)firstViewController
{
  void *v3;
  TSCellularPlanUserConsentViewController *v4;
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

  self->_isPreinstallingViewControllerActive = 1;
  v4 = -[TSCellularPlanUserConsentViewController initWithName:consentType:requireAdditionalConsent:]([TSCellularPlanUserConsentViewController alloc], "initWithName:consentType:requireAdditionalConsent:", self->_installName, 1, 0);
  -[TSCellularPlanUserConsentViewController setDelegate:](v4, "setDelegate:", self);
  -[TSSIMSetupPublicApiInstallFlow _maybeShowPreinstallConsentOnViewController:](self, "_maybeShowPreinstallConsentOnViewController:", v4);
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = objc_opt_class();
    v9 = 2080;
    v10 = "-[TSSIMSetupPublicApiInstallFlow firstViewController]";
    _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "first view: %@ @%s", (uint8_t *)&v7, 0x16u);
  }

  -[TSSIMSetupFlow setTopViewController:](self, "setTopViewController:", v4);
  return v4;
}

- (void)firstViewController:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __54__TSSIMSetupPublicApiInstallFlow_firstViewController___block_invoke;
    v5[3] = &unk_24DEF3558;
    v6 = v4;
    objc_copyWeak(&v7, &location);
    -[TSSIMSetupPublicApiInstallFlow _displayUserConsentAlert:](self, "_displayUserConsentAlert:", v5);
    objc_destroyWeak(&v7);

    objc_destroyWeak(&location);
  }

}

void __54__TSSIMSetupPublicApiInstallFlow_firstViewController___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  id WeakRetained;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_firstViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
  else
  {
    v5 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v5, "userDidTapCancel");

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
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
  id v10;
  TSCellularPlanLabelsViewController *v11;
  TSSubFlowViewController *v12;
  void *v13;
  void *v14;
  TSCellularPlanUserConsentViewController *v15;
  void *v16;
  NSString *v17;
  TSSubFlowViewController *v18;
  void *v19;
  void *v20;
  TSCellularPlanUserConsentViewController *v21;
  TSCellularPlanUsesViewController *v22;
  uint64_t v23;
  _BOOL8 v24;
  uint64_t v26;
  TSCellularPlanRemapViewController *v27;
  _BOOL8 v28;
  TSCellularPlanRemapViewController *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  NSMutableArray *v34;
  NSMutableArray *danglingPlanItems;
  TSCellularPlanUsesViewController *v36;
  void *v37;
  void *v38;
  void *v39;
  NSMutableArray *v40;
  NSMutableArray *v41;
  TSCellularPlanRemapViewController *v42;
  _QWORD v43[5];
  _QWORD v44[4];
  _QWORD v45[4];
  _QWORD v46[3];
  _QWORD v47[3];
  _QWORD v48[2];
  _QWORD v49[3];

  v49[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!+[TSUtilities isRegulatoryRestrictionActive:](TSUtilities, "isRegulatoryRestrictionActive:", self->_planInstallError))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (self->_confirmationCodeRequired)
      {
        v8 = -[TSCellularPlanConfirmationCodeViewController initAsMidOperationWithCarrierName:]([TSCellularPlanConfirmationCodeViewController alloc], "initAsMidOperationWithCarrierName:", self->_carrierName);
        self->_confirmationCodeRequired = 0;
        goto LABEL_36;
      }
      if (self->_skipGeneralInstallConsent)
      {
        self->_isPreinstallingViewControllerActive = 0;
        v12 = [TSSubFlowViewController alloc];
        v46[0] = CFSTR("FlowTypeKey");
        v46[1] = CFSTR("SkipActivatingPane");
        v47[0] = &unk_24DF235F0;
        v47[1] = MEMORY[0x24BDBD1C8];
        v46[2] = CFSTR("PlanSetupTypeKey");
        v47[2] = &unk_24DF23608;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[TSSIMSetupFlow navigationController](self, "navigationController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[TSSubFlowViewController initWithOptions:navigationController:](v12, "initWithOptions:navigationController:", v13, v14);

        goto LABEL_36;
      }
      v21 = -[TSCellularPlanUserConsentViewController initWithName:consentType:requireAdditionalConsent:]([TSCellularPlanUserConsentViewController alloc], "initWithName:consentType:requireAdditionalConsent:", self->_carrierName, 4, self->_userConsentType != 0);
LABEL_35:
      v8 = (TSSubFlowViewController *)v21;
      goto LABEL_36;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v4;
      if (objc_msgSend(v9, "consentType") == 1 && self->_confirmationCodeRequired)
      {
        v8 = -[TSCellularPlanConfirmationCodeViewController initAsMidOperationWithCarrierName:]([TSCellularPlanConfirmationCodeViewController alloc], "initAsMidOperationWithCarrierName:", self->_carrierName);
        self->_confirmationCodeRequired = 0;
LABEL_27:

        goto LABEL_36;
      }
      if (objc_msgSend(v9, "consentType") != 4 || (self->_userConsentType & 0xFFFFFFFFFFFFFFFELL) != 2)
      {
        self->_isPreinstallingViewControllerActive = 0;
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (self->_skipGeneralInstallConsent && -[NSString length](self->_installName, "length"))
        {
          v17 = self->_installName;

          v16 = v17;
        }
        v18 = [TSSubFlowViewController alloc];
        v44[0] = CFSTR("FlowTypeKey");
        v44[1] = CFSTR("SkipActivatingPane");
        v45[0] = &unk_24DF235F0;
        v45[1] = MEMORY[0x24BDBD1C8];
        v44[2] = CFSTR("PlanSetupTypeKey");
        v44[3] = CFSTR("CarrierNameKey");
        v45[2] = &unk_24DF23608;
        v45[3] = v16;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[TSSIMSetupFlow navigationController](self, "navigationController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[TSSubFlowViewController initWithOptions:navigationController:](v18, "initWithOptions:navigationController:", v19, v20);

        goto LABEL_27;
      }
      v15 = -[TSCellularPlanUserConsentViewController initWithName:consentType:requireAdditionalConsent:]([TSCellularPlanUserConsentViewController alloc], "initWithName:consentType:requireAdditionalConsent:", self->_carrierName, self->_userConsentType, 0);
LABEL_26:
      v8 = (TSSubFlowViewController *)v15;
      goto LABEL_27;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v4;
      if (+[TSUtilities isPad](TSUtilities, "isPad") || objc_msgSend(v10, "subFlowType") != 16)
      {
        v8 = 0;
        goto LABEL_29;
      }
      v11 = -[TSCellularPlanLabelsViewController initWithIccid:forceDualSIMSetup:allowDismiss:]([TSCellularPlanLabelsViewController alloc], "initWithIccid:forceDualSIMSetup:allowDismiss:", 0, 1, 1);
LABEL_14:
      v8 = (TSSubFlowViewController *)v11;
LABEL_29:

      goto LABEL_36;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "confirmationCode");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v15 = -[TSCellularPlanUserConsentViewController initWithConfirmationCode:consentType:requireAdditionalConsent:confirmationCode:acceptButtonTapped:]([TSCellularPlanUserConsentViewController alloc], "initWithConfirmationCode:consentType:requireAdditionalConsent:confirmationCode:acceptButtonTapped:", self->_carrierName, 4, self->_userConsentType != 0, v9, 0);
      goto LABEL_26;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = [TSCellularPlanUsesViewController alloc];
      v23 = 0;
LABEL_33:
      v24 = 0;
LABEL_34:
      v21 = -[TSCellularPlanUsesViewController initWithType:withDoneButton:](v22, "initWithType:withDoneButton:", v23, v24);
      goto LABEL_35;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = objc_msgSend(v4, "usesType");
      if (v26 == 2)
      {
        v31 = (void *)MEMORY[0x24BDBCEB8];
        +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "getDanglingPlanItems");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "arrayWithArray:", v33);
        v34 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        danglingPlanItems = self->_danglingPlanItems;
        self->_danglingPlanItems = v34;

        v36 = [TSCellularPlanUsesViewController alloc];
        v24 = -[NSMutableArray count](self->_danglingPlanItems, "count") != 0;
        v22 = v36;
        v23 = 1;
        goto LABEL_34;
      }
      if (v26 != 1)
      {
        if (!v26)
        {
          v22 = [TSCellularPlanUsesViewController alloc];
          v23 = 2;
          goto LABEL_33;
        }
LABEL_49:
        v8 = 0;
        goto LABEL_36;
      }
      v37 = (void *)MEMORY[0x24BDBCEB8];
      +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "getDanglingPlanItems");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "arrayWithArray:", v39);
      v40 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v41 = self->_danglingPlanItems;
      self->_danglingPlanItems = v40;

      if (!-[NSMutableArray count](self->_danglingPlanItems, "count"))
        goto LABEL_49;
      v42 = [TSCellularPlanRemapViewController alloc];
      v28 = (unint64_t)-[NSMutableArray count](self->_danglingPlanItems, "count") > 1;
      -[NSMutableArray objectAtIndex:](self->_danglingPlanItems, "objectAtIndex:", 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v29 = v42;
      v30 = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (unint64_t)-[NSMutableArray count](self->_danglingPlanItems, "count") < 2)
      {
        goto LABEL_49;
      }
      -[NSMutableArray removeObjectAtIndex:](self->_danglingPlanItems, "removeObjectAtIndex:", 0);
      v27 = [TSCellularPlanRemapViewController alloc];
      v28 = (unint64_t)-[NSMutableArray count](self->_danglingPlanItems, "count") > 1;
      -[NSMutableArray objectAtIndex:](self->_danglingPlanItems, "objectAtIndex:", 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v29 = v27;
      v30 = 0;
    }
    v11 = -[TSCellularPlanRemapViewController initWithBackButton:continueButton:danglingPlanItem:](v29, "initWithBackButton:continueButton:danglingPlanItem:", v30, v28, v10);
    goto LABEL_14;
  }
  self->_isPreinstallingViewControllerActive = 0;
  v5 = [TSSubFlowViewController alloc];
  v48[0] = CFSTR("FlowTypeKey");
  v48[1] = CFSTR("SkipActivatingPane");
  v49[0] = &unk_24DF235F0;
  v49[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSSIMSetupFlow navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TSSubFlowViewController initWithOptions:navigationController:](v5, "initWithOptions:navigationController:", v6, v7);

  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __57__TSSIMSetupPublicApiInstallFlow_nextViewControllerFrom___block_invoke;
  v43[3] = &unk_24DEF29A8;
  v43[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], v43);
LABEL_36:

  return v8;
}

void __57__TSSIMSetupPublicApiInstallFlow_nextViewControllerFrom___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("transfer.failed"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));

}

- (int64_t)signupUserConsentResponse
{
  return self->_signupConsentResponse;
}

- (void)setDefaultNavigationItems:(id)a3
{
  id v3;

  objc_msgSend(a3, "navigationItem");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidesBackButton:animated:", 1, 0);

}

- (void)userDidTapCancel
{
  uint64_t v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  objc_super v8;

  -[TSSIMSetupFlow topViewController](self, "topViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[TSSIMSetupFlow topViewController](self, "topViewController"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        v4,
        (isKindOfClass & 1) != 0))
  {
    +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resumePlanProvisioning:userConsent:", 0, 0);

  }
  v8.receiver = self;
  v8.super_class = (Class)TSSIMSetupPublicApiInstallFlow;
  -[TSSIMSetupFlow userDidTapCancel](&v8, sel_userDidTapCancel);
}

- (void)planItemsUpdated:(id)a3 planListError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  BOOL v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  NSString *v23;
  NSString *carrierName;
  void *v25;
  NSObject *v26;
  NSString *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  unint64_t v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD block[5];
  id v50;
  _QWORD v51[5];
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
  if (self->_planInstallError)
  {
    _TSLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[TSSIMSetupPublicApiInstallFlow planItemsUpdated:planListError:].cold.2(v9);

    goto LABEL_43;
  }
  if (v7)
  {
    _TSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[TSSIMSetupPublicApiInstallFlow planItemsUpdated:planListError:].cold.1((uint64_t)v8, v10);

    objc_msgSend(v8, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE158B0]))
    {
      v12 = objc_msgSend(v8, "code");

      if (v12 == 19)
      {
        self->_confirmationCodeRequired = 1;
        goto LABEL_43;
      }
    }
    else
    {

    }
    v32 = +[TSUtilities isRegulatoryRestrictionActive:](TSUtilities, "isRegulatoryRestrictionActive:", v8);
    objc_storeStrong((id *)&self->_planInstallError, a4);
    if (!v32)
    {
      +[TSUtilities getErrorTitleDetail:forCarrier:](TSUtilities, "getErrorTitleDetail:forCarrier:", v8, self->_carrierName);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x24BEBD3B0];
      objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("ErrorHeader"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("ErrorDetail"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "alertControllerWithTitle:message:preferredStyle:", v35, v36, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("ERROR_OK"), &stru_24DEF4290, CFSTR("Localizable"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = MEMORY[0x24BDAC760];
      v51[0] = MEMORY[0x24BDAC760];
      v51[1] = 3221225472;
      v51[2] = __65__TSSIMSetupPublicApiInstallFlow_planItemsUpdated_planListError___block_invoke;
      v51[3] = &unk_24DEF2F40;
      v51[4] = self;
      objc_msgSend(v38, "actionWithTitle:style:handler:", v40, 1, v51);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "addAction:", v42);

      block[0] = v41;
      block[1] = 3221225472;
      block[2] = __65__TSSIMSetupPublicApiInstallFlow_planItemsUpdated_planListError___block_invoke_2;
      block[3] = &unk_24DEF2A48;
      block[4] = self;
      v50 = v37;
      v43 = v37;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

      goto LABEL_42;
    }
LABEL_40:
    -[TSSIMSetupFlow topViewController](self, "topViewController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSSIMSetupFlow viewControllerDidComplete:](self, "viewControllerDidComplete:", v33);
LABEL_42:

    goto LABEL_43;
  }
  if (v6)
  {
    if (self->_isPreinstallingViewControllerActive)
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v13 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
      if (v13)
      {
        v14 = v13;
        v44 = 160;
        v15 = 0;
        v16 = 0;
        v17 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v46 != v17)
              objc_enumerationMutation(v6);
            v19 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
            if (objc_msgSend(v19, "isInstalling", v44))
            {
              objc_msgSend(v19, "plan");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "status");

              if (v21 != 6)
              {
                objc_msgSend(v19, "carrierName");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = (NSString *)objc_msgSend(v22, "copy");
                carrierName = self->_carrierName;
                self->_carrierName = v23;

                objc_msgSend(v19, "iccid");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = objc_msgSend(v25, "length") != 0;

                _TSLogDomain();
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  v27 = self->_carrierName;
                  *(_DWORD *)buf = 138412546;
                  v53 = (const char *)v27;
                  v54 = 2080;
                  v55 = "-[TSSIMSetupPublicApiInstallFlow planItemsUpdated:planListError:]";
                  _os_log_impl(&dword_21B647000, v26, OS_LOG_TYPE_DEFAULT, "installing [%@] @%s", buf, 0x16u);
                }

              }
            }
            if ((objc_msgSend(v19, "isSelected") & 1) != 0 || objc_msgSend(v19, "isInstalling"))
              ++v15;
          }
          v14 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
        }
        while (v14);
        if (v15 >= 2)
          self->_requireSetup = 1;
        v8 = 0;
        if (v16)
        {
          +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "calculateInstallConsentTextTypeFor:", v6);

          switch(v29)
          {
            case 0:
            case 3:
            case 4:
            case 5:
              _TSLogDomain();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v53 = "-[TSSIMSetupPublicApiInstallFlow planItemsUpdated:planListError:]";
                _os_log_impl(&dword_21B647000, v30, OS_LOG_TYPE_DEFAULT, "Invalid consent @%s", buf, 0xCu);
              }
              v31 = 0;
              goto LABEL_35;
            case 1:
              _TSLogDomain();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v53 = "-[TSSIMSetupPublicApiInstallFlow planItemsUpdated:planListError:]";
                _os_log_impl(&dword_21B647000, v30, OS_LOG_TYPE_DEFAULT, "disable not allowed @%s", buf, 0xCu);
              }
              v31 = 3;
              goto LABEL_35;
            case 2:
              _TSLogDomain();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v53 = "-[TSSIMSetupPublicApiInstallFlow planItemsUpdated:planListError:]";
                _os_log_impl(&dword_21B647000, v30, OS_LOG_TYPE_DEFAULT, "delete not allowed @%s", buf, 0xCu);
              }
              v31 = 2;
LABEL_35:

              self->_userConsentType = v31;
              v8 = 0;
              break;
            default:
              break;
          }
          if (*((_BYTE *)&self->super.super.isa + v44))
          {
            *((_BYTE *)&self->super.super.isa + v44) = 0;
            goto LABEL_40;
          }
        }
      }
    }
  }
LABEL_43:

}

uint64_t __65__TSSIMSetupPublicApiInstallFlow_planItemsUpdated_planListError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "userDidTapCancel");
}

void __65__TSSIMSetupPublicApiInstallFlow_planItemsUpdated_planListError___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "topViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);

}

- (void)_maybeShowPreinstallConsentOnViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  dispatch_time_t v9;
  _QWORD block[4];
  id v11;
  id v12;
  _QWORD v13[5];

  v4 = a3;
  +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "planItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __78__TSSIMSetupPublicApiInstallFlow__maybeShowPreinstallConsentOnViewController___block_invoke;
  v13[3] = &unk_24DEF3580;
  v13[4] = self;
  +[TSUtilities preinstallPPRAlertControllerWithItems:completion:](TSUtilities, "preinstallPPRAlertControllerWithItems:completion:", v6, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = dispatch_time(0, 250000000);
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __78__TSSIMSetupPublicApiInstallFlow__maybeShowPreinstallConsentOnViewController___block_invoke_2;
    block[3] = &unk_24DEF2A48;
    v11 = v4;
    v12 = v8;
    dispatch_after(v9, MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __78__TSSIMSetupPublicApiInstallFlow__maybeShowPreinstallConsentOnViewController___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  switch(a2)
  {
    case 0:
      *(_QWORD *)(*(_QWORD *)(result + 32) + 152) = 0;
      break;
    case 1:
      result = objc_msgSend(*(id *)(result + 32), "userDidTapCancel");
      break;
    case 2:
      v2 = *(_QWORD *)(result + 32);
      v3 = 2;
      goto LABEL_6;
    case 3:
      v2 = *(_QWORD *)(result + 32);
      v3 = 1;
LABEL_6:
      *(_QWORD *)(v2 + 152) = v3;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t __78__TSSIMSetupPublicApiInstallFlow__maybeShowPreinstallConsentOnViewController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)_alertConsentWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ACTIVATE_NEW_ESIM_ALERT_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ACTIVATE_NEW_ESIM_ALERT_DETAIL"), &stru_24DEF4290, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("NOT_ALLOW"), &stru_24DEF4290, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ALLOW"), &stru_24DEF4290, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_get_global_queue(2, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__TSSIMSetupPublicApiInstallFlow__alertConsentWithCompletion___block_invoke;
  block[3] = &unk_24DEF35D0;
  v19 = v5;
  v20 = v7;
  v21 = v11;
  v22 = v9;
  v23 = v3;
  v13 = v3;
  v14 = v9;
  v15 = v11;
  v16 = v7;
  v17 = v5;
  dispatch_async(v12, block);

}

void __62__TSSIMSetupPublicApiInstallFlow__alertConsentWithCompletion___block_invoke(uint64_t a1)
{
  SInt32 v2;
  _QWORD block[4];
  id v4;
  CFOptionFlags v5;
  SInt32 v6;
  CFOptionFlags v7;

  v7 = 0;
  v2 = CFUserNotificationDisplayAlert(0.0, 1uLL, 0, 0, 0, *(CFStringRef *)(a1 + 32), *(CFStringRef *)(a1 + 40), *(CFStringRef *)(a1 + 48), *(CFStringRef *)(a1 + 56), 0, &v7);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__TSSIMSetupPublicApiInstallFlow__alertConsentWithCompletion___block_invoke_2;
  block[3] = &unk_24DEF35A8;
  v6 = v2;
  v4 = *(id *)(a1 + 64);
  v5 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __62__TSSIMSetupPublicApiInstallFlow__alertConsentWithCompletion___block_invoke_2(uint64_t a1)
{
  int *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (int *)(a1 + 48);
  if (*(_DWORD *)(a1 + 48))
  {
    _TSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __62__TSSIMSetupPublicApiInstallFlow__alertConsentWithCompletion___block_invoke_2_cold_1(v2, v3);

    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  if (*(_QWORD *)(a1 + 40))
  {
    _TSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v7 = 134218242;
      v8 = v5;
      v9 = 2080;
      v10 = "-[TSSIMSetupPublicApiInstallFlow _alertConsentWithCompletion:]_block_invoke";
      _os_log_impl(&dword_21B647000, v4, OS_LOG_TYPE_DEFAULT, "response flags = %lu @%s", (uint8_t *)&v7, 0x16u);
    }

    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 1);
}

- (void)_displayUserConsentAlert:(id)a3
{
  NSString *installName;
  void *v5;
  void *v6;
  TSSIMSetupPublicApiInstallFlow *v7;
  void (**v8)(id, _QWORD);
  void (**v9)(id, _QWORD);

  v9 = (void (**)(id, _QWORD))a3;
  installName = self->_installName;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CAMERA"), &stru_24DEF4290, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(installName) = -[NSString isEqualToString:](installName, "isEqualToString:", v6);

  if ((_DWORD)installName)
  {
    if (!+[TSUtilities openPrefsURL:](TSUtilities, "openPrefsURL:", CFSTR("prefs:root=MOBILE_DATA_SETTINGS_ID&path=CELLULAR")))
    {
      v9[2](v9, 0);
      goto LABEL_7;
    }
    v7 = self;
    v8 = v9;
  }
  else
  {
    v7 = self;
    v8 = v9;
  }
  -[TSSIMSetupPublicApiInstallFlow _alertConsentWithCompletion:](v7, "_alertConsentWithCompletion:", v8);
LABEL_7:

}

- (id)_firstViewController
{
  void *v3;
  SSUserConsentViewController *v4;
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

  self->_isPreinstallingViewControllerActive = 1;
  v4 = objc_alloc_init(SSUserConsentViewController);
  -[SSUserConsentViewController setDelegate:](v4, "setDelegate:", self);
  -[TSSIMSetupPublicApiInstallFlow _maybeShowPreinstallConsentOnViewController:](self, "_maybeShowPreinstallConsentOnViewController:", v4);
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = objc_opt_class();
    v9 = 2080;
    v10 = "-[TSSIMSetupPublicApiInstallFlow _firstViewController]";
    _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "first view: %@ @%s", (uint8_t *)&v7, 0x16u);
  }

  -[TSSIMSetupFlow setTopViewController:](self, "setTopViewController:", v4);
  return v4;
}

- (BOOL)isPreinstallingViewControllerActive
{
  return self->_isPreinstallingViewControllerActive;
}

- (void)setIsPreinstallingViewControllerActive:(BOOL)a3
{
  self->_isPreinstallingViewControllerActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_installName, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_danglingPlanItems, 0);
  objc_storeStrong((id *)&self->_planInstallError, 0);
}

- (void)planItemsUpdated:(uint64_t)a1 planListError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  v4 = 2080;
  v5 = "-[TSSIMSetupPublicApiInstallFlow planItemsUpdated:planListError:]";
  _os_log_error_impl(&dword_21B647000, a2, OS_LOG_TYPE_ERROR, "[E]error: %@ @%s", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)planItemsUpdated:(os_log_t)log planListError:.cold.2(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[TSSIMSetupPublicApiInstallFlow planItemsUpdated:planListError:]";
  _os_log_error_impl(&dword_21B647000, log, OS_LOG_TYPE_ERROR, "[E]received error already @%s", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

void __62__TSSIMSetupPublicApiInstallFlow__alertConsentWithCompletion___block_invoke_2_cold_1(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  __int16 v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3[0] = 67109378;
  v3[1] = v2;
  v4 = 2080;
  v5 = "-[TSSIMSetupPublicApiInstallFlow _alertConsentWithCompletion:]_block_invoke_2";
  _os_log_error_impl(&dword_21B647000, a2, OS_LOG_TYPE_ERROR, "[E]present notification failed:%d @%s", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_1_0();
}

@end
