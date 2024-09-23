@implementation RoamMO

+ (id)entityName
{
  return CFSTR("Roam");
}

+ (id)generateInstance:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[RoamMO entityName](RoamMO, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy createEntity:moc:](AnalyticsStoreProxy, "createEntity:moc:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)fetchRoamProperties:(id)a3 lookForRoamStatus:(BOOL)a4 fetchLimit:(unint64_t)a5 properties:(id)a6 moc:(id)a7
{
  _BOOL4 v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  const char *v29;
  _QWORD v30[2];
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v10 = a4;
  v37 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a6;
  v13 = a7;
  WALogCategoryDefaultHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ManagedObjects RoamMO fetchRoamProperties:lookForRoamStatus:fetchLimit:", ", buf, 2u);
  }

  +[RoamMO entityName](RoamMO, "entityName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    WALogCategoryDefaultHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v32 = "+[RoamMO fetchRoamProperties:lookForRoamStatus:fetchLimit:properties:moc:]";
      v33 = 1024;
      v34 = 38;
      v26 = "%{public}s::%d:bssid nil.. bailing";
      v27 = v25;
      v28 = 18;
LABEL_17:
      _os_log_impl(&dword_212581000, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);
    }
LABEL_18:
    v21 = 0;
    v17 = 0;
    v16 = 0;
    goto LABEL_24;
  }
  if (+[WAUtil isWildcardMacAddress:](WAUtil, "isWildcardMacAddress:", v11))
  {
    WALogCategoryDefaultHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v32 = "+[RoamMO fetchRoamProperties:lookForRoamStatus:fetchLimit:properties:moc:]";
      v33 = 1024;
      v34 = 39;
      v35 = 2112;
      v36 = v11;
      v26 = "%{public}s::%d:bssid(%@) is the wildcard address!! bailing";
      v27 = v25;
      v28 = 28;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("source.bssid == %@"), v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("date"), 0);
  if (v10)
  {
    v18 = (void *)MEMORY[0x24BDD14C0];
    v30[0] = v16;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("status == 0"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "andPredicateWithSubpredicates:", v20);
    v21 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = v16;
  }
  if (v12)
  {
    if (objc_msgSend(v12, "count"))
    {
      +[AnalyticsStoreProxy fetchPropertiesForEntityWithLimitAndSortDescriptor:properties:predicate:fetchLimit:sortDescriptor:returnDistinct:moc:](AnalyticsStoreProxy, "fetchPropertiesForEntityWithLimitAndSortDescriptor:properties:predicate:fetchLimit:sortDescriptor:returnDistinct:moc:", v15, v12, v21, a5, v17, 1, v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      WALogCategoryDefaultHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_212581000, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ManagedObjects RoamMO fetchRoamProperties:lookForRoamStatus:fetchLimit:", ", buf, 2u);
      }
      goto LABEL_12;
    }
    WALogCategoryDefaultHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v32 = "+[RoamMO fetchRoamProperties:lookForRoamStatus:fetchLimit:properties:moc:]";
      v33 = 1024;
      v34 = 51;
      v29 = "%{public}s::%d:properties array empty.. bailing";
      goto LABEL_23;
    }
  }
  else
  {
    WALogCategoryDefaultHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v32 = "+[RoamMO fetchRoamProperties:lookForRoamStatus:fetchLimit:properties:moc:]";
      v33 = 1024;
      v34 = 50;
      v29 = "%{public}s::%d:properties array nil.. bailing";
LABEL_23:
      _os_log_impl(&dword_212581000, v25, OS_LOG_TYPE_ERROR, v29, buf, 0x12u);
    }
  }
LABEL_24:

  WALogCategoryDefaultHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ManagedObjects RoamMO fetchRoamProperties:lookForRoamStatus:fetchLimit:", ", buf, 2u);
  }
  v22 = 0;
LABEL_12:

  return v22;
}

