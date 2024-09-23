@implementation MOEventBundleStore

- (MOEventBundleStore)initWithUniverse:(id)a3
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
  MOEventBundleStore *v15;

  v4 = a3;
  v6 = (objc_class *)objc_opt_class(MOPersistenceManager, v5);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v8));

  v11 = (objc_class *)objc_opt_class(MOConfigurationManager, v10);
  v12 = NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v13));

  v15 = -[MOEventBundleStore initWithPersistenceManager:andConfigurationManager:](self, "initWithPersistenceManager:andConfigurationManager:", v9, v14);
  return v15;
}

- (MOEventBundleStore)initWithPersistenceManager:(id)a3 andConfigurationManager:(id)a4
{
  id v8;
  id v9;
  MOEventBundleStore *v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  MOEventBundleStore *v15;
  id os_log;
  NSObject *v17;
  void *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v20.receiver = self;
    v20.super_class = (Class)MOEventBundleStore;
    v10 = -[MOEventBundleStore init](&v20, "init");
    if (v10)
    {
      v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      v13 = dispatch_queue_create("MOEventBundleStore", v12);
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
      -[MOEventBundleStore initWithPersistenceManager:andConfigurationManager:].cold.1(v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventBundleStore.m"), 64, CFSTR("Invalid parameter not satisfying: persistenceManager"));

    v15 = 0;
  }

  return v15;
}

- (void)reset
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MOEventBundleStore persistenceManager](self, "persistenceManager"));
  objc_msgSend(v2, "performBlockAndWait:", &__block_literal_global_40);

}

void __27__MOEventBundleStore_reset__block_invoke(id a1, NSManagedObjectContext *a2)
{
  -[NSManagedObjectContext reset](a2, "reset");
}

- (void)storeEventBundles:(id)a3 CompletionHandler:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  NSObject *v11;
  id os_log;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint8_t v17[8];
  _QWORD v18[4];
  NSObject *v19;
  MOEventBundleStore *v20;
  uint64_t *v21;
  SEL v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  const __CFString *v29;
  void *v30;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__32;
  v27 = __Block_byref_object_dispose__32;
  v28 = 0;
  v9 = objc_autoreleasePoolPush();
  if (objc_msgSend(v7, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleStore persistenceManager](self, "persistenceManager"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __58__MOEventBundleStore_storeEventBundles_CompletionHandler___block_invoke;
    v18[3] = &unk_1002B4D48;
    v21 = &v23;
    v22 = a2;
    v19 = v7;
    v20 = self;
    objc_msgSend(v10, "performBlockAndWait:", v18);

    -[MOEventBundleStore reset](self, "reset");
    v11 = v19;
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    v11 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "no event bundles to be saved", v17, 2u);
    }
  }

  objc_autoreleasePoolPop(v9);
  if (v8)
  {
    v13 = objc_autoreleasePoolPush();
    v14 = v24[5];
    v29 = CFSTR("resultNumberOfBundleEvents");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count")));
    v30 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
    v8[2](v8, v14, v16);

    objc_autoreleasePoolPop(v13);
  }
  _Block_object_dispose(&v23, 8);

}

void __58__MOEventBundleStore_storeEventBundles_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSMutableArray *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  id os_log;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *k;
  void *v41;
  id v42;
  NSObject *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  unsigned __int8 v47;
  uint64_t v48;
  void *v49;
  id v50;
  NSObject *v51;
  NSMutableArray *v52;
  id v53;
  id v54;
  id v55;
  NSObject *v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  uint64_t v69;
  void *v70;
  id v71;
  NSObject *v72;
  NSString *v73;
  void *v74;
  id v75;
  uint64_t v76;
  NSObject *v77;
  char *v78;
  char *v79;
  char *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  void *v86;
  id v87;
  NSObject *v88;
  id v89;
  NSObject *v90;
  uint64_t v91;
  id v92;
  id v93;
  uint64_t v94;
  unsigned __int8 v95;
  uint64_t v96;
  void *v97;
  id v98;
  NSObject *v99;
  void *v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  NSMutableArray *v105;
  id v106;
  uint64_t v107;
  NSMutableArray *v108;
  NSMutableArray *obj;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  NSMutableArray *v117;
  uint64_t v118;
  id v119;
  id v120;
  id v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  id v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  id v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  uint8_t v144[4];
  uint64_t v145;
  uint8_t v146[128];
  uint8_t buf[4];
  id v148;
  __int16 v149;
  void *v150;
  __int16 v151;
  uint64_t v152;
  __int16 v153;
  uint64_t v154;
  id v155;
  void *v156;
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];

  v120 = a2;
  v105 = objc_opt_new(NSMutableArray);
  v3 = objc_opt_new(NSMutableArray);
  v4 = objc_opt_new(NSMutableArray);
  v140 = 0u;
  v141 = 0u;
  v142 = 0u;
  v143 = 0u;
  v107 = a1;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v140, v160, 16);
  v117 = v3;
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v141;
    v119 = v5;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v141 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "interfaceType") != (id)11)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "events"));
          v12 = objc_msgSend(v11, "count");

          if (!v12)
            continue;
        }
        v13 = objc_msgSend(v10, "bundleManagementPolicy");
        v14 = v4;
        if (v13 == (id)1)
        {
          if (objc_msgSend(v10, "interfaceType") != (id)13
            || (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "place")),
                v16 = objc_msgSend(v15, "placeType"),
                v15,
                v14 = v105,
                (unint64_t)v16 <= 0x64))
          {
            v17 = objc_msgSend(v10, "interfaceType");
            v14 = v3;
            if (v17 == (id)13)
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "action"));

              v14 = v3;
              if (v18)
              {
                v138 = 0u;
                v139 = 0u;
                v136 = 0u;
                v137 = 0u;
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "events"));
                v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v136, v159, 16);
                if (v20)
                {
                  v21 = v20;
                  v22 = *(_QWORD *)v137;
                  do
                  {
                    for (j = 0; j != v21; j = (char *)j + 1)
                    {
                      if (*(_QWORD *)v137 != v22)
                        objc_enumerationMutation(v19);
                      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v136 + 1)
                                                                                         + 8 * (_QWORD)j), "eventIdentifier"));
                      objc_msgSend(0, "addObject:", v24);

                    }
                    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v136, v159, 16);
                  }
                  while (v21);
                }

                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "action"));
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "sourceEventIdentifier"));
                v27 = objc_msgSend(0, "containsObject:", v26);

                v3 = v117;
                v5 = v119;
                v14 = v117;
                if (v27)
                {
                  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                  v29 = objc_claimAutoreleasedReturnValue(os_log);
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
                  {
                    v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "action"));
                    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "sourceEventIdentifier"));
                    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "suggestionID"));
                    v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "events"));
                    v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "firstObject"));
                    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "eventIdentifier"));
                    *(_DWORD *)buf = 138412802;
                    v148 = v34;
                    v149 = 2112;
                    v150 = v35;
                    v151 = 2112;
                    v152 = (uint64_t)v36;
                    _os_log_fault_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "Action source Identifier  %@ not part of the event bundle %@, setting it now to be the first event %@ ", buf, 0x20u);

                  }
                  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "events"));
                  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "firstObject"));
                  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "eventIdentifier"));
                  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "action"));
                  objc_msgSend(v33, "setSourceEventIdentifier:", v32);

                  v14 = v117;
                  v5 = v119;
                }
              }
            }
          }
        }
        -[NSMutableArray addObject:](v14, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v140, v160, 16);
    }
    while (v7);
  }

  v134 = 0u;
  v135 = 0u;
  v132 = 0u;
  v133 = 0u;
  obj = v4;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v132, v158, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v133;
    do
    {
      for (k = 0; k != v38; k = (char *)k + 1)
      {
        if (*(_QWORD *)v133 != v39)
          objc_enumerationMutation(obj);
        v41 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * (_QWORD)k);
        v42 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
        v43 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v148 = v41;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "save event bundle, %@", buf, 0xCu);
        }

        v44 = +[MOEventBundleMO managedObjectWithEventBundle:inManagedObjectContext:](MOEventBundleMO, "managedObjectWithEventBundle:inManagedObjectContext:", v41, v120);
      }
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v132, v158, 16);
    }
    while (v38);
  }

  v45 = v107 + 48;
  v46 = *(_QWORD *)(*(_QWORD *)(v107 + 48) + 8);
  v131 = *(id *)(v46 + 40);
  v47 = objc_msgSend(v120, "save:", &v131);
  objc_storeStrong((id *)(v46 + 40), v131);
  if ((v47 & 1) != 0)
  {
    v48 = *(_QWORD *)(*(_QWORD *)v45 + 8);
    v49 = *(void **)(v48 + 40);
    *(_QWORD *)(v48 + 40) = 0;

    v50 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    v51 = objc_claimAutoreleasedReturnValue(v50);
    v52 = v117;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      v53 = -[NSMutableArray count](obj, "count");
      *(_DWORD *)buf = 134217984;
      v148 = v53;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "saving event bundles succeeded, stored, %lu", buf, 0xCu);
    }
  }
  else
  {
    v54 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    v51 = objc_claimAutoreleasedReturnValue(v54);
    v52 = v117;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      __58__MOEventBundleStore_storeEventBundles_CompletionHandler___block_invoke_cold_2();
  }

  objc_msgSend(v120, "reset");
  v55 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  v56 = objc_claimAutoreleasedReturnValue(v55);
  if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
  {
    v57 = -[NSMutableArray count](v52, "count");
    *(_DWORD *)buf = 134217984;
    v148 = v57;
    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "saving event bundles succeeded, to be updated, %lu", buf, 0xCu);
  }

  v130 = 0u;
  v128 = 0u;
  v129 = 0u;
  v127 = 0u;
  v108 = v52;
  v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v108, "countByEnumeratingWithState:objects:count:", &v127, v157, 16);
  if (v58)
  {
    v59 = v58;
    v110 = *(_QWORD *)v128;
    do
    {
      v60 = 0;
      v106 = v59;
      do
      {
        if (*(_QWORD *)v128 != v110)
          objc_enumerationMutation(v108);
        v61 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * v60);
        v62 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleMO fetchRequest](MOEventBundleMO, "fetchRequest"));
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "suggestionID"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("suggestionID"), v63));
        v156 = v64;
        v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v156, 1));
        v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v65));
        objc_msgSend(v62, "setPredicate:", v66);

        v67 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 0);
        v155 = v67;
        v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v155, 1));
        objc_msgSend(v62, "setSortDescriptors:", v68);

        objc_msgSend(v62, "setReturnsObjectsAsFaults:", 0);
        v69 = *(_QWORD *)(*(_QWORD *)v45 + 8);
        v126 = *(id *)(v69 + 40);
        v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "executeFetchRequest:error:", v62, &v126));
        objc_storeStrong((id *)(v69 + 40), v126);
        v71 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
        v72 = objc_claimAutoreleasedReturnValue(v71);
        if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
        {
          v73 = NSStringFromSelector(*(SEL *)(v107 + 56));
          v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
          v75 = objc_msgSend(v70, "count");
          v76 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v107 + 48) + 8) + 40);
          *(_DWORD *)buf = 138413058;
          v148 = v74;
          v149 = 2112;
          v150 = v62;
          v151 = 2048;
          v152 = (uint64_t)v75;
          v153 = 2112;
          v154 = v76;
          _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

        }
        v114 = v62;
        v116 = v60;
        v112 = v70;
        if (objc_msgSend(v70, "count"))
        {
          v124 = 0u;
          v125 = 0u;
          v122 = 0u;
          v123 = 0u;
          v77 = v70;
          v78 = (char *)-[NSObject countByEnumeratingWithState:objects:count:](v77, "countByEnumeratingWithState:objects:count:", &v122, v146, 16);
          if (v78)
          {
            v79 = v78;
            v80 = 0;
            v81 = 0;
            v82 = 0;
            v83 = *(_QWORD *)v123;
            do
            {
              v84 = 0;
              v118 = v82;
              v85 = -v82;
              do
              {
                if (*(_QWORD *)v123 != v83)
                  objc_enumerationMutation(v77);
                v86 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * (_QWORD)v84);
                if ((char *)v85 == v84)
                {
                  +[MOEventBundleMO updateManagedObject:eventBundle:inManagedObjectContext:](MOEventBundleMO, "updateManagedObject:eventBundle:inManagedObjectContext:", *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * (_QWORD)v84), v61, v120);
                  v87 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                  v88 = objc_claimAutoreleasedReturnValue(v87);
                  if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v148 = v61;
                    _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_INFO, "update event bundle, %@", buf, 0xCu);
                  }

                  ++v80;
                }
                else
                {
                  objc_msgSend(v120, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * (_QWORD)v84));
                  v89 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                  v90 = objc_claimAutoreleasedReturnValue(v89);
                  if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v148 = v86;
                    _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_INFO, "removed redundant event bundle, %@", buf, 0xCu);
                  }

                  ++v81;
                }
                ++v84;
              }
              while (v79 != v84);
              v82 = (uint64_t)&v79[v118];
              v79 = (char *)-[NSObject countByEnumeratingWithState:objects:count:](v77, "countByEnumeratingWithState:objects:count:", &v122, v146, 16);
            }
            while (v79);
            v91 = 0;
            v45 = v107 + 48;
            v59 = v106;
          }
          else
          {
            v80 = 0;
            v81 = 0;
            v91 = 0;
          }
        }
        else
        {
          v92 = +[MOEventBundleMO managedObjectWithEventBundle:inManagedObjectContext:](MOEventBundleMO, "managedObjectWithEventBundle:inManagedObjectContext:", v61, v120);
          v93 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
          v77 = objc_claimAutoreleasedReturnValue(v93);
          if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v148 = v61;
            _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, "save event bundle, %@", buf, 0xCu);
          }
          v80 = 0;
          v81 = 0;
          v91 = 1;
        }

        v94 = *(_QWORD *)(*(_QWORD *)v45 + 8);
        v121 = *(id *)(v94 + 40);
        v95 = objc_msgSend(v120, "save:", &v121);
        objc_storeStrong((id *)(v94 + 40), v121);
        if ((v95 & 1) != 0)
        {
          v96 = *(_QWORD *)(*(_QWORD *)v45 + 8);
          v97 = *(void **)(v96 + 40);
          *(_QWORD *)(v96 + 40) = 0;

          v98 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
          v99 = objc_claimAutoreleasedReturnValue(v98);
          v100 = v112;
          if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218496;
            v148 = v80;
            v149 = 2048;
            v150 = v81;
            v151 = 2048;
            v152 = v91;
            _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_INFO, "updating event bundles succeeded, updated, %lu, revmoed, %lu, saved, %lu", buf, 0x20u);
          }
        }
        else
        {
          v101 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
          v99 = objc_claimAutoreleasedReturnValue(v101);
          v100 = v112;
          if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
            __58__MOEventBundleStore_storeEventBundles_CompletionHandler___block_invoke_cold_1(v144, v45, &v145, v99);
        }

        v60 = v116 + 1;
      }
      while ((id)(v116 + 1) != v59);
      v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v108, "countByEnumeratingWithState:objects:count:", &v127, v157, 16);
    }
    while (v59);
  }

  v102 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v107 + 40), "_updateLongTermBundles:context:", v105, v120));
  v103 = *(_QWORD *)(*(_QWORD *)(v107 + 48) + 8);
  v104 = *(void **)(v103 + 40);
  *(_QWORD *)(v103 + 40) = v102;

}

+ (BOOL)_isResourceTypeAllowedForResource:(id)a3
{
  unsigned __int8 v3;
  id v4;
  void *v5;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "type") <= 0x10)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v4, "type")));
    v3 = objc_msgSend(&off_1002DCB30, "containsObject:", v5);

  }
  return v3 & 1;
}

