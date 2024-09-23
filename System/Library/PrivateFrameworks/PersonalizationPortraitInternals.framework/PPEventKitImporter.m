@implementation PPEventKitImporter

- (PPEventKitImporter)initWithEventStore:(id)a3 namedEntityStore:(id)a4 locationStore:(id)a5 topicStore:(id)a6 urlStore:(id)a7 urlDissector:(id)a8 namedEntityDissector:(id)a9 dataDetectorMatchClass:(Class)a10 sqlDatabase:(id)a11
{
  id v17;
  id v18;
  PPEventKitImporter *v19;
  PPEventKitImporter *v20;
  void *v21;
  uint64_t v22;
  PPNamedEntityDissector *neDissector;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  PPEventKitImporter *v31;
  NSObject *v32;
  PPNamedEntityDissector *v34;
  SGURLDissector *urlDissector;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  objc_super v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  PPNamedEntityDissector *v48;
  __int16 v49;
  SGURLDissector *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v41 = a5;
  v40 = a6;
  v39 = a7;
  v38 = a11;
  v42.receiver = self;
  v42.super_class = (Class)PPEventKitImporter;
  v19 = -[PPEventKitImporter init](&v42, sel_init);
  v20 = v19;
  if (!v19)
    goto LABEL_14;
  v36 = v18;
  v37 = v17;
  objc_storeStrong((id *)&v19->_eventStore, a3);
  objc_storeStrong((id *)&v20->_namedEntityStore, a4);
  objc_storeStrong((id *)&v20->_locationStore, a5);
  objc_storeStrong((id *)&v20->_topicStore, a6);
  objc_storeStrong((id *)&v20->_urlStore, a7);
  objc_storeStrong((id *)&v20->_sqlDatabase, a11);
  v20->_dataDetectorMatchClass = (Class)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D19E88], "fullPipeline");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPNamedEntityDissector sharedInstance](PPNamedEntityDissector, "sharedInstance");
  v22 = objc_claimAutoreleasedReturnValue();
  neDissector = v20->_neDissector;
  v20->_neDissector = (PPNamedEntityDissector *)v22;

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(v21, "dissectors");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v44 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        v30 = (void *)MEMORY[0x1C3BD6630]();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_storeStrong((id *)&v20->_urlDissector, v29);
        objc_autoreleasePoolPop(v30);
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v26);
  }

  if (v20->_neDissector && v20->_urlDissector)
  {

    atomic_store(0, (unsigned __int8 *)&v20->_fullImportInProgress);
    v18 = v36;
    v17 = v37;
LABEL_14:
    v31 = v20;
    goto LABEL_18;
  }
  pp_default_log_handle();
  v32 = objc_claimAutoreleasedReturnValue();
  v18 = v36;
  v17 = v37;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
  {
    urlDissector = v20->_urlDissector;
    v34 = v20->_neDissector;
    *(_DWORD *)buf = 138412802;
    v48 = v34;
    v49 = 2112;
    v50 = urlDissector;
    v51 = 2112;
    v52 = v21;
    _os_log_fault_impl(&dword_1C392E000, v32, OS_LOG_TYPE_FAULT, "PPEventKitImporter failed to get all dissectors (%@ && %@) out of the pipeline: %@", buf, 0x20u);
  }

  v31 = 0;
LABEL_18:

  return v31;
}

- (id)importEventData
{
  return -[PPEventKitImporter importEventDataWithShouldContinueBlock:](self, "importEventDataWithShouldContinueBlock:", &__block_literal_global_22003);
}

- (id)importEventDataWithShouldContinueBlock:(id)a3
{
  unsigned int (**v4)(_QWORD);
  NSObject *v5;
  atomic_flag *p_fullImportInProgress;
  unsigned __int8 v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  PPLocalNamedEntityStore *namedEntityStore;
  uint64_t v14;
  BOOL v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  PPLocalLocationStore *locationStore;
  uint64_t v25;
  BOOL v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  PPLocalTopicStore *topicStore;
  uint64_t v32;
  BOOL v33;
  id v34;
  NSObject *v35;
  NSObject *v36;
  PPLocalEventStore *eventStore;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  id v43;
  _BYTE buf[24];
  void *v45;
  NSObject *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = (unsigned int (**)(_QWORD))a3;
  pp_default_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: importEventData", buf, 2u);
  }

  p_fullImportInProgress = &self->_fullImportInProgress;
  do
    v7 = __ldaxr((unsigned __int8 *)p_fullImportInProgress);
  while (__stlxr(1u, (unsigned __int8 *)p_fullImportInProgress));
  if ((v7 & 1) == 0)
  {
    if ((+[PPEventKitImporter _shouldImport]() & 1) != 0)
    {
      pp_default_log_handle();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      v10 = (uint64_t *)MEMORY[0x1E0D70DC0];
      if (v9)
      {
        v11 = *MEMORY[0x1E0D70DC0];
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 129600;
        _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: beginning import of named entities and URLs from %@, looking ahead %d seconds", buf, 0x12u);
      }

      if (self)
      {
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -2592000.0);
        namedEntityStore = self->_namedEntityStore;
        v14 = *v10;
        v43 = 0;
        v15 = -[PPLocalNamedEntityStore deleteAllNamedEntitiesFromSourcesWithBundleId:groupId:olderThan:deletedCount:error:](namedEntityStore, "deleteAllNamedEntitiesFromSourcesWithBundleId:groupId:olderThan:deletedCount:error:", v14, 0, v12, 0, &v43);
        v16 = v43;
        pp_default_log_handle();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v15)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v12;
            _os_log_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: deleted old named entities (before %@)", buf, 0xCu);
          }
        }
        else
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v16;
            _os_log_error_impl(&dword_1C392E000, v18, OS_LOG_TYPE_ERROR, "PPEventKitImporter: failed to delete old named entities: %@", buf, 0xCu);
          }

          +[PPMetricsUtils loggingQueue](PPMetricsUtils, "loggingQueue");
          v22 = objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __40__PPEventKitImporter__deleteOldEntities__block_invoke;
          v45 = &unk_1E7E1F4F0;
          v46 = v16;
          dispatch_async(v22, buf);

          v18 = v46;
        }

      }
      if (!v4[2](v4))
        goto LABEL_44;
      if (self)
      {
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -2592000.0);
        locationStore = self->_locationStore;
        v25 = *v10;
        v43 = 0;
        v26 = -[PPLocalLocationStore deleteAllLocationsFromSourcesWithBundleId:groupId:olderThan:deletedCount:error:](locationStore, "deleteAllLocationsFromSourcesWithBundleId:groupId:olderThan:deletedCount:error:", v25, 0, v23, 0, &v43);
        v27 = v43;
        pp_default_log_handle();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v26)
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v23;
            _os_log_impl(&dword_1C392E000, v29, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: deleted old locations (before %@)", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v27;
          _os_log_error_impl(&dword_1C392E000, v29, OS_LOG_TYPE_ERROR, "PPEventKitImporter: failed to delete old locations: %@", buf, 0xCu);
        }

      }
      if (!v4[2](v4))
        goto LABEL_44;
      if (self)
      {
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -2592000.0);
        topicStore = self->_topicStore;
        v32 = *v10;
        v43 = 0;
        v33 = -[PPLocalTopicStore deleteAllTopicsFromSourcesWithBundleId:groupId:olderThan:deletedCount:error:](topicStore, "deleteAllTopicsFromSourcesWithBundleId:groupId:olderThan:deletedCount:error:", v32, 0, v30, 0, &v43);
        v34 = v43;
        pp_default_log_handle();
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = v35;
        if (v33)
        {
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v30;
            _os_log_impl(&dword_1C392E000, v36, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: deleted old topics (before %@)", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v34;
          _os_log_error_impl(&dword_1C392E000, v36, OS_LOG_TYPE_ERROR, "PPEventKitImporter: failed to delete old topics: %@", buf, 0xCu);
        }

      }
      if (!v4[2](v4))
      {
LABEL_44:
        v20 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_45;
      }
      v21 = objc_opt_new();
      eventStore = self->_eventStore;
      -[NSObject dateByAddingTimeInterval:](v21, "dateByAddingTimeInterval:", 129600.0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPLocalEventStore eventsFromDate:toDate:](eventStore, "eventsFromDate:toDate:", v21, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      -[PPEventKitImporter _importEvents:]((uint64_t)self, v39);
      objc_msgSend(v39, "_pas_mappedArrayWithTransform:", &__block_literal_global_62);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPEventKitImporter _flush]((uint64_t)self);
      pp_default_log_handle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = objc_msgSend(v39, "count");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v41;
        _os_log_impl(&dword_1C392E000, v40, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: completed import of %tu events", buf, 0xCu);
      }

    }
    else
    {
      pp_default_log_handle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v21, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: importEventData disabled due to settings", buf, 2u);
      }
      v20 = (void *)MEMORY[0x1E0C9AA60];
    }

LABEL_45:
    atomic_store(0, (unsigned __int8 *)p_fullImportInProgress);
    goto LABEL_46;
  }
  pp_default_log_handle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v19, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: full import already in progress when importEventData called.", buf, 2u);
  }

  v20 = (void *)MEMORY[0x1E0C9AA60];
LABEL_46:

  return v20;
}

