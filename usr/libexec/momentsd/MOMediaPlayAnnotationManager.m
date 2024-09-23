@implementation MOMediaPlayAnnotationManager

- (MOMediaPlayAnnotationManager)initWithUniverse:(id)a3
{
  MOMediaPlayAnnotationManager *v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MOMediaPlayAnnotationManager;
  v3 = -[MOAnnotationManager initWithUniverse:](&v9, "initWithUniverse:", a3);
  if (v3)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = dispatch_queue_create("MOConversationAnnotationManager", v5);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v6;

  }
  return v3;
}

- (void)performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[MOMediaPlayAnnotationManager queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __86__MOMediaPlayAnnotationManager_performAnnotationWithEvents_withPatternEvents_handler___block_invoke;
  v15[3] = &unk_1002ADA68;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

id __86__MOMediaPlayAnnotationManager_performAnnotationWithEvents_withPatternEvents_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performAnnotationWithEvents:withPatternEvents:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5
{
  void (**v7)(id, NSMutableArray *, _QWORD);
  id v8;
  NSMutableArray *v9;
  void *v10;
  id os_log;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;

  v7 = (void (**)(id, NSMutableArray *, _QWORD))a5;
  v8 = a3;
  v9 = objc_opt_new(NSMutableArray);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaPlayAnnotationManager _createBundlesFromEvents:](self, "_createBundlesFromEvents:", v8));

  -[NSMutableArray addObjectsFromArray:](v9, "addObjectsFromArray:", v10);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = 136315394;
    v14 = "-[MOMediaPlayAnnotationManager _performAnnotationWithEvents:withPatternEvents:handler:]";
    v15 = 2048;
    v16 = -[NSMutableArray count](v9, "count");
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s, annotated media played bundle count, %lu", (uint8_t *)&v13, 0x16u);
  }

  v7[2](v7, v9, 0);
}

