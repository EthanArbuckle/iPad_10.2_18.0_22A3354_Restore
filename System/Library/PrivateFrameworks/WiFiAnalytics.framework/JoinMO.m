@implementation JoinMO

+ (id)entityName
{
  return CFSTR("Join");
}

+ (id)generateInstance:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[JoinMO entityName](JoinMO, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy createEntity:moc:](AnalyticsStoreProxy, "createEntity:moc:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)mostRecentJoin:(id)a3 ssid:(id)a4 moc:(id)a5
{
  id v7;
  id v8;
  id v9;
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
  void *v21;
  _QWORD v22[2];
  _QWORD v23[3];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[JoinMO fetchRequest](JoinMO, "fetchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("date"), 0);
  v24[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSortDescriptors:", v12);

  v13 = (void *)MEMORY[0x24BDD14C0];
  if (v7 && v8)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("bss.network.ssid == %@"), v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v14;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("bss.bssid == %@"), v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v15;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("success == 1"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "andPredicateWithSubpredicates:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("success == 1"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "andPredicateWithSubpredicates:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("bss.network.ssid == %@"), v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v14;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("success == 1"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "andPredicateWithSubpredicates:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  +[AnalyticsStoreProxy fetchFirst:withPredicate:moc:](AnalyticsStoreProxy, "fetchFirst:withPredicate:moc:", v10, v18, v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)earliestJoinDate:(id)a3 moc:(id)a4
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
  NSObject *v16;
  void *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = (void *)MEMORY[0x212BEF45C]();
    +[JoinMO fetchRequest](JoinMO, "fetchRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("date"), 1);
    v17 = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSortDescriptors:", v10);

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("bss.network.ssid == %@"), v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[AnalyticsStoreProxy fetchFirst:withPredicate:moc:](AnalyticsStoreProxy, "fetchFirst:withPredicate:moc:", v8, v11, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "copy");

    }
    else
    {
      v14 = 0;
    }

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v19 = "+[JoinMO earliestJoinDate:moc:]";
      v20 = 1024;
      v21 = 57;
      _os_log_impl(&dword_212581000, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssid nil", buf, 0x12u);
    }

    v14 = 0;
  }

  return v14;
}

+ (id)ssidsWithRouterMAC:(id)a3 moc:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("routerMAC == %@"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[JoinMO entityName](JoinMO, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy fetchRequestForEntityWithBatchSize:batchSize:prefetch:](AnalyticsStoreProxy, "fetchRequestForEntityWithBatchSize:batchSize:prefetch:", v8, 100, &unk_24CE01D88);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy fetch:withPredicate:moc:](AnalyticsStoreProxy, "fetch:withPredicate:moc:", v9, v6, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v20 = v5;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v15), "bss");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "network");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "ssid");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
            objc_msgSend(v7, "addObject:", v18);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v13);
    }

    v5 = v20;
  }

  return v7;
}

+ (id)mostRecentJoinsWithBatchSize:(unint64_t)a3 bssid:(id)a4 ssid:(id)a5 moc:(id)a6
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
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
  NSObject *v23;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[4];

  v32[3] = *MEMORY[0x24BDAC8D0];
  v9 = (objc_class *)MEMORY[0x24BDD17C0];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_msgSend([v9 alloc], "initWithKey:ascending:", CFSTR("date"), 0);
  v14 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("bss.network.ssid == %@"), v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v32[0] = v15;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("bss.bssid == %@"), v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v32[1] = v16;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("success == 0"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "andPredicateWithSubpredicates:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  +[JoinMO fetchRequest](JoinMO, "fetchRequest");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFetchBatchSize:", a3);
  objc_msgSend(v20, "setRelationshipKeyPathsForPrefetching:", &unk_24CE01DA0);
  v31 = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v31, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setSortDescriptors:", v21);

  +[AnalyticsStoreProxy fetch:withPredicate:moc:](AnalyticsStoreProxy, "fetch:withPredicate:moc:", v20, v19, v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    WALogCategoryDefaultHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446722;
      v26 = "+[JoinMO mostRecentJoinsWithBatchSize:bssid:ssid:moc:]";
      v27 = 1024;
      v28 = 118;
      v29 = 2048;
      v30 = objc_msgSend(v22, "count");
      _os_log_impl(&dword_212581000, v23, OS_LOG_TYPE_DEBUG, "%{public}s::%d:ResultCount:%lu", buf, 0x1Cu);
    }

  }
  return v22;
}

+ (unint64_t)joinCount:(id)a3 bssid:(id)a4 maxAgeInDays:(unint64_t)a5 success:(BOOL)a6 moc:(id)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  id v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[4];

  v8 = a6;
  v33[3] = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v29 = a7;
  v12 = a3;
  +[JoinMO entityName](JoinMO, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("bss.network.ssid == %@"), v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v33[0] = v15;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("bss.bssid == %@"), v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v16;
    +[AnalyticsStoreProxy predicateForEntityWithAge:maxAge:](AnalyticsStoreProxy, "predicateForEntityWithAge:maxAge:", v13, a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    v33[2] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 3);
    v19 = v8;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "andPredicateWithSubpredicates:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v19;
  }
  else
  {
    v32[0] = v15;
    +[AnalyticsStoreProxy predicateForEntityWithAge:maxAge:](AnalyticsStoreProxy, "predicateForEntityWithAge:maxAge:", v13, a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    v32[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "andPredicateWithSubpredicates:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v22 = (void *)MEMORY[0x24BDD14C0];
  if (v8)
  {
    v31[0] = v21;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("success == 1"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v23;
    v24 = v31;
  }
  else
  {
    v30[0] = v21;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("success != 1"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v23;
    v24 = v30;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "andPredicateWithSubpredicates:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = +[AnalyticsStoreProxy entityCount:withPredicate:moc:](AnalyticsStoreProxy, "entityCount:withPredicate:moc:", v13, v26, v29);
  return v27;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("Join"));
}

@end
