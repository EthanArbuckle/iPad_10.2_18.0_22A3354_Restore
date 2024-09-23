@implementation STStatusDomainPublisherXPCServerHandle

+ (id)sharedMachServiceServerHandle
{
  if (qword_1ED0CB4B0 != -1)
    dispatch_once(&qword_1ED0CB4B0, &__block_literal_global_18);
  return (id)_MergedGlobals_16;
}

- (void)updateVolatileDataForPublisherClient:(id)a3 domain:(unint64_t)a4 usingDiffProvider:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *internalQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __115__STStatusDomainPublisherXPCServerHandle_updateVolatileDataForPublisherClient_domain_usingDiffProvider_completion___block_invoke;
  block[3] = &unk_1E91E5E88;
  v20 = v12;
  v21 = a4;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_sync(internalQueue, block);

}

- (void)registerPublisherClient:(id)a3 forDomain:(unint64_t)a4 fallbackData:(id)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__STStatusDomainPublisherXPCServerHandle_registerPublisherClient_forDomain_fallbackData___block_invoke;
  v13[3] = &unk_1E91E4F48;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(internalQueue, v13);

}

void __89__STStatusDomainPublisherXPCServerHandle_registerPublisherClient_forDomain_fallbackData___block_invoke(uint64_t *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id location;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[4];
  v3 = v2;
  objc_msgSend(v3, "objectForKey:", a1[7]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, a1[7]);
  }
  objc_msgSend(v4, "addObject:", a1[5]);
  if (objc_msgSend(v4, "count") == 1)
  {
    v5 = a1[4];
    if (v5)
      v6 = *(void **)(v5 + 8);
    else
      v6 = 0;
    objc_msgSend(v6, "recordForKey:", CFSTR("data"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFallbackData:forClientKey:domain:", a1[6], CFSTR("sharedClient"), a1[7]);
    v8 = a1[4];
    if (v8)
      v9 = *(void **)(v8 + 8);
    else
      v9 = 0;
    objc_msgSend(v9, "recordForKey:", CFSTR("volatileData"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFallbackData:forClientKey:domain:", a1[6], CFSTR("sharedClient"), a1[7]);
    -[STStatusDomainPublisherXPCServerHandle _internalQueue_setupXPCConnectionIfNecessary](a1[4]);
    objc_initWeak(&location, (id)a1[4]);
    v11 = (_QWORD *)a1[4];
    if (v11)
      v11 = (_QWORD *)v11[7];
    v12 = v11;
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __89__STStatusDomainPublisherXPCServerHandle_registerPublisherClient_forDomain_fallbackData___block_invoke_2;
    v17 = &unk_1E91E4EF8;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", &v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "registerToPublishDomain:fallbackData:", a1[7], a1[6], v14, v15, v16, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
}

void __115__STStatusDomainPublisherXPCServerHandle_updateVolatileDataForPublisherClient_domain_usingDiffProvider_completion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[4];
  v3 = *(_QWORD *)(a1 + 64);
  v4 = v2;
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v6)
  {
    -[STStatusDomainPublisherXPCServerHandle _internalQueue_volatileDataForDomain:usingFallbackIfNecessary:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
      -[STStatusDomainPublisherXPCServerHandle _internalQueue_setupXPCConnectionIfNecessary](*(_QWORD *)(a1 + 32));
      -[STStatusDomainPublisherXPCServerHandle _internalQueue_publishDiff:forDomain:withChangeContext:discardingOnExit:completion:](*(_QWORD *)(a1 + 32), v8, *(_QWORD *)(a1 + 64), v9, 1, *(void **)(a1 + 56));

    }
    else
    {
      v11 = *(_QWORD *)(a1 + 56);
      if (v11)
        (*(void (**)(void))(v11 + 16))();
    }

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 56);
    if (v10)
      (*(void (**)(void))(v10 + 16))();
  }
}

- (void)_internalQueue_publishDiff:(uint64_t)a3 forDomain:(void *)a4 withChangeContext:(int)a5 discardingOnExit:(void *)a6 completion:
{
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  __CFString *v15;
  __CFString *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  char v26;
  _QWORD v27[5];
  id v28;

  v11 = a2;
  v12 = a4;
  v13 = a6;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    if (v13)
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __125__STStatusDomainPublisherXPCServerHandle__internalQueue_publishDiff_forDomain_withChangeContext_discardingOnExit_completion___block_invoke;
      v27[3] = &unk_1E91E5498;
      v27[4] = a1;
      v28 = v13;
      v14 = (void (**)(_QWORD))MEMORY[0x1D17E6508](v27);

    }
    else
    {
      v14 = 0;
    }
    if (STIsValidDiffForStatusDomain(v11) && (objc_msgSend(v11, "isEmpty") & 1) == 0)
    {
      v15 = CFSTR("data");
      if (a5)
        v15 = CFSTR("volatileData");
      v16 = v15;
      v17 = *(id *)(a1 + 8);
      objc_msgSend(v17, "recordForKey:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if ((a5 & 1) != 0)
        -[STStatusDomainPublisherXPCServerHandle _internalQueue_volatileDataForDomain:usingFallbackIfNecessary:](a1, a3, 1);
      else
        -[STStatusDomainPublisherXPCServerHandle _internalQueue_dataForDomain:usingFallbackIfNecessary:](a1, a3, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __125__STStatusDomainPublisherXPCServerHandle__internalQueue_publishDiff_forDomain_withChangeContext_discardingOnExit_completion___block_invoke_2;
        v20[3] = &unk_1E91E5F00;
        v21 = v18;
        v25 = a3;
        v22 = v11;
        v23 = a1;
        v24 = v12;
        v26 = a5;
        -[STStatusDomainPublisherXPCServerHandle _internalQueue_mutateDataForDomain:discardingOnExit:wrappingCompletion:usingBlock:](a1, a3, a5, v14, v20);

      }
      else if (v14)
      {
        v14[2](v14);
      }

    }
    else if (v14)
    {
      v14[2](v14);
    }

  }
}

