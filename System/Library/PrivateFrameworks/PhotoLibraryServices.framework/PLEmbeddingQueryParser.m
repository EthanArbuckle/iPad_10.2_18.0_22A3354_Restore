@implementation PLEmbeddingQueryParser

+ (void)parseQueryText:(id)a3 photoLibrary:(id)a4 dateFilter:(id)a5 psiDatabase:(id)a6 queryDepersonalization:(unint64_t)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  unint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  PLSearchBackendQueryGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v24 = v14;
    v25 = 2112;
    v26 = v15;
    v27 = 2048;
    v28 = a7;
    _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_INFO, "Query Depersonalization: Running depersonalization for queryText: %@, photoLibrary: %@, depersonalizationType: %tu", buf, 0x20u);
  }

  if (a7 == 1)
  {
    objc_msgSend(a1, "_searchParseQueryText:dateFilter:psiDatabase:completion:", v14, v16, v17, v18);
  }
  else if (!a7)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __111__PLEmbeddingQueryParser_parseQueryText_photoLibrary_dateFilter_psiDatabase_queryDepersonalization_completion___block_invoke;
    v20[3] = &unk_1E3676020;
    v22 = v18;
    v21 = v14;
    objc_msgSend(a1, "_searchParseQueryText:dateFilter:psiDatabase:completion:", v21, 0, v17, v20);

  }
}

+ (void)_searchParseQueryText:(id)a3 dateFilter:(id)a4 psiDatabase:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  BOOL v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void (**v48)(id, id, void *, void *, uint64_t);
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  uint64_t *v66;
  uint64_t *v67;
  uint64_t *v68;
  id v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;

  v11 = a3;
  v47 = a4;
  v12 = a5;
  v48 = (void (**)(id, id, void *, void *, uint64_t))a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLEmbeddingQueryParser.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryText"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLEmbeddingQueryParser.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("psiDatabase"));

LABEL_3:
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", v11);
  v80 = 0;
  v81 = &v80;
  v82 = 0x3032000000;
  v83 = __Block_byref_object_copy__95783;
  v84 = __Block_byref_object_dispose__95784;
  v85 = 0;
  v74 = 0;
  v75 = &v74;
  v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__95783;
  v78 = __Block_byref_object_dispose__95784;
  v79 = 0;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCE180]), "initWithUnit:", 0);
  objc_msgSend(v13, "setString:", v11);
  objc_msgSend(v13, "string");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  +[PLSearchIndexConfiguration locale](PLSearchIndexConfiguration, "locale");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "languageCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLNLP stopWordsForLanguageCode:](PLNLP, "stopWordsForLanguageCode:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_opt_new();
  v70 = 0;
  v71 = &v70;
  v72 = 0x2020000000;
  v73 = 0;
  v20 = MEMORY[0x1E0C809B0];
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __82__PLEmbeddingQueryParser__searchParseQueryText_dateFilter_psiDatabase_completion___block_invoke;
  v60[3] = &unk_1E3676088;
  v21 = v13;
  v61 = v21;
  v22 = v18;
  v62 = v22;
  v69 = a1;
  v23 = v12;
  v63 = v23;
  v24 = v19;
  v64 = v24;
  v66 = &v74;
  v25 = v11;
  v65 = v25;
  v67 = &v70;
  v68 = &v80;
  objc_msgSend(v21, "enumerateTokensInRange:usingBlock:", 0, v15, v60);
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 0;
  v26 = v47;
  if (v47)
  {
    objc_msgSend(v23, "fetchAssetUUIDsForDateFilter:", v47);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v27;
    v29 = (void *)MEMORY[0x1E0C9AA60];
    if (v27)
      v29 = (void *)v27;
    v30 = v29;

    v31 = objc_msgSend((id)v81[5], "count");
    v32 = v81;
    v33 = (void *)v81[5];
    if (v31)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v30);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "intersectSet:", v34);
    }
    else
    {
      if (v33)
      {
        v35 = v33;
        v36 = (void *)v32[5];
        v32[5] = (uint64_t)v35;
      }
      else
      {
        v37 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v36 = (void *)v81[5];
        v81[5] = (uint64_t)v37;
      }

      v38 = (void *)v81[5];
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v30);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "unionSet:", v34);
    }

    v26 = v47;
  }
  else
  {
    v51[0] = v20;
    v51[1] = 3221225472;
    v51[2] = __82__PLEmbeddingQueryParser__searchParseQueryText_dateFilter_psiDatabase_completion___block_invoke_43;
    v51[3] = &unk_1E36760B0;
    v53 = &v56;
    v52 = v46;
    v54 = &v70;
    v55 = &v80;
    objc_msgSend(a1, "_allowedAssetUUIDsForParsedDateInQuery:psiDatabase:resultsHandler:", v25, v23, v51);
    v30 = v52;
  }

  v49[0] = v20;
  v49[1] = 3221225472;
  v49[2] = __82__PLEmbeddingQueryParser__searchParseQueryText_dateFilter_psiDatabase_completion___block_invoke_2;
  v49[3] = &unk_1E36773C8;
  v39 = v46;
  v50 = v39;
  objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v49);
  v40 = (void *)objc_msgSend((id)v81[5], "copy");
  v41 = (void *)objc_msgSend((id)v75[5], "copy");
  if (*((_BYTE *)v71 + 24))
  {
    v42 = 1;
  }
  else
  {
    if (v26)
      v43 = 0;
    else
      v43 = *((_BYTE *)v57 + 24) == 0;
    v42 = !v43;
  }
  v48[2](v48, v39, v40, v41, v42);

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v70, 8);

  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v80, 8);

}

