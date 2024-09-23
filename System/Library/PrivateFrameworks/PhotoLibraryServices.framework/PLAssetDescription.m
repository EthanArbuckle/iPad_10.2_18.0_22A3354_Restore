@implementation PLAssetDescription

- (id)duplicateSortPropertyNames
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("longDescription");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)duplicateSortPropertyNamesSkip
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)payloadID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PLAssetDescription assetAttributes](self, "assetAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PLAssetJournalEntryPayload *v7;

  v4 = a3;
  -[PLAssetDescription assetAttributes](self, "assetAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isValidForJournalPersistence"))
    v7 = -[PLAssetJournalEntryPayload initWithAssetDescription:changedKeys:]([PLAssetJournalEntryPayload alloc], "initWithAssetDescription:changedKeys:", self, v4);
  else
    v7 = 0;

  return v7;
}

- (BOOL)isSyncableChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PLAssetDescription assetAttributes](self, "assetAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "savedAssetTypeIsSupportedForUpload"))
  {
    -[PLAssetDescription changedValues](self, "changedValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    +[PLAssetDescription listOfSyncedProperties](PLAssetDescription, "listOfSyncedProperties", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(v5, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            LOBYTE(v7) = 1;
            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)prepareForDeletion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLAssetDescription;
  -[PLManagedObject prepareForDeletion](&v7, sel_prepareForDeletion);
  -[PLAssetDescription managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[PLDelayedSearchIndexUpdates recordAssetDescriptionIfNeeded:](PLDelayedSearchIndexUpdates, "recordAssetDescriptionIfNeeded:", self);
    -[PLAssetDescription assetAttributes](self, "assetAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v5, "isDeleted") & 1) == 0 && objc_msgSend(v5, "isValidTypeForPersistence"))
    {
      objc_msgSend(v5, "persistedFileSystemAttributesFileURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        objc_msgSend(MEMORY[0x1E0D73200], "persistString:forKey:fileURL:", 0, *MEMORY[0x1E0D73F18], v6);

    }
  }

}

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PLAssetDescription;
  -[PLManagedObject willSave](&v17, sel_willSave);
  -[PLAssetDescription managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_22;
  -[PLAssetDescription assetAttributes](self, "assetAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isDeleted") & 1) == 0 && (-[PLAssetDescription isDeleted](self, "isDeleted") & 1) == 0)
  {
    -[PLAssetDescription changedValues](self, "changedValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PLAssetDescription isSyncableChange](self, "isSyncableChange");
    objc_msgSend(v5, "changedValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("modificationDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9 && v7)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setModificationDate:", v10);

    }
    if (!objc_msgSend(v5, "isValidTypeForPersistence"))
      goto LABEL_14;
    objc_msgSend(v5, "persistedFileSystemAttributesFileURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("longDescription"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {

LABEL_12:
        v13 = (void *)MEMORY[0x1E0D73200];
        -[PLAssetDescription longDescription](self, "longDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "persistString:forKey:fileURL:", v14, *MEMORY[0x1E0D73F18], v11);

        goto LABEL_13;
      }
      if ((-[PLAssetDescription isInserted](self, "isInserted") & 1) != 0)
        goto LABEL_12;
    }
LABEL_13:

LABEL_14:
    if (+[PLDuplicateAsset isDuplicateAssetSortChangedObject:](PLDuplicateAsset, "isDuplicateAssetSortChangedObject:", self))
    {
      objc_msgSend(v5, "duplicateAlbum");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sortAssets");

    }
  }
  if (PLPlatformSearchSupported())
  {
    objc_msgSend(v3, "delayedSaveActions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "recordAssetDescriptionForSearchIndexUpdate:", self);

  }
  if ((-[PLAssetDescription isDeleted](self, "isDeleted") & 1) == 0)
    +[PLDelayedSearchIndexUpdates recordAssetDescriptionIfNeeded:](PLDelayedSearchIndexUpdates, "recordAssetDescriptionIfNeeded:", self);

LABEL_22:
}

+ (id)entityName
{
  return CFSTR("AssetDescription");
}

+ (id)listOfSyncedProperties
{
  pl_dispatch_once();
  return (id)listOfSyncedProperties_result_95877;
}

void __44__PLAssetDescription_listOfSyncedProperties__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("longDescription");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)listOfSyncedProperties_result_95877;
  listOfSyncedProperties_result_95877 = v0;

}

@end
