@implementation VUIActionActivateCarrierOffer

- (VUIActionActivateCarrierOffer)initWithContextData:(id)a3
{
  id v4;
  VUIActionActivateCarrierOffer *v5;
  NSObject *v6;
  uint64_t v7;
  NSString *linkParams;
  uint64_t v9;
  NSString *productCode;
  uint64_t v11;
  NSDictionary *additionalParams;
  uint64_t v13;
  NSString *notificationTitle;
  uint64_t v15;
  NSString *notificationBody;
  uint8_t v18[16];
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VUIActionActivateCarrierOffer;
  v5 = -[VUIActionActivateCarrierOffer init](&v19, sel_init);
  if (v5)
  {
    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - create", v18, 2u);
    }

    objc_msgSend(v4, "vui_stringForKey:", CFSTR("linkParams"));
    v7 = objc_claimAutoreleasedReturnValue();
    linkParams = v5->_linkParams;
    v5->_linkParams = (NSString *)v7;

    objc_msgSend(v4, "vui_stringForKey:", CFSTR("productCode"));
    v9 = objc_claimAutoreleasedReturnValue();
    productCode = v5->_productCode;
    v5->_productCode = (NSString *)v9;

    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("additionalParams"));
    v11 = objc_claimAutoreleasedReturnValue();
    additionalParams = v5->_additionalParams;
    v5->_additionalParams = (NSDictionary *)v11;

    objc_msgSend(v4, "vui_stringForKey:", CFSTR("notificationTitle"));
    v13 = objc_claimAutoreleasedReturnValue();
    notificationTitle = v5->_notificationTitle;
    v5->_notificationTitle = (NSString *)v13;

    objc_msgSend(v4, "vui_stringForKey:", CFSTR("notificationBody"));
    v15 = objc_claimAutoreleasedReturnValue();
    notificationBody = v5->_notificationBody;
    v5->_notificationBody = (NSString *)v15;

  }
  return v5;
}

- (BOOL)isAccountRequired
{
  return 1;
}

- (void)_activateOfferWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - activating offer...", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_activeiTunesAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CFDA38], "createBagForSubProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDA38]), "initWithAccount:bag:linkParams:productCode:", v7, v8, self->_linkParams, self->_productCode);
  objc_msgSend(v9, "setAdditionalLinkingParameters:", self->_additionalParams);
  objc_msgSend(v9, "setDelegate:", self);
  objc_msgSend(v9, "perform");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__VUIActionActivateCarrierOffer__activateOfferWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E9F9C560;
  v13 = v4;
  v11 = v4;
  objc_msgSend(v10, "addFinishBlock:", v12);

}

void __69__VUIActionActivateCarrierOffer__activateOfferWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(void);
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __69__VUIActionActivateCarrierOffer__activateOfferWithCompletionHandler___block_invoke_cold_1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

    v15 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v5;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - Registered for hard bundle offers, result: %@", (uint8_t *)&v16, 0xCu);
    }

    v15 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v15();

}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v5 = a4;
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - performing action...", buf, 2u);
  }

  -[VUIActionActivateCarrierOffer _configurePreflightManager](self, "_configurePreflightManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__VUIActionActivateCarrierOffer_performWithTargetResponder_completionHandler___block_invoke;
  v9[3] = &unk_1E9F9C5D8;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "preflightWithOptions:completion:", 1, v9);

}

void __78__VUIActionActivateCarrierOffer_performWithTargetResponder_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "_notifyDidStartActivation");
  if ((a2 & 1) != 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __78__VUIActionActivateCarrierOffer_performWithTargetResponder_completionHandler___block_invoke_16;
    v8[3] = &unk_1E9F9C5B0;
    v4 = *(void **)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v5;
    objc_msgSend(v4, "_activateOfferWithCompletionHandler:", v8);
    v6 = v9;
  }
  else
  {
    VUIDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - Activation are restricted", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRANSACTION_RESTRICTED_CONTENT"), 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_notifyDidEndActivationWithError:", v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __78__VUIActionActivateCarrierOffer_performWithTargetResponder_completionHandler___block_invoke_16(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint8_t v16[8];
  _QWORD block[2];
  void (*v18)(uint64_t);
  void *v19;
  uint64_t v20;
  id v21;
  id v22;

  v5 = a3;
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __78__VUIActionActivateCarrierOffer_performWithTargetResponder_completionHandler___block_invoke_16_cold_1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    v18 = __78__VUIActionActivateCarrierOffer_performWithTargetResponder_completionHandler___block_invoke_17;
    v19 = &unk_1E9F9C588;
    v14 = *(id *)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 32);
    v22 = v14;
    v20 = v15;
    v21 = v5;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v18((uint64_t)block);
    else
      dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - Activation successful", v16, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_handleActivationSuccessWithCompletionHandler:", *(_QWORD *)(a1 + 40));
  }

}

