@implementation SPPersonalMetricManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_11);
  return (id)sharedInstance_manager;
}

void __41__SPPersonalMetricManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_manager;
  sharedInstance_manager = v0;

}

- (SPPersonalMetricManager)init
{
  SPPersonalMetricManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  PRSMapsParsecRanker *parsecRanker;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SPPersonalMetricManager;
  v2 = -[SPPersonalMetricManager init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.searchd.personalMetricManagerQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_opt_new();
    parsecRanker = v2->_parsecRanker;
    v2->_parsecRanker = (PRSMapsParsecRanker *)v6;

    -[SPPersonalMetricManager _clearState](v2, "_clearState");
  }
  return v2;
}

- (void)_updateTrialInfo
{
  void *v3;
  void *v4;
  id v5;

  SSDefaultsGetResources();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getTrialTreatmentId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPGeoPersonalizationEngagementMetric setTrialTreatmentId:](self->_metric, "setTrialTreatmentId:", v3);

  objc_msgSend(v5, "getTrialExperimentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPGeoPersonalizationEngagementMetric setTrialExperimentId:](self->_metric, "setTrialExperimentId:", v4);

}

- (void)_populateMetricWithFirstResult:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PRSMapsParsecRanker *parsecRanker;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  id v34;

  v34 = a3;
  if (objc_msgSend(v34, "containsPersonalResult")
    && (objc_msgSend(v34, "mapsPersonalizationResult"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v34, "didRerankPersonalResult"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPGeoPersonalizationEngagementMetric setFirstGeoResultWasReranked:](self->_metric, "setFirstGeoResultWasReranked:", v5);

    v6 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v34, "mapsPersonalizationResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "resultType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPGeoPersonalizationEngagementMetric setFirstGeoResultPersonalizationType:](self->_metric, "setFirstGeoResultPersonalizationType:", v8);

    objc_msgSend(v34, "mapsPersonalizationResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "entityRelevanceScore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPGeoPersonalizationEngagementMetric setFirstGeoResultEntityRelevanceScore:](self->_metric, "setFirstGeoResultEntityRelevanceScore:", v10);

    parsecRanker = self->_parsecRanker;
    if (parsecRanker)
    {
      v12 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v34, "mapsPersonalizationResult");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "numberWithBool:", -[PRSMapsParsecRanker isResultCandidateForPromotion:](parsecRanker, "isResultCandidateForPromotion:", v13));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPGeoPersonalizationEngagementMetric setFirstGeoResultIsCandidateForPromotion:](self->_metric, "setFirstGeoResultIsCandidateForPromotion:", v14);

    }
    objc_msgSend(v34, "mapsPersonalizationResult");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "numberOfVisits");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPGeoPersonalizationEngagementMetric setFirstGeoResultNumberOfVisits:](self->_metric, "setFirstGeoResultNumberOfVisits:", v16);

    objc_msgSend(v34, "mapsPersonalizationResult");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberOfVisitsGivenLocation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPGeoPersonalizationEngagementMetric setFirstGeoResultNumberOfVisitsGivenLocation:](self->_metric, "setFirstGeoResultNumberOfVisitsGivenLocation:", v18);

    objc_msgSend(v34, "mapsPersonalizationResult");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dateOfLastVisit");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v34, "mapsPersonalizationResult");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "dateOfLastVisit");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "timeIntervalSinceNow");
      objc_msgSend(v21, "numberWithDouble:", v24 / -3600.0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPGeoPersonalizationEngagementMetric setFirstGeoResultTimeSinceLastVisit:](self->_metric, "setFirstGeoResultTimeSinceLastVisit:", v25);

    }
    else
    {
      -[SPGeoPersonalizationEngagementMetric setFirstGeoResultTimeSinceLastVisit:](self->_metric, "setFirstGeoResultTimeSinceLastVisit:", 0);
    }

    objc_msgSend(v34, "mapsPersonalizationResult");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "startEventDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v29 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v34, "mapsPersonalizationResult");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "startEventDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "timeIntervalSinceNow");
      objc_msgSend(v29, "numberWithDouble:", v32 / 3600.0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPGeoPersonalizationEngagementMetric setFirstGeoResultTimeUntilUpcomingEvent:](self->_metric, "setFirstGeoResultTimeUntilUpcomingEvent:", v33);

    }
    else
    {
      -[SPGeoPersonalizationEngagementMetric setFirstGeoResultTimeUntilUpcomingEvent:](self->_metric, "setFirstGeoResultTimeUntilUpcomingEvent:", 0);
    }

  }
  else
  {
    v26 = MEMORY[0x24BDBD1C0];
    -[SPGeoPersonalizationEngagementMetric setFirstGeoResultWasReranked:](self->_metric, "setFirstGeoResultWasReranked:", MEMORY[0x24BDBD1C0]);
    -[SPGeoPersonalizationEngagementMetric setFirstGeoResultIsCandidateForPromotion:](self->_metric, "setFirstGeoResultIsCandidateForPromotion:", v26);
  }

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
  SPPersonalMetricManagerTransactionCreate(CFSTR("didRank"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SPPersonalMetricManager_didRankSections___block_invoke;
  block[3] = &unk_24CF63F80;
  block[4] = self;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(queue, block);

}

id __43__SPPersonalMetricManager_didRankSections___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  void *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  NSObject *v32;
  os_log_type_t v33;
  NSObject *v34;
  os_log_type_t v35;
  id result;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id obj;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[16];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  SPLogForSPLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v2, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213202000, v2, v3, "SPPersonalMetricManager: didRankSections", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_clearState");
  v4 = objc_opt_new();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v4;

  objc_msgSend(*(id *)(a1 + 32), "_updateTrialInfo");
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "sections");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  if (!v7)
  {
    v10 = 0;
    goto LABEL_34;
  }
  v8 = v7;
  v9 = 0;
  v10 = 0;
  v11 = *(_QWORD *)v51;
  v12 = *MEMORY[0x24BEB06F0];
  v42 = *MEMORY[0x24BEB0670];
  v37 = *MEMORY[0x24BEB06F0];
  v38 = *(_QWORD *)v51;
  do
  {
    v13 = 0;
    v39 = v8;
    do
    {
      v14 = v11;
      if (*(_QWORD *)v51 != v11)
        objc_enumerationMutation(obj);
      v43 = v13;
      objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v13), "section");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v12;
      v18 = objc_msgSend(v16, "isEqualToString:", v12);

      v19 = v15;
      objc_msgSend(v15, "bundleIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", v42);

      v44 = v21;
      if ((v21 & 1) == 0 && !v18)
      {
        v11 = v14;
        v12 = v17;
        goto LABEL_30;
      }
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v41 = v19;
      objc_msgSend(v19, "results");
      v45 = (id)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
      if (!v22)
        goto LABEL_29;
      v23 = v22;
      v24 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v47 != v24)
            objc_enumerationMutation(v45);
          v26 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(v26, "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v27, "length"))
          {
            if (v18)
            {
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", v27);
              v28 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
              if ((v44 & 1) == 0)
              {
                objc_msgSend(v28, "setGeoResultWasTopHit:", 0);
                goto LABEL_27;
              }
              objc_msgSend(v28, "setGeoResultWasTopHit:", 1);
            }
            v29 = objc_msgSend(v26, "containsPersonalResult");
            if (!v9)
              objc_msgSend(*(id *)(a1 + 32), "_populateMetricWithFirstResult:", v26);
            v10 += v29;
            v30 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setObject:forKey:", v31, v27);

            ++v9;
          }
          else
          {
            SPLogForSPLogCategoryDefault();
            v32 = objc_claimAutoreleasedReturnValue();
            v33 = 2 * (gSPLogDebugAsDefault == 0);
            if (os_log_type_enabled(v32, v33))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_213202000, v32, v33, "SPPersonalMetricManager: Ignoring ranked result with empty identifier.", buf, 2u);
            }

          }