- (void)importChangedEvents:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  PPLocalNamedEntityStore *namedEntityStore;
  uint64_t v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  PPLocalLocationStore *locationStore;
  BOOL v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  PPLocalTopicStore *topicStore;
  BOOL v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  NSObject *v43;
  PPEventKitImporter *v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint8_t block[8];
  uint64_t v50;
  void (*v51)(uint64_t);
  void *v52;
  NSObject *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  NSObject *v58;
  id v59;
  id v60;
  uint64_t v61;
  __int128 buf;
  void (*v63)(uint64_t);
  void *v64;
  NSObject *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pp_default_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "first");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: importing %tu changed events", (uint8_t *)&buf, 0xCu);

  }
  objc_msgSend(v4, "second");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (self && objc_msgSend(v8, "count"))
  {
    objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_134);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0;
    namedEntityStore = self->_namedEntityStore;
    v12 = *MEMORY[0x1E0D70DC0];
    v60 = 0;
    v48 = v12;
    v13 = -[PPLocalNamedEntityStore deleteAllNamedEntitiesFromSourcesWithBundleId:documentIds:deletedCount:error:](namedEntityStore, "deleteAllNamedEntitiesFromSourcesWithBundleId:documentIds:deletedCount:error:");
    v14 = v60;
    pp_default_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (!v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v14;
        _os_log_error_impl(&dword_1C392E000, v16, OS_LOG_TYPE_ERROR, "PPEventKitImporter: failed to delete named entities: %@", (uint8_t *)&buf, 0xCu);
      }

      +[PPMetricsUtils loggingQueue](PPMetricsUtils, "loggingQueue");
      v37 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v63 = __53__PPEventKitImporter__deleteExtractionsForObjectIDs___block_invoke_135;
      v64 = &unk_1E7E1F4F0;
      v24 = v14;
      v65 = v24;
      dispatch_async(v37, &buf);

      v21 = v65;
      goto LABEL_39;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v61;
      _os_log_debug_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEBUG, "PPEventKitImporter: deleted %tu named entities", (uint8_t *)&buf, 0xCu);
    }

    locationStore = self->_locationStore;
    v59 = v14;
    v47 = v10;
    v18 = -[PPLocalLocationStore deleteAllLocationsFromSourcesWithBundleId:documentIds:deletedCount:error:](locationStore, "deleteAllLocationsFromSourcesWithBundleId:documentIds:deletedCount:error:", v48, v10, &v61, &v59);
    v19 = v59;

    pp_default_log_handle();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v18)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = v61;
        _os_log_debug_impl(&dword_1C392E000, v21, OS_LOG_TYPE_DEBUG, "PPEventKitImporter: deleted %tu locations", (uint8_t *)&buf, 0xCu);
      }

      topicStore = self->_topicStore;
      v58 = v19;
      v23 = -[PPLocalTopicStore deleteAllTopicsFromSourcesWithBundleId:documentIds:deletedCount:error:](topicStore, "deleteAllTopicsFromSourcesWithBundleId:documentIds:deletedCount:error:", v48, v47, &v61, &v58);
      v24 = v58;

      pp_default_log_handle();
      v25 = objc_claimAutoreleasedReturnValue();
      v21 = v25;
      if (v23)
      {
        v43 = v24;
        v44 = self;
        v45 = v4;
        v46 = v7;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buf) = 134217984;
          *(_QWORD *)((char *)&buf + 4) = v61;
          _os_log_debug_impl(&dword_1C392E000, v21, OS_LOG_TYPE_DEBUG, "PPEventKitImporter: deleted %tu topics", (uint8_t *)&buf, 0xCu);
        }

        v21 = objc_opt_new();
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v26 = v9;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v54, &buf, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v55;
          do
          {
            for (i = 0; i != v28; ++i)
            {
              if (*(_QWORD *)v55 != v29)
                objc_enumerationMutation(v26);
              v31 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
              v32 = (void *)MEMORY[0x1C3BD6630]();
              objc_msgSend(v31, "URIRepresentation");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "absoluteString");
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              if (v34)
              {
                +[PPEventKitImporter _escapedDomainIdentifierForIdentifier:]((uint64_t)PPEventKitImporter, v34);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject addDomain:](v21, "addDomain:", v35);

              }
              objc_autoreleasePoolPop(v32);
            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v54, &buf, 16);
          }
          while (v28);
        }

        v7 = v46;
        if ((objc_msgSend(MEMORY[0x1E0D19EA8], "deleteAllURLsWithBundleIdentifier:domainSelection:entityStore:", v48, v21, 0) & 1) != 0)
        {
          self = v44;
          -[PPEventKitImporter _flush]((uint64_t)v44);
          pp_default_log_handle();
          v36 = objc_claimAutoreleasedReturnValue();
          v4 = v45;
          v10 = v47;
          v24 = v43;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)block = 0;
            _os_log_impl(&dword_1C392E000, v36, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: deleted some extractions", block, 2u);
          }
        }
        else
        {
          pp_default_log_handle();
          v38 = objc_claimAutoreleasedReturnValue();
          self = v44;
          v4 = v45;
          v10 = v47;
          v24 = v43;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)block = 0;
            _os_log_error_impl(&dword_1C392E000, v38, OS_LOG_TYPE_ERROR, "PPEventKitImporter: failed to delete URLs", block, 2u);
          }

          +[PPMetricsUtils loggingQueue](PPMetricsUtils, "loggingQueue");
          v39 = objc_claimAutoreleasedReturnValue();
          *(_QWORD *)block = MEMORY[0x1E0C809B0];
          v50 = 3221225472;
          v51 = __53__PPEventKitImporter__deleteExtractionsForObjectIDs___block_invoke_139;
          v52 = &unk_1E7E1F4F0;
          v53 = v43;
          dispatch_async(v39, block);

          v36 = v53;
        }

        goto LABEL_39;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v24;
        _os_log_error_impl(&dword_1C392E000, v21, OS_LOG_TYPE_ERROR, "PPEventKitImporter: failed to delete topics: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v19;
        _os_log_error_impl(&dword_1C392E000, v21, OS_LOG_TYPE_ERROR, "PPEventKitImporter: failed to delete locations: %@", (uint8_t *)&buf, 0xCu);
      }
      v24 = v19;
    }
    v10 = v47;
LABEL_39:

  }
  if ((+[PPEventKitImporter _shouldImport]() & 1) == 0)
  {
    pp_default_log_handle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1C392E000, v42, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: importEvent disabled due to settings", (uint8_t *)&buf, 2u);
    }
    goto LABEL_45;
  }
  objc_msgSend(v4, "first");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "count");

  if (v41)
  {
    objc_msgSend(v4, "first");
    v42 = objc_claimAutoreleasedReturnValue();
    -[PPEventKitImporter _importEvents:]((uint64_t)self, v42);
LABEL_45:

  }
}

- (void)importEvent:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((+[PPEventKitImporter _shouldImport]() & 1) != 0)
  {
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = objc_claimAutoreleasedReturnValue();
    -[PPEventKitImporter _importEvents:]((uint64_t)self, v5);
  }
  else
  {
    pp_default_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: importEvent disabled due to settings", v6, 2u);
    }
  }

}

