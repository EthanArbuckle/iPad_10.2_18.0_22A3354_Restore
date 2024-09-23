@implementation WFIntentDynamicResolver

- (WFIntentDynamicResolver)initWithIntentKeyPathToResolve:(id)a3 dataSource:(id)a4
{
  id v7;
  id v8;
  WFIntentDynamicResolver *v9;
  WFIntentDynamicResolver *v10;
  WFIntentDynamicResolver *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFIntentDynamicResolver;
  v9 = -[WFIntentDynamicResolver init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_intentKeyPathToResolve, a3);
    objc_storeWeak((id *)&v10->_dataSource, v8);
    v11 = v10;
  }

  return v10;
}

- (void)beginSessionWithCompletionBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  _QWORD v5[5];
  void (**v6)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  if (-[WFIntentDynamicResolver state](self, "state") == 1)
  {
    v4[2](v4, 0);
  }
  else
  {
    -[WFIntentDynamicResolver endSession](self, "endSession");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __59__WFIntentDynamicResolver_beginSessionWithCompletionBlock___block_invoke;
    v5[3] = &unk_1E7AEE830;
    v5[4] = self;
    v6 = v4;
    -[WFIntentDynamicResolver populatedSkeletonIntentWithUserInput:forKeyPath:completionBlock:](self, "populatedSkeletonIntentWithUserInput:forKeyPath:completionBlock:", 0, 0, v5);

  }
}

- (void)endSession
{
  void *v3;
  INCExtensionConnection *extensionConnection;
  INCExtensionProxy *extensionProxy;

  -[WFIntentDynamicResolver extensionConnection](self, "extensionConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reset");

  extensionConnection = self->_extensionConnection;
  self->_extensionConnection = 0;

  extensionProxy = self->_extensionProxy;
  self->_extensionProxy = 0;

  self->_state = 0;
}

- (id)resolveWithUserInput:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  WFIntentDynamicResolver *v24;
  id v25;
  void *v26;
  _QWORD aBlock[4];
  id v28;
  WFIntentDynamicResolver *v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[WFIntentDynamicResolver state](self, "state") == 1)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setResolutionBlock:", v7);
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__WFIntentDynamicResolver_resolveWithUserInput_completionBlock___block_invoke;
    aBlock[3] = &unk_1E7AEE858;
    v10 = v8;
    v28 = v10;
    v11 = v7;
    v29 = self;
    v30 = v11;
    v12 = _Block_copy(aBlock);
    -[WFIntentDynamicResolver intentKeyPathToResolve](self, "intentKeyPathToResolve");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v9;
    v21 = 3221225472;
    v22 = __64__WFIntentDynamicResolver_resolveWithUserInput_completionBlock___block_invoke_2;
    v23 = &unk_1E7AEE8A8;
    v24 = self;
    v25 = v11;
    v26 = v12;
    v14 = v12;
    -[WFIntentDynamicResolver populatedSkeletonIntentWithUserInput:forKeyPath:completionBlock:](self, "populatedSkeletonIntentWithUserInput:forKeyPath:completionBlock:", v6, v13, &v20);

    -[WFIntentDynamicResolver activeRequests](self, "activeRequests", v20, v21, v22, v23, v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v10);

    v16 = v26;
    v17 = v10;

  }
  else
  {
    getWFIntentExecutionLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[WFIntentDynamicResolver resolveWithUserInput:completionBlock:]";
      _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_ERROR, "%s Currently not in a resolution session.", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD, uint64_t, _QWORD, _QWORD))v7 + 2))(v7, 0, 1, 0, 0);
    v17 = 0;
  }

  return v17;
}

- (id)intent
{
  return (id)-[INCExtensionConnection intent](self->_extensionConnection, "intent");
}

- (void)populatedSkeletonIntentWithUserInput:(id)a3 forKeyPath:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFIntentDynamicResolver dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

