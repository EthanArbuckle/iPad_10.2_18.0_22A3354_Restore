@implementation MODominantBundleCreationManager

- (MODominantBundleCreationManager)initWithUniverse:(id)a3
{
  id v5;
  MODominantBundleCreationManager *v6;
  MODominantBundleCreationManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MODominantBundleCreationManager;
  v6 = -[MODominantBundleCreationManager init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_fUniverse, a3);

  return v7;
}

- (void)processBundlesForCreatingDominantBundles:(id)a3 withParameters:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id os_log;
  NSObject *v14;
  _BOOL4 v15;
  id v16;
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
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  MODominantBundleCreationManager *v48;
  void *context;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  uint8_t buf[4];
  id v58;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_autoreleasePoolPush();
  v12 = objc_msgSend(v8, "count");
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v14 = objc_claimAutoreleasedReturnValue(os_log);
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (v12)
  {
    v48 = self;
    context = v11;
    v50 = v10;
    if (v15)
    {
      *(_DWORD *)buf = 134217984;
      v58 = objc_msgSend(v8, "count");
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "DominantBundleCreation: input eventBundles count, %lu", buf, 0xCu);
    }

    v16 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("interfaceType"), 2));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:"));
    v56 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v56, 1));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sortedArrayUsingDescriptors:", v18));

    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("interfaceType"), 1));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:"));
    v55 = v16;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v55, 1));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "sortedArrayUsingDescriptors:", v21));

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("interfaceType"), 7));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:"));
    v54 = v16;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v54, 1));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sortedArrayUsingDescriptors:", v23));

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("interfaceType"), 4));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:"));
    v53 = v16;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v53, 1));
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "sortedArrayUsingDescriptors:", v26));

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &__block_literal_global_2));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:"));
    v46 = (void *)v19;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MODominantBundleCreationManager _dominantBundleCreatedFromOutingBundles:activityBundles:parameters:](v48, "_dominantBundleCreatedFromOutingBundles:activityBundles:parameters:", v19, v39, v9));
    v41 = (void *)v27;
    -[MODominantBundleCreationManager _suppressDuplicateContactBundles:comparedWithContactTrendbundles:](v48, "_suppressDuplicateContactBundles:comparedWithContactTrendbundles:", v27, v28);
    v51 = v9;
    -[MODominantBundleCreationManager _suppressDuplicateHomeBundles:parameters:](v48, "_suppressDuplicateHomeBundles:parameters:", v24, v9);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = NO"), CFSTR("isAggregatedAndSuppressed")));
    v43 = v24;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "filteredArrayUsingPredicate:", v30));
    v52 = v16;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v52, 1));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "sortedArrayUsingDescriptors:", v32));

    -[MODominantBundleCreationManager _removeDuplicatePhotoResourceFromActivityBundles:compareWithHomeBundle:](v48, "_removeDuplicatePhotoResourceFromActivityBundles:compareWithHomeBundle:", v39, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v29));
    v35 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v37 = objc_msgSend(v34, "count");
      *(_DWORD *)buf = 134217984;
      v58 = v37;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "DominantBundleCreation: output eventBundles count, %lu", buf, 0xCu);
    }

    objc_autoreleasePoolPop(context);
    v38 = objc_autoreleasePoolPush();
    v10 = v50;
    (*((void (**)(id, void *, _QWORD))v50 + 2))(v50, v34, 0);
    objc_autoreleasePoolPop(v38);

    v9 = v51;
  }
  else
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "DominantBundleCreation: No eventBundle to be proccessed through dominantBundleCreation process", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
    objc_autoreleasePoolPop(v11);
  }

}

BOOL __99__MODominantBundleCreationManager_processBundlesForCreatingDominantBundles_withParameters_handler___block_invoke(id a1, MOEventBundle *a2, NSDictionary *a3)
{
  MOEventBundle *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  char v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a2;
  v4 = -[MOEventBundle interfaceType](v3, "interfaceType");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v3, "events", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (v11)
          v8 |= objc_msgSend(v11, "category") == (id)4;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return (v4 == (id)9) & v8;
}

