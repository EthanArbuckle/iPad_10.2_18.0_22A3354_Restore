@implementation NSPCoreData

+ (id)sharedCoreDataContext
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v6;
  NSObject *v7;
  int v8;
  const char *v9;

  if (qword_100112EC0 != -1)
    dispatch_once(&qword_100112EC0, &stru_1000F6688);
  if (qword_100112EB8)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100112EB8, "persistentContainer"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewContext"));

    return v4;
  }
  else
  {
    v6 = nplog_obj(0, a2, v2);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v8 = 136315138;
      v9 = "+[NSPCoreData sharedCoreDataContext]";
      _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "%s called with null coreData", (uint8_t *)&v8, 0xCu);
    }

    return 0;
  }
}

+ (id)childCoreDataContext
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  const char *v15;

  if (qword_100112E78)
    return (id)qword_100112E78;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData sharedCoreDataContext](NSPCoreData, "sharedCoreDataContext"));
  if (!v5)
  {
    v11 = nplog_obj(0, v3, v4);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "NSP Core Data context not available", (uint8_t *)&v14, 2u);
    }
    goto LABEL_8;
  }
  v6 = objc_msgSend(objc_alloc((Class)NSManagedObjectContext), "initWithConcurrencyType:", 1);
  v7 = (void *)qword_100112E78;
  qword_100112E78 = (uint64_t)v6;

  if (!qword_100112E78)
  {
    v13 = nplog_obj(0, v8, v9);
    v12 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      v14 = 136315138;
      v15 = "+[NSPCoreData childCoreDataContext]";
      _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "%s called with null childContext", (uint8_t *)&v14, 0xCu);
    }
LABEL_8:

    v10 = 0;
    goto LABEL_9;
  }
  objc_msgSend((id)qword_100112E78, "setParentContext:", v5);
  v10 = (id)qword_100112E78;
LABEL_9:

  return v10;
}

- (NSPCoreData)init
{
  uint64_t v2;
  uint64_t v3;
  NSPCoreData *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSPPersistentContainer *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSPCoreData *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  objc_super v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  NSObject *v36;

  v32.receiver = self;
  v32.super_class = (Class)NSPCoreData;
  v4 = -[NSPCoreData init](&v32, "init");
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NetworkServiceProxy.framework")));
    v8 = v5;
    if (!v5)
    {
      v27 = nplog_obj(0, v6, v7);
      v9 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v34 = "-[NSPCoreData init]";
        _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "%s called with null frameworkBundle", buf, 0xCu);
      }
      v24 = 0;
      goto LABEL_10;
    }
    v9 = objc_claimAutoreleasedReturnValue(-[NSObject URLForResource:withExtension:](v5, "URLForResource:withExtension:", CFSTR("NSPCoreDataModel"), CFSTR("momd")));
    v12 = nplog_obj(v9, v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = v13;
    if (v9)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v34 = CFSTR("NSPCoreDataModel");
        v35 = 2112;
        v36 = v9;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "URL for %@: %@", buf, 0x16u);
      }

      v15 = objc_msgSend(objc_alloc((Class)NSManagedObjectModel), "initWithContentsOfURL:", v9);
      if (v15)
      {
        v14 = v15;
        v18 = -[NSPPersistentContainer initWithName:managedObjectModel:]([NSPPersistentContainer alloc], "initWithName:managedObjectModel:", CFSTR("NSPCoreDataModel"), v15);
        -[NSPCoreData setPersistentContainer:](v4, "setPersistentContainer:", v18);

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCoreData persistentContainer](v4, "persistentContainer"));
        if (v19)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSPCoreData persistentContainer](v4, "persistentContainer"));
          objc_msgSend(v23, "loadPersistentStoresWithCompletionHandler:", &stru_1000F66C8);

          v24 = v4;
LABEL_9:

LABEL_10:
          goto LABEL_11;
        }
        v30 = nplog_obj(v20, v21, v22);
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v34 = "-[NSPCoreData init]";
          _os_log_fault_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, "%s called with null self.persistentContainer", buf, 0xCu);
        }

      }
      else
      {
        v28 = nplog_obj(0, v16, v17);
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v34 = "-[NSPCoreData init]";
          _os_log_fault_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "%s called with null model", buf, 0xCu);
        }

        v14 = 0;
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[NSPCoreData init]";
      _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "%s called with null modelURL", buf, 0xCu);
    }
    v24 = 0;
    goto LABEL_9;
  }
  v26 = nplog_obj(0, v2, v3);
  v8 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
  }
  v24 = 0;
LABEL_11:

  return v24;
}

+ (id)getProactiveTokenFetchConfiguration
{
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  int v20;
  const char *v21;

  if (qword_100112E80)
  {
LABEL_16:
    v17 = nplog_obj(a1, a2, v2);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v20 = 138412290;
      v21 = (const char *)qword_100112E80;
      _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "ProactiveTokenFetch Params %@", (uint8_t *)&v20, 0xCu);
    }

    return (id)qword_100112E80;
  }
  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)qword_100112E80;
  qword_100112E80 = (uint64_t)v3;

  v5 = qword_100112E80;
  v9 = nplog_obj(v6, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v5)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Setting default values for ProactiveFetchConfiguration", (uint8_t *)&v20, 2u);
    }

    objc_msgSend((id)qword_100112E80, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("NSPEventsKeyProactiveTokenFetchEnabled"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 30));
    if (v12)
      objc_msgSend((id)qword_100112E80, "setObject:forKey:", v12, CFSTR("NSPEventsKeyStatsDuration"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 40));
    if (v13)
      objc_msgSend((id)qword_100112E80, "setObject:forKey:", v13, CFSTR("NSPEventsKeyLowerTokenCountThreshold"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.6));
    if (v14)
      objc_msgSend((id)qword_100112E80, "setObject:forKey:", v14, CFSTR("NSPEventsKeyLowerTokenCountProbability"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3));
    if (v15)
      objc_msgSend((id)qword_100112E80, "setObject:forKey:", v15, CFSTR("NSPEventsKeyUpperLWMCountThreshold"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.1));
    if (v16)
      objc_msgSend((id)qword_100112E80, "setObject:forKey:", v16, CFSTR("NSPEventsKeyUpperLWMCountProbabilityOffset"));

    goto LABEL_16;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    v20 = 136315138;
    v21 = "+[NSPCoreData getProactiveTokenFetchConfiguration]";
    _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "%s called with null config", (uint8_t *)&v20, 0xCu);
  }

  return 0;
}

+ (id)updateProactiveTokenFetchConfiguration:(id)a3 statsDuration:(id)a4 lowerTokenCountThreshold:(id)a5 lowerTokenCountProbability:(id)a6 upperLWMCountThreshold:(id)a7 upperLWMCountProbabilityOffset:(id)a8
{
  id v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  unsigned int v28;
  const char *v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  id v59;
  uint64_t v61;
  NSObject *v62;
  int v63;
  const char *v64;

  v13 = a3;
  v14 = (char *)a4;
  v15 = (char *)a5;
  v16 = (char *)a6;
  v17 = (char *)a7;
  v18 = (char *)a8;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData getProactiveTokenFetchConfiguration](NSPCoreData, "getProactiveTokenFetchConfiguration"));
  v22 = v19;
  if (v19)
  {
    if (v13)
    {
      v23 = objc_msgSend(v19, "setObject:forKey:", v13, CFSTR("NSPEventsKeyProactiveTokenFetchEnabled"));
      v26 = nplog_obj(v23, v24, v25);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v28 = objc_msgSend(v13, "BOOLValue");
        v29 = "NO";
        if (v28)
          v29 = "YES";
        v63 = 136315138;
        v64 = v29;
        v30 = "updated NSPEventsKeyProactiveTokenFetchEnabled %s";
        v31 = v27;
        v32 = 12;
        goto LABEL_9;
      }
    }
    else
    {
      v33 = nplog_obj(v19, v20, v21);
      v27 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        LOWORD(v63) = 0;
        v30 = "NSPEventsKeyProactiveTokenFetchEnabled not found";
        v31 = v27;
        v32 = 2;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, v30, (uint8_t *)&v63, v32);
      }
    }

    if (v14)
    {
      v34 = objc_msgSend(v22, "setObject:forKey:", v14, CFSTR("NSPEventsKeyStatsDuration"));
      v37 = nplog_obj(v34, v35, v36);
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v63 = 138412290;
        v64 = v14;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "updated NSPEventsKeyStatsDuration %@", (uint8_t *)&v63, 0xCu);
      }

    }
    if (v15)
    {
      v39 = objc_msgSend(v22, "setObject:forKey:", v15, CFSTR("NSPEventsKeyLowerTokenCountThreshold"));
      v42 = nplog_obj(v39, v40, v41);
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        v63 = 138412290;
        v64 = v15;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "updated NSPEventsKeyLowerTokenCountThreshold %@", (uint8_t *)&v63, 0xCu);
      }

    }
    if (v16)
    {
      v44 = objc_msgSend(v22, "setObject:forKey:", v16, CFSTR("NSPEventsKeyLowerTokenCountProbability"));
      v47 = nplog_obj(v44, v45, v46);
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        v63 = 138412290;
        v64 = v16;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "updated NSPEventsKeyLowerTokenCountProbability %@", (uint8_t *)&v63, 0xCu);
      }

    }
    if (v17)
    {
      v49 = objc_msgSend(v22, "setObject:forKey:", v17, CFSTR("NSPEventsKeyUpperLWMCountThreshold"));
      v52 = nplog_obj(v49, v50, v51);
      v53 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        v63 = 138412290;
        v64 = v17;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "updated NSPEventsKeyUpperLWMCountThreshold %@", (uint8_t *)&v63, 0xCu);
      }

    }
    if (v18)
    {
      v54 = objc_msgSend(v22, "setObject:forKey:", v18, CFSTR("NSPEventsKeyUpperLWMCountProbabilityOffset"));
      v57 = nplog_obj(v54, v55, v56);
      v58 = objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        v63 = 138412290;
        v64 = v18;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "updated NSPEventsKeyUpperLWMCountProbabilityOffset %@", (uint8_t *)&v63, 0xCu);
      }

    }
    v59 = v22;
    goto LABEL_31;
  }
  v61 = nplog_obj(0, v20, v21);
  v62 = objc_claimAutoreleasedReturnValue(v61);
  if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
  {
    v63 = 136315138;
    v64 = "+[NSPCoreData updateProactiveTokenFetchConfiguration:statsDuration:lowerTokenCountThreshold:lowerTokenCountPro"
          "bability:upperLWMCountThreshold:upperLWMCountProbabilityOffset:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_FAULT, "%s called with null config", (uint8_t *)&v63, 0xCu);
  }

LABEL_31:
  return v22;
}

