@implementation ICSuzeLeaseSession

- (ICSuzeLeaseSession)initWithConfiguration:(id)a3
{
  id v4;
  ICSuzeLeaseSession *v5;
  uint64_t v6;
  ICSuzeLeaseSessionConfiguration *configuration;
  dispatch_queue_t v8;
  OS_dispatch_queue *calloutQueue;
  NSOperationQueue *v10;
  NSOperationQueue *operationQueue;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICSuzeLeaseSession;
  v5 = -[ICSuzeLeaseSession init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (ICSuzeLeaseSessionConfiguration *)v6;

    v8 = dispatch_queue_create("com.apple.iTunesCloud.ICSuzeLeaseSession.calloutQueue", 0);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v8;

    v10 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v5->_operationQueue;
    v5->_operationQueue = v10;

    -[NSOperationQueue setName:](v5->_operationQueue, "setName:", CFSTR("com.apple.iTunesCloud.ICSuzeLeaseSession.operationQueue"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v5->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v5->_operationQueue, "setQualityOfService:", 25);
  }

  return v5;
}

- (void)dealloc
{
  NSObject *leaseRenewTimer;
  objc_super v4;

  leaseRenewTimer = self->_leaseRenewTimer;
  if (leaseRenewTimer)
    dispatch_source_cancel(leaseRenewTimer);
  v4.receiver = self;
  v4.super_class = (Class)ICSuzeLeaseSession;
  -[ICSuzeLeaseSession dealloc](&v4, sel_dealloc);
}

- (void)beginAutomaticallyRefreshingLease
{
  NSOperationQueue *operationQueue;
  _QWORD v3[5];

  operationQueue = self->_operationQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__ICSuzeLeaseSession_beginAutomaticallyRefreshingLease__block_invoke;
  v3[3] = &unk_1E43913D8;
  v3[4] = self;
  -[NSOperationQueue addOperationWithBlock:](operationQueue, "addOperationWithBlock:", v3);
}

- (void)endAutomaticallyRefreshingLease
{
  NSOperationQueue *operationQueue;
  _QWORD v3[5];

  operationQueue = self->_operationQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__ICSuzeLeaseSession_endAutomaticallyRefreshingLease__block_invoke;
  v3[3] = &unk_1E43913D8;
  v3[4] = self;
  -[NSOperationQueue addOperationWithBlock:](operationQueue, "addOperationWithBlock:", v3);
}

- (void)startLeaseSessionWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  ICAsyncBlockOperation *v6;
  id v7;
  ICAsyncBlockOperation *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  ICSuzeLeaseSession *v13;
  id v14;
  uint8_t buf[4];
  ICSuzeLeaseSession *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = self;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting lease session...", buf, 0xCu);
  }

  v6 = [ICAsyncBlockOperation alloc];
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __61__ICSuzeLeaseSession_startLeaseSessionWithCompletionHandler___block_invoke;
  v12 = &unk_1E438EFB0;
  v13 = self;
  v14 = v4;
  v7 = v4;
  v8 = -[ICAsyncBlockOperation initWithStartHandler:](v6, "initWithStartHandler:", &v9);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v8, v9, v10, v11, v12, v13);

}

- (void)stopLeaseSessionWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  ICAsyncBlockOperation *v6;
  id v7;
  ICAsyncBlockOperation *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  ICSuzeLeaseSession *v13;
  id v14;
  uint8_t buf[4];
  ICSuzeLeaseSession *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = self;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopping lease session...", buf, 0xCu);
  }

  v6 = [ICAsyncBlockOperation alloc];
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __60__ICSuzeLeaseSession_stopLeaseSessionWithCompletionHandler___block_invoke;
  v12 = &unk_1E438EFB0;
  v13 = self;
  v14 = v4;
  v7 = v4;
  v8 = -[ICAsyncBlockOperation initWithStartHandler:](v6, "initWithStartHandler:", &v9);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v8, v9, v10, v11, v12, v13);

}

- (id)_newSuzeLeaseRequestWithType:(int64_t)a3 clientData:(id)a4
{
  id v6;
  ICSuzeLeaseRequest *v7;
  void *v8;
  void *v9;
  ICSuzeLeaseRequest *v10;

  v6 = a4;
  v7 = [ICSuzeLeaseRequest alloc];
  -[ICSuzeLeaseSessionConfiguration requestContext](self->_configuration, "requestContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSuzeLeaseSessionConfiguration leaseID](self->_configuration, "leaseID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ICSuzeLeaseRequest initWithRequestContext:requestType:leaseID:mediaType:clientData:](v7, "initWithRequestContext:requestType:leaseID:mediaType:clientData:", v8, a3, v9, -[ICSuzeLeaseSessionConfiguration mediaType](self->_configuration, "mediaType"), v6);

  -[ICSuzeLeaseRequest setQualityOfService:](v10, "setQualityOfService:", -[NSOperationQueue qualityOfService](self->_operationQueue, "qualityOfService"));
  return v10;
}

