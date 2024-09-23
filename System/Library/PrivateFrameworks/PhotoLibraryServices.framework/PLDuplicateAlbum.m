@implementation PLDuplicateAlbum

- (void)awakeFromInsert
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLDuplicateAlbum;
  -[PLGenericAlbum awakeFromInsert](&v3, sel_awakeFromInsert);
  -[PLGenericAlbum setKindValue:](self, "setKindValue:", 1510);
}

- (id)mutableMetadataMatchingAssets
{
  return (id)-[PLDuplicateAlbum mutableSetValueForKey:](self, "mutableSetValueForKey:", CFSTR("metadataMatchingAssets"));
}

- (id)mutablePerceptualMatchingAssets
{
  return (id)-[PLDuplicateAlbum mutableSetValueForKey:](self, "mutableSetValueForKey:", CFSTR("perceptualMatchingAssets"));
}

- (void)addAssets:(id)a3 type:(signed __int16)a4
{
  int v4;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  PLDuplicateAlbum *v17;
  SEL v18;
  id v19;
  id v20;

  v4 = a4;
  v20 = a3;
  if (objc_msgSend(v20, "count"))
  {
    -[PLManagedAlbum mutableAssets](self, "mutableAssets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v20);

    switch(v4)
    {
      case 0:
      case 3:
        goto LABEL_13;
      case 1:
        v7 = objc_msgSend(v20, "count");
        -[PLDuplicateAlbum assets](self, "assets");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count");

        if (v7 != v9)
          goto LABEL_5;
        -[PLDuplicateAlbum mutableMetadataMatchingAssets](self, "mutableMetadataMatchingAssets");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      case 2:
LABEL_5:
        -[PLDuplicateAlbum mutablePerceptualMatchingAssets](self, "mutablePerceptualMatchingAssets");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
        v11 = v10;
        objc_msgSend(v10, "addObjectsFromArray:", v20);

        goto LABEL_8;
      default:
        if (v4 == 256)
        {
LABEL_13:
          PLStringFromPLDuplicateType(v4);
          objc_claimAutoreleasedReturnValue();
          v17 = (PLDuplicateAlbum *)_PFAssertFailHandler();
          -[PLDuplicateAlbum removeInternalAssets:](v17, v18, v19);
          return;
        }
LABEL_8:
        -[PLDuplicateAlbum metadataMatchingAssets](self, "metadataMatchingAssets");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");
        -[PLDuplicateAlbum assets](self, "assets");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");

        if (v13 == v15)
        {
          -[PLDuplicateAlbum mutablePerceptualMatchingAssets](self, "mutablePerceptualMatchingAssets");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "removeAllObjects");

        }
        -[PLDuplicateAlbum updateAlbumType](self, "updateAlbumType");
        if (-[PLDuplicateAlbum processingVersion](self, "processingVersion") >= 1)
          -[PLDuplicateAlbum setProcessingVersion:](self, "setProcessingVersion:", 0);
        break;
    }
  }

}

- (void)removeInternalAssets:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v8);
    -[PLDuplicateAlbum mutableMetadataMatchingAssets](self, "mutableMetadataMatchingAssets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "minusSet:", v4);

    -[PLDuplicateAlbum mutablePerceptualMatchingAssets](self, "mutablePerceptualMatchingAssets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "minusSet:", v4);

    -[PLDuplicateAlbum updateAlbumType](self, "updateAlbumType");
    -[PLDuplicateAlbum setProcessingVersion:](self, "setProcessingVersion:", -[PLDuplicateAlbum processingVersion](self, "processingVersion") + 1);
    -[PLGenericAlbum photoLibrary](self, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLDuplicateProcessor signalBackgroundJobServiceDuplicateProcessingWithLibrary:](PLDuplicateProcessor, "signalBackgroundJobServiceDuplicateProcessingWithLibrary:", v7);

  }
}

