@implementation VSCacheDeleteService

uint64_t __43__VSCacheDeleteService_registerCacheDelete__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "purgeable:urgency:", a3, a2);
  return objc_claimAutoreleasedReturnValue();
}

- (id)purgeable:(id)a3 urgency:(int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];
  _QWORD v23[2];
  uint8_t buf[4];
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v4 = *(_QWORD *)&a4;
  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  VSGetLogDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    v25 = v4;
    v26 = 1024;
    v27 = 4;
    v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_21AA84000, v7, OS_LOG_TYPE_DEFAULT, "#CacheDelete query purgeable size, urgency: %d / %d, info: %@", buf, 0x18u);
  }

  -[VSCacheDeleteService purgeableAssetsWithInfo:urgency:](self, "purgeableAssetsWithInfo:urgency:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VSCacheDeleteService totalSizeOfAssets:](self, "totalSizeOfAssets:", v8);
  if ((int)v4 >= 2)
  {
    +[VSSpeechCache defaultCacheStore](VSSpeechCache, "defaultCacheStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dirPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "hasPrefix:", v12);

    if (v13)
    {
      +[VSSpeechCache defaultCacheStore](VSSpeechCache, "defaultCacheStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9 += objc_msgSend(v14, "totalCacheSize");

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(CFSTR("/private/var/mobile/"), "hasPrefix:", v15);

    if (v16)
    {
      +[VSDiagnosticService defaultService](VSDiagnosticService, "defaultService");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v9 += objc_msgSend(v17, "totalDiagnosticFileSize");

    }
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = CFSTR("CACHE_DELETE_AMOUNT");
  v23[0] = v18;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)purgeableAssetsWithInfo:(id)a3 urgency:(int)a4
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t m;
  uint64_t v48;
  id v49;
  void *v50;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t j;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  id obj;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[4];
  NSObject *v88;
  uint64_t v89;
  _BYTE v90[128];
  uint8_t v91[128];
  uint8_t buf[4];
  void *v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4 <= 3)
  {
    objc_msgSend(MEMORY[0x24BEC0DF0], "standardInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "disableAssetCleaning");

    if (v8)
    {
      VSGetLogEvent();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v93) = a4;
        _os_log_impl(&dword_21AA84000, v9, OS_LOG_TYPE_DEFAULT, "#CacheDelete asset cleaning is disabled in internal setting. Skip purgeable assets for urgency %d", buf, 8u);
      }
      v10 = (void *)MEMORY[0x24BDBD1A8];
      goto LABEL_39;
    }
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_AMOUNT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_AMOUNT"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "longLongValue");

  }
  else
  {
    v13 = -1;
  }
  v87[0] = MEMORY[0x24BDAC760];
  v87[1] = 3221225472;
  v87[2] = __56__VSCacheDeleteService_purgeableAssetsWithInfo_urgency___block_invoke;
  v87[3] = &unk_24DD8E6B8;
  v63 = v6;
  v88 = v6;
  v14 = MEMORY[0x220750D8C](v87);
  objc_msgSend(MEMORY[0x24BEC0DA0], "sharedManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activeVoiceAssets");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEC0DA0], "sharedManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "inactiveVoiceAssets");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)v14;
  (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v19);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  obj = v17;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v84;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v84 != v23)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * i), "voiceData");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "languages");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObjectsFromArray:", v26);

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
    }
    while (v22);
  }

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[VSCacheDeleteService totalSizeOfAssets:](self, "totalSizeOfAssets:", v65);
  v10 = v64;
  v68 = v20;
  if ((a4 - 1) < 3)
    goto LABEL_17;
  if (a4 == 4)
  {
    if (v13 == -1 || v13 > v27)
    {
      objc_msgSend(v64, "addObjectsFromArray:", obj);
      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      v52 = obj;
      v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v79, v94, 16);
      if (v53)
      {
        v54 = v53;
        v55 = *(_QWORD *)v80;
        do
        {
          for (j = 0; j != v54; ++j)
          {
            if (*(_QWORD *)v80 != v55)
              objc_enumerationMutation(v52);
            v57 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * j);
            VSGetLogDefault();
            v58 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v57, "descriptiveKey");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v93 = v59;
              _os_log_impl(&dword_21AA84000, v58, OS_LOG_TYPE_INFO, "#CacheDelete purgeable active voice asset: %@", buf, 0xCu);

            }
            objc_msgSend(v57, "voiceData");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "languages");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "addObjectsFromArray:", v61);

          }
          v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v79, v94, 16);
        }
        while (v54);
      }

      v10 = v64;
    }
