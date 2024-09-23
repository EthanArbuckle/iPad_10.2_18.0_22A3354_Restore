@implementation PSIDisambiguationQuery

- (PSIDisambiguationQuery)initWithDisambiguation:(id)a3 photoLibrary:(id)a4 photosEntityStore:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  PSIDisambiguationQuery *v13;
  uint64_t v14;
  NSArray *disambiguations;
  PSIDisambiguationQuery *v16;
  void *v17;
  NSObject *v18;
  objc_super v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v9)
  {
    if (v11)
    {
LABEL_3:
      v20.receiver = self;
      v20.super_class = (Class)PSIDisambiguationQuery;
      v13 = -[PSIDisambiguationQuery init](&v20, sel_init);
      if (v13)
      {
        v21 = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
        v14 = objc_claimAutoreleasedReturnValue();
        disambiguations = v13->_disambiguations;
        v13->_disambiguations = (NSArray *)v14;

        objc_storeStrong((id *)&v13->_photosEntityStore, a5);
        objc_storeStrong((id *)&v13->_photoLibrary, a4);
      }
      self = v13;
      v16 = self;
      goto LABEL_10;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PSIDisambiguationQuery.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("disambiguation"));

    if (v12)
      goto LABEL_3;
  }
  PLSearchBackendQueryGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v9;
    _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Unexpected nil photos entity store, aborting initialization of disambiguation query: \"%@\", buf, 0xCu);
  }

  v16 = 0;
LABEL_10:

  return v16;
}

- (PSIDisambiguationQuery)initWithDisambiguations:(id)a3 photosEntityStore:(id)a4
{
  id v8;
  id v9;
  void *v10;
  PSIDisambiguationQuery *v11;
  id *p_isa;
  PSIDisambiguationQuery *v13;
  void *v14;
  NSObject *v15;
  objc_super v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
    {
LABEL_3:
      v17.receiver = self;
      v17.super_class = (Class)PSIDisambiguationQuery;
      v11 = -[PSIDisambiguationQuery init](&v17, sel_init);
      p_isa = (id *)&v11->super.isa;
      if (v11)
      {
        objc_storeStrong((id *)&v11->_disambiguations, a3);
        objc_storeStrong(p_isa + 2, a4);
      }
      self = p_isa;
      v13 = self;
      goto LABEL_10;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PSIDisambiguationQuery.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("disambiguations"));

    if (v10)
      goto LABEL_3;
  }
  PLSearchBackendQueryGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v8;
    _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Unexpected nil photos entity store, aborting initialization of disambiguation queries: %@", buf, 0xCu);
  }

  v13 = 0;
LABEL_10:

  return v13;
}

