@implementation MOTimeAtHomeAnomalyManager

- (MOTimeAtHomeAnomalyManager)initWithUniverse:(id)a3
{
  id v5;
  MOTimeAtHomeAnomalyManager *v6;
  MOTimeAtHomeAnomalyManager *v7;
  uint64_t v8;
  objc_class *v9;
  NSString *v10;
  id v11;
  const char *v12;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  uint64_t v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  uint64_t v21;
  MORoutineServiceManager *routineServiceManager;
  uint64_t v23;
  objc_class *v24;
  NSString *v25;
  void *v26;
  uint64_t v27;
  MOConfigurationManager *configurationManager;
  double v29;
  float v30;
  double v31;
  float v32;
  double v33;
  float v34;
  objc_super v36;

  v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)MOTimeAtHomeAnomalyManager;
  v6 = -[MOTimeAtHomeAnomalyManager init](&v36, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fUniverse, a3);
    v9 = (objc_class *)objc_opt_class(v7, v8);
    v10 = NSStringFromClass(v9);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v10));
    v12 = (const char *)objc_msgSend(v11, "UTF8String");
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = dispatch_queue_create(v12, v14);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v15;

    v18 = (objc_class *)objc_opt_class(MORoutineServiceManager, v17);
    v19 = NSStringFromClass(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v20));
    routineServiceManager = v7->_routineServiceManager;
    v7->_routineServiceManager = (MORoutineServiceManager *)v21;

    v24 = (objc_class *)objc_opt_class(MOConfigurationManager, v23);
    v25 = NSStringFromClass(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v26));
    configurationManager = v7->_configurationManager;
    v7->_configurationManager = (MOConfigurationManager *)v27;

    LODWORD(v29) = 0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v7->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("Photos_ThresholdForCurationScore"), v29);
    v7->_photosCurationScoreThreshold = v30;
    v7->_photosFaceCountThreshold = -[MOConfigurationManagerBase getIntegerSettingForKey:withFallback:](v7->_configurationManager, "getIntegerSettingForKey:withFallback:", CFSTR("Photos_ThresholdForFaceCount"), 1);
    v7->_photosCountThreshold = -[MOConfigurationManagerBase getIntegerSettingForKey:withFallback:](v7->_configurationManager, "getIntegerSettingForKey:withFallback:", CFSTR("Photos_ThresholdNumberOfPhotos"), 1);
    LODWORD(v31) = 0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v7->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("Media_DurationThreshold"), v31);
    v7->_mediaDurationThreshold = v32;
    LODWORD(v33) = 1202241536;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v7->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("EmotionAttachmentTAHBundleDurationThreshold"), v33);
    v7->_emotionAttachmentBundleDurationThreshold = v34;
  }

  return v7;
}

