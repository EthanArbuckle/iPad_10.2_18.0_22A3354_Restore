@implementation PLManagedFolder

- (id)payloadForChangedKeys:(id)a3
{
  id v4;
  PLFolderJournalEntryPayload *v5;

  v4 = a3;
  if (-[PLManagedFolder isValidForPersistence](self, "isValidForPersistence"))
    v5 = -[PLManagedObjectJournalEntryPayload initWithManagedObject:changedKeys:]([PLFolderJournalEntryPayload alloc], "initWithManagedObject:changedKeys:", self, v4);
  else
    v5 = 0;

  return v5;
}

- (id)childKeyForOrdering
{
  return CFSTR("childCollections");
}

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PLManagedFolder;
  -[PLGenericAlbum willSave](&v9, sel_willSave);
  -[PLManagedFolder changedValues](self, "changedValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("childCollections"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLManagedFolder setNeedsPersistenceUpdate:](self, "setNeedsPersistenceUpdate:", 0);
  -[PLManagedFolder managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_16;
  if (-[PLManagedFolder isValidForPersistence](self, "isValidForPersistence"))
  {
    if ((-[PLManagedFolder isInserted](self, "isInserted") & 1) == 0 && !v4)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("title"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6
        || (objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("trashedState")),
            (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
        || (objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("isPinned")),
            (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {

      }
      else
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("isPrototype"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
          goto LABEL_10;
      }
    }
    -[PLManagedFolder setNeedsPersistenceUpdate:](self, "setNeedsPersistenceUpdate:", 1);
  }
LABEL_10:
  if (-[PLGenericAlbum kindValue](self, "kindValue") == 3999 && v5)
  {
    +[PLManagedAlbumList albumListInManagedObjectContext:](PLManagedAlbumList, "albumListInManagedObjectContext:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLManagedAlbumList pushChangesFromAlbumContainer:toAlbumContainer:](PLManagedAlbumList, "pushChangesFromAlbumContainer:toAlbumContainer:", self, v7);
    if (v4 && (objc_msgSend(v5, "isInitializingSingletons") & 1) == 0)
      -[PLManagedFolder setNeedsFixedOrderKeysComplianceUpdate:](self, "setNeedsFixedOrderKeysComplianceUpdate:", 1);

  }
LABEL_16:

}

- (void)didSave
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PLManagedFolder;
  -[PLGenericAlbum didSave](&v9, sel_didSave);
  if (-[PLManagedFolder needsPersistenceUpdate](self, "needsPersistenceUpdate"))
  {
    -[PLManagedFolder uuid](self, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4 || (-[PLManagedFolder isDeleted](self, "isDeleted") & 1) != 0)
    {
LABEL_9:

      goto LABEL_10;
    }
    v5 = -[PLManagedFolder isValidForPersistence](self, "isValidForPersistence");

    if (v5)
    {
      -[PLManagedFolder managedObjectContext](self, "managedObjectContext");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLManagedFolder.m"), 95, CFSTR("Must be PLManagedObjectContext"));

      }
      if ((objc_msgSend(v4, "isDatabaseCreationContext") & 1) == 0)
      {
        -[PLGenericAlbum photoLibrary](self, "photoLibrary");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "pathManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLManagedFolder persistMetadataToFileSystemWithPathManager:](self, "persistMetadataToFileSystemWithPathManager:", v7);

      }
      goto LABEL_9;
    }
  }
LABEL_10:
  if (-[PLManagedFolder needsFixedOrderKeysComplianceUpdate](self, "needsFixedOrderKeysComplianceUpdate")
    && (-[PLManagedFolder isDeleted](self, "isDeleted") & 1) == 0)
  {
    -[PLManagedFolder setNeedsFixedOrderKeysComplianceUpdate:](self, "setNeedsFixedOrderKeysComplianceUpdate:", 0);
    -[PLManagedFolder _enforceFixedOrderKeyCompliance](self, "_enforceFixedOrderKeyCompliance");
  }
  -[PLManagedFolder setNeedsPersistenceUpdate:](self, "setNeedsPersistenceUpdate:", 0);
}

- (void)prepareForDeletion
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLManagedFolder;
  -[PLManagedObject prepareForDeletion](&v8, sel_prepareForDeletion);
  -[PLManagedFolder managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "mergingChanges") & 1) == 0)
  {
    if (-[PLGenericAlbum kindValue](self, "kindValue") == 4000)
      objc_msgSend(v3, "recordCloudDeletionForObject:", self);
    -[PLManagedFolder uuid](self, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4
      || !-[PLManagedFolder isValidForPersistence](self, "isValidForPersistence")
      && !+[PLGenericAlbum is1WaySyncKind:](PLGenericAlbum, "is1WaySyncKind:", -[PLGenericAlbum kindValue](self, "kindValue")))
    {
      goto LABEL_10;
    }
    -[PLManagedFolder managedObjectContext](self, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isReadOnly");

    if ((v6 & 1) == 0)
    {
      -[PLGenericAlbum photoLibrary](self, "photoLibrary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pathManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLManagedFolder removePersistedFileSystemDataWithPathManager:](self, "removePersistedFileSystemDataWithPathManager:", v7);

LABEL_10:
    }
  }

}

- (int64_t)cloudDeletionType
{
  return 2;
}

- (id)assets
{
  return 0;
}

- (id)mutableAssets
{
  return 0;
}

- (unint64_t)approximateCount
{
  void *v2;
  unint64_t v3;

  -[PLManagedFolder childCollections](self, "childCollections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)assetsCount
{
  return 0;
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[PLManagedFolder childCollections](self, "childCollections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)isEmpty
{
  void *v2;
  BOOL v3;

  -[PLManagedFolder childCollections](self, "childCollections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (unint64_t)photosCount
{
  return 0;
}

- (unint64_t)videosCount
{
  return 0;
}

- (BOOL)canPerformEditOperation:(unint64_t)a3
{
  int v4;
  BOOL v5;
  BOOL v6;

  v4 = -[PLGenericAlbum kindValue](self, "kindValue");
  v5 = (a3 & 0x61) == 0;
  v6 = (a3 & 1) == 0;
  if (v4 != 4000)
    v6 = 0;
  if (v4 != 3999)
    v5 = v6;
  if (v4 == 3998)
    return a3 == 16;
  else
    return v5;
}

- (BOOL)canPerformDeleteOperation
{
  return -[PLManagedFolder canPerformEditOperation:](self, "canPerformEditOperation:", 32);
}

- (unint64_t)containersCount
{
  void *v2;
  unint64_t v3;

  -[PLManagedFolder childCollections](self, "childCollections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)canEditContainers
{
  return 1;
}

- (id)containersRelationshipName
{
  return CFSTR("childCollections");
}

- (id)identifier
{
  return &unk_1E3760368;
}

- (id)albums
{
  return (id)-[PLManagedFolder mutableOrderedSetValueForKey:](self, "mutableOrderedSetValueForKey:", CFSTR("childCollections"));
}

- (unint64_t)albumsCount
{
  void *v2;
  unint64_t v3;

  -[PLManagedFolder childCollections](self, "childCollections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)hasAtLeastOneAlbum
{
  void *v2;
  BOOL v3;

  -[PLManagedFolder childCollections](self, "childCollections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (signed)albumListType
{
  return 9;
}

- (BOOL)canEditAlbums
{
  return 1;
}

- (BOOL)albumHasFixedOrder:(id)a3
{
  return 0;
}

- (id)albumsSortingComparator
{
  return 0;
}

- (BOOL)needsReordering
{
  return 0;
}

- (void)preheatAlbumsForProperties:(id)a3 relationships:(id)a4
{
  -[PLManagedFolder preheatAlbumsAtIndexes:forProperties:relationships:](self, "preheatAlbumsAtIndexes:forProperties:relationships:", 0, a3, a4);
}

- (void)preheatAlbumsAtIndexes:(id)a3 forProperties:(id)a4 relationships:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[PLManagedFolder hasFaultForRelationshipNamed:](self, "hasFaultForRelationshipNamed:", CFSTR("childCollections")))
  {
    -[PLManagedFolder childCollections](self, "childCollections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v12, "objectsAtIndexes:", v8);
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v13;
    }
    v14 = objc_alloc(MEMORY[0x1E0C97B48]);
    +[PLGenericAlbum entityName](PLGenericAlbum, "entityName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithEntityName:", v15);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self in %@"), v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPredicate:", v17);

    objc_msgSend(v16, "setIncludesPropertyValues:", 1);
    objc_msgSend(v16, "setReturnsObjectsAsFaults:", 0);
    if (v9)
      objc_msgSend(v16, "setPropertiesToFetch:", v9);
    if (v10)
      objc_msgSend(v16, "setRelationshipKeyPathsForPrefetching:", v10);
    -[PLGenericAlbum photoLibrary](self, "photoLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "managedObjectContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0;
    objc_msgSend(v19, "executeFetchRequest:error:", v16, &v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v23;
    v22 = v21;
    if (!v20)
      NSLog(CFSTR("Error fetching albums for album list %@: %@"), self, v21);

  }
}

- (int)filter
{
  return 0;
}

- (unint64_t)unreadAlbumsCount
{
  return 0;
}

- (BOOL)isValidForPersistence
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend((id)objc_opt_class(), "validKindsForPersistence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedFolder kind](self, "kind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5;
}

- (void)persistMetadataToFileSystemWithPathManager:(id)a3
{
  id v5;
  PLPersistedFolderMetadata *v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLManagedFolder.m"), 384, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

    v5 = 0;
  }
  if (objc_msgSend(v5, "isDCIM"))
  {
    v6 = -[PLPersistedFolderMetadata initWithPLManagedFolder:pathManager:]([PLPersistedFolderMetadata alloc], "initWithPLManagedFolder:pathManager:", self, v8);
    -[PLPersistedFolderMetadata writePersistedData](v6, "writePersistedData");

  }
}

- (void)removePersistedFileSystemDataWithPathManager:(id)a3
{
  id v5;
  PLPersistedFolderMetadata *v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLManagedFolder.m"), 392, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

    v5 = 0;
  }
  if (objc_msgSend(v5, "isDCIM"))
  {
    v6 = -[PLPersistedFolderMetadata initWithPLManagedFolder:pathManager:]([PLPersistedFolderMetadata alloc], "initWithPLManagedFolder:pathManager:", self, v8);
    -[PLPersistedFolderMetadata removePersistedData](v6, "removePersistedData");

  }
}

- (void)_enforceFixedOrderKeyCompliance
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PLGenericAlbum photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryServicesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relationshipOrderKeyManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PLManagedFolder enforceFixedOrderKeyComplianceWithRelationshipOrderManager:](self, "enforceFixedOrderKeyComplianceWithRelationshipOrderManager:", v6);
  }
  else
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSManagedObject pl_shortDescription](self, "pl_shortDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "%@: unable to enforce order key compliance for root folder (%{public}@). Failed to identify managed object context.", (uint8_t *)&v10, 0x16u);

    }
  }

}

- (void)_enforceFixedOrderKeyComplianceWithRelationshipOrderManager:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _UNKNOWN **v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  _UNKNOWN **v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v36;
  void *v37;
  id obj;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLManagedFolder.m"), 414, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("orderManager"));

  }
  if (objc_msgSend(v4, "inWriteStashedLocationMode"))
  {
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v45 = v6;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "%@: Skipping enforced fixed order", buf, 0xCu);

    }
    goto LABEL_34;
  }
  -[PLManagedFolder objectID](self, "objectID");
  v7 = objc_claimAutoreleasedReturnValue();
  -[PLManagedFolder managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v7;
  v34 = v4;
  objc_msgSend(v4, "objectIDsAndOrderValuesForRelationship:onObjectWithID:invalidateCache:inContext:", CFSTR("childCollections"), v7, 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v9;
  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[PLManagedFolder childCollections](self, "childCollections");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (!v11)
    goto LABEL_27;
  v12 = v11;
  v13 = *(_QWORD *)v41;
  v36 = 1024;
  v14 = &off_1E3659000;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v41 != v13)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
      objc_msgSend(v16, "objectID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v10, "indexOfObject:", v17);
      if (v18 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v21 = v18;
        objc_msgSend(v37, "objectAtIndexedSubscript:", v18);
        v22 = v14;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "longLongValue");

        if (objc_msgSend(v22[475], "albumKindHasFixedOrder:", objc_msgSend(v16, "kindValue")))
        {
          v25 = objc_msgSend(v22[475], "priorityForAlbumKind:", objc_msgSend(v16, "kindValue"));
          if (v24 != v25)
          {
            v26 = v25;
            goto LABEL_23;
          }
        }
        else if (v24 < v36)
        {
          if (v36 == 1024)
            v26 = 0x100000;
          else
            v26 = v36;
          v36 = v26 + 1024;
LABEL_23:
          objc_msgSend(v34, "stashFolderAlbumsLocationValue:forAlbumWithID:inFolderWithID:atIndex:", v26, v17, v33, v21);
        }
        v14 = &off_1E3659000;
        goto LABEL_25;
      }
      PLBackendGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v45 = v20;
        v46 = 2112;
        v47 = v17;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "%@: unable to enforce order key compliance for %@, child object ID not found (ignoring)", buf, 0x16u);

        v14 = &off_1E3659000;
      }

LABEL_25:
    }
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  }
  while (v12);
