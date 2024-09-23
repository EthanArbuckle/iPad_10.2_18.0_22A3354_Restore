@implementation VSIdentityProviderRequestManager

- (VSIdentityProviderRequestManager)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VSIdentityProviderRequestManager)initWithIdentityProvider:(id)a3
{
  id v5;
  char *v6;
  VSApplicationControllerRequestFactory *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  objc_super v22;

  v5 = a3;
  if (!v5)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The identityProvider parameter must not be nil."));
  v22.receiver = self;
  v22.super_class = (Class)VSIdentityProviderRequestManager;
  v6 = -[VSIdentityProviderRequestManager init](&v22, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(VSApplicationControllerRequestFactory);
    v8 = (void *)*((_QWORD *)v6 + 12);
    *((_QWORD *)v6 + 12) = v7;

    v9 = objc_alloc_init(MEMORY[0x24BDF8C48]);
    v10 = (void *)*((_QWORD *)v6 + 13);
    *((_QWORD *)v6 + 13) = v9;

    objc_storeStrong((id *)v6 + 2, a3);
    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v12 = (void *)*((_QWORD *)v6 + 7);
    *((_QWORD *)v6 + 7) = v11;

    v13 = objc_alloc_init(MEMORY[0x24BDD1710]);
    v14 = (void *)*((_QWORD *)v6 + 6);
    *((_QWORD *)v6 + 6) = v13;

    objc_msgSend(*((id *)v6 + 6), "setName:", CFSTR("VSIdentityProviderRequestManager"));
    v6[10] = 1;
    *((_QWORD *)v6 + 17) = 0x404E000000000000;
    *(_OWORD *)(v6 + 120) = xmmword_2304226E0;
    v15 = objc_alloc_init(MEMORY[0x24BDF8C38]);
    v16 = (void *)*((_QWORD *)v6 + 10);
    *((_QWORD *)v6 + 10) = v15;

    v17 = objc_alloc_init(MEMORY[0x24BDF8C38]);
    v18 = (void *)*((_QWORD *)v6 + 11);
    *((_QWORD *)v6 + 11) = v17;

    v19 = objc_alloc_init(MEMORY[0x24BDF8C38]);
    v20 = (void *)*((_QWORD *)v6 + 9);
    *((_QWORD *)v6 + 9) = v19;

  }
  return (VSIdentityProviderRequestManager *)v6;
}

- (void)dealloc
{
  NSObject *v3;
  VSViewModel *v4;
  objc_super v5;
  uint8_t buf[4];
  VSIdentityProviderRequestManager *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl(&dword_2303C5000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating request manager %p", buf, 0xCu);
  }

  -[NSOperationQueue cancelAllOperations](self->_privateQueue, "cancelAllOperations");
  v4 = self->_viewModel;
  if (v4)
    -[VSIdentityProviderRequestManager _stopObservingViewModel:](self, "_stopObservingViewModel:", v4);
  -[VSIdentityProviderRequestManager _stopApplicationController](self, "_stopApplicationController");

  v5.receiver = self;
  v5.super_class = (Class)VSIdentityProviderRequestManager;
  -[VSIdentityProviderRequestManager dealloc](&v5, sel_dealloc);
}

- (void)enqueueRequest:(id)a3
{
  id v4;
  NSObject *v5;
  VSIdentityProviderRequestContext *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v4;
    _os_log_impl(&dword_2303C5000, v5, OS_LOG_TYPE_DEFAULT, "Will enque identity provider request in identity provider request manager: %@", (uint8_t *)&v14, 0xCu);
  }

  if (!v4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The request parameter must not be nil."));
  v6 = objc_alloc_init(VSIdentityProviderRequestContext);
  -[VSIdentityProviderRequestContext setRequest:](v6, "setRequest:", v4);
  v7 = (void *)MEMORY[0x24BDF8C38];
  objc_msgSend(v4, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "optionalWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderRequestManager setAccount:](self, "setAccount:", v9);

  v10 = (void *)MEMORY[0x24BDF8C38];
  objc_msgSend(v4, "storage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "optionalWithObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderRequestManager setStorage:](self, "setStorage:", v12);

  -[VSIdentityProviderRequestManager requestContexts](self, "requestContexts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v6);
  if (objc_msgSend(v13, "count") == 1)
    -[VSIdentityProviderRequestManager _processRequestContext:](self, "_processRequestContext:", v6);

}

- (void)sendErrorMessage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VSIdentityProviderRequestManager applicationController](self, "applicationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendErrorMessage:", v4);

}

- (void)setApplicationControllerTimerDelay:(double)a3
{
  if (self->_applicationControllerTimerDelay != a3)
  {
    self->_applicationControllerTimerDelay = a3;
    self->_applicationControllerTimerLeeway = a3 * 0.100000001;
  }
}

- (id)developerSettingsFetchOperation
{
  void *v3;
  VSDeveloperSettingsFetchOperation *v4;
  VSDeveloperSettingsFetchOperation *settingsFetchOperation;
  void *v6;

  -[VSIdentityProviderRequestManager settingsFetchOperation](self, "settingsFetchOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (VSDeveloperSettingsFetchOperation *)objc_alloc_init(MEMORY[0x24BDF8BD0]);
    settingsFetchOperation = self->_settingsFetchOperation;
    self->_settingsFetchOperation = v4;

  }
  -[VSIdentityProviderRequestManager settingsFetchOperation](self, "settingsFetchOperation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [self settingsFetchOperation] parameter must not be nil."));
  return -[VSIdentityProviderRequestManager settingsFetchOperation](self, "settingsFetchOperation");
}

- (void)_processRequestContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  VSApplicationController *v30;
  VSApplicationController *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  VSApplicationController *v38;
  NSObject *v39;
  id *v40;
  id *v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  uint64_t *v48;
  id v49;
  id location;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint8_t buf[4];
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v42 = a3;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 1;
  v4 = objc_alloc_init(MEMORY[0x24BDF8C78]);
  -[VSIdentityProviderRequestManager developerSettingsFetchOperation](self, "developerSettingsFetchOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v5);
  v6 = MEMORY[0x24BDAC760];
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = __59__VSIdentityProviderRequestManager__processRequestContext___block_invoke;
  v46[3] = &unk_24FE1B2A0;
  v40 = &v49;
  objc_copyWeak(&v49, &location);
  v48 = &v51;
  v7 = v4;
  v47 = v7;
  objc_msgSend(v5, "setCompletionBlock:", v46);
  -[VSIdentityProviderRequestManager privateQueue](self, "privateQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addOperation:", v5);

  objc_msgSend(v7, "wait");
  -[VSIdentityProviderRequestManager preferences](self, "preferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "shouldDisableRequestTimeouts") & 1) != 0)
  {

  }
  else
  {
    v10 = *((_BYTE *)v52 + 24) == 0;

    if (v10)
      goto LABEL_7;
  }
  VSDefaultLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2303C5000, v11, OS_LOG_TYPE_DEFAULT, "Application controller timer will not be started as it is disabled via developer settings or vsa-disable-timeouts preference", buf, 2u);
  }

  -[VSIdentityProviderRequestManager setAllowsApplicationControllerTimer:](self, "setAllowsApplicationControllerTimer:", 0, &v49);
LABEL_7:
  objc_msgSend(v42, "request", v40);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[VSIdentityProviderRequestManager _requestRequiresApplicationController:](self, "_requestRequiresApplicationController:", v12);

  if (v13)
  {
    VSDefaultLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2303C5000, v14, OS_LOG_TYPE_DEFAULT, "Request requires application controller.", buf, 2u);
    }

    v15 = objc_alloc_init(MEMORY[0x24BDF8C78]);
    v16 = objc_alloc(MEMORY[0x24BDF8C18]);
    -[VSIdentityProviderRequestManager identityProvider](self, "identityProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithIdentityProvider:", v17);

    v44[0] = v6;
    v44[1] = 3221225472;
    v44[2] = __59__VSIdentityProviderRequestManager__processRequestContext___block_invoke_25;
    v44[3] = &unk_24FE19778;
    v7 = v15;
    v45 = v7;
    objc_msgSend(v18, "setCompletionBlock:", v44);
    -[VSIdentityProviderRequestManager privateQueue](self, "privateQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addOperation:", v18);

    objc_msgSend(v7, "wait");
    objc_msgSend(v18, "error");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      VSErrorLogObject();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[VSIdentityProviderRequestManager _processRequestContext:].cold.1((uint64_t)v20, v21, v22, v23, v24, v25, v26, v27);

    }
    -[VSIdentityProviderRequestManager delegate](self, "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (-[VSIdentityProviderRequestManager identityProvider](self, "identityProvider"),
          v29 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v28, "identityProviderRequestManager:applicationControllerWithIdentityProvider:", self, v29),
          v30 = (VSApplicationController *)objc_claimAutoreleasedReturnValue(),
          v29,
          !v30))
    {
      v31 = [VSApplicationController alloc];
      -[VSIdentityProviderRequestManager identityProvider](self, "identityProvider");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[VSApplicationController initWithIdentityProvider:](v31, "initWithIdentityProvider:", v32);

      objc_msgSend(v18, "results");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        VSDefaultLogObject();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v56 = v33;
          _os_log_impl(&dword_2303C5000, v34, OS_LOG_TYPE_DEFAULT, "Providing user accounts to auth context: %@", buf, 0xCu);
        }

        -[VSApplicationController setUserAccounts:](v30, "setUserAccounts:", v33);
      }
      -[VSIdentityProviderRequestManager auditToken](self, "auditToken");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSApplicationController setAuditToken:](v30, "setAuditToken:", v35);

      objc_msgSend(v42, "request");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "accountProviderAuthenticationToken");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSApplicationController setAccountProviderAuthenticationToken:](v30, "setAccountProviderAuthenticationToken:", v37);

      if (!v30)
      {
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The applicationControllerOrNil parameter must not be nil."));
        v30 = 0;
      }
    }
    v38 = v30;
    -[VSIdentityProviderRequestManager setApplicationController:](self, "setApplicationController:", v38);
    -[VSApplicationController setDelegate:](v38, "setDelegate:", self);
    -[VSIdentityProviderRequestManager _startApplicationControllerTimer](self, "_startApplicationControllerTimer");
    -[VSApplicationController start](v38, "start");

  }
  else
  {
    VSDefaultLogObject();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2303C5000, v39, OS_LOG_TYPE_DEFAULT, "Request does not require application controller.", buf, 2u);
    }

    objc_initWeak((id *)buf, self);
    objc_copyWeak(&v43, (id *)buf);
    VSPerformBlockOnMainThread();
    objc_destroyWeak(&v43);
    objc_destroyWeak((id *)buf);
  }

  objc_destroyWeak(v41);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v51, 8);
}

void __59__VSIdentityProviderRequestManager__processRequestContext___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "forceUnwrapObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__VSIdentityProviderRequestManager__processRequestContext___block_invoke_2;
  v5[3] = &unk_24FE1A278;
  v5[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "unwrapObject:error:", v5, &__block_literal_global_24);
  objc_msgSend(*(id *)(a1 + 32), "signal");

}

