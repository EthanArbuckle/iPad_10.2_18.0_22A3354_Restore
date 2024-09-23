@implementation PKDiscoveryService

void __36__PKDiscoveryService_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ECF22CF0;
  qword_1ECF22CF0 = (uint64_t)v1;

}

- (PKDiscoveryService)init
{
  id v3;
  dispatch_queue_t v4;
  void *v5;
  PKXPCService *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v14[16];
  objc_super v15;

  if (!PKSecureElementIsAvailable())
  {
    PKLogFacilityTypeGetObject(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_error_impl(&dword_18FC92000, v12, OS_LOG_TYPE_ERROR, "Discovery Service isn't supported on this device.", v14, 2u);
    }

    v3 = 0;
    goto LABEL_7;
  }
  v15.receiver = self;
  v15.super_class = (Class)PKDiscoveryService;
  v3 = -[PKDiscoveryService init](&v15, sel_init);
  if (v3)
  {
    v4 = dispatch_queue_create("com.apple.passkit.pkdiscoveryservice.reply", 0);
    v5 = (void *)*((_QWORD *)v3 + 2);
    *((_QWORD *)v3 + 2) = v4;

    v6 = [PKXPCService alloc];
    PDDiscoveryServiceInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKDiscoveryServiceInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKXPCService initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:](v6, "initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:", CFSTR("com.apple.passd.discovery"), v7, v8, v3);
    v10 = (void *)*((_QWORD *)v3 + 1);
    *((_QWORD *)v3 + 1) = v9;

    *((_DWORD *)v3 + 8) = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
    v11 = objc_claimAutoreleasedReturnValue();
    self = (PKDiscoveryService *)*((_QWORD *)v3 + 3);
    *((_QWORD *)v3 + 3) = v11;
LABEL_7:

  }
  return (PKDiscoveryService *)v3;
}

uint64_t __60__PKDiscoveryService_manifestAllowsMiniCardsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__PKDiscoveryService_discoveryArticleLayoutsWithCompletion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

void __53__PKDiscoveryService_beginReporingDiscoveryAnalytics__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    PKLogFacilityTypeGetObject(0x10uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138412290;
      v4 = v1;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Error in beginReporingDiscoveryAnalytics: %@", (uint8_t *)&v3, 0xCu);
    }

  }
}

uint64_t __46__PKDiscoveryService_dismissedDiscoveryItems___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5]);
}

+ (PKDiscoveryService)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__PKDiscoveryService_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_293 != -1)
    dispatch_once(&_MergedGlobals_293, block);
  return (PKDiscoveryService *)(id)qword_1ECF22CF0;
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;

  if (a3)
  {
    p_observersLock = &self->_observersLock;
    v5 = a3;
    os_unfair_lock_lock(p_observersLock);
    -[NSHashTable addObject:](self->_observers, "addObject:", v5);

    os_unfair_lock_unlock(p_observersLock);
  }
}

- (void)processDiscoveryItemsAndMessagesWithCompletion:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __69__PKDiscoveryService_processDiscoveryItemsAndMessagesWithCompletion___block_invoke;
    v13[3] = &unk_1E2ABD9C8;
    v8 = v5;
    v14 = v8;
    -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __69__PKDiscoveryService_processDiscoveryItemsAndMessagesWithCompletion___block_invoke_2;
    v11[3] = &unk_1E2ABEB88;
    v11[4] = self;
    v12 = v8;
    objc_msgSend(v10, "processDiscoveryItemsAndMessagesWithCompletion:", v11);

  }
}

- (void)dismissedDiscoveryItems:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __46__PKDiscoveryService_dismissedDiscoveryItems___block_invoke;
    v13[3] = &unk_1E2ABD9C8;
    v8 = v5;
    v14 = v8;
    -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __46__PKDiscoveryService_dismissedDiscoveryItems___block_invoke_2;
    v11[3] = &unk_1E2ABE710;
    v11[4] = self;
    v12 = v8;
    objc_msgSend(v10, "dismissedDiscoveryItems:", v11);

  }
}

- (void)discoveryArticleLayoutsWithCompletion:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __60__PKDiscoveryService_discoveryArticleLayoutsWithCompletion___block_invoke;
    v13[3] = &unk_1E2ABD9C8;
    v8 = v5;
    v14 = v8;
    -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __60__PKDiscoveryService_discoveryArticleLayoutsWithCompletion___block_invoke_2;
    v11[3] = &unk_1E2ABE710;
    v11[4] = self;
    v12 = v8;
    objc_msgSend(v10, "discoveryArticleLayoutsWithCompletion:", v11);

  }
}

- (void)beginReporingDiscoveryAnalytics
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__PKDiscoveryService_beginReporingDiscoveryAnalytics__block_invoke;
  v5[3] = &unk_1E2AC0EF0;
  v5[4] = self;
  objc_msgSend(v4, "beginReportingDiscoveryAnalyticsCompletion:", v5);

}

