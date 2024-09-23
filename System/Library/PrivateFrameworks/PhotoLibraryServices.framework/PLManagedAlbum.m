@implementation PLManagedAlbum

- (BOOL)canPerformEditOperation:(unint64_t)a3
{
  int v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  _BOOL4 v11;
  _BOOL4 v12;
  uint64_t v13;

  v5 = -[PLGenericAlbum kindValue](self, "kindValue");
  if (v5 > 1499)
  {
    if ((v5 - 1600) <= 4 && ((1 << (v5 - 64)) & 0x19) != 0 || v5 == 1500)
      return a3 < 2;
    if (v5 != 1505)
      return 0;
    v11 = -[PLGenericAlbum isFamilyCloudSharedAlbum](self, "isFamilyCloudSharedAlbum");
    v12 = -[PLGenericAlbum isOwnedCloudSharedAlbum](self, "isOwnedCloudSharedAlbum");
    if (v11)
    {
      v13 = -6;
    }
    else
    {
      if (v12)
        return (a3 & 0xFFFFFFFFFFFFFFEFLL) != 0;
      v12 = -[PLGenericAlbum isMultipleContributorCloudSharedAlbum](self, "isMultipleContributorCloudSharedAlbum");
      v13 = -34;
    }
    v6 = (a3 & v13) == 0;
    v8 = (a3 & 0xFFFFFFFFFFFFFFDALL) == 0;
    v9 = !v12;
  }
  else
  {
    v6 = (a3 & 1) == 0;
    v7 = (a3 & 0xFFFFFFFFFFFFFFF6) == 0;
    if (v5 != 1000)
      v7 = 0;
    v8 = v5 == 12 || v7;
    v9 = v5 == 2;
  }
  if (v9)
    return v6;
  else
    return v8;
}

- (BOOL)canPerformDeleteOperation
{
  return -[PLManagedAlbum canPerformEditOperation:](self, "canPerformEditOperation:", 32);
}

- (BOOL)_shouldCopyAssetToCameraRollBeforeAdding:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[PLGenericAlbum kindValue](self, "kindValue") == 2)
    v5 = objc_msgSend(v4, "isPhotoStreamPhoto");
  else
    v5 = 0;

  return v5;
}

- (BOOL)supportsAssetOrderKeys
{
  int v2;

  v2 = -[PLGenericAlbum kindValue](self, "kindValue");
  return v2 == 2 || v2 == 1000;
}

- (id)childKeyForOrdering
{
  return CFSTR("assets");
}

- (NSMutableOrderedSet)mutableAssets
{
  return (NSMutableOrderedSet *)-[PLManagedAlbum mutableOrderedSetValueForKey:](self, "mutableOrderedSetValueForKey:", CFSTR("assets"));
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
  v8.super_class = (Class)PLManagedAlbum;
  -[PLManagedObject prepareForDeletion](&v8, sel_prepareForDeletion);
  -[PLManagedAlbum managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[PLDelayedSearchIndexUpdates recordAlbumIfNeeded:](PLDelayedSearchIndexUpdates, "recordAlbumIfNeeded:", self);
    if ((objc_msgSend(v3, "mergingChanges") & 1) == 0)
    {
      if (-[PLGenericAlbum kindValue](self, "kindValue") == 2 || -[PLGenericAlbum kindValue](self, "kindValue") == 1508)
        objc_msgSend(v3, "recordCloudDeletionForObject:", self);
      -[PLManagedAlbum uuid](self, "uuid");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4
        && (-[PLManagedAlbum isValidForPersistence](self, "isValidForPersistence")
         || +[PLGenericAlbum is1WaySyncKind:](PLGenericAlbum, "is1WaySyncKind:", -[PLGenericAlbum kindValue](self, "kindValue"))))
      {
        -[PLManagedAlbum managedObjectContext](self, "managedObjectContext");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "isReadOnly");

        if ((v6 & 1) != 0)
        {
LABEL_12:
          -[PLManagedAlbum _removeAssetFromUserAlbumSuggestionIfNeededWithManagedObjectContext:](self, "_removeAssetFromUserAlbumSuggestionIfNeededWithManagedObjectContext:", v3);
          goto LABEL_13;
        }
        -[PLGenericAlbum photoLibrary](self, "photoLibrary");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "pathManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLManagedAlbum removePersistedFileSystemDataWithPathManager:](self, "removePersistedFileSystemDataWithPathManager:", v7);

      }
      goto LABEL_12;
    }
  }
