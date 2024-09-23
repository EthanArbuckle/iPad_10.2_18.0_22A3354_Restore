@implementation MOMediaAggregationManager

- (void)aggregateBundles:(id)a3 withParameters:(id)a4 granularity:(unint64_t)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = objc_autoreleasePoolPush();
  if (a5 == 2)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __81__MOMediaAggregationManager_aggregateBundles_withParameters_granularity_handler___block_invoke_72;
    v15[3] = &unk_1002ADFD8;
    v16 = v12;
    -[MOMediaAggregationManager _aggregateBundlesForCoarseGranularity:withParameters:handler:](self, "_aggregateBundlesForCoarseGranularity:withParameters:handler:", v10, v11, v15);
    v14 = v16;
  }
  else
  {
    if (a5 != 1)
    {
      (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);
      goto LABEL_7;
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __81__MOMediaAggregationManager_aggregateBundles_withParameters_granularity_handler___block_invoke;
    v17[3] = &unk_1002ADFD8;
    v18 = v12;
    -[MOMediaAggregationManager _aggregateBundlesForFineGranularity:withParameters:handler:](self, "_aggregateBundlesForFineGranularity:withParameters:handler:", v10, v11, v17);
    v14 = v18;
  }

LABEL_7:
  objc_autoreleasePoolPop(v13);

}

void __81__MOMediaAggregationManager_aggregateBundles_withParameters_granularity_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  int v9;
  id v10;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 134217984;
    v10 = objc_msgSend(v5, "count");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "FineGranularityAggregation for Media: media eventBundles count, %lu", (uint8_t *)&v9, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __81__MOMediaAggregationManager_aggregateBundles_withParameters_granularity_handler___block_invoke_72(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  int v9;
  id v10;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 134217984;
    v10 = objc_msgSend(v5, "count");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for Media: output eventBundles count, %lu", (uint8_t *)&v9, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_aggregateBundlesForFineGranularity:(id)a3 withParameters:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  id v11;
  id os_log;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  int v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  v11 = objc_msgSend(v8, "count");
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v13 = objc_claimAutoreleasedReturnValue(os_log);
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v14)
    {
      v19 = 134217984;
      v20 = objc_msgSend(v8, "count");
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "FineGranularityAggregation for Media: input eventBundles count, %lu", (uint8_t *)&v19, 0xCu);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _megaBundlesFromMediaPlaySessionsBundles:paramters:](self, "_megaBundlesFromMediaPlaySessionsBundles:paramters:", v8, v9));
    v16 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = objc_msgSend(v15, "count");
      v19 = 134217984;
      v20 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "FineGranularityAggregation for Media: output eventBundles count, %lu", (uint8_t *)&v19, 0xCu);
    }

    v10[2](v10, v15, 0);
    v10 = (void (**)(id, void *, _QWORD))v15;
  }
  else
  {
    if (v14)
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "FineGranularityAggregation for Media: No eventBundle to be proccessed", (uint8_t *)&v19, 2u);
    }

    v10[2](v10, 0, 0);
  }

}

- (void)_aggregateBundlesForCoarseGranularity:(id)a3 withParameters:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  id v12;
  id os_log;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  int v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  v11 = objc_autoreleasePoolPush();
  v12 = objc_msgSend(v8, "count");
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v14 = objc_claimAutoreleasedReturnValue(os_log);
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v15)
    {
      v21 = 134217984;
      v22 = objc_msgSend(v8, "count");
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for media: input eventBundles count, %lu", (uint8_t *)&v21, 0xCu);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _megaBundlesForCoarseGranularityFromMediaPlaySessionsBundles:paramters:](self, "_megaBundlesForCoarseGranularityFromMediaPlaySessionsBundles:paramters:", v8, v9));
    v17 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = objc_msgSend(v16, "count");
      v21 = 134217984;
      v22 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for media: output eventBundles count, %lu", (uint8_t *)&v21, 0xCu);
    }

    objc_autoreleasePoolPop(v11);
    v20 = objc_autoreleasePoolPush();
    v10[2](v10, v16, 0);
    objc_autoreleasePoolPop(v20);

  }
  else
  {
    if (v15)
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for media: No eventBundle to be proccessed", (uint8_t *)&v21, 2u);
    }

    v10[2](v10, 0, 0);
    objc_autoreleasePoolPop(v11);
  }

}

- (id)_sortResourcesBySumPlaytime:(id)a3
{
  return objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_28);
}

int64_t __57__MOMediaAggregationManager__sortResourcesBySumPlaytime___block_invoke(id a1, MOResource *a2, MOResource *a3)
{
  MOResource *v4;
  MOResource *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  int64_t v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;

  v4 = a2;
  v5 = a3;
  v6 = objc_autoreleasePoolPush();
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource getDictionary](v4, "getDictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerSumPlaytime")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource getDictionary](v5, "getDictionary"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerSumPlaytime")));

  objc_msgSend(v8, "doubleValue");
  v12 = v11;
  objc_msgSend(v10, "doubleValue");
  if (v12 >= v13)
  {
    objc_msgSend(v8, "doubleValue");
    v16 = v15;
    objc_msgSend(v10, "doubleValue");
    if (v16 <= v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource identifier](v4, "identifier"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource identifier](v5, "identifier"));
      v14 = (int64_t)objc_msgSend(v18, "compare:", v19);

    }
    else
    {
      v14 = -1;
    }
  }
  else
  {
    v14 = 1;
  }

  objc_autoreleasePoolPop(v6);
  return v14;
}

- (id)_sortBundlesBySumPlaytime:(id)a3
{
  return objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_75);
}

int64_t __55__MOMediaAggregationManager__sortBundlesBySumPlaytime___block_invoke(id a1, MOEventBundle *a2, MOEventBundle *a3)
{
  MOEventBundle *v4;
  MOEventBundle *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  int64_t v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;

  v4 = a2;
  v5 = a3;
  v6 = objc_autoreleasePoolPush();
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v4, "resources"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getDictionary"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerSumPlaytime")));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v5, "resources"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "getDictionary"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerSumPlaytime")));

  objc_msgSend(v10, "doubleValue");
  v16 = v15;
  objc_msgSend(v14, "doubleValue");
  if (v16 >= v17)
  {
    objc_msgSend(v10, "doubleValue");
    v20 = v19;
    objc_msgSend(v14, "doubleValue");
    if (v20 <= v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle bundleIdentifier](v4, "bundleIdentifier"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle bundleIdentifier](v5, "bundleIdentifier"));
      v18 = (int64_t)objc_msgSend(v22, "compare:", v23);

    }
    else
    {
      v18 = -1;
    }
  }
  else
  {
    v18 = 1;
  }

  objc_autoreleasePoolPop(v6);
  return v18;
}

- (id)_groupBundleByApps:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
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
  NSMutableArray *v15;
  NSMutableArray *v16;
  id obj;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v19 = *(_QWORD *)v21;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v21 != v19)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v7);
        v9 = objc_autoreleasePoolPush();
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "resources"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getDictionary"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerBundleID")));

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4, "objectForKey:", v13));

          if (v14)
            v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4, "objectForKey:", v13));
          else
            v15 = objc_opt_new(NSMutableArray);
          v16 = v15;
          -[NSMutableArray addObject:](v15, "addObject:", v8);
          -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v16, v13);

        }
        objc_autoreleasePoolPop(v9);
        v7 = (char *)v7 + 1;
      }
      while (v6 != v7);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)_limitMOResourcesAndUpdatePriority:(id)a3 parameters:(id)a4 isSong:(BOOL)a5 isFirstPartyApp:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  NSMutableDictionary *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  __CFString **v18;
  __CFString *v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSMutableArray *v26;
  NSMutableArray *v27;
  uint64_t v28;
  int v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *j;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  MOMediaAggregationManager *v40;
  _BOOL4 v41;
  void *v42;
  id v43;
  _BOOL4 v44;
  NSMutableArray *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = objc_msgSend(v10, "count");
  if (v12 <= objc_msgSend(v11, "mediaBundleMaxResourcesPerBundle"))
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _UpdateAssetPriority:parameters:isSong:isFirstPartyApp:](self, "_UpdateAssetPriority:parameters:isSong:isFirstPartyApp:", v10, v11, v7, v6));
  }
  else
  {
    v40 = self;
    v44 = v7;
    v41 = v6;
    v42 = v11;
    v45 = objc_opt_new(NSMutableArray);
    v13 = objc_opt_new(NSMutableDictionary);
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v43 = v10;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v51;
      v18 = &MOMediaPlayMetaDataKeyPlayerAlbumName;
      if (!v7)
        v18 = &MOMediaPlayMetaDataKeyPlayerArtist;
      v19 = *v18;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v51 != v17)
            objc_enumerationMutation(v14);
          v21 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
          v22 = objc_autoreleasePoolPush();
          if (v21)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "getDictionary"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", v19));

            if (v24)
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v13, "objectForKey:", v24));

              v26 = v25
                  ? (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v13, "objectForKey:", v24))
                  : objc_opt_new(NSMutableArray);
              v27 = v26;
              if (v26)
              {
                -[NSMutableArray addObject:](v26, "addObject:", v21);
                -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v27, v24);

              }
            }

          }
          objc_autoreleasePoolPop(v22);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      }
      while (v16);
    }

    v11 = v42;
    if ((uint64_t)objc_msgSend(v42, "mediaBundleMaxResourcesPerBundle") >= 1)
    {
      v28 = 0;
      v29 = 0;
      do
      {
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v13, "allKeys", v40));
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v47;
          while (2)
          {
            for (j = 0; j != v32; j = (char *)j + 1)
            {
              if (*(_QWORD *)v47 != v33)
                objc_enumerationMutation(v30);
              v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v13, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)j)));
              v36 = v35;
              if (v35)
              {
                if ((unint64_t)objc_msgSend(v35, "count") > v28)
                {
                  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectAtIndexedSubscript:", v28));
                  -[NSMutableArray addObject:](v45, "addObject:", v37);

                  ++v29;
                }
                if ((uint64_t)objc_msgSend(v42, "mediaBundleMaxResourcesPerBundle") <= v29)
                {

                  goto LABEL_34;
                }
              }

            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
            if (v32)
              continue;
            break;
          }
        }
LABEL_34:

        if ((uint64_t)objc_msgSend(v42, "mediaBundleMaxResourcesPerBundle") <= v29)
          break;
        ++v28;
      }
      while ((uint64_t)objc_msgSend(v42, "mediaBundleMaxResourcesPerBundle") > v28);
    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _UpdateAssetPriority:parameters:isSong:isFirstPartyApp:](v40, "_UpdateAssetPriority:parameters:isSong:isFirstPartyApp:", v45, v42, v44, v41, v40));

    v10 = v43;
  }

  return v38;
}

- (id)_UpdateAssetPriority:(id)a3 parameters:(id)a4 isSong:(BOOL)a5 isFirstPartyApp:(BOOL)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  id v14;
  id v15;
  int v16;
  __CFString **v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  __CFString **v27;
  MOResource *v28;
  void *v29;
  MOResource *v30;
  void *v31;
  void *v32;
  double v33;
  NSMutableArray *v34;
  NSMutableDictionary *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *i;
  void *v40;
  id v42;
  id v43;
  int v44;
  int v45;
  id obj;
  _BOOL4 v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];

  v47 = a5;
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (a6)
  {
    v42 = v10;
    v43 = v9;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _sortResourcesBySumPlaytime:](self, "_sortResourcesBySumPlaytime:", v9));
    v13 = objc_opt_new(NSMutableDictionary);
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = v12;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v48 = *(_QWORD *)v54;
      if (v47)
        v17 = &MOMediaPlayMetaDataKeyPlayerAlbumName;
      else
        v17 = &MOMediaPlayMetaDataKeyPlayerArtist;
      v18 = *v17;
      do
      {
        v19 = 0;
        v44 = v16;
        v45 = -v16;
        do
        {
          if (*(_QWORD *)v54 != v48)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)v19);
          v21 = objc_autoreleasePoolPush();
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "getDictionary"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", v18));

          v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v13, "objectForKey:", v23));
          if (v24)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "getDictionary"));
            v26 = objc_msgSend(v25, "mutableCopy");

            v27 = MOMediaPlayMetaDataKeyPlayerMediaTypeSongAlbum;
            if (!v47)
              v27 = MOMediaPlayMetaDataKeyPlayerMediaTypePodcastArtist;
            objc_msgSend(v26, "setObject:forKeyedSubscript:", *v27, CFSTR("MOMediaPlayMetaDataKeyPlayerMediaTypeKey"));
            v28 = [MOResource alloc];
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
            v30 = -[MOResource initWithName:type:dict:value:](v28, "initWithName:type:dict:value:", v29, objc_msgSend(v20, "type"), v26, 0.0);

            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "sourceEventIdentifier"));
            -[MOResource setSourceEventIdentifier:](v30, "setSourceEventIdentifier:", v31);

            -[MOResource setSourceEventAccessType:](v30, "setSourceEventAccessType:", objc_msgSend(v20, "sourceEventAccessType"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v13, "objectForKey:", v23));
            objc_msgSend(v32, "priorityScore");
            -[MOResource setPriorityScore:](v30, "setPriorityScore:");

            -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v30, v23);
          }
          else
          {
            v33 = 200.0;
            if (v45 == (_DWORD)v19)
              v33 = 100.0;
            objc_msgSend(v20, "setPriorityScore:", v33);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v20, v23);
          }

          objc_autoreleasePoolPop(v21);
          v19 = (char *)v19 + 1;
        }
        while (v15 != v19);
        v16 = v44 + (_DWORD)v15;
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      }
      while (v15);
    }

    v34 = objc_opt_new(NSMutableArray);
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v35 = v13;
    v36 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v37; i = (char *)i + 1)
        {
          if (*(_QWORD *)v50 != v38)
            objc_enumerationMutation(v35);
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v35, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i)));
          -[NSMutableArray addObject:](v34, "addObject:", v40);

        }
        v37 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      }
      while (v37);
    }

    v11 = v42;
    v9 = v43;
  }
  else
  {
    v34 = (NSMutableArray *)v9;
  }

  return v34;
}