- (BOOL)deleteAndReimportAllData
{
  uint64_t *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  PPLocalNamedEntityStore *namedEntityStore;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  PPLocalLocationStore *locationStore;
  PPEventKitImporter *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  PPLocalTopicStore *topicStore;
  PPEventKitImporter *v29;
  id v30;
  NSObject *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  PPLocalNamedEntityStore *v46;
  uint64_t v47;
  BOOL v48;
  id v49;
  PPLocalLocationStore *v50;
  BOOL v51;
  NSObject *v52;
  PPLocalTopicStore *v53;
  BOOL v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  void (*v59)(uint64_t);
  NSObject *v60;
  id v61;
  void *v62;
  void *v63;
  NSObject *v64;
  id v65;
  id v66;
  void *v67;
  NSObject *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t i;
  uint64_t v73;
  void *v74;
  PPLocalEventStore *eventStore;
  void *v76;
  void *v77;
  id v78;
  id v79;
  void *v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  NSObject *v88;
  id v90;
  id v91;
  void *v92;
  uint64_t v93;
  void *obj;
  id obja;
  void *v96;
  NSObject *v97;
  void *v98;
  void *v99;
  _QWORD v100[4];
  id v101;
  id v102;
  id v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  NSObject *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  PPEventKitImporter *v112;
  uint64_t v113;
  NSObject *v114;
  id v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _BYTE v120[12];
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 buf;
  uint64_t (*v126)(uint64_t, uint64_t);
  void *v127;
  id v128;
  id v129;
  __int128 block;
  void (*v131)(uint64_t);
  void *v132;
  NSObject *v133;
  uint64_t v134;

  v134 = *MEMORY[0x1E0C80C00];
  v93 = os_transaction_create();
  v3 = (uint64_t *)MEMORY[0x1E0D70DC0];
  v4 = MEMORY[0x1E0C809B0];
  if (self)
  {
    -[PPEventKitImporter _timeRangeForReimport]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v6 = objc_claimAutoreleasedReturnValue();
    obj = v5;
    objc_msgSend(v5, "endDate");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_new();
    v9 = (void *)objc_opt_new();
    v10 = (void *)MEMORY[0x1C3BD6630]();
    v11 = objc_alloc(MEMORY[0x1E0C99E60]);
    v12 = *v3;
    v13 = (void *)objc_msgSend(v11, "initWithObjects:", *v3, 0);
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v9, "setMatchingSourceBundleIds:", v13);

    v98 = (void *)v6;
    objc_msgSend(v9, "setFromDate:", v6);
    v96 = (void *)v7;
    objc_msgSend(v9, "setToDate:", v7);
    objc_msgSend(v9, "setFilterByRelevanceDate:", 1);
    namedEntityStore = self->_namedEntityStore;
    *(_QWORD *)v120 = 0;
    *(_QWORD *)&v116 = v4;
    *((_QWORD *)&v116 + 1) = 3221225472;
    *(_QWORD *)&v117 = __49__PPEventKitImporter__eventIdentifiersToReimport__block_invoke;
    *((_QWORD *)&v117 + 1) = &unk_1E7E1F540;
    v15 = (id)v8;
    *(_QWORD *)&v118 = v15;
    LOBYTE(v8) = -[PPLocalNamedEntityStore iterNamedEntityRecordsWithQuery:error:block:](namedEntityStore, "iterNamedEntityRecordsWithQuery:error:block:", v9, v120, &v116);
    v16 = *(id *)v120;
    if ((v8 & 1) == 0)
    {
      pp_default_log_handle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LODWORD(block) = 138412290;
        *(_QWORD *)((char *)&block + 4) = v16;
        _os_log_error_impl(&dword_1C392E000, v17, OS_LOG_TYPE_ERROR, "PPEventKitImporter: _eventIdentifiersToReimport: error from NE store: %@", (uint8_t *)&block, 0xCu);
      }

    }
    v18 = (void *)objc_opt_new();
    v19 = (void *)MEMORY[0x1C3BD6630]();
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v12, 0);
    objc_autoreleasePoolPop(v19);
    objc_msgSend(v18, "setMatchingSourceBundleIds:", v20);

    objc_msgSend(v18, "setFromDate:", v98);
    objc_msgSend(v18, "setToDate:", v7);
    objc_msgSend(v18, "setFilterByRelevanceDate:", 1);
    locationStore = self->_locationStore;
    v103 = v16;
    v108 = v4;
    v109 = 3221225472;
    v110 = __49__PPEventKitImporter__eventIdentifiersToReimport__block_invoke_118;
    v111 = &unk_1E7E1FED0;
    v22 = (PPEventKitImporter *)v15;
    v112 = v22;
    LOBYTE(locationStore) = -[PPLocalLocationStore iterLocationRecordsWithQuery:error:block:](locationStore, "iterLocationRecordsWithQuery:error:block:", v18, &v103, &v108);
    v23 = v103;

    if ((locationStore & 1) == 0)
    {
      pp_default_log_handle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        LODWORD(block) = 138412290;
        *(_QWORD *)((char *)&block + 4) = v23;
        _os_log_error_impl(&dword_1C392E000, v24, OS_LOG_TYPE_ERROR, "PPEventKitImporter: _eventIdentifiersToReimport: error from Location store: %@", (uint8_t *)&block, 0xCu);
      }

    }
    v25 = (void *)objc_opt_new();
    v26 = (void *)MEMORY[0x1C3BD6630]();
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v12, 0);
    objc_autoreleasePoolPop(v26);
    objc_msgSend(v25, "setMatchingSourceBundleIds:", v27);

    objc_msgSend(v25, "setFromDate:", v98);
    objc_msgSend(v25, "setToDate:", v7);
    objc_msgSend(v25, "setFilterByRelevanceDate:", 1);
    topicStore = self->_topicStore;
    v102 = v23;
    *(_QWORD *)&v104 = v4;
    *((_QWORD *)&v104 + 1) = 3221225472;
    *(_QWORD *)&v105 = __49__PPEventKitImporter__eventIdentifiersToReimport__block_invoke_121;
    *((_QWORD *)&v105 + 1) = &unk_1E7E1F568;
    v29 = v22;
    *(_QWORD *)&v106 = v29;
    LOBYTE(topicStore) = -[PPLocalTopicStore iterTopicRecordsWithQuery:error:block:](topicStore, "iterTopicRecordsWithQuery:error:block:", v25, &v102, &v104);
    v30 = v102;

    if ((topicStore & 1) == 0)
    {
      pp_default_log_handle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        LODWORD(block) = 138412290;
        *(_QWORD *)((char *)&block + 4) = v30;
        _os_log_error_impl(&dword_1C392E000, v31, OS_LOG_TYPE_ERROR, "PPEventKitImporter: _eventIdentifiersToReimport: error from Topic store: %@", (uint8_t *)&block, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0D19EA8], "urlsFoundBetweenStartDate:endDate:bundleIdentifier:entityStore:", v98, v7, v12, self->_urlStore);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = 0u;
    v122 = 0u;
    v123 = 0u;
    v124 = 0u;
    v33 = v32;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v121, &block, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v122;
      do
      {
        v37 = 0;
        do
        {
          if (*(_QWORD *)v122 != v36)
            objc_enumerationMutation(v33);
          objc_msgSend(*(id *)(*((_QWORD *)&v121 + 1) + 8 * v37), "groupIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (v38)
          {
            v39 = (void *)MEMORY[0x1C3BD6630]();
            objc_msgSend(v38, "stringByRemovingPercentEncoding");
            v40 = (id)objc_claimAutoreleasedReturnValue();
            if (!v40)
            {
              pp_default_log_handle();
              v41 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
              {
                LODWORD(buf) = 138412290;
                *(_QWORD *)((char *)&buf + 4) = v38;
                _os_log_fault_impl(&dword_1C392E000, v41, OS_LOG_TYPE_FAULT, "PPEventKitImporter: failed to remove percent encoding from %@", (uint8_t *)&buf, 0xCu);
              }

              v40 = v38;
            }
            -[PPEventKitImporter addObject:](v29, "addObject:", v40);

            objc_autoreleasePoolPop(v39);
          }

          ++v37;
        }
        while (v35 != v37);
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v121, &block, 16);
      }
      while (v35);
    }

    pp_default_log_handle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = -[PPEventKitImporter count](v29, "count");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v43;
      _os_log_impl(&dword_1C392E000, v42, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: documentIds to reimport count: %tu", (uint8_t *)&buf, 0xCu);
    }

    -[PPEventKitImporter _pas_mappedSetWithTransform:](v29, "_pas_mappedSetWithTransform:", &__block_literal_global_126_21967);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = MEMORY[0x1E0C809B0];
    v3 = (uint64_t *)MEMORY[0x1E0D70DC0];
  }
  else
  {
    v44 = 0;
  }
  pp_default_log_handle();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(block) = 138412290;
    *(_QWORD *)((char *)&block + 4) = v44;
    _os_log_debug_impl(&dword_1C392E000, v45, OS_LOG_TYPE_DEBUG, "PPEventKitImporter: deleteAndReimportAllData will reimport %@", (uint8_t *)&block, 0xCu);
  }

  if (self)
  {
    v46 = self->_namedEntityStore;
    v47 = *v3;
    *(_QWORD *)&v121 = 0;
    v48 = -[PPLocalNamedEntityStore deleteAllNamedEntitiesFromSourcesWithBundleId:deletedCount:error:](v46, "deleteAllNamedEntitiesFromSourcesWithBundleId:deletedCount:error:", v47, 0, &v121);
    v49 = (id)v121;
    if (v48)
    {
      if ((objc_msgSend(MEMORY[0x1E0D19EA8], "deleteAllURLsWithBundleIdentifier:entityStore:", v47, 0) & 1) != 0)
      {
        v50 = self->_locationStore;
        *(_QWORD *)&v116 = v49;
        v51 = -[PPLocalLocationStore deleteAllLocationsFromSourcesWithBundleId:deletedCount:error:](v50, "deleteAllLocationsFromSourcesWithBundleId:deletedCount:error:", v47, 0, &v116);
        v52 = (id)v116;

        if (v51)
        {
          v53 = self->_topicStore;
          v108 = v52;
          v54 = -[PPLocalTopicStore deleteAllTopicsFromSourcesWithBundleId:deletedCount:error:](v53, "deleteAllTopicsFromSourcesWithBundleId:deletedCount:error:", v47, 0, &v108);
          v55 = v108;

          if (v54)
          {
            -[PPEventKitImporter _flush]((uint64_t)self);
            pp_default_log_handle();
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(block) = 0;
              _os_log_impl(&dword_1C392E000, v56, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: deleted all extractions", (uint8_t *)&block, 2u);
            }
          }
          else
          {
            pp_default_log_handle();
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            {
              LODWORD(block) = 138412290;
              *(_QWORD *)((char *)&block + 4) = v55;
              _os_log_error_impl(&dword_1C392E000, v56, OS_LOG_TYPE_ERROR, "PPEventKitImporter: failed to delete all topics: %@", (uint8_t *)&block, 0xCu);
            }
          }
          v52 = v55;
        }
        else
        {
          pp_default_log_handle();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            LODWORD(block) = 138412290;
            *(_QWORD *)((char *)&block + 4) = v52;
            _os_log_error_impl(&dword_1C392E000, v56, OS_LOG_TYPE_ERROR, "PPEventKitImporter: failed to delete all locations: %@", (uint8_t *)&block, 0xCu);
          }
        }
        goto LABEL_46;
      }
      pp_default_log_handle();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        LOWORD(block) = 0;
        _os_log_error_impl(&dword_1C392E000, v60, OS_LOG_TYPE_ERROR, "PPEventKitImporter: failed to delete all URLs", (uint8_t *)&block, 2u);
      }

      +[PPMetricsUtils loggingQueue](PPMetricsUtils, "loggingQueue");
      v58 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&block = v4;
      *((_QWORD *)&block + 1) = 3221225472;
      v59 = __43__PPEventKitImporter__deleteAllExtractions__block_invoke_144;
    }
    else
    {
      pp_default_log_handle();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        LODWORD(block) = 138412290;
        *(_QWORD *)((char *)&block + 4) = v49;
        _os_log_error_impl(&dword_1C392E000, v57, OS_LOG_TYPE_ERROR, "PPEventKitImporter: failed to delete all named entities: %@", (uint8_t *)&block, 0xCu);
      }

      +[PPMetricsUtils loggingQueue](PPMetricsUtils, "loggingQueue");
      v58 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&block = v4;
      *((_QWORD *)&block + 1) = 3221225472;
      v59 = __43__PPEventKitImporter__deleteAllExtractions__block_invoke;
    }
    v131 = v59;
    v132 = &unk_1E7E1F4F0;
    v52 = v49;
    v133 = v52;
    dispatch_async(v58, &block);

    v56 = v133;