LABEL_27:

        }
        v23 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
      }
      while (v23);
LABEL_29:

      v12 = v37;
      v11 = v38;
      v8 = v39;
      v19 = v41;
LABEL_30:

      v13 = v43 + 1;
    }
    while (v43 + 1 != v8);
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  }
  while (v8);
LABEL_34:

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setNumberOfPersonalGeoResults:", v10);
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count"))
  {
    SPLogForSPLogCategoryDefault();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v34, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213202000, v34, v35, "SPPersonalMetricManager: didRankSections: No geo results were found!", buf, 2u);
    }

  }
  result = *(id *)(a1 + 48);
  if (result)
    return (id)objc_opt_self();
  return result;
}

- (void)resultsDidBecomeVisible:(id)a3
{
  void *v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  SPPersonalMetricManagerTransactionCreate(CFSTR("didBecomeVisible"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__SPPersonalMetricManager_resultsDidBecomeVisible___block_invoke;
  block[3] = &unk_24CF63D90;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

id __51__SPPersonalMetricManager_resultsDidBecomeVisible___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  id result;
  uint8_t v5[16];

  SPLogForSPLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v2, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_213202000, v2, v3, "SPPersonalMetricManager: resultsDidBecomeVisible", v5, 2u);
  }

  result = *(id *)(a1 + 32);
  if (result)
    return (id)objc_opt_self();
  return result;
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
  SPPersonalMetricManagerTransactionCreate(CFSTR("didEngageResult"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SPPersonalMetricManager_didEngageResult___block_invoke;
  block[3] = &unk_24CF63F80;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(queue, block);

}

void __43__SPPersonalMetricManager_didEngageResult___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  void *v26;
  double v27;
  void *v28;
  NSObject *v29;
  os_log_type_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  int v42;
  uint8_t v43[16];
  uint8_t buf[16];

  SPLogForSPLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v2, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213202000, v2, v3, "SPPersonalMetricManager: didEngageResult", buf, 2u);
  }

  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v4 + 48) && objc_msgSend(*(id *)(v4 + 8), "count"))
  {
    objc_msgSend(*(id *)(a1 + 48), "result");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sectionBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEB0670]);

    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsObject:", v8));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setEngagedResultWasTopHit:", v10);

      if (v9)
        v11 = v7;
      else
        v11 = 0;
      if (v11 == 1)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setEngagedGeoResultPosition:", v9);
        if (objc_msgSend(v5, "containsPersonalResult")
          && (objc_msgSend(v5, "mapsPersonalizationResult"),
              v12 = (void *)objc_claimAutoreleasedReturnValue(),
              v12,
              v12))
        {
          objc_msgSend(v5, "mapsPersonalizationResult");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "entityRelevanceScore");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setEngagedGeoResultEntityRelevanceScore:", v14);

          objc_msgSend(v5, "mapsPersonalizationResult");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "numberOfVisits");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setEngagedGeoResultNumberOfVisits:", v16);

          objc_msgSend(v5, "mapsPersonalizationResult");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "numberOfVisitsGivenLocation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setEngagedGeoResultNumberOfVisitsGivenLocation:", v18);

          v19 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v5, "mapsPersonalizationResult");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v20, "resultType"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setEngagedGeoResultPersonalizationType:", v21);

          objc_msgSend(v5, "mapsPersonalizationResult");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "dateOfLastVisit");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            v24 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v5, "mapsPersonalizationResult");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "dateOfLastVisit");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "timeIntervalSinceNow");
            objc_msgSend(v24, "numberWithDouble:", v27 / -3600.0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setEngagedGeoResultTimeSinceLastVisit:", v28);

          }
          else
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setEngagedGeoResultTimeSinceLastVisit:", 0);
          }

          objc_msgSend(v5, "mapsPersonalizationResult");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "startEventDate");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36)
          {
            v37 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v5, "mapsPersonalizationResult");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "startEventDate");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "timeIntervalSinceNow");
            objc_msgSend(v37, "numberWithDouble:", v40 / 3600.0);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setEngagedGeoResultTimeUntilUpcomingEvent:", v41);

          }
          else
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setEngagedGeoResultTimeUntilUpcomingEvent:", 0);
          }

          v42 = objc_msgSend(v5, "didRerankPersonalResult");
          v32 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
          if (v42)
            v33 = 1;
          else
            v33 = 2;
        }
        else
        {
          v32 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
          v33 = 3;
        }
        goto LABEL_21;
      }
    }
    else
    {
      v9 = 0;
    }
    v32 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v33 = 4;
