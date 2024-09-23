@implementation SSVFairPlaySAPSession

- (id)_initSSVFairPlaySAPSession
{
  SSVFairPlaySAPSession *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *completionBlockQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *dispatchQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSVFairPlaySAPSession;
  v2 = -[SSVFairPlaySAPSession init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.StoreServices.SSVFairPlaySAPSession.completion", 0);
    completionBlockQueue = v2->_completionBlockQueue;
    v2->_completionBlockQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.StoreServices.SSVFairPlaySAPSession", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (SSVFairPlaySAPSession)init
{
  return -[SSVFairPlaySAPSession initWithSAPVersion:](self, "initWithSAPVersion:", 0);
}

- (SSVFairPlaySAPSession)initWithSAPVersion:(int64_t)a3
{
  return -[SSVFairPlaySAPSession initWithURLBag:SAPVersion:](self, "initWithURLBag:SAPVersion:", 0, a3);
}

- (SSVFairPlaySAPSession)initWithURLBag:(id)a3
{
  return -[SSVFairPlaySAPSession initWithURLBag:SAPVersion:](self, "initWithURLBag:SAPVersion:", a3, 0);
}

- (SSVFairPlaySAPSession)initWithSSBag:(id)a3 SAPVersion:(int64_t)a4
{
  id v7;
  id *v8;
  SSVFairPlaySAPSession *v9;
  SSVURLBagInterpreter *v10;
  SSVURLBagInterpreter *urlBagInterpreter;

  v7 = a3;
  v8 = -[SSVFairPlaySAPSession _initSSVFairPlaySAPSession](self, "_initSSVFairPlaySAPSession");
  v9 = (SSVFairPlaySAPSession *)v8;
  if (v8)
  {
    if (v7)
    {
      objc_storeStrong(v8 + 1, a3);
      v10 = -[SSVURLBagInterpreter initWithSSBag:]([SSVURLBagInterpreter alloc], "initWithSSBag:", v7);
      urlBagInterpreter = v9->_urlBagInterpreter;
      v9->_urlBagInterpreter = v10;

    }
    v9->_version = a4;
  }

  return v9;
}

- (SSVFairPlaySAPSession)initWithURLBag:(id)a3 SAPVersion:(int64_t)a4
{
  id v6;
  SSVFairPlaySAPSession *v7;
  SSURLBag *v8;
  void *urlBag;
  SSURLBag *v10;
  SSURLBag *v11;

  v6 = a3;
  v7 = -[SSVFairPlaySAPSession _initSSVFairPlaySAPSession](self, "_initSSVFairPlaySAPSession");
  if (v7)
  {
    if (v6)
    {
      v8 = (SSURLBag *)v6;
      urlBag = v7->_urlBag;
      v7->_urlBag = v8;
    }
    else
    {
      +[SSURLBagContext contextWithBagType:](SSURLBagContext, "contextWithBagType:", 0);
      urlBag = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SSURLBag initWithURLBagContext:]([SSURLBag alloc], "initWithURLBagContext:", urlBag);
      v11 = v7->_urlBag;
      v7->_urlBag = v10;

    }
    v7->_version = a4;
  }

  return v7;
}

- (SSVFairPlaySAPSession)initWithURLBagDictionary:(id)a3
{
  return -[SSVFairPlaySAPSession initWithURLBagDictionary:SAPVersion:](self, "initWithURLBagDictionary:SAPVersion:", a3, 0);
}

- (SSVFairPlaySAPSession)initWithURLBagDictionary:(id)a3 SAPVersion:(int64_t)a4
{
  id v6;
  SSVFairPlaySAPSession *v7;
  SSVURLBagInterpreter *v8;
  SSVURLBagInterpreter *urlBagInterpreter;

  v6 = a3;
  v7 = -[SSVFairPlaySAPSession _initSSVFairPlaySAPSession](self, "_initSSVFairPlaySAPSession");
  if (v7)
  {
    v8 = -[SSVURLBagInterpreter initWithURLBagDictionary:]([SSVURLBagInterpreter alloc], "initWithURLBagDictionary:", v6);
    urlBagInterpreter = v7->_urlBagInterpreter;
    v7->_urlBagInterpreter = v8;

    v7->_version = a4;
  }

  return v7;
}

- (id)_initWithURLBagInterpreter:(id)a3 SAPVersion:(int64_t)a4
{
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = -[SSVFairPlaySAPSession _initSSVFairPlaySAPSession](self, "_initSSVFairPlaySAPSession");
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    v9 = (void *)v7[10];
    v7[10] = v8;

    v7[8] = a4;
  }

  return v7;
}

