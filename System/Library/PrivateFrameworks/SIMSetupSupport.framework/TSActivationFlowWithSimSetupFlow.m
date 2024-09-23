@implementation TSActivationFlowWithSimSetupFlow

- (id)initRequireSetup:(BOOL)a3 transferBackPlan:(id)a4
{
  id v7;
  TSActivationFlowWithSimSetupFlow *v8;
  uint64_t v9;
  UIBarButtonItem *cancelButton;
  NSMutableArray *v11;
  NSMutableArray *transferItems;
  uint64_t v13;
  NSString *transferBackPlanPhoneNumber;
  id v15;
  uint64_t v16;
  CoreTelephonyClient *client;
  void *v18;
  void *v19;
  objc_super v21;

  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)TSActivationFlowWithSimSetupFlow;
  v8 = -[TSSIMSetupFlow init](&v21, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v8, sel__userDidTapCancel);
    cancelButton = v8->_cancelButton;
    v8->_cancelButton = (UIBarButtonItem *)v9;

    v8->_requireSetup = a3;
    v8->_isPreinstallingViewControllerActive = 1;
    v8->_userConsentType = 0;
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    transferItems = v8->_transferItems;
    v8->_transferItems = v11;

    v8->_signupConsentResponse = 0;
    objc_storeStrong(&v8->_transferBackPlan, a4);
    objc_msgSend(v7, "phoneNumber");
    v13 = objc_claimAutoreleasedReturnValue();
    transferBackPlanPhoneNumber = v8->_transferBackPlanPhoneNumber;
    v8->_transferBackPlanPhoneNumber = (NSString *)v13;

    v15 = objc_alloc(MEMORY[0x24BDC2810]);
    v16 = objc_msgSend(v15, "initWithQueue:", MEMORY[0x24BDAC9B8]);
    client = v8->_client;
    v8->_client = (CoreTelephonyClient *)v16;

    +[TSUserInPurchaseFlowAssertion sharedInstance](TSUserInPurchaseFlowAssertion, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "assertUserInPurchaseFlowStartOver:caller:", 0, v8);

    +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDelegate:", v8);

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
  v5.super_class = (Class)TSActivationFlowWithSimSetupFlow;
  -[TSActivationFlowWithSimSetupFlow dealloc](&v5, sel_dealloc);
}

- (id)firstViewController
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  _TSLogDomain();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    -[TSActivationFlowWithSimSetupFlow firstViewController].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);

  return 0;
}

- (void)_sendSIMSetupReadyNotification
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CoreTelephonyClient performSelector:withObject:](self->_client, "performSelector:withObject:", sel_setUpeSIMLaunched_, &__block_literal_global_7);
}

void __66__TSActivationFlowWithSimSetupFlow__sendSIMSetupReadyNotification__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _TSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __66__TSActivationFlowWithSimSetupFlow__sendSIMSetupReadyNotification__block_invoke_cold_1();

  }
}

- (void)firstViewController:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __56__TSActivationFlowWithSimSetupFlow_firstViewController___block_invoke;
    v11[3] = &unk_24DEF3418;
    objc_copyWeak(&v13, &location);
    v12 = v4;
    v6 = (void *)MEMORY[0x220765A70](v11);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __56__TSActivationFlowWithSimSetupFlow_firstViewController___block_invoke_2;
    v8[3] = &unk_24DEF2F90;
    objc_copyWeak(&v10, &location);
    v7 = v6;
    v9 = v7;
    -[TSActivationFlowWithSimSetupFlow _requestPlansWithCompletion:](self, "_requestPlansWithCompletion:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    -[TSActivationFlowWithSimSetupFlow _sendSIMSetupReadyNotification](self, "_sendSIMSetupReadyNotification");
  }

}

void __56__TSActivationFlowWithSimSetupFlow_firstViewController___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  id v5;

  v3 = (id *)(a1 + 40);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_sendSIMSetupReadyNotification");

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56__TSActivationFlowWithSimSetupFlow_firstViewController___block_invoke_2(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_filterCarrierSetupItems:", WeakRetained[16]);
    +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __56__TSActivationFlowWithSimSetupFlow_firstViewController___block_invoke_27;
    v14[3] = &unk_24DEF33A8;
    objc_copyWeak(&v16, v2);
    v15 = *(id *)(a1 + 32);
    objc_msgSend(v5, "planItemsWithCompletion:", v14);

    objc_destroyWeak(&v16);
  }
  else
  {
    _TSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __56__TSActivationFlowWithSimSetupFlow_firstViewController___block_invoke_2_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __56__TSActivationFlowWithSimSetupFlow_firstViewController___block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_createFirstViewController:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    _TSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __56__TSActivationFlowWithSimSetupFlow_firstViewController___block_invoke_27_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);

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
  NSObject *v10;
  _BOOL8 v11;
  TSCellularPlanIntroViewController *v12;
  TSSubFlowViewController *v13;
  void *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  TSSubFlowViewController *v19;
  uint64_t v20;
  int v21;
  void *v22;
  id transferBackPlan;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  TSBuddyMLViewController *v28;
  void *v29;
  void *v30;
  TSCellularPlanConfirmationCodeViewController *v31;
  TSSubFlowViewController *v32;
  uint64_t v33;
  int v34;
  void *v35;
  int v36;
  void *v37;
  TSSubFlowViewController *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  TSSubFlowViewController *v49;
  TSCellularPlanUserConsentViewController *v50;
  NSString *name;
  unint64_t userConsentType;
  _BOOL8 v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  TSCellularPlanIntroViewController *v57;
  TSCellularPlanUsesViewController *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  TSCellularPlanRemapViewController *v62;
  _BOOL8 v63;
  TSCellularPlanRemapViewController *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  NSMutableArray *v72;
  NSMutableArray *danglingPlanItems;
  TSCellularPlanRemapViewController *v74;
  _QWORD block[5];
  _QWORD v76[3];
  _QWORD v77[3];
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[3];
  _QWORD v81[3];
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[6];
  _QWORD v85[6];
  _QWORD v86[7];
  _QWORD v87[7];
  uint8_t buf[4];
  const char *v89;
  _QWORD v90[2];
  _QWORD v91[3];

  v91[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!+[TSUtilities isRegulatoryRestrictionActive:](TSUtilities, "isRegulatoryRestrictionActive:", self->_planInstallError))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v4;
      if (!objc_msgSend(v9, "isOtherButtonTapped"))
      {
        if (objc_msgSend(v9, "crossPlatformTransferPlanSelected"))
        {
          _TSLogDomain();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v89 = "-[TSActivationFlowWithSimSetupFlow nextViewControllerFrom:]";
            _os_log_impl(&dword_21B647000, v10, OS_LOG_TYPE_DEFAULT, "Cross platform transfer plan is selected! @%s", buf, 0xCu);
          }

          goto LABEL_9;
        }
        self->_isPreinstallingViewControllerActive = 0;
        if (objc_msgSend(v9, "showSIMSetup"))
          self->_requireSetup = 1;
        v19 = [TSSubFlowViewController alloc];
        v86[0] = CFSTR("FlowTypeKey");
        v86[1] = CFSTR("SkipActivatingPane");
        v20 = MEMORY[0x24BDBD1C8];
        v87[0] = &unk_24DF23548;
        v87[1] = MEMORY[0x24BDBD1C8];
        v86[2] = CFSTR("DelayStartActivatingTimer");
        v21 = objc_msgSend(v9, "installingTransferPlan");
        v22 = &unk_24DF23578;
        if (v21)
          v22 = &unk_24DF23560;
        v87[2] = v22;
        v86[3] = CFSTR("TransferBackPlan");
        transferBackPlan = self->_transferBackPlan;
        v24 = transferBackPlan;
        if (!transferBackPlan)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v87[3] = v24;
        v86[4] = CFSTR("PlanSetupTypeKey");
        v25 = objc_msgSend(v9, "installingTransferPlan");
        v26 = &unk_24DF235A8;
        if (v25)
          v26 = &unk_24DF23590;
        v87[4] = v26;
        v86[5] = CFSTR("CarrierNameKey");
        objc_msgSend(v9, "carrierNameForSelectedItem");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
          objc_msgSend(v9, "carrierNameForSelectedItem");
        else
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v86[6] = CFSTR("MaybeShowConfirmationCodePaneKey");
        v87[5] = v43;
        v87[6] = v20;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v87, v86, 7);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[TSSIMSetupFlow navigationController](self, "navigationController");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[TSSubFlowViewController initWithOptions:navigationController:](v19, "initWithOptions:navigationController:", v44, v45);

        if (transferBackPlan)
          goto LABEL_62;
