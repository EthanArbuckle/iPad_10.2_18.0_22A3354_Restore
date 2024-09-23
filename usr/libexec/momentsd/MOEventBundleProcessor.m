@implementation MOEventBundleProcessor

+ (id)approvedForLearnFromThisApp:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id os_log;
  NSObject *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleProcessor _learningFromAppDenyList](MOEventBundleProcessor, "_learningFromAppDenyList"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleProcessor _filterAndAnnotateResults:denyList:](MOEventBundleProcessor, "_filterAndAnnotateResults:denyList:", v3, v4));
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
    v7 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[MOEventBundleProcessor(LearnFromThisApp) approvedForLearnFromThisApp:].cold.1();

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleProcessor _filterAndAnnotateResults:denyList:](MOEventBundleProcessor, "_filterAndAnnotateResults:denyList:", v3, v8));

  }
  return v5;
}

+ (id)_learningFromAppDenyList
{
  id v2;
  void *v3;
  id v4;
  id os_log;
  NSObject *v6;

  v2 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.suggestions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("SiriCanLearnFromAppBlacklist")));
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v3);
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[MOEventBundleProcessor(LearnFromThisApp) _learningFromAppDenyList].cold.1();

    v4 = 0;
  }

  return v4;
}

+ (BOOL)_validResource:(id)a3 bundle:(id)a4 denyList:(id)a5 sourceAppBundleIds:(id)a6 removedAppBundleIds:(id)a7 lftaStatusDict:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  id v39;
  void *v40;
  BOOL v41;
  id os_log;
  void *v43;
  void *v44;
  id v46;
  NSObject *log;
  id v48;
  id v49;
  id v50;
  void *v51;
  void *context;
  id v53;
  id v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  id v60;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sourceAppBundleIds"));
  if (!v19)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
    v20 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleIdentifier"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "UUIDString"));
      *(_DWORD *)buf = 138412290;
      v56 = v44;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "approvedForLearnFromThisApp, dropping resource no source app tagging, bundleId=%@", buf, 0xCu);

    }
    goto LABEL_17;
  }
  objc_msgSend(v16, "unionSet:", v19);
  v20 = objc_msgSend(v19, "mutableCopy");
  -[NSObject intersectSet:](v20, "intersectSet:", v15);
  if (!v20 || !-[NSObject count](v20, "count"))
  {
    v54 = v17;
    context = objc_autoreleasePoolPush();
    v27 = objc_alloc_init((Class)NSDateFormatter);
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    objc_msgSend(v27, "setCalendar:");
    objc_msgSend(v27, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "getDictionary"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerBundleID")));

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v29));
    if (!v30)
    {
      v41 = 1;
      goto LABEL_19;
    }
    v48 = v16;
    v50 = v15;
    v31 = v14;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v29));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("active_time")));

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "getDictionary"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerStartDate")));
    objc_msgSend(v35, "doubleValue");
    v37 = v36;

    v14 = v31;
    if (v33 && v37 != 0.0)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "dateFromString:", v33));
      v39 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSinceReferenceDate:", v37);
      v40 = v39;
      if (v38 && objc_msgSend(v39, "compare:", v38) == (id)-1)
      {
        v46 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
        log = objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v56 = v40;
          v57 = 2112;
          v58 = v38;
          v59 = 2112;
          v60 = v13;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "media resource removed due to LFTA switch active time, resource start date, %@, switch active time, %@, resource, %@", buf, 0x20u);
        }

        v41 = 0;
        goto LABEL_14;
      }

    }
    v41 = 1;
LABEL_14:
    v16 = v48;
    v15 = v50;
LABEL_19:

    objc_autoreleasePoolPop(context);
    v17 = v54;
    goto LABEL_20;
  }
  v21 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject description](v20, "description"));
    v49 = v15;
    v53 = v14;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleIdentifier"));
    v25 = v17;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "UUIDString"));
    *(_DWORD *)buf = 138412546;
    v56 = v23;
    v57 = 2112;
    v58 = v26;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "approvedForLearnFromThisApp, dropping resource due to LFTA being off for %@, bundleId=%@", buf, 0x16u);

    v17 = v25;
    v14 = v53;
    v15 = v49;

  }
  objc_msgSend(v17, "unionSet:", v20);
LABEL_17:
  v41 = 0;
LABEL_20:

  return v41;
}

+ (void)_stripMediaActions:(id)a3
{
  id v3;
  NSMutableArray *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  NSMutableArray *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actions"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "actionType") != (id)6)
          -[NSMutableArray addObject:](v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "setActions:", v4);
  v11 = objc_opt_new(NSMutableArray);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "backgroundActions", 0));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)j);
        if (objc_msgSend(v17, "actionType") != (id)6)
          -[NSMutableArray addObject:](v11, "addObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }

  objc_msgSend(v3, "setBackgroundActions:", v4);
  objc_msgSend(v3, "setConcurrentMediaAction:", 0);

}

+ (id)_getBundleIdSet:(id)a3
{
  id v3;
  NSSet *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id obj;
  uint64_t v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v3 = a3;
  v4 = objc_opt_new(NSSet);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v3;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v26;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v5);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resources"));
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v22;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v22 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v11);
              v13 = objc_autoreleasePoolPush();
              if (objc_msgSend(v12, "type") == (id)3)
              {
                v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "getDictionary"));
                v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerBundleID")));

                v16 = objc_claimAutoreleasedReturnValue(-[NSSet setByAddingObject:](v4, "setByAddingObject:", v15));
                v4 = (NSSet *)v16;
              }
              objc_autoreleasePoolPop(v13);
              v11 = (char *)v11 + 1;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v9);
        }

        v5 = (char *)v5 + 1;
      }
      while (v5 != v20);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v20);
  }

  return v4;
}

+ (id)_filterAndAnnotateResults:(id)a3 denyList:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *i;
  void *v10;
  NSMutableArray *v11;
  void *v12;
  id v13;
  id v14;
  char v15;
  uint64_t v16;
  void *j;
  void *v18;
  unsigned int v19;
  void *v20;
  id v21;
  id os_log;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  MOEventBundleProcessorResult *v31;
  id v32;
  id v33;
  void *v35;
  void *v36;
  id obj;
  NSMutableArray *v38;
  uint64_t v39;
  id v40;
  void *v41;
  NSMutableSet *v42;
  NSMutableSet *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  id v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  _BYTE v59[128];

  v5 = a3;
  v6 = a4;
  v43 = objc_opt_new(NSMutableSet);
  v42 = objc_opt_new(NSMutableSet);
  v38 = objc_opt_new(NSMutableArray);
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleProcessor readLearnedFromTheAppStatusTable](MOEventBundleProcessor, "readLearnedFromTheAppStatusTable"));
  v7 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleProcessor _getBundleIdSet:](MOEventBundleProcessor, "_getBundleIdSet:", v5));
  v8 = v6;
  +[MOEventBundleProcessor updateLearnedFromTheAppDictionary:denyList:statusDict:](MOEventBundleProcessor, "updateLearnedFromTheAppDictionary:denyList:statusDict:");
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v5;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
  if (v40)
  {
    v39 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v40; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v39)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
        v11 = objc_opt_new(NSMutableArray);
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "resources"));
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
        if (v13)
        {
          v14 = v13;
          v41 = i;
          v15 = 0;
          v16 = *(_QWORD *)v45;
          do
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(_QWORD *)v45 != v16)
                objc_enumerationMutation(v12);
              v18 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)j);
              if (objc_msgSend(v18, "type") == (id)3)
              {
                v19 = !+[MOEventBundleProcessor _validResource:bundle:denyList:sourceAppBundleIds:removedAppBundleIds:lftaStatusDict:](MOEventBundleProcessor, "_validResource:bundle:denyList:sourceAppBundleIds:removedAppBundleIds:lftaStatusDict:", v18, v10, v8, v43, v42, v7);
                v15 |= v19;
                if ((v19 & 1) != 0)
                  continue;
              }
              -[NSMutableArray addObject:](v11, "addObject:", v18);
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
          }
          while (v14);

          objc_msgSend(v10, "setResources:", v11);
          i = v41;
          if ((v15 & 1) != 0)
            +[MOEventBundleProcessor _stripMediaActions:](MOEventBundleProcessor, "_stripMediaActions:", v10);
        }
        else
        {

          objc_msgSend(v10, "setResources:", v11);
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "resources"));
        v21 = objc_msgSend(v20, "count");

        if (v21)
        {
          -[NSMutableArray addObject:](v38, "addObject:", v10);
        }
        else
        {
          os_log = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
          v23 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "UUIDString"));
            *(_DWORD *)buf = 138412290;
            v53 = v25;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "approvedForLearnFromThisApp, dropping bundle due to no renderable resource. bundleId=%@", buf, 0xCu);

          }
        }

      }
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
    }
    while (v40);
  }

  v26 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v28 = -[NSMutableArray count](v38, "count");
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet description](v43, "description"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet description](v42, "description"));
    *(_DWORD *)buf = 134218498;
    v53 = v28;
    v54 = 2112;
    v55 = v29;
    v56 = 2112;
    v57 = v30;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "approvedForLearnFromThisApp, allowedBundles.count=%lu, sourceAppBundleIds=%@, removedAppBundleIds=%@", buf, 0x20u);

  }
  v31 = [MOEventBundleProcessorResult alloc];
  v32 = -[NSMutableArray copy](v38, "copy");
  v33 = -[MOEventBundleProcessorResult init:sourceAppBundleIds:removedAppBundleIds:](v31, "init:sourceAppBundleIds:removedAppBundleIds:", v32, v43, v42);

  return v33;
}

+ (void)updateLearnedFromTheAppDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[MOEventBundleProcessor _learningFromAppDenyList](MOEventBundleProcessor, "_learningFromAppDenyList"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleProcessor readLearnedFromTheAppStatusTable](MOEventBundleProcessor, "readLearnedFromTheAppStatusTable"));
  v5 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v4);
  +[MOEventBundleProcessor updateLearnedFromTheAppDictionary:denyList:statusDict:](MOEventBundleProcessor, "updateLearnedFromTheAppDictionary:denyList:statusDict:", v3, v6, v5);

}

+ (void)updateLearnedFromTheAppDictionary:(id)a3 denyList:(id)a4 statusDict:(id)a5
{
  id v7;
  id os_log;
  NSObject *v9;
  int v10;
  id v11;

  v7 = a5;
  if (+[MOEventBundleProcessor constructLearnedFromTheAppDictionary:denyList:statusDict:](MOEventBundleProcessor, "constructLearnedFromTheAppDictionary:denyList:statusDict:", a3, a4, v7))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "LFTA status changed, need to update the status table, %@", (uint8_t *)&v10, 0xCu);
    }

    +[MOEventBundleProcessor persistLearnedFromTheAppStatusTable:](MOEventBundleProcessor, "persistLearnedFromTheAppStatusTable:", v7);
  }

}

+ (BOOL)constructLearnedFromTheAppDictionary:(id)a3 denyList:(id)a4 statusDict:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  BOOL v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  id v31;
  NSDate *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *i;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  id obj;
  uint64_t v46;
  id v47;
  id v48;
  NSMutableDictionary *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];

  v7 = a3;
  v47 = a4;
  v8 = a5;
  v49 = objc_opt_new(NSMutableDictionary);
  v9 = objc_alloc_init((Class)NSDateFormatter);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  objc_msgSend(v9, "setCalendar:", v10);
  v44 = v9;
  objc_msgSend(v9, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  v13 = v12 != 0;
  obj = v11;
  v48 = v12;
  if (!v12)
    goto LABEL_33;
  v43 = v10;
  v14 = 0;
  v46 = *(_QWORD *)v55;
  do
  {
    v15 = 0;
    do
    {
      if (*(_QWORD *)v55 != v46)
        objc_enumerationMutation(obj);
      v16 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)v15);
      v17 = objc_autoreleasePoolPush();
      v18 = objc_msgSend(v47, "containsObject:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v16));

      if (v18)
      {
        if (v19)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v16));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", CFSTR("status")));
          if (v21)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v16));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", CFSTR("status")));
            v24 = objc_msgSend(v23, "isEqualToString:", MOLearnedFromTheAppStatusOn);

          }
          else
          {
            v24 = 0;
          }

          v14 |= v24;
        }
        else
        {
          v14 = 1;
        }
        v31 = objc_alloc_init((Class)NSMutableDictionary);
        objc_msgSend(v31, "setObject:forKey:", MOLearnedFromTheAppStatusOff, CFSTR("status"));
      }
      else
      {
        if (v19)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v16));
          v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKey:", CFSTR("status")));
          if (v26)
          {
            v27 = (void *)v26;
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v16));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKey:", CFSTR("status")));
            v30 = objc_msgSend(v29, "isEqualToString:", MOLearnedFromTheAppStatusOn);

            if (v30)
            {
              v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v16));
              goto LABEL_22;
            }
          }
          else
          {

          }
          v31 = objc_alloc_init((Class)NSMutableDictionary);
          objc_msgSend(v31, "setObject:forKey:", MOLearnedFromTheAppStatusOn, CFSTR("status"));
          v32 = objc_opt_new(NSDate);
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "stringFromDate:", v32));
          objc_msgSend(v31, "setObject:forKey:", v33, CFSTR("active_time"));
        }
        else
        {
          v31 = objc_alloc_init((Class)NSMutableDictionary);
          objc_msgSend(v31, "setObject:forKey:", MOLearnedFromTheAppStatusOn, CFSTR("status"));
          v32 = objc_opt_new(NSDate);
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](v32, "dateByAddingTimeInterval:", -2419200.0));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "stringFromDate:", v33));
          objc_msgSend(v31, "setObject:forKey:", v34, CFSTR("active_time"));

        }
        v14 = 1;
      }
LABEL_22:
      -[NSMutableDictionary setObject:forKey:](v49, "setObject:forKey:", v31, v16);

      objc_autoreleasePoolPop(v17);
      v15 = (char *)v15 + 1;
    }
    while (v48 != v15);
    v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  }
  while (v48);

  if ((v14 & 1) != 0)
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v11 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v49, "allKeys"));
    v35 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v36; i = (char *)i + 1)
        {
          if (*(_QWORD *)v51 != v37)
            objc_enumerationMutation(v11);
          v39 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
          v40 = objc_autoreleasePoolPush();
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v49, "objectForKeyedSubscript:", v39));
          objc_msgSend(v8, "setObject:forKey:", v41, v39);

          objc_autoreleasePoolPop(v40);
        }
        v36 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      }
      while (v36);
    }
    v10 = v43;
    v13 = 1;
LABEL_33:

  }
  else
  {
    v13 = 0;
    v10 = v43;
  }

  return v13;
}

+ (id)readLearnedFromTheAppStatusTable
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id os_log;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  NSObject *v25;
  id v26;
  uint64_t v28;
  id v29;
  uint8_t buf[4];
  const __CFString *v31;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MOPersistenceUtilities userCacheDirectoryPath](MOPersistenceUtilities, "userCacheDirectoryPath"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v2, 1));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("learnedFromTheApp.plist")));

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
    v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

    os_log = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if ((v7 & 1) != 0)
    {
      if (v10)
      {
        *(_DWORD *)buf = 138412290;
        v31 = CFSTR("learnedFromTheApp.plist");
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "File %@ found.", buf, 0xCu);
      }

      v29 = 0;
      v11 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfURL:error:", v4, &v29);
      v12 = v29;
      if (v12)
      {
        v13 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          +[MOEventBundleProcessor(LearnFromThisApp) readLearnedFromTheAppStatusTable].cold.3((uint64_t)v12, v14, v15, v16, v17, v18, v19, v20);

        v28 = 0;
        objc_msgSend(v5, "removeItemAtURL:error:", v4, &v28);
        if (v28)
        {
          v21 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
          v22 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            +[MOEventBundleProcessor(LearnFromThisApp) readLearnedFromTheAppStatusTable].cold.2();

        }
        v23 = objc_alloc_init((Class)NSDictionary);
      }
      else
      {
        v23 = v11;
      }
      v26 = v23;

    }
    else
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "No plist found at path.", buf, 2u);
      }

      v26 = objc_alloc_init((Class)NSDictionary);
    }

  }
  else
  {
    v24 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      +[MOEventBundleProcessor(LearnFromThisApp) readLearnedFromTheAppStatusTable].cold.1();

    v26 = objc_alloc_init((Class)NSDictionary);
  }

  return v26;
}

