@implementation TRProxyAuthOperation

- (void)execute
{
  id v3;

  if (-[TRProxyAuthOperation isCancelled](self, "isCancelled"))
  {
    objc_msgSend((id)objc_opt_class(), "userCancelledError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[TROperation finishWithError:](self, "finishWithError:", v3);

  }
  else
  {
    -[TRProxyAuthOperation _sendProxyDeviceRequest](self, "_sendProxyDeviceRequest");
  }
}

- (void)_sendProxyDeviceRequest
{
  NSObject *v3;
  TRSetupProxyDeviceRequest *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[TRProxyAuthOperation _sendProxyDeviceRequest]";
      _os_log_impl(&dword_20A2BF000, v3, OS_LOG_TYPE_DEFAULT, "%s Requesting proxy device", buf, 0xCu);
    }

  }
  v4 = objc_alloc_init(TRSetupProxyDeviceRequest);
  objc_initWeak((id *)buf, self);
  -[TROperation session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__TRProxyAuthOperation__sendProxyDeviceRequest__block_invoke;
  v6[3] = &unk_24C2E4FE0;
  objc_copyWeak(&v7, (id *)buf);
  objc_msgSend(v5, "sendRequest:withResponseHandler:", v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);

}

void __47__TRProxyAuthOperation__sendProxyDeviceRequest__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "isCancelled"))
  {
    objc_msgSend((id)objc_opt_class(), "userCancelledError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "finishWithError:", v7);

  }
  else if (v5)
  {
    objc_msgSend(WeakRetained, "_handleProxyDeviceResponse:", v5);
  }
  else
  {
    objc_msgSend(WeakRetained, "finishWithError:", v8);
  }

}

- (void)_handleProxyDeviceResponse:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "-[TRProxyAuthOperation _handleProxyDeviceResponse:]";
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_20A2BF000, v5, OS_LOG_TYPE_DEFAULT, "%s Handle Proxy Device Response: %@", (uint8_t *)&v7, 0x16u);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "proxyDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRProxyAuthOperation _performProxyAuthenticationWithProxiedDevice:](self, "_performProxyAuthenticationWithProxiedDevice:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -10000, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TROperation finishWithError:](self, "finishWithError:", v6);
  }

}

- (void)_performProxyAuthenticationWithProxiedDevice:(id)a3
{
  id v4;
  TRAnisetteDataProvider *v5;
  void *v6;
  TRAnisetteDataProvider *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *rawPassword;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  TRProxyAuthOperation *v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [TRAnisetteDataProvider alloc];
  -[TROperation session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TRAnisetteDataProvider initWithSession:](v5, "initWithSession:", v6);

  v8 = objc_alloc_init(getAKAppleIDAuthenticationInAppContextClass());
  -[TRProxyAuthOperation presentingViewController](self, "presentingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPresentingViewController:", v9);

  -[TRProxyAuthOperation account](self, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "username");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUsername:", v11);

  objc_msgSend(v8, "setIsUsernameEditable:", 0);
  objc_msgSend(v8, "setShouldAllowAppleIDCreation:", 0);
  v12 = (void *)objc_opt_class();
  -[TRProxyAuthOperation targetedServices](self, "targetedServices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setServiceType:", objc_msgSend(v12, "_appleIDServiceTypeForTRAccountServices:", v13));

  objc_msgSend(v8, "setShouldForceInteractiveAuth:", 0);
  objc_msgSend(v8, "setProxiedDevice:", v4);
  objc_msgSend(v8, "setAnisetteDataProvider:", v7);
  objc_msgSend(v8, "_setProxyingForApp:", 1);
  if (self->_isCLIMode)
  {
    rawPassword = self->_rawPassword;
    if (rawPassword)
    {
      if (_TRLogEnabled == 1)
      {
        TRLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v27 = "-[TRProxyAuthOperation _performProxyAuthenticationWithProxiedDevice:]";
          _os_log_impl(&dword_20A2BF000, v15, OS_LOG_TYPE_DEFAULT, "%s _performProxyAuthenticationWithProxiedDevice _isCLIMode is enabled, setting raw password", buf, 0xCu);
        }

        rawPassword = self->_rawPassword;
      }
      objc_msgSend(v8, "_setPassword:", rawPassword);
    }
  }
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "username");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_logStringForAppleIDServiceType:", objc_msgSend(v8, "serviceType"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v27 = "-[TRProxyAuthOperation _performProxyAuthenticationWithProxiedDevice:]";
      v28 = 2112;
      v29 = v17;
      v30 = 2114;
      v31 = v18;
      _os_log_impl(&dword_20A2BF000, v16, OS_LOG_TYPE_DEFAULT, "%s Attempting authentication of account %@ using service type %{public}@", buf, 0x20u);

    }
  }
  v19 = objc_alloc_init(MEMORY[0x24BE0ACC0]);
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __69__TRProxyAuthOperation__performProxyAuthenticationWithProxiedDevice___block_invoke;
  v22[3] = &unk_24C2E5350;
  v23 = v19;
  v24 = self;
  v25 = v4;
  v20 = v4;
  v21 = v19;
  objc_msgSend(v21, "authenticateWithContext:completion:", v8, v22);

}

