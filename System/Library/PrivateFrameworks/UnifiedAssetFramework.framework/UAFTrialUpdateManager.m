@implementation UAFTrialUpdateManager

+ (id)trialClientWithProject:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(MEMORY[0x24BEBA9A0], "projectIdFromName:", v3);
  if (!(_DWORD)v4 || (v5 = v4, (TRIProject_ProjectId_IsValidValue() & 1) == 0))
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "+[UAFTrialUpdateManager trialClientWithProject:]";
      v13 = 2114;
      v14 = v3;
      _os_log_error_impl(&dword_229282000, v7, OS_LOG_TYPE_ERROR, "%s Could not find TRIProject for %{public}@", (uint8_t *)&v11, 0x16u);
    }
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BEBA908], "clientWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "+[UAFTrialUpdateManager trialClientWithProject:]";
      v13 = 2114;
      v14 = v3;
      _os_log_error_impl(&dword_229282000, v10, OS_LOG_TYPE_ERROR, "%s Could not create trial client for project %{public}@", (uint8_t *)&v11, 0x16u);
    }

    v7 = 0;
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  v7 = v6;
  v8 = v7;
LABEL_8:

  return v8;
}

+ (id)getTrialFactors:(id)a3 configurationManager:(id)a4 includeAllAssetSets:(BOOL)a5 noRemovalNamespaces:(id *)a6 assetSetNamespaces:(id *)a7
{
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  const __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  BOOL v26;
  uint64_t v27;
  void *v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  id v75;
  void *v76;
  void *v77;
  NSObject *v78;
  uint64_t v79;
  void *v82;
  uint64_t v83;
  id v84;
  _BOOL4 v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  NSObject *obj;
  id obja;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
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
  __int128 v128;
  __int128 v129;
  _BYTE v130[128];
  uint8_t v131[128];
  uint8_t buf[4];
  const char *v133;
  __int16 v134;
  uint64_t v135;
  __int16 v136;
  void *v137;
  _BYTE v138[128];
  _BYTE v139[128];
  _BYTE v140[128];
  uint64_t v141;

  v7 = a5;
  v141 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  v82 = v9;
  if (!v9 && !v7)
  {
    v12 = 0;
    goto LABEL_99;
  }
  if (!v10)
  {
    +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v102 = (id)objc_claimAutoreleasedReturnValue();
  +[UAFTrialConversions entitledTrialNamespaceNames](UAFTrialConversions, "entitledTrialNamespaceNames");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = 0u;
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v126, v140, 16);
  v86 = v11;
  if (!v14)
  {
    v12 = 0;
    goto LABEL_56;
  }
  v15 = v14;
  v12 = 0;
  v16 = *(_QWORD *)v127;
  v17 = CFSTR("TrialProject");
  v18 = CFSTR("TrialNamespace");
  v85 = v7;
  v83 = *(_QWORD *)v127;
  v84 = v13;
  do
  {
    v19 = 0;
    v87 = v15;
    do
    {
      if (*(_QWORD *)v127 != v16)
      {
        v20 = v19;
        objc_enumerationMutation(v13);
        v19 = v20;
      }
      v88 = v19;
      v100 = *(_QWORD *)(*((_QWORD *)&v126 + 1) + 8 * v19);
      objc_msgSend(v11, "getAssetSet:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        v23 = v12;
        v94 = v21;
        objc_msgSend(v21, "autoAssetType");
        v24 = objc_claimAutoreleasedReturnValue();
        if (!v24)
          goto LABEL_15;
        v25 = (void *)v24;
        if (objc_msgSend(v94, "isTrialAvailable"))
        {
          v26 = +[UAFAutoAssetManager autoAssetExistsWithEntries:](UAFAutoAssetManager, "autoAssetExistsWithEntries:", v100);

          if (v26)
            goto LABEL_48;
LABEL_15:
          v124 = 0u;
          v125 = 0u;
          v122 = 0u;
          v123 = 0u;
          objc_msgSend(v13, "objectForKeyedSubscript:", v100);
          obj = objc_claimAutoreleasedReturnValue();
          v96 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v122, v139, 16);
          if (v96)
          {
            v92 = *(_QWORD *)v123;
            v12 = v23;
            v22 = v94;
            do
            {
              v27 = 0;
              do
              {
                if (*(_QWORD *)v123 != v92)
                  objc_enumerationMutation(obj);
                v103 = v12;
                v98 = v27;
                objc_msgSend(v22, "getTrialAssets:", *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * v27));
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v118 = 0u;
                v119 = 0u;
                v120 = 0u;
                v121 = 0u;
                v108 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v118, v138, 16);
                if (v108)
                {
                  v105 = *(_QWORD *)v119;
                  do
                  {
                    for (i = 0; i != v108; ++i)
                    {
                      if (*(_QWORD *)v119 != v105)
                        objc_enumerationMutation(v28);
                      v30 = *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * i);
                      objc_msgSend(v28, "objectForKeyedSubscript:", v30);
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v31, "objectForKeyedSubscript:", v17);
                      v32 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v28, "objectForKeyedSubscript:", v30);
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v33, "objectForKeyedSubscript:", v18);
                      v34 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v28, "objectForKeyedSubscript:", v30);
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("TrialFactor"));
                      v36 = (void *)objc_claimAutoreleasedReturnValue();

                      if ((objc_msgSend(v107, "containsObject:", v34) & 1) != 0)
                      {
                        if (v36)
                        {
                          v37 = v18;
                          v38 = v17;
                          objc_msgSend(v102, "objectForKeyedSubscript:", v100);
                          v39 = (void *)objc_claimAutoreleasedReturnValue();

                          if (!v39)
                          {
                            objc_msgSend(MEMORY[0x24BDBCEF0], "set");
                            v40 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v102, "setObject:forKeyedSubscript:", v40, v100);

                          }
                          objc_msgSend(v102, "objectForKeyedSubscript:", v100);
                          v41 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v41, "addObject:", v34);

                          v42 = v103;
                          if (!v103)
                            v42 = (void *)objc_opt_new();
                          objc_msgSend(v42, "objectForKeyedSubscript:", v32);
                          v43 = (void *)objc_claimAutoreleasedReturnValue();

                          if (!v43)
                          {
                            v44 = (void *)objc_opt_new();
                            objc_msgSend(v42, "setObject:forKeyedSubscript:", v44, v32);

                          }
                          objc_msgSend(v42, "objectForKeyedSubscript:", v32);
                          v45 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v45, "objectForKeyedSubscript:", v34);
                          v46 = (void *)objc_claimAutoreleasedReturnValue();

                          if (!v46)
                          {
                            v47 = (void *)objc_opt_new();
                            objc_msgSend(v42, "objectForKeyedSubscript:", v32);
                            v48 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v48, "setObject:forKeyedSubscript:", v47, v34);

                          }
                          v103 = v42;
                          objc_msgSend(v42, "objectForKeyedSubscript:", v32);
                          v49 = objc_claimAutoreleasedReturnValue();
                          -[NSObject objectForKeyedSubscript:](v49, "objectForKeyedSubscript:", v34);
                          v50 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v50, "addObject:", v36);

                          v17 = v38;
                          v18 = v37;
                        }
                        else
                        {
                          UAFGetLogCategory((id *)&UAFLogContextClient);
                          v49 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 136315394;
                            v133 = "+[UAFTrialUpdateManager getTrialFactors:configurationManager:includeAllAssetSets:noRe"
                                   "movalNamespaces:assetSetNamespaces:]";
                            v134 = 2114;
                            v135 = v30;
                            _os_log_debug_impl(&dword_229282000, v49, OS_LOG_TYPE_DEBUG, "%s Not including %{public}@ as its trial factor isn't specified", buf, 0x16u);
                          }
                        }
                      }
                      else
                      {
                        UAFGetLogCategory((id *)&UAFLogContextClient);
                        v49 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 136315650;
                          v133 = "+[UAFTrialUpdateManager getTrialFactors:configurationManager:includeAllAssetSets:noRemo"
                                 "valNamespaces:assetSetNamespaces:]";
                          v134 = 2114;
                          v135 = v30;
                          v136 = 2114;
                          v137 = v34;
                          _os_log_impl(&dword_229282000, v49, OS_LOG_TYPE_DEFAULT, "%s Not including %{public}@ as its trial Namespace %{public}@ isn't entitled", buf, 0x20u);
                        }
                      }

                    }
                    v108 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v118, v138, 16);
                  }
                  while (v108);
                }

                v27 = v98 + 1;
                v12 = v103;
                v22 = v94;
              }
              while (v98 + 1 != v96);
              v96 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v122, v139, 16);
            }
            while (v96);
            v11 = v86;
            v15 = v87;
            v7 = v85;
            v16 = v83;
            v13 = v84;
            goto LABEL_52;
          }
          v12 = v23;
        }
        else
        {

LABEL_48:
          UAFGetLogCategory((id *)&UAFLogContextClient);
          obj = objc_claimAutoreleasedReturnValue();
          v12 = v23;
          if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v133 = "+[UAFTrialUpdateManager getTrialFactors:configurationManager:includeAllAssetSets:noRemovalNamespaces:"
                   "assetSetNamespaces:]";
            v134 = 2114;
            v135 = v100;
            _os_log_debug_impl(&dword_229282000, obj, OS_LOG_TYPE_DEBUG, "%s Not generating trial factors for asset set %{public}@ as it using auto assets", buf, 0x16u);
          }
        }
        v22 = v94;
        goto LABEL_52;
      }
      UAFGetLogCategory((id *)&UAFLogContextClient);
      obj = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v133 = "+[UAFTrialUpdateManager getTrialFactors:configurationManager:includeAllAssetSets:noRemovalNamespaces:asse"
               "tSetNamespaces:]";
        v134 = 2114;
        v135 = v100;
        _os_log_error_impl(&dword_229282000, obj, OS_LOG_TYPE_ERROR, "%s Could get trial assets for asset set %{public}@", buf, 0x16u);
      }
