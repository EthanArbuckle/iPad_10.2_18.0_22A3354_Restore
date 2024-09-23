@implementation STAskForTimeResource

- (STAskForTimeResource)initWithResourceIdentifier:(id)a3 resourceDisplayName:(id)a4 usageType:(int64_t)a5 changeHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  STAskForTimeResource *v13;
  uint64_t v14;
  STAskForTimeClient *askForTimeClient;
  STAskForTimeRequest *v16;
  STAskForTimeRequest *request;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  id v22;
  void *v23;
  id changeHandler;
  _QWORD handler[4];
  id v27;
  id v28;
  id v29;
  id location;
  int out_token;
  objc_super v32;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v32.receiver = self;
  v32.super_class = (Class)STAskForTimeResource;
  v13 = -[STAskForTimeResource init](&v32, sel_init);
  if (v13)
  {
    v14 = objc_opt_new();
    askForTimeClient = v13->_askForTimeClient;
    v13->_askForTimeClient = (STAskForTimeClient *)v14;

    v16 = -[STAskForTimeRequest initWithUsageType:requestedResourceIdentifier:]([STAskForTimeRequest alloc], "initWithUsageType:requestedResourceIdentifier:", a5, v10);
    request = v13->_request;
    v13->_request = v16;

    -[STAskForTimeRequest setResourceDisplayName:](v13->_request, "setResourceDisplayName:", v11);
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_USER_INITIATED, 0);
    v19 = objc_claimAutoreleasedReturnValue();

    v20 = dispatch_queue_create("com.apple.ScreenTimeAgent.ask-callback", v19);
    out_token = 0;
    objc_initWeak(&location, v13);
    v21 = (const char *)objc_msgSend(CFSTR("AskForTimeMessageReceived"), "UTF8String");
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __95__STAskForTimeResource_initWithResourceIdentifier_resourceDisplayName_usageType_changeHandler___block_invoke;
    handler[3] = &unk_1E9370CF0;
    objc_copyWeak(&v29, &location);
    v27 = v10;
    v22 = v12;
    v28 = v22;
    notify_register_dispatch(v21, &out_token, v20, handler);
    v23 = _Block_copy(v22);
    changeHandler = v13->_changeHandler;
    v13->_changeHandler = v23;

    v13->_notificationToken = out_token;
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

  }
  return v13;
}

void __95__STAskForTimeResource_initWithResourceIdentifier_resourceDisplayName_usageType_changeHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  +[STLog ask](STLog, "ask");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_1D22E7000, v3, OS_LOG_TYPE_DEFAULT, "Received callback for ask for time resource %{public}@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(WeakRetained, "checkRequestForAdditionalTimeWithResponseHandler:", *(_QWORD *)(a1 + 40));
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_notificationToken);
  v3.receiver = self;
  v3.super_class = (Class)STAskForTimeResource;
  -[STAskForTimeResource dealloc](&v3, sel_dealloc);
}

- (void)requestAdditionalTime:(double)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  STAskForTimeResource *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  +[STLog ask](STLog, "ask");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = self;
    _os_log_impl(&dword_1D22E7000, v7, OS_LOG_TYPE_DEFAULT, "Requesting additional time %@", buf, 0xCu);
  }

  -[STAskForTimeResource request](self, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimeRequested:", v9);

  -[STAskForTimeResource askForTimeClient](self, "askForTimeClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__STAskForTimeResource_requestAdditionalTime_completionHandler___block_invoke;
  v12[3] = &unk_1E9370BE0;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v10, "sendAskForTimeRequest:completionHandler:", v8, v12);

}

void __64__STAskForTimeResource_requestAdditionalTime_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13[16];

  v3 = a2;
  +[STLog ask](STLog, "ask");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __64__STAskForTimeResource_requestAdditionalTime_completionHandler___block_invoke_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1D22E7000, v5, OS_LOG_TYPE_DEFAULT, "Send ask for time request succeeded", v13, 2u);
  }

  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v3);

}

- (void)approveAdditionalTime:(double)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  STAskForTimeResource *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  +[STLog ask](STLog, "ask");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = self;
    _os_log_impl(&dword_1D22E7000, v7, OS_LOG_TYPE_DEFAULT, "Requesting additional time %@", (uint8_t *)&v10, 0xCu);
  }

  -[STAskForTimeResource request](self, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimeRequested:", v9);

  -[STAskForTimeResource _approveExceptionForRequest:withCompletionHandler:](self, "_approveExceptionForRequest:withCompletionHandler:", v8, v6);
}

- (void)approveOneMoreMinuteWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  STAskForTimeResource *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[STLog ask](STLog, "ask");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = self;
    _os_log_impl(&dword_1D22E7000, v5, OS_LOG_TYPE_DEFAULT, "Requesting one more minute %@", (uint8_t *)&v7, 0xCu);
  }

  -[STAskForTimeResource request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOneMoreMinute:", 1);
  -[STAskForTimeResource _approveExceptionForRequest:withCompletionHandler:](self, "_approveExceptionForRequest:withCompletionHandler:", v6, v4);

}

- (void)_approveExceptionForRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[STAskForTimeResource askForTimeClient](self, "askForTimeClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__STAskForTimeResource__approveExceptionForRequest_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E9370D18;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "approveExceptionForRequest:completionHandler:", v9, v11);

}

void __74__STAskForTimeResource__approveExceptionForRequest_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v15;
  uint8_t v16[16];

  v3 = a2;
  +[STLog ask](STLog, "ask");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __74__STAskForTimeResource__approveExceptionForRequest_withCompletionHandler___block_invoke_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
    v12 = 3;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1D22E7000, v5, OS_LOG_TYPE_DEFAULT, "Approval for more time succeeded", v16, 2u);
    }
    v12 = 4;
  }

  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);
  objc_msgSend(*(id *)(a1 + 32), "changeHandler");
  v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "timeRequested");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, uint64_t, _QWORD, void *, id))v14)[2](v14, v12, 0, v15, v3);

}

- (void)checkRequestForAdditionalTimeWithResponseHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[STAskForTimeResource request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAskForTimeResource askForTimeClient](self, "askForTimeClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestedResourceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "usageType");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__STAskForTimeResource_checkRequestForAdditionalTimeWithResponseHandler___block_invoke;
  v10[3] = &unk_1E9370D40;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v6, "fetchLastResponseForRequestedResourceIdentifier:usageType:withCompletionHandler:", v7, v8, v10);

}

uint64_t __73__STAskForTimeResource_checkRequestForAdditionalTimeWithResponseHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)cancelOutstandingRequestsWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (STAskForTimeClient)askForTimeClient
{
  return self->_askForTimeClient;
}

- (void)setAskForTimeClient:(id)a3
{
  objc_storeStrong((id *)&self->_askForTimeClient, a3);
}

- (STAskForTimeRequest)request
{
  return self->_request;
}

- (int)notificationToken
{
  return self->_notificationToken;
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_askForTimeClient, 0);
}

void __64__STAskForTimeResource_requestAdditionalTime_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D22E7000, a2, a3, "Send ask for time request failed: %{public}@", a5, a6, a7, a8, 2u);
}

void __74__STAskForTimeResource__approveExceptionForRequest_withCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D22E7000, a2, a3, "Approval for more time failed: %{public}@", a5, a6, a7, a8, 2u);
}

@end
