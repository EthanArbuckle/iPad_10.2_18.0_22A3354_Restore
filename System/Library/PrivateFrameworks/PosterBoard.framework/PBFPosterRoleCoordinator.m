@implementation PBFPosterRoleCoordinator

- (PBFPosterRoleCoordinator)initWithRole:(id)a3 storage:(id)a4 modelCoordinatorProvider:(id)a5 providers:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  PBFPosterRoleCoordinator *v19;
  PBFPosterRoleCoordinator *v20;
  BSAtomicSignal *v21;
  BSAtomicSignal *invalidationSignal;
  uint64_t v23;
  NSSet *knownExtensionIdentifiers;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v12;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterRoleCoordinator initWithRole:storage:modelCoordinatorProvider:providers:].cold.1();
LABEL_19:
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA591C4);
  }
  v16 = v15;
  if ((objc_msgSend(v15, "conformsToProtocol:", &unk_1EF9ED728) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(PBFPosterExtensionDataStorage)]"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterRoleCoordinator initWithRole:storage:modelCoordinatorProvider:providers:].cold.1();
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA59228);
  }

  v17 = v13;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterRoleCoordinator initWithRole:storage:modelCoordinatorProvider:providers:].cold.2();
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA5928CLL);
  }
  v18 = v17;
  if ((objc_msgSend(v17, "conformsToProtocol:", &unk_1EF9CEA70) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(PBFModelCoordinatorProviding)]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterRoleCoordinator initWithRole:storage:modelCoordinatorProvider:providers:].cold.2();
    goto LABEL_19;
  }

  v29.receiver = self;
  v29.super_class = (Class)PBFPosterRoleCoordinator;
  v19 = -[PBFPosterRoleCoordinator init](&v29, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_role, a3);
    objc_storeStrong((id *)&v20->_storage, a4);
    objc_storeStrong((id *)&v20->_modelCoordinatorProvider, a5);
    v21 = (BSAtomicSignal *)objc_alloc_init(MEMORY[0x1E0D016C0]);
    invalidationSignal = v20->_invalidationSignal;
    v20->_invalidationSignal = v21;

    -[PBFPosterRoleCoordinator setMaximumNumberOfPosters:](v20, "setMaximumNumberOfPosters:", 200);
    v23 = objc_msgSend(v14, "copy");
    knownExtensionIdentifiers = v20->_knownExtensionIdentifiers;
    v20->_knownExtensionIdentifiers = (NSSet *)v23;

    v20->_transactionLock._os_unfair_lock_opaque = 0;
  }

  return v20;
}

+ (BOOL)supportsSupplementalUpdates
{
  return 0;
}

- (id)setupRoleIfNecessaryWithStorage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[BSAtomicSignal hasBeenSignalled](self->_invalidationSignal, "hasBeenSignalled"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PBFPosterRoleCoordinator role](self, "role");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "roleIdentifiersWithError:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "containsObject:", v6) & 1) != 0
      || (v13 = 0, objc_msgSend(v4, "addRole:displayName:error:", v6, v6, &v13), (v5 = v13) == 0))
    {
      v12 = 0;
      v8 = -[PBFPosterRoleCoordinator synchronizeFileSystemAttributesForStorage:error:](self, "synchronizeFileSystemAttributesForStorage:error:", v4, &v12);
      v5 = v12;
      PBFLogRoleCoordinator();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v8)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v15 = v6;
          _os_log_impl(&dword_1CB9FA000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Role synchronization compelted successfully", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        -[PBFPosterRoleCoordinator setupRoleIfNecessaryWithStorage:].cold.1();
      }

    }
    -[PBFPosterRoleCoordinator markPosterCollectionDirty](self, "markPosterCollectionDirty");

  }
  return v5;
}

- (BOOL)synchronizeFileSystemAttributesForStorage:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[BSAtomicSignal hasBeenSignalled](self->_invalidationSignal, "hasBeenSignalled");
  if (v7)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[PBFPosterRoleCoordinator role](self, "role");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterRoleCoordinator buildNewPosterCollectionFromStorage:](self, "buildNewPosterCollectionFromStorage:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectedPoster");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v9, "orderedPosters");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "containsObject:", v10);

      if ((v12 & 1) == 0)
      {
        PBFLogRoleCoordinator();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v20 = v8;
          _os_log_impl(&dword_1CB9FA000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Discovered selected poster not part of ordered posters; correcting...",
            buf,
            0xCu);
        }

        objc_msgSend(v10, "pbf_posterUUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0;
        objc_msgSend(v6, "assignPosterUUID:toRole:error:", v14, v8, &v18);
        v15 = v18;

        if (v15)
        {
          PBFLogRoleCoordinator();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[PBFPosterRoleCoordinator synchronizeFileSystemAttributesForStorage:error:].cold.1();

        }
      }
    }

  }
  return v7 ^ 1;
}

- (id)posterWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a3;
  -[PBFPosterRoleCoordinator storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionIdentifierForPosterUUID:error:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (-[PBFPosterRoleCoordinator knownExtensionIdentifiers](self, "knownExtensionIdentifiers"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "containsObject:", v6),
        v7,
        v8))
  {
    -[PBFPosterRoleCoordinator posterWithUUID:extensionIdentifier:](self, "posterWithUUID:extensionIdentifier:", v4, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)posterWithUUID:(id)a3 extensionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[PBFPosterRoleCoordinator modelCoordinatorProvider](self, "modelCoordinatorProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pbf_posterExtensionStoreCoordinatorForProviderIdentifier:error:", v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "latestPosterConfigurationForUUID:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)configurationStoreCoordinatorForPosterUUID:(id)a3 extensionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[PBFPosterRoleCoordinator modelCoordinatorProvider](self, "modelCoordinatorProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pbf_posterExtensionStoreCoordinatorForProviderIdentifier:error:", v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "configurationStoreCoordinatorForPosterUUID:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)lastActivatedDatesForPosterCollection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "orderedPosters", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = *MEMORY[0x1E0D7FC48];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v3, "attributeForPoster:ofType:", v11, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lastActivatedDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v11, "pbf_posterUUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v14);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)posterConfigurationsSortedByLastActivatedDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  if (-[BSAtomicSignal hasBeenSignalled](self->_invalidationSignal, "hasBeenSignalled"))
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PBFPosterRoleCoordinator lastActivatedDatesForPosterCollection:](self, "lastActivatedDatesForPosterCollection:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "orderedPosters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __74__PBFPosterRoleCoordinator_posterConfigurationsSortedByLastActivatedDate___block_invoke;
    v11[3] = &unk_1E86F31F8;
    v12 = v6;
    v8 = v6;
    objc_msgSend(v7, "sortedArrayUsingComparator:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

uint64_t __74__PBFPosterRoleCoordinator_posterConfigurationsSortedByLastActivatedDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
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
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "pbf_posterUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  v12 = *(void **)(a1 + 32);
  objc_msgSend(v6, "pbf_posterUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  v18 = objc_msgSend(v11, "compare:", v17);
  return v18;
}

- (PRPosterCollection)posterCollection
{
  os_unfair_lock_s *p_transactionLock;
  void *v4;
  PRPosterCollection *v5;
  PRPosterCollection *posterCollection;
  PRPosterCollection **p_posterCollection;
  void *v8;

  p_transactionLock = &self->_transactionLock;
  os_unfair_lock_lock(&self->_transactionLock);
  if (self->_transactionLock_isInTransaction)
  {
    -[PBFPosterRoleCoordinator storage](self, "storage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterRoleCoordinator buildNewPosterCollectionFromStorage:](self, "buildNewPosterCollectionFromStorage:", v4);
    v5 = (PRPosterCollection *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    p_posterCollection = &self->_posterCollection;
    posterCollection = self->_posterCollection;
    if (posterCollection)
    {
      v5 = posterCollection;
    }
    else
    {
      -[PBFPosterRoleCoordinator storage](self, "storage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFPosterRoleCoordinator buildNewPosterCollectionFromStorage:](self, "buildNewPosterCollectionFromStorage:", v8);
      v5 = (PRPosterCollection *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)p_posterCollection, v5);

    }
  }
  os_unfair_lock_unlock(p_transactionLock);
  return v5;
}

- (void)markPosterCollectionDirty
{
  os_unfair_lock_s *p_transactionLock;

  p_transactionLock = &self->_transactionLock;
  os_unfair_lock_lock(&self->_transactionLock);
  -[PBFPosterRoleCoordinator _transactionLock_markPosterCollectionDirty](self, "_transactionLock_markPosterCollectionDirty");
  os_unfair_lock_unlock(p_transactionLock);
}

- (void)_transactionLock_markPosterCollectionDirty
{
  PRPosterCollection *posterCollection;

  posterCollection = self->_posterCollection;
  self->_posterCollection = 0;

}

- (id)defaultAttributesForNewPosterFromProvider:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0D7FC48];
  v3 = (void *)objc_opt_new();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)invalidate
{
  PBFModelCoordinatorProviding *modelCoordinatorProvider;
  PBFPosterExtensionDataStorageRetrieving *storage;

  if (-[BSAtomicSignal signal](self->_invalidationSignal, "signal"))
  {
    os_unfair_lock_lock(&self->_transactionLock);
    modelCoordinatorProvider = self->_modelCoordinatorProvider;
    self->_modelCoordinatorProvider = 0;

    storage = self->_storage;
    self->_storage = 0;

    os_unfair_lock_unlock(&self->_transactionLock);
  }
}

+ (NSSet)supportedAttributes
{
  if (supportedAttributes_onceToken != -1)
    dispatch_once(&supportedAttributes_onceToken, &__block_literal_global_9);
  return (NSSet *)(id)supportedAttributes_supportedAttributes;
}

void __47__PBFPosterRoleCoordinator_supportedAttributes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0D7FC48], *MEMORY[0x1E0D7FC20], *MEMORY[0x1E0D7FC38], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)supportedAttributes_supportedAttributes;
  supportedAttributes_supportedAttributes = v0;

}

+ (NSSet)protectedAttributes
{
  if (protectedAttributes_onceToken != -1)
    dispatch_once(&protectedAttributes_onceToken, &__block_literal_global_122);
  return (NSSet *)(id)protectedAttributes_protectedAttributes;
}

void __47__PBFPosterRoleCoordinator_protectedAttributes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0D7FC48], *MEMORY[0x1E0D7FC20], *MEMORY[0x1E0D7FC38], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)protectedAttributes_protectedAttributes;
  protectedAttributes_protectedAttributes = v0;

}

- (id)attributesForConfiguration:(id)a3 ofType:(id)a4 storage:(id)a5
{
  id v8;
  id v9;
  char v10;
  void *v11;
  PBFPosterExtensionDataStorageRetrieving *storage;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  id v26;
  id v27;
  void *v28;
  id obj;
  PBFPosterExtensionDataStorageRetrieving *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  unint64_t v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v30 = (PBFPosterExtensionDataStorageRetrieving *)a5;
  v10 = -[BSAtomicSignal hasBeenSignalled](self->_invalidationSignal, "hasBeenSignalled");
  v11 = (void *)MEMORY[0x1E0C9AA70];
  if ((v10 & 1) != 0 || !v8 || !objc_msgSend(v9, "count"))
  {
LABEL_28:

    goto LABEL_29;
  }
  if (v30)
  {
LABEL_7:
    -[PBFPosterRoleCoordinator role](self, "role");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v8;
    objc_msgSend(v8, "pbf_posterUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_opt_new();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v26 = v9;
    obj = v9;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v33 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          v31 = 0;
          -[PBFPosterExtensionDataStorageRetrieving attributeForPoster:roleId:attributeId:error:](v30, "attributeForPoster:roleId:attributeId:error:", v14, v13, v19, &v31, v26);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (unint64_t)v31;
          PBFLogRoleCoordinator();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v20 | v21)
          {
            if (v21)
            {
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138544130;
                v37 = v13;
                v38 = 2114;
                v39 = v14;
                v40 = 2114;
                v41 = v19;
                v42 = 2114;
                v43 = v21;
                _os_log_error_impl(&dword_1CB9FA000, v23, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to fetch attribute %{public}@ for posterUUID %{public}@: %{public}@", buf, 0x2Au);
              }
            }
            else
            {
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543874;
                v37 = v13;
                v38 = 2114;
                v39 = v19;
                v40 = 2114;
                v41 = v14;
                _os_log_impl(&dword_1CB9FA000, v23, OS_LOG_TYPE_INFO, "[%{public}@] Fetched attribute data for attribute %{public}@ / posterUUID %{public}@", buf, 0x20u);
              }

              PRPosterRoleAttributeForData();
              v23 = objc_claimAutoreleasedReturnValue();
              if (v23)
              {
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v23, v19);
              }
              else
              {
                PBFLogRoleCoordinator();
                v24 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138543874;
                  v37 = v13;
                  v38 = 2114;
                  v39 = v19;
                  v40 = 2114;
                  v41 = v14;
                  _os_log_impl(&dword_1CB9FA000, v24, OS_LOG_TYPE_INFO, "[%{public}@] Unable to decode attribute data for attribute %{public}@ / posterUUID %{public}@", buf, 0x20u);
                }

              }
            }
          }
          else if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543874;
            v37 = v13;
            v38 = 2114;
            v39 = v19;
            v40 = 2114;
            v41 = v14;
            _os_log_impl(&dword_1CB9FA000, v23, OS_LOG_TYPE_INFO, "[%{public}@] No attribute data for attribute %{public}@ / posterUUID %{public}@", buf, 0x20u);
          }

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
      }
      while (v16);
    }

    v11 = (void *)objc_msgSend(v28, "copy");
    v9 = v26;
    v8 = v27;
    goto LABEL_28;
  }
  storage = self->_storage;
  if (storage)
  {
    v30 = storage;
    goto LABEL_7;
  }
LABEL_29:

  return v11;
}

+ (NSSet)subscribedEvents
{
  if (subscribedEvents_onceToken != -1)
    dispatch_once(&subscribedEvents_onceToken, &__block_literal_global_123);
  return (NSSet *)(id)subscribedEvents_subscribedEvents;
}

void __44__PBFPosterRoleCoordinator_subscribedEvents__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("PBFPosterDataStoreEventTypeExtensionsUpdated");
  v4[1] = CFSTR("PBFPosterDataStoreEventTypePosterDeleted");
  v4[2] = CFSTR("PBFPosterDataStoreEventTypePosterActivated");
  v4[3] = CFSTR("PBFPosterDataStoreEventTypeRoleCoordinatorReset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)subscribedEvents_subscribedEvents;
  subscribedEvents_subscribedEvents = v2;

}

- (BOOL)validateEventIsRelevant:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;

  v4 = a3;
  if ((-[BSAtomicSignal hasBeenSignalled](self->_invalidationSignal, "hasBeenSignalled") & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "subscribedEvents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

    if (v7)
    {
      objc_msgSend(v4, "eventType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqual:", CFSTR("PBFPosterDataStoreEventTypeRoleCoordinatorReset"));

      if (v9)
      {
        -[PBFPosterRoleCoordinator role](self, "role");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "toValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", v11);
      }
      else
      {
        objc_msgSend(v4, "eventType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", CFSTR("PBFPosterDataStoreEventTypePosterDeleted"));

        if (v14)
        {
          objc_msgSend(v4, "fromValue");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v15;
          if (!v15)
          {
            v12 = 0;
            goto LABEL_13;
          }
        }
        else
        {
          objc_msgSend(v4, "eventType");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqual:", CFSTR("PBFPosterDataStoreEventTypePosterActivated"));

          if (!v17)
          {
            v12 = 1;
            goto LABEL_14;
          }
          objc_msgSend(v4, "toValue");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v15;
        }
        objc_msgSend(v15, "role");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PBFPosterRoleCoordinator role](self, "role");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v18);

      }
