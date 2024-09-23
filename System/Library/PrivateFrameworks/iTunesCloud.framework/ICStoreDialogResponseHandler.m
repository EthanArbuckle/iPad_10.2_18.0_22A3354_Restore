@implementation ICStoreDialogResponseHandler

- (ICStoreDialogResponseHandler)init
{
  ICStoreDialogResponseHandlerConfiguration *v3;
  ICStoreDialogResponseHandler *v4;

  v3 = objc_alloc_init(ICStoreDialogResponseHandlerConfiguration);
  v4 = -[ICStoreDialogResponseHandler initWithConfiguration:](self, "initWithConfiguration:", v3);

  return v4;
}

- (ICStoreDialogResponseHandler)initWithConfiguration:(id)a3
{
  ICStoreDialogResponseHandlerConfiguration *v4;
  ICStoreDialogResponseHandler *v5;
  objc_super v7;

  v4 = (ICStoreDialogResponseHandlerConfiguration *)a3;
  v7.receiver = self;
  v7.super_class = (Class)ICStoreDialogResponseHandler;
  v5 = -[ICStoreDialogResponseHandler init](&v7, sel_init);
  if (v5)
  {
    if (!v4)
      v4 = objc_alloc_init(ICStoreDialogResponseHandlerConfiguration);
    v5->_allowsHandlingNonAuthenticationDialogs = -[ICStoreDialogResponseHandlerConfiguration allowsHandlingNonAuthenticationDialogs](v4, "allowsHandlingNonAuthenticationDialogs");
    v5->_shouldRecordLastAuthenticationDialogResponseTime = -[ICStoreDialogResponseHandlerConfiguration shouldRecordLastAuthenticationDialogResponseTime](v4, "shouldRecordLastAuthenticationDialogResponseTime");
  }

  return v5;
}

- (void)handleButtonAction:(id)a3 usingRequestContext:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    switch(objc_msgSend(v8, "type"))
    {
      case 0:
        goto LABEL_6;
      case 1:
        -[ICStoreDialogResponseHandler _handleBuyButtonAction:usingRequestContext:withCompletionHandler:](self, "_handleBuyButtonAction:usingRequestContext:withCompletionHandler:", v8, v9, v10);
        break;
      case 2:
      case 3:
      case 4:
        -[ICStoreDialogResponseHandler _handleGotoButtonAction:usingRequestContext:withCompletionHandler:](self, "_handleGotoButtonAction:usingRequestContext:withCompletionHandler:", v8, v9, v10);
        break;
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
        v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          v12 = 134217984;
          v13 = objc_msgSend(v8, "type");
          _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_FAULT, "unexpected dialog button action type %ld", (uint8_t *)&v12, 0xCu);
        }

        goto LABEL_6;
      case 11:
        -[ICStoreDialogResponseHandler _handleFamilyPermissionButtonAction:usingRequestContext:completion:](self, "_handleFamilyPermissionButtonAction:usingRequestContext:completion:", v8, v9, v10);
        break;
      default:
        break;
    }
  }
  else
  {
LABEL_6:
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }

}

- (void)handleStoreDialogResponse:(id)a3 usingRequestContext:(id)a4 withCompletionHandler:(id)a5
{
  -[ICStoreDialogResponseHandler handleStoreDialogResponse:usingRequestContext:withDialogTimeout:withCompletionHandler:](self, "handleStoreDialogResponse:usingRequestContext:withDialogTimeout:withCompletionHandler:", a3, a4, a5, 0.0);
}