LABEL_21:
    objc_msgSend(v32, "setInteraction:", v33);
    objc_msgSend(*(id *)(a1 + 32), "_sendCAMetrics");
    objc_msgSend(*(id *)(a1 + 32), "_clearState");
    if (*(_QWORD *)(a1 + 40))
      v34 = (id)objc_opt_self();

    return;
  }
  SPLogForSPLogCategoryDefault();
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v29, v30))
  {
    *(_WORD *)v43 = 0;
    _os_log_impl(&dword_213202000, v29, v30, "SPPersonalMetricManager: Missing ranked feedback. Exiting early.", v43, 2u);
  }

  if (*(_QWORD *)(a1 + 40))
    v31 = (id)objc_opt_self();
}

- (void)searchViewDidDisappear:(id)a3
{
  void *v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  SPPersonalMetricManagerTransactionCreate(CFSTR("didDisappear"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__SPPersonalMetricManager_searchViewDidDisappear___block_invoke;
  v7[3] = &unk_24CF63C90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

id __50__SPPersonalMetricManager_searchViewDidDisappear___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  id result;
  uint8_t v8[16];
  uint8_t buf[16];

  SPLogForSPLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v2, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213202000, v2, v3, "SPPersonalMetricManager: searchViewDidDisappear", buf, 2u);
  }

  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v4 + 48) && objc_msgSend(*(id *)(v4 + 8), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setInteraction:", 5);
    objc_msgSend(*(id *)(a1 + 32), "_sendCAMetrics");
    objc_msgSend(*(id *)(a1 + 32), "_clearState");
  }
  else
  {
    SPLogForSPLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = 2 * (gSPLogDebugAsDefault == 0);
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_213202000, v5, v6, "SPPersonalMetricManager: Missing ranked feedback. Exiting early.", v8, 2u);
    }

  }
  result = *(id *)(a1 + 40);
  if (result)
    return (id)objc_opt_self();
  return result;
}