LABEL_13:

      goto LABEL_14;
    }
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (BOOL)notifyEventWasReceived:(id)a3 changes:(id *)a4 storage:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t m;
  NSObject *v64;
  NSSet *knownExtensionIdentifiers;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t n;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t ii;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v115;
  void *v116;
  id v117;
  void *v118;
  void *v119;
  id v120;
  id v121;
  PBFPosterRoleCoordinator *v122;
  id v123;
  void *v124;
  id v125;
  id v126;
  id v127;
  void *v128;
  void *v129;
  void *v130;
  id *v131;
  id *v132;
  id *v133;
  id *v134;
  void *v135;
  id obj;
  id obja;
  id objb;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  _QWORD v151[4];
  id v152;
  id v153;
  id v154;
  id v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  _BYTE v172[128];
  uint8_t v173[128];
  uint8_t buf[4];
  PBFPosterRoleCoordinator *v175;
  __int16 v176;
  NSSet *v177;
  __int16 v178;
  void *v179;
  _BYTE v180[128];
  _BYTE v181[128];
  _BYTE v182[128];
  _BYTE v183[128];
  uint64_t v184;

  v184 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if ((-[BSAtomicSignal hasBeenSignalled](self->_invalidationSignal, "hasBeenSignalled") & 1) == 0
    && -[PBFPosterRoleCoordinator validateEventIsRelevant:](self, "validateEventIsRelevant:", v8))
  {
    -[PBFPosterRoleCoordinator modelCoordinatorProvider](self, "modelCoordinatorProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      -[PBFPosterRoleCoordinator storage](self, "storage");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v11;
    -[PBFPosterRoleCoordinator role](self, "role");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = self;
    -[PBFPosterRoleCoordinator buildNewPosterCollectionFromStorage:](self, "buildNewPosterCollectionFromStorage:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_opt_new();
    objc_msgSend(v8, "eventType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqual:", CFSTR("PBFPosterDataStoreEventTypeRoleCoordinatorReset"));

    v142 = v13;
    v135 = v15;
    if (v18)
    {
      v128 = v10;
      v131 = a4;
      v125 = v9;
      v170 = 0u;
      v171 = 0u;
      v168 = 0u;
      v169 = 0u;
      objc_msgSend(v15, "orderedPosters");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v168, v183, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v169;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v169 != v22)
              objc_enumerationMutation(v19);
            objc_msgSend(*(id *)(*((_QWORD *)&v168 + 1) + 8 * i), "pbf_posterUUID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            +[PBFPosterRoleCoordinatorChange removePosterFromRole:matchingUUID:](PBFPosterRoleCoordinatorChange, "removePosterFromRole:matchingUUID:", v14, v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "bs_safeAddObject:", v25);
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v168, v183, 16);
        }
        while (v21);
      }

      +[PBFPosterRoleCoordinatorChange resetRole:](PBFPosterRoleCoordinatorChange, "resetRole:", v14);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bs_safeAddObject:", v26);

      v9 = v125;
      v10 = v128;
LABEL_16:
      a4 = v131;
      v13 = v142;
LABEL_101:
      v113 = objc_msgSend(v16, "count");
      LOBYTE(v12) = 1;
      if (a4)
      {
        v15 = v135;
        if (v113)
          *a4 = (id)objc_msgSend(v16, "copy");
      }
      else
      {
        v15 = v135;
      }
      goto LABEL_105;
    }
    objc_msgSend(v8, "eventType");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isEqual:", CFSTR("PBFPosterDataStoreEventTypeExtensionsUpdated"));

    if (v28)
    {
      v129 = v10;
      v132 = a4;
      v126 = v9;
      v139 = (void *)objc_opt_new();
      v164 = 0u;
      v165 = 0u;
      v166 = 0u;
      v167 = 0u;
      objc_msgSend(v8, "toValue");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v164, v182, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v165;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v165 != v32)
              objc_enumerationMutation(v29);
            v34 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * j);
            objc_msgSend(v34, "supportedRoles");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "containsObject:", v14);

            if (v36)
            {
              objc_msgSend(v34, "posterExtensionBundleIdentifier");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v139, "addObject:", v37);

            }
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v164, v182, 16);
        }
        while (v31);
      }

      v38 = v135;
      objc_msgSend(v135, "selectedPoster");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "pbf_posterUUID");
      v116 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = (void *)objc_opt_new();
      -[PBFPosterRoleCoordinator knownExtensionIdentifiers](v122, "knownExtensionIdentifiers");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = v41;
      v120 = v8;
      if ((objc_msgSend(v41, "isEqualToSet:", v139) & 1) != 0)
      {
        v10 = v129;
      }
      else
      {
        v53 = (void *)objc_msgSend(v41, "mutableCopy");
        objc_msgSend(v53, "minusSet:", v139);
        v162 = 0u;
        v163 = 0u;
        v160 = 0u;
        v161 = 0u;
        obja = v53;
        v54 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v160, v181, 16);
        if (v54)
        {
          v55 = v54;
          v56 = *(_QWORD *)v161;
          do
          {
            for (k = 0; k != v55; ++k)
            {
              if (*(_QWORD *)v161 != v56)
                objc_enumerationMutation(obja);
              v58 = *(_QWORD *)(*((_QWORD *)&v160 + 1) + 8 * k);
              v156 = 0u;
              v157 = 0u;
              v158 = 0u;
              v159 = 0u;
              objc_msgSend(v142, "posterUUIDsForExtensionIdentifier:role:error:", v58, v14, 0);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v156, v180, 16);
              if (v60)
              {
                v61 = v60;
                v62 = *(_QWORD *)v157;
                do
                {
                  for (m = 0; m != v61; ++m)
                  {
                    if (*(_QWORD *)v157 != v62)
                      objc_enumerationMutation(v59);
                    objc_msgSend(v40, "addObject:", *(_QWORD *)(*((_QWORD *)&v156 + 1) + 8 * m));
                  }
                  v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v156, v180, 16);
                }
                while (v61);
              }

            }
            v55 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v160, v181, 16);
          }
          while (v55);
        }

        PBFLogRoleCoordinator();
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          knownExtensionIdentifiers = v122->_knownExtensionIdentifiers;
          *(_DWORD *)buf = 138543874;
          v175 = v122;
          v176 = 2112;
          v177 = knownExtensionIdentifiers;
          v178 = 2112;
          v179 = v139;
          _os_log_impl(&dword_1CB9FA000, v64, OS_LOG_TYPE_DEFAULT, "<%{public}@> Updating knownExtensionIdentifiers.\n\tfromValue: %@\n\ttoValue: %@", buf, 0x20u);
        }

        v66 = (void *)objc_msgSend(v139, "copy");
        objc_storeStrong((id *)&v122->_knownExtensionIdentifiers, v66);

        v118 = v66;
        v8 = v120;
        v10 = v129;
        v38 = v135;
      }
      objc_msgSend(v38, "orderedPosterUUIDs");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "set");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = (void *)objc_msgSend(v68, "mutableCopy");

      objc_msgSend(v69, "minusSet:", v40);
      v115 = v69;
      if (objc_msgSend(v69, "count"))
      {
        v13 = v142;
        v70 = v116;
      }
      else
      {
        +[PBFInitialPosterHelper initialPosterConfigurationWithModelCoordinatorProvider:role:](PBFInitialPosterHelper, "initialPosterConfigurationWithModelCoordinatorProvider:role:", v10, v14);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v142;
        if (v80)
        {
          +[PBFPosterRoleCoordinatorChange addPosterToRole:incomingPoster:](PBFPosterRoleCoordinatorChange, "addPosterToRole:incomingPoster:", v14, v80);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v81);

          objc_msgSend(v80, "destinationUUID");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          +[PBFPosterRoleCoordinatorChange selectPosterForRole:matchingUUID:](PBFPosterRoleCoordinatorChange, "selectPosterForRole:matchingUUID:", v14, v82);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v83);

          objc_msgSend(v80, "destinationUUID");
          v70 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v70 = v116;
        }

      }
      v151[0] = MEMORY[0x1E0C809B0];
      v151[1] = 3221225472;
      v151[2] = __67__PBFPosterRoleCoordinator_notifyEventWasReceived_changes_storage___block_invoke;
      v151[3] = &unk_1E86F4AF8;
      v117 = v70;
      v152 = v117;
      v84 = v38;
      v153 = v84;
      v85 = v118;
      v154 = v85;
      objb = v40;
      v155 = objb;
      if (__67__PBFPosterRoleCoordinator_notifyEventWasReceived_changes_storage___block_invoke((uint64_t)v151))
      {
        -[PBFPosterRoleCoordinator posterConfigurationsSortedByLastActivatedDate:](v122, "posterConfigurationsSortedByLastActivatedDate:", v84);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v147 = 0u;
        v148 = 0u;
        v149 = 0u;
        v150 = 0u;
        objc_msgSend(v86, "reverseObjectEnumerator");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v147, v173, 16);
        if (v88)
        {
          v89 = v88;
          v119 = v86;
          v123 = v85;
          v90 = *(_QWORD *)v148;
          while (2)
          {
            for (n = 0; n != v89; ++n)
            {
              if (*(_QWORD *)v148 != v90)
                objc_enumerationMutation(v87);
              v92 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * n);
              objc_msgSend(v84, "configuredPropertiesForPoster:", v92);
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v93, "focusConfiguration");
              v94 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v94)
              {
                objc_msgSend(v92, "pbf_posterUUID");
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                if (!objc_msgSend(objb, "containsObject:", v95))
                {
                  v97 = v95;

                  +[PBFPosterRoleCoordinatorChange selectPosterForRole:matchingUUID:](PBFPosterRoleCoordinatorChange, "selectPosterForRole:matchingUUID:", v14, v97);
                  v98 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v16, "addObject:", v98);
                  v96 = v97;
                  v10 = v129;
                  v13 = v142;
                  v85 = v123;
                  goto LABEL_76;
                }

              }
            }
            v89 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v147, v173, 16);
            if (v89)
              continue;
            break;
          }
          v10 = v129;
          v13 = v142;
          v85 = v123;
          v96 = v117;
LABEL_76:
          v86 = v119;
        }
        else
        {
          v96 = v117;
        }

        v9 = v126;
        a4 = v132;
        v8 = v120;
      }
      else
      {
        v9 = v126;
        a4 = v132;
        v96 = v117;
      }

      goto LABEL_101;
    }
    objc_msgSend(v8, "eventType");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "isEqual:", CFSTR("PBFPosterDataStoreEventTypePosterDeleted"));

    if (v43)
    {
      objc_msgSend(v15, "selectedPoster");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "pbf_posterUUID");
      v140 = (void *)objc_claimAutoreleasedReturnValue();

      v121 = v8;
      objc_msgSend(v8, "fromValue");
      obj = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obj, "pbf_posterUUID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "orderedPosterUUIDs");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "containsObject:", v45);

      if (v47)
      {
        v133 = a4;
        +[PBFPosterRoleCoordinatorChange removePosterFromRole:matchingUUID:](PBFPosterRoleCoordinatorChange, "removePosterFromRole:matchingUUID:", v14, v45);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v48);

        objc_msgSend(v15, "orderedPosterUUIDs");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "set");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = (void *)objc_msgSend(v50, "mutableCopy");

        objc_msgSend(v51, "removeObject:", v45);
        if (objc_msgSend(v51, "count"))
        {
          v52 = v140;
        }
        else
        {
          +[PBFInitialPosterHelper initialPosterConfigurationWithModelCoordinatorProvider:role:](PBFInitialPosterHelper, "initialPosterConfigurationWithModelCoordinatorProvider:role:", v10, v14);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          if (v99)
          {
            +[PBFPosterRoleCoordinatorChange addPosterToRole:incomingPoster:](PBFPosterRoleCoordinatorChange, "addPosterToRole:incomingPoster:", v14, v99);
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObject:", v100);

            objc_msgSend(v99, "destinationUUID");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            +[PBFPosterRoleCoordinatorChange selectPosterForRole:matchingUUID:](PBFPosterRoleCoordinatorChange, "selectPosterForRole:matchingUUID:", v14, v101);
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObject:", v102);

            objc_msgSend(v99, "destinationUUID");
            v52 = (id)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v52 = v140;
          }

          v15 = v135;
        }

        a4 = v133;
      }
      else
      {
        v52 = v140;
      }
      if (objc_msgSend(v52, "isEqual:", v45))
      {
        v130 = v10;
        -[PBFPosterRoleCoordinator posterConfigurationsSortedByLastActivatedDate:](v122, "posterConfigurationsSortedByLastActivatedDate:", v15);
        v143 = 0u;
        v144 = 0u;
        v145 = 0u;
        v146 = 0u;
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "reverseObjectEnumerator");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v143, v172, 16);
        if (v104)
        {
          v105 = v104;
          v141 = v52;
          v134 = a4;
          v127 = v9;
          v106 = *(_QWORD *)v144;
          while (2)
          {
            for (ii = 0; ii != v105; ++ii)
            {
              if (*(_QWORD *)v144 != v106)
                objc_enumerationMutation(v103);
              v108 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * ii);
              objc_msgSend(v135, "configuredPropertiesForPoster:", v108);
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v109, "focusConfiguration");
              v110 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v110)
              {
                objc_msgSend(v108, "pbf_posterUUID");
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                if (!objc_msgSend(v111, "isEqual:", v45))
                {
                  v52 = v111;

                  +[PBFPosterRoleCoordinatorChange selectPosterForRole:matchingUUID:](PBFPosterRoleCoordinatorChange, "selectPosterForRole:matchingUUID:", v14, v52);
                  v112 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v16, "addObject:", v112);
                  v9 = v127;
                  a4 = v134;
                  v13 = v142;
                  goto LABEL_99;
                }

              }
            }
            v105 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v143, v172, 16);
            if (v105)
              continue;
            break;
          }
          v9 = v127;
          a4 = v134;
          v52 = v141;
          v13 = v142;
        }
LABEL_99:

        v10 = v130;
      }

      v8 = v121;
      goto LABEL_101;
    }
    objc_msgSend(v8, "eventType");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v71, "isEqual:", CFSTR("PBFPosterDataStoreEventTypePosterActivated"));

    if (v12)
    {
      v72 = v9;
      objc_msgSend(v8, "toValue");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "pbf_posterUUID");
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "orderedPosterUUIDs");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v75, "containsObject:", v74);

      if (v12)
      {
        v131 = a4;
        objc_msgSend(v15, "posterWithUUID:", v74);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "attributeForPoster:ofType:", v76, *MEMORY[0x1E0D7FC48]);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v77)
          v77 = (void *)objc_opt_new();
        objc_msgSend(v77, "usageMetadataWithUpdatedLastActivatedDate");
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        +[PBFPosterRoleCoordinatorChange assignAttributeToPosterWithinRole:matchingUUID:attribute:](PBFPosterRoleCoordinatorChange, "assignAttributeToPosterWithinRole:matchingUUID:attribute:", v14, v74, v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v79);

        v9 = v72;
        goto LABEL_16;
      }

      v9 = v72;
      v13 = v142;
    }
LABEL_105:

    goto LABEL_106;
  }
  LOBYTE(v12) = 0;
LABEL_106:

  return v12;
}

