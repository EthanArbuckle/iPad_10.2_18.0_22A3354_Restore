@implementation USWebHistory

- (USWebHistory)initWithEventStorage:(id)a3 mediaUsageStream:(id)a4 webUsageStream:(id)a5 usageTrusted:(BOOL)a6
{
  _DKKnowledgeEventStreamDeleting *v10;
  BMStream *v11;
  BMStream *v12;
  USWebHistory *v13;
  _DKKnowledgeEventStreamDeleting *eventStorage;
  _DKKnowledgeEventStreamDeleting *v15;
  BMStream *mediaUsageStream;
  BMStream *v17;
  BMStream *webUsageStream;
  objc_super v20;

  v10 = (_DKKnowledgeEventStreamDeleting *)a3;
  v11 = (BMStream *)a4;
  v12 = (BMStream *)a5;
  v20.receiver = self;
  v20.super_class = (Class)USWebHistory;
  v13 = -[USWebHistory init](&v20, sel_init);
  eventStorage = v13->_eventStorage;
  v13->_eventStorage = v10;
  v15 = v10;

  mediaUsageStream = v13->_mediaUsageStream;
  v13->_mediaUsageStream = v11;
  v17 = v11;

  webUsageStream = v13->_webUsageStream;
  v13->_webUsageStream = v12;

  v13->_usageTrusted = a6;
  return v13;
}

- (USWebHistory)initWithAuditToken:(id *)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  USWebHistory *v10;

  v4 = +[USUsageTrust validateTrustForSecTask:](USUsageTrust, "validateTrustForSecTask:", 0);
  BiomeLibrary();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "App");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1B0B0], "userKnowledgeStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "MediaUsage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "WebUsage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[USWebHistory initWithEventStorage:mediaUsageStream:webUsageStream:usageTrusted:](self, "initWithEventStorage:mediaUsageStream:webUsageStream:usageTrusted:", v7, v8, v9, v4);

  return v10;
}

- (USWebHistory)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  USWebHistory *v8;

  if (init_onceToken != -1)
    dispatch_once(&init_onceToken, &__block_literal_global_2);
  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "App");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1B0B0], "userKnowledgeStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "MediaUsage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "WebUsage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[USWebHistory initWithEventStorage:mediaUsageStream:webUsageStream:usageTrusted:](self, "initWithEventStorage:mediaUsageStream:webUsageStream:usageTrusted:", v5, v6, v7, init_trusted);

  return v8;
}

BOOL __20__USWebHistory_init__block_invoke()
{
  _BOOL8 result;

  result = +[USUsageTrust validateTrustForSecTask:](USUsageTrust, "validateTrustForSecTask:", 0);
  init_trusted = result;
  return result;
}

- (void)deleteHistoryForURL:(id)a3 webApplication:(id)a4 completionHandler:(id)a5
{
  -[USWebHistory deleteHistoryForURL:webApplication:profileIdentifier:completionHandler:](self, "deleteHistoryForURL:webApplication:profileIdentifier:completionHandler:", a3, a4, 0, a5);
}