- (NSData)certificateData
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__79;
  v10 = __Block_byref_object_dispose__79;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__SSVFairPlaySAPSession_certificateData__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

void __40__SSVFairPlaySAPSession_certificateData__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)establishSessionWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__SSVFairPlaySAPSession_establishSessionWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E47B8AC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __61__SSVFairPlaySAPSession_establishSessionWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  BOOL v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "_establishContext");
  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(v4 + 32) != 0;
    v6 = *(NSObject **)(v4 + 16);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__SSVFairPlaySAPSession_establishSessionWithCompletionBlock___block_invoke_2;
    v7[3] = &unk_1E47BB678;
    v8 = v3;
    v9 = v5;
    dispatch_async(v6, v7);

  }
}

uint64_t __61__SSVFairPlaySAPSession_establishSessionWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)primeSessionWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__SSVFairPlaySAPSession_primeSessionWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E47B8AC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __57__SSVFairPlaySAPSession_primeSessionWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v2;
  char v3;
  void *v4;
  char v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  char v9;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "_establishContext");
  v3 = objc_msgSend(*(id *)(a1 + 32), "_primeTheConnection");
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = v3;
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__SSVFairPlaySAPSession_primeSessionWithCompletionBlock___block_invoke_2;
    v7[3] = &unk_1E47BB678;
    v8 = v4;
    v9 = v5;
    dispatch_async(v6, v7);

  }
}

uint64_t __57__SSVFairPlaySAPSession_primeSessionWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (int64_t)SAPVersion
{
  return self->_version;
}

- (void)setCertificateData:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SSVFairPlaySAPSession_setCertificateData___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __44__SSVFairPlaySAPSession_setCertificateData___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 24) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v4;

  }
}

- (void)signData:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__SSVFairPlaySAPSession_signData_completionBlock___block_invoke;
  block[3] = &unk_1E47B8740;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __50__SSVFairPlaySAPSession_signData_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  int v25;
  int v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  id v40;
  id v41;
  id v42;
  int *v43;
  uint64_t v44;
  _QWORD block[4];
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  int v51;
  void *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v50 = 0;
  objc_msgSend(v2, "_signData:error:", v3, &v50);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v50;
  if (v4)
    goto LABEL_27;
  if (!objc_msgSend(*(id *)(a1 + 32), "_shouldRetrySAPOperationForError:", v5))
    goto LABEL_15;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    v8 = v7 | 2;
  else
    v8 = v7;
  objc_msgSend(v6, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    v8 &= 2u;
  if (v8)
  {
    v10 = (void *)objc_opt_class();
    v51 = 138412290;
    v52 = v10;
    v11 = v10;
    LODWORD(v44) = 12;
    v43 = &v51;
    v12 = (void *)_os_log_send_and_compose_impl();

    if (!v12)
      goto LABEL_14;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v51, v44);
    v9 = objc_claimAutoreleasedReturnValue();
    free(v12);
    SSFileLog(v6, CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v9);
  }