uint64_t __67__PBFPosterRoleCoordinator_notifyEventWasReceived_changes_storage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  if (!*(_QWORD *)(a1 + 32))
    return 1;
  objc_msgSend(*(id *)(a1 + 40), "posterWithUUID:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 48);
  objc_msgSend(v2, "pbf_posterProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "containsObject:", v4);

  if (!(_DWORD)v3)
    goto LABEL_4;
  v5 = (void *)MEMORY[0x1E0D7FB50];
  objc_msgSend(*(id *)(a1 + 40), "posterWithUUID:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadFocusConfigurationForPath:error:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    v9 = objc_msgSend(*(id *)(a1 + 56), "containsObject:", *(_QWORD *)(a1 + 32));
  else
LABEL_4:
    v9 = 1;

  return v9;
}

- (id)determineActivePosterConfigurationForContext:(id)a3
{
  return -[PBFPosterRoleCoordinator determineActivePosterConfigurationForStorage:context:](self, "determineActivePosterConfigurationForStorage:context:", 0, a3);
}

- (id)determineActivePosterConfigurationForStorage:(id)a3 context:(id)a4
{
  void *v4;
  void *v5;

  if (a3)
    -[PBFPosterRoleCoordinator buildNewPosterCollectionFromStorage:](self, "buildNewPosterCollectionFromStorage:", a3, a4);
  else
    -[PBFPosterRoleCoordinator posterCollection](self, "posterCollection", 0, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedPoster");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (NSSet)supportedChangeTypes
{
  if (supportedChangeTypes_onceToken != -1)
    dispatch_once(&supportedChangeTypes_onceToken, &__block_literal_global_131);
  return (NSSet *)(id)supportedChangeTypes_supportedChangeTypes;
}

void __48__PBFPosterRoleCoordinator_supportedChangeTypes__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[11];

  v4[10] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("PBFPosterRoleCoordinatorChangeTypeAddPoster");
  v4[1] = CFSTR("PBFPosterRoleCoordinatorChangeTypeUpdatePoster");
  v4[2] = CFSTR("PBFPosterRoleCoordinatorChangeTypeRemovePoster");
  v4[3] = CFSTR("PBFPosterRoleCoordinatorChangeTypeReorderPosters");
  v4[4] = CFSTR("PBFPosterRoleCoordinatorChangeTypeDuplicatePoster");
  v4[5] = CFSTR("PBFPosterRoleCoordinatorChangeTypeSelectPoster");
  v4[6] = CFSTR("PBFPosterRoleCoordinatorChangeTypeAssignAttribute");
  v4[7] = CFSTR("PBFPosterRoleCoordinatorChangeTypeRemoveAttribute");
  v4[8] = CFSTR("PBFPosterRoleCoordinatorChangeTypeRefreshRoleCoordinator");
  v4[9] = CFSTR("PBFPosterRoleCoordinatorChangeTypeResetRoleCoordinator");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 10);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)supportedChangeTypes_supportedChangeTypes;
  supportedChangeTypes_supportedChangeTypes = v2;

}

- (BOOL)updateCoordinatorWithChange:(id)a3 changeHandler:(id)a4 emitEvents:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  BOOL v12;
  __CFString *v13;
  void *v14;
  char v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  id v26;
  id v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (!-[BSAtomicSignal hasBeenSignalled](self->_invalidationSignal, "hasBeenSignalled"))
  {
    objc_msgSend(v10, "changeType");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "supportedChangeTypes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsObject:", v13);

    if ((v15 & 1) != 0)
    {
      -[PBFPosterRoleCoordinator incrementTransactionCount](self, "incrementTransactionCount");
      v16 = (void *)objc_opt_new();
      v26 = 0;
      v27 = 0;
      v17 = -[PBFPosterRoleCoordinator _executeChange:storage:outEvents:error:](self, "_executeChange:storage:outEvents:error:", v10, v11, &v27, &v26);
      v18 = v27;
      v19 = v26;
      if (v17)
      {
        if (v18)
          v20 = v18;
        else
          v20 = (id)MEMORY[0x1E0C9AA60];
        objc_msgSend(v16, "addObjectsFromArray:", v20);
      }
      if (a6 && v19)
        *a6 = objc_retainAutorelease(v19);
      if (a5 && objc_msgSend(v16, "count"))
        *a5 = (id)objc_msgSend(v16, "copy");
      -[PBFPosterRoleCoordinator decrementTransactionCount](self, "decrementTransactionCount");
      if (v19)
        v12 = 0;
      else
        v12 = v17;
    }
    else
    {
      if (!a6)
      {
        v12 = 0;
        goto LABEL_26;
      }
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v28[0] = CFSTR("supportedChangeTypes");
      objc_msgSend((id)objc_opt_class(), "supportedChangeTypes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "allObjects");
      v22 = objc_claimAutoreleasedReturnValue();
      v19 = (id)v22;
      v23 = MEMORY[0x1E0C9AA60];
      if (v22)
        v23 = v22;
      v28[1] = CFSTR("changeType");
      v29[0] = v23;
      v24 = CFSTR("(null change type)");
      if (v13)
        v24 = v13;
      v29[1] = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.roleCoordinator.errorDomain"), 1, v18);
      v12 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_26:
    goto LABEL_28;
  }
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v12 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_28:

  return v12;
}

- (void)incrementTransactionCount
{
  os_unfair_lock_s *p_transactionLock;

  p_transactionLock = &self->_transactionLock;
  os_unfair_lock_lock(&self->_transactionLock);
  ++self->_transactionLock_txCount;
  os_unfair_lock_unlock(p_transactionLock);
}

- (void)decrementTransactionCount
{
  os_unfair_lock_s *p_transactionLock;
  int64_t v4;

  p_transactionLock = &self->_transactionLock;
  os_unfair_lock_lock(&self->_transactionLock);
  v4 = self->_transactionLock_txCount - 1;
  self->_transactionLock_txCount = v4;
  if (!v4)
    -[PBFPosterRoleCoordinator _transactionLock_markPosterCollectionDirty](self, "_transactionLock_markPosterCollectionDirty");
  os_unfair_lock_unlock(p_transactionLock);
}

- (void)finalizeTransactionCount
{
  os_unfair_lock_s *p_transactionLock;

  p_transactionLock = &self->_transactionLock;
  os_unfair_lock_lock(&self->_transactionLock);
  self->_transactionLock_txCount = 0;
  os_unfair_lock_unlock(p_transactionLock);
}

- (BOOL)finalizeChangesWithChangeHandler:(id)a3 outEvents:(id *)a4 error:(id *)a5
{
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  id *v36;
  void *v37;
  void *v38;
  void *v39;
  BOOL v40;
  void *v41;
  BOOL v42;
  NSObject *v43;
  NSObject *v44;
  id *v46;
  void *v47;
  id *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!-[BSAtomicSignal hasBeenSignalled](self->_invalidationSignal, "hasBeenSignalled"))
  {
    -[PBFPosterRoleCoordinator role](self, "role");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterRoleCoordinator buildNewPosterCollectionFromStorage:](self, "buildNewPosterCollectionFromStorage:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "orderedPosters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (!v13)
    {
      PBFLogRoleCoordinator();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[PBFPosterRoleCoordinator finalizeChangesWithChangeHandler:outEvents:error:].cold.5();

      -[PBFPosterRoleCoordinator modelCoordinatorProvider](self, "modelCoordinatorProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PBFInitialPosterHelper initialPosterConfigurationWithModelCoordinatorProvider:role:](PBFInitialPosterHelper, "initialPosterConfigurationWithModelCoordinatorProvider:role:", v16, v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        +[PBFPosterRoleCoordinatorChange addPosterToRole:incomingPoster:](PBFPosterRoleCoordinatorChange, "addPosterToRole:incomingPoster:", v10, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[PBFPosterRoleCoordinator _executeChange:storage:outEvents:error:](self, "_executeChange:storage:outEvents:error:", v18, v8, a4, a5);

        if (!v19)
        {
          v9 = 0;
LABEL_45:

          goto LABEL_46;
        }
        objc_msgSend(v17, "destinationUUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v10;
        +[PBFPosterRoleCoordinatorChange selectPosterForRole:matchingUUID:](PBFPosterRoleCoordinatorChange, "selectPosterForRole:matchingUUID:", v10, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[PBFPosterRoleCoordinator _executeChange:storage:outEvents:error:](self, "_executeChange:storage:outEvents:error:", v22, v8, a4, a5);

        if (!v23)
        {
          v9 = 0;
          v10 = v21;
          goto LABEL_45;
        }

        -[PBFPosterRoleCoordinator buildNewPosterCollectionFromStorage:](self, "buildNewPosterCollectionFromStorage:", v8);
        v24 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v24;
        v10 = v21;
      }
    }
    objc_msgSend(v11, "selectedPoster");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v9 = 1;
LABEL_46:

      goto LABEL_47;
    }
    v48 = a4;
    PBFLogRoleCoordinator();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[PBFPosterRoleCoordinator finalizeChangesWithChangeHandler:outEvents:error:].cold.2();
    v49 = v10;

    -[PBFPosterRoleCoordinator posterConfigurationsSortedByLastActivatedDate:](self, "posterConfigurationsSortedByLastActivatedDate:", v11);
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "reverseObjectEnumerator");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v51;
      v46 = a5;
LABEL_18:
      v30 = 0;
      while (1)
      {
        if (*(_QWORD *)v51 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v30);
        objc_msgSend(v11, "configuredPropertiesForPoster:", v31, v46);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "focusConfiguration");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v33)
          break;
        if (v28 == ++v30)
        {
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
          a5 = v46;
          if (v28)
            goto LABEL_18;
          goto LABEL_24;
        }
      }
      objc_msgSend(v31, "pbf_posterUUID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      a5 = v46;
      if (!v34)
        goto LABEL_29;
      PBFLogRoleCoordinator();
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = v48;
      v10 = v49;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        -[PBFPosterRoleCoordinator finalizeChangesWithChangeHandler:outEvents:error:].cold.3();

      v17 = v47;
LABEL_32:
      +[PBFPosterRoleCoordinatorChange selectPosterForRole:matchingUUID:](PBFPosterRoleCoordinatorChange, "selectPosterForRole:matchingUUID:", v10, v34);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = -[PBFPosterRoleCoordinator _executeChange:storage:outEvents:error:](self, "_executeChange:storage:outEvents:error:", v41, v8, v36, a5);

      if (!v42)
        goto LABEL_43;
LABEL_41:
      v9 = 1;
LABEL_44:

      goto LABEL_45;
    }
LABEL_24:

LABEL_29:
    -[PBFPosterRoleCoordinator modelCoordinatorProvider](self, "modelCoordinatorProvider");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v49;
    +[PBFInitialPosterHelper initialPosterConfigurationWithModelCoordinatorProvider:role:](PBFInitialPosterHelper, "initialPosterConfigurationWithModelCoordinatorProvider:role:", v37, v49);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = v48;
    if (v38)
    {
      +[PBFPosterRoleCoordinatorChange addPosterToRole:incomingPoster:](PBFPosterRoleCoordinatorChange, "addPosterToRole:incomingPoster:", v49, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = -[PBFPosterRoleCoordinator _executeChange:storage:outEvents:error:](self, "_executeChange:storage:outEvents:error:", v39, v8, v48, a5);

      if (!v40)
      {

        v34 = 0;
        v17 = v47;
LABEL_43:
        v9 = 0;
        goto LABEL_44;
      }
      objc_msgSend(v38, "destinationUUID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v47;
      if (v34)
        goto LABEL_32;
    }
    else
    {
      PBFLogRoleCoordinator();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        -[PBFPosterRoleCoordinator finalizeChangesWithChangeHandler:outEvents:error:].cold.2();

      v17 = v47;
    }
    PBFLogRoleCoordinator();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      -[PBFPosterRoleCoordinator finalizeChangesWithChangeHandler:outEvents:error:].cold.1();

    v34 = 0;
    goto LABEL_41;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v9 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
LABEL_47:

  return v9;
}

+ (id)buildInitialStateSetupEventsForRoleCoordinator:(id)a3 extensionHandlers:(id)a4 extensionStoreCoordinators:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  id obj;
  id obja;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD v71[4];
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[4];
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v66 = (id)objc_opt_new();
  objc_msgSend(v7, "role");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v7;
  objc_msgSend((id)objc_opt_class(), "subscribedEvents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v11;
  if (objc_msgSend(v11, "containsObject:", CFSTR("PBFPosterDataStoreEventTypeExtensionsUpdated")))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBFPosterDataStoreEventBuilder extensionsUpdatedFrom:to:supportedRoles:](PBFPosterDataStoreEventBuilder, "extensionsUpdatedFrom:to:supportedRoles:", v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "buildWithError:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v59;
    objc_msgSend(v66, "bs_safeAddObject:", v16);

  }
  v54 = v9;
  v56 = v8;
  if (objc_msgSend(v11, "containsObject:", CFSTR("PBFPosterDataStoreEventTypeStaticDescriptorsUpdated")))
  {
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    obj = v9;
    v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v94, 16);
    if (v64)
    {
      v62 = *(_QWORD *)v88;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v88 != v62)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v17);
          v83 = 0u;
          v84 = 0u;
          v85 = 0u;
          v86 = 0u;
          v67 = v18;
          v69 = v17;
          objc_msgSend(v18, "staticDescriptorStoreCoordinatorsWithError:", 0, v54, v56, v58);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
          if (v20)
          {
            v21 = v20;
            v22 = 0;
            v23 = *(_QWORD *)v84;
            do
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v84 != v23)
                  objc_enumerationMutation(v19);
                v25 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
                objc_msgSend(v25, "role");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v26, "isEqual:", v10);

                if (v27)
                {
                  if (!v22)
                    v22 = (void *)objc_opt_new();
                  objc_msgSend(v25, "pathOfLatestVersion");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v28)
                  {
                    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FAF0]), "_initWithPath:", v28);
                    objc_msgSend(v22, "bs_safeAddObject:", v29);

                  }
                }
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
            }
            while (v21);
          }
          else
          {
            v22 = 0;
          }

          if (objc_msgSend(v22, "count"))
          {
            objc_msgSend(v67, "providerInfoObjectForKey:", CFSTR("kProactiveStaticPosterDescriptorOrdering"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v81[0] = MEMORY[0x1E0C809B0];
            v81[1] = 3221225472;
            v81[2] = __120__PBFPosterRoleCoordinator_buildInitialStateSetupEventsForRoleCoordinator_extensionHandlers_extensionStoreCoordinators___block_invoke;
            v81[3] = &unk_1E86F35F0;
            v82 = v30;
            v31 = v30;
            objc_msgSend(v22, "sortUsingComparator:", v81);
            objc_msgSend(v67, "extensionIdentifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            +[PBFPosterDataStoreEventBuilder staticDescriptorsUpdatedForProvider:role:from:to:](PBFPosterDataStoreEventBuilder, "staticDescriptorsUpdatedForProvider:role:from:to:", v32, v10, MEMORY[0x1E0C9AA60], v22);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v33, "buildWithError:", 0);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "bs_safeAddObject:", v34);

          }
          v17 = v69 + 1;
        }
        while (v69 + 1 != v64);
        v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v94, 16);
      }
      while (v64);
    }

    v9 = v54;
    v8 = v56;
    v11 = v59;
  }
  if (objc_msgSend(v11, "containsObject:", CFSTR("PBFPosterDataStoreEventTypeDescriptorsUpdated"), v54, v56))
  {
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    obja = v9;
    v65 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
    if (v65)
    {
      v63 = *(_QWORD *)v78;
      do
      {
        v35 = 0;
        do
        {
          if (*(_QWORD *)v78 != v63)
            objc_enumerationMutation(obja);
          v36 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v35);
          v73 = 0u;
          v74 = 0u;
          v75 = 0u;
          v76 = 0u;
          v68 = v36;
          v70 = v35;
          objc_msgSend(v36, "dynamicDescriptorStoreCoordinatorsWithError:", 0);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v73, v91, 16);
          if (v38)
          {
            v39 = v38;
            v40 = 0;
            v41 = *(_QWORD *)v74;
            do
            {
              for (j = 0; j != v39; ++j)
              {
                if (*(_QWORD *)v74 != v41)
                  objc_enumerationMutation(v37);
                v43 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
                objc_msgSend(v43, "role");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = objc_msgSend(v44, "isEqual:", v10);

                if (v45)
                {
                  if (!v40)
                    v40 = (void *)objc_opt_new();
                  objc_msgSend(v43, "pathOfLatestVersion");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v46)
                  {
                    v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FAF0]), "_initWithPath:", v46);
                    objc_msgSend(v40, "bs_safeAddObject:", v47);

                  }
                }
              }
              v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v73, v91, 16);
            }
            while (v39);
          }
          else
          {
            v40 = 0;
          }

          if (objc_msgSend(v40, "count"))
          {
            objc_msgSend(v68, "providerInfoObjectForKey:", CFSTR("kProactiveDynamicPosterDescriptorOrdering"));
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v71[0] = MEMORY[0x1E0C809B0];
            v71[1] = 3221225472;
            v71[2] = __120__PBFPosterRoleCoordinator_buildInitialStateSetupEventsForRoleCoordinator_extensionHandlers_extensionStoreCoordinators___block_invoke_2;
            v71[3] = &unk_1E86F35F0;
            v72 = v48;
            v49 = v48;
            objc_msgSend(v40, "sortUsingComparator:", v71);
            objc_msgSend(v68, "extensionIdentifier");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            +[PBFPosterDataStoreEventBuilder descriptorsUpdatedForProvider:role:from:to:](PBFPosterDataStoreEventBuilder, "descriptorsUpdatedForProvider:role:from:to:", v50, v10, MEMORY[0x1E0C9AA60], v40);
            v51 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v51, "buildWithError:", 0);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "bs_safeAddObject:", v52);

          }
          v35 = v70 + 1;
        }
        while (v70 + 1 != v65);
        v65 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
      }
      while (v65);
    }

    v9 = v55;
    v8 = v57;
    v11 = v59;
  }

  return v66;
}

uint64_t __120__PBFPosterRoleCoordinator_buildInitialStateSetupEventsForRoleCoordinator_extensionHandlers_extensionStoreCoordinators___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "pbf_posterUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "indexOfObject:", v8);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(v6, "pbf_posterUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "indexOfObject:", v12);

  v14 = -1;
  if (v9 >= v13)
    v14 = 1;
  if (v9 == v13)
    return 0;
  else
    return v14;
}

uint64_t __120__PBFPosterRoleCoordinator_buildInitialStateSetupEventsForRoleCoordinator_extensionHandlers_extensionStoreCoordinators___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "pbf_posterUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "indexOfObject:", v8);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(v6, "pbf_posterUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "indexOfObject:", v12);

  v14 = -1;
  if (v9 >= v13)
    v14 = 1;
  if (v9 == v13)
    return 0;
  else
    return v14;
}

- (id)sortedPosterUUIDsFromStorage:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PBFPosterRoleCoordinator role](self, "role");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedPosterUUIDsForRole:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)buildNewPosterCollectionFromStorage:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id obj;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  PBFPosterRoleCoordinator *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  _QWORD aBlock[4];
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[4];
  id v60;
  id v61;
  PBFPosterRoleCoordinator *v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  void *v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PBFPosterRoleCoordinator role](self, "role");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedPosterUUIDForRole:error:");
  v5 = objc_claimAutoreleasedReturnValue();
  -[PBFPosterRoleCoordinator sortedPosterUUIDsFromStorage:](self, "sortedPosterUUIDsFromStorage:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterRoleCoordinator knownExtensionIdentifiers](self, "knownExtensionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "supportedAttributes");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)v5;
  if (v5)
  {
    objc_msgSend(v4, "extensionIdentifierForPosterUUID:error:", v5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterRoleCoordinator posterWithUUID:extensionIdentifier:](self, "posterWithUUID:extensionIdentifier:", v5, v8);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v35 = 0;
  }
  v9 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(v6, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __64__PBFPosterRoleCoordinator_buildNewPosterCollectionFromStorage___block_invoke;
  v59[3] = &unk_1E86F4B40;
  v11 = v4;
  v60 = v11;
  v34 = v7;
  v61 = v34;
  v62 = self;
  v44 = self;
  objc_msgSend(v10, "bs_mapNoNulls:", v59);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "orderedSetWithArray:", v12);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v6;
  v13 = v45;
  v46 = v11;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
  if (v41)
  {
    v38 = *(_QWORD *)v56;
    v47 = *MEMORY[0x1E0D7FC20];
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v56 != v38)
          objc_enumerationMutation(obj);
        v42 = v14;
        v15 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v14);
        v48 = (void *)objc_opt_new();
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v16 = v40;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v52;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v52 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
              objc_msgSend(v11, "attributeForPoster:roleId:attributeId:error:", v15, v13, v21, 0);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (v22)
              {
                PRPosterRoleAttributeForData();
                v23 = (id)objc_claimAutoreleasedReturnValue();
                if (v23)
                {
                  objc_msgSend(v48, "setObject:forKeyedSubscript:", v23, v21);
                  if (objc_msgSend(v21, "isEqualToString:", v47))
                  {
                    v23 = v23;
                    objc_msgSend(v23, "childPosterUUID");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v23, "providerIdentifier");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();

                    -[PBFPosterRoleCoordinator posterWithUUID:extensionIdentifier:](v44, "posterWithUUID:extensionIdentifier:", v24, v25);
                    v26 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v26)
                      objc_msgSend(v43, "setObject:forKey:", v26, v15);

                    v13 = v45;
                    v11 = v46;
                  }
                }
              }
              else
              {
                v23 = 0;
              }

            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
          }
          while (v18);
        }

        v27 = (void *)objc_msgSend(v48, "copy");
        objc_msgSend(v39, "setObject:forKeyedSubscript:", v27, v15);

        v11 = v46;
        v14 = v42 + 1;
      }
      while (v42 + 1 != v41);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
    }
    while (v41);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PBFPosterRoleCoordinator_buildNewPosterCollectionFromStorage___block_invoke_2;
  aBlock[3] = &unk_1E86F4B68;
  v50 = v39;
  v28 = v39;
  v29 = _Block_copy(aBlock);
  PBFLogRoleCoordinator();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v64 = v33;
    v65 = 2112;
    v66 = v35;
    _os_log_impl(&dword_1CB9FA000, v30, OS_LOG_TYPE_DEFAULT, "buildNewPosterCollectionFromStorage with orderedPosters: %@ and selectedPoster: %@", buf, 0x16u);
  }

  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FAB0]), "initWithSelectedPoster:posters:associatedPosterMap:attributeProvider:", v35, v33, v43, v29);
  return v31;
}