- (void)deleteHistoryForURL:(id)a3 webApplication:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
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
  id v45;
  void *v46;
  id v47;
  USWebHistory *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  USWebHistory *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  USWebHistory *v60;
  _QWORD v61[3];
  _QWORD v62[5];

  v62[3] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v47 = a6;
  v12 = a3;
  v50 = (void *)objc_opt_new();
  objc_msgSend(v50, "normalizeURL:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v49 = v13;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(v13, "relativeString");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  -[USWebHistory mediaUsageStream](self, "mediaUsageStream");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "pruner");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x24BDAC760];
  v56[0] = MEMORY[0x24BDAC760];
  v56[1] = 3221225472;
  v56[2] = __87__USWebHistory_deleteHistoryForURL_webApplication_profileIdentifier_completionHandler___block_invoke;
  v56[3] = &unk_24C7DB798;
  v21 = v10;
  v57 = v21;
  v22 = v11;
  v58 = v22;
  v23 = v17;
  v59 = v23;
  v60 = self;
  objc_msgSend(v19, "deleteWithPolicy:eventsPassingTest:", CFSTR("delete-web-history"), v56);

  -[USWebHistory webUsageStream](self, "webUsageStream");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "pruner");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v20;
  v51[1] = 3221225472;
  v51[2] = __87__USWebHistory_deleteHistoryForURL_webApplication_profileIdentifier_completionHandler___block_invoke_2;
  v51[3] = &unk_24C7DB798;
  v26 = v21;
  v52 = v26;
  v27 = v22;
  v53 = v27;
  v45 = v23;
  v54 = v45;
  v55 = self;
  objc_msgSend(v25, "deleteWithPolicy:eventsPassingTest:", CFSTR("delete-web-history"), v51);

  v46 = v26;
  objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForEventsWithStringValue:", v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v27;
  objc_msgSend(MEMORY[0x24BE1B078], "safariProfileID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = self;
  if (v29)
  {
    objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForObjectsWithMetadataKey:andStringValue:", v30, v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = (void *)MEMORY[0x24BDD14C0];
    objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForObjectsWithMetadataKey:", v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "notPredicateWithSubpredicate:", v33);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BE1B078], "webpageURL");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForObjectsWithMetadataKey:andValue:", v34, v49);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)MEMORY[0x24BDD14C0];
  v62[0] = v28;
  v62[1] = v31;
  v62[2] = v35;
  v44 = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "andPredicateWithSubpredicates:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1B010], "URL");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForObjectsWithMetadataKey:andValue:", v39, v49);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)MEMORY[0x24BDD14C0];
  v61[0] = v28;
  v61[1] = v31;
  v61[2] = v40;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 3);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "andPredicateWithSubpredicates:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  -[USWebHistory _deleteEventsWithWebUsagePredicate:videoUsagePredicate:completionHandler:](v48, "_deleteEventsWithWebUsagePredicate:videoUsagePredicate:completionHandler:", v38, v43, v47);
}

uint64_t __87__USWebHistory_deleteHistoryForURL_webApplication_profileIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  int v11;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "safariProfileID");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = *(id *)(a1 + 40);
    if (v5 == v6)
    {

    }
    else
    {
      v7 = v6;
      v8 = objc_msgSend(v5, "isEqual:", v6);

      if (!v8)
      {
        v9 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    objc_msgSend(v3, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 48)))
    {
      v11 = objc_msgSend(v3, "isUsageTrusted");
      v9 = v11 ^ objc_msgSend(*(id *)(a1 + 56), "usageTrusted") ^ 1;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_11;
  }
  v9 = 0;
LABEL_12:

  return v9;
}

