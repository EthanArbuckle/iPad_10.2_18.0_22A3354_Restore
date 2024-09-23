@implementation _RERuleMLElementComparator

- (_RERuleMLElementComparator)initWithFilteringRules:(id)a3 rankingRules:(id)a4 model:(id)a5
{
  id v8;
  id v9;
  _RERuleMLElementComparator *v10;
  uint64_t v11;
  NSArray *filteringRules;
  uint64_t v13;
  NSArray *rankingRules;
  void *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  NSArray *filteringEvaluators;
  void *v24;
  void *v25;
  void *v26;
  NSArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSArray *leftRankingEvaluators;
  uint64_t v38;
  NSArray *rightRankingEvaluators;
  uint64_t v40;
  NSArray *comparisonRankingEvaluators;
  _RERuleMLElementComparator *v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  objc_super v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v54.receiver = self;
  v54.super_class = (Class)_RERuleMLElementComparator;
  v10 = -[REMLElementComparator initWithModel:](&v54, sel_initWithModel_, a5);
  if (v10)
  {
    v45 = v8;
    objc_msgSend(v8, "sortedArrayWithOptions:usingComparator:", 16, &__block_literal_global_69);
    v11 = objc_claimAutoreleasedReturnValue();
    filteringRules = v10->_filteringRules;
    v10->_filteringRules = (NSArray *)v11;

    v44 = v9;
    objc_msgSend(v9, "sortedArrayWithOptions:usingComparator:", 16, &__block_literal_global_2);
    v13 = objc_claimAutoreleasedReturnValue();
    rankingRules = v10->_rankingRules;
    v10->_rankingRules = (NSArray *)v13;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](v10->_filteringRules, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v16 = v10->_filteringRules;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v51 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "conditionEvaluator");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
      }
      while (v18);
    }

    v22 = objc_msgSend(v15, "copy");
    filteringEvaluators = v10->_filteringEvaluators;
    v10->_filteringEvaluators = (NSArray *)v22;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](v10->_rankingRules, "count"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](v10->_rankingRules, "count"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](v10->_rankingRules, "count"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v43 = v10;
    v27 = v10->_rankingRules;
    v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v47 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
          objc_msgSend(v32, "leftConditionEvaluator");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v33);

          objc_msgSend(v32, "rightConditionEvaluator");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v34);

          objc_msgSend(v32, "comparisonConditionEvaluator");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v35);

        }
        v29 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
      }
      while (v29);
    }

    v36 = objc_msgSend(v24, "copy");
    v10 = v43;
    leftRankingEvaluators = v43->_leftRankingEvaluators;
    v43->_leftRankingEvaluators = (NSArray *)v36;

    v38 = objc_msgSend(v25, "copy");
    rightRankingEvaluators = v43->_rightRankingEvaluators;
    v43->_rightRankingEvaluators = (NSArray *)v38;

    v40 = objc_msgSend(v26, "copy");
    comparisonRankingEvaluators = v43->_comparisonRankingEvaluators;
    v43->_comparisonRankingEvaluators = (NSArray *)v40;

    v9 = v44;
    v8 = v45;
  }

  return v10;
}

- (unint64_t)comparisonLevels
{
  return 2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  NSArray *filteringRules;
  NSArray *rankingRules;
  void *v7;
  void *v8;

  v4 = (void *)objc_opt_class();
  filteringRules = self->_filteringRules;
  rankingRules = self->_rankingRules;
  -[REMLElementComparator model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "comparatorWithFilteringRules:rankingRules:model:", filteringRules, rankingRules, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)comparatorWithFilteringRules:(id)a3 rankingRules:(id)a4 model:(id)a5
{
  id v7;
  id v8;
  id v9;
  _RERuleMLElementComparator *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[_RERuleMLElementComparator initWithFilteringRules:rankingRules:model:]([_RERuleMLElementComparator alloc], "initWithFilteringRules:rankingRules:model:", v9, v8, v7);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comparisonRankingEvaluators, 0);
  objc_storeStrong((id *)&self->_rightRankingEvaluators, 0);
  objc_storeStrong((id *)&self->_leftRankingEvaluators, 0);
  objc_storeStrong((id *)&self->_filteringEvaluators, 0);
  objc_storeStrong((id *)&self->_rankingRules, 0);
  objc_storeStrong((id *)&self->_filteringRules, 0);
}