LABEL_46:

  }
  v61 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[PPEventKitImporter importEventData](self, "importEventData");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (void *)objc_msgSend(v61, "initWithArray:", v62);

  pp_default_log_handle();
  v64 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(block) = 138412290;
    *(_QWORD *)((char *)&block + 4) = v63;
    _os_log_debug_impl(&dword_1C392E000, v64, OS_LOG_TYPE_DEBUG, "PPEventKitImporter: deleteAndReimportAllData found in standard time window: %@", (uint8_t *)&block, 0xCu);
  }

  v100[0] = v4;
  v100[1] = 3221225472;
  v100[2] = __46__PPEventKitImporter_deleteAndReimportAllData__block_invoke;
  v100[3] = &unk_1E7E1F518;
  v101 = v63;
  v65 = v63;
  objc_msgSend(v44, "_pas_filteredSetWithTest:", v100);
  v66 = (id)objc_claimAutoreleasedReturnValue();
  v67 = (void *)v93;
  if (self)
  {
    if ((+[PPEventKitImporter _shouldImport]() & 1) != 0)
    {
      v91 = v65;
      v92 = v44;
      v68 = v4;
      -[PPEventKitImporter _timeRangeForReimport]();
      v97 = objc_claimAutoreleasedReturnValue();
      v99 = (void *)objc_opt_new();
      v116 = 0u;
      v117 = 0u;
      v118 = 0u;
      v119 = 0u;
      v90 = v66;
      obja = v66;
      v69 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v116, &block, 16);
      if (v69)
      {
        v70 = v69;
        v71 = *(_QWORD *)v117;
        do
        {
          for (i = 0; i != v70; ++i)
          {
            if (*(_QWORD *)v117 != v71)
              objc_enumerationMutation(obja);
            v73 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * i);
            v74 = (void *)MEMORY[0x1C3BD6630]();
            eventStore = self->_eventStore;
            v108 = v68;
            v109 = 3221225472;
            v110 = __51__PPEventKitImporter__reimportEventsWithObjectIDs___block_invoke;
            v111 = &unk_1E7E1FFF8;
            v112 = self;
            v113 = v73;
            v114 = v97;
            v115 = v99;
            -[PPLocalEventStore runBlockWithPurgerDisabled:](eventStore, "runBlockWithPurgerDisabled:", &v108);
            -[PPLocalEventStore attemptToPurgeImmediately](self->_eventStore, "attemptToPurgeImmediately");

            objc_autoreleasePoolPop(v74);
          }
          v70 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v116, &block, 16);
        }
        while (v70);
      }

      v76 = (void *)objc_opt_new();
      v77 = (void *)objc_opt_new();
      *(_QWORD *)&buf = v68;
      *((_QWORD *)&buf + 1) = 3221225472;
      v126 = __51__PPEventKitImporter__reimportEventsWithObjectIDs___block_invoke_3;
      v127 = &unk_1E7E1F5F8;
      v128 = v76;
      v129 = v77;
      v78 = v77;
      v79 = v76;
      objc_msgSend(v99, "_pas_mappedArrayWithTransform:", &buf);
      v80 = (void *)objc_claimAutoreleasedReturnValue();

      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      v81 = v80;
      v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v104, &v121, 16);
      if (v82)
      {
        v83 = v82;
        v84 = *(_QWORD *)v105;
        do
        {
          v85 = 0;
          do
          {
            if (*(_QWORD *)v105 != v84)
              objc_enumerationMutation(v81);
            v86 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * v85);
            pp_default_log_handle();
            v87 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v120 = 138739971;
              *(_QWORD *)&v120[4] = v86;
              _os_log_debug_impl(&dword_1C392E000, v87, OS_LOG_TYPE_DEBUG, "PPEventKitImporter: Reimported PPEvent: %{sensitive}@", v120, 0xCu);
            }

            ++v85;
          }
          while (v83 != v85);
          v83 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v104, &v121, 16);
        }
        while (v83);
      }

      -[PPEventKitImporter _importEvents:]((uint64_t)self, v81);
      v44 = v92;
      v67 = (void *)v93;
      v66 = v90;
      v65 = v91;
      v88 = v97;
    }
    else
    {
      pp_default_log_handle();
      v88 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(block) = 0;
        _os_log_impl(&dword_1C392E000, v88, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: _reimportEventsWithEventIdentifiers disabled due to settings", (uint8_t *)&block, 2u);
      }
    }

  }
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_neDissector, 0);
  objc_storeStrong((id *)&self->_urlDissector, 0);
  objc_storeStrong((id *)&self->_sqlDatabase, 0);
  objc_storeStrong((id *)&self->_urlStore, 0);
  objc_storeStrong((id *)&self->_topicStore, 0);
  objc_storeStrong((id *)&self->_locationStore, 0);
  objc_storeStrong((id *)&self->_namedEntityStore, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
}

uint64_t __46__PPEventKitImporter_deleteAndReimportAllData__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

+ (uint64_t)_shouldImport
{
  void *v0;
  uint64_t v1;

  objc_opt_self();
  +[PPSettings sharedInstance](PPSettings, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "bundleIdentifierIsEnabledForDonation:", *MEMORY[0x1E0D70DC0]);

  return v1;
}

- (id)_timeRangeForReimport
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -604800.0);
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", 1209600.0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v0, v1);

  return v2;
}

void __51__PPEventKitImporter__reimportEventsWithObjectIDs___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v7[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__PPEventKitImporter__reimportEventsWithObjectIDs___block_invoke_2;
  v5[3] = &unk_1E7E1F5D0;
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "enumerateEventsFromEKObjectIDs:expandingRecurrencesInRange:usingBlock:", v3, v4, v5);

}

uint64_t __51__PPEventKitImporter__reimportEventsWithObjectIDs___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_importEvents:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
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
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[5];
  id v45;
  id v46;
  uint8_t buf[8];
  _QWORD aBlock[4];
  id v49;
  uint64_t v50;
  char *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!a1 || !objc_msgSend(v3, "count"))
    goto LABEL_33;
  v39 = a1;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v38 = v4;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (!v8)
    goto LABEL_16;
  v9 = v8;
  v10 = *(_QWORD *)v53;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v53 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
      v13 = (void *)MEMORY[0x1C3BD6630]();
      objc_msgSend(v12, "objectID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        goto LABEL_13;
      objc_msgSend(v12, "startDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSinceDate:", v5);
      v18 = v17;

      objc_msgSend(v15, "startDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSinceDate:", v5);
      v21 = v20;

      if (v18 > 0.0 == v21 <= 0.0)
      {
        if (v18 <= 0.0)
          goto LABEL_14;
LABEL_13:
        objc_msgSend(v12, "objectID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v22);

        goto LABEL_14;
      }
      if (fabs(v18) < fabs(v21))
        goto LABEL_13;
LABEL_14:

      objc_autoreleasePoolPop(v13);
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  }
  while (v9);
LABEL_16:

  v23 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__PPEventKitImporter__importEvents___block_invoke;
  aBlock[3] = &unk_1E7E1F438;
  v24 = v6;
  v50 = v39;
  v51 = sel__importEvents_;
  v49 = v24;
  v25 = _Block_copy(aBlock);
  v26 = *(_QWORD *)(v39 + 48);
  pp_default_log_handle();
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
  if (v26)
  {
    if (v28)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v27, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: _importEvents beginning SQL transaction", buf, 2u);
    }

    v29 = *(void **)(v39 + 16);
    v44[0] = v23;
    v44[1] = 3221225472;
    v44[2] = __36__PPEventKitImporter__importEvents___block_invoke_75;
    v44[3] = &unk_1E7E1F488;
    v44[4] = v39;
    v45 = v7;
    v46 = v25;
    objc_msgSend(v29, "runWithLockAcquired:", v44);
    pp_default_log_handle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v30, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: _importEvents ended SQL transaction", buf, 2u);
    }

  }
  else
  {
    if (v28)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v27, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: _importEvents no SQL transaction due to no _sqlDatabase (this can cause some extra per-event overhead)", buf, 2u);
    }

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v31 = v7;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v41 != v34)
            objc_enumerationMutation(v31);
          v36 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j);
          v37 = (void *)MEMORY[0x1C3BD6630]();
          (*((void (**)(void *, uint64_t))v25 + 2))(v25, v36);
          objc_autoreleasePoolPop(v37);
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
      }
      while (v33);
    }

  }
  v4 = v38;
  -[PPEventKitImporter _flush](v39);

LABEL_33:
}

void __36__PPEventKitImporter__importEvents___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = (void *)a1[4];
  v8 = v3;
  objc_msgSend(v3, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[5], CFSTR("PPEventKitImporter.m"), 309, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mostRelevantOccurrence"));

  }
  -[PPEventKitImporter _importEvent:isMostRelevantOccurrence:](a1[5], v8, v6 == v8);

}

void __36__PPEventKitImporter__importEvents___block_invoke_75(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__PPEventKitImporter__importEvents___block_invoke_2;
  v4[3] = &unk_1E7E1F460;
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "writeTransactionWithClient:block:", 9, v4);

}

- (void)_flush
{
  void *v1;
  char v2;
  id v3;
  NSObject *v4;
  id v5;
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = *(void **)(a1 + 16);
    v5 = 0;
    v2 = objc_msgSend(v1, "flushDonationsWithError:", &v5);
    v3 = v5;
    if ((v2 & 1) == 0)
    {
      pp_default_log_handle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v7 = v3;
        _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter failed to flush donations: %@", buf, 0xCu);
      }

    }
  }
}

void __36__PPEventKitImporter__importEvents___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)MEMORY[0x1C3BD6630](v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        objc_autoreleasePoolPop(v9);
        ++v8;
      }
      while (v6 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v6 = v5;
    }
    while (v5);
  }

}