- (id)_dominantBundleCreatedFromOutingBundles:(id)a3 activityBundles:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  void *v14;
  void *v15;
  id v16;
  unsigned int v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  double v25;
  double v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  double v31;
  double v32;
  float v33;
  float v34;
  unsigned int v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned int v45;
  uint64_t v46;
  id v47;
  NSObject *p_super;
  NSMutableArray *v49;
  char *v50;
  char *v51;
  MOGraph *v52;
  id os_log;
  NSObject *v54;
  id v55;
  NSMutableDictionary *v56;
  id v57;
  NSObject *v58;
  void *v59;
  uint64_t v60;
  unint64_t i;
  void *v62;
  void *v63;
  NSMutableSet *v64;
  void *v65;
  void *v66;
  id v67;
  NSObject *v68;
  unsigned int v69;
  void *v70;
  NSObject *v71;
  id v72;
  void *v73;
  uint64_t v74;
  void *v75;
  id v76;
  unsigned int v77;
  id v78;
  NSObject *v79;
  void *v80;
  uint64_t v81;
  objc_class *v82;
  NSString *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  uint64_t v89;
  void *j;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  NSObject *v95;
  id v96;
  NSObject *v97;
  id v98;
  MOGraph *v100;
  SEL v101;
  id v102;
  id v103;
  void *v104;
  NSMutableArray *v105;
  void *v106;
  unsigned int v108;
  void *v109;
  NSMutableDictionary *v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _BYTE v115[128];
  id v116;
  _QWORD v117[2];
  uint8_t buf[4];
  _BYTE v119[18];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count") && objc_msgSend(v9, "count"))
  {
    v101 = a2;
    v110 = objc_opt_new(NSMutableDictionary);
    v105 = objc_opt_new(NSMutableArray);
    v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("type == %lu"), 2));
    v103 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("priorityScore"), 1);
    v106 = v9;
    if (objc_msgSend(v8, "count"))
    {
      v11 = 0;
      v12 = 0;
      v13 = 0;
      while (1)
      {
        if ((unint64_t)objc_msgSend(v9, "count") <= v13)
          goto LABEL_29;
        v108 = v12;
        v14 = v8;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v11));
        v16 = v9;
        v17 = v13;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v13));
        +[MOSummarizationUtilities overlappingTimeIntervalBetween:andOtherBundle:](MOSummarizationUtilities, "overlappingTimeIntervalBetween:andOtherBundle:", v15, v18);
        v20 = v19;
        v21 = objc_alloc((Class)NSDateInterval);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "endDate"));
        v24 = objc_msgSend(v21, "initWithStartDate:endDate:", v22, v23);
        objc_msgSend(v24, "duration");
        v26 = v20 / v25;

        v27 = objc_alloc((Class)NSDateInterval);
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startDate"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "endDate"));
        v30 = objc_msgSend(v27, "initWithStartDate:endDate:", v28, v29);
        objc_msgSend(v30, "duration");
        v32 = v20 / v31;

        objc_msgSend(v10, "dominantBundle_overlappingThreshold");
        if (v26 > v33 || (objc_msgSend(v10, "dominantBundle_overlappingThreshold"), v32 > v34))
        {
          if (!+[MOSummarizationUtilities isOutingBundleFromHomeOrWorkVisit:](MOSummarizationUtilities, "isOutingBundleFromHomeOrWorkVisit:", v15)&& -[MODominantBundleCreationManager _locationCheckForMergingOutingBundle:activityBundle:](self, "_locationCheckForMergingOutingBundle:activityBundle:", v15, v18)&& +[MOSummarizationUtilities isOutingBundleInsideOneDay:](MOSummarizationUtilities, "isOutingBundleInsideOneDay:", v15)&& objc_msgSend(v18, "bundleSubType") != (id)204&& objc_msgSend(v18, "bundleSubType") != (id)207&& objc_msgSend(v18, "bundleSubType") != (id)208&& !+[MOSummarizationUtilities isFlightBundle:](MOSummarizationUtilities, "isFlightBundle:", v15))
          {
            break;
          }
        }
        v35 = v17;
        v8 = v14;
        if (v26 <= 0.0 && v32 <= 0.0)
          goto LABEL_23;
        +[MOSummarizationUtilities removeDuplicatePhotoResourceFromBundle:comparedWithPrimaryBundle:](MOSummarizationUtilities, "removeDuplicatePhotoResourceFromBundle:comparedWithPrimaryBundle:", v18, v15);
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "action"));
        if (objc_msgSend(v36, "actionSubtype") != (id)2)
          goto LABEL_22;
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "resources"));
        v38 = objc_msgSend(v37, "count");

        v16 = v106;
        if (v38)
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "resources"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "filteredArrayUsingPredicate:", v104));

          if (objc_msgSend(v36, "count"))
          {
            v116 = v103;
            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v116, 1));
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "sortedArrayUsingDescriptors:", v40));

            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "firstObject"));
            objc_msgSend(v42, "setPriorityScore:", 99.0);
            goto LABEL_21;
          }
          goto LABEL_22;
        }
