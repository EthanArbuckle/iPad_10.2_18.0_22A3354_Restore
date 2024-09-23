@implementation TSWebsheetSignupFlow

- (TSWebsheetSignupFlow)init
{
  TSWebsheetSignupFlow *v2;
  uint64_t v3;
  CoreTelephonyClient *client;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSWebsheetSignupFlow;
  v2 = -[TSSIMSetupFlow init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDC2810]), "initWithQueue:", 0);
    client = v2->_client;
    v2->_client = (CoreTelephonyClient *)v3;

    +[TSUserInPurchaseFlowAssertion sharedInstance](TSUserInPurchaseFlowAssertion, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertUserInPurchaseFlowStartOver:caller:", 0, v2);

  }
  return v2;
}

- (TSWebsheetSignupFlow)initWithRequestType:(unint64_t)a3 skipIntroPaneForWebsheetFlow:(BOOL)a4 websheetURL:(id)a5 postdata:(id)a6
{
  id v11;
  id v12;
  TSWebsheetSignupFlow *v13;
  NSObject *v14;
  CTPlan *plan;
  NSString *iccid;
  int v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v11 = a5;
  v12 = a6;
  v13 = -[TSWebsheetSignupFlow init](self, "init");
  if (v13)
  {
    _TSLogDomain();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315650;
      v19 = objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
      v20 = 2112;
      v21 = v12;
      v22 = 2080;
      v23 = "-[TSWebsheetSignupFlow initWithRequestType:skipIntroPaneForWebsheetFlow:websheetURL:postdata:]";
      _os_log_impl(&dword_21B647000, v14, OS_LOG_TYPE_DEFAULT, "websheet: [%s] %@ @%s", (uint8_t *)&v18, 0x20u);
    }

    plan = v13->_plan;
    v13->_plan = 0;

    iccid = v13->_iccid;
    v13->_iccid = 0;

    objc_storeStrong((id *)&v13->_websheetURL, a5);
    objc_storeStrong((id *)&v13->_postdata, a6);
    v13->_requestType = a3;
    v13->_skipIntroPaneForWebsheetFlow = a4;
  }

  return v13;
}

- (TSWebsheetSignupFlow)initWithPlan:(id)a3
{
  id v5;
  TSWebsheetSignupFlow *v6;
  NSObject *v7;
  NSString *iccid;
  NSString *websheetURL;
  int v11;
  id v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = -[TSWebsheetSignupFlow init](self, "init");
  if (v6)
  {
    _TSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412546;
      v12 = v5;
      v13 = 2080;
      v14 = "-[TSWebsheetSignupFlow initWithPlan:]";
      _os_log_impl(&dword_21B647000, v7, OS_LOG_TYPE_DEFAULT, "Websheet flow: %@ @%s", (uint8_t *)&v11, 0x16u);
    }

    objc_storeStrong((id *)&v6->_plan, a3);
    iccid = v6->_iccid;
    v6->_iccid = 0;

    websheetURL = v6->_websheetURL;
    v6->_websheetURL = 0;

    v6->_skipIntroPaneForWebsheetFlow = 1;
  }

  return v6;
}

- (TSWebsheetSignupFlow)initWithIccid:(id)a3
{
  id v5;
  TSWebsheetSignupFlow *v6;
  NSObject *v7;
  CTPlan *plan;
  NSString *websheetURL;
  int v11;
  id v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = -[TSWebsheetSignupFlow init](self, "init");
  if (v6)
  {
    _TSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412546;
      v12 = v5;
      v13 = 2080;
      v14 = "-[TSWebsheetSignupFlow initWithIccid:]";
      _os_log_impl(&dword_21B647000, v7, OS_LOG_TYPE_DEFAULT, "Websheet flow: ICCID %@ @%s", (uint8_t *)&v11, 0x16u);
    }

    plan = v6->_plan;
    v6->_plan = 0;

    objc_storeStrong((id *)&v6->_iccid, a3);
    websheetURL = v6->_websheetURL;
    v6->_websheetURL = 0;

    v6->_skipIntroPaneForWebsheetFlow = 1;
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
  v4.super_class = (Class)TSWebsheetSignupFlow;
  -[TSWebsheetSignupFlow dealloc](&v4, sel_dealloc);
}

