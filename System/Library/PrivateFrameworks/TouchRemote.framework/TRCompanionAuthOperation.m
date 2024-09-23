@implementation TRCompanionAuthOperation

- (void)execute
{
  id v3;

  if (-[TRCompanionAuthOperation isCancelled](self, "isCancelled"))
  {
    objc_msgSend((id)objc_opt_class(), "userCancelledError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[TROperation finishWithError:](self, "finishWithError:", v3);

  }
  else
  {
    -[TRCompanionAuthOperation _sendProxyDeviceRequest](self, "_sendProxyDeviceRequest");
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
      v9 = "-[TRCompanionAuthOperation _sendProxyDeviceRequest]";
      _os_log_impl(&dword_20A2BF000, v3, OS_LOG_TYPE_DEFAULT, "%s Requesting proxy device", buf, 0xCu);
    }

  }
  v4 = objc_alloc_init(TRSetupProxyDeviceRequest);
  objc_initWeak((id *)buf, self);
  -[TROperation session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__TRCompanionAuthOperation__sendProxyDeviceRequest__block_invoke;
  v6[3] = &unk_24C2E4FE0;
  objc_copyWeak(&v7, (id *)buf);
  objc_msgSend(v5, "sendRequest:withResponseHandler:", v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);

}

void __51__TRCompanionAuthOperation__sendProxyDeviceRequest__block_invoke(uint64_t a1, void *a2, void *a3)
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
      v8 = "-[TRCompanionAuthOperation _handleProxyDeviceResponse:]";
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
    if (v6)
      -[TRCompanionAuthOperation _performCompanionAuthenticationWithProxiedDevice:](self, "_performCompanionAuthenticationWithProxiedDevice:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -10000, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TROperation finishWithError:](self, "finishWithError:", v6);
  }

}

- (void)_performCompanionAuthenticationWithProxiedDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  TRSetupCompanionAuthenticationRequest *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  const __CFString *v26;
  void *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRCompanionAuthOperation account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v5, "credentialForAccount:error:", v6, &v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v25;

  if (v7)
  {
    -[TRCompanionAuthOperation account](self, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCredential:", v7);

    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        -[TRCompanionAuthOperation account](self, "account");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v29 = "-[TRCompanionAuthOperation _performCompanionAuthenticationWithProxiedDevice:]";
        v30 = 2112;
        v31 = v11;
        _os_log_impl(&dword_20A2BF000, v10, OS_LOG_TYPE_DEFAULT, "%s Loaded credentials for account %@.", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x24BE0AD68], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLinkType:", 3);
    v13 = objc_alloc_init(TRSetupCompanionAuthenticationRequest);
    -[TRSetupCompanionAuthenticationRequest setCompanionDevice:](v13, "setCompanionDevice:", v12);
    -[TRCompanionAuthOperation account](self, "account");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRSetupCompanionAuthenticationRequest setAccount:](v13, "setAccount:", v14);

    -[TRCompanionAuthOperation targetedServices](self, "targetedServices");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRSetupCompanionAuthenticationRequest setTargetedAccountServices:](v13, "setTargetedAccountServices:", v15);

    -[TRSetupCompanionAuthenticationRequest setShouldUseAIDA:](v13, "setShouldUseAIDA:", -[TRCompanionAuthOperation shouldUseAIDA](self, "shouldUseAIDA"));
    if (!self->_forceFail)
    {
      -[TRCompanionAuthOperation account](self, "account");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRSetupCompanionAuthenticationRequest setAccount:](v13, "setAccount:", v16);

    }
    objc_initWeak((id *)buf, self);
    -[TROperation session](self, "session");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __77__TRCompanionAuthOperation__performCompanionAuthenticationWithProxiedDevice___block_invoke;
    v22[3] = &unk_24C2E5328;
    objc_copyWeak(&v24, (id *)buf);
    v23 = v4;
    objc_msgSend(v17, "sendRequest:withResponseHandler:", v13, v22);

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
        -[TRCompanionAuthOperation account](self, "account");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v29 = "-[TRCompanionAuthOperation _performCompanionAuthenticationWithProxiedDevice:]";
        v30 = 2112;
        v31 = v19;
        v32 = 2112;
        v33 = v8;
        _os_log_impl(&dword_20A2BF000, v18, OS_LOG_TYPE_DEFAULT, "%s Failed to load credentials for account %@.  Error: %@", buf, 0x20u);

      }
    }
    v26 = CFSTR("TRCompanionAuthOperationUnauthenticatedServicesKey");
    -[TRCompanionAuthOperation targetedServices](self, "targetedServices");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v21, "mutableCopy");

    if (v8)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("TRCompanionAuthOperationErrorKey"));
    v13 = (TRSetupCompanionAuthenticationRequest *)objc_msgSend(v12, "copy");
    -[TROperation finishWithResult:](self, "finishWithResult:", v13);
  }

}

