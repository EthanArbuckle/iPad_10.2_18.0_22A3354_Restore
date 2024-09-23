@implementation VSViewServiceRequestPreparationOperation

- (VSViewServiceRequestPreparationOperation)init
{
  VSViewServiceRequestPreparationOperation *v2;
  NSOperationQueue *v3;
  NSOperationQueue *privateQueue;
  NSArray *supportedIdentityProviderIdentifiers;
  NSArray *v6;
  NSArray *featuredIdentityProviderIdentifiers;
  uint64_t v8;
  NSXPCConnection *privacyServiceConnection;
  NSXPCConnection *v10;
  void *v11;
  uint64_t v12;
  VSIdentityProviderAvailabilityInfoCenter *availabilityInfoCenter;
  VSOptional *v14;
  VSOptional *v15;
  VSOptional *v16;
  VSOptional *currentAccount;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)VSViewServiceRequestPreparationOperation;
  v2 = -[VSViewServiceRequestPreparationOperation init](&v19, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = v3;

    -[NSOperationQueue setName:](v2->_privateQueue, "setName:", CFSTR("VSViewServiceRequestPreparationOperation"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_privateQueue, "setMaxConcurrentOperationCount:", 1);
    supportedIdentityProviderIdentifiers = v2->_supportedIdentityProviderIdentifiers;
    v6 = (NSArray *)MEMORY[0x24BDBD1A8];
    v2->_supportedIdentityProviderIdentifiers = (NSArray *)MEMORY[0x24BDBD1A8];

    featuredIdentityProviderIdentifiers = v2->_featuredIdentityProviderIdentifiers;
    v2->_featuredIdentityProviderIdentifiers = v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.VideoSubscriberAccount.PrivacyService"));
    privacyServiceConnection = v2->_privacyServiceConnection;
    v2->_privacyServiceConnection = (NSXPCConnection *)v8;

    v10 = v2->_privacyServiceConnection;
    VSPrivacyServiceInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v10, "setRemoteObjectInterface:", v11);

    -[NSXPCConnection setInterruptionHandler:](v2->_privacyServiceConnection, "setInterruptionHandler:", &__block_literal_global_4);
    -[NSXPCConnection setInvalidationHandler:](v2->_privacyServiceConnection, "setInvalidationHandler:", &__block_literal_global_6);
    -[NSXPCConnection resume](v2->_privacyServiceConnection, "resume");
    objc_msgSend(MEMORY[0x24BDF8C08], "defaultCenter");
    v12 = objc_claimAutoreleasedReturnValue();
    availabilityInfoCenter = v2->_availabilityInfoCenter;
    v2->_availabilityInfoCenter = (VSIdentityProviderAvailabilityInfoCenter *)v12;

    v14 = (VSOptional *)objc_alloc_init(MEMORY[0x24BDF8C38]);
    v15 = v2->_result;
    v2->_result = v14;

    v16 = (VSOptional *)objc_alloc_init(MEMORY[0x24BDF8C38]);
    currentAccount = v2->_currentAccount;
    v2->_currentAccount = v16;

  }
  return v2;
}

void __48__VSViewServiceRequestPreparationOperation_init__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  VSErrorLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __48__VSViewServiceRequestPreparationOperation_init__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __48__VSViewServiceRequestPreparationOperation_init__block_invoke_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  VSErrorLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __48__VSViewServiceRequestPreparationOperation_init__block_invoke_5_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_privacyServiceConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)VSViewServiceRequestPreparationOperation;
  -[VSViewServiceRequestPreparationOperation dealloc](&v3, sel_dealloc);
}

- (id)_privacyServiceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VSViewServiceRequestPreparationOperation privacyServiceConnection](self, "privacyServiceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_finishWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The error parameter must not be nil."));
  VSErrorLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[VSViewServiceRequestPreparationOperation _finishWithError:].cold.1();

  v6 = (void *)MEMORY[0x24BDF8C38];
  objc_msgSend(MEMORY[0x24BDF8BF0], "failableWithError:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "optionalWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSViewServiceRequestPreparationOperation setResult:](self, "setResult:", v8);

  -[VSAsyncOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
}