- (void)_importEvent:(int)a3 isMostRelevantOccurrence:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const __CFString *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  char v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  char v73;
  id v74;
  NSObject *v75;
  NSObject *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  NSObject *v80;
  NSObject *v81;
  id v82;
  id v83;
  void *v84;
  void *v85;
  char v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  NSObject *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  int v103;
  id v104;
  NSObject *v105;
  _BOOL4 v106;
  id v107;
  void *v108;
  id v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  NSObject *v122;
  void *v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t i;
  void *v132;
  void *v133;
  uint64_t v134;
  void *v135;
  void *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  void *v140;
  NSObject *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t j;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  unint64_t v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  NSObject *v159;
  void *v160;
  void *v161;
  uint64_t v162;
  void *v163;
  void *v164;
  void *v165;
  NSObject *v166;
  void *v167;
  void *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t k;
  void *v175;
  void *v176;
  id v177;
  id v178;
  void *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  NSObject *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  double v192;
  double v193;
  id v194;
  void *v195;
  void *v196;
  uint64_t v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  uint64_t v203;
  NSObject *v204;
  void *v205;
  void *v206;
  void *v207;
  uint64_t v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  id v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  uint64_t v219;
  void *v220;
  id v221;
  void *v222;
  void *v223;
  void *v224;
  uint64_t v225;
  id v226;
  void *v227;
  void *v228;
  NSObject *v229;
  void *v230;
  uint64_t v231;
  void *v232;
  NSObject *v233;
  void *v234;
  uint64_t v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  id v240;
  void *v241;
  void *v242;
  NSObject *v243;
  void *v244;
  void *v245;
  id v246;
  void *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  id v251;
  void *v252;
  void *v253;
  void *v254;
  id v255;
  void *v256;
  void *v257;
  uint64_t v258;
  void *v259;
  void *v260;
  void *v261;
  NSObject *v262;
  NSObject *v263;
  void *v264;
  void *v265;
  uint64_t v266;
  int v267;
  void *v268;
  void *v269;
  void *v270;
  uint64_t v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  _BYTE v280[12];
  __int16 v281;
  uint64_t v282;
  __int16 v283;
  uint64_t v284;
  uint8_t v285[32];
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  _BYTE buf[24];
  void *v293;
  NSObject *v294;
  uint64_t v295;

  v295 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a1)
  {
    objc_msgSend(v5, "objectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URIRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    pp_default_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = CFSTR("no");
      *(_DWORD *)buf = 138412803;
      *(_QWORD *)&buf[4] = v9;
      if (a3)
        v11 = CFSTR("yes");
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v11;
      *(_WORD *)&buf[22] = 2117;
      v293 = v6;
      _os_log_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: importing event %@ (isMostRelevantOccurrence=%@, %{sensitive}@)", buf, 0x20u);
    }

    if (!v9)
    {
      pp_default_log_handle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: suppressing import of event with nil objectID", buf, 2u);
      }
      goto LABEL_148;
    }
    objc_msgSend(v6, "startDate");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      pp_default_log_handle();
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v80, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: suppressing import of event with nil startDate", buf, 2u);
      }
LABEL_147:

LABEL_148:
      goto LABEL_149;
    }
    v13 = objc_msgSend(v6, "organizerIsCurrentUser");
    objc_msgSend(v6, "attendees");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_pas_mappedArrayWithTransform:", &__block_literal_global_82_21890);
    v15 = objc_claimAutoreleasedReturnValue();

    v266 = a1;
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D70C80]), "initWithDwellTimeSeconds:lengthSeconds:lengthCharacters:donationCount:contactHandleCount:flags:", 0, 0, 0, 0, (unsigned __int16)-[NSObject count](v15, "count"), v13);
    v17 = objc_alloc(MEMORY[0x1E0D70C78]);
    v267 = a3;
    v18 = v6;
    v19 = *MEMORY[0x1E0D70DC0];
    objc_msgSend(v18, "calendar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "calendarIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_opt_new();
    v258 = v19;
    v261 = (void *)v16;
    v248 = v16;
    v23 = (_QWORD *)v266;
    v24 = v19;
    v6 = v18;
    v263 = v12;
    v264 = v9;
    v262 = v15;
    v25 = (void *)objc_msgSend(v17, "initWithBundleId:groupId:documentId:date:relevanceDate:contactHandles:language:metadata:", v24, v21, v9, v22, v12, v15, 0, v248);

    v265 = v18;
    if (!v267)
    {
LABEL_101:
      v177 = v6;
      v178 = v25;
      memset(v285, 0, sizeof(v285));
      v286 = 0u;
      v287 = 0u;
      objc_msgSend(v177, "attendees");
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      v180 = objc_msgSend(v179, "countByEnumeratingWithState:objects:count:", v285, buf, 16);
      if (v180)
      {
        v181 = v180;
        v182 = **(_QWORD **)&v285[16];
LABEL_103:
        v183 = 0;
        while (1)
        {
          if (**(_QWORD **)&v285[16] != v182)
            objc_enumerationMutation(v179);
          v184 = *(void **)(*(_QWORD *)&v285[8] + 8 * v183);
          if (objc_msgSend(v184, "isCurrentUser"))
            break;
          if (v181 == ++v183)
          {
            v181 = objc_msgSend(v179, "countByEnumeratingWithState:objects:count:", v285, buf, 16);
            if (v181)
              goto LABEL_103;
            goto LABEL_114;
          }
        }
        if (objc_msgSend(v184, "status") != 3)
          goto LABEL_114;
        pp_default_log_handle();
        v185 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v185, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v177, "eventIdentifier");
          v186 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v280 = 138412290;
          *(_QWORD *)&v280[4] = v186;
          _os_log_impl(&dword_1C392E000, v185, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: _dissectAndDonateURLsFromEvent: ignoring declined event: %@", v280, 0xCu);

        }
        v187 = v261;
        v80 = v262;
      }
      else
      {
LABEL_114:

        objc_msgSend(v177, "startDate");
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        if (v188)
        {
          objc_msgSend(v177, "endDate");
          v189 = (void *)objc_claimAutoreleasedReturnValue();
          if (v189)
          {
            objc_msgSend(v177, "endDate");
            v190 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v177, "startDate");
            v191 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v190, "timeIntervalSinceDate:", v191);
            v193 = v192;

          }
          else
          {
            v193 = 0.0;
          }

        }
        else
        {
          v193 = 0.0;
        }

        v194 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v178, "documentId");
        v195 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v177, "startDate");
        v196 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v196, "timeIntervalSinceReferenceDate");
        v179 = (void *)objc_msgSend(v194, "initWithFormat:", CFSTR("%@:%f"), v195, v197);

        objc_msgSend(v177, "objectID");
        v198 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v198, "URIRepresentation");
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v199, "absoluteString");
        v200 = (void *)objc_claimAutoreleasedReturnValue();

        if (v200)
        {
          +[PPEventKitImporter _escapedDomainIdentifierForIdentifier:]((uint64_t)PPEventKitImporter, v200);
          v271 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v177, "url");
          v201 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v201, "absoluteString");
          v202 = (void *)objc_claimAutoreleasedReturnValue();
          v203 = objc_msgSend(v202, "length");

          if (v203)
          {
            pp_default_log_handle();
            v204 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v204, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v177, "eventIdentifier");
              v205 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v177, "url");
              v206 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v206, "absoluteString");
              v207 = (void *)objc_claimAutoreleasedReturnValue();
              v208 = objc_msgSend(v207, "length");
              *(_DWORD *)v280 = 138412546;
              *(_QWORD *)&v280[4] = v205;
              v281 = 2048;
              v282 = v208;
              _os_log_impl(&dword_1C392E000, v204, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: _dissectAndDonateURLsFromEvent: event %@ has URL length: %tu", v280, 0x16u);

            }
            v209 = (void *)v23[7];
            objc_msgSend(v177, "url");
            v210 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)&v288 = v210;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v288, 1);
            v211 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v178, "bundleId");
            v212 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v177, "title");
            v213 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v177, "startDate");
            v214 = v178;
            v215 = (void *)objc_claimAutoreleasedReturnValue();
            v216 = (void *)objc_opt_new();
            LOBYTE(v249) = 0;
            objc_msgSend(v209, "urlsFromURLs:handle:bundleIdentifier:domainIdentifier:uniqueIdentifier:documentTitle:documentDate:documentTimeInterval:receivedAt:isOutgoingDocument:", v211, 0, v212, v271, v179, v213, v193, v215, v216, v249);
            v217 = (void *)objc_claimAutoreleasedReturnValue();

            v178 = v214;
            objc_msgSend(v217, "writeWithEntityStore:", *(_QWORD *)(v266 + 40));

            v6 = v265;
          }
          objc_msgSend(v177, "notes");
          v218 = (void *)objc_claimAutoreleasedReturnValue();
          v219 = objc_msgSend(v218, "length");

          if (v219)
          {
            v220 = (void *)objc_opt_new();
            v221 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v177, "notes");
            v222 = (void *)objc_claimAutoreleasedReturnValue();
            v223 = (void *)objc_msgSend(v221, "initWithFormat:", CFSTR("%@\n"), v222);
            objc_msgSend(v220, "appendString:", v223);

          }
          else
          {
            v220 = 0;
          }
          v185 = v271;
          objc_msgSend(v177, "location");
          v224 = (void *)objc_claimAutoreleasedReturnValue();
          v225 = objc_msgSend(v224, "length");

          if (v225)
          {
            if (!v220)
              v220 = (void *)objc_opt_new();
            v226 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v177, "location");
            v227 = (void *)objc_claimAutoreleasedReturnValue();
            v228 = (void *)objc_msgSend(v226, "initWithFormat:", CFSTR("%@\n"), v227);
            objc_msgSend(v220, "appendString:", v228);

          }
          if (objc_msgSend(v220, "length"))
          {
            pp_default_log_handle();
            v229 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v229, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v177, "eventIdentifier");
              v230 = (void *)objc_claimAutoreleasedReturnValue();
              v231 = objc_msgSend(v220, "length");
              *(_DWORD *)v280 = 138412546;
              *(_QWORD *)&v280[4] = v230;
              v281 = 2048;
              v282 = v231;
              _os_log_impl(&dword_1C392E000, v229, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: _dissectAndDonateURLsFromEvent: event %@ has text length: %tu", v280, 0x16u);

            }
            objc_msgSend(*(id *)(v266 + 72), "detectionsInPlainText:baseDate:", v220, 0);
            v232 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v232, "count"))
            {
              pp_default_log_handle();
              v233 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v233, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v177, "eventIdentifier");
                v234 = (void *)objc_claimAutoreleasedReturnValue();
                v235 = objc_msgSend(v232, "count");
                *(_DWORD *)v280 = 138412546;
                *(_QWORD *)&v280[4] = v234;
                v281 = 2048;
                v282 = v235;
                _os_log_impl(&dword_1C392E000, v233, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: _dissectAndDonateURLsFromEvent: event %@ has data detection count: %tu", v280, 0x16u);

              }
              v236 = *(void **)(v266 + 56);
              objc_msgSend(v178, "bundleId");
              v260 = v232;
              v237 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v177, "title");
              v238 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v177, "startDate");
              v239 = (void *)objc_claimAutoreleasedReturnValue();
              v240 = v178;
              v241 = (void *)objc_opt_new();
              LOBYTE(v250) = 0;
              v185 = v271;
              objc_msgSend(v236, "urlsFromText:handle:dataDetectorMatches:bundleIdentifier:domainIdentifier:uniqueIdentifier:documentTitle:documentDate:documentTimeInterval:receivedAt:isOutgoingDocument:", v220, 0, v260, v237, v271, v179, v193, v238, v239, v241, v250);
              v242 = (void *)objc_claimAutoreleasedReturnValue();

              v178 = v240;
              v232 = v260;
              objc_msgSend(v242, "writeWithEntityStore:", *(_QWORD *)(v266 + 40));

              v6 = v265;
            }

          }
          v187 = v261;
          v80 = v262;
        }
        else
        {
          pp_default_log_handle();
          v185 = objc_claimAutoreleasedReturnValue();
          v187 = v261;
          v80 = v262;
          if (os_log_type_enabled(v185, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(v177, "objectID");
            v244 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v280 = 138412290;
            *(_QWORD *)&v280[4] = v244;
            _os_log_fault_impl(&dword_1C392E000, v185, OS_LOG_TYPE_FAULT, "PPEventKitImporter: can't generate URL string from object id %@ (will ignore event)", v280, 0xCu);

          }
        }
      }

      pp_default_log_handle();
      v243 = objc_claimAutoreleasedReturnValue();
      v9 = v264;
      if (os_log_type_enabled(v243, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v264;
        _os_log_impl(&dword_1C392E000, v243, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: completed import of event %@", buf, 0xCu);
      }

      v12 = v263;
      goto LABEL_147;
    }
    v26 = v18;
    v257 = v25;
    v27 = v25;
    +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bundleId");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "language");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "extractionAlgorithmsForBundleId:sourceLanguage:conservative:domain:", v29, v30, 0, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v31, "containsObject:", &unk_1E7E5A818))
    {
LABEL_41:

      v82 = v26;
      v83 = v27;
      objc_msgSend(v82, "structuredLocationTitle");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      if ((PPStringAllWhiteSpace() & 1) == 0)
      {
        objc_msgSend(v82, "structuredLocationTitle");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = PPStringLooksLikeNumber();

        if ((v86 & 1) != 0)
          goto LABEL_60;
        +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "extractionAlgorithmsForBundleId:sourceLanguage:conservative:domain:", v258, 0, 0, 2);
        v84 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v84, "containsObject:", &unk_1E7E5A830) & 1) != 0)
        {
          v88 = (void *)MEMORY[0x1E0D70B98];
          objc_msgSend(v82, "structuredLocationTitle");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "structuredLocationCoordinates");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "placemarkWithName:clLocation:", v89, v90);
          v91 = objc_claimAutoreleasedReturnValue();

          if (v91)
          {
            v269 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70B78]), "initWithPlacemark:category:mostRelevantRecord:", v91, 3, 0);
            v92 = objc_msgSend(objc_alloc(MEMORY[0x1E0D70C48]), "initWithLocation:score:sentimentScore:", v269, 1.0, 0.0);
            v93 = (void *)v23[3];
            v259 = (void *)v92;
            *(_QWORD *)v285 = v92;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v285, 1);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "title");
            v256 = (void *)objc_claimAutoreleasedReturnValue();
            v95 = objc_msgSend(v256, "length");
            if (v95)
            {
              v254 = v93;
              v96 = MEMORY[0x1C3BD6630]();
              v97 = v94;
              v98 = objc_alloc(MEMORY[0x1E0C99E60]);
              objc_msgSend(v82, "title");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              v100 = v98;
              v94 = v97;
              v101 = (void *)objc_msgSend(v100, "initWithObjects:", v99, 0);

              v102 = (void *)v96;
              v93 = v254;
              objc_autoreleasePoolPop(v102);
            }
            else
            {
              v101 = 0;
            }
            *(_QWORD *)v280 = 0;
            v103 = objc_msgSend(v93, "donateLocations:source:contextualNamedEntities:algorithm:cloudSync:error:", v94, v83, v101, 9, 0, v280);
            v104 = *(id *)v280;
            if (v95)

            pp_private_log_handle();
            v105 = objc_claimAutoreleasedReturnValue();
            v106 = os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG);
            if (v103)
            {
              v23 = (_QWORD *)v266;
              if (v106)
              {
                objc_msgSend(v82, "structuredLocationTitle");
                v107 = v104;
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v108;
                _os_log_debug_impl(&dword_1C392E000, v105, OS_LOG_TYPE_DEBUG, "PPEventKitImporter: successfully harvested location: %@", buf, 0xCu);

                v104 = v107;
              }
            }
            else
            {
              v23 = (_QWORD *)v266;
              if (v106)
              {
                objc_msgSend(v82, "structuredLocationTitle");
                v246 = v104;
                v247 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v247;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v246;
                _os_log_debug_impl(&dword_1C392E000, v105, OS_LOG_TYPE_DEBUG, "PPEventKitImporter: failed to harvest location: %@; error: %@",
                  buf,
                  0x16u);

                v104 = v246;
              }
            }

          }
        }
        else
        {
          pp_default_log_handle();
          v91 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1C392E000, v91, OS_LOG_TYPE_DEBUG, "PPEventKitImporter: not importing locations from eventkit as it is disabled in configuration.", buf, 2u);
          }
        }

      }
