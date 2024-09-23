@implementation SessionMO

+ (id)entityName
{
  return CFSTR("Session");
}

+ (BOOL)firstSessionCreated:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[SessionMO entityName](SessionMO, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[AnalyticsStoreProxy entityCount:withPredicate:moc:](AnalyticsStoreProxy, "entityCount:withPredicate:moc:", v4, 0, v3);

  if (!v5)
  {
    WALogCategoryDefaultHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446466;
      v9 = "+[SessionMO firstSessionCreated:]";
      v10 = 1024;
      v11 = 35;
      _os_log_impl(&dword_212581000, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:First session not yet created", (uint8_t *)&v8, 0x12u);
    }

  }
  return v5 != 0;
}

+ (BOOL)addSession:(id)a3 leave:(id)a4 roams:(id)a5 moc:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  NSObject *v21;
  const char *v22;
  int v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x212BEF45C]();
  +[SessionMO entityName](SessionMO, "entityName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy createEntity:moc:](AnalyticsStoreProxy, "createEntity:moc:", v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    WALogCategoryDefaultHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v23 = 136446466;
    v24 = "+[SessionMO addSession:leave:roams:moc:]";
    v25 = 1024;
    v26 = 47;
    v22 = "%{public}s::%d:sessionMo nil";
LABEL_14:
    _os_log_impl(&dword_212581000, v21, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v23, 0x12u);
    goto LABEL_15;
  }
  if (!v9)
  {
    WALogCategoryDefaultHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v23 = 136446466;
    v24 = "+[SessionMO addSession:leave:roams:moc:]";
    v25 = 1024;
    v26 = 48;
    v22 = "%{public}s::%d:join nil";
    goto LABEL_14;
  }
  if (!v10)
  {
    WALogCategoryDefaultHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v23 = 136446466;
      v24 = "+[SessionMO addSession:leave:roams:moc:]";
      v25 = 1024;
      v26 = 49;
      v22 = "%{public}s::%d:leave nil";
      goto LABEL_14;
    }
LABEL_15:

    v19 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v9, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDate:", v16);

  objc_msgSend(v10, "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEnd:", v17);

  objc_msgSend(v15, "setJoin:", v9);
  objc_msgSend(v15, "setLeave:", v10);
  objc_msgSend(v15, "setInChargingDayTime:", 0);
  objc_msgSend(v15, "setInChargingNightTime:", 0);
  objc_msgSend(v15, "setInStationaryDayTime:", 0);
  objc_msgSend(v15, "setInChargingNightTime:", 0);
  objc_msgSend(v15, "setUsageDayTime:", 0);
  objc_msgSend(v15, "setUsageNightTime:", 0);
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addRoamsSet:", v18);

  }
  v19 = 1;
LABEL_7:

  objc_autoreleasePoolPop(v13);
  return v19;
}

