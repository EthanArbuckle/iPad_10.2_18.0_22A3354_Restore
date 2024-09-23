@implementation SDFeedbackInterceptor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_12);
  return (id)sharedInstance_listener;
}

void __39__SDFeedbackInterceptor_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_listener;
  sharedInstance_listener = v0;

}

- (SDFeedbackInterceptor)init
{
  SDFeedbackInterceptor *v2;
  SDFeedbackInterceptor *v3;
  NSString *currentQuery;
  uint64_t v5;
  NSMutableDictionary *sentSections;
  uint64_t v7;
  NSMutableOrderedSet *sectionOrder;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  void *v12;
  uint64_t v13;
  SPPersonalMetricManager *personalMetricManager;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SDFeedbackInterceptor;
  v2 = -[SDFeedbackInterceptor init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    currentQuery = v2->_currentQuery;
    v2->_currentQuery = 0;

    v5 = objc_opt_new();
    sentSections = v3->_sentSections;
    v3->_sentSections = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    sectionOrder = v3->_sectionOrder;
    v3->_sectionOrder = (NSMutableOrderedSet *)v7;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.searchd.feedbackInterceptorQueue", v9);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v10;

    v3->_collectAnonymousData = 0;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.searchd"));
    v3->_testRenderEngagementCounts = objc_msgSend(v12, "BOOLForKey:", CFSTR("testRenderEngagementCounts"));
    v3->_stressTestCounts = objc_msgSend(v12, "BOOLForKey:", CFSTR("stressTestCounts"));
    v3->_isInternalDevice = os_variant_has_internal_diagnostics();
    v3->_engagedTTR = 0;
    +[SPPersonalMetricManager sharedInstance](SPPersonalMetricManager, "sharedInstance");
    v13 = objc_claimAutoreleasedReturnValue();
    personalMetricManager = v3->_personalMetricManager;
    v3->_personalMetricManager = (SPPersonalMetricManager *)v13;

  }
  return v3;
}

- (void)annotateRankingFeedback:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  SDFeedbackTransactionCreate(CFSTR("annotate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SDFeedbackInterceptor queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__SDFeedbackInterceptor_annotateRankingFeedback_completion___block_invoke;
  v13[3] = &unk_24CF64648;
  v13[4] = self;
  v14 = v8;
  v15 = v6;
  v16 = v7;
  v10 = v6;
  v11 = v8;
  v12 = v7;
  dispatch_async(v9, v13);

}

void __60__SDFeedbackInterceptor_annotateRankingFeedback_completion___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  uint64_t v42;
  id obj;
  id obja;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  const __CFString *v57;
  void *v58;
  _QWORD v59[3];
  _QWORD v60[3];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "collectAnonymousData") & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isInternalDevice") & 1) == 0)
    {
LABEL_42:
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      if (*(_QWORD *)(a1 + 40))
        v40 = (id)objc_opt_self();
      return;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB01F8], "sharedHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "collectScores"))
    {

    }
    else
    {
      v3 = objc_msgSend(*(id *)(a1 + 32), "isInternalDevice");

      if ((v3 & 1) == 0)
        goto LABEL_42;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v42 = a1;
  objc_msgSend(*(id *)(a1 + 48), "sections");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v54 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        objc_msgSend(v9, "results");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v50;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v50 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "result");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "identifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setObject:forKey:", v15, v16);

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
          }
          while (v12);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(v42 + 32), "_itemsFromSentSections");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB0210], "sharedModelManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "getL2ModelVersionForClientBundle:", 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obja = v17;
  v19 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v46;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v46 != v21)
          objc_enumerationMutation(obja);
        v23 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * k);
        objc_msgSend(v23, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKey:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "L2FeatureVector");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
          v27 = v25 == 0;
        else
          v27 = 1;
        if (!v27)
        {
          v59[0] = CFSTR("score");
          v31 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v23, "score");
          objc_msgSend(v31, "numberWithFloat:");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v60[0] = v32;
          v59[1] = CFSTR("raw score");
          v33 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v23, "rawScore");
          objc_msgSend(v33, "numberWithFloat:");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v60[1] = v34;
          v59[2] = CFSTR("original score");
          v35 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v23, "L2FeatureVector");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "originalL2Score");
          objc_msgSend(v35, "numberWithFloat:");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v60[2] = v37;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, v59, 3);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setLocalFeatures:", v38);

LABEL_36:
          goto LABEL_37;
        }
        objc_msgSend(v23, "localSuggestionsData");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
          v29 = v25 == 0;
        else
          v29 = 1;
        if (!v29)
        {
          v57 = CFSTR("suggestion score");
          v30 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v23, "suggestionScore");
          objc_msgSend(v30, "numberWithDouble:");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = v32;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setLocalFeatures:", v34);
          goto LABEL_36;
        }
LABEL_37:

      }
      v20 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
    }
    while (v20);
  }

  objc_msgSend(*(id *)(v42 + 48), "setL2ModelVersion:", v41);
  (*(void (**)(void))(*(_QWORD *)(v42 + 56) + 16))();
  if (*(_QWORD *)(v42 + 40))
    v39 = (id)objc_opt_self();

}

