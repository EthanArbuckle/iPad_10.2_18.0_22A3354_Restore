@implementation UAFAutoAssetManager

+ (id)getConcurrentQueue
{
  if (_MergedGlobals_17 != -1)
    dispatch_once(&_MergedGlobals_17, &__block_literal_global_19);
  return (id)qword_2540B1E00;
}

void __41__UAFAutoAssetManager_getConcurrentQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("UAFAutoAssetManager.Concurrent", MEMORY[0x24BDAC9C0]);
  v1 = (void *)qword_2540B1E00;
  qword_2540B1E00 = (uint64_t)v0;

}

+ (id)getSerialQueue
{
  if (qword_2540B1E08 != -1)
    dispatch_once(&qword_2540B1E08, &__block_literal_global_209);
  return (id)qword_2540B1E10;
}

void __37__UAFAutoAssetManager_getSerialQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("UAFAutoAssetManager.Serial", 0);
  v1 = (void *)qword_2540B1E10;
  qword_2540B1E10 = (uint64_t)v0;

}

+ (id)getSpecifiers:(id)a3 assetSetUsages:(id)a4
{
  return (id)objc_msgSend(a1, "getSpecifiers:assetSetUsages:disableExperimentation:", a3, a4, 0);
}

+ (id)getSpecifiers:(id)a3 assetSetUsages:(id)a4 disableExperimentation:(BOOL)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t i;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  id v24;
  void *v25;
  void *v26;
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
  id v38;
  NSObject *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  void *v47;
  _BOOL4 v48;
  void *v49;
  id obj;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[4];
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  const char *v65;
  __int16 v66;
  void *v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v48 = a5;
  v70 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  objc_msgSend(v6, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v7;
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v10;
  v52 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
  if (v52)
  {
    v51 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v52; ++i)
      {
        if (*(_QWORD *)v61 != v51)
          objc_enumerationMutation(obj);
        v12 = v6;
        objc_msgSend(v6, "getAutoAssets:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v57;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v57 != v16)
                objc_enumerationMutation(v13);
              objc_msgSend(v13, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * j));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("AssetSpecifier"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v19);

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
          }
          while (v15);
        }

        v6 = v12;
      }
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    }
    while (v52);
  }

  objc_msgSend(v6, "experimentalAssets");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v65 = "+[UAFAutoAssetManager getSpecifiers:assetSetUsages:disableExperimentation:]";
      v66 = 2114;
      v67 = v22;
      v23 = "%s No experimental assets for asset set %{public}@";
      goto LABEL_21;
    }
LABEL_22:

    v24 = v8;
    goto LABEL_37;
  }
  if (v48)
  {
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v65 = "+[UAFAutoAssetManager getSpecifiers:assetSetUsages:disableExperimentation:]";
      v66 = 2114;
      v67 = v22;
      v23 = "%s Experimentation not enabled for asset set %{public}@";
LABEL_21:
      _os_log_impl(&dword_229282000, v21, OS_LOG_TYPE_DEFAULT, v23, buf, 0x16u);

      goto LABEL_22;
    }
    goto LABEL_22;
  }
  objc_msgSend(v6, "experimentalAssets");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trialProject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAFCommonUtilities trialClientWithProject:](UAFCommonUtilities, "trialClientWithProject:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v6, "experimentalAssets");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trialNamespace");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "experimentalAssets");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "trialFactor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[UAFCommonUtilities getDirectoryPath:trialNamespace:trialFactor:](UAFCommonUtilities, "getDirectoryPath:trialNamespace:trialFactor:", v27, v29, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), v32, CFSTR("experiment.plist"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", v33);
      if ((objc_msgSend(v34, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
      {
        v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v32);

        objc_msgSend(v35, "URLByAppendingPathComponent:", CFSTR("experiment.plist"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v36 = v6;
      v55 = 0;
      +[UAFAssetSetExperimentConfiguration fromContentsOfURL:error:](UAFAssetSetExperimentConfiguration, "fromContentsOfURL:error:", v34, &v55);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v55;
      if (v38)
      {
        UAFGetLogCategory((id *)&UAFLogContextMAConfig);
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v36, "name");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v65 = "+[UAFAutoAssetManager getSpecifiers:assetSetUsages:disableExperimentation:]";
          v66 = 2114;
          v67 = v47;
          _os_log_error_impl(&dword_229282000, v39, OS_LOG_TYPE_ERROR, "%s Unexpected experiment file content for Asset Set %{public}@", buf, 0x16u);

        }
        v40 = v8;
      }
      else
      {
        objc_msgSend(v37, "assetSpecifiers");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v53[0] = MEMORY[0x24BDAC760];
        v53[1] = 3221225472;
        v53[2] = __75__UAFAutoAssetManager_getSpecifiers_assetSetUsages_disableExperimentation___block_invoke;
        v53[3] = &unk_24F1F7CE8;
        v44 = v8;
        v54 = v44;
        objc_msgSend(v43, "enumerateKeysAndObjectsUsingBlock:", v53);

        v45 = v44;
      }

      v6 = v36;
    }
    else
    {
      v42 = v8;
    }

  }
  else
  {
    v41 = v8;
  }

LABEL_37:
  return v8;
}

void __75__UAFAutoAssetManager_getSpecifiers_assetSetUsages_disableExperimentation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

+ (id)getCurrentSpecifiers:(id)a3 expectedAutoAssetType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v27 = (id)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v25 = v5;
  objc_msgSend(v5, "configuredAssetEntries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v29;
    *(_QWORD *)&v9 = 136315906;
    v24 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v13, "assetSelector", v24);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "assetType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v6);

        if ((v16 & 1) != 0)
        {
          objc_msgSend(v13, "assetSelector");
          v17 = objc_claimAutoreleasedReturnValue();
          -[NSObject assetSpecifier](v17, "assetSpecifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v18);

        }
        else
        {
          UAFGetLogCategory((id *)&UAFLogContextMAConfig);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v13, "assetSelector");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "assetType");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "assetSelector");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "assetSpecifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "assetSetIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v24;
            v33 = "+[UAFAutoAssetManager getCurrentSpecifiers:expectedAutoAssetType:]";
            v34 = 2114;
            v35 = v19;
            v36 = 2114;
            v37 = v21;
            v38 = 2114;
            v39 = v22;
            _os_log_error_impl(&dword_229282000, v17, OS_LOG_TYPE_ERROR, "%s Unexpected auto asset type %{public}@ with specifier %{public}@ in auto asset set %{public}@", buf, 0x2Au);

          }
        }

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v10);
  }

  return v27;
}

+ (id)getAutoSetEntries:(id)a3 specifiers:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL8 v14;
  id v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
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
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11);
        objc_msgSend(v5, "autoAssetType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = +[UAFAssetSetManager cacheDeleteDisabledForAutoAssetType:autoAssetSpecifier:](UAFAssetSetManager, "cacheDeleteDisabledForAutoAssetType:autoAssetSpecifier:", v13, v12);

        v15 = objc_alloc(MEMORY[0x24BE66BE0]);
        objc_msgSend(v5, "autoAssetType");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v15, "initForAssetType:withAssetSpecifier:assetLockedInhibitsRemoval:", v16, v12, v14);

        objc_msgSend(v7, "addObject:", v17);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  return v7;
}

+ (id)getAutoAssetSet:(id)a3 specifiers:(id)a4 addEntries:(BOOL)a5 configured:(BOOL *)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  NSObject *v17;
  id v18;
  NSObject *v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  NSObject *v31;
  __CFString *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  __CFString *v45;
  NSObject *v46;
  const __CFString *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _BOOL4 v53;
  NSObject *v54;
  _BOOL4 v55;
  __CFString *v56;
  __CFString *v57;
  __CFString *v58;
  __CFString *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t j;
  uint64_t v66;
  NSObject *v67;
  __CFString *v68;
  __CFString *v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t k;
  uint64_t v76;
  NSObject *v77;
  __CFString *v78;
  __CFString *v79;
  void *v80;
  __CFString *v81;
  __CFString *v82;
  __CFString *v83;
  id v84;
  id v85;
  id v86;
  void *v87;
  id obj;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  id v106;
  id v107;
  _BYTE v108[128];
  uint8_t v109[128];
  uint8_t buf[4];
  const char *v111;
  __int16 v112;
  const __CFString *v113;
  __int16 v114;
  const __CFString *v115;
  __int16 v116;
  void *v117;
  __int16 v118;
  void *v119;
  __int16 v120;
  void *v121;
  _BYTE v122[128];
  uint64_t v123;

  v7 = a5;
  v123 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  *a6 = 0;
  if (v7)
  {
    +[UAFAutoAssetManager getAutoSetEntries:specifiers:](UAFAutoAssetManager, "getAutoSetEntries:specifiers:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v12 = objc_alloc(MEMORY[0x24BE66BD8]);
  objc_msgSend(v9, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAFAutoAssetManager getConcurrentQueue](UAFAutoAssetManager, "getConcurrentQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = 0;
  v15 = (void *)objc_msgSend(v12, "initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:completingFromQueue:error:", CFSTR("com.apple.UnifiedAssetFramework"), CFSTR("manager"), v13, v11, v14, &v107);
  v16 = (__CFString *)v107;

  if (v16)
  {
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "name");
      v44 = v15;
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v111 = "+[UAFAutoAssetManager getAutoAssetSet:specifiers:addEntries:configured:]";
      v112 = 2114;
      v113 = v45;
      v114 = 2114;
      v115 = v16;
      _os_log_error_impl(&dword_229282000, v17, OS_LOG_TYPE_ERROR, "%s Could not initialize auto asset set %{public}@ : %{public}@", buf, 0x20u);

      v15 = v44;
    }

    goto LABEL_8;
  }
  if (!v15)
  {
LABEL_8:
    v18 = 0;
    goto LABEL_9;
  }
  if (v7)
  {
    *a6 = 1;
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v15, "assetSetIdentifier");
      v21 = v15;
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "allObjects");
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v111 = "+[UAFAutoAssetManager getAutoAssetSet:specifiers:addEntries:configured:]";
      v112 = 2114;
      v113 = v22;
      v114 = 2114;
      v115 = v23;
      _os_log_impl(&dword_229282000, v20, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ created with specifiers %{public}@", buf, 0x20u);

      v15 = v21;
    }

    v18 = v15;
  }
  else
  {
    v106 = 0;
    objc_msgSend(v15, "currentSetStatusSync:", &v106);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (__CFString *)v106;
    v26 = v25;
    if (!v24 || v25)
    {
      UAFGetLogCategory((id *)&UAFLogContextMAConfig);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v15, "assetSetIdentifier");
        v80 = v15;
        v81 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v111 = "+[UAFAutoAssetManager getAutoAssetSet:specifiers:addEntries:configured:]";
        v112 = 2114;
        v113 = v81;
        v114 = 2114;
        v115 = v26;
        _os_log_error_impl(&dword_229282000, v33, OS_LOG_TYPE_ERROR, "%s Could not get status of auto asset set %{public}@ : %{public}@", buf, 0x20u);

        v15 = v80;
      }

      v18 = 0;
    }
    else
    {
      v93 = v15;
      objc_msgSend(v24, "schedulerPolicy");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v27
        && (v28 = (void *)v27,
            objc_msgSend(v24, "schedulerPolicy"),
            v29 = (void *)objc_claimAutoreleasedReturnValue(),
            v30 = objc_msgSend(v29, "blockCheckDownload"),
            v29,
            v28,
            v30))
      {
        UAFGetLogCategory((id *)&UAFLogContextMAConfig);
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v93, "assetSetIdentifier");
          v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v111 = "+[UAFAutoAssetManager getAutoAssetSet:specifiers:addEntries:configured:]";
          v112 = 2114;
          v113 = v32;
          _os_log_impl(&dword_229282000, v31, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ currently has downloads blocked", buf, 0x16u);

        }
        v15 = v93;
        v18 = v93;
        v26 = 0;
      }
      else
      {
        objc_msgSend(v9, "autoAssetType");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = v24;
        +[UAFAutoAssetManager getCurrentSpecifiers:expectedAutoAssetType:](UAFAutoAssetManager, "getCurrentSpecifiers:expectedAutoAssetType:", v24, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        UAFGetLogCategory((id *)&UAFLogContextMAConfig);
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v93, "assetSetIdentifier");
          v82 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "allObjects");
          v83 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v111 = "+[UAFAutoAssetManager getAutoAssetSet:specifiers:addEntries:configured:]";
          v112 = 2114;
          v113 = v82;
          v114 = 2114;
          v115 = v83;
          _os_log_debug_impl(&dword_229282000, v36, OS_LOG_TYPE_DEBUG, "%s Auto asset set %{public}@ has specifiers %{public}@", buf, 0x20u);

        }
        v92 = v11;
        v15 = v93;
        if (objc_msgSend(v35, "isEqualToSet:", v10))
        {
          v84 = v9;
          *a6 = 1;
          v102 = 0u;
          v103 = 0u;
          v104 = 0u;
          v105 = 0u;
          objc_msgSend(v87, "configuredAssetEntries");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v90 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v122, 16);
          if (v90)
          {
            v89 = *(_QWORD *)v103;
            v85 = v10;
            while (2)
            {
              for (i = 0; i != v90; ++i)
              {
                if (*(_QWORD *)v103 != v89)
                  objc_enumerationMutation(obj);
                v38 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
                objc_msgSend(v38, "assetSelector");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "assetType");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "assetSelector");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "assetSpecifier");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = +[UAFAssetSetManager cacheDeleteDisabledForAutoAssetType:autoAssetSpecifier:](UAFAssetSetManager, "cacheDeleteDisabledForAutoAssetType:autoAssetSpecifier:", v40, v42);

                if (v43 != objc_msgSend(v38, "assetLockedInhibitsRemoval"))
                {
                  UAFGetLogCategory((id *)&UAFLogContextMAConfig);
                  v46 = objc_claimAutoreleasedReturnValue();
                  v15 = v93;
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                  {
                    if (objc_msgSend(v38, "assetLockedInhibitsRemoval"))
                      v47 = CFSTR("YES");
                    else
                      v47 = CFSTR("NO");
                    if (v43)
                      v48 = CFSTR("YES");
                    else
                      v48 = CFSTR("NO");
                    objc_msgSend(v38, "assetSelector");
                    v91 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v91, "assetType");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v38, "assetSelector");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v50, "assetSpecifier");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v93, "assetSetIdentifier");
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 136316418;
                    v111 = "+[UAFAutoAssetManager getAutoAssetSet:specifiers:addEntries:configured:]";
                    v112 = 2114;
                    v113 = v47;
                    v114 = 2114;
                    v115 = v48;
                    v116 = 2114;
                    v117 = v49;
                    v118 = 2114;
                    v119 = v51;
                    v120 = 2114;
                    v121 = v52;
                    _os_log_impl(&dword_229282000, v46, OS_LOG_TYPE_DEFAULT, "%s assetLockedInhibitsRemoval value %{public}@ doesn't match desired value %{public}@ for asset type %{public}@ and specifier %{public}@ in asset set %{public}@", buf, 0x3Eu);

                    v15 = v93;
                  }

                  *a6 = 0;
                  v10 = v85;
                  v11 = v92;
                  goto LABEL_46;
                }
                v11 = v92;
                v15 = v93;
              }
              v10 = v85;
              v90 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v122, 16);
              if (v90)
                continue;
              break;
            }
          }
LABEL_46:

          v9 = v84;
        }
        v53 = *a6;
        UAFGetLogCategory((id *)&UAFLogContextMAConfig);
        v54 = objc_claimAutoreleasedReturnValue();
        v55 = os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT);
        if (v53)
        {
          if (v55)
          {
            objc_msgSend(v15, "assetSetIdentifier");
            v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "allObjects");
            v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v111 = "+[UAFAutoAssetManager getAutoAssetSet:specifiers:addEntries:configured:]";
            v112 = 2114;
            v113 = v56;
            v114 = 2114;
            v115 = v57;
            _os_log_impl(&dword_229282000, v54, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ has expected specifiers %{public}@", buf, 0x20u);

            v15 = v93;
          }
        }
        else
        {
          if (v55)
          {
            objc_msgSend(v93, "assetSetIdentifier");
            v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "allObjects");
            v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "allObjects");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            v111 = "+[UAFAutoAssetManager getAutoAssetSet:specifiers:addEntries:configured:]";
            v112 = 2114;
            v113 = v58;
            v114 = 2114;
            v115 = v59;
            v116 = 2114;
            v117 = v60;
            _os_log_impl(&dword_229282000, v54, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ does not have expected specifiers %{public}@, has %{public}@", buf, 0x2Au);

          }
          objc_msgSend(MEMORY[0x24BDBCEF0], "set");
          v54 = objc_claimAutoreleasedReturnValue();
          v98 = 0u;
          v99 = 0u;
          v100 = 0u;
          v101 = 0u;
          v61 = v10;
          v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v98, v109, 16);
          if (v62)
          {
            v63 = v62;
            v64 = *(_QWORD *)v99;
            do
            {
              for (j = 0; j != v63; ++j)
              {
                if (*(_QWORD *)v99 != v64)
                  objc_enumerationMutation(v61);
                v66 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * j);
                if ((objc_msgSend(v35, "containsObject:", v66) & 1) == 0)
                  -[NSObject addObject:](v54, "addObject:", v66);
              }
              v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v98, v109, 16);
            }
            while (v63);
          }
          v86 = v10;

          UAFGetLogCategory((id *)&UAFLogContextMAConfig);
          v67 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v93, "assetSetIdentifier");
            v68 = (__CFString *)objc_claimAutoreleasedReturnValue();
            -[NSObject allObjects](v54, "allObjects");
            v69 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v111 = "+[UAFAutoAssetManager getAutoAssetSet:specifiers:addEntries:configured:]";
            v112 = 2114;
            v113 = v68;
            v114 = 2114;
            v115 = v69;
            _os_log_impl(&dword_229282000, v67, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ missing specifiers: %{public}@", buf, 0x20u);

          }
          objc_msgSend(MEMORY[0x24BDBCEF0], "set");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = 0u;
          v95 = 0u;
          v96 = 0u;
          v97 = 0u;
          v71 = v35;
          v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v94, v108, 16);
          if (v72)
          {
            v73 = v72;
            v74 = *(_QWORD *)v95;
            do
            {
              for (k = 0; k != v73; ++k)
              {
                if (*(_QWORD *)v95 != v74)
                  objc_enumerationMutation(v71);
                v76 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * k);
                if ((objc_msgSend(v61, "containsObject:", v76) & 1) == 0)
                  objc_msgSend(v70, "addObject:", v76);
              }
              v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v94, v108, 16);
            }
            while (v73);
          }

          UAFGetLogCategory((id *)&UAFLogContextMAConfig);
          v77 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v93, "assetSetIdentifier");
            v78 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "allObjects");
            v79 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v111 = "+[UAFAutoAssetManager getAutoAssetSet:specifiers:addEntries:configured:]";
            v112 = 2114;
            v113 = v78;
            v114 = 2114;
            v115 = v79;
            _os_log_impl(&dword_229282000, v77, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ extra specifiers: %{public}@", buf, 0x20u);

          }
          v10 = v86;
          v11 = v92;
          v15 = v93;
        }
        v26 = 0;

        v18 = v15;
        v24 = v87;
      }
    }

  }