- (id)performDisambiguationQuery
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  unint64_t v30;
  os_signpost_id_t spid;
  NSObject *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint8_t v42[128];
  uint8_t buf[4];
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  PLPhotosSearchGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  v5 = v3;
  v6 = v5;
  v30 = v4 - 1;
  spid = v4;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PLSearchBackendQueryDisambiguationQuery", ", buf, 2u);
  }
  v32 = v6;

  -[PSIDisambiguationQuery disambiguations](self, "disambiguations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    -[PSIDisambiguationQuery photosEntityStore](self, "photosEntityStore");
    v8 = objc_claimAutoreleasedReturnValue();
    if (-[PSIDisambiguationQuery cancelled](self, "cancelled"))
    {
      PLSearchBackendQueryGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
LABEL_33:
        v13 = 0;
LABEL_34:

        goto LABEL_35;
      }
      *(_DWORD *)buf = 138412290;
      v44 = v7;
      v10 = "Disambiguation query cancelled for %@";
      v11 = v9;
      v12 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      objc_msgSend(v7, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "disambiguationType");

      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v16 = v7;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (!v17)
      {
LABEL_19:

        v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v20 = v16;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v21)
        {
          v22 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v34 != v22)
                objc_enumerationMutation(v20);
              v24 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
              v25 = (void *)MEMORY[0x19AEC1554]();
              -[PSIDisambiguationQuery _disambiguationResultWithDisambiguation:delegate:](self, "_disambiguationResultWithDisambiguation:delegate:", v24, v8);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject addObject:](v9, "addObject:", v26);

              objc_autoreleasePoolPop(v25);
            }
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          }
          while (v21);
        }

        v27 = v32;
        v28 = v27;
        if (v30 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v27))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_199541000, v28, OS_SIGNPOST_INTERVAL_END, spid, "PLSearchBackendQueryDisambiguationQuery", ", buf, 2u);
        }

        -[PSIDisambiguationQuery _consolidateDisambiguationResults:](self, "_consolidateDisambiguationResults:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      }
      v18 = *(_QWORD *)v38;
LABEL_13:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v38 != v18)
          objc_enumerationMutation(v16);
        if (v15 != objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v19), "disambiguationType"))
          break;
        if (v17 == ++v19)
        {
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
          if (v17)
            goto LABEL_13;
          goto LABEL_19;
        }
      }

      PLSearchBackendQueryGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        goto LABEL_33;
      *(_DWORD *)buf = 138412290;
      v44 = v16;
      v10 = "Disambiguation queries have different disambiguation type: %@";
      v11 = v9;
      v12 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_199541000, v11, v12, v10, buf, 0xCu);
    goto LABEL_33;
  }
  PLSearchBackendQueryGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "There is no disambiguations", buf, 2u);
  }
  v13 = 0;
LABEL_35:

  return v13;
}

- (id)_disambiguationResultWithDisambiguation:(id)a3 delegate:(id)a4
{
  PLDisambiguationResult *v6;
  id v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  PLDisambiguationResult *v21;
  id v22;
  id v23;
  PSIDisambiguationQuery *v24;
  id v25;
  id v26;
  PLDisambiguationResult *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  PLDisambiguationResult *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  PLDisambiguationResult *v45;
  NSObject *v46;
  PSIDisambiguationQuery *v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  PLDisambiguationResult *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = (PLDisambiguationResult *)a3;
  v7 = a4;
  v8 = -[PLDisambiguationResult disambiguationType](v6, "disambiguationType");
  v9 = +[PSIDisambiguationQuery useWildcardForDisambiguationType:](PSIDisambiguationQuery, "useWildcardForDisambiguationType:", v8);
  -[PLDisambiguationResult queryTerm](v6, "queryTerm");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lowercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSITokenizer fts5StringFromString:useWildcard:leadingAnchored:](PSITokenizer, "fts5StringFromString:useWildcard:leadingAnchored:", v11, v9, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLDisambiguationResult indexingCategories](v6, "indexingCategories");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "groupIdsMatchingString:categories:textIsSearchable:", v12, v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v14, 0);
  objc_msgSend(v7, "groupArraysFromGroupIdSets:dateFilter:searchResultTypes:progressBlock:", v15, 0, 1, &__block_literal_global_83731);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  if (-[PSIDisambiguationQuery cancelled](self, "cancelled"))
  {
    PLSearchBackendQueryGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      -[PLDisambiguationResult queryTerm](v6, "queryTerm");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v53 = v20;
      v54 = 2112;
      v55 = v6;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "Disambiguation query cancelled for query term: \"%@\" with result: %@", buf, 0x16u);

    }
    v21 = 0;
  }
  else
  {
    v40 = v16;
    v41 = v15;
    v42 = v14;
    v43 = v12;
    v22 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v23 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v24 = self;
    v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __75__PSIDisambiguationQuery__disambiguationResultWithDisambiguation_delegate___block_invoke_31;
    v44[3] = &unk_1E3673738;
    v51 = v8;
    v27 = v6;
    v45 = v27;
    v19 = v22;
    v46 = v19;
    v47 = v24;
    v48 = v23;
    v28 = v25;
    v49 = v28;
    v29 = v26;
    v50 = v29;
    v39 = v18;
    v30 = v18;
    v31 = v48;
    objc_msgSend(v30, "enumerateObjectsUsingBlock:", v44);
    v32 = [PLDisambiguationResult alloc];
    -[NSObject allObjects](v19, "allObjects");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "allObjects");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "count"))
      v35 = v28;
    else
      v35 = v29;
    v21 = -[PLDisambiguationResult initWithDisambiguation:personLookupIdentifiers:locationNames:genericLocationTuples:](v32, "initWithDisambiguation:personLookupIdentifiers:locationNames:genericLocationTuples:", v27, v33, v34, v35);

    PLSearchBackendQueryGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      -[PLDisambiguationResult queryTerm](v27, "queryTerm");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v53 = v37;
      v54 = 2112;
      v55 = v21;
      _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_DEFAULT, "Disambiguation query executed for query term: \"%@\" with result: %@", buf, 0x16u);

    }
    v14 = v42;
    v12 = v43;
    v16 = v40;
    v15 = v41;
    v18 = v39;
  }

  return v21;
}

