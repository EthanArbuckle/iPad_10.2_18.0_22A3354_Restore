@implementation PLChangeNode

- (void)connectManagedObjectContext:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (PLIsAssetsd())
    -[PLUpdatedOrderKeys registerForStoreOrderKeyUpdateNotificationFromManagedObjectContext:](self->_updatedOrderKeys, "registerForStoreOrderKeyUpdateNotificationFromManagedObjectContext:", v5);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_publishChangesForDidSaveObjectIDsNotification_, *MEMORY[0x1E0C978A8], v5);

}

- (PLChangeNode)initWithLibraryURL:(id)a3 changeMerger:(id)a4 changePublisher:(id)a5 libraryServicesManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PLChangeNode *v15;
  id v16;
  id v17;
  PLChangeNode *v18;
  void *v19;
  uint64_t v20;
  NSString *nodeUUIDShortString;
  NSObject *v22;
  NSString *v23;
  uint64_t v24;
  NSURL *libraryUrl;
  PLUpdatedOrderKeys *v26;
  PLUpdatedOrderKeys *updatedOrderKeys;
  PLDelayedSaveActionsProcessor *v28;
  PLDelayedSaveActionsProcessor *delayedSaveActionsProcessor;
  NSObject *v30;
  uint64_t v31;
  void *v33;
  id v34;
  objc_super v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  PLChangeNode *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (PLIsAssetsdProxyService())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLChangeNode.m"), 72, CFSTR("PLChangeNode is disabled for assetsd proxy service"));

  }
  v35.receiver = self;
  v35.super_class = (Class)PLChangeNode;
  v15 = -[PLChangeNode init](&v35, sel_init);
  if (v15)
  {
    v34 = v13;
    v16 = v12;
    v17 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v17, "getUUIDBytes:", v15->_nodeUUID);
    objc_msgSend(v17, "UUIDString");
    v18 = (PLChangeNode *)objc_claimAutoreleasedReturnValue();
    -[PLChangeNode substringToIndex:](v18, "substringToIndex:", 8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    nodeUUIDShortString = v15->_nodeUUIDShortString;
    v15->_nodeUUIDShortString = (NSString *)v20;

    PLChangeHandlingGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v15->_nodeUUIDShortString;
      *(_DWORD *)buf = 138412802;
      v37 = (uint64_t)v23;
      v38 = 2112;
      v39 = v18;
      v40 = 2112;
      v41 = v11;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "PLChangeNode [%@]: Created change node with UUID %@ for libraryURL: %@", buf, 0x20u);
    }

    v24 = objc_msgSend(v11, "copy");
    libraryUrl = v15->_libraryUrl;
    v15->_libraryUrl = (NSURL *)v24;

    v26 = objc_alloc_init(PLUpdatedOrderKeys);
    updatedOrderKeys = v15->_updatedOrderKeys;
    v15->_updatedOrderKeys = v26;

    objc_storeStrong((id *)&v15->_changeMerger, a4);
    objc_storeStrong((id *)&v15->_changePublisher, a5);
    if (v14)
    {
      v28 = -[PLDelayedSaveActionsProcessor initWithLibraryServicesManager:]([PLDelayedSaveActionsProcessor alloc], "initWithLibraryServicesManager:", v14);
      delayedSaveActionsProcessor = v15->_delayedSaveActionsProcessor;
      v15->_delayedSaveActionsProcessor = v28;

    }
    objc_storeStrong((id *)&v15->_libraryServicesManager, a6);

    v12 = v16;
    v13 = v34;
  }
  PLPhotosObjectLifecycleGetLog();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    v31 = objc_opt_class();
    *(_DWORD *)buf = 138412802;
    v37 = v31;
    v38 = 2048;
    v39 = v15;
    v40 = 2112;
    v41 = v11;
    _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_DEBUG, "%@ %p initWithLibraryURL:%@", buf, 0x20u);
  }

  return v15;
}

- (void)disconnectManagedObjectContext:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0C978A8], v5);

}

- (void)dealloc
{
  NSObject *v3;
  uint64_t v4;
  NSURL *libraryUrl;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  PLChangeNode *v10;
  __int16 v11;
  NSURL *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = objc_opt_class();
    libraryUrl = self->_libraryUrl;
    *(_DWORD *)buf = 138412802;
    v8 = v4;
    v9 = 2048;
    v10 = self;
    v11 = 2112;
    v12 = libraryUrl;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "%@ %p dealloc %@", buf, 0x20u);
  }

  v6.receiver = self;
  v6.super_class = (Class)PLChangeNode;
  -[PLChangeNode dealloc](&v6, sel_dealloc);
}