LABEL_27:

  v4 = v34;
  if (objc_msgSend(v34, "hasStashedLocationValues"))
  {
    v39 = 0;
    v27 = objc_msgSend(v34, "writeStashedLocationValuesInContext:error:", 0, &v39);
    v28 = v39;
    if ((v27 & 1) == 0)
    {
      PLBackendGetLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v45 = v30;
        v46 = 2112;
        v47 = v28;
        _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "%@: Failed to write stashed location values for modified non fixed album order. Error: %@", buf, 0x16u);

      }
    }

  }
  v5 = v33;
LABEL_34:

}

- (NSString)_prettyDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x19AEC1554](self, a2);
  if (-[PLManagedFolder isFault](self, "isFault"))
  {
    -[PLManagedObject shortObjectIDURI](self, "shortObjectIDURI");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[PLManagedObject shortObjectIDURI](self, "shortObjectIDURI");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedFolder _typeDescription](self, "_typeDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (%@)"), v6, v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_autoreleasePoolPop(v3);
  return (NSString *)v4;
}

- (NSString)_typeDescription
{
  return (NSString *)CFSTR("Folder");
}

- (void)insertObject:(id)a3 inChildCollectionsAtIndex:(unint64_t)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x1E0CB36B8];
  v7 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initWithIndex:", a4);
  -[PLManagedFolder willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 2, v9, CFSTR("childCollections"));
  -[PLManagedFolder primitiveChildCollections](self, "primitiveChildCollections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertObject:atIndex:", v7, a4);

  -[PLManagedFolder didChange:valuesAtIndexes:forKey:](self, "didChange:valuesAtIndexes:forKey:", 2, v9, CFSTR("childCollections"));
}