LABEL_4:
    -[WFIntentDynamicResolver dataSource](self, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __91__WFIntentDynamicResolver_populatedSkeletonIntentWithUserInput_forKeyPath_completionBlock___block_invoke;
    v16[3] = &unk_1E7AEE8D0;
    v19 = v10;
    v17 = v8;
    v18 = v9;
    objc_msgSend(v14, "generateSkeletonIntentForDynamicResolver:withCompletionBlock:", self, v16);

    goto LABEL_5;
  }
  -[WFIntentDynamicResolver dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
    goto LABEL_4;
  getWFIntentExecutionLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[WFIntentDynamicResolver populatedSkeletonIntentWithUserInput:forKeyPath:completionBlock:]";
    _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_FAULT, "%s Trying to populate skeleton intent, but there's no data source.", buf, 0xCu);
  }

  (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
LABEL_5:

}

- (void)failWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_state = 2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[WFIntentDynamicResolver activeRequests](self, "activeRequests", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isCancelled") & 1) == 0)
        {
          objc_msgSend(v10, "resolutionBlock");
          v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, _QWORD, uint64_t, _QWORD, id))v11)[2](v11, 0, 1, 0, v4);

        }
        objc_msgSend(v10, "cancel");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_opt_new();
  -[WFIntentDynamicResolver setActiveRequests:](self, "setActiveRequests:", v12);

}

- (NSString)intentKeyPathToResolve
{
  return self->_intentKeyPathToResolve;
}

- (unint64_t)state
{
  return self->_state;
}

- (WFIntentDynamicResolverDataSource)dataSource
{
  return (WFIntentDynamicResolverDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (INCExtensionConnection)extensionConnection
{
  return self->_extensionConnection;
}

- (INCExtensionProxy)extensionProxy
{
  return self->_extensionProxy;
}

- (NSMutableSet)activeRequests
{
  return self->_activeRequests;
}

- (void)setActiveRequests:(id)a3
{
  objc_storeStrong((id *)&self->_activeRequests, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeRequests, 0);
  objc_storeStrong((id *)&self->_extensionProxy, 0);
  objc_storeStrong((id *)&self->_extensionConnection, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_intentKeyPathToResolve, 0);
}

void __91__WFIntentDynamicResolver_populatedSkeletonIntentWithUserInput_forKeyPath_completionBlock___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void (*v6)(void);
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = *(void (**)(void))(a1[6] + 16);
  }
  else
  {
    if (a1[4] && a1[5])
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA08]), "initWithIdentifier:displayString:", 0, a1[4]);
      objc_msgSend(v8, "setValue:forKeyPath:", v7, a1[5]);

    }
    v6 = *(void (**)(void))(a1[6] + 16);
  }
  v6();

}

void __64__WFIntentDynamicResolver_resolveWithUserInput_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "activeRequests");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", *(_QWORD *)(a1 + 32));

}

void __64__WFIntentDynamicResolver_resolveWithUserInput_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "extensionConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIntent:", v5);

    v8 = (void *)objc_msgSend(v5, "copy");
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "extensionProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "intentKeyPathToResolve");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__WFIntentDynamicResolver_resolveWithUserInput_completionBlock___block_invoke_3;
    v13[3] = &unk_1E7AEE880;
    objc_copyWeak(&v16, &location);
    v15 = *(id *)(a1 + 48);
    v12 = v8;
    v14 = v12;
    objc_msgSend(v9, "resolveIntentSlotKeyPaths:completionHandler:", v11, v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
}

void __64__WFIntentDynamicResolver_resolveWithUserInput_completionBlock___block_invoke_3(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  id v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "intentKeyPathToResolve");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a2)
  {
    objc_msgSend(WeakRetained, "intent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_intentInstanceDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "intentKeyPathToResolve");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "slotByName:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)objc_msgSend(v20, "resolutionResultClass");
    objc_msgSend(v11, "data");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_resolutionResultWithData:slotDescription:", v22, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      getWFIntentExecutionLogObject();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v37 = "-[WFIntentDynamicResolver resolveWithUserInput:completionBlock:]_block_invoke_3";
        _os_log_impl(&dword_1C15B3000, v24, OS_LOG_TYPE_FAULT, "%s Parameter resolution is not implemented for array parameters. See rdar://51679504", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_23;
    }
    v25 = objc_opt_class();
    v26 = v23;
    if (v26 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      getWFGeneralLogObject();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315906;
        v37 = "WFEnforceClass";
        v38 = 2114;
        v39 = v26;
        v40 = 2114;
        v41 = (id)objc_opt_class();
        v42 = 2114;
        v43 = v25;
        v29 = v41;
        _os_log_impl(&dword_1C15B3000, v28, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

      }
      v27 = 0;
    }
    else
    {
      v27 = v26;
    }

    v30 = objc_msgSend(v27, "resolutionResultCode");
    if (v30 == 3)
    {
      v33 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v27, "itemToConfirm");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, uint64_t, _QWORD, _QWORD))(v33 + 16))(v33, v34, 3, *(_QWORD *)(a1 + 32), 0);

    }
    else
    {
      if (v30 != 2)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        goto LABEL_22;
      }
      v31 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v27, "disambiguationItems");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, uint64_t, _QWORD, _QWORD))(v31 + 16))(v31, v32, 2, *(_QWORD *)(a1 + 32), 0);
    }

