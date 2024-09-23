@implementation TRIClient(UAFTrialClient)

- (id)UAFFactorLevelsWithNamespaceName:()UAFTrialClient
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  id v44;
  id v45;
  stat v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "_initOnce");
  objc_msgSend(a1, "factorLevelsWithNamespaceName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = 0;
    goto LABEL_23;
  }
  v44 = v4;
  v6 = (void *)objc_opt_new();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v43 = v5;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (!v8)
    goto LABEL_21;
  v9 = v8;
  v10 = *(_QWORD *)v48;
  v45 = v7;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v48 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
      if (objc_msgSend(v12, "hasLevel"))
      {
        objc_msgSend(v12, "level");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "levelOneOfCase");

        if (v14 == 101)
        {
          objc_msgSend(v12, "level");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "directoryValue");
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend((id)v16, "isOnDemand");

          objc_msgSend(v12, "level");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v16) = levelHasValidPath(v18);

          if ((v16 & 1) == 0)
            goto LABEL_11;
          memset(&v46, 0, sizeof(v46));
          objc_msgSend(v12, "level");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "directoryValue");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "path");
          v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v22 = stat((const char *)objc_msgSend(v21, "UTF8String"), &v46);

          v7 = v45;
          if (v22)
          {
LABEL_11:
            if ((v17 & 1) == 0)
            {
              newFactorLevelWithLevel(v12, 0);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "addObject:", v41);

              continue;
            }
            if (objc_msgSend(v12, "hasLevel"))
            {
              objc_msgSend(v12, "level");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v23, "levelOneOfCase") == 101)
              {
                objc_msgSend(v12, "level");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "directoryValue");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v25, "hasPath");

                if (v26)
                {
                  v27 = (void *)objc_opt_new();
                  v28 = (void *)objc_opt_new();
                  objc_msgSend(v27, "setDirectoryValue:", v28);

                  objc_msgSend(v27, "directoryValue");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "setHasPath:", 0);

                  objc_msgSend(v12, "level");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "directoryValue");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = objc_msgSend(v31, "isOnDemand");
                  objc_msgSend(v27, "directoryValue");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "setIsOnDemand:", v32);

                  objc_msgSend(v12, "level");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "directoryValue");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "asset");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "directoryValue");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "setAsset:", v36);

                  v7 = v45;
                  objc_msgSend(v12, "level");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "metadata");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "setMetadata:", v39);

                  newFactorLevelWithLevel(v12, v27);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v6, "addObject:", v40);

                  continue;
                }
              }
              else
              {

              }
            }
          }
        }
      }
      objc_msgSend(v6, "addObject:", v12);
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  }
  while (v9);
LABEL_21:

  v5 = v43;
  v4 = v44;
LABEL_23:

  return v6;
}

+ (id)_rootFactorLevelsWithNamespaceName:()UAFTrialClient
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v10 = 0;
  objc_msgSend(MEMORY[0x24BEBA908], "_queryAssetsWithNamespaceName:factorName:language:isRoot:withError:", v3, 0, 0, 1, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v4)
  {
    factorLevelsFromAssets(v4, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextTrialCategory);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v12 = "+[TRIClient(UAFTrialClient) _rootFactorLevelsWithNamespaceName:]";
      v13 = 2112;
      v14 = v3;
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_229282000, v7, OS_LOG_TYPE_DEFAULT, "%s MAQuery for factorLevels roots %@ failed: %@", buf, 0x20u);

    }
    v6 = 0;
  }

  return v6;
}

