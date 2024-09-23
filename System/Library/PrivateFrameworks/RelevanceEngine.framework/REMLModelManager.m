@implementation REMLModelManager

- (id)_orderedModelFeatures
{
  return self->_orderedFeatures;
}

- (id)_createOrderFeatureListFromModelFileURL:(id)a3 mlFeatures:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t (**v35)(_QWORD, _QWORD);
  uint64_t v36;
  __CFString *v37;
  __CFString *v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  NSObject *v47;
  void *v48;
  NSObject *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  id obj;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[4];
  id v65;
  _QWORD block[5];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t v76[128];
  uint8_t buf[4];
  void *v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v73 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        objc_msgSend(v13, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
    }
    while (v10);
  }

  v15 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("features.dat"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "path");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "fileExistsAtPath:", v19);

  v57 = v15;
  if (v20)
  {
    v71 = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfURL:encoding:error:", v17, 4, &v71);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v71;
    v23 = v22;
    if (v21)
    {
      v52 = v22;
      v53 = v17;
      v54 = v8;
      v55 = v5;
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v21;
      objc_msgSend(v21, "componentsSeparatedByCharactersInSet:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v25;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
      if (!v26)
        goto LABEL_34;
      v27 = v26;
      v59 = *(_QWORD *)v68;
      v56 = v16;
      while (1)
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v68 != v59)
            objc_enumerationMutation(obj);
          v29 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v28);
          objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "stringByTrimmingCharactersInSet:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v31, "length"))
          {
            objc_msgSend(v7, "objectForKeyedSubscript:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (v32)
            {
              v33 = v32;
              if (objc_msgSend(v32, "featureType") == 2)
              {
                RELogForDomain(0);
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v78 = v33;
                  _os_log_impl(&dword_2132F7000, v34, OS_LOG_TYPE_DEFAULT, "Skipping loading exisiting feature %@ since it isn't a categorcial feature", buf, 0xCu);
                }

                goto LABEL_31;
              }
            }
            else if (objc_msgSend(v29, "hasPrefix:", CFSTR("<Removed Feature>")))
            {
              +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", v29, 1);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = __71__REMLModelManager__createOrderFeatureListFromModelFileURL_mlFeatures___block_invoke;
              block[3] = &unk_24CF8AAF0;
              block[4] = v29;
              if (_createOrderFeatureListFromModelFileURL_mlFeatures__onceToken != -1)
                dispatch_once(&_createOrderFeatureListFromModelFileURL_mlFeatures__onceToken, block);
              v64[0] = MEMORY[0x24BDAC760];
              v64[1] = 3221225472;
              v64[2] = __71__REMLModelManager__createOrderFeatureListFromModelFileURL_mlFeatures___block_invoke_43;
              v64[3] = &unk_24CF8CA20;
              v65 = v16;
              v35 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x2199B2434](v64);
              v36 = 1;
              v37 = &stru_24CF92178;
              do
              {
                v38 = v37;
                objc_msgSend(CFSTR("<Removed Feature>"), "stringByAppendingString:", v29);
                v37 = (__CFString *)objc_claimAutoreleasedReturnValue();

                if (v36 >= 2)
                {
                  -[__CFString stringByAppendingFormat:](v37, "stringByAppendingFormat:", CFSTR("%d"), v36);
                  v39 = objc_claimAutoreleasedReturnValue();

                  v37 = (__CFString *)v39;
                }
                v36 = (v36 + 1);
              }
              while ((((uint64_t (**)(_QWORD, __CFString *))v35)[2](v35, v37) & 1) != 0);
              +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", v37, 1);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              v16 = v56;
              v15 = v57;
            }
            objc_msgSend(v16, "addObject:", v33);
            objc_msgSend(v15, "removeFeature:", v33);
LABEL_31:

          }
          ++v28;
        }
        while (v28 != v27);
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
        if (!v27)
        {
LABEL_34:
          v40 = v16;

          goto LABEL_36;
        }
      }
    }
    RELogForDomain(4);
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      -[REMLModelManager _createOrderFeatureListFromModelFileURL:mlFeatures:].cold.1();

    v48 = 0;
  }
  else
  {
    v54 = v8;
    v55 = v5;
    v52 = 0;
    v53 = v17;
    v40 = v16;
LABEL_36:
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v41 = v15;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v61;
      do
      {
        for (j = 0; j != v43; ++j)
        {
          if (*(_QWORD *)v61 != v44)
            objc_enumerationMutation(v41);
          v46 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
          if (objc_msgSend(v46, "featureType") == 2)
          {
            RELogForDomain(0);
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v78 = v46;
              _os_log_impl(&dword_2132F7000, v47, OS_LOG_TYPE_DEFAULT, "Skipping creating remaining feature %@ since it isn't a categorcial feature", buf, 0xCu);
            }

          }
          else
          {
            objc_msgSend(v40, "addObject:", v46);
          }
        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
      }
      while (v43);
    }

    v16 = v40;
    v48 = (void *)objc_msgSend(v40, "copy");
    v17 = v53;
    v8 = v54;
    v15 = v57;
    v23 = v52;
    v5 = v55;
  }

  return v48;
}