- (id)_createBundlesFromEvents:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  id obj;
  void *v27;
  void *v28;
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

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_opt_new(NSMutableArray);
    v22 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaPlayAnnotationManager _groupBaseEventsByDay:category:](self, "_groupBaseEventsByDay:category:", v4, 4));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v35;
      v23 = *(_QWORD *)v35;
      v24 = v6;
      do
      {
        v10 = 0;
        v25 = v8;
        do
        {
          if (*(_QWORD *)v35 != v9)
            objc_enumerationMutation(obj);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v10)));
          v12 = v11;
          if (v11 && objc_msgSend(v11, "count"))
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaPlayAnnotationManager _getEventsBasedOnTypes:isFirstPartyApp:](self, "_getEventsBasedOnTypes:isFirstPartyApp:", v12, 1));
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaPlayAnnotationManager _annotateEvents:isFirstParty:](self, "_annotateEvents:isFirstParty:"));
            if (v13)
              -[NSMutableArray addObject:](v5, "addObject:", v13);
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaPlayAnnotationManager _getEventsBasedOnTypes:isFirstPartyApp:](self, "_getEventsBasedOnTypes:isFirstPartyApp:", v12, 0));
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaPlayAnnotationManager _groupEventsByApps:](self, "_groupEventsByApps:"));
            v30 = 0u;
            v31 = 0u;
            v32 = 0u;
            v33 = 0u;
            v27 = v14;
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allValues"));
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v31;
              do
              {
                v19 = 0;
                v20 = v13;
                do
                {
                  if (*(_QWORD *)v31 != v18)
                    objc_enumerationMutation(v15);
                  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaPlayAnnotationManager _annotateEvents:isFirstParty:](self, "_annotateEvents:isFirstParty:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v19), 0));

                  if (v13)
                    -[NSMutableArray addObject:](v5, "addObject:", v13);
                  v19 = (char *)v19 + 1;
                  v20 = v13;
                }
                while (v17 != v19);
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
              }
              while (v17);
            }

            v9 = v23;
            v6 = v24;
            v8 = v25;
          }

          v10 = (char *)v10 + 1;
        }
        while (v10 != v8);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v8);
    }

    v4 = v22;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_groupBaseEventsByDay:(id)a3 category:(unint64_t)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  __int128 v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id os_log;
  NSObject *v27;
  id v28;
  void *v29;
  id v30;
  __int128 v32;
  void *v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;

  v5 = a3;
  v6 = objc_alloc_init((Class)NSMutableDictionary);
  if (objc_msgSend(v5, "count"))
  {
    v34 = v6;
    v7 = objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getDurationOfMOEventArray"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
    v10 = objc_claimAutoreleasedReturnValue(-[NSObject components:fromDate:](v7, "components:fromDate:", 28, v9));

    v33 = (void *)v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject dateFromComponents:](v7, "dateFromComponents:", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject dateByAddingUnit:value:toDate:options:](v7, "dateByAddingUnit:value:toDate:options:", 16, 1, v11, 0));
    v13 = objc_alloc_init((Class)NSDateFormatter);
    objc_msgSend(v13, "setCalendar:", v7);
    v35 = v13;
    objc_msgSend(v13, "setDateFormat:", CFSTR("yyyy-MM-dd"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
    v15 = objc_msgSend(v11, "compare:", v14);

    if (v15 == (id)-1)
    {
      *(_QWORD *)&v16 = 136315650;
      v32 = v16;
      do
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaPlayAnnotationManager _getEventBasedOnTime:category:startTime:endTime:](self, "_getEventBasedOnTime:category:startTime:endTime:", v5, a4, v11, v12, v32));
        v22 = v21;
        if (v21 && objc_msgSend(v21, "count"))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "firstObject"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "startDate"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "stringFromDate:", v24));

          if (v25)
          {
            objc_msgSend(v34, "setObject:forKey:", v22, v25);
            os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            v27 = objc_claimAutoreleasedReturnValue(os_log);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              v28 = objc_msgSend(v22, "count");
              *(_DWORD *)buf = v32;
              v38 = "-[MOMediaPlayAnnotationManager _groupBaseEventsByDay:category:]";
              v39 = 2112;
              v40 = v25;
              v41 = 2048;
              v42 = v28;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s, bundle annotation with day, %@, event count, %lu", buf, 0x20u);
            }

          }
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject dateByAddingUnit:value:toDate:options:](v7, "dateByAddingUnit:value:toDate:options:", 16, 1, v11, 0));

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject dateByAddingUnit:value:toDate:options:](v7, "dateByAddingUnit:value:toDate:options:", 16, 1, v12, 0));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
        v30 = objc_msgSend(v18, "compare:", v29);

        v11 = v18;
        v12 = v17;
      }
      while (v30 == (id)-1);
    }
    else
    {
      v17 = v12;
      v18 = v11;
    }
    v6 = v34;
    v20 = v34;

  }
  else
  {
    v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v7 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "annotated media events are empty.", buf, 2u);
    }
    v20 = 0;
  }

  return v20;
}

- (id)_getEventBasedOnTime:(id)a3 category:(unint64_t)a4 startTime:(id)a5 endTime:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSMutableArray *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v8 = a3;
  v9 = a5;
  v10 = a6;
  v21 = objc_opt_new(NSMutableArray);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startDate", v21));
        if ((objc_msgSend(v17, "isAfterDate:", v9) & 1) == 0)
          goto LABEL_11;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startDate"));
        if ((objc_msgSend(v18, "isBeforeDate:", v10) & 1) == 0)
        {

LABEL_11:
          continue;
        }
        v19 = objc_msgSend(v16, "category");

        if (v19 == (id)a4)
          -[NSMutableArray addObject:](v21, "addObject:", v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }

  return v21;
}