+ (void)persistLearnedFromTheAppStatusTable:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  unsigned __int8 v7;
  id v8;
  id os_log;
  NSObject *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t v21[8];
  id v22;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOPersistenceUtilities userCacheDirectoryPath](MOPersistenceUtilities, "userCacheDirectoryPath"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v4, 1));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("learnedFromTheApp.plist")));

    if (v6)
    {
      v22 = 0;
      v7 = objc_msgSend(v3, "writeToURL:error:", v6, &v22);
      v8 = v22;
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
      v10 = objc_claimAutoreleasedReturnValue(os_log);
      v11 = v10;
      if (v8 || (v7 & 1) == 0)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          +[MOEventBundleProcessor(LearnFromThisApp) persistLearnedFromTheAppStatusTable:].cold.3((uint64_t)v8, v11, v15, v16, v17, v18, v19, v20);
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "LFTA status were successfully written to plist.", v21, 2u);
      }

      goto LABEL_15;
    }
  }
  else
  {
    v12 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[MOEventBundleProcessor(LearnFromThisApp) persistLearnedFromTheAppStatusTable:].cold.2();

  }
  v14 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
  v6 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    +[MOEventBundleProcessor(LearnFromThisApp) persistLearnedFromTheAppStatusTable:].cold.1();
LABEL_15:

}

+ (id)onboardingDatesBySourceTypeWithStandardSuite:(BOOL)a3
{
  MODefaultsManager *v3;
  MODefaultsManager *v4;
  NSMutableDictionary *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  if (a3)
    v3 = -[MODefaultsManager initWithSuiteName:]([MODefaultsManager alloc], "initWithSuiteName:", CFSTR("com.apple.momentsd"));
  else
    v3 = objc_alloc_init(MODefaultsManager);
  v4 = v3;
  v5 = objc_opt_new(NSMutableDictionary);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleSourceTypes all](MOEventBundleSourceTypes, "all", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MODefaultsManager onboardingDateFor:](v4, "onboardingDateFor:", v11));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MODefaultsManager onboardingDateForJournalingSuggestions](v4, "onboardingDateForJournalingSuggestions"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v13, CFSTR("OnboardingDate"));

  return v5;
}

