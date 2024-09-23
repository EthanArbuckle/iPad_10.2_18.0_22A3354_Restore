@implementation SKUIMediaSocialProfileCoordinator

- (SKUIMediaSocialProfileCoordinator)init
{
  SKUIMediaSocialProfileCoordinator *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *callbackQueue;
  dispatch_queue_t v6;
  OS_dispatch_queue *dispatchQueue;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMediaSocialProfileCoordinator init].cold.1();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIMediaSocialProfileCoordinator;
  v3 = -[SKUIMediaSocialProfileCoordinator init](&v12, sel_init);
  if (v3)
  {
    v4 = dispatch_queue_create("com.apple.StoreKitUI.SKUIMediaSocialProfileCoordinator.callback", 0);
    callbackQueue = v3->_callbackQueue;
    v3->_callbackQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_create("com.apple.StoreKitUI.SKUIMediaSocialProfileCoordinator", 0);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v6;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0DAF718];
    objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__accountStoreChangeNotification_, v9, v10);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  -[NSOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DAF718];
  objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, v5);

  v6.receiver = self;
  v6.super_class = (Class)SKUIMediaSocialProfileCoordinator;
  -[SKUIMediaSocialProfileCoordinator dealloc](&v6, sel_dealloc);
}

+ (id)sharedCoordinator
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SKUIMediaSocialProfileCoordinator_sharedCoordinator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCoordinator_sOnce_0 != -1)
    dispatch_once(&sharedCoordinator_sOnce_0, block);
  return (id)sharedCoordinator_sCoordinator_0;
}

void __54__SKUIMediaSocialProfileCoordinator_sharedCoordinator__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedCoordinator_sCoordinator_0;
  sharedCoordinator_sCoordinator_0 = (uint64_t)v1;

}

- (void)getProfileWithOptions:(id)a3 profileBlock:(id)a4
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
  block[2] = __72__SKUIMediaSocialProfileCoordinator_getProfileWithOptions_profileBlock___block_invoke;
  block[3] = &unk_1E73A95D8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

id *__72__SKUIMediaSocialProfileCoordinator_getProfileWithOptions_profileBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id *result;
  void *v5;
  int v6;
  double v7;
  _BOOL4 v8;
  char v9;
  void *v10;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 48))
  {
    v3 = objc_msgSend(*(id *)(v2 + 48), "operationCount");
    v2 = *(_QWORD *)(a1 + 32);
    if (v3)
      return (id *)objc_msgSend((id)v2, "_queueProfileBlock:", *(_QWORD *)(a1 + 48));
  }
  if (*(_BYTE *)(v2 + 64))
    return (id *)objc_msgSend((id)v2, "_queueProfileBlock:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("SKUIMediaSocialProfileOptionIgnoreCache"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  result = *(id **)(a1 + 32);
  if (result[5])
  {
    objc_msgSend(result[5], "timeIntervalSinceNow");
    v8 = v7 > 30.0;
    result = *(id **)(a1 + 32);
  }
  else
  {
    v8 = 0;
  }
  if (!result[4])
    goto LABEL_16;
  v9 = *(_QWORD *)(a1 + 48) ? v6 : 1;
  if ((v9 & 1) == 0)
  {
    v10 = (void *)objc_msgSend(result[4], "copy");
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    result = *(id **)(a1 + 32);
    if (!result[4])
      v8 = 1;
  }
  if ((v8 | v6) == 1)
  {
LABEL_16:
    objc_msgSend(result, "_queueProfileBlock:", *(_QWORD *)(a1 + 48));
    return (id *)objc_msgSend(*(id *)(a1 + 32), "_requestProfile");
  }
  return result;
}

- (void)reset
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SKUIMediaSocialProfileCoordinator_reset__block_invoke;
  block[3] = &unk_1E739FD38;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __42__SKUIMediaSocialProfileCoordinator_reset__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = 0;

}

