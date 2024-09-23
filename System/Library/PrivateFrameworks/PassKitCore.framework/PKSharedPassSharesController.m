@implementation PKSharedPassSharesController

- (PKSharedPassSharesController)initWithPass:(id)a3 webService:(id)a4 paymentServiceProvider:(id)a5 queue:(id)a6
{
  return -[PKSharedPassSharesController initWithPass:contactResolver:webService:paymentServiceProvider:queue:](self, "initWithPass:contactResolver:webService:paymentServiceProvider:queue:", a3, 0, a4, a5, a6);
}

- (PKSharedPassSharesController)initWithPass:(id)a3 contactResolver:(id)a4 webService:(id)a5 paymentServiceProvider:(id)a6 queue:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PKSharedPassSharesController *v17;
  PKSharedPassSharesController *v18;
  uint64_t v19;
  NSHashTable *delegates;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;

  v29 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = -[PKSharedPassSharesController init](self, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_pass, a3);
    objc_storeStrong((id *)&v18->_contactResolver, a4);
    objc_storeStrong((id *)&v18->_webService, a5);
    objc_storeStrong((id *)&v18->_paymentServiceProvider, a6);
    -[PKPaymentDataProvider addDelegate:](v18->_paymentServiceProvider, "addDelegate:", v18);
    objc_storeStrong((id *)&v18->_queue, a7);
    objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
    v19 = objc_claimAutoreleasedReturnValue();
    delegates = v18->_delegates;
    v18->_delegates = (NSHashTable *)v19;

    v18->_delegateLock._os_unfair_lock_opaque = 0;
    -[PKPaymentWebService targetDevice](v18->_webService, "targetDevice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "paymentWebService:supportedRegionFeatureOfType:", v18->_webService, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentWebService targetDevice](v18->_webService, "targetDevice");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "deviceVersion");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "deviceClass");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "friendSharingOSVersionRequirement");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v18->_friendSharingFeatureSupported = objc_msgSend(v26, "versionMeetsRequirements:deviceClass:", v24, v25);

    objc_msgSend(v22, "ownerSharingOSVersionRequirement");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v18->_ownerSharingFeatureSupported = objc_msgSend(v27, "versionMeetsRequirements:deviceClass:", v24, v25);

    -[PKSharedPassSharesController updateSharesWithCompletion:](v18, "updateSharesWithCompletion:", 0);
  }

  return v18;
}

- (void)dealloc
{
  objc_super v3;

  -[PKPaymentDataProvider removeDelegate:](self->_paymentServiceProvider, "removeDelegate:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKSharedPassSharesController;
  -[PKSharedPassSharesController dealloc](&v3, sel_dealloc);
}

- (void)addDelegate:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_delegateLock);
    -[NSHashTable addObject:](self->_delegates, "addObject:", v4);
    os_unfair_lock_unlock(&self->_delegateLock);
  }

}

- (void)removeDelegate:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_delegateLock);
    -[NSHashTable removeObject:](self->_delegates, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_delegateLock);
  }

}

- (void)didUpdateShares
{
  os_unfair_lock_s *p_delegateLock;
  void *v4;
  NSObject *queue;
  _QWORD v6[4];
  id v7;
  PKSharedPassSharesController *v8;

  if (!self->_isPerformingBatchOpperation)
  {
    p_delegateLock = &self->_delegateLock;
    os_unfair_lock_lock(&self->_delegateLock);
    -[NSHashTable allObjects](self->_delegates, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_delegateLock);
    if (objc_msgSend(v4, "count"))
    {
      queue = self->_queue;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __47__PKSharedPassSharesController_didUpdateShares__block_invoke;
      v6[3] = &unk_1E2ABE0D0;
      v7 = v4;
      v8 = self;
      dispatch_async(queue, v6);

    }
  }
}

void __47__PKSharedPassSharesController_didUpdateShares__block_invoke(uint64_t a1)
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "sharedPassSharesControllerDidUpdateShares:", *(_QWORD *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)contactForShare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PKSharedPassSharesController _contactResolver](self, "_contactResolver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipientHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "contactForHandle:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)fetchContactForShare:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  _QWORD block[4];
  NSObject *v18;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[PKSharedPassSharesController _contactResolver](self, "_contactResolver");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    queue = self->_queue;
    if (v8)
    {
      v10 = queue;
      -[PKSharedPassSharesController _contactResolver](self, "_contactResolver");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "recipientHandle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __68__PKSharedPassSharesController_fetchContactForShare_withCompletion___block_invoke_2;
      v14[3] = &unk_1E2ADA6D8;
      v15 = v10;
      v16 = v7;
      v13 = v10;
      objc_msgSend(v11, "contactForHandle:withCompletion:", v12, v14);

    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __68__PKSharedPassSharesController_fetchContactForShare_withCompletion___block_invoke;
      block[3] = &unk_1E2ABD9A0;
      v18 = v7;
      dispatch_async(queue, block);
      v13 = v18;
    }

  }
}

uint64_t __68__PKSharedPassSharesController_fetchContactForShare_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__PKSharedPassSharesController_fetchContactForShare_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__PKSharedPassSharesController_fetchContactForShare_withCompletion___block_invoke_3;
  v7[3] = &unk_1E2ABDA18;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __68__PKSharedPassSharesController_fetchContactForShare_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)_contactResolver
{
  PKContactResolver *contactResolver;
  id v4;
  void *v5;
  PKContactResolver *v6;
  PKContactResolver *v7;

  contactResolver = self->_contactResolver;
  if (!contactResolver)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C97298]);
    +[PKPeerPaymentCounterpartHandleFormatter requiredContactKeys](PKPeerPaymentCounterpartHandleFormatter, "requiredContactKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PKContactResolver initWithContactStore:keysToFetch:]([PKContactResolver alloc], "initWithContactStore:keysToFetch:", v4, v5);
    v7 = self->_contactResolver;
    self->_contactResolver = v6;

    contactResolver = self->_contactResolver;
  }
  return contactResolver;
}

- (id)senderShareForShare:(id)a3
{
  id v4;
  NSArray *shares;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  shares = self->_shares;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__PKSharedPassSharesController_senderShareForShare___block_invoke;
  v9[3] = &unk_1E2ADA700;
  v10 = v4;
  v6 = v4;
  -[NSArray pk_firstObjectPassingTest:](shares, "pk_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __52__PKSharedPassSharesController_senderShareForShare___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "senderShareIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 && v4)
    v6 = objc_msgSend(v3, "isEqual:", v4);
  else
    v6 = v3 == (void *)v4;

  return v6;
}

- (void)updateSharesWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  PKSharedPassSharesController *v13;
  void (**v14)(_QWORD);
  _QWORD aBlock[5];
  id v16;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKSharedPassSharesController_updateSharesWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABE058;
  aBlock[4] = self;
  v6 = v4;
  v16 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[NSArray pk_arrayBySafelyApplyingBlock:](self->_shares, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_203);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PKObject uniqueID](self->_pass, "uniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __59__PKSharedPassSharesController_updateSharesWithCompletion___block_invoke_4;
    v11[3] = &unk_1E2AC61E0;
    v12 = v8;
    v13 = self;
    v14 = v7;
    objc_msgSend(v9, "displayableSharesForPassIdentifier:completion:", v10, v11);

  }
  else
  {
    v7[2](v7);
  }

}

