@implementation PLMemory

- (id)payloadID
{
  void *v2;
  void *v3;

  -[PLMemory uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4;
  PLMemoryJournalEntryPayload *v5;

  v4 = a3;
  if (-[PLMemory isValidForPersistence](self, "isValidForPersistence"))
    v5 = -[PLManagedObjectJournalEntryPayload initWithManagedObject:changedKeys:]([PLMemoryJournalEntryPayload alloc], "initWithManagedObject:changedKeys:", self, v4);
  else
    v5 = 0;

  return v5;
}

- (id)payloadIDForTombstone:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("uuid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)validForPersistenceChangedForChangedKeys:(id)a3
{
  return objc_msgSend(a3, "containsObject:", CFSTR("pendingState"));
}

- (BOOL)isEligibleForSearchIndexing
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  if ((-[PLMemory isDeleted](self, "isDeleted") & 1) != 0)
    return 0;
  v4 = (void *)objc_opt_class();
  -[PLManagedObject photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", +[PLSpotlightDonationUtilities wellKnownPhotoLibraryIdentifierFromPLPhotoLibrary:](PLSpotlightDonationUtilities, "wellKnownPhotoLibraryIdentifierFromPLPhotoLibrary:", v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "evaluateWithObject:", self);

  return v7;
}

+ (id)isEligibleForSearchIndexingPredicateForLibraryIdentifier:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("rejected == NO AND category IN (%@)"), &unk_1E3763FC8);
}

+ (id)propertiesToFetch
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("uuid");
  v3[1] = CFSTR("title");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)relationshipKeyPathsToPrefetch
{
  return 0;
}

+ (id)fetchMemoriesWithUUIDs:(id)a3 managedObjectContext:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v17;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C97B48];
  v8 = a4;
  +[PLMemory entityName](PLMemory, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "propertiesToFetch");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPropertiesToFetch:", v11);

  objc_msgSend(v10, "setIncludesPendingChanges:", 0);
  if ((unint64_t)objc_msgSend(v6, "count") >= 0x65)
    objc_msgSend(v10, "setFetchBatchSize:", 100);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v12);

  objc_msgSend(v10, "setFetchLimit:", objc_msgSend(v6, "count"));
  v17 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v10, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v17;
  if (v13)
    objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", v13);
  else
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)fetchMemoriesForAssetObjectID:(id)a3 libraryIdentifier:(int64_t)a4 managedObjectContext:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v23;
  const __CFString *v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0C97B48];
  v9 = a5;
  v10 = a3;
  +[PLMemory entityName](PLMemory, "entityName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRequestWithEntityName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ IN %K"), v10, CFSTR("curatedAssets"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = v14;
  objc_msgSend(a1, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "andPredicateWithSubpredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPredicate:", v17);

  v24 = CFSTR("curatedAssets");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRelationshipKeyPathsForPrefetching:", v18);

  v23 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v12, &v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v23;
  if (v19)
    objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", v19);
  else
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (BOOL)supportsCloudUpload
{
  return !-[PLMemory pendingState](self, "pendingState")
      && -[PLMemory syndicatedContentState](self, "syndicatedContentState") == 0;
}

- (BOOL)isSyncableChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)();
  void *v15;
  PLMemory *v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __28__PLMemory_isSyncableChange__block_invoke;
  v15 = &unk_1E3677AA0;
  v16 = self;
  pl_dispatch_once();
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[PLMemory changedValues](self, "changedValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v17, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend((id)isSyncableChange_syncedProperties_87497, "containsObject:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i)) & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v17, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  _BYTE *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)PLMemory;
  -[PLManagedObject willSave](&v36, sel_willSave);
  -[PLMemory managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_72;
  -[PLMemory setNeedsPersistenceUpdate:](self, "setNeedsPersistenceUpdate:", 0);
  -[PLMemory changedValues](self, "changedValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLMemory isInserted](self, "isInserted"))
  {
    if (-[PLMemory pendingState](self, "pendingState") == 3)
    {
      -[PLMemory sourceGeneratedMemory](self, "sourceGeneratedMemory");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        -[PLMemory _attachUserEditToNearestSourceMemory](self, "_attachUserEditToNearestSourceMemory");
    }
  }
  if ((-[PLMemory isDeleted](self, "isDeleted") & 1) == 0)
  {
    -[PLMemory targetUserEditedMemory](self, "targetUserEditedMemory");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("representativeAssets"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        -[PLMemory _propagateRepresentativeAssetsToTargetUserEditMemory](self, "_propagateRepresentativeAssetsToTargetUserEditMemory");
    }
  }
  if ((-[PLMemory isDeleted](self, "isDeleted") & 1) == 0
    && -[PLMemory pendingState](self, "pendingState") == 3)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userRemovedAssets"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      -[PLMemory _updateCompiledAssetsAfterUserRemovedAssetsChange](self, "_updateCompiledAssetsAfterUserRemovedAssetsChange");
  }
  if ((-[PLMemory isDeleted](self, "isDeleted") & 1) == 0
    && (-[PLMemory rejected](self, "rejected") & 1) == 0
    && !-[PLMemory hasAnyAssets](self, "hasAnyAssets"))
  {
    -[PLMemory delete](self, "delete");
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cloudLocalState"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = objc_msgSend(v4, "count") == 1;
  else
    v11 = 0;

  if ((-[PLMemory isDeleted](self, "isDeleted") & 1) == 0
    && -[PLMemory isValidForPersistence](self, "isValidForPersistence")
    && ((-[PLMemory isInserted](self, "isInserted") & 1) != 0 || !v11))
  {
    -[PLMemory setNeedsPersistenceUpdate:](self, "setNeedsPersistenceUpdate:", 1);
  }
  -[PLMemory _recalculateSharingCompositionIfNeeded](self, "_recalculateSharingCompositionIfNeeded");
  if (PLPlatformSearchSupported() && PLIsFeaturedContentAllowed())
  {
    objc_msgSend(v3, "delayedSaveActions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "recordMemoryForSearchIndexUpdate:", self);

  }
  if ((-[PLMemory isDeleted](self, "isDeleted") & 1) == 0)
    +[PLDelayedSearchIndexUpdates recordMemoryIfNeeded:](PLDelayedSearchIndexUpdates, "recordMemoryIfNeeded:", self);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rejected"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[PLMemory isDeleted](self, "isDeleted") & 1) != 0 || v13)
  {
    objc_msgSend(v3, "delayedSaveActions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "recordMemoryForDuetDelete:", self);

  }
  v15 = -[PLMemory isDeleted](self, "isDeleted");
  v16 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (v15
    && -[PLMemory featuredState](self, "featuredState") == 1
    && !-[PLMemory pendingState](self, "pendingState"))
  {
    if (!*v16)
    {
      __CPLAssetsdOSLogDomain();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        -[PLMemory uuid](self, "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v18;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Recording ForYou widget timeline invalidation due to featured memory %{public}@ being deleted", buf, 0xCu);

      }
    }
    objc_msgSend(v3, "delayedSaveActions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "recordWidgetTimelineReloadNeededForType:", 0);

  }
  if (-[PLMemory rejected](self, "rejected")
    && -[PLMemory featuredState](self, "featuredState") == 1)
  {
    -[PLMemory setFeaturedState:](self, "setFeaturedState:", 0);
    if (!*v16)
    {
      __CPLAssetsdOSLogDomain();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        -[PLMemory uuid](self, "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v21;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Recording ForYou widget timeline invalidation due to featured memory %{public}@ being rejected", buf, 0xCu);

      }
    }
    objc_msgSend(v3, "delayedSaveActions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "recordWidgetTimelineReloadNeededForType:", 0);

  }
  if ((-[PLMemory isInserted](self, "isInserted") & 1) == 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {

    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subtitle"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
        goto LABEL_58;
    }
    if (!*v16)
    {
      __CPLAssetsdOSLogDomain();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        -[PLMemory uuid](self, "uuid");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v26;
        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, "Recording ForYou widget timeline invalidation due to title/subtitle change %{public}@", buf, 0xCu);

      }
    }
    objc_msgSend(v3, "delayedSaveActions");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "recordWidgetTimelineReloadNeededForType:", 0);

  }
LABEL_58:
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userFeedbacks"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    if (!*v16)
    {
      __CPLAssetsdOSLogDomain();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        -[PLMemory uuid](self, "uuid");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v30;
        _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_DEFAULT, "Updating featured content due to changes on user feedback for memory %{public}@", buf, 0xCu);

      }
    }
    objc_msgSend(v3, "delayedSaveActions");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "recordFeaturedContentUpdateNeededForPersonUUID:", 0);

    -[PLMemory recalculateUserActionOptionsBit](self, "recalculateUserActionOptionsBit");
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("curatedAssets"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32
    || (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("representativeAssets")),
        (v32 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_67:
    objc_msgSend(v3, "delayedSaveActions");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "recordMemoryAssetsUpdate:", self);

    goto LABEL_68;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("extendedCuratedAssets"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
    goto LABEL_67;
LABEL_68:
  if ((-[PLMemory isDeleted](self, "isDeleted") & 1) == 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("representativeAssets"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
      -[PLMemory recalculateStartAndEndDates](self, "recalculateStartAndEndDates");
  }

LABEL_72:
}

- (void)delete
{
  id v3;

  -[PLMemory managedObjectContext](self, "managedObjectContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteObject:", self);

}

- (void)didSave
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLMemory;
  -[PLMemory didSave](&v6, sel_didSave);
  if (-[PLMemory needsPersistenceUpdate](self, "needsPersistenceUpdate"))
  {
    -[PLMemory uuid](self, "uuid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3 || (-[PLMemory isDeleted](self, "isDeleted") & 1) != 0)
      goto LABEL_6;
    v4 = -[PLMemory isValidForPersistence](self, "isValidForPersistence");

    if (v4)
    {
      -[PLManagedObject photoLibrary](self, "photoLibrary");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pathManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMemory persistMetadataToFileSystemWithPathManager:](self, "persistMetadataToFileSystemWithPathManager:", v5);

LABEL_6:
    }
  }
  -[PLMemory setNeedsPersistenceUpdate:](self, "setNeedsPersistenceUpdate:", 0);
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
  v8.super_class = (Class)PLMemory;
  -[PLManagedObject prepareForDeletion](&v8, sel_prepareForDeletion);
  -[PLMemory managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[PLDelayedSearchIndexUpdates recordMemoryIfNeeded:](PLDelayedSearchIndexUpdates, "recordMemoryIfNeeded:", self);
    if ((objc_msgSend(v3, "mergingChanges") & 1) == 0)
    {
      objc_msgSend(v3, "recordCloudDeletionForObject:", self);
      -[PLMemory uuid](self, "uuid");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4 || !-[PLMemory isValidForPersistence](self, "isValidForPersistence"))
        goto LABEL_7;
      -[PLMemory managedObjectContext](self, "managedObjectContext");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isReadOnly");

      if ((v6 & 1) == 0)
      {
        -[PLManagedObject photoLibrary](self, "photoLibrary");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "pathManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLMemory removePersistedFileSystemDataWithPathManager:](self, "removePersistedFileSystemDataWithPathManager:", v7);

LABEL_7:
      }
    }
  }

}