- (void)invalidate
{
  NSObject *v3;
  uint64_t v4;
  NSURL *libraryUrl;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  PLChangeNode *v10;
  __int16 v11;
  NSURL *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = objc_opt_class();
    libraryUrl = self->_libraryUrl;
    v7 = 138412802;
    v8 = v4;
    v9 = 2048;
    v10 = self;
    v11 = 2112;
    v12 = libraryUrl;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "%@ %p invalidate %@", (uint8_t *)&v7, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

}

- (void)publishRemoteChangeEvent:(id)a3 delayedSaveActionsDetail:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  if (!-[PLChangeNode _isInvalidRemoteChangeEvent:reply:](self, "_isInvalidRemoteChangeEvent:reply:", v13, v9))
  {
    -[PLLibraryServicesManager pathManager](self->_libraryServicesManager, "pathManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLClientServerTransaction beginServerTransactionWithClientTransactionFromXPCDictionary:pathManager:identifier:](PLClientServerTransaction, "beginServerTransactionWithClientTransactionFromXPCDictionary:pathManager:identifier:", v13, v10, "-[PLChangeNode publishRemoteChangeEvent:delayedSaveActionsDetail:reply:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v9[2](v9, 0);
    -[PLChangePublisher publishChangeEvent:delayedSaveActionsDetail:transaction:](self->_changePublisher, "publishChangeEvent:delayedSaveActionsDetail:transaction:", v13, v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLChangeNode distributeRemoteContextDidSaveEvent:delayedSaveActionsDetail:transaction:](self, "distributeRemoteContextDidSaveEvent:delayedSaveActionsDetail:transaction:", v13, v8, v12);
  }

}

- (BOOL)_isInvalidRemoteChangeEvent:(id)a3 reply:(id)a4
{
  void (**v5)(id, void *);
  int uint64;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v13;
  const __CFString *v14;
  uint8_t buf[4];
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *))a4;
  uint64 = xpc_dictionary_get_uint64(a3, "eventKind");
  if (uint64 != 1)
  {
    PLChangeHandlingGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v16 = uint64;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Invalid change hub event kind (%d)", buf, 8u);
    }

    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0D74498];
    v13 = *MEMORY[0x1E0CB2D50];
    v14 = CFSTR("Invalid change hub event kind");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 44002, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v5[2](v5, v11);
  }

  return uint64 != 1;
}

