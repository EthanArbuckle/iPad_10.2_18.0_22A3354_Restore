@implementation GeoTagMO

+ (id)entityName
{
  return CFSTR("GeoTag");
}

+ (id)generateInstance:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[GeoTagMO entityName](GeoTagMO, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy createEntity:moc:](AnalyticsStoreProxy, "createEntity:moc:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)geoTagsForNetwork:(id)a3 moc:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  +[GeoTagMO entityName](GeoTagMO, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy fetchRequestForEntity:](AnalyticsStoreProxy, "fetchRequestForEntity:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setFetchLimit:", 10);
  objc_msgSend(v8, "setRelationshipKeyPathsForPrefetching:", &unk_24CE01E78);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("date"), 0);
  v23[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDescriptors:", v10);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("bss.network.ssid == %@"), v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy fetch:withPredicate:moc:](AnalyticsStoreProxy, "fetch:withPredicate:moc:", v8, v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446978;
      v16 = "+[GeoTagMO geoTagsForNetwork:moc:]";
      v17 = 1024;
      v18 = 46;
      v19 = 2048;
      v20 = objc_msgSend(v12, "count");
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_212581000, v13, OS_LOG_TYPE_DEBUG, "%{public}s::%d:ResultCount:%lu ssid:%@", buf, 0x26u);
    }

  }
  return v12;
}

+ (id)geoTagsInBandForNetwork:(unsigned int)a3 ssid:(id)a4 moc:(id)a5
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
  void *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  +[GeoTagMO entityName](GeoTagMO, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy fetchRequestForEntity:](AnalyticsStoreProxy, "fetchRequestForEntity:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setFetchLimit:", 10);
  objc_msgSend(v10, "setRelationshipKeyPathsForPrefetching:", &unk_24CE01E90);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("date"), 0);
  v33[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSortDescriptors:", v12);

  if (a3 == 2)
  {
    v13 = (void *)MEMORY[0x24BDD14C0];
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("bss.channel > %d"), 14);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v14;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("bss.network.ssid == %@"), v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v15;
    v16 = (void *)MEMORY[0x24BDBCE30];
    v17 = v31;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v13 = (void *)MEMORY[0x24BDD14C0];
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("bss.channel <= %d"), 14);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v14;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("bss.network.ssid == %@"), v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v15;
    v16 = (void *)MEMORY[0x24BDBCE30];
    v17 = v32;
LABEL_5:
    objc_msgSend(v16, "arrayWithObjects:count:", v17, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "andPredicateWithSubpredicates:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("bss.network.ssid == %@"), v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  +[AnalyticsStoreProxy fetch:withPredicate:moc:](AnalyticsStoreProxy, "fetch:withPredicate:moc:", v10, v19, v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    WALogCategoryDefaultHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446978;
      v24 = "+[GeoTagMO geoTagsInBandForNetwork:ssid:moc:]";
      v25 = 1024;
      v26 = 86;
      v27 = 2048;
      v28 = objc_msgSend(v20, "count");
      v29 = 2112;
      v30 = v7;
      _os_log_impl(&dword_212581000, v21, OS_LOG_TYPE_DEBUG, "%{public}s::%d:ResultCount:%lu ssid:%@", buf, 0x26u);
    }

  }
  return v20;
}

