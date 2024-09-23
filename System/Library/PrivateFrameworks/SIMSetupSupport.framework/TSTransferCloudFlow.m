@implementation TSTransferCloudFlow

- (TSTransferCloudFlow)initWithProximitySetupState:(unint64_t)a3
{
  TSTransferCloudFlow *v4;
  TSTransferCloudFlowModel *v5;
  TSTransferCloudFlowModel *model;
  uint64_t v7;
  UIBarButtonItem *cancelButton;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TSTransferCloudFlow;
  v4 = -[TSSIMSetupFlow init](&v11, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(TSTransferCloudFlowModel);
    model = v4->_model;
    v4->_model = v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v4, sel_userDidTapCancel);
    cancelButton = v4->_cancelButton;
    v4->_cancelButton = (UIBarButtonItem *)v7;

    v4->_proximitySetupState = a3;
    +[TSUserInPurchaseFlowAssertion sharedInstance](TSUserInPurchaseFlowAssertion, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assertUserInPurchaseFlowStartOver:caller:", 0, v4);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[TSUserInPurchaseFlowAssertion sharedInstance](TSUserInPurchaseFlowAssertion, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deassertUserInPurchaseFlowWithForce:caller:", 0, self);

  v4.receiver = self;
  v4.super_class = (Class)TSTransferCloudFlow;
  -[TSTransferCloudFlow dealloc](&v4, sel_dealloc);
}

- (id)firstViewController
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  TSNoPlanForTransferViewController *v8;
  TSMultiPlanIntermediateViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  TSNoPlanForTransferViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  TSBuddyMLViewController *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  TSSinglePlanTransferViewController *v27;
  NSObject *v28;
  uint64_t v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (+[TSUtilities isPad](TSUtilities, "isPad")
    && +[TSUtilities isGreenTeaCapable](TSUtilities, "isGreenTeaCapable")
    && +[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    _TSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[TSTransferCloudFlow firstViewController]";
      _os_log_impl(&dword_21B647000, v3, OS_LOG_TYPE_DEFAULT, "Skip for greentea ipad in buddy @%s", buf, 0xCu);
    }
LABEL_10:
    v8 = 0;
    goto LABEL_27;
  }
  -[TSTransferCloudFlowModel transferItems](self->_model, "transferItems");
  v3 = objc_claimAutoreleasedReturnValue();
  -[TSTransferCloudFlowModel crossPlatformTransferItems](self->_model, "crossPlatformTransferItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "plans");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 1)
  {
    _TSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[TSTransferCloudFlow firstViewController]";
      _os_log_impl(&dword_21B647000, v7, OS_LOG_TYPE_DEFAULT, "Skip showing cross-platform VC. @%s", buf, 0xCu);
    }

    goto LABEL_10;
  }
  if ((unint64_t)-[NSObject count](v3, "count") < 2)
  {
    if (-[NSObject count](v3, "count") == 1)
    {
      -[NSObject objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("planItem"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSObject objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("deviceInfo"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "isTransferIneligiblePlan"))
      {
        v14 = [TSNoPlanForTransferViewController alloc];
        objc_msgSend(v11, "carrierName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "plan");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "transferAttributes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "transferCapability");
        objc_msgSend(v13, "deviceName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LOWORD(v30) = 0;
        v8 = -[TSNoPlanForTransferViewController initWithCarrier:phoneNumber:transferCapability:showOtherOptions:entryPoint:sourceDeviceName:isTransferNotSupportedFromiPhone:isTransferBackPlan:](v14, "initWithCarrier:phoneNumber:transferCapability:showOtherOptions:entryPoint:sourceDeviceName:isTransferNotSupportedFromiPhone:isTransferBackPlan:", v15, 0, v18, 1, 1, v19, v30);

      }
      else
      {
        v27 = [TSSinglePlanTransferViewController alloc];
        -[NSObject objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[TSSinglePlanTransferViewController initWithTransferPlan:isPhysical:isIneligible:inBuddy:confirmCellularPlanTransfer:showOtherOptions:](v27, "initWithTransferPlan:isPhysical:isIneligible:inBuddy:confirmCellularPlanTransfer:showOtherOptions:", v15, objc_msgSend(v11, "isPhysical"), objc_msgSend(v11, "isTransferIneligiblePlan"), 1, 1, 1);
      }

      goto LABEL_24;
    }
    if (-[TSTransferCloudFlowModel shouldShowCarrierSetupPane](self->_model, "shouldShowCarrierSetupPane"))
    {
      v20 = [TSBuddyMLViewController alloc];
      -[TSTransferCloudFlowModel carrierSetupItems](self->_model, "carrierSetupItems");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "plans");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "plan");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSTransferCloudFlowModel websheetUrl](self->_model, "websheetUrl");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSTransferCloudFlowModel postdata](self->_model, "postdata");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[TSBuddyMLViewController initWithCTPlan:websheetURL:postdata:](v20, "initWithCTPlan:websheetURL:postdata:", v24, v25, v26);

      -[TSTransferCloudFlow _updateSourceProxCardState:](self, "_updateSourceProxCardState:", 0);
      goto LABEL_24;
    }
    if (self->_proximitySetupState != 1)
    {
      v8 = 0;
      goto LABEL_24;
    }
    -[TSTransferCloudFlow _createIntroViewController:](self, "_createIntroViewController:", 0);
    v9 = (TSMultiPlanIntermediateViewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = -[TSMultiPlanIntermediateViewController initWithTransferItems:showOtherOptions:]([TSMultiPlanIntermediateViewController alloc], "initWithTransferItems:showOtherOptions:", v3, 0);
  }
  v8 = (TSNoPlanForTransferViewController *)v9;
