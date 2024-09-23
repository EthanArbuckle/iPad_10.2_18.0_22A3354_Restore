@implementation PLEmbeddingQuery

- (PLEmbeddingQuery)initWithQueryText:(id)a3
{
  id v4;
  PLEmbeddingQuery *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  PLEmbeddingVectorGenerator *v9;
  PLEmbeddingVectorGenerator *embeddingVectorGenerator;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLEmbeddingQuery;
  v5 = -[PLEmbeddingQuery init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = &stru_1E36789C0;
    objc_storeStrong((id *)&v5->_queryText, v8);

    v9 = objc_alloc_init(PLEmbeddingVectorGenerator);
    embeddingVectorGenerator = v5->_embeddingVectorGenerator;
    v5->_embeddingVectorGenerator = v9;

  }
  return v5;
}

- (void)executeEmbeddingSearchQueryWithSimilarityThreshold:(double)a3 embeddingModelTypes:(id)a4 scopedAssetUUIDs:(id)a5 dateFilter:(id)a6 psiDatabase:(id)a7 photoLibrary:(id)a8 queryDepersonalization:(unint64_t)a9 enableRanking:(BOOL)a10 completion:(id)a11
{
  void (**v18)(id, _QWORD, void *);
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[5];
  id v50;
  id v51;
  id v52;
  double v53;
  _QWORD v54[5];
  id v55;
  _QWORD *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;
  _QWORD v62[8];
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;
  _QWORD v67[5];
  id v68;
  _QWORD v69[5];
  id v70;
  uint8_t buf[8];
  uint8_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  _BYTE v77[128];
  uint64_t v78;
  _QWORD v79[3];

  v79[1] = *MEMORY[0x1E0C80C00];
  v44 = a4;
  v40 = a5;
  v41 = a6;
  v43 = a7;
  v42 = a8;
  v18 = (void (**)(id, _QWORD, void *))a11;
  -[PLEmbeddingQuery queryText](self, "queryText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "length");

  if (v20)
  {
    if (objc_msgSend(v44, "count") != 1 || (objc_msgSend(v44, "containsIndex:", 0) & 1) == 0)
    {
      PLPhotosSearchGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Depersonalization type not supported for embedding type(s). Ignoring depersonalization request", buf, 2u);
      }

      a9 = 0;
    }
    *(_QWORD *)buf = 0;
    v72 = buf;
    v73 = 0x3032000000;
    v74 = __Block_byref_object_copy__56237;
    v75 = __Block_byref_object_dispose__56238;
    v76 = 0;
    v69[0] = 0;
    v69[1] = v69;
    v69[2] = 0x3032000000;
    v69[3] = __Block_byref_object_copy__56237;
    v69[4] = __Block_byref_object_dispose__56238;
    v70 = 0;
    v67[0] = 0;
    v67[1] = v67;
    v67[2] = 0x3032000000;
    v67[3] = __Block_byref_object_copy__56237;
    v67[4] = __Block_byref_object_dispose__56238;
    v68 = 0;
    v63 = 0;
    v64 = &v63;
    v65 = 0x2020000000;
    v66 = 0;
    -[PLEmbeddingQuery queryText](self, "queryText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x1E0C809B0];
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __192__PLEmbeddingQuery_executeEmbeddingSearchQueryWithSimilarityThreshold_embeddingModelTypes_scopedAssetUUIDs_dateFilter_psiDatabase_photoLibrary_queryDepersonalization_enableRanking_completion___block_invoke;
    v62[3] = &unk_1E366D010;
    v62[4] = v67;
    v62[5] = buf;
    v62[6] = v69;
    v62[7] = &v63;
    +[PLEmbeddingQueryParser parseQueryText:photoLibrary:dateFilter:psiDatabase:queryDepersonalization:completion:](PLEmbeddingQueryParser, "parseQueryText:photoLibrary:dateFilter:psiDatabase:queryDepersonalization:completion:", v22, v42, v41, v43, a9, v62);

    if (-[PLEmbeddingQuery isCancelled](self, "isCancelled"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41031, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2](v18, 0, v24);

LABEL_39:
      _Block_object_dispose(&v63, 8);
      _Block_object_dispose(v67, 8);

      _Block_object_dispose(v69, 8);
      _Block_object_dispose(buf, 8);

      goto LABEL_40;
    }
    v58 = 0;
    v59 = &v58;
    v60 = 0x2020000000;
    v61 = 0;
    v54[0] = v23;
    v54[1] = 3221225472;
    v54[2] = __192__PLEmbeddingQuery_executeEmbeddingSearchQueryWithSimilarityThreshold_embeddingModelTypes_scopedAssetUUIDs_dateFilter_psiDatabase_photoLibrary_queryDepersonalization_enableRanking_completion___block_invoke_2;
    v54[3] = &unk_1E366D038;
    v54[4] = self;
    v56 = v67;
    v57 = &v58;
    v39 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v55 = v39;
    objc_msgSend(v44, "enumerateIndexesUsingBlock:", v54);
    if (*((_BYTE *)v59 + 24))
    {
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v78 = *MEMORY[0x1E0CB2938];
      v79[0] = CFSTR("Error in generating the query vectors");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, &v78, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41003, v26);
      v27 = (id)objc_claimAutoreleasedReturnValue();

      v18[2](v18, 0, v27);
LABEL_38:

      _Block_object_dispose(&v58, 8);
      goto LABEL_39;
    }
    if (-[PLEmbeddingQuery isCancelled](self, "isCancelled"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41031, 0);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      v18[2](v18, 0, v27);
      goto LABEL_38;
    }
    v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v49[0] = v23;
    v49[1] = 3221225472;
    v49[2] = __192__PLEmbeddingQuery_executeEmbeddingSearchQueryWithSimilarityThreshold_embeddingModelTypes_scopedAssetUUIDs_dateFilter_psiDatabase_photoLibrary_queryDepersonalization_enableRanking_completion___block_invoke_11;
    v49[3] = &unk_1E366D060;
    v49[4] = self;
    v50 = v40;
    v51 = v39;
    v53 = a3;
    v27 = v28;
    v52 = v27;
    objc_msgSend(v43, "fetchEmbeddingsForModelTypes:assetUUID:withBatchHandler:", v44, 0, v49);
    if (-[PLEmbeddingQuery isCancelled](self, "isCancelled"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41031, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2](v18, 0, v29);
    }
    else
    {
      if (objc_msgSend(*((id *)v72 + 5), "count"))
      {
        v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v31 = v27;
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v77, 16);
        if (v32)
        {
          v33 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v32; ++i)
            {
              if (*(_QWORD *)v46 != v33)
                objc_enumerationMutation(v31);
              v35 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
              v36 = (void *)*((_QWORD *)v72 + 5);
              objc_msgSend(v35, "assetUUID");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v36) = objc_msgSend(v36, "containsObject:", v37);

              if ((_DWORD)v36)
                objc_msgSend(v30, "addObject:", v35);
            }
            v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v77, 16);
          }
          while (v32);
        }

        v27 = v30;
      }
      else if (*((_BYTE *)v64 + 24))
      {
        v18[2](v18, MEMORY[0x1E0C9AA60], 0);
LABEL_37:

        goto LABEL_38;
      }
      if (-[PLEmbeddingQuery isCancelled](self, "isCancelled"))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41031, 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v18[2](v18, 0, v29);
      }
      else
      {
        -[PLEmbeddingQuery _processSearchResults:embeddingModelTypes:sortAscending:](self, "_processSearchResults:embeddingModelTypes:sortAscending:", v27, v44, 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[PLEmbeddingQuery isCancelled](self, "isCancelled")
          || -[PLEmbeddingQuery isCancelled](self, "isCancelled"))
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41031, 0);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v18[2](v18, 0, v38);

        }
        else
        {
          ((void (**)(id, void *, void *))v18)[2](v18, v29, 0);
        }
      }
    }

    goto LABEL_37;
  }
  v18[2](v18, 0, 0);
