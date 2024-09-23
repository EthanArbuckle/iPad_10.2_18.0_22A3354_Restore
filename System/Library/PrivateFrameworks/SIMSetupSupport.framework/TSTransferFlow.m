@implementation TSTransferFlow

- (TSTransferFlow)init
{
  TSTransferFlow *v2;
  uint64_t v3;
  UIBarButtonItem *cancelButton;
  void *v5;
  id v6;
  uint64_t v7;
  CoreTelephonyClient *ctClient;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSTransferFlow;
  v2 = -[TSSIMSetupFlow init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v2, sel_userDidTapCancel);
    cancelButton = v2->_cancelButton;
    v2->_cancelButton = (UIBarButtonItem *)v3;

    +[TSUserInPurchaseFlowAssertion sharedInstance](TSUserInPurchaseFlowAssertion, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertUserInPurchaseFlowStartOver:caller:", 0, v2);

    v6 = objc_alloc(MEMORY[0x24BDC2810]);
    v7 = objc_msgSend(v6, "initWithQueue:", MEMORY[0x24BDAC9B8]);
    ctClient = v2->_ctClient;
    v2->_ctClient = (CoreTelephonyClient *)v7;

    -[CoreTelephonyClient setDelegate:](v2->_ctClient, "setDelegate:", v2);
  }
  return v2;
}

- (TSTransferFlow)initWithSession:(id)a3 hasTransferablePlan:(BOOL)a4 isStandaloneProximityTransfer:(BOOL)a5 transferBackPlan:(id)a6
{
  id v11;
  id v12;
  TSTransferFlow *v13;
  uint64_t v14;
  UIBarButtonItem *cancelButton;
  id v16;
  uint64_t v17;
  CoreTelephonyClient *ctClient;
  TSTransferFlowModel *v19;
  TSTransferFlowModel *model;
  TSTransferFlowModel *v21;
  CUMessageSession *session;
  _BOOL8 hasTransferablePlan;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  id location;
  objc_super v32;

  v11 = a3;
  v12 = a6;
  v32.receiver = self;
  v32.super_class = (Class)TSTransferFlow;
  v13 = -[TSSIMSetupFlow init](&v32, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v13, sel_userDidTapCancel);
    cancelButton = v13->_cancelButton;
    v13->_cancelButton = (UIBarButtonItem *)v14;

    objc_storeStrong((id *)&v13->_session, a3);
    v13->_hasTransferablePlan = a4;
    v13->_isStandaloneProximityTransfer = a5;
    v13->_isAvailableOptionsQueryCompleted = 0;
    v13->_isSourceProxCardVisible = 1;
    objc_storeStrong(&v13->_transferBackPlan, a6);
    v16 = objc_alloc(MEMORY[0x24BDC2810]);
    v17 = objc_msgSend(v16, "initWithQueue:", MEMORY[0x24BDAC9B8]);
    ctClient = v13->_ctClient;
    v13->_ctClient = (CoreTelephonyClient *)v17;

    -[CoreTelephonyClient setDelegate:](v13->_ctClient, "setDelegate:", v13);
    v19 = -[TSTransferFlowModel initWithIsStandaloneProximityTransfer:transferBackPlan:]([TSTransferFlowModel alloc], "initWithIsStandaloneProximityTransfer:transferBackPlan:", v13->_isStandaloneProximityTransfer, v13->_transferBackPlan);
    model = v13->_model;
    v13->_model = v19;

    objc_initWeak(&location, v13);
    v21 = v13->_model;
    session = v13->_session;
    hasTransferablePlan = v13->_hasTransferablePlan;
    v26 = MEMORY[0x24BDAC760];
    v27 = 3221225472;
    v28 = __101__TSTransferFlow_initWithSession_hasTransferablePlan_isStandaloneProximityTransfer_transferBackPlan___block_invoke;
    v29 = &unk_24DEF3910;
    objc_copyWeak(&v30, &location);
    -[TSTransferFlowModel arePlansAvailable:transferablePlanOnSource:bootstrapOnly:completion:](v21, "arePlansAvailable:transferablePlanOnSource:bootstrapOnly:completion:", session, hasTransferablePlan, 0, &v26);
    +[TSUserInPurchaseFlowAssertion sharedInstance](TSUserInPurchaseFlowAssertion, "sharedInstance", v26, v27, v28, v29);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "assertUserInPurchaseFlowStartOver:caller:", 0, v13);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __101__TSTransferFlow_initWithSession_hasTransferablePlan_isStandaloneProximityTransfer_transferBackPlan___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  void *v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;
  void *v8;
  void *v9;
  id v10;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIsAvailableOptionsQueryCompleted:", 1);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "firstViewControllerCallback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_loadWeakRetained(v1);
    objc_msgSend(v5, "firstViewControllerCallback");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained(v1);
    objc_msgSend(v7, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_firstViewController:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v6)[2](v6, v9);

    v10 = objc_loadWeakRetained(v1);
    objc_msgSend(v10, "setFirstViewControllerCallback:", 0);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[TSUserInPurchaseFlowAssertion sharedInstance](TSUserInPurchaseFlowAssertion, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deassertUserInPurchaseFlowWithForce:caller:", 0, self);

  v4.receiver = self;
  v4.super_class = (Class)TSTransferFlow;
  -[TSTransferFlow dealloc](&v4, sel_dealloc);
}

