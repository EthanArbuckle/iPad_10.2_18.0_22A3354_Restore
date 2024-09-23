@implementation USApplicationUsageMonitor

- (USApplicationUsageMonitor)init
{
  USApplicationUsageMonitor *v2;
  USApplicationUsageMonitor *v3;
  NSDictionary *inUseApplicationEvents;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BMSource *appUsageSource;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)USApplicationUsageMonitor;
  v2 = -[_DKMonitor init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    inUseApplicationEvents = v2->_inUseApplicationEvents;
    v2->_inUseApplicationEvents = (NSDictionary *)MEMORY[0x24BDBD1B8];

    BiomeLibrary();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ScreenTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "AppUsage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "source");
    v8 = objc_claimAutoreleasedReturnValue();
    appUsageSource = v3->_appUsageSource;
    v3->_appUsageSource = (BMSource *)v8;

  }
  return v3;
}

+ (id)eventStream
{
  return CFSTR("AppUsage");
}

+ (BOOL)shouldMergeUnchangedEvents
{
  return 1;
}

+ (id)_eventWithBundleIdentifier:(id)a3 startDate:(id)a4 usageType:(int64_t)a5 usageTrusted:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  _QWORD v47[2];
  _QWORD v48[3];

  v6 = a6;
  v48[2] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  v12 = 0;
  if (v9 && v10)
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.springboard.stand-by")))
    {
      v13 = (void *)MEMORY[0x24BE1B080];
      objc_msgSend(MEMORY[0x24BE1B130], "appUsageStream");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1B050], "withBundle:", CFSTR("com.apple.springboard.stand-by"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1B078], "usageType");
      v17 = objc_claimAutoreleasedReturnValue();
      v47[0] = v17;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v18;
      objc_msgSend(MEMORY[0x24BE1B078], "isUsageTrusted");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v47[1] = v19;
      v48[1] = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v13;
      v22 = (id)v15;
      objc_msgSend(v21, "eventWithStream:startDate:endDate:value:metadata:", v14, v11, v15, v16, v20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
      goto LABEL_24;
    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B078], "usageType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v23, v24);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B078], "isUsageTrusted");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v25, v26);

    v45 = 0;
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v9, 1, &v45);
    v22 = v45;
    if (v22)
    {
      objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        +[USApplicationUsageMonitor _eventWithBundleIdentifier:startDate:usageType:usageTrusted:].cold.2((uint64_t)v9, (uint64_t)v22, v17);
      v12 = 0;
      goto LABEL_23;
    }
    objc_msgSend(v16, "shortVersionString");
    v27 = objc_claimAutoreleasedReturnValue();
    v17 = v27;
    if (v27 && -[NSObject length](v27, "length"))
    {
      objc_msgSend(MEMORY[0x24BE1B020], "shortVersionString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, v28);

    }
    objc_msgSend(v16, "exactBundleVersion");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "length"))
    {
      objc_msgSend(MEMORY[0x24BE1B020], "exactBundleVersion");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v29, v30);

    }
    objc_msgSend(v16, "appClipMetadata");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v31;
    if (v31)
    {
      objc_msgSend(v31, "parentApplicationIdentifiers");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "firstObject");
      v33 = objc_claimAutoreleasedReturnValue();

      v34 = (void *)v33;
      v46 = 0;
      if (!CPCopyBundleIdentifierAndTeamFromApplicationIdentifier() || (v35 = v46) == 0)
      {
        objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
          +[USApplicationUsageMonitor _eventWithBundleIdentifier:startDate:usageType:usageTrusted:].cold.1((uint64_t)v9, v38);
        v12 = 0;
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x24BE1B000], "appBundleID");
      v43 = v34;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v35, v36);

    }
    v34 = (void *)objc_msgSend(v14, "copy");
    v37 = (void *)MEMORY[0x24BE1B080];
    objc_msgSend(MEMORY[0x24BE1B130], "appUsageStream");
    v38 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B050], "withBundle:", v9);
    v42 = v29;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "eventWithStream:startDate:endDate:value:metadata:", v38, v11, v39, v40, v34);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v42;
    v22 = 0;
LABEL_22:

    goto LABEL_23;
  }