LABEL_52:

      v19 = v88 + 1;
    }
    while (v88 + 1 != v15);
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v126, v140, 16);
  }
  while (v15);
LABEL_56:

  if (!v7)
  {
    v51 = v102;
    goto LABEL_96;
  }
  objc_msgSend(v11, "getAllAssetSets");
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  obja = (id)objc_claimAutoreleasedReturnValue();
  v51 = v102;
  v95 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v114, v131, 16);
  if (!v95)
  {
    v104 = 0;
    goto LABEL_95;
  }
  v104 = 0;
  v93 = *(_QWORD *)v115;
  while (2)
  {
    v52 = 0;
    while (2)
    {
      if (*(_QWORD *)v115 != v93)
        objc_enumerationMutation(obja);
      v97 = v52;
      v53 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * v52);
      objc_msgSend(v53, "getTrialAssets:", 0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = 0u;
      v111 = 0u;
      v112 = 0u;
      v113 = 0u;
      v109 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v110, v130, 16);
      if (v109)
      {
        v106 = v53;
        v55 = *(_QWORD *)v111;
        v99 = v54;
        v101 = *(_QWORD *)v111;
        do
        {
          v56 = 0;
          do
          {
            if (*(_QWORD *)v111 != v55)
              objc_enumerationMutation(v54);
            v57 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * v56);
            objc_msgSend(v54, "objectForKeyedSubscript:", v57);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("TrialProject"));
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v54, "objectForKeyedSubscript:", v57);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("TrialNamespace"));
            v61 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v107, "containsObject:", v61) & 1) == 0)
            {
              UAFGetLogCategory((id *)&UAFLogContextClient);
              v78 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                v133 = "+[UAFTrialUpdateManager getTrialFactors:configurationManager:includeAllAssetSets:noRemovalNamespa"
                       "ces:assetSetNamespaces:]";
                v134 = 2114;
                v135 = v57;
                v136 = 2114;
                v137 = v61;
                _os_log_impl(&dword_229282000, v78, OS_LOG_TYPE_DEFAULT, "%s Not including %{public}@ as its trial Namespace %{public}@ isn't entitled", buf, 0x20u);
              }
LABEL_85:

              goto LABEL_86;
            }
            objc_msgSend(v106, "name");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "objectForKeyedSubscript:", v62);
            v63 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v63)
            {
              objc_msgSend(MEMORY[0x24BDBCEF0], "set");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "name");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "setObject:forKeyedSubscript:", v64, v65);

            }
            objc_msgSend(v106, "name");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "objectForKeyedSubscript:", v66);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "addObject:", v61);

            if (!v12)
              v12 = (void *)objc_opt_new();
            objc_msgSend(v12, "objectForKeyedSubscript:", v59);
            v68 = (void *)objc_claimAutoreleasedReturnValue();

            v54 = v99;
            if (!v68)
            {
              v69 = (void *)objc_opt_new();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v69, v59);

            }
            objc_msgSend(v12, "objectForKeyedSubscript:", v59);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "objectForKeyedSubscript:", v61);
            v71 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v71)
            {
              v72 = (void *)objc_opt_new();
              objc_msgSend(v12, "objectForKeyedSubscript:", v59);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "setObject:forKeyedSubscript:", v72, v61);

            }
            v74 = objc_msgSend(v106, "disableAssetRemoval");
            if (a6)
            {
              v75 = v104;
              v55 = v101;
              if (!v74)
                goto LABEL_86;
              if (!v104)
              {
                v75 = objc_retainAutorelease((id)objc_opt_new());
                *a6 = v75;
              }
              objc_msgSend(v75, "objectForKeyedSubscript:", v59);
              v76 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v76)
              {
                v77 = (void *)objc_opt_new();
                objc_msgSend(v75, "setObject:forKeyedSubscript:", v77, v59);

              }
              v104 = v75;
              objc_msgSend(v75, "objectForKeyedSubscript:", v59);
              v78 = objc_claimAutoreleasedReturnValue();
              -[NSObject addObject:](v78, "addObject:", v61);
              goto LABEL_85;
            }
            v55 = v101;
LABEL_86:

            ++v56;
          }
          while (v109 != v56);
          v79 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v110, v130, 16);
          v109 = v79;
        }
        while (v79);
      }

      v52 = v97 + 1;
      v51 = v102;
      if (v97 + 1 != v95)
        continue;
      break;
    }
    v95 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v114, v131, 16);
    if (v95)
      continue;
    break;
  }
LABEL_95:

  v11 = v86;
LABEL_96:
  if (a7)
    *a7 = objc_retainAutorelease(v51);

LABEL_99:
  return v12;
}

+ (BOOL)isOnDemand:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "levelOneOfCase") == 101)
  {
    objc_msgSend(v4, "directoryValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "directoryValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isOnDemand") ^ 1;

    }
    else
    {
      LOBYTE(v7) = 1;
    }

  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7 ^ 1;
}

+ (unint64_t)sizeFromLevel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = v3;
  if (!v3 || objc_msgSend(v3, "levelOneOfCase") != 101)
    goto LABEL_6;
  objc_msgSend(v4, "directoryValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "directoryValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "directoryValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "asset");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v9, "size");

      goto LABEL_7;
    }
LABEL_6:
    v5 = 0;
  }
LABEL_7:

  return (unint64_t)v5;
}

+ (BOOL)isSubscribed:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  v3 = a3;
  if (!+[UAFTrialUpdateManager isOnDemand:](UAFTrialUpdateManager, "isOnDemand:", v3))
    goto LABEL_6;
  objc_msgSend(v3, "directoryValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasPath") & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(v3, "directoryValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = 1;
LABEL_7:

  return v8;
}

+ (BOOL)isPresent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  __int128 v8;

  v3 = a3;
  if (+[UAFTrialUpdateManager isSubscribed:](UAFTrialUpdateManager, "isSubscribed:", v3))
  {
    objc_msgSend(v3, "directoryValue", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[UAFCommonUtilities stat:withBuf:error:](UAFCommonUtilities, "stat:withBuf:error:", v5, &v8, 0) == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isRemoveAllowed
{
  void *v2;
  void *v3;
  BOOL v4;

  +[UAFSubscriptionStoreManager defaultManager](UAFSubscriptionStoreManager, "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getSystemConfigurationForKey:", CFSTR("NoRemove"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = !v3 || (objc_msgSend(v3, "isEqualToString:", CFSTR("1")) & 1) == 0;
  return v4;
}

+ (void)getKnownFactors:(id)a3 namespace:(id)a4 knownFactors:(id *)a5 onDemandFactors:(id *)a6
{
  void *v8;
  void *v9;
  void *v10;
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
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "factorLevelsWithNamespaceName:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v26 = a6;
    v9 = (void *)objc_opt_new();
    v10 = (void *)objc_opt_new();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v27 = v8;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v16, "factor");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_msgSend(v16, "factor");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "name");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v20);

            objc_msgSend(v16, "level");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v19) = +[UAFTrialUpdateManager isOnDemand:](UAFTrialUpdateManager, "isOnDemand:", v21);

            if ((_DWORD)v19)
            {
              objc_msgSend(v16, "factor");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "name");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "addObject:", v23);

            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v13);
    }

    v24 = objc_retainAutorelease(v9);
    *a5 = v24;
    v25 = objc_retainAutorelease(v10);
    *v26 = v25;

    v8 = v27;
  }

}

+ (id)getConcurrentQueue
{
  if (_MergedGlobals != -1)
    dispatch_once(&_MergedGlobals, &__block_literal_global_1);
  return (id)qword_2540B1BF8;
}

void __43__UAFTrialUpdateManager_getConcurrentQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("UAFTrialUpdateManager.Concurrent", MEMORY[0x24BDAC9C0]);
  v1 = (void *)qword_2540B1BF8;
  qword_2540B1BF8 = (uint64_t)v0;

}

+ (id)getSerialQueue
{
  if (qword_2540B1C00 != -1)
    dispatch_once(&qword_2540B1C00, &__block_literal_global_190_0);
  return (id)qword_2540B1C08;
}

