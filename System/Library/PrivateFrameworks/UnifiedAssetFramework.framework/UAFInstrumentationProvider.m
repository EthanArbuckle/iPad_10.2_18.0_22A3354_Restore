@implementation UAFInstrumentationProvider

+ (id)defaultDeviceId
{
  if (_MergedGlobals_15 != -1)
    dispatch_once(&_MergedGlobals_15, &__block_literal_global_17);
  return (id)qword_2540B1DE0;
}

void __45__UAFInstrumentationProvider_defaultDeviceId__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  +[UAFAssetSetManager defaults](UAFAssetSetManager, "defaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", CFSTR("PersistedDeviceId"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_2540B1DE0;
  qword_2540B1DE0 = v1;

  if (!qword_2540B1DE0)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)qword_2540B1DE0;
    qword_2540B1DE0 = v4;

    +[UAFAssetSetManager defaults](UAFAssetSetManager, "defaults");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", qword_2540B1DE0, CFSTR("PersistedDeviceId"));

  }
}

+ (int)_getAssetSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Factory")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Root")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Trial")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MA")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_constructNamespaceStatusEventForNamespace:(unsigned int)a3 withClient:(id)a4
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  id v36;
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
  void *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  id v64;
  __int16 v65;
  void *v66;
  _BYTE v67[128];
  uint64_t v68;

  v4 = *(_QWORD *)&a3;
  v68 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v55 = objc_alloc_init(MEMORY[0x24BE95A28]);
  if ((_DWORD)v4 == 406)
  {
    v6 = 2;
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextInstrumentation);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v62 = "+[UAFInstrumentationProvider _constructNamespaceStatusEventForNamespace:withClient:]";
      v63 = 1024;
      LODWORD(v64) = v4;
      _os_log_error_impl(&dword_229282000, v7, OS_LOG_TYPE_ERROR, "%s Got an unknown namespaceId: %d", buf, 0x12u);
    }

    v6 = 0;
  }
  objc_msgSend(v55, "setTrialNamespace:", v6);
  objc_msgSend(MEMORY[0x24BEBA990], "namespaceNameFromId:", v4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "compatibilityVersionWithNamespaceName:", v8);
  v10 = objc_alloc_init(MEMORY[0x24BE95C88]);
  objc_msgSend(v10, "setMajor:", v9);
  v51 = v10;
  objc_msgSend(v55, "setNamespaceCompatabilityVersion:", v10);
  v11 = objc_alloc_init(MEMORY[0x24BE95A30]);
  objc_msgSend(v5, "rolloutIdentifiersWithNamespaceName:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rolloutId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRolloutId:", v13);

  objc_msgSend(v11, "setDeployment:", objc_msgSend(v12, "deploymentId"));
  v49 = v12;
  objc_msgSend(v12, "factorPackId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFactorPack:", v14);

  v50 = v11;
  objc_msgSend(v55, "setRollout:", v11);
  v52 = v5;
  v54 = (void *)v8;
  objc_msgSend(v5, "factorLevelsWithNamespaceName:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v58;
    v53 = v15;
    v56 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v58 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_msgSend(v20, "level");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "directoryValue");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22)
        {
          v24 = v22;
        }
        else
        {
          objc_msgSend(v20, "level");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "fileValue");
          v24 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v24, "path");
        v26 = objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v27 = (void *)v26;
          objc_msgSend(v24, "path");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "length");

          if (v29)
          {
            objc_msgSend(v20, "level");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "metadata");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "valueForKey:", CFSTR("version"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (v32)
            {
              objc_msgSend(v32, "componentsSeparatedByString:", CFSTR("."));
              v33 = objc_claimAutoreleasedReturnValue();
              if ((unint64_t)-[NSObject count](v33, "count") > 2)
              {
                v34 = objc_alloc_init(MEMORY[0x24BE95C88]);
                -[NSObject objectAtIndex:](v33, "objectAtIndex:", 0);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject setMajor:](v34, "setMajor:", objc_msgSend(v39, "intValue"));

                -[NSObject objectAtIndex:](v33, "objectAtIndex:", 1);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject setMinor:](v34, "setMinor:", objc_msgSend(v40, "intValue"));

                if ((unint64_t)-[NSObject count](v33, "count") >= 3)
                {
                  -[NSObject objectAtIndex:](v33, "objectAtIndex:", 2);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject setPatch:](v34, "setPatch:", objc_msgSend(v41, "intValue"));

                }
                if (-[NSObject count](v33, "count") == 4)
                {
                  -[NSObject objectAtIndex:](v33, "objectAtIndex:", 3);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject setPrerelease:](v34, "setPrerelease:", v42);

                }
                v36 = objc_alloc_init(MEMORY[0x24BE95AA8]);
                objc_msgSend(v36, "setAssetVersion:", v34);
                objc_msgSend(v36, "setTrialNamespace:", v54);
                objc_msgSend(v20, "factor");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "name");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "setAssetName:", v44);

                objc_msgSend(v20, "level");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "metadata");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "valueForKey:", CFSTR("locale"));
                v35 = (void *)objc_claimAutoreleasedReturnValue();

                if (v35)
                {
                  objc_msgSend(v35, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "setAssetLocale:", objc_msgSend(MEMORY[0x24BE95CA8], "convertLanguageCodeToSchemaLocale:", v47));

                }
                else
                {
                  objc_msgSend(v36, "setAssetLocale:", 0);
                }
                v15 = v53;
                objc_msgSend(v55, "addAssets:", v36);
