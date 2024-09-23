@implementation PLSuggestion

- (id)mutableKeyAssets
{
  return (id)-[PLSuggestion mutableSetValueForKey:](self, "mutableSetValueForKey:", CFSTR("keyAssets"));
}

- (id)mutableRepresentativeAssets
{
  return (id)-[PLSuggestion mutableSetValueForKey:](self, "mutableSetValueForKey:", CFSTR("representativeAssets"));
}

- (void)prepareForDeletion
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLSuggestion;
  -[PLManagedObject prepareForDeletion](&v4, sel_prepareForDeletion);
  -[PLSuggestion managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "mergingChanges") & 1) == 0)
    objc_msgSend(v3, "recordCloudDeletionForObject:", self);

}

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)PLSuggestion;
  -[PLManagedObject willSave](&v30, sel_willSave);
  -[PLSuggestion managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((-[PLSuggestion isDeleted](self, "isDeleted") & 1) == 0)
    {
      -[PLSuggestion keyAssets](self, "keyAssets");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "count"))
      {

      }
      else
      {
        -[PLSuggestion representativeAssets](self, "representativeAssets");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "count");

        if (!v6)
        {
          PLBackendGetLog();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            -[PLSuggestion uuid](self, "uuid");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v32 = v8;
            _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Deleting suggestion because it has no assets %{public}@", buf, 0xCu);

          }
          if (-[PLSuggestion featuredState](self, "featuredState") == 1)
          {
            if (-[PLSuggestion type](self, "type") == 6)
            {
              PLBackendGetLog();
              v9 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
              {
                -[PLSuggestion uuid](self, "uuid");
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v32 = v10;
                _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_INFO, "Recording wallpaper suggestion reload due to wallpaper suggestion with no assets being deleted %{public}@", buf, 0xCu);

              }
              objc_msgSend(v3, "delayedSaveActions");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLSuggestion uuid](self, "uuid");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "recordWallpaperSuggestionReloadForUUID:", v12);

            }
            else
            {
              v13 = -[PLSuggestion type](self, "type");
              PLBackendGetLog();
              v14 = objc_claimAutoreleasedReturnValue();
              v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
              if (v13 == 7)
              {
                if (v15)
                {
                  -[PLSuggestion uuid](self, "uuid");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v32 = v16;
                  _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_INFO, "Recording Album widget timeline invalidation due to featured suggestion with no assets being deleted %{public}@", buf, 0xCu);

                }
                objc_msgSend(v3, "delayedSaveActions");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v11 = v17;
                v18 = 1;
              }
              else
              {
                if (v15)
                {
                  -[PLSuggestion uuid](self, "uuid");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v32 = v19;
                  _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_INFO, "Recording ForYou widget timeline invalidation due to featured suggestion with no assets being deleted %{public}@", buf, 0xCu);

                }
                objc_msgSend(v3, "delayedSaveActions");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v11 = v17;
                v18 = 0;
              }
              objc_msgSend(v17, "recordWidgetTimelineReloadNeededForType:", v18);
            }

          }
          -[PLSuggestion delete](self, "delete");
        }
      }
    }
    if ((-[PLSuggestion isDeleted](self, "isDeleted") & 1) == 0
      && -[PLSuggestion state](self, "state") == 4
      && -[PLSuggestion featuredState](self, "featuredState") == 1)
    {
      PLBackendGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        -[PLSuggestion uuid](self, "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v32 = v21;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Setting suggestion to not featured as suggestion state has been set to denied %{public}@", buf, 0xCu);

      }
      -[PLSuggestion setFeaturedState:](self, "setFeaturedState:", 0);
      v22 = -[PLSuggestion type](self, "type");
      PLBackendGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      if (v22 == 7)
      {
        if (v24)
        {
          -[PLSuggestion uuid](self, "uuid");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v32 = v25;
          _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEFAULT, "Recording Album widget timeline invalidation due to featured suggestion being denied %{public}@", buf, 0xCu);

        }
        objc_msgSend(v3, "delayedSaveActions");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        v28 = 1;
      }
      else
      {
        if (v24)
        {
          -[PLSuggestion uuid](self, "uuid");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v32 = v29;
          _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEFAULT, "Recording ForYou widget timeline invalidation due to featured suggestion being denied %{public}@", buf, 0xCu);

        }
        objc_msgSend(v3, "delayedSaveActions");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        v28 = 0;
      }
      objc_msgSend(v26, "recordWidgetTimelineReloadNeededForType:", v28);

    }
    -[PLSuggestion _recalculateSharingCompositionIfNeeded](self, "_recalculateSharingCompositionIfNeeded");
  }

}

