@implementation SSVAccountLessPlaybackOperation

- (NSString)assetStoreFrontIdentifier
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
  v8 = __Block_byref_object_copy__69;
  v9 = __Block_byref_object_dispose__69;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__SSVAccountLessPlaybackOperation_assetStoreFrontIdentifier__block_invoke;
  v4[3] = &unk_1E47B8680;
  v4[4] = self;
  v4[5] = &v5;
  -[SSVOperation dispatchSync:](self, "dispatchSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __60__SSVAccountLessPlaybackOperation_assetStoreFrontIdentifier__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 312));
}

- (NSDictionary)HTTPHeaderFields
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
  v8 = __Block_byref_object_copy__69;
  v9 = __Block_byref_object_dispose__69;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__SSVAccountLessPlaybackOperation_HTTPHeaderFields__block_invoke;
  v4[3] = &unk_1E47B8680;
  v4[4] = self;
  v4[5] = &v5;
  -[SSVOperation dispatchSync:](self, "dispatchSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDictionary *)v2;
}

void __51__SSVAccountLessPlaybackOperation_HTTPHeaderFields__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)itemIdentifier
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
  v8 = __Block_byref_object_copy__69;
  v9 = __Block_byref_object_dispose__69;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__SSVAccountLessPlaybackOperation_itemIdentifier__block_invoke;
  v4[3] = &unk_1E47B8680;
  v4[4] = self;
  v4[5] = &v5;
  -[SSVOperation dispatchSync:](self, "dispatchSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __49__SSVAccountLessPlaybackOperation_itemIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)responseBlock
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
  v8 = __Block_byref_object_copy__1_0;
  v9 = __Block_byref_object_dispose__2_0;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__SSVAccountLessPlaybackOperation_responseBlock__block_invoke;
  v4[3] = &unk_1E47B8680;
  v4[4] = self;
  v4[5] = &v5;
  -[SSVOperation dispatchSync:](self, "dispatchSync:", v4);
  v2 = (void *)MEMORY[0x1A8585DF0](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __48__SSVAccountLessPlaybackOperation_responseBlock__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setAssetStoreFrontIdentifier:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__SSVAccountLessPlaybackOperation_setAssetStoreFrontIdentifier___block_invoke;
  v6[3] = &unk_1E47B8768;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SSVOperation dispatchAsync:](self, "dispatchAsync:", v6);

}

void __64__SSVAccountLessPlaybackOperation_setAssetStoreFrontIdentifier___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 312), *(id *)(a1 + 40));
}

- (void)setItemIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__SSVAccountLessPlaybackOperation_setItemIdentifier___block_invoke;
  v6[3] = &unk_1E47B8768;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SSVOperation dispatchAsync:](self, "dispatchAsync:", v6);

}

void __53__SSVAccountLessPlaybackOperation_setItemIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 328) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 328);
    *(_QWORD *)(v5 + 328) = v4;

  }
}

- (void)setResponseBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__SSVAccountLessPlaybackOperation_setResponseBlock___block_invoke;
  v6[3] = &unk_1E47B8AC0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SSVOperation dispatchAsync:](self, "dispatchAsync:", v6);

}

void __52__SSVAccountLessPlaybackOperation_setResponseBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 336) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 336);
    *(_QWORD *)(v5 + 336) = v4;

  }
}

- (void)setHTTPHeaderFields:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__SSVAccountLessPlaybackOperation_setHTTPHeaderFields___block_invoke;
  v6[3] = &unk_1E47B8768;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SSVOperation dispatchAsync:](self, "dispatchAsync:", v6);

}

void __55__SSVAccountLessPlaybackOperation_setHTTPHeaderFields___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 320), *(id *)(a1 + 40));
}

- (void)setValue:(id)a3 forHTTPHeaderField:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  SSVAccountLessPlaybackOperation *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__SSVAccountLessPlaybackOperation_setValue_forHTTPHeaderField___block_invoke;
  v10[3] = &unk_1E47B87B8;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  -[SSVOperation dispatchAsync:](self, "dispatchAsync:", v10);

}

uint64_t __63__SSVAccountLessPlaybackOperation_setValue_forHTTPHeaderField___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;

  v2 = a1[4];
  v3 = *(void **)(a1[5] + 320);
  if (!v2)
    return objc_msgSend(v3, "removeObjectForKey:", a1[6]);
  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = a1[5];
    v6 = *(void **)(v5 + 320);
    *(_QWORD *)(v5 + 320) = v4;

    v2 = a1[4];
    v3 = *(void **)(a1[5] + 320);
  }
  return objc_msgSend(v3, "setObject:forKey:", v2, a1[6]);
}