- (id)_internalQueue_volatileDataForDomain:(int)a3 usingFallbackIfNecessary:
{
  void *v6;
  void *v7;
  BOOL v8;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 8), "recordForKey:", CFSTR("volatileData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentDataForDomain:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = 1;
    else
      v8 = a3 == 0;
    if (!v8)
    {
      objc_msgSend(v6, "fallbackDataForClientKey:domain:", CFSTR("sharedClient"), a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_internalQueue_setupXPCConnectionIfNecessary
{
  _QWORD *v2;
  void (*v3)(void);
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    if (!*(_QWORD *)(a1 + 56))
    {
      v2 = *(_QWORD **)(a1 + 64);
      v3 = (void (*)(void))v2[2];
      v4 = v2;
      v3();
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      STStatusDomainPublisherXPCServerInterface();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setRemoteObjectInterface:", v6);

      STStatusDomainPublisherXPCClientInterface();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setExportedInterface:", v7);

      objc_msgSend(v5, "setExportedObject:", a1);
      objc_storeStrong((id *)(a1 + 56), v5);
      objc_initWeak(&location, (id)a1);
      objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_36);
      v8 = MEMORY[0x1E0C809B0];
      v9 = 3221225472;
      v10 = __86__STStatusDomainPublisherXPCServerHandle__internalQueue_setupXPCConnectionIfNecessary__block_invoke_37;
      v11 = &unk_1E91E4B50;
      objc_copyWeak(&v12, &location);
      objc_msgSend(v5, "setInvalidationHandler:", &v8);
      objc_msgSend(v5, "resume", v8, v9, v10, v11);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);

    }
  }
}

void __125__STStatusDomainPublisherXPCServerHandle__internalQueue_publishDiff_forDomain_withChangeContext_discardingOnExit_completion___block_invoke(uint64_t a1)
{
  NSObject *isa;

  isa = *(NSObject **)(a1 + 32);
  if (isa)
    isa = isa[6].isa;
  dispatch_async(isa, *(dispatch_block_t *)(a1 + 40));
}

- (void)_internalQueue_mutateDataForDomain:(int)a3 discardingOnExit:(void *)a4 wrappingCompletion:(void *)a5 usingBlock:
{
  id v9;
  void (**v10)(id, void *);
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  id *v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v9 = a4;
  v10 = a5;
  if (v9)
  {
    v11 = 16;
    if (a3)
      v11 = 24;
    v12 = *(id *)(a1 + v11);
    objc_msgSend(v12, "objectForKey:", a2);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v13 = objc_alloc_init(MEMORY[0x1E0C99E10]);
      objc_msgSend(v12, "setObject:forKey:", v13, a2);
    }
    v29 = 0;
    v30 = (id *)&v29;
    v31 = 0x3042000000;
    v32 = __Block_byref_object_copy__34;
    v33 = __Block_byref_object_dispose__35;
    v34 = 0;
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __124__STStatusDomainPublisherXPCServerHandle__internalQueue_mutateDataForDomain_discardingOnExit_wrappingCompletion_usingBlock___block_invoke;
    v22 = &unk_1E91E5F70;
    v23 = a1;
    v14 = v13;
    v24 = v14;
    v27 = &v29;
    v15 = v12;
    v25 = v15;
    v28 = a2;
    v26 = v9;
    v16 = (void *)MEMORY[0x1D17E6508](&v19);
    v17 = (void *)objc_msgSend(v16, "copy", v19, v20, v21, v22, v23);
    objc_storeWeak(v30 + 5, v17);
    v18 = (void *)MEMORY[0x1D17E6508](v17);
    objc_msgSend(v14, "addObject:", v18);

    _Block_object_dispose(&v29, 8);
    objc_destroyWeak(&v34);

  }
  else
  {
    v16 = 0;
  }
  v10[2](v10, v16);

}

void __125__STStatusDomainPublisherXPCServerHandle__internalQueue_publishDiff_forDomain_withChangeContext_discardingOnExit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = a2;
  objc_msgSend(v3, "addDiff:forClientKey:domain:", v4, CFSTR("sharedClient"), v5);
  -[STStatusDomainPublisherXPCServerHandle _internalQueue_publishDiffToServer:forDomain:withChangeContext:replacingData:discardingOnExit:reply:](*(_QWORD *)(a1 + 48), *(void **)(a1 + 40), *(_QWORD *)(a1 + 64), *(void **)(a1 + 56), 0, *(unsigned __int8 *)(a1 + 72), v6);

}