LABEL_60:

      v109 = v82;
      v110 = v83;
      +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "bundleId");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "language");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "extractionAlgorithmsForBundleId:sourceLanguage:conservative:domain:", v112, v113, 1, 1);
      v114 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v109, "title");
      v115 = objc_claimAutoreleasedReturnValue();
      if (v115
        && (v116 = (void *)v115,
            objc_msgSend(v109, "title"),
            v117 = (void *)objc_claimAutoreleasedReturnValue(),
            v118 = objc_msgSend(v117, "length"),
            v117,
            v116,
            v118))
      {
        v119 = (void *)v23[8];
        objc_msgSend(v109, "title");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "entitiesInPlainText:eligibleRegions:source:cloudSync:algorithms:", v120, 0, v110, 1, v114);
        v121 = (void *)objc_claimAutoreleasedReturnValue();

        pp_default_log_handle();
        v122 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v109, "eventIdentifier");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "location");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          v125 = objc_msgSend(v124, "length");
          v126 = objc_msgSend(v121, "count");
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v123;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v125;
          *(_WORD *)&buf[22] = 2048;
          v293 = (void *)v126;
          _os_log_impl(&dword_1C392E000, v122, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: location on event %@ with length %tu generated %tu containers", buf, 0x20u);

        }
        v290 = 0u;
        v291 = 0u;
        v288 = 0u;
        v289 = 0u;
        v127 = v121;
        v128 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v288, buf, 16);
        if (v128)
        {
          v129 = v128;
          v130 = *(_QWORD *)v289;
          do
          {
            for (i = 0; i != v129; ++i)
            {
              if (*(_QWORD *)v289 != v130)
                objc_enumerationMutation(v127);
              v132 = *(void **)(*((_QWORD *)&v288 + 1) + 8 * i);
              v133 = (void *)MEMORY[0x1C3BD6630]();
              -[PPEventKitImporter _donateContainerContents:]((uint64_t)v23, v132);
              objc_autoreleasePoolPop(v133);
            }
            v129 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v288, buf, 16);
          }
          while (v129);
        }

        v6 = v265;
      }
      else
      {
        v127 = 0;
      }
      objc_msgSend(v109, "location");
      v134 = objc_claimAutoreleasedReturnValue();
      if (v134)
      {
        v135 = (void *)v134;
        objc_msgSend(v109, "location");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        v137 = objc_msgSend(v136, "length");

        if (v137)
        {
          v138 = (void *)v23[8];
          objc_msgSend(v109, "location");
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v138, "entitiesInPlainText:eligibleRegions:source:cloudSync:algorithms:", v139, 0, v110, 1, v114);
          v140 = (void *)objc_claimAutoreleasedReturnValue();

          pp_default_log_handle();
          v141 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v109, "eventIdentifier");
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "location");
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            v144 = objc_msgSend(v143, "length");
            v145 = objc_msgSend(v140, "count");
            *(_DWORD *)v285 = 138412802;
            *(_QWORD *)&v285[4] = v142;
            *(_WORD *)&v285[12] = 2048;
            *(_QWORD *)&v285[14] = v144;
            *(_WORD *)&v285[22] = 2048;
            *(_QWORD *)&v285[24] = v145;
            _os_log_impl(&dword_1C392E000, v141, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: location on event %@ with length %tu generated %tu containers", v285, 0x20u);

          }
          v278 = 0u;
          v279 = 0u;
          v276 = 0u;
          v277 = 0u;
          v127 = v140;
          v146 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v276, v285, 16);
          if (v146)
          {
            v147 = v146;
            v148 = *(_QWORD *)v277;
            do
            {
              for (j = 0; j != v147; ++j)
              {
                if (*(_QWORD *)v277 != v148)
                  objc_enumerationMutation(v127);
                v150 = *(void **)(*((_QWORD *)&v276 + 1) + 8 * j);
                v151 = (void *)MEMORY[0x1C3BD6630]();
                -[PPEventKitImporter _donateContainerContents:]((uint64_t)v23, v150);
                objc_autoreleasePoolPop(v151);
              }
              v147 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v276, v285, 16);
            }
            while (v147);
          }

          v6 = v265;
        }
      }
      objc_msgSend(v109, "notes");
      v152 = (void *)objc_claimAutoreleasedReturnValue();

      if (v152)
      {
        v270 = v114;
        objc_msgSend(v109, "notes");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        v154 = objc_msgSend(v153, "length");

        +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "bundleId");
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "language");
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v155, "extractionAlgorithmsForBundleId:sourceLanguage:conservative:domain:", v156, v157, v154 < 0x40, 1);
        v158 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = (_QWORD *)v266;
        if (v154 >= 0x40)
        {
          pp_default_log_handle();
          v159 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v109, "eventIdentifier");
            v160 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "notes");
            v161 = (void *)objc_claimAutoreleasedReturnValue();
            v162 = objc_msgSend(v161, "length");
            *(_DWORD *)v280 = 138412546;
            *(_QWORD *)&v280[4] = v160;
            v281 = 2048;
            v282 = v162;
            _os_log_impl(&dword_1C392E000, v159, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: using all taggers since notes on %@ has length %tu", v280, 0x16u);

          }
        }
        v163 = *(void **)(v266 + 64);
        objc_msgSend(v109, "notes");
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v163, "entitiesInPlainText:eligibleRegions:source:cloudSync:algorithms:", v164, 0, v110, 1, v158);
        v165 = (void *)objc_claimAutoreleasedReturnValue();

        pp_default_log_handle();
        v166 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v109, "eventIdentifier");
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "notes");
          v168 = (void *)objc_claimAutoreleasedReturnValue();
          v169 = objc_msgSend(v168, "length");
          v170 = objc_msgSend(v165, "count");
          *(_DWORD *)v280 = 138412802;
          *(_QWORD *)&v280[4] = v167;
          v281 = 2048;
          v282 = v169;
          v283 = 2048;
          v284 = v170;
          _os_log_impl(&dword_1C392E000, v166, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: notes on event %@ with length %tu generated %tu containers", v280, 0x20u);

        }
        v274 = 0u;
        v275 = 0u;
        v272 = 0u;
        v273 = 0u;
        v127 = v165;
        v171 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v272, v280, 16);
        if (v171)
        {
          v172 = v171;
          v173 = *(_QWORD *)v273;
          do
          {
            for (k = 0; k != v172; ++k)
            {
              if (*(_QWORD *)v273 != v173)
                objc_enumerationMutation(v127);
              v175 = *(void **)(*((_QWORD *)&v272 + 1) + 8 * k);
              v176 = (void *)MEMORY[0x1C3BD6630]();
              -[PPEventKitImporter _donateContainerContents:](v266, v175);
              objc_autoreleasePoolPop(v176);
            }
            v172 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v272, v280, 16);
          }
          while (v172);
        }

        v6 = v265;
        v114 = v270;
      }

      v25 = v257;
      goto LABEL_101;
    }
    v253 = v31;
    v255 = v27;
    v251 = v26;
    v32 = v26;
    v268 = (void *)objc_opt_new();
    objc_msgSend(v32, "title");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      v34 = (void *)v33;
      objc_msgSend(v32, "title");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "length");

      if (v36)
      {
        v37 = objc_alloc(MEMORY[0x1E0D70C38]);
        v38 = objc_alloc(MEMORY[0x1E0D70BC0]);
        objc_msgSend(v32, "title");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "languageCode");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (void *)objc_msgSend(v38, "initWithName:category:language:", v39, 14, v41);
        v43 = (void *)objc_msgSend(v37, "initWithItem:score:", v42, 0.5);
        objc_msgSend(v268, "addObject:", v43);

      }
    }
    v286 = 0u;
    v287 = 0u;
    memset(v285, 0, sizeof(v285));
    v252 = v32;
    objc_msgSend(v32, "attendees");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", v285, buf, 16);
    if (v45)
    {
      v46 = v45;
      v47 = **(_QWORD **)&v285[16];
      do
      {
        for (m = 0; m != v46; ++m)
        {
          if (**(_QWORD **)&v285[16] != v47)
            objc_enumerationMutation(v44);
          v49 = *(void **)(*(_QWORD *)&v285[8] + 8 * m);
          v50 = (void *)MEMORY[0x1C3BD6630]();
          objc_msgSend(v49, "name");
          v51 = objc_claimAutoreleasedReturnValue();
          if (v51)
          {
            v52 = (void *)v51;
            objc_msgSend(v49, "name");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_msgSend(v53, "length");

            if (v54)
            {
              v55 = objc_alloc(MEMORY[0x1E0D70C38]);
              v56 = objc_alloc(MEMORY[0x1E0D70BC0]);
              objc_msgSend(v49, "name");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "languageCode");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = (void *)objc_msgSend(v56, "initWithName:category:language:", v57, 1, v59);
              v61 = (void *)objc_msgSend(v55, "initWithItem:score:", v60, 0.5);
              objc_msgSend(v268, "addObject:", v61);

            }
          }
          objc_autoreleasePoolPop(v50);
        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", v285, buf, 16);
      }
      while (v46);
    }

    objc_msgSend(v252, "structuredLocationTitle");
    v62 = objc_claimAutoreleasedReturnValue();
    v23 = (_QWORD *)v266;
    v27 = v255;
    if (v62)
    {
      v63 = (void *)v62;
      objc_msgSend(v252, "structuredLocationTitle");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v64, "length"))
      {
LABEL_29:

        goto LABEL_30;
      }
      objc_msgSend(v252, "structuredLocationTitle");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      if ((PPStringAllWhiteSpace() & 1) != 0)
      {
LABEL_28:

        v27 = v255;
        goto LABEL_29;
      }
      objc_msgSend(v252, "structuredLocationTitle");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = PPStringLooksLikeNumber();

      v27 = v255;
      if ((v67 & 1) == 0)
      {
        v68 = objc_alloc(MEMORY[0x1E0D70C38]);
        v69 = objc_alloc(MEMORY[0x1E0D70BC0]);
        objc_msgSend(v252, "structuredLocationTitle");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "languageCode");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = (void *)objc_msgSend(v69, "initWithName:category:language:", v63, 3, v65);
        v71 = (void *)objc_msgSend(v68, "initWithItem:score:", v70, 0.5);
        objc_msgSend(v268, "addObject:", v71);

        goto LABEL_28;
      }
    }