- (void)manifestAllowsMiniCardsWithCompletion:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __60__PKDiscoveryService_manifestAllowsMiniCardsWithCompletion___block_invoke;
    v13[3] = &unk_1E2ABD9C8;
    v8 = v5;
    v14 = v8;
    -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __60__PKDiscoveryService_manifestAllowsMiniCardsWithCompletion___block_invoke_2;
    v11[3] = &unk_1E2ADDB60;
    v12 = v8;
    objc_msgSend(v10, "manifestAllowsMiniCardsWithCompletion:", v11);

  }
}

- (id)errorHandlerForMethod:(SEL)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD aBlock[5];
  id v12;
  SEL v13;

  v6 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PKDiscoveryService_errorHandlerForMethod_completion___block_invoke;
  aBlock[3] = &unk_1E2AC2788;
  v12 = v6;
  v13 = a3;
  aBlock[4] = self;
  v7 = v6;
  v8 = _Block_copy(aBlock);
  v9 = _Block_copy(v8);

  return v9;
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  return -[PKXPCService remoteObjectProxyWithErrorHandler:](self->_remoteService, "remoteObjectProxyWithErrorHandler:", a3);
}

void __53__PKDiscoveryService_beginReporingDiscoveryAnalytics__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__PKDiscoveryService_beginReporingDiscoveryAnalytics__block_invoke_2;
  v9[3] = &unk_1E2ABE0D0;
  v10 = v3;
  v11 = v4;
  v7 = v9;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v13 = v7;
  v8 = v3;
  dispatch_async(v5, block);

}

void __60__PKDiscoveryService_discoveryArticleLayoutsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__PKDiscoveryService_discoveryArticleLayoutsWithCompletion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

void __46__PKDiscoveryService_dismissedDiscoveryItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __46__PKDiscoveryService_dismissedDiscoveryItems___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

void __55__PKDiscoveryService_errorHandlerForMethod_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  __int128 buf;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKDiscoveryService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__PKDiscoveryService_errorHandlerForMethod_completion___block_invoke_22;
  v13[3] = &unk_1E2ABDA68;
  v9 = v6;
  v10 = *(_QWORD *)(a1 + 32);
  v14 = v3;
  v15 = v10;
  v16 = v9;
  v11 = v13;
  *(_QWORD *)&buf = v8;
  *((_QWORD *)&buf + 1) = 3221225472;
  v18 = __dispatch_async_ar_block_invoke_25;
  v19 = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v3;
  dispatch_async(v7, &buf);

}

uint64_t __55__PKDiscoveryService_errorHandlerForMethod_completion___block_invoke_22(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __60__PKDiscoveryService_discoveryArticleLayoutsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)discoveryArticleLayoutForItemWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __77__PKDiscoveryService_discoveryArticleLayoutForItemWithIdentifier_completion___block_invoke;
    v16[3] = &unk_1E2ABD9C8;
    v10 = v7;
    v17 = v10;
    v11 = a3;
    -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __77__PKDiscoveryService_discoveryArticleLayoutForItemWithIdentifier_completion___block_invoke_2;
    v14[3] = &unk_1E2ADDB38;
    v14[4] = self;
    v15 = v10;
    objc_msgSend(v13, "discoveryArticleLayoutForItemWithIdentifier:completion:", v11, v14);

  }
}

uint64_t __77__PKDiscoveryService_discoveryArticleLayoutForItemWithIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __77__PKDiscoveryService_discoveryArticleLayoutForItemWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__PKDiscoveryService_discoveryArticleLayoutForItemWithIdentifier_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __77__PKDiscoveryService_discoveryArticleLayoutForItemWithIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)updateDiscoveryManifestWithCompletion:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __60__PKDiscoveryService_updateDiscoveryManifestWithCompletion___block_invoke;
    v13[3] = &unk_1E2ABD9C8;
    v8 = v5;
    v14 = v8;
    -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __60__PKDiscoveryService_updateDiscoveryManifestWithCompletion___block_invoke_2;
    v11[3] = &unk_1E2ABEB88;
    v11[4] = self;
    v12 = v8;
    objc_msgSend(v10, "updateDiscoveryManifestWithCompletion:", v11);

  }
}

uint64_t __60__PKDiscoveryService_updateDiscoveryManifestWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __60__PKDiscoveryService_updateDiscoveryManifestWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__PKDiscoveryService_updateDiscoveryManifestWithCompletion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __60__PKDiscoveryService_updateDiscoveryManifestWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __60__PKDiscoveryService_manifestAllowsMiniCardsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

- (void)updateDiscoveryItemWithIdentifier:(id)a3 forAction:(int64_t)a4 completion:(id)a5
{
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v11 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __77__PKDiscoveryService_updateDiscoveryItemWithIdentifier_forAction_completion___block_invoke;
    v18[3] = &unk_1E2ABD9C8;
    v12 = v9;
    v19 = v12;
    v13 = a3;
    -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __77__PKDiscoveryService_updateDiscoveryItemWithIdentifier_forAction_completion___block_invoke_2;
    v16[3] = &unk_1E2ABEB88;
    v16[4] = self;
    v17 = v12;
    objc_msgSend(v15, "updateDiscoveryItemWithIdentifier:forAction:completion:", v13, a4, v16);

  }
}