+ (id)geoTagsAtLocationInBand:(id)a3 distance:(double)a4 band:(unsigned int)a5 moc:(id)a6
{
  id v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  NSObject *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v54;
  id obj;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  double v60;
  void *v62;
  void *context;
  uint64_t v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint8_t buf[4];
  const char *v83;
  __int16 v84;
  int v85;
  __int16 v86;
  double v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  uint64_t v91;
  __int16 v92;
  _BYTE v93[14];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v67 = a3;
  v8 = a6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v8;
  +[NetworkMO allStoredSsids:](NetworkMO, "allStoredSsids:", v8);
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v95, 16);
  if (v59)
  {
    v57 = *(_QWORD *)v79;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v79 != v57)
          objc_enumerationMutation(obj);
        v64 = v9;
        v10 = *(double *)(*((_QWORD *)&v78 + 1) + 8 * v9);
        context = (void *)MEMORY[0x212BEF45C]();
        v60 = v10;
        +[GeoTagMO geoTagsInBandForNetwork:ssid:moc:](GeoTagMO, "geoTagsInBandForNetwork:ssid:moc:", a5, *(_QWORD *)&v10, v58);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16A8], "string");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16A8], "string");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = 0u;
        v75 = 0u;
        v76 = 0u;
        v77 = 0u;
        v66 = v11;
        v70 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v74, v94, 16);
        if (v70)
        {
          v69 = *(_QWORD *)v75;
          v65 = v12;
          while (2)
          {
            for (i = 0; i != v70; ++i)
            {
              if (*(_QWORD *)v75 != v69)
                objc_enumerationMutation(v66);
              v14 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
              v15 = (void *)MEMORY[0x212BEF45C]();
              if (v14)
              {
                v16 = objc_alloc(MEMORY[0x24BDBFA78]);
                objc_msgSend(v14, "latitude");
                v18 = v17;
                objc_msgSend(v14, "longitude");
                v20 = objc_msgSend(v16, "initWithLatitude:longitude:", v18, v19);
                -[NSObject distanceFromLocation:](v20, "distanceFromLocation:", v67);
                v22 = v21;
                if (a4 != 0.0 && v21 < a4)
                {
                  objc_msgSend(v56, "addObject:", v14);
                  objc_msgSend(v14, "bss");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "network");
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v73, "ssid");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "bss");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "bssid");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "bss");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "network");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  v38 = objc_msgSend(v37, "authFlags");
                  objc_msgSend(v14, "bss");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v54 = v38;
                  v12 = v65;
                  objc_msgSend(v65, "appendFormat:", CFSTR("[ssid: %@[%@] {auth:%d, chan:%d, %fm away}], "), v33, v35, v54, (int)objc_msgSend(v39, "channel"), *(_QWORD *)&v22);

                  objc_autoreleasePoolPop(v15);
                  goto LABEL_21;
                }
                objc_msgSend(v14, "bss");
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v71, "network");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "ssid");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "bss");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "bssid");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "bss");
                v72 = v15;
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "network");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = v20;
                v30 = objc_msgSend(v28, "authFlags");
                objc_msgSend(v14, "bss");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "appendFormat:", CFSTR("[ssid: %@[%@] {auth:%d, chan:%d, %fm away}], "), v24, v26, v30, (int)objc_msgSend(v31, "channel"), *(_QWORD *)&v22);

                v15 = v72;
              }
              else
              {
                WALogCategoryDefaultHandle();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136446466;
                  v83 = "+[GeoTagMO geoTagsAtLocationInBand:distance:band:moc:]";
                  v84 = 1024;
                  v85 = 114;
                  _os_log_impl(&dword_212581000, v29, OS_LOG_TYPE_ERROR, "%{public}s::%d:geoTag nil", buf, 0x12u);
                }
              }

              objc_autoreleasePoolPop(v15);
            }
            v12 = v65;
            v70 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v74, v94, 16);
            if (v70)
              continue;
            break;
          }
        }
LABEL_21:

        WALogCategoryDefaultHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v62, "timeIntervalSinceNow");
          v42 = v41;
          v43 = objc_msgSend(v66, "count");
          *(_DWORD *)buf = 136447234;
          v83 = "+[GeoTagMO geoTagsAtLocationInBand:distance:band:moc:]";
          v84 = 1024;
          v85 = 139;
          v86 = 2112;
          v87 = v60;
          v88 = 2048;
          v89 = v42;
          v90 = 2048;
          v91 = v43;
          _os_log_impl(&dword_212581000, v40, OS_LOG_TYPE_DEBUG, "%{public}s::%d:GeoTag operation for %@ took %f for %lu objects", buf, 0x30u);
        }

        WALogCategoryDefaultHandle();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v67, "coordinate");
          v46 = v45;
          objc_msgSend(v67, "coordinate");
          *(_DWORD *)buf = 136447746;
          v83 = "+[GeoTagMO geoTagsAtLocationInBand:distance:band:moc:]";
          v84 = 1024;
          v85 = 140;
          v86 = 2048;
          v87 = a4;
          v88 = 2048;
          v89 = v46;
          v90 = 2048;
          v91 = v47;
          v92 = 1024;
          *(_DWORD *)v93 = a5;
          *(_WORD *)&v93[4] = 2112;
          *(_QWORD *)&v93[6] = v12;
          _os_log_impl(&dword_212581000, v44, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Networks within %fm of <%f, %f> in band :%d - %@", buf, 0x40u);
        }

        WALogCategoryDefaultHandle();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v67, "coordinate");
          v50 = v49;
          objc_msgSend(v67, "coordinate");
          *(_DWORD *)buf = 136447490;
          v83 = "+[GeoTagMO geoTagsAtLocationInBand:distance:band:moc:]";
          v84 = 1024;
          v85 = 141;
          v86 = 2048;
          v87 = a4;
          v88 = 2048;
          v89 = v50;
          v90 = 2048;
          v91 = v51;
          v92 = 2112;
          *(_QWORD *)v93 = v68;
          _os_log_impl(&dword_212581000, v48, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Networks NOT within %fm of <%f, %f> - %@", buf, 0x3Au);
        }

        objc_autoreleasePoolPop(context);
        v9 = v64 + 1;
      }
      while (v64 + 1 != v59);
      v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v95, 16);
    }
    while (v59);
  }

  v52 = v56;
  if (!objc_msgSend(v56, "count"))
  {

    v52 = 0;
  }

  return v52;
}