+ (id)_factoryFactorLevelsWithNamespaceName:()UAFTrialClient onDemandClient:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v35;
  id obj;
  void *v37;
  id v38;
  void *v39;
  NSObject *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  _BYTE v50[128];
  uint8_t v51[128];
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v38 = a4;
  v49 = 0;
  objc_msgSend(MEMORY[0x24BEBA908], "_queryAssetsWithNamespaceName:factorName:language:isRoot:withError:", v5, 0, 0, 0, &v49);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v49;
  v8 = v7;
  if (v6)
  {
    v35 = v7;
    v37 = v5;
    v39 = (void *)objc_opt_new();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = v6;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (!v9)
      goto LABEL_14;
    v10 = v9;
    v11 = *(_QWORD *)v46;
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v46 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v13, "attributes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("isRoot"));
        v15 = objc_claimAutoreleasedReturnValue();
        if (!v15)
        {

LABEL_11:
          objc_msgSend(v39, "addObject:", v13);
          continue;
        }
        v16 = (void *)v15;
        objc_msgSend(v13, "attributes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("isRoot"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("1"));

        if ((v19 & 1) == 0)
          goto LABEL_11;
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      if (!v10)
      {
LABEL_14:

        v20 = v39;
        if (v38)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v40 = v20;
          v22 = v20;
          v23 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v42;
            do
            {
              for (j = 0; j != v24; ++j)
              {
                if (*(_QWORD *)v42 != v25)
                  objc_enumerationMutation(v22);
                v27 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
                objc_msgSend(v27, "attributes");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("Factor"));
                v29 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v38, "levelForFactor:withNamespaceName:", v29, v37);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                if ((levelHasValidPath(v30) & 1) == 0)
                  objc_msgSend(v21, "addObject:", v27);

              }
              v24 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
            }
            while (v24);
          }

          v31 = v21;
          v20 = v40;
        }
        else
        {
          v31 = 0;
          v21 = v20;
        }
        v5 = v37;
        factorLevelsFromAssets(v21, v37);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = v35;
        goto LABEL_30;
      }
    }
  }
  UAFGetLogCategory((id *)&UAFLogContextTrialCategory);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "localizedDescription");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v53 = "+[TRIClient(UAFTrialClient) _factoryFactorLevelsWithNamespaceName:onDemandClient:]";
    v54 = 2112;
    v55 = v5;
    v56 = 2112;
    v57 = v32;
    _os_log_impl(&dword_229282000, v20, OS_LOG_TYPE_DEFAULT, "%s MAQuery for factory assets %@ failed: %@", buf, 0x20u);

  }
  v33 = 0;
LABEL_30:

  return v33;
}

- (id)UAFLevelForFactor:()UAFTrialClient withNamespaceName:withLanguage:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "_initOnce");
  objc_msgSend(a1, "_trialLevelForFactor:withNamespaceName:withLanguage:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    UAFGetLogCategory((id *)&UAFLogContextTrialCategory);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315906;
      v16 = "-[TRIClient(UAFTrialClient) UAFLevelForFactor:withNamespaceName:withLanguage:]";
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v8;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_229282000, v12, OS_LOG_TYPE_DEFAULT, "%s Returning trial for levelForFactor:%@:%@:%@", (uint8_t *)&v15, 0x2Au);
    }

    v13 = v11;
  }

  return v11;
}

+ (id)_cachedLevelForFactorAnyLanguage:()UAFTrialClient withNamespaceName:withCache:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(":%@:"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __90__TRIClient_UAFTrialClient___cachedLevelForFactorAnyLanguage_withNamespaceName_withCache___block_invoke;
  v14[3] = &unk_24F1F7E10;
  v11 = v10;
  v15 = v11;
  v16 = &v17;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v14);
  v12 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v12;
}