- (id)firstViewController
{
  TSAddCellularPlanViewController *v3;

  if (self->_skipIntroPaneForWebsheetFlow)
  {
    -[TSWebsheetSignupFlow getWebsheetViewController](self, "getWebsheetViewController");
    v3 = (TSAddCellularPlanViewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = -[TSAddCellularPlanViewController initWithType:allowDismiss:]([TSAddCellularPlanViewController alloc], "initWithType:allowDismiss:", 2, 1);
    -[TSAddCellularPlanViewController setDelegate:](v3, "setDelegate:", self);
  }
  -[TSSIMSetupFlow setTopViewController:](self, "setTopViewController:", v3);
  return v3;
}

- (void)firstViewController:(id)a3
{
  id v5;
  id v6;

  if (a3)
  {
    v5 = a3;
    -[TSWebsheetSignupFlow firstViewController](self, "firstViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a3 + 2))(v5, v6);

  }
}

- (id)nextViewControllerFrom:(id)a3
{
  id v4;
  char isKindOfClass;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0;
  v6 = -[TSWebsheetViewController initForRemotePlan:carrierName:skipUIDismissal:]([TSWebsheetViewController alloc], "initForRemotePlan:carrierName:skipUIDismissal:", 0, 0, 0);
  objc_msgSend(v6, "setCallbackDelegate:", self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__TSWebsheetSignupFlow_nextViewControllerFrom___block_invoke;
  v9[3] = &unk_24DEF3F30;
  v7 = v6;
  v10 = v7;
  -[TSWebsheetSignupFlow _createURLRequest:](self, "_createURLRequest:", v9);

  return v7;
}

void __47__TSWebsheetSignupFlow_nextViewControllerFrom___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__TSWebsheetSignupFlow_nextViewControllerFrom___block_invoke_2;
  v5[3] = &unk_24DEF2A48;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

uint64_t __47__TSWebsheetSignupFlow_nextViewControllerFrom___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendRequest:", *(_QWORD *)(a1 + 40));
}

- (id)getWebsheetViewController
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = -[TSWebsheetViewController initForRemotePlan:carrierName:skipUIDismissal:]([TSWebsheetViewController alloc], "initForRemotePlan:carrierName:skipUIDismissal:", 0, 0, 0);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setCallbackDelegate:", self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__TSWebsheetSignupFlow_getWebsheetViewController__block_invoke;
  v6[3] = &unk_24DEF3F30;
  v4 = v3;
  v7 = v4;
  -[TSWebsheetSignupFlow _createURLRequest:](self, "_createURLRequest:", v6);

  return v4;
}

void __49__TSWebsheetSignupFlow_getWebsheetViewController__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__TSWebsheetSignupFlow_getWebsheetViewController__block_invoke_2;
  v5[3] = &unk_24DEF2A48;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

uint64_t __49__TSWebsheetSignupFlow_getWebsheetViewController__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendRequest:", *(_QWORD *)(a1 + 40));
}

- (void)viewControllerDidComplete:(id)a3
{
  id v4;
  objc_super v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "dismissCause") == 1)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __50__TSWebsheetSignupFlow_viewControllerDidComplete___block_invoke;
    v6[3] = &unk_24DEF2A48;
    v6[4] = self;
    v7 = v4;
    -[TSWebsheetSignupFlow _showFailureAlert:completion:](self, "_showFailureAlert:completion:", v7, v6);

  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TSWebsheetSignupFlow;
    -[TSSIMSetupFlow viewControllerDidComplete:](&v5, sel_viewControllerDidComplete_, v4);
  }

}

void __50__TSWebsheetSignupFlow_viewControllerDidComplete___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v2, "navigationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "navigateToNextPaneFrom:navigationController:", v2, v3);

}

- (void)didPurchasePlanSuccessfullyWithEid:(id)a3 imei:(id)a4 meid:(id)a5 iccid:(id)a6 alternateSDMP:(id)a7 state:(id)a8
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v11 = a8;
  v12 = a7;
  v13 = a6;
  v14 = a3;
  +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "didPurchasePlanForEid:iccid:smdpURL:state:", v14, v13, v12, v11);

}