uint64_t __59__VSIdentityProviderRequestManager__processRequestContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "requestTimeoutsDisabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __59__VSIdentityProviderRequestManager__processRequestContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  VSErrorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __59__VSIdentityProviderRequestManager__processRequestContext___block_invoke_3_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

uint64_t __59__VSIdentityProviderRequestManager__processRequestContext___block_invoke_25(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

void __59__VSIdentityProviderRequestManager__processRequestContext___block_invoke_31(uint64_t a1)
{
  id WeakRetained;

  VSRequireMainThread();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_completeCachedAccountMetadataRequest");

}

- (id)_currentRequestContext
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDF8C38];
  -[VSIdentityProviderRequestManager requestContexts](self, "requestContexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "optionalWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_currentRequest
{
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  v12 = objc_alloc_init(MEMORY[0x24BDF8C38]);
  -[VSIdentityProviderRequestManager _currentRequestContext](self, "_currentRequestContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__VSIdentityProviderRequestManager__currentRequest__block_invoke;
  v6[3] = &unk_24FE1B2C8;
  v6[4] = &v7;
  objc_msgSend(v3, "conditionallyUnwrapObject:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __51__VSIdentityProviderRequestManager__currentRequest__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDF8C38];
  objc_msgSend(a2, "request");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "optionalWithObject:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)_startApplicationControllerTimer
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  double v6;
  int64_t v7;
  double v8;
  uint64_t v9;
  dispatch_time_t v10;
  NSObject *v11;
  uint8_t v12[16];
  _QWORD handler[4];
  id v14;
  id location;

  if (-[VSIdentityProviderRequestManager allowsApplicationControllerTimer](self, "allowsApplicationControllerTimer"))
  {
    -[VSIdentityProviderRequestManager _stopApplicationControllerTimer](self, "_stopApplicationControllerTimer");
    v3 = MEMORY[0x24BDAC9B8];
    v4 = MEMORY[0x24BDAC9B8];
    v5 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v3);
    -[VSIdentityProviderRequestManager setApplicationControllerTimerSource:](self, "setApplicationControllerTimerSource:", v5);
    -[VSIdentityProviderRequestManager applicationControllerTimerDelay](self, "applicationControllerTimerDelay");
    v7 = (unint64_t)(v6 * 1000000000.0);
    -[VSIdentityProviderRequestManager applicationControllerTimerLeeway](self, "applicationControllerTimerLeeway");
    v9 = (unint64_t)(v8 * 1000000000.0);
    v10 = dispatch_time(0, v7);
    dispatch_source_set_timer(v5, v10, 0xFFFFFFFFFFFFFFFFLL, v9);
    objc_initWeak(&location, self);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __68__VSIdentityProviderRequestManager__startApplicationControllerTimer__block_invoke;
    handler[3] = &unk_24FE1A3F0;
    objc_copyWeak(&v14, &location);
    dispatch_source_set_event_handler(v5, handler);
    VSDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_2303C5000, v11, OS_LOG_TYPE_DEFAULT, "Will start application timer.", v12, 2u);
    }

    dispatch_resume(v5);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
}

void __68__VSIdentityProviderRequestManager__startApplicationControllerTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  VSDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2303C5000, v2, OS_LOG_TYPE_DEFAULT, "Application timer fired.", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    VSPrivateError();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    VSPublicError();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "currentApplicationControllerRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __68__VSIdentityProviderRequestManager__startApplicationControllerTimer__block_invoke_33;
    v11[3] = &unk_24FE1B2F0;
    v11[4] = WeakRetained;
    v12 = v5;
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __68__VSIdentityProviderRequestManager__startApplicationControllerTimer__block_invoke_2;
    v9[3] = &unk_24FE19E30;
    v9[4] = WeakRetained;
    v10 = v12;
    v8 = v12;
    objc_msgSend(v6, "conditionallyUnwrapObject:otherwise:", v11, v9);

  }
}

uint64_t __68__VSIdentityProviderRequestManager__startApplicationControllerTimer__block_invoke_33(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleApplicationControllerError:forRequest:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __68__VSIdentityProviderRequestManager__startApplicationControllerTimer__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeCurrentRequestWithError:", *(_QWORD *)(a1 + 40));
}

- (void)_stopApplicationControllerTimer
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  -[VSIdentityProviderRequestManager applicationControllerTimerSource](self, "applicationControllerTimerSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    VSDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2303C5000, v4, OS_LOG_TYPE_DEFAULT, "Stopping application timer.", v6, 2u);
    }

    -[VSIdentityProviderRequestManager applicationControllerTimerSource](self, "applicationControllerTimerSource");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v5);

    -[VSIdentityProviderRequestManager setApplicationControllerTimerSource:](self, "setApplicationControllerTimerSource:", 0);
  }
}

- (void)_handleApplicationControllerRequest:(id)a3 didCompleteWithResponse:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  VSDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[VSIdentityProviderRequestManager _handleApplicationControllerRequest:didCompleteWithResponse:]";
    v12 = 2048;
    v13 = objc_msgSend(v6, "type");
    _os_log_impl(&dword_2303C5000, v8, OS_LOG_TYPE_DEFAULT, "%s: request type %ld", (uint8_t *)&v10, 0x16u);
  }

  VSRequireMainThread();
  switch(objc_msgSend(v6, "type"))
  {
    case 1:
      if (!-[VSIdentityProviderRequestManager _handleAuthenticationRequest:didCompleteWithResponse:](self, "_handleAuthenticationRequest:didCompleteWithResponse:", v6, v7))goto LABEL_9;
      break;
    case 2:
      if (!-[VSIdentityProviderRequestManager _handleSilentAuthenticationRequest:didCompleteWithResponse:](self, "_handleSilentAuthenticationRequest:didCompleteWithResponse:", v6, v7))goto LABEL_9;
      break;
    case 3:
      if (!-[VSIdentityProviderRequestManager _handleAccountMetadataRequest:didCompleteWithResponse:](self, "_handleAccountMetadataRequest:didCompleteWithResponse:", v6, v7))goto LABEL_9;
      break;
    case 4:
      if (!-[VSIdentityProviderRequestManager _handleLogoutRequestDidComplete:](self, "_handleLogoutRequestDidComplete:", v6))goto LABEL_9;
      break;
    case 5:
      if (!-[VSIdentityProviderRequestManager _handleSTBOptOutDidComplete:](self, "_handleSTBOptOutDidComplete:", v6))
        goto LABEL_9;
      break;
    default:
LABEL_9:
      VSPublicError();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSIdentityProviderRequestManager _completeCurrentRequestWithError:](self, "_completeCurrentRequestWithError:", v9);

      break;
  }

}

- (BOOL)_handleAuthenticationRequest:(id)a3 didCompleteWithResponse:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  char *v16;
  NSObject *v17;
  BOOL v18;
  char *v19;
  _BOOL4 v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  int v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  VSRequireMainThread();
  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 136315138;
    v26 = "-[VSIdentityProviderRequestManager _handleAuthenticationRequest:didCompleteWithResponse:]";
    _os_log_impl(&dword_2303C5000, v6, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v25, 0xCu);
  }

  objc_msgSend(v5, "responseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
  {
    VSDefaultLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_2303C5000, v13, OS_LOG_TYPE_DEFAULT, "No response string.", (uint8_t *)&v25, 2u);
    }
    goto LABEL_17;
  }
  objc_msgSend(v5, "expectedAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  if (v9 != 1)
  {
    VSDefaultLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
      v19 = (char *)objc_claimAutoreleasedReturnValue();
      v25 = 138412290;
      v26 = v19;
      _os_log_impl(&dword_2303C5000, v13, OS_LOG_TYPE_DEFAULT, "Response action was %@.", (uint8_t *)&v25, 0xCu);

    }
LABEL_17:
    v18 = 0;
    goto LABEL_18;
  }
  -[VSIdentityProviderRequestManager account](self, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "forceUnwrapObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderRequestManager _notifyDidAuthenticateAccount:](self, "_notifyDidAuthenticateAccount:", v11);

  -[VSIdentityProviderRequestManager setViewModel:](self, "setViewModel:", 0);
  -[VSIdentityProviderRequestManager _currentRequest](self, "_currentRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "forceUnwrapObject");
  v13 = objc_claimAutoreleasedReturnValue();

  v14 = -[NSObject type](v13, "type");
  VSDefaultLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v14);
    v16 = (char *)objc_claimAutoreleasedReturnValue();
    v25 = 138412290;
    v26 = v16;
    _os_log_impl(&dword_2303C5000, v15, OS_LOG_TYPE_DEFAULT, "Request type: %@", (uint8_t *)&v25, 0xCu);

  }
  if (v14 == 4 || v14 == 1)
  {
    VSDefaultLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_2303C5000, v17, OS_LOG_TYPE_DEFAULT, "Make account or edit or silent-make account request type.", (uint8_t *)&v25, 2u);
    }

    -[VSIdentityProviderRequestManager _completeAuthenticationRequestWithApplicationControllerResponse:](self, "_completeAuthenticationRequestWithApplicationControllerResponse:", v5);
  }
  else
  {
    v21 = -[VSIdentityProviderRequestManager _requestRequiresApplicationControllerIgnoringAuthentication:](self, "_requestRequiresApplicationControllerIgnoringAuthentication:", v13);
    VSDefaultLogObject();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (v21)
    {
      if (v23)
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_2303C5000, v22, OS_LOG_TYPE_DEFAULT, "Request requires application controller", (uint8_t *)&v25, 2u);
      }

      -[VSIdentityProviderRequestManager _applicationControllerRequestWithIdentityProviderRequest:](self, "_applicationControllerRequestWithIdentityProviderRequest:", v13);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSIdentityProviderRequestManager _submitApplicationControllerRequest:](self, "_submitApplicationControllerRequest:", v24);

    }
    else
    {
      if (v23)
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_2303C5000, v22, OS_LOG_TYPE_DEFAULT, "Request does not require application controller", (uint8_t *)&v25, 2u);
      }

      -[VSIdentityProviderRequestManager _completeCachedAccountMetadataRequest](self, "_completeCachedAccountMetadataRequest");
    }
  }
  v18 = 1;
LABEL_18:

  return v18;
}

