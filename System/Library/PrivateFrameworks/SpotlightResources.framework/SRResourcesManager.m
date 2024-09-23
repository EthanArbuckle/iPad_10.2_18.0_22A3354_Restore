@implementation SRResourcesManager

void __43__SRResourcesManager_setTrialUpdateHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  NSObject *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  _BYTE buf[24];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  SRLogCategoryGeneral();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl(&dword_24798C000, v6, OS_LOG_TYPE_DEFAULT, "Trial update handler called for namespace %@", buf, 0xCu);
  }

  objc_msgSend(v5, "getLevelForFactor:", CFSTR("ExpConfig"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    SRLogCategoryGeneral();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_cold_4();

    objc_msgSend(v7, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDD1608];
    objc_msgSend(v9, "dataUsingEncoding:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    objc_msgSend(v10, "JSONObjectWithData:options:error:", v11, 0, buf);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(id *)buf;

    if (v13)
    {
      SRLogCategoryGeneral();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_cold_3();
      v15 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("spotlightConfigParams"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("spotlightConfigParams"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("Spotlight"));

      }
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("mailConfigParams"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("mailConfigParams"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("Mail"));

      }
      SRLogCategoryGeneral();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_cold_2();
    }

  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v5, "getLevelForFactor:", CFSTR("factors"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    SRLogCategoryGeneral();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_cold_1();

    objc_msgSend(v20, "fileValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    +[SRDefaultsManager sharedDefaultsManager](SRDefaultsManager, "sharedDefaultsManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "loadFactorsAtPath:namespaceId:", v23, v4);

  }
  os_unfair_lock_lock((os_unfair_lock_t)&sTrialParameterListLock);
  objc_msgSend((id)sTrialParameterList, "objectForKeyedSubscript:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_345;
  v31[3] = &unk_251908510;
  v26 = v4;
  v32 = v26;
  v27 = v5;
  v33 = v27;
  v28 = v15;
  v34 = v28;
  objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v31);

  os_unfair_lock_unlock((os_unfair_lock_t)&sTrialParameterListLock);
  objc_msgSend(v27, "setWasLoadedSinceLaunch:", 1);
  +[SRDefaultsManager sharedDefaultsManager](SRDefaultsManager, "sharedDefaultsManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "didUpdateTrialNamespace:", v26);

  SRLogCategoryGeneral();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v26;
    _os_log_impl(&dword_24798C000, v30, OS_LOG_TYPE_DEFAULT, "Trial update handler completed for namespace %@", buf, 0xCu);
  }

}

void __40__SRResourcesManager_fetchParameterList__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  SRTrialParameter *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id obj;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)&sTrialParameterListLock);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sTrialParameterList;
  sTrialParameterList = v0;

  +[SRDefaultsManager sharedDefaultsManager](SRDefaultsManager, "sharedDefaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentNamespaceDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v3;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v17)
  {
    v16 = *(_QWORD *)v25;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(obj);
        v19 = v4;
        v5 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v4);
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v16);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)sTrialParameterList, "setObject:forKeyedSubscript:", v6, v5);

        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(obj, "objectForKeyedSubscript:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v21;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v21 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
              v13 = -[SRTrialParameter initWithParameter:]([SRTrialParameter alloc], "initWithParameter:", v12);
              objc_msgSend((id)sTrialParameterList, "objectForKeyedSubscript:", v5);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "name");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v9);
        }

        v4 = v19 + 1;
      }
      while (v19 + 1 != v17);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v17);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&sTrialParameterListLock);
}

+ (void)initialize
{
  +[SRDefaultsManager sharedDefaultsManager](SRDefaultsManager, "sharedDefaultsManager");

  objc_msgSend(a1, "setTrialUpdateHandler");
}

