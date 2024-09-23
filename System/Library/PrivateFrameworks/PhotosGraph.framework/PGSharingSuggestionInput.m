@implementation PGSharingSuggestionInput

- (PGSharingSuggestionInput)initWithAssetLocalIdentifiers:(id)a3 momentLocalIdentifiers:(id)a4 graph:(id)a5 photoLibrary:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PGSharingSuggestionInput *v15;
  PGSharingSuggestionInput *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PGSharingSuggestionInput;
  v15 = -[PGSharingSuggestionInput init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_assetLocalIdentifiers, a3);
    objc_storeStrong((id *)&v16->_momentLocalIdentifiers, a4);
    objc_storeStrong((id *)&v16->_graph, a5);
    objc_storeStrong((id *)&v16->_photoLibrary, a6);
  }

  return v16;
}

- (PGSharingSuggestionInput)initWithMomentNodes:(id)a3
{
  id v4;
  PGSharingSuggestionInput *v5;
  uint64_t v6;
  NSArray *momentNodes;
  void *v8;
  uint64_t v9;
  PGGraph *graph;
  NSArray *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSArray *momentLocalIdentifiers;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PGSharingSuggestionInput;
  v5 = -[PGSharingSuggestionInput init](&v24, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    momentNodes = v5->_momentNodes;
    v5->_momentNodes = (NSArray *)v6;

    objc_msgSend(v4, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "graph");
    v9 = objc_claimAutoreleasedReturnValue();
    graph = v5->_graph;
    v5->_graph = (PGGraph *)v9;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = v4;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v16), "localIdentifier", (_QWORD)v20);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v14);
    }

    momentLocalIdentifiers = v5->_momentLocalIdentifiers;
    v5->_momentLocalIdentifiers = v11;

  }
  return v5;
}

- (NSArray)momentNodes
{
  NSArray *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSArray *momentLocalIdentifiers;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSArray *v23;
  NSArray *momentNodes;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  __int128 buf;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = self->_momentLocalIdentifiers;
  objc_sync_enter(v3);
  if (!self->_momentNodes)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_momentLocalIdentifiers, "count"));
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v5 = self->_momentLocalIdentifiers;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v27;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v27 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(MEMORY[0x1E0CD13B8], "uuidFromLocalIdentifier:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v8), (_QWORD)v26);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v6);
    }

    +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForArrayOfUUIDs:inGraph:", v4, self->_graph);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    if (v11 < objc_msgSend(v4, "count"))
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v4);
      objc_msgSend(v10, "uuids");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "minusSet:", v13);

      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "loggingConnection");
      v15 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v12;
        _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "[Sharing Suggestion] No moment nodes found for moment UUIDs %@", (uint8_t *)&buf, 0xCu);
      }

    }
    if (!objc_msgSend(v10, "count", (_QWORD)v26))
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "loggingConnection");
      v17 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        momentLocalIdentifiers = self->_momentLocalIdentifiers;
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = momentLocalIdentifiers;
        _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "[Sharing Suggestion] No moment nodes found for %@, graph might be out-of-date", (uint8_t *)&buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = v19;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalEndDate"), 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)&buf + 1) = v20;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &buf, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "sortedArrayUsingDescriptors:", v22);
    v23 = (NSArray *)objc_claimAutoreleasedReturnValue();
    momentNodes = self->_momentNodes;
    self->_momentNodes = v23;

  }
  objc_sync_exit(v3);

  return self->_momentNodes;
}

- (PHFetchResult)assets
{
  NSArray *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PHFetchResult *v8;
  PHFetchResult *assets;
  void *v10;
  NSObject *v11;
  PHFetchResult *v12;
  int v14;
  PHFetchResult *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = self->_assetLocalIdentifiers;
  objc_sync_enter(v3);
  if (!self->_assets && -[NSArray count](self->_assetLocalIdentifiers, "count"))
  {
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v5;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSortDescriptors:", v7);

    objc_msgSend(v4, "setIncludeGuestAssets:", 1);
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", self->_assetLocalIdentifiers, v4);
    v8 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
    assets = self->_assets;
    self->_assets = v8;

    if (!-[PHFetchResult count](self->_assets, "count"))
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "loggingConnection");
      v11 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = self->_assets;
        v14 = 138412290;
        v15 = v12;
        _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_INFO, "[Sharing Suggestion] No assets found for %@, photo library might be out-of-date", (uint8_t *)&v14, 0xCu);
      }

    }
  }
  objc_sync_exit(v3);

  return self->_assets;
}

- (PHFetchResult)moments
{
  NSArray *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PHFetchResult *v8;
  PHFetchResult *moments;
  void *v10;
  NSObject *v11;
  NSArray *momentLocalIdentifiers;
  int v14;
  NSArray *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = self->_momentLocalIdentifiers;
  objc_sync_enter(v3);
  if (!self->_moments)
  {
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v5;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSortDescriptors:", v7);

    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithLocalIdentifiers:options:", self->_momentLocalIdentifiers, v4);
    v8 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
    moments = self->_moments;
    self->_moments = v8;

    if (!-[PHFetchResult count](self->_moments, "count"))
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "loggingConnection");
      v11 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        momentLocalIdentifiers = self->_momentLocalIdentifiers;
        v14 = 138412290;
        v15 = momentLocalIdentifiers;
        _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_INFO, "[Sharing Suggestion] No moments found for %@, photo library might be out-of-date", (uint8_t *)&v14, 0xCu);
      }

    }
  }
  objc_sync_exit(v3);

  return self->_moments;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PGSharingSuggestionInput;
  -[PGSharingSuggestionInput description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - Number of moments: %lu (%@) - Number of assets: %lu (%@)"), v4, -[NSArray count](self->_momentLocalIdentifiers, "count"), self->_momentLocalIdentifiers, -[NSArray count](self->_assetLocalIdentifiers, "count"), self->_assetLocalIdentifiers);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PGGraph)graph
{
  return self->_graph;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_moments, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_momentLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_assetLocalIdentifiers, 0);
}

@end