LABEL_24:

  return v12;
}

- (void)clearAppWebAndMediaUsageInContextStoreMatchingBundleIDs:(id)a3 clearAll:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  NSObject *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  id v26;
  void *v27;
  void *v28;
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
  NSObject *v42;
  void *v43;
  void (**v44)(_QWORD, _QWORD);
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  id obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v4 = a4;
  v63 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[USApplicationUsageMonitor clearAppWebAndMediaUsageInContextStoreMatchingBundleIDs:clearAll:].cold.1((uint64_t)v5, v6);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8 = 0x24BE1B000uLL;
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForAppWebUsageDataDictionaries");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(MEMORY[0x24BE1B180], "appWebUsageBundleID");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v48 = v5;
  v49 = v7;
  if (v4)
    objc_msgSend(v10, "predicateWithFormat:", CFSTR("SELF.%K != %@"), v11, 0);
  else
    objc_msgSend(v10, "predicateWithFormat:", CFSTR("SELF.%K IN %@"), v11, v5);
  v13 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)v13;
  v47 = (void *)v9;
  objc_msgSend(v14, "removeObjectsMatchingPredicate:fromArrayAtKeyPath:", v13, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v15;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v55;
    v50 = *(_QWORD *)v55;
    do
    {
      v19 = 0;
      v52 = v17;
      do
      {
        if (*(_QWORD *)v55 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v19);
        objc_msgSend(*(id *)(v8 + 384), "appWebUsageStartDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(v8 + 384), "appWebUsageBundleID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
          v25 = v24 == 0;
        else
          v25 = 1;
        if (!v25)
        {
          v26 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          objc_msgSend(*(id *)(v8 + 384), "appWebUsageWepageURL");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            objc_msgSend(MEMORY[0x24BE1B078], "webpageURL");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, v29);

          }
          objc_msgSend(*(id *)(v8 + 384), "appWebUsageWebDomain");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31)
          {
            objc_msgSend(MEMORY[0x24BE1B078], "webDomain");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v31, v32);

          }
          objc_msgSend(*(id *)(v8 + 384), "isUsageTrusted");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (v34)
          {
            objc_msgSend(MEMORY[0x24BE1B078], "isUsageTrusted");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v34, v35);

          }
          objc_msgSend(*(id *)(v8 + 384), "appWebUsageType");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (v37)
          {
            objc_msgSend(MEMORY[0x24BE1B078], "usageType");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v37, v38);

          }
          v39 = (void *)MEMORY[0x24BE1B080];
          objc_msgSend(MEMORY[0x24BE1B130], "appWebUsageStream");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "eventWithStream:source:startDate:endDate:identifierStringValue:metadata:", v40, 0, v22, v51, v24, v26);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (v41)
            objc_msgSend(v49, "addObject:", v41);

          v8 = 0x24BE1B000;
          v18 = v50;
          v17 = v52;
        }

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    }
    while (v17);
  }

  if (objc_msgSend(v49, "count"))
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v49, "count"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v59 = v43;
      v60 = 2112;
      v61 = v48;
      _os_log_impl(&dword_20D894000, v42, OS_LOG_TYPE_INFO, "Cleared %@ events from bundleIDs: %@", buf, 0x16u);

    }
    -[_DKMonitor historicalHandler](self, "historicalHandler");
    v44 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v44)[2](v44, v49);

  }
}