+ (void)needsToRunUsingMessageSession:(id)a3 completion:(id)a4
{
  objc_msgSend(a1, "needsToRunUsingMessageSession:transferablePlanOnSource:completion:", a3, 1, a4);
}

+ (void)needsToRunUsingMessageSession:(id)a3 transferablePlanOnSource:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  if (v8)
  {
    if (+[TSUtilities hasCellularBaseband](TSUtilities, "hasCellularBaseband"))
    {
      +[TSTransferFlowModel sharedInstance](TSTransferFlowModel, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "clearCache");

      +[TSTransferFlowModel sharedInstance](TSTransferFlowModel, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __84__TSTransferFlow_needsToRunUsingMessageSession_transferablePlanOnSource_completion___block_invoke;
      v11[3] = &unk_24DEF3938;
      v12 = v8;
      objc_msgSend(v10, "arePlansAvailable:transferablePlanOnSource:bootstrapOnly:completion:", v7, v6, 1, v11);

    }
    else
    {
      (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
    }
  }

}

uint64_t __84__TSTransferFlow_needsToRunUsingMessageSession_transferablePlanOnSource_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)firstViewController
{
  return -[TSTransferFlow _firstViewController:](self, "_firstViewController:", self->_model);
}

- (BOOL)_hasTransferablePlan:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("planItem"), (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isTransferablePlan");

        if ((v9 & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)_firstViewController:(id)a3
{
  id v4;
  NSObject *v5;
  TSTransferredViewController *v6;
  NSArray *v7;
  NSArray *transferItems;
  TSTransferredViewController *v9;
  void *v10;
  CTDisplayPlanList *v11;
  CTDisplayPlanList *pendingInstallItems;
  void *v13;
  unint64_t v14;
  __objc2_class *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  TSSinglePlanTransferViewController *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  TSMultiPlanIntermediateViewController *v23;
  NSObject *v24;
  uint64_t v25;
  TSNoPlanForTransferViewController *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  char v38;
  TSBuddyMLViewController *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  TSTransferListViewController *v46;
  TSSinglePlanTransferViewController *v47;
  uint64_t v48;
  uint64_t v49;
  _BOOL8 v50;
  BOOL isStandaloneProximityTransfer;
  TSNoPlanForTransferViewController *v52;
  char v53;
  _BOOL4 v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  int v59;
  NSObject *v60;
  char v61;
  uint64_t v62;
  TSNoPlanForTransferViewController *v63;
  void *v64;
  _QWORD block[5];
  uint8_t buf[4];
  _BYTE v67[10];
  const char *v68;
  const char *v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!+[TSUtilities isPad](TSUtilities, "isPad")
    || !+[TSUtilities isGreenTeaCapable](TSUtilities, "isGreenTeaCapable")
    || !+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    objc_msgSend(v4, "transferItems");
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    transferItems = self->_transferItems;
    self->_transferItems = v7;

    if (objc_msgSend(v4, "shouldShowTransferredPane"))
    {
      v9 = [TSTransferredViewController alloc];
      -[NSArray objectAtIndex:](self->_transferItems, "objectAtIndex:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[TSTransferredViewController initWithTransferredPlan:](v9, "initWithTransferredPlan:", v10);

      -[TSTransferredViewController setDelegate:](v6, "setDelegate:", self);
LABEL_22:
      -[TSSIMSetupFlow setTopViewController:](self, "setTopViewController:", v6);
      goto LABEL_23;
    }
    objc_msgSend(v4, "pendingInstallItems");
    v11 = (CTDisplayPlanList *)objc_claimAutoreleasedReturnValue();
    pendingInstallItems = self->_pendingInstallItems;
    self->_pendingInstallItems = v11;

    self->_isActivationPolicyMismatch = objc_msgSend(v4, "isActivationPolicyMismatch");
    self->_isDualeSIMCapablityLoss = objc_msgSend(v4, "isDualeSIMCapablityLoss");
    -[CTDisplayPlanList plans](self->_pendingInstallItems, "plans");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14 >= 2)
    {
      if (+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
        v15 = TSMultiPlanIntermediateViewController;
      else
        v15 = TSTransferListViewController;
      v23 = (TSMultiPlanIntermediateViewController *)objc_msgSend([v15 alloc], "initWithPendingInstallItems:", self->_pendingInstallItems);
      goto LABEL_18;
    }
    objc_msgSend(v4, "pendingInstallItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "plans");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18 == 1)
    {
      v19 = [TSSinglePlanTransferViewController alloc];
      -[CTDisplayPlanList plans](self->_pendingInstallItems, "plans");
      v20 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectAtIndexedSubscript:](v20, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[TSSinglePlanTransferViewController initWithPendingInstallPlan:](v19, "initWithPendingInstallPlan:", v21);
    }
    else
    {
      if (-[NSArray count](self->_transferItems, "count") >= 2)
      {
        if (-[TSTransferFlow _hasTransferablePlan:](self, "_hasTransferablePlan:", self->_transferItems)
          || !self->_isStandaloneProximityTransfer)
        {
          if (+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
          {
            v23 = -[TSMultiPlanIntermediateViewController initWithTransferItems:pendingInstallItems:carrierSetupItems:showOtherOptions:isStandaloneProximityFlow:]([TSMultiPlanIntermediateViewController alloc], "initWithTransferItems:pendingInstallItems:carrierSetupItems:showOtherOptions:isStandaloneProximityFlow:", self->_transferItems, 0, 0, 0, self->_isStandaloneProximityTransfer);
          }
          else
          {
            v46 = [TSTransferListViewController alloc];
            BYTE1(v62) = self->_isStandaloneProximityTransfer;
            LOBYTE(v62) = 0;
            v23 = -[TSTransferListViewController initWithTransferItems:confirmCellularPlanTransfer:isActivationPolicyMismatch:isDualeSIMCapabilityLoss:pendingInstallItems:carrierSetupItems:showOtherOptions:isStandaloneProximityFlow:](v46, "initWithTransferItems:confirmCellularPlanTransfer:isActivationPolicyMismatch:isDualeSIMCapabilityLoss:pendingInstallItems:carrierSetupItems:showOtherOptions:isStandaloneProximityFlow:", self->_transferItems, 0, self->_isActivationPolicyMismatch, self->_isDualeSIMCapablityLoss, 0, 0, v62);
          }
LABEL_18:
          v6 = (TSTransferredViewController *)v23;
          goto LABEL_19;
        }
        v27 = [TSNoPlanForTransferViewController alloc];
        objc_msgSend(self->_transferBackPlan, "phoneNumber");
        v20 = objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v4, "isTransferNotSupportedFromiPhone");
        BYTE1(v62) = self->_transferBackPlan != 0;
        LOBYTE(v62) = v28;
        v6 = -[TSNoPlanForTransferViewController initWithCarrier:phoneNumber:transferCapability:showOtherOptions:entryPoint:sourceDeviceName:isTransferNotSupportedFromiPhone:isTransferBackPlan:](v27, "initWithCarrier:phoneNumber:transferCapability:showOtherOptions:entryPoint:sourceDeviceName:isTransferNotSupportedFromiPhone:isTransferBackPlan:", 0, v20, 0, 0, 1, 0, v62);
LABEL_15:

LABEL_19:
        -[TSTransferredViewController setDelegate:](v6, "setDelegate:", self);
        _TSLogDomain();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v67 = v25;
          *(_WORD *)&v67[8] = 2080;
          v68 = "-[TSTransferFlow _firstViewController:]";
          _os_log_impl(&dword_21B647000, v24, OS_LOG_TYPE_DEFAULT, "first view: %@ @%s", buf, 0x16u);
        }

        goto LABEL_22;
      }
      if (-[NSArray count](self->_transferItems, "count") == 1)
      {
        -[NSArray objectAtIndexedSubscript:](self->_transferItems, "objectAtIndexedSubscript:", 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("planItem"));
        v20 = objc_claimAutoreleasedReturnValue();

        -[NSArray objectAtIndexedSubscript:](self->_transferItems, "objectAtIndexedSubscript:", 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("deviceInfo"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v64 = v31;
        if (-[NSObject isTransferIneligiblePlan](v20, "isTransferIneligiblePlan"))
        {
          v63 = [TSNoPlanForTransferViewController alloc];
          -[NSObject carrierName](v20, "carrierName");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(self->_transferBackPlan, "phoneNumber");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject plan](v20, "plan");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "transferAttributes");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "transferCapability");
          objc_msgSend(v31, "deviceName");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v4, "isTransferNotSupportedFromiPhone");
          BYTE1(v62) = self->_transferBackPlan != 0;
          LOBYTE(v62) = v38;
          v6 = -[TSNoPlanForTransferViewController initWithCarrier:phoneNumber:transferCapability:showOtherOptions:entryPoint:sourceDeviceName:isTransferNotSupportedFromiPhone:isTransferBackPlan:](v63, "initWithCarrier:phoneNumber:transferCapability:showOtherOptions:entryPoint:sourceDeviceName:isTransferNotSupportedFromiPhone:isTransferBackPlan:", v32, v33, v36, 0, 1, v37, v62);

        }
        else
        {
          v47 = [TSSinglePlanTransferViewController alloc];
          -[NSArray objectAtIndexedSubscript:](self->_transferItems, "objectAtIndexedSubscript:", 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = -[NSObject isPhysical](v20, "isPhysical");
          v49 = -[NSObject isTransferIneligiblePlan](v20, "isTransferIneligiblePlan");
          v50 = +[TSUtilities inBuddy](TSUtilities, "inBuddy");
          isStandaloneProximityTransfer = self->_isStandaloneProximityTransfer;
          objc_msgSend(self->_transferBackPlan, "phoneNumber");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v62) = isStandaloneProximityTransfer;
          v6 = -[TSSinglePlanTransferViewController initWithTransferPlan:isPhysical:isIneligible:inBuddy:confirmCellularPlanTransfer:showOtherOptions:isStandaloneProximityFlow:transferBackPhoneNumber:](v47, "initWithTransferPlan:isPhysical:isIneligible:inBuddy:confirmCellularPlanTransfer:showOtherOptions:isStandaloneProximityFlow:transferBackPhoneNumber:", v32, v48, v49, v50, 0, 0, v62, v33);
        }

        goto LABEL_15;
      }
      if (objc_msgSend(v4, "shouldShowCarrierSetupPane"))
      {
        v39 = [TSBuddyMLViewController alloc];
        objc_msgSend(v4, "carrierSetupItems");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "plans");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "plan");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "websheetUrl");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "postdata");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = -[TSBuddyMLViewController initWithCTPlan:websheetURL:postdata:](v39, "initWithCTPlan:websheetURL:postdata:", v43, v44, v45);

        dispatch_get_current_queue();
        v20 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __39__TSTransferFlow__firstViewController___block_invoke;
        block[3] = &unk_24DEF29A8;
        block[4] = self;
        dispatch_async(v20, block);
        goto LABEL_15;
      }
      if (!self->_isStandaloneProximityTransfer)
      {
        v54 = +[TSUtilities isWifiAvailable](TSUtilities, "isWifiAvailable");
        +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "planItems");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "count");

        +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "usingBootstrapDataService");

        _TSLogDomain();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v67 = v54;
          *(_WORD *)&v67[4] = 1024;
          *(_DWORD *)&v67[6] = v57 != 0;
          LOWORD(v68) = 1024;
          *(_DWORD *)((char *)&v68 + 2) = v59;
          HIWORD(v68) = 2080;
          v69 = "-[TSTransferFlow _firstViewController:]";
          _os_log_impl(&dword_21B647000, v60, OS_LOG_TYPE_DEFAULT, "isWiFi:%d, hasPlans:%d, usingBootstrap:%d @%s", buf, 0x1Eu);
        }

        v6 = 0;
        if (v57)
          v61 = 1;
        else
          v61 = v54;
        if ((v61 & 1) != 0 || ((v59 ^ 1) & 1) != 0)
          goto LABEL_19;
        -[TSTransferFlow _createIntroViewController](self, "_createIntroViewController");
        v23 = (TSMultiPlanIntermediateViewController *)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
      v52 = [TSNoPlanForTransferViewController alloc];
      objc_msgSend(self->_transferBackPlan, "carrierName");
      v20 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(self->_transferBackPlan, "phoneNumber");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v4, "isTransferNotSupportedFromiPhone");
      BYTE1(v62) = self->_transferBackPlan != 0;
      LOBYTE(v62) = v53;
      v22 = -[TSNoPlanForTransferViewController initWithCarrier:phoneNumber:transferCapability:showOtherOptions:entryPoint:sourceDeviceName:isTransferNotSupportedFromiPhone:isTransferBackPlan:](v52, "initWithCarrier:phoneNumber:transferCapability:showOtherOptions:entryPoint:sourceDeviceName:isTransferNotSupportedFromiPhone:isTransferBackPlan:", v20, v21, 0, 0, 1, 0, v62);
    }
    v6 = (TSTransferredViewController *)v22;

    goto LABEL_15;
  }
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v67 = "-[TSTransferFlow _firstViewController:]";
    _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "Skip for greentea ipad in buddy @%s", buf, 0xCu);
  }

  v6 = 0;