LABEL_40:

}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (BOOL)_embeddingCompareObjectIsValidSearchResultForQuery:(id)a3 forEmbeddingCompareObject:(id *)a4 similarityThreshold:(double)a5
{
  double v6;

  objc_msgSend(*a4, "distanceToQueryVector:", a3);
  return v6 >= a5;
}

- (id)_processSearchResults:(id)a3 embeddingModelTypes:(id)a4 sortAscending:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    +[PLEmbeddingUtilities generateMappingOfEmbeddingCompareObjectsToAssetUUIDFromEmbeddingCompareObjects:](PLEmbeddingUtilities, "generateMappingOfEmbeddingCompareObjectsToAssetUUIDFromEmbeddingCompareObjects:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PLEmbeddingQuery isCancelled](self, "isCancelled"))
    {
      v11 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      +[PLEmbeddingUtilities averageTop:forEmbeddingCompareObjectsByAssetUUID:sortAscending:](PLEmbeddingUtilities, "averageTop:forEmbeddingCompareObjectsByAssetUUID:sortAscending:", objc_msgSend(v9, "count"), v10, v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PLEmbeddingQuery isCancelled](self, "isCancelled"))
      {
        v11 = (id)MEMORY[0x1E0C9AA60];
      }
      else
      {
        +[PLEmbeddingUtilities sortCompareObjects:sortAscending:](PLEmbeddingUtilities, "sortCompareObjects:sortAscending:", v12, v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[PLEmbeddingQuery isCancelled](self, "isCancelled"))
          v11 = (id)MEMORY[0x1E0C9AA60];
        else
          v11 = v13;

      }
    }

  }
  else
  {
    v11 = (id)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (NSString)queryText
{
  return self->_queryText;
}

- (PLEmbeddingVectorGenerator)embeddingVectorGenerator
{
  return self->_embeddingVectorGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddingVectorGenerator, 0);
  objc_storeStrong((id *)&self->_queryText, 0);
}