- (void)updateAlbumType
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  -[PLDuplicateAlbum metadataMatchingAssets](self, "metadataMatchingAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[PLDuplicateAlbum perceptualMatchingAssets](self, "perceptualMatchingAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v4)
  {
    if (v6)
    {
      -[PLDuplicateAlbum assets](self, "assets");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      -[PLDuplicateAlbum assets](self, "assets");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB3880];
      -[PLDuplicateAlbum metadataMatchingAssets](self, "metadataMatchingAssets");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "predicateWithFormat:", CFSTR("self in %@"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "filteredOrderedSetUsingPredicate:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v8 == v14)
        v15 = 1;
      else
        v15 = 256;
    }
    else
    {
      v15 = 1;
    }
  }
  else
  {
    if (!v6)
      return;
    v15 = 2;
  }
  if ((_DWORD)v15 != -[PLDuplicateAlbum duplicateType](self, "duplicateType"))
    -[PLDuplicateAlbum setDuplicateType:](self, "setDuplicateType:", v15);
}

- (BOOL)supportsAssetOrderKeys
{
  return 1;
}

- (id)duplicateAssetsFromCollection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  PLDuplicateAsset *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  uint8_t v29[128];
  uint8_t buf[4];
  id v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[PLDuplicateAlbum albumAssetsFetchRequestForDuplicateSort](self, "albumAssetsFetchRequestForDuplicateSort");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D732B0];
  -[PLGenericAlbum photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startedQueryStatsWithContext:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLDuplicateAlbum managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v3, &v28);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v28;

  objc_msgSend(v7, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(v9, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    PLDuplicateDetectionGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v31 = v14;
      v32 = 2112;
      v33 = CFSTR("Duplicate Album: Assets from collection");
      v34 = 2112;
      v35 = v11;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);

    }
  }

  if (v9)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v16 = v9;
    v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v17)
    {
      v18 = v17;
      v23 = v10;
      v19 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v16);
          v21 = -[PLDuplicateAsset initWithAsset:]([PLDuplicateAsset alloc], "initWithAsset:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v18);
      v10 = v23;
    }
  }
  else
  {
    PLBackendGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v10;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Failed to fetch assets for duplicate sorting. Error: %@", buf, 0xCu);
    }
    v15 = 0;
  }

  return v15;
}

- (void)sortAssets
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[PLDuplicateAlbum assets](self, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 >= 2)
  {
    -[PLDuplicateAlbum duplicateAssetsFromCollection](self, "duplicateAssetsFromCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "count") < 2)
    {
      PLBackendGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = 134217984;
        v14 = objc_msgSend(v5, "count");
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Duplicate asset count unexpected. Asset count: %td", (uint8_t *)&v13, 0xCu);
      }

    }
    else
    {
      objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_83047);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_alloc(MEMORY[0x1E0C99E40]);
      objc_msgSend(v6, "valueForKey:", CFSTR("asset"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);

      -[PLDuplicateAlbum assets](self, "assets");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToOrderedSet:", v9);

      if ((v11 & 1) == 0)
        -[PLDuplicateAlbum setAssets:](self, "setAssets:", v9);
      -[PLDuplicateAlbum updateDuplicateAssetVisibilityStateWithDuplicateAssets:](self, "updateDuplicateAssetVisibilityStateWithDuplicateAssets:", v5);

    }
  }
}

- (BOOL)hasDuplicateAssetVisibilityStateVisibleAssets:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDuplicateAlbum.m"), 210, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("duplicateAssets.count > 0"));

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
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
        if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "duplicateAssetVisibilityState") == 1)
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

  return v7;
}

- (void)updateDuplicateAssetVisibilityStatePropertyForAsset:(id)a3 duplicateAssetVisibilityState:(signed __int16)a4
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a4;
  v7 = a3;
  if (objc_msgSend(v7, "duplicateAssetVisibilityState") != (_DWORD)v4)
  {
    v5 = v7;
    if ((_DWORD)v4 != 100 && (_DWORD)v4 != 1)
      goto LABEL_11;
    v6 = objc_msgSend(v7, "libraryScopeShareState");
    if (v6 > 65537)
    {
      v5 = v7;
      if (v6 != 65552 && v6 != 65538)
        goto LABEL_11;
    }
    else
    {
      v5 = v7;
      if (v6 != 2 && v6 != 16)
        goto LABEL_11;
    }
    PLLibraryScopeAssetRemoveSuggestedByClientType(v5);
    v5 = v7;
LABEL_11:
    objc_msgSend(v5, "setDuplicateAssetVisibilityState:", v4);
  }

}