LABEL_13:

}

- (int64_t)cloudDeletionType
{
  return 2;
}

- (void)_removeAssetFromUserAlbumSuggestionIfNeededWithManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PLManagedAlbum objectIDsForRelationshipNamed:](self, "objectIDsForRelationshipNamed:", CFSTR("assets"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        objc_msgSend(v4, "delayedSaveActions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "recordAssetID:forWidgetUserAlbumRemoval:", v10, self);

        objc_msgSend(v4, "delayedSaveActions");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "recordAssetID:forWallpaperUserAlbumRemoval:", v10, self);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
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
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PLManagedAlbum;
  -[PLGenericAlbum willSave](&v18, sel_willSave);
  -[PLManagedAlbum setNeedsPersistenceUpdate:](self, "setNeedsPersistenceUpdate:", 0);
  -[PLManagedAlbum managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PLManagedAlbum changedValues](self, "changedValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[PLManagedAlbum isValidForPersistence](self, "isValidForPersistence"))
      goto LABEL_9;
    if ((-[PLManagedAlbum isInserted](self, "isInserted") & 1) == 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assets"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5
        || (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title")),
            (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
        || (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trashedState")),
            (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {

      }
      else
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPrototype"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
LABEL_9:
          if (PLPlatformSearchSupported())
          {
            objc_msgSend(v3, "delayedSaveActions");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "recordAlbumForSearchIndexUpdate:", self);

          }
          if ((-[PLManagedAlbum isDeleted](self, "isDeleted") & 1) != 0)
            goto LABEL_27;
          if ((-[PLManagedAlbum isInserted](self, "isInserted") & 1) != 0)
          {
            v7 = 1;
          }
          else
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assets"));
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = v8 != 0;

          }
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("customKeyAsset"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {

            if (!v7)
              goto LABEL_23;
          }
          else
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("customSortKey"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (v10)
            {

              if (!v7)
                goto LABEL_23;
            }
            else
            {
              objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("customSortAscending"));
              v11 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v7)
              {
                if (!v11)
                  goto LABEL_24;
                goto LABEL_23;
              }
            }
          }
          objc_msgSend(v3, "delayedSaveActions");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "recordAlbumForCountsAndDateRangeUpdate:", self);

LABEL_23:
          objc_msgSend(v3, "delayedSaveActions");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "recordAlbumForKeyAssetsUpdate:", self);

LABEL_24:
          +[PLDelayedSearchIndexUpdates recordAlbumIfNeeded:](PLDelayedSearchIndexUpdates, "recordAlbumIfNeeded:", self);
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trashedState"));
          v14 = objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v15 = (void *)v14;
            v16 = -[PLManagedAlbum trashedState](self, "trashedState");

            if (v16 >= 1)
              -[PLManagedAlbum _removeAssetFromUserAlbumSuggestionIfNeededWithManagedObjectContext:](self, "_removeAssetFromUserAlbumSuggestionIfNeededWithManagedObjectContext:", v3);
          }
LABEL_27:

          goto LABEL_28;
        }
      }
    }
    -[PLManagedAlbum setNeedsPersistenceUpdate:](self, "setNeedsPersistenceUpdate:", 1);
    goto LABEL_9;
  }
LABEL_28:

}

