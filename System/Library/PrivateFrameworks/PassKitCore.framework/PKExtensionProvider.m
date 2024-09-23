@implementation PKExtensionProvider

+ (id)providerForExtensionPoint:(id)a3
{
  id v3;
  PKExtensionProvider *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_257);
  objc_msgSend((id)qword_1ECF22990, "objectForKey:", v3);
  v4 = (PKExtensionProvider *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = -[PKExtensionProvider initWithExtensionPoint:]([PKExtensionProvider alloc], "initWithExtensionPoint:", v3);
    v5 = (void *)qword_1ECF22990;
    if (!qword_1ECF22990)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v7 = (void *)qword_1ECF22990;
      qword_1ECF22990 = (uint64_t)v6;

      v5 = (void *)qword_1ECF22990;
    }
    objc_msgSend(v5, "setObject:forKey:", v4, v3);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_257);

  return v4;
}

- (PKExtensionProvider)init
{

  return 0;
}

- (PKExtensionProvider)initWithExtensionPoint:(id)a3
{
  id v5;
  PKExtensionProvider *v6;
  PKExtensionProvider *v7;
  NSDictionary *v8;
  NSDictionary *passKitExtensions;
  NSMutableArray *v10;
  NSMutableArray *beginMatchingCompletions;
  dispatch_queue_t v12;
  OS_dispatch_queue *extensionQueue;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKExtensionProvider;
  v6 = -[PKExtensionProvider init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extensionPoint, a3);
    v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    passKitExtensions = v7->_passKitExtensions;
    v7->_passKitExtensions = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    beginMatchingCompletions = v7->_beginMatchingCompletions;
    v7->_beginMatchingCompletions = v10;

    v12 = dispatch_queue_create("com.apple.PassKit.extension-queue", 0);
    extensionQueue = v7->_extensionQueue;
    v7->_extensionQueue = (OS_dispatch_queue *)v12;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[PKExtensionProvider _endMatchingExtensions](self, "_endMatchingExtensions");
  v3.receiver = self;
  v3.super_class = (Class)PKExtensionProvider;
  -[PKExtensionProvider dealloc](&v3, sel_dealloc);
}

- (void)extensionWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *extensionQueue;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  _QWORD aBlock[4];
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    PKLogFacilityTypeGetObject(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Getting extension with bundle identifier: %@", buf, 0xCu);
    }

    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__PKExtensionProvider_extensionWithBundleIdentifier_completion___block_invoke;
    aBlock[3] = &unk_1E2AD5678;
    v10 = v6;
    v18 = v10;
    v19 = v7;
    v11 = _Block_copy(aBlock);
    extensionQueue = self->_extensionQueue;
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __64__PKExtensionProvider_extensionWithBundleIdentifier_completion___block_invoke_24;
    block[3] = &unk_1E2ABE030;
    block[4] = self;
    v15 = v10;
    v16 = v11;
    v13 = v11;
    dispatch_async(extensionQueue, block);

  }
}

void __64__PKExtensionProvider_extensionWithBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PKLogFacilityTypeGetObject(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412802;
    v10 = v8;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Finished getting extension with bundle identifier: %@, matched extension: %@, error: %@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __64__PKExtensionProvider_extensionWithBundleIdentifier_completion___block_invoke_24(id *a1)
{
  id v2;
  _QWORD v3[4];
  id v4;
  id v5;
  uint64_t *v6;
  id v7;
  id location;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__56;
  v13 = __Block_byref_object_dispose__56;
  objc_msgSend(*((id *)a1[4] + 3), "objectForKey:", a1[5]);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v10[5])
  {
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    objc_initWeak(&location, a1[4]);
    v2 = a1[4];
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __64__PKExtensionProvider_extensionWithBundleIdentifier_completion___block_invoke_25;
    v3[3] = &unk_1E2AD56A0;
    objc_copyWeak(&v7, &location);
    v5 = a1[6];
    v6 = &v9;
    v4 = a1[5];
    objc_msgSend(v2, "_beginMatchingExtensionsWithCompletion:", v3);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(&v9, 8);

}

void __64__PKExtensionProvider_extensionWithBundleIdentifier_completion___block_invoke_25(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void (*v9)(void);
  id v10;

  v10 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (uint64_t)v10;
    if (!v10)
    {
      objc_msgSend(WeakRetained[3], "objectForKey:", *(_QWORD *)(a1 + 32));
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
        v5 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1001, 0);
        v5 = objc_claimAutoreleasedReturnValue();
      }
    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    v10 = (id)v5;
  }
  else
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v9();

}

- (void)extensionsWithContainingApplicationIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *extensionQueue;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  _QWORD aBlock[4];
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    PKLogFacilityTypeGetObject(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Getting extensions with containing application identifiers: %@", buf, 0xCu);
    }

    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__PKExtensionProvider_extensionsWithContainingApplicationIdentifiers_completion___block_invoke;
    aBlock[3] = &unk_1E2ABE710;
    v10 = v6;
    v18 = v10;
    v19 = v7;
    v11 = _Block_copy(aBlock);
    extensionQueue = self->_extensionQueue;
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __81__PKExtensionProvider_extensionsWithContainingApplicationIdentifiers_completion___block_invoke_30;
    block[3] = &unk_1E2ABE030;
    block[4] = self;
    v15 = v10;
    v16 = v11;
    v13 = v11;
    dispatch_async(extensionQueue, block);

  }
}

void __81__PKExtensionProvider_extensionsWithContainingApplicationIdentifiers_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PKLogFacilityTypeGetObject(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412802;
    v10 = v8;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Finished getting extensions with containing application identifiers: %@, matched extensions: %@, error: %@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __81__PKExtensionProvider_extensionsWithContainingApplicationIdentifiers_completion___block_invoke_30(id *a1)
{
  id v2;
  _QWORD v3[4];
  id v4;
  id v5;
  uint64_t *v6;
  id v7;
  id location;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__56;
  v13 = __Block_byref_object_dispose__56;
  objc_msgSend(a1[4], "_extensionsForContainingApplicationIdentifiers:", a1[5]);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)v10[5], "count"))
  {
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    objc_initWeak(&location, a1[4]);
    v2 = a1[4];
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __81__PKExtensionProvider_extensionsWithContainingApplicationIdentifiers_completion___block_invoke_2;
    v3[3] = &unk_1E2AD56A0;
    objc_copyWeak(&v7, &location);
    v5 = a1[6];
    v6 = &v9;
    v4 = a1[5];
    objc_msgSend(v2, "_beginMatchingExtensionsWithCompletion:", v3);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(&v9, 8);

}

void __81__PKExtensionProvider_extensionsWithContainingApplicationIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void (*v9)(void);
  id v10;

  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (uint64_t)v10;
    if (!v10)
    {
      objc_msgSend(WeakRetained, "_extensionsForContainingApplicationIdentifiers:", *(_QWORD *)(a1 + 32));
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
      {
        v5 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1001, 0);
        v5 = objc_claimAutoreleasedReturnValue();
      }
    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    v10 = (id)v5;
  }
  else
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v9();

}

- (void)beginExtensionRequestWithExtension:(id)a3 inputItems:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "extension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __80__PKExtensionProvider_beginExtensionRequestWithExtension_inputItems_completion___block_invoke;
    v12[3] = &unk_1E2ACB380;
    v14 = v9;
    v13 = v7;
    objc_msgSend(v10, "beginExtensionRequestWithInputItems:completion:", v8, v12);

  }
  else if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1001, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, _QWORD, void *))v9 + 2))(v9, v7, 0, v11);

  }
}

uint64_t __80__PKExtensionProvider_beginExtensionRequestWithExtension_inputItems_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(result + 16))(result, *(_QWORD *)(a1 + 32), a2, a3);
  return result;
}