LABEL_23:
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "endDate"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "endDate"));
        v45 = objc_msgSend(v43, "isOnOrAfter:", v44);

        v13 = v35 + v45;
        v12 = v108 + (v45 ^ 1);
        v11 = v12;
        v9 = v16;
        if ((unint64_t)objc_msgSend(v8, "count") <= v12)
          goto LABEL_29;
      }
      v35 = v17;
      v8 = v14;
      v46 = v35 + objc_msgSend(v14, "count");
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v108));
      v117[0] = v36;
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v46));
      v117[1] = v41;
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v117, 2));
      -[NSMutableArray addObject:](v105, "addObject:", v42);
LABEL_21:

LABEL_22:
      v16 = v106;
      goto LABEL_23;
    }
LABEL_29:
    v50 = (char *)objc_msgSend(v8, "count");
    v51 = &v50[(_QWORD)objc_msgSend(v9, "count")];
    v52 = -[MOGraph initWithNumVertices:edges:]([MOGraph alloc], "initWithNumVertices:edges:", v51, v105);
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v54 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      v55 = -[NSMutableArray count](v105, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v119 = v55;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "DominantBundleCreation: correlation graph is built with number of edges, %lu", buf, 0xCu);
    }

    v100 = v52;
    v109 = (void *)objc_claimAutoreleasedReturnValue(-[MOGraph calculateConnectedComponentWithGraphTraversal:](v52, "calculateConnectedComponentWithGraphTraversal:", 1));
    v56 = v110;
    if (objc_msgSend(v109, "count") != v51)
    {
      v57 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      v58 = objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        -[MODominantBundleCreationManager _dominantBundleCreatedFromOutingBundles:activityBundles:parameters:].cold.2(v58);

      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", v101, self, CFSTR("MODominantBundleCreationManager.m"), 187, CFSTR("DominantBundleCreation: the event bundles and membership arrays have to be of the same size. (in %s:%d)"), "-[MODominantBundleCreationManager _dominantBundleCreatedFromOutingBundles:activityBundles:parameters:]", 187);

    }
    if (v51)
    {
      v60 = 0;
      for (i = 0; (char *)i != v51; ++i)
      {
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "objectAtIndexedSubscript:", i));
        v63 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v56, "objectForKey:", v62));

        if (!v63)
        {
          v64 = objc_opt_new(NSMutableSet);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v64, v62);

        }
        if ((unint64_t)objc_msgSend(v8, "count") <= i)
        {
          v72 = objc_msgSend(v8, "count");
          v73 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v56, "objectForKeyedSubscript:", v62));
          v74 = (v60 - ((_QWORD)v72 << 32)) >> 32;
          v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectAtIndexedSubscript:", v74));
          objc_msgSend(v73, "addObject:", v75);

          v76 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          v68 = objc_claimAutoreleasedReturnValue(v76);
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
          {
            v77 = objc_msgSend(v62, "intValue");
            v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectAtIndexedSubscript:", v74));
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v119 = v77;
            *(_WORD *)&v119[4] = 2112;
            *(_QWORD *)&v119[6] = v70;
            v71 = v68;
            goto LABEL_46;
          }
        }
        else
        {
          v65 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v56, "objectForKeyedSubscript:", v62));
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", i));
          objc_msgSend(v65, "addObject:", v66);

          v67 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          v68 = objc_claimAutoreleasedReturnValue(v67);
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
          {
            v69 = objc_msgSend(v62, "intValue");
            v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", i));
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v119 = v69;
            *(_WORD *)&v119[4] = 2112;
            *(_QWORD *)&v119[6] = v70;
            v71 = v68;
LABEL_46:
            _os_log_debug_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEBUG, "DominantBundleCreation:group %d, bundle-> %@", buf, 0x12u);

          }
        }

        v60 += (uint64_t)&_mh_execute_header;
        v56 = v110;
      }
    }
    v102 = v8;
    v78 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v79 = objc_claimAutoreleasedReturnValue(v78);
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
      -[MODominantBundleCreationManager _dominantBundleCreatedFromOutingBundles:activityBundles:parameters:].cold.1(v109, v79);

    v80 = (void *)objc_claimAutoreleasedReturnValue(-[MODominantBundleCreationManager fUniverse](self, "fUniverse"));
    v82 = (objc_class *)objc_opt_class(MOTimeZoneManager, v81);
    v83 = NSStringFromClass(v82);
    v84 = (void *)objc_claimAutoreleasedReturnValue(v83);
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "getService:", v84));

    v49 = objc_opt_new(NSMutableArray);
    v111 = 0u;
    v112 = 0u;
    v113 = 0u;
    v114 = 0u;
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v110, "allValues"));
    v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v111, v115, 16);
    if (v87)
    {
      v88 = v87;
      v89 = *(_QWORD *)v112;
      do
      {
        for (j = 0; j != v88; j = (char *)j + 1)
        {
          if (*(_QWORD *)v112 != v89)
            objc_enumerationMutation(v86);
          v91 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * (_QWORD)j);
          if ((unint64_t)objc_msgSend(v91, "count") >= 2)
          {
            v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "allObjects"));
            v93 = (void *)objc_claimAutoreleasedReturnValue(+[MOSummarizationUtilities createDominantBundleFromBundles:withParameters:timeZoneManager:](MOSummarizationUtilities, "createDominantBundleFromBundles:withParameters:timeZoneManager:", v92, v10, v85));

            if (v93)
              -[NSMutableArray addObject:](v49, "addObject:", v93);
            v94 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            v95 = objc_claimAutoreleasedReturnValue(v94);
            if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v119 = v93;
              _os_log_debug_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEBUG, "DominantBundleCreation:dominant bundle %@", buf, 0xCu);
            }

          }
        }
        v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v111, v115, 16);
      }
      while (v88);
    }

    v96 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v97 = objc_claimAutoreleasedReturnValue(v96);
    if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
    {
      v98 = -[NSMutableArray count](v49, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v119 = v98;
      _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_INFO, "DominantBundleCreation: newly created dominant bundles count: %lu", buf, 0xCu);
    }

    v8 = v102;
    v9 = v106;
    p_super = &v110->super.super;
  }
  else
  {
    v47 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    p_super = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v119 = objc_msgSend(v8, "count");
      *(_WORD *)&v119[8] = 2048;
      *(_QWORD *)&v119[10] = objc_msgSend(v9, "count");
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_INFO, "DominantBundleCreation: no dominant bundle is created since outing or activit bundles count is 0, outing bundles count: %lu, activity bundles count: %lu", buf, 0x16u);
    }
    v49 = 0;
  }

  return v49;
}