- (void)didSave
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PLManagedAlbum;
  -[PLGenericAlbum didSave](&v14, sel_didSave);
  if (-[PLManagedAlbum albumShouldBeAutomaticallyDeleted](self, "albumShouldBeAutomaticallyDeleted"))
  {
    v3 = PLIsAssetsd();
    -[PLGenericAlbum photoLibrary](self, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
    {
      objc_msgSend(v4, "libraryServicesManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "imageWriter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLManagedAlbum objectID](self, "objectID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "enqueueAutoDeleteEmptyAlbumJobWithAlbumID:", v8);

    }
    else
    {
      objc_msgSend(v4, "assetsdClient");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "libraryClient");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLManagedAlbum objectID](self, "objectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "automaticallyDeleteEmptyAlbumWithObjectID:completionHandler:", v7, &__block_literal_global_13542);
      v5 = v9;
    }

    -[PLManagedAlbum setAlbumShouldBeAutomaticallyDeleted:](self, "setAlbumShouldBeAutomaticallyDeleted:", 0);
  }
  -[PLManagedAlbum managedObjectContext](self, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLManagedAlbum needsPersistenceUpdate](self, "needsPersistenceUpdate"))
  {
    -[PLManagedAlbum uuid](self, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11
      || (-[PLManagedAlbum isDeleted](self, "isDeleted") & 1) != 0
      || !-[PLManagedAlbum isValidForPersistence](self, "isValidForPersistence"))
    {
      goto LABEL_12;
    }
    v12 = objc_msgSend((id)objc_opt_class(), "shouldHavePhotoLibrary");

    if (v12)
    {
      -[PLGenericAlbum photoLibrary](self, "photoLibrary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pathManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLManagedAlbum persistMetadataToFileSystemWithPathManager:](self, "persistMetadataToFileSystemWithPathManager:", v13);

LABEL_12:
    }
  }
  -[PLManagedAlbum setNeedsPersistenceUpdate:](self, "setNeedsPersistenceUpdate:", 0);

}

- (NSMutableOrderedSet)userEditableAssets
{
  return (NSMutableOrderedSet *)((uint64_t (*)(PLManagedAlbum *, char *, const __CFString *))objc_msgSend(MEMORY[0x1E0DE7910], "instanceMethodForSelector:", sel_mutableOrderedSetValueForKey_))(self, sel_mutableOrderedSetValueForKey_, CFSTR("internalUserEditableAssets"));
}

- (unint64_t)countOfInternalUserEditableAssets
{
  void *v2;
  unint64_t v3;

  -[PLManagedAlbum assets](self, "assets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)indexInInternalUserEditableAssetsOfObject:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[PLManagedAlbum assets](self, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (id)objectInInternalUserEditableAssetsAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[PLManagedAlbum assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)internalUserEditableAssetsAtIndexes:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PLManagedAlbum assets](self, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsAtIndexes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)insertInternalUserEditableAssets:(id)a3 atIndexes:(id)a4
{
  -[PLManagedAlbum insertInternalUserEditableAssets:atIndexes:assetsSharingInfos:customExportsInfo:trimmedVideoPathInfo:commentText:](self, "insertInternalUserEditableAssets:atIndexes:assetsSharingInfos:customExportsInfo:trimmedVideoPathInfo:commentText:", a3, a4, 0, 0, 0, 0);
}

- (void)insertInternalUserEditableAssets:(id)a3 atIndexes:(id)a4 assetsSharingInfos:(id)a5 customExportsInfo:(id)a6 trimmedVideoPathInfo:(id)a7 commentText:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *context;
  id v48;
  _QWORD v49[4];
  id v50;
  PLManagedAlbum *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[4];
  id v61;
  PLManagedAlbum *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v48 = a8;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLManagedAlbum.m"), 331, CFSTR("assets cannot be nil. Album: %@"), self);

  }
  context = (void *)MEMORY[0x19AEC1554]();
  if (-[PLGenericAlbum isCloudSharedAlbum](self, "isCloudSharedAlbum"))
  {
    -[PLGenericAlbum photoLibrary](self, "photoLibrary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __131__PLManagedAlbum_insertInternalUserEditableAssets_atIndexes_assetsSharingInfos_customExportsInfo_trimmedVideoPathInfo_commentText___block_invoke;
    v60[3] = &unk_1E3675A78;
    v61 = v15;
    v62 = self;
    v21 = v48;
    v63 = v48;
    v64 = v17;
    v65 = v18;
    v66 = v19;
    objc_msgSend(v20, "addCompletionHandlerToCurrentTransaction:", v60);

    v22 = v61;
  }
  else
  {
    v43 = v19;
    v44 = v18;
    v45 = v17;
    -[PLGenericAlbum sortingComparator](self, "sortingComparator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedAlbum mutableAssets](self, "mutableAssets");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v46 = v16;
    if (v20)
    {
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v42 = v15;
      v25 = v15;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v57;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v57 != v28)
              objc_enumerationMutation(v25);
            v30 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
            v31 = objc_msgSend(v24, "count");
            objc_msgSend(v24, "array");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "indexOfObject:inSortedRange:options:usingComparator:", v30, 0, v31, 1024, v20);

            objc_msgSend(v24, "insertObject:atIndex:", v30, v33);
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
        }
        while (v27);
      }

      v15 = v42;
    }
    else
    {
      objc_msgSend(v23, "insertObjects:atIndexes:", v15, v16);

    }
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v34 = v15;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v52, v67, 16);
    if (v35)
    {
      v36 = v35;
      v22 = 0;
      v37 = *(_QWORD *)v53;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v53 != v37)
            objc_enumerationMutation(v34);
          v39 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j);
          if (-[PLManagedAlbum _shouldCopyAssetToCameraRollBeforeAdding:](self, "_shouldCopyAssetToCameraRollBeforeAdding:", v39))
          {
            if (!v22)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v22 = (id)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v22, "addObject:", v39);
          }
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v52, v67, 16);
      }
      while (v36);
    }
    else
    {
      v22 = 0;
    }

    if (objc_msgSend(v22, "count"))
    {
      -[PLGenericAlbum photoLibrary](self, "photoLibrary");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __131__PLManagedAlbum_insertInternalUserEditableAssets_atIndexes_assetsSharingInfos_customExportsInfo_trimmedVideoPathInfo_commentText___block_invoke_2;
      v49[3] = &unk_1E3677C18;
      v22 = v22;
      v50 = v22;
      v51 = self;
      objc_msgSend(v40, "addCompletionHandlerToCurrentTransaction:", v49);

    }
    v17 = v45;
    v16 = v46;
    v19 = v43;
    v18 = v44;
    v21 = v48;
  }

  objc_autoreleasePoolPop(context);
}