- (void)willSendSections:(id)a3 forQuery:(id)a4 queryIdentifier:(unint64_t)a5 allowAnonymousDataCollection:(BOOL)a6 withRankerUsed:(id)a7 withRankingConfiguration:(id)a8 internalDebug:(BOOL)a9 keyboardPrimaryLanguage:(id)a10 clientID:(id)a11
{
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  OS_dispatch_queue *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  qos_class_t v44;
  dispatch_block_t v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *queuea;
  id v52;
  id v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  id obj;
  _QWORD block[5];
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  unint64_t v72;
  BOOL v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v55 = a4;
  v52 = a7;
  v57 = a8;
  v56 = a10;
  v48 = a11;
  v14 = a3;
  SDFeedbackTransactionCreate(CFSTR("willSendSections"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");

  v16 = objc_msgSend(v15, "count");
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v15, "count"));
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v16);
  v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEE0]), "initWithCapacity:", v16);
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  obj = v15;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v75 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
        objc_msgSend(v23, "results");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v24, "copy");
        objc_msgSend(v17, "addObject:", v25);

        objc_msgSend(v23, "bundleIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27)
        {
          v27 = (void *)objc_opt_new();
          objc_msgSend(v23, "resultSet");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "count");

          v30 = objc_msgSend(v23, "maxInitiallyVisibleResults");
          if (v29 >= v30)
            v31 = v30;
          else
            v31 = v29;
          objc_msgSend(v27, "setCountOfVisibleResults:", v31);
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v27, v26);
          objc_msgSend(v23, "bundleIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "addObject:", v32);

        }
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
    }
    while (v20);
  }

  objc_msgSend(v57, "lock");
  objc_msgSend(v57, "queryDependentCategoryProbabilities");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "copy");

  objc_msgSend(v57, "unlock");
  v35 = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __183__SDFeedbackInterceptor_willSendSections_forQuery_queryIdentifier_allowAnonymousDataCollection_withRankerUsed_withRankingConfiguration_internalDebug_keyboardPrimaryLanguage_clientID___block_invoke;
  block[3] = &unk_24CF64690;
  block[4] = self;
  v62 = v56;
  v63 = obj;
  v64 = v17;
  v65 = v18;
  v66 = v34;
  v73 = a6;
  v67 = v55;
  v68 = v48;
  v69 = v52;
  v70 = v58;
  v71 = v47;
  v72 = a5;
  queuea = v35;
  v54 = v47;
  v36 = v58;
  v59 = v52;
  v37 = v48;
  v38 = v55;
  v39 = v34;
  v40 = v18;
  v41 = v17;
  v42 = obj;
  v43 = v56;
  v44 = qos_class_self();
  if (v44 < 0x1A)
    v45 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  else
    v45 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v44, 0, block);
  v46 = v45;
  dispatch_async(queuea, v45);

}