uint64_t __77__PKDiscoveryService_updateDiscoveryItemWithIdentifier_forAction_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __77__PKDiscoveryService_updateDiscoveryItemWithIdentifier_forAction_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__PKDiscoveryService_updateDiscoveryItemWithIdentifier_forAction_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __77__PKDiscoveryService_updateDiscoveryItemWithIdentifier_forAction_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)discoveryItemsWithCompletion:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __51__PKDiscoveryService_discoveryItemsWithCompletion___block_invoke;
    v13[3] = &unk_1E2ABD9C8;
    v8 = v5;
    v14 = v8;
    -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __51__PKDiscoveryService_discoveryItemsWithCompletion___block_invoke_2;
    v11[3] = &unk_1E2ABE710;
    v11[4] = self;
    v12 = v8;
    objc_msgSend(v10, "discoveryItemsWithCompletion:", v11);

  }
}

uint64_t __51__PKDiscoveryService_discoveryItemsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __51__PKDiscoveryService_discoveryItemsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__PKDiscoveryService_discoveryItemsWithCompletion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __51__PKDiscoveryService_discoveryItemsWithCompletion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)insertDiscoveryItems:(id)a3 discoveryArticleLayouts:(id)a4 completion:(id)a5
{
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v11 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __78__PKDiscoveryService_insertDiscoveryItems_discoveryArticleLayouts_completion___block_invoke;
    v19[3] = &unk_1E2ABD9C8;
    v12 = v9;
    v20 = v12;
    v13 = a4;
    v14 = a3;
    -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __78__PKDiscoveryService_insertDiscoveryItems_discoveryArticleLayouts_completion___block_invoke_2;
    v17[3] = &unk_1E2ABEB88;
    v17[4] = self;
    v18 = v12;
    objc_msgSend(v16, "insertDiscoveryItems:discoveryArticleLayouts:completion:", v14, v13, v17);

  }
}

uint64_t __78__PKDiscoveryService_insertDiscoveryItems_discoveryArticleLayouts_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__PKDiscoveryService_insertDiscoveryItems_discoveryArticleLayouts_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__PKDiscoveryService_insertDiscoveryItems_discoveryArticleLayouts_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __78__PKDiscoveryService_insertDiscoveryItems_discoveryArticleLayouts_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)displayedDiscoveryEngagementMessageWithIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v5 = a3;
  -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__PKDiscoveryService_displayedDiscoveryEngagementMessageWithIdentifier___block_invoke;
  v8[3] = &unk_1E2AC0EF0;
  v8[4] = self;
  objc_msgSend(v7, "displayedDiscoveryEngagementMessageWithIdentifier:completion:", v5, v8);

}

void __72__PKDiscoveryService_displayedDiscoveryEngagementMessageWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__PKDiscoveryService_displayedDiscoveryEngagementMessageWithIdentifier___block_invoke_2;
  v9[3] = &unk_1E2ABE0D0;
  v10 = v3;
  v11 = v4;
  v7 = v9;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v13 = v7;
  v8 = v3;
  dispatch_async(v5, block);

}

void __72__PKDiscoveryService_displayedDiscoveryEngagementMessageWithIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    PKLogFacilityTypeGetObject(0x10uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138412290;
      v4 = v1;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Error in displayedDiscoveryEngagementMessageWithIdentifier: %@", (uint8_t *)&v3, 0xCu);
    }

  }
}

- (void)displayedDiscoveryItemWithIdentifier:(id)a3 isWelcomeCard:(BOOL)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 callToAction:(int64_t)a7 cardSize:(int64_t)a8
{
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[5];

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v15 = a3;
  -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18[1] = 3221225472;
  v18[2] = __142__PKDiscoveryService_displayedDiscoveryItemWithIdentifier_isWelcomeCard_afterSwipingToCard_multipleStoryCardsAvailable_callToAction_cardSize___block_invoke;
  v18[3] = &unk_1E2AC0EF0;
  v18[4] = self;
  v18[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v17, "displayedDiscoveryItemWithIdentifier:isWelcomeCard:afterSwipingToCard:multipleStoryCardsAvailable:callToAction:cardSize:completion:", v15, v12, v11, v10, a7, a8, v18);

}

void __142__PKDiscoveryService_displayedDiscoveryItemWithIdentifier_isWelcomeCard_afterSwipingToCard_multipleStoryCardsAvailable_callToAction_cardSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __142__PKDiscoveryService_displayedDiscoveryItemWithIdentifier_isWelcomeCard_afterSwipingToCard_multipleStoryCardsAvailable_callToAction_cardSize___block_invoke_2;
  v9[3] = &unk_1E2ABE0D0;
  v10 = v3;
  v11 = v4;
  v7 = v9;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v13 = v7;
  v8 = v3;
  dispatch_async(v5, block);

}

void __142__PKDiscoveryService_displayedDiscoveryItemWithIdentifier_isWelcomeCard_afterSwipingToCard_multipleStoryCardsAvailable_callToAction_cardSize___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    PKLogFacilityTypeGetObject(0x10uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138412290;
      v4 = v1;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Error in displayedDiscoveryEngagementMessageWithIdentifier: %@", (uint8_t *)&v3, 0xCu);
    }

  }
}

