@implementation PLXPCPhotoLibraryStoreServerRequestHandlingPolicy

- (PLXPCPhotoLibraryStoreServerRequestHandlingPolicy)init
{
  PLXPCPhotoLibraryStoreServerRequestHandlingPolicy *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLXPCPhotoLibraryStoreServerRequestHandlingPolicy;
  result = -[PLXPCPhotoLibraryStoreServerRequestHandlingPolicy init](&v3, sel_init);
  if (result)
  {
    result->_fetchFilterLock._os_unfair_lock_opaque = 0;
    result->_crashLogMessageLock._os_unfair_lock_opaque = 0;
    result->_restrictedAccessLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (PLXPCPhotoLibraryStoreServerRequestHandlingPolicy)initWithConnectionAuthorization:(id)a3
{
  id v5;
  PLXPCPhotoLibraryStoreServerRequestHandlingPolicy *v6;
  PLXPCPhotoLibraryStoreServerRequestHandlingPolicy *v7;

  v5 = a3;
  v6 = -[PLXPCPhotoLibraryStoreServerRequestHandlingPolicy init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connectionAuthorization, a3);

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (-[NSNumber BOOLValue](self->_fetchFilterLock_fetchFilterEnabledStatus, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self);

  }
  v4.receiver = self;
  v4.super_class = (Class)PLXPCPhotoLibraryStoreServerRequestHandlingPolicy;
  -[PLXPCPhotoLibraryStoreServerRequestHandlingPolicy dealloc](&v4, sel_dealloc);
}

- (id)allowableClassesForClientWithContext:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

- (BOOL)shouldAcceptMetadataChangesFromClientWithContext:(id)a3
{
  return 0;
}

- (id)restrictingWritePredicateForEntity:(id)a3 fromClientWithContext:(id)a4
{
  return 0;
}

- (id)restrictingPullChangeHistoryPredicateForEntity:(id)a3 fromClientWithContext:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0, a4);
}

- (BOOL)shouldAcceptConnectionsFromClientWithContext:(id)a3
{
  return 1;
}

- (id)processFaultForObjectWithID:(id)a3 fromClientWithContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "entity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotosHighlight entityName](PLPhotosHighlight, "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if (v13)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, 0);
      v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)PLXPCPhotoLibraryStoreServerRequestHandlingPolicy;
    -[NSXPCStoreServerRequestHandlingPolicy processFaultForObjectWithID:fromClientWithContext:error:](&v16, sel_processFaultForObjectWithID_fromClientWithContext_error_, v8, v9, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)processFaultForRelationshipWithName:(id)a3 onObjectWithID:(id)a4 fromClientWithContext:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  id v26;
  id *v27;
  PLXPCPhotoLibraryStoreServerRequestHandlingPolicy *v29;
  void *v30;
  id v31;
  objc_super v32;

  v10 = a3;
  v11 = a4;
  v31 = a5;
  objc_msgSend(v11, "entity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "relationshipsByName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "destinationEntity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotosHighlight entityName](PLPhotosHighlight, "entityName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isEqualToString:", v17))
  {

  }
  else
  {
    v29 = self;
    objc_msgSend(v15, "name");
    v30 = v14;
    v18 = v15;
    v19 = v11;
    v20 = v10;
    v21 = a6;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLPhotosHighlight entityName](PLPhotosHighlight, "entityName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqualToString:", v23);

    a6 = v21;
    v10 = v20;
    v11 = v19;
    v15 = v18;
    v14 = v30;

    if (!v24)
    {
      v32.receiver = v29;
      v32.super_class = (Class)PLXPCPhotoLibraryStoreServerRequestHandlingPolicy;
      v25 = v31;
      -[NSXPCStoreServerRequestHandlingPolicy processFaultForRelationshipWithName:onObjectWithID:fromClientWithContext:error:](&v32, sel_processFaultForRelationshipWithName_onObjectWithID_fromClientWithContext_error_, v10, v11, v31, a6);
      a6 = (id *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  v25 = v31;
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, 0);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v27 = a6;
    a6 = 0;
    *v27 = v26;
  }
LABEL_7:

  return a6;
}