LABEL_30:

    v72 = *(void **)(v266 + 16);
    *(_QWORD *)v285 = 0;
    v73 = objc_msgSend(v72, "donateNamedEntities:source:algorithm:cloudSync:sentimentScore:error:", v268, v27, 10, 0, v285, 0.0);
    v74 = *(id *)v285;
    pp_default_log_handle();
    v75 = objc_claimAutoreleasedReturnValue();
    v76 = v75;
    if ((v73 & 1) != 0)
    {
      v6 = v265;
      v26 = v251;
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        v77 = objc_msgSend(v268, "count");
        objc_msgSend(v27, "groupId");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "documentId");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        *(_QWORD *)&buf[4] = v77;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v78;
        *(_WORD *)&buf[22] = 2112;
        v293 = v79;
        _os_log_impl(&dword_1C392E000, v76, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: donated %tu entities from %@ / %@", buf, 0x20u);

      }
    }
    else
    {
      v6 = v265;
      v26 = v251;
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v252, "eventIdentifier");
        v245 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v245;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v74;
        _os_log_error_impl(&dword_1C392E000, v76, OS_LOG_TYPE_ERROR, "PPEventKitImporter: failed to donate EventKit data for %@: %@", buf, 0x16u);

      }
      +[PPMetricsUtils loggingQueue](PPMetricsUtils, "loggingQueue");
      v81 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __65__PPEventKitImporter__donateEntitiesForPropertiesOfEvent_source___block_invoke;
      v293 = &unk_1E7E1F4F0;
      v294 = v74;
      dispatch_async(v81, buf);

      v76 = v294;
    }

    v31 = v253;
    goto LABEL_41;
  }
LABEL_149:

}

+ (id)_escapedDomainIdentifierForIdentifier:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_opt_self();
  v4 = (void *)MEMORY[0x1C3BD6630](v3);
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("%."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringByAddingPercentEncodingWithAllowedCharacters:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    pp_default_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v2, "dataUsingEncoding:", 10);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bytes");
      objc_msgSend(v10, "length");
      _PASBytesToHex();
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = 138412290;
      v13 = v11;
      _os_log_fault_impl(&dword_1C392E000, v8, OS_LOG_TYPE_FAULT, "PPEventKitImporter: could not properly escape identifier with UTF-16 code units: %@", (uint8_t *)&v12, 0xCu);

    }
    v7 = (void *)objc_msgSend(v2, "copy");
  }

  objc_autoreleasePoolPop(v4);
  return v7;
}