- (void)updateAppDataInContextStore
{
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id obj;
  USApplicationUsageMonitor *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  _QWORD v56[4];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v41 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[USApplicationUsageMonitor inUseApplicationEvents](self, "inUseApplicationEvents");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v45)
  {
    v43 = self;
    v44 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v45; ++i)
      {
        if (*(_QWORD *)v52 != v44)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        -[USApplicationUsageMonitor inUseApplicationEvents](self, "inUseApplicationEvents");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "startDate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          objc_msgSend(v6, "metadata");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE1B000], "appBundleID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v9);
          v10 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "stringValue");
          v11 = objc_claimAutoreleasedReturnValue();
          v50 = (void *)v10;
          if (v10)
          {
            v46 = (void *)v11;
            v49 = v4;
          }
          else
          {
            if (!v11)
              goto LABEL_26;
            v49 = v4;
            v50 = (void *)v11;
            v46 = 0;
          }
          objc_msgSend(v6, "metadata");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE1B078], "usageType");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v13);
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = (void *)v14;
          v16 = &unk_24C7E05F0;
          if (v14)
            v16 = (void *)v14;
          v17 = v16;

          objc_msgSend(v6, "metadata");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE1B078], "isUsageTrusted");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v19);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)v20;
          v22 = (void *)MEMORY[0x24BDBD1C8];
          if (v20)
            v22 = (void *)v20;
          v23 = v22;

          objc_msgSend(MEMORY[0x24BE1B180], "appUsageBundleID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v55[0] = v24;
          v56[0] = v50;
          objc_msgSend(MEMORY[0x24BE1B180], "appUsageStartDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v55[1] = v25;
          v56[1] = v7;
          objc_msgSend(MEMORY[0x24BE1B180], "appUsageType");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v55[2] = v26;
          v48 = v17;
          v56[2] = v17;
          objc_msgSend(MEMORY[0x24BE1B180], "isUsageTrusted");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v55[3] = v27;
          v47 = v23;
          v56[3] = v23;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, v55, 4);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(v28, "mutableCopy");

          if (v46)
          {
            objc_msgSend(MEMORY[0x24BE1B180], "clipBundleIDKey");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setObject:forKeyedSubscript:", v46, v30);

          }
          if ((objc_msgSend(v49, "isEqualToString:", CFSTR("com.apple.springboard.stand-by")) & 1) == 0)
          {
            v31 = (void *)objc_msgSend(v29, "copy");
            objc_msgSend(v41, "addObject:", v31);

          }
          v32 = objc_alloc(MEMORY[0x24BE0C608]);
          if (v46)
            v33 = v46;
          else
            v33 = v50;
          if (v46)
            v34 = v50;
          else
            v34 = 0;
          v35 = (void *)objc_msgSend(v32, "initWithStarting:absoluteTimestamp:bundleID:parentBundleID:isUsageTrusted:", MEMORY[0x24BDBD1C8], v7, v33, v34, v47);
          -[USApplicationUsageMonitor appUsageSource](v43, "appUsageSource");
          v36 = v29;
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "timeIntervalSinceReferenceDate");
          objc_msgSend(v37, "sendEvent:timestamp:", v35);

          self = v43;
        }
LABEL_26:

      }
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v45);
  }

  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForAppUsageDataDictionaries");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v41, "copy");
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v39, v38);

}

- (void)obtainCurrentValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[USApplicationUsageMonitor monitor](self, "monitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[USApplicationUsageMonitor updateActiveApplicationsWithLayout:displayType:](self, "updateActiveApplicationsWithLayout:displayType:", v4, 0);

  -[USApplicationUsageMonitor carPlayMonitor](self, "carPlayMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[USApplicationUsageMonitor updateActiveApplicationsWithLayout:displayType:](self, "updateActiveApplicationsWithLayout:displayType:", v6, 1);

  -[USApplicationUsageMonitor externalMonitor](self, "externalMonitor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[USApplicationUsageMonitor updateActiveApplicationsWithLayout:displayType:](self, "updateActiveApplicationsWithLayout:displayType:", v7, 2);

}

- (void)updateActiveApplicationsWithLayout:(id)a3 displayType:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  USApplicationUsageMonitor *v11;
  unint64_t v12;

  v6 = a3;
  -[_DKMonitor queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__USApplicationUsageMonitor_updateActiveApplicationsWithLayout_displayType___block_invoke;
  block[3] = &unk_24C7DAB38;
  v11 = self;
  v12 = a4;
  v10 = v6;
  v8 = v6;
  dispatch_sync(v7, block);

}

void __76__USApplicationUsageMonitor_updateActiveApplicationsWithLayout_displayType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __CFString *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "displayBacklightLevel");
  v3 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  if (v2)
  {
    v19 = v3;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "elements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v10, "bundleIdentifier");
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v11
            || (objc_msgSend(v10, "identifier"),
                v12 = (void *)objc_claimAutoreleasedReturnValue(),
                v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.springboard.stand-by")),
                v12,
                v11 = CFSTR("com.apple.springboard.stand-by"),
                v13))
          {
            if ((-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("com.apple.SleepLockScreen")) & 1) == 0)
              objc_msgSend(v4, "addObject:", v11);
          }
          else
          {
            v11 = 0;
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v7);
    }

    v3 = (id)objc_msgSend(v4, "copy");
  }
  switch(*(_QWORD *)(a1 + 48))
  {
    case 0:
      objc_msgSend(*(id *)(a1 + 40), "setActiveApplications:", v3);
      break;
    case 1:
      objc_msgSend(*(id *)(a1 + 40), "setActiveCarPlayApplications:", v3);
      break;
    case 2:
      objc_msgSend(*(id *)(a1 + 40), "setActiveExternalApplications:", v3);
      break;
    case 3:
      objc_msgSend(*(id *)(a1 + 40), "setActiveContinuityApplications:", v3);
      break;
    default:
      break;
  }
  objc_msgSend(*(id *)(a1 + 40), "activeApplications");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionSet:", v14);

  objc_msgSend(*(id *)(a1 + 40), "activeCarPlayApplications");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionSet:", v15);

  objc_msgSend(*(id *)(a1 + 40), "activeExternalApplications");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionSet:", v16);

  objc_msgSend(*(id *)(a1 + 40), "activeContinuityApplications");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionSet:", v17);

  v18 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(*(id *)(a1 + 40), "updateInUseApplications:activeApplications:", v18, 0);

}

