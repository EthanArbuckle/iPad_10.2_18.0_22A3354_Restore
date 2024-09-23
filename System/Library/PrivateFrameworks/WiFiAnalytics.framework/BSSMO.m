@implementation BSSMO

+ (id)entityName
{
  return CFSTR("BSS");
}

+ (id)generateInstance:(id)a3 ssid:(id)a4 created:(BOOL *)a5 moc:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (+[WAUtil isWildcardMacAddress:](WAUtil, "isWildcardMacAddress:", v9))
  {
    WALogCategoryDefaultHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v23 = "+[BSSMO generateInstance:ssid:created:moc:]";
      v24 = 1024;
      v25 = 26;
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_212581000, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssid(%@) is the wildcard address!! bailing", buf, 0x1Cu);
    }

    v13 = 0;
    *a5 = 0;
  }
  else
  {
    v14 = (void *)MEMORY[0x24BDD14C0];
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("network.ssid == %@"), v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v15;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("bssid == %@"), v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "andPredicateWithSubpredicates:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    +[BSSMO entityName](BSSMO, "entityName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[AnalyticsStoreProxy entityByCounting:withPredicate:created:moc:](AnalyticsStoreProxy, "entityByCounting:withPredicate:created:moc:", v19, v18, a5, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5 && *a5)
      objc_msgSend(v13, "setBssid:", v9);

  }
  return v13;
}

+ (id)getInstance:(id)a3 ssid:(id)a4 moc:(id)a5
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
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[BSSMO fetchRequest](BSSMO, "fetchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("network.ssid == %@"), v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("bssid == %@"), v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v19[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[AnalyticsStoreProxy fetch:withPredicate:moc:](AnalyticsStoreProxy, "fetch:withPredicate:moc:", v10, v15, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 && objc_msgSend(v16, "count"))
  {
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)allBssidsForSsid:(id)a3 moc:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;

  v5 = (void *)MEMORY[0x24BDBCEB8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("network.ssid == %@"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[BSSMO fetchRequest](BSSMO, "fetchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy fetch:withPredicate:moc:](AnalyticsStoreProxy, "fetch:withPredicate:moc:", v10, v9, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __30__BSSMO_allBssidsForSsid_moc___block_invoke;
    v15[3] = &unk_24CDDE898;
    v12 = v8;
    v16 = v12;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v15);
    v13 = v12;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __30__BSSMO_allBssidsForSsid_moc___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    objc_msgSend(v6, "bssid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = *(void **)(a1 + 32);
      objc_msgSend(v6, "bssid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v5);

    }
  }

}

+ (id)allSsidsForBssid:(id)a3 moc:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;

  v5 = (void *)MEMORY[0x24BDBCEB8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("bssid == %@"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[BSSMO fetchRequest](BSSMO, "fetchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy fetch:withPredicate:moc:](AnalyticsStoreProxy, "fetch:withPredicate:moc:", v10, v9, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __30__BSSMO_allSsidsForBssid_moc___block_invoke;
    v15[3] = &unk_24CDDE898;
    v12 = v8;
    v16 = v12;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v15);
    v13 = v12;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __30__BSSMO_allSsidsForBssid_moc___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (v10)
  {
    objc_msgSend(v10, "network");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      objc_msgSend(v10, "network");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ssid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = *(void **)(a1 + 32);
        objc_msgSend(v10, "network");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "ssid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v9);

      }
    }
  }

}

+ (id)bssManagedObjectPropertyValue:(id)a3 forKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = v5;
  if (a3 && v5)
  {
    objc_msgSend(a3, "unparsedBeacon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "valueForKey:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446722;
      v13 = "+[BSSMO bssManagedObjectPropertyValue:forKey:]";
      v14 = 1024;
      v15 = 103;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:Nil bssMO or key %@", (uint8_t *)&v12, 0x1Cu);
    }

    v9 = 0;
  }

  return v9;
}