uint64_t __124__STStatusDomainPublisherXPCServerHandle__internalQueue_mutateDataForDomain_discardingOnExit_wrappingCompletion_usingBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  objc_msgSend(v2, "removeObject:", WeakRetained);

  if (!objc_msgSend(*(id *)(a1 + 32), "count"))
    objc_msgSend(*(id *)(a1 + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 64));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_internalQueue_publishDiffToServer:(uint64_t)a3 forDomain:(void *)a4 withChangeContext:(uint64_t)a5 replacingData:(uint64_t)a6 discardingOnExit:(void *)a7 reply:
{
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a7;
  if (a1)
  {
    v13 = *(NSObject **)(a1 + 40);
    v14 = a4;
    v15 = a2;
    dispatch_assert_queue_V2(v13);
    v16 = v18;
    if (!v18)
      v16 = &__block_literal_global_32;
    v18 = v16;
    objc_msgSend(*(id *)(a1 + 56), "remoteObjectProxy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "publishDiff:forDomain:withChangeContext:replacingData:discardingOnExit:reply:", v15, a3, v14, a5, a6, v18);

  }
}

void __80__STStatusDomainPublisherXPCServerHandle_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[1];
  v10 = v2;
  objc_msgSend(v10, "recordForKey:", CFSTR("data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "domainsWithData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__STStatusDomainPublisherXPCServerHandle_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v14[3] = &unk_1E91E5EB0;
  v15 = v3;
  v16 = *(id *)(a1 + 40);
  v6 = v3;
  objc_msgSend(v4, "enumerateWithBlock:", v14);
  objc_msgSend(v10, "recordForKey:", CFSTR("volatileData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "domainsWithData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __80__STStatusDomainPublisherXPCServerHandle_descriptionBuilderWithMultilinePrefix___block_invoke_4;
  v11[3] = &unk_1E91E5EB0;
  v12 = v7;
  v13 = *(id *)(a1 + 40);
  v9 = v7;
  objc_msgSend(v8, "enumerateWithBlock:", v11);

}

void __80__STStatusDomainPublisherXPCServerHandle_descriptionBuilderWithMultilinePrefix___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[5];
  id v4;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __80__STStatusDomainPublisherXPCServerHandle_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v3[3] = &unk_1E91E4AD8;
  v3[4] = a1[6];
  v4 = v1;
  objc_msgSend(v4, "appendBodySectionWithName:multilinePrefix:block:", 0, v2, v3);

}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STStatusDomainPublisherXPCServerHandle descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  NSObject *internalQueue;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v12;
  id v13;
  STStatusDomainPublisherXPCServerHandle *v14;

  v4 = a3;
  -[STStatusDomainPublisherXPCServerHandle succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__STStatusDomainPublisherXPCServerHandle_descriptionBuilderWithMultilinePrefix___block_invoke;
  block[3] = &unk_1E91E5058;
  v7 = v5;
  v12 = v7;
  v13 = v4;
  v14 = self;
  v8 = v4;
  dispatch_sync(internalQueue, block);
  v9 = v7;

  return v9;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

void __80__STStatusDomainPublisherXPCServerHandle_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "currentDataForDomain:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  STSystemStatusDescriptionForDomain(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (volatile)"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", v8, v6);
}

void __124__STStatusDomainPublisherXPCServerHandle__internalQueue_mutateDataForDomain_discardingOnExit_wrappingCompletion_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(NSObject **)(v2 + 40);
  else
    v3 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __124__STStatusDomainPublisherXPCServerHandle__internalQueue_mutateDataForDomain_discardingOnExit_wrappingCompletion_usingBlock___block_invoke_2;
  block[3] = &unk_1E91E5F48;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 64);
  v9 = v4;
  v12 = v5;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 72);
  v10 = v6;
  v13 = v7;
  v11 = *(id *)(a1 + 56);
  dispatch_async(v3, block);

}

