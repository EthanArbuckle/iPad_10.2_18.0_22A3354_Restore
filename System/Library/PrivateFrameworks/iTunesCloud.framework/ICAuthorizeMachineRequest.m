@implementation ICAuthorizeMachineRequest

- (ICAuthorizeMachineRequest)initWithRequestContext:(id)a3
{
  id v4;
  ICAuthorizeMachineRequest *v5;
  ICAuthorizeMachineRequest *v6;
  uint64_t v7;
  ICStoreRequestContext *requestContext;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICAuthorizeMachineRequest;
  v5 = -[ICAuthorizeMachineRequest init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_qualityOfService = 17;
    v7 = objc_msgSend(v4, "copy");
    requestContext = v6->_requestContext;
    v6->_requestContext = (ICStoreRequestContext *)v7;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRequestContext:", self->_requestContext);
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_reason, "copyWithZone:", a3);
    v7 = (void *)v5[3];
    v5[3] = v6;

    v8 = -[NSData copyWithZone:](self->_tokenData, "copyWithZone:", a3);
    v9 = (void *)v5[5];
    v5[5] = v8;

    v10 = -[NSString copyWithZone:](self->_keybagPath, "copyWithZone:", a3);
    v11 = (void *)v5[1];
    v5[1] = v10;

    v5[2] = self->_qualityOfService;
  }
  return v5;
}

- (void)performWithResponseHandler:(id)a3
{
  id v4;
  ICAsyncBlockOperation *v5;
  id v6;
  ICAsyncBlockOperation *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  ICAuthorizeMachineRequest *v13;
  id v14;

  v4 = a3;
  v5 = [ICAsyncBlockOperation alloc];
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __56__ICAuthorizeMachineRequest_performWithResponseHandler___block_invoke;
  v12 = &unk_1E438EFB0;
  v13 = self;
  v14 = v4;
  v6 = v4;
  v7 = -[ICAsyncBlockOperation initWithStartHandler:](v5, "initWithStartHandler:", &v9);
  objc_msgSend(MEMORY[0x1E0CB3828], "ic_sharedRequestOperationQueueWithQualityOfService:", self->_qualityOfService, v9, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addOperation:", v7);

}

- (NSString)keybagPath
{
  return self->_keybagPath;
}

- (void)setKeybagPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)setRequestContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)tokenData
{
  return self->_tokenData;
}

- (void)setTokenData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenData, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_keybagPath, 0);
}

void __56__ICAuthorizeMachineRequest_performWithResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__ICAuthorizeMachineRequest_performWithResponseHandler___block_invoke_2;
  v14[3] = &unk_1E438D3D0;
  v5 = *(id *)(a1 + 40);
  v15 = v3;
  v16 = v5;
  v6 = v3;
  v7 = (void *)MEMORY[0x1A1AFA8D0](v14);
  +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(v9 + 32);
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __56__ICAuthorizeMachineRequest_performWithResponseHandler___block_invoke_3;
  v12[3] = &unk_1E438D3F8;
  v12[4] = v9;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v8, "getBagForRequestContext:withCompletionHandler:", v10, v12);

}

void __56__ICAuthorizeMachineRequest_performWithResponseHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, id);
  id v7;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void (**)(uint64_t, uint64_t, id))(v5 + 16);
  v7 = a3;
  v6(v5, a2, v7);
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v7);

}