- (void)removeInternalUserEditableAssetsAtIndexes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLManagedAlbum mutableAssets](self, "mutableAssets");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectsAtIndexes:", v4);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  PLManagedAlbum *v11;
  id v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  objc_super v21;

  v10 = a3;
  v11 = (PLManagedAlbum *)a4;
  v12 = a5;
  if ((void *)objc_opt_class() == a6)
  {
    if (v11 == self)
    {
      if (-[PLManagedAlbum faultingState](v11, "faultingState"))
      {
        objc_msgSend(v10, "isEqualToString:", CFSTR("assets"));
      }
      else
      {
        -[PLManagedAlbum managedObjectContext](v11, "managedObjectContext");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "hasChanges");

        v15 = objc_msgSend(v10, "isEqualToString:", CFSTR("assets"));
        if (v14)
        {
          v16 = v15;
          -[PLManagedAlbum managedObjectContext](v11, "managedObjectContext");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v18 = objc_msgSend(v17, "mergingChanges");
          else
            v18 = 0;
          if ((-[PLManagedAlbum isDeleted](v11, "isDeleted") & 1) == 0 && ((v16 ^ 1) & 1) == 0)
          {
            objc_msgSend(v12, "valueForKey:", *MEMORY[0x1E0CB2CB0]);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "unsignedIntegerValue");

            if ((v20 & 0xFFFFFFFFFFFFFFFDLL) == 1
              && !v18
              && -[PLGenericAlbum shouldDeleteWhenEmpty](v11, "shouldDeleteWhenEmpty")
              && !-[PLManagedAlbum assetsCount](v11, "assetsCount"))
            {
              -[PLManagedAlbum setAlbumShouldBeAutomaticallyDeleted:](v11, "setAlbumShouldBeAutomaticallyDeleted:", 1);
            }
          }

        }
      }
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)PLManagedAlbum;
    -[PLManagedAlbum observeValueForKeyPath:ofObject:change:context:](&v21, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (id)_keysToBeObserved
{
  _OWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = xmmword_1E36636A0;
  v3[1] = *(_OWORD *)off_1E36636B0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)registerForChanges
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!-[PLGenericAlbum isRegisteredForChanges](self, "isRegisteredForChanges"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[PLManagedAlbum _keysToBeObserved](self, "_keysToBeObserved");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          -[PLManagedAlbum addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7++), 3, objc_opt_class());
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }

    if (-[PLManagedObject isRegisteredWithUserInterfaceContext](self, "isRegisteredWithUserInterfaceContext"))
    {
      -[PLGenericAlbum setDidRegisteredWithUserInterfaceContext:](self, "setDidRegisteredWithUserInterfaceContext:", 1);
      +[PLChangeNotificationCenter defaultCenter](PLChangeNotificationCenter, "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLManagedAlbum addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", v8, CFSTR("assets"), 8, &PLChangeNotificationCenterKVOContext);

      +[PLChangeNotificationCenter defaultCenter](PLChangeNotificationCenter, "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLManagedAlbum addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", v9, CFSTR("invitationRecords"), 8, &PLChangeNotificationCenterKVOContext);

    }
  }
  v10.receiver = self;
  v10.super_class = (Class)PLManagedAlbum;
  -[PLGenericAlbum registerForChanges](&v10, sel_registerForChanges);
}

