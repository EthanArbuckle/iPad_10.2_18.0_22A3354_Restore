@implementation REDuetKnowledgeStore

- (id)_init
{
  _QWORD *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  void (*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)REDuetKnowledgeStore;
  v2 = -[RESingleton _init](&v8, sel__init);
  if (v2)
  {
    if (!CoreDuetLibraryCore_frameworkLibrary_0)
    {
      v13 = xmmword_24CF90098;
      v14 = 0;
      CoreDuetLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    }
    if (CoreDuetLibraryCore_frameworkLibrary_0)
    {
      v9 = 0;
      v10 = &v9;
      v11 = 0x2050000000;
      v3 = (void *)get_DKKnowledgeStoreClass_softClass;
      v12 = get_DKKnowledgeStoreClass_softClass;
      if (!get_DKKnowledgeStoreClass_softClass)
      {
        *(_QWORD *)&v13 = MEMORY[0x24BDAC760];
        *((_QWORD *)&v13 + 1) = 3221225472;
        v14 = __get_DKKnowledgeStoreClass_block_invoke;
        v15 = &unk_24CF8AC38;
        v16 = &v9;
        __get_DKKnowledgeStoreClass_block_invoke((uint64_t)&v13);
        v3 = (void *)v10[3];
      }
      v4 = objc_retainAutorelease(v3);
      _Block_object_dispose(&v9, 8);
      objc_msgSend(v4, "knowledgeStoreWithDirectReadOnlyAccess");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v2[1];
      v2[1] = v5;

    }
  }
  return v2;
}