+ (BOOL)_recordDedupeKey:(id)a3 alreadySeenKeys:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id os_log;
  NSObject *v9;
  BOOL v10;
  id v11;
  id v12;
  int v14;
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if ((objc_msgSend(v6, "containsObject:", v5) & 1) != 0)
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
      v9 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v14 = 138412290;
        v15 = v5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "The dedupe key, %@, was already seen.", (uint8_t *)&v14, 0xCu);
      }
      v10 = 0;
    }
    else
    {
      objc_msgSend(v7, "addObject:", v5);
      v12 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
      v9 = objc_claimAutoreleasedReturnValue(v12);
      v10 = 1;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v14 = 138412290;
        v15 = v5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "New dedupe key, %@.", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  else
  {
    v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    v9 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      +[MOEventBundleStore _recordDedupeKey:alreadySeenKeys:].cold.1(v9);
    v10 = 1;
  }

  return v10;
}

+ (BOOL)_recordResource:(id)a3 alreadySeenKeys:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  BOOL v9;
  id os_log;
  NSObject *v11;
  uint64_t v12;
  BOOL v13;
  id v15;
  id v16;

  v5 = a3;
  v6 = a4;
  v16 = 0;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getDedupeKeyError:", &v16));
  v8 = v16;
  if (v8)
    v9 = 1;
  else
    v9 = v7 == 0;
  if (!v9)
    goto LABEL_9;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    +[MOEventBundleStore _recordResource:alreadySeenKeys:].cold.2((uint64_t)v8, v5);

  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v7 = v12;
  if (!v12)
  {
    v15 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    v7 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      +[MOEventBundleStore _recordResource:alreadySeenKeys:].cold.1((uint64_t)v5, v7);
    v13 = 0;
  }
  else
  {
LABEL_9:
    v13 = +[MOEventBundleStore _recordDedupeKey:alreadySeenKeys:](MOEventBundleStore, "_recordDedupeKey:alreadySeenKeys:", v7, v6);
  }

  return v13;
}

- (id)_updateLongTermBundles:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  int *v9;
  uint64_t v10;
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
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id os_log;
  NSObject *v27;
  NSString *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  NSObject *v43;
  NSString *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  void *i;
  uint64_t v52;
  id v53;
  NSObject *v54;
  uint64_t v55;
  void *v56;
  id v57;
  NSObject *v58;
  id v59;
  id v60;
  void *v61;
  uint64_t v62;
  void *j;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  unsigned int v69;
  id v70;
  id v71;
  uint64_t v72;
  id k;
  void *v74;
  id v75;
  NSObject *v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  NSObject *v81;
  void *v82;
  void *v83;
  id v84;
  NSObject *v85;
  void *v86;
  void *v87;
  unsigned int v88;
  void *v89;
  unsigned int v90;
  void *v91;
  unsigned int v92;
  char *v93;
  void *v94;
  uint64_t v95;
  id v96;
  NSObject *v97;
  void *v98;
  void *v99;
  id v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  void *m;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  NSObject *v109;
  id v110;
  NSObject *v111;
  void *v112;
  void *v113;
  id v114;
  id v115;
  uint64_t v116;
  int v117;
  void *n;
  void *v119;
  id v120;
  NSObject *v121;
  uint64_t v122;
  uint64_t v123;
  NSObject *v124;
  id v125;
  NSObject *v126;
  id v127;
  void *v128;
  void *v129;
  id v130;
  id v131;
  char v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *ii;
  void *v137;
  double v138;
  id v139;
  NSObject *v140;
  void *v141;
  void *v142;
  id v143;
  void *v144;
  id v145;
  uint64_t v146;
  void *jj;
  void *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  void *v152;
  NSObject *v153;
  void *v154;
  void *v155;
  uint64_t v156;
  void *v157;
  void *v158;
  void *v159;
  unsigned int v160;
  id v161;
  id v162;
  NSObject *v163;
  void *v164;
  id v165;
  void *v166;
  id v167;
  uint64_t v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  NSObject *v173;
  void *v174;
  void *v175;
  uint64_t v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  unsigned int v181;
  uint64_t v182;
  id v183;
  NSObject *v184;
  void *v185;
  void *v186;
  void *v187;
  NSObject *v188;
  void *v189;
  void *v190;
  id v191;
  id v192;
  NSObject *v193;
  void *v194;
  void *v195;
  id v196;
  id v197;
  uint64_t v198;
  void *kk;
  void *v200;
  void *v201;
  uint64_t v202;
  void *v203;
  void *v204;
  NSObject *v205;
  id v206;
  NSObject *v207;
  void *v208;
  void *v209;
  uint64_t v210;
  void *v211;
  void *v212;
  NSObject *v213;
  id v214;
  NSObject *v215;
  void *v216;
  id v217;
  void *v218;
  uint64_t v219;
  void *v220;
  id v221;
  id v222;
  id v223;
  NSObject *v224;
  void *v225;
  void *v226;
  id v227;
  uint64_t v228;
  id v229;
  uint64_t v230;
  void *mm;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  double v237;
  double v238;
  void *v239;
  double v240;
  double v241;
  void *v242;
  double v243;
  double v244;
  void *v245;
  void *v246;
  uint64_t v247;
  id v248;
  NSObject *v249;
  id v250;
  void *v251;
  id v253;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  uint64_t v259;
  void *v260;
  id v261;
  uint64_t v262;
  void *v263;
  uint64_t v264;
  void *v265;
  id v266;
  NSMutableSet *v267;
  uint64_t v268;
  NSObject *v269;
  id v270;
  char *v271;
  void *v272;
  uint64_t v273;
  void *v274;
  void *v275;
  unsigned __int8 v276;
  void *v277;
  id obj;
  int obja;
  id v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  id v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  id v323;
  id v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  _BYTE v329[128];
  char v330[16];
  char v331[16];
  _BYTE v332[128];
  char v333[16];
  char v334[16];
  _BYTE v335[128];
  _BYTE v336[128];
  char v337[16];
  _BYTE v338[128];
  char v339[16];
  _BYTE v340[128];
  _BYTE v341[128];
  _BYTE v342[128];
  _BYTE v343[128];
  id v344;
  void *v345;
  uint8_t buf[4];
  _BYTE v347[20];
  uint64_t v348;
  __int16 v349;
  id v350;
  id v351;
  _QWORD v352[2];
  _BYTE v353[128];

  v5 = a3;
  v6 = a4;
  v325 = 0u;
  v326 = 0u;
  v327 = 0u;
  v328 = 0u;
  v7 = v5;
  v261 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v325, v353, 16);
  v8 = 0;
  if (v261)
  {
    v259 = *(_QWORD *)v326;
    v9 = &OBJC_IVAR___MODataDumpFormatter__bundles;
    v280 = v6;
    v260 = v7;
    do
    {
      v10 = 0;
      do
      {
        v283 = v8;
        if (*(_QWORD *)v326 != v259)
          objc_enumerationMutation(v7);
        v262 = v10;
        v11 = *(void **)(*((_QWORD *)&v325 + 1) + 8 * v10);
        v281 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9 + 208, "fetchRequest"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("interfaceType IN %@ "), &off_1002DCB48));
        objc_msgSend(v12, "addObject:", v13);

        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isAggregatedAndSuppressed == 0")));
        objc_msgSend(v12, "addObject:", v14);

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "endDate"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("startDate <= %@"), v15));
        v352[0] = v16;
        v265 = v11;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startDate"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("endDate >= %@"), v17));
        v352[1] = v18;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v352, 2));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v19));
        objc_msgSend(v12, "addObject:", v20);

        v21 = v12;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v12));
        objc_msgSend(v281, "setPredicate:", v22);

        objc_msgSend(v281, "setReturnsObjectsAsFaults:", 0);
        v23 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
        v351 = v23;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v351, 1));
        objc_msgSend(v281, "setSortDescriptors:", v24);

        objc_msgSend(v281, "setFetchBatchSize:", 100);
        v324 = v283;
        v263 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v281, &v324));
        v25 = v324;

        os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
        v27 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          v28 = NSStringFromSelector(a2);
          v29 = (id)objc_claimAutoreleasedReturnValue(v28);
          v30 = objc_msgSend(v263, "count");
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)v347 = v29;
          *(_WORD *)&v347[8] = 2112;
          *(_QWORD *)&v347[10] = v281;
          *(_WORD *)&v347[18] = 2048;
          v348 = (uint64_t)v30;
          v349 = 2112;
          v350 = v25;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%@, summary trip request, %@, fetched subBundle count, %lu, error, %@", buf, 0x2Au);

        }
        if (v25)
        {
          v8 = v25;
          v31 = v281;
          v253 = v8;
          v32 = v25;
          v9 = &OBJC_IVAR___MODataDumpFormatter__bundles;
          goto LABEL_203;
        }
        v257 = v21;
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleMO fetchRequest](MOEventBundleMO, "fetchRequest"));

        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v265, "suggestionID"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("suggestionID"), v34));
        v345 = v35;
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v345, 1));
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v36));
        objc_msgSend(v33, "setPredicate:", v37);

        v38 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 0);
        v344 = v38;
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v344, 1));
        objc_msgSend(v33, "setSortDescriptors:", v39);

        objc_msgSend(v33, "setReturnsObjectsAsFaults:", 0);
        v323 = 0;
        v258 = v33;
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v33, &v323));
        v41 = v323;
        v42 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
        v43 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          v44 = NSStringFromSelector(a2);
          v45 = (id)objc_claimAutoreleasedReturnValue(v44);
          v46 = objc_msgSend(v40, "count");
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)v347 = v45;
          *(_WORD *)&v347[8] = 2112;
          *(_QWORD *)&v347[10] = v258;
          *(_WORD *)&v347[18] = 2048;
          v348 = (uint64_t)v46;
          v349 = 2112;
          v350 = v41;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "%@, summary trip request, %@, fetched summary bundle count, %lu, error, %@", buf, 0x2Au);

        }
        v255 = v41;
        v256 = v40;
        if (objc_msgSend(v40, "count"))
        {
          v321 = 0u;
          v322 = 0u;
          v319 = 0u;
          v320 = 0u;
          v47 = v40;
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v319, v343, 16);
          if (v48)
          {
            v49 = v48;
            v264 = 0;
            v50 = *(_QWORD *)v320;
            do
            {
              for (i = 0; i != v49; i = (char *)i + 1)
              {
                if (*(_QWORD *)v320 != v50)
                  objc_enumerationMutation(v47);
                v52 = *(_QWORD *)(*((_QWORD *)&v319 + 1) + 8 * (_QWORD)i);
                objc_msgSend(v6, "deleteObject:", v52);
                v53 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                v54 = objc_claimAutoreleasedReturnValue(v53);
                if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)v347 = v52;
                  _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "removed redundant summary trip bundle, %@", buf, 0xCu);
                }

              }
              v264 += (uint64_t)v49;
              v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v319, v343, 16);
            }
            while (v49);
          }
          else
          {
            v264 = 0;
          }

        }
        else
        {
          v264 = 0;
        }
        v284 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
        v55 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
        v277 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
        objc_msgSend(v265, "setEvents:", 0);
        objc_msgSend(v265, "setPlaces:", 0);
        objc_msgSend(v265, "setResources:", 0);
        objc_msgSend(v265, "setPersons:", 0);
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleMO managedObjectWithEventBundle:inManagedObjectContext:](MOEventBundleMO, "managedObjectWithEventBundle:inManagedObjectContext:", v265, v6));
        v57 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
        v58 = objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v347 = v265;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "save summary trip bundle, %@", buf, 0xCu);
        }
        v274 = (void *)v55;

        v267 = objc_opt_new(NSMutableSet);
        v315 = 0u;
        v316 = 0u;
        v317 = 0u;
        v318 = 0u;
        v282 = v56;
        obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "places"));
        v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v315, v342, 16);
        if (v59)
        {
          v60 = v59;
          v61 = 0;
          v62 = *(_QWORD *)v316;
          do
          {
            for (j = 0; j != v60; j = (char *)j + 1)
            {
              if (*(_QWORD *)v316 != v62)
                objc_enumerationMutation(obj);
              v64 = *(void **)(*((_QWORD *)&v315 + 1) + 8 * (_QWORD)j);
              if (!v61)
                goto LABEL_36;
              v65 = objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "startDate"));
              if (v65)
              {
                v66 = (void *)v65;
                v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "startDate"));
                v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "startDate"));
                v69 = objc_msgSend(v67, "isAfterDate:", v68);

                if (!v69)
                  continue;
              }
LABEL_36:
              v70 = v64;

              v61 = v70;
            }
            v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v315, v342, 16);
          }
          while (v60);
        }
        else
        {
          v61 = 0;
        }

        v313 = 0u;
        v314 = 0u;
        v311 = 0u;
        v312 = 0u;
        v71 = v263;
        v270 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v311, v341, 16);
        if (v270)
        {
          v72 = *(_QWORD *)v312;
          obja = -1;
          v268 = *(_QWORD *)v312;
          v266 = v71;
          do
          {
            for (k = 0; k != v270; k = v93 + 1)
            {
              if (*(_QWORD *)v312 != v72)
                objc_enumerationMutation(v71);
              v271 = (char *)k;
              v74 = *(void **)(*((_QWORD *)&v311 + 1) + 8 * (_QWORD)k);
              ++obja;
              v75 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
              v76 = objc_claimAutoreleasedReturnValue(v75);
              if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
              {
                v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "bundleIdentifier"));
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v347 = obja;
                *(_WORD *)&v347[4] = 2112;
                *(_QWORD *)&v347[6] = v77;
                _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_INFO, "%d, Considering sub bundle, %@", buf, 0x12u);

              }
              v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "place"));
              v79 = objc_msgSend(v78, "placeType");

              v272 = v74;
              if ((unint64_t)v79 >= 0x65)
              {
                v80 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                v81 = objc_claimAutoreleasedReturnValue(v80);
                if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
                {
                  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "bundleIdentifier"));
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v347 = obja;
                  *(_WORD *)&v347[4] = 2112;
                  *(_QWORD *)&v347[6] = v82;
                  _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_INFO, "%d, Sub bundle place larger than city. skipping sub bundle, %@", buf, 0x12u);

                }
                goto LABEL_191;
              }
              v81 = objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "interfaceType"));
              if (-[NSObject intValue](v81, "intValue") == 2)
                goto LABEL_54;
              v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "interfaceType"));
              if (objc_msgSend(v83, "intValue") == 12)
              {

LABEL_54:
                goto LABEL_55;
              }
              v186 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "place"));
              if ((unint64_t)objc_msgSend(v186, "placeType") >= 0x65)
              {

                goto LABEL_190;
              }
              v187 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "subSuggestionIDs"));
              v188 = v81;
              v189 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v265, "suggestionID"));
              v190 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "UUIDString"));
              v276 = objc_msgSend(v187, "containsObject:", v190);

              v72 = v268;
              if ((v276 & 1) != 0)
                goto LABEL_62;