void __78__VUIActionActivateCarrierOffer_performWithTargetResponder_completionHandler___block_invoke_17(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__VUIActionActivateCarrierOffer_performWithTargetResponder_completionHandler___block_invoke_2;
  v5[3] = &unk_1E9F9C588;
  v2 = *(id *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v7 = v2;
  v5[4] = v3;
  v6 = v4;
  +[VUIApplicationRouter dismissOrPopViewControllerWithId:completion:](VUIApplicationRouter, "dismissOrPopViewControllerWithId:completion:", CFSTR("CommerceViewControllerIdentifier"), v5);

}

uint64_t __78__VUIActionActivateCarrierOffer_performWithTargetResponder_completionHandler___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(result + 48))
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 32), "_notifyDidEndActivationWithError:", *(_QWORD *)(result + 40));
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 48) + 16))();
  }
  return result;
}

- (void)_handleActivationSuccessWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, void *);
  void *v11;
  VUIActionActivateCarrierOffer *v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC8788], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __79__VUIActionActivateCarrierOffer__handleActivationSuccessWithCompletionHandler___block_invoke;
  v11 = &unk_1E9F9C600;
  v12 = self;
  v13 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchConfigurationWithOptions:cachePolicy:queryParameters:completion:", 0, 3, 0, &v8);

  objc_msgSend(MEMORY[0x1E0DC8858], "sharedInstance", v8, v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchSubscriptionData:completion:", 1, &__block_literal_global_48);

}

void __79__VUIActionActivateCarrierOffer__handleActivationSuccessWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[2];
  void (*v8)(uint64_t);
  void *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - UTS Subscription state refreshed. error: %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v8 = __79__VUIActionActivateCarrierOffer__handleActivationSuccessWithCompletionHandler___block_invoke_23;
  v9 = &unk_1E9F99420;
  v6 = *(id *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v7[0], 3221225472))
    v8((uint64_t)v7);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __79__VUIActionActivateCarrierOffer__handleActivationSuccessWithCompletionHandler___block_invoke_23(uint64_t a1)
{
  id v2;
  _QWORD v3[5];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__VUIActionActivateCarrierOffer__handleActivationSuccessWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E9F99420;
  v2 = *(id *)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  +[VUIApplicationRouter dismissOrPopViewControllerWithId:completion:](VUIApplicationRouter, "dismissOrPopViewControllerWithId:completion:", CFSTR("CommerceViewControllerIdentifier"), v3);

}

void __79__VUIActionActivateCarrierOffer__handleActivationSuccessWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_notifyDidEndActivationWithError:", 0);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __79__VUIActionActivateCarrierOffer__handleActivationSuccessWithCompletionHandler___block_invoke_3;
    v3[3] = &unk_1E9F98E68;
    v2 = *(void **)(a1 + 32);
    v4 = *(id *)(a1 + 40);
    objc_msgSend(v2, "_showUIConfirmationForSubTransactionWithCompletion:", v3);

  }
}

uint64_t __79__VUIActionActivateCarrierOffer__handleActivationSuccessWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__VUIActionActivateCarrierOffer__handleActivationSuccessWithCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      LOWORD(v10) = 0;
      v7 = "ActivateCarrierOffer - successfully refreshed subscription store";
      v8 = v5;
      v9 = 2;
LABEL_6:
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
    }
  }
  else if (v6)
  {
    v10 = 138412290;
    v11 = v4;
    v7 = "ActivateCarrierOffer - error refreshing subscriptions from finance: %@";
    v8 = v5;
    v9 = 12;
    goto LABEL_6;
  }

}

- (void)handleEngagementRequest:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - handle engagement request: %@", buf, 0xCu);

  }
  v12 = MEMORY[0x1E0C809B0];
  v13 = __68__VUIActionActivateCarrierOffer_handleEngagementRequest_completion___block_invoke;
  v14 = &unk_1E9F99D58;
  v15 = v5;
  v16 = v6;
  v9 = (void *)MEMORY[0x1E0CB3978];
  v10 = v6;
  v11 = v5;
  if (objc_msgSend(v9, "isMainThread", v12, 3221225472))
    v13((uint64_t)&v12);
  else
    dispatch_async(MEMORY[0x1E0C80D38], &v12);

}