+ (BOOL)addSessionsForFirstUse:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSObject *v14;
  uint64_t v16;
  void *v17;
  void *v18;
  void *context;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  _BYTE v28[128];
  _QWORD v29[3];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  context = (void *)MEMORY[0x212BEF45C]();
  v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("date"), 1);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("success == 1"));
  v5 = objc_claimAutoreleasedReturnValue();
  +[JoinMO fetchRequest](JoinMO, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFetchBatchSize:", 50);
  objc_msgSend(v6, "setRelationshipKeyPathsForPrefetching:", &unk_24CE01DB8);
  v18 = (void *)v4;
  v29[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSortDescriptors:", v7);

  v17 = (void *)v5;
  +[AnalyticsStoreProxy fetch:withPredicate:moc:](AnalyticsStoreProxy, "fetch:withPredicate:moc:", v6, v5, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v8, "count");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        if (!+[SessionMO buildAndAddSessionWithJoin:moc:](SessionMO, "buildAndAddSessionWithJoin:moc:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), v3))
        {
          WALogCategoryDefaultHandle();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            v25 = "+[SessionMO addSessionsForFirstUse:]";
            v26 = 1024;
            v27 = 95;
            _os_log_impl(&dword_212581000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to add session", buf, 0x12u);
          }

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v11);
  }

  objc_autoreleasePoolPop(context);
  return v16 != 0;
}

+ (BOOL)addMostRecentSession:(id)a3 moc:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  const char *v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x212BEF45C]();
  if (+[SessionMO firstSessionCreated:](SessionMO, "firstSessionCreated:", v6))
  {
    +[JoinMO mostRecentJoin:ssid:moc:](JoinMO, "mostRecentJoin:ssid:moc:", 0, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (+[SessionMO buildAndAddSessionWithJoin:moc:](SessionMO, "buildAndAddSessionWithJoin:moc:", v8, v6))
      {
        v9 = 1;
LABEL_10:

        goto LABEL_11;
      }
      WALogCategoryDefaultHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
LABEL_9:

        v9 = 0;
        goto LABEL_10;
      }
      v13 = 136446466;
      v14 = "+[SessionMO addMostRecentSession:moc:]";
      v15 = 1024;
      v16 = 122;
      v11 = "%{public}s::%d:Failed to add session";
    }
    else
    {
      WALogCategoryDefaultHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      v13 = 136446466;
      v14 = "+[SessionMO addMostRecentSession:moc:]";
      v15 = 1024;
      v16 = 119;
      v11 = "%{public}s::%d:join nil";
    }
    _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v13, 0x12u);
    goto LABEL_9;
  }
  +[SessionMO addSessionsForFirstUse:](SessionMO, "addSessionsForFirstUse:", v6);
  v9 = 1;
LABEL_11:
  objc_autoreleasePoolPop(v7);

  return v9;
}