void __59__PKSharedPassSharesController_updateSharesWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__PKSharedPassSharesController_updateSharesWithCompletion___block_invoke_2;
  v5[3] = &unk_1E2ABDA18;
  v4 = v2;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  dispatch_async(v3, v5);

}

uint64_t __59__PKSharedPassSharesController_updateSharesWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "didUpdateShares");
}

uint64_t __59__PKSharedPassSharesController_updateSharesWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __59__PKSharedPassSharesController_updateSharesWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__PKSharedPassSharesController_updateSharesWithCompletion___block_invoke_5;
  v12[3] = &unk_1E2ADA700;
  v13 = *(id *)(a1 + 32);
  objc_msgSend(v3, "pk_firstObjectPassingTest:", v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v4)
    v7 = v4;
  v8 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v5;

  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(v9 + 72);
  *(_QWORD *)(v9 + 72) = v3;
  v11 = v3;

  objc_msgSend(*(id *)(a1 + 40), "updateEntitlementsWithCompletion:", *(_QWORD *)(a1 + 48));
}

uint64_t __59__PKSharedPassSharesController_updateSharesWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

- (void)updateEntitlementsWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  _QWORD v10[5];
  void (**v11)(_QWORD);
  _QWORD aBlock[5];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PKSharedPassSharesController_updateEntitlementsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABE058;
  aBlock[4] = self;
  v6 = v4;
  v13 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PKObject uniqueID](self->_pass, "uniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __65__PKSharedPassSharesController_updateEntitlementsWithCompletion___block_invoke_3;
    v10[3] = &unk_1E2ABDE50;
    v10[4] = self;
    v11 = v7;
    objc_msgSend(v8, "displayableEntitlementsForPassIdentifier:completion:", v9, v10);

  }
  else
  {
    v7[2](v7);
  }

}

void __65__PKSharedPassSharesController_updateEntitlementsWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PKSharedPassSharesController_updateEntitlementsWithCompletion___block_invoke_2;
  block[3] = &unk_1E2ABD9A0;
  v4 = v1;
  dispatch_async(v2, block);

}

uint64_t __65__PKSharedPassSharesController_updateEntitlementsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __65__PKSharedPassSharesController_updateEntitlementsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "pk_objectsPassingTest:", &__block_literal_global_66_1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v4;

  objc_msgSend(v3, "pk_objectsPassingTest:", &__block_literal_global_67_1);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 88);
  *(_QWORD *)(v8 + 88) = v7;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

BOOL __65__PKSharedPassSharesController_updateEntitlementsWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "entitlement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shareability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

uint64_t __65__PKSharedPassSharesController_updateEntitlementsWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "entitlement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "active");

  return v3;
}

- (id)entitlementsForShare:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v4, "sharedEntitlements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "entitlementIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v8);
  }

  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = self->_shareableEntitlements;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
        objc_msgSend(v18, "entitlementIdentifier", (_QWORD)v24);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v5, "containsObject:", v19);

        if (v20)
        {
          objc_msgSend(v18, "entitlement");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v21);

        }
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v15);
  }

  v22 = (void *)objc_msgSend(v12, "copy");
  return v22;
}

- (id)childSharesOfShare:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[NSArray pk_groupDictionaryByApplyingBlock:](self->_shares, "pk_groupDictionaryByApplyingBlock:", &__block_literal_global_71);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  while (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeLastObject");
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "containsObject:", v12) & 1) == 0)
    {
      objc_msgSend(v10, "addObject:", v12);
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        objc_msgSend(v9, "addObjectsFromArray:", v13);
      objc_msgSend(v6, "addObject:", v11);

    }
  }
  v14 = (void *)objc_msgSend(v6, "copy");

  return v14;
}

__CFString *__51__PKSharedPassSharesController_childSharesOfShare___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(a2, "senderShareIdentifier");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("none");
  v4 = v2;

  return v4;
}

- (NSArray)rootShares
{
  void *v3;
  NSArray *shares;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  -[NSArray pk_indexDictionaryByApplyingBlock:](self->_shares, "pk_indexDictionaryByApplyingBlock:", &__block_literal_global_74_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  shares = self->_shares;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__PKSharedPassSharesController_rootShares__block_invoke_2;
  v8[3] = &unk_1E2ADA788;
  v9 = v3;
  v5 = v3;
  -[NSArray pk_objectsPassingTest:](shares, "pk_objectsPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

uint64_t __42__PKSharedPassSharesController_rootShares__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

BOOL __42__PKSharedPassSharesController_rootShares__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = a2;
  if (objc_msgSend(v3, "isLocalShare") && !PKShowLocalPassShares())
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "senderShareIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5 == 0;

    }
    else
    {
      v6 = 1;
    }

  }
  return v6;
}

- (NSArray)nonLocalShares
{
  return (NSArray *)-[NSArray pk_objectsPassingTest:](self->_shares, "pk_objectsPassingTest:", &__block_literal_global_76_0);
}

uint64_t __46__PKSharedPassSharesController_nonLocalShares__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isLocalShare") ^ 1;
}