- (void)distributeRemoteContextDidSaveEvent:(id)a3 delayedSaveActionsDetail:(id)a4 transaction:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  PLLibraryServicesManager *v15;
  PLLibraryServicesManager *v16;
  NSObject *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  PLLibraryServicesManager *libraryServicesManager;
  void *v24;
  PLCoreDataChangeMerger *changeMerger;
  id v26;
  _QWORD v27[5];
  id v28;
  NSObject *v29;
  id v30;
  char v31;
  uint8_t buf[4];
  PLLibraryServicesManager *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PLLibraryServicesManager libraryBundle](self->_libraryServicesManager, "libraryBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PLChangeHandlingGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v11, "persistentContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sharedPersistentStoreCoordinator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLLegacyChangeEvent _descriptionForEvent:withPersistentStoreCoordinator:](PLLegacyChangeEvent, "_descriptionForEvent:withPersistentStoreCoordinator:", v8, v14);
    v15 = (PLLibraryServicesManager *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v33 = v15;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEBUG, "Got remote event: %@", buf, 0xCu);

  }
  +[PLLegacyChangeEvent localChangeEventFromChangeHubEvent:withLibraryBundle:](PLLegacyChangeEvent, "localChangeEventFromChangeHubEvent:withLibraryBundle:", v8, v11);
  v16 = (PLLibraryServicesManager *)objc_claimAutoreleasedReturnValue();
  PLChangeHandlingGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v16;
    _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEBUG, "incoming from change hub: %@", buf, 0xCu);
  }

  v18 = PLIsAssetsd();
  v19 = v10;
  if (v18)
  {
    if (objc_msgSend(v9, "shouldHandleMoments"))
      -[PLDelayedSaveActionsProcessor processDelayedMomentGeneratorSaveActionsFromDetail:](self->_delayedSaveActionsProcessor, "processDelayedMomentGeneratorSaveActionsFromDetail:", v9);
    -[PLLibraryServicesManager databaseContext](self->_libraryServicesManager, "databaseContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "newShortLivedLibraryWithName:", "-[PLChangeNode distributeRemoteContextDidSaveEvent:delayedSaveActionsDetail:transaction:]");

    if (!v21)
    {
      PLChangeHandlingGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        libraryServicesManager = self->_libraryServicesManager;
        -[PLLibraryServicesManager databaseContext](libraryServicesManager, "databaseContext");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218240;
        v33 = libraryServicesManager;
        v34 = 2048;
        v35 = v24;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "PLChangeNode distribute: transientLibrary is nil. LSM=%p databaseContext=%p", buf, 0x16u);

      }
      goto LABEL_15;
    }
  }
  else
  {
    v21 = 0;
  }
  changeMerger = self->_changeMerger;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __89__PLChangeNode_distributeRemoteContextDidSaveEvent_delayedSaveActionsDetail_transaction___block_invoke;
  v27[3] = &unk_1E366BA58;
  v31 = v18;
  v27[4] = self;
  v28 = v9;
  v22 = v21;
  v29 = v22;
  v26 = v19;
  v30 = v26;
  -[PLCoreDataChangeMerger mergeIntoAllContextsChangesFromRemoteContextSave:completionHandler:](changeMerger, "mergeIntoAllContextsChangesFromRemoteContextSave:completionHandler:", v16, v27);
  if (v18)
    -[PLDelayedSaveActionsProcessor processDelayedDeletionsFromChangeHubEvent:library:transaction:](self->_delayedSaveActionsProcessor, "processDelayedDeletionsFromChangeHubEvent:library:transaction:", v8, v22, v26);

LABEL_15:
}

