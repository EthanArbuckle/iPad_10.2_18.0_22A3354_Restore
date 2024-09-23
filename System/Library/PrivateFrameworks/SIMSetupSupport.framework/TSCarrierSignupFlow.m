@implementation TSCarrierSignupFlow

- (TSCarrierSignupFlow)initWithPlan:(id)a3 queriableFirstViewController:(BOOL)a4 hostViewController:(id)a5
{
  id v9;
  id v10;
  TSCarrierSignupFlow *v11;
  void *v12;
  uint64_t v13;
  CoreTelephonyClient *client;
  NSDictionary *postdata;
  TSCarrierSignupFlow *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  objc_super v33;

  v9 = a3;
  v10 = a5;
  if (!+[TSUtilities isPad](TSUtilities, "isPad"))
  {
    _TSLogDomain();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[TSCarrierSignupFlow initWithPlan:queriableFirstViewController:hostViewController:].cold.2(v17, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_10;
  }
  if (!v9)
  {
    _TSLogDomain();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[TSCarrierSignupFlow initWithPlan:queriableFirstViewController:hostViewController:].cold.1(v17, v25, v26, v27, v28, v29, v30, v31);
LABEL_10:

    v16 = 0;
    goto LABEL_11;
  }
  v33.receiver = self;
  v33.super_class = (Class)TSCarrierSignupFlow;
  v11 = -[TSSIMSetupFlow init](&v33, sel_init);
  if (v11)
  {
    +[TSUserInPurchaseFlowAssertion sharedInstance](TSUserInPurchaseFlowAssertion, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "assertUserInPurchaseFlowStartOver:caller:", 0, v11);

    objc_storeStrong((id *)&v11->_hostViewController, a5);
    v11->_isQueriableFirstViewController = a4;
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDC2810]), "initWithQueue:", 0);
    client = v11->_client;
    v11->_client = (CoreTelephonyClient *)v13;

    objc_storeStrong((id *)&v11->_plan, a3);
    postdata = v11->_postdata;
    v11->_postdata = 0;

  }
  self = v11;
  v16 = self;
LABEL_11:

  return v16;
}

- (TSCarrierSignupFlow)initWithPlan:(id)a3
{
  id v5;
  TSCarrierSignupFlow *v6;
  void *v7;
  uint64_t v8;
  CoreTelephonyClient *client;
  NSDictionary *postdata;
  void *v11;
  uint64_t v12;
  TSSIMSetupFlow *subFlow;
  TSCarrierSignupFlow *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v31;
  _QWORD v32[3];
  _QWORD v33[4];

  v33[3] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!+[TSUtilities isPad](TSUtilities, "isPad"))
  {
    _TSLogDomain();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[TSCarrierSignupFlow initWithPlan:].cold.2(v15, v16, v17, v18, v19, v20, v21, v22);
    goto LABEL_10;
  }
  if (!v5)
  {
    _TSLogDomain();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[TSCarrierSignupFlow initWithPlan:].cold.1(v15, v23, v24, v25, v26, v27, v28, v29);
LABEL_10:

    v14 = 0;
    goto LABEL_11;
  }
  v31.receiver = self;
  v31.super_class = (Class)TSCarrierSignupFlow;
  v6 = -[TSSIMSetupFlow init](&v31, sel_init);
  if (v6)
  {
    +[TSUserInPurchaseFlowAssertion sharedInstance](TSUserInPurchaseFlowAssertion, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assertUserInPurchaseFlowStartOver:caller:", 0, v6);

    v6->_isQueriableFirstViewController = 0;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDC2810]), "initWithQueue:", 0);
    client = v6->_client;
    v6->_client = (CoreTelephonyClient *)v8;

    objc_storeStrong((id *)&v6->_plan, a3);
    postdata = v6->_postdata;
    v6->_postdata = 0;

    v32[0] = CFSTR("FlowTypeKey");
    v32[1] = CFSTR("SkipActivatingPane");
    v33[0] = &unk_24DF234D0;
    v33[1] = MEMORY[0x24BDBD1C0];
    v32[2] = CFSTR("DelayStartActivatingTimer");
    v33[2] = &unk_24DF234E8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[TSSIMSetupFlow flowWithOptions:](TSSIMSetupFlow, "flowWithOptions:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    subFlow = v6->_subFlow;
    v6->_subFlow = (TSSIMSetupFlow *)v12;

  }
  self = v6;
  v14 = self;