LABEL_14:
  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(void **)(v19 + 32);
  *(_QWORD *)(v19 + 32) = 0;

  v21 = *(void **)(a1 + 32);
  v22 = *(_QWORD *)(a1 + 40);
  v49 = v5;
  objc_msgSend(v21, "_signData:error:", v22, &v49);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v49;

  v5 = v23;
  if (!v4)
  {
LABEL_15:
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig", v43);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v25 = objc_msgSend(v24, "shouldLog");
    if (objc_msgSend(v24, "shouldLogToDisk"))
      v26 = v25 | 2;
    else
      v26 = v25;
    objc_msgSend(v24, "OSLogObject");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      v26 &= 2u;
    if (v26)
    {
      v28 = (void *)objc_opt_class();
      v51 = 138412546;
      v52 = v28;
      v53 = 2112;
      v54 = v5;
      v29 = v28;
      LODWORD(v44) = 22;
      v30 = (void *)_os_log_send_and_compose_impl();

      if (!v30)
      {
LABEL_26:

        v37 = *(_QWORD *)(a1 + 32);
        v38 = *(void **)(v37 + 32);
        *(_QWORD *)(v37 + 32) = 0;

        v4 = 0;
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 0;
        goto LABEL_27;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v30, 4, &v51, v44);
      v27 = objc_claimAutoreleasedReturnValue();
      free(v30);
      SSFileLog(v24, CFSTR("%@"), v31, v32, v33, v34, v35, v36, (uint64_t)v27);
    }

    goto LABEL_26;
  }
LABEL_27:
  v39 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__SSVFairPlaySAPSession_signData_completionBlock___block_invoke_12;
  block[3] = &unk_1E47B8608;
  v40 = *(id *)(a1 + 48);
  v47 = v5;
  v48 = v40;
  v46 = v4;
  v41 = v5;
  v42 = v4;
  dispatch_async(v39, block);

}

uint64_t __50__SSVFairPlaySAPSession_signData_completionBlock___block_invoke_12(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)verifySignature:(id)a3 forData:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__SSVFairPlaySAPSession_verifySignature_forData_completionBlock___block_invoke;
  v15[3] = &unk_1E47C03B8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(dispatchQueue, v15);

}

void __65__SSVFairPlaySAPSession_verifySignature_forData_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id v6;
  char v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  int v28;
  int v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  id v43;
  id v44;
  int *v45;
  uint64_t v46;
  _QWORD block[4];
  id v48;
  id v49;
  char v50;
  id v51;
  id v52;
  int v53;
  void *v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v52 = 0;
  v5 = objc_msgSend(v2, "_verifySignature:forData:error:", v3, v4, &v52);
  v6 = v52;
  if ((v5 & 1) == 0)
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "_shouldRetrySAPOperationForError:", v6))
    {
      v7 = 0;
      goto LABEL_18;
    }
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      v10 &= 2u;
    if (v10)
    {
      v12 = (void *)objc_opt_class();
      v53 = 138412290;
      v54 = v12;
      v13 = v12;
      LODWORD(v46) = 12;
      v45 = &v53;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
        goto LABEL_15;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, &v53, v46);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v14);
      SSFileLog(v8, CFSTR("%@"), v15, v16, v17, v18, v19, v20, (uint64_t)v11);
    }

LABEL_15:
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(void **)(v21 + 32);
    *(_QWORD *)(v21 + 32) = 0;

    v23 = *(void **)(a1 + 32);
    v24 = *(_QWORD *)(a1 + 40);
    v25 = *(_QWORD *)(a1 + 48);
    v51 = v6;
    v7 = objc_msgSend(v23, "_verifySignature:forData:error:", v24, v25, &v51);
    v26 = v51;

    v6 = v26;
    if ((v7 & 1) != 0)
      goto LABEL_31;
LABEL_18:
    if (!v6)
      goto LABEL_31;
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v28 = objc_msgSend(v27, "shouldLog", v45);
    if (objc_msgSend(v27, "shouldLogToDisk"))
      v29 = v28 | 2;
    else
      v29 = v28;
    objc_msgSend(v27, "OSLogObject");
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      v29 &= 2u;
    if (v29)
    {
      v31 = (void *)objc_opt_class();
      v53 = 138412546;
      v54 = v31;
      v55 = 2112;
      v56 = v6;
      v32 = v31;
      LODWORD(v46) = 22;
      v33 = (void *)_os_log_send_and_compose_impl();

      if (!v33)
      {
LABEL_30:

        v40 = *(_QWORD *)(a1 + 32);
        v41 = *(void **)(v40 + 32);
        *(_QWORD *)(v40 + 32) = 0;

        v7 = 0;
        goto LABEL_31;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v33, 4, &v53, v46);
      v30 = objc_claimAutoreleasedReturnValue();
      free(v33);
      SSFileLog(v27, CFSTR("%@"), v34, v35, v36, v37, v38, v39, (uint64_t)v30);
    }

    goto LABEL_30;
  }
  v7 = 1;