void __68__VUIActionActivateCarrierOffer_handleEngagementRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
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

  objc_msgSend(MEMORY[0x1E0CFD9E8], "vui_defaultBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIApplicationRouter topMostVisibleViewController](VUIApplicationRouter, "topMostVisibleViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDE60]), "initWithRequest:bag:presentingViewController:", *(_QWORD *)(a1 + 32), v2, v3);
    objc_msgSend(v4, "presentEngagement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addFinishBlock:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __68__VUIActionActivateCarrierOffer_handleEngagementRequest_completion___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);

  }
}

- (void)handleAuthenticateRequest:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - handle auth request: %@", buf, 0xCu);

  }
  v12 = MEMORY[0x1E0C809B0];
  v13 = __70__VUIActionActivateCarrierOffer_handleAuthenticateRequest_completion___block_invoke;
  v14 = &unk_1E9F99D58;
  v15 = v5;
  v16 = v6;
  v9 = (void *)MEMORY[0x1E0CB3978];
  v10 = v6;
  v11 = v5;
  if (objc_msgSend(v9, "isMainThread", v12, 3221225472))
    v13((uint64_t)&v12);
  else
    dispatch_async(MEMORY[0x1E0C80D38], &v12);

}

void __70__VUIActionActivateCarrierOffer_handleAuthenticateRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  +[VUIApplicationRouter topMostVisibleViewController](VUIApplicationRouter, "topMostVisibleViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFDDF0]), "initWithRequest:presentingViewController:", *(_QWORD *)(a1 + 32), v2);
    -[NSObject performAuthentication](v3, "performAuthentication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __70__VUIActionActivateCarrierOffer_handleAuthenticateRequest_completion___block_invoke_2;
    v12[3] = &unk_1E9F9B350;
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v4, "addFinishBlock:", v12);

  }
  else
  {
    VUIDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __70__VUIActionActivateCarrierOffer_handleAuthenticateRequest_completion___block_invoke_cold_1(v3, v5, v6, v7, v8, v9, v10, v11);
  }

}

void __70__VUIActionActivateCarrierOffer_handleAuthenticateRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "authenticationResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - finished auth request: %@, %@", (uint8_t *)&v10, 0x16u);

  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

- (void)handleDialogRequest:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - handle dialog request: %@", buf, 0xCu);

  }
  v12 = MEMORY[0x1E0C809B0];
  v13 = __64__VUIActionActivateCarrierOffer_handleDialogRequest_completion___block_invoke;
  v14 = &unk_1E9F99D58;
  v15 = v5;
  v16 = v6;
  v9 = (void *)MEMORY[0x1E0CB3978];
  v10 = v6;
  v11 = v5;
  if (objc_msgSend(v9, "isMainThread", v12, 3221225472))
    v13((uint64_t)&v12);
  else
    dispatch_async(MEMORY[0x1E0C80D38], &v12);

}

void __64__VUIActionActivateCarrierOffer_handleDialogRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;

  +[VUIApplicationRouter topMostVisibleViewController](VUIApplicationRouter, "topMostVisibleViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFDDE0]), "initWithRequest:presentingViewController:", *(_QWORD *)(a1 + 32), v2);
    -[NSObject present](v3, "present");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __64__VUIActionActivateCarrierOffer_handleDialogRequest_completion___block_invoke_2;
    v12[3] = &unk_1E9F9C668;
    v13 = *(id *)(a1 + 32);
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v4, "addFinishBlock:", v12);

  }
  else
  {
    VUIDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __64__VUIActionActivateCarrierOffer_handleDialogRequest_completion___block_invoke_cold_1(v3, v5, v6, v7, v8, v9, v10, v11);
  }

}

void __64__VUIActionActivateCarrierOffer_handleDialogRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "selectedActionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locateActionWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "style");

  VUIDefaultLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 134218498;
    v15 = v10;
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - finished dialog with actionStyle %ld for request: %@, %@", (uint8_t *)&v14, 0x20u);
  }

  if ((unint64_t)(v10 - 1) <= 1)
  {
    VUIDefaultLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - User canceled dialog", (uint8_t *)&v14, 2u);
    }

  }
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v5, v6);

}

