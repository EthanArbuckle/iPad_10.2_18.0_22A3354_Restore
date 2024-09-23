@implementation MOSummarizationUtilities

+ (double)overlappingTimeIntervalBetween:(id)a3 andOtherBundle:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc((Class)NSDateInterval);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endDate"));

  v10 = objc_msgSend(v7, "initWithStartDate:endDate:", v8, v9);
  v11 = objc_alloc((Class)NSDateInterval);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endDate"));

  v14 = objc_msgSend(v11, "initWithStartDate:endDate:", v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "intersectionWithDateInterval:", v14));
  objc_msgSend(v15, "duration");
  v17 = v16;

  return v17;
}

+ (id)findDuplicatePhotoResourceFromBundle:(id)a3 comparedWithPrimaryBundle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSMutableArray *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  id os_log;
  NSObject *v23;
  void *v24;
  id v26;
  id obj;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  _BYTE v42[128];
  _BYTE v43[128];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resources"));
  if (!objc_msgSend(v7, "count"))
  {

    goto LABEL_25;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resources"));
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
LABEL_25:
    v10 = 0;
    goto LABEL_26;
  }
  v10 = objc_opt_new(NSMutableArray);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v26 = v5;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resources"));
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
  if (v30)
  {
    v28 = *(_QWORD *)v37;
    v29 = v6;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v37 != v28)
          objc_enumerationMutation(obj);
        v31 = v11;
        v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v11);
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resources"));
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(_QWORD *)v33 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
              if (objc_msgSend(v12, "type") == (id)2 && objc_msgSend(v18, "type") == (id)2)
              {
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "assets"));
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "assets"));
                v21 = objc_msgSend(v19, "isEqualToString:", v20);

                if (v21)
                {
                  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                  v23 = objc_claimAutoreleasedReturnValue(os_log);
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                  {
                    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "assets"));
                    *(_DWORD *)buf = 138412290;
                    v41 = v24;
                    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "duplicate photo id, %@", buf, 0xCu);

                  }
                  -[NSMutableArray addObject:](v10, "addObject:", v12);
                }
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
          }
          while (v15);
        }

        v11 = v31 + 1;
        v6 = v29;
      }
      while ((id)(v31 + 1) != v30);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    }
    while (v30);
  }

  v5 = v26;
LABEL_26:

  return v10;
}

+ (void)removeDuplicatePhotoResourceFromBundle:(id)a3 comparedWithPrimaryBundle:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "findDuplicatePhotoResourceFromBundle:comparedWithPrimaryBundle:", v6, a4));
  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resources"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __93__MOSummarizationUtilities_removeDuplicatePhotoResourceFromBundle_comparedWithPrimaryBundle___block_invoke;
    v11[3] = &unk_1002B1540;
    v12 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v11));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:", v9));

    objc_msgSend(v6, "setResources:", v10);
  }

}

uint64_t __93__MOSummarizationUtilities_removeDuplicatePhotoResourceFromBundle_comparedWithPrimaryBundle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id os_log;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  int v12;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) ^ 1;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "assets"));
    v9 = 138412546;
    v10 = v7;
    v11 = 1024;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "photo id, %@, should keep, %d", (uint8_t *)&v9, 0x12u);

  }
  return v4;
}

+ (id)getResourcesFromBundles:(id)a3 forSummaryBundle:(id)a4 withParameters:(id)a5
{
  void *v5;
  id v9;
  id v10;
  NSMutableDictionary *v11;
  _UNKNOWN **v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  float v30;
  float v31;
  float v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  float v37;
  float v38;
  float v39;
  float v40;
  BOOL v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  NSMutableArray *v46;
  void *v47;
  id v48;
  NSMutableDictionary *v49;
  id v50;
  uint64_t v51;
  void *i;
  id v53;
  NSMutableDictionary *v54;
  NSMutableDictionary *v55;
  void *v56;
  NSMutableArray *v57;
  unsigned __int8 v58;
  void *v59;
  id v60;
  id v61;
  uint64_t v62;
  void *j;
  id v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  _BOOL8 v69;
  NSMutableArray *v71;
  id v72;
  id v73;
  id obj;
  NSMutableDictionary *v75;
  NSMutableDictionary *v76;
  NSMutableArray *v77;
  NSMutableDictionary *v78;
  void *v79;
  id v80;
  uint64_t v81;
  id v82;
  NSMutableDictionary *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];

  v9 = a3;
  v10 = a4;
  v80 = a5;
  if (!objc_msgSend(v9, "count"))
  {
    v57 = 0;
    goto LABEL_60;
  }
  v73 = a1;
  v71 = objc_opt_new(NSMutableArray);
  v78 = objc_opt_new(NSMutableDictionary);
  v76 = objc_opt_new(NSMutableDictionary);
  v75 = objc_opt_new(NSMutableDictionary);
  v11 = objc_opt_new(NSMutableDictionary);
  v77 = objc_opt_new(NSMutableArray);
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v72 = v9;
  obj = v9;
  v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v104, 16);
  if (!v82)
    goto LABEL_32;
  v81 = *(_QWORD *)v99;
  v12 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
  v83 = v11;
  v84 = v10;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v99 != v81)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)v13);
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12[322], "predicateWithFormat:", CFSTR("type == %lu"), 10));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "resources"));
      v88 = (void *)v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "filteredArrayUsingPredicate:", v15));

      if (objc_msgSend(v17, "count"))
        -[NSMutableDictionary setObject:forKey:](v78, "setObject:forKey:", v17, v14);
      v87 = v17;
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12[322], "predicateWithFormat:", CFSTR("type == %lu"), 2));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "resources"));
      v86 = (void *)v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "filteredArrayUsingPredicate:", v18));

      if (objc_msgSend(v20, "count"))
        -[NSMutableDictionary setObject:forKey:](v76, "setObject:forKey:", v20, v14);
      v85 = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12[322], "predicateWithFormat:", CFSTR("type == %lu"), 3));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "resources"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "filteredArrayUsingPredicate:", v21));

      if (objc_msgSend(v23, "count"))
        -[NSMutableDictionary setObject:forKey:](v75, "setObject:forKey:", v23, v14);
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12[322], "predicateWithFormat:", CFSTR("type == %lu"), 6));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "resources"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "filteredArrayUsingPredicate:", v24));

      if (objc_msgSend(v26, "count"))
      {
        v27 = objc_msgSend(v26, "copy");
        -[NSMutableArray addObjectsFromArray:](v77, "addObjectsFromArray:", v27);

      }
      v28 = objc_msgSend(v10, "bundleSuperType");
      if (v28 == (id)1)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metaDataForRank"));
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("VisitDuration")));
        objc_msgSend(v5, "floatValue");
        v31 = v30;
        objc_msgSend(v80, "emotionAttachmentBundleDurationThreshold");
        if (v31 < v32)
        {

          v33 = v5;
LABEL_26:
          v42 = v21;
          v43 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("type == %lu"), 16));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "resources"));
          v89 = (void *)v43;
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "filteredArrayUsingPredicate:", v43));

          if (objc_msgSend(v45, "count"))
            -[NSMutableDictionary setObject:forKey:](v83, "setObject:forKey:", v45, v14);
          v21 = v42;
          v5 = v45;
LABEL_29:

          v89 = v29;
          v5 = v33;
          goto LABEL_30;
        }
        v34 = objc_msgSend(v10, "bundleSuperType");
        v89 = v29;
        v33 = v5;
        if (v34 != (id)2)
          goto LABEL_29;
      }
      else if (objc_msgSend(v10, "bundleSuperType") != (id)2)
      {
        goto LABEL_30;
      }
      v79 = v21;
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "metaDataForRank"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("WorkoutDuration")));
      objc_msgSend(v36, "floatValue");
      v38 = v37;
      objc_msgSend(v80, "emotionAttachmentBundleDurationThreshold");
      v40 = v39;

      if (v28 == (id)1)
      {

        v29 = v89;
        v41 = v38 < v40;
      }
      else
      {
        v41 = v38 < v40;
        v29 = v89;
      }
      v33 = v5;
      v21 = v79;
      if (v41)
        goto LABEL_26;
LABEL_30:

      v13 = (char *)v13 + 1;
      v11 = v83;
      v10 = v84;
      v12 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
    }
    while (v82 != v13);
    v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v104, 16);
  }
  while (v82);
LABEL_32:

  if (objc_msgSend(v10, "bundleSubType") == (id)202)
  {
    v46 = objc_opt_new(NSMutableArray);
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "places"));
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
    v49 = v75;
    if (v48)
    {
      v50 = v48;
      v51 = *(_QWORD *)v95;
      do
      {
        for (i = 0; i != v50; i = (char *)i + 1)
        {
          if (*(_QWORD *)v95 != v51)
            objc_enumerationMutation(v47);
          v53 = objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)i), "copy");
          objc_msgSend(v53, "setPriorityScore:", 20000.0);
          -[NSMutableArray addObject:](v46, "addObject:", v53);

        }
        v50 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
      }
      while (v50);
    }

    objc_msgSend(v10, "setPlaces:", v46);
    v54 = v78;
    v55 = v76;
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "getResourcesForWeeklyWorkoutSummaryBundleWithWorkoutResources:photoResources:mediaResources:", v78, v76, v75));
    v57 = v71;
    v9 = v72;
    goto LABEL_59;
  }
  if (-[NSMutableDictionary count](v78, "count") == (id)1)
    v58 = objc_msgSend(v73, "hasWorkoutRoute:", v10);
  else
    v58 = 0;
  v46 = objc_opt_new(NSMutableArray);
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "places"));
  v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
  if (v60)
  {
    v61 = v60;
    v62 = *(_QWORD *)v91;
    do
    {
      for (j = 0; j != v61; j = (char *)j + 1)
      {
        if (*(_QWORD *)v91 != v62)
          objc_enumerationMutation(v59);
        v64 = objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * (_QWORD)j), "copy");
        v65 = v64;
        v66 = 20000.0;
        if ((v58 & 1) == 0)
        {
          objc_msgSend(v64, "priorityScore", 20000.0);
          if (v67 == 20000.0)
            goto LABEL_54;
          v66 = 200.0;
        }
        objc_msgSend(v65, "setPriorityScore:", v66);
LABEL_54:
        -[NSMutableArray addObject:](v46, "addObject:", v65);

      }
      v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
    }
    while (v61);
  }

  objc_msgSend(v10, "setPlaces:", v46);
  v57 = v71;
  if ((v58 & 1) == 0)
    -[NSMutableArray addObjectsFromArray:](v71, "addObjectsFromArray:", v77);
  v54 = v78;
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v78, "allKeys"));
  v69 = objc_msgSend(v68, "count") == 0;

  v49 = v75;
  v55 = v76;
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "getResourcesForOutingSummaryBundleWithWorkoutResources:photoResources:mediaResources:emotionResources:shouldUpLevelPhoto:", v78, v76, v75, v11, v69));
  v9 = v72;
LABEL_59:
  -[NSMutableArray addObjectsFromArray:](v57, "addObjectsFromArray:", v56);

LABEL_60:
  return v57;
}

+ (id)getResourcesForWeeklyWorkoutSummaryBundleWithWorkoutResources:(id)a3 photoResources:(id)a4 mediaResources:(id)a5
{
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  MOResource *v17;
  void *v18;
  id v19;
  void *v20;
  MOResource *v21;
  void *v22;
  id v24;
  id v25;
  void *v26;
  id obj;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];

  v7 = a3;
  v25 = a4;
  v24 = a5;
  v8 = objc_opt_new(NSMutableArray);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v26 = v7;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allValues"));
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v29)
  {
    v28 = *(_QWORD *)v37;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v37 != v28)
          objc_enumerationMutation(obj);
        v30 = v9;
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v9);
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v31 = v10;
        v11 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v32, v40, 16, v24, v25);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v33;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v33 != v13)
                objc_enumerationMutation(v31);
              v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v14);
              v16 = objc_autoreleasePoolPush();
              v17 = [MOResource alloc];
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
              v19 = objc_msgSend(v15, "type");
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "getDictionary"));
              objc_msgSend(v15, "value");
              v21 = -[MOResource initWithName:type:dict:value:](v17, "initWithName:type:dict:value:", v18, v19, v20);

              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sourceEventIdentifier"));
              -[MOResource setSourceEventIdentifier:](v21, "setSourceEventIdentifier:", v22);

              -[MOResource setSourceEventAccessType:](v21, "setSourceEventAccessType:", objc_msgSend(v15, "sourceEventAccessType"));
              -[MOResource setPriorityScore:](v21, "setPriorityScore:", 100.0);
              -[NSMutableArray addObject:](v8, "addObject:", v21);

              objc_autoreleasePoolPop(v16);
              v14 = (char *)v14 + 1;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          }
          while (v12);
        }

        v9 = v30 + 1;
      }
      while ((id)(v30 + 1) != v29);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v29);
  }

  return v8;
}

+ (id)getResourcesForOutingSummaryBundleWithWorkoutResources:(id)a3 photoResources:(id)a4 mediaResources:(id)a5 emotionResources:(id)a6 shouldUpLevelPhoto:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  MOResource *v27;
  void *v28;
  id v29;
  void *v30;
  MOResource *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id obj;
  uint64_t v45;
  id v46;
  uint64_t v47;
  NSMutableArray *v48;
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

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v48 = objc_opt_new(NSMutableArray);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allValues"));
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    v38 = v7;
    v39 = a1;
    v40 = v15;
    v41 = v14;
    v42 = v13;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v43 = v12;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allValues"));
    v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v46)
    {
      v45 = *(_QWORD *)v54;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v54 != v45)
            objc_enumerationMutation(obj);
          v47 = v18;
          v19 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v18);
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          v20 = v19;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v50;
            do
            {
              v24 = 0;
              do
              {
                if (*(_QWORD *)v50 != v23)
                  objc_enumerationMutation(v20);
                v25 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)v24);
                v26 = objc_autoreleasePoolPush();
                v27 = [MOResource alloc];
                v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "name"));
                v29 = objc_msgSend(v25, "type");
                v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "getDictionary"));
                objc_msgSend(v25, "value");
                v31 = -[MOResource initWithName:type:dict:value:](v27, "initWithName:type:dict:value:", v28, v29, v30);

                v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "sourceEventIdentifier"));
                -[MOResource setSourceEventIdentifier:](v31, "setSourceEventIdentifier:", v32);

                -[MOResource setSourceEventAccessType:](v31, "setSourceEventAccessType:", objc_msgSend(v25, "sourceEventAccessType"));
                -[MOResource setPriorityScore:](v31, "setPriorityScore:", 100.0);
                -[NSMutableArray addObject:](v48, "addObject:", v31);

                objc_autoreleasePoolPop(v26);
                v24 = (char *)v24 + 1;
              }
              while (v22 != v24);
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
            }
            while (v22);
          }

          v18 = v47 + 1;
        }
        while ((id)(v47 + 1) != v46);
        v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      }
      while (v46);
    }

    v13 = v42;
    v12 = v43;
    v15 = v40;
    v14 = v41;
    a1 = v39;
    v7 = v38;
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "combinePhotoResources:", v13));
  if (objc_msgSend(v33, "count"))
  {
    if (v7)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "firstObject"));
      objc_msgSend(v34, "setPriorityScore:", 100.0);

    }
    -[NSMutableArray addObjectsFromArray:](v48, "addObjectsFromArray:", v33);
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "combineMediaResources:", v14));
  if (objc_msgSend(v35, "count"))
    -[NSMutableArray addObjectsFromArray:](v48, "addObjectsFromArray:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "combineEmotionResources:", v15));
  if (objc_msgSend(v36, "count"))
    -[NSMutableArray addObjectsFromArray:](v48, "addObjectsFromArray:", v36);

  return v48;
}

+ (id)combineEmotionResources:(id)a3
{
  id v3;
  NSMutableSet *v4;
  NSMutableArray *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  double v28;
  void *v29;
  id v30;
  void *v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  id v40;

  v3 = a3;
  v4 = objc_opt_new(NSMutableSet);
  v5 = objc_opt_new(NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
    v32 = v8;
    v40 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v40, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sortedArrayUsingDescriptors:", v10));

    if (objc_msgSend(v11, "count"))
    {
      v12 = 0;
      v13 = 401.0;
      v33 = v11;
      v34 = v3;
      do
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v12));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v14));
        v16 = objc_msgSend(v15, "count");

        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v12));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v17));

          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v19 = v18;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v36;
            do
            {
              v23 = 0;
              do
              {
                if (*(_QWORD *)v36 != v22)
                  objc_enumerationMutation(v19);
                v24 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v23);
                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "assets"));
                v26 = -[NSMutableSet containsObject:](v4, "containsObject:", v25);

                if ((v26 & 1) == 0)
                {
                  if (!v12
                    && (v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject")),
                        v27,
                        v24 == v27))
                  {
                    v28 = 203.0;
                  }
                  else
                  {
                    v28 = v13;
                    v13 = v13 + 1.0;
                  }
                  objc_msgSend(v24, "setPriorityScore:", v28);
                  -[NSMutableArray addObject:](v5, "addObject:", v24);
                  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "assets"));
                  -[NSMutableSet addObject:](v4, "addObject:", v29);

                }
                v23 = (char *)v23 + 1;
              }
              while (v21 != v23);
              v30 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
              v21 = v30;
            }
            while (v30);
          }

          v11 = v33;
          v3 = v34;
        }
        ++v12;
      }
      while ((unint64_t)objc_msgSend(v11, "count") > v12);
    }

  }
  return v5;
}

+ (id)combinePhotoResources:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MOResource *v15;
  void *v16;
  id v17;
  void *v18;
  MOResource *v19;
  void *v20;
  void *v21;
  void *v22;
  id os_log;
  NSObject *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  MOResource *v37;
  void *v38;
  id v39;
  void *v40;
  MOResource *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  id v48;
  unint64_t v49;
  void *v50;
  uint64_t v51;
  int v52;
  NSMutableArray *v53;
  void *v54;
  unint64_t v55;
  void *v56;
  void *v57;
  int v58;
  uint64_t v59;
  unint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  unsigned __int8 v64;
  MOResource *v65;
  void *v66;
  id v67;
  void *v68;
  MOResource *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  void *v76;
  double v77;
  id v78;
  NSObject *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  MOResource *v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  int v89;
  signed int v90;
  void *v91;
  void *context;
  void *v93;
  NSMutableArray *v94;
  NSMutableArray *v95;
  uint8_t buf[4];
  void *v97;
  __int16 v98;
  uint64_t v99;
  id v100;

  v4 = a3;
  v94 = objc_opt_new(NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sortedBundleByPhotoAssetsCount:", v7));

    v9 = objc_opt_new(NSMutableArray);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v10));

    v87 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("photoCurationScore"), 0);
    v100 = v87;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v100, 1));
    v88 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sortedArrayUsingDescriptors:", v12));

    v86 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
    v15 = [MOResource alloc];
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
    v17 = objc_msgSend(v14, "type");
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getDictionary"));
    objc_msgSend(v14, "value");
    v19 = -[MOResource initWithName:type:dict:value:](v15, "initWithName:type:dict:value:", v16, v17, v18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sourceEventIdentifier"));
    -[MOResource setSourceEventIdentifier:](v19, "setSourceEventIdentifier:", v20);

    -[MOResource setSourceEventAccessType:](v19, "setSourceEventAccessType:", objc_msgSend(v14, "sourceEventAccessType"));
    -[MOResource setPriorityScore:](v19, "setPriorityScore:", 201.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "photoCurationScore"));
    -[MOResource setPhotoCurationScore:](v19, "setPhotoCurationScore:", v21);

    -[MOResource setPhotoFaceCount:](v19, "setPhotoFaceCount:", objc_msgSend(v14, "photoFaceCount"));
    objc_msgSend(v14, "photoOverallAestheticScore");
    -[MOResource setPhotoOverallAestheticScore:](v19, "setPhotoOverallAestheticScore:");
    -[MOResource setPhotoAssetMediaType:](v19, "setPhotoAssetMediaType:", objc_msgSend(v14, "photoAssetMediaType"));
    v85 = v14;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "assets"));
    -[MOResource setAssets:](v19, "setAssets:", v22);

    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v24 = objc_claimAutoreleasedReturnValue(os_log);
    v25 = v4;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      +[MOSummarizationUtilities combinePhotoResources:].cold.1(v19);

    -[NSMutableArray addObject:](v94, "addObject:", v19);
    v84 = v19;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource assets](v19, "assets"));
    v95 = v9;
    -[NSMutableArray addObject:](v9, "addObject:", v26);

    v93 = v8;
    if ((unint64_t)objc_msgSend(v8, "count") >= 2)
    {
      v27 = 301;
      do
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v27 - 300));
        v29 = v8;
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKey:", v28));
        v31 = objc_msgSend(v30, "count");

        if (v31)
        {
          v32 = objc_autoreleasePoolPush();
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndexedSubscript:", v27 - 300));
          v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKey:", v33));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v34, "firstObject"));

          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "assets"));
          LOBYTE(v34) = -[NSMutableArray containsObject:](v95, "containsObject:", v36);

          if ((v34 & 1) == 0)
          {
            v37 = [MOResource alloc];
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "name"));
            v39 = objc_msgSend(v35, "type");
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "getDictionary"));
            objc_msgSend(v35, "value");
            v41 = -[MOResource initWithName:type:dict:value:](v37, "initWithName:type:dict:value:", v38, v39, v40);

            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "sourceEventIdentifier"));
            -[MOResource setSourceEventIdentifier:](v41, "setSourceEventIdentifier:", v42);

            -[MOResource setSourceEventAccessType:](v41, "setSourceEventAccessType:", objc_msgSend(v35, "sourceEventAccessType"));
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "photoCurationScore"));
            -[MOResource setPhotoCurationScore:](v41, "setPhotoCurationScore:", v43);

            -[MOResource setPhotoFaceCount:](v41, "setPhotoFaceCount:", objc_msgSend(v35, "photoFaceCount"));
            objc_msgSend(v35, "photoOverallAestheticScore");
            -[MOResource setPhotoOverallAestheticScore:](v41, "setPhotoOverallAestheticScore:");
            -[MOResource setPhotoAssetMediaType:](v41, "setPhotoAssetMediaType:", objc_msgSend(v35, "photoAssetMediaType"));
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "assets"));
            -[MOResource setAssets:](v41, "setAssets:", v44);

            -[MOResource setPriorityScore:](v41, "setPriorityScore:", (double)v27);
            v45 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            v46 = objc_claimAutoreleasedReturnValue(v45);
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              v50 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource assets](v41, "assets"));
              -[MOResource priorityScore](v41, "priorityScore");
              *(_DWORD *)buf = 138412546;
              v97 = v50;
              v98 = 2048;
              v99 = v51;
              _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "auxiliary photo asset, %@, priority score, %f", buf, 0x16u);

            }
            -[NSMutableArray addObject:](v94, "addObject:", v41);
            v47 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource assets](v41, "assets"));
            -[NSMutableArray addObject:](v95, "addObject:", v47);

          }
          objc_autoreleasePoolPop(v32);
          v29 = v93;
        }
        v48 = objc_msgSend(v29, "count");
        v49 = v27 - 299;
        ++v27;
        v8 = v29;
      }
      while ((unint64_t)v48 > v49);
    }
    v52 = -[NSMutableArray count](v94, "count");
    v53 = v95;
    if (v52 < 11)
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "allValues"));
      v90 = objc_msgSend(v54, "count");

      if (objc_msgSend(v8, "count"))
      {
        v55 = 0;
        v89 = 11 - v52;
        v91 = v25;
        do
        {
          context = objc_autoreleasePoolPush();
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v55));
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKey:", v56));

          if (objc_msgSend(v57, "count"))
          {
            v58 = (int)objc_msgSend(v57, "count") / v90 * v89;
            if (v58 >= 1)
            {
              v59 = (v58 + 1);
              v60 = 1;
              do
              {
                v61 = objc_autoreleasePoolPush();
                if ((unint64_t)objc_msgSend(v57, "count") > v60)
                {
                  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectAtIndexedSubscript:", v60));
                  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "assets"));
                  v64 = -[NSMutableArray containsObject:](v53, "containsObject:", v63);

                  if ((v64 & 1) == 0)
                  {
                    v65 = [MOResource alloc];
                    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "name"));
                    v67 = objc_msgSend(v62, "type");
                    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "getDictionary"));
                    objc_msgSend(v62, "value");
                    v69 = -[MOResource initWithName:type:dict:value:](v65, "initWithName:type:dict:value:", v66, v67, v68);

                    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "sourceEventIdentifier"));
                    -[MOResource setSourceEventIdentifier:](v69, "setSourceEventIdentifier:", v70);

                    -[MOResource setSourceEventAccessType:](v69, "setSourceEventAccessType:", objc_msgSend(v62, "sourceEventAccessType"));
                    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "photoCurationScore"));
                    -[MOResource setPhotoCurationScore:](v69, "setPhotoCurationScore:", v71);

                    -[MOResource setPhotoFaceCount:](v69, "setPhotoFaceCount:", objc_msgSend(v62, "photoFaceCount"));
                    objc_msgSend(v62, "photoOverallAestheticScore");
                    -[MOResource setPhotoOverallAestheticScore:](v69, "setPhotoOverallAestheticScore:");
                    -[MOResource setPhotoAssetMediaType:](v69, "setPhotoAssetMediaType:", objc_msgSend(v62, "photoAssetMediaType"));
                    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "assets"));
                    -[MOResource setAssets:](v69, "setAssets:", v72);

                    v73 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v94, "lastObject"));
                    objc_msgSend(v73, "priorityScore");
                    v75 = v74;

                    if (v75 >= 300.0)
                    {
                      v76 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v94, "lastObject"));
                      objc_msgSend(v76, "priorityScore");
                      -[MOResource setPriorityScore:](v69, "setPriorityScore:", v77 + 1.0);

                    }
                    else
                    {
                      -[MOResource setPriorityScore:](v69, "setPriorityScore:", 300.0);
                    }
                    v78 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                    v79 = objc_claimAutoreleasedReturnValue(v78);
                    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
                    {
                      v81 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource assets](v69, "assets"));
                      -[MOResource priorityScore](v69, "priorityScore");
                      *(_DWORD *)buf = 138412546;
                      v97 = v81;
                      v98 = 2048;
                      v99 = v82;
                      _os_log_debug_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEBUG, "remaining photo asset, %@, priority score, %f", buf, 0x16u);

                    }
                    -[NSMutableArray addObject:](v94, "addObject:", v69);
                    v80 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource assets](v69, "assets"));
                    v53 = v95;
                    -[NSMutableArray addObject:](v95, "addObject:", v80);

                  }
                }
                objc_autoreleasePoolPop(v61);
                ++v60;
              }
              while (v59 != v60);
            }
          }

          objc_autoreleasePoolPop(context);
          ++v55;
          v8 = v93;
          v25 = v91;
        }
        while ((unint64_t)objc_msgSend(v93, "count") > v55);
      }
    }

    v4 = v25;
  }

  return v94;
}

