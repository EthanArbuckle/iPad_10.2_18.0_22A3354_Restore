@implementation MOPersonalizedSensingUtils

+ (BOOL)_shouldRemoveBundle:(id)a3 checkVisibilityCategoryForUI:(BOOL)a4
{
  NSObject *v4;
  id v5;
  id os_log;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  const char *v12;
  id v13;
  id v14;
  void *v15;
  unsigned int v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  id v30;
  int v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;

  LODWORD(v4) = a4;
  v5 = a3;
  if ((_os_feature_enabled_impl("Moments", "MOActivityForPersonalizedSensing") & 1) == 0)
  {
    if (objc_msgSend(v5, "interfaceType") == (id)15
      && (objc_msgSend(v5, "bundleSubType") == (id)902 || objc_msgSend(v5, "bundleSubType") == (id)906))
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
      v4 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "suggestionID"));
        v9 = objc_msgSend(v5, "bundleSubType");
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "labels"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
        v32 = 138413058;
        v33 = v7;
        v34 = 2112;
        v35 = v8;
        v36 = 2048;
        v37 = v9;
        v38 = 2112;
        v39 = v11;
        v12 = "#bundlecuration, filtered cluster bundle, reason shouldAllowActivityBundles=False & activity cluster, bund"
              "leId %@, suggestionId %@, bundleSubType %lu, label, %@";
LABEL_25:
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v32, 0x2Au);

        goto LABEL_26;
      }
      goto LABEL_27;
    }
    if (objc_msgSend(v5, "interfaceType") == (id)12 && objc_msgSend(v5, "bundleSuperType") == (id)2)
    {
      v13 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
      v4 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "suggestionID"));
        v14 = objc_msgSend(v5, "bundleSubType");
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "labels"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
        v32 = 138413058;
        v33 = v7;
        v34 = 2112;
        v35 = v8;
        v36 = 2048;
        v37 = v14;
        v38 = 2112;
        v39 = v11;
        v12 = "#bundlecuration, filtered activity summary bundle, reason shouldAllowActivityBundles=False & activity bund"
              "le, bundleId %@, suggestionId %@, bundleSubType %lu, label, %@";
        goto LABEL_25;
      }
LABEL_27:

      LOBYTE(v4) = 1;
      goto LABEL_28;
    }
  }
  if (objc_msgSend(v5, "interfaceType") != (id)13)
  {
    if (objc_msgSend(v5, "bundleSuperType") == (id)9)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clusterMetadata"));
      v16 = objc_msgSend(v15, "isFiltered");

      if (v16)
      {
        v17 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
        v4 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "suggestionID"));
          v18 = objc_msgSend(v5, "bundleSubType");
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "labels"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
          v32 = 138413058;
          v33 = v7;
          v34 = 2112;
          v35 = v8;
          v36 = 2048;
          v37 = v18;
          v38 = 2112;
          v39 = v11;
          v12 = "#bundlecuration, filtered cluster bundle, reason clusterMetadata.isFiltered, bundleId %@, suggestionId %"
                "@, bundleSubType %lu, label, %@";
          goto LABEL_25;
        }
        goto LABEL_27;
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "bundleSubType")));
      v28 = objc_msgSend(&off_1002DC470, "containsObject:", v27);

      if ((v28 & 1) == 0)
      {
        v29 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
        v4 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "suggestionID"));
          v30 = objc_msgSend(v5, "bundleSubType");
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "labels"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
          v32 = 138413058;
          v33 = v7;
          v34 = 2112;
          v35 = v8;
          v36 = 2048;
          v37 = v30;
          v38 = 2112;
          v39 = v11;
          v12 = "#bundlecuration, filtered cluster bundle, reason unsupported subtype, bundleId %@, suggestionId %@, bund"
                "leSubType %lu, label, %@";
          goto LABEL_25;
        }
        goto LABEL_27;
      }
    }
    else
    {
      if (!(_DWORD)v4)
        goto LABEL_28;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rankingDictionary"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("visibilityCategoryForUI")));
      if (objc_msgSend(v20, "intValue") == 4)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rankingDictionary"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("isBundleOrSubBundlesSelectedOrQuickAdded")));
        v23 = objc_msgSend(v22, "BOOLValue");

        if ((v23 & 1) == 0)
        {
          v24 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
          v4 = objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
          {
            v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
            v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "suggestionID"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "labels"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "firstObject"));
            v32 = 138412802;
            v33 = v7;
            v34 = 2112;
            v35 = v8;
            v36 = 2112;
            v37 = v26;
            _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "#bundlecuration, filtered bundle, reason UIrejected, id, %@, suggestion id, %@, label, %@", (uint8_t *)&v32, 0x20u);

