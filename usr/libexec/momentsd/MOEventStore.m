@implementation MOEventStore

- (MOEventStore)initWithUniverse:(id)a3
{
  id v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  id v16;
  MOEventStore *v17;
  dispatch_queue_attr_t v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *queue;
  MOEventStore *v22;
  id os_log;
  NSObject *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  SEL v28;
  MOEventStore *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  objc_super v34;

  v5 = a3;
  v7 = (objc_class *)objc_opt_class(MOPersistenceManager, v6);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v9));

  v12 = (objc_class *)objc_opt_class(MOConfigurationManager, v11);
  v13 = NSStringFromClass(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v14));

  v16 = objc_alloc_init((Class)HKHealthStore);
  if (!v10)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[MOEventStore initWithUniverse:].cold.1();

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v26 = v25;
    v27 = CFSTR("Invalid parameter not satisfying: persistenceManager");
    v28 = a2;
    v29 = self;
    v30 = 38;
    goto LABEL_12;
  }
  if (!v15)
  {
    v31 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[MOPeopleDiscoveryManager initWithUniverse:].cold.1();

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v26 = v25;
    v27 = CFSTR("Invalid parameter not satisfying: configurationManager");
    v28 = a2;
    v29 = self;
    v30 = 39;
LABEL_12:
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", v28, v29, CFSTR("MOEventStore.m"), v30, v27);

    v22 = 0;
    goto LABEL_13;
  }
  v34.receiver = self;
  v34.super_class = (Class)MOEventStore;
  v17 = -[MOEventStore init](&v34, "init");
  if (v17)
  {
    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = dispatch_queue_create("MOEventStore", v19);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v20;

    objc_storeStrong((id *)&v17->_persistenceManager, v10);
    objc_storeStrong((id *)&v17->_configurationManager, v15);
    objc_storeStrong((id *)&v17->_healthStore, v16);
  }
  self = v17;
  v22 = self;
LABEL_13:

  return v22;
}

- (void)storeEvent:(id)a3 CompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventStore persistenceManager](self, "persistenceManager"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __45__MOEventStore_storeEvent_CompletionHandler___block_invoke;
  v11[3] = &unk_1002AF3D8;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlockAndWait:", v11);

}

void __45__MOEventStore_storeEvent_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  unsigned __int8 v6;
  void (**v7)(id, _QWORD, void *);
  id os_log;
  NSObject *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint8_t buf[8];
  const __CFString *v17;
  _UNKNOWN **v18;
  const __CFString *v19;
  _UNKNOWN **v20;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = +[MOEventMO managedObjectWithEvent:inManagedObjectContext:](MOEventMO, "managedObjectWithEvent:inManagedObjectContext:", v4, v3);
    v15 = 0;
    v6 = objc_msgSend(v3, "save:", &v15);
    v7 = (void (**)(id, _QWORD, void *))v15;
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    v10 = v9;
    if ((v6 & 1) != 0)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "saving event succeeded", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __45__MOEventStore_storeEvent_CompletionHandler___block_invoke_cold_1();
    }

    objc_msgSend(v3, "reset");
    v14 = *(_QWORD *)(a1 + 40);
    if (v14)
    {
      v17 = CFSTR("resultNumberOfEvents");
      v18 = &off_1002D85E8;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
      (*(void (**)(uint64_t, id, void *))(v14 + 16))(v14, v7, v13);
      goto LABEL_13;
    }
  }
  else
  {
    v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "no event to be saved", buf, 2u);
    }

    v7 = *(void (***)(id, _QWORD, void *))(a1 + 40);
    if (v7)
    {
      v19 = CFSTR("resultNumberOfEvents");
      v20 = &off_1002D85D0;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
      v7[2](v7, 0, v13);
      v7 = 0;
LABEL_13:

    }
  }

}

- (void)storeEvents:(id)a3 CompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventStore persistenceManager](self, "persistenceManager"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __46__MOEventStore_storeEvents_CompletionHandler___block_invoke;
  v11[3] = &unk_1002AF3D8;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlockAndWait:", v11);

}

void __46__MOEventStore_storeEvents_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id os_log;
  NSObject *v19;
  id v20;
  unsigned __int8 v21;
  id v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id obj;
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  const __CFString *v41;
  void *v42;
  uint8_t buf[4];
  id v44;
  _BYTE v45[128];

  v34 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v32 = a1;
    obj = *(id *)(a1 + 32);
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v38;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v38 != v5)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v6);
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventMO fetchRequest](MOEventMO, "fetchRequest"));
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "eventIdentifier"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("eventIdentifier == %@"), v9));
          objc_msgSend(v8, "setPredicate:", v10);

          v36 = 0;
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "executeFetchRequest:error:", v8, &v36));
          v12 = v36;
          if (!v12
            && objc_msgSend(v11, "count")
            && (v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"))) != 0)
          {
            v17 = (void *)v16;
            os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
            v19 = objc_claimAutoreleasedReturnValue(os_log);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v44 = v7;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "update event, %@", buf, 0xCu);
            }

            +[MOEventMO setPropertiesOfEventMO:withEvent:](MOEventMO, "setPropertiesOfEventMO:withEvent:", v17, v7);
          }
          else
          {
            v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
            v14 = objc_claimAutoreleasedReturnValue(v13);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v44 = v7;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "save event, %@", buf, 0xCu);
            }

            v15 = +[MOEventMO managedObjectWithEvent:inManagedObjectContext:](MOEventMO, "managedObjectWithEvent:inManagedObjectContext:", v7, v34);
          }

          v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        v4 = v20;
      }
      while (v20);
    }

    v35 = 0;
    v21 = objc_msgSend(v34, "save:", &v35);
    v22 = v35;
    v23 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v25 = v24;
    if ((v21 & 1) != 0)
    {
      a1 = v32;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v26 = objc_msgSend(*(id *)(v32 + 32), "count");
        *(_DWORD *)buf = 134217984;
        v44 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "saving events succeeded, event count, %lu", buf, 0xCu);
      }
    }
    else
    {
      a1 = v32;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        __46__MOEventStore_storeEvents_CompletionHandler___block_invoke_cold_1();
    }

    objc_msgSend(v34, "reset");
  }
  else
  {
    v27 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "no events to be saved", buf, 2u);
    }

    v22 = 0;
  }
  v29 = *(_QWORD *)(a1 + 40);
  if (v29)
  {
    v41 = CFSTR("resultNumberOfEvents");
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count")));
    v42 = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
    (*(void (**)(uint64_t, id, void *))(v29 + 16))(v29, v22, v31);

  }
}

- (void)removeEvents:(id)a3 CompletionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  SEL v14;
  const __CFString *v15;
  _UNKNOWN **v16;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventStore persistenceManager](self, "persistenceManager"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __47__MOEventStore_removeEvents_CompletionHandler___block_invoke;
    v11[3] = &unk_1002AF400;
    v12 = v7;
    v14 = a2;
    v13 = v8;
    objc_msgSend(v9, "performBlockAndWait:", v11);

  }
  else if (v8)
  {
    v15 = CFSTR("resultNumberOfEvents");
    v16 = &off_1002D85D0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v10);

  }
}

