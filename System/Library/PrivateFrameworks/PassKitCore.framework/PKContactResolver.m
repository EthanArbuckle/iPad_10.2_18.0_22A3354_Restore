@implementation PKContactResolver

+ (id)defaultContactResolver
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  PKContactResolver *v8;
  id v9;
  PKContactResolver *v10;
  _QWORD v12[7];

  v12[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  -[objc_class descriptorForRequiredKeysWithThreeDTouchEnabled:](_MergedGlobals_177(), "descriptorForRequiredKeysWithThreeDTouchEnabled:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  objc_msgSend((Class)off_1ECF21B80(), "descriptorForRequiredKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v4;
  objc_msgSend((Class)off_1ECF21B88(), "descriptorForRequiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C966A8];
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = *MEMORY[0x1E0C967C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [PKContactResolver alloc];
  v9 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v10 = -[PKContactResolver initWithContactStore:keysToFetch:](v8, "initWithContactStore:keysToFetch:", v9, v7);

  return v10;
}

- (PKContactResolver)initWithContactStore:(id)a3 keysToFetch:(id)a4
{
  id v7;
  id v8;
  PKContactResolver *v9;
  PKContactResolver *v10;
  NSCache *v11;
  NSCache *handleToContactCache;
  NSCache *v13;
  NSCache *altDSIDToContactCache;
  dispatch_queue_t v15;
  OS_dispatch_queue *replyQueue;
  dispatch_queue_t v17;
  OS_dispatch_queue *workQueue;
  uint64_t v19;
  NSHashTable *delegates;
  void *v21;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PKContactResolver;
  v9 = -[PKContactResolver init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_delegatesLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_contactStore, a3);
    v11 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    handleToContactCache = v10->_handleToContactCache;
    v10->_handleToContactCache = v11;

    v13 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    altDSIDToContactCache = v10->_altDSIDToContactCache;
    v10->_altDSIDToContactCache = v13;

    v15 = dispatch_queue_create("com.apple.PassKit.PKContactResolver.reply", 0);
    replyQueue = v10->_replyQueue;
    v10->_replyQueue = (OS_dispatch_queue *)v15;

    v17 = dispatch_queue_create("com.apple.PassKit.PKContactResolver.work", 0);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v10->_keysToFetch, a4);
    objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
    v19 = objc_claimAutoreleasedReturnValue();
    delegates = v10->_delegates;
    v10->_delegates = (NSHashTable *)v19;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v10, sel__handleContactStoreDidChangeNotification_, *MEMORY[0x1E0C96870], 0);

  }
  return v10;
}

- (void)addDelegate:(id)a3
{
  os_unfair_lock_s *p_delegatesLock;
  id v5;

  p_delegatesLock = &self->_delegatesLock;
  v5 = a3;
  os_unfair_lock_lock(p_delegatesLock);
  -[NSHashTable addObject:](self->_delegates, "addObject:", v5);

  os_unfair_lock_unlock(p_delegatesLock);
}

- (void)removeDelegate:(id)a3
{
  os_unfair_lock_s *p_delegatesLock;
  id v5;

  p_delegatesLock = &self->_delegatesLock;
  v5 = a3;
  os_unfair_lock_lock(p_delegatesLock);
  -[NSHashTable removeObject:](self->_delegates, "removeObject:", v5);

  os_unfair_lock_lock(p_delegatesLock);
}

- (void)_accessDelegatesWithHandler:(id)a3
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
    os_unfair_lock_lock(&self->_delegatesLock);
    -[NSHashTable allObjects](self->_delegates, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_delegatesLock);
    replyQueue = self->_replyQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49__PKContactResolver__accessDelegatesWithHandler___block_invoke;
    v8[3] = &unk_1E2ABE058;
    v9 = v5;
    v10 = v4;
    v7 = v5;
    dispatch_async(replyQueue, v8);

  }
}

void __49__PKContactResolver__accessDelegatesWithHandler___block_invoke(uint64_t a1)
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

- (void)invalidateCache
{
  -[NSCache removeAllObjects](self->_handleToContactCache, "removeAllObjects");
  -[NSCache removeAllObjects](self->_altDSIDToContactCache, "removeAllObjects");
}

- (void)_handleContactStoreDidChangeNotification:(id)a3
{
  _QWORD v4[5];

  -[PKContactResolver invalidateCache](self, "invalidateCache", a3);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__PKContactResolver__handleContactStoreDidChangeNotification___block_invoke;
  v4[3] = &unk_1E2AD1CF8;
  v4[4] = self;
  -[PKContactResolver _accessDelegatesWithHandler:](self, "_accessDelegatesWithHandler:", v4);
}

uint64_t __62__PKContactResolver__handleContactStoreDidChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contactsDidChangeForContactResolver:", *(_QWORD *)(a1 + 32));
}

