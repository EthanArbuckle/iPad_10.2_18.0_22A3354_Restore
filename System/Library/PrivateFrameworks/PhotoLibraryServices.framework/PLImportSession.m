@implementation PLImportSession

- (id)mutableAssets
{
  return (id)-[PLImportSession mutableSetValueForKey:](self, "mutableSetValueForKey:", CFSTR("assets"));
}

- (void)_updateStartDate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLImportSession startDate](self, "startDate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        -[PLImportSession startDate](self, "startDate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "timeIntervalSinceDate:", v4),
        v9 = fabs(v8),
        v7,
        v6,
        v9 > 2.22044605e-16))
  {
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[PLImportSession importSessionID](self, "importSessionID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v4;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "setStartDate: %@ for %@", (uint8_t *)&v12, 0x16u);

    }
    -[PLImportSession setStartDate:](self, "setStartDate:", v4);
  }

}

- (void)_updateEndDate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLImportSession endDate](self, "endDate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        -[PLImportSession endDate](self, "endDate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "timeIntervalSinceDate:", v4),
        v9 = fabs(v8),
        v7,
        v6,
        v9 > 2.22044605e-16))
  {
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[PLImportSession importSessionID](self, "importSessionID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v4;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "setEndDate: %@ for %@", (uint8_t *)&v12, 0x16u);

    }
    -[PLImportSession setEndDate:](self, "setEndDate:", v4);
  }

}

- (void)revalidateImportDates
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  PLBackendGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[PLImportSession importSessionID](self, "importSessionID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Revalidating importDates for %@", (uint8_t *)&v13, 0xCu);

  }
  -[PLImportSession _orderedBatchedAssets](self, "_orderedBatchedAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  while (1)
  {
    v8 = v7;
    objc_msgSend(v6, "nextObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      break;
    if (-[PLImportSession _isAssetIncludedInImportDates:](self, "_isAssetIncludedInImportDates:", v7))
    {
      objc_msgSend(v7, "addedDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  v9 = 0;
LABEL_8:
  objc_msgSend(v5, "reverseObjectEnumerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    v11 = v7;
    objc_msgSend(v10, "nextObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      break;
    if (-[PLImportSession _isAssetIncludedInImportDates:](self, "_isAssetIncludedInImportDates:", v7))
    {
      objc_msgSend(v7, "addedDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
  }
  v12 = 0;
LABEL_13:
  -[PLImportSession _updateStartDate:](self, "_updateStartDate:", v9);
  -[PLImportSession _updateEndDate:](self, "_updateEndDate:", v12);

}

- (void)updateImportDatesFromAddedAsset:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "addedDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[PLImportSession _isAssetIncludedInImportDates:](self, "_isAssetIncludedInImportDates:", v4);

  if (v5)
  {
    if (-[PLImportSession _isDateBeforeStartDate:](self, "_isDateBeforeStartDate:", v6))
      -[PLImportSession _updateStartDate:](self, "_updateStartDate:", v6);
    if (-[PLImportSession _isDateAfterEndDate:](self, "_isDateAfterEndDate:", v6))
      -[PLImportSession _updateEndDate:](self, "_updateEndDate:", v6);
  }

}

- (BOOL)_isAssetIncludedInImportDates:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isInTrash") & 1) != 0)
    LOBYTE(v4) = 0;
  else
    v4 = objc_msgSend(v3, "isDeleted") ^ 1;

  return v4;
}

- (BOOL)_isDateBeforeStartDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[PLImportSession startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PLImportSession startDate](self, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "compare:", v4) == 1;

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)_isDateAfterEndDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[PLImportSession endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PLImportSession endDate](self, "endDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "compare:", v4) == -1;

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)_orderedBatchedAssets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setFetchBatchSize:", 100);
  objc_msgSend(v5, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("importSession"), self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v8);

  -[PLImportSession managedObjectContext](self, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v5, &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  if (!v10)
  {
    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = (uint64_t)v11;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Unable to fetch batchedAssets: %@", buf, 0xCu);
    }

  }
  PLBackendGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = objc_msgSend(v10, "count");
    -[PLManagedObject shortObjectIDURI](self, "shortObjectIDURI");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v19 = v14;
    v20 = 2112;
    v21 = v15;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "Batch fetched %lu assets from import session %@", buf, 0x16u);

  }
  return v10;
}

- (BOOL)isValidForPersistence
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend((id)objc_opt_class(), "validKindsForPersistence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLImportSession kind](self, "kind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5;
}

- (void)persistMetadataToFileSystemWithPathManager:(id)a3
{
  id v5;
  PLPersistedAlbumMetadata *v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLImportSession.m"), 196, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

    v5 = 0;
  }
  if (objc_msgSend(v5, "isDCIM"))
  {
    v6 = -[PLPersistedAlbumMetadata initWithPLGenericAlbum:pathManager:]([PLPersistedAlbumMetadata alloc], "initWithPLGenericAlbum:pathManager:", self, v8);
    -[PLPersistedAlbumMetadata persistAlbumData](v6, "persistAlbumData");

  }
}

