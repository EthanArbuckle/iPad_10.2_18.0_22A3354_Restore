@implementation PXDiscoveryFeedGenerationSession

- (PXDiscoveryFeedGenerationSession)initWithPhotoLibrary:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  PXDiscoveryFeedGenerationSession *v9;
  PXDiscoveryFeedGenerationSession *v10;
  uint64_t v11;
  PXDiscoveryFeedGenerationOptions *options;
  uint64_t v13;
  PLPhotoAnalysisServiceClient *photoAnalysisServiceClient;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXDiscoveryFeedGenerationSession;
  v9 = -[PXDiscoveryFeedGenerationSession init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    v11 = objc_msgSend(v8, "copy");
    options = v10->_options;
    v10->_options = (PXDiscoveryFeedGenerationOptions *)v11;

    if (-[PXDiscoveryFeedGenerationOptions usePhotoAnalysisdThroughXPC](v10->_options, "usePhotoAnalysisdThroughXPC"))
    {
      objc_msgSend(v7, "photoAnalysisClient");
      v13 = objc_claimAutoreleasedReturnValue();
      photoAnalysisServiceClient = v10->_photoAnalysisServiceClient;
      v10->_photoAnalysisServiceClient = (PLPhotoAnalysisServiceClient *)v13;

    }
  }

  return v10;
}

- (id)additionaItemsWithTargetCount:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  NSDictionary *v8;
  NSDictionary **p_sessionState;
  NSDictionary *sessionState;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  id v28;
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
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t m;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  PXDiscoveryFeedGenerationSession *v63;
  id obj;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  id v81;
  id v82;
  uint8_t buf[16];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _QWORD v88[3];
  _QWORD v89[5];

  v89[3] = *MEMORY[0x1E0C80C00];
  if (self->_photoAnalysisServiceClient)
  {
    v88[0] = *MEMORY[0x1E0D72078];
    -[PXDiscoveryFeedGenerationOptions dictionaryRepresentation](self->_options, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v89[0] = v5;
    v88[1] = *MEMORY[0x1E0D72070];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v88[2] = *MEMORY[0x1E0D72080];
    v63 = self;
    sessionState = self->_sessionState;
    p_sessionState = &self->_sessionState;
    v8 = sessionState;
    if (!sessionState)
      v8 = (NSDictionary *)MEMORY[0x1E0C9AA70];
    v89[1] = v6;
    v89[2] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, v88, 3);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = *(p_sessionState - 1);
    v81 = 0;
    v82 = 0;
    v61 = (void *)v11;
    objc_msgSend(v12, "requestDiscoveryFeedItemsWithOptions:generationSessionState:error:", v11, &v82, &v81);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v82;
    v58 = v82;
    v60 = v81;
    objc_storeStrong((id *)p_sessionState, v14);
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    obj = v13;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v78;
      v20 = *MEMORY[0x1E0D72060];
      v21 = *MEMORY[0x1E0D72058];
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v78 != v19)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
          objc_msgSend(v23, "objectForKeyedSubscript:", v20, v58, v60);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", v21);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "BOOLValue");

          if (v26)
            v27 = v15;
          else
            v27 = v16;
          objc_msgSend(v27, "addObject:", v24);

        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
      }
      while (v18);
    }

    v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v62 = v15;
    if (objc_msgSend(v15, "count"))
    {
      -[PHPhotoLibrary librarySpecificFetchOptions](v63->_photoLibrary, "librarySpecificFetchOptions");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithLocalIdentifiers:options:", v15, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v76 = 0u;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v74;
        do
        {
          for (j = 0; j != v32; ++j)
          {
            if (*(_QWORD *)v74 != v33)
              objc_enumerationMutation(v30);
            v35 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
            objc_msgSend(v35, "localIdentifier", v58);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v35, v36);

          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
        }
        while (v32);
      }

    }
    if (objc_msgSend(v16, "count", v58))
    {
      -[PHPhotoLibrary librarySpecificFetchOptions](v63->_photoLibrary, "librarySpecificFetchOptions");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v16, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v70;
        do
        {
          for (k = 0; k != v40; ++k)
          {
            if (*(_QWORD *)v70 != v41)
              objc_enumerationMutation(v38);
            v43 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * k);
            -[PXDiscoveryFeedGenerationSession _assetCollectionWithAsset:](v63, "_assetCollectionWithAsset:", v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "localIdentifier");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v44, v45);

          }
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
        }
        while (v40);
      }

    }
    v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v28, "count"));
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v47 = obj;
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v65, v84, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v66;
      v51 = *MEMORY[0x1E0D72060];
      do
      {
        for (m = 0; m != v49; ++m)
        {
          if (*(_QWORD *)v66 != v50)
            objc_enumerationMutation(v47);
          objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * m), "objectForKeyedSubscript:", v51);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "addObject:", v54);

        }
        v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v65, v84, 16);
      }
      while (v49);
    }

    v55 = objc_alloc(MEMORY[0x1E0CD1620]);
    v56 = (void *)objc_msgSend(v55, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v46, v63->_photoLibrary, *MEMORY[0x1E0CD1BB0], 0, 0, 1);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Not implemented yet, requires client-side PhotosGraph", buf, 2u);
    }
    v56 = 0;
  }
  return v56;
}

- (id)_assetCollectionWithAsset:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CD13B8];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transientAssetCollectionWithAssets:title:", v6, 0, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionState, 0);
  objc_storeStrong((id *)&self->_photoAnalysisServiceClient, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end