- (void)_renewLeaseTimerAction
{
  NSObject *v3;
  ICAsyncBlockOperation *v4;
  ICAsyncBlockOperation *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  ICSuzeLeaseSession *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = self;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Lease renew timer fired.", buf, 0xCu);
  }

  v4 = [ICAsyncBlockOperation alloc];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__ICSuzeLeaseSession__renewLeaseTimerAction__block_invoke;
  v6[3] = &unk_1E438D788;
  v6[4] = self;
  v5 = -[ICAsyncBlockOperation initWithStartHandler:](v4, "initWithStartHandler:", v6);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v5);

}

- (void)_updateRenewalTimer
{
  NSObject *leaseRenewTimer;
  OS_dispatch_source *v4;
  NSDate *v5;
  double v6;
  double v7;
  NSObject *v8;
  NSDate *leaseExpirationDate;
  NSObject *v10;
  NSObject *v11;
  dispatch_time_t v12;
  OS_dispatch_source *v13;
  NSObject *v14;
  NSObject *v15;
  int64_t automaticRefreshCount;
  NSDate *v17;
  const __CFString *v18;
  _QWORD handler[4];
  id v20;
  uint8_t buf[4];
  ICSuzeLeaseSession *v22;
  __int16 v23;
  double v24;
  __int16 v25;
  NSDate *v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  leaseRenewTimer = self->_leaseRenewTimer;
  if (leaseRenewTimer)
  {
    dispatch_source_cancel(leaseRenewTimer);
    v4 = self->_leaseRenewTimer;
    self->_leaseRenewTimer = 0;

  }
  if (self->_automaticRefreshCount && (v5 = self->_leaseExpirationDate) != 0 && self->_isRunning)
  {
    -[NSDate timeIntervalSinceNow](v5, "timeIntervalSinceNow");
    v7 = fmax(v6 + -30.0, 30.0);
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      leaseExpirationDate = self->_leaseExpirationDate;
      *(_DWORD *)buf = 138543874;
      v22 = self;
      v23 = 2048;
      v24 = v7;
      v25 = 2114;
      v26 = leaseExpirationDate;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Scheduling lease renewal in %f seconds with expiration date of: %{public}@.", buf, 0x20u);
    }

    dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v10);

    v12 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, (uint64_t)(v7 * 0.01 * 1000000000.0));
    objc_initWeak((id *)buf, self);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __41__ICSuzeLeaseSession__updateRenewalTimer__block_invoke;
    handler[3] = &unk_1E4391400;
    objc_copyWeak(&v20, (id *)buf);
    dispatch_source_set_event_handler(v11, handler);
    v13 = self->_leaseRenewTimer;
    self->_leaseRenewTimer = (OS_dispatch_source *)v11;
    v14 = v11;

    dispatch_resume(v14);
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      automaticRefreshCount = self->_automaticRefreshCount;
      v17 = self->_leaseExpirationDate;
      if (self->_isRunning)
        v18 = CFSTR("YES");
      else
        v18 = CFSTR("NO");
      *(_DWORD *)buf = 138544130;
      v22 = self;
      v23 = 2048;
      v24 = *(double *)&automaticRefreshCount;
      v25 = 2114;
      v26 = v17;
      v27 = 2114;
      v28 = v18;
      _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping renewal timer scheduling with automatic refresh count: %li, leaseExpirationDate: %{public}@, isRunning: %{public}@", buf, 0x2Au);
    }

  }
}

- (void)_updateRenewalTimerWithResponse:(id)a3
{
  NSDate *v4;
  NSDate *leaseExpirationDate;

  objc_msgSend(a3, "leaseExpirationDate");
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  leaseExpirationDate = self->_leaseExpirationDate;
  self->_leaseExpirationDate = v4;

  -[ICSuzeLeaseSession _updateRenewalTimer](self, "_updateRenewalTimer");
}

- (ICSuzeLeaseSessionConfiguration)configuration
{
  return self->_configuration;
}