- (id)resourcesForClient:(id)a3 options:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x24BDBCEA0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRResourcesManager resourcesForClient:locale:options:](self, "resourcesForClient:locale:options:", v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)resourcesForClient:(id)a3 locale:(id)a4 options:(id)a5
{
  id v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t v15;
  os_signpost_id_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  SRResources *v20;
  int v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SRResourcesOwner"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  SRLogCategorySignpost();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = resourcesForClient_locale_options__index;
  v16 = ++resourcesForClient_locale_options__index;
  if (v15 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v13))
    goto LABEL_13;
  v17 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
  if (v9)
  {
    objc_msgSend(v9, "localeIdentifier");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = (const char *)objc_msgSend(v5, "UTF8String");
    if (v12)
    {
LABEL_8:
      v19 = (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      goto LABEL_11;
    }
  }
  else
  {
    v18 = "none";
    if (v12)
      goto LABEL_8;
  }
  v19 = "unknown";
LABEL_11:
  v22 = 136315650;
  v23 = v17;
  v24 = 2080;
  v25 = v18;
  v26 = 2080;
  v27 = v19;
  _os_signpost_emit_with_name_impl(&dword_24798C000, v14, OS_SIGNPOST_EVENT, v16, "SRResourcesCreate", "client=%s, locale=%s, caller=%s", (uint8_t *)&v22, 0x20u);
  if (v9)

LABEL_13:
  v20 = -[SRResources initWithClient:locale:options:]([SRResources alloc], "initWithClient:locale:options:", v8, v9, v11);

  return v20;
}

- (void)loadAllParametersForClient:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDBCEA0];
  v5 = a3;
  objc_msgSend(v4, "currentLocale");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SRResourcesManager loadAllParametersForClient:locale:](self, "loadAllParametersForClient:locale:", v5, v6);

}

- (void)loadAllParametersForClient:(id)a3 locale:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[SRDefaultsManager sharedDefaultsManager](SRDefaultsManager, "sharedDefaultsManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOptions:", v10);

  +[SRDefaultsManager sharedDefaultsManager](SRDefaultsManager, "sharedDefaultsManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("root"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "loadDefaultsForLocale:", v13);

  +[SRDefaultsManager sharedDefaultsManager](SRDefaultsManager, "sharedDefaultsManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "loadDefaultsForLocale:", v9);

  +[SRDefaultsManager sharedDefaultsManager](SRDefaultsManager, "sharedDefaultsManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "currentNamespacesForClient:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        -[SRResourcesManager loadDataSource:](self, "loadDataSource:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v21++), (_QWORD)v22);
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v19);
  }

}

- (void)loadDataSource:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  id v20;

  v20 = a3;
  +[SRDefaultsManager sharedDefaultsManager](SRDefaultsManager, "sharedDefaultsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentNamespaces");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_18;
  objc_msgSend(v4, "objectForKeyedSubscript:", v20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("SPOTLIGHT_BLENDING_MODEL"));

  if (!v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("SPOTLIGHT_UI"));

    if (v9)
    {
      +[SSTrialManager sharedSpotlightUITrialManager](SSTrialManager, "sharedSpotlightUITrialManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("SPOTLIGHT_RANKING_RULES"));

    if (v11)
    {
      +[SSTrialManager sharedSpotlightRankingTrialManager](SSTrialManager, "sharedSpotlightRankingTrialManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("SPOTLIGHT_RANKING_POLICY"));

    if (v14)
    {
      +[SSTrialManager sharedSpotlightPolicyTrialManager](SSTrialManager, "sharedSpotlightPolicyTrialManager");
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v12 = (void *)v15;
      goto LABEL_19;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("SPOTLIGHT_KNOWLEDGE_BEHAVIOR"));

    if (v17)
    {
      +[SSTrialManager sharedSpotlightKnowledgeTrialManager](SSTrialManager, "sharedSpotlightKnowledgeTrialManager");
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("SPOTLIGHT_MAIL_APP"));

    if (v19)
    {
      +[SSTrialManager sharedSpotlightMailTrialManager](SSTrialManager, "sharedSpotlightMailTrialManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_18:
    v12 = 0;
    goto LABEL_19;
  }
  +[SSTrialManager sharedSpotlightModelTrialManager](SSTrialManager, "sharedSpotlightModelTrialManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v12 = v7;
  if (v7 && (objc_msgSend(v7, "wasLoadedSinceLaunch") & 1) == 0)
    objc_msgSend(v12, "loadWithUpdateHandler:", sTrialUpdateHandler);
LABEL_19:

}

- (void)loadAllParametersForClient:(id)a3 locale:(id)a4
{
  -[SRResourcesManager loadAllParametersForClient:locale:options:](self, "loadAllParametersForClient:locale:options:", a3, a4, 0);
}

void __39__SRResourcesManager_fetchUserDefaults__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _UNKNOWN **v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock(&sUserDefaultsParameterListLock);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sUserDefaultsParameterList;
  sUserDefaultsParameterList = v2;

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v4 = objc_msgSend(&unk_25190CD48, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  v5 = &off_251908000;
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v40;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v40 != v7)
          objc_enumerationMutation(&unk_25190CD48);
        v9 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v8);
        objc_msgSend(v5[7], "sharedDefaultsManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "parametersOfNamespaceWithName:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(&unk_25190CD70, "objectForKeyedSubscript:", v9);
          v12 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v11, "allValues");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "firstObject");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 40), "defaultParameterWithType:value:name:", objc_msgSend(v15, "type"), v13, v9);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)sUserDefaultsParameterList, "setObject:forKeyedSubscript:", v16, v9);

            v5 = &off_251908000;
          }

        }
        else
        {
          SRLogCategoryGeneral();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v45 = v9;
            _os_log_debug_impl(&dword_24798C000, v12, OS_LOG_TYPE_DEBUG, "User default is not set for parameter %@", buf, 0xCu);
          }
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(&unk_25190CD48, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    }
    while (v6);
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v17 = objc_msgSend(&unk_25190CD70, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v17)
  {
    v19 = v17;
    v20 = *(_QWORD *)v36;
    *(_QWORD *)&v18 = 138412290;
    v33 = v18;
    v21 = &unk_25190CD70;
    do
    {
      v22 = 0;
      v34 = v19;
      do
      {
        if (*(_QWORD *)v36 != v20)
          objc_enumerationMutation(v21);
        v23 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v22);
        objc_msgSend(v5[7], "sharedDefaultsManager", v33);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "parametersOfNamespaceWithName:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(v21, "objectForKeyedSubscript:", v23);
          v26 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            objc_msgSend(v25, "allValues");
            v28 = v20;
            v29 = v21;
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "firstObject");
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 40), "defaultParameterWithType:value:name:", objc_msgSend(v31, "type"), v27, v23);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)sUserDefaultsParameterList, "setObject:forKeyedSubscript:", v32, v23);

            v21 = v29;
            v20 = v28;
            v19 = v34;

            v5 = &off_251908000;
          }

        }
        else
        {
          SRLogCategoryGeneral();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v33;
            v45 = v23;
            _os_log_debug_impl(&dword_24798C000, v26, OS_LOG_TYPE_DEBUG, "User default is not set for parameter %@", buf, 0xCu);
          }
        }

        ++v22;
      }
      while (v19 != v22);
      v19 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v19);
  }
  os_unfair_lock_unlock(&sUserDefaultsParameterListLock);
}