- (id)_megaBundlesFromMediaPlaySessionsBundles:(id)a3 paramters:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *i;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  unsigned int v22;
  NSMutableArray *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  NSMutableArray *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *k;
  NSMutableArray *v39;
  NSObject *p_super;
  id v41;
  id v42;
  void *v44;
  id os_log;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  void *j;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  unsigned int v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  MOMediaAggregationManager *v76;
  void *v77;
  id v78;
  void *v79;
  NSMutableArray *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  NSMutableArray *v93;
  NSMutableArray *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  uint8_t v108[128];
  uint8_t buf[4];
  id v110;
  __int16 v111;
  void *v112;
  __int16 v113;
  void *v114;
  __int16 v115;
  void *v116;
  _BYTE v117[128];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = objc_opt_new(NSMutableArray);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("interfaceType"), 5));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filteredArrayUsingPredicate:", v9));
    if (objc_msgSend(v10, "count"))
    {
      v74 = v9;
      v75 = v6;
      v80 = v8;
      v94 = objc_opt_new(NSMutableArray);
      v93 = objc_opt_new(NSMutableArray);
      v103 = 0u;
      v104 = 0u;
      v105 = 0u;
      v106 = 0u;
      v73 = v10;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v103, v117, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v104;
        do
        {
          v15 = v11;
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v104 != v14)
              objc_enumerationMutation(v15);
            v17 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * (_QWORD)i);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "events"));
            v19 = objc_msgSend(v18, "count");

            if (v19)
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "events"));
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "firstObject"));
              v22 = -[MOMediaAggregationManager _isFirstPartyApp:](self, "_isFirstPartyApp:", v21);

              if (v22)
                v23 = v94;
              else
                v23 = v93;
              -[NSMutableArray addObject:](v23, "addObject:", v17);
            }
          }
          v11 = v15;
          v13 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v103, v117, 16);
        }
        while (v13);
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "getTimeSpanOfMOEventBundleArray"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "startDate"));
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "components:fromDate:", 28, v26));

      v72 = (void *)v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "dateFromComponents:", v27));
      v79 = v24;
      v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "dateByAddingUnit:value:toDate:options:", 16, 1, v28, 0));
      v81 = v25;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "endDate"));
      v31 = objc_msgSend(v28, "compare:", v30);

      if (v31 == (id)-1)
      {
        v77 = v11;
        v8 = v80;
        v44 = (void *)v29;
        v78 = v7;
        v76 = self;
        do
        {
          os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          v46 = objc_claimAutoreleasedReturnValue(os_log);
          v92 = v44;
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "startDate"));
            v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "endDate"));
            *(_DWORD *)buf = 138413058;
            v110 = v28;
            v111 = 2112;
            v112 = v92;
            v113 = 2112;
            v114 = v70;
            v115 = 2112;
            v116 = v71;
            _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "FineGranularityAggregation: process media bundles with start time, %@, end time, %@, event bundles start date, %@, end date, %@", buf, 0x2Au);

            v44 = v92;
          }

          v47 = objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _getEventBundleBasedOnMediaTypeEnum:playSessionMediaType:startTime:endTime:](self, "_getEventBundleBasedOnMediaTypeEnum:playSessionMediaType:startTime:endTime:", v94, 1, v28, v44));
          v48 = objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager getMediaOnRepeatBundleDaily:mediaTypeEnum:parameters:](self, "getMediaOnRepeatBundleDaily:mediaTypeEnum:parameters:", v47, 1, v7));
          if (v48)
            -[NSMutableArray addObject:](v8, "addObject:", v48);
          v88 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _getEventBundleBasedOnMediaTypeEnum:playSessionMediaType:startTime:endTime:](self, "_getEventBundleBasedOnMediaTypeEnum:playSessionMediaType:startTime:endTime:", v94, 2, v28, v44));
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager getPlayedMediaBundleDaily:mediaTypeEnum:parameters:isPlayedSong:songOnRepeatBundles:](self, "getPlayedMediaBundleDaily:mediaTypeEnum:parameters:isPlayedSong:songOnRepeatBundles:"));
          if (v49)
            -[NSMutableArray addObject:](v8, "addObject:", v49);
          v87 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _getEventBundleBasedOnMediaTypeEnum:playSessionMediaType:startTime:endTime:](self, "_getEventBundleBasedOnMediaTypeEnum:playSessionMediaType:startTime:endTime:", v94, 3, v28, v44));
          v50 = objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager getPlayedMediaBundleDaily:mediaTypeEnum:parameters:isPlayedSong:songOnRepeatBundles:](self, "getPlayedMediaBundleDaily:mediaTypeEnum:parameters:isPlayedSong:songOnRepeatBundles:"));
          if (v50)
            -[NSMutableArray addObject:](v8, "addObject:", v50);
          v90 = (void *)v47;
          v51 = v47;
          v52 = v7;
          v53 = objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager getPlayedMediaBundleDaily:mediaTypeEnum:parameters:isPlayedSong:songOnRepeatBundles:](self, "getPlayedMediaBundleDaily:mediaTypeEnum:parameters:isPlayedSong:songOnRepeatBundles:", v51, 1, v7, 1, v48));
          if (v53)
            -[NSMutableArray addObject:](v8, "addObject:", v53);
          v85 = (void *)v53;
          v54 = objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _getEventBundleBasedOnMediaTypeEnumForThirdPartyApps:startTime:endTime:](self, "_getEventBundleBasedOnMediaTypeEnumForThirdPartyApps:startTime:endTime:", v93, v28, v44));
          v55 = v52;
          v56 = objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager getMediaOnRepeatBundleDailyForThirdPartyApp:mediaTypeEnum:parameters:](self, "getMediaOnRepeatBundleDailyForThirdPartyApp:mediaTypeEnum:parameters:", v54, 5, v52));
          if (v56)
            -[NSMutableArray addObject:](v8, "addObject:", v56);
          v86 = (void *)v50;
          v89 = (void *)v48;
          v91 = v28;
          v84 = (void *)v54;
          v57 = objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager getPlayedMediaBundleDailyForThirdPartyApp:mediaTypeEnum:parameters:songOnRepeatBundles:](self, "getPlayedMediaBundleDailyForThirdPartyApp:mediaTypeEnum:parameters:songOnRepeatBundles:", v54, 5, v55, v56));
          if (v57)
            -[NSMutableArray addObject:](v8, "addObject:", v57);
          v82 = (void *)v57;
          v83 = (void *)v56;
          v101 = 0u;
          v102 = 0u;
          v99 = 0u;
          v100 = 0u;
          v58 = v77;
          v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v99, v108, 16);
          if (v59)
          {
            v60 = v59;
            v61 = *(_QWORD *)v100;
            do
            {
              for (j = 0; j != v60; j = (char *)j + 1)
              {
                v63 = v49;
                if (*(_QWORD *)v100 != v61)
                  objc_enumerationMutation(v58);
                v64 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * (_QWORD)j);
                v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "action"));
                v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "actionName"));
                v67 = objc_msgSend(v66, "isEqualToString:", CFSTR("played_media_sessions"));

                if (v67)
                  objc_msgSend(v64, "setIsAggregatedAndSuppressed:", 1);
                v49 = v63;
              }
              v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v99, v108, 16);
            }
            while (v60);
          }

          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "dateByAddingUnit:value:toDate:options:", 16, 1, v91, 0));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "dateByAddingUnit:value:toDate:options:", 16, 1, v92, 0));

          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "endDate"));
          v69 = objc_msgSend(v33, "compare:", v68);

          v28 = v33;
          v44 = v32;
          v7 = v78;
          v8 = v80;
          self = v76;
        }
        while (v69 == (id)-1);
      }
      else
      {
        v32 = (void *)v29;
        v33 = v28;
        v8 = v80;
      }
      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      v34 = v8;
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v96;
        do
        {
          for (k = 0; k != v36; k = (char *)k + 1)
          {
            if (*(_QWORD *)v96 != v37)
              objc_enumerationMutation(v34);
            objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)k), "setSummarizationGranularity:", 1);
          }
          v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
        }
        while (v36);
      }

      v39 = v34;
      v9 = v74;
      v6 = v75;
      v10 = v73;
      p_super = &v94->super.super;
    }
    else
    {
      v42 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      p_super = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_INFO, "FineGranularityAggregation: media play sessions bundles are filtered.", buf, 2u);
      }
      v39 = 0;
    }

  }
  else
  {
    v41 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(&v8->super.super, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v110 = objc_msgSend(v6, "count");
      _os_log_impl((void *)&_mh_execute_header, &v8->super.super, OS_LOG_TYPE_INFO, "FineGranularityAggregation: no needed to generate media bundles since bundles  count is: %lu", buf, 0xCu);
    }
    v39 = 0;
  }

  return v39;
}

- (id)_getEventBundleByCategoryGroup:(id)a3 isFirstPartyApp:(BOOL)a4
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *v16;
  id obj;
  _BOOL4 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v18 = a4;
  v4 = a3;
  v16 = objc_opt_new(NSMutableArray);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v10 = objc_autoreleasePoolPush();
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "resources"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "getDictionary"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerBundleID")));

        if (v14
          && +[MOMediaPlaySession isFirstPartyApp:](MOMediaPlaySession, "isFirstPartyApp:", v14) == v18)
        {
          -[NSMutableArray addObject:](v16, "addObject:", v9);
        }

        objc_autoreleasePoolPop(v10);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  return v16;
}

- (id)_getEventBundleBasedOnMediaTypeEnumForThirdPartyApps:(id)a3 startTime:(id)a4 endTime:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  id v21;
  NSMutableArray *v23;
  id v24;
  id obj;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v7 = a3;
  v26 = a4;
  v24 = a5;
  v23 = objc_opt_new(NSMutableArray);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v11);
        v13 = objc_autoreleasePoolPush();
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "resources"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "getDictionary"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerBundleID")));

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startDate"));
        if ((objc_msgSend(v18, "isAfterDate:", v26) & 1) == 0)
          goto LABEL_10;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startDate"));
        if (!objc_msgSend(v19, "isBeforeDate:", v24)
          || +[MOMediaPlaySession isFirstPartyApp:](MOMediaPlaySession, "isFirstPartyApp:", v17))
        {

LABEL_10:
          goto LABEL_11;
        }
        v20 = objc_msgSend(v17, "hasPrefix:", CFSTR("com.apple"));

        if ((v20 & 1) == 0)
          -[NSMutableArray addObject:](v23, "addObject:", v12);
LABEL_11:

        objc_autoreleasePoolPop(v13);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      v9 = v21;
    }
    while (v21);
  }

  return v23;
}

- (unsigned)_isFirstPartyApp:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "mediaEvent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mediaPlayerBundleId"));

  v5 = v4 && (objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple.")) & 1) != 0;
  return v5;
}

- (id)_getEventBundleBasedOnMediaTypeEnum:(id)a3 playSessionMediaType:(unint64_t)a4 startTime:(id)a5 endTime:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  NSMutableArray *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v8 = a3;
  v9 = a5;
  v10 = a6;
  v21 = objc_opt_new(NSMutableArray);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startDate"));
        if ((objc_msgSend(v17, "isAfterDate:", v9) & 1) != 0)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startDate"));
          v19 = objc_msgSend(v18, "isBeforeDate:", v10);

          if (v19)
            -[NSMutableArray addObject:](v21, "addObject:", v16);
        }
        else
        {

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);
  }

  return v21;
}

- (id)getMediaOnRepeatBundleDaily:(id)a3 mediaTypeEnum:(unint64_t)a4 parameters:(id)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  MOEventBundle *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id os_log;
  NSObject *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  MOEventBundle *v46;
  NSMutableArray *v47;
  void *v48;
  MOEventBundle *v49;
  id v50;
  __CFString *v51;
  __CFString *v52;
  void *v53;
  void *v54;
  void *v55;
  MOAction *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  NSObject *v64;
  id v66;
  id v67;
  MOMediaAggregationManager *v68;
  id obj;
  MOEventBundle *v70;
  NSMutableArray *v71;
  NSMutableArray *v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t buf[4];
  const char *v82;
  __int16 v83;
  MOEventBundle *v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  void *v88;
  _BYTE v89[128];

  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "count"))
  {
    v66 = v8;
    v67 = v7;
    v68 = self;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _sortBundlesBySumPlaytime:](self, "_sortBundlesBySumPlaytime:", v7));
    v71 = objc_opt_new(NSMutableArray);
    v72 = objc_opt_new(NSMutableArray);
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    obj = v9;
    v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
    if (v74)
    {
      v73 = *(_QWORD *)v78;
      v10 = 0.0;
      v11 = 0.0;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v78 != v73)
            objc_enumerationMutation(obj);
          v13 = *(MOEventBundle **)(*((_QWORD *)&v77 + 1) + 8 * v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v13, "events"));
          v15 = objc_msgSend(v14, "count");
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v13, "resources"));
          v17 = objc_msgSend(v16, "count");

          v75 = v12;
          if (v15 == v17)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v13, "resources"));
            v19 = objc_msgSend(v18, "count");

            if (v19)
            {
              v20 = 0;
              do
              {
                v21 = objc_autoreleasePoolPush();
                v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v13, "resources"));
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", v20));

                v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "getDictionary"));
                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerSumPlaytime")));

                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "getDictionary"));
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerDuration")));

                v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "getDictionary"));
                v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKey:", CFSTR("media_type")));
                v30 = (int)objc_msgSend(v29, "intValue");

                if (v30 == a4)
                {
                  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                  v32 = objc_claimAutoreleasedReturnValue(os_log);
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                  {
                    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "getDictionary"));
                    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerTitle")));
                    v70 = (MOEventBundle *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", v43));
                    *(_DWORD *)buf = 136315906;
                    v82 = "-[MOMediaAggregationManager getMediaOnRepeatBundleDaily:mediaTypeEnum:parameters:]";
                    v83 = 2112;
                    v84 = v70;
                    v85 = 2112;
                    v86 = v27;
                    v87 = 2112;
                    v88 = v25;
                    _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "%s, media on repeat daily bundle with media title, %@, duration, %@, total play time, %@", buf, 0x2Au);

                  }
                  if (v27)
                  {
                    if ((int)objc_msgSend(v27, "intValue") >= 1)
                    {
                      objc_msgSend(v25, "doubleValue");
                      v34 = v33;
                      objc_msgSend(v27, "doubleValue");
                      if (v34 / v35 >= 2.95)
                      {
                        objc_msgSend(v25, "doubleValue");
                        v11 = v11 + v36;
                        objc_msgSend(v27, "doubleValue");
                        v10 = v10 + v37;
                        v38 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v13, "events"));
                        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectAtIndexedSubscript:", v20));
                        -[NSMutableArray addObject:](v72, "addObject:", v39);

                        -[NSMutableArray addObject:](v71, "addObject:", v23);
                      }
                    }
                  }
                }

                objc_autoreleasePoolPop(v21);
                ++v20;
                v40 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v13, "resources"));
                v41 = objc_msgSend(v40, "count");

              }
              while ((unint64_t)v41 > v20);
            }
          }
          else
          {
            v44 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            v45 = objc_claimAutoreleasedReturnValue(v44);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v82 = "-[MOMediaAggregationManager getMediaOnRepeatBundleDaily:mediaTypeEnum:parameters:]";
              v83 = 2112;
              v84 = v13;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "%s, media bundle had bad data, %@", buf, 0x16u);
            }

          }
          v12 = v75 + 1;
        }
        while ((id)(v75 + 1) != v74);
        v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
      }
      while (v74);
    }
    else
    {
      v10 = 0.0;
      v11 = 0.0;
    }

    v47 = v71;
    if (-[NSMutableArray count](v71, "count"))
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _sortResourcesBySumPlaytime:](v68, "_sortResourcesBySumPlaytime:", v71));
      v49 = [MOEventBundle alloc];
      v50 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v72);
      v46 = -[MOEventBundle initWithEventSet:filtered:](v49, "initWithEventSet:filtered:", v50, 0);

      -[MOEventBundle setInterfaceType:](v46, "setInterfaceType:", 5);
      v51 = CFSTR("song_on_repeat");
      if ((unint64_t)-[NSMutableArray count](v71, "count") >= 2)
      {
        v52 = CFSTR("songs_on_repeat");

        v51 = v52;
      }
      -[MOEventBundle setBundleSuperType:](v46, "setBundleSuperType:", 4);
      -[MOEventBundle setBundleSubType:](v46, "setBundleSubType:", 401);
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "promptLanguage"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, etc."), v54));
      -[MOEventBundle setPromptLanguage:](v46, "setPromptLanguage:", v55);

      v56 = -[MOAction initWithActionName:actionType:actionSubtype:]([MOAction alloc], "initWithActionName:actionType:actionSubtype:", v51, 1, 6);
      -[MOEventBundle setAction:](v46, "setAction:", v56);

      v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v72, "firstObject"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "eventIdentifier"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v46, "action"));
      objc_msgSend(v59, "setSourceEventIdentifier:", v58);

      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "labels"));
      -[MOEventBundle setLabels:](v46, "setLabels:", v61);

      v8 = v66;
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _limitMOResourcesAndUpdatePriority:parameters:isSong:isFirstPartyApp:](v68, "_limitMOResourcesAndUpdatePriority:parameters:isSong:isFirstPartyApp:", v48, v66, 1, 1));
      -[MOEventBundle setResources:](v46, "setResources:", v62);

      -[MOMediaAggregationManager _updateRankingDictionary:mediaLength:sumPlaytime:mediaActionIsRepeat:](v68, "_updateRankingDictionary:mediaLength:sumPlaytime:mediaActionIsRepeat:", v46, 1, v10, v11);
      v63 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      v64 = objc_claimAutoreleasedReturnValue(v63);
      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v82 = "-[MOMediaAggregationManager getMediaOnRepeatBundleDaily:mediaTypeEnum:parameters:]";
        v83 = 2112;
        v84 = v46;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "%s, bundle, %@, event category, Song on repeat", buf, 0x16u);
      }

      v47 = v71;
    }
    else
    {
      v46 = 0;
      v8 = v66;
    }

    v7 = v67;
  }
  else
  {
    v46 = 0;
  }

  return v46;
}