- (ICSuzeLeaseSessionDelegate)delegate
{
  return (ICSuzeLeaseSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_leaseSyncSession, 0);
  objc_storeStrong((id *)&self->_leaseRenewTimer, 0);
  objc_storeStrong((id *)&self->_leaseExpirationDate, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

void __41__ICSuzeLeaseSession__updateRenewalTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_renewLeaseTimerAction");

}

void __44__ICSuzeLeaseSession__renewLeaseTimerAction__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  void (**v19)(_QWORD, _QWORD, _QWORD);
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __44__ICSuzeLeaseSession__renewLeaseTimerAction__block_invoke_2;
  v22[3] = &unk_1E438F078;
  v22[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v23 = v5;
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A1AFA8D0](v22);
  v7 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v7 + 24))
  {
    v8 = *(void **)(v7 + 48);
    v20 = 0;
    v21 = 0;
    v9 = objc_msgSend(v8, "getLeaseSyncRenewRequestData:error:", &v21, &v20);
    v10 = v21;
    v11 = v20;
    if (v9)
    {
      v12 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newSuzeLeaseRequestWithType:clientData:", 2, v10);
      v18[0] = v4;
      v18[1] = 3221225472;
      v18[2] = __44__ICSuzeLeaseSession__renewLeaseTimerAction__block_invoke_4;
      v18[3] = &unk_1E438BE70;
      v18[4] = *(_QWORD *)(a1 + 32);
      v19 = v6;
      objc_msgSend(v12, "performWithResponseHandler:", v18);

    }
    else
    {
      v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v25 = v16;
        v26 = 2114;
        v27 = v11;
        _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Renew: Failed to generate renew request data with error: %{public}@", buf, 0x16u);
      }

      if (v11)
      {
        ((void (**)(_QWORD, _QWORD, id))v6)[2](v6, 0, v11);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7502, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *))v6)[2](v6, 0, v17);

      }
    }

  }
  else
  {
    v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v25 = v14;
      _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Lease renew invalid because the session is no longer running.", buf, 0xCu);
    }

    v6[2](v6, 1, 0);
  }

}

void __44__ICSuzeLeaseSession__renewLeaseTimerAction__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(NSObject **)(v7 + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__ICSuzeLeaseSession__renewLeaseTimerAction__block_invoke_3;
    block[3] = &unk_1E4391230;
    v11 = WeakRetained;
    v12 = v7;
    v13 = v5;
    v9 = WeakRetained;
    dispatch_async(v8, block);

  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v5);

}

void __44__ICSuzeLeaseSession__renewLeaseTimerAction__block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v7 && !v9)
  {
    objc_msgSend(v7, "clientData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v28 = v22;
        _os_log_impl(&dword_1A03E3000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Renew: No client data in response, treating as successful.", buf, 0xCu);
      }

      (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1, 0);
      goto LABEL_25;
    }
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v26 = 0;
    v13 = objc_msgSend(v12, "processRenewResponseData:error:", v11, &v26);
    v14 = v26;
    v15 = v14;
    if ((v13 & 1) == 0)
    {
      if (objc_msgSend(v14, "code") != -42564)
      {
        v23 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          v28 = v24;
          v29 = 2114;
          v30 = v15;
          _os_log_impl(&dword_1A03E3000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: Renew: Failed to process response data with error: %{public}@.", buf, 0x16u);
        }

        v25 = *(_QWORD *)(a1 + 40);
        if (!v15)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7502, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        (*(void (**)(uint64_t, _QWORD, void *))(v25 + 16))(v25, 0, v15);
        goto LABEL_24;
      }

      v15 = 0;
    }
    v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v28 = v17;
      _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Renew: Successfully processed renew response data.", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_updateRenewalTimerWithResponse:", v7);
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1, 0);
LABEL_24:

    goto LABEL_25;
  }
  v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v28 = v19;
    v29 = 2114;
    v30 = v10;
    _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Renew: Response failed with error: %{public}@", buf, 0x16u);
  }

  v20 = *(_QWORD *)(a1 + 40);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v20 + 16))(v20, 0, v11);
LABEL_25:

    goto LABEL_26;
  }
  (*(void (**)(uint64_t, _QWORD, void *))(v20 + 16))(v20, 0, v10);
LABEL_26:

}

void __44__ICSuzeLeaseSession__renewLeaseTimerAction__block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 32), "suzeLeaseSession:leaseRenewalDidFailWithError:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "suzeLeaseSession:leaseRenewalDidFailWithError:", v3, v4);

    }
  }
}