- (void)removeObjectFromChildCollectionsAtIndex:(unint64_t)a3
{
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", a3);
  -[PLManagedFolder willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 3, v6, CFSTR("childCollections"));
  -[PLManagedFolder primitiveChildCollections](self, "primitiveChildCollections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectAtIndex:", a3);

  -[PLManagedFolder didChange:valuesAtIndexes:forKey:](self, "didChange:valuesAtIndexes:forKey:", 3, v6, CFSTR("childCollections"));
}

- (void)replaceObjectInChildCollectionsAtIndex:(unint64_t)a3 withObject:(id)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x1E0CB36B8];
  v7 = a4;
  v9 = (id)objc_msgSend([v6 alloc], "initWithIndex:", a3);
  -[PLManagedFolder willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 4, v9, CFSTR("childCollections"));
  -[PLManagedFolder primitiveChildCollections](self, "primitiveChildCollections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replaceObjectAtIndex:withObject:", a3, v7);

  -[PLManagedFolder didChange:valuesAtIndexes:forKey:](self, "didChange:valuesAtIndexes:forKey:", 4, v9, CFSTR("childCollections"));
}

- (void)insertChildCollections:(id)a3 atIndexes:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[PLManagedFolder willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 2, v8, CFSTR("childCollections"));
  -[PLManagedFolder primitiveChildCollections](self, "primitiveChildCollections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertObjects:atIndexes:", v6, v8);

  -[PLManagedFolder didChange:valuesAtIndexes:forKey:](self, "didChange:valuesAtIndexes:forKey:", 2, v8, CFSTR("childCollections"));
}