LABEL_9:

  return v18;
}

+ (id)getReason:(id)a3 operation:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "autoAssetSetClientName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientDomainName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetSetIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ in %@ %@ %@"), v8, v9, v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)configureAssetSet:(id)a3 specifiers:(id)a4 changed:(BOOL *)a5
{
  id v7;
  id v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  id v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  int v33;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  int v41;
  void *v42;
  char v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  NSObject *v47;
  __int16 v48;
  NSObject *v49;
  __int16 v50;
  _BYTE v51[18];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  *a5 = 0;
  v43 = 0;
  +[UAFAutoAssetManager getAutoAssetSet:specifiers:addEntries:configured:](UAFAutoAssetManager, "getAutoAssetSet:specifiers:addEntries:configured:", v7, v8, 0, &v43);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = v43 == 0;
  else
    v10 = 1;
  if (v10)
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setAllowCheckDownloadOverCellular:", objc_msgSend(v7, "enableCellular"));
    if (v9)
    {
      +[UAFAutoAssetManager getAutoSetEntries:specifiers:](UAFAutoAssetManager, "getAutoSetEntries:specifiers:", v7, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v7, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("Update to %@"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "alterEntriesRepresentingAtomicSync:toBeComprisedOfEntries:withNeedPolicy:", v15, v12, v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      UAFGetLogCategory((id *)&UAFLogContextMAConfig);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v16)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v7, "name");
          v36 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "autoAssetType");
          v37 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "allObjects");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136316162;
          v45 = "+[UAFAutoAssetManager configureAssetSet:specifiers:changed:]";
          v46 = 2114;
          v47 = v36;
          v48 = 2114;
          v49 = v37;
          v50 = 2114;
          *(_QWORD *)v51 = v38;
          *(_WORD *)&v51[8] = 2114;
          *(_QWORD *)&v51[10] = v16;
          _os_log_error_impl(&dword_229282000, v18, OS_LOG_TYPE_ERROR, "%s Could not alter auto asset set %{public}@ with type %{public}@ specifiers %{public}@: %{public}@", buf, 0x34u);

        }
      }
      else
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "name");
          v25 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "autoAssetType");
          v42 = v12;
          v26 = objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v7, "enableCellular");
          objc_msgSend(v8, "allObjects");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136316162;
          v45 = "+[UAFAutoAssetManager configureAssetSet:specifiers:changed:]";
          v46 = 2114;
          v47 = v25;
          v48 = 2114;
          v49 = v26;
          v50 = 1024;
          *(_DWORD *)v51 = v41;
          *(_WORD *)&v51[4] = 2114;
          *(_QWORD *)&v51[6] = v27;
          _os_log_impl(&dword_229282000, v18, OS_LOG_TYPE_DEFAULT, "%s Altered auto asset set %{public}@ with type %{public}@ with cellular: %d and specifiers %{public}@", buf, 0x30u);

          v12 = v42;
        }

        +[UAFAutoAssetManager getReason:operation:](UAFAutoAssetManager, "getReason:operation:", v9, CFSTR("does need"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "needForAtomicSync:withNeedPolicy:", v28, v11);
        v29 = objc_claimAutoreleasedReturnValue();

        if (!v29)
        {
          *a5 = 1;
          +[UAFAutoAssetHistory persistAssetSetInfoConfiguring:isEliminating:reason:](UAFAutoAssetHistory, "persistAssetSetInfoConfiguring:isEliminating:reason:", v9, 0, CFSTR("altered"));
          v21 = v9;
          goto LABEL_26;
        }
        UAFGetLogCategory((id *)&UAFLogContextMAConfig);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v7, "name");
          v40 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v45 = "+[UAFAutoAssetManager configureAssetSet:specifiers:changed:]";
          v46 = 2114;
          v47 = v40;
          v48 = 2114;
          v49 = v29;
          _os_log_error_impl(&dword_229282000, v30, OS_LOG_TYPE_ERROR, "%s Could not indicate need for newly created asset set %{public}@ : %{public}@", buf, 0x20u);

        }
      }
      v21 = 0;
LABEL_26:

LABEL_32:
      goto LABEL_33;
    }
    +[UAFAutoAssetManager getAutoAssetSet:specifiers:addEntries:configured:](UAFAutoAssetManager, "getAutoAssetSet:specifiers:addEntries:configured:", v7, v8, 1, &v43);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      +[UAFAutoAssetManager getReason:operation:](UAFAutoAssetManager, "getReason:operation:", v9, CFSTR("does need"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "needForAtomicSync:withNeedPolicy:", v22, v11);
      v23 = objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        *a5 = 1;
        UAFGetLogCategory((id *)&UAFLogContextMAConfig);
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "name");
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v11, "allowCheckDownloadOverCellular");
          *(_DWORD *)buf = 136315650;
          v45 = "+[UAFAutoAssetManager configureAssetSet:specifiers:changed:]";
          v46 = 2114;
          v47 = v32;
          v48 = 1024;
          LODWORD(v49) = v33;
          _os_log_impl(&dword_229282000, v31, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ newly created with cellular policy: %d", buf, 0x1Cu);

        }
        +[UAFAutoAssetHistory persistAssetSetInfoConfiguring:isEliminating:reason:](UAFAutoAssetHistory, "persistAssetSetInfoConfiguring:isEliminating:reason:", v9, 0, CFSTR("created"));
        v9 = v9;
        v21 = v9;
        goto LABEL_32;
      }
      UAFGetLogCategory((id *)&UAFLogContextMAConfig);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "name");
        v39 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v45 = "+[UAFAutoAssetManager configureAssetSet:specifiers:changed:]";
        v46 = 2114;
        v47 = v39;
        v48 = 2114;
        v49 = v23;
        _os_log_error_impl(&dword_229282000, v24, OS_LOG_TYPE_ERROR, "%s Could not indicate need for newly created asset set %{public}@ : %{public}@", buf, 0x20u);

      }
    }
    else
    {
      UAFGetLogCategory((id *)&UAFLogContextMAConfig);
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        goto LABEL_28;
      objc_msgSend(v7, "name");
      v24 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v45 = "+[UAFAutoAssetManager configureAssetSet:specifiers:changed:]";
      v46 = 2114;
      v47 = v24;
      _os_log_error_impl(&dword_229282000, v23, OS_LOG_TYPE_ERROR, "%s Auto asset set %{public}@ could not be created", buf, 0x16u);
    }

LABEL_28:
    v21 = 0;
    goto LABEL_32;
  }
  UAFGetLogCategory((id *)&UAFLogContextMAConfig);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "name");
    v35 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v45 = "+[UAFAutoAssetManager configureAssetSet:specifiers:changed:]";
    v46 = 2114;
    v47 = v35;
    _os_log_debug_impl(&dword_229282000, v19, OS_LOG_TYPE_DEBUG, "%s Auto asset set %{public}@ already defined and properly configured", buf, 0x16u);

  }
  v9 = v9;
  v21 = v9;
LABEL_33:

  return v21;
}

+ (id)setLatestAtomicInstance:(id)a3 autoAssetSet:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v52;
  void *v53;
  id obj;
  NSObject *group;
  void *v56;
  void *v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  _QWORD v62[4];
  NSObject *v63;
  void *v64;
  id v65;
  id v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  _QWORD v73[3];
  _QWORD v74[3];
  uint8_t buf[4];
  const char *v76;
  __int16 v77;
  id v78;
  __int16 v79;
  id v80;
  __int16 v81;
  void *v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v58 = a3;
  v5 = a4;
  +[UAFAutoAssetManager getSerialQueue](UAFAutoAssetManager, "getSerialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  +[UAFAutoAssetManager getReason:operation:](UAFAutoAssetManager, "getReason:operation:", v5, CFSTR("locking latest version of"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0;
  v56 = v5;
  objc_msgSend(v5, "currentSetStatusSync:", &v72);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v72;
  v10 = v9;
  v57 = v8;
  if (v8 && !v9)
  {
    group = dispatch_group_create();
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    objc_msgSend(v8, "currentLockUsage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v12;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v68, v83, 16);
    if (!v13)
      goto LABEL_14;
    v14 = v13;
    v15 = *(_QWORD *)v69;
    while (1)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v69 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
        objc_msgSend(v57, "currentLockUsage");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v7);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v17);
        v20 = v7;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "integerValue");

        if (objc_msgSend(v17, "isEqualToString:", v58))
        {
          v7 = v20;
          if (v22 < 2)
            continue;
          --v22;
        }
        dispatch_group_enter(group);
        v23 = (void *)MEMORY[0x24BE66BD8];
        objc_msgSend(v56, "assetSetIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v62[0] = MEMORY[0x24BDAC760];
        v62[1] = 3221225472;
        v62[2] = __60__UAFAutoAssetManager_setLatestAtomicInstance_autoAssetSet___block_invoke;
        v62[3] = &unk_24F1F8838;
        v63 = group;
        v64 = v17;
        v65 = v56;
        v66 = v20;
        v67 = v22;
        objc_msgSend(v23, "endAtomicLocks:usingClientDomain:forClientName:forAssetSetIdentifier:ofAtomicInstance:removingLockCount:completion:", v66, CFSTR("com.apple.UnifiedAssetFramework"), CFSTR("manager"), v24, v17, v22, v62);

        v7 = v20;
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v83, 16);
      if (!v14)
      {
LABEL_14:

        dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
        UAFGetLogCategory((id *)&UAFLogContextMAConfig);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v56, "assetSetIdentifier");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v76 = "+[UAFAutoAssetManager setLatestAtomicInstance:autoAssetSet:]";
          v77 = 2114;
          v78 = v58;
          v79 = 2114;
          v80 = v43;
          v81 = 2114;
          v82 = v7;
          _os_log_debug_impl(&dword_229282000, v25, OS_LOG_TYPE_DEBUG, "%s Updated locks to reflect latest atomic instance of %{public}@ for auto asset set %{public}@ with reason \"%{public}@\", buf, 0x2Au);

        }
        if (v58)
        {
          v26 = 0;
          v10 = 0;
        }
        else
        {
          v61 = 0;
          objc_msgSend(v56, "currentSetStatusSync:", &v61);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v61;
          v10 = 0;
          if (v29)
          {
            v30 = v29;
            UAFGetLogCategory((id *)&UAFLogContextMAConfig);
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v56, "assetSetIdentifier");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v76 = "+[UAFAutoAssetManager setLatestAtomicInstance:autoAssetSet:]";
              v77 = 2114;
              v78 = v52;
              v79 = 2114;
              v80 = v30;
              _os_log_error_impl(&dword_229282000, v31, OS_LOG_TYPE_ERROR, "%s Could not get status of auto asset set %{public}@ : %{public}@", buf, 0x20u);

            }
            v26 = v30;
            v32 = v28;
            v28 = v26;
          }
          else
          {
            objc_msgSend(v28, "currentLockUsage");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "count");

            if (v34)
            {
              UAFGetLogCategory((id *)&UAFLogContextMAConfig);
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v56, "assetSetIdentifier");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315394;
                v76 = "+[UAFAutoAssetManager setLatestAtomicInstance:autoAssetSet:]";
                v77 = 2114;
                v78 = v36;
                _os_log_impl(&dword_229282000, v35, OS_LOG_TYPE_DEFAULT, "%s Could not eliminate unneeded auto asset %{public}@ as there are current locks", buf, 0x16u);

              }
              objc_msgSend(v28, "currentLockUsage");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v59[0] = MEMORY[0x24BDAC760];
              v59[1] = 3221225472;
              v59[2] = __60__UAFAutoAssetManager_setLatestAtomicInstance_autoAssetSet___block_invoke_234;
              v59[3] = &unk_24F1F8860;
              v60 = v56;
              objc_msgSend(v37, "enumerateKeysAndObjectsUsingBlock:", v59);

              v38 = (void *)MEMORY[0x24BDD1540];
              v39 = *MEMORY[0x24BDD0FC8];
              v73[0] = *MEMORY[0x24BDD0FD8];
              v73[1] = v39;
              v74[0] = CFSTR("Could not eliminate as there are current locks");
              v74[1] = CFSTR("Could not eliminate as there are current locks");
              v73[2] = CFSTR("currentLockUsage");
              objc_msgSend(v28, "currentLockUsage");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v74[2] = v40;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v74, v73, 3);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();

              v26 = v42;
              v32 = v28;
              v28 = v26;
            }
            else
            {
              +[UAFAutoAssetManager getReason:operation:](UAFAutoAssetManager, "getReason:operation:", v56, CFSTR("should eliminate"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = (void *)MEMORY[0x24BE66BD8];
              objc_msgSend(v56, "assetSetIdentifier");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "eliminateAtomicSync:usingClientDomain:forAssetSetIdentifier:awaitingUnlocked:", v32, CFSTR("com.apple.UnifiedAssetFramework"), v46, 1);
              v26 = (id)objc_claimAutoreleasedReturnValue();

              +[UAFAutoAssetHistory persistAssetSetInfoConfiguring:isEliminating:reason:](UAFAutoAssetHistory, "persistAssetSetInfoConfiguring:isEliminating:reason:", v56, 1, CFSTR("eliminated"));
              +[UAFAutoAssetHistory persistAssetSetInfoLocked:atomicEntries:autoAssetSet:isEliminating:reason:](UAFAutoAssetHistory, "persistAssetSetInfoLocked:atomicEntries:autoAssetSet:isEliminating:reason:", 0, 0, v56, 1, CFSTR("eliminated"));
              UAFGetLogCategory((id *)&UAFLogContextMAConfig);
              v47 = objc_claimAutoreleasedReturnValue();
              v48 = v47;
              if (v26)
              {
                v10 = 0;
                if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v56, "assetSetIdentifier");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136315650;
                  v76 = "+[UAFAutoAssetManager setLatestAtomicInstance:autoAssetSet:]";
                  v77 = 2114;
                  v78 = v53;
                  v79 = 2114;
                  v80 = v26;
                  _os_log_error_impl(&dword_229282000, v48, OS_LOG_TYPE_ERROR, "%s Could not eliminate unneeded auto asset %{public}@ : %{public}@", buf, 0x20u);

                }
              }
              else
              {
                v10 = 0;
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v56, "assetSetIdentifier");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136315394;
                  v76 = "+[UAFAutoAssetManager setLatestAtomicInstance:autoAssetSet:]";
                  v77 = 2114;
                  v78 = v49;
                  _os_log_impl(&dword_229282000, v48, OS_LOG_TYPE_DEFAULT, "%s Eliminated unneeded auto asset %{public}@", buf, 0x16u);

                }
                objc_msgSend(v56, "assetSetIdentifier");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                +[UAFAssetSetObserver sendUAFNotificationForAssetSet:forRoot:](UAFAssetSetObserver, "sendUAFNotificationForAssetSet:forRoot:", v50, 0);

                v26 = 0;
                v32 = v28;
                v28 = 0;
              }
            }
          }

        }
        goto LABEL_38;
      }
    }
  }
  UAFGetLogCategory((id *)&UAFLogContextMAConfig);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "assetSetIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v76 = "+[UAFAutoAssetManager setLatestAtomicInstance:autoAssetSet:]";
    v77 = 2114;
    v78 = v44;
    v79 = 2114;
    v80 = v10;
    _os_log_error_impl(&dword_229282000, v27, OS_LOG_TYPE_ERROR, "%s Could not get status of auto asset set %{public}@: %{public}@", buf, 0x20u);

  }
  v26 = v10;
LABEL_38:

  return v26;
}

void __60__UAFAutoAssetManager_setLatestAtomicInstance_autoAssetSet___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  UAFGetLogCategory((id *)&UAFLogContextMAConfig);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "assetSetIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 56);
      v13 = 136316162;
      v14 = "+[UAFAutoAssetManager setLatestAtomicInstance:autoAssetSet:]_block_invoke";
      v15 = 2114;
      v16 = v7;
      v17 = 2114;
      v18 = v8;
      v19 = 2114;
      v20 = v9;
      v21 = 2114;
      v22 = v4;
      _os_log_error_impl(&dword_229282000, v6, OS_LOG_TYPE_ERROR, "%s Could not decrement locks for atomic instance %{public}@ in auto asset set %{public}@ with reason %{public}@: %{public}@", (uint8_t *)&v13, 0x34u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "assetSetIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 56);
    v12 = *(void **)(a1 + 64);
    v13 = 136316162;
    v14 = "+[UAFAutoAssetManager setLatestAtomicInstance:autoAssetSet:]_block_invoke";
    v15 = 2114;
    v16 = v10;
    v17 = 2114;
    v18 = v8;
    v19 = 2114;
    v20 = v11;
    v21 = 2048;
    v22 = v12;
    _os_log_impl(&dword_229282000, v6, OS_LOG_TYPE_DEFAULT, "%s Decrement locks for atomic instance %{public}@ in auto asset set %{public}@ with reason %{public}@ lockCount: %ld", (uint8_t *)&v13, 0x34u);
    goto LABEL_6;
  }

}

