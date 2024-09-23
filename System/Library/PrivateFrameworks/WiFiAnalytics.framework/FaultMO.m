@implementation FaultMO

+ (id)entityName
{
  return CFSTR("Fault");
}

+ (id)generateInstance:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[FaultMO entityName](FaultMO, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy createEntity:moc:](AnalyticsStoreProxy, "createEntity:moc:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)mostRecentFault:(id)a3 moc:(id)a4
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
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  +[FaultMO fetchRequest](FaultMO, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("date"), 0);
  v17[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v9);

  if (v5)
  {
    v10 = (void *)MEMORY[0x24BDD14C0];
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("bss.fault.type == %@"), v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "andPredicateWithSubpredicates:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  +[AnalyticsStoreProxy fetchFirst:withPredicate:moc:](AnalyticsStoreProxy, "fetchFirst:withPredicate:moc:", v7, v13, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)mostRecentFaultsWithBatchSize:(unint64_t)a3 moc:(id)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)MEMORY[0x24BDD17C0];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithKey:ascending:", CFSTR("date"), 0);
  +[FaultMO fetchRequest](FaultMO, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFetchBatchSize:", a3);
  v19[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDescriptors:", v9);

  +[AnalyticsStoreProxy fetch:withPredicate:moc:](AnalyticsStoreProxy, "fetch:withPredicate:moc:", v8, 0, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v13 = 136446722;
      v14 = "+[FaultMO mostRecentFaultsWithBatchSize:moc:]";
      v15 = 1024;
      v16 = 55;
      v17 = 2048;
      v18 = objc_msgSend(v10, "count");
      _os_log_impl(&dword_212581000, v11, OS_LOG_TYPE_DEBUG, "%{public}s::%d:ResultCount:%lu", (uint8_t *)&v13, 0x1Cu);
    }

  }
  return v10;
}

+ (unint64_t)faultCount:(id)a3 maxAgeInDays:(unint64_t)a4 moc:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  +[FaultMO entityName](FaultMO, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v10 = (void *)MEMORY[0x24BDD14C0];
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("bss.fault.type == %@"), v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v11;
    +[AnalyticsStoreProxy predicateForEntityWithAge:maxAge:](AnalyticsStoreProxy, "predicateForEntityWithAge:maxAge:", v9, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    v18[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "andPredicateWithSubpredicates:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AnalyticsStoreProxy predicateForEntityWithAge:maxAge:](AnalyticsStoreProxy, "predicateForEntityWithAge:maxAge:", v9, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = +[AnalyticsStoreProxy entityCount:withPredicate:moc:](AnalyticsStoreProxy, "entityCount:withPredicate:moc:", v9, v15, v8);

  return v16;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("Fault"));
}

@end