- (NSString)description
{
  return (NSString *)-[STStatusDomainPublisherXPCServerHandle descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

void __71__STStatusDomainPublisherXPCServerHandle_sharedMachServiceServerHandle__block_invoke()
{
  STStatusDomainPublisherXPCServerHandle *v0;
  void *v1;

  v0 = objc_alloc_init(STStatusDomainPublisherXPCServerHandle);
  v1 = (void *)_MergedGlobals_16;
  _MergedGlobals_16 = (uint64_t)v0;

}

- (STStatusDomainPublisherXPCServerHandle)init
{
  void *v3;
  STStatusDomainPublisherXPCServerHandle *v4;

  +[STServerLaunchMonitor sharedInstance](STServerLaunchMonitor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[STStatusDomainPublisherXPCServerHandle initWithXPCConnectionProvider:serverLaunchObservable:](self, "initWithXPCConnectionProvider:serverLaunchObservable:", &__block_literal_global_7, v3);

  return v4;
}

id __46__STStatusDomainPublisherXPCServerHandle_init__block_invoke()
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.systemstatus.publisher"), 0);
}

- (STStatusDomainPublisherXPCServerHandle)initWithXPCConnectionProvider:(id)a3 serverLaunchObservable:(id)a4
{
  id v6;
  id v7;
  STStatusDomainPublisherXPCServerHandle *v8;
  void *v9;
  void *v10;
  void *v11;
  STStatusDomainDataChangeLog *v12;
  STStatusDomainDataChangeLog *dataChangeLog;
  BSMutableIntegerMap *v14;
  BSMutableIntegerMap *dataMutationCompletionsByDomain;
  BSMutableIntegerMap *v16;
  BSMutableIntegerMap *volatileDataMutationCompletionsByDomain;
  BSMutableIntegerMap *v18;
  BSMutableIntegerMap *publisherClientsByDomain;
  uint64_t Serial;
  OS_dispatch_queue *internalQueue;
  uint64_t v22;
  OS_dispatch_queue *clientQueue;
  uint64_t v24;
  id xpcConnectionProvider;
  id v26;
  STStatusDomainPublisherXPCServerHandle *v28;
  objc_super v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)STStatusDomainPublisherXPCServerHandle;
  v8 = -[STStatusDomainPublisherXPCServerHandle init](&v29, sel_init);
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0C99E40];
    v30[0] = CFSTR("data");
    v30[1] = CFSTR("volatileData");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "orderedSetWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[STStatusDomainDataChangeLog initWithRecordKeys:]([STStatusDomainDataChangeLog alloc], "initWithRecordKeys:", v11);
    dataChangeLog = v8->_dataChangeLog;
    v8->_dataChangeLog = v12;

    v14 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E0D017B8]);
    dataMutationCompletionsByDomain = v8->_dataMutationCompletionsByDomain;
    v8->_dataMutationCompletionsByDomain = v14;

    v16 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E0D017B8]);
    volatileDataMutationCompletionsByDomain = v8->_volatileDataMutationCompletionsByDomain;
    v8->_volatileDataMutationCompletionsByDomain = v16;

    v18 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E0D017B8]);
    publisherClientsByDomain = v8->_publisherClientsByDomain;
    v8->_publisherClientsByDomain = v18;

    Serial = BSDispatchQueueCreateSerial();
    internalQueue = v8->_internalQueue;
    v8->_internalQueue = (OS_dispatch_queue *)Serial;

    v22 = BSDispatchQueueCreateSerial();
    clientQueue = v8->_clientQueue;
    v8->_clientQueue = (OS_dispatch_queue *)v22;

    v24 = objc_msgSend(v6, "copy");
    xpcConnectionProvider = v8->_xpcConnectionProvider;
    v8->_xpcConnectionProvider = (id)v24;

    objc_storeStrong((id *)&v8->_serverLaunchObservable, a4);
    -[STServerLaunchObservable addObserver:](v8->_serverLaunchObservable, "addObserver:", v8);
    v28 = v8;
    v26 = (id)BSLogAddStateCaptureBlockWithTitle();

  }
  return v8;
}

uint64_t __95__STStatusDomainPublisherXPCServerHandle_initWithXPCConnectionProvider_serverLaunchObservable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "description");
}

- (void)dealloc
{
  STStatusDomainPublisherXPCServerHandle *v2;
  objc_super v3;

  v2 = self;
  if (self)
    self = (STStatusDomainPublisherXPCServerHandle *)self->_serverLaunchObservable;
  -[STStatusDomainPublisherXPCServerHandle removeObserver:](self, "removeObserver:", v2);
  v3.receiver = v2;
  v3.super_class = (Class)STStatusDomainPublisherXPCServerHandle;
  -[STStatusDomainPublisherXPCServerHandle dealloc](&v3, sel_dealloc);
}