uint64_t __87__USWebHistory_deleteHistoryForURL_webApplication_profileIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  int v11;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "safariProfileID");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = *(id *)(a1 + 40);
    if (v5 == v6)
    {

    }
    else
    {
      v7 = v6;
      v8 = objc_msgSend(v5, "isEqual:", v6);

      if (!v8)
      {
        v9 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    objc_msgSend(v3, "webpageURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 48)))
    {
      v11 = objc_msgSend(v3, "isUsageTrusted");
      v9 = v11 ^ objc_msgSend(*(id *)(a1 + 56), "usageTrusted") ^ 1;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_11;
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (void)deleteHistoryForURLs:(id)a3 webApplication:(id)a4 completionHandler:(id)a5
{
  -[USWebHistory deleteHistoryForURLs:webApplication:profileIdentifier:completionHandler:](self, "deleteHistoryForURLs:webApplication:profileIdentifier:completionHandler:", a3, a4, 0, a5);
}

- (void)deleteHistoryForURLs:(id)a3 webApplication:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6
{
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
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
  id v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id obj;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  USWebHistory *v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  USWebHistory *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[3];
  _QWORD v73[3];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v49 = a4;
  v47 = a5;
  v51 = a6;
  v10 = objc_msgSend(v9, "count");
  v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v10);
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v10);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", v10);
  v55 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE1B078], "webpageURL");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B010], "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = v9;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v69 != v15)
          objc_enumerationMutation(obj);
        objc_msgSend(v55, "normalizeURL:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "absoluteString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          v20 = v18;
        }
        else
        {
          objc_msgSend(v17, "relativeString");
          v20 = (id)objc_claimAutoreleasedReturnValue();
        }
        v21 = v20;

        objc_msgSend(v11, "addObject:", v21);
        objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForObjectsWithMetadataKey:andValue:", v54, v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "addObject:", v22);
        objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForObjectsWithMetadataKey:andValue:", v12, v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "addObject:", v23);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
    }
    while (v14);
  }

  -[USWebHistory mediaUsageStream](self, "mediaUsageStream");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "pruner");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x24BDAC760];
  v63[0] = MEMORY[0x24BDAC760];
  v63[1] = 3221225472;
  v63[2] = __88__USWebHistory_deleteHistoryForURLs_webApplication_profileIdentifier_completionHandler___block_invoke;
  v63[3] = &unk_24C7DB798;
  v27 = v49;
  v64 = v27;
  v28 = v47;
  v65 = v28;
  v29 = v11;
  v66 = v29;
  v67 = self;
  objc_msgSend(v25, "deleteWithPolicy:eventsPassingTest:", CFSTR("delete-web-history"), v63);

  -[USWebHistory webUsageStream](self, "webUsageStream");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "pruner");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v26;
  v58[1] = 3221225472;
  v58[2] = __88__USWebHistory_deleteHistoryForURLs_webApplication_profileIdentifier_completionHandler___block_invoke_2;
  v58[3] = &unk_24C7DB798;
  v32 = v27;
  v59 = v32;
  v33 = v28;
  v60 = v33;
  v50 = v29;
  v61 = v50;
  v62 = self;
  objc_msgSend(v31, "deleteWithPolicy:eventsPassingTest:", CFSTR("delete-web-history"), v58);

  objc_msgSend(MEMORY[0x24BDD14C0], "orPredicateWithSubpredicates:", v57);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14C0], "orPredicateWithSubpredicates:", v56);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForEventsWithStringValue:", v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v33;
  objc_msgSend(MEMORY[0x24BE1B078], "safariProfileID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForObjectsWithMetadataKey:andStringValue:", v36, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v38 = (void *)MEMORY[0x24BDD14C0];
    objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForObjectsWithMetadataKey:", v36);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "notPredicateWithSubpredicate:", v39);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v40 = (void *)MEMORY[0x24BDD14C0];
  v73[0] = v34;
  v73[1] = v37;
  v73[2] = v48;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 3);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "andPredicateWithSubpredicates:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = (void *)MEMORY[0x24BDD14C0];
  v72[0] = v34;
  v72[1] = v37;
  v72[2] = v46;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v72, 3);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "andPredicateWithSubpredicates:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  -[USWebHistory _deleteEventsWithWebUsagePredicate:videoUsagePredicate:completionHandler:](self, "_deleteEventsWithWebUsagePredicate:videoUsagePredicate:completionHandler:", v42, v45, v51);
}

uint64_t __88__USWebHistory_deleteHistoryForURLs_webApplication_profileIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "safariProfileID");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = *(id *)(a1 + 40);
    if (v5 == v6)
    {

    }
    else
    {
      v7 = v6;
      v8 = objc_msgSend(v5, "isEqual:", v6);

      if (!v8)
      {
        v9 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    v10 = *(void **)(a1 + 48);
    objc_msgSend(v3, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "containsObject:", v11))
    {
      v12 = objc_msgSend(v3, "isUsageTrusted");
      v9 = v12 ^ objc_msgSend(*(id *)(a1 + 56), "usageTrusted") ^ 1;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_11;
  }
  v9 = 0;
LABEL_12:

  return v9;
}