- (float)_relevanceForElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  const char *v10;
  double v11;
  NSObject *v12;
  float v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  float v25;
  float v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  float v38;

  v4 = a3;
  objc_msgSend(v4, "featureMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature forcedFeature](REFeature, "forcedFeature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "hasValueForFeature:", v6);

  if (v7)
  {
    +[REFeature forcedFeature](REFeature, "forcedFeature");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v5, "valueForFeature:", v8);
    v11 = REDoubleValueForTaggedPointer(v9, v10);

    RELogForDomain(4);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[_RERuleMLElementComparator _relevanceForElement:].cold.1(v4);

    v13 = v11;
  }
  else
  {
    RELogForDomain(4);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[_RERuleMLElementComparator _relevanceForElement:].cold.7(v14, v15, v16, v17, v18, v19, v20, v21);

    RELogForDomain(4);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[_RERuleMLElementComparator _relevanceForElement:].cold.6(v4);

    -[REMLElementComparator model](self, "model");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "predictWithFeatures:", v5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "probability");
    v26 = v25;
    RELogForDomain(4);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[_RERuleMLElementComparator _relevanceForElement:].cold.5(v27, v28, v29, v30, v31, v32, v33, v34);

    RELogForDomain(4);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      -[_RERuleMLElementComparator _relevanceForElement:].cold.4(v4);

    RELogForDomain(4);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      -[_RERuleMLElementComparator _relevanceForElement:].cold.3(v4, v24);

    RELogForDomain(4);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      -[_RERuleMLElementComparator _relevanceForElement:].cold.2(v24);

    v38 = 1.0;
    if (v26 <= 1.0)
      v38 = v26;
    if (v26 >= 0.0)
      v13 = v38;
    else
      v13 = 0.0;

  }
  return v13;
}