LABEL_23:

  return v6;
}

uint64_t __39__TSTransferFlow__firstViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSourceProxCardState:", 0);
}

- (id)_createIntroViewController
{
  _BOOL4 v3;
  _BOOL4 v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl())
    v3 = self->_session == 0;
  else
    v3 = 0;
  v4 = +[TSUtilities isPad](TSUtilities, "isPad");
  v5 = !v4 & v3;
  if (v4 && v3)
    v5 = _os_feature_enabled_impl();
  _TSLogDomain();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "OFF";
    if ((_DWORD)v5)
      v7 = "ON";
    v9 = 136315394;
    v10 = v7;
    v11 = 2080;
    v12 = "-[TSTransferFlow _createIntroViewController]";
    _os_log_impl(&dword_21B647000, v6, OS_LOG_TYPE_DEFAULT, "transfer option is %s @%s", (uint8_t *)&v9, 0x16u);
  }

  return -[TSCellularPlanIntroViewController initWithShowTransferOption:requireDelayBluetoothConnection:]([TSCellularPlanIntroViewController alloc], "initWithShowTransferOption:requireDelayBluetoothConnection:", v5, 0);
}

- (void)firstViewController:(id)a3
{
  TSTransferFlowModel *model;
  id v6;
  id firstViewControllerCallback;
  id v8;
  void *v9;
  uint64_t v10;

  if (self->_isAvailableOptionsQueryCompleted)
  {
    model = self->_model;
    v6 = a3;
    -[TSTransferFlow _firstViewController:](self, "_firstViewController:", model);
    v10 = objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t))a3 + 2))(v6, v10);

    firstViewControllerCallback = (id)v10;
  }
  else
  {
    v8 = a3;
    v9 = (void *)MEMORY[0x220765A70]();

    firstViewControllerCallback = self->_firstViewControllerCallback;
    self->_firstViewControllerCallback = v9;
  }

}