- (id)_entityNamesAllowedByRestrictedDataEntitlements:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  pl_dispatch_once();
  v4 = (id)_entityNamesAllowedByRestrictedDataEntitlements__pl_once_object_17;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  return v5;
}

- (id)_restrictedEntityNamesAllowedForContext:(id)a3
{
  id v3;
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__29046;
  v10 = __Block_byref_object_dispose__29047;
  v11 = 0;
  v5 = a3;
  PLSafeRunWithUnfairLock();
  v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_restrictedLockedContentAccessAllowedForContext:(id)a3
{
  char v3;
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5 = a3;
  PLSafeRunWithUnfairLock();
  v3 = *((_BYTE *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)restrictingReadPredicateForEntity:(id)a3 fromClientWithContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  PLAssetsdConnectionAuthorization *connectionAuthorization;
  PLAssetsdConnectionAuthorization *v20;
  void *v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  int v25;
  PLAssetsdConnectionAuthorization *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLXPCPhotoLibraryStoreServerRequestHandlingPolicy _restrictedEntityNamesAllowedForContext:](self, "_restrictedEntityNamesAllowedForContext:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  PLXPCStoreAllowedEntityNames();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v9);

  if ((v11 & 1) != 0 || objc_msgSend(v8, "containsObject:", v9))
  {
    -[PLXPCPhotoLibraryStoreServerRequestHandlingPolicy _limitedLibraryFilterPredicateForEntityName:withClientContext:](self, "_limitedLibraryFilterPredicateForEntityName:withClientContext:", v9, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLXPCPhotoLibraryStoreServerRequestHandlingPolicy _captureSessionPredicateForEntityName:](self, "_captureSessionPredicateForEntityName:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLXPCPhotoLibraryStoreServerRequestHandlingPolicy _filterPredicateForEntityName:withClientContext:](self, "_filterPredicateForEntityName:withClientContext:", v9, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc_init(MEMORY[0x1E0D731B8]);
    objc_msgSend(v15, "addSubpredicate:", v12);
    objc_msgSend(v15, "addSubpredicate:", v13);
    objc_msgSend(v15, "addSubpredicate:", v14);
    objc_msgSend(v15, "buildAndCompoundPredicate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PLBackendGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      connectionAuthorization = self->_connectionAuthorization;
      v25 = 138543618;
      v26 = connectionAuthorization;
      v27 = 2112;
      v28 = v16;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEBUG, "[client %{public}@] XPC store fetchFilterPredicate: %@", (uint8_t *)&v25, 0x16u);
    }

  }
  else
  {
    v20 = (PLAssetsdConnectionAuthorization *)v9;
    PLXPCStoreDeniedEntityNames();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "containsObject:", v20);

    PLBackendGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v22)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v25 = 138543362;
        v26 = v20;
        _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Attempted to fetch disallowed entity: %{public}@", (uint8_t *)&v25, 0xCu);
      }

      v16 = 0;
    }
    else
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        v25 = 138543362;
        v26 = v20;
        _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_FAULT, "Attempted to fetch unexpected entity: %{public}@", (uint8_t *)&v25, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v16;
}

- (id)_filterPredicateForEntityName:(id)a3 withClientContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  if (v9)
  {
    -[PLXPCPhotoLibraryStoreServerRequestHandlingPolicy _assetFilterPredicateWithClientContext:](self, "_assetFilterPredicateWithClientContext:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[PLInternalResource entityName](PLInternalResource, "entityName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "isEqualToString:", v11);

    if (!v12)
    {
      v13 = 0;
      goto LABEL_7;
    }
    -[PLXPCPhotoLibraryStoreServerRequestHandlingPolicy _internalResourceFilterPredicate](self, "_internalResourceFilterPredicate");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v10;
LABEL_7:

  return v13;
}