+ (BOOL)triggerProactiveTokenFetch:(id)a3 lowerTokenCountThreshold:(unint64_t)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  double v26;
  double v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  double v46;
  void **p_cache;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  double v54;
  double v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  NSObject *v65;
  double v66;
  id v67;
  double v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  double v79;
  double v80;
  uint64_t v81;
  NSObject *v82;
  void *v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  NSPProactiveTokenFetchAnalytics *v88;
  NSPProactiveTokenFetchAnalytics *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  id v96;
  uint64_t v97;
  void *i;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  NSObject *v105;
  id v106;
  double v107;
  double v108;
  double v109;
  id v110;
  uint64_t v111;
  uint64_t v112;
  double v113;
  double v114;
  uint64_t v115;
  NSObject *v116;
  void *v117;
  NSPProactiveTokenFetchAnalytics *v118;
  NSPProactiveTokenFetchAnalytics *v119;
  NSObject *v120;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  NSObject *v133;
  uint64_t v134;
  uint64_t v135;
  NSObject *v136;
  NSObject *v137;
  void *v138;
  NSObject *v139;
  NSObject *v140;
  uint64_t v141;
  void *v142;
  void *v143;
  void *v144;
  NSObject *v145;
  os_log_t log;
  void *v147;
  NSObject *v148;
  void *v149;
  void *v150;
  void *v151;
  double v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  uint8_t v157[128];
  uint8_t buf[4];
  double v159;
  __int16 v160;
  double v161;
  __int16 v162;
  double v163;
  __int16 v164;
  double v165;

  v152 = COERCE_DOUBLE(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData getProactiveTokenFetchConfiguration](NSPCoreData, "getProactiveTokenFetchConfiguration"));
  v8 = v5;
  if (v5)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("NSPEventsKeyProactiveTokenFetchEnabled")));
    v12 = v9;
    if (v9)
    {
      v13 = -[NSObject BOOLValue](v9, "BOOLValue");
      if ((v13 & 1) != 0)
      {
        if (qword_100112E88
          || (v16 = objc_alloc_init((Class)NSMutableDictionary),
              v17 = (void *)qword_100112E88,
              qword_100112E88 = (uint64_t)v16,
              v17,
              qword_100112E88))
        {
          v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("NSPEventsKeyStatsDuration")));
          if (!v23)
          {
            v124 = nplog_obj(0, v21, v22);
            v24 = objc_claimAutoreleasedReturnValue(v124);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315138;
              v159 = COERCE_DOUBLE("+[NSPCoreData triggerProactiveTokenFetch:lowerTokenCountThreshold:]");
              _os_log_fault_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "%s called with null statsDuration", buf, 0xCu);
            }
            LOBYTE(v48) = 0;
            goto LABEL_76;
          }
          v24 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100112E88, "objectForKey:", *(_QWORD *)&v152));
          if (v24)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
            objc_msgSend(v25, "timeIntervalSinceDate:", v24);
            v27 = v26;

            v28 = -[NSObject integerValue](v23, "integerValue");
            if (v27 < (double)(60 * (uint64_t)v28))
            {
              v86 = nplog_obj(v28, v29, v30);
              v33 = objc_claimAutoreleasedReturnValue(v86);
              if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134218242;
                v159 = (double)(60 * (uint64_t)-[NSObject integerValue](v23, "integerValue")) - v27;
                v160 = 2112;
                v161 = v152;
                _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%f seconds left before next trigger checkpoint for vendor %@", buf, 0x16u);
              }
              LOBYTE(v48) = 0;
              goto LABEL_75;
            }
            objc_msgSend((id)qword_100112E88, "removeObjectForKey:", *(_QWORD *)&v152);
          }
          v33 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
          if (!v33)
          {
            v125 = nplog_obj(0, v31, v32);
            v120 = objc_claimAutoreleasedReturnValue(v125);
            if (os_log_type_enabled(v120, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315138;
              v159 = COERCE_DOUBLE("+[NSPCoreData triggerProactiveTokenFetch:lowerTokenCountThreshold:]");
              _os_log_fault_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_FAULT, "%s called with null calendar", buf, 0xCu);
            }
            LOBYTE(v48) = 0;
            goto LABEL_74;
          }
          v141 = objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithAbbreviation:](NSTimeZone, "timeZoneWithAbbreviation:", CFSTR("UTC")));
          -[NSObject setTimeZone:](v33, "setTimeZone:");
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData getMinMaxDate](NSPCoreData, "getMinMaxDate"));
          v142 = v34;
          if (!v34)
          {
            v126 = nplog_obj(0, v35, v36);
            v38 = objc_claimAutoreleasedReturnValue(v126);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315138;
              v159 = COERCE_DOUBLE("+[NSPCoreData triggerProactiveTokenFetch:lowerTokenCountThreshold:]");
              _os_log_fault_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_FAULT, "%s called with null dict", buf, 0xCu);
            }
            LOBYTE(v48) = 0;
            v120 = v141;
            goto LABEL_73;
          }
          v37 = v34;
          v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", CFSTR("minDate")));
          v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKey:", CFSTR("maxDate")));
          v42 = (void *)v39;
          if (v38)
          {
            if (v39)
            {
              v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
              v44 = objc_claimAutoreleasedReturnValue(-[NSObject components:fromDate:](v33, "components:fromDate:", 736, v43));

              v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject dateFromComponents:](v33, "dateFromComponents:", v44));
              -[NSObject doubleValue](v23, "doubleValue");
              v150 = v45;
              v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "dateByAddingTimeInterval:", v46 * 60.0));
              p_cache = NSPPrivacyProxyMultiHopFallbackNetworkRegistration.cache;
              log = (os_log_t)v44;
              v48 = objc_claimAutoreleasedReturnValue(+[NSPCoreData getNSPEventStatsForSingleWindow:eventType:startDate:endDate:windowStartTime:windowDuration:](NSPCoreData, "getNSPEventStatsForSingleWindow:eventType:startDate:endDate:windowStartTime:windowDuration:", *(_QWORD *)&v152, 0, v38, v42, v44, v23));
              v144 = v42;
              v145 = v38;
              v139 = v24;
              v140 = v33;
              v143 = (void *)v48;
              if (v48)
              {
                v49 = objc_claimAutoreleasedReturnValue(+[NSPCoreData getNSPEventsProbability:count:](NSPCoreData, "getNSPEventsProbability:count:", v48, 0));
                v151 = (void *)v49;
                if (v49)
                {
                  v52 = nplog_obj(v49, v50, v51);
                  v53 = objc_claimAutoreleasedReturnValue(v52);
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
                  {
                    v54 = COERCE_DOUBLE(-[NSObject integerValue](v23, "integerValue"));
                    objc_msgSend(v151, "doubleValue");
                    *(_DWORD *)buf = 134218498;
                    v159 = v54;
                    v160 = 2112;
                    v161 = v152;
                    v162 = 2048;
                    v163 = v55;
                    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "Probability of 0 LWM events in next %ld mins for vendor:%@ is %f", buf, 0x20u);
                  }

                  v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("NSPEventsKeyUpperLWMCountThreshold")));
                  if (!v56)
                  {
                    v134 = nplog_obj(0, v57, v58);
                    v59 = objc_claimAutoreleasedReturnValue(v134);
                    if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 136315138;
                      v159 = COERCE_DOUBLE("+[NSPCoreData triggerProactiveTokenFetch:lowerTokenCountThreshold:]");
                      v131 = "%s called with null upperLWMCount";
                      goto LABEL_110;
                    }
LABEL_103:
                    LOBYTE(v48) = 0;
                    goto LABEL_71;
                  }
                  v59 = v56;
                  v60 = objc_claimAutoreleasedReturnValue(+[NSPCoreData getNSPEventsProbability:count:](NSPCoreData, "getNSPEventsProbability:count:", v48, -[NSObject integerValue](v56, "integerValue")));
                  v63 = (void *)v60;
                  if (v60)
                  {
                    v147 = (void *)v60;
                    v64 = nplog_obj(v60, v61, v62);
                    v65 = objc_claimAutoreleasedReturnValue(v64);
                    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
                    {
                      v66 = COERCE_DOUBLE(-[NSObject integerValue](v59, "integerValue"));
                      v67 = -[NSObject integerValue](v23, "integerValue");
                      objc_msgSend(v147, "doubleValue");
                      *(_DWORD *)buf = 134218754;
                      v159 = v66;
                      v160 = 2048;
                      v161 = *(double *)&v67;
                      v162 = 2112;
                      v163 = v152;
                      v164 = 2048;
                      v165 = 1.0 - v68;
                      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "Probability of seeing atleast %ld LWM events in next %ld mins for vendor:%@ is %f", buf, 0x2Au);
                    }

                    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("NSPEventsKeyUpperLWMCountProbabilityOffset")));
                    LOBYTE(v48) = v71 != 0;
                    if (!v71)
                    {
                      v135 = nplog_obj(0, v69, v70);
                      v136 = objc_claimAutoreleasedReturnValue(v135);
                      if (os_log_type_enabled(v136, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = 136315138;
                        v159 = COERCE_DOUBLE("+[NSPCoreData triggerProactiveTokenFetch:lowerTokenCountThreshold:]");
                        _os_log_fault_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_FAULT, "%s called with null probabilityOffset", buf, 0xCu);
                      }

                      v63 = v147;
                      goto LABEL_41;
                    }
                    v63 = v147;
                    objc_msgSend(v147, "doubleValue");
                    v73 = 1.0 - v72;
                    objc_msgSend(v151, "doubleValue");
                    v75 = v74;
                    v76 = objc_msgSend(v71, "doubleValue");
                    v80 = v75 + v79;
                    if (v73 <= v80)
                    {
                      v84 = 0;
                    }
                    else
                    {
                      v81 = nplog_obj(v76, v77, v78);
                      v82 = objc_claimAutoreleasedReturnValue(v81);
                      if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412290;
                        v159 = v152;
                        _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_INFO, "Trigger Token fetch for vendor:%@", buf, 0xCu);
                      }

                      v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
                      objc_msgSend((id)qword_100112E88, "setObject:forKey:", v83, *(_QWORD *)&v152);

                      v84 = 1;
                    }
                    v88 = objc_alloc_init(NSPProactiveTokenFetchAnalytics);
                    v89 = v88;
                    if (v88)
                    {
                      -[NSPProactiveTokenFetchAnalytics setStats:](v88, "setStats:", v143);
                      -[NSPProactiveTokenFetchAnalytics setType:](v89, "setType:", CFSTR("TokenEventLWM"));
                      -[NSPProactiveTokenFetchAnalytics setFromDate:](v89, "setFromDate:", v150);
                      -[NSPProactiveTokenFetchAnalytics setToDate:](v89, "setToDate:", v149);
                      v63 = v147;
                      -[NSPProactiveTokenFetchAnalytics setTokenFetchTriggered:](v89, "setTokenFetchTriggered:", v73 > v80);
                      -[NSPProactiveTokenFetchAnalytics setVendor:](v89, "setVendor:", *(_QWORD *)&v152);
                      -[NSPProxyAnalytics sendAnalytics](v89, "sendAnalytics");
                    }

                    if (v73 > v80)
                    {
LABEL_41:

LABEL_70:
                      v24 = v139;
LABEL_71:
                      v120 = v141;

                      v33 = v140;
                      v42 = v144;
                      v38 = v145;
LABEL_72:

LABEL_73:
LABEL_74:

LABEL_75:
LABEL_76:

                      goto LABEL_77;
                    }

                  }
                  else
                  {
                    v84 = 0;
                  }

                  v42 = v144;
                  v38 = v145;
                  p_cache = NSPPrivacyProxyMultiHopFallbackNetworkRegistration.cache;
                }
                else
                {
                  v84 = 0;
                }

                LOBYTE(v48) = v84 != 0;
              }
              v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("NSPEventsKeyLowerTokenCountProbability")));
              if (v151)
              {
                v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData getNSPTokenStatsForSingleWindow:startDate:endDate:windowStartTime:windowDuration:statsCategory:](NSPCoreData, "getNSPTokenStatsForSingleWindow:startDate:endDate:windowStartTime:windowDuration:statsCategory:", *(_QWORD *)&v152, v38, v42, log, v23, 9));
                if (v92)
                {
                  v148 = v23;
                  v137 = v12;
                  v138 = v8;
                  v155 = 0u;
                  v156 = 0u;
                  v153 = 0u;
                  v154 = 0u;
                  v59 = v92;
                  v95 = -[NSObject countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v153, v157, 16);
                  if (v95)
                  {
                    v96 = v95;
                    v97 = *(_QWORD *)v154;
                    while (2)
                    {
                      for (i = 0; i != v96; i = (char *)i + 1)
                      {
                        if (*(_QWORD *)v154 != v97)
                          objc_enumerationMutation(v59);
                        v99 = *(_QWORD *)(*((_QWORD *)&v153 + 1) + 8 * (_QWORD)i);
                        if (v99)
                        {
                          v100 = objc_claimAutoreleasedReturnValue(objc_msgSend(p_cache + 353, "getNSPEventsProbability:count:", *(_QWORD *)(*((_QWORD *)&v153 + 1) + 8 * (_QWORD)i), a4));
                          v103 = (void *)v100;
                          if (v100)
                          {
                            v104 = nplog_obj(v100, v101, v102);
                            v105 = objc_claimAutoreleasedReturnValue(v104);
                            if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
                            {
                              v106 = -[NSObject integerValue](v148, "integerValue");
                              objc_msgSend(v103, "doubleValue");
                              *(_DWORD *)buf = 134218754;
                              v159 = *(double *)&a4;
                              v160 = 2048;
                              v161 = *(double *)&v106;
                              v162 = 2112;
                              v163 = v152;
                              v164 = 2048;
                              v165 = v107;
                              _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_INFO, "Probability of reaching less than %ld tokens in next %ld mins for vendor:%@ is %f", buf, 0x2Au);
                            }

                            objc_msgSend(v103, "doubleValue");
                            v109 = v108;
                            v110 = objc_msgSend(v151, "doubleValue");
                            v114 = v113;
                            if (v109 > v113)
                            {
                              v115 = nplog_obj(v110, v111, v112);
                              v116 = objc_claimAutoreleasedReturnValue(v115);
                              if (os_log_type_enabled(v116, OS_LOG_TYPE_INFO))
                              {
                                *(_DWORD *)buf = 138412290;
                                v159 = v152;
                                _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_INFO, "Trigger Token fetch for vendor:%@", buf, 0xCu);
                              }

                              v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
                              objc_msgSend((id)qword_100112E88, "setObject:forKey:", v117, *(_QWORD *)&v152);

                            }
                            v118 = objc_alloc_init(NSPProactiveTokenFetchAnalytics);
                            v119 = v118;
                            if (v118)
                            {
                              -[NSPProactiveTokenFetchAnalytics setStats:](v118, "setStats:", v99);
                              -[NSPProactiveTokenFetchAnalytics setType:](v119, "setType:", CFSTR("TokenCount"));
                              -[NSPProactiveTokenFetchAnalytics setFromDate:](v119, "setFromDate:", v150);
                              -[NSPProactiveTokenFetchAnalytics setToDate:](v119, "setToDate:", v149);
                              -[NSPProactiveTokenFetchAnalytics setTokenFetchTriggered:](v119, "setTokenFetchTriggered:", v109 > v114);
                              -[NSPProactiveTokenFetchAnalytics setVendor:](v119, "setVendor:", *(_QWORD *)&v152);
                              -[NSPProxyAnalytics sendAnalytics](v119, "sendAnalytics");
                            }

                            if (v109 > v114)
                            {

                              LOBYTE(v48) = 1;
                              goto LABEL_69;
                            }
                            LOBYTE(v48) = 0;
                            p_cache = (void **)(NSPPrivacyProxyMultiHopFallbackNetworkRegistration + 16);
                          }

                        }
                      }
                      v96 = -[NSObject countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v153, v157, 16);
                      if (v96)
                        continue;
                      break;
                    }
                  }