- (void)_finishedMatchingExtensions:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *extensionMatchTimer;
  OS_dispatch_source *v9;
  void *v10;
  NSDictionary *v11;
  NSDictionary *passKitExtensions;
  BOOL v13;
  int v14;
  NSDictionary *v15;
  NSDictionary *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  PKExtensionProvider *v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  self->_isBeginningMatching = 0;
  extensionMatchTimer = self->_extensionMatchTimer;
  if (extensionMatchTimer)
  {
    dispatch_source_cancel(extensionMatchTimer);
    v9 = self->_extensionMatchTimer;
    self->_extensionMatchTimer = 0;

  }
  if (v7)
  {
    -[PKExtensionProvider _invokeAndClearBeginMatchingCompletionsWithError:](self, "_invokeAndClearBeginMatchingCompletionsWithError:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __61__PKExtensionProvider__finishedMatchingExtensions_withError___block_invoke;
    v20[3] = &unk_1E2AD56C8;
    v21 = v10;
    v22 = self;
    v11 = v10;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v20);
    passKitExtensions = self->_passKitExtensions;
    if (v11)
      v13 = passKitExtensions == 0;
    else
      v13 = 1;
    if (v13)
      v14 = passKitExtensions == v11;
    else
      v14 = -[NSDictionary isEqual:](passKitExtensions, "isEqual:", v11);
    v15 = (NSDictionary *)-[NSDictionary copy](v11, "copy");
    v16 = self->_passKitExtensions;
    self->_passKitExtensions = v15;

    -[PKExtensionProvider _invokeAndClearBeginMatchingCompletionsWithError:](self, "_invokeAndClearBeginMatchingCompletionsWithError:", 0);
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("PKExtensionAvailableExtensions");
      -[NSDictionary allValues](self->_passKitExtensions, "allValues");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("PKExtensionAvailableExtensionsChangedNotification"), 0, v19);

    }
  }

}

void __61__PKExtensionProvider__finishedMatchingExtensions_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  PKExtension *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = -[PKExtension initWithIdentifier:extension:provider:]([PKExtension alloc], "initWithIdentifier:extension:provider:", v6, v3, *(_QWORD *)(a1 + 40));

  objc_msgSend(v4, "setObject:forKey:", v5, v6);
}

- (void)_beginMatchingExtensionsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *beginMatchingCompletions;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id matchingContext;
  OS_dispatch_source *v14;
  OS_dispatch_source *extensionMatchTimer;
  NSObject *v16;
  dispatch_time_t v17;
  NSObject *v18;
  _QWORD handler[5];
  _QWORD v20[4];
  id v21;
  id location;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    beginMatchingCompletions = self->_beginMatchingCompletions;
    v7 = _Block_copy(v4);
    -[NSMutableArray addObject:](beginMatchingCompletions, "addObject:", v7);

  }
  if (self->_matchingContext)
  {
    if (!self->_isBeginningMatching)
      -[PKExtensionProvider _invokeAndClearBeginMatchingCompletionsWithError:](self, "_invokeAndClearBeginMatchingCompletionsWithError:", 0);
  }
  else
  {
    self->_isBeginningMatching = 1;
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v8, "setObject:forKey:", self->_extensionPoint, *MEMORY[0x1E0CB2A28]);
    -[PKExtensionProvider _extensionMatchingEntitlementAttribute](self, "_extensionMatchingEntitlementAttribute");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v9);
    objc_initWeak(&location, self);
    v10 = (void *)MEMORY[0x1E0CB35D8];
    v11 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __62__PKExtensionProvider__beginMatchingExtensionsWithCompletion___block_invoke;
    v20[3] = &unk_1E2AC2E90;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v10, "beginMatchingExtensionsWithAttributes:completion:", v8, v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    matchingContext = self->_matchingContext;
    self->_matchingContext = v12;

    if (self->_matchingContext)
    {
      v14 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_extensionQueue);
      extensionMatchTimer = self->_extensionMatchTimer;
      self->_extensionMatchTimer = v14;

      v16 = self->_extensionMatchTimer;
      v17 = dispatch_time(0, 3000000000);
      dispatch_source_set_timer(v16, v17, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      v18 = self->_extensionMatchTimer;
      handler[0] = v11;
      handler[1] = 3221225472;
      handler[2] = __62__PKExtensionProvider__beginMatchingExtensionsWithCompletion___block_invoke_3;
      handler[3] = &unk_1E2ABE120;
      handler[4] = self;
      dispatch_source_set_event_handler(v18, handler);
      dispatch_resume((dispatch_object_t)self->_extensionMatchTimer);
    }
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
}

void __62__PKExtensionProvider__beginMatchingExtensionsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[7];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__PKExtensionProvider__beginMatchingExtensionsWithCompletion___block_invoke_2;
    block[3] = &unk_1E2ABE0F8;
    block[4] = WeakRetained;
    v11 = v5;
    v12 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __62__PKExtensionProvider__beginMatchingExtensionsWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishedMatchingExtensions:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __62__PKExtensionProvider__beginMatchingExtensionsWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB2938];
  v6[0] = CFSTR("Extension matching timed out");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1001, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_finishedMatchingExtensions:withError:", 0, v4);

}