- (void)_checkEntitlement
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  _BYTE v8[32];
  uint8_t buf[16];

  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2303C5000, v3, OS_LOG_TYPE_DEFAULT, "Prep operation will check entitlement", buf, 2u);
  }

  v4 = (void *)MEMORY[0x24BDF8C70];
  -[VSViewServiceRequestPreparationOperation hostAuditToken](self, "hostAuditToken");
  objc_msgSend(v4, "securityTaskWithAuditToken:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = VSCheckEntitlementForTask();
  v7 = 0;

  if (v6)
  {
    -[VSViewServiceRequestPreparationOperation _checkPrivacy](self, "_checkPrivacy");
  }
  else
  {
    if (!v7)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The entitlementErrorOrNil parameter must not be nil."));
    -[VSViewServiceRequestPreparationOperation _finishWithError:](self, "_finishWithError:", v7);
  }

}

- (void)_checkPrivacy
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  uint8_t buf[16];

  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2303C5000, v3, OS_LOG_TYPE_DEFAULT, "Prep operation will check privacy", buf, 2u);
  }

  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke;
  v7[3] = &unk_24FE19D18;
  v7[4] = self;
  -[VSViewServiceRequestPreparationOperation _privacyServiceWithErrorHandler:](self, "_privacyServiceWithErrorHandler:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke_19;
  v6[3] = &unk_24FE19DB8;
  v6[4] = self;
  objc_msgSend(v5, "preflightCheckForProcessIdentifier:withCompletionHandler:", -[VSViewServiceRequestPreparationOperation hostProcessIdentifier](self, "hostProcessIdentifier"), v6);

}

void __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke_cold_1();

  VSPrivateError();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", v5);

}

void __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke_19(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[6];
  uint8_t buf[16];

  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2303C5000, v4, OS_LOG_TYPE_DEFAULT, "Prep operation did check privacy", buf, 2u);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "isAccountModificationAllowed"))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "shouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront");
    v6 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v6, "availabilityInfoCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke_20;
      v11[3] = &unk_24FE19D90;
      v11[4] = *(_QWORD *)(a1 + 32);
      v11[5] = a2;
      objc_msgSend(v7, "determineIdentityProviderAvailabilityWithCompletionHandler:", v11);

    }
    else
    {
      objc_msgSend(v6, "_continueCheckPrivacyWithAccessStatus:", a2);
    }
  }
  else if (a2 == 1
         && (objc_msgSend(*(id *)(a1 + 32), "currentAccount"),
             v8 = (void *)objc_claimAutoreleasedReturnValue(),
             objc_msgSend(v8, "object"),
             v9 = (void *)objc_claimAutoreleasedReturnValue(),
             v9,
             v8,
             v9))
  {
    objc_msgSend(*(id *)(a1 + 32), "_checkAvailability");
  }
  else
  {
    VSPrivateError();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", v10);

  }
}

void __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke_20(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12[2];
  id buf[2];

  v5 = a3;
  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2303C5000, v6, OS_LOG_TYPE_DEFAULT, "Prep operation did check availability", (uint8_t *)buf, 2u);
  }

  if ((a2 & 1) != 0)
  {
    VSDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2303C5000, v7, OS_LOG_TYPE_DEFAULT, "TV Provider feature is available in storefront.", (uint8_t *)buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_continueCheckPrivacyWithAccessStatus:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x24BDF8BC8]);
    objc_initWeak(buf, v8);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke_22;
    v11[3] = &unk_24FE19D68;
    objc_copyWeak(v12, buf);
    v9 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12[1] = v9;
    objc_msgSend(v8, "setCompletionBlock:", v11);
    objc_msgSend(*(id *)(a1 + 32), "privateQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addOperation:", v8);

    objc_destroyWeak(v12);
    objc_destroyWeak(buf);

  }
}

void __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke_22(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  _QWORD v7[4];
  uint64_t v8;
  uint64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "forceUnwrapObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke_2;
  v7[3] = &unk_24FE19D40;
  v4 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke_24;
  v6[3] = &unk_24FE19D18;
  v6[4] = v8;
  objc_msgSend(v5, "unwrapObject:error:", v7, v6);

}