void __69__TRProxyAuthOperation__performProxyAuthenticationWithProxiedDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  uint64_t v9;
  TRSetupProxyAuthenticationRequest *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("<auth results>");
      v9 = *(_QWORD *)(a1 + 32);
      v26 = "-[TRProxyAuthOperation _performProxyAuthenticationWithProxiedDevice:]_block_invoke";
      *(_DWORD *)buf = 136315906;
      if (!v5)
        v8 = CFSTR("<no auth results>");
      v27 = 2112;
      v28 = v6;
      v29 = 2112;
      v30 = v8;
      v31 = 2112;
      v32 = v9;
      _os_log_impl(&dword_20A2BF000, v7, OS_LOG_TYPE_DEFAULT, "%s %@ %@ with %@", buf, 0x2Au);
    }

  }
  if (v5)
  {
    v10 = objc_alloc_init(TRSetupProxyAuthenticationRequest);
    objc_msgSend(*(id *)(a1 + 40), "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRSetupProxyAuthenticationRequest setAccount:](v10, "setAccount:", v11);

    v12 = *(_QWORD *)(a1 + 40);
    if (!*(_BYTE *)(v12 + 292))
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0ABD8]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRSetupProxyAuthenticationRequest setRawPassword:](v10, "setRawPassword:", v13);

      v12 = *(_QWORD *)(a1 + 40);
    }
    if (*(_BYTE *)(v12 + 290))
    {
      v14 = *(_QWORD *)(v12 + 328);
      if (v14)
      {
        if (_TRLogEnabled == 1)
        {
          TRLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v26 = "-[TRProxyAuthOperation _performProxyAuthenticationWithProxiedDevice:]_block_invoke";
            _os_log_impl(&dword_20A2BF000, v15, OS_LOG_TYPE_DEFAULT, "%s AKAppleIDAuthenticationController authenticateWithContext _isCLIMode is enabled, setting raw password", buf, 0xCu);
          }

          v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 328);
        }
        -[TRSetupProxyAuthenticationRequest setRawPassword:](v10, "setRawPassword:", v14);
        v12 = *(_QWORD *)(a1 + 40);
      }
    }
    objc_msgSend((id)v12, "targetedServices");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRSetupProxyAuthenticationRequest setTargetedAccountServices:](v10, "setTargetedAccountServices:", v16);

    -[TRSetupProxyAuthenticationRequest setShouldUseAIDA:](v10, "setShouldUseAIDA:", objc_msgSend(*(id *)(a1 + 40), "shouldUseAIDA"));
    objc_initWeak((id *)buf, *(id *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 40), "session");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __69__TRProxyAuthOperation__performProxyAuthenticationWithProxiedDevice___block_invoke_14;
    v22[3] = &unk_24C2E5328;
    objc_copyWeak(&v24, (id *)buf);
    v23 = *(id *)(a1 + 48);
    objc_msgSend(v17, "sendRequest:withResponseHandler:", v10, v22);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v26 = "-[TRProxyAuthOperation _performProxyAuthenticationWithProxiedDevice:]_block_invoke";
        _os_log_impl(&dword_20A2BF000, v18, OS_LOG_TYPE_DEFAULT, "%s Failed to receive proxy authentication results", buf, 0xCu);
      }

    }
    v10 = (TRSetupProxyAuthenticationRequest *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 40), "targetedServices");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRSetupProxyAuthenticationRequest setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v19, CFSTR("TRProxyAuthOperationUnauthenticatedServicesKey"));

    if (v6)
      -[TRSetupProxyAuthenticationRequest setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v6, CFSTR("TRProxyAuthOperationErrorKey"));
    v20 = *(void **)(a1 + 40);
    v21 = (void *)-[TRSetupProxyAuthenticationRequest copy](v10, "copy");
    objc_msgSend(v20, "finishWithResult:", v21);

  }
}