+ (id)trimmedFrom:(id)a3 with:(id)a4 respectOnboardingDate:(BOOL)a5 shouldUseStandardSuite:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  id v9;
  id v10;
  id os_log;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  _BOOL4 v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  char *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *i;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  unsigned int v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  NSObject *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  unsigned __int8 v59;
  void *v60;
  unsigned int v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  unsigned __int8 v68;
  int v69;
  id v70;
  NSObject *v71;
  void *v72;
  void *v73;
  id v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  NSObject *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  NSObject *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  id v92;
  uint64_t v93;
  void *j;
  void *v95;
  void *v96;
  unsigned int v97;
  void *v98;
  unsigned __int8 v99;
  void *v100;
  void *v101;
  id v102;
  NSObject *v103;
  void *v104;
  void *v105;
  id v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  void *v111;
  unsigned int v112;
  void *v113;
  unsigned __int8 v114;
  void *v115;
  void *v116;
  id v117;
  NSObject *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  unsigned __int8 v124;
  void *v125;
  id v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  __CFString *v131;
  unsigned int v132;
  void *v133;
  unsigned __int8 v134;
  void *v135;
  void *v136;
  id v137;
  NSObject *v138;
  void *v139;
  void *v140;
  unsigned __int8 v141;
  id v142;
  id v143;
  uint64_t v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  id v149;
  int v150;
  void *v151;
  unsigned int v152;
  void *v153;
  id v154;
  NSObject *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  id v160;
  void *v161;
  id v162;
  void *v163;
  void *v164;
  unsigned int v165;
  id v166;
  NSObject *v167;
  void *v168;
  void *v169;
  id v170;
  NSObject *v171;
  void *v172;
  void *v173;
  void *v174;
  id v175;
  id v176;
  uint64_t v177;
  void *k;
  void *v179;
  void *v180;
  unsigned __int8 v181;
  id v182;
  NSObject *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  unsigned int v190;
  id v191;
  NSObject *p_super;
  void *v193;
  void *v194;
  void *v195;
  id v196;
  id v197;
  uint64_t v198;
  void *m;
  void *v200;
  void *v201;
  unsigned __int8 v202;
  id v203;
  NSObject *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  id v210;
  id v211;
  uint64_t v212;
  void *n;
  void *v214;
  void *v215;
  unsigned __int8 v216;
  id v217;
  NSObject *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  id v224;
  id v225;
  uint64_t v226;
  void *ii;
  void *v228;
  void *v229;
  unsigned int v230;
  id v231;
  void *v232;
  unsigned int v233;
  void *v234;
  void *v235;
  void *v236;
  id v237;
  unsigned int v238;
  NSObject *v239;
  id v240;
  NSMutableArray *v241;
  id v242;
  id v243;
  uint64_t v244;
  void *jj;
  char v246;
  id v247;
  NSObject *v248;
  void *v249;
  void *v250;
  void *v251;
  BOOL v252;
  id v253;
  NSObject *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  char v259;
  void *v260;
  unsigned int v261;
  id v262;
  NSObject *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  id v269;
  id v270;
  uint64_t v271;
  void *kk;
  uint64_t v273;
  void *v274;
  unsigned __int8 v275;
  id v276;
  NSObject *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  BOOL v283;
  void *v284;
  void *v285;
  id v286;
  NSObject *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  id v292;
  id v293;
  NSObject *v294;
  NSObject *v295;
  void *v296;
  char *v297;
  void *v298;
  char *v299;
  void *v300;
  char *v301;
  void *v302;
  char *v303;
  void *v304;
  id v305;
  void *v306;
  id v307;
  id v308;
  id v309;
  int *v311;
  id v312;
  id v313;
  void *v314;
  void *v315;
  NSMutableArray *v316;
  void *v317;
  _BOOL4 v318;
  id obj;
  id v320;
  __CFString *v321;
  NSMutableArray *v322;
  void *v323;
  uint64_t v324;
  id v325;
  char *v326;
  NSMutableArray *v327;
  void *v328;
  void *v329;
  void *v330;
  uint64_t v331;
  void *v332;
  NSMutableArray *v333;
  unsigned __int8 v334;
  NSMutableArray *v335;
  void *v336;
  void *v337;
  void *v338;
  id v339;
  NSMutableArray *v340;
  id v341;
  void *v342;
  NSMutableArray *v343;
  NSMutableArray *v344;
  _BOOL4 v345;
  void *v346;
  NSMutableArray *v347;
  NSMutableSet *v348;
  NSMutableSet *v349;
  __int128 v350;
  __int128 v351;
  __int128 v352;
  __int128 v353;
  __int128 v354;
  __int128 v355;
  __int128 v356;
  __int128 v357;
  __int128 v358;
  __int128 v359;
  __int128 v360;
  __int128 v361;
  __int128 v362;
  __int128 v363;
  __int128 v364;
  __int128 v365;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  __int128 v371;
  __int128 v372;
  __int128 v373;
  __int128 v374;
  __int128 v375;
  __int128 v376;
  __int128 v377;
  __int128 v378;
  __int128 v379;
  __int128 v380;
  __int128 v381;
  __int128 v382;
  __int128 v383;
  __int128 v384;
  __int128 v385;
  __int128 v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  __int128 v392;
  __int128 v393;
  __int128 v394;
  __int128 v395;
  __int128 v396;
  __int128 v397;
  uint8_t buf[4];
  void *v399;
  __int16 v400;
  _BYTE v401[10];
  id v402;
  __int16 v403;
  char *v404;
  __int16 v405;
  char *v406;
  __int16 v407;
  id v408;
  __int16 v409;
  id v410;
  __int16 v411;
  _BOOL4 v412;
  char v413[4];
  int v414;
  char v415[24];
  _BYTE v416[128];
  _BYTE v417[128];
  _BYTE v418[128];
  _BYTE v419[128];
  _BYTE v420[128];
  _BYTE v421[128];
  _BYTE v422[128];
  _BYTE v423[128];
  _BYTE v424[128];
  _BYTE v425[128];
  _BYTE v426[128];
  _BYTE v427[128];

  v6 = a6;
  v7 = a5;
  v9 = a3;
  v10 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description"));
    *(_DWORD *)buf = 138412802;
    v399 = v13;
    v400 = 1024;
    *(_DWORD *)v401 = v7;
    *(_WORD *)&v401[4] = 1024;
    *(_DWORD *)&v401[6] = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "trimmedFrom, allowedSourceTypes=%@, respectOnboardingDate=%d, shouldUseStandardSuite=%d", buf, 0x18u);

  }
  v316 = objc_opt_new(NSMutableArray);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleSourceTypes all](MOEventBundleSourceTypes, "all"));
  v15 = objc_msgSend(v14, "mutableCopy");

  objc_msgSend(v15, "minusSet:", v10);
  v325 = v15;
  if (v7)
  {
    v346 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleProcessor onboardingDatesBySourceTypeWithStandardSuite:](MOEventBundleProcessor, "onboardingDatesBySourceTypeWithStandardSuite:", v6));
    v16 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v346, "description"));
      *(_DWORD *)buf = 138412290;
      v399 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "trimmedFrom, onboardingDates=%@", buf, 0xCu);

    }
  }
  else
  {
    v346 = 0;
  }
  v397 = 0u;
  v396 = 0u;
  v395 = 0u;
  v394 = 0u;
  obj = v9;
  v320 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v394, v427, 16);
  if (v320)
  {
    if (v346)
      v19 = v7;
    else
      v19 = 0;
    v318 = v19;
    v324 = *(_QWORD *)v395;
    v311 = &v414;
    v341 = v10;
    v345 = v7;
    do
    {
      v20 = 0;
      v21 = v320;
      do
      {
        if (*(_QWORD *)v395 != v324)
          objc_enumerationMutation(obj);
        v326 = (char *)v20;
        v338 = *(void **)(*((_QWORD *)&v394 + 1) + 8 * (_QWORD)v20);
        v22 = objc_msgSend(v338, "copy", v311);
        v23 = objc_alloc((Class)NSSet);
        v342 = v22;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "primarySourceTypes"));
        v25 = objc_msgSend(v23, "initWithArray:", v24);

        v26 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v338, "bundleIdentifier"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "UUIDString"));
          v30 = objc_msgSend(v338, "interfaceType");
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "description"));
          *(_DWORD *)buf = 138412802;
          v399 = v29;
          v400 = 2048;
          *(_QWORD *)v401 = v30;
          *(_WORD *)&v401[8] = 2112;
          v402 = v31;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "trimmedFrom, processing candidate bundleID=%@, interfaceType=%lu, primaryTypes=%@", buf, 0x20u);

        }
        v336 = v25;
        if (objc_msgSend(v25, "intersectsSet:", v325))
        {
          v32 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
          v33 = objc_claimAutoreleasedReturnValue(v32);
          v34 = v342;
          v348 = (NSMutableSet *)v33;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "description"));
            *(_DWORD *)buf = 138412290;
            v399 = v35;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "trimmedFrom, dropping, primary event disallowed, primaryTypes=%@", buf, 0xCu);

          }
          v36 = v326;
          goto LABEL_290;
        }
        v34 = v342;
        if (v318)
        {
          v348 = objc_opt_new(NSMutableSet);
          v390 = 0u;
          v391 = 0u;
          v392 = 0u;
          v393 = 0u;
          v349 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "events"));
          v37 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v349, "countByEnumeratingWithState:objects:count:", &v390, v426, 16);
          if (v37)
          {
            v38 = v37;
            v39 = *(_QWORD *)v391;
            do
            {
              for (i = 0; i != v38; i = (char *)i + 1)
              {
                if (*(_QWORD *)v391 != v39)
                  objc_enumerationMutation(v349);
                v41 = *(void **)(*((_QWORD *)&v390 + 1) + 8 * (_QWORD)i);
                v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "bundleSourceType"));
                v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v346, "objectForKeyedSubscript:"));
                v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "startDate"));
                v337 = (void *)v43;
                v45 = objc_msgSend(v44, "isAfterDate:", v43);

                if (v45)
                {
                  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "eventIdentifier"));

                  if (v46)
                  {
                    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "eventIdentifier"));
                    -[NSMutableSet addObject:](v348, "addObject:", v47);

                  }
                }
                v48 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
                v49 = objc_claimAutoreleasedReturnValue(v48);
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                {
                  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "eventIdentifier"));
                  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "UUIDString"));
                  *(_DWORD *)buf = 138412802;
                  v399 = v42;
                  v400 = 2112;
                  *(_QWORD *)v401 = v52;
                  *(_WORD *)&v401[8] = 1024;
                  LODWORD(v402) = v45;
                  _os_log_debug_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "trimmedFrom, event onboarding date check, sourceType=%@, id=%@, valid=%d", buf, 0x1Cu);

                }
                v50 = v42;
                if (objc_msgSend(v336, "containsObject:", v42)
                  && (objc_msgSend(v10, "containsObject:", v42) & v45 & 1) == 0)
                {
                  v70 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
                  v71 = objc_claimAutoreleasedReturnValue(v70);
                  v347 = (NSMutableArray *)v71;
                  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
                  {
                    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v338, "bundleIdentifier"));
                    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "UUIDString"));
                    *(_DWORD *)buf = 138412290;
                    v399 = v73;
                    _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "trimmedFrom, dropping, primary event before onboarding date, bundleID=%@", buf, 0xCu);

                  }
                  v21 = v320;
                  v36 = v326;
                  v34 = v342;
                  goto LABEL_289;
                }

              }
              v38 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v349, "countByEnumeratingWithState:objects:count:", &v390, v426, 16);
            }
            while (v38);
          }

          v21 = v320;
          v34 = v342;
        }
        else
        {
          v348 = 0;
        }
        v349 = objc_opt_new(NSMutableSet);
        v53 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
        v54 = objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
        {
          v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "action"));
          v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "actions"));
          *(_DWORD *)buf = 138412546;
          v399 = v78;
          v400 = 2112;
          *(_QWORD *)v401 = v79;
          _os_log_debug_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEBUG, "trimmedFrom, action=%@, actions=%@", buf, 0x16u);

          v34 = v342;
        }

        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "action"));
        v337 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "bundleSourceType"));
        v323 = v55;
        if (v55)
        {
          if ((objc_msgSend(v10, "containsObject:", v337) & 1) == 0)
          {
            v74 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
            v75 = objc_claimAutoreleasedReturnValue(v74);
            v347 = (NSMutableArray *)v75;
            if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
            {
              v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bundleIdentifier"));
              v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "UUIDString"));
              *(_DWORD *)buf = 138412290;
              v399 = v77;
              _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_INFO, "trimmedFrom, primary action not allowed, dropping bundle, bundleID=%@", buf, 0xCu);

              v34 = v342;
            }
            goto LABEL_57;
          }
          if (v7)
          {
            v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "sourceEventIdentifier"));
            if (v56)
            {
              v57 = (void *)v56;
              v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v323, "sourceEventIdentifier"));
              v59 = -[NSMutableSet containsObject:](v348, "containsObject:", v58);

              v34 = v342;
              if ((v59 & 1) == 0)
              {
                v80 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
                v81 = objc_claimAutoreleasedReturnValue(v80);
                v347 = (NSMutableArray *)v81;
                if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
                {
                  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "bundleIdentifier"));
                  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "UUIDString"));
                  v50 = v323;
                  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v323, "sourceEventIdentifier"));
                  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "UUIDString"));
                  *(_DWORD *)buf = 138412546;
                  v399 = v83;
                  v400 = 2112;
                  *(_QWORD *)v401 = v85;
                  _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_INFO, "trimmedFrom, primary action past onboarding date, dropping bundle, bundleID=%@, sourceID=%@", buf, 0x16u);

                  v34 = v342;
                  v36 = v326;
                  goto LABEL_289;
                }
LABEL_57:
                v36 = v326;
                v50 = v323;
                goto LABEL_289;
              }
            }
          }
        }
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "concurrentMediaAction"));

        if (!v60)
          goto LABEL_67;
        v61 = objc_msgSend(v10, "containsObject:", MOEventBundleSourceTypeMedia[0]);
        if (v61)
        {
          if (!v7)
            goto LABEL_63;
          v62 = v34;
          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "concurrentMediaAction"));
          v64 = objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "sourceEventIdentifier"));
          if (!v64)
          {

LABEL_63:
            v69 = 1;
            goto LABEL_64;
          }
          v65 = (void *)v64;
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "concurrentMediaAction"));
          v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "sourceEventIdentifier"));
          v68 = -[NSMutableSet containsObject:](v348, "containsObject:", v67);

          if ((v68 & 1) != 0)
            goto LABEL_63;
          v69 = 0;
          v34 = v342;
        }
        else
        {
          v69 = 1;
        }
        objc_msgSend(v34, "setConcurrentMediaAction:", 0);