- (void)performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 withBundleWindowStart:(id)a5 withBundleWindowEnd:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = objc_claimAutoreleasedReturnValue(-[MOTimeAtHomeAnomalyManager queue](self, "queue"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __126__MOTimeAtHomeAnomalyManager_performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke;
  v23[3] = &unk_1002AF780;
  v23[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  dispatch_async(v17, v23);

}

void __126__MOTimeAtHomeAnomalyManager_performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __126__MOTimeAtHomeAnomalyManager_performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke_2;
  v6[3] = &unk_1002ADFD8;
  v5 = *(_QWORD *)(a1 + 64);
  v7 = *(id *)(a1 + 72);
  objc_msgSend(v1, "_performAnnotationWithEvents:withPatternEvents:withBundleWindowStart:withBundleWindowEnd:handler:", v2, v3, v4, v5, v6);

}

uint64_t __126__MOTimeAtHomeAnomalyManager_performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 withBundleWindowStart:(id)a5 withBundleWindowEnd:(id)a6 handler:(id)a7
{
  id os_log;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  id v26;
  NSObject *v27;
  id v28;
  void *v29;
  uint64_t v30;
  objc_class *v31;
  NSString *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  NSMutableArray *v40;
  MOEventBundle *v41;
  void *v42;
  void *v43;
  MOEventBundle *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  MOAction *v49;
  void *v50;
  void *v51;
  void *v52;
  MOPlace *v53;
  void *v54;
  void *v55;
  MOPlace *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  double v67;
  uint64_t v68;
  id v69;
  NSObject *v70;
  void *v71;
  void *v72;
  MODaemonUniverse *fUniverse;
  id v74;
  double photosCurationScoreThreshold;
  void *v76;
  void *v77;
  id v78;
  uint64_t v79;
  float v80;
  void *j;
  void *v82;
  float v83;
  float v84;
  void *v85;
  BOOL v86;
  double v87;
  void *v88;
  id v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  BOOL v106;
  void *v107;
  id v108;
  int v109;
  uint64_t v110;
  void *k;
  id v112;
  NSObject *v113;
  uint64_t v114;
  objc_class *v115;
  NSString *v116;
  void *v117;
  id v118;
  id v119;
  id v120;
  NSObject *v121;
  id v122;
  NSObject *v123;
  id v124;
  NSObject *v125;
  id v126;
  void *v127;
  void *v128;
  void *v129;
  void (**v130)(id, id, _QWORD);
  id v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  id v138;
  void *v139;
  NSMutableArray *v140;
  NSMutableArray *v141;
  NSMutableArray *v142;
  void *v143;
  void *v144;
  uint64_t v145;
  void *v146;
  id v147;
  id v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  NSMutableArray *v155;
  uint64_t v156;
  id v158;
  id obj;
  id obja;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  _QWORD v169[9];
  uint64_t v170;
  uint64_t *v171;
  uint64_t v172;
  uint64_t (*v173)(uint64_t, uint64_t);
  void (*v174)(uint64_t);
  id v175;
  uint64_t v176;
  uint64_t *v177;
  uint64_t v178;
  uint64_t (*v179)(uint64_t, uint64_t);
  void (*v180)(uint64_t);
  id v181;
  uint64_t v182;
  uint64_t *v183;
  uint64_t v184;
  uint64_t (*v185)(uint64_t, uint64_t);
  void (*v186)(uint64_t);
  NSMutableArray *v187;
  uint64_t v188;
  uint64_t *v189;
  uint64_t v190;
  uint64_t v191;
  _QWORD v192[5];
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  _BYTE v201[128];
  const __CFString *v202;
  void *v203;
  uint8_t v204[128];
  _BYTE v205[24];
  uint64_t (*v206)(uint64_t, uint64_t);
  void (*v207)(uint64_t);
  NSMutableArray *v208;
  _BYTE buf[24];
  uint64_t (*v210)(uint64_t, uint64_t);
  void (*v211)(uint64_t);
  NSMutableArray *v212;
  _BYTE v213[128];
  _BYTE v214[128];
  id v215;

  v138 = a3;
  v131 = a4;
  v158 = a5;
  v148 = a6;
  v130 = (void (**)(id, id, _QWORD))a7;
  v136 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities predicateOfEventsWithPlaySessions](MOContextAnnotationUtilities, "predicateOfEventsWithPlaySessions"));
  v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "filteredArrayUsingPredicate:", v136));
  v135 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 24));
  v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "filteredArrayUsingPredicate:", v135));
  v133 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("stateOfMindEvent.reflectiveInterval = %d"), 1));
  v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "filteredArrayUsingPredicate:", v133));
  v132 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 1));
  v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "filteredArrayUsingPredicate:", v132));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = objc_msgSend(v137, "count");
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "T@H: Found %lu visit pattern events", buf, 0xCu);
  }

  if (objc_msgSend(v137, "count"))
  {
    v129 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("%K = %lu"), CFSTR(" AND %K = %lu")));
    v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v129, CFSTR("category"), 1, CFSTR("placeUserType"), 1));
    v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "filteredArrayUsingPredicate:", v128));
    v126 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
    v215 = v126;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v215, 1));
    v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "sortedArrayUsingDescriptors:", v13));

    v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = objc_msgSend(v146, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "T@H: Found %lu visit events", buf, 0xCu);
    }

    if (objc_msgSend(v146, "count"))
    {
      v141 = objc_opt_new(NSMutableArray);
      v199 = 0u;
      v200 = 0u;
      v197 = 0u;
      v198 = 0u;
      obj = v137;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v197, v214, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v198;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(_QWORD *)v198 != v18)
              objc_enumerationMutation(obj);
            v20 = *(void **)(*((_QWORD *)&v197 + 1) + 8 * (_QWORD)i);
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "patterns"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("kEventPatternAnomalyFeatureType")));
            if (objc_msgSend(v22, "unsignedIntValue") == 5)
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "startDate"));
              if ((objc_msgSend(v23, "isOnOrAfter:", v158) & 1) != 0)
              {
                v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "endDate"));
                v25 = objc_msgSend(v24, "isOnOrBefore:", v148);

                if (v25)
                  -[NSMutableArray addObject:](v141, "addObject:", v20);
              }
              else
              {

              }
            }
            else
            {

            }
          }
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v197, v214, 16);
        }
        while (v17);
      }

      v26 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v28 = -[NSMutableArray count](v141, "count");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "T@H: Found %lu T@H pattern events with complete context available for bundling", buf, 0xCu);
      }

      if (-[NSMutableArray count](v141, "count"))
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[MOTimeAtHomeAnomalyManager fUniverse](self, "fUniverse"));
        v31 = (objc_class *)objc_opt_class(MOTimeZoneManager, v30);
        v32 = NSStringFromClass(v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "getService:", v33));

        v142 = objc_opt_new(NSMutableArray);
        v195 = 0u;
        v196 = 0u;
        v193 = 0u;
        v194 = 0u;
        v140 = v141;
        v147 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v140, "countByEnumeratingWithState:objects:count:", &v193, v213, 16);
        if (!v147)
          goto LABEL_73;
        v145 = *(_QWORD *)v194;
        v139 = v34;
        while (1)
        {
          v35 = 0;
          do
          {
            if (*(_QWORD *)v194 != v145)
            {
              v36 = v35;
              objc_enumerationMutation(v140);
              v35 = v36;
            }
            v156 = v35;
            v37 = *(void **)(*((_QWORD *)&v193 + 1) + 8 * v35);
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            v210 = __Block_byref_object_copy__14;
            v211 = __Block_byref_object_dispose__14;
            v212 = objc_opt_new(NSMutableArray);
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "startDate"));
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "endDate"));
            v192[0] = _NSConcreteStackBlock;
            v192[1] = 3221225472;
            v192[2] = __127__MOTimeAtHomeAnomalyManager__performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke;
            v192[3] = &unk_1002AF7A8;
            v192[4] = buf;
            +[MOContextAnnotationUtilities filterEventsIntersectingDateRange:rangeStart:rangeEnd:handler:](MOContextAnnotationUtilities, "filterEventsIntersectingDateRange:rangeStart:rangeEnd:handler:", v146, v38, v39, v192);

            if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"))
            {
              v40 = objc_opt_new(NSMutableArray);
              -[NSMutableArray addObject:](v40, "addObject:", v37);
              -[NSMutableArray addObjectsFromArray:](v40, "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
              v155 = v40;
              v41 = [MOEventBundle alloc];
              v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
              v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
              v44 = -[MOEventBundle initWithBundleIdentifier:creationDate:](v41, "initWithBundleIdentifier:creationDate:", v42, v43);

              -[MOEventBundle setEvents:](v44, "setEvents:", v155);
              -[MOEventBundle setInterfaceType:](v44, "setInterfaceType:", 7);
              -[MOEventBundle setBundleSubType:](v44, "setBundleSubType:", 501);
              -[MOEventBundle setBundleSuperType:](v44, "setBundleSuperType:", 5);
              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "startDate"));
              -[MOEventBundle setStartDate:](v44, "setStartDate:", v45);

              v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "endDate"));
              -[MOEventBundle setEndDate:](v44, "setEndDate:", v46);

              v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "endDate"));
              v48 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeForDate:timeZoneManager:](MOTime, "timeForDate:timeZoneManager:", v47, v34));
              -[MOEventBundle setTime:](v44, "setTime:", v48);

              v49 = -[MOAction initWithActionName:actionType:actionSubtype:]([MOAction alloc], "initWithActionName:actionType:actionSubtype:", CFSTR("Time at Home"), 1, 1);
              -[MOEventBundle setAction:](v44, "setAction:", v49);

              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "firstObject"));
              v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "eventIdentifier"));
              v52 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v44, "action"));
              objc_msgSend(v52, "setSourceEventIdentifier:", v51);

              v53 = [MOPlace alloc];
              v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "firstObject"));
              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "location"));
              v56 = -[MOPlace initWithPlaceName:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:](v53, "initWithPlaceName:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:", CFSTR("Home"), 1, 1, v55, 1, 0, -1.0, -1.0, 0.0);
              -[MOEventBundle setPlace:](v44, "setPlace:", v56);

              v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "firstObject"));
              v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "eventIdentifier"));
              v59 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v44, "place"));
              objc_msgSend(v59, "setSourceEventIdentifier:", v58);

              v60 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v44, "startDate"));
              v61 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](v44, "endDate"));
              v154 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities predicateOfEventsWithPlaySessionsWithStartDate:endData:](MOContextAnnotationUtilities, "predicateOfEventsWithPlaySessionsWithStartDate:endData:", v60, v61));

              v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "filteredArrayUsingPredicate:", v154));
              if (objc_msgSend(v150, "count"))
              {
                *(float *)&v62 = self->_mediaDurationThreshold;
                v63 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities annotateEventBundle:dateIntervalEvents:playbackMediaEvents:mediaDurationThreshold:](MOContextAnnotationUtilities, "annotateEventBundle:dateIntervalEvents:playbackMediaEvents:mediaDurationThreshold:", v44, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v150, v62));
                if (objc_msgSend(v63, "count"))
                  -[MOEventBundle addEvents:](v44, "addEvents:", v63);

              }
              v64 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v44, "startDate"));
              v65 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](v44, "endDate"));
              v153 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities predicateOfEmotionLogsWithStartDate:endDate:](MOContextAnnotationUtilities, "predicateOfEmotionLogsWithStartDate:endDate:", v64, v65));

              v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "filteredArrayUsingPredicate:", v153));
              v66 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
              -[MOTimeAtHomeAnomalyManager emotionAttachmentBundleDurationThreshold](self, "emotionAttachmentBundleDurationThreshold");
              *(float *)&v67 = v67;
              v68 = objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities annotateEventBundle:dateIntervalEvents:emotionEvents:bundleDurationThreshold:](MOContextAnnotationUtilities, "annotateEventBundle:dateIntervalEvents:emotionEvents:bundleDurationThreshold:", v44, v66, v152, v67));
              -[MOEventBundle addEvents:](v44, "addEvents:", v68);
              obja = (id)v68;
              v69 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              v70 = objc_claimAutoreleasedReturnValue(v69);
              if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
              {
                v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "startDate"));
                v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "endDate"));
                *(_DWORD *)v205 = 138412546;
                *(_QWORD *)&v205[4] = v71;
                *(_WORD *)&v205[12] = 2112;
                *(_QWORD *)&v205[14] = v72;
                _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "T@H: Created bundle for range %@ to %@", v205, 0x16u);

              }
              *(_QWORD *)v205 = 0;
              *(_QWORD *)&v205[8] = v205;
              *(_QWORD *)&v205[16] = 0x3032000000;
              v206 = __Block_byref_object_copy__14;
              v207 = __Block_byref_object_dispose__14;
              v208 = objc_opt_new(NSMutableArray);
              v188 = 0;
              v189 = &v188;
              v190 = 0x2020000000;
              v191 = 0;
              v182 = 0;
              v183 = &v182;
              v184 = 0x3032000000;
              v185 = __Block_byref_object_copy__14;
              v186 = __Block_byref_object_dispose__14;
              v187 = objc_opt_new(NSMutableArray);
              v176 = 0;
              v177 = &v176;
              v178 = 0x3032000000;
              v179 = __Block_byref_object_copy__14;
              v180 = __Block_byref_object_dispose__14;
              v181 = 0;
              v170 = 0;
              v171 = &v170;
              v172 = 0x3032000000;
              v173 = __Block_byref_object_copy__14;
              v174 = __Block_byref_object_dispose__14;
              v175 = 0;
              fUniverse = self->_fUniverse;
              v169[0] = _NSConcreteStackBlock;
              v169[1] = 3221225472;
              v169[2] = __127__MOTimeAtHomeAnomalyManager__performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke_116;
              v169[3] = &unk_1002AF7D0;
              v169[4] = v205;
              v169[5] = &v188;
              v169[6] = &v182;
              v169[7] = &v176;
              v169[8] = &v170;
              +[MOContextAnnotationUtilities addPhotoResources:universe:handler:](MOContextAnnotationUtilities, "addPhotoResources:universe:handler:", v44, fUniverse, v169);
              -[MOEventBundle setPhotoSource:](v44, "setPhotoSource:", v189[3]);
              v74 = objc_msgSend((id)v183[5], "copy");
              -[MOEventBundle setPhotoTraits:](v44, "setPhotoTraits:", v74);

              photosCurationScoreThreshold = self->_photosCurationScoreThreshold;
              *(float *)&photosCurationScoreThreshold = photosCurationScoreThreshold;
              v76 = (void *)objc_claimAutoreleasedReturnValue(+[MOPhotosAtHomeManager chooseResourcesWithGoodPhotos:withPhotoCurationScore:andFaceCount:numPhotosThreshold:](MOPhotosAtHomeManager, "chooseResourcesWithGoodPhotos:withPhotoCurationScore:andFaceCount:numPhotosThreshold:", *(_QWORD *)(*(_QWORD *)&v205[8] + 40), self->_photosFaceCountThreshold, self->_photosCountThreshold, photosCurationScoreThreshold));
              -[MOEventBundle setResources:](v44, "setResources:", v76);

              v167 = 0u;
              v168 = 0u;
              v165 = 0u;
              v166 = 0u;
              v77 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v44, "resources"));
              v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v165, v204, 16);
              if (v78)
              {
                v79 = *(_QWORD *)v166;
                v80 = 0.0;
                do
                {
                  for (j = 0; j != v78; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v166 != v79)
                      objc_enumerationMutation(v77);
                    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v165 + 1) + 8 * (_QWORD)j), "photoCurationScore"));
                    objc_msgSend(v82, "floatValue");
                    v84 = v83;

                    v80 = v80 + v84;
                  }
                  v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v165, v204, 16);
                }
                while (v78);
              }
              else
              {
                v80 = 0.0;
              }

              v85 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v44, "resources"));
              v86 = objc_msgSend(v85, "count") == 0;

              if (!v86)
              {
                v88 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v44, "resources"));
                v89 = objc_msgSend(v88, "count");

                v80 = v80 / (float)(unint64_t)v89;
              }
              *(float *)&v87 = v80;
              v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v87));
              -[MOEventBundle addMetaDataForRankForKey:value:](v44, "addMetaDataForRankForKey:value:", CFSTR("PhotosAtHomeCurationScore"), v90);

              if (objc_msgSend(obja, "count"))
              {
                +[MOContextAnnotationUtilities addStateOfMindResourceForBundle:withEmotionEvents:](MOContextAnnotationUtilities, "addStateOfMindResourceForBundle:withEmotionEvents:", v44, obja);
                +[MOContextAnnotationUtilities addStateOfMindMetaDataForRankForBundle:withEmotionEvents:](MOContextAnnotationUtilities, "addStateOfMindMetaDataForRankForBundle:withEmotionEvents:", v44, obja);
              }
              v91 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("type"), 2));
              v92 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v44, "resources"));
              v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "filteredArrayUsingPredicate:", v91));
              v149 = (void *)v91;

              v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("type"), 3));
              v94 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v44, "resources"));
              v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "filteredArrayUsingPredicate:", v93));

              v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("type"), 16));
              v97 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v44, "resources"));
              v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "filteredArrayUsingPredicate:", v96));

              +[MOContextAnnotationUtilities assetPriorityScoringForTimeAtHomeBundlesWithBundle:withMediaResources:withPhotoResources:withEmotionResources:](MOContextAnnotationUtilities, "assetPriorityScoringForTimeAtHomeBundlesWithBundle:withMediaResources:withPhotoResources:withEmotionResources:", v44, v95, v151, v98);
              if (v177[5] && v171[5])
              {
                -[MOEventBundle setStartDate:](v44, "setStartDate:");
                v99 = (void *)v177[5];
                if (v99 == (void *)v171[5])
                {
                  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "dateByAddingTimeInterval:", 5.0));
                  -[MOEventBundle setEndDate:](v44, "setEndDate:", v100);

                }
                else
                {
                  -[MOEventBundle setEndDate:](v44, "setEndDate:");
                }
              }
              v202 = CFSTR("TimeAtHomeDuration");
              v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "patterns"));
              v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("kEventPatternFeatureValue")));
              v203 = v102;
              v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v203, &v202, 1));
              -[MOEventBundle setMetaDataForRank:](v44, "setMetaDataForRank:", v103);

              if (+[MOContextAnnotationUtilities isEvergreenBundle:](MOContextAnnotationUtilities, "isEvergreenBundle:", v44))
              {
                v104 = 504;
              }
              else
              {
                v104 = 501;
              }
              -[MOEventBundle setBundleSubType:](v44, "setBundleSubType:", v104);
              v105 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v44, "resources"));
              v106 = objc_msgSend(v105, "count") == 0;

              if (v106)
                goto LABEL_69;
              v163 = 0u;
              v164 = 0u;
              v161 = 0u;
              v162 = 0u;
              v107 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v44, "resources"));
              v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v161, v201, 16);
              if (!v108)
              {

                goto LABEL_69;
              }
              v109 = 0;
              v110 = *(_QWORD *)v162;
              do
              {
                for (k = 0; k != v108; k = (char *)k + 1)
                {
                  if (*(_QWORD *)v162 != v110)
                    objc_enumerationMutation(v107);
                  if (objc_msgSend(*(id *)(*((_QWORD *)&v161 + 1) + 8 * (_QWORD)k), "type") == (id)2)
                    ++v109;
                }
                v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v161, v201, 16);
              }
              while (v108);

              v34 = v139;
              if (!v109)