void __47__MOEventStore_removeEvents_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id os_log;
  NSObject *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  void *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  id v35;
  unsigned __int8 v36;
  id v37;
  id v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  NSString *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  const __CFString *v61;
  void *v62;
  uint8_t v63[128];
  uint8_t buf[4];
  id v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  id v69;
  __int16 v70;
  id v71;
  _BYTE v72[128];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count")));
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v58 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i), "eventIdentifier"));
        objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventMO fetchRequest](MOEventMO, "fetchRequest"));
  v50 = v4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("eventIdentifier IN %@"), v4));
  objc_msgSend(v11, "setPredicate:", v12);

  objc_msgSend(v11, "setReturnsObjectsAsFaults:", 0);
  v56 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v11, &v56));
  v14 = v56;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  v16 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v44 = NSStringFromSelector(*(SEL *)(a1 + 48));
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    v46 = objc_msgSend(v13, "count");
    *(_DWORD *)buf = 138413058;
    v65 = v45;
    v66 = 2112;
    v67 = v11;
    v68 = 2048;
    v69 = v46;
    v70 = 2112;
    v71 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v14)
  {
    v17 = *(_QWORD *)(a1 + 40);
    if (v17)
      (*(void (**)(uint64_t, id, void *))(v17 + 16))(v17, v14, &__NSDictionary0__struct);
    objc_msgSend(v3, "reset");
  }
  else
  {
    if (objc_msgSend(v13, "count"))
    {
      v47 = v13;
      v48 = v11;
      v49 = a1;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v18 = v13;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v53;
        do
        {
          for (j = 0; j != v20; j = (char *)j + 1)
          {
            if (*(_QWORD *)v53 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)j);
            objc_msgSend(v3, "deleteObject:", v23);
            v24 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
            v25 = objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              v26 = v21;
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "eventIdentifier"));
              v28 = v18;
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "provider"));
              v30 = v3;
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "category"));
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "startDate"));
              *(_DWORD *)buf = 138413058;
              v65 = v27;
              v66 = 2112;
              v67 = v29;
              v68 = 2112;
              v69 = v31;
              v70 = 2112;
              v71 = v32;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "trying to remove event, id, %@, provider, %@, category, %@, startDate, %@", buf, 0x2Au);

              v3 = v30;
              v18 = v28;

              v21 = v26;
            }

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
        }
        while (v20);
      }

      v33 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = objc_msgSend(v18, "count");
        *(_DWORD *)buf = 134217984;
        v65 = v35;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "trying to remove events count %lu", buf, 0xCu);
      }

      v51 = 0;
      v36 = objc_msgSend(v3, "save:", &v51);
      v37 = v51;
      v38 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      v39 = objc_claimAutoreleasedReturnValue(v38);
      v40 = v39;
      v11 = v48;
      a1 = v49;
      v14 = 0;
      if ((v36 & 1) != 0)
      {
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "saving event deletion operation succeeded", buf, 2u);
        }
      }
      else if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        __47__MOEventStore_removeEvents_CompletionHandler___block_invoke_cold_1();
      }

      v13 = v47;
    }
    else
    {
      v37 = 0;
    }
    objc_msgSend(v3, "reset");
    v41 = *(_QWORD *)(a1 + 40);
    if (v41)
    {
      v61 = CFSTR("resultNumberOfEvents");
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "count")));
      v62 = v42;
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1));
      (*(void (**)(uint64_t, id, void *))(v41 + 16))(v41, v37, v43);

    }
  }

}

- (void)removeAllEventsWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SEL v10;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventStore persistenceManager](self, "persistenceManager"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __53__MOEventStore_removeAllEventsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1002AF428;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  objc_msgSend(v6, "performBlockAndWait:", v8);

}

void __53__MOEventStore_removeAllEventsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id os_log;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  unsigned __int8 v18;
  id v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  NSString *v24;
  void *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  uint8_t v33[128];
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventMO fetchRequest](MOEventMO, "fetchRequest"));
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v32 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v4, &v32));
  v6 = v32;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v24 = NSStringFromSelector(*(SEL *)(a1 + 40));
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 138413058;
    v35 = v25;
    v36 = 2112;
    v37 = v4;
    v38 = 2048;
    v39 = v26;
    v40 = 2112;
    v41 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v6)
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);
    objc_msgSend(v3, "reset");
  }
  else
  {
    if (objc_msgSend(v5, "count"))
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v10 = v5;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v29;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v29 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(v3, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v14));
            v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v12);
      }

      v15 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = objc_msgSend(v10, "count");
        *(_DWORD *)buf = 134217984;
        v35 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "trying to remove events count %lu", buf, 0xCu);
      }

      v27 = 0;
      v18 = objc_msgSend(v3, "save:", &v27);
      v19 = v27;
      v20 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      v22 = v21;
      if ((v18 & 1) != 0)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "saving event deletion operation succeeded", buf, 2u);
        }
      }
      else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        __47__MOEventStore_removeEvents_CompletionHandler___block_invoke_cold_1();
      }

    }
    else
    {
      v19 = 0;
    }
    objc_msgSend(v3, "reset");
    v23 = *(_QWORD *)(a1 + 32);
    if (v23)
      (*(void (**)(uint64_t, id))(v23 + 16))(v23, v19);

  }
}

- (void)purgeExpiredEventsWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  SEL v10;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventStore persistenceManager](self, "persistenceManager"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __56__MOEventStore_purgeExpiredEventsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1002AF400;
  v9 = v5;
  v10 = a2;
  v8[4] = self;
  v7 = v5;
  objc_msgSend(v6, "performBlockAndWait:", v8);

}

void __56__MOEventStore_purgeExpiredEventsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id os_log;
  NSObject *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  unsigned __int8 v25;
  id v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSString *v33;
  void *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  const __CFString *v42;
  void *v43;
  uint8_t v44[128];
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventMO fetchRequest](MOEventMO, "fetchRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "configurationManager"));
  objc_msgSend(v5, "getDoubleSettingForKey:withFallback:", CFSTR("EventManagerOverrideMaximumEventAge"), 2419200.0);
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v8, -v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("expirationDate < %@ || endDate < %@"), v10, v9));
  objc_msgSend(v4, "setPredicate:", v11);

  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v41 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v4, &v41));
  v13 = v41;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  v15 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v33 = NSStringFromSelector(*(SEL *)(a1 + 48));
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = objc_msgSend(v12, "count");
    *(_DWORD *)buf = 138413058;
    v46 = v34;
    v47 = 2112;
    v48 = v4;
    v49 = 2048;
    v50 = v35;
    v51 = 2112;
    v52 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 32), "_deleteStaleEWAEvents");
  if (v13)
  {
    v16 = *(_QWORD *)(a1 + 40);
    if (v16)
      (*(void (**)(uint64_t, id, void *))(v16 + 16))(v16, v13, &__NSDictionary0__struct);
    objc_msgSend(v3, "reset");
  }
  else
  {
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_deleteEWAForExpiredEvents:", v12);
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v17 = v12;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v38;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v38 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(v3, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v21));
            v21 = (char *)v21 + 1;
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
        }
        while (v19);
      }

      v22 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = objc_msgSend(v17, "count");
        *(_DWORD *)buf = 134217984;
        v46 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "trying to purge events count %lu", buf, 0xCu);
      }

      v36 = 0;
      v25 = objc_msgSend(v3, "save:", &v36);
      v26 = v36;
      v27 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      v29 = v28;
      if ((v25 & 1) != 0)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "saving event purge operation succeeded", buf, 2u);
        }
      }
      else if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        __56__MOEventStore_purgeExpiredEventsWithCompletionHandler___block_invoke_cold_1();
      }

    }
    else
    {
      v26 = 0;
    }
    objc_msgSend(v3, "reset");
    v30 = *(_QWORD *)(a1 + 40);
    if (v30)
    {
      v42 = CFSTR("resultNumberOfEvents");
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "count")));
      v43 = v31;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1));
      (*(void (**)(uint64_t, id, void *))(v30 + 16))(v30, v26, v32);

    }
  }

}

- (void)purgeUnknownEventsWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SEL v10;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventStore persistenceManager](self, "persistenceManager"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __56__MOEventStore_purgeUnknownEventsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1002AF428;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  objc_msgSend(v6, "performBlockAndWait:", v8);

}

void __56__MOEventStore_purgeUnknownEventsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id os_log;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  unsigned __int8 v22;
  id v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSString *v30;
  void *v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  const __CFString *v39;
  void *v40;
  uint8_t v41[128];
  uint8_t buf[4];
  id v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  _QWORD v50[2];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventMO fetchRequest](MOEventMO, "fetchRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("category == 0")));
  v50[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("provider == 0")));
  v50[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v7));
  objc_msgSend(v4, "setPredicate:", v8);

  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v38 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v4, &v38));
  v10 = v38;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v30 = NSStringFromSelector(*(SEL *)(a1 + 40));
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 138413058;
    v43 = v31;
    v44 = 2112;
    v45 = v4;
    v46 = 2048;
    v47 = v32;
    v48 = 2112;
    v49 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v10)
  {
    v13 = *(_QWORD *)(a1 + 32);
    if (v13)
      (*(void (**)(uint64_t, id, void *))(v13 + 16))(v13, v10, &__NSDictionary0__struct);
    objc_msgSend(v3, "reset");
  }
  else
  {
    if (objc_msgSend(v9, "count"))
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v14 = v9;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v35;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v35 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(v3, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v18));
            v18 = (char *)v18 + 1;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
        }
        while (v16);
      }

      v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = objc_msgSend(v14, "count");
        *(_DWORD *)buf = 134217984;
        v43 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "trying to purge unknown events count %lu", buf, 0xCu);
      }

      v33 = 0;
      v22 = objc_msgSend(v3, "save:", &v33);
      v23 = v33;
      v24 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      v26 = v25;
      if ((v22 & 1) != 0)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "saving event purge operation succeeded", buf, 2u);
        }
      }
      else if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        __56__MOEventStore_purgeExpiredEventsWithCompletionHandler___block_invoke_cold_1();
      }

    }
    else
    {
      v23 = 0;
    }
    objc_msgSend(v3, "reset");
    v27 = *(_QWORD *)(a1 + 32);
    if (v27)
    {
      v39 = CFSTR("resultNumberOfEvents");
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count")));
      v40 = v28;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
      (*(void (**)(uint64_t, id, void *))(v27 + 16))(v27, v23, v29);

    }
  }

}

