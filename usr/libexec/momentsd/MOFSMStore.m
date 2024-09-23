@implementation MOFSMStore

- (MOFSMStore)initWithUniverse:(id)a3
{
  id v4;
  uint64_t v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  MOFSMStore *v15;

  v4 = a3;
  v6 = (objc_class *)objc_opt_class(MOPersistenceManager, v5);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v8));

  v11 = (objc_class *)objc_opt_class(MOConfigurationManager, v10);
  v12 = NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v13));

  v15 = -[MOFSMStore initWithPersistenceManager:andConfigurationManager:](self, "initWithPersistenceManager:andConfigurationManager:", v9, v14);
  return v15;
}

- (MOFSMStore)initWithPersistenceManager:(id)a3 andConfigurationManager:(id)a4
{
  id v8;
  id v9;
  MOFSMStore *v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  MOFSMStore *v15;
  id os_log;
  NSObject *v17;
  void *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v20.receiver = self;
    v20.super_class = (Class)MOFSMStore;
    v10 = -[MOFSMStore init](&v20, "init");
    if (v10)
    {
      v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      v13 = dispatch_queue_create("MOFSMStore", v12);
      queue = v10->_queue;
      v10->_queue = (OS_dispatch_queue *)v13;

      objc_storeStrong((id *)&v10->_persistenceManager, a3);
      objc_storeStrong((id *)&v10->_configurationManager, a4);
    }
    self = v10;
    v15 = self;
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MOFSMStore initWithPersistenceManager:andConfigurationManager:].cold.1(v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOFSMStore.m"), 33, CFSTR("Invalid parameter not satisfying: persistenceManager"));

    v15 = 0;
  }

  return v15;
}

- (void)fetchFSMWithName:(id)a3 CompletionHandler:(id)a4
{
  id v7;
  void (**v8)(id, uint64_t, uint64_t);
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  SEL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v7 = a3;
  v8 = (void (**)(id, uint64_t, uint64_t))a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__26;
  v26 = __Block_byref_object_dispose__26;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__26;
  v20 = __Block_byref_object_dispose__26;
  v21 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSMStore persistenceManager](self, "persistenceManager"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __49__MOFSMStore_fetchFSMWithName_CompletionHandler___block_invoke;
  v11[3] = &unk_1002B3900;
  v10 = v7;
  v12 = v10;
  v13 = &v22;
  v14 = &v16;
  v15 = a2;
  objc_msgSend(v9, "performBlockAndWait:", v11);

  v8[2](v8, v17[5], v23[5]);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
}

void __49__MOFSMStore_fetchFSMWithName_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id os_log;
  NSObject *v13;
  MOFSM *v14;
  void *v15;
  MOFSM *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  NSString *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id obj;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  uint64_t v34;
  id v35;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOFSMMO fetchRequest](MOFSMMO, "fetchRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("name == %@ "), *(_QWORD *)(a1 + 32)));
  objc_msgSend(v5, "addObject:", v6);

  if (objc_msgSend(v5, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v5));
    objc_msgSend(v4, "setPredicate:", v7);

  }
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v8 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("lastProcessedDate"), 0);
  v35 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1));
  objc_msgSend(v4, "setSortDescriptors:", v9);

  objc_msgSend(v4, "setFetchBatchSize:", 1);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v10 + 40);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v4, &obj));
  objc_storeStrong((id *)(v10 + 40), obj);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  v13 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v22 = NSStringFromSelector(*(SEL *)(a1 + 56));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = objc_msgSend(v11, "count");
    v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    v28 = v23;
    v29 = 2112;
    v30 = v4;
    v31 = 2048;
    v32 = v24;
    v33 = 2112;
    v34 = v25;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v14 = [MOFSM alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
    v16 = -[MOFSM initWithFSMMO:](v14, "initWithFSMMO:", v15);
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v28 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "fetched fsm from store :%@", buf, 0xCu);
    }

  }
  objc_msgSend(v3, "reset");

}

- (void)updateFSM:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__26;
  v17 = __Block_byref_object_dispose__26;
  v18 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSMStore persistenceManager](self, "persistenceManager"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __42__MOFSMStore_updateFSM_completionHandler___block_invoke;
  v10[3] = &unk_1002B3928;
  v9 = v6;
  v11 = v9;
  v12 = &v13;
  objc_msgSend(v8, "performBlockAndWait:", v10);

  if (v7)
    v7[2](v7, v14[5], &__NSDictionary0__struct);

  _Block_object_dispose(&v13, 8);
}

