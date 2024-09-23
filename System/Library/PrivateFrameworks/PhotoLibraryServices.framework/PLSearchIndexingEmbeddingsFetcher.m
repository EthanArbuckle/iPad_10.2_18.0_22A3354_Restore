@implementation PLSearchIndexingEmbeddingsFetcher

- (PLSearchIndexingEmbeddingsFetcher)init
{
  PLSearchIndexingEmbeddingsFetcher *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *mutableEmbeddingsByUUID;
  NSError *prefetchError;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLSearchIndexingEmbeddingsFetcher;
  v2 = -[PLSearchIndexingEmbeddingsFetcher init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mutableEmbeddingsByUUID = v2->_mutableEmbeddingsByUUID;
    v2->_mutableEmbeddingsByUUID = v3;

    prefetchError = v2->_prefetchError;
    v2->_prefetchError = 0;

  }
  return v2;
}

- (void)prefetchEmbeddingsForAssets:(id)a3 indexingContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  int HasDomainAndCode;
  NSObject *v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  os_log_type_t v35;
  uint32_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSError *prefetchError;
  PLSearchIndexingEmbeddingsFetcher *v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[5];
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  const __CFString *v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  id v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((PLSearchSemanticSearchIndexingSupported() & 1) == 0)
  {
    PLSearchBackendModelTranslationGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v6;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEBUG, "Embedding donations not supported. Skipping embedding donation for assets: %@", buf, 0xCu);
    }
    goto LABEL_34;
  }
  v41 = self;
  v42 = v7;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v43 = v6;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
  v44 = v8;
  if (!v10)
  {
    v12 = 0;
    goto LABEL_21;
  }
  v11 = v10;
  v12 = 0;
  v13 = *(_QWORD *)v48;
  do
  {
    v14 = 0;
    do
    {
      if (*(_QWORD *)v48 != v13)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v14);
      objc_msgSend(v15, "mediaAnalysisAttributes", v41);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "mediaAnalysisVersion"))
        goto LABEL_10;
      objc_msgSend(v15, "mediaAnalysisAttributes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "mediaAnalysisImageVersion"))
      {

        v8 = v44;
LABEL_10:

LABEL_11:
        objc_msgSend(v15, "photoLibrary");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "pathManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "libraryURL");
        v20 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v21);

        v12 = v20;
        goto LABEL_12;
      }
      objc_msgSend(v15, "mediaAnalysisAttributes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "imageEmbeddingVersion");

      v8 = v44;
      if (v23)
        goto LABEL_11;
LABEL_12:
      ++v14;
    }
    while (v11 != v14);
    v24 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    v11 = v24;
  }
  while (v24);
LABEL_21:

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  +[PLMediaAnalysisEmbeddingSearch fetchEmbeddingsWithAssetUUIDs:photoLibraryURL:error:](PLMediaAnalysisEmbeddingSearch, "fetchEmbeddingsWithAssetUUIDs:photoLibraryURL:error:", v25, v12, &v46);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v46;
  v28 = v46;

  if (v26)
  {
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __81__PLSearchIndexingEmbeddingsFetcher_prefetchEmbeddingsForAssets_indexingContext___block_invoke;
    v45[3] = &unk_1E3666848;
    v45[4] = v41;
    objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v45);
    v7 = v42;
    v6 = v43;
    goto LABEL_33;
  }
  v29 = *MEMORY[0x1E0D74498];
  HasDomainAndCode = PLErrorOrUnderlyingErrorHasDomainAndCode();
  PLSearchBackendModelTranslationGetLog();
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = v31;
  v7 = v42;
  v6 = v43;
  if (HasDomainAndCode)
  {
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v33 = "Batch fetch embeddings API unsupported";
      v34 = v32;
      v35 = OS_LOG_TYPE_DEBUG;
      v36 = 2;
      goto LABEL_28;
    }
  }
  else if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v54 = v44;
    v55 = 2112;
    v56 = v28;
    v33 = "Error while fetching CSEmbeddings from MediaAnalysis for asset UUIDs: %{public}@, Error: %@";
    v34 = v32;
    v35 = OS_LOG_TYPE_ERROR;
    v36 = 22;