- (void)purgeRehydrationFailedEventsForType:(id)a3 rehydrationFailCount:(int)a4 CompletionHandler:(id)a5
{
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  id os_log;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  MOEventStore *v17;
  void (**v18)(id, _QWORD, void *);
  SEL v19;
  int v20;
  const __CFString *v21;
  _UNKNOWN **v22;

  v9 = a3;
  v10 = (void (**)(id, _QWORD, void *))a5;
  if (a4 <= 0)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
    v13 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MOEventStore purgeRehydrationFailedEventsForType:rehydrationFailCount:CompletionHandler:].cold.1(a4, v13);

    if (v10)
    {
      v21 = CFSTR("resultNumberOfEvents");
      v22 = &off_1002D85D0;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
      v10[2](v10, 0, v14);

    }
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventStore persistenceManager](self, "persistenceManager"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __91__MOEventStore_purgeRehydrationFailedEventsForType_rehydrationFailCount_CompletionHandler___block_invoke;
    v15[3] = &unk_1002AF478;
    v20 = a4;
    v19 = a2;
    v16 = v9;
    v17 = self;
    v18 = v10;
    objc_msgSend(v11, "performBlockAndWait:", v15);

  }
}

void __91__MOEventStore_purgeRehydrationFailedEventsForType_rehydrationFailCount_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id os_log;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSString *v14;
  void *v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[6];
  _QWORD v26[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  const __CFString *v32;
  void *v33;
  _BYTE buf[24];
  uint64_t (*v35)(uint64_t, uint64_t);
  _BYTE v36[20];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventMO fetchRequest](MOEventMO, "fetchRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("rehydrationFailCount >= %d"), *(unsigned int *)(a1 + 64)));
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v31 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v4, &v31));
  v7 = v31;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v14 = NSStringFromSelector(*(SEL *)(a1 + 56));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (uint64_t (*)(uint64_t, uint64_t))objc_msgSend(v6, "count");
    v17 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2048;
    v35 = v16;
    *(_WORD *)v36 = 2112;
    *(_QWORD *)&v36[2] = v7;
    *(_WORD *)&v36[10] = 2112;
    *(_QWORD *)&v36[12] = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@ for %@", buf, 0x34u);

  }
  if (v7)
  {
    v10 = *(_QWORD *)(a1 + 48);
    if (v10)
      (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v7, &__NSDictionary0__struct);
LABEL_6:
    objc_msgSend(v3, "reset");
    goto LABEL_21;
  }
  if (!objc_msgSend(v6, "count"))
  {
    v12 = *(_QWORD *)(a1 + 48);
    if (v12)
      (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, &__NSDictionary0__struct);
    goto LABEL_6;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v35 = __Block_byref_object_copy__11;
  *(_QWORD *)v36 = __Block_byref_object_dispose__11;
  *(_QWORD *)&v36[8] = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("Sensed_event")))
  {
    v11 = *(void **)(a1 + 40);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = __91__MOEventStore_purgeRehydrationFailedEventsForType_rehydrationFailCount_CompletionHandler___block_invoke_96;
    v26[3] = &unk_1002AF450;
    v26[4] = buf;
    v26[5] = &v27;
    objc_msgSend(v11, "_deleteSensedEvents:forContext:handler:", v6, v3, v26);
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("Pattern_event")))
  {
    objc_msgSend(*(id *)(a1 + 40), "_deleteEWAOnRehydrationFailure:", v6);
    v13 = *(void **)(a1 + 40);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __91__MOEventStore_purgeRehydrationFailedEventsForType_rehydrationFailCount_CompletionHandler___block_invoke_2;
    v25[3] = &unk_1002AF450;
    v25[4] = buf;
    v25[5] = &v27;
    objc_msgSend(v13, "_deletePatternEvents:forContext:handler:", v6, v3, v25);
  }
  else
  {
    v18 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __91__MOEventStore_purgeRehydrationFailedEventsForType_rehydrationFailCount_CompletionHandler___block_invoke_cold_1(v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("MOEventStore.m"), 387, CFSTR("purgeRehydrationFailedEventsForType, Unrecognized event type for event purge (in %s:%d)"), "-[MOEventStore purgeRehydrationFailedEventsForType:rehydrationFailCount:CompletionHandler:]_block_invoke", 387);

  }
  objc_msgSend(v3, "reset");
  v21 = *(_QWORD *)(a1 + 48);
  if (v21)
  {
    v22 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    v32 = CFSTR("resultNumberOfEvents");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v28[3]));
    v33 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
    (*(void (**)(uint64_t, uint64_t, void *))(v21 + 16))(v21, v22, v24);

  }
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(buf, 8);

LABEL_21:
}

void __91__MOEventStore_purgeRehydrationFailedEventsForType_rehydrationFailCount_CompletionHandler___block_invoke_96(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v6 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;

}

void __91__MOEventStore_purgeRehydrationFailedEventsForType_rehydrationFailCount_CompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v6 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;

}

- (void)_deleteSensedEvents:(id)a3 forContext:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, id, id);
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id os_log;
  NSObject *v16;
  id v17;
  unsigned __int8 v18;
  id v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  _BYTE v30[128];

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, id, id))a5;
  if (!objc_msgSend(v7, "count"))
  {
    v19 = 0;
    if (!v9)
      goto LABEL_20;
    goto LABEL_19;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v8, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v14));
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v12);
  }

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  v16 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = objc_msgSend(v10, "count");
    *(_DWORD *)buf = 134217984;
    v29 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "purgeRehydrationFailedEventsWithCompletionHandler, trying to purge events of rehydration failed more than threshold, events count %lu", buf, 0xCu);
  }

  v23 = 0;
  v18 = objc_msgSend(v8, "save:", &v23);
  v19 = v23;
  v20 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  v22 = v21;
  if ((v18 & 1) != 0)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "purgeRehydrationFailedEventsWithCompletionHandler, saving event purge operation succeeded", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    -[MOEventStore _deleteSensedEvents:forContext:handler:].cold.1();
  }

  if (v9)
LABEL_19:
    v9[2](v9, v19, objc_msgSend(v7, "count"));
LABEL_20:

}

- (void)_deletePatternEvents:(id)a3 forContext:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id, _QWORD);
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  uint64_t v26;
  void *v27;
  void *v28;
  NSMutableArray *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *j;
  unsigned __int8 v34;
  id os_log;
  NSObject *v36;
  NSObject *v37;
  id v38;
  id v39;
  NSObject *v40;
  void *v41;
  void (**v42)(_QWORD, id, id);
  void *v43;
  id v44;
  id obj;
  uint64_t v46;
  void *v47;
  id v48;
  uint64_t v49;
  id v50;
  void *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  NSMutableArray *v55;
  id v56;
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
  id v73;
  uint8_t buf[4];
  id v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _QWORD v80[3];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id, _QWORD))a5;
  if (objc_msgSend(v8, "count"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventMO fetchRequest](MOEventMO, "fetchRequest"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("provider == %d"), 5));
    objc_msgSend(v11, "setPredicate:", v12);

    objc_msgSend(v11, "setReturnsObjectsAsFaults:", 0);
    v73 = 0;
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "executeFetchRequest:error:", v11, &v73));
    v13 = v73;
    if (v13)
    {
      v10[2](v10, v13, 0);
      v14 = 0;
    }
    else
    {
      v41 = v11;
      v42 = (void (**)(_QWORD, id, id))v10;
      v43 = v9;
      v55 = objc_opt_new(NSMutableArray);
      v80[0] = CFSTR("kEventPatternAnomalousEventIdentifier");
      v80[1] = CFSTR("kEventPatternTrendEventIdentifierList");
      v80[2] = CFSTR("kEventPatternRoutineEventIdentifierList");
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v80, 3));
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      v44 = v8;
      obj = v8;
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
      if (v48)
      {
        v46 = *(_QWORD *)v70;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v70 != v46)
              objc_enumerationMutation(obj);
            v49 = v17;
            v18 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v17);
            v65 = 0u;
            v66 = 0u;
            v67 = 0u;
            v68 = 0u;
            v50 = v47;
            v53 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
            if (v53)
            {
              v52 = *(_QWORD *)v66;
              do
              {
                v19 = 0;
                do
                {
                  if (*(_QWORD *)v66 != v52)
                    objc_enumerationMutation(v50);
                  v54 = v19;
                  v20 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v19);
                  v61 = 0u;
                  v62 = 0u;
                  v63 = 0u;
                  v64 = 0u;
                  v21 = v51;
                  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
                  if (v22)
                  {
                    v23 = v22;
                    v24 = *(_QWORD *)v62;
                    do
                    {
                      for (i = 0; i != v23; i = (char *)i + 1)
                      {
                        if (*(_QWORD *)v62 != v24)
                          objc_enumerationMutation(v21);
                        v26 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
                        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "eventIdentifier"));
                        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "patterns"));
                        LODWORD(v26) = -[MOEventStore _shouldEventBeDeleted:patternDict:forkey:](self, "_shouldEventBeDeleted:patternDict:forkey:", v27, v28, v26);

                        if ((_DWORD)v26)
                          -[NSMutableArray addObject:](v55, "addObject:", v20);
                      }
                      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
                    }
                    while (v23);
                  }

                  v19 = v54 + 1;
                }
                while ((id)(v54 + 1) != v53);
                v53 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
              }
              while (v53);
            }

            v17 = v49 + 1;
          }
          while ((id)(v49 + 1) != v48);
          v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
        }
        while (v48);
      }

      if (-[NSMutableArray count](v55, "count"))
      {
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v29 = v55;
        v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v57, v76, 16);
        v9 = v43;
        v8 = v44;
        v11 = v41;
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v58;
          do
          {
            for (j = 0; j != v31; j = (char *)j + 1)
            {
              if (*(_QWORD *)v58 != v32)
                objc_enumerationMutation(v29);
              objc_msgSend(v43, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)j));
            }
            v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v57, v76, 16);
          }
          while (v31);
        }

        v56 = 0;
        v34 = objc_msgSend(v43, "save:", &v56);
        v14 = v56;
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
        v36 = objc_claimAutoreleasedReturnValue(os_log);
        v37 = v36;
        if ((v34 & 1) != 0)
        {
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            v38 = -[NSMutableArray count](v29, "count");
            *(_DWORD *)buf = 134217984;
            v75 = v38;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "Pattern event deletion succeeded, deleted %lu", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          -[MOEventStore _deletePatternEvents:forContext:handler:].cold.1((uint64_t)v14, v29, v37);
        }

        v10 = (void (**)(id, id, _QWORD))v42;
        v42[2](v42, v14, -[NSMutableArray count](v29, "count"));
      }
      else
      {
        v39 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
        v40 = objc_claimAutoreleasedReturnValue(v39);
        v9 = v43;
        v8 = v44;
        v11 = v41;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "No pattern events deleted as count is 0", buf, 2u);
        }

        v10 = (void (**)(id, id, _QWORD))v42;
        v42[2](v42, 0, 0);
        v14 = 0;
      }

      v13 = 0;
    }

  }
  else
  {
    v15 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "No source redhydration failure, pattern events unaffected", buf, 2u);
    }

    v10[2](v10, 0, 0);
  }

}