LABEL_69:

                  v12 = v137;
                  v8 = v138;
                  v23 = v148;
                }
                else
                {
                  v132 = nplog_obj(0, v93, v94);
                  v133 = objc_claimAutoreleasedReturnValue(v132);
                  if (os_log_type_enabled(v133, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 136315138;
                    v159 = COERCE_DOUBLE("+[NSPCoreData triggerProactiveTokenFetch:lowerTokenCountThreshold:]");
                    _os_log_fault_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_FAULT, "%s called with null tokenStatsArray", buf, 0xCu);
                  }

                  v59 = 0;
                  LOBYTE(v48) = 0;
                }
                goto LABEL_70;
              }
              v130 = nplog_obj(0, v90, v91);
              v59 = objc_claimAutoreleasedReturnValue(v130);
              v24 = v139;
              if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315138;
                v159 = COERCE_DOUBLE("+[NSPCoreData triggerProactiveTokenFetch:lowerTokenCountThreshold:]");
                v131 = "%s called with null lowTokenCountProbability";
LABEL_110:
                _os_log_fault_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_FAULT, v131, buf, 0xCu);
                goto LABEL_103;
              }
              goto LABEL_103;
            }
            v129 = nplog_obj(0, v40, v41);
            log = (os_log_t)objc_claimAutoreleasedReturnValue(v129);
            if (!os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
            {
LABEL_96:
              LOBYTE(v48) = 0;
              v120 = v141;
              goto LABEL_72;
            }
            *(_DWORD *)buf = 136315138;
            v159 = COERCE_DOUBLE("+[NSPCoreData triggerProactiveTokenFetch:lowerTokenCountThreshold:]");
            v128 = "%s called with null maxDate";
          }
          else
          {
            v127 = nplog_obj(v39, v40, v41);
            log = (os_log_t)objc_claimAutoreleasedReturnValue(v127);
            if (!os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
              goto LABEL_96;
            *(_DWORD *)buf = 136315138;
            v159 = COERCE_DOUBLE("+[NSPCoreData triggerProactiveTokenFetch:lowerTokenCountThreshold:]");
            v128 = "%s called with null minDate";
          }
          _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, v128, buf, 0xCu);
          goto LABEL_96;
        }
        v87 = nplog_obj(v18, v19, v20);
        v23 = objc_claimAutoreleasedReturnValue(v87);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to allocate dictionary for previous triggers", buf, 2u);
        }
      }
      else
      {
        v85 = nplog_obj(v13, v14, v15);
        v23 = objc_claimAutoreleasedReturnValue(v85);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Proactive Token Fetch is disabled", buf, 2u);
        }
      }
    }
    else
    {
      v123 = nplog_obj(0, v10, v11);
      v23 = objc_claimAutoreleasedReturnValue(v123);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v159 = COERCE_DOUBLE("+[NSPCoreData triggerProactiveTokenFetch:lowerTokenCountThreshold:]");
        _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "%s called with null enabled", buf, 0xCu);
      }
    }
    LOBYTE(v48) = 0;
LABEL_77:

    goto LABEL_78;
  }
  v122 = nplog_obj(0, v6, v7);
  v12 = objc_claimAutoreleasedReturnValue(v122);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    v159 = COERCE_DOUBLE("+[NSPCoreData triggerProactiveTokenFetch:lowerTokenCountThreshold:]");
    _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "%s called with null config", buf, 0xCu);
  }
  LOBYTE(v48) = 0;
LABEL_78:

  return v48 & 1;
}

+ (id)getNSPEventsProbability:(id)a3 count:(int64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  NSNumber *v23;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  int v28;
  const char *v29;

  v5 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("mean")));
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("stdDev")));
    if (v9)
    {
      v12 = v9;
      v13 = -[NSObject doubleValue](v9, "doubleValue");
      if (v16 != 0.0)
      {
        objc_msgSend(v8, "doubleValue");
        v21 = (double)a4 - v20;
        -[NSObject doubleValue](v12, "doubleValue");
        v23 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)((erf(v21 / v22 / 1.41421356) + 1.0) * 0.5));
        v19 = (void *)objc_claimAutoreleasedReturnValue(v23);
        goto LABEL_9;
      }
      v17 = nplog_obj(v13, v14, v15);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v28) = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Standard Deviation is 0", (uint8_t *)&v28, 2u);
      }

    }
    else
    {
      v26 = nplog_obj(0, v10, v11);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        v28 = 136315138;
        v29 = "+[NSPCoreData getNSPEventsProbability:count:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "%s called with null stdDev", (uint8_t *)&v28, 0xCu);
      }

      v12 = 0;
    }
  }
  else
  {
    v25 = nplog_obj(0, v6, v7);
    v12 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      v28 = 136315138;
      v29 = "+[NSPCoreData getNSPEventsProbability:count:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "%s called with null mean", (uint8_t *)&v28, 0xCu);
    }
  }
  v19 = 0;
LABEL_9:

  return v19;
}

+ (id)getMinMaxDate
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v10[4];
  id v11;
  uint8_t *v12;
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData sharedCoreDataContext](NSPCoreData, "sharedCoreDataContext"));
  v5 = v2;
  if (v2)
  {
    *(_QWORD *)buf = 0;
    v14 = buf;
    v15 = 0x3032000000;
    v16 = sub_10000313C;
    v17 = sub_100074524;
    v18 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10007452C;
    v10[3] = &unk_1000F5428;
    v11 = v2;
    v12 = buf;
    objc_msgSend(v11, "performBlockAndWait:", v10);
    v6 = *((id *)v14 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v7 = nplog_obj(0, v3, v4);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "NSP Core Data context not available", buf, 2u);
    }

    v6 = 0;
  }

  return v6;
}

+ (id)computeStats:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  NSObject *v12;
  char *v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  double v21;
  void *i;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[2];
  _QWORD v39[2];
  uint8_t v40[128];
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  int v44;

  v3 = a3;
  v6 = v3;
  if (!v3)
  {
    v33 = nplog_obj(0, v4, v5);
    v12 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v42 = "+[NSPCoreData computeStats:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "%s called with null data", buf, 0xCu);
    }
    goto LABEL_5;
  }
  v7 = objc_msgSend(v3, "count");
  v10 = (unint64_t)v7;
  if ((unint64_t)v7 <= 4)
  {
    v11 = nplog_obj(v7, v8, v9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v42 = (const char *)v10;
      v43 = 1024;
      v44 = 5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Insufficient number of data points to compute stats. (%lu vs %d)", buf, 0x12u);
    }
LABEL_5:
    v13 = 0;
    goto LABEL_18;
  }
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKeyPath:", CFSTR("@sum.self")));
  -[NSObject doubleValue](v12, "doubleValue");
  v14 = (double)v10;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15 / (double)v10));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v17 = v6;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v35;
    v21 = 0.0;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i), "doubleValue", (_QWORD)v34);
        v24 = v23;
        objc_msgSend(v16, "doubleValue");
        v21 = v21 + (v24 - v25) * (v24 - v25);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v19);
  }
  else
  {
    v21 = 0.0;
  }

  objc_msgSend(v16, "doubleValue");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", sqrt(v21 / v14)));
  v38[0] = CFSTR("mean");
  v38[1] = CFSTR("stdDev");
  v39[0] = v26;
  v39[1] = v27;
  v13 = (char *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 2));
  v30 = nplog_obj(v13, v28, v29);
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "Data stats dict:%@", buf, 0xCu);
  }

LABEL_18:
  return v13;
}

+ (id)getNSPEventStatsForSingleWindow:(id)a3 eventType:(int64_t)a4 startDate:(id)a5 endDate:(id)a6 windowStartTime:(id)a7 windowDuration:(id)a8
{
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  id v46;
  id v47;
  uint8_t v48[16];
  _QWORD v49[4];
  id v50;
  NSObject *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  uint64_t *v57;
  _BYTE *v58;
  int64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  id v63;
  _BYTE buf[24];
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;

  v46 = a3;
  v13 = a5;
  v14 = a6;
  v47 = a7;
  v15 = a8;
  v16 = objc_claimAutoreleasedReturnValue(+[NSPCoreData sharedCoreDataContext](NSPCoreData, "sharedCoreDataContext"));
  v19 = (void *)v16;
  if (!v16)
  {
    v34 = nplog_obj(0, v17, v18);
    v22 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "NSP Core Data context not available", buf, 2u);
    }
    goto LABEL_12;
  }
  if (!v13)
  {
    v40 = nplog_obj(v16, v17, v18);
    v22 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "+[NSPCoreData getNSPEventStatsForSingleWindow:eventType:startDate:endDate:windowStartTime:windowDuration:]";
      v41 = "%s called with null startDate";
LABEL_27:
      _os_log_fault_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, v41, buf, 0xCu);
    }
LABEL_12:
    v33 = 0;
    goto LABEL_22;
  }
  if (!v14)
  {
    v42 = nplog_obj(v16, v17, v18);
    v22 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "+[NSPCoreData getNSPEventStatsForSingleWindow:eventType:startDate:endDate:windowStartTime:windowDuration:]";
      v41 = "%s called with null endDate";
      goto LABEL_27;
    }
    goto LABEL_12;
  }
  v22 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  if (v22)
  {
    v23 = objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithAbbreviation:](NSTimeZone, "timeZoneWithAbbreviation:", CFSTR("UTC")));
    -[NSObject setTimeZone:](v22, "setTimeZone:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject components:fromDate:toDate:options:](v22, "components:fromDate:toDate:options:", 16, v13, v14, 0));
    v27 = v24;
    if (v24)
    {
      v60 = 0;
      v61 = &v60;
      v62 = 0x2020000000;
      v63 = 0;
      v28 = objc_msgSend(v24, "day");
      v63 = v28;
      if ((unint64_t)v61[3] < 0x1F)
      {
        objc_msgSend(v27, "setDay:", 1);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v65 = sub_10000313C;
        v66 = sub_100074524;
        v67 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = sub_10007533C;
        v49[3] = &unk_1000F66F0;
        v50 = v13;
        v57 = &v60;
        v51 = v22;
        v52 = v27;
        v53 = v47;
        v54 = v15;
        v55 = v46;
        v59 = a4;
        v56 = v19;
        v58 = buf;
        objc_msgSend(v56, "performBlockAndWait:", v49);
        if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"))
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData computeStats:](NSPCoreData, "computeStats:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40)));
        }
        else
        {
          v37 = nplog_obj(0, v35, v36);
          v38 = objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v48 = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "No records found", v48, 2u);
          }

          v33 = 0;
        }

        _Block_object_dispose(buf, 8);
      }
      else
      {
        v31 = nplog_obj(v28, v29, v30);
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v13;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v14;
          _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Invalid dates. startDate:%@ endDate:%@", buf, 0x16u);
        }

        v33 = 0;
      }
      _Block_object_dispose(&v60, 8);
    }
    else
    {
      v44 = nplog_obj(0, v25, v26);
      v45 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "+[NSPCoreData getNSPEventStatsForSingleWindow:eventType:startDate:endDate:windowStartTime:windowDuration:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_FAULT, "%s called with null dayComponents", buf, 0xCu);
      }

      v33 = 0;
    }

  }
  else
  {
    v43 = nplog_obj(0, v20, v21);
    v23 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "+[NSPCoreData getNSPEventStatsForSingleWindow:eventType:startDate:endDate:windowStartTime:windowDuration:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "%s called with null calendar", buf, 0xCu);
    }
    v33 = 0;
  }

LABEL_22:
  return v33;
}

