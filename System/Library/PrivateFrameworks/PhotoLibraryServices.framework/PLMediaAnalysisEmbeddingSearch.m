@implementation PLMediaAnalysisEmbeddingSearch

+ (unint64_t)_minimumNumberOfProbes
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("PLVectorSearchKitMinimumNumberOfProbes"));

  if (v3 <= 0)
    return 40;
  else
    return v3;
}

+ (double)_scalingFactorForNumberOfProbes
{
  void *v2;
  double v3;
  double v4;
  double result;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("PLVectorSearchKitScalingFactorForNumberOfProbes"));
  v4 = v3;

  result = 1.0;
  if (v4 > 0.0)
    return v4;
  return result;
}

+ (id)_numberOfProbesForEmbeddingSearchWithLimit:(int)a3
{
  uint64_t v5;
  double v6;
  double v7;

  v5 = objc_msgSend(a1, "_minimumNumberOfProbes");
  v6 = (double)a3 / 100.0;
  if (v6 >= (double)v5)
  {
    objc_msgSend(a1, "_scalingFactorForNumberOfProbes", v5);
    v5 = (uint64_t)(v6 * v7);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)searchWithEmbeddings:(id)a3 photoLibraryURL:(id)a4 searchOptions:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(a1, "_numberOfProbesForEmbeddingSearchWithLimit:", objc_msgSend(v10, "resultLimit"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_searchWithEmbeddings:photoLibraryURL:searchOptions:numberOfProbes:error:", v12, v11, v10, v13, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_searchWithEmbeddings:(id)a3 photoLibraryURL:(id)a4 searchOptions:(id)a5 numberOfProbes:(id)a6 error:(id *)a7
{
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t i;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  PLMediaAnalysisEmbeddingSearchResult *v30;
  void *v31;
  void *v32;
  PLMediaAnalysisEmbeddingSearchResult *v33;
  uint64_t k;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t m;
  void *v41;
  PLMediaAnalysisEmbeddingSearchResult *v42;
  void *v43;
  void *v44;
  PLMediaAnalysisEmbeddingSearchResult *v45;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  id obj;
  id obja;
  void *v56;
  uint64_t v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
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
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const __CFString *v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  uint8_t v87[128];
  __int128 buf;
  void (*v89)(uint64_t);
  void *v90;
  uint64_t *v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v49 = a3;
  v50 = a4;
  v51 = a5;
  v48 = a6;
  getMADEmbeddingClass();
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v78 = 0;
    v79 = &v78;
    v80 = 0x2050000000;
    v11 = (void *)getMADEmbeddingSearchOptionsClass_softClass;
    v81 = getMADEmbeddingSearchOptionsClass_softClass;
    if (!getMADEmbeddingSearchOptionsClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v89 = __getMADEmbeddingSearchOptionsClass_block_invoke;
      v90 = &unk_1E3677580;
      v91 = &v78;
      __getMADEmbeddingSearchOptionsClass_block_invoke((uint64_t)&buf);
      v11 = (void *)v79[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v78, 8);
    objc_msgSend(v12, "defaultOptions");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setResultLimit:", objc_msgSend(v51, "resultLimit"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v51, "assetUUIDsForPrefilter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setAssetUUIDs:", v13);
      if (objc_msgSend(v13, "count"))
      {
        PLBackendGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = objc_msgSend(v13, "count");
          LODWORD(buf) = 134217984;
          *(_QWORD *)((char *)&buf + 4) = v15;
          _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "[PLMediaAnalysisEmbeddingSearch] Using %lu assets for prefiltering", (uint8_t *)&buf, 0xCu);
        }

      }
    }
    v16 = objc_msgSend(v51, "fullScan");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v52, "setFullScan:", v16);
      if ((_DWORD)v16)
      {
        PLBackendGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "[PLMediaAnalysisEmbeddingSearch] Using full scan (brute force) for embedding search.", (uint8_t *)&buf, 2u);
        }

      }
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v51, "numConcurrentReaders");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setNumConcurrentReaders:", v18);

    }
    if (!(v16 & 1 | ((objc_opt_respondsToSelector() & 1) == 0)))
    {
      objc_msgSend(v52, "setNumberOfProbes:", v48);
      PLBackendGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v52, "numberOfProbes");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v20;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "[PLMediaAnalysisEmbeddingSearch] Using number of probes = %@", (uint8_t *)&buf, 0xCu);

      }
    }
    objc_msgSend(getMADEmbeddingClass(), "searchWithEmbeddings:photoLibraryURL:options:error:", v49, v50, v52, a7);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (a7)
    {
      v58 = 0;
      if (*a7 || !v47)
        goto LABEL_66;
    }
    else if (!v47)
    {
      v58 = 0;
LABEL_66:

LABEL_69:
      goto LABEL_70;
    }
    v58 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v47, "count"));
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    obj = v47;
    v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
    if (v60)
    {
      v57 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v60; ++i)
        {
          if (*(_QWORD *)v75 != v57)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v23, "count"));
          v72 = 0u;
          v73 = 0u;
          v70 = 0u;
          v71 = 0u;
          v25 = v23;
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
          if (v26)
          {
            v27 = *(_QWORD *)v71;
            do
            {
              for (j = 0; j != v26; ++j)
              {
                if (*(_QWORD *)v71 != v27)
                  objc_enumerationMutation(v25);
                v29 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
                v30 = [PLMediaAnalysisEmbeddingSearchResult alloc];
                objc_msgSend(v29, "assetUUID");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "distance");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = -[PLMediaAnalysisEmbeddingSearchResult initWithAssetUUID:distance:](v30, "initWithAssetUUID:distance:", v31, v32);
                objc_msgSend(v24, "addObject:", v33);

              }
              v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
            }
            while (v26);
          }

          objc_msgSend(v58, "addObject:", v24);
        }
        v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
      }
      while (v60);
    }

    goto LABEL_66;
  }
  getMADEmbeddingClass();
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(getMADEmbeddingClass(), "searchWithEmbeddings:photoLibraryURL:attributeFilters:limit:error:", v49, v50, 0, objc_msgSend(v51, "resultLimit"), a7);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v52, "count"));
    if (a7)
    {
      v58 = 0;
      if (*a7 || !v52)
        goto LABEL_68;
    }
    else if (!v52)
    {
      v58 = 0;
LABEL_68:

      goto LABEL_69;
    }
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    obja = v52;
    v61 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v66, v85, 16);
    if (v61)
    {
      v59 = *(id *)v67;
      do
      {
        for (k = 0; k != v61; ++k)
        {
          if (*(id *)v67 != v59)
            objc_enumerationMutation(obja);
          v35 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * k);
          v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v35, "count"));
          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          v37 = v35;
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v62, v84, 16);
          if (v38)
          {
            v39 = *(_QWORD *)v63;
            do
            {
              for (m = 0; m != v38; ++m)
              {
                if (*(_QWORD *)v63 != v39)
                  objc_enumerationMutation(v37);
                v41 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * m);
                v42 = [PLMediaAnalysisEmbeddingSearchResult alloc];
                objc_msgSend(v41, "stringIdentifier");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "value");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = -[PLMediaAnalysisEmbeddingSearchResult initWithAssetUUID:distance:](v42, "initWithAssetUUID:distance:", v43, v44);
                objc_msgSend(v36, "addObject:", v45);

              }
              v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v62, v84, 16);
            }
            while (v38);
          }

          objc_msgSend(v56, "addObject:", v36);
        }
        v61 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v66, v85, 16);
      }
      while (v61);
    }

    v58 = v56;
    goto LABEL_68;
  }
  if (a7)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v82 = *MEMORY[0x1E0CB2938];
    v83 = CFSTR("MediaAnalysis does not supported the expected SPI.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 46309, v53);
    v58 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v58 = 0;
  }