- (BOOL)_handleSilentAuthenticationRequest:(id)a3 didCompleteWithResponse:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  char *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v27;
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  VSRequireMainThread();
  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 136315138;
    v28 = "-[VSIdentityProviderRequestManager _handleSilentAuthenticationRequest:didCompleteWithResponse:]";
    _os_log_impl(&dword_2303C5000, v6, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v27, 0xCu);
  }

  -[VSIdentityProviderRequestManager _currentRequest](self, "_currentRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "forceUnwrapObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  VSDefaultLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v8, "type");
    v27 = 136315650;
    v28 = "-[VSIdentityProviderRequestManager _handleSilentAuthenticationRequest:didCompleteWithResponse:]";
    v29 = 2112;
    v30 = v8;
    v31 = 2048;
    v32 = v10;
    _os_log_impl(&dword_2303C5000, v9, OS_LOG_TYPE_DEFAULT, "%s: currentRequest %@, currentRequest type %ld", (uint8_t *)&v27, 0x20u);
  }

  objc_msgSend(v5, "responseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v5, "expectedAction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    VSDefaultLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v13);
      v15 = (char *)objc_claimAutoreleasedReturnValue();
      v27 = 138412290;
      v28 = v15;
      _os_log_impl(&dword_2303C5000, v14, OS_LOG_TYPE_DEFAULT, "Response action was %@.", (uint8_t *)&v27, 0xCu);

    }
    if (v13 == 1)
    {
      VSDefaultLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_2303C5000, v16, OS_LOG_TYPE_DEFAULT, "Response action is proceed.", (uint8_t *)&v27, 2u);
      }

      if (objc_msgSend(v8, "type") == 4)
      {
        VSDefaultLogObject();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_2303C5000, v17, OS_LOG_TYPE_DEFAULT, "silent-make account request type.", (uint8_t *)&v27, 2u);
        }

        -[VSIdentityProviderRequestManager _completeAuthenticationRequestWithApplicationControllerResponse:](self, "_completeAuthenticationRequestWithApplicationControllerResponse:", v5);
      }
      else if (-[VSIdentityProviderRequestManager _requestRequiresApplicationControllerIgnoringAuthentication:](self, "_requestRequiresApplicationControllerIgnoringAuthentication:", v8))
      {
        -[VSIdentityProviderRequestManager _applicationControllerRequestWithIdentityProviderRequest:](self, "_applicationControllerRequestWithIdentityProviderRequest:", v8);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSIdentityProviderRequestManager _submitApplicationControllerRequest:](self, "_submitApplicationControllerRequest:", v22);

      }
      else
      {
        -[VSIdentityProviderRequestManager _completeCachedAccountMetadataRequest](self, "_completeCachedAccountMetadataRequest");
      }
    }
    else
    {
      v19 = -[VSIdentityProviderRequestManager _canShowAuthenticationUI](self, "_canShowAuthenticationUI");
      VSDefaultLogObject();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v19)
      {
        if (v21)
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_2303C5000, v20, OS_LOG_TYPE_DEFAULT, "Can show authentication UI.", (uint8_t *)&v27, 2u);
        }

        -[VSIdentityProviderRequestManager _showAuthenticationUI](self, "_showAuthenticationUI");
      }
      else
      {
        if (v21)
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_2303C5000, v20, OS_LOG_TYPE_DEFAULT, "Silent auth failed and we can't show UI.", (uint8_t *)&v27, 2u);
        }

        objc_msgSend(v5, "authenticationScheme");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "responseStatusCode");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        VSPublicProviderRejectedError();
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        -[VSIdentityProviderRequestManager _completeCurrentRequestWithError:](self, "_completeCurrentRequestWithError:", v25);
      }
    }
  }
  else
  {
    VSDefaultLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_2303C5000, v18, OS_LOG_TYPE_DEFAULT, "No response string for silent authentication request.", (uint8_t *)&v27, 2u);
    }

  }
  return v11 != 0;
}

- (BOOL)_handleLogoutRequestDidComplete:(id)a3
{
  NSObject *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  VSRequireMainThread();
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[VSIdentityProviderRequestManager _handleLogoutRequestDidComplete:]";
    _os_log_impl(&dword_2303C5000, v4, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v6, 0xCu);
  }

  -[VSIdentityProviderRequestManager _completeDeletingAccountWithError:](self, "_completeDeletingAccountWithError:", 0);
  return 1;
}

- (BOOL)_handleSTBOptOutDidComplete:(id)a3
{
  VSRequireMainThread();
  -[VSIdentityProviderRequestManager _completeCurrentRequestWithApplicationControllerResponse:](self, "_completeCurrentRequestWithApplicationControllerResponse:", 0);
  return 1;
}

- (BOOL)_handleAccountMetadataRequest:(id)a3 didCompleteWithResponse:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  char *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  char *v17;
  NSObject *v18;
  int v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  VSRequireMainThread();
  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 136315138;
    v21 = "-[VSIdentityProviderRequestManager _handleAccountMetadataRequest:didCompleteWithResponse:]";
    _os_log_impl(&dword_2303C5000, v6, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v20, 0xCu);
  }

  objc_msgSend(v5, "responseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v5, "expectedAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

    VSDefaultLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
      v11 = (char *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v11;
      _os_log_impl(&dword_2303C5000, v10, OS_LOG_TYPE_DEFAULT, "Expected action is %@", (uint8_t *)&v20, 0xCu);

    }
    if (v9 != 2)
    {
      if (v9 == 1)
      {
        VSDefaultLogObject();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v20) = 0;
          _os_log_impl(&dword_2303C5000, v12, OS_LOG_TYPE_DEFAULT, "Expected to proceed.", (uint8_t *)&v20, 2u);
        }

        -[VSIdentityProviderRequestManager _completeCurrentRequestWithApplicationControllerResponse:](self, "_completeCurrentRequestWithApplicationControllerResponse:", v5);
        goto LABEL_21;
      }
      goto LABEL_18;
    }
    if (!-[VSIdentityProviderRequestManager _canShowAuthenticationUI](self, "_canShowAuthenticationUI"))
    {
LABEL_18:
      objc_msgSend(v5, "authenticationScheme");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "responseStatusCode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      VSPublicProviderRejectedError();
      v17 = (char *)objc_claimAutoreleasedReturnValue();

      VSDefaultLogObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138412290;
        v21 = v17;
        _os_log_impl(&dword_2303C5000, v18, OS_LOG_TYPE_DEFAULT, "Metadata request rejected: %@", (uint8_t *)&v20, 0xCu);
      }

      -[VSIdentityProviderRequestManager _completeCurrentRequestWithError:](self, "_completeCurrentRequestWithError:", v17);
      goto LABEL_21;
    }
    VSDefaultLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_2303C5000, v14, OS_LOG_TYPE_DEFAULT, "Expects to request UI and we can show UI.", (uint8_t *)&v20, 2u);
    }

    -[VSIdentityProviderRequestManager _showAuthenticationUI](self, "_showAuthenticationUI");
  }
  else
  {
    VSDefaultLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_2303C5000, v13, OS_LOG_TYPE_DEFAULT, "No repsonse string.", (uint8_t *)&v20, 2u);
    }

  }
LABEL_21:

  return v7 != 0;
}

- (void)_handleApplicationControllerError:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  void (**v16)(_QWORD, _QWORD);
  id v17;
  _QWORD v18[4];
  id v19;
  VSIdentityProviderRequestManager *v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  VSRequireMainThread();
  objc_initWeak(&location, self);
  v8 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __81__VSIdentityProviderRequestManager__handleApplicationControllerError_forRequest___block_invoke;
  v18[3] = &unk_24FE1B318;
  objc_copyWeak(&v21, &location);
  v9 = v7;
  v19 = v9;
  v20 = self;
  v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x2348B90BC](v18);
  -[VSIdentityProviderRequestManager _currentRequestContext](self, "_currentRequestContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "forceUnwrapObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (VSErrorIsPrivateError())
  {
    if ((objc_msgSend(v12, "attemptedVerificationStateReset") & 1) != 0)
    {
      VSPublicServiceTemporarilyUnavailableError();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v10)[2](v10, v13);

    }
    else
    {
      objc_msgSend(v12, "setAttemptedVerificationStateReset:", 1);
      v14[0] = v8;
      v14[1] = 3221225472;
      v14[2] = __81__VSIdentityProviderRequestManager__handleApplicationControllerError_forRequest___block_invoke_5;
      v14[3] = &unk_24FE1B390;
      objc_copyWeak(&v17, &location);
      v15 = v9;
      v16 = v10;
      -[VSIdentityProviderRequestManager _resetVerificationStateWithCompletionHandler:](self, "_resetVerificationStateWithCompletionHandler:", v14);

      objc_destroyWeak(&v17);
    }
  }
  else
  {
    ((void (**)(_QWORD, id))v10)[2](v10, v6);
  }

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __81__VSIdentityProviderRequestManager__handleApplicationControllerError_forRequest___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v5 = objc_msgSend(a1[4], "type");
    switch(v5)
    {
      case 1:
        objc_msgSend(a1[5], "_currentRequest");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = MEMORY[0x24BDAC760];
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __81__VSIdentityProviderRequestManager__handleApplicationControllerError_forRequest___block_invoke_2;
        v18[3] = &unk_24FE1A9C0;
        v18[4] = a1[5];
        v19 = v3;
        objc_msgSend(v6, "conditionallyUnwrapObject:", v18);

        objc_msgSend(WeakRetained, "viewModel");
        v13 = v7;
        v14 = 3221225472;
        v15 = __81__VSIdentityProviderRequestManager__handleApplicationControllerError_forRequest___block_invoke_3;
        v16 = &unk_24FE19778;
        v17 = (id)objc_claimAutoreleasedReturnValue();
        v8 = v17;
        VSPrivateAccountValidationErrorWithRecoveryHandler();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setError:", v9);
        objc_msgSend(v8, "setValidationState:", 4);

        goto LABEL_9;
      case 3:
        objc_msgSend(a1[5], "_currentRequest");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = MEMORY[0x24BDAC760];
        v11[1] = 3221225472;
        v11[2] = __81__VSIdentityProviderRequestManager__handleApplicationControllerError_forRequest___block_invoke_4;
        v11[3] = &unk_24FE1A9C0;
        v11[4] = a1[5];
        v12 = v3;
        objc_msgSend(v10, "conditionallyUnwrapObject:", v11);

        break;
      case 4:
        objc_msgSend(WeakRetained, "_handleLogoutRequestDidComplete:", a1[4]);
        goto LABEL_9;
    }
    objc_msgSend(WeakRetained, "_completeCurrentRequestWithError:", v3);
  }
LABEL_9:

}

void __81__VSIdentityProviderRequestManager__handleApplicationControllerError_forRequest___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identityProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDeveloper");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "identityProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "forceUnwrapObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "identityProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isFullySupportedForRequestsExpectingAuthenticationSchemes:", 0);

    objc_msgSend(v11, "requestingAppAdamID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF8C28], "recordSignInEventWithProviderIdentifier:supportedProvider:channelAdamID:signInType:error:", v7, v9, v10, *MEMORY[0x24BDF8E98], *(_QWORD *)(a1 + 40));

  }
}

uint64_t __81__VSIdentityProviderRequestManager__handleApplicationControllerError_forRequest___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setError:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setValidationState:", 0);
}

void __81__VSIdentityProviderRequestManager__handleApplicationControllerError_forRequest___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identityProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDeveloper");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "identityProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "forceUnwrapObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "requestingAppAdamID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [identityProviderRequest requestingAppAdamID] parameter must not be nil."));
    objc_msgSend(v11, "requestingAppAdamID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(*(id *)(a1 + 32), "_requestRequiresApplicationController:", v11);
    objc_msgSend(MEMORY[0x24BDF8C28], "recordMetadataRequestWithProviderIdentifier:channelAdamID:fulfilledByProvider:error:", v7, v9, v10, *(_QWORD *)(a1 + 40));

  }
}