LABEL_64:
        v86 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
        v87 = objc_claimAutoreleasedReturnValue(v86);
        if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
        {
          v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "bundleIdentifier"));
          v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "UUIDString"));
          *(_DWORD *)buf = 138413058;
          v399 = v89;
          v400 = 1024;
          *(_DWORD *)v401 = v61;
          *(_WORD *)&v401[4] = 1024;
          *(_DWORD *)&v401[6] = v69;
          LOWORD(v402) = 1024;
          *(_DWORD *)((char *)&v402 + 2) = v7;
          _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_INFO, "trimmedFrom, checking concurrent media action, bundleID=%@, validConcurrentMediaAction=%d, hasValidConcurrentMediaDate=%d, respectOnboardingDate=%d", buf, 0x1Eu);

        }
        v34 = v342;
LABEL_67:
        v347 = objc_opt_new(NSMutableArray);
        v386 = 0u;
        v387 = 0u;
        v388 = 0u;
        v389 = 0u;
        v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "actions"));
        v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v386, v425, 16);
        if (!v91)
          goto LABEL_83;
        v92 = v91;
        v93 = *(_QWORD *)v387;
        do
        {
          for (j = 0; j != v92; j = (char *)j + 1)
          {
            if (*(_QWORD *)v387 != v93)
              objc_enumerationMutation(v90);
            v95 = *(void **)(*((_QWORD *)&v386 + 1) + 8 * (_QWORD)j);
            v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "bundleSourceType"));
            v97 = objc_msgSend(v10, "containsObject:", v96);
            if (v7)
            {
              if (v97)
              {
                v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "sourceEventIdentifier"));
                v99 = -[NSMutableSet containsObject:](v348, "containsObject:", v98);

                if ((v99 & 1) != 0)
                {
LABEL_80:
                  v103 = objc_msgSend(v95, "copy");
                  -[NSMutableArray addObject:](v347, "addObject:", v103);
                  goto LABEL_81;
                }
              }
            }
            else if (v97)
            {
              goto LABEL_80;
            }
            v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "sourceEventIdentifier"));

            if (v100)
            {
              v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "sourceEventIdentifier"));
              -[NSMutableSet addObject:](v349, "addObject:", v101);

            }
            v102 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
            v103 = objc_claimAutoreleasedReturnValue(v102);
            if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG))
            {
              v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "description"));
              *(_DWORD *)buf = 138412546;
              v399 = v104;
              v400 = 2112;
              *(_QWORD *)v401 = v96;
              _os_log_debug_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEBUG, "trimmedFrom, action not allowed, action=%@, sourceType=%@", buf, 0x16u);

            }
LABEL_81:

          }
          v92 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v386, v425, 16);
        }
        while (v92);
LABEL_83:

        objc_msgSend(v342, "setActions:", v347);
        v322 = objc_opt_new(NSMutableArray);
        v382 = 0u;
        v383 = 0u;
        v384 = 0u;
        v385 = 0u;
        v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "backgroundActions"));
        v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v382, v424, 16);
        if (!v106)
          goto LABEL_99;
        v107 = v106;
        v108 = *(_QWORD *)v383;
        while (2)
        {
          v109 = 0;
          while (2)
          {
            if (*(_QWORD *)v383 != v108)
              objc_enumerationMutation(v105);
            v110 = *(void **)(*((_QWORD *)&v382 + 1) + 8 * v109);
            v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "bundleSourceType"));
            v112 = objc_msgSend(v10, "containsObject:", v111);
            if (!v7)
            {
              if (!v112)
                goto LABEL_91;
LABEL_96:
              v118 = objc_msgSend(v110, "copy");
              -[NSMutableArray addObject:](v347, "addObject:", v118);
              goto LABEL_97;
            }
            if (v112)
            {
              v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "sourceEventIdentifier"));
              v114 = -[NSMutableSet containsObject:](v348, "containsObject:", v113);

              if ((v114 & 1) != 0)
                goto LABEL_96;
            }
LABEL_91:
            v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "sourceEventIdentifier"));

            if (v115)
            {
              v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "sourceEventIdentifier"));
              -[NSMutableSet addObject:](v349, "addObject:", v116);

            }
            v117 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
            v118 = objc_claimAutoreleasedReturnValue(v117);
            if (os_log_type_enabled(v118, OS_LOG_TYPE_DEBUG))
            {
              v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "description"));
              *(_DWORD *)buf = 138412546;
              v399 = v119;
              v400 = 2112;
              *(_QWORD *)v401 = v111;
              _os_log_debug_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEBUG, "trimmedFrom, background action not allowed, action=%@, sourceType=%@", buf, 0x16u);

            }
LABEL_97:

            if (v107 != (id)++v109)
              continue;
            break;
          }
          v107 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v382, v424, 16);
          if (v107)
            continue;
          break;
        }
LABEL_99:

        v34 = v342;
        objc_msgSend(v342, "setBackgroundActions:", v322);
        v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "place"));
        v321 = MOEventBundleSourceTypeVisitLocation[0];
        v317 = v120;
        if (!v120)
          goto LABEL_104;
        if ((objc_msgSend(v10, "containsObject:", v321) & 1) == 0)
        {
          v170 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
          v171 = objc_claimAutoreleasedReturnValue(v170);
          v343 = (NSMutableArray *)v171;
          if (os_log_type_enabled(v171, OS_LOG_TYPE_INFO))
          {
            v172 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "bundleIdentifier"));
            v173 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v172, "UUIDString"));
            *(_DWORD *)buf = 138412290;
            v399 = v173;
            _os_log_impl((void *)&_mh_execute_header, v171, OS_LOG_TYPE_INFO, "trimmedFrom, primary place not allowed, dropping bundle, bundleID=%@", buf, 0xCu);
            goto LABEL_152;
          }
LABEL_153:
          v21 = v320;
          v36 = v326;
          v50 = v323;
          goto LABEL_288;
        }
        if (v7)
        {
          v121 = objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "sourceEventIdentifier"));
          if (v121)
          {
            v122 = (void *)v121;
            v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "sourceEventIdentifier"));
            v124 = -[NSMutableSet containsObject:](v348, "containsObject:", v123);

            v34 = v342;
            if ((v124 & 1) == 0)
            {
              v253 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
              v254 = objc_claimAutoreleasedReturnValue(v253);
              v343 = (NSMutableArray *)v254;
              if (os_log_type_enabled(v254, OS_LOG_TYPE_INFO))
              {
                v172 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "bundleIdentifier"));
                v173 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v172, "UUIDString"));
                v255 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "sourceEventIdentifier"));
                v256 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v255, "UUIDString"));
                *(_DWORD *)buf = 138412546;
                v399 = v173;
                v400 = 2112;
                *(_QWORD *)v401 = v256;
                _os_log_impl((void *)&_mh_execute_header, v254, OS_LOG_TYPE_INFO, "trimmedFrom, primary place past onboarding date, dropping bundle, bundleID=%@, sourceID=%@", buf, 0x16u);

LABEL_152:
                v34 = v342;

              }
              goto LABEL_153;
            }
          }
        }
LABEL_104:
        v343 = objc_opt_new(NSMutableArray);
        v378 = 0u;
        v379 = 0u;
        v380 = 0u;
        v381 = 0u;
        v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "places"));
        v126 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v378, v423, 16);
        if (!v126)
          goto LABEL_120;
        v127 = v126;
        v128 = *(_QWORD *)v379;
        while (2)
        {
          v129 = 0;
          while (2)
          {
            if (*(_QWORD *)v379 != v128)
              objc_enumerationMutation(v125);
            v130 = *(void **)(*((_QWORD *)&v378 + 1) + 8 * v129);
            v131 = MOEventBundleSourceTypeVisitLocation[0];
            v132 = objc_msgSend(v10, "containsObject:", v131);
            if (!v7)
            {
              if (!v132)
                goto LABEL_112;
LABEL_117:
              v138 = objc_msgSend(v130, "copy");
              -[NSMutableArray addObject:](v343, "addObject:", v138);
              goto LABEL_118;
            }
            if (v132)
            {
              v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "sourceEventIdentifier"));
              v134 = -[NSMutableSet containsObject:](v348, "containsObject:", v133);

              if ((v134 & 1) != 0)
                goto LABEL_117;
            }