void __183__SDFeedbackInterceptor_willSendSections_forQuery_queryIdentifier_allowAnonymousDataCollection_withRankerUsed_withRankingConfiguration_internalDebug_keyboardPrimaryLanguage_clientID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  double v39;
  double v40;
  id v41;
  uint64_t data;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t i;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  id v68;
  id obj;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[1024];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE __str[12];
  __int16 v102;
  uint64_t v103;
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
  v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEE0]), "initWithObjects:", CFSTR("com.apple.other.search_web"), CFSTR("com.apple.other.search_app_store"), CFSTR("com.apple.other.search_maps"), 0);
  v78 = a1;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), *(id *)(a1 + 40));
  if (kPlaceHolderInputName_block_invoke_onceToken != -1)
    dispatch_once(&kPlaceHolderInputName_block_invoke_onceToken, &__block_literal_global_150_0);
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  obj = *(id *)(a1 + 48);
  v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v100, 16);
  if (v71)
  {
    v2 = 0;
    v70 = *(_QWORD *)v94;
    v81 = *MEMORY[0x24BEB06B0];
    v80 = *MEMORY[0x24BEB06A8];
    v79 = *MEMORY[0x24BEB0670];
    v72 = *MEMORY[0x24BEB0660];
    v77 = *MEMORY[0x24BDD0CE0];
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v94 != v70)
          objc_enumerationMutation(obj);
        v75 = v3;
        v76 = v2;
        v4 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * v3);
        objc_msgSend(*(id *)(v78 + 56), "objectAtIndex:", v2);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "bundleIdentifier");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = (void *)objc_opt_new();
        v89 = 0u;
        v90 = 0u;
        v91 = 0u;
        v92 = 0u;
        v6 = v5;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v89, v99, 16);
        if (!v7)
        {
          v84 = 0;
          goto LABEL_61;
        }
        v8 = v7;
        v84 = 0;
        v9 = *(_QWORD *)v90;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v90 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v10);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v12 = v11;
              v13 = objc_msgSend(v12, "type");
              objc_msgSend(v12, "sectionBundleIdentifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v14)
                goto LABEL_50;
              objc_msgSend(v12, "rankingItem");
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v15)
                goto LABEL_50;
              objc_msgSend(v12, "rankingItem");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "sectionBundleIdentifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v17)
              {
                objc_msgSend(v12, "rankingItem");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "setSectionBundleIdentifier:", v14);

              }
              if ((SSResultTypeIsServer() & 1) == 0 && (v13 & 0xFFFFFFFE) != 6)
              {
                v19 = (uint64_t)v84;
                if (!v84)
                  v19 = objc_opt_new();
                v84 = (void *)v19;
                objc_msgSend(v12, "identifier");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "rankingItem");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "setIdentifier:", v20);

                if (objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.DocumentsApp")))
                {
                  objc_msgSend(v12, "resultBundleId");
                  v22 = objc_claimAutoreleasedReturnValue();

                  v14 = (void *)v22;
                }
                objc_msgSend(v12, "rankingItem");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "setSectionBundleIdentifier:", v14);

                objc_msgSend(v12, "rankingItem");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v83, "addObject:", v24);

                objc_msgSend(v12, "identifier");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                if (v25)
                {

                  goto LABEL_38;
                }
                objc_msgSend(v12, "sectionBundleIdentifier");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("com.apple.calculation"));

                if ((v33 & 1) != 0)
                {
LABEL_38:
                  objc_msgSend(v12, "protectionClass");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v34)
                  {
                    objc_msgSend(v12, "protectionClass");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v12, "identifier");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v84, "setObject:forKey:", v35, v36);

                    goto LABEL_49;
                  }
                }
                else
                {
                  SPLogForSPLogCategoryDefault();
                  v37 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
                  {
                    objc_msgSend(v12, "resultBundleId");
                    v73 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                    v52 = objc_msgSend(v73, "UTF8String");
                    objc_msgSend(v12, "sectionBundleIdentifier");
                    v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                    v54 = objc_msgSend(v53, "UTF8String");
                    *(_DWORD *)__str = 136315394;
                    *(_QWORD *)&__str[4] = v52;
                    v102 = 2080;
                    v103 = v54;
                    _os_log_fault_impl(&dword_213202000, v37, OS_LOG_TYPE_FAULT, "result identifier is nil, resultBundleId: >%s<, sectionBundleIdentifier: >%s<", __str, 0x16u);

                  }
                }
                goto LABEL_50;
              }
              if (!SSResultTypeIsServer())
                goto LABEL_50;
              objc_msgSend(v12, "rankingItem");
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v26)
                goto LABEL_50;
              if (_os_feature_enabled_impl())
              {
                if ((objc_msgSend(v14, "isEqual:", v81) & 1) != 0
                  || (objc_msgSend(v14, "isEqual:", v80) & 1) != 0
                  || (objc_msgSend(v14, "isEqual:", v79) & 1) != 0)
                {
                  objc_msgSend(v12, "getStableServerResultIdentifier");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "rankingItem");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "setIdentifier:", v27);

                  goto LABEL_33;
                }
                v49 = objc_msgSend(v14, "isEqual:", v72);
                objc_msgSend(v12, "getStableServerResultIdentifier");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "rankingItem");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "setIdentifier:", v50);

                if ((v49 & 1) == 0)
                {
LABEL_46:
                  bzero(v98, 0x400uLL);
                  json_writer_init_with_buffer();
                  json_writer_begin_dictionary();
                  json_writer_add_key();
                  objc_msgSend(v12, "rankingScore");
                  v40 = v39;
                  bzero(__str, 0x400uLL);
                  snprintf(__str, 0x400uLL, "%.2g", v40);
                  atof(__str);
                  json_writer_add_double();
                  json_writer_add_key();
                  objc_msgSend(v12, "sectionBundleIdentifier");
                  v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  objc_msgSend(v41, "UTF8String");
                  json_writer_add_string();

                  json_writer_add_key();
                  json_writer_add_raw_value();
                  json_writer_add_key();
                  objc_msgSend(v12, "feedbackBlockId");
                  json_writer_add_uint32();
                  json_writer_end_dictionary();
                  *(_QWORD *)__str = 0;
                  data = json_writer_get_data();
                  if (data)
                  {
                    v43 = data;
                    v44 = objc_alloc(MEMORY[0x24BDBCE50]);
                    v45 = (void *)objc_msgSend(v44, "initWithBytes:length:", *(_QWORD *)__str, v43);
                    objc_msgSend(v12, "rankingItem");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "setServerFeaturesJSON:", v45);

                  }
                  objc_msgSend(v12, "rankingItem");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "sectionBundleIdentifier");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v82, "addObject:", v48);

                  objc_msgSend(v12, "rankingItem");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v83, "addObject:", v35);
LABEL_49:

LABEL_50:
                  goto LABEL_51;
                }
LABEL_33:
                v29 = (uint64_t)v84;
                if (!v84)
                  v29 = objc_opt_new();
                v84 = (void *)v29;
                objc_msgSend(v12, "protectionClass");
                v30 = objc_claimAutoreleasedReturnValue();
                if (v30)
                {
                  v31 = (void *)v30;
LABEL_45:

                  goto LABEL_46;
                }
                if (!v84)
                {
                  v84 = 0;
                  goto LABEL_46;
                }
                objc_msgSend(v12, "rankingItem");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "identifier");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v84, "setObject:forKey:", v77, v38);
              }
              else
              {
                objc_msgSend(v12, "getStableServerResultIdentifier");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "rankingItem");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "setIdentifier:", v31);
              }

              goto LABEL_45;
            }
LABEL_51:
            ++v10;
          }
          while (v8 != v10);
          v55 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v89, v99, 16);
          v8 = v55;
        }
        while (v55);