- (id)publishedDataForDomain:(unint64_t)a3
{
  NSObject *internalQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__STStatusDomainPublisherXPCServerHandle_publishedDataForDomain___block_invoke;
  block[3] = &unk_1E91E4ED0;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(internalQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __65__STStatusDomainPublisherXPCServerHandle_publishedDataForDomain___block_invoke(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  -[STStatusDomainPublisherXPCServerHandle _internalQueue_dataForDomain:usingFallbackIfNecessary:](a1[4], a1[6], 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copyWithZone:", 0);
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_internalQueue_dataForDomain:(int)a3 usingFallbackIfNecessary:
{
  void *v6;
  void *v7;
  BOOL v8;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 8), "recordForKey:", CFSTR("data"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentDataForDomain:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = 1;
    else
      v8 = a3 == 0;
    if (!v8)
    {
      objc_msgSend(v6, "fallbackDataForClientKey:domain:", CFSTR("sharedClient"), a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)publishedVolatileDataForDomain:(unint64_t)a3
{
  NSObject *internalQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__STStatusDomainPublisherXPCServerHandle_publishedVolatileDataForDomain___block_invoke;
  block[3] = &unk_1E91E4ED0;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(internalQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __73__STStatusDomainPublisherXPCServerHandle_publishedVolatileDataForDomain___block_invoke(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  -[STStatusDomainPublisherXPCServerHandle _internalQueue_volatileDataForDomain:usingFallbackIfNecessary:](a1[4], a1[6], 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copyWithZone:", 0);
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __89__STStatusDomainPublisherXPCServerHandle_registerPublisherClient_forDomain_fallbackData___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  STSystemStatusLogPublishing();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1D12C7000, v5, OS_LOG_TYPE_DEFAULT, "Failed to get server proxy in registerPublisherClient:forDomain:fallbackData: -- error: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  -[STStatusDomainPublisherXPCServerHandle _tearDownXPCConnection]((uint64_t)WeakRetained);

}

- (void)_tearDownXPCConnection
{
  NSObject *v1;
  _QWORD block[5];

  if (a1)
  {
    v1 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__STStatusDomainPublisherXPCServerHandle__tearDownXPCConnection__block_invoke;
    block[3] = &unk_1E91E4E40;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

- (void)removePublisherClient:(id)a3 forDomain:(unint64_t)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__STStatusDomainPublisherXPCServerHandle_removePublisherClient_forDomain___block_invoke;
  block[3] = &unk_1E91E4F20;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_sync(internalQueue, block);

}

void __74__STStatusDomainPublisherXPCServerHandle_removePublisherClient_forDomain___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[4];
  v14 = v2;
  objc_msgSend(v14, "objectForKey:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", a1[5]);
  if (!objc_msgSend(v3, "count"))
  {
    objc_msgSend(v14, "removeObjectForKey:", a1[6]);
    v4 = a1[4];
    if (v4)
      v5 = *(void **)(v4 + 56);
    else
      v5 = 0;
    objc_msgSend(v5, "remoteObjectProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unregisterFromPublishingDomain:", a1[6]);

    v7 = a1[4];
    if (v7)
      v8 = *(void **)(v7 + 8);
    else
      v8 = 0;
    objc_msgSend(v8, "recordForKey:", CFSTR("volatileData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeAllEntriesForClientKey:domain:", CFSTR("sharedClient"), a1[6]);
    v10 = a1[4];
    if (v10)
      v11 = *(void **)(v10 + 8);
    else
      v11 = 0;
    objc_msgSend(v11, "recordForKey:", CFSTR("data"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentDataForDomain:", a1[6]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      objc_msgSend(v12, "removeAllEntriesForClientKey:domain:", CFSTR("sharedClient"), a1[6]);

  }
}

- (void)publishData:(id)a3 forPublisherClient:(id)a4 domain:(unint64_t)a5 withChangeContext:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *internalQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  unint64_t v26;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __109__STStatusDomainPublisherXPCServerHandle_publishData_forPublisherClient_domain_withChangeContext_completion___block_invoke;
  v21[3] = &unk_1E91E5E60;
  v21[4] = self;
  v22 = v13;
  v23 = v12;
  v24 = v14;
  v25 = v15;
  v26 = a5;
  v17 = v15;
  v18 = v14;
  v19 = v12;
  v20 = v13;
  dispatch_async(internalQueue, v21);

}

void __109__STStatusDomainPublisherXPCServerHandle_publishData_forPublisherClient_domain_withChangeContext_completion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  int v6;
  uint64_t v7;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[4];
  v3 = *(_QWORD *)(a1 + 72);
  v4 = v2;
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v6)
  {
    -[STStatusDomainPublisherXPCServerHandle _internalQueue_setupXPCConnectionIfNecessary](*(_QWORD *)(a1 + 32));
    -[STStatusDomainPublisherXPCServerHandle _internalQueue_publishData:forDomain:withChangeContext:discardingOnExit:completion:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 48), *(_QWORD *)(a1 + 72), *(void **)(a1 + 56), 0, *(void **)(a1 + 64));
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 64);
    if (v7)
      (*(void (**)(void))(v7 + 16))();
  }
}

- (void)_internalQueue_publishData:(uint64_t)a3 forDomain:(void *)a4 withChangeContext:(int)a5 discardingOnExit:(void *)a6 completion:
{
  unint64_t v11;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  _BOOL4 valid;
  id v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  id v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  BOOL v32;
  BOOL v33;
  char v34;
  _QWORD v35[5];
  id v36;

  v11 = a2;
  v12 = a4;
  v13 = a6;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    if (v13)
    {
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __125__STStatusDomainPublisherXPCServerHandle__internalQueue_publishData_forDomain_withChangeContext_discardingOnExit_completion___block_invoke;
      v35[3] = &unk_1E91E5498;
      v35[4] = a1;
      v36 = v13;
      v14 = (void (**)(_QWORD))MEMORY[0x1D17E6508](v35);

    }
    else
    {
      v14 = 0;
    }
    valid = STIsValidDataForStatusDomain((void *)v11);
    if (!v11 || valid)
    {
      if (v12)
      {
        if (STIsValidDataChangeContextForStatusDomain(v12))
          v17 = v12;
        else
          v17 = 0;
      }
      else
      {
        v17 = 0;
      }
      v16 = v17;

      v18 = CFSTR("data");
      if (a5)
        v18 = CFSTR("volatileData");
      v19 = v18;
      v20 = *(id *)(a1 + 8);
      objc_msgSend(v20, "recordForKey:", v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if ((a5 & 1) != 0)
        -[STStatusDomainPublisherXPCServerHandle _internalQueue_volatileDataForDomain:usingFallbackIfNecessary:](a1, a3, 0);
      else
        -[STStatusDomainPublisherXPCServerHandle _internalQueue_dataForDomain:usingFallbackIfNecessary:](a1, a3, 0);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      v23 = v21 == 0;
      if (v11 | v21 && (objc_msgSend((id)v21, "isEqual:", v11) & 1) == 0)
      {
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __125__STStatusDomainPublisherXPCServerHandle__internalQueue_publishData_forDomain_withChangeContext_discardingOnExit_completion___block_invoke_2;
        v25[3] = &unk_1E91E5ED8;
        v26 = v24;
        v31 = a3;
        v32 = v11 == 0;
        v33 = v23;
        v27 = (id)v11;
        v28 = a1;
        v29 = v16;
        v34 = a5;
        v30 = v22;
        -[STStatusDomainPublisherXPCServerHandle _internalQueue_mutateDataForDomain:discardingOnExit:wrappingCompletion:usingBlock:](a1, a3, a5, v14, v25);

      }
      else if (v14)
      {
        v14[2](v14);
      }

    }
    else
    {
      if (v14)
        v14[2](v14);
      v16 = v12;
    }

    v12 = v16;
  }

}

- (void)publishVolatileData:(id)a3 forPublisherClient:(id)a4 domain:(unint64_t)a5 withChangeContext:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *internalQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  unint64_t v26;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __117__STStatusDomainPublisherXPCServerHandle_publishVolatileData_forPublisherClient_domain_withChangeContext_completion___block_invoke;
  v21[3] = &unk_1E91E5E60;
  v21[4] = self;
  v22 = v13;
  v23 = v12;
  v24 = v14;
  v25 = v15;
  v26 = a5;
  v17 = v15;
  v18 = v14;
  v19 = v12;
  v20 = v13;
  dispatch_async(internalQueue, v21);

}

void __117__STStatusDomainPublisherXPCServerHandle_publishVolatileData_forPublisherClient_domain_withChangeContext_completion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  int v6;
  uint64_t v7;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[4];
  v3 = *(_QWORD *)(a1 + 72);
  v4 = v2;
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v6)
  {
    -[STStatusDomainPublisherXPCServerHandle _internalQueue_setupXPCConnectionIfNecessary](*(_QWORD *)(a1 + 32));
    -[STStatusDomainPublisherXPCServerHandle _internalQueue_publishData:forDomain:withChangeContext:discardingOnExit:completion:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 48), *(_QWORD *)(a1 + 72), *(void **)(a1 + 56), 1, *(void **)(a1 + 64));
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 64);
    if (v7)
      (*(void (**)(void))(v7 + 16))();
  }
}

- (void)updateDataForPublisherClient:(id)a3 domain:(unint64_t)a4 usingDiffProvider:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *internalQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__STStatusDomainPublisherXPCServerHandle_updateDataForPublisherClient_domain_usingDiffProvider_completion___block_invoke;
  block[3] = &unk_1E91E5E88;
  v20 = v12;
  v21 = a4;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_sync(internalQueue, block);

}

void __107__STStatusDomainPublisherXPCServerHandle_updateDataForPublisherClient_domain_usingDiffProvider_completion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[4];
  v3 = *(_QWORD *)(a1 + 64);
  v4 = v2;
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v6)
  {
    -[STStatusDomainPublisherXPCServerHandle _internalQueue_dataForDomain:usingFallbackIfNecessary:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
      -[STStatusDomainPublisherXPCServerHandle _internalQueue_setupXPCConnectionIfNecessary](*(_QWORD *)(a1 + 32));
      -[STStatusDomainPublisherXPCServerHandle _internalQueue_publishDiff:forDomain:withChangeContext:discardingOnExit:completion:](*(_QWORD *)(a1 + 32), v8, *(_QWORD *)(a1 + 64), v9, 0, *(void **)(a1 + 56));

    }
    else
    {
      v11 = *(_QWORD *)(a1 + 56);
      if (v11)
        (*(void (**)(void))(v11 + 16))();
    }

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 56);
    if (v10)
      (*(void (**)(void))(v10 + 16))();
  }
}