- (void)platformSpecificStart
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];

  objc_msgSend(MEMORY[0x24BE38448], "configurationForDefaultMainDisplayMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUserInteractivePriority:", 0);
  v4 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __50__USApplicationUsageMonitor_platformSpecificStart__block_invoke;
  v14[3] = &unk_24C7DAB60;
  v14[4] = self;
  objc_msgSend(v3, "setTransitionHandler:", v14);
  objc_msgSend(MEMORY[0x24BE38438], "monitorWithConfiguration:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[USApplicationUsageMonitor setMonitor:](self, "setMonitor:", v5);

  objc_msgSend(MEMORY[0x24BE38448], "configurationForCarDisplayMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "setNeedsUserInteractivePriority:", 0);
    v13[0] = v4;
    v13[1] = 3221225472;
    v13[2] = __50__USApplicationUsageMonitor_platformSpecificStart__block_invoke_2;
    v13[3] = &unk_24C7DAB60;
    v13[4] = self;
    objc_msgSend(v6, "setTransitionHandler:", v13);
    objc_msgSend(MEMORY[0x24BE38438], "monitorWithConfiguration:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[USApplicationUsageMonitor setCarPlayMonitor:](self, "setCarPlayMonitor:", v7);

  }
  objc_msgSend(MEMORY[0x24BE38448], "configurationForContinuityDisplay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "setNeedsUserInteractivePriority:", 0);
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __50__USApplicationUsageMonitor_platformSpecificStart__block_invoke_3;
    v12[3] = &unk_24C7DAB60;
    v12[4] = self;
    objc_msgSend(v8, "setTransitionHandler:", v12);
    objc_msgSend(MEMORY[0x24BE38438], "monitorWithConfiguration:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[USApplicationUsageMonitor setContinuityMonitor:](self, "setContinuityMonitor:", v9);

  }
  v10 = objc_alloc_init(MEMORY[0x24BE38450]);
  -[USApplicationUsageMonitor setDisplayMonitor:](self, "setDisplayMonitor:", v10);

  -[USApplicationUsageMonitor displayMonitor](self, "displayMonitor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:", self);

}

uint64_t __50__USApplicationUsageMonitor_platformSpecificStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateActiveApplicationsWithLayout:displayType:", a3, 0);
}

uint64_t __50__USApplicationUsageMonitor_platformSpecificStart__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateActiveApplicationsWithLayout:displayType:", a3, 1);
}

uint64_t __50__USApplicationUsageMonitor_platformSpecificStart__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateActiveApplicationsWithLayout:displayType:", a3, 3);
}