- (void)unregisterForChanges
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[PLGenericAlbum isRegisteredForChanges](self, "isRegisteredForChanges"))
  {
    if (-[PLGenericAlbum didRegisteredWithUserInterfaceContext](self, "didRegisteredWithUserInterfaceContext"))
    {
      +[PLChangeNotificationCenter defaultCenter](PLChangeNotificationCenter, "defaultCenter");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLManagedAlbum removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", v3, CFSTR("assets"), &PLChangeNotificationCenterKVOContext);

      +[PLChangeNotificationCenter defaultCenter](PLChangeNotificationCenter, "defaultCenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLManagedAlbum removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", v4, CFSTR("invitationRecords"), &PLChangeNotificationCenterKVOContext);

      -[PLGenericAlbum setDidRegisteredWithUserInterfaceContext:](self, "setDidRegisteredWithUserInterfaceContext:", 0);
    }
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[PLManagedAlbum _keysToBeObserved](self, "_keysToBeObserved");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          -[PLManagedAlbum removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), objc_opt_class());
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
  v10.receiver = self;
  v10.super_class = (Class)PLManagedAlbum;
  -[PLGenericAlbum unregisterForChanges](&v10, sel_unregisterForChanges);
}

- (unint64_t)_albumStandInCount
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  if (-[PLGenericAlbum kindValue](self, "kindValue") == 4001)
  {
    -[PLGenericAlbum photoLibrary](self, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLManagedAlbumList facesAlbumListInPhotoLibrary:](PLManagedAlbumList, "facesAlbumListInPhotoLibrary:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v5 = (void *)v4;

    v6 = objc_msgSend(v5, "albumsCount");
    return v6;
  }
  if (-[PLGenericAlbum kindValue](self, "kindValue") == 4003)
  {
    -[PLGenericAlbum photoLibrary](self, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLManagedAlbumList importListInPhotoLibrary:](PLManagedAlbumList, "importListInPhotoLibrary:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (-[PLGenericAlbum kindValue](self, "kindValue") == 4002)
  {
    -[PLGenericAlbum photoLibrary](self, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLManagedAlbumList eventListInPhotoLibrary:](PLManagedAlbumList, "eventListInPhotoLibrary:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  return 0;
}

- (unint64_t)approximateCount
{
  if (-[PLGenericAlbum isStandInAlbum](self, "isStandInAlbum"))
    return -[PLManagedAlbum _albumStandInCount](self, "_albumStandInCount");
  else
    return (int)-[PLManagedAlbum cachedCount](self, "cachedCount");
}

- (unint64_t)assetsCount
{
  void *v4;
  void *v5;
  unint64_t v6;

  if (-[PLGenericAlbum isStandInAlbum](self, "isStandInAlbum"))
    return -[PLManagedAlbum _albumStandInCount](self, "_albumStandInCount");
  v4 = (void *)MEMORY[0x19AEC1554]();
  -[PLManagedAlbum assets](self, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  objc_autoreleasePoolPop(v4);
  return v6;
}

- (BOOL)isEmpty
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  objc_super v8;

  if (-[PLGenericAlbum kindValue](self, "kindValue") == 4001)
  {
    -[PLGenericAlbum photoLibrary](self, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLManagedAlbumList facesAlbumListInPhotoLibrary:](PLManagedAlbumList, "facesAlbumListInPhotoLibrary:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (-[PLGenericAlbum kindValue](self, "kindValue") == 4003)
  {
    -[PLGenericAlbum photoLibrary](self, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLManagedAlbumList importListInPhotoLibrary:](PLManagedAlbumList, "importListInPhotoLibrary:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[PLGenericAlbum kindValue](self, "kindValue") != 4002)
    {
      v8.receiver = self;
      v8.super_class = (Class)PLManagedAlbum;
      return -[PLGenericAlbum isEmpty](&v8, sel_isEmpty);
    }
    -[PLGenericAlbum photoLibrary](self, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLManagedAlbumList eventListInPhotoLibrary:](PLManagedAlbumList, "eventListInPhotoLibrary:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  v6 = objc_msgSend(v5, "isEmpty");
  return v6;
}

- (unint64_t)photosCount
{
  return (int)-[PLManagedAlbum cachedPhotosCount](self, "cachedPhotosCount");
}

- (unint64_t)videosCount
{
  return (int)-[PLManagedAlbum cachedVideosCount](self, "cachedVideosCount");
}

- (void)insertAssets:(id)a3 atIndexes:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[PLManagedAlbum willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 2, v8, CFSTR("assets"));
  -[PLManagedAlbum primitiveAssets](self, "primitiveAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertObjects:atIndexes:", v6, v8);

  -[PLManagedAlbum didChange:valuesAtIndexes:forKey:](self, "didChange:valuesAtIndexes:forKey:", 2, v8, CFSTR("assets"));
}

- (void)removeAssetsAtIndexes:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PLManagedAlbum willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 3, v5, CFSTR("assets"));
  -[PLManagedAlbum primitiveAssets](self, "primitiveAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectsAtIndexes:", v5);

  -[PLManagedAlbum didChange:valuesAtIndexes:forKey:](self, "didChange:valuesAtIndexes:forKey:", 3, v5, CFSTR("assets"));
}

- (void)replaceAssetsAtIndexes:(id)a3 withAssets:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = a3;
  -[PLManagedAlbum willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 3, v8, CFSTR("assets"));
  -[PLManagedAlbum primitiveAssets](self, "primitiveAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "replaceObjectsAtIndexes:withObjects:", v8, v6);

  -[PLManagedAlbum didChange:valuesAtIndexes:forKey:](self, "didChange:valuesAtIndexes:forKey:", 3, v8, CFSTR("assets"));
}

- (BOOL)isValidForPersistence
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend((id)objc_opt_class(), "validKindsForPersistence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedAlbum kind](self, "kind");
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLManagedAlbum.m"), 635, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLManagedAlbum.m"), 643, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

    v5 = 0;
  }
  if (objc_msgSend(v5, "isDCIM"))
  {
    v6 = -[PLPersistedAlbumMetadata initWithPLGenericAlbum:pathManager:]([PLPersistedAlbumMetadata alloc], "initWithPLGenericAlbum:pathManager:", self, v8);
    -[PLPersistedAlbumMetadata removePersistedAlbumData](v6, "removePersistedAlbumData");

  }
}

- (id)assetOrderByAbumUUIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)_assetOrderByAbumUUIDs;
  if (!_assetOrderByAbumUUIDs)
  {
    v4 = (void *)MEMORY[0x1E0C99D80];
    -[PLGenericAlbum photoLibrary](self, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathToAssetAlbumOrderStructure");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithContentsOfFile:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)_assetOrderByAbumUUIDs;
    _assetOrderByAbumUUIDs = v8;

    v3 = (void *)_assetOrderByAbumUUIDs;
    if (!_assetOrderByAbumUUIDs)
    {
      -[PLGenericAlbum photoLibrary](self, "photoLibrary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pathManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pathToAssetAlbumOrderStructure");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("ERROR: did not load assetOrderByAbumUUIDs from %@"), v12);

      v3 = (void *)_assetOrderByAbumUUIDs;
    }
  }
  return v3;
}

- (id)_orderComparisonValueForAsset:(id)a3 iTunesLookupOrder:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "uuid");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5 && v7)
  {
    objc_msgSend(v6, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(v6, "dateCreated");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)_assetOrderByAssetUUID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PLManagedAlbum uuid](self, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PLManagedAlbum assetOrderByAbumUUIDs](self, "assetOrderByAbumUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[PLManagedAlbum title](self, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("WARNING: did not find albumAssetOrderByAssetUUID for album %@:%@"), v6, v3);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)sortAssetsUsingiTunesAlbumOrder
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, void *);
  void *v10;
  PLManagedAlbum *v11;
  id v12;

  -[PLManagedAlbum mutableAssets](self, "mutableAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedAlbum _assetOrderByAssetUUID](self, "_assetOrderByAssetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __49__PLManagedAlbum_sortAssetsUsingiTunesAlbumOrder__block_invoke;
  v10 = &unk_1E36636E8;
  v11 = self;
  v12 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x19AEC174C](&v7);
  if ((objc_msgSend(v3, "pl_isSortedUsingComparator:", v6, v7, v8, v9, v10, v11) & 1) == 0)
    objc_msgSend(v3, "sortUsingComparator:", v6);

}