+ (id)_cachedLevelForFactor:()UAFTrialClient withNamespaceName:withLanguage:withCache:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend((id)objc_opt_class(), "_levelKeyForCache:withFactorName:withLanguage:", v11, v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (uint64_t)_rootLevelForFactor:()UAFTrialClient withNamespaceName:withLanguage:
{
  return objc_msgSend(MEMORY[0x24BEBA908], "_cachedLevelForFactor:withNamespaceName:withLanguage:withCache:", a3, a4, a5, _MergedGlobals_8);
}

+ (uint64_t)_factoryLevelForFactor:()UAFTrialClient withNamespaceName:withLanguage:
{
  return objc_msgSend(MEMORY[0x24BEBA908], "_cachedLevelForFactor:withNamespaceName:withLanguage:withCache:", a3, a4, a5, qword_2540B1CF0);
}

- (id)_trialLevelForFactor:()UAFTrialClient withNamespaceName:withLanguage:
{
  void *v1;
  id v2;

  objc_msgSend(a1, "levelForFactor:withNamespaceName:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (levelHasValidPath(v1))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

+ (void)UAFCacheUpdate
{
  NSObject *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v36 = (void *)objc_opt_new();
  v38 = (void *)objc_opt_new();
  v37 = (void *)objc_opt_new();
  v39 = objc_opt_new();
  UAFGetLogCategory((id *)&UAFLogContextTrialCategory);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v50 = "+[TRIClient(UAFTrialClient) UAFCacheUpdate]";
    _os_log_impl(&dword_229282000, v0, OS_LOG_TYPE_DEFAULT, "%s Running UAFCacheUpdate", buf, 0xCu);
  }

  +[UAFTrialConversions entitledTrialNamespaceNames](UAFTrialConversions, "entitledTrialNamespaceNames");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1 && objc_msgSend(v1, "count"))
  {
    _ProjectToNamespacesMapping();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v34 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (!v34)
      goto LABEL_41;
    v32 = *(_QWORD *)v46;
    v33 = v3;
    while (1)
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v46 != v32)
          objc_enumerationMutation(v3);
        v35 = v4;
        v5 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v4);
        objc_msgSend(MEMORY[0x24BEBA908], "clientWithIdentifier:", objc_msgSend(v5, "intValue", v32));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        objc_msgSend(v3, "objectForKey:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v42;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v42 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v10);
              objc_msgSend(MEMORY[0x24BEBA990], "namespaceNameFromId:", objc_msgSend(v11, "intValue"));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v2, "containsObject:", v12) & 1) != 0)
              {
                if (+[UAFCommonUtilities isInternalInstall](UAFCommonUtilities, "isInternalInstall"))
                {
                  objc_msgSend((id)objc_opt_class(), "_rootFactorLevelsWithNamespaceName:", v12);
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  UAFGetLogCategory((id *)&UAFLogContextTrialCategory);
                  v14 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    v50 = "+[TRIClient(UAFTrialClient) UAFCacheUpdate]";
                    v51 = 2112;
                    v52 = v12;
                    _os_log_impl(&dword_229282000, v14, OS_LOG_TYPE_DEFAULT, "%s Processing any root factorlevels in %@ for cache", buf, 0x16u);
                  }

                  objc_msgSend(MEMORY[0x24BEBA908], "_addFactorLevelsToCache:namespaceName:withFactorLevelsCache:withLevelCache:", v13, v12, v36, v37);
                }
                v15 = objc_msgSend(v11, "intValue");
                if (v15 == 401 || v15 == 751 || v15 == 406)
                {
                  v16 = v40;
                  goto LABEL_24;
                }
                objc_msgSend(v40, "rolloutIdentifiersWithNamespaceName:", v12);
                v16 = objc_claimAutoreleasedReturnValue();
                UAFGetLogCategory((id *)&UAFLogContextTrialCategory);
                v17 = objc_claimAutoreleasedReturnValue();
                v19 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
                if (v16)
                {
                  if (v19)
                  {
                    *(_DWORD *)buf = 136315394;
                    v50 = "+[TRIClient(UAFTrialClient) UAFCacheUpdate]";
                    v51 = 2112;
                    v52 = v12;
                    _os_log_impl(&dword_229282000, v17, OS_LOG_TYPE_DEFAULT, "%s Active rollout exists for %@, skipping factory asset check", buf, 0x16u);
                  }
                }
                else
                {
                  if (v19)
                  {
                    *(_DWORD *)buf = 136315394;
                    v50 = "+[TRIClient(UAFTrialClient) UAFCacheUpdate]";
                    v51 = 2112;
                    v52 = v12;
                    _os_log_impl(&dword_229282000, v17, OS_LOG_TYPE_DEFAULT, "%s No active rollout for %@ exists, performing factory check", buf, 0x16u);
                  }

                  v16 = 0;
LABEL_24:
                  objc_msgSend((id)objc_opt_class(), "_factoryFactorLevelsWithNamespaceName:onDemandClient:", v12, v16);
                  v17 = objc_claimAutoreleasedReturnValue();
                  UAFGetLogCategory((id *)&UAFLogContextTrialCategory);
                  v18 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    v50 = "+[TRIClient(UAFTrialClient) UAFCacheUpdate]";
                    v51 = 2112;
                    v52 = v12;
                    _os_log_impl(&dword_229282000, v18, OS_LOG_TYPE_DEFAULT, "%s Processing any factory factorlevels in %@ for cache", buf, 0x16u);
                  }

                  objc_msgSend(MEMORY[0x24BEBA908], "_addFactorLevelsToCache:namespaceName:withFactorLevelsCache:withLevelCache:", v17, v12, v38, v39);
                }

                goto LABEL_30;
              }
              UAFGetLogCategory((id *)&UAFLogContextTrialCategory);
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v50 = "+[TRIClient(UAFTrialClient) UAFCacheUpdate]";
                v51 = 2112;
                v52 = v12;
                _os_log_debug_impl(&dword_229282000, v16, OS_LOG_TYPE_DEBUG, "%s Process is not entitled for %@, skipping", buf, 0x16u);
              }