- (BOOL)_loadModelAtPath:(id)a3 mlFeatures:(id)a4 checkModelVersion:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  BOOL v16;
  BOOL v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  _BOOL4 v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSArray *v30;
  NSArray *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  REMLLinearModel *v35;
  NSArray *orderedFeatures;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  REMLLinearModel *v41;
  REMLLinearModel *model;
  void *v43;
  int v44;
  void *v45;
  id v46;
  void *v47;
  int v48;
  int v49;
  REMLLinearModel *v50;
  BOOL v51;
  id v52;
  NSObject *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  uint64_t v59;
  void *v60;
  void *v61;
  REContentRanker *v62;
  REContentRanker *contentRanker;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  REContentRanker *v70;
  BOOL v71;
  id v72;
  NSObject *v73;
  void *v74;
  void *v75;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  id v84;
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  id v90;
  id v91;
  unsigned __int8 v92;
  _BYTE v93[128];
  uint64_t v94;

  v5 = a5;
  v94 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  if (a3)
  {
    v84 = v8;
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("model"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "fileExistsAtPath:", v12);

    objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("version"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfURL:encoding:error:", v14, 4, &v91);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v91;
    if (v13)
      v16 = v15 == 0;
    else
      v16 = 1;
    v17 = v16 || !v5;
    v80 = v14;
    if (v17)
    {
      if (!v15 && v5)
      {
        objc_msgSend(v14, "absoluteString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = 0;
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "fileExistsAtPath:isDirectory:", v18, &v92);

        v21 = v92;
        v22 = 0;
        v15 = 0;
        if (!v20 || v21)
          goto LABEL_26;
        RELogForDomain(4);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[REMLModelManager _loadModelAtPath:mlFeatures:checkModelVersion:].cold.4();

        v15 = 0;
LABEL_22:
        v22 = 0;
        goto LABEL_26;
      }
    }
    else
    {
      v25 = v10;
      objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsSeparatedByCharactersInSet:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Version: "), &stru_24CF92178);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = objc_msgSend(v15, "longLongValue");
      if (v29 != self->_modelVersionNumber)
      {
        v32 = v29;
        RELogForDomain(4);
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          -[REMLModelManager _loadModelAtPath:mlFeatures:checkModelVersion:].cold.3((uint64_t *)&self->_modelVersionNumber, v32, v33);

        v22 = 0;
        v10 = v25;
LABEL_26:
        v81 = v10;
        objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("model"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = [REMLLinearModel alloc];
        if (self->_orderedFeatures)
          orderedFeatures = self->_orderedFeatures;
        else
          orderedFeatures = (NSArray *)MEMORY[0x24BDBD1A8];
        +[REFeatureSet featureSetWithFeatures:](REFeatureSet, "featureSetWithFeatures:", orderedFeatures);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "configuration");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "interactionDescriptors");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = -[REMLLinearModel initWithFeatureSet:interactionDescriptors:](v35, "initWithFeatureSet:interactionDescriptors:", v37, v40);
        model = self->_model;
        self->_model = v41;

        v79 = v15;
        v83 = v34;
        if (v22)
        {
          objc_msgSend(v34, "path");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = -[REMLLinearModel requiresDirectory](self->_model, "requiresDirectory");
          v92 = 0;
          v45 = (void *)MEMORY[0x24BDD1580];
          v46 = v43;
          objc_msgSend(v45, "defaultManager");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "fileExistsAtPath:isDirectory:", v46, &v92);

          v49 = v92;
          v24 = 1;
          if (v48 && v49 == v44)
          {
            v50 = self->_model;
            v90 = v82;
            v51 = -[REMLModel loadModelFromURL:error:](v50, "loadModelFromURL:error:", v34, &v90);
            v52 = v90;

            v77 = v52;
            if (!v51)
            {
              RELogForDomain(4);
              v53 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                -[REMLModelManager _loadModelAtPath:mlFeatures:checkModelVersion:].cold.2();

              v24 = 0;
            }
LABEL_38:
            self->_supportsContentRanking = 0;
            v86 = 0u;
            v87 = 0u;
            v88 = 0u;
            v89 = 0u;
            +[REContentRelevanceProviderManager _features](REContentRelevanceProviderManager, "_features", v77);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v86, v93, 16);
            if (v55)
            {
              v56 = v55;
              v57 = *(_QWORD *)v87;
              while (2)
              {
                for (i = 0; i != v56; ++i)
                {
                  if (*(_QWORD *)v87 != v57)
                    objc_enumerationMutation(v54);
                  v59 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * i);
                  -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v60, "rootFeatures");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(v59) = objc_msgSend(v61, "containsFeature:", v59);

                  if ((_DWORD)v59)
                  {
                    self->_supportsContentRanking = 1;
                    goto LABEL_48;
                  }
                }
                v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v86, v93, 16);
                if (v56)
                  continue;
                break;
              }
            }
