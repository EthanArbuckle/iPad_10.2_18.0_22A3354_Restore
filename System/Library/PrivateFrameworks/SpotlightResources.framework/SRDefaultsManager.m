@implementation SRDefaultsManager

void __48__SRDefaultsManager_currentNamespaceDescription__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "namespaceTypes");
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v30;
    do
    {
      v2 = 0;
      do
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(obj);
        v24 = v2;
        v3 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v2);
        objc_msgSend(v3, "namespaceId");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v3, "parameterNames");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v26 != v8)
                objc_enumerationMutation(v5);
              v10 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", v4);
              v11 = objc_claimAutoreleasedReturnValue();
              if (v11)
              {
                v12 = (void *)v11;
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", v4);
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "objectForKeyedSubscript:", v10);
                v14 = (void *)objc_claimAutoreleasedReturnValue();

                if (v14)
                {
                  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", v4);
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "objectForKeyedSubscript:", v10);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", v4);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v17)
                  {
                    v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
                    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v18, "setObject:forKey:", v19, v4);

                  }
                  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", v4);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "addObject:", v16);

                }
              }
            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v7);
        }

        v2 = v24 + 1;
      }
      while (v24 + 1 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v23);
  }

}

void __49__SRDefaultsManager_assetBundleForLocale_client___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id obj;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id *v69;
  void *v70;
  uint64_t v71;
  id v72;
  id v73;
  void *v74;
  uint64_t v75;
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
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _QWORD v94[3];
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "contentTypesForClient:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "assetTypes");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "namespaceTypesForClient:", *(_QWORD *)(a1 + 40));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  obj = v3;
  v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v96, 16);
  if (v63)
  {
    v61 = *(_QWORD *)v89;
    v69 = WeakRetained;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v89 != v61)
          objc_enumerationMutation(obj);
        v64 = v4;
        v5 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * v4);
        v84 = 0u;
        v85 = 0u;
        v86 = 0u;
        v87 = 0u;
        v6 = *(_QWORD *)(a1 + 48);
        v7 = *(_QWORD *)(a1 + 56);
        v94[0] = CFSTR("root");
        v94[1] = v6;
        v94[2] = v7;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v94, 3);
        v65 = (id)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
        if (v67)
        {
          v66 = *(_QWORD *)v85;
          do
          {
            v8 = 0;
            do
            {
              if (*(_QWORD *)v85 != v66)
                objc_enumerationMutation(v65);
              v68 = v8;
              v9 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * v8);
              objc_msgSend(WeakRetained[3], "objectForKeyedSubscript:", v9);
              v10 = objc_claimAutoreleasedReturnValue();
              if (v10)
              {
                v11 = (void *)v10;
                objc_msgSend(WeakRetained[3], "objectForKeyedSubscript:", v9);
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "objectForKeyedSubscript:", v5);
                v13 = (void *)objc_claimAutoreleasedReturnValue();

                if (v13)
                {
                  for (i = 0; i != 6; ++i)
                  {
                    +[SRAsset deliveryTypeString:](SRAsset, "deliveryTypeString:", i);
                    v15 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(WeakRetained[3], "objectForKeyedSubscript:", v9);
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "objectForKeyedSubscript:", v5);
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v17, "objectForKeyedSubscript:", v15);
                    v18 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v18)
                    {
                      v71 = i;
                      objc_msgSend(WeakRetained[3], "objectForKeyedSubscript:", v9);
                      v19 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v19, "objectForKeyedSubscript:", v5);
                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                      v70 = v15;
                      objc_msgSend(v20, "objectForKeyedSubscript:", v15);
                      v21 = (void *)objc_claimAutoreleasedReturnValue();

                      v82 = 0u;
                      v83 = 0u;
                      v80 = 0u;
                      v81 = 0u;
                      v74 = v21;
                      objc_msgSend(v21, "contentNames");
                      v72 = (id)objc_claimAutoreleasedReturnValue();
                      v22 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
                      if (v22)
                      {
                        v23 = v22;
                        v24 = *(_QWORD *)v81;
                        do
                        {
                          for (j = 0; j != v23; ++j)
                          {
                            if (*(_QWORD *)v81 != v24)
                              objc_enumerationMutation(v72);
                            v26 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * j);
                            objc_msgSend(v74, "pathWithName:", v26);
                            v27 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectForKeyedSubscript:", v5);
                            v28 = (void *)objc_claimAutoreleasedReturnValue();

                            if (!v28)
                            {
                              v29 = objc_alloc_init(MEMORY[0x24BDBCED8]);
                              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setObject:forKeyedSubscript:", v29, v5);

                            }
                            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectForKeyedSubscript:", v5);
                            v30 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v30, "objectForKeyedSubscript:", v9);
                            v31 = (void *)objc_claimAutoreleasedReturnValue();

                            if (!v31)
                            {
                              v32 = objc_alloc_init(MEMORY[0x24BDBCED8]);
                              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectForKeyedSubscript:", v5);
                              v33 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v33, "setObject:forKeyedSubscript:", v32, v9);

                            }
                            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectForKeyedSubscript:", v5);
                            v34 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v34, "objectForKeyedSubscript:", v9);
                            v35 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v35, "setObject:forKey:", v27, v26);

                          }
                          v23 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
                        }
                        while (v23);
                      }

                      WeakRetained = v69;
                      v15 = v70;
                      i = v71;
                    }

                  }
                }
              }
              v8 = v68 + 1;
            }
            while (v68 + 1 != v67);
            v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
          }
          while (v67);
        }

        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        v36 = v62;
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v77;
          v73 = v36;
          do
          {
            v40 = 0;
            v75 = v38;
            do
            {
              if (*(_QWORD *)v77 != v39)
                objc_enumerationMutation(v36);
              v41 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v40);
              objc_msgSend(v41, "parameterNames");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend(v42, "containsObject:", v5);

              if (v43)
              {
                objc_msgSend(v41, "namespaceId");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(WeakRetained[4], "objectForKeyedSubscript:", v44);
                v45 = objc_claimAutoreleasedReturnValue();
                if (v45)
                {
                  v46 = (void *)v45;
                  objc_msgSend(WeakRetained[4], "objectForKeyedSubscript:", v44);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "objectForKeyedSubscript:", v5);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v48)
                  {
                    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", v44);
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v49, "objectForKeyedSubscript:", v5);
                    v50 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectForKeyedSubscript:", v5);
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("trial"));
                    v52 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v52)
                    {
                      v53 = objc_alloc_init(MEMORY[0x24BDBCED8]);
                      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectForKeyedSubscript:", v5);
                      v54 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v54, "setObject:forKeyedSubscript:", v53, CFSTR("trial"));

                    }
                    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectForKeyedSubscript:", v5);
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("trial"));
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v50, "getFilePathValue");
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v50, "getFilePathNameValue");
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v56, "setValue:forKey:", v57, v58);

                    WeakRetained = v69;
                    v36 = v73;
                  }
                }

                v38 = v75;
              }
              ++v40;
            }
            while (v38 != v40);
            v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
          }
          while (v38);
        }

        v4 = v64 + 1;
      }
      while (v64 + 1 != v63);
      v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v96, 16);
    }
    while (v63);
  }

}

void __51__SRDefaultsManager_parametersOfNamespaceWithName___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(a1[4] + 16), "namespaceTypes", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v7, "parameterNames");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "containsObject:", a1[5]);

        if (v9)
        {
          objc_msgSend(v7, "namespaceId");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", v10);
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = (void *)v11;
            objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", v10);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", a1[5]);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
            {
              v15 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
              if (!v15)
              {
                v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
                v17 = *(_QWORD *)(a1[6] + 8);
                v18 = *(void **)(v17 + 40);
                *(_QWORD *)(v17 + 40) = v16;

                v15 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
              }
              objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", v10);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectForKeyedSubscript:", a1[5]);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "setObject:forKey:", v20, v10);

            }
          }

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }

}

void __38__SRDefaultsManager_currentAssetTypes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "assetTypes");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __51__SRDefaultsManager_loadFactorsAtPath_namespaceId___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
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
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  int v56;
  int v57;
  int v58;
  void *v59;
  void *v60;
  int v61;
  int v62;
  void *v63;
  uint64_t v64;
  int v65;
  const __CFString *v66;
  const __CFString *v67;
  BOOL v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *context;
  uint64_t v79;
  id v80;
  uint64_t v81;
  int v82;
  int v83;
  int v84;
  int v85;
  uint64_t v86;
  id v87;
  id obj;
  uint64_t v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x24BDAC8D0];
  context = (void *)MEMORY[0x249586164]();
  v80 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByDeletingLastPathComponent");
  v3 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = (void *)v3;
  objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v3, MEMORY[0x24BDBD1A8], 4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v100, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v96;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v96 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
        objc_msgSend(v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "hasPrefix:", CFSTR("assets_")) & 1) == 0
          && (objc_msgSend(v11, "hasPrefix:", CFSTR("default_factors_")) & 1) == 0
          && (objc_msgSend(v11, "hasPrefix:", CFSTR("factors.mdplist")) & 1) == 0)
        {
          objc_msgSend(v10, "path");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "setObject:forKey:", v12, v11);

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v100, 16);
    }
    while (v7);
  }

  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v87 = *(id *)(a1 + 40);
  v13 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v91, v99, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v90 = *(_QWORD *)v92;
    v79 = a1;
    while (1)
    {
      v16 = 0;
      v86 = v14;
      do
      {
        if (*(_QWORD *)v92 != v90)
          objc_enumerationMutation(v87);
        v17 = *(id *)(*((_QWORD *)&v91 + 1) + 8 * v16);

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v15 = v17;
          goto LABEL_120;
        }
        v18 = v17;
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Type"));
        v20 = objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = (void *)v20;
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Type"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v18);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Type"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v25 = 0;
          }

          v15 = v18;
          if (!v25)
            goto LABEL_119;
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v18);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("IrisName"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v18);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("IrisName"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v18);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("IrisName"));
              v89 = objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v89 = 0;
            }

          }
          else
          {
            v89 = 0;
          }

          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v18);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("Legacy"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32)
          {
            objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v18);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("Legacy"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v18);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Legacy"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v82 = objc_msgSend(v36, "BOOLValue");

            }
            else
            {
              v82 = 0;
            }

          }
          else
          {
            v82 = 0;
          }

          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v18);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("UserDefault"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (v38)
          {
            objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v18);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("UserDefault"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v18);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("UserDefault"));
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v85 = objc_msgSend(v42, "BOOLValue") ^ 1;

            }
            else
            {
              v85 = 1;
            }

          }
          else
          {
            v85 = 1;
          }

          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v18);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("Current"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (v44)
          {
            objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v18);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("Current"));
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v18);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("Current"));
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v84 = objc_msgSend(v48, "BOOLValue") ^ 1;

            }
            else
            {
              v84 = 1;
            }

          }
          else
          {
            v84 = 1;
          }

          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v18);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("UserDefaultFirst"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if (v50)
          {
            objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v18);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("UserDefaultFirst"));
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v18);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("UserDefaultFirst"));
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v83 = objc_msgSend(v54, "BOOLValue") ^ 1;

              a1 = v79;
            }
            else
            {
              v83 = 1;
            }

          }
          else
          {
            v83 = 1;
          }

          v55 = objc_msgSend(v25, "isEqualToString:", CFSTR("String"));
          if ((v55 & 1) != 0)
          {
            v56 = 0;
            v81 = 0;
            v57 = 0;
            goto LABEL_65;
          }
          if ((objc_msgSend(v25, "isEqualToString:", CFSTR("File")) & 1) != 0)
          {
            v81 = 0;
            v57 = 0;
            v56 = 1;
            goto LABEL_65;
          }
          if ((objc_msgSend(v25, "isEqualToString:", CFSTR("Long")) & 1) != 0)
          {
            v56 = 0;
            v57 = 0;
            v81 = 1;
            goto LABEL_65;
          }
          if ((objc_msgSend(v25, "isEqualToString:", CFSTR("Double")) & 1) != 0)
          {
            v56 = 0;
            v81 = 0;
            v57 = 1;
            goto LABEL_65;
          }
          v58 = objc_msgSend(v25, "isEqualToString:", CFSTR("Boolean"));
          v15 = v18;
          v59 = (void *)v89;
          if (v58)
          {
            v56 = 0;
            v57 = 0;
            v81 = 0x100000000;
LABEL_65:
            objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v18);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("Value"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
LABEL_66:
              v61 = v82;
              goto LABEL_82;
            }
            v62 = v57;
            objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v18);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("Platforms"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v61 = v82;
                goto LABEL_81;
              }
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ios"));
              v64 = objc_claimAutoreleasedReturnValue();

              if (v64)
              {
                v61 = 0;
                v15 = (void *)v64;
LABEL_81:
                v57 = v62;
LABEL_82:
                v68 = v61 == 0;
                v69 = 2;
                if (v68)
                  v69 = 0;
                if (!v84)
                  v69 |= 4uLL;
                if (!v85)
                  v69 |= 8uLL;
                if (v83)
                  v70 = v69;
                else
                  v70 = v69 | 0x10;
                if (v55)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    +[SRParameter parameterWithString:name:](SRParameter, "parameterWithString:name:", v15, v18);
                    v71 = objc_claimAutoreleasedReturnValue();
                    goto LABEL_109;
                  }
                }
                if (v56)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v80, "objectForKeyedSubscript:", v15);
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v72)
                    {
                      +[SRParameter parameterWithFilePath:name:](SRParameter, "parameterWithFilePath:name:", v72, v18);
                      v73 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v73 = 0;
                    }

                    goto LABEL_111;
                  }
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  if (HIDWORD(v81))
                  {
                    +[SRParameter parameterWithBoolean:name:](SRParameter, "parameterWithBoolean:name:", objc_msgSend(v15, "BOOLValue"), v18);
                    v71 = objc_claimAutoreleasedReturnValue();
LABEL_109:
                    v73 = (void *)v71;
                    goto LABEL_111;
                  }
                  if ((_DWORD)v81)
                  {
                    +[SRParameter parameterWithLong:name:](SRParameter, "parameterWithLong:name:", objc_msgSend(v15, "longValue"), v18);
                    v71 = objc_claimAutoreleasedReturnValue();
                    goto LABEL_109;
                  }
                  if (v57)
                  {
                    objc_msgSend(v15, "doubleValue");
                    +[SRParameter parameterWithDouble:name:](SRParameter, "parameterWithDouble:name:", v18);
                    v71 = objc_claimAutoreleasedReturnValue();
                    goto LABEL_109;
                  }
                }
                v73 = 0;
                goto LABEL_111;
              }
            }
            v65 = v55 | v56 | HIDWORD(v81) | v81;
            v66 = (const __CFString *)&unk_25190CD98;
            if (HIDWORD(v81))
              v66 = (const __CFString *)MEMORY[0x24BDBD1C0];
            v67 = &stru_251909998;
            if (!(v55 | v56))
              v67 = v66;
            if (v65)
              v15 = (void *)v67;
            else
              v15 = &unk_25190CDB0;
            if ((v65 | v62) == 1)
            {
              v57 = v62;
              goto LABEL_66;
            }
            v15 = 0;
            v73 = 0;
            v70 = 0;