void __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v3 = objc_msgSend(a2, "count");
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2303C5000, v4, OS_LOG_TYPE_DEFAULT, "Developer providers were returned from fetch operation, allow TCC.", v7, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_continueCheckPrivacyWithAccessStatus:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2303C5000, v4, OS_LOG_TYPE_DEFAULT, "No developer providers returned from fetch operation, finish with VSErrorCodeUnsupported.", buf, 2u);
    }

    VSPublicError();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", v6);

  }
}

void __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke_24_cold_1();

  VSPrivateError();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", v5);

}

- (void)_continueCheckPrivacyWithAccessStatus:(unint64_t)a3
{
  VSViewServiceRequestPreparationOperation *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];

  switch(a3)
  {
    case 2uLL:
      VSPrivateError();
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[VSViewServiceRequestPreparationOperation _finishWithError:](self, "_finishWithError:", v7);

      return;
    case 1uLL:
      -[VSViewServiceRequestPreparationOperation _checkAvailability](self, "_checkAvailability");
      return;
    case 0uLL:
      if (-[VSViewServiceRequestPreparationOperation requestRequiresPrivacyUI](self, "requestRequiresPrivacyUI"))
      {
        v4 = self;
        v5 = 1;
LABEL_12:
        -[VSViewServiceRequestPreparationOperation _determineProviderDisplayNameWithUI:](v4, "_determineProviderDisplayNameWithUI:", v5);
        return;
      }
      if (!-[VSViewServiceRequestPreparationOperation requestAllowsPrivacyUI](self, "requestAllowsPrivacyUI"))
      {
        v4 = self;
        v5 = 0;
        goto LABEL_12;
      }
      -[VSViewServiceRequestPreparationOperation currentAccount](self, "currentAccount");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8[4] = self;
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __82__VSViewServiceRequestPreparationOperation__continueCheckPrivacyWithAccessStatus___block_invoke;
      v9[3] = &unk_24FE19DE0;
      v9[4] = self;
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __82__VSViewServiceRequestPreparationOperation__continueCheckPrivacyWithAccessStatus___block_invoke_2;
      v8[3] = &unk_24FE19778;
      objc_msgSend(v6, "conditionallyUnwrapObject:otherwise:", v9, v8);

      break;
  }
}

uint64_t __82__VSViewServiceRequestPreparationOperation__continueCheckPrivacyWithAccessStatus___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_determineProviderDisplayNameWithUI:", 1);
}

uint64_t __82__VSViewServiceRequestPreparationOperation__continueCheckPrivacyWithAccessStatus___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkAvailability");
}

- (void)_checkAvailability
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2303C5000, v3, OS_LOG_TYPE_DEFAULT, "Prep operation will check availability", buf, 2u);
  }

  -[VSViewServiceRequestPreparationOperation availabilityInfoCenter](self, "availabilityInfoCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62__VSViewServiceRequestPreparationOperation__checkAvailability__block_invoke;
  v5[3] = &unk_24FE19E08;
  v5[4] = self;
  objc_msgSend(v4, "determineIdentityProviderAvailabilityWithCompletionHandler:", v5);

}

void __62__VSViewServiceRequestPreparationOperation__checkAvailability__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v5 = a3;
  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2303C5000, v6, OS_LOG_TYPE_DEFAULT, "Prep operation did check availability", v8, 2u);
  }

  v7 = *(void **)(a1 + 32);
  if (a2)
    objc_msgSend(v7, "_checkSupportedProviders");
  else
    objc_msgSend(v7, "_finishWithError:", v5);

}

