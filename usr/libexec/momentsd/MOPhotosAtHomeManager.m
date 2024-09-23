@implementation MOPhotosAtHomeManager

- (MOPhotosAtHomeManager)initWithUniverse:(id)a3
{
  id v5;
  MOPhotosAtHomeManager *v6;
  MOPhotosAtHomeManager *v7;
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
  v36.super_class = (Class)MOPhotosAtHomeManager;
  v6 = -[MOPhotosAtHomeManager init](&v36, "init");
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
    LODWORD(v31) = 1163984896;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v7->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("Photos_DurationAtHomeSecThreshold"), v31);
    v33 = v32;
    v7->_photosDurationAtHomeSecThreshold = v33;
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
  v17 = objc_claimAutoreleasedReturnValue(-[MOPhotosAtHomeManager queue](self, "queue"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __121__MOPhotosAtHomeManager_performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke;
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

void __121__MOPhotosAtHomeManager_performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke(uint64_t a1)
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
  v6[2] = __121__MOPhotosAtHomeManager_performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke_2;
  v6[3] = &unk_1002ADFD8;
  v5 = *(_QWORD *)(a1 + 64);
  v7 = *(id *)(a1 + 72);
  objc_msgSend(v1, "_performAnnotationWithEvents:withPatternEvents:withBundleWindowStart:withBundleWindowEnd:handler:", v2, v3, v4, v5, v6);

}

uint64_t __121__MOPhotosAtHomeManager_performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 withBundleWindowStart:(id)a5 withBundleWindowEnd:(id)a6 handler:(id)a7
{
  void *v11;
  id os_log;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  double photosDurationAtHomeSecThreshold;
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  id v29;
  id v30;
  NSObject *v31;
  id v32;
  void *v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void *v35;
  uint64_t v36;
  objc_class *v37;
  NSString *v38;
  void *v39;
  unint64_t i;
  void *v41;
  id v42;
  NSObject *v43;
  MOEventBundle *v44;
  void *v45;
  void *v46;
  MOEventBundle *v47;
  void *v48;
  void *v49;
  MOAction *v50;
  void *v51;
  void *v52;
  void *v53;
  MOPlace *v54;
  void *v55;
  void *v56;
  MOPlace *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  void *v65;
  id v66;
  NSObject *v67;
  MODaemonUniverse *fUniverse;
  id v69;
  NSObject *v70;
  uint64_t v71;
  id v72;
  double photosCurationScoreThreshold;
  void *v74;
  void *v75;
  id v76;
  uint64_t v77;
  float v78;
  void *j;
  void *v80;
  float v81;
  float v82;
  void *v83;
  BOOL v84;
  double v85;
  void *v86;
  id v87;
  void *v88;
  double v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  BOOL v100;
  id v101;
  NSObject *v102;
  uint64_t v103;
  objc_class *v104;
  NSString *v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  id v115;
  id v116;
  void *v117;
  id v118;
  void *v119;
  id v120;
  id v121;
  void (**v122)(id, void *, _QWORD);
  void *v123;
  void *v124;
  void *v125;
  id v126;
  id v127;
  NSMutableArray *v128;
  void *v129;
  void *v130;
  unint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v138;
  id v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  _QWORD v144[9];
  uint64_t v145;
  uint64_t *v146;
  uint64_t v147;
  uint64_t (*v148)(uint64_t, uint64_t);
  void (*v149)(uint64_t);
  id v150;
  uint64_t v151;
  uint64_t *v152;
  uint64_t v153;
  uint64_t (*v154)(uint64_t, uint64_t);
  void (*v155)(uint64_t);
  id v156;
  uint64_t v157;
  uint64_t *v158;
  uint64_t v159;
  uint64_t (*v160)(uint64_t, uint64_t);
  void (*v161)(uint64_t);
  NSMutableArray *v162;
  uint64_t v163;
  uint64_t *v164;
  uint64_t v165;
  uint64_t v166;
  _QWORD v167[4];
  id v168;
  id v169;
  _QWORD *v170;
  _BYTE *v171;
  uint64_t *v172;
  uint64_t *v173;
  uint64_t *v174;
  uint64_t v175;
  uint64_t *v176;
  uint64_t v177;
  int v178;
  _QWORD v179[3];
  char v180;
  uint64_t v181;
  uint64_t *v182;
  uint64_t v183;
  uint64_t (*v184)(uint64_t, uint64_t);
  void (*v185)(uint64_t);
  NSMutableArray *v186;
  uint64_t v187;
  uint64_t *v188;
  uint64_t v189;
  uint64_t (*v190)(uint64_t, uint64_t);
  void (*v191)(uint64_t);
  NSMutableArray *v192;
  uint8_t v193[128];
  uint8_t v194[4];
  uint64_t v195;
  _BYTE v196[24];
  uint64_t (*v197)(uint64_t, uint64_t);
  void (*v198)(uint64_t);
  NSMutableArray *v199;
  _BYTE buf[24];
  uint64_t (*v201)(uint64_t, uint64_t);
  void (*v202)(uint64_t);
  NSMutableArray *v203;
  id v204;

  v126 = a3;
  v114 = a4;
  v121 = a5;
  v120 = a6;
  v122 = (void (**)(id, void *, _QWORD))a7;
  v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("%K = %lu"), CFSTR(" AND %K = %lu")));
  v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v125, CFSTR("category"), 1, CFSTR("placeUserType"), 1));
  v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "filteredArrayUsingPredicate:", v124));
  v115 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
  v204 = v115;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v204, 1));
  v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "sortedArrayUsingDescriptors:", v11));

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v13 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = objc_msgSend(v133, "count");
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "P@H: Found %lu visit events", buf, 0xCu);
  }

  if (objc_msgSend(v133, "count"))
  {
    v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 24));
    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "filteredArrayUsingPredicate:", v113));
    v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("stateOfMindEvent.reflectiveInterval = %d"), 1));
    v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "filteredArrayUsingPredicate:", v111));
    v128 = objc_opt_new(NSMutableArray);
    v127 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
    v110 = v121;
    v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "components:fromDate:", 28));
    objc_msgSend(v119, "setHour:", 3);
    v118 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "dateFromComponents:", v119));
    v139 = v118;
    if (objc_msgSend(v118, "isBeforeDate:", v110))
    {
      v139 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v118, 86400.0));

    }
    v109 = v120;
    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "components:fromDate:", 28));
    objc_msgSend(v117, "setHour:", 3);
    v116 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "dateFromComponents:", v117));
    v132 = v116;
    if (objc_msgSend(v116, "isAfterDate:", v109))
    {
      v132 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v116, -86400.0));

    }
    v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "firstObject"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startDate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "lastObject"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "endDate"));
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v19;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "P@H: Source event time span: range start %@, range end %@", buf, 0x16u);

    }
    v20 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v139;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v132;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "P@H: Time span for bundling: range start %@, range end %@", buf, 0x16u);
    }

    if (objc_msgSend(v132, "isOnOrBefore:", v139))
    {
      v22 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v139;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v132;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "P@H: Range end is on or before range start so exiting bundling: range start %@, range end %@", buf, 0x16u);
      }

      v122[2](v122, &__NSArray0__struct, 0);
    }
    else
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v201 = __Block_byref_object_copy__36;
      v202 = __Block_byref_object_dispose__36;
      v203 = objc_opt_new(NSMutableArray);
      v187 = 0;
      v188 = &v187;
      v189 = 0x3032000000;
      v190 = __Block_byref_object_copy__36;
      v191 = __Block_byref_object_dispose__36;
      v192 = objc_opt_new(NSMutableArray);
      v181 = 0;
      v182 = &v181;
      v183 = 0x3032000000;
      v184 = __Block_byref_object_copy__36;
      v185 = __Block_byref_object_dispose__36;
      v186 = objc_opt_new(NSMutableArray);
      v179[0] = 0;
      v179[1] = v179;
      v179[2] = 0x2020000000;
      v180 = 0;
      v175 = 0;
      v176 = &v175;
      v177 = 0x2020000000;
      v178 = 0;
      v138 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v139, 86400.0));
      while (objc_msgSend(v138, "isOnOrBefore:", v132))
      {
        photosDurationAtHomeSecThreshold = self->_photosDurationAtHomeSecThreshold;
        v167[0] = _NSConcreteStackBlock;
        v167[1] = 3221225472;
        v167[2] = __122__MOPhotosAtHomeManager__performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke;
        v167[3] = &unk_1002B5388;
        v170 = v179;
        v171 = buf;
        v25 = v139;
        v168 = v25;
        v172 = &v187;
        v26 = v138;
        v169 = v26;
        v173 = &v181;
        v174 = &v175;
        +[MOContextAnnotationUtilities filterEventsIntersectingDateRange:rangeStart:rangeEnd:eventInterval:handler:](MOContextAnnotationUtilities, "filterEventsIntersectingDateRange:rangeStart:rangeEnd:eventInterval:handler:", v133, v25, v26, v167, photosDurationAtHomeSecThreshold);
        v139 = v26;

        v138 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v139, 86400.0));
      }
      v27 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = objc_msgSend((id)v182[5], "count");
        *(_DWORD *)v196 = 134217984;
        *(_QWORD *)&v196[4] = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "P@H: Built %lu grouped events", v196, 0xCu);
      }

      if (objc_msgSend((id)v182[5], "count"))
      {
        v30 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          v32 = objc_msgSend((id)v182[5], "count");
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "firstObject"));
          v34 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(objc_msgSend((id)v188[5], "lastObject"));
          *(_DWORD *)v196 = 134218498;
          *(_QWORD *)&v196[4] = v32;
          *(_WORD *)&v196[12] = 2112;
          *(_QWORD *)&v196[14] = v33;
          *(_WORD *)&v196[22] = 2112;
          v197 = v34;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "P@H: Grouped %lu events for range %@ to %@", v196, 0x20u);

        }
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotosAtHomeManager fUniverse](self, "fUniverse"));
        v37 = (objc_class *)objc_opt_class(MOTimeZoneManager, v36);
        v38 = NSStringFromClass(v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
        v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "getService:", v39));

        for (i = 0; (unint64_t)objc_msgSend((id)v182[5], "count") > i; i = v131 + 1)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v182[5], "objectAtIndex:", i));
          v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "objectAtIndex:", i));
          v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v188[5], "objectAtIndex:", i));
          v42 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v43 = objc_claimAutoreleasedReturnValue(v42);
          v131 = i;
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v196 = 138412546;
            *(_QWORD *)&v196[4] = v136;
            *(_WORD *)&v196[12] = 2112;
            *(_QWORD *)&v196[14] = v135;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "P@H: Annotating grouped events for range %@ to %@", v196, 0x16u);
          }

          v44 = [MOEventBundle alloc];
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          v47 = -[MOEventBundle initWithBundleIdentifier:creationDate:](v44, "initWithBundleIdentifier:creationDate:", v45, v46);

          -[MOEventBundle setInterfaceType:](v47, "setInterfaceType:", 7);
          -[MOEventBundle setStartDate:](v47, "setStartDate:", v136);
          -[MOEventBundle setEndDate:](v47, "setEndDate:", v135);
          v48 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v47, "startDate"));
          v49 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeForDate:timeZoneManager:](MOTime, "timeForDate:timeZoneManager:", v48, v129));
          -[MOEventBundle setTime:](v47, "setTime:", v49);

          -[MOEventBundle setPromptLanguage:](v47, "setPromptLanguage:", CFSTR("Photos at Home"));
          v50 = -[MOAction initWithActionName:actionType:actionSubtype:]([MOAction alloc], "initWithActionName:actionType:actionSubtype:", CFSTR("Photos at Home"), 1, 8);
          -[MOEventBundle setAction:](v47, "setAction:", v50);

          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "firstObject"));
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "eventIdentifier"));
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v47, "action"));
          objc_msgSend(v53, "setSourceEventIdentifier:", v52);

          v54 = [MOPlace alloc];
          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "firstObject"));
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "location"));
          v57 = -[MOPlace initWithPlaceName:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:](v54, "initWithPlaceName:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:", CFSTR("Home"), 1, 1, v56, 1, 0, -1.0, -1.0, 0.0);
          -[MOEventBundle setPlace:](v47, "setPlace:", v57);

          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "firstObject"));
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "eventIdentifier"));
          v60 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v47, "place"));
          objc_msgSend(v60, "setSourceEventIdentifier:", v59);

          -[MOEventBundle setEvents:](v47, "setEvents:", v41);
          -[MOEventBundle setTimeAtHomeSubType:](v47, "setTimeAtHomeSubType:", 2);
          -[MOEventBundle setBundleSubType:](v47, "setBundleSubType:", 502);
          -[MOEventBundle setBundleSuperType:](v47, "setBundleSuperType:", 5);
          v61 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v47, "startDate"));
          v62 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](v47, "endDate"));
          v134 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities predicateOfEmotionLogsWithStartDate:endDate:](MOContextAnnotationUtilities, "predicateOfEmotionLogsWithStartDate:endDate:", v61, v62));

          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "filteredArrayUsingPredicate:", v134));
          -[MOPhotosAtHomeManager emotionAttachmentBundleDurationThreshold](self, "emotionAttachmentBundleDurationThreshold");
          *(float *)&v64 = v64;
          v65 = (void *)objc_claimAutoreleasedReturnValue(+[MOContextAnnotationUtilities annotateEventBundle:dateIntervalEvents:emotionEvents:bundleDurationThreshold:](MOContextAnnotationUtilities, "annotateEventBundle:dateIntervalEvents:emotionEvents:bundleDurationThreshold:", v47, v41, v63, v64));
          -[MOEventBundle addEvents:](v47, "addEvents:", v65);
          v66 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v67 = objc_claimAutoreleasedReturnValue(v66);
          if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v196 = 138412546;
            *(_QWORD *)&v196[4] = v136;
            *(_WORD *)&v196[12] = 2112;
            *(_QWORD *)&v196[14] = v135;
            _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "P@H: Created bundle for range %@ to %@", v196, 0x16u);
          }

          *(_QWORD *)v196 = 0;
          *(_QWORD *)&v196[8] = v196;
          *(_QWORD *)&v196[16] = 0x3032000000;
          v197 = __Block_byref_object_copy__36;
          v198 = __Block_byref_object_dispose__36;
          v199 = objc_opt_new(NSMutableArray);
          v163 = 0;
          v164 = &v163;
          v165 = 0x2020000000;
          v166 = 0;
          v157 = 0;
          v158 = &v157;
          v159 = 0x3032000000;
          v160 = __Block_byref_object_copy__36;
          v161 = __Block_byref_object_dispose__36;
          v162 = objc_opt_new(NSMutableArray);
          v151 = 0;
          v152 = &v151;
          v153 = 0x3032000000;
          v154 = __Block_byref_object_copy__36;
          v155 = __Block_byref_object_dispose__36;
          v156 = 0;
          v145 = 0;
          v146 = &v145;
          v147 = 0x3032000000;
          v148 = __Block_byref_object_copy__36;
          v149 = __Block_byref_object_dispose__36;
          v150 = 0;
          fUniverse = self->_fUniverse;
          v144[0] = _NSConcreteStackBlock;
          v144[1] = 3221225472;
          v144[2] = __122__MOPhotosAtHomeManager__performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke_117;
          v144[3] = &unk_1002AF7D0;
          v144[4] = v196;
          v144[5] = &v163;
          v144[6] = &v157;
          v144[7] = &v151;
          v144[8] = &v145;
          +[MOContextAnnotationUtilities addPhotoResources:universe:handler:](MOContextAnnotationUtilities, "addPhotoResources:universe:handler:", v47, fUniverse, v144);
          v69 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v70 = objc_claimAutoreleasedReturnValue(v69);
          if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
          {
            v71 = v164[3];
            *(_DWORD *)v194 = 134217984;
            v195 = v71;
            _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "P@H,photoSource,%lu", v194, 0xCu);
          }

          -[MOEventBundle setPhotoSource:](v47, "setPhotoSource:", v164[3]);
          v72 = objc_msgSend((id)v158[5], "copy");
          -[MOEventBundle setPhotoTraits:](v47, "setPhotoTraits:", v72);

          photosCurationScoreThreshold = self->_photosCurationScoreThreshold;
          *(float *)&photosCurationScoreThreshold = photosCurationScoreThreshold;
          v74 = (void *)objc_claimAutoreleasedReturnValue(+[MOPhotosAtHomeManager chooseResourcesWithGoodPhotos:withPhotoCurationScore:andFaceCount:numPhotosThreshold:](MOPhotosAtHomeManager, "chooseResourcesWithGoodPhotos:withPhotoCurationScore:andFaceCount:numPhotosThreshold:", *(_QWORD *)(*(_QWORD *)&v196[8] + 40), self->_photosFaceCountThreshold, self->_photosCountThreshold, photosCurationScoreThreshold));
          -[MOEventBundle setResources:](v47, "setResources:", v74);

          v142 = 0u;
          v143 = 0u;
          v140 = 0u;
          v141 = 0u;
          v75 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v47, "resources"));
          v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v140, v193, 16);
          if (v76)
          {
            v77 = *(_QWORD *)v141;
            v78 = 0.0;
            do
            {
              for (j = 0; j != v76; j = (char *)j + 1)
              {
                if (*(_QWORD *)v141 != v77)
                  objc_enumerationMutation(v75);
                v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v140 + 1)
                                                                                   + 8 * (_QWORD)j), "photoCurationScore"));
                objc_msgSend(v80, "floatValue");
                v82 = v81;

                v78 = v78 + v82;
              }
              v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v140, v193, 16);
            }
            while (v76);
          }
          else
          {
            v78 = 0.0;
          }

          v83 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v47, "resources"));
          v84 = objc_msgSend(v83, "count") == 0;

          if (!v84)
          {
            v86 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v47, "resources"));
            v87 = objc_msgSend(v86, "count");

            v78 = v78 / (float)(unint64_t)v87;
          }
          *(float *)&v85 = v78;
          v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v85));
          -[MOEventBundle addMetaDataForRankForKey:value:](v47, "addMetaDataForRankForKey:value:", CFSTR("PhotosAtHomeCurationScore"), v88);

          LODWORD(v89) = *((_DWORD *)v176 + 6);
          v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v89));
          -[MOEventBundle addMetaDataForRankForKey:value:](v47, "addMetaDataForRankForKey:value:", CFSTR("TimeAtHomeDuration"), v90);

          if (objc_msgSend(v65, "count"))
          {
            +[MOContextAnnotationUtilities addStateOfMindResourceForBundle:withEmotionEvents:](MOContextAnnotationUtilities, "addStateOfMindResourceForBundle:withEmotionEvents:", v47, v65);
            +[MOContextAnnotationUtilities addStateOfMindMetaDataForRankForBundle:withEmotionEvents:](MOContextAnnotationUtilities, "addStateOfMindMetaDataForRankForBundle:withEmotionEvents:", v47, v65);
          }
          v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("type"), 2));
          v92 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v47, "resources"));
          v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "filteredArrayUsingPredicate:", v91));

          v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("type"), 16));
          v95 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v47, "resources"));
          v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "filteredArrayUsingPredicate:", v94));

          +[MOContextAnnotationUtilities assetPriorityScoringForTimeAtHomeBundlesWithBundle:withMediaResources:withPhotoResources:withEmotionResources:](MOContextAnnotationUtilities, "assetPriorityScoringForTimeAtHomeBundlesWithBundle:withMediaResources:withPhotoResources:withEmotionResources:", v47, &__NSArray0__struct, v93, v96);
          if (v152[5] && v146[5])
          {
            -[MOEventBundle setStartDate:](v47, "setStartDate:");
            v97 = (void *)v152[5];
            if (v97 == (void *)v146[5])
            {
              v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "dateByAddingTimeInterval:", 5.0));
              -[MOEventBundle setEndDate:](v47, "setEndDate:", v98);

            }
            else
            {
              -[MOEventBundle setEndDate:](v47, "setEndDate:");
            }
          }
          v99 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v47, "resources"));
          v100 = objc_msgSend(v99, "count") == 0;

          if (!v100)
            -[NSMutableArray addObject:](v128, "addObject:", v47);

          _Block_object_dispose(&v145, 8);
          _Block_object_dispose(&v151, 8);

          _Block_object_dispose(&v157, 8);
          _Block_object_dispose(&v163, 8);
          _Block_object_dispose(v196, 8);

        }
        v101 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v102 = objc_claimAutoreleasedReturnValue(v101);
        if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
        {
          v104 = (objc_class *)objc_opt_class(self, v103);
          v105 = NSStringFromClass(v104);
          v106 = (id)objc_claimAutoreleasedReturnValue(v105);
          v107 = -[NSMutableArray count](v128, "count");
          *(_DWORD *)v196 = 138412546;
          *(_QWORD *)&v196[4] = v106;
          *(_WORD *)&v196[12] = 2048;
          *(_QWORD *)&v196[14] = v107;
          _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_INFO, "P@H(%@): Event Bundles, %lu", v196, 0x16u);

        }
        v108 = -[NSMutableArray copy](v128, "copy");
        v122[2](v122, v108, 0);

      }
      else
      {
        v122[2](v122, &__NSArray0__struct, 0);
      }

      _Block_object_dispose(&v175, 8);
      _Block_object_dispose(v179, 8);
      _Block_object_dispose(&v181, 8);

      _Block_object_dispose(&v187, 8);
      _Block_object_dispose(buf, 8);

    }
  }
  else
  {
    v122[2](v122, &__NSArray0__struct, 0);
  }

}