LABEL_48:

            if (self->_supportsContentRanking)
            {
              v62 = objc_alloc_init(REContentRanker);
              contentRanker = self->_contentRanker;
              self->_contentRanker = v62;

              v64 = v81;
              v65 = v78;
              if (v24)
              {
                objc_msgSend(v81, "path");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "stringByAppendingPathComponent:", CFSTR("content.ctx"));
                v67 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                v69 = objc_msgSend(v68, "fileExistsAtPath:", v67);

                if (v69)
                {
                  v70 = self->_contentRanker;
                  v85 = v78;
                  v71 = -[REContentRanker load:error:](v70, "load:error:", v67, &v85);
                  v72 = v85;

                  if (!v71)
                  {
                    RELogForDomain(4);
                    v73 = objc_claimAutoreleasedReturnValue();
                    v74 = v80;
                    v75 = v83;
                    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
                      -[REMLModelManager _loadModelAtPath:mlFeatures:checkModelVersion:].cold.1();

                    goto LABEL_59;
                  }
                }
                else
                {
                  v72 = v78;
                }
                v74 = v80;
                v75 = v83;
LABEL_59:

                v65 = v72;
                goto LABEL_60;
              }
              v74 = v80;
              v75 = v83;
            }
            else
            {
              v74 = v80;
              v64 = v81;
              v75 = v83;
              v65 = v78;
            }
LABEL_60:

            v8 = v84;
            goto LABEL_61;
          }
        }
        else
        {
          v24 = 0;
        }
        v77 = v82;
        goto LABEL_38;
      }
      v10 = v25;
    }
    if (v13)
    {
      -[REMLModelManager _createOrderFeatureListFromModelFileURL:mlFeatures:](self, "_createOrderFeatureListFromModelFileURL:mlFeatures:", v10, v84);
      v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v31 = self->_orderedFeatures;
      self->_orderedFeatures = v30;

      v22 = self->_orderedFeatures != 0;
      goto LABEL_26;
    }
    goto LABEL_22;
  }
  LOBYTE(v24) = 0;
LABEL_61:

  return v24;
}

- (id)comparatorWithRules:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  REExtractRules(v5, v6, v7);

  +[REMLElementComparator comparatorWithFilteringRules:rankingRules:model:](REMLElementComparator, "comparatorWithFilteringRules:rankingRules:model:", v6, v7, self->_model);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (REMLModelManager)initWithRelevanceEngine:(id)a3
{
  id v4;
  REMLModelManager *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *modelFileLocation;
  void *v10;
  void *v11;
  uint64_t v12;
  RERelevanceEngineMetricsRecorder *metricsRecoder;
  REObserverStore *v14;
  REObserverStore *observers;
  void *v16;
  REObserverStore *v17;
  REObserverStore *dataStores;
  uint64_t v19;
  NSDate *lastCacheResetDate;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  float v26;
  uint64_t i;
  float v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  BOOL v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  NSArray *orderedFeatures;
  REMLLinearModel *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  REMLLinearModel *model;
  REMLMetricsSet *v60;
  REMLMetricsSet *metrics;
  REMLMetricsSet *v62;
  REMLEntropyMetric *v63;
  uint64_t v64;
  NSObject *v65;
  NSObject *v66;
  dispatch_queue_t v67;
  OS_dispatch_queue *trainingQueue;
  void *v69;
  void *v70;
  uint64_t v72;
  id v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  objc_super v83;
  uint8_t buf[4];
  void *v85;
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v83.receiver = self;
  v83.super_class = (Class)REMLModelManager;
  v5 = -[RERelevanceEngineSubsystem initWithRelevanceEngine:](&v83, sel_initWithRelevanceEngine_, v4);
  if (v5)
  {
    objc_msgSend(v4, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "modelFileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = objc_claimAutoreleasedReturnValue();
    modelFileLocation = v5->_modelFileLocation;
    v5->_modelFileLocation = (NSString *)v8;

    objc_msgSend(v4, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_modelStorageBehavior = objc_msgSend(v10, "modelStorageBehavior");

    objc_msgSend(v4, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "metricsRecorder");
    v12 = objc_claimAutoreleasedReturnValue();
    metricsRecoder = v5->_metricsRecoder;
    v5->_metricsRecoder = (RERelevanceEngineMetricsRecorder *)v12;

    v14 = objc_alloc_init(REObserverStore);
    observers = v5->_observers;
    v5->_observers = v14;

    objc_msgSend(v4, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_modelVersionNumber = (objc_msgSend(v16, "modelVersion") << 8) + 195936478;

    v17 = objc_alloc_init(REObserverStore);
    dataStores = v5->_dataStores;
    v5->_dataStores = v17;

    objc_msgSend(v4, "mlFeatures");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v19 = objc_claimAutoreleasedReturnValue();
    lastCacheResetDate = v5->_lastCacheResetDate;
    v5->_lastCacheResetDate = (NSDate *)v19;

    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    objc_msgSend(v4, "configuration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "interactionDescriptors");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v79, v87, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v80;
      v26 = 0.0;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v80 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * i), "weight");
          v26 = v26 + v28;
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v79, v87, 16);
      }
      while (v24);
    }
    else
    {
      v26 = 0.0;
    }

    if (fabsf(v26) < 0.00000011921)
      RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Interaction descriptors must have weights which sum to a non-zero value or you're going to have a bad time."), v29, v30, v31, v32, v33, v34, v72);
    v35 = v74;
    v36 = 0x254B93000;
    v37 = 0x254B93000;
    if (-[REMLModelManager _loadModelAtPath:mlFeatures:checkModelVersion:](v5, "_loadModelAtPath:mlFeatures:checkModelVersion:", v5->_modelFileLocation, v74, 1))
    {
      v5->_validModel = 1;
    }
    else
    {
      RELogForDomain(4);
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2132F7000, v38, OS_LOG_TYPE_DEFAULT, "Falling back to base model", buf, 2u);
      }

      objc_msgSend(v4, "configuration");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "baseModelFileURL");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "path");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = -[REMLModelManager _loadModelAtPath:mlFeatures:checkModelVersion:](v5, "_loadModelAtPath:mlFeatures:checkModelVersion:", v41, v74, 0);

      v37 = 0x254B93000;
      v36 = 0x254B93000;
      if (!v42)
      {
        v73 = v4;
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v74, "count"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = 0u;
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v44 = v74;
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
        if (v45)
        {
          v46 = v45;
          v47 = *(_QWORD *)v76;
          do
          {
            for (j = 0; j != v46; ++j)
            {
              if (*(_QWORD *)v76 != v47)
                objc_enumerationMutation(v44);
              v49 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * j);
              if (objc_msgSend(v49, "featureType") == 2)
              {
                RELogForDomain(0);
                v50 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v85 = v49;
                  _os_log_impl(&dword_2132F7000, v50, OS_LOG_TYPE_DEFAULT, "Skipping loading ml feature %@ from provided configuration since it isn't a categorcial feature", buf, 0xCu);
                }

              }
              else
              {
                objc_msgSend(v43, "addObject:", v49);
              }
            }
            v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
          }
          while (v46);
        }

        v51 = objc_msgSend(v43, "copy");
        orderedFeatures = v5->_orderedFeatures;
        v5->_orderedFeatures = (NSArray *)v51;

        v53 = [REMLLinearModel alloc];
        +[REFeatureSet featureSetWithFeatures:](REFeatureSet, "featureSetWithFeatures:", v5->_orderedFeatures);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[RERelevanceEngineSubsystem relevanceEngine](v5, "relevanceEngine");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "configuration");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "interactionDescriptors");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = -[REMLLinearModel initWithFeatureSet:interactionDescriptors:](v53, "initWithFeatureSet:interactionDescriptors:", v54, v57);
        v36 = 0x254B93000uLL;
        model = v5->_model;
        v5->_model = (REMLLinearModel *)v58;

        v37 = 0x254B93000uLL;
        v4 = v73;
        v35 = v74;
      }
    }
    objc_msgSend(*(id *)((char *)&v5->super.super.isa + *(int *)(v36 + 3112)), "setMetricsRecorder:", v5->_metricsRecoder);
    v60 = objc_alloc_init(REMLMetricsSet);
    metrics = v5->_metrics;
    v5->_metrics = v60;

    v62 = v5->_metrics;
    v63 = -[REMLEntropyMetric initWithName:featureName:]([REMLEntropyMetric alloc], "initWithName:featureName:", CFSTR("entropy"), CFSTR("ModelPrediction"));
    -[REMLMetricsSet addMetrics:](v62, "addMetrics:", v63);

    v64 = *(int *)(v37 + 3108);
    if (!*(Class *)((char *)&v5->super.super.isa + v64))
    {
      *(Class *)((char *)&v5->super.super.isa + v64) = (Class)MEMORY[0x24BDBD1A8];

    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v65 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v65, QOS_CLASS_UTILITY, 0);
    v66 = objc_claimAutoreleasedReturnValue();

    v67 = dispatch_queue_create("com.apple.RelevanceEngine.REMLModelManager", v66);
    trainingQueue = v5->_trainingQueue;
    v5->_trainingQueue = (OS_dispatch_queue *)v67;

    objc_msgSend(v4, "logger");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "addLoggable:", v5);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "addObserver:selector:name:object:", v5, sel__logMetrics, CFSTR("REDidCollectMetrics"), 0);

  }
  return v5;
}