- (BOOL)isUserCreatedMemory
{
  return objc_msgSend((id)objc_opt_class(), "isUserCreatedMemoryWithUserActionOptions:", -[PLMemory userActionOptions](self, "userActionOptions"));
}

- (void)recalculateUserActionOptionsBit
{
  int v3;
  void *v4;
  _BOOL4 v5;
  unsigned int v6;

  v3 = -[PLMemory userActionOptions](self, "userActionOptions");
  -[PLMemory userFeedbacks](self, "userFeedbacks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  v6 = v3 & 0xFFFFFFF9 | (2 * v5) | (4 * (-[PLMemory creationType](self, "creationType") == 1));
  if (-[PLMemory userActionOptions](self, "userActionOptions") != v6)
    -[PLMemory setUserActionOptions:](self, "setUserActionOptions:", (unsigned __int16)v6);
}

- (void)recalculateStartAndEndDates
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PLMemory representativeAssets](self, "representativeAssets", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "dateCreated");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          if (!v7 || objc_msgSend(v10, "compare:", v7) == -1)
          {
            v12 = v11;

            v7 = v12;
            if (!v6)
            {
LABEL_13:
              v13 = v11;

              v6 = v13;
              goto LABEL_14;
            }
          }
          else if (!v6)
          {
            goto LABEL_13;
          }
          if (objc_msgSend(v11, "compare:", v6) != 1)
            goto LABEL_14;
          goto LABEL_13;
        }
LABEL_14:

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (!v5)
        goto LABEL_18;
    }
  }
  v6 = 0;
  v7 = 0;
LABEL_18:

  -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", v7, CFSTR("startDate"), 0);
  -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", v6, CFSTR("endDate"), 0);

}

- (int64_t)cloudDeletionType
{
  return 3;
}

- (void)_cacheMemoryPropertiesForUIPerformanceWithPhotosGraphData:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t SerializedTitleCategory;
  void *v21;
  void *v22;
  char v23;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0CB3710];
    v4 = (void *)MEMORY[0x1E0C99E60];
    v5 = a3;
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend(v3, "unarchivedObjectOfClasses:fromData:error:", v13, v5, &v25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v25;
    if (v14)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("storyColorGradeKind"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "integerValue");

      if (!v17)
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("storyColorGradeCategory"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = PFStoryColorGradeKindDefaultForColorGradeCategory();

      }
      if (v17 != (int)-[PLMemory storyColorGradeKind](self, "storyColorGradeKind"))
        -[PLMemory setStoryColorGradeKind:](self, "setStoryColorGradeKind:", (__int16)v17);
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("storyTitleCategory"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      SerializedTitleCategory = PFStoryTitleCategoryGetSerializedTitleCategory();

      if (SerializedTitleCategory != (int)-[PLMemory storySerializedTitleCategory](self, "storySerializedTitleCategory"))-[PLMemory setStorySerializedTitleCategory:](self, "setStorySerializedTitleCategory:", (__int16)SerializedTitleCategory);
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("graphMemoryIdentifier"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        -[PLMemory graphMemoryIdentifier](self, "graphMemoryIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "isEqualToString:", v22);

        if ((v23 & 1) == 0)
          -[PLMemory setGraphMemoryIdentifier:](self, "setGraphMemoryIdentifier:", v21);
      }

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v15;
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error unarchiving photosGraphData from Memory: %@", buf, 0xCu);
    }

  }
}