- (id)shareForShareIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSArray *shares;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    shares = self->_shares;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__PKSharedPassSharesController_shareForShareIdentifier___block_invoke;
    v9[3] = &unk_1E2ADA700;
    v10 = v4;
    -[NSArray pk_firstObjectPassingTest:](shares, "pk_firstObjectPassingTest:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __56__PKSharedPassSharesController_shareForShareIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
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

- (BOOL)sharingEnabled
{
  NSUInteger v3;
  BOOL result;

  v3 = -[NSArray count](self->_shareableEntitlements, "count");
  result = -[PKSharedPassSharesController sharingFeatureEnabled](self, "sharingFeatureEnabled");
  if (!v3)
    return 0;
  return result;
}

- (BOOL)sharingFeatureEnabled
{
  uint64_t v2;
  int v3;
  BOOL result;

  v2 = 40;
  if (self->_isOwnerSharing)
    v2 = 41;
  v3 = *((unsigned __int8 *)&self->super.isa + v2);
  result = -[PKSecureElementPass supportsFeatureForCurrentDevice:](self->_pass, "supportsFeatureForCurrentDevice:", 1);
  if (!v3)
    return 0;
  return result;
}

- (void)canSendInvitationWithCompletion:(id)a3
{
  -[PKSharedPassSharesController canSendInvitationWithIsTransfer:completion:](self, "canSendInvitationWithIsTransfer:completion:", 0, a3);
}

- (void)canTransferWithCompletion:(id)a3
{
  -[PKSharedPassSharesController canSendInvitationWithIsTransfer:completion:](self, "canSendInvitationWithIsTransfer:completion:", 1, a3);
}

- (void)canSendInvitationWithIsTransfer:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, void *);
  OS_dispatch_queue *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  const char *v16;
  NSUInteger v17;
  NSArray *shareableEntitlements;
  void *v19;
  void *v20;
  void *v21;
  PKPaymentWebService *webService;
  void *v23;
  void *v24;
  const char *v25;
  void *v26;
  _QWORD v27[4];
  OS_dispatch_queue *v28;
  PKSharedPassSharesController *v29;
  void (**v30)(id, void *);
  BOOL v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v4 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a4;
  v7 = self->_queue;
  if (v6)
  {
    -[PKObject uniqueID](self->_pass, "uniqueID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(0x20uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v8;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Can Share: Checking if pass can send invitation: %@", buf, 0xCu);
    }

    -[PKSecureElementPass devicePrimaryPaymentApplication](self->_pass, "devicePrimaryPaymentApplication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PKSecureElementPass contactlessActivationState](self->_pass, "contactlessActivationState")
      || objc_msgSend(v10, "state") == 15)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Can Share: Unable to share because pass is not in an active state", buf, 2u);
      }

      PKLocalizationKeyForPassType(CFSTR("UNABLE_TO_SHARE_GENERIC_DESCRIPTION"), self->_pass);
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      PKLocalizedShareableCredentialString(v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      PKLocalizedShareableCredentialString(CFSTR("UNABLE_TO_SHARE_GENERIC_TITLE"), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      PKDisplayableErrorCustomWithType(-1, v13, v12, 0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v14);

      goto LABEL_9;
    }
    if (v4)
    {
      v15 = -[NSArray pk_countObjectsPassingTest:](self->_myEntitlements, "pk_countObjectsPassingTest:", &__block_literal_global_81_3);
      if (v15 != -[NSArray count](self->_myEntitlements, "count"))
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v16 = "Can Share: Unable to transfer because all entitlements not transferable";
LABEL_23:
          _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
          goto LABEL_24;
        }
        goto LABEL_24;
      }
    }
    else
    {
      v17 = -[NSArray count](self->_shareableEntitlements, "count");
      shareableEntitlements = self->_shareableEntitlements;
      if (!shareableEntitlements || !v17)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v16 = "Can Share: Unable to share because pass has no shareable entitlements";
          goto LABEL_23;
        }
LABEL_24:

        objc_msgSend(MEMORY[0x1E0CB35C8], "pkSharingError:", 7);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        _PKSharingDisplayableError(v20, 0, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v6[2](v6, v24);
LABEL_31:

        goto LABEL_32;
      }
      if (-[NSArray pk_countObjectsPassingTest:](shareableEntitlements, "pk_countObjectsPassingTest:", &__block_literal_global_84_2) != v17)
      {
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
LABEL_30:

          PKLocalizedCredentialString(CFSTR("UNABLE_TO_SHARE_TITLE"), 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedCredentialString(CFSTR("UNABLE_TO_SHARE_EXCEEDED_LIMIT_BODY"), 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          PKDisplayableErrorCustomWithType(-1, v20, v24, 0, 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v6[2](v6, v26);

          goto LABEL_31;
        }
        *(_WORD *)buf = 0;
        v25 = "Can Share: Unable to share because pass has entitlements with no remaining shares";
LABEL_29:
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, v25, buf, 2u);
        goto LABEL_30;
      }
    }
    if (-[PKSharedPassSharesController sharingFeatureEnabled](self, "sharingFeatureEnabled"))
    {
      if (!-[PKSecureElementPass isCarKeyPass](self->_pass, "isCarKeyPass"))
      {
        v6[2](v6, 0);
        goto LABEL_9;
      }
      objc_msgSend(v10, "subcredentials");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "anyObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      webService = self->_webService;
      objc_msgSend(v20, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __75__PKSharedPassSharesController_canSendInvitationWithIsTransfer_completion___block_invoke_89;
      v27[3] = &unk_1E2ADA848;
      v28 = v7;
      v29 = self;
      v30 = v6;
      v31 = v4;
      objc_msgSend(v21, "paymentWebService:credentialWithIdentifier:completion:", webService, v23, v27);

LABEL_32:
LABEL_9:

      goto LABEL_10;
    }
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_30;
    *(_WORD *)buf = 0;
    v25 = "Can Share: sharing disabled";
    goto LABEL_29;
  }
LABEL_10:

}

uint64_t __75__PKSharedPassSharesController_canSendInvitationWithIsTransfer_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "entitlement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intraAccountSharingEnabled");

  return v3;
}

uint64_t __75__PKSharedPassSharesController_canSendInvitationWithIsTransfer_completion___block_invoke_83(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "entitlement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasRemainingShares");

  return v3;
}

void __75__PKSharedPassSharesController_canSendInvitationWithIsTransfer_completion___block_invoke_89(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  int8x16_t v7;
  _QWORD block[4];
  id v9;
  int8x16_t v10;
  id v11;
  char v12;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PKSharedPassSharesController_canSendInvitationWithIsTransfer_completion___block_invoke_2;
  block[3] = &unk_1E2ADA820;
  v9 = v3;
  v11 = *(id *)(a1 + 48);
  v7 = *(int8x16_t *)(a1 + 32);
  v5 = (id)v7.i64[0];
  v10 = vextq_s8(v7, v7, 8uLL);
  v12 = *(_BYTE *)(a1 + 56);
  v6 = v3;
  dispatch_async(v4, block);

}

