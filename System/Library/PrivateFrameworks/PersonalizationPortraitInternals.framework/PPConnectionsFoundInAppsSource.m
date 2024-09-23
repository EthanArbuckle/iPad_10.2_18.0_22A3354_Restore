@implementation PPConnectionsFoundInAppsSource

- (PPConnectionsFoundInAppsSource)initWithFoundInAppsService:(id)a3
{
  id v5;
  PPConnectionsFoundInAppsSource *v6;
  PPConnectionsFoundInAppsSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPConnectionsFoundInAppsSource;
  v6 = -[PPConnectionsFoundInAppsSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_fiaURLService, a3);

  return v7;
}

- (id)identifier
{
  return CFSTR("foundinapps");
}

- (PPConnectionsFoundInAppsSource)init
{
  void *v3;
  PPConnectionsFoundInAppsSource *v4;

  PPSharedSuggestionsURLService();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PPConnectionsFoundInAppsSource initWithFoundInAppsService:](self, "initWithFoundInAppsService:", v3);

  return v4;
}

- (id)locationItemsWithCriteria:(id)a3 earliest:(id)a4 latest:(id)a5 limit:(unint64_t)a6 consumer:(unint64_t)a7 explanationSet:(id)a8
{
  id v12;
  id v13;
  id v14;
  void *v15;
  dispatch_semaphore_t v16;
  SGSuggestionsServiceURLsProtocol *fiaURLService;
  NSObject *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  _QWORD v24[4];
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void *)objc_opt_new();
  if (a7 == 4 || a7 == 2)
  {
    v16 = dispatch_semaphore_create(0);
    fiaURLService = self->_fiaURLService;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __106__PPConnectionsFoundInAppsSource_locationItemsWithCriteria_earliest_latest_limit_consumer_explanationSet___block_invoke;
    v24[3] = &unk_1E7E170D0;
    v18 = v16;
    v25 = v18;
    v26 = v13;
    v27 = v14;
    v28 = v12;
    v19 = v15;
    v29 = v19;
    -[SGSuggestionsServiceURLsProtocol recentURLsWithLimit:withCompletion:](fiaURLService, "recentURLsWithLimit:withCompletion:", 32, v24);
    objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:", v18);
    pp_connections_log_handle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v19, "count");
      *(_DWORD *)buf = 134217984;
      v31 = v21;
      _os_log_impl(&dword_1C392E000, v20, OS_LOG_TYPE_DEFAULT, "PPConnectionsFoundInAppsSource found %tu urls", buf, 0xCu);
    }

    v22 = v19;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fiaURLService, 0);
}