LABEL_30:

              ++v10;
            }
            while (v8 != v10);
            v20 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
            v8 = v20;
          }
          while (v20);
        }

        v4 = v35 + 1;
        v3 = v33;
      }
      while (v35 + 1 != v34);
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      if (!v34)
      {
LABEL_41:
        v21 = (void *)qword_2540B1CF8;
        qword_2540B1CF8 = (uint64_t)v36;
        v22 = v36;

        v23 = (void *)_MergedGlobals_8;
        _MergedGlobals_8 = (uint64_t)v37;
        v24 = v37;

        v25 = (void *)qword_2540B1D00;
        qword_2540B1D00 = (uint64_t)v38;
        v26 = v38;

        v27 = (void *)qword_2540B1CF0;
        qword_2540B1CF0 = v39;

        goto LABEL_45;
      }
    }
  }
  UAFGetLogCategory((id *)&UAFLogContextTrialCategory);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v50 = "+[TRIClient(UAFTrialClient) UAFCacheUpdate]";
    _os_log_impl(&dword_229282000, v28, OS_LOG_TYPE_DEFAULT, "%s Process is not entitled for any trial namespaces, skipping cache population", buf, 0xCu);
  }

  v29 = (void *)qword_2540B1CF8;
  qword_2540B1CF8 = (uint64_t)v36;
  v3 = v36;

  v30 = (void *)_MergedGlobals_8;
  _MergedGlobals_8 = (uint64_t)v37;
  v22 = v37;

  v31 = (void *)qword_2540B1D00;
  qword_2540B1D00 = (uint64_t)v38;
  v24 = v38;

  v26 = (id)qword_2540B1CF0;
  qword_2540B1CF0 = v39;
LABEL_45:

}

+ (void)_addFactorLevelsToCache:()UAFTrialClient namespaceName:withFactorLevelsCache:withLevelCache:
{
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
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v21 = a5;
  v11 = a6;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v16, "hasLevel"))
        {
          v17 = (void *)MEMORY[0x24BEBA908];
          objc_msgSend(v16, "level");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "factor");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "name");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "_addLevelToCache:namespaceName:factorName:withCache:", v18, v10, v20, v11);

        }
      }
      v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);
  }
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v9, v10);

}

+ (void)_addLevelToCache:()UAFTrialClient namespaceName:factorName:withCache:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend(v9, "metadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("locale"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_levelKeyForCache:withFactorName:withLanguage:", v12, v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (levelHasValidPath(v9))
  {
    UAFGetLogCategory((id *)&UAFLogContextTrialCategory);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315394;
      v18 = "+[TRIClient(UAFTrialClient) _addLevelToCache:namespaceName:factorName:withCache:]";
      v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_229282000, v16, OS_LOG_TYPE_DEFAULT, "%s Adding level with key %@ to cache", (uint8_t *)&v17, 0x16u);
    }

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v15);
  }

}

+ (uint64_t)_levelKeyForCache:()UAFTrialClient withFactorName:withLanguage:
{
  return objc_msgSend(a3, "stringByAppendingFormat:", CFSTR(":%@:%@"), a4, a5);
}

+ (id)_queryAssetsWithNamespaceName:()UAFTrialClient factorName:language:isRoot:withError:
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  +[UAFTrialConversions assetTypeFromNamespaceName:](UAFTrialConversions, "assetTypeFromNamespaceName:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(CFSTR("com.apple.MobileAsset.Trial.Siri."), "stringByAppendingString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BB0]), "initWithType:", v15);
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "returnTypes:", 3);
      objc_msgSend(v17, "setDoNotBlockOnNetworkStatus:", 1);
      objc_msgSend(v17, "setDoNotBlockBeforeFirstUnlock:", 1);
      if (v12)
        objc_msgSend(v17, "addKeyValuePair:with:", CFSTR("Factor"), v12);
      if (v13)
        objc_msgSend(v17, "addKeyValuePair:with:", CFSTR("locale"), v13);
      if (a6)
        objc_msgSend(v17, "addKeyValuePair:with:", CFSTR("isRoot"), CFSTR("1"));
      v18 = objc_msgSend(v17, "queryMetaDataSync");
      if (!v18)
      {
        objc_msgSend(v17, "results");
        v20 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "count"))
        {
          if (!a6 || (v22 = objc_msgSend(v20, "count"), !v12) || v22 < 2)
          {
            v20 = v20;
            v19 = v20;
            goto LABEL_15;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MA query for roots of AssetType %@, factorName: %@, language: %@ had multiple results.  This is commonly due to multiple roots being installed.  Unclear which one to return."), v15, v12, v13);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MA query for AssetType %@, factorName: %@, language: %@ had no results"), v15, v12, v13);
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        createError(a7, v23);

LABEL_14:
        v19 = 0;
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MA query for %@ failed with result: %ld"), v15, v18, v24, v25);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("failed to create MAAssetQuery for %@:%@:%@, assetType: %@"), v11, v12, v13, v15);
    }
    v20 = (id)objc_claimAutoreleasedReturnValue();
    createError(a7, v20);
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("failed to convert namespace %@ to asset type"), v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  createError(a7, v15);
  v19 = 0;
LABEL_16:

  return v19;
}

- (void)_initOnce
{
  if (_initOnce_initOnce != -1)
    dispatch_once(&_initOnce_initOnce, &__block_literal_global_9);
}

@end