- (void)_sendCAMetrics
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  SPGeoPersonalizationEngagementMetric *metric;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  SPLogForSPLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v3, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    -[SPGeoPersonalizationEngagementMetric serializedMetric](self->_metric, "serializedMetric");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_213202000, v3, v4, "SPPersonalMetricManager: _sendCAMetrics: %@", (uint8_t *)&v8, 0xCu);

  }
  metric = self->_metric;
  if (metric)
  {
    -[SPGeoPersonalizationEngagementMetric serializedMetric](metric, "serializedMetric");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
}

- (void)_clearState
{
  SPGeoPersonalizationEngagementMetric *metric;
  NSMutableSet *v4;
  NSMutableSet *topHitIdentifiers;
  NSMutableDictionary *v6;
  NSMutableDictionary *rankedPosition;

  metric = self->_metric;
  self->_metric = 0;

  v4 = (NSMutableSet *)objc_opt_new();
  topHitIdentifiers = self->_topHitIdentifiers;
  self->_topHitIdentifiers = v4;

  v6 = (NSMutableDictionary *)objc_opt_new();
  rankedPosition = self->_rankedPosition;
  self->_rankedPosition = v6;

  self->_lastQueryId = -1;
}

- (SPGeoPersonalizationEngagementMetric)metric
{
  return (SPGeoPersonalizationEngagementMetric *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMetric:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metric, 0);
  objc_storeStrong((id *)&self->_parsecRanker, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_topHitIdentifiers, 0);
  objc_storeStrong((id *)&self->_rankedPosition, 0);
}

@end
