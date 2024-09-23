@implementation MOHostingAtHomeManager

- (MOHostingAtHomeManager)initWithUniverse:(id)a3
{
  id v5;
  MOHostingAtHomeManager *v6;
  MOHostingAtHomeManager *v7;
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
  v36.super_class = (Class)MOHostingAtHomeManager;
  v6 = -[MOHostingAtHomeManager init](&v36, "init");
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
  v17 = objc_claimAutoreleasedReturnValue(-[MOHostingAtHomeManager queue](self, "queue"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __122__MOHostingAtHomeManager_performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke;
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

void __122__MOHostingAtHomeManager_performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke(uint64_t a1)
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
  v6[2] = __122__MOHostingAtHomeManager_performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke_2;
  v6[3] = &unk_1002ADFD8;
  v5 = *(_QWORD *)(a1 + 64);
  v7 = *(id *)(a1 + 72);
  objc_msgSend(v1, "_performAnnotationWithEvents:withPatternEvents:withBundleWindowStart:withBundleWindowEnd:handler:", v2, v3, v4, v5, v6);

}

uint64_t __122__MOHostingAtHomeManager_performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke_2(uint64_t a1)
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
  uint64_t v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  id v31;
  NSObject *v32;
  id v33;
  id v34;
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
  void *v49;
  void *v50;
  MOAction *v51;
  void *v52;
  void *v53;
  void *v54;
  MOPlace *v55;
  void *v56;
  void *v57;
  MOPlace *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  double v69;
  uint64_t v70;
  id v71;
  NSObject *v72;
  void *v73;
  void *v74;
  id v75;
  MODaemonUniverse *fUniverse;
  id v77;
  id v78;
  NSObject *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  double photosCurationScoreThreshold;
  void *v84;
  void *v85;
  id v86;
  uint64_t v87;
  float v88;
  void *j;
  void *v90;
  float v91;
  float v92;
  void *v93;
  BOOL v94;
  double v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  BOOL v110;
  void *v111;
  void *v112;
  id v113;
  int v114;
  uint64_t v115;
  void *k;
  id v117;
  void *v118;
  id v119;
  NSObject *v120;
  uint64_t v121;
  objc_class *v122;
  NSString *v123;
  void *v124;
  id v125;
  id v126;
  id v127;
  NSObject *v128;
  id v129;
  NSObject *v130;
  id v131;
  NSObject *v132;
  id v133;
  void *v134;
  void *v135;
  void *v136;
  void (**v137)(id, id, _QWORD);
  id v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  id v145;
  NSMutableArray *v146;
  NSMutableArray *v147;
  NSMutableArray *v148;
  void *v149;
  void *v150;
  void *v151;
  uint64_t v152;
  void *v153;
  id v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  NSMutableArray *v162;
  uint64_t v163;
  id v165;
  id obj;
  id obja;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  _QWORD v176[9];
  uint64_t v177;
  uint64_t *v178;
  uint64_t v179;
  uint64_t (*v180)(uint64_t, uint64_t);
  void (*v181)(uint64_t);
  id v182;
  uint64_t v183;
  uint64_t *v184;
  uint64_t v185;
  uint64_t (*v186)(uint64_t, uint64_t);
  void (*v187)(uint64_t);
  id v188;
  uint64_t v189;
  uint64_t *v190;
  uint64_t v191;
  uint64_t (*v192)(uint64_t, uint64_t);
  void (*v193)(uint64_t);
  NSMutableArray *v194;
  uint64_t v195;
  uint64_t *v196;
  uint64_t v197;
  uint64_t v198;
  _QWORD v199[5];
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  _BYTE v208[128];
  uint8_t v209[128];
  uint8_t v210[4];
  uint64_t v211;
  _BYTE v212[24];
  uint64_t (*v213)(uint64_t, uint64_t);
  void (*v214)(uint64_t);
  NSMutableArray *v215;
  _BYTE buf[24];
  uint64_t (*v217)(uint64_t, uint64_t);
  void (*v218)(uint64_t);
  NSMutableArray *v219;
  _BYTE v220[128];
  _BYTE v221[128];
  id v222;

  v145 = a3;
  v138 = a4;
  v165 = a5;
  v154 = a6;
  v137 = (void (**)(id, id, _QWORD))a7;
  v143 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities predicateOfEventsWithPlaySessions](MOContextAnnotationUtilities, "predicateOfEventsWithPlaySessions"));
  v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "filteredArrayUsingPredicate:", v143));
  v142 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 24));
  v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "filteredArrayUsingPredicate:", v142));
  v140 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("stateOfMindEvent.reflectiveInterval = %d"), 1));
  v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "filteredArrayUsingPredicate:", v140));
  v139 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 1));
  v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "filteredArrayUsingPredicate:", v139));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = objc_msgSend(v144, "count");
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "H@H: Found %lu visit pattern events", buf, 0xCu);
  }

  if (objc_msgSend(v144, "count"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOHostingAtHomeManager fUniverse](self, "fUniverse"));
    v15 = (objc_class *)objc_opt_class(MOTimeZoneManager, v14);
    v16 = NSStringFromClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "getService:", v17));

    v136 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("%K = %lu"), CFSTR(" AND %K = %lu")));
    v135 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v136, CFSTR("category"), 1, CFSTR("placeUserType"), 1));
    v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "filteredArrayUsingPredicate:", v135));
    v133 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
    v222 = v133;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v222, 1));
    v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "sortedArrayUsingDescriptors:", v18));

    v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = objc_msgSend(v153, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "H@H: Found %lu visit events", buf, 0xCu);
    }

    if (objc_msgSend(v153, "count"))
    {
      v147 = objc_opt_new(NSMutableArray);
      v206 = 0u;
      v207 = 0u;
      v204 = 0u;
      v205 = 0u;
      obj = v144;
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v204, v221, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v205;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(_QWORD *)v205 != v23)
              objc_enumerationMutation(obj);
            v25 = *(void **)(*((_QWORD *)&v204 + 1) + 8 * (_QWORD)i);
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "patterns"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("kEventPatternAnomalyFeatureType")));
            if (objc_msgSend(v27, "unsignedIntValue") == 4)
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "startDate"));
              if ((objc_msgSend(v28, "isOnOrAfter:", v165) & 1) != 0)
              {
                v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "endDate"));
                v30 = objc_msgSend(v29, "isOnOrBefore:", v154);

                if (v30)
                  -[NSMutableArray addObject:](v147, "addObject:", v25);
              }
              else
              {

              }
            }
            else
            {

            }
          }
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v204, v221, 16);
        }
        while (v22);
      }

      v31 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        v33 = -[NSMutableArray count](v147, "count");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "H@H: Found %lu H@H pattern events with complete context available for bundling", buf, 0xCu);
      }

      if (-[NSMutableArray count](v147, "count"))
      {
        v148 = objc_opt_new(NSMutableArray);
        v202 = 0u;
        v203 = 0u;
        v200 = 0u;
        v201 = 0u;
        v146 = v147;
        v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v146, "countByEnumeratingWithState:objects:count:", &v200, v220, 16);
        if (!v34)
          goto LABEL_75;
        v152 = *(_QWORD *)v201;
        while (1)
        {
          v35 = 0;
          do
          {
            if (*(_QWORD *)v201 != v152)
            {
              v36 = v35;
              objc_enumerationMutation(v146);
              v35 = v36;
            }
            v163 = v35;
            v37 = *(void **)(*((_QWORD *)&v200 + 1) + 8 * v35);
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            v217 = __Block_byref_object_copy__31;
            v218 = __Block_byref_object_dispose__31;
            v219 = objc_opt_new(NSMutableArray);
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "startDate"));
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "endDate"));
            v199[0] = _NSConcreteStackBlock;
            v199[1] = 3221225472;
            v199[2] = __123__MOHostingAtHomeManager__performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke;
            v199[3] = &unk_1002AF7A8;
            v199[4] = buf;
            +[MOContextAnnotationUtilities filterEventsIntersectingDateRange:rangeStart:rangeEnd:handler:](MOContextAnnotationUtilities, "filterEventsIntersectingDateRange:rangeStart:rangeEnd:handler:", v153, v38, v39, v199);

            if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"))
            {
              v40 = objc_opt_new(NSMutableArray);
              -[NSMutableArray addObject:](v40, "addObject:", v37);
              -[NSMutableArray addObjectsFromArray:](v40, "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
              v162 = v40;
              v41 = [MOEventBundle alloc];
              v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
              v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
              v44 = -[MOEventBundle initWithBundleIdentifier:creationDate:](v41, "initWithBundleIdentifier:creationDate:", v42, v43);

              -[MOEventBundle setEvents:](v44, "setEvents:", v162);
              -[MOEventBundle setInterfaceType:](v44, "setInterfaceType:", 7);
              -[MOEventBundle setBundleSubType:](v44, "setBundleSubType:", 503);
              -[MOEventBundle setBundleSuperType:](v44, "setBundleSuperType:", 5);
              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "startDate"));
              v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "dateByAddingTimeInterval:", -7200.0));
              -[MOEventBundle setStartDate:](v44, "setStartDate:", v46);

              v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "endDate"));
              v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "dateByAddingTimeInterval:", 7200.0));
              -[MOEventBundle setEndDate:](v44, "setEndDate:", v48);

              v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "startDate"));
              v50 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeForDate:timeZoneManager:](MOTime, "timeForDate:timeZoneManager:", v49, v149));
              -[MOEventBundle setTime:](v44, "setTime:", v50);

              v51 = -[MOAction initWithActionName:actionType:actionSubtype:]([MOAction alloc], "initWithActionName:actionType:actionSubtype:", CFSTR("Hosting at Home"), 1, 9);
              -[MOEventBundle setAction:](v44, "setAction:", v51);

              v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "firstObject"));
              v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "eventIdentifier"));
              v54 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v44, "action"));
              objc_msgSend(v54, "setSourceEventIdentifier:", v53);

              v55 = [MOPlace alloc];
              v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "firstObject"));
              v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "location"));
              v58 = -[MOPlace initWithPlaceName:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:](v55, "initWithPlaceName:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:", CFSTR("Home"), 1, 1, v57, 1, 0, -1.0, -1.0, 0.0);
              -[MOEventBundle setPlace:](v44, "setPlace:", v58);

              v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "firstObject"));
              v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "eventIdentifier"));
              v61 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v44, "place"));
              objc_msgSend(v61, "setSourceEventIdentifier:", v60);

              v62 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v44, "startDate"));
              v63 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](v44, "endDate"));
              v161 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities predicateOfEventsWithPlaySessionsWithStartDate:endData:](MOContextAnnotationUtilities, "predicateOfEventsWithPlaySessionsWithStartDate:endData:", v62, v63));

              v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "filteredArrayUsingPredicate:", v161));
              if (objc_msgSend(v156, "count"))
              {
                *(float *)&v64 = self->_mediaDurationThreshold;
                v65 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities annotateEventBundle:dateIntervalEvents:playbackMediaEvents:mediaDurationThreshold:](MOContextAnnotationUtilities, "annotateEventBundle:dateIntervalEvents:playbackMediaEvents:mediaDurationThreshold:", v44, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v156, v64));
                if (objc_msgSend(v65, "count"))
                  -[MOEventBundle addEvents:](v44, "addEvents:", v65);

              }
              v66 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v44, "startDate"));
              v67 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](v44, "endDate"));
              v160 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities predicateOfEmotionLogsWithStartDate:endDate:](MOContextAnnotationUtilities, "predicateOfEmotionLogsWithStartDate:endDate:", v66, v67));

              v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "filteredArrayUsingPredicate:", v160));
              v68 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
              -[MOHostingAtHomeManager emotionAttachmentBundleDurationThreshold](self, "emotionAttachmentBundleDurationThreshold");
              *(float *)&v69 = v69;
              v70 = objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities annotateEventBundle:dateIntervalEvents:emotionEvents:bundleDurationThreshold:](MOContextAnnotationUtilities, "annotateEventBundle:dateIntervalEvents:emotionEvents:bundleDurationThreshold:", v44, v68, v159, v69));
              -[MOEventBundle addEvents:](v44, "addEvents:", v70);
              obja = (id)v70;
              v71 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              v72 = objc_claimAutoreleasedReturnValue(v71);
              if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
              {
                v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "startDate"));
                v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "endDate"));
                *(_DWORD *)v212 = 138412546;
                *(_QWORD *)&v212[4] = v73;
                *(_WORD *)&v212[12] = 2112;
                *(_QWORD *)&v212[14] = v74;
                _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "H@H: Created bundle for range %@ to %@", v212, 0x16u);

              }
              *(_QWORD *)v212 = 0;
              *(_QWORD *)&v212[8] = v212;
              *(_QWORD *)&v212[16] = 0x3032000000;
              v213 = __Block_byref_object_copy__31;
              v214 = __Block_byref_object_dispose__31;
              v215 = objc_opt_new(NSMutableArray);
              v195 = 0;
              v196 = &v195;
              v197 = 0x2020000000;
              v198 = 0;
              v189 = 0;
              v190 = &v189;
              v191 = 0x3032000000;
              v192 = __Block_byref_object_copy__31;
              v193 = __Block_byref_object_dispose__31;
              v194 = objc_opt_new(NSMutableArray);
              v183 = 0;
              v184 = &v183;
              v185 = 0x3032000000;
              v186 = __Block_byref_object_copy__31;
              v187 = __Block_byref_object_dispose__31;
              v188 = 0;
              v177 = 0;
              v178 = &v177;
              v179 = 0x3032000000;
              v180 = __Block_byref_object_copy__31;
              v181 = __Block_byref_object_dispose__31;
              v182 = 0;
              v75 = -[MOEventBundle copy](v44, "copy");
              fUniverse = self->_fUniverse;
              v176[0] = _NSConcreteStackBlock;
              v176[1] = 3221225472;
              v176[2] = __123__MOHostingAtHomeManager__performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke_116;
              v176[3] = &unk_1002AF7D0;
              v176[4] = v212;
              v176[5] = &v195;
              v176[6] = &v189;
              v176[7] = &v183;
              v176[8] = &v177;
              +[MOContextAnnotationUtilities addPhotoResources:universe:handler:](MOContextAnnotationUtilities, "addPhotoResources:universe:handler:", v75, fUniverse, v176);

              -[MOEventBundle setPhotoSource:](v44, "setPhotoSource:", v196[3]);
              v77 = objc_msgSend((id)v190[5], "copy");
              -[MOEventBundle setPhotoTraits:](v44, "setPhotoTraits:", v77);

              v78 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              v79 = objc_claimAutoreleasedReturnValue(v78);
              if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
              {
                v80 = v196[3];
                *(_DWORD *)v210 = 134217984;
                v211 = v80;
                _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_INFO, "H@H: photoSource, %lu", v210, 0xCu);
              }

              v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "startDate"));
              -[MOEventBundle setStartDate:](v44, "setStartDate:", v81);

              v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "endDate"));
              -[MOEventBundle setEndDate:](v44, "setEndDate:", v82);

              photosCurationScoreThreshold = self->_photosCurationScoreThreshold;
              *(float *)&photosCurationScoreThreshold = photosCurationScoreThreshold;
              v84 = (void *)objc_claimAutoreleasedReturnValue(+[MOPhotosAtHomeManager chooseResourcesWithGoodPhotos:withPhotoCurationScore:andFaceCount:numPhotosThreshold:](MOPhotosAtHomeManager, "chooseResourcesWithGoodPhotos:withPhotoCurationScore:andFaceCount:numPhotosThreshold:", *(_QWORD *)(*(_QWORD *)&v212[8] + 40), self->_photosFaceCountThreshold, self->_photosCountThreshold, photosCurationScoreThreshold));
              -[MOEventBundle setResources:](v44, "setResources:", v84);

              v174 = 0u;
              v175 = 0u;
              v172 = 0u;
              v173 = 0u;
              v85 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v44, "resources"));
              v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v172, v209, 16);
              if (v86)
              {
                v87 = *(_QWORD *)v173;
                v88 = 0.0;
                do
                {
                  for (j = 0; j != v86; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v173 != v87)
                      objc_enumerationMutation(v85);
                    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v172 + 1) + 8 * (_QWORD)j), "photoCurationScore"));
                    objc_msgSend(v90, "floatValue");
                    v92 = v91;

                    v88 = v88 + v92;
                  }
                  v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v172, v209, 16);
                }
                while (v86);
              }
              else
              {
                v88 = 0.0;
              }

              v93 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v44, "resources"));
              v94 = objc_msgSend(v93, "count") == 0;

              if (!v94)
              {
                v96 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v44, "resources"));
                v97 = objc_msgSend(v96, "count");

                v88 = v88 / (float)(unint64_t)v97;
              }
              *(float *)&v95 = v88;
              v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v95));
              -[MOEventBundle addMetaDataForRankForKey:value:](v44, "addMetaDataForRankForKey:value:", CFSTR("PhotosAtHomeCurationScore"), v98);

              if (objc_msgSend(obja, "count"))
              {
                +[MOContextAnnotationUtilities addStateOfMindResourceForBundle:withEmotionEvents:](MOContextAnnotationUtilities, "addStateOfMindResourceForBundle:withEmotionEvents:", v44, obja);
                +[MOContextAnnotationUtilities addStateOfMindMetaDataForRankForBundle:withEmotionEvents:](MOContextAnnotationUtilities, "addStateOfMindMetaDataForRankForBundle:withEmotionEvents:", v44, obja);
              }
              v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("type"), 2));
              v100 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v44, "resources"));
              v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "filteredArrayUsingPredicate:", v99));

              v101 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("type"), 3));
              v102 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v44, "resources"));
              v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "filteredArrayUsingPredicate:", v101));
              v155 = (void *)v101;

              v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("type"), 16));
              v104 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v44, "resources"));
              v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "filteredArrayUsingPredicate:", v103));

              +[MOContextAnnotationUtilities assetPriorityScoringForTimeAtHomeBundlesWithBundle:withMediaResources:withPhotoResources:withEmotionResources:](MOContextAnnotationUtilities, "assetPriorityScoringForTimeAtHomeBundlesWithBundle:withMediaResources:withPhotoResources:withEmotionResources:", v44, v157, v158, v105);
              if (+[MOContextAnnotationUtilities isEvergreenBundle:](MOContextAnnotationUtilities, "isEvergreenBundle:", v44))
              {
                v106 = 504;
              }
              else
              {
                v106 = 503;
              }
              -[MOEventBundle setBundleSubType:](v44, "setBundleSubType:", v106);
              if (v184[5] && v178[5])
              {
                -[MOEventBundle setStartDate:](v44, "setStartDate:");
                v107 = (void *)v184[5];
                if (v107 == (void *)v178[5])
                {
                  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "dateByAddingTimeInterval:", 5.0));
                  -[MOEventBundle setEndDate:](v44, "setEndDate:", v108);

                }
                else
                {
                  -[MOEventBundle setEndDate:](v44, "setEndDate:");
                }
              }
              v109 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v44, "resources"));
              v110 = objc_msgSend(v109, "count") == 0;

              if (v110)
                goto LABEL_71;
              v111 = v99;
              v170 = 0u;
              v171 = 0u;
              v168 = 0u;
              v169 = 0u;
              v112 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v44, "resources"));
              v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v168, v208, 16);
              if (!v113)
              {

                goto LABEL_71;
              }
              v114 = 0;
              v115 = *(_QWORD *)v169;
              do
              {
                for (k = 0; k != v113; k = (char *)k + 1)
                {
                  if (*(_QWORD *)v169 != v115)
                    objc_enumerationMutation(v112);
                  if (objc_msgSend(*(id *)(*((_QWORD *)&v168 + 1) + 8 * (_QWORD)k), "type") == (id)2)
                    ++v114;
                }
                v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v168, v208, 16);
              }
              while (v113);

              v99 = v111;
              if (!v114)