void __81__VSIdentityProviderRequestManager__handleApplicationControllerError_forRequest___block_invoke_5(id *a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = MEMORY[0x24BDAC760];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __81__VSIdentityProviderRequestManager__handleApplicationControllerError_forRequest___block_invoke_6;
    v9[3] = &unk_24FE1B340;
    v9[4] = WeakRetained;
    v10 = a1[4];
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __81__VSIdentityProviderRequestManager__handleApplicationControllerError_forRequest___block_invoke_7;
    v7[3] = &unk_24FE1B368;
    v8 = a1[5];
    objc_msgSend(v6, "unwrapObject:error:", v9, v7);

  }
}

uint64_t __81__VSIdentityProviderRequestManager__handleApplicationControllerError_forRequest___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_submitApplicationControllerRequest:", *(_QWORD *)(a1 + 40));
}

void __81__VSIdentityProviderRequestManager__handleApplicationControllerError_forRequest___block_invoke_7(uint64_t a1)
{
  id v2;

  VSPublicServiceTemporarilyUnavailableError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_startDeletingAccount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  VSRequireMainThread();
  -[VSIdentityProviderRequestManager account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "forceUnwrapObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSIdentityProviderRequestManager storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forceUnwrapObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "authenticationToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "forceUnwrapObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSIdentityProviderRequestManager requestFactory](self, "requestFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logoutApplicationControllerRequestWithAuthenticationToken:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSIdentityProviderRequestManager identityProvider](self, "identityProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isDeveloper");

  if ((v13 & 1) == 0)
  {
    objc_msgSend(v4, "identityProviderID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "forceUnwrapObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF8C28], "recordSignOutEventWithProviderIdentifier:", v15);
  }
  objc_initWeak(&location, self);
  v22[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __57__VSIdentityProviderRequestManager__startDeletingAccount__block_invoke;
  v18[3] = &unk_24FE1B3E0;
  objc_copyWeak(&v20, &location);
  v17 = v11;
  v19 = v17;
  objc_msgSend(v7, "removeAccounts:withCompletionHandler:", v16, v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __57__VSIdentityProviderRequestManager__startDeletingAccount__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  char v9;

  v5 = a3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v9 = a2;
  v6 = *(id *)(a1 + 32);
  v7 = v5;
  VSPerformBlockOnMainThread();

  objc_destroyWeak(&v8);
}

void __57__VSIdentityProviderRequestManager__startDeletingAccount__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      v3 = objc_alloc_init(MEMORY[0x24BDF8C38]);
      objc_msgSend(WeakRetained, "setAccount:", v3);

      objc_msgSend(WeakRetained, "storage");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "forceUnwrapObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "channelsCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_removeSavedAccountChannelsWithCompletionHandler:", 0);

      objc_msgSend(v5, "privacyFacade");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "reset");

      objc_msgSend(WeakRetained, "_submitApplicationControllerRequest:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      v8 = *(void **)(a1 + 40);
      if (!v8)
      {
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The underlyingErrorOrNil parameter must not be nil."));
        v8 = *(void **)(a1 + 40);
      }
      v9 = v8;
      objc_msgSend(WeakRetained, "viewModel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v12;
      VSPrivateAccountDeletionErrorWithRecoveryHandler();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_completeDeletingAccountWithError:", v11);

    }
  }

}

uint64_t __57__VSIdentityProviderRequestManager__startDeletingAccount__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setError:", 0);
}

- (void)_completeDeletingAccountWithError:(id)a3
{
  id v4;

  v4 = a3;
  VSRequireMainThread();
  if (v4)
    -[VSIdentityProviderRequestManager _completeCurrentRequestWithError:](self, "_completeCurrentRequestWithError:", v4);
  else
    -[VSIdentityProviderRequestManager _completeCurrentRequestWithApplicationControllerResponse:](self, "_completeCurrentRequestWithApplicationControllerResponse:", 0);

}

- (void)_updateAccountWithAccountAuthentication:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VSRequireMainThread();
  if (!v4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The accountAuthentication parameter must not be nil."));
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__6;
  v20 = __Block_byref_object_dispose__6;
  -[VSIdentityProviderRequestManager account](self, "account");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)v17[5];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __76__VSIdentityProviderRequestManager__updateAccountWithAccountAuthentication___block_invoke_2;
  v15[3] = &unk_24FE1B448;
  v15[4] = self;
  v15[5] = &v16;
  objc_msgSend(v5, "conditionallyUnwrapObject:otherwise:", &__block_literal_global_51, v15);
  objc_msgSend((id)v17[5], "forceUnwrapObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  VSDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v6;
    v24 = 2112;
    v25 = v4;
    _os_log_impl(&dword_2303C5000, v7, OS_LOG_TYPE_DEFAULT, "Will update account %@ with authentication %@.", buf, 0x16u);
  }

  -[VSIdentityProviderRequestManager identityProvider](self, "identityProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "providerID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentityProviderID:", v9);

  -[VSIdentityProviderRequestManager identityProvider](self, "identityProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOptionalIdentityProviderDisplayName:", v11);

  objc_msgSend(v4, "username");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
    objc_msgSend(v6, "setUsername:", v12);
  objc_msgSend(v4, "appBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreferredAppID:", v13);

  objc_msgSend(v6, "setSynchronizable:", objc_msgSend(v4, "isSynchronizable"));
  objc_msgSend(v4, "authenticationToken");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAuthenticationToken:", v14);

  _Block_object_dispose(&v16, 8);
}

void __76__VSIdentityProviderRequestManager__updateAccountWithAccountAuthentication___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BDF8B58]);
  objc_msgSend(MEMORY[0x24BDF8C38], "optionalWithObject:", v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "setAccount:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "setDidCreateAccount:", 1);

}

- (void)_completeCachedAccountMetadataRequest
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  VSRequireMainThread();
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[VSIdentityProviderRequestManager _completeCachedAccountMetadataRequest]";
    _os_log_impl(&dword_2303C5000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v4, 0xCu);
  }

  -[VSIdentityProviderRequestManager _completeCurrentRequestWithApplicationControllerResponse:](self, "_completeCurrentRequestWithApplicationControllerResponse:", 0);
}

- (void)_completeAuthenticationRequestWithApplicationControllerResponse:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  double v7;
  NSObject *v8;
  char *v9;
  dispatch_time_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VSRequireMainThread();
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[VSIdentityProviderRequestManager _completeAuthenticationRequestWithApplicationControllerResponse:]";
    _os_log_impl(&dword_2303C5000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  -[VSIdentityProviderRequestManager _requestCompletionDelay](self, "_requestCompletionDelay");
  if (v6 <= 0.0)
  {
    -[VSIdentityProviderRequestManager _completeCurrentRequestWithApplicationControllerResponse:](self, "_completeCurrentRequestWithApplicationControllerResponse:", v4);
  }
  else
  {
    v7 = v6;
    VSDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl(&dword_2303C5000, v8, OS_LOG_TYPE_DEFAULT, "Delaying completion of request by %@ seconds", buf, 0xCu);

    }
    objc_initWeak((id *)buf, self);
    v10 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __100__VSIdentityProviderRequestManager__completeAuthenticationRequestWithApplicationControllerResponse___block_invoke;
    v11[3] = &unk_24FE19B80;
    objc_copyWeak(&v13, (id *)buf);
    v12 = v4;
    dispatch_after(v10, MEMORY[0x24BDAC9B8], v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }

}

void __100__VSIdentityProviderRequestManager__completeAuthenticationRequestWithApplicationControllerResponse___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_completeCurrentRequestWithApplicationControllerResponse:", *(_QWORD *)(a1 + 32));

}

- (void)_completeCurrentRequestWithApplicationControllerResponse:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VSRequireMainThread();
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[VSIdentityProviderRequestManager _completeCurrentRequestWithApplicationControllerResponse:]";
    _os_log_impl(&dword_2303C5000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  v6 = objc_alloc_init(MEMORY[0x24BDF8CC8]);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF8CA8]), "initWithOperation:timeout:", v6, 10.0);
  v12 = v6;
  v13 = v4;
  v8 = v4;
  v9 = v6;
  VSMainThreadOperationWithBlock();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addDependency:", v7);
  VSEnqueueCompletionOperation();
  -[VSIdentityProviderRequestManager privateQueue](self, "privateQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addOperation:", v7);

}

void __93__VSIdentityProviderRequestManager__completeCurrentRequestWithApplicationControllerResponse___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  VSRequireMainThread();
  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "object");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_completeCurrentRequestWithApplicationControllerResponse:verificationData:", *(_QWORD *)(a1 + 48), v4);
}

- (void)_completeCurrentRequestWithApplicationControllerResponse:(id)a3 verificationData:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  VSIdentityProviderResponse *v10;
  void *v11;
  VSIdentityProviderResponse *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  char v29;
  _BOOL8 v30;
  void *v31;
  _QWORD *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void *v39;
  VSIdentityProviderResponse *v40;
  uint8_t buf[4];
  const char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v34 = a4;
  VSRequireMainThread();
  VSDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v42 = "-[VSIdentityProviderRequestManager _completeCurrentRequestWithApplicationControllerResponse:verificationData:]";
    _os_log_impl(&dword_2303C5000, v7, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  -[VSIdentityProviderRequestManager _currentRequest](self, "_currentRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "forceUnwrapObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(VSIdentityProviderResponse);
  -[VSIdentityProviderRequestManager account](self, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = MEMORY[0x24BDAC760];
  v37 = 3221225472;
  v38 = __110__VSIdentityProviderRequestManager__completeCurrentRequestWithApplicationControllerResponse_verificationData___block_invoke;
  v39 = &unk_24FE19DE0;
  v12 = v10;
  v40 = v12;
  objc_msgSend(v11, "conditionallyUnwrapObject:", &v36);

  v13 = objc_msgSend(v9, "type");
  if (v13 == 3)
  {
    objc_msgSend(v9, "accountMetadataRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "forceUnwrapObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "authenticationScheme");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "responseStatusCode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "responseString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSIdentityProviderRequestManager _accountMetadataWithAuthenticationScheme:responseStatusCode:responseString:accountMetadataRequest:verificationData:](self, "_accountMetadataWithAuthenticationScheme:responseStatusCode:responseString:accountMetadataRequest:verificationData:", v16, v17, v18, v15, v34);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[VSIdentityProviderResponse setAccountMetadata:](v12, "setAccountMetadata:", v19);
  }
  -[VSIdentityProviderResponse setDidCreateAccount:](v12, "setDidCreateAccount:", -[VSIdentityProviderRequestManager didCreateAccount](self, "didCreateAccount", v34, v36, v37, v38, v39));
  -[VSIdentityProviderRequestManager identityProvider](self, "identityProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "uniqueID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "forceUnwrapObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSIdentityProviderRequestManager identityProvider](self, "identityProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isFullySupportedForRequestsExpectingAuthenticationSchemes:", 0);

  objc_msgSend(v9, "requestingAppAdamID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VSIdentityProviderRequestManager didCreateAccount](self, "didCreateAccount")
    && (-[VSIdentityProviderRequestManager identityProvider](self, "identityProvider"),
        v26 = (void *)objc_claimAutoreleasedReturnValue(),
        v27 = objc_msgSend(v26, "isDeveloper"),
        v26,
        (v27 & 1) == 0))
  {
    v32 = (_QWORD *)MEMORY[0x24BDF8E98];
    if (v13 != 1)
      v32 = (_QWORD *)MEMORY[0x24BDF8E90];
    objc_msgSend(MEMORY[0x24BDF8C28], "recordSignInEventWithProviderIdentifier:supportedProvider:channelAdamID:signInType:error:", v22, v24, v25, *v32, 0);
  }
  else if (objc_msgSend(v9, "type") == 3)
  {
    -[VSIdentityProviderRequestManager identityProvider](self, "identityProvider");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isDeveloper");

    if ((v29 & 1) == 0)
    {
      v30 = -[VSIdentityProviderRequestManager _requestRequiresApplicationController:](self, "_requestRequiresApplicationController:", v9);
      v31 = (void *)MEMORY[0x24BDF8C28];
      if (!v25)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The channelBundleIdentifier parameter must not be nil."));
      objc_msgSend(v31, "recordMetadataRequestWithProviderIdentifier:channelAdamID:fulfilledByProvider:error:", v22, v25, v30, 0);
    }
  }
  objc_msgSend(MEMORY[0x24BDF8BF0], "failableWithObject:", v12);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderRequestManager _completeCurrentRequestWithResult:](self, "_completeCurrentRequestWithResult:", v33);

}

uint64_t __110__VSIdentityProviderRequestManager__completeCurrentRequestWithApplicationControllerResponse_verificationData___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAccount:", a2);
}

