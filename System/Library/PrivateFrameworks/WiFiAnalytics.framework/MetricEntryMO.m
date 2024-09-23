@implementation MetricEntryMO

+ (id)entityName
{
  return CFSTR("MetricEntry");
}

+ (id)generateInstance:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[MetricEntryMO entityName](MetricEntryMO, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy createEntity:moc:](AnalyticsStoreProxy, "createEntity:moc:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (unint64_t)metricEntryCount:(unint64_t)a3 moc:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  +[MetricEntryMO entityName](MetricEntryMO, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy fetchRequestForEntity:](AnalyticsStoreProxy, "fetchRequestForEntity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setFetchLimit:", a3);
    v12 = 0;
    v9 = objc_msgSend(v5, "countForFetchRequest:error:", v8, &v12);
    v10 = v12;
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      v9 = 0;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v14 = "+[MetricEntryMO metricEntryCount:moc:]";
      v15 = 1024;
      v16 = 36;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:fetch request nil for entity:%@", buf, 0x1Cu);
    }
    v9 = 0;
  }

  return v9;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MetricEntry"));
}

@end