- (id)queryForTopNApplications:(int64_t)a3 withLikelihoodGreaterThan:(double)a4 withTemporalResolution:(int)a5
{
  uint64_t v5;
  void *v9;
  id DKQueryClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id DKPredictionQueryClass;
  void *v26;
  void *v27;
  REDuetQuery *v28;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[3];
  __int128 v36;
  Class (*v37)(uint64_t);
  void *v38;
  uint64_t *v39;
  uint64_t v40;

  v5 = *(_QWORD *)&a5;
  v40 = *MEMORY[0x24BDAC8D0];
  if (!CoreDuetLibraryCore_frameworkLibrary_0)
  {
    v36 = xmmword_24CF90098;
    v37 = 0;
    CoreDuetLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (CoreDuetLibraryCore_frameworkLibrary_0)
  {
    objc_msgSend(get_DKEventQueryClass(), "predicateForEventsOfMinimumDuration:", 5.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    DKQueryClass = get_DKQueryClass();
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(DKQueryClass, "predicateForEventsWithStartInDateRangeFrom:to:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x24BDD14C0];
    v15 = get_DKQueryClass();
    v31 = 0;
    v32 = &v31;
    v33 = 0x2050000000;
    v16 = (void *)get_DKApplicationMetadataKeyClass_softClass;
    v34 = get_DKApplicationMetadataKeyClass_softClass;
    v17 = MEMORY[0x24BDAC760];
    if (!get_DKApplicationMetadataKeyClass_softClass)
    {
      *(_QWORD *)&v36 = MEMORY[0x24BDAC760];
      *((_QWORD *)&v36 + 1) = 3221225472;
      v37 = __get_DKApplicationMetadataKeyClass_block_invoke;
      v38 = &unk_24CF8AC38;
      v39 = &v31;
      __get_DKApplicationMetadataKeyClass_block_invoke((uint64_t)&v36);
      v16 = (void *)v32[3];
    }
    v18 = objc_retainAutorelease(v16);
    _Block_object_dispose(&v31, 8);
    objc_msgSend(v18, "extensionHostIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "predicateForObjectsWithMetadataKey:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "notPredicateWithSubpredicate:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x24BDD14C0];
    v35[0] = v9;
    v35[1] = v13;
    v35[2] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "andPredicateWithSubpredicates:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    DKPredictionQueryClass = get_DKPredictionQueryClass();
    objc_msgSend(get_DKSystemEventStreamsClass_0(), "appInFocusStream");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(DKPredictionQueryClass, "topNPredictionQueryForStream:withPredicate:withTopN:withMinLikelihood:", v26, v24, a3, a4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "setReadMetadata:", 1);
    objc_msgSend(v27, "setSlotDuration:", v5);
    v28 = objc_alloc_init(REDuetQuery);
    -[REDuetQuery setQuery:](v28, "setQuery:", v27);
    v30[0] = v17;
    v30[1] = 3221225472;
    v30[2] = __98__REDuetKnowledgeStore_queryForTopNApplications_withLikelihoodGreaterThan_withTemporalResolution___block_invoke;
    v30[3] = &unk_24CF8FFA0;
    v30[4] = self;
    -[REDuetQuery setTransformBlock:](v28, "setTransformBlock:", v30);

  }
  else
  {
    v28 = 0;
  }
  return v28;
}

RETimeline *__98__REDuetKnowledgeStore_queryForTopNApplications_withLikelihoodGreaterThan_withTemporalResolution___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  RETimeline *v6;
  RETimeline *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v4 = (void *)get_DKPredictionTimelineClass_softClass;
  v13 = get_DKPredictionTimelineClass_softClass;
  if (!get_DKPredictionTimelineClass_softClass)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __get_DKPredictionTimelineClass_block_invoke;
    v9[3] = &unk_24CF8AC38;
    v9[4] = &v10;
    __get_DKPredictionTimelineClass_block_invoke((uint64_t)v9);
    v4 = (void *)v11[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v10, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_createTimelineFromPredictionTimeline:filterEmptyData:", v3, 1);
    v6 = (RETimeline *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_alloc_init(RETimeline);
  }
  v7 = v6;

  return v7;
}

- (id)_createTimelineFromPredictionTimeline:(id)a3 filterEmptyData:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  RETimeline *v19;
  void *v20;
  RETimeline *v21;
  id obj;
  void *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  uint64_t v32;
  id *v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v4 = a4;
  v39 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  objc_msgSend(v26, "startDate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = (id *)&v32;
  v34 = 0x3042000000;
  v35 = __Block_byref_object_copy__27;
  v36 = __Block_byref_object_dispose__27;
  v37 = 0;
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __78__REDuetKnowledgeStore__createTimelineFromPredictionTimeline_filterEmptyData___block_invoke;
  v31[3] = &unk_24CF8FFF0;
  v31[4] = &v32;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199B2434](v31);
  objc_storeWeak(v33 + 5, v6);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v26, "transitionDates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v28;
    obj = v7;
    do
    {
      v10 = 0;
      v11 = v5;
      do
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v10);
        objc_msgSend(v12, "timeIntervalSinceDate:", v11);
        v14 = v13;
        objc_msgSend(v11, "dateByAddingTimeInterval:", v13 * 0.5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "valueAtDate:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
        {
          ((void (**)(_QWORD, void *))v6)[2](v6, v16);
          v17 = objc_claimAutoreleasedReturnValue();

          v16 = (void *)v17;
        }
        if (v16)
        {
          objc_msgSend(v25, "addObject:", v16);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v18);

        }
        v5 = v12;

        ++v10;
        v11 = v5;
      }
      while (v8 != v10);
      v7 = obj;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
    }
    while (v8);
  }

  v19 = [RETimeline alloc];
  objc_msgSend(v26, "startDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[RETimeline initWithStartDate:values:durations:](v19, "initWithStartDate:values:durations:", v20, v25, v24);

  _Block_object_dispose(&v32, 8);
  objc_destroyWeak(&v37);

  return v21;
}

id __78__REDuetKnowledgeStore__createTimelineFromPredictionTimeline_filterEmptyData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  uint64_t v15;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x24BDAC760];
      v11 = 3221225472;
      v12 = __78__REDuetKnowledgeStore__createTimelineFromPredictionTimeline_filterEmptyData___block_invoke_2;
      v13 = &unk_24CF8FFC8;
      v7 = *(_QWORD *)(a1 + 32);
      v14 = v6;
      v15 = v7;
      v8 = v6;
      objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &v10);
      v5 = (id)objc_msgSend(v8, "copy", v10, v11, v12, v13);

      goto LABEL_7;
    }
LABEL_6:
    v5 = v3;
    goto LABEL_7;
  }
  objc_msgSend(v3, "doubleValue");
  if (fabs(v4) >= 0.00000011920929)
    goto LABEL_6;
  v5 = 0;
LABEL_7:

  return v5;
}

void __78__REDuetKnowledgeStore__createTimelineFromPredictionTimeline_filterEmptyData___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  void (**WeakRetained)(id, id);
  void *v8;
  id v9;

  v9 = a2;
  v5 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v6 = a3;
  WeakRetained = (void (**)(id, id))objc_loadWeakRetained(v5);
  WeakRetained[2](WeakRetained, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v9);

}