void __39__UAFTrialUpdateManager_getSerialQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("UAFTrialUpdateManager.Serial", 0);
  v1 = (void *)qword_2540B1C08;
  qword_2540B1C08 = (uint64_t)v0;

}

+ (void)checkForOutOfSpace:(id)a3 updateProgress:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v5 = a4;
  if (v7)
  {
    v6 = objc_msgSend(v7, "code");
    if (v5)
    {
      if (v6 == 4)
        objc_msgSend(v5, "outOfSpaceEncountered");
    }
  }

}

+ (void)updateOnDemandFactors:(id)a3 trialFactors:(id)a4 removeUnneededFactors:(BOOL)a5 expensiveNetworking:(BOOL)a6 updateCount:(unint64_t)a7 storeManager:(id)a8 noRemovalNamespaces:(id)a9 updateProgress:(id)a10 completion:(id)a11
{
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  NSObject *v25;
  BOOL v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  const char *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  uint64_t v42;
  void *v43;
  int v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  _BOOL4 v49;
  void *v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  uint64_t k;
  id v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  NSObject *v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  uint64_t v68;
  NSObject *v69;
  NSObject *v70;
  void *v71;
  NSObject *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t m;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  NSObject *v82;
  id v83;
  id v84;
  id v85;
  _BOOL4 v86;
  id v88;
  id v89;
  uint64_t v90;
  _BOOL4 v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  void *context;
  id v96;
  uint64_t v97;
  void *v98;
  id obj;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  id v103;
  id v104;
  void *v105;
  void *v106;
  id v107;
  _QWORD block[4];
  id v109;
  id v110;
  _QWORD v111[4];
  id v112;
  NSObject *v113;
  _BYTE *v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _QWORD v119[4];
  id v120;
  NSObject *v121;
  id v122;
  _BYTE *v123;
  _QWORD v124[4];
  id v125;
  id v126;
  id v127;
  _QWORD v128[4];
  id v129;
  id v130;
  id v131;
  NSObject *v132;
  _BYTE *v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  id v146;
  id v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  uint8_t v152[128];
  _BYTE buf[24];
  uint64_t v154;
  __int16 v155;
  _BOOL4 v156;
  _BYTE v157[24];
  id v158;
  _BYTE v159[128];
  _BYTE v160[128];
  _BYTE v161[128];
  _BYTE v162[128];
  uint64_t v163;

  v86 = a6;
  v91 = a5;
  v163 = *MEMORY[0x24BDAC8D0];
  v92 = a3;
  v13 = a4;
  v88 = a8;
  v89 = a9;
  v107 = a10;
  v85 = a11;
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNetwo"
                         "rking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v92;
    _os_log_impl(&dword_229282000, v14, OS_LOG_TYPE_DEFAULT, "%s Updating on demand factors in project %{public}@", buf, 0x16u);
  }

  v150 = 0u;
  v151 = 0u;
  v148 = 0u;
  v149 = 0u;
  obj = v13;
  v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v148, v162, 16);
  if (!v93)
  {
    v101 = 0;
    v103 = 0;
    v98 = 0;
    goto LABEL_67;
  }
  v101 = 0;
  v103 = 0;
  v98 = 0;
  v90 = *(_QWORD *)v149;
  do
  {
    v15 = 0;
    do
    {
      if (*(_QWORD *)v149 != v90)
      {
        v16 = v15;
        objc_enumerationMutation(obj);
        v15 = v16;
      }
      v94 = v15;
      v17 = *(_QWORD *)(*((_QWORD *)&v148 + 1) + 8 * v15);
      context = (void *)MEMORY[0x22E2C6BC8]();
      +[UAFTrialUpdateManager trialClientWithProject:](UAFTrialUpdateManager, "trialClientWithProject:", v92);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v147 = 0;
      v146 = 0;
      +[UAFTrialUpdateManager getKnownFactors:namespace:knownFactors:onDemandFactors:](UAFTrialUpdateManager, "getKnownFactors:namespace:knownFactors:onDemandFactors:", v105, v17, &v147, &v146);
      v18 = v147;
      v96 = v146;
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveN"
                             "etworking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v17;
        _os_log_impl(&dword_229282000, v19, OS_LOG_TYPE_DEFAULT, "%s Attempting to download needed factors for namespace %{public}@", buf, 0x16u);
      }

      v144 = 0u;
      v145 = 0u;
      v142 = 0u;
      v143 = 0u;
      objc_msgSend(obj, "objectForKeyedSubscript:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v142, v161, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v143;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v143 != v22)
              objc_enumerationMutation(v20);
            v24 = *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * i);
            if ((objc_msgSend(v18, "containsObject:", v24, v85) & 1) != 0)
            {
              objc_msgSend(v105, "levelForFactor:withNamespaceName:", v24, v17);
              v25 = objc_claimAutoreleasedReturnValue();
              if (!+[UAFTrialUpdateManager isOnDemand:](UAFTrialUpdateManager, "isOnDemand:", v25)
                || +[UAFTrialUpdateManager isPresent:](UAFTrialUpdateManager, "isPresent:", v25))
              {
                v26 = +[UAFTrialUpdateManager isOnDemand:](UAFTrialUpdateManager, "isOnDemand:", v25);
                UAFGetLogCategory((id *)&UAFLogContextClient);
                v27 = objc_claimAutoreleasedReturnValue();
                v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
                if (v26)
                {
                  if (v28)
                  {
                    *(_DWORD *)buf = 136315394;
                    *(_QWORD *)&buf[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactor"
                                         "s:expensiveNetworking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
                    *(_WORD *)&buf[12] = 2114;
                    *(_QWORD *)&buf[14] = v24;
                    v29 = v27;
                    v30 = "%s Cannot update downloaded on-demand factor %{public}@";
                    goto LABEL_25;
                  }
                }
                else if (v28)
                {
                  *(_DWORD *)buf = 136315394;
                  *(_QWORD *)&buf[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:"
                                       "expensiveNetworking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v24;
                  v29 = v27;
                  v30 = "%s Cannot update regular factor %{public}@";
LABEL_25:
                  _os_log_impl(&dword_229282000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 0x16u);
                }

                if (v107)
                  objc_msgSend(v107, "trialFactorStarted:namespace:size:status:", v24, v17, +[UAFTrialUpdateManager sizeFromLevel:](UAFTrialUpdateManager, "sizeFromLevel:", v25), 4);
                goto LABEL_37;
              }
              UAFGetLogCategory((id *)&UAFLogContextClient);
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:ex"
                                     "pensiveNetworking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v24;
                _os_log_impl(&dword_229282000, v31, OS_LOG_TYPE_DEFAULT, "%s Need to download desired on demand factor %{public}@", buf, 0x16u);
              }

              if (v107)
                objc_msgSend(v107, "trialFactorStarted:namespace:size:status:", v24, v17, +[UAFTrialUpdateManager sizeFromLevel:](UAFTrialUpdateManager, "sizeFromLevel:", v25), 2);
              v32 = v103;
              if (!v103)
                v32 = (void *)objc_opt_new();
              v103 = v32;
              objc_msgSend(v32, "objectForKeyedSubscript:", v17);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = v33 == 0;

              if (v34)
              {
                v35 = (void *)objc_opt_new();
                objc_msgSend(v103, "setObject:forKeyedSubscript:", v35, v17);

              }
              objc_msgSend(v103, "objectForKeyedSubscript:", v17);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "addObject:", v24);

              ++v101;
            }
            else
            {
              UAFGetLogCategory((id *)&UAFLogContextClient);
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:ex"
                                     "pensiveNetworking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v24;
                _os_log_error_impl(&dword_229282000, v25, OS_LOG_TYPE_ERROR, "%s Cannot update unknown factor %{public}@", buf, 0x16u);
              }
            }