+ (id)getSessions:(id)a3 sortedAscending:(BOOL)a4 moc:(id)a5
{
  _BOOL8 v5;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v5 = a4;
  v16[1] = *MEMORY[0x24BDAC8D0];
  v7 = (objc_class *)MEMORY[0x24BDD17C0];
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend([v7 alloc], "initWithKey:ascending:", CFSTR("date"), v5);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("join.bss.network.ssid == %@"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[SessionMO fetchRequest](SessionMO, "fetchRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFetchBatchSize:", 50);
  objc_msgSend(v12, "setRelationshipKeyPathsForPrefetching:", &unk_24CE01DD0);
  v16[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSortDescriptors:", v13);

  +[AnalyticsStoreProxy fetch:withPredicate:moc:](AnalyticsStoreProxy, "fetch:withPredicate:moc:", v12, v11, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)getSessionsWithMostRecentDays:(id)a3 days:(unint64_t)a4 sortedAscending:(BOOL)a5 moc:(id)a6
{
  _BOOL8 v6;
  objc_class *v9;
  id v10;
  id v11;
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
  void *v23;
  _QWORD v24[3];

  v6 = a5;
  v24[2] = *MEMORY[0x24BDAC8D0];
  v9 = (objc_class *)MEMORY[0x24BDD17C0];
  v10 = a6;
  v11 = a3;
  v12 = (void *)objc_msgSend([v9 alloc], "initWithKey:ascending:", CFSTR("date"), v6);
  v13 = (void *)MEMORY[0x24BDD14C0];
  +[SessionMO entityName](SessionMO, "entityName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy predicateForEntityWithAge:maxAge:](AnalyticsStoreProxy, "predicateForEntityWithAge:maxAge:", v14, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v15;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("join.bss.network.ssid == %@"), v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v24[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "andPredicateWithSubpredicates:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[SessionMO fetchRequest](SessionMO, "fetchRequest");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFetchBatchSize:", 50);
  objc_msgSend(v19, "setRelationshipKeyPathsForPrefetching:", &unk_24CE01DE8);
  v23 = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSortDescriptors:", v20);

  +[AnalyticsStoreProxy fetch:withPredicate:moc:](AnalyticsStoreProxy, "fetch:withPredicate:moc:", v19, v18, v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)getMostRecentSession:(id)a3 moc:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  +[SessionMO fetchRequest](SessionMO, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("date"), 0);
  v18[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v9);

  if (v5)
  {
    v10 = (void *)MEMORY[0x24BDD14C0];
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("join.bss.network.ssid == %@"), v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("join.success == 1"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "andPredicateWithSubpredicates:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  +[AnalyticsStoreProxy fetchFirst:withPredicate:moc:](AnalyticsStoreProxy, "fetchFirst:withPredicate:moc:", v7, v14, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (BOOL)buildAndAddSessionWithJoin:(id)a3 moc:(id)a4
{
  id v5;
  id v6;
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  double v32;
  double v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSObject *v45;
  const char *v46;
  void *v47;
  const char *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  NSObject *v65;
  __int16 v66;
  uint64_t v67;
  _QWORD v68[2];

  v68[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    WALogCategoryDefaultHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    *(_DWORD *)buf = 136446466;
    v59 = "+[SessionMO buildAndAddSessionWithJoin:moc:]";
    v60 = 1024;
    v61 = 191;
    v46 = "%{public}s::%d:join nil";
LABEL_36:
    _os_log_impl(&dword_212581000, v45, OS_LOG_TYPE_ERROR, v46, buf, 0x12u);
    goto LABEL_37;
  }
  objc_msgSend(v5, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    WALogCategoryDefaultHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    *(_DWORD *)buf = 136446466;
    v59 = "+[SessionMO buildAndAddSessionWithJoin:moc:]";
    v60 = 1024;
    v61 = 192;
    v46 = "%{public}s::%d:join.date nil";
    goto LABEL_36;
  }
  objc_msgSend(v5, "bss");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    WALogCategoryDefaultHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    *(_DWORD *)buf = 136446466;
    v59 = "+[SessionMO buildAndAddSessionWithJoin:moc:]";
    v60 = 1024;
    v61 = 193;
    v46 = "%{public}s::%d:join.bss nil";
    goto LABEL_36;
  }
  objc_msgSend(v5, "bss");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "network");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    WALogCategoryDefaultHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    *(_DWORD *)buf = 136446466;
    v59 = "+[SessionMO buildAndAddSessionWithJoin:moc:]";
    v60 = 1024;
    v61 = 194;
    v46 = "%{public}s::%d:join.bss.network nil";
    goto LABEL_36;
  }
  objc_msgSend(v5, "bss");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "network");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ssid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    WALogCategoryDefaultHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v59 = "+[SessionMO buildAndAddSessionWithJoin:moc:]";
      v60 = 1024;
      v61 = 195;
      v46 = "%{public}s::%d:join.bss.network.ssid nil";
      goto LABEL_36;
    }
LABEL_37:

    v31 = 0;
    goto LABEL_25;
  }
  v14 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(v5, "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[RoamMO fetchRequest](RoamMO, "fetchRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("date"), 1);
  objc_msgSend(v16, "setFetchBatchSize:", 50);
  v56 = (void *)v17;
  v68[0] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v68, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSortDescriptors:", v18);

  objc_msgSend(v5, "bss");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "network");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ssid");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[LeaveMO firstLeaveAfter:ssid:moc:](LeaveMO, "firstLeaveAfter:ssid:moc:", v15, v21, v6);
  v22 = objc_claimAutoreleasedReturnValue();

  v57 = v16;
  if (!v22)
  {
    WALogCategoryDefaultHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "date");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446722;
      v59 = "+[SessionMO buildAndAddSessionWithJoin:moc:]";
      v60 = 1024;
      v61 = 208;
      v62 = 2112;
      v63 = (uint64_t)v47;
      v48 = "%{public}s::%d:Leave nil for join @ %@";
LABEL_42:
      _os_log_impl(&dword_212581000, v24, OS_LOG_TYPE_ERROR, v48, buf, 0x1Cu);

    }