- (void)expandedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 cardSize:(int64_t)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  v8 = a6;
  v9 = a5;
  v13 = a3;
  -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __127__PKDiscoveryService_expandedDiscoveryItemWithIdentifier_callToAction_afterSwipingToCard_multipleStoryCardsAvailable_cardSize___block_invoke;
  v16[3] = &unk_1E2AC0EF0;
  v16[4] = self;
  objc_msgSend(v15, "expandedDiscoveryItemWithIdentifier:callToAction:afterSwipingToCard:multipleStoryCardsAvailable:cardSize:completion:", v13, a4, v9, v8, a7, v16);

}

void __127__PKDiscoveryService_expandedDiscoveryItemWithIdentifier_callToAction_afterSwipingToCard_multipleStoryCardsAvailable_cardSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __127__PKDiscoveryService_expandedDiscoveryItemWithIdentifier_callToAction_afterSwipingToCard_multipleStoryCardsAvailable_cardSize___block_invoke_2;
  v9[3] = &unk_1E2ABE0D0;
  v10 = v3;
  v11 = v4;
  v7 = v9;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v13 = v7;
  v8 = v3;
  dispatch_async(v5, block);

}

void __127__PKDiscoveryService_expandedDiscoveryItemWithIdentifier_callToAction_afterSwipingToCard_multipleStoryCardsAvailable_cardSize___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    PKLogFacilityTypeGetObject(0x10uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138412290;
      v4 = v1;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Error in expandedDiscoveryItemWithIdentifier: %@", (uint8_t *)&v3, 0xCu);
    }

  }
}

- (void)dismissedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 cardSize:(int64_t)a5
{
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v9 = a3;
  -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__PKDiscoveryService_dismissedDiscoveryItemWithIdentifier_callToAction_cardSize___block_invoke;
  v12[3] = &unk_1E2AC0EF0;
  v12[4] = self;
  objc_msgSend(v11, "dismissedDiscoveryItemWithIdentifier:callToAction:cardSize:completion:", v9, a4, a5, v12);

}

void __81__PKDiscoveryService_dismissedDiscoveryItemWithIdentifier_callToAction_cardSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__PKDiscoveryService_dismissedDiscoveryItemWithIdentifier_callToAction_cardSize___block_invoke_2;
  v9[3] = &unk_1E2ABE0D0;
  v10 = v3;
  v11 = v4;
  v7 = v9;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v13 = v7;
  v8 = v3;
  dispatch_async(v5, block);

}

void __81__PKDiscoveryService_dismissedDiscoveryItemWithIdentifier_callToAction_cardSize___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    PKLogFacilityTypeGetObject(0x10uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138412290;
      v4 = v1;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Error in dismissedDiscoveryItemWithIdentifier: %@", (uint8_t *)&v3, 0xCu);
    }

  }
}

- (void)removedAllDiscoveryItems
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__PKDiscoveryService_removedAllDiscoveryItems__block_invoke;
  v5[3] = &unk_1E2AC0EF0;
  v5[4] = self;
  objc_msgSend(v4, "removedAllDiscoveryItemsWithCompletion:", v5);

}

void __46__PKDiscoveryService_removedAllDiscoveryItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__PKDiscoveryService_removedAllDiscoveryItems__block_invoke_2;
  v9[3] = &unk_1E2ABE0D0;
  v10 = v3;
  v11 = v4;
  v7 = v9;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v13 = v7;
  v8 = v3;
  dispatch_async(v5, block);

}

void __46__PKDiscoveryService_removedAllDiscoveryItems__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    PKLogFacilityTypeGetObject(0x10uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138412290;
      v4 = v1;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Error in removedAllDiscoveryItems: %@", (uint8_t *)&v3, 0xCu);
    }

  }
}

- (void)tappedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 cardSize:(int64_t)a5
{
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v9 = a3;
  -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__PKDiscoveryService_tappedDiscoveryItemWithIdentifier_callToAction_cardSize___block_invoke;
  v12[3] = &unk_1E2AC0EF0;
  v12[4] = self;
  objc_msgSend(v11, "tappedDiscoveryItemCTA:itemIdentifier:cardSize:completion:", a4, v9, a5, v12);

}

void __78__PKDiscoveryService_tappedDiscoveryItemWithIdentifier_callToAction_cardSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__PKDiscoveryService_tappedDiscoveryItemWithIdentifier_callToAction_cardSize___block_invoke_2;
  v9[3] = &unk_1E2ABE0D0;
  v10 = v3;
  v11 = v4;
  v7 = v9;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v13 = v7;
  v8 = v3;
  dispatch_async(v5, block);

}

void __78__PKDiscoveryService_tappedDiscoveryItemWithIdentifier_callToAction_cardSize___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    PKLogFacilityTypeGetObject(0x10uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138412290;
      v4 = v1;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Error in tappedDiscoveryItemCTA: %@", (uint8_t *)&v3, 0xCu);
    }

  }
}

- (void)completedDiscoveryItemCTAWithCompletion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v5 = a3;
  -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__PKDiscoveryService_completedDiscoveryItemCTAWithCompletion___block_invoke;
  v9[3] = &unk_1E2ABEB88;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "completedDiscoveryItemCTAWithCompletion:", v9);

}