LABEL_61:

        if (objc_msgSend(v83, "count"))
        {
          objc_msgSend(*(id *)(v78 + 64), "objectForKeyedSubscript:", v74);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setArrayOfRankingItems:", v83);
          objc_msgSend(v56, "setBundleIdentifier:", v74);
          if (v84)
            objc_msgSend(v56, "setMapResultIdToProtectionClass:");

        }
        v2 = v76 + 1;

        v3 = v75 + 1;
      }
      while (v75 + 1 != v71);
      v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v100, 16);
    }
    while (v71);
  }

  v57 = (void *)objc_opt_new();
  if (*(_QWORD *)(v78 + 72))
  {
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v58 = v82;
    v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v86;
      do
      {
        for (i = 0; i != v60; ++i)
        {
          if (*(_QWORD *)v86 != v61)
            objc_enumerationMutation(v58);
          v63 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
          v64 = *(void **)(v78 + 72);
          objc_msgSend(v63, "lowercaseString");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "objectForKey:", v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          if (v66)
            objc_msgSend(v57, "setObject:forKey:", v66, v63);

        }
        v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
      }
      while (v60);
    }

  }
  v67 = v78;
  *(_BYTE *)(*(_QWORD *)(v78 + 32) + 8) = *(_BYTE *)(v78 + 128);
  objc_storeStrong((id *)(*(_QWORD *)(v78 + 32) + 24), *(id *)(v78 + 80));
  *(_QWORD *)(*(_QWORD *)(v78 + 32) + 32) = *(_QWORD *)(v78 + 120);
  objc_storeStrong((id *)(*(_QWORD *)(v67 + 32) + 40), *(id *)(v67 + 88));
  objc_storeStrong((id *)(*(_QWORD *)(v67 + 32) + 64), *(id *)(v67 + 96));
  objc_storeStrong((id *)(*(_QWORD *)(v67 + 32) + 16), *(id *)(v67 + 64));
  objc_storeStrong((id *)(*(_QWORD *)(v67 + 32) + 48), *(id *)(v67 + 104));
  objc_storeStrong((id *)(*(_QWORD *)(v78 + 32) + 72), v57);
  if (*(_QWORD *)(v78 + 112))
    v68 = (id)objc_opt_self();

}

void __183__SDFeedbackInterceptor_willSendSections_forQuery_queryIdentifier_allowAnonymousDataCollection_withRankerUsed_withRankingConfiguration_internalDebug_keyboardPrimaryLanguage_clientID___block_invoke_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)kPlaceHolderInputName_block_invoke_classes;
  kPlaceHolderInputName_block_invoke_classes = v3;

}

- (void)didEngageSection:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  SDFeedbackInterceptor *v11;
  id v12;

  v4 = a3;
  SDFeedbackTransactionCreate(CFSTR("didEngageSection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__SDFeedbackInterceptor_didEngageSection___block_invoke;
  block[3] = &unk_24CF63F80;
  v10 = v4;
  v11 = self;
  v12 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(queue, block);

}

void __42__SDFeedbackInterceptor_didEngageSection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "section");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(a1 + 32), "triggerEvent");
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  objc_msgSend(v8, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == 3)
  {
    objc_msgSend(v5, "setCountOfVisibleResults:", objc_msgSend(v8, "maxInitiallyVisibleResults"));
  }
  else if (v2 == 2)
  {
    objc_msgSend(v8, "results");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCountOfVisibleResults:", objc_msgSend(v6, "count"));

  }
  if (*(_QWORD *)(a1 + 48))
    v7 = (id)objc_opt_self();

}

- (id)_itemsFromSentSections
{
  return -[SDFeedbackInterceptor _itemsFromSentSectionsWithProtectionClasses:filterWithResults:](self, "_itemsFromSentSectionsWithProtectionClasses:filterWithResults:", 0, 0);
}

- (id)_itemsFromSentSectionsWithProtectionClasses:(id)a3 filterWithResults:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  uint64_t v36;
  SDFeedbackInterceptor *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v44 = a4;
  v7 = objc_msgSend(v44, "count");
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_opt_new();
  }
  v9 = (void *)v8;
  v10 = -[NSMutableOrderedSet count](self->_sectionOrder, "count");
  if (v10 >= 1)
  {
    v11 = v10;
    v12 = 0;
    v41 = v6;
    v36 = v10;
    v37 = self;
    do
    {
      -[NSMutableOrderedSet objectAtIndexedSubscript:](self->_sectionOrder, "objectAtIndexedSubscript:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      -[SDFeedbackInterceptor sentSections](self, "sentSections");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)v13;
      objc_msgSend(v14, "objectForKeyedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "mapResultIdToProtectionClass");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addEntriesFromDictionary:", v16);

      v39 = v15;
      if (v7)
      {
        objc_msgSend(v15, "arrayOfRankingItems");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");
        if (v18 < 1 || v7 < 1)
          goto LABEL_33;
        v20 = v18;
        v38 = v12;
        v21 = 0;
        v22 = 0;
        v42 = v18;
        do
        {
          objc_msgSend(v17, "objectAtIndexedSubscript:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "identifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v6
            || (objc_msgSend(v6, "objectForKey:", v24),
                v25 = (void *)objc_claimAutoreleasedReturnValue(),
                v25,
                v25))
          {
            if (v22 < v7)
            {
              v43 = v22;
              v26 = v22;
              while (1)
              {
                objc_msgSend(v44, "objectAtIndexedSubscript:", v26);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "identifier");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v28, "isEqualToString:", v24);

                ++v26;
                if (v29)
                  break;

                if (v7 == v26)
                {
                  v6 = v41;
                  v20 = v42;
                  v22 = v43;
                  goto LABEL_20;
                }
              }
              objc_msgSend(v9, "addObject:", v23);

              v22 = v26;
              v6 = v41;
              v20 = v42;
            }
          }
LABEL_20:

          ++v21;
        }
        while (v21 < v20 && v22 < v7);
        v11 = v36;
        self = v37;
      }
      else
      {
        v38 = v12;
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        objc_msgSend(v15, "arrayOfRankingItems");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v31; ++i)
            {
              if (*(_QWORD *)v46 != v32)
                objc_enumerationMutation(v17);
              v34 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
              if ((objc_msgSend(v9, "containsObject:", v34) & 1) == 0)
                objc_msgSend(v9, "addObject:", v34);
            }
            v31 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
          }
          while (v31);
        }
      }
      v12 = v38;