- (BOOL)shouldHideElement:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  char v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  NSObject *v43;
  const __CFString *v44;
  void *v45;
  uint64_t v46;
  __int128 v48;
  const __CFString *v49;
  id v50;
  const __CFString *v51;
  void *v52;
  void *contexta;
  void *context;
  REMLExplanationFormatter *v55;
  NSObject *log;
  char loga;
  REMLExplanationFormatter *v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  char v63;
  _BYTE buf[24];
  void *v65;
  id v66;
  uint8_t v67[16];
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[NSArray count](self->_filteringRules, "count"))
  {
LABEL_18:
    if (_fetchedInternalBuildOnceToken_9 != -1)
      dispatch_once(&_fetchedInternalBuildOnceToken_9, &__block_literal_global_33_0);
    if (_isInternalDevice_9)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = ____RE_Cached_Get__ShowAllElements_block_invoke_0;
      v65 = &unk_24CF8AAF0;
      v66 = 0;
      if (__RE_Cached_Get__ShowAllElements_onceToken_0 != -1)
        dispatch_once(&__RE_Cached_Get__ShowAllElements_onceToken_0, buf);
      os_unfair_lock_lock(&__RE_Cached_lock__ShowAllElements_0);
      if ((__RE_Cached_hasValue__ShowAllElements_0 & 1) == 0)
      {
        v63 = 0;
        if (!RelevanceEngineLibraryCore_frameworkLibrary_2)
        {
          *(_OWORD *)v67 = xmmword_24CF902B8;
          v68 = 0;
          RelevanceEngineLibraryCore_frameworkLibrary_2 = _sl_dlopen();
        }
        v19 = v4;
        if (RelevanceEngineLibraryCore_frameworkLibrary_2)
        {
          objc_msgSend(soft__REEngineDefaults_1(), "globalDefaults");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v20 = 0;
        }
        v22 = objc_msgSend(v20, "_BOOLValueForKey:set:", CFSTR("ShowAllElements"), &v63);
        if (v63)
          v23 = v22;
        else
          v23 = 0;
        RELogForDomain(0);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v67 = 138412290;
          *(_QWORD *)&v67[4] = v25;
          _os_log_impl(&dword_2132F7000, v24, OS_LOG_TYPE_DEFAULT, "Prefs reading value for key ShowAllElements: %@", v67, 0xCu);

        }
        if (v63)
          v26 = v23;
        else
          v26 = 0;
        __RE_Cached__ShowAllElements_0 = v26;
        __RE_Cached_hasValue__ShowAllElements_0 = 1;
        v4 = v19;
      }
      os_unfair_lock_unlock(&__RE_Cached_lock__ShowAllElements_0);
      v27 = __RE_Cached__ShowAllElements_0;

      if (v27)
        goto LABEL_43;
    }
    if ((RETrainingSimulationIsCurrentlyActive() & 1) != 0)
    {
LABEL_43:
      v21 = 0;
    }
    else
    {
      context = (void *)MEMORY[0x2199B223C]();
      -[REMLElementComparator model](self, "model");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "featureMap");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "predictionSetWithFeatures:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[NSArray count](self->_filteringRules, "count"))
      {
        v32 = 0;
        loga = 0;
        *(_QWORD *)&v31 = 138412802;
        v48 = v31;
        v50 = v4;
        v60 = v30;
        do
        {
          -[NSArray objectAtIndexedSubscript:](self->_filteringEvaluators, "objectAtIndexedSubscript:", v32, v48);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray objectAtIndexedSubscript:](self->_filteringRules, "objectAtIndexedSubscript:", v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v33, "needsPredictionSet"))
          {
            objc_msgSend(v4, "featureMap");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = 0;
            v36 = objc_msgSend(v33, "acceptsFeatureMap:predictionSet:explanation:", v35, v30, &v61);
            v37 = v61;

            if (v36)
            {
              objc_msgSend(v4, "identifier");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = v34;
              v40 = v38;
              v41 = v37;
              if (v41 && REMLExplanationsEnabled())
              {
                v55 = objc_alloc_init(REMLExplanationFormatter);
                v42 = objc_msgSend(v39, "type");
                RELogForDomain(4);
                v43 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                {
                  v44 = CFSTR("Including");
                  if (v42 != 1)
                    v44 = 0;
                  if (!v42)
                    v44 = CFSTR("Filtering");
                  v49 = v44;
                  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v41);
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  -[REMLExplanationFormatter descriptionFromExplanations:](v55, "descriptionFromExplanations:", v52);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v48;
                  *(_QWORD *)&buf[4] = v49;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v40;
                  *(_WORD *)&buf[22] = 2112;
                  v65 = v45;
                  _os_log_impl(&dword_2132F7000, v43, OS_LOG_TYPE_INFO, "%@ %@ because %@", buf, 0x20u);

                }
                v4 = v50;
              }

              v46 = objc_msgSend(v39, "type");
              if (v46 == 1)
              {
                loga = 0;
                v30 = v60;
              }
              else
              {
                v30 = v60;
                if (!v46)
                  loga = 1;
              }
            }

          }
          ++v32;
        }
        while (v32 < -[NSArray count](self->_filteringRules, "count"));
      }
      else
      {
        loga = 0;
      }

      objc_autoreleasePoolPop(context);
      v21 = loga;
    }
    goto LABEL_66;
  }
  v5 = 0;
  while (1)
  {
    -[NSArray objectAtIndexedSubscript:](self->_filteringEvaluators, "objectAtIndexedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](self->_filteringRules, "objectAtIndexedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "needsPredictionSet") & 1) == 0)
      break;