void __75__PKSharedPassSharesController_canSendInvitationWithIsTransfer_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  char v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sharingConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
LABEL_17:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_18;
  }
  v4 = objc_msgSend(v2, "numberOfShareableCredentials");
  v5 = objc_msgSend(*(id *)(a1 + 40), "_numberOfSharesPartnerDoesNotKnowAbout");
  v6 = objc_msgSend(*(id *)(a1 + 40), "_totalPendingShares");
  v7 = objc_msgSend(*(id *)(a1 + 40), "_totalPendingCredentialShares");
  PKLogFacilityTypeGetObject(0x20uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    v24 = v4;
    v25 = 2048;
    v26 = v5;
    v27 = 2048;
    v28 = v6;
    v29 = 2048;
    v30 = v7;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Can Share: shareableCredentials: %ld;  outstandingShares: %ld;  pendingShares: %ld;  pendingCredentialShares: %ld;",
      buf,
      0x2Au);
  }

  if (v4 <= v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v24 = v13;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Can Share: Unable to share credential, no shareable credentials remaining. \n %@", buf, 0xCu);
    }

    v10 = *(_QWORD *)(a1 + 56);
    PKLocalizedCredentialString(CFSTR("UNABLE_TO_SHARE_TITLE"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("UNABLE_TO_SHARE_EXCEEDED_LIMIT_BODY");
    goto LABEL_12;
  }
  if (v6 < 8)
  {
    if (!PKBypassImmoTokenCountCheck())
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __75__PKSharedPassSharesController_canSendInvitationWithIsTransfer_completion___block_invoke_92;
      v17[3] = &unk_1E2ADA7F8;
      v16 = *(void **)(a1 + 40);
      v18 = *(id *)(a1 + 48);
      v22 = *(_BYTE *)(a1 + 64);
      v19 = *(id *)(a1 + 32);
      v21 = v7;
      v20 = *(id *)(a1 + 56);
      objc_msgSend(v16, "_immobilizerTokenCountWithCompletion:", v17);

      goto LABEL_18;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Can Share: Skipping immo token count check", buf, 2u);
    }

    goto LABEL_17;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v24 = v9;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Can Share: Unable to share credential, reached pending share max. \n %@", buf, 0xCu);
  }

  v10 = *(_QWORD *)(a1 + 56);
  PKLocalizedCredentialString(CFSTR("UNABLE_TO_SHARE_TITLE"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("UNABLE_TO_SHARE_EXCEEDED_INVITATION_LIMIT_BODY");
LABEL_12:
  PKLocalizedCredentialString(&v12->isa, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PKDisplayableErrorCustomWithType(-1, v11, v14, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v15);

LABEL_18:
}

void __75__PKSharedPassSharesController_canSendInvitationWithIsTransfer_completion___block_invoke_92(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__PKSharedPassSharesController_canSendInvitationWithIsTransfer_completion___block_invoke_2_93;
  v8[3] = &unk_1E2ADA7D0;
  v14 = *(_BYTE *)(a1 + 64);
  v11 = a2;
  v5 = *(NSObject **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v12 = a3;
  v13 = v6;
  v10 = v7;
  dispatch_async(v5, v8);

}

void __75__PKSharedPassSharesController_canSendInvitationWithIsTransfer_completion___block_invoke_2_93(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  unint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 72))
    v2 = 1;
  else
    v2 = 2;
  if (v2 > *(_QWORD *)(a1 + 48) && PKAppletSubcredentialSupportsSharingInAChain(*(void **)(a1 + 32)))
  {
    PKLocalizedCredentialString(CFSTR("UNABLE_TO_SHARE_TITLE"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (*(_QWORD *)(a1 + 56) < v2)
  {
    v4 = *(_QWORD *)(a1 + 64);
    PKLocalizedCredentialString(CFSTR("UNABLE_TO_SHARE_TITLE"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 > (v2 ^ 7))
    {
      v5 = CFSTR("UNABLE_TO_SHARE_EXCEEDED_INVITATION_LIMIT_BODY");
LABEL_11:
      PKLocalizedCredentialString(&v5->isa, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PKDisplayableErrorCustomWithType(-1, v3, v6, 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    }
LABEL_10:
    v5 = CFSTR("UNABLE_TO_SHARE_NO_TOKENS_BODY");
    goto LABEL_11;
  }
  v7 = 0;
LABEL_13:
  PKLogFacilityTypeGetObject(0x20uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("No");
    v11 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    if (!v7)
      v9 = CFSTR("Yes");
    v12 = 138413314;
    v13 = v9;
    v14 = 2048;
    v15 = v10;
    v16 = 2048;
    v17 = v2;
    v18 = 2048;
    v19 = v11;
    v20 = 2048;
    v21 = v2;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Can Share: %@, remainingShares: %lu (required: %lu) remainingDepth: %lu (required: %lu)", (uint8_t *)&v12, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (unint64_t)_numberOfSharesPartnerDoesNotKnowAbout
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_shares;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "groupIdentifier", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
          ++v5;

      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)_totalPendingShares
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unsigned int v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = self->_shares;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "credentialShares", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "pk_containsObjectPassingTest:", &__block_literal_global_99);

        v5 += v9;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

BOOL __51__PKSharedPassSharesController__totalPendingShares__block_invoke(uint64_t a1, void *a2)
{
  return (objc_msgSend(a2, "status") & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (int64_t)_totalPendingCredentialShares
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v2 = self->_shares;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        objc_msgSend(v8, "credentialShares", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v16;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v16 != v12)
                objc_enumerationMutation(v9);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * j), "status") & 0xFFFFFFFFFFFFFFFELL) == 2)
                ++v5;
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v11);
        }

      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_immobilizerTokenCountWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PKDAManager *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (v4)
  {
    -[PKSecureElementPass devicePrimaryPaymentApplication](self->_pass, "devicePrimaryPaymentApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subcredentials");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_alloc_init(PKDAManager);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __69__PKSharedPassSharesController__immobilizerTokenCountWithCompletion___block_invoke;
      v9[3] = &unk_1E2ADA890;
      v10 = v4;
      -[PKDAManager immobilizerTokensCountForCredential:completion:](v8, "immobilizerTokensCountForCredential:completion:", v7, v9);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
    }

  }
}

uint64_t __69__PKSharedPassSharesController__immobilizerTokenCountWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)hasRevokableShares
{
  return -[NSArray pk_containsObjectPassingTest:](self->_shares, "pk_containsObjectPassingTest:", &__block_literal_global_101_0);
}

uint64_t __50__PKSharedPassSharesController_hasRevokableShares__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isRevokable");
}

- (void)revokeShare:(id)a3 shouldCascade:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[PKObject uniqueID](self->_pass, "uniqueID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__PKSharedPassSharesController_revokeShare_shouldCascade_withCompletion___block_invoke;
  v13[3] = &unk_1E2AD0FE0;
  objc_copyWeak(&v15, &location);
  v12 = v9;
  v14 = v12;
  objc_msgSend(v10, "revokeShareForPassIdentifier:share:shouldCascade:completion:", v11, v8, v6, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __73__PKSharedPassSharesController_revokeShare_shouldCascade_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _QWORD *WeakRetained;
  _QWORD *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "updateSharesWithCompletion:", 0);
    if (*(_QWORD *)(a1 + 32))
    {
      v7 = v6[4];
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __73__PKSharedPassSharesController_revokeShare_shouldCascade_withCompletion___block_invoke_2;
      v8[3] = &unk_1E2ABE058;
      v9 = v4;
      v10 = *(id *)(a1 + 32);
      dispatch_async(v7, v8);

    }
  }

}