- (void)_removeDuplicatePhotoResourceFromActivityBundles:(id)a3 compareWithHomeBundle:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  NSObject *v23;
  id os_log;
  id v25;
  uint64_t v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count") && objc_msgSend(v6, "count"))
  {
    v26 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("type == %lu"), 2));
    v25 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("priorityScore"), 1);
    if (objc_msgSend(v6, "count"))
    {
      v7 = 0;
      v8 = 0;
      v9 = 0;
      while (1)
      {
        if ((unint64_t)objc_msgSend(v5, "count") <= v9)
          goto LABEL_13;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v7));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v9));
        +[MOSummarizationUtilities overlappingTimeIntervalBetween:andOtherBundle:](MOSummarizationUtilities, "overlappingTimeIntervalBetween:andOtherBundle:", v10, v11);
        if (v12 > 0.0)
        {
          +[MOSummarizationUtilities removeDuplicatePhotoResourceFromBundle:comparedWithPrimaryBundle:](MOSummarizationUtilities, "removeDuplicatePhotoResourceFromBundle:comparedWithPrimaryBundle:", v11, v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "action"));
          if (objc_msgSend(v13, "actionSubtype") != (id)2)
            goto LABEL_11;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "resources"));
          v15 = objc_msgSend(v14, "count");

          if (v15)
            break;
        }
LABEL_12:
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "endDate"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "endDate"));
        v22 = objc_msgSend(v20, "isOnOrAfter:", v21);

        v9 += v22;
        v8 += v22 ^ 1;
        v7 = v8;
        if ((unint64_t)objc_msgSend(v6, "count") <= v8)
          goto LABEL_13;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "resources"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "filteredArrayUsingPredicate:", v26));

      if (objc_msgSend(v13, "count"))
      {
        v27 = v25;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sortedArrayUsingDescriptors:", v17));

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
        objc_msgSend(v19, "setPriorityScore:", 99.0);

      }
LABEL_11:

      goto LABEL_12;
    }
LABEL_13:

    v23 = v26;
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v23 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v29 = objc_msgSend(v6, "count");
      v30 = 2048;
      v31 = objc_msgSend(v5, "count");
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "DominantBundleCreation: no resource change needed for activity bundles compared to home bundles since home or activit bundles count is 0, home bundles count: %lu, activity bundles count: %lu", buf, 0x16u);
    }
  }

}

