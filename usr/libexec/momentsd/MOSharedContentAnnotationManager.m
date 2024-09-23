@implementation MOSharedContentAnnotationManager

- (MOSharedContentAnnotationManager)initWithUniverse:(id)a3
{
  id v5;
  MOSharedContentAnnotationManager *v6;
  uint64_t v7;
  MOSharedContentAnnotationManager *v8;
  objc_class *v9;
  NSString *v10;
  id v11;
  const char *v12;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  objc_super v18;

  v5 = a3;
  objc_storeStrong((id *)&self->fUniverse, a3);
  v18.receiver = self;
  v18.super_class = (Class)MOSharedContentAnnotationManager;
  v6 = -[MOSharedContentAnnotationManager init](&v18, "init");
  v8 = v6;
  if (v6)
  {
    v9 = (objc_class *)objc_opt_class(v6, v7);
    v10 = NSStringFromClass(v9);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v10));
    v12 = (const char *)objc_msgSend(v11, "UTF8String");
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = dispatch_queue_create(v12, v14);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v15;

  }
  return v8;
}

- (id)getBaseEvents:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 9));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:", v4));

  return v5;
}

- (void)performAnnotationWithEvents:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[MOSharedContentAnnotationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __72__MOSharedContentAnnotationManager_performAnnotationWithEvents_handler___block_invoke;
  block[3] = &unk_1002AEBA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __72__MOSharedContentAnnotationManager_performAnnotationWithEvents_handler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __72__MOSharedContentAnnotationManager_performAnnotationWithEvents_handler___block_invoke_2;
  v3[3] = &unk_1002ADFD8;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_performAnnotationWithEvents:handler:", v2, v3);

}

uint64_t __72__MOSharedContentAnnotationManager_performAnnotationWithEvents_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_performAnnotationWithEvents:(id)a3 handler:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  void *v7;
  id os_log;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;

  v6 = (void (**)(id, void *, _QWORD))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOSharedContentAnnotationManager getBaseEvents:](self, "getBaseEvents:", a3));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[MOSharedContentAnnotationManager _performAnnotationWithEvents:handler:].cold.3(v7);

  if (objc_msgSend(v7, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOSharedContentAnnotationManager annotateBaseEvents:](self, "annotateBaseEvents:", v7));
    v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
    if (v10)
    {
      if (v13)
        -[MOSharedContentAnnotationManager _performAnnotationWithEvents:handler:].cold.2(v10);
    }
    else if (v13)
    {
      -[MOSharedContentAnnotationManager _performAnnotationWithEvents:handler:].cold.1(v12);
    }

    v6[2](v6, v10, 0);
  }
  else
  {
    v6[2](v6, &__NSArray0__struct, 0);
  }

}