LABEL_111:
            v59 = (void *)v89;
            if (v89)
            {
              objc_msgSend(v73, "setIrisName:", v89);
              v59 = (void *)v89;
            }
            if (v73)
            {
              objc_msgSend(v73, "setFlag:", v70);
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "setParameterName:namespaceId:", v18, *(_QWORD *)(a1 + 56));
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
              v74 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v74)
              {
                v75 = objc_alloc_init(MEMORY[0x24BDBCED8]);
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "setObject:forKeyedSubscript:", v75, *(_QWORD *)(a1 + 56));

              }
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v76, "setObject:forKeyedSubscript:", v73, v18);

              v59 = (void *)v89;
            }
          }

          goto LABEL_118;
        }
        v25 = v19;
        v15 = v18;
LABEL_118:

LABEL_119:
        v14 = v86;
LABEL_120:
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v91, v99, 16);
      if (!v14)
      {

        break;
      }
    }
  }

  objc_autoreleasePoolPop(context);
}

- (void)didUpdateTrialNamespace:(id)a3
{
  id v4;
  SRTrialConfiguration *trialConfig;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD block[6];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint8_t v39[128];
  _BYTE buf[24];
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  trialConfig = self->_trialConfig;
  if (trialConfig)
  {
    v25 = v4;
    -[SRTrialConfiguration clientsForNamespace:](trialConfig, "clientsForNamespace:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          if (+[SSTrialManager didAllNamespacesLoadForClient:](SSTrialManager, "didAllNamespacesLoadForClient:", v12))
          {
            objc_msgSend(v7, "addObject:", v12);
            SRLogCategoryGeneral();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v12;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v25;
              _os_log_debug_impl(&dword_24798C000, v13, OS_LOG_TYPE_DEBUG, "Notifying resources for client %@ of update for Trial namespace %@", buf, 0x16u);
            }

          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
      }
      while (v9);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v41 = __Block_byref_object_copy_;
    v42 = __Block_byref_object_dispose_;
    v43 = 0;
    -[SRDefaultsManager delegatesQueue](self, "delegatesQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __45__SRDefaultsManager_didUpdateTrialNamespace___block_invoke;
    block[3] = &unk_251908888;
    block[4] = self;
    block[5] = buf;
    dispatch_sync(v14, block);

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v15 = *(id *)(*(_QWORD *)&buf[8] + 40);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
          SRLogCategoryGeneral();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v19, "client");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v35 = 138412546;
            v36 = v19;
            v37 = 2112;
            v38 = v24;
            _os_log_debug_impl(&dword_24798C000, v20, OS_LOG_TYPE_DEBUG, "Delegate %@ with client %@", v35, 0x16u);

          }
          objc_msgSend(v19, "client");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v7, "containsObject:", v21);

          if (v22)
          {
            SRLogCategoryGeneral();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v35 = 138412546;
              v36 = v19;
              v37 = 2112;
              v38 = v25;
              _os_log_debug_impl(&dword_24798C000, v23, OS_LOG_TYPE_DEBUG, "Notifying delegate %@ of update for Trial namespace %@", v35, 0x16u);
            }

            objc_msgSend(v19, "didUpdateDefaults");
          }
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
      }
      while (v16);
    }

    _Block_object_dispose(buf, 8);
    v4 = v25;
  }

}

- (OS_dispatch_queue)delegatesQueue
{
  return self->_delegatesQueue;
}

void __48__SRDefaultsManager_currentNamespacesForClient___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1[4] + 16), "namespaceTypesForClient:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "namespaceId");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

void __58__SRDefaultsManager_parametersOfNamespaceWithName_client___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
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
  objc_msgSend(*(id *)(a1[4] + 16), "namespaceTypesForClient:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v7, "namespaceId");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "parameterNames");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsObject:", a1[6]);

        if (v10)
        {
          objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", v8);
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = (void *)v11;
            objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", v8);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", a1[6]);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
            {
              if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
              {
                v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
                v16 = *(_QWORD *)(a1[7] + 8);
                v17 = *(void **)(v16 + 40);
                *(_QWORD *)(v16 + 40) = v15;

              }
              objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", v8);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "objectForKeyedSubscript:", a1[6]);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setObject:forKeyedSubscript:", v19, v8);

            }
          }
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v4);
  }

}

void __36__SRDefaultsManager_notifyObservers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __42__SRDefaultsManager_updateFetchedLocales___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  if ((objc_msgSend(v2, "isEqualToSet:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v26;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v26 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v8), "localeIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      }
      while (v6);
    }

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = *(id *)(a1 + 40);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v15), "localeIdentifier", (_QWORD)v21);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
      }
      while (v13);
    }

    SRLogCategoryGeneral();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v3;
      v31 = 2112;
      v32 = v10;
      _os_log_impl(&dword_24798C000, v17, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] (fetchedLocales) update fetched locales: %@ --> %@", buf, 0x16u);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects", (_QWORD)v21);
  v18 = *(void **)(a1 + 40);
  v19 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(v18, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObjectsFromArray:", v20);

}

- (void)unregisterDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  v15 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[SRDefaultsManager delegatesQueue](self, "delegatesQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__SRDefaultsManager_unregisterDelegate___block_invoke;
  block[3] = &unk_2519088D8;
  block[4] = self;
  v6 = v4;
  v8 = v6;
  v9 = &v10;
  dispatch_sync(v5, block);

  -[SRDefaultsManager updateFetchedLocales:](self, "updateFetchedLocales:", v11[5]);
  _Block_object_dispose(&v10, 8);

}

- (void)updateFetchedLocales:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[SRDefaultsManager defaultsQueue](self, "defaultsQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__SRDefaultsManager_updateFetchedLocales___block_invoke;
  block[3] = &unk_2519084A8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __45__SRDefaultsManager_didUpdateTrialNamespace___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __42__SRDefaultsManager_sharedDefaultsManager__block_invoke()
{
  SRDefaultsManager *v0;
  void *v1;

  v0 = objc_alloc_init(SRDefaultsManager);
  v1 = (void *)sharedDefaultsManager_gDefaultsManager;
  sharedDefaultsManager_gDefaultsManager = (uint64_t)v0;

}

- (SRDefaultsManager)init
{
  SRDefaultsManager *v2;
  uint64_t v3;
  SRAssetConfiguration *assetConfig;
  uint64_t v5;
  SRTrialConfiguration *trialConfig;
  NSMutableDictionary *v7;
  NSMutableDictionary *assets;
  NSMutableDictionary *v9;
  NSMutableDictionary *parameters;
  NSMutableSet *v11;
  NSMutableSet *fetchedLocales;
  uint64_t v13;
  NSHashTable *delegates;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *ddsQueue;
  dispatch_queue_t v19;
  OS_dispatch_queue *defaultsQueue;
  dispatch_queue_t v21;
  OS_dispatch_queue *delegatesQueue;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  objc_super v32;
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v32.receiver = self;
  v32.super_class = (Class)SRDefaultsManager;
  v2 = -[SRDefaultsManager init](&v32, sel_init);
  if (v2)
  {
    +[SRAssetConfiguration configuration](SRAssetConfiguration, "configuration");
    v3 = objc_claimAutoreleasedReturnValue();
    assetConfig = v2->_assetConfig;
    v2->_assetConfig = (SRAssetConfiguration *)v3;

    +[SRTrialConfiguration configuration](SRTrialConfiguration, "configuration");
    v5 = objc_claimAutoreleasedReturnValue();
    trialConfig = v2->_trialConfig;
    v2->_trialConfig = (SRTrialConfiguration *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    assets = v2->_assets;
    v2->_assets = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    parameters = v2->_parameters;
    v2->_parameters = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    fetchedLocales = v2->_fetchedLocales;
    v2->_fetchedLocales = v11;

    v2->_fetchedRoot = 0;
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v13 = objc_claimAutoreleasedReturnValue();
    delegates = v2->_delegates;
    v2->_delegates = (NSHashTable *)v13;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_BACKGROUND, 0);
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = dispatch_queue_create("com.apple.spotlightresources.ddsLoading", v16);
    ddsQueue = v2->_ddsQueue;
    v2->_ddsQueue = (OS_dispatch_queue *)v17;

    v19 = dispatch_queue_create("com.apple.spotlightresources.defaultsLoading", v16);
    defaultsQueue = v2->_defaultsQueue;
    v2->_defaultsQueue = (OS_dispatch_queue *)v19;

    v21 = dispatch_queue_create("com.apple.spotlightresources.delegates", v16);
    delegatesQueue = v2->_delegatesQueue;
    v2->_delegatesQueue = (OS_dispatch_queue *)v21;

    objc_msgSend(MEMORY[0x24BE2B190], "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "registerDelegate:", v2);

    -[SRDefaultsManager resourceBundle](v2, "resourceBundle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "pathForResource:ofType:", CFSTR("RequiredAssets_root"), CFSTR("bundle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "fileExistsAtPath:", v25);

    if (v27)
    {
      SRLogCategoryGeneral();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
        *(_DWORD *)buf = 136315138;
        v34 = v29;
        _os_log_impl(&dword_24798C000, v28, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] loading defaults at path <%s>", buf, 0xCu);
      }

      loadAssetsFromResourcePath(v25, CFSTR("Required"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[SRDefaultsManager loadDefaultsFromDefaultAssets:](v2, "loadDefaultsFromDefaultAssets:", v30);

    }
    v2->_forceLoad = 0;

  }
  return v2;
}

void __38__SRDefaultsManager_currentNamespaces__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "namespaceDescription");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)loadDefaultsFromDefaultAssets:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD block[8];
  _QWORD v19[9];
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 1;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy_;
  v24[4] = __Block_byref_object_dispose_;
  v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  v22[4] = __Block_byref_object_dispose_;
  v23 = 0;
  +[SRAssetConfiguration configuration](SRAssetConfiguration, "configuration");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy_;
  v20[4] = __Block_byref_object_dispose_;
  v21 = 0;
  +[SRTrialConfiguration configuration](SRTrialConfiguration, "configuration");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __51__SRDefaultsManager_loadDefaultsFromDefaultAssets___block_invoke;
  v19[3] = &unk_251908810;
  v19[4] = v20;
  v19[5] = v22;
  v19[6] = &v32;
  v19[7] = &v26;
  v19[8] = v24;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v19);
  if (*((_BYTE *)v33 + 24))
  {
    -[SRDefaultsManager defaultsQueue](self, "defaultsQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __51__SRDefaultsManager_loadDefaultsFromDefaultAssets___block_invoke_82;
    block[3] = &unk_251908838;
    block[4] = self;
    block[5] = v22;
    block[6] = v20;
    block[7] = v24;
    dispatch_sync(v6, block);

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = (id)v27[5];
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v36, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v11, "contentType", (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "pathWithName:", CFSTR("factors.mdplist"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[SRDefaultsManager loadFactorsAtPath:namespaceId:](self, "loadFactorsAtPath:namespaceId:", v13, v12);

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v36, 16);
      }
      while (v8);
    }

  }
  _Block_object_dispose(v20, 8);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

}

- (void)loadFactorsAtPath:(id)a3 namespaceId:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  SRDefaultsManager *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  SRLogCategoryGeneral();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SRDefaultsManager loadFactorsAtPath:namespaceId:].cold.1();

  +[PlistReader plistReaderWithResourcePath:](PlistReader, "plistReaderWithResourcePath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "plist");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 && objc_msgSend(v11, "count"))
    {
      -[SRDefaultsManager defaultsQueue](self, "defaultsQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __51__SRDefaultsManager_loadFactorsAtPath_namespaceId___block_invoke;
      v14[3] = &unk_2519089C8;
      v15 = v6;
      v16 = v12;
      v17 = self;
      v18 = v7;
      dispatch_sync(v13, v14);

    }
  }

}