+ (id)getNSPTokenStatsForSingleWindow:(id)a3 startDate:(id)a4 endDate:(id)a5 windowStartTime:(id)a6 windowDuration:(id)a7 statsCategory:(int64_t)a8
{
  char v8;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  NSObject *log;
  os_log_t oslog;
  id v50;
  id v51;
  void *v52;
  id v53;
  _QWORD v54[4];
  id v55;
  NSObject *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  NSObject *v61;
  id v62;
  uint64_t *v63;
  uint64_t *v64;
  _BYTE *v65;
  uint64_t *v66;
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  id v83;
  _BYTE buf[24];
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;

  v8 = a8;
  v13 = a3;
  v53 = a4;
  v51 = a5;
  v14 = a6;
  v50 = a7;
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData sharedCoreDataContext](NSPCoreData, "sharedCoreDataContext"));
  if (v52)
  {
    v17 = objc_claimAutoreleasedReturnValue(+[NSPTokenEvent fetchRequest](NSPTokenEvent, "fetchRequest"));
    v20 = v17;
    if (v17)
    {
      if (v53)
      {
        if (v51)
        {
          -[NSObject setPropertiesToFetch:](v17, "setPropertiesToFetch:", &off_1000FF950);
          -[NSObject setResultType:](v20, "setResultType:", 2);
          oslog = (os_log_t)objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
          if (oslog)
          {
            log = objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithAbbreviation:](NSTimeZone, "timeZoneWithAbbreviation:", CFSTR("UTC")));
            -[NSObject setTimeZone:](oslog, "setTimeZone:", log);
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject components:fromDate:toDate:options:](oslog, "components:fromDate:toDate:options:", 16, v53, v51, 0));
            v26 = v23;
            if (v23)
            {
              v80 = 0;
              v81 = &v80;
              v82 = 0x2020000000;
              v83 = 0;
              v27 = objc_msgSend(v23, "day");
              v83 = v27;
              if ((unint64_t)v81[3] < 0x1F)
              {
                objc_msgSend(v26, "setDay:", 1);
                v34 = objc_msgSend(v14, "weekday");
                *(_QWORD *)buf = 0;
                *(_QWORD *)&buf[8] = buf;
                *(_QWORD *)&buf[16] = 0x3032000000;
                v85 = sub_10000313C;
                v86 = sub_100074524;
                v87 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
                v74 = 0;
                v75 = &v74;
                v76 = 0x3032000000;
                v77 = sub_10000313C;
                v78 = sub_100074524;
                v79 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
                v68 = 0;
                v69 = &v68;
                v70 = 0x3032000000;
                v71 = sub_10000313C;
                v72 = sub_100074524;
                v73 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
                v54[0] = _NSConcreteStackBlock;
                v54[1] = 3221225472;
                v54[2] = sub_100075F78;
                v54[3] = &unk_1000F6718;
                v55 = v53;
                v63 = &v80;
                v56 = oslog;
                v57 = v26;
                v58 = v14;
                v59 = v50;
                v60 = v13;
                v61 = v20;
                v62 = v52;
                v64 = &v74;
                v66 = &v68;
                v67 = v34;
                v65 = buf;
                objc_msgSend(v62, "performBlockAndWait:", v54);
                v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
                if ((v8 & 1) != 0)
                {
                  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
                  objc_msgSend(v35, "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
                  objc_msgSend(v35, "addObjectsFromArray:", v75[5]);
                  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData computeStats:](NSPCoreData, "computeStats:", v35));
                  if (v36)
                    objc_msgSend(v32, "addObject:", v36);

                }
                if ((v8 & 2) != 0)
                {
                  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData computeStats:](NSPCoreData, "computeStats:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40)));
                  if (v37)
                    objc_msgSend(v32, "addObject:", v37);

                }
                if ((v8 & 4) != 0)
                {
                  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData computeStats:](NSPCoreData, "computeStats:", v75[5]));
                  if (v38)
                    objc_msgSend(v32, "addObject:", v38);

                }
                if ((v8 & 8) != 0)
                {
                  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData computeStats:](NSPCoreData, "computeStats:", v69[5]));
                  if (v39)
                    objc_msgSend(v32, "addObject:", v39);

                }
                _Block_object_dispose(&v68, 8);

                _Block_object_dispose(&v74, 8);
                _Block_object_dispose(buf, 8);

              }
              else
              {
                v30 = nplog_obj(v27, v28, v29);
                v31 = objc_claimAutoreleasedReturnValue(v30);
                if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  *(_QWORD *)&buf[4] = v53;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v51;
                  _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Invalid dates. startDate: %@  endDate: %@", buf, 0x16u);
                }

                v32 = 0;
              }
              _Block_object_dispose(&v80, 8);
            }
            else
            {
              v46 = nplog_obj(0, v24, v25);
              v47 = objc_claimAutoreleasedReturnValue(v46);
              if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315138;
                *(_QWORD *)&buf[4] = "+[NSPCoreData getNSPTokenStatsForSingleWindow:startDate:endDate:windowStartTime:win"
                                     "dowDuration:statsCategory:]";
                _os_log_fault_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_FAULT, "%s called with null dayComponents", buf, 0xCu);
              }

              v32 = 0;
            }

          }
          else
          {
            v45 = nplog_obj(0, v21, v22);
            log = objc_claimAutoreleasedReturnValue(v45);
            if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = "+[NSPCoreData getNSPTokenStatsForSingleWindow:startDate:endDate:windowStartTime:windo"
                                   "wDuration:statsCategory:]";
              _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s called with null calendar", buf, 0xCu);
            }
            v32 = 0;
          }

          goto LABEL_34;
        }
        v44 = nplog_obj(v17, v18, v19);
        oslog = (os_log_t)objc_claimAutoreleasedReturnValue(v44);
        if (!os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
        {
LABEL_41:
          v32 = 0;
LABEL_34:

          goto LABEL_35;
        }
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "+[NSPCoreData getNSPTokenStatsForSingleWindow:startDate:endDate:windowStartTime:windowDurat"
                             "ion:statsCategory:]";
        v42 = "%s called with null endDate";
      }
      else
      {
        v43 = nplog_obj(v17, v18, v19);
        oslog = (os_log_t)objc_claimAutoreleasedReturnValue(v43);
        if (!os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
          goto LABEL_41;
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "+[NSPCoreData getNSPTokenStatsForSingleWindow:startDate:endDate:windowStartTime:windowDurat"
                             "ion:statsCategory:]";
        v42 = "%s called with null startDate";
      }
    }
    else
    {
      v41 = nplog_obj(0, v18, v19);
      oslog = (os_log_t)objc_claimAutoreleasedReturnValue(v41);
      if (!os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
        goto LABEL_41;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "+[NSPCoreData getNSPTokenStatsForSingleWindow:startDate:endDate:windowStartTime:windowDuratio"
                           "n:statsCategory:]";
      v42 = "%s called with null fetchRequest";
    }
    _os_log_fault_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_FAULT, v42, buf, 0xCu);
    goto LABEL_41;
  }
  v33 = nplog_obj(0, v15, v16);
  v20 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "NSP Core Data context not available", buf, 2u);
  }
  v32 = 0;
LABEL_35:

  return v32;
}

+ (id)getTokenCountStatsForMultipleWindows:(id)a3 minDate:(id)a4 maxDate:(id)a5 windowDuration:(id)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[2];
  _QWORD v45[2];
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  void *v49;

  v43 = a3;
  v42 = a4;
  v41 = a5;
  v9 = a6;
  v12 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  if (v12)
  {
    v15 = objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithAbbreviation:](NSTimeZone, "timeZoneWithAbbreviation:", CFSTR("UTC")));
    if (v15)
    {
      v40 = v15;
      objc_msgSend(v12, "setTimeZone:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "components:fromDate:", 28, v16));
      objc_msgSend(v17, "setHour:", 0);
      objc_msgSend(v17, "setMinute:", 0);
      objc_msgSend(v17, "setSecond:", 0);
      v39 = v17;
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateFromComponents:", v17));

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject dateByAddingTimeInterval:](v18, "dateByAddingTimeInterval:", 86400.0));
      objc_msgSend(v9, "doubleValue");
      v21 = v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v25 = nplog_obj(v22, v23, v24);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v47 = (const char *)v18;
        v48 = 2112;
        v49 = v19;
        _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "currentDate: %@  endDate: %@", buf, 0x16u);
      }

      v44[0] = CFSTR("mean");
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0));
      v44[1] = CFSTR("stdDev");
      v45[0] = v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -1.0));
      v45[1] = v28;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v45, v44, 2));

      if (objc_msgSend(v12, "compareDate:toDate:toUnitGranularity:", v18, v19, 16) == (id)-1)
      {
        v31 = v21 * 60.0;
        do
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "components:fromDate:", 96, v18));
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData getNSPTokenStatsForSingleWindow:startDate:endDate:windowStartTime:windowDuration:statsCategory:](NSPCoreData, "getNSPTokenStatsForSingleWindow:startDate:endDate:windowStartTime:windowDuration:statsCategory:", v43, v42, v41, v32, v9, 1));
          v34 = v33;
          if (v33 && objc_msgSend(v33, "count"))
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectAtIndexedSubscript:", 0));
            objc_msgSend(v22, "addObject:", v35);

          }
          else
          {
            objc_msgSend(v22, "addObject:", v29);
          }
          v30 = objc_claimAutoreleasedReturnValue(-[NSObject dateByAddingTimeInterval:](v18, "dateByAddingTimeInterval:", v31));

          v18 = v30;
        }
        while (objc_msgSend(v12, "compareDate:toDate:toUnitGranularity:", v30, v19, 16) == (id)-1);
      }
      else
      {
        v30 = v18;
      }

      v15 = v40;
    }
    else
    {
      v38 = nplog_obj(0, v13, v14);
      v30 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "+[NSPCoreData getTokenCountStatsForMultipleWindows:minDate:maxDate:windowDuration:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_FAULT, "%s called with null timeZone", buf, 0xCu);
      }
      v22 = 0;
    }

  }
  else
  {
    v37 = nplog_obj(0, v10, v11);
    v15 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "+[NSPCoreData getTokenCountStatsForMultipleWindows:minDate:maxDate:windowDuration:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "%s called with null calendar", buf, 0xCu);
    }
    v22 = 0;
  }

  return v22;
}

+ (void)saveTokenEvent:(id)a3 eventType:(int)a4 vendor:(id)a5 tokenCount:(unint64_t)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  unint64_t v21;
  int v22;
  uint8_t buf[16];

  v9 = a3;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData sharedCoreDataContext](NSPCoreData, "sharedCoreDataContext"));
  v14 = v11;
  if (v11)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000769F8;
    v17[3] = &unk_1000F6740;
    v18 = v11;
    v19 = v9;
    v22 = a4;
    v20 = v10;
    v21 = a6;
    objc_msgSend(v18, "performBlockAndWait:", v17);

  }
  else
  {
    v15 = nplog_obj(0, v12, v13);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "NSP Core Data context not available", buf, 2u);
    }

  }
}

+ (void)purgeEventsOlderThanDate:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[16];

  v3 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData sharedCoreDataContext](NSPCoreData, "sharedCoreDataContext"));
  if (v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100076D70;
    v9[3] = &unk_1000F5A80;
    v10 = v3;
    v11 = v6;
    objc_msgSend(v11, "performBlockAndWait:", v9);

  }
  else
  {
    v7 = nplog_obj(0, v4, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "NSP Core Data context not available", buf, 2u);
    }

  }
}

+ (void)purgeEventsOlderThanDays:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 16, -a3, v5, 0));

  +[NSPCoreData purgeEventsOlderThanDate:](NSPCoreData, "purgeEventsOlderThanDate:", v6);
}

+ (id)fetchEvents
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v10[4];
  id v11;
  uint8_t *v12;
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData sharedCoreDataContext](NSPCoreData, "sharedCoreDataContext"));
  v5 = v2;
  if (v2)
  {
    *(_QWORD *)buf = 0;
    v14 = buf;
    v15 = 0x3032000000;
    v16 = sub_10000313C;
    v17 = sub_100074524;
    v18 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100077284;
    v10[3] = &unk_1000F6768;
    v12 = buf;
    v11 = v2;
    objc_msgSend(v11, "performBlockAndWait:", v10);
    v6 = *((id *)v14 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v7 = nplog_obj(0, v3, v4);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "NSP Core Data context not available", buf, 2u);
    }

    v6 = 0;
  }

  return v6;
}

+ (id)NSPEventsCacheGet
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)qword_100112E90;
  if (!qword_100112E90)
  {
    v3 = objc_alloc_init((Class)NSMutableArray);
    v4 = (void *)qword_100112E90;
    qword_100112E90 = (uint64_t)v3;

    v2 = (void *)qword_100112E90;
  }
  return v2;
}

+ (id)NSPEventsCacheUpdate:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v10;
  NSObject *v11;
  int v12;
  const char *v13;

  v3 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData NSPEventsCacheGet](NSPCoreData, "NSPEventsCacheGet"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "vendor"));
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSPCoreData getVendorIdFromDictionary:](NSPCoreData, "getVendorIdFromDictionary:", v7));

    if (v8)
    {
      if ((unint64_t)objc_msgSend(v6, "count") >= 6)
        objc_msgSend(v6, "removeObjectAtIndex:", 0);
      objc_msgSend(v6, "addObject:", v3);
      v8 = v6;
    }
  }
  else
  {
    v10 = nplog_obj(0, v4, v5);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      v12 = 136315138;
      v13 = "+[NSPCoreData NSPEventsCacheUpdate:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "%s called with null cache", (uint8_t *)&v12, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

+ (id)fetchLatestEvents:(unint64_t)a3 vendors:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t *v21;
  unint64_t v22;
  uint8_t buf[8];
  uint8_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v5 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData sharedCoreDataContext](NSPCoreData, "sharedCoreDataContext"));
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[NSPCoreData NSPEventsCacheGet](NSPCoreData, "NSPEventsCacheGet"));
    v10 = -[NSObject count](v9, "count");
    if ((unint64_t)v10 >= a3)
    {
      v15 = nplog_obj(v10, v11, v12);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Using NSP events from the cache", buf, 2u);
      }

      v9 = v9;
      v13 = v9;
    }
    else
    {
      *(_QWORD *)buf = 0;
      v24 = buf;
      v25 = 0x3032000000;
      v26 = sub_10000313C;
      v27 = sub_100074524;
      v28 = 0;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100077890;
      v18[3] = &unk_1000F6790;
      v22 = a3;
      v19 = v5;
      v21 = buf;
      v20 = v8;
      objc_msgSend(v20, "performBlockAndWait:", v18);
      v13 = *((id *)v24 + 5);

      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    v14 = nplog_obj(0, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "NSP Core Data context not available", buf, 2u);
    }
    v13 = 0;
  }

  return v13;
}

+ (id)fetchEvents:(id)a3 mostRecent:(BOOL)a4 limit:(unint64_t)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t *v18;
  unint64_t v19;
  BOOL v20;
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v7 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData sharedCoreDataContext](NSPCoreData, "sharedCoreDataContext"));
  if (v10)
  {
    *(_QWORD *)buf = 0;
    v22 = buf;
    v23 = 0x3032000000;
    v24 = sub_10000313C;
    v25 = sub_100074524;
    v26 = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000780A8;
    v15[3] = &unk_1000F67B8;
    v20 = a4;
    v18 = buf;
    v19 = a5;
    v16 = v7;
    v17 = v10;
    objc_msgSend(v17, "performBlockAndWait:", v15);
    v11 = *((id *)v22 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v12 = nplog_obj(0, v8, v9);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "NSP Core Data context not available", buf, 2u);
    }

    v11 = 0;
  }

  return v11;
}