- (BOOL)updateWithCPLMemoryChange:(id)a3 inPhotoLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  PLMemory *v58;
  char v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMemory setTitle:](self, "setTitle:", v8);

  objc_msgSend(v6, "subtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMemory setSubtitle:](self, "setSubtitle:", v9);

  objc_msgSend(v6, "creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMemory setCreationDate:](self, "setCreationDate:", v10);

  -[PLMemory setCategory:](self, "setCategory:", (__int16)objc_msgSend(v6, "category"));
  v58 = self;
  -[PLMemory setSubcategory:](self, "setSubcategory:", (__int16)objc_msgSend(v6, "subcategory"));
  v51 = v6;
  objc_msgSend(v6, "assetList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v13);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", v13);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v11;
  objc_msgSend(v11, "assets");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "valueForKey:", CFSTR("assetIdentifier"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v7;
  +[PLManagedAsset assetsByCloudAssetUUID:inLibrary:](PLManagedAsset, "assetsByCloudAssetUUID:inLibrary:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v16 = v14;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v66;
    v59 = 1;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v66 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        objc_msgSend(v21, "assetFlag");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "assetIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "assetMovieData");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          objc_msgSend(v15, "objectForKey:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            if (objc_msgSend(v22, "isRepresentative"))
              objc_msgSend(v57, "addObject:", v25);
            if (objc_msgSend(v22, "isCurated"))
              objc_msgSend(v56, "addObject:", v25);
            if (objc_msgSend(v22, "isExtendedCurated"))
              objc_msgSend(v55, "addObject:", v25);
            if (objc_msgSend(v22, "isMovieCurated"))
              objc_msgSend(v54, "addObject:", v25);
            if (objc_msgSend(v22, "isUserCurated"))
              objc_msgSend(v53, "addObject:", v25);
            if (objc_msgSend(v22, "isKeyAsset"))
              -[PLMemory setKeyAsset:](v58, "setKeyAsset:", v25);
            if (v24)
            {
              objc_msgSend(v25, "uuid");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "setObject:forKey:", v24, v26);

            }
          }
          else
          {
            v59 = 0;
          }

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    }
    while (v18);
  }
  else
  {
    v59 = 1;
  }

  -[PLMemory setRepresentativeAssets:](v58, "setRepresentativeAssets:", v57);
  -[PLMemory setCuratedAssets:](v58, "setCuratedAssets:", v56);
  -[PLMemory setExtendedCuratedAssets:](v58, "setExtendedCuratedAssets:", v55);
  -[PLMemory setMovieCuratedAssets:](v58, "setMovieCuratedAssets:", v54);
  -[PLMemory setUserCuratedAssets:](v58, "setUserCuratedAssets:", v53);
  -[PLMemory setMovieAssetState:](v58, "setMovieAssetState:", v60);
  objc_msgSend(v51, "customUserAssetList");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "assets");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "valueForKey:", CFSTR("assetIdentifier"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset assetsByCloudAssetUUID:inLibrary:](PLManagedAsset, "assetsByCloudAssetUUID:inLibrary:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v27, "count"));
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v29 = v27;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v62;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v62 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
        objc_msgSend(v34, "assetFlag");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "assetIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
        {
          objc_msgSend(v28, "objectForKey:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37 && objc_msgSend(v35, "isCustomUserAsset"))
            objc_msgSend(v52, "addObject:", v37);

        }
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    }
    while (v31);
  }

  -[PLMemory setCustomUserAssets:](v58, "setCustomUserAssets:", v52);
  objc_msgSend(v51, "graphData");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMemory setPhotosGraphData:](v58, "setPhotosGraphData:", v38);
  -[PLMemory _cacheMemoryPropertiesForUIPerformanceWithPhotosGraphData:](v58, "_cacheMemoryPropertiesForUIPerformanceWithPhotosGraphData:", v38);
  -[PLMemory setPhotosGraphVersion:](v58, "setPhotosGraphVersion:", objc_msgSend(v51, "graphVersion"));
  objc_msgSend(v51, "movieData");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMemory setMovieData:](v58, "setMovieData:", v39);

  objc_msgSend(v51, "score");
  -[PLMemory setScore:](v58, "setScore:");
  -[PLMemory setFavorite:](v58, "setFavorite:", objc_msgSend(v51, "isFavorite"));
  -[PLMemory setRejected:](v58, "setRejected:", objc_msgSend(v51, "isRejected"));
  -[PLMemory setUserActionOptions:](v58, "setUserActionOptions:", (unsigned __int16)objc_msgSend(v51, "userActionOptions"));
  objc_msgSend(v51, "assetListPredicate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMemory setAssetListPredicate:](v58, "setAssetListPredicate:", v40);

  -[PLMemory setNotificationState:](v58, "setNotificationState:", (__int16)objc_msgSend(v51, "notificationState"));
  objc_msgSend(v51, "blacklistedFeature");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMemory setBlacklistedFeature:](v58, "setBlacklistedFeature:", v41);

  v42 = objc_msgSend(v51, "playCount");
  if (v42 >= 1)
    -[PLMemory setPlayCount:](v58, "setPlayCount:", v42);
  v43 = objc_msgSend(v51, "shareCount");
  if (v43)
    -[PLMemory setShareCount:](v58, "setShareCount:", v43);
  v44 = objc_msgSend(v51, "viewCount");
  if (v44 >= 1)
    -[PLMemory setViewCount:](v58, "setViewCount:", v44);
  if (objc_msgSend((id)objc_opt_class(), "_isGenerativeMemoryWithUserActionOptions:", -[PLMemory userActionOptions](v58, "userActionOptions")))-[PLMemory setCreationType:](v58, "setCreationType:", 1);
  -[PLMemory setPendingState:](v58, "setPendingState:", 0);
  -[PLMemory setCloudLocalState:](v58, "setCloudLocalState:", 1);

  return v59 & 1;
}

- (BOOL)hasAnyAssets
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PLMemory curatedAssets](self, "curatedAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[PLMemory representativeAssets](self, "representativeAssets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v4 = 1;
    }
    else
    {
      -[PLMemory extendedCuratedAssets](self, "extendedCuratedAssets");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count"))
      {
        v4 = 1;
      }
      else
      {
        -[PLMemory userCuratedAssets](self, "userCuratedAssets");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "count"))
        {
          v4 = 1;
        }
        else
        {
          -[PLMemory customUserAssets](self, "customUserAssets");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = objc_msgSend(v8, "count") != 0;

        }
      }

    }
  }

  return v4;
}