- (void)handleStoreDialogResponse:(id)a3 usingRequestContext:(id)a4 withDialogTimeout:(double)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  int v14;
  NSObject *v16;
  int v18;
  ICStoreDialogResponseHandler *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = objc_msgSend(v10, "type");
  v14 = v13;
  if (self->_allowsHandlingNonAuthenticationDialogs || v13 == 1)
  {
    if (v13 == 1)
    {
      -[ICStoreDialogResponseHandler _handleAuthenticationStoreDialogResponse:usingRequestContext:withDialogTimeout:withCompletionHandler:](self, "_handleAuthenticationStoreDialogResponse:usingRequestContext:withDialogTimeout:withCompletionHandler:", v10, v11, v12, a5);
    }
    else if (!v13)
    {
      -[ICStoreDialogResponseHandler _handleDefaultStoreDialogResponse:usingRequestContext:withDialogTimeout:withCompletionHandler:](self, "_handleDefaultStoreDialogResponse:usingRequestContext:withDialogTimeout:withCompletionHandler:", v10, v11, v12, a5);
    }
  }
  else
  {
    v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138543618;
      v19 = self;
      v20 = 1024;
      v21 = v14;
      _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Not handling dialog response because its not allowed for dialog type %d", (uint8_t *)&v18, 0x12u);
    }

    if (v12)
      (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);
  }

}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v3 = MSVHasherSharedSeed();
  v5 = v4;
  v6 = v3 ^ 0x736F6D6570736575;
  v7 = v4 ^ 0x646F72616E646F6DLL;
  v8 = v3 ^ 0x6C7967656E657261;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = v5 ^ 0x7465646279746573 ^ v11;
  v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  v14 = v8 + v12;
  v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  v16 = v15 + __ROR8__(v6 + v7, 32);
  v17 = v14 + v13;
  v58 = __ROR8__(v17, 32);
  v59 = v16 ^ __ROR8__(v15, 43);
  v54 = v16 ^ v11;
  v56 = v17 ^ __ROR8__(v13, 47);

  v60 = self->_allowsHandlingNonAuthenticationDialogs | 0xC00000000000000;
  v18 = v60 & 0xFFFFFFFFFFFFFFLL | ((unint64_t)self->_shouldRecordLastAuthenticationDialogResponseTime << 32);
  v19 = (v54 + v56) ^ __ROR8__(v56, 51);
  v20 = v58 + (v18 ^ v59);
  v21 = __ROR8__(v18 ^ v59, 48);
  v22 = (v20 ^ v21) + __ROR8__(v54 + v56, 32);
  v23 = v22 ^ __ROR8__(v20 ^ v21, 43);
  v24 = v20 + v19;
  v55 = v22 ^ v18;
  v57 = v24 ^ __ROR8__(v19, 47);
  v25 = ((v22 ^ v18) + v57) ^ __ROR8__(v57, 51);
  v26 = __ROR8__(v24, 32) + (v23 ^ ((v60 & 0xFF00000000000000) + 0x400000000000000));
  v27 = __ROR8__(v23 ^ ((v60 & 0xFF00000000000000) + 0x400000000000000), 48);
  v28 = (v26 ^ v27) + __ROR8__(v55 + v57, 32);
  v29 = v28 ^ __ROR8__(v26 ^ v27, 43);
  v30 = v26 + v25;
  v31 = v30 ^ __ROR8__(v25, 47);
  v32 = (v28 ^ ((v60 & 0xFF00000000000000) + 0x400000000000000)) + v31;
  v33 = v32 ^ __ROR8__(v31, 51);
  v34 = (__ROR8__(v30, 32) ^ 0xFFLL) + v29;
  v35 = __ROR8__(v29, 48);
  v36 = __ROR8__(v32, 32) + (v34 ^ v35);
  v37 = v36 ^ __ROR8__(v34 ^ v35, 43);
  v38 = v33 + v34;
  v39 = v38 ^ __ROR8__(v33, 47);
  v40 = v39 + v36;
  v41 = v40 ^ __ROR8__(v39, 51);
  v42 = __ROR8__(v38, 32) + v37;
  v43 = __ROR8__(v37, 48);
  v44 = __ROR8__(v40, 32) + (v42 ^ v43);
  v45 = v44 ^ __ROR8__(v42 ^ v43, 43);
  v46 = v41 + v42;
  v47 = v46 ^ __ROR8__(v41, 47);
  v48 = v47 + v44;
  v49 = v48 ^ __ROR8__(v47, 51);
  v50 = __ROR8__(v46, 32) + v45;
  v51 = __ROR8__(v45, 48);
  v52 = __ROR8__(v48, 32) + (v50 ^ v51);
  return (v49 + v50) ^ __ROR8__(v49, 47) ^ v52 ^ __ROR8__(v49 + v50, 32) ^ v52 ^ __ROR8__(v50 ^ v51, 43);
}

