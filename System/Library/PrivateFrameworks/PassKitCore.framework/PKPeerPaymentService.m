@implementation PKPeerPaymentService

void __31__PKPeerPaymentService_account__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __38__PKPeerPaymentService_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ECF22CD0;
  qword_1ECF22CD0 = (uint64_t)v1;

}

- (PKPeerPaymentService)init
{
  id v3;
  PKXPCService *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_queue_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t v16[16];
  objc_super v17;

  if (!PKSecureElementIsAvailable())
  {
    PKLogFacilityTypeGetObject(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_error_impl(&dword_18FC92000, v14, OS_LOG_TYPE_ERROR, "Peer Payment Service isn't supported on this device.", v16, 2u);
    }

    v3 = 0;
    goto LABEL_7;
  }
  v17.receiver = self;
  v17.super_class = (Class)PKPeerPaymentService;
  v3 = -[PKPeerPaymentService init](&v17, sel_init);
  if (v3)
  {
    v4 = [PKXPCService alloc];
    PDPeerPaymentServiceInterface();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKPeerPaymentServiceInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PKXPCService initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:](v4, "initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:", CFSTR("com.apple.passd.peer-payment"), v5, v6, v3);
    v8 = (void *)*((_QWORD *)v3 + 1);
    *((_QWORD *)v3 + 1) = v7;

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:suspensionBehavior:", v3, sel__accountChanged_, CFSTR("PDPeerPaymentServiceAccountChangedDistributedNotification"), 0, 2);

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:suspensionBehavior:", v3, sel__preferencesChanged_, CFSTR("PDPeerPaymentServicePreferencesChangedDistributedNotification"), 0, 2);

    v11 = dispatch_queue_create("com.apple.passkit.pkpeerpaymentservice.reply", 0);
    v12 = (void *)*((_QWORD *)v3 + 4);
    *((_QWORD *)v3 + 4) = v11;

    *((_QWORD *)v3 + 5) = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
    v13 = objc_claimAutoreleasedReturnValue();
    self = (PKPeerPaymentService *)*((_QWORD *)v3 + 6);
    *((_QWORD *)v3 + 6) = v13;
LABEL_7:

  }
  return (PKPeerPaymentService *)v3;
}

- (PKPeerPaymentAccount)account
{
  os_unfair_lock_s *p_accountLock;
  char v5;
  id v6;
  int v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  id *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = (id *)&v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__85;
  v17 = __Block_byref_object_dispose__85;
  v18 = 0;
  p_accountLock = &self->_accountLock;
  os_unfair_lock_lock(&self->_accountLock);
  objc_storeStrong(v14 + 5, self->_account);
  os_unfair_lock_unlock(p_accountLock);
  v5 = objc_msgSend(v14[5], "isAccountStateDirty");
  v6 = v14[5];
  if ((v5 & 1) != 0)
    goto LABEL_5;
  v7 = objc_msgSend(v6, "isAccountOutOfDate");
  v6 = v14[5];
  if (!v6)
    v7 = 1;
  if (v7 == 1)
  {
LABEL_5:
    v8 = v6;
    -[PKPeerPaymentService _synchronousRemoteObjectProxyForSelector:](self, "_synchronousRemoteObjectProxyForSelector:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __31__PKPeerPaymentService_account__block_invoke;
    v12[3] = &unk_1E2ADD728;
    v12[4] = &v13;
    objc_msgSend(v9, "accountWithCompletion:", v12);

    os_unfair_lock_lock(p_accountLock);
    objc_storeStrong((id *)&self->_account, v14[5]);
    -[PKPeerPaymentService _postAccountChangeNotificationIfNecessaryForAccount:previousAccount:](self, "_postAccountChangeNotificationIfNecessaryForAccount:previousAccount:", self->_account, v8);
    os_unfair_lock_unlock(p_accountLock);

    v6 = v14[5];
  }
  v10 = v6;
  _Block_object_dispose(&v13, 8);

  return (PKPeerPaymentAccount *)v10;
}

- (id)_synchronousRemoteObjectProxyForSelector:(SEL)a3
{
  PKXPCService *remoteService;
  _QWORD v5[6];

  remoteService = self->_remoteService;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__PKPeerPaymentService__synchronousRemoteObjectProxyForSelector___block_invoke;
  v5[3] = &unk_1E2AC3158;
  v5[4] = self;
  v5[5] = a3;
  -[PKXPCService synchronousRemoteObjectProxyWithErrorHandler:](remoteService, "synchronousRemoteObjectProxyWithErrorHandler:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_postAccountChangeNotificationIfNecessaryForAccount:(id)a3 previousAccount:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[8];
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6 && a4)
  {
    if ((objc_msgSend(v6, "isEqual:", a4) & 1) != 0)
      goto LABEL_12;
  }
  else if (v6 == a4)
  {
    goto LABEL_12;
  }
  PKLogFacilityTypeGetObject(0xBuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Posting PKPeerPaymentServiceAccountChangedNotification", v12, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
  {
    v13 = CFSTR("account");
    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("PKPeerPaymentServiceAccountChangedNotification"), self, v11);

  }
  else
  {
    objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("PKPeerPaymentServiceAccountChangedNotification"), self, 0);
  }

LABEL_12:
}

+ (PKPeerPaymentService)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__PKPeerPaymentService_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_291 != -1)
    dispatch_once(&_MergedGlobals_291, block);
  return (PKPeerPaymentService *)(id)qword_1ECF22CD0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentService;
  -[PKPeerPaymentService dealloc](&v4, sel_dealloc);
}

- (void)registerObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    -[NSHashTable addObject:](self->_observers, "addObject:", v4);
    os_unfair_lock_unlock(&self->_lockObservers);
  }

}

- (void)unregisterObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_lockObservers);
  }

}

- (void)_accessObserversWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *replyQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    -[NSHashTable allObjects](self->_observers, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_lockObservers);
    replyQueue = self->_replyQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __52__PKPeerPaymentService__accessObserversWithHandler___block_invoke;
    v8[3] = &unk_1E2ABE058;
    v9 = v5;
    v10 = v4;
    v7 = v5;
    dispatch_async(replyQueue, v8);

  }
}

void __52__PKPeerPaymentService__accessObserversWithHandler___block_invoke(uint64_t a1)
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
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (PKPeerPaymentWebServiceContext)sharedPeerPaymentWebServiceContext
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint8_t v7[8];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__85;
  v13 = __Block_byref_object_dispose__85;
  v14 = 0;
  -[PKPeerPaymentService _synchronousRemoteObjectProxyForSelector:](self, "_synchronousRemoteObjectProxyForSelector:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__PKPeerPaymentService_sharedPeerPaymentWebServiceContext__block_invoke;
  v8[3] = &unk_1E2ADD6D8;
  v8[4] = &v9;
  objc_msgSend(v2, "usingSynchronousProxy:fetchSharedPeerPaymentWebServiceContextWithHandler:", 1, v8);

  v3 = (void *)v10[5];
  if (!v3)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Failed to get a non nil shared peer payment web service context.", v7, 2u);
    }

    v3 = (void *)v10[5];
  }
  v5 = v3;
  _Block_object_dispose(&v9, 8);

  return (PKPeerPaymentWebServiceContext *)v5;
}

void __58__PKPeerPaymentService_sharedPeerPaymentWebServiceContext__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)setSharedPeerPaymentWebServiceContext:(id)a3
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = a3;
  if (v5)
  {
    -[PKPeerPaymentService _synchronousRemoteObjectProxyForSelector:](self, "_synchronousRemoteObjectProxyForSelector:", a2);
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject usingSynchronousProxy:setSharedPeerPaymentWebServiceContext:withCompletion:](v6, "usingSynchronousProxy:setSharedPeerPaymentWebServiceContext:withCompletion:", 1, v5, &__block_literal_global_227);
  }
  else
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Attempt to set the shared peer payment web service context to nil. Ignoring.", v7, 2u);
    }
  }

}

- (void)sharedPeerPaymentWebServiceContextWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PKPeerPaymentService_sharedPeerPaymentWebServiceContextWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __73__PKPeerPaymentService_sharedPeerPaymentWebServiceContextWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ADD700;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "usingSynchronousProxy:fetchSharedPeerPaymentWebServiceContextWithHandler:", 0, v11);

}