+ (unint64_t)roamsCount:(id)a3 fetchLimit:(unint64_t)a4 moc:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  unint64_t v18;
  NSObject *v19;
  id v21;
  _QWORD v22[2];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ManagedObjects RoamMO roamsCount:fetchLimit:", ", buf, 2u);
  }

  +[RoamMO entityName](RoamMO, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy fetchRequestForEntity:](AnalyticsStoreProxy, "fetchRequestForEntity:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "setFetchLimit:", a4);
    v13 = (void *)MEMORY[0x24BDD14C0];
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("source.bssid == %@"), v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v14;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("status == 0"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "andPredicateWithSubpredicates:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setPredicate:", v17);
    v21 = 0;
    v18 = objc_msgSend(v8, "countForFetchRequest:error:", v12, &v21);

  }
  else
  {
    WALogCategoryDefaultHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v24 = "+[RoamMO roamsCount:fetchLimit:moc:]";
      v25 = 1024;
      v26 = 72;
      v27 = 2112;
      v28 = v10;
      _os_log_impl(&dword_212581000, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:fetch request nil for entity:%@", buf, 0x1Cu);
    }
    v18 = 0;
  }

  WALogCategoryDefaultHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ManagedObjects RoamMO roamsCount:fetchLimit:", ", buf, 2u);
  }
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    v18 = 0;

  return v18;
}

+ (id)fetchRoamObjects:(id)a3 fetchLimit:(unint64_t)a4 moc:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  BOOL v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  NSObject *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  +[RoamMO entityName](RoamMO, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy fetchRequestForEntity:](AnalyticsStoreProxy, "fetchRequestForEntity:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    WALogCategoryDefaultHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v23 = "+[RoamMO fetchRoamObjects:fetchLimit:moc:]";
      v24 = 1024;
      v25 = 100;
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_212581000, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:fetch request nil for entity:%@", buf, 0x1Cu);
    }
    v13 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v10, "setFetchLimit:", a4);
  v20 = 0;
  v12 = objc_msgSend(v8, "countForFetchRequest:error:", v11, &v20);
  v13 = v20;
  if (v12)
    v14 = v12 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v14 = 1;
  if (!v14)
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("date"), 0);
    v21 = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSortDescriptors:", v16);

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("source.bssid == %@"), v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[AnalyticsStoreProxy fetch:withPredicate:moc:](AnalyticsStoreProxy, "fetch:withPredicate:moc:", v11, v17, v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18 && objc_msgSend(v18, "count"))
      goto LABEL_12;

LABEL_11:
    v18 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v18 = 0;
LABEL_13:

  return v18;
}

+ (id)fetchRoamCache:(id)a3 fetchLimit:(unint64_t)a4 moc:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  +[RoamMO entityName](RoamMO, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy fetchRequestForEntity:](AnalyticsStoreProxy, "fetchRequestForEntity:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v20 = "+[RoamMO fetchRoamCache:fetchLimit:moc:]";
      v21 = 1024;
      v22 = 130;
      v23 = 2112;
      v24 = (uint64_t)v9;
      _os_log_impl(&dword_212581000, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:fetch request nil for entity:%@", buf, 0x1Cu);
    }
    v13 = 0;
    v15 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v10, "setFetchLimit:", a4);
  v18 = 0;
  v12 = objc_msgSend(v8, "countForFetchRequest:error:", v11, &v18);
  v13 = v18;
  WALogCategoryDefaultHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    v20 = "+[RoamMO fetchRoamCache:fetchLimit:moc:]";
    v21 = 1024;
    v22 = 135;
    v23 = 2048;
    v24 = v12;
    _os_log_impl(&dword_212581000, v14, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Count %lu", buf, 0x1Cu);
  }

  v15 = 0;
  if (v12 && v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("source.bssid.neighborCache == %@"), v7);
    v16 = objc_claimAutoreleasedReturnValue();
    +[AnalyticsStoreProxy fetch:withPredicate:moc:](AnalyticsStoreProxy, "fetch:withPredicate:moc:", v11, v16, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  }
  return v15;
}

