@implementation ICSAPSessionPrepareFairPlayContextOperation

void __54__ICSAPSessionPrepareFairPlayContextOperation_execute__block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;

  v5 = a3;
  objc_msgSend(a2, "parsedBodyDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("sign-sap-setup-cert"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NSIsNSData())
  {
    v9 = (void *)a1[4];
    v8 = (void *)a1[5];
    v11 = a1[6];
    v10 = a1[7];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __54__ICSAPSessionPrepareFairPlayContextOperation_execute__block_invoke_2;
    v15[3] = &unk_1E4390278;
    v15[4] = v9;
    v16 = v8;
    objc_msgSend(v9, "_exchangeDataWithSAPContext:requestContext:setupURL:responseData:completionHandler:", v16, v11, v10, v7, v15);

  }
  else
  {
    v12 = v5;
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), v12);
    if (!v5)

    v13 = (_QWORD *)a1[4];
    v14 = v13[37];
    if (v14)
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD))(v14 + 16))(v13[37], 0, *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40));
      v13 = (_QWORD *)a1[4];
    }
    objc_msgSend(v13, "finishWithError:", *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40));
  }

}

- (void)execute
{
  void *v3;
  void (**responseHandler)(id, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  ICFPSAPContext *v8;
  id *v9;
  id v10;
  uint64_t *v11;
  void (**v12)(id, _QWORD, uint64_t);
  void *v13;
  ICStoreURLRequest *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  id obj;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  -[ICSAPSession _sapContext](self->_sapSession, "_sapContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    responseHandler = (void (**)(id, void *, _QWORD))self->_responseHandler;
    if (responseHandler)
      responseHandler[2](responseHandler, v3, 0);
    -[ICAsyncOperation finishWithError:](self, "finishWithError:", 0);
  }
  else
  {
    -[ICSAPSession _certificateURL](self->_sapSession, "_certificateURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSAPSession _setupURL](self->_sapSession, "_setupURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSAPSession _requestContext](self->_sapSession, "_requestContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__23734;
    v25 = __Block_byref_object_dispose__23735;
    v26 = 0;
    v8 = [ICFPSAPContext alloc];
    v9 = (id *)(v22 + 5);
    obj = (id)v22[5];
    v10 = -[ICFPSAPContext initReturningError:](v8, "initReturningError:", &obj);
    objc_storeStrong(v9, obj);
    v11 = v22;
    if (v10 && !v22[5])
    {
      +[ICURLSessionManager unlimitedHighPrioritySession](ICURLSessionManager, "unlimitedHighPrioritySession");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[ICStoreURLRequest initWithURL:requestContext:]([ICStoreURLRequest alloc], "initWithURL:requestContext:", v5, v7);
      -[ICStoreURLRequest setShouldUseMescalSigning:](v14, "setShouldUseMescalSigning:", 0);
      -[ICURLRequest setPrioritize:](v14, "setPrioritize:", 1);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __54__ICSAPSessionPrepareFairPlayContextOperation_execute__block_invoke;
      v15[3] = &unk_1E438DE18;
      v15[4] = self;
      v16 = v10;
      v17 = v7;
      v18 = v6;
      v19 = &v21;
      objc_msgSend(v13, "enqueueDataRequest:withCompletionHandler:", v14, v15);

    }
    else
    {
      v12 = (void (**)(id, _QWORD, uint64_t))self->_responseHandler;
      if (v12)
      {
        v12[2](v12, 0, v22[5]);
        v11 = v22;
      }
      -[ICAsyncOperation finishWithError:](self, "finishWithError:", v11[5]);
    }

    _Block_object_dispose(&v21, 8);
  }

}

- (void)_exchangeDataWithSAPContext:(id)a3 requestContext:(id)a4 setupURL:(id)a5 responseData:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, id);
  ICSAPSession *sapSession;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  ICStoreURLRequest *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  void (**v32)(id, id);
  id v33;
  id v34;
  id v35;
  char v36;
  const __CFString *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, id))a7;
  v36 = -1;
  sapSession = self->_sapSession;
  v17 = a6;
  v34 = 0;
  v35 = 0;
  LODWORD(sapSession) = objc_msgSend(v12, "exchangeWithSAPVersion:data:returningData:exchangeStatus:error:", -[ICSAPSession sapVersion](sapSession, "sapVersion"), v17, &v35, &v36, &v34);

  v18 = v35;
  v19 = v34;
  if (!(_DWORD)sapSession)
  {
    v15[2](v15, v19);
LABEL_10:
    v22 = v19;
    goto LABEL_14;
  }
  if (!v18 || v36 != 1)
  {
    if (v36)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, v23);

    }
    else
    {
      v15[2](v15, 0);
    }
    goto LABEL_10;
  }
  v37 = CFSTR("sign-sap-setup-buffer");
  v38[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v20, 100, 0, &v33);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v33;

  if (v22)
  {
    v15[2](v15, v22);
  }
  else
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v14);
    objc_msgSend(v24, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v24, "setHTTPBody:", v21);
    +[ICURLSessionManager unlimitedHighPrioritySession](ICURLSessionManager, "unlimitedHighPrioritySession");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v21;
    v25 = -[ICStoreURLRequest initWithURLRequest:requestContext:]([ICStoreURLRequest alloc], "initWithURLRequest:requestContext:", v24, v13);
    -[ICStoreURLRequest setShouldUseMescalSigning:](v25, "setShouldUseMescalSigning:", 0);
    -[ICURLRequest setPrioritize:](v25, "setPrioritize:", 1);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __130__ICSAPSessionPrepareFairPlayContextOperation__exchangeDataWithSAPContext_requestContext_setupURL_responseData_completionHandler___block_invoke;
    v28[3] = &unk_1E438DE40;
    v28[4] = self;
    v29 = v12;
    v30 = v13;
    v31 = v14;
    v32 = v15;
    objc_msgSend(v26, "enqueueUploadRequest:withCompletionHandler:", v25, v28);

    v21 = v27;
  }

LABEL_14:
}

void __54__ICSAPSessionPrepareFairPlayContextOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  if (v3)
  {
    v5 = *(_QWORD *)(v4 + 296);
    if (v5)
    {
      v6 = 0;
LABEL_6:
      (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, v6, v7);
      v4 = *(_QWORD *)(a1 + 32);
    }
  }
  else
  {
    objc_msgSend(*(id *)(v4 + 288), "_setSAPContext:", *(_QWORD *)(a1 + 40));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(v4 + 296);
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 40);
      goto LABEL_6;
    }
  }
  objc_msgSend((id)v4, "finishWithError:", v7);

}

void __130__ICSAPSessionPrepareFairPlayContextOperation__exchangeDataWithSAPContext_requestContext_setupURL_responseData_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    objc_msgSend(a2, "parsedBodyDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("sign-sap-setup-buffer"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (_NSIsNSData())
    {
      objc_msgSend(*(id *)(a1 + 32), "_exchangeDataWithSAPContext:requestContext:setupURL:responseData:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v7, *(_QWORD *)(a1 + 64));
    }
    else
    {
      v5 = *(_QWORD *)(a1 + 64);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    }
  }
}

- (void)setSapSession:(id)a3
{
  objc_storeStrong((id *)&self->_sapSession, a3);
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_sapSession, 0);
}

- (ICSAPSession)sapSession
{
  return self->_sapSession;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

@end
