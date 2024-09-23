@implementation PKDeviceSharingCapabilitiesManager

- (PKDeviceSharingCapabilitiesManager)init
{
  PKDeviceSharingCapabilitiesManager *v2;
  PKPaymentService *v3;
  PKPaymentService *paymentService;
  NSMutableDictionary *v5;
  NSMutableDictionary *fetchStatusByAppleID;
  NSMutableArray *v7;
  NSMutableArray *familyMembers;
  uint64_t v9;
  NSHashTable *observers;
  dispatch_queue_t v11;
  OS_dispatch_queue *replyQueue;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKDeviceSharingCapabilitiesManager;
  v2 = -[PKDeviceSharingCapabilitiesManager init](&v14, sel_init);
  if (v2)
  {
    v3 = -[PKPaymentService initWithDelegate:]([PKPaymentService alloc], "initWithDelegate:", v2);
    paymentService = v2->_paymentService;
    v2->_paymentService = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    fetchStatusByAppleID = v2->_fetchStatusByAppleID;
    v2->_fetchStatusByAppleID = v5;

    *(_QWORD *)&v2->_lockObservers._os_unfair_lock_opaque = 0;
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    familyMembers = v2->_familyMembers;
    v2->_familyMembers = v7;

    objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
    v9 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v9;

    v11 = dispatch_queue_create("com.apple.passkit.PKDeviceSharingCapabilitiesManager.reply", 0);
    replyQueue = v2->_replyQueue;
    v2->_replyQueue = (OS_dispatch_queue *)v11;

  }
  return v2;
}

- (void)fetchDeviceCapabilitesForAppleIDs:(id)a3 associatedFamilyMembers:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  PKDeviceSharingCapabilitiesFetchStatus *v16;
  void *v17;
  PKDeviceSharingCapabilitiesFetchStatus *v18;
  PKPaymentService *paymentService;
  id obj;
  _QWORD v21[6];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v6;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        os_unfair_lock_lock(&self->_lock);
        -[NSMutableArray addObjectsFromArray:](self->_familyMembers, "addObjectsFromArray:", v7);
        -[NSMutableDictionary objectForKey:](self->_fetchStatusByAppleID, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        PKLogFacilityTypeGetObject(6uLL);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (v13)
        {
          if (v15)
          {
            *(_DWORD *)buf = 138412290;
            v27 = v12;
            _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Not fetching family member device capabilities since one is already in progress %@", buf, 0xCu);
          }

          os_unfair_lock_unlock(&self->_lock);
        }
        else
        {
          if (v15)
          {
            *(_DWORD *)buf = 138412290;
            v27 = v12;
            _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Fetching family member device capabilities %@", buf, 0xCu);
          }

          v16 = [PKDeviceSharingCapabilitiesFetchStatus alloc];
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[PKDeviceSharingCapabilitiesFetchStatus initWithAppleID:fetchStartDate:](v16, "initWithAppleID:fetchStartDate:", v12, v17);

          -[PKDeviceSharingCapabilitiesFetchStatus setDeviceCountFetchInProgress:](v18, "setDeviceCountFetchInProgress:", 1);
          -[NSMutableDictionary setObject:forKey:](self->_fetchStatusByAppleID, "setObject:forKey:", v18, v12);

          os_unfair_lock_unlock(&self->_lock);
          paymentService = self->_paymentService;
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __96__PKDeviceSharingCapabilitiesManager_fetchDeviceCapabilitesForAppleIDs_associatedFamilyMembers___block_invoke;
          v21[3] = &unk_1E2AD2C48;
          v21[4] = self;
          v21[5] = v12;
          -[PKPaymentService sendDeviceSharingCapabilitiesRequestForHandle:completion:](paymentService, "sendDeviceSharingCapabilitiesRequestForHandle:completion:", v12, v21);
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v9);
  }

}

void __96__PKDeviceSharingCapabilitiesManager_fetchDeviceCapabilitesForAppleIDs_associatedFamilyMembers___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  os_unfair_lock_s *v5;
  id v6;
  id v7;

  v5 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 20);
  v6 = a3;
  os_unfair_lock_lock(v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMaximumPossibleDevices:", a2);
  objc_msgSend(v7, "setFetchError:", v6);

  objc_msgSend(v7, "setDeviceCountFetchInProgress:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKey:", v7, *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 20));
  objc_msgSend(*(id *)(a1 + 32), "_sendDeviceSharingCapabilitiesUpdated:maximumPossibleDevices:forAppleID:", v7, a2, *(_QWORD *)(a1 + 40));

}