- (id)getMediaOnRepeatBundleDailyForThirdPartyApp:(id)a3 mediaTypeEnum:(unint64_t)a4 parameters:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  uint64_t v19;
  MOEventBundle *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id os_log;
  NSObject *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  MOEventBundle *v52;
  id v53;
  NSObject *v54;
  NSMutableArray *v55;
  void *v56;
  MOEventBundle *v57;
  id v58;
  MOEventBundle *v59;
  __CFString *v60;
  void *v61;
  void *v62;
  void *v63;
  MOAction *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  NSObject *v74;
  void *v75;
  void *v77;
  NSMutableArray *v78;
  NSMutableDictionary *v79;
  id v80;
  uint64_t v81;
  void *v82;
  id v83;
  id obj;
  MOMediaAggregationManager *v85;
  void *v86;
  void *v87;
  NSMutableArray *v88;
  NSMutableArray *v89;
  uint64_t v90;
  void *v91;
  id v92;
  void *context;
  uint64_t v94;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint8_t buf[4];
  const char *v105;
  __int16 v106;
  MOEventBundle *v107;
  __int16 v108;
  void *v109;
  __int16 v110;
  void *v111;
  _BYTE v112[128];
  _BYTE v113[128];

  v7 = a3;
  v80 = a5;
  v85 = self;
  v77 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _groupBundleByApps:](self, "_groupBundleByApps:", v7));
  v79 = objc_opt_new(NSMutableDictionary);
  v78 = objc_opt_new(NSMutableArray);
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allKeys"));
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v113, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v101;
    v81 = *(_QWORD *)v101;
    v82 = v8;
    do
    {
      v12 = 0;
      v83 = v10;
      do
      {
        if (*(_QWORD *)v101 != v11)
          objc_enumerationMutation(obj);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)v12)));
        v14 = v13;
        if (v13 && objc_msgSend(v13, "count"))
        {
          v86 = v14;
          v87 = v12;
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _sortBundlesBySumPlaytime:](v85, "_sortBundlesBySumPlaytime:", v14));
          v89 = objc_opt_new(NSMutableArray);
          v88 = objc_opt_new(NSMutableArray);
          v96 = 0u;
          v97 = 0u;
          v98 = 0u;
          v99 = 0u;
          v16 = v15;
          v92 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v96, v112, 16);
          if (v92)
          {
            v90 = *(_QWORD *)v97;
            v91 = v16;
            v17 = 0.0;
            v18 = 0.0;
            do
            {
              v19 = 0;
              do
              {
                if (*(_QWORD *)v97 != v90)
                  objc_enumerationMutation(v16);
                v20 = *(MOEventBundle **)(*((_QWORD *)&v96 + 1) + 8 * v19);
                v21 = objc_autoreleasePoolPush();
                v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v20, "events"));
                v23 = objc_msgSend(v22, "count");
                v24 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v20, "resources"));
                v25 = objc_msgSend(v24, "count");

                context = v21;
                v94 = v19;
                if (v23 == v25)
                {
                  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v20, "resources"));
                  v27 = objc_msgSend(v26, "count");

                  if (v27)
                  {
                    v28 = 0;
                    do
                    {
                      v29 = objc_autoreleasePoolPush();
                      v30 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v20, "resources"));
                      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectAtIndexedSubscript:", v28));

                      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "getDictionary"));
                      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerSumPlaytime")));

                      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "getDictionary"));
                      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerDuration")));

                      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "getDictionary"));
                      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKey:", CFSTR("media_type")));
                      v38 = (int)objc_msgSend(v37, "intValue");

                      if (v38 == a4)
                      {
                        os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                        v40 = objc_claimAutoreleasedReturnValue(os_log);
                        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                        {
                          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "getDictionary"));
                          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerTitle")));
                          v52 = (MOEventBundle *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", v51));
                          *(_DWORD *)buf = 136315906;
                          v105 = "-[MOMediaAggregationManager getMediaOnRepeatBundleDailyForThirdPartyApp:mediaTypeEnum:parameters:]";
                          v106 = 2112;
                          v107 = v52;
                          v108 = 2112;
                          v109 = v35;
                          v110 = 2112;
                          v111 = v33;
                          _os_log_debug_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "%s, third party media on repeat daily bundle with media title, %@, duration, %@, total play time, %@", buf, 0x2Au);

                        }
                        if (v35)
                        {
                          if ((int)objc_msgSend(v35, "intValue") >= 1)
                          {
                            objc_msgSend(v33, "doubleValue");
                            v42 = v41;
                            objc_msgSend(v35, "doubleValue");
                            if (v42 / v43 >= 2.95)
                            {
                              objc_msgSend(v33, "doubleValue");
                              v18 = v18 + v44;
                              objc_msgSend(v35, "doubleValue");
                              v17 = v17 + v45;
                              v46 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v20, "events"));
                              v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectAtIndexedSubscript:", v28));
                              -[NSMutableArray addObject:](v88, "addObject:", v47);

                              -[NSMutableArray addObject:](v89, "addObject:", v31);
                            }
                          }
                        }
                      }

                      objc_autoreleasePoolPop(v29);
                      ++v28;
                      v48 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v20, "resources"));
                      v49 = objc_msgSend(v48, "count");

                    }
                    while ((unint64_t)v49 > v28);
                  }
                }
                else
                {
                  v53 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                  v54 = objc_claimAutoreleasedReturnValue(v53);
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 136315394;
                    v105 = "-[MOMediaAggregationManager getMediaOnRepeatBundleDailyForThirdPartyApp:mediaTypeEnum:parameters:]";
                    v106 = 2112;
                    v107 = v20;
                    _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "%s, media bundle had bad data, %@", buf, 0x16u);
                  }

                }
                objc_autoreleasePoolPop(context);
                v19 = v94 + 1;
                v16 = v91;
              }
              while ((id)(v94 + 1) != v92);
              v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v96, v112, 16);
            }
            while (v92);
          }
          else
          {
            v17 = 0.0;
            v18 = 0.0;
          }

          v55 = v89;
          if (-[NSMutableArray count](v89, "count"))
          {
            v56 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _sortResourcesBySumPlaytime:](v85, "_sortResourcesBySumPlaytime:", v89));
            v57 = [MOEventBundle alloc];
            v58 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v88);
            v59 = -[MOEventBundle initWithEventSet:filtered:](v57, "initWithEventSet:filtered:", v58, 0);

            -[MOEventBundle setInterfaceType:](v59, "setInterfaceType:", 5);
            v60 = CFSTR("media_on_repeat_third_party");
            -[MOEventBundle setBundleSuperType:](v59, "setBundleSuperType:", 4);
            -[MOEventBundle setBundleSubType:](v59, "setBundleSubType:", 407);
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "promptLanguage"));
            v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, etc."), v62));
            -[MOEventBundle setPromptLanguage:](v59, "setPromptLanguage:", v63);

            v64 = -[MOAction initWithActionName:actionType:actionSubtype:]([MOAction alloc], "initWithActionName:actionType:actionSubtype:", v60, 1, 6);
            -[MOEventBundle setAction:](v59, "setAction:", v64);

            v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));
            v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "labels"));
            -[MOEventBundle setLabels:](v59, "setLabels:", v66);

            v67 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _limitMOResourcesAndUpdatePriority:parameters:isSong:isFirstPartyApp:](v85, "_limitMOResourcesAndUpdatePriority:parameters:isSong:isFirstPartyApp:", v56, v80, 1, 0));
            -[MOEventBundle setResources:](v59, "setResources:", v67);

            -[MOEventBundle setIsAggregatedAndSuppressed:](v59, "setIsAggregatedAndSuppressed:", 1);
            -[MOMediaAggregationManager _updateRankingDictionary:mediaLength:sumPlaytime:mediaActionIsRepeat:](v85, "_updateRankingDictionary:mediaLength:sumPlaytime:mediaActionIsRepeat:", v59, 1, v17, v18);
            v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v18));
            v69 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v59, "resources"));
            v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "firstObject"));
            v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "getDictionary"));
            v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerBundleID")));
            -[NSMutableDictionary setValue:forKey:](v79, "setValue:forKey:", v68, v72);

            -[NSMutableArray addObject:](v78, "addObject:", v59);
            v73 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            v74 = objc_claimAutoreleasedReturnValue(v73);
            if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v105 = "-[MOMediaAggregationManager getMediaOnRepeatBundleDailyForThirdPartyApp:mediaTypeEnum:parameters:]";
              v106 = 2112;
              v107 = v59;
              _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, "%s, bundle, %@, event category, Media on repeat for third party apps", buf, 0x16u);
            }

            v55 = v89;
          }

          v11 = v81;
          v8 = v82;
          v10 = v83;
          v14 = v86;
          v12 = v87;
        }

        v12 = (char *)v12 + 1;
      }
      while (v12 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v113, 16);
    }
    while (v10);
  }

  v75 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _sortAndMergeBundlesForThirdPartyApps:playtimeDict:paramters:mediaActionIsRepeat:](v85, "_sortAndMergeBundlesForThirdPartyApps:playtimeDict:paramters:mediaActionIsRepeat:", v78, v79, v80, 1));
  return v75;
}

- (id)_sortAndLimitBundlesForThirdPartyApps:(id)a3 playtimeDict:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  id v23;
  id v24;
  int v25;
  NSMutableArray *v26;
  id obj;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v5 = a3;
  v6 = a4;
  if ((unint64_t)objc_msgSend(v5, "count") > 2)
  {
    v23 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keysSortedByValueUsingComparator:", &__block_literal_global_97));
    v26 = objc_opt_new(NSMutableArray);
    v28 = v7;
    if (objc_msgSend(v7, "count"))
    {
      v8 = 0;
      v9 = 0;
      v24 = v5;
      do
      {
        v25 = v8;
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        obj = v5;
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v30;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(_QWORD *)v30 != v12)
                objc_enumerationMutation(obj);
              v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
              v15 = objc_autoreleasePoolPush();
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "resources"));
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "getDictionary"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerBundleID")));

              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndexedSubscript:", v9));
              LODWORD(v17) = objc_msgSend(v20, "isEqualToString:", v19);

              if ((_DWORD)v17)
                -[NSMutableArray addObject:](v26, "addObject:", v14);

              objc_autoreleasePoolPop(v15);
            }
            v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          }
          while (v11);
        }

        v21 = (unint64_t)objc_msgSend(v28, "count") > v9 + 1;
        v9 = 1;
        v8 = 1;
        v5 = v24;
      }
      while ((v21 & ~v25 & 1) != 0);
    }

    v6 = v23;
  }
  else
  {
    v26 = (NSMutableArray *)v5;
  }

  return v26;
}

int64_t __80__MOMediaAggregationManager__sortAndLimitBundlesForThirdPartyApps_playtimeDict___block_invoke(id a1, id a2, id a3)
{
  return (int64_t)objc_msgSend(a3, "compare:", a2);
}

- (void)_updateRankingDictionary:(id)a3 mediaLength:(double)a4 sumPlaytime:(double)a5 mediaActionIsRepeat:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a6;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
  objc_msgSend(v9, "addMetaDataForRankForKey:value:", CFSTR("MediaLength"), v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5));
  objc_msgSend(v9, "addMetaDataForRankForKey:value:", CFSTR("MediaTotalPlayTime"), v11);

  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));
  objc_msgSend(v9, "addMetaDataForRankForKey:value:", CFSTR("MediaActionIsRepeat"), v12);

}

- (id)getPlayedMediaBundleDaily:(id)a3 mediaTypeEnum:(unint64_t)a4 parameters:(id)a5 isPlayedSong:(BOOL)a6 songOnRepeatBundles:(id)a7
{
  id v10;
  id v11;
  double v12;
  double v13;
  uint64_t v14;
  MOEventBundle *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  MOEventBundle *v27;
  id os_log;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  float v43;
  float v44;
  float v45;
  double v46;
  double v47;
  double v48;
  double v49;
  float v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  NSObject *v59;
  MOEventBundle *v60;
  NSMutableArray *v61;
  void *v62;
  MOEventBundle *v63;
  id v64;
  void *v65;
  __CFString *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  __CFString **v73;
  void *v74;
  void *v75;
  void *v76;
  MOAction *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  NSObject *v84;
  void *v86;
  void *v87;
  MOEventBundle *v88;
  id obj;
  _BOOL4 v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  NSMutableArray *v94;
  NSMutableArray *v95;
  id v96;
  MOMediaAggregationManager *v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint8_t buf[4];
  const char *v104;
  __int16 v105;
  MOEventBundle *v106;
  __int16 v107;
  void *v108;
  __int16 v109;
  NSObject *v110;
  _BYTE v111[128];

  v90 = a6;
  v10 = a3;
  v96 = a5;
  v11 = a7;
  if (!objc_msgSend(v10, "count"))
  {
    v60 = 0;
    goto LABEL_53;
  }
  v94 = objc_opt_new(NSMutableArray);
  v95 = objc_opt_new(NSMutableArray);
  v86 = v10;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _sortBundlesBySumPlaytime:](self, "_sortBundlesBySumPlaytime:", v10));
  v98 = self;
  v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v111, 16);
  if (!v92)
  {
    v12 = 0.0;
    v13 = 0.0;
    goto LABEL_41;
  }
  v91 = *(_QWORD *)v100;
  v12 = 0.0;
  v13 = 0.0;
  do
  {
    v14 = 0;
    do
    {
      if (*(_QWORD *)v100 != v91)
        objc_enumerationMutation(obj);
      v15 = *(MOEventBundle **)(*((_QWORD *)&v99 + 1) + 8 * v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v15, "events"));
      v17 = objc_msgSend(v16, "count");
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v15, "resources"));
      v19 = objc_msgSend(v18, "count");

      v93 = v14;
      if (v17 == v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v15, "resources"));
        v21 = objc_msgSend(v20, "count");

        if (v21)
        {
          v22 = 0;
          do
          {
            v23 = objc_autoreleasePoolPush();
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v15, "resources"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", v22));

            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "getDictionary"));
            v27 = (MOEventBundle *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerTitle")));

            if (-[MOMediaAggregationManager _isInSongOnRepetBundles:mediaTitle:](self, "_isInSongOnRepetBundles:mediaTitle:", v11, v27))
            {
              os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
              v29 = objc_claimAutoreleasedReturnValue(os_log);
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v104 = "-[MOMediaAggregationManager getPlayedMediaBundleDaily:mediaTypeEnum:parameters:isPlayedSong:songO"
                       "nRepeatBundles:]";
                v105 = 2112;
                v106 = v27;
                _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "%s, played song filtered by song on repeat bundle with title, %@", buf, 0x16u);
              }
              goto LABEL_27;
            }
            v30 = v11;
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "getDictionary"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKey:", CFSTR("media_type")));
            v33 = (int)objc_msgSend(v32, "intValue");

            if (v33 != a4)
            {
              v11 = v30;
              self = v98;
              goto LABEL_29;
            }
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "getDictionary"));
            v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerSumPlaytime")));

            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "getDictionary"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerDuration")));

            v37 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            v38 = objc_claimAutoreleasedReturnValue(v37);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "getDictionary"));
              v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerTitle")));
              v88 = (MOEventBundle *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", v87));
              *(_DWORD *)buf = 136315906;
              v104 = "-[MOMediaAggregationManager getPlayedMediaBundleDaily:mediaTypeEnum:parameters:isPlayedSong:songOnRepeatBundles:]";
              v105 = 2112;
              v106 = v88;
              v107 = 2112;
              v108 = v36;
              v109 = 2112;
              v110 = v29;
              _os_log_debug_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "%s, played media with media title inside daily media bundle, %@, duration, %@, total play time, %@", buf, 0x2Au);

            }
            if (!v36
              || (int)objc_msgSend(v36, "intValue") < 1
              || (-[NSObject doubleValue](v29, "doubleValue"),
                  v40 = v39,
                  objc_msgSend(v36, "doubleValue"),
                  v42 = v40 / v41,
                  objc_msgSend(v96, "coarseGranularity_mediaBundleAggregationPodcastPlayTimePercentageThreshold"),
                  v42 < v43))
            {
              v44 = (float)(uint64_t)-[NSObject longValue](v29, "longValue");
              objc_msgSend(v96, "coarseGranularity_mediaBundleAggregationPodcastTotalPlayTimeThreshold");
              if (v45 > v44)
              {
                if (v36
                  && (int)objc_msgSend(v36, "intValue") >= 1
                  && (-[NSObject doubleValue](v29, "doubleValue"),
                      v47 = v46,
                      objc_msgSend(v36, "doubleValue"),
                      v49 = v47 / v48,
                      objc_msgSend(v96, "coarseGranularity_mediaBundleAggregationPodcastPlayTimePercentageThreshold"),
                      v49 >= v50))
                {
                  if (!v90)
                    goto LABEL_26;
                }
                else if ((uint64_t)-[NSObject longValue](v29, "longValue") < 90 || !v90)
                {
                  goto LABEL_26;
                }
              }
            }
            -[NSMutableArray addObject:](v94, "addObject:", v25);
            v51 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v15, "events"));
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectAtIndexedSubscript:", v22));
            -[NSMutableArray addObject:](v95, "addObject:", v52);

            -[NSObject doubleValue](v29, "doubleValue");
            v13 = v13 + v53;
            objc_msgSend(v36, "doubleValue");
            v12 = v12 + v54;