- (id)allAvailableAssets
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
  void *v14;
  id v15;
  void *v16;
  void *v17;

  -[PLMemory curatedAssets](self, "curatedAssets");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMemory representativeAssets](self, "representativeAssets");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMemory extendedCuratedAssets](self, "extendedCuratedAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMemory userCuratedAssets](self, "userCuratedAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMemory customUserAssets](self, "customUserAssets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v12);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)calculateSyndicatedContentState
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  int v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x19AEC1554](self, a2);
  -[PLMemory allAvailableAssets](self, "allAvailableAssets");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "savedAssetType", (_QWORD)v9);
        if (v8 == objc_msgSend(MEMORY[0x1E0D73310], "savedAssetTypeForPromoteToGuestAsset"))
        {
          v5 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  objc_autoreleasePoolPop(v3);
  if (-[PLMemory syndicatedContentState](self, "syndicatedContentState") != (_DWORD)v5)
    -[PLMemory setSyndicatedContentState:](self, "setSyndicatedContentState:", v5);
}

- (id)calculateKeyAsset
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x19AEC1554](self, a2);
  -[PLMemory allAvailableAssets](self, "allAvailableAssets");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v8, "isDeleted", (_QWORD)v10) & 1) == 0
          && (objc_msgSend(v8, "hidden") & 1) == 0
          && !objc_msgSend(v8, "trashedState")
          && objc_msgSend(v8, "avalanchePickTypeIsVisible"))
        {
          v5 = v8;
          goto LABEL_14;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_14:

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (void)setKeyAsset:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  -[PLMemory willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("keyAsset"));
  -[PLMemory primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("keyAsset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMemory didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("keyAsset"));
  if ((objc_msgSend(v6, "isEqual:", v4) & 1) == 0)
  {
    -[PLMemory willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("keyAsset"));
    v5 = v6;
    if (!v5)
    {
      if ((-[PLMemory isDeleted](self, "isDeleted") & 1) != 0)
      {
        v5 = 0;
      }
      else
      {
        -[PLMemory calculateKeyAsset](self, "calculateKeyAsset");
        v5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    -[PLMemory setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("keyAsset"));
    -[PLMemory didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("keyAsset"));

  }
}

- (id)scopeIdentifier
{
  void *v2;
  void *v3;

  -[PLManagedObject photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainScopeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)scopedIdentifier
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0D11468]);
  -[PLMemory scopeIdentifier](self, "scopeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMemory uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithScopeIdentifier:identifier:", v4, v5);

  return v6;
}

- (id)cplMemoryChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  PLMemory *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  void *v48;
  id obj;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  -[PLMemory scopedIdentifier](self, "scopedIdentifier");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D113D0], "newChangeWithScopedIdentifier:changeType:");
  -[PLMemory title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  -[PLMemory subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSubtitle:", v5);

  objc_msgSend(v3, "setCategory:", (int)-[PLMemory category](self, "category"));
  objc_msgSend(v3, "setSubcategory:", (int)-[PLMemory subcategory](self, "subcategory"));
  -[PLMemory creationDate](self, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCreationDate:", v6);

  -[PLMemory photosGraphData](self, "photosGraphData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGraphData:", v7);

  objc_msgSend(v3, "setGraphVersion:", -[PLMemory photosGraphVersion](self, "photosGraphVersion"));
  -[PLMemory movieData](self, "movieData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMovieData:", v8);

  -[PLMemory score](self, "score");
  objc_msgSend(v3, "setScore:");
  objc_msgSend(v3, "setFavorite:", -[PLMemory favorite](self, "favorite"));
  objc_msgSend(v3, "setRejected:", -[PLMemory rejected](self, "rejected"));
  objc_msgSend(v3, "setUserActionOptions:", -[PLMemory userActionOptions](self, "userActionOptions"));
  -[PLMemory assetListPredicate](self, "assetListPredicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAssetListPredicate:", v9);

  objc_msgSend(v3, "setNotificationState:", (int)-[PLMemory notificationState](self, "notificationState"));
  -[PLMemory blacklistedFeature](self, "blacklistedFeature");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBlacklistedFeature:", v10);

  objc_msgSend(v3, "setPlayCount:", -[PLMemory playCount](self, "playCount"));
  objc_msgSend(v3, "setShareCount:", -[PLMemory shareCount](self, "shareCount"));
  v48 = v3;
  objc_msgSend(v3, "setViewCount:", -[PLMemory viewCount](self, "viewCount"));
  v56 = objc_alloc_init(MEMORY[0x1E0D113C8]);
  -[PLMemory representativeAssets](self, "representativeAssets");
  v11 = objc_claimAutoreleasedReturnValue();
  -[PLMemory movieCuratedAssets](self, "movieCuratedAssets");
  v12 = objc_claimAutoreleasedReturnValue();
  -[PLMemory userCuratedAssets](self, "userCuratedAssets");
  v13 = objc_claimAutoreleasedReturnValue();
  -[PLMemory curatedAssets](self, "curatedAssets");
  v14 = objc_claimAutoreleasedReturnValue();
  -[PLMemory extendedCuratedAssets](self, "extendedCuratedAssets");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = self;
  -[PLMemory keyAsset](self, "keyAsset");
  v17 = objc_claimAutoreleasedReturnValue();
  v55 = (void *)v11;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)v14;
  objc_msgSend(v18, "unionSet:", v14);
  v51 = (void *)v15;
  objc_msgSend(v18, "unionSet:", v15);
  v54 = (void *)v12;
  objc_msgSend(v18, "unionSet:", v12);
  v53 = (void *)v13;
  objc_msgSend(v18, "unionSet:", v13);
  if (v17)
    objc_msgSend(v18, "addObject:", v17);
  v50 = (void *)v17;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v18;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v62;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v62 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v22);
        v24 = objc_alloc_init(MEMORY[0x1E0D113C0]);
        objc_msgSend(v24, "setIsRepresentative:", objc_msgSend(v55, "containsObject:", v23));
        objc_msgSend(v24, "setIsCurated:", objc_msgSend(v52, "containsObject:", v23));
        objc_msgSend(v24, "setIsExtendedCurated:", objc_msgSend(v51, "containsObject:", v23));
        objc_msgSend(v24, "setIsMovieCurated:", objc_msgSend(v54, "containsObject:", v23));
        objc_msgSend(v24, "setIsUserCurated:", objc_msgSend(v53, "containsObject:", v23));
        objc_msgSend(v24, "setIsKeyAsset:", v50 == v23);
        -[PLMemory movieAssetState](v16, "movieAssetState");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "uuid");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKey:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = objc_alloc_init(MEMORY[0x1E0D113B8]);
        objc_msgSend(v23, "cloudAssetGUID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setAssetIdentifier:", v29);

        objc_msgSend(v28, "setAssetFlag:", v24);
        objc_msgSend(v28, "setAssetMovieData:", v27);
        objc_msgSend(v23, "master");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "scopedIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v31, "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setMasterFingerprint:", v32);
        objc_msgSend(v56, "addAsset:", v28);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    }
    while (v20);
  }

  objc_msgSend(v48, "setAssetList:", v56);
  v33 = objc_alloc_init(MEMORY[0x1E0D113C8]);
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  -[PLMemory customUserAssets](v16, "customUserAssets");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v58;
    do
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v58 != v37)
          objc_enumerationMutation(v34);
        v39 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v38);
        v40 = objc_alloc_init(MEMORY[0x1E0D113C0]);
        objc_msgSend(v40, "setIsCustomUserAsset:", 1);
        v41 = objc_alloc_init(MEMORY[0x1E0D113B8]);
        objc_msgSend(v39, "cloudAssetGUID");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setAssetIdentifier:", v42);

        objc_msgSend(v41, "setAssetFlag:", v40);
        objc_msgSend(v39, "master");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "scopedIdentifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v44, "identifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setMasterFingerprint:", v45);
        objc_msgSend(v33, "addAsset:", v41);

        ++v38;
      }
      while (v36 != v38);
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    }
    while (v36);
  }

  objc_msgSend(v48, "setCustomUserAssetList:", v33);
  return v48;
}

