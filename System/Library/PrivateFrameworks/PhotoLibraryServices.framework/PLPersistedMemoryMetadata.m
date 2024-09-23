@implementation PLPersistedMemoryMetadata

- (PLPersistedMemoryMetadata)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPersistedMemoryMetadata.m"), 90, CFSTR("Can't initialize a PLPersistedMemoryMetadata object using -init."));

  return 0;
}

- (PLPersistedMemoryMetadata)initWithPLMemory:(id)a3 metadataURL:(id)a4
{
  id v7;
  id v8;
  PLPersistedMemoryMetadata *v9;
  PLPersistedMemoryMetadata *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLPersistedMemoryMetadata;
  v9 = -[PLPersistedMemoryMetadata init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_memory, a3);
    objc_storeStrong((id *)&v10->_metadataURL, a4);
    v10->_version = 2;
  }

  return v10;
}

- (PLPersistedMemoryMetadata)initWithPLMemory:(id)a3 pathManager:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PLPersistedMemoryMetadata *v14;

  v6 = (void *)MEMORY[0x1E0C99E98];
  v7 = a3;
  objc_msgSend(a4, "privateDirectoryWithSubType:createIfNeeded:error:", 4, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPath:isDirectory:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@.%@"), v11, PLMemoryMetadataExtension);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "URLByAppendingPathComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PLPersistedMemoryMetadata initWithPLMemory:metadataURL:](self, "initWithPLMemory:metadataURL:", v7, v13);

  return v14;
}

- (PLPersistedMemoryMetadata)initWithPersistedDataAtURL:(id)a3
{
  id v5;
  PLPersistedMemoryMetadata *v6;
  PLPersistedMemoryMetadata *v7;
  PLPersistedMemoryMetadata *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLPersistedMemoryMetadata;
  v6 = -[PLPersistedMemoryMetadata init](&v10, sel_init);
  v7 = v6;
  if (v6
    && (objc_storeStrong((id *)&v6->_metadataURL, a3), !-[PLPersistedMemoryMetadata _readMetadata](v7, "_readMetadata")))
  {
    v8 = 0;
  }
  else
  {
    v8 = v7;
  }

  return v8;
}

- (void)removePersistedData
{
  void *v3;
  NSURL *metadataURL;
  char v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  metadataURL = self->_metadataURL;
  v9 = 0;
  v5 = objc_msgSend(v3, "removeItemAtURL:error:", metadataURL, &v9);
  v6 = v9;

  if ((v5 & 1) == 0)
  {
    PLMigrationGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[NSURL path](self->_metadataURL, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Failed to remove persisted memory metadata %@ %@", buf, 0x16u);

    }
  }

}

- (BOOL)isObsolete
{
  return self->_version < 2;
}

- (id)insertMemoryFromDataInManagedObjectContext:(id)a3
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
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v25;
  PLPersistedMemoryMetadata *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLPersistedMemoryMetadata uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPersistedMemoryMetadata title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPersistedMemoryMetadata subtitle](self, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPersistedMemoryMetadata creationDate](self, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLMemory insertIntoContext:withUUID:title:subtitle:creationDate:](PLMemory, "insertIntoContext:withUUID:title:subtitle:creationDate:", v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setRejected:", -[PLPersistedMemoryMetadata isRejected](self, "isRejected"));
  objc_msgSend(v9, "setFavorite:", -[PLPersistedMemoryMetadata isFavorite](self, "isFavorite"));
  objc_msgSend(v9, "setPendingState:", (unsigned __int16)-[PLPersistedMemoryMetadata pendingState](self, "pendingState"));
  objc_msgSend(v9, "setCreationType:", (unsigned __int16)-[PLPersistedMemoryMetadata creationType](self, "creationType"));
  objc_msgSend(v9, "setUserActionOptions:", (unsigned __int16)-[PLPersistedMemoryMetadata userActionOptions](self, "userActionOptions"));
  objc_msgSend(v9, "setCategory:", -[PLPersistedMemoryMetadata category](self, "category"));
  objc_msgSend(v9, "setSubcategory:", -[PLPersistedMemoryMetadata subcategory](self, "subcategory"));
  -[PLPersistedMemoryMetadata movieData](self, "movieData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMovieData:", v10);

  -[PLPersistedMemoryMetadata movieAssetState](self, "movieAssetState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMovieAssetState:", v11);

  objc_msgSend(v9, "setPhotosGraphVersion:", -[PLPersistedMemoryMetadata photosGraphVersion](self, "photosGraphVersion"));
  -[PLPersistedMemoryMetadata photosGraphData](self, "photosGraphData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPhotosGraphData:", v12);

  -[PLPersistedMemoryMetadata assetListPredicate](self, "assetListPredicate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAssetListPredicate:", v13);

  objc_msgSend(v9, "setNotificationState:", -[PLPersistedMemoryMetadata notificationState](self, "notificationState"));
  -[PLPersistedMemoryMetadata score](self, "score");
  objc_msgSend(v9, "setScore:");
  -[PLPersistedMemoryMetadata blacklistedFeature](self, "blacklistedFeature");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBlacklistedFeature:", v14);

  objc_msgSend(v9, "setPlayCount:", -[PLPersistedMemoryMetadata playCount](self, "playCount"));
  objc_msgSend(v9, "setShareCount:", -[PLPersistedMemoryMetadata shareCount](self, "shareCount"));
  objc_msgSend(v9, "setViewCount:", -[PLPersistedMemoryMetadata viewCount](self, "viewCount"));
  objc_msgSend(v9, "setPendingPlayCount:", -[PLPersistedMemoryMetadata pendingPlayCount](self, "pendingPlayCount"));
  objc_msgSend(v9, "setPendingShareCount:", -[PLPersistedMemoryMetadata pendingShareCount](self, "pendingShareCount"));
  objc_msgSend(v9, "setPendingViewCount:", -[PLPersistedMemoryMetadata pendingViewCount](self, "pendingViewCount"));
  v25 = v9;
  objc_msgSend(v9, "setFeaturedState:", -[PLPersistedMemoryMetadata featuredState](self, "featuredState"));
  v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v26 = self;
  -[PLPersistedMemoryMetadata userFeedbacksDictionaryArray](self, "userFeedbacksDictionaryArray");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v16);
        +[PLUserFeedback insertIntoManagedObjectContext:withDictionaryRepresentation:](PLUserFeedback, "insertIntoManagedObjectContext:withDictionaryRepresentation:", v4, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          objc_msgSend(v15, "addObject:", v21);
        }
        else
        {
          PLMigrationGetLog();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            -[PLPersistedMemoryMetadata uuid](v26, "uuid");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v32 = v23;
            _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_INFO, "Missing user feedback for memory %{public}@", buf, 0xCu);

          }
        }

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v18);
  }

  objc_msgSend(v25, "setUserFeedbacks:", v15);
  return v25;
}

