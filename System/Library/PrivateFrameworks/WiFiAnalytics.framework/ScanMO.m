@implementation ScanMO

+ (id)entityName
{
  return CFSTR("Scan");
}

+ (id)generateInstance:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[ScanMO entityName](ScanMO, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy createEntity:moc:](AnalyticsStoreProxy, "createEntity:moc:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)getSsidAndBssidWithinRangeForColocatedScopeTransition:(id)a3 bssid:(id)a4 minRssi:(int)a5 maxRssi:(int)a6 band:(unsigned int)a7 transitionSsid:(id *)a8 transitionBssid:(id *)a9 transitionRssi:(int *)a10 authFlags:(id *)a11 moc:(id)a12
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  int v60;
  void *v61;
  int v62;
  const char *v63;
  NSObject *v64;
  BOOL v65;
  NSObject *v66;
  const char *v68;
  NSObject *v69;
  uint32_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  id v78;
  void *v79;
  void *v80;
  uint64_t v81;
  unsigned int obj;
  NSObject *obja;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint8_t buf[4];
  const char *v90;
  __int16 v91;
  int v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  id v96;
  __int16 v97;
  int v98;
  __int16 v99;
  int v100;
  __int16 v101;
  void *v102;
  __int16 v103;
  id v104;
  __int16 v105;
  int v106;
  __int16 v107;
  int v108;
  __int16 v109;
  const char *v110;
  _BYTE v111[128];
  void *v112;
  _QWORD v113[2];
  _QWORD v114[7];

  v81 = *(_QWORD *)&a6;
  v84 = *(_QWORD *)&a5;
  v114[4] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v78 = a4;
  v15 = a12;
  +[ScanMO fetchRequest](ScanMO, "fetchRequest");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v14;
  +[NetworkMO getInstance:moc:](NetworkMO, "getInstance:moc:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
  {
    WALogCategoryDefaultHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v90 = "+[ScanMO getSsidAndBssidWithinRangeForColocatedScopeTransition:bssid:minRssi:maxRssi:band:transitionSsid:tra"
            "nsitionBssid:transitionRssi:authFlags:moc:]";
      v91 = 1024;
      v92 = 51;
      v93 = 2112;
      v94 = (uint64_t)v79;
      v68 = "%{public}s::%d:networkMO nil for ssid %@";
      v69 = v36;
      v70 = 28;
LABEL_42:
      _os_log_impl(&dword_212581000, v69, OS_LOG_TYPE_ERROR, v68, buf, v70);
    }
LABEL_43:
    v30 = 0;
    v64 = 0;
    v20 = 0;
    v32 = 0;
    v31 = 0;
    goto LABEL_34;
  }
  objc_msgSend(v16, "colocatedScopeId");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    WALogCategoryDefaultHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v90 = "+[ScanMO getSsidAndBssidWithinRangeForColocatedScopeTransition:bssid:minRssi:maxRssi:band:transitionSsid:tra"
            "nsitionBssid:transitionRssi:authFlags:moc:]";
      v91 = 1024;
      v92 = 54;
      v68 = "%{public}s::%d:No colocated scope id";
      v69 = v36;
      v70 = 18;
      goto LABEL_42;
    }
    goto LABEL_43;
  }
  v80 = (void *)v18;
  v74 = v17;
  v75 = v15;
  obj = a7;
  if (a7 == 1)
  {
    v19 = CFSTR("result.channel <= %d");
    goto LABEL_7;
  }
  if (a7 == 2)
  {
    v19 = CFSTR("result.channel > %d");
LABEL_7:
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", v19, 14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v20 = 0;
LABEL_9:
  v21 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("origin.network.ssid == %@"), v79);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v114[0] = v22;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("origin.bssid == %@"), v78);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v114[1] = v23;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("result.bssid != %@"), v78);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v114[2] = v24;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(resultRssi > %d) AND (resultRssi <= %d)"), v84, v81);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v114[3] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v114, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "andPredicateWithSubpredicates:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v28 = (void *)MEMORY[0x24BDD14C0];
    v113[0] = v27;
    v113[1] = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v113, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "andPredicateWithSubpredicates:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = v80;
  }
  else
  {
    v31 = v80;
    v30 = v27;
  }
  v15 = v75;
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("resultRssi"), 0);
  objc_msgSend(v76, "setFetchBatchSize:", 100);
  objc_msgSend(v76, "setRelationshipKeyPathsForPrefetching:", &unk_24CE01EF0);
  v112 = v32;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v112, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setSortDescriptors:", v33);

  +[AnalyticsStoreProxy fetch:withPredicate:moc:](AnalyticsStoreProxy, "fetch:withPredicate:moc:", v76, v30, v75);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  WALogCategoryDefaultHandle();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446978;
    v90 = "+[ScanMO getSsidAndBssidWithinRangeForColocatedScopeTransition:bssid:minRssi:maxRssi:band:transitionSsid:trans"
          "itionBssid:transitionRssi:authFlags:moc:]";
    v91 = 1024;
    v92 = 86;
    v93 = 2048;
    v94 = objc_msgSend(v34, "count");
    v95 = 1024;
    LODWORD(v96) = obj;
    _os_log_impl(&dword_212581000, v35, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Found %lu results with bandPref:%d", buf, 0x22u);
  }

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v36 = v34;
  v37 = -[NSObject countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v85, v111, 16);
  if (v37)
  {
    v38 = v37;
    obja = v36;
    v71 = v32;
    v72 = v30;
    v73 = v20;
    v39 = *(_QWORD *)v86;
    while (2)
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v86 != v39)
          objc_enumerationMutation(obja);
        v41 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
        objc_msgSend(v41, "result");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "network");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "colocatedScopeId");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v31, "isEqual:", v44);

        if (v45)
        {
          v46 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v41, "result");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "network");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "ssid");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "stringWithString:", v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          v51 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v41, "result");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "bssid");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "stringWithString:", v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          if ((int)objc_msgSend(v41, "resultRssi") > (int)v84 && (int)objc_msgSend(v41, "resultRssi") <= (int)v81)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v50);
            *a8 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v54);
            *a9 = (id)objc_claimAutoreleasedReturnValue();
            *a10 = objc_msgSend(v41, "resultRssi");
            v56 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v41, "result");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "network");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "numberWithInt:", objc_msgSend(v58, "authFlags"));
            *a11 = (id)objc_claimAutoreleasedReturnValue();

            v31 = v80;
            v55 = 1;
          }
          else
          {
            v55 = 0;
          }
          WALogCategoryDefaultHandle();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
          {
            v60 = objc_msgSend(v41, "resultRssi");
            objc_msgSend(v41, "result");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = objc_msgSend(v61, "channel");
            *(_DWORD *)buf = 136448770;
            v63 = "Will not";
            if (v55)
              v63 = "Will";
            v90 = "+[ScanMO getSsidAndBssidWithinRangeForColocatedScopeTransition:bssid:minRssi:maxRssi:band:transitionSs"
                  "id:transitionBssid:transitionRssi:authFlags:moc:]";
            v91 = 1024;
            v92 = 104;
            v93 = 2112;
            v94 = (uint64_t)v50;
            v95 = 2112;
            v96 = v54;
            v97 = 1024;
            v98 = v60;
            v99 = 1024;
            v100 = v62;
            v101 = 2112;
            v102 = v79;
            v103 = 2112;
            v104 = v78;
            v105 = 1024;
            v106 = v81;
            v107 = 1024;
            v108 = v84;
            v109 = 2080;
            v110 = v63;
            _os_log_impl(&dword_212581000, v59, OS_LOG_TYPE_DEBUG, "%{public}s::%d:%@[%@] at rssi %d on chan: %d for %@[%@] in range [%d, %d). %s use", buf, 0x5Cu);

            v31 = v80;
          }

          if ((v55 & 1) != 0)
          {
            v65 = 1;
            v66 = obja;
            v64 = obja;
            v17 = v74;
            v15 = v75;
            v30 = v72;
            v20 = v73;
            v32 = v71;
            goto LABEL_37;
          }
        }
      }
      v38 = -[NSObject countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v85, v111, 16);
      if (v38)
        continue;
      break;
    }
    v36 = obja;
    v64 = obja;
    v17 = v74;
    v15 = v75;
    v30 = v72;
    v20 = v73;
    v32 = v71;
  }
  else
  {
    v64 = v36;
    v17 = v74;
  }
LABEL_34:

  *a8 = 0;
  *a9 = 0;
  WALogCategoryDefaultHandle();
  v66 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136447490;
    v90 = "+[ScanMO getSsidAndBssidWithinRangeForColocatedScopeTransition:bssid:minRssi:maxRssi:band:transitionSsid:trans"
          "itionBssid:transitionRssi:authFlags:moc:]";
    v91 = 1024;
    v92 = 114;
    v93 = 2112;
    v94 = (uint64_t)v79;
    v95 = 2112;
    v96 = v78;
    v97 = 1024;
    v98 = v81;
    v99 = 1024;
    v100 = v84;
    _os_log_impl(&dword_212581000, v66, OS_LOG_TYPE_ERROR, "%{public}s::%d:Nothing found for %@[%@] in range [%d, %d)", buf, 0x32u);
  }
  v65 = 0;
LABEL_37:

  return v65;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("Scan"));
}

@end