- (void)updateDuplicateAssetVisibilityStateWithDuplicateAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  __int16 v17;
  id v18;
  id obj;
  _BOOL4 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v20 = -[PLDuplicateAlbum hasDuplicateAssetVisibilityStateVisibleAssets:](self, "hasDuplicateAssetVisibilityStateVisibleAssets:", v4);
    -[PLDuplicateAlbum assets](self, "assets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v18 = v4;
    obj = v4;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v11, "asset");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "duplicateAssetVisibilityState");
          objc_msgSend(v12, "objectID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "isEqual:", v15);

          if (v16)
          {
            if (v20)
            {
              if (v13 == 100)
                v17 = 100;
              else
                v17 = 2;
            }
            else
            {
              v17 = 2;
            }
          }
          else if (v20)
          {
            v17 = v13;
          }
          else
          {
            v17 = 1;
          }
          -[PLDuplicateAlbum updateDuplicateAssetVisibilityStatePropertyForAsset:duplicateAssetVisibilityState:](self, "updateDuplicateAssetVisibilityStatePropertyForAsset:duplicateAssetVisibilityState:", v12, v17);

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v8);
    }

    v4 = v18;
  }

}

- (id)albumAssetsFetchRequestForDuplicateSort
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3880];
  -[PLDuplicateAlbum objectIDsForRelationshipNamed:](self, "objectIDsForRelationshipNamed:", CFSTR("assets"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("self IN %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v8);

  +[PLDuplicateAsset relationshipKeyPathsForPrefetching](PLDuplicateAsset, "relationshipKeyPathsForPrefetching");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRelationshipKeyPathsForPrefetching:", v9);

  return v5;
}

- (void)removeAssetsAtIndexes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[PLDuplicateAlbum assets](self, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsAtIndexes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7.receiver = self;
  v7.super_class = (Class)PLDuplicateAlbum;
  -[PLManagedAlbum removeAssetsAtIndexes:](&v7, sel_removeAssetsAtIndexes_, v4);

  -[PLDuplicateAlbum cleanupAlbumForDeletedDuplicateAsset](self, "cleanupAlbumForDeletedDuplicateAsset");
  if ((-[PLDuplicateAlbum isDeleted](self, "isDeleted") & 1) == 0)
    -[PLDuplicateAlbum removeInternalAssets:](self, "removeInternalAssets:", v6);

}

- (void)cleanupAlbumForDeletedDuplicateAsset
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((-[PLDuplicateAlbum isDeleted](self, "isDeleted") & 1) == 0
    && -[PLGenericAlbum isDuplicateAlbum](self, "isDuplicateAlbum")
    && -[PLManagedAlbum assetsCount](self, "assetsCount") <= 1)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[PLDuplicateAlbum assets](self, "assets", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
          if ((objc_msgSend(v8, "isDeleted") & 1) == 0)
            objc_msgSend(v8, "setDuplicateAssetVisibilityState:", 0);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

    -[PLGenericAlbum delete](self, "delete");
  }
}

uint64_t __30__PLDuplicateAlbum_sortAssets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)entityName
{
  return CFSTR("DuplicateAlbum");
}

+ (id)insertIntoPhotoLibrary:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedObject insertInManagedObjectContext:](PLDuplicateAlbum, "insertInManagedObjectContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v4, "setDuplicateType:", 0);
  return v4;
}

+ (id)albumSupportsAssetOrderKeysPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind == %d"), 1510);
}

+ (id)duplicateAlbumsInCurrentManagedObjectContext:(id)a3
{
  return (id)objc_msgSend(a1, "duplicateAlbumsInCurrentManagedObjectContext:predicate:", a3, 0);
}

+ (id)duplicateAlbumsInCurrentManagedObjectContext:(id)a3 type:(signed __int16)a4
{
  int v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a3;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("duplicateType"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "duplicateAlbumsInCurrentManagedObjectContext:predicate:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)duplicateAlbumsInCurrentManagedObjectContext:(id)a3 predicate:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C97B48];
  v6 = a4;
  v7 = a3;
  +[PLDuplicateAlbum entityName](PLDuplicateAlbum, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPredicate:", v6);
  v14 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v9, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v14;
  if (!v10)
  {
    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v11;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch duplicate albums. Error: %@", buf, 0xCu);
    }

  }
  return v10;
}

@end