LABEL_30:

              }
              else
              {
                UAFGetLogCategory((id *)&UAFLogContextInstrumentation);
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v20, "factor");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "name");
                  v36 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136315650;
                  v62 = "+[UAFInstrumentationProvider _constructNamespaceStatusEventForNamespace:withClient:]";
                  v63 = 2112;
                  v64 = v36;
                  v65 = 2112;
                  v66 = v32;
                  _os_log_error_impl(&dword_229282000, v34, OS_LOG_TYPE_ERROR, "%s Version info is malformed for asset %@, version %@", buf, 0x20u);
                  goto LABEL_30;
                }
              }

            }
            else
            {
              UAFGetLogCategory((id *)&UAFLogContextInstrumentation);
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v20, "factor");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "name");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315394;
                v62 = "+[UAFInstrumentationProvider _constructNamespaceStatusEventForNamespace:withClient:]";
                v63 = 2112;
                v64 = v38;
                _os_log_error_impl(&dword_229282000, v33, OS_LOG_TYPE_ERROR, "%s Missing version info for asset %@", buf, 0x16u);

              }
            }

            v18 = v56;
          }
        }

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
    }
    while (v17);
  }

  return v55;
}

+ (id)_constructSelfAssetSet:(id)a3 storeManager:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
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
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  id obj;
  uint64_t v52;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  id v65;
  _QWORD v66[3];

  v66[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BE95E98]);
  v54 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v7, "setAssetSetName:", v5);
  objc_msgSend(v6, "getSystemAssetSetUsages:", v5);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    v65 = v5;
    v66[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, &v65, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  +[UAFAssetSetManager sharedManager](UAFAssetSetManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "retrieveAssetSet:usages:", v5, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v45 = v9;
    v46 = v6;
    v48 = v5;
    objc_msgSend(v12, "assetSetIdForSELF:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAssetSetId:", v13);

    v44 = v12;
    objc_msgSend(v12, "autoAssetSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "getMAAutoAssetDownloadErrorsSync");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = v15;
    v50 = v10;
    if (objc_msgSend(v15, "count"))
    {
      v16 = (void *)objc_opt_new();
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v17 = v15;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v60;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v60 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
            v23 = (void *)objc_opt_new();
            objc_msgSend(v23, "setMobileAssetDownloadErrorCode:", objc_msgSend(v22, "unsignedIntValue"));
            objc_msgSend(v23, "setTimesOccurred:", objc_msgSend(v17, "countForObject:", v22));
            objc_msgSend(v16, "addObject:", v23);

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
        }
        while (v19);
      }

      objc_msgSend(v7, "setMobileAssetDownloadErrorCodeFrequencys:", v16);
      v10 = v50;
    }
    v47 = v7;
    +[UAFAssetSetManager getSystemUsageAssets:](UAFAssetSetManager, "getSystemUsageAssets:", v10);
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    if (v24)
    {
      v25 = v24;
      v52 = *(_QWORD *)v56;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v56 != v52)
            objc_enumerationMutation(obj);
          v27 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
          v28 = objc_alloc_init(MEMORY[0x24BE95E88]);
          objc_msgSend(v27, "name");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setAssetName:", v29);

          objc_msgSend(v27, "metadata");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("com.apple.UnifiedAssetFramework.Source"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setAssetSource:", objc_msgSend(a1, "_getAssetSource:", v31));

          LODWORD(v31) = objc_msgSend(v28, "assetSource");
          objc_msgSend(v27, "metadata");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v32;
          if ((_DWORD)v31 == 4)
            v34 = CFSTR("AssetVersion");
          else
            v34 = CFSTR("version");
          objc_msgSend(v32, "objectForKeyedSubscript:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setAssetVersion:", v35);

          objc_msgSend(v27, "metadata");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("com.apple.UnifiedAssetFramework.AssetId"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setAssetSpecifier:", v37);

          objc_msgSend(v27, "metadata");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("com.apple.UnifiedAssetFramework.ReportedDownloadSize"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setAssetDownloadSizeInBytes:", objc_msgSend(v39, "longLongValue"));

          objc_msgSend(v27, "metadata");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("com.apple.UnifiedAssetFramework.UnarchivedSize"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setAssetUnarchivedSizeInBytes:", objc_msgSend(v41, "longLongValue"));

          objc_msgSend(v27, "location");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setIsAssetPathValid:", v42 != 0);

          objc_msgSend(v54, "addObject:", v28);
        }
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      }
      while (v25);
    }

    v7 = v47;
    v5 = v48;
    v9 = v45;
    v6 = v46;
    v10 = v50;
    v12 = v44;
  }
  objc_msgSend(v7, "setAssets:", v54);

  return v7;
}