+ (id)sharedResourcesManager
{
  if (sharedResourcesManager_onceToken != -1)
    dispatch_once(&sharedResourcesManager_onceToken, &__block_literal_global_384);
  return (id)sharedResourcesManager_resourcesManager;
}

void __44__SRResourcesManager_sharedResourcesManager__block_invoke()
{
  SRResourcesManager *v0;
  uint64_t v1;
  void *v2;

  v0 = [SRResourcesManager alloc];
  v1 = -[SRResourcesManager initWithOptions:](v0, "initWithOptions:", MEMORY[0x24BDBD1B8]);
  v2 = (void *)sharedResourcesManager_resourcesManager;
  sharedResourcesManager_resourcesManager = v1;

}

+ (void)fetchParameterList
{
  if (fetchParameterList_trialListOnceToken != -1)
    dispatch_once(&fetchParameterList_trialListOnceToken, &__block_literal_global_370);
  objc_msgSend(a1, "fetchUserDefaults");
  if (SRIsAppleInternalInstall())
    objc_msgSend(a1, "fetchOverrideList");
}

+ (void)fetchUserDefaults
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.spotlightui"));
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.searchd"));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__SRResourcesManager_fetchUserDefaults__block_invoke;
  block[3] = &unk_251908538;
  v8 = v3;
  v9 = a1;
  v4 = fetchUserDefaults_userListOnceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&fetchUserDefaults_userListOnceToken, block);

}