- (BOOL)_updateAssetsInMemory:(id)a3 relationshipName:(id)a4 persistedAssetUUIDs:(id)a5 includePendingChanges:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int v29;
  _BYTE v30[24];
  uint64_t v31;

  v6 = a6;
  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "valueForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueForKey:", CFSTR("uuid"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v12, "isEqual:", v14);
  PLMigrationGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v18 = objc_msgSend(v14, "count");
      objc_msgSend(v10, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 67109634;
      *(_DWORD *)v30 = v18;
      *(_WORD *)&v30[4] = 2112;
      *(_QWORD *)&v30[6] = v11;
      *(_WORD *)&v30[14] = 2112;
      *(_QWORD *)&v30[16] = v19;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEBUG, "Persisted asset UUIDs (%d total) match database for memory %@ %@", (uint8_t *)&v29, 0x1Cu);

    }
    v20 = 1;
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "uuid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedMemoryMetadata metadataURL](self, "metadataURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "path");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138412546;
      *(_QWORD *)v30 = v21;
      *(_WORD *)&v30[8] = 2112;
      *(_QWORD *)&v30[10] = v23;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_INFO, "Updating assets in memory %@ to match persisted UUIDs from %@", (uint8_t *)&v29, 0x16u);

    }
    objc_msgSend(v12, "allObjects");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "photoLibrary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLManagedAsset assetsWithUUIDs:options:inLibrary:](PLManagedAsset, "assetsWithUUIDs:options:inLibrary:", v24, v6, v25);
    v17 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "mutableSetValueForKey:", v11);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObjectsFromArray:", v17);
    v27 = -[NSObject count](v17, "count");
    v20 = v27 == objc_msgSend(v12, "count");

  }
  return v20;
}

- (BOOL)_updateAssetsInMemory:(id)a3 relationshipName:(id)a4 persistedOrderedAssetUUIDs:(id)a5 includePendingChanges:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  uint64_t v32;
  void *v33;
  BOOL v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint8_t v65[128];
  uint8_t buf[4];
  _BYTE v67[24];
  uint64_t v68;

  v6 = a6;
  v68 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "valueForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueForKey:", CFSTR("uuid"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v13) = objc_msgSend(v12, "isEqual:", v14);
  PLMigrationGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if ((_DWORD)v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v17 = objc_msgSend(v14, "count");
      objc_msgSend(v10, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v67 = v17;
      *(_WORD *)&v67[4] = 2112;
      *(_QWORD *)&v67[6] = v11;
      *(_WORD *)&v67[14] = 2112;
      *(_QWORD *)&v67[16] = v18;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEBUG, "Persisted asset UUIDs (%d total) match database for memory %@ %@", buf, 0x1Cu);

    }
    v19 = 1;
  }
  else
  {
    v52 = v14;
    v53 = v11;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedMemoryMetadata metadataURL](self, "metadataURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "path");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v67 = v20;
      *(_WORD *)&v67[8] = 2112;
      *(_QWORD *)&v67[10] = v22;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_INFO, "Updating assets in memory %@ to match persisted UUIDs from %@", buf, 0x16u);

    }
    v54 = v12;
    objc_msgSend(v12, "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v10;
    objc_msgSend(v10, "photoLibrary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLManagedAsset assetsWithUUIDs:options:inLibrary:](PLManagedAsset, "assetsWithUUIDs:options:inLibrary:", v23, v6, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v25, "count"));
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v16 = v25;
    v27 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v61 != v29)
            objc_enumerationMutation(v16);
          v31 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          objc_msgSend(v31, "uuid");
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = (void *)v32;
          if (v31)
            v34 = v32 == 0;
          else
            v34 = 1;
          if (!v34)
            objc_msgSend(v26, "setObject:forKey:", v31, v32);

          objc_msgSend(v31, "uuid");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v35)
          {
            PLMigrationGetLog();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v55, "uuid");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)v67 = v37;
              _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_INFO, "Missing asset or asset.uuid for memory %{public}@", buf, 0xCu);

            }
          }
        }
        v28 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
      }
      while (v28);
    }

    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v26, "count"));
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v39 = v54;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v57;
      do
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v57 != v42)
            objc_enumerationMutation(v39);
          v44 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * j);
          v45 = objc_msgSend(v38, "count");
          objc_msgSend(v26, "objectForKey:", v44);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          if (v46)
            objc_msgSend(v38, "addObject:", v46);

          if (objc_msgSend(v38, "count") == v45)
          {
            PLMigrationGetLog();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v55, "uuid");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)v67 = v48;
              _os_log_impl(&dword_199541000, v47, OS_LOG_TYPE_INFO, "Missing asset for persisted asset uuids for memory %{public}@", buf, 0xCu);

            }
          }
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
      }
      while (v41);
    }

    v10 = v55;
    v11 = v53;
    objc_msgSend(v55, "mutableOrderedSetValueForKey:", v53);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObjectsFromArray:", v38);
    v50 = -[NSObject count](v16, "count");
    v19 = v50 == objc_msgSend(v39, "count");

    v12 = v54;
    v14 = v52;
  }

  return v19;
}