+ (void)logUAFAssetSetDailyStatus:(id)a3 assetSetArrived:(BOOL)a4
{
  _BOOL4 v4;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = a4;
    v6 = (objc_class *)MEMORY[0x24BE95A10];
    v7 = a3;
    v8 = objc_alloc_init(v6);
    v9 = objc_alloc_init(MEMORY[0x24BE95EA0]);
    objc_msgSend(v9, "setUafAssetSets:", v7);

    objc_msgSend(v8, "addAssetSetStatus:", v9);
    if (v4)
      v10 = 3;
    else
      v10 = 4;
    objc_msgSend(v8, "setStatusReason:", v10);
    objc_msgSend(a1, "_emitAssetDailyStatusEvent:", v8);
    UAFGetLogCategory((id *)&UAFLogContextInstrumentation);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 136315138;
      v13 = "+[UAFInstrumentationProvider logUAFAssetSetDailyStatus:assetSetArrived:]";
      _os_log_impl(&dword_229282000, v11, OS_LOG_TYPE_INFO, "%s Emitted SADAvailableAssetDailyStatus message for asset sets", (uint8_t *)&v12, 0xCu);
    }

  }
}

+ (void)logAvailableAssetDailyStatus
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint8_t v29[128];
  uint8_t buf[4];
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  UAFGetLogCategory((id *)&UAFLogContextInstrumentation);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "+[UAFInstrumentationProvider logAvailableAssetDailyStatus]";
    _os_log_impl(&dword_229282000, v3, OS_LOG_TYPE_DEFAULT, "%s Logging asset daily status.", buf, 0xCu);
  }

  v4 = objc_alloc_init(MEMORY[0x24BE95A10]);
  _MapTrialProjectsToNamespacesFromConfig();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = v5;
    v18 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BEBA908], "clientWithIdentifier:", objc_msgSend(v8, "intValue", v18));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(obj, "objectForKey:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v21;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v21 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(a1, "_constructNamespaceStatusEventForNamespace:withClient:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "intValue"), v9);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "addNamespaceStatus:", v15);

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v12);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v6);
  }
  objc_msgSend(a1, "logSubscriptionsStatus");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAssetSetStatus:", v16);
  objc_msgSend(v4, "setStatusReason:", 1);
  objc_msgSend(a1, "_emitAssetDailyStatusEvent:", v4);
  UAFGetLogCategory((id *)&UAFLogContextInstrumentation);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "+[UAFInstrumentationProvider logAvailableAssetDailyStatus]";
    _os_log_impl(&dword_229282000, v17, OS_LOG_TYPE_INFO, "%s Emitted scheduled SADAvailableAssetDailyStatus message", buf, 0xCu);
  }

}