void __60__ICSuzeLeaseSession_stopLeaseSessionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __60__ICSuzeLeaseSession_stopLeaseSessionWithCompletionHandler___block_invoke_2;
  v22[3] = &unk_1E43901D8;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v24 = v4;
  v22[4] = v5;
  v6 = v3;
  v23 = v6;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A1AFA8D0](v22);
  v8 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v8 + 24))
  {
    *(_BYTE *)(v8 + 24) = 0;
    objc_msgSend(*(id *)(a1 + 32), "_updateRenewalTimer");
    v9 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 48);
    *(_QWORD *)(v10 + 48) = 0;

    v21 = 0;
    v12 = objc_msgSend(v9, "endLeaseSyncAndReturnError:", &v21);
    v13 = v21;
    v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v15)
      {
        v16 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v26 = v16;
        _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Stop: Successfully ended lease sync.", buf, 0xCu);
      }

      v7[2](v7, 1, 0);
    }
    else
    {
      if (v15)
      {
        v19 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v26 = v19;
        v27 = 2114;
        v28 = v13;
        _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Stop: FairPlay failed ending lease sync with error: %{public}@.", buf, 0x16u);
      }

      if (v13)
      {
        ((void (**)(_QWORD, _QWORD, id))v7)[2](v7, 0, v13);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7502, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v20);

      }
    }

  }
  else
  {
    v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v26 = v18;
      _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Lease session already stopped, returning success.", buf, 0xCu);
    }

    v7[2](v7, 1, 0);
  }

}

void __60__ICSuzeLeaseSession_stopLeaseSessionWithCompletionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 48);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__ICSuzeLeaseSession_stopLeaseSessionWithCompletionHandler___block_invoke_3;
    block[3] = &unk_1E4390B70;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v5);

}

uint64_t __60__ICSuzeLeaseSession_stopLeaseSessionWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __61__ICSuzeLeaseSession_startLeaseSessionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  void (**v17)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __61__ICSuzeLeaseSession_startLeaseSessionWithCompletionHandler___block_invoke_2;
  v18[3] = &unk_1E438BE20;
  v5 = *(void **)(a1 + 40);
  v18[4] = *(_QWORD *)(a1 + 32);
  v20 = v5;
  v6 = v3;
  v19 = v6;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A1AFA8D0](v18);
  v8 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v8 + 24))
  {
    v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v22 = v10;
      _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Start: Lease session already started.", buf, 0xCu);
    }

    v7[2](v7, 1, 0, 0);
  }
  else
  {
    objc_msgSend(*(id *)(v8 + 64), "requestContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identityStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v4;
    v15[1] = 3221225472;
    v15[2] = __61__ICSuzeLeaseSession_startLeaseSessionWithCompletionHandler___block_invoke_4;
    v15[3] = &unk_1E438BE48;
    v15[4] = *(_QWORD *)(a1 + 32);
    v16 = v11;
    v17 = v7;
    v14 = v11;
    objc_msgSend(v12, "getPropertiesForUserIdentity:completionHandler:", v13, v15);

  }
}

void __61__ICSuzeLeaseSession_startLeaseSessionWithCompletionHandler___block_invoke_2(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  id v19;
  char v20;

  v7 = a3;
  v8 = a4;
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __61__ICSuzeLeaseSession_startLeaseSessionWithCompletionHandler___block_invoke_3;
  v16 = &unk_1E4390B20;
  v10 = *(id *)(a1 + 48);
  v18 = v8;
  v19 = v10;
  v20 = a2;
  v17 = v7;
  v11 = v8;
  v12 = v7;
  dispatch_async(v9, &v13);
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v11, v13, v14, v15, v16);

}