- (void)publishChangesForDidSaveObjectIDsNotification:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  NSString *nodeUUIDShortString;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  PLCoreDataChangeMerger *changeMerger;
  id v34;
  id v35;
  id v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[5];
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  uint8_t buf[4];
  NSString *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x19AEC1554]();
  PLChangeHandlingGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    nodeUUIDShortString = self->_nodeUUIDShortString;
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v55 = nodeUUIDShortString;
    v56 = 2112;
    v57 = v9;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "PLChangeNode [%@]: %@", buf, 0x16u);

  }
  objc_msgSend(v5, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "savingDuringMerge") & 1) == 0)
  {
    objc_msgSend(v11, "photoLibrary");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLChangeNode.m"), 212, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

    }
    v43 = v6;
    if (objc_msgSend(v11, "isUserInterfaceContext"))
    {
      +[PLChangeNotificationCenter defaultCenter](PLChangeNotificationCenter, "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "processContextDidSaveObjectIDsNotification:", v5);

    }
    v40 = v5;
    objc_msgSend(v11, "delayedSaveActions");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "popDelayedSaveActionsDetail");
    v44 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLClientServerTransaction transactionFromUserInfo:](PLClientServerTransaction, "transactionFromUserInfo:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0C97C40]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "recordChangesFromTriggerModifiedObjectIDs:", v16);

    v47 = v10;
    v17 = (void *)objc_msgSend(v10, "mutableCopy");
    v53 = 0;
    v52 = 0;
    objc_msgSend(v11, "getAndClearUpdatedObjectsAttributes:relationships:", &v53, &v52);
    v18 = v53;
    v19 = v52;
    v46 = v18;
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("PLUpdatedAttributesByObjectIDKey"));
    v45 = v19;
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("PLUpdatedRelationshipsByObjectIDKey"));
    v41 = (void *)v12;
    if (-[PLUpdatedOrderKeys isObservingOrderKeys](self->_updatedOrderKeys, "isObservingOrderKeys"))
    {
      -[PLUpdatedOrderKeys getAndClearUpdatedOrderKeys](self->_updatedOrderKeys, "getAndClearUpdatedOrderKeys");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, CFSTR("PLUpdatedOrderKeyRelationshipsByObjectIDKey"));
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0C9AA70];
    }
    objc_msgSend(v11, "userInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", CFSTR("PLMOCRedundantDeleteObjectIDs"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getAndClearRecordedObjectsForCloudDeletion");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v11, "changeSource");
    BYTE4(v38) = objc_msgSend(v11, "getAndClearSyncChangeMarker");
    LODWORD(v38) = v24;
    v25 = +[PLLegacyChangeEventBuilder createXPCDictionaryFromChangedObjectIDs:redundantDeletes:uuidsForCloudDeletion:updatedAttributesByObjectID:updatedRelationshipsByObjectID:updatedOrderKeys:changeSource:syncChangeMarker:](PLLegacyChangeEventBuilder, "createXPCDictionaryFromChangedObjectIDs:redundantDeletes:uuidsForCloudDeletion:updatedAttributesByObjectID:updatedRelationshipsByObjectID:updatedOrderKeys:changeSource:syncChangeMarker:", v47, v22, v23, v46, v45, v20, v38);

    if (v25)
    {
      +[PLClientServerTransaction addTransaction:toXPCDictionary:](PLClientServerTransaction, "addTransaction:toXPCDictionary:", v15, v25);
      objc_msgSend(v11, "appendDelayedDeletionsToXPCMessage:", v25);
      v26 = (void *)v44;
      -[PLChangePublisher publishChangeEvent:delayedSaveActionsDetail:transaction:](self->_changePublisher, "publishChangeEvent:delayedSaveActionsDetail:transaction:", v25, v44, v15);
      v27 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v27;
      v28 = v41;
    }
    else
    {
      v28 = v41;
      v26 = (void *)v44;
      if (PLIsAssetsd())
      {
        objc_msgSend(v15, "transactionToken");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          v39 = v29;
          v30 = v15;
          objc_msgSend(v41, "pathManager");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "changeScopes");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLClientServerTransaction beginServerTransactionWithToken:changeScopes:pathManager:identifier:](PLClientServerTransaction, "beginServerTransactionWithToken:changeScopes:pathManager:identifier:", v39, v32, v31, "-[PLChangeNode publishChangesForDidSaveObjectIDsNotification:]");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = (void *)v44;
          objc_msgSend(v30, "completeTransaction");

          v29 = v39;
        }

      }
      else
      {
        objc_msgSend(v15, "abortTransaction");
      }
    }
    if (PLIsAssetsd() && objc_msgSend(v26, "shouldHandleMoments"))
      -[PLDelayedSaveActionsProcessor processDelayedMomentGeneratorSaveActionsFromDetail:](self->_delayedSaveActionsProcessor, "processDelayedMomentGeneratorSaveActionsFromDetail:", v26);
    changeMerger = self->_changeMerger;
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __62__PLChangeNode_publishChangesForDidSaveObjectIDsNotification___block_invoke;
    v48[3] = &unk_1E3677998;
    v48[4] = self;
    v49 = v26;
    v50 = v28;
    v51 = v15;
    v34 = v15;
    v35 = v28;
    v36 = v26;
    -[PLCoreDataChangeMerger mergeChangesFromRemoteContextSave:intoAllContextsNotIdenticalTo:completionHandler:](changeMerger, "mergeChangesFromRemoteContextSave:intoAllContextsNotIdenticalTo:completionHandler:", v17, v11, v48);

    v6 = v43;
    v10 = v47;
    v5 = v40;
  }

  objc_autoreleasePoolPop(v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedSaveActionsProcessor, 0);
  objc_storeStrong((id *)&self->_changePublisher, 0);
  objc_storeStrong((id *)&self->_changeMerger, 0);
  objc_storeStrong((id *)&self->_updatedOrderKeys, 0);
  objc_storeStrong((id *)&self->_nodeUUIDShortString, 0);
  objc_storeStrong((id *)&self->_libraryServicesManager, 0);
  objc_storeStrong((id *)&self->_libraryUrl, 0);
}

uint64_t __62__PLChangeNode_publishChangesForDidSaveObjectIDsNotification___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = PLIsAssetsd();
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1[4] + 72), "processDelayedSaveActionsDetail:withPhotoLibrary:transaction:", a1[5], a1[6], a1[7]);
  return result;
}

uint64_t __89__PLChangeNode_distributeRemoteContextDidSaveEvent_delayedSaveActionsDetail_transaction___block_invoke(uint64_t result)
{
  if (*(_BYTE *)(result + 64))
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 72), "processDelayedSaveActionsDetail:withPhotoLibrary:transaction:", *(_QWORD *)(result + 40), *(_QWORD *)(result + 48), *(_QWORD *)(result + 56));
  return result;
}

@end