void __62__PKDiscoveryService_completedDiscoveryItemCTAWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__PKDiscoveryService_completedDiscoveryItemCTAWithCompletion___block_invoke_2;
  v10[3] = &unk_1E2AC4930;
  v11 = v3;
  v7 = v5;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v7;
  v8 = v10;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v6, block);

}

uint64_t __62__PKDiscoveryService_completedDiscoveryItemCTAWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    PKLogFacilityTypeGetObject(0x10uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Error in completedDiscoveryItemCTA: %@", (uint8_t *)&v5, 0xCu);
    }

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)discoveryItemWithIdentifier:(id)a3 launchedWithReferralSource:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v7 = a3;
  -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__PKDiscoveryService_discoveryItemWithIdentifier_launchedWithReferralSource___block_invoke;
  v10[3] = &unk_1E2AC0EF0;
  v10[4] = self;
  objc_msgSend(v9, "discoveryItemWithIdentifier:launchedWithReferralSource:completion:", v7, a4, v10);

}

void __77__PKDiscoveryService_discoveryItemWithIdentifier_launchedWithReferralSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__PKDiscoveryService_discoveryItemWithIdentifier_launchedWithReferralSource___block_invoke_2;
  v9[3] = &unk_1E2ABE0D0;
  v10 = v3;
  v11 = v4;
  v7 = v9;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v13 = v7;
  v8 = v3;
  dispatch_async(v5, block);

}

void __77__PKDiscoveryService_discoveryItemWithIdentifier_launchedWithReferralSource___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    PKLogFacilityTypeGetObject(0x10uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138412290;
      v4 = v1;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Error in displayedDiscoveryEngagementMessageWithIdentifier: %@", (uint8_t *)&v3, 0xCu);
    }

  }
}

- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 isScrollable:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v5 = a5;
  v9 = a3;
  -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__PKDiscoveryService_discoveryItemWithIdentifier_callToAction_isScrollable___block_invoke;
  v12[3] = &unk_1E2AC0EF0;
  v12[4] = self;
  objc_msgSend(v11, "discoveryItemWithIdentifier:callToAction:isScrollable:completion:", v9, a4, v5, v12);

}

void __76__PKDiscoveryService_discoveryItemWithIdentifier_callToAction_isScrollable___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__PKDiscoveryService_discoveryItemWithIdentifier_callToAction_isScrollable___block_invoke_2;
  v9[3] = &unk_1E2ABE0D0;
  v10 = v3;
  v11 = v4;
  v7 = v9;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v13 = v7;
  v8 = v3;
  dispatch_async(v5, block);

}

void __76__PKDiscoveryService_discoveryItemWithIdentifier_callToAction_isScrollable___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    PKLogFacilityTypeGetObject(0x10uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138412290;
      v4 = v1;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Error in discoveryItemWithIdentifier:callToAction:isScrollable %@", (uint8_t *)&v3, 0xCu);
    }

  }
}

- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 wasScrolledToTheBottom:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v5 = a5;
  v9 = a3;
  -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __86__PKDiscoveryService_discoveryItemWithIdentifier_callToAction_wasScrolledToTheBottom___block_invoke;
  v12[3] = &unk_1E2AC0EF0;
  v12[4] = self;
  objc_msgSend(v11, "discoveryItemWithIdentifier:callToAction:wasScrolledToTheBottom:completion:", v9, a4, v5, v12);

}

void __86__PKDiscoveryService_discoveryItemWithIdentifier_callToAction_wasScrolledToTheBottom___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__PKDiscoveryService_discoveryItemWithIdentifier_callToAction_wasScrolledToTheBottom___block_invoke_2;
  v9[3] = &unk_1E2ABE0D0;
  v10 = v3;
  v11 = v4;
  v7 = v9;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v13 = v7;
  v8 = v3;
  dispatch_async(v5, block);

}

void __86__PKDiscoveryService_discoveryItemWithIdentifier_callToAction_wasScrolledToTheBottom___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    PKLogFacilityTypeGetObject(0x10uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138412290;
      v4 = v1;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Error in discoveryItemWithIdentifier:callToAction:wasScrolledToTheBottom: %@", (uint8_t *)&v3, 0xCu);
    }

  }
}

- (void)endReporingDiscoveryAnalytics
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__PKDiscoveryService_endReporingDiscoveryAnalytics__block_invoke;
  v5[3] = &unk_1E2AC0EF0;
  v5[4] = self;
  objc_msgSend(v4, "endReportingDiscoveryAnalyticsCompletion:", v5);

}

void __51__PKDiscoveryService_endReporingDiscoveryAnalytics__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__PKDiscoveryService_endReporingDiscoveryAnalytics__block_invoke_2;
  v9[3] = &unk_1E2ABE0D0;
  v10 = v3;
  v11 = v4;
  v7 = v9;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v13 = v7;
  v8 = v3;
  dispatch_async(v5, block);

}

void __51__PKDiscoveryService_endReporingDiscoveryAnalytics__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    PKLogFacilityTypeGetObject(0x10uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138412290;
      v4 = v1;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Error in beginReporingDiscoveryAnalytics: %@", (uint8_t *)&v3, 0xCu);
    }

  }
}