- (void)_accountStoreChangeNotification:(id)a3
{
  void *v4;
  NSDate *lastAuthenticationAttempt;
  double v6;
  id v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeAccount");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (!self->_waitingForAuthentication)
    {
      lastAuthenticationAttempt = self->_lastAuthenticationAttempt;
      if (!lastAuthenticationAttempt
        || (-[NSDate timeIntervalSinceNow](lastAuthenticationAttempt, "timeIntervalSinceNow"), v6 > 10.0))
      {
        v7 = objc_alloc(MEMORY[0x1E0C99D80]);
        v8 = (void *)objc_msgSend(v7, "initWithObjectsAndKeys:", MEMORY[0x1E0C9AAB0], CFSTR("SKUIMediaSocialProfileOptionIgnoreCache"), 0);
        -[SKUIMediaSocialProfileCoordinator getProfileWithOptions:profileBlock:](self, "getProfileWithOptions:profileBlock:", v8, 0);

      }
    }
  }
  else
  {
    -[SKUIMediaSocialProfileCoordinator reset](self, "reset");
  }

}

- (void)_authenticateOnCompletion:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *lastAuthenticationAttempt;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  self->_waitingForAuthentication = 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastAuthenticationAttempt = self->_lastAuthenticationAttempt;
  self->_lastAuthenticationAttempt = v5;

  objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF5C0]), "initWithAccount:", v8);
    objc_msgSend(v9, "setPromptStyle:", 1);
    objc_msgSend(v9, "setShouldCreateNewSession:", 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DAF5C0], "contextForSignIn");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF488]), "initWithAuthenticationContext:", v9);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__SKUIMediaSocialProfileCoordinator__authenticateOnCompletion___block_invoke;
  v12[3] = &unk_1E73A9600;
  v12[4] = self;
  v13 = v4;
  v11 = v4;
  objc_msgSend(v10, "startWithAuthenticateResponseBlock:", v12);

}

void __63__SKUIMediaSocialProfileCoordinator__authenticateOnCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__SKUIMediaSocialProfileCoordinator__authenticateOnCompletion___block_invoke_2;
  block[3] = &unk_1E73A95D8;
  v9 = v3;
  v6 = v4;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v7 = v3;
  dispatch_async(v5, block);

}

void __63__SKUIMediaSocialProfileCoordinator__authenticateOnCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "authenticateResponseType");
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, BOOL))(v3 + 16))(v3, v2 == 4);
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 64) = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v4;

}

- (void)_queueProfileBlock:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *profileBlocks;
  id v9;

  v4 = a3;
  v9 = v4;
  if (!self->_profileBlocks)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    profileBlocks = self->_profileBlocks;
    self->_profileBlocks = v7;

    v4 = v9;
    if (!v9)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    v5 = self->_profileBlocks;
    v6 = (void *)objc_msgSend(v9, "copy");
    -[NSMutableArray addObject:](v5, "addObject:", v6);

    v4 = v9;
  }
LABEL_4:

}

- (void)_requestProfile
{
  NSOperationQueue *v3;
  NSOperationQueue *operationQueue;
  void *v5;
  void *v6;
  SKUIURLBag *v7;
  SKUIMediaSocialProfileOperation *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  id v13;
  id location;

  if (!self->_operationQueue)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = self->_operationQueue;
    self->_operationQueue = v3;

    -[NSOperationQueue setName:](self->_operationQueue, "setName:", CFSTR("com.apple.StoreKitUI.SKUIMediaSocialProfileCoordinator.operationQueue"));
    -[NSOperationQueue setQualityOfService:](self->_operationQueue, "setQualityOfService:", 25);
    -[NSOperationQueue setMaxConcurrentOperationCount:](self->_operationQueue, "setMaxConcurrentOperationCount:", 1);
  }
  objc_msgSend(MEMORY[0x1E0DAF660], "contextWithBagType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SSVDefaultUserAgent();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", v6, *MEMORY[0x1E0DAFA58]);

  v7 = -[SSURLBag initWithURLBagContext:]([SKUIURLBag alloc], "initWithURLBagContext:", v5);
  v8 = objc_alloc_init(SKUIMediaSocialProfileOperation);
  -[SSVComplexOperation configureWithURLBag:](v8, "configureWithURLBag:", v7);
  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __52__SKUIMediaSocialProfileCoordinator__requestProfile__block_invoke;
  v12 = &unk_1E73A9628;
  objc_copyWeak(&v13, &location);
  -[SKUIMediaSocialProfileOperation setOutputBlock:](v8, "setOutputBlock:", &v9);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v8, v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __52__SKUIMediaSocialProfileCoordinator__requestProfile__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handleOperationResponseWithProfile:error:", v6, v5);

}