uint64_t __88__USWebHistory_deleteHistoryForURLs_webApplication_profileIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "safariProfileID");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = *(id *)(a1 + 40);
    if (v5 == v6)
    {

    }
    else
    {
      v7 = v6;
      v8 = objc_msgSend(v5, "isEqual:", v6);

      if (!v8)
      {
        v9 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    v10 = *(void **)(a1 + 48);
    objc_msgSend(v3, "webpageURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "containsObject:", v11))
    {
      v12 = objc_msgSend(v3, "isUsageTrusted");
      v9 = v12 ^ objc_msgSend(*(id *)(a1 + 56), "usageTrusted") ^ 1;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_11;
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (void)deleteHistoryForDomain:(id)a3 webApplication:(id)a4 completionHandler:(id)a5
{
  -[USWebHistory deleteHistoryForDomain:webApplication:profileIdentifier:completionHandler:](self, "deleteHistoryForDomain:webApplication:profileIdentifier:completionHandler:", a3, a4, 0, a5);
}

- (void)deleteHistoryForDomain:(id)a3 webApplication:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  USWebHistory *v36;
  _QWORD v37[4];

  v37[3] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v30 = a6;
  v12 = a3;
  v31 = (void *)objc_opt_new();
  objc_msgSend(v31, "normalizeDomainName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[USWebHistory webUsageStream](self, "webUsageStream");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pruner");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __90__USWebHistory_deleteHistoryForDomain_webApplication_profileIdentifier_completionHandler___block_invoke;
  v32[3] = &unk_24C7DB798;
  v16 = v10;
  v33 = v16;
  v17 = v11;
  v34 = v17;
  v18 = v13;
  v35 = v18;
  v36 = self;
  objc_msgSend(v15, "deleteWithPolicy:eventsPassingTest:", CFSTR("delete-web-history"), v32);

  objc_msgSend(MEMORY[0x24BE1B078], "webDomain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForObjectsWithMetadataKey:andStringValue:", v19, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForEventsWithStringValue:", v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v17;
  objc_msgSend(MEMORY[0x24BE1B078], "safariProfileID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForObjectsWithMetadataKey:andStringValue:", v23, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = (void *)MEMORY[0x24BDD14C0];
    objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForObjectsWithMetadataKey:", v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "notPredicateWithSubpredicate:", v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v27 = (void *)MEMORY[0x24BDD14C0];
  v37[0] = v20;
  v37[1] = v21;
  v37[2] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "andPredicateWithSubpredicates:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[USWebHistory _deleteEventsWithPredicate:completionHandler:](self, "_deleteEventsWithPredicate:completionHandler:", v29, v30);
}

uint64_t __90__USWebHistory_deleteHistoryForDomain_webApplication_profileIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  int v11;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "safariProfileID");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = *(id *)(a1 + 40);
    if (v5 == v6)
    {

    }
    else
    {
      v7 = v6;
      v8 = objc_msgSend(v5, "isEqual:", v6);

      if (!v8)
      {
        v9 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    objc_msgSend(v3, "webDomain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 48)))
    {
      v11 = objc_msgSend(v3, "isUsageTrusted");
      v9 = v11 ^ objc_msgSend(*(id *)(a1 + 56), "usageTrusted") ^ 1;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_11;
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (void)deleteHistoryDuringInterval:(id)a3 webApplication:(id)a4 completionHandler:(id)a5
{
  -[USWebHistory deleteHistoryDuringInterval:webApplication:profileIdentifier:completionHandler:](self, "deleteHistoryDuringInterval:webApplication:profileIdentifier:completionHandler:", a3, a4, 0, a5);
}

- (void)deleteHistoryDuringInterval:(id)a3 webApplication:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = (void *)MEMORY[0x24BE1B0F8];
  v12 = a6;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v14, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "endDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "predicateForEventsIntersectingDateRangeFrom:to:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForEventsWithStringValue:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v10;
  objc_msgSend(MEMORY[0x24BE1B078], "safariProfileID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForObjectsWithMetadataKey:andStringValue:", v20, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = (void *)MEMORY[0x24BDD14C0];
    objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForObjectsWithMetadataKey:", v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "notPredicateWithSubpredicate:", v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v24 = (void *)MEMORY[0x24BDD14C0];
  v27[0] = v17;
  v27[1] = v18;
  v27[2] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "andPredicateWithSubpredicates:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[USWebHistory _deleteEventsWithWebUsagePredicate:videoUsagePredicate:completionHandler:](self, "_deleteEventsWithWebUsagePredicate:videoUsagePredicate:completionHandler:", v26, v26, v12);
}

- (void)deleteAllHistoryForApplication:(id)a3 completionHandler:(id)a4
{
  -[USWebHistory deleteAllHistoryForApplication:profileIdentifier:completionHandler:](self, "deleteAllHistoryForApplication:profileIdentifier:completionHandler:", a3, 0, a4);
}

- (void)deleteAllHistoryForApplication:(id)a3 profileIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  id v34;
  USWebHistory *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  USWebHistory *v39;
  _QWORD v40[4];

  v40[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[USWebHistory mediaUsageStream](self, "mediaUsageStream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pruner");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __83__USWebHistory_deleteAllHistoryForApplication_profileIdentifier_completionHandler___block_invoke;
  v36[3] = &unk_24C7DB7C0;
  v14 = v8;
  v37 = v14;
  v15 = v9;
  v38 = v15;
  v39 = self;
  objc_msgSend(v12, "deleteWithPolicy:eventsPassingTest:", CFSTR("delete-web-history"), v36);

  -[USWebHistory webUsageStream](self, "webUsageStream");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pruner");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v13;
  v30 = 3221225472;
  v31 = __83__USWebHistory_deleteAllHistoryForApplication_profileIdentifier_completionHandler___block_invoke_2;
  v32 = &unk_24C7DB7C0;
  v18 = v14;
  v33 = v18;
  v19 = v15;
  v34 = v19;
  v35 = self;
  objc_msgSend(v17, "deleteWithPolicy:eventsPassingTest:", CFSTR("delete-web-history"), &v29);

  objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForEventsWithStringValue:", v18, v29, v30, v31, v32);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19;
  objc_msgSend(MEMORY[0x24BE1B078], "safariProfileID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForObjectsWithMetadataKey:andStringValue:", v22, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = (void *)MEMORY[0x24BDD14C0];
    objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForObjectsWithMetadataKey:", v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "notPredicateWithSubpredicate:", v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v26 = (void *)MEMORY[0x24BDD14C0];
  v40[0] = v20;
  v40[1] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "andPredicateWithSubpredicates:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[USWebHistory _deleteEventsWithWebUsagePredicate:videoUsagePredicate:completionHandler:](self, "_deleteEventsWithWebUsagePredicate:videoUsagePredicate:completionHandler:", v28, v28, v10);
}

uint64_t __83__USWebHistory_deleteAllHistoryForApplication_profileIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  int v10;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "safariProfileID");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = *(id *)(a1 + 40);
    if (v5 == v6)
    {

    }
    else
    {
      v7 = v6;
      v8 = objc_msgSend(v5, "isEqual:", v6);

      if (!v8)
      {
        v9 = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    v10 = objc_msgSend(v3, "isUsageTrusted");
    v9 = v10 ^ objc_msgSend(*(id *)(a1 + 48), "usageTrusted") ^ 1;
    goto LABEL_8;
  }
  v9 = 0;
LABEL_9:

  return v9;
}

uint64_t __83__USWebHistory_deleteAllHistoryForApplication_profileIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  int v10;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "safariProfileID");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = *(id *)(a1 + 40);
    if (v5 == v6)
    {

    }
    else
    {
      v7 = v6;
      v8 = objc_msgSend(v5, "isEqual:", v6);

      if (!v8)
      {
        v9 = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    v10 = objc_msgSend(v3, "isUsageTrusted");
    v9 = v10 ^ objc_msgSend(*(id *)(a1 + 48), "usageTrusted") ^ 1;
    goto LABEL_8;
  }
  v9 = 0;
LABEL_9:

  return v9;
}

- (void)_deleteEventsWithPredicate:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[3];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[USWebHistory eventStorage](self, "eventStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B130], "appWebUsageStream");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BE1B0F8];
  objc_msgSend(v9, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateForEventsWithStreamName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[USWebHistory usageTrusted](self, "usageTrusted");
  objc_msgSend(MEMORY[0x24BE1B078], "isUsageTrusted");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForObjectsWithMetadataKey:andIntegerValue:", v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0x24BDBC000;
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForObjectsWithMetadataKey:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14C0], "notPredicateWithSubpredicate:", v17);
    v29 = v7;
    v30 = v9;
    v18 = v12;
    v19 = v8;
    v20 = v6;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x24BDD14C0];
    v34[0] = v15;
    v34[1] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "orPredicateWithSubpredicates:", v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v6 = v20;
    v8 = v19;
    v12 = v18;
    v7 = v29;

    v16 = 0x24BDBC000uLL;
    v15 = (void *)v24;
    v9 = v30;
  }
  v25 = (void *)MEMORY[0x24BDD14C0];
  v33[0] = v12;
  v33[1] = v15;
  v33[2] = v6;
  objc_msgSend(*(id *)(v16 + 3632), "arrayWithObjects:count:", v33, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "andPredicateWithSubpredicates:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __61__USWebHistory__deleteEventsWithPredicate_completionHandler___block_invoke;
  v31[3] = &unk_24C7DB7E8;
  v32 = v7;
  v28 = v7;
  objc_msgSend(v8, "deleteAllEventsMatchingPredicate:responseQueue:withCompletion:", v27, 0, v31);

}

void __61__USWebHistory__deleteEventsWithPredicate_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a2;
    _os_log_impl(&dword_20D894000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Deleted %lu web usage events", (uint8_t *)&v6, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_deleteEventsWithWebUsagePredicate:(id)a3 videoUsagePredicate:(id)a4 completionHandler:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[2];
  _QWORD v42[3];
  _QWORD v43[3];
  _QWORD v44[4];

  v44[2] = *MEMORY[0x24BDAC8D0];
  v38 = a3;
  v37 = a4;
  v8 = a5;
  -[USWebHistory eventStorage](self, "eventStorage");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = -[USWebHistory usageTrusted](self, "usageTrusted");
  objc_msgSend(MEMORY[0x24BE1B078], "isUsageTrusted");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForObjectsWithMetadataKey:andIntegerValue:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)v9;
  if ((_DWORD)a5)
  {
    objc_msgSend(MEMORY[0x24BE1B0F8], "predicateForObjectsWithMetadataKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14C0], "notPredicateWithSubpredicate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v8;
    v14 = (void *)MEMORY[0x24BDD14C0];
    v44[0] = v10;
    v44[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "orPredicateWithSubpredicates:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v16;
    v8 = v13;
  }
  objc_msgSend(MEMORY[0x24BE1B130], "appWebUsageStream");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BE1B0F8];
  objc_msgSend(v34, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "predicateForEventsWithStreamName:", v18);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x24BDD14C0];
  v43[0] = v33;
  v43[1] = v38;
  v43[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "andPredicateWithSubpredicates:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1B130], "appMediaUsageStream");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x24BE1B0F8];
  objc_msgSend(v22, "name");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "predicateForEventsWithStreamName:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x24BDD14C0];
  v42[0] = v25;
  v42[1] = v37;
  v42[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "andPredicateWithSubpredicates:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x24BDD14C0];
  v41[0] = v21;
  v41[1] = v28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "orPredicateWithSubpredicates:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __89__USWebHistory__deleteEventsWithWebUsagePredicate_videoUsagePredicate_completionHandler___block_invoke;
  v39[3] = &unk_24C7DB7E8;
  v40 = v8;
  v32 = v8;
  objc_msgSend(v36, "deleteAllEventsMatchingPredicate:responseQueue:withCompletion:", v31, 0, v39);

}

void __89__USWebHistory__deleteEventsWithWebUsagePredicate_videoUsagePredicate_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a2;
    _os_log_impl(&dword_20D894000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Deleted %lu web and video usage events", (uint8_t *)&v6, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)usageTrusted
{
  return self->_usageTrusted;
}

- (_DKKnowledgeEventStreamDeleting)eventStorage
{
  return (_DKKnowledgeEventStreamDeleting *)objc_getProperty(self, a2, 16, 1);
}

- (BMStream)mediaUsageStream
{
  return (BMStream *)objc_getProperty(self, a2, 24, 1);
}

- (BMStream)webUsageStream
{
  return (BMStream *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webUsageStream, 0);
  objc_storeStrong((id *)&self->_mediaUsageStream, 0);
  objc_storeStrong((id *)&self->_eventStorage, 0);
}

@end