id __64__PBFPosterRoleCoordinator_buildNewPosterCollectionFromStorage___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(a1[4], "extensionIdentifierForPosterUUID:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  if (objc_msgSend(a1[5], "containsObject:", v4))
  {
    objc_msgSend(a1[6], "posterWithUUID:extensionIdentifier:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

id __64__PBFPosterRoleCoordinator_buildNewPosterCollectionFromStorage___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "pbf_posterUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_executeChange:(id)a3 storage:(id)a4 outEvents:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  const __CFString **v54;
  const __CFString **v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t i;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t j;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  const __CFString *v90;
  void *v91;
  __CFString *v92;
  void *v93;
  uint64_t v94;
  id v95;
  void *v96;
  uint64_t v97;
  char v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  const __CFString *v106;
  uint64_t v107;
  uint64_t v108;
  const __CFString *v109;
  void *v110;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  const __CFString *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  char v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  uint64_t v140;
  const __CFString *v141;
  void *v142;
  uint64_t v143;
  void *v144;
  const __CFString *v145;
  const __CFString *v146;
  uint64_t v147;
  void *v148;
  void *v149;
  id v150;
  void *v151;
  void *v152;
  uint64_t v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  int v159;
  void *v160;
  char v161;
  uint64_t v162;
  const __CFString *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  uint64_t v170;
  void *v171;
  const __CFString *v172;
  void *v173;
  void *v174;
  void *v175;
  uint64_t v176;
  void *v177;
  uint64_t v178;
  void *v179;
  void *v180;
  BOOL v181;
  void *v182;
  BOOL v183;
  void *v184;
  void *v185;
  uint64_t v186;
  void *v187;
  const __CFString *v188;
  uint64_t v189;
  void *v190;
  const __CFString *v191;
  void *v192;
  void *v193;
  uint64_t v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  uint64_t v199;
  const __CFString *v200;
  uint64_t v201;
  const __CFString *v202;
  void *v203;
  uint64_t v204;
  void *v205;
  void *v206;
  uint64_t v207;
  const __CFString *v208;
  uint64_t v209;
  void *v210;
  void *v211;
  const __CFString *v212;
  void *v213;
  void *v214;
  uint64_t v215;
  void *v216;
  const __CFString *v217;
  uint64_t v218;
  void *v219;
  const __CFString *v220;
  void *v221;
  _QWORD *v222;
  _QWORD *v223;
  void *v224;
  void *v225;
  void *v226;
  uint64_t v227;
  void *v228;
  void *v229;
  uint64_t v230;
  const __CFString *v231;
  uint64_t v232;
  const __CFString *v233;
  uint64_t v234;
  const __CFString *v235;
  void *v236;
  __CFString *v237;
  void *v238;
  void *v239;
  void *v240;
  id v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  id obj;
  id obja;
  id objb;
  id objc;
  id objd;
  void *v257;
  void *v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  _QWORD v267[5];
  id v268;
  id v269;
  id v270;
  id v271;
  id v272;
  _BYTE v273[128];
  _BYTE v274[128];
  _QWORD v275[2];
  _QWORD v276[2];
  const __CFString *v277;
  const __CFString *v278;
  _QWORD v279[2];
  _QWORD v280[2];
  _QWORD v281[2];
  _QWORD v282[2];
  uint64_t v283;
  _QWORD v284[3];
  _QWORD v285[3];
  _QWORD v286[2];
  _QWORD v287[2];
  uint64_t v288;
  _QWORD v289[2];
  _QWORD v290[2];
  _QWORD v291[3];
  _QWORD v292[3];
  _QWORD v293[4];
  _QWORD v294[4];
  _QWORD v295[3];
  _QWORD v296[3];
  _QWORD v297[2];
  _QWORD v298[2];
  _QWORD v299[3];
  _QWORD v300[3];
  _QWORD v301[2];
  _QWORD v302[2];
  const __CFString *v303;
  const __CFString *v304;
  _QWORD v305[2];
  _QWORD v306[2];
  const __CFString *v307;
  const __CFString *v308;
  const __CFString *v309;
  _QWORD v310[3];

  v310[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (!v10)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v309 = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
    v310[0] = CFSTR("(null change)");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v310, &v309, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.roleCoordinator.errorDomain"), 1, v14);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    v12 = 0;
    goto LABEL_98;
  }
  if (!-[BSAtomicSignal hasBeenSignalled](self->_invalidationSignal, "hasBeenSignalled"))
  {
    v15 = (void *)objc_opt_new();
    v257 = (void *)objc_opt_new();
    -[PBFPosterRoleCoordinator buildNewPosterCollectionFromStorage:](self, "buildNewPosterCollectionFromStorage:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterRoleCoordinator role](self, "role");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "changeType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v258 = v17;
    v251 = v18;
    if (objc_msgSend(v18, "isEqualToString:", CFSTR("PBFPosterRoleCoordinatorChangeTypeResetRoleCoordinator")))
    {
      objc_msgSend(v10, "role");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqual:", v17);

      if (v20)
      {
        v21 = a6;
        v22 = v15;
        v23 = v16;
        objc_msgSend(v11, "roleIdentifiersWithError:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((!objc_msgSend(v24, "containsObject:", v17)
           || objc_msgSend(v11, "removeRole:error:", v17, v21))
          && objc_msgSend(v11, "addRole:displayName:error:", v17, v17, v21))
        {
          -[PBFPosterRoleCoordinator noteDidResetRoleCoordinator:](self, "noteDidResetRoleCoordinator:", v11);
          -[PBFPosterRoleCoordinator delegate](self, "delegate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v272 = 0;
            objc_msgSend(v25, "roleCoordinatorWasReset:processInitialStateSetupEvents:", self, &v272);
            v26 = v272;
          }
          else
          {
            v26 = 0;
          }
          v56 = objc_msgSend(v26, "count");
          if (a5 && v56)
            *a5 = (id)objc_msgSend(v26, "copy");

          v16 = v23;
          v17 = v258;
          v15 = v22;
          goto LABEL_45;
        }

        v12 = 0;
        v16 = v23;
        v15 = v22;
LABEL_97:

        goto LABEL_98;
      }
LABEL_19:
      v12 = 0;
      goto LABEL_97;
    }
    if ((objc_msgSend(v18, "isEqualToString:", CFSTR("PBFPosterRoleCoordinatorChangeTypeRefreshRoleCoordinator")) & 1) != 0)
    {
LABEL_45:
      if (!objc_msgSend(v15, "count") && !objc_msgSend(v257, "count"))
      {
        v12 = 1;
        goto LABEL_97;
      }
      v245 = v15;
      v250 = v16;
      v241 = v10;
      v265 = 0u;
      v266 = 0u;
      v263 = 0u;
      v264 = 0u;
      v57 = v15;
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v263, v274, 16);
      v59 = 0x1E0D7F000uLL;
      if (v58)
      {
        v60 = v58;
        v61 = *(_QWORD *)v264;
        v62 = *MEMORY[0x1E0D7FC48];
        do
        {
          for (i = 0; i != v60; ++i)
          {
            if (*(_QWORD *)v264 != v61)
              objc_enumerationMutation(v57);
            v64 = *(_QWORD *)(*((_QWORD *)&v263 + 1) + 8 * i);
            v65 = *(void **)(v59 + 2960);
            objc_msgSend(v11, "attributeForPoster:roleId:attributeId:error:", v64, v17, v62, 0);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "decodeObjectWithJSON:", v66);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = v67;
            if (v67)
              v69 = v67;
            else
              v69 = (id)objc_opt_new();
            v70 = v69;

            objc_msgSend(v70, "usageMetadataWithUpdatedLastModifiedDate");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v257, "containsObject:", v64))
            {
              objc_msgSend(v70, "usageMetadataWithUpdatedLastSelectedDate");
              v72 = objc_claimAutoreleasedReturnValue();

              v71 = (void *)v72;
            }
            objc_msgSend(v71, "encodeJSON");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "mutateAttributeForPoster:roleId:attributeId:attributePayload:error:", v64, v258, v62, v73, 0);

            v17 = v258;
            v59 = 0x1E0D7F000;
          }
          v60 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v263, v274, 16);
        }
        while (v60);
      }
      v74 = v11;

      v261 = 0u;
      v262 = 0u;
      v259 = 0u;
      v260 = 0u;
      obja = v257;
      v75 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v259, v273, 16);
      if (v75)
      {
        v76 = v75;
        v77 = *(_QWORD *)v260;
        v78 = *MEMORY[0x1E0D7FC48];
        do
        {
          for (j = 0; j != v76; ++j)
          {
            if (*(_QWORD *)v260 != v77)
              objc_enumerationMutation(obja);
            v80 = *(_QWORD *)(*((_QWORD *)&v259 + 1) + 8 * j);
            if ((objc_msgSend(v57, "containsObject:", v80) & 1) == 0)
            {
              v81 = (void *)MEMORY[0x1E0D7FB90];
              objc_msgSend(v74, "attributeForPoster:roleId:attributeId:error:", v80, v17, v78, 0);
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v81, "decodeObjectWithJSON:", v82);
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              v84 = v83;
              if (v83)
                v85 = v83;
              else
                v85 = (id)objc_opt_new();
              v86 = v85;

              objc_msgSend(v86, "usageMetadataWithUpdatedLastSelectedDate");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "encodeJSON");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "mutateAttributeForPoster:roleId:attributeId:attributePayload:error:", v80, v258, v78, v88, 0);

              v17 = v258;
            }
          }
          v76 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v259, v273, 16);
        }
        while (v76);
      }

      v12 = 1;
      v10 = v241;
      v11 = v74;
      goto LABEL_72;
    }
    if (objc_msgSend(v18, "isEqualToString:", CFSTR("PBFPosterRoleCoordinatorChangeTypeAddPoster")))
    {
      v27 = v16;
      objc_msgSend(v10, "userInfo");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKey:", CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyIncomingPosterConfiguration"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        if ((objc_msgSend(v29, "incomingPosterType") == 4 || objc_msgSend(v29, "incomingPosterType") == 1)
          && (objc_msgSend(v251, "isEqualToString:", CFSTR("PBFPosterRoleCoordinatorChangeTypeAddPoster")) & 1) != 0)
        {
          v30 = -[PBFPosterRoleCoordinator _ingestIncomingPosterConfiguration:change:currentCollection:storage:outEvents:error:](self, "_ingestIncomingPosterConfiguration:change:currentCollection:storage:outEvents:error:", v29, v10, v27, v11, a5, a6);

          v16 = v27;
          v17 = v258;
          if (!v30)
            goto LABEL_19;
          goto LABEL_45;
        }
        v49 = (void *)MEMORY[0x1E0CB35C8];
        v305[0] = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
        objc_msgSend(v10, "description");
        v50 = objc_claimAutoreleasedReturnValue();
        v51 = (void *)v50;
        v52 = CFSTR("(null change)");
        if (v50)
          v52 = (const __CFString *)v50;
        v305[1] = *MEMORY[0x1E0CB2D68];
        v306[0] = v52;
        v306[1] = CFSTR("PBFPosterRoleCoordinatorChangeTypeAddPoster only supports PRIncomingPosterTypeNew");
        v53 = (void *)MEMORY[0x1E0C99D80];
        v54 = (const __CFString **)v306;
        v55 = (const __CFString **)v305;
        goto LABEL_89;
      }
      v49 = (void *)MEMORY[0x1E0CB35C8];
      v307 = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
      objc_msgSend(v10, "description");
      v89 = objc_claimAutoreleasedReturnValue();
      v51 = (void *)v89;
      v90 = CFSTR("(null change)");
      if (v89)
        v90 = (const __CFString *)v89;
      v308 = v90;
      v53 = (void *)MEMORY[0x1E0C99D80];
      v54 = &v308;
      v55 = &v307;
LABEL_93:
      v107 = 1;
      goto LABEL_94;
    }
    if (objc_msgSend(v18, "isEqualToString:", CFSTR("PBFPosterRoleCoordinatorChangeTypeUpdatePoster")))
    {
      v27 = v16;
      objc_msgSend(v10, "userInfo");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKey:", CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyIncomingPosterConfiguration"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        v49 = (void *)MEMORY[0x1E0CB35C8];
        v303 = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
        objc_msgSend(v10, "description");
        v108 = objc_claimAutoreleasedReturnValue();
        v51 = (void *)v108;
        v109 = CFSTR("(null change)");
        if (v108)
          v109 = (const __CFString *)v108;
        v304 = v109;
        v53 = (void *)MEMORY[0x1E0C99D80];
        v54 = &v304;
        v55 = &v303;
        goto LABEL_93;
      }
      if (objc_msgSend(v29, "incomingPosterType") != 5 && objc_msgSend(v29, "incomingPosterType") != 2
        || (objc_msgSend(v251, "isEqualToString:", CFSTR("PBFPosterRoleCoordinatorChangeTypeUpdatePoster")) & 1) == 0)
      {
        v49 = (void *)MEMORY[0x1E0CB35C8];
        v301[0] = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
        objc_msgSend(v10, "description");
        v105 = objc_claimAutoreleasedReturnValue();
        v51 = (void *)v105;
        v106 = CFSTR("(null change)");
        if (v105)
          v106 = (const __CFString *)v105;
        v301[1] = *MEMORY[0x1E0CB2D68];
        v302[0] = v106;
        v302[1] = CFSTR("PBFPosterRoleCoordinatorChangeTypeUpdatePoster only supports PRIncomingPosterTypeUpdate");
        v53 = (void *)MEMORY[0x1E0C99D80];
        v54 = (const __CFString **)v302;
        v55 = (const __CFString **)v301;
LABEL_89:
        v107 = 2;
LABEL_94:
        objc_msgSend(v53, "dictionaryWithObjects:forKeys:count:", v54, v55, v107);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.roleCoordinator.errorDomain"), 3, v110);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_95;
      }
      if (!-[PBFPosterRoleCoordinator _ingestIncomingPosterConfiguration:change:currentCollection:storage:outEvents:error:](self, "_ingestIncomingPosterConfiguration:change:currentCollection:storage:outEvents:error:", v29, v10, v27, v11, a5, a6))
      {
LABEL_95:

        v12 = 0;
        v16 = v27;
        goto LABEL_96;
      }
      objc_msgSend(v29, "destinationUUID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v32);

LABEL_28:
      v16 = v27;
      v17 = v258;
      goto LABEL_45;
    }
    if (objc_msgSend(v18, "isEqualToString:", CFSTR("PBFPosterRoleCoordinatorChangeTypeDuplicatePoster")))
    {
      v244 = v15;
      objc_msgSend(v10, "userInfo");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKey:", CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "userInfo");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKey:", CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyOutPosterUUID"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v249 = v16;
      if (!v34 || !v36)
      {
        v112 = (void *)MEMORY[0x1E0CB35C8];
        v299[0] = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
        objc_msgSend(v10, "description");
        v113 = objc_claimAutoreleasedReturnValue();
        v114 = v36;
        v115 = (void *)v113;
        v116 = CFSTR("(null change)");
        if (v113)
          v116 = (const __CFString *)v113;
        v300[0] = v116;
        v299[1] = CFSTR("posterUUIDToDuplicateOutUUID");
        objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v114);
        v117 = v34;
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        v300[1] = v118;
        v299[2] = CFSTR("posterUUIDToDuplicate");
        objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v117);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        v300[2] = v119;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v300, v299, 3);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.roleCoordinator.errorDomain"), 3, v120);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

        v17 = v258;
        v16 = v249;

        v12 = 0;
        v15 = v244;
        goto LABEL_97;
      }
      objc_msgSend(v16, "posterWithUUID:", v34);
      v37 = objc_claimAutoreleasedReturnValue();
      obj = (id)v37;
      if (v37)
      {
        v38 = v37;
        objc_msgSend(v16, "posterWithUUID:", v36);
        v39 = objc_claimAutoreleasedReturnValue();
        if (v39)
        {
          v240 = (void *)MEMORY[0x1E0CB35C8];
          v295[0] = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
          v40 = (void *)v39;
          objc_msgSend(v10, "description");
          v41 = objc_claimAutoreleasedReturnValue();
          v42 = (void *)v41;
          v43 = CFSTR("(null change)");
          if (v41)
            v43 = (const __CFString *)v41;
          v296[0] = v43;
          v295[1] = CFSTR("posterUUID");
          objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v36);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v296[1] = v44;
          v295[2] = CFSTR("duplicateOutPoster");
          objc_msgSend(v40, "description");
          v45 = v36;
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v296[2] = v46;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v296, v295, 3);
          v47 = v34;
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v240, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.roleCoordinator.errorDomain"), 3, v48);
          *a6 = (id)objc_claimAutoreleasedReturnValue();

          v34 = v47;
          v36 = v45;
        }
        else
        {
          if (!objc_msgSend(v36, "isEqual:", v34))
          {
            v180 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FA60]), "initWithConfigurationToDuplicate:destinationPosterUUID:", v38, v36);
            v181 = -[PBFPosterRoleCoordinator _ingestIncomingPosterConfiguration:change:currentCollection:storage:outEvents:error:](self, "_ingestIncomingPosterConfiguration:change:currentCollection:storage:outEvents:error:", v180, v10, v16, v11, a5, a6);
            v182 = v36;
            v183 = v181;

            v15 = v244;
            if (!v183)
              goto LABEL_19;
            goto LABEL_45;
          }
          v239 = (void *)MEMORY[0x1E0CB35C8];
          v293[0] = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
          objc_msgSend(v10, "description");
          v162 = objc_claimAutoreleasedReturnValue();
          v42 = (void *)v162;
          v163 = CFSTR("(null change)");
          if (v162)
            v163 = (const __CFString *)v162;
          v294[0] = v163;
          v293[1] = CFSTR("posterUUID");
          objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v36);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v294[1] = v44;
          v293[2] = CFSTR("posterUUIDToDuplicateOutUUID");
          objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v36);
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          v294[2] = v164;
          v293[3] = CFSTR("posterUUIDToDuplicate");
          objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v34);
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          v294[3] = v165;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v294, v293, 4);
          v166 = v36;
          v167 = v34;
          v168 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v239, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.roleCoordinator.errorDomain"), 3, v168);
          *a6 = (id)objc_claimAutoreleasedReturnValue();

          v34 = v167;
          v36 = v166;

          v40 = 0;
        }
      }
      else
      {
        v139 = (void *)MEMORY[0x1E0CB35C8];
        v297[0] = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
        objc_msgSend(v10, "description");
        v140 = objc_claimAutoreleasedReturnValue();
        v40 = (void *)v140;
        v141 = CFSTR("(null change)");
        if (v140)
          v141 = (const __CFString *)v140;
        v298[0] = v141;
        v297[1] = CFSTR("posterUUID");
        objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v34);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v298[1] = v42;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v298, v297, 2);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v139, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.roleCoordinator.errorDomain"), 2, v44);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }

      v12 = 0;
      v15 = v244;
      v16 = v249;