+ (id)combineMediaResources:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  id v15;
  NSMutableArray *v16;
  NSMutableArray *v17;
  NSMutableArray *v18;
  void *v19;
  __int128 v20;
  unint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  double v28;
  void *v29;
  void *v30;
  MOResource *v31;
  id v32;
  MOResource *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  id os_log;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  __int128 v49;
  unint64_t v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  double v57;
  void *v58;
  void *v59;
  MOResource *v60;
  id v61;
  MOResource *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  MOResource *v70;
  double v71;
  void *v72;
  double v73;
  id v74;
  NSObject *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  __int128 v80;
  __int128 v81;
  void *v82;
  void *v83;
  NSMutableArray *v84;
  id v85;
  void *context;
  void *contexta;
  NSMutableArray *v88;
  NSMutableArray *v89;
  unint64_t v90;
  unint64_t v91;
  NSMutableArray *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint8_t buf[4];
  void *v98;
  __int16 v99;
  uint64_t v100;
  _BYTE v101[128];

  v3 = a3;
  v89 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = objc_opt_new(NSMutableArray);
    v7 = objc_opt_new(NSMutableArray);
    v92 = objc_opt_new(NSMutableArray);
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v93, v101, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v94;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v94 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "action"));
          v15 = objc_msgSend(v14, "actionType");

          if (v15 == (id)4)
            v16 = v6;
          else
            v16 = v7;
          -[NSMutableArray addObject:](v16, "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v93, v101, 16);
      }
      while (v10);
    }

    v17 = v89;
    v84 = v6;
    v85 = v3;
    v18 = v92;
    if (-[NSMutableArray count](v6, "count"))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortBundlesByTimespan](v6, "sortBundlesByTimespan"));
      if (objc_msgSend(v19, "count"))
      {
        v21 = 0;
        *(_QWORD *)&v20 = 138412546;
        v80 = v20;
        v82 = v19;
        v88 = v7;
        do
        {
          context = objc_autoreleasePoolPush();
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", v21));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v22));
          v24 = objc_msgSend(v23, "count");

          if (v24)
          {
            v90 = v21;
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", v21));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v25));

            if (objc_msgSend(v26, "count"))
            {
              v27 = 0;
              v28 = (double)(v21 + 310);
              while (1)
              {
                v29 = objc_autoreleasePoolPush();
                v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectAtIndexedSubscript:", v27));
                v31 = (MOResource *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "name"));
                if ((-[NSMutableArray containsObject:](v18, "containsObject:", v31) & 1) != 0)
                  goto LABEL_31;
                v32 = -[NSMutableArray count](v17, "count");

                if ((unint64_t)v32 <= 0xB)
                  break;
LABEL_32:

                objc_autoreleasePoolPop(v29);
                if ((unint64_t)objc_msgSend(v26, "count") <= ++v27)
                  goto LABEL_33;
              }
              v33 = [MOResource alloc];
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "name"));
              v35 = objc_msgSend(v30, "type");
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "getDictionary"));
              objc_msgSend(v30, "value");
              v31 = -[MOResource initWithName:type:dict:value:](v33, "initWithName:type:dict:value:", v34, v35, v36);

              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "sourceEventIdentifier"));
              -[MOResource setSourceEventIdentifier:](v31, "setSourceEventIdentifier:", v37);

              -[MOResource setSourceEventAccessType:](v31, "setSourceEventAccessType:", objc_msgSend(v30, "sourceEventAccessType"));
              if (v90 | v27)
              {
                v18 = v92;
                if (v90 || v27 != 1)
                {
                  v17 = v89;
                  v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v89, "lastObject", v80));
                  objc_msgSend(v38, "priorityScore");
                  v40 = v39;

                  if (v40 >= 300.0)
                  {
                    v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v89, "lastObject"));
                    objc_msgSend(v41, "priorityScore");
                    -[MOResource setPriorityScore:](v31, "setPriorityScore:", v42 + 1.0);

                  }
                  else
                  {
                    -[MOResource setPriorityScore:](v31, "setPriorityScore:", 310.0);
                  }
                }
                else
                {
                  -[MOResource setPriorityScore:](v31, "setPriorityScore:", v28);
                  v17 = v89;
                }
              }
              else
              {
                -[MOResource setPriorityScore:](v31, "setPriorityScore:", 202.0);
                v17 = v89;
                v18 = v92;
              }
              v7 = v88;
              os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
              v44 = objc_claimAutoreleasedReturnValue(os_log);
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              {
                v46 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource name](v31, "name"));
                -[MOResource priorityScore](v31, "priorityScore");
                *(_DWORD *)buf = v80;
                v98 = v46;
                v99 = 2048;
                v100 = v47;
                _os_log_debug_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "media asset from workout name, %@, priority score, %f", buf, 0x16u);

              }
              -[NSMutableArray addObject:](v17, "addObject:", v31);
              v45 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource name](v31, "name"));
              -[NSMutableArray addObject:](v18, "addObject:", v45);

LABEL_31:
              goto LABEL_32;
            }
LABEL_33:

            v6 = v84;
            v3 = v85;
            v19 = v82;
            v21 = v90;
          }
          objc_autoreleasePoolPop(context);
          ++v21;
        }
        while ((unint64_t)objc_msgSend(v19, "count") > v21);
      }

    }
    if ((int)-[NSMutableArray count](v17, "count", v80) <= 10 && -[NSMutableArray count](v7, "count"))
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortBundlesByTimespan](v7, "sortBundlesByTimespan"));
      if (objc_msgSend(v48, "count"))
      {
        v50 = 0;
        *(_QWORD *)&v49 = 138412546;
        v81 = v49;
        v83 = v48;
        do
        {
          contexta = objc_autoreleasePoolPush();
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectAtIndexedSubscript:", v50));
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v51));
          v53 = objc_msgSend(v52, "count");

          if (v53)
          {
            v91 = v50;
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectAtIndexedSubscript:", v50));
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v54));

            if (objc_msgSend(v55, "count"))
            {
              v56 = 0;
              v57 = (double)(v50 + 310);
              while (1)
              {
                v58 = objc_autoreleasePoolPush();
                v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectAtIndexedSubscript:", v56));
                v60 = (MOResource *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "name"));
                if ((-[NSMutableArray containsObject:](v18, "containsObject:", v60) & 1) != 0)
                  goto LABEL_56;
                v61 = -[NSMutableArray count](v17, "count");

                if ((unint64_t)v61 <= 0xA)
                  break;
LABEL_57:

                objc_autoreleasePoolPop(v58);
                if ((unint64_t)objc_msgSend(v55, "count") <= ++v56)
                  goto LABEL_58;
              }
              v62 = [MOResource alloc];
              v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "name"));
              v64 = objc_msgSend(v59, "type");
              v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "getDictionary"));
              objc_msgSend(v59, "value");
              v60 = -[MOResource initWithName:type:dict:value:](v62, "initWithName:type:dict:value:", v63, v64, v65);

              v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "sourceEventIdentifier"));
              -[MOResource setSourceEventIdentifier:](v60, "setSourceEventIdentifier:", v66);

              -[MOResource setSourceEventAccessType:](v60, "setSourceEventAccessType:", objc_msgSend(v59, "sourceEventAccessType"));
              if (-[NSMutableArray count](v17, "count"))
              {
                v67 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v17, "lastObject"));
                objc_msgSend(v67, "priorityScore");
                v69 = v68;

                if (v69 < 300.0)
                {
                  v70 = v60;
                  v71 = 310.0;
                  goto LABEL_52;
                }
                v72 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v17, "lastObject"));
                objc_msgSend(v72, "priorityScore");
                -[MOResource setPriorityScore:](v60, "setPriorityScore:", v73 + 1.0);

              }
              else
              {
                v70 = v60;
                if (v91 | v56)
                  v71 = v57;
                else
                  v71 = 202.0;
LABEL_52:
                -[MOResource setPriorityScore:](v70, "setPriorityScore:", v71, v81);
              }
              v18 = v92;
              v74 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
              v75 = objc_claimAutoreleasedReturnValue(v74);
              if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
              {
                v77 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource name](v60, "name"));
                -[MOResource priorityScore](v60, "priorityScore");
                *(_DWORD *)buf = v81;
                v98 = v77;
                v99 = 2048;
                v100 = v78;
                _os_log_debug_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEBUG, "media asset from outing name, %@, priority score, %f", buf, 0x16u);

              }
              -[NSMutableArray addObject:](v17, "addObject:", v60);
              v76 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource name](v60, "name"));
              -[NSMutableArray addObject:](v92, "addObject:", v76);

LABEL_56:
              goto LABEL_57;
            }
LABEL_58:

            v6 = v84;
            v3 = v85;
            v48 = v83;
            v50 = v91;
          }
          objc_autoreleasePoolPop(contexta);
          ++v50;
        }
        while ((unint64_t)objc_msgSend(v48, "count") > v50);
      }

    }
  }

  return v89;
}

+ (void)removeUnnecessaryResourceFromWorkoutSummaryBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resources"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &__block_literal_global_20));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filteredArrayUsingPredicate:", v5));

  objc_msgSend(v3, "setResources:", v6);
}

BOOL __78__MOSummarizationUtilities_removeUnnecessaryResourceFromWorkoutSummaryBundle___block_invoke(id a1, MOResource *a2, NSDictionary *a3)
{
  MOResource *v3;
  BOOL v4;

  v3 = a2;
  v4 = (id)-[MOResource type](v3, "type") == (id)10
    || (id)-[MOResource type](v3, "type") == (id)2
    || (id)-[MOResource type](v3, "type") == (id)3;

  return v4;
}