void __106__PPConnectionsFoundInAppsSource_locationItemsWithCriteria_earliest_latest_limit_consumer_explanationSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  id v50;
  char v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  void *v57;
  uint8_t v58[128];
  uint8_t buf[4];
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v7 = v5;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v8)
    {
      v9 = v8;
      v49 = v6;
      v50 = v5;
      v10 = *(_QWORD *)v54;
      v52 = *(_QWORD *)v54;
      while (1)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v54 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x1C3BD6630]();
          if ((objc_msgSend(v12, "flags") & 1) != 0)
          {
            pp_connections_log_handle();
            v18 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              goto LABEL_30;
            *(_WORD *)buf = 0;
            v22 = v18;
            v23 = "PPConnectionsFoundInAppsSource: ignoring SGURL that is from outgoing document";
            goto LABEL_16;
          }
          if (*(_QWORD *)(a1 + 40))
          {
            objc_msgSend(v12, "receivedAt");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "compare:", *(_QWORD *)(a1 + 40));

            if (v15 == -1)
            {
              pp_connections_log_handle();
              v18 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                goto LABEL_30;
              objc_msgSend(v12, "receivedAt");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v60 = v19;
              v20 = v18;
              v21 = "PPConnectionsFoundInAppsSource: ignoring SGURL that is too old. Received at %@";
              goto LABEL_24;
            }
          }
          if (*(_QWORD *)(a1 + 48))
          {
            objc_msgSend(v12, "receivedAt");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "compare:", *(_QWORD *)(a1 + 48));

            if (v17 == 1)
            {
              pp_connections_log_handle();
              v18 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                goto LABEL_30;
              objc_msgSend(v12, "receivedAt");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v60 = v19;
              v20 = v18;
              v21 = "PPConnectionsFoundInAppsSource: ignoring SGURL that is too new. Received at %@";
LABEL_24:
              _os_log_debug_impl(&dword_1C392E000, v20, OS_LOG_TYPE_DEBUG, v21, buf, 0xCu);

              goto LABEL_30;
            }
          }
          objc_msgSend(*(id *)(a1 + 56), "bundleIdentifier", v49, v50);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "bundleIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v24, "isEqualToString:", v25);

          if (v26)
          {
            pp_connections_log_handle();
            v18 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              goto LABEL_30;
            objc_msgSend(v12, "bundleIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v60 = v19;
            v20 = v18;
            v21 = "PPConnectionsFoundInAppsSource: ignoring SGURL that is from the consumer (%@)";
            goto LABEL_24;
          }
          objc_msgSend(v12, "url");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "scheme");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v28, "isEqualToString:", CFSTR("maps")))
          {

LABEL_26:
            v34 = objc_alloc(MEMORY[0x1E0D70AF0]);
            objc_msgSend(v12, "bundleIdentifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v34, "initWithOriginatingBundleID:", v35);

            objc_msgSend(v12, "url");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setMapItemURL:](v18, "setMapItemURL:", v36);

            objc_msgSend(v12, "documentIdentifier");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setDocumentID:](v18, "setDocumentID:", v37);

            -[NSObject setSource:](v18, "setSource:", CFSTR("foundinapps"));
            objc_msgSend(v12, "receivedAt");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setCreatedAt:](v18, "setCreatedAt:", v38);

            v39 = (void *)MEMORY[0x1E0CB37E8];
            +[PPConnectionsParameters sharedInstance](PPConnectionsParameters, "sharedInstance");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "foundInAppsSourceExpirySeconds");
            objc_msgSend(v39, "numberWithDouble:");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setLifetime:](v18, "setLifetime:", v41);

            objc_msgSend(v12, "receivedFromHandle");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v42, "length");

            if (v43)
            {
              objc_msgSend(v12, "receivedFromHandle");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject setAuthorHandle:](v18, "setAuthorHandle:", v44);

              v45 = (void *)MEMORY[0x1C3BD6630]();
              objc_msgSend(v12, "receivedFromHandle");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = v46;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
              v47 = (void *)objc_claimAutoreleasedReturnValue();

              objc_autoreleasePoolPop(v45);
              -[NSObject setContactHandles:](v18, "setContactHandles:", v47);

            }
            objc_msgSend(*(id *)(a1 + 64), "addObject:", v18);
            v10 = v52;
            goto LABEL_30;
          }
          objc_msgSend(v12, "url");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "host");
          v30 = a1;
          v31 = v9;
          v32 = v7;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v33, "isEqualToString:", CFSTR("maps.apple.com"));

          v7 = v32;
          v9 = v31;
          a1 = v30;

          if ((v51 & 1) != 0)
            goto LABEL_26;
          pp_connections_log_handle();
          v18 = objc_claimAutoreleasedReturnValue();
          v10 = v52;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            v22 = v18;
            v23 = "PPConnectionsFoundInAppsSource: ignoring SGURL that is not a Maps URL.";
LABEL_16:
            _os_log_debug_impl(&dword_1C392E000, v22, OS_LOG_TYPE_DEBUG, v23, buf, 2u);
          }
LABEL_30:

          objc_autoreleasePoolPop(v13);
          ++v11;
        }
        while (v9 != v11);
        v48 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
        v9 = v48;
        if (!v48)
        {
          v6 = v49;
          v5 = v50;
          break;
        }
      }
    }
  }
  else
  {
    pp_connections_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v6;
      _os_log_error_impl(&dword_1C392E000, v7, OS_LOG_TYPE_ERROR, "PPConnectionsFoundInAppsSource: recentURLsWithLimit error: %@", buf, 0xCu);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_5006 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_5006, &__block_literal_global_5007);
  return (id)sharedInstance__pasExprOnceResult_5008;
}

void __48__PPConnectionsFoundInAppsSource_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_5008;
  sharedInstance__pasExprOnceResult_5008 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
