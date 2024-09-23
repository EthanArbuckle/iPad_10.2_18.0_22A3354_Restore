@implementation PPConnectionsNamedEntitySource

- (PPConnectionsNamedEntitySource)initWithNamedEntityStore:(id)a3 contactStore:(id)a4
{
  id v7;
  id v8;
  PPConnectionsNamedEntitySource *v9;
  PPConnectionsNamedEntitySource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PPConnectionsNamedEntitySource;
  v9 = -[PPConnectionsNamedEntitySource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_namedEntityStore, a3);
    objc_storeStrong((id *)&v10->_contactStore, a4);
  }

  return v10;
}

- (id)identifier
{
  return CFSTR("namedentity");
}

- (id)locationItemsWithCriteria:(id)a3 earliest:(id)a4 latest:(id)a5 limit:(unint64_t)a6 consumer:(unint64_t)a7 explanationSet:(id)a8
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  PPLocalNamedEntityStore *namedEntityStore;
  NSObject *v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  uint64_t v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  NSObject *v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  NSObject *v58;
  id v59;
  uint64_t v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[4];
  id v71;
  id v72;
  PPConnectionsNamedEntitySource *v73;
  NSObject *v74;
  id v75;
  _BYTE v76[128];
  uint8_t v77[128];
  uint8_t buf[4];
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v56 = a8;
  if (objc_msgSend(v12, "locationField") == 1)
  {
    v15 = objc_opt_new();
    v16 = (void *)objc_opt_new();
    v17 = (void *)objc_opt_new();
    v18 = (void *)MEMORY[0x1C3BD6630]();
    v19 = objc_alloc(MEMORY[0x1E0C99E60]);
    v20 = (void *)objc_msgSend(v19, "initWithObjects:", *MEMORY[0x1E0D70E28], 0);
    objc_autoreleasePoolPop(v18);
    objc_msgSend(v17, "setMatchingSourceBundleIds:", v20);

    v21 = (void *)MEMORY[0x1C3BD6630]();
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E7E59E40, &unk_1E7E59E58, 0);
    objc_autoreleasePoolPop(v21);
    objc_msgSend(v17, "setMatchingCategories:", v22);

    objc_msgSend(v17, "setFromDate:", v13);
    namedEntityStore = self->_namedEntityStore;
    v75 = 0;
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __106__PPConnectionsNamedEntitySource_locationItemsWithCriteria_earliest_latest_limit_consumer_explanationSet___block_invoke;
    v70[3] = &unk_1E7E1DDF8;
    v71 = v12;
    v59 = v16;
    v72 = v59;
    v73 = self;
    v24 = (id)v15;
    v74 = v24;
    v55 = v17;
    LOBYTE(v15) = -[PPLocalNamedEntityStore iterNamedEntityRecordsWithQuery:error:block:](namedEntityStore, "iterNamedEntityRecordsWithQuery:error:block:", v17, &v75, v70);
    v25 = v75;
    v54 = v25;
    if ((v15 & 1) != 0)
    {
      v51 = v14;
      v52 = v13;
      v53 = v12;
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v50 = v24;
      v26 = v24;
      v27 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
      v28 = v59;
      if (v27)
      {
        v29 = v27;
        v30 = *(_QWORD *)v67;
        v57 = *(_QWORD *)v67;
        v58 = v26;
        do
        {
          v31 = 0;
          v60 = v29;
          do
          {
            if (*(_QWORD *)v67 != v30)
              objc_enumerationMutation(v26);
            v32 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v31);
            v33 = (void *)MEMORY[0x1C3BD6630]();
            objc_msgSend(v32, "documentID");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (v34)
            {
              objc_msgSend(v32, "documentID");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "objectForKeyedSubscript:", v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();

              if (v36)
              {
                v64 = 0u;
                v65 = 0u;
                v62 = 0u;
                v63 = 0u;
                v37 = v36;
                v38 = -[NSObject countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
                if (v38)
                {
                  v39 = v38;
                  v61 = v33;
                  v40 = *(_QWORD *)v63;
                  while (2)
                  {
                    for (i = 0; i != v39; ++i)
                    {
                      if (*(_QWORD *)v63 != v40)
                        objc_enumerationMutation(v37);
                      v42 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i);
                      objc_msgSend(v32, "value");
                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                      v44 = objc_msgSend(v43, "containsString:", v42);

                      if (v44)
                      {
                        objc_msgSend(v32, "setName:", v42);
                        objc_msgSend(v32, "setLabel:", v42);
                        goto LABEL_20;
                      }
                    }
                    v39 = -[NSObject countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
                    if (v39)
                      continue;
                    break;
                  }
LABEL_20:
                  v26 = v58;
                  v28 = v59;
                  v30 = v57;
                  v29 = v60;
                  v33 = v61;
                }
              }
              else
              {
                pp_connections_log_handle();
                v37 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v32, "originatingBundleID");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v79 = v45;
                  _os_log_impl(&dword_1C392E000, v37, OS_LOG_TYPE_DEFAULT, "PPConnectionsNamedEntitySource found a full address from %@ with no corresponding street value", buf, 0xCu);

                }
              }

            }
            objc_autoreleasePoolPop(v33);
            ++v31;
          }
          while (v31 != v29);
          v29 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
        }
        while (v29);
      }

      -[NSObject sortedArrayUsingComparator:](v26, "sortedArrayUsingComparator:", &__block_literal_global_19673);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v52;
      v12 = v53;
      v24 = v50;
      v14 = v51;
    }
    else
    {
      v47 = v25;
      pp_connections_log_handle();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v79 = v47;
        _os_log_error_impl(&dword_1C392E000, v48, OS_LOG_TYPE_ERROR, "PPConnectionsNamedEntitySource failed to load named entity records: %@", buf, 0xCu);
      }

      v46 = 0;
      v28 = v59;
    }

  }
  else
  {
    pp_connections_log_handle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v79) = objc_msgSend(v12, "locationField");
      _os_log_impl(&dword_1C392E000, v24, OS_LOG_TYPE_DEFAULT, "PPConnectionsNamedEntitySource: ignoring query for %hhu", buf, 8u);
    }
    v46 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v46;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_namedEntityStore, 0);
}