LABEL_33:

      ++v12;
    }
    while (v12 != v11);
  }

  return v9;
}

- (void)didPerformCommand:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  SDFeedbackInterceptor *v11;
  id v12;

  v4 = a3;
  SDFeedbackTransactionCreate(CFSTR("didEngageResult"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SDFeedbackInterceptor_didPerformCommand___block_invoke;
  block[3] = &unk_24CF63F80;
  v10 = v4;
  v11 = self;
  v12 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(queue, block);

}

void __43__SDFeedbackInterceptor_didPerformCommand___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  SDSuggestionsFeedbackCollectible *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  id v24;
  uint64_t v25;
  void *k;
  void *v27;
  void *v28;
  int v29;
  BOOL v30;
  int v31;
  BOOL v32;
  int v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  unsigned int v38;
  void *v39;
  char v40;
  char v41;
  void *v42;
  id v43;
  int v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t m;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  id v63;
  char v64;
  uint64_t v65;
  unsigned int v66;
  void *v67;
  id v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
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
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.other:taptoradar")))
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 13) = 1;
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "indexOfObject:", v3);
  objc_msgSend(*(id *)(a1 + 40), "suggestionsIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v7 = *(_QWORD *)(a1 + 40);
  v72 = v2;
  if (v5 && v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(*(id *)(v7 + 80), "count"));
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v9 = *(id *)(*(_QWORD *)(a1 + 40) + 80);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v85, v92, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v86;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v86 != v12)
            objc_enumerationMutation(v9);
          v14 = -[SDSuggestionsFeedbackCollectible initWithSuggestionsData:]([SDSuggestionsFeedbackCollectible alloc], "initWithSuggestionsData:", *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * i));
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v85, v92, 16);
      }
      while (v11);
    }

    objc_msgSend(MEMORY[0x24BEB01F0], "sharedManager");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "usedRanker");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "extractTrainingDataWithItemAtIndex:withItems:withRanker:forQuery:dataCollectAllowed:forClientBundle:keyboardPrimaryLanguage:clientID:", v4, v8, v16, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), 1, *MEMORY[0x24BEB06B8], *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
    v17 = v72;
    goto LABEL_85;
  }
  v8 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(*(id *)(v7 + 16), "count"));
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v18 = *(id *)(*(_QWORD *)(a1 + 40) + 48);
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v81, v91, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v82;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v82 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * j));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v23);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v81, v91, 16);
    }
    while (v20);
  }

  v71 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 40), "_itemsFromSentSectionsWithProtectionClasses:filterWithResults:");
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
  if (v15)
  {
    v25 = *(_QWORD *)v78;
    while (2)
    {
      for (k = 0; k != v15; k = (char *)k + 1)
      {
        if (*(_QWORD *)v78 != v25)
          objc_enumerationMutation(v24);
        v27 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)k);
        objc_msgSend(v27, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "isEqualToString:", v3);

        if (v29)
        {
          v15 = v27;
          goto LABEL_30;
        }
      }
      v15 = (id)objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
      if (v15)
        continue;
      break;
    }
  }