LABEL_31:
  v42 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__SSVFairPlaySAPSession_verifySignature_forData_completionBlock___block_invoke_13;
  block[3] = &unk_1E47BD240;
  v43 = *(id *)(a1 + 56);
  v50 = v7;
  v48 = v6;
  v49 = v43;
  v44 = v6;
  dispatch_async(v42, block);

}

uint64_t __65__SSVFairPlaySAPSession_verifySignature_forData_completionBlock___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (id)signatureWithData:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__79;
  v26 = __Block_byref_object_dispose__79;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__79;
  v20 = __Block_byref_object_dispose__79;
  v21 = 0;
  v7 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__SSVFairPlaySAPSession_signatureWithData_error___block_invoke;
  v12[3] = &unk_1E47BE858;
  v14 = &v22;
  v15 = &v16;
  v8 = v7;
  v13 = v8;
  -[SSVFairPlaySAPSession signData:completionBlock:](self, "signData:completionBlock:", v6, v12);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  v9 = (void *)v17[5];
  if (a4 && !v9)
  {
    *a4 = objc_retainAutorelease((id)v23[5]);
    v9 = (void *)v17[5];
  }
  v10 = v9;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __49__SSVFairPlaySAPSession_signatureWithData_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)verifyData:(id)a3 withSignature:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  int v12;
  BOOL v13;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__79;
  v27 = __Block_byref_object_dispose__79;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v10 = dispatch_semaphore_create(0);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__SSVFairPlaySAPSession_verifyData_withSignature_error___block_invoke;
  v15[3] = &unk_1E47BB230;
  v17 = &v23;
  v18 = &v19;
  v11 = v10;
  v16 = v11;
  -[SSVFairPlaySAPSession verifySignature:forData:completionBlock:](self, "verifySignature:forData:completionBlock:", v9, v8, v15);
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  v12 = *((unsigned __int8 *)v20 + 24);
  if (a5 && !*((_BYTE *)v20 + 24))
  {
    *a5 = objc_retainAutorelease((id)v24[5]);
    v12 = *((unsigned __int8 *)v20 + 24);
  }
  v13 = v12 != 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v13;
}

void __56__SSVFairPlaySAPSession_verifyData_withSignature_error___block_invoke(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)_establishContext
{
  SSVFairPlaySAPContext *context;
  void *v4;
  SSVFairPlaySAPContext *v5;
  void *v6;
  id v7;
  void *certificateData;
  uint64_t v9;
  id v10;
  SSVFairPlaySAPContext *v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSData *v25;
  uint64_t v27;
  id v28;
  id v29;
  int v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  context = self->_context;
  if (context)
    return context;
  -[SSVFairPlaySAPSession _loadCertificateData](self, "_loadCertificateData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[SSVFairPlaySAPContext initWithSAPVersion:]([SSVFairPlaySAPContext alloc], "initWithSAPVersion:", self->_version);
    v29 = 0;
    -[SSVFairPlaySAPContext exchangeData:error:](v5, "exchangeData:error:", v4, &v29);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v29;
    if (v6)
    {
      while (!-[SSVFairPlaySAPContext isComplete](v5, "isComplete"))
      {
        -[SSVFairPlaySAPSession _postExchangeData:](self, "_postExchangeData:", v6);
        certificateData = (void *)objc_claimAutoreleasedReturnValue();
        if (!certificateData)
        {

          goto LABEL_12;
        }
        v28 = 0;
        -[SSVFairPlaySAPContext exchangeData:error:](v5, "exchangeData:error:", certificateData, &v28);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = v28;

        if (!v7)
          v7 = v10;

        v6 = (void *)v9;
        if (!v9)
          break;
      }
    }
    else
    {
      certificateData = self->_certificateData;
      self->_certificateData = 0;
LABEL_12:

      v6 = 0;
    }
    if (-[SSVFairPlaySAPContext isComplete](v5, "isComplete"))
    {
      v11 = v5;
      v12 = self->_context;
      self->_context = v11;
LABEL_26:

      goto LABEL_27;
    }
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13 = objc_msgSend(v12, "shouldLog");
    if (objc_msgSend(v12, "shouldLogToDisk"))
      v14 = v13 | 2;
    else
      v14 = v13;
    objc_msgSend(v12, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      v14 &= 2u;
    if (v14)
    {
      v16 = (void *)objc_opt_class();
      v30 = 138543618;
      v31 = v16;
      v32 = 2112;
      v33 = v7;
      v17 = v16;
      LODWORD(v27) = 22;
      v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
        goto LABEL_26;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v18, 4, &v30, v27);
      v15 = objc_claimAutoreleasedReturnValue();
      free(v18);
      SSFileLog(v12, CFSTR("%@"), v19, v20, v21, v22, v23, v24, (uint64_t)v15);
    }

    goto LABEL_26;
  }
LABEL_27:

  context = self->_context;
  if (!context)
  {
    v25 = self->_certificateData;
    self->_certificateData = 0;

    context = self->_context;
  }
  return context;
}