- (void)_endMatchingExtensions
{
  id matchingContext;
  NSObject *extensionMatchTimer;
  OS_dispatch_source *v5;

  if (self->_matchingContext)
  {
    objc_msgSend(MEMORY[0x1E0CB35D8], "endMatchingExtensions:");
    matchingContext = self->_matchingContext;
    self->_matchingContext = 0;

  }
  extensionMatchTimer = self->_extensionMatchTimer;
  if (extensionMatchTimer)
  {
    dispatch_source_cancel(extensionMatchTimer);
    v5 = self->_extensionMatchTimer;
    self->_extensionMatchTimer = 0;

  }
}

- (void)_invokeAndClearBeginMatchingCompletionsWithError:(id)a3
{
  id v4;
  NSMutableArray *beginMatchingCompletions;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  beginMatchingCompletions = self->_beginMatchingCompletions;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__PKExtensionProvider__invokeAndClearBeginMatchingCompletionsWithError___block_invoke;
  v7[3] = &unk_1E2AD56F0;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](beginMatchingCompletions, "enumerateObjectsUsingBlock:", v7);
  -[NSMutableArray removeAllObjects](self->_beginMatchingCompletions, "removeAllObjects");

}

uint64_t __72__PKExtensionProvider__invokeAndClearBeginMatchingCompletionsWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

- (id)_extensionsForContainingApplicationIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[NSDictionary allValues](self->_passKitExtensions, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__PKExtensionProvider__extensionsForContainingApplicationIdentifiers___block_invoke;
  v9[3] = &unk_1E2AD5740;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "pk_objectsPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __70__PKExtensionProvider__extensionsForContainingApplicationIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__PKExtensionProvider__extensionsForContainingApplicationIdentifiers___block_invoke_2;
  v8[3] = &unk_1E2AD5718;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "pk_containsObjectPassingTest:", v8);

  return v6;
}

uint64_t __70__PKExtensionProvider__extensionsForContainingApplicationIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "containingApplicationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v6 == v5)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

- (id)_extensionMatchingEntitlementAttribute
{
  __CFString *v2;
  __CFString *v3;
  int v4;

  v2 = self->_extensionPoint;
  if (v2 == CFSTR("com.apple.PassKit.payment-information-event"))
    return CFSTR("ENTITLEMENT:com.apple.developer.payment-information-event-eligible");
  v3 = v2;
  if (v2
    && (v4 = -[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("com.apple.PassKit.payment-information-event")), v3, v4))
  {
    return CFSTR("ENTITLEMENT:com.apple.developer.payment-information-event-eligible");
  }
  else
  {
    return 0;
  }
}

- (NSString)extensionPoint
{
  return self->_extensionPoint;
}

- (void)setExtensionPoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)passKitExtensions
{
  return self->_passKitExtensions;
}

- (void)setPassKitExtensions:(id)a3
{
  objc_storeStrong((id *)&self->_passKitExtensions, a3);
}

- (id)matchingContext
{
  return self->_matchingContext;
}

- (void)setMatchingContext:(id)a3
{
  objc_storeStrong(&self->_matchingContext, a3);
}

- (BOOL)isBeginningMatching
{
  return self->_isBeginningMatching;
}

- (void)setIsBeginningMatching:(BOOL)a3
{
  self->_isBeginningMatching = a3;
}

- (NSMutableArray)beginMatchingCompletions
{
  return self->_beginMatchingCompletions;
}

- (void)setBeginMatchingCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_beginMatchingCompletions, a3);
}

- (OS_dispatch_source)extensionMatchTimer
{
  return self->_extensionMatchTimer;
}

- (void)setExtensionMatchTimer:(id)a3
{
  objc_storeStrong((id *)&self->_extensionMatchTimer, a3);
}

- (OS_dispatch_queue)extensionQueue
{
  return self->_extensionQueue;
}

- (void)setExtensionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_extensionQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionQueue, 0);
  objc_storeStrong((id *)&self->_extensionMatchTimer, 0);
  objc_storeStrong((id *)&self->_beginMatchingCompletions, 0);
  objc_storeStrong(&self->_matchingContext, 0);
  objc_storeStrong((id *)&self->_passKitExtensions, 0);
  objc_storeStrong((id *)&self->_extensionPoint, 0);
}

@end