LABEL_96:
      v17 = v258;
      goto LABEL_97;
    }
    if (objc_msgSend(v18, "isEqualToString:", CFSTR("PBFPosterRoleCoordinatorChangeTypeRemovePoster")))
    {
      objc_msgSend(v10, "userInfo");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "objectForKey:", CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID"));
      v92 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "posterWithUUID:", v92);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "associatedPosterForUUID:", v92);
      v94 = objc_claimAutoreleasedReturnValue();
      objb = (id)objc_opt_new();
      v238 = v93;
      v242 = (void *)v94;
      v250 = v16;
      if (!v94)
      {
        objc_msgSend(v16, "associatedPosterForPoster:", v93);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "unassignPosterUUID:fromRole:error:", v92, v17, a6) && v93)
        {
          +[PBFPosterDataStoreEventBuilder posterDeleted:](PBFPosterDataStoreEventBuilder, "posterDeleted:", v93);
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v135, "buildWithError:", a6);
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          if (v136)
            objc_msgSend(objb, "addObject:", v136);

          v93 = v238;
        }
        if (v134)
        {
          +[PBFPosterDataStoreEventBuilder posterDeleted:](PBFPosterDataStoreEventBuilder, "posterDeleted:", v134);
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v137, "buildWithError:", a6);
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          if (v138)
            objc_msgSend(objb, "addObject:", v138);

          v93 = v238;
        }

        v104 = objb;
        goto LABEL_121;
      }
      v237 = v92;
      v271 = 0;
      objc_msgSend(v16, "isPosterConfigurationAnAssociatedPoster:parentPoster:", v93, &v271);
      v95 = v271;
      objc_msgSend(v95, "pbf_posterUUID");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = *MEMORY[0x1E0D7FC20];
      v270 = 0;
      v98 = objc_msgSend(v11, "mutateAttributeForPoster:roleId:attributeId:attributePayload:error:", v96, v17, v97, 0, &v270);
      v99 = v270;

      if ((v98 & 1) != 0)
      {
        v246 = v15;
        +[PBFPosterDataStoreEventBuilder posterDeleted:](PBFPosterDataStoreEventBuilder, "posterDeleted:", v242);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "buildWithError:", a6);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        if (v101)
          objc_msgSend(objb, "addObject:", v101);
        +[PBFPosterDataStoreEventBuilder posterUpdatedFrom:to:](PBFPosterDataStoreEventBuilder, "posterUpdatedFrom:to:", v95, v95);
        v102 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v102, "buildWithError:", a6);
        v103 = (void *)objc_claimAutoreleasedReturnValue();

        v104 = objb;
        if (v103)
          objc_msgSend(objb, "addObject:", v103);

        v92 = v237;
        v15 = v246;
        v17 = v258;
        v93 = v238;
LABEL_121:
        v16 = v250;
        if (objc_msgSend(v104, "count"))
          *a5 = (id)objc_msgSend(v104, "copy");

        goto LABEL_45;
      }
      if (!v99)
      {
        v142 = (void *)MEMORY[0x1E0CB35C8];
        v291[0] = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
        objc_msgSend(v10, "description");
        v143 = objc_claimAutoreleasedReturnValue();
        v144 = (void *)v143;
        v145 = CFSTR("(null change)");
        if (v143)
          v145 = (const __CFString *)v143;
        v146 = CFSTR("(null uuid)");
        if (v237)
          v146 = v237;
        v292[0] = v145;
        v292[1] = v146;
        v147 = *MEMORY[0x1E0CB2D68];
        v291[1] = CFSTR("posterUUIDToRemove");
        v291[2] = v147;
        v292[2] = CFSTR("Failed to remove assoc poster attribute");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v292, v291, 3);
        v148 = v15;
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.roleCoordinator.errorDomain"), 3, v149);
        v99 = (id)objc_claimAutoreleasedReturnValue();

        v15 = v148;
        v17 = v258;

      }
      v150 = objc_retainAutorelease(v99);
      *a6 = v150;

LABEL_176:
      v12 = 0;
      goto LABEL_73;
    }
    if (objc_msgSend(v18, "isEqualToString:", CFSTR("PBFPosterRoleCoordinatorChangeTypeReorderPosters")))
    {
      objc_msgSend(v10, "userInfo");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "objectForKey:", CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyOrderedUUIDs"));
      v122 = (void *)objc_claimAutoreleasedReturnValue();

      if (v122)
      {
        if (objc_msgSend(v11, "mutateSortOrder:roleId:error:", v122, v17, a6))
        {
          v243 = v122;
          v247 = v15;
          v250 = v16;
          objc_msgSend(v16, "orderedPosters");
          objc = (id)objc_claimAutoreleasedReturnValue();
          v123 = (void *)MEMORY[0x1E0C99E40];
          v269 = 0;
          objc_msgSend(v11, "sortedPosterUUIDsForRole:error:", v17, &v269);
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          v125 = v269;
          objc_msgSend(v124, "array");
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          v267[0] = MEMORY[0x1E0C809B0];
          v267[1] = 3221225472;
          v267[2] = __67__PBFPosterRoleCoordinator__executeChange_storage_outEvents_error___block_invoke;
          v267[3] = &unk_1E86F4B90;
          v267[4] = self;
          v268 = v11;
          objc_msgSend(v126, "bs_mapNoNulls:", v267);
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "orderedSetWithArray:", v127);
          v128 = (void *)objc_claimAutoreleasedReturnValue();

          if (v125)
          {
            *a6 = objc_retainAutorelease(v125);
          }
          else
          {
            +[PBFPosterDataStoreEventBuilder postersReorderedFrom:to:](PBFPosterDataStoreEventBuilder, "postersReorderedFrom:to:", objc, v128);
            v203 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v203, "buildWithError:", a6);
            v204 = objc_claimAutoreleasedReturnValue();
            v205 = (void *)v204;
            if (v204)
            {
              v288 = v204;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v288, 1);
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }

          }
          v15 = v247;
          v17 = v258;

          v152 = v243;
          if (v125)
            goto LABEL_175;
          goto LABEL_177;
        }
LABEL_208:

        goto LABEL_19;
      }
      v250 = v16;
      v169 = (void *)MEMORY[0x1E0CB35C8];
      v289[0] = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
      objc_msgSend(v10, "description");
      v170 = objc_claimAutoreleasedReturnValue();
      v152 = 0;
      v171 = (void *)v170;
      v172 = CFSTR("(null change)");
      if (v170)
        v172 = (const __CFString *)v170;
      v289[1] = CFSTR("sortedPosterUUIDs");
      v290[0] = v172;
      v290[1] = CFSTR("(null sorted poster uuids)");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v290, v289, 2);
      v173 = v15;
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      v175 = v169;
      v176 = 3;
      goto LABEL_149;
    }
    if (objc_msgSend(v18, "isEqualToString:", CFSTR("PBFPosterRoleCoordinatorChangeTypeSelectPoster")))
    {
      objc_msgSend(v10, "userInfo");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "objectForKey:", CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID"));
      v130 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "posterWithUUID:", v130);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objd = v130;
      if (v131)
      {
        objc_msgSend(v16, "selectedPoster");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        v133 = objc_msgSend(v132, "isEqual:", v131);

        if ((v133 & 1) != 0)
        {
          v12 = 1;
LABEL_170:

          goto LABEL_97;
        }
        v195 = (void *)MEMORY[0x1E0D7FB50];
        objc_msgSend(v131, "_path");
        v196 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v195, "loadFocusConfigurationForPath:error:", v196, 0);
        v197 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v197)
        {
          v122 = objd;
          if (objc_msgSend(v11, "markPosterUUIDAsSelected:roleId:error:", objd, v17, a6))
          {
            v248 = v15;
            objc_msgSend(v16, "posterWithUUID:", objd);
            v224 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v16;
            objc_msgSend(v16, "selectedPoster");
            v225 = (void *)objc_claimAutoreleasedReturnValue();
            +[PBFPosterDataStoreEventBuilder posterSelected:previous:](PBFPosterDataStoreEventBuilder, "posterSelected:previous:", v224, v225);
            v226 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v226, "buildWithError:", a6);
            v227 = objc_claimAutoreleasedReturnValue();
            v228 = (void *)v227;
            if (v227)
            {
              v283 = v227;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v283, 1);
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v257, "bs_safeAddObject:", objd);

            v15 = v248;
            goto LABEL_28;
          }

          goto LABEL_208;
        }
        v184 = v16;
        v198 = (void *)MEMORY[0x1E0CB35C8];
        v284[0] = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
        objc_msgSend(v10, "description");
        v199 = objc_claimAutoreleasedReturnValue();
        v187 = (void *)v199;
        v200 = CFSTR("(null change)");
        if (v199)
          v200 = (const __CFString *)v199;
        v285[0] = v200;
        v284[1] = CFSTR("posterUUID");
        objc_msgSend(objd, "UUIDString");
        v201 = objc_claimAutoreleasedReturnValue();
        v190 = (void *)v201;
        v202 = CFSTR("(null posterUUIDToSelect)");
        if (v201)
          v202 = (const __CFString *)v201;
        v284[2] = *MEMORY[0x1E0CB2D68];
        v285[1] = v202;
        v285[2] = CFSTR("Unable to select a poster which has a focus mode associated with it (rdar://problem/110546596)");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v285, v284, 3);
        v192 = (void *)objc_claimAutoreleasedReturnValue();
        v193 = v198;
        v194 = 4;
      }
      else
      {
        v184 = v16;
        v185 = (void *)MEMORY[0x1E0CB35C8];
        v286[0] = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
        objc_msgSend(v10, "description");
        v186 = objc_claimAutoreleasedReturnValue();
        v187 = (void *)v186;
        v188 = CFSTR("(null change)");
        if (v186)
          v188 = (const __CFString *)v186;
        v287[0] = v188;
        v286[1] = CFSTR("posterUUID");
        objc_msgSend(v130, "UUIDString");
        v189 = objc_claimAutoreleasedReturnValue();
        v190 = (void *)v189;
        v191 = CFSTR("(null poster to select)");
        if (v189)
          v191 = (const __CFString *)v189;
        v287[1] = v191;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v287, v286, 2);
        v192 = (void *)objc_claimAutoreleasedReturnValue();
        v193 = v185;
        v194 = 2;
      }
      objc_msgSend(v193, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.roleCoordinator.errorDomain"), v194, v192);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      v12 = 0;
      v16 = v184;
      v17 = v258;
      goto LABEL_170;
    }
    if (objc_msgSend(v18, "isEqualToString:", CFSTR("PBFPosterRoleCoordinatorChangeTypeAssignAttribute")))
    {
      objc_msgSend(v10, "userInfo");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "objectForKey:", CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID"));
      v152 = (void *)objc_claimAutoreleasedReturnValue();

      v250 = v16;
      objc_msgSend(v16, "posterWithUUID:", v152);
      v153 = objc_claimAutoreleasedReturnValue();
      if (!v153)
      {
        v206 = (void *)MEMORY[0x1E0CB35C8];
        v281[0] = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
        objc_msgSend(v10, "description");
        v207 = objc_claimAutoreleasedReturnValue();
        v171 = (void *)v207;
        v208 = CFSTR("(null change)");
        if (v207)
          v208 = (const __CFString *)v207;
        v282[0] = v208;
        v281[1] = CFSTR("posterUUID");
        objc_msgSend(v152, "UUIDString");
        v209 = objc_claimAutoreleasedReturnValue();
        v210 = v15;
        v211 = (void *)v209;
        v212 = CFSTR("(null posterUUID)");
        if (v209)
          v212 = (const __CFString *)v209;
        v282[1] = v212;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v282, v281, 2);
        v213 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v206, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.roleCoordinator.errorDomain"), 2, v213);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

        v15 = v210;
        v17 = v258;
        goto LABEL_150;
      }
      v154 = (void *)v153;
      v245 = v15;
      objc_msgSend(v10, "userInfo");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v155, "objectForKey:", CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyAttribute"));
      v156 = (void *)objc_claimAutoreleasedReturnValue();

      if (v156)
      {
        objc_msgSend(v156, "attributeType");
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v156, "encodeJSON");
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        v159 = objc_msgSend(v11, "mutateAttributeForPoster:roleId:attributeId:attributePayload:error:", v152, v17, v157, v158, a6);

        if (v159)
        {
          objc_msgSend(v156, "attributeType");
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          v161 = objc_msgSend(v160, "isEqualToString:", *MEMORY[0x1E0D7FC48]);

          if ((v161 & 1) == 0)
            objc_msgSend(v245, "bs_safeAddObject:", v152);

          v15 = v245;
          goto LABEL_178;
        }
        goto LABEL_206;
      }
      v214 = (void *)MEMORY[0x1E0CB35C8];
      v279[0] = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
      objc_msgSend(v10, "description");
      v215 = objc_claimAutoreleasedReturnValue();
      v216 = (void *)v215;
      if (v215)
        v217 = (const __CFString *)v215;
      else
        v217 = CFSTR("(null change)");
      v280[0] = v217;
      v279[1] = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
      objc_msgSend(v10, "description");
      v218 = objc_claimAutoreleasedReturnValue();
      v219 = (void *)v218;
      if (v218)
        v220 = (const __CFString *)v218;
      else
        v220 = CFSTR("(null change)");
      v280[1] = v220;
      v221 = (void *)MEMORY[0x1E0C99D80];
      v222 = v280;
      v223 = v279;
    }
    else
    {
      if (!objc_msgSend(v18, "isEqualToString:", CFSTR("PBFPosterRoleCoordinatorChangeTypeRemoveAttribute")))goto LABEL_19;
      objc_msgSend(v10, "userInfo");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v177, "objectForKey:", CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID"));
      v152 = (void *)objc_claimAutoreleasedReturnValue();

      v250 = v16;
      objc_msgSend(v16, "posterWithUUID:", v152);
      v178 = objc_claimAutoreleasedReturnValue();
      if (!v178)
      {
        v229 = (void *)MEMORY[0x1E0CB35C8];
        v277 = CFSTR("posterUUID");
        objc_msgSend(v152, "UUIDString");
        v230 = objc_claimAutoreleasedReturnValue();
        v171 = (void *)v230;
        v231 = CFSTR("(posterUUID)");
        if (v230)
          v231 = (const __CFString *)v230;
        v278 = v231;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v278, &v277, 1);
        v173 = v15;
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        v175 = v229;
        v176 = 2;
LABEL_149:
        objc_msgSend(v175, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.roleCoordinator.errorDomain"), v176, v174);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

        v15 = v173;
LABEL_150:

LABEL_175:
        goto LABEL_176;
      }
      v154 = (void *)v178;
      v245 = v15;
      objc_msgSend(v10, "userInfo");
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v179, "objectForKey:", CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyAttributeType"));
      v156 = (void *)objc_claimAutoreleasedReturnValue();

      if (v156)
      {
        if (objc_msgSend(v11, "mutateAttributeForPoster:roleId:attributeId:attributePayload:error:", v152, v17, v156, 0, a6))
        {
          objc_msgSend(v15, "bs_safeAddObject:", v152);

LABEL_177:
LABEL_178:
          v16 = v250;
          goto LABEL_45;
        }
LABEL_206:

        v12 = 0;
LABEL_72:
        v15 = v245;
LABEL_73:
        v16 = v250;
        goto LABEL_97;
      }
      v214 = (void *)MEMORY[0x1E0CB35C8];
      v275[0] = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
      objc_msgSend(v10, "description");
      v232 = objc_claimAutoreleasedReturnValue();
      v216 = (void *)v232;
      if (v232)
        v233 = (const __CFString *)v232;
      else
        v233 = CFSTR("(null change)");
      v276[0] = v233;
      v275[1] = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
      objc_msgSend(v10, "description");
      v234 = objc_claimAutoreleasedReturnValue();
      v219 = (void *)v234;
      if (v234)
        v235 = (const __CFString *)v234;
      else
        v235 = CFSTR("(null change)");
      v276[1] = v235;
      v221 = (void *)MEMORY[0x1E0C99D80];
      v222 = v276;
      v223 = v275;
    }
    objc_msgSend(v221, "dictionaryWithObjects:forKeys:count:", v222, v223, 2);
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v214, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.roleCoordinator.errorDomain"), 3, v236);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    v17 = v258;
    goto LABEL_206;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
  v12 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_98:

  return v12;
}