LABEL_26:

            v11 = v30;
            self = v98;
LABEL_27:

LABEL_29:
            objc_autoreleasePoolPop(v23);
            ++v22;
            v55 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v15, "resources"));
            v56 = objc_msgSend(v55, "count");

          }
          while ((unint64_t)v56 > v22);
        }
      }
      else
      {
        v58 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        v59 = objc_claimAutoreleasedReturnValue(v58);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v104 = "-[MOMediaAggregationManager getPlayedMediaBundleDaily:mediaTypeEnum:parameters:isPlayedSong:songOnRepeatBundles:]";
          v105 = 2112;
          v106 = v15;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "%s, media bundle has bad data, %@", buf, 0x16u);
        }

      }
      v14 = v93 + 1;
    }
    while ((id)(v93 + 1) != v92);
    v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v111, 16);
  }
  while (v92);
LABEL_41:

  v61 = v94;
  if (-[NSMutableArray count](v94, "count"))
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _sortResourcesBySumPlaytime:](self, "_sortResourcesBySumPlaytime:", v94));
    v63 = [MOEventBundle alloc];
    v64 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v95);
    v60 = -[MOEventBundle initWithEventSet:filtered:](v63, "initWithEventSet:filtered:", v64, 0);

    -[MOEventBundle setInterfaceType:](v60, "setInterfaceType:", 5);
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _limitMOResourcesAndUpdatePriority:parameters:isSong:isFirstPartyApp:](self, "_limitMOResourcesAndUpdatePriority:parameters:isSong:isFirstPartyApp:", v62, v96, v90, 1));
    -[MOEventBundle setResources:](v60, "setResources:", v65);

    -[MOEventBundle setBundleSuperType:](v60, "setBundleSuperType:", 4);
    v10 = v86;
    if (v90)
    {
      v66 = CFSTR("played_song");
      -[MOEventBundle setBundleSubType:](v60, "setBundleSubType:", 402);
    }
    else
    {
      v67 = v11;
      v68 = objc_autoreleasePoolPush();
      v69 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v60, "resources"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "firstObject"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "getDictionary"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerMediaTypeKey")));

      v73 = kMOMediaPlayAnnotationManagerStringPrefixPlayedPodcasts;
      if ((unint64_t)-[NSMutableArray count](v94, "count") <= 1
        && !objc_msgSend(v72, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypePodcastArtist[0]))
      {
        v73 = kMOMediaPlayAnnotationManagerStringPrefixPlayedPodcast;
      }
      v66 = *v73;
      -[MOEventBundle setBundleSubType:](v60, "setBundleSubType:", 403);

      objc_autoreleasePoolPop(v68);
      v11 = v67;
    }
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "firstObject"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "promptLanguage"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, etc."), v75));
    -[MOEventBundle setPromptLanguage:](v60, "setPromptLanguage:", v76);

    v77 = -[MOAction initWithActionName:actionType:actionSubtype:]([MOAction alloc], "initWithActionName:actionType:actionSubtype:", v66, 1, 6);
    -[MOEventBundle setAction:](v60, "setAction:", v77);

    v78 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v95, "firstObject"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "eventIdentifier"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v60, "action"));
    objc_msgSend(v80, "setSourceEventIdentifier:", v79);

    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "firstObject"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "labels"));
    -[MOEventBundle setLabels:](v60, "setLabels:", v82);

    -[MOMediaAggregationManager _updateRankingDictionary:mediaLength:sumPlaytime:mediaActionIsRepeat:](v98, "_updateRankingDictionary:mediaLength:sumPlaytime:mediaActionIsRepeat:", v60, 0, v12, v13);
    v83 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v84 = objc_claimAutoreleasedReturnValue(v83);
    if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v104 = "-[MOMediaAggregationManager getPlayedMediaBundleDaily:mediaTypeEnum:parameters:isPlayedSong:songOnRepeatBundles:]";
      v105 = 2112;
      v106 = v60;
      _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_INFO, "%s, bundle, %@, event category, Played Media", buf, 0x16u);
    }

    v61 = v94;
  }
  else
  {
    v60 = 0;
    v10 = v86;
  }

LABEL_53:
  return v60;
}

- (BOOL)_isInSongOnRepetBundles:(id)a3 mediaTitle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resources"));

    LOBYTE(v8) = 0;
    if (v6 && v7)
    {
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resources"));
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v19 != v12)
              objc_enumerationMutation(v9);
            v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
            v14 = objc_autoreleasePoolPush();
            if (!v8)
              goto LABEL_20;
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getDictionary", (_QWORD)v18));

            if (!v15)
            {
              LOBYTE(v8) = 0;
LABEL_20:
              objc_autoreleasePoolPop(v14);
              goto LABEL_21;
            }
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getDictionary"));
            v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerTitle")));

            if (v8 && objc_msgSend(v8, "isEqualToString:", v6))
            {

              LOBYTE(v8) = 1;
              goto LABEL_20;
            }

            objc_autoreleasePoolPop(v14);
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          LOBYTE(v8) = 0;
          if (v11)
            continue;
          break;
        }
      }
      else
      {
        LOBYTE(v8) = 0;
      }
LABEL_21:

    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return (char)v8;
}

- (id)getPlayedMediaBundleDailyForThirdPartyApp:(id)a3 mediaTypeEnum:(unint64_t)a4 parameters:(id)a5 songOnRepeatBundles:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *j;
  MOEventBundle *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  MOEventBundle *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id os_log;
  NSObject *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  float v47;
  float v48;
  float v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  NSObject *v58;
  NSMutableArray *v59;
  void *v60;
  MOEventBundle *v61;
  id v62;
  MOEventBundle *v63;
  void *v64;
  __CFString *v65;
  void *v66;
  void *v67;
  void *v68;
  MOAction *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  NSObject *v78;
  void *v79;
  NSMutableDictionary *v81;
  NSMutableArray *v82;
  id obj;
  void *v84;
  uint64_t v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  MOEventBundle *v92;
  id v93;
  id v94;
  uint64_t v95;
  id v96;
  NSMutableArray *v97;
  NSMutableArray *v98;
  id v99;
  MOMediaAggregationManager *v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint8_t buf[4];
  const char *v111;
  __int16 v112;
  MOEventBundle *v113;
  __int16 v114;
  void *v115;
  __int16 v116;
  NSObject *v117;
  _BYTE v118[128];
  _BYTE v119[128];

  v9 = a3;
  v94 = a5;
  v10 = a6;
  v101 = self;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _groupBundleByApps:](self, "_groupBundleByApps:", v9));
  v82 = objc_opt_new(NSMutableArray);
  v81 = objc_opt_new(NSMutableDictionary);
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v86 = v11;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allKeys"));
  v87 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v119, 16);
  if (v87)
  {
    v85 = *(_QWORD *)v107;
    v99 = v10;
    v84 = v9;
    do
    {
      for (i = 0; i != v87; i = (char *)i + 1)
      {
        if (*(_QWORD *)v107 != v85)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * (_QWORD)i);
        v14 = objc_autoreleasePoolPush();
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "objectForKey:", v13));
        if (objc_msgSend(v9, "count"))
        {
          v89 = v14;
          v90 = i;
          v98 = objc_opt_new(NSMutableArray);
          v97 = objc_opt_new(NSMutableArray);
          v88 = v15;
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _sortBundlesBySumPlaytime:](v101, "_sortBundlesBySumPlaytime:", v15));
          v102 = 0u;
          v103 = 0u;
          v104 = 0u;
          v105 = 0u;
          v93 = v16;
          v96 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v102, v118, 16);
          if (!v96)
          {
            v17 = 0.0;
            v18 = 0.0;
            goto LABEL_38;
          }
          v95 = *(_QWORD *)v103;
          v17 = 0.0;
          v18 = 0.0;
          while (1)
          {
            for (j = 0; j != v96; j = (char *)j + 1)
            {
              if (*(_QWORD *)v103 != v95)
                objc_enumerationMutation(v93);
              v20 = *(MOEventBundle **)(*((_QWORD *)&v102 + 1) + 8 * (_QWORD)j);
              v21 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v20, "events"));
              v22 = objc_msgSend(v21, "count");
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v20, "resources"));
              v24 = objc_msgSend(v23, "count");

              if (v22 == v24)
              {
                v25 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v20, "resources"));
                v26 = objc_msgSend(v25, "count");

                if (v26)
                {
                  v27 = 0;
                  while (1)
                  {
                    v28 = objc_autoreleasePoolPush();
                    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v20, "resources"));
                    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndexedSubscript:", v27));

                    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "getDictionary"));
                    v32 = (MOEventBundle *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerTitle")));

                    if (-[MOMediaAggregationManager _isInSongOnRepetBundles:mediaTitle:](v101, "_isInSongOnRepetBundles:mediaTitle:", v10, v32))
                    {
                      break;
                    }
                    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "getDictionary"));
                    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKey:", CFSTR("media_type")));
                    v37 = (int)objc_msgSend(v36, "intValue");

                    if (v37 == a4)
                    {
                      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "getDictionary"));
                      v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerSumPlaytime")));

                      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "getDictionary"));
                      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerDuration")));

                      os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                      v42 = objc_claimAutoreleasedReturnValue(os_log);
                      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
                      {
                        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "getDictionary"));
                        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerTitle")));
                        v92 = (MOEventBundle *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", v91));
                        *(_DWORD *)buf = 136315906;
                        v111 = "-[MOMediaAggregationManager getPlayedMediaBundleDailyForThirdPartyApp:mediaTypeEnum:param"
                               "eters:songOnRepeatBundles:]";
                        v112 = 2112;
                        v113 = v92;
                        v114 = 2112;
                        v115 = v40;
                        v116 = 2112;
                        v117 = v34;
                        _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "%s, third party played media with media title inside daily media bundle, %@, duration, %@, total play time, %@", buf, 0x2Au);

                      }
                      if (!v40
                        || !objc_msgSend(v40, "intValue")
                        || (int)objc_msgSend(v40, "intValue") >= 1
                        && ((-[NSObject doubleValue](v34, "doubleValue"),
                             v44 = v43,
                             objc_msgSend(v40, "doubleValue"),
                             v46 = v44 / v45,
                             objc_msgSend(v94, "coarseGranularity_mediaBundleAggregationPodcastPlayTimePercentageThreshold"), v46 >= v47)|| (v48 = (float)(uint64_t)-[NSObject longValue](v34, "longValue"), objc_msgSend(v94, "coarseGranularity_mediaBundleAggregationPodcastTotalPlayTimeThreshold"), v49 <= v48)))
                      {
                        -[NSMutableArray addObject:](v98, "addObject:", v30);
                        v50 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v20, "events"));
                        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectAtIndexedSubscript:", v27));
                        -[NSMutableArray addObject:](v97, "addObject:", v51);

                        -[NSObject doubleValue](v34, "doubleValue");
                        v18 = v18 + v52;
                        objc_msgSend(v40, "doubleValue");
                        v17 = v17 + v53;
                      }

                      v10 = v99;
                      goto LABEL_28;
                    }
LABEL_29:

                    objc_autoreleasePoolPop(v28);
                    ++v27;
                    v54 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v20, "resources"));
                    v55 = objc_msgSend(v54, "count");

                    if ((unint64_t)v55 <= v27)
                      goto LABEL_34;
                  }
                  v33 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                  v34 = objc_claimAutoreleasedReturnValue(v33);
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 136315394;
                    v111 = "-[MOMediaAggregationManager getPlayedMediaBundleDailyForThirdPartyApp:mediaTypeEnum:parameter"
                           "s:songOnRepeatBundles:]";
                    v112 = 2112;
                    v113 = v32;
                    _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "%s, played song filtered by song on repeat bundle with title, %@", buf, 0x16u);
                  }
LABEL_28:

                  goto LABEL_29;
                }
              }
              else
              {
                v57 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                v58 = objc_claimAutoreleasedReturnValue(v57);
                if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315394;
                  v111 = "-[MOMediaAggregationManager getPlayedMediaBundleDailyForThirdPartyApp:mediaTypeEnum:parameters:"
                         "songOnRepeatBundles:]";
                  v112 = 2112;
                  v113 = v20;
                  _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "%s, media bundle has bad data, %@", buf, 0x16u);
                }

              }