+ (void)_emitAssetDailyStatusEvent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (+[UAFCommonUtilities isAssistantEnabled](UAFCommonUtilities, "isAssistantEnabled")
    || +[UAFCommonUtilities isDictationEnabled](UAFCommonUtilities, "isDictationEnabled"))
  {
    v4 = objc_alloc_init(MEMORY[0x24BE95A18]);
    objc_msgSend(v4, "setAvailableAssetDailyStatus:", v12);
    objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "emitMessage:", v4);
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x24BE95E90]);
    objc_msgSend(v4, "setAvailableAssetDailyStatus:", v12);
    objc_msgSend(a1, "getDeviceMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDeviceMetadata:", v6);

    v5 = objc_alloc_init(MEMORY[0x24BE95EC8]);
    objc_msgSend(v5, "setUafAssetDailyStatus:", v4);
    v7 = objc_alloc_init(MEMORY[0x24BE95ED0]);
    v8 = objc_alloc(MEMORY[0x24BE95C78]);
    v9 = (void *)objc_opt_new();
    v10 = (void *)objc_msgSend(v8, "initWithNSUUID:", v9);
    objc_msgSend(v7, "setUafId:", v10);

    objc_msgSend(v5, "setEventMetadata:", v7);
    objc_msgSend(v5, "wrapAsAnyEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "logAvailableAssetDailyStatusWithFeedbackLogger:completion:", v11, &__block_literal_global_211);

  }
}

void __57__UAFInstrumentationProvider__emitAssetDailyStatusEvent___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  UAFGetLogCategory((id *)&UAFLogContextInstrumentation);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = "+[UAFInstrumentationProvider _emitAssetDailyStatusEvent:]_block_invoke";
      v7 = 2112;
      v8 = v2;
      _os_log_error_impl(&dword_229282000, v4, OS_LOG_TYPE_ERROR, "%s Upload of UAFSchemaUAFClientEvent to Feedback logger failed with error: %@", (uint8_t *)&v5, 0x16u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "+[UAFInstrumentationProvider _emitAssetDailyStatusEvent:]_block_invoke";
    _os_log_impl(&dword_229282000, v4, OS_LOG_TYPE_INFO, "%s UAFSchemaUAFClientEvent uploaded to Feedback logger", (uint8_t *)&v5, 0xCu);
  }

}

+ (void)logAvailableAssetDailyStatusWithFeedbackLogger:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = a3;
  UAFGetLogCategory((id *)&UAFLogContextInstrumentation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "+[UAFInstrumentationProvider logAvailableAssetDailyStatusWithFeedbackLogger:completion:]";
    _os_log_impl(&dword_229282000, v7, OS_LOG_TYPE_INFO, "%s Using Feedback logger", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BE30DD8], "sharedLoggerWithPersistenceConfiguration:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __88__UAFInstrumentationProvider_logAvailableAssetDailyStatusWithFeedbackLogger_completion___block_invoke;
  v12[3] = &unk_24F1F74E8;
  v13 = v5;
  v11 = v5;
  objc_msgSend(v8, "reportSiriInstrumentationEvent:forBundleID:completion:", v6, v10, v12);

}

