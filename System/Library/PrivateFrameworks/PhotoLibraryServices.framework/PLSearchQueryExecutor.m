@implementation PLSearchQueryExecutor

+ (id)searchResultForLookupIdentifier:(id)a3 searchResultTypes:(unint64_t)a4 plPhotoLibrary:(id)a5 searchIndex:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  PLSearchResultV2 *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  PLSearchResultV2 *v28;
  void *v30;
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (v12)
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSearchQueryExecutor.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lookupIdentifier"));

    }
    PLBackendGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_signpost_id_make_with_pointer(v14, a1);
    v16 = v14;
    v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_DWORD *)buf = 138412290;
      v32 = (uint64_t)v11;
      _os_signpost_emit_with_name_impl(&dword_199541000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PLSearchBackendLookupIdentifierQuery", "LookupIdentifier=%@", buf, 0xCu);
    }

    if (v13)
    {
      objc_msgSend(a1, "_querySearchIndex:lookupIdentifier:searchResultTypes:", v13, v11, a4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PLSearchBackendPhotoKitAPIGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Unable to execute query, failure to connect to search index.", buf, 2u);
      }

      objc_msgSend(v12, "assetsdClient");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "libraryInternalClient");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "waitForSearchIndexExistenceWithError:", 0);

      v18 = 0;
    }
    v24 = v17;
    v25 = v24;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      objc_msgSend(v18, "assetUUIDs");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");
      *(_DWORD *)buf = 134217984;
      v32 = v27;
      _os_signpost_emit_with_name_impl(&dword_199541000, v25, OS_SIGNPOST_INTERVAL_END, v15, "PLSearchBackendLookupIdentifierQuery", "Count=%lu", buf, 0xCu);

    }
    if (v18)
      v28 = v18;
    else
      v28 = objc_alloc_init(PLSearchResultV2);
    v20 = v28;

  }
  else
  {
    PLSearchBackendPhotoKitAPIGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Unable to execute query, photolibrary is nil.", buf, 2u);
    }

    v20 = objc_alloc_init(PLSearchResultV2);
  }

  return v20;
}

+ (id)_querySearchIndex:(id)a3 lookupIdentifier:(id)a4 searchResultTypes:(unint64_t)a5
{
  id v7;
  id v8;
  PLSearchProcessor *v9;
  void *v10;

  v7 = a4;
  v8 = a3;
  v9 = -[PLSearchProcessor initWithDatabase:]([PLSearchProcessor alloc], "initWithDatabase:", v8);
  -[PLSearchProcessor performQueryForLookupIdentifier:searchResultTypes:searchIndex:](v9, "performQueryForLookupIdentifier:searchResultTypes:searchIndex:", v7, a5, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