- (id)_predicateForHandle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "containsString:", CFSTR("@")))
    {
      objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithDigits:countryCode:", v4, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", v6);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        PKLogFacilityTypeGetObject(0xBuLL);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v9 = 138412290;
          v10 = 0;
          _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Could not convert phone number to CNPhoneNumber: %@", (uint8_t *)&v9, 0xCu);
        }

        v5 = 0;
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasCachedResultForHandle:(id)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  -[NSCache objectForKey:](self->_handleToContactCache, "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)contactForHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t *v8;
  id v9;
  void *v10;
  id v11;
  CNContactStore *contactStore;
  id v13;
  NSObject *v14;
  NSCache *handleToContactCache;
  NSObject *v16;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__39;
    v24 = __Block_byref_object_dispose__39;
    v25 = 0;
    -[NSCache objectForKey:](self->_handleToContactCache, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 == v6)
        v7 = 0;
      else
        v7 = v5;
      v8 = v21;
      v9 = v7;
      v10 = (void *)v8[5];
      v8[5] = (uint64_t)v9;
      goto LABEL_17;
    }
    -[PKContactResolver _predicateForHandle:](self, "_predicateForHandle:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
LABEL_18:

      v11 = (id)v21[5];
      _Block_object_dispose(&v20, 8);

      goto LABEL_19;
    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97210]), "initWithKeysToFetch:", self->_keysToFetch);
    objc_msgSend(v10, "setPredicate:", v6);
    contactStore = self->_contactStore;
    v19 = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __38__PKContactResolver_contactForHandle___block_invoke;
    v18[3] = &unk_1E2AD1D20;
    v18[4] = &v20;
    -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:](contactStore, "enumerateContactsWithFetchRequest:error:usingBlock:", v10, &v19, v18);
    v13 = v19;
    if (v13)
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v13;
        _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Error fetching contact: %@", buf, 0xCu);
      }
    }
    else
    {
      handleToContactCache = self->_handleToContactCache;
      v16 = v21[5];
      v14 = v16;
      if (!v16)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      -[NSCache setObject:forKey:](handleToContactCache, "setObject:forKey:", v14, v4);
      if (v16)
        goto LABEL_16;
    }

LABEL_16:
LABEL_17:

    goto LABEL_18;
  }
  v11 = 0;
LABEL_19:

  return v11;
}

void __38__PKContactResolver_contactForHandle___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

- (id)contactForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CNContactStore *contactStore;
  id v11;
  NSObject *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0C97200];
    v25[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predicateForContactsWithIdentifiers:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97210]), "initWithKeysToFetch:", self->_keysToFetch);
    objc_msgSend(v9, "setPredicate:", v8);
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__39;
    v21 = __Block_byref_object_dispose__39;
    v22 = 0;
    contactStore = self->_contactStore;
    v15[4] = &v17;
    v16 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __42__PKContactResolver_contactForIdentifier___block_invoke;
    v15[3] = &unk_1E2AD1D20;
    -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:](contactStore, "enumerateContactsWithFetchRequest:error:usingBlock:", v9, &v16, v15);
    v11 = v16;
    if (v11)
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v11;
        _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Error fetching contact: %@", buf, 0xCu);
      }

    }
    v13 = (id)v18[5];
    _Block_object_dispose(&v17, 8);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __42__PKContactResolver_contactForIdentifier___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

- (BOOL)hasCachedResultForAccountUser:(id)a3
{
  NSCache *altDSIDToContactCache;
  void *v4;
  void *v5;
  BOOL v6;

  if (!a3)
    return 0;
  altDSIDToContactCache = self->_altDSIDToContactCache;
  objc_msgSend(a3, "altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](altDSIDToContactCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (id)contactForAccountUser:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  CNContactStore *contactStore;
  id v21;
  NSObject *v22;
  NSCache *altDSIDToContactCache;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[4];
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31 = v4;
  if (v4)
  {
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__39;
    v42 = __Block_byref_object_dispose__39;
    v43 = 0;
    objc_msgSend(v4, "altDSID");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSCache objectForKey:](self->_altDSIDToContactCache, "objectForKey:", v5);
    v29 = (void *)v5;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v30;
      v8 = (id)v6;
      if (v30 == (void *)v6)
        v7 = 0;
      v9 = v39;
      v10 = v7;
      v11 = (void *)v9[5];
      v9[5] = (uint64_t)v10;
    }
    else
    {
      v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(v31, "addressableHandles");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
        objc_msgSend(v13, "unionSet:", v14);
      v27 = (void *)v14;
      objc_msgSend(v31, "appleID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
        objc_msgSend(v13, "addObject:", v28);
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v8 = v13;
      v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v35;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v35 != v16)
              objc_enumerationMutation(v8);
            -[PKContactResolver _predicateForHandle:](self, "_predicateForHandle:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97210]), "initWithKeysToFetch:", self->_keysToFetch);
              objc_msgSend(v19, "setPredicate:", v18);
              contactStore = self->_contactStore;
              v33 = 0;
              v32[0] = MEMORY[0x1E0C809B0];
              v32[1] = 3221225472;
              v32[2] = __43__PKContactResolver_contactForAccountUser___block_invoke;
              v32[3] = &unk_1E2AD1D20;
              v32[4] = &v38;
              -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:](contactStore, "enumerateContactsWithFetchRequest:error:usingBlock:", v19, &v33, v32);
              v21 = v33;
              if (v21)
              {
                PKLogFacilityTypeGetObject(0xEuLL);
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v45 = v21;
                  _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "Error fetching contact: %@", buf, 0xCu);
                }

              }
              else if (v39[5])
              {

                goto LABEL_27;
              }

            }
          }
          v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
          if (v15)
            continue;
          break;
        }
      }