- (BOOL)updateAssetsInMemory:(id)a3 includePendingAssetChanges:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v32;
  void *v33;
  __int16 v34;
  void *v35;
  _QWORD v36[2];

  v4 = a4;
  v36[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PLPersistedMemoryMetadata representativeAssetUUIDs](self, "representativeAssetUUIDs");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = -[PLPersistedMemoryMetadata _updateAssetsInMemory:relationshipName:persistedAssetUUIDs:includePendingChanges:](self, "_updateAssetsInMemory:relationshipName:persistedAssetUUIDs:includePendingChanges:", v6, CFSTR("representativeAssets"), v7, v4);

  -[PLPersistedMemoryMetadata curatedAssetUUIDs](self, "curatedAssetUUIDs");
  v9 = objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = -[PLPersistedMemoryMetadata _updateAssetsInMemory:relationshipName:persistedAssetUUIDs:includePendingChanges:](self, "_updateAssetsInMemory:relationshipName:persistedAssetUUIDs:includePendingChanges:", v6, CFSTR("curatedAssets"), v9, v4);

  -[PLPersistedMemoryMetadata extendedCuratedAssetUUIDs](self, "extendedCuratedAssetUUIDs");
  v10 = objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = -[PLPersistedMemoryMetadata _updateAssetsInMemory:relationshipName:persistedAssetUUIDs:includePendingChanges:](self, "_updateAssetsInMemory:relationshipName:persistedAssetUUIDs:includePendingChanges:", v6, CFSTR("extendedCuratedAssets"), v10, v4);

  -[PLPersistedMemoryMetadata movieCuratedAssetUUIDs](self, "movieCuratedAssetUUIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = -[PLPersistedMemoryMetadata _updateAssetsInMemory:relationshipName:persistedAssetUUIDs:includePendingChanges:](self, "_updateAssetsInMemory:relationshipName:persistedAssetUUIDs:includePendingChanges:", v6, CFSTR("movieCuratedAssets"), v11, v4);

  -[PLPersistedMemoryMetadata userCuratedAssetUUIDs](self, "userCuratedAssetUUIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PLPersistedMemoryMetadata _updateAssetsInMemory:relationshipName:persistedAssetUUIDs:includePendingChanges:](self, "_updateAssetsInMemory:relationshipName:persistedAssetUUIDs:includePendingChanges:", v6, CFSTR("userCuratedAssets"), v12, v4);

  -[PLPersistedMemoryMetadata userRemovedAssetUUIDs](self, "userRemovedAssetUUIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PLPersistedMemoryMetadata _updateAssetsInMemory:relationshipName:persistedAssetUUIDs:includePendingChanges:](self, "_updateAssetsInMemory:relationshipName:persistedAssetUUIDs:includePendingChanges:", v6, CFSTR("userRemovedAssets"), v14, v4);

  -[PLPersistedMemoryMetadata customUserAssetUUIDs](self, "customUserAssetUUIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (-[PLPersistedMemoryMetadata _updateAssetsInMemory:relationshipName:persistedOrderedAssetUUIDs:includePendingChanges:](self, "_updateAssetsInMemory:relationshipName:persistedOrderedAssetUUIDs:includePendingChanges:", v6, CFSTR("customUserAssets"), v16, v4)&& v15) & v13 & v10 & v9 & v7 & v8;

  -[PLPersistedMemoryMetadata keyAssetUUID](self, "keyAssetUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v6, "keyAsset");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (!v19
      || (objc_msgSend(v19, "uuid"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v22 = objc_msgSend(v21, "isEqualToString:", v18),
          v21,
          (v22 & 1) == 0))
    {
      v36[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "photoLibrary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLManagedAsset assetsWithUUIDs:options:inLibrary:](PLManagedAsset, "assetsWithUUIDs:options:inLibrary:", v23, v4, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v25, "count"))
      {
        PLMigrationGetLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v6, "uuid");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLPersistedMemoryMetadata metadataURL](self, "metadataURL");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "path");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 138412546;
          v33 = v27;
          v34 = 2112;
          v35 = v29;
          _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_INFO, "Updating key asset in memory %@ to match persisted UUID from %@", (uint8_t *)&v32, 0x16u);

        }
        objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setKeyAsset:", v30);

      }
      else
      {
        LOBYTE(v17) = 0;
      }

    }
  }

  return v17;
}