- (void)delete
{
  id v3;

  -[PLSuggestion managedObjectContext](self, "managedObjectContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteObject:", self);

}

- (BOOL)isPending
{
  return -[PLSuggestion state](self, "state") == 0;
}

- (void)updateStartAndEndDate
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[PLSuggestion keyAssets](self, "keyAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v9), "dateCreated");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v3, "compare:", v10) == 1)
        {
          v11 = v10;

          v3 = v11;
        }
        if (objc_msgSend(v4, "compare:", v10) == -1)
        {
          v12 = v10;

          v4 = v12;
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v7);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[PLSuggestion representativeAssets](self, "representativeAssets", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v17), "dateCreated");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v3, "compare:", v18) == 1)
        {
          v19 = v18;

          v3 = v19;
        }
        if (objc_msgSend(v4, "compare:", v18) == -1)
        {
          v20 = v18;

          v4 = v20;
        }

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v15);
  }

  -[PLSuggestion setStartDate:](self, "setStartDate:", v3);
  -[PLSuggestion setEndDate:](self, "setEndDate:", v4);

}

- (void)updateCachedCounts:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSuggestion objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSuggestion predicateForAllAssetsInSuggestion:managedObjectContext:](PLSuggestion, "predicateForAllAssetsInSuggestion:managedObjectContext:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPredicate:", v6);
  v32 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v9, &v32);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v32;
  v12 = v11;
  if (v10)
  {
    v22 = v11;
    v23 = v10;
    v24 = v9;
    v25 = v6;
    v26 = v4;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = v10;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0D73310], "maskForGuestAsset", v22, v23, v24, v25, v26);
          objc_msgSend(v20, "savedAssetType");
          if (!PLValidatedSavedAssetTypeApplies()
            || objc_msgSend((id)objc_opt_class(), "_suggestionSubtypeAllowedToContainSyndicatedAssets:", -[PLSuggestion subtype](self, "subtype")))
          {
            if (objc_msgSend(v20, "isPhoto"))
              v15 = (v15 + 1);
            else
              v16 = v16 + objc_msgSend(v20, "isVideo");
            v17 = (v17 + 1);
          }
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      }
      while (v14);
    }
    else
    {
      v15 = 0;
      v16 = 0;
      v17 = 0;
    }

    -[PLSuggestion setCachedCount:](self, "setCachedCount:", v17);
    -[PLSuggestion setCachedPhotosCount:](self, "setCachedPhotosCount:", v15);
    -[PLSuggestion setCachedVideosCount:](self, "setCachedVideosCount:", v16);
    -[PLSuggestion setSharingComposition:](self, "setSharingComposition:", 0);
    v6 = v25;
    v4 = v26;
    v10 = v23;
    v9 = v24;
    v12 = v22;
  }
  else
  {
    PLBackendGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v34 = v6;
      v35 = 2112;
      v36 = v12;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Failed to update suggestion cache count. All assets predicate: %@ error: %@", buf, 0x16u);
    }

  }
}