+ (id)createMegaBundleFromBundles:(id)a3 parameters:(id)a4 timeZoneManager:(id)a5
{
  id v7;
  id v8;
  MOEventBundle *v9;
  MOEventBundle *v10;
  void *v11;
  void *v12;
  NSMutableSet *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
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
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  _BYTE v37[128];

  v7 = a3;
  v8 = a5;
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    v10 = [MOEventBundle alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v9 = -[MOEventBundle initWithBundleIdentifier:creationDate:](v10, "initWithBundleIdentifier:creationDate:", v11, v12);

    v13 = objc_opt_new(NSMutableSet);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v14 = v7;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v33;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v33 != v17)
            objc_enumerationMutation(v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v18), "events", (_QWORD)v32));
          -[NSMutableSet addObjectsFromArray:](v13, "addObjectsFromArray:", v19);

          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v16);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v13, "allObjects"));
    -[MOEventBundle setEvents:](v9, "setEvents:", v20);

    -[MOEventBundle setPropertiesBasedOnEvents](v9, "setPropertiesBasedOnEvents");
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getTimeSpanOfMOEventBundleArray"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "startDate"));
    -[MOEventBundle setStartDate:](v9, "setStartDate:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "endDate"));
    -[MOEventBundle setEndDate:](v9, "setEndDate:", v23);

    objc_msgSend(a1, "updateRankMetaDataFrom:forSummaryBundle:", v14, v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v9, "events"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1));
    v36 = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "sortedArrayUsingDescriptors:", v26));

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "lastObject"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "endDate"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeForDate:timeZoneManager:](MOTime, "timeForDate:timeZoneManager:", v29, v8));
    -[MOEventBundle setTime:](v9, "setTime:", v30);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (void)updateRankMetaDataFrom:(id)a3 forSummaryBundle:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  int v9;
  uint64_t v10;
  void *i;
  id v12;
  double v13;
  float v14;
  float v15;
  float v16;
  void *j;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  float v25;
  float v26;
  id os_log;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  void *v34;
  void *v35;
  float v36;
  float v37;
  void *v38;
  void *v39;
  float v40;
  float v41;
  void *v42;
  void *v43;
  float v44;
  float v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  float v52;
  float v53;
  void *v54;
  void *v55;
  float v56;
  float v57;
  void *v58;
  void *v59;
  float v60;
  float v61;
  NSObject *v62;
  void *v63;
  float v64;
  float v65;
  void *v66;
  void *v67;
  float v68;
  void *v69;
  void *v70;
  float v71;
  void *v72;
  void *v73;
  float v74;
  void *v75;
  void *v76;
  float v77;
  void *v78;
  void *v79;
  float v80;
  void *v81;
  void *v82;
  void *v83;
  float v84;
  float v85;
  void *v86;
  void *v87;
  float v88;
  float v89;
  NSObject *v90;
  void *v91;
  float v92;
  float v93;
  void *v94;
  void *v95;
  double v96;
  double v97;
  float v98;
  void *v99;
  void *v100;
  unsigned int v101;
  _BOOL4 v102;
  BOOL v103;
  float v104;
  id v105;
  void *v106;
  void *v107;
  float v108;
  float v109;
  void *v110;
  void *v111;
  float v112;
  float v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  float v130;
  float v131;
  float v132;
  id v133;
  void *v134;
  void *v135;
  void *v136;
  unsigned __int8 v137;
  void *v138;
  void *v139;
  float v140;
  float v141;
  void *v142;
  void *v143;
  float v144;
  float v145;
  void *v146;
  void *v147;
  float v148;
  float v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  float v166;
  float v167;
  void *v168;
  void *v169;
  double v170;
  double v171;
  double v172;
  float v173;
  float v174;
  float v175;
  _UNKNOWN **v176;
  void *v177;
  void *v178;
  double v179;
  void *v180;
  double v181;
  void *v182;
  double v183;
  void *v184;
  double v185;
  void *v186;
  double v187;
  void *v188;
  double v189;
  void *v190;
  void *v191;
  double v192;
  float v193;
  float v194;
  float v195;
  float v196;
  float v197;
  void *v198;
  void *v199;
  void *v200;
  double v201;
  void *v202;
  double v203;
  void *v204;
  double v205;
  void *v206;
  void *v207;
  void *v208;
  double v209;
  void *v210;
  double v211;
  void *v212;
  double v213;
  void *v214;
  double v215;
  void *v216;
  void *v217;
  double v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  double v228;
  float v229;
  _BOOL4 v230;
  float v231;
  float v232;
  float v233;
  float v234;
  float v235;
  float v236;
  float v237;
  float v238;
  float v239;
  float v240;
  NSMutableArray *v241;
  NSMutableArray *v242;
  NSMutableArray *v243;
  NSMutableArray *v244;
  float v245;
  float v246;
  float v247;
  id v250;
  float v251;
  float v252;
  float v253;
  float v254;
  uint64_t v255;
  id v256;
  char v257;
  _BYTE v258[15];
  char v259;
  _BYTE v260[15];
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  uint8_t buf[4];
  const char *v270;
  __int16 v271;
  int v272;
  _BYTE v273[128];
  _BYTE v274[128];

  v5 = a3;
  v6 = a4;
  v265 = 0u;
  v266 = 0u;
  v267 = 0u;
  v268 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v265, v274, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v266;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v266 != v10)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v265 + 1) + 8 * (_QWORD)i), "interfaceType") == (id)2)
          ++v9;
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v265, v274, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  v244 = objc_opt_new(NSMutableArray);
  v243 = objc_opt_new(NSMutableArray);
  v242 = objc_opt_new(NSMutableArray);
  v241 = objc_opt_new(NSMutableArray);
  v261 = 0u;
  v262 = 0u;
  v263 = 0u;
  v264 = 0u;
  v12 = v5;
  v256 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v261, v273, 16);
  if (v256)
  {
    v230 = 0;
    v255 = *(_QWORD *)v262;
    v13 = 0.0;
    v229 = 0.0;
    v14 = 0.0;
    v231 = 0.0;
    v232 = 0.0;
    v251 = 0.0;
    v246 = 0.0;
    v247 = 0.0;
    v15 = 0.0;
    v228 = 0.0;
    v235 = 0.0;
    v236 = 0.0;
    v237 = 0.0;
    v239 = 0.0;
    v240 = 0.0;
    v238 = 0.0;
    v16 = 0.0;
    v254 = 0.0;
    v253 = 0.0;
    v245 = 0.0;
    v252 = 0.0;
    v234 = 0.0;
    v233 = 0.0;
    v250 = v12;
    do
    {
      for (j = 0; j != v256; j = (char *)j + 1)
      {
        if (*(_QWORD *)v262 != v255)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v261 + 1) + 8 * (_QWORD)j);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "endDate"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startDate"));
        objc_msgSend(v19, "timeIntervalSinceDate:", v20);
        v22 = v21;

        if (objc_msgSend(v18, "interfaceType") == (id)1)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("DistanceToHome")));
          objc_msgSend(v24, "floatValue");
          v26 = v25;

          if (v26 >= 0.0)
          {
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("DistanceToHome")));
            objc_msgSend(v50, "floatValue");

            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("DistanceToHome")));
            objc_msgSend(v51, "floatValue");
            v53 = v251 + v52 * v22;
            v251 = v53;

          }
          else
          {
            os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
            v28 = objc_claimAutoreleasedReturnValue(os_log);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v270 = "+[MOSummarizationUtilities updateRankMetaDataFrom:forSummaryBundle:]";
              v271 = 1024;
              v272 = 530;
              _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Workout in summary bundle distanceToHomeInMiles is negative (in %s:%d)", buf, 0x12u);
            }

            v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
            objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MOSummarizationUtilities.m"), 530, CFSTR("Workout in summary bundle distanceToHomeInMiles is negative (in %s:%d)"), "+[MOSummarizationUtilities updateRankMetaDataFrom:forSummaryBundle:]", 530);
          }

          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("WorkoutDuration")));
          objc_msgSend(v55, "floatValue");
          v57 = v56;

          if (!v9)
          {
            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
            v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("FamiliarityIndex")));
            objc_msgSend(v59, "floatValue");
            v61 = v60;

            if (v61 == -1.0)
            {
              v133 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
              v62 = objc_claimAutoreleasedReturnValue(v133);
              if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
                +[MOSummarizationUtilities updateRankMetaDataFrom:forSummaryBundle:].cold.1(&v259, v260);
            }
            else
            {
              v62 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
              v63 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v62, "objectForKeyedSubscript:", CFSTR("FamiliarityIndex")));
              objc_msgSend(v63, "floatValue");
              v65 = v232 + v64 * v22;
              v232 = v65;

            }
            v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
            v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "objectForKeyedSubscript:", CFSTR("PoiCategory")));

            v136 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
            v137 = objc_msgSend(v135, "isEqual:", v136);

            if ((v137 & 1) == 0)
            {
              v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
              v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "objectForKeyedSubscript:", CFSTR("PoiCategory")));
              objc_msgSend(v139, "floatValue");
              v141 = v231 + v140 * v22;
              v231 = v141;

            }
            v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
            v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "objectForKey:", CFSTR("PeopleDensityWeightedAverage")));
            objc_msgSend(v143, "floatValue");
            v145 = v144;

            v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
            v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "objectForKey:", CFSTR("PeopleCountWeightedAverage")));
            objc_msgSend(v147, "floatValue");
            v149 = v148;

            v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
            v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "objectForKey:", CFSTR("StateOfMindLabels")));

            if (v151)
            {
              v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
              v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "objectForKey:", CFSTR("StateOfMindLabels")));
              -[NSMutableArray addObjectsFromArray:](v244, "addObjectsFromArray:", v153);

            }
            v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
            v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "objectForKey:", CFSTR("StateOfMindDomains")));

            if (v155)
            {
              v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
              v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "objectForKey:", CFSTR("StateOfMindDomains")));
              -[NSMutableArray addObjectsFromArray:](v243, "addObjectsFromArray:", v157);

            }
            v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
            v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "objectForKey:", CFSTR("StateOfMindValence")));

            if (v159)
            {
              v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
              v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "objectForKey:", CFSTR("StateOfMindValence")));
              -[NSMutableArray addObjectsFromArray:](v242, "addObjectsFromArray:", v161);

            }
            v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
            v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v162, "objectForKey:", CFSTR("StateOfMindValenceClassification")));

            if (v163)
            {
              v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
              v165 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v164, "objectForKey:", CFSTR("StateOfMindValenceClassification")));
              -[NSMutableArray addObjectsFromArray:](v241, "addObjectsFromArray:", v165);

            }
            v166 = v246 + v145 * v22;
            v167 = v247 + v149 * v22;
            v246 = v166;
            v247 = v167;

            v12 = v250;
          }
          v14 = v14 + v57;
          v15 = v22 + v15;
        }
        else if (objc_msgSend(v18, "interfaceType") == (id)2)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("PoiCategory")));

          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
          v33 = objc_msgSend(v31, "isEqual:", v32);

          if ((v33 & 1) == 0)
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("PoiCategory")));
            objc_msgSend(v35, "floatValue");
            v37 = v233 + v36 * v22;
            v233 = v37;

          }
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("LocationModeTourist")));
          objc_msgSend(v39, "floatValue");
          v41 = v40;

          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("DistanceToHome")));
          objc_msgSend(v43, "floatValue");
          v45 = v44;

          if (v45 >= 0.0)
          {
            v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
            v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("DistanceToHome")));
            objc_msgSend(v82, "floatValue");

            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
            v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("DistanceToHome")));
            objc_msgSend(v83, "floatValue");
            v85 = v234 + v84 * v22;
            v234 = v85;

          }
          else
          {
            v46 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
            v47 = objc_claimAutoreleasedReturnValue(v46);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v270 = "+[MOSummarizationUtilities updateRankMetaDataFrom:forSummaryBundle:]";
              v271 = 1024;
              v272 = 579;
              _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Summary bundle distanceToHomeInMiles is negative (in %s:%d)", buf, 0x12u);
            }

            v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
            objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MOSummarizationUtilities.m"), 579, CFSTR("Summary bundle distanceToHomeInMiles is negative (in %s:%d)"), "+[MOSummarizationUtilities updateRankMetaDataFrom:forSummaryBundle:]", 579);
          }

          v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
          v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("FamiliarityIndex")));
          objc_msgSend(v87, "floatValue");
          v89 = v88;

          if (v89 == -1.0)
          {
            v105 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            v90 = objc_claimAutoreleasedReturnValue(v105);
            if (os_log_type_enabled(v90, OS_LOG_TYPE_FAULT))
              +[MOSummarizationUtilities updateRankMetaDataFrom:forSummaryBundle:].cold.1(&v257, v258);
          }
          else
          {
            v90 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
            v91 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v90, "objectForKeyedSubscript:", CFSTR("FamiliarityIndex")));
            objc_msgSend(v91, "floatValue");
            v93 = v245 + v92 * v22;
            v245 = v93;

          }
          v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
          v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKey:", CFSTR("PeopleDensityWeightedAverage")));
          objc_msgSend(v107, "floatValue");
          v109 = v108;

          v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
          v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "objectForKey:", CFSTR("PeopleCountWeightedAverage")));
          objc_msgSend(v111, "floatValue");
          v113 = v112;

          v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
          v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "objectForKey:", CFSTR("StateOfMindLabels")));

          if (v115)
          {
            v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
            v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "objectForKey:", CFSTR("StateOfMindLabels")));
            -[NSMutableArray addObjectsFromArray:](v244, "addObjectsFromArray:", v117);

          }
          v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
          v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "objectForKey:", CFSTR("StateOfMindDomains")));

          if (v119)
          {
            v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
            v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "objectForKey:", CFSTR("StateOfMindDomains")));
            -[NSMutableArray addObjectsFromArray:](v243, "addObjectsFromArray:", v121);

          }
          v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
          v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "objectForKey:", CFSTR("StateOfMindValence")));

          if (v123)
          {
            v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
            v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "objectForKey:", CFSTR("StateOfMindValence")));
            -[NSMutableArray addObjectsFromArray:](v242, "addObjectsFromArray:", v125);

          }
          v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
          v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "objectForKey:", CFSTR("StateOfMindValenceClassification")));

          if (v127)
          {
            v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
            v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "objectForKey:", CFSTR("StateOfMindValenceClassification")));
            -[NSMutableArray addObjectsFromArray:](v241, "addObjectsFromArray:", v129);

          }
          v130 = v252 + v41 * v22;
          v252 = v130;
          v131 = v253 + v109 * v22;
          v253 = v131;
          v132 = v254 + v113 * v22;
          v254 = v132;
          v16 = v22 + v16;

          v12 = v250;
        }
        else if (objc_msgSend(v18, "interfaceType") == (id)4)
        {
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
          v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("dailyAggregateCallDuration")));
          objc_msgSend(v67, "floatValue");
          v238 = v238 + v68;

          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
          v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("callDuration")));
          objc_msgSend(v70, "floatValue");
          v239 = v239 + v71;

          v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
          v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("burstyInteractionCount")));
          objc_msgSend(v73, "floatValue");
          v240 = v240 + v74;

          v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
          v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("isFamilyContact")));
          objc_msgSend(v76, "floatValue");
          v236 = v236 + v77;

          v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
          v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("isCoworkerContact")));
          objc_msgSend(v79, "floatValue");
          v237 = v237 + v80;

          v235 = v235 + 1.0;
        }
        else if (objc_msgSend(v18, "interfaceType") == (id)5)
        {
          v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
          v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "objectForKey:", CFSTR("MediaTotalPlayTime")));
          objc_msgSend(v95, "doubleValue");
          v97 = v96;

          v98 = v97;
          v228 = v228 + v98;
          v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
          v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "objectForKey:", CFSTR("MediaActionIsRepeat")));
          v101 = objc_msgSend(v100, "BOOLValue");

          v102 = v230;
          v103 = v101 == 0;
          v12 = v250;
          if (!v103)
            v102 = v97 + (double)v230 != 0.0;
          v230 = v102;
          v104 = v22 + v229;
          v229 = v104;
        }
        if (objc_msgSend(v18, "bundleSubType") == (id)204
          || objc_msgSend(v18, "bundleSubType") == (id)207
          || objc_msgSend(v18, "bundleSubType") == (id)208
          || objc_msgSend(v18, "bundleSubType") == (id)206)
        {
          v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metaDataForRank"));
          v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v168, "objectForKeyedSubscript:", CFSTR("MotionActivityWalkSpan")));
          objc_msgSend(v169, "doubleValue");
          v171 = v170;

          if (v171 > v13)
            v13 = v171;
        }
      }
      v256 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v261, v273, 16);
    }
    while (v256);

    if (v16 <= 0.0)
    {
      v178 = v6;
      v176 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
      v175 = v234;
    }
    else
    {
      v173 = v16;
      *(float *)&v172 = v233 / v16;
      v174 = v252 / v16;
      v175 = v234 / v16;
      v176 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
      v177 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v172));
      v178 = v6;
      objc_msgSend(v6, "addMetaDataForRankForKey:value:", CFSTR("PoiCategory"), v177);

      *(float *)&v179 = v175;
      v180 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v179));
      objc_msgSend(v6, "addMetaDataForRankForKey:value:", CFSTR("DistanceToHome"), v180);

      *(float *)&v181 = v174;
      v182 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v181));
      objc_msgSend(v6, "addMetaDataForRankForKey:value:", CFSTR("LocationModeTourist"), v182);

      *(float *)&v183 = v173;
      v184 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v183));
      objc_msgSend(v6, "addMetaDataForRankForKey:value:", CFSTR("VisitDuration"), v184);

      *(float *)&v185 = v245 / v173;
      v186 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v185));
      objc_msgSend(v6, "addMetaDataForRankForKey:value:", CFSTR("FamiliarityIndex"), v186);

      *(float *)&v187 = v253 / v173;
      v188 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v187));
      objc_msgSend(v6, "addMetaDataForRankForKey:value:", CFSTR("PeopleDensityWeightedAverage"), v188);

      *(float *)&v189 = v254 / v173;
      v190 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v189));
      objc_msgSend(v6, "addMetaDataForRankForKey:value:", CFSTR("PeopleCountWeightedAverage"), v190);

    }
    if (v15 > 0.0)
    {
      *(float *)&v172 = v14;
      v198 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v172));
      objc_msgSend(v178, "addMetaDataForRankForKey:value:", CFSTR("WorkoutDuration"), v198);

      v172 = v175;
      if (v175 < 2.22507386e-308)
      {
        *(float *)&v172 = v251 / v15;
        v199 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v172));
        objc_msgSend(v178, "addMetaDataForRankForKey:value:", CFSTR("DistanceToHome"), v199);

      }
      if (!v9)
      {
        *(float *)&v172 = v231 / v15;
        v200 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v172));
        objc_msgSend(v178, "addMetaDataForRankForKey:value:", CFSTR("PoiCategory"), v200);

        *(float *)&v201 = v232 / v15;
        v202 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v201));
        objc_msgSend(v178, "addMetaDataForRankForKey:value:", CFSTR("FamiliarityIndex"), v202);

        *(float *)&v203 = v246 / v15;
        v204 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v203));
        objc_msgSend(v178, "addMetaDataForRankForKey:value:", CFSTR("PeopleDensityWeightedAverage"), v204);

        *(float *)&v205 = v247 / v15;
        v206 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v205));
        objc_msgSend(v178, "addMetaDataForRankForKey:value:", CFSTR("PeopleCountWeightedAverage"), v206);

      }
    }
    if (v13 > 0.0)
    {
      v207 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13));
      objc_msgSend(v178, "addMetaDataForRankForKey:value:", CFSTR("MotionActivityWalkSpan"), v207);

    }
    v191 = v178;
    v193 = v229;
    if (v235 <= 0.0)
    {
      v192 = v228;
      v195 = v239;
      v194 = v240;
      v197 = v237;
      v196 = v238;
      *(float *)&v172 = v236;
    }
    else
    {
      *(float *)&v172 = v236 / v235;
      v197 = v237 / v235;
      v192 = v228;
      v195 = v239;
      v194 = v240;
      v196 = v238;
    }
  }
  else
  {
    v191 = v6;

    LOBYTE(v230) = 0;
    v192 = 0.0;
    v193 = 0.0;
    v194 = 0.0;
    v195 = 0.0;
    v196 = 0.0;
    v197 = 0.0;
    LODWORD(v172) = 0;
    v176 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
  }
  v208 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176[317], "numberWithFloat:", v172));
  objc_msgSend(v191, "addMetaDataForRankForKey:value:", CFSTR("isFamilyContact"), v208);

  *(float *)&v209 = v197;
  v210 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176[317], "numberWithFloat:", v209));
  objc_msgSend(v191, "addMetaDataForRankForKey:value:", CFSTR("isCoworkerContact"), v210);

  objc_msgSend(v191, "addMetaDataForRankForKey:value:", CFSTR("isGroupConversation"), &__kCFBooleanFalse);
  *(float *)&v211 = v196;
  v212 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176[317], "numberWithFloat:", v211));
  objc_msgSend(v191, "addMetaDataForRankForKey:value:", CFSTR("dailyAggregateCallDuration"), v212);

  *(float *)&v213 = v195;
  v214 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176[317], "numberWithFloat:", v213));
  objc_msgSend(v191, "addMetaDataForRankForKey:value:", CFSTR("callDuration"), v214);

  *(float *)&v215 = v194;
  v216 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176[317], "numberWithFloat:", v215));
  objc_msgSend(v191, "addMetaDataForRankForKey:value:", CFSTR("burstyInteractionCount"), v216);

  v217 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176[317], "numberWithDouble:", v192));
  objc_msgSend(v191, "addMetaDataForRankForKey:value:", CFSTR("MediaTotalPlayTime"), v217);

  if (v193 > 0.0)
  {
    *(float *)&v218 = (float)v230 / v193;
    v219 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176[317], "numberWithFloat:", v218));
    objc_msgSend(v191, "addMetaDataForRankForKey:value:", CFSTR("MediaActionIsRepeat"), v219);

  }
  v220 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v244));
  v221 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v220, "allObjects"));
  objc_msgSend(v191, "addMetaDataForRankForKey:value:", CFSTR("StateOfMindLabels"), v221);

  v222 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v243));
  v223 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v222, "allObjects"));
  objc_msgSend(v191, "addMetaDataForRankForKey:value:", CFSTR("StateOfMindDomains"), v223);

  v224 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v242));
  v225 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v224, "allObjects"));
  objc_msgSend(v191, "addMetaDataForRankForKey:value:", CFSTR("StateOfMindValence"), v225);

  v226 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v241));
  v227 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v226, "allObjects"));
  objc_msgSend(v191, "addMetaDataForRankForKey:value:", CFSTR("StateOfMindValenceClassification"), v227);

}

+ (id)createDominantBundleFromBundles:(id)a3 withParameters:(id)a4 timeZoneManager:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  float v13;
  double v14;
  float v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableArray *v18;
  NSMutableArray *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id os_log;
  NSObject *v34;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  _BYTE v44[128];

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "createMegaBundleFromBundles:parameters:timeZoneManager:", v8, v9, a5));
  objc_msgSend(a1, "setActionsAndPlacesFromBundles:forDominantBundle:withParameters:", v8, v10, v9);
  objc_msgSend(v10, "setInterfaceType:", 12);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "action"));
  v12 = objc_msgSend(v11, "actionType");

  if (v12 == (id)4)
  {
    objc_msgSend(v9, "dominantBundle_mediaPlaySessionDominantFactorThreshold");
    v14 = v13;
    objc_msgSend(v9, "dominantBundle_mediaPlaySessionsOverlapsMinimumDistance");
    objc_msgSend(a1, "setMediaActionForWorkoutBundle:withMediaPlaySessionDominantFactorThreshold:mediaPlaySessionsOverlapsMinimumDistance:", v10, v14, v15);
    v16 = 201;
    v17 = 2;
  }
  else
  {
    v16 = 101;
    v17 = 1;
  }
  objc_msgSend(v10, "setBundleSuperType:", v17, a1, v9);
  objc_msgSend(v10, "setBundleSubType:", v16);
  v18 = objc_opt_new(NSMutableArray);
  v19 = objc_opt_new(NSMutableArray);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v20 = v8;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v25, "setIsAggregatedAndSuppressed:", 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bundleIdentifier"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "UUIDString"));
        -[NSMutableArray addObject:](v18, "addObject:", v27);

        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "suggestionID"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "UUIDString"));
        -[NSMutableArray addObject:](v19, "addObject:", v29);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v22);
  }

  v30 = -[NSMutableArray copy](v18, "copy");
  objc_msgSend(v10, "setSubBundleIDs:", v30);

  v31 = -[NSMutableArray copy](v19, "copy");
  objc_msgSend(v10, "setSubSuggestionIDs:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "getResourcesFromBundles:forSummaryBundle:withParameters:", v20, v10, v37));
  objc_msgSend(v10, "setResources:", v32);

  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v34 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v43 = v10;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "SummarizationUtilities: dominant bundle being created: %@", buf, 0xCu);
  }

  return v10;
}

+ (id)getWorkoutActionsByActionSubtypeFromBundles:(id)a3
{
  id v3;
  dispatch_once_t *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  float v21;
  float v22;
  void *v23;
  float v24;
  double v25;
  void *v26;
  void *v27;
  dispatch_once_t *v28;
  void *v29;
  void *v30;
  void *v31;
  id os_log;
  NSObject *v33;
  void *v34;
  NSMutableArray *v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  void *j;
  void *v41;
  MOAction *v42;
  void *v43;
  void *v44;
  void *v45;
  MOAction *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  id v52;
  id v54;
  id obj;
  uint64_t v56;
  id v57;
  uint64_t v58;
  NSMutableDictionary *v59;
  NSMutableDictionary *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t buf[4];
  MOAction *v74;
  _BYTE v75[128];
  _BYTE v76[16];
  _BYTE v77[128];
  _BYTE v78[128];

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v60 = objc_opt_new(NSMutableDictionary);
    v59 = objc_opt_new(NSMutableDictionary);
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v54 = v3;
    obj = v3;
    v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
    if (v57)
    {
      v56 = *(_QWORD *)v70;
      v4 = &MOLogFacilitySummarization;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v70 != v56)
            objc_enumerationMutation(obj);
          v58 = v5;
          v6 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v5);
          v65 = 0u;
          v66 = 0u;
          v67 = 0u;
          v68 = 0u;
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "events"));
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v66;
            do
            {
              for (i = 0; i != v9; i = (char *)i + 1)
              {
                if (*(_QWORD *)v66 != v10)
                  objc_enumerationMutation(v7);
                v12 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
                if (objc_msgSend(v12, "provider") == (id)1 && objc_msgSend(v12, "category") == (id)2)
                {
                  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "workoutType"));

                  if (v13)
                  {
                    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v60, "allKeys"));
                    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "workoutType"));
                    v16 = objc_msgSend(v14, "containsObject:", v15);

                    if (v16)
                    {
                      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "workoutType"));
                      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v60, "objectForKey:", v17));
                      objc_msgSend(v18, "addObject:", v12);

                      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "workoutType"));
                      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v59, "objectForKey:", v19));

                      objc_msgSend(v20, "floatValue");
                      v22 = v21;
                      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "workoutDuration"));
                      objc_msgSend(v23, "floatValue");
                      *(float *)&v25 = v22 + v24;
                      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v25));
                      v27 = v7;
                      v28 = v4;
                      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "workoutType"));
                      -[NSMutableDictionary setObject:forKey:](v59, "setObject:forKey:", v26, v29);

                      v4 = v28;
                      v7 = v27;

                    }
                    else
                    {
                      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v12));
                      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "workoutType"));
                      -[NSMutableDictionary setObject:forKey:](v60, "setObject:forKey:", v30, v31);

                      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "workoutDuration"));
                      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "workoutType"));
                      -[NSMutableDictionary setObject:forKey:](v59, "setObject:forKey:", v20, v23);
                    }

                    os_log = _mo_log_facility_get_os_log(v4);
                    v33 = objc_claimAutoreleasedReturnValue(os_log);
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
                      +[MOSummarizationUtilities getWorkoutActionsByActionSubtypeFromBundles:].cold.1((uint64_t)v76, (uint64_t)v12);

                  }
                }
              }
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
            }
            while (v9);
          }

          v5 = v58 + 1;
        }
        while ((id)(v58 + 1) != v57);
        v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
      }
      while (v57);
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary keysSortedByValueUsingComparator:](v59, "keysSortedByValueUsingComparator:", &__block_literal_global_288));
    v35 = objc_opt_new(NSMutableArray);
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v36 = v34;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v62;
      do
      {
        for (j = 0; j != v38; j = (char *)j + 1)
        {
          if (*(_QWORD *)v62 != v39)
            objc_enumerationMutation(v36);
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v60, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)j)));
          if (objc_msgSend(v41, "count") && objc_msgSend(v41, "count"))
          {
            v42 = [MOAction alloc];
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "allObjects"));
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectAtIndex:", 0));
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "workoutType"));
            v46 = -[MOAction initWithActionName:actionType:actionSubtype:actionMetaData:](v42, "initWithActionName:actionType:actionSubtype:actionMetaData:", v45, 4, 1, 0);

            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "allObjects"));
            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "firstObject"));
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "eventIdentifier"));
            -[MOAction setSourceEventIdentifier:](v46, "setSourceEventIdentifier:", v49);

            -[NSMutableArray addObject:](v35, "addObject:", v46);
            v50 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            v51 = objc_claimAutoreleasedReturnValue(v50);
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v74 = v46;
              _os_log_debug_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, "getWorkoutActionsByActionSubtypeFromBundles: output action, %@", buf, 0xCu);
            }

          }
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
      }
      while (v38);
    }

    v52 = -[NSMutableArray copy](v35, "copy");
    v3 = v54;
  }
  else
  {
    v52 = 0;
  }

  return v52;
}

int64_t __72__MOSummarizationUtilities_getWorkoutActionsByActionSubtypeFromBundles___block_invoke(id a1, NSNumber *a2, NSNumber *a3)
{
  return -[NSNumber compare:](a3, "compare:", a2);
}

+ (id)getActionsFromBundles:(id)a3 withDominantAction:(id)a4
{
  id v5;
  id v6;
  NSMutableDictionary *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSMutableArray *v30;
  id os_log;
  NSObject *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *k;
  void *v38;
  void *v39;
  unsigned int v40;
  id v41;
  NSObject *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  id v60;
  NSMutableDictionary *v62;
  char v63;
  _BYTE v64[15];
  char v65;
  _BYTE v66[15];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[16];
  _BYTE v80[16];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v7 = objc_opt_new(NSMutableDictionary);
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v60 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v76;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v76 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "action"));

          if (v14)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "action"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "actionName"));

            v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v7, "allKeys"));
            v18 = objc_msgSend(v17, "containsObject:", v16);

            if (v18)
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v7, "objectForKey:", v16));
              objc_msgSend(v19, "addObject:", v13);
            }
            else
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v13));
              -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v19, v16);
            }

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
      }
      while (v10);
    }

    v62 = objc_opt_new(NSMutableDictionary);
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v7, "allKeys"));
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v72;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(_QWORD *)v72 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)j);
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v7, "objectForKey:", v25));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "allObjects"));

          objc_msgSend(v27, "getTotalDurationOfMOEventBundleArray");
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          -[NSMutableDictionary setObject:forKey:](v62, "setObject:forKey:", v28, v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
      }
      while (v22);
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary keysSortedByValueUsingComparator:](v62, "keysSortedByValueUsingComparator:", &__block_literal_global_290));
    v30 = objc_opt_new(NSMutableArray);
    if (objc_msgSend(v6, "actionType") == (id)2)
    {
      -[NSMutableArray addObject:](v30, "addObject:", v6);
      os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      v32 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        +[MOSummarizationUtilities getActionsFromBundles:withDominantAction:].cold.6((uint64_t)v6, v30);

    }
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v33 = v29;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v68;
      do
      {
        for (k = 0; k != v35; k = (char *)k + 1)
        {
          if (*(_QWORD *)v68 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)k);
          if (v6
            && (v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionName")),
                v40 = objc_msgSend(v38, "isEqualToString:", v39),
                v39,
                v40))
          {
            v41 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            v42 = objc_claimAutoreleasedReturnValue(v41);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
              +[MOSummarizationUtilities getActionsFromBundles:withDominantAction:].cold.5(&v65, v66);
          }
          else
          {
            if (objc_msgSend(v6, "actionType") != (id)4
              || !objc_msgSend(v38, "isEqualToString:", CFSTR("visit")))
            {
              v42 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v38));
              if (!-[NSObject count](v42, "count"))
                goto LABEL_49;
              v44 = -[NSObject count](v42, "count");
              v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject allObjects](v42, "allObjects"));
              v46 = v45;
              if (v44 == (id)1)
              {
                v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectAtIndex:", 0));

                v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "action"));
                if (v48)
                {
                  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "action"));
                  -[NSMutableArray addObject:](v30, "addObject:", v49);

                  v50 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                  v51 = objc_claimAutoreleasedReturnValue(v50);
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
                    +[MOSummarizationUtilities getActionsFromBundles:withDominantAction:].cold.3((uint64_t)v80, (uint64_t)v47);
                  goto LABEL_47;
                }
              }
              else
              {
                v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getDominantBundleFromBundles:", v45));

                if (v47)
                {
                  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "action"));

                  if (v52)
                  {
                    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "action"));
                    -[NSMutableArray addObject:](v30, "addObject:", v53);

                    v54 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                    v51 = objc_claimAutoreleasedReturnValue(v54);
                    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
                      +[MOSummarizationUtilities getActionsFromBundles:withDominantAction:].cold.3((uint64_t)v79, (uint64_t)v47);
LABEL_47:

                  }
                }
              }

              goto LABEL_49;
            }
            v43 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            v42 = objc_claimAutoreleasedReturnValue(v43);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
              +[MOSummarizationUtilities getActionsFromBundles:withDominantAction:].cold.2(&v63, v64);
          }
LABEL_49:

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
      }
      while (v35);
    }

    v55 = -[NSMutableArray copy](v30, "copy");
    v5 = v60;
  }
  else
  {
    v56 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_DEBUG))
      +[MOSummarizationUtilities getActionsFromBundles:withDominantAction:].cold.1(&v7->super.super, v57, v58);
    v55 = 0;
  }

  return v55;
}

int64_t __69__MOSummarizationUtilities_getActionsFromBundles_withDominantAction___block_invoke(id a1, NSNumber *a2, NSNumber *a3)
{
  return -[NSNumber compare:](a3, "compare:", a2);
}