- (id)_assetFilterPredicateWithClientContext:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (PLIsContentPrivacyEnabled()
    && !-[PLXPCPhotoLibraryStoreServerRequestHandlingPolicy _restrictedLockedContentAccessAllowedForContext:](self, "_restrictedLockedContentAccessAllowedForContext:", v4))
  {
    +[PLManagedAsset predicateToExcludeRestrictedLockedAssets](PLManagedAsset, "predicateToExcludeRestrictedLockedAssets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_internalResourceFilterPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("trashedState"), 0);
}

- (id)_limitedLibraryFilterPredicateForEntityName:(id)a3 withClientContext:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v5 = a3;
  v6 = a4;
  if (PLPlatformLimitedLibrarySupported())
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__29046;
    v15 = __Block_byref_object_dispose__29047;
    v16 = 0;
    v9 = v6;
    v10 = v5;
    PLSafeRunWithUnfairLock();
    v7 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)limitedLibraryFetchFiltersUpdated:(id)a3
{
  PLSafeRunWithUnfairLock();
}

- (id)_captureSessionPredicateForEntityName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  PLAssetsdConnectionAuthorization *connectionAuthorization;
  void *v9;
  NSObject *v10;
  PLAssetsdConnectionAuthorization *v11;
  int v13;
  PLAssetsdConnectionAuthorization *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLAssetsdConnectionAuthorization captureSessionState](self->_connectionAuthorization, "captureSessionState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PLXPCPhotoLibraryStoreServerRequestHandlingPolicy _predicateForEntityName:captureSessionState:](self, "_predicateForEntityName:captureSessionState:", v4, v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      connectionAuthorization = self->_connectionAuthorization;
      v13 = 138543362;
      v14 = connectionAuthorization;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Capture Session: [client %{public}@] State is unexpectedly nil, blocking XPC store access", (uint8_t *)&v13, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v6;
  PLBackendGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = self->_connectionAuthorization;
    v13 = 138543874;
    v14 = v11;
    v15 = 2114;
    v16 = v4;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, "Capture Session: [client %{public}@] Predicate for entity %{public}@: %@", (uint8_t *)&v13, 0x20u);
  }

  return v9;
}

- (id)_predicateForEntityName:(id)a3 captureSessionState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  PLAssetsdConnectionAuthorization *connectionAuthorization;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  PLAssetsdConnectionAuthorization *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  PLAssetsdConnectionAuthorization *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = 0;
  switch(objc_msgSend(v7, "type"))
  {
    case 0:
      PLBackendGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        goto LABEL_7;
      connectionAuthorization = self->_connectionAuthorization;
      *(_DWORD *)buf = 138543362;
      v25 = connectionAuthorization;
      v11 = "Capture Session: [client %{public}@] Blocking XPC store access due to unknown state";
      v12 = v9;
      v13 = OS_LOG_TYPE_INFO;
      v14 = 12;
      goto LABEL_6;
    case 1:
    case 3:
      goto LABEL_16;
    case 2:
      v16 = objc_opt_class();
      v17 = v7;
      if (!v17)
        goto LABEL_14;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
      v19 = v18;
      if (!v19)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable _PLAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nullable __strong)");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("PLHelperExtension.h"), 76, CFSTR("Expected class of %@ but was %@"), v16, objc_opt_class());

LABEL_14:
        v19 = 0;
      }

      objc_msgSend(v19, "sessionIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLXPCPhotoLibraryStoreServerRequestHandlingPolicy _lockedCaptureSessionPredicateForEntityName:sessionIdentifier:](self, "_lockedCaptureSessionPredicateForEntityName:sessionIdentifier:", v6, v22);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
      return v8;
    default:
      PLBackendGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v15 = self->_connectionAuthorization;
        *(_DWORD *)buf = 138543618;
        v25 = v15;
        v26 = 2114;
        v27 = v7;
        v11 = "Capture Session: [client %{public}@] Unexpected state for XPC store predicate: %{public}@";
        v12 = v9;
        v13 = OS_LOG_TYPE_ERROR;
        v14 = 22;
LABEL_6:
        _os_log_impl(&dword_199541000, v12, v13, v11, buf, v14);
      }
LABEL_7:

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
  }
}