- (id)_sortEventGroupsBasedOnRepetions:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  void *v5;
  _QWORD v7[4];
  NSMutableDictionary *v8;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __65__MOMediaPlayAnnotationManager__sortEventGroupsBasedOnRepetions___block_invoke;
    v7[3] = &unk_1002AE8F0;
    v8 = objc_opt_new(NSMutableDictionary);
    v4 = v8;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary keysSortedByValueUsingComparator:](v4, "keysSortedByValueUsingComparator:", &__block_literal_global_5));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __65__MOMediaPlayAnnotationManager__sortEventGroupsBasedOnRepetions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;

  v5 = a2;
  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __65__MOMediaPlayAnnotationManager__sortEventGroupsBasedOnRepetions___block_invoke_2;
  v14[3] = &unk_1002AE8C8;
  v14[4] = &v15;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v14);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", v5));
    v10 = v16[3];
    *(_DWORD *)buf = 136315650;
    v20 = "-[MOMediaPlayAnnotationManager _sortEventGroupsBasedOnRepetions:]_block_invoke";
    v21 = 2112;
    v22 = v9;
    v23 = 2048;
    v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s, media title, %@, repetition count, %lu", buf, 0x20u);

  }
  v11 = *(void **)(a1 + 32);
  v12 = objc_alloc((Class)NSNumber);
  v13 = objc_msgSend(v12, "initWithUnsignedLong:", v16[3]);
  objc_msgSend(v11, "setObject:forKey:", v13, v5);

  _Block_object_dispose(&v15, 8);
}

void __65__MOMediaPlayAnnotationManager__sortEventGroupsBasedOnRepetions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "mediaRepetitions"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v3, "unsignedLongValue");

}

int64_t __65__MOMediaPlayAnnotationManager__sortEventGroupsBasedOnRepetions___block_invoke_100(id a1, id a2, id a3)
{
  return (int64_t)objc_msgSend(a3, "compare:", a2);
}

- (id)_getBaseEvents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id os_log;
  NSObject *v10;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  _QWORD v16[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 3));
  v16[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 4));
  v16[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:", v7));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v10 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[MOMediaPlayAnnotationManager _getBaseEvents:]";
    v14 = 2048;
    v15 = objc_msgSend(v8, "count");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s, filtered event count, %lu", buf, 0x16u);
  }

  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &__block_literal_global_109);
  return v8;
}

void __47__MOMediaPlayAnnotationManager__getBaseEvents___block_invoke(id a1, MOEvent *a2, unint64_t a3, BOOL *a4)
{
  MOEvent *v5;
  id os_log;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  unint64_t v11;
  __int16 v12;
  MOEvent *v13;

  v5 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 136315650;
    v9 = "-[MOMediaPlayAnnotationManager _getBaseEvents:]_block_invoke";
    v10 = 2048;
    v11 = a3;
    v12 = 2112;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s, idx, %lu, filtered event, %@", (uint8_t *)&v8, 0x20u);
  }

}

- (id)_groupBaseEvents:(id)a3 category:(unint64_t)a4
{
  id v5;
  NSMutableDictionary *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  void *v15;
  id os_log;
  NSObject *v17;
  id v18;
  NSMutableDictionary *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  uint64_t v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  unint64_t v45;
  __int16 v46;
  id v47;
  _BYTE v48[128];

  v5 = a3;
  v6 = objc_opt_new(NSMutableDictionary);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "category") == (id)a4)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mediaTitle"));
          if (objc_msgSend(v12, "length"))
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v6, "objectForKey:", v12));

            if (!v13)
            {
              v14 = objc_opt_new(NSMutableArray);
              -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v14, v12);

            }
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v6, "objectForKey:", v12));
            objc_msgSend(v15, "addObject:", v11);

          }
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
    }
    while (v8);
  }

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v17 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = -[NSMutableDictionary count](v6, "count");
    *(_DWORD *)buf = 136315650;
    v43 = "-[MOMediaPlayAnnotationManager _groupBaseEvents:category:]";
    v44 = 2048;
    v45 = a4;
    v46 = 2048;
    v47 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s, category, %lu, event group count, %lu", buf, 0x20u);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v19 = v6;
  v20 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)j);
        v25 = objc_autoreleasePoolPush();
        v26 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", v24));
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v19, "objectForKeyedSubscript:", v24));
          v30 = objc_msgSend(v29, "count");
          *(_DWORD *)buf = 136315650;
          v43 = "-[MOMediaPlayAnnotationManager _groupBaseEvents:category:]";
          v44 = 2112;
          v45 = (unint64_t)v28;
          v46 = 2048;
          v47 = v30;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s, media title, %@, event count, %lu", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v25);
      }
      v21 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v21);
  }

  return v19;
}