LABEL_71:
                -[MOEventBundle setIsAggregatedAndSuppressed:](v44, "setIsAggregatedAndSuppressed:", 1);
              -[NSMutableArray addObject:](v148, "addObject:", v44);

              _Block_object_dispose(&v177, 8);
              _Block_object_dispose(&v183, 8);

              _Block_object_dispose(&v189, 8);
              _Block_object_dispose(&v195, 8);
              _Block_object_dispose(v212, 8);

            }
            _Block_object_dispose(buf, 8);

            v35 = v163 + 1;
          }
          while ((id)(v163 + 1) != v34);
          v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v146, "countByEnumeratingWithState:objects:count:", &v200, v220, 16);
          if (!v34)
          {
LABEL_75:

            v117 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
            v118 = (void *)objc_claimAutoreleasedReturnValue(-[MOHostingAtHomeManager dedupeHostingAtHomeBundles:withEvents:withCalendar:](self, "dedupeHostingAtHomeBundles:withEvents:withCalendar:", v148, v145, v117));
            v119 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            v120 = objc_claimAutoreleasedReturnValue(v119);
            if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
            {
              v122 = (objc_class *)objc_opt_class(self, v121);
              v123 = NSStringFromClass(v122);
              v124 = (void *)objc_claimAutoreleasedReturnValue(v123);
              v125 = objc_msgSend(v118, "count");
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v124;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v125;
              _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_INFO, "H@H(%@): Event Bundles, %lu", buf, 0x16u);

            }
            v126 = objc_msgSend(v118, "copy");
            v137[2](v137, v126, 0);

            goto LABEL_87;
          }
        }
      }
      v131 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v132 = objc_claimAutoreleasedReturnValue(v131);
      if (os_log_type_enabled(v132, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_INFO, "H@H: Exiting bundling due to no pattern events with complete context available for bundling", buf, 2u);
      }

      v137[2](v137, &__NSArray0__struct, 0);