- (SRResourcesManager)initWithOptions:(id)a3
{
  SRResourcesManager *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SRResourcesManager;
  v3 = -[SRResourcesManager init](&v13, sel_init, a3);
  if (v3)
  {
    +[SRResourcesManager fetchParameterList](SRResourcesManager, "fetchParameterList");
  }
  else
  {
    SRLogCategoryGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SRResourcesManager initWithOptions:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  }
  return v3;
}

+ (void)fetchOverrideList
{
  if (fetchOverrideList_overridesPlistOnceToken != -1)
    dispatch_once(&fetchOverrideList_overridesPlistOnceToken, &__block_literal_global_372);
}

+ (void)setTrialUpdateHandler
{
  void *v2;

  v2 = (void *)sTrialUpdateHandler;
  sTrialUpdateHandler = (uint64_t)&__block_literal_global_340;

  +[SSTrialManager setTrialUpdateHandler:](SSTrialManager, "setTrialUpdateHandler:", &__block_literal_global_340);
  +[SSTrialManager setTrialOverridePath](SSTrialManager, "setTrialOverridePath");
}

void __39__SRResourcesManager_fetchOverrideList__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  unint64_t v28;
  os_signpost_id_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id obj;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", CFSTR("/AppleInternal/Spotlight/overrides.plist"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("UsingOverrides"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("UsingOverrides"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      sUsingOverrides = objc_msgSend(v3, "BOOLValue");

      if (sUsingOverrides)
      {
        SRLogCategoryGeneral();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_24798C000, v4, OS_LOG_TYPE_DEFAULT, "Using overrides.plist", buf, 2u);
        }

        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v37 = objc_msgSend(&unk_25190CD00, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
        if (v37)
        {
          v35 = *(_QWORD *)v47;
          do
          {
            v5 = 0;
            do
            {
              if (*(_QWORD *)v47 != v35)
                objc_enumerationMutation(&unk_25190CD00);
              v38 = v5;
              v6 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v5);
              objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v35);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = 0u;
              v43 = 0u;
              v44 = 0u;
              v45 = 0u;
              v41 = v6;
              objc_msgSend(v1, "objectForKeyedSubscript:", v6);
              obj = (id)objc_claimAutoreleasedReturnValue();
              v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
              if (v7)
              {
                v8 = v7;
                v9 = *(_QWORD *)v43;
                do
                {
                  for (i = 0; i != v8; ++i)
                  {
                    if (*(_QWORD *)v43 != v9)
                      objc_enumerationMutation(obj);
                    v11 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
                    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SampleOverrideParameter")) & 1) == 0)
                    {
                      objc_msgSend(v1, "objectForKeyedSubscript:", v41);
                      v12 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v12, "objectForKeyedSubscript:", v11);
                      v13 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Type"));
                      v14 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v14)
                      {
                        if (!objc_msgSend(v14, "isEqualToString:", CFSTR("Boolean")))
                        {
                          if (objc_msgSend(v14, "isEqualToString:", CFSTR("Long")))
                          {
                            objc_msgSend(v1, "objectForKeyedSubscript:", v41);
                            v20 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v20, "objectForKeyedSubscript:", v11);
                            v21 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Value"));
                            v17 = (void *)objc_claimAutoreleasedReturnValue();

                            if (!v17)
                              goto LABEL_34;
                            +[SRParameter parameterWithLong:name:](SRParameter, "parameterWithLong:name:", objc_msgSend(v17, "longValue"), v11);
                            v18 = objc_claimAutoreleasedReturnValue();
                          }
                          else if (objc_msgSend(v14, "isEqualToString:", CFSTR("Double")))
                          {
                            objc_msgSend(v1, "objectForKeyedSubscript:", v41);
                            v22 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v22, "objectForKeyedSubscript:", v11);
                            v23 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("Value"));
                            v17 = (void *)objc_claimAutoreleasedReturnValue();

                            if (!v17)
                              goto LABEL_34;
                            objc_msgSend(v17, "doubleValue");
                            +[SRParameter parameterWithDouble:name:](SRParameter, "parameterWithDouble:name:", v11);
                            v18 = objc_claimAutoreleasedReturnValue();
                          }
                          else
                          {
                            if ((objc_msgSend(v14, "isEqualToString:", CFSTR("String")) & 1) == 0
                              && !objc_msgSend(v14, "isEqualToString:", CFSTR("File")))
                            {
                              goto LABEL_41;
                            }
                            objc_msgSend(v1, "objectForKeyedSubscript:", v41);
                            v24 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v24, "objectForKeyedSubscript:", v11);
                            v25 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("Value"));
                            v17 = (void *)objc_claimAutoreleasedReturnValue();

                            if (!v17)
                              goto LABEL_34;
                            +[SRParameter parameterWithString:name:](SRParameter, "parameterWithString:name:", v17, v11);
                            v18 = objc_claimAutoreleasedReturnValue();
                          }
LABEL_33:
                          v19 = v18;
                          goto LABEL_35;
                        }
                        objc_msgSend(v1, "objectForKeyedSubscript:", v41);
                        v15 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v15, "objectForKeyedSubscript:", v11);
                        v16 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Value"));
                        v17 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v17)
                        {
                          +[SRParameter parameterWithBoolean:name:](SRParameter, "parameterWithBoolean:name:", objc_msgSend(v17, "BOOLValue"), v11);
                          v18 = objc_claimAutoreleasedReturnValue();
                          goto LABEL_33;
                        }