+ (unint64_t)dwellTimeInBand:(id)a3 bandIs24:(BOOL)a4 bssid:(id)a5 maxAgeInDays:(unint64_t)a6 moc:(id)a7
{
  _BOOL4 v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _BOOL4 v49;
  void *v50;
  void *context;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  _QWORD v57[2];
  _QWORD v58[3];
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  int v62;
  uint64_t v63;

  v10 = a4;
  v63 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v54 = a7;
  if (!v11)
  {
    WALogCategoryDefaultHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v60 = "+[RoamMO dwellTimeInBand:bandIs24:bssid:maxAgeInDays:moc:]";
      v61 = 1024;
      v62 = 152;
      _os_log_impl(&dword_212581000, v44, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssid nil", buf, 0x12u);
    }

    goto LABEL_14;
  }
  v49 = v10;
  context = (void *)MEMORY[0x212BEF45C]();
  +[RoamMO entityName](RoamMO, "entityName");
  v13 = objc_claimAutoreleasedReturnValue();
  v52 = v12;
  v53 = v11;
  if (v12)
  {
    v14 = (void *)MEMORY[0x24BDD14C0];
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("source.network.ssid == %@"), v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v15;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("source.bssid == %@"), v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v58[1] = v16;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("status == 0"));
    v17 = v13;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v58[2] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "andPredicateWithSubpredicates:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("source.network.ssid == %@"), v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v48 = v20;
  if (a6)
  {
    v21 = (void *)MEMORY[0x24BDD14C0];
    v57[0] = v20;
    +[AnalyticsStoreProxy predicateForEntityWithAge:maxAge:](AnalyticsStoreProxy, "predicateForEntityWithAge:maxAge:", v13, a6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "copy");
    v57[1] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "andPredicateWithSubpredicates:", v24);
    v25 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = v20;
  }
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("source.channel <= %d"), 14);
  v26 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("source.channel > %d"), 14);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)MEMORY[0x24BDD14C0];
  v46 = (void *)v26;
  v47 = v25;
  v45 = (void *)v27;
  if (v49)
  {
    v56 = v25;
    v29 = &v56;
  }
  else
  {
    v55 = v25;
    v29 = &v55;
    v26 = v27;
  }
  v29[1] = (id)v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "andPredicateWithSubpredicates:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = (void *)v13;
  +[AnalyticsStoreProxy fetchRequestForEntity:](AnalyticsStoreProxy, "fetchRequestForEntity:", v13);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setResultType:", 2);
  objc_msgSend(v32, "setReturnsDistinctResults:", 1);
  objc_msgSend(MEMORY[0x24BDD1548], "expressionForKeyPath:", CFSTR("sourceTimeSpentSecs"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)MEMORY[0x24BDD1548];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "expressionForFunction:arguments:", CFSTR("sum:"), v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = objc_alloc_init(MEMORY[0x24BDBB660]);
  objc_msgSend(v37, "setName:", CFSTR("dwellTimeInBand"));
  objc_msgSend(v37, "setExpression:", v36);
  objc_msgSend(v37, "setExpressionResultType:", 300);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setPropertiesToFetch:", v38);

  +[AnalyticsStoreProxy fetch:withPredicate:moc:](AnalyticsStoreProxy, "fetch:withPredicate:moc:", v32, v31, v54);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v39)
  {
    objc_msgSend(v39, "lastObject");
    v41 = objc_claimAutoreleasedReturnValue();
    -[NSObject valueForKey:](v41, "valueForKey:", CFSTR("dwellTimeInBand"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v42, "unsignedIntegerValue");

  }
  else
  {
    WALogCategoryDefaultHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v60 = "+[RoamMO dwellTimeInBand:bandIs24:bssid:maxAgeInDays:moc:]";
      v61 = 1024;
      v62 = 207;
      _os_log_impl(&dword_212581000, v41, OS_LOG_TYPE_ERROR, "%{public}s::%d:resultsArray nil", buf, 0x12u);
    }
  }

  objc_autoreleasePoolPop(context);
  v12 = v52;
  v11 = v53;
  if (!v40)
LABEL_14:
    v35 = 0;

  return (unint64_t)v35;
}

+ (unint64_t)roamsCountBetweenBssids:(id)a3 target:(id)a4 moc:(id)a5
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
  uint64_t v18;
  unint64_t v19;
  uint64_t v21;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[RoamMO entityName](RoamMO, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy fetchRequestForEntity:](AnalyticsStoreProxy, "fetchRequestForEntity:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("source.bssid == %@"), v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v13;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("target.bssid == %@"), v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v22[1] = v14;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("status == 0"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "andPredicateWithSubpredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setPredicate:", v17);
  v21 = 0;
  v18 = objc_msgSend(v7, "countForFetchRequest:error:", v11, &v21);

  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    v19 = 0;
  else
    v19 = v18;

  return v19;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("Roam"));
}

@end