- (void)removeChildCollectionsAtIndexes:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PLManagedFolder willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 3, v5, CFSTR("childCollections"));
  -[PLManagedFolder primitiveChildCollections](self, "primitiveChildCollections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectsAtIndexes:", v5);

  -[PLManagedFolder didChange:valuesAtIndexes:forKey:](self, "didChange:valuesAtIndexes:forKey:", 3, v5, CFSTR("childCollections"));
}

- (void)replaceChildCollectionsAtIndexes:(id)a3 withChildCollections:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = a3;
  -[PLManagedFolder willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 3, v8, CFSTR("childCollections"));
  -[PLManagedFolder primitiveChildCollections](self, "primitiveChildCollections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "replaceObjectsAtIndexes:withObjects:", v8, v6);

  -[PLManagedFolder didChange:valuesAtIndexes:forKey:](self, "didChange:valuesAtIndexes:forKey:", 3, v8, CFSTR("childCollections"));
}

- (void)moveChildCollectionsAtIndexes:(id)a3 toIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  -[PLManagedFolder willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("childCollections"));
  -[PLManagedFolder primitiveChildCollections](self, "primitiveChildCollections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectsAtIndexes:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[PLManagedFolder didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("childCollections"));
  -[PLManagedFolder removeChildCollectionsAtIndexes:](self, "removeChildCollectionsAtIndexes:", v6);

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", a4, objc_msgSend(v9, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedFolder insertChildCollections:atIndexes:](self, "insertChildCollections:atIndexes:", v9, v8);

}