- (void)handleUserInteraction:(id)a3 forDomain:(unint64_t)a4
{
  id v6;
  NSObject *internalQueue;
  _QWORD block[5];
  id v9;
  unint64_t v10;

  v6 = a3;
  if (STIsValidUserInteractionForStatusDomain(v6))
  {
    if (self)
      internalQueue = self->_internalQueue;
    else
      internalQueue = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__STStatusDomainPublisherXPCServerHandle_handleUserInteraction_forDomain___block_invoke;
    block[3] = &unk_1E91E4F20;
    block[4] = self;
    v10 = a4;
    v9 = v6;
    dispatch_async(internalQueue, block);

  }
}

void __74__STStatusDomainPublisherXPCServerHandle_handleUserInteraction_forDomain___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 32);
  else
    v3 = 0;
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(NSObject **)(v6 + 48);
  else
    v7 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__STStatusDomainPublisherXPCServerHandle_handleUserInteraction_forDomain___block_invoke_2;
  block[3] = &unk_1E91E4F20;
  v12 = v5;
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v13 = v8;
  v14 = v9;
  v10 = v5;
  dispatch_async(v7, block);

}

void __74__STStatusDomainPublisherXPCServerHandle_handleUserInteraction_forDomain___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "handleUserInteraction:forDomain:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)didObserveServerLaunch:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *internalQueue;
  NSObject *v9;
  _QWORD v10[6];

  STSystemStatusLogPublishing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10[0]) = 0;
    _os_log_impl(&dword_1D12C7000, v4, OS_LOG_TYPE_DEFAULT, "Server launched, resending data if necessary", (uint8_t *)v10, 2u);
  }

  if (self)
  {
    objc_msgSend(MEMORY[0x1E0D016E0], "tokenForCurrentProcess");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.systemstatus.publisher.domains"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

LABEL_8:
      internalQueue = self->_internalQueue;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke;
      v10[3] = &unk_1E91E4E40;
      v10[4] = self;
      dispatch_async(internalQueue, v10);
      return;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "count");

      if (v7)
        goto LABEL_8;
    }
    else
    {

    }
    STSystemStatusLogPublishing();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_fault_impl(&dword_1D12C7000, v9, OS_LOG_TYPE_FAULT, "Server connection rejected due to missing entitlement", (uint8_t *)v10, 2u);
    }

  }
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STStatusDomainPublisherXPCServerHandle succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __80__STStatusDomainPublisherXPCServerHandle_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "currentDataForDomain:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  STSystemStatusDescriptionForDomain(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v7, v5);

}

void __125__STStatusDomainPublisherXPCServerHandle__internalQueue_publishData_forDomain_withChangeContext_discardingOnExit_completion___block_invoke(uint64_t a1)
{
  NSObject *isa;

  isa = *(NSObject **)(a1 + 32);
  if (isa)
    isa = isa[6].isa;
  dispatch_async(isa, *(dispatch_block_t *)(a1 + 40));
}