- (BOOL)_shouldEventBeDeleted:(id)a3 patternDict:(id)a4 forkey:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id os_log;
  NSObject *v17;
  BOOL v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v9));

    if (v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v9));
      if (v12)
      {
        v13 = objc_opt_class(NSString, v11);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          v15 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID")), "initWithUUIDString:", v12);
          if (-[NSObject isEqual:](v15, "isEqual:", v7))
          {
            os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
            v17 = objc_claimAutoreleasedReturnValue(os_log);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v37 = v12;
              v38 = 2112;
              v39 = v9;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Pattern to be deleted has UUID %@ for pattern type %@", buf, 0x16u);
            }

LABEL_27:
            v18 = 1;
            goto LABEL_28;
          }
        }
        else
        {
          v19 = objc_opt_class(NSArray, v14);
          if ((objc_opt_isKindOfClass(v12, v19) & 1) != 0)
          {
            v33 = 0u;
            v34 = 0u;
            v31 = 0u;
            v32 = 0u;
            obj = v12;
            v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v32;
              while (2)
              {
                for (i = 0; i != v21; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v32 != v22)
                    objc_enumerationMutation(obj);
                  v24 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
                  v25 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID")), "initWithUUIDString:", v24);
                  if (objc_msgSend(v25, "isEqual:", v7))
                  {
                    v27 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
                    v28 = objc_claimAutoreleasedReturnValue(v27);
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412546;
                      v37 = v24;
                      v38 = 2112;
                      v39 = v9;
                      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Pattern to be deleted has UUID %@ for pattern type %@", buf, 0x16u);
                    }

                    goto LABEL_27;
                  }

                }
                v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
                if (v21)
                  continue;
                break;
              }
            }

            goto LABEL_23;
          }
          v26 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
          v15 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            -[MOEventStore _shouldEventBeDeleted:patternDict:forkey:].cold.1((uint64_t)v12, v15);
        }

      }
LABEL_23:
      v18 = 0;
LABEL_28:

      goto LABEL_29;
    }
  }
  v18 = 0;
LABEL_29:

  return v18;
}

- (void)_deleteEWAOnRehydrationFailure:(id)a3
{
  id v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  unsigned int v34;
  id os_log;
  NSObject *v36;
  _BOOL4 v37;
  const char *v38;
  id v39;
  void *v40;
  id v41;
  NSMutableArray *v42;
  NSMutableArray *obj;
  uint64_t v45;
  id v46;
  uint64_t v47;
  char v48;
  id v49;
  id v50;
  uint8_t buf[16];
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
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v61;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v61 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "category"));
        if (objc_msgSend(v11, "integerValue") == (id)16)
          goto LABEL_9;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "category"));
        if (objc_msgSend(v12, "integerValue") == (id)10)
        {

LABEL_9:
LABEL_10:
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "eventIdentifier"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString"));
          -[NSMutableArray addObject:](v4, "addObject:", v14);

          goto LABEL_11;
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "category"));
        v16 = objc_msgSend(v15, "integerValue");

        if (v16 == (id)2)
          goto LABEL_10;
LABEL_11:
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v17 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      v7 = v17;
    }
    while (v17);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventStore getEWAPlistFileURL](self, "getEWAPlistFileURL"));
  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventStore readEWAPlistFile:](self, "readEWAPlistFile:", v18));
    v20 = v19;
    if (!v19)
    {
LABEL_44:

      goto LABEL_45;
    }
    v49 = objc_msgSend(v19, "mutableCopy");
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v21 = v4;
    v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    if (v46)
    {
      v40 = v18;
      v41 = v5;
      v42 = v4;
      v48 = 0;
      obj = v21;
      v45 = *(_QWORD *)v57;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v57 != v45)
            objc_enumerationMutation(obj);
          v47 = v22;
          v23 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v22);
          v52 = 0u;
          v53 = 0u;
          v54 = 0u;
          v55 = 0u;
          v50 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allKeys"));
          v24 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v53;
            do
            {
              for (i = 0; i != v25; i = (char *)i + 1)
              {
                if (*(_QWORD *)v53 != v26)
                  objc_enumerationMutation(v50);
                v28 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
                v29 = v20;
                v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", v28));
                v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", CFSTR("EWAEventUUID")));

                if (v31)
                {
                  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("EWAEventUUID")));
                  v33 = objc_msgSend(v23, "isEqualToString:", v32);

                  if (v33)
                  {
                    objc_msgSend(v49, "removeObjectForKey:", v28);
                    v48 = 1;
                  }
                }

                v20 = v29;
              }
              v25 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
            }
            while (v25);
          }

          v22 = v47 + 1;
        }
        while ((id)(v47 + 1) != v46);
        v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
      }
      while (v46);

      v5 = v41;
      v4 = v42;
      v18 = v40;
      if ((v48 & 1) != 0)
      {
        v34 = -[MOEventStore persistEWAMetrics:withData:](self, "persistEWAMetrics:withData:", v40, v49);
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
        v36 = objc_claimAutoreleasedReturnValue(os_log);
        v37 = os_log_type_enabled(v36, OS_LOG_TYPE_INFO);
        if (!v34)
        {
          if (!v37)
            goto LABEL_43;
          *(_WORD *)buf = 0;
          v38 = "Failed updating EWA pList on rehydration failure";
          goto LABEL_42;
        }
        if (v37)
        {
          *(_WORD *)buf = 0;
          v38 = "Succesfully updated EWA pList on rehydration failure";
LABEL_42:
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, v38, buf, 2u);
          goto LABEL_43;
        }
        goto LABEL_43;
      }
    }
    else
    {

    }
    v39 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
    v36 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v38 = "No change in EWA on rehydration failure";
      goto LABEL_42;
    }
LABEL_43:

    goto LABEL_44;
  }
LABEL_45:

}

- (void)_checkWorkoutExistsInHealthDB:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_new(NSMutableArray);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v14 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v13));
        -[NSMutableArray addObject:](v8, "addObject:", v14);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v11);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuery predicateForObjectsWithUUIDs:](HKQuery, "predicateForObjectsWithUUIDs:", v15));

  v17 = objc_alloc_init((Class)NSMutableArray);
  v18 = objc_alloc((Class)HKQueryDescriptor);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[HKObjectType workoutType](HKObjectType, "workoutType"));
  v20 = objc_msgSend(v18, "initWithSampleType:predicate:", v19, v16);

  objc_msgSend(v17, "addObject:", v20);
  v21 = objc_alloc((Class)HKSampleQuery);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __54__MOEventStore__checkWorkoutExistsInHealthDB_handler___block_invoke;
  v24[3] = &unk_1002AF4A0;
  v25 = v7;
  v22 = v7;
  v23 = objc_msgSend(v21, "initWithQueryDescriptors:limit:resultsHandler:", v17, 0, v24);
  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v23);

}

