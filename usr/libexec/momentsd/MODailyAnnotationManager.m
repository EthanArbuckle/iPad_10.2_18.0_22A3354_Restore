@implementation MODailyAnnotationManager

- (MODailyAnnotationManager)initWithUniverse:(id)a3
{
  id v5;
  MODailyAnnotationManager *v6;
  uint64_t v7;
  MODailyAnnotationManager *v8;
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
  v18.super_class = (Class)MODailyAnnotationManager;
  v6 = -[MOAnnotationManager initWithUniverse:](&v18, "initWithUniverse:", v5);
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
  v11 = objc_claimAutoreleasedReturnValue(-[MODailyAnnotationManager queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __82__MODailyAnnotationManager_performAnnotationWithEvents_withPatternEvents_handler___block_invoke;
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

id __82__MODailyAnnotationManager_performAnnotationWithEvents_withPatternEvents_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performAnnotationWithEvents:withPatternEvents:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5
{
  void (**v7)(id, id, _QWORD);
  void *v8;
  id os_log;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSMutableArray *v15;
  id v16;
  _QWORD v17[5];
  NSMutableArray *v18;
  id v19;
  uint8_t buf[4];
  id v21;

  v7 = (void (**)(id, id, _QWORD))a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MODailyAnnotationManager getBaseEvents:](self, "getBaseEvents:", a3));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v10 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v21 = objc_msgSend(v8, "count");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "DailyAnnotation: Base Events, %lu", buf, 0xCu);
  }

  if (objc_msgSend(v8, "count"))
  {
    v11 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
    v19 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sortedArrayUsingDescriptors:", v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MODailyAnnotationManager groupedEvents:keyFunc:](self, "groupedEvents:keyFunc:", v13, &__block_literal_global_32));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __83__MODailyAnnotationManager__performAnnotationWithEvents_withPatternEvents_handler___block_invoke_2;
    v17[3] = &unk_1002B39B8;
    v17[4] = self;
    v18 = objc_opt_new(NSMutableArray);
    v15 = v18;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v17);
    v16 = -[NSMutableArray copy](v15, "copy");
    v7[2](v7, v16, 0);

    v8 = (void *)v13;
  }
  else
  {
    v7[2](v7, &__NSArray0__struct, 0);
  }

}

id __83__MODailyAnnotationManager__performAnnotationWithEvents_withPatternEvents_handler___block_invoke(id a1, MOEvent *a2)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent endDate](a2, "endDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "startOfDayWithBoundaryOfADay:", 10800.0));

  return v3;
}

void __83__MODailyAnnotationManager__performAnnotationWithEvents_withPatternEvents_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:duration:", v5, 86400.0);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endDate"));
    *(_DWORD *)buf = 138412802;
    v32 = v10;
    v33 = 2112;
    v34 = v11;
    v35 = 2048;
    v36 = objc_msgSend(v6, "count");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "DailyAnnotation: Date, %@ - %@, Events, %lu", buf, 0x20u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "annotateBaseEvents:dateInterval:", v6, v7));
  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
    v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "DailyAnnotation: Bundle, %@", buf, 0xCu);
    }
  }
  else
  {
    v15 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      __83__MODailyAnnotationManager__performAnnotationWithEvents_withPatternEvents_handler___block_invoke_2_cold_1(v16);

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v14 = v6;
    v17 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v17)
    {
      v18 = v17;
      v24 = v6;
      v25 = v5;
      v19 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v14);
          v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          v22 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v23 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v32 = v21;
            _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "DailyAnnotation: Event, %@", buf, 0xCu);
          }

        }
        v18 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v18);
      v6 = v24;
      v5 = v25;
      v12 = 0;
    }
  }

}

- (id)groupedEvents:(id)a3 keyFunc:(id)a4
{
  id v5;
  uint64_t (**v6)(id, _QWORD);
  NSMutableDictionary *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v5 = a3;
  v6 = (uint64_t (**)(id, _QWORD))a4;
  v7 = objc_opt_new(NSMutableDictionary);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v14 = v6[2](v6, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v16 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v7, "objectForKey:", v15, (_QWORD)v19));
        if (!v16)
          v16 = objc_opt_new(NSMutableArray);
        -[NSMutableArray addObject:](v16, "addObject:", v13);
        -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v16, v15);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  v17 = -[NSMutableDictionary copy](v7, "copy");
  return v17;
}

- (id)getBaseEvents:(id)a3
{
  id os_log;
  NSObject *v6;
  void *v7;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MODailyAnnotationManager getBaseEvents:].cold.1();

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MODailyAnnotationManager.m"), 126, CFSTR("Use the derived class (in %s:%d)"), "-[MODailyAnnotationManager getBaseEvents:]", 126);

  return 0;
}

- (id)annotateBaseEvents:(id)a3 dateInterval:(id)a4
{
  id os_log;
  NSObject *v7;
  void *v8;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[MODailyAnnotationManager annotateBaseEvents:dateInterval:].cold.1();

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MODailyAnnotationManager.m"), 132, CFSTR("Use the derived class (in %s:%d)"), "-[MODailyAnnotationManager annotateBaseEvents:dateInterval:]", 132);

  return 0;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MODefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->fUniverse, 0);
}

void __83__MODailyAnnotationManager__performAnnotationWithEvents_withPatternEvents_handler___block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "DailyAnnotation: no bundle is created", v1, 2u);
}

- (void)getBaseEvents:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "Use the derived class (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)annotateBaseEvents:dateInterval:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "Use the derived class (in %s:%d)", v2, v3, v4, v5, v6);
}

@end