LABEL_34:
              ;
            }
            v96 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v102, v118, 16);
            if (!v96)
            {
LABEL_38:

              v59 = v97;
              v9 = v84;
              if (-[NSMutableArray count](v97, "count"))
              {
                v60 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _sortResourcesBySumPlaytime:](v101, "_sortResourcesBySumPlaytime:", v98));
                v61 = [MOEventBundle alloc];
                v62 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v97);
                v63 = -[MOEventBundle initWithEventSet:filtered:](v61, "initWithEventSet:filtered:", v62, 0);

                -[MOEventBundle setInterfaceType:](v63, "setInterfaceType:", 5);
                v64 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _limitMOResourcesAndUpdatePriority:parameters:isSong:isFirstPartyApp:](v101, "_limitMOResourcesAndUpdatePriority:parameters:isSong:isFirstPartyApp:", v60, v94, 1, 0));
                -[MOEventBundle setResources:](v63, "setResources:", v64);

                v65 = CFSTR("played_media_third_party");
                -[MOEventBundle setBundleSuperType:](v63, "setBundleSuperType:", 4);
                -[MOEventBundle setBundleSubType:](v63, "setBundleSubType:", 408);
                v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "firstObject"));
                v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "promptLanguage"));
                v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, etc."), v67));
                -[MOEventBundle setPromptLanguage:](v63, "setPromptLanguage:", v68);

                v69 = -[MOAction initWithActionName:actionType:actionSubtype:]([MOAction alloc], "initWithActionName:actionType:actionSubtype:", v65, 1, 6);
                -[MOEventBundle setAction:](v63, "setAction:", v69);

                v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "firstObject"));
                v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "labels"));
                -[MOEventBundle setLabels:](v63, "setLabels:", v71);

                -[MOEventBundle setIsAggregatedAndSuppressed:](v63, "setIsAggregatedAndSuppressed:", 1);
                -[MOMediaAggregationManager _updateRankingDictionary:mediaLength:sumPlaytime:mediaActionIsRepeat:](v101, "_updateRankingDictionary:mediaLength:sumPlaytime:mediaActionIsRepeat:", v63, 0, v17, v18);
                v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v18));
                v73 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v63, "resources"));
                v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "firstObject"));
                v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "getDictionary"));
                v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerBundleID")));
                -[NSMutableDictionary setValue:forKey:](v81, "setValue:forKey:", v72, v76);

                -[NSMutableArray addObject:](v82, "addObject:", v63);
                v77 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                v78 = objc_claimAutoreleasedReturnValue(v77);
                if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315394;
                  v111 = "-[MOMediaAggregationManager getPlayedMediaBundleDailyForThirdPartyApp:mediaTypeEnum:parameters:"
                         "songOnRepeatBundles:]";
                  v112 = 2112;
                  v113 = v63;
                  _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "%s, bundle, %@, event category, third party Played Media", buf, 0x16u);
                }

                v10 = v99;
                v59 = v97;
              }

              v14 = v89;
              i = v90;
              v15 = v88;
              break;
            }
          }
        }

        objc_autoreleasePoolPop(v14);
      }
      v87 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v119, 16);
    }
    while (v87);
  }

  v79 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _sortAndMergeBundlesForThirdPartyApps:playtimeDict:paramters:mediaActionIsRepeat:](v101, "_sortAndMergeBundlesForThirdPartyApps:playtimeDict:paramters:mediaActionIsRepeat:", v82, v81, v94, 0));
  return v79;
}

- (id)_calculateStartDateFromEventBundles:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate", (_QWORD)v16));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "earlierDate:", v4));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));

          if (v12 == v13)
          {
            v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));

            v4 = (void *)v14;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_calculateEndDateFromEventBundles:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "endDate", (_QWORD)v16));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "laterDate:", v4));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "endDate"));

          if (v12 == v13)
          {
            v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "endDate"));

            v4 = (void *)v14;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_megaBundlesForCoarseGranularityFromMediaPlaySessionsBundles:(id)a3 paramters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  NSObject *p_super;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  id os_log;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  NSMutableArray *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  unsigned int v32;
  NSMutableArray *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  id v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSMutableArray *v51;
  id v52;
  id v53;
  uint64_t v54;
  void *j;
  id v56;
  NSObject *v57;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *context;
  id v66;
  id v67;
  NSMutableArray *v68;
  id obj;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  uint8_t v79[128];
  uint8_t buf[4];
  id v81;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "count"))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    p_super = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v81 = objc_msgSend(v6, "count");
      v13 = "CoarseGranularityAggregation: no needed to generate media bundles since bundles  count is: %lu";
      v14 = p_super;
      v15 = 12;
      goto LABEL_7;
    }
LABEL_8:
    v17 = 0;
    goto LABEL_43;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "aggregationDateInterval"));
  objc_msgSend(v8, "duration");
  v10 = v9;

  if (v10 < 604800.0)
  {
    v11 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    p_super = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v13 = "CoarseGranularityAggregation for contact: no needed to contact bundles since aggregation time interval is less than 7 days";
      v14 = p_super;
      v15 = 2;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v13, buf, v15);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v68 = objc_opt_new(NSMutableArray);
  v18 = objc_autoreleasePoolPush();
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("interfaceType"), 5));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filteredArrayUsingPredicate:", v19));
  if (objc_msgSend(v20, "count"))
  {
    v64 = v19;
    context = v18;
    v66 = v7;
    v67 = v6;
    v21 = objc_opt_new(NSMutableArray);
    v22 = objc_opt_new(NSMutableArray);
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    obj = v20;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(_QWORD *)v75 != v25)
            objc_enumerationMutation(obj);
          v27 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)i);
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "events"));
          v29 = objc_msgSend(v28, "count");

          if (v29)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "events"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "firstObject"));
            v32 = -[MOMediaAggregationManager _isFirstPartyApp:](self, "_isFirstPartyApp:", v31);

            if (v32)
              v33 = v21;
            else
              v33 = v22;
            -[NSMutableArray addObject:](v33, "addObject:", v27);
          }
        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
      }
      while (v24);
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v35 = objc_alloc((Class)NSDate);
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v37 = objc_msgSend(v35, "initWithTimeInterval:sinceDate:", v36, -604800.0);
    v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "startOfDayForDate:", v37));

    v39 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v81 = (id)v38;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for media: the earliest date for media bundle to be aggregated for coarse granularity: %@", buf, 0xCu);
    }

    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v42 = objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _getEventBundleBasedOnMediaTypeEnum:playSessionMediaType:startTime:endTime:](self, "_getEventBundleBasedOnMediaTypeEnum:playSessionMediaType:startTime:endTime:", v21, 1, v38, v41));

    v62 = (void *)v42;
    v7 = v66;
    v43 = objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _getMediaOnRepeatMegaBundle:mediaTypeEnum:parameters:](self, "_getMediaOnRepeatMegaBundle:mediaTypeEnum:parameters:", v42, 1, v66));
    if (v43)
      -[NSMutableArray addObject:](v68, "addObject:", v43);
    v61 = (void *)v43;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v45 = objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _getEventBundleBasedOnMediaTypeEnum:playSessionMediaType:startTime:endTime:](self, "_getEventBundleBasedOnMediaTypeEnum:playSessionMediaType:startTime:endTime:", v21, 2, v38, v44));

    v60 = (void *)v45;
    v46 = objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _getPlayedMediaMegaBundle:mediaTypeEnum:paramters:](self, "_getPlayedMediaMegaBundle:mediaTypeEnum:paramters:", v45, 2, v66));
    if (v46)
      -[NSMutableArray addObject:](v68, "addObject:", v46);
    v59 = (void *)v46;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _getEventBundleBasedOnMediaTypeEnum:playSessionMediaType:startTime:endTime:](self, "_getEventBundleBasedOnMediaTypeEnum:playSessionMediaType:startTime:endTime:", v22, 5, v38, v47));

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _getMediaOnRepeatMegaBundleForThirdParty:mediaTypeEnum:parameters:](self, "_getMediaOnRepeatMegaBundleForThirdParty:mediaTypeEnum:parameters:", v48, 5, v66));
    if (v49)
      -[NSMutableArray addObject:](v68, "addObject:", v49);
    v63 = (void *)v38;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _getPlayedMediaMegaBundleForThirdParty:mediaTypeEnum:paramters:](self, "_getPlayedMediaMegaBundleForThirdParty:mediaTypeEnum:paramters:", v48, 5, v66));
    if (v50)
      -[NSMutableArray addObject:](v68, "addObject:", v50);
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v51 = v68;
    v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v71;
      do
      {
        for (j = 0; j != v53; j = (char *)j + 1)
        {
          if (*(_QWORD *)v71 != v54)
            objc_enumerationMutation(v51);
          objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)j), "setSummarizationGranularity:", 2);
        }
        v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
      }
      while (v53);
    }

    objc_autoreleasePoolPop(context);
    p_super = v51;
    v17 = p_super;
    v6 = v67;
  }
  else
  {
    v56 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v57 = objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation: media play sessions bundles are filtered.", buf, 2u);
    }

    objc_autoreleasePoolPop(v18);
    v17 = 0;
    p_super = &v68->super.super;
  }
LABEL_43:

  return v17;
}

- (id)_getMediaOnRepeatMegaBundle:(id)a3 mediaTypeEnum:(unint64_t)a4 parameters:(id)a5
{
  id v8;
  double v9;
  double v10;
  void *i;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  MOEventBundle *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id os_log;
  NSObject *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  double v50;
  id v51;
  NSObject *v52;
  void *v53;
  void *v54;
  MOEventBundle *v55;
  MOEventBundle *v56;
  NSMutableArray *v57;
  MOEventBundle *v58;
  id v59;
  void *v60;
  __CFString *v61;
  __CFString *v62;
  void *v63;
  void *v64;
  void *v65;
  MOAction *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  id v77;
  NSObject *v78;
  MOMediaAggregationManager *v80;
  id v81;
  NSMutableArray *v82;
  NSMutableArray *v83;
  id obj;
  uint64_t v85;
  void *v86;
  id v87;
  void *v88;
  void *context;
  MOEventBundle *v90;
  NSMutableArray *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  id v96;
  id v97;
  uint64_t v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  uint8_t buf[4];
  const char *v108;
  __int16 v109;
  MOEventBundle *v110;
  __int16 v111;
  void *v112;
  __int16 v113;
  double v114;
  _BYTE v115[128];
  _BYTE v116[128];

  v8 = a3;
  v81 = a5;
  if (!objc_msgSend(v8, "count"))
  {
    v56 = 0;
    goto LABEL_57;
  }
  v82 = objc_opt_new(NSMutableArray);
  v83 = objc_opt_new(NSMutableArray);
  v80 = self;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _createMediaDictionaryFromBundles:](self, "_createMediaDictionaryFromBundles:", v8));
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "allKeys"));
  v87 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v116, 16);
  if (!v87)
  {
    v9 = 0.0;
    v10 = 0.0;
    goto LABEL_49;
  }
  v85 = *(_QWORD *)v104;
  v9 = 0.0;
  v10 = 0.0;
  do
  {
    for (i = 0; i != v87; i = (char *)i + 1)
    {
      if (*(_QWORD *)v104 != v85)
        objc_enumerationMutation(obj);
      v12 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * (_QWORD)i);
      context = objc_autoreleasePoolPush();
      v98 = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "objectForKeyedSubscript:", v12));
      v91 = objc_opt_new(NSMutableArray);
      v99 = 0u;
      v100 = 0u;
      v101 = 0u;
      v102 = 0u;
      v14 = v13;
      v97 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v99, v115, 16);
      if (v97)
      {
        v88 = i;
        v92 = 0;
        v15 = *(_QWORD *)v100;
        v16 = 0.0;
        v17 = 0.0;
        v96 = v14;
        v94 = 0;
        v95 = *(_QWORD *)v100;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v100 != v15)
              objc_enumerationMutation(v14);
            v19 = *(MOEventBundle **)(*((_QWORD *)&v99 + 1) + 8 * (_QWORD)v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v19, "events"));
            v21 = objc_msgSend(v20, "count");
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v19, "resources"));
            v23 = objc_msgSend(v22, "count");

            if (v21 == v23)
            {
              v24 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v19, "resources"));
              v25 = objc_msgSend(v24, "count");

              if (!v25)
                goto LABEL_23;
              v26 = 0;
              while (1)
              {
                v27 = objc_autoreleasePoolPush();
                v28 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v19, "resources"));
                v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndexedSubscript:", v26));

                v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "getDictionary"));
                v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", CFSTR("media_type")));
                v32 = (int)objc_msgSend(v31, "intValue");

                if (v32 == a4)
                {
                  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "getDictionary"));
                  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerTitle")));

                  if (objc_msgSend(v34, "isEqualToString:", v98))
                  {
                    if (!v94)
                    {
                      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "getDictionary"));
                      v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerDuration")));

                    }
                    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "getDictionary"));
                    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerSumPlaytime")));

                    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                    v42 = objc_claimAutoreleasedReturnValue(os_log);
                    v15 = v95;
                    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
                    {
                      v90 = (MOEventBundle *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", v34));
                      *(_DWORD *)buf = 136315906;
                      v108 = "-[MOMediaAggregationManager _getMediaOnRepeatMegaBundle:mediaTypeEnum:parameters:]";
                      v109 = 2112;
                      v110 = v90;
                      v111 = 2112;
                      v112 = v94;
                      v113 = 2112;
                      v114 = *(double *)&v93;
                      _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "%s, media title inside media on repeat weekly summary bundle, %@, duration, %@, total play time, %@", buf, 0x2Au);

                    }
                    objc_msgSend(v93, "doubleValue");
                    v17 = v17 + v43;
                    v10 = v10 + v17;
                    objc_msgSend(v94, "doubleValue");
                    v16 = v16 + v44;
                    v9 = v9 + v16;
                    v45 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v19, "events"));
                    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectAtIndexedSubscript:", v26));
                    -[NSMutableArray addObject:](v91, "addObject:", v46);

                    objc_autoreleasePoolPop(v27);
                    v92 = v29;
                    v14 = v96;
                    goto LABEL_23;
                  }

                }
                objc_autoreleasePoolPop(v27);
                ++v26;
                v35 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v19, "resources"));
                v36 = objc_msgSend(v35, "count");

                if ((unint64_t)v36 <= v26)
                {
                  v15 = v95;
                  v14 = v96;
                  goto LABEL_23;
                }
              }
            }
            v37 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            v38 = objc_claimAutoreleasedReturnValue(v37);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v108 = "-[MOMediaAggregationManager _getMediaOnRepeatMegaBundle:mediaTypeEnum:parameters:]";
              v109 = 2112;
              v110 = v19;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%s, media bundle has bad data, %@", buf, 0x16u);
            }

LABEL_23:
            v18 = (char *)v18 + 1;
          }
          while (v18 != v97);
          v47 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v99, v115, 16);
          v97 = v47;
        }
        while (v47);

        v48 = v92;
        if (v92)
        {
          i = v88;
          if (!-[NSMutableArray count](v91, "count"))
            goto LABEL_36;
          v49 = v94;
          if (!v94 || (int)objc_msgSend(v94, "intValue") < 1)
            goto LABEL_37;
          objc_msgSend(v94, "doubleValue");
          if (v17 / v50 < 2.95)
          {
LABEL_36:
            v49 = v94;
LABEL_37:
            v48 = v92;
            goto LABEL_44;
          }
          v51 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          v52 = objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          {
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "getDictionary"));
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerTitle")));
            v55 = (MOEventBundle *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", v54));
            *(_DWORD *)buf = 136315906;
            v108 = "-[MOMediaAggregationManager _getMediaOnRepeatMegaBundle:mediaTypeEnum:parameters:]";
            v109 = 2112;
            v110 = v55;
            v111 = 2112;
            v112 = v94;
            v113 = 2048;
            v114 = v17;
            _os_log_debug_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "%s, media on repeat weekly summary with media title, %@, duration, %@, total play time, %lf", buf, 0x2Au);

          }
          -[NSMutableArray addObject:](v82, "addObject:", v92);
          -[NSMutableArray addObjectsFromArray:](v83, "addObjectsFromArray:", v91);
          v48 = v92;
        }
        else
        {
          i = v88;
        }
        v49 = v94;
      }
      else
      {

        v49 = 0;
        v48 = 0;
      }
LABEL_44:

      objc_autoreleasePoolPop(context);
    }
    v87 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v116, 16);
  }
  while (v87);