void __125__STStatusDomainPublisherXPCServerHandle__internalQueue_publishData_forDomain_withChangeContext_discardingOnExit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(void);

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setData:forClientKey:domain:", *(_QWORD *)(a1 + 40), CFSTR("sharedClient"), *(_QWORD *)(a1 + 72));
  if (*(_BYTE *)(a1 + 80) || *(_BYTE *)(a1 + 81))
  {
    -[STStatusDomainPublisherXPCServerHandle _internalQueue_publishDataToServer:forDomain:withChangeContext:discardingOnExit:reply:](*(_QWORD *)(a1 + 48), *(void **)(a1 + 40), *(_QWORD *)(a1 + 72), *(void **)(a1 + 56), *(unsigned __int8 *)(a1 + 82), v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "diffFromData:", *(_QWORD *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEmpty") & 1) != 0)
    {
      if (v4)
        v4[2]();
    }
    else
    {
      -[STStatusDomainPublisherXPCServerHandle _internalQueue_publishDiffToServer:forDomain:withChangeContext:replacingData:discardingOnExit:reply:](*(_QWORD *)(a1 + 48), v3, *(_QWORD *)(a1 + 72), *(void **)(a1 + 56), 1, *(unsigned __int8 *)(a1 + 82), v4);
    }

  }
}

- (void)_internalQueue_publishDataToServer:(uint64_t)a3 forDomain:(void *)a4 withChangeContext:(uint64_t)a5 discardingOnExit:(void *)a6 reply:
{
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a6;
  if (a1)
  {
    v11 = *(NSObject **)(a1 + 40);
    v12 = a4;
    v13 = a2;
    dispatch_assert_queue_V2(v11);
    v14 = v16;
    if (!v16)
      v14 = &__block_literal_global_31;
    v16 = v14;
    objc_msgSend(*(id *)(a1 + 56), "remoteObjectProxy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "publishData:forDomain:withChangeContext:discardingOnExit:reply:", v13, a3, v12, a5, v16);

  }
}

void __86__STStatusDomainPublisherXPCServerHandle__internalQueue_setupXPCConnectionIfNecessary__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  STSystemStatusLogPublishing();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D12C7000, v0, OS_LOG_TYPE_DEFAULT, "Server connection interrupted", v1, 2u);
  }

}

void __86__STStatusDomainPublisherXPCServerHandle__internalQueue_setupXPCConnectionIfNecessary__block_invoke_37(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  STSystemStatusLogPublishing();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D12C7000, v2, OS_LOG_TYPE_DEFAULT, "Server connection invalidated", v3, 2u);
  }

  -[STStatusDomainPublisherXPCServerHandle _tearDownXPCConnection]((uint64_t)WeakRetained);
}

