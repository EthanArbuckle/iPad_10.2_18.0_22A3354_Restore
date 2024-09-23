@implementation NetworkMO

+ (id)entityName
{
  return CFSTR("Network");
}

+ (id)generateInstance:(id)a3 created:(BOOL *)a4 moc:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a3;
  v8 = a5;
  +[NetworkMO entityName](NetworkMO, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("ssid == %@"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy entityByCounting:withPredicate:created:moc:](AnalyticsStoreProxy, "entityByCounting:withPredicate:created:moc:", v9, v10, a4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && *a4)
    objc_msgSend(v11, "setSsid:", v7);

  return v11;
}

+ (id)getInstance:(id)a3 moc:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  +[NetworkMO fetchRequest](NetworkMO, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("ssid == %@"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[AnalyticsStoreProxy fetch:withPredicate:moc:](AnalyticsStoreProxy, "fetch:withPredicate:moc:", v7, v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)removeNetwork:(id)a3 moc:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc(MEMORY[0x24BDBB5E8]);
  +[NetworkMO fetchRequest](NetworkMO, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithFetchRequest:", v8);

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__4;
  v25 = __Block_byref_object_dispose__4;
  v26 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __31__NetworkMO_removeNetwork_moc___block_invoke;
  v17[3] = &unk_24CDDCD20;
  v10 = v6;
  v18 = v10;
  v11 = v9;
  v19 = v11;
  v20 = &v21;
  objc_msgSend(v10, "performBlockAndWait:", v17);
  v12 = v22[5];
  if (v12)
  {
    WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)v22[5], "localizedDescription");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v22[5], "userInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136447234;
      v28 = "+[NetworkMO removeNetwork:moc:]";
      v29 = 1024;
      v30 = 74;
      v31 = 2112;
      v32 = v5;
      v33 = 2112;
      v34 = v15;
      v35 = 2112;
      v36 = v16;
      _os_log_impl(&dword_212581000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error executing batch delete for network[%@]. %@ %@", buf, 0x30u);

    }
  }

  _Block_object_dispose(&v21, 8);
  return v12 == 0;
}

void __31__NetworkMO_removeNetwork_moc___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  id obj;

  v2 = (void *)a1[4];
  v1 = a1[5];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  v4 = (id)objc_msgSend(v2, "executeRequest:error:", v1, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
}

+ (id)networkManagedObjectPropertyValue:(id)a3 forKey:(id)a4
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
    objc_msgSend(a3, "channels");
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
      v13 = "+[NetworkMO networkManagedObjectPropertyValue:forKey:]";
      v14 = 1024;
      v15 = 90;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:Nil networkMO or key %@", (uint8_t *)&v12, 0x1Cu);
    }

    v9 = 0;
  }

  return v9;
}

+ (BOOL)setNetworkManagedObjectPropertyValueForKey:(id)a3 forKey:(id)a4 withValue:(id)a5
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
      v16 = "+[NetworkMO setNetworkManagedObjectPropertyValueForKey:forKey:withValue:]";
      v17 = 1024;
      v18 = 100;
      v14 = "%{public}s::%d:networkMO nil";
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
      v16 = "+[NetworkMO setNetworkManagedObjectPropertyValueForKey:forKey:withValue:]";
      v17 = 1024;
      v18 = 101;
      v14 = "%{public}s::%d:key nil";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend(v7, "channels");
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
  objc_msgSend(v7, "setChannels:", v11);

  v12 = 1;
LABEL_7:

  return v12;
}