void __54__MOEventStore__checkWorkoutExistsInHealthDB_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id os_log;
  NSObject *v8;

  v6 = a4;
  if (v6)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityHealth);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __54__MOEventStore__checkWorkoutExistsInHealthDB_handler___block_invoke_cold_1();

    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 1);
  }
  else
  {
    (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a3, "count") != 0);
  }

}

- (BOOL)_removeEntriesInPlist:(id)a3 forCategory:(id)a4 forURL:(id)a5
{
  id v7;
  NSMutableSet *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  NSMutableSet *v15;
  id v16;
  id v17;
  char v18;
  void *j;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *k;
  void *v26;
  void *v27;
  unsigned int v28;
  id os_log;
  NSObject *v30;
  _BOOL4 v31;
  const char *v32;
  BOOL v33;
  id v34;
  MOEventStore *v36;
  id v37;
  NSMutableSet *v38;
  id obj;
  uint64_t v40;
  id v41;
  uint8_t buf[16];
  __int128 v43;
  __int128 v44;
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
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];

  v36 = self;
  v41 = a3;
  v7 = a4;
  v37 = a5;
  v8 = objc_opt_new(NSMutableSet);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v52 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "integerValue", v36) == (id)2 || objc_msgSend(v13, "integerValue") == (id)16)
        {
          -[NSMutableSet addObject:](v8, "addObject:", CFSTR("MOEventCategoryWorkout"));
          -[NSMutableSet addObject:](v8, "addObject:", CFSTR("MOEventCategoryMotionActivity"));
        }
        if (objc_msgSend(v13, "integerValue") == (id)10)
          -[NSMutableSet addObject:](v8, "addObject:", CFSTR("MOEventCategorySignificantContact"));
        if (objc_msgSend(v13, "integerValue") == (id)1)
        {
          -[NSMutableSet addObject:](v8, "addObject:", CFSTR("MOEventCategoryProx"));
          -[NSMutableSet addObject:](v8, "addObject:", CFSTR("MOEventCategoryPeopleDensityEvent"));
          -[NSMutableSet addObject:](v8, "addObject:", CFSTR("MOEventTimeAtHomeAnomaly"));
        }
        if (objc_msgSend(v13, "integerValue") == (id)15
          || objc_msgSend(v13, "integerValue") == (id)23
          || objc_msgSend(v13, "integerValue") == (id)21)
        {
          -[NSMutableSet addObject:](v8, "addObject:", CFSTR("MOEventCategoryProx"));
          -[NSMutableSet addObject:](v8, "addObject:", CFSTR("MOEventCategoryPeopleDensityEvent"));
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v10);
  }

  v14 = objc_msgSend(v41, "mutableCopy");
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v15 = v8;
  v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v40 = *(_QWORD *)v48;
    v38 = v15;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(_QWORD *)v48 != v40)
          objc_enumerationMutation(v38);
        v20 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)j);
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "allKeys", v36));
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v44;
          do
          {
            for (k = 0; k != v23; k = (char *)k + 1)
            {
              if (*(_QWORD *)v44 != v24)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)k);
              if (objc_msgSend(v26, "hasPrefix:", v20))
              {
                objc_msgSend(v14, "removeObjectForKey:", v26);
                v18 = 1;
              }
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
          }
          while (v23);
        }

      }
      v15 = v38;
      v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    }
    while (v17);

    if ((v18 & 1) != 0)
    {
      v27 = v37;
      v28 = -[MOEventStore persistEWAMetrics:withData:](v36, "persistEWAMetrics:withData:", v37, v14);
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      v30 = objc_claimAutoreleasedReturnValue(os_log);
      v31 = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
      if (v28)
      {
        if (!v31)
        {
          v33 = 1;
          goto LABEL_47;
        }
        *(_WORD *)buf = 0;
        v32 = "EWA update on settings change successfull";
        v33 = 1;
        goto LABEL_42;
      }
      if (v31)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "EWA update on settings change failed", buf, 2u);
      }
      v33 = 0;
      goto LABEL_47;
    }
  }
  else
  {

  }
  v34 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  v30 = objc_claimAutoreleasedReturnValue(v34);
  v33 = 1;
  v27 = v37;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v32 = "No change in EWA on settings change";
LABEL_42:
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, v32, buf, 2u);
  }
LABEL_47:

  return v33;
}

- (void)_deleteStaleEWAEvents
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  char v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  id os_log;
  NSObject *v20;
  unsigned int v21;
  id v22;
  _BOOL4 v23;
  const char *v24;
  MOEventStore *v25;
  void *v26;
  id v27;
  NSObject *obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  _BYTE v35[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventStore getEWAPlistFileURL](self, "getEWAPlistFileURL"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventStore readEWAPlistFile:](self, "readEWAPlistFile:", v3));
    v5 = v4;
    if (!v4)
    {
LABEL_23:

      goto LABEL_24;
    }
    v27 = objc_msgSend(v4, "mutableCopy");
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (!v6)
      goto LABEL_21;
    v7 = v6;
    v25 = self;
    v26 = v3;
    v8 = 0;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v11, v25));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("EWAForAnomalyLastUpdateTime")));
        objc_msgSend(v13, "doubleValue");
        v15 = v14;

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        objc_msgSend(v16, "timeIntervalSinceReferenceDate");
        v18 = v17 - v15;

        if (v18 >= 31536000.0)
        {
          objc_msgSend(v27, "removeObjectForKey:", v11);
          os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
          v20 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v11;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Removing %@ entries in EWA as it is stale", buf, 0xCu);
          }

          v8 = 1;
        }

      }
      v7 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v7);

    v3 = v26;
    if ((v8 & 1) == 0)
      goto LABEL_22;
    v21 = -[MOEventStore persistEWAMetrics:withData:](v25, "persistEWAMetrics:withData:", v26, v27);
    v22 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
    obj = objc_claimAutoreleasedReturnValue(v22);
    v23 = os_log_type_enabled(obj, OS_LOG_TYPE_INFO);
    if (v21)
    {
      if (v23)
      {
        *(_WORD *)buf = 0;
        v24 = "EWA pList succesfully updated by removing stale entries";
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, obj, OS_LOG_TYPE_INFO, v24, buf, 2u);
      }
    }
    else if (v23)
    {
      *(_WORD *)buf = 0;
      v24 = "EWA pList update failed while removing stale entries";
      goto LABEL_20;
    }
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
LABEL_24:

}

- (void)_deleteEWAForExpiredEvents:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *j;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *k;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  id os_log;
  NSObject *v37;
  id v38;
  NSObject *v39;
  const char *v40;
  id v41;
  id v42;
  uint64_t v43;
  MOEventStore *v44;
  id obj;
  uint64_t v46;
  id v47;
  void *i;
  id v49;
  id v50;
  id v51;
  NSObject *v52;
  uint8_t buf[16];
  _QWORD v54[4];
  id v55;
  void *v56;
  NSObject *v57;
  uint64_t *v58;
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
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  char v74;
  void *v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];

  v42 = a3;
  v44 = self;
  v43 = objc_claimAutoreleasedReturnValue(-[MOEventStore getEWAPlistFileURL](self, "getEWAPlistFileURL"));
  v4 = (void *)v43;
  if (!v43)
    goto LABEL_51;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventStore readEWAPlistFile:](self, "readEWAPlistFile:"));
  v50 = v5;
  if (!v5)
    goto LABEL_50;
  v49 = objc_msgSend(v5, "mutableCopy");
  v71 = 0;
  v72 = &v71;
  v73 = 0x2020000000;
  v74 = 0;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v42;
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
  if (!v47)
    goto LABEL_25;
  v46 = *(_QWORD *)v68;
  do
  {
    for (i = 0; i != v47; i = (char *)i + 1)
    {
      if (*(_QWORD *)v68 != v46)
        objc_enumerationMutation(obj);
      v6 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)i);
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "allKeys"));
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v64;
        v51 = v7;
        do
        {
          for (j = 0; j != v8; j = (char *)j + 1)
          {
            if (*(_QWORD *)v64 != v9)
              objc_enumerationMutation(v51);
            v11 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)j);
            if ((objc_msgSend(v11, "hasPrefix:", CFSTR("MOEventCategoryWorkout")) & 1) == 0)
            {
              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "category"));
              if (objc_msgSend(v12, "integerValue") == (id)16)
              {

              }
              else
              {
                v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "category"));
                v14 = objc_msgSend(v13, "integerValue") == (id)10;

                if (!v14)
                  continue;
              }
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", v11));
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("EWAEventUUID")));

              if (v16)
              {
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "eventIdentifier"));
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUIDString"));
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("EWAEventUUID")));
                v20 = objc_msgSend(v18, "isEqualToString:", v19);

                if (v20)
                {
                  objc_msgSend(v49, "removeObjectForKey:", v11);
                  *((_BYTE *)v72 + 24) = 1;
                }
              }

            }
          }
          v7 = v51;
          v8 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
        }
        while (v8);
      }

    }
    v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
  }
  while (v47);