LABEL_37:

          }
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v142, v161, 16);
        }
        while (v21);
      }

      if (v91 && !objc_msgSend(v89, "containsObject:", v17))
      {
        UAFGetLogCategory((id *)&UAFLogContextClient);
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiv"
                               "eNetworking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v17;
          _os_log_impl(&dword_229282000, v38, OS_LOG_TYPE_DEFAULT, "%s Attempting to remove unneeded factors for namespace %{public}@", buf, 0x16u);
        }

        v140 = 0u;
        v141 = 0u;
        v138 = 0u;
        v139 = 0u;
        v37 = v96;
        v39 = -[NSObject countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v138, v160, 16);
        if (v39)
        {
          v40 = *(_QWORD *)v139;
          do
          {
            for (j = 0; j != v39; ++j)
            {
              if (*(_QWORD *)v139 != v40)
                objc_enumerationMutation(v37);
              v42 = *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * j);
              objc_msgSend(obj, "objectForKeyedSubscript:", v17, v85);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = objc_msgSend(v43, "containsObject:", v42);

              if (v44)
              {
                UAFGetLogCategory((id *)&UAFLogContextClient);
                v45 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  *(_QWORD *)&buf[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:"
                                       "expensiveNetworking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v42;
                  _os_log_impl(&dword_229282000, v45, OS_LOG_TYPE_DEFAULT, "%s No need to remove desired on demand factor %{public}@", buf, 0x16u);
                }
              }
              else
              {
                objc_msgSend(v105, "levelForFactor:withNamespaceName:", v42, v17);
                v45 = objc_claimAutoreleasedReturnValue();
                if (+[UAFTrialUpdateManager isSubscribed:](UAFTrialUpdateManager, "isSubscribed:", v45))
                {
                  UAFGetLogCategory((id *)&UAFLogContextClient);
                  v46 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    *(_QWORD *)&buf[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactor"
                                         "s:expensiveNetworking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
                    *(_WORD *)&buf[12] = 2114;
                    *(_QWORD *)&buf[14] = v42;
                    _os_log_impl(&dword_229282000, v46, OS_LOG_TYPE_DEFAULT, "%s Need to remove undesired on demand factor %{public}@", buf, 0x16u);
                  }

                  v47 = v98;
                  if (!v98)
                    v47 = (void *)objc_opt_new();
                  v98 = v47;
                  objc_msgSend(v47, "objectForKeyedSubscript:", v17);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  v49 = v48 == 0;

                  if (v49)
                  {
                    v50 = (void *)objc_opt_new();
                    objc_msgSend(v98, "setObject:forKeyedSubscript:", v50, v17);

                  }
                  objc_msgSend(v98, "objectForKeyedSubscript:", v17);
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "addObject:", v42);

                  ++v101;
                }
              }

            }
            v39 = -[NSObject countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v138, v160, 16);
          }
          while (v39);
        }
      }
      else
      {
        UAFGetLogCategory((id *)&UAFLogContextClient);
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiv"
                               "eNetworking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
          _os_log_impl(&dword_229282000, v37, OS_LOG_TYPE_DEFAULT, "%s Not attempting to remove unneeded factors", buf, 0xCu);
        }
      }

      objc_autoreleasePoolPop(context);
      v15 = v94 + 1;
    }
    while (v94 + 1 != v93);
    v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v148, v162, 16);
  }
  while (v93);
LABEL_67:

  UAFGetLogCategory((id *)&UAFLogContextClient);
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNetwo"
                         "rking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v101;
    *(_WORD *)&buf[22] = 2114;
    v154 = (uint64_t)v92;
    _os_log_impl(&dword_229282000, v52, OS_LOG_TYPE_DEFAULT, "%s Updating %lu on-demand factors in project %{public}@", buf, 0x20u);
  }

  if (v101)
  {
    +[UAFTrialUpdateManager trialClientWithProject:](UAFTrialUpdateManager, "trialClientWithProject:", v92);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v106 = 0;
  }
  v53 = dispatch_group_create();
  v100 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBA918]), "initWithAllowsCellular:discretionaryBehavior:", v86, 0);
  v136 = 0u;
  v137 = 0u;
  v134 = 0u;
  v135 = 0u;
  v104 = v103;
  v102 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v134, v159, 16);
  if (v102)
  {
    v97 = *(_QWORD *)v135;
    do
    {
      for (k = 0; k != v102; ++k)
      {
        if (*(_QWORD *)v135 != v97)
          objc_enumerationMutation(v104);
        v55 = *(id *)(*((_QWORD *)&v134 + 1) + 8 * k);
        objc_msgSend(v104, "objectForKeyedSubscript:", v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "allObjects");
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        dispatch_group_enter(v53);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        LOBYTE(v154) = 0;
        UAFGetLogCategory((id *)&UAFLogContextClient);
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v157 = 136315650;
          *(_QWORD *)&v157[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensi"
                                "veNetworking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
          *(_WORD *)&v157[12] = 2114;
          *(_QWORD *)&v157[14] = v57;
          *(_WORD *)&v157[22] = 2114;
          v158 = v55;
          _os_log_impl(&dword_229282000, v58, OS_LOG_TYPE_DEFAULT, "%s downloadLevelsForFactors for %{public}@ with namespace %{public}@", v157, 0x20u);
        }

        +[UAFTrialUpdateManager getSerialQueue](UAFTrialUpdateManager, "getSerialQueue");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v128[0] = MEMORY[0x24BDAC760];
        v128[1] = 3221225472;
        v128[2] = __173__UAFTrialUpdateManager_updateOnDemandFactors_trialFactors_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_updateProgress_completion___block_invoke;
        v128[3] = &unk_24F1F7710;
        v133 = buf;
        v60 = v57;
        v129 = v60;
        v61 = v107;
        v130 = v61;
        v62 = v55;
        v131 = v62;
        v63 = v53;
        v132 = v63;
        objc_msgSend(v106, "downloadLevelsForFactors:withNamespace:queue:options:progress:completion:", v60, v62, v59, v100, 0, v128);

        if (v107)
        {
          *(_QWORD *)v157 = 0;
          *(_QWORD *)&v157[8] = v157;
          *(_QWORD *)&v157[16] = 0x2020000000;
          LOBYTE(v158) = 0;
          dispatch_group_enter(v63);
          +[UAFTrialUpdateManager getSerialQueue](UAFTrialUpdateManager, "getSerialQueue");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v124[0] = MEMORY[0x24BDAC760];
          v124[1] = 3221225472;
          v124[2] = __173__UAFTrialUpdateManager_updateOnDemandFactors_trialFactors_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_updateProgress_completion___block_invoke_194;
          v124[3] = &unk_24F1F7738;
          v65 = v60;
          v125 = v65;
          v66 = v61;
          v126 = v66;
          v67 = v62;
          v127 = v67;
          v119[0] = MEMORY[0x24BDAC760];
          v119[1] = 3221225472;
          v119[2] = __173__UAFTrialUpdateManager_updateOnDemandFactors_trialFactors_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_updateProgress_completion___block_invoke_196;
          v119[3] = &unk_24F1F7760;
          v123 = v157;
          v120 = v66;
          v121 = v63;
          v122 = v65;
          objc_msgSend(v106, "statusOfDownloadForFactors:withNamespace:token:queue:progress:completion:", v122, v67, 0, v64, v124, v119);

          _Block_object_dispose(v157, 8);
        }

        _Block_object_dispose(buf, 8);
      }
      v102 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v134, v159, 16);
    }
    while (v102);
  }

  v68 = objc_msgSend(v88, "updateCount");
  if (v68 != a7)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNet"
                           "working:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a7;
      *(_WORD *)&buf[22] = 2048;
      v154 = v68;
      _os_log_impl(&dword_229282000, v69, OS_LOG_TYPE_DEFAULT, "%s Store update count mismatch: %llu vs %llu, skipping removes", buf, 0x20u);
    }

    v98 = 0;
  }
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v70 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNetwo"
                         "rking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a7;
    *(_WORD *)&buf[22] = 2048;
    v154 = v68;
    v155 = 1024;
    v156 = v91;
    _os_log_impl(&dword_229282000, v70, OS_LOG_TYPE_DEFAULT, "%s Store update count: %llu vs %llu and removeUnneededFactors: %d", buf, 0x26u);
  }

  if (v98)
  {
    if (+[UAFTrialUpdateManager isRemoveAllowed](UAFTrialUpdateManager, "isRemoveAllowed"))
    {
      v71 = v98;
      goto LABEL_96;
    }
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNet"
                           "working:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
      _os_log_impl(&dword_229282000, v72, OS_LOG_TYPE_DEFAULT, "%s Removes temporarily disallowed, skipping remove", buf, 0xCu);
    }

  }
  v71 = 0;
LABEL_96:
  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  v73 = v71;
  v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v115, v152, 16);
  if (v74)
  {
    v75 = *(_QWORD *)v116;
    do
    {
      for (m = 0; m != v74; ++m)
      {
        if (*(_QWORD *)v116 != v75)
          objc_enumerationMutation(v73);
        v77 = *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * m);
        objc_msgSend(v73, "objectForKeyedSubscript:", v77, v85);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "allObjects");
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        dispatch_group_enter(v53);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        LOBYTE(v154) = 0;
        +[UAFTrialUpdateManager getSerialQueue](UAFTrialUpdateManager, "getSerialQueue");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v111[0] = MEMORY[0x24BDAC760];
        v111[1] = 3221225472;
        v111[2] = __173__UAFTrialUpdateManager_updateOnDemandFactors_trialFactors_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_updateProgress_completion___block_invoke_197;
        v111[3] = &unk_24F1F7788;
        v114 = buf;
        v81 = v79;
        v112 = v81;
        v113 = v53;
        objc_msgSend(v106, "removeLevelsForFactors:withNamespace:queue:completion:", v81, v77, v80, v111);

        _Block_object_dispose(buf, 8);
      }
      v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v115, v152, 16);
    }
    while (v74);
  }

  +[UAFTrialUpdateManager getConcurrentQueue](UAFTrialUpdateManager, "getConcurrentQueue");
  v82 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __173__UAFTrialUpdateManager_updateOnDemandFactors_trialFactors_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_updateProgress_completion___block_invoke_198;
  block[3] = &unk_24F1F7560;
  v109 = v92;
  v110 = v85;
  v83 = v85;
  v84 = v92;
  dispatch_group_notify(v53, v82, block);

}