- (void)didPurchasePlanSuccessfullyWithCarrier:(id)a3 mnc:(id)a4 gid1:(id)a5 gid2:(id)a6 state:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "didPurchasePlanForCarrier:mnc:gid1:gid2:state:", v15, v14, v13, v12, v11);

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
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]not supported @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)accountPendingRelease
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]not supported @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_createURLRequest:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  unint64_t requestType;
  void *v7;
  void *v8;
  CTPlan *plan;
  CoreTelephonyClient *client;
  void *v11;
  NSString *iccid;
  CoreTelephonyClient *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (self->_websheetURL)
  {
    requestType = self->_requestType;
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[TSURLRequestFactory requestWithType:URL:postdata:](TSURLRequestFactory, "requestWithType:URL:postdata:", requestType, v7, self->_postdata);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v8);

    goto LABEL_8;
  }
  plan = self->_plan;
  if (plan)
  {
    client = self->_client;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __42__TSWebsheetSignupFlow__createURLRequest___block_invoke;
    v24[3] = &unk_24DEF3F58;
    v24[4] = self;
    v25 = v4;
    -[CoreTelephonyClient websheetInfoForPlan:completion:](client, "websheetInfoForPlan:completion:", plan, v24);
    v11 = v25;
LABEL_7:

    goto LABEL_8;
  }
  iccid = self->_iccid;
  if (iccid)
  {
    v13 = self->_client;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __42__TSWebsheetSignupFlow__createURLRequest___block_invoke_2;
    v22[3] = &unk_24DEF3F58;
    v22[4] = self;
    v23 = v4;
    -[CoreTelephonyClient websheetInfoForIccid:completion:](v13, "websheetInfoForIccid:completion:", iccid, v22);
    v11 = v23;
    goto LABEL_7;
  }
  _TSLogDomain();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[TSWebsheetSignupFlow _createURLRequest:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

  v5[2](v5, 0);
LABEL_8:

}

void __42__TSWebsheetSignupFlow__createURLRequest___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v9 = a3;
  v10 = *(_QWORD *)(a1 + 40);
  if (a5)
  {
    (*(void (**)(_QWORD, _QWORD))(v10 + 16))(*(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    v11 = objc_msgSend(*(id *)(a1 + 32), "_translateRequestType:", a4);
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[TSURLRequestFactory requestWithType:URL:postdata:](TSURLRequestFactory, "requestWithType:URL:postdata:", v11, v12, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v13);

  }
}

void __42__TSWebsheetSignupFlow__createURLRequest___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v9 = a3;
  v10 = *(_QWORD *)(a1 + 40);
  if (a5)
  {
    (*(void (**)(_QWORD, _QWORD))(v10 + 16))(*(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    v11 = objc_msgSend(*(id *)(a1 + 32), "_translateRequestType:", a4);
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[TSURLRequestFactory requestWithType:URL:postdata:](TSURLRequestFactory, "requestWithType:URL:postdata:", v11, v12, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v13);

  }
}

- (void)_showFailureAlert:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Connection Failed"), &stru_24DEF4290, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("The connection to the server was lost.  Please try again later."), &stru_24DEF4290, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ERROR_OK"), &stru_24DEF4290, CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __53__TSWebsheetSignupFlow__showFailureAlert_completion___block_invoke;
  v27[3] = &unk_24DEF2C08;
  v15 = v6;
  v28 = v15;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 0, v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v16);

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v8, v10, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = v11;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v24;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(v17, "addAction:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v22++), (_QWORD)v23);
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v20);
  }

  objc_msgSend(v5, "presentViewController:animated:completion:", v17, 1, 0);
}

uint64_t __53__TSWebsheetSignupFlow__showFailureAlert_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)_translateRequestType:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("buddyml")) & 1) != 0)
    v4 = 5;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("websheet"));

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postdata, 0);
  objc_storeStrong((id *)&self->_websheetURL, 0);
  objc_storeStrong((id *)&self->_iccid, 0);
  objc_storeStrong((id *)&self->_plan, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)_createURLRequest:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Missing required parameters @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