LABEL_17:

    if (++v5 >= -[NSArray count](self->_filteringRules, "count"))
      goto LABEL_18;
  }
  v8 = v4;
  objc_msgSend(v4, "featureMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0;
  v10 = objc_msgSend(v6, "acceptsFeatureMap:predictionSet:explanation:", v9, 0, &v62);
  v11 = v62;

  if (!v10)
    goto LABEL_16;
  objc_msgSend(v8, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v7;
  v13 = v12;
  v14 = v11;
  if (v14 && REMLExplanationsEnabled())
  {
    v58 = objc_alloc_init(REMLExplanationFormatter);
    v15 = objc_msgSend(v59, "type");
    RELogForDomain(4);
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      v16 = CFSTR("Including");
      if (v15 != 1)
        v16 = 0;
      if (!v15)
        v16 = CFSTR("Filtering");
      v51 = v16;
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v14);
      contexta = (void *)objc_claimAutoreleasedReturnValue();
      -[REMLExplanationFormatter descriptionFromExplanations:](v58, "descriptionFromExplanations:", contexta);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v51;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2112;
      v65 = v17;
      _os_log_impl(&dword_2132F7000, log, OS_LOG_TYPE_INFO, "%@ %@ because %@", buf, 0x20u);

    }
  }

  v18 = objc_msgSend(v59, "type");
  if (v18 == 1)
  {
    v21 = 0;
    goto LABEL_30;
  }
  if (v18)
  {
LABEL_16:

    v4 = v8;
    goto LABEL_17;
  }
  v21 = 1;
LABEL_30:

  v4 = v8;
LABEL_66:

  return v21 & 1;
}

- (int64_t)compareElement:(id)a3 toElement:(id)a4 level:(unint64_t)a5
{
  id v8;
  id v9;
  unint64_t i;
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
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int64_t v29;
  void *v30;
  int v31;
  int v32;
  int v33;
  int v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;

  v8 = a3;
  v9 = a4;
  if (a5 != 1)
  {
    v30 = (void *)MEMORY[0x2199B223C]();
    -[_RERuleMLElementComparator _relevanceForElement:](self, "_relevanceForElement:", v8);
    v32 = v31;
    -[_RERuleMLElementComparator _relevanceForElement:](self, "_relevanceForElement:", v9);
    v34 = v33;
    LODWORD(v35) = v32;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v37) = v34;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v36, "compare:", v38);
    if (v39 == 1)
      v29 = 1;
    else
      v29 = -1;

    objc_autoreleasePoolPop(v30);
    if (!v39)
    {
      objc_msgSend(v8, "identifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "compare:", v41);

      if (v42 == 1)
        v43 = 1;
      else
        v43 = -1;
      if (v42)
        v29 = v43;
      else
        v29 = 0;
    }
    goto LABEL_45;
  }
  v51 = v8;
  if (-[NSArray count](self->_rankingRules, "count"))
  {
    for (i = 0; i < -[NSArray count](self->_rankingRules, "count"); ++i)
    {
      -[NSArray objectAtIndexedSubscript:](self->_leftRankingEvaluators, "objectAtIndexedSubscript:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_rightRankingEvaluators, "objectAtIndexedSubscript:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_comparisonRankingEvaluators, "objectAtIndexedSubscript:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "needsPredictionSet") & 1) == 0 && (objc_msgSend(v12, "needsPredictionSet") & 1) == 0)
      {
        objc_msgSend(v8, "featureMap");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v9;
        objc_msgSend(v9, "featureMap");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "acceptsFeatureMap:predictionSet:explanation:", v14, 0, 0)
          && objc_msgSend(v12, "acceptsFeatureMap:predictionSet:explanation:", v16, 0, 0)
          && objc_msgSend(v13, "compareFeatureMap:toFeatureMap:", v14, v16))
        {
          -[NSArray objectAtIndexedSubscript:](self->_rankingRules, "objectAtIndexedSubscript:", i);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v47, "order");
LABEL_50:

          v8 = v51;
          v9 = v15;
          goto LABEL_45;
        }
        if (objc_msgSend(v11, "acceptsFeatureMap:predictionSet:explanation:", v16, 0, 0)
          && objc_msgSend(v12, "acceptsFeatureMap:predictionSet:explanation:", v14, 0, 0)
          && objc_msgSend(v13, "compareFeatureMap:toFeatureMap:", v16, v14))
        {
          -[NSArray objectAtIndexedSubscript:](self->_rankingRules, "objectAtIndexedSubscript:", i);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "order");
          if (v48 == 1)
            v29 = -1;
          else
            v29 = v48 != 0;
          goto LABEL_50;
        }

        v8 = v51;
        v9 = v15;
      }

    }
  }
  v17 = (void *)MEMORY[0x2199B223C]();
  -[REMLElementComparator model](self, "model");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "featureMap");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "predictionSetWithFeatures:", v19);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMLElementComparator model](self, "model");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "featureMap");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "predictionSetWithFeatures:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[NSArray count](self->_rankingRules, "count"))
  {
    v29 = 0;
    goto LABEL_44;
  }
  v49 = v17;
  v50 = v9;
  v23 = 0;
  while (1)
  {
    -[NSArray objectAtIndexedSubscript:](self->_leftRankingEvaluators, "objectAtIndexedSubscript:", v23, v49);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](self->_rightRankingEvaluators, "objectAtIndexedSubscript:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](self->_comparisonRankingEvaluators, "objectAtIndexedSubscript:", v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v24, "needsPredictionSet") & 1) == 0 && !objc_msgSend(v25, "needsPredictionSet"))
      goto LABEL_25;
    objc_msgSend(v51, "featureMap");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "featureMap");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "acceptsFeatureMap:predictionSet:explanation:", v27, v52, 0)
      && objc_msgSend(v25, "acceptsFeatureMap:predictionSet:explanation:", v28, v22, 0)
      && objc_msgSend(v26, "compareFeatureMap:toFeatureMap:", v27, v28))
    {
      -[NSArray objectAtIndexedSubscript:](self->_rankingRules, "objectAtIndexedSubscript:", v23);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v44, "order");
      goto LABEL_42;
    }
    if (objc_msgSend(v24, "acceptsFeatureMap:predictionSet:explanation:", v28, v22, 0)
      && objc_msgSend(v25, "acceptsFeatureMap:predictionSet:explanation:", v27, v52, 0)
      && objc_msgSend(v26, "compareFeatureMap:toFeatureMap:", v28, v27))
    {
      break;
    }