- (void)addObserver:(id)a3
{
  -[REObserverStore addObserver:](self->_observers, "addObserver:", a3);
}

- (void)addDataStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  -[REObserverStore addObserver:](self->_dataStores, "addObserver:", v4);
  if (self->_validModel)
  {
    objc_msgSend(v4, "dataStoreKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingPathComponent:](self->_modelFileLocation, "stringByAppendingPathComponent:", CFSTR("DataStores"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "fileExistsAtPath:", v7);

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      objc_msgSend(v4, "modelManager:loadDataStoreFromURL:error:", self, v10, &v11);

    }
  }

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeLoggable:", self);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)REMLModelManager;
  -[RERelevanceEngineSubsystem dealloc](&v6, sel_dealloc);
}

- (void)_logMetrics
{
  NSObject *trainingQueue;
  _QWORD block[5];

  trainingQueue = self->_trainingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__REMLModelManager__logMetrics__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(trainingQueue, block);
}

uint64_t __31__REMLModelManager__logMetrics__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "logCoreAnalyticsMetrics");
}

- (void)removeDataStore:(id)a3
{
  -[REObserverStore removeObserver:](self->_dataStores, "removeObserver:", a3);
}

- (void)_saveDataStoresToURL:(id)a3
{
  void *v4;
  void *v5;
  REObserverStore *dataStores;
  id v7;
  _QWORD v8[4];
  id v9;
  REMLModelManager *v10;

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", self->_modelFileLocation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("DataStores"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  dataStores = self->_dataStores;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__REMLModelManager__saveDataStoresToURL___block_invoke;
  v8[3] = &unk_24CF8C9F8;
  v9 = v5;
  v10 = self;
  v7 = v5;
  -[REObserverStore enumerateObserversWithBlock:](dataStores, "enumerateObserversWithBlock:", v8);

}