void __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id location;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  if (v2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 40));
    -[STStatusDomainPublisherXPCServerHandle _internalQueue_setupXPCConnectionIfNecessary](v2);
    v4 = *(id *)(v2 + 32);
    v5 = *(id *)(v2 + 8);
    objc_msgSend(v5, "recordForKey:", CFSTR("volatileData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "count"))
    {
      objc_initWeak(&location, (id)v2);
      v7 = *(id *)(v2 + 56);
      v32[0] = v3;
      v32[1] = 3221225472;
      v32[2] = __87__STStatusDomainPublisherXPCServerHandle__internalQueue_reregisterForPublishingDomains__block_invoke;
      v32[3] = &unk_1E91E4EF8;
      objc_copyWeak(&v33, &location);
      objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v32);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "allKeys");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v3;
      v29[1] = 3221225472;
      v29[2] = __87__STStatusDomainPublisherXPCServerHandle__internalQueue_reregisterForPublishingDomains__block_invoke_40;
      v29[3] = &unk_1E91E5EB0;
      v30 = v6;
      v10 = v8;
      v31 = v10;
      objc_msgSend(v9, "enumerateWithBlock:", v29);

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
    }

    v11 = *(_QWORD **)(a1 + 32);
    if (v11)
      v11 = (_QWORD *)v11[1];
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;
  v13 = *(_QWORD **)(a1 + 32);
  if (v13)
    v13 = (_QWORD *)v13[2];
  v14 = v13;
  objc_msgSend(v12, "recordForKey:", CFSTR("data"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v3;
  v26[1] = 3221225472;
  v26[2] = __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke_2;
  v26[3] = &unk_1E91E5FC0;
  v16 = v14;
  v17 = *(_QWORD *)(a1 + 32);
  v27 = v16;
  v28 = v17;
  objc_msgSend(v15, "enumerateEntriesByDomainUsingBlock:", v26);

  v18 = *(_QWORD **)(a1 + 32);
  if (v18)
    v18 = (_QWORD *)v18[3];
  v19 = v18;
  objc_msgSend(v12, "recordForKey:", CFSTR("volatileData"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v3;
  v23[1] = 3221225472;
  v23[2] = __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke_5;
  v23[3] = &unk_1E91E5FC0;
  v21 = *(_QWORD *)(a1 + 32);
  v24 = v19;
  v25 = v21;
  v22 = v19;
  objc_msgSend(v20, "enumerateEntriesByDomainUsingBlock:", v23);

}

void __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t v23;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  v8 = objc_msgSend(v5, "count");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke_3;
  v19[3] = &unk_1E91E5F98;
  v19[4] = *(_QWORD *)(a1 + 40);
  v18 = v6;
  v20 = v18;
  v17 = v7;
  v21 = v17;
  v22 = *(id *)(a1 + 32);
  v23 = a2;
  v9 = (void *)MEMORY[0x1D17E6508](v19);
  if (v8)
  {
    -[STStatusDomainPublisherXPCServerHandle _internalQueue_publishDataToServer:forDomain:withChangeContext:discardingOnExit:reply:](*(_QWORD *)(a1 + 40), 0, a2, 0, 0, 0);
    for (i = 0; i != v8; ++i)
    {
      if (v8 - 1 == i)
        v11 = v9;
      else
        v11 = 0;
      v12 = (void *)MEMORY[0x1D17E6508](v11);
      objc_msgSend(v5, "objectAtIndex:", i, v17, v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "entryType");
      v15 = *(_QWORD *)(a1 + 40);
      if (v14)
      {
        objc_msgSend(v13, "diff");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[STStatusDomainPublisherXPCServerHandle _internalQueue_publishDiffToServer:forDomain:withChangeContext:replacingData:discardingOnExit:reply:](v15, v16, a2, 0, 0, 0, v12);
      }
      else
      {
        objc_msgSend(v13, "data");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[STStatusDomainPublisherXPCServerHandle _internalQueue_publishDataToServer:forDomain:withChangeContext:discardingOnExit:reply:](v15, v16, a2, 0, 0, v12);
      }

    }
  }

}

void __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(NSObject **)(v2 + 40);
  else
    v3 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke_4;
  v6[3] = &unk_1E91E4F48;
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v9 = v4;
  v10 = v5;
  dispatch_async(v3, v6);

}

void __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "minusOrderedSet:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(*(id *)(a1 + 32), "count"))
    objc_msgSend(*(id *)(a1 + 48), "removeObjectForKey:", *(_QWORD *)(a1 + 56));
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t v23;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  v8 = objc_msgSend(v5, "count");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke_6;
  v19[3] = &unk_1E91E5F98;
  v19[4] = *(_QWORD *)(a1 + 40);
  v18 = v6;
  v20 = v18;
  v17 = v7;
  v21 = v17;
  v22 = *(id *)(a1 + 32);
  v23 = a2;
  v9 = (void *)MEMORY[0x1D17E6508](v19);
  if (v8)
  {
    -[STStatusDomainPublisherXPCServerHandle _internalQueue_publishDataToServer:forDomain:withChangeContext:discardingOnExit:reply:](*(_QWORD *)(a1 + 40), 0, a2, 0, 1, 0);
    for (i = 0; i != v8; ++i)
    {
      if (v8 - 1 == i)
        v11 = v9;
      else
        v11 = 0;
      v12 = (void *)MEMORY[0x1D17E6508](v11);
      objc_msgSend(v5, "objectAtIndex:", i, v17, v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "entryType");
      v15 = *(_QWORD *)(a1 + 40);
      if (v14)
      {
        objc_msgSend(v13, "diff");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[STStatusDomainPublisherXPCServerHandle _internalQueue_publishDiffToServer:forDomain:withChangeContext:replacingData:discardingOnExit:reply:](v15, v16, a2, 0, 0, 1, v12);
      }
      else
      {
        objc_msgSend(v13, "data");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[STStatusDomainPublisherXPCServerHandle _internalQueue_publishDataToServer:forDomain:withChangeContext:discardingOnExit:reply:](v15, v16, a2, 0, 1, v12);
      }

    }
  }

}

void __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(NSObject **)(v2 + 40);
  else
    v3 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke_7;
  v6[3] = &unk_1E91E4F48;
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v9 = v4;
  v10 = v5;
  dispatch_async(v3, v6);

}

void __64__STStatusDomainPublisherXPCServerHandle__resendDataIfNecessary__block_invoke_7(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "minusOrderedSet:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(*(id *)(a1 + 32), "count"))
    objc_msgSend(*(id *)(a1 + 48), "removeObjectForKey:", *(_QWORD *)(a1 + 56));
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __87__STStatusDomainPublisherXPCServerHandle__internalQueue_reregisterForPublishingDomains__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  STSystemStatusLogPublishing();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1D12C7000, v5, OS_LOG_TYPE_DEFAULT, "Failed to get server proxy in _internalQueue_reregisterForPublishingDomains -- error: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  -[STStatusDomainPublisherXPCServerHandle _tearDownXPCConnection]((uint64_t)WeakRetained);

}

void __87__STStatusDomainPublisherXPCServerHandle__internalQueue_reregisterForPublishingDomains__block_invoke_40(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "fallbackDataForClientKey:domain:", CFSTR("sharedClient"), a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "registerToPublishDomain:fallbackData:", a2, v4);

}

void __64__STStatusDomainPublisherXPCServerHandle__tearDownXPCConnection__block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    objc_storeStrong((id *)(v1 + 56), 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverLaunchObservable, 0);
  objc_storeStrong(&self->_xpcConnectionProvider, 0);
  objc_storeStrong((id *)&self->_serverXPCConnection, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_publisherClientsByDomain, 0);
  objc_storeStrong((id *)&self->_volatileDataMutationCompletionsByDomain, 0);
  objc_storeStrong((id *)&self->_dataMutationCompletionsByDomain, 0);
  objc_storeStrong((id *)&self->_dataChangeLog, 0);
}

@end