void __73__PKPeerPaymentService_sharedPeerPaymentWebServiceContextWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__PKPeerPaymentService_sharedPeerPaymentWebServiceContextWithCompletion___block_invoke_22;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __73__PKPeerPaymentService_sharedPeerPaymentWebServiceContextWithCompletion___block_invoke_22(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __73__PKPeerPaymentService_sharedPeerPaymentWebServiceContextWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (PKPeerPaymentPreferences)preferences
{
  os_unfair_lock_s *p_accountLock;
  int v5;
  id v6;
  int v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  id *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = (id *)&v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__85;
  v16 = __Block_byref_object_dispose__85;
  v17 = 0;
  p_accountLock = &self->_accountLock;
  os_unfair_lock_lock(&self->_accountLock);
  objc_storeStrong(v13 + 5, self->_preferences);
  os_unfair_lock_unlock(p_accountLock);
  if ((objc_msgSend(v13[5], "isDirty") & 1) != 0
    || ((v5 = objc_msgSend(v13[5], "isOutOfDate"), (v6 = v13[5]) == 0) ? (v7 = 1) : (v7 = v5), v7 == 1))
  {
    -[PKPeerPaymentService _synchronousRemoteObjectProxyForSelector:](self, "_synchronousRemoteObjectProxyForSelector:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __35__PKPeerPaymentService_preferences__block_invoke;
    v11[3] = &unk_1E2ADD750;
    v11[4] = &v12;
    objc_msgSend(v8, "preferencesWithCompletion:", v11);

    os_unfair_lock_lock(p_accountLock);
    objc_storeStrong((id *)&self->_preferences, v13[5]);
    os_unfair_lock_unlock(p_accountLock);
    v6 = v13[5];
  }
  v9 = v6;
  _Block_object_dispose(&v12, 8);

  return (PKPeerPaymentPreferences *)v9;
}

void __35__PKPeerPaymentService_preferences__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)accountWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__PKPeerPaymentService_accountWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __46__PKPeerPaymentService_accountWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ACD738;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "accountWithCompletion:", v11);

}

void __46__PKPeerPaymentService_accountWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__PKPeerPaymentService_accountWithCompletion___block_invoke_25;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __46__PKPeerPaymentService_accountWithCompletion___block_invoke_25(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __46__PKPeerPaymentService_accountWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  _QWORD block[4];
  id v13;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__PKPeerPaymentService_accountWithCompletion___block_invoke_3;
  v9[3] = &unk_1E2ABE030;
  v6 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = v6;
  v7 = v9;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v13 = v7;
  v8 = v3;
  dispatch_async(v4, block);

}

void __46__PKPeerPaymentService_accountWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_postAccountChangeNotificationIfNecessaryForAccount:previousAccount:", *(_QWORD *)(a1 + 40), v3);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 40));

}

- (void)preferencesWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__PKPeerPaymentService_preferencesWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __50__PKPeerPaymentService_preferencesWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ADD778;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "preferencesWithCompletion:", v11);

}

void __50__PKPeerPaymentService_preferencesWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__PKPeerPaymentService_preferencesWithCompletion___block_invoke_26;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __50__PKPeerPaymentService_preferencesWithCompletion___block_invoke_26(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __50__PKPeerPaymentService_preferencesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  _QWORD block[4];
  id v13;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__PKPeerPaymentService_preferencesWithCompletion___block_invoke_3;
  v9[3] = &unk_1E2ABE030;
  v6 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = v6;
  v7 = v9;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v13 = v7;
  v8 = v3;
  dispatch_async(v4, block);

}

uint64_t __50__PKPeerPaymentService_preferencesWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

- (void)updateAccountWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PKPeerPaymentService_updateAccountWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __52__PKPeerPaymentService_updateAccountWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ACD738;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "updateAccountWithCompletion:", v11);

}

void __52__PKPeerPaymentService_updateAccountWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__PKPeerPaymentService_updateAccountWithCompletion___block_invoke_27;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __52__PKPeerPaymentService_updateAccountWithCompletion___block_invoke_27(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __52__PKPeerPaymentService_updateAccountWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__PKPeerPaymentService_updateAccountWithCompletion___block_invoke_3;
  v10[3] = &unk_1E2ABE030;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v11 = v3;
  v12 = v6;
  v13 = v7;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __52__PKPeerPaymentService_updateAccountWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t result;

  if (*(_QWORD *)(a1 + 32))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 40));
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(void **)(v2 + 16);
    v4 = *(id *)(a1 + 32);
    v5 = *(void **)(v2 + 16);
    *(_QWORD *)(v2 + 16) = v4;
    v6 = v3;

    objc_msgSend(*(id *)(a1 + 40), "_postAccountChangeNotificationIfNecessaryForAccount:previousAccount:", *(_QWORD *)(a1 + 32), v6);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 40));

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)updateAssociatedAccountsWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PKPeerPaymentService_updateAssociatedAccountsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __63__PKPeerPaymentService_updateAssociatedAccountsWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ACD738;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "updateAssociatedAccountsWithCompletion:", v11);

}

void __63__PKPeerPaymentService_updateAssociatedAccountsWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__PKPeerPaymentService_updateAssociatedAccountsWithCompletion___block_invoke_28;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __63__PKPeerPaymentService_updateAssociatedAccountsWithCompletion___block_invoke_28(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __63__PKPeerPaymentService_updateAssociatedAccountsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__PKPeerPaymentService_updateAssociatedAccountsWithCompletion___block_invoke_3;
  v10[3] = &unk_1E2ABE030;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v11 = v3;
  v12 = v6;
  v13 = v7;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __63__PKPeerPaymentService_updateAssociatedAccountsWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t result;

  if (*(_QWORD *)(a1 + 32))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 40));
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(void **)(v2 + 16);
    v4 = *(id *)(a1 + 32);
    v5 = *(void **)(v2 + 16);
    *(_QWORD *)(v2 + 16) = v4;
    v6 = v3;

    objc_msgSend(*(id *)(a1 + 40), "_postAccountChangeNotificationIfNecessaryForAccount:previousAccount:", *(_QWORD *)(a1 + 32), v6);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 40));

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)updateAccountAndAssociatedAccountsWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PKPeerPaymentService_updateAccountAndAssociatedAccountsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __73__PKPeerPaymentService_updateAccountAndAssociatedAccountsWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ACD738;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "updateAccountAndAssociatedAccountsWithCompletion:", v11);

}

void __73__PKPeerPaymentService_updateAccountAndAssociatedAccountsWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__PKPeerPaymentService_updateAccountAndAssociatedAccountsWithCompletion___block_invoke_29;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __73__PKPeerPaymentService_updateAccountAndAssociatedAccountsWithCompletion___block_invoke_29(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __73__PKPeerPaymentService_updateAccountAndAssociatedAccountsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__PKPeerPaymentService_updateAccountAndAssociatedAccountsWithCompletion___block_invoke_3;
  v10[3] = &unk_1E2ABE030;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v11 = v3;
  v12 = v6;
  v13 = v7;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __73__PKPeerPaymentService_updateAccountAndAssociatedAccountsWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t result;

  if (*(_QWORD *)(a1 + 32))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 40));
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(void **)(v2 + 16);
    v4 = *(id *)(a1 + 32);
    v5 = *(void **)(v2 + 16);
    *(_QWORD *)(v2 + 16) = v4;
    v6 = v3;

    objc_msgSend(*(id *)(a1 + 40), "_postAccountChangeNotificationIfNecessaryForAccount:previousAccount:", *(_QWORD *)(a1 + 32), v6);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 40));

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)updatePreferencesWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PKPeerPaymentService_updatePreferencesWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __56__PKPeerPaymentService_updatePreferencesWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ADD778;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "updatePreferencesWithCompletion:", v11);

}

void __56__PKPeerPaymentService_updatePreferencesWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__PKPeerPaymentService_updatePreferencesWithCompletion___block_invoke_30;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __56__PKPeerPaymentService_updatePreferencesWithCompletion___block_invoke_30(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __56__PKPeerPaymentService_updatePreferencesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__PKPeerPaymentService_updatePreferencesWithCompletion___block_invoke_3;
  v10[3] = &unk_1E2ABE030;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v11 = v3;
  v12 = v6;
  v13 = v7;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __56__PKPeerPaymentService_updatePreferencesWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  if (*(_QWORD *)(a1 + 32))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 40));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 24), *(id *)(a1 + 32));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 40));
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)deleteAccountWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PKPeerPaymentService_deleteAccountWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __52__PKPeerPaymentService_deleteAccountWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABE058;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "deleteAccountWithCompletion:", v11);

}

void __52__PKPeerPaymentService_deleteAccountWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__PKPeerPaymentService_deleteAccountWithCompletion___block_invoke_31;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __52__PKPeerPaymentService_deleteAccountWithCompletion___block_invoke_31(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __52__PKPeerPaymentService_deleteAccountWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  _QWORD v6[5];
  id v7;
  _QWORD block[4];
  id v9;

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__PKPeerPaymentService_deleteAccountWithCompletion___block_invoke_3;
  v6[3] = &unk_1E2ABE058;
  v4 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = v6;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v9 = v5;
  dispatch_async(v2, block);

}

void __52__PKPeerPaymentService_deleteAccountWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_postAccountChangeNotificationIfNecessaryForAccount:previousAccount:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), v5);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(void))(v4 + 16))();

}

- (void)deletePreferencesWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PKPeerPaymentService_deletePreferencesWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __56__PKPeerPaymentService_deletePreferencesWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABE058;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "deletePreferencesWithCompletion:", v11);

}

void __56__PKPeerPaymentService_deletePreferencesWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__PKPeerPaymentService_deletePreferencesWithCompletion___block_invoke_32;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __56__PKPeerPaymentService_deletePreferencesWithCompletion___block_invoke_32(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __56__PKPeerPaymentService_deletePreferencesWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  _QWORD v6[5];
  id v7;
  _QWORD block[4];
  id v9;

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__PKPeerPaymentService_deletePreferencesWithCompletion___block_invoke_3;
  v6[3] = &unk_1E2ABE058;
  v4 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = v6;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v9 = v5;
  dispatch_async(v2, block);

}