+ (id)renderTypeFrom:(unint64_t)a3 isFirstPartyApp:(BOOL)a4
{
  __CFString **v4;
  __CFString **v5;

  v4 = MOMediaPlayMetaDataKeyPlayerMediaTypeSong;
  v5 = MOMediaPlayMetaDataKeyPlayerMediaTypePodcastEpisode;
  if (a3 != 2)
    v5 = MOMediaPlayMetaDataKeyPlayerMediaTypeUnknown;
  if (a3 != 1)
    v4 = v5;
  if (!a4)
    v4 = MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMedia;
  return *v4;
}

- (id)_annotateEvents:(id)a3 isFirstParty:(BOOL)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  MOEventBundle *v19;
  id v20;
  MOEventBundle *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  MOAction *v28;
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
  MOEventBundle *v40;
  uint64_t v41;
  void *v42;
  id os_log;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  unsigned int v50;
  void *v51;
  uint64_t v52;
  const __CFString *v53;
  void *v54;
  uint64_t v55;
  const __CFString *v56;
  void *v57;
  uint64_t v58;
  const __CFString *v59;
  const __CFString *v60;
  const __CFString *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  _UNKNOWN **v65;
  uint64_t v66;
  void *v67;
  void *v68;
  int v69;
  int v70;
  const __CFString *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  const __CFString *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  MOResource *v81;
  void *v82;
  void *v83;
  MOResource *v84;
  void *v85;
  MOEventBundle *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  NSObject *v93;
  void *v94;
  id v95;
  MOEventBundle *v97;
  void *v98;
  id v99;
  __CFString *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  id v107;
  void *v108;
  id v109;
  _BOOL4 v110;
  id v111;
  __CFString *v112;
  void *v113;
  void *v114;
  void *v115;
  _UNKNOWN **v116;
  __CFString *v117;
  __CFString *v118;
  void *v119;
  __CFString *v120;
  void *v121;
  __CFString *v122;
  void *v123;
  __CFString *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  id obj;
  void *v131;
  void *v132;
  id v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  uint64_t v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  _QWORD v161[12];
  _QWORD v162[12];
  uint8_t buf[4];
  const char *v164;
  __int16 v165;
  MOEventBundle *v166;
  __int16 v167;
  id v168;
  __int16 v169;
  void *v170;
  __int16 v171;
  void *v172;
  _BYTE v173[128];
  _BYTE v174[128];
  void *v175;

  v110 = a4;
  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    v40 = 0;
    goto LABEL_84;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("endDate"), 0));
  v175 = v6;
  v7 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v175, 1));
  v8 = v5;
  v9 = (void *)v7;
  v98 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sortedArrayUsingDescriptors:", v7));

  v11 = objc_alloc_init((Class)NSMutableArray);
  v157 = 0u;
  v158 = 0u;
  v159 = 0u;
  v160 = 0u;
  obj = v10;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v157, v174, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v158;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v158 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v157 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mediaEvent"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mediaTitle"));

        if (v18)
          objc_msgSend(v11, "addObject:", v16);
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v157, v174, 16);
    }
    while (v13);
  }

  if (!objc_msgSend(v11, "count"))
  {
    v40 = 0;
    v5 = v98;
    goto LABEL_83;
  }
  v19 = [MOEventBundle alloc];
  v20 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v11);
  v21 = -[MOEventBundle initWithEventSet:filtered:](v19, "initWithEventSet:filtered:", v20, 0);

  -[MOEventBundle setInterfaceType:](v21, "setInterfaceType:", 5);
  -[MOEventBundle setBundleSuperType:](v21, "setBundleSuperType:", 4);
  -[MOEventBundle setBundleSubType:](v21, "setBundleSubType:", 406);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](v21, "endDate"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOAnnotationManager timeZoneManager](self, "timeZoneManager"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeForDate:timeZoneManager:](MOTime, "timeForDate:timeZoneManager:", v22, v23));
  -[MOEventBundle setTime:](v21, "setTime:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
  v27 = objc_msgSend(v26, "category");

  if (v27 != (id)4)
  {
    v40 = 0;
    v5 = v98;
    goto LABEL_82;
  }
  v28 = -[MOAction initWithActionName:actionType:actionSubtype:]([MOAction alloc], "initWithActionName:actionType:actionSubtype:", CFSTR("played_media_sessions"), 1, 6);
  -[MOEventBundle setAction:](v21, "setAction:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "eventIdentifier"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v21, "action"));
  objc_msgSend(v31, "setSourceEventIdentifier:", v30);

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "mediaAlbum"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v21, "action"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "actionName"));
  v108 = v25;
  if (v32)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "mediaAlbum"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v21, "resources"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "firstObject"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "name"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@ - %@"), v34, v35, v38));
    -[MOEventBundle setPromptLanguage:](v21, "setPromptLanguage:", v39);

  }
  else
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v21, "resources"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "firstObject"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "name"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@"), v34, v37));
    -[MOEventBundle setPromptLanguage:](v21, "setPromptLanguage:", v38);
  }

  v109 = objc_alloc_init((Class)NSMutableArray);
  v153 = 0u;
  v154 = 0u;
  v155 = 0u;
  v156 = 0u;
  v97 = v21;
  v99 = (id)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v21, "events"));
  v25 = v108;
  v111 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v153, v173, 16);
  if (!v111)
    goto LABEL_79;
  v106 = *(_QWORD *)v154;
  v107 = v11;
  do
  {
    v41 = 0;
    do
    {
      if (*(_QWORD *)v154 != v106)
        objc_enumerationMutation(v99);
      v42 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * v41);
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v44 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        v86 = (MOEventBundle *)objc_msgSend(v98, "count");
        v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "mediaEvent"));
        v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "mediaTitle"));
        v89 = (void *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", v88));
        v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "startDate"));
        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "endDate"));
        *(_DWORD *)buf = 136316162;
        v164 = "-[MOMediaPlayAnnotationManager _annotateEvents:isFirstParty:]";
        v165 = 2048;
        v166 = v86;
        v167 = 2112;
        v168 = v89;
        v169 = 2112;
        v170 = v90;
        v171 = 2112;
        v172 = v91;
        _os_log_debug_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "%s, media annotation event count, %lu, media title, %@, start, %@, end, %@", buf, 0x34u);

      }
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "mediaEvent"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "mediaType"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "mediaEvent"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "mediaPlayerBundleId"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession getMOPlaySessionMediaType:bundleId:](MOMediaPlaySession, "getMOPlaySessionMediaType:bundleId:", v46, v48));
      v50 = objc_msgSend(v49, "unsignedIntValue");

      v161[0] = CFSTR("MOMediaPlayMetaDataKeyPlayerTitle");
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "mediaEvent"));
      v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "mediaTitle"));
      if (v52)
      {
        v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "mediaEvent"));
        v124 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "mediaTitle"));
        v53 = v124;
      }
      else
      {
        v53 = &stru_1002B68D0;
      }
      v162[0] = v53;
      v161[1] = CFSTR("MOMediaPlayMetaDataKeyPlayerArtist");
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "mediaEvent"));
      v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "mediaArtist"));
      if (v55)
      {
        v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "mediaEvent"));
        v122 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "mediaArtist"));
        v56 = v122;
      }
      else
      {
        v56 = &stru_1002B68D0;
      }
      v162[1] = v56;
      v161[2] = CFSTR("MOMediaPlayMetaDataKeyPlayerTrackID");
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "mediaEvent"));
      v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "mediaProductId"));
      if (v58)
      {
        v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "mediaEvent"));
        v120 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "mediaProductId"));
        v59 = v120;
      }
      else
      {
        v59 = &stru_1002B68D0;
      }
      v162[2] = v59;
      v161[3] = CFSTR("MOMediaPlayMetaDataKeyPlayerAlbumName");
      v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "mediaEvent"));
      v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "mediaAlbum"));
      if (v144)
      {
        v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "mediaEvent"));
        v118 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "mediaAlbum"));
        v60 = v118;
      }
      else
      {
        v60 = &stru_1002B68D0;
      }
      v162[3] = v60;
      v161[4] = CFSTR("MOMediaPlayMetaDataKeyPlayerBundleID");
      v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "mediaEvent"));
      v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "mediaPlayerBundleId"));
      v150 = (void *)v52;
      v148 = (void *)v55;
      v146 = (void *)v58;
      if (v142)
      {
        v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "mediaEvent"));
        v117 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "mediaPlayerBundleId"));
        v61 = v117;
      }
      else
      {
        v61 = &stru_1002B68D0;
      }
      v162[4] = v61;
      v161[5] = CFSTR("MOMediaPlayMetaDataKeyPlayerDuration");
      v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "mediaEvent"));
      v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "mediaPlaySessions"));
      v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "firstObject"));
      v62 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v139, "duration")));
      v162[5] = v62;
      v161[6] = CFSTR("MOMediaPlayMetaDataKeyPlayerSumPlaytime");
      v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "mediaEvent"));
      v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "mediaSumTimePlayed"));
      v162[6] = v136;
      v161[7] = CFSTR("media_type");
      v63 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v50));
      v162[7] = v63;
      v161[8] = CFSTR("MOMediaPlayMetaDataKeyPlayerFirstPartyRatio");
      v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "mediaEvent"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "mediaFirstPartyTimePlayedRatio"));
      v147 = v57;
      if (v64)
      {
        v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "mediaEvent"));
        v116 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "mediaFirstPartyTimePlayedRatio"));
        v65 = v116;
      }
      else
      {
        v65 = &off_1002D81E0;
      }
      v162[8] = v65;
      v161[9] = CFSTR("MOMediaPlayMetaDataKeyPlayerMediaTypeKey");
      v66 = objc_claimAutoreleasedReturnValue(+[MOMediaPlayAnnotationManager renderTypeFrom:isFirstPartyApp:](MOMediaPlayAnnotationManager, "renderTypeFrom:isFirstPartyApp:", v50, v110));
      v162[9] = v66;
      v161[10] = CFSTR("media_album");
      v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "mediaEvent"));
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "mediaAlbum"));
      v152 = v41;
      v151 = v51;
      v149 = v54;
      v138 = (void *)v62;
      v135 = (void *)v63;
      v132 = (void *)v66;
      if (!v67)
        goto LABEL_49;
      v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "mediaEvent"));
      v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "mediaTitle"));
      if (!v129)
      {
        v129 = 0;
LABEL_49:
        v69 = 0;
        v70 = 0;
        goto LABEL_51;
      }
      v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "mediaEvent"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "mediaAlbum"));
      v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "mediaEvent"));
      v104 = v68;
      v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "mediaTitle"));
      if (objc_msgSend(v68, "rangeOfString:") == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "mediaEvent"));
        v69 = 1;
        v70 = 1;
        v100 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "mediaAlbum"));
        v71 = v100;
        goto LABEL_52;
      }
      v70 = 0;
      v69 = 1;