LABEL_61:

        goto LABEL_62;
      }
      goto LABEL_12;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v4;
      if (objc_msgSend(v9, "isOtherButtonTapped"))
      {
LABEL_12:
        v11 = +[TSUtilities transferOptions](TSUtilities, "transferOptions");
        if (!+[TSUtilities isPad](TSUtilities, "isPad") || v11)
          v12 = -[TSCellularPlanIntroViewController initWithShowTransferOption:requireDelayBluetoothConnection:]([TSCellularPlanIntroViewController alloc], "initWithShowTransferOption:requireDelayBluetoothConnection:", v11, objc_msgSend(v9, "requireDelayBluetoothConnection"));
        else
          v12 = -[TSCellularPlanScanViewController initWithBackButton:]([TSCellularPlanScanViewController alloc], "initWithBackButton:", 0);
        goto LABEL_19;
      }
      if (objc_msgSend(v9, "isCarrierSetupItemSelected"))
      {
        v28 = [TSBuddyMLViewController alloc];
        -[CTDisplayPlanList plans](self->_carrierSetupItems, "plans");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "plan");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[TSBuddyMLViewController initWithCTPlan:inBuddy:](v28, "initWithCTPlan:inBuddy:", v30, 0);

        goto LABEL_32;
      }
      self->_isPreinstallingViewControllerActive = 0;
      if (objc_msgSend(v9, "showSIMSetup"))
        self->_requireSetup = 1;
      v32 = [TSSubFlowViewController alloc];
      v84[0] = CFSTR("FlowTypeKey");
      v84[1] = CFSTR("SkipActivatingPane");
      v33 = MEMORY[0x24BDBD1C8];
      v85[0] = &unk_24DF23548;
      v85[1] = MEMORY[0x24BDBD1C8];
      v84[2] = CFSTR("DelayStartActivatingTimer");
      v34 = objc_msgSend(v9, "installingTransferPlan");
      v35 = &unk_24DF23578;
      if (v34)
        v35 = &unk_24DF23560;
      v85[2] = v35;
      v84[3] = CFSTR("PlanSetupTypeKey");
      v36 = objc_msgSend(v9, "installingTransferPlan");
      v37 = &unk_24DF235A8;
      if (v36)
        v37 = &unk_24DF23590;
      v85[3] = v37;
      v84[4] = CFSTR("CarrierNameKey");
      objc_msgSend(v9, "carrierNameForSelectedItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
        objc_msgSend(v9, "carrierNameForSelectedItem");
      else
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v84[5] = CFSTR("MaybeShowConfirmationCodePaneKey");
      v85[4] = v40;
      v85[5] = v33;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v85, v84, 6);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSSIMSetupFlow navigationController](self, "navigationController");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[TSSubFlowViewController initWithOptions:navigationController:](v32, "initWithOptions:navigationController:", v46, v47);

LABEL_60:
      goto LABEL_61;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = [TSSubFlowViewController alloc];
      v82[0] = CFSTR("FlowTypeKey");
      v82[1] = CFSTR("SkipActivatingPane");
      v83[0] = &unk_24DF23548;
      v83[1] = MEMORY[0x24BDBD1C0];
      v14 = (void *)MEMORY[0x24BDBCE70];
      v15 = v83;
      v16 = v82;
      v17 = 2;
LABEL_17:
      objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, v17);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[TSSIMSetupFlow navigationController](self, "navigationController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[TSSubFlowViewController initWithOptions:navigationController:](v13, "initWithOptions:navigationController:", v9, v18);
LABEL_32:

      goto LABEL_62;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v4;
      if (objc_msgSend(v9, "confirmationCodeRequired"))
      {
        v31 = [TSCellularPlanConfirmationCodeViewController alloc];
        objc_msgSend(v9, "fauxCardData");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[TSCellularPlanConfirmationCodeViewController initWithCardData:](v31, "initWithCardData:", v24);
        goto LABEL_61;
      }
      if (self->_confirmationCodeRequired)
      {
        v8 = -[TSCellularPlanConfirmationCodeViewController initAsMidOperationWithCarrierName:]([TSCellularPlanConfirmationCodeViewController alloc], "initAsMidOperationWithCarrierName:", self->_name);
        self->_confirmationCodeRequired = 0;
        goto LABEL_62;
      }
      if (objc_msgSend(v9, "manualCardInfoEntry"))
      {
        v12 = objc_alloc_init(TSCellularPlanCardInfoViewController);
        goto LABEL_19;
      }
      if ((objc_msgSend(v9, "transferViaQRCode") & 1) == 0)
      {
        v12 = -[TSCellularPlanUserConsentViewController initWithName:consentType:requireAdditionalConsent:]([TSCellularPlanUserConsentViewController alloc], "initWithName:consentType:requireAdditionalConsent:", self->_name, 4, self->_userConsentType != 0);
        goto LABEL_19;
      }
LABEL_9:
      v8 = 0;
LABEL_62:

      goto LABEL_63;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v4;
      if (objc_msgSend(v9, "isProximityTransferButtonTapped"))
      {
        v38 = [TSSubFlowViewController alloc];
        v80[0] = CFSTR("FlowTypeKey");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 10002);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v81[0] = v24;
        v81[1] = MEMORY[0x24BDBD1C0];
        v80[1] = CFSTR("IsClientKey");
        v80[2] = CFSTR("TransferBackPlan");
        v39 = self->_transferBackPlan;
        v40 = v39;
        if (!v39)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v81[2] = v40;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v81, v80, 3);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[TSSIMSetupFlow navigationController](self, "navigationController");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[TSSubFlowViewController initWithOptions:navigationController:](v38, "initWithOptions:navigationController:", v41, v42);

        if (v39)
          goto LABEL_61;
        goto LABEL_60;
      }
      if (objc_msgSend(v9, "isScanButtonTapped"))
      {
        v49 = [TSSubFlowViewController alloc];
        v78[0] = CFSTR("FlowTypeKey");
        v78[1] = CFSTR("IsFirstViewKey");
        v79[0] = &unk_24DF235C0;
        v79[1] = MEMORY[0x24BDBD1C0];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v79, v78, 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[TSSIMSetupFlow navigationController](self, "navigationController");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[TSSubFlowViewController initWithOptions:navigationController:](v49, "initWithOptions:navigationController:", v24, v40);
        goto LABEL_60;
      }
      goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (self->_confirmationCodeRequired)
      {
        v8 = -[TSCellularPlanConfirmationCodeViewController initAsMidOperationWithCarrierName:]([TSCellularPlanConfirmationCodeViewController alloc], "initAsMidOperationWithCarrierName:", self->_name);
        self->_confirmationCodeRequired = 0;
        goto LABEL_63;
      }
      v50 = [TSCellularPlanUserConsentViewController alloc];
      name = self->_name;
      v53 = self->_userConsentType != 0;
      userConsentType = 4;
LABEL_75:
      v54 = -[TSCellularPlanUserConsentViewController initWithName:consentType:requireAdditionalConsent:](v50, "initWithName:consentType:requireAdditionalConsent:", name, userConsentType, v53);