- (id)_loadCertificateData
{
  NSData *certificateData;
  void *v4;
  void *v5;
  SSVLoadURLOperation *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  _QWORD v23[5];
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  certificateData = self->_certificateData;
  if (!certificateData)
  {
    -[SSVFairPlaySAPSession _urlBagInterpreter](self, "_urlBagInterpreter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLForURLBagKey:", CFSTR("sign-sap-setup-cert"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = -[SSVLoadURLOperation initWithURL:]([SSVLoadURLOperation alloc], "initWithURL:", v5);
      -[SSVLoadURLOperation _configureWithURLBagInterpreter:](v6, "_configureWithURLBagInterpreter:", v4);
      +[SSVURLDataConsumer consumer](SSVURLProtocolConsumer, "consumer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSVLoadURLOperation setDataConsumer:](v6, "setDataConsumer:", v7);

      -[SSVLoadURLOperation setITunesStoreRequest:](v6, "setITunesStoreRequest:", 1);
      -[SSVLoadURLOperation setBag:](v6, "setBag:", self->_bag);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __45__SSVFairPlaySAPSession__loadCertificateData__block_invoke;
      v23[3] = &unk_1E47C03E0;
      v23[4] = self;
      -[SSVLoadURLOperation setOutputBlock:](v6, "setOutputBlock:", v23);
      -[SSVLoadURLOperation main](v6, "main");

    }
    certificateData = self->_certificateData;
    if (!certificateData)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v9 = objc_msgSend(v8, "shouldLog");
      if (objc_msgSend(v8, "shouldLogToDisk"))
        v10 = v9 | 2;
      else
        v10 = v9;
      objc_msgSend(v8, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        v10 &= 2u;
      if (v10)
      {
        v12 = (void *)objc_opt_class();
        v24 = 138543362;
        v25 = v12;
        v13 = v12;
        LODWORD(v22) = 12;
        v14 = (void *)_os_log_send_and_compose_impl();

        if (!v14)
        {
LABEL_16:

          certificateData = self->_certificateData;
          return certificateData;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, &v24, v22);
        v11 = objc_claimAutoreleasedReturnValue();
        free(v14);
        SSFileLog(v8, CFSTR("%@"), v15, v16, v17, v18, v19, v20, (uint64_t)v11);
      }

      goto LABEL_16;
    }
  }
  return certificateData;
}

void __45__SSVFairPlaySAPSession__loadCertificateData__block_invoke(uint64_t a1, void *a2)
{
  char isKindOfClass;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = v6;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("sign-sap-setup-cert"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), v5);

    v4 = v6;
  }

}