- (id)_configurePreflightManager
{
  void *v2;
  void *v3;

  +[VUIPreflightManager defaultPreflightManager](VUIPreflightManager, "defaultPreflightManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIApplicationRouter topPresentedViewController](VUIApplicationRouter, "topPresentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPresentingController:", v3);

  objc_msgSend(v2, "setRestrictionsCheckType:", 2);
  return v2;
}

- (void)_showUIConfirmationForSubTransactionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[2];
  uint64_t (*v14)(_QWORD *);
  void *v15;
  id v16;
  id v17;
  id v18;

  v4 = a3;
  -[VUIActionActivateCarrierOffer notificationTitle](self, "notificationTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  -[VUIActionActivateCarrierOffer notificationBody](self, "notificationBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v14 = __84__VUIActionActivateCarrierOffer__showUIConfirmationForSubTransactionWithCompletion___block_invoke;
  v15 = &unk_1E9F99778;
  v16 = v6;
  v17 = v8;
  v18 = v4;
  v9 = (void *)MEMORY[0x1E0CB3978];
  v10 = v4;
  v11 = v8;
  v12 = v6;
  if (objc_msgSend(v9, "isMainThread"))
    v14(block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __84__VUIActionActivateCarrierOffer__showUIConfirmationForSubTransactionWithCompletion___block_invoke(_QWORD *a1)
{
  return +[VUIActionCommerceTransaction displayConfirmationUIWithTitle:andBody:completion:](VUIActionCommerceTransaction, "displayConfirmationUIWithTitle:andBody:completion:", a1[4], a1[5], a1[6]);
}

- (void)_notifyDidStartActivation
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[VUIActionActivateCarrierOffer linkParams](self, "linkParams");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v2;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - notify start, linkParams: %@", buf, 0xCu);
  }

  +[VUIPurchaser sharedInstance](VUIPurchaser, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rememberPurchasing:", v2);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("TransactionID");
  v8 = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("VUIPurchaseOrSubscribeRequestDidStartNotification"), 0, v6);

}

- (void)_notifyDidEndActivationWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VUIActionActivateCarrierOffer linkParams](self, "linkParams");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIActionActivateCarrierOffer canonicalID](self, "canonicalID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412802;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - notify end, linkParams: %@, canonicalID: %@, error:%@", (uint8_t *)&v11, 0x20u);
  }

  +[VUIPurchaser sharedInstance](VUIPurchaser, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "forgetPurchasing:", v5);
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, CFSTR("TransactionID"));
  if (v4)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, CFSTR("Error"));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("VUISubscribeRequestDidFinishNotification"), 0, v9);

}

- (NSString)linkParams
{
  return self->_linkParams;
}

- (void)setLinkParams:(id)a3
{
  objc_storeStrong((id *)&self->_linkParams, a3);
}

- (NSString)productCode
{
  return self->_productCode;
}

- (void)setProductCode:(id)a3
{
  objc_storeStrong((id *)&self->_productCode, a3);
}

- (NSDictionary)additionalParams
{
  return self->_additionalParams;
}

- (void)setAdditionalParams:(id)a3
{
  objc_storeStrong((id *)&self->_additionalParams, a3);
}

- (NSString)notificationTitle
{
  return self->_notificationTitle;
}

- (void)setNotificationTitle:(id)a3
{
  objc_storeStrong((id *)&self->_notificationTitle, a3);
}

- (NSString)notificationBody
{
  return self->_notificationBody;
}

- (void)setNotificationBody:(id)a3
{
  objc_storeStrong((id *)&self->_notificationBody, a3);
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (void)setCanonicalID:(id)a3
{
  objc_storeStrong((id *)&self->_canonicalID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canonicalID, 0);
  objc_storeStrong((id *)&self->_notificationBody, 0);
  objc_storeStrong((id *)&self->_notificationTitle, 0);
  objc_storeStrong((id *)&self->_additionalParams, 0);
  objc_storeStrong((id *)&self->_productCode, 0);
  objc_storeStrong((id *)&self->_linkParams, 0);
}

void __69__VUIActionActivateCarrierOffer__activateOfferWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, a2, a3, "ActivateCarrierOffer - Error running the hard bundle offer registration. %@", a5, a6, a7, a8, 2u);
}

void __78__VUIActionActivateCarrierOffer_performWithTargetResponder_completionHandler___block_invoke_16_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, a2, a3, "ActivateCarrierOffer - Activation failed: %@", a5, a6, a7, a8, 2u);
}

void __68__VUIActionActivateCarrierOffer_handleEngagementRequest_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "ActivateCarrierOffer - failed to handle engagement request because there is no presenting view controller", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_14();
}

void __70__VUIActionActivateCarrierOffer_handleAuthenticateRequest_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "ActivateCarrierOffer - failed to handle authenticate request because there is no presenting view controller", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_14();
}

void __64__VUIActionActivateCarrierOffer_handleDialogRequest_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "ActivateCarrierOffer - failed to handle dialog request because there is no presenting view controller", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_14();
}

@end