- (BOOL)isEqual:(id)a3
{
  ICStoreDialogResponseHandler *v4;
  BOOL v5;

  v4 = (ICStoreDialogResponseHandler *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else if (!-[ICStoreDialogResponseHandler isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
         || !self->_allowsHandlingNonAuthenticationDialogs == v4->_allowsHandlingNonAuthenticationDialogs)
  {
    v5 = 0;
  }
  else
  {
    v5 = !self->_shouldRecordLastAuthenticationDialogResponseTime ^ v4->_shouldRecordLastAuthenticationDialogResponseTime;
  }

  return v5;
}

- (ICStoreDialogResponseHandler)initWithCoder:(id)a3
{
  id v4;
  ICStoreDialogResponseHandlerConfiguration *v5;
  uint64_t v6;
  ICStoreDialogResponseHandler *v7;

  v4 = a3;
  v5 = objc_alloc_init(ICStoreDialogResponseHandlerConfiguration);
  -[ICStoreDialogResponseHandlerConfiguration setAllowsHandlingNonAuthenticationDialogs:](v5, "setAllowsHandlingNonAuthenticationDialogs:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsHandlingNonAuthenticationDialogs")));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldRecordLastAuthenticationDialogResponseTime"));

  -[ICStoreDialogResponseHandlerConfiguration setShouldRecordLastAuthenticationDialogResponseTime:](v5, "setShouldRecordLastAuthenticationDialogResponseTime:", v6);
  v7 = -[ICStoreDialogResponseHandler initWithConfiguration:](self, "initWithConfiguration:", v5);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 allowsHandlingNonAuthenticationDialogs;
  id v5;

  allowsHandlingNonAuthenticationDialogs = self->_allowsHandlingNonAuthenticationDialogs;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", allowsHandlingNonAuthenticationDialogs, CFSTR("allowsHandlingNonAuthenticationDialogs"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldRecordLastAuthenticationDialogResponseTime, CFSTR("shouldRecordLastAuthenticationDialogResponseTime"));

}

- (void)_handleDefaultStoreDialogResponse:(id)a3 usingRequestContext:(id)a4 withDialogTimeout:(double)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  ICUserNotificationBuilder *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint8_t buf[4];
  ICStoreDialogResponseHandler *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = -[ICUserNotificationBuilder initWithStoreDialog:]([ICUserNotificationBuilder alloc], "initWithStoreDialog:", v10);
  -[ICUserNotificationBuilder setTimeoutInterval:](v13, "setTimeoutInterval:", a5);
  v14 = -[ICUserNotificationBuilder createCFUserNotification](v13, "createCFUserNotification");
  if (v14)
  {
    v15 = v14;
    +[ICUserNotificationManager sharedManager](ICUserNotificationManager, "sharedManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __126__ICStoreDialogResponseHandler__handleDefaultStoreDialogResponse_usingRequestContext_withDialogTimeout_withCompletionHandler___block_invoke;
    v19[3] = &unk_1E438C820;
    v23 = v15;
    v19[4] = self;
    v22 = v12;
    v20 = v10;
    v21 = v11;
    objc_msgSend(v16, "displayUserNotification:withCompletionHandler:", v15, v19);

  }
  else
  {
    v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v25 = self;
      _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create user notification", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v18);

  }
}