- (void)_completeCurrentRequestWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VSRequireMainThread();
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[VSIdentityProviderRequestManager _completeCurrentRequestWithError:]";
    _os_log_impl(&dword_2303C5000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDF8BF0], "failableWithError:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSIdentityProviderRequestManager _completeCurrentRequestWithResult:](self, "_completeCurrentRequestWithResult:", v6);
}

- (void)_completeCurrentRequestWithResult:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v4;
    _os_log_impl(&dword_2303C5000, v5, OS_LOG_TYPE_DEFAULT, "Completing request with result: %@", (uint8_t *)&v15, 0xCu);
  }

  VSRequireMainThread();
  -[VSIdentityProviderRequestManager _stopApplicationController](self, "_stopApplicationController");
  -[VSIdentityProviderRequestManager setDidCreateAccount:](self, "setDidCreateAccount:", 0);
  -[VSIdentityProviderRequestManager setViewModel:](self, "setViewModel:", 0);
  v6 = objc_alloc_init(MEMORY[0x24BDF8C38]);
  -[VSIdentityProviderRequestManager setAccount:](self, "setAccount:", v6);

  v7 = objc_alloc_init(MEMORY[0x24BDF8C38]);
  -[VSIdentityProviderRequestManager setStorage:](self, "setStorage:", v7);

  -[VSIdentityProviderRequestManager _currentRequestContext](self, "_currentRequestContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "forceUnwrapObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSIdentityProviderRequestManager requestContexts](self, "requestContexts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v9);
  -[VSIdentityProviderRequestManager delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "request");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identityProviderRequestManager:finishedRequest:withResult:", self, v12, v4);

  if (objc_msgSend(v10, "count"))
  {
    -[VSIdentityProviderRequestManager _currentRequestContext](self, "_currentRequestContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "forceUnwrapObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSIdentityProviderRequestManager _processRequestContext:](self, "_processRequestContext:", v14);

  }
}

- (id)_applicationControllerRequestWithIdentityProviderRequest:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v4 = a3;
  VSRequireMainThread();
  v5 = objc_msgSend(v4, "type");
  if (v5 == 2)
  {
    -[VSIdentityProviderRequestManager account](self, "account");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "forceUnwrapObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "authenticationToken");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "forceUnwrapObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[VSIdentityProviderRequestManager requestFactory](self, "requestFactory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logoutApplicationControllerRequestWithAuthenticationToken:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5 != 3)
    {
      v18 = (void *)MEMORY[0x24BDBCE88];
      v17 = *MEMORY[0x24BDBCAB8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "raise:format:", v17, CFSTR("Invalid request tyoe: %@"), v19);

      goto LABEL_8;
    }
    objc_msgSend(v4, "accountMetadataRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "forceUnwrapObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[VSIdentityProviderRequestManager account](self, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "forceUnwrapObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "authenticationToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "forceUnwrapObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[VSIdentityProviderRequestManager requestFactory](self, "requestFactory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accountMetadataApplicationControllerRequestWithAccountMetadataRequest:authenticationToken:", v7, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!v13)
  {
    v17 = *MEMORY[0x24BDBCAB8];
LABEL_8:
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", v17, CFSTR("The request parameter must not be nil."));
    v13 = 0;
  }

  return v13;
}

- (id)_identityProviderAlertWithApplicationControllerAlert:(id)a3
{
  id v3;
  VSIdentityProviderAlert *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  VSIdentityProviderAlertAction *v14;
  void *v15;
  void *v16;
  VSIdentityProviderAlert *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(VSIdentityProviderAlert);
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderAlert setTitle:](v4, "setTitle:", v5);

  objc_msgSend(v3, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v4;
  -[VSIdentityProviderAlert setMessage:](v4, "setMessage:", v6);

  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v3, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
        v14 = objc_alloc_init(VSIdentityProviderAlertAction);
        objc_msgSend(v13, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSIdentityProviderAlertAction setTitle:](v14, "setTitle:", v15);

        -[VSIdentityProviderAlertAction setStyle:](v14, "setStyle:", objc_msgSend(v13, "style"));
        objc_msgSend(v13, "callback");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSIdentityProviderAlertAction setCallback:](v14, "setCallback:", v16);

        objc_msgSend(v7, "addObject:", v14);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  -[VSIdentityProviderAlert setActions:](v18, "setActions:", v7);
  return v18;
}

- (void)_stopApplicationController
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[VSIdentityProviderRequestManager _stopApplicationController]";
    _os_log_impl(&dword_2303C5000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v7, 0xCu);
  }

  -[VSIdentityProviderRequestManager _stopApplicationControllerTimer](self, "_stopApplicationControllerTimer");
  v4 = objc_alloc_init(MEMORY[0x24BDF8C38]);
  -[VSIdentityProviderRequestManager setCurrentApplicationControllerRequest:](self, "setCurrentApplicationControllerRequest:", v4);

  -[VSIdentityProviderRequestManager applicationController](self, "applicationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", 0);

  -[VSIdentityProviderRequestManager applicationController](self, "applicationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stop");

  -[VSIdentityProviderRequestManager setApplicationController:](self, "setApplicationController:", 0);
}

- (void)_submitApplicationControllerRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The request parameter must not be nil."));
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[VSIdentityProviderRequestManager _submitApplicationControllerRequest:]";
    _os_log_impl(&dword_2303C5000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v8, 0xCu);
  }

  -[VSIdentityProviderRequestManager _startApplicationControllerTimer](self, "_startApplicationControllerTimer");
  objc_msgSend(MEMORY[0x24BDF8C38], "optionalWithObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderRequestManager setCurrentApplicationControllerRequest:](self, "setCurrentApplicationControllerRequest:", v6);

  -[VSIdentityProviderRequestManager applicationController](self, "applicationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "submitRequest:", v4);

}

- (void)_showAuthenticationUI
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  VSRequireMainThread();
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[VSIdentityProviderRequestManager _showAuthenticationUI]";
    _os_log_impl(&dword_2303C5000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v6, 0xCu);
  }

  -[VSIdentityProviderRequestManager _startApplicationControllerTimer](self, "_startApplicationControllerTimer");
  -[VSIdentityProviderRequestManager _supportedProviderAuthenticationToken](self, "_supportedProviderAuthenticationToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderRequestManager applicationController](self, "applicationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "showAuthenticationUserInterfaceWithAuthenticationToken:", v4);

}

- (void)setViewModel:(id)a3
{
  VSViewModel *v5;
  VSViewModel *v6;
  VSViewModel *v7;

  v7 = (VSViewModel *)a3;
  VSRequireMainThread();
  v5 = self->_viewModel;
  v6 = v5;
  if (v5 != v7)
  {
    if (v5)
      -[VSIdentityProviderRequestManager _stopObservingViewModel:](self, "_stopObservingViewModel:", v5);
    objc_storeStrong((id *)&self->_viewModel, a3);
    if (v7)
      -[VSIdentityProviderRequestManager _startObservingViewModel:](self, "_startObservingViewModel:", v7);
  }

}

- (void)_startObservingViewModel:(id)a3
{
  id v4;

  v4 = a3;
  VSRequireMainThread();
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("validationState"), 3, kVSKeyValueObservingContext_ViewModelValidationState_0);

}

- (void)_stopObservingViewModel:(id)a3
{
  objc_msgSend(a3, "removeObserver:forKeyPath:context:", self, CFSTR("validationState"), kVSKeyValueObservingContext_ViewModelValidationState_0);
}

- (void)_notifyDidAuthenticateAccount:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VSRequireMainThread();
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[VSIdentityProviderRequestManager _notifyDidAuthenticateAccount:]";
    _os_log_impl(&dword_2303C5000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v9, 0xCu);
  }

  -[VSIdentityProviderRequestManager delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[VSIdentityProviderRequestManager _currentRequest](self, "_currentRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "forceUnwrapObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identityProviderRequestManager:didAuthenticateAccount:forRequest:", self, v4, v8);

  }
}

- (BOOL)_requestRequiresApplicationControllerIgnoringAuthentication:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 3)
  {
    objc_msgSend(v4, "accountMetadataRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "forceUnwrapObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[VSIdentityProviderRequestManager _supportedProviderAuthenticationToken](self, "_supportedProviderAuthenticationToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "attributeNames");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count") != 0;

    }
    else
    {
      v9 = objc_msgSend(v6, "isInterruptionAllowed");
    }

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)_requestRequiresApplicationController:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  LOBYTE(self) = -[VSIdentityProviderRequestManager _requestRequiresApplicationControllerIgnoringAuthentication:](self, "_requestRequiresApplicationControllerIgnoringAuthentication:", v4);
  v5 = objc_msgSend(v4, "forceAuthentication");

  return v5 | self;
}

- (double)_requestCompletionDelay
{
  void *v3;
  double result;

  VSRequireMainThread();
  -[VSIdentityProviderRequestManager viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0.0;
  -[VSIdentityProviderRequestManager requestCompletionDelayAfterShowingUserInterface](self, "requestCompletionDelayAfterShowingUserInterface");
  return result;
}

- (BOOL)_canShowAuthenticationUI
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[VSIdentityProviderRequestManager _currentRequest](self, "_currentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "forceUnwrapObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "allowsUI"))
  {
    -[VSIdentityProviderRequestManager viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_accountMetadataWithAuthenticationScheme:(id)a3 responseStatusCode:(id)a4 responseString:(id)a5 accountMetadataRequest:(id)a6 verificationData:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  VSRequireMainThread();
  if (!v15)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The accountMetadataRequest parameter must not be nil."));
  v17 = objc_alloc_init(MEMORY[0x24BDF8B78]);
  objc_msgSend(v17, "setVerificationData:", v16);
  if (objc_msgSend(v15, "includeAccountProviderIdentifier"))
  {
    -[VSIdentityProviderRequestManager identityProvider](self, "identityProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "providerID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "forceUnwrapObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAccountProviderIdentifier:", v20);

  }
  if (objc_msgSend(v15, "includeAuthenticationExpirationDate"))
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__6;
    v30 = __Block_byref_object_dispose__6;
    v31 = 0;
    -[VSIdentityProviderRequestManager account](self, "account");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __151__VSIdentityProviderRequestManager__accountMetadataWithAuthenticationScheme_responseStatusCode_responseString_accountMetadataRequest_verificationData___block_invoke;
    v25[3] = &unk_24FE1B470;
    v25[4] = &v26;
    objc_msgSend(v21, "conditionallyUnwrapObject:", v25);

    objc_msgSend((id)v27[5], "expirationDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAuthenticationExpirationDate:", v22);

    _Block_object_dispose(&v26, 8);
  }
  if (v14)
  {
    v23 = objc_alloc_init(MEMORY[0x24BDF8B80]);
    objc_msgSend(v23, "setAuthenticationScheme:", v12);
    objc_msgSend(v23, "setStatus:", v13);
    objc_msgSend(v23, "setBody:", v14);
    objc_msgSend(v17, "setAccountProviderResponse:", v23);

  }
  return v17;
}