- (id)_postExchangeData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SSVLoadURLOperation *v10;
  void *v11;
  id v12;
  int v14;
  int v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  int v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__79;
  v32 = __Block_byref_object_dispose__79;
  v33 = 0;
  -[SSVFairPlaySAPSession _urlBagInterpreter](self, "_urlBagInterpreter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForURLBagKey:", CFSTR("sign-sap-setup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:", v6);
    objc_msgSend(v7, "setHTTPMethod:", CFSTR("POST"));
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v4, CFSTR("sign-sap-setup-buffer"), 0);
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v8, 100, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHTTPBody:", v9);

    v10 = -[SSVLoadURLOperation initWithURLRequest:]([SSVLoadURLOperation alloc], "initWithURLRequest:", v7);
    -[SSVLoadURLOperation _configureWithURLBagInterpreter:](v10, "_configureWithURLBagInterpreter:", v5);
    +[SSVURLDataConsumer consumer](SSVURLProtocolConsumer, "consumer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVLoadURLOperation setDataConsumer:](v10, "setDataConsumer:", v11);

    -[SSVLoadURLOperation setITunesStoreRequest:](v10, "setITunesStoreRequest:", 1);
    -[SSVLoadURLOperation setBag:](v10, "setBag:", self->_bag);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __43__SSVFairPlaySAPSession__postExchangeData___block_invoke;
    v27[3] = &unk_1E47C0408;
    v27[4] = &v28;
    -[SSVLoadURLOperation setOutputBlock:](v10, "setOutputBlock:", v27);
    -[SSVLoadURLOperation main](v10, "main");

  }
  else
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = objc_msgSend(v7, "shouldLog");
    v15 = objc_msgSend(v7, "shouldLogToDisk");
    objc_msgSend(v7, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    v8 = v16;
    if (v15)
      v14 |= 2u;
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      v14 &= 2u;
    if (v14)
    {
      v17 = (void *)objc_opt_class();
      v34 = 138543362;
      v35 = v17;
      v18 = v17;
      LODWORD(v26) = 12;
      v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19)
        goto LABEL_4;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v19, 4, &v34, v26);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      free(v19);
      SSFileLog(v7, CFSTR("%@"), v20, v21, v22, v23, v24, v25, (uint64_t)v8);
    }
  }

LABEL_4:
  v12 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  return v12;
}

void __43__SSVFairPlaySAPSession__postExchangeData___block_invoke(uint64_t a1, void *a2)
{
  char isKindOfClass;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = v6;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("sign-sap-setup-buffer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v5);

    v4 = v6;
  }

}

- (BOOL)_primeTheConnection
{
  BOOL v2;
  SSVFairPlaySAPContext *context;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SSVLoadURLOperation *v14;
  void *v15;
  uint64_t v16;
  _QWORD v18[6];
  id v19;
  id location;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v2 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  if (self->_version == 1)
  {
    context = self->_context;
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVFairPlaySAPContext primingSignatureForData:error:](context, "primingSignatureForData:error:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

    -[SSVFairPlaySAPSession _urlBagInterpreter](self, "_urlBagInterpreter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mescalPrimingURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      +[SSDevice currentDevice](SSDevice, "currentDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uniqueDeviceIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "uppercaseString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "URLByAppendingQueryParameter:value:", CFSTR("guid"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 && v7)
      {
        v14 = -[SSVLoadURLOperation initWithURL:]([SSVLoadURLOperation alloc], "initWithURL:", v13);
        -[SSVLoadURLOperation _configureWithURLBagInterpreter:](v14, "_configureWithURLBagInterpreter:", v8);
        -[SSVLoadURLOperation setSAPSession:](v14, "setSAPSession:", self);
        +[SSVURLDataConsumer consumer](SSVURLProtocolConsumer, "consumer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSVLoadURLOperation setDataConsumer:](v14, "setDataConsumer:", v15);

        -[SSVLoadURLOperation setITunesStoreRequest:](v14, "setITunesStoreRequest:", 1);
        -[SSVLoadURLOperation setBag:](v14, "setBag:", self->_bag);
        v16 = MEMORY[0x1E0C809B0];
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __44__SSVFairPlaySAPSession__primeTheConnection__block_invoke;
        v21[3] = &unk_1E47BFC70;
        v22 = v7;
        -[SSVLoadURLOperation setPrepareRequestBlock:](v14, "setPrepareRequestBlock:", v21);
        objc_initWeak(&location, v14);
        v18[0] = v16;
        v18[1] = 3221225472;
        v18[2] = __44__SSVFairPlaySAPSession__primeTheConnection__block_invoke_2;
        v18[3] = &unk_1E47C0430;
        objc_copyWeak(&v19, &location);
        v18[4] = self;
        v18[5] = &v23;
        -[SSVLoadURLOperation setOutputBlock:](v14, "setOutputBlock:", v18);
        -[SSVLoadURLOperation main](v14, "main");
        objc_destroyWeak(&v19);
        objc_destroyWeak(&location);

      }
    }
    else
    {
      v13 = 0;
    }
    v2 = *((_BYTE *)v24 + 24) != 0;

  }
  _Block_object_dispose(&v23, 8);
  return v2;
}

void __44__SSVFairPlaySAPSession__primeTheConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v3, "setValue:forHTTPHeaderField:", *(_QWORD *)(a1 + 32), CFSTR("X-Apple-ActionSignature"));

}