uint64_t __56__PKPeerPaymentService_deletePreferencesWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setPreferences:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__PKPeerPaymentService_setPreferences_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __50__PKPeerPaymentService_setPreferences_completion___block_invoke_2;
  v14[3] = &unk_1E2ADD7A0;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "setPreferences:completion:", v10, v14);

}

void __50__PKPeerPaymentService_setPreferences_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__PKPeerPaymentService_setPreferences_completion___block_invoke_33;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __50__PKPeerPaymentService_setPreferences_completion___block_invoke_33(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __50__PKPeerPaymentService_setPreferences_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD block[4];
  id v19;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__PKPeerPaymentService_setPreferences_completion___block_invoke_3;
  v13[3] = &unk_1E2ABDB58;
  v9 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = v6;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v9;
  v10 = v13;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v19 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v7, block);

}

uint64_t __50__PKPeerPaymentService_setPreferences_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)suspendAccountChangedNotifications
{
  if ((PKPeerPaymentService *)qword_1ECF22CD0 != self)
    ++self->_accountChangedNotificationSuspensionCount;
}

- (void)resumeAccountChangedNotifications
{
  if ((PKPeerPaymentService *)qword_1ECF22CD0 != self)
    --self->_accountChangedNotificationSuspensionCount;
}

- (void)registrationStatusWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__PKPeerPaymentService_registrationStatusWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __57__PKPeerPaymentService_registrationStatusWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2AC3E70;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "registrationStatusWithCompletion:", v11);

}

void __57__PKPeerPaymentService_registrationStatusWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__PKPeerPaymentService_registrationStatusWithCompletion___block_invoke_35;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __57__PKPeerPaymentService_registrationStatusWithCompletion___block_invoke_35(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __57__PKPeerPaymentService_registrationStatusWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;
  _QWORD block[4];
  id v11;

  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__PKPeerPaymentService_registrationStatusWithCompletion___block_invoke_3;
  v7[3] = &unk_1E2ABDBD0;
  v8 = *(id *)(a1 + 40);
  v9 = a2;
  v7[4] = *(_QWORD *)(a1 + 32);
  v6 = v7;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v11 = v6;
  dispatch_async(v4, block);

}

uint64_t __57__PKPeerPaymentService_registrationStatusWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 48));
  return result;
}

- (void)presentIdentityVerificationFlowWithResponse:(id)a3 orientation:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD aBlock[5];
  id v21;
  SEL v22;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__PKPeerPaymentService_presentIdentityVerificationFlowWithResponse_orientation_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v22 = a2;
  v11 = v9;
  aBlock[4] = self;
  v21 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rawData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __91__PKPeerPaymentService_presentIdentityVerificationFlowWithResponse_orientation_completion___block_invoke_2;
  v18[3] = &unk_1E2ABDDB0;
  v18[4] = self;
  v19 = v11;
  v17 = v11;
  objc_msgSend(v15, "presentIdentityVerificationFlowWithResponseData:orientation:completion:", v16, v12, v18);

}

void __91__PKPeerPaymentService_presentIdentityVerificationFlowWithResponse_orientation_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__PKPeerPaymentService_presentIdentityVerificationFlowWithResponse_orientation_completion___block_invoke_37;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __91__PKPeerPaymentService_presentIdentityVerificationFlowWithResponse_orientation_completion___block_invoke_37(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __91__PKPeerPaymentService_presentIdentityVerificationFlowWithResponse_orientation_completion___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  char v10;
  _QWORD block[4];
  id v12;

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__PKPeerPaymentService_presentIdentityVerificationFlowWithResponse_orientation_completion___block_invoke_3;
  v8[3] = &unk_1E2ABDAB8;
  v6 = *(id *)(a1 + 40);
  v10 = a2;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v12 = v7;
  dispatch_async(v4, block);

}

uint64_t __91__PKPeerPaymentService_presentIdentityVerificationFlowWithResponse_orientation_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (void)presentRegistrationFlowWithAccount:(id)a3 amount:(id)a4 state:(unint64_t)a5 senderAddress:(id)a6 orientation:(id)a7 hostSceneIdentifier:(id)a8 hostSceneBundleIdentifier:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void (**v23)(_QWORD, _QWORD);
  id v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  uint8_t buf[16];
  _QWORD v32[5];
  id v33;
  _QWORD aBlock[5];
  id v35;
  SEL v36;

  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = (void (**)(_QWORD, _QWORD))v22;
  if (v16)
  {
    v29 = v18;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __155__PKPeerPaymentService_presentRegistrationFlowWithAccount_amount_state_senderAddress_orientation_hostSceneIdentifier_hostSceneBundleIdentifier_completion___block_invoke;
    aBlock[3] = &unk_1E2ABDBD0;
    v36 = a2;
    v24 = v22;
    aBlock[4] = self;
    v35 = v24;
    v25 = v17;
    v26 = _Block_copy(aBlock);
    -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __155__PKPeerPaymentService_presentRegistrationFlowWithAccount_amount_state_senderAddress_orientation_hostSceneIdentifier_hostSceneBundleIdentifier_completion___block_invoke_2;
    v32[3] = &unk_1E2ABDDB0;
    v32[4] = self;
    v33 = v24;
    v18 = v29;
    objc_msgSend(v27, "presentRegistrationFlowWithAccount:amount:state:senderAddress:orientation:hostSceneIdentifier:hostSceneBundleIdentifier:completion:", v16, v25, a5, v29, v19, v20, v21, v32);

  }
  else
  {
    v25 = v17;
    PKLogFacilityTypeGetObject(0xBuLL);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v28, OS_LOG_TYPE_DEFAULT, "Cannot present registration flow will a nil account", buf, 2u);
    }

    if (v23)
      v23[2](v23, 0);
  }

}

void __155__PKPeerPaymentService_presentRegistrationFlowWithAccount_amount_state_senderAddress_orientation_hostSceneIdentifier_hostSceneBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __155__PKPeerPaymentService_presentRegistrationFlowWithAccount_amount_state_senderAddress_orientation_hostSceneIdentifier_hostSceneBundleIdentifier_completion___block_invoke_39;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __155__PKPeerPaymentService_presentRegistrationFlowWithAccount_amount_state_senderAddress_orientation_hostSceneIdentifier_hostSceneBundleIdentifier_completion___block_invoke_39(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __155__PKPeerPaymentService_presentRegistrationFlowWithAccount_amount_state_senderAddress_orientation_hostSceneIdentifier_hostSceneBundleIdentifier_completion___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  char v10;
  _QWORD block[4];
  id v12;

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __155__PKPeerPaymentService_presentRegistrationFlowWithAccount_amount_state_senderAddress_orientation_hostSceneIdentifier_hostSceneBundleIdentifier_completion___block_invoke_3;
  v8[3] = &unk_1E2ABDAB8;
  v6 = *(id *)(a1 + 40);
  v10 = a2;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v12 = v7;
  dispatch_async(v4, block);

}

uint64_t __155__PKPeerPaymentService_presentRegistrationFlowWithAccount_amount_state_senderAddress_orientation_hostSceneIdentifier_hostSceneBundleIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (void)presentRegistrationFlowWithAccount:(id)a3 orientation:(id)a4 hostSceneIdentifier:(id)a5 hostSceneBundleIdentifier:(id)a6 completion:(id)a7
{
  -[PKPeerPaymentService presentRegistrationFlowWithAccount:amount:state:senderAddress:orientation:hostSceneIdentifier:hostSceneBundleIdentifier:completion:](self, "presentRegistrationFlowWithAccount:amount:state:senderAddress:orientation:hostSceneIdentifier:hostSceneBundleIdentifier:completion:", a3, 0, 0, 0, a4, a5, a6, a7);
}

- (void)presentPeerPaymentTermsAndConditionsWithAccount:(id)a3 orientation:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  _QWORD v20[5];
  id v21;
  _QWORD aBlock[5];
  id v23;
  SEL v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "termsIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "termsURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "associatedPassUniqueID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_DWORD *)buf = 138412290;
    v26 = v9;
    v19 = "Cannot present terms and conditions with a nil termsURL for acount %@";
    goto LABEL_11;
  }
  if (!objc_msgSend(v12, "length"))
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_DWORD *)buf = 138412290;
    v26 = v9;
    v19 = "Cannot present terms and conditions with a nil termsIdentifier for acount %@";
    goto LABEL_11;
  }
  if ((objc_msgSend(v9, "termsAcceptanceRequired") & 1) != 0)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __95__PKPeerPaymentService_presentPeerPaymentTermsAndConditionsWithAccount_orientation_completion___block_invoke;
    aBlock[3] = &unk_1E2ABDBD0;
    v24 = a2;
    v15 = v11;
    aBlock[4] = self;
    v23 = v15;
    v16 = _Block_copy(aBlock);
    -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __95__PKPeerPaymentService_presentPeerPaymentTermsAndConditionsWithAccount_orientation_completion___block_invoke_2;
    v20[3] = &unk_1E2ABDDB0;
    v20[4] = self;
    v21 = v15;
    objc_msgSend(v17, "presentPeerPaymentTermsAndConditionsWithTermsURL:termsIdentifier:passUniqueID:orientation:completion:", v13, v12, v14, v10, v20);

    goto LABEL_14;
  }
  PKLogFacilityTypeGetObject(0xBuLL);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v9;
    v19 = "The user does not need to accept terms for account %@";