LABEL_34:
                        v19 = 0;
LABEL_35:

                        if (v19)
                        {
                          objc_msgSend(v39, "setObject:forKeyedSubscript:", v19, v11);
                          SRLogCategorySignpost();
                          v26 = objc_claimAutoreleasedReturnValue();
                          v27 = v26;
                          v28 = fetchOverrideList_index;
                          v29 = ++fetchOverrideList_index;
                          if (v28 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
                          {
                            -[NSObject typeString](v19, "typeString");
                            v30 = v1;
                            v31 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138412546;
                            v51 = v11;
                            v52 = 2112;
                            v53 = v31;
                            _os_signpost_emit_with_name_impl(&dword_24798C000, v27, OS_SIGNPOST_EVENT, v29, "SRResourcesFactorOverride", "Overriding factor %@ of type %@", buf, 0x16u);

                            v1 = v30;
                          }

                          goto LABEL_40;
                        }
                      }
                      else
                      {
                        SRLogCategoryGeneral();
                        v19 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412290;
                          v51 = v11;
                          _os_log_error_impl(&dword_24798C000, v19, OS_LOG_TYPE_ERROR, "Overrides.plist has no type for parameter %@, skipping", buf, 0xCu);
                        }
LABEL_40:

                      }
LABEL_41:

                      continue;
                    }
                  }
                  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
                }
                while (v8);
              }

              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v39);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "setObject:forKeyedSubscript:", v32, v41);

              v5 = v38 + 1;
            }
            while (v38 + 1 != v37);
            v37 = objc_msgSend(&unk_25190CD00, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
          }
          while (v37);
        }
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v36);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = (void *)sOverrideList;
        sOverrideList = v33;

      }
    }
  }

}

+ (BOOL)parsecEnabled
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.spotlightui"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("SBSearchDisabledDomains"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v5 = objc_msgSend(v4, "containsObject:", CFSTR("DOMAIN_PARSEC")) ^ 1;
    else
      LOBYTE(v5) = 1;

  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