LABEL_76:
      v8 = (TSSubFlowViewController *)v54;
      goto LABEL_63;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "confirmationCode");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v12 = -[TSCellularPlanUserConsentViewController initWithConfirmationCode:consentType:requireAdditionalConsent:confirmationCode:acceptButtonTapped:]([TSCellularPlanUserConsentViewController alloc], "initWithConfirmationCode:consentType:requireAdditionalConsent:confirmationCode:acceptButtonTapped:", self->_name, 4, self->_userConsentType != 0, v9, 0);
LABEL_19:
      v8 = (TSSubFlowViewController *)v12;
      goto LABEL_62;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v4, "consentType") != 4 || (self->_userConsentType & 0xFFFFFFFFFFFFFFFELL) != 2)
      {
        v13 = [TSSubFlowViewController alloc];
        v76[0] = CFSTR("FlowTypeKey");
        v76[1] = CFSTR("SkipActivatingPane");
        v77[0] = &unk_24DF23548;
        v77[1] = MEMORY[0x24BDBD1C8];
        v76[2] = CFSTR("PlanSetupTypeKey");
        v77[2] = &unk_24DF235D8;
        v14 = (void *)MEMORY[0x24BDBCE70];
        v15 = v77;
        v16 = v76;
        v17 = 3;
        goto LABEL_17;
      }
      v50 = [TSCellularPlanUserConsentViewController alloc];
      name = self->_name;
      userConsentType = self->_userConsentType;
      v53 = 0;
      goto LABEL_75;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v55 = v4;
      if (objc_msgSend(v55, "subFlowType") != 16 && objc_msgSend(v55, "subFlowType") != 22)
        goto LABEL_98;
      if (objc_msgSend(v55, "isOfferFallbackFlow"))
      {
        objc_msgSend(v55, "setIsOfferFallbackFlow:", 0);
        v56 = 0;
        if (_os_feature_enabled_impl())
          v56 = +[TSUtilities isPad](TSUtilities, "isPad") ^ 1;
        v57 = -[TSCellularPlanIntroViewController initWithShowTransferOption:requireDelayBluetoothConnection:]([TSCellularPlanIntroViewController alloc], "initWithShowTransferOption:requireDelayBluetoothConnection:", v56, 0);
        goto LABEL_108;
      }
      if (+[TSUtilities isPad](TSUtilities, "isPad"))
      {
LABEL_98:
        v8 = 0;
LABEL_109:

        goto LABEL_63;
      }
      v57 = -[TSCellularPlanLabelsViewController initWithAllowDismiss:]([TSCellularPlanLabelsViewController alloc], "initWithAllowDismiss:", 1);
LABEL_108:
      v8 = (TSSubFlowViewController *)v57;
      goto LABEL_109;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v4, "requireSetup"))
      {
        v58 = [TSCellularPlanUsesViewController alloc];
        v59 = 0;
        goto LABEL_90;
      }
LABEL_110:
      v8 = 0;
      goto LABEL_63;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v61 = objc_msgSend(v4, "usesType");
      if (v61 == 2)
      {
        +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "getDanglingPlanItems");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v67, "count");

        v58 = [TSCellularPlanUsesViewController alloc];
        v59 = 1;
        if (!v68)
        {
          v60 = 1;
          goto LABEL_91;
        }
LABEL_90:
        v60 = 0;
LABEL_91:
        v54 = -[TSCellularPlanUsesViewController initWithType:withDoneButton:](v58, "initWithType:withDoneButton:", v59, v60);
        goto LABEL_76;
      }
      if (v61 != 1)
      {
        if (!v61)
        {
          v58 = [TSCellularPlanUsesViewController alloc];
          v59 = 2;
          goto LABEL_90;
        }
        goto LABEL_110;
      }
      v69 = (void *)MEMORY[0x24BDBCEB8];
      +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "getDanglingPlanItems");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "arrayWithArray:", v71);
      v72 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      danglingPlanItems = self->_danglingPlanItems;
      self->_danglingPlanItems = v72;

      if (!-[NSMutableArray count](self->_danglingPlanItems, "count"))
        goto LABEL_110;
      v74 = [TSCellularPlanRemapViewController alloc];
      v63 = (unint64_t)-[NSMutableArray count](self->_danglingPlanItems, "count") > 1;
      -[NSMutableArray objectAtIndex:](self->_danglingPlanItems, "objectAtIndex:", 0);
      v55 = (id)objc_claimAutoreleasedReturnValue();
      v64 = v74;
      v65 = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (unint64_t)-[NSMutableArray count](self->_danglingPlanItems, "count") < 2)
      {
        goto LABEL_110;
      }
      -[NSMutableArray removeObjectAtIndex:](self->_danglingPlanItems, "removeObjectAtIndex:", 0);
      v62 = [TSCellularPlanRemapViewController alloc];
      v63 = (unint64_t)-[NSMutableArray count](self->_danglingPlanItems, "count") > 1;
      -[NSMutableArray objectAtIndex:](self->_danglingPlanItems, "objectAtIndex:", 0);
      v55 = (id)objc_claimAutoreleasedReturnValue();
      v64 = v62;
      v65 = 0;
    }
    v57 = -[TSCellularPlanRemapViewController initWithBackButton:continueButton:danglingPlanItem:](v64, "initWithBackButton:continueButton:danglingPlanItem:", v65, v63, v55);
    goto LABEL_108;
  }
  self->_isPreinstallingViewControllerActive = 0;
  v5 = [TSSubFlowViewController alloc];
  v90[0] = CFSTR("FlowTypeKey");
  v90[1] = CFSTR("SkipActivatingPane");
  v91[0] = &unk_24DF23548;
  v91[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v91, v90, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSSIMSetupFlow navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TSSubFlowViewController initWithOptions:navigationController:](v5, "initWithOptions:navigationController:", v6, v7);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__TSActivationFlowWithSimSetupFlow_nextViewControllerFrom___block_invoke;
  block[3] = &unk_24DEF29A8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
LABEL_63:

  return v8;
}

void __59__TSActivationFlowWithSimSetupFlow_nextViewControllerFrom___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("transfer.failed"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));

}

- (void)viewControllerDidComplete:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v14;
  objc_super v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  v5 = v4;
  if (objc_msgSend(v5, "subFlowType") != 2
    || (objc_msgSend(v5, "navigationController"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "viewControllers"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "indexOfObject:", v5),
        v7,
        v6,
        !v8))
  {

LABEL_6:
    v14.receiver = self;
    v14.super_class = (Class)TSActivationFlowWithSimSetupFlow;
    -[TSSIMSetupFlow viewControllerDidComplete:](&v14, sel_viewControllerDidComplete_, v4);
    goto LABEL_7;
  }
  objc_msgSend(v5, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", v8 - 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "popToViewController:animated:", v11, 1);

  v15.receiver = self;
  v15.super_class = (Class)TSActivationFlowWithSimSetupFlow;
  -[TSSIMSetupFlow viewControllerDidComplete:](&v15, sel_viewControllerDidComplete_, v11);

LABEL_7:
}