- (int64_t)welcomeCardCount
{
  void *v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  char v6;
  _BOOL8 v7;
  int64_t v8;

  +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (PKSecureElementIsAvailable())
  {
    +[PKPaymentWebService sharedService](PKPaymentWebService, "sharedService");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[PKPaymentRegistrationUtilities _isPaymentSetupSupportedForWebService:](PKPaymentRegistrationUtilities, "_isPaymentSetupSupportedForWebService:", v3))
    {
      v4 = +[PKSecureElement isInFailForward](PKSecureElement, "isInFailForward");

      if (!v4)
      {
        v5 = objc_msgSend(v2, "hasPassesOfType:", 1) ^ 1;
        goto LABEL_7;
      }
    }
    else
    {

    }
  }
  v5 = 0;
LABEL_7:
  v6 = objc_msgSend(v2, "hasPassesOfType:", 0);
  v7 = 0;
  if ((v6 & 1) == 0)
    v7 = !PKBarcodePassWelcomeCardDismissed();
  v8 = v7 + v5;

  return v8;
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;

  if (a3)
  {
    p_observersLock = &self->_observersLock;
    v5 = a3;
    os_unfair_lock_lock(p_observersLock);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

    os_unfair_lock_unlock(p_observersLock);
  }
}

- (id)observers
{
  os_unfair_lock_s *p_observersLock;
  void *v4;
  void *v5;

  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_observersLock);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (void)discoveryArticleLayoutsUpdated:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PKDiscoveryService observers](self, "observers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "discoveryService:receivedUpdatedDiscoveryArticleLayouts:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)completedCTAForItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PKDiscoveryService observers](self, "observers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "discoveryService:completedCTAForItem:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)dialogRequestsChangedForPlacement:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PKDiscoveryService observers](self, "observers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "discoveryService:dialogRequestsChangedForPlacement:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)discoveryEngagementMessagesUpdated
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PKDiscoveryService observers](self, "observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "discoveryServiceDidReceiveUpdatedDiscoveryEngagementMessages:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

uint64_t __69__PKDiscoveryService_processDiscoveryItemsAndMessagesWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__PKDiscoveryService_processDiscoveryItemsAndMessagesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__PKDiscoveryService_processDiscoveryItemsAndMessagesWithCompletion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __69__PKDiscoveryService_processDiscoveryItemsAndMessagesWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)discoveryEngagementMessagesForPassUniqueIdentifier:(id)a3 active:(unint64_t)a4 completion:(id)a5
{
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v11 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __91__PKDiscoveryService_discoveryEngagementMessagesForPassUniqueIdentifier_active_completion___block_invoke;
    v18[3] = &unk_1E2ABD9C8;
    v12 = v9;
    v19 = v12;
    v13 = a3;
    -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __91__PKDiscoveryService_discoveryEngagementMessagesForPassUniqueIdentifier_active_completion___block_invoke_2;
    v16[3] = &unk_1E2ABE710;
    v16[4] = self;
    v17 = v12;
    objc_msgSend(v15, "discoveryEngagementMessagesForPassUniqueIdentifier:active:completion:", v13, a4, v16);

  }
}

uint64_t __91__PKDiscoveryService_discoveryEngagementMessagesForPassUniqueIdentifier_active_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __91__PKDiscoveryService_discoveryEngagementMessagesForPassUniqueIdentifier_active_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91__PKDiscoveryService_discoveryEngagementMessagesForPassUniqueIdentifier_active_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __91__PKDiscoveryService_discoveryEngagementMessagesForPassUniqueIdentifier_active_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5]);
}

- (void)dialogRequestsForPlacement:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __60__PKDiscoveryService_dialogRequestsForPlacement_completion___block_invoke;
    v16[3] = &unk_1E2ABD9C8;
    v10 = v7;
    v17 = v10;
    v11 = a3;
    -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __60__PKDiscoveryService_dialogRequestsForPlacement_completion___block_invoke_2;
    v14[3] = &unk_1E2ABE710;
    v14[4] = self;
    v15 = v10;
    objc_msgSend(v13, "dialogRequestsForPlacement:completion:", v11, v14);

  }
}

uint64_t __60__PKDiscoveryService_dialogRequestsForPlacement_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__PKDiscoveryService_dialogRequestsForPlacement_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__PKDiscoveryService_dialogRequestsForPlacement_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __60__PKDiscoveryService_dialogRequestsForPlacement_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5]);
}

- (void)dismissDialogRequestWithIdentifier:(id)a3 forPlacement:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __81__PKDiscoveryService_dismissDialogRequestWithIdentifier_forPlacement_completion___block_invoke;
  v19[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __81__PKDiscoveryService_dismissDialogRequestWithIdentifier_forPlacement_completion___block_invoke_2;
  v17[3] = &unk_1E2ABEB88;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "dismissDialogRequestWithIdentifier:forPlacement:completion:", v13, v12, v17);

}