void __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_345(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;

  v5 = a2;
  v6 = a3;
  SRLogCategoryGeneral();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_345_cold_12();

  objc_msgSend(v6, "parameter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHasValueFromTrial:", 0);
  objc_msgSend(*(id *)(a1 + 40), "getLevelForFactor:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    SRLogCategoryGeneral();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_345_cold_11();

    switch(objc_msgSend(v8, "type"))
    {
      case 0:
        objc_msgSend(v8, "updateWithBoolean:", objc_msgSend(v9, "BOOLeanValue"));
        goto LABEL_21;
      case 1:
        objc_msgSend(v8, "updateWithLong:", objc_msgSend(v9, "longValue"));
        if (!objc_msgSend(v5, "isEqualToString:", CFSTR("MaxSectionsBelowSuggestions")))
          goto LABEL_21;
        SRLogCategoryGeneral();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          goto LABEL_16;
        goto LABEL_17;
      case 2:
        objc_msgSend(v9, "doubleValue");
        objc_msgSend(v8, "updateWithDouble:");
        if (!objc_msgSend(v5, "isEqualToString:", CFSTR("LocalSuggestionThreshold")))
          goto LABEL_21;
        SRLogCategoryGeneral();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
LABEL_16:
          __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_345_cold_9();
LABEL_17:

        v13 = v6;
        v14 = 0;
        goto LABEL_22;
      case 3:
        objc_msgSend(v9, "stringValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "updateWithString:", v15);
        goto LABEL_20;
      case 4:
        objc_msgSend(v9, "fileValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "updateWithFilePath:", v16);

LABEL_20:
LABEL_21:
        +[SRDefaultsManager sharedDefaultsManager](SRDefaultsManager, "sharedDefaultsManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "updateParameter:inNamespace:withValue:", v5, *(_QWORD *)(a1 + 32), v8);

        v13 = v6;
        v14 = 1;
LABEL_22:
        objc_msgSend(v13, "setHasValueFromTrial:", v14);
        break;
      default:
        SRLogCategoryGeneral();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_345_cold_8(v8, v11);

        break;
    }
  }
  objc_msgSend(v8, "irisName");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = (void *)v18;
  else
    v20 = v5;
  v21 = v20;

  v22 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v21, "substringToIndex:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "lowercaseString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "substringFromIndex:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("%@%@"), v24, v25);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = *(void **)(a1 + 48);
  if (v26)
  {
    objc_msgSend(*(id *)(a1 + 40), "client");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v29 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "client");
      v45 = a1;
      v30 = v21;
      v31 = v8;
      v32 = v5;
      v33 = v9;
      v34 = v6;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectForKeyedSubscript:", v46);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v34;
      v9 = v33;
      v5 = v32;
      v8 = v31;
      v21 = v30;
      a1 = v45;
    }
    else
    {
      v26 = 0;
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v37 = (void *)objc_msgSend(v26, "copy");
    if (objc_msgSend(v37, "count"))
    {
      objc_msgSend(v37, "componentsJoinedByString:", CFSTR(","));
      v38 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = 0;
    }

    v26 = (void *)v38;
  }
  if (v26)
  {
    SRLogCategoryGeneral();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_345_cold_7();

    switch(objc_msgSend(v8, "type"))
    {
      case 0:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "updateWithBoolean:", objc_msgSend(v26, "BOOLValue"));
          goto LABEL_52;
        }
        SRLogCategoryGeneral();
        v40 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          goto LABEL_63;
        goto LABEL_62;
      case 1:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "updateWithLong:", objc_msgSend(v26, "longValue"));
          goto LABEL_52;
        }
        SRLogCategoryGeneral();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          goto LABEL_62;
        goto LABEL_63;
      case 2:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v26, "doubleValue");
          objc_msgSend(v8, "updateWithDouble:");
          goto LABEL_52;
        }
        SRLogCategoryGeneral();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          goto LABEL_62;
        goto LABEL_63;
      case 3:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "updateWithString:", v26);
          goto LABEL_52;
        }
        SRLogCategoryGeneral();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          goto LABEL_62;
        goto LABEL_63;
      case 4:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "updateWithFilePath:", v26);
LABEL_52:
          +[SRDefaultsManager sharedDefaultsManager](SRDefaultsManager, "sharedDefaultsManager");
          v41 = v5;
          v42 = v9;
          v43 = v6;
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "updateParameter:inNamespace:withValue:", v41, *(_QWORD *)(a1 + 32), v8);

          v6 = v43;
          v9 = v42;
          v5 = v41;
          objc_msgSend(v6, "setHasValueFromTrial:", 1);
        }
        else
        {
          SRLogCategoryGeneral();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
LABEL_62:
            __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_345_cold_2();
LABEL_63:

        }
        break;
      default:
        SRLogCategoryGeneral();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_345_cold_1(v8, (uint64_t)v46, v40);
        goto LABEL_63;
    }
  }

}