void __44__SSVFairPlaySAPSession__primeTheConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "URLResponse");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v6;
    if (v3)
    {
      v4 = *(void **)(a1 + 32);
      objc_msgSend(v6, "URLResponse");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "_verifyPrimeResponse:", v5);

      WeakRetained = v6;
    }
  }

}

- (BOOL)_shouldRetrySAPOperationForError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("SSErrorDomain")))
    v5 = objc_msgSend(v3, "code") == 148;
  else
    v5 = 0;

  return v5;
}

- (id)_signData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  int v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SSVFairPlaySAPSession _establishContext](self, "_establishContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13 = objc_msgSend(v12, "shouldLog");
    if (objc_msgSend(v12, "shouldLogToDisk"))
      v14 = v13 | 2;
    else
      v14 = v13;
    objc_msgSend(v12, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      v14 &= 2u;
    if (v14)
    {
      v26 = 138412290;
      v27 = (id)objc_opt_class();
      v16 = v27;
      LODWORD(v24) = 12;
      v17 = (void *)_os_log_send_and_compose_impl();

      if (!v17)
        goto LABEL_16;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v17, 4, &v26, v24);
      v15 = objc_claimAutoreleasedReturnValue();
      free(v17);
      SSFileLog(v12, CFSTR("%@"), v18, v19, v20, v21, v22, v23, (uint64_t)v15);
    }

LABEL_16:
    SSError((uint64_t)CFSTR("SSErrorDomain"), 122, (uint64_t)CFSTR("No SAP context for signing"), 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v25 = 0;
  objc_msgSend(v7, "signData:error:", v6, &v25);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v25;
  if (a4)
LABEL_3:
    *a4 = objc_retainAutorelease(v10);
LABEL_4:

  return v9;
}

- (id)_urlBagInterpreter
{
  SSBag *bag;
  SSVURLBagInterpreter *v4;
  SSVURLBagInterpreter *v5;
  SSVURLBagInterpreter *urlBagInterpreter;

  if (!self->_urlBagInterpreter)
  {
    bag = self->_bag;
    v4 = [SSVURLBagInterpreter alloc];
    if (bag)
      v5 = -[SSVURLBagInterpreter initWithSSBag:](v4, "initWithSSBag:", self->_bag);
    else
      v5 = -[SSVURLBagInterpreter initWithURLBag:](v4, "initWithURLBag:", self->_urlBag);
    urlBagInterpreter = self->_urlBagInterpreter;
    self->_urlBagInterpreter = v5;

  }
  return self->_urlBagInterpreter;
}

- (BOOL)_verifyPrimeResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SSVFairPlaySAPContext *context;
  BOOL v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  BOOL v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  int v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  BOOL primed;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  int v47;
  void *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_primed = 0;
  objc_msgSend(v4, "allHeaderFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("X-Apple-ActionSignature"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(CFSTR("X-Apple-ActionSignature"), "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v6, "length"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 0);
    context = self->_context;
    v46 = 0;
    v10 = -[SSVFairPlaySAPContext verifyPrimeSignature:error:](context, "verifyPrimeSignature:error:", v8, &v46);
    v45 = v46;
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v10)
    {
      if (!v11)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v13 = objc_msgSend(v12, "shouldLog");
      if (objc_msgSend(v12, "shouldLogToDisk"))
        v14 = v13 | 2;
      else
        v14 = v13;
      objc_msgSend(v12, "OSLogObject");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = 1;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        v17 = v14;
      else
        v17 = v14 & 2;
      if (v17)
      {
        v44 = v8;
        v18 = (void *)objc_opt_class();
        v19 = v18;
        objc_msgSend(v4, "URL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 138412546;
        v48 = v18;
        v49 = 2112;
        v50 = v20;
        LODWORD(v43) = 22;
        v16 = 1;
        v21 = (void *)_os_log_send_and_compose_impl();

        if (!v21)
        {
          v8 = v44;
          v32 = v45;
          goto LABEL_30;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v21, 4, &v47, v43);
        v15 = objc_claimAutoreleasedReturnValue();
        free(v21);
        SSFileLog(v12, CFSTR("%@"), v22, v23, v24, v25, v26, v27, (uint64_t)v15);
        v8 = v44;
      }
    }
    else
    {
      if (!v11)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v28 = objc_msgSend(v12, "shouldLog");
      if (objc_msgSend(v12, "shouldLogToDisk"))
        v29 = v28 | 2;
      else
        v29 = v28;
      objc_msgSend(v12, "OSLogObject");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        v30 = v29;
      else
        v30 = v29 & 2;
      if (v30)
      {
        v31 = (void *)objc_opt_class();
        v47 = 138412546;
        v48 = v31;
        v49 = 2112;
        v32 = v45;
        v50 = v45;
        v33 = v31;
        LODWORD(v43) = 22;
        v34 = (void *)_os_log_send_and_compose_impl();

        if (!v34)
        {
          v16 = 0;
          goto LABEL_30;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v34, 4, &v47, v43);
        v15 = objc_claimAutoreleasedReturnValue();
        free(v34);
        SSFileLog(v12, CFSTR("%@"), v35, v36, v37, v38, v39, v40, (uint64_t)v15);
        v16 = 0;
        goto LABEL_29;
      }
      v16 = 0;
    }
    v32 = v45;
LABEL_29:

LABEL_30:
    self->_primed = v16;

  }
  primed = self->_primed;

  return primed;
}