void __51__SRDefaultsManager_loadDefaultsFromDefaultAssets___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  char v28;
  void *v29;
  NSObject *v30;
  unint64_t v31;
  void *v32;
  id v33;
  unint64_t v34;
  uint64_t i;
  id v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  id v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  char v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  objc_class *v62;
  id v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  uint64_t v74;
  uint64_t k;
  id v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t m;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  id v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  id obj;
  _QWORD *v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  char isKindOfClass;
  void *v118;
  void *v119;
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
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _BYTE v140[128];
  _BYTE v141[128];
  _BYTE v142[128];
  _QWORD v143[2];
  _QWORD v144[2];
  _BYTE v145[128];
  _BYTE v146[128];
  uint64_t v147;

  v147 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  objc_msgSend(v6, "contentType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Defaults"));

  if (!v8)
  {
    objc_msgSend(v6, "pathWithName:", CFSTR("factors.mdplist"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v6;
    if (v14)
    {
      v15 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
      if (!v15)
      {
        v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v17 = *(_QWORD *)(a1[7] + 8);
        v18 = *(void **)(v17 + 40);
        *(_QWORD *)(v17 + 40) = v16;

        v19 = a1[7];
LABEL_11:
        v15 = *(void **)(*(_QWORD *)(v19 + 8) + 40);
      }
    }
    else
    {
      v15 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
      if (!v15)
      {
        v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v21 = *(_QWORD *)(a1[8] + 8);
        v22 = *(void **)(v21 + 40);
        *(_QWORD *)(v21 + 40) = v20;

        v19 = a1[8];
        goto LABEL_11;
      }
    }
    objc_msgSend(v15, "addObject:", v6);
    goto LABEL_127;
  }
  v9 = v6;
  v98 = v6;
  if (SRIsAppleInternalInstall())
  {
    objc_msgSend(v6, "pathWithName:", CFSTR("defaultsTest.plist"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "fileExistsAtPath:", v10);

    if ((v12 & 1) != 0)
    {
      sHasTestAssets = 1;
      v9 = v98;
      v13 = v10;
      if (v10)
        goto LABEL_21;
    }
    else
    {

      v9 = v98;
    }
  }
  objc_msgSend(v9, "pathWithName:", CFSTR("defaults2024.plist"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (SRIsAppleInternalInstall())
  {
    +[SRDefaultsManager defaultValueWithKey:](SRDefaultsManager, "defaultValueWithKey:", CFSTR("legacyOTA"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24 && objc_msgSend(v24, "BOOLValue"))
    {
      objc_msgSend(v98, "pathWithName:", CFSTR("defaults.plist"));
      v26 = objc_claimAutoreleasedReturnValue();

      v23 = (void *)v26;
    }

  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "fileExistsAtPath:", v23);

  if ((v28 & 1) != 0)
  {
    v9 = v98;
    v13 = v23;
    if (!v23)
    {
      v97 = 0;
      v29 = (void *)MEMORY[0x24BDBD1B8];
LABEL_26:
      v31 = 0x24BDBC000uLL;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
        *a4 = 1;
LABEL_126:

        goto LABEL_127;
      }
      v96 = v29;
      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("DefaultsCompatibilityVersion"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v29, "integerValue") == 2)
      {
        objc_msgSend(v96, "objectForKeyedSubscript:", CFSTR("Clients"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v29 = v32;
            goto LABEL_125;
          }
          v33 = v32;
          v136 = 0u;
          v137 = 0u;
          v138 = 0u;
          v139 = 0u;
          v104 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v136, v146, 16);
          obj = v33;
          if (v104)
          {
            v103 = *(_QWORD *)v137;
            v34 = 0x24BDBC000uLL;
            v106 = a1;
            do
            {
              for (i = 0; i != v104; ++i)
              {
                if (*(_QWORD *)v137 != v103)
                  objc_enumerationMutation(obj);
                v36 = *(id *)(*((_QWORD *)&v136 + 1) + 8 * i);

                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(obj, "objectForKeyedSubscript:", v36);
                  v33 = (id)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v102 = i;
                    v37 = v33;
                    objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Trial"));
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    v33 = v37;
                    v107 = v36;
                    v101 = v38;
                    if (v38)
                    {
                      v39 = v38;
                      objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("Namespaces"));
                      v40 = objc_claimAutoreleasedReturnValue();
                      v33 = v37;
                      if (v40)
                      {
                        v41 = (void *)v40;
                        objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("Namespaces"));
                        v42 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_opt_class();
                        isKindOfClass = objc_opt_isKindOfClass();

                        v33 = v37;
                        if ((isKindOfClass & 1) != 0)
                        {
                          objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("Namespaces"));
                          v43 = (void *)objc_claimAutoreleasedReturnValue();
                          v132 = 0u;
                          v133 = 0u;
                          v134 = 0u;
                          v135 = 0u;
                          v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v132, v145, 16);
                          v99 = v37;
                          if (v44)
                          {
                            v45 = v44;
                            v46 = *(_QWORD *)v133;
                            v115 = *(_QWORD *)v133;
                            v118 = v43;
                            do
                            {
                              for (j = 0; j != v45; ++j)
                              {
                                if (*(_QWORD *)v133 != v46)
                                  objc_enumerationMutation(v43);
                                v48 = *(id *)(*((_QWORD *)&v132 + 1) + 8 * j);

                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  objc_msgSend(v43, "objectForKeyedSubscript:", v48);
                                  v37 = (id)objc_claimAutoreleasedReturnValue();
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v49 = v37;
                                    objc_msgSend(v49, "objectForKey:", CFSTR("Namespace"));
                                    v50 = objc_claimAutoreleasedReturnValue();
                                    if (v50)
                                    {
                                      v51 = (void *)v50;
                                      objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("Namespace"));
                                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_opt_class();
                                      v53 = objc_opt_isKindOfClass();

                                      v34 = 0x24BDBC000;
                                      if ((v53 & 1) != 0)
                                      {
                                        objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("Namespace"));
                                        v54 = objc_claimAutoreleasedReturnValue();
                                        if (v54)
                                        {
                                          v55 = (void *)v54;
                                          v143[0] = CFSTR("namespaceId");
                                          v143[1] = CFSTR("namespaceName");
                                          v144[0] = v48;
                                          v144[1] = v54;
                                          objc_msgSend(*(id *)(v31 + 3696), "dictionaryWithObjects:forKeys:count:", v144, v143, 2);
                                          v56 = (void *)objc_claimAutoreleasedReturnValue();
                                          objc_msgSend(*(id *)(*(_QWORD *)(v106[4] + 8) + 40), "setProperties:client:", v56, v107);

                                          v34 = 0x24BDBC000;
                                        }
                                      }
                                    }

                                    v46 = v115;
                                    v43 = v118;
                                  }

                                }
                                else
                                {
                                  v37 = v48;
                                }
                                v36 = v107;
                              }
                              v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v132, v145, 16);
                            }
                            while (v45);
                          }

                          v33 = 0;
                          a1 = v106;
                          v37 = v99;
                        }
                      }
                    }
                    objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("MobileAssets"));
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v57)
                    {
                      v100 = v37;
                      v130 = 0u;
                      v131 = 0u;
                      v128 = 0u;
                      v129 = 0u;
                      v111 = v57;
                      v58 = 0x24BDBC000uLL;
                      v109 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v128, v142, 16);
                      if (v109)
                      {
                        v108 = *(_QWORD *)v129;
                        do
                        {
                          v59 = 0;
                          do
                          {
                            if (*(_QWORD *)v129 != v108)
                            {
                              v60 = v59;
                              objc_enumerationMutation(v111);
                              v59 = v60;
                            }
                            v112 = v59;
                            v61 = *(id *)(*((_QWORD *)&v128 + 1) + 8 * v59);

                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v62 = *(objc_class **)(v58 + 3800);
                              v63 = v61;
                              v64 = objc_alloc_init(v62);
                              objc_msgSend(v64, "setObject:forKey:", v63, CFSTR("AssetType"));
                              objc_msgSend(v64, "setObject:forKey:", v36, CFSTR("Client"));
                              v65 = objc_alloc_init(*(Class *)(v58 + 3800));
                              v119 = v64;
                              objc_msgSend(v64, "setObject:forKey:", v65, CFSTR("DeliveryTypes"));

                              objc_msgSend(v111, "objectForKeyedSubscript:", v63);
                              v33 = (id)objc_claimAutoreleasedReturnValue();
                              v110 = v63;

                              if (v33)
                              {
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  objc_msgSend(v111, "objectForKeyedSubscript:", v63);
                                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("MobileAssetPropertiesPath"));
                                  v67 = (void *)objc_claimAutoreleasedReturnValue();

                                  if (v67 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    v68 = v67;
                                    getMobileAssetPropertiesFromPath((uint64_t)v68);
                                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend(v119, "setObject:forKey:", v69, CFSTR("AssetProperties"));
                                    objc_msgSend(v119, "setObject:forKey:", v68, CFSTR("ResourcePath"));

                                  }
                                  else
                                  {
                                    objc_msgSend(v111, "objectForKeyedSubscript:", v110);
                                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("MobileAssetProperties"));
                                    v68 = (id)objc_claimAutoreleasedReturnValue();

                                    if (v68)
                                    {
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                        objc_msgSend(v119, "setObject:forKey:", v68, CFSTR("AssetProperties"));
                                    }
                                  }
                                  objc_msgSend(v111, "objectForKeyedSubscript:", v110);
                                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("DeliveryTypes"));
                                  v33 = (id)objc_claimAutoreleasedReturnValue();

                                  if (v33)
                                  {
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v72 = v33;
                                      v124 = 0u;
                                      v125 = 0u;
                                      v126 = 0u;
                                      v127 = 0u;
                                      v73 = v72;
                                      v116 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v124, v141, 16);
                                      if (v116)
                                      {
                                        v74 = *(_QWORD *)v125;
                                        v73 = v72;
                                        v113 = *(_QWORD *)v125;
                                        v114 = v72;
                                        do
                                        {
                                          for (k = 0; k != v116; ++k)
                                          {
                                            if (*(_QWORD *)v125 != v74)
                                              objc_enumerationMutation(v72);
                                            v76 = *(id *)(*((_QWORD *)&v124 + 1) + 8 * k);

                                            if (v76)
                                            {
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v77 = v76;
                                                objc_msgSend(v119, "objectForKeyedSubscript:", CFSTR("DeliveryTypes"));
                                                v78 = (void *)objc_claimAutoreleasedReturnValue();

                                                if (!v78)
                                                {
                                                  v79 = objc_alloc_init(*(Class *)(v58 + 3800));
                                                  objc_msgSend(v119, "setObject:forKeyedSubscript:", v79, CFSTR("DeliveryTypes"));

                                                }
                                                objc_msgSend(v119, "objectForKeyedSubscript:", CFSTR("DeliveryTypes"));
                                                v80 = (void *)objc_claimAutoreleasedReturnValue();
                                                objc_msgSend(v80, "objectForKeyedSubscript:", v77);
                                                v81 = (void *)objc_claimAutoreleasedReturnValue();

                                                if (!v81)
                                                {
                                                  v82 = objc_alloc_init(*(Class *)(v34 + 3768));
                                                  objc_msgSend(v119, "objectForKeyedSubscript:", CFSTR("DeliveryTypes"));
                                                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                                                  objc_msgSend(v83, "setObject:forKeyedSubscript:", v82, v77);

                                                }
                                                v72 = v114;
                                                objc_msgSend(v114, "objectForKeyedSubscript:", v77);
                                                v73 = (void *)objc_claimAutoreleasedReturnValue();

                                                if (v73)
                                                {
                                                  objc_opt_class();
                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                  {
                                                    objc_msgSend(v114, "objectForKeyedSubscript:", v77);
                                                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                                                    objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("ContentTypes"));
                                                    v85 = (void *)objc_claimAutoreleasedReturnValue();

                                                    if (v85)
                                                    {
                                                      objc_opt_class();
                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                      {
                                                        v86 = v85;
                                                        v120 = 0u;
                                                        v121 = 0u;
                                                        v122 = 0u;
                                                        v123 = 0u;
                                                        v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v120, v140, 16);
                                                        v88 = v86;
                                                        if (v87)
                                                        {
                                                          v89 = v87;
                                                          v90 = *(_QWORD *)v121;
                                                          v88 = v86;
                                                          do
                                                          {
                                                            for (m = 0; m != v89; ++m)
                                                            {
                                                              v92 = v88;
                                                              if (*(_QWORD *)v121 != v90)
                                                                objc_enumerationMutation(v86);
                                                              v88 = *(id *)(*((_QWORD *)&v120 + 1) + 8 * m);

                                                              if (v88)
                                                              {
                                                                objc_opt_class();
                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                {
                                                                  v93 = v88;
                                                                  objc_msgSend(v119, "objectForKeyedSubscript:", CFSTR("DeliveryTypes"));
                                                                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                                                                  objc_msgSend(v94, "objectForKeyedSubscript:", v77);
                                                                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                                                                  objc_msgSend(v95, "addObject:", v93);

                                                                }
                                                              }
                                                            }
                                                            v89 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v120, v140, 16);
                                                          }
                                                          while (v89);
                                                        }

                                                        v73 = 0;
                                                        v31 = 0x24BDBC000;
                                                        v58 = 0x24BDBC000;
                                                        v34 = 0x24BDBC000;
                                                      }
                                                      else
                                                      {
                                                        v73 = v85;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      v73 = 0;
                                                    }
                                                    v72 = v114;
                                                  }
                                                }

                                                v74 = v113;
                                              }
                                              else
                                              {
                                                v73 = v76;
                                              }
                                            }
                                            else
                                            {
                                              v73 = 0;
                                            }
                                          }
                                          v116 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v124, v141, 16);
                                        }
                                        while (v116);
                                      }

                                      v33 = 0;
                                      a1 = v106;
                                      v36 = v107;
                                    }
                                  }
                                }
                              }
                              objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "setProperties:client:", v119, v36);

                            }
                            else
                            {
                              v33 = v61;
                            }
                            v59 = v112 + 1;
                          }
                          while (v112 + 1 != v109);
                          v109 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v128, v142, 16);
                        }
                        while (v109);
                      }

                      v33 = 0;
                      v37 = v100;
                      v57 = v111;
                    }

                    i = v102;
                  }

                }
                else
                {
                  v33 = v36;
                }
              }
              v104 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v136, v146, 16);
            }
            while (v104);
          }

        }
        v29 = 0;
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
        *a4 = 1;
      }