LABEL_28:
    _os_log_impl(&dword_199541000, v34, v35, v33, buf, v36);
  }

  if (v28)
  {
    objc_storeStrong((id *)&v41->_prefetchError, v27);
  }
  else
  {
    v37 = (void *)MEMORY[0x1E0CB35C8];
    v51 = *MEMORY[0x1E0CB2938];
    v52 = CFSTR("fetch embeddings failed with unknown error");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "errorWithDomain:code:userInfo:", v29, 46502, v38);
    v39 = objc_claimAutoreleasedReturnValue();
    prefetchError = v41->_prefetchError;
    v41->_prefetchError = (NSError *)v39;

  }
  v8 = v44;
LABEL_33:

LABEL_34:
}

- (id)embeddingForAsset:(id)a3 indexingContext:(id)a4 allowFetchIfMissing:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSError *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  NSError *prefetchError;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  _BYTE buf[24];
  void *v47;
  uint64_t *v48;
  uint64_t v49;

  v5 = a5;
  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((PLSearchSemanticSearchIndexingSupported() & 1) == 0)
  {
    PLSearchBackendModelTranslationGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v10;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEBUG, "Embedding donations not supported. Skipping embedding donation for asset UUID: %@", buf, 0xCu);
    }
    goto LABEL_10;
  }
  objc_msgSend(v8, "mediaAnalysisAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "mediaAnalysisVersion"))
  {
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(v8, "mediaAnalysisAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "mediaAnalysisImageVersion"))
  {

    goto LABEL_5;
  }
  objc_msgSend(v8, "mediaAnalysisAttributes");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "imageEmbeddingVersion");

  if (!v30)
  {
    PLSearchBackendModelTranslationGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v10;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEBUG, "MediaAnalysisVersion && MediaAnalysisImageVersion && ImageEmbeddingVersion are all 0 for asset UUID: %@. Skipping embedding fetch.", buf, 0xCu);
    }
LABEL_10:

    v16 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 46309, 0);
    v13 = (NSError *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "failureWithError:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
LABEL_6:
  -[NSMutableDictionary objectForKeyedSubscript:](self->_mutableEmbeddingsByUUID, "objectForKeyedSubscript:", v10);
  v13 = (NSError *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v17 = (void *)v14;
    goto LABEL_12;
  }
  v19 = *MEMORY[0x1E0D74498];
  if ((PLErrorOrUnderlyingErrorHasDomainAndCode() & 1) == 0 && !v5)
  {
    prefetchError = self->_prefetchError;
    if (prefetchError)
    {
      v13 = prefetchError;
    }
    else
    {
      v31 = (void *)MEMORY[0x1E0CB35C8];
      v44 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing CSEmbedding for asset UUID: %@"), v10);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v32;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "errorWithDomain:code:userInfo:", v19, 46502, v33);
      v13 = (NSError *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v40 = 0;
  v41 = &v40;
  v42 = 0x2050000000;
  v21 = (void *)getMADEmbeddingClass_softClass;
  v43 = getMADEmbeddingClass_softClass;
  if (!getMADEmbeddingClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getMADEmbeddingClass_block_invoke;
    v47 = &unk_1E3677580;
    v48 = &v40;
    __getMADEmbeddingClass_block_invoke((uint64_t)buf);
    v21 = (void *)v41[3];
  }
  v22 = objc_retainAutorelease(v21);
  _Block_object_dispose(&v40, 8);
  objc_msgSend(v8, "photoLibrary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "pathManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "libraryURL");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  objc_msgSend(v22, "fetchEmbeddingWithAssetUUID:photoLibraryURL:options:error:", v10, v25, 0, &v39);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v39;

  if (v27)
  {
    PLSearchBackendModelTranslationGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v26;
      *(_WORD *)&buf[22] = 2112;
      v47 = v27;
      _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "Error while fetching CSEmbedding from MediaAnalysis for asset UUID: %{public}@, MADEmbedding: %@, Error: %@", buf, 0x20u);
    }

  }
  objc_msgSend(v26, "csEmbedding");
  v13 = (NSError *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLSearchBackendModelTranslationGetLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v26;
      _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "Missing CSEmbedding for asset UUID: %{public}@, MADEmbedding: %@", buf, 0x16u);
    }

    v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing CSEmbedding for asset UUID: %@, MADEmbedding: %@"), v10, v26);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v36, *MEMORY[0x1E0CB2938]);

    objc_msgSend(v35, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0CB3388]);
    v37 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v19, 46502, v35);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "failureWithError:", v38);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_12:

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchError, 0);
  objc_storeStrong((id *)&self->_mutableEmbeddingsByUUID, 0);
}

void __81__PLSearchIndexingEmbeddingsFetcher_prefetchEmbeddingsForAssets_indexingContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "csEmbedding");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v6, v5);

}

@end