- (BOOL)isValidForPersistence
{
  return -[PLMemory pendingState](self, "pendingState") == 0;
}

- (void)persistMetadataToFileSystemWithPathManager:(id)a3
{
  id v5;
  PLPersistedMemoryMetadata *v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLMemory.m"), 937, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

    v5 = 0;
  }
  if (objc_msgSend(v5, "isDCIM"))
  {
    v6 = -[PLPersistedMemoryMetadata initWithPLMemory:pathManager:]([PLPersistedMemoryMetadata alloc], "initWithPLMemory:pathManager:", self, v8);
    -[PLPersistedMemoryMetadata writePersistedData](v6, "writePersistedData");

  }
}

- (void)removePersistedFileSystemDataWithPathManager:(id)a3
{
  id v5;
  PLPersistedMemoryMetadata *v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLMemory.m"), 945, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

    v5 = 0;
  }
  if (objc_msgSend(v5, "isDCIM"))
  {
    v6 = -[PLPersistedMemoryMetadata initWithPLMemory:pathManager:]([PLPersistedMemoryMetadata alloc], "initWithPLMemory:pathManager:", self, v8);
    -[PLPersistedMemoryMetadata removePersistedData](v6, "removePersistedData");

  }
}

- (BOOL)_sharingCompositionNeedsUpdate
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if ((-[PLMemory isDeleted](self, "isDeleted") & 1) != 0)
    return 0;
  -[PLMemory changedValues](self, "changedValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("extendedCuratedAssets"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v3 = 1;
  }
  else
  {
    -[PLMemory changedValues](self, "changedValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userCuratedAssets"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v7 != 0;

  }
  return v3;
}

- (void)_recalculateSharingCompositionIfNeeded
{
  void *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (-[PLMemory _sharingCompositionNeedsUpdate](self, "_sharingCompositionNeedsUpdate"))
  {
    -[PLMemory willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("sharingComposition"));
    -[PLMemory primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("sharingComposition"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "intValue");

    -[PLMemory didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("sharingComposition"));
    v5 = objc_msgSend((id)objc_opt_class(), "_calculateSharingCompositionForMemory:", self);
    if ((_DWORD)v5 != v4)
    {
      v6 = v5;
      -[PLMemory willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("sharingComposition"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMemory setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v7, CFSTR("sharingComposition"));

      -[PLMemory didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("sharingComposition"));
    }
  }
}

- (signed)sharingComposition
{
  void *v3;
  signed __int16 v4;

  -[PLMemory _recalculateSharingCompositionIfNeeded](self, "_recalculateSharingCompositionIfNeeded");
  -[PLMemory willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("sharingComposition"));
  -[PLMemory primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("sharingComposition"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  -[PLMemory didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("sharingComposition"));
  return v4;
}

- (void)_propagateRepresentativeAssetsToTargetUserEditMemory
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[PLMemory pendingState](self, "pendingState") == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLMemory.m"), 1163, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.pendingState != PLMemoryPendingStateUserEdit"));

  }
  -[PLMemory targetUserEditedMemory](self, "targetUserEditedMemory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = v4;
    objc_msgSend((id)objc_opt_class(), "_compiledUserEditedAssetsFromSourceMemory:andTargetMemory:", self, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pl_safeSetValue:forKey:valueDidChangeHandler:", v5, CFSTR("customUserAssets"), 0);
    objc_msgSend(v5, "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pl_safeSetValue:forKey:valueDidChangeHandler:", v6, CFSTR("representativeAssets"), 0);

    v4 = v8;
  }

}

- (void)_updateCompiledAssetsAfterUserRemovedAssetsChange
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[PLMemory pendingState](self, "pendingState") != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLMemory.m"), 1175, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.pendingState == PLMemoryPendingStateUserEdit"));

  }
  v4 = (void *)objc_opt_class();
  -[PLMemory sourceGeneratedMemory](self, "sourceGeneratedMemory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_compiledUserEditedAssetsFromSourceMemory:andTargetMemory:", v5, self);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", v8, CFSTR("customUserAssets"), 0);
  objc_msgSend(v8, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", v6, CFSTR("representativeAssets"), 0);

}

- (BOOL)_attachUserEditToNearestSourceMemory
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  if (-[PLMemory pendingState](self, "pendingState") != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLMemory.m"), 1184, CFSTR("can only connect userEdit memory."));

  }
  v4 = (void *)objc_opt_class();
  -[PLMemory representativeAssets](self, "representativeAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_predicateForSourceGeneratedMemories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_findCollectionMostSimilarToCollectionWithAssets:additionalPredicate:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", v7, CFSTR("sourceGeneratedMemory"), 0);

  return v7 != 0;
}

- (BOOL)_attachGeneratedMemoryToNearestUserEditMemory
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  if (-[PLMemory pendingState](self, "pendingState") == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLMemory.m"), 1199, CFSTR("can only connect generated memory."));

  }
  v4 = (void *)objc_opt_class();
  -[PLMemory representativeAssets](self, "representativeAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_predicateForTargetUserEditMemories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_findCollectionMostSimilarToCollectionWithAssets:additionalPredicate:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[PLMemory setTargetUserEditedMemory:](self, "setTargetUserEditedMemory:", v7);

  return v7 != 0;
}

- (BOOL)promoteToUserEditedMemoryWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;

  -[PLMemory entity](self, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMemory managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v6, (uint64_t)v7, &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v14;

  if (v8)
  {
    objc_msgSend((id)objc_opt_class(), "_deepCopyFromMemory:toMemory:", self, v8);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pl_safeSetValue:forKey:valueDidChangeHandler:", v11, CFSTR("uuid"), 0);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", v12, CFSTR("creationDate"), 0);

    -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", &unk_1E3760A28, CFSTR("pendingState"), 0);
    -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", v8, CFSTR("sourceGeneratedMemory"), 0);
  }
  else if (a3)
  {
    *a3 = objc_retainAutorelease(v9);
  }

  return v8 != 0;
}