void __60__UAFAutoAssetManager_setLatestAtomicInstance_autoAssetSet___block_invoke_234(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  UAFGetLogCategory((id *)&UAFLogContextMAConfig);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "assetSetIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315906;
    v10 = "+[UAFAutoAssetManager setLatestAtomicInstance:autoAssetSet:]_block_invoke";
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_229282000, v7, OS_LOG_TYPE_DEFAULT, "%s %@ Lock reason: %@, locks: %@", (uint8_t *)&v9, 0x2Au);

  }
}

+ (void)logAtomicInstance:(id)a3 name:(id)a4 entries:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[UAFAutoAssetManager getConcurrentQueue](UAFAutoAssetManager, "getConcurrentQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__UAFAutoAssetManager_logAtomicInstance_name_entries___block_invoke;
  block[3] = &unk_24F1F7BA0;
  v15 = v9;
  v16 = v8;
  v17 = v7;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  dispatch_async(v10, block);

}

void __54__UAFAutoAssetManager_logAtomicInstance_name_entries___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  __CFString *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    v6 = &stru_24F1F9848;
    do
    {
      v7 = 0;
      v8 = v6;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v7), "summary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString stringByAppendingFormat:](v8, "stringByAppendingFormat:", CFSTR("%@\n"), v9);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v7;
        v8 = v6;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v25, 16);
    }
    while (v4);
  }
  else
  {
    v6 = &stru_24F1F9848;
  }

  UAFGetLogCategory((id *)&UAFLogContextLargeMessage);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 136315906;
    v18 = "+[UAFAutoAssetManager logAtomicInstance:name:entries:]_block_invoke";
    v19 = 2114;
    v20 = v11;
    v21 = 2114;
    v22 = v12;
    v23 = 2114;
    v24 = v6;
    _os_log_impl(&dword_229282000, v10, OS_LOG_TYPE_DEFAULT, "%s Asset set %{public}@ atomic instance %{public}@ contains:\n%{public}@", buf, 0x2Au);
  }

}

+ (void)lockLatestAssetSet:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  +[UAFAutoAssetManager getSerialQueue](UAFAutoAssetManager, "getSerialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __53__UAFAutoAssetManager_lockLatestAssetSet_completion___block_invoke;
  v10[3] = &unk_24F1F7560;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

void __53__UAFAutoAssetManager_lockLatestAssetSet_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  +[UAFAutoAssetManager lockLatestAssetSet:](UAFAutoAssetManager, "lockLatestAssetSet:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 40))
  {
    +[UAFAutoAssetManager getConcurrentQueue](UAFAutoAssetManager, "getConcurrentQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __53__UAFAutoAssetManager_lockLatestAssetSet_completion___block_invoke_2;
    v4[3] = &unk_24F1F7A40;
    v6 = *(id *)(a1 + 40);
    v5 = v2;
    dispatch_async(v3, v4);

  }
}

uint64_t __53__UAFAutoAssetManager_lockLatestAssetSet_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)lockLatestAssetSet:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v23;
  void *v24;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  _QWORD block[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[UAFAutoAssetManager getReason:operation:](UAFAutoAssetManager, "getReason:operation:", v3, CFSTR("locking latest version of"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setSupportingShortTermLocks:", 1);
  objc_msgSend(v3, "assetSetIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  +[UAFAutoAssetManager latestStatusForClients:error:](UAFAutoAssetManager, "latestStatusForClients:error:", v6, &v37);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v37;

  if (v7)
  {
    objc_msgSend(v7, "latestDownloadedAtomicInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v35 = 0;
  v36 = 0;
  objc_msgSend(v3, "lockAtomicSync:forAtomicInstance:withNeedPolicy:withTimeout:lockedAtomicEntries:error:", v4, 0, v5, 0, &v36, &v35);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v36;
  v11 = v35;
  UAFGetLogCategory((id *)&UAFLogContextMAConfig);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "assetSetIdentifier");
      v23 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v39 = "+[UAFAutoAssetManager lockLatestAssetSet:]";
      v40 = 2114;
      v41 = v23;
      v24 = (void *)v23;
      v42 = 2114;
      v43 = v11;
      _os_log_error_impl(&dword_229282000, v13, OS_LOG_TYPE_ERROR, "%s Failed to lock auto asset set %{public}@: %{public}@", buf, 0x20u);

    }
    +[UAFAutoAssetManager getConcurrentQueue](UAFAutoAssetManager, "getConcurrentQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__UAFAutoAssetManager_lockLatestAssetSet___block_invoke;
    block[3] = &unk_24F1F79C8;
    v34 = a1;
    v32 = v3;
    v33 = v10;
    dispatch_async(v14, block);

    v15 = v11;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "assetSetIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v39 = "+[UAFAutoAssetManager lockLatestAssetSet:]";
      v40 = 2114;
      v41 = (uint64_t)v16;
      v42 = 2114;
      v43 = v9;
      _os_log_impl(&dword_229282000, v13, OS_LOG_TYPE_DEFAULT, "%s Locked auto asset set %{public}@ with atomic instance %{public}@", buf, 0x20u);

    }
    if (v9 && !v8 || v9 && v8 && (objc_msgSend(v9, "isEqualToString:", v8) & 1) == 0)
    {
      objc_msgSend(v3, "assetSetIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[UAFAssetSetObserver sendUAFNotificationForAssetSet:forRoot:](UAFAssetSetObserver, "sendUAFNotificationForAssetSet:forRoot:", v17, 0);

      +[UAFAutoAssetManager getConcurrentQueue](UAFAutoAssetManager, "getConcurrentQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __42__UAFAutoAssetManager_lockLatestAssetSet___block_invoke_247;
      v27[3] = &unk_24F1F79C8;
      v30 = a1;
      v19 = v3;
      v28 = v19;
      v20 = v10;
      v29 = v20;
      dispatch_async(v18, v27);

      +[UAFAutoAssetHistory persistAssetSetInfoLocked:atomicEntries:autoAssetSet:isEliminating:reason:](UAFAutoAssetHistory, "persistAssetSetInfoLocked:atomicEntries:autoAssetSet:isEliminating:reason:", v9, v20, v19, 0, CFSTR("locked"));
    }
    objc_msgSend(v3, "assetSetIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[UAFAutoAssetManager logAtomicInstance:name:entries:](UAFAutoAssetManager, "logAtomicInstance:name:entries:", v9, v21, v10);

    +[UAFAutoAssetManager setLatestAtomicInstance:autoAssetSet:](UAFAutoAssetManager, "setLatestAtomicInstance:autoAssetSet:", v9, v3);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

uint64_t __42__UAFAutoAssetManager_lockLatestAssetSet___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 48), "_logDailyStatusEventForAssetSetArrived:entries:assetSetArrived:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
}

uint64_t __42__UAFAutoAssetManager_lockLatestAssetSet___block_invoke_247(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 48), "_logDailyStatusEventForAssetSetArrived:entries:assetSetArrived:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);
}

+ (BOOL)sendNotificationForAssetSet:(id)a3
{
  id v3;
  uint32_t v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE66BE8], "notifyRegistrationName:forAssetSetIdentifier:", CFSTR("ATOMIC_INSTANCE_DOWNLOADED"), a3);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = notify_post((const char *)objc_msgSend(v3, "UTF8String"));
  if (v4)
  {
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315650;
      v8 = "+[UAFAutoAssetManager sendNotificationForAssetSet:]";
      v9 = 2112;
      v10 = v3;
      v11 = 2048;
      v12 = v4;
      _os_log_error_impl(&dword_229282000, v5, OS_LOG_TYPE_ERROR, "%s notify_post to %@ failed: %lu", (uint8_t *)&v7, 0x20u);
    }

  }
  return v4 == 0;
}

+ (int)listenForUpdates:(id)a3 updateHandler:(id)a4
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  NSObject *v15;
  id v16;
  uint32_t v17;
  NSObject *v18;
  __int128 v20;
  _QWORD handler[4];
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  int out_token;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = -1;
  out_token = -1;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = objc_msgSend(&unk_24F202F98, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v25;
    *(_QWORD *)&v9 = 136315650;
    v20 = v9;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v11)
        objc_enumerationMutation(&unk_24F202F98);
      objc_msgSend(MEMORY[0x24BE66BE8], "notifyRegistrationName:forAssetSetIdentifier:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v12), v5, v20);
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = (const char *)objc_msgSend(v13, "UTF8String");
      +[UAFAutoAssetManager getConcurrentQueue](UAFAutoAssetManager, "getConcurrentQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __54__UAFAutoAssetManager_listenForUpdates_updateHandler___block_invoke;
      handler[3] = &unk_24F1F7AB8;
      v16 = v13;
      v22 = v16;
      v23 = v6;
      v17 = notify_register_dispatch(v14, &out_token, v15, handler);

      if (v17)
      {
        UAFGetLogCategory((id *)&UAFLogContextMAConfig);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v20;
          v30 = "+[UAFAutoAssetManager listenForUpdates:updateHandler:]";
          v31 = 2112;
          v32 = v16;
          v33 = 2048;
          v34 = v17;
          _os_log_error_impl(&dword_229282000, v18, OS_LOG_TYPE_ERROR, "%s notify_register_dispatch for %@ failed: %lu", buf, 0x20u);
        }

        v7 = out_token;
      }

      if (v17)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(&unk_24F202F98, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
        if (v10)
          goto LABEL_3;
        v7 = out_token;
        break;
      }
    }
  }

  return v7;
}

uint64_t __54__UAFAutoAssetManager_listenForUpdates_updateHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  UAFGetLogCategory((id *)&UAFLogContextMAConfig);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "+[UAFAutoAssetManager listenForUpdates:updateHandler:]_block_invoke";
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_229282000, v2, OS_LOG_TYPE_DEFAULT, "%s Received notification for %{public}@", (uint8_t *)&v5, 0x16u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (void)observeAssetSet:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  NSObject *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = objc_claimAutoreleasedReturnValue();
  +[UAFAutoAssetManager observeAssetSetExperimentalNamespace:](UAFAutoAssetManager, "observeAssetSetExperimentalNamespace:", v3);

  if (qword_2540B1E18 != -1)
    dispatch_once(&qword_2540B1E18, &__block_literal_global_256);
  objc_msgSend((id)qword_2540B1E20, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "+[UAFAutoAssetManager observeAssetSet:]";
      v15 = 2114;
      v16 = v4;
      _os_log_impl(&dword_229282000, v6, OS_LOG_TYPE_DEFAULT, "%s Already watching for updates to auto asset set %{public}@ to perform auto asset lock maintenance", buf, 0x16u);
    }
  }
  else
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __39__UAFAutoAssetManager_observeAssetSet___block_invoke_258;
    v11[3] = &unk_24F1F6F88;
    v7 = v4;
    v12 = v7;
    v8 = +[UAFAutoAssetManager listenForUpdates:updateHandler:](UAFAutoAssetManager, "listenForUpdates:updateHandler:", v7, v11);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_2540B1E20, "setObject:forKeyedSubscript:", v9, v7);

    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "+[UAFAutoAssetManager observeAssetSet:]";
      v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_229282000, v10, OS_LOG_TYPE_DEFAULT, "%s Watching for updates to auto asset set %{public}@ to perform auto asset lock maintenance", buf, 0x16u);
    }

    v6 = v12;
  }

}

void __39__UAFAutoAssetManager_observeAssetSet___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_2540B1E20;
  qword_2540B1E20 = v0;

}

void __39__UAFAutoAssetManager_observeAssetSet___block_invoke_258(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BE66BD8]);
  v3 = *(_QWORD *)(a1 + 32);
  +[UAFAutoAssetManager getConcurrentQueue](UAFAutoAssetManager, "getConcurrentQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = (void *)objc_msgSend(v2, "initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:completingFromQueue:error:", CFSTR("com.apple.UnifiedAssetFramework"), CFSTR("manager"), v3, 0, v4, &v9);
  v6 = v9;

  if (v6)
  {
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v11 = "+[UAFAutoAssetManager observeAssetSet:]_block_invoke";
      v12 = 2114;
      v13 = v8;
      v14 = 2114;
      v15 = v6;
      _os_log_error_impl(&dword_229282000, v7, OS_LOG_TYPE_ERROR, "%s Could not initialize auto asset set %{public}@ for updating: %{public}@", buf, 0x20u);
    }

  }
  else if (v5)
  {
    +[UAFAutoAssetManager lockLatestAssetSet:completion:](UAFAutoAssetManager, "lockLatestAssetSet:completion:", v5, 0);
  }

}

+ (void)observeAllAssetSets
{
  NSObject *v2;

  +[UAFAutoAssetManager getSerialQueue](UAFAutoAssetManager, "getSerialQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_260);

}

void __42__UAFAutoAssetManager_observeAllAssetSets__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
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
  +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "getAllAssetSets");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = v1;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
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
          objc_enumerationMutation(v2);
        +[UAFAutoAssetManager observeAssetSet:](UAFAutoAssetManager, "observeAssetSet:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

+ (void)observeAssetSetExperimentalNamespace:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  NSObject *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "experimentalAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "trialNamespace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v6)
  {
    if (qword_2540B1E28 != -1)
      dispatch_once(&qword_2540B1E28, &__block_literal_global_262);
    objc_msgSend((id)qword_2540B1E30, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      UAFGetLogCategory((id *)&UAFLogContextMAConfig);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "+[UAFAutoAssetManager observeAssetSetExperimentalNamespace:]";
        v25 = 2114;
        v26 = v4;
        _os_log_impl(&dword_229282000, v8, OS_LOG_TYPE_DEFAULT, "%s Already watching for updates to experimental assets for asset set %{public}@", buf, 0x16u);
      }
    }
    else
    {
      v17 = MEMORY[0x24BDAC760];
      v18 = 3221225472;
      v19 = __60__UAFAutoAssetManager_observeAssetSetExperimentalNamespace___block_invoke_263;
      v20 = &unk_24F1F88A8;
      v9 = v4;
      v21 = v9;
      v10 = v6;
      v22 = v10;
      v11 = (void *)MEMORY[0x22E2C6D60](&v17);
      v12 = (void *)MEMORY[0x24BEBA938];
      +[UAFAutoAssetManager getConcurrentQueue](UAFAutoAssetManager, "getConcurrentQueue", v17, v18, v19, v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "registerUpdateForNamespaceName:queue:usingBlock:", v10, v13, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend((id)qword_2540B1E30, "setObject:forKeyedSubscript:", v14, v9);
      }
      else
      {
        UAFGetLogCategory((id *)&UAFLogContextClient);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315650;
          v24 = "+[UAFAutoAssetManager observeAssetSetExperimentalNamespace:]";
          v25 = 2114;
          v26 = v9;
          v27 = 2114;
          v28 = v10;
          _os_log_fault_impl(&dword_229282000, v15, OS_LOG_TYPE_FAULT, "%s Error registering update handler from %{public}@ for namespace %{public}@", buf, 0x20u);
        }

        UAFGetLogCategory((id *)&UAFLogContextClient);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        UAFFaultCapture((uint64_t)v16, (uint64_t)kUAFABCNotifyRegisterFailure, (uint64_t)CFSTR("trial"), 0);

      }
      v8 = v21;
    }

  }
}

void __60__UAFAutoAssetManager_observeAssetSetExperimentalNamespace___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_2540B1E30;
  qword_2540B1E30 = v0;

}

void __60__UAFAutoAssetManager_observeAssetSetExperimentalNamespace___block_invoke_263(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  UAFGetLogCategory((id *)&UAFLogContextMAConfig);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v7 = 136315650;
    v8 = "+[UAFAutoAssetManager observeAssetSetExperimentalNamespace:]_block_invoke";
    v9 = 2114;
    v10 = v3;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_229282000, v2, OS_LOG_TYPE_DEFAULT, "%s Update notification from %{public}@ for namespace %{public}@", (uint8_t *)&v7, 0x20u);
  }

  +[UAFSubscriptionStoreManager writeManager](UAFSubscriptionStoreManager, "writeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAFAssetSetManager configureAssetDelivery:configurationManager:lockIfUnchanged:](UAFAssetSetManager, "configureAssetDelivery:configurationManager:lockIfUnchanged:", v5, v6, 0);

}