uint64_t __88__UAFInstrumentationProvider_logAvailableAssetDailyStatusWithFeedbackLogger_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)getDeviceMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  objc_msgSend(a1, "getPersistedDeviceId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDeviceId:", v4);

  +[UAFCommonUtilities mobileGestaltQuery:](UAFCommonUtilities, "mobileGestaltQuery:", CFSTR("ProductType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDeviceType:", v5);

  +[UAFCommonUtilities mobileGestaltQuery:](UAFCommonUtilities, "mobileGestaltQuery:", CFSTR("BuildVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSystemBuild:", v6);

  +[UAFCommonUtilities systemLanguageLocale](UAFCommonUtilities, "systemLanguageLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInputLocale:", objc_msgSend(MEMORY[0x24BE95CA8], "convertLanguageCodeToSchemaLocale:", v7));
  objc_msgSend(v3, "setProgramCode:", 1);
  objc_msgSend(v3, "setNanoSecondsSinceLastBoot:", mach_absolute_time());

  return v3;
}

+ (id)getPersistedDeviceId
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "defaultDeviceId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BE95C78]);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v2);
  v5 = (void *)objc_msgSend(v3, "initWithNSUUID:", v4);

  return v5;
}

+ (id)logSubscriptionsStatus
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t m;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t n;
  void *v61;
  NSObject *v62;
  void *v64;
  void *v65;
  id v66;
  id obj;
  uint64_t v68;
  id v69;
  id v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  void *v74;
  id v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  id v85;
  id v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  NSObject *v92;
  uint64_t v93;
  id v94;
  void *v95;
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
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  uint8_t v128[128];
  uint8_t buf[4];
  const char *v130;
  __int16 v131;
  void *v132;
  __int16 v133;
  void *v134;
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  _BYTE v140[128];
  _BYTE v141[128];
  uint64_t v142;

  v142 = *MEMORY[0x24BDAC8D0];
  v66 = objc_alloc_init(MEMORY[0x24BE95EA0]);
  v70 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v69 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  +[UAFSubscriptionStoreManager defaultManager](UAFSubscriptionStoreManager, "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v4;
  objc_msgSend(v4, "getSubscribers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UAFGetLogCategory((id *)&UAFLogContextInstrumentation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v130 = "+[UAFInstrumentationProvider logSubscriptionsStatus]";
    v131 = 2114;
    v132 = v6;
    _os_log_impl(&dword_229282000, v7, OS_LOG_TYPE_INFO, "%s The subscribers on this device: %{public}@", buf, 0x16u);
  }

  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  v127 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v124, v141, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v125;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v125 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v74, "getSubscriptions:", *(_QWORD *)(*((_QWORD *)&v124 + 1) + 8 * i));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObjectsFromArray:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v124, v141, 16);
    }
    while (v11);
  }

  v84 = v5;
  v65 = v8;
  objc_msgSend(v5, "applySubscriptions:", v8);
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v120, v140, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v121;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v121 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * j);
        objc_msgSend(a1, "_constructSelfAssetSet:storeManager:", v20, v74);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "addObject:", v21);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v69, "count") - 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v120, v140, 16);
    }
    while (v17);
  }

  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  obj = v9;
  v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v139, 16);
  if (v71)
  {
    v68 = *(_QWORD *)v117;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v117 != v68)
          objc_enumerationMutation(obj);
        v73 = v23;
        v24 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * v23);
        v72 = objc_alloc_init(MEMORY[0x24BE95EB8]);
        objc_msgSend(v72, "setSubscriberName:", v24);
        objc_msgSend(v74, "getSubscriptions:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v112 = 0u;
        v113 = 0u;
        v114 = 0u;
        v115 = 0u;
        v75 = v25;
        v78 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v112, v138, 16);
        if (v78)
        {
          v76 = *(_QWORD *)v113;
          do
          {
            v26 = 0;
            do
            {
              if (*(_QWORD *)v113 != v76)
                objc_enumerationMutation(v75);
              v79 = v26;
              v27 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * v26);
              v28 = objc_alloc_init(MEMORY[0x24BE95EA8]);
              objc_msgSend(v27, "name");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v80 = v28;
              objc_msgSend(v28, "setSubscriptionName:", v29);

              v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
              v31 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
              v108 = 0u;
              v109 = 0u;
              v110 = 0u;
              v111 = 0u;
              v95 = v27;
              objc_msgSend(v27, "assetSets");
              v85 = (id)objc_claimAutoreleasedReturnValue();
              v89 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v108, v137, 16);
              if (v89)
              {
                v87 = *(_QWORD *)v109;
                do
                {
                  v32 = 0;
                  do
                  {
                    if (*(_QWORD *)v109 != v87)
                      objc_enumerationMutation(v85);
                    v93 = v32;
                    v33 = *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * v32);
                    objc_msgSend(v95, "assetSets");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    v91 = v33;
                    objc_msgSend(v34, "objectForKeyedSubscript:", v33);
                    v35 = (void *)objc_claimAutoreleasedReturnValue();

                    v106 = 0u;
                    v107 = 0u;
                    v104 = 0u;
                    v105 = 0u;
                    v36 = v35;
                    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v104, v136, 16);
                    if (v37)
                    {
                      v38 = v37;
                      v39 = *(_QWORD *)v105;
                      do
                      {
                        for (k = 0; k != v38; ++k)
                        {
                          if (*(_QWORD *)v105 != v39)
                            objc_enumerationMutation(v36);
                          v41 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * k);
                          v42 = objc_alloc_init(MEMORY[0x24BE95EB0]);
                          objc_msgSend(v42, "setUsageName:", v41);
                          objc_msgSend(v36, "objectForKeyedSubscript:", v41);
                          v43 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v42, "setUsageValue:", v43);

                          objc_msgSend(v31, "addObject:", v42);
                        }
                        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v104, v136, 16);
                      }
                      while (v38);
                    }

                    objc_msgSend(v3, "objectForKeyedSubscript:", v91);
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "addObject:", v44);

                    v32 = v93 + 1;
                  }
                  while (v93 + 1 != v89);
                  v89 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v108, v137, 16);
                }
                while (v89);
              }

              objc_msgSend(v80, "setAssetSetUsages:", v31);
              v88 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
              v100 = 0u;
              v101 = 0u;
              v102 = 0u;
              v103 = 0u;
              objc_msgSend(v95, "usageAliases");
              v83 = (id)objc_claimAutoreleasedReturnValue();
              v90 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v100, v135, 16);
              if (v90)
              {
                v86 = *(id *)v101;
                do
                {
                  for (m = 0; m != v90; ++m)
                  {
                    if (*(id *)v101 != v86)
                      objc_enumerationMutation(v83);
                    v46 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * m);
                    v47 = objc_alloc_init(MEMORY[0x24BE95EC0]);
                    objc_msgSend(v47, "setAliasName:", v46);
                    objc_msgSend(v95, "usageAliases");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v48, "objectForKeyedSubscript:", v46);
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v47, "setAliasValue:", v49);

                    objc_msgSend(v88, "addObject:", v47);
                    objc_msgSend(v95, "usageAliases");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v50, "objectForKeyedSubscript:", v46);
                    v51 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v84, "getUsageAlias:", v46);
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    v53 = v52;
                    if (v52)
                    {
                      v94 = v47;
                      objc_msgSend(v52, "values");
                      v54 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v54, "objectForKeyedSubscript:", v51);
                      v55 = objc_claimAutoreleasedReturnValue();

                      v92 = v55;
                      if (-[NSObject count](v55, "count"))
                      {
                        v98 = 0u;
                        v99 = 0u;
                        v96 = 0u;
                        v97 = 0u;
                        v56 = v55;
                        v57 = -[NSObject countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v96, v128, 16);
                        if (v57)
                        {
                          v58 = v57;
                          v81 = v53;
                          v82 = v51;
                          v59 = *(_QWORD *)v97;
                          do
                          {
                            for (n = 0; n != v58; ++n)
                            {
                              if (*(_QWORD *)v97 != v59)
                                objc_enumerationMutation(v56);
                              objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * n));
                              v61 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v30, "addObject:", v61);

                            }
                            v58 = -[NSObject countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v96, v128, 16);
                          }
                          while (v58);
                          v47 = v94;
                          v53 = v81;
                          v51 = v82;
                          goto LABEL_61;
                        }
                      }
                      else
                      {
                        UAFGetLogCategory((id *)&UAFLogContextInstrumentation);
                        v56 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 136315650;
                          v130 = "+[UAFInstrumentationProvider logSubscriptionsStatus]";
                          v131 = 2114;
                          v132 = v46;
                          v133 = 2114;
                          v134 = v51;
                          _os_log_error_impl(&dword_229282000, v56, OS_LOG_TYPE_ERROR, "%s Could not process subscription for usage alias %{public}@ with value %{public}@", buf, 0x20u);
                        }
                      }
                      v47 = v94;