- (BOOL)needsPersistenceUpdate
{
  return self->_needsPersistenceUpdate;
}

- (void)setNeedsPersistenceUpdate:(BOOL)a3
{
  self->_needsPersistenceUpdate = a3;
}

void __28__PLMemory_isSyncableChange__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("title"), CFSTR("subtitle"), CFSTR("creationDate"), CFSTR("category"), CFSTR("subcategory"), CFSTR("rejected"), CFSTR("favorite"), CFSTR("pendingState"), CFSTR("syndicatedContentState"), CFSTR("userActionOptions"), CFSTR("movieAssetState"), CFSTR("movieData"), CFSTR("photosGraphVersion"), CFSTR("photosGraphData"), CFSTR("keyAsset"), CFSTR("score"), CFSTR("assetListPredicate"),
         CFSTR("representativeAssets"),
         CFSTR("curatedAssets"),
         CFSTR("extendedCuratedAssets"),
         CFSTR("movieCuratedAssets"),
         CFSTR("userCuratedAssets"),
         CFSTR("customUserAssets"),
         CFSTR("notificationState"),
         CFSTR("blacklistedFeature"),
         CFSTR("playCount"),
         CFSTR("shareCount"),
         CFSTR("viewCount"),
         CFSTR("userFeedbacks"),
         0);
  v1 = (void *)isSyncableChange_syncedProperties_87497;
  isSyncableChange_syncedProperties_87497 = v0;

}

+ (id)insertIntoContext:(id)a3 withUUID:(id)a4 title:(id)a5 subtitle:(id)a6 creationDate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v13)
  {
    objc_msgSend(a1, "entityName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", v18, v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLMemory.m"), 159, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

    objc_msgSend(a1, "entityName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v18, 0, 0);
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v19, "setUuid:", v14);
    objc_msgSend(v19, "setTitle:", v15);
    objc_msgSend(v19, "setSubtitle:", v16);
    objc_msgSend(v19, "setCreationDate:", v17);
  }

  return v19;
}

+ (id)entityName
{
  return CFSTR("Memory");
}

+ (BOOL)isUserCreatedMemoryWithUserActionOptions:(unsigned __int16)a3
{
  return a3 & 1;
}

+ (BOOL)_isGenerativeMemoryWithUserActionOptions:(unsigned __int16)a3
{
  return (a3 >> 2) & 1;
}

+ (int64_t)cloudDeletionTypeForTombstone:(id)a3
{
  return 3;
}

+ (NSString)cloudUUIDKeyForDeletion
{
  return (NSString *)CFSTR("uuid");
}

+ (id)memoriesToUploadInPhotoLibrary:(id)a3 limit:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a3;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K == %d and %K == %d and %K == %d"), CFSTR("pendingState"), 0, CFSTR("cloudLocalState"), 0, CFSTR("syndicatedContentState"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_memoriesMatchingPredicate:sortDescriptors:limit:inPhotoLibrary:", v8, v10, a4, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)_shouldPrefetchMemoryMovieCuratedAssetsInPhotoLibrary:(id)a3 prefetchConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  BOOL v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("PLForceMemoryPrefetching"));

  if (v9)
  {
    v10 = 1;
    *((_BYTE *)v18 + 24) = 1;
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __88__PLMemory__shouldPrefetchMemoryMovieCuratedAssetsInPhotoLibrary_prefetchConfiguration___block_invoke;
    v12[3] = &unk_1E3674DF8;
    v13 = v7;
    v16 = a1;
    v14 = v6;
    v15 = &v17;
    objc_msgSend(v14, "performBlockAndWait:", v12);

    v10 = *((_BYTE *)v18 + 24) != 0;
  }
  _Block_object_dispose(&v17, 8);

  return v10;
}

+ (id)memoriesToPrefetchInPhotoLibrary:(id)a3 prefetchConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "_shouldPrefetchMemoryMovieCuratedAssetsInPhotoLibrary:prefetchConfiguration:", v6, v7))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateByAddingTimeInterval:", (double)-objc_msgSend(v7, "memoryPrefetchIfCreationDateWithin"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == NO AND (%K >= %@) AND %K == %d"), CFSTR("rejected"), CFSTR("creationDate"), v9, CFSTR("featuredState"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_memoriesMatchingPredicate:sortDescriptors:limit:inPhotoLibrary:", v10, v12, objc_msgSend(v7, "memoryPrefetchLimit"), v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)memoriesToPrefetchForWidgetInManagedObjectContext:(id)a3
{
  id v4;
  PLGlobalValues *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[PLGlobalValues initWithManagedObjectContext:]([PLGlobalValues alloc], "initWithManagedObjectContext:", v4);
  if (-[PLGlobalValues shouldPrefetchWidgetResources](v5, "shouldPrefetchWidgetResources"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == NO AND %K == %d"), CFSTR("rejected"), CFSTR("featuredState"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_memoriesMatchingPredicate:sortDescriptors:limit:inPhotoLibrary:", v6, 0, 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (PLMemory)memoryWithUUID:(id)a3 inPhotoLibrary:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("uuid == %@"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_memoriesMatchingPredicate:sortDescriptors:limit:inPhotoLibrary:", v8, 0, 1, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (PLMemory *)v10;
}

+ (id)memoriesWithUUIDs:(id)a3 inPhotoLibrary:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("uuid IN %@"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_memoriesMatchingPredicate:sortDescriptors:limit:inPhotoLibrary:", v8, 0, 0, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (unint64_t)countOfMemoriesCreatedTodayWithNotificationStateRequestedOrSeenInPhotoLibrary:(id)a3 excludingMemory:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
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
  void *v24;
  void *v25;
  unint64_t v26;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0C99D48];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startOfDayForDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "dateByAddingTimeInterval:", 86400.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v8, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "predicateWithFormat:", CFSTR("%K != %@"), CFSTR("uuid"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d || %K == %d"), CFSTR("notificationState"), 1, CFSTR("notificationState"), 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@ AND %K < %@"), CFSTR("creationDate"), v12, CFSTR("creationDate"), v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0CB3528];
  v28[0] = v16;
  v28[1] = v17;
  v28[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "andPredicateWithSubpredicates:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0C97B48];
  +[PLMemory entityName](PLMemory, "entityName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "fetchRequestWithEntityName:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "setPredicate:", v21);
  objc_msgSend(v9, "managedObjectContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_msgSend(v25, "countForFetchRequest:error:", v24, a5);
  return v26;
}

+ (id)_memoriesMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(int64_t)a5 inPhotoLibrary:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  id v28;
  int64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__87649;
  v34 = __Block_byref_object_dispose__87650;
  v35 = 0;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __76__PLMemory__memoriesMatchingPredicate_sortDescriptors_limit_inPhotoLibrary___block_invoke;
  v23 = &unk_1E3676150;
  v28 = a1;
  v13 = v10;
  v24 = v13;
  v14 = v11;
  v29 = a5;
  v25 = v14;
  v27 = &v30;
  v15 = v12;
  v26 = v15;
  objc_msgSend(v15, "performBlockAndWait:", &v20);
  v16 = (void *)v31[5];
  if (v16)
  {
    v17 = v16;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array", v20, v21, v22, v23, v24, v25);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  _Block_object_dispose(&v30, 8);
  return v18;
}

+ (void)resetCloudStateInPhotoLibrary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x19AEC1554]();
  v6 = objc_alloc(MEMORY[0x1E0C97AB0]);
  objc_msgSend(a1, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithEntityName:", v7);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("cloudLocalState != %d"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setResultType:", 2);
  objc_msgSend(v8, "setPropertiesToUpdate:", &unk_1E37646C0);
  objc_msgSend(v8, "setPredicate:", v9);
  objc_msgSend(v4, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v10, "executeRequest:error:", v8, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v15;

  if (v11)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "result");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v14;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Batch updated %@ Memories", buf, 0xCu);

      }
LABEL_8:

    }
  }
  else if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v12;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Failed to batch update Memories: %@", buf, 0xCu);
    }
    goto LABEL_8;
  }

  objc_autoreleasePoolPop(v5);
}