- (id)_lockedCaptureSessionPredicateForEntityName:(id)a3 sessionIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqual:", v8);

  if (v9)
  {
    +[PLManagedAsset predicateToLimitToCaptureSessionIdentifier:](PLManagedAsset, "predicateToLimitToCaptureSessionIdentifier:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v15 = (void *)v10;

    v7 = v15;
    goto LABEL_7;
  }
  +[PLAdditionalAssetAttributes entityName](PLAdditionalAssetAttributes, "entityName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v5, "isEqual:", v11);

  if (v12
    || (+[PLInternalResource entityName](PLInternalResource, "entityName"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v5, "isEqual:", v13),
        v13,
        v14))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("asset.captureSessionIdentifier"), v6);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
LABEL_7:

  return v7;
}

- (id)processRequest:(id)a3 fromClientWithContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  char v18;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  NSObject *v26;
  objc_super v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[PLXPCPhotoLibraryStoreServerRequestHandlingPolicy setCrashLogMessageForRequest:context:](self, "setCrashLogMessageForRequest:context:", v8, v9);
  if (objc_msgSend(v8, "requestType") != 1)
    goto LABEL_6;
  objc_msgSend(v8, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotosHighlight entityName](PLPhotosHighlight, "entityName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if (!v12)
    goto LABEL_6;
  v13 = v8;
  v14 = (void *)MEMORY[0x1E0C99E60];
  -[NSObject propertiesToFetch](v13, "propertiesToFetch");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = objc_claimAutoreleasedReturnValue();

  +[PLPhotosHighlight allowedPropertiesForMomentList](PLPhotosHighlight, "allowedPropertiesForMomentList");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[NSObject isSubsetOfSet:](v16, "isSubsetOfSet:", v17);

  if (-[NSObject resultType](v13, "resultType") && (v18 & 1) != 0)
  {

LABEL_6:
    PLBackendGetLog();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = os_signpost_id_generate(v19);

    v21 = v19;
    v22 = v21;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_DWORD *)buf = 134217984;
      v29 = objc_msgSend(v8, "requestType");
      _os_signpost_emit_with_name_impl(&dword_199541000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "XPCStoreRequest", "type: %lu", buf, 0xCu);
    }

    v27.receiver = self;
    v27.super_class = (Class)PLXPCPhotoLibraryStoreServerRequestHandlingPolicy;
    -[NSXPCStoreServerRequestHandlingPolicy processRequest:fromClientWithContext:error:](&v27, sel_processRequest_fromClientWithContext_error_, v8, v9, a5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v22;
    v16 = v24;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v16, OS_SIGNPOST_INTERVAL_END, v20, "XPCStoreRequest", ", buf, 2u);
    }
    v13 = v16;
    goto LABEL_13;
  }
  PLBackendGetLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v29 = (uint64_t)v13;
    _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEFAULT, "Disallowed PhotosHighlight store request: %{public}@", buf, 0xCu);
  }

  v23 = 0;
LABEL_13:

  -[PLXPCPhotoLibraryStoreServerRequestHandlingPolicy clearCrashLogMessage](self, "clearCrashLogMessage");
  return v23;
}

- (void)setCrashLogMessageForRequest:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (MEMORY[0x19AEC04BC]())
  {
    if (v6)
      objc_msgSend(v6, "auditToken");
    PLClientApplicationIdentifierFromAuditToken();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("XPC [%@] %@"), v7, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;
    PLRunWithUnfairLock();

  }
}

- (void)clearCrashLogMessage
{
  if (MEMORY[0x19AEC04BC]())
    PLRunWithUnfairLock();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictedAccessLock_lockedContentAccessAllowed, 0);
  objc_storeStrong((id *)&self->_fetchFilterLock_fetchFilter, 0);
  objc_storeStrong((id *)&self->_fetchFilterLock_fetchFilterEnabledStatus, 0);
  objc_storeStrong((id *)&self->_fetchFilterLock_fetchFilterEntityNameToPredicateMap, 0);
  objc_storeStrong((id *)&self->_fetchFilterLock_fetchFilterClientIdentifier, 0);
  objc_storeStrong((id *)&self->_connectionAuthorization, 0);
}

void __73__PLXPCPhotoLibraryStoreServerRequestHandlingPolicy_clearCrashLogMessage__block_invoke()
{
  qword_1EE36DAE0 = 0;
}