- (void)startOverWithFirstViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  -[TSSIMSetupFlow navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSSIMSetupFlow navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[TSFlowHelper handleStartOverAgainstNoPlan:navigationController:completion:](TSFlowHelper, "handleStartOverAgainstNoPlan:navigationController:completion:", v6, v7, v4);

  if (!v8)
  {
    objc_initWeak(&location, self);
    +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __51__TSTransferFlow_startOverWithFirstViewController___block_invoke;
    v10[3] = &unk_24DEF3688;
    objc_copyWeak(&v12, &location);
    v11 = v4;
    objc_msgSend(v9, "hasInstallingPlanOrUserPlan:", v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __51__TSTransferFlow_startOverWithFirstViewController___block_invoke(uint64_t a1, char a2)
{
  id v3;
  int v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;

  if ((a2 & 1) != 0
    || (v3 = objc_loadWeakRetained((id *)(a1 + 40)),
        v4 = objc_msgSend(v3, "isStandaloneProximityTransfer"),
        v3,
        v4))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "model");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clearCache");

    v7 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v7, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v9, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_loadWeakRetained((id *)(a1 + 40));
    v12 = objc_msgSend(v11, "hasTransferablePlan");
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __51__TSTransferFlow_startOverWithFirstViewController___block_invoke_2;
    v13[3] = &unk_24DEF3688;
    objc_copyWeak(&v15, (id *)(a1 + 40));
    v14 = *(id *)(a1 + 32);
    objc_msgSend(v8, "arePlansAvailable:transferablePlanOnSource:bootstrapOnly:completion:", v10, v12, 0, v13);

    objc_destroyWeak(&v15);
  }
}

void __51__TSTransferFlow_startOverWithFirstViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__TSTransferFlow_startOverWithFirstViewController___block_invoke_3;
  v3[3] = &unk_24DEF2F68;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "firstViewController:", v3);

}