- (BOOL)hasAllAssetsAvailableInManagedObjectContext:(id)a3 includePendingAssetChanges:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
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
  void *v17;
  void *v18;
  unint64_t v19;
  id v20;
  NSObject *v21;
  BOOL v22;
  id v24;
  uint8_t buf[4];
  PLPersistedMemoryMetadata *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C99E20];
  v7 = a3;
  objc_msgSend(v6, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPersistedMemoryMetadata representativeAssetUUIDs](self, "representativeAssetUUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v9);

  -[PLPersistedMemoryMetadata curatedAssetUUIDs](self, "curatedAssetUUIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v10);

  -[PLPersistedMemoryMetadata extendedCuratedAssetUUIDs](self, "extendedCuratedAssetUUIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v11);

  -[PLPersistedMemoryMetadata movieCuratedAssetUUIDs](self, "movieCuratedAssetUUIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v12);

  -[PLPersistedMemoryMetadata userCuratedAssetUUIDs](self, "userCuratedAssetUUIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v13);

  -[PLPersistedMemoryMetadata userRemovedAssetUUIDs](self, "userRemovedAssetUUIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v14);

  -[PLPersistedMemoryMetadata customUserAssetUUIDs](self, "customUserAssetUUIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "set");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v16);

  -[PLPersistedMemoryMetadata keyAssetUUID](self, "keyAssetUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v8, "addObject:", v17);
  objc_msgSend(v8, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v19 = +[PLManagedAsset countForAssetsWithUUIDs:includePendingChanges:inManagedObjectContext:error:](PLManagedAsset, "countForAssetsWithUUIDs:includePendingChanges:inManagedObjectContext:error:", v18, v4, v7, &v24);

  v20 = v24;
  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLMigrationGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v26 = self;
      v27 = 2112;
      v28 = v20;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Failed to fetch count for assets in memory metadata %@, %@", buf, 0x16u);
    }

  }
  v22 = v19 == objc_msgSend(v8, "count");

  return v22;
}

- (id)description
{
  PLPersistedMemoryMetadata *v2;
  void *v3;
  void *memory;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PLMemory *v10;
  unsigned int v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  PLMemory *v17;
  unsigned int v18;
  unsigned int v19;
  void *v20;
  __int16 v21;
  void *v22;
  PLMemory *v23;
  void *v24;
  void *v25;
  int v27;
  int v28;
  objc_super v29;

  v2 = self;
  if (self->_memory)
    self = (PLPersistedMemoryMetadata *)self->_memory;
  -[PLPersistedMemoryMetadata title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2->_memory)
    memory = v2->_memory;
  else
    memory = v2;
  objc_msgSend(memory, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2->_memory)
    v6 = v2->_memory;
  else
    v6 = v2;
  v28 = objc_msgSend(v6, "category");
  if (v2->_memory)
    v7 = v2->_memory;
  else
    v7 = v2;
  v27 = objc_msgSend(v7, "subcategory");
  if (v2->_memory)
    v8 = v2->_memory;
  else
    v8 = v2;
  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v2->_memory;
  if (v10)
    v11 = -[PLMemory favorite](v10, "favorite");
  else
    v11 = -[PLPersistedMemoryMetadata isFavorite](v2, "isFavorite");
  v12 = v11;
  v13 = v2->_memory;
  if (!v13)
    v13 = v2;
  v14 = objc_msgSend(v13, "pendingState");
  v15 = v2->_memory;
  if (!v15)
    v15 = v2;
  v16 = objc_msgSend(v15, "creationType");
  v17 = v2->_memory;
  if (v17)
    v18 = -[PLMemory rejected](v17, "rejected");
  else
    v18 = -[PLPersistedMemoryMetadata isRejected](v2, "isRejected");
  v19 = v18;
  v20 = v2->_memory;
  if (!v20)
    v20 = v2;
  v21 = objc_msgSend(v20, "userActionOptions");
  v29.receiver = v2;
  v29.super_class = (Class)PLPersistedMemoryMetadata;
  -[PLPersistedMemoryMetadata description](&v29, sel_description);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v2->_memory;
  if (v23)
    -[PLMemory objectID](v23, "objectID");
  else
    -[NSURL path](v2->_metadataURL, "path");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringByAppendingFormat:", CFSTR(" memory %@: uuid:%@ title:%@ / %@, category:%d/%d [fav:%d,rej:%d,pend:%d,user:%d,creaType:%d]"), v24, v9, v3, v5, v28, v27, v12, v19, v14, v21, v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (BOOL)_readMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;

  v3 = (void *)MEMORY[0x1E0C99D50];
  -[PLPersistedMemoryMetadata metadataURL](self, "metadataURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithContentsOfURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "pl_safeInitForReadingFromData:", v5);
    v7 = v6 != 0;
    if (v6)
    {
      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedMemoryMetadata setUuid:](self, "setUuid:", v8);

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedMemoryMetadata setTitle:](self, "setTitle:", v9);

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedMemoryMetadata setSubtitle:](self, "setSubtitle:", v10);

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedMemoryMetadata setCreationDate:](self, "setCreationDate:", v11);

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isRejected"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedMemoryMetadata setRejected:](self, "setRejected:", objc_msgSend(v12, "BOOLValue"));

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isFavorite"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedMemoryMetadata setFavorite:](self, "setFavorite:", objc_msgSend(v13, "BOOLValue"));

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isPending"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedMemoryMetadata setPendingState:](self, "setPendingState:", (__int16)objc_msgSend(v14, "intValue"));

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationType"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedMemoryMetadata setCreationType:](self, "setCreationType:", (__int16)objc_msgSend(v15, "intValue"));

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isUserCreated"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedMemoryMetadata setUserActionOptions:](self, "setUserActionOptions:", objc_msgSend(v16, "BOOLValue"));

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("category"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedMemoryMetadata setCategory:](self, "setCategory:", (__int16)objc_msgSend(v17, "intValue"));

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subcategory"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedMemoryMetadata setSubcategory:](self, "setSubcategory:", (__int16)objc_msgSend(v18, "intValue"));

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyAssetUUID"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedMemoryMetadata setKeyAssetUUID:](self, "setKeyAssetUUID:", v19);

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("representativeAssetUUIDs"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      PLUnarchiveUUIDStringsSetFromData();
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLPersistedMemoryMetadata setRepresentativeAssetUUIDs:](self, "setRepresentativeAssetUUIDs:", v55);
      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("curatedAssetUUIDs"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      PLUnarchiveUUIDStringsSetFromData();
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLPersistedMemoryMetadata setCuratedAssetUUIDs:](self, "setCuratedAssetUUIDs:", v54);
      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extendedCuratedAssetUUIDs"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      PLUnarchiveUUIDStringsSetFromData();
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLPersistedMemoryMetadata setExtendedCuratedAssetUUIDs:](self, "setExtendedCuratedAssetUUIDs:", v53);
      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("movieCuratedAssetUUIDs"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      PLUnarchiveUUIDStringsSetFromData();
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLPersistedMemoryMetadata setMovieCuratedAssetUUIDs:](self, "setMovieCuratedAssetUUIDs:", v52);
      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userCuratedAssetUUIDs"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      PLUnarchiveUUIDStringsSetFromData();
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLPersistedMemoryMetadata setUserCuratedAssetUUIDs:](self, "setUserCuratedAssetUUIDs:", v51);
      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userRemovedAssetUUIDs"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      PLUnarchiveUUIDStringsSetFromData();
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLPersistedMemoryMetadata setUserRemovedAssetUUIDs:](self, "setUserRemovedAssetUUIDs:", v50);
      v26 = (void *)MEMORY[0x1E0C99E60];
      v27 = objc_opt_class();
      objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v28, CFSTR("customUserAssetUUIDs"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLPersistedMemoryMetadata setCustomUserAssetUUIDs:](self, "setCustomUserAssetUUIDs:", v29);
      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("movieData"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedMemoryMetadata setMovieData:](self, "setMovieData:", v30);

      v31 = (void *)MEMORY[0x1E0C99E60];
      v32 = objc_opt_class();
      v33 = objc_opt_class();
      objc_msgSend(v31, "setWithObjects:", v32, v33, objc_opt_class(), 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v34, CFSTR("movieAssetState"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedMemoryMetadata setMovieAssetState:](self, "setMovieAssetState:", v35);

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("photosGraphVersion"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedMemoryMetadata setPhotosGraphVersion:](self, "setPhotosGraphVersion:", objc_msgSend(v36, "longLongValue"));

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("photosGraphData"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedMemoryMetadata setPhotosGraphData:](self, "setPhotosGraphData:", v37);

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetListPredicate"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedMemoryMetadata setAssetListPredicate:](self, "setAssetListPredicate:", v38);

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("score"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "doubleValue");
      -[PLPersistedMemoryMetadata setScore:](self, "setScore:");

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notificationState"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedMemoryMetadata setNotificationState:](self, "setNotificationState:", (__int16)objc_msgSend(v40, "intValue"));

      -[PLPersistedMemoryMetadata setVersion:](self, "setVersion:", objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("version")));
      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("blacklistedFeature"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedMemoryMetadata setBlacklistedFeature:](self, "setBlacklistedFeature:", v41);

      -[PLPersistedMemoryMetadata setPlayCount:](self, "setPlayCount:", objc_msgSend(v6, "decodeInt64ForKey:", CFSTR("playCount")));
      -[PLPersistedMemoryMetadata setShareCount:](self, "setShareCount:", objc_msgSend(v6, "decodeInt64ForKey:", CFSTR("shareCount")));
      -[PLPersistedMemoryMetadata setViewCount:](self, "setViewCount:", objc_msgSend(v6, "decodeInt64ForKey:", CFSTR("viewCount")));
      -[PLPersistedMemoryMetadata setPendingPlayCount:](self, "setPendingPlayCount:", objc_msgSend(v6, "decodeInt64ForKey:", CFSTR("pendingPlayCount")));
      -[PLPersistedMemoryMetadata setPendingShareCount:](self, "setPendingShareCount:", objc_msgSend(v6, "decodeInt64ForKey:", CFSTR("pendingShareCount")));
      -[PLPersistedMemoryMetadata setPendingViewCount:](self, "setPendingViewCount:", objc_msgSend(v6, "decodeInt64ForKey:", CFSTR("pendingViewCount")));
      -[PLPersistedMemoryMetadata setFeaturedState:](self, "setFeaturedState:", (__int16)objc_msgSend(v6, "decodeInt64ForKey:", CFSTR("featuredState")));
      v42 = (void *)MEMORY[0x1E0C99E60];
      v43 = objc_opt_class();
      v44 = objc_opt_class();
      v45 = objc_opt_class();
      v46 = objc_opt_class();
      objc_msgSend(v42, "setWithObjects:", v43, v44, v45, v46, objc_opt_class(), 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v47, CFSTR("userFeedbacks"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedMemoryMetadata setUserFeedbacksDictionaryArray:](self, "setUserFeedbacksDictionaryArray:", v48);

      v7 = v6 != 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_metadataData
{
  void *v3;
  void *memory;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  PLMemory *v12;
  unint64_t v13;
  void *v14;
  PLMemory *v15;
  void *v16;
  void *v17;
  __int16 v18;
  void *v19;
  void *v20;
  __int16 v21;
  void *v22;
  void *v23;
  __int16 v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  PLMemory *v32;
  id v33;
  id v34;
  PLMemory *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  double v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  void *v99;
  int v100;
  void *v101;
  id v102;
  void *v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t i;
  void *v109;
  void *v110;
  NSObject *v111;
  void *v112;
  void *v113;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  uint8_t buf[4];
  void *v136;
  __int16 v137;
  void *v138;
  _BYTE v139[128];
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v3, "encodeInteger:forKey:", 2, CFSTR("version"));
  if (self->_memory)
    memory = self->_memory;
  else
    memory = self;
  objc_msgSend(memory, "uuid");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "encodeObject:forKey:", v5, CFSTR("uuid"));
  if (self->_memory)
    v6 = self->_memory;
  else
    v6 = self;
  objc_msgSend(v6, "title");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v3, "encodeObject:forKey:", v7, CFSTR("title"));
  if (self->_memory)
    v8 = self->_memory;
  else
    v8 = self;
  objc_msgSend(v8, "subtitle");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v3, "encodeObject:forKey:", v9, CFSTR("subtitle"));
  if (self->_memory)
    v10 = self->_memory;
  else
    v10 = self;
  objc_msgSend(v10, "creationDate");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v3, "encodeObject:forKey:", v11, CFSTR("creationDate"));
  v12 = self->_memory;
  v13 = 0x1E0CB3000uLL;
  if (v12)
  {
    if ((-[PLMemory rejected](v12, "rejected") & 1) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
  if (-[PLPersistedMemoryMetadata isRejected](self, "isRejected"))
  {
LABEL_23:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "encodeObject:forKey:", v14, CFSTR("isRejected"));

  }
LABEL_24:
  v15 = self->_memory;
  if (v15)
  {
    if ((-[PLMemory favorite](v15, "favorite") & 1) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
  if (-[PLPersistedMemoryMetadata isFavorite](self, "isFavorite"))
  {
LABEL_26:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "encodeObject:forKey:", v16, CFSTR("isFavorite"));

  }
LABEL_27:
  v17 = self->_memory;
  if (!v17)
    v17 = self;
  v18 = objc_msgSend(v17, "pendingState");
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "encodeObject:forKey:", v19, CFSTR("isPending"));

  }
  v20 = self->_memory;
  if (!v20)
    v20 = self;
  v21 = objc_msgSend(v20, "creationType");
  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "encodeObject:forKey:", v22, CFSTR("creationType"));

  }
  v23 = self->_memory;
  if (!v23)
    v23 = self;
  v24 = objc_msgSend(v23, "userActionOptions");
  if (v24)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "encodeObject:forKey:", v25, CFSTR("isUserCreated"));

  }
  if (self->_memory)
    v26 = self->_memory;
  else
    v26 = self;
  v27 = objc_msgSend(v26, "category");
  if ((_DWORD)v27)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "encodeObject:forKey:", v28, CFSTR("category"));

  }
  if (self->_memory)
    v29 = self->_memory;
  else
    v29 = self;
  v30 = objc_msgSend(v29, "subcategory");
  if ((_DWORD)v30)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "encodeObject:forKey:", v31, CFSTR("subcategory"));

  }
  v32 = self->_memory;
  if (v32)
  {
    -[PLMemory keyAsset](v32, "keyAsset");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "uuid");
    v34 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PLPersistedMemoryMetadata keyAssetUUID](self, "keyAssetUUID");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    v34 = v33;
  }

  if (v34)
    objc_msgSend(v3, "encodeObject:forKey:", v34, CFSTR("keyAssetUUID"));
  v35 = self->_memory;
  v123 = v34;
  v124 = v11;
  v130 = v5;
  v125 = v9;
  v126 = v7;
  if (v35)
  {
    -[PLMemory representativeAssets](v35, "representativeAssets");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "valueForKey:", CFSTR("uuid"));
    v37 = objc_claimAutoreleasedReturnValue();

    PLArchiveDataFromUUIDStringsSet();
    v38 = objc_claimAutoreleasedReturnValue();
    if (v38)
      objc_msgSend(v3, "encodeObject:forKey:", v38, CFSTR("representativeAssetUUIDs"));
    -[PLMemory curatedAssets](self->_memory, "curatedAssets");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "valueForKey:", CFSTR("uuid"));
    v40 = objc_claimAutoreleasedReturnValue();

    PLArchiveDataFromUUIDStringsSet();
    v41 = objc_claimAutoreleasedReturnValue();
    if (v41)
      objc_msgSend(v3, "encodeObject:forKey:", v41, CFSTR("curatedAssetUUIDs"));
    v121 = (void *)v41;
    -[PLMemory extendedCuratedAssets](self->_memory, "extendedCuratedAssets");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "valueForKey:", CFSTR("uuid"));
    v43 = objc_claimAutoreleasedReturnValue();

    PLArchiveDataFromUUIDStringsSet();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
      objc_msgSend(v3, "encodeObject:forKey:", v44, CFSTR("extendedCuratedAssetUUIDs"));
    v119 = (void *)v43;
    v129 = (void *)v38;
    -[PLMemory movieCuratedAssets](self->_memory, "movieCuratedAssets");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "valueForKey:", CFSTR("uuid"));
    v46 = objc_claimAutoreleasedReturnValue();

    v117 = (void *)v46;
    PLArchiveDataFromUUIDStringsSet();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
      objc_msgSend(v3, "encodeObject:forKey:", v47, CFSTR("movieCuratedAssetUUIDs"));
    v116 = (void *)v37;
    -[PLMemory userCuratedAssets](self->_memory, "userCuratedAssets");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "valueForKey:", CFSTR("uuid"));
    v49 = objc_claimAutoreleasedReturnValue();

    v50 = (void *)v49;
    PLArchiveDataFromUUIDStringsSet();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
      objc_msgSend(v3, "encodeObject:forKey:", v47, CFSTR("userCuratedAssetUUIDs"));
    v127 = (void *)v40;
    -[PLMemory userRemovedAssets](self->_memory, "userRemovedAssets");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "valueForKey:", CFSTR("uuid"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    PLArchiveDataFromUUIDStringsSet();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54)
      objc_msgSend(v3, "encodeObject:forKey:", v54, CFSTR("userRemovedAssetUUIDs"));
    -[PLMemory customUserAssets](self->_memory, "customUserAssets");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "valueForKey:", CFSTR("uuid"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
      objc_msgSend(v3, "encodeObject:forKey:", v56, CFSTR("customUserAssetUUIDs"));

    v13 = 0x1E0CB3000;
    v57 = v116;
    v59 = v127;
    v58 = v129;
    v60 = v119;
    v61 = v121;
  }
  else
  {
    -[PLPersistedMemoryMetadata representativeAssetUUIDs](self, "representativeAssetUUIDs");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    PLArchiveDataFromUUIDStringsSet();
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
      objc_msgSend(v3, "encodeObject:forKey:", v57, CFSTR("representativeAssetUUIDs"));
    -[PLPersistedMemoryMetadata curatedAssetUUIDs](self, "curatedAssetUUIDs");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    PLArchiveDataFromUUIDStringsSet();
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
      objc_msgSend(v3, "encodeObject:forKey:", v58, CFSTR("curatedAssetUUIDs"));
    -[PLPersistedMemoryMetadata extendedCuratedAssetUUIDs](self, "extendedCuratedAssetUUIDs");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    PLArchiveDataFromUUIDStringsSet();
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (v59)
      objc_msgSend(v3, "encodeObject:forKey:", v59, CFSTR("extendedCuratedAssetUUIDs"));
    -[PLPersistedMemoryMetadata movieCuratedAssetUUIDs](self, "movieCuratedAssetUUIDs");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    PLArchiveDataFromUUIDStringsSet();
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (v61)
      objc_msgSend(v3, "encodeObject:forKey:", v61, CFSTR("movieCuratedAssetUUIDs"));
    -[PLPersistedMemoryMetadata userCuratedAssetUUIDs](self, "userCuratedAssetUUIDs");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    PLArchiveDataFromUUIDStringsSet();
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
      objc_msgSend(v3, "encodeObject:forKey:", v60, CFSTR("userCuratedAssetUUIDs"));
    -[PLMemory customUserAssets](self->_memory, "customUserAssets");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "valueForKey:", CFSTR("uuid"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
      objc_msgSend(v3, "encodeObject:forKey:", v44, CFSTR("customUserAssetUUIDs"));
  }

  if (self->_memory)
    v68 = self->_memory;
  else
    v68 = self;
  objc_msgSend(v68, "movieData");
  v69 = (id)objc_claimAutoreleasedReturnValue();

  if (v69)
    objc_msgSend(v3, "encodeObject:forKey:", v69, CFSTR("movieData"));
  if (self->_memory)
    v70 = self->_memory;
  else
    v70 = self;
  objc_msgSend(v70, "movieAssetState");
  v71 = (id)objc_claimAutoreleasedReturnValue();

  if (v71)
    objc_msgSend(v3, "encodeObject:forKey:", v71, CFSTR("movieAssetState"));
  if (self->_memory)
    v72 = self->_memory;
  else
    v72 = self;
  v73 = objc_msgSend(v72, "photosGraphVersion");
  if (v73)
  {
    objc_msgSend(*(id *)(v13 + 2024), "numberWithLongLong:", v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "encodeObject:forKey:", v74, CFSTR("photosGraphVersion"));

  }
  if (self->_memory)
    v75 = self->_memory;
  else
    v75 = self;
  objc_msgSend(v75, "photosGraphData");
  v76 = (id)objc_claimAutoreleasedReturnValue();

  if (v76)
    objc_msgSend(v3, "encodeObject:forKey:", v76, CFSTR("photosGraphData"));
  if (self->_memory)
    v77 = self->_memory;
  else
    v77 = self;
  objc_msgSend(v77, "assetListPredicate");
  v78 = (id)objc_claimAutoreleasedReturnValue();

  if (v78)
    objc_msgSend(v3, "encodeObject:forKey:", v78, CFSTR("assetListPredicate"));
  if (self->_memory)
    v79 = self->_memory;
  else
    v79 = self;
  objc_msgSend(v79, "score");
  if (v80 != 0.0)
  {
    objc_msgSend(*(id *)(v13 + 2024), "numberWithDouble:");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "encodeObject:forKey:", v81, CFSTR("score"));

  }
  if (self->_memory)
    v82 = self->_memory;
  else
    v82 = self;
  v83 = objc_msgSend(v82, "notificationState");
  if ((_DWORD)v83)
  {
    objc_msgSend(*(id *)(v13 + 2024), "numberWithShort:", v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "encodeObject:forKey:", v84, CFSTR("notificationState"));

  }
  if (self->_memory)
    v85 = self->_memory;
  else
    v85 = self;
  objc_msgSend(v85, "blacklistedFeature");
  v86 = (id)objc_claimAutoreleasedReturnValue();

  if (v86)
    objc_msgSend(v3, "encodeObject:forKey:", v86, CFSTR("blacklistedFeature"));
  if (self->_memory)
    v87 = self->_memory;
  else
    v87 = self;
  v88 = objc_msgSend(v87, "playCount");
  if (v88)
    objc_msgSend(v3, "encodeInt64:forKey:", v88, CFSTR("playCount"));
  if (self->_memory)
    v89 = self->_memory;
  else
    v89 = self;
  v90 = objc_msgSend(v89, "shareCount");
  if (v90)
    objc_msgSend(v3, "encodeInt64:forKey:", v90, CFSTR("shareCount"));
  if (self->_memory)
    v91 = self->_memory;
  else
    v91 = self;
  v92 = objc_msgSend(v91, "viewCount");
  if (v92)
    objc_msgSend(v3, "encodeInt64:forKey:", v92, CFSTR("viewCount"));
  if (self->_memory)
    v93 = self->_memory;
  else
    v93 = self;
  v94 = objc_msgSend(v93, "pendingPlayCount");
  if (v94)
    objc_msgSend(v3, "encodeInt64:forKey:", v94, CFSTR("pendingPlayCount"));
  if (self->_memory)
    v95 = self->_memory;
  else
    v95 = self;
  v96 = objc_msgSend(v95, "pendingShareCount");
  if (v96)
    objc_msgSend(v3, "encodeInt64:forKey:", v96, CFSTR("pendingShareCount"));
  if (self->_memory)
    v97 = self->_memory;
  else
    v97 = self;
  v98 = objc_msgSend(v97, "pendingViewCount", v86);
  if (v98)
    objc_msgSend(v3, "encodeInt64:forKey:", v98, CFSTR("pendingViewCount"));
  v118 = v76;
  v120 = v71;
  v122 = v69;
  if (self->_memory)
    v99 = self->_memory;
  else
    v99 = self;
  v100 = objc_msgSend(v99, "featuredState");
  if (v100)
    objc_msgSend(v3, "encodeInt64:forKey:", v100, CFSTR("featuredState"));
  v128 = v3;
  if (self->_memory)
    v101 = self->_memory;
  else
    v101 = self;
  objc_msgSend(v101, "userFeedbacks");
  v102 = (id)objc_claimAutoreleasedReturnValue();

  v103 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v102, "count"));
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  v134 = 0u;
  v104 = v102;
  v105 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v131, v139, 16);
  if (v105)
  {
    v106 = v105;
    v107 = *(_QWORD *)v132;
    do
    {
      for (i = 0; i != v106; ++i)
      {
        if (*(_QWORD *)v132 != v107)
          objc_enumerationMutation(v104);
        v109 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * i);
        objc_msgSend(v109, "dictionaryRepresentation");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        if (v110)
        {
          objc_msgSend(v103, "addObject:", v110);
        }
        else
        {
          PLMigrationGetLog();
          v111 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v109, "uuid");
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v136 = v130;
            v137 = 2114;
            v138 = v112;
            _os_log_impl(&dword_199541000, v111, OS_LOG_TYPE_INFO, "Missing user feedback dictionary representation for memory %{public}@, userFeedback: %{public}@", buf, 0x16u);

          }
        }

      }
      v106 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v131, v139, 16);
    }
    while (v106);
  }

  if (objc_msgSend(v103, "count"))
    objc_msgSend(v128, "encodeObject:forKey:", v103, CFSTR("userFeedbacks"));
  objc_msgSend(v128, "encodedData");
  v113 = (void *)objc_claimAutoreleasedReturnValue();

  return v113;
}