void __151__VSIdentityProviderRequestManager__accountMetadataWithAuthenticationScheme_responseStatusCode_responseString_accountMetadataRequest_verificationData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "authenticationToken");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "forceUnwrapObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)_resetVerificationStateWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v4 = a3;
  VSRequireMainThread();
  v5 = objc_alloc_init(MEMORY[0x24BDF8CD0]);
  -[VSIdentityProviderRequestManager auditToken](self, "auditToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAuditToken:", v6);

  -[VSIdentityProviderRequestManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_255ED39D8))
  {
    v8 = v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "verificationStateResetOperationForIdentityProviderRequestManager:", self);
      v9 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v9;
    }

  }
  v14 = MEMORY[0x24BDAC760];
  v15 = v5;
  v16 = v4;
  v10 = v5;
  v11 = v4;
  VSMainThreadOperationWithBlock();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addDependency:", v10, v14, 3221225472, __81__VSIdentityProviderRequestManager__resetVerificationStateWithCompletionHandler___block_invoke, &unk_24FE1A728);
  VSEnqueueCompletionOperation();
  -[VSIdentityProviderRequestManager privateQueue](self, "privateQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addOperation:", v10);

}

void __81__VSIdentityProviderRequestManager__resetVerificationStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "result");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "forceUnwrapObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

  }
}

- (id)_accountChannelsWithChannelIDs:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  VSRequireMainThread();
  v5 = objc_alloc_init(MEMORY[0x24BDF8B60]);
  -[VSIdentityProviderRequestManager identityProvider](self, "identityProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "providerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "forceUnwrapObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProviderID:", v8);

  objc_msgSend(v5, "setChannelIDs:", v4);
  return v5;
}

- (void)_enqueueSubscriptionOperationIfRequiredForResponse:(id)a3 asDependencyOf:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  VSIdentityProviderSubscriptionOperation *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "subscriptionsToAdd");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {

LABEL_4:
    VSDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "subscriptionsToRemoveByBundleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");
      objc_msgSend(v6, "subscriptionsToAdd");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 134218240;
      v21 = v13;
      v22 = 2048;
      v23 = objc_msgSend(v14, "count");
      _os_log_impl(&dword_2303C5000, v11, OS_LOG_TYPE_DEFAULT, "Will enqueue identity provider subscription operation for %lu subscription removals and %lu subscription registrations.", (uint8_t *)&v20, 0x16u);

    }
    v15 = objc_alloc_init(VSIdentityProviderSubscriptionOperation);
    -[VSIdentityProviderRequestManager identityProvider](self, "identityProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSIdentityProviderSubscriptionOperation setIdentityProvider:](v15, "setIdentityProvider:", v16);

    objc_msgSend(v6, "subscriptionsToRemoveByBundleID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSIdentityProviderSubscriptionOperation setSubscriptionsToRemoveByBundleID:](v15, "setSubscriptionsToRemoveByBundleID:", v17);

    objc_msgSend(v6, "subscriptionsToAdd");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSIdentityProviderSubscriptionOperation setSubscriptionsToAdd:](v15, "setSubscriptionsToAdd:", v18);

    -[VSIdentityProviderRequestManager privateQueue](self, "privateQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addOperation:", v15);

    objc_msgSend(v7, "addDependency:", v15);
    goto LABEL_7;
  }
  objc_msgSend(v6, "subscriptionsToRemoveByBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
    goto LABEL_4;
  VSDefaultLogObject();
  v15 = (VSIdentityProviderSubscriptionOperation *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v15->super.super.super, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_2303C5000, &v15->super.super.super, OS_LOG_TYPE_DEFAULT, "No subscription changes, skipping subscription operation.", (uint8_t *)&v20, 2u);
  }
LABEL_7:

}

- (void)_enqueueUserAccountUpdateOperationIfRequiredForResponse:(id)a3 asDependencyOf:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  _BOOL4 v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  uint64_t v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v45 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  objc_msgSend(v6, "applicationUserAccounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v46 = v6;
  if (v9)
  {
    v47 = v7;
    v10 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    -[VSIdentityProviderRequestManager identityProvider](self, "identityProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "nonChannelAppDescriptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v54;
      v16 = *MEMORY[0x24BDBCAB8];
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v54 != v15)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          objc_msgSend(v18, "bundleID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19)
            objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", v16, CFSTR("The [appDescription bundleID] parameter must not be nil."));
          objc_msgSend(v18, "bundleID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v20);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
      }
      while (v14);
    }

    v21 = (void *)MEMORY[0x24BDF8BA8];
    v6 = v46;
    objc_msgSend(v46, "applicationUserAccounts");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [response applicationUserAccounts] parameter must not be nil."));
    objc_msgSend(v46, "applicationUserAccounts");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSIdentityProviderRequestManager identityProvider](self, "identityProvider");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "providerID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "forceUnwrapObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "userAccountsFromApplicationUserAccounts:ForProviderID:allowedBundleIDs:", v23, v26, v10);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  v27 = objc_msgSend(v7, "count");
  VSDefaultLogObject();
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
  if (v27)
  {
    if (v29)
    {
      v30 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 134217984;
      v59 = v30;
      _os_log_impl(&dword_2303C5000, v28, OS_LOG_TYPE_DEFAULT, "Will enqueue identity provider user accounts update operation for %lu user accounts", buf, 0xCu);
    }

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v48 = v7;
    v31 = v7;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v50;
      v35 = *MEMORY[0x24BDF8E80];
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v50 != v34)
            objc_enumerationMutation(v31);
          v37 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
          -[VSIdentityProviderRequestManager identityProvider](self, "identityProvider");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "providerID");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "forceUnwrapObject");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setModifierIdentifier:", v40);

          objc_msgSend(v37, "setModifierType:", v35);
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      }
      while (v33);
    }

    v41 = objc_alloc(MEMORY[0x24BDF8C20]);
    -[VSIdentityProviderRequestManager identityProvider](self, "identityProvider");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v41, "initWithIdentityProvider:userAccounts:", v42, v31);

    -[VSIdentityProviderRequestManager privateQueue](self, "privateQueue");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addOperation:", v28);

    v44 = v45;
    objc_msgSend(v45, "addDependency:", v28);
    v6 = v46;
    v7 = v48;
  }
  else
  {
    v44 = v45;
    if (v29)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2303C5000, v28, OS_LOG_TYPE_DEFAULT, "No user account changes, skipping user account update operation.", buf, 2u);
    }
  }

}

- (id)_supportedProviderAuthenticationToken
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  -[VSIdentityProviderRequestManager account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __73__VSIdentityProviderRequestManager__supportedProviderAuthenticationToken__block_invoke;
  v5[3] = &unk_24FE1B470;
  v5[4] = &v6;
  objc_msgSend(v2, "conditionallyUnwrapObject:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __73__VSIdentityProviderRequestManager__supportedProviderAuthenticationToken__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id obj;

  objc_msgSend(a2, "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "forceUnwrapObject");
  obj = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(obj, "isFromUnsupportedProvider") & 1) == 0)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);

}

- (void)applicationControllerDidStart:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  int v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  VSRequireMainThread();
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 136315138;
    v27 = "-[VSIdentityProviderRequestManager applicationControllerDidStart:]";
    _os_log_impl(&dword_2303C5000, v4, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v26, 0xCu);
  }

  -[VSIdentityProviderRequestManager _currentRequest](self, "_currentRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forceUnwrapObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSIdentityProviderRequestManager _stopApplicationControllerTimer](self, "_stopApplicationControllerTimer");
  -[VSIdentityProviderRequestManager _supportedProviderAuthenticationToken](self, "_supportedProviderAuthenticationToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "requiresUI");
  v9 = objc_msgSend(v6, "forceAuthentication");
  if (v8)
  {
    VSDefaultLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:

      VSDefaultLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_2303C5000, v12, OS_LOG_TYPE_DEFAULT, "Will show UI", (uint8_t *)&v26, 2u);
      }

      -[VSIdentityProviderRequestManager _showAuthenticationUI](self, "_showAuthenticationUI");
      goto LABEL_42;
    }
    LOWORD(v26) = 0;
    v11 = "Request requires UI.";
LABEL_6:
    _os_log_impl(&dword_2303C5000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v26, 2u);
    goto LABEL_7;
  }
  v13 = v9;
  if (objc_msgSend(v6, "type") == 2)
  {
    VSDefaultLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_2303C5000, v14, OS_LOG_TYPE_DEFAULT, "Request type is delete account.", (uint8_t *)&v26, 2u);
    }

    -[VSIdentityProviderRequestManager _startDeletingAccount](self, "_startDeletingAccount");
    goto LABEL_39;
  }
  if (((objc_msgSend(v7, "isValid") ^ 1 | v13) & 1) != 0)
  {
    if (v7)
    {
      VSDefaultLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_2303C5000, v15, OS_LOG_TYPE_DEFAULT, "We have a cached authentication token.", (uint8_t *)&v26, 2u);
      }

      -[VSIdentityProviderRequestManager requestFactory](self, "requestFactory");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "silentAuthenticationApplicationControllerRequestWithAuthenticationToken:forcedAuthentication:", v7, v13);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[VSIdentityProviderRequestManager _canShowAuthenticationUI](self, "_canShowAuthenticationUI"))
      {
        VSDefaultLogObject();
        v10 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          goto LABEL_7;
        LOWORD(v26) = 0;
        v11 = "Can show authentication UI.";
        goto LABEL_6;
      }
      if (objc_msgSend(v6, "type") == 4)
      {
        VSDefaultLogObject();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v26) = 0;
          _os_log_impl(&dword_2303C5000, v22, OS_LOG_TYPE_DEFAULT, "Request type is silent make account.", (uint8_t *)&v26, 2u);
        }

        -[VSIdentityProviderRequestManager requestFactory](self, "requestFactory");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "silentAuthenticationApplicationControllerRequest");
        v17 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (objc_msgSend(v6, "type") != 5)
        {
          VSErrorLogObject();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            -[VSIdentityProviderRequestManager applicationControllerDidStart:].cold.1(v23);

          VSPublicError();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[VSIdentityProviderRequestManager _completeCurrentRequestWithError:](self, "_completeCurrentRequestWithError:", v24);

          goto LABEL_39;
        }
        -[VSIdentityProviderRequestManager requestFactory](self, "requestFactory");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "STBOptOutApplicationControllerRequest");
        v17 = objc_claimAutoreleasedReturnValue();
      }
    }
    v18 = (void *)v17;

    if (!v18)
    {
LABEL_39:
      VSDefaultLogObject();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_2303C5000, v25, OS_LOG_TYPE_DEFAULT, "Nothing for application to do.", (uint8_t *)&v26, 2u);
      }

      goto LABEL_42;
    }
  }
  else
  {
    VSDefaultLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_2303C5000, v19, OS_LOG_TYPE_DEFAULT, "Authentication token is valid, but we should not force authentication.", (uint8_t *)&v26, 2u);
    }

    -[VSIdentityProviderRequestManager _applicationControllerRequestWithIdentityProviderRequest:](self, "_applicationControllerRequestWithIdentityProviderRequest:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
      goto LABEL_39;
  }
  v20 = v18;
  VSDefaultLogObject();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl(&dword_2303C5000, v21, OS_LOG_TYPE_DEFAULT, "We have an application controller request.", (uint8_t *)&v26, 2u);
  }

  -[VSIdentityProviderRequestManager _submitApplicationControllerRequest:](self, "_submitApplicationControllerRequest:", v20);