LABEL_11:

  return v14;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[TSUserInPurchaseFlowAssertion sharedInstance](TSUserInPurchaseFlowAssertion, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deassertUserInPurchaseFlowWithForce:caller:", 0, self);

  v4.receiver = self;
  v4.super_class = (Class)TSCarrierSignupFlow;
  -[TSCarrierSignupFlow dealloc](&v4, sel_dealloc);
}

- (void)showFirstViewControllerWithHostController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  CoreTelephonyClient *client;
  CTPlan *plan;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  TSCarrierSignupFlow *v20;
  id v21;
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_initWeak(&location, self);
    client = self->_client;
    plan = self->_plan;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke;
    v18[3] = &unk_24DEF2DD8;
    objc_copyWeak(&v22, &location);
    v21 = v7;
    v19 = v6;
    v20 = self;
    -[CoreTelephonyClient websheetInfoForPlan:completion:](client, "websheetInfoForPlan:completion:", plan, v18);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    _TSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[TSCarrierSignupFlow showFirstViewControllerWithHostController:completion:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id *WeakRetained;
  id *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  TSBuddyMLController *v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  _QWORD block[4];
  id v40;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v14 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_handleCarrierInfoWithUrl:postdata:type:error:", v9, v10, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_storeStrong(v14 + 13, a3);
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("buddyml")))
      {
        if (objc_msgSend(*(id *)(a1 + 32), "isInModalPresentation"))
        {
          objc_msgSend(*(id *)(a1 + 32), "navigationController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithNibName:bundle:", 0, 0);
          objc_msgSend(v16, "setModalInPresentation:", 1);
          objc_msgSend(v16, "setModalPresentationStyle:", 2);
        }
        v23 = -[TSBuddyMLController initWithHostController:]([TSBuddyMLController alloc], "initWithHostController:", v16);
        v24 = v14[14];
        v14[14] = v23;

        objc_msgSend(v14[14], "setDelegate:", v14);
        v25 = v14[14];
        v35[0] = MEMORY[0x24BDAC760];
        v35[1] = 3221225472;
        v35[2] = __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke_3;
        v35[3] = &unk_24DEF2D38;
        v35[4] = v14;
        v36 = *(id *)(a1 + 32);
        v26 = *(id *)(a1 + 48);
        v37 = v16;
        v38 = v26;
        v21 = v16;
        objc_msgSend(v25, "loadRequest:completion:", v15, v35);

        v22 = v36;
        goto LABEL_12;
      }
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("Lite")))
      {
        v18 = *(void **)(a1 + 40);
        objc_msgSend(v15, "URL");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_getSFSafariViewControllerWithURL:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v31[0] = MEMORY[0x24BDAC760];
        v31[1] = 3221225472;
        v31[2] = __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke_5;
        v31[3] = &unk_24DEF2D60;
        v34 = *(id *)(a1 + 48);
        v32 = *(id *)(a1 + 32);
        v33 = v20;
        v21 = v20;
        dispatch_async(MEMORY[0x24BDAC9B8], v31);

        v22 = v34;
LABEL_12:

LABEL_15:
        goto LABEL_16;
      }
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke_6;
      v27[3] = &unk_24DEF2DB0;
      v27[4] = v14;
      v28 = v15;
      v29 = *(id *)(a1 + 32);
      v30 = *(id *)(a1 + 48);
      dispatch_async(MEMORY[0x24BDAC9B8], v27);

      v17 = v28;
    }
    else
    {
      objc_msgSend(v14, "showLoadFailureAlert:error:", *(_QWORD *)(a1 + 32), v12);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke_2;
      block[3] = &unk_24DEF2CE8;
      v40 = *(id *)(a1 + 48);
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      v17 = v40;
    }

    goto LABEL_15;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_16:

}