+ (id)latestAtomicInstanceFromMA:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[UAFAutoAssetManager getReason:operation:](UAFAutoAssetManager, "getReason:operation:", v5, CFSTR("checking"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "checkAtomicSync:forAtomicInstance:withTimeout:discoveredAtomicEntries:error:", v6, 0, 0, 0, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  UAFGetLogCategory((id *)&UAFLogContextMAConfig);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      objc_msgSend(v5, "assetSetIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136315650;
      v16 = "+[UAFAutoAssetManager latestAtomicInstanceFromMA:error:]";
      v17 = 2114;
      v18 = v10;
      v19 = 2114;
      v20 = v7;
      _os_log_impl(&dword_229282000, v8, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ is available and has atomic instance %{public}@", (uint8_t *)&v15, 0x20u);

    }
    v11 = v7;
  }
  else
  {
    if (v9)
    {
      objc_msgSend(v5, "assetSetIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *a4;
      v15 = 136315650;
      v16 = "+[UAFAutoAssetManager latestAtomicInstanceFromMA:error:]";
      v17 = 2114;
      v18 = v12;
      v19 = 2114;
      v20 = v13;
      _os_log_impl(&dword_229282000, v8, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ does not yet have assets: %{public}@", (uint8_t *)&v15, 0x20u);

    }
  }

  return v7;
}

+ (id)latestStatusForClients:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BD8]), "initLockerUsingClientDomain:forAssetSetIdentifier:error:", CFSTR("com.apple.UnifiedAssetFramework"), v5, a4);
  if (v6 && !*a4)
  {
    +[UAFAutoAssetManager getReason:operation:](UAFAutoAssetManager, "getReason:operation:", v6, CFSTR("file locking latest version of"));
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lockAtomicSync:forAtomicInstance:error:", v7, 0, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && !*a4)
    {
      objc_msgSend(v10, "latestDownloadedAtomicInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "endAtomicLockSync:ofAtomicInstance:", v7, v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      if (*a4)
      {
        UAFGetLogCategory((id *)&UAFLogContextClient);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "latestDownloadedAtomicInstance");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = *a4;
          v19 = 136315906;
          v20 = "+[UAFAutoAssetManager latestStatusForClients:error:]";
          v21 = 2114;
          v22 = v5;
          v23 = 2114;
          v24 = v16;
          v25 = 2114;
          v26 = v17;
          _os_log_impl(&dword_229282000, v15, OS_LOG_TYPE_DEFAULT, "%s Could not end lock of auto asset set %{public}@ atomic instance %{public}@ : %{public}@", (uint8_t *)&v19, 0x2Au);

        }
      }
      v9 = v11;
    }
    else
    {
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *a4;
        v19 = 136315650;
        v20 = "+[UAFAutoAssetManager latestStatusForClients:error:]";
        v21 = 2114;
        v22 = v5;
        v23 = 2114;
        v24 = v13;
        _os_log_impl(&dword_229282000, v12, OS_LOG_TYPE_DEFAULT, "%s Could not lock auto asset set %{public}@ : %{public}@", (uint8_t *)&v19, 0x20u);
      }

      v9 = 0;
    }

  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *a4;
      v19 = 136315650;
      v20 = "+[UAFAutoAssetManager latestStatusForClients:error:]";
      v21 = 2114;
      v22 = v5;
      v23 = 2114;
      v24 = v8;
      _os_log_impl(&dword_229282000, v7, OS_LOG_TYPE_DEFAULT, "%s Could not initialize auto asset set %{public}@ : %{public}@", (uint8_t *)&v19, 0x20u);
    }
    v9 = 0;
  }

  return v9;
}

+ (id)latestAtomicInstanceForClients:(id)a3 OSSupported:(BOOL *)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t j;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  BOOL *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id *v53;
  void *v54;
  id obj;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  const char *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  id v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  *a4 = 1;
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = a5;
  +[UAFAutoAssetManager latestStatusForClients:error:](UAFAutoAssetManager, "latestStatusForClients:error:", v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "metadataAsset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      objc_msgSend(v7, "assets");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
      if (v50)
      {
        v51 = *(_QWORD *)v67;
        v52 = v7;
        v54 = v9;
        v49 = v11;
        v47 = a4;
        do
        {
          for (i = 0; i != v50; ++i)
          {
            if (*(_QWORD *)v67 != v51)
              objc_enumerationMutation(v11);
            v13 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
            objc_msgSend(v7, "metadataAsset");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "name");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v14, "isEqualToString:", v15);

            if (v16)
            {
              v48 = i;
              v64 = 0u;
              v65 = 0u;
              v62 = 0u;
              v63 = 0u;
              objc_msgSend(v13, "expansions");
              obj = (id)objc_claimAutoreleasedReturnValue();
              v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v81, 16);
              if (!v57)
                goto LABEL_30;
              v56 = *(_QWORD *)v63;
              while (1)
              {
                for (j = 0; j != v57; ++j)
                {
                  if (*(_QWORD *)v63 != v56)
                    objc_enumerationMutation(obj);
                  objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * j), "getAutoAssetSpecifier:", 0);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v18)
                    goto LABEL_28;
                  v60 = 0u;
                  v61 = 0u;
                  v58 = 0u;
                  v59 = 0u;
                  objc_msgSend(v9, "latestDowloadedAtomicInstanceEntries");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v80, 16);
                  if (!v20)
                    goto LABEL_23;
                  v21 = v20;
                  v22 = *(_QWORD *)v59;
                  while (2)
                  {
                    for (k = 0; k != v21; ++k)
                    {
                      if (*(_QWORD *)v59 != v22)
                        objc_enumerationMutation(v19);
                      v24 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * k);
                      objc_msgSend(v24, "fullAssetSelector");
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v25, "assetSpecifier");
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      v27 = objc_msgSend(v18, "isEqualToString:", v26);

                      if (v27)
                      {
                        objc_msgSend(v24, "localContentURL");
                        v28 = objc_claimAutoreleasedReturnValue();
                        if (!v28)
                          goto LABEL_36;
                        v29 = (void *)v28;
                        objc_msgSend(v24, "localContentURL");
                        v30 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v30, "scheme");
                        v31 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v31)
                        {
LABEL_36:
                          UAFGetLogCategory((id *)&UAFLogContextMAConfig);
                          v38 = objc_claimAutoreleasedReturnValue();
                          v9 = v54;
                          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                          {
                            objc_msgSend(v52, "metadataAsset");
                            v41 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v52, "name");
                            v42 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v24, "localContentURL");
                            v43 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 136315906;
                            v71 = "+[UAFAutoAssetManager latestAtomicInstanceForClients:OSSupported:error:]";
                            v72 = 2114;
                            v73 = v41;
                            v74 = 2114;
                            v75 = v42;
                            v76 = 2112;
                            v77 = v43;
                            _os_log_error_impl(&dword_229282000, v38, OS_LOG_TYPE_ERROR, "%s Failed to get a valid URL for metadata asset %{public}@ in asset set %{public}@ at location %@", buf, 0x2Au);

                          }
                          objc_msgSend(v54, "latestDownloadedAtomicInstance");
                          v37 = (void *)objc_claimAutoreleasedReturnValue();
                        }
                        else
                        {
                          v32 = (void *)MEMORY[0x24BDBCF48];
                          objc_msgSend(v24, "localContentURL");
                          v33 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v33, "absoluteString");
                          v34 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v32, "fileURLWithPath:isDirectory:", v34, 1);
                          v35 = (void *)objc_claimAutoreleasedReturnValue();

                          +[UAFAssetSetMetadata fromAssetDir:error:](UAFAssetSetMetadata, "fromAssetDir:error:", v35, v53);
                          v36 = (void *)objc_claimAutoreleasedReturnValue();
                          v9 = v54;
                          if (!*v53)
                          {

                            if (!v36)
                              goto LABEL_28;

                            *v47 = objc_msgSend(v36, "OSSupported");
                            objc_msgSend(v54, "latestDownloadedAtomicInstance");
                            v37 = (void *)objc_claimAutoreleasedReturnValue();

                            goto LABEL_44;
                          }
                          UAFGetLogCategory((id *)&UAFLogContextMAConfig);
                          v39 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                          {
                            objc_msgSend(v52, "metadataAsset");
                            v44 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v52, "name");
                            v45 = (void *)objc_claimAutoreleasedReturnValue();
                            v46 = *v53;
                            *(_DWORD *)buf = 136316162;
                            v71 = "+[UAFAutoAssetManager latestAtomicInstanceForClients:OSSupported:error:]";
                            v72 = 2114;
                            v73 = v44;
                            v74 = 2114;
                            v75 = v45;
                            v76 = 2112;
                            v77 = v35;
                            v78 = 2114;
                            v79 = v46;
                            _os_log_error_impl(&dword_229282000, v39, OS_LOG_TYPE_ERROR, "%s Failed to load asset set metadata from asset %{public}@ in asset set %{public}@ at location %@: %{public}@", buf, 0x34u);

                          }
                          objc_msgSend(v54, "latestDownloadedAtomicInstance");
                          v37 = (void *)objc_claimAutoreleasedReturnValue();

                          v19 = v36;
                        }

LABEL_44:
                        v7 = v52;
                        goto LABEL_45;
                      }
                    }
                    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v80, 16);
                    if (v21)
                      continue;
                    break;
                  }
LABEL_23:

                  v9 = v54;
LABEL_28:

                }
                v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v81, 16);
                if (!v57)
                {
LABEL_30:

                  i = v48;
                  v11 = v49;
                  break;
                }
              }
            }
            v7 = v52;
          }
          v50 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
        }
        while (v50);
      }

    }
    objc_msgSend(v9, "latestDownloadedAtomicInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v37 = 0;
  }
LABEL_45:

  return v37;
}

+ (BOOL)shouldCheckAssetSet:(id)a3 autoAssetSet:(id)a4 changed:(BOOL)a5 locked:(BOOL *)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  char v30;
  NSObject *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  char v38;
  id v39;
  id v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v7 = a5;
  v49 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  *a6 = 0;
  if (v7)
  {
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "assetSetIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v42 = "+[UAFAutoAssetManager shouldCheckAssetSet:autoAssetSet:changed:locked:]";
      v43 = 2114;
      v44 = v12;
      _os_log_impl(&dword_229282000, v11, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ has had its configuration changed", buf, 0x16u);

    }
  }
  v40 = 0;
  +[UAFAutoAssetManager latestAtomicInstanceFromMA:error:](UAFAutoAssetManager, "latestAtomicInstanceFromMA:error:", v10, &v40);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v40;
  v15 = v14;
  if (!v13)
  {
    v39 = v14;
    objc_msgSend(v10, "currentSetStatusSync:", &v39);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v39;

    if (!v19 || v18)
    {
      UAFGetLogCategory((id *)&UAFLogContextMAConfig);
      v24 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        goto LABEL_28;
      objc_msgSend(v10, "assetSetIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v42 = "+[UAFAutoAssetManager shouldCheckAssetSet:autoAssetSet:changed:locked:]";
      v43 = 2114;
      v44 = v25;
      v45 = 2114;
      v46 = v18;
      _os_log_error_impl(&dword_229282000, v24, OS_LOG_TYPE_ERROR, "%s Could not get status of auto asset set %{public}@ : %{public}@", buf, 0x20u);
    }
    else
    {
      objc_msgSend(v19, "newerAtomicInstanceDiscovered");
      v20 = objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = (void *)v20;
        objc_msgSend(v19, "newerDiscoveredAtomicEntries");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");

        if (!v23)
        {
          UAFGetLogCategory((id *)&UAFLogContextMAConfig);
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v10, "assetSetIdentifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "newerAtomicInstanceDiscovered");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "catalogCachedAssetSetID");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            v42 = "+[UAFAutoAssetManager shouldCheckAssetSet:autoAssetSet:changed:locked:]";
            v43 = 2114;
            v44 = v34;
            v45 = 2114;
            v46 = v35;
            v47 = 2114;
            v48 = v36;
            _os_log_impl(&dword_229282000, v24, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ is desired but newest published atomic instance %{public}@ from catalog %{public}@ contains no assets", buf, 0x2Au);

          }
          goto LABEL_29;
        }
      }
      UAFGetLogCategory((id *)&UAFLogContextMAConfig);
      v24 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
LABEL_28:
        LOBYTE(v7) = 1;
LABEL_29:

        goto LABEL_30;
      }
      objc_msgSend(v10, "assetSetIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v42 = "+[UAFAutoAssetManager shouldCheckAssetSet:autoAssetSet:changed:locked:]";
      v43 = 2114;
      v44 = v25;
      _os_log_impl(&dword_229282000, v24, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ is desired but no atomic instance is available", buf, 0x16u);
    }

    goto LABEL_28;
  }
  v38 = 0;
  v37 = v14;
  +[UAFAutoAssetManager latestAtomicInstanceForClients:OSSupported:error:](UAFAutoAssetManager, "latestAtomicInstanceForClients:OSSupported:error:", v9, &v38, &v37);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v37;

  if ((objc_msgSend(v13, "isEqualToString:", v16) & 1) != 0)
  {
    v18 = v17;
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "name");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v42 = "+[UAFAutoAssetManager shouldCheckAssetSet:autoAssetSet:changed:locked:]";
      v43 = 2114;
      v44 = v27;
      v45 = 2114;
      v46 = v13;
      _os_log_impl(&dword_229282000, v26, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ has atomic instance %{public}@, but is not available to clients, locking latest instance", buf, 0x20u);

    }
    +[UAFAutoAssetManager lockLatestAssetSet:](UAFAutoAssetManager, "lockLatestAssetSet:", v10);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "name");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v42 = "+[UAFAutoAssetManager shouldCheckAssetSet:autoAssetSet:changed:locked:]";
      v43 = 2114;
      v44 = v29;
      v45 = 2114;
      v46 = v18;
      _os_log_impl(&dword_229282000, v28, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ locking complete with error: %{public}@", buf, 0x20u);

    }
    v30 = 1;
    if (v18)
      goto LABEL_26;
    *a6 = 1;
  }
  v30 = 1;
  if (v38 && !v7)
  {
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "name");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v42 = "+[UAFAutoAssetManager shouldCheckAssetSet:autoAssetSet:changed:locked:]";
      v43 = 2114;
      v44 = v32;
      v45 = 2114;
      v46 = v13;
      _os_log_impl(&dword_229282000, v31, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ is configured, has atomic instance %{public}@, and is available to clients, no further management needed", buf, 0x20u);

    }
    v30 = 0;
  }
LABEL_26:

  LOBYTE(v7) = v30;
LABEL_30:

  return v7;
}

+ (id)manageAssetSet:(id)a3 specifiers:(id)a4 lockIfUnchanged:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  _QWORD v27[4];
  id v28;
  id v29;
  char v30;
  unsigned __int8 v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v5 = a5;
  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v31 = 0;
  +[UAFAutoAssetManager configureAssetSet:specifiers:changed:](UAFAutoAssetManager, "configureAssetSet:specifiers:changed:", v8, a4, &v31);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v33 = "+[UAFAutoAssetManager manageAssetSet:specifiers:lockIfUnchanged:]";
      v34 = 2114;
      v35 = v11;
      _os_log_impl(&dword_229282000, v10, OS_LOG_TYPE_DEFAULT, "%s Managing auto asset set %{public}@", buf, 0x16u);

    }
    +[UAFAutoAssetManager observeAssetSet:](UAFAutoAssetManager, "observeAssetSet:", v8);
    v30 = 0;
    if (+[UAFAutoAssetManager shouldCheckAssetSet:autoAssetSet:changed:locked:](UAFAutoAssetManager, "shouldCheckAssetSet:autoAssetSet:changed:locked:", v8, v9, v31, &v30))
    {
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __65__UAFAutoAssetManager_manageAssetSet_specifiers_lockIfUnchanged___block_invoke;
      v27[3] = &unk_24F1F88D0;
      v12 = v9;
      v28 = v12;
      v29 = a1;
      v13 = (void *)MEMORY[0x22E2C6D60](v27);
      UAFGetLogCategory((id *)&UAFLogContextMAConfig);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v8, "enableCellular");
        *(_DWORD *)buf = 136315650;
        v33 = "+[UAFAutoAssetManager manageAssetSet:specifiers:lockIfUnchanged:]";
        v34 = 2114;
        v35 = v15;
        v36 = 1024;
        LODWORD(v37) = v16;
        _os_log_impl(&dword_229282000, v14, OS_LOG_TYPE_DEFAULT, "%s Checking auto asset set %{public}@ with cellular: %d", buf, 0x1Cu);

      }
      v17 = (void *)objc_opt_new();
      objc_msgSend(v17, "setUserInitiated:", 1);
      objc_msgSend(v17, "setAllowCheckDownloadOnBattery:", 1);
      objc_msgSend(v17, "setAllowCheckDownloadOverCellular:", objc_msgSend(v8, "enableCellular"));
      +[UAFAutoAssetManager getReason:operation:](UAFAutoAssetManager, "getReason:operation:", v12, CFSTR("checking"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "checkAtomic:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:completion:", v18, 0, 1, v17, -2, v13);

      v19 = v12;
    }
    else
    {
      if (v5 && !v30)
      {
        UAFGetLogCategory((id *)&UAFLogContextMAConfig);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v33 = "+[UAFAutoAssetManager manageAssetSet:specifiers:lockIfUnchanged:]";
          v34 = 2114;
          v35 = v21;
          _os_log_impl(&dword_229282000, v20, OS_LOG_TYPE_DEFAULT, "%s Locking latest instance of auto asset set %{public}@ although it is unchanged", buf, 0x16u);

        }
        +[UAFAutoAssetManager lockLatestAssetSet:](UAFAutoAssetManager, "lockLatestAssetSet:", v9);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        UAFGetLogCategory((id *)&UAFLogContextMAConfig);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "name");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v33 = "+[UAFAutoAssetManager manageAssetSet:specifiers:lockIfUnchanged:]";
          v34 = 2114;
          v35 = v24;
          v36 = 2114;
          v37 = v22;
          _os_log_impl(&dword_229282000, v23, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ locking complete with error: %{public}@", buf, 0x20u);

        }
      }
      v25 = v9;
    }
  }

  return v9;
}

void __65__UAFAutoAssetManager_manageAssetSet_specifiers_lockIfUnchanged___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD block[4];
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  UAFGetLogCategory((id *)&UAFLogContextMAConfig);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "assetSetIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v22 = "+[UAFAutoAssetManager manageAssetSet:specifiers:lockIfUnchanged:]_block_invoke_2";
      v23 = 2114;
      v24 = v15;
      _os_log_impl(&dword_229282000, v11, OS_LOG_TYPE_DEFAULT, "%s Checked auto asset set %{public}@", buf, 0x16u);

    }
    goto LABEL_9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "assetSetIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v22 = "+[UAFAutoAssetManager manageAssetSet:specifiers:lockIfUnchanged:]_block_invoke";
    v23 = 2114;
    v24 = v16;
    v25 = 2114;
    v26 = v9;
    _os_log_error_impl(&dword_229282000, v11, OS_LOG_TYPE_ERROR, "%s Could not check auto asset set %{public}@: %{public}@", buf, 0x20u);

  }
  objc_msgSend(v9, "domain");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject isEqualToString:](v11, "isEqualToString:", CFSTR("com.apple.MobileAssetError.AutoAsset")))
  {
LABEL_9:

    goto LABEL_10;
  }
  v12 = objc_msgSend(v9, "code");

  if (v12 != 6205)
  {
    +[UAFAutoAssetManager getConcurrentQueue](UAFAutoAssetManager, "getConcurrentQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__UAFAutoAssetManager_manageAssetSet_specifiers_lockIfUnchanged___block_invoke_272;
    block[3] = &unk_24F1F79C8;
    v14 = *(void **)(a1 + 32);
    v20 = *(_QWORD *)(a1 + 40);
    v18 = v14;
    v19 = v8;
    dispatch_async(v13, block);

    v11 = v18;
    goto LABEL_9;
  }
LABEL_10:

}