LABEL_69:
                -[MOEventBundle setIsAggregatedAndSuppressed:](v44, "setIsAggregatedAndSuppressed:", 1);
              -[NSMutableArray addObject:](v142, "addObject:", v44);

              _Block_object_dispose(&v170, 8);
              _Block_object_dispose(&v176, 8);

              _Block_object_dispose(&v182, 8);
              _Block_object_dispose(&v188, 8);
              _Block_object_dispose(v205, 8);

            }
            _Block_object_dispose(buf, 8);

            v35 = v156 + 1;
          }
          while ((id)(v156 + 1) != v147);
          v147 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v140, "countByEnumeratingWithState:objects:count:", &v193, v213, 16);
          if (!v147)
          {
LABEL_73:

            v112 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            v113 = objc_claimAutoreleasedReturnValue(v112);
            if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
            {
              v115 = (objc_class *)objc_opt_class(self, v114);
              v116 = NSStringFromClass(v115);
              v117 = (void *)objc_claimAutoreleasedReturnValue(v116);
              v118 = -[NSMutableArray count](v142, "count");
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v117;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v118;
              _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_INFO, "T@H(%@): Event Bundles, %lu", buf, 0x16u);

            }
            v119 = -[NSMutableArray copy](v142, "copy");
            v130[2](v130, v119, 0);

            goto LABEL_85;
          }
        }
      }
      v124 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v125 = objc_claimAutoreleasedReturnValue(v124);
      if (os_log_type_enabled(v125, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_INFO, "T@H: Exiting bundling due to no pattern events with complete context available for bundling", buf, 2u);
      }

      v130[2](v130, &__NSArray0__struct, 0);