LABEL_51:
      v71 = &stru_1002B68D0;
LABEL_52:
      v162[10] = v71;
      v161[11] = CFSTR("MOMediaPlayMetaDataKeyPlayerBgColor");
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "mediaEvent"));
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "mediaPlaySessions"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "firstObject"));
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "bgColor"));
      if (v75)
      {
        v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "mediaEvent"));
        v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "mediaPlaySessions"));
        v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "firstObject"));
        v112 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "bgColor"));
        v76 = v112;
      }
      else
      {
        v76 = &stru_1002B68D0;
      }
      v162[11] = v76;
      v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v162, v161, 12));
      v133 = objc_msgSend(v77, "mutableCopy");

      if (v75)
      {

      }
      if (v70)
      {

      }
      v11 = v107;
      if (v69)
      {

      }
      if (v67)
      {

      }
      v25 = v108;
      if (v64)
      {

      }
      if (v142)
      {

      }
      if (v144)
      {

      }
      if (v146)
      {

      }
      if (v148)
      {

      }
      if (v150)
      {

      }
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "startDate"));

      if (v78)
      {
        v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "startDate"));
        objc_msgSend(v79, "timeIntervalSinceReferenceDate");
        v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        objc_msgSend(v133, "setObject:forKeyedSubscript:", v80, CFSTR("MOMediaPlayMetaDataKeyPlayerStartDate"));

      }
      v81 = [MOResource alloc];
      v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "mediaEvent"));
      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "mediaTitle"));
      v84 = -[MOResource initWithName:type:dict:value:](v81, "initWithName:type:dict:value:", v83, 3, v133, 0.0);

      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "eventIdentifier"));
      -[MOResource setSourceEventIdentifier:](v84, "setSourceEventIdentifier:", v85);

      objc_msgSend(v109, "addObject:", v84);
      v41 = v152 + 1;
    }
    while (v111 != (id)(v152 + 1));
    v111 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v153, v173, 16);
  }
  while (v111);