uint64_t __81__PKDiscoveryService_dismissDialogRequestWithIdentifier_forPlacement_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __81__PKDiscoveryService_dismissDialogRequestWithIdentifier_forPlacement_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__PKDiscoveryService_dismissDialogRequestWithIdentifier_forPlacement_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __81__PKDiscoveryService_dismissDialogRequestWithIdentifier_forPlacement_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __46__PKDiscoveryService_dismissedDiscoveryItems___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateDiscoveryEngagementMessageWithIdentifier:(id)a3 forAction:(int64_t)a4 completion:(id)a5
{
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v11 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __90__PKDiscoveryService_updateDiscoveryEngagementMessageWithIdentifier_forAction_completion___block_invoke;
    v18[3] = &unk_1E2ABD9C8;
    v12 = v9;
    v19 = v12;
    v13 = a3;
    -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __90__PKDiscoveryService_updateDiscoveryEngagementMessageWithIdentifier_forAction_completion___block_invoke_2;
    v16[3] = &unk_1E2ABEB88;
    v16[4] = self;
    v17 = v12;
    objc_msgSend(v15, "updateDiscoveryEngagementMessageWithIdentifier:forAction:completion:", v13, a4, v16);

  }
}

uint64_t __90__PKDiscoveryService_updateDiscoveryEngagementMessageWithIdentifier_forAction_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__PKDiscoveryService_updateDiscoveryEngagementMessageWithIdentifier_forAction_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __90__PKDiscoveryService_updateDiscoveryEngagementMessageWithIdentifier_forAction_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __90__PKDiscoveryService_updateDiscoveryEngagementMessageWithIdentifier_forAction_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)insertDiscoveryEngagementMessages:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __67__PKDiscoveryService_insertDiscoveryEngagementMessages_completion___block_invoke;
    v16[3] = &unk_1E2ABD9C8;
    v10 = v7;
    v17 = v10;
    v11 = a3;
    -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __67__PKDiscoveryService_insertDiscoveryEngagementMessages_completion___block_invoke_2;
    v14[3] = &unk_1E2ABEB88;
    v14[4] = self;
    v15 = v10;
    objc_msgSend(v13, "insertDiscoveryEngagementMessages:completion:", v11, v14);

  }
}

uint64_t __67__PKDiscoveryService_insertDiscoveryEngagementMessages_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__PKDiscoveryService_insertDiscoveryEngagementMessages_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__PKDiscoveryService_insertDiscoveryEngagementMessages_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __67__PKDiscoveryService_insertDiscoveryEngagementMessages_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)removeDiscoveryMessageWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __70__PKDiscoveryService_removeDiscoveryMessageWithIdentifier_completion___block_invoke;
    v16[3] = &unk_1E2ABD9C8;
    v10 = v7;
    v17 = v10;
    v11 = a3;
    -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __70__PKDiscoveryService_removeDiscoveryMessageWithIdentifier_completion___block_invoke_2;
    v14[3] = &unk_1E2ABEB88;
    v14[4] = self;
    v15 = v10;
    objc_msgSend(v13, "removeDiscoveryMessageWithIdentifier:completion:", v11, v14);

  }
}

uint64_t __70__PKDiscoveryService_removeDiscoveryMessageWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__PKDiscoveryService_removeDiscoveryMessageWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__PKDiscoveryService_removeDiscoveryMessageWithIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __70__PKDiscoveryService_removeDiscoveryMessageWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)rulesWithCompletion:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __42__PKDiscoveryService_rulesWithCompletion___block_invoke;
    v13[3] = &unk_1E2ABD9C8;
    v8 = v5;
    v14 = v8;
    -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __42__PKDiscoveryService_rulesWithCompletion___block_invoke_2;
    v11[3] = &unk_1E2ACF9F8;
    v11[4] = self;
    v12 = v8;
    objc_msgSend(v10, "rulesWithCompletion:", v11);

  }
}

uint64_t __42__PKDiscoveryService_rulesWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __42__PKDiscoveryService_rulesWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__PKDiscoveryService_rulesWithCompletion___block_invoke_3;
  v13[3] = &unk_1E2ABDA68;
  v15 = v6;
  v16 = v7;
  v14 = v5;
  v10 = v13;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v18 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v8, block);

}

uint64_t __42__PKDiscoveryService_rulesWithCompletion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)insertRule:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __44__PKDiscoveryService_insertRule_completion___block_invoke;
    v16[3] = &unk_1E2ABD9C8;
    v10 = v7;
    v17 = v10;
    v11 = a3;
    -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __44__PKDiscoveryService_insertRule_completion___block_invoke_2;
    v14[3] = &unk_1E2ABEB88;
    v14[4] = self;
    v15 = v10;
    objc_msgSend(v13, "insertRule:completion:", v11, v14);

  }
}

uint64_t __44__PKDiscoveryService_insertRule_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __44__PKDiscoveryService_insertRule_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__PKDiscoveryService_insertRule_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __44__PKDiscoveryService_insertRule_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)deleteRuleWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __58__PKDiscoveryService_deleteRuleWithIdentifier_completion___block_invoke;
    v16[3] = &unk_1E2ABD9C8;
    v10 = v7;
    v17 = v10;
    v11 = a3;
    -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __58__PKDiscoveryService_deleteRuleWithIdentifier_completion___block_invoke_2;
    v14[3] = &unk_1E2ABEB88;
    v14[4] = self;
    v15 = v10;
    objc_msgSend(v13, "deleteRuleWithIdentifier:completion:", v11, v14);

  }
}