LABEL_70:

  return v58;
}

+ (BOOL)prewarmSearchWithConcurrencyLimit:(unint64_t)a3 photoLibraryURL:(id)a4 error:(id *)a5
{
  id v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  getMADEmbeddingClass();
  objc_opt_class();
  v8 = objc_opt_respondsToSelector();
  if ((v8 & 1) != 0)
  {
    objc_msgSend(getMADEmbeddingClass(), "prewarmSearchWithConcurrencyLimit:photoLibraryURL:error:", a3, v7, a5);
  }
  else if (a5)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0D74498];
    v13 = *MEMORY[0x1E0CB2938];
    v14[0] = CFSTR("MediaAnalysis does not support the expected search prewarming SPI.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 46309, v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8 & 1;
}

+ (id)fetchEmbeddingsWithAssetUUIDs:(id)a3 photoLibraryURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  getMADEmbeddingClass();
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(getMADEmbeddingClass(), "fetchEmbeddingsWithAssetUUIDs:photoLibraryURL:options:error:", v7, v8, 0, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a5)
    {
      v11 = 0;
      if (*a5 || !v9)
        goto LABEL_12;
    }
    else if (!v9)
    {
      v11 = 0;
      goto LABEL_12;
    }
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __86__PLMediaAnalysisEmbeddingSearch_fetchEmbeddingsWithAssetUUIDs_photoLibraryURL_error___block_invoke;
    v17[3] = &unk_1E3677558;
    v11 = v15;
    v18 = v11;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v17);

LABEL_12:
    goto LABEL_13;
  }
  if (a5)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0D74498];
    v19 = *MEMORY[0x1E0CB2938];
    v20[0] = CFSTR("MediaAnalysis does not supported the expected SPI.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 46309, v14);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v11 = 0;
LABEL_13:

  return v11;
}

void __86__PLMediaAnalysisEmbeddingSearch_fetchEmbeddingsWithAssetUUIDs_photoLibraryURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  PLMediaAnalysisEmbedding *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[PLMediaAnalysisEmbedding initWithMADEmbedding:]([PLMediaAnalysisEmbedding alloc], "initWithMADEmbedding:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);
}

@end