LABEL_25:

  v52 = dispatch_group_create();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "allKeys"));
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v59, v76, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v60;
    do
    {
      for (k = 0; k != v22; k = (char *)k + 1)
      {
        if (*(_QWORD *)v60 != v23)
          objc_enumerationMutation(v21);
        v25 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)k);
        if ((objc_msgSend(v25, "hasPrefix:", CFSTR("MOEventCategoryWorkout")) & 1) != 0)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", v25));
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          objc_msgSend(v27, "timeIntervalSinceReferenceDate");
          v29 = v28;
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("EWAForAnomalyLastUpdateTime")));
          objc_msgSend(v30, "doubleValue");
          v32 = v31;

          if (v29 - v32 > 2419200.0)
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKey:", CFSTR("EWAEventProviderUUID"), v29 - v32));

            if (v33)
            {
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("EWAEventProviderUUID")));
              v75 = v34;
              v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v75, 1));

              dispatch_group_enter(v52);
              v54[0] = _NSConcreteStackBlock;
              v54[1] = 3221225472;
              v54[2] = __43__MOEventStore__deleteEWAForExpiredEvents___block_invoke;
              v54[3] = &unk_1002AF4C8;
              v55 = v49;
              v56 = v25;
              v58 = &v71;
              v57 = v52;
              -[MOEventStore _checkWorkoutExistsInHealthDB:handler:](v44, "_checkWorkoutExistsInHealthDB:handler:", v35, v54);

            }
          }

        }
      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v59, v76, 16);
    }
    while (v22);
  }

  if ((MODispatchGroupWait(v52, 0xFFFFFFFFFFFFFFFFLL, CFSTR("deleteEWAForExpiredEvents")) & 1) == 0)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
    v37 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      -[MOEventStore _deleteEWAForExpiredEvents:].cold.1();

  }
  if (*((_BYTE *)v72 + 24))
  {
    if (-[MOEventStore persistEWAMetrics:withData:](v44, "persistEWAMetrics:withData:", v43, v49))
    {
      v38 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v40 = "EWA pList succesfully updated by removing expired events";
        goto LABEL_47;
      }
    }
    else
    {
      v41 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      v39 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v40 = "EWA pList update failed while removing expired events";
LABEL_47:
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, v40, buf, 2u);
      }
    }

  }
  _Block_object_dispose(&v71, 8);

  v5 = v50;
LABEL_50:

  v4 = (void *)v43;
LABEL_51:

}

void __43__MOEventStore__deleteEWAForExpiredEvents___block_invoke(uint64_t a1, char a2)
{
  id os_log;
  NSObject *v4;
  uint8_t v5[16];

  if ((a2 & 1) == 0)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
    v4 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Workout EWA deleted or not present in health DB", v5, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)purgeVisitEventsBeforeDate:(id)a3 WithCompletionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  MOEventStore *v14;
  id v15;
  SEL v16;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventStore persistenceManager](self, "persistenceManager"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __65__MOEventStore_purgeVisitEventsBeforeDate_WithCompletionHandler___block_invoke;
  v12[3] = &unk_1002AF4F0;
  v13 = v7;
  v14 = self;
  v15 = v8;
  v16 = a2;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "performBlockAndWait:", v12);

}

void __65__MOEventStore_purgeVisitEventsBeforeDate_WithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id os_log;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  const char *v17;
  id v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  id v27;
  NSObject *v28;
  id v29;
  unsigned __int8 v30;
  id v31;
  id v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSString *v39;
  void *v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  const __CFString *v48;
  void *v49;
  uint8_t v50[128];
  uint8_t buf[4];
  id v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventMO fetchRequest](MOEventMO, "fetchRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("startDate < %@ AND category == %lu"), *(_QWORD *)(a1 + 32), 1));
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v47 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v4, &v47));
  v7 = v47;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v39 = NSStringFromSelector(*(SEL *)(a1 + 56));
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    v41 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 138413058;
    v52 = v40;
    v53 = 2112;
    v54 = v4;
    v55 = 2048;
    v56 = v41;
    v57 = 2112;
    v58 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (objc_msgSend(v6, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1002D8600, 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "getEWAPlistFileURL"));
    if (!v11)
    {
LABEL_16:

      goto LABEL_17;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "readEWAPlistFile:", v11));
    if (v12)
    {
      v13 = objc_msgSend(*(id *)(a1 + 40), "_removeEntriesInPlist:forCategory:forURL:", v12, v10, v11);
      v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
      if (v13)
      {
        if (v16)
        {
          *(_DWORD *)buf = 138412290;
          v52 = v10;
          v17 = "Succesfully updated EWA pList for purgeVisitEventsBeforeDate, categories %@";
LABEL_13:
          v19 = v15;
          v20 = 12;
          goto LABEL_14;
        }
      }
      else if (v16)
      {
        *(_DWORD *)buf = 138412290;
        v52 = v10;
        v17 = "Failed updating EWA pList for purgeVisitEventsBeforeDate, categories %@";
        goto LABEL_13;
      }
    }
    else
    {
      v18 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      v15 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v17 = "Fail to read EWA pList for for purgeVisitEventsBeforeDate";
        v19 = v15;
        v20 = 2;
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, v17, buf, v20);
      }
    }

    goto LABEL_16;
  }
LABEL_17:
  if (v7)
  {
    v21 = *(_QWORD *)(a1 + 48);
    if (v21)
      (*(void (**)(uint64_t, id, void *))(v21 + 16))(v21, v7, &__NSDictionary0__struct);
    objc_msgSend(v3, "reset");
  }
  else
  {
    if (objc_msgSend(v6, "count"))
    {
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v22 = v6;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(_QWORD *)v44 != v25)
              objc_enumerationMutation(v22);
            objc_msgSend(v3, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i));
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
        }
        while (v24);
      }

      v27 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = objc_msgSend(v22, "count");
        *(_DWORD *)buf = 134217984;
        v52 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "purgeVisitEventsBeforeDate trying to purge events count %lu", buf, 0xCu);
      }

      v42 = 0;
      v30 = objc_msgSend(v3, "save:", &v42);
      v31 = v42;
      v32 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      v33 = objc_claimAutoreleasedReturnValue(v32);
      v34 = v33;
      if ((v30 & 1) != 0)
      {
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          v35 = objc_msgSend(v22, "count");
          *(_DWORD *)buf = 134217984;
          v52 = v35;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "purgeVisitEventsBeforeDate succeeded with event count %lu", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        __65__MOEventStore_purgeVisitEventsBeforeDate_WithCompletionHandler___block_invoke_cold_1();
      }

    }
    else
    {
      v31 = 0;
    }
    objc_msgSend(v3, "reset");
    v36 = *(_QWORD *)(a1 + 48);
    if (v36)
    {
      v48 = CFSTR("resultNumberOfEvents");
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count")));
      v49 = v37;
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));
      (*(void (**)(uint64_t, id, void *))(v36 + 16))(v36, v31, v38);

    }
  }

}

- (void)fetchAllEventsWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SEL v10;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventStore persistenceManager](self, "persistenceManager"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __52__MOEventStore_fetchAllEventsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1002AF428;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  objc_msgSend(v6, "performBlockAndWait:", v8);

}

void __52__MOEventStore_fetchAllEventsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id os_log;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  MOEvent *v15;
  NSString *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventMO fetchRequest](MOEventMO, "fetchRequest"));
  v25 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v4, &v25));
  v6 = v25;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v16 = NSStringFromSelector(*(SEL *)(a1 + 40));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 138413058;
    v28 = v17;
    v29 = 2112;
    v30 = v4;
    v31 = 2048;
    v32 = v18;
    v33 = 2112;
    v34 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v6)
  {
    v9 = 0;
  }
  else
  {
    v20 = a1;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count")));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v19 = v5;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = -[MOEvent initWithEventMO:]([MOEvent alloc], "initWithEventMO:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v14));
          if (v15)
            objc_msgSend(v9, "addObject:", v15);

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v12);
    }

    v5 = v19;
    a1 = v20;
  }
  objc_msgSend(v3, "reset", v19);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchLastEventOfCategory:(unint64_t)a3 CompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = objc_alloc((Class)NSSet);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v9 = objc_msgSend(v7, "initWithObjects:", v8, 0);

  -[MOEventStore fetchLastEventOfCategories:CompletionHandler:](self, "fetchLastEventOfCategories:CompletionHandler:", v9, v6);
}