- (void)addChildCollectionsObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[PLManagedFolder willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("childCollections"));
  v5 = objc_alloc(MEMORY[0x1E0CB36B8]);
  -[PLManagedFolder primitiveChildCollections](self, "primitiveChildCollections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "initWithIndex:", objc_msgSend(v6, "count"));

  -[PLManagedFolder didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("childCollections"));
  -[PLManagedFolder willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 2, v8, CFSTR("childCollections"));
  -[PLManagedFolder primitiveChildCollections](self, "primitiveChildCollections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

  -[PLManagedFolder didChange:valuesAtIndexes:forKey:](self, "didChange:valuesAtIndexes:forKey:", 2, v8, CFSTR("childCollections"));
}

- (void)removeChildCollectionsObject:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  -[PLManagedFolder willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("childCollections"));
  -[PLManagedFolder primitiveChildCollections](self, "primitiveChildCollections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  -[PLManagedFolder didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("childCollections"));
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", v6);
    -[PLManagedFolder willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 3, v8, CFSTR("childCollections"));
    -[PLManagedFolder primitiveChildCollections](self, "primitiveChildCollections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectAtIndex:", v6);

    -[PLManagedFolder didChange:valuesAtIndexes:forKey:](self, "didChange:valuesAtIndexes:forKey:", 3, v8, CFSTR("childCollections"));
  }
}

- (void)addChildCollections:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[PLManagedFolder willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("childCollections"));
  -[PLManagedFolder primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("childCollections"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = objc_msgSend(v4, "count");

  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", v6, v7);
  -[PLManagedFolder didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("childCollections"));
  -[PLManagedFolder willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 2, v10, CFSTR("childCollections"));
  -[PLManagedFolder primitiveChildCollections](self, "primitiveChildCollections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "insertObjects:atIndexes:", v9, v10);
  -[PLManagedFolder didChange:valuesAtIndexes:forKey:](self, "didChange:valuesAtIndexes:forKey:", 2, v10, CFSTR("childCollections"));

}

- (void)removeChildCollections:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLManagedFolder willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("childCollections"));
  -[PLManagedFolder primitiveChildCollections](self, "primitiveChildCollections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(v5, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), (_QWORD)v14);
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v6, "addIndex:", v12);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  -[PLManagedFolder didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("childCollections"));
  if (objc_msgSend(v6, "count"))
  {
    -[PLManagedFolder willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 3, v6, CFSTR("childCollections"));
    -[PLManagedFolder primitiveChildCollections](self, "primitiveChildCollections");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObjectsAtIndexes:", v6);

    -[PLManagedFolder didChange:valuesAtIndexes:forKey:](self, "didChange:valuesAtIndexes:forKey:", 3, v6, CFSTR("childCollections"));
  }

}

- (BOOL)needsPersistenceUpdate
{
  return *(&self->super.didRegisteredWithUserInterfaceContext + 1);
}

- (void)setNeedsPersistenceUpdate:(BOOL)a3
{
  *(&self->super.didRegisteredWithUserInterfaceContext + 1) = a3;
}