uint64_t __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke_3(id *a1, char a2)
{
  id v3;
  id v4;
  void (*v5)(void);
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  if ((a2 & 1) != 0)
  {
    v3 = a1[6];
    objc_msgSend(a1[5], "navigationController");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (v3 != v4)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke_4;
      block[3] = &unk_24DEF2D10;
      v7 = a1[6];
      v8 = a1[5];
      v9 = a1[7];
      dispatch_async(MEMORY[0x24BDAC9B8], block);

      return;
    }
    v5 = (void (*)(void))*((_QWORD *)a1[7] + 2);
  }
  else
  {
    objc_msgSend(a1[4], "showLoadFailureAlert:error:", a1[5], 0);
    v5 = (void (*)(void))*((_QWORD *)a1[7] + 2);
  }
  v5();
}

uint64_t __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "navigationBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), 1, 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  id v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (objc_msgSend(*(id *)(a1 + 32), "isInModalPresentation"))
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNavigationBarHidden:animated:", 1, 0);

    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pushViewController:animated:", *(_QWORD *)(a1 + 40), 1);
  }
  else
  {
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v3, "setModalPresentationStyle:", 2);
    objc_msgSend(v3, "setNavigationBarHidden:animated:", 1, 0);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v3, 1, 0);
  }

}

void __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke_6(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;

  v2 = -[TSWebsheetViewController initForRemotePlan:carrierName:skipUIDismissal:]([TSWebsheetViewController alloc], "initForRemotePlan:carrierName:skipUIDismissal:", 0, 0, 1);
  objc_msgSend(v2, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "setCallbackDelegate:", *(_QWORD *)(a1 + 32));
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke_7;
  v6[3] = &unk_24DEF2D38;
  v3 = *(_QWORD *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 56);
  v8 = v2;
  v9 = v4;
  v5 = v2;
  objc_msgSend(v5, "loadRequest:completion:", v3, v6);

}

void __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke_7(uint64_t a1, char a2)
{
  _QWORD block[5];
  id v4;
  id v5;

  if ((a2 & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke_8;
    block[3] = &unk_24DEF2D88;
    block[4] = *(_QWORD *)(a1 + 32);
    v4 = *(id *)(a1 + 48);
    v5 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "showLoadFailureAlert:error:", *(_QWORD *)(a1 + 40), 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke_8(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setTopViewController:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 48), "isInModalPresentation"))
  {
    objc_msgSend(*(id *)(a1 + 48), "navigationController");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "pushViewController:animated:", *(_QWORD *)(a1 + 40), 1);
  }
  else
  {
    v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v2, "setModalPresentationStyle:", 2);
    objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v2, 1, 0);
  }

}

- (id)nextViewControllerFrom:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  TSSubFlowViewController *v9;
  TSSubFlowViewController *v10;
  TSSIMSetupFlow *subFlow;
  void *v12;
  void *v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "dismissCause") == 3)
    {
      v10 = [TSSubFlowViewController alloc];
      subFlow = self->_subFlow;
      -[TSSIMSetupFlow navigationController](self, "navigationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[TSSubFlowViewController initWithFlow:navigationController:](v10, "initWithFlow:navigationController:", subFlow, v12);

      goto LABEL_12;
    }
LABEL_9:
    v9 = 0;
    goto LABEL_12;
  }
  -[TSBuddyMLController url](self->_buddyMLController, "url");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[TSSIMSetupFlow showLoadFailureAlert:error:](self, "showLoadFailureAlert:error:", v4, 0);
    goto LABEL_9;
  }
  v6 = (void *)v5;
  -[TSBuddyMLController type](self->_buddyMLController, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Lite"));

  if (v8)
  {
    -[TSCarrierSignupFlow _getSFSafariViewControllerWithURL:](self, "_getSFSafariViewControllerWithURL:", v6);
    v9 = (TSSubFlowViewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = -[TSWebsheetViewController initForRemotePlan:carrierName:skipUIDismissal:]([TSWebsheetViewController alloc], "initForRemotePlan:carrierName:skipUIDismissal:", 0, 0, 1);
    -[TSSubFlowViewController setDelegate:](v9, "setDelegate:", self);
    -[TSSubFlowViewController setCallbackDelegate:](v9, "setCallbackDelegate:", self);
    +[TSURLRequestFactory requestWithType:URL:postdata:](TSURLRequestFactory, "requestWithType:URL:postdata:", 1, v6, self->_postdata);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSSubFlowViewController loadRequest:completion:](v9, "loadRequest:completion:", v13, 0);

  }
LABEL_12:

  return v9;
}