- (void)fetchLastEventOfCategories:(id)a3 CompletionHandler:(id)a4
{
  -[MOEventStore fetchLastEventOfCategories:isHighConfidenceOnly:CompletionHandler:](self, "fetchLastEventOfCategories:isHighConfidenceOnly:CompletionHandler:", a3, 0, a4);
}

- (void)fetchLastEventOfCategories:(id)a3 isHighConfidenceOnly:(BOOL)a4 CompletionHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  SEL v17;
  BOOL v18;

  v9 = a3;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventStore persistenceManager](self, "persistenceManager"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __82__MOEventStore_fetchLastEventOfCategories_isHighConfidenceOnly_CompletionHandler___block_invoke;
  v14[3] = &unk_1002AF518;
  v18 = a4;
  v16 = v10;
  v17 = a2;
  v15 = v9;
  v12 = v10;
  v13 = v9;
  objc_msgSend(v11, "performBlockAndWait:", v14);

}

void __82__MOEventStore_fetchLastEventOfCategories_isHighConfidenceOnly_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id os_log;
  NSObject *v12;
  MOEvent *v13;
  void *v14;
  NSString *v15;
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  id v27;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventMO fetchRequest](MOEventMO, "fetchRequest"));
  if (*(_BYTE *)(a1 + 56))
    v5 = CFSTR("category IN %@ AND isInvalid == NO AND isHighConfidence == YES");
  else
    v5 = CFSTR("category IN %@ AND isInvalid == NO");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v5, *(_QWORD *)(a1 + 32)));
  objc_msgSend(v4, "setPredicate:", v6);

  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v7 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 0);
  v27 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
  objc_msgSend(v4, "setSortDescriptors:", v8);

  objc_msgSend(v4, "setFetchLimit:", 1);
  v18 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v4, &v18));
  v10 = v18;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v15 = NSStringFromSelector(*(SEL *)(a1 + 48));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 138413058;
    v20 = v16;
    v21 = 2112;
    v22 = v4;
    v23 = 2048;
    v24 = v17;
    v25 = 2112;
    v26 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  v13 = 0;
  if (objc_msgSend(v9, "count") && !v10)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
    v13 = -[MOEvent initWithEventMO:]([MOEvent alloc], "initWithEventMO:", v14);

  }
  objc_msgSend(v3, "reset");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchEventsWithStartDateAfter:(id)a3 Category:(unint64_t)a4 CompletionHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  unint64_t v17;
  SEL v18;

  v9 = a3;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventStore persistenceManager](self, "persistenceManager"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __73__MOEventStore_fetchEventsWithStartDateAfter_Category_CompletionHandler___block_invoke;
  v14[3] = &unk_1002AF540;
  v17 = a4;
  v18 = a2;
  v15 = v9;
  v16 = v10;
  v12 = v10;
  v13 = v9;
  objc_msgSend(v11, "performBlockAndWait:", v14);

}

void __73__MOEventStore_fetchEventsWithStartDateAfter_Category_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id os_log;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  MOEvent *v18;
  NSString *v19;
  void *v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  id v37;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventMO fetchRequest](MOEventMO, "fetchRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("startDate >= %@ AND category == %lu AND isInvalid == NO"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48)));
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v6 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
  v37 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v37, 1));
  objc_msgSend(v4, "setSortDescriptors:", v7);

  v27 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v4, &v27));
  v9 = v27;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v19 = NSStringFromSelector(*(SEL *)(a1 + 56));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = objc_msgSend(v8, "count");
    *(_DWORD *)buf = 138413058;
    v30 = v20;
    v31 = 2112;
    v32 = v4;
    v33 = 2048;
    v34 = v21;
    v35 = 2112;
    v36 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v9)
  {
    v12 = 0;
  }
  else
  {
    v22 = v3;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v8, "count")));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          v18 = -[MOEvent initWithEventMO:]([MOEvent alloc], "initWithEventMO:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i));
          if (v18)
            objc_msgSend(v12, "addObject:", v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v15);
    }

    v3 = v22;
  }
  objc_msgSend(v3, "reset");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchEventsWithOptions:(id)a3 CompletionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventStore persistenceManager](self, "persistenceManager"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __57__MOEventStore_fetchEventsWithOptions_CompletionHandler___block_invoke;
  v12[3] = &unk_1002AF400;
  v14 = v8;
  v15 = a2;
  v13 = v7;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "performBlockAndWait:", v12);

}

void __57__MOEventStore_fetchEventsWithOptions_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  id v20;
  void *v21;
  void *v22;
  id v23;
  id os_log;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  MOEvent *v34;
  uint64_t v35;
  NSString *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  uint8_t v46[128];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  id v55;
  _QWORD v56[2];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventMO fetchRequest](MOEventMO, "fetchRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dateInterval"));

  v39 = v4;
  v40 = v3;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dateInterval"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("startDate <= %@"), v8));
    v56[0] = v9;
    v10 = v5;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dateInterval"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("endDate >= %@"), v12));
    v56[1] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v56, 2));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v14));
    objc_msgSend(v10, "addObject:", v15);

    v5 = v10;
    v4 = v39;

    v3 = v40;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "category"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("category == %lu"), objc_msgSend(*(id *)(a1 + 32), "category")));
    objc_msgSend(v5, "addObject:", v16);

  }
  if (objc_msgSend(v5, "count"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v5));
    objc_msgSend(v4, "setPredicate:", v17);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "limit"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "limit"));
    objc_msgSend(v4, "setFetchLimit:", objc_msgSend(v19, "unsignedIntegerValue"));

  }
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v20 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), objc_msgSend(*(id *)(a1 + 32), "ascending"));
  v55 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v55, 1));
  objc_msgSend(v4, "setSortDescriptors:", v21);

  objc_msgSend(v4, "setFetchBatchSize:", 100);
  v45 = 0;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v4, &v45));
  v23 = v45;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  v25 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    v36 = NSStringFromSelector(*(SEL *)(a1 + 48));
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    v38 = objc_msgSend(v22, "count");
    *(_DWORD *)buf = 138413058;
    v48 = v37;
    v49 = 2112;
    v50 = v4;
    v51 = 2048;
    v52 = v38;
    v53 = 2112;
    v54 = v23;
    _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v23)
  {
    objc_msgSend(v3, "reset");
    v26 = *(_QWORD *)(a1 + 40);
    if (v26)
      (*(void (**)(uint64_t, void *, id))(v26 + 16))(v26, &__NSArray0__struct, v23);
    v27 = 0;
  }
  else
  {
    v28 = v5;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v22, "count")));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v29 = v22;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(_QWORD *)v42 != v32)
            objc_enumerationMutation(v29);
          v34 = -[MOEvent initWithEventMO:]([MOEvent alloc], "initWithEventMO:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i));
          if (v34)
            objc_msgSend(v27, "addObject:", v34);

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v31);
    }

    v3 = v40;
    objc_msgSend(v40, "reset");
    v35 = *(_QWORD *)(a1 + 40);
    if (v35)
      (*(void (**)(uint64_t, void *, _QWORD))(v35 + 16))(v35, v27, 0);
    v5 = v28;
    v4 = v39;
    v23 = 0;
  }

}

- (void)fetchAnalyticsEventsWithOptions:(id)a3 CompletionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventStore persistenceManager](self, "persistenceManager"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __66__MOEventStore_fetchAnalyticsEventsWithOptions_CompletionHandler___block_invoke;
  v12[3] = &unk_1002AF400;
  v14 = v8;
  v15 = a2;
  v13 = v7;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "performBlockAndWait:", v12);

}