LABEL_55:
              v84 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
              v85 = objc_claimAutoreleasedReturnValue(v84);
              if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
              {
                v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "bundleIdentifier"));
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v347 = obja;
                *(_WORD *)&v347[4] = 2112;
                *(_QWORD *)&v347[6] = v86;
                _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_INFO, "%d, Ingesting sub bundle, %@", buf, 0x12u);

              }
              v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "summarizationGranularity"));
              v88 = objc_msgSend(v87, "intValue");

              if (v88 == 2)
              {
                objc_msgSend(v272, "setIsAggregatedAndSuppressed:", 1);
              }
              else
              {
                v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "summarizationGranularity"));
                v90 = objc_msgSend(v89, "intValue");

                if (v90 != 1)
                  objc_msgSend(v272, "setSummarizationGranularity:", &off_1002DAE50);
              }
              v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "interfaceType"));
              v92 = objc_msgSend(v91, "intValue");

              if (v92 == 13)
              {
LABEL_62:
                v93 = v271;
                continue;
              }
              v275 = v61;
              v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "suggestionID"));
              v95 = objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "UUIDString"));

              v269 = v95;
              -[NSMutableSet addObject:](v267, "addObject:", v95);
              v96 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
              v97 = objc_claimAutoreleasedReturnValue(v96);
              if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
              {
                v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "bundleIdentifier"));
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v347 = obja;
                *(_WORD *)&v347[4] = 2112;
                *(_QWORD *)&v347[6] = v98;
                _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_INFO, "%d, Ingesting events for sub bundle, %@", buf, 0x12u);

              }
              v309 = 0u;
              v310 = 0u;
              v307 = 0u;
              v308 = 0u;
              v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "events"));
              v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v307, v340, 16);
              if (v100)
              {
                v102 = v100;
                v103 = *(_QWORD *)v308;
                do
                {
                  for (m = 0; m != v102; m = (char *)m + 1)
                  {
                    if (*(_QWORD *)v308 != v103)
                      objc_enumerationMutation(v99);
                    v105 = *(void **)(*((_QWORD *)&v307 + 1) + 8 * (_QWORD)m);
                    v106 = (void *)objc_opt_class(self, v101);
                    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "eventIdentifier"));
                    LODWORD(v106) = objc_msgSend(v106, "_recordDedupeKey:alreadySeenKeys:", v107, v284);

                    if ((_DWORD)v106)
                    {
                      objc_msgSend(v282, "addEventsObject:", v105);
                    }
                    else
                    {
                      v108 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                      v109 = objc_claimAutoreleasedReturnValue(v108);
                      if (os_log_type_enabled(v109, OS_LOG_TYPE_FAULT))
                        -[MOEventBundleStore _updateLongTermBundles:context:].cold.6((uint64_t)v339, (uint64_t)v105);

                    }
                  }
                  v102 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v307, v340, 16);
                }
                while (v102);
              }

              v110 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
              v111 = objc_claimAutoreleasedReturnValue(v110);
              if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
              {
                v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "bundleIdentifier"));
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v347 = obja;
                *(_WORD *)&v347[4] = 2112;
                *(_QWORD *)&v347[6] = v112;
                _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_INFO, "%d, Ingesting resources for sub bundle, %@", buf, 0x12u);

              }
              v305 = 0u;
              v306 = 0u;
              v303 = 0u;
              v304 = 0u;
              v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "resources"));
              v114 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v303, v338, 16);
              if (v114)
              {
                v115 = v114;
                v116 = *(_QWORD *)v304;
                v117 = -1;
                do
                {
                  for (n = 0; n != v115; n = (char *)n + 1)
                  {
                    if (*(_QWORD *)v304 != v116)
                      objc_enumerationMutation(v113);
                    v119 = *(void **)(*((_QWORD *)&v303 + 1) + 8 * (_QWORD)n);
                    v120 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                    v121 = objc_claimAutoreleasedReturnValue(v120);
                    if (os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 67109634;
                      *(_DWORD *)v347 = obja;
                      *(_WORD *)&v347[4] = 1024;
                      *(_DWORD *)&v347[6] = v117 + (_DWORD)n + 1;
                      *(_WORD *)&v347[10] = 2112;
                      *(_QWORD *)&v347[12] = v119;
                      _os_log_impl((void *)&_mh_execute_header, v121, OS_LOG_TYPE_INFO, "%d.%d, Ingesting resource, %@", buf, 0x18u);
                    }

                    if (objc_msgSend((id)objc_opt_class(self, v122), "_isResourceTypeAllowedForResource:", v119))
                    {
                      if (objc_msgSend((id)objc_opt_class(self, v123), "_recordResource:alreadySeenKeys:", v119, v277))
                      {
                        v124 = objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "clonedObjectWithContext:", v6));
                        v125 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                        v126 = objc_claimAutoreleasedReturnValue(v125);
                        if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 67109634;
                          *(_DWORD *)v347 = obja;
                          *(_WORD *)&v347[4] = 1024;
                          *(_DWORD *)&v347[6] = v117 + (_DWORD)n + 1;
                          *(_WORD *)&v347[10] = 2112;
                          *(_QWORD *)&v347[12] = v119;
                          _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_INFO, "%d.%d, adding resource, %@", buf, 0x18u);
                        }

                        objc_msgSend(v282, "addResourcesObject:", v124);
                      }
                      else
                      {
                        v127 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                        v124 = objc_claimAutoreleasedReturnValue(v127);
                        if (os_log_type_enabled(v124, OS_LOG_TYPE_FAULT))
                          -[MOEventBundleStore _updateLongTermBundles:context:].cold.5((uint64_t)v337, (uint64_t)v119);
                      }

                    }
                  }
                  v115 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v303, v338, 16);
                  v117 += (int)n;
                }
                while (v115);
              }

              v301 = 0u;
              v302 = 0u;
              v299 = 0u;
              v300 = 0u;
              v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v282, "resources"));
              v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "reverseObjectEnumerator"));

              v130 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v299, v336, 16);
              if (v130)
              {
                v131 = v130;
                v132 = 0;
                v133 = *(_QWORD *)v300;
                v134 = 200;
                v135 = 300;
                do
                {
                  for (ii = 0; ii != v131; ii = (char *)ii + 1)
                  {
                    if (*(_QWORD *)v300 != v133)
                      objc_enumerationMutation(v129);
                    v137 = *(void **)(*((_QWORD *)&v299 + 1) + 8 * (_QWORD)ii);
                    if (objc_msgSend(v137, "type") == (id)2)
                    {
                      objc_msgSend(v137, "priorityScore");
                      if ((v132 & 1) != 0)
                      {
                        objc_msgSend(v137, "setPriorityScore:", (double)v134++);
                        v132 = 1;
                      }
                      else
                      {
                        v132 |= v138 == 100.0;
                      }
                    }
                    else if (objc_msgSend(v137, "type") == (id)10)
                    {
                      objc_msgSend(v137, "setPriorityScore:", (double)v134++);
                    }
                    else if (objc_msgSend(v137, "type") == (id)13)
                    {
                      objc_msgSend(v137, "setPriorityScore:", (double)v135++);
                    }
                  }
                  v131 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v299, v336, 16);
                }
                while (v131);
              }

              v139 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
              v140 = objc_claimAutoreleasedReturnValue(v139);
              if (os_log_type_enabled(v140, OS_LOG_TYPE_INFO))
              {
                v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "bundleIdentifier"));
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v347 = obja;
                *(_WORD *)&v347[4] = 2112;
                *(_QWORD *)&v347[6] = v141;
                _os_log_impl((void *)&_mh_execute_header, v140, OS_LOG_TYPE_INFO, "%d, Ingesting places for sub bundle, %@", buf, 0x12u);

              }
              v297 = 0u;
              v298 = 0u;
              v295 = 0u;
              v296 = 0u;
              v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "places"));
              v143 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v295, v335, 16);
              v144 = v274;
              if (v143)
              {
                v145 = v143;
                v146 = *(_QWORD *)v296;
                v273 = *(_QWORD *)v296;
                do
                {
                  for (jj = 0; jj != v145; jj = (char *)jj + 1)
                  {
                    if (*(_QWORD *)v296 != v146)
                      objc_enumerationMutation(v142);
                    v148 = *(void **)(*((_QWORD *)&v295 + 1) + 8 * (_QWORD)jj);
                    if ((unint64_t)objc_msgSend(v148, "placeType") <= 5)
                    {
                      v150 = (void *)objc_opt_class(self, v149);
                      v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "sourceEventIdentifier"));
                      LODWORD(v150) = objc_msgSend(v150, "_recordDedupeKey:alreadySeenKeys:", v151, v284);

                      if ((_DWORD)v150)
                      {
                        v152 = v142;
                        v153 = objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "clonedObjectWithContext:", v6));
                        v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v282, "place"));
                        v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "name"));
                        -[NSObject setCityName:](v153, "setCityName:", v155);

                        objc_msgSend(v282, "addPlacesObject:", v153);
                        if (!v275)
                          goto LABEL_123;
                        v156 = objc_claimAutoreleasedReturnValue(objc_msgSend(v275, "startDate"));
                        if (!v156)
                          goto LABEL_123;
                        v157 = (void *)v156;
                        v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "startDate"));
                        v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v275, "startDate"));
                        v160 = objc_msgSend(v158, "isAfterDate:", v159);

                        v144 = v274;
                        if (v160)
                        {
LABEL_123:
                          v161 = v148;

                          v275 = v161;
                        }
                        v162 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                        v163 = objc_claimAutoreleasedReturnValue(v162);
                        v142 = v152;
                        if (os_log_type_enabled(v163, OS_LOG_TYPE_INFO))
                        {
                          v164 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject identifier](v153, "identifier"));
                          *(_DWORD *)buf = 138412290;
                          *(_QWORD *)v347 = v164;
                          _os_log_impl((void *)&_mh_execute_header, v163, OS_LOG_TYPE_INFO, "Place added with identifier, %@", buf, 0xCu);

                        }
                        v6 = v280;
                        v146 = v273;
                      }
                      else
                      {
                        v165 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                        v153 = objc_claimAutoreleasedReturnValue(v165);
                        if (os_log_type_enabled(v153, OS_LOG_TYPE_FAULT))
                          -[MOEventBundleStore _updateLongTermBundles:context:].cold.4((uint64_t)v334, (uint64_t)v148);
                      }

                    }
                  }
                  v145 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v295, v335, 16);
                }
                while (v145);
              }

              v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "place"));
              v167 = objc_msgSend(v166, "placeType");

              if ((unint64_t)v167 <= 5)
              {
                v169 = (void *)objc_opt_class(self, v168);
                v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "place"));
                v171 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "identifier"));
                LODWORD(v169) = objc_msgSend(v169, "_recordDedupeKey:alreadySeenKeys:", v171, v284);

                if ((_DWORD)v169)
                {
                  v172 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "place"));
                  v173 = objc_claimAutoreleasedReturnValue(objc_msgSend(v172, "clonedObjectWithContext:", v6));

                  v174 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v282, "place"));
                  v175 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v174, "name"));
                  -[NSObject setCityName:](v173, "setCityName:", v175);

                  objc_msgSend(v282, "addPlacesObject:", v173);
                  if (!v275)
                    goto LABEL_137;
                  v176 = objc_claimAutoreleasedReturnValue(objc_msgSend(v275, "startDate"));
                  if (!v176)
                    goto LABEL_137;
                  v177 = (void *)v176;
                  v178 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "place"));
                  v179 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v178, "startDate"));
                  v180 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v275, "startDate"));
                  v181 = objc_msgSend(v179, "isAfterDate:", v180);

                  if (v181)
                  {
LABEL_137:
                    v182 = objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "place"));

                    v275 = (void *)v182;
                  }
                  v183 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                  v184 = objc_claimAutoreleasedReturnValue(v183);
                  v144 = v274;
                  if (os_log_type_enabled(v184, OS_LOG_TYPE_INFO))
                  {
                    v185 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject identifier](v173, "identifier"));
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)v347 = v185;
                    _os_log_impl((void *)&_mh_execute_header, v184, OS_LOG_TYPE_INFO, "Place added with identifier, %@", buf, 0xCu);

                  }
                }
                else
                {
                  v191 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                  v173 = objc_claimAutoreleasedReturnValue(v191);
                  if (os_log_type_enabled(v173, OS_LOG_TYPE_FAULT))
                    -[MOEventBundleStore _updateLongTermBundles:context:].cold.3((uint64_t)v333, (uint64_t)v272);
                  v144 = v274;
                }

              }
              v192 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
              v193 = objc_claimAutoreleasedReturnValue(v192);
              if (os_log_type_enabled(v193, OS_LOG_TYPE_INFO))
              {
                v194 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "bundleIdentifier"));
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v347 = obja;
                *(_WORD *)&v347[4] = 2112;
                *(_QWORD *)&v347[6] = v194;
                _os_log_impl((void *)&_mh_execute_header, v193, OS_LOG_TYPE_INFO, "%d, Ingesting persons for sub bundle, %@", buf, 0x12u);

              }
              v293 = 0u;
              v294 = 0u;
              v291 = 0u;
              v292 = 0u;
              v195 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "persons"));
              v196 = objc_msgSend(v195, "countByEnumeratingWithState:objects:count:", &v291, v332, 16);
              if (v196)
              {
                v197 = v196;
                v198 = *(_QWORD *)v292;
                do
                {
                  for (kk = 0; kk != v197; kk = (char *)kk + 1)
                  {
                    if (*(_QWORD *)v292 != v198)
                      objc_enumerationMutation(v195);
                    v200 = *(void **)(*((_QWORD *)&v291 + 1) + 8 * (_QWORD)kk);
                    v201 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "identifier"));

                    if (!v201)
                    {
                      v209 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "contactIdentifier"));

                      if (v209)
                      {
                        v211 = (void *)objc_opt_class(self, v210);
                        v212 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "contactIdentifier"));
                        LODWORD(v211) = objc_msgSend(v211, "_recordDedupeKey:alreadySeenKeys:", v212, v144);

                        if ((_DWORD)v211)
                        {
                          v213 = objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "clonedObjectWithContext:", v280));
                          v214 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                          v215 = objc_claimAutoreleasedReturnValue(v214);
                          if (os_log_type_enabled(v215, OS_LOG_TYPE_INFO))
                          {
                            v216 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "identifier"));
                            *(_DWORD *)buf = 138412290;
                            *(_QWORD *)v347 = v216;
                            _os_log_impl((void *)&_mh_execute_header, v215, OS_LOG_TYPE_INFO, "Person added with contact identifier, %@", buf, 0xCu);

                            v144 = v274;
                          }

                          objc_msgSend(v282, "addPersonsObject:", v213);
                        }
                        else
                        {
                          v222 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                          v213 = objc_claimAutoreleasedReturnValue(v222);
                          if (os_log_type_enabled(v213, OS_LOG_TYPE_FAULT))
                            -[MOEventBundleStore _updateLongTermBundles:context:].cold.1((uint64_t)v330, (uint64_t)v200);
                        }
                      }
                      else
                      {
                        v221 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                        v213 = objc_claimAutoreleasedReturnValue(v221);
                        if (os_log_type_enabled(v213, OS_LOG_TYPE_FAULT))
                        {
                          *(_DWORD *)buf = 138412290;
                          *(_QWORD *)v347 = v200;
                          _os_log_fault_impl((void *)&_mh_execute_header, v213, OS_LOG_TYPE_FAULT, "Person, %@, has both identifier and contactIdentifier nil", buf, 0xCu);
                        }
                      }
                      goto LABEL_175;
                    }
                    v203 = (void *)objc_opt_class(self, v202);
                    v204 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "identifier"));
                    LODWORD(v203) = objc_msgSend(v203, "_recordDedupeKey:alreadySeenKeys:", v204, v144);

                    if ((_DWORD)v203)
                    {
                      v205 = objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "clonedObjectWithContext:", v280));
                      v206 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                      v207 = objc_claimAutoreleasedReturnValue(v206);
                      if (os_log_type_enabled(v207, OS_LOG_TYPE_INFO))
                      {
                        v208 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "identifier"));
                        *(_DWORD *)buf = 138412290;
                        *(_QWORD *)v347 = v208;
                        _os_log_impl((void *)&_mh_execute_header, v207, OS_LOG_TYPE_INFO, "Person added with local identifier, %@", buf, 0xCu);

                        v144 = v274;
                      }

                      objc_msgSend(v282, "addPersonsObject:", v205);
                    }
                    else
                    {
                      v217 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                      v205 = objc_claimAutoreleasedReturnValue(v217);
                      if (os_log_type_enabled(v205, OS_LOG_TYPE_FAULT))
                        -[MOEventBundleStore _updateLongTermBundles:context:].cold.2((uint64_t)v331, (uint64_t)v200);
                    }

                    v218 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "contactIdentifier"));
                    if (v218)
                    {
                      v220 = (void *)objc_opt_class(self, v219);
                      v213 = objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "contactIdentifier"));
                      objc_msgSend(v220, "_recordDedupeKey:alreadySeenKeys:", v213, v144);