void __173__UAFTrialUpdateManager_updateOnDemandFactors_trialFactors_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_updateProgress_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  if (*(_BYTE *)(v6 + 24))
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v16 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v24 = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNetworking:updateC"
            "ount:storeManager:noRemovalNamespaces:updateProgress:completion:]_block_invoke";
      v25 = 2114;
      v26 = v16;
      _os_log_fault_impl(&dword_229282000, v7, OS_LOG_TYPE_FAULT, "%s Callback for downloading factors %{public}@ called more than once!", buf, 0x16u);
    }

  }
  else
  {
    *(_BYTE *)(v6 + 24) = 1;
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a2)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136315394;
        v24 = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNetworking:updat"
              "eCount:storeManager:noRemovalNamespaces:updateProgress:completion:]_block_invoke";
        v25 = 2114;
        v26 = v10;
        _os_log_impl(&dword_229282000, v9, OS_LOG_TYPE_DEFAULT, "%s Factors %{public}@ downloaded", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v24 = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNetworking:updateC"
            "ount:storeManager:noRemovalNamespaces:updateProgress:completion:]_block_invoke";
      v25 = 2114;
      v26 = v17;
      v27 = 2114;
      v28 = v5;
      _os_log_error_impl(&dword_229282000, v9, OS_LOG_TYPE_ERROR, "%s Failed to download factors %{public}@: %{public}@", buf, 0x20u);
    }

    +[UAFTrialUpdateManager checkForOutOfSpace:updateProgress:](UAFTrialUpdateManager, "checkForOutOfSpace:updateProgress:", v5, *(_QWORD *)(a1 + 40));
    if (*(_QWORD *)(a1 + 40))
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v11 = *(id *)(a1 + 32);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v19;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v19 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(a1 + 40), "trialFactorFinished:namespace:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15++), *(_QWORD *)(a1 + 48), (_QWORD)v18);
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v13);
      }

    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }

}

void __173__UAFTrialUpdateManager_updateOnDemandFactors_trialFactors_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_updateProgress_completion___block_invoke_194(uint64_t a1, unint64_t a2, double a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 40), "trialFactorProgress:namespace:fractionCompleted:status:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10++), *(_QWORD *)(a1 + 48), a2, a3, (_QWORD)v15);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v27, 16);
    }
    while (v8);
  }

  UAFGetLogCategory((id *)&UAFLogContextClient);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 32);
    UAFSubscriptionDownloadStatusDescription(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v20 = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNetworking:updateCou"
          "nt:storeManager:noRemovalNamespaces:updateProgress:completion:]_block_invoke";
    v21 = 2114;
    v22 = v12;
    v23 = 2114;
    v24 = v13;
    v25 = 2114;
    v26 = v14;
    _os_log_impl(&dword_229282000, v11, OS_LOG_TYPE_DEFAULT, "%s statusOfDownload for %{public}@:%{public}@ status: %{public}@", buf, 0x2Au);

  }
}

void __173__UAFTrialUpdateManager_updateOnDemandFactors_trialFactors_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_updateProgress_completion___block_invoke_196(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(_BYTE *)(v4 + 24))
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v6 = *(_QWORD *)(a1 + 48);
      v7 = 136315394;
      v8 = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNetworking:updateCo"
           "unt:storeManager:noRemovalNamespaces:updateProgress:completion:]_block_invoke";
      v9 = 2114;
      v10 = v6;
      _os_log_fault_impl(&dword_229282000, v5, OS_LOG_TYPE_FAULT, "%s Completion Callback for status of factors %{public}@ called more than once!", (uint8_t *)&v7, 0x16u);
    }

  }
  else
  {
    *(_BYTE *)(v4 + 24) = 1;
    +[UAFTrialUpdateManager checkForOutOfSpace:updateProgress:](UAFTrialUpdateManager, "checkForOutOfSpace:updateProgress:", a3, *(_QWORD *)(a1 + 32));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __173__UAFTrialUpdateManager_updateOnDemandFactors_trialFactors_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_updateProgress_completion___block_invoke_197(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v6 + 24))
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v13 = 136315394;
      v14 = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNetworking:updateC"
            "ount:storeManager:noRemovalNamespaces:updateProgress:completion:]_block_invoke";
      v15 = 2114;
      v16 = v11;
      _os_log_fault_impl(&dword_229282000, v7, OS_LOG_TYPE_FAULT, "%s Callback for removing factors %{public}@ called more than once!", (uint8_t *)&v13, 0x16u);
    }

  }
  else
  {
    *(_BYTE *)(v6 + 24) = 1;
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a2)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v13 = 136315394;
        v14 = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNetworking:updat"
              "eCount:storeManager:noRemovalNamespaces:updateProgress:completion:]_block_invoke";
        v15 = 2114;
        v16 = v10;
        _os_log_impl(&dword_229282000, v9, OS_LOG_TYPE_DEFAULT, "%s Factor %{public}@ removed", (uint8_t *)&v13, 0x16u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 136315650;
      v14 = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNetworking:updateC"
            "ount:storeManager:noRemovalNamespaces:updateProgress:completion:]_block_invoke";
      v15 = 2114;
      v16 = v12;
      v17 = 2114;
      v18 = v5;
      _os_log_error_impl(&dword_229282000, v9, OS_LOG_TYPE_ERROR, "%s Failed to remove factor %{public}@: %{public}@", (uint8_t *)&v13, 0x20u);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

}

uint64_t __173__UAFTrialUpdateManager_updateOnDemandFactors_trialFactors_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_updateProgress_completion___block_invoke_198(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNetworking:updateCoun"
         "t:storeManager:noRemovalNamespaces:updateProgress:completion:]_block_invoke";
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_229282000, v2, OS_LOG_TYPE_DEFAULT, "%s All updates for on-demand factors in project %{public}@ complete", (uint8_t *)&v5, 0x16u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (void)updateTrialProject:(id)a3 trialFactors:(id)a4 removeUnneededFactors:(BOOL)a5 expensiveNetworking:(BOOL)a6 updateCount:(unint64_t)a7 storeManager:(id)a8 noRemovalNamespaces:(id)a9 updateProgress:(id)a10 completion:(id)a11
{
  _BOOL8 v12;
  _BOOL8 v13;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void (**v23)(_QWORD);
  NSObject *v24;
  NSObject *v25;
  _QWORD v27[4];
  id v28;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v12 = a6;
  v13 = a5;
  v36 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __170__UAFTrialUpdateManager_updateTrialProject_trialFactors_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_updateProgress_completion___block_invoke;
  v27[3] = &unk_24F1F7560;
  v21 = v15;
  v28 = v21;
  v22 = v20;
  v29 = v22;
  v23 = (void (**)(_QWORD))MEMORY[0x22E2C6D60](v27);
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v31 = "+[UAFTrialUpdateManager updateTrialProject:trialFactors:removeUnneededFactors:expensiveNetworking:updateCount:"
          "storeManager:noRemovalNamespaces:updateProgress:completion:]";
    v32 = 2114;
    v33 = v16;
    v34 = 2114;
    v35 = v21;
    _os_log_impl(&dword_229282000, v24, OS_LOG_TYPE_DEFAULT, "%s Updating trial factors %{public}@ for %{public}@", buf, 0x20u);
  }

  if (v16 && objc_msgSend(v16, "count"))
  {
    +[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNetworking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:](UAFTrialUpdateManager, "updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNetworking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:", v21, v16, v13, v12, a7, v17, v18, v19, v23);
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "+[UAFTrialUpdateManager updateTrialProject:trialFactors:removeUnneededFactors:expensiveNetworking:updateCoun"
            "t:storeManager:noRemovalNamespaces:updateProgress:completion:]";
      v32 = 2114;
      v33 = v21;
      _os_log_impl(&dword_229282000, v25, OS_LOG_TYPE_DEFAULT, "%s No trial assets to update for %{public}@", buf, 0x16u);
    }

    v23[2](v23);
  }

}

void __170__UAFTrialUpdateManager_updateTrialProject_trialFactors_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_updateProgress_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "+[UAFTrialUpdateManager updateTrialProject:trialFactors:removeUnneededFactors:expensiveNetworking:updateCount:s"
         "toreManager:noRemovalNamespaces:updateProgress:completion:]_block_invoke";
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_229282000, v2, OS_LOG_TYPE_DEFAULT, "%s All updating of trial assets in project %{public}@ complete", (uint8_t *)&v5, 0x16u);
  }

  if (*(_QWORD *)(a1 + 40))
  {
    +[UAFTrialUpdateManager getConcurrentQueue](UAFTrialUpdateManager, "getConcurrentQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v4, *(dispatch_block_t *)(a1 + 40));

  }
}