LABEL_85:

    }
    else
    {
      v122 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v123 = objc_claimAutoreleasedReturnValue(v122);
      if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_INFO, "T@H: Exiting bundling due to no visit events", buf, 2u);
      }

      v130[2](v130, &__NSArray0__struct, 0);
    }

  }
  else
  {
    v120 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v121 = objc_claimAutoreleasedReturnValue(v120);
    if (os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v121, OS_LOG_TYPE_INFO, "T@H: Exiting bundling due to no visit pattern events", buf, 2u);
    }

    v130[2](v130, &__NSArray0__struct, 0);
  }

}

void __127__MOTimeAtHomeAnomalyManager__performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v5 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 134217984;
      v7 = objc_msgSend(v3, "count");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "T@H: Found %lu visit events overlapping anomaly time range", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObjectsFromArray:", v3);
  }

}

void __127__MOTimeAtHomeAnomalyManager__performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke_116(_QWORD *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v12;
  id v13;
  id v14;
  id v15;
  id os_log;
  NSObject *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;

  v12 = a2;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a2);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a4);
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a5);
  objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), a6);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v17 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
    v19 = 134218754;
    v20 = v18;
    v21 = 2112;
    v22 = v14;
    v23 = 2112;
    v24 = v15;
    v25 = 2048;
    v26 = objc_msgSend(v12, "count");
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "T@H, photoSource, %lu, startDate, %@, endDate, %@, count, %lu", (uint8_t *)&v19, 0x2Au);
  }

}