LABEL_49:

  v57 = v82;
  if (-[NSMutableArray count](v82, "count"))
  {
    v58 = [MOEventBundle alloc];
    v59 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v83);
    v56 = -[MOEventBundle initWithEventSet:filtered:](v58, "initWithEventSet:filtered:", v59, 0);

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _sortResourcesBySumPlaytime:](v80, "_sortResourcesBySumPlaytime:", v82));
    -[MOEventBundle setInterfaceType:](v56, "setInterfaceType:", 5);
    v61 = CFSTR("song_on_repeat");
    if ((unint64_t)-[NSMutableArray count](v82, "count") >= 2)
    {
      v62 = CFSTR("songs_on_repeat");

      v61 = v62;
    }
    -[MOEventBundle setBundleSuperType:](v56, "setBundleSuperType:", 4);
    -[MOEventBundle setBundleSubType:](v56, "setBundleSubType:", 404);
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "promptLanguage"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, etc."), v64));
    -[MOEventBundle setPromptLanguage:](v56, "setPromptLanguage:", v65);

    v66 = -[MOAction initWithActionName:actionType:actionSubtype:]([MOAction alloc], "initWithActionName:actionType:actionSubtype:", v61, 1, 6);
    -[MOEventBundle setAction:](v56, "setAction:", v66);

    v67 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v83, "firstObject"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "eventIdentifier"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v56, "action"));
    objc_msgSend(v69, "setSourceEventIdentifier:", v68);

    v70 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _limitMOResourcesAndUpdatePriority:parameters:isSong:isFirstPartyApp:](v80, "_limitMOResourcesAndUpdatePriority:parameters:isSong:isFirstPartyApp:", v60, v81, 1, 1));
    -[MOEventBundle setResources:](v56, "setResources:", v70);

    v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v72 = objc_alloc((Class)NSDate);
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v74 = objc_msgSend(v72, "initWithTimeInterval:sinceDate:", v73, -604800.0);
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "startOfDayForDate:", v74));
    -[MOEventBundle setStartDate:](v56, "setStartDate:", v75);

    v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[MOEventBundle setEndDate:](v56, "setEndDate:", v76);

    -[MOMediaAggregationManager _updateRankingDictionary:mediaLength:sumPlaytime:mediaActionIsRepeat:](v80, "_updateRankingDictionary:mediaLength:sumPlaytime:mediaActionIsRepeat:", v56, 1, v9, v10);
    v77 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v78 = objc_claimAutoreleasedReturnValue(v77);
    if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v108 = "-[MOMediaAggregationManager _getMediaOnRepeatMegaBundle:mediaTypeEnum:parameters:]";
      v109 = 2112;
      v110 = v56;
      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "%s, bundle, %@, event category, Song on repeat mega bundle", buf, 0x16u);
    }

    v57 = v82;
  }
  else
  {
    v56 = 0;
  }

LABEL_57:
  return v56;
}

- (id)_getMediaOnRepeatMegaBundleForThirdParty:(id)a3 mediaTypeEnum:(unint64_t)a4 parameters:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *i;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  double v23;
  double v24;
  void *v25;
  MOEventBundle *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  id os_log;
  NSObject *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  double v57;
  void *v58;
  id v59;
  NSObject *v60;
  void *v61;
  void *v62;
  MOEventBundle *v63;
  MOEventBundle *v64;
  id v65;
  MOEventBundle *v66;
  void *v67;
  __CFString *v68;
  void *v69;
  void *v70;
  void *v71;
  MOAction *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  NSObject *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id obj;
  NSMutableDictionary *v90;
  NSMutableArray *v91;
  id v92;
  void *v93;
  uint64_t v94;
  void *v95;
  id v96;
  MOMediaAggregationManager *v97;
  uint64_t v98;
  NSMutableArray *v99;
  id v100;
  NSMutableArray *v101;
  uint64_t v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  MOEventBundle *v107;
  NSMutableArray *v108;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  id v113;
  id v114;
  void *context;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  uint8_t buf[4];
  const char *v130;
  __int16 v131;
  MOEventBundle *v132;
  __int16 v133;
  void *v134;
  __int16 v135;
  double v136;
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];

  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "count"))
  {
    v92 = v8;
    v93 = v7;
    v97 = self;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _groupBundleByApps:](self, "_groupBundleByApps:", v7));
    v91 = objc_opt_new(NSMutableArray);
    v90 = objc_opt_new(NSMutableDictionary);
    v125 = 0u;
    v126 = 0u;
    v127 = 0u;
    v128 = 0u;
    v95 = v9;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allKeys"));
    v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v139, 16);
    if (v96)
    {
      v94 = *(_QWORD *)v126;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v126 != v94)
          {
            v11 = v10;
            objc_enumerationMutation(obj);
            v10 = v11;
          }
          v98 = v10;
          v12 = *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * v10);
          v13 = objc_opt_new(NSMutableArray);
          v99 = objc_opt_new(NSMutableArray);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "objectForKeyedSubscript:", v12));
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _createMediaDictionaryFromBundles:](v97, "_createMediaDictionaryFromBundles:", v14));

          v123 = 0u;
          v124 = 0u;
          v121 = 0u;
          v122 = 0u;
          v103 = v15;
          v100 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allKeys"));
          v101 = v13;
          v104 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v121, v138, 16);
          if (v104)
          {
            v102 = *(_QWORD *)v122;
            v16 = 0.0;
            v17 = 0.0;
            do
            {
              for (i = 0; i != v104; i = (char *)i + 1)
              {
                if (*(_QWORD *)v122 != v102)
                  objc_enumerationMutation(v100);
                v106 = i;
                v19 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * (_QWORD)i);
                v105 = objc_autoreleasePoolPush();
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "objectForKeyedSubscript:", v19));
                v108 = objc_opt_new(NSMutableArray);
                v117 = 0u;
                v118 = 0u;
                v119 = 0u;
                v120 = 0u;
                v21 = v20;
                v114 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v117, v137, 16);
                if (v114)
                {
                  v109 = 0;
                  v22 = *(_QWORD *)v118;
                  v23 = 0.0;
                  v24 = 0.0;
                  v113 = v21;
                  v111 = 0;
                  v112 = *(_QWORD *)v118;
                  do
                  {
                    v25 = 0;
                    do
                    {
                      if (*(_QWORD *)v118 != v22)
                        objc_enumerationMutation(v21);
                      v26 = *(MOEventBundle **)(*((_QWORD *)&v117 + 1) + 8 * (_QWORD)v25);
                      context = objc_autoreleasePoolPush();
                      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v26, "events"));
                      v28 = objc_msgSend(v27, "count");
                      v29 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v26, "resources"));
                      v30 = objc_msgSend(v29, "count");

                      if (v28 == v30)
                      {
                        v31 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v26, "resources"));
                        v32 = objc_msgSend(v31, "count");

                        if (!v32)
                          goto LABEL_28;
                        v33 = 0;
                        while (1)
                        {
                          v34 = objc_autoreleasePoolPush();
                          v35 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v26, "resources"));
                          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectAtIndexedSubscript:", v33));

                          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "getDictionary"));
                          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKey:", CFSTR("media_type")));
                          v39 = (int)objc_msgSend(v38, "intValue");

                          if (v39 == a4)
                          {
                            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "getDictionary"));
                            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerTitle")));

                            if (objc_msgSend(v41, "isEqualToString:", v19))
                            {
                              if (!v111)
                              {
                                v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "getDictionary"));
                                v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerDuration")));

                              }
                              v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "getDictionary"));
                              v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerSumPlaytime")));

                              os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                              v49 = objc_claimAutoreleasedReturnValue(os_log);
                              v22 = v112;
                              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                              {
                                v107 = (MOEventBundle *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", v41));
                                *(_DWORD *)buf = 136315906;
                                v130 = "-[MOMediaAggregationManager _getMediaOnRepeatMegaBundleForThirdParty:mediaTypeEnum:parameters:]";
                                v131 = 2112;
                                v132 = v107;
                                v133 = 2112;
                                v134 = v111;
                                v135 = 2112;
                                v136 = *(double *)&v110;
                                _os_log_debug_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "%s, third party media title inside media on repeat weekly summary bundle, %@, duration, %@, total play time, %@", buf, 0x2Au);

                              }
                              objc_msgSend(v110, "doubleValue");
                              v24 = v24 + v50;
                              v17 = v17 + v24;
                              objc_msgSend(v111, "doubleValue");
                              v23 = v23 + v51;
                              v16 = v16 + v23;
                              v52 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v26, "events"));
                              v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectAtIndexedSubscript:", v33));
                              -[NSMutableArray addObject:](v108, "addObject:", v53);

                              objc_autoreleasePoolPop(v34);
                              v109 = v36;
                              v21 = v113;
                              goto LABEL_28;
                            }

                          }
                          objc_autoreleasePoolPop(v34);
                          ++v33;
                          v42 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v26, "resources"));
                          v43 = objc_msgSend(v42, "count");

                          if ((unint64_t)v43 <= v33)
                          {
                            v22 = v112;
                            v21 = v113;
                            goto LABEL_28;
                          }
                        }
                      }
                      v44 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                      v45 = objc_claimAutoreleasedReturnValue(v44);
                      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 136315394;
                        v130 = "-[MOMediaAggregationManager _getMediaOnRepeatMegaBundleForThirdParty:mediaTypeEnum:parameters:]";
                        v131 = 2112;
                        v132 = v26;
                        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "%s, third party media bundle has bad data, %@", buf, 0x16u);
                      }

LABEL_28:
                      objc_autoreleasePoolPop(context);
                      v25 = (char *)v25 + 1;
                    }
                    while (v25 != v114);
                    v54 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v117, v137, 16);
                    v114 = v54;
                  }
                  while (v54);

                  if (v109)
                  {
                    v13 = v101;
                    v55 = v105;
                    i = v106;
                    v56 = v111;
                    if (-[NSMutableArray count](v108, "count")
                      && v111
                      && (int)objc_msgSend(v111, "intValue") >= 1
                      && (objc_msgSend(v111, "doubleValue"), v24 / v57 >= 2.95))
                    {
                      v59 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                      v60 = objc_claimAutoreleasedReturnValue(v59);
                      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
                      {
                        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "getDictionary"));
                        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerTitle")));
                        v63 = (MOEventBundle *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", v62));
                        *(_DWORD *)buf = 136315906;
                        v130 = "-[MOMediaAggregationManager _getMediaOnRepeatMegaBundleForThirdParty:mediaTypeEnum:parameters:]";
                        v131 = 2112;
                        v132 = v63;
                        v133 = 2112;
                        v134 = v111;
                        v135 = 2048;
                        v136 = v24;
                        _os_log_debug_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEBUG, "%s, third party media on repeat weekly summary with media title, %@, duration, %@, total play time, %lf", buf, 0x2Au);

                      }
                      v58 = v109;
                      -[NSMutableArray addObject:](v101, "addObject:", v109);
                      -[NSMutableArray addObjectsFromArray:](v99, "addObjectsFromArray:", v108);
                    }
                    else
                    {
                      v58 = v109;
                    }
                  }
                  else
                  {
                    v58 = 0;
                    v13 = v101;
                    v55 = v105;
                    i = v106;
                    v56 = v111;
                  }
                }
                else
                {

                  v56 = 0;
                  v58 = 0;
                  v55 = v105;
                }

                objc_autoreleasePoolPop(v55);
              }
              v104 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v121, v138, 16);
            }
            while (v104);
          }
          else
          {
            v16 = 0.0;
            v17 = 0.0;
          }

          if (-[NSMutableArray count](v13, "count"))
          {
            v64 = [MOEventBundle alloc];
            v65 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v99);
            v66 = -[MOEventBundle initWithEventSet:filtered:](v64, "initWithEventSet:filtered:", v65, 0);

            v67 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _sortResourcesBySumPlaytime:](v97, "_sortResourcesBySumPlaytime:", v13));
            -[MOEventBundle setInterfaceType:](v66, "setInterfaceType:", 5);
            v68 = CFSTR("media_on_repeat_third_party");
            -[MOEventBundle setBundleSuperType:](v66, "setBundleSuperType:", 4);
            -[MOEventBundle setBundleSubType:](v66, "setBundleSubType:", 409);
            v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "firstObject"));
            v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "promptLanguage"));
            v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, etc."), v70));
            -[MOEventBundle setPromptLanguage:](v66, "setPromptLanguage:", v71);

            v72 = -[MOAction initWithActionName:actionType:actionSubtype:]([MOAction alloc], "initWithActionName:actionType:actionSubtype:", v68, 1, 6);
            -[MOEventBundle setAction:](v66, "setAction:", v72);

            v73 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _limitMOResourcesAndUpdatePriority:parameters:isSong:isFirstPartyApp:](v97, "_limitMOResourcesAndUpdatePriority:parameters:isSong:isFirstPartyApp:", v67, v92, 1, 0));
            -[MOEventBundle setResources:](v66, "setResources:", v73);

            v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
            v75 = objc_alloc((Class)NSDate);
            v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
            v77 = objc_msgSend(v75, "initWithTimeInterval:sinceDate:", v76, -604800.0);
            v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "startOfDayForDate:", v77));
            -[MOEventBundle setStartDate:](v66, "setStartDate:", v78);

            v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
            -[MOEventBundle setEndDate:](v66, "setEndDate:", v79);

            -[MOEventBundle setIsAggregatedAndSuppressed:](v66, "setIsAggregatedAndSuppressed:", 1);
            -[MOMediaAggregationManager _updateRankingDictionary:mediaLength:sumPlaytime:mediaActionIsRepeat:](v97, "_updateRankingDictionary:mediaLength:sumPlaytime:mediaActionIsRepeat:", v66, 1, v16, v17);
            v80 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            v81 = objc_claimAutoreleasedReturnValue(v80);
            if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v130 = "-[MOMediaAggregationManager _getMediaOnRepeatMegaBundleForThirdParty:mediaTypeEnum:parameters:]";
              v131 = 2112;
              v132 = v66;
              _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_INFO, "%s, bundle, %@, event category, third party Media on repeat mega bundle", buf, 0x16u);
            }

            v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v17));
            v83 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v66, "resources"));
            v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "firstObject"));
            v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "getDictionary"));
            v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerBundleID")));
            -[NSMutableDictionary setValue:forKey:](v90, "setValue:forKey:", v82, v86);

            -[NSMutableArray addObject:](v91, "addObject:", v66);
            v13 = v101;
          }

          v10 = v98 + 1;
        }
        while ((id)(v98 + 1) != v96);
        v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v139, 16);
      }
      while (v96);
    }

    v8 = v92;
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _sortAndMergeBundlesForThirdPartyApps:playtimeDict:paramters:mediaActionIsRepeat:](v97, "_sortAndMergeBundlesForThirdPartyApps:playtimeDict:paramters:mediaActionIsRepeat:", v91, v90, v92, 1));

    v7 = v93;
  }
  else
  {
    v87 = 0;
  }

  return v87;
}