uint64_t __58__PKDiscoveryService_deleteRuleWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__PKDiscoveryService_deleteRuleWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__PKDiscoveryService_deleteRuleWithIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __58__PKDiscoveryService_deleteRuleWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)evaluateRulesWithIdentifiers:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __62__PKDiscoveryService_evaluateRulesWithIdentifiers_completion___block_invoke;
    v16[3] = &unk_1E2ABD9C8;
    v10 = v7;
    v17 = v10;
    v11 = a3;
    -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __62__PKDiscoveryService_evaluateRulesWithIdentifiers_completion___block_invoke_2;
    v14[3] = &unk_1E2ABDA90;
    v14[4] = self;
    v15 = v10;
    objc_msgSend(v13, "evaluateRulesWithIdentifiers:completion:", v11, v14);

  }
}

uint64_t __62__PKDiscoveryService_evaluateRulesWithIdentifiers_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__PKDiscoveryService_evaluateRulesWithIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__PKDiscoveryService_evaluateRulesWithIdentifiers_completion___block_invoke_3;
  v13[3] = &unk_1E2ABDA68;
  v15 = v6;
  v16 = v7;
  v14 = v5;
  v10 = v13;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v18 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v8, block);

}

uint64_t __62__PKDiscoveryService_evaluateRulesWithIdentifiers_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)removeDiscoveryUserNotificationsWithCompletion:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __69__PKDiscoveryService_removeDiscoveryUserNotificationsWithCompletion___block_invoke;
    v13[3] = &unk_1E2ABD9C8;
    v8 = v5;
    v14 = v8;
    -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __69__PKDiscoveryService_removeDiscoveryUserNotificationsWithCompletion___block_invoke_2;
    v11[3] = &unk_1E2ABEB88;
    v11[4] = self;
    v12 = v8;
    objc_msgSend(v10, "removeDiscoveryUserNotificationsWithCompletion:", v11);

  }
}

uint64_t __69__PKDiscoveryService_removeDiscoveryUserNotificationsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__PKDiscoveryService_removeDiscoveryUserNotificationsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD block[4];
  id v13;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__PKDiscoveryService_removeDiscoveryUserNotificationsWithCompletion___block_invoke_3;
  v9[3] = &unk_1E2ABDA18;
  v10 = v3;
  v11 = v4;
  v7 = v9;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v13 = v7;
  v8 = v3;
  dispatch_async(v5, block);

}

uint64_t __69__PKDiscoveryService_removeDiscoveryUserNotificationsWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)fireEngagementEventNamed:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __58__PKDiscoveryService_fireEngagementEventNamed_completion___block_invoke;
    v16[3] = &unk_1E2ABD9C8;
    v10 = v7;
    v17 = v10;
    v11 = a3;
    -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __58__PKDiscoveryService_fireEngagementEventNamed_completion___block_invoke_2;
    v14[3] = &unk_1E2ABEB88;
    v14[4] = self;
    v15 = v10;
    objc_msgSend(v13, "fireEngagementEventNamed:completion:", v11, v14);

  }
}

uint64_t __58__PKDiscoveryService_fireEngagementEventNamed_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__PKDiscoveryService_fireEngagementEventNamed_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD block[4];
  id v13;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__PKDiscoveryService_fireEngagementEventNamed_completion___block_invoke_3;
  v9[3] = &unk_1E2ABDA18;
  v10 = v3;
  v11 = v4;
  v7 = v9;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v13 = v7;
  v8 = v3;
  dispatch_async(v5, block);

}

uint64_t __58__PKDiscoveryService_fireEngagementEventNamed_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)fetchUserProperties:(id)a3 withParameters:(id)a4 completion:(id)a5
{
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v11 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __68__PKDiscoveryService_fetchUserProperties_withParameters_completion___block_invoke;
    v19[3] = &unk_1E2ABD9C8;
    v12 = v9;
    v20 = v12;
    v13 = a4;
    v14 = a3;
    -[PKDiscoveryService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiscoveryService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __68__PKDiscoveryService_fetchUserProperties_withParameters_completion___block_invoke_2;
    v17[3] = &unk_1E2ABDA90;
    v17[4] = self;
    v18 = v12;
    objc_msgSend(v16, "fetchUserProperties:withParameters:completion:", v14, v13, v17);

  }
}

uint64_t __68__PKDiscoveryService_fetchUserProperties_withParameters_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__PKDiscoveryService_fetchUserProperties_withParameters_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__PKDiscoveryService_fetchUserProperties_withParameters_completion___block_invoke_3;
  v13[3] = &unk_1E2ABDA68;
  v15 = v6;
  v16 = v7;
  v14 = v5;
  v10 = v13;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_25;
  block[3] = &unk_1E2ABD9A0;
  v18 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v8, block);

}

uint64_t __68__PKDiscoveryService_fetchUserProperties_withParameters_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_remoteService, 0);
}

@end