LABEL_11:
    _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
  }
LABEL_12:

  if (v11)
    (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
LABEL_14:

}

void __95__PKPeerPaymentService_presentPeerPaymentTermsAndConditionsWithAccount_orientation_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __95__PKPeerPaymentService_presentPeerPaymentTermsAndConditionsWithAccount_orientation_completion___block_invoke_40;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __95__PKPeerPaymentService_presentPeerPaymentTermsAndConditionsWithAccount_orientation_completion___block_invoke_40(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __95__PKPeerPaymentService_presentPeerPaymentTermsAndConditionsWithAccount_orientation_completion___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  char v10;
  _QWORD block[4];
  id v12;

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __95__PKPeerPaymentService_presentPeerPaymentTermsAndConditionsWithAccount_orientation_completion___block_invoke_3;
  v8[3] = &unk_1E2ABDAB8;
  v6 = *(id *)(a1 + 40);
  v10 = a2;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v12 = v7;
  dispatch_async(v4, block);

}

uint64_t __95__PKPeerPaymentService_presentPeerPaymentTermsAndConditionsWithAccount_orientation_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (void)receivedPeerPaymentMessageData:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD aBlock[6];

  if (a3)
  {
    v4 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__PKPeerPaymentService_receivedPeerPaymentMessageData___block_invoke;
    aBlock[3] = &unk_1E2AC4430;
    aBlock[4] = self;
    aBlock[5] = a2;
    v5 = a3;
    v6 = _Block_copy(aBlock);
    -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __55__PKPeerPaymentService_receivedPeerPaymentMessageData___block_invoke_41;
    v8[3] = &unk_1E2ABE120;
    v8[4] = self;
    objc_msgSend(v7, "receivedPeerPaymentMessageData:handler:", v5, v8);

  }
}

void __55__PKPeerPaymentService_receivedPeerPaymentMessageData___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

- (void)updateMessageReceivedDate:(id)a3 forTransactionWithIdentifier:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD aBlock[6];

  if (a3)
  {
    if (a4)
    {
      v6 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __79__PKPeerPaymentService_updateMessageReceivedDate_forTransactionWithIdentifier___block_invoke;
      aBlock[3] = &unk_1E2AC4430;
      aBlock[4] = self;
      aBlock[5] = a2;
      v7 = a4;
      v8 = a3;
      v9 = _Block_copy(aBlock);
      -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v6;
      v11[1] = 3221225472;
      v11[2] = __79__PKPeerPaymentService_updateMessageReceivedDate_forTransactionWithIdentifier___block_invoke_42;
      v11[3] = &unk_1E2ABE120;
      v11[4] = self;
      objc_msgSend(v10, "updateMessageReceivedDate:forTransactionWithIdentifier:handler:", v8, v7, v11);

    }
  }
}

void __79__PKPeerPaymentService_updateMessageReceivedDate_forTransactionWithIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

- (void)updateMockAccountBalanceByAddingAmount:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint8_t v15[8];
  _QWORD v16[5];
  id v17;
  _QWORD aBlock[5];
  id v19;
  SEL v20;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD))v8;
  if (v7)
  {
    v10 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__PKPeerPaymentService_updateMockAccountBalanceByAddingAmount_completion___block_invoke;
    aBlock[3] = &unk_1E2ABDBD0;
    v20 = a2;
    v11 = v8;
    aBlock[4] = self;
    v19 = v11;
    v12 = _Block_copy(aBlock);
    -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __74__PKPeerPaymentService_updateMockAccountBalanceByAddingAmount_completion___block_invoke_2;
    v16[3] = &unk_1E2ADD7C8;
    v16[4] = self;
    v17 = v11;
    objc_msgSend(v13, "updateMockAccountBalanceByAddingAmount:completion:", v7, v16);

  }
  else
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Ignoring request to update mock account balance with nil amount", v15, 2u);
    }

    if (v9)
      v9[2](v9, 0);
  }

}

void __74__PKPeerPaymentService_updateMockAccountBalanceByAddingAmount_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__PKPeerPaymentService_updateMockAccountBalanceByAddingAmount_completion___block_invoke_43;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __74__PKPeerPaymentService_updateMockAccountBalanceByAddingAmount_completion___block_invoke_43(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __74__PKPeerPaymentService_updateMockAccountBalanceByAddingAmount_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__PKPeerPaymentService_updateMockAccountBalanceByAddingAmount_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __74__PKPeerPaymentService_updateMockAccountBalanceByAddingAmount_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (id)balanceForPass:(id)a3
{
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v5 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__85;
  v14 = __Block_byref_object_dispose__85;
  v15 = 0;
  -[PKPeerPaymentService _synchronousRemoteObjectProxyForSelector:](self, "_synchronousRemoteObjectProxyForSelector:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__PKPeerPaymentService_balanceForPass___block_invoke;
  v9[3] = &unk_1E2ADD7F0;
  v9[4] = &v10;
  objc_msgSend(v6, "balanceForPass:completion:", v5, v9);
  v7 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v7;
}

void __39__PKPeerPaymentService_balanceForPass___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)setLastUsedAlternateFundingSourcePassUniqueIdentifier:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[PKPeerPaymentService _synchronousRemoteObjectProxyForSelector:](self, "_synchronousRemoteObjectProxyForSelector:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLastUsedAlternateFundingSourcePassUniqueIdentifier:handler:", v5, &__block_literal_global_45_1);

}

- (id)lastUsedAlternateFundingSourcePassUniqueIdentifier
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__85;
  v11 = __Block_byref_object_dispose__85;
  v12 = 0;
  -[PKPeerPaymentService _synchronousRemoteObjectProxyForSelector:](self, "_synchronousRemoteObjectProxyForSelector:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__PKPeerPaymentService_lastUsedAlternateFundingSourcePassUniqueIdentifier__block_invoke;
  v6[3] = &unk_1E2ADD818;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "lastUsedAlternateFundingSourcePassUniqueIdentifier:", v6);
  v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __74__PKPeerPaymentService_lastUsedAlternateFundingSourcePassUniqueIdentifier__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

- (void)downloadPassIfNecessaryWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PKPeerPaymentService_downloadPassIfNecessaryWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __62__PKPeerPaymentService_downloadPassIfNecessaryWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABDDB0;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "downloadPassIfNecessaryWithCompletion:", v11);

}

void __62__PKPeerPaymentService_downloadPassIfNecessaryWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__PKPeerPaymentService_downloadPassIfNecessaryWithCompletion___block_invoke_47;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __62__PKPeerPaymentService_downloadPassIfNecessaryWithCompletion___block_invoke_47(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __62__PKPeerPaymentService_downloadPassIfNecessaryWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  char v10;
  _QWORD block[4];
  id v12;

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__PKPeerPaymentService_downloadPassIfNecessaryWithCompletion___block_invoke_3;
  v8[3] = &unk_1E2ABDAB8;
  v6 = *(id *)(a1 + 40);
  v10 = a2;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v12 = v7;
  dispatch_async(v4, block);

}

uint64_t __62__PKPeerPaymentService_downloadPassIfNecessaryWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (void)registerDeviceWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PKPeerPaymentService_registerDeviceWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __53__PKPeerPaymentService_registerDeviceWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABDF68;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "registerDeviceWithCompletion:", v11);

}

void __53__PKPeerPaymentService_registerDeviceWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__PKPeerPaymentService_registerDeviceWithCompletion___block_invoke_48;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __53__PKPeerPaymentService_registerDeviceWithCompletion___block_invoke_48(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __53__PKPeerPaymentService_registerDeviceWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  char v16;
  _QWORD block[4];
  id v18;

  v5 = a3;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__PKPeerPaymentService_registerDeviceWithCompletion___block_invoke_3;
  v12[3] = &unk_1E2ABDC70;
  v8 = *(id *)(a1 + 40);
  v16 = a2;
  v9 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v9;
  v15 = v8;
  v10 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v18 = v10;
  v11 = v5;
  dispatch_async(v6, block);

}

uint64_t __53__PKPeerPaymentService_registerDeviceWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)registerDeviceWithForceReregister:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD aBlock[5];
  id v16;
  SEL v17;

  v4 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PKPeerPaymentService_registerDeviceWithForceReregister_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v17 = a2;
  v9 = v7;
  aBlock[4] = self;
  v16 = v9;
  v10 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __69__PKPeerPaymentService_registerDeviceWithForceReregister_completion___block_invoke_2;
  v13[3] = &unk_1E2ABDF68;
  v13[4] = self;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "registerDeviceWithForceReregister:completion:", v4, v13);

}

void __69__PKPeerPaymentService_registerDeviceWithForceReregister_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__PKPeerPaymentService_registerDeviceWithForceReregister_completion___block_invoke_50;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __69__PKPeerPaymentService_registerDeviceWithForceReregister_completion___block_invoke_50(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __69__PKPeerPaymentService_registerDeviceWithForceReregister_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  char v16;
  _QWORD block[4];
  id v18;

  v5 = a3;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__PKPeerPaymentService_registerDeviceWithForceReregister_completion___block_invoke_3;
  v12[3] = &unk_1E2ABDC70;
  v8 = *(id *)(a1 + 40);
  v16 = a2;
  v9 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v9;
  v15 = v8;
  v10 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v18 = v10;
  v11 = v5;
  dispatch_async(v6, block);

}