void __41__REMLModelManager__saveDataStoresToURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(v3, "dataStoreKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, 0);

  v8 = *(_QWORD *)(a1 + 40);
  v9 = 0;
  objc_msgSend(v3, "modelManager:saveDataStoreToURL:error:", v8, v5, &v9);

}

void __71__REMLModelManager__createOrderFeatureListFromModelFileURL_mlFeatures___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  RELogForDomain(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __71__REMLModelManager__createOrderFeatureListFromModelFileURL_mlFeatures___block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

}

uint64_t __71__REMLModelManager__createOrderFeatureListFromModelFileURL_mlFeatures___block_invoke_43(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "name", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", v3);

        if ((v9 & 1) != 0)
        {
          v5 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)removeObserver:(id)a3
{
  -[REObserverStore removeObserver:](self->_observers, "removeObserver:", a3);
}

- (id)createOutputFeatureFromDouble:(double)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = objc_alloc(MEMORY[0x24BDBFF80]);
  v11 = CFSTR("ModelPrediction");
  objc_msgSend(MEMORY[0x24BDBFF98], "featureValueWithDouble:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithDictionary:error:", v8, a4);

  return v9;
}

- (BOOL)_saveModelToDisk:(id *)a3
{
  NSString *modelFileLocation;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSString *v13;
  void *v14;
  NSString *v15;
  void *v16;
  int v17;
  BOOL v18;
  void *v19;
  BOOL v20;
  void *v21;
  NSString *v22;
  char v23;
  id v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id *v30;
  void *v31;
  char v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  unint64_t modelVersionNumber;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  NSArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  void *v49;
  char v50;
  id v51;
  REMLLinearModel *model;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  id v60;
  REContentRanker *contentRanker;
  BOOL v62;
  NSObject *v63;
  NSObject *v64;
  void *v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  char v73;
  void *v74;
  void *v75;
  void *v76;
  char v77;
  id v78;
  id *v79;
  NSObject *v80;
  id *v81;
  void *v82;
  NSObject *v83;
  NSObject *v85;
  id *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  id v102;
  id v103;
  id v104;
  id v105;
  char v106;
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  modelFileLocation = self->_modelFileLocation;
  if (modelFileLocation)
  {
    -[NSString stringByAppendingPathComponent:](modelFileLocation, "stringByAppendingPathComponent:", CFSTR("model"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("."), "stringByAppendingString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v6;
    objc_msgSend(v6, "stringByDeletingLastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathComponent:", v8);
    v11 = objc_claimAutoreleasedReturnValue();

    v91 = (void *)v11;
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->_modelFileLocation;
    v106 = 0;
    v14 = (void *)MEMORY[0x24BDD1580];
    v15 = v13;
    objc_msgSend(v14, "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "fileExistsAtPath:isDirectory:", v15, &v106);

    if (v17)
      v18 = v106 == 0;
    else
      v18 = 0;
    if (v18)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = self->_modelFileLocation;
      v105 = 0;
      v23 = objc_msgSend(v21, "removeItemAtPath:error:", v22, &v105);
      v24 = v105;

      if ((v23 & 1) == 0)
      {
        RELogForDomain(4);
        v64 = objc_claimAutoreleasedReturnValue();
        v25 = v12;
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          -[REMLModelManager _saveModelToDisk:].cold.9();

        v29 = v9;
        goto LABEL_35;
      }
      v19 = v24;
    }
    else
    {
      v19 = 0;
    }
    v25 = v12;
    v26 = 0x24BDD1000uLL;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "path");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v9;
    if ((objc_msgSend(v27, "fileExistsAtPath:", v28) & 1) != 0)
    {
      v89 = v8;
      v30 = a3;
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = v19;
      v32 = objc_msgSend(v31, "removeItemAtURL:error:", v25, &v104);
      v24 = v104;

      if ((v32 & 1) == 0)
      {
        RELogForDomain(4);
        v66 = objc_claimAutoreleasedReturnValue();
        v65 = v91;
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          -[REMLModelManager _saveModelToDisk:].cold.8();

        v8 = v89;
        if (v30)
        {
          v24 = objc_retainAutorelease(v24);
          v20 = 0;
          *v30 = v24;
        }
        else
        {
          v20 = 0;
        }
        v29 = v9;
        goto LABEL_80;
      }
      v19 = v24;
      a3 = v30;
      v29 = v9;
      v8 = v89;
      v26 = 0x24BDD1000;
    }
    else
    {

    }
    objc_msgSend(*(id *)(v26 + 1408), "defaultManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v19;
    v34 = objc_msgSend(v33, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v25, 1, 0, &v103);
    v24 = v103;

    if ((v34 & 1) != 0)
    {
      v35 = v29;
      v90 = v8;
      v36 = (void *)MEMORY[0x24BDD17C8];
      modelVersionNumber = self->_modelVersionNumber;
      REBuildVersion();
      v38 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stringWithFormat:", CFSTR("Version: %llu\nSystem: %@\n"), modelVersionNumber, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "URLByAppendingPathComponent:", CFSTR("version"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = v24;
      v87 = v39;
      LOBYTE(v38) = objc_msgSend(v39, "writeToURL:atomically:encoding:error:", v40, 1, 4, &v102);
      v41 = v102;

      if ((v38 & 1) == 0)
      {
        RELogForDomain(4);
        v67 = objc_claimAutoreleasedReturnValue();
        v55 = v90;
        v29 = v35;
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
          -[REMLModelManager _saveModelToDisk:].cold.6();

        v65 = v91;
        if (a3)
        {
          v41 = objc_retainAutorelease(v41);
          v20 = 0;
          *a3 = v41;
        }
        else
        {
          v20 = 0;
        }
        goto LABEL_79;
      }
      v86 = a3;
      v88 = v35;
      objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 15 * -[NSArray count](self->_orderedFeatures, "count"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = 0u;
      v99 = 0u;
      v100 = 0u;
      v101 = 0u;
      v43 = self->_orderedFeatures;
      v44 = -[NSArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v98, v107, 16);
      if (v44)
      {
        v45 = v44;
        v46 = *(_QWORD *)v99;
        do
        {
          for (i = 0; i != v45; ++i)
          {
            if (*(_QWORD *)v99 != v46)
              objc_enumerationMutation(v43);
            objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * i), "name");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "appendString:", v48);

            objc_msgSend(v42, "appendString:", CFSTR("\n"));
          }
          v45 = -[NSArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v98, v107, 16);
        }
        while (v45);
      }

      objc_msgSend(v25, "URLByAppendingPathComponent:", CFSTR("features.dat"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = v41;
      v50 = objc_msgSend(v42, "writeToURL:atomically:encoding:error:", v49, 1, 4, &v97);
      v51 = v97;

      if ((v50 & 1) == 0)
      {
        RELogForDomain(4);
        v68 = objc_claimAutoreleasedReturnValue();
        v55 = v90;
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          -[REMLModelManager _saveModelToDisk:].cold.5();

        if (v86)
        {
          v51 = objc_retainAutorelease(v51);
          v20 = 0;
          *v86 = v51;
        }
        else
        {
          v20 = 0;
        }
        v29 = v88;
        goto LABEL_78;
      }
      model = self->_model;
      objc_msgSend(v25, "URLByAppendingPathComponent:", CFSTR("model"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = v51;
      LOBYTE(model) = -[REMLModel saveModelToURL:error:](model, "saveModelToURL:error:", v53, &v96);
      v54 = v96;

      v29 = v88;
      v55 = v90;
      if ((model & 1) == 0)
      {
        RELogForDomain(4);
        v69 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
          -[REMLModelManager _saveModelToDisk:].cold.4();

        if (v86)
        {
          v51 = objc_retainAutorelease(v54);
          v20 = 0;
          *v86 = v51;
        }
        else
        {
          v20 = 0;
          v51 = v54;
        }
        goto LABEL_78;
      }
      -[REMLModelManager _saveDataStoresToURL:](self, "_saveDataStoresToURL:", v25);
      if (self->_supportsContentRanking)
      {
        objc_msgSend(v25, "path");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "stringByAppendingPathComponent:", CFSTR("content.ctx"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = v54;
        v59 = objc_msgSend(v58, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v57, 1, 0, &v95);
        v60 = v95;

        if (v59)
        {
          contentRanker = self->_contentRanker;
          v94 = v60;
          v62 = -[REContentRanker save:error:](contentRanker, "save:error:", v57, &v94);
          v51 = v94;

          if (v62)
          {

LABEL_60:
            v70 = v51;
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v88);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v93 = v51;
            v73 = objc_msgSend(v71, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v72, v25, 0, 0, 0, &v93);
            v51 = v93;

            if ((v73 & 1) != 0)
            {
              objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "path");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = v90;
              if ((objc_msgSend(v74, "fileExistsAtPath:", v75) & 1) == 0)
              {

                v20 = 1;
                v29 = v88;
                goto LABEL_78;
              }
              objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              v92 = v51;
              v77 = objc_msgSend(v76, "removeItemAtURL:error:", v25, &v92);
              v78 = v92;

              v29 = v88;
              if ((v77 & 1) != 0)
              {
                v20 = 1;
LABEL_88:
                v51 = v78;
                goto LABEL_78;
              }
              RELogForDomain(4);
              v85 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
                -[REMLModelManager _saveModelToDisk:].cold.1();

              v81 = v86;
              if (!v86)
              {
                v20 = 0;
                goto LABEL_88;
              }
              v82 = v78;
              goto LABEL_70;
            }
            RELogForDomain(4);
            v80 = objc_claimAutoreleasedReturnValue();
            v55 = v90;
            if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
              -[REMLModelManager _saveModelToDisk:].cold.2();

            v29 = v88;
            v81 = v86;
            if (v86)
            {
              v82 = v51;
LABEL_70:
              v51 = objc_retainAutorelease(v82);
              v20 = 0;
              *v81 = v51;
LABEL_78:

              v41 = v51;
              v65 = v91;
LABEL_79:

              v24 = v41;
              v8 = v55;
LABEL_80:

              return v20;
            }
LABEL_77:
            v20 = 0;
            goto LABEL_78;
          }
          RELogForDomain(4);
          v83 = objc_claimAutoreleasedReturnValue();
          v79 = v86;
          if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
            -[REMLModelManager _saveModelToDisk:].cold.3();

        }
        else
        {
          v51 = v60;
          v79 = v86;
        }
        if (v79)
          *v79 = objc_retainAutorelease(v51);

        goto LABEL_77;
      }
      v51 = v54;
      goto LABEL_60;
    }
    RELogForDomain(4);
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      -[REMLModelManager _saveModelToDisk:].cold.7();

LABEL_35:
    v65 = v91;
    if (a3)
    {
      v24 = objc_retainAutorelease(v24);
      v20 = 0;
      *a3 = v24;
    }
    else
    {
      v20 = 0;
    }
    goto LABEL_80;
  }
  return 1;
}

- (void)flushTraining
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_trainingQueue);
  dispatch_sync((dispatch_queue_t)self->_trainingQueue, &__block_literal_global_58);
}

- (void)performTrainingWithFeatureMaps:(id)a3 content:(id)a4 events:(id)a5 interactions:(id)a6 purgeCaches:(BOOL)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *trainingQueue;
  _QWORD block[4];
  id v21;
  id v22;
  REMLModelManager *v23;
  id v24;
  id v25;
  id v26;
  BOOL v27;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  if (objc_msgSend(v14, "count"))
  {
    trainingQueue = self->_trainingQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __102__REMLModelManager_performTrainingWithFeatureMaps_content_events_interactions_purgeCaches_completion___block_invoke;
    block[3] = &unk_24CF8CA68;
    v27 = a7;
    v21 = v14;
    v22 = v16;
    v23 = self;
    v24 = v17;
    v25 = v15;
    v26 = v18;
    dispatch_async(trainingQueue, block);

  }
}

