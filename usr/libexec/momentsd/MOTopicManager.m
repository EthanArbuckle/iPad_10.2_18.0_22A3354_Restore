@implementation MOTopicManager

- (MOTopicManager)initWithUniverse:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  MOTopicManager *v11;

  v4 = a3;
  v5 = objc_alloc_init((Class)PPTopicStore);
  v7 = (objc_class *)objc_opt_class(MOEventStore, v6);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v9));

  v11 = -[MOTopicManager initWithTopicStore:momentStore:](self, "initWithTopicStore:momentStore:", v5, v10);
  return v11;
}

- (MOTopicManager)initWithTopicStore:(id)a3 momentStore:(id)a4
{
  id v8;
  id v9;
  MOTopicManager *v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  MOTopicManager *v15;
  id os_log;
  NSObject *v17;
  void *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MOTopicManager initWithTopicStore:momentStore:].cold.1(v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOTopicManager.m"), 55, CFSTR("Invalid parameter not satisfying: momentStore"));

    goto LABEL_9;
  }
  if (!v8)
  {
LABEL_9:
    v15 = 0;
    goto LABEL_10;
  }
  v20.receiver = self;
  v20.super_class = (Class)MOTopicManager;
  v10 = -[MOTopicManager init](&v20, "init");
  if (v10)
  {
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create("MOTopicManager", v12);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v10->_topicStore, a3);
    objc_storeStrong((id *)&v10->_momentStore, a4);
  }
  self = v10;
  v15 = self;
LABEL_10:

  return v15;
}

+ (id)startOfDayBefore:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v5 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeInterval:sinceDate:", v3, -86400.0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startOfDayForDate:", v5));
  return v6;
}

+ (id)endOfDayBefore:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = objc_alloc((Class)NSDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startOfDayForDate:", v3));

  v7 = objc_msgSend(v4, "initWithTimeInterval:sinceDate:", v6, -1.0);
  return v7;
}

- (id)createEventFromTopicQuery:(id)a3
{
  id v3;
  MOEvent *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MOEvent *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = [MOEvent alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fromDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "toDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v9 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v4, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v5, v6, v7, v8, 3, 7);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "toDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateByAddingTimeInterval:", 2419200.0));
  -[MOEvent setExpirationDate:](v9, "setExpirationDate:", v11);

  return v9;
}

- (void)fetchAndSaveScoredTopicsBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  MOTopicManager *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[MOTopicManager queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __75__MOTopicManager_fetchAndSaveScoredTopicsBetweenStartDate_EndDate_handler___block_invoke;
  v15[3] = &unk_1002ADA68;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __75__MOTopicManager_fetchAndSaveScoredTopicsBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[5];
  id v30;
  _BYTE *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  _BYTE buf[24];
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPortraitTopics);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "fetchAndSaveScoredTopicsBetweenStartDate:%@ EndDate:%@", buf, 0x16u);
  }

  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "momentStore"));
  v7 = *(void **)(a1 + 32);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = __75__MOTopicManager_fetchAndSaveScoredTopicsBetweenStartDate_EndDate_handler___block_invoke_78;
  v33[3] = &unk_1002AD9F0;
  v34 = v7;
  v35 = *(id *)(a1 + 40);
  v36 = &v37;
  objc_msgSend(v6, "fetchEventsWithStartDateAfter:Category:CompletionHandler:", v34, 7, v33);

  if (*((_BYTE *)v38 + 24))
  {
    v8 = _mo_log_facility_get_os_log(&MOLogFacilityPortraitTopics);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Previous browsed topic MOEvent with matching dates found, skipping fetch.", buf, 2u);
    }

    v10 = *(_QWORD *)(a1 + 56);
    if (v10)
      (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, &__NSDictionary0__struct);
  }
  else
  {
    v11 = _mo_log_facility_get_os_log(&MOLogFacilityPortraitTopics);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "No previous browsed topic MOEvent with matching dates found, querying Portrait topics store now.", buf, 2u);
    }

    v13 = (void *)objc_opt_new(PPTopicQuery);
    objc_msgSend(v13, "setFromDate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v13, "setToDate:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v13, "setScoringDate:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v13, "setDecayRate:", 0.000001);
    objc_msgSend(v13, "setScoreWithBiases:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", kTopicSourceBundleIds));
    objc_msgSend(v13, "setMatchingSourceBundleIds:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "topicStore"));
    v32 = 0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "scoresForTopicMapping:query:error:", CFSTR("moments-topics"), v13, &v32));
    v17 = v32;

    v18 = _mo_log_facility_get_os_log(&MOLogFacilityPortraitTopics);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = objc_msgSend(v16, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Found %lu scored topics!", buf, 0xCu);
    }

    v21 = _mo_log_facility_get_os_log(&MOLogFacilityPortraitTopics);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      __75__MOTopicManager_fetchAndSaveScoredTopicsBetweenStartDate_EndDate_handler___block_invoke_cold_1((uint64_t)v16, v22);

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v42 = __Block_byref_object_copy__0;
    v43 = __Block_byref_object_dispose__0;
    v44 = 0;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = __75__MOTopicManager_fetchAndSaveScoredTopicsBetweenStartDate_EndDate_handler___block_invoke_82;
    v29[3] = &unk_1002ADA18;
    v23 = *(_QWORD *)(a1 + 48);
    v31 = buf;
    v29[4] = v23;
    v24 = v13;
    v30 = v24;
    objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v29);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "momentStore"));
    v26 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = __75__MOTopicManager_fetchAndSaveScoredTopicsBetweenStartDate_EndDate_handler___block_invoke_84;
    v27[3] = &unk_1002ADA40;
    v28 = *(id *)(a1 + 56);
    objc_msgSend(v25, "storeEvent:CompletionHandler:", v26, v27);

    _Block_object_dispose(buf, 8);
  }

  _Block_object_dispose(&v37, 8);
}