uint64_t __51__TSTransferFlow_startOverWithFirstViewController___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)nextViewControllerFrom:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  TSTransferListViewController *v8;
  _BOOL8 isActivationPolicyMismatch;
  _BOOL8 isDualeSIMCapablityLoss;
  CTDisplayPlanList *pendingInstallItems;
  NSArray *transferItems;
  TSSubFlowViewController *v13;
  uint64_t v14;
  int v15;
  void *v16;
  id transferBackPlan;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  TSBuddyMLViewController *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  TSSubFlowViewController *v28;
  TSSubFlowViewController *v29;
  void *v30;
  void *v31;
  TSSubFlowViewController *v32;
  void *v33;
  void *v34;
  void *v35;
  TSSubFlowViewController *v37;
  uint64_t v38;
  int v39;
  void *v40;
  int v41;
  void *v42;
  TSSubFlowViewController *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[3];
  _QWORD v52[3];
  _QWORD v53[6];
  _QWORD v54[6];
  _QWORD v55[7];
  _QWORD v56[9];

  v56[7] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[TSTransferFlowModel shouldShowCarrierSetupPane](self->_model, "shouldShowCarrierSetupPane"))
      goto LABEL_19;
    if (!objc_msgSend(v5, "isOtherButtonTapped"))
    {
      v13 = [TSSubFlowViewController alloc];
      v55[0] = CFSTR("FlowTypeKey");
      v55[1] = CFSTR("SkipActivatingPane");
      v14 = MEMORY[0x24BDBD1C8];
      v56[0] = &unk_24DF23620;
      v56[1] = MEMORY[0x24BDBD1C8];
      v55[2] = CFSTR("DelayStartActivatingTimer");
      v15 = objc_msgSend(v5, "installingTransferPlan");
      v16 = &unk_24DF23650;
      if (v15)
        v16 = &unk_24DF23638;
      v56[2] = v16;
      v55[3] = CFSTR("TransferBackPlan");
      transferBackPlan = self->_transferBackPlan;
      v18 = transferBackPlan;
      if (!transferBackPlan)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v56[3] = v18;
      v55[4] = CFSTR("PlanSetupTypeKey");
      v19 = objc_msgSend(v5, "installingTransferPlan");
      v20 = &unk_24DF23680;
      if (v19)
        v20 = &unk_24DF23668;
      v56[4] = v20;
      v55[5] = CFSTR("CarrierNameKey");
      objc_msgSend(v5, "carrierNameForSelectedItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
        objc_msgSend(v5, "carrierNameForSelectedItem");
      else
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v55[6] = CFSTR("MaybeShowConfirmationCodePaneKey");
      v56[5] = v33;
      v56[6] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, v55, 7);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSSIMSetupFlow navigationController](self, "navigationController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[TSSubFlowViewController initWithOptions:navigationController:](v13, "initWithOptions:navigationController:", v34, v35);

      if (transferBackPlan)
        goto LABEL_37;
      goto LABEL_22;
    }
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v4, "isTransferListCellTapped"))
    {
      -[CTDisplayPlanList plans](self->_pendingInstallItems, "plans");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v7)
      {
        v8 = [TSTransferListViewController alloc];
        isActivationPolicyMismatch = self->_isActivationPolicyMismatch;
        isDualeSIMCapablityLoss = self->_isDualeSIMCapablityLoss;
        pendingInstallItems = self->_pendingInstallItems;
        BYTE1(v46) = self->_isStandaloneProximityTransfer;
        LOBYTE(v46) = 0;
        transferItems = 0;
LABEL_33:
        v28 = -[TSTransferListViewController initWithTransferItems:confirmCellularPlanTransfer:isActivationPolicyMismatch:isDualeSIMCapabilityLoss:pendingInstallItems:carrierSetupItems:showOtherOptions:isStandaloneProximityFlow:](v8, "initWithTransferItems:confirmCellularPlanTransfer:isActivationPolicyMismatch:isDualeSIMCapabilityLoss:pendingInstallItems:carrierSetupItems:showOtherOptions:isStandaloneProximityFlow:", transferItems, 0, isActivationPolicyMismatch, isDualeSIMCapablityLoss, pendingInstallItems, 0, v46);
        goto LABEL_38;
      }
      if (-[TSTransferFlow _hasTransferablePlan:](self, "_hasTransferablePlan:", self->_transferItems))
      {
        v8 = [TSTransferListViewController alloc];
        transferItems = self->_transferItems;
        isActivationPolicyMismatch = self->_isActivationPolicyMismatch;
        isDualeSIMCapablityLoss = self->_isDualeSIMCapablityLoss;
        BYTE1(v46) = self->_isStandaloneProximityTransfer;
        LOBYTE(v46) = 0;
        pendingInstallItems = 0;
        goto LABEL_33;
      }
    }