+ (id)prepareInputForTraining
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  id v42;
  void *v44;
  char *v45;
  void *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  int v54;
  const char *v55;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData getNSPEventsNormalizer](NSPCoreData, "getNSPEventsNormalizer"));
  v5 = v2;
  if (v2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "model"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "modelDescription"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "inputDescriptionsByName"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("normalizer_input")));

    v13 = nplog_obj(v10, v11, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject multiArrayConstraint](v9, "multiArrayConstraint"));
      v45 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "shape"));
      v54 = 138412290;
      v55 = v45;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "input shape %@", (uint8_t *)&v54, 0xCu);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject multiArrayConstraint](v9, "multiArrayConstraint"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "shape"));

    if (!v16)
    {
      v49 = nplog_obj(v17, v18, v19);
      v23 = objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        v54 = 136315138;
        v55 = "+[NSPCoreData prepareInputForTraining]";
        _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "%s called with null inputShape", (uint8_t *)&v54, 0xCu);
      }
      v42 = 0;
      goto LABEL_13;
    }
    v20 = objc_claimAutoreleasedReturnValue(+[NSPCoreData getNSPEventsDenormalizer](NSPCoreData, "getNSPEventsDenormalizer"));
    v23 = v20;
    if (!v20)
    {
      v50 = nplog_obj(0, v21, v22);
      v27 = objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        v54 = 136315138;
        v55 = "+[NSPCoreData prepareInputForTraining]";
        _os_log_fault_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "%s called with null denormalizer", (uint8_t *)&v54, 0xCu);
      }
      v42 = 0;
      goto LABEL_12;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject model](v20, "model"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "modelDescription"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "inputDescriptionsByName"));
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("denormalizer_input")));

    v31 = nplog_obj(v28, v29, v30);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject multiArrayConstraint](v27, "multiArrayConstraint"));
      v47 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "shape"));
      v54 = 138412290;
      v55 = v47;
      _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "target shape %@", (uint8_t *)&v54, 0xCu);

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject multiArrayConstraint](v27, "multiArrayConstraint"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "shape"));

    if (v34)
    {
      v38 = objc_claimAutoreleasedReturnValue(+[NSPCoreData fetchEvents](NSPCoreData, "fetchEvents"));
      if (v38)
      {
        v41 = v38;
        v42 = -[NSPEventsPredictorTrainingBatchProvider init:inputShape:targetShape:]([NSPEventsPredictorTrainingBatchProvider alloc], "init:inputShape:targetShape:", v38, v16, v34);
LABEL_11:

LABEL_12:
LABEL_13:

        goto LABEL_14;
      }
      v52 = nplog_obj(0, v39, v40);
      v53 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
      {
        v54 = 136315138;
        v55 = "+[NSPCoreData prepareInputForTraining]";
        _os_log_fault_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_FAULT, "%s called with null events", (uint8_t *)&v54, 0xCu);
      }

      v41 = 0;
    }
    else
    {
      v51 = nplog_obj(v35, v36, v37);
      v41 = objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
      {
        v54 = 136315138;
        v55 = "+[NSPCoreData prepareInputForTraining]";
        _os_log_fault_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_FAULT, "%s called with null targetShape", (uint8_t *)&v54, 0xCu);
      }
    }
    v42 = 0;
    goto LABEL_11;
  }
  v48 = nplog_obj(0, v3, v4);
  v9 = objc_claimAutoreleasedReturnValue(v48);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    v54 = 136315138;
    v55 = "+[NSPCoreData prepareInputForTraining]";
    _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "%s called with null normalizer", (uint8_t *)&v54, 0xCu);
  }
  v42 = 0;
LABEL_14:

  return v42;
}

+ (void)trainModel
{
  +[NSPCoreData purgeEventsOlderThanDays:](NSPCoreData, "purgeEventsOlderThanDays:", 30);
}

+ (id)getModelVersion:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  const char *v28;

  if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "modelDescription"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metadata"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MLModelCreatorDefinedKey));

    if (!v5)
    {
      v25 = nplog_obj(v6, v7, v8);
      v12 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        v27 = 136315138;
        v28 = "+[NSPCoreData getModelVersion:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "%s called with null metadata", (uint8_t *)&v27, 0xCu);
      }
      v22 = 0;
      goto LABEL_9;
    }
    v9 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("version")));
    v12 = v9;
    if (v9)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject componentsSeparatedByString:](v9, "componentsSeparatedByString:", CFSTR(".")));
      v14 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", CFSTR("intValue")));

      v18 = nplog_obj(v15, v16, v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      v20 = v19;
      if (v14)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v27 = 138412290;
          v28 = v14;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "model version %@", (uint8_t *)&v27, 0xCu);
        }

        v21 = v14;
        v22 = v21;
        goto LABEL_8;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        v27 = 136315138;
        v28 = "+[NSPCoreData getModelVersion:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "%s called with null versionComponents", (uint8_t *)&v27, 0xCu);
      }

      v21 = 0;
    }
    else
    {
      v26 = nplog_obj(0, v10, v11);
      v21 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        v27 = 136315138;
        v28 = "+[NSPCoreData getModelVersion:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "%s called with null versionStr", (uint8_t *)&v27, 0xCu);
      }
    }
    v22 = 0;
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }
  v24 = nplog_obj(a1, a2, 0);
  v5 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v27 = 136315138;
    v28 = "+[NSPCoreData getModelVersion:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "%s called with null model", (uint8_t *)&v27, 0xCu);
  }
  v22 = 0;
LABEL_10:

  return v22;
}

+ (id)compareModelVersion:(id)a3 model2:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  id v28;
  id v29;
  void *v30;
  unsigned int v31;
  void *v32;
  int v34;
  void *v35;
  __int16 v36;
  void *v37;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData getModelVersion:](NSPCoreData, "getModelVersion:", a3));
  v7 = objc_claimAutoreleasedReturnValue(+[NSPCoreData getModelVersion:](NSPCoreData, "getModelVersion:", v5));
  v10 = (void *)v7;
  if (v6)
    v11 = v7 == 0;
  else
    v11 = 1;
  if (v11)
  {
    v12 = nplog_obj(v7, v8, v9);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v14)
      {
        LOWORD(v34) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "model2 version not found", (uint8_t *)&v34, 2u);
      }

      v15 = objc_alloc((Class)NSNumber);
      v16 = 1;
      goto LABEL_22;
    }
    if (v10)
    {
      if (v14)
      {
        LOWORD(v34) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "model1 version not found", (uint8_t *)&v34, 2u);
      }

      v15 = objc_alloc((Class)NSNumber);
      v16 = 0xFFFFFFFFLL;
      goto LABEL_22;
    }
    if (v14)
    {
      LOWORD(v34) = 0;
      v25 = "model1 and model2 version not found";
      v26 = v13;
      v27 = 2;
      goto LABEL_26;
    }
LABEL_27:

    v28 = 0;
    goto LABEL_28;
  }
  v17 = objc_msgSend(v6, "count");
  v18 = objc_msgSend(v10, "count");
  if (v17 != v18)
  {
    v24 = nplog_obj(v18, v19, v20);
    v13 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v34 = 138412546;
      v35 = v6;
      v36 = 2112;
      v37 = v10;
      v25 = "Incompatible version strings (%@ vs %@)";
      v26 = v13;
      v27 = 22;
LABEL_26:
      _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v34, v27);
      goto LABEL_27;
    }
    goto LABEL_27;
  }
  if (!objc_msgSend(v6, "count"))
  {
LABEL_15:
    v15 = objc_alloc((Class)NSNumber);
    v16 = 0;
LABEL_22:
    v28 = objc_msgSend(v15, "initWithInt:", v16);
    goto LABEL_28;
  }
  v21 = 0;
  while (1)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v21));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", v21));

    if (v22 != v23)
      break;
    if (++v21 >= (unint64_t)objc_msgSend(v6, "count"))
      goto LABEL_15;
  }
  v29 = objc_alloc((Class)NSNumber);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v21));
  v31 = objc_msgSend(v30, "intValue");
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", v21));
  v28 = objc_msgSend(v29, "initWithInt:", v31 - objc_msgSend(v32, "intValue"));

LABEL_28:
  return v28;
}

+ (id)getVendorDictionary
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)qword_100112E98;
  if (!qword_100112E98)
  {
    v3 = objc_alloc_init((Class)NSMutableDictionary);
    v4 = (void *)qword_100112E98;
    qword_100112E98 = (uint64_t)v3;

    v2 = (void *)qword_100112E98;
  }
  return v2;
}

+ (id)updateVendorDictionaryFromModel:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *i;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  const char *v35;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "modelDescription"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metadata"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MLModelCreatorDefinedKey));

  if (v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vendors")));

    if (!v9)
    {
      v14 = 0;
      goto LABEL_15;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vendors")));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(":")));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData getVendorDictionary](NSPCoreData, "getVendorDictionary"));
    if (v14)
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v28 = v11;
      v15 = v11;
      v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v30;
        v19 = 1;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(_QWORD *)v30 != v18)
              objc_enumerationMutation(v15);
            v21 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (char *)i + v19));
            objc_msgSend(v14, "setValue:forKey:", v22, v21);

          }
          v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          v19 = (v19 + (_DWORD)i);
        }
        while (v17);
      }

      v23 = v14;
      v11 = v28;
    }
    else
    {
      v26 = nplog_obj(0, v12, v13);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v35 = "+[NSPCoreData updateVendorDictionaryFromModel:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "%s called with null dictionary", buf, 0xCu);
      }

    }
  }
  else
  {
    v25 = nplog_obj(v6, v7, v8);
    v11 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "+[NSPCoreData updateVendorDictionaryFromModel:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "%s called with null metadata", buf, 0xCu);
    }
    v14 = 0;
  }

LABEL_15:
  return v14;
}

+ (id)getVendorIdFromDictionary:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v10;
  NSObject *v11;
  int v12;
  const char *v13;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData getVendorDictionary](NSPCoreData, "getVendorDictionary"));
  v7 = v4;
  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v3));
  }
  else
  {
    v10 = nplog_obj(0, v5, v6);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      v12 = 136315138;
      v13 = "+[NSPCoreData getVendorIdFromDictionary:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "%s called with null dictionary", (uint8_t *)&v12, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

+ (id)getVendorNameById:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const char *v29;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData getVendorDictionary](NSPCoreData, "getVendorDictionary"));
  v7 = v4;
  if (v4)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = v4;
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v8, "objectForKey:", v13, (_QWORD)v23));
          v15 = objc_msgSend(v14, "longValue");

          if (v15 == (id)a3)
          {
            v20 = v13;
            goto LABEL_14;
          }
        }
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v10)
          continue;
        break;
      }
    }

    v19 = nplog_obj(v16, v17, v18);
    v8 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v29 = (const char *)a3;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Vendor id %lu not found", buf, 0xCu);
    }
  }
  else
  {
    v22 = nplog_obj(0, v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "+[NSPCoreData getVendorNameById:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "%s called with null dictionary", buf, 0xCu);
    }
  }
  v20 = 0;
LABEL_14:

  return v20;
}

