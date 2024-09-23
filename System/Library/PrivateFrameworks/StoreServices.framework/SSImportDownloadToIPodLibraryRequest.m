@implementation SSImportDownloadToIPodLibraryRequest

- (SSImportDownloadToIPodLibraryRequest)initWithDownloadMetadata:(id)a3
{
  id v5;
  SSImportDownloadToIPodLibraryRequest *v6;
  SSImportDownloadToIPodLibraryRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSImportDownloadToIPodLibraryRequest;
  v6 = -[SSRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_downloadMetadata, a3);

  return v7;
}

- (SSImportDownloadToIPodLibraryRequest)initWithPurchase:(id)a3
{
  id v5;
  SSImportDownloadToIPodLibraryRequest *v6;
  SSImportDownloadToIPodLibraryRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSImportDownloadToIPodLibraryRequest;
  v6 = -[SSRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_purchaseResponse, a3);

  return v7;
}

- (void)startWithResponseBlock:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    objc_msgSend(v5, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      v9 = v7;
    else
      v9 = v7 & 2;
    if (v9)
    {
      v21 = 136446210;
      v22 = "-[SSImportDownloadToIPodLibraryRequest startWithResponseBlock:]";
      LODWORD(v18) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v21, v18);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __63__SSImportDownloadToIPodLibraryRequest_startWithResponseBlock___block_invoke;
  v19[3] = &unk_1E47B8630;
  v19[4] = self;
  v20 = v4;
  v17 = v4;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 66, v19);

}

void __63__SSImportDownloadToIPodLibraryRequest_startWithResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD block[4];
  id v14;
  id v15;
  BOOL v16;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 40))
  {
    if (v3 == (id)MEMORY[0x1E0C81258])
    {
      v5 = 121;
    }
    else
    {
      if (v3 && MEMORY[0x1A85863E4](v3) == MEMORY[0x1E0C812F8])
      {
        v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
        xpc_dictionary_get_value(v4, "2");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)objc_msgSend(v11, "initWithXPCEncoding:", v12);

        v7 = xpc_dictionary_get_BOOL(v4, "1");
        if (v7)
        {
LABEL_10:
          dispatch_get_global_queue(0, 0);
          v8 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __63__SSImportDownloadToIPodLibraryRequest_startWithResponseBlock___block_invoke_2;
          block[3] = &unk_1E47BD240;
          v9 = *(id *)(a1 + 40);
          v16 = v7;
          v14 = v6;
          v15 = v9;
          v10 = v6;
          dispatch_async(v8, block);

          goto LABEL_11;
        }
LABEL_8:
        if (!v6)
        {
          SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_10;
      }
      v5 = 111;
    }
    SSError((uint64_t)CFSTR("SSErrorDomain"), v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    goto LABEL_8;
  }
LABEL_11:
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest");

}

uint64_t __63__SSImportDownloadToIPodLibraryRequest_startWithResponseBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  id v4;
  id v5;

  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = -[SSPurchaseResponse copyXPCEncoding](self->_purchaseResponse, "copyXPCEncoding");
  if (v4)
    xpc_dictionary_set_value(v3, "0", v4);
  v5 = -[SSDownloadMetadata copyXPCEncoding](self->_downloadMetadata, "copyXPCEncoding");
  if (v5)
    xpc_dictionary_set_value(v3, "1", v5);

  return v3;
}

- (SSImportDownloadToIPodLibraryRequest)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSImportDownloadToIPodLibraryRequest *v6;
  void *v8;
  SSPurchaseResponse *v9;
  SSPurchaseResponse *purchaseResponse;
  void *v11;
  SSDownloadMetadata *v12;
  SSDownloadMetadata *downloadMetadata;
  objc_super v14;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v14.receiver = self;
    v14.super_class = (Class)SSImportDownloadToIPodLibraryRequest;
    v6 = -[SSRequest init](&v14, sel_init);
    if (v6)
    {
      xpc_dictionary_get_value(v5, "0");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = -[SSPurchaseResponse initWithXPCEncoding:]([SSPurchaseResponse alloc], "initWithXPCEncoding:", v8);
        purchaseResponse = v6->_purchaseResponse;
        v6->_purchaseResponse = v9;

      }
      xpc_dictionary_get_value(v5, "1");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = -[SSDownloadMetadata initWithXPCEncoding:]([SSDownloadMetadata alloc], "initWithXPCEncoding:", v11);
        downloadMetadata = v6->_downloadMetadata;
        v6->_downloadMetadata = v12;

      }
    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (SSDownloadMetadata)downloadMetadata
{
  return self->_downloadMetadata;
}

- (SSPurchaseResponse)purchaseResponse
{
  return self->_purchaseResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseResponse, 0);
  objc_storeStrong((id *)&self->_downloadMetadata, 0);
}

@end