- (id)_getPlayedMediaMegaBundle:(id)a3 mediaTypeEnum:(unint64_t)a4 paramters:(id)a5
{
  id v8;
  NSMutableArray *v9;
  double v10;
  double v11;
  void *i;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  uint64_t v19;
  MOEventBundle *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  id os_log;
  NSObject *v43;
  double v44;
  double v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  MOEventBundle *v51;
  id v52;
  NSObject *v53;
  void *v54;
  double v55;
  float v56;
  float v57;
  void *v58;
  MOEventBundle *v59;
  void *v60;
  void *v61;
  MOEventBundle *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  __CFString **v70;
  __CFString *v71;
  void *v72;
  void *v73;
  void *v74;
  MOAction *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  id v85;
  NSObject *v86;
  MOMediaAggregationManager *v88;
  NSMutableArray *v89;
  id v90;
  id obj;
  NSMutableArray *v92;
  id v93;
  uint64_t v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  id v101;
  void *context;
  uint64_t v103;
  NSMutableArray *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  uint8_t buf[4];
  const char *v117;
  __int16 v118;
  MOEventBundle *v119;
  __int16 v120;
  void *v121;
  __int16 v122;
  void *v123;
  _BYTE v124[128];
  _BYTE v125[128];

  v8 = a3;
  v90 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v9 = objc_opt_new(NSMutableArray);
    v88 = self;
    v89 = objc_opt_new(NSMutableArray);
    v112 = 0u;
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _createMediaDictionaryFromBundles:](self, "_createMediaDictionaryFromBundles:", v8));
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "allKeys"));
    v92 = v9;
    v93 = v8;
    v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v125, 16);
    if (v96)
    {
      v94 = *(_QWORD *)v113;
      v10 = 0.0;
      v11 = 0.0;
      do
      {
        for (i = 0; i != v96; i = (char *)i + 1)
        {
          if (*(_QWORD *)v113 != v94)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * (_QWORD)i);
          v14 = objc_autoreleasePoolPush();
          v105 = v13;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "objectForKeyedSubscript:", v13));
          v104 = objc_opt_new(NSMutableArray);
          v108 = 0u;
          v109 = 0u;
          v110 = 0u;
          v111 = 0u;
          v16 = v15;
          v101 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v108, v124, 16);
          if (v101)
          {
            v97 = v14;
            v98 = i;
            v106 = 0;
            v107 = 0;
            v99 = *(_QWORD *)v109;
            v100 = v16;
            v17 = 0.0;
            v18 = 0.0;
            do
            {
              v19 = 0;
              do
              {
                if (*(_QWORD *)v109 != v99)
                  objc_enumerationMutation(v16);
                v20 = *(MOEventBundle **)(*((_QWORD *)&v108 + 1) + 8 * v19);
                v21 = objc_autoreleasePoolPush();
                v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v20, "events"));
                v23 = objc_msgSend(v22, "count");
                v24 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v20, "resources"));
                v25 = objc_msgSend(v24, "count");

                context = v21;
                v103 = v19;
                if (v23 == v25)
                {
                  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v20, "resources"));
                  v27 = objc_msgSend(v26, "count");

                  if (v27)
                  {
                    v28 = 0;
                    do
                    {
                      v29 = objc_autoreleasePoolPush();
                      v30 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v20, "resources"));
                      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectAtIndexedSubscript:", v28));

                      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "getDictionary"));
                      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKey:", CFSTR("media_type")));
                      v34 = (int)objc_msgSend(v33, "intValue");

                      if (v34 == a4)
                      {
                        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "getDictionary"));
                        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerTitle")));

                        if (objc_msgSend(v36, "isEqualToString:", v105))
                        {
                          v37 = (uint64_t)v107;
                          if (!v107)
                          {
                            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "getDictionary"));
                            v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerDuration")));

                          }
                          v107 = (void *)v37;
                          v39 = a4;
                          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "getDictionary"));
                          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerSumPlaytime")));

                          os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                          v43 = objc_claimAutoreleasedReturnValue(os_log);
                          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
                          {
                            v51 = (MOEventBundle *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", v36));
                            *(_DWORD *)buf = 136315906;
                            v117 = "-[MOMediaAggregationManager _getPlayedMediaMegaBundle:mediaTypeEnum:paramters:]";
                            v118 = 2112;
                            v119 = v51;
                            v120 = 2112;
                            v121 = v107;
                            v122 = 2112;
                            v123 = v41;
                            _os_log_debug_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "%s, played media with media title insdie weekly summary bundle, %@, duration, %@, total play time, %@", buf, 0x2Au);

                          }
                          objc_msgSend(v41, "doubleValue");
                          v18 = v18 + v44;
                          v11 = v11 + v18;
                          objc_msgSend(v107, "doubleValue");
                          v17 = v17 + v45;
                          v10 = v10 + v17;
                          v46 = v31;

                          v47 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v20, "events"));
                          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectAtIndexedSubscript:", v28));
                          -[NSMutableArray addObject:](v104, "addObject:", v48);

                          v106 = v46;
                          a4 = v39;
                        }

                      }
                      objc_autoreleasePoolPop(v29);
                      ++v28;
                      v49 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v20, "resources"));
                      v50 = objc_msgSend(v49, "count");

                    }
                    while ((unint64_t)v50 > v28);
                  }
                }
                else
                {
                  v52 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                  v53 = objc_claimAutoreleasedReturnValue(v52);
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 136315394;
                    v117 = "-[MOMediaAggregationManager _getPlayedMediaMegaBundle:mediaTypeEnum:paramters:]";
                    v118 = 2112;
                    v119 = v20;
                    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "%s, media bundle has bad data, %@", buf, 0x16u);
                  }

                }
                objc_autoreleasePoolPop(context);
                v19 = v103 + 1;
                v16 = v100;
              }
              while ((id)(v103 + 1) != v101);
              v101 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v108, v124, 16);
            }
            while (v101);

            v54 = v106;
            if (v106)
            {
              v9 = v92;
              v8 = v93;
              v14 = v97;
              i = v98;
              if (-[NSMutableArray count](v104, "count"))
              {
                if (v107
                  && (int)objc_msgSend(v107, "intValue") >= 1
                  && (v55 = v18 / (double)(uint64_t)objc_msgSend(v107, "longValue"),
                      objc_msgSend(v90, "coarseGranularity_mediaBundleAggregationPodcastPlayTimePercentageThreshold"),
                      v55 >= v56)
                  || (objc_msgSend(v90, "coarseGranularity_mediaBundleAggregationPodcastTotalPlayTimeThreshold"),
                      v18 >= v57))
                {
                  -[NSMutableArray addObject:](v92, "addObject:", v106);
                  -[NSMutableArray addObjectsFromArray:](v89, "addObjectsFromArray:", v104);
                }
              }
            }
            else
            {
              v9 = v92;
              v8 = v93;
              v14 = v97;
              i = v98;
            }
            v58 = v107;
          }
          else
          {

            v58 = 0;
            v54 = 0;
          }

          objc_autoreleasePoolPop(v14);
        }
        v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v125, 16);
      }
      while (v96);
    }
    else
    {
      v10 = 0.0;
      v11 = 0.0;
    }

    if (-[NSMutableArray count](v9, "count"))
    {
      v60 = objc_autoreleasePoolPush();
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _sortResourcesBySumPlaytime:](v88, "_sortResourcesBySumPlaytime:", v9));
      objc_autoreleasePoolPop(v60);
      v62 = [MOEventBundle alloc];
      v63 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v89);
      v59 = -[MOEventBundle initWithEventSet:filtered:](v62, "initWithEventSet:filtered:", v63, 0);

      v64 = objc_autoreleasePoolPush();
      -[MOEventBundle setInterfaceType:](v59, "setInterfaceType:", 5);
      v65 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _limitMOResourcesAndUpdatePriority:parameters:isSong:isFirstPartyApp:](v88, "_limitMOResourcesAndUpdatePriority:parameters:isSong:isFirstPartyApp:", v61, v90, 0, 1));
      -[MOEventBundle setResources:](v59, "setResources:", v65);

      v66 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v59, "resources"));
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "firstObject"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "getDictionary"));
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerMediaTypeKey")));

      v70 = kMOMediaPlayAnnotationManagerStringPrefixPlayedPodcasts;
      if ((unint64_t)-[NSMutableArray count](v9, "count") <= 1
        && !objc_msgSend(v69, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypePodcastArtist[0]))
      {
        v70 = kMOMediaPlayAnnotationManagerStringPrefixPlayedPodcast;
      }
      v71 = *v70;
      -[MOEventBundle setBundleSuperType:](v59, "setBundleSuperType:", 4);
      -[MOEventBundle setBundleSubType:](v59, "setBundleSubType:", 405);
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "promptLanguage"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, etc."), v73));
      -[MOEventBundle setPromptLanguage:](v59, "setPromptLanguage:", v74);

      v75 = -[MOAction initWithActionName:actionType:actionSubtype:]([MOAction alloc], "initWithActionName:actionType:actionSubtype:", v71, 1, 6);
      -[MOEventBundle setAction:](v59, "setAction:", v75);

      v76 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v89, "firstObject"));
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "eventIdentifier"));
      v78 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v59, "action"));
      objc_msgSend(v78, "setSourceEventIdentifier:", v77);

      v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
      v80 = objc_alloc((Class)NSDate);
      v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v82 = objc_msgSend(v80, "initWithTimeInterval:sinceDate:", v81, -604800.0);
      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "startOfDayForDate:", v82));
      -[MOEventBundle setStartDate:](v59, "setStartDate:", v83);

      v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      -[MOEventBundle setEndDate:](v59, "setEndDate:", v84);

      -[MOMediaAggregationManager _updateRankingDictionary:mediaLength:sumPlaytime:mediaActionIsRepeat:](v88, "_updateRankingDictionary:mediaLength:sumPlaytime:mediaActionIsRepeat:", v59, 0, v10, v11);
      v85 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      v86 = objc_claimAutoreleasedReturnValue(v85);
      if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v117 = "-[MOMediaAggregationManager _getPlayedMediaMegaBundle:mediaTypeEnum:paramters:]";
        v118 = 2112;
        v119 = v59;
        _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_INFO, "%s, bundle, %@, event category, Played Media mega bundle", buf, 0x16u);
      }

      objc_autoreleasePoolPop(v64);
      v9 = v92;
      v8 = v93;
    }
    else
    {
      v59 = 0;
    }

  }
  else
  {
    v59 = 0;
  }

  return v59;
}

- (id)_getPlayedMediaMegaBundleForThirdParty:(id)a3 mediaTypeEnum:(unint64_t)a4 paramters:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *i;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  double v24;
  double v25;
  void *j;
  MOEventBundle *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id os_log;
  NSObject *v49;
  double v50;
  double v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  MOEventBundle *v57;
  id v58;
  NSObject *v59;
  void *v60;
  double v61;
  float v62;
  void *v63;
  void *v64;
  MOEventBundle *v65;
  id v66;
  MOEventBundle *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  __CFString *v74;
  unsigned int v75;
  __CFString *v76;
  void *v77;
  void *v78;
  void *v79;
  MOAction *v80;
  void *v81;
  id v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  id v87;
  NSObject *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id obj;
  NSMutableDictionary *v97;
  NSMutableArray *v98;
  uint64_t v99;
  void *v100;
  id v101;
  void *v102;
  uint64_t v103;
  NSMutableArray *v104;
  id v105;
  void *v106;
  id v107;
  MOMediaAggregationManager *v108;
  NSMutableArray *v109;
  uint64_t v110;
  void *v111;
  id v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  id v117;
  void *context;
  unint64_t v119;
  NSMutableArray *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  uint8_t buf[4];
  const char *v137;
  __int16 v138;
  MOEventBundle *v139;
  __int16 v140;
  void *v141;
  __int16 v142;
  void *v143;
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];

  v8 = a3;
  v9 = a5;
  if (!objc_msgSend(v8, "count"))
  {
    v94 = 0;
    goto LABEL_61;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _groupBundleByApps:](self, "_groupBundleByApps:", v8));
  v98 = objc_opt_new(NSMutableArray);
  v97 = objc_opt_new(NSMutableDictionary);
  v132 = 0u;
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  v100 = v10;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allKeys"));
  v101 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v132, v146, 16);
  if (!v101)
    goto LABEL_59;
  v99 = *(_QWORD *)v133;
  v106 = v9;
  v107 = v8;
  v108 = self;
  v119 = a4;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v133 != v99)
      {
        v12 = v11;
        objc_enumerationMutation(obj);
        v11 = v12;
      }
      v103 = v11;
      v13 = *(_QWORD *)(*((_QWORD *)&v132 + 1) + 8 * v11);
      v102 = objc_autoreleasePoolPush();
      v14 = objc_opt_new(NSMutableArray);
      v104 = objc_opt_new(NSMutableArray);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "objectForKeyedSubscript:", v13));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _createMediaDictionaryFromBundles:](self, "_createMediaDictionaryFromBundles:", v15));

      v130 = 0u;
      v131 = 0u;
      v128 = 0u;
      v129 = 0u;
      v111 = v16;
      v105 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allKeys"));
      v109 = v14;
      v112 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v128, v145, 16);
      if (!v112)
      {
        v17 = 0.0;
        v18 = 0.0;
        goto LABEL_50;
      }
      v110 = *(_QWORD *)v129;
      v17 = 0.0;
      v18 = 0.0;
      do
      {
        for (i = 0; i != v112; i = (char *)i + 1)
        {
          if (*(_QWORD *)v129 != v110)
            objc_enumerationMutation(v105);
          v20 = *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * (_QWORD)i);
          v21 = objc_autoreleasePoolPush();
          v121 = v20;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "objectForKeyedSubscript:", v20));
          v120 = objc_opt_new(NSMutableArray);
          v124 = 0u;
          v125 = 0u;
          v126 = 0u;
          v127 = 0u;
          v23 = v22;
          v117 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v124, v144, 16);
          if (v117)
          {
            v113 = v21;
            v114 = i;
            v122 = 0;
            v123 = 0;
            v115 = *(_QWORD *)v125;
            v116 = v23;
            v24 = 0.0;
            v25 = 0.0;
            do
            {
              for (j = 0; j != v117; j = (char *)j + 1)
              {
                if (*(_QWORD *)v125 != v115)
                  objc_enumerationMutation(v23);
                v27 = *(MOEventBundle **)(*((_QWORD *)&v124 + 1) + 8 * (_QWORD)j);
                v28 = objc_autoreleasePoolPush();
                v29 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v27, "events"));
                v30 = objc_msgSend(v29, "count");
                v31 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v27, "resources"));
                v32 = objc_msgSend(v31, "count");

                context = v28;
                if (v30 == v32)
                {
                  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v27, "resources"));
                  v34 = objc_msgSend(v33, "count");

                  if (v34)
                  {
                    v35 = 0;
                    do
                    {
                      v36 = objc_autoreleasePoolPush();
                      v37 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v27, "resources"));
                      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectAtIndexedSubscript:", v35));

                      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "getDictionary"));
                      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKey:", CFSTR("media_type")));
                      v41 = (int)objc_msgSend(v40, "intValue");

                      if (v41 == a4)
                      {
                        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "getDictionary"));
                        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerTitle")));

                        if (objc_msgSend(v43, "isEqualToString:", v121))
                        {
                          v44 = v123;
                          if (!v123)
                          {
                            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "getDictionary"));
                            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerDuration")));

                          }
                          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "getDictionary"));
                          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerSumPlaytime")));

                          os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                          v49 = objc_claimAutoreleasedReturnValue(os_log);
                          v123 = v44;
                          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                          {
                            v57 = (MOEventBundle *)objc_claimAutoreleasedReturnValue(+[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", v43));
                            *(_DWORD *)buf = 136315906;
                            v137 = "-[MOMediaAggregationManager _getPlayedMediaMegaBundleForThirdParty:mediaTypeEnum:paramters:]";
                            v138 = 2112;
                            v139 = v57;
                            v140 = 2112;
                            v141 = v44;
                            v142 = 2112;
                            v143 = v47;
                            _os_log_debug_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "%s, third party played media with media title insdie weekly summary bundle, %@, duration, %@, total play time, %@", buf, 0x2Au);

                          }
                          objc_msgSend(v47, "doubleValue");
                          v25 = v25 + v50;
                          v18 = v18 + v25;
                          objc_msgSend(v44, "doubleValue");
                          v24 = v24 + v51;
                          v17 = v17 + v24;
                          v52 = v38;

                          v53 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v27, "events"));
                          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectAtIndexedSubscript:", v35));
                          -[NSMutableArray addObject:](v120, "addObject:", v54);

                          v122 = v52;
                          a4 = v119;
                        }

                      }
                      objc_autoreleasePoolPop(v36);
                      ++v35;
                      v55 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v27, "resources"));
                      v56 = objc_msgSend(v55, "count");

                    }
                    while ((unint64_t)v56 > v35);
                  }
                }
                else
                {
                  v58 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                  v59 = objc_claimAutoreleasedReturnValue(v58);
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 136315394;
                    v137 = "-[MOMediaAggregationManager _getPlayedMediaMegaBundleForThirdParty:mediaTypeEnum:paramters:]";
                    v138 = 2112;
                    v139 = v27;
                    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "%s, third party media bundle has bad data, %@", buf, 0x16u);
                  }

                }
                objc_autoreleasePoolPop(context);
                v23 = v116;
              }
              v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v124, v144, 16);
            }
            while (v117);

            if (v122)
            {
              v9 = v106;
              v8 = v107;
              self = v108;
              v14 = v109;
              v21 = v113;
              i = v114;
              if (-[NSMutableArray count](v120, "count"))
              {
                v60 = v123;
                if (!v123
                  || !objc_msgSend(v123, "intValue")
                  || (int)objc_msgSend(v123, "intValue") >= 1
                  && (v61 = v25 / (double)(uint64_t)objc_msgSend(v123, "longValue"),
                      objc_msgSend(v106, "coarseGranularity_mediaBundleAggregationPodcastPlayTimePercentageThreshold"),
                      v61 >= v62))
                {
                  v63 = v122;
                  -[NSMutableArray addObject:](v109, "addObject:", v122);
                  -[NSMutableArray addObjectsFromArray:](v104, "addObjectsFromArray:", v120);
                  goto LABEL_46;
                }
              }
              else
              {
                v60 = v123;
              }
              v63 = v122;
            }
            else
            {
              v63 = 0;
              v9 = v106;
              v8 = v107;
              self = v108;
              v14 = v109;
              v21 = v113;
              i = v114;
              v60 = v123;
            }
          }
          else
          {

            v60 = 0;
            v63 = 0;
          }