id __67__PBFPosterRoleCoordinator__executeChange_storage_outEvents_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "extensionIdentifierForPosterUUID:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "posterWithUUID:extensionIdentifier:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_ingestIncomingPosterConfiguration:(id)a3 change:(id)a4 currentCollection:(id)a5 storage:(id)a6 outEvents:(id *)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  BOOL v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  char v59;
  uint64_t v60;
  id v61;
  void *v62;
  id v63;
  unsigned int (**v64)(void *, void *, void *, id, id *);
  BOOL v65;
  int v66;
  int v67;
  id v68;
  void *v69;
  uint64_t v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  const __CFString **v74;
  const __CFString **v75;
  uint64_t v76;
  const __CFString *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  const __CFString *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  const __CFString *v85;
  void *v86;
  __CFString *v87;
  const __CFString *v88;
  uint64_t v89;
  void *v90;
  const __CFString *v91;
  void *v92;
  unsigned int (**v93)(void *, void *, void *, id, id *);
  int v94;
  id v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  int v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  char v110;
  char v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  char v116;
  void *v117;
  void *v118;
  void *v119;
  id v120;
  void *v121;
  uint64_t v122;
  void *v123;
  const __CFString *v124;
  uint64_t v125;
  id v126;
  void *v127;
  uint64_t v128;
  void *v129;
  const __CFString *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  void *v140;
  int v141;
  int v142;
  void *v143;
  void *v144;
  uint64_t v145;
  void *v146;
  const __CFString *v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  const __CFString *v151;
  void *v152;
  id v153;
  int v154;
  void *v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  uint64_t v159;
  uint64_t i;
  uint64_t v161;
  void *v162;
  int v163;
  id v164;
  void *v165;
  void *v166;
  uint64_t v167;
  void *v168;
  void *v169;
  const __CFString *v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const __CFString *v174;
  void *v175;
  int v176;
  void *v177;
  id v178;
  void *v179;
  int v180;
  void *v181;
  void *v182;
  id v183;
  void *v184;
  void *v185;
  void *v186;
  int v187;
  id v188;
  void *v189;
  uint64_t v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  id v195;
  void *v196;
  void *v197;
  void *v198;
  id v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  uint64_t v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t j;
  uint64_t v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  id v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  id v235;
  void *v236;
  int v237;
  void *v239;
  void *v240;
  void *v241;
  id v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  unsigned int (**v252)(void *, void *, void *, id, id *);
  uint64_t (**v253)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v254;
  id v255;
  void *v256;
  id v257;
  void *v258;
  void *v259;
  id *v260;
  id v261;
  void *v262;
  id v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  id *v277;
  uint64_t v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  _QWORD v283[4];
  id v284;
  id v285;
  _QWORD v286[4];
  id v287;
  id v288;
  id v289;
  _QWORD v290[4];
  id v291;
  id v292;
  id v293;
  id v294;
  id v295;
  _QWORD v296[4];
  id v297;
  id v298;
  id v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  id v308;
  _QWORD v309[4];
  id v310;
  id v311;
  id v312;
  id v313;
  id v314;
  _QWORD v315[4];
  id v316;
  id v317;
  id v318;
  id v319;
  _QWORD v320[5];
  id v321;
  id v322;
  id v323;
  _QWORD aBlock[4];
  id v325;
  id v326;
  _QWORD v327[3];
  _QWORD v328[3];
  _QWORD v329[3];
  _QWORD v330[3];
  _BYTE v331[128];
  _BYTE v332[128];
  _QWORD v333[3];
  _QWORD v334[3];
  _QWORD v335[3];
  _QWORD v336[3];
  _QWORD v337[2];
  _QWORD v338[2];
  _QWORD v339[2];
  _QWORD v340[2];
  const __CFString *v341;
  const __CFString *v342;
  const __CFString *v343;
  const __CFString *v344;
  uint8_t buf[4];
  void *v346;
  __int16 v347;
  void *v348;
  __int16 v349;
  void *v350;
  _QWORD v351[2];
  _QWORD v352[5];

  v352[2] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if (!-[BSAtomicSignal hasBeenSignalled](self->_invalidationSignal, "hasBeenSignalled"))
  {
    v279 = v15;
    v274 = (void *)objc_opt_new();
    -[PBFPosterRoleCoordinator role](self, "role");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "path");
    v282 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v282, "role");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = BSEqualObjects();

    if ((v21 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("BSEqualObjects(role, [path role])"));
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PBFPosterRoleCoordinator _ingestIncomingPosterConfiguration:change:currentCollection:storage:outEvents:error:].cold.3();
      objc_msgSend(objc_retainAutorelease(v211), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBA60128);
    }
    v277 = a8;
    v260 = a7;
    objc_msgSend(v14, "parentPosterUUID");
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "posterWithUUID:");
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v272, "_path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "serverIdentity");
    v273 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "sourceIdentity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "provider");
    v278 = objc_claimAutoreleasedReturnValue();
    v280 = v14;
    objc_msgSend(v14, "destinationUUID");
    v276 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterRoleCoordinator modelCoordinatorProvider](self, "modelCoordinatorProvider");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "provider");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "pbf_posterExtensionStoreCoordinatorForProviderIdentifier:error:", v25, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "posterUUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v268 = v26;
    objc_msgSend(v26, "modelStoreCoordinatorForPosterUUID:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "pathForIdentity:", v23);
    v29 = objc_claimAutoreleasedReturnValue();

    v269 = (void *)v29;
    v30 = v23;
    if (v29)
      v31 = (void *)v29;
    else
      v31 = v282;
    objc_msgSend(MEMORY[0x1E0D7FB50], "loadConfigurableOptionsForPath:error:", v31, 0);
    v271 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterRoleCoordinator modelCoordinatorProvider](self, "modelCoordinatorProvider");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)v278;
    objc_msgSend(v32, "pbf_posterExtensionStoreCoordinatorForProviderIdentifier:error:", v278, v277);
    v34 = objc_claimAutoreleasedReturnValue();

    v275 = (void *)v34;
    if (!v34)
    {
      v18 = 0;
      v44 = v272;
      v43 = v268;
      v45 = v30;
      v14 = v280;
LABEL_212:

      v15 = v279;
      goto LABEL_213;
    }
    v267 = v19;
    v35 = objc_msgSend(v280, "incomingPosterType");
    v36 = v35;
    if ((unint64_t)(v35 - 3) < 2)
      goto LABEL_11;
    if (v35 == 2)
    {
      v261 = v17;
      objc_msgSend(v16, "posterWithUUID:", v276);
      v46 = v16;
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (v47)
      {
        objc_msgSend((id)objc_opt_class(), "supportedAttributes");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v46;
        objc_msgSend(v46, "attributesForPoster:ofTypes:", v47, v48);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        v51 = v30;
        v33 = (void *)v278;
        if (!objc_msgSend(v50, "count"))
        {
          -[PBFPosterRoleCoordinator defaultAttributesForNewPosterFromProvider:](self, "defaultAttributesForNewPosterFromProvider:", v278);
          v54 = objc_claimAutoreleasedReturnValue();

          v50 = (void *)v54;
        }
      }
      else
      {
        v49 = v46;
        PBFLogRoleCoordinator();
        v53 = objc_claimAutoreleasedReturnValue();
        v51 = v30;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v49, "orderedPosterUUIDs");
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v346 = v276;
          v347 = 2114;
          v348 = v143;
          v349 = 2114;
          v350 = v267;
          _os_log_fault_impl(&dword_1CB9FA000, v53, OS_LOG_TYPE_FAULT, "Invalid existing poster for UUID: %{public}@ -- poster collection UUIDs %{public}@ -- role %{public}@", buf, 0x20u);

        }
        v33 = (void *)v278;
        -[PBFPosterRoleCoordinator defaultAttributesForNewPosterFromProvider:](self, "defaultAttributesForNewPosterFromProvider:", v278);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v14 = v280;
      v266 = v50;

      v16 = v49;
      v17 = v261;
      v52 = v51;
LABEL_27:
      objc_msgSend(v14, "configuredProperties");
      v55 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "attributes");
      v265 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v258 = (void *)v55;
      v259 = v52;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[PBFPosterRoleCoordinator modelCoordinatorProvider](self, "modelCoordinatorProvider");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "providerForExtensionIdentifier:", v33);
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          v254 = v57;
          v255 = v16;
          if (v57)
          {
            objc_msgSend(v57, "supportedRoles");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = objc_msgSend(v58, "containsObject:", v267);

            if ((v59 & 1) != 0)
            {
              objc_msgSend(v275, "configurationStoreCoordinatorForPosterUUID:", v276);
              v256 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = MEMORY[0x1E0C809B0];
              aBlock[0] = MEMORY[0x1E0C809B0];
              aBlock[1] = 3221225472;
              aBlock[2] = __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke;
              aBlock[3] = &unk_1E86F4BB8;
              v325 = v259;
              v61 = v267;
              v326 = v61;
              v62 = _Block_copy(aBlock);
              v320[0] = v60;
              v320[1] = 3221225472;
              v320[2] = __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_3;
              v320[3] = &unk_1E86F4BE0;
              v320[4] = self;
              v321 = v266;
              v63 = v16;
              v322 = v63;
              v257 = v61;
              v323 = v257;
              v64 = (unsigned int (**)(void *, void *, void *, id, id *))_Block_copy(v320);
              v252 = v64;
              v253 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v62;
              switch(v36)
              {
                case 0:
                  v86 = (void *)MEMORY[0x1E0CB35C8];
                  v335[0] = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
                  objc_msgSend(v279, "description");
                  v87 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  if (v87)
                    v88 = v87;
                  else
                    v88 = CFSTR("(null change)");
                  v336[0] = v88;
                  v336[1] = CFSTR("PRIncomingPosterTypeUnknown");
                  v335[1] = CFSTR("incomingPosterType");
                  v335[2] = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
                  objc_msgSend(v279, "description");
                  v89 = objc_claimAutoreleasedReturnValue();
                  v90 = (void *)v89;
                  if (v89)
                    v91 = (const __CFString *)v89;
                  else
                    v91 = CFSTR("(null change)");
                  v336[2] = v91;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v336, v335, 3);
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v86, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.roleCoordinator.errorDomain"), 3, v92);
                  *v277 = (id)objc_claimAutoreleasedReturnValue();

                  v93 = v252;
                  goto LABEL_96;
                case 1:
                  v33 = (void *)v278;
                  if (!objc_msgSend(v17, "addPosterUUID:provider:error:", v276, v278, v277))
                  {
                    v18 = 0;
                    goto LABEL_192;
                  }
                  v19 = v267;
                  if (!objc_msgSend(v17, "assignPosterUUID:toRole:error:", v276, v257, v277))
                  {
                    v18 = 0;
                    goto LABEL_203;
                  }
                  v44 = v272;
                  if (!v252[2](v252, v276, v265, v17, v277))
                  {
                    v18 = 0;
                    goto LABEL_207;
                  }
                  v319 = v256;
                  v94 = (*((uint64_t (**)(void *, void *, void *, id *, id *))v62 + 2))(v62, v275, v276, &v319, v277);
                  v95 = v319;

                  if (!v94)
                  {
                    v18 = 0;
                    v256 = v95;
                    v19 = v267;
                    goto LABEL_207;
                  }
                  objc_msgSend(v282, "contentsURL");
                  v96 = (void *)objc_claimAutoreleasedReturnValue();
                  v318 = 0;
                  objc_msgSend(v95, "stageNewVersionWithContents:error:", v96, &v318);
                  v97 = (void *)objc_claimAutoreleasedReturnValue();
                  v98 = v318;

                  if (!v97 || v98)
                  {
                    *v277 = objc_retainAutorelease(v98);
                    v103 = 1;
                  }
                  else
                  {
                    objc_msgSend(v95, "pathForIdentity:", v97);
                    v99 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((__112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_2((uint64_t)v99, v99, v258, v271, (uint64_t)v277) & 1) != 0)
                    {
                      v100 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FAD8]), "_initWithPath:", v99);
                      +[PBFPosterDataStoreEventBuilder posterAdded:](PBFPosterDataStoreEventBuilder, "posterAdded:", v100);
                      v101 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v101, "setOriginatingRoleCoordinatorChange:", v279);
                      v315[0] = MEMORY[0x1E0C809B0];
                      v315[1] = 3221225472;
                      v315[2] = __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_4;
                      v315[3] = &unk_1E86F4C08;
                      v316 = v275;
                      v317 = v276;
                      objc_msgSend(v101, "setRevertBlock:", v315);
                      objc_msgSend(v101, "buildWithError:", v277);
                      v102 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v102)
                      {
                        objc_msgSend(v274, "addObject:", v102);
                        v103 = 0;
                      }
                      else
                      {
                        v103 = 1;
                      }

                    }
                    else
                    {
                      objc_msgSend(v275, "teardownConfigurationStoreCoordinatorForPosterUUID:error:", v276, 0);

                      v103 = 1;
                    }
                    v33 = (void *)v278;
                    v14 = v280;
                  }

                  if (v103)
                  {
                    v18 = 0;
                    v256 = v95;
                    goto LABEL_192;
                  }
                  v256 = v95;
                  goto LABEL_194;
                case 2:
                  if (!v256)
                  {
                    v144 = (void *)MEMORY[0x1E0CB35C8];
                    v333[0] = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
                    objc_msgSend(v279, "description");
                    v145 = objc_claimAutoreleasedReturnValue();
                    v146 = (void *)v145;
                    v147 = CFSTR("(null change)");
                    if (v145)
                      v147 = (const __CFString *)v145;
                    v148 = *MEMORY[0x1E0CB2D68];
                    v334[0] = v147;
                    v334[1] = CFSTR("No Configuration store coordinator found to update");
                    v333[1] = v148;
                    v333[2] = CFSTR("posterUUID");
                    objc_msgSend(v276, "UUIDString");
                    v149 = objc_claimAutoreleasedReturnValue();
                    v150 = (void *)v149;
                    v151 = CFSTR("(null destinationPosterUUID)");
                    if (v149)
                      v151 = (const __CFString *)v149;
                    v334[2] = v151;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v334, v333, 3);
                    v152 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v144, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.roleCoordinator.errorDomain"), 3, v152);
                    *v277 = (id)objc_claimAutoreleasedReturnValue();

                    v93 = v252;
                    v256 = 0;
LABEL_96:
                    v18 = 0;
                    v19 = v267;
                    v44 = v272;
                    goto LABEL_97;
                  }
                  v19 = v267;
                  if (!v64[2](v64, v276, v265, v17, v277))
                  {
                    v18 = 0;
                    v44 = v272;
                    goto LABEL_128;
                  }
                  v263 = v17;
                  v104 = objc_alloc(MEMORY[0x1E0D7FAD8]);
                  objc_msgSend(v256, "pathOfLatestVersion");
                  v105 = (void *)objc_claimAutoreleasedReturnValue();
                  v106 = (void *)objc_msgSend(v104, "_initWithPath:", v105);

                  if (objc_msgSend(v282, "isServerPosterPath"))
                  {
                    objc_msgSend(v282, "serverIdentity");
                    v107 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v107, "posterUUID");
                    v108 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v14, "originalPosterUUID");
                    v109 = (void *)objc_claimAutoreleasedReturnValue();
                    v110 = objc_msgSend(v108, "isEqual:", v109);

                    v111 = v110 ^ 1;
                  }
                  else
                  {
                    v111 = 1;
                  }
                  v33 = (void *)v278;
                  v180 = objc_msgSend((id)objc_opt_class(), "supportsSupplementalUpdates");
                  if ((v111 & 1) != 0 || !v180)
                  {
                    objc_msgSend(v282, "contentsURL");
                    v184 = (void *)objc_claimAutoreleasedReturnValue();
                    v313 = 0;
                    v181 = v256;
                    objc_msgSend(v256, "stageNewVersionWithContents:error:", v184, &v313);
                    v182 = (void *)objc_claimAutoreleasedReturnValue();
                    v183 = v313;

                  }
                  else
                  {
                    v314 = 0;
                    v181 = v256;
                    objc_msgSend(v256, "stageNewSupplementWithError:", &v314);
                    v182 = (void *)objc_claimAutoreleasedReturnValue();
                    v183 = v314;
                  }
                  objc_msgSend(v181, "pathForIdentity:", v182);
                  v185 = (void *)objc_claimAutoreleasedReturnValue();
                  v186 = v185;
                  v187 = 1;
                  if (v182 && !v183)
                  {
                    if ((__112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_2((uint64_t)v185, v185, v258, v271, (uint64_t)v277) & 1) != 0)
                    {
                      v188 = objc_alloc(MEMORY[0x1E0D7FAD8]);
                      objc_msgSend(v256, "pathForIdentity:", v182);
                      v189 = (void *)objc_claimAutoreleasedReturnValue();
                      v190 = objc_msgSend(v188, "_initWithPath:", v189);

                      v281 = (void *)v190;
                      +[PBFPosterDataStoreEventBuilder posterUpdatedFrom:to:](PBFPosterDataStoreEventBuilder, "posterUpdatedFrom:to:", v106, v190);
                      v191 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v191, "setOriginatingRoleCoordinatorChange:", v279);
                      v309[0] = MEMORY[0x1E0C809B0];
                      v309[1] = 3221225472;
                      v309[2] = __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_5;
                      v309[3] = &unk_1E86F4C30;
                      v310 = v275;
                      v311 = v276;
                      v312 = v182;
                      objc_msgSend(v191, "setRevertBlock:", v309);
                      objc_msgSend(v191, "buildWithError:", v277);
                      v192 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v192)
                      {
                        objc_msgSend(v274, "addObject:", v192);
                        v187 = 0;
                      }
                      else
                      {
                        v187 = 1;
                      }

                      v33 = (void *)v278;
                    }
                    else
                    {
                      objc_msgSend(v275, "teardownConfigurationStoreCoordinatorForPosterUUID:version:error:", v276, objc_msgSend(v182, "version"), 0);
                    }
                  }

                  if (v187)
                  {
                    v18 = 0;
                    v17 = v263;
LABEL_192:
                    v19 = v267;
                    goto LABEL_203;
                  }
                  v17 = v263;