void __66__MOEventStore_fetchAnalyticsEventsWithOptions_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  id v21;
  void *v22;
  void *v23;
  id v24;
  id os_log;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  MOEvent *v34;
  uint64_t v35;
  NSString *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  uint8_t v47[128];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  id v56;
  _QWORD v57[2];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventMO fetchRequest](MOEventMO, "fetchRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("provider == %lu"), 5));
  objc_msgSend(v5, "addObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dateInterval"));
  v40 = v4;
  v41 = v3;
  if (v7)
  {
    v8 = v5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dateInterval"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("startDate <= %@"), v10));
    v57[0] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dateInterval"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startDate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("endDate >= %@"), v13));
    v57[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v57, 2));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v15));
    objc_msgSend(v8, "addObject:", v16);

    v5 = v8;
    v3 = v41;

    v4 = v40;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "category"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("category == %lu"), objc_msgSend(*(id *)(a1 + 32), "category")));
    objc_msgSend(v5, "addObject:", v17);

  }
  if (objc_msgSend(v5, "count"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v5));
    objc_msgSend(v4, "setPredicate:", v18);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "limit"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "limit"));
    objc_msgSend(v4, "setFetchLimit:", objc_msgSend(v20, "unsignedIntegerValue"));

  }
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v21 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), objc_msgSend(*(id *)(a1 + 32), "ascending"));
  v56 = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v56, 1));
  objc_msgSend(v4, "setSortDescriptors:", v22);

  objc_msgSend(v4, "setFetchBatchSize:", 100);
  v46 = 0;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v4, &v46));
  v24 = v46;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  v26 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v36 = NSStringFromSelector(*(SEL *)(a1 + 48));
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    v38 = objc_msgSend(v23, "count");
    *(_DWORD *)buf = 138413058;
    v49 = v37;
    v50 = 2112;
    v51 = v4;
    v52 = 2048;
    v53 = v38;
    v54 = 2112;
    v55 = v24;
    _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v24)
  {
    v27 = *(_QWORD *)(a1 + 40);
    if (v27)
      (*(void (**)(uint64_t, void *, id))(v27 + 16))(v27, &__NSArray0__struct, v24);
    v28 = 0;
  }
  else
  {
    v39 = v5;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v23, "count")));
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v29 = v23;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(_QWORD *)v43 != v32)
            objc_enumerationMutation(v29);
          v34 = -[MOEvent initWithEventMO:]([MOEvent alloc], "initWithEventMO:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i));
          if (v34)
            objc_msgSend(v28, "addObject:", v34);

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v31);
    }

    v35 = *(_QWORD *)(a1 + 40);
    if (v35)
      (*(void (**)(uint64_t, void *, _QWORD))(v35 + 16))(v35, v28, 0);
    v4 = v40;
    v3 = v41;
    v5 = v39;
  }

}

- (id)getEWAPlistFileURL
{
  void *v2;
  void *v3;
  void *v4;
  id os_log;
  NSObject *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MOPersistenceManager userCacheDirectoryPath](MOPersistenceManager, "userCacheDirectoryPath"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v2, 1));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("EWAForAnomaly.plist")));

  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityStreamingPatternDetection);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MOEventStore getEWAPlistFileURL].cold.1();

    v4 = 0;
  }

  return v4;
}

- (id)_readEWAPlistFilePrivate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  uint8_t v16[8];
  id v17;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityStreamingPatternDetection);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[MOEventStore _readEWAPlistFilePrivate:].cold.2(v9);

    v17 = 0;
    v10 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfURL:error:", v3, &v17);
    v11 = v17;
    if (v11)
    {
      v12 = _mo_log_facility_get_os_log(&MOLogFacilityStreamingPatternDetection);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[MOEventStore _readEWAPlistFilePrivate:].cold.1();

      v14 = 0;
    }
    else
    {
      v14 = v10;
    }

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "No anomaly EWA persistence plist found at path.", v16, 2u);
    }

    v14 = objc_alloc_init((Class)NSDictionary);
  }

  return v14;
}

- (id)readEWAPlistFile:(id)a3
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
  v15 = __Block_byref_object_copy__11;
  v16 = __Block_byref_object_dispose__11;
  v17 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[MOEventStore queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __33__MOEventStore_readEWAPlistFile___block_invoke;
  block[3] = &unk_1002AF568;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __33__MOEventStore_readEWAPlistFile___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_readEWAPlistFilePrivate:", *(_QWORD *)(a1 + 40)));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)_persistEWAMetricsPrivate:(id)a3 withData:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  BOOL v13;
  unsigned __int8 v14;
  id os_log;
  NSObject *v16;
  __int16 v18[8];
  id v19;
  id v20;

  v5 = a3;
  if (v5)
  {
    v20 = 0;
    v6 = objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", a4, 100, 0, &v20));
    v7 = v20;
    if (v6)
      v8 = v7 == 0;
    else
      v8 = 0;
    if (v8)
    {
      v19 = 0;
      v14 = -[NSObject writeToURL:options:error:](v6, "writeToURL:options:error:", v5, 805306369, &v19);
      v9 = v19;
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityStreamingPatternDetection);
      v16 = objc_claimAutoreleasedReturnValue(os_log);
      v11 = v16;
      if (!v9 && (v14 & 1) != 0)
      {
        v13 = 1;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v18[0] = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Anomaly EWA persistence was successfully written to plist.", (uint8_t *)v18, 2u);
        }
        v9 = v11;
        goto LABEL_19;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[MOEventStore _persistEWAMetricsPrivate:withData:].cold.3();
    }
    else
    {
      v9 = v7;
      v10 = _mo_log_facility_get_os_log(&MOLogFacilityStreamingPatternDetection);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[MOEventStore _persistEWAMetricsPrivate:withData:].cold.2();
    }

    v13 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v12 = _mo_log_facility_get_os_log(&MOLogFacilityStreamingPatternDetection);
  v6 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MOEventStore _persistEWAMetricsPrivate:withData:].cold.1();
  v13 = 0;
LABEL_20:

  return v13;
}

- (BOOL)persistEWAMetrics:(id)a3 withData:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v8 = objc_claimAutoreleasedReturnValue(-[MOEventStore queue](self, "queue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __43__MOEventStore_persistEWAMetrics_withData___block_invoke;
  v12[3] = &unk_1002AF590;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = &v16;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, v12);

  LOBYTE(v8) = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return (char)v8;
}

id __43__MOEventStore_persistEWAMetrics_withData___block_invoke(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "_persistEWAMetricsPrivate:withData:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (_BYTE)result;
  return result;
}

- (MOPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceManager, a3);
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (MOEventPatternManager)patternManager
{
  return self->_patternManager;
}

- (void)setPatternManager:(id)a3
{
  objc_storeStrong((id *)&self->_patternManager, a3);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_patternManager, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
}

- (void)initWithUniverse:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: persistenceManager", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __45__MOEventStore_storeEvent_CompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__MOEventStore_storeEvents_CompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving events error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __47__MOEventStore_removeEvents_CompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving event deletion operation error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__MOEventStore_purgeExpiredEventsWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving event purge operation error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)purgeRehydrationFailedEventsForType:(int)a1 rehydrationFailCount:(NSObject *)a2 CompletionHandler:.cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "requested invalid maxRehydrationFailCount value %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_2_2();
}

void __91__MOEventStore_purgeRehydrationFailedEventsForType_rehydrationFailCount_CompletionHandler___block_invoke_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  v1 = 136315394;
  v2 = "-[MOEventStore purgeRehydrationFailedEventsForType:rehydrationFailCount:CompletionHandler:]_block_invoke_3";
  v3 = 1024;
  v4 = 387;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "purgeRehydrationFailedEventsForType, Unrecognized event type for event purge (in %s:%d)", (uint8_t *)&v1, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)_deleteSensedEvents:forContext:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "purgeRehydrationFailedEventsWithCompletionHandler, saving event purge operation error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deletePatternEvents:(uint64_t)a1 forContext:(void *)a2 handler:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  id v7;

  v4 = 138412546;
  v5 = a1;
  v6 = 2048;
  v7 = objc_msgSend(a2, "count");
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Pattern event deletion failed with error  %@, num events %ld", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_5();
}

- (void)_shouldEventBeDeleted:(uint64_t)a1 patternDict:(NSObject *)a2 forkey:.cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  uint8_t v6[24];

  v3 = (objc_class *)objc_opt_class(a1, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  OUTLINED_FUNCTION_2();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Pattern dict belongs to %@ class", v6, 0xCu);

  OUTLINED_FUNCTION_5();
}

void __54__MOEventStore__checkWorkoutExistsInHealthDB_handler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetch health data hit error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deleteEWAForExpiredEvents:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_5_0();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "HealthKit queries timed out", v1, 2u);
  OUTLINED_FUNCTION_2_2();
}

void __65__MOEventStore_purgeVisitEventsBeforeDate_WithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "purgeVisitEventsBeforeDate hit error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getEWAPlistFileURL
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Failed to get cache directory to store anomaly EWA persistence plist file, nil cache directory.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_readEWAPlistFilePrivate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Could not read the anomaly EWA persistence plist file, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_readEWAPlistFilePrivate:(os_log_t)log .cold.2(os_log_t log)
{
  int v1;
  const __CFString *v2;

  v1 = 138412290;
  v2 = CFSTR("EWAForAnomaly.plist");
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "File %@ found.", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_persistEWAMetricsPrivate:withData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid path for anomaly EWA persistence plist file.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_persistEWAMetricsPrivate:withData:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Anomaly EWA persistence serialization to NSData failed or returned nil, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_persistEWAMetricsPrivate:withData:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Couldn't write to the anomaly EWA persistence plist file, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