+ (unint64_t)_deleteMemoriesMatchingPredicate:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  unint64_t v17;
  unint64_t v19;
  uint8_t buf[4];
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x19AEC1554]();
  v9 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(a1, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchRequestWithEntityName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setPredicate:", v6);
  v19 = 0;
  objc_msgSend(v7, "enumerateObjectsFromFetchRequest:count:batchSize:usingBlock:", v11, &v19, 100, &__block_literal_global_87636);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v21 = (unint64_t)v12;
        v14 = "Error fetching suggestions: %{public}@";
        v15 = v13;
        v16 = OS_LOG_TYPE_ERROR;
LABEL_8:
        _os_log_impl(&dword_199541000, v15, v16, v14, buf, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      v21 = v19;
      v14 = "Deleted %{public}lu memories";
      v15 = v13;
      v16 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_8;
    }
LABEL_9:

  }
  v17 = v19;

  objc_autoreleasePoolPop(v8);
  return v17;
}

+ (void)deletePendingMemoriesCreatedBefore:(id)a3 inPhotoLibrary:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Removing pending memories created before %@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("pendingState == %d and creationDate < %@"), 1, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_deleteMemoriesMatchingPredicate:inManagedObjectContext:", v9, v10);

}

+ (void)deleteMemoriesWithObjectIDs:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v14 = v9;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Removing %@ memories", buf, 0xCu);

      }
    }
    v10 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v6, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateWithFormat:", CFSTR("SELF IN %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_deleteMemoriesMatchingPredicate:inManagedObjectContext:", v12, v7);
  }

}

+ (void)deleteAllMemoriesInPhotoLibrary:(id)a3
{
  id v4;
  _BYTE *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Removing ALL memories", buf, 2u);
    }

  }
  v7 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(a1, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v9);
  objc_msgSend(v10, "setResultType:", 2);
  objc_msgSend(v4, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v11, "executeRequest:error:", v10, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v16;

  if (v12)
  {
    if (!*v5)
    {
      __CPLAssetsdOSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "result");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v15;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Batch deleted %@ Memories", buf, 0xCu);

      }
LABEL_12:

    }
  }
  else if (!*v5)
  {
    __CPLAssetsdOSLogDomain();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v13;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Failed to batch delete Memories: %@", buf, 0xCu);
    }
    goto LABEL_12;
  }

}

+ (id)memoryObjectIDsContainingAsset:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0C99E20];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "objectIDsForRelationshipNamed:", CFSTR("memoriesBeingCuratedAssets"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  objc_msgSend(v4, "objectIDsForRelationshipNamed:", CFSTR("memoriesBeingExtendedCuratedAssets"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  objc_msgSend(v4, "objectIDsForRelationshipNamed:", CFSTR("memoriesBeingUserCuratedAssets"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v8);

  objc_msgSend(v4, "objectIDsForRelationshipNamed:", CFSTR("memoriesBeingRepresentativeAssets"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v9);

  objc_msgSend(v4, "objectIDsForRelationshipNamed:", CFSTR("memoriesBeingCustomUserAssets"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObjectsFromArray:", v10);
  return v5;
}

+ (id)keyPathsForMemoriesBeingAssets
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("memoriesBeingCuratedAssets");
  v3[1] = CFSTR("memoriesBeingExtendedCuratedAssets");
  v3[2] = CFSTR("memoriesBeingUserCuratedAssets");
  v3[3] = CFSTR("memoriesBeingRepresentativeAssets");
  v3[4] = CFSTR("memoriesBeingCustomUserAssets");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)memoriesContainingAsset:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0C99E20];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "memoriesBeingCuratedAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(v4, "memoriesBeingExtendedCuratedAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v7);

  objc_msgSend(v4, "memoriesBeingUserCuratedAssets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v8);

  objc_msgSend(v4, "memoriesBeingRepresentativeAssets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v9);

  objc_msgSend(v4, "memoriesBeingCustomUserAssets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "unionSet:", v10);
  return v5;
}

+ (signed)_calculateSharingCompositionForMemory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  signed __int16 v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v3, "extendedCuratedAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "customUserAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v8);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v10)
  {

LABEL_14:
    v16 = 0;
    goto LABEL_15;
  }
  v11 = v10;
  v12 = 0;
  v13 = 0;
  v14 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v19 != v14)
        objc_enumerationMutation(v9);
      v13 += objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "hasLibraryScope", (_QWORD)v18);
    }
    v12 += v11;
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v11);

  if (v12 == v13)
    v16 = 1;
  else
    v16 = 2;
  if (!v13)
    goto LABEL_14;
LABEL_15:

  return v16;
}

+ (id)predicateForPrivateOnlyCollectionsWithinSubset:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLMemory.m"), 1020, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("collections"));

  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF IN %@ AND (SUBQUERY(%K, $a, $a.%K == %d).@count == 0) AND (SUBQUERY(%K, $a, $a.%K == %d).@count == 0)"), v5, CFSTR("extendedCuratedAssets"), CFSTR("activeLibraryScopeParticipationState"), 1, CFSTR("userCuratedAssets"), CFSTR("activeLibraryScopeParticipationState"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForSharedOnlyCollectionsWithinSubset:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLMemory.m"), 1030, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("collections"));

  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF IN %@ AND (SUBQUERY(%K, $a, $a.%K == %d).@count == 0) AND (SUBQUERY(%K, $a, $a.%K == %d).@count == 0)"), v5, CFSTR("extendedCuratedAssets"), CFSTR("activeLibraryScopeParticipationState"), 0, CFSTR("userCuratedAssets"), CFSTR("activeLibraryScopeParticipationState"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_predicateForSourceGeneratedMemories
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d AND %K = nil"), CFSTR("pendingState"), 3, CFSTR("targetUserEditedMemory"));
}