LABEL_194:
                  v19 = v267;
                  goto LABEL_205;
                case 3:
                  objc_msgSend(v14, "originalPosterUUID");
                  v112 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v63, "posterWithUUID:", v112);
                  v113 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v113)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("originalPosterConfiguration != nil"));
                    v239 = (void *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                      -[PBFPosterRoleCoordinator _ingestIncomingPosterConfiguration:change:currentCollection:storage:outEvents:error:].cold.1();
                    objc_msgSend(objc_retainAutorelease(v239), "UTF8String");
                    _bs_set_crash_log_message();
                    __break(0);
                    JUMPOUT(0x1CBA60944);
                  }
                  v244 = v113;
                  objc_msgSend(v113, "_path");
                  v246 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v279, "userInfo");
                  v114 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v114, "objectForKey:", CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID"));
                  v115 = (void *)objc_claimAutoreleasedReturnValue();
                  v248 = (void *)v112;
                  v116 = BSEqualObjects();

                  v19 = v267;
                  if ((v116 & 1) == 0)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("BSEqualObjects(originalPosterUUID, [[change userInfo] objectForKey:PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID])"));
                    v240 = (void *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                      -[PBFPosterRoleCoordinator _ingestIncomingPosterConfiguration:change:currentCollection:storage:outEvents:error:].cold.2();
                    objc_msgSend(objc_retainAutorelease(v240), "UTF8String");
                    _bs_set_crash_log_message();
                    __break(0);
                    JUMPOUT(0x1CBA609A8);
                  }
                  objc_msgSend(v279, "userInfo");
                  v117 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v117, "objectForKey:", CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyOutPosterUUID"));
                  v118 = (void *)objc_claimAutoreleasedReturnValue();
                  v119 = v118;
                  if (v118)
                  {
                    v120 = v118;
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                    v120 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  v153 = v120;
                  v44 = v272;

                  v33 = (void *)v278;
                  v251 = v153;
                  if (objc_msgSend(v17, "addPosterUUID:provider:error:", v153, v278, v277)
                    && objc_msgSend(v17, "assignPosterUUID:toRole:error:", v153, v257, v277))
                  {
                    v308 = v256;
                    v154 = ((uint64_t (**)(_QWORD, void *, id, id *, id *))v253)[2](v253, v275, v153, &v308, v277);
                    v242 = v308;

                    if (v154)
                    {
                      v306 = 0u;
                      v307 = 0u;
                      v304 = 0u;
                      v305 = 0u;
                      v264 = v17;
                      objc_msgSend(v17, "attributeIdentifiersForPoster:roleId:error:", v248, v257, 0);
                      v155 = (void *)objc_claimAutoreleasedReturnValue();
                      v156 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v304, v332, 16);
                      if (v156)
                      {
                        v157 = v156;
                        v158 = 0;
                        v159 = *(_QWORD *)v305;
                        do
                        {
                          for (i = 0; i != v157; ++i)
                          {
                            if (*(_QWORD *)v305 != v159)
                              objc_enumerationMutation(v155);
                            v161 = *(_QWORD *)(*((_QWORD *)&v304 + 1) + 8 * i);
                            if (!v158)
                              v158 = (void *)objc_opt_new();
                            objc_msgSend(v264, "attributeForPoster:roleId:attributeId:error:", v248, v257, v161, 0);
                            v162 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v162)
                              objc_msgSend(v158, "setObject:forKeyedSubscript:", v162, v161);

                          }
                          v157 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v304, v332, 16);
                        }
                        while (v157);
                      }
                      else
                      {
                        v158 = 0;
                      }

                      v302 = 0u;
                      v303 = 0u;
                      v300 = 0u;
                      v301 = 0u;
                      objc_msgSend(v265, "keyEnumerator");
                      v212 = (void *)objc_claimAutoreleasedReturnValue();
                      v213 = objc_msgSend(v212, "countByEnumeratingWithState:objects:count:", &v300, v331, 16);
                      v17 = v264;
                      if (v213)
                      {
                        v214 = v213;
                        v215 = *(_QWORD *)v301;
                        do
                        {
                          for (j = 0; j != v214; ++j)
                          {
                            if (*(_QWORD *)v301 != v215)
                              objc_enumerationMutation(v212);
                            v217 = *(_QWORD *)(*((_QWORD *)&v300 + 1) + 8 * j);
                            objc_msgSend(v265, "objectForKeyedSubscript:", v217);
                            v218 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v218, "encodeJSON");
                            v219 = (void *)objc_claimAutoreleasedReturnValue();

                            if (v219)
                              objc_msgSend(v158, "setObject:forKeyedSubscript:", v219, v217);

                            v17 = v264;
                          }
                          v214 = objc_msgSend(v212, "countByEnumeratingWithState:objects:count:", &v300, v331, 16);
                        }
                        while (v214);
                      }

                      if (v252[2](v252, v251, v265, v17, v277))
                      {
                        objc_msgSend(v282, "contentsURL");
                        v220 = (void *)objc_claimAutoreleasedReturnValue();
                        v299 = 0;
                        v164 = v242;
                        objc_msgSend(v242, "stageNewVersionWithContents:error:", v220, &v299);
                        v221 = (void *)objc_claimAutoreleasedReturnValue();
                        v222 = v299;

                        if (!v221 || v222)
                        {
                          v33 = (void *)v278;
                          *v277 = objc_retainAutorelease(v222);
                          v163 = 1;
                        }
                        else
                        {
                          objc_msgSend(v242, "pathForIdentity:", v221);
                          v223 = (void *)objc_claimAutoreleasedReturnValue();
                          if ((__112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_2((uint64_t)v223, v223, v258, v271, (uint64_t)v277) & 1) != 0)
                          {
                            -[PBFPosterRoleCoordinator modelCoordinatorProvider](self, "modelCoordinatorProvider");
                            v224 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v246, "serverIdentity");
                            v225 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v224, "pbf_posterSnapshotCoordinatorForIdentity:", v225);
                            v226 = (void *)objc_claimAutoreleasedReturnValue();

                            -[PBFPosterRoleCoordinator modelCoordinatorProvider](self, "modelCoordinatorProvider");
                            v227 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v227, "pbf_posterSnapshotCoordinatorForIdentity:", v221);
                            v228 = (void *)objc_claimAutoreleasedReturnValue();

                            objc_msgSend(v228, "ingestSnapshotsFromCoordinator:", v226);
                            v229 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FAD8]), "_initWithPath:", v223);
                            +[PBFPosterDataStoreEventBuilder posterAdded:](PBFPosterDataStoreEventBuilder, "posterAdded:", v229);
                            v230 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v230, "buildWithError:", v277);
                            v231 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v230, "setOriginatingRoleCoordinatorChange:", v279);
                            v296[0] = MEMORY[0x1E0C809B0];
                            v296[1] = 3221225472;
                            v296[2] = __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_211;
                            v296[3] = &unk_1E86F4C08;
                            v297 = v275;
                            v298 = v251;
                            objc_msgSend(v230, "setRevertBlock:", v296);
                            if (v231)
                            {
                              objc_msgSend(v274, "addObject:", v231);
                              v163 = 0;
                            }
                            else
                            {
                              v163 = 1;
                            }

                          }
                          else
                          {
                            objc_msgSend(v275, "teardownConfigurationStoreCoordinatorForPosterUUID:error:", v251, 0);

                            v163 = 1;
                          }
                          v17 = v264;
                          v33 = (void *)v278;
                          v14 = v280;
                          v164 = v242;
                          v222 = 0;
                        }

                        v165 = v244;
                      }
                      else
                      {
                        v163 = 1;
                        v33 = (void *)v278;
                        v164 = v242;
                        v165 = v244;
                      }

                      v19 = v267;
                      v44 = v272;
                    }
                    else
                    {
                      v163 = 1;
                      v164 = v242;
                      v165 = v244;
                    }
                  }
                  else
                  {
                    v163 = 1;
                    v164 = v256;
                    v165 = v244;
                  }

                  if (v163)
                  {
                    v18 = 0;
                    v256 = v164;
                    goto LABEL_207;
                  }
                  v256 = v164;
                  goto LABEL_206;
                case 4:
                case 5:
                  v44 = v272;
                  if (v272)
                  {
                    v262 = v17;
                    v65 = v36 == 4 || v256 == 0;
                    v66 = v65;
                    if (v65)
                    {
                      v295 = v256;
                      v67 = (*((uint64_t (**)(void *, void *, void *, id *, id *))v62 + 2))(v62, v275, v276, &v295, v277);
                      v68 = v295;

                      v132 = v258;
                      if (!v67)
                      {
                        v18 = 0;
                        v256 = v68;
                        goto LABEL_127;
                      }
                      v256 = v68;
                    }
                    else
                    {
                      v132 = v258;
                    }
                    -[PBFPosterRoleCoordinator modelCoordinatorProvider](self, "modelCoordinatorProvider");
                    v133 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v273, "provider");
                    v134 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v133, "pbf_posterExtensionStoreCoordinatorForProviderIdentifier:error:", v134, v277);
                    v135 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v135)
                    {
                      objc_msgSend(v273, "posterUUID");
                      v136 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v135, "configurationStoreCoordinatorForPosterUUID:", v136);
                      v137 = objc_claimAutoreleasedReturnValue();

                      if (v137)
                      {
                        v250 = v135;
                        v247 = (void *)v137;
                        if (objc_msgSend(v282, "isServerPosterPath"))
                        {
                          objc_msgSend(v282, "serverIdentity");
                          v138 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v138, "posterUUID");
                          v139 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v14, "originalPosterUUID");
                          v140 = (void *)objc_claimAutoreleasedReturnValue();
                          v141 = objc_msgSend(v139, "isEqual:", v140);

                          v142 = v141 ^ 1;
                        }
                        else
                        {
                          v142 = 1;
                        }
                        v176 = objc_msgSend((id)objc_opt_class(), "supportsSupplementalUpdates");
                        objc_msgSend(v256, "pathOfLatestVersion");
                        v177 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v177)
                        {
                          v178 = objc_alloc(MEMORY[0x1E0D7FAD8]);
                          objc_msgSend(v256, "pathOfLatestVersion");
                          v179 = (void *)objc_claimAutoreleasedReturnValue();
                          v249 = (void *)objc_msgSend(v178, "_initWithPath:", v179);

                        }
                        else
                        {
                          v249 = 0;
                        }

                        if (((v142 | v176 ^ 1) & 1) != 0)
                        {
                          objc_msgSend(v282, "contentsURL");
                          v193 = (void *)objc_claimAutoreleasedReturnValue();
                          v293 = 0;
                          objc_msgSend(v256, "stageNewVersionWithContents:error:", v193, &v293);
                          v194 = (void *)objc_claimAutoreleasedReturnValue();
                          v195 = v293;

                        }
                        else
                        {
                          v294 = 0;
                          objc_msgSend(v256, "stageNewSupplementWithError:", &v294);
                          v194 = (void *)objc_claimAutoreleasedReturnValue();
                          v195 = v294;
                        }
                        v33 = (void *)v278;
                        v196 = v250;
                        if (!v194 || v195)
                        {
                          *v277 = objc_retainAutorelease(v195);
                        }
                        else
                        {
                          objc_msgSend(v256, "pathForIdentity:", v194);
                          v197 = (void *)objc_claimAutoreleasedReturnValue();
                          if ((__112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_2((uint64_t)v197, v197, v132, v271, (uint64_t)v277) & 1) != 0)
                          {
                            v245 = v197;
                            v198 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FAD8]), "_initWithPath:", v197);
                            v243 = v198;
                            if (v66)
                            {
                              v199 = objc_alloc(MEMORY[0x1E0D7F9E8]);
                              objc_msgSend(v198, "pbf_posterUUID");
                              v200 = v198;
                              v201 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(MEMORY[0x1E0C99D68], "date");
                              v202 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v200, "pbf_posterProvider");
                              v203 = (void *)objc_claimAutoreleasedReturnValue();
                              v204 = (void *)objc_msgSend(v199, "initWithChildPosterUUID:dateCreated:providerIdentifier:", v201, v202, v203);

                              v205 = *MEMORY[0x1E0D7FC20];
                              v241 = v204;
                              objc_msgSend(v204, "encodeJSON");
                              v206 = (void *)objc_claimAutoreleasedReturnValue();
                              LODWORD(v205) = objc_msgSend(v262, "mutateAttributeForPoster:roleId:attributeId:attributePayload:error:", v270, v257, v205, v206, v277);

                              if (!(_DWORD)v205)
                              {
                                v234 = 0;
                                v237 = 1;
                                v236 = v204;
                                goto LABEL_199;
                              }
                              v198 = v243;
                              +[PBFPosterDataStoreEventBuilder posterAdded:](PBFPosterDataStoreEventBuilder, "posterAdded:", v243);
                              v207 = (void *)objc_claimAutoreleasedReturnValue();
                              v208 = v279;
                              objc_msgSend(v207, "setOriginatingRoleCoordinatorChange:", v279);
                              v290[0] = MEMORY[0x1E0C809B0];
                              v290[1] = 3221225472;
                              v290[2] = __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_2_217;
                              v290[3] = &unk_1E86F4C08;
                              v291 = v275;
                              v292 = v276;
                              objc_msgSend(v207, "setRevertBlock:", v290);
                              objc_msgSend(v207, "buildWithError:", v277);
                              v209 = (void *)objc_claimAutoreleasedReturnValue();

                              v210 = v241;
                            }
                            else
                            {
                              +[PBFPosterDataStoreEventBuilder posterUpdatedFrom:to:](PBFPosterDataStoreEventBuilder, "posterUpdatedFrom:to:", v249, v198);
                              v207 = (void *)objc_claimAutoreleasedReturnValue();
                              v208 = v279;
                              objc_msgSend(v207, "setOriginatingRoleCoordinatorChange:", v279);
                              v286[0] = MEMORY[0x1E0C809B0];
                              v286[1] = 3221225472;
                              v286[2] = __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_3_218;
                              v286[3] = &unk_1E86F4C30;
                              v287 = v275;
                              v288 = v276;
                              v289 = v194;
                              objc_msgSend(v207, "setRevertBlock:", v286);
                              objc_msgSend(v207, "buildWithError:", v277);
                              v209 = (void *)objc_claimAutoreleasedReturnValue();

                              v210 = v287;
                            }

                            if (!v209)
                            {
                              v237 = 1;
                              v33 = (void *)v278;
LABEL_200:

                              v196 = v250;
LABEL_201:

                              v19 = v267;
                              if (v237)
                              {
                                v18 = 0;
                                v17 = v262;
LABEL_203:
                                v44 = v272;
                              }
                              else
                              {
                                v17 = v262;
LABEL_205:
                                v44 = v272;
LABEL_206:
                                *v260 = (id)objc_msgSend(v274, "copy");
                                v18 = 1;
                              }
                              goto LABEL_207;
                            }
                            objc_msgSend(v274, "addObject:", v209);
                            objc_msgSend(v256, "providerInfo");
                            v232 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v273, "posterUUID");
                            v233 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v256, "setObject:forKeyedSubscript:", v233, CFSTR("kConfigurationAssociatedPosterUUIDKey"));

                            +[PBFPosterDataStoreEventBuilder posterUpdatedFrom:to:](PBFPosterDataStoreEventBuilder, "posterUpdatedFrom:to:", v272, v272);
                            v234 = (void *)objc_claimAutoreleasedReturnValue();

                            objc_msgSend(v234, "setOriginatingRoleCoordinatorChange:", v208);
                            v283[0] = MEMORY[0x1E0C809B0];
                            v283[1] = 3221225472;
                            v283[2] = __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_4_219;
                            v283[3] = &unk_1E86F4C08;
                            v284 = v256;
                            v285 = v232;
                            v235 = v232;
                            objc_msgSend(v234, "setRevertBlock:", v283);
                            objc_msgSend(v234, "buildWithError:", v277);
                            v236 = (void *)objc_claimAutoreleasedReturnValue();

                            if (v236)
                            {
                              objc_msgSend(v274, "addObject:", v236);
                              v237 = 0;
                            }
                            else
                            {
                              v237 = 1;
                            }

                            v14 = v280;
LABEL_199:

                            v207 = v234;
                            v33 = (void *)v278;
                            v198 = v243;
                            goto LABEL_200;
                          }
                          if (v66)
                            objc_msgSend(v275, "teardownConfigurationStoreCoordinatorForPosterUUID:error:", v276, 0);
                          else
                            objc_msgSend(v275, "teardownConfigurationStoreCoordinatorForPosterUUID:version:error:", v276, objc_msgSend(v194, "version"), 0);

                        }
                        v237 = 1;
                        goto LABEL_201;
                      }
                      v166 = (void *)MEMORY[0x1E0CB35C8];
                      v327[0] = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
                      objc_msgSend(v279, "description");
                      v167 = objc_claimAutoreleasedReturnValue();
                      v168 = v135;
                      v169 = (void *)v167;
                      v170 = CFSTR("(null change)");
                      if (v167)
                        v170 = (const __CFString *)v167;
                      v171 = *MEMORY[0x1E0CB2D68];
                      v328[0] = v170;
                      v328[1] = CFSTR("No Configuration store coordinator found to update");
                      v327[1] = v171;
                      v327[2] = CFSTR("posterUUID");
                      objc_msgSend(v276, "UUIDString");
                      v172 = objc_claimAutoreleasedReturnValue();
                      v173 = (void *)v172;
                      v174 = CFSTR("(null destinationPosterUUID)");
                      if (v172)
                        v174 = (const __CFString *)v172;
                      v328[2] = v174;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v328, v327, 3);
                      v175 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v166, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.roleCoordinator.errorDomain"), 3, v175);
                      *v277 = (id)objc_claimAutoreleasedReturnValue();

                    }
                    v18 = 0;
LABEL_127:
                    v17 = v262;
                    v19 = v267;
LABEL_128:
                    v33 = (void *)v278;