LABEL_87:

    }
    else
    {
      v129 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v130 = objc_claimAutoreleasedReturnValue(v129);
      if (os_log_type_enabled(v130, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v130, OS_LOG_TYPE_INFO, "H@H: Exiting bundling due to no visit events", buf, 2u);
      }

      v137[2](v137, &__NSArray0__struct, 0);
    }

  }
  else
  {
    v127 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v128 = objc_claimAutoreleasedReturnValue(v127);
    if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_INFO, "H@H: Exiting bundling due to no visit pattern events", buf, 2u);
    }

    v137[2](v137, &__NSArray0__struct, 0);
  }

}

void __123__MOHostingAtHomeManager__performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke(uint64_t a1, void *a2)
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
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "H@H: Found %lu visit events overlapping anomaly time range", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObjectsFromArray:", v3);
  }

}

void __123__MOHostingAtHomeManager__performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke_116(_QWORD *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;

  v11 = a2;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = *(_QWORD *)(a1[4] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v11;
  v25 = v11;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
  v17 = *(_QWORD *)(a1[6] + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v12;
  v19 = v12;

  v20 = *(_QWORD *)(a1[7] + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v13;
  v22 = v13;

  v23 = *(_QWORD *)(a1[8] + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v14;

}

- (id)dedupeHostingAtHomeBundles:(id)a3 withEvents:(id)a4 withCalendar:(id)a5
{
  id v7;
  id v8;
  NSMutableArray *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  id os_log;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  const char *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  _BOOL4 v37;
  NSObject *v38;
  const char *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  id v48;
  _BOOL4 v49;
  void *v50;
  id v51;
  id v53;
  id v54;
  id v55;
  id v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  id v61;

  v7 = a3;
  v8 = a4;
  v56 = a5;
  if ((unint64_t)objc_msgSend(v7, "count") > 1)
  {
    v54 = v8;
    v53 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
    v61 = v53;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v61, 1));
    v55 = v7;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortedArrayUsingDescriptors:", v10));

    v9 = objc_opt_new(NSMutableArray);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
    if ((unint64_t)objc_msgSend(v11, "count") < 2)
    {
LABEL_30:

      v8 = v54;
      v7 = v55;
      goto LABEL_31;
    }
    v13 = 1;
    v14 = 1;
    while (1)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", v13));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startDate"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dateByAddingTimeInterval:", -10800.0));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dateByAddingTimeInterval:", -10800.0));
      v20 = objc_msgSend(v56, "isDate:inSameDayAsDate:", v17, v19);

      if ((v20 & 1) == 0)
      {
        -[NSMutableArray addObject:](v9, "addObject:", v12);
        v31 = v15;
LABEL_28:
        v51 = v31;

        v12 = v51;
        goto LABEL_29;
      }
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v22 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v58 = v12;
        v59 = 2112;
        v60 = v15;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "H@H: Found bundles on same day, %@ to %@", buf, 0x16u);
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "resources"));
      v24 = objc_msgSend(v23, "count");
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "resources"));
      v26 = objc_msgSend(v25, "count");

      if (v24 > v26)
      {
        v27 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v58 = v15;
          v29 = v28;
          v30 = "H@H: Adding bundle to return array because greater resource count, %@";
          goto LABEL_20;
        }
        goto LABEL_21;
      }
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "resources"));
      v33 = objc_msgSend(v32, "count");
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "resources"));
      v35 = objc_msgSend(v34, "count");

      v36 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v28 = objc_claimAutoreleasedReturnValue(v36);
      v37 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
      if (v33 <= v35)
      {
        if (v37)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "H@H: Bundle resource counts are equal so de-dupe based on timespan", buf, 2u);
        }

        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "endDate"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startDate"));
        objc_msgSend(v40, "timeIntervalSinceDate:", v41);
        v43 = v42;

        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "endDate"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));
        objc_msgSend(v44, "timeIntervalSinceDate:", v45);
        v47 = v46;

        v48 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v28 = objc_claimAutoreleasedReturnValue(v48);
        v49 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
        if (v47 > v43)
        {
          if (v49)
          {
            *(_DWORD *)buf = 138412290;
            v58 = v15;
            v29 = v28;
            v30 = "H@H: Adding bundle to return array because of broader timespan, %@";
LABEL_20:
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, v30, buf, 0xCu);
          }
LABEL_21:
          v50 = v15;
          goto LABEL_26;
        }
        if (v49)
        {
          *(_DWORD *)buf = 138412290;
          v58 = v12;
          v38 = v28;
          v39 = "H@H: Adding bundle to return array because of broader timespan, %@";
          goto LABEL_24;
        }
      }
      else if (v37)
      {
        *(_DWORD *)buf = 138412290;
        v58 = v12;
        v38 = v28;
        v39 = "H@H: Adding bundle to return array because greater resource count, %@";
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, v39, buf, 0xCu);
      }
      v50 = v12;
LABEL_26:

      -[NSMutableArray addObject:](v9, "addObject:", v50);
      if ((unint64_t)objc_msgSend(v11, "count") > ++v14)
      {
        v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", v14));
        goto LABEL_28;
      }
LABEL_29:

      v13 = ++v14;
      if ((unint64_t)objc_msgSend(v11, "count") <= v14)
        goto LABEL_30;
    }
  }
  v9 = (NSMutableArray *)v7;
LABEL_31:

  return v9;
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