void __77__TRCompanionAuthOperation__performCompanionAuthenticationWithProxiedDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(WeakRetained, "isCancelled"))
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20A2BF000, v8, OS_LOG_TYPE_DEFAULT, "TRCompanionAuthOperation userCancelledError", buf, 2u);
      }

    }
    objc_msgSend((id)objc_opt_class(), "userCancelledError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "finishWithError:", v9);

  }
  else if (v6)
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_20A2BF000, v10, OS_LOG_TYPE_DEFAULT, "TRCompanionAuthOperation response received", v12, 2u);
      }

    }
    objc_msgSend(WeakRetained, "_handleResponse:proxiedDevice:", v6, *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_20A2BF000, v11, OS_LOG_TYPE_DEFAULT, "TRCompanionAuthOperation no response from send request", v13, 2u);
      }

    }
    objc_msgSend(WeakRetained, "finishWithError:", v5);
  }

}

- (void)_handleResponse:(id)a3 proxiedDevice:(id)a4
{
  __CFString *v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  NSObject *v22;
  char *v23;
  void *v24;
  int v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  TRAnisetteDataProvider *v30;
  _BOOL4 v31;
  NSObject *v32;
  TRAnisetteDataProvider *v33;
  void *v34;
  TRTermsAndConditionsManager *v35;
  void *v36;
  TRTermsAndConditionsManager *v37;
  TRTermsAndConditionsManager *termsManager;
  TRTermsAndConditionsManager *v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  char *v43;
  void *v44;
  int v45;
  const __CFString *v46;
  _QWORD v47[5];
  _QWORD v48[5];
  id v49;
  const __CFString *v50;
  void *v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  const __CFString *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  v7 = a4;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v53 = "-[TRCompanionAuthOperation _handleResponse:proxiedDevice:]";
      v54 = 2112;
      v55 = v6;
      _os_log_impl(&dword_20A2BF000, v8, OS_LOG_TYPE_DEFAULT, "%s Handle Companion Authentication Response: %@", buf, 0x16u);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -10000, 0);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[TROperation finishWithError:](self, "finishWithError:", v9);
    goto LABEL_37;
  }
  v9 = v6;
  v50 = CFSTR("TRCompanionAuthOperationUnauthenticatedServicesKey");
  -[__CFString unauthenticatedAccountServices](v9, "unauthenticatedAccountServices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  -[__CFString error](v9, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20A2BF000, v14, OS_LOG_TYPE_DEFAULT, "Error in response", buf, 2u);
      }

      if (_TRLogEnabled == 1)
      {
        TRLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          if (self->_isForHomePod)
            v16 = CFSTR("YES");
          else
            v16 = CFSTR("NO");
          *(_DWORD *)buf = 138412290;
          v53 = (const char *)v16;
          _os_log_impl(&dword_20A2BF000, v15, OS_LOG_TYPE_DEFAULT, "_isForHomePod %@", buf, 0xCu);
        }

      }
    }
    -[__CFString error](v9, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("TRCompanionAuthOperationErrorKey"));

    if (self->_isForHomePod)
    {
      -[__CFString error](v9, "error");
      v18 = objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = (void *)v18;
        -[__CFString error](v9, "error");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "ak_isEligibleForProxiedAuthFallback");

        if ((v21 & 1) == 0)
        {
          if (_TRLogEnabled == 1)
          {
            TRLogHandle();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              -[__CFString error](v9, "error");
              v43 = (char *)objc_claimAutoreleasedReturnValue();
              -[__CFString error](v9, "error");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = objc_msgSend(v44, "ak_isEligibleForProxiedAuthFallback");
              v46 = CFSTR("NO");
              if (v45)
                v46 = CFSTR("YES");
              *(_DWORD *)buf = 138412546;
              v53 = v43;
              v54 = 2112;
              v55 = v46;
              _os_log_impl(&dword_20A2BF000, v42, OS_LOG_TYPE_DEFAULT, "Error cannot fall back, finishing with error %@ | canFallBack %@", buf, 0x16u);

            }
          }
          -[__CFString error](v9, "error");
          v30 = (TRAnisetteDataProvider *)objc_claimAutoreleasedReturnValue();
          -[TROperation finishWithError:](self, "finishWithError:", v30);
          goto LABEL_35;
        }
      }
    }
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        -[__CFString error](v9, "error");
        v23 = (char *)objc_claimAutoreleasedReturnValue();
        -[__CFString error](v9, "error");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "ak_isEligibleForProxiedAuthFallback");
        v26 = CFSTR("NO");
        if (v25)
          v26 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v53 = v23;
        v54 = 2112;
        v55 = v26;
        _os_log_impl(&dword_20A2BF000, v22, OS_LOG_TYPE_DEFAULT, "Error fall back to proxy, error %@ | canFallBack %@", buf, 0x16u);

      }
    }
  }
  -[__CFString authenticationResults](v9, "authenticationResults");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (!v27
    || !self->_presentingViewController
    || self->_isCLIMode
    || !self->_canDoTermsAndConditions
    || !self->_isForHomePod)
  {

LABEL_30:
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20A2BF000, v29, OS_LOG_TYPE_DEFAULT, "Companion Auth Skipping terms", buf, 2u);
      }

    }
    v30 = (TRAnisetteDataProvider *)objc_msgSend(v12, "copy");
    -[TROperation finishWithResult:](self, "finishWithResult:", v30);
    goto LABEL_35;
  }
  v31 = -[NSSet containsObject:](self->_targetedServices, "containsObject:", &unk_24C2F2988);

  if (!v31)
    goto LABEL_30;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20A2BF000, v32, OS_LOG_TYPE_DEFAULT, "Showing Terms for Companion Auth", buf, 2u);
    }

  }
  v33 = [TRAnisetteDataProvider alloc];
  -[TROperation session](self, "session");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[TRAnisetteDataProvider initWithSession:](v33, "initWithSession:", v34);

  v35 = [TRTermsAndConditionsManager alloc];
  -[__CFString authenticationResults](v9, "authenticationResults");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[TRTermsAndConditionsManager initWithAuthResultsBlock:presentingViewController:](v35, "initWithAuthResultsBlock:presentingViewController:", v36, self->_presentingChildViewController);
  termsManager = self->_termsManager;
  self->_termsManager = v37;

  v39 = self->_termsManager;
  v40 = MEMORY[0x24BDAC760];
  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = __58__TRCompanionAuthOperation__handleResponse_proxiedDevice___block_invoke;
  v48[3] = &unk_24C2E5378;
  v48[4] = self;
  v49 = v12;
  v47[0] = v40;
  v47[1] = 3221225472;
  v47[2] = __58__TRCompanionAuthOperation__handleResponse_proxiedDevice___block_invoke_3;
  v47[3] = &unk_24C2E4F08;
  v47[4] = self;
  -[TRTermsAndConditionsManager loadProxiedTerms:anisetteDataProvider:appProvidedContext:acceptAction:declineAction:](v39, "loadProxiedTerms:anisetteDataProvider:appProvidedContext:acceptAction:declineAction:", v7, v30, CFSTR("HomePodSetup"), v48, v47);
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v53 = "-[TRCompanionAuthOperation _handleResponse:proxiedDevice:]";
      _os_log_impl(&dword_20A2BF000, v41, OS_LOG_TYPE_DEFAULT, "%s Terms Done Presenting", buf, 0xCu);
    }

  }
LABEL_35:

LABEL_37:
}

void __58__TRCompanionAuthOperation__handleResponse_proxiedDevice___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __58__TRCompanionAuthOperation__handleResponse_proxiedDevice___block_invoke_2;
  v2[3] = &unk_24C2E4F30;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

}

void __58__TRCompanionAuthOperation__handleResponse_proxiedDevice___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v1, "finishWithResult:", v2);

}

void __58__TRCompanionAuthOperation__handleResponse_proxiedDevice___block_invoke_3(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__TRCompanionAuthOperation__handleResponse_proxiedDevice___block_invoke_4;
  block[3] = &unk_24C2E4F08;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __58__TRCompanionAuthOperation__handleResponse_proxiedDevice___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TROperationErrorDomain"), -12002, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithError:", v2);

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

- (BOOL)shouldUseAIDA
{
  return self->_shouldUseAIDA;
}

- (void)setShouldUseAIDA:(BOOL)a3
{
  self->_shouldUseAIDA = a3;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
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