- (void)setDefaultNavigationItems:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  UIBarButtonItem *cancelButton;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = +[TSUtilities isPad](TSUtilities, "isPad");
  objc_msgSend(v12, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  cancelButton = self->_cancelButton;
  if (v4)
    objc_msgSend(v5, "setRightBarButtonItem:", cancelButton);
  else
    objc_msgSend(v5, "setLeftBarButtonItem:", cancelButton);

  objc_msgSend(v12, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidesBackButton:animated:", 1, 0);

  objc_msgSend(v12, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v11);

}

- (int64_t)signupUserConsentResponse
{
  return self->_signupConsentResponse;
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
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  BOOL v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  NSString *v30;
  NSString *name;
  void *v32;
  NSObject *v33;
  NSString *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  unint64_t v38;
  void *v39;
  char isKindOfClass;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD block[5];
  id v59;
  _QWORD v60[5];
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  const char *v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  p_planInstallError = &self->_planInstallError;
  if (self->_planInstallError)
  {
    _TSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[TSActivationFlowWithSimSetupFlow planItemsUpdated:planListError:].cold.2((uint64_t)p_planInstallError, v10, v11, v12, v13, v14, v15, v16);
LABEL_4:

    goto LABEL_45;
  }
  if (v7)
  {
    _TSLogDomain();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[TSActivationFlowWithSimSetupFlow planItemsUpdated:planListError:].cold.1();

    objc_msgSend(v8, "domain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BE158B0]))
    {
      v19 = objc_msgSend(v8, "code");

      if (v19 == 19)
      {
        self->_confirmationCodeRequired = 1;
        goto LABEL_45;
      }
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_planInstallError, a4);
    if (!+[TSUtilities isRegulatoryRestrictionActive:](TSUtilities, "isRegulatoryRestrictionActive:", v8))
    {
      +[TSUtilities getErrorTitleDetail:forCarrier:](TSUtilities, "getErrorTitleDetail:forCarrier:", v8, self->_name);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)MEMORY[0x24BEBD3B0];
      objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("ErrorHeader"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("ErrorDetail"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "alertControllerWithTitle:message:preferredStyle:", v43, v44, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("ERROR_OK"), &stru_24DEF4290, CFSTR("Localizable"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = MEMORY[0x24BDAC760];
      v60[0] = MEMORY[0x24BDAC760];
      v60[1] = 3221225472;
      v60[2] = __67__TSActivationFlowWithSimSetupFlow_planItemsUpdated_planListError___block_invoke;
      v60[3] = &unk_24DEF2F40;
      v60[4] = self;
      objc_msgSend(v46, "actionWithTitle:style:handler:", v48, 1, v60);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "addAction:", v50);

      block[0] = v49;
      block[1] = 3221225472;
      block[2] = __67__TSActivationFlowWithSimSetupFlow_planItemsUpdated_planListError___block_invoke_2;
      block[3] = &unk_24DEF2A48;
      block[4] = self;
      v59 = v45;
      v51 = v45;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

      goto LABEL_44;
    }
LABEL_42:
    -[TSSIMSetupFlow topViewController](self, "topViewController");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSActivationFlowWithSimSetupFlow viewControllerDidComplete:](self, "viewControllerDidComplete:", v41);
LABEL_44:

    goto LABEL_45;
  }
  if (v6)
  {
    if (self->_isPreinstallingViewControllerActive)
    {
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v20 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
      if (v20)
      {
        v21 = v20;
        v52 = 208;
        v53 = 0;
        v22 = 0;
        v23 = 0;
        v24 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v55 != v24)
              objc_enumerationMutation(v6);
            v26 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
            if (objc_msgSend(v26, "isInstalling", v52, v53))
            {
              objc_msgSend(v26, "plan");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "status");

              if (v28 != 6)
              {
                objc_msgSend(v26, "carrierName");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = (NSString *)objc_msgSend(v29, "copy");
                name = self->_name;
                self->_name = v30;

                objc_msgSend(v26, "iccid");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v32, "length") != 0;

                _TSLogDomain();
                v33 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  v34 = self->_name;
                  *(_DWORD *)buf = 138412546;
                  v62 = (const char *)v34;
                  v63 = 2080;
                  v64 = "-[TSActivationFlowWithSimSetupFlow planItemsUpdated:planListError:]";
                  _os_log_impl(&dword_21B647000, v33, OS_LOG_TYPE_DEFAULT, "installing [%@] @%s", buf, 0x16u);
                }

              }
            }
            if ((objc_msgSend(v26, "isSelected") & 1) != 0 || objc_msgSend(v26, "isInstalling"))
              ++v22;
          }
          v21 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
        }
        while (v21);
        if (v22 >= 2)
          self->_requireSetup = 1;
        v8 = v53;
        if (v23)
        {
          +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "calculateInstallConsentTextTypeFor:", v6);

          switch(v36)
          {
            case 0:
            case 3:
            case 4:
            case 5:
              _TSLogDomain();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v62 = "-[TSActivationFlowWithSimSetupFlow planItemsUpdated:planListError:]";
                _os_log_impl(&dword_21B647000, v37, OS_LOG_TYPE_DEFAULT, "Invalid consent @%s", buf, 0xCu);
              }
              v38 = 0;
              goto LABEL_35;
            case 1:
              _TSLogDomain();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v62 = "-[TSActivationFlowWithSimSetupFlow planItemsUpdated:planListError:]";
                _os_log_impl(&dword_21B647000, v37, OS_LOG_TYPE_DEFAULT, "disable not allowed @%s", buf, 0xCu);
              }
              v38 = 3;
              goto LABEL_35;
            case 2:
              _TSLogDomain();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v62 = "-[TSActivationFlowWithSimSetupFlow planItemsUpdated:planListError:]";
                _os_log_impl(&dword_21B647000, v37, OS_LOG_TYPE_DEFAULT, "delete not allowed @%s", buf, 0xCu);
              }
              v38 = 2;
LABEL_35:

              self->_userConsentType = v38;
              break;
            default:
              break;
          }
          if (*((_BYTE *)&self->super.super.isa + v52))
          {
            *((_BYTE *)&self->super.super.isa + v52) = 0;
            -[TSSIMSetupFlow topViewController](self, "topViewController");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              _TSLogDomain();
              v10 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v62 = "-[TSActivationFlowWithSimSetupFlow planItemsUpdated:planListError:]";
                _os_log_impl(&dword_21B647000, v10, OS_LOG_TYPE_DEFAULT, "Ignore installing event for BuddyML @%s", buf, 0xCu);
              }
              goto LABEL_4;
            }
            goto LABEL_42;
          }
        }
      }
    }
  }
LABEL_45:

}

uint64_t __67__TSActivationFlowWithSimSetupFlow_planItemsUpdated_planListError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "userDidTapCancel");
}

void __67__TSActivationFlowWithSimSetupFlow_planItemsUpdated_planListError___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "topViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);

}

- (void)didPurchasePlanSuccessfullyWithEid:(id)a3 imei:(id)a4 meid:(id)a5 iccid:(id)a6 alternateSDMP:(id)a7 state:(id)a8
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v11 = a3;
  v12 = a6;
  v13 = a7;
  v14 = a8;
  if (v11)
  {
    +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject didPurchasePlanForEid:iccid:smdpURL:state:](v15, "didPurchasePlanForEid:iccid:smdpURL:state:", v11, v12, v13, v14);
  }
  else
  {
    _TSLogDomain();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[TSActivationFlowWithSimSetupFlow didPurchasePlanSuccessfullyWithEid:imei:meid:iccid:alternateSDMP:state:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
  }

}

- (void)didTransferPlanSuccessfullyWithEid:(id)a3 imei:(id)a4 meid:(id)a5 iccid:(id)a6 srcIccid:(id)a7 alternateSDMP:(id)a8 state:(id)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v13 = a9;
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a3;
  +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "didTransferPlanForEid:iccid:srcIccid:smdpURL:state:", v17, v16, v15, v14, v13);

}