LABEL_125:

      v9 = v98;
      goto LABEL_126;
    }
LABEL_21:
    v97 = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  SRLogCategoryGeneral();
  v30 = objc_claimAutoreleasedReturnValue();
  v9 = v98;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    __51__SRDefaultsManager_loadDefaultsFromDefaultAssets___block_invoke_cold_1((uint64_t)v23, v30);

LABEL_127:
}

void __59__SRDefaultsManager__loadAssets_deliveryType_shouldUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(v3, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    objc_msgSend(v3, "localeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  }
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(v3, "localeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v16 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    objc_msgSend(v3, "localeIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v15, v19);

  }
  v20 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(v3, "localeIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = *(unsigned __int8 *)(a1 + 48);

    if (!v26)
      goto LABEL_12;
  }
  else
  {

  }
  SRLogCategoryGeneral();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "localeIdentifier");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v29 = objc_msgSend(v28, "UTF8String");
    objc_msgSend(v3, "contentType");
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v31 = objc_msgSend(v30, "UTF8String");
    v32 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String");
    objc_msgSend(v3, "contentPaths");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "componentsJoinedByString:", CFSTR(","));
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v40 = 136315906;
    v41 = v29;
    v42 = 2080;
    v43 = v31;
    v44 = 2080;
    v45 = v32;
    v46 = 2080;
    v47 = objc_msgSend(v34, "UTF8String");
    _os_log_impl(&dword_24798C000, v27, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] (_loadAssets) loading asset: %s, %s, %s, %s", (uint8_t *)&v40, 0x2Au);

  }
  v35 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(v3, "localeIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKeyedSubscript:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentType");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectForKeyedSubscript:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));

LABEL_12:
}

- (void)_loadAssets:(id)a3 deliveryType:(id)a4 shouldUpdate:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  v8 = a4;
  v9 = a3;
  -[SRDefaultsManager defaultsQueue](self, "defaultsQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __59__SRDefaultsManager__loadAssets_deliveryType_shouldUpdate___block_invoke;
  v12[3] = &unk_251908860;
  v12[4] = self;
  v13 = v8;
  v14 = a5;
  v11 = v8;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

}

void __43__SRDefaultsManager_loadDefaultsForLocale___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v1 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v15 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        SRLogCategoryGeneral();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "assetType");
          v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v9 = objc_msgSend(v8, "UTF8String");
          v10 = objc_msgSend(v6, "compatibilityVersion");
          *(_DWORD *)buf = 136315394;
          v19 = v9;
          v20 = 2048;
          v21 = v10;
          _os_log_impl(&dword_24798C000, v7, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] (AssetServerInit) configure asset type: %s (%lu)", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x24BE2B190], "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v6, "compatibilityVersion");
        objc_msgSend(v6, "assetType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setCompatabilityVersion:forAssetType:", v12, v13);

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v3);
  }

}

uint64_t __38__SRDefaultsManager_registerDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addObject:", *(_QWORD *)(a1 + 40));
}

- (id)currentNamespaceDescription
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[SRDefaultsManager defaultsQueue](self, "defaultsQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__SRDefaultsManager_currentNamespaceDescription__block_invoke;
  v6[3] = &unk_2519088B0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)parametersOfNamespaceWithName:(id)a3 client:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  -[SRDefaultsManager defaultsQueue](self, "defaultsQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __58__SRDefaultsManager_parametersOfNamespaceWithName_client___block_invoke;
  v13[3] = &unk_2519089F0;
  v13[4] = self;
  v14 = v7;
  v15 = v6;
  v16 = &v17;
  v9 = v6;
  v10 = v7;
  dispatch_sync(v8, v13);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __41__SRDefaultsManager_didFetchForLanguage___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("root")))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 40) + 48);
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 40) + 40);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          languageCodeForLocale(*(void **)(*((_QWORD *)&v8 + 1) + 8 * i));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32), (_QWORD)v8))
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

            goto LABEL_13;
          }

        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_13:

  }
}

- (void)loadDefaultsForLocale:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  char v57;
  id v58;
  id v59;
  int64_t v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t k;
  void *v78;
  int64_t v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  NSObject *v89;
  NSObject *v90;
  NSObject *v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  void *context;
  id v97;
  id v98;
  void *v99;
  id v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  uint64_t v105;
  id obj;
  NSObject *obja;
  id v108;
  id v109;
  SRDefaultsManager *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t i;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  _QWORD v118[6];
  _QWORD v119[4];
  id v120;
  uint64_t *v121;
  _BYTE *v122;
  _QWORD v123[5];
  id v124;
  id v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  id v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  _QWORD v143[5];
  id v144;
  void *v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  _QWORD block[5];
  id v155;
  _QWORD v156[6];
  uint64_t v157;
  uint64_t *v158;
  uint64_t v159;
  uint64_t (*v160)(uint64_t, uint64_t);
  void (*v161)(uint64_t);
  id v162;
  _BYTE buf[24];
  uint64_t (*v164)(uint64_t, uint64_t);
  __int128 v165;
  _BYTE v166[128];
  _BYTE v167[128];
  _BYTE v168[128];
  _BYTE v169[128];
  _BYTE v170[128];
  _BYTE v171[128];
  uint64_t v172;

  v172 = *MEMORY[0x24BDAC8D0];
  v97 = a3;
  context = (void *)MEMORY[0x249586164]();
  v157 = 0;
  v158 = &v157;
  v159 = 0x3032000000;
  v160 = __Block_byref_object_copy_;
  v161 = __Block_byref_object_dispose_;
  v162 = 0;
  v110 = self;
  -[SRDefaultsManager currentAssetTypes](self, "currentAssetTypes");
  v162 = (id)objc_claimAutoreleasedReturnValue();
  v156[0] = MEMORY[0x24BDAC760];
  v156[1] = 3221225472;
  v156[2] = __43__SRDefaultsManager_loadDefaultsForLocale___block_invoke;
  v156[3] = &unk_2519088B0;
  v156[4] = self;
  v156[5] = &v157;
  if (loadDefaultsForLocale__onceToken != -1)
    dispatch_once(&loadDefaultsForLocale__onceToken, v156);
  languageCodeForLocale(v97);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[SRDefaultsManager didFetchForLanguage:](self, "didFetchForLanguage:"))
  {
    -[SRDefaultsManager resourceBundle](self, "resourceBundle");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v117, "isEqualToString:", CFSTR("root")) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RequiredAssets_%@"), v117);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "pathForResource:ofType:", v4, CFSTR("bundle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

      if (v7)
      {
        SRLogCategoryGeneral();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v9;
          _os_log_impl(&dword_24798C000, v8, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] loading assets at path <%s>", buf, 0xCu);
        }

        loadAssetsFromResourcePath(v5, CFSTR("Required"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SRDefaultsManager defaultsQueue](v110, "defaultsQueue");
        v11 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __43__SRDefaultsManager_loadDefaultsForLocale___block_invoke_103;
        block[3] = &unk_2519084A8;
        block[4] = v110;
        v155 = v10;
        v12 = v10;
        dispatch_sync(v11, block);

      }
    }
    if (SRIsAppleInternalInstall() && sHasTestAssets == 1)
    {
      v152 = 0u;
      v153 = 0u;
      v150 = 0u;
      v151 = 0u;
      obj = (id)v158[5];
      v111 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v150, v171, 16);
      if (v111)
      {
        v108 = *(id *)v151;
        do
        {
          for (i = 0; i != v111; ++i)
          {
            if (*(id *)v151 != v108)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * i);
            objc_msgSend(v13, "assetType");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.MobileAsset.SpotlightResources"));

            if ((v15 & 1) != 0)
            {
              v148 = 0u;
              v149 = 0u;
              v146 = 0u;
              v147 = 0u;
              objc_msgSend(v13, "deliveryTypes");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v146, v170, 16);
              if (v17)
              {
                v18 = *(_QWORD *)v147;
                do
                {
                  for (j = 0; j != v17; ++j)
                  {
                    if (*(_QWORD *)v147 != v18)
                      objc_enumerationMutation(v16);
                    v20 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * j);
                    if ((objc_msgSend(v20, "hasSuffix:", CFSTR("Test")) & 1) != 0)
                    {
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@Assets_%@"), v20, v117);
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v116, "pathForResource:ofType:", v21, CFSTR("bundle"));
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      v24 = objc_msgSend(v23, "fileExistsAtPath:", v22);

                      if (v24)
                      {
                        SRLogCategoryGeneral();
                        v25 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                        {
                          v26 = objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
                          *(_DWORD *)buf = 136315138;
                          *(_QWORD *)&buf[4] = v26;
                          _os_log_impl(&dword_24798C000, v25, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] loading assets at path <%s>", buf, 0xCu);
                        }

                        loadAssetsFromResourcePath(v22, v20);
                        v27 = (void *)objc_claimAutoreleasedReturnValue();
                        -[SRDefaultsManager defaultsQueue](v110, "defaultsQueue");
                        v28 = objc_claimAutoreleasedReturnValue();
                        v143[0] = MEMORY[0x24BDAC760];
                        v143[1] = 3221225472;
                        v143[2] = __43__SRDefaultsManager_loadDefaultsForLocale___block_invoke_108;
                        v143[3] = &unk_251908950;
                        v143[4] = v110;
                        v144 = v27;
                        v145 = v20;
                        v29 = v27;
                        dispatch_sync(v28, v143);

                      }
                    }
                  }
                  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v146, v170, 16);
                }
                while (v17);
              }

            }
          }
          v111 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v150, v171, 16);
        }
        while (v111);
      }

      goto LABEL_101;
    }
    if (!-[SRDefaultsManager forceLoad](v110, "forceLoad"))
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v164 = __Block_byref_object_copy_;
      *(_QWORD *)&v165 = __Block_byref_object_dispose_;
      *((_QWORD *)&v165 + 1) = 0;
      *((_QWORD *)&v165 + 1) = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v89 = dispatch_group_create();
      -[SRDefaultsManager ddsQueue](v110, "ddsQueue");
      v90 = objc_claimAutoreleasedReturnValue();
      v119[0] = MEMORY[0x24BDAC760];
      v119[1] = 3221225472;
      v119[2] = __43__SRDefaultsManager_loadDefaultsForLocale___block_invoke_2_113;
      v119[3] = &unk_251908978;
      v121 = &v157;
      v120 = v97;
      v122 = buf;
      dispatch_group_async(v89, v90, v119);

      -[SRDefaultsManager defaultsQueue](v110, "defaultsQueue");
      v91 = objc_claimAutoreleasedReturnValue();
      v118[0] = MEMORY[0x24BDAC760];
      v118[1] = 3221225472;
      v118[2] = __43__SRDefaultsManager_loadDefaultsForLocale___block_invoke_114;
      v118[3] = &unk_251908888;
      v118[4] = v110;
      v118[5] = buf;
      dispatch_group_notify(v89, v91, v118);

      _Block_object_dispose(buf, 8);
LABEL_101:
      -[SRDefaultsManager addFetchForLocale:](v110, "addFetchForLocale:", v97);

      goto LABEL_102;
    }
    v141 = 0u;
    v142 = 0u;
    v139 = 0u;
    v140 = 0u;
    v93 = (id)v158[5];
    v92 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v139, v169, 16);
    if (!v92)
      goto LABEL_99;
    v94 = *(_QWORD *)v140;
LABEL_38:
    v95 = 0;
    while (1)
    {
      if (*(_QWORD *)v140 != v94)
        objc_enumerationMutation(v93);
      v114 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * v95);
      objc_msgSend(v114, "assetType");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.MobileAsset.SpotlightResources"));

      v137 = 0u;
      v138 = 0u;
      v135 = 0u;
      v136 = 0u;
      objc_msgSend(v114, "deliveryTypes");
      v98 = (id)objc_claimAutoreleasedReturnValue();
      v103 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v135, v168, 16);
      if (v103)
        break;