LABEL_42:

}

- (void)applicationController:(id)a3 startDidFailWithError:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  id v20;

  v20 = a4;
  VSRequireMainThread();
  -[VSIdentityProviderRequestManager identityProvider](self, "identityProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDeveloper");

  if ((v6 & 1) == 0)
  {
    -[VSIdentityProviderRequestManager _currentRequest](self, "_currentRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "forceUnwrapObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "type");

    -[VSIdentityProviderRequestManager _currentRequest](self, "_currentRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "forceUnwrapObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "requestingAppAdamID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[VSIdentityProviderRequestManager identityProvider](self, "identityProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uniqueID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "forceUnwrapObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    switch(v9)
    {
      case 1:
      case 4:
        -[VSIdentityProviderRequestManager identityProvider](self, "identityProvider");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isFullySupportedForRequestsExpectingAuthenticationSchemes:", 0);

        v18 = (_QWORD *)MEMORY[0x24BDF8E98];
        if (v9 != 1)
          v18 = (_QWORD *)MEMORY[0x24BDF8E90];
        objc_msgSend(MEMORY[0x24BDF8C28], "recordSignInEventWithProviderIdentifier:supportedProvider:channelAdamID:signInType:error:", v15, v17, v12, *v18, v20);
        break;
      case 3:
        v19 = (void *)MEMORY[0x24BDF8C28];
        if (!v12)
          objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The appAdamIDOrNil parameter must not be nil."));
        objc_msgSend(v19, "recordMetadataRequestWithProviderIdentifier:channelAdamID:fulfilledByProvider:error:", v15, v12, 1, v20);
        break;
      case 5:
        objc_msgSend(MEMORY[0x24BDF8C28], "recordSTBOptOutEventWithError:", v20);
        break;
      default:
        break;
    }

  }
  -[VSIdentityProviderRequestManager _completeCurrentRequestWithError:](self, "_completeCurrentRequestWithError:", v20);

}

- (void)applicationController:(id)a3 didReceiveViewModelError:(id)a4
{
  id v5;

  v5 = a4;
  VSRequireMainThread();
  -[VSIdentityProviderRequestManager _completeCurrentRequestWithError:](self, "_completeCurrentRequestWithError:", v5);

}

- (void)applicationController:(id)a3 didReceiveViewModel:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  VSRequireMainThread();
  -[VSIdentityProviderRequestManager _stopApplicationControllerTimer](self, "_stopApplicationControllerTimer");
  -[VSIdentityProviderRequestManager identityProvider](self, "identityProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdentityProvider:", v5);

  -[VSIdentityProviderRequestManager _currentRequest](self, "_currentRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "forceUnwrapObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configureWithRequest:", v7);

  -[VSIdentityProviderRequestManager setViewModel:](self, "setViewModel:", v8);
}

- (void)applicationController:(id)a3 didUpdateLogoViewModel:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[VSIdentityProviderRequestManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "identityProviderRequestManager:didUpdateLogoViewModel:", self, v6);

}

- (void)applicationController:(id)a3 request:(id)a4 didFailWithError:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  VSIdentityProviderRequestManager *v18;
  id v19;

  v7 = a4;
  v8 = a5;
  VSRequireMainThread();
  if (!v7)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The request parameter must not be nil."));
  -[VSIdentityProviderRequestManager currentApplicationControllerRequest](self, "currentApplicationControllerRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __83__VSIdentityProviderRequestManager_applicationController_request_didFailWithError___block_invoke;
  v16[3] = &unk_24FE1B498;
  v17 = v7;
  v18 = self;
  v19 = v8;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __83__VSIdentityProviderRequestManager_applicationController_request_didFailWithError___block_invoke_146;
  v13[3] = &unk_24FE19E30;
  v14 = v17;
  v15 = v19;
  v11 = v19;
  v12 = v17;
  objc_msgSend(v9, "conditionallyUnwrapObject:otherwise:", v16, v13);

}

void __83__VSIdentityProviderRequestManager_applicationController_request_didFailWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  id v5;

  if (*(_QWORD *)(a1 + 32) == a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_stopApplicationControllerTimer");
    v4 = *(void **)(a1 + 40);
    v5 = objc_alloc_init(MEMORY[0x24BDF8C38]);
    objc_msgSend(v4, "setCurrentApplicationControllerRequest:", v5);

    objc_msgSend(*(id *)(a1 + 40), "_handleApplicationControllerError:forRequest:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  }
  else
  {
    VSErrorLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __83__VSIdentityProviderRequestManager_applicationController_request_didFailWithError___block_invoke_cold_1();

  }
}

void __83__VSIdentityProviderRequestManager_applicationController_request_didFailWithError___block_invoke_146()
{
  NSObject *v0;

  VSErrorLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __83__VSIdentityProviderRequestManager_applicationController_request_didFailWithError___block_invoke_146_cold_1();

}

- (void)applicationController:(id)a3 request:(id)a4 didCompleteWithResponse:(id)a5
{
  id v8;
  char *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  char *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  char *v18;
  _QWORD v19[4];
  id v20;
  VSIdentityProviderRequestManager *v21;
  char *v22;
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (char *)a5;
  VSRequireMainThread();
  if (a3)
  {
    if (v8)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The request parameter must not be nil."));
    if (v9)
      goto LABEL_4;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The applicationController parameter must not be nil."));
  if (!v8)
    goto LABEL_10;
LABEL_3:
  if (v9)
    goto LABEL_4;
LABEL_11:
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The response parameter must not be nil."));
LABEL_4:
  VSDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[VSIdentityProviderRequestManager applicationController:request:didCompleteWithResponse:]";
    _os_log_impl(&dword_2303C5000, v10, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  VSDefaultLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v9;
    _os_log_impl(&dword_2303C5000, v11, OS_LOG_TYPE_DEFAULT, "Handling application controller response %@", buf, 0xCu);
  }

  -[VSIdentityProviderRequestManager currentApplicationControllerRequest](self, "currentApplicationControllerRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke;
  v19[3] = &unk_24FE1B498;
  v20 = v8;
  v21 = self;
  v22 = v9;
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_163;
  v16[3] = &unk_24FE19E30;
  v17 = v20;
  v18 = v22;
  v14 = v22;
  v15 = v20;
  objc_msgSend(v12, "conditionallyUnwrapObject:otherwise:", v19, v16);

}

void __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  VSAppsOperation *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  VSAppsOperation *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  int8x16_t v36;
  void *v37;
  id v38;
  id v39[5];
  id v40;
  id v41;
  id v42[5];
  id v43;
  id v44;
  VSAppsOperation *v45;
  id v46;
  id v47;
  id v48;
  id location;
  _QWORD v50[3];

  v50[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1[4] == v3)
  {
    objc_msgSend(a1[5], "_stopApplicationControllerTimer");
    v5 = a1[5];
    v6 = objc_alloc_init(MEMORY[0x24BDF8C38]);
    objc_msgSend(v5, "setCurrentApplicationControllerRequest:", v6);

    objc_msgSend(a1[6], "accountChannelIDs");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "accountAuthentication");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1[4], "type") == 4
      || (objc_msgSend(v37, "authenticationToken"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "object"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          v7,
          !v8))
    {
      if (v4)
      {
        v18 = v4;
        objc_msgSend(a1[5], "_accountChannelsWithChannelIDs:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_alloc(MEMORY[0x24BDF8B70]);
        objc_msgSend(a1[5], "storage");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "forceUnwrapObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "channelsCenter");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v20, "initWithUnsavedAccountChannels:accountChannelsCenter:", v19, v23);

        objc_initWeak(&location, a1[5]);
        v39[1] = (id)MEMORY[0x24BDAC760];
        v39[2] = (id)3221225472;
        v39[3] = __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_161;
        v39[4] = &unk_24FE19C28;
        objc_copyWeak(v42, &location);
        v40 = a1[4];
        v41 = a1[6];
        VSMainThreadOperationWithBlock();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addDependency:", v24);
        objc_msgSend(a1[5], "_enqueueSubscriptionOperationIfRequiredForResponse:asDependencyOf:", a1[6], v25);
        VSEnqueueCompletionOperation();
        objc_msgSend(a1[5], "privateQueue");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addOperation:", v24);

        objc_destroyWeak(v42);
        objc_destroyWeak(&location);

      }
      else
      {
        objc_initWeak(&location, a1[5]);
        objc_copyWeak(v39, &location);
        v36 = *((int8x16_t *)a1 + 2);
        v27 = (id)v36.i64[0];
        v38 = a1[6];
        VSMainThreadOperationWithBlock();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "_enqueueSubscriptionOperationIfRequiredForResponse:asDependencyOf:", a1[6], v28);
        VSEnqueueCompletionOperation();

        objc_destroyWeak(v39);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      if (!v37)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The accountAuthenticationOrNil parameter must not be nil."));
      v33 = v37;
      objc_msgSend(a1[5], "_updateAccountWithAccountAuthentication:");
      objc_msgSend(a1[5], "_accountChannelsWithChannelIDs:", v4);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "privateQueue");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc(MEMORY[0x24BDF8B88]);
      objc_msgSend(a1[5], "account");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "forceUnwrapObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "storage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "forceUnwrapObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v9, "initWithUnsavedAccounts:channels:storage:", v12, v34, v14);

      objc_msgSend(v35, "addOperation:", v15);
      objc_msgSend(a1[5], "identityProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "isDeveloper") & 1) != 0 || !objc_msgSend(a1[5], "canIssuePrivacyVouchers"))
      {
        v17 = 0;
      }
      else
      {
        v17 = -[VSAppsOperation initWithIdentityProvider:]([VSAppsOperation alloc], "initWithIdentityProvider:", v16);
        -[VSAppsOperation addDependency:](v17, "addDependency:", v15);
        objc_msgSend(v35, "addOperation:", v17);
      }
      objc_initWeak(&location, a1[5]);
      v42[1] = (id)MEMORY[0x24BDAC760];
      v42[2] = (id)3221225472;
      v42[3] = __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_2;
      v42[4] = &unk_24FE1B4E8;
      objc_copyWeak(&v48, &location);
      v29 = v15;
      v30 = a1[5];
      v43 = v29;
      v44 = v30;
      v31 = v17;
      v45 = v31;
      v46 = a1[4];
      v47 = a1[6];
      VSMainThreadOperationWithBlock();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addDependency:", v29);
      if (v31)
        objc_msgSend(v32, "addDependency:", v31);
      objc_msgSend(a1[5], "_enqueueUserAccountUpdateOperationIfRequiredForResponse:asDependencyOf:", a1[6], v32);
      objc_msgSend(a1[5], "_enqueueSubscriptionOperationIfRequiredForResponse:asDependencyOf:", a1[6], v32);
      VSEnqueueCompletionOperation();

      objc_destroyWeak(&v48);
      objc_destroyWeak(&location);

    }
  }
  else
  {
    VSErrorLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_cold_1();
  }

}

void __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[6];
  id v10;
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  VSRequireMainThread();
  VSDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[VSIdentityProviderRequestManager applicationController:request:didCompleteWithResponse:]_block_invoke_2";
    _os_log_impl(&dword_2303C5000, v2, OS_LOG_TYPE_DEFAULT, "%s: save account and fetch app opertions completed", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "result");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "forceUnwrapObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = MEMORY[0x24BDAC760];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_155;
    v9[3] = &unk_24FE1B4C0;
    v7 = *(void **)(a1 + 48);
    v9[4] = *(_QWORD *)(a1 + 40);
    v9[5] = WeakRetained;
    v10 = v7;
    v11 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 64);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_157;
    v8[3] = &unk_24FE19D18;
    v8[4] = WeakRetained;
    objc_msgSend(v5, "unwrapObject:error:", v9, v8);

  }
}