- (void)_finishWithSupportedProviders:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  VSFeaturedIdentityProviderLimitingOperation *v36;
  void *v37;
  VSFeaturedIdentityProviderLimitingOperation *v38;
  void *v39;
  void *v40;
  VSViewServiceRequestPreparationOperation *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  VSFeaturedIdentityProviderLimitingOperation *v47;
  VSViewServiceRequestPreparationOperation *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  id v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!objc_msgSend(v4, "count"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("No filtered identity providers provided."));
  objc_msgSend(v4, "valueForKeyPath:", CFSTR("providerID.object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSViewServiceRequestPreparationOperation featuredIdentityProviderIdentifiers](self, "featuredIdentityProviderIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1548], "expressionForKeyPath:", CFSTR("self"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1548], "expressionForConstantValue:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14B8], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v7, v8, 0, 10, 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (-[VSViewServiceRequestPreparationOperation shouldInferFeaturedProviders](self, "shouldInferFeaturedProviders")
    && !objc_msgSend(v9, "count"))
  {
    v10 = v9;
    v11 = v7;
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDBCF20];
    -[VSViewServiceRequestPreparationOperation supportedIdentityProviderIdentifiers](self, "supportedIdentityProviderIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v12, "isSubsetOfSet:", v15);

    if (v16)
    {
      v9 = v5;

      v7 = v11;
    }
    else
    {
      v7 = v11;
      v9 = v10;
    }
  }
  v17 = objc_msgSend(v9, "count");
  v18 = MEMORY[0x24BDAC760];
  if (v17)
  {
    v44 = v9;
    v40 = v7;
    v41 = self;
    v42 = v5;
    v19 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v43 = v4;
    v20 = v4;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v57 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          objc_msgSend(v25, "setRankForSorting:", 0);
          objc_msgSend(v25, "providerID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v53[0] = v18;
          v53[1] = 3221225472;
          v53[2] = __74__VSViewServiceRequestPreparationOperation__finishWithSupportedProviders___block_invoke;
          v53[3] = &unk_24FE19AE0;
          v54 = v19;
          v55 = v25;
          objc_msgSend(v26, "conditionallyUnwrapObject:", v53);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      }
      while (v22);
    }

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v27 = v44;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v50;
      v31 = 1;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v50 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(v19, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v31);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setRankForSorting:", v34);

            ++v31;
          }

        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
      }
      while (v29);
    }

    v5 = v42;
    v4 = v43;
    v7 = v40;
    self = v41;
    v9 = v44;
  }
  -[VSViewServiceRequestPreparationOperation privateQueue](self, "privateQueue");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_alloc_init(VSFeaturedIdentityProviderLimitingOperation);
  -[VSFeaturedIdentityProviderLimitingOperation setUnlimitedIdentityProviders:](v36, "setUnlimitedIdentityProviders:", v4);
  objc_msgSend(v35, "addOperation:", v36);
  v37 = (void *)MEMORY[0x24BDD1478];
  v46[0] = v18;
  v46[1] = 3221225472;
  v46[2] = __74__VSViewServiceRequestPreparationOperation__finishWithSupportedProviders___block_invoke_2;
  v46[3] = &unk_24FE19E30;
  v47 = v36;
  v48 = self;
  v38 = v36;
  objc_msgSend(v37, "blockOperationWithBlock:", v46);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addDependency:", v38);
  objc_msgSend(v35, "addOperation:", v39);

}

uint64_t __74__VSViewServiceRequestPreparationOperation__finishWithSupportedProviders___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), a2);
}

void __74__VSViewServiceRequestPreparationOperation__finishWithSupportedProviders___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceUnwrapObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 40);
  v4 = (void *)MEMORY[0x24BDF8C38];
  objc_msgSend(MEMORY[0x24BDF8BF0], "failableWithObject:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "optionalWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setResult:", v6);

  objc_msgSend(*(id *)(a1 + 40), "finishExecutionIfPossible");
}

- (void)_checkSupportedProviders
{
  NSObject *v3;
  VSIdentityProviderFetchAllOperation *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  uint8_t buf[16];

  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2303C5000, v3, OS_LOG_TYPE_DEFAULT, "Prep operation will fetch identity providers.", buf, 2u);
  }

  v4 = objc_alloc_init(VSIdentityProviderFetchAllOperation);
  -[VSViewServiceRequestPreparationOperation auditToken](self, "auditToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderFetchAllOperation setAuditToken:](v4, "setAuditToken:", v5);

  -[VSViewServiceRequestPreparationOperation applicationAccountProviders](self, "applicationAccountProviders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderFetchAllOperation setApplicationAccountProviders:](v4, "setApplicationAccountProviders:", v6);

  -[VSAsyncOperation start](v4, "start");
  -[VSIdentityProviderFetchAllOperation waitUntilFinished](v4, "waitUntilFinished");
  VSDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2303C5000, v7, OS_LOG_TYPE_DEFAULT, "Prep operation did fetch identity providers.", buf, 2u);
  }

  -[VSIdentityProviderFetchAllOperation result](v4, "result");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "forceUnwrapObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10[4] = self;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __68__VSViewServiceRequestPreparationOperation__checkSupportedProviders__block_invoke;
  v11[3] = &unk_24FE19E80;
  v11[4] = self;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__VSViewServiceRequestPreparationOperation__checkSupportedProviders__block_invoke_4;
  v10[3] = &unk_24FE19D18;
  objc_msgSend(v9, "unwrapObject:error:", v11, v10);

}