+ (id)initNSPEventsModelPredictor
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  NSArray *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  NSPEventsPredictor *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  NSPEventsPredictor *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unsigned __int8 v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t v58;
  NSObject *v59;
  unsigned __int8 v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v74;
  uint64_t v75;
  NSObject *v76;
  void *v77;
  NSObject *v78;
  NSPEventsPredictor *v79;
  NSPEventsPredictor *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSObject *v84;
  uint64_t v85;
  NSObject *v86;
  uint64_t v87;
  NSObject *v88;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  NSObject *v99;
  void *v100;
  NSObject *v101;
  NSObject *v102;
  NSObject *v103;
  char *v104;
  NSObject *v105;
  NSObject *v106;
  NSObject *v107;
  NSObject *v108;
  id v109;
  uint8_t buf[4];
  const char *v111;
  __int16 v112;
  NSObject *v113;
  __int16 v114;
  NSObject *v115;

  v2 = objc_alloc_init((Class)MLModelConfiguration);
  v5 = v2;
  if (v2)
  {
    objc_msgSend(v2, "setComputeUnits:", 0);
    v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), CFSTR("/usr/libexec/"), CFSTR("NSPEventsPredictor.mlmodelc")));
    if (!v8)
    {
      v91 = nplog_obj(0, v6, v7);
      v42 = objc_claimAutoreleasedReturnValue(v91);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v111 = "+[NSPCoreData initNSPEventsModelPredictor]";
        _os_log_fault_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_FAULT, "%s called with null srcStr", buf, 0xCu);
      }
      v80 = 0;
      goto LABEL_51;
    }
    v9 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v8, 1));
    v104 = (char *)v9;
    if (!v9)
    {
      v92 = nplog_obj(0, v10, v11);
      v17 = objc_claimAutoreleasedReturnValue(v92);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v111 = "+[NSPCoreData initNSPEventsModelPredictor]";
        _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "%s called with null srcURL", buf, 0xCu);
      }
      v42 = 0;
      v80 = 0;
      goto LABEL_50;
    }
    v12 = (const char *)v9;
    v13 = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v17 = v14;
    if (!v14)
    {
      v93 = nplog_obj(0, v15, v16);
      v20 = objc_claimAutoreleasedReturnValue(v93);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v111 = "+[NSPCoreData initNSPEventsModelPredictor]";
        _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "%s called with null paths", buf, 0xCu);
      }
      v42 = 0;
      v80 = 0;
      goto LABEL_49;
    }
    v20 = objc_claimAutoreleasedReturnValue(-[NSObject firstObject](v14, "firstObject"));
    if (!v20)
    {
      v94 = nplog_obj(0, v18, v19);
      v23 = objc_claimAutoreleasedReturnValue(v94);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v111 = "+[NSPCoreData initNSPEventsModelPredictor]";
        _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "%s called with null applicationSupportDirectory", buf, 0xCu);
      }
      v42 = 0;
      v80 = 0;
      goto LABEL_48;
    }
    v103 = v20;
    v23 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/networkserviceproxy/%@"), v20, CFSTR("NSPEventsPredictor.mlmodelc")));
    if (!v23)
    {
      v95 = nplog_obj(0, v21, v22);
      v27 = objc_claimAutoreleasedReturnValue(v95);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v111 = "+[NSPCoreData initNSPEventsModelPredictor]";
        _os_log_fault_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "%s called with null dstStr", buf, 0xCu);
      }
      v42 = 0;
      v80 = 0;
      goto LABEL_47;
    }
    v24 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v23, 1));
    v27 = v24;
    if (!v24)
    {
      v96 = nplog_obj(0, v25, v26);
      v28 = objc_claimAutoreleasedReturnValue(v96);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v111 = "+[NSPCoreData initNSPEventsModelPredictor]";
        _os_log_fault_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_FAULT, "%s called with null dstURL", buf, 0xCu);
      }
      v42 = 0;
      v80 = 0;
      goto LABEL_46;
    }
    v102 = v17;
    v28 = objc_claimAutoreleasedReturnValue(-[NSObject path](v24, "path"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v32 = v29;
    if (!v29)
    {
      v97 = nplog_obj(0, v30, v31);
      v36 = (NSPEventsPredictor *)objc_claimAutoreleasedReturnValue(v97);
      if (os_log_type_enabled(&v36->super, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v111 = "+[NSPCoreData initNSPEventsModelPredictor]";
        _os_log_fault_impl((void *)&_mh_execute_header, &v36->super, OS_LOG_TYPE_FAULT, "%s called with null manager", buf, 0xCu);
      }
      v42 = 0;
      v80 = 0;
      goto LABEL_45;
    }
    v101 = v28;
    v33 = objc_msgSend(v29, "fileExistsAtPath:", v28);
    if ((_DWORD)v33)
    {
      v109 = 0;
      v36 = -[NSPEventsPredictor initWithContentsOfURL:configuration:error:]([NSPEventsPredictor alloc], "initWithContentsOfURL:configuration:error:", v12, v5, &v109);
      v37 = v109;
      v40 = v37;
      if (!v36)
      {
        v82 = nplog_obj(v37, v38, v39);
        v36 = (NSPEventsPredictor *)objc_claimAutoreleasedReturnValue(v82);
        if (os_log_type_enabled(&v36->super, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v111 = v12;
          v112 = 2112;
          v113 = v40;
          _os_log_error_impl((void *)&_mh_execute_header, &v36->super, OS_LOG_TYPE_ERROR, "Failed to initialize base model at %@ error with %@", buf, 0x16u);
        }
        v80 = 0;
        v42 = v40;
        goto LABEL_44;
      }
      v108 = v37;
      v41 = -[NSPEventsPredictor initWithContentsOfURL:configuration:error:]([NSPEventsPredictor alloc], "initWithContentsOfURL:configuration:error:", v27, v5, &v108);
      v42 = v108;

      if (!v41)
      {
        v83 = nplog_obj(v43, v44, v45);
        v84 = objc_claimAutoreleasedReturnValue(v83);
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v111 = (const char *)v27;
          v112 = 2112;
          v113 = v42;
          _os_log_error_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_ERROR, "Failed to initialize personalized model at %@ error with %@", buf, 0x16u);
        }

        v80 = 0;
        goto LABEL_44;
      }
      v99 = v8;
      v100 = v5;
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSPEventsPredictor model](v36, "model"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSPEventsPredictor model](v41, "model"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData compareModelVersion:model2:](NSPCoreData, "compareModelVersion:model2:", v46, v47));

      if (v48)
      {
        v107 = v42;
        v52 = objc_msgSend(v32, "removeItemAtURL:error:", v27, &v107);
        v53 = v107;

        if ((v52 & 1) != 0)
        {

          v8 = v99;
          v12 = v104;
LABEL_16:
          v57 = v8;
          v58 = nplog_obj(v33, v34, v35);
          v59 = objc_claimAutoreleasedReturnValue(v58);
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v111 = v12;
            v112 = 2112;
            v113 = v27;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "copy base model from %@ to %@", buf, 0x16u);
          }

          v106 = v53;
          v60 = objc_msgSend(v32, "copyItemAtURL:toURL:error:", v12, v27, &v106);
          v61 = v106;

          if ((v60 & 1) == 0)
          {
            v81 = nplog_obj(v62, v63, v64);
            v36 = (NSPEventsPredictor *)objc_claimAutoreleasedReturnValue(v81);
            v28 = v101;
            if (os_log_type_enabled(&v36->super, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v111 = v12;
              v112 = 2112;
              v113 = v27;
              v114 = 2112;
              v115 = v61;
              _os_log_error_impl((void *)&_mh_execute_header, &v36->super, OS_LOG_TYPE_ERROR, "Failed to copy model from %@ to %@ error: %@", buf, 0x20u);
            }
            v80 = 0;
            v42 = v61;
            v8 = v57;
            v5 = v100;
            goto LABEL_45;
          }
          v105 = v61;
          v36 = -[NSPEventsPredictor initWithContentsOfURL:configuration:error:]([NSPEventsPredictor alloc], "initWithContentsOfURL:configuration:error:", v27, v100, &v105);
          v42 = v105;

          if (v36)
          {
            v68 = (void *)objc_claimAutoreleasedReturnValue(-[NSPEventsPredictor model](v36, "model"));
            v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData updateVendorDictionaryFromModel:](NSPCoreData, "updateVendorDictionaryFromModel:", v68));

            v8 = v57;
            v5 = v100;
            if (!v69)
            {
              v73 = nplog_obj(v70, v71, v72);
              v74 = objc_claimAutoreleasedReturnValue(v73);
              if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "Failed to update vendor dictionary from model", buf, 2u);
              }

            }
            v75 = nplog_obj(v70, v71, v72);
            v76 = objc_claimAutoreleasedReturnValue(v75);
            if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
            {
              v77 = (void *)objc_claimAutoreleasedReturnValue(-[NSPEventsPredictor model](v36, "model"));
              v78 = objc_claimAutoreleasedReturnValue(+[NSPCoreData getModelVersion:](NSPCoreData, "getModelVersion:", v77));
              *(_DWORD *)buf = 138412546;
              v111 = (const char *)v27;
              v112 = 2112;
              v113 = v78;
              _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_INFO, "Initialized NSPEventsPredictor at URL:%@ version:%@", buf, 0x16u);

            }
            v79 = v36;
            v80 = v36;
            goto LABEL_44;
          }
          v85 = nplog_obj(v65, v66, v67);
          v86 = objc_claimAutoreleasedReturnValue(v85);
          v8 = v57;
          if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v111 = (const char *)v27;
            v112 = 2112;
            v113 = v42;
            _os_log_error_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, "Failed to initialize model at %@ error with %@", buf, 0x16u);
          }

          v80 = 0;
LABEL_43:
          v5 = v100;
LABEL_44:
          v28 = v101;
LABEL_45:

          v17 = v102;
LABEL_46:

LABEL_47:
          v20 = v103;
LABEL_48:

LABEL_49:
LABEL_50:

LABEL_51:
          goto LABEL_52;
        }
        v87 = nplog_obj(v54, v55, v56);
        v88 = objc_claimAutoreleasedReturnValue(v87);
        if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v111 = (const char *)v53;
          _os_log_error_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_ERROR, "Failed to remove old personalized model %@", buf, 0xCu);
        }
        v42 = v53;
      }
      else
      {
        v98 = nplog_obj(v49, v50, v51);
        v88 = objc_claimAutoreleasedReturnValue(v98);
        if (os_log_type_enabled(v88, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v111 = "+[NSPCoreData initNSPEventsModelPredictor]";
          _os_log_fault_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_FAULT, "%s called with null result", buf, 0xCu);
        }
      }

      v80 = 0;
      v8 = v99;
      goto LABEL_43;
    }
    v100 = v5;
    v53 = 0;
    goto LABEL_16;
  }
  v90 = nplog_obj(0, v3, v4);
  v8 = objc_claimAutoreleasedReturnValue(v90);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    v111 = "+[NSPCoreData initNSPEventsModelPredictor]";
    _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "%s called with null config", buf, 0xCu);
  }
  v80 = 0;
LABEL_52:

  return v80;
}

+ (id)getNSPEventsNormalizer
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSPEventsNormalizer *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;

  v3 = (void *)qword_100112EA0;
  if (qword_100112EA0)
    return v3;
  v4 = nplog_obj(a1, a2, v2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Initializing NSPEventsNormalizer", buf, 2u);
  }

  v6 = (char *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", CFSTR("/usr/libexec/NSPEventsNormalizer.mlmodelc"), 1));
  v9 = nplog_obj(v6, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "mlmodel URL %@", buf, 0xCu);
  }

  v11 = objc_alloc_init((Class)MLModelConfiguration);
  if (v11)
  {
    v14 = v11;
    -[NSObject setComputeUnits:](v11, "setComputeUnits:", 0);
    v25 = 0;
    v15 = -[NSPEventsNormalizer initWithContentsOfURL:configuration:error:]([NSPEventsNormalizer alloc], "initWithContentsOfURL:configuration:error:", v6, v14, &v25);
    v16 = v25;
    v17 = (void *)qword_100112EA0;
    qword_100112EA0 = (uint64_t)v15;

    if (qword_100112EA0)
    {

      v3 = (void *)qword_100112EA0;
      return v3;
    }
    v22 = nplog_obj(v18, v19, v20);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v27 = v6;
      v28 = 2112;
      v29 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to initialize normalizer model %@ error: %@", buf, 0x16u);
    }

  }
  else
  {
    v24 = nplog_obj(0, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "+[NSPCoreData getNSPEventsNormalizer]";
      _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "%s called with null config", buf, 0xCu);
    }
  }

  return 0;
}

+ (id)getNSPEventsDenormalizer
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSPEventsDenormalizer *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;

  v3 = (void *)qword_100112EA8;
  if (qword_100112EA8)
    return v3;
  v4 = nplog_obj(a1, a2, v2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Initializing NSPEventsDenormalizer", buf, 2u);
  }

  v6 = (char *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", CFSTR("/usr/libexec/NSPEventsDenormalizer.mlmodelc"), 1));
  v9 = nplog_obj(v6, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "mlmodel URL %@", buf, 0xCu);
  }

  v11 = objc_alloc_init((Class)MLModelConfiguration);
  if (v11)
  {
    v14 = v11;
    -[NSObject setComputeUnits:](v11, "setComputeUnits:", 0);
    v25 = 0;
    v15 = -[NSPEventsDenormalizer initWithContentsOfURL:configuration:error:]([NSPEventsDenormalizer alloc], "initWithContentsOfURL:configuration:error:", v6, v14, &v25);
    v16 = v25;
    v17 = (void *)qword_100112EA8;
    qword_100112EA8 = (uint64_t)v15;

    if (qword_100112EA8)
    {

      v3 = (void *)qword_100112EA8;
      return v3;
    }
    v22 = nplog_obj(v18, v19, v20);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v27 = v6;
      v28 = 2112;
      v29 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to initialize denormalizer model %@ error:%@", buf, 0x16u);
    }

  }
  else
  {
    v24 = nplog_obj(0, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "+[NSPCoreData getNSPEventsDenormalizer]";
      _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "%s called with null config", buf, 0xCu);
    }
  }

  return 0;
}

+ (id)getNSPEventsPredictor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)qword_100112EB0;
  if (!qword_100112EB0)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSPCoreData initNSPEventsModelPredictor](NSPCoreData, "initNSPEventsModelPredictor"));
    v4 = (void *)qword_100112EB0;
    qword_100112EB0 = v3;

    v2 = (void *)qword_100112EB0;
  }
  return v2;
}

+ (void)printMLMultiArray:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  signed int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  signed int v36;
  void *v37;
  void *v38;
  void *v39;
  signed int v40;
  void *v41;
  void *v42;
  signed int v43;
  void *v44;
  __int128 v45;
  signed int v46;
  signed int i;
  unsigned int v48;
  uint8_t buf[4];
  _BYTE v50[10];
  void *v51;
  void *v52;

  v3 = a3;
  v6 = nplog_obj(v3, v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape"));
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v50 = v3;
    *(_WORD *)&v50[8] = 2112;
    v51 = v44;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "mlmultiarray shape %@ %@", buf, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape"));
  v9 = objc_msgSend(v8, "count");

  if ((unint64_t)v9 >= 3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
    v12 = objc_msgSend(v11, "intValue");

    if (v12 >= 1)
    {
      v46 = 0;
      *(_QWORD *)&v13 = 67109890;
      v45 = v13;
      do
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape", v45));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", 1));
        v16 = objc_msgSend(v15, "intValue");

        if (v16 >= 1)
        {
          for (i = 0; i < v40; ++i)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", 2));
            v19 = objc_msgSend(v18, "intValue");

            if (v19 >= 1)
            {
              v20 = 0;
              do
              {
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "strides"));
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", 0));
                v48 = objc_msgSend(v22, "intValue");
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "strides"));
                v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", 1));
                v25 = objc_msgSend(v24, "intValue");
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "strides"));
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectAtIndexedSubscript:", 2));
                v28 = objc_msgSend(v27, "intValue");

                v32 = nplog_obj(v29, v30, v31);
                v33 = objc_claimAutoreleasedReturnValue(v32);
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
                {
                  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", (int)(v48 * v46 + v25 * i + v28 * v20)));
                  *(_DWORD *)buf = v45;
                  *(_DWORD *)v50 = v46;
                  *(_WORD *)&v50[4] = 1024;
                  *(_DWORD *)&v50[6] = i;
                  LOWORD(v51) = 1024;
                  *(_DWORD *)((char *)&v51 + 2) = v20;
                  HIWORD(v51) = 2112;
                  v52 = v37;
                  _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "mlmodel data (%d %d %d: %@", buf, 0x1Eu);

                }
                ++v20;
                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape"));
                v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectAtIndexedSubscript:", 2));
                v36 = objc_msgSend(v35, "intValue");

              }
              while (v20 < v36);
            }
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape"));
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectAtIndexedSubscript:", 1));
            v40 = objc_msgSend(v39, "intValue");

          }
        }
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectAtIndexedSubscript:", 0));
        v43 = objc_msgSend(v42, "intValue");

        ++v46;
      }
      while (v46 < v43);
    }
  }

}