LABEL_79:

  v21 = v97;
  -[MOEventBundle setResources:](v97, "setResources:", v109);
  v92 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v93 = objc_claimAutoreleasedReturnValue(v92);
  v5 = v98;
  if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
  {
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "firstObject"));
    v95 = objc_msgSend(v94, "category");
    *(_DWORD *)buf = 136315650;
    v164 = "-[MOMediaPlayAnnotationManager _annotateEvents:isFirstParty:]";
    v165 = 2112;
    v166 = v97;
    v167 = 2048;
    v168 = v95;
    _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_INFO, "%s, bundle, %@, event category, %lu", buf, 0x20u);

  }
  v40 = v97;

LABEL_82:
LABEL_83:

LABEL_84:
  return v40;
}

- (id)_groupEventsByApps:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  NSMutableArray *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mediaEvent", (_QWORD)v17));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mediaPlayerBundleId"));

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4, "objectForKey:", v12));

          if (v13)
            v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4, "objectForKey:", v12));
          else
            v14 = objc_opt_new(NSMutableArray);
          v15 = v14;
          -[NSMutableArray addObject:](v14, "addObject:", v10);
          -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v15, v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_getEventsBasedOnTypes:(id)a3 isFirstPartyApp:(unsigned __int8)a4
{
  int v4;
  id v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a4;
  v6 = a3;
  v7 = objc_opt_new(NSMutableArray);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (-[MOMediaPlayAnnotationManager _isFirstPartyApp:](self, "_isFirstPartyApp:", v13, (_QWORD)v15) == v4)
          -[NSMutableArray addObject:](v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

- (unsigned)_isFirstPartyApp:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "mediaEvent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mediaPlayerBundleId"));

  v5 = v4 && (objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple.")) & 1) != 0;
  return v5;
}

- (id)getMediaOnRepeatLabelHeaderFromMediaType:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return CFSTR("media_on_repeat");
  else
    return *(&off_1002AE990 + a3 - 1);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