- (void)accountCancelled
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Not implemented @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)accountPendingRelease
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Not implemented @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (id)_createFirstViewController:(id)a3
{
  id v4;
  _BOOL4 v5;
  id transferBackPlan;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  TSSinglePlanTransferViewController *v11;
  void *v12;
  TSCellularPlanIntroViewController *v13;
  TSNoPlanForTransferViewController *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  void *v22;
  TSCellularPlanIntroViewController *v23;
  NSObject *v24;
  void *v26;
  uint64_t v27;
  TSSinglePlanTransferViewController *v28;
  TSNoPlanForTransferViewController *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  TSSinglePlanTransferViewController *v37;
  TSSinglePlanTransferViewController *v38;
  uint64_t v39;
  id v40;
  NSString *transferBackPlanPhoneNumber;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  const char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = +[TSUtilities transferOptions](TSUtilities, "transferOptions");
  transferBackPlan = self->_transferBackPlan;
  v7 = -[NSMutableArray count](self->_transferItems, "count");
  v8 = v7;
  if (transferBackPlan)
  {
    if (v7 == 1)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_transferItems, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("planItem"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = [TSSinglePlanTransferViewController alloc];
      -[NSMutableArray objectAtIndexedSubscript:](self->_transferItems, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v39) = 0;
      v13 = -[TSSinglePlanTransferViewController initWithTransferPlan:isPhysical:isIneligible:inBuddy:confirmCellularPlanTransfer:showOtherOptions:isStandaloneProximityFlow:transferBackPhoneNumber:](v11, "initWithTransferPlan:isPhysical:isIneligible:inBuddy:confirmCellularPlanTransfer:showOtherOptions:isStandaloneProximityFlow:transferBackPhoneNumber:", v12, objc_msgSend(v10, "isPhysical"), objc_msgSend(v10, "isTransferIneligiblePlan"), 0, 1, 1, v39, self->_transferBackPlanPhoneNumber);
      goto LABEL_4;
    }
    v23 = -[TSCellularPlanIntroViewController initWithTransferBackPlan:]([TSCellularPlanIntroViewController alloc], "initWithTransferBackPlan:", self->_transferBackPlan);
    goto LABEL_15;
  }
  -[CTDisplayPlanList plans](self->_pendingInstallPlans, "plans");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count") + v8;
  -[CTDisplayPlanList plans](self->_carrierSetupItems, "plans");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(v16 + objc_msgSend(v17, "count")) >= 2)
  {

    goto LABEL_14;
  }
  -[CTDisplayPlanList plans](self->_carrierSetupItems, "plans");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v4;
  v19 = objc_msgSend(v18, "count");

  v20 = v19 == 1;
  v4 = v40;
  if (v20)
  {
LABEL_14:
    LOBYTE(v39) = 1;
    v23 = -[TSTransferListViewController initWithTransferItems:confirmCellularPlanTransfer:isActivationPolicyMismatch:isDualeSIMCapabilityLoss:pendingInstallItems:carrierSetupItems:showOtherOptions:]([TSTransferListViewController alloc], "initWithTransferItems:confirmCellularPlanTransfer:isActivationPolicyMismatch:isDualeSIMCapabilityLoss:pendingInstallItems:carrierSetupItems:showOtherOptions:", self->_transferItems, 1, self->_isActivationPolicyMismatch, self->_isDualeSIMCapabilityLoss, self->_pendingInstallPlans, self->_carrierSetupItems, v39);
    goto LABEL_15;
  }
  if (-[NSMutableArray count](self->_transferItems, "count") == 1)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_transferItems, "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("planItem"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray objectAtIndexedSubscript:](self->_transferItems, "objectAtIndexedSubscript:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("deviceInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v10, "isOnDeviceTransferredPlan"))
    {
      if (objc_msgSend(v10, "isTransferIneligiblePlan"))
      {
        v29 = [TSNoPlanForTransferViewController alloc];
        objc_msgSend(v10, "carrierName");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        transferBackPlanPhoneNumber = self->_transferBackPlanPhoneNumber;
        objc_msgSend(v10, "plan");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "transferAttributes");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "transferCapability");
        objc_msgSend(v12, "deviceName");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        BYTE1(v39) = self->_transferBackPlan != 0;
        LOBYTE(v39) = 0;
        v14 = -[TSNoPlanForTransferViewController initWithCarrier:phoneNumber:transferCapability:showOtherOptions:entryPoint:sourceDeviceName:isTransferNotSupportedFromiPhone:isTransferBackPlan:](v29, "initWithCarrier:phoneNumber:transferCapability:showOtherOptions:entryPoint:sourceDeviceName:isTransferNotSupportedFromiPhone:isTransferBackPlan:", v30, transferBackPlanPhoneNumber, v33, 1, 1, v34, v39);

      }
      else
      {
        v38 = [TSSinglePlanTransferViewController alloc];
        -[NSMutableArray objectAtIndexedSubscript:](self->_transferItems, "objectAtIndexedSubscript:", 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[TSSinglePlanTransferViewController initWithTransferPlan:isPhysical:isIneligible:inBuddy:confirmCellularPlanTransfer:showOtherOptions:](v38, "initWithTransferPlan:isPhysical:isIneligible:inBuddy:confirmCellularPlanTransfer:showOtherOptions:", v30, objc_msgSend(v10, "isPhysical"), objc_msgSend(v10, "isTransferIneligiblePlan"), 0, 1, 1);
      }

      v4 = v40;
      goto LABEL_5;
    }
    if (!+[TSUtilities isPad](TSUtilities, "isPad") || v5)
      v13 = -[TSCellularPlanIntroViewController initWithShowTransferOption:requireDelayBluetoothConnection:]([TSCellularPlanIntroViewController alloc], "initWithShowTransferOption:requireDelayBluetoothConnection:", v5, 0);
    else
      v13 = -[TSCellularPlanScanViewController initWithBackButton:]([TSCellularPlanScanViewController alloc], "initWithBackButton:", 0);
LABEL_4:
    v14 = (TSNoPlanForTransferViewController *)v13;
LABEL_5:

    goto LABEL_16;
  }
  -[CTDisplayPlanList plans](self->_pendingInstallPlans, "plans");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");

  if (v27 == 1)
  {
    v28 = [TSSinglePlanTransferViewController alloc];
    -[CTDisplayPlanList plans](self->_pendingInstallPlans, "plans");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[TSSinglePlanTransferViewController initWithPendingInstallPlan:](v28, "initWithPendingInstallPlan:", v12);
    goto LABEL_4;
  }
  -[CTDisplayPlanList plans](self->_crossPlatformTransferItems, "plans");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "count");

  if (v36 == 1)
  {
    v37 = [TSSinglePlanTransferViewController alloc];
    -[CTDisplayPlanList plans](self->_crossPlatformTransferItems, "plans");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[TSSinglePlanTransferViewController initWithCrossPlatformTransferPlan:](v37, "initWithCrossPlatformTransferPlan:", v12);
    goto LABEL_4;
  }
  if (!+[TSUtilities isPad](TSUtilities, "isPad") || v5)
    v23 = -[TSCellularPlanIntroViewController initWithShowTransferOption:requireDelayBluetoothConnection:]([TSCellularPlanIntroViewController alloc], "initWithShowTransferOption:requireDelayBluetoothConnection:", v5, 0);
  else
    v23 = -[TSCellularPlanScanViewController initWithBackButton:]([TSCellularPlanScanViewController alloc], "initWithBackButton:", 0);
LABEL_15:
  v14 = (TSNoPlanForTransferViewController *)v23;
LABEL_16:
  -[TSSIMSetupFlow setTopViewController:](self, "setTopViewController:", v14);
  -[TSNoPlanForTransferViewController setDelegate:](v14, "setDelegate:", self);
  -[TSActivationFlowWithSimSetupFlow _maybeShowPreinstallConsentOnViewController:planItems:](self, "_maybeShowPreinstallConsentOnViewController:planItems:", v14, v4);

  _TSLogDomain();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v43 = objc_opt_class();
    v44 = 2080;
    v45 = "-[TSActivationFlowWithSimSetupFlow _createFirstViewController:]";
    _os_log_impl(&dword_21B647000, v24, OS_LOG_TYPE_DEFAULT, "first view: %@ @%s", buf, 0x16u);
  }

  return v14;
}

- (void)_maybeShowPreinstallConsentOnViewController:(id)a3 planItems:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  dispatch_time_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v6 = a3;
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __90__TSActivationFlowWithSimSetupFlow__maybeShowPreinstallConsentOnViewController_planItems___block_invoke;
  v14[3] = &unk_24DEF3440;
  v14[4] = self;
  v8 = v6;
  v15 = v8;
  +[TSUtilities preinstallPPRAlertControllerWithItems:completion:](TSUtilities, "preinstallPPRAlertControllerWithItems:completion:", a4, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = dispatch_time(0, 250000000);
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __90__TSActivationFlowWithSimSetupFlow__maybeShowPreinstallConsentOnViewController_planItems___block_invoke_2;
    v11[3] = &unk_24DEF2A48;
    v12 = v8;
    v13 = v9;
    dispatch_after(v10, MEMORY[0x24BDAC9B8], v11);

  }
}