+ (id)getDominantBundleFromBundles:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_294));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", 0));

  return v4;
}

int64_t __57__MOSummarizationUtilities_getDominantBundleFromBundles___block_invoke(id a1, MOEventBundle *a2, MOEventBundle *a3)
{
  MOEventBundle *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;

  v4 = a3;
  -[MOEventBundle duration](a2, "duration");
  v6 = v5;
  -[MOEventBundle duration](v4, "duration");
  v8 = v7;

  if (v6 <= v8)
    v9 = 0;
  else
    v9 = -1;
  if (v6 < v8)
    return 1;
  else
    return v9;
}

+ (id)getActionFromBundles:(id)a3 withMainActionSelectionThresholdBasedOnDuration:(float)a4
{
  id v6;
  MOAction *v7;
  NSMutableDictionary *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  unint64_t v48;
  uint64_t v49;
  void *k;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  BOOL v55;
  MOAction *v56;
  void *v57;
  MOAction *v58;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];

  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    v62 = a1;
    v8 = objc_opt_new(NSMutableDictionary);
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v64 = v6;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v74 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v8, "allKeys"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getBundleType"));
          v17 = objc_msgSend(v15, "containsObject:", v16);

          if (v17)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getBundleType"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v8, "objectForKey:", v18));
            objc_msgSend(v19, "addObject:", v14);
          }
          else
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v14));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getBundleType"));
            -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v18, v19);
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
      }
      while (v11);
    }

    v20 = objc_opt_new(NSMutableDictionary);
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v8, "allKeys"));
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v70;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(_QWORD *)v70 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)j);
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v8, "objectForKey:", v26));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "allObjects"));

          objc_msgSend(v28, "getTotalDurationOfMOEventBundleArray");
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v29, v26);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
      }
      while (v23);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary keysSortedByValueUsingComparator:](v20, "keysSortedByValueUsingComparator:", &__block_literal_global_295));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectAtIndexedSubscript:", (char *)objc_msgSend(v30, "count") - 1));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectAtIndexedSubscript:", (char *)objc_msgSend(v30, "count") - 2));
    v63 = v32;
    if ((!objc_msgSend(v31, "isEqualToString:", CFSTR("activity"))
       || (objc_msgSend(v32, "isEqualToString:", CFSTR("outing")) & 1) == 0)
      && (!objc_msgSend(v31, "isEqualToString:", CFSTR("outing"))
       || !objc_msgSend(v32, "isEqualToString:", CFSTR("activity"))))
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v8, "objectForKey:", v31));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "allObjects"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "firstObject"));
      v7 = (MOAction *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "action"));

      goto LABEL_28;
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v20, "objectForKey:", CFSTR("activity")));
    objc_msgSend(v33, "doubleValue");
    v35 = v34;

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v20, "objectForKey:", CFSTR("outing")));
    objc_msgSend(v36, "doubleValue");
    v38 = v37;

    if (v38 > 0.0)
    {
      v39 = v35 / v38;
      if (v35 / v38 < a4)
      {
        v7 = -[MOAction initWithActionName:actionType:]([MOAction alloc], "initWithActionName:actionType:", CFSTR("visit"), 2);
LABEL_28:
        v6 = v64;
LABEL_47:

        goto LABEL_48;
      }
    }
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v8, "objectForKey:", CFSTR("activity"), v39));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "allObjects"));

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v45 = v44;
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
    if (v46)
    {
      v47 = v46;
      v60 = v31;
      v61 = v30;
      v48 = 0;
      v49 = *(_QWORD *)v66;
      do
      {
        for (k = 0; k != v47; k = (char *)k + 1)
        {
          if (*(_QWORD *)v66 != v49)
            objc_enumerationMutation(v45);
          v51 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)k);
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "action"));
          if (objc_msgSend(v52, "actionType") == (id)4)
          {
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "action"));
            v54 = objc_msgSend(v53, "actionSubtype");

            if (v54 == (id)1)
              ++v48;
          }
          else
          {

          }
        }
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
      }
      while (v47);

      v55 = v48 >= 2;
      v6 = v64;
      v31 = v60;
      v30 = v61;
      if (v55)
      {
        v56 = [MOAction alloc];
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "workoutMetaDataCreatedForBundles:", v45));
        v58 = -[MOAction initWithActionName:actionType:actionSubtype:actionMetaData:](v56, "initWithActionName:actionType:actionSubtype:actionMetaData:", CFSTR("workout"), 4, 1, v57);
LABEL_46:
        v7 = v58;

        goto LABEL_47;
      }
    }
    else
    {

      v6 = v64;
    }
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "firstObject"));
    v58 = (MOAction *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "action"));
    goto LABEL_46;
  }
  v7 = 0;
LABEL_48:

  return v7;
}

int64_t __97__MOSummarizationUtilities_getActionFromBundles_withMainActionSelectionThresholdBasedOnDuration___block_invoke(id a1, NSNumber *a2, NSNumber *a3)
{
  return -[NSNumber compare:](a2, "compare:", a3);
}

+ (id)sortedBundleBasedOnGoodnessScore:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == (id)1)
      v4 = v3;
    else
      v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_298));
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

int64_t __61__MOSummarizationUtilities_sortedBundleBasedOnGoodnessScore___block_invoke(id a1, MOEventBundle *a2, MOEventBundle *a3)
{
  MOEventBundle *v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  void *v10;
  float v11;
  float v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle rankingDictionary](a2, "rankingDictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore")));
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle rankingDictionary](v4, "rankingDictionary"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore")));
  objc_msgSend(v10, "floatValue");
  v12 = v11;

  if (v8 <= v12)
    return 1;
  else
    return -1;
}

+ (void)setActionsAndPlacesFromBundles:(id)a3 forDominantBundle:(id)a4 withParameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  id os_log;
  NSObject *p_super;
  NSMutableSet *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  unsigned int v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned __int8 v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  NSMutableArray *v52;
  unsigned int v53;
  void *v54;
  NSMutableArray *v55;
  NSMutableSet *v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((unint64_t)objc_msgSend(v8, "count") <= 1)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    p_super = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_INFO, "Not enough bundles to create dominant bundle, so skip seting actions and places", buf, 2u);
    }
    goto LABEL_30;
  }
  v55 = objc_opt_new(NSMutableArray);
  v52 = objc_opt_new(NSMutableArray);
  v13 = objc_opt_new(NSMutableSet);
  v56 = objc_opt_new(NSMutableSet);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sortedBundleBasedOnGoodnessScore:", v8));
  v50 = v10;
  v51 = v8;
  v54 = v9;
  v53 = objc_msgSend(a1, "shouldIncludeVisitIntoActionsFromBundles:forDominantBundle:withParameters:", v8, v9, v10);
  if (objc_msgSend(v14, "count"))
  {
    v15 = 0;
    while (1)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", v15));
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "action"));
      if (!v17)
        goto LABEL_17;
      v18 = (void *)v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "action"));
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "actionName"));
      if (!v20)
        goto LABEL_16;
      v21 = (void *)v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "action"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "actionName"));
      v24 = -[NSMutableSet containsObject:](v56, "containsObject:", v23);

      if ((v24 & 1) == 0)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "action"));
        v26 = objc_msgSend(v25, "actionType") == (id)2 ? v53 : 1;

        if (v26 == 1)
          break;
      }
LABEL_17:
      v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "place"));
      if (v33)
      {
        v34 = v33;
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "place"));
        v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "placeName"));
        if (!v36)
        {

LABEL_23:
          goto LABEL_24;
        }
        v37 = (void *)v36;
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "place"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "placeName"));
        v40 = -[NSMutableSet containsObject:](v13, "containsObject:", v39);

        if ((v40 & 1) == 0)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "place"));
          -[NSMutableArray addObject:](v55, "addObject:", v41);

          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "place"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "placeName"));
          -[NSMutableSet addObject:](v13, "addObject:", v43);

          v44 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          v34 = objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "place"));
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "placeName"));
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "startDate"));
            *(_DWORD *)buf = 138412546;
            v58 = v46;
            v59 = 2112;
            v60 = v47;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "SummarizationUtilities: add place to places: %@, for dominant bundle with start date, %@", buf, 0x16u);

          }
          goto LABEL_23;
        }
      }
LABEL_24:

      if ((unint64_t)objc_msgSend(v14, "count") <= ++v15)
        goto LABEL_25;
    }
    v27 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "action"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "actionName"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "startDate"));
      *(_DWORD *)buf = 138412546;
      v58 = v30;
      v59 = 2112;
      v60 = v31;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "SummarizationUtilities: add action to actions: %@, for dominant bundle with start date, %@", buf, 0x16u);

    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "action"));
    -[NSMutableArray addObject:](v52, "addObject:", v32);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "action"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "actionName"));
    -[NSMutableSet addObject:](v56, "addObject:", v19);
LABEL_16:

    goto LABEL_17;
  }
LABEL_25:
  v9 = v54;
  objc_msgSend(v54, "setActions:", v52);
  p_super = &v55->super.super;
  objc_msgSend(v54, "setPlaces:", v55);
  if (-[NSMutableArray count](v55, "count"))
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v55, "firstObject"));
    objc_msgSend(v54, "setPlace:", v48);

  }
  v10 = v50;
  v8 = v51;
  if (-[NSMutableArray count](v52, "count"))
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v52, "firstObject"));
    objc_msgSend(v54, "setAction:", v49);

  }
LABEL_30:

}

+ (BOOL)shouldIncludeVisitIntoActionsFromBundles:(id)a3 forDominantBundle:(id)a4 withParameters:(id)a5
{
  id v6;
  NSMutableDictionary *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  float v38;
  void *v39;
  BOOL v40;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];

  v6 = a3;
  v43 = a5;
  v7 = objc_opt_new(NSMutableDictionary);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v7, "allKeys"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "getBundleType"));
        v16 = objc_msgSend(v14, "containsObject:", v15);

        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "getBundleType"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v7, "objectForKey:", v17));
          objc_msgSend(v18, "addObject:", v13);
        }
        else
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v13));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "getBundleType"));
          -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v17, v18);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v10);
  }
  v42 = v8;

  v19 = objc_opt_new(NSMutableDictionary);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v7, "allKeys"));
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(_QWORD *)v45 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)j);
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v7, "objectForKey:", v25, v42));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "allObjects"));

        objc_msgSend(v27, "getTotalDurationOfMOEventBundleArray");
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v28, v25);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v22);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary keysSortedByValueUsingComparator:](v19, "keysSortedByValueUsingComparator:", &__block_literal_global_299));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndexedSubscript:", (char *)objc_msgSend(v29, "count") - 1));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndexedSubscript:", (char *)objc_msgSend(v29, "count") - 2));
  if ((!objc_msgSend(v30, "isEqualToString:", CFSTR("activity"))
     || (objc_msgSend(v31, "isEqualToString:", CFSTR("outing")) & 1) == 0)
    && (!objc_msgSend(v30, "isEqualToString:", CFSTR("outing"), v42)
     || !objc_msgSend(v31, "isEqualToString:", CFSTR("activity"))))
  {
    goto LABEL_24;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v19, "objectForKey:", CFSTR("activity"), v42));
  objc_msgSend(v32, "doubleValue");
  v34 = v33;

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v19, "objectForKey:", CFSTR("outing")));
  objc_msgSend(v35, "doubleValue");
  v37 = v36;

  if (v37 > 0.0)
  {
    objc_msgSend(v43, "dominantBundle_mainActionSelectionThreshold");
    v39 = v42;
    v40 = v34 / v37 < v38;
  }
  else
  {
LABEL_24:
    v40 = 0;
    v39 = v42;
  }

  return v40;
}

int64_t __102__MOSummarizationUtilities_shouldIncludeVisitIntoActionsFromBundles_forDominantBundle_withParameters___block_invoke(id a1, NSNumber *a2, NSNumber *a3)
{
  return -[NSNumber compare:](a2, "compare:", a3);
}

+ (void)setActionsAndPlacesFromBundles:(id)a3 forSummaryBundle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSMutableArray *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  NSMutableArray *v17;
  void *v18;
  char *v19;
  uint64_t v20;
  void *v21;
  NSMutableSet *v22;
  NSMutableArray *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  NSMutableArray *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id os_log;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  unint64_t v48;
  NSMutableArray *v49;
  void *v50;
  NSMutableSet *v51;
  NSMutableArray *log;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v7;
  if ((unint64_t)objc_msgSend(v8, "count") > 1)
  {
    log = objc_opt_new(NSMutableArray);
    v11 = objc_opt_new(NSMutableArray);
    v51 = objc_opt_new(NSMutableSet);
    v43 = v8;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sortedBundleBasedOnGoodnessScore:", v8));
    if (objc_msgSend(v12, "count"))
    {
      v13 = 0;
      v49 = v11;
      v50 = v9;
      v44 = a1;
      v45 = v12;
      do
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v13));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "action"));

        if (v15)
        {
          v16 = objc_opt_new(NSMutableArray);
          v17 = objc_opt_new(NSMutableArray);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "actions"));
          v19 = (char *)objc_msgSend(v18, "count");

          v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getPlaceFromBundle:", v14));
          v47 = v14;
          v48 = v13;
          if (v19)
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "actions"));
            -[NSMutableArray addObjectsFromArray:](v17, "addObjectsFromArray:", v21);

            v22 = v51;
            v23 = v16;
            do
            {
              -[NSMutableArray addObject:](v16, "addObject:", v20);
              --v19;
            }
            while (v19);
          }
          else
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "action"));
            -[NSMutableArray addObject:](v17, "addObject:", v24);

            -[NSMutableArray addObject:](v16, "addObject:", v20);
            v22 = v51;
            v23 = v16;
          }
          v46 = (void *)v20;
          if (-[NSMutableArray count](v17, "count"))
          {
            v25 = 0;
            do
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", v25));
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "actionName"));
              v28 = v23;
              v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v23, "objectAtIndexedSubscript:", v25));
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "placeName"));
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringByAppendingFormat:", CFSTR("-%@"), v30));

              v23 = v28;
              if ((-[NSMutableSet containsObject:](v22, "containsObject:", v31) & 1) == 0)
              {
                -[NSMutableSet addObject:](v22, "addObject:", v31);
                v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v28, "objectAtIndexedSubscript:", v25));
                -[NSMutableArray addObject:](log, "addObject:", v32);

                v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", v25));
                -[NSMutableArray addObject:](v11, "addObject:", v33);

                os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                v35 = objc_claimAutoreleasedReturnValue(os_log);
                if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                {
                  v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", v25));
                  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "actionName"));
                  v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v28, "objectAtIndexedSubscript:", v25));
                  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "placeName"));
                  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "startDate"));
                  *(_DWORD *)buf = 138412802;
                  v54 = v37;
                  v55 = 2112;
                  v56 = v39;
                  v57 = 2112;
                  v58 = v40;
                  _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "SummarizationUtilities: add action to actions: %@, place to places: %@, for bundle with start date, %@", buf, 0x20u);

                  v22 = v51;
                  v11 = v49;

                  v23 = v28;
                }

              }
              ++v25;
            }
            while ((unint64_t)-[NSMutableArray count](v17, "count") > v25);
          }

          v9 = v50;
          a1 = v44;
          v12 = v45;
          v14 = v47;
          v13 = v48;
        }

        ++v13;
      }
      while ((unint64_t)objc_msgSend(v12, "count") > v13);
    }
    objc_msgSend(v9, "setActions:", v11);
    objc_msgSend(v9, "setPlaces:", log);
    if (-[NSMutableArray count](log, "count"))
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](log, "firstObject"));
      objc_msgSend(v9, "setPlace:", v41);

    }
    if (-[NSMutableArray count](v11, "count"))
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v11, "firstObject"));
      objc_msgSend(v9, "setAction:", v42);

    }
    v8 = v43;
  }
  else
  {
    v10 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    log = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(&log->super.super, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, &log->super.super, OS_LOG_TYPE_INFO, "Not enough bundles to create summary bundle, so skip seting actions and places", buf, 2u);
    }
  }

}

+ (id)getPlaceFromBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  MOPlace *v21;
  id os_log;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  MOPlace *v67;
  MOPlace *v68;
  void *v69;
  void *v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  void *v74;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));

  v67 = [MOPlace alloc];
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
  v69 = v5;
  if (v4)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "placeName"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "enclosingArea"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    v6 = objc_msgSend(v63, "placeType");
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    v54 = objc_msgSend(v61, "placeUserType");
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "location"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    v50 = objc_msgSend(v57, "locationMode");
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "poiCategory"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    objc_msgSend(v53, "distanceToHomeInMiles");
    v8 = v7;
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    objc_msgSend(v51, "placeNameConfidence");
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    objc_msgSend(v11, "familiarityIndexLOI");
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    objc_msgSend(v14, "priorityScore");
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "startDate"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "endDate"));
    v21 = -[MOPlace initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:](v67, "initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:", v70, v49, v55, v6, v54, v52, v8, v10, v13, v16, v50, v48, v18, v20);

    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v23 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MOPlace placeName](v21, "placeName"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
      *(_DWORD *)buf = 138412546;
      v72 = v24;
      v73 = 2112;
      v74 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "SummarizationUtilities: get place: %@, from bundle with start date, %@", buf, 0x16u);

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "sourceEventIdentifier"));
    -[MOPlace setSourceEventIdentifier:](v21, "setSourceEventIdentifier:", v27);

    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    -[MOPlace setSourceEventAccessType:](v21, "setSourceEventAccessType:", -[NSObject sourceEventAccessType](v28, "sourceEventAccessType"));
  }
  else
  {
    v60 = objc_msgSend(v5, "placeType");
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    v58 = objc_msgSend(v66, "placeUserType");
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    v29 = objc_msgSend(v64, "locationMode");
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "poiCategory"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    objc_msgSend(v31, "distanceToHomeInMiles");
    v33 = v32;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    objc_msgSend(v34, "placeNameConfidence");
    v36 = v35;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    objc_msgSend(v37, "familiarityIndexLOI");
    v39 = v38;
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "startDate"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "endDate"));
    v68 = -[MOPlace initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:](v67, "initWithIdentifier:placeName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:priorityScore:startDate:endDate:", v70, 0, 0, v60, v58, 0, v33, v36, v39, 20000.0, v29, v30, v41, v43);

    v44 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v28 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
      v21 = v68;
      -[MOPlace priorityScore](v68, "priorityScore");
      *(_DWORD *)buf = 138412546;
      v72 = v45;
      v73 = 2048;
      v74 = v46;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "SummarizationUtilities: get place holder from bundle with start date, %@ with priority score, %f", buf, 0x16u);

    }
    else
    {
      v21 = v68;
    }
  }

  return v21;
}

+ (id)getPlaceFromPlacesSortedByDuration:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id os_log;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == (id)1)
    {
      v4 = v3;
    }
    else
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v6 = v3;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v19 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v11, "proposition", (_QWORD)v18) != (id)4)
            {
              os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
              v16 = objc_claimAutoreleasedReturnValue(os_log);
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v23 = v11;
                _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "SummarizationUtilities: precise label: %@", buf, 0xCu);
              }

              v5 = v11;
              goto LABEL_20;
            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
          if (v8)
            continue;
          break;
        }
      }

      v12 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
        *(_DWORD *)buf = 138412290;
        v23 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "SummarizationUtilities: imprecise label: %@", buf, 0xCu);

      }
      v4 = v6;
    }
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject", (_QWORD)v18));
  }
  else
  {
    v5 = 0;
  }
LABEL_20:

  return v5;
}

+ (id)workoutMetaDataCreatedForBundles:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  id v5;
  double v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  double v21;
  uint64_t v22;
  void *v23;
  id os_log;
  NSObject *v25;
  id obj;
  uint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  NSMutableDictionary *v39;
  _BYTE v40[128];
  _QWORD v41[2];
  _BYTE v42[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v5 = v3;
  v29 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v29)
  {
    obj = v5;
    v28 = *(_QWORD *)v35;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v29; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v28)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 2));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("provider"), 1));
        v41[0] = v9;
        v41[1] = v10;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 2));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v11));

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "events"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "filteredArrayUsingPredicate:", v12));

        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v31;
          do
          {
            for (j = 0; j != v17; j = (char *)j + 1)
            {
              if (*(_QWORD *)v31 != v18)
                objc_enumerationMutation(v15);
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1)
                                                                                 + 8 * (_QWORD)j), "workoutDuration"));
              objc_msgSend(v20, "doubleValue");
              v6 = v6 + v21 / 60.0;

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
          }
          while (v17);
        }

      }
      v5 = obj;
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v29);

    if (v6 > 0.0)
    {
      LODWORD(v22) = llround(v6);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v22));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v23, CFSTR("ActivityActionMetaDataValue"));

      -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", CFSTR("minutes"), CFSTR("ActivityActionMetaDataUnit"));
    }
  }
  else
  {

  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v25 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v4;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "SummarizationUtilities: workoutMetaData: %@", buf, 0xCu);
  }

  return v4;
}

+ (void)setMediaActionForWorkoutBundle:(id)a3 withMediaPlaySessionDominantFactorThreshold:(double)a4 mediaPlaySessionsOverlapsMinimumDistance:(double)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id os_log;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *i;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  double v46;
  NSMutableArray *v47;
  unint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id obj;
  uint64_t v76;
  void *v77;
  id v78;
  uint64_t v79;
  NSMutableArray *v80;
  void *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  _BYTE buf[12];
  __int16 v92;
  id v93;
  _BYTE v94[128];
  id v95;
  _QWORD v96[2];
  _QWORD v97[2];

  v7 = a3;
  v8 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 6));
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("provider"), 3));
  v74 = (void *)v8;
  v97[0] = v8;
  v97[1] = v73;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v97, 2));
  v10 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "events"));
  v72 = (void *)v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filteredArrayUsingPredicate:", v10));

  v80 = objc_opt_new(NSMutableArray);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endDate"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities predicateOfMediaPlaySessionsWithStartDate:endDate:distanceThreshold:](MOContextAnnotationUtilities, "predicateOfMediaPlaySessionsWithStartDate:endDate:distanceThreshold:", v13, v14, a5));

  v15 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("workoutDuration"), 0);
  v16 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 2));
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("provider"), 1));
  v70 = (void *)v16;
  v96[0] = v16;
  v96[1] = v69;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v96, 2));
  v18 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v17));

  v81 = v7;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "events"));
  v68 = (void *)v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "filteredArrayUsingPredicate:", v18));
  v71 = v15;
  v95 = v15;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v95, 1));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "sortedArrayUsingDescriptors:", v21));

  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = v12;
  v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
  if (v78)
  {
    v76 = *(_QWORD *)v87;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v87 != v76)
          objc_enumerationMutation(obj);
        v79 = v22;
        v23 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "mediaPlaySessions"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "filteredArrayUsingPredicate:", v77));

        os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        v27 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "mediaPlaySessions"));
          v29 = objc_msgSend(v28, "count");
          v30 = objc_msgSend(v25, "count");
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v29;
          v92 = 2048;
          v93 = v30;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "playback, %lu, filtered sessions, %lu", buf, 0x16u);

        }
        v84 = 0u;
        v85 = 0u;
        v82 = 0u;
        v83 = 0u;
        v31 = v25;
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v83;
          do
          {
            for (i = 0; i != v33; i = (char *)i + 1)
            {
              if (*(_QWORD *)v83 != v34)
                objc_enumerationMutation(v31);
              v36 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)i);
              v37 = objc_alloc((Class)NSDateInterval);
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "startDate"));
              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "endDate"));
              v40 = objc_msgSend(v37, "initWithStartDate:endDate:", v38, v39);

              v41 = objc_alloc((Class)NSDateInterval);
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "startDate"));
              v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "endDate"));
              v44 = objc_msgSend(v41, "initWithStartDate:endDate:", v42, v43);
              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "intersectionWithDateInterval:", v40));

              objc_msgSend(v45, "duration");
              if (v46 != 0.0)
                -[NSMutableArray addObject:](v80, "addObject:", v36);

            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
          }
          while (v33);
        }

        v22 = v79 + 1;
      }
      while ((id)(v79 + 1) != v78);
      v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
    }
    while (v78);
  }

  if (objc_msgSend(v67, "count"))
  {
    v47 = objc_opt_new(NSMutableArray);
    if (objc_msgSend(v67, "count"))
    {
      v48 = 0;
      do
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectAtIndexedSubscript:", v48));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "workoutEvent"));
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "workoutType"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "firstObject"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "workoutEvent"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "workoutType"));

        if (v51 == v54)
        {
          v55 = objc_alloc((Class)NSDateInterval);
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectAtIndexedSubscript:", v48));
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "startDate"));
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectAtIndexedSubscript:", v48));
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "endDate"));
          v60 = objc_msgSend(v55, "initWithStartDate:endDate:", v57, v59);

          -[NSMutableArray addObject:](v47, "addObject:", v60);
        }
        ++v48;
      }
      while ((unint64_t)objc_msgSend(v67, "count") > v48);
    }
    *(_QWORD *)buf = 0xBFF0000000000000;
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities dominantMediaNameFromPlaySessions:intervalsOfInterest:dominantFactorThreshold:confidence:](MOContextAnnotationUtilities, "dominantMediaNameFromPlaySessions:intervalsOfInterest:dominantFactorThreshold:confidence:", v80, v47, buf, a4));
    v62 = v61;
    if (v61)
    {
      v63 = objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("DominantMediaNameKey")));
      if (v63)
      {
        v64 = (void *)v63;
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("DominantMediaPropertyKey")));

        if (v65)
        {
          v66 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities creatMediaActionWithMediaInfo:mediaNameConfidence:](MOContextAnnotationUtilities, "creatMediaActionWithMediaInfo:mediaNameConfidence:", v62, *(double *)buf));
          objc_msgSend(v81, "setConcurrentMediaAction:", v66);

        }
      }
    }

  }
}