+ (id)defaultParameterWithType:(int64_t)a3 value:(id)a4 name:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;

  v7 = a4;
  v8 = a5;
  if (v7)
  {
    switch(a3)
    {
      case 0:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_13;
        +[SRParameter parameterWithBoolean:name:](SRParameter, "parameterWithBoolean:name:", objc_msgSend(v7, "BOOLValue"), v8);
        v9 = objc_claimAutoreleasedReturnValue();
        break;
      case 1:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_13;
        +[SRParameter parameterWithLong:name:](SRParameter, "parameterWithLong:name:", objc_msgSend(v7, "longValue"), v8);
        v9 = objc_claimAutoreleasedReturnValue();
        break;
      case 2:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_13;
        objc_msgSend(v7, "doubleValue");
        +[SRParameter parameterWithDouble:name:](SRParameter, "parameterWithDouble:name:", v8);
        v9 = objc_claimAutoreleasedReturnValue();
        break;
      case 3:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_13;
        +[SRParameter parameterWithString:name:](SRParameter, "parameterWithString:name:", v7, v8);
        v9 = objc_claimAutoreleasedReturnValue();
        break;
      case 4:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_13;
        +[SRParameter parameterWithFilePath:name:](SRParameter, "parameterWithFilePath:name:", v7, v8);
        v9 = objc_claimAutoreleasedReturnValue();
        break;
      default:
        goto LABEL_13;
    }
  }
  else
  {
LABEL_13:
    +[SRParameter nilParameterWithType:](SRParameter, "nilParameterWithType:", a3);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

+ (void)updateDefaultParameter:(id)a3 withValue:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v5 = a4;
  v6 = objc_msgSend(v7, "type");
  if (v5)
  {
    switch(v6)
    {
      case 0:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v7, "updateWithBoolean:", objc_msgSend(v5, "BOOLValue"));
        break;
      case 1:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v7, "updateWithLong:", objc_msgSend(v5, "longValue"));
        break;
      case 2:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v5, "doubleValue");
          objc_msgSend(v7, "updateWithDouble:");
        }
        break;
      case 3:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v7, "updateWithString:", v5);
        break;
      case 4:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v7, "updateWithFilePath:", v5);
        break;
      default:
        break;
    }
  }

}

+ (int64_t)parameterTypeFromString:(id)a3
{
  id v3;
  int64_t v4;
  NSObject *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Boolean")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Long")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Double")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("String")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("File")) & 1) != 0)
  {
    v4 = 4;
  }
  else
  {
    SRLogCategoryGeneral();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[SRResourcesManager parameterTypeFromString:].cold.1();

    v4 = -1;
  }

  return v4;
}

+ (void)dumpParameterList:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  char isKindOfClass;
  _BOOL4 v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    SRLogCategoryGeneral();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24798C000, v5, OS_LOG_TYPE_DEFAULT, "entry is a dictionary:", buf, 2u);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v4, "allKeys");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    if (v7)
    {
      v9 = v7;
      v10 = *(_QWORD *)v29;
      *(_QWORD *)&v8 = 138412290;
      v23 = v8;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKey:", v12, v23);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            SRLogCategoryGeneral();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v23;
              v33 = v12;
              _os_log_impl(&dword_24798C000, v14, OS_LOG_TYPE_DEFAULT, "dumping entry [%@]:", buf, 0xCu);
            }

            objc_msgSend(a1, "dumpParameterList:", v13);
          }

        }
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      }
      while (v9);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      SRLogCategoryGeneral();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24798C000, v15, OS_LOG_TYPE_DEFAULT, "entry is an array:", buf, 2u);
      }

      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v6 = v4;
      v16 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v25;
        do
        {
          for (j = 0; j != v17; ++j)
          {
            if (*(_QWORD *)v25 != v18)
              objc_enumerationMutation(v6);
            objc_msgSend(a1, "dumpParameterList:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
          }
          v17 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
        }
        while (v17);
      }
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      SRLogCategoryGeneral();
      v6 = objc_claimAutoreleasedReturnValue();
      v21 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if ((isKindOfClass & 1) != 0)
      {
        if (v21)
        {
          *(_DWORD *)buf = 138412290;
          v33 = v4;
          _os_log_impl(&dword_24798C000, v6, OS_LOG_TYPE_DEFAULT, "entry is a parameter = (%@)", buf, 0xCu);
        }
      }
      else if (v21)
      {
        *(_DWORD *)buf = 138412546;
        v33 = (id)objc_opt_class();
        v34 = 2112;
        v35 = v4;
        v22 = v33;
        _os_log_impl(&dword_24798C000, v6, OS_LOG_TYPE_DEFAULT, "entry has type %@ and is (%@)", buf, 0x16u);

      }
    }
  }

}