- (void)_suppressDuplicateContactBundles:(id)a3 comparedWithContactTrendbundles:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  unsigned int v27;
  id v28;
  NSObject *v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  id os_log;
  id v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count") && objc_msgSend(v6, "count"))
  {
    if (objc_msgSend(v5, "count"))
    {
      v7 = 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v34 = v5;
      v36 = v6;
      do
      {
        if ((unint64_t)objc_msgSend(v6, "count") <= v9)
          break;
        v11 = v9;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v7));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v9));
        +[MOSummarizationUtilities overlappingTimeIntervalBetween:andOtherBundle:](MOSummarizationUtilities, "overlappingTimeIntervalBetween:andOtherBundle:", v12, v13);
        if (v14 > 0.0)
        {
          v15 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 10));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "events"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "filteredArrayUsingPredicate:", v15));

          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "events"));
          v35 = (void *)v15;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "filteredArrayUsingPredicate:", v15));

          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v20 = v17;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v38;
            do
            {
              for (i = 0; i != v22; i = (char *)i + 1)
              {
                if (*(_QWORD *)v38 != v23)
                  objc_enumerationMutation(v20);
                if (objc_msgSend(v19, "containsObject:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i)))
                {
                  objc_msgSend(v12, "setIsAggregatedAndSuppressed:", 1);
                  ++v10;
                }
              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
            }
            while (v22);
          }

          v5 = v34;
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "endDate"));
        v27 = objc_msgSend(v25, "isOnOrAfter:", v26);

        v9 = v11 + (v27 ^ 1);
        v8 += v27;
        v7 = v8;
        v6 = v36;
      }
      while ((unint64_t)objc_msgSend(v5, "count") > v8);
    }
    else
    {
      v10 = 0;
    }
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v29 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v43) = v10;
      v30 = "DominantBundleCreation: duplicate contact bundle count: %d";
      v31 = v29;
      v32 = 8;
      goto LABEL_24;
    }
  }
  else
  {
    v28 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v43 = objc_msgSend(v5, "count");
      v44 = 2048;
      v45 = objc_msgSend(v6, "count");
      v30 = "DominantBundleCreation: no needed to remove duplicate contact bundle compared to contact trend bundles since"
            " contact or contact trend bundles count is 0, contact bundles count: %lu, contact trend bundles count: %lu";
      v31 = v29;
      v32 = 22;
LABEL_24:
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, v30, buf, v32);
    }
  }

}

- (void)_suppressDuplicateMediaBundles:(id)a3 comparedWithHomebundles:(id)a4 parameters:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  float v23;
  void *v24;
  void *v25;
  unsigned int v26;
  id v27;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  id os_log;
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;

  v7 = a3;
  v8 = a4;
  v33 = a5;
  if (objc_msgSend(v7, "count") && objc_msgSend(v8, "count"))
  {
    if (objc_msgSend(v7, "count"))
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      do
      {
        if ((unint64_t)objc_msgSend(v8, "count") <= v11)
          break;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v9));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v11));
        +[MOSummarizationUtilities overlappingTimeIntervalBetween:andOtherBundle:](MOSummarizationUtilities, "overlappingTimeIntervalBetween:andOtherBundle:", v13, v14);
        v16 = v15;
        v17 = objc_alloc((Class)NSDateInterval);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));
        v20 = objc_msgSend(v17, "initWithStartDate:endDate:", v18, v19);
        objc_msgSend(v20, "duration");
        v22 = v16 / v21;

        objc_msgSend(v33, "dominantBundle_suppressMediaBundleComparedWithHomeBundleThreshold");
        if (v22 > v23)
        {
          objc_msgSend(v13, "setIsAggregatedAndSuppressed:", 1);
          ++v12;
        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endDate"));
        v26 = objc_msgSend(v24, "isOnOrAfter:", v25);

        v11 += v26;
        v10 += v26 ^ 1;
        v9 = v10;
      }
      while ((unint64_t)objc_msgSend(v7, "count") > v10);
    }
    else
    {
      v12 = 0;
    }
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v28 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v35) = v12;
      v29 = "DominantBundleCreation: duplicate media bundle compared with home bundles count: %d";
      v30 = v28;
      v31 = 8;
      goto LABEL_15;
    }
  }
  else
  {
    v27 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v35 = objc_msgSend(v7, "count");
      v36 = 2048;
      v37 = objc_msgSend(v8, "count");
      v29 = "DominantBundleCreation: no needed to remove duplicate media compared to home bundles since media or home bun"
            "dles count is 0, media bundles count: %lu, home bundles count: %lu";
      v30 = v28;
      v31 = 22;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, v29, buf, v31);
    }
  }

}