LABEL_175:

                      continue;
                    }
                  }
                  v197 = objc_msgSend(v195, "countByEnumeratingWithState:objects:count:", &v291, v332, 16);
                }
                while (v197);
              }

              v223 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
              v224 = objc_claimAutoreleasedReturnValue(v223);
              if (os_log_type_enabled(v224, OS_LOG_TYPE_INFO))
              {
                v225 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "bundleIdentifier"));
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v347 = obja;
                *(_WORD *)&v347[4] = 2112;
                *(_QWORD *)&v347[6] = v225;
                _os_log_impl((void *)&_mh_execute_header, v224, OS_LOG_TYPE_INFO, "%d, Ingesting photo trait for sub bundle, %@", buf, 0x12u);

              }
              v289 = 0u;
              v290 = 0u;
              v287 = 0u;
              v288 = 0u;
              v226 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "photoTraits"));
              v227 = objc_msgSend(v226, "countByEnumeratingWithState:objects:count:", &v287, v329, 16);
              v6 = v280;
              v81 = v269;
              if (v227)
              {
                v229 = v227;
                v230 = *(_QWORD *)v288;
                do
                {
                  for (mm = 0; mm != v229; mm = (char *)mm + 1)
                  {
                    if (*(_QWORD *)v288 != v230)
                      objc_enumerationMutation(v226);
                    v232 = *(void **)(*((_QWORD *)&v287 + 1) + 8 * (_QWORD)mm);
                    v233 = (void *)objc_opt_class(self, v228);
                    v234 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v232, "identifier"));
                    LODWORD(v233) = objc_msgSend(v233, "_recordDedupeKey:alreadySeenKeys:", v234, v284);

                    if ((_DWORD)v233)
                    {
                      v235 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v232, "clonedObjectWithContext:", v280));
                      objc_msgSend(v282, "addPhotoTraitsObject:", v235);

                    }
                  }
                  v229 = objc_msgSend(v226, "countByEnumeratingWithState:objects:count:", &v287, v329, 16);
                }
                while (v229);
              }

              v71 = v266;
              v61 = v275;
LABEL_190:
              v72 = v268;
LABEL_191:
              v93 = v271;

            }
            v270 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v311, v341, 16);
          }
          while (v270);
        }

        v236 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v267, "allObjects"));
        objc_msgSend(v282, "setSubBundleIDs:", v236);

        if (v61)
        {
          objc_msgSend(v61, "latitude");
          v238 = v237;
          v239 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v282, "place"));
          objc_msgSend(v239, "setLatitude:", v238);

          objc_msgSend(v61, "longitude");
          v241 = v240;
          v242 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v282, "place"));
          objc_msgSend(v242, "setLongitude:", v241);

          objc_msgSend(v61, "range");
          v244 = v243;
          v245 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v282, "place"));
          objc_msgSend(v245, "setRange:", v244);

        }
        v246 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v282, "events"));
        v247 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v246, "count")));
        objc_msgSend(v282, "setEventCount:", v247);

        v286 = v255;
        LOBYTE(v247) = objc_msgSend(v6, "save:", &v286);
        v8 = v286;

        v9 = &OBJC_IVAR___MODataDumpFormatter__bundles;
        if ((v247 & 1) != 0)
        {

          v248 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
          v249 = objc_claimAutoreleasedReturnValue(v248);
          v21 = v257;
          if (os_log_type_enabled(v249, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218496;
            *(_QWORD *)v347 = 0;
            *(_WORD *)&v347[8] = 2048;
            *(_QWORD *)&v347[10] = v264;
            *(_WORD *)&v347[18] = 2048;
            v348 = 1;
            _os_log_impl((void *)&_mh_execute_header, v249, OS_LOG_TYPE_INFO, "updating summary trip bundles succeeded, updated, %lu, removed, %lu, saved, %lu", buf, 0x20u);
          }
          v8 = 0;
        }
        else
        {
          v250 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
          v249 = objc_claimAutoreleasedReturnValue(v250);
          v21 = v257;
          if (os_log_type_enabled(v249, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v347 = v8;
            _os_log_error_impl((void *)&_mh_execute_header, v249, OS_LOG_TYPE_ERROR, "summary trip error, %@", buf, 0xCu);
          }
        }
        v31 = v258;

        objc_msgSend(v6, "reset");
        v32 = 0;
LABEL_203:

        v7 = v260;
        if (v32)
        {

          v251 = v253;
          goto LABEL_208;
        }
        v10 = v262 + 1;
      }
      while ((id)(v262 + 1) != v261);
      v261 = objc_msgSend(v260, "countByEnumeratingWithState:objects:count:", &v325, v353, 16);
    }
    while (v261);
  }

  v8 = v8;
  v251 = v8;
LABEL_208:

  return v251;
}

- (void)removeEventBundles:(id)a3 CompletionHandler:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  SEL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__32;
  v19 = __Block_byref_object_dispose__32;
  v20 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleStore persistenceManager](self, "persistenceManager"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __59__MOEventBundleStore_removeEventBundles_CompletionHandler___block_invoke;
  v11[3] = &unk_1002B4D70;
  v10 = v7;
  v12 = v10;
  v13 = &v15;
  v14 = a2;
  objc_msgSend(v9, "performBlockAndWait:", v11);

  -[MOEventBundleStore reset](self, "reset");
  if (v8)
    v8[2](v8, v16[5], &__NSDictionary0__struct);

  _Block_object_dispose(&v15, 8);
}

void __59__MOEventBundleStore_removeEventBundles_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id os_log;
  NSObject *v18;
  NSString *v19;
  void *v20;
  uint64_t v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  _BYTE v35[128];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count")));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v9), "bundleIdentifier"));
        objc_msgSend(v4, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleMO fetchRequest](MOEventBundleMO, "fetchRequest"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bundleIdentifier IN %@"), v4));
  objc_msgSend(v11, "setPredicate:", v12);

  v13 = objc_msgSend(objc_alloc((Class)NSBatchDeleteRequest), "initWithFetchRequest:", v11);
  objc_msgSend(v13, "setResultType:", 2);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v14 + 40);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeRequest:error:", v13, &obj));
  objc_storeStrong((id *)(v14 + 40), obj);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "result"));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  v18 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v19 = NSStringFromSelector(*(SEL *)(a1 + 48));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    v28 = v20;
    v29 = 2112;
    v30 = v11;
    v31 = 2112;
    v32 = v16;
    v33 = 2112;
    v34 = v21;
    _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %@, error, %@", buf, 0x2Au);

  }
}

- (void)removeAllBundlesWithCompletionHandler:(id)a3
{
  void (**v5)(id, _QWORD);
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v5 = (void (**)(id, _QWORD))a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__32;
  v12 = __Block_byref_object_dispose__32;
  v13 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleStore persistenceManager](self, "persistenceManager"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __60__MOEventBundleStore_removeAllBundlesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1002B4D98;
  v7[4] = &v8;
  v7[5] = a2;
  objc_msgSend(v6, "performBlockAndWait:", v7);

  -[MOEventBundleStore reset](self, "reset");
  if (v5)
    v5[2](v5, v9[5]);
  _Block_object_dispose(&v8, 8);

}

void __60__MOEventBundleStore_removeAllBundlesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id os_log;
  NSObject *v10;
  NSString *v11;
  void *v12;
  uint64_t v13;
  id obj;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleMO fetchRequest](MOEventBundleMO, "fetchRequest"));
  v5 = objc_msgSend(objc_alloc((Class)NSBatchDeleteRequest), "initWithFetchRequest:", v4);
  objc_msgSend(v5, "setResultType:", 2);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v6 + 40);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeRequest:error:", v5, &obj));

  objc_storeStrong((id *)(v6 + 40), obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "result"));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  v10 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = NSStringFromSelector(*(SEL *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    v16 = v12;
    v17 = 2112;
    v18 = v4;
    v19 = 2112;
    v20 = v8;
    v21 = 2112;
    v22 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %@, error, %@", buf, 0x2Au);

  }
}

- (void)removeEventBundlesStartedWithinInterval:(id)a3 CompletionHandler:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  SEL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  _UNKNOWN **v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  const __CFString *v32;
  uint64_t v33;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__32;
  v30 = __Block_byref_object_dispose__32;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__32;
  v24 = __Block_byref_object_dispose__32;
  v25 = &off_1002DAE68;
  v9 = objc_autoreleasePoolPush();
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleStore persistenceManager](self, "persistenceManager"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __80__MOEventBundleStore_removeEventBundlesStartedWithinInterval_CompletionHandler___block_invoke;
  v15[3] = &unk_1002B3900;
  v11 = v7;
  v16 = v11;
  v17 = &v26;
  v18 = &v20;
  v19 = a2;
  objc_msgSend(v10, "performBlockAndWait:", v15);

  -[MOEventBundleStore reset](self, "reset");
  objc_autoreleasePoolPop(v9);
  if (v8)
  {
    v12 = v27[5];
    if (v12)
    {
      v13 = &__NSDictionary0__struct;
    }
    else
    {
      v14 = v21[5];
      v32 = CFSTR("resultNumberOfBundleEvents");
      v33 = v14;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
    }
    v8[2](v8, v12, v13);
    if (!v12)

  }
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
}

void __80__MOEventBundleStore_removeEventBundlesStartedWithinInterval_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  MOEventBundle *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id os_log;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *i;
  void *v32;
  MOEventBundle *v33;
  id v34;
  NSObject *v35;
  NSString *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  NSString *v48;
  void *v49;
  uint64_t v50;
  id v51;
  NSObject *v52;
  NSString *v53;
  void *v54;
  MOEventBundle *v55;
  uint64_t v56;
  unsigned __int8 v57;
  id v58;
  NSObject *v59;
  NSObject *v60;
  uint64_t v61;
  NSString *v62;
  void *v63;
  MOEventBundle *v64;
  NSString *v65;
  void *v66;
  id v67;
  uint64_t v68;
  _QWORD *v69;
  void *v70;
  MOEventBundle *v71;
  id v72;
  NSMutableDictionary *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  id v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  id obj;
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  MOEventBundle *v88;
  __int16 v89;
  id v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  uint64_t v96;
  __int16 v97;
  uint64_t v98;
  _BYTE v99[128];
  id v100;
  _QWORD v101[3];

  v72 = a2;
  v3 = (MOEventBundle *)objc_claimAutoreleasedReturnValue(+[MOEventBundleMO fetchRequest](MOEventBundleMO, "fetchRequest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "startDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("startDate >= %@"), v4));
  v101[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "endDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("startDate <= %@"), v6));
  v101[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("filtered == NO")));
  v101[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v101, 3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v9));
  -[MOEventBundle setPredicate:](v3, "setPredicate:", v10);

  v11 = v72;
  v12 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 0);
  v100 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v100, 1));
  -[MOEventBundle setSortDescriptors:](v3, "setSortDescriptors:", v13);

  -[MOEventBundle setReturnsObjectsAsFaults:](v3, "setReturnsObjectsAsFaults:", 0);
  v76 = a1;
  v15 = *(_QWORD *)(a1 + 40);
  v14 = (_QWORD *)(a1 + 40);
  v16 = *(_QWORD *)(v15 + 8);
  obj = *(id *)(v16 + 40);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "executeFetchRequest:error:", v3, &obj));
  objc_storeStrong((id *)(v16 + 40), obj);
  v18 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "count")));
  v19 = *(_QWORD *)(v14[1] + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v18;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  v22 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v65 = NSStringFromSelector(*(SEL *)(v76 + 56));
    v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
    v67 = objc_msgSend(v17, "count");
    v68 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v76 + 40) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    v86 = v66;
    v87 = 2112;
    v88 = v3;
    v89 = 2048;
    v90 = v67;
    v91 = 2112;
    v92 = v68;
    _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (*(_QWORD *)(*(_QWORD *)(*v14 + 8) + 40) || !objc_msgSend(v17, "count"))
  {
    objc_msgSend(v72, "reset");
  }
  else
  {
    v69 = v14;
    v71 = v3;
    v73 = objc_opt_new(NSMutableDictionary);
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v70 = v17;
    v23 = v17;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v80, v99, 16);
    if (v24)
    {
      v25 = v24;
      v26 = 0;
      v27 = 0;
      v74 = 0;
      v28 = 0;
      v29 = 0;
      v30 = *(_QWORD *)v81;
      v78 = v23;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(_QWORD *)v81 != v30)
            objc_enumerationMutation(v78);
          v32 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)i);
          v33 = -[MOEventBundle initWithEventBundleMO:]([MOEventBundle alloc], "initWithEventBundleMO:", v32);
          if (-[MOEventBundle bundleManagementPolicy](v33, "bundleManagementPolicy"))
          {
            if ((id)-[MOEventBundle interfaceType](v33, "interfaceType") == (id)13)
            {
              ++v29;
            }
            else if ((id)-[MOEventBundle interfaceType](v33, "interfaceType") == (id)11)
            {
              v77 = v26;
              v39 = v28;
              v40 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v33, "resources"));
              v41 = objc_msgSend(v40, "count");

              if (v41)
              {
                v75 = v29;
                v42 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v33, "resources"));
                v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "firstObject"));
                v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "name"));

                v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v73, "objectForKey:", v44));
                if (v45)
                {
                  objc_msgSend(v32, "setFiltered:", 1);
                  ++v74;
                  v46 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                  v47 = objc_claimAutoreleasedReturnValue(v46);
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
                  {
                    v48 = NSStringFromSelector(*(SEL *)(v76 + 56));
                    v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
                    *(_DWORD *)buf = 138412546;
                    v86 = v49;
                    v87 = 2112;
                    v88 = v33;
                    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "%@, evergreen bundle to delete (old), %@", buf, 0x16u);

                  }
                }
                else
                {
                  v47 = objc_claimAutoreleasedReturnValue(-[MOEventBundle suggestionID](v33, "suggestionID"));
                  -[NSMutableDictionary setObject:forKey:](v73, "setObject:forKey:", v47, v44);
                }
                v29 = v75;

              }
              v28 = v39 + 1;
              v26 = v77;
            }
            ++v27;
          }
          else
          {
            objc_msgSend(v32, "setFiltered:", 1);
            v34 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
            v35 = objc_claimAutoreleasedReturnValue(v34);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              v36 = NSStringFromSelector(*(SEL *)(v76 + 56));
              v37 = v29;
              v38 = (void *)objc_claimAutoreleasedReturnValue(v36);
              *(_DWORD *)buf = 138412546;
              v86 = v38;
              v87 = 2112;
              v88 = v33;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%@, bundle to delete, %@", buf, 0x16u);

              v29 = v37;
            }
            ++v26;

          }
        }
        v23 = v78;
        v25 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v80, v99, 16);
      }
      while (v25);
    }
    else
    {
      v26 = 0;
      v27 = 0;
      v74 = 0;
      v28 = 0;
      v29 = 0;
    }
    v50 = v29;

    v51 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    v52 = objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      v53 = NSStringFromSelector(*(SEL *)(v76 + 56));
      v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
      v55 = (MOEventBundle *)objc_msgSend(v23, "count");
      *(_DWORD *)buf = 138412546;
      v86 = v54;
      v87 = 2048;
      v88 = v55;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "%@, trying to delete event bundles count %lu", buf, 0x16u);

    }
    v56 = *(_QWORD *)(*v69 + 8);
    v79 = *(id *)(v56 + 40);
    v11 = v72;
    v57 = objc_msgSend(v72, "save:", &v79);
    objc_storeStrong((id *)(v56 + 40), v79);
    v58 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    v59 = objc_claimAutoreleasedReturnValue(v58);
    v60 = v59;
    if ((v57 & 1) != 0)
    {
      v61 = v28;
      v17 = v70;
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        v62 = NSStringFromSelector(*(SEL *)(v76 + 56));
        v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
        v64 = (MOEventBundle *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v76 + 48) + 8) + 40), "unsignedLongValue");
        *(_DWORD *)buf = 138413826;
        v86 = v63;
        v87 = 2048;
        v88 = v64;
        v89 = 2048;
        v90 = v26;
        v91 = 2048;
        v92 = v27;
        v93 = 2048;
        v94 = v50;
        v95 = 2048;
        v96 = v61;
        v97 = 2048;
        v98 = v74;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "%@, event bundles delete operation succeeded, total, %lu, deleted, %lu, not deleted, %lu, trip, %lu, evergreen, %lu (deduped, %lu)", buf, 0x48u);

      }
    }
    else
    {
      v17 = v70;
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        __80__MOEventBundleStore_removeEventBundlesStartedWithinInterval_CompletionHandler___block_invoke_cold_1(v76);
    }

    v3 = v71;
  }

}