LABEL_46:

          objc_autoreleasePoolPop(v21);
        }
        v112 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v128, v145, 16);
      }
      while (v112);
LABEL_50:

      if (-[NSMutableArray count](v14, "count"))
      {
        v64 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _sortResourcesBySumPlaytime:](self, "_sortResourcesBySumPlaytime:", v14));
        v65 = [MOEventBundle alloc];
        v66 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v104);
        v67 = -[MOEventBundle initWithEventSet:filtered:](v65, "initWithEventSet:filtered:", v66, 0);

        -[MOEventBundle setInterfaceType:](v67, "setInterfaceType:", 5);
        v68 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _limitMOResourcesAndUpdatePriority:parameters:isSong:isFirstPartyApp:](self, "_limitMOResourcesAndUpdatePriority:parameters:isSong:isFirstPartyApp:", v64, v9, 0, 0));
        -[MOEventBundle setResources:](v67, "setResources:", v68);

        v69 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v67, "resources"));
        v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "firstObject"));
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "getDictionary"));
        v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerMediaTypeKey")));

        v73 = -[NSMutableArray count](v14, "count");
        v74 = CFSTR("played_podcasts");
        if ((unint64_t)v73 <= 1)
        {
          v75 = objc_msgSend(v72, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypePodcastArtist[0]);
          v74 = CFSTR("played_podcast");
          if (v75)
            v74 = CFSTR("played_podcasts");
        }
        v76 = v74;
        -[MOEventBundle setBundleSuperType:](v67, "setBundleSuperType:", 4);
        -[MOEventBundle setBundleSubType:](v67, "setBundleSubType:", 410);
        -[MOEventBundle setIsAggregatedAndSuppressed:](v67, "setIsAggregatedAndSuppressed:", 1);
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
        v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "promptLanguage"));
        v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, etc."), v78));
        -[MOEventBundle setPromptLanguage:](v67, "setPromptLanguage:", v79);

        v80 = -[MOAction initWithActionName:actionType:actionSubtype:]([MOAction alloc], "initWithActionName:actionType:actionSubtype:", v76, 1, 6);
        -[MOEventBundle setAction:](v67, "setAction:", v80);

        v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
        v82 = objc_alloc((Class)NSDate);
        v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        v84 = objc_msgSend(v82, "initWithTimeInterval:sinceDate:", v83, -604800.0);
        v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "startOfDayForDate:", v84));
        -[MOEventBundle setStartDate:](v67, "setStartDate:", v85);

        v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        -[MOEventBundle setEndDate:](v67, "setEndDate:", v86);

        -[MOMediaAggregationManager _updateRankingDictionary:mediaLength:sumPlaytime:mediaActionIsRepeat:](v108, "_updateRankingDictionary:mediaLength:sumPlaytime:mediaActionIsRepeat:", v67, 0, v17, v18);
        v87 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        v88 = objc_claimAutoreleasedReturnValue(v87);
        if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v137 = "-[MOMediaAggregationManager _getPlayedMediaMegaBundleForThirdParty:mediaTypeEnum:paramters:]";
          v138 = 2112;
          v139 = v67;
          _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_INFO, "%s, bundle, %@, event category, third party Played Media mega bundle", buf, 0x16u);
        }

        v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v18));
        v90 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v67, "resources"));
        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "firstObject"));
        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "getDictionary"));
        v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerBundleID")));
        -[NSMutableDictionary setValue:forKey:](v97, "setValue:forKey:", v89, v93);

        -[NSMutableArray addObject:](v98, "addObject:", v67);
        v9 = v106;
        v8 = v107;
        self = v108;
        v14 = v109;
        a4 = v119;
      }

      objc_autoreleasePoolPop(v102);
      v11 = v103 + 1;
    }
    while ((id)(v103 + 1) != v101);
    v101 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v132, v146, 16);
  }
  while (v101);
LABEL_59:

  v94 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaAggregationManager _sortAndMergeBundlesForThirdPartyApps:playtimeDict:paramters:mediaActionIsRepeat:](self, "_sortAndMergeBundlesForThirdPartyApps:playtimeDict:paramters:mediaActionIsRepeat:", v98, v97, v9, 0));
LABEL_61:

  return v94;
}

- (void)_updateMOResourceDictionary:(id)a3 dictKey:(id)a4 dictValue:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  MOResource *v20;
  void *v21;
  MOResource *v22;
  void *v23;
  void *v24;
  id obj;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v7 = a3;
  v26 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resources"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));

  if (v10)
  {
    v11 = objc_opt_new(NSMutableArray);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v24 = v7;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resources"));
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v15);
          v17 = objc_autoreleasePoolPush();
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "getDictionary"));
          v19 = objc_msgSend(v18, "mutableCopy");

          objc_msgSend(v19, "setObject:forKeyedSubscript:", v8, v26);
          v20 = [MOResource alloc];
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "name"));
          v22 = -[MOResource initWithName:type:dict:value:](v20, "initWithName:type:dict:value:", v21, objc_msgSend(v16, "type"), v19, 0.0);

          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sourceEventIdentifier"));
          -[MOResource setSourceEventIdentifier:](v22, "setSourceEventIdentifier:", v23);

          -[MOResource setSourceEventAccessType:](v22, "setSourceEventAccessType:", objc_msgSend(v16, "sourceEventAccessType"));
          objc_msgSend(v16, "priorityScore");
          -[MOResource setPriorityScore:](v22, "setPriorityScore:");
          -[NSMutableArray addObject:](v11, "addObject:", v22);

          objc_autoreleasePoolPop(v17);
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v13);
    }

    v7 = v24;
    objc_msgSend(v24, "setResources:", v11);

  }
}

- (id)_sortAndMergeBundlesForThirdPartyApps:(id)a3 playtimeDict:(id)a4 paramters:(id)a5 mediaActionIsRepeat:(BOOL)a6
{
  _BOOL4 v6;
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
  MOEventBundle *v20;
  NSMutableArray *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  double v26;
  void *i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  MOEventBundle *v40;
  id v41;
  MOEventBundle *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  unsigned int v53;
  double v54;
  void *v55;
  unint64_t v56;
  int v57;
  void *v58;
  void *v59;
  double v60;
  uint64_t v61;
  int v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  double v75;
  BOOL v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  MOEventBundle *v82;
  id v83;
  id v84;
  MOMediaAggregationManager *v85;
  void *v86;
  uint64_t v87;
  _BOOL4 context;
  void *contexta;
  void *v90;
  NSMutableArray *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "count"))
  {
    if (objc_msgSend(v10, "count") == (id)1)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
      objc_msgSend(v13, "setIsAggregatedAndSuppressed:", 0);

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "events"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities dominantMediaNameFromEvents:](MOContextAnnotationUtilities, "dominantMediaNameFromEvents:", v15));

      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("DominantMediaNameKey")));

        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("DominantMediaNameKey")));
          -[MOMediaAggregationManager _updateMOResourceDictionary:dictKey:dictValue:](self, "_updateMOResourceDictionary:dictKey:dictValue:", v18, CFSTR("third_party_dominate_value"), v19);

        }
      }
      v20 = (MOEventBundle *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

    }
    else
    {
      context = v6;
      v85 = self;
      v86 = v12;
      v83 = v11;
      v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "keysSortedByValueUsingComparator:", &__block_literal_global_100));
      v91 = objc_opt_new(NSMutableArray);
      v21 = objc_opt_new(NSMutableArray);
      v92 = 0u;
      v93 = 0u;
      v94 = 0u;
      v95 = 0u;
      v84 = v10;
      v22 = v10;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v92, v96, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v93;
        v26 = 0.0;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(_QWORD *)v93 != v25)
              objc_enumerationMutation(v22);
            v28 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * (_QWORD)i);
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "events"));
            -[NSMutableArray addObjectsFromArray:](v21, "addObjectsFromArray:", v29);

            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "metaDataForRank"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", CFSTR("MediaLength")));

            if (v31)
            {
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "metaDataForRank"));
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKey:", CFSTR("MediaLength")));
              objc_msgSend(v33, "doubleValue");
              v26 = v26 + v34;

            }
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "metaDataForRank"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKey:", CFSTR("MediaTotalPlayTime")));

            if (v36)
            {
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "metaDataForRank"));
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKey:", CFSTR("MediaTotalPlayTime")));
              objc_msgSend(v38, "doubleValue");
              v26 = v26 + v39;

            }
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v92, v96, 16);
        }
        while (v24);
      }
      else
      {
        v26 = 0.0;
      }

      v40 = [MOEventBundle alloc];
      v41 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v21);
      v42 = -[MOEventBundle initWithEventSet:filtered:](v40, "initWithEventSet:filtered:", v41, 0);

      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "firstObject"));
      -[MOEventBundle setInterfaceType:](v42, "setInterfaceType:", objc_msgSend(v43, "interfaceType"));

      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "firstObject"));
      -[MOEventBundle setBundleSuperType:](v42, "setBundleSuperType:", objc_msgSend(v44, "bundleSuperType"));

      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "firstObject"));
      -[MOEventBundle setBundleSubType:](v42, "setBundleSubType:", objc_msgSend(v45, "bundleSubType"));

      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "firstObject"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "promptLanguage"));
      -[MOEventBundle setPromptLanguage:](v42, "setPromptLanguage:", v47);

      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "firstObject"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "action"));
      -[MOEventBundle setAction:](v42, "setAction:", v49);

      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "firstObject"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "labels"));
      -[MOEventBundle setLabels:](v42, "setLabels:", v51);

      -[MOMediaAggregationManager _updateRankingDictionary:mediaLength:sumPlaytime:mediaActionIsRepeat:](v85, "_updateRankingDictionary:mediaLength:sumPlaytime:mediaActionIsRepeat:", v42, context, v26, 0.0);
      v52 = objc_msgSend(v86, "mediaBundleMaxResourcesPerBundle");
      v53 = v52;
      v54 = (double)(uint64_t)v52;
      v55 = v90;
      v82 = v42;
      if (objc_msgSend(v90, "count"))
      {
        v56 = 0;
        v57 = 0;
        do
        {
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", v56));
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "resources"));
          v57 += objc_msgSend(v59, "count");

          ++v56;
        }
        while ((unint64_t)objc_msgSend(v90, "count") > v56);
      }
      else
      {
        v57 = 0;
      }
      v60 = (double)v57;
      if ((double)v57 >= v54)
        v61 = v53;
      else
        v61 = v57;
      v87 = v61;
      v62 = v61 - 1;
      if ((int)v61 >= 1)
      {
        v63 = 0;
        v64 = 0;
        do
        {
          contexta = objc_autoreleasePoolPush();
          if (objc_msgSend(v55, "count"))
          {
            v65 = 0;
            while (1)
            {
              v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", v65));
              v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "resources"));
              v68 = objc_msgSend(v67, "count");

              if ((unint64_t)v68 <= v63)
              {
                v74 = v64;
              }
              else
              {
                v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", v65));
                v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "resources"));
                v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "objectAtIndexedSubscript:", v63));
                v72 = objc_msgSend(v71, "copy");

                if ((_DWORD)v64)
                {
                  if ((int)v64 > 3)
                    v73 = v64 + 297;
                  else
                    v73 = (int)v64 + 199;
                  v75 = (double)(unint64_t)v73;
                }
                else
                {
                  v75 = 100.0;
                }
                v55 = v90;
                objc_msgSend(v72, "setPriorityScore:", v75);
                v74 = (v64 + 1);
                -[NSMutableArray addObject:](v91, "addObject:", v72);

                v76 = (int)v64 < v62;
                v64 = v74;
                if (!v76)
                  goto LABEL_46;
              }
              if ((unint64_t)objc_msgSend(v55, "count") <= ++v65)
                goto LABEL_46;
            }
          }
          v74 = v64;
LABEL_46:
          objc_autoreleasePoolPop(contexta);
          ++v63;
          v64 = v74;
        }
        while (v63 != v87);
      }
      v20 = v82;
      -[MOEventBundle setResources:](v82, "setResources:", v91, v60);
      v77 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v82, "events"));
      v78 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities dominantMediaNameFromEvents:](MOContextAnnotationUtilities, "dominantMediaNameFromEvents:", v77));

      if (v78)
      {
        v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("DominantMediaNameKey")));

        if (v79)
        {
          v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "objectForKey:", CFSTR("DominantMediaNameKey")));
          -[MOMediaAggregationManager _updateMOResourceDictionary:dictKey:dictValue:](v85, "_updateMOResourceDictionary:dictKey:dictValue:", v82, CFSTR("third_party_dominate_value"), v80);

        }
      }

      v11 = v83;
      v10 = v84;
      v12 = v86;
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

int64_t __110__MOMediaAggregationManager__sortAndMergeBundlesForThirdPartyApps_playtimeDict_paramters_mediaActionIsRepeat___block_invoke(id a1, id a2, id a3)
{
  return (int64_t)objc_msgSend(a3, "compare:", a2);
}

- (id)_createMediaDictionaryFromBundles:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  void *v18;
  id obj;
  uint64_t v21;
  id v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v3;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v29;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(obj);
        v23 = v5;
        v6 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v5);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resources"));
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v25;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v25 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v11);
              v13 = objc_autoreleasePoolPush();
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "getDictionary"));
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerTitle")));

              if (v15)
              {
                v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v15));

                if (!v16)
                {
                  v17 = objc_opt_new(NSMutableArray);
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v17, v15);

                }
                v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v15));
                objc_msgSend(v18, "addObject:", v6);

              }
              objc_autoreleasePoolPop(v13);
              v11 = (char *)v11 + 1;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v9);
        }

        v5 = v23 + 1;
      }
      while ((id)(v23 + 1) != v22);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v22);
  }

  return v4;
}

@end