uint64_t __65__UAFAutoAssetManager_manageAssetSet_specifiers_lockIfUnchanged___block_invoke_272(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 48), "_logDailyStatusEventForAssetSetArrived:entries:assetSetArrived:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
}

+ (id)targetForAssetSet:(id)a3 specifiers:(id)a4 version:(id)a5 autoAssetSet:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  NSObject *v33;
  void *v34;
  id v35;
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  NSObject *v40;
  __int16 v41;
  NSObject *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  +[UAFAutoAssetManager getAutoSetEntries:specifiers:](UAFAutoAssetManager, "getAutoSetEntries:specifiers:", v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "name");
      v25 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v38 = "+[UAFAutoAssetManager targetForAssetSet:specifiers:version:autoAssetSet:]";
      v39 = 2114;
      v40 = v25;
      _os_log_impl(&dword_229282000, v24, OS_LOG_TYPE_DEFAULT, "%s AutoAssetSet %{public}@ not previously initialized.  Creating a new one for staging.", buf, 0x16u);

    }
    v26 = objc_alloc(MEMORY[0x24BE66BD8]);
    objc_msgSend(v9, "name");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[UAFAutoAssetManager getConcurrentQueue](UAFAutoAssetManager, "getConcurrentQueue");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v12 = (id)objc_msgSend(v26, "initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:completingFromQueue:error:", CFSTR("com.apple.UnifiedAssetFramework"), CFSTR("manager"), v27, v13, v28, &v36);
    v17 = v36;

    if (!v12 || v17)
    {
      UAFGetLogCategory((id *)&UAFLogContextMAConfig);
      v29 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      objc_msgSend(v12, "assetSetIdentifier");
      v31 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v38 = "+[UAFAutoAssetManager targetForAssetSet:specifiers:version:autoAssetSet:]";
      v39 = 2114;
      v40 = v31;
      v41 = 2114;
      v42 = v17;
      _os_log_error_impl(&dword_229282000, v29, OS_LOG_TYPE_ERROR, "%s Could not create auto asset set %{public}@ : %{public}@", buf, 0x20u);
    }
    else
    {
      v29 = objc_opt_new();
      -[NSObject setBlockCheckDownload:](v29, "setBlockCheckDownload:", 1);
      +[UAFAutoAssetManager getReason:operation:](UAFAutoAssetManager, "getReason:operation:", v12, CFSTR("will in another OS need"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "needForAtomicSync:withNeedPolicy:", v30, v29);
      v17 = objc_claimAutoreleasedReturnValue();

      if (!v17)
      {

        goto LABEL_2;
      }
      UAFGetLogCategory((id *)&UAFLogContextMAConfig);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "name");
        v33 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v38 = "+[UAFAutoAssetManager targetForAssetSet:specifiers:version:autoAssetSet:]";
        v39 = 2114;
        v40 = v33;
        v41 = 2114;
        v42 = v17;
        _os_log_error_impl(&dword_229282000, v31, OS_LOG_TYPE_ERROR, "%s Could not indicate lack of need in this OS for asset set %{public}@ : %{public}@", buf, 0x20u);

      }
    }

LABEL_13:
    v16 = 0;
    goto LABEL_14;
  }
LABEL_2:
  v14 = objc_alloc(MEMORY[0x24BE66BF8]);
  +[UAFPlatform maxVersionFromVersionString:](UAFPlatform, "maxVersionFromVersionString:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initForMinTargetOSVersion:toMaxTargetOSVersion:asEntriesWhenTargeting:", v11, v15, v13);

  UAFGetLogCategory((id *)&UAFLogContextMAConfig);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "name");
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "minTargetOSVersion");
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "maxTargetOSVersion");
    v35 = v11;
    v20 = v10;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "autoAssetType");
    v34 = v13;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "allObjects");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316418;
    v38 = "+[UAFAutoAssetManager targetForAssetSet:specifiers:version:autoAssetSet:]";
    v39 = 2114;
    v40 = v18;
    v41 = 2114;
    v42 = v19;
    v43 = 2114;
    v44 = v21;
    v45 = 2114;
    v46 = v22;
    v47 = 2114;
    v48 = v23;
    _os_log_impl(&dword_229282000, v17, OS_LOG_TYPE_DEFAULT, "%s Staging asset set %{public}@ for OS versions %{public}@ through %{public}@ with type %{public}@ and entries %{public}@", buf, 0x3Eu);

    v13 = v34;
    v10 = v20;
    v11 = v35;

  }
LABEL_14:

  return v16;
}

+ (void)stageAssetSet:(id)a3 targets:(id)a4 autoAssetSet:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v9)
  {
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "+[UAFAutoAssetManager stageAssetSet:targets:autoAssetSet:]";
      v20 = 2114;
      v21 = v7;
      _os_log_impl(&dword_229282000, v10, OS_LOG_TYPE_DEFAULT, "%s AutoAssetSet %{public}@ not provided, creating a new one for staging.", buf, 0x16u);
    }

    v11 = objc_alloc(MEMORY[0x24BE66BD8]);
    +[UAFAutoAssetManager getConcurrentQueue](UAFAutoAssetManager, "getConcurrentQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v9 = (id)objc_msgSend(v11, "initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:completingFromQueue:error:", CFSTR("com.apple.UnifiedAssetFramework"), CFSTR("manager"), v7, 0, v12, &v17);
    v13 = v17;

    if (!v9 || v13)
    {
      UAFGetLogCategory((id *)&UAFLogContextMAConfig);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v19 = "+[UAFAutoAssetManager stageAssetSet:targets:autoAssetSet:]";
        v20 = 2114;
        v21 = v7;
        v22 = 2114;
        v23 = v13;
        v16 = "%s Could not get auto asset set %{public}@ : %{public}@";
        goto LABEL_13;
      }
LABEL_10:

      goto LABEL_11;
    }
  }
  +[UAFAutoAssetManager getReason:operation:](UAFAutoAssetManager, "getReason:operation:", v9, CFSTR("will in another OS need"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetSetForStagingSync:asEntriesWhenTargeting:", v14, v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v19 = "+[UAFAutoAssetManager stageAssetSet:targets:autoAssetSet:]";
      v20 = 2114;
      v21 = v7;
      v22 = 2114;
      v23 = v13;
      v16 = "%s Could get not stage asset set %{public}@ for other OS versions: %{public}@";
LABEL_13:
      _os_log_error_impl(&dword_229282000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x20u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
LABEL_11:

}

+ (void)stageAssetsWithSubscriptions:(id)a3 knownAutoAssetSets:(id)a4 usedAutoAssetSets:(id)a5 autoAssetSets:(id)a6
{
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  const char *v56;
  void *v57;
  uint64_t v58;
  NSObject *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  void *v65;
  id obj;
  uint64_t v67;
  id v68;
  void *v69;
  uint64_t v70;
  void *v71;
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
  uint8_t v84[128];
  uint8_t buf[4];
  const char *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  uint64_t v90;
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v60 = a3;
  v68 = a4;
  v63 = a5;
  v64 = a6;
  +[UAFAssetSetManager sharedManager](UAFAssetSetManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "retrieveAssetSet:usages:", CFSTR("com.apple.siri.uaf.platform"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v86 = "+[UAFAutoAssetManager stageAssetsWithSubscriptions:knownAutoAssetSets:usedAutoAssetSets:autoAssetSets:]";
      _os_log_impl(&dword_229282000, v12, OS_LOG_TYPE_DEFAULT, "%s No platform assets available when attempting to staging assets", buf, 0xCu);
    }
    goto LABEL_54;
  }
  +[UAFPlatform configurationManagers:](UAFPlatform, "configurationManagers:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v47 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      goto LABEL_53;
    *(_DWORD *)buf = 136315138;
    v86 = "+[UAFAutoAssetManager stageAssetsWithSubscriptions:knownAutoAssetSets:usedAutoAssetSets:autoAssetSets:]";
    v56 = "%s No version -> configuration managers available when attempting to staging assets";
    goto LABEL_52;
  }
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v61 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
  if (!v61)
    goto LABEL_48;
  v65 = 0;
  v57 = v10;
  v58 = *(_QWORD *)v81;
  v13 = 0x24F1F6000uLL;
  v59 = v12;
  do
  {
    v14 = 0;
    do
    {
      if (*(_QWORD *)v81 != v58)
        objc_enumerationMutation(v12);
      v62 = v14;
      v70 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * v14);
      -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v57);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "applySubscriptions:", v60);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v15;
      objc_msgSend(v15, "getAllAssetSets");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = 0u;
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      obj = v17;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v76, v91, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v77;
        do
        {
          v21 = 0;
          v67 = v19;
          do
          {
            if (*(_QWORD *)v77 != v20)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v21);
            objc_msgSend(v22, "autoAssetType");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              objc_msgSend(v22, "name");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "addObject:", v24);

              objc_msgSend(v22, "name");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "getPrestage:", v25);
              v26 = objc_claimAutoreleasedReturnValue();

              if (v26)
              {
                -[NSObject mergeAssetSetUsages:](v26, "mergeAssetSetUsages:", v16);
                v27 = objc_claimAutoreleasedReturnValue();

                v16 = (void *)v27;
              }
              objc_msgSend(*(id *)(v13 + 1392), "getSpecifiers:assetSetUsages:", v22, v16);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v28, "count"))
              {
                v71 = v16;
                v29 = v20;
                objc_msgSend(v22, "name");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "addObject:", v30);

                v31 = v13;
                v32 = *(void **)(v13 + 1392);
                objc_msgSend(v22, "name");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "objectForKeyedSubscript:", v33);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "targetForAssetSet:specifiers:version:autoAssetSet:", v22, v28, v70, v34);
                v35 = objc_claimAutoreleasedReturnValue();

                if (v35)
                {
                  v36 = v65;
                  if (!v65)
                    v36 = (void *)objc_opt_new();
                  objc_msgSend(v22, "name");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "objectForKeyedSubscript:", v37);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v38)
                  {
                    v39 = (void *)objc_opt_new();
                    objc_msgSend(v22, "name");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v36, "setObject:forKeyedSubscript:", v39, v40);

                  }
                  objc_msgSend(v22, "name");
                  v41 = objc_claimAutoreleasedReturnValue();
                  v65 = v36;
                  objc_msgSend(v36, "objectForKeyedSubscript:", v41);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "addObject:", v35);

                  v13 = v31;
                }
                else
                {
                  UAFGetLogCategory((id *)&UAFLogContextMAConfig);
                  v41 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v22, "name");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 136315650;
                    v86 = "+[UAFAutoAssetManager stageAssetsWithSubscriptions:knownAutoAssetSets:usedAutoAssetSets:autoAssetSets:]";
                    v87 = 2114;
                    v88 = v45;
                    v89 = 2114;
                    v90 = v70;
                    _os_log_impl(&dword_229282000, v41, OS_LOG_TYPE_DEFAULT, "%s Failed to generate target for Asset set %{public}@ for OS version %{public}@", buf, 0x20u);

                  }
                  v13 = v31;
                }

                v20 = v29;
                v16 = v71;
LABEL_31:
                v19 = v67;
              }
              else
              {
                UAFGetLogCategory((id *)&UAFLogContextMAConfig);
                v35 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v22, "name");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136315650;
                  v86 = "+[UAFAutoAssetManager stageAssetsWithSubscriptions:knownAutoAssetSets:usedAutoAssetSets:autoAssetSets:]";
                  v87 = 2114;
                  v88 = v44;
                  v89 = 2114;
                  v90 = v70;
                  _os_log_impl(&dword_229282000, v35, OS_LOG_TYPE_DEFAULT, "%s Asset set %{public}@ should not have any entries for OS version %{public}@", buf, 0x20u);

                  goto LABEL_31;
                }
              }

              goto LABEL_33;
            }
            UAFGetLogCategory((id *)&UAFLogContextMAConfig);
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v22, "name");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v86 = "+[UAFAutoAssetManager stageAssetsWithSubscriptions:knownAutoAssetSets:usedAutoAssetSets:autoAssetSets:]";
              v87 = 2114;
              v88 = v43;
              v89 = 2114;
              v90 = v70;
              _os_log_impl(&dword_229282000, v26, OS_LOG_TYPE_DEFAULT, "%s No auto asset type defined for %{public}@ for OS version %{public}@", buf, 0x20u);

            }
LABEL_33:

            ++v21;
          }
          while (v19 != v21);
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v91, 16);
        }
        while (v19);
      }

      v14 = v62 + 1;
      v12 = v59;
    }
    while (v62 + 1 != v61);
    v61 = -[NSObject countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
  }
  while (v61);
  v10 = v57;
  if (!v65)
  {
LABEL_48:
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v47 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      goto LABEL_53;
    *(_DWORD *)buf = 136315138;
    v86 = "+[UAFAutoAssetManager stageAssetsWithSubscriptions:knownAutoAssetSets:usedAutoAssetSets:autoAssetSets:]";
    v56 = "%s No staging targets for other OS versions";
LABEL_52:
    _os_log_impl(&dword_229282000, v47, OS_LOG_TYPE_DEFAULT, v56, buf, 0xCu);
    goto LABEL_53;
  }
  v46 = v13;
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v47 = v65;
  v48 = -[NSObject countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v73 != v50)
          objc_enumerationMutation(v47);
        v52 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i);
        v53 = *(void **)(v46 + 1392);
        -[NSObject objectForKeyedSubscript:](v47, "objectForKeyedSubscript:", v52);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "objectForKeyedSubscript:", v52);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "stageAssetSet:targets:autoAssetSet:", v52, v54, v55);

      }
      v49 = -[NSObject countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
    }
    while (v49);
  }

  v10 = v57;
LABEL_53:

LABEL_54:
}

+ (id)forceRemoveAutoAssetSet:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BE66BD8]);
  +[UAFAutoAssetManager getConcurrentQueue](UAFAutoAssetManager, "getConcurrentQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v6 = (void *)objc_msgSend(v4, "initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:completingFromQueue:error:", CFSTR("com.apple.UnifiedAssetFramework"), CFSTR("manager"), v3, 0, v5, &v17);
  v7 = v17;

  if (v7)
  {
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v19 = "+[UAFAutoAssetManager forceRemoveAutoAssetSet:]";
      v20 = 2114;
      v21 = v3;
      v22 = 2114;
      v23 = v7;
      _os_log_error_impl(&dword_229282000, v8, OS_LOG_TYPE_ERROR, "%s Could not initialize auto asset set %{public}@ : %{public}@", buf, 0x20u);
    }

    v9 = v7;
  }
  else
  {
    +[UAFAutoAssetManager getReason:operation:](UAFAutoAssetManager, "getReason:operation:", v6, CFSTR("should eliminate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "assetSetIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v19 = "+[UAFAutoAssetManager forceRemoveAutoAssetSet:]";
      v20 = 2114;
      v21 = v12;
      _os_log_impl(&dword_229282000, v11, OS_LOG_TYPE_DEFAULT, "%s Forcibly eliminating auto asset %{public}@ using awaitingUnlocked:NO", buf, 0x16u);

    }
    v13 = (void *)MEMORY[0x24BE66BD8];
    objc_msgSend(v6, "assetSetIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "eliminateAtomicSync:usingClientDomain:forAssetSetIdentifier:awaitingUnlocked:", v10, CFSTR("com.apple.UnifiedAssetFramework"), v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[UAFAssetSetObserver sendUAFNotificationForAssetSet:forRoot:](UAFAssetSetObserver, "sendUAFNotificationForAssetSet:forRoot:", v3, 0);
    v9 = v15;

  }
  return v9;
}

+ (void)removeAutoAssetSet:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __53__UAFAutoAssetManager_removeAutoAssetSet_completion___block_invoke;
  v22[3] = &unk_24F1F74E8;
  v7 = v6;
  v23 = v7;
  v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x22E2C6D60](v22);
  v9 = objc_alloc(MEMORY[0x24BE66BD8]);
  +[UAFAutoAssetManager getConcurrentQueue](UAFAutoAssetManager, "getConcurrentQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v11 = (void *)objc_msgSend(v9, "initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:completingFromQueue:error:", CFSTR("com.apple.UnifiedAssetFramework"), CFSTR("manager"), v5, 0, v10, &v21);
  v12 = v21;

  if (v12)
  {
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v25 = "+[UAFAutoAssetManager removeAutoAssetSet:completion:]";
      v26 = 2114;
      v27 = v5;
      v28 = 2114;
      v29 = v12;
      _os_log_error_impl(&dword_229282000, v13, OS_LOG_TYPE_ERROR, "%s Could not initialize auto asset set %{public}@ : %{public}@", buf, 0x20u);
    }

    ((void (**)(_QWORD, id))v8)[2](v8, v12);
  }
  else
  {
    v20 = 0;
    objc_msgSend(v11, "currentSetStatusSync:", &v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v20;
    v12 = v15;
    if (!v14 || v15)
    {
      UAFGetLogCategory((id *)&UAFLogContextMAConfig);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v25 = "+[UAFAutoAssetManager removeAutoAssetSet:completion:]";
        v26 = 2114;
        v27 = v5;
        v28 = 2114;
        v29 = v12;
        _os_log_debug_impl(&dword_229282000, v19, OS_LOG_TYPE_DEBUG, "%s Undesired auto asset set %{public}@ doesn't exist: %{public}@", buf, 0x20u);
      }

      if (v12 && objc_msgSend(v12, "code") == 6301)
        v8[2](v8, 0);
      else
        ((void (**)(_QWORD, id))v8)[2](v8, v12);
    }
    else
    {
      v16 = (void *)objc_opt_new();
      objc_msgSend(v16, "setBlockCheckDownload:", 1);
      +[UAFAutoAssetManager getReason:operation:](UAFAutoAssetManager, "getReason:operation:", v11, CFSTR("does not need"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "needForAtomicSync:withNeedPolicy:", v17, v16);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        UAFGetLogCategory((id *)&UAFLogContextMAConfig);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v25 = "+[UAFAutoAssetManager removeAutoAssetSet:completion:]";
          v26 = 2114;
          v27 = v5;
          v28 = 2114;
          v29 = v12;
          _os_log_error_impl(&dword_229282000, v18, OS_LOG_TYPE_ERROR, "%s Could not indicate lack of need for asset set %{public}@ : %{public}@", buf, 0x20u);
        }

      }
      else
      {
        +[UAFAutoAssetManager setLatestAtomicInstance:autoAssetSet:](UAFAutoAssetManager, "setLatestAtomicInstance:autoAssetSet:", 0, v11);
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      ((void (**)(_QWORD, id))v8)[2](v8, v12);

    }
  }

}