- (void)_handleAuthenticationStoreDialogResponse:(id)a3 usingRequestContext:(id)a4 withDialogTimeout:(double)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  ICStoreDialogResponseHandler *v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (self->_shouldRecordLastAuthenticationDialogResponseTime)
  {
    +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v13, "setLastAuthenticationDialogResponseTime:");

  }
  if (v11
    && (objc_msgSend(v11, "authenticationProvider"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        v14))
  {
    objc_msgSend(v11, "authenticationProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __133__ICStoreDialogResponseHandler__handleAuthenticationStoreDialogResponse_usingRequestContext_withDialogTimeout_withCompletionHandler___block_invoke;
    v16[3] = &unk_1E438E350;
    v17 = v10;
    v18 = v11;
    v19 = self;
    v20 = v12;
    objc_msgSend(v15, "performAuthenticationUsingRequestContext:withCompletionHandler:", v18, v16);

  }
  else
  {
    -[ICStoreDialogResponseHandler _handleDefaultStoreDialogResponse:usingRequestContext:withDialogTimeout:withCompletionHandler:](self, "_handleDefaultStoreDialogResponse:usingRequestContext:withDialogTimeout:withCompletionHandler:", v10, v11, v12, a5);
  }

}

- (void)_handleBuyButtonAction:(id)a3 usingRequestContext:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  ICMatchRedownloadRequest *v13;
  id *v14;
  id v15;
  uint64_t *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, void *);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "buyParams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v9;
    _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "Performing Buy button action with params %{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E98], "ic_queryParametersDictionaryFromString:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("sagaId"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = -[ICMediaRedownloadRequest initWithRequestContext:redownloadParametersString:]([ICMatchRedownloadRequest alloc], "initWithRequestContext:redownloadParametersString:", v7, v9);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __97__ICStoreDialogResponseHandler__handleBuyButtonAction_usingRequestContext_withCompletionHandler___block_invoke;
    v23[3] = &unk_1E438C870;
    v14 = &v24;
    v24 = v8;
    v15 = v8;
    v16 = v23;
  }
  else
  {
    v13 = -[ICBuyProductRequest initWithRequestContext:buyParametersString:includeKeybagSyncData:]([ICBuyProductRequest alloc], "initWithRequestContext:buyParametersString:includeKeybagSyncData:", v7, v9, 0);
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __97__ICStoreDialogResponseHandler__handleBuyButtonAction_usingRequestContext_withCompletionHandler___block_invoke_18;
    v21 = &unk_1E438C898;
    v14 = &v22;
    v22 = v8;
    v17 = v8;
    v16 = &v18;
  }
  -[ICMediaRedownloadRequest performRequestWithResponseHandler:](v13, "performRequestWithResponseHandler:", v16, v18, v19, v20, v21);

}

- (void)_handleGotoButtonAction:(id)a3 usingRequestContext:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ICStoreURLRequest *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "subtarget");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10
    && (v11 = (void *)v10,
        objc_msgSend(v7, "subtarget"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("background")),
        v12,
        v11,
        !v13))
  {
    objc_msgSend(v7, "subtarget");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "hasPrefix:", CFSTR("account"));

    if (!v21)
    {
      v22 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "subtarget");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v23;
        _os_log_impl(&dword_1A03E3000, v22, OS_LOG_TYPE_DEFAULT, "unknown Goto button action subtarget %{public}@", buf, 0xCu);

      }
    }
    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }
  else
  {
    objc_msgSend(v7, "URLString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)MEMORY[0x1E0C92C28];
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "requestWithURL:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICStoreURLRequest alloc], "initWithURLRequest:requestContext:", v17, v8);
      +[ICURLSessionManager unlimitedHighPrioritySession](ICURLSessionManager, "unlimitedHighPrioritySession");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __98__ICStoreDialogResponseHandler__handleGotoButtonAction_usingRequestContext_withCompletionHandler___block_invoke;
      v25[3] = &unk_1E438D328;
      v26 = v9;
      objc_msgSend(v19, "enqueueDataRequest:withCompletionHandler:", v18, v25);

    }
    else
    {
      v24 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A03E3000, v24, OS_LOG_TYPE_DEFAULT, "missing action URL in Goto button action - skipping", buf, 2u);
      }

      (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
    }

  }
}