- (id)sleepInterval
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  Class (*v20)(uint64_t);
  void *v21;
  uint64_t *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (!CoreDuetLibraryCore_frameworkLibrary_0)
  {
    v19 = xmmword_24CF90098;
    v20 = 0;
    CoreDuetLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (CoreDuetLibraryCore_frameworkLibrary_0)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2050000000;
    v3 = (void *)get_DKPredictorClass_softClass;
    v18 = get_DKPredictorClass_softClass;
    if (!get_DKPredictorClass_softClass)
    {
      *(_QWORD *)&v19 = MEMORY[0x24BDAC760];
      *((_QWORD *)&v19 + 1) = 3221225472;
      v20 = __get_DKPredictorClass_block_invoke;
      v21 = &unk_24CF8AC38;
      v22 = &v15;
      __get_DKPredictorClass_block_invoke((uint64_t)&v19);
      v3 = (void *)v16[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v15, 8);
    objc_msgSend(v4, "predictorWithKnowledgeStore:", self->_knowledgeStore, v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "expectedInBedPeriod");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6
      || (objc_msgSend(v6, "startDate"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = v8 == 0,
          v8,
          v9))
    {
      v13 = 0;
    }
    else
    {
      v10 = objc_alloc(MEMORY[0x24BDD1508]);
      objc_msgSend(v7, "startDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "endDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v10, "initWithStartDate:endDate:", v11, v12);

    }
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)queryForPredictedChargingEventsWithMinimumDuration:(double)a3
{
  void *v5;
  void *v6;
  id DKQueryClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id DKPredictionQueryClass;
  void *v15;
  void *v16;
  REDuetQuery *v17;
  _QWORD v19[5];
  _QWORD v20[3];
  __int128 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (!CoreDuetLibraryCore_frameworkLibrary_0)
  {
    v21 = xmmword_24CF90098;
    v22 = 0;
    CoreDuetLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (CoreDuetLibraryCore_frameworkLibrary_0)
  {
    objc_msgSend(get_DKQueryClass(), "predicateForEventsWithIntegerValue:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(get_DKEventQueryClass(), "predicateForEventsOfMinimumDuration:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    DKQueryClass = get_DKQueryClass();
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(DKQueryClass, "predicateForEventsWithStartInDateRangeFrom:to:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x24BDD14C0];
    v20[0] = v5;
    v20[1] = v6;
    v20[2] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "andPredicateWithSubpredicates:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    DKPredictionQueryClass = get_DKPredictionQueryClass();
    -[REDuetKnowledgeStore _duetChargingEventStream](self, "_duetChargingEventStream");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(DKPredictionQueryClass, "predictionQueryForStream:withPredicate:withPredictionType:", v15, v13, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc_init(REDuetQuery);
    -[REDuetQuery setQuery:](v17, "setQuery:", v16);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __75__REDuetKnowledgeStore_queryForPredictedChargingEventsWithMinimumDuration___block_invoke;
    v19[3] = &unk_24CF8FFA0;
    v19[4] = self;
    -[REDuetQuery setTransformBlock:](v17, "setTransformBlock:", v19);

  }
  else
  {
    v17 = 0;
  }
  return v17;
}

uint64_t __75__REDuetKnowledgeStore_queryForPredictedChargingEventsWithMinimumDuration___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createEventsFromDuetEvents:", a2);
}

- (id)queryForHistoricChargingEventsWithMinimumDuration:(double)a3 inThePastDays:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id DKEventQueryClass;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  REDuetQuery *v19;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  void *v25;
  void *v26;
  _QWORD v27[3];
  __int128 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (!CoreDuetLibraryCore_frameworkLibrary_0)
  {
    v28 = xmmword_24CF90098;
    v29 = 0;
    CoreDuetLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (CoreDuetLibraryCore_frameworkLibrary_0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", 16, -(uint64_t)a4, v7, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(get_DKQueryClass(), "predicateForEventsWithIntegerValue:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(get_DKEventQueryClass(), "predicateForEventsOfMinimumDuration:", a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(get_DKQueryClass(), "predicateForEventsWithStartInDateRangeFrom:to:", v23, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDD14C0];
    v27[0] = v22;
    v27[1] = v21;
    v27[2] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    DKEventQueryClass = get_DKEventQueryClass();
    -[REDuetKnowledgeStore _duetChargingEventStream](self, "_duetChargingEventStream");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(DKEventQueryClass, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v12, v16, 0, 1000, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setDeduplicateValues:", 1);
    v19 = objc_alloc_init(REDuetQuery);
    -[REDuetQuery setQuery:](v19, "setQuery:", v18);
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __88__REDuetKnowledgeStore_queryForHistoricChargingEventsWithMinimumDuration_inThePastDays___block_invoke;
    v24[3] = &unk_24CF8FFA0;
    v24[4] = self;
    -[REDuetQuery setTransformBlock:](v19, "setTransformBlock:", v24);

  }
  else
  {
    v19 = 0;
  }
  return v19;
}

uint64_t __88__REDuetKnowledgeStore_queryForHistoricChargingEventsWithMinimumDuration_inThePastDays___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createEventsFromDuetEvents:", a2);
}

- (id)_duetChargingEventStream
{
  return (id)objc_msgSend(get_DKSystemEventStreamsClass_0(), "deviceIsPluggedInStream");
}

- (id)_createEventsFromDuetEvents:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  Class (*v35)(uint64_t);
  void *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v30;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v7);
        v9 = objc_alloc(MEMORY[0x24BDD1508]);
        objc_msgSend(v8, "startDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "endDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v9, "initWithStartDate:endDate:", v10, v11);

        objc_msgSend(v8, "confidence");
        v14 = v13;
        +[REFeatureValue featureValueWithBool:](REFeatureValue, "featureValueWithBool:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0;
        v39 = &v38;
        v40 = 0x2050000000;
        v16 = (void *)get_DKIdentifierClass_softClass;
        v41 = get_DKIdentifierClass_softClass;
        if (!get_DKIdentifierClass_softClass)
        {
          v33 = MEMORY[0x24BDAC760];
          v34 = 3221225472;
          v35 = __get_DKIdentifierClass_block_invoke;
          v36 = &unk_24CF8AC38;
          v37 = &v38;
          __get_DKIdentifierClass_block_invoke((uint64_t)&v33);
          v16 = (void *)v39[3];
        }
        v17 = objc_retainAutorelease(v16);
        _Block_object_dispose(&v38, 8);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "stringValue");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          +[REFeatureValue featureValueWithString:](REFeatureValue, "featureValueWithString:", v18);
          v19 = objc_claimAutoreleasedReturnValue();

          v15 = (void *)v19;
          goto LABEL_19;
        }
        v38 = 0;
        v39 = &v38;
        v40 = 0x2050000000;
        v20 = (void *)get_DKCategoryClass_softClass;
        v41 = get_DKCategoryClass_softClass;
        if (!get_DKCategoryClass_softClass)
        {
          v33 = MEMORY[0x24BDAC760];
          v34 = 3221225472;
          v35 = __get_DKCategoryClass_block_invoke;
          v36 = &unk_24CF8AC38;
          v37 = &v38;
          __get_DKCategoryClass_block_invoke((uint64_t)&v33);
          v20 = (void *)v39[3];
        }
        v21 = objc_retainAutorelease(v20);
        _Block_object_dispose(&v38, 8);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[REFeatureValue featureValueWithInt64:](REFeatureValue, "featureValueWithInt64:", objc_msgSend(v8, "integerValue"));
          v22 = objc_claimAutoreleasedReturnValue();
          goto LABEL_18;
        }
        v38 = 0;
        v39 = &v38;
        v40 = 0x2050000000;
        v23 = (void *)get_DKQuantityClass_softClass;
        v41 = get_DKQuantityClass_softClass;
        if (!get_DKQuantityClass_softClass)
        {
          v33 = MEMORY[0x24BDAC760];
          v34 = 3221225472;
          v35 = __get_DKQuantityClass_block_invoke;
          v36 = &unk_24CF8AC38;
          v37 = &v38;
          __get_DKQuantityClass_block_invoke((uint64_t)&v33);
          v23 = (void *)v39[3];
        }
        v24 = objc_retainAutorelease(v23);
        _Block_object_dispose(&v38, 8);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "doubleValue");
          +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:");
          v22 = objc_claimAutoreleasedReturnValue();
LABEL_18:
          v18 = v15;
          v15 = (void *)v22;
LABEL_19:

        }
        +[REDuetEvent eventWithInterval:value:confidence:](REDuetEvent, "eventWithInterval:value:confidence:", v12, v15, v14);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v25);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    }
    while (v5);
  }

  v26 = (void *)objc_msgSend(v4, "copy");
  return v26;
}