- (void)replaceKeyAsset:(id)a3
{
  PLSuggestion *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  PLSuggestion *v23;
  __int16 v24;
  PLSuggestion *v25;
  __int16 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (PLSuggestion *)a3;
  -[PLSuggestion managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PLSuggestion keyAssets](self, "keyAssets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 == 1)
    {
      -[PLSuggestion mutableRepresentativeAssets](self, "mutableRepresentativeAssets");
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v19;
LABEL_5:
        v12 = 0;
        while (1)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
          if (!objc_msgSend(v13, "isEqual:", v4))
            break;
          if (v10 == ++v12)
          {
            v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
            if (v10)
              goto LABEL_5;
            goto LABEL_11;
          }
        }
        v15 = v13;

        if (!v15)
          goto LABEL_18;
        v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v15, 0);
        -[PLSuggestion setKeyAssets:](self, "setKeyAssets:", v16);
        PLBackendGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v23 = self;
          v24 = 2112;
          v25 = v4;
          v26 = 2112;
          v27 = v15;
          _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Updating keyAsset for suggestion %@ from %@ to %@", buf, 0x20u);
        }

      }
      else
      {
LABEL_11:

LABEL_18:
        v15 = objc_alloc_init(MEMORY[0x1E0C99E60]);
        -[PLSuggestion setKeyAssets:](self, "setKeyAssets:", v15);
        -[PLSuggestion setRepresentativeAssets:](self, "setRepresentativeAssets:", v15);
        PLBackendGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v23 = v4;
          v24 = 2112;
          v25 = self;
          _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "Removed last keyAsset %@ from suggestion %@", buf, 0x16u);
        }
      }

    }
    else
    {
      -[PLSuggestion mutableKeyAssets](self, "mutableKeyAssets");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObject:", v4);

      PLBackendGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v4;
        v24 = 2112;
        v25 = self;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Removed keyAsset %@ from suggestion %@", buf, 0x16u);
      }
    }

  }
}