LABEL_97:

      if (++v95 == v92)
      {
        v92 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v139, v169, 16);
        if (!v92)
        {
LABEL_99:

          goto LABEL_101;
        }
        goto LABEL_38;
      }
    }
    v102 = *(_QWORD *)v136;
LABEL_43:
    v105 = 0;
    while (1)
    {
      if (*(_QWORD *)v136 != v102)
        objc_enumerationMutation(v98);
      v109 = *(id *)(*((_QWORD *)&v135 + 1) + 8 * v105);
      SRLogCategoryGeneral();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v114, "assetType");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v82;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v109;
        _os_log_debug_impl(&dword_24798C000, v31, OS_LOG_TYPE_DEBUG, "(forceLoad=on) type %@, deliveryType %@", buf, 0x16u);

      }
      if ((objc_msgSend(v109, "isEqualToString:", CFSTR("Required")) & 1) == 0
        && (objc_msgSend(v109, "hasSuffix:", CFSTR("Test")) & 1) == 0)
      {
        break;
      }
LABEL_55:
      if (++v105 == v103)
      {
        v88 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v135, v168, 16);
        v103 = v88;
        if (!v88)
          goto LABEL_97;
        goto LABEL_43;
      }
    }
    objc_msgSend(v114, "assetType");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    assetQueryForLocale(v97, v32, v109);
    v101 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v101, "setLocalOnly:", 0);
    objc_msgSend(v101, "setInstalledOnly:", 0);
    objc_msgSend(v101, "setCachedOnly:", 0);
    v104 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(MEMORY[0x24BE2B190], "sharedInstance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = 0;
    objc_msgSend(v33, "allContentItemsMatchingQuery:error:", v101, &v134);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = v134;

    if (v100)
    {
      SRLogCategoryGeneral();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v97, "localeIdentifier");
        v83 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v84 = objc_msgSend(v83, "UTF8String");
        objc_msgSend(v114, "assetType");
        v85 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v86 = objc_msgSend(v85, "UTF8String");
        v87 = objc_msgSend(objc_retainAutorelease(v109), "UTF8String");
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v84;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = v86;
        *(_WORD *)&buf[22] = 2080;
        v164 = (uint64_t (*)(uint64_t, uint64_t))v87;
        LOWORD(v165) = 2112;
        *(_QWORD *)((char *)&v165 + 2) = v100;
        _os_log_error_impl(&dword_24798C000, v34, OS_LOG_TYPE_ERROR, "(forceLoad on) Error fetching assets for query (%s, %s, %s): %@", buf, 0x2Au);

      }
LABEL_53:

      goto LABEL_54;
    }
    if (!v99)
    {
LABEL_54:
      -[SRDefaultsManager defaultsQueue](v110, "defaultsQueue");
      v35 = objc_claimAutoreleasedReturnValue();
      v123[0] = MEMORY[0x24BDAC760];
      v123[1] = 3221225472;
      v123[2] = __43__SRDefaultsManager_loadDefaultsForLocale___block_invoke_112;
      v123[3] = &unk_251908950;
      v123[4] = v110;
      v124 = v104;
      v125 = v109;
      v36 = v104;
      dispatch_sync(v35, v123);

      goto LABEL_55;
    }
    v132 = 0u;
    v133 = 0u;
    v130 = 0u;
    v131 = 0u;
    v34 = v99;
    v37 = -[NSObject countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v130, v167, 16);
    if (!v37)
      goto LABEL_53;
    v112 = *(_QWORD *)v131;
    obja = v34;
LABEL_60:
    v115 = v37;
    v38 = 0;
    while (1)
    {
      if (*(_QWORD *)v131 != v112)
        objc_enumerationMutation(obja);
      v39 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * v38);
      objc_msgSend(v39, "type");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v40)
        goto LABEL_74;
      objc_msgSend(v114, "deliveryTypeMap");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "type");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectForKeyedSubscript:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v43)
        break;
      objc_msgSend(v114, "deliveryTypeMap");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "type");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectForKeyedSubscript:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "containsObject:", v109);

      if ((v47 & 1) == 0)
        goto LABEL_74;
      objc_msgSend(v39, "locale");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (v48)
      {
        objc_msgSend(v39, "path");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (v49)
        {
          objc_msgSend(v39, "fileName");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v50 == 0;

          if (!v51)
          {
            buf[0] = 0;
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "path");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "path");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend(v52, "fileExistsAtPath:isDirectory:", v54, buf);

            if (v55)
            {
              if (buf[0]
                && (objc_msgSend(v39, "fileName"),
                    v56 = (void *)objc_claimAutoreleasedReturnValue(),
                    v57 = objc_msgSend(v56, "containsString:", CFSTR(".")),
                    v56,
                    (v57 & 1) == 0))
              {
                objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "path");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v72, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v73, MEMORY[0x24BDBD1A8], 5, 0);
                v74 = (void *)objc_claimAutoreleasedReturnValue();

                v59 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                v128 = 0u;
                v129 = 0u;
                v126 = 0u;
                v127 = 0u;
                v58 = v74;
                v75 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v126, v166, 16);
                if (v75)
                {
                  v76 = *(_QWORD *)v127;
                  do
                  {
                    for (k = 0; k != v75; ++k)
                    {
                      if (*(_QWORD *)v127 != v76)
                        objc_enumerationMutation(v58);
                      objc_msgSend(*(id *)(*((_QWORD *)&v126 + 1) + 8 * k), "lastPathComponent");
                      v78 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v59, "addObject:", v78);

                    }
                    v75 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v126, v166, 16);
                  }
                  while (v75);
                }

                objc_msgSend(v39, "locale");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "type");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                v79 = +[SRAsset deliveryTypeFromString:](SRAsset, "deliveryTypeFromString:", v109);
                objc_msgSend(v39, "path");
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v80, "path");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                +[SRAsset assetWithLocaleIdentifier:contentType:deliveryType:resourceRoot:pathNames:](SRAsset, "assetWithLocaleIdentifier:contentType:deliveryType:resourceRoot:pathNames:", v61, v62, v79, v81, v59);
                v63 = (void *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                objc_msgSend(v39, "locale");
                v58 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "type");
                v59 = (id)objc_claimAutoreleasedReturnValue();
                v60 = +[SRAsset deliveryTypeFromString:](SRAsset, "deliveryTypeFromString:", v109);
                objc_msgSend(v39, "path");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v61, "path");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                +[SRAsset assetWithLocaleIdentifier:contentType:deliveryType:path:](SRAsset, "assetWithLocaleIdentifier:contentType:deliveryType:path:", v58, v59, v60, v62);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
              }

              if (v63)
                objc_msgSend(v104, "addObject:", v63);

            }
            goto LABEL_77;
          }
        }
        else
        {

        }
      }
      SRLogCategoryGeneral();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v39, "type");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "locale");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "path");
        v70 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "fileName");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v68;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v69;
        *(_WORD *)&buf[22] = 2112;
        v164 = v70;
        LOWORD(v165) = 2112;
        *(_QWORD *)((char *)&v165 + 2) = v71;
        _os_log_error_impl(&dword_24798C000, v64, OS_LOG_TYPE_ERROR, "(forceLoad on) Invalid dds asset (%@, %@, %@, %@)", buf, 0x2Au);

      }
LABEL_76:

LABEL_77:
      if (++v38 == v115)
      {
        v34 = obja;
        v37 = -[NSObject countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v130, v167, 16);
        if (!v37)
          goto LABEL_53;
        goto LABEL_60;
      }
    }

LABEL_74:
    SRLogCategoryGeneral();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v39, "type");
      v65 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v66 = objc_msgSend(v65, "UTF8String");
      v67 = objc_msgSend(objc_retainAutorelease(v109), "UTF8String");
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = v66;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v67;
      _os_log_debug_impl(&dword_24798C000, v64, OS_LOG_TYPE_DEBUG, "(forceLoad on) Not fetching asset with type %s for deliveryType %s", buf, 0x16u);

    }
    goto LABEL_76;
  }
LABEL_102:

  _Block_object_dispose(&v157, 8);
  objc_autoreleasePoolPop(context);

}

- (BOOL)didFetchForLanguage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v9;
  SRDefaultsManager *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[SRDefaultsManager defaultsQueue](self, "defaultsQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SRDefaultsManager_didFetchForLanguage___block_invoke;
  block[3] = &unk_251908900;
  v10 = self;
  v11 = &v12;
  v9 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)v4;
}

- (id)currentAssetTypes
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[SRDefaultsManager defaultsQueue](self, "defaultsQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__SRDefaultsManager_currentAssetTypes__block_invoke;
  v6[3] = &unk_251908888;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __43__SRDefaultsManager_loadDefaultsForLocale___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD block[5];

  v2 = (void *)MEMORY[0x249586164]();
  objc_msgSend(*(id *)(a1 + 32), "ddsQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SRDefaultsManager_loadDefaultsForLocale___block_invoke_2;
  block[3] = &unk_251908928;
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_async(v3, block);

  objc_autoreleasePoolPop(v2);
}

- (OS_dispatch_queue)ddsQueue
{
  return self->_ddsQueue;
}

- (void)registerDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[SRDefaultsManager delegatesQueue](self, "delegatesQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__SRDefaultsManager_registerDelegate___block_invoke;
  block[3] = &unk_2519084A8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (id)assetBundleForLocale:(id)a3 client:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  SRAssetBundle *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t n;
  uint64_t v42;
  void *v43;
  id v45;
  void *v46;
  id obj;
  uint64_t v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t i;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
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
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD block[5];
  id v76;
  id v77;
  id v78;
  uint64_t *v79;
  id v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;
  id location;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SRDefaultsManager loadDefaultsForLocale:](self, "loadDefaultsForLocale:", v6);
  v46 = v6;
  languageCodeForLocale(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  localeIdentifierForLocale(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  location = 0;
  objc_initWeak(&location, self);
  v81 = 0;
  v82 = &v81;
  v83 = 0x3032000000;
  v84 = __Block_byref_object_copy_;
  v85 = __Block_byref_object_dispose_;
  v86 = 0;
  v86 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[SRDefaultsManager defaultsQueue](self, "defaultsQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SRDefaultsManager_assetBundleForLocale_client___block_invoke;
  block[3] = &unk_251908A18;
  objc_copyWeak(&v80, &location);
  block[4] = self;
  v45 = v7;
  v76 = v45;
  v50 = v9;
  v77 = v50;
  v49 = v8;
  v78 = v49;
  v79 = &v81;
  dispatch_sync(v10, block);

  v11 = -[SRAssetBundle initWithLocale:]([SRAssetBundle alloc], "initWithLocale:", v46);
  v12 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  obj = (id)v82[5];
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v92, 16);
  if (v51)
  {
    v48 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v51; ++i)
      {
        if (*(_QWORD *)v72 != v48)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i);
        objc_msgSend((id)v82[5], "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("trial"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v54 = v15;
        v16 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v67, v91, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v68;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v68 != v17)
                objc_enumerationMutation(v54);
              v19 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j);
              if ((objc_msgSend(v12, "containsObject:", v19) & 1) == 0)
              {
                objc_msgSend(v54, "objectForKeyedSubscript:", v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                -[SRAssetBundle loadAssetsWithContentType:contentName:contentPath:](v11, "loadAssetsWithContentType:contentName:contentPath:", v13, v19, v20);
                objc_msgSend(v12, "addObject:", v19);

              }
            }
            v16 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v67, v91, 16);
          }
          while (v16);
        }

        objc_msgSend((id)v82[5], "objectForKeyedSubscript:", v13);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", v50);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        v53 = v22;
        v23 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v63, v90, 16);
        if (v23)
        {
          v24 = *(_QWORD *)v64;
          do
          {
            for (k = 0; k != v23; ++k)
            {
              if (*(_QWORD *)v64 != v24)
                objc_enumerationMutation(v53);
              v26 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * k);
              if ((objc_msgSend(v12, "containsObject:", v26) & 1) == 0)
              {
                objc_msgSend(v53, "objectForKeyedSubscript:", v26);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[SRAssetBundle loadAssetsWithContentType:contentName:contentPath:](v11, "loadAssetsWithContentType:contentName:contentPath:", v13, v26, v27);
                objc_msgSend(v12, "addObject:", v26);

              }
            }
            v23 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v63, v90, 16);
          }
          while (v23);
        }

        objc_msgSend((id)v82[5], "objectForKeyedSubscript:", v13);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", v49);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v30 = v29;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v59, v89, 16);
        if (v31)
        {
          v32 = *(_QWORD *)v60;
          do
          {
            for (m = 0; m != v31; ++m)
            {
              if (*(_QWORD *)v60 != v32)
                objc_enumerationMutation(v30);
              v34 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * m);
              if ((objc_msgSend(v12, "containsObject:", v34) & 1) == 0)
              {
                objc_msgSend(v30, "objectForKeyedSubscript:", v34);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                -[SRAssetBundle loadAssetsWithContentType:contentName:contentPath:](v11, "loadAssetsWithContentType:contentName:contentPath:", v13, v34, v35);
                objc_msgSend(v12, "addObject:", v34);

              }
            }
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v59, v89, 16);
          }
          while (v31);
        }

        objc_msgSend((id)v82[5], "objectForKeyedSubscript:", v13);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("root"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v38 = v37;
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v55, v88, 16);
        if (v39)
        {
          v40 = *(_QWORD *)v56;
          do
          {
            for (n = 0; n != v39; ++n)
            {
              if (*(_QWORD *)v56 != v40)
                objc_enumerationMutation(v38);
              v42 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * n);
              if ((objc_msgSend(v12, "containsObject:", v42) & 1) == 0)
              {
                objc_msgSend(v38, "objectForKeyedSubscript:", v42);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                -[SRAssetBundle loadAssetsWithContentType:contentName:contentPath:](v11, "loadAssetsWithContentType:contentName:contentPath:", v13, v42, v43);
                objc_msgSend(v12, "addObject:", v42);

              }
            }
            v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v55, v88, 16);
          }
          while (v39);
        }

        objc_msgSend(v12, "removeAllObjects");
      }
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v92, 16);
    }
    while (v51);
  }

  objc_destroyWeak(&v80);
  _Block_object_dispose(&v81, 8);

  objc_destroyWeak(&location);
  return v11;
}