- (void)_handleFamilyPermissionButtonAction:(id)a3 usingRequestContext:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  __int128 buf;
  Class (*v35)(uint64_t);
  void *v36;
  uint64_t *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "URLString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    objc_msgSend(v12, "DSIDForUserIdentity:outError:", v13, &v29);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v29;

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0C8F2B8], "ic_sharedAccountStore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v15;
      objc_msgSend(v16, "ic_storeAccountForStoreAccountID:error:", v14, &v28);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v28;

      if (v17)
      {
        v30 = 0;
        v31 = &v30;
        v32 = 0x2050000000;
        v19 = (void *)getAPRequestHandlerClass_softClass;
        v33 = getAPRequestHandlerClass_softClass;
        if (!getAPRequestHandlerClass_softClass)
        {
          *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
          *((_QWORD *)&buf + 1) = 3221225472;
          v35 = __getAPRequestHandlerClass_block_invoke;
          v36 = &unk_1E4391138;
          v37 = &v30;
          __getAPRequestHandlerClass_block_invoke((uint64_t)&buf);
          v19 = (void *)v31[3];
        }
        v20 = objc_retainAutorelease(v19);
        _Block_object_dispose(&v30, 8);
        if (v20)
        {
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __99__ICStoreDialogResponseHandler__handleFamilyPermissionButtonAction_usingRequestContext_completion___block_invoke;
          v26[3] = &unk_1E438E500;
          v27 = v9;
          objc_msgSend(v20, "addRequestWithURL:account:completion:", v11, v17, v26);

        }
        else
        {
          v24 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1A03E3000, v24, OS_LOG_TYPE_ERROR, "Failed to load APRequestHandler class - assuming not available on this platform", (uint8_t *)&buf, 2u);
          }

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7002, 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v25);

        }
      }
      else
      {
        v23 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v18;
          _os_log_impl(&dword_1A03E3000, v23, OS_LOG_TYPE_ERROR, "Failed to resolve account for family permissions dialog. err=%{public}@", (uint8_t *)&buf, 0xCu);
        }

        (*((void (**)(id, _QWORD, id))v9 + 2))(v9, 0, v18);
      }

      v15 = v18;
    }
    else
    {
      v22 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v15;
        _os_log_impl(&dword_1A03E3000, v22, OS_LOG_TYPE_ERROR, "Failed to resolve identity for family permissions dialog. err=%{public}@", (uint8_t *)&buf, 0xCu);
      }

      (*((void (**)(id, _QWORD, id))v9 + 2))(v9, 0, v15);
    }

  }
  else
  {
    v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A03E3000, v21, OS_LOG_TYPE_DEFAULT, "missing action URL in family permissions button action - skipping", (uint8_t *)&buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }

}

void __99__ICStoreDialogResponseHandler__handleFamilyPermissionButtonAction_usingRequestContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Family permissions request completed with err=%{public}@", buf, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB3388];
    v10 = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v8);

  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v5 + 16))(v5, 1, 0);
  }

}