void __122__MOPhotosAtHomeManager__performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke(_QWORD *a1, void *a2, char a3, float a4)
{
  id v7;
  id os_log;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;

  v7 = a2;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = a3 ^ 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "addObject:", a1[4]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "addObject:", a1[5]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1[9] + 8) + 40), "addObject:", v7);
  *(float *)(*(_QWORD *)(a1[10] + 8) + 24) = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(v7, "count");
    v11 = a1[4];
    v12 = a1[5];
    v13 = 134218498;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "P@H: Grouped %lu events for range %@ to %@", (uint8_t *)&v13, 0x20u);
  }

}

void __122__MOPhotosAtHomeManager__performAnnotationWithEvents_withPatternEvents_withBundleWindowStart_withBundleWindowEnd_handler___block_invoke_117(_QWORD *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
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
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "P@H, photoSource, %lu, startDate, %@, endDate, %@, count, %lu", (uint8_t *)&v19, 0x2Au);
  }

}

+ (id)chooseResourcesWithGoodPhotos:(id)a3 withPhotoCurationScore:(float)a4 andFaceCount:(unint64_t)a5 numPhotosThreshold:(unint64_t)a6
{
  id v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  float v17;
  float v18;
  id os_log;
  NSObject *v20;
  id v21;
  NSMutableArray *v22;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  double v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];

  v8 = a3;
  v9 = objc_opt_new(NSMutableArray);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "photoCurationScore"));
        objc_msgSend(v16, "floatValue");
        v18 = v17;

        if (v18 >= a4 || (unint64_t)objc_msgSend(v15, "photoFaceCount") >= a5)
          -[NSMutableArray addObject:](v9, "addObject:", v15);
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v20 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v21 = objc_msgSend(v15, "photoFaceCount");
          *(_DWORD *)buf = 134218240;
          v30 = v18;
          v31 = 2048;
          v32 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "P@H: Photo curationScore, %f, faceCount, %lu", buf, 0x16u);
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v12);
  }

  if ((unint64_t)-[NSMutableArray count](v9, "count") >= a6)
    v22 = v9;
  else
    v22 = (NSMutableArray *)&__NSArray0__struct;

  return v22;
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

- (double)photosDurationAtHomeSecThreshold
{
  return self->_photosDurationAtHomeSecThreshold;
}

- (void)setPhotosDurationAtHomeSecThreshold:(double)a3
{
  self->_photosDurationAtHomeSecThreshold = a3;
}

- (unint64_t)photosCountThreshold
{
  return self->_photosCountThreshold;
}

- (void)setPhotosCountThreshold:(unint64_t)a3
{
  self->_photosCountThreshold = a3;
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