void __102__REMLModelManager_performTrainingWithFeatureMaps_content_events_interactions_purgeCaches_completion___block_invoke(uint64_t a1)
{
  id v2;
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  double v19;
  _BOOL4 v20;
  _QWORD *v21;
  id v22;
  int v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  uint8_t v41[4];
  _DWORD v42[7];

  *(_QWORD *)&v42[5] = *MEMORY[0x24BDAC8D0];
  v35 = *(unsigned __int8 *)(a1 + 80);
  v2 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v3 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "predictWithFeatures:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "probability");
      v8 = v7;

      v9 = *(void **)(a1 + 48);
      v38 = v2;
      objc_msgSend(v9, "createOutputFeatureFromDouble:error:", &v38, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v38;

      v12 = *(void **)(a1 + 48);
      objc_msgSend(v5, "doubleValue");
      v37 = v11;
      objc_msgSend(v12, "createOutputFeatureFromDouble:error:", &v37);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v37;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "updateMetricsFromFeatures:prediction:truth:", v4, v10, v13);
      objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", v3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "trainWithFeatures:positiveEvent:interaction:", v4, v5, v14);
      objc_msgSend(*(id *)(a1 + 64), "objectAtIndexedSubscript:", v3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (*(_BYTE *)(*(_QWORD *)(a1 + 48) + 88) && objc_msgSend(v15, "count"))
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "train:isPositive:", v16, objc_msgSend(v5, "BOOLValue"));
      RELogForDomain(4);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        __102__REMLModelManager_performTrainingWithFeatureMaps_content_events_interactions_purgeCaches_completion___block_invoke_cold_2(v41, v5, (const __CFString **)v42, v17);

      ++v3;
    }
    while (v3 < objc_msgSend(*(id *)(a1 + 32), "count"));
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 128));
  if (v19 > 1200.0 || (v20 = v35 != 0, v35))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "_clearCache");
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 128), v18);
    v20 = 1;
  }
  v21 = *(_QWORD **)(a1 + 48);
  if (v21[13])
  {
    v22 = v2;
  }
  else
  {
    v36 = v2;
    v23 = objc_msgSend(v21, "_saveModelToDisk:", &v36);
    v22 = v36;

    if (v23)
    {
      RELogForDomain(4);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        __102__REMLModelManager_performTrainingWithFeatureMaps_content_events_interactions_purgeCaches_completion___block_invoke_cold_1(v24, v25, v26, v27, v28, v29, v30, v31);

    }
  }
  RELogForDomain(4);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134217984;
    v40 = v33;
    _os_log_impl(&dword_2132F7000, v32, OS_LOG_TYPE_DEFAULT, "Finished training model with events count %lu", buf, 0xCu);
  }

  if (v20)
    objc_msgSend(*(id *)(a1 + 48), "_notifyObserversThatModelUpdated");
  v34 = *(_QWORD *)(a1 + 72);
  if (v34)
    (*(void (**)(void))(v34 + 16))();

}