+ (int64_t)getTotalScore:(id)a3 moc:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  id v30;
  __int16 v31;
  int64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x212BEF45C]();
  if (!v5)
  {
    WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v26 = "+[NetworkMO getTotalScore:moc:]";
      v27 = 1024;
      v28 = 132;
      v21 = "%{public}s::%d:ssid nil";
      v22 = v9;
      v23 = 18;
LABEL_34:
      _os_log_impl(&dword_212581000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
    }
LABEL_35:
    v15 = 0;
    goto LABEL_29;
  }
  +[NetworkMO getInstance:moc:](NetworkMO, "getInstance:moc:", v5, v6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v26 = "+[NetworkMO getTotalScore:moc:]";
      v27 = 1024;
      v28 = 140;
      v29 = 2112;
      v30 = v5;
      v21 = "%{public}s::%d:networkMO nil for ssid %@";
      v22 = v9;
      v23 = 28;
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  v9 = v8;
  if (-[NSObject switchedToCount](v8, "switchedToCount"))
    v10 = 50 * -[NSObject switchedToCount](v9, "switchedToCount");
  else
    v10 = 0;
  v24 = v6;
  if (-[NSObject switchedAwayFromCount](v9, "switchedAwayFromCount"))
  {
    v11 = -[NSObject switchedAwayFromCount](v9, "switchedAwayFromCount");
    v12 = -15 * v11;
    if (((v11 & 0x8000000000000000) == 0 || v10 <= (v12 ^ 0x7FFFFFFFFFFFFFFFLL))
      && (v10 >= (uint64_t)(0x8000000000000000 - v12) || v11 < 1))
    {
      v10 += v12;
    }
  }
  v14 = v7;
  if ((-[NSObject isOmnipresent](v9, "isOmnipresent") & (v10 > (uint64_t)0x8000000000000009)) != 0)
    v10 -= 10;
  if (-[NSObject authFlags](v9, "authFlags"))
    v10 += 30;
  if (-[NSObject isMoving](v9, "isMoving"))
    v10 += 10;
  if (-[NSObject isTCPGood](v9, "isTCPGood"))
    v10 += 5;
  if (-[NSObject isLongTermNetwork](v9, "isLongTermNetwork"))
    v15 = v10 + 10;
  else
    v15 = v10;
  v16 = (void *)MEMORY[0x24BDD17C8];
  -[NSObject ssid](v9, "ssid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: switchedToCount %lld*%d, switchedAwayFromCount %lld*%d, secured %d*%d, tcpGood %d*%d, longTerm %d*%d"), v17, -[NSObject switchedToCount](v9, "switchedToCount"), 50, -[NSObject switchedAwayFromCount](v9, "switchedAwayFromCount"), 4294967281, -[NSObject authFlags](v9, "authFlags"), 30, -[NSObject isTCPGood](v9, "isTCPGood"), 5, -[NSObject isLongTermNetwork](v9, "isLongTermNetwork"), 10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  WALogCategoryDefaultHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v26 = "+[NetworkMO getTotalScore:moc:]";
    v27 = 1024;
    v28 = 207;
    v29 = 2112;
    v30 = v18;
    v31 = 2048;
    v32 = v15;
    _os_log_impl(&dword_212581000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%@ = %lld", buf, 0x26u);
  }

  v7 = v14;
  v6 = v24;
LABEL_29:

  objc_autoreleasePoolPop(v7);
  return v15;
}

+ (id)allStoredSsids:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NetworkMO entityName](NetworkMO, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", CFSTR("network.ssid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy fetchRequestForEntityWithBatchSize:batchSize:prefetch:](AnalyticsStoreProxy, "fetchRequestForEntityWithBatchSize:batchSize:prefetch:", v5, 100, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy fetch:withPredicate:moc:](AnalyticsStoreProxy, "fetch:withPredicate:moc:", v7, 0, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    v27 = "+[NetworkMO allStoredSsids:]";
    v28 = 1024;
    v29 = 224;
    v30 = 2048;
    v31 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_DEBUG, "%{public}s::%d:ResultCount:%lu", buf, 0x1Cu);
  }

  if (v8)
  {
    v20 = v3;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * v14);
          v16 = v15;
          if (v15)
          {
            objc_msgSend(v15, "ssid");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              objc_msgSend(v16, "ssid");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "addObject:", v18);

            }
          }

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v12);
    }

    v3 = v20;
  }
  if (!objc_msgSend(v4, "count"))
  {

    v4 = 0;
  }

  return v4;
}