+ (BOOL)updateNamespaces:(id)a3 missingRolloutsOnly:(BOOL)a4 expensiveNetworking:(BOOL)a5 assetSetNamespaces:(id)a6 updateProgress:(id)a7
{
  _BOOL4 v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  void *v34;
  int v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  void *v46;
  char v47;
  id v48;
  NSObject *v49;
  NSObject *v50;
  _BOOL4 v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  id obj;
  uint64_t v59;
  _BOOL4 v60;
  void *v61;
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
  uint8_t buf[4];
  const char *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  id v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v9 = a5;
  v60 = a4;
  v84 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v55 = a6;
  v11 = a7;
  v12 = v11;
  if (v10)
  {
    v52 = v9;
    v53 = v11;
    v61 = (void *)objc_opt_new();
    v13 = (void *)objc_opt_new();
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v54 = v10;
    obj = v10;
    v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
    if (v57)
    {
      v56 = *(_QWORD *)v72;
      do
      {
        v14 = 0;
        do
        {
          v15 = v13;
          if (*(_QWORD *)v72 != v56)
            objc_enumerationMutation(obj);
          v59 = v14;
          v16 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * v14);
          v67 = 0u;
          v68 = 0u;
          v69 = 0u;
          v70 = 0u;
          objc_msgSend(obj, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v68;
            do
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v68 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
                v23 = (void *)MEMORY[0x22E2C6BC8]();
                +[UAFTrialUpdateManager trialClientWithProject:](UAFTrialUpdateManager, "trialClientWithProject:", v16);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = v24;
                if (v24)
                {
                  if (!v60
                    || (objc_msgSend(v24, "rolloutIdentifiersWithNamespaceName:", v22),
                        v26 = (void *)objc_claimAutoreleasedReturnValue(),
                        v26,
                        v27 = v15,
                        !v26))
                  {
                    v27 = v61;
                  }
                  objc_msgSend(v27, "addObject:", v22);
                }

                objc_autoreleasePoolPop(v23);
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
            }
            while (v19);
          }

          v13 = v15;
          if (v60)
          {
            v65 = 0u;
            v66 = 0u;
            v63 = 0u;
            v64 = 0u;
            v28 = v55;
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
            if (v29)
            {
              v30 = v29;
              v31 = *(_QWORD *)v64;
              do
              {
                for (j = 0; j != v30; ++j)
                {
                  if (*(_QWORD *)v64 != v31)
                    objc_enumerationMutation(v28);
                  v33 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j);
                  objc_msgSend(v28, "objectForKeyedSubscript:", v33);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  v35 = objc_msgSend(v34, "intersectsSet:", v15);

                  if (v35)
                  {
                    UAFGetLogCategory((id *)&UAFLogContextClient);
                    v36 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend(v28, "objectForKeyedSubscript:", v33);
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 136315394;
                      v76 = "+[UAFTrialUpdateManager updateNamespaces:missingRolloutsOnly:expensiveNetworking:assetSetNam"
                            "espaces:updateProgress:]";
                      v77 = 2114;
                      v78 = v37;
                      _os_log_impl(&dword_229282000, v36, OS_LOG_TYPE_DEFAULT, "%s Not updating the following namespaces, as at least one already exists within the same assetset: %{public}@", buf, 0x16u);

                    }
                    objc_msgSend(v28, "objectForKeyedSubscript:", v33);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v38, "allObjects");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v61, "removeObjectsInArray:", v39);

                  }
                }
                v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
              }
              while (v30);
            }

          }
          v14 = v59 + 1;
        }
        while (v59 + 1 != v57);
        v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
      }
      while (v57);
    }

    UAFGetLogCategory((id *)&UAFLogContextClient);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v76 = "+[UAFTrialUpdateManager updateNamespaces:missingRolloutsOnly:expensiveNetworking:assetSetNamespaces:updateProgress:]";
      _os_log_impl(&dword_229282000, v40, OS_LOG_TYPE_DEFAULT, "%s Updating namespaces", buf, 0xCu);
    }

    v12 = v53;
    if (objc_msgSend(v61, "count"))
    {
      objc_msgSend(obj, "allKeys");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "firstObject");
      v42 = objc_claimAutoreleasedReturnValue();

      +[UAFTrialUpdateManager trialClientWithProject:](UAFTrialUpdateManager, "trialClientWithProject:", v42);
      v43 = objc_claimAutoreleasedReturnValue();
      if (!v43)
      {
        v47 = 0;
LABEL_51:

        v10 = v54;
        goto LABEL_52;
      }
      v44 = (void *)v43;
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v76 = "+[UAFTrialUpdateManager updateNamespaces:missingRolloutsOnly:expensiveNetworking:assetSetNamespaces:updateProgress:]";
        v77 = 2114;
        v78 = v61;
        _os_log_impl(&dword_229282000, v45, OS_LOG_TYPE_DEFAULT, "%s Updating namespaces %{public}@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v61);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 0;
      v47 = objc_msgSend(v44, "immediateDownloadForNamespaceNames:allowExpensiveNetworking:error:", v46, v52, &v62);
      v48 = v62;

      UAFGetLogCategory((id *)&UAFLogContextClient);
      v49 = objc_claimAutoreleasedReturnValue();
      v50 = v49;
      if ((v47 & 1) != 0)
      {
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v76 = "+[UAFTrialUpdateManager updateNamespaces:missingRolloutsOnly:expensiveNetworking:assetSetNamespaces:updateProgress:]";
          v77 = 2114;
          v78 = v61;
          _os_log_impl(&dword_229282000, v50, OS_LOG_TYPE_DEFAULT, "%s Updated namespaces %{public}@", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v76 = "+[UAFTrialUpdateManager updateNamespaces:missingRolloutsOnly:expensiveNetworking:assetSetNamespaces:updateProgress:]";
        v77 = 2114;
        v78 = v61;
        v79 = 2114;
        v80 = v48;
        _os_log_error_impl(&dword_229282000, v50, OS_LOG_TYPE_ERROR, "%s Failed to update namespaces %{public}@: %{public}@", buf, 0x20u);
      }

      +[UAFTrialUpdateManager checkForOutOfSpace:updateProgress:](UAFTrialUpdateManager, "checkForOutOfSpace:updateProgress:", v48, v53);
    }
    else
    {
      v47 = 1;
    }
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v76 = "+[UAFTrialUpdateManager updateNamespaces:missingRolloutsOnly:expensiveNetworking:assetSetNamespaces:updateProgress:]";
      _os_log_impl(&dword_229282000, v42, OS_LOG_TYPE_DEFAULT, "%s Namespace updates complete", buf, 0xCu);
    }
    goto LABEL_51;
  }
  v47 = 1;
LABEL_52:

  return v47;
}