void __106__PPConnectionsNamedEntitySource_locationItemsWithCriteria_earliest_latest_limit_consumer_explanationSet___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
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
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  dispatch_semaphore_t v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  NSObject *v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  __int128 buf;
  void (*v74)(uint64_t, void *);
  void *v75;
  id v76;
  NSObject *v77;
  uint64_t *v78;
  id v79;
  _QWORD v80[2];

  v80[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    pp_connections_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEFAULT, "PPConnectionsNamedEntitySource ignoring extraction from the client", (uint8_t *)&buf, 2u);
    }
LABEL_4:

    goto LABEL_20;
  }
  objc_msgSend(v3, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "flags");

  if ((v11 & 1) != 0)
  {
    pp_connections_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEFAULT, "PPConnectionsNamedEntitySource ignoring extraction from outgoing message", (uint8_t *)&buf, 2u);
    }
    goto LABEL_4;
  }
  objc_msgSend(v3, "entity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "category");

  if (v13 == 8)
  {
    v14 = *(void **)(a1 + 40);
    objc_msgSend(v3, "source");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "documentId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      v18 = (void *)objc_opt_new();
      v19 = *(void **)(a1 + 40);
      objc_msgSend(v3, "source");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "documentId");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v21);

    }
    v22 = *(void **)(a1 + 40);
    objc_msgSend(v3, "source");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "documentId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "entity");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "name");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v27);

  }
  else
  {
    v28 = objc_alloc(MEMORY[0x1E0D70AF0]);
    objc_msgSend(v3, "source");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bundleId");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v28, "initWithOriginatingBundleID:", v30);

    objc_msgSend(v3, "entity");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "name");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setName:", v33);

    objc_msgSend(v3, "entity");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "name");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setLabel:", v35);

    objc_msgSend(v3, "entity");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "name");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setValue:", v37);

    objc_msgSend(v3, "entity");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "name");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setShortValue:", v39);

    objc_msgSend(v3, "source");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "documentId");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setDocumentID:", v41);

    objc_msgSend(v31, "setSource:", CFSTR("namedentity"));
    objc_msgSend(v3, "source");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "date");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setCreatedAt:", v43);

    v44 = (void *)MEMORY[0x1E0CB37E8];
    +[PPConnectionsParameters sharedInstance](PPConnectionsParameters, "sharedInstance");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "namedEntitySourceExpirySeconds");
    objc_msgSend(v44, "numberWithDouble:");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setLifetime:", v46);

    v47 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v3, "source");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "documentId");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "source");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "bundleId");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v48;
    v52 = v50;
    if (v47)
    {
      v67 = 0;
      v68 = &v67;
      v69 = 0x3032000000;
      v70 = __Block_byref_object_copy__19681;
      v71 = __Block_byref_object_dispose__19682;
      v72 = 0;
      v53 = dispatch_semaphore_create(0);
      objc_msgSend(MEMORY[0x1E0CA6B38], "defaultSearchableIndex");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v80[0] = *MEMORY[0x1E0CA6018];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v51;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v74 = __96__PPConnectionsNamedEntitySource__authorHandleForDocumentWithUniqueIdentifier_bundleIdentifier___block_invoke;
      v75 = &unk_1E7E1E320;
      v76 = v51;
      v78 = &v67;
      v57 = v53;
      v77 = v57;
      objc_msgSend(v54, "slowFetchAttributes:protectionClass:bundleID:identifiers:completionHandler:", v55, 0, v52, v56, &buf);

      dispatch_semaphore_wait(v57, 0xFFFFFFFFFFFFFFFFLL);
      v58 = (id)v68[5];

      _Block_object_dispose(&v67, 8);
    }
    else
    {
      v58 = 0;
    }

    objc_msgSend(v31, "setAuthorHandle:", v58);
    v59 = *(void **)(*(_QWORD *)(a1 + 48) + 24);
    objc_msgSend(v3, "source");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0;
    objc_msgSend(v59, "contactHandlesForSource:error:", v60, &v66);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v66;
    objc_msgSend(v31, "setContactHandles:", v61);

    objc_msgSend(v31, "contactHandles");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v60) = v63 == 0;

    if ((_DWORD)v60)
    {
      pp_connections_log_handle();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v62;
        _os_log_impl(&dword_1C392E000, v64, OS_LOG_TYPE_DEFAULT, "PPConnectionsNamedEntitySource: contactHandlesForSource failed: %@", (uint8_t *)&buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v31);

  }