- (void)_saveMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x19AEC1554](self, a2);
  -[PLPersistedMemoryMetadata _metadataData](self, "_metadataData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D73200];
  -[PLPersistedMemoryMetadata metadataURL](self, "metadataURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistMetadata:fileURL:", v4, v6);

  v7 = (void *)MEMORY[0x1E0D73208];
  -[PLPersistedMemoryMetadata metadataURL](self, "metadataURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changeFileOwnerToMobileAtPath:error:", v9, 0);

  objc_autoreleasePoolPop(v3);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (BOOL)isRejected
{
  return self->_rejected;
}

- (void)setRejected:(BOOL)a3
{
  self->_rejected = a3;
}

- (BOOL)isFavorite
{
  return self->_favorite;
}

- (void)setFavorite:(BOOL)a3
{
  self->_favorite = a3;
}

- (signed)pendingState
{
  return self->_pendingState;
}

- (void)setPendingState:(signed __int16)a3
{
  self->_pendingState = a3;
}

- (signed)creationType
{
  return self->_creationType;
}

- (void)setCreationType:(signed __int16)a3
{
  self->_creationType = a3;
}

- (signed)userActionOptions
{
  return self->_userActionOptions;
}

- (void)setUserActionOptions:(signed __int16)a3
{
  self->_userActionOptions = a3;
}

- (signed)category
{
  return self->_category;
}

- (void)setCategory:(signed __int16)a3
{
  self->_category = a3;
}

- (signed)subcategory
{
  return self->_subcategory;
}

- (void)setSubcategory:(signed __int16)a3
{
  self->_subcategory = a3;
}

- (NSString)keyAssetUUID
{
  return self->_keyAssetUUID;
}

- (void)setKeyAssetUUID:(id)a3
{
  objc_storeStrong((id *)&self->_keyAssetUUID, a3);
}

- (NSSet)representativeAssetUUIDs
{
  return self->_representativeAssetUUIDs;
}

- (void)setRepresentativeAssetUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_representativeAssetUUIDs, a3);
}