- (void)_suppressDuplicateMediaBundles:(id)a3 comparedWithActivitybundles:(id)a4 parameters:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  float v23;
  void *v24;
  void *v25;
  unsigned int v26;
  id v27;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  id os_log;
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;

  v7 = a3;
  v8 = a4;
  v33 = a5;
  if (objc_msgSend(v7, "count") && objc_msgSend(v8, "count"))
  {
    if (objc_msgSend(v7, "count"))
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      do
      {
        if ((unint64_t)objc_msgSend(v8, "count") <= v11)
          break;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v9));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v11));
        +[MOSummarizationUtilities overlappingTimeIntervalBetween:andOtherBundle:](MOSummarizationUtilities, "overlappingTimeIntervalBetween:andOtherBundle:", v13, v14);
        v16 = v15;
        v17 = objc_alloc((Class)NSDateInterval);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));
        v20 = objc_msgSend(v17, "initWithStartDate:endDate:", v18, v19);
        objc_msgSend(v20, "duration");
        v22 = v16 / v21;

        objc_msgSend(v33, "dominantBundle_suppressMediaBundleComparedWithActivityBundleThreshold");
        if (v22 > v23)
        {
          objc_msgSend(v13, "setIsAggregatedAndSuppressed:", 1);
          ++v12;
        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endDate"));
        v26 = objc_msgSend(v24, "isOnOrAfter:", v25);

        v11 += v26;
        v10 += v26 ^ 1;
        v9 = v10;
      }
      while ((unint64_t)objc_msgSend(v7, "count") > v10);
    }
    else
    {
      v12 = 0;
    }
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v28 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v35) = v12;
      v29 = "DominantBundleCreation: duplicate media bundle compared with acitivity bundles count: %d";
      v30 = v28;
      v31 = 8;
      goto LABEL_15;
    }
  }
  else
  {
    v27 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v35 = objc_msgSend(v7, "count");
      v36 = 2048;
      v37 = objc_msgSend(v8, "count");
      v29 = "DominantBundleCreation: no needed to remove duplicate media compared to activity bundles since media or acti"
            "vity bundles count is 0, media bundles count: %lu, home bundles count: %lu";
      v30 = v28;
      v31 = 22;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, v29, buf, v31);
    }
  }

}

- (BOOL)_locationCheckForMergingOutingBundle:(id)a3 activityBundle:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  char v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id os_log;
  NSObject *v18;
  uint8_t v20[16];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v5 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "events"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    v10 = 1;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visitEventsRejectedByWatchLocation"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "eventIdentifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
        v16 = objc_msgSend(v13, "containsObject:", v15);

        if (v16)
        {
          os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          v18 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v20 = 0;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "DominantBundleCreation: outing bundle contains visits rejected by activity bundle with watch location", v20, 2u);
          }

          v10 = 0;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 1;
  }

  return v10 & 1;
}