LABEL_20:

}

uint64_t __106__PPConnectionsNamedEntitySource_locationItemsWithCriteria_earliest_latest_limit_consumer_explanationSet___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "createdAt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createdAt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __96__PPConnectionsNamedEntitySource__authorHandleForDocumentWithUniqueIdentifier_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  pp_connections_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(v3, "count");
    v6 = *(_QWORD *)(a1 + 32);
    v19 = 134218242;
    v20 = v5;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPConnectionsNamedEntitySource: Spotlight returned %tu attribute values for %@", (uint8_t *)&v19, 0x16u);
  }

  objc_msgSend(v3, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "firstObject");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      pp_connections_log_handle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(_QWORD *)(a1 + 32);
        v19 = 138412290;
        v20 = v17;
        _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEFAULT, "PPConnectionsNamedEntitySource: Spotlight returned unexpected data for %@", (uint8_t *)&v19, 0xCu);
      }
      goto LABEL_16;
    }
    -[NSObject firstObject](v8, "firstObject");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v9);
      pp_connections_log_handle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length");
        v12 = *(_QWORD *)(a1 + 32);
        v19 = 134218242;
        v20 = v11;
        v21 = 2112;
        v22 = v12;
        v13 = "PPConnectionsNamedEntitySource: found author handle length %tu for %@";
        v14 = v10;
        v15 = 22;
LABEL_14:
        _os_log_impl(&dword_1C392E000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v19, v15);
      }
    }
    else
    {
      pp_connections_log_handle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(a1 + 32);
        v19 = 138412290;
        v20 = v18;
        v13 = "PPConnectionsNamedEntitySource: Spotlight returned unexpected data for %@";
        v14 = v10;
        v15 = 12;
        goto LABEL_14;
      }
    }

LABEL_16:
    goto LABEL_17;
  }
  pp_connections_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(a1 + 32);
    v19 = 138412290;
    v20 = v16;
    _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEFAULT, "PPConnectionsNamedEntitySource: Spotlight returned unexpected data for %@", (uint8_t *)&v19, 0xCu);
  }
LABEL_17:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (PPConnectionsNamedEntitySource)sharedInstance
{
  void *v2;
  uint64_t v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  PPConnectionsNamedEntitySource *v7;
  void *v8;
  id v9;
  uint8_t v11[16];

  pthread_mutex_lock(&sharedInstance_lock_19699);
  if (!sharedInstance_instance_19700)
  {
    +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPLocalContactStore defaultStore](PPLocalContactStore, "defaultStore");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v2)
      v5 = v3 == 0;
    else
      v5 = 1;
    if (v5)
    {
      pp_connections_log_handle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_INFO, "PPConnectionsNamedEntitySource failed to get named entity and/or contact store instances. Device may be Class C locked.", v11, 2u);
      }

    }
    else
    {
      v7 = -[PPConnectionsNamedEntitySource initWithNamedEntityStore:contactStore:]([PPConnectionsNamedEntitySource alloc], "initWithNamedEntityStore:contactStore:", v2, v3);
      v8 = (void *)sharedInstance_instance_19700;
      sharedInstance_instance_19700 = (uint64_t)v7;

    }
  }
  v9 = (id)sharedInstance_instance_19700;
  pthread_mutex_unlock(&sharedInstance_lock_19699);
  return (PPConnectionsNamedEntitySource *)v9;
}

@end