void __69__TRProxyAuthOperation__performProxyAuthenticationWithProxiedDevice___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(WeakRetained, "isCancelled"))
  {
    objc_msgSend((id)objc_opt_class(), "userCancelledError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "finishWithError:", v7);

  }
  else if (v5)
  {
    objc_msgSend(WeakRetained, "_handleProxyAuthenticationResponse:proxiedDevice:", v5, *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(WeakRetained, "finishWithError:", v8);
  }

}

- (void)_handleProxyAuthenticationResponse:(id)a3 proxiedDevice:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  TRAnisetteDataProvider *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  NSObject *v21;
  TRAnisetteDataProvider *v22;
  void *v23;
  TRTermsAndConditionsManager *v24;
  void *v25;
  TRTermsAndConditionsManager *v26;
  TRTermsAndConditionsManager *termsManager;
  TRTermsAndConditionsManager *v28;
  uint64_t v29;
  NSObject *v30;
  _QWORD v31[5];
  _QWORD v32[5];
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[TRProxyAuthOperation _handleProxyAuthenticationResponse:proxiedDevice:]";
      v36 = 2112;
      v37 = (uint64_t)v6;
      _os_log_impl(&dword_20A2BF000, v8, OS_LOG_TYPE_DEFAULT, "%s Handle Proxy Authentication Response: %@", buf, 0x16u);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v6;
    v10 = (void *)objc_opt_new();
    objc_msgSend(v9, "unauthenticatedAccountServices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("TRProxyAuthOperationUnauthenticatedServicesKey"));

    objc_msgSend(v9, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if (_TRLogEnabled == 1)
      {
        TRLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20A2BF000, v13, OS_LOG_TYPE_DEFAULT, "Error in response", buf, 2u);
        }

      }
      objc_msgSend(v9, "error");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("TRProxyAuthOperationErrorKey"));
    }
    else
    {
      objc_msgSend(v9, "authenticationResults");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18
        && self->_presentingViewController
        && !self->_isCLIMode
        && self->_canDoTermsAndConditions
        && self->_isForHomePod)
      {
        v20 = -[NSSet containsObject:](self->_targetedServices, "containsObject:", &unk_24C2F2868);

        if (v20)
        {
          if (_TRLogEnabled == 1)
          {
            TRLogHandle();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_20A2BF000, v21, OS_LOG_TYPE_DEFAULT, "Showing Terms for Proxy Auth", buf, 2u);
            }

          }
          v22 = [TRAnisetteDataProvider alloc];
          -[TROperation session](self, "session");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[TRAnisetteDataProvider initWithSession:](v22, "initWithSession:", v23);

          v24 = [TRTermsAndConditionsManager alloc];
          objc_msgSend(v9, "authenticationResults");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[TRTermsAndConditionsManager initWithAuthResultsBlock:presentingViewController:](v24, "initWithAuthResultsBlock:presentingViewController:", v25, self->_presentingChildViewController);
          termsManager = self->_termsManager;
          self->_termsManager = v26;

          v28 = self->_termsManager;
          v29 = MEMORY[0x24BDAC760];
          v32[0] = MEMORY[0x24BDAC760];
          v32[1] = 3221225472;
          v32[2] = __73__TRProxyAuthOperation__handleProxyAuthenticationResponse_proxiedDevice___block_invoke;
          v32[3] = &unk_24C2E5378;
          v32[4] = self;
          v33 = v10;
          v31[0] = v29;
          v31[1] = 3221225472;
          v31[2] = __73__TRProxyAuthOperation__handleProxyAuthenticationResponse_proxiedDevice___block_invoke_2;
          v31[3] = &unk_24C2E4F08;
          v31[4] = self;
          -[TRTermsAndConditionsManager loadProxiedTerms:anisetteDataProvider:appProvidedContext:acceptAction:declineAction:](v28, "loadProxiedTerms:anisetteDataProvider:appProvidedContext:acceptAction:declineAction:", v7, v15, CFSTR("HomePodSetup"), v32, v31);
          if (_TRLogEnabled == 1)
          {
            TRLogHandle();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v35 = "-[TRProxyAuthOperation _handleProxyAuthenticationResponse:proxiedDevice:]";
              _os_log_impl(&dword_20A2BF000, v30, OS_LOG_TYPE_DEFAULT, "%s Terms Done", buf, 0xCu);
            }

          }
          goto LABEL_14;
        }
      }
      else
      {

      }
      if (_TRLogEnabled != 1)
      {
LABEL_13:
        v15 = (TRAnisetteDataProvider *)objc_msgSend(v10, "copy");
        -[TROperation finishWithResult:](self, "finishWithResult:", v15);
LABEL_14:

        goto LABEL_20;
      }
      TRLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20A2BF000, v14, OS_LOG_TYPE_DEFAULT, "Proxy Auth Skipping terms", buf, 2u);
      }
    }

    goto LABEL_13;
  }
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_opt_class();
      *(_DWORD *)buf = 136315394;
      v35 = "-[TRProxyAuthOperation _handleProxyAuthenticationResponse:proxiedDevice:]";
      v36 = 2112;
      v37 = v17;
      _os_log_impl(&dword_20A2BF000, v16, OS_LOG_TYPE_DEFAULT, "%s response class is not TRSetupAuthenticationResponse: %@", buf, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -10000, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TROperation finishWithError:](self, "finishWithError:", v9);