+ (void)classifyTraitsForNetwork:(id)a3 distanceFilter:(double)a4 moc:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  int v37;
  void *v38;
  double v39;
  double v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  int v43;
  char v44;
  uint64_t v45;
  NSObject *v46;
  const char *v47;
  NSObject *v48;
  const char *v49;
  const char *v50;
  NSObject *v51;
  uint32_t v52;
  NSObject *v53;
  void *v54;
  id v55;
  id v56;
  unint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  int v61;
  void *context;
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  int v66;
  __int16 v67;
  id v68;
  __int16 v69;
  const char *v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v9 = (void *)MEMORY[0x212BEF45C]();
  if (!v7)
  {
    WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_38;
    *(_DWORD *)buf = 136446466;
    v64 = "+[NetworkMO classifyTraitsForNetwork:distanceFilter:moc:]";
    v65 = 1024;
    v66 = 250;
    v50 = "%{public}s::%d:ssid nil";
    v51 = v11;
    v52 = 18;
LABEL_43:
    _os_log_impl(&dword_212581000, v51, OS_LOG_TYPE_ERROR, v50, buf, v52);
    goto LABEL_38;
  }
  +[NetworkMO getInstance:moc:](NetworkMO, "getInstance:moc:", v7, v8);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_38;
    *(_DWORD *)buf = 136446722;
    v64 = "+[NetworkMO classifyTraitsForNetwork:distanceFilter:moc:]";
    v65 = 1024;
    v66 = 253;
    v67 = 2112;
    v68 = v7;
    v50 = "%{public}s::%d:networkMO nil for ssid %@";
    v51 = v11;
    v52 = 28;
    goto LABEL_43;
  }
  v11 = v10;
  +[GeoTagMO geoTagsForNetwork:moc:](GeoTagMO, "geoTagsForNetwork:moc:", v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v59 = v12;
  if (v12)
  {
    v53 = v11;
    v54 = v9;
    v55 = v8;
    v56 = v7;
    if (objc_msgSend(v12, "count"))
    {
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 1;
      while (1)
      {
        v58 = v17;
        objc_msgSend(v13, "objectAtIndex:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v18;
        if (v19)
          break;
LABEL_24:

        v17 = v58 + 1;
        v18 = v57 + 1;
        if (v58 + 1 >= (unint64_t)objc_msgSend(v13, "count"))
          goto LABEL_28;
      }
      while (1)
      {
        if (v18 >= objc_msgSend(v13, "count"))
          goto LABEL_24;
        context = (void *)MEMORY[0x212BEF45C]();
        objc_msgSend(v13, "objectAtIndex:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_alloc(MEMORY[0x24BDBFA78]);
        objc_msgSend(v19, "latitude");
        v23 = v22;
        objc_msgSend(v19, "longitude");
        v25 = (void *)objc_msgSend(v21, "initWithLatitude:longitude:", v23, v24);
        v26 = objc_alloc(MEMORY[0x24BDBFA78]);
        objc_msgSend(v20, "latitude");
        v28 = v27;
        objc_msgSend(v20, "longitude");
        v30 = (void *)objc_msgSend(v26, "initWithLatitude:longitude:", v28, v29);
        objc_msgSend(v25, "distanceFromLocation:", v30);
        if (v31 < a4)
          break;
        if ((unint64_t)++v16 > 1)
          v15 = 1;
        if ((v14 & 1) != 0)
        {
          v43 = 1;
          if ((v15 & 1) == 0)
            break;
        }
        else
        {
          objc_msgSend(v19, "bss");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "bssid");
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "bss");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "bssid");
          v61 = v15;
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "date");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "date");
          v36 = v16;
          v37 = v14;
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "timeIntervalSinceDate:", v38);
          v40 = v39;

          v14 = v37;
          v16 = v36;

          v41 = objc_msgSend(v60, "isEqualToString:", v34);
          if (v40 > 0.0)
            v42 = v41;
          else
            v42 = 0;
          if ((v42 & (v40 <= 604800.0)) != 0)
            v14 = 1;

          v15 = v61;
          v13 = v59;
          v43 = v14 & 1;
          if ((v61 & 1) == 0)
            break;
        }
        if (!v43)
          break;
        v44 = 0;
LABEL_23:

        objc_autoreleasePoolPop(context);
        ++v18;
        if ((v44 & 1) == 0)
          goto LABEL_24;
      }
      v44 = 1;
      goto LABEL_23;
    }
    LOBYTE(v15) = 0;
    LOBYTE(v14) = 0;