- (void)purgeDeletedEventBundlesWithCompletionHandler:(id)a3
{
  void (**v5)(id, _QWORD, void *);
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  _UNKNOWN **v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  const __CFString *v24;
  uint64_t v25;

  v5 = (void (**)(id, _QWORD, void *))a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__32;
  v22 = __Block_byref_object_dispose__32;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__32;
  v16 = __Block_byref_object_dispose__32;
  v17 = &off_1002DAE68;
  v6 = objc_autoreleasePoolPush();
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleStore persistenceManager](self, "persistenceManager"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __68__MOEventBundleStore_purgeDeletedEventBundlesWithCompletionHandler___block_invoke;
  v11[3] = &unk_1002B4DC0;
  v11[4] = &v18;
  v11[5] = &v12;
  v11[6] = a2;
  objc_msgSend(v7, "performBlockAndWait:", v11);

  -[MOEventBundleStore reset](self, "reset");
  objc_autoreleasePoolPop(v6);
  if (v5)
  {
    v8 = v19[5];
    if (v8)
    {
      v9 = &__NSDictionary0__struct;
    }
    else
    {
      v10 = v13[5];
      v24 = CFSTR("resultNumberOfBundleEvents");
      v25 = v10;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
    }
    v5[2](v5, v8, v9);
    if (!v8)

  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
}

void __68__MOEventBundleStore_purgeDeletedEventBundlesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id os_log;
  NSObject *v15;
  NSMutableSet *v16;
  NSMutableArray *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  id v27;
  NSObject *v28;
  void *v29;
  NSString *v30;
  id v31;
  uint64_t v32;
  NSMutableArray *v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  void *j;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  NSObject *v43;
  NSString *v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  unsigned __int8 v49;
  id v50;
  NSObject *v51;
  NSObject *v52;
  NSString *v53;
  void *v54;
  NSString *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  id obj;
  uint8_t v74[128];
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  id v78;
  __int16 v79;
  id v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  void *v84;
  _BYTE v85[128];
  id v86;
  void *v87;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleMO fetchRequest](MOEventBundleMO, "fetchRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("filtered == YES")));
  v87 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v87, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v6));
  objc_msgSend(v4, "setPredicate:", v7);

  v8 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 0);
  v86 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v86, 1));
  objc_msgSend(v4, "setSortDescriptors:", v9);

  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v61 = a1;
  v62 = v4;
  v11 = *(_QWORD *)(a1 + 32);
  v10 = a1 + 32;
  v12 = *(_QWORD *)(v11 + 8);
  obj = *(id *)(v12 + 40);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v4, &obj));
  objc_storeStrong((id *)(v12 + 40), obj);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  v15 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v55 = NSStringFromSelector(*(SEL *)(v61 + 48));
    v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
    v57 = objc_msgSend(v13, "count");
    v58 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v61 + 32) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    v76 = v56;
    v77 = 2112;
    v78 = v62;
    v79 = 2048;
    v80 = v57;
    v81 = 2112;
    v82 = v58;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v10 + 8) + 40) || !objc_msgSend(v13, "count"))
  {
    objc_msgSend(v3, "reset");
  }
  else
  {
    v59 = v10;
    v16 = objc_opt_new(NSMutableSet);
    v17 = objc_opt_new(NSMutableArray);
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v60 = v13;
    v18 = v13;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v70 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)i);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "suggestionID", v59));

          if (v24)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "suggestionID"));
            v26 = -[NSMutableSet containsObject:](v16, "containsObject:", v25);

            if (v26)
            {
              -[NSMutableArray addObject:](v17, "addObject:", v23);
            }
            else
            {
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "suggestionID"));
              -[NSMutableSet addObject:](v16, "addObject:", v29);

            }
          }
          else
          {
            v27 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
            v28 = objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              v30 = NSStringFromSelector(*(SEL *)(v61 + 48));
              v63 = (void *)objc_claimAutoreleasedReturnValue(v30);
              v31 = objc_msgSend(v18, "count");
              v32 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v61 + 32) + 8) + 40);
              *(_DWORD *)buf = 138413314;
              v76 = v63;
              v77 = 2112;
              v78 = v62;
              v79 = 2048;
              v80 = v31;
              v81 = 2112;
              v82 = v32;
              v83 = 2112;
              v84 = v23;
              _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%@, request, %@, results count, %lu, error, %@, incorrect context in eventBundle, %@", buf, 0x34u);

            }
          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
      }
      while (v20);
    }

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v33 = v17;
    v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
    v35 = v59;
    if (v34)
    {
      v36 = v34;
      v37 = *(_QWORD *)v66;
      do
      {
        for (j = 0; j != v36; j = (char *)j + 1)
        {
          if (*(_QWORD *)v66 != v37)
            objc_enumerationMutation(v33);
          objc_msgSend(v3, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)j), v59);
        }
        v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
      }
      while (v36);
    }

    v39 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](v33, "count")));
    v40 = *(_QWORD *)(*(_QWORD *)(v61 + 40) + 8);
    v41 = *(void **)(v40 + 40);
    *(_QWORD *)(v40 + 40) = v39;

    v42 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      v44 = NSStringFromSelector(*(SEL *)(v61 + 48));
      v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
      v46 = -[NSMutableSet count](v16, "count");
      v47 = -[NSMutableArray count](v33, "count");
      *(_DWORD *)buf = 138412802;
      v76 = v45;
      v77 = 2048;
      v78 = v46;
      v79 = 2048;
      v80 = v47;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "%@, purge deleted events, stay, %lu, deleted, %lu", buf, 0x20u);

    }
    v48 = *(_QWORD *)(*(_QWORD *)v35 + 8);
    v64 = *(id *)(v48 + 40);
    v49 = objc_msgSend(v3, "save:", &v64);
    objc_storeStrong((id *)(v48 + 40), v64);
    v50 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    v51 = objc_claimAutoreleasedReturnValue(v50);
    v52 = v51;
    if ((v49 & 1) != 0)
    {
      v13 = v60;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        v53 = NSStringFromSelector(*(SEL *)(v61 + 48));
        v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
        *(_DWORD *)buf = 138412290;
        v76 = v54;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "%@, event bundles delete operation succeeded", buf, 0xCu);

      }
    }
    else
    {
      v13 = v60;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        __68__MOEventBundleStore_purgeDeletedEventBundlesWithCompletionHandler___block_invoke_cold_1(v61);
    }

  }
}

- (void)purgeExpiredEventBundlesWithCompletionHandler:(id)a3
{
  void (**v5)(id, _QWORD, void *);
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  _UNKNOWN **v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  const __CFString *v23;
  uint64_t v24;

  v5 = (void (**)(id, _QWORD, void *))a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__32;
  v21 = __Block_byref_object_dispose__32;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__32;
  v15 = __Block_byref_object_dispose__32;
  v16 = &off_1002DAE68;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleStore persistenceManager](self, "persistenceManager"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __68__MOEventBundleStore_purgeExpiredEventBundlesWithCompletionHandler___block_invoke;
  v10[3] = &unk_1002B3900;
  v10[4] = self;
  v10[5] = &v17;
  v10[6] = &v11;
  v10[7] = a2;
  objc_msgSend(v6, "performBlockAndWait:", v10);

  if (v5)
  {
    v7 = v18[5];
    if (v7)
    {
      v8 = &__NSDictionary0__struct;
    }
    else
    {
      v9 = v12[5];
      v23 = CFSTR("resultNumberOfBundleEvents");
      v24 = v9;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    }
    v5[2](v5, v7, v8);
    if (!v7)

  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
}

void __68__MOEventBundleStore_purgeExpiredEventBundlesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id os_log;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  unsigned __int8 v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  NSString *v38;
  void *v39;
  id v40;
  uint64_t v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id obj;
  uint8_t v48[128];
  uint8_t buf[4];
  id v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  uint64_t v56;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleMO fetchRequest](MOEventBundleMO, "fetchRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "configurationManager"));
  objc_msgSend(v5, "getDoubleSettingForKey:withFallback:", CFSTR("EventBundleManagerOverrideMaximumEventBundleAge"), 2419200.0);
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v8, -v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "configurationManager"));
  objc_msgSend(v10, "getDoubleSettingForKey:withFallback:", CFSTR("EventBundleManagerOverrideRefreshMinimumLookBackWindowFull"), 2419200.0);
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v13, -v12));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("expirationDate < %@ || endDate < %@ || (endDate < %@  && filtered == 1)"), v15, v9, v14));
  objc_msgSend(v4, "setPredicate:", v16);

  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v17 = a1 + 40;
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v18 + 40);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v4, &obj));
  objc_storeStrong((id *)(v18 + 40), obj);
  v20 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v19, "count")));
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v20;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  v24 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    v38 = NSStringFromSelector(*(SEL *)(a1 + 56));
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    v40 = objc_msgSend(v19, "count");
    v41 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    v50 = v39;
    v51 = 2112;
    v52 = v4;
    v53 = 2048;
    v54 = v40;
    v55 = 2112;
    v56 = v41;
    _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v17 + 8) + 40) && objc_msgSend(v19, "count"))
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v25 = v19;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v44;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v44 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(v3, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v29));
          v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v27);
    }

    v30 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = objc_msgSend(v25, "count");
      *(_DWORD *)buf = 134217984;
      v50 = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "trying to purge event bundles count %lu", buf, 0xCu);
    }

    v33 = *(_QWORD *)(*(_QWORD *)v17 + 8);
    v42 = *(id *)(v33 + 40);
    v34 = objc_msgSend(v3, "save:", &v42);
    objc_storeStrong((id *)(v33 + 40), v42);
    v35 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    v36 = objc_claimAutoreleasedReturnValue(v35);
    v37 = v36;
    if ((v34 & 1) != 0)
    {
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "saving event bundles purge operation succeeded", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      __68__MOEventBundleStore_purgeExpiredEventBundlesWithCompletionHandler___block_invoke_cold_1();
    }

  }
  objc_msgSend(v3, "reset");

}

- (void)purgeEventBundlesWithNoEventsAssociatedWithCompletionHandler:(id)a3
{
  void (**v5)(id, _QWORD, void *);
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  const __CFString *v20;
  void *v21;

  v5 = (void (**)(id, _QWORD, void *))a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__32;
  v18 = __Block_byref_object_dispose__32;
  v19 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleStore persistenceManager](self, "persistenceManager"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __83__MOEventBundleStore_purgeEventBundlesWithNoEventsAssociatedWithCompletionHandler___block_invoke;
  v9[3] = &unk_1002B4DC0;
  v9[5] = &v10;
  v9[6] = a2;
  v9[4] = &v14;
  objc_msgSend(v6, "performBlockAndWait:", v9);

  if (v5)
  {
    v7 = v15[5];
    if (v7)
    {
      v8 = &__NSDictionary0__struct;
    }
    else
    {
      v20 = CFSTR("resultNumberOfBundleEvents");
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)v11 + 6)));
      v21 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    }
    v5[2](v5, v7, v8);
    if (!v7)
    {

    }
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

}

void __83__MOEventBundleStore_purgeEventBundlesWithNoEventsAssociatedWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id os_log;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  unsigned __int8 v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  NSString *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id obj;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  uint64_t v46;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleMO fetchRequest](MOEventBundleMO, "fetchRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("interfaceType != %luu"), 11));
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v6 = a1 + 32;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v7 + 40);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v4, &obj));
  objc_storeStrong((id *)(v7 + 40), obj);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  v10 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v27 = NSStringFromSelector(*(SEL *)(a1 + 48));
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = objc_msgSend(v8, "count");
    v30 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    v40 = v28;
    v41 = 2112;
    v42 = v4;
    v43 = 2048;
    v44 = v29;
    v45 = 2112;
    v46 = v30;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v6 + 8) + 40) || !objc_msgSend(v8, "count"))
  {
    objc_msgSend(v3, "reset");

  }
  else
  {
    v31 = v4;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "events"));
          v18 = objc_msgSend(v17, "count");

          if (!v18)
          {
            objc_msgSend(v3, "deleteObject:", v16);
            ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v13);
    }

    v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      *(_DWORD *)buf = 67109120;
      LODWORD(v40) = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "trying to purge non-evergreen event bundles with no events count %i", buf, 8u);
    }

    v22 = *(_QWORD *)(*(_QWORD *)v6 + 8);
    v32 = *(id *)(v22 + 40);
    v23 = objc_msgSend(v3, "save:", &v32);
    objc_storeStrong((id *)(v22 + 40), v32);
    v24 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    v26 = v25;
    v4 = v31;
    if ((v23 & 1) != 0)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "saving non-evergreen event bundles purge operation succeeded", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      __83__MOEventBundleStore_purgeEventBundlesWithNoEventsAssociatedWithCompletionHandler___block_invoke_cold_1();
    }

    objc_msgSend(v3, "reset");
  }

}

- (void)purgeInvalidEvergreenBundlesWithCompletionHandler:(id)a3
{
  void (**v5)(id, _QWORD, void *);
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  const __CFString *v20;
  void *v21;

  v5 = (void (**)(id, _QWORD, void *))a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__32;
  v18 = __Block_byref_object_dispose__32;
  v19 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleStore persistenceManager](self, "persistenceManager"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __72__MOEventBundleStore_purgeInvalidEvergreenBundlesWithCompletionHandler___block_invoke;
  v9[3] = &unk_1002B4DC0;
  v9[5] = &v10;
  v9[6] = a2;
  v9[4] = &v14;
  objc_msgSend(v6, "performBlockAndWait:", v9);

  if (v5)
  {
    v7 = v15[5];
    if (v7)
    {
      v8 = &__NSDictionary0__struct;
    }
    else
    {
      v20 = CFSTR("resultNumberOfBundleEvents");
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)v11 + 6)));
      v21 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    }
    v5[2](v5, v7, v8);
    if (!v7)
    {

    }
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

}

void __72__MOEventBundleStore_purgeInvalidEvergreenBundlesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableSet *v11;
  id os_log;
  NSObject *v13;
  NSMutableSet *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  unsigned __int8 v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  NSString *v33;
  void *v34;
  id v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  NSMutableSet *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id obj;
  uint8_t v49[128];
  uint8_t buf[4];
  id v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  uint64_t v57;
  id v58;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleMO fetchRequest](MOEventBundleMO, "fetchRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("interfaceType == %luu"), 11));
  objc_msgSend(v4, "setPredicate:", v5);

  v6 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 0);
  v58 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v58, 1));
  objc_msgSend(v4, "setSortDescriptors:", v7);

  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v40 = a1;
  v41 = v3;
  v9 = *(_QWORD *)(a1 + 32);
  v8 = a1 + 32;
  v10 = *(_QWORD *)(v9 + 8);
  obj = *(id *)(v10 + 40);
  v11 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v4, &obj));
  objc_storeStrong((id *)(v10 + 40), obj);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  v13 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v33 = NSStringFromSelector(*(SEL *)(v40 + 48));
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = -[NSMutableSet count](v11, "count");
    v36 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v40 + 32) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    v51 = v34;
    v52 = 2112;
    v53 = v4;
    v54 = 2048;
    v55 = v35;
    v56 = 2112;
    v57 = v36;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v8 + 8) + 40) || !-[NSMutableSet count](v11, "count"))
  {
    v14 = v11;
  }
  else
  {
    v38 = v8;
    v39 = v4;
    v37 = -[NSMutableSet count](v11, "count");
    v14 = objc_opt_new(NSMutableSet);
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v42 = v11;
    v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v45 != v17)
            objc_enumerationMutation(v42);
          v19 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bundleSubType"));
          v21 = (void *)(int)objc_msgSend(v20, "intValue");

          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", +[MOEventBundle castEvergreenSubType:](MOEventBundle, "castEvergreenSubType:", v21)));
          if ((-[NSMutableSet containsObject:](v14, "containsObject:", v22) & 1) != 0)
          {
            objc_msgSend(v41, "deleteObject:", v19);
            v23 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
            v24 = objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v51 = v19;
              v52 = 2048;
              v53 = v21;
              _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "invalid Evergreen bundle, %@, subType, %lu", buf, 0x16u);
            }

            ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v40 + 40) + 8) + 24);
          }
          else
          {
            -[NSMutableSet addObject:](v14, "addObject:", v22);
          }

        }
        v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v16);
    }

    v25 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = (void *)*(int *)(*(_QWORD *)(*(_QWORD *)(v40 + 40) + 8) + 24);
      *(_DWORD *)buf = 134218240;
      v51 = v37;
      v52 = 2048;
      v53 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "purge Evergreen, total, %lu, invalid, %lu", buf, 0x16u);
    }

    v28 = *(_QWORD *)(*(_QWORD *)v38 + 8);
    v43 = *(id *)(v28 + 40);
    v29 = objc_msgSend(v41, "save:", &v43);
    objc_storeStrong((id *)(v28 + 40), v43);
    v30 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    v32 = v31;
    if ((v29 & 1) != 0)
    {
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "saving evergreen event bundles purge operation succeeded", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      __72__MOEventBundleStore_purgeInvalidEvergreenBundlesWithCompletionHandler___block_invoke_cold_1();
    }

    v4 = v39;
  }
  objc_msgSend(v41, "reset");

}