void __68__VSViewServiceRequestPreparationOperation__checkSupportedProviders__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  VSIdentityProviderFilter *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_alloc_init(VSIdentityProviderFilter);
  -[VSIdentityProviderFilter setAllIdentityProviders:](v4, "setAllIdentityProviders:", v3);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "applicationAccountProviders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v10), "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }

  objc_msgSend(*(id *)(a1 + 32), "supportedIdentityProviderIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSIdentityProviderFilter setSupportedAccountProviderIDs:](v4, "setSupportedAccountProviderIDs:", v13);
  -[VSIdentityProviderFilter filteredIdentityProviders](v4, "filteredIdentityProviders");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "currentAccount");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __68__VSViewServiceRequestPreparationOperation__checkSupportedProviders__block_invoke_2;
    v22[3] = &unk_24FE19E58;
    v17 = v14;
    v18 = *(_QWORD *)(a1 + 32);
    v23 = v17;
    v24 = v18;
    v20[0] = v16;
    v20[1] = 3221225472;
    v20[2] = __68__VSViewServiceRequestPreparationOperation__checkSupportedProviders__block_invoke_3;
    v20[3] = &unk_24FE19E30;
    v20[4] = v18;
    v21 = v17;
    objc_msgSend(v15, "conditionallyUnwrapObject:otherwise:", v22, v20);

    v19 = v23;
  }
  else
  {
    VSPublicUnsupportedProviderError();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", v19);
  }

}

void __68__VSViewServiceRequestPreparationOperation__checkSupportedProviders__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "identityProviderID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "forceUnwrapObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", CFSTR("providerID.object"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v7);

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "_finishWithSupportedProviders:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    VSPublicUnsupportedProviderError();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_finishWithError:", v6);

  }
}

uint64_t __68__VSViewServiceRequestPreparationOperation__checkSupportedProviders__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithSupportedProviders:", *(_QWORD *)(a1 + 40));
}

uint64_t __68__VSViewServiceRequestPreparationOperation__checkSupportedProviders__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", a2);
}

- (void)_determineProviderDisplayNameWithUI:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v3 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2303C5000, v5, OS_LOG_TYPE_DEFAULT, "Prep operation will determine display name", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v19 = buf;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  -[VSViewServiceRequestPreparationOperation currentAccount](self, "currentAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __80__VSViewServiceRequestPreparationOperation__determineProviderDisplayNameWithUI___block_invoke;
  v7[3] = &unk_24FE19EF8;
  v7[4] = buf;
  v7[5] = &v12;
  v7[6] = &v8;
  objc_msgSend(v6, "conditionallyUnwrapObject:", v7);

  -[VSViewServiceRequestPreparationOperation _promptForPrivacyWithDisplayNameIfRequired:providerID:providerIsSupported:allowUI:](self, "_promptForPrivacyWithDisplayNameIfRequired:providerID:providerIsSupported:allowUI:", *((_QWORD *)v19 + 5), v13[5], *((unsigned __int8 *)v9 + 24), v3);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(buf, 8);
}