LABEL_30:
  v70 = v24;

  v17 = v72;
  v30 = objc_msgSend(v72, "type") == 36 || objc_msgSend(v72, "type") == 37;
  v31 = _os_feature_enabled_impl();
  if (v15)
    v32 = v31 == 0;
  else
    v32 = 1;
  if (v32)
  {
    v33 = 0;
  }
  else
  {
    objc_msgSend(v15, "sectionBundleIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "isEqual:", *MEMORY[0x24BEB06B0]);
    if ((v35 & 1) != 0)
    {
      v33 = 1;
    }
    else
    {
      objc_msgSend(v15, "sectionBundleIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v36, "isEqual:", *MEMORY[0x24BEB06A8]) & 1) != 0)
      {
        v33 = 1;
      }
      else
      {
        objc_msgSend(v15, "sectionBundleIdentifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v37, "isEqual:", *MEMORY[0x24BEB0670]) & 1) != 0)
        {
          v33 = 1;
        }
        else
        {
          objc_msgSend(v15, "sectionBundleIdentifier");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v67, "isEqual:", *MEMORY[0x24BEB0660]);

        }
      }

    }
  }
  v38 = objc_msgSend(v72, "type");
  objc_msgSend(v15, "sectionBundleIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "isEqual:", *MEMORY[0x24BEB0720]);
  if (v38 == 20)
    v41 = v40;
  else
    v41 = 0;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v38 != 2 && !v30 && (v38 > 7 || ((1 << v38) & 0xD0) == 0) && (v33 & 1) == 0)
    {
      if (v15)
        v64 = v41;
      else
        v64 = 0;
      if ((v64 & 1) == 0)
        goto LABEL_68;
LABEL_58:
      objc_msgSend(v15, "identifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "objectForKey:", v42);
      v43 = (id)objc_claimAutoreleasedReturnValue();

      if (v43)
        v44 = 0;
      else
        v44 = v33;
      if (v44 == 1)
        v43 = (id)*MEMORY[0x24BDD0CE0];
      if (v43)
      {
        objc_msgSend(v15, "sectionBundleIdentifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "isEqualToString:", CFSTR("com.apple.DocumentsApp"));

        if (v46)
        {
          objc_msgSend(v72, "resultBundleId");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setSectionBundleIdentifier:", v47);

        }
        objc_msgSend(MEMORY[0x24BEB02E8], "sharedInstance");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "didEngageResultWithRankingItem:startDate:protectionClass:query:", v15, 0, v43, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));

      }
      goto LABEL_68;
    }
    if (v15)
      goto LABEL_58;
  }
LABEL_68:
  objc_msgSend(*(id *)(a1 + 40), "_itemsFromSentSections");
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v49 = (id)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v73, v89, 16);
  if (v50)
  {
    v51 = v50;
    v68 = v15;
    v52 = *(_QWORD *)v74;
    while (2)
    {
      for (m = 0; m != v51; ++m)
      {
        if (*(_QWORD *)v74 != v52)
          objc_enumerationMutation(v49);
        v54 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * m);
        objc_msgSend(v54, "identifier");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v55, "isEqualToString:", v3);

        if (v56)
        {
          v57 = objc_msgSend(v49, "indexOfObject:", v54);
          goto LABEL_78;
        }
      }
      v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v73, v89, 16);
      if (v51)
        continue;
      break;
    }
    v57 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_78:
    v17 = v72;
    v15 = v68;
  }
  else
  {
    v57 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v16 = v71;
  if (objc_msgSend(*(id *)(a1 + 32), "triggerEvent") != 5
    && v57 != 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v17, "type") != 26)
  {
    objc_msgSend(MEMORY[0x24BEB01F0], "sharedManager");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "usedRanker");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = *(_QWORD *)(a1 + 40);
    v69 = *(_QWORD *)(v60 + 24);
    v66 = *(unsigned __int8 *)(v60 + 8);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend((id)v60, "currentQueryId"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = *(_QWORD *)(a1 + 40);
    LOBYTE(v65) = *(_BYTE *)(v62 + 9);
    objc_msgSend(v58, "extractTrainingDataWithItemAtIndex:withItems:withRanker:forQuery:dataCollectAllowed:queryID:withCEPData:forClientBundle:debugInfoEnabled:keyboardPrimaryLanguage:clientID:", v57, v49, v59, v69, v66, v61, *(_QWORD *)(v62 + 72), *MEMORY[0x24BEB04C0], v65, *(_QWORD *)(v62 + 96), *(_QWORD *)(v62 + 40));

    v16 = v71;
  }

LABEL_85:
  if (*(_QWORD *)(a1 + 48))
    v63 = (id)objc_opt_self();

}

- (void)dumpTTRDebugFiles
{
  void *v3;
  NSObject *queue;
  id v5;
  _QWORD block[5];
  id v7;

  SDFeedbackTransactionCreate(CFSTR("dumpTTRDebugFiles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_engagedTTR = 1;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__SDFeedbackInterceptor_dumpTTRDebugFiles__block_invoke;
  block[3] = &unk_24CF63C90;
  block[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_sync(queue, block);

}

void __42__SDFeedbackInterceptor_dumpTTRDebugFiles__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7), (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  +[SDTTRSupport getSharedInstance](SDTTRSupport, "getSharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dumpTTRDebugFilesForQuery:sections:enableKeyLogRanking:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v2, 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects");
  if (*(_QWORD *)(a1 + 40))
    v10 = (id)objc_opt_self();

}

- (void)didClearInput:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x24BEB02E8], "sharedInstance", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "writeRenderAndEngagementInfo");

}

- (void)didRankSections:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  SDFeedbackTransactionCreate(CFSTR("didRank"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SDFeedbackInterceptor_didRankSections___block_invoke;
  block[3] = &unk_24CF63F80;
  block[4] = self;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(queue, block);

}

void __41__SDFeedbackInterceptor_didRankSections___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "didRankSections:", *(_QWORD *)(a1 + 40));
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "sections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (!v3)
  {
LABEL_9:

    goto LABEL_30;
  }
  v4 = v3;
  v5 = *(_QWORD *)v35;
  v6 = *MEMORY[0x24BEB06B8];