- (id)queryForAllDonatedActions
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[REDuetKnowledgeStore queryForDonatedActionsAfterDate:](self, "queryForDonatedActionsAfterDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)queryForAllDonatedActionsWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id DKEventQueryClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  REDuetQuery *v21;
  void *v23;
  _QWORD v25[5];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(get_DKSystemEventStreamsClass_0(), "appRelevantShortcutsStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_DKSystemEventStreamsClass_0(), "appIntentsStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v5;
  objc_msgSend(get_DKSystemEventStreamsClass_0(), "appActivityStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v6;
  v28[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD14C0];
  DKEventQueryClass = get_DKEventQueryClass();
  objc_msgSend(v4, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(DKEventQueryClass, "predicateForEventsWithStreamName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v10;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("valueString == %@"), v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("source.bundleID == %@"), v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDD14C0];
  v26[0] = v14;
  v26[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "orPredicateWithSubpredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v23, "copy");
  -[REDuetKnowledgeStore _duetQueryForDonatedActionsAfterDate:onStreams:withPredicate:](self, "_duetQueryForDonatedActionsAfterDate:onStreams:withPredicate:", v18, v19, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_alloc_init(REDuetQuery);
  -[REDuetQuery setQuery:](v21, "setQuery:", v20);
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __64__REDuetKnowledgeStore_queryForAllDonatedActionsWithIdentifier___block_invoke;
  v25[3] = &unk_24CF8FFA0;
  v25[4] = self;
  -[REDuetQuery setTransformBlock:](v21, "setTransformBlock:", v25);

  return v21;
}

uint64_t __64__REDuetKnowledgeStore_queryForAllDonatedActionsWithIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createActionsFromDuetEvents:", a2);
}

- (id)queryForDonatedActionsAfterDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[REDuetKnowledgeStore _duetDonationsStreams](self, "_duetDonationsStreams");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REDuetKnowledgeStore _queryForDonatedActionsAfterDate:streams:](self, "_queryForDonatedActionsAfterDate:streams:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_queryForDonatedActionsAfterDate:(id)a3 streams:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id DKEventQueryClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  REDuetQuery *v17;
  _QWORD v19[5];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(get_DKSystemEventStreamsClass_0(), "appRelevantShortcutsStream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  DKEventQueryClass = get_DKEventQueryClass();
  objc_msgSend(v8, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(DKEventQueryClass, "predicateForEventsWithStreamName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("NOT source.bundleID IN {'com.apple.MobileSMS', 'com.apple.InCallService', 'com.apple.mobilesafari', 'com.apple.weather', 'com.apple.mobilephone', 'com.apple.news', 'com.apple.Maps'}"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD14C0];
  v20[0] = v11;
  v20[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "orPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[REDuetKnowledgeStore _duetQueryForDonatedActionsAfterDate:onStreams:withPredicate:](self, "_duetQueryForDonatedActionsAfterDate:onStreams:withPredicate:", v7, v6, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc_init(REDuetQuery);
  -[REDuetQuery setQuery:](v17, "setQuery:", v16);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __65__REDuetKnowledgeStore__queryForDonatedActionsAfterDate_streams___block_invoke;
  v19[3] = &unk_24CF8FFA0;
  v19[4] = self;
  -[REDuetQuery setTransformBlock:](v17, "setTransformBlock:", v19);

  return v17;
}

uint64_t __65__REDuetKnowledgeStore__queryForDonatedActionsAfterDate_streams___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createActionsFromDuetEvents:", a2);
}

- (id)queryForAllRelevantShortcuts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  REDuetQuery *v7;
  _QWORD v9[5];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_DKSystemEventStreamsClass_0(), "appRelevantShortcutsStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REDuetKnowledgeStore _duetQueryForDonatedActionsAfterDate:onStreams:withPredicate:](self, "_duetQueryForDonatedActionsAfterDate:onStreams:withPredicate:", v3, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(REDuetQuery);
  -[REDuetQuery setQuery:](v7, "setQuery:", v6);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__REDuetKnowledgeStore_queryForAllRelevantShortcuts__block_invoke;
  v9[3] = &unk_24CF8FFA0;
  v9[4] = self;
  -[REDuetQuery setTransformBlock:](v7, "setTransformBlock:", v9);

  return v7;
}

uint64_t __52__REDuetKnowledgeStore_queryForAllRelevantShortcuts__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createActionsFromDuetEvents:", a2);
}

- (id)queryForDeletedActionsAfterDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id DKQueryClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  REDuetQuery *v20;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[REDuetKnowledgeStore _duetDonationsStreams](self, "_duetDonationsStreams");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v10);
        DKQueryClass = get_DKQueryClass();
        objc_msgSend(get_DKTombstoneMetadataKeyClass(), "eventStreamName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(DKQueryClass, "predicateForObjectsWithMetadataKey:andStringValue:", v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v15);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x24BDD14C0], "orPredicateWithSubpredicates:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_DKSystemEventStreamsClass_0(), "tombstoneStream");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[REDuetKnowledgeStore _duetQueryForDonatedActionsAfterDate:onStreams:withPredicate:](self, "_duetQueryForDonatedActionsAfterDate:onStreams:withPredicate:", v4, v18, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_alloc_init(REDuetQuery);
  -[REDuetQuery setQuery:](v20, "setQuery:", v19);
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __56__REDuetKnowledgeStore_queryForDeletedActionsAfterDate___block_invoke;
  v22[3] = &unk_24CF8FFA0;
  v22[4] = self;
  -[REDuetQuery setTransformBlock:](v20, "setTransformBlock:", v22);

  return v20;
}

uint64_t __56__REDuetKnowledgeStore_queryForDeletedActionsAfterDate___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createTombstonesFromDuetEvents:", a2);
}

- (id)_duetDonationsStreams
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(get_DKSystemEventStreamsClass_0(), "appIntentsStream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_DKSystemEventStreamsClass_0(), "appActivityStream", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(get_DKSystemEventStreamsClass_0(), "appRelevantShortcutsStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_duetQueryForDonatedActionsAfterDate:(id)a3 onStreams:(id)a4 withPredicate:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id DKEventQueryClass;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[2];
  void *v37;
  _QWORD v38[2];
  __int128 v39;
  Class (*v40)(uint64_t);
  void *v41;
  uint64_t *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!CoreDuetLibraryCore_frameworkLibrary_0)
  {
    v39 = xmmword_24CF90098;
    v40 = 0;
    CoreDuetLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (CoreDuetLibraryCore_frameworkLibrary_0)
  {
    if (v7)
    {
      v31 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v31 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("((localCreationDate > %@) AND (localCreationDate <= %@))"), v31, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v9)
    {
      v14 = (void *)MEMORY[0x24BDD14C0];
      v38[0] = v12;
      v38[1] = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "andPredicateWithSubpredicates:", v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v16;
    }
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("localCreationDate"), 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    DKEventQueryClass = get_DKEventQueryClass();
    v37 = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(DKEventQueryClass, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v13, v8, 0, 10, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "setDeduplicateValues:", 0);
    if (REProcessIsRelevanced())
    {
      v32 = 0;
      v33 = &v32;
      v34 = 0x2050000000;
      v21 = (void *)get_DKIntentMetadataKeyClass_softClass;
      v35 = get_DKIntentMetadataKeyClass_softClass;
      if (!get_DKIntentMetadataKeyClass_softClass)
      {
        *(_QWORD *)&v39 = MEMORY[0x24BDAC760];
        *((_QWORD *)&v39 + 1) = 3221225472;
        v40 = __get_DKIntentMetadataKeyClass_block_invoke;
        v41 = &unk_24CF8AC38;
        v42 = &v32;
        __get_DKIntentMetadataKeyClass_block_invoke((uint64_t)&v39);
        v21 = (void *)v33[3];
      }
      v22 = objc_retainAutorelease(v21);
      _Block_object_dispose(&v32, 8);
      objc_msgSend(v22, "serializedKeyImage");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v23;
      v32 = 0;
      v33 = &v32;
      v34 = 0x2050000000;
      v24 = (void *)get_DKRelevantShortcutMetadataKeyClass_softClass;
      v35 = get_DKRelevantShortcutMetadataKeyClass_softClass;
      if (!get_DKRelevantShortcutMetadataKeyClass_softClass)
      {
        *(_QWORD *)&v39 = MEMORY[0x24BDAC760];
        *((_QWORD *)&v39 + 1) = 3221225472;
        v40 = __get_DKRelevantShortcutMetadataKeyClass_block_invoke;
        v41 = &unk_24CF8AC38;
        v42 = &v32;
        __get_DKRelevantShortcutMetadataKeyClass_block_invoke((uint64_t)&v39);
        v24 = (void *)v33[3];
      }
      v25 = objc_retainAutorelease(v24);
      _Block_object_dispose(&v32, 8);
      objc_msgSend(v25, "serializedKeyImage");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v36[1] = v26;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setExcludedMetadataKeys:", v27);

    }
    v10 = v20;
    if (v10)
    {
      get_DKEventQueryClass();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = v10;
        objc_msgSend(get_DKEventQueryClass(), "allDevices");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setDeviceIDs:", v29);

      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_createActionsFromDuetEvents:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  REDonatedAction *v12;
  REDonatedAction *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x2199B223C](v6);
        v12 = [REDonatedAction alloc];
        v13 = -[REDonatedAction initWithEvent:filtered:](v12, "initWithEvent:filtered:", v10, 1, (_QWORD)v15);
        if (v13)
          objc_msgSend(v4, "addObject:", v13);
        objc_msgSend(MEMORY[0x24BDDA040], "_resetCache");

        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v7 = v6;
    }
    while (v6);
  }

  return v4;
}

- (id)_createTombstonesFromDuetEvents:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  void *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[3];
  _QWORD v28[3];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x2199B223C]();
        objc_msgSend(v9, "value");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "metadata");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(get_DKTombstoneMetadataKeyClass(), "eventStreamName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "localCreationDate");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v12)
          v18 = v15 == 0;
        else
          v18 = 1;
        if (!v18 && v16 != 0)
        {
          v27[0] = CFSTR("uuid");
          v27[1] = CFSTR("streamName");
          v28[0] = v12;
          v28[1] = v15;
          v27[2] = CFSTR("localSaveDate");
          v28[2] = v16;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v20);

        }
        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v6);
  }

  return v22;
}