uint64_t __90__TSActivationFlowWithSimSetupFlow__maybeShowPreinstallConsentOnViewController_planItems___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  switch(a2)
  {
    case 0:
      *(_QWORD *)(*(_QWORD *)(result + 32) + 192) = 0;
      goto LABEL_7;
    case 1:
      return objc_msgSend(*(id *)(result + 32), "userDidTapCancel");
    case 2:
      v2 = *(_QWORD *)(result + 32);
      v3 = 2;
      goto LABEL_6;
    case 3:
      v2 = *(_QWORD *)(result + 32);
      v3 = 1;
LABEL_6:
      *(_QWORD *)(v2 + 192) = v3;
LABEL_7:
      result = objc_msgSend(*(id *)(result + 40), "didChangeValueForKey:", CFSTR("userConsentAllowed"));
      break;
    default:
      return result;
  }
  return result;
}

uint64_t __90__TSActivationFlowWithSimSetupFlow__maybeShowPreinstallConsentOnViewController_planItems___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)_requestPlansWithCompletion:(id)a3
{
  id v4;
  void *v5;
  OS_dispatch_group *v6;
  OS_dispatch_group *queryGroup;
  uint64_t v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x220765A70](v4);
    v6 = (OS_dispatch_group *)dispatch_group_create();
    queryGroup = self->_queryGroup;
    self->_queryGroup = v6;

    dispatch_group_enter((dispatch_group_t)self->_queryGroup);
    v8 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke;
    v27[3] = &unk_24DEF29F8;
    objc_copyWeak(&v28, &location);
    -[TSActivationFlowWithSimSetupFlow _requestTransferPlanListWithCompletion:](self, "_requestTransferPlanListWithCompletion:", v27);
    objc_destroyWeak(&v28);
    if (!self->_transferBackPlan)
    {
      if (!+[TSUtilities isPad](TSUtilities, "isPad"))
      {
        dispatch_group_enter((dispatch_group_t)self->_queryGroup);
        v25[0] = v8;
        v25[1] = 3221225472;
        v25[2] = __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke_74;
        v25[3] = &unk_24DEF29F8;
        objc_copyWeak(&v26, &location);
        -[TSActivationFlowWithSimSetupFlow _requestCarrierSetupsWithCompletion:](self, "_requestCarrierSetupsWithCompletion:", v25);
        objc_destroyWeak(&v26);
      }
      if (!self->_transferBackPlan)
      {
        if (-[TSActivationFlowWithSimSetupFlow _showPendingInstallItems](self, "_showPendingInstallItems"))
        {
          dispatch_group_enter((dispatch_group_t)self->_queryGroup);
          v23[0] = v8;
          v23[1] = 3221225472;
          v23[2] = __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke_75;
          v23[3] = &unk_24DEF29F8;
          objc_copyWeak(&v24, &location);
          -[TSActivationFlowWithSimSetupFlow _requestPendingInstallItemsWithCompletion:](self, "_requestPendingInstallItemsWithCompletion:", v23);
          objc_destroyWeak(&v24);
        }
        if (!self->_transferBackPlan)
        {
          dispatch_group_enter((dispatch_group_t)self->_queryGroup);
          v21[0] = v8;
          v21[1] = 3221225472;
          v21[2] = __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke_76;
          v21[3] = &unk_24DEF29F8;
          objc_copyWeak(&v22, &location);
          -[TSActivationFlowWithSimSetupFlow _requestCrossPlatformTransferPlanListWithCompletion:](self, "_requestCrossPlatformTransferPlanListWithCompletion:", v21);
          objc_destroyWeak(&v22);
        }
      }
    }
    v9 = self->_queryGroup;
    v19[0] = v8;
    v19[1] = 3221225472;
    v19[2] = __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke_77;
    v19[3] = &unk_24DEF2CE8;
    v20 = v5;
    v10 = v5;
    dispatch_group_notify(v9, MEMORY[0x24BDAC9B8], v19);

    objc_destroyWeak(&location);
  }
  else
  {
    _TSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[TSActivationFlowWithSimSetupFlow _requestPlansWithCompletion:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  }
}

void __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_group_t *WeakRetained;
  dispatch_group_t *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_group_leave(WeakRetained[25]);
  }
  else
  {
    _TSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
}

void __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke_74(uint64_t a1)
{
  dispatch_group_t *WeakRetained;
  dispatch_group_t *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_group_leave(WeakRetained[25]);
  }
  else
  {
    _TSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
}

void __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke_75(uint64_t a1)
{
  dispatch_group_t *WeakRetained;
  dispatch_group_t *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_group_leave(WeakRetained[25]);
  }
  else
  {
    _TSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
}

void __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke_76(uint64_t a1)
{
  dispatch_group_t *WeakRetained;
  dispatch_group_t *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_group_leave(WeakRetained[25]);
  }
  else
  {
    _TSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
}

uint64_t __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke_77(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_requestTransferPlanListWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x220765A70](v4);
    +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __75__TSActivationFlowWithSimSetupFlow__requestTransferPlanListWithCompletion___block_invoke;
    v16[3] = &unk_24DEF3490;
    v7 = v5;
    v17 = v7;
    objc_copyWeak(&v18, &location);
    v16[4] = self;
    objc_msgSend(v6, "bootstrapPlanTransferUsingMessageSession:completion:", 0, v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    _TSLogDomain();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[TSActivationFlowWithSimSetupFlow _requestTransferPlanListWithCompletion:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

  }
}

void __75__TSActivationFlowWithSimSetupFlow__requestTransferPlanListWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    _TSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __75__TSActivationFlowWithSimSetupFlow__requestTransferPlanListWithCompletion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __75__TSActivationFlowWithSimSetupFlow__requestTransferPlanListWithCompletion___block_invoke_79;
    v7[3] = &unk_24DEF3468;
    objc_copyWeak(&v9, (id *)(a1 + 48));
    v6 = *(id *)(a1 + 40);
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v6;
    objc_msgSend(v5, "transferPlanListWithCompletion:", v7);

    objc_destroyWeak(&v9);
  }

}

void __75__TSActivationFlowWithSimSetupFlow__requestTransferPlanListWithCompletion___block_invoke_79(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id *v8;
  void *v9;
  id *WeakRetained;
  id *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  id v35;
  BOOL v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  _BYTE v51[24];
  _QWORD v52[2];
  _QWORD v53[2];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  v41 = a1;
  v8 = (id *)(a1 + 48);
  v9 = v7;
  WeakRetained = (id *)objc_loadWeakRetained(v8);
  v11 = WeakRetained;
  if (!v9)
  {
    if (!v6)
    {
      _TSLogDomain();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v51 = "-[TSActivationFlowWithSimSetupFlow _requestTransferPlanListWithCompletion:]_block_invoke";
        _os_log_impl(&dword_21B647000, v12, OS_LOG_TYPE_DEFAULT, "empty transfer plans @%s", buf, 0xCu);
      }
      goto LABEL_4;
    }
    if (!WeakRetained)
      goto LABEL_5;
    objc_msgSend(*(id *)(*(_QWORD *)(v41 + 32) + 112), "removeAllObjects");
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v35 = v6;
    objc_msgSend(v6, "devices");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    if (!v39)
    {
      v36 = 0;
LABEL_39:

      if (!+[TSUtilities isPad](TSUtilities, "isPad") && v36)
      {
        +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "deviceSupportsHydra");

        if ((v31 & 1) == 0)
          *(_BYTE *)(*(_QWORD *)(v41 + 32) + 91) = 1;
      }
      _TSLogDomain();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v32 = *(_QWORD *)(v41 + 32);
        v33 = *(unsigned __int8 *)(v32 + 90);
        v34 = *(_QWORD *)(v32 + 112);
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v51 = v33;
        *(_WORD *)&v51[4] = 2112;
        *(_QWORD *)&v51[6] = v34;
        *(_WORD *)&v51[14] = 2080;
        *(_QWORD *)&v51[16] = "-[TSActivationFlowWithSimSetupFlow _requestTransferPlanListWithCompletion:]_block_invoke";
        _os_log_impl(&dword_21B647000, v12, OS_LOG_TYPE_DEFAULT, "isActivationPolicyMismatch: %d, transfer plans: %@ @%s", buf, 0x1Cu);
      }
      v9 = 0;
      v6 = v35;
      goto LABEL_4;
    }
    v36 = 0;
    v38 = *(_QWORD *)v47;