LABEL_24:
  -[TSNoPlanForTransferViewController setDelegate:](v8, "setDelegate:", self);
  _TSLogDomain();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v32 = (const char *)objc_opt_class();
    v33 = 2080;
    v34 = "-[TSTransferCloudFlow firstViewController]";
    _os_log_impl(&dword_21B647000, v28, OS_LOG_TYPE_DEFAULT, "first view: %@ @%s", buf, 0x16u);
  }

  -[TSSIMSetupFlow setTopViewController:](self, "setTopViewController:", v8);
LABEL_27:

  return v8;
}

- (void)firstViewController:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  NSObject *v7;
  TSTransferCloudFlowModel *model;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  void (**v13)(id, _QWORD);
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    if (+[TSUtilities isPad](TSUtilities, "isPad") && (_os_feature_enabled_impl() & 1) == 0)
    {
      _TSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[TSTransferCloudFlow firstViewController:]";
        _os_log_impl(&dword_21B647000, v9, OS_LOG_TYPE_DEFAULT, "Skip transfer cloud flow on iPad @%s", buf, 0xCu);
      }

      v4[2](v4, 0);
    }
    else
    {
      +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "planItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v6, "count"))
      {
        _TSLogDomain();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          v15 = (const char *)objc_msgSend(v6, "count");
          v16 = 2080;
          v17 = "-[TSTransferCloudFlow firstViewController:]";
          _os_log_impl(&dword_21B647000, v7, OS_LOG_TYPE_DEFAULT, "Skip transfer cloud flow when user profiles: %zd @%s", buf, 0x16u);
        }

        v4[2](v4, 0);
      }
      else if ((_os_feature_enabled_impl() & 1) != 0)
      {
        model = self->_model;
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __43__TSTransferCloudFlow_firstViewController___block_invoke;
        v12[3] = &unk_24DEF3988;
        v12[4] = self;
        v13 = v4;
        -[TSTransferCloudFlowModel arePlansAvailable:](model, "arePlansAvailable:", v12);

      }
      else
      {
        _TSLogDomain();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v15 = "-[TSTransferCloudFlow firstViewController:]";
          _os_log_impl(&dword_21B647000, v10, OS_LOG_TYPE_DEFAULT, "SIMSetupSupport/MagnoliaOverCloudInBuddy is disabled @%s", buf, 0xCu);
        }

        -[TSTransferCloudFlow firstViewController](self, "firstViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, void *))v4)[2](v4, v11);

      }
    }
  }

}

void __43__TSTransferCloudFlow_firstViewController___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "firstViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (id)_createIntroViewController:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  v4 = _os_feature_enabled_impl();
  if (+[TSUtilities isPad](TSUtilities, "isPad"))
    v4 = _os_feature_enabled_impl();
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "disabled";
    if ((_DWORD)v4)
      v6 = "enabled";
    v8 = 136315394;
    v9 = v6;
    v10 = 2080;
    v11 = "-[TSTransferCloudFlow _createIntroViewController:]";
    _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "SIMSetupSupport/MagnoliaOverProximity or iPadESIMProvisioningParity is %s @%s", (uint8_t *)&v8, 0x16u);
  }

  return -[TSCellularPlanIntroViewController initWithShowTransferOption:requireDelayBluetoothConnection:]([TSCellularPlanIntroViewController alloc], "initWithShowTransferOption:requireDelayBluetoothConnection:", v4, v3);
}

- (void)startOverWithFirstViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  _QWORD v10[5];
  id v11;

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
    +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __56__TSTransferCloudFlow_startOverWithFirstViewController___block_invoke;
    v10[3] = &unk_24DEF3988;
    v10[4] = self;
    v11 = v4;
    objc_msgSend(v9, "hasInstallingPlanOrUserPlan:", v10);

  }
}