- (void)purgeEventBundlesWithRehydrationFailureCount:(int)a3 andHandler:(id)a4
{
  void (**v7)(id, _QWORD, void *);
  void *v8;
  uint64_t v9;
  void *v10;
  id os_log;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[7];
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  _UNKNOWN **v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  const __CFString *v29;
  uint64_t v30;
  const __CFString *v31;
  _UNKNOWN **v32;

  v7 = (void (**)(id, _QWORD, void *))a4;
  if (a3 <= 0)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    v12 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MOEventStore purgeRehydrationFailedEventsForType:rehydrationFailCount:CompletionHandler:].cold.1(a3, v12);

    if (v7)
    {
      v31 = CFSTR("resultNumberOfEvents");
      v32 = &off_1002DAE68;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
      v7[2](v7, 0, v13);

    }
  }
  else
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__32;
    v27 = __Block_byref_object_dispose__32;
    v28 = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__32;
    v21 = __Block_byref_object_dispose__32;
    v22 = &off_1002DAE68;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleStore persistenceManager](self, "persistenceManager"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __78__MOEventBundleStore_purgeEventBundlesWithRehydrationFailureCount_andHandler___block_invoke;
    v15[3] = &unk_1002B4DE8;
    v16 = a3;
    v15[4] = &v23;
    v15[5] = &v17;
    v15[6] = a2;
    objc_msgSend(v8, "performBlockAndWait:", v15);

    if (v7)
    {
      v9 = v24[5];
      if (v9)
      {
        v10 = &__NSDictionary0__struct;
      }
      else
      {
        v14 = v18[5];
        v29 = CFSTR("resultNumberOfBundleEvents");
        v30 = v14;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
      }
      v7[2](v7, v9, v10);
      if (!v9)

    }
    _Block_object_dispose(&v17, 8);

    _Block_object_dispose(&v23, 8);
  }

}

void __78__MOEventBundleStore_purgeEventBundlesWithRehydrationFailureCount_andHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id os_log;
  NSObject *v12;
  NSString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  unsigned __int8 v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id obj;
  uint8_t v43[128];
  uint8_t buf[4];
  id v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  uint64_t v51;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleMO fetchRequest](MOEventBundleMO, "fetchRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("ANY events.rehydrationFailCount >= %d"), *(unsigned int *)(a1 + 56)));
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v6 + 40);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v4, &obj));
  objc_storeStrong((id *)(v6 + 40), obj);
  v8 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count")));
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = NSStringFromSelector(*(SEL *)(a1 + 48));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = objc_msgSend(v7, "count");
    v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    v45 = v14;
    v46 = 2112;
    v47 = v4;
    v48 = 2048;
    v49 = v15;
    v50 = 2112;
    v51 = v16;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) && objc_msgSend(v7, "count"))
  {
    v34 = a1 + 32;
    v35 = v7;
    v36 = v4;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v17 = v7;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v39 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
          v23 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
          v24 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bundleIdentifier"));
            *(_DWORD *)buf = 138412290;
            v45 = v25;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "deleting bundle due to rehydration failures %@", buf, 0xCu);

          }
          objc_msgSend(v3, "deleteObject:", v22);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v19);
    }

    v26 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = objc_msgSend(v17, "count");
      *(_DWORD *)buf = 134217984;
      v45 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "trying to purge event bundles due to rehydration failure count %lu", buf, 0xCu);
    }

    v29 = *(_QWORD *)(*(_QWORD *)v34 + 8);
    v37 = *(id *)(v29 + 40);
    v30 = objc_msgSend(v3, "save:", &v37);
    objc_storeStrong((id *)(v29 + 40), v37);
    v31 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    v33 = v32;
    if ((v30 & 1) != 0)
    {
      v7 = v35;
      v4 = v36;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "saving event bundles purge due to rehydration failure succeeded", buf, 2u);
      }
    }
    else
    {
      v7 = v35;
      v4 = v36;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        __78__MOEventBundleStore_purgeEventBundlesWithRehydrationFailureCount_andHandler___block_invoke_cold_1();
    }

  }
  objc_msgSend(v3, "reset");

}

- (void)purgeDanglingEventBundlesWithHandler:(id)a3
{
  void (**v5)(id, _QWORD, void *);
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  _UNKNOWN **v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  const __CFString *v23;
  uint64_t v24;

  v5 = (void (**)(id, _QWORD, void *))a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__32;
  v21 = __Block_byref_object_dispose__32;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__32;
  v15 = __Block_byref_object_dispose__32;
  v16 = &off_1002DAE68;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleStore persistenceManager](self, "persistenceManager"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __59__MOEventBundleStore_purgeDanglingEventBundlesWithHandler___block_invoke;
  v10[3] = &unk_1002B4DC0;
  v10[4] = &v17;
  v10[5] = &v11;
  v10[6] = a2;
  objc_msgSend(v6, "performBlockAndWait:", v10);

  if (v5)
  {
    v7 = v18[5];
    if (v7)
    {
      v8 = &__NSDictionary0__struct;
    }
    else
    {
      v9 = v12[5];
      v23 = CFSTR("resultNumberOfBundleEvents");
      v24 = v9;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    }
    v5[2](v5, v7, v8);
    if (!v7)

  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
}

void __59__MOEventBundleStore_purgeDanglingEventBundlesWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id os_log;
  NSObject *v12;
  NSString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  unsigned __int8 v39;
  id v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id obj;
  _BYTE v61[128];
  uint8_t v62[128];
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  _BYTE v66[18];
  __int16 v67;
  uint64_t v68;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleMO fetchRequest](MOEventBundleMO, "fetchRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("events.@count < eventCount")));
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v6 + 40);
  v48 = v3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v4, &obj));
  objc_storeStrong((id *)(v6 + 40), obj);
  v8 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count")));
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = NSStringFromSelector(*(SEL *)(a1 + 48));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = objc_msgSend(v7, "count");
    v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    v64 = v14;
    v65 = 2112;
    *(_QWORD *)v66 = v4;
    *(_WORD *)&v66[8] = 2048;
    *(_QWORD *)&v66[10] = v15;
    v67 = 2112;
    v68 = v16;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) && objc_msgSend(v7, "count"))
  {
    v43 = a1 + 32;
    v44 = v7;
    v45 = v4;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v46 = v7;
    v49 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    if (v49)
    {
      v47 = *(_QWORD *)v57;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v57 != v47)
            objc_enumerationMutation(v46);
          v50 = v17;
          v18 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v17);
          v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bundleIdentifier"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "eventCount"));
            v23 = objc_msgSend(v22, "intValue");
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "events"));
            v25 = objc_msgSend(v24, "count");
            *(_DWORD *)buf = 138412802;
            v64 = v21;
            v65 = 1024;
            *(_DWORD *)v66 = v23;
            *(_WORD *)&v66[4] = 2048;
            *(_QWORD *)&v66[6] = v25;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "deleting dangling bundle %@, initial event count %d, current event count %lu", buf, 0x1Cu);

          }
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "events"));
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v53;
            do
            {
              v30 = 0;
              do
              {
                if (*(_QWORD *)v53 != v29)
                  objc_enumerationMutation(v26);
                v31 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)v30);
                v32 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
                v33 = objc_claimAutoreleasedReturnValue(v32);
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
                {
                  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bundleIdentifier"));
                  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "eventIdentifier"));
                  *(_DWORD *)buf = 138412546;
                  v64 = v34;
                  v65 = 2112;
                  *(_QWORD *)v66 = v35;
                  _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "dangling bundle %@ is associated with event %@", buf, 0x16u);

                }
                v30 = (char *)v30 + 1;
              }
              while (v28 != v30);
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
            }
            while (v28);
          }

          objc_msgSend(v48, "deleteObject:", v18);
          v17 = v50 + 1;
        }
        while ((id)(v50 + 1) != v49);
        v49 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      }
      while (v49);
    }

    v36 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "trying to purge dangling event bundles", buf, 2u);
    }

    v38 = *(_QWORD *)(*(_QWORD *)v43 + 8);
    v51 = *(id *)(v38 + 40);
    v39 = objc_msgSend(v48, "save:", &v51);
    objc_storeStrong((id *)(v38 + 40), v51);
    v40 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    v41 = objc_claimAutoreleasedReturnValue(v40);
    v42 = v41;
    if ((v39 & 1) != 0)
    {
      v7 = v44;
      v4 = v45;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "saving dangling event bundles purge succeeded", buf, 2u);
      }
    }
    else
    {
      v7 = v44;
      v4 = v45;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        __59__MOEventBundleStore_purgeDanglingEventBundlesWithHandler___block_invoke_cold_1();
    }

  }
  objc_msgSend(v48, "reset");

}

- (void)fetchEventBundleWithOptions:(id)a3 CompletionHandler:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  MOEventBundleRanking *v10;
  id os_log;
  NSObject *v12;
  uint64_t v13;
  const char *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *i;
  uint64_t v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *context;
  void (**v40)(id, uint64_t, uint64_t);
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[5];
  _QWORD v47[5];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  _QWORD v54[4];
  id v55;
  uint64_t *v56;
  uint64_t *v57;
  SEL v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  uint8_t v71[128];
  __int128 buf;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;

  v7 = a3;
  v40 = (void (**)(id, uint64_t, uint64_t))a4;
  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__32;
  v69 = __Block_byref_object_dispose__32;
  v70 = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__32;
  v63 = __Block_byref_object_dispose__32;
  v64 = 0;
  context = objc_autoreleasePoolPush();
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleStore persistenceManager](self, "persistenceManager"));
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = __68__MOEventBundleStore_fetchEventBundleWithOptions_CompletionHandler___block_invoke;
  v54[3] = &unk_1002B3900;
  v41 = v7;
  v55 = v41;
  v56 = &v65;
  v57 = &v59;
  v58 = a2;
  objc_msgSend(v8, "performBlockAndWait:", v54);

  -[MOEventBundleStore reset](self, "reset");
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__32;
  v52 = __Block_byref_object_dispose__32;
  v53 = 0;
  if (!objc_msgSend((id)v60[5], "count"))
    goto LABEL_25;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleStore engagementDelegate](self, "engagementDelegate"));
  objc_msgSend(v9, "eventBundleStore:needsEngagementInfoForBundles:", self, v60[5]);

  if ((objc_msgSend(v41, "skipRanking") & 1) == 0)
  {
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = __68__MOEventBundleStore_fetchEventBundleWithOptions_CompletionHandler___block_invoke_180;
    v47[3] = &unk_1002AEFF0;
    v47[4] = &v48;
    -[MOEventBundleStore getRankingParamsandCompletionHandler:](self, "getRankingParamsandCompletionHandler:", v47);
    if (v49[5])
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
      v12 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = v49[5];
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v13;
        v14 = "using stored ranking params succeeded %@";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v14, (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      v15 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
      v12 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v16 = v49[5];
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v16;
        v14 = "using default ranking params %@";
        goto LABEL_9;
      }
    }

    v10 = -[MOEventBundleRanking initWithConfigurationManager:]([MOEventBundleRanking alloc], "initWithConfigurationManager:", self->_configurationManager);
    -[MOEventBundleRanking setRankingParamsFromRankingParamsMO:](v10, "setRankingParamsFromRankingParamsMO:", v49[5]);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v73 = 0x3032000000;
    v74 = __Block_byref_object_copy__32;
    v75 = __Block_byref_object_dispose__32;
    v76 = 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "dateInterval"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "startDate"));

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "dateInterval"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "startDate"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate firstSaturdayBeforeReferenceDate:](NSDate, "firstSaturdayBeforeReferenceDate:", v20));

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "dateInterval"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "startDate"));
      LODWORD(v20) = objc_msgSend(v21, "isBeforeDate:", v23);

      if ((_DWORD)v20)
      {
        v24 = objc_alloc((Class)NSDateInterval);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "dateInterval"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "startDate"));
        v27 = objc_msgSend(v24, "initWithStartDate:endDate:", v21, v26);

        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", &off_1002DAE80));
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = __68__MOEventBundleStore_fetchEventBundleWithOptions_CompletionHandler___block_invoke_186;
        v46[3] = &unk_1002AEFF0;
        v46[4] = &buf;
        -[MOEventBundleStore getEventBundleStartedWithInterval:interfaceTypes:CompletionHandler:](self, "getEventBundleStartedWithInterval:interfaceTypes:CompletionHandler:", v27, v28, v46);

      }
    }
    v29 = objc_autoreleasePoolPush();
    -[MOEventBundleRanking identifyRepetitiveSignificantContactBundlesFromBundles:precedingSignificantContactBundles:](v10, "identifyRepetitiveSignificantContactBundlesFromBundles:precedingSignificantContactBundles:", v60[5], *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
    objc_autoreleasePoolPop(v29);
    v30 = objc_autoreleasePoolPush();
    -[MOEventBundleRanking generateBundleRanking:withMinRecommendedBundleCountRequirement:](v10, "generateBundleRanking:withMinRecommendedBundleCountRequirement:", v60[5], 1);
    objc_autoreleasePoolPop(v30);
    _Block_object_dispose(&buf, 8);

    goto LABEL_15;
  }
  v10 = 0;
LABEL_15:
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v31 = (id)v60[5];
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v42, v71, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v32; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v33)
          objc_enumerationMutation(v31);
        v35 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
        v36 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
        v37 = objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v35;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "final fetched event bundle from store :%@", (uint8_t *)&buf, 0xCu);
        }

      }
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v42, v71, 16);
    }
    while (v32);
  }

LABEL_25:
  _Block_object_dispose(&v48, 8);

  objc_autoreleasePoolPop(context);
  v38 = objc_autoreleasePoolPush();
  v40[2](v40, v60[5], v66[5]);
  objc_autoreleasePoolPop(v38);
  _Block_object_dispose(&v59, 8);

  _Block_object_dispose(&v65, 8);
}