- (void)removePersistedFileSystemDataWithPathManager:(id)a3
{
  id v5;
  PLPersistedAlbumMetadata *v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLImportSession.m"), 204, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

    v5 = 0;
  }
  if (objc_msgSend(v5, "isDCIM"))
  {
    v6 = -[PLPersistedAlbumMetadata initWithPLGenericAlbum:pathManager:]([PLPersistedAlbumMetadata alloc], "initWithPLGenericAlbum:pathManager:", self, v8);
    -[PLPersistedAlbumMetadata removePersistedAlbumData](v6, "removePersistedAlbumData");

  }
}

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PLImportSession;
  -[PLGenericAlbum willSave](&v11, sel_willSave);
  -[PLImportSession setNeedsPersistenceUpdate:](self, "setNeedsPersistenceUpdate:", 0);
  -[PLImportSession managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PLImportSession changedValues](self, "changedValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PLImportSession isValidForPersistence](self, "isValidForPersistence"))
    {
      if ((-[PLImportSession isInserted](self, "isInserted") & 1) != 0
        || (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assets")),
            v5 = (void *)objc_claimAutoreleasedReturnValue(),
            v5,
            v5))
      {
        -[PLImportSession setNeedsPersistenceUpdate:](self, "setNeedsPersistenceUpdate:", 1);
      }
    }
    if ((-[PLImportSession isDeleted](self, "isDeleted") & 1) == 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assets"));
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)v6;
        -[PLImportSession assets](self, "assets");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count");

        if (!v9)
          -[PLGenericAlbum delete](self, "delete");
      }
    }
    objc_msgSend(v3, "delayedSaveActions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recordImportSessionCountsAndDateRangeUpdate:", self);

  }
}

- (void)didSave
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLImportSession;
  -[PLGenericAlbum didSave](&v8, sel_didSave);
  if (-[PLImportSession needsPersistenceUpdate](self, "needsPersistenceUpdate"))
  {
    -[PLImportSession uuid](self, "uuid");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      v5 = -[PLImportSession isDeleted](self, "isDeleted");

      if ((v5 & 1) == 0)
      {
        -[PLGenericAlbum photoLibrary](self, "photoLibrary");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "pathManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLImportSession persistMetadataToFileSystemWithPathManager:](self, "persistMetadataToFileSystemWithPathManager:", v7);

      }
    }
  }
  -[PLImportSession setNeedsPersistenceUpdate:](self, "setNeedsPersistenceUpdate:", 0);
}

- (void)prepareForDeletion
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLImportSession;
  -[PLManagedObject prepareForDeletion](&v6, sel_prepareForDeletion);
  -[PLImportSession managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v3, "mergingChanges") & 1) == 0
    && -[PLImportSession isValidForPersistence](self, "isValidForPersistence"))
  {
    -[PLGenericAlbum photoLibrary](self, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLImportSession removePersistedFileSystemDataWithPathManager:](self, "removePersistedFileSystemDataWithPathManager:", v5);

  }
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[PLImportSession assets](self, "assets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)isEmpty
{
  return -[PLImportSession count](self, "count") == 0;
}

- (BOOL)canPerformEditOperation:(unint64_t)a3
{
  return 0;
}

- (BOOL)needsPersistenceUpdate
{
  return *(&self->super.didRegisteredWithUserInterfaceContext + 1);
}

- (void)setNeedsPersistenceUpdate:(BOOL)a3
{
  *(&self->super.didRegisteredWithUserInterfaceContext + 1) = a3;
}

- (BOOL)albumShouldBeAutomaticallyDeleted
{
  return *(&self->super.didRegisteredWithUserInterfaceContext + 2);
}

- (void)setAlbumShouldBeAutomaticallyDeleted:(BOOL)a3
{
  *(&self->super.didRegisteredWithUserInterfaceContext + 2) = a3;
}

+ (id)entityName
{
  return CFSTR("ImportSession");
}

+ (id)insertNewImportSessionAlbumWithImportSessionID:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  void *v6;

  v5 = a3;
  +[PLManagedObject insertInManagedObjectContext:](PLImportSession, "insertInManagedObjectContext:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImportSessionID:", v5);

  objc_msgSend(v6, "setKindValue:", 1506);
  return v6;
}

+ (id)albumsWithImportSessionIDs:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("ImportSession"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("importSessionID"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPredicate:", v8);

    objc_msgSend(v7, "setFetchLimit:", objc_msgSend(v5, "count"));
    objc_msgSend(v7, "setReturnsObjectsAsFaults:", 0);
    if ((unint64_t)objc_msgSend(v5, "count") >= 0x65)
      objc_msgSend(v7, "setFetchBatchSize:", 100);
    v13 = 0;
    objc_msgSend(v6, "executeFetchRequest:error:", v7, &v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13;
    if (!v9)
    {
      PLBackendGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v15 = v7;
        v16 = 2112;
        v17 = v10;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch %@: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)albumWithImportSessionID:(id)a3 inManagedObjectContext:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v13 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "albumsWithImportSessionIDs:inManagedObjectContext:", v9, v7, v13, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validKindsForPersistence
{
  return &unk_1E37632D8;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4;
  PLImportSessionJournalEntryPayload *v5;

  v4 = a3;
  v5 = -[PLManagedObjectJournalEntryPayload initWithManagedObject:changedKeys:]([PLImportSessionJournalEntryPayload alloc], "initWithManagedObject:changedKeys:", self, v4);

  return v5;
}

- (BOOL)validForPersistenceChangedForChangedKeys:(id)a3
{
  return 0;
}

@end
