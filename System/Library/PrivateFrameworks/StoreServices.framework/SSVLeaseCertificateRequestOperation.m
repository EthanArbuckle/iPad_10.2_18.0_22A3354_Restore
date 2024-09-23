@implementation SSVLeaseCertificateRequestOperation

- (SSVLeaseCertificateRequestOperation)initWithConfiguration:(id)a3
{
  id v4;
  SSVLeaseCertificateRequestOperation *v5;
  uint64_t v6;
  SSVPlaybackLeaseConfiguration *configuration;

  v4 = a3;
  v5 = -[SSVOperation init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (SSVPlaybackLeaseConfiguration *)v6;

  }
  return v5;
}

- (SSVLeaseCertificateRequestOperation)initWithURLBag:(id)a3
{
  id v5;
  SSVLeaseCertificateRequestOperation *v6;
  dispatch_semaphore_t v7;
  OS_dispatch_semaphore *bagLoadSemaphore;

  v5 = a3;
  v6 = -[SSVOperation init](self, "init");
  if (v6)
  {
    v7 = dispatch_semaphore_create(0);
    bagLoadSemaphore = v6->_bagLoadSemaphore;
    v6->_bagLoadSemaphore = (OS_dispatch_semaphore *)v7;

    objc_storeStrong((id *)&v6->_urlBag, a3);
  }

  return v6;
}

- (void)cancel
{
  NSObject *bagLoadSemaphore;
  objc_super v4;

  bagLoadSemaphore = self->_bagLoadSemaphore;
  if (bagLoadSemaphore)
    dispatch_semaphore_signal(bagLoadSemaphore);
  v4.receiver = self;
  v4.super_class = (Class)SSVLeaseCertificateRequestOperation;
  -[SSVOperation cancel](&v4, sel_cancel);
}

- (void)main
{
  void *v3;
  void *v4;
  SSVLoadURLOperation *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[6];
  id obj;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__16;
  v22 = __Block_byref_object_dispose__16;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__16;
  v16 = __Block_byref_object_dispose__16;
  v17 = 0;
  obj = 0;
  -[SSVLeaseCertificateRequestOperation _resolveCertificateURLReturningError:](self, "_resolveCertificateURLReturningError:", &obj);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v23, obj);
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:", v3);
    objc_msgSend(v4, "setHTTPMethod:", CFSTR("GET"));
    v5 = -[SSVLoadURLOperation initWithURLRequest:]([SSVLoadURLOperation alloc], "initWithURLRequest:", v4);
    +[SSVURLDataConsumer consumer](SSVURLDataConsumer, "consumer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVLoadURLOperation setDataConsumer:](v5, "setDataConsumer:", v6);

    -[SSVLoadURLOperation setITunesStoreRequest:](v5, "setITunesStoreRequest:", 1);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __43__SSVLeaseCertificateRequestOperation_main__block_invoke;
    v10[3] = &unk_1E47B98A0;
    v10[4] = &v18;
    v10[5] = &v12;
    -[SSVLoadURLOperation setOutputBlock:](v5, "setOutputBlock:", v10);
    -[SSVOperation runChildOperation:](self, "runChildOperation:", v5);

LABEL_3:
    goto LABEL_5;
  }
  if (!v19[5])
  {
    SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v19[5];
    v19[5] = v9;
    goto LABEL_3;
  }
LABEL_5:
  -[SSVLeaseCertificateRequestOperation outputBlock](self, "outputBlock");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, v13[5], v19[5]);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

}

void __43__SSVLeaseCertificateRequestOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (NSString)certificateURLBagKey
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__16;
  v9 = __Block_byref_object_dispose__16;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__SSVLeaseCertificateRequestOperation_certificateURLBagKey__block_invoke;
  v4[3] = &unk_1E47B8680;
  v4[4] = self;
  v4[5] = &v5;
  -[SSVOperation dispatchSync:](self, "dispatchSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __59__SSVLeaseCertificateRequestOperation_certificateURLBagKey__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 320));
}

- (id)outputBlock
{
  void *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__6;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__SSVLeaseCertificateRequestOperation_outputBlock__block_invoke;
  v4[3] = &unk_1E47B8680;
  v4[4] = self;
  v4[5] = &v5;
  -[SSVOperation dispatchSync:](self, "dispatchSync:", v4);
  v2 = (void *)MEMORY[0x1A8585DF0](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __50__SSVLeaseCertificateRequestOperation_outputBlock__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1A8585DF0](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 336));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setOutputBlock:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__SSVLeaseCertificateRequestOperation_setOutputBlock___block_invoke;
  v6[3] = &unk_1E47B8AC0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SSVOperation dispatchAsync:](self, "dispatchAsync:", v6);

}

void __54__SSVLeaseCertificateRequestOperation_setOutputBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1A8585DF0](*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 336);
  *(_QWORD *)(v3 + 336) = v2;

}

- (void)setCertificateURLBagKey:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__SSVLeaseCertificateRequestOperation_setCertificateURLBagKey___block_invoke;
  v6[3] = &unk_1E47B8768;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SSVOperation dispatchAsync:](self, "dispatchAsync:", v6);

}

void __63__SSVLeaseCertificateRequestOperation_setCertificateURLBagKey___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 320), *(id *)(a1 + 40));
}

- (id)_resolveCertificateURLReturningError:(id *)a3
{
  __CFString *v5;
  SSURLBag *v6;
  void *v7;
  OS_dispatch_semaphore *bagLoadSemaphore;
  dispatch_semaphore_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__16;
  v29 = __Block_byref_object_dispose__16;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__16;
  v23 = __Block_byref_object_dispose__16;
  -[SSVPlaybackLeaseConfiguration certificateURL](self->_configuration, "certificateURL");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (!v20[5])
  {
    -[SSVLeaseCertificateRequestOperation certificateURLBagKey](self, "certificateURLBagKey");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v5 || (v5 = CFSTR("fps-cert")) != 0)
    {
      v6 = self->_urlBag;
      if (!v6)
      {
        +[SSURLBagContext contextWithBagType:](SSURLBagContext, "contextWithBagType:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[SSURLBag URLBagForContext:](SSURLBag, "URLBagForContext:", v7);
        v6 = (SSURLBag *)objc_claimAutoreleasedReturnValue();

      }
      bagLoadSemaphore = self->_bagLoadSemaphore;
      if (bagLoadSemaphore)
        v9 = bagLoadSemaphore;
      else
        v9 = dispatch_semaphore_create(0);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __76__SSVLeaseCertificateRequestOperation__resolveCertificateURLReturningError___block_invoke;
      v15[3] = &unk_1E47BABB8;
      v17 = &v19;
      v18 = &v25;
      v10 = v9;
      v16 = v10;
      -[SSURLBag loadValueForKey:completionBlock:](v6, "loadValueForKey:completionBlock:", v5, v15);
      dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

    }
    if (!v20[5] && !v26[5])
    {
      SSError((uint64_t)CFSTR("SSErrorDomain"), 124, 0, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v26[5];
      v26[5] = v11;

    }
  }
  if (a3)
    *a3 = objc_retainAutorelease((id)v26[5]);
  v13 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v13;
}

void __76__SSVLeaseCertificateRequestOperation__resolveCertificateURLReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = v5;
    v9 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v8;
LABEL_5:

    goto LABEL_6;
  }
  if (objc_msgSend(v12, "isNSString"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;
    goto LABEL_5;
  }
LABEL_6:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_certificateURLBagKey, 0);
  objc_storeStrong((id *)&self->_bagLoadSemaphore, 0);
}

@end