+ (BOOL)setBssManagedObjectPropertyValueForKey:(id)a3 forKey:(id)a4 withValue:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  const char *v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
  {
    WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136446466;
      v16 = "+[BSSMO setBssManagedObjectPropertyValueForKey:forKey:withValue:]";
      v17 = 1024;
      v18 = 113;
      v14 = "%{public}s::%d:bssMO nil";
LABEL_12:
      _os_log_impl(&dword_212581000, v11, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v15, 0x12u);
    }
LABEL_13:
    v12 = 0;
    goto LABEL_7;
  }
  if (!v8)
  {
    WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136446466;
      v16 = "+[BSSMO setBssManagedObjectPropertyValueForKey:forKey:withValue:]";
      v17 = 1024;
      v18 = 114;
      v14 = "%{public}s::%d:key nil";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend(v7, "unparsedBeacon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeObjectForKey:](v11, "removeObjectForKey:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  -[NSObject setObject:forKey:](v11, "setObject:forKey:", v9, v8);
  objc_msgSend(v7, "setUnparsedBeacon:", v11);

  v12 = 1;
LABEL_7:

  return v12;
}

+ (BOOL)coalesceBssidsIntoDeployment:(id)a3 moc:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    +[BSSMO getDeploymentUuidForBssids:moc:](BSSMO, "getDeploymentUuidForBssids:moc:", v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v7);
      WALogCategoryDefaultHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "UUIDString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446722;
        v20 = "+[BSSMO coalesceBssidsIntoDeployment:moc:]";
        v21 = 1024;
        v22 = 147;
        v23 = 2112;
        v24 = v10;
        v11 = "%{public}s::%d:Existing UUID %@";
LABEL_7:
        _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_DEBUG, v11, buf, 0x1Cu);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      WALogCategoryDefaultHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "UUIDString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446722;
        v20 = "+[BSSMO coalesceBssidsIntoDeployment:moc:]";
        v21 = 1024;
        v22 = 144;
        v23 = 2112;
        v24 = v10;
        v11 = "%{public}s::%d:Created UUID %@";
        goto LABEL_7;
      }
    }

    WALogCategoryDefaultHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v8, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446978;
      v20 = "+[BSSMO coalesceBssidsIntoDeployment:moc:]";
      v21 = 1024;
      v22 = 150;
      v23 = 2112;
      v24 = v13;
      v25 = 2112;
      v26 = v5;
      _os_log_impl(&dword_212581000, v12, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Applying deployment UUID %@ bssidsArray %@", buf, 0x26u);

    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forKey:", v8, CFSTR("apid"));
    +[BSSMO entityName](BSSMO, "entityName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("bssid IN %@"), v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = +[AnalyticsStoreProxy batchUpdate:withPredicate:propertiesToUpdate:moc:](AnalyticsStoreProxy, "batchUpdate:withPredicate:propertiesToUpdate:moc:", v15, v16, v14, v6);

    goto LABEL_11;
  }
  WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v20 = "+[BSSMO coalesceBssidsIntoDeployment:moc:]";
    v21 = 1024;
    v22 = 139;
    _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssidArray nil", buf, 0x12u);
  }
  v17 = 0;
LABEL_11:

  return v17;
}

+ (id)getDeploymentUuidForBssids:(id)a3 moc:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t i;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v19;
  NSObject *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    +[BSSMO entityName](BSSMO, "entityName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("bssid IN %@"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[AnalyticsStoreProxy fetchPropertiesForEntity:properties:predicate:moc:](AnalyticsStoreProxy, "fetchPropertiesForEntity:properties:predicate:moc:", v7, &unk_24CE01EA8, v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "valueForKey:", CFSTR("apid"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count"))
      {
        for (i = 0; i < objc_msgSend(v10, "count"); ++i)
        {
          objc_msgSend(v10, "objectAtIndex:", i);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v10, "objectAtIndex:", i);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v14;
            if (v14)
            {
              objc_msgSend(v14, "UUIDString");
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16)
              {
                objc_msgSend(v15, "UUIDString");
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_12;
              }
            }

          }
        }
      }
      v17 = 0;
    }
    else
    {
      WALogCategoryDefaultHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v22 = "+[BSSMO getDeploymentUuidForBssids:moc:]";
        v23 = 1024;
        v24 = 169;
        _os_log_impl(&dword_212581000, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssidsArray nil", buf, 0x12u);
      }

      v17 = 0;
      v10 = 0;
    }
  }
  else
  {
    WALogCategoryDefaultHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v22 = "+[BSSMO getDeploymentUuidForBssids:moc:]";
      v23 = 1024;
      v24 = 166;
      _os_log_impl(&dword_212581000, v20, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssidArray nil", buf, 0x12u);
    }

    v17 = 0;
    v10 = 0;
    v9 = 0;
  }
