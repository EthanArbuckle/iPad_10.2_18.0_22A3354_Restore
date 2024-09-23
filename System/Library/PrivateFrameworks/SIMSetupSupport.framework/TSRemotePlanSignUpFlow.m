@implementation TSRemotePlanSignUpFlow

- (TSRemotePlanSignUpFlow)initWithRemotePlanWebsheetContext:(id)a3
{
  id v4;
  TSRemotePlanSignUpFlow *v5;
  TSRemotePlanSignUpFlow *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSRemotePlanSignUpFlow;
  v5 = -[TSSIMSetupFlow init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[TSRemotePlanSignUpFlow setRemotePlanWebsheetContext:](v5, "setRemotePlanWebsheetContext:", v4);
    +[TSUserInPurchaseFlowAssertion sharedInstance](TSUserInPurchaseFlowAssertion, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assertUserInPurchaseFlowStartOver:caller:", 0, v6);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[TSUserInPurchaseFlowAssertion sharedInstance](TSUserInPurchaseFlowAssertion, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deassertUserInPurchaseFlowWithForce:caller:", 0, self);

  v4.receiver = self;
  v4.super_class = (Class)TSRemotePlanSignUpFlow;
  -[TSRemotePlanSignUpFlow dealloc](&v4, sel_dealloc);
}

- (id)firstViewController
{
  TSCellularSetupLoadingViewController *v3;
  void *v4;
  TSCellularSetupLoadingViewController *v5;

  v3 = [TSCellularSetupLoadingViewController alloc];
  -[TSRemotePlanSignUpFlow remotePlanWebsheetContext](self, "remotePlanWebsheetContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TSCellularSetupLoadingViewController initWithRemotePlanWebsheetContext:isRemotePlan:](v3, "initWithRemotePlanWebsheetContext:isRemotePlan:", v4, 1);

  -[TSCellularSetupLoadingViewController setDelegate:](v5, "setDelegate:", self);
  -[TSSIMSetupFlow setTopViewController:](self, "setTopViewController:", v5);
  return v5;
}

- (void)firstViewController:(id)a3
{
  id v5;
  id v6;

  if (a3)
  {
    v5 = a3;
    -[TSRemotePlanSignUpFlow firstViewController](self, "firstViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a3 + 2))(v5, v6);

  }
}

- (id)nextViewControllerFrom:(id)a3
{
  id v4;
  TSWebsheetViewController *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = [TSWebsheetViewController alloc];
    -[TSRemotePlanSignUpFlow remotePlanWebsheetContext](self, "remotePlanWebsheetContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "carrierName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[TSWebsheetViewController initForRemotePlan:carrierName:viewController:](v5, "initForRemotePlan:carrierName:viewController:", 1, v7, v4);

    objc_msgSend(v8, "setCallbackDelegate:", self);
    v9 = v8;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __49__TSRemotePlanSignUpFlow_nextViewControllerFrom___block_invoke;
    v12[3] = &unk_24DEF2A48;
    v13 = v4;
    v14 = v9;
    v10 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], v12);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __49__TSRemotePlanSignUpFlow_nextViewControllerFrom___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  char v5;
  dispatch_time_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "postdata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE158E8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 0;
  v6 = dispatch_time(0, 500000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__TSRemotePlanSignUpFlow_nextViewControllerFrom___block_invoke_2;
  block[3] = &unk_24DEF2B50;
  v11 = v5;
  v9 = v2;
  v10 = *(id *)(a1 + 40);
  v7 = v2;
  dispatch_after(v6, MEMORY[0x24BDAC9B8], block);

}

void __49__TSRemotePlanSignUpFlow_nextViewControllerFrom___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  if (*(_BYTE *)(a1 + 48))
    v2 = 3;
  else
    v2 = 2;
  objc_msgSend(*(id *)(a1 + 32), "carrierURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "postdata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TSURLRequestFactory requestWithType:URL:postdata:](TSURLRequestFactory, "requestWithType:URL:postdata:", v2, v3, v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(*(id *)(a1 + 32), "isProcessCanceled") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "loadRequest:completion:", v5, 0);

}

- (void)didPurchasePlanSuccessfullyWithEid:(id)a3 imei:(id)a4 meid:(id)a5 iccid:(id)a6 alternateSDMP:(id)a7 state:(id)a8
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v12 = (void *)MEMORY[0x24BE15900];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v12, "sharedManager");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "didPurchaseRemotePlanForEid:imei:meid:iccid:alternateSmdpFqdn:completion:", v17, v16, v15, v14, v13, &__block_literal_global_13);

}

void __97__TSRemotePlanSignUpFlow_didPurchasePlanSuccessfullyWithEid_imei_meid_iccid_alternateSDMP_state___block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[TSRemotePlanSignUpFlow didPurchasePlanSuccessfullyWithEid:imei:meid:iccid:alternateSDMP:state:]_block_invoke";
    _os_log_impl(&dword_21B647000, v0, OS_LOG_TYPE_DEFAULT, "Callback after purchase @%s", (uint8_t *)&v1, 0xCu);
  }

}

- (void)didTransferPlanSuccessfullyWithEid:(id)a3 imei:(id)a4 meid:(id)a5 iccid:(id)a6 srcIccid:(id)a7 alternateSDMP:(id)a8 state:(id)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  int v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a8;
  v17 = objc_msgSend(a9, "isEqualToString:", CFSTR("pending-profile-release"));
  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17)
    objc_msgSend(v18, "pendingReleaseRemotePlan");
  else
    objc_msgSend(v18, "didPurchaseRemotePlanForEid:imei:meid:iccid:alternateSmdpFqdn:completion:", v20, v13, v14, v15, v16, &__block_literal_global_22);

}

void __106__TSRemotePlanSignUpFlow_didTransferPlanSuccessfullyWithEid_imei_meid_iccid_srcIccid_alternateSDMP_state___block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[TSRemotePlanSignUpFlow didTransferPlanSuccessfullyWithEid:imei:meid:iccid:srcIccid:alternateSDMP:state:]_block_invoke";
    _os_log_impl(&dword_21B647000, v0, OS_LOG_TYPE_DEFAULT, "Callback after transfer @%s", (uint8_t *)&v1, 0xCu);
  }

}

- (void)accountCancelled
{
  id v2;

  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didCancelRemotePlan");

}

- (void)accountPendingRelease
{
  id v2;

  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pendingReleaseRemotePlan");

}

- (TSRemotePlanWebsheetContext)remotePlanWebsheetContext
{
  return (TSRemotePlanWebsheetContext *)objc_getProperty(self, a2, 96, 1);
}

- (void)setRemotePlanWebsheetContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotePlanWebsheetContext, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