- (void)cancel
{
  -[PSIDisambiguationQuery setCancelled:](self, "setCancelled:", 1);
}

- (void)setCancelled:(BOOL)a3
{
  PSIDisambiguationQuery *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_cancelled = a3;
  objc_sync_exit(obj);

}

- (BOOL)cancelled
{
  PSIDisambiguationQuery *v2;
  BOOL cancelled;

  v2 = self;
  objc_sync_enter(v2);
  cancelled = v2->_cancelled;
  objc_sync_exit(v2);

  return cancelled;
}

- (id)_consolidateDisambiguationResults:(id)a3
{
  id v3;
  uint64_t v4;
  PLDisambiguationResult *v5;
  PLDisambiguationResult *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PLDisambiguation *v22;
  void *v23;
  PLDisambiguation *v24;
  uint64_t v26;
  id v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_msgSend(v3, "count");
    objc_msgSend(v3, "firstObject");
    v5 = (PLDisambiguationResult *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4 != 1)
    {
      -[PLDisambiguationResult disambiguation](v5, "disambiguation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v7, "disambiguationType");

      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v27 = v3;
      obj = v3;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v30 != v14)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_msgSend(v16, "disambiguation");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "queryTerm");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v18);

            objc_msgSend(v16, "personLookupIdentifiers");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObjectsFromArray:", v19);

            objc_msgSend(v16, "locationNames");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObjectsFromArray:", v20);

            objc_msgSend(v16, "genericLocationTuples");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObjectsFromArray:", v21);

          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v13);
      }

      v22 = [PLDisambiguation alloc];
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[PLDisambiguation initWithQueryTerm:disambiguationType:](v22, "initWithQueryTerm:disambiguationType:", v23, v26);

      v6 = -[PLDisambiguationResult initWithDisambiguation:personLookupIdentifiers:locationNames:genericLocationTuples:]([PLDisambiguationResult alloc], "initWithDisambiguation:personLookupIdentifiers:locationNames:genericLocationTuples:", v24, v9, v10, v11);
      v3 = v27;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PSIDatabase)photosEntityStore
{
  return self->_photosEntityStore;
}

- (PLPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSArray)disambiguations
{
  return self->_disambiguations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disambiguations, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_photosEntityStore, 0);
}