- (void)platformSpecificStop
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[USApplicationUsageMonitor monitor](self, "monitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[USApplicationUsageMonitor setMonitor:](self, "setMonitor:", 0);
  -[USApplicationUsageMonitor setActiveApplications:](self, "setActiveApplications:", 0);
  -[USApplicationUsageMonitor carPlayMonitor](self, "carPlayMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[USApplicationUsageMonitor setCarPlayMonitor:](self, "setCarPlayMonitor:", 0);
  -[USApplicationUsageMonitor setActiveCarPlayApplications:](self, "setActiveCarPlayApplications:", 0);
  -[USApplicationUsageMonitor externalMonitor](self, "externalMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[USApplicationUsageMonitor setExternalMonitor:](self, "setExternalMonitor:", 0);
  -[USApplicationUsageMonitor setActiveExternalApplications:](self, "setActiveExternalApplications:", 0);
  -[USApplicationUsageMonitor continuityMonitor](self, "continuityMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[USApplicationUsageMonitor setContinuityMonitor:](self, "setContinuityMonitor:", 0);
  -[USApplicationUsageMonitor setActiveContinuityApplications:](self, "setActiveContinuityApplications:", 0);
  -[USApplicationUsageMonitor displayMonitor](self, "displayMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  -[USApplicationUsageMonitor setDisplayMonitor:](self, "setDisplayMonitor:", 0);
}

- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  SBSCreateLayoutServiceEndpointForExternalDisplay();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE38448], "configurationWithEndpoint:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setNeedsUserInteractivePriority:", 0);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __81__USApplicationUsageMonitor_displayMonitor_didConnectIdentity_withConfiguration___block_invoke;
    v12[3] = &unk_24C7DAB60;
    v12[4] = self;
    objc_msgSend(v8, "setTransitionHandler:", v12);
    objc_msgSend(MEMORY[0x24BE38438], "monitorWithConfiguration:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[USApplicationUsageMonitor externalMonitor](self, "externalMonitor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[USApplicationUsageMonitor externalMonitor](self, "externalMonitor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "invalidate");

      -[USApplicationUsageMonitor setExternalMonitor:](self, "setExternalMonitor:", 0);
    }
    -[USApplicationUsageMonitor setExternalMonitor:](self, "setExternalMonitor:", v9);

  }
}

uint64_t __81__USApplicationUsageMonitor_displayMonitor_didConnectIdentity_withConfiguration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateActiveApplicationsWithLayout:displayType:", a3, 2);
}