void __75__MOTopicManager_fetchAndSaveScoredTopicsBetweenStartDate_EndDate_handler___block_invoke_78(_QWORD *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate", (_QWORD)v12));
        if ((objc_msgSend(v9, "isEqualToDate:", a1[4]) & 1) != 0)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
          v11 = objc_msgSend(v10, "isEqualToDate:", a1[5]);

          if (v11)
          {
            *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
            goto LABEL_12;
          }
        }
        else
        {

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
LABEL_12:

}

void __75__MOTopicManager_fetchAndSaveScoredTopicsBetweenStartDate_EndDate_handler___block_invoke_82(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id os_log;
  NSObject *v11;
  uint8_t v12[16];

  objc_msgSend(a3, "doubleValue");
  if (v6 >= 0.55)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "createEventFromTopicQuery:", *(_QWORD *)(a1 + 40)));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    *a4 = 1;
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPortraitTopics);
    v11 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Found event above scoring threshold!", v12, 2u);
    }

  }
}

void __75__MOTopicManager_fetchAndSaveScoredTopicsBetweenStartDate_EndDate_handler___block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v17[16];

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPortraitTopics);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __75__MOTopicManager_fetchAndSaveScoredTopicsBetweenStartDate_EndDate_handler___block_invoke_84_cold_1((uint64_t)v5, v9, v10, v11, v12, v13, v14, v15);
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Saved browsed topics as event into database", v17, 2u);
  }

  v16 = *(_QWORD *)(a1 + 32);
  if (v16)
    (*(void (**)(uint64_t, id, id))(v16 + 16))(v16, v5, v6);

}

- (id)rehydratedScoredTopicsEvent:(id)a3
{
  id v4;
  id os_log;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  NSMutableDictionary *v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  _QWORD v22[4];
  NSMutableDictionary *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;

  v4 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPortraitTopics);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "rehydratedScoredTopicsEvent:%@", buf, 0xCu);
  }

  v7 = (void *)objc_opt_new(PPTopicQuery);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
  objc_msgSend(v7, "setFromDate:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
  objc_msgSend(v7, "setToDate:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
  objc_msgSend(v7, "setScoringDate:", v10);

  objc_msgSend(v7, "setDecayRate:", 0.000001);
  objc_msgSend(v7, "setScoreWithBiases:", 0);
  v11 = objc_opt_new(NSMutableDictionary);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOTopicManager topicStore](self, "topicStore"));
  v24 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __46__MOTopicManager_rehydratedScoredTopicsEvent___block_invoke;
  v22[3] = &unk_1002ADA90;
  v13 = v11;
  v23 = v13;
  objc_msgSend(v12, "iterScoresForTopicMapping:query:error:block:", CFSTR("moments-topics"), v7, &v24, v22);
  v14 = v24;

  if (-[NSMutableDictionary count](v13, "count"))
  {
    v15 = objc_msgSend(v4, "copy");
    objc_msgSend(v15, "setScoredTopics:", v13);
    v16 = _mo_log_facility_get_os_log(&MOLogFacilityPortraitTopics);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "event enriched:%@", buf, 0xCu);
    }
  }
  else
  {
    v18 = _mo_log_facility_get_os_log(&MOLogFacilityPortraitTopics);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "No topics scores higher than threshold is found, therefore deleting this event.", buf, 2u);
    }

    v17 = objc_claimAutoreleasedReturnValue(-[MOTopicManager momentStore](self, "momentStore"));
    v25 = v4;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
    -[NSObject removeEvents:CompletionHandler:](v17, "removeEvents:CompletionHandler:", v20, &__block_literal_global_1);

    v15 = 0;
  }

  return v15;
}

void __46__MOTopicManager_rehydratedScoredTopicsEvent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(v5, "doubleValue");
  if (v6 >= 0.55)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v7);

}

void __46__MOTopicManager_rehydratedScoredTopicsEvent___block_invoke_89(id a1, NSError *a2, NSDictionary *a3)
{
  NSError *v3;
  id os_log;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13[16];

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPortraitTopics);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46__MOTopicManager_rehydratedScoredTopicsEvent___block_invoke_89_cold_1((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Deleting topic event in database succeeded!", v13, 2u);
  }

}

- (id)rehydratedScoredTopicsEvents:(id)a3
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __47__MOTopicManager_rehydratedScoredTopicsEvents___block_invoke;
  v4[3] = &unk_1002ADAF8;
  v4[4] = self;
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v4));
}

id __47__MOTopicManager_rehydratedScoredTopicsEvents___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "rehydratedScoredTopicsEvent:", a2);
}

- (void)waitForQueueEmpty
{
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_91);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (PPTopicStore)topicStore
{
  return self->_topicStore;
}

- (MOEventStore)momentStore
{
  return self->_momentStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentStore, 0);
  objc_storeStrong((id *)&self->_topicStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithTopicStore:(os_log_t)log momentStore:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: momentStore", v1, 2u);
}

void __75__MOTopicManager_fetchAndSaveScoredTopicsBetweenStartDate_EndDate_handler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Scored topics: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __75__MOTopicManager_fetchAndSaveScoredTopicsBetweenStartDate_EndDate_handler___block_invoke_84_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "Saving browsed topics as event into database failed, error %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __46__MOTopicManager_rehydratedScoredTopicsEvent___block_invoke_89_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "Deleting topic event in database failed, error %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