+ (id)normalizeData:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  unsigned int v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  char *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  unsigned int v64;
  void *v65;
  void *v66;
  unsigned int v67;
  void *v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  id v73;
  void *v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  unsigned int v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  char *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  unsigned int v97;
  void *v98;
  void *v99;
  unsigned int v100;
  NSObject *v101;
  NSObject *v102;
  void *v103;
  NSObject *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  NSObject *v109;
  uint64_t v110;
  char *v111;
  void *v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  NSObject *v120;
  NSObject *v121;
  void *v122;
  NSObject *v123;
  void *v124;
  NSObject *v125;
  id v126;
  id v127;
  _QWORD v128[3];
  _QWORD v129[3];
  uint8_t buf[4];
  const char *v131;
  __int16 v132;
  void *v133;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData getNSPEventsNormalizer](NSPCoreData, "getNSPEventsNormalizer"));
  v7 = v4;
  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "modelDescription"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "inputDescriptionsByName"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("normalizer_input")));

    v15 = nplog_obj(v12, v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v113 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject multiArrayConstraint](v11, "multiArrayConstraint"));
      v114 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "shape"));
      *(_DWORD *)buf = 138412290;
      v131 = v114;
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "normalizer model shape %@", buf, 0xCu);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject multiArrayConstraint](v11, "multiArrayConstraint"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "shape"));

    if (!v18)
    {
      v117 = nplog_obj(v19, v20, v21);
      v44 = objc_claimAutoreleasedReturnValue(v117);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v131 = "+[NSPCoreData normalizeData:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_FAULT, "%s called with null normalizerShape", buf, 0xCu);
      }
      goto LABEL_39;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape"));

    if (v18 == v22)
    {
      v127 = 0;
      v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "predictionFromNormalizer_input:error:", v3, &v127));
      v104 = v127;
      v44 = v104;
      if (v103)
      {
        v102 = objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "Identity"));
      }
      else
      {
        v108 = nplog_obj(v104, v105, v106);
        v109 = objc_claimAutoreleasedReturnValue(v108);
        if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v131 = (const char *)v44;
          _os_log_error_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_ERROR, "Failed to normalize the input. error:%@", buf, 0xCu);
        }

        v102 = 0;
      }

      goto LABEL_40;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape"));
    v24 = objc_msgSend(v23, "count");
    v25 = objc_msgSend(v18, "count");

    if (v24 == v25)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape"));
      v30 = objc_msgSend(v29, "count");

      if (v30)
      {
        v31 = 0;
        v32 = 1;
        while (1)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectAtIndexedSubscript:", v31));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", v31));

          if (v34 > v35)
            break;
          v31 = v32;
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape"));
          v40 = objc_msgSend(v39, "count");

          if ((unint64_t)v40 <= v32++)
            goto LABEL_11;
        }
        v110 = nplog_obj(v36, v37, v38);
        v44 = objc_claimAutoreleasedReturnValue(v110);
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          goto LABEL_39;
        goto LABEL_38;
      }
LABEL_11:
      v44 = objc_msgSend(objc_alloc((Class)MLMultiArray), "initWithShape:dataType:error:", v18, 65568, 0);
      if (!v44)
      {
        v118 = nplog_obj(0, v42, v43);
        v72 = objc_claimAutoreleasedReturnValue(v118);
        if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v131 = "+[NSPCoreData normalizeData:]";
          _os_log_fault_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_FAULT, "%s called with null reshapedInput", buf, 0xCu);
        }
        v102 = 0;
        goto LABEL_46;
      }
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape"));
      v46 = objc_msgSend(v45, "count");

      if ((unint64_t)v46 >= 3)
      {
        v124 = v7;
        v125 = v44;
        v123 = v11;
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectAtIndexedSubscript:", 1));
        v49 = objc_msgSend(v48, "unsignedIntValue");

        if (v49)
        {
          v50 = 0;
          do
          {
            v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 0));
            v129[0] = v51;
            v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v50));
            v129[1] = v52;
            v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 0));
            v129[2] = v53;
            v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v129, 3));
            v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v54));

            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape"));
            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectAtIndexedSubscript:", 2));
            LODWORD(v52) = objc_msgSend(v57, "unsignedIntValue");

            if ((_DWORD)v52)
            {
              v58 = 0;
              do
              {
                v59 = (char *)objc_msgSend(v55, "count") - 1;
                v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v58));
                objc_msgSend(v55, "replaceObjectAtIndex:withObject:", v59, v60);

                v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v55));
                -[NSObject setObject:forKeyedSubscript:](v125, "setObject:forKeyedSubscript:", v61, v55);

                v58 = (v58 + 1);
                v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape"));
                v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "objectAtIndexedSubscript:", 2));
                v64 = objc_msgSend(v63, "unsignedIntValue");

              }
              while (v58 < v64);
            }

            v50 = (v50 + 1);
            v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape"));
            v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectAtIndexedSubscript:", 1));
            v67 = objc_msgSend(v66, "unsignedIntValue");

          }
          while (v50 < v67);
        }
        v126 = 0;
        v7 = v124;
        v44 = v125;
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "predictionFromNormalizer_input:error:", v125, &v126));
        v69 = v126;
        v72 = v69;
        if (v68)
        {
          v121 = v69;
          v122 = v18;
          v73 = objc_alloc((Class)MLMultiArray);
          v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape"));
          v75 = objc_msgSend(v73, "initWithShape:dataType:error:", v74, 65568, 0);

          if (v75)
          {
            v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape"));
            v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "objectAtIndexedSubscript:", 1));
            v81 = objc_msgSend(v80, "unsignedIntValue");

            if (v81)
            {
              v82 = 0;
              do
              {
                v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 0));
                v128[0] = v83;
                v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v82));
                v128[1] = v84;
                v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 0));
                v128[2] = v85;
                v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v128, 3));
                v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v86));

                v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape"));
                v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "objectAtIndexedSubscript:", 2));
                LODWORD(v85) = objc_msgSend(v89, "unsignedIntValue");

                if ((_DWORD)v85)
                {
                  v90 = 0;
                  do
                  {
                    v91 = (char *)objc_msgSend(v87, "count") - 1;
                    v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v90));
                    objc_msgSend(v87, "replaceObjectAtIndex:withObject:", v91, v92);

                    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "Identity"));
                    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKeyedSubscript:", v87));
                    objc_msgSend(v75, "setObject:forKeyedSubscript:", v94, v87);

                    v90 = (v90 + 1);
                    v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape"));
                    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "objectAtIndexedSubscript:", 2));
                    v97 = objc_msgSend(v96, "unsignedIntValue");

                  }
                  while (v90 < v97);
                }

                v82 = (v82 + 1);
                v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape"));
                v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "objectAtIndexedSubscript:", 1));
                v100 = objc_msgSend(v99, "unsignedIntValue");

              }
              while (v82 < v100);
            }
            v101 = v75;
            v102 = v101;
          }
          else
          {
            v119 = nplog_obj(v76, v77, v78);
            v120 = objc_claimAutoreleasedReturnValue(v119);
            if (os_log_type_enabled(v120, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315138;
              v131 = "+[NSPCoreData normalizeData:]";
              _os_log_fault_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_FAULT, "%s called with null reshapedOutput", buf, 0xCu);
            }

            v101 = 0;
            v102 = 0;
          }
          v11 = v123;
          v7 = v124;
          v72 = v121;
          v18 = v122;
          v44 = v125;
        }
        else
        {
          v115 = nplog_obj(v69, v70, v71);
          v101 = objc_claimAutoreleasedReturnValue(v115);
          if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v131 = (const char *)v72;
            _os_log_error_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_ERROR, "Failed to normalize the input. error:%@", buf, 0xCu);
          }
          v102 = 0;
          v11 = v123;
        }

LABEL_46:
        goto LABEL_40;
      }
    }
    else
    {
      v107 = nplog_obj(v26, v27, v28);
      v44 = objc_claimAutoreleasedReturnValue(v107);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
LABEL_38:
        v111 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape"));
        *(_DWORD *)buf = 138412546;
        v131 = v111;
        v132 = 2112;
        v133 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Incompatiable shape (%@ vs %@)", buf, 0x16u);

      }
    }
LABEL_39:
    v102 = 0;
LABEL_40:

    goto LABEL_41;
  }
  v116 = nplog_obj(0, v5, v6);
  v11 = objc_claimAutoreleasedReturnValue(v116);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    v131 = "+[NSPCoreData normalizeData:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "%s called with null normalizer", buf, 0xCu);
  }
  v102 = 0;
LABEL_41:

  return v102;
}

+ (id)prepareMLData:(id)a3 startAt:(unsigned int)a4 dataShape:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  unsigned int v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  void *v44;
  double v45;
  void *v46;
  double v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  NSObject *v56;
  __int128 v58;
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  char *v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  _QWORD v71[2];
  _QWORD v72[6];
  uint8_t buf[4];
  const char *v74;

  v67 = a3;
  v7 = a5;
  v10 = objc_msgSend(objc_alloc((Class)MLMultiArray), "initWithShape:dataType:error:", v7, 65568, 0);
  if (!v10)
  {
    v55 = nplog_obj(0, v8, v9);
    v56 = objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v74 = "+[NSPCoreData prepareMLData:startAt:dataShape:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_FAULT, "%s called with null sample", buf, 0xCu);
    }

    goto LABEL_16;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 1));
  v12 = objc_msgSend(v11, "unsignedIntValue");

  if ((unint64_t)objc_msgSend(v67, "count") <= v12)
  {
LABEL_16:
    v54 = 0;
    goto LABEL_17;
  }
  v59 = v7;
  v60 = v10;
  v14 = v12 + a4 + 1;
  v62 = a4 + 1;
  if (a4 + 1 < v14)
  {
    v15 = 0;
    v61 = v14 - v62;
    *(_QWORD *)&v13 = 138412290;
    v58 = v13;
    do
    {
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectAtIndexedSubscript:", v62 + v15 - 1, v58));
      v16 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectAtIndexedSubscript:", v62 + v15));
      v19 = nplog_obj(v16, v17, v18);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v58;
        v74 = v16;
        _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Preparing input from NSPEvent :%@", buf, 0xCu);
      }

      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "date"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
      v68 = objc_msgSend(v22, "component:fromDate:", 32, v21);

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
      v24 = objc_msgSend(v23, "component:fromDate:", 64, v21);

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
      v26 = (void *)v21;
      v27 = objc_msgSend(v25, "component:fromDate:", 128, v21);

      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "date"));
      objc_msgSend(v28, "timeIntervalSinceReferenceDate");
      v30 = v29;
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "date"));
      objc_msgSend(v31, "timeIntervalSinceReferenceDate");
      v33 = v32;

      v34 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "vendor"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData getVendorIdFromDictionary:](NSPCoreData, "getVendorIdFromDictionary:", v34));
      if (v37)
      {
        v66 = v34;
        *(float *)&v38 = (float)(int)(objc_msgSend(v16, "eventType") + 1);
        v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v38));
        v72[0] = v64;
        v69 = v37;
        *(float *)&v39 = (float)(int)objc_msgSend(v16, "tokenCount");
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v39));
        v72[1] = v63;
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
        v65 = v26;
        *(float *)&v41 = (float)(uint64_t)objc_msgSend(v40, "component:fromDate:", 512, v26);
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v41));
        v72[2] = v42;
        *(float *)&v43 = (float)((uint64_t)v27 + 3600 * (_QWORD)v68 + 60 * (_QWORD)v24);
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v43));
        v72[3] = v44;
        *(float *)&v45 = v30 - v33;
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v45));
        v72[4] = v46;
        *(float *)&v47 = (float)objc_msgSend(v69, "unsignedIntValue");
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v47));
        v72[5] = v48;
        v49 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v72, 6));

        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
        v71[0] = v50;
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", v15));
        v71[1] = v51;
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v71, 2));

        v34 = v66;
        +[NSPCoreData prepareModelInputWithFeatures:keyedSubscripts:features:](NSPCoreData, "prepareModelInputWithFeatures:keyedSubscripts:features:", v60, v52, v49);

        v37 = v69;
        v26 = v65;
      }
      else
      {
        v53 = nplog_obj(0, v35, v36);
        v49 = objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v58;
          v74 = v34;
          _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Invalid vendor id for vendor %@", buf, 0xCu);
        }
      }

      ++v15;
    }
    while (v61 != v15);
  }
  v10 = v60;
  v54 = v60;
  v7 = v59;