- (void)updateInUseApplications:(id)a3 activeApplications:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void (**v52)(_QWORD, _QWORD);
  void *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  id obj;
  id v59;
  USApplicationUsageMonitor *v60;
  uint64_t v61;
  id v62;
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
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[_DKMonitor queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[USApplicationUsageMonitor inUseApplicationEvents](self, "inUseApplicationEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x24BDBCF20]);
  objc_msgSend(v7, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithArray:", v9);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", v10) & 1) == 0)
  {
    v53 = v10;
    v54 = v5;
    v55 = (void *)objc_msgSend(v7, "mutableCopy");
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v12 = v5;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
    v56 = v7;
    obj = v12;
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v72 != v15)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v18)
          {
            -[USApplicationUsageMonitor activeCarPlayApplications](self, "activeCarPlayApplications");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "containsObject:", v17);

            if (v20)
              v21 = 3;
            else
              v21 = 1;
            +[USApplicationUsageMonitor _eventWithBundleIdentifier:startDate:usageType:usageTrusted:](USApplicationUsageMonitor, "_eventWithBundleIdentifier:startDate:usageType:usageTrusted:", v17, v11, v21, 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
              objc_msgSend(v55, "setObject:forKey:", v18, v17);
            v7 = v56;
          }

        }
        v12 = obj;
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
      }
      while (v14);
    }

    v22 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v62 = v7;
    v23 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v68;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v68 != v25)
            objc_enumerationMutation(v62);
          v27 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j);
          if ((objc_msgSend(v12, "containsObject:", v27) & 1) == 0)
          {
            objc_msgSend(v22, "addObject:", v27);
            objc_msgSend(v55, "removeObjectForKey:", v27);
          }
        }
        v24 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
      }
      while (v24);
    }
    v60 = self;

    v57 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v59 = v22;
    v28 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
    if (v28)
    {
      v29 = v28;
      v61 = *(_QWORD *)v64;
      do
      {
        for (k = 0; k != v29; ++k)
        {
          if (*(_QWORD *)v64 != v61)
            objc_enumerationMutation(v59);
          objc_msgSend(v62, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * k));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setEndDate:", v11);
          objc_msgSend(v31, "metadata");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE1B000], "appBundleID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForKeyedSubscript:", v33);
          v34 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v31, "stringValue");
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = (void *)v35;
          if (v34)
          {
            v37 = (void *)v35;
            v36 = (void *)v34;
          }
          else
          {
            if (!v35)
              goto LABEL_45;
            v37 = 0;
          }
          if ((objc_msgSend(v36, "isEqualToString:", CFSTR("com.apple.springboard.stand-by")) & 1) == 0)
            objc_msgSend(v57, "addObject:", v31);
          objc_msgSend(v31, "metadata");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE1B078], "isUsageTrusted");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectForKeyedSubscript:", v39);
          v40 = objc_claimAutoreleasedReturnValue();
          v41 = (void *)v40;
          v42 = (void *)MEMORY[0x24BDBD1C8];
          if (v40)
            v42 = (void *)v40;
          v43 = v42;

          v44 = objc_alloc(MEMORY[0x24BE0C608]);
          if (v37)
            v45 = v37;
          else
            v45 = v36;
          if (v37)
            v46 = v36;
          else
            v46 = 0;
          v47 = (void *)objc_msgSend(v44, "initWithStarting:absoluteTimestamp:bundleID:parentBundleID:isUsageTrusted:", MEMORY[0x24BDBD1C0], v11, v45, v46, v43);

          -[USApplicationUsageMonitor appUsageSource](v60, "appUsageSource");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "timeIntervalSinceReferenceDate");
          objc_msgSend(v48, "sendEvent:timestamp:", v47);

LABEL_45:
        }
        v29 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
      }
      while (v29);
    }

    v49 = objc_msgSend(obj, "count");
    if (objc_msgSend(v59, "count") || !v49)
      -[USApplicationUsageMonitor clearAppWebAndMediaUsageInContextStoreMatchingBundleIDs:clearAll:](v60, "clearAppWebAndMediaUsageInContextStoreMatchingBundleIDs:clearAll:", v59, v49 == 0);
    v50 = (void *)objc_msgSend(v55, "copy");
    -[USApplicationUsageMonitor setInUseApplicationEvents:](v60, "setInUseApplicationEvents:", v50);

    -[_DKMonitor historicalHandler](v60, "historicalHandler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v54;
    v7 = v56;
    if (v51)
    {
      -[_DKMonitor historicalHandler](v60, "historicalHandler");
      v52 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v52)[2](v52, v57);

    }
    -[USApplicationUsageMonitor updateAppDataInContextStore](v60, "updateAppDataInContextStore");
    v10 = v53;
  }

}

- (void)start
{
  _QWORD v3[4];
  id v4;
  id location;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)USApplicationUsageMonitor;
  if (-[_DKMonitor instantMonitorNeedsActivation](&v6, sel_instantMonitorNeedsActivation))
  {
    -[USApplicationUsageMonitor platformSpecificStart](self, "platformSpecificStart");
    -[USApplicationUsageMonitor obtainCurrentValue](self, "obtainCurrentValue");
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __34__USApplicationUsageMonitor_start__block_invoke;
    v3[3] = &unk_24C7DABB0;
    objc_copyWeak(&v4, &location);
    -[_DKMonitor setShutdownHandler:](self, "setShutdownHandler:", v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __34__USApplicationUsageMonitor_start__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __34__USApplicationUsageMonitor_start__block_invoke_cold_1(v2);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__USApplicationUsageMonitor_start__block_invoke_36;
    block[3] = &unk_24C7DAB88;
    block[4] = v4;
    dispatch_sync(v5, block);

  }
}

void __34__USApplicationUsageMonitor_start__block_invoke_36(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateInUseApplications:activeApplications:", v3, v2);

}