+ (id)metricForVisitsFromBundle:(id)a3 andNextBundle:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  double v13;
  void *i;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  id os_log;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v37;
  id v38;
  NSMutableDictionary *v39;
  id v40;
  id obj;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint8_t v52[128];
  uint8_t buf[4];
  id v54;
  __int16 v55;
  id v56;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_new(NSMutableDictionary);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sortedVisitEventsFromBundle:", v6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sortedVisitEventsFromBundle:", v7));
  if (objc_msgSend(v9, "count") && objc_msgSend(v10, "count"))
  {
    v39 = v8;
    v40 = v6;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v37 = v9;
    obj = v9;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    v38 = v7;
    if (v11)
    {
      v12 = v11;
      v42 = *(_QWORD *)v48;
      v13 = 1.79769313e308;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v48 != v42)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v16 = v10;
          v17 = v10;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v44;
            do
            {
              for (j = 0; j != v19; j = (char *)j + 1)
              {
                if (*(_QWORD *)v44 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)j);
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "location", v37));
                v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "location"));
                objc_msgSend(v23, "distanceFromLocation:", v24);
                v26 = v25;

                if (v26 < v13)
                  v13 = v26;
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
            }
            while (v19);
          }

          v10 = v16;
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      }
      while (v12);
    }
    else
    {
      v13 = 1.79769313e308;
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "startDate"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "lastObject"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "endDate"));
    objc_msgSend(v30, "timeIntervalSinceDate:", v32);
    v34 = v33;

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13));
    v8 = v39;
    -[NSMutableDictionary setObject:forKey:](v39, "setObject:forKey:", v35, CFSTR("distance"));

    v28 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v34));
    -[NSMutableDictionary setObject:forKey:](v39, "setObject:forKey:", v28, CFSTR("timeInterval"));
    v6 = v40;
    v9 = v37;
    v7 = v38;
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v28 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v54 = objc_msgSend(v9, "count");
      v55 = 2048;
      v56 = objc_msgSend(v10, "count");
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "SummarizationUtilities: can not generate visit metric for two bundle since one of them has visit count as 0, bundle 1 visit count, %lu, bundle 2 visit count, %lu", buf, 0x16u);
    }
  }

  return v8;
}

+ (double)maximumDistanceFromBundle:(id)a3 toBundleCluster:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  double v10;
  void *i;
  void *v12;
  void *v13;
  double v14;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = a3;
  v6 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    v10 = 2.22507386e-308;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[MOSummarizationUtilities metricForVisitsFromBundle:andNextBundle:](MOSummarizationUtilities, "metricForVisitsFromBundle:andNextBundle:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), v5));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("distance")));
        objc_msgSend(v13, "doubleValue");
        v15 = v14;

        if (v15 > v10)
          v10 = v15;

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 2.22507386e-308;
  }

  return v10;
}

+ (id)sortedVisitEventsFromBundle:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  _QWORD v15[2];

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("provider"), 4));
  v15[0] = v5;
  v15[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "events"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filteredArrayUsingPredicate:", v8));
  v14 = v4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sortedArrayUsingDescriptors:", v11));

  return v12;
}

+ (double)workoutTimeIntervalBetweenBundle:(id)a3 andNextBundle:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id os_log;
  NSObject *v16;
  int v18;
  id v19;
  __int16 v20;
  id v21;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sortedWorkoutEventsFromBundle:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sortedWorkoutEventsFromBundle:", v6));

  if (objc_msgSend(v7, "count") && objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "endDate"));
    objc_msgSend(v10, "timeIntervalSinceDate:", v12);
    v14 = v13;

  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v16 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v18 = 134218240;
      v19 = objc_msgSend(v7, "count");
      v20 = 2048;
      v21 = objc_msgSend(v8, "count");
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "SummarizationUtilities: can not generate workout time interval for two bundle since one of them has workout count as 0, bundle 1 workout count, %lu, bundle 2 workout count, %lu", (uint8_t *)&v18, 0x16u);
    }

    v14 = 1.79769313e308;
  }

  return v14;
}

+ (id)sortedWorkoutEventsFromBundle:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  _QWORD v15[2];

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("provider"), 1));
  v15[0] = v5;
  v15[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "events"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filteredArrayUsingPredicate:", v8));
  v14 = v4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sortedArrayUsingDescriptors:", v11));

  return v12;
}

+ (id)createOutingMegaBundleFromBundles:(id)a3 withParameters:(id)a4 isCoarseGranularity:(BOOL)a5 timeZoneManager:(id)a6
{
  id v9;
  id v10;
  id v11;
  MOEventBundle *v12;
  MOEventBundle *v13;
  void *v14;
  void *v15;
  MOEventBundle *v16;
  MOEventBundle *v17;
  NSMutableSet *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  NSMutableArray *v36;
  NSMutableArray *v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  void *j;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  id os_log;
  NSObject *v58;
  const __CFString *v59;
  void *v61;
  void *v62;
  id v63;
  NSMutableSet *v64;
  MOEventBundle *v65;
  id v66;
  id v67;
  id v68;
  _BOOL4 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t buf[4];
  const __CFString *v79;
  __int16 v80;
  MOEventBundle *v81;
  _BYTE v82[128];
  _BYTE v83[128];

  v69 = a5;
  v9 = a3;
  v10 = a4;
  v11 = a6;
  if ((unint64_t)objc_msgSend(v9, "count") >= 2)
  {
    v67 = v10;
    v13 = [MOEventBundle alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v16 = -[MOEventBundle initWithBundleIdentifier:creationDate:](v13, "initWithBundleIdentifier:creationDate:", v14, v15);

    v17 = v16;
    objc_msgSend(a1, "updateRankMetaDataFrom:forSummaryBundle:", v9, v16);
    v18 = objc_opt_new(NSMutableSet);
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v68 = v9;
    v19 = v9;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v75 != v22)
            objc_enumerationMutation(v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)i), "events"));
          -[NSMutableSet addObjectsFromArray:](v18, "addObjectsFromArray:", v24);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
      }
      while (v21);
    }

    v64 = v18;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v18, "allObjects"));
    -[MOEventBundle setEvents:](v17, "setEvents:", v25);

    -[MOEventBundle setPropertiesBasedOnEvents](v17, "setPropertiesBasedOnEvents");
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "getTimeSpanOfMOEventBundleArray"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "startDate"));
    -[MOEventBundle setStartDate:](v17, "setStartDate:", v27);

    v62 = v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "endDate"));
    -[MOEventBundle setEndDate:](v17, "setEndDate:", v28);

    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sortedVisitEventsFromBundle:", v17));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "lastObject"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "endDate"));
    v66 = v11;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeForDate:timeZoneManager:](MOTime, "timeForDate:timeZoneManager:", v30, v11));
    -[MOEventBundle setTime:](v17, "setTime:", v31);

    -[MOEventBundle setInterfaceType:](v17, "setInterfaceType:", 12);
    v63 = a1;
    objc_msgSend(a1, "setActionsAndPlacesFromBundles:forSummaryBundle:", v19, v17);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v17, "action"));
    v33 = objc_msgSend(v32, "actionType");

    if (v33 == (id)4)
      v34 = 2;
    else
      v34 = 1;
    if (v33 == (id)4)
      v35 = 201;
    else
      v35 = 101;
    -[MOEventBundle setBundleSuperType:](v17, "setBundleSuperType:", v34);
    v65 = v17;
    -[MOEventBundle setBundleSubType:](v17, "setBundleSubType:", v35);
    v36 = objc_opt_new(NSMutableArray);
    v37 = objc_opt_new(NSMutableArray);
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v38 = v19;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v71;
      do
      {
        for (j = 0; j != v40; j = (char *)j + 1)
        {
          if (*(_QWORD *)v71 != v41)
            objc_enumerationMutation(v38);
          v43 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)j);
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "bundleIdentifier"));
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "UUIDString"));
          -[NSMutableArray addObject:](v36, "addObject:", v45);

          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "subBundleIDs"));
          v47 = objc_msgSend(v46, "count");

          if (v47)
          {
            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "subBundleIDs"));
            -[NSMutableArray addObjectsFromArray:](v36, "addObjectsFromArray:", v48);

          }
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "suggestionID"));
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "UUIDString"));
          -[NSMutableArray addObject:](v37, "addObject:", v50);

          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "subSuggestionIDs"));
          v52 = objc_msgSend(v51, "count");

          if (v52)
          {
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "subSuggestionIDs"));
            -[NSMutableArray addObjectsFromArray:](v37, "addObjectsFromArray:", v53);

          }
          if (!v69 || (objc_msgSend(v43, "isAggregatedAndSuppressed") & 1) == 0)
          {
            objc_msgSend(v43, "setIsAggregatedAndSuppressed:", !v69);
            objc_msgSend(v43, "setSummarizationGranularity:", 1);
          }
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
      }
      while (v40);
    }

    v54 = -[NSMutableArray copy](v36, "copy");
    v12 = v65;
    -[MOEventBundle setSubBundleIDs:](v65, "setSubBundleIDs:", v54);

    v55 = -[NSMutableArray copy](v37, "copy");
    -[MOEventBundle setSubSuggestionIDs:](v65, "setSubSuggestionIDs:", v55);

    v10 = v67;
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "getResourcesFromBundles:forSummaryBundle:withParameters:", v38, v65, v67));
    -[MOEventBundle setResources:](v65, "setResources:", v56);

    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v58 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      v59 = CFSTR("fine");
      if (v69)
        v59 = CFSTR("coarse");
      *(_DWORD *)buf = 138412546;
      v79 = v59;
      v80 = 2112;
      v81 = v65;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "SummarizationUtilities: outing mega bundle being created: granularity, %@, bundle, %@", buf, 0x16u);
    }

    v9 = v68;
    v11 = v66;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)createActivityMegaBundleFromBundles:(id)a3 withParameters:(id)a4 isCoarseGranularity:(BOOL)a5 isWeeklySummary:(BOOL)a6 timeZoneManager:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  double v18;
  int v19;
  id os_log;
  NSObject *v21;
  void *v22;
  id v23;
  NSObject *v24;
  double v25;
  NSObject *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  void *v31;
  void *v32;
  float v33;
  float v34;
  id v35;
  NSObject *v36;
  float v37;
  id v38;
  NSObject *v39;
  double v40;
  id v41;
  NSObject *v42;
  MOEventBundle *v43;
  id v44;
  NSObject *v45;
  id v46;
  MOEventBundle *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  uint64_t v56;
  void *j;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  MOAction *v67;
  void *v68;
  MOAction *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  MOAction *v77;
  void *v78;
  MOAction *v79;
  void *v80;
  void *v81;
  float v82;
  double v83;
  float v84;
  NSMutableArray *v85;
  NSMutableArray *v86;
  id v87;
  id v88;
  id v89;
  uint64_t v90;
  void *k;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  id v100;
  void *v101;
  id v102;
  NSObject *v103;
  double v104;
  void *v105;
  uint64_t v106;
  void *v107;
  const __CFString *v108;
  const __CFString *v109;
  void *v111;
  NSObject *v112;
  id v113;
  id v114;
  double v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v121;
  _BOOL4 v122;
  id obj;
  NSMutableSet *v124;
  _BOOL4 v125;
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
  __int128 v136;
  __int128 v137;
  _QWORD v138[4];
  NSObject *v139;
  uint8_t buf[4];
  double v141;
  __int16 v142;
  void *v143;
  __int16 v144;
  uint64_t v145;
  __int16 v146;
  const __CFString *v147;
  __int16 v148;
  const __CFString *v149;
  _BYTE v150[128];
  _BYTE v151[128];
  NSObject *v152;
  _BYTE v153[128];

  v8 = a6;
  v9 = a5;
  v11 = a3;
  v121 = a4;
  v12 = a7;
  v13 = objc_msgSend(v11, "mutableCopy");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v15 = objc_alloc((Class)NSDate);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v17 = objc_msgSend(v15, "initWithTimeInterval:sinceDate:", v16, -604800.0);
  v18 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startOfDayForDate:", v17)));

  v125 = v8;
  v122 = v9;
  v19 = v9 && v8;
  if (v19 == 1)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v21 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v141 = v18;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "SummarizationUtilities: the earliest date for activity bundle to be aggregated for weekly: %@", buf, 0xCu);
    }

    v138[0] = _NSConcreteStackBlock;
    v138[1] = 3221225472;
    v138[2] = __131__MOSummarizationUtilities_createActivityMegaBundleFromBundles_withParameters_isCoarseGranularity_isWeeklySummary_timeZoneManager___block_invoke;
    v138[3] = &unk_1002B1688;
    v139 = *(id *)&v18;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v138));
    objc_msgSend(v13, "filterUsingPredicate:", v22);

    v23 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = COERCE_DOUBLE(objc_msgSend(v13, "count"));
      *(_DWORD *)buf = 134217984;
      v141 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "SummarizationUtilities: bundle count in most recent 7 days: %lu", buf, 0xCu);
    }

    if (!objc_msgSend(v13, "count"))
    {
      v46 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      v26 = objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "SummarizationUtilities: no bundle available to create activity weekly bundle", buf, 2u);
      }
      goto LABEL_30;
    }
    v116 = v12;
    v118 = v11;
    v136 = 0u;
    v137 = 0u;
    v134 = 0u;
    v135 = 0u;
    v113 = v13;
    v26 = v13;
    v27 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v134, v153, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v135;
      while (2)
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(_QWORD *)v135 != v29)
            objc_enumerationMutation(v26);
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v134 + 1) + 8 * (_QWORD)i), "rankingDictionary"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore")));
          objc_msgSend(v32, "floatValue");
          v34 = v33;

          v35 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          v36 = objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            v141 = v34;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "SummarizationUtilities: activity bundle goodness score, %f", buf, 0xCu);
          }

          objc_msgSend(v121, "activitySummary_suppressionGoodnessScoreThreshold");
          if (v34 > v37)
          {
            v44 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            v45 = objc_claimAutoreleasedReturnValue(v44);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "SummarizationUtilities: one of activity bundle goodness is too high. Stop creating weekly workout summary", buf, 2u);
            }

            v12 = v116;
            v11 = v118;
            v13 = v113;
            goto LABEL_30;
          }
        }
        v28 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v134, v153, 16);
        if (v28)
          continue;
        break;
      }
    }

    if ((unint64_t)-[NSObject count](v26, "count") <= 3)
    {
      v38 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      v39 = objc_claimAutoreleasedReturnValue(v38);
      v12 = v116;
      v11 = v118;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = COERCE_DOUBLE(-[NSObject count](v26, "count"));
        *(_DWORD *)buf = 134217984;
        v141 = v40;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "SummarizationUtilities: %lu bundles are not enough to create activity weekly bundle for coarse granularity", buf, 0xCu);
      }
      v26 = v39;
      v13 = v113;
LABEL_30:

      v43 = 0;
      v42 = v139;
      goto LABEL_70;
    }

    v12 = v116;
    v11 = v118;
    v13 = v113;
    v19 = 1;
    goto LABEL_32;
  }
  if ((unint64_t)objc_msgSend(v13, "count") > 1)
  {
LABEL_32:
    v47 = [MOEventBundle alloc];
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v43 = -[MOEventBundle initWithBundleIdentifier:creationDate:](v47, "initWithBundleIdentifier:creationDate:", v48, v49);

    objc_msgSend(a1, "updateRankMetaDataFrom:forSummaryBundle:", v13, v43);
    v50 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
    v51 = objc_msgSend(v13, "copy");
    v112 = v50;
    v152 = v50;
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v152, 1));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "sortedArrayUsingDescriptors:", v52));

    v124 = objc_opt_new(NSMutableSet);
    v130 = 0u;
    v131 = 0u;
    v132 = 0u;
    v133 = 0u;
    obj = v53;
    v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v151, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v131;
      do
      {
        for (j = 0; j != v55; j = (char *)j + 1)
        {
          if (*(_QWORD *)v131 != v56)
            objc_enumerationMutation(obj);
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v130 + 1) + 8 * (_QWORD)j), "events"));
          -[NSMutableSet addObjectsFromArray:](v124, "addObjectsFromArray:", v58);

        }
        v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v151, 16);
      }
      while (v55);
    }

    v59 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v124, "allObjects"));
    -[MOEventBundle setEvents:](v43, "setEvents:", v59);

    -[MOEventBundle setPropertiesBasedOnEvents](v43, "setPropertiesBasedOnEvents");
    if (v19)
    {
      -[MOEventBundle setStartDate:](v43, "setStartDate:", *(_QWORD *)&v18);
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      -[MOEventBundle setEndDate:](v43, "setEndDate:", v60);

      -[MOEventBundle setBundleSuperType:](v43, "setBundleSuperType:", 2);
      -[MOEventBundle setBundleSubType:](v43, "setBundleSubType:", 202);
    }
    else
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getTimeSpanOfMOEventBundleArray"));
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "startDate"));
      -[MOEventBundle setStartDate:](v43, "setStartDate:", v62);

      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "endDate"));
      -[MOEventBundle setEndDate:](v43, "setEndDate:", v63);

      -[MOEventBundle setBundleSuperType:](v43, "setBundleSuperType:", 2);
      -[MOEventBundle setBundleSubType:](v43, "setBundleSubType:", 201);

    }
    v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sortedWorkoutEventsFromBundle:", v43));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "lastObject"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "endDate"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeForDate:timeZoneManager:](MOTime, "timeForDate:timeZoneManager:", v65, v12));
    -[MOEventBundle setTime:](v43, "setTime:", v66);

    -[MOEventBundle setInterfaceType:](v43, "setInterfaceType:", 12);
    objc_msgSend(a1, "setActionsAndPlacesFromBundles:forSummaryBundle:", v11, v43);
    if (v19)
    {
      v67 = [MOAction alloc];
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "workoutMetaDataCreatedForBundles:", obj));
      v69 = -[MOAction initWithActionName:actionType:actionSubtype:actionMetaData:](v67, "initWithActionName:actionType:actionSubtype:actionMetaData:", CFSTR("workout"), 4, 0, v68);
      -[MOEventBundle setAction:](v43, "setAction:", v69);

      v70 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v43, "events"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "firstObject"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "eventIdentifier"));
      v73 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v43, "action"));
      objc_msgSend(v73, "setSourceEventIdentifier:", v72);

    }
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v43, "action"));

    v117 = v12;
    v119 = v11;
    v115 = v18;
    if (v74)
    {
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "workoutMetaDataCreatedForBundles:", obj));
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v43, "action"));
      objc_msgSend(v76, "setActionMetaData:", v75);
    }
    else
    {
      v77 = [MOAction alloc];
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "workoutMetaDataCreatedForBundles:", obj));
      v79 = -[MOAction initWithActionName:actionType:actionSubtype:actionMetaData:](v77, "initWithActionName:actionType:actionSubtype:actionMetaData:", CFSTR("workout"), 4, 0, v78);
      -[MOEventBundle setAction:](v43, "setAction:", v79);

      v75 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v43, "events"));
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "firstObject"));
      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "eventIdentifier"));
      v81 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v43, "action"));
      objc_msgSend(v81, "setSourceEventIdentifier:", v80);

    }
    objc_msgSend(v121, "dominantBundle_mediaPlaySessionDominantFactorThreshold");
    v83 = v82;
    objc_msgSend(v121, "dominantBundle_mediaPlaySessionsOverlapsMinimumDistance");
    objc_msgSend(a1, "setMediaActionForWorkoutBundle:withMediaPlaySessionDominantFactorThreshold:mediaPlaySessionsOverlapsMinimumDistance:", v43, v83, v84);
    v85 = objc_opt_new(NSMutableArray);
    v86 = objc_opt_new(NSMutableArray);
    v126 = 0u;
    v127 = 0u;
    v128 = 0u;
    v129 = 0u;
    v114 = v13;
    v87 = v13;
    v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v126, v150, 16);
    if (v88)
    {
      v89 = v88;
      v90 = *(_QWORD *)v127;
      do
      {
        for (k = 0; k != v89; k = (char *)k + 1)
        {
          if (*(_QWORD *)v127 != v90)
            objc_enumerationMutation(v87);
          v92 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * (_QWORD)k);
          v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "subBundleIDs"));
          v94 = objc_msgSend(v93, "count");

          if (v94)
          {
            v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "subBundleIDs"));
            -[NSMutableArray addObjectsFromArray:](v85, "addObjectsFromArray:", v95);
          }
          else
          {
            v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "bundleIdentifier"));
            v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "UUIDString"));
            -[NSMutableArray addObject:](v85, "addObject:", v96);

          }
          v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "suggestionID"));
          v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "UUIDString"));
          -[NSMutableArray addObject:](v86, "addObject:", v98);

          if (!v125)
          {
            if (v122)
            {
              if ((objc_msgSend(v92, "isAggregatedAndSuppressed") & 1) == 0)
                objc_msgSend(v92, "setSummarizationGranularity:", 1);
            }
            else
            {
              objc_msgSend(v92, "setIsAggregatedAndSuppressed:", 1);
            }
          }
          v99 = -[NSMutableArray copy](v85, "copy");
          -[MOEventBundle setSubBundleIDs:](v43, "setSubBundleIDs:", v99);

          v100 = -[NSMutableArray copy](v86, "copy");
          -[MOEventBundle setSubSuggestionIDs:](v43, "setSubSuggestionIDs:", v100);

        }
        v89 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v126, v150, 16);
      }
      while (v89);
    }

    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getResourcesFromBundles:forSummaryBundle:withParameters:", obj, v43, v121));
    -[MOEventBundle setResources:](v43, "setResources:", v101);

    v102 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v103 = objc_claimAutoreleasedReturnValue(v102);
    if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
    {
      v104 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v43, "startDate")));
      v105 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](v43, "endDate"));
      v106 = objc_claimAutoreleasedReturnValue(-[MOEventBundle bundleIdentifier](v43, "bundleIdentifier"));
      v107 = (void *)v106;
      v108 = CFSTR("NO");
      *(_DWORD *)buf = 138413314;
      v141 = v104;
      if (v122)
        v109 = CFSTR("YES");
      else
        v109 = CFSTR("NO");
      v142 = 2112;
      v143 = v105;
      if (v125)
        v108 = CFSTR("YES");
      v144 = 2112;
      v145 = v106;
      v146 = 2112;
      v147 = v109;
      v148 = 2112;
      v149 = v108;
      _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_INFO, "SummarizationUtilities: activity mega bundle being created: start date, %@, end date, %@, bundleID, %@, isCoarseGranularity, %@, isWeekly, %@", buf, 0x34u);

    }
    v12 = v117;
    v11 = v119;
    v13 = v114;
    v18 = v115;
    v42 = v112;
    goto LABEL_70;
  }
  v41 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v42 = objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v141 = COERCE_DOUBLE(objc_msgSend(v13, "count"));
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "SummarizationUtilities: %lu bundles are not enough to create activity mega bundle", buf, 0xCu);
  }
  v43 = 0;