LABEL_10:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v47 != v38)
        objc_enumerationMutation(obj);
      v40 = v13;
      v14 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v13);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v36 = objc_msgSend(v14, "performSelector:", sel_isMultiESimEnabled) != 0;
        _TSLogDomain();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v14, "deviceName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v51 = v16;
          *(_WORD *)&v51[8] = 2080;
          *(_QWORD *)&v51[10] = "-[TSActivationFlowWithSimSetupFlow _requestTransferPlanListWithCompletion:]_block_invoke";
          _os_log_impl(&dword_21B647000, v15, OS_LOG_TYPE_DEFAULT, "remote device:%@ use dual eSIM config @%s", buf, 0x16u);

        }
      }
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      objc_msgSend(v14, "remoteDisplayPlans");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
      if (v18)
        break;
LABEL_33:

      v13 = v40 + 1;
      if (v40 + 1 == v39)
      {
        v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
        if (!v39)
          goto LABEL_39;
        goto LABEL_10;
      }
    }
    v19 = v18;
    v20 = *(_QWORD *)v43;
LABEL_19:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v43 != v20)
        objc_enumerationMutation(v17);
      v22 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v21);
      objc_msgSend(v11, "transferBackPlan");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
        goto LABEL_28;
      if (objc_msgSend(v22, "isTransferablePlan"))
      {
        objc_msgSend(v11, "transferBackPlanPhoneNumber");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "phoneNumber");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "isEqualToPhoneNumber:", v25);

        if (v26)
          break;
      }
LABEL_31:
      if (v19 == ++v21)
      {
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
        if (!v19)
          goto LABEL_33;
        goto LABEL_19;
      }
    }
    _TSLogDomain();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "transferBackPlanPhoneNumber");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v51 = v28;
      *(_WORD *)&v51[8] = 2080;
      *(_QWORD *)&v51[10] = "-[TSActivationFlowWithSimSetupFlow _requestTransferPlanListWithCompletion:]_block_invoke";
      _os_log_impl(&dword_21B647000, v27, OS_LOG_TYPE_DEFAULT, "find plan with same phone number : %@ @%s", buf, 0x16u);

    }
LABEL_28:
    v52[0] = CFSTR("planItem");
    v52[1] = CFSTR("deviceInfo");
    v53[0] = v22;
    v53[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11[14], "addObject:", v29);
    if (objc_msgSend(v22, "isNotEligibleActivationPolicyMismatchPlan"))
      *(_BYTE *)(*(_QWORD *)(v41 + 32) + 90) = 1;

    goto LABEL_31;
  }
  _TSLogDomain();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    __75__TSActivationFlowWithSimSetupFlow__requestTransferPlanListWithCompletion___block_invoke_79_cold_1();
LABEL_4:

LABEL_5:
  (*(void (**)(void))(*(_QWORD *)(v41 + 40) + 16))();

}

- (void)_requestCrossPlatformTransferPlanListWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x220765A70](v4);
    +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getCoreTelephonyClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __88__TSActivationFlowWithSimSetupFlow__requestCrossPlatformTransferPlanListWithCompletion___block_invoke;
    v17[3] = &unk_24DEF34B8;
    objc_copyWeak(&v19, &location);
    v8 = v5;
    v18 = v8;
    objc_msgSend(v7, "plansPendingCrossPlatformTransferWithCompletion:", v17);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    _TSLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[TSActivationFlowWithSimSetupFlow _requestCrossPlatformTransferPlanListWithCompletion:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

  }
}

void __88__TSActivationFlowWithSimSetupFlow__requestCrossPlatformTransferPlanListWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  id v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6)
    {
      _TSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __88__TSActivationFlowWithSimSetupFlow__requestCrossPlatformTransferPlanListWithCompletion___block_invoke_cold_2();

    }
    _TSLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412546;
      v20 = v5;
      v21 = 2080;
      v22 = "-[TSActivationFlowWithSimSetupFlow _requestCrossPlatformTransferPlanListWithCompletion:]_block_invoke";
      _os_log_impl(&dword_21B647000, v9, OS_LOG_TYPE_DEFAULT, "Cross platform transfer items %@ @%s", (uint8_t *)&v19, 0x16u);
    }

    v10 = v5;
    v11 = WeakRetained[17];
    WeakRetained[17] = v10;
  }
  else
  {
    _TSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __88__TSActivationFlowWithSimSetupFlow__requestCrossPlatformTransferPlanListWithCompletion___block_invoke_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_requestPendingInstallItemsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x220765A70](v4);
    +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __78__TSActivationFlowWithSimSetupFlow__requestPendingInstallItemsWithCompletion___block_invoke;
    v16[3] = &unk_24DEF34E0;
    objc_copyWeak(&v18, &location);
    v7 = v5;
    v17 = v7;
    objc_msgSend(v6, "pendingInstallItemsWithCompletion:", v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    _TSLogDomain();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[TSActivationFlowWithSimSetupFlow _requestPendingInstallItemsWithCompletion:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

  }
}

void __78__TSActivationFlowWithSimSetupFlow__requestPendingInstallItemsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
    objc_storeStrong(WeakRetained + 15, a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_requestCarrierSetupsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x220765A70](v4);
    +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __72__TSActivationFlowWithSimSetupFlow__requestCarrierSetupsWithCompletion___block_invoke;
    v16[3] = &unk_24DEF3508;
    objc_copyWeak(&v18, &location);
    v7 = v5;
    v16[4] = self;
    v17 = v7;
    objc_msgSend(v6, "getCarrierSetupWithCompletion:", v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    _TSLogDomain();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[TSActivationFlowWithSimSetupFlow _requestCarrierSetupsWithCompletion:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

  }
}

void __72__TSActivationFlowWithSimSetupFlow__requestCarrierSetupsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id *WeakRetained;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  _TSLogDomain();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v4;
      v20 = 2080;
      v21 = "-[TSActivationFlowWithSimSetupFlow _requestCarrierSetupsWithCompletion:]_block_invoke";
      _os_log_impl(&dword_21B647000, v7, OS_LOG_TYPE_DEFAULT, "Carrier setup %@ @%s", buf, 0x16u);
    }

    objc_storeStrong(WeakRetained + 16, a2);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __72__TSActivationFlowWithSimSetupFlow__requestCarrierSetupsWithCompletion___block_invoke_85;
    v16[3] = &unk_24DEF2CE8;
    v8 = *(void **)(a1 + 32);
    v17 = *(id *)(a1 + 40);
    objc_msgSend(v8, "getWebsheetInfo:completion:", v4, v16);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __72__TSActivationFlowWithSimSetupFlow__requestCarrierSetupsWithCompletion___block_invoke_cold_1(v7, v9, v10, v11, v12, v13, v14, v15);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __72__TSActivationFlowWithSimSetupFlow__requestCarrierSetupsWithCompletion___block_invoke_85(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getWebsheetInfo:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _QWORD v25[4];
  void (**v26)(_QWORD);
  id v27;
  id location[4];

  location[3] = *(id *)MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (v6)
  {
    objc_initWeak(location, self);
    -[CTDisplayPlanList plans](self->_carrierSetupItems, "plans");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (unint64_t)objc_msgSend(v8, "count") > 1;

    if (v9)
    {
      _TSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[TSActivationFlowWithSimSetupFlow getWebsheetInfo:completion:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    }
    -[CTDisplayPlanList plans](self->_carrierSetupItems, "plans");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count") == 0;

    if (!v19)
    {
      +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTDisplayPlanList plans](self->_carrierSetupItems, "plans");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "plan");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __63__TSActivationFlowWithSimSetupFlow_getWebsheetInfo_completion___block_invoke;
      v25[3] = &unk_24DEF3530;
      objc_copyWeak(&v27, location);
      v26 = v7;
      objc_msgSend(v20, "getWebsheetInfoForPlan:inBuddy:completion:", v23, 0, v25);

      objc_destroyWeak(&v27);
    }
    objc_destroyWeak(location);
  }
  else
  {
    _TSLogDomain();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 136315138;
      *(id *)((char *)location + 4) = "-[TSActivationFlowWithSimSetupFlow getWebsheetInfo:completion:]";
      _os_log_impl(&dword_21B647000, v24, OS_LOG_TYPE_DEFAULT, "No carrier setup items @%s", (uint8_t *)location, 0xCu);
    }

    v7[2](v7);
  }

}