- (MODaemonUniverse)fUniverse
{
  return self->_fUniverse;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MORoutineServiceManager)routineServiceManager
{
  return self->_routineServiceManager;
}

- (void)setRoutineServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_routineServiceManager, a3);
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (double)photosDistanceFromHomeThreshold
{
  return self->_photosDistanceFromHomeThreshold;
}

- (void)setPhotosDistanceFromHomeThreshold:(double)a3
{
  self->_photosDistanceFromHomeThreshold = a3;
}

- (double)photosCurationScoreThreshold
{
  return self->_photosCurationScoreThreshold;
}

- (void)setPhotosCurationScoreThreshold:(double)a3
{
  self->_photosCurationScoreThreshold = a3;
}

- (unint64_t)photosFaceCountThreshold
{
  return self->_photosFaceCountThreshold;
}

- (void)setPhotosFaceCountThreshold:(unint64_t)a3
{
  self->_photosFaceCountThreshold = a3;
}

- (unint64_t)photosCountThreshold
{
  return self->_photosCountThreshold;
}

- (void)setPhotosCountThreshold:(unint64_t)a3
{
  self->_photosCountThreshold = a3;
}

- (float)mediaDurationThreshold
{
  return self->_mediaDurationThreshold;
}

- (void)setMediaDurationThreshold:(float)a3
{
  self->_mediaDurationThreshold = a3;
}

- (double)emotionAttachmentBundleDurationThreshold
{
  return self->_emotionAttachmentBundleDurationThreshold;
}

- (void)setEmotionAttachmentBundleDurationThreshold:(double)a3
{
  self->_emotionAttachmentBundleDurationThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_routineServiceManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_fUniverse, 0);
}

@end