+ (void)_allowedAssetUUIDsForParsedDateInQuery:(id)a3 psiDatabase:(id)a4 resultsHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __92__PLEmbeddingQueryParser__allowedAssetUUIDsForParsedDateInQuery_psiDatabase_resultsHandler___block_invoke;
  v11[3] = &unk_1E36760D8;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  +[PLSearchTextQueryParser enumerateDatesForString:resultsHandler:](PLSearchTextQueryParser, "enumerateDatesForString:resultsHandler:", a3, v11);

}

+ (id)_fts5StringFromString:(id)a3
{
  return +[PSITokenizer fts5StringFromString:useWildcard:](PSITokenizer, "fts5StringFromString:useWildcard:", a3, 1);
}

void __92__PLEmbeddingQueryParser__allowedAssetUUIDsForParsedDateInQuery_psiDatabase_resultsHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;

  objc_msgSend(*(id *)(a1 + 32), "fetchAssetUUIDsForDateFilter:", a2);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = (void *)MEMORY[0x1E0C9AA60];
  if (v9)
    v11 = (void *)v9;
  v12 = v11;

  v13 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v13 + 16))(v13, v14, a3, a4);
  *a5 = 1;
}

void __82__PLEmbeddingQueryParser__searchParseQueryText_dateFilter_psiDatabase_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "substringWithRange:", a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 40);
  objc_msgSend(v7, "localizedLowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v8, "containsObject:", v9);

  if ((v8 & 1) != 0)
    goto LABEL_37;
  PLSearchBackendQueryGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v7;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "Query Depersonalization: Attempting to resolve: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 96), "_fts5StringFromString:", v7);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(*(id *)(a1 + 48), "groupIdsMatchingString:categories:textIsSearchable:");
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v11, 0);
  objc_msgSend(*(id *)(a1 + 48), "groupArraysFromGroupIdSets:dateFilter:searchResultTypes:progressBlock:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PLSearchIndexCategoriesForCategoryMask(1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  if (!v13)
  {
    v15 = 0;
    goto LABEL_31;
  }
  v14 = v13;
  v15 = 0;
  v16 = *(_QWORD *)v40;
  do
  {
    v17 = 0;
    do
    {
      if (*(_QWORD *)v40 != v16)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v17);
      if (objc_msgSend(v18, "category") == 1300)
      {
        v19 = *(void **)(a1 + 56);
        v20 = CFSTR("person");
        goto LABEL_13;
      }
      if (objc_msgSend(v18, "category") == 1330)
      {
        v19 = *(void **)(a1 + 56);
        v20 = CFSTR("pet");
LABEL_13:
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, v7);
        v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        objc_msgSend(v18, "lookupIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v22);

        if (!v15)
          goto LABEL_14;
        goto LABEL_15;
      }
      if (objc_msgSend(v18, "category") != 1000
        && objc_msgSend(v18, "category") != 1001
        && objc_msgSend(v18, "category") != 1100
        && objc_msgSend(v18, "category") != 1101)
      {
        if (!objc_msgSend(v37, "containsIndex:", (int)objc_msgSend(v18, "category")))
          goto LABEL_18;
        objc_msgSend(*(id *)(a1 + 64), "lowercaseString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "contentString");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "lowercaseString");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v25, "containsString:", v26);

        if (!v35)
          goto LABEL_18;
      }
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", CFSTR(" "), v7);
      if (!v15)
LABEL_14:
        v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
LABEL_15:
      objc_msgSend(*(id *)(a1 + 48), "assetUUIDsForAssetIDs:", objc_msgSend(v18, "assetIds"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "unionSet:", v23);
      PLSearchBackendQueryGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v44 = v7;
        v45 = 2112;
        v46 = v18;
        v47 = 2112;
        v48 = v23;
        _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_DEBUG, "Query Depersonalization: Found match for word: %@. PSIGroup: %@. AssetUUIDs: %@", buf, 0x20u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
LABEL_18:
      ++v17;
    }
    while (v14 != v17);
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    v14 = v27;
  }
  while (v27);
LABEL_31:

  v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  if (v28 || !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    if (v15)
      objc_msgSend(v28, "intersectSet:", v15);
  }
  else
  {
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v15);
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v31 = *(void **)(v30 + 40);
    *(_QWORD *)(v30 + 40) = v29;

  }
LABEL_37:

}

void __82__PLEmbeddingQueryParser__searchParseQueryText_dateFilter_psiDatabase_completion___block_invoke_43(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;

  v7 = a2;
  if (a4)
  {
    v14 = v7;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", a3, a4, &stru_1E36789C0);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      objc_msgSend(v9, "intersectSet:", v14);
    }
    else
    {
      if (v9)
      {
        v10 = v9;
        v11 = *(void **)(v8 + 40);
        *(_QWORD *)(v8 + 40) = v10;
      }
      else
      {
        v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v11 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = v12;
      }

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "unionSet:", v14);
    }
    v7 = v14;
  }

}

void __82__PLEmbeddingQueryParser__searchParseQueryText_dateFilter_psiDatabase_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "replaceOccurrencesOfString:withString:options:range:", v7, v6, 385, 0, objc_msgSend(v5, "length"));

}

uint64_t __111__PLEmbeddingQueryParser_parseQueryText_photoLibrary_dateFilter_psiDatabase_queryDepersonalization_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, a4, 0);
}

@end