uint64_t __53__UAFAutoAssetManager_removeAutoAssetSet_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)removeUnusedAutoAssetSets:(id)a3 usedAutoAssetSets:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v6, "containsObject:", v11) & 1) == 0)
          +[UAFAutoAssetManager removeAutoAssetSet:completion:](UAFAutoAssetManager, "removeAutoAssetSet:completion:", v11, 0);
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

+ (void)configureAutoAssetsFromAssetSetUsages:(id)a3 subscriptions:(id)a4 configurationManager:(id)a5 lockIfUnchanged:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  BOOL v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  UAFGetLogCategory((id *)&UAFLogContextMAConfig);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "+[UAFAutoAssetManager configureAutoAssetsFromAssetSetUsages:subscriptions:configurationManager:lockIfUnchanged:]";
    _os_log_impl(&dword_229282000, v12, OS_LOG_TYPE_DEFAULT, "%s Configuring MobileAsset from asset set usages", buf, 0xCu);
  }

  if (!v11)
  {
    +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  +[UAFAutoAssetManager getSerialQueue](UAFAutoAssetManager, "getSerialQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __112__UAFAutoAssetManager_configureAutoAssetsFromAssetSetUsages_subscriptions_configurationManager_lockIfUnchanged___block_invoke;
  v17[3] = &unk_24F1F88F8;
  v18 = v11;
  v19 = v9;
  v21 = a6;
  v20 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v11;
  dispatch_sync(v13, v17);

}

void __112__UAFAutoAssetManager_configureAutoAssetsFromAssetSetUsages_subscriptions_configurationManager_lockIfUnchanged___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id obj;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  NSObject *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  v20 = (void *)objc_opt_new();
  v19 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "getAllAssetSets");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v28 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v7, "autoAssetType");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          objc_msgSend(v7, "name");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v9);

          +[UAFAutoAssetManager getSpecifiers:assetSetUsages:](UAFAutoAssetManager, "getSpecifiers:assetSetUsages:", v7, *(_QWORD *)(a1 + 40));
          v10 = objc_claimAutoreleasedReturnValue();
          if (-[NSObject count](v10, "count"))
          {
            objc_msgSend(v7, "name");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v11);

            +[UAFAutoAssetManager manageAssetSet:specifiers:lockIfUnchanged:](UAFAutoAssetManager, "manageAssetSet:specifiers:lockIfUnchanged:", v7, v10, *(unsigned __int8 *)(a1 + 56));
            v12 = objc_claimAutoreleasedReturnValue();
            if (v12 && -[NSObject count](v10, "count"))
            {
              objc_msgSend(v7, "name");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setObject:forKeyedSubscript:", v12, v13);

            }
            objc_msgSend(v7, "name");
            v14 = objc_claimAutoreleasedReturnValue();
            +[UAFAutoAssetInstance clear:path:](UAFAutoAssetInstance, "clear:path:", v14, 0);
            goto LABEL_16;
          }
          UAFGetLogCategory((id *)&UAFLogContextMAConfig);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v7, "name");
            v14 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v32 = "+[UAFAutoAssetManager configureAutoAssetsFromAssetSetUsages:subscriptions:configurationManager:lockIfU"
                  "nchanged:]_block_invoke";
            v33 = 2114;
            v34 = v14;
            _os_log_impl(&dword_229282000, v12, OS_LOG_TYPE_DEFAULT, "%s Asset set %{public}@ should not have any entries", buf, 0x16u);
LABEL_16:

          }
        }
        else
        {
          UAFGetLogCategory((id *)&UAFLogContextMAConfig);
          v10 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            goto LABEL_18;
          objc_msgSend(v7, "name");
          v12 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v32 = "+[UAFAutoAssetManager configureAutoAssetsFromAssetSetUsages:subscriptions:configurationManager:lockIfUnc"
                "hanged:]_block_invoke";
          v33 = 2114;
          v34 = v12;
          _os_log_impl(&dword_229282000, v10, OS_LOG_TYPE_DEFAULT, "%s No auto asset type defined for %{public}@", buf, 0x16u);
        }

LABEL_18:
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v4);
  }
  +[UAFAutoAssetManager getSerialQueue](UAFAutoAssetManager, "getSerialQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __112__UAFAutoAssetManager_configureAutoAssetsFromAssetSetUsages_subscriptions_configurationManager_lockIfUnchanged___block_invoke_279;
  block[3] = &unk_24F1F80F8;
  v23 = *(id *)(a1 + 48);
  v24 = v2;
  v25 = v20;
  v26 = v19;
  v16 = v19;
  v17 = v20;
  v18 = v2;
  dispatch_async(v15, block);

}

void __112__UAFAutoAssetManager_configureAutoAssetsFromAssetSetUsages_subscriptions_configurationManager_lockIfUnchanged___block_invoke_279(_QWORD *a1)
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  +[UAFAutoAssetManager stageAssetsWithSubscriptions:knownAutoAssetSets:usedAutoAssetSets:autoAssetSets:](UAFAutoAssetManager, "stageAssetsWithSubscriptions:knownAutoAssetSets:usedAutoAssetSets:autoAssetSets:", a1[4], a1[5], a1[6], a1[7]);
  +[UAFAutoAssetManager removeUnusedAutoAssetSets:usedAutoAssetSets:](UAFAutoAssetManager, "removeUnusedAutoAssetSets:usedAutoAssetSets:", a1[5], a1[6]);
  UAFGetLogCategory((id *)&UAFLogContextMAConfig);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "+[UAFAutoAssetManager configureAutoAssetsFromAssetSetUsages:subscriptions:configurationManager:lockIfUnchanged:]_block_invoke";
    _os_log_impl(&dword_229282000, v2, OS_LOG_TYPE_DEFAULT, "%s Finished configuring MobileAsset from asset set usages", (uint8_t *)&v3, 0xCu);
  }

}

+ (id)_createXPCConnection
{
  return (id)objc_opt_new();
}

+ (void)conditionallyLockLatestAssetSet:(id)a3 newestInstance:(id)a4 checkAtomicError:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;
  int v19;
  void *v20;
  int v21;
  uint64_t v22;
  id v23;
  void *v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  void (**v38)(_QWORD);
  id v39;
  id v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(_QWORD))a6;
  objc_msgSend(v9, "assetSetIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  +[UAFAutoAssetManager latestStatusForClients:error:](UAFAutoAssetManager, "latestStatusForClients:error:", v13, &v40);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v40;

  v33 = (void *)v14;
  if (v14)
  {
    objc_msgSend((id)v14, "latestDownloadedAtomicInstance");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v18 = v10 != 0;
    LODWORD(v14) = v16 != 0;
    if (v16)
      v19 = 1;
    else
      v19 = v10 == 0;
    if (v10 && v16)
    {
      v19 &= objc_msgSend(v10, "isEqualToString:", v16);
      v18 = 1;
      LODWORD(v14) = 1;
    }
  }
  else
  {
    v17 = 0;
    v19 = v10 == 0;
    v18 = v10 != 0;
  }
  v34 = v10;
  if (!v11)
  {
LABEL_17:
    v23 = v15;
    if ((v19 & 1) != 0)
      goto LABEL_18;
    goto LABEL_26;
  }
  objc_msgSend(v11, "domain");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.MobileAssetError.AutoAsset")) & 1) == 0)
  {

    goto LABEL_17;
  }
  v21 = v19 ^ 1;
  v32 = v11;
  v22 = objc_msgSend(v11, "code");

  if (v22 != 6205)
    goto LABEL_14;
  if (((v18 | v14 ^ 1) & 1) != 0)
  {
    v21 |= v14 ^ 1;
LABEL_14:
    v23 = v15;
    v11 = v32;
    if (v21)
      goto LABEL_26;
LABEL_18:
    v12[2](v12);
    goto LABEL_29;
  }
  v39 = v15;
  +[UAFAutoAssetManager latestAtomicInstanceFromMA:error:](UAFAutoAssetManager, "latestAtomicInstanceFromMA:error:", v9, &v39);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v39;

  if (v24 && (objc_msgSend(v17, "isEqualToString:", v24) & 1) == 0)
  {
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v42 = "+[UAFAutoAssetManager conditionallyLockLatestAssetSet:newestInstance:checkAtomicError:completion:]";
      v43 = 2114;
      v44 = v24;
      v45 = 2114;
      v46 = v17;
      _os_log_impl(&dword_229282000, v25, OS_LOG_TYPE_DEFAULT, "%s Newer instance discovered from MA than is available to clients: %{public}@, client instance: %{public}@", buf, 0x20u);
    }

    v11 = v32;
    goto LABEL_26;
  }

  v11 = v32;
  if ((v19 & 1) != 0)
    goto LABEL_18;
LABEL_26:
  v26 = v11;
  UAFGetLogCategory((id *)&UAFLogContextMAConfig);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "assetSetIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v42 = "+[UAFAutoAssetManager conditionallyLockLatestAssetSet:newestInstance:checkAtomicError:completion:]";
    v43 = 2114;
    v44 = v28;
    v45 = 2114;
    v46 = v34;
    v47 = 2114;
    v48 = v17;
    _os_log_impl(&dword_229282000, v27, OS_LOG_TYPE_DEFAULT, "%s Discovered newer instance of %{public}@: %{public}@ vs %{public}@, XPC'ing to siriknowledged to lock", buf, 0x2Au);

  }
  +[UAFAutoAssetManager _createXPCConnection](UAFAutoAssetManager, "_createXPCConnection");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetSetIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __98__UAFAutoAssetManager_conditionallyLockLatestAssetSet_newestInstance_checkAtomicError_completion___block_invoke;
  v35[3] = &unk_24F1F8920;
  v36 = v9;
  v37 = v29;
  v38 = v12;
  v31 = v29;
  objc_msgSend(v31, "lockLatestAtomicInstance:completion:", v30, v35);

  v11 = v26;
LABEL_29:

}

void __98__UAFAutoAssetManager_conditionallyLockLatestAssetSet_newestInstance_checkAtomicError_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "assetSetIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 136315650;
      v7 = "+[UAFAutoAssetManager conditionallyLockLatestAssetSet:newestInstance:checkAtomicError:completion:]_block_invoke";
      v8 = 2114;
      v9 = v5;
      v10 = 2114;
      v11 = v3;
      _os_log_impl(&dword_229282000, v4, OS_LOG_TYPE_DEFAULT, "%s Could not lock latest instance of %{public}@: %{public}@", (uint8_t *)&v6, 0x20u);

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (void)updateAutoAssetsFromAssetSetUsages:(id)a3 configurationManager:(id)a4 expensiveNetworking:(BOOL)a5 progress:(id)a6 requestId:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  UAFAutoAssetProgress *v18;
  uint64_t v19;
  id v20;
  UAFAutoAssetProgress *v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  UAFAutoAssetProgress *v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  UAFAutoAssetProgress *v34;
  id v35;
  id v36;
  BOOL v37;
  _QWORD v38[4];
  id v39;
  UAFAutoAssetProgress *v40;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  if (!v14)
  {
    +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = -[UAFAutoAssetProgress initWithAssetSetUsages:configurationManager:detailedProgressWithStatus:]([UAFAutoAssetProgress alloc], "initWithAssetSetUsages:configurationManager:detailedProgressWithStatus:", v13, v14, v15);
  v19 = MEMORY[0x24BDAC760];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __129__UAFAutoAssetManager_updateAutoAssetsFromAssetSetUsages_configurationManager_expensiveNetworking_progress_requestId_completion___block_invoke;
  v38[3] = &unk_24F1F8948;
  v20 = v16;
  v39 = v20;
  v21 = v18;
  v40 = v21;
  v22 = (void *)MEMORY[0x22E2C6D60](v38);
  +[UAFAutoAssetManager getConcurrentQueue](UAFAutoAssetManager, "getConcurrentQueue");
  v23 = objc_claimAutoreleasedReturnValue();
  v30[0] = v19;
  v30[1] = 3221225472;
  v30[2] = __129__UAFAutoAssetManager_updateAutoAssetsFromAssetSetUsages_configurationManager_expensiveNetworking_progress_requestId_completion___block_invoke_283;
  v30[3] = &unk_24F1F8998;
  v31 = v20;
  v32 = v13;
  v37 = a5;
  v33 = v14;
  v34 = v21;
  v35 = v22;
  v36 = v17;
  v24 = v17;
  v25 = v22;
  v26 = v21;
  v27 = v14;
  v28 = v13;
  v29 = v20;
  dispatch_async(v23, v30);

}

void __129__UAFAutoAssetManager_updateAutoAssetsFromAssetSetUsages_configurationManager_expensiveNetworking_progress_requestId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "assetSetIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315906;
      v11 = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworking:progress:r"
            "equestId:completion:]_block_invoke";
      v12 = 2114;
      v13 = v8;
      v14 = 2114;
      v15 = v9;
      v16 = 2114;
      v17 = v6;
      _os_log_error_impl(&dword_229282000, v7, OS_LOG_TYPE_ERROR, "%s %{public}@: Error while getting progress about %{public}@: %{public}@", (uint8_t *)&v10, 0x2Au);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "progress:", v5);
  }

}

void __129__UAFAutoAssetManager_updateAutoAssetsFromAssetSetUsages_configurationManager_expensiveNetworking_progress_requestId_completion___block_invoke_283(uint64_t a1)
{
  NSObject *v1;
  uint64_t i;
  void (*v3)(uint64_t, uint64_t);
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *group;
  id obj;
  uint64_t v32;
  uint64_t v33;
  _QWORD block[4];
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  NSObject *v44;
  NSObject *v45;
  id v46;
  _QWORD *v47;
  _BYTE *v48;
  _QWORD v49[3];
  int v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[4];
  const char *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  int v63;
  _BYTE buf[24];
  void (*v65)(uint64_t, uint64_t);
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  UAFGetLogCategory((id *)&UAFLogContextMAConfig);
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    v29 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworki"
                         "ng:progress:requestId:completion:]_block_invoke";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v29;
    _os_log_debug_impl(&dword_229282000, v1, OS_LOG_TYPE_DEBUG, "%s Starting new request: %{public}@", buf, 0x16u);
  }

  group = dispatch_group_create();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = *(id *)(a1 + 40);
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v67, 16);
  if (v33)
  {
    v32 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v53 != v32)
          objc_enumerationMutation(obj);
        v3 = *(void (**)(uint64_t, uint64_t))(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 48), "getAssetSet:", v3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        if (v4)
        {
          objc_msgSend(v4, "autoAssetType");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v6 == 0;

          if (!v7)
          {
            v8 = objc_alloc(MEMORY[0x24BE66BD8]);
            objc_msgSend(v5, "name");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            +[UAFAutoAssetManager getConcurrentQueue](UAFAutoAssetManager, "getConcurrentQueue");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = 0;
            v11 = (void *)objc_msgSend(v8, "initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:completingFromQueue:error:", CFSTR("com.apple.UnifiedAssetFramework"), CFSTR("manager"), v9, 0, v10, &v51);
            v12 = v51;

            if (v12)
            {
              UAFGetLogCategory((id *)&UAFLogContextMAConfig);
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              {
                v14 = *(_QWORD *)(a1 + 32);
                objc_msgSend(v5, "name");
                v15 = (void (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315906;
                *(_QWORD *)&buf[4] = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expen"
                                     "siveNetworking:progress:requestId:completion:]_block_invoke";
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v14;
                *(_WORD *)&buf[22] = 2114;
                v65 = v15;
                LOWORD(v66) = 2114;
                *(_QWORD *)((char *)&v66 + 2) = v12;
                _os_log_error_impl(&dword_229282000, v13, OS_LOG_TYPE_ERROR, "%s %{public}@: Could not initialize auto asset set %{public}@ for updating: %{public}@", buf, 0x2Au);

              }
              goto LABEL_23;
            }
            if (v11)
            {
              v18 = (void *)objc_opt_new();
              objc_msgSend(v18, "setUserInitiated:", 1);
              objc_msgSend(v18, "setAllowCheckDownloadOnBattery:", 1);
              objc_msgSend(v18, "setAllowCheckDownloadOverCellular:", objc_msgSend(v5, "enableCellular"));
              if (*(_BYTE *)(a1 + 80))
              {
                objc_msgSend(v18, "setAllowCheckDownloadOverExpensive:", 1);
                objc_msgSend(v18, "setAllowCheckDownloadOverCellular:", 1);
              }
              dispatch_group_enter(group);
              v49[0] = 0;
              v49[1] = v49;
              v49[2] = 0x2020000000;
              v50 = 0;
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x3042000000;
              v65 = __Block_byref_object_copy__7;
              *(_QWORD *)&v66 = __Block_byref_object_dispose__7;
              *((_QWORD *)&v66 + 1) = 0;
              v40[0] = MEMORY[0x24BDAC760];
              v40[1] = 3221225472;
              v40[2] = __129__UAFAutoAssetManager_updateAutoAssetsFromAssetSetUsages_configurationManager_expensiveNetworking_progress_requestId_completion___block_invoke_284;
              v40[3] = &unk_24F1F8970;
              v41 = *(id *)(a1 + 32);
              v19 = v11;
              v42 = v19;
              v47 = v49;
              v43 = *(id *)(a1 + 56);
              v44 = group;
              v48 = buf;
              v13 = v18;
              v45 = v13;
              v46 = *(id *)(a1 + 64);
              v20 = (void *)MEMORY[0x22E2C6D60](v40);
              objc_storeWeak((id *)(*(_QWORD *)&buf[8] + 40), v20);
              UAFGetLogCategory((id *)&UAFLogContextMAConfig);
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                v22 = *(_QWORD *)(a1 + 32);
                objc_msgSend(v19, "assetSetIdentifier");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = -[NSObject allowCheckDownloadOverCellular](v13, "allowCheckDownloadOverCellular");
                *(_DWORD *)v56 = 136315906;
                v57 = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworking:"
                      "progress:requestId:completion:]_block_invoke_2";
                v58 = 2114;
                v59 = v22;
                v60 = 2114;
                v61 = v23;
                v62 = 1024;
                v63 = v24;
                _os_log_impl(&dword_229282000, v21, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Checking %{public}@ with cellular: %d", v56, 0x26u);

              }
              v25 = *(void **)(a1 + 56);
              objc_msgSend(v19, "assetSetIdentifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "started:", v26);

              +[UAFAutoAssetManager getReason:operation:](UAFAutoAssetManager, "getReason:operation:", v19, CFSTR("checking"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "checkAtomic:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:reportingProgress:completion:", v27, 0, 1, v13, -2, *(_QWORD *)(a1 + 64), v20);

              _Block_object_dispose(buf, 8);
              objc_destroyWeak((id *)&v66 + 1);

              _Block_object_dispose(v49, 8);
LABEL_23:

            }
            goto LABEL_25;
          }
          UAFGetLogCategory((id *)&UAFLogContextMAConfig);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            v17 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensive"
                                 "Networking:progress:requestId:completion:]_block_invoke";
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v17;
            *(_WORD *)&buf[22] = 2114;
            v65 = v3;
            _os_log_debug_impl(&dword_229282000, v12, OS_LOG_TYPE_DEBUG, "%s %{public}@: No auto asset type defined for %{public}@", buf, 0x20u);
          }
        }
        else
        {
          UAFGetLogCategory((id *)&UAFLogContextMAConfig);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v16 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensive"
                                 "Networking:progress:requestId:completion:]_block_invoke";
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v16;
            *(_WORD *)&buf[22] = 2114;
            v65 = v3;
            _os_log_error_impl(&dword_229282000, v12, OS_LOG_TYPE_ERROR, "%s %{public}@: Could not get configuration for for asset set %{public}@", buf, 0x20u);
          }
        }
LABEL_25:

      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v67, 16);
    }
    while (v33);
  }

  +[UAFAutoAssetManager getConcurrentQueue](UAFAutoAssetManager, "getConcurrentQueue");
  v28 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __129__UAFAutoAssetManager_updateAutoAssetsFromAssetSetUsages_configurationManager_expensiveNetworking_progress_requestId_completion___block_invoke_292;
  block[3] = &unk_24F1F8430;
  v36 = *(id *)(a1 + 56);
  v37 = *(id *)(a1 + 32);
  v38 = *(id *)(a1 + 40);
  v39 = *(id *)(a1 + 72);
  dispatch_group_notify(group, v28, block);

}