void __63__TSActivationFlowWithSimSetupFlow_getWebsheetInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id *WeakRetained;
  id *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a2;
  v7 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 19, a2);
    objc_storeStrong(v9 + 20, a3);
  }
  else
  {
    _TSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __63__TSActivationFlowWithSimSetupFlow_getWebsheetInfo_completion___block_invoke_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_filterCarrierSetupItems:(id)a3
{
  id v5;
  id v6;
  _BOOL4 v7;
  id *p_carrierSetupItems;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const char *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v7 = +[TSFlowHelper hasTransferablePlanWithSameCarrierName:transferablePlans:inBuddy:matchingSODACarrierWebsheetTransferPlanIndex:](TSFlowHelper, "hasTransferablePlanWithSameCarrierName:transferablePlans:inBuddy:matchingSODACarrierWebsheetTransferPlanIndex:", v5, self->_transferItems, 0, v6);
  p_carrierSetupItems = (id *)&self->_carrierSetupItems;
  if (v7)
  {
    v9 = *p_carrierSetupItems;
    *p_carrierSetupItems = 0;

  }
  else
  {
    v19 = v5;
    objc_storeStrong(p_carrierSetupItems, a3);
    v18 = v6;
    +[TSFlowHelper sortIndexesInDescending:](TSFlowHelper, "sortIndexesInDescending:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "unsignedIntegerValue");
          _TSLogDomain();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            -[NSMutableArray objectAtIndex:](self->_transferItems, "objectAtIndex:", v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v25 = v17;
            v26 = 2080;
            v27 = "-[TSActivationFlowWithSimSetupFlow _filterCarrierSetupItems:]";
            _os_log_impl(&dword_21B647000, v16, OS_LOG_TYPE_DEFAULT, "Plan %@ will be removed from transfer list @%s", buf, 0x16u);

          }
          -[NSMutableArray removeObjectAtIndex:](self->_transferItems, "removeObjectAtIndex:", v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v12);
    }

    v6 = v18;
    v5 = v19;
  }

}

- (void)_userDidTapCancel
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;

  -[TSSIMSetupFlow topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

LABEL_4:
    +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x24BDC27B8]);
    v8 = +[TSUtilities transferablePlans:](TSUtilities, "transferablePlans:", self->_transferItems);
    -[CTDisplayPlanList plans](self->_pendingInstallPlans, "plans");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithInBuddy:transferablePlans:selectedTransferablePlans:alsPlans:selectedAlsPlans:odaPlans:", 0, v8, 0, objc_msgSend(v9, "count"), 0, +[TSUtilities odaPlans:](TSUtilities, "odaPlans:", self->_transferItems));
    objc_msgSend(v6, "submitSimSetupUsage:", v10);

    goto LABEL_5;
  }
  -[TSSIMSetupFlow topViewController](self, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    goto LABEL_4;
LABEL_5:
  -[TSSIMSetupFlow userDidTapCancel](self, "userDidTapCancel");
}

- (void)startOverWithFirstViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a3;
  -[TSSIMSetupFlow navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSSIMSetupFlow navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[TSFlowHelper handleStartOverAgainstNoPlan:navigationController:completion:](TSFlowHelper, "handleStartOverAgainstNoPlan:navigationController:completion:", v5, v6, v8);

  if (!v7)
    v8[2](v8, 0);

}

- (BOOL)_showPendingInstallItems
{
  char v2;

  v2 = _os_feature_enabled_impl();
  return +[TSUtilities isPad](TSUtilities, "isPad") & v2 ^ 1;
}

- (BOOL)isPreinstallingViewControllerActive
{
  return self->_isPreinstallingViewControllerActive;
}

- (void)setIsPreinstallingViewControllerActive:(BOOL)a3
{
  self->_isPreinstallingViewControllerActive = a3;
}

- (BOOL)requireSetup
{
  return self->_requireSetup;
}

- (void)setRequireSetup:(BOOL)a3
{
  self->_requireSetup = a3;
}

- (id)transferBackPlan
{
  return objc_getProperty(self, a2, 216, 1);
}

- (void)setTransferBackPlan:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSString)transferBackPlanPhoneNumber
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setTransferBackPlanPhoneNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferBackPlanPhoneNumber, 0);
  objc_storeStrong(&self->_transferBackPlan, 0);
  objc_storeStrong((id *)&self->_queryGroup, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_carrierSetupPostData, 0);
  objc_storeStrong((id *)&self->_carrierSetupUrl, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_crossPlatformTransferItems, 0);
  objc_storeStrong((id *)&self->_carrierSetupItems, 0);
  objc_storeStrong((id *)&self->_pendingInstallPlans, 0);
  objc_storeStrong((id *)&self->_transferItems, 0);
  objc_storeStrong((id *)&self->_danglingPlanItems, 0);
  objc_storeStrong((id *)&self->_planInstallError, 0);
}

- (void)firstViewController
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E](UIViewController *)firstViewController is deprecated, please use (void)firstViewController:(void (^)(UIViewController *))completion @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __66__TSActivationFlowWithSimSetupFlow__sendSIMSetupReadyNotification__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]send simsetup ready failed : %@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __56__TSActivationFlowWithSimSetupFlow_firstViewController___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]invalid self @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __56__TSActivationFlowWithSimSetupFlow_firstViewController___block_invoke_27_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]invalid self @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)planItemsUpdated:planListError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]error: %@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)planItemsUpdated:(uint64_t)a3 planListError:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21B647000, a2, a3, "[E]received error already : %@ @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)didPurchasePlanSuccessfullyWithEid:(uint64_t)a3 imei:(uint64_t)a4 meid:(uint64_t)a5 iccid:(uint64_t)a6 alternateSDMP:(uint64_t)a7 state:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]No EID, not implemented @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_requestPlansWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]invalid completion @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]invalid self @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_requestTransferPlanListWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]invalid completion @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __75__TSActivationFlowWithSimSetupFlow__requestTransferPlanListWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]bootstrapPlanTransfer error: %@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __75__TSActivationFlowWithSimSetupFlow__requestTransferPlanListWithCompletion___block_invoke_79_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]query transfer plan error: %@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_requestCrossPlatformTransferPlanListWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Invalid completion @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __88__TSActivationFlowWithSimSetupFlow__requestCrossPlatformTransferPlanListWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Self doesnt exist @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __88__TSActivationFlowWithSimSetupFlow__requestCrossPlatformTransferPlanListWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B647000, v0, v1, "[E]%@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_requestPendingInstallItemsWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]invalid completion @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_requestCarrierSetupsWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Invalid completion @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __72__TSActivationFlowWithSimSetupFlow__requestCarrierSetupsWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Self doesnt exist @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)getWebsheetInfo:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Wrong number of carrier setup items on server @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __63__TSActivationFlowWithSimSetupFlow_getWebsheetInfo_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Self doesnt exist @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