+ (id)_predicateForTargetUserEditMemories
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d AND %K = nil"), CFSTR("pendingState"), 3, CFSTR("sourceGeneratedMemory"));
}

+ (void)_deepCopyFromMemory:(id)a3 toMemory:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLMemory.m"), 1056, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceMemory"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLMemory.m"), 1057, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("targetMemory"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  +[PLMemory entity](PLMemory, "entity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attributesByName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __41__PLMemory__deepCopyFromMemory_toMemory___block_invoke;
  v24[3] = &unk_1E3673C50;
  v13 = v7;
  v25 = v13;
  v14 = v9;
  v26 = v14;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v24);

  +[PLMemory entity](PLMemory, "entity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "relationshipsByName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v12;
  v21[1] = 3221225472;
  v21[2] = __41__PLMemory__deepCopyFromMemory_toMemory___block_invoke_2;
  v21[3] = &unk_1E3674260;
  v22 = v13;
  v23 = v14;
  v17 = v14;
  v20 = v13;
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v21);

}

+ (id)_findCollectionMostSimilarToCollectionWithAssets:(id)a3 additionalPredicate:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
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
  NSObject *v52;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  id v63;
  id v64;
  id obj;
  void *v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t buf[8];
  _QWORD v78[3];
  _QWORD v79[3];
  _QWORD v80[3];
  _BYTE v81[128];
  _QWORD v82[2];
  _QWORD v83[3];
  uint64_t v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v64 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v74 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * i), "objectID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
      }
      while (v10);
    }

    +[PLMemory fetchRequest](PLMemory, "fetchRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "anyObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "managedObjectContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %K in %@"), CFSTR("representativeAssets"), v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPredicate:", v17);

    v62 = v7;
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionWithFormat:", CFSTR("SUBQUERY(%K, $a, $a IN %@).@count"), CFSTR("representativeAssets"), v7);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc_init(MEMORY[0x1E0C97B30]);
    objc_msgSend(v19, "setName:", CFSTR("matchCount"));
    v59 = (void *)v18;
    objc_msgSend(v19, "setExpression:", v18);
    objc_msgSend(v19, "setExpressionResultType:", 200);
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("representativeAssets"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB35D0];
    v57 = (void *)v20;
    v84 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "expressionForFunction:arguments:", CFSTR("count:"), v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v24 = objc_alloc_init(MEMORY[0x1E0C97B30]);
    objc_msgSend(v24, "setName:", CFSTR("count"));
    v56 = (void *)v23;
    objc_msgSend(v24, "setExpression:", v23);
    objc_msgSend(v24, "setExpressionResultType:", 200);
    v83[0] = CFSTR("objectID");
    v83[1] = v19;
    v58 = v19;
    v55 = v24;
    v83[2] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPropertiesToFetch:", v25);

    objc_msgSend(v14, "setPropertiesToGroupBy:", &unk_1E3763FF8);
    objc_msgSend(v14, "setResultType:", 2);
    if (v6)
    {
      v26 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(v14, "predicate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v82[0] = v27;
      v82[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "andPredicateWithSubpredicates:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setPredicate:", v29);

    }
    v63 = v6;
    v72 = 0;
    v60 = v16;
    v61 = v14;
    objc_msgSend(v16, "executeFetchRequest:error:", v14, &v72);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v72;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v30, "count"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    obj = v30;
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v69;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v69 != v33)
            objc_enumerationMutation(obj);
          v35 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
          v79[0] = CFSTR("objectID");
          objc_msgSend(v35, "objectForKeyedSubscript:");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v80[0] = v36;
          v79[1] = CFSTR("matchCount");
          objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("matchCount"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v80[1] = v37;
          v79[2] = CFSTR("nonMatchCount");
          v38 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("count"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "integerValue");
          objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("matchCount"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "numberWithInteger:", v40 - objc_msgSend(v41, "integerValue"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v80[2] = v42;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 3);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v66, "addObject:", v43);
        }
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
      }
      while (v32);
    }

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("matchCount"), 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = v44;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("nonMatchCount"), 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v78[1] = v45;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v78[2] = v46;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 3);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "sortUsingDescriptors:", v47);

    objc_msgSend(v66, "firstObject");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("objectID"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
    {
      v67 = 0;
      v50 = v60;
      objc_msgSend(v60, "existingObjectWithID:error:", v49, &v67);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v62;
      v6 = v63;
    }
    else
    {
      v51 = 0;
      v52 = v62;
      v6 = v63;
      v50 = v60;
    }

    v5 = v64;
  }
  else
  {
    PLBackendGetLog();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v52, OS_LOG_TYPE_ERROR, "Cannot find collection similar to an empty collection.", buf, 2u);
    }
    v51 = 0;
  }

  return v51;
}

+ (id)_compiledUserEditedAssetsFromSourceMemory:(id)a3 andTargetMemory:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v7 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "pendingState") == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLMemory.m"), 1145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceMemory.pendingState != PLMemoryPendingStateUserEdit"));

  }
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "customUserAssets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unionOrderedSet:", v10);

  objc_msgSend(v7, "representativeAssets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unionSet:", v11);

  objc_msgSend(v8, "representativeAssets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "unionSet:", v12);
  objc_msgSend(v7, "userRemovedAssets");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "minusSet:", v13);
  return v9;
}

void __41__PLMemory__deepCopyFromMemory_toMemory___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "valueForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "pl_safeSetValue:forKey:valueDidChangeHandler:", v5, v4, 0);

}

void __41__PLMemory__deepCopyFromMemory_toMemory___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "valueForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "pl_safeSetValue:forKey:valueDidChangeHandler:", v5, v4, 0);

}

uint64_t __68__PLMemory__deleteMemoriesMatchingPredicate_inManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "delete");
}

void __76__PLMemory__memoriesMatchingPredicate_sortDescriptors_limit_inPhotoLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(*(id *)(a1 + 64), "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setFetchBatchSize:", 100);
  objc_msgSend(v4, "setPredicate:", *(_QWORD *)(a1 + 32));
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v4, "setSortDescriptors:");
  if (*(uint64_t *)(a1 + 72) >= 1)
    objc_msgSend(v4, "setFetchLimit:");
  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v4, &v12);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v12;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    v10 = 0;
  else
    v10 = *MEMORY[0x1E0D115D0] == 0;
  if (v10)
  {
    __CPLAssetsdOSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v7;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch memories: %@", buf, 0xCu);
    }

  }
}

void __88__PLMemory__shouldPrefetchMemoryMovieCuratedAssetsInPhotoLibrary_prefetchConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingTimeInterval:", (double)-objc_msgSend(*(id *)(a1 + 32), "memoryPrefetchAllowedIfLastViewedDateWithin"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("lastViewedDate"), v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "_memoriesMatchingPredicate:sortDescriptors:limit:inPhotoLibrary:", v3, 0, 1, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "count") != 0;

}

@end