uint64_t __69__PKPeerPaymentService_registerDeviceWithForceReregister_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)registerDeviceWithRegistrationURL:(id)a3 pushToken:(id)a4 forceReregister:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD aBlock[5];
  id v22;
  SEL v23;

  v6 = a5;
  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__PKPeerPaymentService_registerDeviceWithRegistrationURL_pushToken_forceReregister_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v23 = a2;
  v13 = v11;
  aBlock[4] = self;
  v22 = v13;
  v14 = a4;
  v15 = a3;
  v16 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __95__PKPeerPaymentService_registerDeviceWithRegistrationURL_pushToken_forceReregister_completion___block_invoke_2;
  v19[3] = &unk_1E2ABDF68;
  v19[4] = self;
  v20 = v13;
  v18 = v13;
  objc_msgSend(v17, "registerDeviceWithRegistrationURL:pushToken:forceReregister:completion:", v15, v14, v6, v19);

}

void __95__PKPeerPaymentService_registerDeviceWithRegistrationURL_pushToken_forceReregister_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __95__PKPeerPaymentService_registerDeviceWithRegistrationURL_pushToken_forceReregister_completion___block_invoke_51;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __95__PKPeerPaymentService_registerDeviceWithRegistrationURL_pushToken_forceReregister_completion___block_invoke_51(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __95__PKPeerPaymentService_registerDeviceWithRegistrationURL_pushToken_forceReregister_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  char v16;
  _QWORD block[4];
  id v18;

  v5 = a3;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __95__PKPeerPaymentService_registerDeviceWithRegistrationURL_pushToken_forceReregister_completion___block_invoke_3;
  v12[3] = &unk_1E2ABDC70;
  v8 = *(id *)(a1 + 40);
  v16 = a2;
  v9 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v9;
  v15 = v8;
  v10 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v18 = v10;
  v11 = v5;
  dispatch_async(v6, block);

}

uint64_t __95__PKPeerPaymentService_registerDeviceWithRegistrationURL_pushToken_forceReregister_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)unregisterDeviceWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PKPeerPaymentService_unregisterDeviceWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __55__PKPeerPaymentService_unregisterDeviceWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABDF68;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "unregisterDeviceWithCompletion:", v11);

}

void __55__PKPeerPaymentService_unregisterDeviceWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__PKPeerPaymentService_unregisterDeviceWithCompletion___block_invoke_52;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __55__PKPeerPaymentService_unregisterDeviceWithCompletion___block_invoke_52(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __55__PKPeerPaymentService_unregisterDeviceWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  char v16;
  _QWORD block[4];
  id v18;

  v5 = a3;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__PKPeerPaymentService_unregisterDeviceWithCompletion___block_invoke_3;
  v12[3] = &unk_1E2ABDC70;
  v8 = *(id *)(a1 + 40);
  v16 = a2;
  v9 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v9;
  v15 = v8;
  v10 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v18 = v10;
  v11 = v5;
  dispatch_async(v6, block);

}

uint64_t __55__PKPeerPaymentService_unregisterDeviceWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)initalizeCloudStoreIfNecessaryWithHandler:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PKPeerPaymentService_initalizeCloudStoreIfNecessaryWithHandler___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __66__PKPeerPaymentService_initalizeCloudStoreIfNecessaryWithHandler___block_invoke_2;
  v11[3] = &unk_1E2ABDF68;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "initalizeCloudStoreIfNecessaryWithHandler:", v11);

}

void __66__PKPeerPaymentService_initalizeCloudStoreIfNecessaryWithHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__PKPeerPaymentService_initalizeCloudStoreIfNecessaryWithHandler___block_invoke_53;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __66__PKPeerPaymentService_initalizeCloudStoreIfNecessaryWithHandler___block_invoke_53(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __66__PKPeerPaymentService_initalizeCloudStoreIfNecessaryWithHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  char v16;
  _QWORD block[4];
  id v18;

  v5 = a3;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__PKPeerPaymentService_initalizeCloudStoreIfNecessaryWithHandler___block_invoke_3;
  v12[3] = &unk_1E2ABDC70;
  v8 = *(id *)(a1 + 40);
  v16 = a2;
  v9 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v9;
  v15 = v8;
  v10 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v18 = v10;
  v11 = v5;
  dispatch_async(v6, block);

}

uint64_t __66__PKPeerPaymentService_initalizeCloudStoreIfNecessaryWithHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)cloudStoreStatusWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PKPeerPaymentService_cloudStoreStatusWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __55__PKPeerPaymentService_cloudStoreStatusWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ADB228;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "cloudStoreStatusWithCompletion:", v11);

}

void __55__PKPeerPaymentService_cloudStoreStatusWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__PKPeerPaymentService_cloudStoreStatusWithCompletion___block_invoke_54;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __55__PKPeerPaymentService_cloudStoreStatusWithCompletion___block_invoke_54(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, 0, 0, 0);
  return result;
}

void __55__PKPeerPaymentService_cloudStoreStatusWithCompletion___block_invoke_2(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  _QWORD *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  char v20;
  _QWORD block[4];
  id v22;

  v7 = a2;
  v8 = a4;
  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__PKPeerPaymentService_cloudStoreStatusWithCompletion___block_invoke_3;
  v15[3] = &unk_1E2ACAC98;
  v11 = *(id *)(a1 + 40);
  v20 = a3;
  v16 = v7;
  v17 = v8;
  v18 = *(_QWORD *)(a1 + 32);
  v19 = v11;
  v12 = v15;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v22 = v12;
  v13 = v8;
  v14 = v7;
  dispatch_async(v9, block);

}

uint64_t __55__PKPeerPaymentService_cloudStoreStatusWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)checkTLKsMissingWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PKPeerPaymentService_checkTLKsMissingWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __55__PKPeerPaymentService_checkTLKsMissingWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABDF68;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "checkTLKsMissingWithCompletion:", v11);

}

void __55__PKPeerPaymentService_checkTLKsMissingWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__PKPeerPaymentService_checkTLKsMissingWithCompletion___block_invoke_56;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __55__PKPeerPaymentService_checkTLKsMissingWithCompletion___block_invoke_56(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __55__PKPeerPaymentService_checkTLKsMissingWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  char v16;
  _QWORD block[4];
  id v18;

  v5 = a3;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__PKPeerPaymentService_checkTLKsMissingWithCompletion___block_invoke_3;
  v12[3] = &unk_1E2ABDC70;
  v8 = *(id *)(a1 + 40);
  v16 = a2;
  v9 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v9;
  v15 = v8;
  v10 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v18 = v10;
  v11 = v5;
  dispatch_async(v6, block);

}

uint64_t __55__PKPeerPaymentService_checkTLKsMissingWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)resetApplePayManateeViewWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PKPeerPaymentService_resetApplePayManateeViewWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __63__PKPeerPaymentService_resetApplePayManateeViewWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABDF68;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "resetApplePayManateeViewWithCompletion:", v11);

}

void __63__PKPeerPaymentService_resetApplePayManateeViewWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__PKPeerPaymentService_resetApplePayManateeViewWithCompletion___block_invoke_57;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __63__PKPeerPaymentService_resetApplePayManateeViewWithCompletion___block_invoke_57(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __63__PKPeerPaymentService_resetApplePayManateeViewWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  char v16;
  _QWORD block[4];
  id v18;

  v5 = a3;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__PKPeerPaymentService_resetApplePayManateeViewWithCompletion___block_invoke_3;
  v12[3] = &unk_1E2ABDC70;
  v8 = *(id *)(a1 + 40);
  v16 = a2;
  v9 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v9;
  v15 = v8;
  v10 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v18 = v10;
  v11 = v5;
  dispatch_async(v6, block);

}

uint64_t __63__PKPeerPaymentService_resetApplePayManateeViewWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)remoteRegistrationRequest:(id)a3 forHandle:(id)a4 completion:(id)a5
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
  _QWORD aBlock[5];
  id v20;
  SEL v21;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PKPeerPaymentService_remoteRegistrationRequest_forHandle_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v21 = a2;
  v11 = v9;
  aBlock[4] = self;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __71__PKPeerPaymentService_remoteRegistrationRequest_forHandle_completion___block_invoke_2;
  v17[3] = &unk_1E2ABDD88;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "remoteRegistrationRequest:forHandle:completion:", v13, v12, v17);

}

void __71__PKPeerPaymentService_remoteRegistrationRequest_forHandle_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__PKPeerPaymentService_remoteRegistrationRequest_forHandle_completion___block_invoke_58;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __71__PKPeerPaymentService_remoteRegistrationRequest_forHandle_completion___block_invoke_58(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __71__PKPeerPaymentService_remoteRegistrationRequest_forHandle_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__PKPeerPaymentService_remoteRegistrationRequest_forHandle_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __71__PKPeerPaymentService_remoteRegistrationRequest_forHandle_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)_accountChanged:(id)a3
{
  _QWORD v3[5];

  if (self->_accountChangedNotificationSuspensionCount <= 0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __40__PKPeerPaymentService__accountChanged___block_invoke;
    v3[3] = &unk_1E2ADD840;
    v3[4] = self;
    -[PKPeerPaymentService accountWithCompletion:](self, "accountWithCompletion:", v3);
  }
}