void __129__UAFAutoAssetManager_updateAutoAssetsFromAssetSetUsages_configurationManager_expensiveNetworking_progress_requestId_completion___block_invoke_284(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  id WeakRetained;
  void *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  int v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  uint64_t v69;
  uint8_t buf[4];
  const char *v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v9)
  {
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "assetSetIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v71 = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworking:progress:r"
            "equestId:completion:]_block_invoke";
      v72 = 2114;
      v73 = v22;
      v74 = 2114;
      v75 = (uint64_t)v23;
      _os_log_impl(&dword_229282000, v21, OS_LOG_TYPE_DEFAULT, "%s %{public}@: @Checked %{public}@", buf, 0x20u);

    }
    v24 = 4;
    goto LABEL_58;
  }
  objc_msgSend(v9, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.MobileAssetError.AutoAsset")))
  {

    goto LABEL_14;
  }
  v12 = objc_msgSend(v10, "code");

  if (v12 != 6115)
  {
LABEL_14:
    objc_msgSend(v10, "domain");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "isEqualToString:", CFSTR("com.apple.MobileAssetError.AutoAsset"))
      && objc_msgSend(v10, "code") == 6107)
    {
      objc_msgSend(v10, "userInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        objc_msgSend(v10, "userInfo");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
        v21 = objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          -[NSObject domain](v21, "domain");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v28, "isEqualToString:", CFSTR("com.apple.MobileAssetError.Download")) & 1) != 0)
          {
            v29 = -[NSObject code](v21, "code");

            if (v29 == 37)
            {
              UAFGetLogCategory((id *)&UAFLogContextMAConfig);
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                v31 = *(_QWORD *)(a1 + 32);
                objc_msgSend(*(id *)(a1 + 40), "assetSetIdentifier");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v71 = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworking:"
                      "progress:requestId:completion:]_block_invoke";
                v72 = 2114;
                v73 = v31;
                v74 = 2114;
                v75 = (uint64_t)v32;
                _os_log_impl(&dword_229282000, v30, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Out of space condition encountered for %{public}@", buf, 0x20u);

              }
              v24 = 5;
LABEL_57:

              goto LABEL_58;
            }
          }
          else
          {

          }
          -[NSObject domain](v21, "domain");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v48, "isEqualToString:", CFSTR("com.apple.MobileAssetError.Download")) & 1) != 0)
          {
            v49 = -[NSObject code](v21, "code");

            if (v49 == 44)
            {
              UAFGetLogCategory((id *)&UAFLogContextMAConfig);
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                v50 = *(_QWORD *)(a1 + 32);
                objc_msgSend(*(id *)(a1 + 40), "assetSetIdentifier");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315906;
                v71 = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworking:"
                      "progress:requestId:completion:]_block_invoke";
                v72 = 2114;
                v73 = v50;
                v74 = 2114;
                v75 = (uint64_t)v51;
                v76 = 2114;
                v77 = (uint64_t)v10;
                _os_log_impl(&dword_229282000, v30, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Not Found condition encountered for %{public}@: %{public}@", buf, 0x2Au);

              }
              v24 = 4;
              goto LABEL_57;
            }
          }
          else
          {

          }
          -[NSObject domain](v21, "domain");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "isEqualToString:", CFSTR("com.apple.MobileAssetError.Download"));

          if (v53)
          {
            UAFGetLogCategory((id *)&UAFLogContextMAConfig);
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              v54 = *(_QWORD *)(a1 + 32);
              objc_msgSend(*(id *)(a1 + 40), "assetSetIdentifier");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315906;
              v71 = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworking:pr"
                    "ogress:requestId:completion:]_block_invoke";
              v72 = 2114;
              v73 = v54;
              v74 = 2114;
              v75 = (uint64_t)v55;
              v76 = 2114;
              v77 = (uint64_t)v10;
              _os_log_impl(&dword_229282000, v30, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Network related error condition encountered for %{public}@: %{public}@", buf, 0x2Au);

            }
            v24 = 7;
            goto LABEL_57;
          }
        }
        UAFGetLogCategory((id *)&UAFLogContextMAConfig);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v56 = *(_QWORD *)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 40), "assetSetIdentifier");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v71 = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworking:progre"
                "ss:requestId:completion:]_block_invoke";
          v72 = 2114;
          v73 = v56;
          v74 = 2114;
          v75 = (uint64_t)v57;
          v76 = 2114;
          v77 = (uint64_t)v10;
          _os_log_impl(&dword_229282000, v30, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Error condition encountered for %{public}@: %{public}@", buf, 0x2Au);

        }
        v24 = 6;
        goto LABEL_57;
      }
    }
    else
    {

    }
    objc_msgSend(v10, "domain");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "isEqualToString:", CFSTR("com.apple.MobileAssetError.AutoAsset")))
    {
      v34 = objc_msgSend(v10, "code");

      if (v34 == 6209)
      {
        objc_msgSend(v10, "userInfo");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("DownloadSpaceDetails"));
        v21 = objc_claimAutoreleasedReturnValue();

        -[NSObject objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", CFSTR("TotalRequiredSpaceForSetDownload"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", CFSTR("StillNeededSpaceForSetDownload"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        UAFGetLogCategory((id *)&UAFLogContextMAConfig);
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v64 = *(_QWORD *)(a1 + 32);
          v63 = objc_msgSend(v36, "integerValue");
          v61 = objc_msgSend(v37, "integerValue");
          objc_msgSend(*(id *)(a1 + 40), "assetSetIdentifier");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136316418;
          v71 = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworking:progre"
                "ss:requestId:completion:]_block_invoke";
          v72 = 2114;
          v73 = v64;
          v74 = 2048;
          v75 = v63;
          v76 = 2048;
          v77 = v61;
          v78 = 2114;
          v79 = v62;
          v80 = 2114;
          v81 = v10;
          _os_log_error_impl(&dword_229282000, v38, OS_LOG_TYPE_ERROR, "%s %{public}@: Out of Space condition encountered (total: %lld, needed: %lld) for the set %{public}@: %{public}@", buf, 0x3Eu);

        }
        v24 = 5;
        goto LABEL_58;
      }
    }
    else
    {

    }
    objc_msgSend(v10, "domain");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "isEqualToString:", CFSTR("com.apple.MobileAssetError.AutoAsset")))
    {
      v40 = objc_msgSend(v10, "code");

      if (v40 == 6205)
      {
        v24 = 4;
LABEL_59:
        v65[0] = MEMORY[0x24BDAC760];
        v65[1] = 3221225472;
        v65[2] = __129__UAFAutoAssetManager_updateAutoAssetsFromAssetSetUsages_configurationManager_expensiveNetworking_progress_requestId_completion___block_invoke_291;
        v65[3] = &unk_24F1F7828;
        v58 = *(_QWORD *)(a1 + 40);
        v66 = *(id *)(a1 + 48);
        v67 = *(id *)(a1 + 40);
        v69 = v24;
        v68 = *(id *)(a1 + 56);
        +[UAFAutoAssetManager conditionallyLockLatestAssetSet:newestInstance:checkAtomicError:completion:](UAFAutoAssetManager, "conditionallyLockLatestAssetSet:newestInstance:checkAtomicError:completion:", v58, v7, v10, v65);

        goto LABEL_60;
      }
    }
    else
    {

    }
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v59 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "assetSetIdentifier");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v71 = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworking:progress:r"
            "equestId:completion:]_block_invoke";
      v72 = 2114;
      v73 = v59;
      v74 = 2114;
      v75 = (uint64_t)v60;
      v76 = 2114;
      v77 = (uint64_t)v10;
      _os_log_error_impl(&dword_229282000, v21, OS_LOG_TYPE_ERROR, "%s %{public}@: Could not check auto asset set %{public}@: %{public}@", buf, 0x2Au);

    }
    v24 = 6;
LABEL_58:

    goto LABEL_59;
  }
  UAFGetLogCategory((id *)&UAFLogContextMAConfig);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "assetSetIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v71 = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworking:progress:req"
          "uestId:completion:]_block_invoke";
    v72 = 2114;
    v73 = v14;
    v74 = 2114;
    v75 = (uint64_t)v15;
    _os_log_impl(&dword_229282000, v13, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Checking %{public}@ was cancelled, retrying", buf, 0x20u);

  }
  if ((int)++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) < 3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
    if (WeakRetained)
    {
      v42 = *(void **)(a1 + 40);
      +[UAFAutoAssetManager getReason:operation:](UAFAutoAssetManager, "getReason:operation:", v42, CFSTR("checking"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "checkAtomic:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:reportingProgress:completion:", v43, 0, 1, *(_QWORD *)(a1 + 64), -2, *(_QWORD *)(a1 + 72), WeakRetained);

    }
    else
    {
      UAFGetLogCategory((id *)&UAFLogContextMAConfig);
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136315394;
        v71 = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworking:progress"
              ":requestId:completion:]_block_invoke";
        v72 = 2114;
        v73 = v45;
        _os_log_impl(&dword_229282000, v44, OS_LOG_TYPE_DEFAULT, "%s %{public}@: No strong completion routine, exiting retry cycle", buf, 0x16u);
      }

      v46 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "assetSetIdentifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "finished:withStatus:", v47, 6);

      dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
    }

  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "assetSetIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v71 = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworking:progress:r"
            "equestId:completion:]_block_invoke";
      v72 = 2114;
      v73 = v17;
      v74 = 2114;
      v75 = (uint64_t)v18;
      _os_log_impl(&dword_229282000, v16, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Retry count exceeded for %{public}@", buf, 0x20u);

    }
    v19 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "assetSetIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "finished:withStatus:", v20, 6);

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }
LABEL_60:

}

void __129__UAFAutoAssetManager_updateAutoAssetsFromAssetSetUsages_configurationManager_expensiveNetworking_progress_requestId_completion___block_invoke_291(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "assetSetIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finished:withStatus:", v3, *(_QWORD *)(a1 + 56));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __129__UAFAutoAssetManager_updateAutoAssetsFromAssetSetUsages_configurationManager_expensiveNetworking_progress_requestId_completion___block_invoke_292(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __129__UAFAutoAssetManager_updateAutoAssetsFromAssetSetUsages_configurationManager_expensiveNetworking_progress_requestId_completion___block_invoke_2;
  v3[3] = &unk_24F1F75A8;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "updateFinished:", v3);

}

uint64_t __129__UAFAutoAssetManager_updateAutoAssetsFromAssetSetUsages_configurationManager_expensiveNetworking_progress_requestId_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t result;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  UAFGetLogCategory((id *)&UAFLogContextMAConfig);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315650;
    v7 = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworking:progress:requ"
         "estId:completion:]_block_invoke_2";
    v8 = 2114;
    v9 = v3;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_229282000, v2, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Updates asset sets %{public}@ complete", (uint8_t *)&v6, 0x20u);

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (unint64_t)getDownloadStatusFromMAAutoAssetSetStatus:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "availableForUseError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.MobileAssetError.AutoAsset")) & 1) == 0)
  {

LABEL_7:
    objc_msgSend(v3, "downloadProgress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v3, "downloadProgress");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isStalled");

      if (v17)
        v14 = 3;
      else
        v14 = 2;
    }
    else
    {
      v14 = 4;
    }
    goto LABEL_12;
  }
  objc_msgSend(v3, "availableForUseError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "code");

  if (v7 != 6209)
    goto LABEL_7;
  objc_msgSend(v3, "availableForUseError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DownloadSpaceDetails"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("TotalRequiredSpaceForSetDownload"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("StillNeededSpaceForSetDownload"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  UAFGetLogCategory((id *)&UAFLogContextMAConfig);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v19 = objc_msgSend(v11, "integerValue");
    v20 = objc_msgSend(v12, "integerValue");
    objc_msgSend(v3, "assetSetIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 136315906;
    v23 = "+[UAFAutoAssetManager getDownloadStatusFromMAAutoAssetSetStatus:]";
    v24 = 2048;
    v25 = v19;
    v26 = 2048;
    v27 = v20;
    v28 = 2114;
    v29 = v21;
    _os_log_error_impl(&dword_229282000, v13, OS_LOG_TYPE_ERROR, "%s Out of Space condition encountered (total: %lld, needed: %lld) for the set %{public}@", (uint8_t *)&v22, 0x2Au);

  }
  v14 = 5;
LABEL_12:

  return v14;
}

+ (id)assetSetNamesFromUsages:(id)a3 configurationManager:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v8)
  {
    v10 = v8;
    v11 = 0;
    v12 = *(_QWORD *)v22;
    *(_QWORD *)&v9 = 136315394;
    v20 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v7);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v6, "getAssetSet:", v14, v20, (_QWORD)v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          objc_msgSend(v15, "autoAssetType");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            if (!v11)
              v11 = (void *)objc_opt_new();
            objc_msgSend(v16, "name");
            v18 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v18);
          }
          else
          {
            UAFGetLogCategory((id *)&UAFLogContextMAConfig);
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v20;
              v26 = "+[UAFAutoAssetManager assetSetNamesFromUsages:configurationManager:]";
              v27 = 2114;
              v28 = v14;
              _os_log_debug_impl(&dword_229282000, v18, OS_LOG_TYPE_DEBUG, "%s No auto asset type defined for %{public}@", buf, 0x16u);
            }
          }
        }
        else
        {
          UAFGetLogCategory((id *)&UAFLogContextMAConfig);
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            v26 = "+[UAFAutoAssetManager assetSetNamesFromUsages:configurationManager:]";
            v27 = 2114;
            v28 = v14;
            _os_log_error_impl(&dword_229282000, v18, OS_LOG_TYPE_ERROR, "%s Could not get configuration for for asset set %{public}@", buf, 0x16u);
          }
        }

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)autoAssetSetForStatus:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BE66BD8]);
  +[UAFAutoAssetManager getConcurrentQueue](UAFAutoAssetManager, "getConcurrentQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v6 = (void *)objc_msgSend(v4, "initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:completingFromQueue:error:", CFSTR("com.apple.UnifiedAssetFramework"), CFSTR("manager"), v3, 0, v5, &v11);
  v7 = v11;

  if (v7)
  {
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "+[UAFAutoAssetManager autoAssetSetForStatus:]";
      v14 = 2114;
      v15 = v3;
      v16 = 2114;
      v17 = v7;
      _os_log_error_impl(&dword_229282000, v8, OS_LOG_TYPE_ERROR, "%s Could not initialize auto asset set %{public}@ for status: %{public}@", buf, 0x20u);
    }

    v9 = 0;
  }
  else
  {
    v9 = v6;
  }

  return v9;
}