void __68__MOEventBundleStore_fetchEventBundleWithOptions_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _UNKNOWN **v10;
  NSMutableArray *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
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
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id os_log;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  void *j;
  MOEventBundle *v52;
  NSString *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id obj;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t v70[128];
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  id v76;
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  uint64_t v80;
  id v81;
  _QWORD v82[2];
  _BYTE v83[128];

  v3 = a2;
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleMO fetchRequest](MOEventBundleMO, "fetchRequest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bundleIdentifier!=nil")));
  objc_msgSend(v4, "addObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("suggestionID!=nil")));
  objc_msgSend(v4, "addObject:", v6);

  if ((objc_msgSend(*(id *)(a1 + 32), "includeDeletedBundles") & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("filtered == 0")));
    objc_msgSend(v4, "addObject:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "categories"));
  v9 = objc_msgSend(v8, "count");

  v10 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
  v60 = v4;
  if (v9)
  {
    v11 = objc_opt_new(NSMutableArray);
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "categories"));
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v66, v83, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v67 != v15)
            objc_enumerationMutation(v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%@ IN categories"), *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i)));
          -[NSMutableArray addObject:](v11, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v66, v83, 16);
      }
      while (v14);
    }

    v10 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v11));
    objc_msgSend(v4, "addObject:", v18);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dateInterval"));

  if (v19)
  {
    v20 = v10[291];
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dateInterval"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "endDate"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("startDate <= %@"), v22));
    v82[0] = v23;
    v58 = v3;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dateInterval"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "startDate"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("endDate >= %@"), v25));
    v82[1] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v82, 2));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "andPredicateWithSubpredicates:", v27));
    objc_msgSend(v60, "addObject:", v28);

    v3 = v58;
    v10 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;

    v4 = v60;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifiers"));
  v30 = objc_msgSend(v29, "count");

  if (v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifiers"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bundleIdentifier IN %@"), v31));
    objc_msgSend(v4, "addObject:", v32);

  }
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "interfaceType") <= 0xF)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("interfaceType == %d"), objc_msgSend(*(id *)(a1 + 32), "interfaceType")));
    objc_msgSend(v4, "addObject:", v33);

  }
  v34 = v59;
  if (objc_msgSend(v4, "count"))
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[291], "andPredicateWithSubpredicates:", v4));
    objc_msgSend(v59, "setPredicate:", v35);

  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "limit"));

  if (v36)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "limit"));
    objc_msgSend(v59, "setFetchLimit:", objc_msgSend(v37, "unsignedIntegerValue"));

  }
  objc_msgSend(v59, "setReturnsObjectsAsFaults:", 0);
  v38 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), objc_msgSend(*(id *)(a1 + 32), "ascending"));
  v81 = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v81, 1));
  objc_msgSend(v59, "setSortDescriptors:", v39);

  objc_msgSend(v59, "setFetchBatchSize:", 100);
  v40 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v40 + 40);
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v59, &obj));
  objc_storeStrong((id *)(v40 + 40), obj);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  v43 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
  {
    v53 = NSStringFromSelector(*(SEL *)(a1 + 56));
    v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
    v55 = objc_msgSend(v41, "count");
    v56 = *(_QWORD *)(a1 + 32);
    v57 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138413314;
    v72 = v54;
    v73 = 2112;
    v74 = v59;
    v75 = 2048;
    v76 = v55;
    v77 = 2112;
    v78 = v57;
    v79 = 2112;
    v80 = v56;
    _os_log_debug_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@, options, %@", buf, 0x34u);

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v44 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v41, "count")));
    v45 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v46 = *(void **)(v45 + 40);
    *(_QWORD *)(v45 + 40) = v44;

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v47 = v41;
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v62;
      do
      {
        for (j = 0; j != v49; j = (char *)j + 1)
        {
          if (*(_QWORD *)v62 != v50)
            objc_enumerationMutation(v47);
          v52 = -[MOEventBundle initWithEventBundleMO:]([MOEventBundle alloc], "initWithEventBundleMO:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)j));
          if (v52)
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v52);

        }
        v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
      }
      while (v49);
    }

    v34 = v59;
    v4 = v60;
  }

}

void __68__MOEventBundleStore_fetchEventBundleWithOptions_CompletionHandler___block_invoke_180(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a2;
  v6 = v5;
  if (!a3)
  {
    v11 = v5;
    v7 = objc_msgSend(v5, "count");
    v6 = v11;
    if (v7)
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 0));
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v6 = v11;
    }
  }

}

void __68__MOEventBundleStore_fetchEventBundleWithOptions_CompletionHandler___block_invoke_186(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  id v7;

  v6 = a2;
  if (!a3)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v6 = v7;
  }

}

- (void)fetchEventBundleWithGranularity:(unint64_t)a3 interfaceTypes:(id)a4 CompletionHandler:(id)a5
{
  id v9;
  void (**v10)(id, uint64_t, uint64_t);
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  id os_log;
  NSObject *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  unint64_t v29;
  SEL v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  _BYTE v45[128];

  v9 = a4;
  v10 = (void (**)(id, uint64_t, uint64_t))a5;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__32;
  v41 = __Block_byref_object_dispose__32;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__32;
  v35 = __Block_byref_object_dispose__32;
  v36 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleStore persistenceManager](self, "persistenceManager"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = __87__MOEventBundleStore_fetchEventBundleWithGranularity_interfaceTypes_CompletionHandler___block_invoke;
  v25[3] = &unk_1002B4E10;
  v20 = v9;
  v26 = v20;
  v27 = &v37;
  v29 = a3;
  v30 = a2;
  v28 = &v31;
  objc_msgSend(v11, "performBlockAndWait:", v25);

  if (objc_msgSend((id)v32[5], "count"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleStore engagementDelegate](self, "engagementDelegate"));
    objc_msgSend(v12, "eventBundleStore:needsEngagementInfoForBundles:", self, v32[5]);

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = (id)v32[5];
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v45, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v13);
          v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
          v19 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v44 = v17;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "fetched event bundle from store :%@", buf, 0xCu);
          }

        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v45, 16);
      }
      while (v14);
    }

  }
  v10[2](v10, v32[5], v38[5]);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

}

void __87__MOEventBundleStore_fetchEventBundleWithGranularity_interfaceTypes_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id os_log;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  MOEventBundle *v24;
  NSString *v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id obj;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  uint64_t v43;
  id v44;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleMO fetchRequest](MOEventBundleMO, "fetchRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("interfaceType IN %@ "), *(_QWORD *)(a1 + 32)));
  objc_msgSend(v5, "addObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("summarizationGranularity == %lu"), *(_QWORD *)(a1 + 56)));
  objc_msgSend(v5, "addObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isAggregatedAndSuppressed == 0")));
  objc_msgSend(v5, "addObject:", v8);

  if (objc_msgSend(v5, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v5));
    objc_msgSend(v4, "setPredicate:", v9);

  }
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v10 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
  v44 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v44, 1));
  objc_msgSend(v4, "setSortDescriptors:", v11);

  objc_msgSend(v4, "setFetchBatchSize:", 100);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v12 + 40);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v4, &obj));
  objc_storeStrong((id *)(v12 + 40), obj);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  v15 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v25 = NSStringFromSelector(*(SEL *)(a1 + 64));
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = objc_msgSend(v13, "count");
    v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    v37 = v26;
    v38 = 2112;
    v39 = v4;
    v40 = 2048;
    v41 = v27;
    v42 = 2112;
    v43 = v28;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v29 = v3;
    v16 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v13, "count")));
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v19 = v13;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v31;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v31 != v22)
            objc_enumerationMutation(v19);
          v24 = -[MOEventBundle initWithEventBundleMO:]([MOEventBundle alloc], "initWithEventBundleMO:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v23));
          if (v24)
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v24);

          v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v21);
    }

    v3 = v29;
  }
  objc_msgSend(v3, "reset");

}

- (void)fetchBundleTypeDistributionFromStoreWithHandler:(id)a3
{
  void (**v4)(id, id, _QWORD);
  NSMutableDictionary *v5;
  void *v6;
  NSMutableDictionary *v7;
  _QWORD v8[4];
  NSMutableDictionary *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = (void (**)(id, id, _QWORD))a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__32;
  v15 = __Block_byref_object_dispose__32;
  v16 = 0;
  v5 = objc_opt_new(NSMutableDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleStore persistenceManager](self, "persistenceManager"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __70__MOEventBundleStore_fetchBundleTypeDistributionFromStoreWithHandler___block_invoke;
  v8[3] = &unk_1002B3928;
  v7 = v5;
  v9 = v7;
  v10 = &v11;
  objc_msgSend(v6, "performBlockAndWait:", v8);

  v4[2](v4, v7, v12[5]);
  _Block_object_dispose(&v11, 8);

}

void __70__MOEventBundleStore_fetchBundleTypeDistributionFromStoreWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v3 = a2;
  v4 = 1;
  do
  {
    v5 = objc_autoreleasePoolPush();
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleMO fetchRequest](MOEventBundleMO, "fetchRequest"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("interfaceType == %d"), v4));
    objc_msgSend(v6, "setPredicate:", v7);

    v18 = 0;
    v8 = objc_msgSend(v3, "countForFetchRequest:error:", v6, &v18);
    v9 = v18;

    if (v8)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v8));
      v11 = *(void **)(a1 + 32);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

    }
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v13 + 40);
    v14 = (id *)(v13 + 40);
    v15 = v16;
    if (v16)
      v17 = v15;
    else
      v17 = v9;
    objc_storeStrong(v14, v17);

    objc_autoreleasePoolPop(v5);
    v4 = (v4 + 1);
  }
  while ((_DWORD)v4 != 16);
  objc_msgSend(v3, "reset");

}

- (void)getRankingParamsandCompletionHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = (void (**)(id, void *, _QWORD))a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__32;
  v18 = __Block_byref_object_dispose__32;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__32;
  v12 = __Block_byref_object_dispose__32;
  v13 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleStore persistenceManager](self, "persistenceManager"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __59__MOEventBundleStore_getRankingParamsandCompletionHandler___block_invoke;
  v7[3] = &unk_1002B4E60;
  v7[4] = &v14;
  v7[5] = &v8;
  objc_msgSend(v5, "performBlockAndWait:", v7);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v9[5]));
  v4[2](v4, v6, v15[5]);

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v14, 8);

}

void __59__MOEventBundleStore_getRankingParamsandCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id os_log;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  id obj;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MORankingParamsMO fetchRequest](MORankingParamsMO, "fetchRequest"));
  objc_msgSend(v4, "setFetchLimit:", 1);
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v5 + 40);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v4, &obj));
  objc_storeStrong((id *)(v5 + 40), obj);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __59__MOEventBundleStore_getRankingParamsandCompletionHandler___block_invoke_cold_1();

  }
  else
  {
    v9 = objc_alloc_init((Class)NSMutableArray);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __59__MOEventBundleStore_getRankingParamsandCompletionHandler___block_invoke_2;
    v12[3] = &unk_1002B4E38;
    v12[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);
  }
  objc_msgSend(v3, "reset");

}

void __59__MOEventBundleStore_getRankingParamsandCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "rankingParams"));
  objc_msgSend(v2, "addObject:", v3);

}

- (void)storeRankingParams:(id)a3 forContext:(id)a4 forEvergreenScore:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  MOEventBundleStore *v16;
  BOOL v17;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleStore persistenceManager](self, "persistenceManager"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __70__MOEventBundleStore_storeRankingParams_forContext_forEvergreenScore___block_invoke;
  v13[3] = &unk_1002B4E88;
  v14 = v8;
  v15 = v9;
  v17 = a5;
  v16 = self;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "performBlockAndWait:", v13);

}

void __70__MOEventBundleStore_storeRankingParams_forContext_forEvergreenScore___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  void *v7;
  id os_log;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  void *v22;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MORankingParamsMO managedObjectWithObject:inManagedObjectContext:forContext:forEvergreenScore:](MORankingParamsMO, "managedObjectWithObject:inManagedObjectContext:forContext:forEvergreenScore:", *(_QWORD *)(a1 + 32), v3, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56)));
  v20 = 0;
  v5 = objc_msgSend(v3, "save:", &v20);
  v6 = v20;
  v7 = v6;
  if ((v5 & 1) != 0)
  {

    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "saving ranking params succeeded %@", buf, 0xCu);
    }

    v10 = *(void **)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v10, "_submitRankingParamsAnalytics:withSubmissionDate:", v11, v12);
    v7 = 0;
  }
  else
  {
    v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    v12 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __70__MOEventBundleStore_storeRankingParams_forContext_forEvergreenScore___block_invoke_cold_1((uint64_t)v7, v12, v14, v15, v16, v17, v18, v19);
  }

  objc_msgSend(v3, "reset");
}

- (void)_submitRankingParamsAnalytics:(id)a3 withSubmissionDate:(id)a4
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  float v26;
  float v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  float v32;
  float v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  float v38;
  float v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  float v44;
  float v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  float v50;
  float v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  float v56;
  float v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  float v62;
  float v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  float v68;
  float v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  float v74;
  float v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  float v80;
  float v81;
  double v82;
  void *v83;
  id v84;
  NSObject *v85;
  NSObject *p_super;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD v95[4];
  NSMutableDictionary *v96;
  uint8_t buf[16];

  v5 = a4;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Submitting ranking params to CoreAnalytics.", buf, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "components:fromDate:", 764, v5));

  v11 = objc_msgSend(v10, "year");
  v12 = objc_msgSend(v10, "month");
  v13 = objc_msgSend(v10, "day");
  v14 = objc_msgSend(v10, "hour");
  v15 = objc_msgSend(v10, "minute");
  v16 = objc_opt_new(NSMutableDictionary);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v11));
  objc_msgSend(v6, "safeSavePropertyToDictionary:withKey:andValue:", v16, CFSTR("submissionTimeYear"), v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v12));
  objc_msgSend(v6, "safeSavePropertyToDictionary:withKey:andValue:", v16, CFSTR("submissionTimeMonth"), v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13));
  objc_msgSend(v6, "safeSavePropertyToDictionary:withKey:andValue:", v16, CFSTR("submissionTimeDay"), v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v14));
  objc_msgSend(v6, "safeSavePropertyToDictionary:withKey:andValue:", v16, CFSTR("submissionTimeHour"), v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v15));
  objc_msgSend(v6, "safeSavePropertyToDictionary:withKey:andValue:", v16, CFSTR("submissionTimeMinute"), v21);

  LODWORD(v22) = 1176256512;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v22));
  objc_msgSend(v6, "safeSavePropertyToDictionary:withKey:andValue:", v16, CFSTR("scalingFactorForAnalytics"), v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dynamicModelParameterDict"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", &off_1002DAE50));
  objc_msgSend(v25, "floatValue");
  v27 = v26 * 10000.0;

  *(float *)&v28 = v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v28));
  objc_msgSend(v6, "safeSavePropertyToDictionary:withKey:andValue:", v16, CFSTR("activityInterfaceTypeEngagementWeight"), v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dynamicModelParameterDict"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", &off_1002DADF0));
  objc_msgSend(v31, "floatValue");
  v33 = v32 * 10000.0;

  *(float *)&v34 = v33;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v34));
  objc_msgSend(v6, "safeSavePropertyToDictionary:withKey:andValue:", v16, CFSTR("outingInterfaceTypeEngagementWeight"), v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dynamicModelParameterDict"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", &off_1002DAE80));
  objc_msgSend(v37, "floatValue");
  v39 = v38 * 10000.0;

  *(float *)&v40 = v39;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v40));
  objc_msgSend(v6, "safeSavePropertyToDictionary:withKey:andValue:", v16, CFSTR("significantContactInterfaceTypeEngagementWeight"), v41);

  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dynamicModelParameterDict"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", &off_1002DAE98));
  objc_msgSend(v43, "floatValue");
  v45 = v44 * 10000.0;

  *(float *)&v46 = v45;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v46));
  objc_msgSend(v6, "safeSavePropertyToDictionary:withKey:andValue:", v16, CFSTR("yourMediaInterfaceTypeEngagementWeight"), v47);

  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dynamicModelParameterDict"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", &off_1002DAEB0));
  objc_msgSend(v49, "floatValue");
  v51 = v50 * 10000.0;

  *(float *)&v52 = v51;
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v52));
  objc_msgSend(v6, "safeSavePropertyToDictionary:withKey:andValue:", v16, CFSTR("yourTimeAtHomeInterfaceTypeEngagementWeight"), v53);

  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dynamicModelParameterDict"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", &off_1002DAE08));
  objc_msgSend(v55, "floatValue");
  v57 = v56 * 10000.0;

  *(float *)&v58 = v57;
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v58));
  objc_msgSend(v6, "safeSavePropertyToDictionary:withKey:andValue:", v16, CFSTR("photoMemoryInterfaceTypeEngagementWeight"), v59);

  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dynamicModelParameterDict"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "objectForKeyedSubscript:", &off_1002DAEC8));
  objc_msgSend(v61, "floatValue");
  v63 = v62 * 10000.0;

  *(float *)&v64 = v63;
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v64));
  objc_msgSend(v6, "safeSavePropertyToDictionary:withKey:andValue:", v16, CFSTR("evergreenInterfaceTypeEngagementWeight"), v65);

  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dynamicModelParameterDict"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "objectForKeyedSubscript:", &off_1002DAE38));
  objc_msgSend(v67, "floatValue");
  v69 = v68 * 10000.0;

  *(float *)&v70 = v69;
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v70));
  objc_msgSend(v6, "safeSavePropertyToDictionary:withKey:andValue:", v16, CFSTR("timeContextInterfaceTypeEngagementWeight"), v71);

  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dynamicModelParameterDict"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "objectForKeyedSubscript:", &off_1002DAE20));
  objc_msgSend(v73, "floatValue");
  v75 = v74 * 10000.0;

  *(float *)&v76 = v75;
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v76));
  objc_msgSend(v6, "safeSavePropertyToDictionary:withKey:andValue:", v16, CFSTR("tripInterfaceTypeEngagementWeight"), v77);

  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dynamicModelParameterDict"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "objectForKeyedSubscript:", &off_1002DAEE0));
  objc_msgSend(v79, "floatValue");
  v81 = v80 * 10000.0;

  *(float *)&v82 = v81;
  v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v82));
  objc_msgSend(v6, "safeSavePropertyToDictionary:withKey:andValue:", v16, CFSTR("clusteringInterfaceTypeEngagementWeight"), v83);

  if (v16)
  {
    v95[0] = _NSConcreteStackBlock;
    v95[1] = 3221225472;
    v95[2] = __71__MOEventBundleStore__submitRankingParamsAnalytics_withSubmissionDate___block_invoke;
    v95[3] = &unk_1002B2238;
    v96 = v16;
    AnalyticsSendEventLazy(CFSTR("com.apple.Moments.MORankingParams"), v95);
    v84 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
    v85 = objc_claimAutoreleasedReturnValue(v84);
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
      -[MOEventBundleStore _submitRankingParamsAnalytics:withSubmissionDate:].cold.2(v85);

    p_super = &v96->super.super;
  }
  else
  {
    v87 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
    p_super = objc_claimAutoreleasedReturnValue(v87);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      -[MOEventBundleStore _submitRankingParamsAnalytics:withSubmissionDate:].cold.1(p_super, v88, v89, v90, v91, v92, v93, v94);
  }

}