size_t __90__PLXPCPhotoLibraryStoreServerRequestHandlingPolicy_setCrashLogMessageForRequest_context___block_invoke(uint64_t a1)
{
  size_t result;

  result = strlcpy((char *)(*(_QWORD *)(a1 + 32) + 60), (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), 0x800uLL);
  qword_1EE36DAE0 = *(_QWORD *)(a1 + 32) + 60;
  return result;
}

void __87__PLXPCPhotoLibraryStoreServerRequestHandlingPolicy_limitedLibraryFetchFiltersUpdated___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
  {
    PLBackendGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      v8 = 138543362;
      v9 = v3;
      _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Clearing Fetch Filter for connection with client: %{public}@", (uint8_t *)&v8, 0xCu);
    }

    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = 0;

    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 32);
    *(_QWORD *)(v6 + 32) = 0;

  }
}

void __115__PLXPCPhotoLibraryStoreServerRequestHandlingPolicy__limitedLibraryFilterPredicateForEntityName_withClientContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "trustedCallerBundleID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0D73298], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 40);
    if (v5)
    {
      objc_msgSend(v5, "auditToken");
    }
    else
    {
      v43 = 0u;
      v44 = 0u;
    }
    v6 = objc_msgSend(v4, "photosAccessAllowedWithScope:auditToken:clientAuthorization:", 7, &v43, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 40);
    if (v6 == 4)
    {
      *(_QWORD *)(v7 + 40) = MEMORY[0x1E0C9AAB0];

      PLBackendGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v46 = v2;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Enabled limited library fetch filter on xpc store connection from: %{public}@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_limitedLibraryFetchFiltersUpdated_, CFSTR("PLLimitedLibraryFetchFiltersUpdatedNotification"), 0);
    }
    else
    {
      *(_QWORD *)(v7 + 40) = MEMORY[0x1E0C9AAA0];
    }

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  }
  if (!objc_msgSend(v3, "BOOLValue", v43, v44))
    goto LABEL_33;
  v10 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v10 + 48))
    goto LABEL_18;
  objc_msgSend(*(id *)(v10 + 8), "fetchFilterIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLLimitedLibraryFetchFilter fetchLimitedLibraryFetchFilterWithApplicationIdentifier:inManagedObjectContext:](PLLimitedLibraryFetchFilter, "fetchLimitedLibraryFetchFilterWithApplicationIdentifier:inManagedObjectContext:", v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 48);
  *(_QWORD *)(v14 + 48) = v13;

  v16 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v16 + 48))
  {
    objc_storeStrong((id *)(v16 + 24), v2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "fetchFilterData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLLimitedLibraryFetchFilter entityNameToPredicateMapFromFetchFilterData:withApplicationIdentifier:](PLLimitedLibraryFetchFilter, "entityNameToPredicateMapFromFetchFilterData:withApplicationIdentifier:", v17, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(void **)(v19 + 32);
    *(_QWORD *)(v19 + 32) = v18;

    PLBackendGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(_QWORD *)(a1 + 32);
      v23 = *(void **)(v22 + 24);
      v24 = *(_QWORD *)(v22 + 48);
      *(_DWORD *)buf = 138543618;
      v46 = v23;
      v47 = 2112;
      v48 = v24;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "Using Fetch Filter for connection with client: %{public}@ -- %@", buf, 0x16u);
    }

  }
  v10 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v10 + 48))
  {
LABEL_18:
    v25 = *(void **)(v10 + 32);
    if (!v25)
      goto LABEL_21;
    objc_msgSend(v25, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;
    goto LABEL_20;
  }
  if (!*(_QWORD *)(v10 + 32) && objc_msgSend(v2, "length"))
  {
    +[PLLimitedLibraryFetchFilter entityNameToPredicateMapWithApplicationIdentifier:](PLLimitedLibraryFetchFilter, "entityNameToPredicateMapWithApplicationIdentifier:", v2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v37 = *(void **)(v36 + 40);
    *(_QWORD *)(v36 + 40) = v35;

LABEL_20:
  }
LABEL_21:
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v29 = *(void **)(a1 + 48);
    +[PLCloudMaster entityName](PLCloudMaster, "entityName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "isEqualToString:", v30))
    {

    }
    else
    {
      v31 = *(void **)(a1 + 48);
      +[PLCloudMasterMediaMetadata entityName](PLCloudMasterMediaMetadata, "entityName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v31) = objc_msgSend(v31, "isEqualToString:", v32);

      if (!(_DWORD)v31)
      {
        PLBackendGetLog();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v39 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 138543362;
          v46 = v39;
          _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_DEFAULT, "Limited library fetch filter denying access to entity: %{public}@", buf, 0xCu);
        }

        v33 = (void *)MEMORY[0x1E0CB3880];
        v34 = 0;
        goto LABEL_32;
      }
    }
    v33 = (void *)MEMORY[0x1E0CB3880];
    v34 = 1;
LABEL_32:
    objc_msgSend(v33, "predicateWithValue:", v34);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v42 = *(void **)(v41 + 40);
    *(_QWORD *)(v41 + 40) = v40;

  }
LABEL_33:

}