- (void)_preferencesChanged:(id)a3
{
  os_unfair_lock_s *p_accountLock;
  PKPeerPaymentPreferences *v5;
  PKPeerPaymentPreferences *v6;
  _QWORD v7[4];
  PKPeerPaymentPreferences *v8;
  PKPeerPaymentService *v9;

  p_accountLock = &self->_accountLock;
  os_unfair_lock_lock(&self->_accountLock);
  v5 = self->_preferences;
  os_unfair_lock_unlock(p_accountLock);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__PKPeerPaymentService__preferencesChanged___block_invoke;
  v7[3] = &unk_1E2ADD868;
  v8 = v5;
  v9 = self;
  v6 = v5;
  -[PKPeerPaymentService preferencesWithCompletion:](self, "preferencesWithCompletion:", v7);

}

void __44__PKPeerPaymentService__preferencesChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = *(_QWORD *)(a1 + 40);
    if (v3)
    {
      v8 = CFSTR("preferences");
      v9[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("PKPeerPaymentServicePreferencesChangedNotification"), v6, v7);

    }
    else
    {
      objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("PKPeerPaymentServicePreferencesChangedNotification"), v6, 0);
    }

  }
}

- (id)_remoteObjectProxyWithFailureHandler:(id)a3
{
  return -[PKXPCService remoteObjectProxyWithFailureHandler:](self->_remoteService, "remoteObjectProxyWithFailureHandler:", a3);
}

void __65__PKPeerPaymentService__synchronousRemoteObjectProxyForSelector___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

- (void)peerPaymentPendingRequestsForRequestTokens:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__PKPeerPaymentService_peerPaymentPendingRequestsForRequestTokens_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __78__PKPeerPaymentService_peerPaymentPendingRequestsForRequestTokens_completion___block_invoke_2;
  v14[3] = &unk_1E2ABE008;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "peerPaymentPendingRequestsForRequestTokens:completion:", v10, v14);

}

void __78__PKPeerPaymentService_peerPaymentPendingRequestsForRequestTokens_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xBuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__PKPeerPaymentService_peerPaymentPendingRequestsForRequestTokens_completion___block_invoke_66;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __78__PKPeerPaymentService_peerPaymentPendingRequestsForRequestTokens_completion___block_invoke_66(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __78__PKPeerPaymentService_peerPaymentPendingRequestsForRequestTokens_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__PKPeerPaymentService_peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __86__PKPeerPaymentService_peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABE008;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion:", v11);

}

void __86__PKPeerPaymentService_peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xBuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__PKPeerPaymentService_peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion___block_invoke_68;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __86__PKPeerPaymentService_peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion___block_invoke_68(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __86__PKPeerPaymentService_peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)insertOrUpdatePeerPaymentPendingRequests:(id)a3 shouldScheduleNotifications:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD aBlock[6];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__PKPeerPaymentService_insertOrUpdatePeerPaymentPendingRequests_shouldScheduleNotifications___block_invoke;
  aBlock[3] = &unk_1E2AC4430;
  aBlock[4] = self;
  aBlock[5] = a2;
  v8 = a3;
  v9 = _Block_copy(aBlock);
  PKLogFacilityTypeGetObject(0xBuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v11;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Calling -[PKPeerPaymentService %@];", buf, 0xCu);

  }
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __93__PKPeerPaymentService_insertOrUpdatePeerPaymentPendingRequests_shouldScheduleNotifications___block_invoke_69;
  v13[3] = &unk_1E2ABE120;
  v13[4] = self;
  objc_msgSend(v12, "insertOrUpdatePeerPaymentPendingRequests:shouldScheduleNotifications:completion:", v8, v4, v13);

}

void __93__PKPeerPaymentService_insertOrUpdatePeerPaymentPendingRequests_shouldScheduleNotifications___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xBuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

- (void)deletePeerPaymentPendingRequestsForRequestTokens:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD aBlock[6];

  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PKPeerPaymentService_deletePeerPaymentPendingRequestsForRequestTokens___block_invoke;
  aBlock[3] = &unk_1E2AC4430;
  aBlock[4] = self;
  aBlock[5] = a2;
  v5 = a3;
  v6 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __73__PKPeerPaymentService_deletePeerPaymentPendingRequestsForRequestTokens___block_invoke_70;
  v8[3] = &unk_1E2ABE120;
  v8[4] = self;
  objc_msgSend(v7, "deletePeerPaymentPendingRequestsForRequestTokens:completion:", v5, v8);

}

void __73__PKPeerPaymentService_deletePeerPaymentPendingRequestsForRequestTokens___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xBuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

- (void)deletePeerPaymentPendingRequestsForPeerPaymentAccount
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  _QWORD aBlock[5];

  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PKPeerPaymentService_deletePeerPaymentPendingRequestsForPeerPaymentAccount__block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = a2;
  v4 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __77__PKPeerPaymentService_deletePeerPaymentPendingRequestsForPeerPaymentAccount__block_invoke_71;
  v6[3] = &unk_1E2ABE120;
  v6[4] = self;
  objc_msgSend(v5, "deletePeerPaymentPendingRequestsForPeerPaymentAccountWithCompletion:", v6);

}

void __77__PKPeerPaymentService_deletePeerPaymentPendingRequestsForPeerPaymentAccount__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xBuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

- (void)pendingRequestsChanged
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xBuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Calling -[PKPeerPaymentService %@];", (uint8_t *)&v6, 0xCu);

  }
  -[PKPeerPaymentService _accessObserversWithHandler:](self, "_accessObserversWithHandler:", &__block_literal_global_73_0);
}

void __46__PKPeerPaymentService_pendingRequestsChanged__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "pendingRequestsChanged");

}

- (void)recurringPaymentsWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PKPeerPaymentService_recurringPaymentsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __56__PKPeerPaymentService_recurringPaymentsWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABE008;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "recurringPaymentsWithCompletion:", v11);

}

void __56__PKPeerPaymentService_recurringPaymentsWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xBuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__PKPeerPaymentService_recurringPaymentsWithCompletion___block_invoke_76;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __56__PKPeerPaymentService_recurringPaymentsWithCompletion___block_invoke_76(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __56__PKPeerPaymentService_recurringPaymentsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateAutoReloadAmount:(id)a3 threshold:(id)a4 identifier:(id)a5 completion:(id)a6
{
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD aBlock[5];
  id v23;
  SEL v24;

  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PKPeerPaymentService_updateAutoReloadAmount_threshold_identifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v24 = a2;
  v13 = v11;
  aBlock[4] = self;
  v23 = v13;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __79__PKPeerPaymentService_updateAutoReloadAmount_threshold_identifier_completion___block_invoke_2;
  v20[3] = &unk_1E2ADD8B0;
  v20[4] = self;
  v21 = v13;
  v19 = v13;
  objc_msgSend(v18, "updateAutoReloadAmount:threshold:identifier:completion:", v16, v15, v14, v20);

}

void __79__PKPeerPaymentService_updateAutoReloadAmount_threshold_identifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xBuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__PKPeerPaymentService_updateAutoReloadAmount_threshold_identifier_completion___block_invoke_77;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __79__PKPeerPaymentService_updateAutoReloadAmount_threshold_identifier_completion___block_invoke_77(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __79__PKPeerPaymentService_updateAutoReloadAmount_threshold_identifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateRecurringPaymentsWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PKPeerPaymentService_updateRecurringPaymentsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __62__PKPeerPaymentService_updateRecurringPaymentsWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2AC3558;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "updateRecurringPaymentsWithCompletion:", v11);

}

void __62__PKPeerPaymentService_updateRecurringPaymentsWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xBuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__PKPeerPaymentService_updateRecurringPaymentsWithCompletion___block_invoke_79;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __62__PKPeerPaymentService_updateRecurringPaymentsWithCompletion___block_invoke_79(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __62__PKPeerPaymentService_updateRecurringPaymentsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)insertOrUpdateRecurringPayments:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PKPeerPaymentService_insertOrUpdateRecurringPayments_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __67__PKPeerPaymentService_insertOrUpdateRecurringPayments_completion___block_invoke_2;
  v14[3] = &unk_1E2ABDA18;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "insertOrUpdateRecurringPayments:completion:", v10, v14);

}

void __67__PKPeerPaymentService_insertOrUpdateRecurringPayments_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xBuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__PKPeerPaymentService_insertOrUpdateRecurringPayments_completion___block_invoke_81;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __67__PKPeerPaymentService_insertOrUpdateRecurringPayments_completion___block_invoke_81(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __67__PKPeerPaymentService_insertOrUpdateRecurringPayments_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deleteRecurringPaymentsForIdentifiers:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PKPeerPaymentService_deleteRecurringPaymentsForIdentifiers_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __73__PKPeerPaymentService_deleteRecurringPaymentsForIdentifiers_completion___block_invoke_2;
  v14[3] = &unk_1E2ABDA18;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "deleteRecurringPaymentsForIdentifiers:completion:", v10, v14);

}