+ (void)updateTrialFactors:(id)a3 rolloutUpdateMode:(int64_t)a4 removeUnneededFactors:(BOOL)a5 expensiveNetworking:(BOOL)a6 updateCount:(unint64_t)a7 storeManager:(id)a8 noRemovalNamespaces:(id)a9 assetSetNamespaces:(id)a10 progress:(id)a11 completion:(id)a12
{
  id v14;
  id v15;
  id v16;
  UAFTrialUpdateProgress *v17;
  __CFString *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  __CFString *v27;
  NSObject *v28;
  __CFString *v29;
  void *v30;
  NSObject *v31;
  id v32;
  __CFString *v33;
  NSObject *v34;
  uint64_t v35;
  UAFTrialUpdateProgress *v36;
  NSObject *v37;
  id v38;
  UAFTrialUpdateProgress *v39;
  id v40;
  NSObject *v41;
  NSObject *v42;
  id v43;
  UAFTrialUpdateProgress *v44;
  id v45;
  NSObject *group;
  void *v47;
  int64_t v48;
  id v49;
  void *v50;
  id v53;
  id v54;
  _BOOL4 v55;
  _QWORD v56[4];
  id v57;
  UAFTrialUpdateProgress *v58;
  id v59;
  _QWORD v60[4];
  NSObject *v61;
  id v62;
  id v63;
  UAFTrialUpdateProgress *v64;
  int64_t v65;
  BOOL v66;
  _QWORD v67[4];
  UAFTrialUpdateProgress *v68;
  _QWORD block[4];
  __CFString *v70;
  id v71;
  id v72;
  id v73;
  UAFTrialUpdateProgress *v74;
  NSObject *v75;
  NSObject *v76;
  unint64_t v77;
  BOOL v78;
  BOOL v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint8_t v84[128];
  uint8_t buf[4];
  const char *v86;
  __int16 v87;
  __CFString *v88;
  uint64_t v89;

  v55 = a6;
  v89 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v54 = a8;
  v53 = a9;
  v15 = a10;
  v16 = a11;
  v49 = a12;
  if (v16)
    v17 = -[UAFTrialUpdateProgress initWithTrialFactors:detailedProgressWithStatus:]([UAFTrialUpdateProgress alloc], "initWithTrialFactors:detailedProgressWithStatus:", v14, v16);
  else
    v17 = 0;
  v50 = v16;
  if ((unint64_t)a4 > 2)
    v18 = 0;
  else
    v18 = off_24F1F7890[a4];
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v86 = "+[UAFTrialUpdateManager updateTrialFactors:rolloutUpdateMode:removeUnneededFactors:expensiveNetworking:updateC"
          "ount:storeManager:noRemovalNamespaces:assetSetNamespaces:progress:completion:]";
    v87 = 2114;
    v88 = v18;
    _os_log_impl(&dword_229282000, v19, OS_LOG_TYPE_DEFAULT, "%s Updating namespaces for %{public}@ prior to on-demand factor downloading", buf, 0x16u);
  }

  if (v17)
    -[UAFTrialUpdateProgress updateStarted](v17, "updateStarted");
  v47 = v15;
  v48 = a4;
  +[UAFTrialUpdateManager updateNamespaces:missingRolloutsOnly:expensiveNetworking:assetSetNamespaces:updateProgress:](UAFTrialUpdateManager, "updateNamespaces:missingRolloutsOnly:expensiveNetworking:assetSetNamespaces:updateProgress:", v14, a4 != 2, v55, v15, v17);
  v20 = dispatch_group_create();
  v21 = dispatch_group_create();
  group = dispatch_group_create();
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v22 = v14;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v81;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v81 != v25)
          objc_enumerationMutation(v22);
        v27 = *(__CFString **)(*((_QWORD *)&v80 + 1) + 8 * i);
        UAFGetLogCategory((id *)&UAFLogContextClient);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v86 = "+[UAFTrialUpdateManager updateTrialFactors:rolloutUpdateMode:removeUnneededFactors:expensiveNetworking:u"
                "pdateCount:storeManager:noRemovalNamespaces:assetSetNamespaces:progress:completion:]";
          v87 = 2114;
          v88 = v27;
          _os_log_impl(&dword_229282000, v28, OS_LOG_TYPE_DEFAULT, "%s Updating trial assets in project %{public}@ as part of update of all trial assets", buf, 0x16u);
        }

        v29 = v27;
        objc_msgSend(v22, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v20);
        dispatch_group_enter(v21);
        +[UAFTrialUpdateManager getConcurrentQueue](UAFTrialUpdateManager, "getConcurrentQueue");
        v31 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __188__UAFTrialUpdateManager_updateTrialFactors_rolloutUpdateMode_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_assetSetNamespaces_progress_completion___block_invoke;
        block[3] = &unk_24F1F77B0;
        v70 = v29;
        v71 = v30;
        v78 = a5;
        v79 = v55;
        v77 = a7;
        v72 = v54;
        v73 = v53;
        v74 = v17;
        v75 = v21;
        v76 = v20;
        v32 = v30;
        v33 = v29;
        dispatch_async(v31, block);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
    }
    while (v24);
  }

  dispatch_group_enter(group);
  +[UAFTrialUpdateManager getConcurrentQueue](UAFTrialUpdateManager, "getConcurrentQueue");
  v34 = objc_claimAutoreleasedReturnValue();
  v67[0] = MEMORY[0x24BDAC760];
  v35 = MEMORY[0x24BDAC760];
  v67[1] = 3221225472;
  v67[2] = __188__UAFTrialUpdateManager_updateTrialFactors_rolloutUpdateMode_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_assetSetNamespaces_progress_completion___block_invoke_207;
  v67[3] = &unk_24F1F6F88;
  v36 = v17;
  v68 = v36;
  dispatch_group_notify(v20, v34, v67);

  +[UAFTrialUpdateManager getConcurrentQueue](UAFTrialUpdateManager, "getConcurrentQueue");
  v37 = objc_claimAutoreleasedReturnValue();
  v60[0] = v35;
  v60[1] = 3221225472;
  v60[2] = __188__UAFTrialUpdateManager_updateTrialFactors_rolloutUpdateMode_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_assetSetNamespaces_progress_completion___block_invoke_2_208;
  v60[3] = &unk_24F1F7800;
  v65 = v48;
  v61 = group;
  v38 = v22;
  v66 = v55;
  v62 = v38;
  v63 = v47;
  v39 = v36;
  v64 = v39;
  v40 = v47;
  v41 = group;
  dispatch_group_notify(v21, v37, v60);

  +[UAFTrialUpdateManager getConcurrentQueue](UAFTrialUpdateManager, "getConcurrentQueue");
  v42 = objc_claimAutoreleasedReturnValue();
  v56[0] = MEMORY[0x24BDAC760];
  v56[1] = 3221225472;
  v56[2] = __188__UAFTrialUpdateManager_updateTrialFactors_rolloutUpdateMode_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_assetSetNamespaces_progress_completion___block_invoke_4;
  v56[3] = &unk_24F1F75A8;
  v57 = v38;
  v58 = v39;
  v59 = v49;
  v43 = v49;
  v44 = v39;
  v45 = v38;
  dispatch_group_notify(v41, v42, v56);

}

void __188__UAFTrialUpdateManager_updateTrialFactors_rolloutUpdateMode_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_assetSetNamespaces_progress_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 96);
  v5 = *(unsigned __int8 *)(a1 + 97);
  v6 = *(_QWORD *)(a1 + 88);
  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __188__UAFTrialUpdateManager_updateTrialFactors_rolloutUpdateMode_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_assetSetNamespaces_progress_completion___block_invoke_2;
  v10[3] = &unk_24F1F70C8;
  v9 = *(_QWORD *)(a1 + 64);
  v11 = *(id *)(a1 + 72);
  v12 = *(id *)(a1 + 32);
  +[UAFTrialUpdateManager updateTrialProject:trialFactors:removeUnneededFactors:expensiveNetworking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:](UAFTrialUpdateManager, "updateTrialProject:trialFactors:removeUnneededFactors:expensiveNetworking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:", v2, v3, v4, v5, v6, v7, v8, v9, v10);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 80));
}

void __188__UAFTrialUpdateManager_updateTrialFactors_rolloutUpdateMode_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_assetSetNamespaces_progress_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = 136315394;
    v5 = "+[UAFTrialUpdateManager updateTrialFactors:rolloutUpdateMode:removeUnneededFactors:expensiveNetworking:updateCo"
         "unt:storeManager:noRemovalNamespaces:assetSetNamespaces:progress:completion:]_block_invoke_2";
    v6 = 2114;
    v7 = v3;
    _os_log_impl(&dword_229282000, v2, OS_LOG_TYPE_DEFAULT, "%s Update of trial assets in project %{public}@ complete as part of update of all trial assets", (uint8_t *)&v4, 0x16u);
  }

}

void *__188__UAFTrialUpdateManager_updateTrialFactors_rolloutUpdateMode_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_assetSetNamespaces_progress_completion___block_invoke_207(uint64_t a1)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)objc_msgSend(result, "onDemandFactorsStarted");
  return result;
}