LABEL_20:

}

void __73__TRProxyAuthOperation__handleProxyAuthenticationResponse_proxiedDevice___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v1, "finishWithResult:", v2);

}

void __73__TRProxyAuthOperation__handleProxyAuthenticationResponse_proxiedDevice___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TROperationErrorDomain"), -12002, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithError:", v2);

}

+ (int64_t)_appleIDServiceTypeForTRAccountServices:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "containsObject:", &unk_24C2F2868) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "containsObject:", &unk_24C2F2880) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "containsObject:", &unk_24C2F2898))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_logStringForAppleIDServiceType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return CFSTR("UNKNOWN");
  else
    return off_24C2E53B8[a3 - 1];
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSSet)targetedServices
{
  return self->_targetedServices;
}

- (void)setTargetedServices:(id)a3
{
  objc_storeStrong((id *)&self->_targetedServices, a3);
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (BOOL)shouldUseAIDA
{
  return self->_shouldUseAIDA;
}

- (void)setShouldUseAIDA:(BOOL)a3
{
  self->_shouldUseAIDA = a3;
}

- (BOOL)isForHomePod
{
  return self->_isForHomePod;
}

- (void)setIsForHomePod:(BOOL)a3
{
  self->_isForHomePod = a3;
}

- (UIViewController)presentingChildViewController
{
  return self->_presentingChildViewController;
}

- (void)setPresentingChildViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingChildViewController, a3);
}

- (BOOL)isCLIMode
{
  return self->_isCLIMode;
}

- (void)setIsCLIMode:(BOOL)a3
{
  self->_isCLIMode = a3;
}

- (NSString)rawPassword
{
  return self->_rawPassword;
}

- (void)setRawPassword:(id)a3
{
  objc_storeStrong((id *)&self->_rawPassword, a3);
}

- (BOOL)canDoTermsAndConditions
{
  return self->_canDoTermsAndConditions;
}

- (void)setCanDoTermsAndConditions:(BOOL)a3
{
  self->_canDoTermsAndConditions = a3;
}

- (BOOL)forceFail
{
  return self->_forceFail;
}

- (void)setForceFail:(BOOL)a3
{
  self->_forceFail = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawPassword, 0);
  objc_storeStrong((id *)&self->_presentingChildViewController, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_targetedServices, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_termsManager, 0);
}

@end