LABEL_3:
  v7 = 0;
  while (1)
  {
    if (*(_QWORD *)v35 != v5)
      objc_enumerationMutation(v2);
    objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v7), "section");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", v6);

    if ((v10 & 1) != 0)
      break;

    if (v4 == ++v7)
    {
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (!v4)
        goto LABEL_9;
      goto LABEL_3;
    }
  }

  if (!v8)
  {
LABEL_30:
    if (*(_QWORD *)(a1 + 48))
      v28 = (id)objc_opt_self();
    return;
  }
  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_opt_new();
  v13 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(v8, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    goto LABEL_25;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v29 = v15;
  objc_msgSend(v15, "arrayOfRankingItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (!v17)
    goto LABEL_24;
  v18 = v17;
  v19 = *(_QWORD *)v31;
  do
  {
    for (i = 0; i != v18; ++i)
    {
      if (*(_QWORD *)v31 != v19)
        objc_enumerationMutation(v16);
      v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
      objc_msgSend(v21, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v22);

      objc_msgSend(v21, "localSuggestionsData");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(v21, "localSuggestionsData");
        v24 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v21, "serverSuggestionsData");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
          continue;
        objc_msgSend(v21, "serverSuggestionsData");
        v24 = objc_claimAutoreleasedReturnValue();
      }
      v26 = (void *)v24;
      objc_msgSend(v12, "addObject:", v24);

    }
    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  }
  while (v18);
LABEL_24:

  v15 = v29;
LABEL_25:
  if (objc_msgSend(v11, "count"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), v11);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), v12);
  }
  if (*(_QWORD *)(a1 + 48))
    v27 = (id)objc_opt_self();

}

- (void)didEngageResult:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  SDFeedbackTransactionCreate(CFSTR("didEngage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SDFeedbackInterceptor_didEngageResult___block_invoke;
  block[3] = &unk_24CF63F80;
  block[4] = self;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(queue, block);

}

id __41__SDFeedbackInterceptor_didEngageResult___block_invoke(_QWORD *a1)
{
  id result;

  objc_msgSend(*(id *)(a1[4] + 104), "didEngageResult:", a1[5]);
  result = (id)a1[6];
  if (result)
    return (id)objc_opt_self();
  return result;
}

- (void)resultsDidBecomeVisible:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  SDFeedbackTransactionCreate(CFSTR("didBecomeVisible"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SDFeedbackInterceptor_resultsDidBecomeVisible___block_invoke;
  block[3] = &unk_24CF63F80;
  block[4] = self;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(queue, block);

}

void __49__SDFeedbackInterceptor_resultsDidBecomeVisible___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "resultsDidBecomeVisible:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "results");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sectionBundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.searchd.zkw.apps"));

    if (v4)
    {
      if (*(_QWORD *)(a1 + 48))
        v5 = (id)objc_opt_self();

      goto LABEL_9;
    }
    objc_msgSend(*(id *)(a1 + 40), "results");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "_itemsFromSentSectionsWithProtectionClasses:filterWithResults:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEB02E8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resultsWithRankingItemsDidBecomeVisible:date:protectionClassMapping:", v8, 0, v7);

  }
  if (*(_QWORD *)(a1 + 48))
    v10 = (id)objc_opt_self();
LABEL_9:

}

- (void)searchViewDidAppear:(id)a3
{
  void *v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  SDFeedbackTransactionCreate(CFSTR("didAppear"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__SDFeedbackInterceptor_searchViewDidAppear___block_invoke;
  v7[3] = &unk_24CF63C90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

id __45__SDFeedbackInterceptor_searchViewDidAppear___block_invoke(uint64_t a1)
{
  id result;
  _QWORD block[5];

  if (objc_msgSend(*(id *)(a1 + 32), "testRenderEngagementCounts"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isInternalDevice"))
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __45__SDFeedbackInterceptor_searchViewDidAppear___block_invoke_2;
      block[3] = &unk_24CF63D90;
      block[4] = *(_QWORD *)(a1 + 32);
      if (kPlaceHolderInputName_block_invoke_2_onceToken != -1)
        dispatch_once(&kPlaceHolderInputName_block_invoke_2_onceToken, block);
    }
  }
  result = *(id *)(a1 + 40);
  if (result)
    return (id)objc_opt_self();
  return result;
}

void __45__SDFeedbackInterceptor_searchViewDidAppear___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BEB02E8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "testCountsMovingDaysInPast");
  objc_msgSend(v2, "testCountsMovingYearInPast");
  objc_msgSend(v2, "testCountsMovingCoupleOfYearsInPast");
  objc_msgSend(v2, "testCountsUptoOneDay");
  objc_msgSend(v2, "testCountsUptoWeek");
  objc_msgSend(v2, "testCountsUptoMonth");
  objc_msgSend(v2, "testCountsUptoQuarter");
  objc_msgSend(v2, "testCountsUptoHalfYear");
  objc_msgSend(v2, "testCountsAfterYear");
  objc_msgSend(v2, "testCountsAfterCoupleYears");
  objc_msgSend(v2, "testCountsForRegularEngagement");
  objc_msgSend(v2, "testForDummyEntry");
  if (objc_msgSend(*(id *)(a1 + 32), "stressTestCounts"))
    objc_msgSend(v2, "stressTestCounts");

}

- (void)searchViewDidDisappear:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  id v8;
  void *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v4 = a3;
  SDFeedbackTransactionCreate(CFSTR("didDisappear"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isInternalDevice && !objc_msgSend(v4, "viewDisappearEvent"))
    self->_engagedTTR = 1;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__SDFeedbackInterceptor_searchViewDidDisappear___block_invoke;
  block[3] = &unk_24CF63F80;
  block[4] = self;
  v11 = v4;
  v12 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(queue, block);
  objc_msgSend(MEMORY[0x24BEB02E8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "writeRenderAndEngagementInfo");

}

id __48__SDFeedbackInterceptor_searchViewDidDisappear___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id result;

  objc_msgSend(*(id *)(a1[4] + 104), "searchViewDidDisappear:", a1[5]);
  v2 = a1[4];
  if (*(_BYTE *)(v2 + 13))
  {
    *(_BYTE *)(v2 + 13) = 0;
  }
  else
  {
    objc_msgSend(*(id *)(v2 + 16), "removeAllObjects");
    objc_msgSend(*(id *)(a1[4] + 48), "removeAllObjects");
  }
  v3 = a1[4];
  v4 = *(void **)(v3 + 88);
  *(_QWORD *)(v3 + 88) = 0;

  v5 = a1[4];
  v6 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = 0;

  v7 = a1[4];
  v8 = *(void **)(v7 + 64);
  *(_QWORD *)(v7 + 64) = 0;

  result = (id)a1[6];
  if (result)
    return (id)objc_opt_self();
  return result;
}

- (void)cleanup
{
  void *v3;
  NSObject *queue;
  id v5;
  _QWORD v6[5];
  id v7;

  SDFeedbackTransactionCreate(CFSTR("cleanup"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __32__SDFeedbackInterceptor_cleanup__block_invoke;
  v6[3] = &unk_24CF63C90;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(queue, v6);

}

id __32__SDFeedbackInterceptor_cleanup__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 88);
  *(_QWORD *)(v2 + 88) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 80);
  *(_QWORD *)(v4 + 80) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = 0;

  result = *(id *)(a1 + 40);
  if (result)
    return (id)objc_opt_self();
  return result;
}