void __98__ICStoreDialogResponseHandler__handleGotoButtonAction_usingRequestContext_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    if (objc_msgSend(a2, "statusCode") == 200)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7101, 0);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __97__ICStoreDialogResponseHandler__handleBuyButtonAction_usingRequestContext_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "Failed to perform buy button action. err=%{public}@", (uint8_t *)&v7, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __97__ICStoreDialogResponseHandler__handleBuyButtonAction_usingRequestContext_withCompletionHandler___block_invoke_18(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = v4;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "Failed to perform buy button action. err=%{public}@", (uint8_t *)&v6, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __133__ICStoreDialogResponseHandler__handleAuthenticationStoreDialogResponse_usingRequestContext_withDialogTimeout_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  char v20;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v3 = a2;
  v28 = *MEMORY[0x1E0C80C00];
  if (a3 || !(_DWORD)a2)
  {
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), a2);
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "buttons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
LABEL_5:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
        if (objc_msgSend(v10, "type") == 1)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v7)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
      objc_msgSend(v10, "action");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        goto LABEL_15;
      v12 = *(void **)(a1 + 40);
      v13 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __133__ICStoreDialogResponseHandler__handleAuthenticationStoreDialogResponse_usingRequestContext_withDialogTimeout_withCompletionHandler___block_invoke_2;
      v21[3] = &unk_1E4390188;
      v22 = v12;
      v14 = (void *)objc_msgSend(v22, "copyWithBlock:", v21);
      v17[0] = v13;
      v17[1] = 3221225472;
      v17[2] = __133__ICStoreDialogResponseHandler__handleAuthenticationStoreDialogResponse_usingRequestContext_withDialogTimeout_withCompletionHandler___block_invoke_3;
      v17[3] = &unk_1E438C848;
      v15 = *(void **)(a1 + 48);
      v16 = *(id *)(a1 + 56);
      v20 = v3;
      v18 = 0;
      v19 = v16;
      objc_msgSend(v15, "handleButtonAction:usingRequestContext:withCompletionHandler:", v11, v14, v17);

    }
    else
    {
LABEL_11:

LABEL_15:
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
  }
}

void __133__ICStoreDialogResponseHandler__handleAuthenticationStoreDialogResponse_usingRequestContext_withDialogTimeout_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  ICURLResponseAuthenticationProvider *v4;
  ICURLResponseAuthenticationProvider *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "setStoreDialogResponseHandler:", 0);
  v4 = [ICURLResponseAuthenticationProvider alloc];
  objc_msgSend(*(id *)(a1 + 32), "authenticationProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[ICURLResponseAuthenticationProvider initWithUserInteractionLevel:](v4, "initWithUserInteractionLevel:", objc_msgSend(v6, "interactionLevel"));
  objc_msgSend(v3, "setAuthenticationProvider:", v5);

}

uint64_t __133__ICStoreDialogResponseHandler__handleAuthenticationStoreDialogResponse_usingRequestContext_withDialogTimeout_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __126__ICStoreDialogResponseHandler__handleDefaultStoreDialogResponse_usingRequestContext_withDialogTimeout_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  CFRelease(*(CFTypeRef *)(a1 + 64));
  if (!v5)
  {
    ICUserNotificationGetResponseButton(*(void **)(a1 + 40), (char)a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if (objc_msgSend(v8, "type") != 2)
      {
        v18 = *(void **)(a1 + 32);
        objc_msgSend(v9, "action");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleButtonAction:usingRequestContext:withCompletionHandler:", v19, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

        goto LABEL_15;
      }
      v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v20 = 138543362;
        v21 = v11;
        _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ User cancelled the dialog", (uint8_t *)&v20, 0xCu);
      }

      v12 = *(_QWORD *)(a1 + 56);
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = -7004;
    }
    else
    {
      v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = *(_QWORD *)(a1 + 32);
        v20 = 138543618;
        v21 = v16;
        v22 = 2048;
        v23 = a2;
        _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Failed to find user notification button for responseFlags %lu", (uint8_t *)&v20, 0x16u);
      }

      v12 = *(_QWORD *)(a1 + 56);
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = 0;
    }
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("ICError"), v14, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v17);

LABEL_15:
    goto LABEL_16;
  }
  v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v20 = 138543618;
    v21 = v7;
    v22 = 2114;
    v23 = v5;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to display user notification. err=%{public}@", (uint8_t *)&v20, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_16:

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