- (id)currentNamespaces
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[SRDefaultsManager defaultsQueue](self, "defaultsQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__SRDefaultsManager_currentNamespaces__block_invoke;
  v6[3] = &unk_251908888;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)setOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 forceLoad;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("forceLoad"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      forceLoad = self->_forceLoad;
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("forceLoad"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      self->_forceLoad = objc_msgSend(v8, "BOOLValue");

      if (!forceLoad && self->_forceLoad)
      {
        -[SRDefaultsManager fetchedLocales](self, "fetchedLocales");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v16;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v16 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
              -[SRDefaultsManager unloadDefaultsForLocale:](self, "unloadDefaultsForLocale:", v14);
              -[SRDefaultsManager loadDefaultsForLocale:](self, "loadDefaultsForLocale:", v14);
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          }
          while (v11);
        }
        -[SRDefaultsManager notifyObservers](self, "notifyObservers");

      }
    }
  }

}

- (id)currentNamespacesForClient:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v17 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[SRDefaultsManager defaultsQueue](self, "defaultsQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__SRDefaultsManager_currentNamespacesForClient___block_invoke;
  block[3] = &unk_2519088D8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

+ (id)sharedDefaultsManager
{
  if (sharedDefaultsManager_onceToken != -1)
    dispatch_once(&sharedDefaultsManager_onceToken, &__block_literal_global_4);
  return (id)sharedDefaultsManager_gDefaultsManager;
}

- (id)parametersOfNamespaceWithName:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  -[SRDefaultsManager defaultsQueue](self, "defaultsQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__SRDefaultsManager_parametersOfNamespaceWithName___block_invoke;
  block[3] = &unk_2519088D8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (OS_dispatch_queue)defaultsQueue
{
  return self->_defaultsQueue;
}

- (id)resourceBundle
{
  NSBundle *v2;
  void *v3;

  v2 = self->_customBundle;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@System/Library/PrivateFrameworks/SpotlightResources.framework"), CFSTR("/"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v3);
    v2 = (NSBundle *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SpotlightResources"));
      v2 = (NSBundle *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v2;
}

- (BOOL)forceLoad
{
  return self->_forceLoad;
}

- (void)addFetchForLocale:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  SRDefaultsManager *v9;

  v4 = a3;
  -[SRDefaultsManager defaultsQueue](self, "defaultsQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__SRDefaultsManager_addFetchForLocale___block_invoke;
  block[3] = &unk_2519084A8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __40__SRDefaultsManager_unregisterDelegate___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1[4] + 56), "removeObject:", a1[5]);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(a1[4] + 56);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "locale", (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __39__SRDefaultsManager_addFetchForLocale___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  SRLogCategoryGeneral();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "localeIdentifier");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = 136315138;
    v8 = objc_msgSend(v3, "UTF8String");
    _os_log_impl(&dword_24798C000, v2, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] (addFetchForLocale) asset fetch for locale: %s", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("root"));

  v6 = *(_QWORD *)(a1 + 40);
  if (v5)
    *(_BYTE *)(v6 + 48) = 1;
  else
    objc_msgSend(*(id *)(v6 + 40), "addObject:", *(_QWORD *)(a1 + 32));
}

- (void)notifyObservers
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _QWORD block[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  -[SRDefaultsManager delegatesQueue](self, "delegatesQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__SRDefaultsManager_notifyObservers__block_invoke;
  block[3] = &unk_251908888;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(v3, block);

  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v4 = (id)v14[5];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v19, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "didUpdateDefaults", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v19, 16);
    }
    while (v5);
  }

  _Block_object_dispose(&v13, 8);
}

+ (id)identifier
{
  return CFSTR("com.apple.SpotlightResources.Defaults");
}

+ (id)userDefaults
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BDBCF50]);
  +[SRDefaultsManager identifier](SRDefaultsManager, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithSuiteName:", v3);

  return v4;
}

+ (id)defaultProperties
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("Defaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)setDefaultWithKey:(id)a3 value:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "userDefaults");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "defaultProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "mutableCopy");

  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  }

  objc_msgSend(v9, "setObject:forKey:", v5, v6);
  objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("Defaults"));

}

+ (id)defaultValueWithKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)removeKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "userDefaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "removeObjectForKey:", v3);
  objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("Defaults"));

}

+ (void)removeDefaults
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SRDefaultsManager identifier](SRDefaultsManager, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removePersistentDomainForName:", v3);

  objc_msgSend(MEMORY[0x24BDBCF50], "resetStandardUserDefaults");
}

+ (void)setVersionWithValue:(int64_t)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultWithKey:value:", CFSTR("Version"), v5);

}

+ (int64_t)version
{
  void *v2;
  void *v3;
  int64_t v4;

  +[SRDefaultsManager defaultValueWithKey:](SRDefaultsManager, "defaultValueWithKey:", CFSTR("Version"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

uint64_t __51__SRDefaultsManager_loadDefaultsFromDefaultAssets___block_invoke_82(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_loadAssets:deliveryType:shouldUpdate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), CFSTR("Required"), 1);
}

- (void)_unloadAssetsForLocale:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SRDefaultsManager defaultsQueue](self, "defaultsQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  languageCodeForLocale(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("root")) & 1) == 0)
  {
    SRLogCategoryGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "localeIdentifier");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9 = 136315138;
      v10 = objc_msgSend(v8, "UTF8String");
      _os_log_impl(&dword_24798C000, v7, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] (_unloadAssetsForLocale) unloading assets for locale: %s", (uint8_t *)&v9, 0xCu);

    }
    -[NSMutableDictionary removeObjectForKey:](self->_assets, "removeObjectForKey:", v6);
  }

}

- (id)fetchedLocales
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[SRDefaultsManager defaultsQueue](self, "defaultsQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__SRDefaultsManager_fetchedLocales__block_invoke;
  v6[3] = &unk_251908888;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __35__SRDefaultsManager_fetchedLocales__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "mutableCopy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 48))
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("root"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

- (void)removeFetchForLocale:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  SRDefaultsManager *v9;

  v4 = a3;
  -[SRDefaultsManager defaultsQueue](self, "defaultsQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__SRDefaultsManager_removeFetchForLocale___block_invoke;
  block[3] = &unk_2519084A8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __42__SRDefaultsManager_removeFetchForLocale___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  SRLogCategoryGeneral();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "localeIdentifier");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = 136315138;
    v8 = objc_msgSend(v3, "UTF8String");
    _os_log_impl(&dword_24798C000, v2, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] (removeFetchForLocale) remove asset fetch for locale: %s", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("root"));

  v6 = *(_QWORD *)(a1 + 40);
  if (v5)
    *(_BYTE *)(v6 + 48) = 0;
  else
    objc_msgSend(*(id *)(v6 + 40), "removeObject:", *(_QWORD *)(a1 + 32));
}

- (void)removeFetchForLanguage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  SRDefaultsManager *v9;

  v4 = a3;
  -[SRDefaultsManager defaultsQueue](self, "defaultsQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__SRDefaultsManager_removeFetchForLanguage___block_invoke;
  block[3] = &unk_2519084A8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __44__SRDefaultsManager_removeFetchForLanguage___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  SRLogCategoryGeneral();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
    *(_DWORD *)buf = 136315138;
    v20 = v3;
    _os_log_impl(&dword_24798C000, v2, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] (removeFetchForLanguage) remove asset fetch for language: %s", buf, 0xCu);
  }

  v4 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("root"));
  v5 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    *(_BYTE *)(v5 + 48) = 0;
  }
  else
  {
    v6 = (void *)objc_msgSend(*(id *)(v5 + 40), "copy");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          languageCodeForLocale(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isEqualToString:", *(_QWORD *)(a1 + 32), (_QWORD)v14))
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "removeObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
}

- (void)requestAssetsForLanguages:(id)a3 resourcePath:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;

  v6 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__SRDefaultsManager_requestAssetsForLanguages_resourcePath___block_invoke;
  block[3] = &unk_2519084A8;
  block[4] = self;
  v11 = v6;
  v7 = requestAssetsForLanguages_resourcePath__onceToken;
  v9 = v6;
  v8 = a3;
  if (v7 != -1)
    dispatch_once(&requestAssetsForLanguages_resourcePath__onceToken, block);
  -[SRDefaultsManager requestAssetsForLanguages:](self, "requestAssetsForLanguages:", v8);

}

void __60__SRDefaultsManager_requestAssetsForLanguages_resourcePath___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  _QWORD *v6;
  _QWORD v7[5];
  id v8;

  v2 = (void *)MEMORY[0x249586164]();
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy_;
  v7[4] = __Block_byref_object_dispose_;
  v8 = 0;
  objc_msgSend(*(id *)(a1 + 32), "currentAssetTypes");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "ddsQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __60__SRDefaultsManager_requestAssetsForLanguages_resourcePath___block_invoke_2;
  v4[3] = &unk_251908888;
  v6 = v7;
  v5 = *(id *)(a1 + 40);
  dispatch_async(v3, v4);

  _Block_object_dispose(v7, 8);
  objc_autoreleasePoolPop(v2);
}

void __60__SRDefaultsManager_requestAssetsForLanguages_resourcePath___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  __int128 v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t v59[128];
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  _BYTE v64[128];
  uint64_t v65;

  v1 = a1;
  v65 = *MEMORY[0x24BDAC8D0];
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v56;
    *(_QWORD *)&v4 = 136315394;
    v43 = v4;
    v45 = v2;
    v46 = v1;
    v44 = *(_QWORD *)v56;
    do
    {
      v7 = 0;
      v47 = v5;
      do
      {
        if (*(_QWORD *)v56 != v6)
          objc_enumerationMutation(v2);
        v50 = v7;
        v8 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v7);
        objc_msgSend(v8, "assetType", v43);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.MobileAsset.SpotlightResources"));

        if (v10)
        {
          objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", *(_QWORD *)(v1 + 32), 1);
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = objc_alloc(MEMORY[0x24BE2B1B8]);
          objc_msgSend(v8, "assetType");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = (void *)v11;
          v14 = objc_msgSend(v12, "initWithXPCServiceName:assertionStorageDirectoryURL:", v13, v11);

          v48 = (void *)v14;
          objc_msgSend(MEMORY[0x24BE2B1B0], "sharedInstanceWithConfiguration:", v14);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)sAssetServer;
          sAssetServer = v15;

          SRLogCategoryGeneral();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v8, "assetType");
            v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v19 = objc_msgSend(v18, "UTF8String");
            v20 = objc_msgSend(v8, "compatibilityVersion");
            *(_DWORD *)buf = v43;
            v61 = v19;
            v62 = 2048;
            v63 = v20;
            _os_log_impl(&dword_24798C000, v17, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] (AssetServerInit) configure asset type: %s (%lu)", buf, 0x16u);

          }
          v21 = (void *)sAssetServer;
          v22 = objc_msgSend(v8, "compatibilityVersion");
          objc_msgSend(v8, "assetType");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setCompatabilityVersion:forAssetType:", v22, v23);

          objc_msgSend(MEMORY[0x24BE2B190], "sharedInstance");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "xpcName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "assetType");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setXPCServiceName:forAssetType:", v25, v26);

          if (+[SRDefaultsManager version](SRDefaultsManager, "version") != 1)
          {
            objc_msgSend(MEMORY[0x24BE2B190], "sharedInstance");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "assetType");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "assertionIDsForClientID:assetType:", CFSTR("SpotlightResources"), v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v29;
            if (v29)
            {
              v31 = v29;
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDBCF20], "set");
              v31 = (id)objc_claimAutoreleasedReturnValue();
            }
            v32 = v31;

            v53 = 0u;
            v54 = 0u;
            v51 = 0u;
            v52 = 0u;
            v33 = v32;
            v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
            if (v34)
            {
              v35 = v34;
              v36 = *(_QWORD *)v52;
              do
              {
                for (i = 0; i != v35; ++i)
                {
                  if (*(_QWORD *)v52 != v36)
                    objc_enumerationMutation(v33);
                  v38 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
                  SRLogCategoryGeneral();
                  v39 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                  {
                    v40 = objc_msgSend(objc_retainAutorelease(v38), "UTF8String");
                    *(_DWORD *)buf = 136315138;
                    v61 = v40;
                    _os_log_impl(&dword_24798C000, v39, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] (removeAssertionWithIdentifier) removing assertion: %s", buf, 0xCu);
                  }

                  objc_msgSend(MEMORY[0x24BE2B190], "sharedInstance");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v8, "assetType");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "removeAssertionWithIdentifier:assetType:", v38, v42);

                }
                v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
              }
              while (v35);
            }

            v2 = v45;
            v1 = v46;
            v6 = v44;
          }
          +[SRDefaultsManager setVersion:](SRDefaultsManager, "setVersion:", 1);

          v5 = v47;
        }
        v7 = v50 + 1;
      }
      while (v50 + 1 != v5);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
    }
    while (v5);
  }

}