- (void)removeRepresentativeAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  PLSuggestion *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLSuggestion managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PLSuggestion mutableRepresentativeAssets](self, "mutableRepresentativeAssets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v4);

    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412546;
      v9 = v4;
      v10 = 2112;
      v11 = self;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Removed representativeAsset %@ from suggestion %@", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (BOOL)isEmpty
{
  void *v3;
  BOOL v4;
  void *v5;

  -[PLSuggestion keyAssets](self, "keyAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[PLSuggestion representativeAssets](self, "representativeAssets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") == 0;

  }
  return v4;
}

- (BOOL)supportsCloudUpload
{
  void *v3;

  objc_msgSend((id)objc_opt_class(), "_syncablePredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "evaluateWithObject:", self);

  return (char)self;
}

- (BOOL)isSyncableChange
{
  return 1;
}

- (BOOL)updateWithCPLSuggestionChange:(id)a3 inPhotoLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
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
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  PLSuggestion *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PLSuggestion setType:](self, "setType:", objc_msgSend(v6, "type"));
  -[PLSuggestion setSubtype:](self, "setSubtype:", objc_msgSend(v6, "subtype"));
  objc_msgSend(v6, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSuggestion setTitle:](self, "setTitle:", v8);

  objc_msgSend(v6, "subtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSuggestion setSubtitle:](self, "setSubtitle:", v9);

  -[PLSuggestion setState:](self, "setState:", objc_msgSend(v6, "state"));
  -[PLSuggestion setVersion:](self, "setVersion:", (__int16)objc_msgSend(v6, "version"));
  -[PLSuggestion setNotificationState:](self, "setNotificationState:", objc_msgSend(v6, "notificationState"));
  objc_msgSend(v6, "creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSuggestion setCreationDate:](self, "setCreationDate:", v10);

  objc_msgSend(v6, "activationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSuggestion setActivationDate:](self, "setActivationDate:", v11);

  objc_msgSend(v6, "relevantUntilDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSuggestion setRelevantUntilDate:](self, "setRelevantUntilDate:", v12);

  objc_msgSend(v6, "expungeDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSuggestion setExpungeDate:](self, "setExpungeDate:", v13);

  objc_msgSend(v6, "actionData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSuggestion setActionData:](self, "setActionData:", v14);

  objc_msgSend(v6, "featuresData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = self;
  -[PLSuggestion setFeaturesData:](self, "setFeaturesData:", v15);

  v35 = v6;
  objc_msgSend(v6, "recordList");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "assets");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");
  objc_msgSend(v16, "valueForKey:", CFSTR("assetIdentifier"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v7;
  +[PLManagedAsset assetsByCloudAssetUUID:inLibrary:](PLManagedAsset, "assetsByCloudAssetUUID:inLibrary:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", v17);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v20 = v16;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v38;
    v24 = 1;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v38 != v23)
          objc_enumerationMutation(v20);
        v26 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v26, "assetFlag");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "assetIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          objc_msgSend(v18, "objectForKey:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            if (objc_msgSend(v27, "isKeyAsset"))
              objc_msgSend(v19, "addObject:", v29);
            if (objc_msgSend(v27, "isRepresentative"))
              objc_msgSend(v36, "addObject:", v29);
          }
          else
          {
            v24 = 0;
          }

        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v22);
  }
  else
  {
    v24 = 1;
  }

  -[PLSuggestion setKeyAssets:](v33, "setKeyAssets:", v19);
  -[PLSuggestion setRepresentativeAssets:](v33, "setRepresentativeAssets:", v36);
  -[PLSuggestion updateStartAndEndDate](v33, "updateStartAndEndDate");
  -[PLSuggestion updateCachedCounts:](v33, "updateCachedCounts:", v34);
  -[PLSuggestion setCloudLocalState:](v33, "setCloudLocalState:", 1);

  return v24 & 1;
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
  -[PLSuggestion scopeIdentifier](self, "scopeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSuggestion uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithScopeIdentifier:identifier:", v4, v5);

  return v6;
}

- (id)cplSuggestionChange
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
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[PLSuggestion scopedIdentifier](self, "scopedIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D114B0], "newChangeWithScopedIdentifier:changeType:");
  objc_msgSend(v3, "setType:", -[PLSuggestion type](self, "type"));
  objc_msgSend(v3, "setSubtype:", -[PLSuggestion subtype](self, "subtype"));
  -[PLSuggestion title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  -[PLSuggestion subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSubtitle:", v5);

  objc_msgSend(v3, "setState:", -[PLSuggestion state](self, "state"));
  objc_msgSend(v3, "setVersion:", (int)-[PLSuggestion version](self, "version"));
  objc_msgSend(v3, "setNotificationState:", -[PLSuggestion notificationState](self, "notificationState"));
  -[PLSuggestion creationDate](self, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCreationDate:", v6);

  -[PLSuggestion activationDate](self, "activationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActivationDate:", v7);

  -[PLSuggestion relevantUntilDate](self, "relevantUntilDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRelevantUntilDate:", v8);

  -[PLSuggestion expungeDate](self, "expungeDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExpungeDate:", v9);

  -[PLSuggestion actionData](self, "actionData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActionData:", v10);

  -[PLSuggestion featuresData](self, "featuresData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v3;
  objc_msgSend(v3, "setFeaturesData:", v11);

  v12 = objc_alloc_init(MEMORY[0x1E0D114C8]);
  -[PLSuggestion representativeAssets](self, "representativeAssets");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSuggestion keyAssets](self, "keyAssets");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "unionSet:", v14);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v15;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v32;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v32 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v19);
        v21 = objc_alloc_init(MEMORY[0x1E0D114A8]);
        objc_msgSend(v21, "setIsKeyAsset:", objc_msgSend(v14, "containsObject:", v20));
        objc_msgSend(v21, "setIsRepresentative:", objc_msgSend(v13, "containsObject:", v20));
        v22 = objc_alloc_init(MEMORY[0x1E0D114A0]);
        objc_msgSend(v20, "cloudAssetGUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setAssetIdentifier:", v23);

        objc_msgSend(v22, "setAssetFlag:", v21);
        objc_msgSend(v20, "master");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "scopedIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setMasterFingerprint:", v26);
        objc_msgSend(v12, "addAsset:", v22);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v17);
  }

  objc_msgSend(v28, "setRecordList:", v12);
  return v28;
}

- (int64_t)cloudDeletionType
{
  return 8;
}

- (BOOL)_sharingCompositionNeedsUpdate
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if ((-[PLSuggestion isDeleted](self, "isDeleted") & 1) != 0)
    return 0;
  -[PLSuggestion changedValues](self, "changedValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keyAssets"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v3 = 1;
  }
  else
  {
    -[PLSuggestion changedValues](self, "changedValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("representativeAssets"));
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

  if (-[PLSuggestion _sharingCompositionNeedsUpdate](self, "_sharingCompositionNeedsUpdate"))
  {
    -[PLSuggestion willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("sharingComposition"));
    -[PLSuggestion primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("sharingComposition"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "intValue");

    -[PLSuggestion didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("sharingComposition"));
    v5 = objc_msgSend((id)objc_opt_class(), "_calculateSharingCompositionForSuggestion:", self);
    if ((_DWORD)v5 != v4)
    {
      v6 = v5;
      -[PLSuggestion willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("sharingComposition"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSuggestion setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v7, CFSTR("sharingComposition"));

      -[PLSuggestion didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("sharingComposition"));
    }
  }
}

- (signed)sharingComposition
{
  void *v3;
  signed __int16 v4;

  -[PLSuggestion _recalculateSharingCompositionIfNeeded](self, "_recalculateSharingCompositionIfNeeded");
  -[PLSuggestion willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("sharingComposition"));
  -[PLSuggestion primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("sharingComposition"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  -[PLSuggestion didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("sharingComposition"));
  return v4;
}

+ (id)entityName
{
  return CFSTR("Suggestion");
}

+ (id)insertIntoPhotoLibrary:(id)a3 withUUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a3, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v8, (uint64_t)v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v9, "setUuid:", v6);

  return v9;
}

+ (id)suggestionWithUUID:(id)a3 inPhotoLibrary:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a4, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "suggestionWithUUID:inManagedObjectContext:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)suggestionWithUUID:(id)a3 inManagedObjectContext:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("uuid"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "suggestionsMatchingPredicate:sortDescriptors:limit:inManagedObjectContext:", v8, 0, 1, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)suggestionsWithUUIDs:(id)a3 inPhotoLibrary:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("uuid IN %@"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "suggestionsMatchingPredicate:sortDescriptors:limit:inManagedObjectContext:", v8, 0, 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)_suggestionSubtypeAllowedToContainSyndicatedAssets:(unsigned __int16)a3
{
  return (int)a3 <= 651 && (int)a3 > 305 && (int)a3 <= 600 && (a3 - 501) >= 2 && a3 == 306;
}

+ (id)_representativeAssetIDsInSuggestion:(id)a3 managedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _BOOL4 v12;
  NSObject *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__34842;
  v26 = __Block_byref_object_dispose__34843;
  v27 = (id)MEMORY[0x1E0C9AA60];
  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isTemporaryID"))
  {
    v21 = 0;
    objc_msgSend(v6, "existingObjectWithID:error:", v5, &v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v21;
    v12 = v10 != 0;
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("suggestionsBeingRepresentativeAssets CONTAINS %@"), v10);
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPredicate:", v13);
    }
    else
    {
      PLPhotoKitGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v29 = v5;
        v30 = 2112;
        v31 = v11;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Failed to fetch existingObjectWithID %@: %@", buf, 0x16u);
      }
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("suggestionsBeingRepresentativeAssets CONTAINS %@"), v5);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPredicate:", v11);
    v12 = 1;
  }

  objc_msgSend(v9, "setResultType:", 1);
  objc_msgSend(v9, "setIncludesPropertyValues:", 0);
  if (v12)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __73__PLSuggestion__representativeAssetIDsInSuggestion_managedObjectContext___block_invoke;
    v16[3] = &unk_1E3676EC8;
    v20 = &v22;
    v17 = v6;
    v18 = v9;
    v19 = v5;
    objc_msgSend(v17, "performBlockAndWait:", v16);

  }
  v14 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v14;
}