LABEL_34:
    v28 = 0;
    goto LABEL_38;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (objc_msgSend(v5, "isCarrierSetupItemSelected"))
    {
LABEL_19:
      v22 = [TSBuddyMLViewController alloc];
      -[TSTransferFlowModel carrierSetupItems](self->_model, "carrierSetupItems");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "plans");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "plan");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSTransferFlowModel websheetUrl](self->_model, "websheetUrl");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSTransferFlowModel postdata](self->_model, "postdata");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[TSBuddyMLViewController initWithCTPlan:websheetURL:postdata:](v22, "initWithCTPlan:websheetURL:postdata:", v25, v26, v27);

LABEL_20:
LABEL_21:

LABEL_22:
LABEL_37:

      goto LABEL_38;
    }
    if (!objc_msgSend(v5, "isOtherButtonTapped"))
    {
      v37 = [TSSubFlowViewController alloc];
      v53[0] = CFSTR("FlowTypeKey");
      v53[1] = CFSTR("SkipActivatingPane");
      v38 = MEMORY[0x24BDBD1C8];
      v54[0] = &unk_24DF23620;
      v54[1] = MEMORY[0x24BDBD1C8];
      v53[2] = CFSTR("DelayStartActivatingTimer");
      v39 = objc_msgSend(v5, "installingTransferPlan");
      v40 = &unk_24DF23650;
      if (v39)
        v40 = &unk_24DF23638;
      v54[2] = v40;
      v53[3] = CFSTR("PlanSetupTypeKey");
      v41 = objc_msgSend(v5, "installingTransferPlan");
      v42 = &unk_24DF23680;
      if (v41)
        v42 = &unk_24DF23668;
      v54[3] = v42;
      v53[4] = CFSTR("CarrierNameKey");
      objc_msgSend(v5, "carrierNameForSelectedItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
        objc_msgSend(v5, "carrierNameForSelectedItem");
      else
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v53[5] = CFSTR("MaybeShowConfirmationCodePaneKey");
      v54[4] = v23;
      v54[5] = v38;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, v53, 6);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSSIMSetupFlow navigationController](self, "navigationController");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[TSSubFlowViewController initWithOptions:navigationController:](v37, "initWithOptions:navigationController:", v24, v45);

      goto LABEL_20;
    }