LABEL_70:

  return v43;
}

id __131__MOSummarizationUtilities_createActivityMegaBundleFromBundles_withParameters_isCoarseGranularity_isWeeklySummary_timeZoneManager___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "startDate"));
  v4 = objc_msgSend(v3, "isOnOrAfter:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (BOOL)isOutingBundleFromHomeOrWorkVisit:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sortedVisitEventsFromBundle:", a3));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "placeUserType", (_QWORD)v11) == (id)2 || objc_msgSend(v8, "placeUserType") == (id)2)
        {
          v9 = 1;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v9 = 0;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_13:

  return v9;
}

+ (BOOL)isOutingBundleInsideOneDay:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  id v20;
  id v21;
  id v22;
  BOOL v23;
  id os_log;
  NSObject *v25;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "time"));
  if (v5
    && (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "time")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "timeZone")),
        v8,
        v7,
        v6,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "time"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timeZone"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](NSTimeZone, "timeZoneWithName:", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsInTimeZone:fromDate:", v11, v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "time"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "timeZone"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](NSTimeZone, "timeZoneWithName:", v15));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsInTimeZone:fromDate:", v16, v17));

  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "components:fromDate:", 28, v19));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "components:fromDate:", 28, v14));
  }

  v20 = objc_msgSend(v13, "day");
  if (v20 == objc_msgSend(v18, "day") && (v21 = objc_msgSend(v13, "month"), v21 == objc_msgSend(v18, "month")))
  {
    v22 = objc_msgSend(v13, "year");
    v23 = v22 == objc_msgSend(v18, "year");
  }
  else
  {
    v23 = 0;
  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v25 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    +[MOSummarizationUtilities isOutingBundleInsideOneDay:].cold.1(v23, v25);

  return v23;
}

+ (BOOL)isBundleWithAssets:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "resources", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "type") == (id)2 || objc_msgSend(v8, "type") == (id)3)
        {
          v9 = 1;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v9 = 0;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_13:

  return v9;
}

+ (BOOL)allPhotoAssetsFromBundleStartDay:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  BOOL v36;
  id v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];

  v3 = a3;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "time"));
  if (v4
    && (v5 = (void *)v4,
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "time")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timeZone")),
        v7,
        v6,
        v5,
        v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "time"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timeZone"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](NSTimeZone, "timeZoneWithName:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "componentsInTimeZone:fromDate:", v10, v11));

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "components:fromDate:", 28, v8));
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resources"));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v41;
    while (2)
    {
      v17 = 0;
      v38 = v15;
      do
      {
        if (*(_QWORD *)v41 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v17);
        if (objc_msgSend(v18, "type", v38) == (id)2)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "photoCreationDate"));

          if (v19)
          {
            v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "time"));
            if (v20
              && (v21 = (void *)v20,
                  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "time")),
                  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "timeZone")),
                  v23,
                  v22,
                  v21,
                  v23))
            {
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "time"));
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "timeZone"));
              v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](NSTimeZone, "timeZoneWithName:", v25));
              v27 = v16;
              v28 = v12;
              v29 = v13;
              v30 = v3;
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "photoCreationDate"));
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "componentsInTimeZone:fromDate:", v26, v31));

              v3 = v30;
              v13 = v29;
              v12 = v28;
              v16 = v27;
              v15 = v38;

            }
            else
            {
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "photoCreationDate"));
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "components:fromDate:", 28, v24));
            }

            v33 = objc_msgSend(v12, "day");
            if (v33 != objc_msgSend(v32, "day")
              || (v34 = objc_msgSend(v12, "month"), v34 != objc_msgSend(v32, "month"))
              || (v35 = objc_msgSend(v12, "year"), v35 != objc_msgSend(v32, "year")))
            {

              v36 = 0;
              goto LABEL_24;
            }

          }
        }
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v15)
        continue;
      break;
    }
  }
  v36 = 1;
LABEL_24:

  return v36;
}

+ (BOOL)isBundle:(id)a3 insideTheSameDayAsOtherBundle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id os_log;
  NSObject *v32;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  _BOOL4 v41;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "isOutingBundleInsideOneDay:", v6)
    && objc_msgSend(a1, "isOutingBundleInsideOneDay:", v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "time"));
    if (v9
      && (v10 = (void *)v9,
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "time")),
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "timeZone")),
          v12,
          v11,
          v10,
          v12))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "time"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "timeZone"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](NSTimeZone, "timeZoneWithName:", v14));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsInTimeZone:fromDate:", v15, v16));

    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "components:fromDate:", 28, v13));
    }

    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "time"));
    if (v19
      && (v20 = (void *)v19,
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "time")),
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "timeZone")),
          v22,
          v21,
          v20,
          v22))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "time"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "timeZone"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](NSTimeZone, "timeZoneWithName:", v24));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsInTimeZone:fromDate:", v25, v26));

    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "components:fromDate:", 28, v23));
    }

    v28 = objc_msgSend(v17, "day");
    if (v28 == objc_msgSend(v27, "day") && (v29 = objc_msgSend(v17, "month"), v29 == objc_msgSend(v27, "month")))
    {
      v30 = objc_msgSend(v17, "year");
      v18 = v30 == objc_msgSend(v27, "year");
    }
    else
    {
      v18 = 0;
    }
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v32 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
      v36 = 138412802;
      v37 = v34;
      v38 = 2112;
      v39 = v35;
      v40 = 1024;
      v41 = v18;
      _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "SummarizationUtilities: bundle 1 with start date, %@, and bundle 2 with start date, %@,  are inside one day: %d", (uint8_t *)&v36, 0x1Cu);

    }
  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

+ (id)mergeOutingBundlesWithInDayWithGroupedBundles:(id)a3 remainingSingletonBundles:(id)a4 parameters:(id)a5 isCoarseGranularity:(BOOL)a6 timeZoneManager:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSMutableArray *v14;
  NSMutableArray *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
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
  id v33;
  id os_log;
  NSObject *v35;
  NSObject *v36;
  const char *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  unsigned __int8 v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  float v49;
  NSMutableArray *v50;
  id v51;
  NSObject *v52;
  void *v53;
  id v54;
  NSMutableDictionary *v55;
  void *v56;
  id v57;
  id v58;
  uint64_t v59;
  void *i;
  void *v61;
  void *v62;
  id v63;
  NSObject *v64;
  id v65;
  id v66;
  NSObject *v67;
  NSMutableArray *v69;
  id v70;
  NSMutableArray *v71;
  id v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  _BOOL4 v77;
  NSMutableArray *obj;
  NSMutableDictionary *v80;
  uint64_t v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint8_t v91[128];
  uint8_t buf[4];
  id v93;
  __int16 v94;
  NSObject *v95;
  _BYTE v96[128];

  v77 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a7;
  v14 = objc_opt_new(NSMutableArray);
  v15 = objc_opt_new(NSMutableArray);
  if (objc_msgSend(v10, "count"))
    -[NSMutableArray addObjectsFromArray:](v15, "addObjectsFromArray:", v10);
  if (objc_msgSend(v11, "count"))
    -[NSMutableArray addObjectsFromArray:](v15, "addObjectsFromArray:", v11);
  if (-[NSMutableArray count](v15, "count"))
  {
    v70 = v13;
    v71 = v14;
    v74 = v12;
    v72 = v11;
    v73 = v10;
    v80 = objc_opt_new(NSMutableDictionary);
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v69 = v15;
    obj = v15;
    v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
    if (!v82)
      goto LABEL_41;
    v81 = *(_QWORD *)v88;
    while (1)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v88 != v81)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "time"));
        if (v19
          && (v20 = (void *)v19,
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "time")),
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "timeZone")),
              v22,
              v21,
              v20,
              v22))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "time"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "timeZone"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](NSTimeZone, "timeZoneWithName:", v24));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "startDate"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "componentsInTimeZone:fromDate:", v25, v26));

        }
        else
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "startDate"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "components:fromDate:", 28, v23));
        }

        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v27, "year")));
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v27, "month")));
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v27, "day")));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stringByAppendingFormat:", CFSTR("-%@-%@"), v29, v30));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "action"));
        v33 = objc_msgSend(v32, "actionType");

        if (v33 == (id)4)
        {
          os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          v35 = objc_claimAutoreleasedReturnValue(os_log);
          if (!os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            goto LABEL_22;
          *(_WORD *)buf = 0;
          v36 = v35;
          v37 = "bundle is mainly focusing on workout, so skip adding to groups";
LABEL_21:
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, v37, buf, 2u);
          goto LABEL_22;
        }
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "places"));
        v39 = objc_msgSend(v38, "count");

        if (v39)
        {
          v40 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          v35 = objc_claimAutoreleasedReturnValue(v40);
          if (!os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            goto LABEL_22;
          *(_WORD *)buf = 0;
          v36 = v35;
          v37 = "bundle has many places related, so skip adding to groups";
          goto LABEL_21;
        }
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "place"));

        if (!v41)
        {
          v42 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          v35 = objc_claimAutoreleasedReturnValue(v42);
          if (!os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            goto LABEL_22;
          *(_WORD *)buf = 0;
          v36 = v35;
          v37 = "there is no place in the bundle, so skip adding to groups";
          goto LABEL_21;
        }
        v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "place"));
        if (!v35)
          goto LABEL_22;
        if ((objc_msgSend(a1, "isOutingBundleInsideOneDay:", v17) & 1) != 0)
        {

LABEL_33:
          v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "place"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "placeName"));
          v35 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v31, v44));

          v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v80, "objectForKeyedSubscript:", v35));
          if (v45)
          {
            v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v80, "objectForKeyedSubscript:", v35));
            objc_msgSend(a1, "maximumDistanceFromBundle:toBundleCluster:", v17, v46);
            v48 = v47;
            objc_msgSend(v74, "fineGranularity_outingBundlesAggregationDistanceThreshold");
            if (v48 < v49)
            {
              v76 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v80, "objectForKeyedSubscript:", v35));
              objc_msgSend(v76, "addObject:", v17);

            }
          }
          else
          {
            v50 = objc_opt_new(NSMutableArray);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v80, "setObject:forKeyedSubscript:", v50, v35);

            v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v80, "objectForKeyedSubscript:", v35));
            objc_msgSend(v46, "addObject:", v17);
          }

          v51 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          v52 = objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "startDate"));
            *(_DWORD *)buf = 138412546;
            v93 = v53;
            v94 = 2112;
            v95 = v35;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "add bundle with start date %@ to group for key: %@", buf, 0x16u);

          }
LABEL_22:

          goto LABEL_23;
        }
        if ((objc_msgSend(a1, "isOutingBundleInsideOneDay:", v17) & 1) != 0)
          goto LABEL_22;
        v43 = objc_msgSend(a1, "allPhotoAssetsFromBundleStartDay:", v17);

        if ((v43 & 1) != 0)
          goto LABEL_33;
LABEL_23:

        v16 = (char *)v16 + 1;
      }
      while (v82 != v16);
      v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
      v82 = v54;
      if (!v54)
      {
LABEL_41:

        v85 = 0u;
        v86 = 0u;
        v83 = 0u;
        v84 = 0u;
        v55 = v80;
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v80, "allKeys"));
        v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
        v13 = v70;
        v14 = v71;
        v12 = v74;
        if (v57)
        {
          v58 = v57;
          v59 = *(_QWORD *)v84;
          do
          {
            for (i = 0; i != v58; i = (char *)i + 1)
            {
              if (*(_QWORD *)v84 != v59)
                objc_enumerationMutation(v56);
              v61 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v55, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)i)));
              if ((unint64_t)objc_msgSend(v61, "count") >= 2)
              {
                v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "createOutingMegaBundleFromBundles:withParameters:isCoarseGranularity:timeZoneManager:", v61, v74, v77, v70));
                -[NSMutableArray addObject:](v71, "addObject:", v62);

                v55 = v80;
              }

            }
            v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
          }
          while (v58);
        }

        v63 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        v64 = objc_claimAutoreleasedReturnValue(v63);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
        {
          v65 = -[NSMutableArray count](v71, "count");
          *(_DWORD *)buf = 134218240;
          v93 = v65;
          v94 = 1024;
          LODWORD(v95) = v77;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "number of bundles created for merging bundles to the same place within the same day, %lu, for coarse granulariy, %d", buf, 0x12u);
        }

        v11 = v72;
        v10 = v73;
        v15 = v69;
        goto LABEL_55;
      }
    }
  }
  v66 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v67 = objc_claimAutoreleasedReturnValue(v66);
  v80 = (NSMutableDictionary *)v67;
  if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "no candidate bundle for merging with in day and the same place", buf, 2u);
  }
LABEL_55:

  return v14;
}

+ (id)sortedWorkoutBundleByDuration:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == (id)1)
      v4 = v3;
    else
      v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_340));
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

int64_t __58__MOSummarizationUtilities_sortedWorkoutBundleByDuration___block_invoke(id a1, MOEventBundle *a2, MOEventBundle *a3)
{
  MOEventBundle *v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  int64_t v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle metaDataForRank](a2, "metaDataForRank"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WorkoutDuration")));
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle metaDataForRank](v4, "metaDataForRank"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("WorkoutDuration")));
  objc_msgSend(v10, "floatValue");
  v12 = v11;

  if (v8 <= v12)
    v13 = 0;
  else
    v13 = -1;
  if (v8 < v12)
    return 1;
  else
    return v13;
}

+ (id)sortedBundleByPhotoAssetsCount:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == (id)1)
      v4 = v3;
    else
      v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_341));
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

int64_t __59__MOSummarizationUtilities_sortedBundleByPhotoAssetsCount___block_invoke(id a1, MOEventBundle *a2, MOEventBundle *a3)
{
  MOEventBundle *v4;
  MOEventBundle *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  void *v10;
  void *v11;
  float v12;
  uint64_t v13;
  int64_t v14;

  v4 = a3;
  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("type == %lu"), 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v5, "resources"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filteredArrayUsingPredicate:", v6));
  v9 = (float)(unint64_t)objc_msgSend(v8, "count");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v4, "resources"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "filteredArrayUsingPredicate:", v6));
  v12 = (float)(unint64_t)objc_msgSend(v11, "count");

  if (v9 <= v12)
    v13 = 0;
  else
    v13 = -1;
  if (v9 < v12)
    v14 = 1;
  else
    v14 = v13;

  return v14;
}

+ (id)sortedBundleByStartDate:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == (id)1)
      v4 = v3;
    else
      v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_342));
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

int64_t __52__MOSummarizationUtilities_sortedBundleByStartDate___block_invoke(id a1, MOEventBundle *a2, MOEventBundle *a3)
{
  MOEventBundle *v4;
  MOEventBundle *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  int64_t v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a2;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v4, "startDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v5, "startDate"));
  v8 = objc_msgSend(v6, "isBeforeDate:", v7);

  if ((v8 & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v4, "startDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v5, "startDate"));
    v12 = objc_msgSend(v10, "isAfterDate:", v11);

    v9 = (uint64_t)((_QWORD)v12 << 63) >> 63;
  }

  return v9;
}

+ (BOOL)hasWorkoutRoute:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "events", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "workoutLocationRoute"));

        if (v7)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

+ (BOOL)bundleHasOneWayRoute:(id)a3 parameters:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  float v18;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sortedActivityEventsFromBundle:", a3));
  if (!objc_msgSend(v7, "count"))
    goto LABEL_6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "workoutLocationRoute"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "workoutLocationRoute"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "workoutLocationRoute"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "workoutLocationRoute"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastObject"));

      objc_msgSend(v15, "distanceFromLocation:", v8);
      v17 = v16;
      objc_msgSend(v6, "fineGranularity_transitBundlesDestinationOneWayRouteMinimumDistanceThreshold");
      LOBYTE(v9) = v17 >= v18;

      goto LABEL_5;
    }
LABEL_6:
    LOBYTE(v9) = 0;
    goto LABEL_7;
  }
LABEL_5:

LABEL_7:
  return (char)v9;
}

+ (id)getInterestingDestination:(id)a3
{
  id v3;
  NSMutableArray *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  _BYTE v26[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    -[NSMutableArray addObject:](v4, "addObject:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "places"));

  if (v7)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "places", 0));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          -[NSMutableArray addObject:](v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v12));
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v10);
    }

  }
  v13 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
  v25 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingDescriptors:](v4, "sortedArrayUsingDescriptors:", v14));

  if (objc_msgSend(v15, "count"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
    if (objc_msgSend(v16, "placeUserType") == (id)1)
    {

    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
      v18 = objc_msgSend(v17, "placeUserType");

      if (v18 != (id)2)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
        goto LABEL_17;
      }
    }
  }
  v19 = 0;
LABEL_17:

  return v19;
}

+ (id)sortedActivityEventsFromBundle:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K = %lu OR %K = %lu) AND (%K != %lu)"), CFSTR("category"), 2, CFSTR("category"), 16, CFSTR("provider"), 5));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "events"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filteredArrayUsingPredicate:", v5));
  v11 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortedArrayUsingDescriptors:", v8));

  return v9;
}

+ (id)createTransitMegaBundleFromBundles:(id)a3 withParameters:(id)a4 isCoarseGranularity:(BOOL)a5 timeZoneManager:(id)a6 groupedOutingBundles:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  MOEventBundle *v15;
  void *v16;
  void *v17;
  MOEventBundle *v18;
  NSMutableArray *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSMutableArray *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSMutableArray *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  id os_log;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  NSMutableArray *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  void *v61;
  void *v62;
  _UNKNOWN **v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  void *v69;
  id v71;
  id v72;
  void *v73;
  NSMutableArray *v74;
  uint8_t buf[4];
  id v76;
  __int16 v77;
  void *v78;

  v10 = a6;
  v11 = a7;
  v12 = objc_msgSend(a3, "mutableCopy");
  if (objc_msgSend(v12, "count") == (id)2)
  {
    v71 = a1;
    v73 = v11;
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));
    v15 = [MOEventBundle alloc];
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v18 = -[MOEventBundle initWithBundleIdentifier:creationDate:](v15, "initWithBundleIdentifier:creationDate:", v16, v17);

    v19 = objc_opt_new(NSMutableArray);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bundleIdentifier](v13, "bundleIdentifier"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "UUIDString"));
    v74 = v19;
    -[NSMutableArray addObject:](v19, "addObject:", v21);

    -[NSObject setIsAggregatedAndSuppressed:](v13, "setIsAggregatedAndSuppressed:", 1);
    -[MOEventBundle setInterfaceType:](v18, "setInterfaceType:", 12);
    -[MOEventBundle setBundleSuperType:](v18, "setBundleSuperType:", 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject action](v13, "action"));
    v23 = objc_msgSend(v22, "actionSubtype");

    if (v23 == (id)1)
      -[MOEventBundle setBundleSubType:](v18, "setBundleSubType:", 205);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject action](v13, "action"));
    v25 = objc_msgSend(v24, "actionSubtype");

    if (v25 == (id)2)
      -[MOEventBundle setBundleSubType:](v18, "setBundleSubType:", 206);
    -[MOEventBundle setSummarizationGranularity:](v18, "setSummarizationGranularity:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject action](v13, "action"));
    -[MOEventBundle setAction:](v18, "setAction:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject concurrentMediaAction](v13, "concurrentMediaAction"));
    -[MOEventBundle setConcurrentMediaAction:](v18, "setConcurrentMediaAction:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject endDate](v13, "endDate"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeForDate:timeZoneManager:](MOTime, "timeForDate:timeZoneManager:", v28, v10));
    -[MOEventBundle setTime:](v18, "setTime:", v29);

    v30 = objc_opt_new(NSMutableArray);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject events](v13, "events"));
    -[NSMutableArray addObjectsFromArray:](v30, "addObjectsFromArray:", v31);

    -[MOEventBundle setEvents:](v18, "setEvents:", v30);
    -[MOEventBundle setPropertiesBasedOnEvents](v18, "setPropertiesBasedOnEvents");
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject startDate](v13, "startDate"));
    -[MOEventBundle setStartDate:](v18, "setStartDate:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject endDate](v13, "endDate"));
    -[MOEventBundle setEndDate:](v18, "setEndDate:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject expirationDate](v13, "expirationDate"));
    -[MOEventBundle setExpirationDate:](v18, "setExpirationDate:", v34);

    v35 = objc_opt_new(NSMutableArray);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject resources](v13, "resources"));
    -[NSMutableArray addObjectsFromArray:](v35, "addObjectsFromArray:", v36);

    v72 = v10;
    if (objc_msgSend(v14, "interfaceType") == (id)2
      && (objc_msgSend(v73, "containsObject:", v14) & 1) == 0)
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      v43 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject suggestionID](v13, "suggestionID"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "suggestionID"));
        *(_DWORD *)buf = 138412546;
        v76 = v44;
        v77 = 2112;
        v78 = v45;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "SummarizationUtilities: Combining activity bundle and outing bundle for transit bundle, activity %@, outing, %@", buf, 0x16u);

      }
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "events"));
      -[NSMutableArray addObjectsFromArray:](v30, "addObjectsFromArray:", v46);

      -[MOEventBundle setEvents:](v18, "setEvents:", v30);
      -[MOEventBundle setPropertiesBasedOnEvents](v18, "setPropertiesBasedOnEvents");
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject startDate](v13, "startDate"));
      -[MOEventBundle setStartDate:](v18, "setStartDate:", v47);

      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endDate"));
      -[MOEventBundle setEndDate:](v18, "setEndDate:", v48);

      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "expirationDate"));
      -[MOEventBundle setExpirationDate:](v18, "setExpirationDate:", v49);

      v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "addResourcesFromOutingBundle:toActivityBundle:", v14, v13));
      objc_msgSend(v14, "setIsAggregatedAndSuppressed:", 1);
      v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleIdentifier"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject UUIDString](v38, "UUIDString"));
      -[NSMutableArray addObject:](v74, "addObject:", v51);

      v35 = (NSMutableArray *)v50;
    }
    else
    {
      v37 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject suggestionID](v13, "suggestionID"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "suggestionID"));
        *(_DWORD *)buf = 138412546;
        v76 = v39;
        v77 = 2112;
        v78 = v40;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "SummarizationUtilities: Adding destination from timecontext bundle to activity bundle for transit bundle, activity %@, timecontext, %@", buf, 0x16u);

      }
    }

    v52 = -[NSMutableArray copy](v74, "copy");
    -[MOEventBundle setSubBundleIDs:](v18, "setSubBundleIDs:", v52);

    v53 = objc_opt_new(NSMutableArray);
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[MOSummarizationUtilities getInterestingDestination:](MOSummarizationUtilities, "getInterestingDestination:", v14));
    objc_msgSend(v54, "setPriorityScore:", 20000.0);
    -[NSMutableArray addObject:](v53, "addObject:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject place](v13, "place"));

    if (v55)
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject place](v13, "place"));
      -[MOEventBundle setPlace:](v18, "setPlace:", v56);

      v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject place](v13, "place"));
      -[NSMutableArray addObject:](v53, "addObject:", v57);

    }
    -[MOEventBundle setPlaces:](v18, "setPlaces:", v53);
    -[MOEventBundle setResources:](v18, "setResources:", v35);
    if (objc_msgSend(v14, "interfaceType") == (id)2)
    {
      objc_msgSend(v71, "updateRankMetaDataFrom:forSummaryBundle:", v12, v18);
LABEL_31:

      v10 = v72;
      v11 = v73;
      goto LABEL_32;
    }
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject rankingDictionary](v13, "rankingDictionary"));
    -[MOEventBundle setRankingDictionary:](v18, "setRankingDictionary:", v58);

    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "poiCategory"));
    if (v59)
    {
      objc_msgSend(v54, "placeNameConfidence");
      if (v60 >= 0.9)
      {
        v61 = (void *)nonInterestingPOIcategories;
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "poiCategory"));
        LODWORD(v61) = objc_msgSend(v61, "containsObject:", v62);

        if ((_DWORD)v61)
        {
          v63 = &off_1002DCCB8;
LABEL_27:
          -[MOEventBundle addMetaDataForRankForKey:value:](v18, "addMetaDataForRankForKey:value:", CFSTR("PoiCategory"), v63);
          goto LABEL_29;
        }
      }
      objc_msgSend(v54, "placeNameConfidence");
      if (v64 >= 0.9)
      {
        v65 = (void *)interestingPOIcategories;
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "poiCategory"));
        LODWORD(v65) = objc_msgSend(v65, "containsObject:", v66);

        if ((_DWORD)v65)
        {
          v63 = &off_1002DCCC8;
          goto LABEL_27;
        }
      }
      v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      -[MOEventBundle addMetaDataForRankForKey:value:](v18, "addMetaDataForRankForKey:value:", CFSTR("PoiCategory"), v67);

    }