- (void)viewControllerDidComplete:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  objc_super v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
  v5 = v4;
  v6 = objc_msgSend(v5, "dismissCause");
  if (!v6)
  {
    if (!self->_buddyMLController && !self->_isQueriableFirstViewController)
      -[TSSIMSetupFlow userDidTapCancel](self, "userDidTapCancel");
    goto LABEL_8;
  }
  if (v6 != 1)
  {

LABEL_10:
    v7.receiver = self;
    v7.super_class = (Class)TSCarrierSignupFlow;
    -[TSSIMSetupFlow viewControllerDidComplete:](&v7, sel_viewControllerDidComplete_, v4);
    goto LABEL_11;
  }
  -[TSSIMSetupFlow showLoadFailureAlert:error:](self, "showLoadFailureAlert:error:", v5, 0);
LABEL_8:

LABEL_11:
}

- (void)startTimer:(int64_t)a3
{
  NSObject *v5;
  TSSIMSetupFlow *subFlow;
  int v7;
  TSSIMSetupFlow *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    subFlow = self->_subFlow;
    v7 = 138412546;
    v8 = subFlow;
    v9 = 2080;
    v10 = "-[TSCarrierSignupFlow startTimer:]";
    _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "start timer on subflow %@ @%s", (uint8_t *)&v7, 0x16u);
  }

  -[TSSIMSetupFlow startTimer:](self->_subFlow, "startTimer:", a3);
}

- (void)didPurchasePlanSuccessfullyWithEid:(id)a3 imei:(id)a4 meid:(id)a5 iccid:(id)a6 alternateSDMP:(id)a7 state:(id)a8
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v11 = a8;
  v12 = a7;
  v13 = a6;
  +[TSUtilities getByteRepresentationOf:](TSUtilities, "getByteRepresentationOf:", a3);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "didPurchasePlanForCsn:iccid:profileServer:state:", v15, v13, v12, v11);

}

- (void)didPurchasePlanSuccessfullyWithCarrier:(id)a3 mnc:(id)a4 gid1:(id)a5 gid2:(id)a6 state:(id)a7
{
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v11 = (void *)MEMORY[0x24BE15900];
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v11, "sharedManager");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "didPurchasePlanForCarrier:mnc:gid1:gid2:state:", v16, v15, v14, v13, v12);

}

- (void)safariViewControllerDidFinish:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__TSCarrierSignupFlow_safariViewControllerDidFinish___block_invoke;
  v6[3] = &unk_24DEF2A48;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __53__TSCarrierSignupFlow_safariViewControllerDidFinish___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[TSCarrierSignupFlow safariViewControllerDidFinish:]_block_invoke";
    _os_log_impl(&dword_21B647000, v2, OS_LOG_TYPE_DEFAULT, "safariViewController did finish @%s", (uint8_t *)&v5, 0xCu);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "userDidExitWebsheetFlowForPlan:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
  return objc_msgSend(*(id *)(a1 + 32), "viewControllerDidComplete:", *(_QWORD *)(a1 + 40));
}