void __56__ICAuthorizeMachineRequest_performWithResponseHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  ICAuthorizeMachineURLRequest *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(a2, "urlForBagKey:", CFSTR("authorizeMachine"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v6);
      v8 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICAuthorizeMachineURLRequest alloc], "initWithURLRequest:requestContext:", v7, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
      -[ICAuthorizeMachineURLRequest setReason:](v8, "setReason:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
      -[ICAuthorizeMachineURLRequest setTokenData:](v8, "setTokenData:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
      -[ICAuthorizeMachineURLRequest setKeybagPath:](v8, "setKeybagPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
      +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __56__ICAuthorizeMachineRequest_performWithResponseHandler___block_invoke_4;
      v17[3] = &unk_1E4391008;
      v10 = *(void **)(a1 + 40);
      v17[4] = *(_QWORD *)(a1 + 32);
      v18 = v10;
      objc_msgSend(v9, "enqueueDataRequest:withCompletionHandler:", v8, v17);

    }
    else
    {
      v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v20 = v15;
        _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Missing authorize machine URL bag key", buf, 0xCu);
      }

      v16 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v7);
    }

    goto LABEL_12;
  }
  v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v20 = v12;
    v21 = 2114;
    v22 = v5;
    _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Failed to load URL bag with error: %{public}@", buf, 0x16u);
  }

  v13 = *(_QWORD *)(a1 + 40);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7200, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v6);
LABEL_12:

    goto LABEL_13;
  }
  (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v5);
LABEL_13:

}

void __56__ICAuthorizeMachineRequest_performWithResponseHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  ICAuthorizeMachineResponse *v9;
  void *v10;
  void *v11;
  void *v12;
  int ContextIdentifierForFolderPath;
  id v14;
  void *v15;
  _BOOL4 v16;
  id v17;
  NSObject *v18;
  _BOOL4 v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  unsigned int v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6)
  {
    objc_msgSend(v5, "parsedBodyDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v27 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v39 = v28;
        _os_log_impl(&dword_1A03E3000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Response has invalid format", buf, 0xCu);
      }

      v29 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, 0);
      v9 = (ICAuthorizeMachineResponse *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, ICAuthorizeMachineResponse *))(v29 + 16))(v29, 0, v9);
      goto LABEL_29;
    }
    v9 = -[ICAuthorizeMachineResponse initWithResponseDictionary:]([ICAuthorizeMachineResponse alloc], "initWithResponseDictionary:", v8);
    -[ICAuthorizeMachineResponse keybagData](v9, "keybagData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
LABEL_26:
      v32 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v39 = v33;
        _os_log_impl(&dword_1A03E3000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] Finishing.", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_29:

      goto LABEL_30;
    }
    v37 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "fileExistsAtPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)) & 1) == 0)
      objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 1, 0, 0);
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v36 = 0;
    ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(v12, &v37, &v36);
    v14 = v36;
    v15 = v14;
    if (!ContextIdentifierForFolderPath)
    {
      v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v30 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v39 = v30;
        v40 = 2114;
        v41 = v15;
        _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting context ID failed with error: %{public}@", buf, 0x16u);
      }
      v17 = v15;
      goto LABEL_25;
    }
    v34 = v11;
    v35 = v14;
    v16 = ICFairPlayImportKeybagDataWithContextID(v37, v10, &v35);
    v17 = v35;

    v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      v11 = v34;
      if (v19)
      {
        v20 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v39 = v20;
        v21 = "[%{public}@] Imported keybag data.";
        v22 = v18;
        v23 = 12;
LABEL_24:
        _os_log_impl(&dword_1A03E3000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
      }
    }
    else
    {
      v11 = v34;
      if (v19)
      {
        v31 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v39 = v31;
        v40 = 2114;
        v41 = v17;
        v21 = "[%{public}@] Importing keybag data failed with error: %{public}@";
        v22 = v18;
        v23 = 22;
        goto LABEL_24;
      }
    }
LABEL_25:

    goto LABEL_26;
  }
  v24 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v39 = v25;
    v40 = 2114;
    v41 = v7;
    _os_log_impl(&dword_1A03E3000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] Response returned error: %{public}@", buf, 0x16u);
  }

  v26 = *(_QWORD *)(a1 + 40);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v26 + 16))(v26, 0, v8);
LABEL_30:

    goto LABEL_31;
  }
  (*(void (**)(uint64_t, _QWORD, void *))(v26 + 16))(v26, 0, v7);
LABEL_31:

}

@end