- (BOOL)_verifySignature:(id)a3 forData:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  int v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[SSVFairPlaySAPSession _establishContext](self, "_establishContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = objc_msgSend(v15, "shouldLog");
    if (objc_msgSend(v15, "shouldLogToDisk"))
      v17 = v16 | 2;
    else
      v17 = v16;
    objc_msgSend(v15, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      v17 &= 2u;
    if (v17)
    {
      v29 = 138412290;
      v30 = (id)objc_opt_class();
      v19 = v30;
      LODWORD(v27) = 12;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
        goto LABEL_16;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v20, 4, &v29, v27);
      v18 = objc_claimAutoreleasedReturnValue();
      free(v20);
      SSFileLog(v15, CFSTR("%@"), v21, v22, v23, v24, v25, v26, (uint64_t)v18);
    }

LABEL_16:
    SSError((uint64_t)CFSTR("SSErrorDomain"), 122, (uint64_t)CFSTR("No SAP context for signature verification"), 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v28 = 0;
  v12 = objc_msgSend(v10, "verifySignature:forData:error:", v8, v9, &v28);
  v13 = v28;
  if (a5)
LABEL_3:
    *a5 = objc_retainAutorelease(v13);
LABEL_4:

  return v12;
}

- (int64_t)version
{
  return self->_version;
}

- (SSVURLBagInterpreter)urlBagInterpreter
{
  return self->_urlBagInterpreter;
}

- (BOOL)useSharedBagInterpreter
{
  return self->_useSharedBagInterpreter;
}

- (void)setUseSharedBagInterpreter:(BOOL)a3
{
  self->_useSharedBagInterpreter = a3;
}

- (BOOL)primed
{
  return self->_primed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlBagInterpreter, 0);
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_certificateData, 0);
  objc_storeStrong((id *)&self->_completionBlockQueue, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