void __73__PKSharedPassSharesController_revokeShare_shouldCascade_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (*(_QWORD *)(a1 + 32))
  {
    PKLocalizedShareableCredentialString(CFSTR("REVOKE_SHARE_ERROR_TITLE"), 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedShareableCredentialString(CFSTR("REVOKE_SHARE_ERROR_MESSAGE"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PKDisplayableErrorCustomWithType(-1, v2, v3, 0, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)revokeAllSharesWithCompletion:(id)a3
{
  NSObject *v4;
  void *v5;
  PKAsyncUnaryOperationComposer *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  PKSharedPassSharesController *val;
  void *v17;
  _QWORD v18[5];
  id v19;
  __int128 *v20;
  id v21;
  id location;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t v26;
  __int128 *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  id v34;
  PKSharedPassSharesController *v35;
  __int128 *p_buf;
  _QWORD v37[5];
  uint8_t v38[128];
  __int128 buf;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  val = self;
  -[PKObject uniqueID](self->_pass, "uniqueID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(0x1BuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v17;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Revoking all shares for pass %@", (uint8_t *)&buf, 0xCu);
  }

  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__78;
  v42 = __Block_byref_object_dispose__78;
  v43 = 0;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke;
  v37[3] = &unk_1E2ACF778;
  v37[4] = self;
  -[PKAsyncUnaryOperationComposer addOperation:](v6, "addOperation:", v37);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_3;
    v32[3] = &unk_1E2AC5900;
    v33 = v5;
    v34 = v17;
    v35 = self;
    p_buf = &buf;
    -[PKAsyncUnaryOperationComposer addOperation:](v6, "addOperation:", v32);

    v7 = v33;
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[PKSharedPassSharesController rootShares](self, "rootShares");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_5;
          v23[3] = &unk_1E2AC5900;
          v24 = v5;
          v25 = v17;
          v26 = v11;
          v27 = &buf;
          -[PKAsyncUnaryOperationComposer addOperation:](v6, "addOperation:", v23);

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      }
      while (v8);
    }
  }

  objc_initWeak(&location, val);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_7;
  v18[3] = &unk_1E2ADA928;
  v18[4] = val;
  objc_copyWeak(&v21, &location);
  v20 = &buf;
  v13 = v15;
  v19 = v13;
  v14 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v6, "evaluateWithInput:completion:", v12, v18);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);

}

void __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_2;
  block[3] = &unk_1E2AC4930;
  v13 = v6;
  v14 = v7;
  block[4] = v8;
  v10 = v6;
  v11 = v7;
  dispatch_async(v9, block);

}

uint64_t __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_2(_QWORD *a1)
{
  *(_BYTE *)(a1[4] + 42) = 1;
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[5], 0);
}

void __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "rootShares");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_4;
  v14[3] = &unk_1E2ADA8D8;
  v11 = *(_QWORD *)(a1 + 56);
  v16 = v7;
  v17 = v11;
  v15 = v6;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v8, "revokeSharesForPassIdentifier:shares:shouldCascade:completion:", v9, v10, 1, v14);

}

void __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v5 + 40);
  v6 = (id *)(v5 + 40);
  v7 = v8;
  if (v8)
    v9 = v7;
  else
    v9 = a3;
  objc_storeStrong(v6, v9);
  v10 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_5(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)a1[4];
  v9 = a1[5];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_6;
  v14[3] = &unk_1E2ADA8D8;
  v11 = a1[6];
  v10 = a1[7];
  v16 = v7;
  v17 = v10;
  v15 = v6;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v8, "revokeShareForPassIdentifier:share:shouldCascade:completion:", v9, v11, 1, v14);

}

void __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v5 + 40);
  v6 = (id *)(v5 + 40);
  v7 = v8;
  if (v8)
    v9 = v7;
  else
    v9 = a3;
  objc_storeStrong(v6, v9);
  v10 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_7(uint64_t a1)
{
  NSObject *v2;
  id v3;
  __int128 v4;
  _QWORD block[4];
  __int128 v6;
  id v7;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_8;
  block[3] = &unk_1E2ADA900;
  objc_copyWeak(&v7, (id *)(a1 + 56));
  v4 = *(_OWORD *)(a1 + 40);
  v3 = (id)v4;
  v6 = v4;
  dispatch_async(v2, block);

  objc_destroyWeak(&v7);
}

void __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 42) = 0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_9;
    v6[3] = &unk_1E2AC1AF0;
    v5 = *(_OWORD *)(a1 + 32);
    v4 = (id)v5;
    v7 = v5;
    objc_msgSend(v3, "updateSharesWithCompletion:", v6);

  }
}

void __62__PKSharedPassSharesController_revokeAllSharesWithCompletion___block_invoke_9(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    PKLocalizedShareableCredentialString(CFSTR("REVOKE_SHARE_ERROR_TITLE"), 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedShareableCredentialString(CFSTR("REVOKE_SHARE_ERROR_MESSAGE"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PKDisplayableErrorCustomWithType(-1, v2, v3, 0, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

- (void)createShareWithPartialShare:(id)a3 authorization:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __85__PKSharedPassSharesController_createShareWithPartialShare_authorization_completion___block_invoke;
  v13[3] = &unk_1E2ADA978;
  objc_copyWeak(&v15, &location);
  v12 = v10;
  v13[4] = self;
  v14 = v12;
  objc_msgSend(v11, "createShareForPartialShareInvitation:authorization:completion:", v8, v9, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __85__PKSharedPassSharesController_createShareWithPartialShare_authorization_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (v6)
  {
    objc_msgSend(WeakRetained, "updateSharesWithCompletion:", 0);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __85__PKSharedPassSharesController_createShareWithPartialShare_authorization_completion___block_invoke_2;
    v11[3] = &unk_1E2ADA950;
    objc_copyWeak(&v15, (id *)(a1 + 48));
    v14 = *(id *)(a1 + 40);
    v9 = v5;
    v10 = *(_QWORD *)(a1 + 32);
    v12 = v9;
    v13 = v10;
    objc_msgSend(v8, "updateSharesWithCompletion:", v11);

    objc_destroyWeak(&v15);
  }

}

void __85__PKSharedPassSharesController_createShareWithPartialShare_authorization_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 48);
    v5 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "url");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v3 + 16))(v3, v4, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96), 0);

    WeakRetained = v5;
  }

}

- (void)updateShare:(id)a3 authorization:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[PKObject uniqueID](self->_pass, "uniqueID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__PKSharedPassSharesController_updateShare_authorization_completion___block_invoke;
  v14[3] = &unk_1E2ADA9A0;
  v13 = v10;
  v15 = v13;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v11, "updateShareForPassIdentifier:share:authorization:completion:", v12, v8, v9, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __69__PKSharedPassSharesController_updateShare_authorization_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "updateSharesWithCompletion:", 0);

}

- (unint64_t)maxEntitlementSelectionCount
{
  if (-[PKSecureElementPass isCarKeyPass](self->_pass, "isCarKeyPass"))
    return 1;
  else
    return -1;
}

- (BOOL)canAllowResharing
{
  return -[NSArray pk_containsObjectPassingTest:](self->_shareableEntitlements, "pk_containsObjectPassingTest:", &__block_literal_global_115);
}

uint64_t __49__PKSharedPassSharesController_canAllowResharing__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "entitlement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shareability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "pk_containsObjectPassingTest:", &__block_literal_global_117_0);
  return v4;
}

BOOL __49__PKSharedPassSharesController_canAllowResharing__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "unsignedIntegerValue") != 0;
}

- (BOOL)isCrossPlatformSharingEnabled
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[PKSecureElementPass isCarKeyPass](self->_pass, "isCarKeyPass"))
    return 1;
  -[PKSharedPassSharesController _feature](self, "_feature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = (!v3 || objc_msgSend(v3, "enabled")) && PKSharingUseRelayServerForCar();

  return v5;
}

- (id)baseNewShareForPass
{
  return -[PKSharedPassSharesController _baseNewShareForPassIsTransfer:](self, "_baseNewShareForPassIsTransfer:", 0);
}