LABEL_12:

  return v17;
}

+ (unint64_t)numBssInBand:(id)a3 bandIs24:(BOOL)a4 moc:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void **v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  NSObject *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v6 = a4;
  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  if (v7)
  {
    v9 = (void *)MEMORY[0x212BEF45C]();
    +[BSSMO entityName](BSSMO, "entityName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("network.ssid == %@"), v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("channel <= %d"), 14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("channel > %d"), 14);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = (void *)MEMORY[0x24BDD14C0];
    if (v6)
    {
      v24 = v11;
      v16 = &v24;
      v17 = (uint64_t)v12;
    }
    else
    {
      v23 = v11;
      v16 = &v23;
      v17 = v13;
    }
    v16[1] = (void *)v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "andPredicateWithSubpredicates:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = +[AnalyticsStoreProxy entityCount:withPredicate:moc:](AnalyticsStoreProxy, "entityCount:withPredicate:moc:", v10, v19, v8);
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v26 = "+[BSSMO numBssInBand:bandIs24:moc:]";
      v27 = 1024;
      v28 = 189;
      _os_log_impl(&dword_212581000, v22, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssid nil", buf, 0x12u);
    }

    v20 = 0;
  }

  return v20;
}

+ (id)copyBssidsForDeployment:(id)a3 deploymentUuid:(id)a4 moc:(id)a5
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
  void *v20;
  NSObject *v22;
  NSObject *v23;
  _QWORD v24[2];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
  {
    WALogCategoryDefaultHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v26 = "+[BSSMO copyBssidsForDeployment:deploymentUuid:moc:]";
      v27 = 1024;
      v28 = 218;
      _os_log_impl(&dword_212581000, v23, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssid nil", buf, 0x12u);
    }

    v16 = 0;
    v18 = 0;
    v10 = 0;
    goto LABEL_15;
  }
  +[BSSMO entityName](BSSMO, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v8);
    v12 = (void *)MEMORY[0x24BDD14C0];
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("apid"), v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v13;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("network.ssid == %@"), v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "andPredicateWithSubpredicates:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("network.ssid == %@"), v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[AnalyticsStoreProxy fetchPropertiesForEntity:properties:predicate:moc:](AnalyticsStoreProxy, "fetchPropertiesForEntity:properties:predicate:moc:", v10, &unk_24CE01EC0, v16, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17 || !objc_msgSend(v17, "count"))
  {
    WALogCategoryDefaultHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v26 = "+[BSSMO copyBssidsForDeployment:deploymentUuid:moc:]";
      v27 = 1024;
      v28 = 233;
      _os_log_impl(&dword_212581000, v22, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssidsArray nil", buf, 0x12u);
    }

LABEL_15:
    v19 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v18, "valueForKey:", CFSTR("bssid"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v20 = (void *)objc_msgSend(v19, "copy");

  return v20;
}

+ (id)copyDeploymentUuidsForSsid:(id)a3 moc:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = a3;
  +[BSSMO entityName](BSSMO, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("network.ssid == %@"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[AnalyticsStoreProxy fetchPropertiesForEntity:properties:predicate:moc:](AnalyticsStoreProxy, "fetchPropertiesForEntity:properties:predicate:moc:", v7, &unk_24CE01ED8, v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "valueForKey:", CFSTR("apid"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v15 = "+[BSSMO copyDeploymentUuidsForSsid:moc:]";
      v16 = 1024;
      v17 = 248;
      _os_log_impl(&dword_212581000, v13, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssidsArray nil", buf, 0x12u);
    }

    v10 = 0;
  }
  v11 = (void *)objc_msgSend(v10, "copy");

  return v11;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("BSS"));
}

@end
