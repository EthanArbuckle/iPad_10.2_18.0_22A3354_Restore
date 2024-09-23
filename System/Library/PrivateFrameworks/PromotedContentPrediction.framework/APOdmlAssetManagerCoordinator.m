@implementation APOdmlAssetManagerCoordinator

+ (id)sharedAssetManagerCoordinator
{
  if (qword_1ED532EA8 != -1)
    dispatch_once(&qword_1ED532EA8, &unk_1E6A29260);
  return (id)qword_1ED532EC0;
}

- (void)initializeAssetManagersforPlacementTypes:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  APOdmlAssetManagersForPlacement *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
        v11 = [APOdmlAssetManagersForPlacement alloc];
        v14 = objc_msgSend_unsignedIntegerValue(v10, v12, v13);
        v16 = (void *)objc_msgSend_initWithPlacementType_trialClient_(v11, v15, v14, self->_trialClient);
        objc_msgSend_setObject_forKey_(self->_assetManagers, v17, (uint64_t)v16, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v18, (uint64_t)&v19, v23, 16);
    }
    while (v7);
  }

}

- (id)assetManagerForPlacementType:(unint64_t)a3 assetManagerType:(unint64_t)a4
{
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_trialClient(self, a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v8, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v10;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v11, (uint64_t)v22, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_refreshTrialClientForPlacementTypes_(self, v13, (uint64_t)v12);

  }
  objc_msgSend_assetManagers(self, v8, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x1E0CB37E8], v15, a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v14, v17, (uint64_t)v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetManagerForType_(v18, v19, a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (NSMutableDictionary)assetManagers
{
  return self->_assetManagers;
}

- (APOdmlAssetManagerCoordinator)init
{
  APOdmlAssetManagerCoordinator *v2;
  APOdmlUnfairLock *v3;
  const char *v4;
  uint64_t v5;
  APOdmlUnfairLock *refreshTrialLock;
  const char *v7;
  uint64_t v8;
  TRIClient *trialClient;
  const char *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableDictionary *assetManagers;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  NSOperationQueue *v22;
  NSOperationQueue *refreshClientQueue;
  const char *v24;
  uint64_t v25;
  void *v26;
  NSOperationQueue *v27;
  APOdmlAssetManagerCoordinator *v28;
  const char *v29;
  uint64_t v30;
  NSObject *refreshClientNotificationObserver;
  _QWORD v33[4];
  APOdmlAssetManagerCoordinator *v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)APOdmlAssetManagerCoordinator;
  v2 = -[APOdmlAssetManagerCoordinator init](&v35, sel_init);
  if (v2)
  {
    v3 = [APOdmlUnfairLock alloc];
    v5 = objc_msgSend_initWithOptions_(v3, v4, 1);
    refreshTrialLock = v2->_refreshTrialLock;
    v2->_refreshTrialLock = (APOdmlUnfairLock *)v5;

    objc_msgSend_clientWithIdentifier_(MEMORY[0x1E0DC09C8], v7, 238);
    v8 = objc_claimAutoreleasedReturnValue();
    trialClient = v2->_trialClient;
    v2->_trialClient = (TRIClient *)v8;

    objc_msgSend_setUpdateHandlerForNamespace_(v2, v10, (uint64_t)CFSTR("AD_PLATFORMS_ODML"));
    objc_msgSend_setUpdateHandlerForNamespace_(v2, v11, (uint64_t)CFSTR("SEARCH_ADS_COUNTERFACTUAL"));
    v2->_respondToRefreshNotification = 1;
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    assetManagers = v2->_assetManagers;
    v2->_assetManagers = (NSMutableDictionary *)v14;

    v16 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayWithObjects_(v16, v19, (uint64_t)v18, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_initializeAssetManagersforPlacementTypes_(v2, v21, (uint64_t)v20);

    v22 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    refreshClientQueue = v2->_refreshClientQueue;
    v2->_refreshClientQueue = v22;

    objc_msgSend_defaultCenter(MEMORY[0x1E0CB35B0], v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v2->_refreshClientQueue;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = sub_1B69DBFC8;
    v33[3] = &unk_1E6A29288;
    v28 = v2;
    v34 = v28;
    objc_msgSend_addObserverForName_object_queue_usingBlock_(v26, v29, (uint64_t)CFSTR("kAPODMLDeviceKnowledgeManagerRanNotification"), 0, v27, v33);
    v30 = objc_claimAutoreleasedReturnValue();
    refreshClientNotificationObserver = v28->_refreshClientNotificationObserver;
    v28->_refreshClientNotificationObserver = v30;

  }
  return v2;
}

- (void)setUpdateHandlerForNamespace:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend_trialClient(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B69DC118;
  v10[3] = &unk_1E6A292B0;
  objc_copyWeak(&v11, &location);
  v9 = (id)objc_msgSend_addUpdateHandlerForNamespaceName_usingBlock_(v7, v8, (uint64_t)v4, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)refreshTrialClientForPlacementTypes:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  id v20;

  v4 = a3;
  objc_msgSend_refreshTrialLock(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v7, v8, v9);

  objc_msgSend_clientWithIdentifier_(MEMORY[0x1E0DC09C8], v10, 238);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTrialClient_(self, v12, (uint64_t)v11);

  objc_msgSend_setUpdateHandlerForNamespace_(self, v13, (uint64_t)CFSTR("AD_PLATFORMS_ODML"));
  objc_msgSend_setUpdateHandlerForNamespace_(self, v14, (uint64_t)CFSTR("SEARCH_ADS_COUNTERFACTUAL"));
  objc_msgSend_initializeAssetManagersforPlacementTypes_(self, v15, (uint64_t)v4);

  objc_msgSend_refreshTrialLock(self, v16, v17);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v20, v18, v19);

}

- (BOOL)respondToRefreshNotification
{
  return self->_respondToRefreshNotification;
}

- (void)setRespondToRefreshNotification:(BOOL)a3
{
  self->_respondToRefreshNotification = a3;
}

- (void)setTrialClient:(id)a3
{
  objc_storeStrong((id *)&self->_trialClient, a3);
}

- (NSOperationQueue)refreshClientQueue
{
  return self->_refreshClientQueue;
}

- (void)setRefreshClientQueue:(id)a3
{
  objc_storeStrong((id *)&self->_refreshClientQueue, a3);
}

- (NSObject)refreshClientNotificationObserver
{
  return self->_refreshClientNotificationObserver;
}

- (void)setRefreshClientNotificationObserver:(id)a3
{
  objc_storeStrong((id *)&self->_refreshClientNotificationObserver, a3);
}

- (APOdmlUnfairLock)refreshTrialLock
{
  return self->_refreshTrialLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshTrialLock, 0);
  objc_storeStrong((id *)&self->_assetManagers, 0);
  objc_storeStrong((id *)&self->_refreshClientNotificationObserver, 0);
  objc_storeStrong((id *)&self->_refreshClientQueue, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
}

@end