- (NSMutableDictionary)sentSections
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSentSections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)currentQuery
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrentQuery:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unint64_t)currentQueryId
{
  return self->_currentQueryId;
}

- (void)setCurrentQueryId:(unint64_t)a3
{
  self->_currentQueryId = a3;
}

- (NSString)currentClientId
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCurrentClientId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableOrderedSet)sectionOrder
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSectionOrder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)collectAnonymousData
{
  return self->_collectAnonymousData;
}

- (void)setCollectAnonymousData:(BOOL)a3
{
  self->_collectAnonymousData = a3;
}

- (PRSRankingItemRanker)usedRanker
{
  return self->_usedRanker;
}

- (void)setUsedRanker:(id)a3
{
  objc_storeStrong((id *)&self->_usedRanker, a3);
}

- (NSDictionary)cepData
{
  return self->_cepData;
}

- (void)setCepData:(id)a3
{
  objc_storeStrong((id *)&self->_cepData, a3);
}

- (NSArray)suggestionsData
{
  return self->_suggestionsData;
}

- (void)setSuggestionsData:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsData, a3);
}

- (NSArray)suggestionsIdentifiers
{
  return self->_suggestionsIdentifiers;
}

- (void)setSuggestionsIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsIdentifiers, a3);
}

- (BOOL)internalDebug
{
  return self->_internalDebug;
}

- (void)setInternalDebug:(BOOL)a3
{
  self->_internalDebug = a3;
}

- (NSString)keyboardPrimaryLanguage
{
  return self->_keyboardPrimaryLanguage;
}

- (void)setKeyboardPrimaryLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardPrimaryLanguage, a3);
}

- (BOOL)testRenderEngagementCounts
{
  return self->_testRenderEngagementCounts;
}

- (void)setTestRenderEngagementCounts:(BOOL)a3
{
  self->_testRenderEngagementCounts = a3;
}

- (BOOL)stressTestCounts
{
  return self->_stressTestCounts;
}

- (void)setStressTestCounts:(BOOL)a3
{
  self->_stressTestCounts = a3;
}

- (BOOL)isInternalDevice
{
  return self->_isInternalDevice;
}

- (void)setIsInternalDevice:(BOOL)a3
{
  self->_isInternalDevice = a3;
}

- (BOOL)engagedTTR
{
  return self->_engagedTTR;
}

- (void)setEngagedTTR:(BOOL)a3
{
  self->_engagedTTR = a3;
}

- (SPPersonalMetricManager)personalMetricManager
{
  return self->_personalMetricManager;
}

- (void)setPersonalMetricManager:(id)a3
{
  objc_storeStrong((id *)&self->_personalMetricManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalMetricManager, 0);
  objc_storeStrong((id *)&self->_keyboardPrimaryLanguage, 0);
  objc_storeStrong((id *)&self->_suggestionsIdentifiers, 0);
  objc_storeStrong((id *)&self->_suggestionsData, 0);
  objc_storeStrong((id *)&self->_cepData, 0);
  objc_storeStrong((id *)&self->_usedRanker, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sectionOrder, 0);
  objc_storeStrong((id *)&self->_currentClientId, 0);
  objc_storeStrong((id *)&self->_currentQuery, 0);
  objc_storeStrong((id *)&self->_sentSections, 0);
}

@end