void __42__MOFSMStore_updateFSM_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id os_log;
  NSObject *v33;
  uint64_t v34;
  id obj;
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  NSErrorUserInfoKey v39;
  const __CFString *v40;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOFSMMO fetchRequest](MOFSMMO, "fetchRequest"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("name == %@"), v5));
    objc_msgSend(v4, "setPredicate:", v6);

    v36 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v4, &v36));
    v8 = v36;
    if (!v8
      && objc_msgSend(v7, "count")
      && (v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"))) != 0)
    {
      v31 = (void *)v30;
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      v33 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        v34 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v38 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "update fsm, %@", buf, 0xCu);
      }

      +[MOFSMMO setPropertiesOfFSMMO:withFSM:](MOFSMMO, "setPropertiesOfFSMMO:withFSM:", v31, *(_QWORD *)(a1 + 32));
    }
    else
    {
      v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v38 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "save fsm, %@", buf, 0xCu);
      }

      v12 = +[MOFSMMO managedObjectWithObject:inManagedObjectContext:](MOFSMMO, "managedObjectWithObject:inManagedObjectContext:", *(_QWORD *)(a1 + 32), v3);
    }
    v14 = *(_QWORD *)(a1 + 40);
    v13 = a1 + 40;
    v15 = *(_QWORD *)(v14 + 8);
    obj = *(id *)(v15 + 40);
    v16 = objc_msgSend(v3, "save:", &obj);
    objc_storeStrong((id *)(v15 + 40), obj);
    v17 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = v18;
    if ((v16 & 1) != 0)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "saving fsm succeeded", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __42__MOFSMStore_updateFSM_completionHandler___block_invoke_cold_1(v13, v19, v24, v25, v26, v27, v28, v29);
    }

    objc_msgSend(v3, "reset");
  }
  else
  {
    v20 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "no fsm to be saved", buf, 2u);
    }

    v39 = NSDebugDescriptionErrorKey;
    v40 = CFSTR("No FSM passed.");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
    v22 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 2, v4));
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(id *)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;
  }

}

- (void)removeAllFSMsWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SEL v10;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSMStore persistenceManager](self, "persistenceManager"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __49__MOFSMStore_removeAllFSMsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1002AF428;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  objc_msgSend(v6, "performBlockAndWait:", v8);

}

void __49__MOFSMStore_removeAllFSMsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSString *v30;
  void *v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  uint8_t v39[128];
  uint8_t buf[4];
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOFSMMO fetchRequest](MOFSMMO, "fetchRequest"));
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v38 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v4, &v38));
  v6 = v38;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v30 = NSStringFromSelector(*(SEL *)(a1 + 40));
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 138413058;
    v41 = v31;
    v42 = 2112;
    v43 = v4;
    v44 = 2048;
    v45 = v32;
    v46 = 2112;
    v47 = v6;
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
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v10 = v5;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v35;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v35 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(v3, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v14));
            v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        }
        while (v12);
      }

      v15 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = objc_msgSend(v10, "count");
        *(_DWORD *)buf = 134217984;
        v41 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "trying to remove fsm count %lu", buf, 0xCu);
      }

      v33 = 0;
      v18 = objc_msgSend(v3, "save:", &v33);
      v19 = v33;
      v20 = _mo_log_facility_get_os_log(&MOLogFacilityEventStore);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      v22 = v21;
      if ((v18 & 1) != 0)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "saving fsm deletion operation succeeded", buf, 2u);
        }
      }
      else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        __49__MOFSMStore_removeAllFSMsWithCompletionHandler___block_invoke_cold_1((uint64_t)v19, v22, v23, v24, v25, v26, v27, v28);
      }

    }
    else
    {
      v19 = 0;
    }
    objc_msgSend(v3, "reset");
    v29 = *(_QWORD *)(a1 + 32);
    if (v29)
      (*(void (**)(uint64_t, id))(v29 + 16))(v29, v19);

  }
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

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
}

- (void)initWithPersistenceManager:(os_log_t)log andConfigurationManager:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: persistenceManager", v1, 2u);
}

void __42__MOFSMStore_updateFSM_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "saving fsm error, %@", a5, a6, a7, a8, 2u);
}

void __49__MOFSMStore_removeAllFSMsWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "saving fsm deletion operation error, %@", a5, a6, a7, a8, 2u);
}

@end