void __73__PKPeerPaymentService_deleteRecurringPaymentsForIdentifiers_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xBuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__PKPeerPaymentService_deleteRecurringPaymentsForIdentifiers_completion___block_invoke_82;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __73__PKPeerPaymentService_deleteRecurringPaymentsForIdentifiers_completion___block_invoke_82(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __73__PKPeerPaymentService_deleteRecurringPaymentsForIdentifiers_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deleteAllRecurringPaymentsWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PKPeerPaymentService_deleteAllRecurringPaymentsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __65__PKPeerPaymentService_deleteAllRecurringPaymentsWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABDA18;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "deleteAllRecurringPaymentsWithCompletion:", v11);

}

void __65__PKPeerPaymentService_deleteAllRecurringPaymentsWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xBuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__PKPeerPaymentService_deleteAllRecurringPaymentsWithCompletion___block_invoke_83;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __65__PKPeerPaymentService_deleteAllRecurringPaymentsWithCompletion___block_invoke_83(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __65__PKPeerPaymentService_deleteAllRecurringPaymentsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)performRecurringPaymentAction:(unint64_t)a3 identifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD aBlock[5];
  id v19;
  SEL v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PKPeerPaymentService_performRecurringPaymentAction_identifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v20 = a2;
  v11 = v9;
  aBlock[4] = self;
  v19 = v11;
  v12 = a4;
  v13 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __76__PKPeerPaymentService_performRecurringPaymentAction_identifier_completion___block_invoke_2;
  v16[3] = &unk_1E2ADD8D8;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "performRecurringPaymentAction:identifier:completion:", a3, v12, v16);

}

void __76__PKPeerPaymentService_performRecurringPaymentAction_identifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xBuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__PKPeerPaymentService_performRecurringPaymentAction_identifier_completion___block_invoke_84;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __76__PKPeerPaymentService_performRecurringPaymentAction_identifier_completion___block_invoke_84(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __76__PKPeerPaymentService_performRecurringPaymentAction_identifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateRecurringPaymentMemo:(id)a3 identifier:(id)a4 completion:(id)a5
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
  _QWORD aBlock[5];
  id v20;
  SEL v21;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PKPeerPaymentService_updateRecurringPaymentMemo_identifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v21 = a2;
  v11 = v9;
  aBlock[4] = self;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __73__PKPeerPaymentService_updateRecurringPaymentMemo_identifier_completion___block_invoke_2;
  v17[3] = &unk_1E2ADD8B0;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "updateRecurringPaymentMemo:identifier:completion:", v13, v12, v17);

}

void __73__PKPeerPaymentService_updateRecurringPaymentMemo_identifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xBuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__PKPeerPaymentService_updateRecurringPaymentMemo_identifier_completion___block_invoke_86;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __73__PKPeerPaymentService_updateRecurringPaymentMemo_identifier_completion___block_invoke_86(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __73__PKPeerPaymentService_updateRecurringPaymentMemo_identifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateRecurringPaymentStatus:(unint64_t)a3 identifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD aBlock[5];
  id v19;
  SEL v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PKPeerPaymentService_updateRecurringPaymentStatus_identifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v20 = a2;
  v11 = v9;
  aBlock[4] = self;
  v19 = v11;
  v12 = a4;
  v13 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __75__PKPeerPaymentService_updateRecurringPaymentStatus_identifier_completion___block_invoke_2;
  v16[3] = &unk_1E2ADD8B0;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "updateRecurringPaymentStatus:identifier:completion:", a3, v12, v16);

}

void __75__PKPeerPaymentService_updateRecurringPaymentStatus_identifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xBuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__PKPeerPaymentService_updateRecurringPaymentStatus_identifier_completion___block_invoke_87;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __75__PKPeerPaymentService_updateRecurringPaymentStatus_identifier_completion___block_invoke_87(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __75__PKPeerPaymentService_updateRecurringPaymentStatus_identifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)recurringPaymentsChanged
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xBuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Calling -[PKPeerPaymentService %@];", (uint8_t *)&v6, 0xCu);

  }
  -[PKPeerPaymentService _accessObserversWithHandler:](self, "_accessObserversWithHandler:", &__block_literal_global_88);
}

void __48__PKPeerPaymentService_recurringPaymentsChanged__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "recurringPaymentsChanged");

}

- (BOOL)hasRecurringPayments
{
  PKPeerPaymentService *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[PKPeerPaymentService _synchronousRemoteObjectProxyForSelector:](self, "_synchronousRemoteObjectProxyForSelector:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__PKPeerPaymentService_hasRecurringPayments__block_invoke;
  v5[3] = &unk_1E2AC27B0;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "hasRecurringPayments:", v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __44__PKPeerPaymentService_hasRecurringPayments__block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a2;
  return result;
}

- (void)encryptionCertificateForDestination:(unint64_t)a3 forceUpdate:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD aBlock[5];
  id v18;
  SEL v19;

  v5 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PKPeerPaymentService_encryptionCertificateForDestination_forceUpdate_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v19 = a2;
  v11 = v9;
  aBlock[4] = self;
  v18 = v11;
  v12 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __83__PKPeerPaymentService_encryptionCertificateForDestination_forceUpdate_completion___block_invoke_2;
  v15[3] = &unk_1E2ADD900;
  v15[4] = self;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v13, "encryptionCertificateForDestination:forceUpdate:completion:", a3, v5, v15);

}

void __83__PKPeerPaymentService_encryptionCertificateForDestination_forceUpdate_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xBuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__PKPeerPaymentService_encryptionCertificateForDestination_forceUpdate_completion___block_invoke_91;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __83__PKPeerPaymentService_encryptionCertificateForDestination_forceUpdate_completion___block_invoke_91(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __83__PKPeerPaymentService_encryptionCertificateForDestination_forceUpdate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)encryptData:(id)a3 usingCertificateWithDestination:(unint64_t)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD aBlock[5];
  id v19;
  SEL v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PKPeerPaymentService_encryptData_usingCertificateWithDestination_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v20 = a2;
  v11 = v9;
  aBlock[4] = self;
  v19 = v11;
  v12 = a3;
  v13 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __79__PKPeerPaymentService_encryptData_usingCertificateWithDestination_completion___block_invoke_2;
  v16[3] = &unk_1E2ADD928;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "encryptData:usingCertificateWithDestination:completion:", v12, a4, v16);

}

void __79__PKPeerPaymentService_encryptData_usingCertificateWithDestination_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xBuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__PKPeerPaymentService_encryptData_usingCertificateWithDestination_completion___block_invoke_93;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __79__PKPeerPaymentService_encryptData_usingCertificateWithDestination_completion___block_invoke_93(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __79__PKPeerPaymentService_encryptData_usingCertificateWithDestination_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)presentSenderFlowWithHost:(unint64_t)a3 userInfo:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD aBlock[5];
  id v19;
  SEL v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PKPeerPaymentService_presentSenderFlowWithHost_userInfo_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v20 = a2;
  v11 = v9;
  aBlock[4] = self;
  v19 = v11;
  v12 = a4;
  v13 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __70__PKPeerPaymentService_presentSenderFlowWithHost_userInfo_completion___block_invoke_2;
  v16[3] = &unk_1E2ABDDB0;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "presentSenderFlowWithHost:userInfo:completion:", a3, v12, v16);

}

void __70__PKPeerPaymentService_presentSenderFlowWithHost_userInfo_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__PKPeerPaymentService_presentSenderFlowWithHost_userInfo_completion___block_invoke_95;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __70__PKPeerPaymentService_presentSenderFlowWithHost_userInfo_completion___block_invoke_95(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __70__PKPeerPaymentService_presentSenderFlowWithHost_userInfo_completion___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  char v10;
  _QWORD block[4];
  id v12;

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__PKPeerPaymentService_presentSenderFlowWithHost_userInfo_completion___block_invoke_3;
  v8[3] = &unk_1E2ABDAB8;
  v6 = *(id *)(a1 + 40);
  v10 = a2;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v12 = v7;
  dispatch_async(v4, block);

}

uint64_t __70__PKPeerPaymentService_presentSenderFlowWithHost_userInfo_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (void)presentReceiverFlowWithOrientation:(id)a3 host:(unint64_t)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD aBlock[5];
  id v19;
  SEL v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PKPeerPaymentService_presentReceiverFlowWithOrientation_host_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v20 = a2;
  v11 = v9;
  aBlock[4] = self;
  v19 = v11;
  v12 = a3;
  v13 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __75__PKPeerPaymentService_presentReceiverFlowWithOrientation_host_completion___block_invoke_2;
  v16[3] = &unk_1E2ABDDB0;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "presentReceiverFlowWithOrientation:host:completion:", v12, a4, v16);

}

void __75__PKPeerPaymentService_presentReceiverFlowWithOrientation_host_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__PKPeerPaymentService_presentReceiverFlowWithOrientation_host_completion___block_invoke_96;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __75__PKPeerPaymentService_presentReceiverFlowWithOrientation_host_completion___block_invoke_96(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __75__PKPeerPaymentService_presentReceiverFlowWithOrientation_host_completion___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  char v10;
  _QWORD block[4];
  id v12;

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__PKPeerPaymentService_presentReceiverFlowWithOrientation_host_completion___block_invoke_3;
  v8[3] = &unk_1E2ABDAB8;
  v6 = *(id *)(a1 + 40);
  v10 = a2;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v12 = v7;
  dispatch_async(v4, block);

}