LABEL_61:

                      v62 = v92;
                      goto LABEL_62;
                    }
                    UAFGetLogCategory((id *)&UAFLogContextInstrumentation);
                    v62 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136315394;
                      v130 = "+[UAFInstrumentationProvider logSubscriptionsStatus]";
                      v131 = 2114;
                      v132 = v46;
                      _os_log_error_impl(&dword_229282000, v62, OS_LOG_TYPE_ERROR, "%s Could not process subscription for usage alias %{public}@", buf, 0x16u);
                    }
LABEL_62:

                  }
                  v90 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v100, v135, 16);
                }
                while (v90);
              }

              objc_msgSend(v80, "setUsageAliases:", v88);
              objc_msgSend(v80, "setAssetSetIndices:", v30);
              objc_msgSend(v77, "addObject:", v80);

              v26 = v79 + 1;
            }
            while (v79 + 1 != v78);
            v78 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v112, v138, 16);
          }
          while (v78);
        }

        objc_msgSend(v72, "setSubscriptions:", v77);
        objc_msgSend(v70, "addObject:", v72);

        v23 = v73 + 1;
      }
      while (v73 + 1 != v71);
      v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v139, 16);
    }
    while (v71);
  }

  objc_msgSend(v66, "setUafAssetSets:", v69);
  objc_msgSend(v66, "setUafAssetSubscriptions:", v70);

  return v66;
}