- (id)_handleCarrierInfoWithUrl:(id)a3 postdata:(id)a4 type:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    _TSLogDomain();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[TSCarrierSignupFlow _handleCarrierInfoWithUrl:postdata:type:error:].cold.4((uint64_t)self, (uint64_t)v13, v14);
LABEL_12:

    v23 = 0;
    goto LABEL_13;
  }
  if (!v10 || !objc_msgSend(v10, "length"))
  {
    _TSLogDomain();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[TSCarrierSignupFlow _handleCarrierInfoWithUrl:postdata:type:error:].cold.1((uint64_t)self, v14, v17, v18, v19, v20, v21, v22);
    goto LABEL_12;
  }
  if (v11 && objc_msgSend(v11, "count"))
  {
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("websheet")))
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 1;
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("buddyml")))
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 5;
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("entitlements")))
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 2;
    }
    else
    {
      if (!objc_msgSend(v12, "isEqualToString:", CFSTR("Lite")))
      {
        _TSLogDomain();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[TSCarrierSignupFlow _handleCarrierInfoWithUrl:postdata:type:error:].cold.3((uint64_t)v12, (uint64_t)self, v14);
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 6;
    }
    +[TSURLRequestFactory requestWithType:URL:postdata:](TSURLRequestFactory, "requestWithType:URL:postdata:", v16, v15, v11);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  _TSLogDomain();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    -[TSCarrierSignupFlow _handleCarrierInfoWithUrl:postdata:type:error:].cold.2((uint64_t)v10, v25, v26, v27, v28, v29, v30, v31);

  v32 = (void *)MEMORY[0x24BDD16B0];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "requestWithURL:", v33);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "_setNonAppInitiated:", 1);
LABEL_13:

  return v23;
}

- (id)_getSFSafariViewControllerWithURL:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x24BDE81B0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setEntersReaderIfAvailable:", 0);
  objc_msgSend(v6, "_setEphemeral:", 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "set_isBeingUsedForCellularServiceBootstrap:", 1);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE81A8]), "initWithURL:configuration:", v5, v6);

  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "_setShowingLinkPreview:", 0);
  objc_msgSend(v7, "_setShowingLinkPreviewWithMinimalUI:", 0);
  objc_msgSend(v7, "setDismissButtonStyle:", 0);

  return v7;
}

- (TSSIMSetupFlow)subFlow
{
  return (TSSIMSetupFlow *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSubFlow:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subFlow, 0);
  objc_storeStrong((id *)&self->_hostViewController, 0);
  objc_storeStrong((id *)&self->_signUpViewController, 0);
  objc_storeStrong((id *)&self->_buddyMLController, 0);
  objc_storeStrong((id *)&self->_postdata, 0);
  objc_storeStrong((id *)&self->_plan, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)initWithPlan:(uint64_t)a3 queriableFirstViewController:(uint64_t)a4 hostViewController:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Missing plan @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithPlan:(uint64_t)a3 queriableFirstViewController:(uint64_t)a4 hostViewController:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_21B647000, a1, a3, "[F]WARNING: Creating flow for unsupported hardware - unexpected behaviour will be seen @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithPlan:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Missing plan @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithPlan:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_21B647000, a1, a3, "[F]WARNING: Creating flow for unsupported hardware - unexpected behaviour will be seen @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)showFirstViewControllerWithHostController:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Missing host controller @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_handleCarrierInfoWithUrl:(uint64_t)a3 postdata:(uint64_t)a4 type:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21B647000, a2, a3, "[E]Missing URL for signup info: %@ @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_handleCarrierInfoWithUrl:(uint64_t)a3 postdata:(uint64_t)a4 type:(uint64_t)a5 error:(uint64_t)a6 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21B647000, a2, a3, "[E]No postdata for: %@ @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_handleCarrierInfoWithUrl:(NSObject *)a3 postdata:type:error:.cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412802;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *(_QWORD *)(a2 + 96);
  *(_WORD *)&v3[22] = 2080;
  OUTLINED_FUNCTION_2_1(&dword_21B647000, a2, a3, "[E]invalid request type: %@ for %@ @%s", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], "-[TSCarrierSignupFlow _handleCarrierInfoWithUrl:postdata:type:error:]");
}

- (void)_handleCarrierInfoWithUrl:(NSObject *)a3 postdata:type:error:.cold.4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412802;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 96);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  *(_WORD *)&v3[22] = 2080;
  OUTLINED_FUNCTION_2_1(&dword_21B647000, a2, a3, "[E]Signup info for: %@ failed: %@ @%s", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], "-[TSCarrierSignupFlow _handleCarrierInfoWithUrl:postdata:type:error:]");
}

@end
