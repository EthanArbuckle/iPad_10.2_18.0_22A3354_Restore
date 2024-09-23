@implementation ICSAPSession

void __66__ICSAPSession_sharedSAPSessionWithVersion_URLBag_requestContext___block_invoke_2_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v5 = -[ICSAPSession _initWithVersion:certificateURL:setupURL:requestContext:]([ICSAPSession alloc], "_initWithVersion:certificateURL:setupURL:requestContext:", *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = (void *)sharedSAPSessionWithVersion_URLBag_requestContext__sAvailableSessions;
    if (!sharedSAPSessionWithVersion_URLBag_requestContext__sAvailableSessions)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v10 = (void *)sharedSAPSessionWithVersion_URLBag_requestContext__sAvailableSessions;
      sharedSAPSessionWithVersion_URLBag_requestContext__sAvailableSessions = (uint64_t)v9;

      v8 = (void *)sharedSAPSessionWithVersion_URLBag_requestContext__sAvailableSessions;
    }
    objc_msgSend(v8, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  }
}

void __66__ICSAPSession_sharedSAPSessionWithVersion_URLBag_requestContext___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __66__ICSAPSession_sharedSAPSessionWithVersion_URLBag_requestContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v8, "sapVersion", (_QWORD)v14) == *(_DWORD *)(a1 + 48))
        {
          objc_msgSend(v8, "_certificateURL");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) != 0)
          {
            objc_msgSend(v8, "_setupURL");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "isEqual:", *(_QWORD *)(a1 + 40));

            if (v11)
            {
              v12 = v8;
              goto LABEL_14;
            }
          }
          else
          {

          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (ICFPSAPContext)_sapContext
{
  return self->_sapContext;
}

- (unsigned)sapVersion
{
  return self->_sapVersion;
}

- (NSURL)_setupURL
{
  return self->_setupURL;
}

- (NSURL)_certificateURL
{
  return self->_certificateURL;
}

void __47__ICSAPSession_signData_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__ICSAPSession_signData_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E4390E58;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

- (void)_setSAPContext:(id)a3
{
  objc_storeStrong((id *)&self->_sapContext, a3);
}

- (ICStoreRequestContext)_requestContext
{
  return self->_requestContext;
}

- (id)_initWithVersion:(unsigned int)a3 certificateURL:(id)a4 setupURL:(id)a5 requestContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  ICSAPSession *v13;
  uint64_t v14;
  NSURL *certificateURL;
  uint64_t v16;
  NSURL *setupURL;
  uint64_t v18;
  ICStoreRequestContext *requestContext;
  dispatch_queue_t v20;
  OS_dispatch_queue *calloutQueue;
  NSOperationQueue *v22;
  NSOperationQueue *prepareFairPlayContextOperationQueue;
  NSOperationQueue *v24;
  NSOperationQueue *operationQueue;
  objc_super v27;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v27.receiver = self;
  v27.super_class = (Class)ICSAPSession;
  v13 = -[ICSAPSession init](&v27, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    certificateURL = v13->_certificateURL;
    v13->_certificateURL = (NSURL *)v14;

    v16 = objc_msgSend(v11, "copy");
    setupURL = v13->_setupURL;
    v13->_setupURL = (NSURL *)v16;

    v18 = objc_msgSend(v12, "copyWithBlock:", &__block_literal_global_7);
    requestContext = v13->_requestContext;
    v13->_requestContext = (ICStoreRequestContext *)v18;

    v13->_sapVersion = a3;
    v20 = dispatch_queue_create("com.apple.iTunesCloud.ICSAPSession.calloutQueue", 0);
    calloutQueue = v13->_calloutQueue;
    v13->_calloutQueue = (OS_dispatch_queue *)v20;

    v22 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    prepareFairPlayContextOperationQueue = v13->_prepareFairPlayContextOperationQueue;
    v13->_prepareFairPlayContextOperationQueue = v22;

    -[NSOperationQueue setName:](v13->_prepareFairPlayContextOperationQueue, "setName:", CFSTR("com.apple.iTunesCloud.ICSAPSession.prepareFairPlayContextOperationQueue"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v13->_prepareFairPlayContextOperationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v13->_prepareFairPlayContextOperationQueue, "setQualityOfService:", 25);
    v24 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v13->_operationQueue;
    v13->_operationQueue = v24;

    -[NSOperationQueue setName:](v13->_operationQueue, "setName:", CFSTR("com.apple.iTunesCloud.ICSAPSession.prepareFairPlayContextOperationQueue"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v13->_operationQueue, "setMaxConcurrentOperationCount:", 3);
    -[NSOperationQueue setQualityOfService:](v13->_operationQueue, "setQualityOfService:", 25);
  }

  return v13;
}

+ (id)sharedSAPSessionWithVersion:(unsigned int)a3 URLBag:(id)a4 requestContext:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  NSObject *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  unsigned int v27;
  _QWORD block[4];
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  unsigned int v40;

  v7 = a5;
  v8 = a4;
  objc_msgSend(v8, "urlForBagKey:", CFSTR("sign-sap-setup-cert"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "urlForBagKey:", CFSTR("sign-sap-setup"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  if (v9 && v10)
  {
    if (sharedSAPSessionWithVersion_URLBag_requestContext__sOnceToken != -1)
      dispatch_once(&sharedSAPSessionWithVersion_URLBag_requestContext__sOnceToken, &__block_literal_global_299);
    v12 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __66__ICSAPSession_sharedSAPSessionWithVersion_URLBag_requestContext___block_invoke_2;
    v37[3] = &unk_1E43899D8;
    v40 = a3;
    v13 = v9;
    v38 = v13;
    v14 = v10;
    v39 = v14;
    v15 = (void *)MEMORY[0x1A1AFA8D0](v37);
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__300;
    v35 = __Block_byref_object_dispose__301;
    v36 = 0;
    v16 = sSharedAccessQueue;
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __66__ICSAPSession_sharedSAPSessionWithVersion_URLBag_requestContext___block_invoke_3;
    block[3] = &unk_1E438FF18;
    v30 = &v31;
    v17 = v15;
    v29 = v17;
    dispatch_sync(v16, block);
    v18 = (void *)v32[5];
    if (!v18)
    {
      v19 = sSharedAccessQueue;
      v21[0] = v12;
      v21[1] = 3221225472;
      v21[2] = __66__ICSAPSession_sharedSAPSessionWithVersion_URLBag_requestContext___block_invoke_2_4;
      v21[3] = &unk_1E4389A00;
      v26 = &v31;
      v25 = v17;
      v27 = a3;
      v22 = v13;
      v23 = v14;
      v24 = v7;
      dispatch_barrier_sync(v19, v21);

      v18 = (void *)v32[5];
    }
    v11 = v18;

    _Block_object_dispose(&v31, 8);
  }

  return v11;
}

- (void)verifySignatureData:(id)a3 forData:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICSAPSessionVerifySignatureOperation *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, char, void *);
  void *v16;
  ICSAPSession *v17;
  id v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(ICSAPSessionVerifySignatureOperation);
  -[ICSAPSessionAbstractOperation setSapSession:](v11, "setSapSession:", self);
  -[ICSAPSessionVerifySignatureOperation setData:](v11, "setData:", v9);

  -[ICSAPSessionVerifySignatureOperation setSignatureData:](v11, "setSignatureData:", v10);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __66__ICSAPSession_verifySignatureData_forData_withCompletionHandler___block_invoke;
  v16 = &unk_1E43908A8;
  v17 = self;
  v18 = v8;
  v12 = v8;
  -[ICSAPSessionVerifySignatureOperation setResponseHandler:](v11, "setResponseHandler:", &v13);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v11, v13, v14, v15, v16, v17);

}

- (void)signData:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  ICSAPSessionSignDataOperation *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  ICSAPSession *v14;
  id v15;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(ICSAPSessionSignDataOperation);
  -[ICSAPSessionAbstractOperation setSapSession:](v8, "setSapSession:", self);
  -[ICSAPSessionSignDataOperation setData:](v8, "setData:", v7);

  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __47__ICSAPSession_signData_withCompletionHandler___block_invoke;
  v13 = &unk_1E4390FE0;
  v14 = self;
  v15 = v6;
  v9 = v6;
  -[ICSAPSessionSignDataOperation setResponseHandler:](v8, "setResponseHandler:", &v10);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v8, v10, v11, v12, v13, v14);

}

- (NSOperationQueue)_prepareFairPlayContextOperationQueue
{
  return self->_prepareFairPlayContextOperationQueue;
}

void __66__ICSAPSession_verifySignatureData_forData_withCompletionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__ICSAPSession_verifySignatureData_forData_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E4390B70;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __47__ICSAPSession_signData_withCompletionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __66__ICSAPSession_verifySignatureData_forData_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __66__ICSAPSession_sharedSAPSessionWithVersion_URLBag_requestContext___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.iTunesCloud.ICSAPSession.SharedAccessQueue", MEMORY[0x1E0C80D50]);
  v1 = (void *)sSharedAccessQueue;
  sSharedAccessQueue = (uint64_t)v0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_prepareFairPlayContextOperationQueue, 0);
  objc_storeStrong((id *)&self->_sapContext, 0);
  objc_storeStrong((id *)&self->_setupURL, 0);
  objc_storeStrong((id *)&self->_certificateURL, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

uint64_t __72__ICSAPSession__initWithVersion_certificateURL_setupURL_requestContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPersonalizationStyle:", 2);
}

@end