- (void)requestAssetsForLanguages:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = (void *)MEMORY[0x249586164]();
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy_;
  v11[4] = __Block_byref_object_dispose_;
  v12 = 0;
  -[SRDefaultsManager currentAssetTypes](self, "currentAssetTypes");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[SRDefaultsManager ddsQueue](self, "ddsQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__SRDefaultsManager_requestAssetsForLanguages___block_invoke;
  v8[3] = &unk_251908888;
  v10 = v11;
  v7 = v4;
  v9 = v7;
  dispatch_async(v6, v8);

  _Block_object_dispose(v11, 8);
  objc_autoreleasePoolPop(v5);

}

void __47__SRDefaultsManager_requestAssetsForLanguages___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id obj;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  void *v54;
  id v55;
  char v56;
  void *v57;
  void *v58;
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
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t v75[128];
  uint8_t buf[4];
  uint64_t v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
  if (v46)
  {
    v45 = *(_QWORD *)v72;
    do
    {
      v1 = 0;
      do
      {
        if (*(_QWORD *)v72 != v45)
          objc_enumerationMutation(obj);
        v2 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v1);
        objc_msgSend(MEMORY[0x24BE2B190], "sharedInstance");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v2;
        objc_msgSend(v2, "assetType");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "assertionIDsForClientID:assetType:", CFSTR("SpotlightResources"), v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v47 = v1;
        if (v5)
        {
          v7 = v5;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCF20], "set");
          v7 = (id)objc_claimAutoreleasedReturnValue();
        }
        v8 = v7;

        v57 = (void *)objc_msgSend(v8, "mutableCopy");
        objc_msgSend(v54, "assetType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.MobileAsset.SpotlightResources"));

        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        objc_msgSend(v54, "deliveryTypes");
        v52 = (id)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v68;
          v49 = *(_QWORD *)v68;
          v50 = v8;
          do
          {
            v13 = 0;
            v51 = v11;
            do
            {
              if (*(_QWORD *)v68 != v12)
                objc_enumerationMutation(v52);
              v58 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v13);
              if ((objc_msgSend(v58, "isEqualToString:", CFSTR("Required")) & 1) == 0)
              {
                v53 = v13;
                v65 = 0u;
                v66 = 0u;
                v63 = 0u;
                v64 = 0u;
                v55 = *(id *)(a1 + 32);
                v14 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v63, v78, 16);
                v15 = 0x24BDBC000uLL;
                v16 = v54;
                if (v14)
                {
                  v17 = v14;
                  v18 = *(_QWORD *)v64;
                  do
                  {
                    for (i = 0; i != v17; ++i)
                    {
                      if (*(_QWORD *)v64 != v18)
                        objc_enumerationMutation(v55);
                      objc_msgSend(*(id *)(v15 + 3744), "localeWithLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i));
                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                      languageCodeForLocale(v20);
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      v22 = (void *)MEMORY[0x24BDD17C8];
                      objc_msgSend(v16, "assetType");
                      v23 = objc_claimAutoreleasedReturnValue();
                      v24 = (void *)v23;
                      if ((v56 & 1) != 0)
                        objc_msgSend(v22, "stringWithFormat:", CFSTR("SpotlightResources:%@:%@:%@"), v23, v58, v21);
                      else
                        objc_msgSend(v22, "stringWithFormat:", CFSTR("SpotlightResources:%@:%@"), v23, v21, v43);
                      v25 = (void *)objc_claimAutoreleasedReturnValue();

                      if ((objc_msgSend(v57, "containsObject:", v25) & 1) == 0)
                      {
                        v26 = objc_alloc_init(MEMORY[0x24BE2B198]);
                        objc_msgSend(*(id *)(v15 + 3744), "localeWithLocaleIdentifier:", v21);
                        v27 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v16, "assetType");
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        assetQueryForLocale(v27, v28, v58);
                        v29 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_msgSend(v29, "setLocalOnly:", 0);
                        objc_msgSend(v29, "setInstalledOnly:", 0);
                        objc_msgSend(v29, "setCachedOnly:", 0);
                        SRLogCategoryGeneral();
                        v30 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                        {
                          v31 = objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
                          *(_DWORD *)buf = 136315138;
                          v77 = v31;
                          _os_log_impl(&dword_24798C000, v30, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] (addAssertionWithIdentifier) adding assertion: %s", buf, 0xCu);
                        }

                        objc_msgSend(MEMORY[0x24BE2B190], "sharedInstance");
                        v32 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v32, "addAssertionForAssetsWithQuery:policy:assertionID:clientID:", v29, v26, v25, CFSTR("SpotlightResources"));

                        v15 = 0x24BDBC000;
                        v16 = v54;
                      }

                    }
                    v17 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v63, v78, 16);
                  }
                  while (v17);
                }

                v12 = v49;
                v8 = v50;
                v11 = v51;
                v13 = v53;
              }
              ++v13;
            }
            while (v13 != v11);
            v11 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
          }
          while (v11);
        }

        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v33 = v57;
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v59, v75, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v60;
          do
          {
            for (j = 0; j != v35; ++j)
            {
              if (*(_QWORD *)v60 != v36)
                objc_enumerationMutation(v33);
              v38 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
              SRLogCategoryGeneral();
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                v40 = objc_msgSend(objc_retainAutorelease(v38), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v77 = v40;
                _os_log_impl(&dword_24798C000, v39, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] (removeAssertionWithIdentifier) removing assertion: %s", buf, 0xCu);
              }

              objc_msgSend(MEMORY[0x24BE2B190], "sharedInstance");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "assetType");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "removeAssertionWithIdentifier:assetType:", v38, v42);

            }
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v59, v75, 16);
          }
          while (v35);
        }

        v1 = v47 + 1;
      }
      while (v47 + 1 != v46);
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
    }
    while (v46);
  }

}

uint64_t __43__SRDefaultsManager_loadDefaultsForLocale___block_invoke_103(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadAssets:deliveryType:shouldUpdate:", *(_QWORD *)(a1 + 40), CFSTR("Required"), 1);
}

uint64_t __43__SRDefaultsManager_loadDefaultsForLocale___block_invoke_108(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadAssets:deliveryType:shouldUpdate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
}

uint64_t __43__SRDefaultsManager_loadDefaultsForLocale___block_invoke_112(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadAssets:deliveryType:shouldUpdate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
}

void __43__SRDefaultsManager_loadDefaultsForLocale___block_invoke_2_113(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  char v40;
  id v41;
  id v42;
  int64_t v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t i;
  void *v61;
  int64_t v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id obj;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  NSObject *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  id v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _BYTE v111[128];
  uint8_t v112[128];
  uint8_t buf[4];
  uint64_t v114;
  __int16 v115;
  uint64_t v116;
  __int16 v117;
  uint64_t v118;
  __int16 v119;
  void *v120;
  _BYTE v121[128];
  _BYTE v122[128];
  uint64_t v123;

  v1 = a1;
  v123 = *MEMORY[0x24BDAC8D0];
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  obj = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v122, 16);
  if (v79)
  {
    v78 = *(_QWORD *)v108;
    v85 = v1;
    do
    {
      v2 = 0;
      do
      {
        if (*(_QWORD *)v108 != v78)
          objc_enumerationMutation(obj);
        v80 = v2;
        v3 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * v2);
        objc_msgSend(v3, "assetType");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.MobileAsset.SpotlightResources"));

        v105 = 0u;
        v106 = 0u;
        v103 = 0u;
        v104 = 0u;
        objc_msgSend(v3, "deliveryTypes");
        v84 = (id)objc_claimAutoreleasedReturnValue();
        v87 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v103, v121, 16);
        if (v87)
        {
          v86 = *(_QWORD *)v104;
          v89 = v3;
          do
          {
            v5 = 0;
            do
            {
              if (*(_QWORD *)v104 != v86)
                objc_enumerationMutation(v84);
              v88 = v5;
              v6 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v5);
              SRLogCategoryGeneral();
              v7 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v3, "assetType");
                v69 = v6;
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v114 = (uint64_t)v70;
                v115 = 2112;
                v116 = (uint64_t)v69;
                _os_log_debug_impl(&dword_24798C000, v7, OS_LOG_TYPE_DEBUG, "(forceLoad=off) type %@, deliveryType %@", buf, 0x16u);

                v6 = v69;
              }

              if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Required")) & 1) == 0
                && (objc_msgSend(v6, "hasSuffix:", CFSTR("Test")) & 1) == 0)
              {
                v8 = *(void **)(v1 + 32);
                objc_msgSend(v3, "assetType");
                v9 = (void *)objc_claimAutoreleasedReturnValue();
                v10 = v6;
                v11 = v9;
                v92 = v10;
                assetQueryForLocale(v8, v9, v10);
                v12 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v12, "setLocalOnly:", 0);
                objc_msgSend(v12, "setInstalledOnly:", 0);
                objc_msgSend(v12, "setCachedOnly:", 0);
                objc_msgSend(MEMORY[0x24BE2B190], "sharedInstance");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                v102 = 0;
                v82 = v12;
                objc_msgSend(v13, "allContentItemsMatchingQuery:error:", v12, &v102);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = v102;

                v83 = v15;
                if (v15)
                {
                  v81 = v14;
                  SRLogCategoryGeneral();
                  v93 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(*(id *)(v1 + 32), "localeIdentifier");
                    v71 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                    v72 = objc_msgSend(v71, "UTF8String");
                    objc_msgSend(v3, "assetType");
                    v73 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                    v74 = objc_msgSend(v73, "UTF8String");
                    v75 = objc_msgSend(objc_retainAutorelease(v92), "UTF8String");
                    *(_DWORD *)buf = 136315906;
                    v114 = v72;
                    v115 = 2080;
                    v116 = v74;
                    v1 = v85;
                    v117 = 2080;
                    v118 = v75;
                    v119 = 2112;
                    v120 = v83;
                    _os_log_error_impl(&dword_24798C000, v93, OS_LOG_TYPE_ERROR, "Error fetching assets for query (%s, %s, %s): %@", buf, 0x2Au);

                  }
LABEL_18:

                  v14 = v81;
                  goto LABEL_19;
                }
                if (!v14)
                {
LABEL_19:

                  goto LABEL_20;
                }
                v100 = 0u;
                v101 = 0u;
                v98 = 0u;
                v99 = 0u;
                v81 = v14;
                v93 = v14;
                v16 = -[NSObject countByEnumeratingWithState:objects:count:](v93, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
                if (!v16)
                  goto LABEL_18;
                v17 = v16;
                v18 = *(_QWORD *)v99;
                v90 = *(_QWORD *)v99;
                while (2)
                {
                  v19 = 0;
                  v91 = v17;
LABEL_26:
                  if (*(_QWORD *)v99 != v18)
                    objc_enumerationMutation(v93);
                  v20 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v19);
                  objc_msgSend(v20, "type");
                  v21 = objc_claimAutoreleasedReturnValue();
                  if (v21)
                  {
                    v22 = (void *)v21;
                    objc_msgSend(v3, "deliveryTypeMap");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "type");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v23, "objectForKeyedSubscript:", v24);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v25)
                    {
                      objc_msgSend(v3, "deliveryTypeMap");
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v20, "type");
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v26, "objectForKeyedSubscript:", v27);
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      v29 = objc_msgSend(v28, "containsObject:", v92);

                      v17 = v91;
                      v18 = v90;

                      v3 = v89;
                      if ((v29 & 1) != 0)
                      {
                        objc_msgSend(v20, "locale");
                        v30 = objc_claimAutoreleasedReturnValue();
                        if (v30)
                        {
                          v31 = (void *)v30;
                          objc_msgSend(v20, "path");
                          v32 = objc_claimAutoreleasedReturnValue();
                          if (v32)
                          {
                            v33 = (void *)v32;
                            objc_msgSend(v20, "fileName");
                            v34 = (void *)objc_claimAutoreleasedReturnValue();

                            if (v34)
                            {
                              buf[0] = 0;
                              objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
                              v35 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v20, "path");
                              v36 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v36, "path");
                              v37 = (void *)objc_claimAutoreleasedReturnValue();
                              v38 = objc_msgSend(v35, "fileExistsAtPath:isDirectory:", v37, buf);

                              if (v38)
                              {
                                if (buf[0]
                                  && (objc_msgSend(v20, "fileName"),
                                      v39 = (void *)objc_claimAutoreleasedReturnValue(),
                                      v40 = objc_msgSend(v39, "containsString:", CFSTR(".")),
                                      v39,
                                      (v40 & 1) == 0))
                                {
                                  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
                                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v20, "path");
                                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v54, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v55, MEMORY[0x24BDBD1A8], 5, 0);
                                  v56 = (void *)objc_claimAutoreleasedReturnValue();

                                  v42 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                                  v94 = 0u;
                                  v95 = 0u;
                                  v96 = 0u;
                                  v97 = 0u;
                                  v41 = v56;
                                  v57 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
                                  if (v57)
                                  {
                                    v58 = v57;
                                    v59 = *(_QWORD *)v95;
                                    do
                                    {
                                      for (i = 0; i != v58; ++i)
                                      {
                                        if (*(_QWORD *)v95 != v59)
                                          objc_enumerationMutation(v41);
                                        objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * i), "lastPathComponent");
                                        v61 = (void *)objc_claimAutoreleasedReturnValue();
                                        objc_msgSend(v42, "addObject:", v61);

                                      }
                                      v58 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
                                    }
                                    while (v58);
                                  }

                                  objc_msgSend(v20, "locale");
                                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v20, "type");
                                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                                  v62 = +[SRAsset deliveryTypeFromString:](SRAsset, "deliveryTypeFromString:", v92);
                                  objc_msgSend(v20, "path");
                                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v63, "path");
                                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                                  +[SRAsset assetWithLocaleIdentifier:contentType:deliveryType:resourceRoot:pathNames:](SRAsset, "assetWithLocaleIdentifier:contentType:deliveryType:resourceRoot:pathNames:", v44, v45, v62, v64, v42);
                                  v46 = (void *)objc_claimAutoreleasedReturnValue();

                                  v18 = v90;
                                  v3 = v89;
                                }
                                else
                                {
                                  objc_msgSend(v20, "locale");
                                  v41 = (id)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v20, "type");
                                  v42 = (id)objc_claimAutoreleasedReturnValue();
                                  v43 = +[SRAsset deliveryTypeFromString:](SRAsset, "deliveryTypeFromString:", v92);
                                  objc_msgSend(v20, "path");
                                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v44, "path");
                                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                                  +[SRAsset assetWithLocaleIdentifier:contentType:deliveryType:path:](SRAsset, "assetWithLocaleIdentifier:contentType:deliveryType:path:", v41, v42, v43, v45);
                                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                                }

                                v17 = v91;
                                if (v46)
                                {
                                  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v85 + 48) + 8) + 40), "objectForKeyedSubscript:", v92);
                                  v65 = (void *)objc_claimAutoreleasedReturnValue();

                                  if (!v65)
                                  {
                                    v66 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                                    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v85 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v66, v92);

                                  }
                                  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v85 + 48) + 8) + 40), "objectForKeyedSubscript:", v92);
                                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v67, "addObject:", v46);

                                }
                              }