void __56__TSTransferCloudFlow_startOverWithFirstViewController___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __56__TSTransferCloudFlow_startOverWithFirstViewController___block_invoke_2;
    v3[3] = &unk_24DEF2F68;
    v2 = *(void **)(a1 + 32);
    v4 = *(id *)(a1 + 40);
    objc_msgSend(v2, "firstViewController:", v3);

  }
}

uint64_t __56__TSTransferCloudFlow_startOverWithFirstViewController___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)nextViewControllerFrom:(id)a3
{
  id v4;
  id v5;
  TSSubFlowViewController *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  TSTransferListViewController *v14;
  void *v15;
  TSCellularPlanIntroViewController *v16;
  TSSubFlowViewController *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  TSSubFlowViewController *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  TSSubFlowViewController *v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[4];
  _QWORD v40[4];
  _QWORD v41[4];
  _QWORD v42[5];

  v42[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (!objc_msgSend(v5, "isOtherButtonTapped"))
    {
      v6 = [TSSubFlowViewController alloc];
      v41[0] = CFSTR("FlowTypeKey");
      v41[1] = CFSTR("SkipActivatingPane");
      v42[0] = &unk_24DF236C8;
      v42[1] = MEMORY[0x24BDBD1C8];
      v41[2] = CFSTR("DelayStartActivatingTimer");
      v7 = objc_msgSend(v5, "installingTransferPlan");
      v8 = &unk_24DF236F8;
      if (v7)
        v8 = &unk_24DF236E0;
      v42[2] = v8;
      v41[3] = CFSTR("PlanSetupTypeKey");
      v9 = objc_msgSend(v5, "installingTransferPlan");
      v10 = &unk_24DF23728;
      if (v9)
        v10 = &unk_24DF23710;
      v42[3] = v10;
      v11 = (void *)MEMORY[0x24BDBCE70];
      v12 = v42;
      v13 = v41;
LABEL_22:
      objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSSIMSetupFlow navigationController](self, "navigationController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[TSSubFlowViewController initWithOptions:navigationController:](v6, "initWithOptions:navigationController:", v24, v25);

LABEL_23:
      goto LABEL_24;
    }
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v4, "isTransferListCellTapped"))
    {
      v14 = [TSTransferListViewController alloc];
      -[TSTransferCloudFlowModel transferItems](self->_model, "transferItems");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[TSTransferListViewController initWithTransferItems:confirmCellularPlanTransfer:isActivationPolicyMismatch:isDualeSIMCapabilityLoss:showOtherOptions:](v14, "initWithTransferItems:confirmCellularPlanTransfer:isActivationPolicyMismatch:isDualeSIMCapabilityLoss:showOtherOptions:", v15, 1, -[TSTransferCloudFlowModel isActivationPolicyMismatch](self->_model, "isActivationPolicyMismatch"), -[TSTransferCloudFlowModel isDualeSIMCapablityLoss](self->_model, "isDualeSIMCapablityLoss"), 1);

      goto LABEL_25;
    }
LABEL_34:
    v16 = 0;
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (!objc_msgSend(v5, "isOtherButtonTapped"))
    {
      v6 = [TSSubFlowViewController alloc];
      v39[0] = CFSTR("FlowTypeKey");
      v39[1] = CFSTR("SkipActivatingPane");
      v40[0] = &unk_24DF236C8;
      v40[1] = MEMORY[0x24BDBD1C8];
      v39[2] = CFSTR("DelayStartActivatingTimer");
      v20 = objc_msgSend(v5, "installingTransferPlan");
      v21 = &unk_24DF236F8;
      if (v20)
        v21 = &unk_24DF236E0;
      v40[2] = v21;
      v39[3] = CFSTR("PlanSetupTypeKey");
      v22 = objc_msgSend(v5, "installingTransferPlan");
      v23 = &unk_24DF23728;
      if (v22)
        v23 = &unk_24DF23710;
      v40[3] = v23;
      v11 = (void *)MEMORY[0x24BDBCE70];
      v12 = v40;
      v13 = v39;
      goto LABEL_22;
    }
LABEL_13:
    -[TSTransferCloudFlow _createIntroViewController:](self, "_createIntroViewController:", objc_msgSend(v5, "requireDelayBluetoothConnection"));
    v16 = (TSCellularPlanIntroViewController *)objc_claimAutoreleasedReturnValue();