uint64_t __101__PLXPCPhotoLibraryStoreServerRequestHandlingPolicy__restrictedLockedContentAccessAllowedForContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t result;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 2112);
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "entitlements");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.private.assetsd.xpcstore_restricted.access"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "containsObject:", CFSTR("photos.locked")))
    {
      PLBackendGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "trustedCallerBundleID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientProcessIdentifier");
        v12 = 138543618;
        v13 = v6;
        v14 = 1024;
        v15 = v7;
        _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Client %{public}@ [%d] has entitlement access to locked content", (uint8_t *)&v12, 0x12u);

      }
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 2112);
      v10 = MEMORY[0x1E0C9AAB0];
    }
    else
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 2112);
      v10 = MEMORY[0x1E0C9AAA0];
    }
    *(_QWORD *)(v8 + 2112) = v10;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 2112);
  }
  result = objc_msgSend(v2, "BOOLValue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __93__PLXPCPhotoLibraryStoreServerRequestHandlingPolicy__restrictedEntityNamesAllowedForContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "entitlements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("com.apple.private.assetsd.xpcstore_restricted.access"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "_entityNamesAllowedByRestrictedDataEntitlements:", v9);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(*(id *)(a1 + 32), "setUserInfo:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }
}

void __101__PLXPCPhotoLibraryStoreServerRequestHandlingPolicy__entityNamesAllowedByRestrictedDataEntitlements___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[2];
  _QWORD v27[3];
  _QWORD v28[6];
  _QWORD v29[8];

  v29[6] = *MEMORY[0x1E0C80C00];
  v28[0] = CFSTR("photos.person");
  +[PLPerson entityName](PLPerson, "entityName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v21;
  +[PLPersonReference entityName](PLPersonReference, "entityName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v20;
  +[PLUserFeedback entityName](PLUserFeedback, "entityName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v18;
  v28[1] = CFSTR("photos.memory");
  +[PLMemory entityName](PLMemory, "entityName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v17;
  +[PLUserFeedback entityName](PLUserFeedback, "entityName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v15;
  v28[2] = CFSTR("photos.face");
  +[PLDetectedFace entityName](PLDetectedFace, "entityName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v14;
  +[PLDetectedFaceprint entityName](PLDetectedFaceprint, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v13;
  +[PLDetectedFaceGroup entityName](PLDetectedFaceGroup, "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v0;
  v28[3] = CFSTR("photos.scene");
  +[PLSceneClassification entityName](PLSceneClassification, "entityName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v1;
  +[PLMediaAnalysisAssetAttributes entityName](PLMediaAnalysisAssetAttributes, "entityName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v2;
  +[PLComputeSyncAttributes entityName](PLComputeSyncAttributes, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v4;
  v28[4] = CFSTR("photos.suggestion");
  +[PLSuggestion entityName](PLSuggestion, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v6;
  v28[5] = CFSTR("photos.curation");
  +[PLComputedAssetAttributes entityName](PLComputedAssetAttributes, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  v11 = (void *)_entityNamesAllowedByRestrictedDataEntitlements__pl_once_object_17;
  _entityNamesAllowedByRestrictedDataEntitlements__pl_once_object_17 = v10;

}

@end