+ (unint64_t)getDownloadStatusFromAssetSetUsages:(id)a3 configurationManager:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  unint64_t v19;
  unint64_t v20;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v24 = (void *)objc_opt_new();
  v22 = v6;
  v23 = v5;
  +[UAFAutoAssetManager assetSetNamesFromUsages:configurationManager:](UAFAutoAssetManager, "assetSetNamesFromUsages:configurationManager:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        +[UAFAutoAssetManager autoAssetSetForStatus:](UAFAutoAssetManager, "autoAssetSetForStatus:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        objc_msgSend(v13, "currentSetStatusSync:", &v25);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v25;
        v16 = v15;
        if (v14)
          v17 = v15 == 0;
        else
          v17 = 0;
        if (v17)
        {
          v19 = +[UAFAutoAssetManager getDownloadStatusFromMAAutoAssetSetStatus:](UAFAutoAssetManager, "getDownloadStatusFromMAAutoAssetSetStatus:", v14);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v19);
          v18 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v18, v12);
        }
        else
        {
          UAFGetLogCategory((id *)&UAFLogContextMAConfig);
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v31 = "+[UAFAutoAssetManager getDownloadStatusFromAssetSetUsages:configurationManager:]";
            v32 = 2114;
            v33 = v12;
            v34 = 2114;
            v35 = v16;
            _os_log_error_impl(&dword_229282000, v18, OS_LOG_TYPE_ERROR, "%s Could not get status of auto asset set %{public}@: %{public}@", buf, 0x20u);
          }
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v9);
  }
  v20 = +[UAFAssetSetManager coalesceDownloadStatus:](UAFAssetSetManager, "coalesceDownloadStatus:", v24);

  return v20;
}

+ (void)getDownloadStatusFromAssetSetUsages:(id)a3 configurationManager:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  unint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id obj;
  _QWORD block[4];
  id v29;
  id v30;
  _QWORD v31[5];
  NSObject *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24 = a6;
  v12 = 0x24F1F6000uLL;
  if (!v11)
  {
    +[UAFAutoAssetManager getConcurrentQueue](UAFAutoAssetManager, "getConcurrentQueue");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)objc_opt_new();
  v14 = dispatch_group_create();
  v25 = v10;
  v26 = v9;
  +[UAFAutoAssetManager assetSetNamesFromUsages:configurationManager:](UAFAutoAssetManager, "assetSetNamesFromUsages:configurationManager:", v9, v10);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v35 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(*(id *)(v12 + 1392), "autoAssetSetForStatus:", v19, v24);
        v20 = v12;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v14);
        v31[0] = MEMORY[0x24BDAC760];
        v31[1] = 3221225472;
        v31[2] = __97__UAFAutoAssetManager_getDownloadStatusFromAssetSetUsages_configurationManager_queue_completion___block_invoke;
        v31[3] = &unk_24F1F89C0;
        v31[4] = v19;
        v32 = v14;
        v33 = v13;
        objc_msgSend(v21, "currentSetStatus:", v31);

        v12 = v20;
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v16);
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __97__UAFAutoAssetManager_getDownloadStatusFromAssetSetUsages_configurationManager_queue_completion___block_invoke_293;
  block[3] = &unk_24F1F7560;
  v29 = v13;
  v30 = v24;
  v22 = v24;
  v23 = v13;
  dispatch_group_notify(v14, v11, block);

}

void __97__UAFAutoAssetManager_getDownloadStatusFromAssetSetUsages_configurationManager_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 136315650;
      v14 = "+[UAFAutoAssetManager getDownloadStatusFromAssetSetUsages:configurationManager:queue:completion:]_block_invoke";
      v15 = 2114;
      v16 = v12;
      v17 = 2114;
      v18 = v7;
      _os_log_error_impl(&dword_229282000, v11, OS_LOG_TYPE_ERROR, "%s Could not get status of auto asset set %{public}@: %{public}@", (uint8_t *)&v13, 0x20u);
    }

  }
  else
  {
    v8 = +[UAFAutoAssetManager getDownloadStatusFromMAAutoAssetSetStatus:](UAFAutoAssetManager, "getDownloadStatusFromMAAutoAssetSetStatus:", v5);
    v9 = *(id *)(a1 + 48);
    objc_sync_enter(v9);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v10, *(_QWORD *)(a1 + 32));

    objc_sync_exit(v9);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __97__UAFAutoAssetManager_getDownloadStatusFromAssetSetUsages_configurationManager_queue_completion___block_invoke_293(uint64_t a1)
{
  +[UAFAssetSetManager coalesceDownloadStatus:](UAFAssetSetManager, "coalesceDownloadStatus:", *(_QWORD *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (BOOL)shouldWaitForMobileAssetStart:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.MobileAssetError.AutoAsset"))
      && objc_msgSend(v4, "code") == 6108)
    {
      objc_msgSend(v4, "localizedDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(v4, "localizedDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "containsString:", CFSTR("AtomicEntry in locked set-status for secure grafted/mounted auto-asset where required content is missing"));

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (void)waitForMobileAssetStart:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v7 = a5;
  v8 = (objc_class *)MEMORY[0x24BE66BD8];
  v9 = a4;
  v10 = a3;
  v16 = 0;
  v11 = (void *)objc_msgSend([v8 alloc], "initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:completingFromQueue:error:", CFSTR("com.apple.UnifiedAssetFramework"), CFSTR("manager"), v10, 0, v9, &v16);

  v12 = v16;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __64__UAFAutoAssetManager_waitForMobileAssetStart_queue_completion___block_invoke;
  v14[3] = &unk_24F1F89E8;
  v15 = v7;
  v13 = v7;
  objc_msgSend(v11, "currentSetStatus:", v14);

}

uint64_t __64__UAFAutoAssetManager_waitForMobileAssetStart_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)autoAssetExistsWithEntries:(id)a3
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  BOOL v6;
  BOOL v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  BOOL v14;
  uint64_t v15;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  NSObject *v23;
  __int16 v24;
  NSObject *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v19 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BD8]), "initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:error:", CFSTR("com.apple.UnifiedAssetFramework"), CFSTR("manager"), v3, 0, &v19);
  v5 = v19;
  if (v5)
    v6 = 1;
  else
    v6 = v4 == 0;
  if (v6)
  {
    v11 = v5;
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v21 = "+[UAFAutoAssetManager autoAssetExistsWithEntries:]";
      v22 = 2114;
      v23 = v3;
      v24 = 2114;
      v25 = v11;
      _os_log_error_impl(&dword_229282000, v9, OS_LOG_TYPE_ERROR, "%s Could not initialize auto asset set %{public}@ : %{public}@", buf, 0x20u);
    }
    v7 = 0;
  }
  else
  {
    +[UAFAutoAssetManager getReason:operation:](UAFAutoAssetManager, "getReason:operation:", v4, CFSTR("checking"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v18 = 0;
    objc_msgSend(v4, "checkAtomicSync:forAtomicInstance:withTimeout:discoveredAtomicEntries:error:", v8, 0, 0, &v18, &v17);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v18;
    v11 = v17;

    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v9)
      v14 = v11 == 0;
    else
      v14 = 0;
    if (v14)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_msgSend(v10, "count");
        *(_DWORD *)buf = 136315906;
        v21 = "+[UAFAutoAssetManager autoAssetExistsWithEntries:]";
        v22 = 2112;
        v23 = v9;
        v24 = 2114;
        v25 = v3;
        v26 = 2048;
        v27 = v15;
        _os_log_impl(&dword_229282000, v13, OS_LOG_TYPE_DEFAULT, "%s Found existing instance %@ of auto asset set %{public}@ with %lu entries", buf, 0x2Au);
      }

      v7 = objc_msgSend(v10, "count") != 0;
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v21 = "+[UAFAutoAssetManager autoAssetExistsWithEntries:]";
        v22 = 2114;
        v23 = v3;
        v24 = 2114;
        v25 = v11;
        _os_log_debug_impl(&dword_229282000, v13, OS_LOG_TYPE_DEBUG, "%s Auto asset set %{public}@ does not exist with entries: %{public}@", buf, 0x20u);
      }

      v7 = 0;
    }

  }
  return v7;
}

+ (void)_logDailyStatusEventForAssetSetArrived:(id)a3 entries:(id)a4 assetSetArrived:(BOOL)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
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
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  id v46;
  uint8_t v47[128];
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v39 = a5;
  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v45 = 0;
  objc_msgSend(v6, "currentSetStatusSync:", &v45);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v45;
  if (v9)
  {
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "assetSetIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v49 = "+[UAFAutoAssetManager _logDailyStatusEventForAssetSetArrived:entries:assetSetArrived:]";
      v50 = 2114;
      v51 = v36;
      v52 = 2114;
      v53 = v9;
      _os_log_debug_impl(&dword_229282000, v10, OS_LOG_TYPE_DEBUG, "%s Could not get status of auto asset set %{public}@ : %{public}@", buf, 0x20u);

    }
  }
  v37 = v9;
  v11 = objc_alloc_init(MEMORY[0x24BE95E98]);
  v40 = v6;
  objc_msgSend(v6, "assetSetIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAssetSetName:", v12);

  v38 = v8;
  objc_msgSend(v8, "downloadedCatalogCachedAssetSetID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAssetSetId:", v13);

  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v15 = v7;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v42 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v21 = objc_alloc_init(MEMORY[0x24BE95E88]);
        objc_msgSend(v20, "fullAssetSelector");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "assetSpecifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setAssetName:", v23);

        objc_msgSend(v20, "fullAssetSelector");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "assetVersion");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setAssetVersion:", v25);

        objc_msgSend(v14, "addObject:", v21);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v17);
  }

  objc_msgSend(v11, "setAssets:", v14);
  v26 = (void *)objc_opt_new();
  objc_msgSend(v38, "availableForUseError");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = (void *)objc_opt_new();
    objc_msgSend(v38, "availableForUseError");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setMobileAssetDownloadErrorCode:", objc_msgSend(v29, "code"));

    objc_msgSend(v28, "setTimesOccurred:", 1);
    objc_msgSend(v26, "addObject:", v28);

  }
  objc_msgSend(v38, "newerVersionError");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v31 = (void *)objc_opt_new();
    objc_msgSend(v38, "newerVersionError");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setMobileAssetDownloadErrorCode:", objc_msgSend(v32, "code"));

    objc_msgSend(v31, "setTimesOccurred:", 1);
    objc_msgSend(v26, "addObject:", v31);

  }
  objc_msgSend(v11, "setMobileAssetDownloadErrorCodeFrequencys:", v26);
  UAFGetLogCategory((id *)&UAFLogContextMAConfig);
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v40, "assetSetIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v49 = "+[UAFAutoAssetManager _logDailyStatusEventForAssetSetArrived:entries:assetSetArrived:]";
    v50 = 2114;
    v51 = v34;
    _os_log_impl(&dword_229282000, v33, OS_LOG_TYPE_DEFAULT, "%s Emitting asset set arrived daily status event for auto asset set %{public}@:", buf, 0x16u);

  }
  v46 = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v46, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAFInstrumentationProvider logUAFAssetSetDailyStatus:assetSetArrived:](UAFInstrumentationProvider, "logUAFAssetSetDailyStatus:assetSetArrived:", v35, v39);

}

+ (id)spaceNeededForAssetSetUsages:(id)a3 key:(id)a4 configurationManager:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  id *v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  id *v22;
  NSObject *v23;
  void *v24;
  __int128 v26;
  id obj;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v29 = a4;
  v9 = a5;
  if (!v9)
  {
    +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v10)
  {
    v12 = v10;
    v30 = 0;
    v13 = *(_QWORD *)v32;
    v14 = (id *)&UAFLogContextMAConfig;
    *(_QWORD *)&v11 = 136315394;
    v26 = v11;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v9, "getAssetSet:", v16, v26);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          objc_msgSend(v17, "autoAssetType");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend((id)objc_opt_class(), "sizeInBytesForConfig:key:error:", v18, v29, a6);
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = -[NSObject unsignedIntegerValue](v20, "unsignedIntegerValue");
            v22 = v14;
            UAFGetLogCategory(v14);
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              v36 = "+[UAFAutoAssetManager spaceNeededForAssetSetUsages:key:configurationManager:error:]";
              v37 = 2114;
              v38 = v16;
              v39 = 2048;
              v40 = v21;
              v41 = 2114;
              v42 = v29;
              _os_log_impl(&dword_229282000, v23, OS_LOG_TYPE_DEFAULT, "%s Configured asset name %{public}@ with size %llu for key %{public}@", buf, 0x2Au);
            }

            v30 += v21;
            v14 = v22;
          }
          else
          {
            UAFGetLogCategory(v14);
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v26;
              v36 = "+[UAFAutoAssetManager spaceNeededForAssetSetUsages:key:configurationManager:error:]";
              v37 = 2114;
              v38 = v16;
              _os_log_debug_impl(&dword_229282000, v20, OS_LOG_TYPE_DEBUG, "%s No auto asset type defined for %{public}@", buf, 0x16u);
            }
          }
        }
        else
        {
          UAFGetLogCategory(v14);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v26;
            v36 = "+[UAFAutoAssetManager spaceNeededForAssetSetUsages:key:configurationManager:error:]";
            v37 = 2114;
            v38 = v16;
            _os_log_error_impl(&dword_229282000, v20, OS_LOG_TYPE_ERROR, "%s Could get not get configuration for for asset set %{public}@", buf, 0x16u);
          }
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    }
    while (v12);
  }
  else
  {
    v30 = 0;
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v30);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)sizeInBytesForConfig:(id)a3 key:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  uint64_t v19;
  id *v20;
  uint64_t i;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  id *v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  id *v42;
  void *v43;
  void *v44;
  id obj;
  id v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  id v60;
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  NSObject *v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  id v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc(MEMORY[0x24BE66BD8]);
  v44 = v7;
  objc_msgSend(v7, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAFAutoAssetManager getConcurrentQueue](UAFAutoAssetManager, "getConcurrentQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0;
  v12 = (void *)objc_msgSend(v9, "initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:completingFromQueue:error:", CFSTR("com.apple.UnifiedAssetFramework"), CFSTR("manager"), v10, 0, v11, &v60);
  v13 = v60;

  if (v13)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_8:
      v17 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v44, "name");
    v15 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v62 = "+[UAFAutoAssetManager sizeInBytesForConfig:key:error:]";
    v63 = 2114;
    v64 = v15;
    v65 = 2114;
    v66 = (uint64_t)v13;
    _os_log_error_impl(&dword_229282000, v14, OS_LOG_TYPE_ERROR, "%s Could not initialize auto asset set %{public}@ : %{public}@", buf, 0x20u);
LABEL_7:

    goto LABEL_8;
  }
  v59 = 0;
  objc_msgSend(v12, "currentSetStatusSync:", &v59);
  v14 = objc_claimAutoreleasedReturnValue();
  v16 = v59;
  if (v16)
  {
    v13 = v16;
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v44, "name");
      v41 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v62 = "+[UAFAutoAssetManager sizeInBytesForConfig:key:error:]";
      v63 = 2114;
      v64 = v41;
      v65 = 2114;
      v66 = (uint64_t)v13;
      _os_log_error_impl(&dword_229282000, v15, OS_LOG_TYPE_ERROR, "%s Could not initialize auto asset set %{public}@ : %{public}@", buf, 0x20u);

    }
    goto LABEL_7;
  }
  v42 = a5;
  v43 = v12;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  -[NSObject newerDiscoveredAtomicEntries](v14, "newerDiscoveredAtomicEntries");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v70, 16);
  v19 = 0;
  if (v49)
  {
    v48 = *(_QWORD *)v56;
    v20 = (id *)&UAFLogContextClient;
    v46 = v8;
    v47 = v14;
    do
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v56 != v48)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        -[NSObject latestDowloadedAtomicInstanceEntries](v14, "latestDowloadedAtomicInstanceEntries");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v51, v69, 16);
        if (v24)
        {
          v25 = v24;
          v26 = v20;
          v50 = v19;
          v27 = *(_QWORD *)v52;
          while (2)
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v52 != v27)
                objc_enumerationMutation(v23);
              v29 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
              objc_msgSend(v22, "fullAssetSelector");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "fullAssetSelector");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v30, "isEqual:", v31);

              if ((v32 & 1) != 0)
              {

                v20 = v26;
                UAFGetLogCategory(v26);
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v22, "assetID");
                  v33 = objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136315394;
                  v62 = "+[UAFAutoAssetManager sizeInBytesForConfig:key:error:]";
                  v63 = 2114;
                  v64 = v33;
                  _os_log_impl(&dword_229282000, v23, OS_LOG_TYPE_DEFAULT, "%s Newer asset entry %{public}@ skipped due to having a latest downloaded entry", buf, 0x16u);

                }
                v8 = v46;
                v14 = v47;
                v19 = v50;
                goto LABEL_27;
              }
            }
            v25 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v51, v69, 16);
            if (v25)
              continue;
            break;
          }
          v14 = v47;
          v19 = v50;
          v20 = v26;
          v8 = v46;
        }
LABEL_27:

        objc_msgSend(v22, "assetAttributes");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKey:", v8);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          v36 = objc_msgSend(v35, "unsignedIntegerValue");
          UAFGetLogCategory(v20);
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v22, "assetID");
            v38 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            v62 = "+[UAFAutoAssetManager sizeInBytesForConfig:key:error:]";
            v63 = 2114;
            v64 = v38;
            v65 = 2048;
            v66 = v36;
            v67 = 2114;
            v68 = v8;
            _os_log_impl(&dword_229282000, v37, OS_LOG_TYPE_DEFAULT, "%s Newer asset entry %{public}@ has download size %llu for key %{public}@", buf, 0x2Au);

          }
          v19 += v36;
        }
        else
        {
          UAFGetLogCategory(v20);
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v44, "autoAssetType");
            v40 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v62 = "+[UAFAutoAssetManager sizeInBytesForConfig:key:error:]";
            v63 = 2114;
            v64 = v40;
            v65 = 2114;
            v66 = (uint64_t)v8;
            _os_log_error_impl(&dword_229282000, v39, OS_LOG_TYPE_ERROR, "%s Newer asset entry %{public}@ missing download size metadata for key %{public}@", buf, 0x20u);

          }
        }

      }
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v70, 16);
    }
    while (v49);
  }

  if (v42)
    *v42 = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v12 = v43;
LABEL_9:

  return v17;
}

@end