LABEL_46:
    v31 = 0;
    v42 = v56;
    goto LABEL_24;
  }
  -[NSObject date](v22, "date");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    WALogCategoryDefaultHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "date");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446722;
      v59 = "+[SessionMO buildAndAddSessionWithJoin:moc:]";
      v60 = 1024;
      v61 = 209;
      v62 = 2112;
      v63 = (uint64_t)v47;
      v48 = "%{public}s::%d:Leave date nil for join @ %@";
      goto LABEL_42;
    }
    goto LABEL_46;
  }
  -[NSObject date](v22, "date");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v15, "compare:", v24);
  WALogCategoryDefaultHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v25 == 1)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "bss");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "network");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "ssid");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136447234;
      v59 = "+[SessionMO buildAndAddSessionWithJoin:moc:]";
      v60 = 1024;
      v61 = 213;
      v62 = 2112;
      v63 = (uint64_t)v15;
      v64 = 2112;
      v65 = v24;
      v66 = 2112;
      v67 = (uint64_t)v51;
      _os_log_impl(&dword_212581000, v27, OS_LOG_TYPE_ERROR, "%{public}s::%d:Join (%@) is after Leave (%@) for %@. Skipping session", buf, 0x30u);

    }
    goto LABEL_46;
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446978;
    v59 = "+[SessionMO buildAndAddSessionWithJoin:moc:]";
    v60 = 1024;
    v61 = 215;
    v62 = 2112;
    v63 = (uint64_t)v15;
    v64 = 2112;
    v65 = v24;
    _os_log_impl(&dword_212581000, v27, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Fetching roams between %@ and %@", buf, 0x26u);
  }

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(date >= %@) AND (date <= %@)"), v15, v24);
  v28 = v15;
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy fetch:withPredicate:moc:](AnalyticsStoreProxy, "fetch:withPredicate:moc:", v16, v29, v6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = +[SessionMO addSession:leave:roams:moc:](SessionMO, "addSession:leave:roams:moc:", v5, v22, v30, v6);
  v55 = v28;
  if (v31)
  {
    v52 = v24;
    v53 = v14;
    -[NSObject timeIntervalSinceDate:](v24, "timeIntervalSinceDate:", v28);
    v33 = v32;
    objc_msgSend(v5, "bss");
    v34 = v6;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "network");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "ssid");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v34;
    +[NetworkMO getInstance:moc:](NetworkMO, "getInstance:moc:", v37, v34);
    v38 = objc_claimAutoreleasedReturnValue();

    if (!v38)
    {
      v14 = v53;
      v6 = v54;
      v42 = v56;
      v24 = v52;
      goto LABEL_23;
    }
    WALogCategoryDefaultHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      -[NSObject ssid](v38, "ssid");
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = -[NSObject usageTime](v38, "usageTime");
      *(_DWORD *)buf = 136447234;
      v59 = "+[SessionMO buildAndAddSessionWithJoin:moc:]";
      v60 = 1024;
      v61 = 228;
      v62 = 2048;
      v63 = (uint64_t)v33;
      v64 = 2112;
      v65 = v40;
      v66 = 2048;
      v67 = v41;
      _os_log_impl(&dword_212581000, v39, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Adding %llu secs to network %@ with usageTime:%llu", buf, 0x30u);

    }
    v24 = v52;
    v14 = v53;

    -[NSObject setUsageTime:](v38, "setUsageTime:", -[NSObject usageTime](v38, "usageTime") + (uint64_t)v33);
    v6 = v54;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v42 = v56;
      if (v30)
        v43 = objc_msgSend(v30, "count");
      else
        v43 = 0;
      *(_DWORD *)buf = 136447234;
      v59 = "+[SessionMO buildAndAddSessionWithJoin:moc:]";
      v60 = 1024;
      v61 = 223;
      v62 = 2112;
      v63 = (uint64_t)v5;
      v64 = 2112;
      v65 = v22;
      v66 = 2048;
      v67 = v43;
      _os_log_impl(&dword_212581000, v38, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to add session between %@ and %@ with roamsCount:%lu", buf, 0x30u);
      goto LABEL_23;
    }
  }
  v42 = v56;
LABEL_23:

  v15 = v55;
LABEL_24:

  objc_autoreleasePoolPop(v14);
LABEL_25:

  return v31;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("Session"));
}

@end