- (void)_notifyObserversThatModelUpdated
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__REMLModelManager__notifyObserversThatModelUpdated__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __52__REMLModelManager__notifyObserversThatModelUpdated__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 72);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__REMLModelManager__notifyObserversThatModelUpdated__block_invoke_2;
  v4[3] = &unk_24CF8CA90;
  v4[4] = v1;
  return objc_msgSend(v2, "enumerateObserversWithBlock:", v4);
}

uint64_t __52__REMLModelManager__notifyObserversThatModelUpdated__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "modelManagerDidUpdateModel:", *(_QWORD *)(a1 + 32));
}

- (void)manuallySaveModel
{
  NSObject *trainingQueue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_trainingQueue);
  trainingQueue = self->_trainingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__REMLModelManager_manuallySaveModel__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_sync(trainingQueue, block);
}

void __37__REMLModelManager_manuallySaveModel__block_invoke(uint64_t a1)
{
  void *v1;
  int v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v1 = *(void **)(a1 + 32);
  v13 = 0;
  v2 = objc_msgSend(v1, "_saveModelToDisk:", &v13);
  v3 = v13;
  RELogForDomain(4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __102__REMLModelManager_performTrainingWithFeatureMaps_content_events_interactions_purgeCaches_completion___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    -[REMLModelManager _saveModelToDisk:].cold.4();
  }

}