void __188__UAFTrialUpdateManager_updateTrialFactors_rolloutUpdateMode_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_assetSetNamespaces_progress_completion___block_invoke_2_208(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  id v5;
  id v6;
  id v7;
  char v8;

  if (*(_QWORD *)(a1 + 64))
  {
    +[UAFTrialUpdateManager getSerialQueue](UAFTrialUpdateManager, "getSerialQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __188__UAFTrialUpdateManager_updateTrialFactors_rolloutUpdateMode_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_assetSetNamespaces_progress_completion___block_invoke_3;
    block[3] = &unk_24F1F77D8;
    v4 = *(id *)(a1 + 40);
    v8 = *(_BYTE *)(a1 + 72);
    v5 = *(id *)(a1 + 48);
    v6 = *(id *)(a1 + 56);
    v7 = *(id *)(a1 + 32);
    dispatch_async(v2, block);

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __188__UAFTrialUpdateManager_updateTrialFactors_rolloutUpdateMode_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_assetSetNamespaces_progress_completion___block_invoke_3(uint64_t a1)
{
  +[UAFTrialUpdateManager updateNamespaces:missingRolloutsOnly:expensiveNetworking:assetSetNamespaces:updateProgress:](UAFTrialUpdateManager, "updateNamespaces:missingRolloutsOnly:expensiveNetworking:assetSetNamespaces:updateProgress:", *(_QWORD *)(a1 + 32), 0, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __188__UAFTrialUpdateManager_updateTrialFactors_rolloutUpdateMode_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_assetSetNamespaces_progress_completion___block_invoke_4(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  uint64_t result;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  if (v2 && objc_msgSend(v2, "count"))
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    v8 = 136315138;
    v9 = "+[UAFTrialUpdateManager updateTrialFactors:rolloutUpdateMode:removeUnneededFactors:expensiveNetworking:updateCo"
         "unt:storeManager:noRemovalNamespaces:assetSetNamespaces:progress:completion:]_block_invoke";
    v4 = "%s All per-project updates complete as part of update for of all trial assets";
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    v8 = 136315138;
    v9 = "+[UAFTrialUpdateManager updateTrialFactors:rolloutUpdateMode:removeUnneededFactors:expensiveNetworking:updateCo"
         "unt:storeManager:noRemovalNamespaces:assetSetNamespaces:progress:completion:]_block_invoke_4";
    v4 = "%s No trial assets to update";
  }
  _os_log_impl(&dword_229282000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v8, 0xCu);
LABEL_8:

  v6 = (void *)a1[5];
  if (v6)
    objc_msgSend(v6, "updateFinished");
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v5);
  return result;
}

+ (void)updateTrialFromAssetSetUsages:(id)a3 storeManager:(id)a4 configurationManager:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "+[UAFTrialUpdateManager updateTrialFromAssetSetUsages:storeManager:configurationManager:]";
    _os_log_impl(&dword_229282000, v10, OS_LOG_TYPE_DEFAULT, "%s Configuring Trial from asset set usages", buf, 0xCu);
  }

  v11 = objc_msgSend(v8, "updateCount");
  +[UAFTrialUpdateManager getSerialQueue](UAFTrialUpdateManager, "getSerialQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __89__UAFTrialUpdateManager_updateTrialFromAssetSetUsages_storeManager_configurationManager___block_invoke;
  v16[3] = &unk_24F1F7828;
  v17 = v7;
  v18 = v9;
  v19 = v8;
  v20 = v11;
  v13 = v8;
  v14 = v9;
  v15 = v7;
  dispatch_async(v12, v16);

}

void __89__UAFTrialUpdateManager_updateTrialFromAssetSetUsages_storeManager_configurationManager___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = a1[4];
  v3 = a1[5];
  v9 = 0;
  v10 = 0;
  +[UAFTrialUpdateManager getTrialFactors:configurationManager:includeAllAssetSets:noRemovalNamespaces:assetSetNamespaces:](UAFTrialUpdateManager, "getTrialFactors:configurationManager:includeAllAssetSets:noRemovalNamespaces:assetSetNamespaces:", v2, v3, 1, &v10, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  v6 = v9;
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "+[UAFTrialUpdateManager updateTrialFromAssetSetUsages:storeManager:configurationManager:]_block_invoke";
    v13 = 2114;
    v14 = v4;
    _os_log_debug_impl(&dword_229282000, v7, OS_LOG_TYPE_DEBUG, "%s All trial factors now %{public}@", buf, 0x16u);
  }

  +[UAFTrialUpdateManager updateTrialFactors:rolloutUpdateMode:removeUnneededFactors:expensiveNetworking:updateCount:storeManager:noRemovalNamespaces:assetSetNamespaces:progress:completion:](UAFTrialUpdateManager, "updateTrialFactors:rolloutUpdateMode:removeUnneededFactors:expensiveNetworking:updateCount:storeManager:noRemovalNamespaces:assetSetNamespaces:progress:completion:", v4, 0, 1, 0, a1[7], a1[6], v5, v6, 0, 0);
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "+[UAFTrialUpdateManager updateTrialFromAssetSetUsages:storeManager:configurationManager:]_block_invoke";
    _os_log_impl(&dword_229282000, v8, OS_LOG_TYPE_DEFAULT, "%s Finished configuring Trial from asset set usages", buf, 0xCu);
  }

}

+ (void)updateTrialFromAssetSetUsages:(id)a3 rolloutUpdateMode:(int64_t)a4 expensiveNetworking:(BOOL)a5 storeManager:(id)a6 configurationManager:(id)a7 progress:(id)a8 completion:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  int64_t v32;
  BOOL v33;
  uint8_t buf[4];
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v35 = "+[UAFTrialUpdateManager updateTrialFromAssetSetUsages:rolloutUpdateMode:expensiveNetworking:storeManager:confi"
          "gurationManager:progress:completion:]";
    _os_log_impl(&dword_229282000, v19, OS_LOG_TYPE_DEFAULT, "%s Configuring Trial from asset set usages", buf, 0xCu);
  }

  +[UAFTrialUpdateManager getSerialQueue](UAFTrialUpdateManager, "getSerialQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __147__UAFTrialUpdateManager_updateTrialFromAssetSetUsages_rolloutUpdateMode_expensiveNetworking_storeManager_configurationManager_progress_completion___block_invoke;
  block[3] = &unk_24F1F7850;
  v27 = v14;
  v28 = v16;
  v33 = a5;
  v29 = v15;
  v30 = v17;
  v31 = v18;
  v32 = a4;
  v21 = v18;
  v22 = v17;
  v23 = v15;
  v24 = v16;
  v25 = v14;
  dispatch_async(v20, block);

}

void __147__UAFTrialUpdateManager_updateTrialFromAssetSetUsages_rolloutUpdateMode_expensiveNetworking_storeManager_configurationManager_progress_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v8 = 0;
  +[UAFTrialUpdateManager getTrialFactors:configurationManager:includeAllAssetSets:noRemovalNamespaces:assetSetNamespaces:](UAFTrialUpdateManager, "getTrialFactors:configurationManager:includeAllAssetSets:noRemovalNamespaces:assetSetNamespaces:", v2, v3, 0, 0, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "+[UAFTrialUpdateManager updateTrialFromAssetSetUsages:rolloutUpdateMode:expensiveNetworking:storeManager:confi"
          "gurationManager:progress:completion:]_block_invoke";
    v11 = 2114;
    v12 = v4;
    _os_log_debug_impl(&dword_229282000, v6, OS_LOG_TYPE_DEBUG, "%s All trial factors now %{public}@", buf, 0x16u);
  }

  +[UAFTrialUpdateManager updateTrialFactors:rolloutUpdateMode:removeUnneededFactors:expensiveNetworking:updateCount:storeManager:noRemovalNamespaces:assetSetNamespaces:progress:completion:](UAFTrialUpdateManager, "updateTrialFactors:rolloutUpdateMode:removeUnneededFactors:expensiveNetworking:updateCount:storeManager:noRemovalNamespaces:assetSetNamespaces:progress:completion:", v4, *(_QWORD *)(a1 + 72), 0, *(unsigned __int8 *)(a1 + 80), 0, *(_QWORD *)(a1 + 48), 0, v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "+[UAFTrialUpdateManager updateTrialFromAssetSetUsages:rolloutUpdateMode:expensiveNetworking:storeManager:confi"
          "gurationManager:progress:completion:]_block_invoke";
    _os_log_impl(&dword_229282000, v7, OS_LOG_TYPE_DEFAULT, "%s Finished configuring Trial from asset set usages", buf, 0xCu);
  }

}

+ (id)filterOnDemandFactors:(id)a3 namespaceName:(id)a4 trialClient:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v9, "levelForFactor:withNamespaceName:", v16, v8, (_QWORD)v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[UAFTrialUpdateManager isOnDemand:](UAFTrialUpdateManager, "isOnDemand:", v17))
          objc_msgSend(v10, "addObject:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  return v10;
}

+ (unint64_t)getTrialDownloadStatusForUsages:(id)a3 configurationManager:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  +[UAFTrialUpdateManager getTrialFactors:configurationManager:includeAllAssetSets:noRemovalNamespaces:assetSetNamespaces:](UAFTrialUpdateManager, "getTrialFactors:configurationManager:includeAllAssetSets:noRemovalNamespaces:assetSetNamespaces:", a3, a4, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v4;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v36;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v36 != v24)
          objc_enumerationMutation(obj);
        v26 = v5;
        v6 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v5);
        objc_msgSend(MEMORY[0x24BEBA908], "clientWithIdentifier:", objc_msgSend(MEMORY[0x24BEBA9A0], "projectIdFromName:", v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v29 = v6;
        objc_msgSend(obj, "objectForKeyedSubscript:", v6);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v32;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v32 != v10)
                objc_enumerationMutation(v27);
              v12 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v11);
              objc_msgSend(obj, "objectForKeyedSubscript:", v29);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectForKeyedSubscript:", v12);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "allObjects");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              +[UAFTrialUpdateManager filterOnDemandFactors:namespaceName:trialClient:](UAFTrialUpdateManager, "filterOnDemandFactors:namespaceName:trialClient:", v15, v12, v7);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v16, "count"))
              {
                v17 = objc_msgSend(v7, "statusOfDownloadForFactors:withNamespace:token:queue:progress:completion:", v16, v12, 0, 0, 0, 0);
                UAFGetLogCategory((id *)&UAFLogContextClient);
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(obj, "objectForKeyedSubscript:", v29);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "objectForKeyedSubscript:", v12);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136315906;
                  v40 = "+[UAFTrialUpdateManager getTrialDownloadStatusForUsages:configurationManager:]";
                  v41 = 2050;
                  v42 = v17;
                  v43 = 2114;
                  v44 = v12;
                  v45 = 2114;
                  v46 = v21;
                  _os_log_debug_impl(&dword_229282000, v18, OS_LOG_TYPE_DEBUG, "%s Trial reports %{public}lu status for %{public}@:%{public}@", buf, 0x2Au);

                }
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v17);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v19, v12);

              }
              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
          }
          while (v9);
        }

        v5 = v26 + 1;
      }
      while (v26 + 1 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
    }
    while (v25);
  }

  v22 = +[UAFAssetSetManager coalesceDownloadStatus:](UAFAssetSetManager, "coalesceDownloadStatus:", v28);
  return v22;
}

@end