- (id)_baseNewShareForPassIsTransfer:(BOOL)a3
{
  _BOOL4 v3;
  PKPassShare *v5;
  id v6;
  void *v7;
  uint64_t v8;
  PKPassEntitlementsComposer *v9;
  PKPassEntitlementsComposer *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;

  v3 = a3;
  v5 = objc_alloc_init(PKPassShare);
  v6 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShare setIdentifier:](v5, "setIdentifier:", v7);

  -[PKPassShare setStatus:](v5, "setStatus:", 3);
  if (-[PKSecureElementPass isCarKeyPass](self->_pass, "isCarKeyPass"))
    v8 = 1;
  else
    v8 = 2;
  -[PKPassShare setManageability:](v5, "setManageability:", v8);
  v9 = [PKPassEntitlementsComposer alloc];
  if (v3)
  {
    v10 = -[PKPassEntitlementsComposer initWithMyEntitlements:](v9, "initWithMyEntitlements:", self->_myEntitlements);
  }
  else
  {
    v10 = -[PKPassEntitlementsComposer initWithSharedEntitlements:availableEntitlements:editable:](v9, "initWithSharedEntitlements:availableEntitlements:editable:", MEMORY[0x1E0C9AA60], self->_shareableEntitlements, 1);
    -[PKSharedPassSharesController possiblePredefinedEntitlements](self, "possiblePredefinedEntitlements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassEntitlementsComposer setPossiblePredefinedSharedEntitlementSelection:](v10, "setPossiblePredefinedSharedEntitlementSelection:", v11);

    -[PKPassEntitlementsComposer predefinedEntitlementEntries](v10, "predefinedEntitlementEntries");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassEntitlementsComposer viewForPredefined:](v10, "viewForPredefined:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setEnabled:", 1);
    }
    else
    {
      -[PKPassEntitlementsComposer entitlementEntries](v10, "entitlementEntries");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (unint64_t)fmin((double)(unint64_t)objc_msgSend(v14, "count"), (double)-[PKSharedPassSharesController maxEntitlementSelectionCount](self, "maxEntitlementSelectionCount"));
      if (v15)
      {
        for (i = 0; i != v15; ++i)
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", i);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPassEntitlementsComposer viewFor:](v10, "viewFor:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "setEnabled:", 1);
        }
      }
    }

  }
  -[PKPassEntitlementsComposer composeSharedEntitlements](v10, "composeSharedEntitlements");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShare setSharedEntitlements:](v5, "setSharedEntitlements:", v19);

  return v5;
}

- (id)baseShareForPassTransferWithIsForCompanion:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  PKPassCredentialShare *v9;
  uint64_t v10;

  v3 = a3;
  -[PKSharedPassSharesController _baseNewShareForPassIsTransfer:](self, "_baseNewShareForPassIsTransfer:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Transfer-%@"), v7);
  objc_msgSend(v5, "setRecipientNickname:", v8);

  if (-[PKSecureElementPass isCarKeyPass](self->_pass, "isCarKeyPass"))
  {
    v9 = objc_alloc_init(PKPassCredentialShare);
    -[PKPassCredentialShare setStatus:](v9, "setStatus:", 2);
    if (v3)
      v10 = 4;
    else
      v10 = 5;
    -[PKPassCredentialShare setTargetDevice:](v9, "setTargetDevice:", v10);
    objc_msgSend(v5, "addCredentialShare:", v9);

  }
  return v5;
}