- (void)_fireProfileBlocksWithProfile:(id)a3 isFinal:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  SKUIMediaSocialProfile *v10;
  SKUIMediaSocialProfile *lastKnownProfile;
  NSDate *v12;
  NSDate *lastRequestDate;
  void *v14;
  NSObject *callbackQueue;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v8 = a3;
  v9 = a5;
  if (v8)
  {
    v10 = (SKUIMediaSocialProfile *)objc_msgSend(v8, "copy");
    lastKnownProfile = self->_lastKnownProfile;
    self->_lastKnownProfile = v10;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastRequestDate = self->_lastRequestDate;
    self->_lastRequestDate = v12;

  }
  v14 = (void *)-[NSMutableArray copy](self->_profileBlocks, "copy");
  -[NSMutableArray removeAllObjects](self->_profileBlocks, "removeAllObjects");
  if (objc_msgSend(v14, "count"))
  {
    callbackQueue = self->_callbackQueue;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __81__SKUIMediaSocialProfileCoordinator__fireProfileBlocksWithProfile_isFinal_error___block_invoke;
    v16[3] = &unk_1E73A9580;
    v17 = v14;
    v18 = v8;
    v20 = a4;
    v19 = v9;
    dispatch_async(callbackQueue, v16);

  }
}

void __81__SKUIMediaSocialProfileCoordinator__fireProfileBlocksWithProfile_isFinal_error___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)_handleOperationResponseWithProfile:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SKUIMediaSocialProfileCoordinator *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__SKUIMediaSocialProfileCoordinator__handleOperationResponseWithProfile_error___block_invoke;
  block[3] = &unk_1E73A02E8;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

void __79__SKUIMediaSocialProfileCoordinator__handleOperationResponseWithProfile_error___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id location;

  objc_msgSend(a1[4], "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("SKUIErrorDomain")))
  {
    v3 = objc_msgSend(a1[4], "code");

    if (v3 == 3)
    {
      objc_initWeak(&location, a1[5]);
      v4 = a1[5];
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __79__SKUIMediaSocialProfileCoordinator__handleOperationResponseWithProfile_error___block_invoke_2;
      v5[3] = &unk_1E73A6C28;
      objc_copyWeak(&v8, &location);
      v6 = a1[6];
      v7 = a1[4];
      objc_msgSend(v4, "_authenticateOnCompletion:", v5);

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
      return;
    }
  }
  else
  {

  }
  objc_msgSend(a1[5], "_fireProfileBlocksWithProfile:isFinal:error:", a1[6], 1, a1[4]);
}

void __79__SKUIMediaSocialProfileCoordinator__handleOperationResponseWithProfile_error___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (a2)
    objc_msgSend(WeakRetained, "_requestProfile");
  else
    objc_msgSend(WeakRetained, "_fireProfileBlocksWithProfile:isFinal:error:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 40));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileBlocks, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_lastRequestDate, 0);
  objc_storeStrong((id *)&self->_lastKnownProfile, 0);
  objc_storeStrong((id *)&self->_lastAuthenticationAttempt, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

- (void)init
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIMediaSocialProfileCoordinator init]";
}

@end