- (id)valueForHTTPHeaderField:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__69;
  v15 = __Block_byref_object_dispose__69;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__SSVAccountLessPlaybackOperation_valueForHTTPHeaderField___block_invoke;
  v8[3] = &unk_1E47B86D0;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[SSVOperation dispatchSync:](self, "dispatchSync:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __59__SSVAccountLessPlaybackOperation_valueForHTTPHeaderField___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 320), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  SSVURLBagInterpreter *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  SSVPlaybackResponse *v19;
  uint64_t v20;
  SSVPlaybackResponse *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  _QWORD v33[5];
  _QWORD v34[6];
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__69;
  v47 = __Block_byref_object_dispose__69;
  v48 = 0;
  -[SSVComplexOperation URLBagDictionary](self, "URLBagDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("subDownload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__69;
    v41 = __Block_byref_object_dispose__69;
    v42 = 0;
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v4);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:", v32);
    objc_msgSend(v5, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v5, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
    -[SSVAccountLessPlaybackOperation HTTPHeaderFields](self, "HTTPHeaderFields");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __39__SSVAccountLessPlaybackOperation_main__block_invoke;
    v35[3] = &unk_1E47BA5D8;
    v8 = v5;
    v36 = v8;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v35);
    v29 = v6;
    v9 = -[SSVComplexOperation newLoadURLOperationWithRequest:](self, "newLoadURLOperationWithRequest:", v8);
    +[SSVURLDataConsumer consumer](SSVURLProtocolConsumer, "consumer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDataConsumer:", v10);

    v34[0] = v7;
    v34[1] = 3221225472;
    v34[2] = __39__SSVAccountLessPlaybackOperation_main__block_invoke_2;
    v34[3] = &unk_1E47BE808;
    v34[4] = &v43;
    v34[5] = &v37;
    objc_msgSend(v9, "setOutputBlock:", v34);
    v33[0] = v7;
    v33[1] = 3221225472;
    v33[2] = __39__SSVAccountLessPlaybackOperation_main__block_invoke_3;
    v33[3] = &unk_1E47BFC70;
    v33[4] = self;
    objc_msgSend(v9, "setPrepareRequestBlock:", v33);
    -[SSVOperation runChildOperation:](self, "runChildOperation:", v9);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend((id)v38[5], "objectForKey:", CFSTR("keybag"));
      v30 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        SSVFairPlayContextIdentifier();
        v11 = objc_retainAutorelease(v30);
        objc_msgSend(v11, "bytes");
        objc_msgSend(v11, "length");
        lCUad();
      }
      objc_msgSend((id)v38[5], "objectForKey:", CFSTR("failureType"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (SSVURLBagInterpreter *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend((id)v38[5], "objectForKey:", CFSTR("dialog"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[SSVURLBagInterpreter setObject:forKey:](v13, "setObject:forKey:", v14, CFSTR("SSVPlaybackResponseErrorUserInfoKeyDialogDictionary"));
        if (!-[SSVURLBagInterpreter count](v13, "count"))
        {

          v13 = 0;
        }
        v15 = (void *)MEMORY[0x1E0CB35C8];
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v16 = objc_msgSend(v12, "integerValue");
        else
          v16 = 0;
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("SSServerErrorDomain"), v16, v13);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v44[5];
        v44[5] = v25;

        v19 = 0;
      }
      else
      {
        v21 = [SSVPlaybackResponse alloc];
        v22 = v38[5];
        objc_msgSend(v9, "URLResponse");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[SSVPlaybackResponse initWithDictionary:URLResponse:](v21, "initWithDictionary:URLResponse:", v22, v23);

        v13 = -[SSVURLBagInterpreter initWithURLBagDictionary:]([SSVURLBagInterpreter alloc], "initWithURLBagDictionary:", v3);
        -[SSVURLBagInterpreter pastisCertificateURL](v13, "pastisCertificateURL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSVPlaybackResponse setFallbackStreamingKeyCertificateURL:](v19, "setFallbackStreamingKeyCertificateURL:", v24);

        -[SSVURLBagInterpreter pastisKeyServerURL](v13, "pastisKeyServerURL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSVPlaybackResponse setFallbackStreamingKeyServerURL:](v19, "setFallbackStreamingKeyServerURL:", v14);
      }

    }
    else if (v44[5])
    {
      v19 = 0;
    }
    else
    {
      SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
      v20 = objc_claimAutoreleasedReturnValue();
      v19 = 0;
      v31 = (id)v44[5];
      v44[5] = v20;

    }
    _Block_object_dispose(&v37, 8);

  }
  else
  {
    SSError((uint64_t)CFSTR("SSErrorDomain"), 124, 0, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v44[5];
    v44[5] = v17;

    v19 = 0;
  }
  -[SSVAccountLessPlaybackOperation responseBlock](self, "responseBlock");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  if (v27)
    (*(void (**)(uint64_t, SSVPlaybackResponse *, uint64_t))(v27 + 16))(v27, v19, v44[5]);

  _Block_object_dispose(&v43, 8);
}

uint64_t __39__SSVAccountLessPlaybackOperation_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

void __39__SSVAccountLessPlaybackOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __39__SSVAccountLessPlaybackOperation_main__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_requestBodyData");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHTTPBody:", v4);

}

- (id)_requestBodyData
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v15;
  uint64_t v16;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[SSDevice currentDevice](SSDevice, "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueDeviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("guid"));
  -[SSVAccountLessPlaybackOperation itemIdentifier](self, "itemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("salableAdamId"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("accountless-streaming"), CFSTR("action"));
  -[SSVAccountLessPlaybackOperation assetStoreFrontIdentifier](self, "assetStoreFrontIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("assetStoreFront"));
  v16 = 0;
  v15 = 0;
  v8 = SSVFairPlayContextIdentifier();
  Mt76Vq80ux(v8, -1, 0, 309, (uint64_t)&v16, (uint64_t)&v15);
  if (!v9 && v16)
  {
    v10 = objc_alloc(MEMORY[0x1E0C99D50]);
    v11 = (void *)objc_msgSend(v10, "initWithBytesNoCopy:length:freeWhenDone:", v16, v15, 0);
    objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("kbsync"));
    jEHf8Xzsv8K(v16);

  }
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseBlock, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_httpHeaderFields, 0);
  objc_storeStrong((id *)&self->_assetStoreFrontIdentifier, 0);
}

@end