- (void)_suppressDuplicateHomeBundles:(id)a3 parameters:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _UNKNOWN **v14;
  NSMutableArray *v15;
  void *v16;
  void *i;
  uint64_t v18;
  void *v19;
  void *v20;
  id os_log;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  int v26;
  int v27;
  uint64_t v28;
  void *j;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *n;
  void *v50;
  id v51;
  id v52;
  BOOL v53;
  int v54;
  void *k;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  int v64;
  uint64_t v65;
  void *m;
  void *v67;
  void *v68;
  id v69;
  NSObject *v70;
  id v71;
  NSObject *v72;
  id v73;
  id v74;
  id v75;
  NSObject *v76;
  id v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  NSMutableArray *obj;
  void *v84;
  NSObject *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  int v91;
  id v92;
  int v93;
  int v94;
  uint64_t v95;
  int v96;
  int v97;
  void *v98;
  void *v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _QWORD v116[4];
  NSObject *v117;
  uint64_t v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  uint8_t v126[128];
  uint8_t buf[4];
  _BYTE v128[18];
  _BYTE v129[128];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject components:fromDate:](v5, "components:fromDate:", 28, v7));

    objc_msgSend(v8, "setHour:", 3);
    v81 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject dateFromComponents:](v5, "dateFromComponents:", v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject components:fromDate:](v5, "components:fromDate:", 28, v11));

    objc_msgSend(v12, "setHour:", 3);
    v80 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject dateFromComponents:](v5, "dateFromComponents:", v12));
    v14 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
    v15 = objc_opt_new(NSMutableArray);
    -[NSMutableArray addObject:](v15, "addObject:", v9);
    if ((-[NSObject isDate:inSameDayAsDate:](v5, "isDate:inSameDayAsDate:", v9, v13) & 1) != 0
      || !objc_msgSend(v9, "isBeforeDate:", v13))
    {
      v16 = v9;
    }
    else
    {
      do
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateByAddingTimeInterval:", 86400.0));

        -[NSMutableArray addObject:](v15, "addObject:", v16);
        v9 = v16;
      }
      while ((objc_msgSend(v16, "isBeforeDate:", v13) & 1) != 0);
    }
    v79 = v16;
    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    obj = v15;
    v89 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v119, v129, 16);
    if (!v89)
    {
      v96 = 0;
      v93 = 0;
      goto LABEL_90;
    }
    v96 = 0;
    v93 = 0;
    v88 = *(_QWORD *)v120;
    v82 = v4;
    v84 = v13;
    v85 = v5;
    while (1)
    {
      for (i = 0; i != v89; i = (char *)i + 1)
      {
        if (*(_QWORD *)v120 != v88)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * (_QWORD)i);
        v116[0] = _NSConcreteStackBlock;
        v116[1] = 3221225472;
        v116[2] = __76__MODominantBundleCreationManager__suppressDuplicateHomeBundles_parameters___block_invoke;
        v116[3] = &unk_1002ADB80;
        v117 = v5;
        v118 = v18;
        v90 = v18;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v116));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filteredArrayUsingPredicate:", v19));

        os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        v22 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v73 = objc_msgSend(v20, "count");
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)v128 = v73;
          *(_WORD *)&v128[8] = 2112;
          *(_QWORD *)&v128[10] = v90;
          _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "DominantBundleCreation: home bundle count is %lu for %@", buf, 0x16u);
        }

        v99 = (void *)objc_opt_new(v14[310]);
        v98 = (void *)objc_opt_new(v14[310]);
        if ((unint64_t)objc_msgSend(v20, "count") >= 2)
        {
          v86 = v20;
          v87 = i;
          v114 = 0u;
          v115 = 0u;
          v112 = 0u;
          v113 = 0u;
          v23 = v20;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v112, v126, 16);
          if (v24)
          {
            v25 = v24;
            v26 = 0;
            v27 = 0;
            v28 = *(_QWORD *)v113;
            do
            {
              for (j = 0; j != v25; j = (char *)j + 1)
              {
                if (*(_QWORD *)v113 != v28)
                  objc_enumerationMutation(v23);
                v30 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * (_QWORD)j);
                v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "action"));
                objc_msgSend(v31, "actionSubtype");

                v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "action"));
                v33 = objc_msgSend(v32, "actionSubtype");

                if (v33 == (id)1)
                  ++v27;
                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "action"));
                v35 = objc_msgSend(v34, "actionSubtype");

                if (v35 == (id)9)
                  ++v26;
                v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "suggestionID"));
                v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "UUIDString"));
                objc_msgSend(v99, "addObject:", v37);

                v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bundleIdentifier"));
                v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "UUIDString"));
                objc_msgSend(v98, "addObject:", v39);

              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v112, v126, 16);
            }
            while (v25);
          }
          else
          {
            v26 = 0;
            v27 = 0;
          }

          v110 = 0u;
          v111 = 0u;
          v108 = 0u;
          v109 = 0u;
          v92 = v23;
          v51 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v108, v125, 16);
          if (!v51)
          {
            v97 = 0;
            v94 = 0;
            goto LABEL_77;
          }
          v52 = v51;
          v97 = 0;
          v94 = 0;
          v95 = *(_QWORD *)v109;
          if (v26)
            v53 = 1;
          else
            v53 = v27 <= 0;
          v54 = !v53;
          v91 = v54;
          while (1)
          {
            for (k = 0; k != v52; k = (char *)k + 1)
            {
              if (*(_QWORD *)v109 != v95)
                objc_enumerationMutation(v92);
              v56 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * (_QWORD)k);
              if (v26 < 1)
              {
                if (v91)
                {
                  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1)
                                                                                     + 8 * (_QWORD)k), "action"));
                  v60 = objc_msgSend(v59, "actionSubtype");

                  if (v60 != (id)1)
                  {
LABEL_58:
                    objc_msgSend(v56, "setIsAggregatedAndSuppressed:", 1);
                    ++v93;
                    ++v94;
                  }
                }
              }
              else
              {
                v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1)
                                                                                   + 8 * (_QWORD)k), "action"));
                v58 = objc_msgSend(v57, "actionSubtype");

                if (v58 != (id)9)
                  goto LABEL_58;
              }
              v106 = 0u;
              v107 = 0u;
              v104 = 0u;
              v105 = 0u;
              v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "resources"));
              v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v104, v124, 16);
              if (!v62)
              {

LABEL_72:
                objc_msgSend(v56, "setIsAggregatedAndSuppressed:", 1);
                ++v96;
                ++v97;
                goto LABEL_73;
              }
              v63 = v62;
              v64 = 0;
              v65 = *(_QWORD *)v105;
              do
              {
                for (m = 0; m != v63; m = (char *)m + 1)
                {
                  if (*(_QWORD *)v105 != v65)
                    objc_enumerationMutation(v61);
                  v67 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * (_QWORD)m);
                  if (objc_msgSend(v67, "type") == (id)2 || objc_msgSend(v67, "type") == (id)3)
                    ++v64;
                }
                v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v104, v124, 16);
              }
              while (v63);

              if (!v64)
                goto LABEL_72;