+ (id)predicateForAllAssetsInSuggestion:(id)a3 managedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_representativeAssetIDsInSuggestion:managedObjectContext:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY moment.assets IN (%@) AND noindex(trashedState) == %d AND noindex(kindSubtype) != %d AND noindex(kindSubtype) != %d AND additionalAttributes.importedBy != %d"), v7, 0, 10, 103, 7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)predicateForAllMomentsFromRepresentativeAssetsInSuggestion:(id)a3 managedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_representativeAssetIDsInSuggestion:managedObjectContext:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY assets IN (%@)"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_syncablePredicate
{
  if (_syncablePredicate_onceToken != -1)
    dispatch_once(&_syncablePredicate_onceToken, &__block_literal_global_34865);
  return (id)_syncablePredicate_predicate;
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
  objc_msgSend(v8, "setPropertiesToUpdate:", &unk_1E37645F8);
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
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Batch updated %@ Suggestions", buf, 0xCu);

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
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Failed to batch update Suggestions: %@", buf, 0xCu);
    }
    goto LABEL_8;
  }

  objc_autoreleasePoolPop(v5);
}

+ (id)suggestionsToUploadInPhotoLibrary:(id)a3 limit:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "_syncablePredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("cloudLocalState == %d"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3528];
  v18[0] = v7;
  v18[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "suggestionsMatchingPredicate:sortDescriptors:limit:inManagedObjectContext:", v11, v13, a4, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)suggestionsToPrefetchInManagedObjectContext:(id)a3
{
  id v4;
  PLGlobalValues *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[PLGlobalValues initWithManagedObjectContext:]([PLGlobalValues alloc], "initWithManagedObjectContext:", v4);
  if (-[PLGlobalValues shouldPrefetchWidgetResources](v5, "shouldPrefetchWidgetResources"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K <= %d and %K == %d"), CFSTR("state"), 1, CFSTR("featuredState"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "suggestionsMatchingPredicate:sortDescriptors:limit:inManagedObjectContext:", v6, 0, 0, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)suggestionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(int64_t)a5 inManagedObjectContext:(id)a6
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
  v33 = __Block_byref_object_copy__34842;
  v34 = __Block_byref_object_dispose__34843;
  v35 = 0;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __90__PLSuggestion_suggestionsMatchingPredicate_sortDescriptors_limit_inManagedObjectContext___block_invoke;
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

+ (unint64_t)_deleteSuggestionsMatchingPredicate:(id)a3 inManagedObjectContext:(id)a4
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
  objc_msgSend(v7, "enumerateObjectsFromFetchRequest:count:batchSize:usingBlock:", v11, &v19, 100, &__block_literal_global_79_34839);
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
      v14 = "Deleted %{public}lu suggestions";
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

+ (unint64_t)deletePendingSuggestionsCreatedBefore:(id)a3 withTypes:(id)a4 andRejectedAssetsBySuggestionType:(id)a5 inManagedObjectContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  id v42;
  id v43;
  id v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[2];
  _QWORD v51[2];
  uint8_t v52[128];
  uint8_t buf[4];
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v54 = v9;
      v55 = 2112;
      v56 = v10;
      v57 = 2112;
      v58 = v11;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Removing pending suggestions created before %@, types: %@, rejectedAssetsByType: %@", buf, 0x20u);
    }

  }
  v14 = 0x1E0CB3000uLL;
  v15 = 0x1E0CB3000;
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("type"), v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "count"))
    {
      v17 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    v18 = objc_msgSend(v11, "count");
    v16 = 0;
    v17 = 0;
    v19 = 0;
    if (!v18)
      goto LABEL_22;
  }
  v41 = v16;
  v42 = v12;
  v44 = v10;
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v43 = v11;
  v21 = v11;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v47 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v21, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v14;
        objc_msgSend(*(id *)(v14 + 2176), "predicateWithFormat:", CFSTR("%K == %d and any %K in %@"), CFSTR("type"), objc_msgSend(v26, "intValue"), CFSTR("keyAssets"), v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v29);

        v14 = v28;
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v23);
  }

  v15 = 0x1E0CB3000uLL;
  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v41;
  if (!v41)
  {
    v19 = v17;
    v10 = v44;
    v12 = v42;
    v11 = v43;
LABEL_22:
    v34 = v19;
    if (v34)
      goto LABEL_23;
    goto LABEL_19;
  }
  v10 = v44;
  v12 = v42;
  v11 = v43;
  if (!v17)
  {
LABEL_20:
    v19 = v16;
    goto LABEL_22;
  }
  v30 = v14;
  v31 = (void *)MEMORY[0x1E0CB3528];
  v51[0] = v41;
  v51[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v31;
  v14 = v30;
  objc_msgSend(v33, "orPredicateWithSubpredicates:", v32);
  v34 = (id)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
LABEL_23:
    objc_msgSend(*(id *)(v14 + 2176), "predicateWithFormat:", CFSTR("%K == %d and %K < %@"), CFSTR("state"), 0, CFSTR("creationDate"), v9);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *(void **)(v15 + 1320);
    v50[0] = v36;
    v50[1] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "andPredicateWithSubpredicates:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = objc_msgSend(a1, "_deleteSuggestionsMatchingPredicate:inManagedObjectContext:", v39, v12);
    goto LABEL_24;
  }
