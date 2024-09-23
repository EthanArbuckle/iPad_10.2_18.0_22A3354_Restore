@implementation SSVComplexOperation

- (void)configureWithURLBag:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__SSVComplexOperation_configureWithURLBag___block_invoke;
  v6[3] = &unk_1E47B8768;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SSVOperation dispatchAsync:](self, "dispatchAsync:", v6);

}

void __43__SSVComplexOperation_configureWithURLBag___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 296), *(id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 304);
  *(_QWORD *)(v2 + 304) = 0;

}

- (void)configureWithURLBagDictionary:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__SSVComplexOperation_configureWithURLBagDictionary___block_invoke;
  v6[3] = &unk_1E47B8768;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SSVOperation dispatchAsync:](self, "dispatchAsync:", v6);

}

void __53__SSVComplexOperation_configureWithURLBagDictionary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 296);
  *(_QWORD *)(v2 + 296) = 0;

  v4 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 304);
  *(_QWORD *)(v5 + 304) = v4;

}

- (id)newLoadURLOperationWithRequest:(id)a3
{
  id v4;
  SSVLoadURLOperation *v5;
  void *v6;
  SSVURLBagInterpreter *v7;
  SSVSAPSignaturePolicy *v8;
  void *v9;

  v4 = a3;
  v5 = -[SSVLoadURLOperation initWithURLRequest:]([SSVLoadURLOperation alloc], "initWithURLRequest:", v4);

  -[SSVLoadURLOperation setITunesStoreRequest:](v5, "setITunesStoreRequest:", 1);
  -[SSVComplexOperation URLBagDictionary](self, "URLBagDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[SSVURLBagInterpreter initWithURLBagDictionary:]([SSVURLBagInterpreter alloc], "initWithURLBagDictionary:", v6);
    -[SSVLoadURLOperation _configureWithURLBagInterpreter:](v5, "_configureWithURLBagInterpreter:", v7);
    -[SSVLoadURLOperation setMachineDataStyle:](v5, "setMachineDataStyle:", 2);
    v8 = -[SSVSAPSignaturePolicy initWithPolicyType:]([SSVSAPSignaturePolicy alloc], "initWithPolicyType:", 1);
    -[SSVComplexOperation SAPSession](self, "SAPSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVLoadURLOperation setSAPSession:](v5, "setSAPSession:", v9);

    -[SSVLoadURLOperation setSAPSignaturePolicy:](v5, "setSAPSignaturePolicy:", v8);
  }

  return v5;
}

- (SSVFairPlaySAPSession)SAPSession
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
  v8 = __Block_byref_object_copy__43;
  v9 = __Block_byref_object_dispose__43;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__SSVComplexOperation_SAPSession__block_invoke;
  v4[3] = &unk_1E47B8680;
  v4[4] = self;
  v4[5] = &v5;
  -[SSVOperation dispatchSync:](self, "dispatchSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SSVFairPlaySAPSession *)v2;
}

void __33__SSVComplexOperation_SAPSession__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 288));
}

- (void)setSAPSession:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__SSVComplexOperation_setSAPSession___block_invoke;
  v6[3] = &unk_1E47B8768;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SSVOperation dispatchAsync:](self, "dispatchAsync:", v6);

}

void __37__SSVComplexOperation_setSAPSession___block_invoke(uint64_t a1)
{
  id v1;
  id *v2;

  v1 = *(id *)(a1 + 40);
  v2 = (id *)(*(_QWORD *)(a1 + 32) + 288);
  if (*v2 != v1)
    objc_storeStrong(v2, v1);
}

- (NSDictionary)URLBagDictionary
{
  uint64_t v3;
  void *v4;
  void *v5;
  SSURLBag *v6;
  void *v7;
  dispatch_semaphore_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v13[7];
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  _QWORD v17[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__43;
  v28 = __Block_byref_object_dispose__43;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__43;
  v22 = __Block_byref_object_dispose__43;
  v23 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __39__SSVComplexOperation_URLBagDictionary__block_invoke;
  v17[3] = &unk_1E47BD7A8;
  v17[4] = self;
  v17[5] = &v18;
  v17[6] = &v24;
  -[SSVOperation dispatchSync:](self, "dispatchSync:", v17);
  v4 = (void *)v25[5];
  if (!v4)
  {
    if (!v19[5])
    {
      +[SSURLBagContext contextWithBagType:](SSURLBagContext, "contextWithBagType:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[SSURLBag initWithURLBagContext:]([SSURLBag alloc], "initWithURLBagContext:", v5);
      v7 = (void *)v19[5];
      v19[5] = (uint64_t)v6;

    }
    v8 = dispatch_semaphore_create(0);
    v9 = (void *)v19[5];
    v14[0] = v3;
    v14[1] = 3221225472;
    v14[2] = __39__SSVComplexOperation_URLBagDictionary__block_invoke_2;
    v14[3] = &unk_1E47BA528;
    v16 = &v24;
    v10 = v8;
    v15 = v10;
    objc_msgSend(v9, "loadWithCompletionBlock:", v14);
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    v13[0] = v3;
    v13[1] = 3221225472;
    v13[2] = __39__SSVComplexOperation_URLBagDictionary__block_invoke_3;
    v13[3] = &unk_1E47BD7A8;
    v13[4] = self;
    v13[5] = &v24;
    v13[6] = &v18;
    -[SSVOperation dispatchAsync:](self, "dispatchAsync:", v13);

    v4 = (void *)v25[5];
  }
  v11 = v4;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return (NSDictionary *)v11;
}

void __39__SSVComplexOperation_URLBagDictionary__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 296));
  v2 = objc_msgSend(*(id *)(a1[4] + 304), "copy");
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __39__SSVComplexOperation_URLBagDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __39__SSVComplexOperation_URLBagDictionary__block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    v2 = a1[4];
    v3 = *(void **)(v2 + 296);
    *(_QWORD *)(v2 + 296) = 0;

    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "copy");
    v5 = a1[4];
    v6 = *(void **)(v5 + 304);
    *(_QWORD *)(v5 + 304) = v4;
  }
  else
  {
    objc_storeStrong((id *)(a1[4] + 296), *(id *)(*(_QWORD *)(a1[6] + 8) + 40));
    v7 = a1[4];
    v6 = *(void **)(v7 + 304);
    *(_QWORD *)(v7 + 304) = 0;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlBagDictionary, 0);
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong((id *)&self->_sapSession, 0);
}

@end