LABEL_112:
            v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "sourceEventIdentifier"));

            if (v135)
            {
              v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "sourceEventIdentifier"));
              -[NSMutableSet addObject:](v349, "addObject:", v136);

            }
            v137 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
            v138 = objc_claimAutoreleasedReturnValue(v137);
            if (os_log_type_enabled(v138, OS_LOG_TYPE_DEBUG))
            {
              v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "description"));
              *(_DWORD *)buf = 138412546;
              v399 = v139;
              v400 = 2112;
              *(_QWORD *)v401 = v131;
              _os_log_debug_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_DEBUG, "trimmedFrom, place not allowed, action=%@, sourceType=%@", buf, 0x16u);

            }
LABEL_118:

            if (v127 != (id)++v129)
              continue;
            break;
          }
          v127 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v378, v423, 16);
          if (v127)
            continue;
          break;
        }
LABEL_120:

        v140 = v342;
        objc_msgSend(v342, "setPlaces:", v343);
        v141 = objc_msgSend(v10, "containsObject:", MOEventBundleSourceTypeContact[0]);
        if (!v7)
          goto LABEL_145;
        v334 = v141;
        v344 = objc_opt_new(NSMutableArray);
        v374 = 0u;
        v375 = 0u;
        v376 = 0u;
        v377 = 0u;
        v339 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "persons"));
        v142 = objc_msgSend(v339, "countByEnumeratingWithState:objects:count:", &v374, v422, 16);
        if (!v142)
          goto LABEL_142;
        v143 = v142;
        v144 = *(_QWORD *)v375;
        while (2)
        {
          v145 = 0;
          while (2)
          {
            if (*(_QWORD *)v375 != v144)
              objc_enumerationMutation(v339);
            v146 = *(void **)(*((_QWORD *)&v374 + 1) + 8 * (_QWORD)v145);
            v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v346, "objectForKeyedSubscript:", MOEventBundleSourceTypePhoto[0]));
            v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "sourceEventIdentifier"));
            if (-[NSMutableSet containsObject:](v348, "containsObject:", v148))
            {

              goto LABEL_128;
            }
            if (objc_msgSend(v146, "sourceEventAccessType") != (id)4)
            {

              goto LABEL_133;
            }
            v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v338, "startDate"));
            v152 = objc_msgSend(v151, "isAfterDate:", v147);

            if (v152)
            {
LABEL_128:
              v149 = objc_msgSend(v146, "copy");
              -[NSMutableArray addObject:](v344, "addObject:", v149);
              v150 = 1;
              goto LABEL_135;
            }
LABEL_133:
            v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "sourceEventIdentifier"));

            if (v153)
            {
              v149 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "sourceEventIdentifier"));
              -[NSMutableSet addObject:](v349, "addObject:", v149);
              v150 = 0;
LABEL_135:

            }
            else
            {
              v150 = 0;
            }
            v154 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
            v155 = objc_claimAutoreleasedReturnValue(v154);
            if (os_log_type_enabled(v155, OS_LOG_TYPE_DEBUG))
            {
              v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v338, "bundleIdentifier"));
              v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "UUIDString"));
              v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "sourceEventIdentifier"));
              v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "UUIDString"));
              *(_DWORD *)buf = 138412802;
              v399 = v157;
              v400 = 2112;
              *(_QWORD *)v401 = v159;
              *(_WORD *)&v401[8] = 1024;
              LODWORD(v402) = v150;
              _os_log_debug_impl((void *)&_mh_execute_header, v155, OS_LOG_TYPE_DEBUG, "trimmedFrom, checking person date, bundleID=%@, personID=%@, validDate=%d", buf, 0x1Cu);

              v10 = v341;
            }

            v145 = (char *)v145 + 1;
            v7 = v345;
            if (v143 != v145)
              continue;
            break;
          }
          v160 = objc_msgSend(v339, "countByEnumeratingWithState:objects:count:", &v374, v422, 16);
          v143 = v160;
          if (v160)
            continue;
          break;
        }
LABEL_142:

        objc_msgSend(v342, "setPersons:", v344);
        if (objc_msgSend(v336, "containsObject:", MOEventBundleSourceTypeContact[0]))
        {
          v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "persons"));
          v162 = objc_msgSend(v161, "count");

          if (!v162)
          {
            v247 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
            v248 = objc_claimAutoreleasedReturnValue(v247);
            if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
            {
              v249 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v338, "bundleIdentifier"));
              v250 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v249, "UUIDString"));
              *(_DWORD *)buf = 138412290;
              v399 = v250;
              _os_log_impl((void *)&_mh_execute_header, v248, OS_LOG_TYPE_DEFAULT, "trimmedFrom, dropping, no allowable persons, bundleID=%@", buf, 0xCu);

            }
            v21 = v320;
            goto LABEL_227;
          }
        }

        v140 = v342;
        v141 = v334;