LABEL_19:
  v35 = 0;
LABEL_24:

  return v35;
}

+ (unint64_t)deleteSuggestionsWithObjectIDs:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
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
        v16 = v9;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Removing %@ suggestions", buf, 0xCu);

      }
    }
    v10 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v6, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateWithFormat:", CFSTR("SELF IN %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(a1, "_deleteSuggestionsMatchingPredicate:inManagedObjectContext:", v12, v7);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)suggestionObjectIDsContainingAsset:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0C99E20];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "objectIDsForRelationshipNamed:", CFSTR("suggestionsBeingKeyAssets"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  objc_msgSend(v4, "objectIDsForRelationshipNamed:", CFSTR("suggestionsBeingRepresentativeAssets"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObjectsFromArray:", v7);
  return v5;
}

+ (int64_t)cloudDeletionTypeForTombstone:(id)a3
{
  return 8;
}

+ (NSString)cloudUUIDKeyForDeletion
{
  return (NSString *)CFSTR("uuid");
}

+ (signed)_calculateSharingCompositionForSuggestion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  signed __int16 v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v3, "keyAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "representativeAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v7);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v9)
  {

LABEL_14:
    v15 = 0;
    goto LABEL_15;
  }
  v10 = v9;
  v11 = 0;
  v12 = 0;
  v13 = *(_QWORD *)v18;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v18 != v13)
        objc_enumerationMutation(v8);
      v12 += objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "hasLibraryScope", (_QWORD)v17);
    }
    v11 += v10;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  }
  while (v10);

  if (v11 == v12)
    v15 = 1;
  else
    v15 = 2;
  if (!v12)
    goto LABEL_14;