- (void)stop
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)USApplicationUsageMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v3, sel_instantMonitorNeedsDeactivation))
  {
    -[USApplicationUsageMonitor platformSpecificStop](self, "platformSpecificStop");
    -[_DKMonitor setShutdownHandler:](self, "setShutdownHandler:", 0);
  }
}

- (void)invalidateInstantState
{
  NSObject *v3;
  _QWORD block[5];

  -[_DKMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__USApplicationUsageMonitor_invalidateInstantState__block_invoke;
  block[3] = &unk_24C7DAB88;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __51__USApplicationUsageMonitor_invalidateInstantState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInUseApplicationEvents:", MEMORY[0x24BDBD1B8]);
}

- (FBSDisplayLayoutMonitor)monitor
{
  return self->_monitor;
}

- (void)setMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_monitor, a3);
}

- (NSSet)activeApplications
{
  return self->_activeApplications;
}

- (void)setActiveApplications:(id)a3
{
  objc_storeStrong((id *)&self->_activeApplications, a3);
}

- (FBSDisplayLayoutMonitor)carPlayMonitor
{
  return self->_carPlayMonitor;
}

- (void)setCarPlayMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_carPlayMonitor, a3);
}

- (NSSet)activeCarPlayApplications
{
  return self->_activeCarPlayApplications;
}

- (void)setActiveCarPlayApplications:(id)a3
{
  objc_storeStrong((id *)&self->_activeCarPlayApplications, a3);
}

- (FBSDisplayLayoutMonitor)externalMonitor
{
  return self->_externalMonitor;
}

- (void)setExternalMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_externalMonitor, a3);
}

- (NSSet)activeExternalApplications
{
  return self->_activeExternalApplications;
}

- (void)setActiveExternalApplications:(id)a3
{
  objc_storeStrong((id *)&self->_activeExternalApplications, a3);
}

- (FBSDisplayLayoutMonitor)continuityMonitor
{
  return self->_continuityMonitor;
}

- (void)setContinuityMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_continuityMonitor, a3);
}

- (NSSet)activeContinuityApplications
{
  return self->_activeContinuityApplications;
}

- (void)setActiveContinuityApplications:(id)a3
{
  objc_storeStrong((id *)&self->_activeContinuityApplications, a3);
}

- (FBSDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (void)setDisplayMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_displayMonitor, a3);
}

- (NSDictionary)inUseApplicationEvents
{
  return self->_inUseApplicationEvents;
}

- (void)setInUseApplicationEvents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (BMSource)appUsageSource
{
  return self->_appUsageSource;
}

- (void)setAppUsageSource:(id)a3
{
  objc_storeStrong((id *)&self->_appUsageSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appUsageSource, 0);
  objc_storeStrong((id *)&self->_inUseApplicationEvents, 0);
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_activeContinuityApplications, 0);
  objc_storeStrong((id *)&self->_continuityMonitor, 0);
  objc_storeStrong((id *)&self->_activeExternalApplications, 0);
  objc_storeStrong((id *)&self->_externalMonitor, 0);
  objc_storeStrong((id *)&self->_activeCarPlayApplications, 0);
  objc_storeStrong((id *)&self->_carPlayMonitor, 0);
  objc_storeStrong((id *)&self->_activeApplications, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

+ (void)_eventWithBundleIdentifier:(uint64_t)a1 startDate:(NSObject *)a2 usageType:usageTrusted:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_20D894000, a2, OS_LOG_TYPE_FAULT, "Failed to find app bundleID for app clip usage event with bundleID %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0();
}

+ (void)_eventWithBundleIdentifier:(os_log_t)log startDate:usageType:usageTrusted:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_20D894000, log, OS_LOG_TYPE_ERROR, "Failed to lookup LSApplicationRecord for app usage event with bundleID %@: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_0();
}

- (void)clearAppWebAndMediaUsageInContextStoreMatchingBundleIDs:(uint64_t)a1 clearAll:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_20D894000, a2, OS_LOG_TYPE_DEBUG, "Clearing app and media usage for bundleIDs: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0();
}

void __34__USApplicationUsageMonitor_start__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20D894000, log, OS_LOG_TYPE_DEBUG, "Marking all running apps as closed to force persistence.", v1, 2u);
}

@end