- (void)addAssetUsingiTunesAlbumOrder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v4 = a3;
  if (!v4)
    goto LABEL_24;
  v23 = v4;
  -[PLManagedAlbum _assetOrderByAssetUUID](self, "_assetOrderByAssetUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedAlbum mutableAssets](self, "mutableAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedAlbum _orderComparisonValueForAsset:iTunesLookupOrder:](self, "_orderComparisonValueForAsset:iTunesLookupOrder:", v23, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "count");
  if (!v8 || !v7)
  {
    objc_msgSend(v6, "addObject:", v23);
    goto LABEL_23;
  }
  v9 = v8;
  v10 = v8 - 1;
  objc_msgSend(v6, "objectAtIndex:", v8 - 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedAlbum _orderComparisonValueForAsset:iTunesLookupOrder:](self, "_orderComparisonValueForAsset:iTunesLookupOrder:", v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "compare:", v7) == -1)
    goto LABEL_20;
  if ((v10 & 0x8000000000000000) != 0)
  {
    v18 = -(uint64_t)((unint64_t)(1 - v9) >> 1);
    goto LABEL_19;
  }
  v21 = v12;
  v22 = v11;
  v13 = 0;
  v14 = 0;
  v15 = v10;
  while (1)
  {
    v16 = v14;
    v17 = v15 - v13;
    if (v15 < v13)
      ++v17;
    v18 = v13 + (v17 >> 1);
    objc_msgSend(v6, "objectAtIndex:", v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLManagedAlbum _orderComparisonValueForAsset:iTunesLookupOrder:](self, "_orderComparisonValueForAsset:iTunesLookupOrder:", v14, v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "compare:", v7);
    if (v20 == -1)
    {
      v13 = ++v18;
      goto LABEL_13;
    }
    if (v20 != 1)
      break;
    v15 = v18 - 1;
LABEL_13:

    if (v13 > v15)
      goto LABEL_18;
  }