- (id)possiblePredefinedEntitlements
{
  PKPassSharedEntitlement *v2;
  PKPredefinedSharedEntitlementSelection *v3;
  void *v4;
  void *v5;
  void *v6;
  PKPredefinedSharedEntitlementSelection *v7;
  PKPassSharedEntitlement *v8;
  PKPredefinedSharedEntitlementSelection *v9;
  void *v10;
  void *v11;
  void *v12;
  PKPredefinedSharedEntitlementSelection *v13;
  PKPassSharedEntitlement *v14;
  PKPredefinedSharedEntitlementSelection *v15;
  void *v16;
  void *v17;
  void *v18;
  PKPredefinedSharedEntitlementSelection *v19;
  void *v20;
  _QWORD v22[3];
  PKPassSharedEntitlement *v23;
  PKPassSharedEntitlement *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  if (!-[PKSecureElementPass isCarKeyPass](self->_pass, "isCarKeyPass"))
    return 0;
  v2 = -[PKPassSharedEntitlement initWithCarKeyEntitlementValue:role:]([PKPassSharedEntitlement alloc], "initWithCarKeyEntitlementValue:role:", 0, CFSTR("089f"));
  v3 = [PKPredefinedSharedEntitlementSelection alloc];
  PKLocalizedCredentialString(CFSTR("PREDEFINED_SHARE_ADMIN_TITLE"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedCredentialString(CFSTR("PREDEFINED_SHARE_ADMIN_DESCRIPTION"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKPredefinedSharedEntitlementSelection initWithTitle:description:sharedEntitlements:](v3, "initWithTitle:description:sharedEntitlements:", v4, v5, v6);

  v8 = -[PKPassSharedEntitlement initWithCarKeyEntitlementValue:role:]([PKPassSharedEntitlement alloc], "initWithCarKeyEntitlementValue:role:", 0, CFSTR("080A"));
  v9 = [PKPredefinedSharedEntitlementSelection alloc];
  PKLocalizedCredentialString(CFSTR("PREDEFINED_SHARE_FAMILY_TITLE"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedCredentialString(CFSTR("PREDEFINED_SHARE_FAMILY_DESCRIPTION"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PKPredefinedSharedEntitlementSelection initWithTitle:description:sharedEntitlements:](v9, "initWithTitle:description:sharedEntitlements:", v10, v11, v12);

  v14 = -[PKPassSharedEntitlement initWithCarKeyEntitlementValue:role:]([PKPassSharedEntitlement alloc], "initWithCarKeyEntitlementValue:role:", 0, CFSTR("0009"));
  v15 = [PKPredefinedSharedEntitlementSelection alloc];
  PKLocalizedCredentialString(CFSTR("PREDEFINED_SHARE_GUEST_TITLE"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedCredentialString(CFSTR("PREDEFINED_SHARE_GUEST_DESCRIPTION"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PKPredefinedSharedEntitlementSelection initWithTitle:description:sharedEntitlements:](v15, "initWithTitle:description:sharedEntitlements:", v16, v17, v18);

  v22[0] = v7;
  v22[1] = v13;
  v22[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)addDefaultShareActivationOptionsToShare:(id)a3 availableOptions:(id *)a4 allowUserEdit:(BOOL *)a5 channelBundleIdentifier:(id)a6 isRecipientKnownContact:(BOOL)a7
{
  _BOOL8 v7;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a7;
  v15 = a3;
  -[PKSharedPassSharesController shareInitiationActivationConfigurationForChannelBundleIdentifier:isRecipientKnownContact:](self, "shareInitiationActivationConfigurationForChannelBundleIdentifier:isRecipientKnownContact:", a6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (a5)
    *a5 = objc_msgSend(v12, "allowUserEdit");
  if (a4)
  {
    objc_msgSend(v13, "availableOptions");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "defaultOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v15, "setActivationOptions:", v14);

}

- (id)shareInitiationActivationConfigurationForChannelBundleIdentifier:(id)a3 isRecipientKnownContact:(BOOL)a4
{
  _BOOL4 v4;
  __CFString *v6;
  __CFString *v7;
  int v8;
  __CFString *v9;
  __CFString *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  char v25;
  char v26;
  void *v27;
  NSObject *v28;
  PKPassShareActivationOption *v29;
  PKPassShareActivationOption *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  BOOL v34;
  char v35;
  char v36;
  void *v37;
  void *v38;
  uint64_t v39;
  PKPassShareActivationOption *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  PKPassShareActivationOptions *v44;
  _BOOL8 v45;
  PKPassShareInitiationActivationConfiguration *v46;
  PKPassShareInitiationActivationConfiguration *v47;
  NSObject *v48;
  const __CFString *v49;
  _BOOL4 v51;
  uint8_t buf[4];
  __CFString *v53;
  __int16 v54;
  const __CFString *v55;
  __int16 v56;
  PKPassShareInitiationActivationConfiguration *v57;
  __int16 v58;
  void *v59;
  PKPassShareActivationOption *v60;
  void *v61;
  _QWORD v62[3];

  v4 = a4;
  v62[2] = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = v6;
  if (v6 == CFSTR("com.apple.UIKit.activity.Message"))
    goto LABEL_77;
  if (!v6)
    goto LABEL_16;
  v8 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("com.apple.UIKit.activity.Message"));

  if (v8)
  {
LABEL_77:
    if (PKSharingUseIMessageExtension())
      goto LABEL_12;
  }
  v9 = v7;
  if (v9 == CFSTR("com.apple.UIKit.activity.AirDrop"))
  {
LABEL_12:
    if (v4)
      v12 = 3;
    else
      v12 = 2;
    goto LABEL_15;
  }
  v10 = v9;
  if (v9)
  {
    v11 = -[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("com.apple.UIKit.activity.AirDrop"));

    if (v4)
      v12 = 3;
    else
      v12 = 2;
    if (!v11)
      goto LABEL_17;
LABEL_15:
    v11 = 1;
    goto LABEL_18;
  }
LABEL_16:

  v11 = 0;
LABEL_17:
  v12 = 1;
LABEL_18:
  -[PKSharedPassSharesController _sharingActivationConfigurationForChannel:channelRisk:](self, "_sharingActivationConfigurationForChannel:channelRisk:", v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    v15 = 0;
  else
    v15 = v11;
  if (v11 && v13)
    v15 = objc_msgSend(v13, "trustLevel") == 1;
  v16 = objc_msgSend(v14, "defaultState");
  v51 = v4;
  if (v14 && v16)
    v17 = v16 == 1;
  else
    v17 = !v15 || !v4;
  if (!-[PKSecureElementPass isCarKeyPass](self->_pass, "isCarKeyPass"))
  {
    v22 = 0;
    goto LABEL_57;
  }
  -[PKSecureElementPass devicePrimaryPaymentApplication](self->_pass, "devicePrimaryPaymentApplication");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "subcredentials");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "anyObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sharingConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activationOptions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = PKSharingCarKeyActivationOptionForceVEP();
  v24 = PKSharingCarKeyActivationOptionForcePhysicalKey();
  v25 = PKSharingCarKeyActivationOptionForcePinCode();
  v26 = v25;
  v27 = 0;
  if ((v23 | v24) == 1 && (v25 & 1) == 0)
  {
    if (v24)
    {
      PKLogFacilityTypeGetObject(0x20uLL);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v28, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Warning: Forcing physical key due to debug toggle", buf, 2u);
      }

      v29 = -[PKPassShareActivationOption initWithCarKeyIdentifier:]([PKPassShareActivationOption alloc], "initWithCarKeyIdentifier:", CFSTR("ownerKeyActivation"));
      v62[0] = v29;
      v30 = -[PKPassShareActivationOption initWithCarKeyIdentifier:]([PKPassShareActivationOption alloc], "initWithCarKeyIdentifier:", CFSTR("keyFobActivation"));
      v62[1] = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
        goto LABEL_44;
    }
    else
    {
      v27 = 0;
      if (!v23)
        goto LABEL_44;
    }
    PKLogFacilityTypeGetObject(0x20uLL);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v31, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Warning: Forcing VEP due to debug toggle", buf, 2u);
    }

    +[PKPassShareActivationOption vehicleEnteredPin](PKPassShareActivationOption, "vehicleEnteredPin");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setValue:", CFSTR("112233"));
    if (v27)
    {
      objc_msgSend(v27, "arrayByAddingObject:", v32);
      v33 = objc_claimAutoreleasedReturnValue();

      v27 = (void *)v33;
    }
    else
    {
      v61 = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
LABEL_44:
  if (v27)
    v34 = 1;
  else
    v34 = v22 == 0;
  v35 = v34 || v15;
  v36 = v35 | v26;
  if (v34)
    v37 = v27;
  else
    v37 = 0;
  if ((v36 & 1) == 0)
  {
    PKPassShareActivationOptionExternallyManagedTypes();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "optionsOfTypes:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v37)
  {
    v39 = 0;
    v17 = 1;
    goto LABEL_65;
  }
LABEL_57:
  objc_msgSend(v22, "optionOfType:", 1);
  v40 = (PKPassShareActivationOption *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    if (!v14)
      goto LABEL_62;
  }
  else
  {
    v40 = -[PKPassShareActivationOption initWithDefaultIdentifierForType:]([PKPassShareActivationOption alloc], "initWithDefaultIdentifierForType:", 1);
    if (!v14)
      goto LABEL_62;
  }
  if (objc_msgSend(v14, "codeLength") >= 6)
  {
    v41 = objc_msgSend(v14, "codeLength");
    goto LABEL_64;
  }
LABEL_62:
  v41 = 6;
LABEL_64:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", PKRandomNumberOfLength(v41));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "stringValue");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareActivationOption setValue:](v40, "setValue:", v43);

  v60 = v40;
  v39 = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_65:
  v44 = -[PKPassShareActivationOptions initWithOptions:]([PKPassShareActivationOptions alloc], "initWithOptions:", v37);
  if (v14)
    v45 = objc_msgSend(v14, "trustLevel") == 3;
  else
    v45 = 0;
  v46 = objc_alloc_init(PKPassShareInitiationActivationConfiguration);
  v47 = v46;
  if (v17)
    -[PKPassShareInitiationActivationConfiguration setDefaultOptions:](v46, "setDefaultOptions:", v44);
  -[PKPassShareInitiationActivationConfiguration setAvailableOptions:](v47, "setAvailableOptions:", v44);
  -[PKPassShareInitiationActivationConfiguration setAllowUserEdit:](v47, "setAllowUserEdit:", v39);
  -[PKPassShareInitiationActivationConfiguration setIsBlocked:](v47, "setIsBlocked:", v45);
  PKLogFacilityTypeGetObject(0x20uLL);
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    v49 = CFSTR("No");
    *(_DWORD *)buf = 138413058;
    v53 = v7;
    v54 = 2112;
    if (v51)
      v49 = CFSTR("Yes");
    v55 = v49;
    v56 = 2112;
    v57 = v47;
    v58 = 2112;
    v59 = v14;
    _os_log_impl(&dword_18FC92000, v48, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Determined activation options for channel: '%@' known recipient: '%@'. \n\nConfiguration: %@ \n\nFeature: %@", buf, 0x2Au);
  }

  return v47;
}

- (void)prewarmCreateShare
{
  void *v3;
  id v4;

  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PKObject uniqueID](self->_pass, "uniqueID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "prewarmCreateShareForPassIdentifier:completion:", v3, 0);

  }
}

- (int64_t)_randomCodeOfLength:(int64_t)a3
{
  unsigned int v4;
  double v5;

  v4 = __exp10((double)(a3 - 1));
  v5 = __exp10((double)a3);
  return arc4random_uniform((v5 + -1.0) - v4 + 1) + v4;
}

- (id)blockedSharingChannels
{
  void *v2;
  void *v3;

  -[PKSharedPassSharesController _sharingActivationConfigurationForChannel:channelRisk:](self, "_sharingActivationConfigurationForChannel:channelRisk:", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "blockedSharingChannels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)allowedSharingChannels
{
  void *v2;
  void *v3;

  -[PKSharedPassSharesController _sharingActivationConfigurationForChannel:channelRisk:](self, "_sharingActivationConfigurationForChannel:channelRisk:", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allowedSharingChannels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isSharingChannelBlockedForChannel:(id)a3 isRecipientKnownContact:(BOOL)a4
{
  void *v4;
  char v5;

  -[PKSharedPassSharesController shareInitiationActivationConfigurationForChannelBundleIdentifier:isRecipientKnownContact:](self, "shareInitiationActivationConfigurationForChannelBundleIdentifier:isRecipientKnownContact:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isBlocked");

  return v5;
}

- (id)_feature
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  -[PKPaymentWebService context](self->_webService, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass passTypeIdentifier](self->_pass, "passTypeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "regionForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "regionCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceRegion");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v3, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "featureWithType:inRegion:", 5, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_sharingActivationConfigurationForChannel:(id)a3 channelRisk:(int64_t)a4
{
  id v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  int64_t v27;
  int64_t v28;

  v6 = a3;
  -[PKSharedPassSharesController _feature](self, "_feature");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activationCodeConfigurations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKSecureElementPass accessType](self->_pass, "accessType");
  PKDeviceClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKOSVersionRequirement fromDeviceVersion](PKOSVersionRequirement, "fromDeviceVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSecureElementPass devicePrimaryPaymentApplication](self->_pass, "devicePrimaryPaymentApplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "subcredentials");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "anyObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "manufacturerIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __86__PKSharedPassSharesController__sharingActivationConfigurationForChannel_channelRisk___block_invoke;
  v22[3] = &unk_1E2ADAA08;
  v27 = a4;
  v28 = v8;
  v23 = v6;
  v24 = v10;
  v25 = v9;
  v26 = v14;
  v15 = v14;
  v16 = v9;
  v17 = v10;
  v18 = v6;
  objc_msgSend(v7, "pk_firstObjectPassingTest:", v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t __86__PKSharedPassSharesController__sharingActivationConfigurationForChannel_channelRisk___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  uint64_t v18;

  v3 = a2;
  objc_msgSend(v3, "channelBundleIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    if (v5)
    {
      v6 = v5;
      if (v6 == v4)
      {

      }
      else
      {
        v7 = v6;
        v8 = objc_msgSend(v6, "caseInsensitiveCompare:", v4);

        if (v8)
          goto LABEL_18;
      }
    }
  }
  v9 = objc_msgSend(v3, "channelRiskLevel");
  if (!v9 || *(_QWORD *)(a1 + 64) == v9)
  {
    v10 = objc_msgSend(v3, "accessPassType");
    if (!v10 || *(_QWORD *)(a1 + 72) == v10)
    {
      objc_msgSend(v3, "versionRange");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11
        && !objc_msgSend(v11, "versionMeetsRequirements:deviceClass:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)))
      {
        v18 = 0;
LABEL_25:

        goto LABEL_26;
      }
      objc_msgSend(v3, "manufacturerIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = *(id *)(a1 + 56);
        v15 = v13;
        v16 = v15;
        if (v14 == v15)
        {

        }
        else
        {
          if (!v14)
          {

LABEL_23:
            v18 = 0;
            goto LABEL_24;
          }
          v17 = objc_msgSend(v14, "isEqualToString:", v15);

          if (!v17)
            goto LABEL_23;
        }
      }
      v18 = 1;
LABEL_24:

      goto LABEL_25;
    }
  }
LABEL_18:
  v18 = 0;
LABEL_26:

  return v18;
}

- (void)sharesDidUpdateWithPaymentPassWithUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v8[5];
  id v9;
  id location;

  v4 = a3;
  -[PKObject uniqueID](self->_pass, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_msgSend(v4, "isEqual:", v5);

    if ((v7 & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }

  if (v6 == v4)
  {
LABEL_6:
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __83__PKSharedPassSharesController_sharesDidUpdateWithPaymentPassWithUniqueIdentifier___block_invoke;
    v8[3] = &unk_1E2ACA978;
    v8[4] = self;
    objc_copyWeak(&v9, &location);
    -[PKSharedPassSharesController updateSharesWithCompletion:](self, "updateSharesWithCompletion:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
LABEL_7:

}

void __83__PKSharedPassSharesController_sharesDidUpdateWithPaymentPassWithUniqueIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  v1 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__PKSharedPassSharesController_sharesDidUpdateWithPaymentPassWithUniqueIdentifier___block_invoke_2;
  block[3] = &unk_1E2AC3648;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __83__PKSharedPassSharesController_sharesDidUpdateWithPaymentPassWithUniqueIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didUpdateShares");

}

- (PKSecureElementPass)pass
{
  return self->_pass;
}

- (BOOL)isOwnerSharing
{
  return self->_isOwnerSharing;
}

- (void)setIsOwnerSharing:(BOOL)a3
{
  self->_isOwnerSharing = a3;
}

- (NSArray)shares
{
  return self->_shares;
}

- (NSArray)shareableEntitlements
{
  return self->_shareableEntitlements;
}

- (NSArray)myEntitlements
{
  return self->_myEntitlements;
}

- (PKPassShare)mostRecentlyCreatedShare
{
  return self->_mostRecentlyCreatedShare;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentlyCreatedShare, 0);
  objc_storeStrong((id *)&self->_myEntitlements, 0);
  objc_storeStrong((id *)&self->_shareableEntitlements, 0);
  objc_storeStrong((id *)&self->_shares, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_paymentServiceProvider, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
}

@end