- (NSSet)curatedAssetUUIDs
{
  return self->_curatedAssetUUIDs;
}

- (void)setCuratedAssetUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_curatedAssetUUIDs, a3);
}

- (NSSet)extendedCuratedAssetUUIDs
{
  return self->_extendedCuratedAssetUUIDs;
}

- (void)setExtendedCuratedAssetUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_extendedCuratedAssetUUIDs, a3);
}

- (NSSet)movieCuratedAssetUUIDs
{
  return self->_movieCuratedAssetUUIDs;
}

- (void)setMovieCuratedAssetUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_movieCuratedAssetUUIDs, a3);
}

- (NSSet)userCuratedAssetUUIDs
{
  return self->_userCuratedAssetUUIDs;
}

- (void)setUserCuratedAssetUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_userCuratedAssetUUIDs, a3);
}

- (NSSet)userRemovedAssetUUIDs
{
  return self->_userRemovedAssetUUIDs;
}

- (void)setUserRemovedAssetUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_userRemovedAssetUUIDs, a3);
}

- (NSOrderedSet)customUserAssetUUIDs
{
  return self->_customUserAssetUUIDs;
}

- (void)setCustomUserAssetUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_customUserAssetUUIDs, a3);
}

- (NSData)movieData
{
  return self->_movieData;
}