LABEL_18:
  v12 = v21;
  v11 = v22;
LABEL_19:
  if ((v18 & (unint64_t)~(v18 >> 63)) <= v10)
    objc_msgSend(v6, "insertObject:atIndex:", v23);
  else
LABEL_20:
    objc_msgSend(v6, "addObject:", v23);

LABEL_23:
  v4 = v23;
LABEL_24:

}

- (id)filteredIndexesForPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLManagedAlbum managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3880];
  -[PLManagedAlbum objectID](self, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("albums contains %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v11, v4, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setPredicate:", v14);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("albums"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDescriptors:", v16);

  objc_msgSend(v8, "setResultType:", 1);
  objc_msgSend(v8, "setIncludesPropertyValues:", 0);
  v22 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v8, &v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v22;
  if (v17)
  {
    -[PLManagedAlbum assets](self, "assets");
    v19 = objc_claimAutoreleasedReturnValue();
    indexSetForManagedObjectsMatchingIDs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLBackendGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v18;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Failed to get assets in album: %@", buf, 0xCu);
    }
    v20 = 0;
  }

  return v20;
}

- (BOOL)albumShouldBeAutomaticallyDeleted
{
  return *(&self->super.didRegisteredWithUserInterfaceContext + 1);
}

- (void)setAlbumShouldBeAutomaticallyDeleted:(BOOL)a3
{
  *(&self->super.didRegisteredWithUserInterfaceContext + 1) = a3;
}