void __192__PLEmbeddingQuery_executeEmbeddingSearchQueryWithSimilarityThreshold_embeddingModelTypes_scopedAssetUUIDs_dateFilter_psiDatabase_photoLibrary_queryDepersonalization_enableRanking_completion___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4, char a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = *(_QWORD *)(a1[4] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v9;
  v20 = v9;

  v14 = *(_QWORD *)(a1[5] + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v10;
  v16 = v10;

  v17 = *(_QWORD *)(a1[6] + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v11;
  v19 = v11;

  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = a5;
}

void __192__PLEmbeddingQuery_executeEmbeddingSearchQueryWithSimilarityThreshold_embeddingModelTypes_scopedAssetUUIDs_dateFilter_psiDatabase_photoLibrary_queryDepersonalization_enableRanking_completion___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
    *a3 = 1;
  objc_msgSend(*(id *)(a1 + 32), "embeddingVectorGenerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "queryText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = 0;
  objc_msgSend(v6, "embeddingVectorForString:embeddingType:error:", v8, a2, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;
  if (!v7)

  if (v10 || !objc_msgSend(v9, "count"))
  {
    PLPhotosSearchGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v13 = v12;
      if (!v12)
      {
        objc_msgSend(*(id *)(a1 + 32), "queryText");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138412546;
      v18 = v10;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Error: %@ generating vector for query: %@", buf, 0x16u);
      if (!v12)

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *a3 = 1;
  }
  else
  {
    v14 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, v15);

  }
}

void __192__PLEmbeddingQuery_executeEmbeddingSearchQueryWithSimilarityThreshold_embeddingModelTypes_scopedAssetUUIDs_dateFilter_psiDatabase_photoLibrary_queryDepersonalization_enableRanking_completion___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    objc_msgSend(v5, "cancel");
  }
  else if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    v22 = v5;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (objc_msgSend(*(id *)(a1 + 40), "count"))
          {
            v13 = *(void **)(a1 + 40);
            objc_msgSend(v12, "assetUUID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v13) = objc_msgSend(v13, "containsObject:", v14);

            if (!(_DWORD)v13)
              continue;
          }
          v15 = *(void **)(a1 + 48);
          v16 = (void *)MEMORY[0x1E0CB37E8];
          v17 = v12;
          objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "modelType"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v20 = *(void **)(a1 + 32);
          v23 = v17;
          LODWORD(v18) = objc_msgSend(v20, "_embeddingCompareObjectIsValidSearchResultForQuery:forEmbeddingCompareObject:similarityThreshold:", v19, &v23, *(double *)(a1 + 64));
          v21 = v23;

          if ((_DWORD)v18)
            objc_msgSend(*(id *)(a1 + 56), "addObject:", v21);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v9);
    }

    v5 = v22;
  }

}

@end