LABEL_26:
            goto LABEL_27;
          }
          goto LABEL_27;
        }
      }
      else
      {

      }
    }
  }
  LOBYTE(v4) = 0;
LABEL_28:

  return (char)v4;
}

+ (id)getPersonalizedSensingAllowedBundles:(id)a3 allowVisits:(BOOL)a4
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSMutableSet *v12;
  NSMutableSet *v13;
  NSMutableArray *v14;
  void *v15;
  void *v16;
  NSMutableSet *v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  NSMutableArray *v25;
  NSMutableSet *v26;
  NSMutableSet *v27;
  NSMutableArray *v28;
  _QWORD v30[4];
  id v31;
  NSMutableSet *v32;
  NSMutableSet *v33;
  NSMutableArray *v34;
  id v35;
  BOOL v36;
  _QWORD v37[4];
  NSMutableSet *v38;
  NSMutableSet *v39;
  uint8_t buf[4];
  id v41;

  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v41 = objc_msgSend(v6, "count");
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "total count of fetched bundles %lu", buf, 0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", &off_1002D7B68, &off_1002D7B80, &off_1002D7B98, &off_1002D7BB0, &off_1002D7BC8, &off_1002D7BE0, 0));
    v12 = objc_opt_new(NSMutableSet);
    v13 = objc_opt_new(NSMutableSet);
    if (_os_feature_enabled_impl("Moments", "MOActivityForPersonalizedSensing"))
    {
      objc_msgSend(v11, "addObject:", &off_1002D7BF8);
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("interfaceType == %luu AND bundleSuperType == %luu"), 12, 2));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filteredArrayUsingPredicate:", v15));
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = __79__MOPersonalizedSensingUtils_getPersonalizedSensingAllowedBundles_allowVisits___block_invoke;
      v37[3] = &unk_1002AD580;
      v17 = v12;
      v38 = v17;
      v39 = v13;
      objc_msgSend(v16, "enumerateObjectsUsingBlock:", v37);
      v18 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = -[NSMutableSet count](v17, "count");
        *(_DWORD *)buf = 134217984;
        v41 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Activity bundle was disabled. Collecting subBundleIDs of activity summaries to recover visit subbundles. subBundleID count=%lu", buf, 0xCu);
      }

      v21 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        +[MOPersonalizedSensingUtils getPersonalizedSensingAllowedBundles:allowVisits:].cold.2();

      v23 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        +[MOPersonalizedSensingUtils getPersonalizedSensingAllowedBundles:allowVisits:].cold.1();

    }
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = __79__MOPersonalizedSensingUtils_getPersonalizedSensingAllowedBundles_allowVisits___block_invoke_78;
    v30[3] = &unk_1002AD5A8;
    v36 = a4;
    v31 = v11;
    v32 = v12;
    v33 = v13;
    v35 = a1;
    v25 = objc_opt_new(NSMutableArray);
    v34 = v25;
    v26 = v13;
    v27 = v12;
    v10 = v11;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v30);
    v28 = v34;
    v14 = v25;

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "no bundle context is extracted due to 0 bundle fetched", buf, 2u);
    }
    v14 = (NSMutableArray *)&__NSArray0__struct;
  }

  return v14;
}

void __79__MOPersonalizedSensingUtils_getPersonalizedSensingAllowedBundles_allowVisits___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subBundleIDs"));
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  v6 = *(void **)(a1 + 40);
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subSuggestionIDs"));

  objc_msgSend(v6, "addObjectsFromArray:", v7);
}