uint64_t __75__PKPeerPaymentService_presentReceiverFlowWithOrientation_host_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (void)insertOrUpdateDeviceOriginatedNearbyPeerPaymentTransactionWithIdentifier:(id)a3 memo:(id)a4 counterpartAppearanceData:(id)a5 completion:(id)a6
{
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD aBlock[5];
  id v23;
  SEL v24;

  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __139__PKPeerPaymentService_insertOrUpdateDeviceOriginatedNearbyPeerPaymentTransactionWithIdentifier_memo_counterpartAppearanceData_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v24 = a2;
  v13 = v11;
  aBlock[4] = self;
  v23 = v13;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __139__PKPeerPaymentService_insertOrUpdateDeviceOriginatedNearbyPeerPaymentTransactionWithIdentifier_memo_counterpartAppearanceData_completion___block_invoke_2;
  v20[3] = &unk_1E2ABDDB0;
  v20[4] = self;
  v21 = v13;
  v19 = v13;
  objc_msgSend(v18, "insertOrUpdateDeviceOriginatedNearbyPeerPaymentTransactionWithIdentifier:memo:counterpartAppearanceData:completion:", v16, v15, v14, v20);

}

void __139__PKPeerPaymentService_insertOrUpdateDeviceOriginatedNearbyPeerPaymentTransactionWithIdentifier_memo_counterpartAppearanceData_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __139__PKPeerPaymentService_insertOrUpdateDeviceOriginatedNearbyPeerPaymentTransactionWithIdentifier_memo_counterpartAppearanceData_completion___block_invoke_97;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __139__PKPeerPaymentService_insertOrUpdateDeviceOriginatedNearbyPeerPaymentTransactionWithIdentifier_memo_counterpartAppearanceData_completion___block_invoke_97(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __139__PKPeerPaymentService_insertOrUpdateDeviceOriginatedNearbyPeerPaymentTransactionWithIdentifier_memo_counterpartAppearanceData_completion___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  char v10;
  _QWORD block[4];
  id v12;

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __139__PKPeerPaymentService_insertOrUpdateDeviceOriginatedNearbyPeerPaymentTransactionWithIdentifier_memo_counterpartAppearanceData_completion___block_invoke_3;
  v8[3] = &unk_1E2ABDAB8;
  v6 = *(id *)(a1 + 40);
  v10 = a2;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v12 = v7;
  dispatch_async(v4, block);

}

uint64_t __139__PKPeerPaymentService_insertOrUpdateDeviceOriginatedNearbyPeerPaymentTransactionWithIdentifier_memo_counterpartAppearanceData_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (void)insertOrUpdateNearbyPeerPaymentSetupNotificationWithTransactionIdentifier:(id)a3 amount:(id)a4 currency:(id)a5 senderName:(id)a6 completion:(id)a7
{
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD aBlock[5];
  id v26;
  SEL v27;

  v13 = a7;
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __136__PKPeerPaymentService_insertOrUpdateNearbyPeerPaymentSetupNotificationWithTransactionIdentifier_amount_currency_senderName_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v27 = a2;
  v15 = v13;
  aBlock[4] = self;
  v26 = v15;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v14;
  v23[1] = 3221225472;
  v23[2] = __136__PKPeerPaymentService_insertOrUpdateNearbyPeerPaymentSetupNotificationWithTransactionIdentifier_amount_currency_senderName_completion___block_invoke_2;
  v23[3] = &unk_1E2ABDDB0;
  v23[4] = self;
  v24 = v15;
  v22 = v15;
  objc_msgSend(v21, "insertOrUpdateNearbyPeerPaymentSetupNotificationWithTransactionIdentifier:amount:currency:senderName:completion:", v19, v18, v17, v16, v23);

}

void __136__PKPeerPaymentService_insertOrUpdateNearbyPeerPaymentSetupNotificationWithTransactionIdentifier_amount_currency_senderName_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __136__PKPeerPaymentService_insertOrUpdateNearbyPeerPaymentSetupNotificationWithTransactionIdentifier_amount_currency_senderName_completion___block_invoke_98;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __136__PKPeerPaymentService_insertOrUpdateNearbyPeerPaymentSetupNotificationWithTransactionIdentifier_amount_currency_senderName_completion___block_invoke_98(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __136__PKPeerPaymentService_insertOrUpdateNearbyPeerPaymentSetupNotificationWithTransactionIdentifier_amount_currency_senderName_completion___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  char v10;
  _QWORD block[4];
  id v12;

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __136__PKPeerPaymentService_insertOrUpdateNearbyPeerPaymentSetupNotificationWithTransactionIdentifier_amount_currency_senderName_completion___block_invoke_3;
  v8[3] = &unk_1E2ABDAB8;
  v6 = *(id *)(a1 + 40);
  v10 = a2;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v12 = v7;
  dispatch_async(v4, block);

}

uint64_t __136__PKPeerPaymentService_insertOrUpdateNearbyPeerPaymentSetupNotificationWithTransactionIdentifier_amount_currency_senderName_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (void)counterpartImageDataWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKPeerPaymentService_counterpartImageDataWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __59__PKPeerPaymentService_counterpartImageDataWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABE008;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "counterpartImageDataWithCompletion:", v11);

}

void __59__PKPeerPaymentService_counterpartImageDataWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__PKPeerPaymentService_counterpartImageDataWithCompletion___block_invoke_99;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __59__PKPeerPaymentService_counterpartImageDataWithCompletion___block_invoke_99(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __59__PKPeerPaymentService_counterpartImageDataWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__PKPeerPaymentService_counterpartImageDataWithCompletion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __59__PKPeerPaymentService_counterpartImageDataWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)counterpartImageDataWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PKPeerPaymentService_counterpartImageDataWithIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __70__PKPeerPaymentService_counterpartImageDataWithIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ADD950;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "counterpartImageDataWithIdentifier:completion:", v10, v14);

}

void __70__PKPeerPaymentService_counterpartImageDataWithIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__PKPeerPaymentService_counterpartImageDataWithIdentifier_completion___block_invoke_100;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __70__PKPeerPaymentService_counterpartImageDataWithIdentifier_completion___block_invoke_100(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __70__PKPeerPaymentService_counterpartImageDataWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__PKPeerPaymentService_counterpartImageDataWithIdentifier_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __70__PKPeerPaymentService_counterpartImageDataWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)counterpartImageDataForTransactionWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__PKPeerPaymentService_counterpartImageDataForTransactionWithIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __84__PKPeerPaymentService_counterpartImageDataForTransactionWithIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ADD950;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "counterpartImageDataForTransactionWithIdentifier:completion:", v10, v14);

}

void __84__PKPeerPaymentService_counterpartImageDataForTransactionWithIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__PKPeerPaymentService_counterpartImageDataForTransactionWithIdentifier_completion___block_invoke_102;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __84__PKPeerPaymentService_counterpartImageDataForTransactionWithIdentifier_completion___block_invoke_102(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __84__PKPeerPaymentService_counterpartImageDataForTransactionWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__PKPeerPaymentService_counterpartImageDataForTransactionWithIdentifier_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __84__PKPeerPaymentService_counterpartImageDataForTransactionWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)deleteAllCounterpartImageDataWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKPeerPaymentService_deleteAllCounterpartImageDataWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __68__PKPeerPaymentService_deleteAllCounterpartImageDataWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABDA18;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "deleteAllCounterpartImageDataWithCompletion:", v11);

}

void __68__PKPeerPaymentService_deleteAllCounterpartImageDataWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__PKPeerPaymentService_deleteAllCounterpartImageDataWithCompletion___block_invoke_103;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __68__PKPeerPaymentService_deleteAllCounterpartImageDataWithCompletion___block_invoke_103(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __68__PKPeerPaymentService_deleteAllCounterpartImageDataWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;
  _QWORD v6[5];
  id v7;
  _QWORD block[4];
  id v9;

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__PKPeerPaymentService_deleteAllCounterpartImageDataWithCompletion___block_invoke_3;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = v6;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v9 = v5;
  dispatch_async(v2, block);

}

uint64_t __68__PKPeerPaymentService_deleteAllCounterpartImageDataWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)reportFailureDiagnostic:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKPeerPaymentService_reportFailureDiagnostic_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPeerPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __59__PKPeerPaymentService_reportFailureDiagnostic_completion___block_invoke_2;
  v14[3] = &unk_1E2ABDF68;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "reportFailureDiagnostic:completion:", v10, v14);

}

void __59__PKPeerPaymentService_reportFailureDiagnostic_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__PKPeerPaymentService_reportFailureDiagnostic_completion___block_invoke_104;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_24;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __59__PKPeerPaymentService_reportFailureDiagnostic_completion___block_invoke_104(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __59__PKPeerPaymentService_reportFailureDiagnostic_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  char v16;
  _QWORD block[4];
  id v18;

  v5 = a3;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__PKPeerPaymentService_reportFailureDiagnostic_completion___block_invoke_3;
  v12[3] = &unk_1E2ABDC70;
  v8 = *(id *)(a1 + 40);
  v16 = a2;
  v9 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v9;
  v15 = v8;
  v10 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E2ABD9A0;
  v18 = v10;
  v11 = v5;
  dispatch_async(v6, block);

}

uint64_t __59__PKPeerPaymentService_reportFailureDiagnostic_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_remoteService, 0);
}

@end
