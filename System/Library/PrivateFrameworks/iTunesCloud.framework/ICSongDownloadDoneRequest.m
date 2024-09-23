@implementation ICSongDownloadDoneRequest

- (ICSongDownloadDoneRequest)initWithRequestContext:(id)a3 downloadIdentifier:(id)a4 songID:(unint64_t)a5
{
  id v9;
  id v10;
  ICSongDownloadDoneRequest *v11;
  ICSongDownloadDoneRequest *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICSongDownloadDoneRequest;
  v11 = -[ICRequestOperation init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_requestContext, a3);
    objc_storeStrong((id *)&v12->_downloadIdentifier, a4);
    v12->_songID = a5;
  }

  return v12;
}

- (void)performRequestWithResponseHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__ICSongDownloadDoneRequest_performRequestWithResponseHandler___block_invoke;
  v6[3] = &unk_1E43915E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ICRequestOperation performRequestWithCompletionHandler:](self, "performRequestWithCompletionHandler:", v6);

}

- (void)execute
{
  NSObject *v3;
  NSString *downloadIdentifier;
  unint64_t songID;
  void *v6;
  ICStoreRequestContext *requestContext;
  _QWORD v8[5];
  uint8_t buf[4];
  NSString *v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    downloadIdentifier = self->_downloadIdentifier;
    songID = self->_songID;
    *(_DWORD *)buf = 138543618;
    v10 = downloadIdentifier;
    v11 = 2048;
    v12 = songID;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "performing songDownloadDone request. downloadID=%{public}@, songID=%llu", buf, 0x16u);
  }

  +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  requestContext = self->_requestContext;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__ICSongDownloadDoneRequest_execute__block_invoke;
  v8[3] = &unk_1E4391658;
  v8[4] = self;
  objc_msgSend(v6, "getBagForRequestContext:withCompletionHandler:", requestContext, v8);

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICSongDownloadDoneRequest;
  -[ICSongDownloadDoneRequest cancel](&v4, sel_cancel);
  +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelRequest:", self->_storeURLRequest);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeURLRequest, 0);
  objc_storeStrong((id *)&self->_downloadIdentifier, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
}

void __36__ICSongDownloadDoneRequest_execute__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ICStoreURLRequest *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
  }
  else
  {
    objc_msgSend(a2, "urlForBagKey:", CFSTR("songDownloadDone"));
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      v23[0] = CFSTR("download-id");
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(v6 + 312);
      v23[1] = CFSTR("songId");
      v24[0] = v7;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), *(_QWORD *)(v6 + 320));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ic_URLByAppendingQueryParameters:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICStoreURLRequest alloc], "initWithURLRequest:requestContext:", v11, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304));
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(v13 + 328);
      *(_QWORD *)(v13 + 328) = v12;

      objc_msgSend(*(id *)(a1 + 32), "progress");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "progress");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addChild:withPendingUnitCount:", v16, 100);

      +[ICURLSessionManager defaultSession](ICURLSessionManager, "defaultSession");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(_QWORD *)(v18 + 328);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __36__ICSongDownloadDoneRequest_execute__block_invoke_2;
      v22[3] = &unk_1E4391630;
      v22[4] = v18;
      objc_msgSend(v17, "enqueueDataRequest:withCompletionHandler:", v19, v22);

    }
    else
    {
      v20 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "finishWithError:");

    }
  }
}

uint64_t __36__ICSongDownloadDoneRequest_execute__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
}

void __63__ICSongDownloadDoneRequest_performRequestWithResponseHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 328);
  *(_QWORD *)(v2 + 328) = 0;

}

@end