LABEL_145:
        if ((v141 & 1) == 0)
          objc_msgSend(v140, "setPersons:", 0);
        v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "place"));
        v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v163, "sourceEventIdentifier"));
        v165 = -[NSMutableSet containsObject:](v349, "containsObject:", v164);

        if (!v165)
        {
          v344 = objc_opt_new(NSMutableArray);
          v370 = 0u;
          v371 = 0u;
          v372 = 0u;
          v373 = 0u;
          v174 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "places"));
          v175 = objc_msgSend(v174, "countByEnumeratingWithState:objects:count:", &v370, v421, 16);
          if (v175)
          {
            v176 = v175;
            v177 = *(_QWORD *)v371;
            do
            {
              for (k = 0; k != v176; k = (char *)k + 1)
              {
                if (*(_QWORD *)v371 != v177)
                  objc_enumerationMutation(v174);
                v179 = *(void **)(*((_QWORD *)&v370 + 1) + 8 * (_QWORD)k);
                v180 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v179, "sourceEventIdentifier"));
                v181 = -[NSMutableSet containsObject:](v349, "containsObject:", v180);

                if ((v181 & 1) != 0)
                {
                  v182 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
                  v183 = objc_claimAutoreleasedReturnValue(v182);
                  if (os_log_type_enabled(v183, OS_LOG_TYPE_INFO))
                  {
                    v184 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "bundleIdentifier"));
                    v185 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "UUIDString"));
                    v186 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v179, "sourceEventIdentifier"));
                    v187 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v186, "UUIDString"));
                    *(_DWORD *)buf = 138412546;
                    v399 = v185;
                    v400 = 2112;
                    *(_QWORD *)v401 = v187;
                    _os_log_impl((void *)&_mh_execute_header, v183, OS_LOG_TYPE_INFO, "trimmedFrom, dropping place in final consistency pass, bundleID=%@, placeID=%@", buf, 0x16u);

                  }
                }
                else
                {
                  -[NSMutableArray addObject:](v344, "addObject:", v179);
                }
              }
              v176 = objc_msgSend(v174, "countByEnumeratingWithState:objects:count:", &v370, v421, 16);
            }
            while (v176);
          }

          objc_msgSend(v342, "setPlaces:", v344);
          v188 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "action"));
          v189 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v188, "sourceEventIdentifier"));
          v190 = -[NSMutableSet containsObject:](v349, "containsObject:", v189);

          if (v190)
          {
            v191 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
            p_super = objc_claimAutoreleasedReturnValue(v191);
            v21 = v320;
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
            {
              v193 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "bundleIdentifier"));
              v194 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v193, "UUIDString"));
              *(_DWORD *)buf = 138412290;
              v399 = v194;
              _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_INFO, "trimmedFrom, primary action on disallow list, dropping bundle, bundleID=%@", buf, 0xCu);

            }
            v10 = v341;
            v36 = v326;
            v50 = v323;
            goto LABEL_286;
          }
          v335 = objc_opt_new(NSMutableArray);
          v366 = 0u;
          v367 = 0u;
          v368 = 0u;
          v369 = 0u;
          v195 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "actions"));
          v196 = objc_msgSend(v195, "countByEnumeratingWithState:objects:count:", &v366, v420, 16);
          if (v196)
          {
            v197 = v196;
            v198 = *(_QWORD *)v367;
            do
            {
              for (m = 0; m != v197; m = (char *)m + 1)
              {
                if (*(_QWORD *)v367 != v198)
                  objc_enumerationMutation(v195);
                v200 = *(void **)(*((_QWORD *)&v366 + 1) + 8 * (_QWORD)m);
                v201 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "sourceEventIdentifier"));
                v202 = -[NSMutableSet containsObject:](v349, "containsObject:", v201);

                if ((v202 & 1) != 0)
                {
                  v203 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
                  v204 = objc_claimAutoreleasedReturnValue(v203);
                  if (os_log_type_enabled(v204, OS_LOG_TYPE_INFO))
                  {
                    v205 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "bundleIdentifier"));
                    v206 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v205, "UUIDString"));
                    v207 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "sourceEventIdentifier"));
                    v208 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v207, "UUIDString"));
                    *(_DWORD *)buf = 138412546;
                    v399 = v206;
                    v400 = 2112;
                    *(_QWORD *)v401 = v208;
                    _os_log_impl((void *)&_mh_execute_header, v204, OS_LOG_TYPE_INFO, "trimmedFrom, dropping action in final consistency pass, bundleID=%@, actionID=%@", buf, 0x16u);

                  }
                }
                else
                {
                  -[NSMutableArray addObject:](v335, "addObject:", v200);
                }
              }
              v197 = objc_msgSend(v195, "countByEnumeratingWithState:objects:count:", &v366, v420, 16);
            }
            while (v197);
          }

          objc_msgSend(v342, "setActions:", v335);
          v333 = objc_opt_new(NSMutableArray);
          v362 = 0u;
          v363 = 0u;
          v364 = 0u;
          v365 = 0u;
          v209 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "backgroundActions"));
          v210 = objc_msgSend(v209, "countByEnumeratingWithState:objects:count:", &v362, v419, 16);
          if (v210)
          {
            v211 = v210;
            v212 = *(_QWORD *)v363;
            do
            {
              for (n = 0; n != v211; n = (char *)n + 1)
              {
                if (*(_QWORD *)v363 != v212)
                  objc_enumerationMutation(v209);
                v214 = *(void **)(*((_QWORD *)&v362 + 1) + 8 * (_QWORD)n);
                v215 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v214, "sourceEventIdentifier"));
                v216 = -[NSMutableSet containsObject:](v349, "containsObject:", v215);

                if ((v216 & 1) != 0)
                {
                  v217 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
                  v218 = objc_claimAutoreleasedReturnValue(v217);
                  if (os_log_type_enabled(v218, OS_LOG_TYPE_INFO))
                  {
                    v219 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "bundleIdentifier"));
                    v220 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v219, "UUIDString"));
                    v221 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v214, "sourceEventIdentifier"));
                    v222 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "UUIDString"));
                    *(_DWORD *)buf = 138412546;
                    v399 = v220;
                    v400 = 2112;
                    *(_QWORD *)v401 = v222;
                    _os_log_impl((void *)&_mh_execute_header, v218, OS_LOG_TYPE_INFO, "trimmedFrom, dropping background action in final consistency pass, bundleID=%@, actionID=%@", buf, 0x16u);

                  }
                }
                else
                {
                  -[NSMutableArray addObject:](v333, "addObject:", v214);
                }
              }
              v211 = objc_msgSend(v209, "countByEnumeratingWithState:objects:count:", &v362, v419, 16);
            }
            while (v211);
          }

          objc_msgSend(v342, "setBackgroundActions:", v333);
          v340 = objc_opt_new(NSMutableArray);
          v358 = 0u;
          v359 = 0u;
          v360 = 0u;
          v361 = 0u;
          v223 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "resources"));
          v224 = objc_msgSend(v223, "countByEnumeratingWithState:objects:count:", &v358, v418, 16);
          v10 = v341;
          if (v224)
          {
            v225 = v224;
            v226 = *(_QWORD *)v359;
            v331 = *(_QWORD *)v359;
            do
            {
              for (ii = 0; ii != v225; ii = (char *)ii + 1)
              {
                if (*(_QWORD *)v359 != v226)
                  objc_enumerationMutation(v223);
                v228 = *(void **)(*((_QWORD *)&v358 + 1) + 8 * (_QWORD)ii);
                v229 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v228, "bundleSourceType"));
                v230 = objc_msgSend(v10, "containsObject:", v229);
                if (v7)
                {
                  v231 = v225;
                  v232 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v228, "sourceEventIdentifier"));
                  v233 = -[NSMutableSet containsObject:](v348, "containsObject:", v232);

                  if (objc_msgSend(v229, "isEqualToString:", MOEventBundleSourceTypePhoto[0]))
                  {
                    v234 = v223;
                    v235 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v346, "objectForKeyedSubscript:", v229));
                    v236 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v228, "photoLocalDate"));
                    if (objc_msgSend(v338, "interfaceType") == (id)10)
                    {
                      v237 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v338, "creationDate"));

                    }
                    else
                    {
                      v237 = v236;
                    }
                    v238 = objc_msgSend(v237, "isAfterDate:", v235);

                    v223 = v234;
                    v226 = v331;
                  }
                  else
                  {
                    v238 = objc_msgSend(v229, "isEqualToString:", MOEventBundleSourceTypeReflectionPrompt[0]) | v233;
                  }
                  v225 = v231;
                  v7 = v345;
                }
                else
                {
                  v238 = 1;
                }
                if ((v230 & v238) == 1)
                {
                  v239 = objc_msgSend(v228, "copy");
                  -[NSMutableArray addObject:](v340, "addObject:", v239);
                }
                else
                {
                  v240 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
                  v239 = objc_claimAutoreleasedReturnValue(v240);
                  if (os_log_type_enabled(v239, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412802;
                    v399 = v229;
                    v400 = 1024;
                    *(_DWORD *)v401 = v238;
                    *(_WORD *)&v401[4] = 1024;
                    *(_DWORD *)&v401[6] = v7;
                    _os_log_impl((void *)&_mh_execute_header, v239, OS_LOG_TYPE_INFO, "trimmedFrom, resource failed conditions, type=%@, hasValidOnboardingDate=%d, respectOnboardingDate=%d", buf, 0x18u);
                  }
                }

                v10 = v341;
              }
              v225 = objc_msgSend(v223, "countByEnumeratingWithState:objects:count:", &v358, v418, 16);
            }
            while (v225);
          }

          v50 = v323;
          v332 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v346, "objectForKeyedSubscript:", CFSTR("OnboardingDate")));
          if (!v332)
            goto LABEL_269;
          v356 = 0u;
          v357 = 0u;
          v354 = 0u;
          v355 = 0u;
          v241 = v340;
          v242 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v241, "countByEnumeratingWithState:objects:count:", &v354, v417, 16);
          if (v242)
          {
            v243 = v242;
            v244 = *(_QWORD *)v355;
            while (2)
            {
              for (jj = 0; jj != v243; jj = (char *)jj + 1)
              {
                if (*(_QWORD *)v355 != v244)
                  objc_enumerationMutation(v241);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v354 + 1) + 8 * (_QWORD)jj), "type") == (id)2)
                {
                  v246 = 1;
                  goto LABEL_230;
                }
              }
              v243 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v241, "countByEnumeratingWithState:objects:count:", &v354, v417, 16);
              if (v243)
                continue;
              break;
            }
          }
          v246 = 0;
