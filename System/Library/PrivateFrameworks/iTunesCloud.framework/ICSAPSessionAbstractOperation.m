@implementation ICSAPSessionAbstractOperation

void __40__ICSAPSessionAbstractOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = v5;
  v7 = *(void **)(a1 + 32);
  if (v9)
  {
    objc_msgSend(v7, "executeWithSAPContext:", v9);
  }
  else if (v5)
  {
    objc_msgSend(v7, "finishWithSAPContextPreparationError:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishWithSAPContextPreparationError:", v8);

  }
}

- (void)finishWithError:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  objc_super v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("ICFairPlayError"));

  if (v6 && objc_msgSend(v4, "code") == -42186)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "Invalidating SAP context for error %@", buf, 0xCu);
    }

    -[ICSAPSession _setSAPContext:](self->_sapSession, "_setSAPContext:", 0);
  }
  v8.receiver = self;
  v8.super_class = (Class)ICSAPSessionAbstractOperation;
  -[ICAsyncOperation finishWithError:](&v8, sel_finishWithError_, v4);

}

- (void)setSapSession:(id)a3
{
  objc_storeStrong((id *)&self->_sapSession, a3);
}

- (void)execute
{
  void *v3;
  ICSAPSessionPrepareFairPlayContextOperation *v4;
  void *v5;
  _QWORD v6[5];

  -[ICSAPSession _prepareFairPlayContextOperationQueue](self->_sapSession, "_prepareFairPlayContextOperationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(ICSAPSessionPrepareFairPlayContextOperation);
    -[ICSAPSessionAbstractOperation sapSession](self, "sapSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSAPSessionPrepareFairPlayContextOperation setSapSession:](v4, "setSapSession:", v5);

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__ICSAPSessionAbstractOperation_execute__block_invoke;
    v6[3] = &unk_1E438DEF8;
    v6[4] = self;
    -[ICSAPSessionPrepareFairPlayContextOperation setResponseHandler:](v4, "setResponseHandler:", v6);
    objc_msgSend(v3, "addOperation:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
    v4 = (ICSAPSessionPrepareFairPlayContextOperation *)objc_claimAutoreleasedReturnValue();
    -[ICSAPSessionAbstractOperation finishWithSAPContextPreparationError:](self, "finishWithSAPContextPreparationError:", v4);
  }

}

- (ICSAPSession)sapSession
{
  return self->_sapSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sapSession, 0);
}

@end