LABEL_41:
                              if (++v19 == v17)
                              {
                                v68 = -[NSObject countByEnumeratingWithState:objects:count:](v93, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
                                v17 = v68;
                                if (!v68)
                                {
                                  v1 = v85;
                                  goto LABEL_18;
                                }
                                continue;
                              }
                              goto LABEL_26;
                            }
                          }
                          else
                          {

                          }
                        }
                        SRLogCategoryGeneral();
                        v47 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                        {
                          objc_msgSend(v20, "type");
                          v48 = (id)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v20, "locale");
                          v51 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v20, "path");
                          v52 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v20, "fileName");
                          v53 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138413058;
                          v114 = (uint64_t)v48;
                          v115 = 2112;
                          v116 = (uint64_t)v51;
                          v117 = 2112;
                          v118 = (uint64_t)v52;
                          v119 = 2112;
                          v120 = v53;
                          _os_log_error_impl(&dword_24798C000, v47, OS_LOG_TYPE_ERROR, "Invalid dds asset (%@, %@, %@, %@)", buf, 0x2Au);

                          v17 = v91;
LABEL_44:

                        }
                        goto LABEL_40;
                      }
                    }
                    else
                    {

                    }
                  }
                  break;
                }
                SRLogCategoryGeneral();
                v47 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v20, "type");
                  v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  v49 = objc_msgSend(v48, "UTF8String");
                  v50 = objc_msgSend(objc_retainAutorelease(v92), "UTF8String");
                  *(_DWORD *)buf = 136315394;
                  v114 = v49;
                  v115 = 2080;
                  v116 = v50;
                  _os_log_debug_impl(&dword_24798C000, v47, OS_LOG_TYPE_DEBUG, "Not fetching asset with type %s for deliveryType %s", buf, 0x16u);
                  goto LABEL_44;
                }
LABEL_40:

                goto LABEL_41;
              }
LABEL_20:
              v5 = v88 + 1;
            }
            while (v88 + 1 != v87);
            v76 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v103, v121, 16);
            v87 = v76;
          }
          while (v76);
        }

        v2 = v80 + 1;
      }
      while (v80 + 1 != v79);
      v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v122, 16);
    }
    while (v79);
  }

}

void __43__SRDefaultsManager_loadDefaultsForLocale___block_invoke_114(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD block[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        v8 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_loadAssets:deliveryType:shouldUpdate:", v9, v7, 0);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SRDefaultsManager_loadDefaultsForLocale___block_invoke_2_115;
  block[3] = &unk_2519089A0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __43__SRDefaultsManager_loadDefaultsForLocale___block_invoke_2_115(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyObservers");
}

- (void)unloadDefaultsForLocale:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  languageCodeForLocale(v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SRDefaultsManager removeFetchForLanguage:](self, "removeFetchForLanguage:", v7);
  -[SRDefaultsManager defaultsQueue](self, "defaultsQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SRDefaultsManager_unloadDefaultsForLocale___block_invoke;
  block[3] = &unk_2519084A8;
  block[4] = self;
  v9 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __45__SRDefaultsManager_unloadDefaultsForLocale___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unloadAssetsForLocale:", *(_QWORD *)(a1 + 40));
}

- (void)didUpdateAssetsWithType:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SRLogCategoryGeneral();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _os_log_impl(&dword_24798C000, v5, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] did update assets with type %s", buf, 0xCu);
  }

  -[SRDefaultsManager fetchedLocales](self, "fetchedLocales");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[SRDefaultsManager loadDefaultsForLocale:](self, "loadDefaultsForLocale:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
  -[SRDefaultsManager notifyObservers](self, "notifyObservers");

}

- (void)updateParameter:(id)a3 inNamespace:(id)a4 withValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableDictionary *parameters;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  const char *v20;
  SRTrialConfiguration *trialConfig;
  int v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  parameters = self->_parameters;
  if (parameters)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](parameters, "objectForKeyedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = objc_msgSend(v10, "copy");
      -[NSMutableDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, v8);

      if (v15)
      {
        SRLogCategoryGeneral();
        v17 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
LABEL_13:

          goto LABEL_14;
        }
        +[SRParameter typeStringFromParameterType:](SRParameter, "typeStringFromParameterType:", objc_msgSend(v10, "type"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject value](v13, "value");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138413058;
        v23 = v8;
        v24 = 2112;
        v25 = v18;
        v26 = 2112;
        v27 = v9;
        v28 = 2112;
        v29 = v19;
        v20 = "Updating parameter %@ of type %@ in namespace %@ to value %@";
      }
      else
      {
        trialConfig = self->_trialConfig;
        if (trialConfig)
          -[SRTrialConfiguration setParameterName:namespaceId:](trialConfig, "setParameterName:namespaceId:", v8, v9);
        SRLogCategoryGeneral();
        v17 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          goto LABEL_13;
        +[SRParameter typeStringFromParameterType:](SRParameter, "typeStringFromParameterType:", objc_msgSend(v10, "type"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject value](v13, "value");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138413058;
        v23 = v8;
        v24 = 2112;
        v25 = v18;
        v26 = 2112;
        v27 = v19;
        v28 = 2112;
        v29 = v9;
        v20 = "Adding parameter %@ of type %@ and value %@ to namespace %@";
      }
      _os_log_debug_impl(&dword_24798C000, v17, OS_LOG_TYPE_DEBUG, v20, (uint8_t *)&v22, 0x2Au);

      goto LABEL_13;
    }
    SRLogCategoryGeneral();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SRDefaultsManager updateParameter:inNamespace:withValue:].cold.2();
  }
  else
  {
    SRLogCategoryGeneral();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SRDefaultsManager updateParameter:inNamespace:withValue:].cold.1();
  }
LABEL_14:

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BE2B190], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterDelegate:", self);

  v4.receiver = self;
  v4.super_class = (Class)SRDefaultsManager;
  -[SRDefaultsManager dealloc](&v4, sel_dealloc);
}

- (id)assetConfigDump
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[SRDefaultsManager defaultsQueue](self, "defaultsQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__SRDefaultsManager_assetConfigDump__block_invoke;
  v6[3] = &unk_2519088B0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __36__SRDefaultsManager_assetConfigDump__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
  {
    objc_msgSend(v2, "debugDescription");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (id)trialConfigDump
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[SRDefaultsManager defaultsQueue](self, "defaultsQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__SRDefaultsManager_trialConfigDump__block_invoke;
  v6[3] = &unk_2519088B0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __36__SRDefaultsManager_trialConfigDump__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (v2)
  {
    objc_msgSend(v2, "debugDescription");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (id)allLoadedAssets
{
  NSMutableDictionary *assets;
  uint64_t i;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t j;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSMutableDictionary *obj;
  uint64_t v32;
  SRDefaultsManager *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v49 = (id)objc_claimAutoreleasedReturnValue();
  v33 = self;
  assets = self->_assets;
  if (assets)
  {
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    obj = assets;
    v34 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    if (v34)
    {
      v32 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v63 != v32)
            objc_enumerationMutation(obj);
          v5 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](v33->_assets, "objectForKeyedSubscript:", v5);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v5;
          objc_msgSend(v49, "setObject:forKeyedSubscript:", v7, v5);

          if (v6)
          {
            v35 = v6;
            v36 = i;
            v60 = 0u;
            v61 = 0u;
            v58 = 0u;
            v59 = 0u;
            v8 = v6;
            v39 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
            if (v39)
            {
              v37 = v8;
              v38 = *(_QWORD *)v59;
              do
              {
                for (j = 0; j != v39; ++j)
                {
                  if (*(_QWORD *)v59 != v38)
                    objc_enumerationMutation(v8);
                  v10 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * j);
                  objc_msgSend(v8, "objectForKeyedSubscript:", v10);
                  v11 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
                  v12 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "objectForKeyedSubscript:", v48);
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  v47 = v10;
                  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v10);

                  if (v11)
                  {
                    v40 = v11;
                    v41 = j;
                    v56 = 0u;
                    v57 = 0u;
                    v54 = 0u;
                    v55 = 0u;
                    v44 = v11;
                    v43 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
                    if (v43)
                    {
                      v42 = *(_QWORD *)v55;
                      do
                      {
                        v14 = 0;
                        do
                        {
                          if (*(_QWORD *)v55 != v42)
                            objc_enumerationMutation(v44);
                          v45 = v14;
                          v15 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v14);
                          objc_msgSend(v44, "objectForKeyedSubscript:", v15);
                          v16 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
                          v17 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v49, "objectForKeyedSubscript:", v48);
                          v18 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v18, "objectForKeyedSubscript:", v47);
                          v19 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, v15);

                          objc_msgSend(v16, "contentNames");
                          v20 = (void *)objc_claimAutoreleasedReturnValue();
                          v50 = 0u;
                          v51 = 0u;
                          v52 = 0u;
                          v53 = 0u;
                          v46 = v20;
                          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
                          if (v21)
                          {
                            v22 = v21;
                            v23 = *(_QWORD *)v51;
                            do
                            {
                              for (k = 0; k != v22; ++k)
                              {
                                if (*(_QWORD *)v51 != v23)
                                  objc_enumerationMutation(v46);
                                v25 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * k);
                                objc_msgSend(v16, "pathWithName:", v25);
                                v26 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v49, "objectForKeyedSubscript:", v48);
                                v27 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v27, "objectForKeyedSubscript:", v47);
                                v28 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v28, "objectForKeyedSubscript:", v15);
                                v29 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v29, "setObject:forKeyedSubscript:", v26, v25);

                              }
                              v22 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
                            }
                            while (v22);
                          }

                          v14 = v45 + 1;
                        }
                        while (v45 + 1 != v43);
                        v43 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
                      }
                      while (v43);
                    }

                    v8 = v37;
                    v11 = v40;
                    j = v41;
                  }

                }
                v39 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
              }
              while (v39);
            }

            v6 = v35;
            i = v36;
          }

        }
        v34 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
      }
      while (v34);
    }

  }
  return v49;
}

- (NSBundle)customBundle
{
  return self->_customBundle;
}

- (void)setForceLoad:(BOOL)a3
{
  self->_forceLoad = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegatesQueue, 0);
  objc_storeStrong((id *)&self->_defaultsQueue, 0);
  objc_storeStrong((id *)&self->_ddsQueue, 0);
  objc_storeStrong((id *)&self->_customBundle, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_fetchedLocales, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_trialConfig, 0);
  objc_storeStrong((id *)&self->_assetConfig, 0);
}

void __51__SRDefaultsManager_loadDefaultsFromDefaultAssets___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_24798C000, a2, OS_LOG_TYPE_ERROR, "Failed to load defaults at %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)loadFactorsAtPath:namespaceId:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_24798C000, v0, OS_LOG_TYPE_DEBUG, "Loading factors from path %@ for namespace %@", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)updateParameter:inNamespace:withValue:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_24798C000, v0, v1, "Failed to update parameter %@ for namespace %@ as defaults manager does not have a parameters map");
  OUTLINED_FUNCTION_1();
}

- (void)updateParameter:inNamespace:withValue:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_24798C000, v0, v1, "Failed to update parameter %@ as namespace %@ was not found");
  OUTLINED_FUNCTION_1();
}

@end