LABEL_230:

          v251 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v338, "place"));
          if (v251)
          {
            v252 = 1;
          }
          else
          {
            v257 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v338, "places"));
            if (v257)
            {
              v258 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v338, "places"));
              v252 = objc_msgSend(v258, "count") != 0;

              v50 = v323;
            }
            else
            {
              v252 = 0;
            }

          }
          v259 = v246 | !v252;
          v7 = v345;
          if ((v259 & 1) == 0)
          {
            v329 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v338, "place"));
            if (v329)
            {
              v260 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v329, "startDate"));
              v261 = objc_msgSend(v260, "isBeforeDate:", v332);

              if (v261)
              {
                v262 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
                v263 = objc_claimAutoreleasedReturnValue(v262);
                if (os_log_type_enabled(v263, OS_LOG_TYPE_INFO))
                {
                  v264 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "bundleIdentifier"));
                  v265 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v264, "UUIDString"));
                  v266 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v329, "startDate"));
                  v267 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v266, "description"));
                  *(_DWORD *)buf = 138412546;
                  v399 = v265;
                  v400 = 2112;
                  *(_QWORD *)v401 = v267;
                  _os_log_impl((void *)&_mh_execute_header, v263, OS_LOG_TYPE_INFO, "trimmedFrom, pre-onboarded visit, dropping primary place, bundleID=%@, placeStartDate=%@", buf, 0x16u);

                }
                objc_msgSend(v338, "setPlace:", 0);
              }
            }
            v327 = objc_opt_new(NSMutableArray);
            v350 = 0u;
            v351 = 0u;
            v352 = 0u;
            v353 = 0u;
            v268 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v338, "places"));
            v269 = objc_msgSend(v268, "countByEnumeratingWithState:objects:count:", &v350, v416, 16);
            if (v269)
            {
              v270 = v269;
              v271 = *(_QWORD *)v351;
              do
              {
                for (kk = 0; kk != v270; kk = (char *)kk + 1)
                {
                  if (*(_QWORD *)v351 != v271)
                    objc_enumerationMutation(v268);
                  v273 = *(_QWORD *)(*((_QWORD *)&v350 + 1) + 8 * (_QWORD)kk);
                  if (v273
                    && (v274 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v350 + 1)
                                                                                            + 8 * (_QWORD)kk), "startDate")),
                        v275 = objc_msgSend(v274, "isBeforeDate:", v332),
                        v274,
                        (v275 & 1) == 0))
                  {
                    -[NSMutableArray addObject:](v327, "addObject:", v273);
                  }
                  else
                  {
                    v276 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
                    v277 = objc_claimAutoreleasedReturnValue(v276);
                    if (os_log_type_enabled(v277, OS_LOG_TYPE_INFO))
                    {
                      v278 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "bundleIdentifier"));
                      v279 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v278, "UUIDString"));
                      v280 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v329, "startDate"));
                      v281 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "description"));
                      *(_DWORD *)buf = 138412546;
                      v399 = v279;
                      v400 = 2112;
                      *(_QWORD *)v401 = v281;
                      _os_log_impl((void *)&_mh_execute_header, v277, OS_LOG_TYPE_INFO, "trimmedFrom, pre-onboarded visit, dropping place, bundleID=%@, placeStartDate=%@", buf, 0x16u);

                      v10 = v341;
                    }

                  }
                }
                v270 = objc_msgSend(v268, "countByEnumeratingWithState:objects:count:", &v350, v416, 16);
              }
              while (v270);
            }

            objc_msgSend(v338, "setPlaces:", v327);
            v50 = v323;
          }
          v282 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v338, "place"));
          if (v282)
          {
            v283 = 1;
          }
          else
          {
            v284 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v338, "places"));
            if (v284)
            {
              v285 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v338, "places"));
              v283 = objc_msgSend(v285, "count") != 0;

              v50 = v323;
            }
            else
            {
              v283 = 0;
            }

          }
          if (objc_msgSend(v336, "containsObject:", MOEventBundleSourceTypeVisitLocation[0]) && !v283)
          {
            v286 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
            v287 = objc_claimAutoreleasedReturnValue(v286);
            if (os_log_type_enabled(v287, OS_LOG_TYPE_INFO))
            {
              v288 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "bundleIdentifier"));
              v289 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v288, "UUIDString"));
              *(_DWORD *)buf = 138412290;
              v399 = v289;
              _os_log_impl((void *)&_mh_execute_header, v287, OS_LOG_TYPE_INFO, "trimmedFrom, pre-onboarded visit, dropping bundle, bundleID=%@", buf, 0xCu);

              v50 = v323;
            }

            v21 = v320;
          }
          else
          {
LABEL_269:
            objc_msgSend(v342, "setResources:", v340);
            objc_msgSend(v342, "buildResources");
            v290 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "resources"));

            if (v290)
            {
              v291 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "resources"));
              v292 = objc_msgSend(v291, "count");

              v293 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
              v294 = objc_claimAutoreleasedReturnValue(v293);
              v295 = v294;
              v21 = v320;
              if (v292)
              {
                if (os_log_type_enabled(v294, OS_LOG_TYPE_DEFAULT))
                {
                  v330 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "bundleIdentifier"));
                  v296 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v330, "UUIDString"));
                  v328 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v338, "resources"));
                  v313 = objc_msgSend(v328, "count");
                  v315 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "resources"));
                  v312 = objc_msgSend(v315, "count");
                  v314 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v338, "places"));
                  v297 = (char *)objc_msgSend(v314, "count");
                  v298 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v338, "place"));
                  if (v298)
                    v299 = v297 + 1;
                  else
                    v299 = v297;
                  v300 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "places"));
                  v301 = (char *)objc_msgSend(v300, "count");
                  v302 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "place"));
                  if (v302)
                    v303 = v301 + 1;
                  else
                    v303 = v301;
                  v304 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v338, "persons"));
                  v305 = objc_msgSend(v304, "count");
                  v306 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "persons"));
                  v307 = objc_msgSend(v306, "count");
                  *(_DWORD *)buf = 138414082;
                  v399 = v296;
                  v400 = 2048;
                  *(_QWORD *)v401 = v313;
                  *(_WORD *)&v401[8] = 2048;
                  v402 = v312;
                  v403 = 2048;
                  v404 = v299;
                  v21 = v320;
                  v405 = 2048;
                  v406 = v303;
                  v7 = v345;
                  v407 = 2048;
                  v408 = v305;
                  v409 = 2048;
                  v410 = v307;
                  v411 = 1024;
                  v412 = v345;
                  _os_log_impl((void *)&_mh_execute_header, v295, OS_LOG_TYPE_DEFAULT, "trimmedFrom, adding bundle, bundleID=%@, sourceResourceCount=%lu, resourceCount=%lu, sourcePlacesCount=%lu, placesCount=%lu, sourcePersonsCount=%lu, personsCount=%lu, respectOnboardingDate=%d", buf, 0x4Eu);

                  v10 = v341;
                  v50 = v323;

                }
                -[NSMutableArray addObject:](v316, "addObject:", v342);
                goto LABEL_285;
              }
              if (os_log_type_enabled(v294, OS_LOG_TYPE_ERROR))
                +[MOEventBundleProcessor trimmedFrom:with:respectOnboardingDate:shouldUseStandardSuite:].cold.2((uint64_t)v413, (uint64_t)v342);
            }
            else
            {
              v308 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
              v295 = objc_claimAutoreleasedReturnValue(v308);
              v21 = v320;
              if (os_log_type_enabled(v295, OS_LOG_TYPE_ERROR))
                +[MOEventBundleProcessor trimmedFrom:with:respectOnboardingDate:shouldUseStandardSuite:].cold.1((uint64_t)v415, (uint64_t)v342);
            }

          }
LABEL_285:
          p_super = &v335->super.super;

          v36 = v326;
LABEL_286:

          v34 = v342;
          goto LABEL_287;
        }
        v166 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
        v167 = objc_claimAutoreleasedReturnValue(v166);
        v21 = v320;
        v344 = (NSMutableArray *)v167;
        if (os_log_type_enabled(v167, OS_LOG_TYPE_INFO))
        {
          v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "bundleIdentifier"));
          v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v168, "UUIDString"));
          *(_DWORD *)buf = 138412290;
          v399 = v169;
          _os_log_impl((void *)&_mh_execute_header, v167, OS_LOG_TYPE_INFO, "trimmedFrom, primary place on disallow list, dropping bundle, bundleID=%@", buf, 0xCu);

          v34 = v342;
          v36 = v326;
          goto LABEL_228;
        }
LABEL_227:
        v36 = v326;
        v34 = v342;
LABEL_228:
        v50 = v323;
LABEL_287:

LABEL_288:
LABEL_289:

LABEL_290:
        v20 = v36 + 1;
      }
      while (v20 != v21);
      v320 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v394, v427, 16);
    }
    while (v320);
  }

  v309 = -[NSMutableArray copy](v316, "copy");
  return v309;
}

+ (void)trimmedFrom:(uint64_t)a1 with:(uint64_t)a2 respectOnboardingDate:shouldUseStandardSuite:.cold.1(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = objc_msgSend((id)OUTLINED_FUNCTION_4_0(a1, a2), "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
  *v3 = 138412290;
  *v2 = v6;
  OUTLINED_FUNCTION_0_13((void *)&_mh_execute_header, v7, v8, "trimmedFrom, nil resources, dropping bundle, bundleID=%@");

  OUTLINED_FUNCTION_1_10();
}

+ (void)trimmedFrom:(uint64_t)a1 with:(uint64_t)a2 respectOnboardingDate:shouldUseStandardSuite:.cold.2(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = objc_msgSend((id)OUTLINED_FUNCTION_4_0(a1, a2), "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
  *v3 = 138412290;
  *v2 = v6;
  OUTLINED_FUNCTION_0_13((void *)&_mh_execute_header, v7, v8, "trimmedFrom, no resources, dropping bundle, bundleID=%@");

  OUTLINED_FUNCTION_1_10();
}

@end