LABEL_28:
    v13 = (void *)(v15 & 1);
    v45 = v14 & 1;
    v8 = v55;
    v7 = v56;
    v11 = v53;
    v9 = v54;
  }
  else
  {
    v45 = 0;
  }
  -[NSObject setIsOmnipresent:](v11, "setIsOmnipresent:", v13);
  WALogCategoryDefaultHandle();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    v47 = "NOT Omnipresent";
    v64 = "+[NetworkMO classifyTraitsForNetwork:distanceFilter:moc:]";
    v65 = 1024;
    v66 = 298;
    *(_DWORD *)buf = 136446978;
    if ((_DWORD)v13)
      v47 = "Omnipresent";
    v67 = 2112;
    v68 = v7;
    v69 = 2080;
    v70 = v47;
    _os_log_impl(&dword_212581000, v46, OS_LOG_TYPE_INFO, "%{public}s::%d:Marking network %@ as %s.", buf, 0x26u);
  }

  -[NSObject setIsMoving:](v11, "setIsMoving:", v45);
  WALogCategoryDefaultHandle();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    v49 = "NOT Moving";
    v64 = "+[NetworkMO classifyTraitsForNetwork:distanceFilter:moc:]";
    v65 = 1024;
    v66 = 301;
    *(_DWORD *)buf = 136446978;
    if ((_DWORD)v45)
      v49 = "Moving";
    v67 = 2112;
    v68 = v7;
    v69 = 2080;
    v70 = v49;
    _os_log_impl(&dword_212581000, v48, OS_LOG_TYPE_INFO, "%{public}s::%d:Marking network %@ as %s.", buf, 0x26u);
  }

LABEL_38:
  objc_autoreleasePoolPop(v9);

}

+ (id)copyAllSsidsWithTrait:(id)a3 trait:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a4 >= 3)
  {
    WALogCategoryDefaultHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = 136446722;
      v16 = "+[NetworkMO copyAllSsidsWithTrait:trait:]";
      v17 = 1024;
      v18 = 321;
      v19 = 2048;
      v20 = a4;
      _os_log_impl(&dword_212581000, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:unknown trait %lu", (uint8_t *)&v15, 0x1Cu);
    }

    v8 = 0;
    v6 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", off_24CDDE608[a4]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NetworkMO entityName](NetworkMO, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy fetchPropertiesForEntity:properties:predicate:moc:](AnalyticsStoreProxy, "fetchPropertiesForEntity:properties:predicate:moc:", v7, &unk_24CE01E00, v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || !objc_msgSend(v8, "count"))
  {
    WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = 136446466;
      v16 = "+[NetworkMO copyAllSsidsWithTrait:trait:]";
      v17 = 1024;
      v18 = 326;
      _os_log_impl(&dword_212581000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:resultsArrOfDicts nil", (uint8_t *)&v15, 0x12u);
    }

LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v8, "valueForKey:", CFSTR("ssid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  v11 = (void *)objc_msgSend(v9, "copy");
LABEL_11:

  return v11;
}

+ (id)copyAllSsids:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[NetworkMO entityName](NetworkMO, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy fetchPropertiesForEntity:properties:predicate:moc:](AnalyticsStoreProxy, "fetchPropertiesForEntity:properties:predicate:moc:", v4, &unk_24CE01E18, 0, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "valueForKey:", CFSTR("ssid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446466;
      v11 = "+[NetworkMO copyAllSsids:]";
      v12 = 1024;
      v13 = 343;
      _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:resultsArrOfDicts nil", (uint8_t *)&v10, 0x12u);
    }

    v6 = 0;
  }
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

+ (id)copyAllSsidsWithColocatedScopeId:(id)a3 moc:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v13;
  NSObject *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    +[NetworkMO entityName](NetworkMO, "entityName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("colocatedScopeId"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[AnalyticsStoreProxy fetchPropertiesForEntity:properties:predicate:moc:](AnalyticsStoreProxy, "fetchPropertiesForEntity:properties:predicate:moc:", v7, &unk_24CE01E30, v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "valueForKey:", CFSTR("ssid"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      WALogCategoryDefaultHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v16 = "+[NetworkMO copyAllSsidsWithColocatedScopeId:moc:]";
        v17 = 1024;
        v18 = 358;
        _os_log_impl(&dword_212581000, v13, OS_LOG_TYPE_ERROR, "%{public}s::%d:resultsArrOfDicts nil", buf, 0x12u);
      }

      v10 = 0;
    }
  }
  else
  {
    WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v16 = "+[NetworkMO copyAllSsidsWithColocatedScopeId:moc:]";
      v17 = 1024;
      v18 = 355;
      _os_log_impl(&dword_212581000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:colocatedScopeId nil", buf, 0x12u);
    }

    v10 = 0;
    v9 = 0;
  }
  v11 = (void *)objc_msgSend(v10, "copy");

  return v11;
}