- (void)setMovieData:(id)a3
{
  objc_storeStrong((id *)&self->_movieData, a3);
}

- (NSDictionary)movieAssetState
{
  return self->_movieAssetState;
}

- (void)setMovieAssetState:(id)a3
{
  objc_storeStrong((id *)&self->_movieAssetState, a3);
}

- (int64_t)photosGraphVersion
{
  return self->_photosGraphVersion;
}

- (void)setPhotosGraphVersion:(int64_t)a3
{
  self->_photosGraphVersion = a3;
}

- (NSData)photosGraphData
{
  return self->_photosGraphData;
}

- (void)setPhotosGraphData:(id)a3
{
  objc_storeStrong((id *)&self->_photosGraphData, a3);
}

- (NSData)assetListPredicate
{
  return self->_assetListPredicate;
}

- (void)setAssetListPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_assetListPredicate, a3);
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (signed)notificationState
{
  return self->_notificationState;
}

- (void)setNotificationState:(signed __int16)a3
{
  self->_notificationState = a3;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (NSData)blacklistedFeature
{
  return self->_blacklistedFeature;
}

- (void)setBlacklistedFeature:(id)a3
{
  objc_storeStrong((id *)&self->_blacklistedFeature, a3);
}

- (int64_t)playCount
{
  return self->_playCount;
}

- (void)setPlayCount:(int64_t)a3
{
  self->_playCount = a3;
}

- (int64_t)shareCount
{
  return self->_shareCount;
}

- (void)setShareCount:(int64_t)a3
{
  self->_shareCount = a3;
}

- (int64_t)viewCount
{
  return self->_viewCount;
}

- (void)setViewCount:(int64_t)a3
{
  self->_viewCount = a3;
}

- (int64_t)pendingPlayCount
{
  return self->_pendingPlayCount;
}

- (void)setPendingPlayCount:(int64_t)a3
{
  self->_pendingPlayCount = a3;
}

- (int64_t)pendingShareCount
{
  return self->_pendingShareCount;
}

- (void)setPendingShareCount:(int64_t)a3
{
  self->_pendingShareCount = a3;
}

- (int64_t)pendingViewCount
{
  return self->_pendingViewCount;
}

- (void)setPendingViewCount:(int64_t)a3
{
  self->_pendingViewCount = a3;
}

- (signed)featuredState
{
  return self->_featuredState;
}

- (void)setFeaturedState:(signed __int16)a3
{
  self->_featuredState = a3;
}

- (NSSet)userFeedbacks
{
  return self->_userFeedbacks;
}

- (void)setUserFeedbacks:(id)a3
{
  objc_storeStrong((id *)&self->_userFeedbacks, a3);
}

- (NSArray)userFeedbacksDictionaryArray
{
  return self->_userFeedbacksDictionaryArray;
}

- (void)setUserFeedbacksDictionaryArray:(id)a3
{
  objc_storeStrong((id *)&self->_userFeedbacksDictionaryArray, a3);
}

- (PLMemory)memory
{
  return self->_memory;
}

- (void)setMemory:(id)a3
{
  objc_storeStrong((id *)&self->_memory, a3);
}

- (NSURL)metadataURL
{
  return self->_metadataURL;
}

- (void)setMetadataURL:(id)a3
{
  objc_storeStrong((id *)&self->_metadataURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataURL, 0);
  objc_storeStrong((id *)&self->_memory, 0);
  objc_storeStrong((id *)&self->_userFeedbacksDictionaryArray, 0);
  objc_storeStrong((id *)&self->_userFeedbacks, 0);
  objc_storeStrong((id *)&self->_blacklistedFeature, 0);
  objc_storeStrong((id *)&self->_assetListPredicate, 0);
  objc_storeStrong((id *)&self->_photosGraphData, 0);
  objc_storeStrong((id *)&self->_movieAssetState, 0);
  objc_storeStrong((id *)&self->_movieData, 0);
  objc_storeStrong((id *)&self->_customUserAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_userRemovedAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_userCuratedAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_movieCuratedAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_extendedCuratedAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_curatedAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_representativeAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_keyAssetUUID, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (BOOL)isValidPath:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", PLMemoryMetadataExtension);

  return v4;
}

@end