LABEL_27:
    -[TSTransferFlow _createIntroViewController](self, "_createIntroViewController");
    v28 = (TSSubFlowViewController *)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (objc_msgSend(v5, "isScanButtonTapped"))
      {
        v32 = [TSSubFlowViewController alloc];
        v49[0] = CFSTR("FlowTypeKey");
        v49[1] = CFSTR("IsFirstViewKey");
        v50[0] = &unk_24DF236B0;
        v50[1] = MEMORY[0x24BDBD1C0];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[TSSIMSetupFlow navigationController](self, "navigationController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[TSSubFlowViewController initWithOptions:navigationController:](v32, "initWithOptions:navigationController:", v18, v23);
      }
      else
      {
        if (!objc_msgSend(v5, "isProximityTransferButtonTapped"))
        {
          v28 = 0;
          goto LABEL_37;
        }
        v43 = [TSSubFlowViewController alloc];
        v47[0] = CFSTR("FlowTypeKey");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 10002);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v47[1] = CFSTR("IsClientKey");
        v48[0] = v18;
        v48[1] = MEMORY[0x24BDBD1C0];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[TSSIMSetupFlow navigationController](self, "navigationController");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[TSSubFlowViewController initWithOptions:navigationController:](v43, "initWithOptions:navigationController:", v23, v44);

      }
      goto LABEL_21;
    }
    goto LABEL_34;
  }
  v29 = [TSSubFlowViewController alloc];
  v51[0] = CFSTR("FlowTypeKey");
  v51[1] = CFSTR("SkipActivatingPane");
  v52[0] = &unk_24DF23620;
  v52[1] = MEMORY[0x24BDBD1C0];
  v51[2] = CFSTR("PlanSetupTypeKey");
  v52[2] = &unk_24DF23698;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSSIMSetupFlow navigationController](self, "navigationController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[TSSubFlowViewController initWithOptions:navigationController:](v29, "initWithOptions:navigationController:", v30, v31);

  if (!self->_isSourceProxCardVisible)
    -[TSTransferFlow _updateSourceProxCardState:](self, "_updateSourceProxCardState:", 1);
LABEL_38:

  return v28;
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
    v14.super_class = (Class)TSTransferFlow;
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
  v15.super_class = (Class)TSTransferFlow;
  -[TSSIMSetupFlow viewControllerDidComplete:](&v15, sel_viewControllerDidComplete_, v11);

LABEL_7:
}