+ (void)logDownloadTriggerEventWithLanguage:(id)a3 hasExistingAssets:(BOOL)a4 retryCount:(unsigned int)a5
{
  uint64_t v5;
  _BOOL8 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(v7, "uppercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("LOCALE_%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v10;
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_UNKNOWN_LOCALE")) & 1) != 0)
  {
    v12 = 0;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_AR_AE")) & 1) != 0)
  {
    v12 = 1;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_AR_SA")) & 1) != 0)
  {
    v12 = 2;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_CA_ES")) & 1) != 0)
  {
    v12 = 3;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_CS_CZ")) & 1) != 0)
  {
    v12 = 4;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_DA_DK")) & 1) != 0)
  {
    v12 = 5;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_DE_AT")) & 1) != 0)
  {
    v12 = 6;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_DE_CH")) & 1) != 0)
  {
    v12 = 7;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_DE_DE")) & 1) != 0)
  {
    v12 = 8;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_EL_GR")) & 1) != 0)
  {
    v12 = 9;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_EN_AE")) & 1) != 0)
  {
    v12 = 10;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_EN_AU")) & 1) != 0)
  {
    v12 = 11;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_EN_CA")) & 1) != 0)
  {
    v12 = 12;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_EN_GB")) & 1) != 0)
  {
    v12 = 13;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_EN_ID")) & 1) != 0)
  {
    v12 = 14;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_EN_IE")) & 1) != 0)
  {
    v12 = 15;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_EN_IN")) & 1) != 0)
  {
    v12 = 16;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_EN_MY")) & 1) != 0)
  {
    v12 = 17;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_EN_NZ")) & 1) != 0)
  {
    v12 = 18;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_EN_PH")) & 1) != 0)
  {
    v12 = 19;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_EN_SG")) & 1) != 0)
  {
    v12 = 20;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_EN_SA")) & 1) != 0)
  {
    v12 = 21;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_EN_US")) & 1) != 0)
  {
    v12 = 22;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_EN_ZA")) & 1) != 0)
  {
    v12 = 23;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_ES_CL")) & 1) != 0)
  {
    v12 = 24;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_ES_CO")) & 1) != 0)
  {
    v12 = 25;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_ES_ES")) & 1) != 0)
  {
    v12 = 26;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_ES_MX")) & 1) != 0)
  {
    v12 = 27;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_ES_US")) & 1) != 0)
  {
    v12 = 28;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_FI_FI")) & 1) != 0)
  {
    v12 = 29;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_FR_BE")) & 1) != 0)
  {
    v12 = 30;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_FR_CA")) & 1) != 0)
  {
    v12 = 31;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_FR_CH")) & 1) != 0)
  {
    v12 = 32;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_FR_FR")) & 1) != 0)
  {
    v12 = 33;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_HE_IL")) & 1) != 0)
  {
    v12 = 34;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_HI_IN")) & 1) != 0)
  {
    v12 = 35;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_HR_HR")) & 1) != 0)
  {
    v12 = 36;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_HU_HU")) & 1) != 0)
  {
    v12 = 37;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_ID_ID")) & 1) != 0)
  {
    v12 = 38;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_IT_CH")) & 1) != 0)
  {
    v12 = 39;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_IT_IT")) & 1) != 0)
  {
    v12 = 40;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_JA_JP")) & 1) != 0)
  {
    v12 = 41;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_KO_KR")) & 1) != 0)
  {
    v12 = 42;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_MS_MY")) & 1) != 0)
  {
    v12 = 43;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_NB_NO")) & 1) != 0)
  {
    v12 = 44;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_NL_BE")) & 1) != 0)
  {
    v12 = 45;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_NL_NL")) & 1) != 0)
  {
    v12 = 46;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_PL_PL")) & 1) != 0)
  {
    v12 = 47;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_PT_BR")) & 1) != 0)
  {
    v12 = 48;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_PT_PT")) & 1) != 0)
  {
    v12 = 49;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_RO_RO")) & 1) != 0)
  {
    v12 = 50;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_RU_RU")) & 1) != 0)
  {
    v12 = 51;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_SK_SK")) & 1) != 0)
  {
    v12 = 52;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_SV_SE")) & 1) != 0)
  {
    v12 = 53;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_TH_TH")) & 1) != 0)
  {
    v12 = 54;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_TR_TR")) & 1) != 0)
  {
    v12 = 55;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_UK_UA")) & 1) != 0)
  {
    v12 = 56;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_VI_VN")) & 1) != 0)
  {
    v12 = 57;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_WUU_CN")) & 1) != 0)
  {
    v12 = 58;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_YUE_CN")) & 1) != 0)
  {
    v12 = 59;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_ZH_CN")) & 1) != 0)
  {
    v12 = 60;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_ZH_HK")) & 1) != 0)
  {
    v12 = 61;
  }
  else if (objc_msgSend(v11, "isEqualToString:", CFSTR("LOCALE_ZH_TW")))
  {
    v12 = 62;
  }
  else
  {
    v12 = 0;
  }

  v13 = objc_alloc_init(MEMORY[0x24BE95A20]);
  objc_msgSend(v13, "setLocale:", v12);
  objc_msgSend(v13, "setExistingAssets:", v6);
  objc_msgSend(v13, "setRetryCount:", v5);
  v14 = objc_alloc_init(MEMORY[0x24BE95A18]);
  objc_msgSend(v14, "setImmediateDownloadTriggered:", v13);
  UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v18 = "+[UAFInstrumentationProvider logDownloadTriggerEventWithLanguage:hasExistingAssets:retryCount:]";
    v19 = 2114;
    v20 = v7;
    v21 = 1024;
    v22 = v6;
    v23 = 1024;
    v24 = v5;
    _os_log_impl(&dword_229282000, v15, OS_LOG_TYPE_DEFAULT, "%s #settings Emitting SADSchemaSADImmediateDownloadTriggered event: language=%{public}@ hasExistingAssets=%u retryCount=%d", buf, 0x22u);
  }

  objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "emitMessage:", v14);

}

@end