+ (BOOL)isNetworkWithinRangeOfLocation:(id)a3 range:(double)a4 location:(id)a5 moc:(id)a6 count:(unint64_t *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  id v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  BOOL v36;
  double v37;
  NSObject *v38;
  void *v39;
  void *v40;
  unint64_t v42;
  void *v43;
  unint64_t *v44;
  void *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  unint64_t v56;
  __int16 v57;
  id v58;
  __int16 v59;
  double v60;
  _BYTE v61[128];
  _QWORD v62[3];

  v62[1] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  +[GeoTagMO entityName](GeoTagMO, "entityName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy fetchRequestForEntity:](AnalyticsStoreProxy, "fetchRequestForEntity:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setFetchLimit:", 10);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", CFSTR("geoTag.bss.bssid"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRelationshipKeyPathsForPrefetching:", v16);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("date"), 0);
  v62[0] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSortDescriptors:", v18);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("bss.network.ssid == %@"), v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy fetch:withPredicate:moc:](AnalyticsStoreProxy, "fetch:withPredicate:moc:", v15, v19, v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v20)
  {
    v22 = 0;
    v36 = 0;
    if (!a7)
      goto LABEL_22;
    goto LABEL_21;
  }
  v45 = v17;
  v46 = v13;
  v22 = objc_msgSend(v20, "count");
  WALogCategoryDefaultHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446978;
    v52 = "+[GeoTagMO isNetworkWithinRangeOfLocation:range:location:moc:count:]";
    v53 = 1024;
    v54 = 173;
    v55 = 2048;
    v56 = v22;
    v57 = 2112;
    v58 = v11;
    _os_log_impl(&dword_212581000, v23, OS_LOG_TYPE_DEBUG, "%{public}s::%d:ResultCount:%lu ssid:%@", buf, 0x26u);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v24 = v21;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
  if (v25)
  {
    v26 = v25;
    v42 = v22;
    v43 = v19;
    v44 = a7;
    v27 = *(_QWORD *)v48;
    while (2)
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v48 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        v30 = objc_alloc(MEMORY[0x24BDBFA78]);
        objc_msgSend(v29, "latitude");
        v32 = v31;
        objc_msgSend(v29, "longitude");
        v34 = (void *)objc_msgSend(v30, "initWithLatitude:longitude:", v32, v33);
        objc_msgSend(v34, "distanceFromLocation:", v12);
        if (v35 < a4)
        {
          v37 = v35;
          WALogCategoryDefaultHandle();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v29, "bss");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "bssid");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136447234;
            v52 = "+[GeoTagMO isNetworkWithinRangeOfLocation:range:location:moc:count:]";
            v53 = 1024;
            v54 = 179;
            v55 = 2112;
            v56 = (unint64_t)v40;
            v57 = 2112;
            v58 = v11;
            v59 = 2048;
            v60 = v37;
            _os_log_impl(&dword_212581000, v38, OS_LOG_TYPE_DEBUG, "%{public}s::%d:GeoTag for %@[%@] is %f away", buf, 0x30u);

          }
          v36 = 1;
          goto LABEL_16;
        }

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
      if (v26)
        continue;
      break;
    }
    v36 = 0;
LABEL_16:
    v19 = v43;
    a7 = v44;
    v22 = v42;
  }
  else
  {
    v36 = 0;
  }

  v17 = v45;
  v13 = v46;
  if (a7)
LABEL_21:
    *a7 = v22;
LABEL_22:

  return v36;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("GeoTag"));
}

@end