LABEL_29:
    objc_msgSend(v54, "familiarityIndexLOI");
    if (v68 != -1.0)
    {
      objc_msgSend(v54, "familiarityIndexLOI");
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[MOEventBundle addMetaDataForRankForKey:value:](v18, "addMetaDataForRankForKey:value:", CFSTR("FamiliarityIndex"), v69);

    }
    goto LABEL_31;
  }
  v41 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v13 = objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v76 = objc_msgSend(v12, "count");
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "SummarizationUtilities: %lu bundle(s) does not meet count requirement to create transit mega bundle for fine granularity", buf, 0xCu);
  }
  v18 = 0;
LABEL_32:

  return v18;
}

+ (id)addResourcesFromOutingBundle:(id)a3 toActivityBundle:(id)a4
{
  id v5;
  id v6;
  _UNKNOWN **v7;
  NSMutableArray *v8;
  void *v9;
  _UNKNOWN **v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  double v22;
  void *i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSMutableArray *v29;
  void *v30;
  double v31;
  double v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *j;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  double v43;
  uint64_t v44;
  void *k;
  void *v46;
  void *v47;
  unsigned __int8 v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  double v61;
  void *m;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  id v76;
  id v77;
  id v78;
  uint64_t v79;
  void *n;
  void *v81;
  id v82;
  id v83;
  id v84;
  id v85;
  uint64_t v86;
  void *ii;
  void *v88;
  void *v89;
  unsigned __int8 v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  id v105;
  uint64_t v106;
  void *jj;
  void *v108;
  void *v109;
  unsigned __int8 v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  id v115;
  uint64_t v116;
  void *kk;
  void *v118;
  void *v119;
  unsigned __int8 v120;
  void *v121;
  void *v122;
  NSMutableDictionary *v123;
  id v124;
  id v125;
  id v126;
  void *mm;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  MOResource *v144;
  void *v145;
  void *v146;
  void *v147;
  id v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  id v162;
  id v163;
  id obj;
  uint64_t v165;
  void *v166;
  NSMutableArray *v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  _BYTE v204[128];
  id v205;
  _BYTE v206[128];
  _BYTE v207[128];
  _QWORD v208[2];
  id v209;
  _BYTE v210[128];
  _BYTE v211[128];
  id v212;
  id v213;
  _BYTE v214[128];
  id v215;
  _BYTE v216[128];
  _BYTE v217[128];
  id v218;
  id v219;
  _BYTE v220[128];
  id v221;

  v5 = a3;
  v6 = a4;
  v7 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
  v8 = objc_opt_new(NSMutableArray);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resources"));
  v167 = v8;
  -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v9);

  v10 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
  v11 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("type == %lu"), 2));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resources"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "filteredArrayUsingPredicate:", v11));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resources"));
  v161 = (void *)v11;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "filteredArrayUsingPredicate:", v11));

  v162 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("priorityScore"), 1);
  if (objc_msgSend(v15, "count") && !objc_msgSend(v13, "count"))
  {
    v221 = v162;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v221, 1));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sortedArrayUsingDescriptors:", v16));

    v202 = 0u;
    v203 = 0u;
    v200 = 0u;
    v201 = 0u;
    v18 = v17;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v200, v220, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v201;
      v22 = 202.0;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v201 != v21)
            objc_enumerationMutation(v18);
          v24 = *(void **)(*((_QWORD *)&v200 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v24, "setPriorityScore:", v22);
          v22 = v22 + 1.0;
          -[NSMutableArray addObject:](v167, "addObject:", v24);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v200, v220, 16);
      }
      while (v20);
    }

    v7 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
    v10 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
  }
  v156 = v15;
  v157 = v13;
  v159 = v6;
  if (objc_msgSend(v15, "count") && objc_msgSend(v13, "count"))
  {
    v219 = v162;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v219, 1));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sortedArrayUsingDescriptors:", v25));

    v218 = v162;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v218, 1));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sortedArrayUsingDescriptors:", v27));

    v29 = objc_opt_new(NSMutableArray);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastObject"));
    objc_msgSend(v30, "priorityScore");
    v32 = v31;

    v198 = 0u;
    v199 = 0u;
    v196 = 0u;
    v197 = 0u;
    v33 = v26;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v196, v217, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v197;
      do
      {
        for (j = 0; j != v35; j = (char *)j + 1)
        {
          if (*(_QWORD *)v197 != v36)
            objc_enumerationMutation(v33);
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v196 + 1) + 8 * (_QWORD)j), "assets"));
          -[NSMutableArray addObject:](v29, "addObject:", v38);

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v196, v217, 16);
      }
      while (v35);
    }
    v39 = v5;

    v194 = 0u;
    v195 = 0u;
    v192 = 0u;
    v193 = 0u;
    v40 = v28;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v192, v216, 16);
    if (v41)
    {
      v42 = v41;
      v43 = v32 + 1.0;
      v44 = *(_QWORD *)v193;
      do
      {
        for (k = 0; k != v42; k = (char *)k + 1)
        {
          if (*(_QWORD *)v193 != v44)
            objc_enumerationMutation(v40);
          v46 = *(void **)(*((_QWORD *)&v192 + 1) + 8 * (_QWORD)k);
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "assets"));
          v48 = -[NSMutableArray containsObject:](v29, "containsObject:", v47);

          if ((v48 & 1) == 0)
          {
            objc_msgSend(v46, "setPriorityScore:", v43);
            v43 = v43 + 1.0;
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "assets"));
            -[NSMutableArray addObject:](v29, "addObject:", v49);

            -[NSMutableArray addObject:](v167, "addObject:", v46);
          }
        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v192, v216, 16);
      }
      while (v42);
    }

    v5 = v39;
    v6 = v159;
    v7 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
    v10 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
  }
  v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10[322], "predicateWithFormat:", CFSTR("type == %lu"), 3));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resources"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "filteredArrayUsingPredicate:", v50));

  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resources"));
  v155 = (void *)v50;
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "filteredArrayUsingPredicate:", v50));

  if (objc_msgSend(v54, "count") && !objc_msgSend(v52, "count"))
  {
    v215 = v162;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v215, 1));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "sortedArrayUsingDescriptors:", v55));

    v190 = 0u;
    v191 = 0u;
    v188 = 0u;
    v189 = 0u;
    v57 = v56;
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v188, v214, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v189;
      v61 = 300.0;
      do
      {
        for (m = 0; m != v59; m = (char *)m + 1)
        {
          if (*(_QWORD *)v189 != v60)
            objc_enumerationMutation(v57);
          v63 = *(void **)(*((_QWORD *)&v188 + 1) + 8 * (_QWORD)m);
          objc_msgSend(v63, "setPriorityScore:", v61);
          v61 = v61 + 1.0;
          -[NSMutableArray addObject:](v167, "addObject:", v63);
        }
        v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v188, v214, 16);
      }
      while (v59);
    }

    v7 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
    v10 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
  }
  v153 = v54;
  v154 = v52;
  if (objc_msgSend(v54, "count") && objc_msgSend(v52, "count"))
  {
    v213 = v162;
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v213, 1));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "sortedArrayUsingDescriptors:", v64));

    v212 = v162;
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v212, 1));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "sortedArrayUsingDescriptors:", v66));

    v68 = (void *)objc_opt_new(v7[310]);
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "lastObject"));
    objc_msgSend(v69, "priorityScore");
    v71 = v70 + 1.0;

    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "lastObject"));
    objc_msgSend(v72, "priorityScore");
    v74 = v73;

    if (v74 == 201.0)
      v75 = 300.0;
    else
      v75 = v71;
    v186 = 0u;
    v187 = 0u;
    v184 = 0u;
    v185 = 0u;
    v76 = v65;
    v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v184, v211, 16);
    if (v77)
    {
      v78 = v77;
      v79 = *(_QWORD *)v185;
      do
      {
        for (n = 0; n != v78; n = (char *)n + 1)
        {
          if (*(_QWORD *)v185 != v79)
            objc_enumerationMutation(v76);
          v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v184 + 1) + 8 * (_QWORD)n), "name"));
          objc_msgSend(v68, "addObject:", v81);

        }
        v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v184, v211, 16);
      }
      while (v78);
    }
    v82 = v5;

    v182 = 0u;
    v183 = 0u;
    v180 = 0u;
    v181 = 0u;
    v83 = v67;
    v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v180, v210, 16);
    if (v84)
    {
      v85 = v84;
      v86 = *(_QWORD *)v181;
      do
      {
        for (ii = 0; ii != v85; ii = (char *)ii + 1)
        {
          if (*(_QWORD *)v181 != v86)
            objc_enumerationMutation(v83);
          v88 = *(void **)(*((_QWORD *)&v180 + 1) + 8 * (_QWORD)ii);
          v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "name"));
          v90 = objc_msgSend(v68, "containsObject:", v89);

          if ((v90 & 1) == 0)
          {
            objc_msgSend(v88, "setPriorityScore:", v75);
            v75 = v75 + 1.0;
            v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "name"));
            objc_msgSend(v68, "addObject:", v91);

            -[NSMutableArray addObject:](v167, "addObject:", v88);
          }
        }
        v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v180, v210, 16);
      }
      while (v85);
    }

    v5 = v82;
    v6 = v159;
    v7 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
    v10 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
  }
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray filteredArrayUsingPredicate:](v167, "filteredArrayUsingPredicate:", v161));
  if (objc_msgSend(v92, "count"))
  {
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "action"));
    v94 = objc_msgSend(v93, "actionSubtype");

    if (v94 == (id)2)
    {
      v209 = v162;
      v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v209, 1));
      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "sortedArrayUsingDescriptors:", v95));

      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "firstObject"));
      objc_msgSend(v97, "setPriorityScore:", 99.0);

    }
  }
  v152 = v92;
  v98 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10[322], "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 24));
  v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[322], "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("provider"), 1));
  v151 = (void *)v98;
  v208[0] = v98;
  v208[1] = v150;
  v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v208, 2));
  v100 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v99));

  v166 = (void *)objc_opt_new(v7[310]);
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "events"));
  v160 = (void *)v100;
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "filteredArrayUsingPredicate:", v100));

  v103 = (void *)objc_opt_new(v7[310]);
  v176 = 0u;
  v177 = 0u;
  v178 = 0u;
  v179 = 0u;
  obj = v102;
  v104 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v176, v207, 16);
  if (v104)
  {
    v105 = v104;
    v106 = *(_QWORD *)v177;
    do
    {
      for (jj = 0; jj != v105; jj = (char *)jj + 1)
      {
        if (*(_QWORD *)v177 != v106)
          objc_enumerationMutation(obj);
        v108 = *(void **)(*((_QWORD *)&v176 + 1) + 8 * (_QWORD)jj);
        v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "identifierFromProvider"));
        v110 = objc_msgSend(v103, "containsObject:", v109);

        if ((v110 & 1) == 0)
        {
          v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "identifierFromProvider"));
          objc_msgSend(v103, "addObject:", v111);

          objc_msgSend(v166, "addObject:", v108);
        }
      }
      v105 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v176, v207, 16);
    }
    while (v105);
  }

  v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "events"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "filteredArrayUsingPredicate:", v160));

  v174 = 0u;
  v175 = 0u;
  v172 = 0u;
  v173 = 0u;
  v163 = v113;
  v114 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v172, v206, 16);
  if (v114)
  {
    v115 = v114;
    v116 = *(_QWORD *)v173;
    do
    {
      for (kk = 0; kk != v115; kk = (char *)kk + 1)
      {
        if (*(_QWORD *)v173 != v116)
          objc_enumerationMutation(v163);
        v118 = *(void **)(*((_QWORD *)&v172 + 1) + 8 * (_QWORD)kk);
        v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "identifierFromProvider"));
        v120 = objc_msgSend(v103, "containsObject:", v119);

        if ((v120 & 1) == 0)
          objc_msgSend(v166, "addObject:", v118);
      }
      v115 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v172, v206, 16);
    }
    while (v115);
  }
  v158 = v5;

  v149 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 0);
  v205 = v149;
  v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v205, 1));
  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "sortedArrayUsingDescriptors:", v121));

  v123 = objc_opt_new(NSMutableDictionary);
  v168 = 0u;
  v169 = 0u;
  v170 = 0u;
  v171 = 0u;
  v124 = v122;
  v125 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v168, v204, 16);
  if (v125)
  {
    v126 = v125;
    v165 = *(_QWORD *)v169;
    do
    {
      for (mm = 0; mm != v126; mm = (char *)mm + 1)
      {
        if (*(_QWORD *)v169 != v165)
          objc_enumerationMutation(v124);
        v128 = *(void **)(*((_QWORD *)&v168 + 1) + 8 * (_QWORD)mm);
        v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "startDate"));
        objc_msgSend(v129, "timeIntervalSince1970");
        v130 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSMutableDictionary setObject:forKey:](v123, "setObject:forKey:", v130, CFSTR("MOStateOfMindMetaDataKeyStartDate"));

        v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "endDate"));
        objc_msgSend(v131, "timeIntervalSince1970");
        v132 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSMutableDictionary setObject:forKey:](v123, "setObject:forKey:", v132, CFSTR("MOStateOfMindMetaDataKeyEndDate"));

        v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "stateOfMindEvent"));
        v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "labels"));
        -[NSMutableDictionary setObject:forKey:](v123, "setObject:forKey:", v134, CFSTR("MOStateOfMindMetaDataKeyLabel"));

        v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "stateOfMindEvent"));
        v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "domains"));
        -[NSMutableDictionary setObject:forKey:](v123, "setObject:forKey:", v136, CFSTR("MOStateOfMindMetaDataKeyDomain"));

        v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "stateOfMindEvent"));
        objc_msgSend(v137, "reflectiveInterval");
        v138 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSMutableDictionary setObject:forKey:](v123, "setObject:forKey:", v138, CFSTR("MOStateOfMindMetaDataKeyReflectiveInterval"));

        v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "stateOfMindEvent"));
        objc_msgSend(v139, "valence");
        v140 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSMutableDictionary setObject:forKey:](v123, "setObject:forKey:", v140, CFSTR("MOStateOfMindMetaDataKeyValence"));

        v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "stateOfMindEvent"));
        objc_msgSend(v141, "valenceClassification");
        v142 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSMutableDictionary setObject:forKey:](v123, "setObject:forKey:", v142, CFSTR("MOStateOfMindMetaDataKeyValenceClassification"));

        v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "identifierFromProvider"));
        -[NSMutableDictionary setObject:forKey:](v123, "setObject:forKey:", v143, CFSTR("MOStateOfMindMetaDataKeyStateOfMindID"));

        v144 = -[MOResource initWithName:type:dict:value:]([MOResource alloc], "initWithName:type:dict:value:", CFSTR("StateOfMind"), 16, v123, 0.0);
        v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "identifierFromProvider"));
        -[MOResource setAssets:](v144, "setAssets:", v145);

        v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "eventIdentifier"));
        -[MOResource setSourceEventIdentifier:](v144, "setSourceEventIdentifier:", v146);

        -[MOResource setSourceEventAccessType:](v144, "setSourceEventAccessType:", 8);
        v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "firstObject"));

        if (v147 == v128)
          -[MOResource setPriorityScore:](v144, "setPriorityScore:", 202.0);
        -[NSMutableArray addObject:](v167, "addObject:", v144);

      }
      v126 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v168, v204, 16);
    }
    while (v126);
  }

  +[MOContextAnnotationUtilities addStateOfMindMetaDataForRankForBundle:withEmotionEvents:](MOContextAnnotationUtilities, "addStateOfMindMetaDataForRankForBundle:withEmotionEvents:", v159, v166);
  return v167;
}

+ (BOOL)isFlightBundle:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "action"));
  v4 = objc_msgSend(v3, "actionType") == (id)11;

  return v4;
}

+ (id)summarizeMotionActivityBundlesWithSamePlaceName:(id)a3 withParameters:(id)a4
{
  id v6;
  _UNKNOWN **v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id os_log;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  void *v33;
  NSMutableDictionary *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *j;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSMutableArray *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  uint64_t v63;
  void *i;
  uint64_t v65;
  void *v66;
  void *v67;
  id v68;
  NSObject *v69;
  id v70;
  void *v71;
  id v72;
  NSObject *v73;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  id v87;
  NSMutableArray *v88;
  id v89;
  uint64_t v90;
  id v91;
  NSMutableDictionary *v92;
  id v93;
  NSMutableDictionary *v94;
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
  _QWORD v107[4];
  id v108;
  id v109;
  _BYTE v110[128];
  _BYTE v111[128];
  uint8_t v112[128];
  uint8_t buf[4];
  id v114;
  __int16 v115;
  id v116;
  id v117;

  v6 = a3;
  v89 = a4;
  v88 = objc_opt_new(NSMutableArray);
  v7 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K = %lu OR %K = %lu OR %K = %lu) AND %K == NO"), CFSTR("bundleSubType"), 204, CFSTR("bundleSubType"), 207, CFSTR("bundleSubType"), 206, CFSTR("isAggregatedAndSuppressed")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filteredArrayUsingPredicate:", v8));
  v10 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
  v117 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v117, 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sortedArrayUsingDescriptors:", v11));

  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v14 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v114 = objc_msgSend(v12, "count");
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Summarization: Found %lu bundles containing phone walks eligible for summarization", buf, 0xCu);
  }

  if ((unint64_t)objc_msgSend(v12, "count") >= 2)
  {
    v76 = v10;
    v77 = v9;
    v78 = v8;
    v79 = v6;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startDate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "components:fromDate:", 28, v17));

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dateFromComponents:", v18));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "startDate"));
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "components:fromDate:", 28, v21));

    v75 = (void *)v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dateFromComponents:", v22));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dateByAddingUnit:value:toDate:options:", 16, 1, v23, 0));

    v25 = v19;
    v80 = v25;
    if (objc_msgSend(v25, "compare:", v24) == (id)-1)
    {
      v82 = v15;
      v83 = v12;
      v81 = v24;
      while (1)
      {
        v26 = v25;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dateByAddingUnit:value:toDate:options:", 16, 1, v26, 0));
        v28 = v7[322];
        v107[0] = _NSConcreteStackBlock;
        v107[1] = 3221225472;
        v107[2] = __91__MOSummarizationUtilities_summarizeMotionActivityBundlesWithSamePlaceName_withParameters___block_invoke;
        v107[3] = &unk_1002ADB80;
        v87 = v26;
        v108 = v87;
        v86 = v27;
        v109 = v86;
        v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "predicateWithBlock:", v107));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "filteredArrayUsingPredicate:"));
        v30 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          v32 = objc_msgSend(v29, "count");
          *(_DWORD *)buf = 134218242;
          v114 = v32;
          v115 = 2112;
          v116 = v87;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Summarization: Found %lu bundles containing phone walks for %@", buf, 0x16u);
        }

        v33 = v29;
        if ((unint64_t)objc_msgSend(v29, "count") >= 2)
          break;
LABEL_61:

        v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dateByAddingUnit:value:toDate:options:", 16, 1, v87, 0));
        if (objc_msgSend(v25, "compare:", v24) != (id)-1)
          goto LABEL_62;
      }
      v34 = objc_opt_new(NSMutableDictionary);
      v94 = objc_opt_new(NSMutableDictionary);
      v103 = 0u;
      v104 = 0u;
      v105 = 0u;
      v106 = 0u;
      v84 = v29;
      v35 = v29;
      v92 = v34;
      v93 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v103, v112, 16);
      if (!v93)
        goto LABEL_41;
      v36 = *(_QWORD *)v104;
      v90 = *(_QWORD *)v104;
      v91 = v35;
LABEL_11:
      v37 = 0;
      while (1)
      {
        if (*(_QWORD *)v104 != v36)
          objc_enumerationMutation(v35);
        v38 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "place"));
        v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "placeName"));
        if (!v40)
          break;
        v41 = (void *)v40;
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "place"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "startDate"));

        if (!v43)
          goto LABEL_18;
        v44 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "place"));