LABEL_15:

  return v15;
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSuggestion.m"), 721, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("collections"));

  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF IN %@ AND (SUBQUERY(%K, $a, $a.%K == %d).@count == 0) AND (SUBQUERY(%K, $a, $a.%K == %d).@count == 0)"), v5, CFSTR("keyAssets"), CFSTR("activeLibraryScopeParticipationState"), 1, CFSTR("representativeAssets"), CFSTR("activeLibraryScopeParticipationState"), 1);
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSuggestion.m"), 731, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("collections"));

  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF IN %@ AND (SUBQUERY(%K, $a, $a.%K == %d).@count == 0) AND (SUBQUERY(%K, $a, $a.%K == %d).@count == 0)"), v5, CFSTR("keyAssets"), CFSTR("activeLibraryScopeParticipationState"), 0, CFSTR("representativeAssets"), CFSTR("activeLibraryScopeParticipationState"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __75__PLSuggestion__deleteSuggestionsMatchingPredicate_inManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "delete");
}

void __90__PLSuggestion_suggestionsMatchingPredicate_sortDescriptors_limit_inManagedObjectContext___block_invoke(uint64_t a1)
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
  v5 = *(void **)(a1 + 48);
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
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch suggestions: %@", buf, 0xCu);
    }

  }
}

void __34__PLSuggestion__syncablePredicate__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d AND %K == %d AND (%K != %d)"), CFSTR("state"), 0, CFSTR("state"), 4, CFSTR("type"), 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_syncablePredicate_predicate;
  _syncablePredicate_predicate = v0;

}

void __73__PLSuggestion__representativeAssetIDsInSuggestion_managedObjectContext___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v12 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v12);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v12;
  v6 = *(_QWORD *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    PLPhotoKitGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = a1[6];
      *(_DWORD *)buf = 138412546;
      v14 = v9;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch representative asset IDs for %@: %@", buf, 0x16u);
    }

    v10 = *(_QWORD *)(a1[7] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = MEMORY[0x1E0C9AA60];

  }
}

@end