- (void)_donateContainerContents:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned __int16 v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  id obj;
  uint64_t v46;
  uint64_t v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  id v54;
  uint8_t v55[128];
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v47 = a1;
  v4 = *(void **)(a1 + 16);
  objc_msgSend(v3, "entities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "entityAlgorithm");
  v8 = objc_msgSend(v3, "cloudSync");
  objc_msgSend(v3, "sentimentScore");
  v54 = 0;
  LOBYTE(v4) = objc_msgSend(v4, "donateNamedEntities:source:algorithm:cloudSync:sentimentScore:error:", v5, v6, v7, v8, &v54);
  v9 = v54;

  if ((v4 & 1) == 0)
  {
    pp_private_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v3, "entities");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "count");
      objc_msgSend(v3, "source");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v57 = v38;
      v58 = 2112;
      v59 = v39;
      v60 = 2112;
      v61 = v9;
      _os_log_debug_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEBUG, "PPEventKitImporter: failed to donate %tu named entities from container (%@): %@", buf, 0x20u);

    }
  }
  v11 = *(void **)(v47 + 32);
  objc_msgSend(v3, "topics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "source");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v3, "topicAlgorithm");
  v15 = objc_msgSend(v3, "cloudSync");
  objc_msgSend(v3, "sentimentScore");
  v53 = 0;
  LOBYTE(v11) = objc_msgSend(v11, "donateTopics:source:algorithm:cloudSync:sentimentScore:exactMatchesInSourceText:error:", v12, v13, v14, v15, 0, &v53);
  v16 = v53;

  if ((v11 & 1) == 0)
  {
    pp_private_log_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v3, "topics");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "count");
      objc_msgSend(v3, "source");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v57 = v41;
      v58 = 2112;
      v59 = v42;
      v60 = 2112;
      v61 = v16;
      _os_log_debug_impl(&dword_1C392E000, v17, OS_LOG_TYPE_DEBUG, "PPEventKitImporter: failed to donate %tu topics from container (%@): %@", buf, 0x20u);

    }
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v3, "locations");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "allKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v19;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v20)
  {
    v21 = v20;
    v43 = v16;
    v44 = v9;
    v22 = 0;
    v46 = *(_QWORD *)v50;
    do
    {
      v23 = 0;
      v24 = v22;
      do
      {
        if (*(_QWORD *)v50 != v46)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v23);
        v26 = *(void **)(v47 + 24);
        objc_msgSend(v3, "locations", v43, v44);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKeyedSubscript:", v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "source");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v25, "unsignedIntegerValue");
        v31 = objc_msgSend(v3, "cloudSync");
        v48 = v24;
        LOBYTE(v30) = objc_msgSend(v26, "donateLocations:source:contextualNamedEntities:algorithm:cloudSync:error:", v28, v29, 0, v30, v31, &v48);
        v22 = v48;

        if ((v30 & 1) == 0)
        {
          pp_private_log_handle();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v3, "locations");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "objectForKeyedSubscript:", v25);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "count");
            objc_msgSend(v3, "source");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218498;
            v57 = v35;
            v58 = 2112;
            v59 = v36;
            v60 = 2112;
            v61 = v22;
            _os_log_debug_impl(&dword_1C392E000, v32, OS_LOG_TYPE_DEBUG, "PPEventKitImporter: failed to donate %tu locations from container (%@): %@", buf, 0x20u);

          }
        }
        ++v23;
        v24 = v22;
      }
      while (v21 != v23);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v21);

    v16 = v43;
    v9 = v44;
  }

}

void __65__PPEventKitImporter__donateEntitiesForPropertiesOfEvent_source___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "setSource:", 9);
  objc_msgSend(v3, "setErrorMessage:", CFSTR("PPEventKitImporter: failed to donate EventKit data."));
  objc_msgSend(v3, "setErrorCode:", objc_msgSend(*(id *)(a1 + 32), "code"));
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackScalarForMessage:", v3);

}

id __60__PPEventKitImporter__importEvent_isMostRelevantOccurrence___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "emailAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v2, "emailAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __51__PPEventKitImporter__reimportEventsWithObjectIDs___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D70B30], "deferredAllocationEventFromEKEvent:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __43__PPEventKitImporter__deleteAllExtractions__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "setSource:", 9);
  objc_msgSend(v3, "setErrorMessage:", CFSTR("PPEventKitImporter: failed to delete all named entities."));
  objc_msgSend(v3, "setErrorCode:", objc_msgSend(*(id *)(a1 + 32), "code"));
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackScalarForMessage:", v3);

}

void __43__PPEventKitImporter__deleteAllExtractions__block_invoke_144(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "setSource:", 9);
  objc_msgSend(v3, "setErrorMessage:", CFSTR("PPEventKitImporter: failed to delete all URLs."));
  objc_msgSend(v3, "setErrorCode:", objc_msgSend(*(id *)(a1 + 32), "code"));
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackScalarForMessage:", v3);

}

void __49__PPEventKitImporter__eventIdentifiersToReimport__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "source");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __49__PPEventKitImporter__eventIdentifiersToReimport__block_invoke_118(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "source");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __49__PPEventKitImporter__eventIdentifiersToReimport__block_invoke_121(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "source");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

id __49__PPEventKitImporter__eventIdentifiersToReimport__block_invoke_124(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CAA0C0], "objectIDWithURL:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __53__PPEventKitImporter__deleteExtractionsForObjectIDs___block_invoke_135(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "setSource:", 9);
  objc_msgSend(v3, "setErrorMessage:", CFSTR("PPEventKitImporter: failed to delete named entities."));
  objc_msgSend(v3, "setErrorCode:", objc_msgSend(*(id *)(a1 + 32), "code"));
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackScalarForMessage:", v3);

}

void __53__PPEventKitImporter__deleteExtractionsForObjectIDs___block_invoke_139(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "setSource:", 9);
  objc_msgSend(v3, "setErrorMessage:", CFSTR("PPEventKitImporter: failed to delete URLs."));
  objc_msgSend(v3, "setErrorCode:", objc_msgSend(*(id *)(a1 + 32), "code"));
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackScalarForMessage:", v3);

}

id __53__PPEventKitImporter__deleteExtractionsForObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "URIRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __61__PPEventKitImporter_importEventDataWithShouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

void __40__PPEventKitImporter__deleteOldEntities__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "setSource:", 9);
  objc_msgSend(v3, "setErrorMessage:", CFSTR("PPEventKitImporter: failed to delete old named entities."));
  objc_msgSend(v3, "setErrorCode:", objc_msgSend(*(id *)(a1 + 32), "code"));
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackScalarForMessage:", v3);

}

uint64_t __37__PPEventKitImporter_importEventData__block_invoke()
{
  return 1;
}

+ (id)defaultInstance
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  const char *v16;
  _QWORD v18[4];
  NSObject *v19;
  id v20;
  id v21;
  NSObject *v22;
  uint8_t buf[16];

  if ((+[PPEventKitImporter _shouldImport]() & 1) != 0)
  {
    +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
    v2 = objc_claimAutoreleasedReturnValue();
    +[PPLocalLocationStore defaultStore](PPLocalLocationStore, "defaultStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v2)
    {
      if (v3)
      {
        if (v4)
        {
          +[PPSQLDatabase sharedInstance](PPSQLDatabase, "sharedInstance");
          v6 = objc_claimAutoreleasedReturnValue();
          if (!v6)
          {
            pp_default_log_handle();
            v7 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1C392E000, v7, OS_LOG_TYPE_FAULT, "PPEventKitImporter: [PPSQLDatabase sharedInstance] is somehow nil even though ne, location, and topic stores are non-nil???", buf, 2u);
            }

          }
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __37__PPEventKitImporter_defaultInstance__block_invoke;
          v18[3] = &unk_1E7E1FFF8;
          v8 = v2;
          v19 = v8;
          v9 = v3;
          v20 = v9;
          v10 = v5;
          v21 = v10;
          v22 = v6;
          v11 = defaultInstance__pasOnceToken9;
          v12 = v6;
          v13 = v12;
          if (v11 == -1)
          {
            v14 = v12;
          }
          else
          {
            dispatch_once(&defaultInstance__pasOnceToken9, v18);
            v10 = v21;
            v14 = v22;
            v8 = v19;
            v9 = v20;
          }
          v15 = (id)defaultInstance__pasExprOnceResult_22021;

          goto LABEL_23;
        }
        pp_default_log_handle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v16 = "PPEventKitImporter: giving up on initialization due to Topic store not getting initialized. Device may b"
                "e Class C locked.";
          goto LABEL_21;
        }
LABEL_22:
        v15 = 0;
LABEL_23:

        goto LABEL_24;
      }
      pp_default_log_handle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      *(_WORD *)buf = 0;
      v16 = "PPEventKitImporter: giving up on initialization due to Location store not getting initialized. Device may be"
            " Class C locked.";
    }
    else
    {
      pp_default_log_handle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      *(_WORD *)buf = 0;
      v16 = "PPEventKitImporter: giving up on initialization due to Named Entity store not getting initialized. Device ma"
            "y be Class C locked.";
    }
LABEL_21:
    _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
    goto LABEL_22;
  }
  pp_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: defaultInstance bypassed due to settings", buf, 2u);
  }
  v15 = 0;
LABEL_24:

  return v15;
}

void __37__PPEventKitImporter_defaultInstance__block_invoke(_QWORD *a1)
{
  void *v2;
  PPEventKitImporter *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)MEMORY[0x1C3BD6630]();
  v3 = [PPEventKitImporter alloc];
  +[PPLocalEventStore defaultStore](PPLocalEventStore, "defaultStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PPEventKitImporter initWithEventStore:namedEntityStore:locationStore:topicStore:urlStore:urlDissector:namedEntityDissector:dataDetectorMatchClass:sqlDatabase:](v3, "initWithEventStore:namedEntityStore:locationStore:topicStore:urlStore:urlDissector:namedEntityDissector:dataDetectorMatchClass:sqlDatabase:", v4, a1[4], a1[5], a1[6], 0, 0, 0, 0, a1[7]);
  v6 = (void *)defaultInstance__pasExprOnceResult_22021;
  defaultInstance__pasExprOnceResult_22021 = v5;

  objc_autoreleasePoolPop(v2);
}

@end