void __61__ICSuzeLeaseSession_startLeaseSessionWithCompletionHandler___block_invoke_4(id *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "DSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedLongLongValue");

  if (v5)
  {
    objc_msgSend(*((id *)a1[4] + 8), "leaseID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(*((id *)a1[4] + 8), "mediaType") - 1;
    if (v7 > 6)
      v8 = 0;
    else
      v8 = dword_1A06E744C[v7];
    v29 = 0;
    v30 = 0;
    +[ICFPLeaseSyncSession leaseSyncSessionWithID:accountID:mediaKind:returningLeaseSyncRequestData:error:](ICFPLeaseSyncSession, "leaseSyncSessionWithID:accountID:mediaKind:returningLeaseSyncRequestData:error:", v6, v5, v8, &v30, &v29);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v30;
    v16 = v29;

    if (v17)
      v18 = v14 == 0;
    else
      v18 = 1;
    if (v18)
    {
      v19 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = a1[4];
        *(_DWORD *)buf = 138543618;
        v34 = v20;
        v35 = 2114;
        v36 = v16;
        _os_log_impl(&dword_1A03E3000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Start: Failed to generate FairPlay sync session with error: %{public}@", buf, 0x16u);
      }

      v21 = a1[6];
      if (v16)
      {
        (*((void (**)(id, _QWORD, _QWORD, id))v21 + 2))(v21, 0, 0, v16);
LABEL_19:

        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v21 + 2))(v21, 0, 0, v22);
    }
    else
    {
      v22 = (void *)objc_msgSend(a1[4], "_newSuzeLeaseRequestWithType:clientData:", 1, v14);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __61__ICSuzeLeaseSession_startLeaseSessionWithCompletionHandler___block_invoke_5;
      v25[3] = &unk_1E438D128;
      v23 = v17;
      v24 = a1[4];
      v26 = v23;
      v27 = v24;
      v28 = a1[6];
      objc_msgSend(v22, "performWithResponseHandler:", v25);

    }
    goto LABEL_19;
  }
  v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = a1[4];
    *(_DWORD *)buf = 138543362;
    v34 = v10;
    _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Start: Failed to retrieve a valid DSID from the identity store.", buf, 0xCu);
  }

  v31 = *MEMORY[0x1E0CB2938];
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1[5], "identity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("Unable to start lease session [no valid DSID for user identity] - userIdentity=%@ - properties=%@"), v12, v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v15 = a1[6];
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7400, v14);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, id))v15 + 2))(v15, 0, 0, v16);
LABEL_20:

}

void __61__ICSuzeLeaseSession_startLeaseSessionWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v7 && !v9)
  {
    objc_msgSend(v7, "clientData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      v12 = *(void **)(a1 + 32);
      v28 = 0;
      v13 = objc_msgSend(v12, "importLeaseSyncResponseData:error:", v11, &v28);
      v14 = v28;
      v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      v16 = v15;
      if (v13)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v17 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543362;
          v30 = v17;
          _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Start: Successfully started.", buf, 0xCu);
        }

        *(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) = 1;
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 48), *(id *)(a1 + 32));
        objc_msgSend(*(id *)(a1 + 40), "_updateRenewalTimerWithResponse:", v7);
        (*(void (**)(_QWORD, uint64_t, id, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 1, v8, 0);
        goto LABEL_20;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v26 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v30 = v26;
        v31 = 2114;
        v32 = v14;
        _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Start: Failed to import lease response data with error: %{public}@", buf, 0x16u);
      }

      v25 = *(_QWORD *)(a1 + 48);
      if (!v14)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, id, void *))(v25 + 16))(v25, 0, v8, v27);

        v14 = 0;
        goto LABEL_20;
      }
    }
    else
    {
      v22 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v7, "responseDictionary");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v23;
        v31 = 2114;
        v32 = v24;
        _os_log_impl(&dword_1A03E3000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Start: Client data missing from response: %{public}@", buf, 0x16u);

      }
      v25 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(uint64_t, _QWORD, id, id))(v25 + 16))(v25, 0, v8, v14);
LABEL_20:

    goto LABEL_21;
  }
  v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v19 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v30 = v19;
    v31 = 2114;
    v32 = v10;
    _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Start: Received response error: %{public}@", buf, 0x16u);
  }

  v20 = *(_QWORD *)(a1 + 48);
  if (v10)
  {
    (*(void (**)(_QWORD, _QWORD, id, void *))(v20 + 16))(*(_QWORD *)(a1 + 48), 0, v8, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id, void *))(v20 + 16))(v20, 0, v8, v21);

  }
LABEL_21:

}

uint64_t __61__ICSuzeLeaseSession_startLeaseSessionWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

_QWORD *__53__ICSuzeLeaseSession_endAutomaticallyRefreshingLease__block_invoke(uint64_t a1)
{
  _QWORD *result;

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(_QWORD **)(a1 + 32);
  if (!result[1])
    return (_QWORD *)objc_msgSend(result, "_updateRenewalTimer");
  return result;
}

_QWORD *__55__ICSuzeLeaseSession_beginAutomaticallyRefreshingLease__block_invoke(uint64_t a1)
{
  _QWORD *result;

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(_QWORD **)(a1 + 32);
  if (result[1] == 1)
    return (_QWORD *)objc_msgSend(result, "_updateRenewalTimer");
  return result;
}

@end