LABEL_207:
                    v43 = v268;
                    v93 = v252;
                    goto LABEL_208;
                  }
                  v121 = (void *)MEMORY[0x1E0CB35C8];
                  v329[0] = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
                  objc_msgSend(v279, "description");
                  v122 = objc_claimAutoreleasedReturnValue();
                  v123 = (void *)v122;
                  v124 = CFSTR("(null change)");
                  if (v122)
                    v124 = (const __CFString *)v122;
                  v125 = *MEMORY[0x1E0CB2D68];
                  v330[0] = v124;
                  v330[1] = CFSTR("No parent configuration specified for associated configuration");
                  v329[1] = v125;
                  v329[2] = CFSTR("posterUUID");
                  objc_msgSend(v273, "posterUUID");
                  v126 = v17;
                  v127 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v127, "UUIDString");
                  v128 = objc_claimAutoreleasedReturnValue();
                  v129 = (void *)v128;
                  v130 = CFSTR("(parent poster uuid)");
                  if (v128)
                    v130 = (const __CFString *)v128;
                  v330[2] = v130;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v330, v329, 3);
                  v131 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v121, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.roleCoordinator.errorDomain"), 3, v131);
                  *v277 = (id)objc_claimAutoreleasedReturnValue();

                  v17 = v126;
                  v93 = v252;
                  v18 = 0;
                  v19 = v267;
LABEL_97:
                  v33 = (void *)v278;
                  v43 = v268;
LABEL_208:

                  v82 = v325;
                  break;
                default:
                  v19 = v267;
                  v44 = v272;
                  v33 = (void *)v278;
                  goto LABEL_206;
              }
            }
            else
            {
              v83 = (void *)MEMORY[0x1E0CB35C8];
              v337[0] = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
              objc_msgSend(v279, "description");
              v84 = objc_claimAutoreleasedReturnValue();
              v85 = CFSTR("(null change)");
              v256 = (void *)v84;
              if (v84)
                v85 = (const __CFString *)v84;
              v337[1] = *MEMORY[0x1E0CB2D68];
              v338[0] = v85;
              v338[1] = CFSTR("Extension does not support role");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v338, v337, 2);
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v83, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.roleCoordinator.errorDomain"), 3, v82);
              v18 = 0;
              v33 = (void *)v278;
              *v277 = (id)objc_claimAutoreleasedReturnValue();
              v19 = v267;
              v44 = v272;
              v43 = v268;
            }
          }
          else
          {
            v79 = (void *)MEMORY[0x1E0CB35C8];
            v339[0] = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
            objc_msgSend(v279, "description");
            v80 = objc_claimAutoreleasedReturnValue();
            v81 = CFSTR("(null change)");
            v256 = (void *)v80;
            if (v80)
              v81 = (const __CFString *)v80;
            v339[1] = *MEMORY[0x1E0CB2D68];
            v340[0] = v81;
            v340[1] = CFSTR("Extension does not exist");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v340, v339, 2);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.roleCoordinator.errorDomain"), 3, v82);
            v18 = 0;
            *v277 = (id)objc_claimAutoreleasedReturnValue();
            v19 = v267;
            v43 = v268;
            v44 = v272;
          }

          v71 = v254;
          v16 = v255;
          v78 = v256;
LABEL_210:

          v42 = v258;
          v45 = v259;
LABEL_211:

          goto LABEL_212;
        }
        v69 = (void *)MEMORY[0x1E0CB35C8];
        v341 = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
        objc_msgSend(v279, "description");
        v76 = objc_claimAutoreleasedReturnValue();
        v71 = (void *)v76;
        v77 = CFSTR("(null change)");
        if (v76)
          v77 = (const __CFString *)v76;
        v342 = v77;
        v73 = (void *)MEMORY[0x1E0C99D80];
        v74 = &v342;
        v75 = &v341;
      }
      else
      {
        v69 = (void *)MEMORY[0x1E0CB35C8];
        v343 = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
        objc_msgSend(v279, "description");
        v70 = objc_claimAutoreleasedReturnValue();
        v71 = (void *)v70;
        v72 = CFSTR("(null change)");
        if (v70)
          v72 = (const __CFString *)v70;
        v344 = v72;
        v73 = (void *)MEMORY[0x1E0C99D80];
        v74 = &v344;
        v75 = &v343;
      }
      objc_msgSend(v73, "dictionaryWithObjects:forKeys:count:", v74, v75, 1);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.roleCoordinator.errorDomain"), 3, v78);
      v18 = 0;
      *v277 = (id)objc_claimAutoreleasedReturnValue();
      v19 = v267;
      v43 = v268;
      v44 = v272;
      goto LABEL_210;
    }
    if (v35 == 1)
    {
LABEL_11:
      objc_msgSend(v16, "orderedPosters");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "count");

      if (v38 + 1 > -[PBFPosterRoleCoordinator maximumNumberOfPosters](self, "maximumNumberOfPosters"))
      {
        v39 = (void *)MEMORY[0x1E0CB35C8];
        v351[0] = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
        objc_msgSend(v279, "description");
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = CFSTR("(null change)");
        v266 = (void *)v40;
        if (v40)
          v41 = (const __CFString *)v40;
        v351[1] = *MEMORY[0x1E0CB2D68];
        v352[0] = v41;
        v352[1] = CFSTR("Exceeded data store poster configuration limit");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v352, v351, 2);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.roleCoordinator.errorDomain"), 3, v42);
        v18 = 0;
        *v277 = (id)objc_claimAutoreleasedReturnValue();
        v19 = v267;
        v43 = v268;
        v44 = v272;
        v33 = (void *)v278;
        v45 = v30;
        v14 = v280;
        goto LABEL_211;
      }
      v266 = 0;
      v33 = (void *)v278;
    }
    else
    {
      v266 = 0;
    }
    v52 = v30;
    v14 = v280;
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
  v18 = 0;
  *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_213:

  return v18;
}

uint64_t __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke(uint64_t a1, void *a2, void *a3, _QWORD *a4, _QWORD *a5)
{
  char v5;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _BOOL4 v17;
  _BOOL4 v18;
  void *v19;
  id v21;

  if (*a4)
  {
    v5 = 1;
  }
  else
  {
    v10 = *(void **)(a1 + 32);
    v11 = a3;
    v12 = a2;
    objc_msgSend(v10, "descriptorIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    v21 = 0;
    objc_msgSend(v12, "stageNewConfigurationStoreCoordinatorForPosterUUID:descriptorIdentifier:role:error:", v11, v13, v14, &v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v21;
    v17 = v15 != 0;
    v18 = v16 == 0;
    v5 = v17 && v18;
    if (v17 && v18)
      v19 = v15;
    else
      v19 = v16;
    if (v17 && v18)
      a5 = a4;
    *a5 = objc_retainAutorelease(v19);

  }
  return v5 & 1;
}

uint64_t __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (v9)
  {
    if (!objc_msgSend(MEMORY[0x1E0D7FB50], "storeConfiguredPropertiesForPath:configuredProperties:error:", v8, v9, a5))
    {
LABEL_10:
      v15 = 0;
      goto LABEL_11;
    }
    objc_msgSend(v9, "otherMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      goto LABEL_6;
    objc_msgSend(v10, "displayNameLocalizationKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = objc_alloc(MEMORY[0x1E0D7FB38]);
      objc_msgSend(v10, "displayNameLocalizationKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v13, "initWithDisplayNameLocalizationKey:", v14);

      objc_msgSend(MEMORY[0x1E0D7FB50], "storeOtherMetadataForPath:otherMetadata:error:", v8, v11, 0);
LABEL_6:

    }
  }
  if (v10
    && !objc_msgSend(MEMORY[0x1E0D7FB50], "storeConfigurableOptionsForPath:configurableOptions:error:", v8, v10, a5))
  {
    goto LABEL_10;
  }
  v15 = 1;
LABEL_11:

  return v15;
}

uint64_t __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_3(_QWORD *a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  int v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v28;
  uint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  id v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a4;
  v11 = (void *)a1[4];
  v12 = a1[5];
  v39 = 0;
  v40 = 0;
  v13 = objc_msgSend(v11, "_prepareAttributesForIngestionForPoster:existingAttributes:incomingAttributes:proposedAttributesToDelete:proposedAttributesToUpdate:storage:currentCollection:error:", v9, v12, a3, &v40, &v39, v10, a1[6], a5);
  v14 = v40;
  v30 = v39;
  if (v13)
  {
    if (objc_msgSend(v14, "count") || objc_msgSend(v30, "count"))
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v28 = v14;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v36;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v36 != v18)
              objc_enumerationMutation(v15);
            if (!objc_msgSend(v10, "mutateAttributeForPoster:roleId:attributeId:attributePayload:error:", v9, a1[7], *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i), 0, a5))
            {
              v26 = 0;
              goto LABEL_23;
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
          if (v17)
            continue;
          break;
        }
      }

      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      objc_msgSend(v30, "keyEnumerator");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
      if (v20)
      {
        v21 = v20;
        v29 = *(_QWORD *)v32;
LABEL_14:
        v22 = 0;
        while (1)
        {
          if (*(_QWORD *)v32 != v29)
            objc_enumerationMutation(v15);
          v23 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v22);
          objc_msgSend(v30, "objectForKey:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "encodeJSON");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v10, "mutateAttributeForPoster:roleId:attributeId:attributePayload:error:", v9, a1[7], v23, v25, a5);

          if (!(_DWORD)v26)
            break;
          if (v21 == ++v22)
          {
            v21 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
            v26 = 1;
            if (v21)
              goto LABEL_14;
            break;
          }
        }
      }
      else
      {
        v26 = 1;
      }
LABEL_23:
      v14 = v28;

    }
    else
    {
      v26 = 1;
    }
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

uint64_t __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "teardownConfigurationStoreCoordinatorForPosterUUID:error:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "teardownConfigurationStoreCoordinatorForPosterUUID:version:error:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "version"), 0);
}

uint64_t __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_211(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "teardownConfigurationStoreCoordinatorForPosterUUID:error:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_2_217(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "teardownConfigurationStoreCoordinatorForPosterUUID:error:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_3_218(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "teardownConfigurationStoreCoordinatorForPosterUUID:version:error:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "version"), 0);
}

uint64_t __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_4_219(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setProviderInfo:", *(_QWORD *)(a1 + 40));
  return 1;
}

- (BOOL)_prepareAttributesForIngestionForPoster:(id)a3 existingAttributes:(id)a4 incomingAttributes:(id)a5 proposedAttributesToDelete:(id *)a6 proposedAttributesToUpdate:(id *)a7 storage:(id)a8 currentCollection:(id)a9 error:(id *)a10
{
  id v15;
  id v16;
  id v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  void *v39;
  id *v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = -[BSAtomicSignal hasBeenSignalled](self->_invalidationSignal, "hasBeenSignalled");
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    *a10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v40 = a7;
    v41 = v15;
    v19 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v16, "allKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithArray:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = v21;
    v22 = (void *)objc_msgSend(v21, "mutableCopy");
    v23 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v17, "allKeys");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setWithArray:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "minusSet:", v25);

    objc_msgSend((id)objc_opt_class(), "protectedAttributes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "intersectsSet:", v26))
    {
      v27 = (void *)objc_msgSend(v22, "mutableCopy");
      objc_msgSend(v27, "intersectSet:", v26);
      PBFLogRoleCoordinator();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        -[PBFPosterRoleCoordinator role](self, "role");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v43 = v29;
        v44 = 2114;
        v45 = v41;
        v46 = 2114;
        v47 = v27;
        _os_log_impl(&dword_1CB9FA000, v28, OS_LOG_TYPE_DEFAULT, "[%{public}@] Blocked deletion of protected attribute(s) from poster %{public}@: %{public}@", buf, 0x20u);

      }
      objc_msgSend(v22, "minusSet:", v26);

    }
    v30 = (void *)objc_msgSend(v17, "mutableCopy");
    v31 = v30;
    if (v30)
      v32 = v30;
    else
      v32 = (id)objc_opt_new();
    v33 = v32;

    v34 = *MEMORY[0x1E0D7FC48];
    objc_msgSend(v33, "objectForKey:", *MEMORY[0x1E0D7FC48]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(v33, "objectForKeyedSubscript:", v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "usageMetadataWithUpdatedLastModifiedDate");
      v37 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v37 = objc_alloc_init(MEMORY[0x1E0D7FB90]);
    }
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v37, v34);

    if (a6)
      *a6 = (id)objc_msgSend(v22, "copy");
    v15 = v41;
    if (v40)
      *v40 = (id)objc_msgSend(v33, "copy");

  }
  return v18 ^ 1;
}

- (void)noteDidResetRoleCoordinator:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  PBFPosterRoleCoordinator *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PBFLogRoleCoordinator();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[PBFPosterRoleCoordinator role](self, "role");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = self;
    _os_log_impl(&dword_1CB9FA000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did reset role coordinator %{public}@", (uint8_t *)&v6, 0x16u);

  }
}

+ (void)dumpResultsForEvent:(id)a3 role:(id)a4 posterCollection:(id)a5 changes:(id)a6 eventWasHandled:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  NSObject *v40;
  void *v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v7 = a7;
  v60 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v43 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "substringToIndex:", 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  PBFLogRoleCoordinator();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v55 = v16;
    v56 = 2114;
    v57 = v11;
    v58 = 2114;
    v59 = v43;
    _os_log_impl(&dword_1CB9FA000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]\tExecution report for notifyEventWasReceived:%{public}@ for role %{public}@", buf, 0x20u);
  }

  PBFLogRoleCoordinator();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v55 = v16;
    v56 = 1024;
    LODWORD(v57) = v7;
    _os_log_impl(&dword_1CB9FA000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@]\tWas event handled: '%{BOOL}u'", buf, 0x12u);
  }

  PBFLogRoleCoordinator();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v55 = v16;
    _os_log_impl(&dword_1CB9FA000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@]\tEvent Description:", buf, 0xCu);
  }

  PBFLogRoleCoordinator();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dumpLongDescriptionWithPreamble:log:type:", v16, v20, 16);

  PBFLogRoleCoordinator();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v12, "selectedPoster");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v55 = v16;
    v56 = 2114;
    v57 = v22;
    _os_log_impl(&dword_1CB9FA000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@]\t\tCurrent selected poster: %{public}@", buf, 0x16u);

  }
  v42 = v11;

  PBFLogRoleCoordinator();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v55 = v16;
    _os_log_impl(&dword_1CB9FA000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@]\t\tCurrent poster collection:", buf, 0xCu);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v41 = v12;
  objc_msgSend(v12, "orderedPosters");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v49 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        PBFLogRoleCoordinator();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v55 = v16;
          v56 = 2114;
          v57 = v29;
          _os_log_impl(&dword_1CB9FA000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@]\t\t\t%{public}@", buf, 0x16u);
        }

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v26);
  }

  v31 = objc_msgSend(v13, "count");
  PBFLogRoleCoordinator();
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
  if (v31)
  {
    v34 = v42;
    if (v33)
    {
      *(_DWORD *)buf = 138543618;
      v55 = v16;
      v56 = 2114;
      v57 = v42;
      _os_log_impl(&dword_1CB9FA000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@]\t\tProposed changes in response to event '%{public}@':", buf, 0x16u);
    }

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v32 = v13;
    v35 = -[NSObject countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v45 != v37)
            objc_enumerationMutation(v32);
          v39 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
          PBFLogRoleCoordinator();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v55 = v16;
            v56 = 2114;
            v57 = v39;
            _os_log_impl(&dword_1CB9FA000, v40, OS_LOG_TYPE_DEFAULT, "[%{public}@]\t\t\t%{public}@", buf, 0x16u);
          }

        }
        v36 = -[NSObject countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      }
      while (v36);
      v34 = v42;
    }
  }
  else
  {
    v34 = v42;
    if (v33)
    {
      *(_DWORD *)buf = 138543618;
      v55 = v16;
      v56 = 2114;
      v57 = v42;
      _os_log_impl(&dword_1CB9FA000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@]\t\t0 Proposed changes in response to event '%{public}@':", buf, 0x16u);
    }
  }

}

- (NSString)role
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPosterCollection:(id)a3
{
  objc_storeStrong((id *)&self->_posterCollection, a3);
}

- (unint64_t)maximumNumberOfPosters
{
  return self->maximumNumberOfPosters;
}

- (void)setMaximumNumberOfPosters:(unint64_t)a3
{
  self->maximumNumberOfPosters = a3;
}

- (PBFPosterExtensionDataStorageRetrieving)storage
{
  return (PBFPosterExtensionDataStorageRetrieving *)objc_getProperty(self, a2, 56, 1);
}

- (PBFModelCoordinatorProviding)modelCoordinatorProvider
{
  return (PBFModelCoordinatorProviding *)objc_getProperty(self, a2, 64, 1);
}

- (PBFPosterRoleCoordinatorDelegate)delegate
{
  return (PBFPosterRoleCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSSet)knownExtensionIdentifiers
{
  return self->_knownExtensionIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownExtensionIdentifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_modelCoordinatorProvider, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_posterCollection, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_invalidationSignal, 0);
}

- (void)initWithRole:storage:modelCoordinatorProvider:providers:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithRole:storage:modelCoordinatorProvider:providers:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setupRoleIfNecessaryWithStorage:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "[%{public}@] Role synchronization failed with error: %{public}@");
  OUTLINED_FUNCTION_7();
}

- (void)synchronizeFileSystemAttributesForStorage:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "[%{public}@] Failed to fix selected poster / ordered poster relationship: %{public}@");
  OUTLINED_FUNCTION_7();
}

- (void)finalizeChangesWithChangeHandler:outEvents:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "[%{public}@] Correcting unselected poster has failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)finalizeChangesWithChangeHandler:outEvents:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "[%{public}@] selectedPoster is nil; determining new selected poster",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_7();
}

- (void)finalizeChangesWithChangeHandler:outEvents:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "[%{public}@] unable to ascertain new selected poster for role.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)finalizeChangesWithChangeHandler:outEvents:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, v0, v1, "[%{public}@] collection is nil; setting up initial poster",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_7();
}

- (void)_ingestIncomingPosterConfiguration:change:currentCollection:storage:outEvents:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_ingestIncomingPosterConfiguration:change:currentCollection:storage:outEvents:error:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_ingestIncomingPosterConfiguration:change:currentCollection:storage:outEvents:error:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