void __79__MOPersonalizedSensingUtils_getPersonalizedSensingAllowedBundles_allowVisits___block_invoke_78(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  id os_log;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  float v26;
  float v27;
  void *v28;
  void *v29;
  float v30;
  unsigned __int8 v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  float v39;
  double v40;
  void *v41;
  void *v42;
  float v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  float v52;
  double v53;
  void *v54;
  void *v55;
  float v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  id v67;
  __int16 v68;
  double v69;
  __int16 v70;
  double v71;
  __int16 v72;
  double v73;
  _BYTE v74[128];

  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(a1 + 72))
  {
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "events"));
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v59;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v59 != v15)
            objc_enumerationMutation(v12);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i), "category") == (id)1)
          {
            os_log = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
            v18 = objc_claimAutoreleasedReturnValue(os_log);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              __79__MOPersonalizedSensingUtils_getPersonalizedSensingAllowedBundles_allowVisits___block_invoke_78_cold_3();

            goto LABEL_37;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
        if (v14)
          continue;
        break;
      }
    }

  }
  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "interfaceType")));
  LOBYTE(v5) = objc_msgSend(v5, "containsObject:", v6);

  if ((v5 & 1) == 0)
  {
    v10 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __79__MOPersonalizedSensingUtils_getPersonalizedSensingAllowedBundles_allowVisits___block_invoke_78_cold_2(v4, v11);
    goto LABEL_36;
  }
  if ((_os_feature_enabled_impl("Moments", "MOActivityForPersonalizedSensing") & 1) == 0)
  {
    v7 = *(void **)(a1 + 40);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
    if (objc_msgSend(v7, "containsObject:", v9))
    {

      goto LABEL_21;
    }
    v19 = *(void **)(a1 + 48);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestionID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "UUIDString"));
    LODWORD(v19) = objc_msgSend(v19, "containsObject:", v21);

    if ((_DWORD)v19)
    {
LABEL_21:
      if (objc_msgSend(v4, "bundleSuperType") != (id)2)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("kRejectedByVisitHeuristicsFilter")));
        if ((objc_msgSend(v23, "BOOLValue") & 1) == 0)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore")));
          objc_msgSend(v25, "floatValue");
          v27 = v26;
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("suggestionAcceptThreshold")));
          objc_msgSend(v29, "floatValue");
          if (v27 > v30)
          {
            v31 = objc_msgSend(*(id *)(a1 + 64), "_shouldRemoveBundle:checkVisibilityCategoryForUI:", v4, 0);

            if ((v31 & 1) == 0)
            {
              v32 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
              v33 = objc_claimAutoreleasedReturnValue(v32);
              if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
              {
                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
                v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestionID"));
                v36 = objc_msgSend(v4, "bundleSubType");
                v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
                v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore")));
                objc_msgSend(v38, "floatValue");
                v40 = v39;
                v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
                v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("suggestionAcceptThreshold")));
                objc_msgSend(v42, "floatValue");
                *(_DWORD *)buf = 138413314;
                v63 = v34;
                v64 = 2112;
                v65 = v35;
                v66 = 2048;
                v67 = v36;
                v68 = 2048;
                v69 = v40;
                v70 = 2048;
                v71 = v43;
                _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "SubBundle of activity summary was recovered. bundleID %@, suggestionID %@, bundleSubType %lu, goodnessScore %.3f, acceptThreshold %.3f", buf, 0x34u);

              }
              goto LABEL_31;
            }
            goto LABEL_34;
          }

        }
      }
LABEL_34:
      v45 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
      v11 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestionID"));
        v57 = objc_msgSend(v4, "bundleSubType");
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("kRejectedByVisitHeuristicsFilter")));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore")));
        objc_msgSend(v51, "floatValue");
        v53 = v52;
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("suggestionAcceptThreshold")));
        objc_msgSend(v55, "floatValue");
        *(_DWORD *)buf = 138413570;
        v63 = v46;
        v64 = 2112;
        v65 = v47;
        v66 = 2048;
        v67 = v57;
        v68 = 2112;
        v69 = *(double *)&v49;
        v70 = 2048;
        v71 = v53;
        v72 = 2048;
        v73 = v56;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "SubBundle of activity summary was suppressed. bundleID %@, suggestionID %@, bundleSubType %lu, rejectedByVisitHeuristicsFilter, %@ goodnessScore %.3f, acceptThreshold %.3f", buf, 0x3Eu);

      }
LABEL_36:

      goto LABEL_37;
    }
  }
  if (objc_msgSend(*(id *)(a1 + 64), "_shouldRemoveBundle:checkVisibilityCategoryForUI:", v4, 1))
  {
    v44 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    v11 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __79__MOPersonalizedSensingUtils_getPersonalizedSensingAllowedBundles_allowVisits___block_invoke_78_cold_1();
    goto LABEL_36;
  }
LABEL_31:
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v4);
LABEL_37:

}

+ (void)getPersonalizedSensingAllowedBundles:allowVisits:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "subSuggestionIDs=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)getPersonalizedSensingAllowedBundles:allowVisits:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "subBundleIDs=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __79__MOPersonalizedSensingUtils_getPersonalizedSensingAllowedBundles_allowVisits___block_invoke_78_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Not allowed bundle: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __79__MOPersonalizedSensingUtils_getPersonalizedSensingAllowedBundles_allowVisits___block_invoke_78_cold_2(void *a1, NSObject *a2)
{
  uint8_t v4[12];
  __int16 v5;
  void *v6;

  objc_msgSend(a1, "interfaceType");
  OUTLINED_FUNCTION_2();
  v5 = 2112;
  v6 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Not allowed bundle by category (%lu): %@", v4, 0x16u);
}

void __79__MOPersonalizedSensingUtils_getPersonalizedSensingAllowedBundles_allowVisits___block_invoke_78_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Not allowed visit bundle: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