id __71__MOEventBundleStore__submitRankingParamsAnalytics_withSubmissionDate___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)getEventBundleStartedWithInterval:(id)a3 interfaceTypes:(id)a4 CompletionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, uint64_t, uint64_t);
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  SEL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, uint64_t, uint64_t))a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__32;
  v31 = __Block_byref_object_dispose__32;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__32;
  v25 = __Block_byref_object_dispose__32;
  v26 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleStore persistenceManager](self, "persistenceManager"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __89__MOEventBundleStore_getEventBundleStartedWithInterval_interfaceTypes_CompletionHandler___block_invoke;
  v15[3] = &unk_1002B4EB0;
  v13 = v9;
  v16 = v13;
  v14 = v10;
  v17 = v14;
  v18 = &v27;
  v19 = &v21;
  v20 = a2;
  objc_msgSend(v12, "performBlockAndWait:", v15);

  v11[2](v11, v22[5], v28[5]);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
}

void __89__MOEventBundleStore_getEventBundleStartedWithInterval_interfaceTypes_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _UNKNOWN **v7;
  _UNKNOWN **v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id os_log;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  MOEventBundle *v38;
  NSString *v39;
  void *v40;
  id v41;
  uint64_t v42;
  id v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id obj;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  uint64_t v62;
  id v63;
  _BYTE v64[128];
  _QWORD v65[2];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleMO fetchRequest](MOEventBundleMO, "fetchRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = *(void **)(a1 + 32);
  v7 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
  v8 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
  v44 = v5;
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("startDate <= %@"), v9));
    v65[0] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "startDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("startDate >= %@"), v11));
    v65[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v65, 2));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v13));
    objc_msgSend(v44, "addObject:", v14);

    v7 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
    v8 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;

    v5 = v44;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v43 = v3;
    v15 = objc_opt_new(NSMutableArray);
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v16 = *(id *)(a1 + 40);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v51;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v51 != v19)
            objc_enumerationMutation(v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("interfaceType == %lu"), objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)v20), "unsignedIntValue")));
          -[NSMutableArray addObject:](v15, "addObject:", v21);

          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
      }
      while (v18);
    }

    v7 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v15));
    v5 = v44;
    objc_msgSend(v44, "addObject:", v22);

    v3 = v43;
    v8 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
  }
  if (objc_msgSend(v5, "count"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[291], "andPredicateWithSubpredicates:", v5));
    objc_msgSend(v4, "setPredicate:", v23);

  }
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v24 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
  v63 = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8[284], "arrayWithObjects:count:", &v63, 1));
  objc_msgSend(v4, "setSortDescriptors:", v25);

  objc_msgSend(v4, "setFetchBatchSize:", 100);
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v26 + 40);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v4, &obj));
  objc_storeStrong((id *)(v26 + 40), obj);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  v29 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    v39 = NSStringFromSelector(*(SEL *)(a1 + 64));
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    v41 = objc_msgSend(v27, "count");
    v42 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    v56 = v40;
    v57 = 2112;
    v58 = v4;
    v59 = 2048;
    v60 = v41;
    v61 = 2112;
    v62 = v42;
    _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v30 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v27, "count")));
    v31 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v32 = *(void **)(v31 + 40);
    *(_QWORD *)(v31 + 40) = v30;

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v33 = v27;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v46;
      do
      {
        v37 = 0;
        do
        {
          if (*(_QWORD *)v46 != v36)
            objc_enumerationMutation(v33);
          v38 = -[MOEventBundle initWithEventBundleMO:]([MOEventBundle alloc], "initWithEventBundleMO:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)v37));
          if (v38)
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v38);

          v37 = (char *)v37 + 1;
        }
        while (v35 != v37);
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      }
      while (v35);
    }

    v5 = v44;
  }
  objc_msgSend(v3, "reset");

}

- (void)updateEventBundles:(id)a3 CompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  MOEventBundleFetchOptions *v9;
  id os_log;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[4];
  NSMutableArray *v18;
  uint8_t buf[8];
  NSErrorUserInfoKey v20;
  const __CFString *v21;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __59__MOEventBundleStore_updateEventBundles_CompletionHandler___block_invoke;
    v17[3] = &unk_1002B13E0;
    v18 = objc_opt_new(NSMutableArray);
    v8 = v18;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v17);
    v9 = -[MOEventBundleFetchOptions initWithIdentifiers:ascending:filterBundle:]([MOEventBundleFetchOptions alloc], "initWithIdentifiers:ascending:filterBundle:", v8, 1, 0);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __59__MOEventBundleStore_updateEventBundles_CompletionHandler___block_invoke_2;
    v14[3] = &unk_1002B4F00;
    v16 = v7;
    v14[4] = self;
    v15 = v6;
    -[MOEventBundleStore fetchEventBundleWithOptions:CompletionHandler:](self, "fetchEventBundleWithOptions:CompletionHandler:", v9, v14);

LABEL_7:
    goto LABEL_8;
  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[updateEventBundles] no bundles to update", buf, 2u);
  }

  if (v7)
  {
    v12 = objc_alloc((Class)NSError);
    v20 = NSLocalizedDescriptionKey;
    v21 = CFSTR("[updateEventBundles] No bundles were provided to update");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v8 = (NSMutableArray *)objc_msgSend(v12, "initWithDomain:code:userInfo:", CFSTR("MOEventBundleStore"), 0, v13);

    (*((void (**)(id, NSMutableArray *, _QWORD))v7 + 2))(v7, v8, 0);
    goto LABEL_7;
  }
LABEL_8:

}

void __59__MOEventBundleStore_updateEventBundles_CompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
    objc_msgSend(v4, "addObject:", v5);

  }
}

void __59__MOEventBundleStore_updateEventBundles_CompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[updateEventBundles] Error while fetching existing bundles for update. Error:%@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __59__MOEventBundleStore_updateEventBundles_CompletionHandler___block_invoke_2_cold_1(v5, v9);

    if (objc_msgSend(v5, "count"))
    {
      v10 = *(void **)(a1 + 32);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = __59__MOEventBundleStore_updateEventBundles_CompletionHandler___block_invoke_206;
      v14[3] = &unk_1002B4ED8;
      v11 = *(id *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(a1 + 40);
      v16 = v11;
      v14[4] = v12;
      v15 = v13;
      objc_msgSend(v10, "removeEventBundles:CompletionHandler:", v5, v14);

    }
  }

}

void __59__MOEventBundleStore_updateEventBundles_CompletionHandler___block_invoke_206(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleStore);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[updateEventBundles] Error while removing existing bundles for update. Error:%@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[updateEventBundles] Removed existing bundles", buf, 2u);
    }

    v11 = *(void **)(a1 + 32);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __59__MOEventBundleStore_updateEventBundles_CompletionHandler___block_invoke_207;
    v15[3] = &unk_1002B4ED8;
    v12 = *(id *)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    v17 = v12;
    v15[4] = v13;
    v16 = v14;
    objc_msgSend(v11, "purgeDeletedEventBundlesWithCompletionHandler:", v15);

  }
}

void __59__MOEventBundleStore_updateEventBundles_CompletionHandler___block_invoke_207(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  id v15;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[updateEventBundles] Error while purging existing bundles. Error:%@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[updateEventBundles] Purged existing bundles", buf, 2u);
    }

    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __59__MOEventBundleStore_updateEventBundles_CompletionHandler___block_invoke_208;
    v12[3] = &unk_1002ADA40;
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v10, "storeEventBundles:CompletionHandler:", v11, v12);

  }
}

void __59__MOEventBundleStore_updateEventBundles_CompletionHandler___block_invoke_208(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  _BOOL4 v9;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[updateEventBundles] Error while storing updated bundles. Error:%@", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (v9)
  {
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[updateEventBundles] Stored updated bundles. result, %@, error, %@", (uint8_t *)&v10, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
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

- (MOEventBundleStoreEngagementDelegate)engagementDelegate
{
  return (MOEventBundleStoreEngagementDelegate *)objc_loadWeakRetained((id *)&self->_engagementDelegate);
}

- (void)setEngagementDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_engagementDelegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_engagementDelegate);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
}

- (void)initWithPersistenceManager:(os_log_t)log andConfigurationManager:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: persistenceManager", v1, 2u);
  OUTLINED_FUNCTION_2_2();
}

void __58__MOEventBundleStore_storeEventBundles_CompletionHandler___block_invoke_cold_1(uint8_t *buf, uint64_t a2, _QWORD *a3, os_log_t log)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 40);
  *(_DWORD *)buf = 138412290;
  *a3 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "error, %@", buf, 0xCu);
}

void __58__MOEventBundleStore_storeEventBundles_CompletionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15(__stack_chk_guard);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_recordDedupeKey:(os_log_t)log alreadySeenKeys:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "The dedupe key is nil.", v1, 2u);
  OUTLINED_FUNCTION_2_2();
}

+ (void)_recordResource:(uint64_t)a1 alreadySeenKeys:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "The dedupe key is nil for resource, %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

+ (void)_recordResource:(uint64_t)a1 alreadySeenKeys:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "identifier"));
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v2, v3, "Unable to retrieve dedupe key due to error, %@. Falling back to identifier, %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)_updateLongTermBundles:(uint64_t)a1 context:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_0(a1, a2), "contactIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_9_1((uint64_t)v3, 5.7779e-34);
  OUTLINED_FUNCTION_1_14((void *)&_mh_execute_header, v4, v5, "Person with contact identifier, %@, is a duplicate of a previously processed person object.");

  OUTLINED_FUNCTION_7_1();
}

- (void)_updateLongTermBundles:(uint64_t)a1 context:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_0(a1, a2), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_9_1((uint64_t)v3, 5.7779e-34);
  OUTLINED_FUNCTION_1_14((void *)&_mh_execute_header, v4, v5, "Person with local identifier, %@, is a duplicate of a previously processed person object.");

  OUTLINED_FUNCTION_7_1();
}

- (void)_updateLongTermBundles:(uint64_t)a1 context:(uint64_t)a2 .cold.3(uint64_t a1, uint64_t a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_0(a1, a2), "place");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  OUTLINED_FUNCTION_9_1((uint64_t)v4, 5.7779e-34);
  OUTLINED_FUNCTION_1_14((void *)&_mh_execute_header, v5, v6, "Place with identifier, %@, is a duplicate of a previously processed place.");

}

- (void)_updateLongTermBundles:(uint64_t)a1 context:(uint64_t)a2 .cold.4(uint64_t a1, uint64_t a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_0(a1, a2), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_9_1((uint64_t)v3, 5.7779e-34);
  OUTLINED_FUNCTION_1_14((void *)&_mh_execute_header, v4, v5, "Place with identifier, %@, is a duplicate of a previously processed place.");

  OUTLINED_FUNCTION_7_1();
}

- (void)_updateLongTermBundles:(uint64_t)a1 context:(uint64_t)a2 .cold.5(uint64_t a1, uint64_t a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_0(a1, a2), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_9_1((uint64_t)v3, 5.7779e-34);
  OUTLINED_FUNCTION_1_14((void *)&_mh_execute_header, v4, v5, "Resource with identifier, %@, is a duplicate of a previously processed resource");

  OUTLINED_FUNCTION_7_1();
}

- (void)_updateLongTermBundles:(uint64_t)a1 context:(uint64_t)a2 .cold.6(uint64_t a1, uint64_t a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_0(a1, a2), "eventIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_9_1((uint64_t)v3, 5.7779e-34);
  OUTLINED_FUNCTION_1_14((void *)&_mh_execute_header, v4, v5, "Event with identifier, %@, is a duplicate of a previously processed event");

  OUTLINED_FUNCTION_7_1();
}

void __80__MOEventBundleStore_removeEventBundlesStartedWithinInterval_CompletionHandler___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  NSString *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = NSStringFromSelector(*(SEL *)(a1 + 56));
  objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v3, v4, "%@, event bundles delete operation error, %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

void __68__MOEventBundleStore_purgeDeletedEventBundlesWithCompletionHandler___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  NSString *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = NSStringFromSelector(*(SEL *)(a1 + 48));
  objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v3, v4, "%@, event bundles delete operation error, %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

void __68__MOEventBundleStore_purgeExpiredEventBundlesWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15(__stack_chk_guard);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving event bundles purge operation error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __83__MOEventBundleStore_purgeEventBundlesWithNoEventsAssociatedWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15(__stack_chk_guard);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving non-evergreen event bundles purge operation error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __72__MOEventBundleStore_purgeInvalidEvergreenBundlesWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15(__stack_chk_guard);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving evergreen event bundles purge operation error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __78__MOEventBundleStore_purgeEventBundlesWithRehydrationFailureCount_andHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15(__stack_chk_guard);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving event bundles purge due to rehydration failure error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __59__MOEventBundleStore_purgeDanglingEventBundlesWithHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15(__stack_chk_guard);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving dangling event bundles purge error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __59__MOEventBundleStore_getRankingParamsandCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15(__stack_chk_guard);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Reading ranking params error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __70__MOEventBundleStore_storeRankingParams_forContext_forEvergreenScore___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "Saving error params error, %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_submitRankingParamsAnalytics:(uint64_t)a3 withSubmissionDate:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a1, a3, "CA payload (%@) is nil. Skip submission", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_submitRankingParamsAnalytics:(os_log_t)log withSubmissionDate:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Completed ranking params CoreAnalytics submission.", v1, 2u);
  OUTLINED_FUNCTION_2_2();
}

void __59__MOEventBundleStore_updateEventBundles_CompletionHandler___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  int v3;
  id v4;

  v3 = 134217984;
  v4 = objc_msgSend(a1, "count");
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[updateEventBundles] Existing bundles to be updated:%lu", (uint8_t *)&v3, 0xCu);
}

@end