LABEL_25:
    if (++v23 >= -[NSArray count](self->_rankingRules, "count"))
    {
      v29 = 0;
      goto LABEL_43;
    }
  }
  -[NSArray objectAtIndexedSubscript:](self->_rankingRules, "objectAtIndexedSubscript:", v23);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "order");
  if (v45 == 1)
    v29 = -1;
  else
    v29 = v45 != 0;
LABEL_42:

LABEL_43:
  v9 = v50;
  v8 = v51;
  v17 = v49;
LABEL_44:

  objc_autoreleasePoolPop(v17);
LABEL_45:

  return v29;
}

- (void)_relevanceForElement:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0_5(&dword_2132F7000, v2, v3, "%@ - forced relevance %f", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_3();
}

- (void)_relevanceForElement:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "explanationDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_2132F7000, v2, v3, "Explanation: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)_relevanceForElement:(void *)a1 .cold.3(void *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "bias");
  OUTLINED_FUNCTION_0_5(&dword_2132F7000, v4, v5, "Bias for element %@ : %f", v6, v7, v8, v9, 2u);

}

- (void)_relevanceForElement:(void *)a1 .cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0_5(&dword_2132F7000, v2, v3, "Probability for element %@ : %f", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_3();
}

- (void)_relevanceForElement:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_2132F7000, a1, a3, "\n\n\n\n\n\n", a5, a6, a7, a8, 0);
}

- (void)_relevanceForElement:(void *)a1 .cold.6(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_2132F7000, v2, v3, "Running prediction %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)_relevanceForElement:(uint64_t)a3 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_2132F7000, a1, a3, "\n\n", a5, a6, a7, a8, 0);
}

@end