- (void)executeQuery:(id)a3 responseQueue:(id)a4 completion:(id)a5
{
  -[REDuetKnowledgeStore _executeQuery:responseQueue:synchronouslyWithBatching:completion:](self, "_executeQuery:responseQueue:synchronouslyWithBatching:completion:", a3, a4, 0, a5);
}

- (void)executeQuerySynchronouslyWithBatching:(id)a3 completion:(id)a4
{
  -[REDuetKnowledgeStore _executeQuery:responseQueue:synchronouslyWithBatching:completion:](self, "_executeQuery:responseQueue:synchronouslyWithBatching:completion:", a3, 0, 1, a4);
}

- (void)_executeQuery:(id)a3 responseQueue:(id)a4 synchronouslyWithBatching:(BOOL)a5 completion:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  id *v15;
  id v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  id v18;
  uint64_t v19;
  void *v20;
  _DKKnowledgeQuerying *knowledgeStore;
  void *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD block[4];
  id v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (!CoreDuetLibraryCore_frameworkLibrary_0)
  {
    v33 = xmmword_24CF90098;
    v34 = 0;
    CoreDuetLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (v12 && CoreDuetLibraryCore_frameworkLibrary_0)
  {
    if (!v11)
    {
      v11 = MEMORY[0x24BDAC9B8];
      v13 = MEMORY[0x24BDAC9B8];
    }
    objc_msgSend(v10, "query");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __89__REDuetKnowledgeStore__executeQuery_responseQueue_synchronouslyWithBatching_completion___block_invoke_2;
      v28[3] = &unk_24CF90018;
      v15 = &v29;
      v16 = v10;
      v29 = v16;
      v30 = v12;
      v17 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199B2434](v28);
      if (a5)
      {
        v25 = v11;
        v26 = v10;
        v18 = v16;
        v19 = 10;
        do
        {
          v20 = (void *)MEMORY[0x2199B223C]();
          knowledgeStore = self->_knowledgeStore;
          v27 = 0;
          -[_DKKnowledgeQuerying executeQuery:error:](knowledgeStore, "executeQuery:error:", v14, &v27);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v27;
          v24 = objc_msgSend(v22, "count");
          ((void (**)(_QWORD, void *, id))v17)[2](v17, v22, v23);
          objc_msgSend(v18, "setOffset:", v19);

          objc_autoreleasePoolPop(v20);
          if (v23)
            break;
          v19 += 10;
        }
        while (v24 == 10);

        v11 = v25;
        v10 = v26;
        v15 = &v29;
      }
      else
      {
        -[_DKKnowledgeQuerying executeQuery:responseQueue:withCompletion:](self->_knowledgeStore, "executeQuery:responseQueue:withCompletion:", v14, v11, v17);
      }

    }
    else
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __89__REDuetKnowledgeStore__executeQuery_responseQueue_synchronouslyWithBatching_completion___block_invoke;
      block[3] = &unk_24CF8B1B0;
      v15 = &v32;
      v32 = v12;
      dispatch_async(v11, block);
    }

  }
}