LABEL_22:
LABEL_23:

    goto LABEL_24;
  }
  if (objc_msgSend(v11, "result") == 7)
    v12 = 7;
  else
    v12 = 0;
  objc_msgSend(WeakRetained, "intentKeyPathToResolve");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKeyPath:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v14, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t, _QWORD, _QWORD))(v15 + 16))(v15, v16, v12, *(_QWORD *)(a1 + 32), 0);

LABEL_24:
}

void __59__WFIntentDynamicResolver_beginSessionWithCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D3E530]), "initWithIntent:supportedExtensionTypes:donateInteraction:groupIdentifier:remoteProxyProvider:", v5, 7, 0, 0, 0);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 32);
  *(_QWORD *)(v8 + 32) = v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setRequiresTCC:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setRequestTimeoutInterval:", 30.0);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __59__WFIntentDynamicResolver_beginSessionWithCompletionBlock___block_invoke_2;
  v17[3] = &unk_1E7AF15E0;
  objc_copyWeak(&v18, &location);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setTimeoutHandler:", v17);
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __59__WFIntentDynamicResolver_beginSessionWithCompletionBlock___block_invoke_3;
  v15[3] = &unk_1E7AF15E0;
  objc_copyWeak(&v16, &location);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setInterruptionHandler:", v15);
  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __59__WFIntentDynamicResolver_beginSessionWithCompletionBlock___block_invoke_4;
  v12[3] = &unk_1E7AEE808;
  objc_copyWeak(&v14, &location);
  v13 = *(id *)(a1 + 40);
  objc_msgSend(v11, "resumeWithCompletionHandler:", v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __59__WFIntentDynamicResolver_beginSessionWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[2];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = *MEMORY[0x1E0CB3388];
  if (v3)
  {
    v15 = *MEMORY[0x1E0CB3388];
    v16[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D3E518], 1307, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB35C8];
  v14[0] = v7;
  v9 = *MEMORY[0x1E0CB2D50];
  v13[0] = v5;
  v13[1] = v9;
  WFLocalizedString(CFSTR("Cannot Communicate With App"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("WFIntentDynamicResolverErrorDomain"), 100, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "failWithError:", v12);
}

void __59__WFIntentDynamicResolver_beginSessionWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[2];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = *MEMORY[0x1E0CB3388];
  if (v3)
  {
    v15 = *MEMORY[0x1E0CB3388];
    v16[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D3E518], 1301, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB35C8];
  v14[0] = v7;
  v9 = *MEMORY[0x1E0CB2D50];
  v13[0] = v5;
  v13[1] = v9;
  WFLocalizedString(CFSTR("Cannot Communicate With App"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("WFIntentDynamicResolverErrorDomain"), 100, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "failWithError:", v12);
}

void __59__WFIntentDynamicResolver_beginSessionWithCompletionBlock___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id *WeakRetained;
  id *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (v7)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB3388];
    v17[0] = v7;
    v12 = *MEMORY[0x1E0CB2D50];
    v16[0] = v11;
    v16[1] = v12;
    WFLocalizedString(CFSTR("Cannot Communicate With App"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("WFIntentDynamicResolverErrorDomain"), 100, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    WeakRetained[2] = (id)1;
    objc_storeStrong(WeakRetained + 5, a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v15 = 0;
  }

}

@end
