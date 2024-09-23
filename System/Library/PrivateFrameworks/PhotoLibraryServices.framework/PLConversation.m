@implementation PLConversation

- (id)mutableAssets
{
  return (id)-[PLConversation mutableSetValueForKey:](self, "mutableSetValueForKey:", CFSTR("assets"));
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
  -[PLConversation startDate](self, "startDate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        -[PLConversation startDate](self, "startDate"),
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
      -[PLConversation importSessionID](self, "importSessionID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v4;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "setStartDate: %@ for %@", (uint8_t *)&v12, 0x16u);

    }
    -[PLConversation setStartDate:](self, "setStartDate:", v4);
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
  -[PLConversation endDate](self, "endDate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        -[PLConversation endDate](self, "endDate"),
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
      -[PLConversation importSessionID](self, "importSessionID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v4;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "setEndDate: %@ for %@", (uint8_t *)&v12, 0x16u);

    }
    -[PLConversation setEndDate:](self, "setEndDate:", v4);
  }

}

- (void)updateConversationDatesFromAddedAsset:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "addedDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[PLConversation _isAssetIncludedInConversationDates:](self, "_isAssetIncludedInConversationDates:", v4);

  if (v5)
  {
    if (-[PLConversation _isDateBeforeStartDate:](self, "_isDateBeforeStartDate:", v6))
      -[PLConversation _updateStartDate:](self, "_updateStartDate:", v6);
    if (-[PLConversation _isDateAfterEndDate:](self, "_isDateAfterEndDate:", v6))
      -[PLConversation _updateEndDate:](self, "_updateEndDate:", v6);
  }

}

- (BOOL)_isAssetIncludedInConversationDates:(id)a3
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
  -[PLConversation startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PLConversation startDate](self, "startDate");
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
  -[PLConversation endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PLConversation endDate](self, "endDate");
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
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("conversation"), self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v8);

  -[PLConversation managedObjectContext](self, "managedObjectContext");
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
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "Batch fetched %lu assets from conversation %@", buf, 0x16u);

  }
  return v10;
}

- (void)_updateAssetSyndicationState:(unsigned __int16)a3
{
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  unsigned __int16 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[PLConversation assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "syndicationState");
        if (v3 == 1)
        {
          v11 = v10 & 0xFFFB;
        }
        else if (v3)
        {
          v11 = 0;
        }
        else
        {
          v11 = v10 | 4;
        }
        if (v10 != v11)
          objc_msgSend(v9, "setSyndicationState:", v11);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLConversation;
  -[PLGenericAlbum willSave](&v6, sel_willSave);
  -[PLConversation managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PLConversation changedValues](self, "changedValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("syndicate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[PLConversation _updateAssetSyndicationState:](self, "_updateAssetSyndicationState:", -[PLConversation syndicate](self, "syndicate"));

  }
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[PLConversation assets](self, "assets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)isEmpty
{
  return -[PLConversation count](self, "count") == 0;
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
  return CFSTR("Conversation");
}

+ (id)insertNewConversationAlbumWithConversationID:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  void *v6;

  v5 = a3;
  +[PLManagedObject insertInManagedObjectContext:](PLConversation, "insertInManagedObjectContext:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImportSessionID:", v5);

  objc_msgSend(v6, "setKindValue:", 1509);
  return v6;
}

+ (id)albumsWithConversationIDs:(id)a3 inLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v7 = (void *)MEMORY[0x19AEC1554]();
    objc_msgSend(v6, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0C97B48];
    +[PLConversation entityName](PLConversation, "entityName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchRequestWithEntityName:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("importSessionID"), v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPredicate:", v12);

    objc_msgSend(v11, "setFetchLimit:", objc_msgSend(v5, "count"));
    objc_msgSend(v11, "setReturnsObjectsAsFaults:", 0);
    if ((unint64_t)objc_msgSend(v5, "count") >= 0x65)
      objc_msgSend(v11, "setFetchBatchSize:", 100);
    v17 = 0;
    objc_msgSend(v8, "executeFetchRequest:error:", v11, &v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v17;
    if (!v13)
    {
      PLBackendGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v19 = v11;
        v20 = 2112;
        v21 = v14;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Failed to fetch %@: %@", buf, 0x16u);
      }

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)albumWithConversationID:(id)a3 inLibrary:(id)a4
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

  objc_msgSend(a1, "albumsWithConversationIDs:inLibrary:", v9, v7, v13, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)createOrUpdateObjectFromSearchableItem:(id)a3 library:(id)a4 fullIndexSyncStartDate:(id)a5 createIfNeeded:(BOOL)a6 didCreate:(BOOL *)a7 isSyndicatable:(BOOL *)a8 error:(id *)a9
{
  _BOOL4 v11;
  id v13;
  id v14;
  uint64_t IsChatAutoDonating;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v11 = a6;
  v28 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  IsChatAutoDonating = PLSearchableItemMessagesIsChatAutoDonating(v13);
  PLSyndicationGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v13, "uniqueIdentifier");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    v19 = CFSTR("not ");
    if ((_DWORD)IsChatAutoDonating)
      v19 = &stru_1E36789C0;
    *(_DWORD *)buf = 138412546;
    v25 = v17;
    v26 = 2114;
    v27 = v19;
    _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "[sync] considering spotlight item with ID: %@ (%{public}@autoDonating) for syndication conversation", buf, 0x16u);

  }
  objc_msgSend(v13, "uniqueIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "managedObjectContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLConversation albumWithConversationID:inLibrary:](PLConversation, "albumWithConversationID:inLibrary:", v20, v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    v11 = 0;
  if (v11)
  {
    +[PLConversation insertNewConversationAlbumWithConversationID:inManagedObjectContext:](PLConversation, "insertNewConversationAlbumWithConversationID:inManagedObjectContext:", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v22)
    objc_msgSend(v22, "setSyndicate:", IsChatAutoDonating);
  if (a7)
    *a7 = v11;
  if (a8)
    *a8 = 1;
  if (a9)
    *a9 = 0;

  return v22;
}

@end