- (BOOL)needsFixedOrderKeysComplianceUpdate
{
  return *(&self->super.didRegisteredWithUserInterfaceContext + 2);
}

- (void)setNeedsFixedOrderKeysComplianceUpdate:(BOOL)a3
{
  *(&self->super.didRegisteredWithUserInterfaceContext + 2) = a3;
}

+ (id)entityName
{
  return CFSTR("Folder");
}

+ (id)childKeyForOrdering
{
  return CFSTR("childCollections");
}

+ (id)localizedRecoveredTitle
{
  return (id)PLServicesLocalizedFrameworkStringForAssetsd();
}

+ (id)sortDescriptorsForAlbumsInFolderWithSortKey:(unsigned int)a3 ascending:(BOOL)a4
{
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _DWORD v12[4];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0u:
    case 2u:
    case 3u:
      goto LABEL_6;
    case 1u:
      v5 = (void *)MEMORY[0x1E0CB3928];
      v6 = CFSTR("creationDate");
      goto LABEL_7;
    case 4u:
      v5 = (void *)MEMORY[0x1E0CB3928];
      v6 = CFSTR("trashedDate");
      goto LABEL_7;
    case 5u:
      goto LABEL_5;
    default:
      if (a3 == 100)
      {
LABEL_6:
        v5 = (void *)MEMORY[0x1E0CB3928];
        v6 = CFSTR("parentFolder");
LABEL_7:
        objc_msgSend(v5, "sortDescriptorWithKey:ascending:", v6, a4);
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a3 != 101)
          goto LABEL_10;
LABEL_5:
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("title"), a4, sel_localizedCaseInsensitiveCompare_);
        v7 = objc_claimAutoreleasedReturnValue();
      }
      v8 = (void *)v7;
      if (v7)
      {
        v13[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
LABEL_10:
      PLBackendGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v12[0] = 67109120;
        v12[1] = a3;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, "Unexpected folder sort key value: %d", (uint8_t *)v12, 8u);
      }

      v8 = 0;
      v9 = 0;
LABEL_13:

      return v9;
  }
}

+ (id)insertNewFolderWithTitle:(id)a3 kind:(int)a4 intoLibrary:(id)a5
{
  uint64_t v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = *(_QWORD *)&a4;
  v7 = a5;
  v8 = a3;
  objc_msgSend(v7, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedObject insertInManagedObjectContext:](PLManagedFolder, "insertInManagedObjectContext:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setKindValue:", v5);
  objc_msgSend(v10, "setTitle:", v8);

  +[PLManagedAlbumList albumListInPhotoLibrary:](PLManagedAlbumList, "albumListInPhotoLibrary:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "albums");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v10);

  return v10;
}

+ (int64_t)cloudDeletionTypeForTombstone:(id)a3
{
  return 2;
}

+ (NSString)cloudUUIDKeyForDeletion
{
  return (NSString *)CFSTR("cloudGUID");
}

+ (id)validKindsForPersistence
{
  pl_dispatch_once();
  return (id)validKindsForPersistence_pl_once_object_16_85599;
}

void __43__PLManagedFolder_validKindsForPersistence__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&unk_1E3763F98, "copy");
  v1 = (void *)validKindsForPersistence_pl_once_object_16_85599;
  validKindsForPersistence_pl_once_object_16_85599 = v0;

}

- (id)descriptionOfChildCollectionOrderValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[PLManagedFolder managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x19AEC1554]();
  -[PLManagedFolder objectID](self, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_orderKeysForRelationshipWithName__:onObjectWithID:", CFSTR("childCollections"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") == 2)
  {
    v24 = v5;
    v25 = v3;
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLManagedFolder objectID](self, "objectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URIRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("FOLDER %@ [%d]\n"), v11, objc_msgSend(v12, "count"));

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v17);
          objc_msgSend(v9, "nextObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "URIRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendFormat:", CFSTR("%@ -> %@\n"), v19, v20);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v15);
    }

    v5 = v24;
    v3 = v25;
  }
  else
  {
    -[PLManagedFolder objectID](self, "objectID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "URIRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("FOLDER %@ [0 childCollections]\n"), v22);

  }
  objc_autoreleasePoolPop(v5);

  return v4;
}

@end