- (id)currentFetchStatusForAppleID:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  if (a3)
  {
    p_lock = &self->_lock;
    v5 = a3;
    os_unfair_lock_lock(p_lock);
    -[NSMutableDictionary objectForKey:](self->_fetchStatusByAppleID, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)didReceiveDeviceSharingCapabilities:(id)a3 forHandle:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  NSObject *v25;
  id v26;
  NSMutableArray *obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_fetchStatusByAppleID, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
LABEL_33:
    objc_msgSend(v9, "addDeviceSharingCapabilities:", v6);
    PKLogFacilityTypeGetObject(6uLL);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v37 = v7;
      v38 = 2112;
      v39 = v9;
      _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, "Updating device capabilities for appleID %@, %@", buf, 0x16u);
    }
    goto LABEL_39;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v10 = self->_familyMembers;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (!v11)
  {

    goto LABEL_36;
  }
  v12 = v11;
  v26 = v6;
  v9 = 0;
  v13 = *(_QWORD *)v33;
  obj = v10;
  while (2)
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v33 != v13)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
      objc_msgSend(v15, "appleID");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = v7;
      v18 = v17;
      if (v16 == v17)
      {

LABEL_14:
        -[NSMutableDictionary objectForKey:](self->_fetchStatusByAppleID, "objectForKey:", v18);
        v16 = v9;
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      if (v7 && v16)
      {
        v19 = objc_msgSend(v16, "isEqualToString:", v17);

        if (!v19)
        {
          if (v9)
            goto LABEL_32;
          goto LABEL_17;
        }
        goto LABEL_14;
      }

LABEL_16:
      if (v9)
      {
LABEL_32:

        p_lock = &self->_lock;
        v6 = v26;
        goto LABEL_33;
      }
LABEL_17:
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      objc_msgSend(v15, "appleIDAliases");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      if (v21)
      {
        v22 = v21;
        v9 = 0;
        v23 = *(_QWORD *)v29;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v29 != v23)
              objc_enumerationMutation(v20);
            if (!v9)
            {
              -[NSMutableDictionary objectForKey:](self->_fetchStatusByAppleID, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j));
              v9 = (void *)objc_claimAutoreleasedReturnValue();
            }
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
        }
        while (v22);
      }
      else
      {
        v9 = 0;
      }

    }
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    if (v12)
      continue;
    break;
  }

  p_lock = &self->_lock;
  v6 = v26;
  if (v9)
    goto LABEL_33;
LABEL_36:
  PKLogFacilityTypeGetObject(6uLL);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v7;
    _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, "Not responding to device capabilities for appleID %@", buf, 0xCu);
  }
  v9 = 0;
LABEL_39:

  os_unfair_lock_unlock(p_lock);
  -[PKDeviceSharingCapabilitiesManager _sendDeviceSharingCapabilitiesUpdated:newSharingCapabilties:forAppleID:](self, "_sendDeviceSharingCapabilitiesUpdated:newSharingCapabilties:forAppleID:", v9, v6, v7);

}

- (void)_sendDeviceSharingCapabilitiesUpdated:(id)a3 newSharingCapabilties:(id)a4 forAppleID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __109__PKDeviceSharingCapabilitiesManager__sendDeviceSharingCapabilitiesUpdated_newSharingCapabilties_forAppleID___block_invoke;
  v14[3] = &unk_1E2AD2C70;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[PKDeviceSharingCapabilitiesManager _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v14);

}

void __109__PKDeviceSharingCapabilitiesManager__sendDeviceSharingCapabilitiesUpdated_newSharingCapabilties_forAppleID___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "deviceSharingCapabilitiesUpdated:newSharingCapabilties:forAppleID:", a1[4], a1[5], a1[6]);

}

- (void)_sendDeviceSharingCapabilitiesUpdated:(id)a3 maximumPossibleDevices:(int64_t)a4 forAppleID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  int64_t v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __110__PKDeviceSharingCapabilitiesManager__sendDeviceSharingCapabilitiesUpdated_maximumPossibleDevices_forAppleID___block_invoke;
  v12[3] = &unk_1E2AD2C98;
  v14 = v9;
  v15 = a4;
  v13 = v8;
  v10 = v9;
  v11 = v8;
  -[PKDeviceSharingCapabilitiesManager _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v12);

}

void __110__PKDeviceSharingCapabilitiesManager__sendDeviceSharingCapabilitiesUpdated_maximumPossibleDevices_forAppleID___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "deviceSharingCapabilitiesUpdated:maximumPossibleDevices:forAppleID:", a1[4], a1[6], a1[5]);

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
    v8[2] = __66__PKDeviceSharingCapabilitiesManager__accessObserversWithHandler___block_invoke;
    v8[3] = &unk_1E2ABE058;
    v9 = v5;
    v10 = v4;
    v7 = v5;
    dispatch_async(replyQueue, v8);

  }
}

void __66__PKDeviceSharingCapabilitiesManager__accessObserversWithHandler___block_invoke(uint64_t a1)
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchStatusByAppleID, 0);
  objc_storeStrong((id *)&self->_familyMembers, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