void __80__VSViewServiceRequestPreparationOperation__determineProviderDisplayNameWithUI___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  VSIdentityProviderFetchOperation *v5;
  void *v6;
  void *v7;
  VSIdentityProviderFetchOperation *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  __int128 v17;
  uint64_t v18;
  uint8_t buf[16];

  v3 = a2;
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2303C5000, v4, OS_LOG_TYPE_DEFAULT, "Prep operation will fetch identity providers.", buf, 2u);
  }

  v5 = [VSIdentityProviderFetchOperation alloc];
  objc_msgSend(v3, "identityProviderID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "forceUnwrapObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VSIdentityProviderFetchOperation initWithIdentityProviderID:](v5, "initWithIdentityProviderID:", v7);

  -[VSAsyncOperation start](v8, "start");
  -[VSIdentityProviderFetchOperation waitUntilFinished](v8, "waitUntilFinished");
  VSDefaultLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2303C5000, v9, OS_LOG_TYPE_DEFAULT, "Prep operation did fetch identity providers.", buf, 2u);
  }

  -[VSIdentityProviderFetchOperation result](v8, "result");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "forceUnwrapObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __80__VSViewServiceRequestPreparationOperation__determineProviderDisplayNameWithUI___block_invoke_46;
  v16[3] = &unk_24FE19EA8;
  v17 = *(_OWORD *)(a1 + 32);
  v18 = *(_QWORD *)(a1 + 48);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __80__VSViewServiceRequestPreparationOperation__determineProviderDisplayNameWithUI___block_invoke_2;
  v13[3] = &unk_24FE19ED0;
  v15 = v17;
  v14 = v3;
  v12 = v3;
  objc_msgSend(v11, "unwrapObject:error:", v16, v13);

}

void __80__VSViewServiceRequestPreparationOperation__determineProviderDisplayNameWithUI___block_invoke_46(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forceUnwrapObject");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[4] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(v3, "providerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "forceUnwrapObject");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1[5] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  LOBYTE(v8) = objc_msgSend(v3, "isFullySupportedForRequestsExpectingAuthenticationSchemes:", 0);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = (_BYTE)v8;
}

void __80__VSViewServiceRequestPreparationOperation__determineProviderDisplayNameWithUI___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "optionalIdentityProviderDisplayName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forceUnwrapObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_promptForPrivacyWithDisplayNameIfRequired:(id)a3 providerID:(id)a4 providerIsSupported:(BOOL)a5 allowUI:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  BOOL v16;
  _BYTE v17[32];
  _QWORD v18[5];
  uint8_t buf[4];
  _BOOL4 v20;
  uint64_t v21;

  v6 = a6;
  v7 = a5;
  v21 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a3;
  VSDefaultLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v20 = v6;
    _os_log_impl(&dword_2303C5000, v12, OS_LOG_TYPE_DEFAULT, "Prep operation will request privacy access with UI allowed %d", buf, 8u);
  }

  v13 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __126__VSViewServiceRequestPreparationOperation__promptForPrivacyWithDisplayNameIfRequired_providerID_providerIsSupported_allowUI___block_invoke;
  v18[3] = &unk_24FE19D18;
  v18[4] = self;
  -[VSViewServiceRequestPreparationOperation _privacyServiceWithErrorHandler:](self, "_privacyServiceWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSViewServiceRequestPreparationOperation hostAuditToken](self, "hostAuditToken");
  v15[1] = 3221225472;
  v15[2] = __126__VSViewServiceRequestPreparationOperation__promptForPrivacyWithDisplayNameIfRequired_providerID_providerIsSupported_allowUI___block_invoke_48;
  v15[3] = &unk_24FE19F20;
  v16 = v6;
  v15[4] = self;
  v15[0] = v13;
  objc_msgSend(v14, "requestAccessForAuditToken:processIdentifier:identityProviderDisplayName:providerIsSupported:identityProviderID:allowUI:completionHandler:", v17, -[VSViewServiceRequestPreparationOperation hostProcessIdentifier](self, "hostProcessIdentifier"), v11, v7, v10, v6, v15);

}

void __126__VSViewServiceRequestPreparationOperation__promptForPrivacyWithDisplayNameIfRequired_providerID_providerIsSupported_allowUI___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __126__VSViewServiceRequestPreparationOperation__promptForPrivacyWithDisplayNameIfRequired_providerID_providerIsSupported_allowUI___block_invoke_cold_1();

  VSPrivateError();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", v5);

}

void __126__VSViewServiceRequestPreparationOperation__promptForPrivacyWithDisplayNameIfRequired_providerID_providerIsSupported_allowUI___block_invoke_48(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  void *v8;
  void *v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(unsigned __int8 *)(a1 + 40);
    v10[0] = 67109120;
    v10[1] = v7;
    _os_log_impl(&dword_2303C5000, v6, OS_LOG_TYPE_DEFAULT, "Prep operation did request privacy access with UI allowed %d", (uint8_t *)v10, 8u);
  }

  switch(a2)
  {
    case 2:
      goto LABEL_6;
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "_checkAvailability");
      break;
    case 0:
LABEL_6:
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v5, "forceUnwrapObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_finishWithError:", v9);

      break;
  }

}

- (void)cancel
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)VSViewServiceRequestPreparationOperation;
  -[VSAsyncOperation cancel](&v2, sel_cancel);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)hostAuditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[11].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[10].var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setHostAuditToken:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_hostAuditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_hostAuditToken.val[4] = v3;
}

- (int)hostProcessIdentifier
{
  return self->_hostProcessIdentifier;
}

- (void)setHostProcessIdentifier:(int)a3
{
  self->_hostProcessIdentifier = a3;
}

- (VSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (BOOL)requestAllowsPrivacyUI
{
  return self->_requestAllowsPrivacyUI;
}

- (void)setRequestAllowsPrivacyUI:(BOOL)a3
{
  self->_requestAllowsPrivacyUI = a3;
}

- (BOOL)requestRequiresPrivacyUI
{
  return self->_requestRequiresPrivacyUI;
}

- (void)setRequestRequiresPrivacyUI:(BOOL)a3
{
  self->_requestRequiresPrivacyUI = a3;
}

- (NSArray)supportedIdentityProviderIdentifiers
{
  return self->_supportedIdentityProviderIdentifiers;
}

- (void)setSupportedIdentityProviderIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSArray)featuredIdentityProviderIdentifiers
{
  return self->_featuredIdentityProviderIdentifiers;
}

- (void)setFeaturedIdentityProviderIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSArray)applicationAccountProviders
{
  return self->_applicationAccountProviders;
}

- (void)setApplicationAccountProviders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (BOOL)shouldInferFeaturedProviders
{
  return self->_shouldInferFeaturedProviders;
}

- (void)setShouldInferFeaturedProviders:(BOOL)a3
{
  self->_shouldInferFeaturedProviders = a3;
}

- (BOOL)shouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront
{
  return self->_shouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront;
}

- (void)setShouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront:(BOOL)a3
{
  self->_shouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront = a3;
}

- (BOOL)isAccountModificationAllowed
{
  return self->_accountModificationAllowed;
}

- (void)setAccountModificationAllowed:(BOOL)a3
{
  self->_accountModificationAllowed = a3;
}

- (VSOptional)currentAccount
{
  return self->_currentAccount;
}

- (void)setCurrentAccount:(id)a3
{
  objc_storeStrong((id *)&self->_currentAccount, a3);
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (NSXPCConnection)privacyServiceConnection
{
  return self->_privacyServiceConnection;
}

- (void)setPrivacyServiceConnection:(id)a3
{
  objc_storeStrong((id *)&self->_privacyServiceConnection, a3);
}

- (VSIdentityProviderAvailabilityInfoCenter)availabilityInfoCenter
{
  return self->_availabilityInfoCenter;
}

- (void)setAvailabilityInfoCenter:(id)a3
{
  objc_storeStrong((id *)&self->_availabilityInfoCenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilityInfoCenter, 0);
  objc_storeStrong((id *)&self->_privacyServiceConnection, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_currentAccount, 0);
  objc_storeStrong((id *)&self->_applicationAccountProviders, 0);
  objc_storeStrong((id *)&self->_featuredIdentityProviderIdentifiers, 0);
  objc_storeStrong((id *)&self->_supportedIdentityProviderIdentifiers, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
}

void __48__VSViewServiceRequestPreparationOperation_init__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_2303C5000, a1, a3, "Privacy service connection interrupted.", a5, a6, a7, a8, 0);
}

void __48__VSViewServiceRequestPreparationOperation_init__block_invoke_5_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_2303C5000, a1, a3, "Privacy service connection invalidated.", a5, a6, a7, a8, 0);
}

- (void)_finishWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2303C5000, v0, v1, "Prep operation will finish with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2303C5000, v0, v1, "Service error during preflight check: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke_24_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2303C5000, v0, v1, "VSDeveloperIdentityProviderFetchAllOperation failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __126__VSViewServiceRequestPreparationOperation__promptForPrivacyWithDisplayNameIfRequired_providerID_providerIsSupported_allowUI___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2303C5000, v0, v1, "Service error while prompting: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