void __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_155(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "canIssuePrivacyVouchers"))
  {
    objc_msgSend(*(id *)(a1 + 40), "storage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "forceUnwrapObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "voucherLockbox");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "identityProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "providerID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "forceUnwrapObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "result");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "issueVouchersForApps:providerID:", v10, v9);

  }
  objc_msgSend(*(id *)(a1 + 40), "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "validationState");

  if (v12 == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "viewModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValidationState:", 3);

  }
  v14 = *(void **)(a1 + 40);
  v15 = (void *)MEMORY[0x24BDF8C38];
  objc_msgSend(v3, "objectAtIndex:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "optionalWithObject:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAccount:", v17);

  VSDefaultLogObject();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(a1 + 56);
    v20 = *(_QWORD *)(a1 + 64);
    v21 = 136315650;
    v22 = "-[VSIdentityProviderRequestManager applicationController:request:didCompleteWithResponse:]_block_invoke";
    v23 = 2112;
    v24 = v19;
    v25 = 2112;
    v26 = v20;
    _os_log_impl(&dword_2303C5000, v18, OS_LOG_TYPE_DEFAULT, "%s: request %@, response %@", (uint8_t *)&v21, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 40), "_handleApplicationControllerRequest:didCompleteWithResponse:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_157(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[VSIdentityProviderRequestManager applicationController:request:didCompleteWithResponse:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_2303C5000, v4, OS_LOG_TYPE_DEFAULT, "%s: error saving account %@", (uint8_t *)&v6, 0x16u);
  }

  VSPublicError();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_completeCurrentRequestWithError:", v5);
}

void __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_161(uint64_t a1)
{
  id WeakRetained;
  id v3;

  VSRequireMainThread();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleApplicationControllerRequest:didCompleteWithResponse:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

void __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_2_162(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "_handleApplicationControllerRequest:didCompleteWithResponse:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    WeakRetained = v3;
  }

}

void __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_163()
{
  NSObject *v0;

  VSErrorLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_163_cold_1();

}

- (BOOL)applicationController:(id)a3 requestsAlert:(id)a4
{
  VSIdentityProviderRequestManager *v4;
  void *v5;
  void *v6;

  v4 = self;
  -[VSIdentityProviderRequestManager _identityProviderAlertWithApplicationControllerAlert:](self, "_identityProviderAlertWithApplicationControllerAlert:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderRequestManager delegate](v4, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "identityProviderRequestManager:requestsAlert:", v4, v5);

  return (char)v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;
  _QWORD block[5];
  uint8_t buf[16];

  if ((void *)kVSKeyValueObservingContext_ViewModelValidationState_0 == a6)
  {
    objc_msgSend(a5, "objectForKey:", *MEMORY[0x24BDD0E70], a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

    if (v8 == 2)
    {
      VSDefaultLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2303C5000, v15, OS_LOG_TYPE_DEFAULT, "Validation state changed to validating.", buf, 2u);
      }

      -[VSIdentityProviderRequestManager _currentRequest](self, "_currentRequest");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "forceUnwrapObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_msgSend(v17, "forceAuthentication");
      -[VSIdentityProviderRequestManager _supportedProviderAuthenticationToken](self, "_supportedProviderAuthenticationToken");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSIdentityProviderRequestManager requestFactory](self, "requestFactory");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "authenticationApplicationControllerRequestWithAuthenticationToken:forcedAuthentication:", v19, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[VSIdentityProviderRequestManager _submitApplicationControllerRequest:](self, "_submitApplicationControllerRequest:", v21);
    }
    else if (v8 == 1)
    {
      -[VSIdentityProviderRequestManager viewModel](self, "viewModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "shouldPreValidate");

      VSDefaultLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v12)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2303C5000, v11, OS_LOG_TYPE_DEFAULT, "View Model requires pre-validation, will invoke application callback.", buf, 2u);
        }

        -[VSIdentityProviderRequestManager _supportedProviderAuthenticationToken](self, "_supportedProviderAuthenticationToken");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSIdentityProviderRequestManager applicationController](self, "applicationController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "applicationStartSelfValidationWithAuthenticationToken:", v13);

      }
      else
      {
        if (v12)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2303C5000, v11, OS_LOG_TYPE_DEFAULT, "View Model does not require pre-validation, validate.", buf, 2u);
        }

        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __83__VSIdentityProviderRequestManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
        block[3] = &unk_24FE19778;
        block[4] = self;
        dispatch_async(MEMORY[0x24BDAC9B8], block);
      }
    }
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)VSIdentityProviderRequestManager;
    -[VSIdentityProviderRequestManager observeValueForKeyPath:ofObject:change:context:](&v22, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

void __83__VSIdentityProviderRequestManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setValidationState:", 2);

}

- (VSIdentityProvider)identityProvider
{
  return self->_identityProvider;
}

- (VSIdentityProviderRequestManagerDelegate)delegate
{
  return (VSIdentityProviderRequestManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)canIssuePrivacyVouchers
{
  return self->_canIssuePrivacyVouchers;
}

- (void)setCanIssuePrivacyVouchers:(BOOL)a3
{
  self->_canIssuePrivacyVouchers = a3;
}

- (VSViewModel)viewModel
{
  return self->_viewModel;
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (NSMutableArray)requestContexts
{
  return self->_requestContexts;
}

- (void)setRequestContexts:(id)a3
{
  objc_storeStrong((id *)&self->_requestContexts, a3);
}

- (VSApplicationController)applicationController
{
  return self->_applicationController;
}

- (void)setApplicationController:(id)a3
{
  objc_storeStrong((id *)&self->_applicationController, a3);
}

- (VSOptional)currentApplicationControllerRequest
{
  return self->_currentApplicationControllerRequest;
}

- (void)setCurrentApplicationControllerRequest:(id)a3
{
  objc_storeStrong((id *)&self->_currentApplicationControllerRequest, a3);
}

- (VSOptional)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (VSOptional)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (VSApplicationControllerRequestFactory)requestFactory
{
  return self->_requestFactory;
}

- (void)setRequestFactory:(id)a3
{
  objc_storeStrong((id *)&self->_requestFactory, a3);
}

- (BOOL)didCreateAccount
{
  return self->_didCreateAccount;
}

- (void)setDidCreateAccount:(BOOL)a3
{
  self->_didCreateAccount = a3;
}

- (VSPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (OS_dispatch_source)applicationControllerTimerSource
{
  return self->_applicationControllerTimerSource;
}

- (void)setApplicationControllerTimerSource:(id)a3
{
  objc_storeStrong((id *)&self->_applicationControllerTimerSource, a3);
}

- (BOOL)allowsApplicationControllerTimer
{
  return self->_allowsApplicationControllerTimer;
}

- (void)setAllowsApplicationControllerTimer:(BOOL)a3
{
  self->_allowsApplicationControllerTimer = a3;
}

- (double)applicationControllerTimerLeeway
{
  return self->_applicationControllerTimerLeeway;
}

- (void)setApplicationControllerTimerLeeway:(double)a3
{
  self->_applicationControllerTimerLeeway = a3;
}

- (double)requestCompletionDelayAfterShowingUserInterface
{
  return self->_requestCompletionDelayAfterShowingUserInterface;
}

- (void)setRequestCompletionDelayAfterShowingUserInterface:(double)a3
{
  self->_requestCompletionDelayAfterShowingUserInterface = a3;
}

- (double)applicationControllerTimerDelay
{
  return self->_applicationControllerTimerDelay;
}

- (VSDeveloperSettingsFetchOperation)settingsFetchOperation
{
  return self->_settingsFetchOperation;
}

- (void)setSettingsFetchOperation:(id)a3
{
  objc_storeStrong((id *)&self->_settingsFetchOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsFetchOperation, 0);
  objc_storeStrong((id *)&self->_applicationControllerTimerSource, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_requestFactory, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_currentApplicationControllerRequest, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_storeStrong((id *)&self->_requestContexts, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identityProvider, 0);
}

- (void)_processRequestContext:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2303C5000, a2, a3, "Error fetching user accounts for provider, will not provide user accounts to auth context: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __59__VSIdentityProviderRequestManager__processRequestContext___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2303C5000, a2, a3, "Error fetching developer settings in preparation for request: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)applicationControllerDidStart:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2303C5000, log, OS_LOG_TYPE_ERROR, "We can't show UI and can't make a request to the MSO.", v1, 2u);
}

void __83__VSIdentityProviderRequestManager_applicationController_request_didFailWithError___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_2303C5000, v0, (uint64_t)v0, "Non-current request (%@) failed with error: %@", v1);
  OUTLINED_FUNCTION_1();
}

void __83__VSIdentityProviderRequestManager_applicationController_request_didFailWithError___block_invoke_146_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_2303C5000, v0, v1, "Request (%@) failed without current request: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_2303C5000, v0, (uint64_t)v0, "Non-current request (%@) finished with response: %@", v1);
  OUTLINED_FUNCTION_1();
}

void __90__VSIdentityProviderRequestManager_applicationController_request_didCompleteWithResponse___block_invoke_163_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_2303C5000, v0, v1, "Old request (%@) finished with response: %@", v2);
  OUTLINED_FUNCTION_1();
}

@end