LABEL_27:

      altDSIDToContactCache = self->_altDSIDToContactCache;
      v24 = (void *)v39[5];
      v25 = v24;
      if (!v24)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[NSCache setObject:forKey:](altDSIDToContactCache, "setObject:forKey:", v25, v29);
      if (!v24)

      v11 = v27;
    }

    v12 = (id)v39[5];
    _Block_object_dispose(&v38, 8);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __43__PKContactResolver_contactForAccountUser___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

- (void)contactForAccountUser:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__PKContactResolver_contactForAccountUser_withCompletion___block_invoke;
    block[3] = &unk_1E2ABE030;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(workQueue, block);

  }
}

void __58__PKContactResolver_contactForAccountUser_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "contactForAccountUser:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__PKContactResolver_contactForAccountUser_withCompletion___block_invoke_2;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 48);
  v7 = v2;
  v8 = v4;
  v5 = v2;
  dispatch_async(v3, v6);

}

uint64_t __58__PKContactResolver_contactForAccountUser_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)contactForHandles:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  _QWORD block[4];
  id v10;
  PKContactResolver *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__PKContactResolver_contactForHandles_withCompletion___block_invoke;
    block[3] = &unk_1E2ABE030;
    v10 = v6;
    v11 = self;
    v12 = v7;
    dispatch_async(workQueue, block);

  }
}

void __54__PKContactResolver_contactForHandles_withCompletion___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
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
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 40), "hasCachedResultForHandle:", v9))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v2, "setObject:forKey:", v10, v9);
          }

        }
        else
        {
          objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v3;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
          objc_msgSend(*(id *)(a1 + 40), "contactForHandle:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v2, "setObject:forKey:", v17, v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v13);
    }

  }
  v18 = *(void **)(a1 + 48);
  v19 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __54__PKContactResolver_contactForHandles_withCompletion___block_invoke_2;
  v21[3] = &unk_1E2ABDA18;
  v22 = v2;
  v23 = v18;
  v20 = v2;
  dispatch_async(v19, v21);

}

void __54__PKContactResolver_contactForHandles_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)contactForHandle:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__PKContactResolver_contactForHandle_withCompletion___block_invoke;
    block[3] = &unk_1E2ABE030;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(workQueue, block);

  }
}

void __53__PKContactResolver_contactForHandle_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "contactForHandle:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__PKContactResolver_contactForHandle_withCompletion___block_invoke_2;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 48);
  v7 = v2;
  v8 = v4;
  v5 = v2;
  dispatch_async(v3, v6);

}

uint64_t __53__PKContactResolver_contactForHandle_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)contactForFamilyMember:(id)a3 nameComponents:(id)a4 imageData:(id)a5
{
  unint64_t v7;
  unint64_t v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = (unint64_t)a3;
  v8 = (unint64_t)a4;
  v9 = a5;
  if (v7 | v8)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C97360]);
    if (v7)
    {
      objc_msgSend((id)v7, "firstName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setGivenName:", v11);

      objc_msgSend((id)v7, "lastName");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v8)
      {
LABEL_8:
        objc_msgSend(v10, "setImageData:", v9);
        v13 = (void *)objc_msgSend(v10, "copy");

        goto LABEL_9;
      }
      objc_msgSend((id)v8, "givenName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setGivenName:", v14);

      objc_msgSend((id)v8, "familyName");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v12;
    objc_msgSend(v10, "setFamilyName:", v12);

    goto LABEL_8;
  }
  v13 = 0;
LABEL_9:

  return v13;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (NSArray)keysToFetch
{
  return self->_keysToFetch;
}

- (NSCache)handleToContactCache
{
  return self->_handleToContactCache;
}

- (void)setHandleToContactCache:(id)a3
{
  objc_storeStrong((id *)&self->_handleToContactCache, a3);
}

- (NSCache)altDSIDToContactCache
{
  return self->_altDSIDToContactCache;
}

- (void)setAltDSIDToContactCache:(id)a3
{
  objc_storeStrong((id *)&self->_altDSIDToContactCache, a3);
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_delegates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_altDSIDToContactCache, 0);
  objc_storeStrong((id *)&self->_handleToContactCache, 0);
  objc_storeStrong((id *)&self->_keysToFetch, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
}

@end