LABEL_17:
    objc_msgSend(v10, "addObjectsFromArray:", v65);
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v67 = v65;
    v28 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v75, v91, 16);
    if (!v28)
      goto LABEL_30;
    v29 = v28;
    v70 = *(_QWORD *)v76;
    while (1)
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v76 != v70)
          objc_enumerationMutation(v67);
        v31 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * k);
        VSGetLogDefault();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v31, "descriptiveKey");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v93 = v33;
          _os_log_impl(&dword_21AA84000, v32, OS_LOG_TYPE_INFO, "#CacheDelete purgeable inactive voice asset: %@", buf, 0xCu);

        }
        objc_msgSend(v31, "voiceData");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "languages");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "firstObject");
        v36 = objc_claimAutoreleasedReturnValue();
        if (v36)
        {
          v37 = (void *)v36;
          objc_msgSend(v31, "voiceData");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "languages");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "firstObject");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v68, "containsObject:", v40);

          if ((v41 & 1) != 0)
            continue;
          objc_msgSend(v31, "voiceData");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "languages");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "firstObject");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "addObject:", v42);

        }
      }
      v29 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v75, v91, 16);
      if (!v29)
      {
LABEL_30:

        v10 = v64;
        break;
      }
    }
  }
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v43 = v66;
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v71, v90, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v72;
    do
    {
      for (m = 0; m != v45; ++m)
      {
        if (*(_QWORD *)v72 != v46)
          objc_enumerationMutation(v43);
        v48 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * m);
        v49 = objc_alloc_init(MEMORY[0x24BEC0E30]);
        v89 = v48;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v89, 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setLanguages:", v50);

        objc_msgSend(v10, "addObject:", v49);
      }
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v71, v90, 16);
    }
    while (v45);
  }

  v9 = v88;
  v6 = v63;
LABEL_39:

  return v10;
}

id __56__VSCacheDeleteService_purgeableAssetsWithInfo_urgency___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "voicePath");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "hasPrefix:", v11);

        if (v12)
          objc_msgSend(v14, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v14;
}

- (int64_t)totalSizeOfAssets:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v6 += objc_msgSend(v9, "size");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)purge:(id)a3 urgency:(int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v4 = *(_QWORD *)&a4;
  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  VSGetLogDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109634;
    v10[1] = v4;
    v11 = 1024;
    v12 = 4;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_21AA84000, v7, OS_LOG_TYPE_DEFAULT, "#CacheDelete purge, urgency: %d / %d, info: %@", (uint8_t *)v10, 0x18u);
  }

  -[VSCacheDeleteService purgeImpl:urgency:](self, "purgeImpl:urgency:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)periodic:(id)a3 urgency:(int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v4 = *(_QWORD *)&a4;
  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  VSGetLogDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109634;
    v10[1] = v4;
    v11 = 1024;
    v12 = 4;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_21AA84000, v7, OS_LOG_TYPE_DEFAULT, "#CacheDelete periodic purge, urgency: %d / %d, info: %@", (uint8_t *)v10, 0x18u);
  }

  -[VSCacheDeleteService purgeImpl:urgency:](self, "purgeImpl:urgency:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)purgeImpl:(id)a3 urgency:(int)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int64_t v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v32 = a3;
  -[VSCacheDeleteService purgeableAssetsWithInfo:urgency:](self, "purgeableAssetsWithInfo:urgency:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[VSCacheDeleteService totalSizeOfAssets:](self, "totalSizeOfAssets:", v6);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BEC0DA0], "sharedManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (id)objc_msgSend(v13, "purgeAsset:", v12);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          objc_msgSend(MEMORY[0x24BEC0DA0], "sharedManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "removeVoiceResource:completion:", v12, 0);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v9);
  }

  if (a4 < 2)
  {
    v20 = v31;
    v17 = v32;
  }
  else
  {
    +[VSSpeechCache defaultCacheStore](VSSpeechCache, "defaultCacheStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dirPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v32;
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "hasPrefix:", v18);

    v20 = v31;
    if (v19)
    {
      +[VSSpeechCache defaultCacheStore](VSSpeechCache, "defaultCacheStore");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v21, "totalCacheSize") + v31;

      +[VSSpeechCache defaultCacheStore](VSSpeechCache, "defaultCacheStore");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "deleteCache");

    }
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"), v31);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(CFSTR("/private/var/mobile/"), "hasPrefix:", v23);

    if (v24)
    {
      +[VSDiagnosticService defaultService](VSDiagnosticService, "defaultService");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v20 += objc_msgSend(v25, "totalDiagnosticFileSize");

      +[VSDiagnosticService defaultService](VSDiagnosticService, "defaultService");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "removeDirectory");

    }
  }
  v37[0] = CFSTR("CACHE_DELETE_VOLUME");
  objc_msgSend(v17, "objectForKeyedSubscript:", v31);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = CFSTR("CACHE_DELETE_AMOUNT");
  v38[0] = v27;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v20);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v28;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (BOOL)registerCacheDelete
{
  return CacheDeleteRegisterInfoCallbacks() == 0;
}

uint64_t __43__VSCacheDeleteService_registerCacheDelete__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "purge:urgency:", a3, a2);
  return objc_claimAutoreleasedReturnValue();
}

uint64_t __43__VSCacheDeleteService_registerCacheDelete__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "periodic:urgency:", a3, a2);
  return objc_claimAutoreleasedReturnValue();
}

+ (id)sharedService
{
  if (sharedService_onceToken != -1)
    dispatch_once(&sharedService_onceToken, &__block_literal_global_1826);
  return (id)sharedService___sharedService;
}

void __37__VSCacheDeleteService_sharedService__block_invoke()
{
  VSCacheDeleteService *v0;
  void *v1;

  v0 = objc_alloc_init(VSCacheDeleteService);
  v1 = (void *)sharedService___sharedService;
  sharedService___sharedService = (uint64_t)v0;

}

@end