- (void)performModelClearWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RERelevanceEngineSubsystem queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__REMLModelManager_performModelClearWithCompletion___block_invoke;
  v7[3] = &unk_24CF8AA78;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __52__REMLModelManager_performModelClearWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 64);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__REMLModelManager_performModelClearWithCompletion___block_invoke_2;
  v4[3] = &unk_24CF8AA78;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

void __52__REMLModelManager_performModelClearWithCompletion___block_invoke_2(uint64_t a1)
{
  REContentRanker *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "clearModel");
  v2 = objc_alloc_init(REContentRanker);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

  v5 = *(void **)(a1 + 32);
  v8 = 0;
  objc_msgSend(v5, "_saveModelToDisk:", &v8);
  v6 = v8;
  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversThatModelUpdated");
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(void))(v7 + 16))();

}

- (id)sentimentAnalyzer
{
  REMLSentimentAnalyzer *v2;

  if (self->_supportsContentRanking)
    v2 = -[REMLSentimentAnalyzer initWithContentRanker:]([REMLSentimentAnalyzer alloc], "initWithContentRanker:", self->_contentRanker);
  else
    v2 = 0;
  return v2;
}

- (id)predicitionForLogicalElement:(id)a3
{
  REMLLinearModel *model;
  void *v4;
  void *v5;

  model = self->_model;
  objc_msgSend(a3, "featureMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMLModel predictWithFeatures:](model, "predictWithFeatures:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)modelVersionNumber
{
  return self->_modelVersionNumber;
}

- (REMLModel)model
{
  return (REMLModel *)self->_model;
}

- (REContentRanker)contentRanker
{
  return self->_contentRanker;
}

- (BOOL)supportsContentRanking
{
  return self->_supportsContentRanking;
}

- (NSArray)orderedFeatures
{
  return self->_orderedFeatures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCacheResetDate, 0);
  objc_storeStrong((id *)&self->_metricsRecoder, 0);
  objc_storeStrong((id *)&self->_dataStores, 0);
  objc_storeStrong((id *)&self->_orderedFeatures, 0);
  objc_storeStrong((id *)&self->_modelFileLocation, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_trainingQueue, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_contentRanker, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (void)_loadModelAtPath:mlFeatures:checkModelVersion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, v0, v1, "Unable to read content model: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_loadModelAtPath:mlFeatures:checkModelVersion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, v0, v1, "Unable to read model: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_loadModelAtPath:(uint64_t *)a1 mlFeatures:(uint64_t)a2 checkModelVersion:(os_log_t)log .cold.3(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 134218240;
  v5 = a2;
  v6 = 2048;
  v7 = v3;
  _os_log_error_impl(&dword_2132F7000, log, OS_LOG_TYPE_ERROR, "Incompatible model version: %llu. Expecting %llu", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)_loadModelAtPath:mlFeatures:checkModelVersion:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, v0, v1, "Unable to read version: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_createOrderFeatureListFromModelFileURL:mlFeatures:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, v0, v1, "Unable to read features file: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __71__REMLModelManager__createOrderFeatureListFromModelFileURL_mlFeatures___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, a2, a3, "The previous model contained a reference to feature \"%@\" which is missing from the current definition. Features cannot be removed from the model. A temporary feature will be inserted. Future errors won't be logged", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_saveModelToDisk:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, v0, v1, "Unable to remove temp file after completion: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_saveModelToDisk:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, v0, v1, "Unable to replace file: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_saveModelToDisk:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, v0, v1, "Unable to save content model: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_saveModelToDisk:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, v0, v1, "Unable to save model: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_saveModelToDisk:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, v0, v1, "Unable to save features: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_saveModelToDisk:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, v0, v1, "Unable to store version: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_saveModelToDisk:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, v0, v1, "Unable to create temp directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_saveModelToDisk:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, v0, v1, "Unable to remove temp file: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_saveModelToDisk:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, v0, v1, "Unable to old file model: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __102__REMLModelManager_performTrainingWithFeatureMaps_content_events_interactions_purgeCaches_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_2132F7000, a1, a3, "Finished training model", a5, a6, a7, a8, 0);
}

void __102__REMLModelManager_performTrainingWithFeatureMaps_content_events_interactions_purgeCaches_completion___block_invoke_cold_2(uint8_t *a1, void *a2, const __CFString **a3, NSObject *a4)
{
  int v7;
  const __CFString *v8;

  v7 = objc_msgSend(a2, "BOOLValue");
  v8 = CFSTR("negative");
  if (v7)
    v8 = CFSTR("positive");
  *(_DWORD *)a1 = 138412290;
  *a3 = v8;
  _os_log_debug_impl(&dword_2132F7000, a4, OS_LOG_TYPE_DEBUG, "Training with event: %@", a1, 0xCu);
}

@end