+ (id)copyAllSsidsWithColocatedScopeIdStr:(id)a3 moc:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)MEMORY[0x24BDD1880];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithUUIDString:", v7);

  +[NetworkMO entityName](NetworkMO, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("colocatedScopeId"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy fetchPropertiesForEntity:properties:predicate:moc:](AnalyticsStoreProxy, "fetchPropertiesForEntity:properties:predicate:moc:", v9, &unk_24CE01E48, v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "valueForKey:", CFSTR("ssid"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WALogCategoryDefaultHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v17 = "+[NetworkMO copyAllSsidsWithColocatedScopeIdStr:moc:]";
      v18 = 1024;
      v19 = 374;
      _os_log_impl(&dword_212581000, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:resultsArrOfDicts nil", buf, 0x12u);
    }

    v12 = 0;
  }
  v13 = (void *)objc_msgSend(v12, "copy");

  return v13;
}

+ (id)getFirstColocatedScopeUuidForSsids:(id)a3 moc:(id)a4
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
    +[NetworkMO entityName](NetworkMO, "entityName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("ssid IN %@"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[AnalyticsStoreProxy fetchPropertiesForEntity:properties:predicate:moc:](AnalyticsStoreProxy, "fetchPropertiesForEntity:properties:predicate:moc:", v7, &unk_24CE01E60, v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "valueForKey:", CFSTR("colocatedScopeId"));
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
        v22 = "+[NetworkMO getFirstColocatedScopeUuidForSsids:moc:]";
        v23 = 1024;
        v24 = 389;
        _os_log_impl(&dword_212581000, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssidArray nil", buf, 0x12u);
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
      v22 = "+[NetworkMO getFirstColocatedScopeUuidForSsids:moc:]";
      v23 = 1024;
      v24 = 386;
      _os_log_impl(&dword_212581000, v20, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssidArray nil", buf, 0x12u);
    }

    v17 = 0;
    v10 = 0;
    v9 = 0;
  }
LABEL_12:

  return v17;
}

+ (BOOL)invalidateColocatedScopeForSsidArray:(id)a3 moc:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1548], "expressionForConstantValue:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setValue:forKey:](v7, "setValue:forKey:", v8, CFSTR("colocatedScopeId"));

    +[NetworkMO entityName](NetworkMO, "entityName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("ssid IN %@"), v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = +[AnalyticsStoreProxy batchUpdate:withPredicate:propertiesToUpdate:moc:](AnalyticsStoreProxy, "batchUpdate:withPredicate:propertiesToUpdate:moc:", v9, v10, v7, v6);

  }
  else
  {
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v14 = "+[NetworkMO invalidateColocatedScopeForSsidArray:moc:]";
      v15 = 1024;
      v16 = 411;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssidArray nil", buf, 0x12u);
    }
    v11 = 0;
  }

  return v11;
}

+ (BOOL)coalesceSsidsIntoColocatedScope:(id)a3 moc:(id)a4
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
    +[NetworkMO getFirstColocatedScopeUuidForSsids:moc:](NetworkMO, "getFirstColocatedScopeUuidForSsids:moc:", v5, v6);
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
        v20 = "+[NetworkMO coalesceSsidsIntoColocatedScope:moc:]";
        v21 = 1024;
        v22 = 434;
        v23 = 2112;
        v24 = v10;
        v11 = "%{public}s::%d:Existing ColocatedScope UUID %@";
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
        v20 = "+[NetworkMO coalesceSsidsIntoColocatedScope:moc:]";
        v21 = 1024;
        v22 = 431;
        v23 = 2112;
        v24 = v10;
        v11 = "%{public}s::%d:Created ColocatedScope UUID %@";
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
      v20 = "+[NetworkMO coalesceSsidsIntoColocatedScope:moc:]";
      v21 = 1024;
      v22 = 436;
      v23 = 2112;
      v24 = v13;
      v25 = 2112;
      v26 = v5;
      _os_log_impl(&dword_212581000, v12, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Applying ColocatedScope UUID %@ to ssidArray %@", buf, 0x26u);

    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forKey:", v8, CFSTR("colocatedScopeId"));
    +[NetworkMO entityName](NetworkMO, "entityName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("ssid IN %@"), v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = +[AnalyticsStoreProxy batchUpdate:withPredicate:propertiesToUpdate:moc:](AnalyticsStoreProxy, "batchUpdate:withPredicate:propertiesToUpdate:moc:", v15, v16, v14, v6);

    goto LABEL_11;
  }
  WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v20 = "+[NetworkMO coalesceSsidsIntoColocatedScope:moc:]";
    v21 = 1024;
    v22 = 426;
    _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssidsArray nil", buf, 0x12u);
  }
  v17 = 0;
LABEL_11:

  return v17;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("Network"));
}

@end