- (BOOL)needsPersistenceUpdate
{
  return *(&self->super.didRegisteredWithUserInterfaceContext + 2);
}

- (void)setNeedsPersistenceUpdate:(BOOL)a3
{
  *(&self->super.didRegisteredWithUserInterfaceContext + 2) = a3;
}

uint64_t __49__PLManagedAlbum_sortAssetsUsingiTunesAlbumOrder__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a3;
  objc_msgSend(v5, "_orderComparisonValueForAsset:iTunesLookupOrder:", a2, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_orderComparisonValueForAsset:iTunesLookupOrder:", v7, *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v8, "compare:", v9);
  return v10;
}

void __131__PLManagedAlbum_insertInternalUserEditableAssets_atIndexes_assetsSharingInfos_customExportsInfo_trimmedVideoPathInfo_commentText___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", CFSTR("uuid"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "publishBatchOfOriginalAssetUUIDs:withBatchCommentText:assetsSharingInfos:customExportsInfo:andTrimmedVideoPathInfo:isNewAlbum:", v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), 0);

}

uint64_t __131__PLManagedAlbum_insertInternalUserEditableAssets_atIndexes_assetsSharingInfos_customExportsInfo_trimmedVideoPathInfo_commentText___block_invoke_2(uint64_t a1)
{
  return +[PLReplaceAssetsWithCameraRollCopiesJob replaceAssets:withCameraRollCopiesInAlbum:](PLReplaceAssetsWithCameraRollCopiesJob, "replaceAssets:withCameraRollCopiesInAlbum:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __25__PLManagedAlbum_didSave__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Failed to request assetsd to automatically delete empty album: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

+ (id)entityName
{
  return CFSTR("Album");
}

+ (id)albumSupportsAssetOrderKeysPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind == %d || kind == %d"), 2, 1000);
}

+ (id)childKeyForOrdering
{
  return CFSTR("assets");
}

+ (int64_t)cloudDeletionTypeForTombstone:(id)a3
{
  return 2;
}

+ (NSString)cloudUUIDKeyForDeletion
{
  return (NSString *)CFSTR("cloudGUID");
}

+ (id)keyPathsForValuesAffectingApproximateCount
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("cachedCount"));
}

+ (id)keyPathsForValuesAffectingPhotosCount
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("cachedPhotosCount"));
}

+ (id)keyPathsForValuesAffectingVideosCount
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("cachedVideosCount"));
}

+ (id)validKindsForPersistence
{
  pl_dispatch_once();
  return (id)validKindsForPersistence_pl_once_object_16;
}

+ (void)clearAssetOrderByAbumUUIDs
{
  void *v2;

  v2 = (void *)_assetOrderByAbumUUIDs;
  _assetOrderByAbumUUIDs = 0;

}

void __42__PLManagedAlbum_validKindsForPersistence__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&unk_1E3763380, "copy");
  v1 = (void *)validKindsForPersistence_pl_once_object_16;
  validKindsForPersistence_pl_once_object_16 = v0;

}

- (id)descriptionOfAssetOrderValues
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
  -[PLManagedAlbum managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x19AEC1554]();
  -[PLManagedAlbum objectID](self, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_orderKeysForRelationshipWithName__:onObjectWithID:", CFSTR("assets"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") == 2)
  {
    v24 = v5;
    v25 = v3;
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLManagedAlbum objectID](self, "objectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URIRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("ALBUM %@ [%d]\n"), v11, objc_msgSend(v12, "count"));

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
    -[PLManagedAlbum objectID](self, "objectID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "URIRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("ALBUM %@ [0 assets]\n"), v22);

  }
  objc_autoreleasePoolPop(v5);

  return v4;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4;
  PLAlbumJournalEntryPayload *v5;

  v4 = a3;
  if (-[PLManagedAlbum isValidForPersistence](self, "isValidForPersistence"))
    v5 = -[PLManagedObjectJournalEntryPayload initWithManagedObject:changedKeys:]([PLAlbumJournalEntryPayload alloc], "initWithManagedObject:changedKeys:", self, v4);
  else
    v5 = 0;

  return v5;
}

@end