- (id)annotateBaseEvents:(id)a3
{
  id v3;
  void *i;
  void *v5;
  void *v6;
  void *v7;
  MOEventBundle *v8;
  id v9;
  MOEventBundle *v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  MOAction *v14;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  MOResource *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  NSMutableDictionary *v29;
  void *v30;
  void *v31;
  void *v32;
  id os_log;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v39;
  void *v40;
  id obj;
  NSMutableArray *v42;
  uint64_t v43;
  id v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  uint64_t v57;
  _QWORD v58[2];
  _QWORD v59[2];
  _BYTE v60[128];

  v3 = a3;
  if (!v3)
  {
    v42 = 0;
    goto LABEL_23;
  }
  v42 = objc_opt_new(NSMutableArray);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v39 = v3;
  obj = v3;
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
  if (!v44)
    goto LABEL_21;
  v43 = *(_QWORD *)v47;
  do
  {
    for (i = 0; i != v44; i = (char *)i + 1)
    {
      if (*(_QWORD *)v47 != v43)
        objc_enumerationMutation(obj);
      v5 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemURL"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absoluteString"));

      if ((objc_msgSend(v7, "hasPrefix:", CFSTR("https://apple.news")) & 1) != 0
        || (objc_msgSend(v7, "hasPrefix:", CFSTR("https://music.apple.com")) & 1) != 0
        || (objc_msgSend(v7, "hasPrefix:", CFSTR("https://tv.apple.com")) & 1) != 0
        || (objc_msgSend(v7, "hasPrefix:", CFSTR("https://podcasts.apple.com")) & 1) != 0)
      {
        goto LABEL_13;
      }
      v8 = (MOEventBundle *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemAttributionsCount"));
      if ((int)-[MOEventBundle intValue](v8, "intValue") >= 2)
      {
        v9 = objc_msgSend(v5, "itemShareDirection");

        if (v9 != (id)1)
          goto LABEL_19;
LABEL_13:
        v45 = v7;
        v10 = [MOEventBundle alloc];
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        v8 = -[MOEventBundle initWithBundleIdentifier:creationDate:](v10, "initWithBundleIdentifier:creationDate:", v11, v12);

        -[MOEventBundle setInterfaceType:](v8, "setInterfaceType:", 6);
        v13 = objc_opt_new(NSMutableArray);
        -[NSMutableArray addObject:](v13, "addObject:", v5);
        -[MOEventBundle setEvents:](v8, "setEvents:", v13);
        v14 = -[MOAction initWithActionName:actionType:actionSubtype:]([MOAction alloc], "initWithActionName:actionType:actionSubtype:", CFSTR("Items shared and received today"), 1, 3);
        -[MOEventBundle setAction:](v8, "setAction:", v14);

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "eventIdentifier"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v8, "action"));
        objc_msgSend(v16, "setSourceEventIdentifier:", v15);

        v17 = objc_opt_new(NSMutableArray);
        v58[0] = CFSTR("sharedContentURL");
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemURL"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "absoluteString"));
        v58[1] = CFSTR("sharedContentStartDate");
        v59[0] = v19;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDate"));
        objc_msgSend(v20, "timeIntervalSinceReferenceDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        v59[1] = v21;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v59, v58, 2));

        v23 = -[MOResource initWithName:type:dict:value:]([MOResource alloc], "initWithName:type:dict:value:", CFSTR("Shared Content"), 4, v22, 0.0);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "eventIdentifier"));
        -[MOResource setSourceEventIdentifier:](v23, "setSourceEventIdentifier:", v24);

        -[NSMutableArray addObject:](v17, "addObject:", v23);
        v25 = -[NSMutableArray copy](v17, "copy");
        -[MOEventBundle setResources:](v8, "setResources:", v25);

        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDate"));
        -[MOEventBundle setStartDate:](v8, "setStartDate:", v26);

        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDate"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "dateByAddingTimeInterval:", 3600.0));
        -[MOEventBundle setEndDate:](v8, "setEndDate:", v28);

        v29 = objc_opt_new(NSMutableDictionary);
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "itemShareDirection")));
        -[NSMutableDictionary setObject:forKey:](v29, "setObject:forKey:", v30, CFSTR("ItemShareDirection"));

        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemAttributionsCount"));
        if (v31)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemAttributionsCount"));
          -[NSMutableDictionary setObject:forKey:](v29, "setObject:forKey:", v32, CFSTR("ItemAttributionsCount"));

        }
        -[MOEventBundle setMetaDataForRank:](v8, "setMetaDataForRank:", v29);
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v34 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifierFromProvider"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v8, "startDate"));
          v36 = objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](v8, "endDate"));
          *(_DWORD *)buf = 136315906;
          v51 = "-[MOSharedContentAnnotationManager annotateBaseEvents:]";
          v52 = 2112;
          v53 = v40;
          v54 = 2112;
          v55 = v35;
          v56 = 2112;
          v57 = v36;
          v37 = (void *)v36;
          _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "%s, #swy: annotated share content bundle with identifierFromProvider, %@,startdata,%@,enddate,%@", buf, 0x2Au);

        }
        -[NSMutableArray addObject:](v42, "addObject:", v8);

        v7 = v45;
      }

LABEL_19:
    }
    v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
  }
  while (v44);
LABEL_21:

  v3 = v39;
LABEL_23:

  return v42;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->fUniverse, 0);
}

- (void)_performAnnotationWithEvents:(os_log_t)log handler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#swy, no bundle is created", v1, 2u);
}

- (void)_performAnnotationWithEvents:(void *)a1 handler:.cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, v1, v2, "#swy, Bundles count, %lu", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_5();
}

- (void)_performAnnotationWithEvents:(void *)a1 handler:.cold.3(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, v1, v2, "#swy, Base Events, %lu", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_5();
}

@end