- (void)setDefaultNavigationItems:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  UIBarButtonItem *cancelButton;
  id v9;

  v4 = a3;
  v5 = +[TSUtilities isPad](TSUtilities, "isPad");
  objc_msgSend(v4, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  cancelButton = self->_cancelButton;
  if (v5)
    objc_msgSend(v6, "setRightBarButtonItem:", cancelButton);
  else
    objc_msgSend(v6, "setLeftBarButtonItem:", cancelButton);

  objc_msgSend(v4, "navigationItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setHidesBackButton:animated:", 1, 0);
}

- (void)transferEventUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = v4;
    v9 = 2080;
    v10 = "-[TSTransferFlow transferEventUpdate:]";
    _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "transfer event : %@ @%s", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(v4, "objectForKey:", CFSTR("UpdateProxCardVisibility"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[TSTransferFlow _updateSourceProxCardState:](self, "_updateSourceProxCardState:", objc_msgSend(v6, "BOOLValue"));
  }

}

- (void)userDidTapCancel
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_super v15;

  -[TSSIMSetupFlow topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

  }
  else
  {
    -[TSSIMSetupFlow topViewController](self, "topViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      goto LABEL_5;
  }
  +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BDC27B8]);
  -[TSTransferFlowModel transferItems](self->_model, "transferItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[TSUtilities transferablePlans:](TSUtilities, "transferablePlans:", v8);
  -[TSTransferFlowModel pendingInstallItems](self->_model, "pendingInstallItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "plans");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  -[TSTransferFlowModel transferItems](self->_model, "transferItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v7, "initWithInBuddy:transferablePlans:selectedTransferablePlans:alsPlans:selectedAlsPlans:odaPlans:", 1, v9, 0, v12, 0, +[TSUtilities odaPlans:](TSUtilities, "odaPlans:", v13));
  objc_msgSend(v6, "submitSimSetupUsage:", v14);

LABEL_5:
  if (!self->_isSourceProxCardVisible)
    -[TSTransferFlow _updateSourceProxCardState:](self, "_updateSourceProxCardState:", 1);
  v15.receiver = self;
  v15.super_class = (Class)TSTransferFlow;
  -[TSSIMSetupFlow userDidTapCancel](&v15, sel_userDidTapCancel);
}

- (void)_updateSourceProxCardState:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  -[TSSIMSetupFlow delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    _TSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("hiding");
      if (v3)
        v8 = CFSTR("showing");
      v10 = 138412546;
      v11 = v8;
      v12 = 2080;
      v13 = "-[TSTransferFlow _updateSourceProxCardState:]";
      _os_log_impl(&dword_21B647000, v7, OS_LOG_TYPE_DEFAULT, "%@ prox card on source device @%s", (uint8_t *)&v10, 0x16u);
    }

    self->_isSourceProxCardVisible = v3;
    -[TSSIMSetupFlow delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateSourceProxCardState:", v3);

  }
}

- (CUMessageSession)session
{
  return (CUMessageSession *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (CoreTelephonyClient)ctClient
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 160, 1);
}

- (void)setCtClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (BOOL)hasTransferablePlan
{
  return self->_hasTransferablePlan;
}

- (void)setHasTransferablePlan:(BOOL)a3
{
  self->_hasTransferablePlan = a3;
}

- (BOOL)isStandaloneProximityTransfer
{
  return self->_isStandaloneProximityTransfer;
}

- (void)setIsStandaloneProximityTransfer:(BOOL)a3
{
  self->_isStandaloneProximityTransfer = a3;
}

- (BOOL)isAvailableOptionsQueryCompleted
{
  return self->_isAvailableOptionsQueryCompleted;
}

- (void)setIsAvailableOptionsQueryCompleted:(BOOL)a3
{
  self->_isAvailableOptionsQueryCompleted = a3;
}

- (BOOL)isSourceProxCardVisible
{
  return self->_isSourceProxCardVisible;
}

- (void)setIsSourceProxCardVisible:(BOOL)a3
{
  self->_isSourceProxCardVisible = a3;
}

- (TSTransferFlowModel)model
{
  return (TSTransferFlowModel *)objc_getProperty(self, a2, 168, 1);
}

- (void)setModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (id)firstViewControllerCallback
{
  return objc_getProperty(self, a2, 176, 1);
}

- (void)setFirstViewControllerCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (id)transferBackPlan
{
  return objc_getProperty(self, a2, 184, 1);
}

- (void)setTransferBackPlan:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transferBackPlan, 0);
  objc_storeStrong(&self->_firstViewControllerCallback, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_pendingInstallItems, 0);
  objc_storeStrong((id *)&self->_transferItems, 0);
  objc_storeStrong((id *)&self->_queryGroup, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_planInstallError, 0);
}

@end