LABEL_33:
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "concatenatePlaceNameAndPlaceStart:", v44));
        if (v54)
        {
          v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v34, "objectForKey:", v54));

          if (v55)
          {
            v56 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v34, "objectForKeyedSubscript:", v54));
            -[NSMutableArray addObject:](v56, "addObject:", v38);
          }
          else
          {
            v56 = objc_opt_new(NSMutableArray);
            -[NSMutableArray addObject:](v56, "addObject:", v38);
            -[NSMutableDictionary setObject:forKey:](v34, "setObject:forKey:", v56, v54);
          }

          v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v94, "objectForKey:", v54));
          if (!v57)
            -[NSMutableDictionary setObject:forKey:](v94, "setObject:forKey:", v44, v54);
        }

        if ((id)++v37 == v93)
        {
          v93 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v103, v112, 16);
          if (!v93)
          {
LABEL_41:

            v58 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v34, "allKeys"));
            v59 = objc_msgSend(v58, "count");

            if (v59)
            {
              v97 = 0u;
              v98 = 0u;
              v95 = 0u;
              v96 = 0u;
              v60 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v34, "allKeys"));
              v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v95, v110, 16);
              if (v61)
              {
                v62 = v61;
                v63 = *(_QWORD *)v96;
                do
                {
                  for (i = 0; i != v62; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v96 != v63)
                      objc_enumerationMutation(v60);
                    v65 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)i);
                    v66 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v34, "objectForKeyedSubscript:", v65));
                    v67 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v94, "objectForKeyedSubscript:", v65));
                    if ((unint64_t)objc_msgSend(v66, "count") >= 2
                      && objc_msgSend(v67, "placeUserType") != (id)1
                      && objc_msgSend(v67, "placeUserType") != (id)2)
                    {
                      v68 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                      v69 = objc_claimAutoreleasedReturnValue(v68);
                      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
                      {
                        v70 = objc_msgSend(v66, "count");
                        *(_DWORD *)buf = 134218242;
                        v114 = v70;
                        v115 = 2112;
                        v116 = v87;
                        _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_INFO, "Summarization: Found %lu bundles containing phone walks with the same place for %@", buf, 0x16u);
                      }

                      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "createMotionActivityMegaBundleFromBundles:withSamePlace:withParameters:", v66, v67, v89));
                      if (v71)
                      {
                        v72 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                        v73 = objc_claimAutoreleasedReturnValue(v72);
                        if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 138412290;
                          v114 = v71;
                          _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_INFO, "Summarization: Created phone walk mega bundle, %@", buf, 0xCu);
                        }

                        -[NSMutableArray addObject:](v88, "addObject:", v71);
                      }

                    }
                    v34 = v92;
                  }
                  v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v95, v110, 16);
                }
                while (v62);
              }

            }
            v7 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
            v15 = v82;
            v12 = v83;
            v24 = v81;
            v33 = v84;
            goto LABEL_61;
          }
          goto LABEL_11;
        }
      }

LABEL_18:
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "places"));

      if (v45)
      {
        v101 = 0u;
        v102 = 0u;
        v99 = 0u;
        v100 = 0u;
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "places"));
        v44 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v99, v111, 16);
        if (v44)
        {
          v47 = a1;
          v48 = *(_QWORD *)v100;
          while (2)
          {
            for (j = 0; j != v44; j = (char *)j + 1)
            {
              if (*(_QWORD *)v100 != v48)
                objc_enumerationMutation(v46);
              v50 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * (_QWORD)j);
              v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "placeName"));
              if (v51)
              {
                v52 = (void *)v51;
                v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "startDate"));

                if (v53)
                {
                  v44 = v50;
                  goto LABEL_31;
                }
              }
            }
            v44 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v99, v111, 16);
            if (v44)
              continue;
            break;
          }
LABEL_31:
          a1 = v47;
          v35 = v91;
          v34 = v92;
          v36 = v90;
        }

      }
      else
      {
        v44 = 0;
      }
      goto LABEL_33;
    }
LABEL_62:

    v8 = v78;
    v6 = v79;
    v10 = v76;
    v9 = v77;
  }

  return v88;
}

uint64_t __91__MOSummarizationUtilities_summarizeMotionActivityBundlesWithSamePlaceName_withParameters___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
  v5 = objc_msgSend(v4, "isOnOrAfter:", *(_QWORD *)(a1 + 32));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
  v7 = v5 & objc_msgSend(v6, "isBeforeDate:", *(_QWORD *)(a1 + 40));

  return v7;
}

+ (id)concatenatePlaceNameAndPlaceStart:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = a3;
  v4 = v3;
  if (v3 && (v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "placeName"))) != 0)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));

    if (v7)
    {
      v8 = objc_opt_new(NSMutableArray);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placeName"));
      -[NSMutableArray addObject:](v8, "addObject:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
      objc_msgSend(v10, "timeIntervalSinceReferenceDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f"), v11));
      -[NSMutableArray addObject:](v8, "addObject:", v12);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v8, "componentsJoinedByString:", CFSTR(":")));
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)createMotionActivityMegaBundleFromBundles:(id)a3 withSamePlace:(id)a4 withParameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  MOEventBundle *v11;
  NSMutableArray *v12;
  NSMutableArray *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  void *v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  void *v31;
  unsigned __int8 v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned __int8 v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  void *j;
  void *v44;
  void *v45;
  unsigned __int8 v46;
  void *v47;
  void *v48;
  void *v49;
  NSMutableArray *v50;
  unint64_t v51;
  MOEventBundle *v52;
  unint64_t v53;
  NSMutableArray *v54;
  void *v55;
  void *v56;
  unsigned int v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  float v62;
  MOEventBundle *v63;
  void *v64;
  void *v65;
  MOEventBundle *v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  NSMutableArray *v71;
  void *v72;
  void *v73;
  id v74;
  BOOL v75;
  id v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  float v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  NSMutableDictionary *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  MOEventBundle *v107;
  MOResource *v108;
  void *v109;
  void *v110;
  id os_log;
  NSObject *v112;
  void *v113;
  void *v114;
  id v115;
  id v116;
  id v117;
  uint64_t v118;
  double v119;
  void *k;
  void *v121;
  id v122;
  id v123;
  id v124;
  uint64_t v125;
  void *m;
  NSMutableArray *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  NSMutableArray *v133;
  id v134;
  void *v135;
  id v136;
  id v137;
  id v138;
  void *v139;
  void *v140;
  id v141;
  NSMutableArray *v142;
  id obj;
  uint64_t v144;
  void *v145;
  NSMutableArray *v146;
  NSMutableArray *v147;
  NSMutableArray *v148;
  id v149;
  NSMutableDictionary *v150;
  void *v151;
  MOEventBundle *v152;
  uint64_t v153;
  void *v154;
  NSMutableArray *v155;
  NSMutableArray *v156;
  NSMutableArray *v157;
  NSMutableArray *v158;
  NSMutableArray *v159;
  NSMutableArray *v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  uint8_t buf[16];
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  _BYTE v182[128];
  _BYTE v183[128];
  id v184;
  id v185;
  _BYTE v186[128];
  _BYTE v187[128];
  _BYTE v188[128];
  id v189;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((unint64_t)objc_msgSend(v8, "count") >= 2)
  {
    v134 = a1;
    v139 = v9;
    v140 = v10;
    v148 = objc_opt_new(NSMutableArray);
    v147 = objc_opt_new(NSMutableArray);
    v12 = objc_opt_new(NSMutableArray);
    v158 = objc_opt_new(NSMutableArray);
    v157 = objc_opt_new(NSMutableArray);
    v156 = objc_opt_new(NSMutableArray);
    v155 = objc_opt_new(NSMutableArray);
    v160 = objc_opt_new(NSMutableArray);
    v142 = objc_opt_new(NSMutableArray);
    v13 = objc_opt_new(NSMutableArray);
    v159 = objc_opt_new(NSMutableArray);
    v146 = objc_opt_new(NSMutableArray);
    v141 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
    v138 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("priorityScore"), 1);
    v137 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
    v189 = v137;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v189, 1));
    v136 = v8;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sortedArrayUsingDescriptors:", v14));

    v180 = 0u;
    v181 = 0u;
    v178 = 0u;
    v179 = 0u;
    obj = v15;
    v149 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v178, v188, 16);
    if (v149)
    {
      v144 = *(_QWORD *)v179;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v179 != v144)
            objc_enumerationMutation(obj);
          v153 = v16;
          v17 = *(void **)(*((_QWORD *)&v178 + 1) + 8 * v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bundleIdentifier"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "UUIDString"));
          -[NSMutableArray addObject:](v148, "addObject:", v19);

          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "suggestionID"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "UUIDString"));
          -[NSMutableArray addObject:](v147, "addObject:", v21);

          v176 = 0u;
          v177 = 0u;
          v174 = 0u;
          v175 = 0u;
          v151 = v17;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "events"));
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v174, v187, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v175;
            do
            {
              for (i = 0; i != v24; i = (char *)i + 1)
              {
                if (*(_QWORD *)v175 != v25)
                  objc_enumerationMutation(v22);
                v27 = *(void **)(*((_QWORD *)&v174 + 1) + 8 * (_QWORD)i);
                v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "eventIdentifier"));
                v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "UUIDString"));
                v30 = -[NSMutableArray containsObject:](v12, "containsObject:", v29);

                if ((v30 & 1) == 0)
                {
                  if (objc_msgSend(v27, "category") == (id)16 && objc_msgSend(v27, "provider") != (id)5)
                    -[NSMutableArray addObject:](v158, "addObject:", v27);
                  if (objc_msgSend(v27, "category") == (id)1 && objc_msgSend(v27, "provider") != (id)5)
                    -[NSMutableArray addObject:](v157, "addObject:", v27);
                  if (objc_msgSend(v27, "category") == (id)6 && objc_msgSend(v27, "provider") != (id)5)
                    -[NSMutableArray addObject:](v156, "addObject:", v27);
                  if (objc_msgSend(v27, "category") == (id)24 && objc_msgSend(v27, "provider") != (id)5)
                  {
                    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifierFromProvider"));
                    v32 = -[NSMutableArray containsObject:](v159, "containsObject:", v31);

                    if ((v32 & 1) == 0)
                    {
                      -[NSMutableArray addObject:](v155, "addObject:", v27);
                      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifierFromProvider"));
                      -[NSMutableArray addObject:](v159, "addObject:", v33);

                    }
                  }
                  if (objc_msgSend(v27, "provider") == (id)5)
                    -[NSMutableArray addObject:](v160, "addObject:", v27);
                }
                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "eventIdentifier"));
                v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "UUIDString"));
                v36 = -[NSMutableArray containsObject:](v12, "containsObject:", v35);

                if ((v36 & 1) == 0)
                {
                  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "eventIdentifier"));
                  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "UUIDString"));
                  -[NSMutableArray addObject:](v12, "addObject:", v38);

                }
              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v174, v187, 16);
            }
            while (v24);
          }

          v172 = 0u;
          v173 = 0u;
          v170 = 0u;
          v171 = 0u;
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "resources"));
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v170, v186, 16);
          if (v40)
          {
            v41 = v40;
            v42 = *(_QWORD *)v171;
            do
            {
              for (j = 0; j != v41; j = (char *)j + 1)
              {
                if (*(_QWORD *)v171 != v42)
                  objc_enumerationMutation(v39);
                v44 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * (_QWORD)j);
                if (objc_msgSend(v44, "type") == (id)2)
                {
                  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "assets"));
                  v46 = -[NSMutableArray containsObject:](v13, "containsObject:", v45);

                  if ((v46 & 1) == 0)
                  {
                    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "assets"));
                    -[NSMutableArray addObject:](v13, "addObject:", v47);

                    -[NSMutableArray addObject:](v146, "addObject:", v44);
                  }
                }
              }
              v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v170, v186, 16);
            }
            while (v41);
          }

          v16 = v153 + 1;
        }
        while ((id)(v153 + 1) != v149);
        v149 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v178, v188, 16);
      }
      while (v149);
    }

    v185 = v141;
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v185, 1));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingDescriptors:](v158, "sortedArrayUsingDescriptors:", v48));

    -[NSMutableArray addObjectsFromArray:](v142, "addObjectsFromArray:", v49);
    if (-[NSMutableArray count](v157, "count"))
      -[NSMutableArray addObjectsFromArray:](v142, "addObjectsFromArray:", v157);
    v50 = v160;
    v10 = v140;
    if (-[NSMutableArray count](v160, "count"))
      -[NSMutableArray addObjectsFromArray:](v142, "addObjectsFromArray:", v160);
    v154 = v49;
    if ((unint64_t)objc_msgSend(v49, "count") >= 2)
    {
      v51 = 1;
      while (1)
      {
        v52 = (MOEventBundle *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectAtIndex:", v51));
        v53 = v51 - 1;
        v54 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectAtIndex:", v53));
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v52, "startDate"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray endDate](v54, "endDate"));
        v57 = objc_msgSend(v55, "isAfterDate:", v56);

        if (v57)
        {
          v58 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v52, "startDate"));
          v59 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray endDate](v54, "endDate"));
          objc_msgSend(v58, "timeIntervalSinceDate:", v59);
          v61 = v60;

          objc_msgSend(v140, "motionActivityWalkBundlesMaximumDurationBetweenWalksAtSamePlace");
          if (v61 > v62)
            break;
        }

        v49 = v154;
        v51 = v53 + 2;
        if ((unint64_t)objc_msgSend(v154, "count") <= v51)
          goto LABEL_54;
      }
      v152 = v52;
      v11 = 0;
      v9 = v139;
      v88 = v154;
      v8 = v136;
      goto LABEL_92;
    }
LABEL_54:
    v63 = [MOEventBundle alloc];
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v66 = -[MOEventBundle initWithBundleIdentifier:creationDate:](v63, "initWithBundleIdentifier:creationDate:", v64, v65);

    -[MOEventBundle setInterfaceType:](v66, "setInterfaceType:", 1);
    -[MOEventBundle setBundleSuperType:](v66, "setBundleSuperType:", 2);
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "firstObject"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "motionActivityEvent"));
    v69 = objc_msgSend(v68, "motionType");

    if (v69 == (id)2)
    {
      v70 = 204;
      v71 = v155;
    }
    else
    {
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "firstObject"));
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "motionActivityEvent"));
      v74 = objc_msgSend(v73, "motionType");

      v75 = v74 == (id)3;
      v71 = v155;
      if (!v75)
        goto LABEL_60;
      v70 = 207;
    }
    -[MOEventBundle setBundleSubType:](v66, "setBundleSubType:", v70);
LABEL_60:
    v76 = -[NSMutableArray copy](v148, "copy");
    -[MOEventBundle setSubBundleIDs:](v66, "setSubBundleIDs:", v76);

    v77 = -[NSMutableArray copy](v147, "copy");
    -[MOEventBundle setSubSuggestionIDs:](v66, "setSubSuggestionIDs:", v77);

    -[MOEventBundle setEvents:](v66, "setEvents:", v142);
    -[MOEventBundle setPropertiesBasedOnEvents](v66, "setPropertiesBasedOnEvents");
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "startDate"));
    -[MOEventBundle setStartDate:](v66, "setStartDate:", v79);

    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "lastObject"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "endDate"));
    -[MOEventBundle setEndDate:](v66, "setEndDate:", v81);

    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "lastObject"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "expirationDate"));
    -[MOEventBundle setExpirationDate:](v66, "setExpirationDate:", v83);

    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "time"));
    -[MOEventBundle setTime:](v66, "setTime:", v85);

    v86 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities setActionForActivityBundle:](MOContextAnnotationUtilities, "setActionForActivityBundle:", v154));
    -[MOEventBundle setAction:](v66, "setAction:", v86);

    if (-[NSMutableArray count](v156, "count"))
    {
      v87 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities annotateEventBundle:playbackMediaEvents:](MOContextAnnotationUtilities, "annotateEventBundle:playbackMediaEvents:", v66, v156));
      -[NSMutableArray addObjectsFromArray:](v142, "addObjectsFromArray:", v87);
      -[MOEventBundle setEvents:](v66, "setEvents:", v142);

    }
    v152 = v66;
    v9 = v139;
    if (-[NSMutableArray count](v71, "count"))
    {
      -[NSMutableArray addObjectsFromArray:](v142, "addObjectsFromArray:", v71);
      -[MOEventBundle setEvents:](v66, "setEvents:", v142);
      +[MOContextAnnotationUtilities addStateOfMindResourceForBundle:withEmotionEvents:](MOContextAnnotationUtilities, "addStateOfMindResourceForBundle:withEmotionEvents:", v66, v71);
      +[MOContextAnnotationUtilities addStateOfMindMetaDataForRankForBundle:withEmotionEvents:](MOContextAnnotationUtilities, "addStateOfMindMetaDataForRankForBundle:withEmotionEvents:", v66, v71);
    }
    v54 = objc_opt_new(NSMutableArray);
    objc_msgSend(v139, "setPriorityScore:", 20000.0);
    -[NSMutableArray addObject:](v54, "addObject:", v139);
    v88 = v154;
    v89 = objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities locationsFromMotionEvents:](MOContextAnnotationUtilities, "locationsFromMotionEvents:", v154));
    objc_msgSend(v140, "motionActivityWalkBundlesMinimumRangeOfLocationForWalkAreaMap");
    v145 = (void *)v89;
    v91 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities placeFromRoutes:referencePointRatio:minimumRangeOfLocation:](MOContextAnnotationUtilities, "placeFromRoutes:referencePointRatio:minimumRangeOfLocation:", v89, 1.5, v90));
    if (v91)
    {
      v92 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v142, "firstObject"));
      v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "eventIdentifier"));
      objc_msgSend(v91, "setSourceEventIdentifier:", v93);

      objc_msgSend(v91, "setPriorityScore:", 200.0);
      -[MOEventBundle setPlace:](v152, "setPlace:", v91);
      -[NSMutableArray addObject:](v54, "addObject:", v91);
      -[MOEventBundle setPlaces:](v152, "setPlaces:", v54);
      v94 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v152, "resources"));
      if (v94)
      {
        v95 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v152, "resources"));
        v128 = (NSMutableArray *)objc_msgSend(v95, "mutableCopy");

      }
      else
      {
        v128 = objc_opt_new(NSMutableArray);
      }

      v97 = objc_opt_new(NSMutableDictionary);
      v98 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v152, "startDate"));
      objc_msgSend(v98, "timeIntervalSince1970");
      v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[NSMutableDictionary setObject:forKey:](v97, "setObject:forKey:", v99, CFSTR("MOActivityMetaDataKeyStartDate"));

      v100 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](v152, "endDate"));
      objc_msgSend(v100, "timeIntervalSince1970");
      v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      v150 = v97;
      -[NSMutableDictionary setObject:forKey:](v97, "setObject:forKey:", v101, CFSTR("MOActivityMetaDataKeyEndDate"));

      v102 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v152, "action"));
      v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "actionMetaData"));

      v104 = objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("ActivityActionMetaDataValue")));
      v132 = v103;
      v105 = objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("ActivityActionMetaDataUnit")));
      v106 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v152, "action"));
      v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "actionName"));

      v107 = v152;
      if (v104 && v105)
      {
        -[NSMutableDictionary setObject:forKey:](v150, "setObject:forKey:", v104, CFSTR("MOActivityMetaDataKeyStepCount"));
        -[NSMutableDictionary setObject:forKey:](v150, "setObject:forKey:", v105, CFSTR("MOActivityMetaDataKeyUnit"));
      }
      v131 = (void *)v104;
      -[NSMutableDictionary setObject:forKey:](v150, "setObject:forKey:", v135, CFSTR("MOActivityMetaDataMotionType"), v128);
      v108 = -[MOResource initWithName:type:dict:value:]([MOResource alloc], "initWithName:type:dict:value:", CFSTR("MotionActivity"), 13, v150, 0.0);
      v109 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v142, "firstObject"));
      v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "eventIdentifier"));
      -[MOResource setSourceEventIdentifier:](v108, "setSourceEventIdentifier:", v110);

      -[MOResource setPriorityScore:](v108, "setPriorityScore:", 100.0);
      os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      v112 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_INFO, "Summarization: Primary MOResource created for phone walk bundle", buf, 2u);
      }
      v133 = v54;

      objc_msgSend(v129, "addObject:", v108);
      if (-[NSMutableArray count](v146, "count"))
      {
        v184 = v138;
        v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v184, 1));
        v114 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingDescriptors:](v146, "sortedArrayUsingDescriptors:", v113));

        v167 = 0u;
        v168 = 0u;
        v165 = 0u;
        v166 = 0u;
        v115 = v114;
        v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v165, v183, 16);
        if (v116)
        {
          v117 = v116;
          v118 = *(_QWORD *)v166;
          v119 = 202.0;
          do
          {
            for (k = 0; k != v117; k = (char *)k + 1)
            {
              if (*(_QWORD *)v166 != v118)
                objc_enumerationMutation(v115);
              objc_msgSend(*(id *)(*((_QWORD *)&v165 + 1) + 8 * (_QWORD)k), "setPriorityScore:", v119);
              v119 = v119 + 1.0;
            }
            v117 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v165, v183, 16);
          }
          while (v117);
        }

        v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "firstObject"));
        objc_msgSend(v121, "setPriorityScore:", 99.0);

        objc_msgSend(v129, "addObjectsFromArray:", v115);
        v107 = v152;
      }
      v130 = (void *)v105;
      -[MOEventBundle setResources:](v107, "setResources:", v129);
      objc_msgSend(v134, "updateRankMetaDataFrom:forSummaryBundle:", obj, v107);
      v163 = 0u;
      v164 = 0u;
      v161 = 0u;
      v162 = 0u;
      v122 = obj;
      v123 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v161, v182, 16);
      v88 = v154;
      if (v123)
      {
        v124 = v123;
        v125 = *(_QWORD *)v162;
        do
        {
          for (m = 0; m != v124; m = (char *)m + 1)
          {
            if (*(_QWORD *)v162 != v125)
              objc_enumerationMutation(v122);
            objc_msgSend(*(id *)(*((_QWORD *)&v161 + 1) + 8 * (_QWORD)m), "setIsAggregatedAndSuppressed:", 1);
          }
          v124 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v161, v182, 16);
        }
        while (v124);
      }
      v96 = v91;

      v11 = v152;
      v8 = v136;
      v9 = v139;
      v10 = v140;
      v50 = v160;
      v54 = v133;
    }
    else
    {
      v96 = 0;
      v11 = 0;
      v50 = v160;
      v8 = v136;
    }

LABEL_92:
    goto LABEL_93;
  }
  v11 = 0;
LABEL_93:

  return v11;
}

+ (void)combinePhotoResources:(void *)a1 .cold.1(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "assets"));
  objc_msgSend(a1, "priorityScore");
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v3, v4, "secondary photo asset, %@, priority score, %f", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2_0();
}

+ (void)updateRankMetaDataFrom:(_BYTE *)a1 forSummaryBundle:(_BYTE *)a2 .cold.1(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_3(a1, a2);
  OUTLINED_FUNCTION_6_2((void *)&_mh_execute_header, v2, v3, "Summary bundle familiarity index is -1", v4);
}

+ (void)getWorkoutActionsByActionSubtypeFromBundles:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_msgSend((id)OUTLINED_FUNCTION_4_0(a1, a2), "workoutType");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  *v3 = 138412290;
  *v2 = v5;
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v6, v7, "getWorkoutActionsByActionSubtypeFromBundles: input action, %@");

  OUTLINED_FUNCTION_7_1();
}

+ (void)getActionsFromBundles:(uint64_t)a3 withDominantAction:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_4_4((void *)&_mh_execute_header, a1, a3, "No bundle for getting actions", v3);
}

+ (void)getActionsFromBundles:(_BYTE *)a1 withDominantAction:(_BYTE *)a2 .cold.2(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_2_3(a1, a2);
  OUTLINED_FUNCTION_4_4((void *)&_mh_execute_header, v2, (uint64_t)v2, "skip vist action when adding to actions to bundle with workout as dominant action", v3);
}

+ (void)getActionsFromBundles:(uint64_t)a1 withDominantAction:(uint64_t)a2 .cold.3(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_msgSend((id)OUTLINED_FUNCTION_4_0(a1, a2), "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  *v3 = 138412290;
  *v2 = v5;
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v6, v7, "The action, %@, added");

  OUTLINED_FUNCTION_7_1();
}

+ (void)getActionsFromBundles:(_BYTE *)a1 withDominantAction:(_BYTE *)a2 .cold.5(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_2_3(a1, a2);
  OUTLINED_FUNCTION_4_4((void *)&_mh_execute_header, v2, (uint64_t)v2, "skip dominant action whenwe already added it to actions", v3);
}

+ (void)getActionsFromBundles:(uint64_t)a1 withDominantAction:(void *)a2 .cold.6(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "firstObject"));
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v2, v3, "The dominant action added for visit, %@, added, %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_0();
}

+ (void)isOutingBundleInsideOneDay:(char)a1 .cold.1(char a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "SummarizationUtilities: outing bundle is inside one day: %d", (uint8_t *)v2, 8u);
}

@end