void __89__REDuetKnowledgeStore__executeQuery_responseQueue_synchronouslyWithBatching_completion___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x2199B223C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void __89__REDuetKnowledgeStore__executeQuery_responseQueue_synchronouslyWithBatching_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x2199B223C]();
  if (v6)
  {
    RELogForDomain(14);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __89__REDuetKnowledgeStore__executeQuery_responseQueue_synchronouslyWithBatching_completion___block_invoke_2_cold_2((uint64_t)v6, v8);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "transformBlock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "transformBlock");
      v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v11)[2](v11, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    RELogForDomain(14);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __89__REDuetKnowledgeStore__executeQuery_responseQueue_synchronouslyWithBatching_completion___block_invoke_2_cold_1(v8);
  }

  v9 = 0;
LABEL_7:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  objc_autoreleasePoolPop(v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

- (id)queryForDuetEventWithIdentifier:(id)a3
{
  id v4;
  id DKQueryClass;
  void *v6;
  void *v7;
  void *v8;
  id DKEventQueryClass;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!CoreDuetLibraryCore_frameworkLibrary_0)
  {
    v19 = xmmword_24CF90098;
    v20 = 0;
    CoreDuetLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (CoreDuetLibraryCore_frameworkLibrary_0)
  {
    DKQueryClass = get_DKQueryClass();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v4);
    objc_msgSend(DKQueryClass, "predicateForObjectWithUUID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    DKEventQueryClass = get_DKEventQueryClass();
    -[REDuetKnowledgeStore _duetDonationsStreams](self, "_duetDonationsStreams");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(DKEventQueryClass, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v7, v10, 0, 1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setReadMetadata:", 1);
    v13 = v12;
    if (v13)
    {
      get_DKEventQueryClass();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v13;
        objc_msgSend(get_DKEventQueryClass(), "allDevices");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setDeviceIDs:", v15);

      }
    }

    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "setQuery:", v13);
    objc_msgSend(v16, "setTransformBlock:", &__block_literal_global_65);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

id __72__REDuetKnowledgeStore_PrivateQueries__queryForDuetEventWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)queryForUnfilteredUserActivityDonations
{
  void *v3;
  void *v4;

  objc_msgSend(get_DKSystemEventStreamsClass_0(), "appActivityStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[REDuetKnowledgeStore _queryForUnfilteredDonationsForStream:](self, "_queryForUnfilteredDonationsForStream:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)queryForUnfilteredIntentDonations
{
  void *v3;
  void *v4;

  objc_msgSend(get_DKSystemEventStreamsClass_0(), "appIntentsStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[REDuetKnowledgeStore _queryForUnfilteredDonationsForStream:](self, "_queryForUnfilteredDonationsForStream:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)queryForUnfilteredRelevantShortcutDonations
{
  void *v3;
  void *v4;

  objc_msgSend(get_DKSystemEventStreamsClass_0(), "appRelevantShortcutsStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[REDuetKnowledgeStore _queryForUnfilteredDonationsForStream:](self, "_queryForUnfilteredDonationsForStream:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_queryForUnfilteredDonationsForStream:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  objc_msgSend(v4, "distantPast");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REDuetKnowledgeStore _queryForDonatedActionsAfterDate:streams:](self, "_queryForDonatedActionsAfterDate:streams:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("localCreationDate"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "query");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setSortDescriptors:", v11);
  objc_msgSend(v8, "setTransformBlock:", &__block_literal_global_95_0);

  return v8;
}

id __78__REDuetKnowledgeStore_PrivateQueries___queryForUnfilteredDonationsForStream___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  REDonatedAction *v11;
  REDonatedAction *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x2199B223C](v5);
        v11 = [REDonatedAction alloc];
        v12 = -[REDonatedAction initWithEvent:filtered:](v11, "initWithEvent:filtered:", v9, 0, (_QWORD)v14);
        if (v12)
          objc_msgSend(v3, "addObject:", v12);

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v6 = v5;
    }
    while (v5);
  }

  return v3;
}

void __89__REDuetKnowledgeStore__executeQuery_responseQueue_synchronouslyWithBatching_completion___block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2132F7000, log, OS_LOG_TYPE_ERROR, "Empty transform block!", v1, 2u);
}

void __89__REDuetKnowledgeStore__executeQuery_responseQueue_synchronouslyWithBatching_completion___block_invoke_2_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2132F7000, a2, OS_LOG_TYPE_ERROR, "Error executing query: %@", (uint8_t *)&v2, 0xCu);
}

@end