LABEL_24:

    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = [TSSubFlowViewController alloc];
    v37[0] = CFSTR("FlowTypeKey");
    v37[1] = CFSTR("SkipActivatingPane");
    v38[0] = &unk_24DF236C8;
    v38[1] = MEMORY[0x24BDBD1C0];
    v37[2] = CFSTR("PlanSetupTypeKey");
    v38[2] = &unk_24DF23740;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSSIMSetupFlow navigationController](self, "navigationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[TSSubFlowViewController initWithOptions:navigationController:](v17, "initWithOptions:navigationController:", v18, v19);

    if (!self->_isSourceProxCardVisible)
      -[TSTransferCloudFlow _updateSourceProxCardState:](self, "_updateSourceProxCardState:", 1);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (objc_msgSend(v5, "isProximityTransferButtonTapped"))
      {
        v27 = [TSSubFlowViewController alloc];
        v35[0] = CFSTR("FlowTypeKey");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 10002);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v35[1] = CFSTR("IsClientKey");
        v36[0] = v24;
        v36[1] = MEMORY[0x24BDBD1C0];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[TSSIMSetupFlow navigationController](self, "navigationController");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[TSSubFlowViewController initWithOptions:navigationController:](v27, "initWithOptions:navigationController:", v28, v29);

      }
      else
      {
        if (!objc_msgSend(v5, "isScanButtonTapped"))
        {
          v16 = 0;
          goto LABEL_24;
        }
        v32 = [TSSubFlowViewController alloc];
        v33[0] = CFSTR("FlowTypeKey");
        v33[1] = CFSTR("IsFirstViewKey");
        v34[0] = &unk_24DF23758;
        v34[1] = MEMORY[0x24BDBD1C0];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[TSSIMSetupFlow navigationController](self, "navigationController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[TSSubFlowViewController initWithOptions:navigationController:](v32, "initWithOptions:navigationController:", v24, v28);
      }

      goto LABEL_23;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_34;
    v30 = v4;
    if (objc_msgSend(v30, "isOfferFallbackFlow"))
    {
      objc_msgSend(v30, "setIsOfferFallbackFlow:", 0);
      v31 = _os_feature_enabled_impl();
      if (+[TSUtilities isPad](TSUtilities, "isPad"))
        v31 = _os_feature_enabled_impl();
      v16 = -[TSCellularPlanIntroViewController initWithShowTransferOption:requireDelayBluetoothConnection:]([TSCellularPlanIntroViewController alloc], "initWithShowTransferOption:requireDelayBluetoothConnection:", v31, 0);
    }
    else
    {
      v16 = 0;
    }

  }
LABEL_25:

  return v16;
}

- (void)setDefaultNavigationItems:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  objc_msgSend(v8, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(v6, "setRightBarButtonItem:", self->_cancelButton);
  }
  else
  {
    objc_msgSend(v6, "setHidesBackButton:animated:", 1, 0);

    objc_msgSend(v8, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLeftBarButtonItem:", self->_cancelButton);
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
  objc_super v12;

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
  -[TSTransferCloudFlowModel transferItems](self->_model, "transferItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[TSUtilities transferablePlans:](TSUtilities, "transferablePlans:", v8);
  -[TSTransferCloudFlowModel transferItems](self->_model, "transferItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithInBuddy:transferablePlans:selectedTransferablePlans:alsPlans:selectedAlsPlans:odaPlans:", 0, v9, 0, 0, 0, +[TSUtilities odaPlans:](TSUtilities, "odaPlans:", v10));
  objc_msgSend(v6, "submitSimSetupUsage:", v11);

LABEL_5:
  if (!self->_isSourceProxCardVisible)
    -[TSTransferCloudFlow _updateSourceProxCardState:](self, "_updateSourceProxCardState:", 1);
  v12.receiver = self;
  v12.super_class = (Class)TSTransferCloudFlow;
  -[TSSIMSetupFlow userDidTapCancel](&v12, sel_userDidTapCancel);
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
      v13 = "-[TSTransferCloudFlow _updateSourceProxCardState:]";
      _os_log_impl(&dword_21B647000, v7, OS_LOG_TYPE_DEFAULT, "%@ prox card on source device @%s", (uint8_t *)&v10, 0x16u);
    }

    self->_isSourceProxCardVisible = v3;
    -[TSSIMSetupFlow delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateSourceProxCardState:", v3);

  }
}

- (TSTransferCloudFlowModel)model
{
  return (TSTransferCloudFlowModel *)objc_getProperty(self, a2, 112, 1);
}

- (void)setModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (BOOL)isSourceProxCardVisible
{
  return self->_isSourceProxCardVisible;
}

- (void)setIsSourceProxCardVisible:(BOOL)a3
{
  self->_isSourceProxCardVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
}

@end