void __75__PSIDisambiguationQuery__disambiguationResultWithDisambiguation_delegate___block_invoke_31(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  PLGenericLocationTuple *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PLGenericLocationTuple *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t);
  void *v39;
  id v40;
  id v41;
  id v42;
  uint8_t *v43;
  uint8_t buf[8];
  uint8_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v3 = a2;
  if (objc_msgSend(v3, "assetIds") && CFArrayGetCount((CFArrayRef)objc_msgSend(v3, "assetIds")) >= 1)
  {
    switch(*(_QWORD *)(a1 + 80))
    {
      case 0:
        PLSearchBackendQueryGetLog();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Disambiguation query unexpectedly has a disambiguation of undefined type", buf, 2u);
        }

        break;
      case 1:
        objc_msgSend(v3, "contentString");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "queryTerm");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);

        if (!v7)
        {
          v34 = *(void **)(a1 + 56);
          objc_msgSend(v3, "normalizedString");
          v35 = objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        }
        objc_msgSend(v3, "contentString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lowercaseString");
        v9 = (PLGenericLocationTuple *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "queryTerm");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lowercaseString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[PLGenericLocationTuple hasPrefix:](v9, "hasPrefix:", v11)
          || -[PLGenericLocationTuple containsString:](v9, "containsString:", v11))
        {
          v12 = *(void **)(a1 + 56);
          objc_msgSend(v3, "normalizedString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v13);

        }
        goto LABEL_31;
      case 2:
        v14 = [PLGenericLocationTuple alloc];
        objc_msgSend(v3, "normalizedString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "lookupIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[PLGenericLocationTuple initWithText:lookupIdentifier:indexCategory:](v14, "initWithText:lookupIdentifier:indexCategory:", v15, v16, (int)objc_msgSend(v3, "category"));

        objc_msgSend(v3, "contentString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "queryTerm");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "localizedCaseInsensitiveCompare:", v18);

        v20 = 72;
        if (!v19)
          v20 = 64;
        v21 = *(void **)(a1 + v20);
        goto LABEL_30;
      case 3:
        objc_msgSend(*(id *)(a1 + 32), "queryTerm");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "contentString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "localizedCaseInsensitiveCompare:", v23);

        if (v24)
        {
          if (objc_msgSend(v3, "category") != 1301 && objc_msgSend(v3, "category") != 1331)
          {
            *(_QWORD *)buf = 0;
            v45 = buf;
            v46 = 0x3032000000;
            v47 = __Block_byref_object_copy__83737;
            v48 = __Block_byref_object_dispose__83738;
            v49 = 0;
            objc_msgSend(v3, "contentString");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "lookupIdentifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 48), "photoLibrary");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (v27 && objc_msgSend(v26, "length"))
            {
              v36 = MEMORY[0x1E0C809B0];
              v37 = 3221225472;
              v38 = __75__PSIDisambiguationQuery__disambiguationResultWithDisambiguation_delegate___block_invoke_32;
              v39 = &unk_1E3676EC8;
              v40 = v26;
              v41 = v27;
              v43 = buf;
              v42 = v25;
              objc_msgSend(v41, "performBlockAndWait:", &v36);

            }
            objc_msgSend(*(id *)(a1 + 32), "queryTerm", v36, v37, v38, v39);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v28;
            if (*((_QWORD *)v45 + 5))
              v30 = (const __CFString *)*((_QWORD *)v45 + 5);
            else
              v30 = &stru_1E36789C0;
            v31 = objc_msgSend(v28, "localizedCaseInsensitiveCompare:", v30);

            if (!v31)
            {
              v32 = *(void **)(a1 + 40);
              objc_msgSend(v3, "lookupIdentifier");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "addObject:", v33);

            }
            _Block_object_dispose(buf, 8);

          }
        }
        else
        {
          v34 = *(void **)(a1 + 40);
          objc_msgSend(v3, "lookupIdentifier");
          v35 = objc_claimAutoreleasedReturnValue();
LABEL_29:
          v9 = (PLGenericLocationTuple *)v35;
          v21 = v34;
LABEL_30:
          objc_msgSend(v21, "addObject:", v9);
LABEL_31:

        }
        break;
      default:
        break;
    }
  }

}

void __75__PSIDisambiguationQuery__disambiguationResultWithDisambiguation_delegate___block_invoke_32(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[PLPerson fetchRequest](PLPerson, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setResultType:", 0);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("personUUID"), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v2, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 || !v7)
  {
    PLSearchBackendQueryGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Encountered error fetching persons for disambiguation: %@.", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v7, "displayName");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
      v9 = *(NSObject **)(a1 + 48);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v9);
  }

}

+ (BOOL)useWildcardForDisambiguationType:(unint64_t)a3
{
  return a3 != 1;
}

@end