LABEL_17:

  return v54;
}

+ (id)prepareTokenEventsFromPrediction:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  __int128 v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  NSPTokenEvent *v21;
  uint64_t v22;
  uint64_t v23;
  NSPTokenEvent *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  float v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  float v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  float v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  float v51;
  unint64_t v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  signed int v68;
  uint64_t v70;
  NSObject *v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v74;
  __int128 v75;
  NSObject *v76;
  void *v77;
  unsigned int v78;
  void *v79;
  uint8_t buf[4];
  const char *v81;
  __int16 v82;
  NSPTokenEvent *v83;
  _QWORD v84[3];
  _QWORD v85[3];
  _QWORD v86[3];
  _QWORD v87[3];

  v3 = a3;
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData childCoreDataContext](NSPCoreData, "childCoreDataContext"));
  if (!v77)
  {
    v72 = nplog_obj(0, v4, v5);
    v9 = objc_claimAutoreleasedReturnValue(v72);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v81 = "+[NSPCoreData prepareTokenEventsFromPrediction:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "%s called with null context", buf, 0xCu);
    }
    goto LABEL_4;
  }
  v6 = objc_alloc_init((Class)NSMutableArray);
  if (!v6)
  {
    v73 = nplog_obj(0, v7, v8);
    v74 = objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v81 = "+[NSPCoreData prepareTokenEventsFromPrediction:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_FAULT, "%s called with null array", buf, 0xCu);
    }

    v9 = 0;
    goto LABEL_4;
  }
  v9 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape"));
  v11 = objc_msgSend(v10, "count");

  if ((unint64_t)v11 < 3)
  {
LABEL_4:
    v12 = 0;
    goto LABEL_18;
  }
  v76 = v9;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 0));
  v15 = objc_msgSend(v14, "intValue");

  if (v15 < 1)
  {
LABEL_17:
    v9 = v76;
    v12 = v9;
  }
  else
  {
    v78 = 0;
    *(_QWORD *)&v16 = 134218242;
    v75 = v16;
    v79 = v3;
    while (1)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape", v75));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", 1));
      v19 = objc_msgSend(v18, "intValue");

      if (v19 >= 1)
        break;
LABEL_16:
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shape"));
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "objectAtIndexedSubscript:", 0));
      v68 = objc_msgSend(v67, "intValue");

      if ((int)++v78 >= v68)
        goto LABEL_17;
    }
    v20 = 0;
    while (1)
    {
      v21 = -[NSPTokenEvent initWithContext:]([NSPTokenEvent alloc], "initWithContext:", v77);
      if (!v21)
        break;
      v24 = v21;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v78));
      v87[0] = v25;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v20));
      v87[1] = v26;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
      v87[2] = v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v87, 3));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "objectForKeyedSubscript:", v28));
      objc_msgSend(v29, "floatValue");
      -[NSPTokenEvent setEventType:](v24, "setEventType:", llroundf(v30) - 1);

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v78));
      v86[0] = v31;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v20));
      v86[1] = v32;
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
      v86[2] = v33;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v86, 3));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "objectForKeyedSubscript:", v34));
      objc_msgSend(v35, "floatValue");
      -[NSPTokenEvent setTokenCount:](v24, "setTokenCount:", llroundf(v36));

      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v78));
      v85[0] = v37;
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v20));
      v85[1] = v38;
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4));
      v85[2] = v39;
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v85, 3));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "objectForKeyedSubscript:", v40));
      objc_msgSend(v41, "floatValue");
      v43 = v42;

      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "dateByAddingTimeInterval:", v43));
      -[NSPTokenEvent setDate:](v24, "setDate:", v45);

      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v78));
      v84[0] = v46;
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v20));
      v84[1] = v47;
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 5));
      v84[2] = v48;
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v84, 3));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "objectForKeyedSubscript:", v49));
      objc_msgSend(v50, "floatValue");
      v52 = llroundf(v51);

      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData getVendorNameById:](NSPCoreData, "getVendorNameById:", v52));
      if (v53)
      {
        -[NSPTokenEvent setVendor:](v24, "setVendor:", v53);
        v54 = -[NSObject addObject:](v76, "addObject:", v24);
        v57 = nplog_obj(v54, v55, v56);
        v58 = objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v81 = (const char *)v24;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "NSP event from prediction: %@", buf, 0xCu);
        }
      }
      else
      {
        v59 = -[NSPTokenEvent setVendor:](v24, "setVendor:", CFSTR("Unknown"));
        v62 = nplog_obj(v59, v60, v61);
        v58 = objc_claimAutoreleasedReturnValue(v62);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v75;
          v81 = (const char *)v52;
          v82 = 2112;
          v83 = v24;
          _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "Incorrect prediction for Vendor %lu, event:%@", buf, 0x16u);
        }
      }

      v20 = (v20 + 1);
      v3 = v79;
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "shape"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectAtIndexedSubscript:", 1));
      v65 = objc_msgSend(v64, "intValue");

      if ((int)v20 >= v65)
        goto LABEL_16;
    }
    v70 = nplog_obj(0, v22, v23);
    v71 = objc_claimAutoreleasedReturnValue(v70);
    if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v81 = "+[NSPCoreData prepareTokenEventsFromPrediction:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_FAULT, "%s called with null event", buf, 0xCu);
    }

    v12 = 0;
    v3 = v79;
    v9 = v76;
  }
LABEL_18:

  return v12;
}

+ (void)prepareModelInputWithFeatures:(id)a3 keyedSubscripts:(id)a4 features:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
  objc_msgSend(v9, "addObject:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "shape"));
  v12 = objc_msgSend(v11, "count");
  v13 = objc_msgSend(v9, "count");

  if (v12 == v13)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v22 = v8;
    v14 = v8;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v15)
    {
      v16 = v15;
      v17 = 0;
      v18 = *(_QWORD *)v24;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v14);
          v20 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (char *)v19 + v17));
          objc_msgSend(v9, "replaceObjectAtIndex:withObject:", (char *)objc_msgSend(v9, "count") - 1, v21);
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, v9);

          v19 = (char *)v19 + 1;
        }
        while (v16 != v19);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        v17 = (v17 + (_DWORD)v19);
      }
      while (v16);
    }

    v8 = v22;
  }

}

+ (id)prepareInputForPrediction:(id)a3 vendor:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  int v27;
  const char *v28;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData getVendorDictionary](NSPCoreData, "getVendorDictionary"));
  v9 = v6;
  if (v6)
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData fetchLatestEvents:vendors:](NSPCoreData, "fetchLatestEvents:vendors:", (char *)objc_msgSend(v5, "unsignedLongValue") + 1, v10));
    v14 = v11;
    if (v11)
    {
      v15 = objc_msgSend(v11, "count");
      if ((unint64_t)v15 < objc_msgSend(v5, "unsignedIntValue") + 1)
      {
        v16 = 0;
LABEL_8:

        goto LABEL_9;
      }
      v17 = objc_msgSend(objc_alloc((Class)MLMultiArray), "initWithShape:dataType:error:", v4, 65568, 0);
      if (v17)
      {
        v20 = v17;
        v21 = objc_claimAutoreleasedReturnValue(+[NSPCoreData prepareMLData:startAt:dataShape:](NSPCoreData, "prepareMLData:startAt:dataShape:", v14, 0, v4));

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData normalizeData:](NSPCoreData, "normalizeData:", v21));
LABEL_7:

        goto LABEL_8;
      }
      v26 = nplog_obj(0, v18, v19);
      v21 = objc_claimAutoreleasedReturnValue(v26);
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
LABEL_16:
        v16 = 0;
        goto LABEL_7;
      }
      v27 = 136315138;
      v28 = "+[NSPCoreData prepareInputForPrediction:vendor:]";
      v25 = "%s called with null modelInput";
    }
    else
    {
      v24 = nplog_obj(0, v12, v13);
      v21 = objc_claimAutoreleasedReturnValue(v24);
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        goto LABEL_16;
      v27 = 136315138;
      v28 = "+[NSPCoreData prepareInputForPrediction:vendor:]";
      v25 = "%s called with null events";
    }
    _os_log_fault_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, v25, (uint8_t *)&v27, 0xCu);
    goto LABEL_16;
  }
  v23 = nplog_obj(0, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    v27 = 136315138;
    v28 = "+[NSPCoreData prepareInputForPrediction:vendor:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "%s called with null dictionary", (uint8_t *)&v27, 0xCu);
  }
  v16 = 0;
LABEL_9:

  return v16;
}

+ (void)handleNSPEventsPredictions:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  _BYTE v19[128];

  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v4)
  {
    v7 = v4;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v3);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
        v11 = nplog_obj(v4, v5, v6);
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v10;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Prediction of NSP event: %@", buf, 0xCu);
        }

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
      v7 = v4;
    }
    while (v4);
  }

}

+ (void)predictNSPEvent:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  id v57;
  const char *v58;
  void *v59;
  NSObject *v60;
  id v61;
  uint8_t buf[4];
  const char *v63;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData getNSPEventsPredictor](NSPCoreData, "getNSPEventsPredictor"));
  v7 = v4;
  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "modelDescription"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "inputDescriptionsByName"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("lstm_input")));

    v15 = nplog_obj(v12, v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject multiArrayConstraint](v11, "multiArrayConstraint"));
      v50 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "shape"));
      *(_DWORD *)buf = 138412290;
      v63 = v50;
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "model shape %@", buf, 0xCu);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject multiArrayConstraint](v11, "multiArrayConstraint"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "shape"));

    if (!v18)
    {
      v52 = nplog_obj(v19, v20, v21);
      v24 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v63 = "+[NSPCoreData predictNSPEvent:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "%s called with null shape", buf, 0xCu);
      }
      goto LABEL_20;
    }
    v24 = objc_claimAutoreleasedReturnValue(+[NSPCoreData prepareInputForPrediction:vendor:](NSPCoreData, "prepareInputForPrediction:vendor:", v18, v3));
    if (!v24)
    {
      v53 = nplog_obj(0, v22, v23);
      v29 = objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v63 = "+[NSPCoreData predictNSPEvent:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "%s called with null modelInput", buf, 0xCu);
      }
      goto LABEL_19;
    }
    +[NSPCoreData printMLMultiArray:](NSPCoreData, "printMLMultiArray:", v24);
    v61 = 0;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "predictionFromLstm_input:error:", v24, &v61));
    v26 = v61;
    v29 = v26;
    if (!v25)
    {
      v46 = nplog_obj(v26, v27, v28);
      v33 = objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v63 = (const char *)v29;
        _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Failed to predict next NSP event %@", buf, 0xCu);
      }
      goto LABEL_18;
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "Identity"));
    +[NSPCoreData printMLMultiArray:](NSPCoreData, "printMLMultiArray:", v30);

    v33 = objc_claimAutoreleasedReturnValue(+[NSPCoreData getNSPEventsDenormalizer](NSPCoreData, "getNSPEventsDenormalizer"));
    if (!v33)
    {
      v54 = nplog_obj(0, v31, v32);
      v36 = objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v63 = "+[NSPCoreData predictNSPEvent:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_FAULT, "%s called with null denormalizer", buf, 0xCu);
      }
      v48 = v29;
      goto LABEL_17;
    }
    v59 = v7;
    v34 = v11;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "Identity"));
    v60 = v29;
    v36 = objc_claimAutoreleasedReturnValue(-[NSObject predictionFromDenormalizer_input:error:](v33, "predictionFromDenormalizer_input:error:", v35, &v60));
    v58 = v60;

    if (v36)
    {
      v57 = v3;
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject Identity](v36, "Identity"));
      +[NSPCoreData printMLMultiArray:](NSPCoreData, "printMLMultiArray:", v40);

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject Identity](v36, "Identity"));
      v42 = objc_claimAutoreleasedReturnValue(+[NSPCoreData prepareTokenEventsFromPrediction:](NSPCoreData, "prepareTokenEventsFromPrediction:", v41));

      if (!v42)
      {
        v55 = nplog_obj(v43, v44, v45);
        v56 = objc_claimAutoreleasedReturnValue(v55);
        v11 = v34;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v63 = "+[NSPCoreData predictNSPEvent:]";
          _os_log_fault_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_FAULT, "%s called with null predictedEvents", buf, 0xCu);
        }

        v42 = 0;
        v3 = v57;
        goto LABEL_15;
      }
      +[NSPCoreData handleNSPEventsPredictions:](NSPCoreData, "handleNSPEventsPredictions:", v42);
      v3 = v57;
    }
    else
    {
      v47 = nplog_obj(v37, v38, v39);
      v42 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v58;
        v63 = v58;
        _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Failed to denormalize the data %@", buf, 0xCu);
        v11 = v34;
        v7 = v59;
        goto LABEL_16;
      }
    }
    v11 = v34;
LABEL_15:
    v48 = v58;
    v7 = v59;
LABEL_16:

LABEL_17:
    v29 = v48;
LABEL_18:

LABEL_19:
LABEL_20:

    goto LABEL_21;
  }
  v51 = nplog_obj(0, v5, v6);
  v11 = objc_claimAutoreleasedReturnValue(v51);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    v63 = "+[NSPCoreData predictNSPEvent:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "%s called with null mlmodel", buf, 0xCu);
  }
LABEL_21:

}

+ (id)tokenTypeEnumToString:(int)a3
{
  if (a3 > 5)
    return CFSTR("Unknown");
  else
    return *(&off_1000F67D8 + a3);
}

- (NSPPersistentContainer)persistentContainer
{
  return (NSPPersistentContainer *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPersistentContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

@end