- (void)refreshTrialForClient:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("Spotlight")))
  {
    +[SSTrialManager sharedSpotlightModelTrialManager](SSTrialManager, "sharedSpotlightModelTrialManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      objc_msgSend(v3, "refreshTrackingId");
    +[SSTrialManager sharedSpotlightUITrialManager](SSTrialManager, "sharedSpotlightUITrialManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v5, "refreshTrackingId");
    +[SSTrialManager sharedSpotlightRankingTrialManager](SSTrialManager, "sharedSpotlightRankingTrialManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      objc_msgSend(v6, "refreshTrackingId");
    +[SSTrialManager sharedSpotlightPolicyTrialManager](SSTrialManager, "sharedSpotlightPolicyTrialManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("SpotlightKnowledge")))
  {
    +[SSTrialManager sharedSpotlightKnowledgeTrialManager](SSTrialManager, "sharedSpotlightKnowledgeTrialManager");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v9, "isEqualToString:", CFSTR("Mail")))
      goto LABEL_11;
    +[SSTrialManager sharedSpotlightUITrialManager](SSTrialManager, "sharedSpotlightUITrialManager");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v8;
  if (v8)
LABEL_9:
    objc_msgSend(v7, "refreshTrackingId");
LABEL_10:

LABEL_11:
}

- (void)loadAllParameters
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(&unk_25190CD00, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(&unk_25190CD00);
        -[SRResourcesManager loadAllParametersForClient:](self, "loadAllParametersForClient:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(&unk_25190CD00, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (void)fetchAllParametersForLanguages:(id)a3 resourcePath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[SRResourcesManager loadAllParameters](self, "loadAllParameters");
  +[SRDefaultsManager sharedDefaultsManager](SRDefaultsManager, "sharedDefaultsManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setByAddingObject:", CFSTR("root"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "requestAssetsForLanguages:resourcePath:", v8, v6);
}

- (id)allLoadedAssets
{
  void *v2;
  void *v3;

  +[SRDefaultsManager sharedDefaultsManager](SRDefaultsManager, "sharedDefaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allLoadedAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)assetConfigDump
{
  void *v2;
  void *v3;

  +[SRDefaultsManager sharedDefaultsManager](SRDefaultsManager, "sharedDefaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetConfigDump");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)trialConfigDump
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x24BDD16A8]);
  +[SRDefaultsManager sharedDefaultsManager](SRDefaultsManager, "sharedDefaultsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trialConfigDump");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithString:", v4);

  os_unfair_lock_lock((os_unfair_lock_t)&sTrialParameterListLock);
  objc_msgSend(v5, "appendFormat:", CFSTR("\nFactors:\n%@"), sTrialParameterList);
  os_unfair_lock_unlock((os_unfair_lock_t)&sTrialParameterListLock);
  return v5;
}

void __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24798C000, v0, v1, "Loading monofactor for namespace %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24798C000, v0, v1, "Got exp config %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_24798C000, v0, v1, "Error parsing exp config json: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24798C000, v0, v1, "Loading IRIS exp config for namespace %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_345_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = 134218242;
  v6 = objc_msgSend(a1, "type");
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_24798C000, a3, OS_LOG_TYPE_ERROR, "loadDataSource: invalid SRParameter type %ld for exp config %@", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_7();
}

void __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_345_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_24798C000, v0, v1, "Error updating exp config %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_345_cold_7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_24798C000, v0, v1, "Parameter %@ has exp config (%@)");
  OUTLINED_FUNCTION_1();
}

void __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_345_cold_8(void *a1, NSObject *a2)
{
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "type");
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_24798C000, a2, OS_LOG_TYPE_ERROR, "loadDataSource: invalid SRParameter type %ld", v3, 0xCu);
  OUTLINED_FUNCTION_7();
}

void __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_345_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24798C000, v0, v1, "Ignoring Trial value for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_345_cold_11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24798C000, v0, v1, "Parameter %@ has Trial level", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_345_cold_12()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_24798C000, v0, v1, "Updating parameter %@ for namespace %@");
  OUTLINED_FUNCTION_1();
}

- (void)initWithOptions:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_24798C000, a1, a3, "SRResourcesManager init returning nil self", a5, a6, a7, a8, 0);
}

+ (void)parameterTypeFromString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_24798C000, v0, v1, "Invalid parameter type string %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