LABEL_73:
              objc_msgSend(v56, "setSubSuggestionIDs:", v99);
              objc_msgSend(v56, "setSubBundleIDs:", v98);
            }
            v52 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v108, v125, 16);
            if (!v52)
            {
LABEL_77:

              v4 = v82;
              v13 = v84;
              v5 = v85;
              v14 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
              v20 = v86;
              i = v87;
              goto LABEL_80;
            }
          }
        }
        if (objc_msgSend(v20, "count") == (id)1)
        {
          v102 = 0u;
          v103 = 0u;
          v100 = 0u;
          v101 = 0u;
          v40 = v20;
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "firstObject"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "resources"));

          v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v100, v123, 16);
          if (v43)
          {
            v44 = v43;
            v45 = v4;
            v46 = i;
            v47 = 0;
            v48 = *(_QWORD *)v101;
            do
            {
              for (n = 0; n != v44; n = (char *)n + 1)
              {
                if (*(_QWORD *)v101 != v48)
                  objc_enumerationMutation(v42);
                v50 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)n);
                if (objc_msgSend(v50, "type") == (id)2 || objc_msgSend(v50, "type") == (id)3)
                  ++v47;
              }
              v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v100, v123, 16);
            }
            while (v44);

            i = v46;
            v4 = v45;
            v13 = v84;
            v5 = v85;
            if (v47)
            {
              v97 = 0;
              v94 = 0;
              v20 = v40;
              goto LABEL_80;
            }
          }
          else
          {

          }
          v20 = v40;
          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "firstObject"));
          v97 = 1;
          objc_msgSend(v68, "setIsAggregatedAndSuppressed:", 1);

          v94 = 0;
          ++v96;
        }
        else
        {
          v97 = 0;
          v94 = 0;
        }
LABEL_80:
        v69 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        v70 = objc_claimAutoreleasedReturnValue(v69);
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v128 = v94;
          *(_WORD *)&v128[4] = 2112;
          *(_QWORD *)&v128[6] = v90;
          _os_log_debug_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEBUG, "DominantBundleCreation: %d duplicate home bundles suppressed for %@", buf, 0x12u);
        }

        v71 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        v72 = objc_claimAutoreleasedReturnValue(v71);
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v128 = v97;
          *(_WORD *)&v128[4] = 2112;
          *(_QWORD *)&v128[6] = v90;
          _os_log_debug_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEBUG, "DominantBundleCreation: %d home bundles without resources suppressed for %@", buf, 0x12u);
        }

      }
      v89 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v119, v129, 16);
      if (!v89)
      {
LABEL_90:

        v75 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        v76 = objc_claimAutoreleasedReturnValue(v75);
        if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v128 = v93;
          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_INFO, "DominantBundleCreation: %d total duplicate home bundles suppressed for period", buf, 8u);
        }

        v77 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        v78 = objc_claimAutoreleasedReturnValue(v77);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v128 = v96;
          _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "DominantBundleCreation: %d total home bundles without resources suppressed for period", buf, 8u);
        }

        goto LABEL_95;
      }
    }
  }
  v74 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v5 = objc_claimAutoreleasedReturnValue(v74);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v128 = objc_msgSend(v4, "count");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "DominantBundleCreation: no need to remove duplicate home bundles since home bundle count is %lu", buf, 0xCu);
  }
LABEL_95:

}

id __76__MODominantBundleCreationManager__suppressDuplicateHomeBundles_parameters___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "startDate"));
  v5 = objc_msgSend(v3, "isDate:inSameDayAsDate:", v4, *(_QWORD *)(a1 + 40));

  return v5;
}

- (MODaemonUniverse)fUniverse
{
  return self->_fUniverse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fUniverse, 0);
}

- (void)_dominantBundleCreatedFromOutingBundles:(void *)a1 activityBundles:(NSObject *)a2 parameters:.cold.1(void *a1, NSObject *a2)
{
  int v3;
  id v4;

  v3 = 134217984;
  v4 = objc_msgSend(a1, "count");
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "DominantBundleCreation: Graph partitioning is performed. Number of bundles groups: %lu", (uint8_t *)&v3, 0xCu);
}

- (void)_dominantBundleCreatedFromOutingBundles:(os_log_t)log activityBundles:parameters:.cold.2(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  v1 = 136315394;
  v2 = "-[MODominantBundleCreationManager _dominantBundleCreatedFromOutingBundles:activityBundles:parameters:]";
  v3 = 1024;
  v4 = 187;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "DominantBundleCreation: the event bundles and membership arrays have to be of the same size. (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

@end
