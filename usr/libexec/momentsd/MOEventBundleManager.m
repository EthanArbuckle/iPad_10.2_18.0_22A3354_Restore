@implementation MOEventBundleManager

- (BOOL)persistBundlingDataWithoutRandomization
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __73__MOEventBundleManager_DataDump__persistBundlingDataWithoutRandomization__block_invoke;
  block[3] = &unk_1002AD8A8;
  block[4] = self;
  if (persistBundlingDataWithoutRandomization_onceToken != -1)
    dispatch_once(&persistBundlingDataWithoutRandomization_onceToken, block);
  return persistBundlingDataWithoutRandomization_persistWithoutRandomization;
}

void __73__MOEventBundleManager_DataDump__persistBundlingDataWithoutRandomization__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultManager"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("BundlingDataPersistWithoutHashing")));
  persistBundlingDataWithoutRandomization_persistWithoutRandomization = objc_msgSend(v1, "BOOLValue");

}

- (id)getAllowedToPromptConfiguration
{
  NSMutableDictionary *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  id v112;
  void *v113;
  void *v114;
  NSMutableArray *v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _QWORD v121[3];
  _QWORD v122[3];
  _BYTE v123[128];

  v3 = objc_opt_new(NSMutableDictionary);
  v116 = objc_opt_new(NSMutableArray);
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v4 = objc_msgSend(&off_1002DC5D8, "countByEnumeratingWithState:objects:count:", &v117, v123, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v118;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v118 != v6)
          objc_enumerationMutation(&off_1002DC5D8);
        v8 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v9, "getBoolSettingForKey:withFallback:", v8, 0)));
        -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v10, v8);

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager defaultManager](self, "defaultManager"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v8));

        if (!v12)
          -[NSMutableArray addObject:](v116, "addObject:", v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(&off_1002DC5D8, "countByEnumeratingWithState:objects:count:", &v117, v123, 16);
    }
    while (v5);
  }
  v13 = objc_opt_new(NSMutableDictionary);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MOConfigurationManager getSensedEventSettingNameFromCategory:](MOConfigurationManager, "getSensedEventSettingNameFromCategory:", 0));
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
    v16 = objc_msgSend(v15, "isAllowedToPromptEventCategory:", 0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v16));
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v17, v14);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MOConfigurationManager getSensedEventSettingNameFromCategory:](MOConfigurationManager, "getSensedEventSettingNameFromCategory:", 1));
  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
    v20 = objc_msgSend(v19, "isAllowedToPromptEventCategory:", 1);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v20));
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v21, v18);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[MOConfigurationManager getSensedEventSettingNameFromCategory:](MOConfigurationManager, "getSensedEventSettingNameFromCategory:", 2));
  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
    v24 = objc_msgSend(v23, "isAllowedToPromptEventCategory:", 2);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v24));
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v25, v22);

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[MOConfigurationManager getSensedEventSettingNameFromCategory:](MOConfigurationManager, "getSensedEventSettingNameFromCategory:", 3));
  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
    v28 = objc_msgSend(v27, "isAllowedToPromptEventCategory:", 3);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v28));
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v29, v26);

  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[MOConfigurationManager getSensedEventSettingNameFromCategory:](MOConfigurationManager, "getSensedEventSettingNameFromCategory:", 4));
  if (v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
    v32 = objc_msgSend(v31, "isAllowedToPromptEventCategory:", 4);

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v32));
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v33, v30);

  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[MOConfigurationManager getSensedEventSettingNameFromCategory:](MOConfigurationManager, "getSensedEventSettingNameFromCategory:", 5));
  if (v34)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
    v36 = objc_msgSend(v35, "isAllowedToPromptEventCategory:", 5);

    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v36));
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v37, v34);

  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[MOConfigurationManager getSensedEventSettingNameFromCategory:](MOConfigurationManager, "getSensedEventSettingNameFromCategory:", 6));
  if (v38)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
    v40 = objc_msgSend(v39, "isAllowedToPromptEventCategory:", 6);

    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v40));
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v41, v38);

  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[MOConfigurationManager getSensedEventSettingNameFromCategory:](MOConfigurationManager, "getSensedEventSettingNameFromCategory:", 7));
  if (v42)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
    v44 = objc_msgSend(v43, "isAllowedToPromptEventCategory:", 7);

    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v44));
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v45, v42);

  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[MOConfigurationManager getSensedEventSettingNameFromCategory:](MOConfigurationManager, "getSensedEventSettingNameFromCategory:", 8));
  if (v46)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
    v48 = objc_msgSend(v47, "isAllowedToPromptEventCategory:", 8);

    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v48));
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v49, v46);

  }
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[MOConfigurationManager getSensedEventSettingNameFromCategory:](MOConfigurationManager, "getSensedEventSettingNameFromCategory:", 9));
  if (v50)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
    v52 = objc_msgSend(v51, "isAllowedToPromptEventCategory:", 9);

    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v52));
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v53, v50);

  }
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[MOConfigurationManager getSensedEventSettingNameFromCategory:](MOConfigurationManager, "getSensedEventSettingNameFromCategory:", 10));
  if (v54)
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
    v56 = objc_msgSend(v55, "isAllowedToPromptEventCategory:", 10);

    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v56));
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v57, v54);

  }
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[MOConfigurationManager getSensedEventSettingNameFromCategory:](MOConfigurationManager, "getSensedEventSettingNameFromCategory:", 11));
  if (v58)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
    v60 = objc_msgSend(v59, "isAllowedToPromptEventCategory:", 11);

    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v60));
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v61, v58);

  }
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[MOConfigurationManager getSensedEventSettingNameFromCategory:](MOConfigurationManager, "getSensedEventSettingNameFromCategory:", 12));
  if (v62)
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
    v64 = objc_msgSend(v63, "isAllowedToPromptEventCategory:", 12);

    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v64));
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v65, v62);

  }
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[MOConfigurationManager getSensedEventSettingNameFromCategory:](MOConfigurationManager, "getSensedEventSettingNameFromCategory:", 13));
  if (v66)
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
    v68 = objc_msgSend(v67, "isAllowedToPromptEventCategory:", 13);

    v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v68));
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v69, v66);

  }
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[MOConfigurationManager getSensedEventSettingNameFromCategory:](MOConfigurationManager, "getSensedEventSettingNameFromCategory:", 14));
  if (v70)
  {
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
    v72 = objc_msgSend(v71, "isAllowedToPromptEventCategory:", 14);

    v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v72));
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v73, v70);

  }
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[MOConfigurationManager getSensedEventSettingNameFromCategory:](MOConfigurationManager, "getSensedEventSettingNameFromCategory:", 15));
  if (v74)
  {
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
    v76 = objc_msgSend(v75, "isAllowedToPromptEventCategory:", 15);

    v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v76));
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v77, v74);

  }
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[MOConfigurationManager getSensedEventSettingNameFromCategory:](MOConfigurationManager, "getSensedEventSettingNameFromCategory:", 16));
  if (v78)
  {
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
    v80 = objc_msgSend(v79, "isAllowedToPromptEventCategory:", 16);

    v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v80));
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v81, v78);

  }
  v82 = (void *)objc_claimAutoreleasedReturnValue(+[MOConfigurationManager getSensedEventSettingNameFromCategory:](MOConfigurationManager, "getSensedEventSettingNameFromCategory:", 17));
  if (v82)
  {
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
    v84 = objc_msgSend(v83, "isAllowedToPromptEventCategory:", 17);

    v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v84));
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v85, v82);

  }
  v86 = (void *)objc_claimAutoreleasedReturnValue(+[MOConfigurationManager getSensedEventSettingNameFromCategory:](MOConfigurationManager, "getSensedEventSettingNameFromCategory:", 18));
  if (v86)
  {
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
    v88 = objc_msgSend(v87, "isAllowedToPromptEventCategory:", 18);

    v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v88));
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v89, v86);

  }
  v90 = (void *)objc_claimAutoreleasedReturnValue(+[MOConfigurationManager getSensedEventSettingNameFromCategory:](MOConfigurationManager, "getSensedEventSettingNameFromCategory:", 19));
  if (v90)
  {
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
    v92 = objc_msgSend(v91, "isAllowedToPromptEventCategory:", 19);

    v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v92));
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v93, v90);

  }
  v94 = (void *)objc_claimAutoreleasedReturnValue(+[MOConfigurationManager getSensedEventSettingNameFromCategory:](MOConfigurationManager, "getSensedEventSettingNameFromCategory:", 20));
  if (v94)
  {
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
    v96 = objc_msgSend(v95, "isAllowedToPromptEventCategory:", 20);

    v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v96));
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v97, v94);

  }
  v98 = (void *)objc_claimAutoreleasedReturnValue(+[MOConfigurationManager getSensedEventSettingNameFromCategory:](MOConfigurationManager, "getSensedEventSettingNameFromCategory:", 21));
  if (v98)
  {
    v99 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
    v100 = objc_msgSend(v99, "isAllowedToPromptEventCategory:", 21);

    v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v100));
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v101, v98);

  }
  v102 = (void *)objc_claimAutoreleasedReturnValue(+[MOConfigurationManager getSensedEventSettingNameFromCategory:](MOConfigurationManager, "getSensedEventSettingNameFromCategory:", 22));
  if (v102)
  {
    v103 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
    v104 = objc_msgSend(v103, "isAllowedToPromptEventCategory:", 22);

    v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v104));
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v105, v102);

  }
  v106 = (void *)objc_claimAutoreleasedReturnValue(+[MOConfigurationManager getSensedEventSettingNameFromCategory:](MOConfigurationManager, "getSensedEventSettingNameFromCategory:", 23));
  if (v106)
  {
    v107 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
    v108 = objc_msgSend(v107, "isAllowedToPromptEventCategory:", 23);

    v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v108));
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v109, v106);

  }
  v110 = (void *)objc_claimAutoreleasedReturnValue(+[MOConfigurationManager getSensedEventSettingNameFromCategory:](MOConfigurationManager, "getSensedEventSettingNameFromCategory:", 24));
  if (v110)
  {
    v111 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
    v112 = objc_msgSend(v111, "isAllowedToPromptEventCategory:", 24);

    v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v112));
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v113, v110);

  }
  v121[0] = CFSTR("Settings");
  v121[1] = CFSTR("Streams");
  v122[0] = v3;
  v122[1] = v13;
  v121[2] = CFSTR("UnknownSettings");
  v122[2] = v116;
  v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v122, v121, 3));

  return v114;
}

- (void)beginDataExport
{
  MODataExportManager *v3;
  id v4;

  if (+[MODataExportManager isServiceAvailable](MODataExportManager, "isServiceAvailable"))
  {
    v3 = objc_alloc_init(MODataExportManager);
    -[MOEventBundleManager setExportManager:](self, "setExportManager:", v3);

    v4 = (id)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager exportManager](self, "exportManager"));
    objc_msgSend(v4, "startDataExportSession");

  }
}

- (void)fetchAndPersistEventsForTimeInterval:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MOEventFetchOptions *v9;
  id os_log;
  NSObject *v11;
  MOPerformanceMeasurement *v12;
  void *v13;
  id v14;
  MOPerformanceMeasurement *v15;
  _QWORD v16[5];
  MOPerformanceMeasurement *v17;
  id v18;
  uint8_t *v19;
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  NSMutableArray *v25;

  v6 = a3;
  v7 = a4;
  v8 = objc_autoreleasePoolPush();
  v9 = -[MOEventFetchOptions initWithDateInterval:ascending:limit:]([MOEventFetchOptions alloc], "initWithDateInterval:ascending:limit:", v6, 1, 0);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerCaptureCurrentDBFetchEvents", ", buf, 2u);
  }

  v12 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CaptureCurrentDBFetchEvents"), 0);
  -[MOPerformanceMeasurement startSession](v12, "startSession");
  *(_QWORD *)buf = 0;
  v21 = buf;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v25 = objc_opt_new(NSMutableArray);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager eventManager](self, "eventManager"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __83__MOEventBundleManager_DataDump__fetchAndPersistEventsForTimeInterval_withHandler___block_invoke;
  v16[3] = &unk_1002AE028;
  v16[4] = self;
  v19 = buf;
  v14 = v7;
  v18 = v14;
  v15 = v12;
  v17 = v15;
  objc_msgSend(v13, "fetchEventsWithOptions:CompletionHandler:", v9, v16);

  _Block_object_dispose(buf, 8);
  objc_autoreleasePoolPop(v8);

}

void __83__MOEventBundleManager_DataDump__fetchAndPersistEventsForTimeInterval_withHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSMutableSet *v8;
  uint64_t v9;
  NSMutableSet *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id os_log;
  NSObject *v17;
  __int16 v18;
  _QWORD v19[5];
  NSMutableSet *v20;
  uint64_t v21;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
      (*(void (**)(uint64_t, id, _QWORD))(v7 + 16))(v7, v6, 0);
  }
  else
  {
    v8 = objc_opt_new(NSMutableSet);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __83__MOEventBundleManager_DataDump__fetchAndPersistEventsForTimeInterval_withHandler___block_invoke_2;
    v19[3] = &unk_1002AE000;
    v9 = *(_QWORD *)(a1 + 56);
    v19[4] = *(_QWORD *)(a1 + 32);
    v21 = v9;
    v10 = v8;
    v20 = v10;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "exportManager"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "exportManager"));
      objc_msgSend(v12, "addEventsToDataExportSession:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

    }
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = 0;

    v15 = *(_QWORD *)(a1 + 48);
    if (v15)
      (*(void (**)(uint64_t, _QWORD, NSMutableSet *))(v15 + 16))(v15, 0, v10);

  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v17 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v17))
  {
    v18 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerCaptureCurrentDBFetchEvents", ", (uint8_t *)&v18, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "endSession");
}

void __83__MOEventBundleManager_DataDump__fetchAndPersistEventsForTimeInterval_withHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)a1[4];
  v9 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "configurationManager"));
  v5 = objc_msgSend(v4, "isAllowedToPromptEventCategory:", objc_msgSend(v9, "category"));

  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v9);
  }
  else
  {
    v6 = (void *)a1[5];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "eventIdentifier"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
    objc_msgSend(v6, "addObject:", v8);

    v9 = v7;
  }

}

- (void)fetchAndPersistBundlesForTimeInterval:(id)a3 eventsIdsToDrop:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  MOEventBundleFetchOptions *v12;
  id os_log;
  NSObject *v14;
  MOPerformanceMeasurement *v15;
  id v16;
  MOPerformanceMeasurement *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  MOEventBundleManager *v21;
  MOPerformanceMeasurement *v22;
  id v23;
  _QWORD *v24;
  uint8_t buf[16];
  _QWORD v26[5];
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_autoreleasePoolPush();
  v12 = -[MOEventBundleFetchOptions initWithDateInterval:ascending:limit:filterBundle:]([MOEventBundleFetchOptions alloc], "initWithDateInterval:ascending:limit:filterBundle:", v8, 1, 0, 0);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__3;
  v26[4] = __Block_byref_object_dispose__3;
  v27 = 0;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v14 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerCaptureCurrentDBFetchEventBundles", ", buf, 2u);
  }

  v15 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CaptureCurrentDBFetchEventBundles"), 0);
  -[MOPerformanceMeasurement startSession](v15, "startSession");
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __100__MOEventBundleManager_DataDump__fetchAndPersistBundlesForTimeInterval_eventsIdsToDrop_withHandler___block_invoke;
  v19[3] = &unk_1002AE078;
  v16 = v9;
  v24 = v26;
  v20 = v16;
  v21 = self;
  v17 = v15;
  v22 = v17;
  v18 = v10;
  v23 = v18;
  -[MOEventBundleManager fetchEventBundlesWithOptions:CompletionHandler:](self, "fetchEventBundlesWithOptions:CompletionHandler:", v12, v19);

  _Block_object_dispose(v26, 8);
  objc_autoreleasePoolPop(v11);

}

void __100__MOEventBundleManager_DataDump__fetchAndPersistBundlesForTimeInterval_eventsIdsToDrop_withHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id os_log;
  NSObject *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  NSMutableArray *v24;
  _QWORD v26[4];
  id v27;
  uint8_t *v28;
  uint8_t buf[8];
  uint8_t *v30;
  uint64_t v31;
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v23 = a2;
  v21 = a3;
  v22 = a4;
  if (!v21)
  {
    v7 = *(void **)(a1 + 32);
    if (v7 && objc_msgSend(v7, "count"))
    {
      v24 = objc_opt_new(NSMutableArray);
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v8 = v23;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(_QWORD *)v34 != v10)
              objc_enumerationMutation(v8);
            v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
            *(_QWORD *)buf = 0;
            v30 = buf;
            v31 = 0x2020000000;
            v32 = 0;
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "events"));
            v26[0] = _NSConcreteStackBlock;
            v26[1] = 3221225472;
            v26[2] = __100__MOEventBundleManager_DataDump__fetchAndPersistBundlesForTimeInterval_eventsIdsToDrop_withHandler___block_invoke_2;
            v26[3] = &unk_1002AE050;
            v27 = *(id *)(a1 + 32);
            v28 = buf;
            objc_msgSend(v13, "enumerateObjectsUsingBlock:", v26);

            if (!v30[24])
              -[NSMutableArray addObject:](v24, "addObject:", v12);

            _Block_object_dispose(buf, 8);
          }
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v9);
      }

      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v24;

    }
    else
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
    }
    objc_msgSend(*(id *)(a1 + 40), "buildLabelsForEventBundles:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "exportManager"));

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "exportManager"));
      objc_msgSend(v17, "addBundlesToDataExportSession:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

    }
  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v19 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerCaptureCurrentDBFetchEventBundles", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 48), "endSession");
  v20 = *(_QWORD *)(a1 + 56);
  if (v20)
    (*(void (**)(void))(v20 + 16))();

}

void __100__MOEventBundleManager_DataDump__fetchAndPersistBundlesForTimeInterval_eventsIdsToDrop_withHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "eventIdentifier"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));

  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7))
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (void)persistRankingModel:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager exportManager](self, "exportManager"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager exportManager](self, "exportManager"));
    objc_msgSend(v5, "addRankingModelToDataExportSession:", v6);

  }
}

- (void)persistMetadata:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager exportManager](self, "exportManager"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager exportManager](self, "exportManager"));
    objc_msgSend(v5, "addMetadataToDataExportSession:", v6);

  }
}

- (void)finalizeDataExportWithUpload:(BOOL)a3 handler:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id os_log;
  void *v11;
  uint8_t v12[8];
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v6 = a4;
  v7 = objc_autoreleasePoolPush();
  if (!+[MODataExportManager isServiceAvailable](MODataExportManager, "isServiceAvailable"))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Data export service not available", v12, 2u);
    }
LABEL_7:

    goto LABEL_8;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager exportManager](self, "exportManager"));

  if (v4)
  {
    if (!v8)
      goto LABEL_8;
    v9 = objc_claimAutoreleasedReturnValue(-[MOEventBundleManager exportManager](self, "exportManager"));
    -[NSObject endSessionAndUploadAsync](v9, "endSessionAndUploadAsync");
    goto LABEL_7;
  }
  if (v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager exportManager](self, "exportManager"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __71__MOEventBundleManager_DataDump__finalizeDataExportWithUpload_handler___block_invoke;
    v13[3] = &unk_1002AE0A0;
    v14 = v6;
    objc_msgSend(v11, "endSessionSyncWithReply:", v13);

    goto LABEL_12;
  }
LABEL_8:
  if (v6)
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, &__NSDictionary0__struct);
LABEL_12:
  objc_autoreleasePoolPop(v7);

}

void __71__MOEventBundleManager_DataDump__finalizeDataExportWithUpload_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  uint64_t v9;
  uint8_t v10[16];

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Sync data export completed", v10, 2u);
  }

  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v6, v5);

}

+ (id)getStringValueInDictionary:(id)a3 withKey:(id)a4
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", a4));
  if ((objc_opt_respondsToSelector(v4, "stringValue") & 1) != 0)
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "performSelector:", "stringValue"));
  else
    v5 = v4;
  v6 = v5;

  return v6;
}

- (void)buildLabelsForEventBundles:(id)a3
{
  id v3;
  MOEventBundleLabelFormatter *v4;
  id v5;
  id v6;
  uint64_t v7;
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
  id os_log;
  NSObject *v20;
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *context;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[4];
  uint64_t v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];

  v3 = a3;
  context = objc_autoreleasePoolPush();
  v4 = objc_alloc_init(MOEventBundleLabelFormatter);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v8);
        v10 = objc_autoreleasePoolPush();
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleMetaDataUtility buildMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildMetaDataForEventBundle:", v9, context));
        objc_msgSend(v9, "setMetaData:", v11);

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metaData"));
        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metaData"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getBundleType"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelFormatter formattedBundleLabelsForMetaData:bundleType:](v4, "formattedBundleLabelsForMetaData:bundleType:", v13, v14));
          objc_msgSend(v9, "setLabels:", v15);

          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metaData"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getBundleType"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelFormatter formattedBundlePromptsForMetaData:bundleType:](v4, "formattedBundlePromptsForMetaData:bundleType:", v16, v17));
          objc_msgSend(v9, "setPromptLanguages:", v18);

          os_log = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
          v20 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getBundleType"));
            *(_DWORD *)buf = 138412546;
            v35 = v9;
            v36 = 2112;
            v37 = v24;
            _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "build labels, event bundle, %@, bundleType, %@", buf, 0x16u);

          }
          v21 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
          v22 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            -[MOEventBundleManager(DataDump) buildLabelsForEventBundles:].cold.1(v32, v9, &v33, v22);
        }
        else
        {
          v23 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
          v22 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getBundleType"));
            *(_DWORD *)buf = 138412546;
            v35 = v9;
            v36 = 2112;
            v37 = v25;
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "build labels, nil meta data, event bundle, %@, bundleType, %@", buf, 0x16u);

          }
        }

        objc_autoreleasePoolPop(v10);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    }
    while (v6);
  }

  objc_autoreleasePoolPop(context);
}

- (MOEventBundleManager)initWithUniverse:(id)a3
{
  id v6;
  uint64_t v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  uint64_t v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  objc_class *v27;
  NSString *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  objc_class *v32;
  NSString *v33;
  void *v34;
  uint64_t v35;
  objc_class *v36;
  NSString *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  objc_class *v41;
  NSString *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  objc_class *v46;
  NSString *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  objc_class *v51;
  NSString *v52;
  void *v53;
  MOEventBundleManager *v54;
  dispatch_queue_attr_t v55;
  NSObject *v56;
  dispatch_queue_t v57;
  OS_dispatch_queue *queue;
  MOBiomeManager *v59;
  MOBiomeManager *biomeManager;
  MOEventBundleManager *v61;
  id os_log;
  NSObject *v63;
  void *v64;
  const __CFString *v65;
  SEL v66;
  MOEventBundleManager *v67;
  uint64_t v68;
  id v69;
  NSObject *v70;
  id v71;
  NSObject *v72;
  id v73;
  NSObject *v74;
  id v76;
  id v77;
  id obj;
  objc_super v79;

  v6 = a3;
  objc_storeStrong((id *)&self->fUniverse, a3);
  v8 = (objc_class *)objc_opt_class(MOEventManager, v7);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getService:", v10));

  v13 = (objc_class *)objc_opt_class(MOEventBundleStore, v12);
  v14 = NSStringFromClass(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getService:", v15));

  v18 = (objc_class *)objc_opt_class(MOFSMStore, v17);
  v19 = NSStringFromClass(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getService:", v20));

  v22 = (objc_class *)objc_opt_class(MODefaultsManager, v21);
  v23 = NSStringFromClass(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getService:", v24));

  v27 = (objc_class *)objc_opt_class(MOConfigurationManager, v26);
  v28 = NSStringFromClass(v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getService:", v29));

  v32 = (objc_class *)objc_opt_class(MOEngagementHistoryManager, v31);
  v33 = NSStringFromClass(v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  v77 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getService:", v34));

  v36 = (objc_class *)objc_opt_class(MOEventBundleRanking, v35);
  v37 = NSStringFromClass(v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getService:", v38));

  v41 = (objc_class *)objc_opt_class(MOBundleClusteringManager, v40);
  v42 = NSStringFromClass(v41);
  v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getService:", v43));

  if (!v11)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v63 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      -[MODaemonClient initWithUniverse:].cold.1();

    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v49 = v64;
    v65 = CFSTR("Invalid parameter not satisfying: eventManager");
    v66 = a2;
    v67 = self;
    v68 = 200;
    goto LABEL_20;
  }
  if (!v16)
  {
    v69 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v70 = objc_claimAutoreleasedReturnValue(v69);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      -[MOEventBundleManager initWithUniverse:].cold.2();

    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v49 = v64;
    v65 = CFSTR("Invalid parameter not satisfying: eventBundleStore");
    v66 = a2;
    v67 = self;
    v68 = 201;
    goto LABEL_20;
  }
  if (!v25)
  {
    v71 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v72 = objc_claimAutoreleasedReturnValue(v71);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      -[MOEventBundleManager initWithUniverse:].cold.3();

    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v49 = v64;
    v65 = CFSTR("Invalid parameter not satisfying: defaultManager");
    v66 = a2;
    v67 = self;
    v68 = 204;
    goto LABEL_20;
  }
  if (!v30)
  {
    v73 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v74 = objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      -[MOPeopleDiscoveryManager initWithUniverse:].cold.1();

    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v49 = v64;
    v65 = CFSTR("Invalid parameter not satisfying: configurationManager");
    v66 = a2;
    v67 = self;
    v68 = 205;
LABEL_20:
    objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", v66, v67, CFSTR("MOEventBundleManager.m"), v68, v65);
    v61 = 0;
    goto LABEL_21;
  }
  v46 = (objc_class *)objc_opt_class(MOOnboardingAndSettingsPersistence, v45);
  v47 = NSStringFromClass(v46);
  v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getService:", v48));

  v51 = (objc_class *)objc_opt_class(MOEngagementAndSuggestionAnalyticsManager, v50);
  v52 = NSStringFromClass(v51);
  v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
  v76 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getService:", v53));

  v79.receiver = self;
  v79.super_class = (Class)MOEventBundleManager;
  v54 = -[MOEventBundleManager init](&v79, "init");
  if (v54)
  {
    v55 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v56 = objc_claimAutoreleasedReturnValue(v55);
    v57 = dispatch_queue_create("MOEventBundleManager", v56);
    queue = v54->_queue;
    v54->_queue = (OS_dispatch_queue *)v57;

    objc_storeStrong((id *)&v54->_eventBundleStore, v16);
    objc_storeStrong((id *)&v54->_eventManager, v11);
    objc_storeStrong((id *)&v54->_fsmStore, obj);
    v54->_enableSemanticPruning = 0;
    objc_storeStrong((id *)&v54->_defaultManager, v25);
    objc_storeStrong((id *)&v54->_configurationManager, v30);
    objc_storeStrong((id *)&v54->_engagementHistoryManager, v77);
    objc_storeStrong((id *)&v54->_eventBundleRanking, v39);
    objc_storeStrong((id *)&v54->_bundleClusteringManager, v44);
    objc_storeStrong((id *)&v54->_onboardingAndSettingsPersistence, v49);
    v59 = -[MOBiomeManager initWithEventManager:setDefaultValues:]([MOBiomeManager alloc], "initWithEventManager:setDefaultValues:", v54->_eventManager, 1);
    biomeManager = v54->_biomeManager;
    v54->_biomeManager = v59;

    objc_storeStrong((id *)&v54->_engagementAndSuggestionAnalyticsManager, v76);
  }
  self = v54;

  v61 = self;
LABEL_21:

  return v61;
}

- (void)bundleEventsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4
{
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  unint64_t v10;
  MOPerformanceMeasurement *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  MOPerformanceMeasurement *v21;
  MOPerformanceMeasurement *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  _QWORD v29[4];
  MOPerformanceMeasurement *v30;
  MOEventBundleManager *v31;
  MOPerformanceMeasurement *v32;
  id v33;
  unint64_t v34;
  uint8_t buf[8];
  const __CFString *v36;
  void *v37;
  NSErrorUserInfoKey v38;
  const __CFString *v39;

  v6 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  v10 = a3 - 1;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventBundleManagerBundleEventsWrapper", ", buf, 2u);
  }

  v11 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsWrapper"), 0);
  -[MOPerformanceMeasurement startSession](v11, "startSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager eventBundleStore](self, "eventBundleStore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "persistenceManager"));
  v14 = objc_msgSend(v13, "availability");

  v15 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = v16;
  if (v14 == (id)2)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "bundle events since datastore is available", buf, 2u);
    }

    v18 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = v19;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventBundleManagerBundleEvents", ", buf, 2u);
    }

    v21 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEvents"), 0);
    -[MOPerformanceMeasurement startSession](v21, "startSession");
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = __66__MOEventBundleManager_bundleEventsWithRefreshVariant_andHandler___block_invoke;
    v29[3] = &unk_1002B1E40;
    v34 = a3;
    v30 = v21;
    v33 = v6;
    v31 = self;
    v32 = v11;
    v22 = v21;
    -[MOEventBundleManager _bundleEventsWithRefreshVariant:andHandler:](self, "_bundleEventsWithRefreshVariant:andHandler:", a3, v29);

  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MOEventBundleManager bundleEventsWithRefreshVariant:andHandler:].cold.1();

    if (v6)
    {
      v38 = NSLocalizedDescriptionKey;
      v39 = CFSTR("[bundleEventsWithRefreshVariant] database is not available");
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 16, v23));

      v36 = CFSTR("stateDatabaseAvailable");
      v37 = &__kCFBooleanFalse;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
      (*((void (**)(id, void *, void *))v6 + 2))(v6, v24, v25);

    }
    v26 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    v28 = v27;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, a3, "EventBundleManagerBundleEventsWrapper", ", buf, 2u);
    }

    -[MOPerformanceMeasurement endSession](v11, "endSession");
  }

}

void __66__MOEventBundleManager_bundleEventsWithRefreshVariant_andHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  MOPerformanceMeasurement *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  MOPerformanceMeasurement *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  os_signpost_id_t v34;
  _QWORD v35[4];
  id v36;
  MOPerformanceMeasurement *v37;
  id v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 64);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "EventBundleManagerBundleEvents", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  v11 = objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v11, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("stateDatabaseAvailable"));
  v12 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 134218498;
    v43 = v14;
    v44 = 2112;
    v45 = v6;
    v46 = 2112;
    v47 = v5;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[bundleEventsWithRefreshVariant]refreshVariant %lu, bundling result %@, error %@", buf, 0x20u);
  }

  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v15 = *(_QWORD *)(a1 + 64);
    if (v15 == 1280 || v15 == 768)
    {
      objc_msgSend(*(id *)(a1 + 40), "_computeEngagementScoreParams");
      v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      v18 = v17;
      v19 = *(_QWORD *)(a1 + 64);
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, v19, "EventBundleManagerGenerateClusterAndAnomalyBundlesWrapper", ", buf, 2u);
      }

      v20 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("SignPostGenerateClusterBundlesWrapper"), 0);
      -[MOPerformanceMeasurement startSession](v20, "startSession");
      v21 = *(void **)(a1 + 40);
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = __66__MOEventBundleManager_bundleEventsWithRefreshVariant_andHandler___block_invoke_218;
      v35[3] = &unk_1002B1E18;
      v22 = v11;
      v23 = *(void **)(a1 + 56);
      v41 = *(_QWORD *)(a1 + 64);
      v36 = v22;
      v37 = v20;
      v40 = v23;
      v24 = *(id *)(a1 + 48);
      v25 = *(_QWORD *)(a1 + 40);
      v38 = v24;
      v39 = v25;
      v26 = v20;
      objc_msgSend(v21, "_generateClusterAndAnomalyBundlesWithHandler:", v35);

    }
    else
    {
      v27 = *(_QWORD *)(a1 + 56);
      if (v27)
        (*(void (**)(uint64_t, _QWORD, id))(v27 + 16))(v27, 0, v6);
      v28 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 134218498;
        v43 = v30;
        v44 = 2112;
        v45 = v6;
        v46 = 2112;
        v47 = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[bundleEventsWithRefreshVariant] refreshVariant %lu, bundling result %@, error %@", buf, 0x20u);
      }

      v31 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      v33 = v32;
      v34 = *(_QWORD *)(a1 + 64);
      if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_END, v34, "EventBundleManagerBundleEventsWrapper", ", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 48), "endSession");
    }
  }

}

void __66__MOEventBundleManager_bundleEventsWithRefreshVariant_andHandler___block_invoke_218(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", v6);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 72);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "EventBundleManagerGenerateClusterAndAnomalyBundlesWrapper", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "endSession");
  v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)buf = 134218498;
    v32 = v13;
    v33 = 2112;
    v34 = v6;
    v35 = 2112;
    v36 = v5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[bundleEventsWithRefreshVariant] refreshVariant %lu, clustering result %@, error %@", buf, 0x20u);
  }

  if (v5)
  {
    (*(void (**)(_QWORD, id, _QWORD, uint64_t))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v5, *(_QWORD *)(a1 + 32), v14);
  }
  else
  {
    v15 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = v16;
    v18 = *(_QWORD *)(a1 + 72);
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, v18, "EventBundleManagerBundleEventsWrapper", ", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 48), "endSession");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "engagementAndSuggestionAnalyticsManager"));
    v20 = objc_msgSend(v19, "isReadyToSubmitAnalytics");

    if (v20)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "onboardingAndSettingsPersistence"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "getSnapshotDictionaryForAnalytics"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[MOEngagementAndSuggestionAnalyticsParams updateOnboardingStatusDictionaryKeys:](MOEngagementAndSuggestionAnalyticsParams, "updateOnboardingStatusDictionaryKeys:", v23));

      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "engagementAndSuggestionAnalyticsManager"));
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = __66__MOEventBundleManager_bundleEventsWithRefreshVariant_andHandler___block_invoke_220;
      v28[3] = &unk_1002B1DF0;
      v26 = *(id *)(a1 + 32);
      v27 = *(_QWORD *)(a1 + 72);
      v29 = v26;
      v30 = v27;
      objc_msgSend(v25, "submitEngagementAndSuggestionPerformanceAnalyticsWithOnboardingStatus:AndCompletionHandler:", v24, v28);

    }
    (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), 0, *(_QWORD *)(a1 + 32), v21);
  }

}

void __66__MOEventBundleManager_bundleEventsWithRefreshVariant_andHandler___block_invoke_220(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", v6);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = *(_QWORD *)(a1 + 40);
    v10 = 134218498;
    v11 = v9;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[bundleEventsWithRefreshVariant] refreshVariant %lu, analytics result %@, error %@", (uint8_t *)&v10, 0x20u);
  }

}

- (void)_computeEngagementScoreParams
{
  void *v3;
  id os_log;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[8];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__19;
  v16 = __Block_byref_object_dispose__19;
  v17 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager eventBundleStore](self, "eventBundleStore"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __53__MOEventBundleManager__computeEngagementScoreParams__block_invoke;
  v11[3] = &unk_1002AEFF0;
  v11[4] = &v12;
  objc_msgSend(v3, "getRankingParamsandCompletionHandler:", v11);

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Attempting to update engagement score for sensed bundles", v10, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager eventBundleRanking](self, "eventBundleRanking"));
  -[MOEventBundleManager _computeSensedBundleEngagementScoreParams:withRankingParams:](self, "_computeSensedBundleEngagementScoreParams:withRankingParams:", v6, v13[5]);

  v7 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Attempting to update evergreen scores", v10, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager eventBundleRanking](self, "eventBundleRanking"));
  -[MOEventBundleManager _computeEvergreenScoreParams:withRankingParams:](self, "_computeEvergreenScoreParams:withRankingParams:", v9, v13[5]);

  _Block_object_dispose(&v12, 8);
}

void __53__MOEventBundleManager__computeEngagementScoreParams__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a2;
  v6 = v5;
  if (!a3)
  {
    v11 = v5;
    v7 = objc_msgSend(v5, "count");
    v6 = v11;
    if (v7)
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 0));
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v6 = v11;
    }
  }

}

- (void)_computeSensedBundleEngagementScoreParams:(id)a3 withRankingParams:(id)a4
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  MOPerformanceMeasurement *v10;
  void *v11;
  id v12;
  void *v13;
  unsigned __int8 v14;
  NSObject *v15;
  id *v16;
  id *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  float v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  unsigned int v35;
  id v36;
  NSObject *v37;
  void *v38;
  id v39;
  NSObject *v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  unsigned int v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  NSObject *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  unsigned int v78;
  void *v79;
  void *v80;
  signed int v81;
  double v82;
  void *v83;
  void *v84;
  float v85;
  void *v86;
  double v87;
  double v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  NSObject *v93;
  void *v94;
  void *v95;
  id v96;
  NSObject *v97;
  void *v98;
  NSObject *v99;
  id v100;
  NSObject *v101;
  id v102;
  NSObject *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  _QWORD v117[5];
  id v118;
  id v119;
  _QWORD v120[5];
  id v121;
  id v122;
  _QWORD block[5];
  id v124;
  id v125;
  _QWORD v126[5];
  id v127;
  id v128;
  _QWORD v129[4];
  _QWORD v130[4];
  uint8_t buf[4];
  double v132;
  __int16 v133;
  id v134;
  __int16 v135;
  id v136;
  __int16 v137;
  void *v138;
  __int16 v139;
  void *v140;
  __int16 v141;
  void *v142;
  __int16 v143;
  void *v144;

  v6 = a3;
  v7 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsComputeSensedBundleEngagementScoreParams", ", buf, 2u);
  }

  v10 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsComputeEngagementScoreParams"), 0);
  -[MOPerformanceMeasurement startSession](v10, "startSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if (v7)
  {
    v12 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSinceReferenceDate:", 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "engagementScoreParamsUpdateDate"));
    v14 = objc_msgSend(v13, "isEqual:", v12);

    if ((v14 & 1) != 0)
    {
      objc_msgSend(v7, "setIsParamsUpdateOnHold:", 1);
      v15 = objc_claimAutoreleasedReturnValue(-[MOEventBundleManager queue](self, "queue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __84__MOEventBundleManager__computeSensedBundleEngagementScoreParams_withRankingParams___block_invoke_231;
      block[3] = &unk_1002B17D8;
      block[4] = self;
      v16 = &v124;
      v124 = v6;
      v17 = &v125;
      v125 = v7;
      dispatch_async(v15, block);

      v18 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Update date for sensed bundle engagement score was not initialized. Initialize the data and skip update.", buf, 2u);
      }

      v20 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (!os_signpost_enabled(v21))
        goto LABEL_26;
      *(_WORD *)buf = 0;
LABEL_25:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsComputeSensedBundleEngagementScoreParams", ", buf, 2u);
LABEL_26:

      -[MOPerformanceMeasurement endSession](v10, "endSession");
      goto LABEL_27;
    }
    objc_msgSend(v6, "setRankingParamsFromRankingParamsMO:", v7);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "engagementScoreParameterDict"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("longTimePeriodSinceEngagementScoreParamsUpdatedSec")));
    v29 = (float)(int)objc_msgSend(v28, "intValue");

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "engagementScoreParamsUpdateDate"));
    objc_msgSend(v30, "timeIntervalSinceDate:", v11);
    v32 = fabs(v31);
    v33 = v29;

    if (v32 >= v33)
    {
      objc_msgSend(v7, "setIsParamsUpdateOnHold:", 1);
      v41 = objc_claimAutoreleasedReturnValue(-[MOEventBundleManager queue](self, "queue"));
      v126[0] = _NSConcreteStackBlock;
      v126[1] = 3221225472;
      v126[2] = __84__MOEventBundleManager__computeSensedBundleEngagementScoreParams_withRankingParams___block_invoke;
      v126[3] = &unk_1002B17D8;
      v126[4] = self;
      v16 = &v127;
      v127 = v6;
      v17 = &v128;
      v128 = v7;
      dispatch_async(v41, v126);

      v42 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v132 = v33;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Last sensed bundle engagement score update occurred earlier than %f from now. Add holdout period and skip update.", buf, 0xCu);
      }

      v44 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v21 = objc_claimAutoreleasedReturnValue(v44);
      if (!os_signpost_enabled(v21))
        goto LABEL_26;
      *(_WORD *)buf = 0;
      goto LABEL_25;
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "engagementScoreParamsUpdateDate"));
    v35 = objc_msgSend(v11, "isBeforeDate:", v34);

    if (v35)
    {
      v36 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "engagementScoreParamsUpdateDate"));
        *(_DWORD *)buf = 138412546;
        v132 = *(double *)&v11;
        v133 = 2112;
        v134 = v38;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "current date is behind previous engage params update date %@,%@. Skip update.", buf, 0x16u);

      }
      v39 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_signpost_enabled(v40))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v40, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsComputeSensedBundleEngagementScoreParams", ", buf, 2u);
      }

      -[MOPerformanceMeasurement endSession](v10, "endSession");
    }
    else
    {
      v111 = v6;
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager engagementHistoryManager](self, "engagementHistoryManager"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "engagementScoreParamsUpdateDate"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "getInterfaceTypeCountForUniqueSuggestionsWithJournalCreatedFromStartDate:toEndDate:withMinimumAddedCharacters:", v46, v11, 1));

      v105 = v47;
      v48 = objc_msgSend(v47, "mutableCopy");
      objc_msgSend(v48, "removeObjectForKey:", &off_1002D8F60);
      objc_msgSend(v48, "removeObjectForKey:", &off_1002D8F78);
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager engagementHistoryManager](self, "engagementHistoryManager"));
      v116 = v11;
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "engagementScoreParamsUpdateDate"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "getInterfaceTypeCountForUniqueSuggestionsWithJournalCreatedButNoWritingFromStartDate:toEndDate:", v50, v116));

      v104 = v51;
      v52 = objc_msgSend(v51, "mutableCopy");
      objc_msgSend(v52, "removeObjectForKey:", &off_1002D8F60);
      objc_msgSend(v52, "removeObjectForKey:", &off_1002D8F78);
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager engagementHistoryManager](self, "engagementHistoryManager"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "engagementScoreParamsUpdateDate"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "getInterfaceTypeCountForUniqueSuggestionsViewedButNotEngagedFromStartDate:toEndDate:", v54, v116));

      v108 = v55;
      v56 = objc_msgSend(v55, "mutableCopy");
      objc_msgSend(v56, "removeObjectForKey:", &off_1002D8F60);
      v113 = v56;
      objc_msgSend(v56, "removeObjectForKey:", &off_1002D8F78);
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager engagementHistoryManager](self, "engagementHistoryManager"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "engagementScoreParamsUpdateDate"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "getInterfaceTypeCountForUniqueSuggestionsDeletedFromStartDate:toEndDate:", v58, v116));

      v107 = v59;
      v60 = objc_msgSend(v59, "mutableCopy");
      objc_msgSend(v60, "removeObjectForKey:", &off_1002D8F60);
      objc_msgSend(v60, "removeObjectForKey:", &off_1002D8F78);
      v115 = v48;
      v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "allValues"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "valueForKeyPath:", CFSTR("@sum.self")));
      LODWORD(v59) = objc_msgSend(v61, "intValue");
      v114 = v52;
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "allValues"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "valueForKeyPath:", CFSTR("@sum.self")));
      LODWORD(v48) = objc_msgSend(v63, "intValue") + (_DWORD)v59;
      v112 = v60;
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "allValues"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "valueForKeyPath:", CFSTR("@sum.self")));
      v66 = (_DWORD)v48 + objc_msgSend(v65, "intValue");

      v67 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager engagementHistoryManager](self, "engagementHistoryManager"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "engagementScoreParamsUpdateDate"));
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "getInterfaceTypeCountForUniqueSuggestionsViewedFromStartDate:toEndDate:", v68, v116));

      v106 = v69;
      v70 = objc_msgSend(v69, "mutableCopy");
      objc_msgSend(v70, "removeObjectForKey:", &off_1002D8F60);
      objc_msgSend(v70, "removeObjectForKey:", &off_1002D8F78);
      v71 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      v72 = objc_claimAutoreleasedReturnValue(v71);
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "engagementScoreParamsUpdateDate"));
        *(_DWORD *)buf = 138413826;
        v132 = *(double *)&v73;
        v133 = 2112;
        v134 = v116;
        v135 = 2112;
        v136 = v70;
        v137 = 2112;
        v138 = v115;
        v139 = 2112;
        v140 = v114;
        v141 = 2112;
        v142 = v113;
        v143 = 2112;
        v144 = v112;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "Sensed bundle engagement signals collected between last engagement score update date (%@) and now(%@): TotalViewedSuggestions=%@, journalIsWritten=%@, entryCreatedWithNoWritings=%@, suggestionViewedButNotEngaged=%@, suggestionDeleted=%@", buf, 0x48u);

      }
      v110 = v70;
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "allKeys"));
      v75 = objc_msgSend(v74, "count");

      v6 = v111;
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "engagementScoreParameterDict"));
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("minEngagementCount")));
      v78 = objc_msgSend(v77, "intValue");

      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "engagementScoreParameterDict"));
      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("minInterfaceTypes")));
      v81 = objc_msgSend(v80, "intValue");

      if ((unint64_t)v75 < v81 || v66 < v78)
      {
        v96 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        v97 = objc_claimAutoreleasedReturnValue(v96);
        v94 = v105;
        if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&v132 = (int)v66;
          v133 = 2048;
          v134 = v75;
          _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_INFO, "Not enough engagement signals (=%lu) or uniqueViewedBundleTypes (=%lu) for sensed bundle engagement score update. Skip update. ", buf, 0x16u);
        }

        v11 = v116;
        v95 = v104;
        v90 = v107;
        v89 = v108;
        v91 = v106;
      }
      else
      {
        v82 = 0.0;
        if (objc_msgSend(v7, "isParamsUpdateOnHold"))
        {
          v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "engagementScoreParameterDict"));
          v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("minTimeIntervalForUpdateSec")));
          v85 = (float)(int)objc_msgSend(v84, "intValue");

          v82 = v85;
        }
        v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "engagementScoreParamsUpdateDate"));
        v11 = v116;
        objc_msgSend(v86, "timeIntervalSinceDate:", v116);
        v88 = fabs(v87);

        v90 = v107;
        v89 = v108;
        v91 = v106;
        if (v88 >= v82)
        {
          v129[0] = CFSTR("journalWasWritten");
          v129[1] = CFSTR("journalEntryWasCreatedWithNoWriting");
          v130[0] = v115;
          v130[1] = v114;
          v129[2] = CFSTR("suggestionWasViewedButNotEngaged");
          v129[3] = CFSTR("suggestionWasDeleted");
          v130[2] = v113;
          v130[3] = v112;
          v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v130, v129, 4));
          objc_msgSend(v111, "setInterfaceTypeCountFromSuggestionEngagementDict:", v98);

          objc_msgSend(v111, "updateEngagementScoreParamsUsingBFGS");
          objc_msgSend(v7, "setIsParamsUpdateOnHold:", 0);
          v99 = objc_claimAutoreleasedReturnValue(-[MOEventBundleManager queue](self, "queue"));
          v117[0] = _NSConcreteStackBlock;
          v117[1] = 3221225472;
          v117[2] = __84__MOEventBundleManager__computeSensedBundleEngagementScoreParams_withRankingParams___block_invoke_237;
          v117[3] = &unk_1002B17D8;
          v117[4] = self;
          v118 = v111;
          v119 = v7;
          dispatch_async(v99, v117);

          v100 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          v101 = objc_claimAutoreleasedReturnValue(v100);
          v95 = v104;
          if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_INFO, "New sensed bundle engagement scores are saved.", buf, 2u);
          }

          v94 = v105;
        }
        else
        {
          v92 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          v93 = objc_claimAutoreleasedReturnValue(v92);
          v95 = v104;
          v94 = v105;
          if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_INFO, "Engagement score update is in holdout period. Skip update.", buf, 2u);
          }

        }
      }
      v102 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v103 = objc_claimAutoreleasedReturnValue(v102);
      if (os_signpost_enabled(v103))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v103, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsComputeSensedBundleEngagementScoreParams", ", buf, 2u);
      }

      -[MOPerformanceMeasurement endSession](v10, "endSession");
    }
  }
  else
  {
    v22 = objc_claimAutoreleasedReturnValue(-[MOEventBundleManager queue](self, "queue"));
    v120[0] = _NSConcreteStackBlock;
    v120[1] = 3221225472;
    v120[2] = __84__MOEventBundleManager__computeSensedBundleEngagementScoreParams_withRankingParams___block_invoke_232;
    v120[3] = &unk_1002B17D8;
    v120[4] = self;
    v121 = v6;
    v122 = 0;
    dispatch_async(v22, v120);

    v23 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Engagement score DB is empty. Fill in the DB with default values and skip update.", buf, 2u);
    }

    v25 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsComputeSensedBundleEngagementScoreParams", ", buf, 2u);
    }

    -[MOPerformanceMeasurement endSession](v10, "endSession");
  }
LABEL_27:

}

void __84__MOEventBundleManager__computeSensedBundleEngagementScoreParams_withRankingParams___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventBundleStore"));
  objc_msgSend(v2, "storeRankingParams:forContext:forEvergreenScore:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);

}

void __84__MOEventBundleManager__computeSensedBundleEngagementScoreParams_withRankingParams___block_invoke_231(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventBundleStore"));
  objc_msgSend(v2, "storeRankingParams:forContext:forEvergreenScore:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);

}

void __84__MOEventBundleManager__computeSensedBundleEngagementScoreParams_withRankingParams___block_invoke_232(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventBundleStore"));
  objc_msgSend(v2, "storeRankingParams:forContext:forEvergreenScore:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);

}

void __84__MOEventBundleManager__computeSensedBundleEngagementScoreParams_withRankingParams___block_invoke_237(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventBundleStore"));
  objc_msgSend(v2, "storeRankingParams:forContext:forEvergreenScore:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);

}

- (void)_computeEvergreenScoreParams:(id)a3 withRankingParams:(id)a4
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  MOPerformanceMeasurement *v10;
  double v11;
  id v12;
  void *v13;
  unsigned __int8 v14;
  NSObject *v15;
  id *v16;
  id *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  NSObject *queue;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  float v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  unsigned int v36;
  id v37;
  NSObject *v38;
  void *v39;
  id v40;
  NSObject *v41;
  NSObject *v42;
  id v43;
  NSObject *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  double v52;
  id v53;
  NSObject *v54;
  double v55;
  void *v56;
  void *v57;
  unsigned int v58;
  id v59;
  NSMutableDictionary *v60;
  const char *v61;
  NSObject *p_super;
  uint32_t v63;
  double v64;
  void *v65;
  void *v66;
  float v67;
  void *v68;
  double v69;
  double v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  id v77;
  NSObject *v78;
  id v79;
  NSObject *v80;
  void *v81;
  _QWORD v82[5];
  id v83;
  id v84;
  _QWORD v85[5];
  id v86;
  id v87;
  _QWORD block[5];
  id v89;
  id v90;
  _QWORD v91[5];
  id v92;
  id v93;
  uint8_t buf[4];
  double v95;
  __int16 v96;
  double v97;
  __int16 v98;
  id v99;

  v6 = a3;
  v7 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsComputeEvergreenScoreParams", ", buf, 2u);
  }

  v10 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("ComputeEvergreenScoreParams"), 0);
  -[MOPerformanceMeasurement startSession](v10, "startSession");
  v11 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date")));
  if (!v7)
  {
    queue = self->_queue;
    v85[0] = _NSConcreteStackBlock;
    v85[1] = 3221225472;
    v85[2] = __71__MOEventBundleManager__computeEvergreenScoreParams_withRankingParams___block_invoke_241;
    v85[3] = &unk_1002B17D8;
    v85[4] = self;
    v86 = v6;
    v87 = 0;
    dispatch_async(queue, v85);
    v23 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Engagement score DB is empty. Fill in the DB with default values and skip update.", buf, 2u);
    }

    v25 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsComputeEvergreenScoreParams", ", buf, 2u);
    }

    -[MOPerformanceMeasurement endSession](v10, "endSession");
    v27 = v86;
    goto LABEL_14;
  }
  v12 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSinceReferenceDate:", 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "evergreenEngagementScoreParamsUpdateDate"));
  v14 = objc_msgSend(v13, "isEqual:", v12);

  if ((v14 & 1) != 0)
  {
    objc_msgSend(v7, "setIsEvergreenEngagementScoreParamsUpdateOnHold:", 1);
    v15 = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __71__MOEventBundleManager__computeEvergreenScoreParams_withRankingParams___block_invoke_240;
    block[3] = &unk_1002B17D8;
    block[4] = self;
    v16 = &v89;
    v89 = v6;
    v17 = &v90;
    v90 = v7;
    dispatch_async(v15, block);
    v18 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Update date for evergreen score was not initialized. Initialize the data and skip update.", buf, 2u);
    }

    v20 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (!os_signpost_enabled(v21))
      goto LABEL_27;
    *(_WORD *)buf = 0;
LABEL_26:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsComputeEvergreenScoreParams", ", buf, 2u);
LABEL_27:

    -[MOPerformanceMeasurement endSession](v10, "endSession");
    goto LABEL_28;
  }
  objc_msgSend(v6, "setRankingParamsFromRankingParamsMO:", v7);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "engagementScoreParameterDict"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("longTimePeriodSinceEngagementScoreParamsUpdatedSec")));
  v30 = (float)(int)objc_msgSend(v29, "intValue");

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "evergreenEngagementScoreParamsUpdateDate"));
  objc_msgSend(v31, "timeIntervalSinceDate:", *(_QWORD *)&v11);
  v33 = fabs(v32);
  v34 = v30;

  if (v33 >= v34)
  {
    objc_msgSend(v7, "setIsEvergreenEngagementScoreParamsUpdateOnHold:", 1);
    v42 = self->_queue;
    v91[0] = _NSConcreteStackBlock;
    v91[1] = 3221225472;
    v91[2] = __71__MOEventBundleManager__computeEvergreenScoreParams_withRankingParams___block_invoke;
    v91[3] = &unk_1002B17D8;
    v91[4] = self;
    v16 = &v92;
    v92 = v6;
    v17 = &v93;
    v93 = v7;
    dispatch_async(v42, v91);
    v43 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    v44 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v95 = v34;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Last evergreen engagement score update occurred earlier than %f from now. Add holdout period and skip update.", buf, 0xCu);
    }

    v45 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v21 = objc_claimAutoreleasedReturnValue(v45);
    if (!os_signpost_enabled(v21))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    goto LABEL_26;
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "evergreenEngagementScoreParamsUpdateDate"));
  v36 = objc_msgSend(*(id *)&v11, "isBeforeDate:", v35);

  if (!v36)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager engagementHistoryManager](self, "engagementHistoryManager"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "evergreenEngagementScoreParamsUpdateDate"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "getEvergreenTypeCountForSuggestionsWithJournalCreatedFromStartDate:toEndDate:withMinimumAddedCharacters:", v47, *(_QWORD *)&v11, 0));

    v81 = v48;
    v49 = objc_msgSend(v48, "mutableCopy");
    objc_msgSend(v49, "removeObjectForKey:", &stru_1002B68D0);
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "allValues"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "valueForKeyPath:", CFSTR("@sum.self")));
    *(_QWORD *)&v52 = (int)objc_msgSend(v51, "intValue");

    v53 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    v54 = objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      v55 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "evergreenEngagementScoreParamsUpdateDate")));
      *(_DWORD *)buf = 138412802;
      v95 = v55;
      v96 = 2112;
      v97 = v11;
      v98 = 2112;
      v99 = v49;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "Evergreen engagement signals collected between last engagement score update date (%@) and now(%@): selected %@", buf, 0x20u);

    }
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "engagementScoreParameterDict"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("minEngagementCount")));
    v58 = objc_msgSend(v57, "intValue");

    if (LODWORD(v52) >= v58)
    {
      v64 = 0.0;
      if (objc_msgSend(v7, "isEvergreenEngagementScoreParamsUpdateOnHold"))
      {
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "engagementScoreParameterDict"));
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("minTimeIntervalForUpdateSec")));
        v67 = (float)(int)objc_msgSend(v66, "intValue");

        v64 = v67;
      }
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "evergreenEngagementScoreParamsUpdateDate"));
      objc_msgSend(v68, "timeIntervalSinceDate:", *(_QWORD *)&v11);
      v70 = fabs(v69);

      if (v70 >= v64)
      {
        *(double *)&v60 = COERCE_DOUBLE((uint64_t)objc_opt_new(NSMutableDictionary));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v60, "setObject:forKeyedSubscript:", &off_1002DCCD8, CFSTR("GRATITUDE"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v60, "setObject:forKeyedSubscript:", &off_1002DCCD8, CFSTR("KINDNESS"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v60, "setObject:forKeyedSubscript:", &off_1002DCCD8, CFSTR("WISDOM"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v60, "setObject:forKeyedSubscript:", &off_1002DCCD8, CFSTR("PURPOSE"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v60, "setObject:forKeyedSubscript:", &off_1002DCCD8, CFSTR("RESILIENCE"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v60, "setObject:forKeyedSubscript:", &off_1002DCCD8, CFSTR("CREATIVITY"));
        if (objc_msgSend(v49, "count") == (id)1)
        {
          v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "allKeys"));
          v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "objectAtIndexedSubscript:", 0));

          -[NSMutableDictionary setObject:forKeyedSubscript:](v60, "setObject:forKeyedSubscript:", &off_1002DCCE8, v73);
        }
        else
        {
          v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "keysSortedByValueUsingComparator:", &__block_literal_global_22));
          v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "objectAtIndexedSubscript:", 0));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v60, "setObject:forKeyedSubscript:", &off_1002DCCE8, v74);

          v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "objectAtIndexedSubscript:", 1));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v60, "setObject:forKeyedSubscript:", &off_1002DCCF8, v75);

        }
        objc_msgSend(v6, "setEvergreenEngagementScoreParameterDict:", v60);
        objc_msgSend(v7, "setIsEvergreenEngagementScoreParamsUpdateOnHold:", 0);
        v76 = self->_queue;
        v82[0] = _NSConcreteStackBlock;
        v82[1] = 3221225472;
        v82[2] = __71__MOEventBundleManager__computeEvergreenScoreParams_withRankingParams___block_invoke_249;
        v82[3] = &unk_1002B17D8;
        v82[4] = self;
        v83 = v6;
        v84 = v7;
        dispatch_async(v76, v82);
        v77 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        v78 = objc_claimAutoreleasedReturnValue(v77);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v95 = *(double *)&v60;
          _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "New evergreen engagement scores are saved: %@", buf, 0xCu);
        }

        goto LABEL_46;
      }
      v71 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      *(double *)&v60 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(v71));
      if (os_log_type_enabled(&v60->super.super, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v61 = "Evergreen engagement score update is in holdout period. Skip update.";
        p_super = &v60->super.super;
        v63 = 2;
        goto LABEL_39;
      }
    }
    else
    {
      v59 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      *(double *)&v60 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(v59));
      if (os_log_type_enabled(&v60->super.super, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v95 = v52;
        v61 = "Not enough engagement signals (=%lu) for evergreen engagement score update. Skip update.";
        p_super = &v60->super.super;
        v63 = 12;
LABEL_39:
        _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_INFO, v61, buf, v63);
      }
    }
LABEL_46:

    v79 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v80 = objc_claimAutoreleasedReturnValue(v79);
    if (os_signpost_enabled(v80))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v80, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsComputeEvergreenScoreParams", ", buf, 2u);
    }

    -[MOPerformanceMeasurement endSession](v10, "endSession");
    v27 = v81;
LABEL_14:

    goto LABEL_28;
  }
  v37 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  v38 = objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "evergreenEngagementScoreParamsUpdateDate"));
    *(_DWORD *)buf = 138412546;
    v95 = v11;
    v96 = 2112;
    v97 = *(double *)&v39;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Current date is behind previous evergreen params update date %@,%@. Skip update.", buf, 0x16u);

  }
  v40 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v41 = objc_claimAutoreleasedReturnValue(v40);
  if (os_signpost_enabled(v41))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v41, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsComputeEvergreenScoreParams", ", buf, 2u);
  }

  -[MOPerformanceMeasurement endSession](v10, "endSession");
LABEL_28:

}

void __71__MOEventBundleManager__computeEvergreenScoreParams_withRankingParams___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventBundleStore"));
  objc_msgSend(v2, "storeRankingParams:forContext:forEvergreenScore:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);

}

void __71__MOEventBundleManager__computeEvergreenScoreParams_withRankingParams___block_invoke_240(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventBundleStore"));
  objc_msgSend(v2, "storeRankingParams:forContext:forEvergreenScore:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);

}

void __71__MOEventBundleManager__computeEvergreenScoreParams_withRankingParams___block_invoke_241(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventBundleStore"));
  objc_msgSend(v2, "storeRankingParams:forContext:forEvergreenScore:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);

}

int64_t __71__MOEventBundleManager__computeEvergreenScoreParams_withRankingParams___block_invoke_246(id a1, id a2, id a3)
{
  id v4;
  id v5;
  id v6;
  int64_t v7;
  id v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "integerValue");
  if ((uint64_t)v6 <= (uint64_t)objc_msgSend(v5, "integerValue"))
  {
    v8 = objc_msgSend(v4, "integerValue");
    v7 = (uint64_t)v8 < (uint64_t)objc_msgSend(v5, "integerValue");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

void __71__MOEventBundleManager__computeEvergreenScoreParams_withRankingParams___block_invoke_249(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventBundleStore"));
  objc_msgSend(v2, "storeRankingParams:forContext:forEvergreenScore:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);

}

- (void)_bundleEventsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4
{
  void (**v6)(id, id, _QWORD);
  MOEventRefreshHelper *v7;
  BOOL v8;
  id os_log;
  NSObject *v10;
  const char *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  double v20;
  void *i;
  void *v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  NSObject *v30;
  unint64_t v31;
  void *v32;
  id v33;
  void *v34;
  MOEventFetchOptions *v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  MOPerformanceMeasurement *v39;
  MOEventManager *eventManager;
  MOPerformanceMeasurement *v41;
  MOEventFetchOptions *v42;
  BOOL v43;
  _QWORD v44[5];
  MOPerformanceMeasurement *v45;
  MOEventFetchOptions *v46;
  id v47;
  void (**v48)(id, id, _QWORD);
  uint64_t *v49;
  uint64_t *v50;
  unint64_t v51;
  BOOL v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[6];
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint8_t buf[4];
  unint64_t v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  _BYTE v76[128];
  NSErrorUserInfoKey v77;
  const __CFString *v78;

  v6 = (void (**)(id, id, _QWORD))a4;
  v64 = 0;
  v65 = &v64;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__19;
  v68 = __Block_byref_object_dispose__19;
  v69 = 0;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__19;
  v62 = __Block_byref_object_dispose__19;
  v63 = 0;
  v7 = -[MOEventRefreshHelper initWithUniverse:]([MOEventRefreshHelper alloc], "initWithUniverse:", self->fUniverse);
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = __67__MOEventBundleManager__bundleEventsWithRefreshVariant_andHandler___block_invoke;
  v57[3] = &unk_1002B1E88;
  v57[4] = &v64;
  v57[5] = &v58;
  -[MOEventRefreshHelper getBundlingDatesForVariant:withHandler:](v7, "getBundlingDatesForVariant:withHandler:", a3, v57);
  if (!v65[5] || !v59[5])
  {
    v77 = NSLocalizedDescriptionKey;
    v78 = CFSTR("[bundleEventsWithRefreshVariant] start or end date for bundling is not available");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1));
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 18, v12));

    v6[2](v6, v13, 0);
    goto LABEL_34;
  }
  v8 = a3 == 768;
  if (a3 == 1280)
    v8 = 1;
  v43 = v8;
  if (a3 == 1280 || a3 == 768)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v10 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v71 = a3;
      v11 = "Current refresh variant: %lu. CA and Biome analytics submissions are enabled.";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v11, buf, 0xCu);
    }
  }
  else
  {
    v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v10 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v71 = a3;
      v11 = "Current refresh variant: %lu. CA and Biome analytics submissions are disabled.";
      goto LABEL_12;
    }
  }

  objc_msgSend((id)v59[5], "timeIntervalSinceDate:", v65[5]);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v15, &off_1002DCFE8, &off_1002DCFF8, &off_1002DD008, &off_1002DD018, &off_1002DD028, &off_1002DD038, &off_1002DD048, &off_1002DD058, 0));

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, v76, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v54;
    v20 = 0.0;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v54 != v19)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v22, "doubleValue");
        if (v23 > v20)
        {
          objc_msgSend(v22, "doubleValue");
          v20 = v24;
        }
      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, v76, 16);
    }
    while (v18);
  }
  else
  {
    v20 = 0.0;
  }

  if (a3 == 1280 || a3 == 768)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v59[5], "dateByAddingTimeInterval:", -v20));
    v26 = objc_alloc((Class)NSDateInterval);
    v27 = objc_msgSend(v26, "initWithStartDate:endDate:", v25, v59[5]);
  }
  else
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "startOfDayForDate:", v65[5]));

    v29 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshHelper);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = v65[5];
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
      *(_DWORD *)buf = 138412802;
      v71 = v31;
      v72 = 2112;
      v73 = v25;
      v74 = 2112;
      v75 = v32;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "extended event fetching start date from (%@) to (%@) with variant (%@)", buf, 0x20u);

    }
    v33 = objc_alloc((Class)NSDateInterval);
    v27 = objc_msgSend(v33, "initWithStartDate:endDate:", v25, v59[5]);
  }
  v34 = v27;

  v35 = -[MOEventFetchOptions initWithDateInterval:ascending:limit:]([MOEventFetchOptions alloc], "initWithDateInterval:ascending:limit:", v34, 1, 0);
  v36 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v37 = objc_claimAutoreleasedReturnValue(v36);
  v38 = v37;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventBundleManagerBundleEventsFetchEvents", ", buf, 2u);
  }

  v39 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsFetchEvents"), 0);
  -[MOPerformanceMeasurement startSession](v39, "startSession");
  eventManager = self->_eventManager;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = __67__MOEventBundleManager__bundleEventsWithRefreshVariant_andHandler___block_invoke_268;
  v44[3] = &unk_1002B1F28;
  v44[4] = self;
  v51 = a3;
  v41 = v39;
  v45 = v41;
  v48 = v6;
  v42 = v35;
  v46 = v42;
  v13 = v17;
  v52 = v43;
  v47 = v13;
  v49 = &v58;
  v50 = &v64;
  -[MOEventManager fetchEventsWithOptions:CompletionHandler:](eventManager, "fetchEventsWithOptions:CompletionHandler:", v42, v44);

LABEL_34:
  _Block_object_dispose(&v58, 8);

  _Block_object_dispose(&v64, 8);
}

void __67__MOEventBundleManager__bundleEventsWithRefreshVariant_andHandler___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a4;
  if (a2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
  }

}

void __67__MOEventBundleManager__bundleEventsWithRefreshVariant_andHandler___block_invoke_268(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  __int128 v20;
  uint64_t v21;
  char v22;

  v5 = a2;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __67__MOEventBundleManager__bundleEventsWithRefreshVariant_andHandler___block_invoke_2;
  block[3] = &unk_1002B1F00;
  v21 = *(_QWORD *)(a1 + 88);
  v13 = *(id *)(a1 + 40);
  v14 = v6;
  v19 = *(id *)(a1 + 64);
  v15 = v5;
  v16 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v22 = *(_BYTE *)(a1 + 96);
  v9 = *(_QWORD *)(a1 + 32);
  v17 = v8;
  v18 = v9;
  v20 = *(_OWORD *)(a1 + 72);
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, block);

}

void __67__MOEventBundleManager__bundleEventsWithRefreshVariant_andHandler___block_invoke_2(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  id v16;
  _UNKNOWN **v17;
  void *i;
  void *v19;
  void *v20;
  double v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  os_signpost_id_t v32;
  MOPerformanceMeasurement *v33;
  void *v34;
  void *v35;
  _UNKNOWN **v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  MOPerformanceMeasurement *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  NSObject *v46;
  NSObject *v47;
  os_signpost_id_t v48;
  MOPerformanceMeasurement *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  NSObject *v60;
  NSObject *v61;
  os_signpost_id_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  NSObject *v72;
  NSObject *v73;
  os_signpost_id_t v74;
  MOPerformanceMeasurement *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  int8x16_t v79;
  uint64_t v80;
  MOPerformanceMeasurement *v81;
  id obj;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  BOOL v87;
  id v88;
  _QWORD v89[5];
  MOPerformanceMeasurement *v90;
  id v91;
  int8x16_t v92;
  uint64_t v93;
  _QWORD v94[4];
  id v95;
  MOPerformanceMeasurement *v96;
  _QWORD *v97;
  _BYTE *v98;
  uint64_t v99;
  BOOL v100;
  uint8_t v101[16];
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _QWORD v106[5];
  id v107;
  _QWORD v108[2];
  _QWORD v109[2];
  _QWORD v110[2];
  uint8_t v111[128];
  _BYTE buf[24];
  uint64_t (*v113)(uint64_t, uint64_t);
  void (*v114)(uint64_t);
  id v115;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 104);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_END, v5, "EventBundleManagerBundleEventsFetchEvents", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  v6 = *(_QWORD *)(a1 + 40) == 0;
  v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v11 = objc_msgSend(*(id *)(a1 + 48), "count");
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "dateInterval"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startDate"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "dateInterval"));
      v15 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endDate"));
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2112;
      v113 = v15;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "there are %lu event(s) to bundle from start date: %@ to end date : %@", buf, 0x20u);

    }
    v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), CFSTR("startDate")));
    v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), CFSTR("endDate")));
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v113 = __Block_byref_object_copy__19;
    v114 = __Block_byref_object_dispose__19;
    v115 = objc_alloc_init((Class)NSMutableDictionary);
    v106[0] = 0;
    v106[1] = v106;
    v106[2] = 0x3032000000;
    v106[3] = __Block_byref_object_copy__19;
    v106[4] = __Block_byref_object_dispose__19;
    v107 = 0;
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    obj = *(id *)(a1 + 64);
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v111, 16);
    v17 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
    if (v16)
    {
      v85 = *(_QWORD *)v103;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v103 != v85)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * (_QWORD)i);
          v20 = objc_autoreleasePoolPush();
          objc_msgSend(v19, "doubleValue");
          v22 = v21 == 604800.0;
          if (v21 == 604800.0 || *(_BYTE *)(a1 + 112))
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "dateByAddingTimeInterval:", -v21));
            v87 = v22;
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17[322], "predicateWithFormat:", CFSTR("%K >= %@"), v84, v23));
            v110[0] = v24;
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17[322], "predicateWithFormat:", CFSTR("%K <= %@"), v83, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40)));
            v110[1] = v25;
            v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v110, 2));
            v27 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v26));

            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "filteredArrayUsingPredicate:", v27));
            v88 = objc_msgSend(v28, "mutableCopy");

            v29 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            v30 = objc_claimAutoreleasedReturnValue(v29);
            v31 = v30;
            v32 = *(_QWORD *)(a1 + 104);
            if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
            {
              *(_WORD *)v101 = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_BEGIN, v32, "EventBundleManagerBundleEventsCollectTimeCorrelatedEvents", ", v101, 2u);
            }

            v33 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsCollectTimeCorrelatedEvents"), 0);
            -[MOPerformanceMeasurement startSession](v33, "startSession");
            v86 = *(void **)(a1 + 72);
            v34 = (void *)v27;
            v35 = v20;
            v36 = v17;
            v37 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
            v38 = v16;
            v39 = *(unsigned __int8 *)(a1 + 112);
            v94[0] = _NSConcreteStackBlock;
            v94[1] = 3221225472;
            v94[2] = __67__MOEventBundleManager__bundleEventsWithRefreshVariant_andHandler___block_invoke_285;
            v94[3] = &unk_1002B1EB0;
            v100 = v87;
            v97 = v106;
            v98 = buf;
            v40 = *(id *)(a1 + 48);
            v41 = *(_QWORD *)(a1 + 104);
            v95 = v40;
            v99 = v41;
            v42 = v33;
            v96 = v42;
            v43 = v37;
            v17 = v36;
            v20 = v35;
            v44 = v39;
            v16 = v38;
            objc_msgSend(v86, "_collectTimeCorrelatedEventsWithStartDate:endDate:events:submitMetricsFlg:handler:", v23, v43, v88, v44, v94);

          }
          objc_autoreleasePoolPop(v20);
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v111, 16);
      }
      while (v16);
    }

    if (*(_BYTE *)(a1 + 112))
    {
      v45 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v46 = objc_claimAutoreleasedReturnValue(v45);
      v47 = v46;
      v48 = *(_QWORD *)(a1 + 104);
      if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
      {
        *(_WORD *)v101 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v47, OS_SIGNPOST_INTERVAL_BEGIN, v48, "EventBundleManagerBundleEventsSubmitMetrics", ", v101, 2u);
      }

      v49 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsSubmitMetrics"), 0);
      -[MOPerformanceMeasurement startSession](v49, "startSession");
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "dateByAddingTimeInterval:", -259200.0));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "dateByAddingTimeInterval:", -172800.0));
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17[322], "predicateWithFormat:", CFSTR("%K >= %@"), v84, v50));
      v109[0] = v53;
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17[322], "predicateWithFormat:", CFSTR("%K <= %@"), v83, v51));
      v109[1] = v54;
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v109, 2));
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v55));

      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "filteredArrayUsingPredicate:", v56));
      v58 = objc_msgSend(v57, "mutableCopy");

      objc_msgSend(*(id *)(a1 + 72), "submitMOEventData:startDate:endDate:subDate:", v58, v50, v51, v52);
      v59 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v60 = objc_claimAutoreleasedReturnValue(v59);
      v61 = v60;
      v62 = *(_QWORD *)(a1 + 104);
      if (v62 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
      {
        *(_WORD *)v101 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v61, OS_SIGNPOST_INTERVAL_END, v62, "EventBundleManagerBundleEventsSubmitMetrics", ", v101, 2u);
      }

      -[MOPerformanceMeasurement endSession](v49, "endSession");
    }
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "startOfDayForDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40)));

    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17[322], "predicateWithFormat:", CFSTR("%K >= %@"), v84, v64));
    v108[0] = v65;
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17[322], "predicateWithFormat:", CFSTR("%K <= %@"), v83, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40)));
    v108[1] = v66;
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v108, 2));
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v67));

    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "filteredArrayUsingPredicate:", v68));
    v70 = objc_msgSend(v69, "mutableCopy");

    v71 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v72 = objc_claimAutoreleasedReturnValue(v71);
    v73 = v72;
    v74 = *(_QWORD *)(a1 + 104);
    if (v74 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
    {
      *(_WORD *)v101 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v73, OS_SIGNPOST_INTERVAL_BEGIN, v74, "EventBundleManagerBundleEventsDeep", ", v101, 2u);
    }

    v75 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsDeep"), 0);
    -[MOPerformanceMeasurement startSession](v75, "startSession");
    v76 = *(void **)(a1 + 72);
    v77 = *(unsigned __int8 *)(a1 + 112);
    v78 = *(_QWORD *)(a1 + 104);
    v89[0] = _NSConcreteStackBlock;
    v79 = vextq_s8(*(int8x16_t *)(a1 + 88), *(int8x16_t *)(a1 + 88), 8uLL);
    v80 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
    v89[1] = 3221225472;
    v89[2] = __67__MOEventBundleManager__bundleEventsWithRefreshVariant_andHandler___block_invoke_290;
    v89[3] = &unk_1002B1ED8;
    v89[4] = v76;
    v92 = v79;
    v93 = v78;
    v81 = v75;
    v90 = v81;
    v91 = *(id *)(a1 + 80);
    objc_msgSend(v76, "_bundleEvents:startDate:endDate:submitMetricsFlg:refreshVariant:handler:", v70, v64, v80, v77, v78, v89);

    _Block_object_dispose(v106, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __67__MOEventBundleManager__bundleEventsWithRefreshVariant_andHandler___block_invoke_2_cold_1();

    v10 = *(_QWORD *)(a1 + 80);
    if (v10)
      (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, *(_QWORD *)(a1 + 40), &__NSDictionary0__struct);
  }
}

void __67__MOEventBundleManager__bundleEventsWithRefreshVariant_andHandler___block_invoke_285(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id os_log;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  uint8_t v16[16];

  v5 = a2;
  v6 = a3;
  if (*(_BYTE *)(a1 + 72))
  {
    if (v5)
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v8 = v5;
      v9 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v8;
    }
    else
    {
      v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count")));
      objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("resultNumberOfEvents"));

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfBundleEvents")));
      if (v9)
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKey:", v9, CFSTR("resultNumberOfBundleEvents"));
    }

  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v13 = objc_claimAutoreleasedReturnValue(os_log);
  v14 = v13;
  v15 = *(_QWORD *)(a1 + 64);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, v15, "EventBundleManagerBundleEventsCollectTimeCorrelatedEvents", ", v16, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "endSession");
}

void __67__MOEventBundleManager__bundleEventsWithRefreshVariant_andHandler___block_invoke_290(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id os_log;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  uint8_t v14[16];

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultManager"));
    objc_msgSend(v7, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), CFSTR("EventBundleManagerLastBundlingStartDate"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultManager"));
    objc_msgSend(v8, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), CFSTR("EventBundleManagerLastBundlingEndDate"));

  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v10 = objc_claimAutoreleasedReturnValue(os_log);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 72);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, v12, "EventBundleManagerBundleEventsDeep", ", v14, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "endSession");
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v5, v6);

}

- (void)_bundleEvents:(id)a3 startDate:(id)a4 endDate:(id)a5 submitMetricsFlg:(BOOL)a6 refreshVariant:(unint64_t)a7 handler:(id)a8
{
  id v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  id v15;
  id os_log;
  NSObject *v17;
  NSMutableDictionary *v18;
  id v19;
  id v20;
  NSObject *v21;
  MOPerformanceMeasurement *v22;
  uint64_t v23;
  MOPerformanceMeasurement *v24;
  id v25;
  NSMutableDictionary *v26;
  id v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  id v29;
  id v30;
  id v33;
  _QWORD v34[4];
  MOPerformanceMeasurement *v35;
  MOEventBundleManager *v36;
  NSMutableDictionary *v37;
  id v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  id v40;
  id v41;
  id v42;
  _QWORD *v43;
  _BYTE *v44;
  SEL v45;
  unint64_t v46;
  BOOL v47;
  uint8_t v48[16];
  _QWORD v49[5];
  id v50;
  _BYTE buf[24];
  uint64_t (*v52)(uint64_t, uint64_t);
  __int128 v53;

  v33 = a3;
  v13 = a4;
  v14 = (uint64_t (*)(uint64_t, uint64_t))a5;
  v15 = a8;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v17 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218754;
    *(_QWORD *)&buf[4] = objc_msgSend(v33, "count");
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2112;
    v52 = v14;
    LOWORD(v53) = 2048;
    *(_QWORD *)((char *)&v53 + 2) = a7;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Bundle Annotation: there are %lu event(s) to bundle.(%@ - %@), refresh variant, %lu", buf, 0x2Au);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v52 = __Block_byref_object_copy__19;
  *(_QWORD *)&v53 = __Block_byref_object_dispose__19;
  *((_QWORD *)&v53 + 1) = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v13, v14);
  v18 = objc_opt_new(NSMutableDictionary);
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__19;
  v49[4] = __Block_byref_object_dispose__19;
  v50 = 0;
  v19 = objc_alloc_init((Class)NSMutableDictionary);
  v20 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_signpost_enabled(v21))
  {
    *(_WORD *)v48 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepFetchPreviousBundles", ", v48, 2u);
  }

  v22 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsDeepFetchPreviousBundles"), 0);
  -[MOPerformanceMeasurement startSession](v22, "startSession");
  v23 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke;
  v34[3] = &unk_1002B2040;
  v24 = v22;
  v35 = v24;
  v43 = v49;
  v25 = v15;
  v44 = buf;
  v45 = a2;
  v42 = v25;
  v36 = self;
  v26 = v18;
  v37 = v26;
  v46 = a7;
  v27 = v13;
  v38 = v27;
  v28 = v14;
  v39 = v28;
  v29 = v19;
  v40 = v29;
  v30 = v33;
  v41 = v30;
  v47 = a6;
  -[MOEventBundleManager _fetchPreviousBundlesWithDateInterval:handler:](self, "_fetchPreviousBundlesWithDateInterval:handler:", v23, v34);

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(buf, 8);

}

void __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id os_log;
  NSObject *v5;
  id v6;
  NSObject *v7;
  NSString *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  id v16;
  NSObject *v17;
  NSString *v18;
  void *v19;
  MOEventBundleFetchOptions *v20;
  id v21;
  NSObject *v22;
  MOPerformanceMeasurement *v23;
  void *v24;
  MOPerformanceMeasurement *v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  _QWORD v38[4];
  MOPerformanceMeasurement *v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  _BYTE *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint8_t v54[16];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE buf[24];
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  _BYTE v63[128];

  v35 = a2;
  v36 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepFetchPreviousBundles", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  if (v36)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), a3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  }
  else
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v35));
    v6 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = NSStringFromSelector(*(SEL *)(a1 + 112));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = objc_msgSend(v35, "count");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@, previousEventBundles %lu", buf, 0x16u);

    }
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v11 = v35;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v56 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
          v16 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v18 = NSStringFromSelector(*(SEL *)(a1 + 112));
            v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v19;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v15;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%@, previousEventBundles %@", buf, 0x16u);

          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      }
      while (v12);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v60 = __Block_byref_object_copy__19;
    v61 = __Block_byref_object_dispose__19;
    v62 = 0;
    v20 = -[MOEventBundleFetchOptions initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:interfaceType:]([MOEventBundleFetchOptions alloc], "initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:interfaceType:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), 1, 0, 0, 1, 13);
    v21 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)v54 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepFetchTripBundlesFetchWithOptions", ", v54, 2u);
    }

    v23 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsDeepFetchTripBundlesFetchWithOptions"), 0);
    -[MOPerformanceMeasurement startSession](v23, "startSession");
    v24 = *(void **)(a1 + 40);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke_301;
    v38[3] = &unk_1002B2018;
    v25 = v23;
    v39 = v25;
    v48 = buf;
    v26 = *(void **)(a1 + 88);
    v49 = *(_QWORD *)(a1 + 96);
    v27 = v26;
    v51 = *(_QWORD *)(a1 + 112);
    v28 = *(_QWORD *)(a1 + 40);
    v47 = v27;
    v40 = v28;
    v29 = v34;
    v41 = v29;
    v30 = *(id *)(a1 + 48);
    v31 = *(_QWORD *)(a1 + 120);
    v42 = v30;
    v52 = v31;
    v43 = *(id *)(a1 + 56);
    v32 = *(id *)(a1 + 64);
    v33 = *(_QWORD *)(a1 + 104);
    v44 = v32;
    v50 = v33;
    v45 = *(id *)(a1 + 72);
    v46 = *(id *)(a1 + 80);
    v53 = *(_BYTE *)(a1 + 128);
    objc_msgSend(v24, "fetchRehydratedEventBundlesWithOptions:CompletionHandler:", v20, v38);

    _Block_object_dispose(buf, 8);
  }

}

void __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke_301(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSString *v12;
  void *v13;
  id v14;
  MOEventBundleFetchOptions *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  uint64_t v44;

  v6 = a2;
  v7 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepFetchTripBundlesFetchWithOptions", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), a2);
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), a3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
  }
  else
  {
    v10 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = NSStringFromSelector(*(SEL *)(a1 + 128));
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = objc_msgSend(v6, "count");
      *(_DWORD *)buf = 138412802;
      v40 = v13;
      v41 = 2048;
      v42 = v14;
      v43 = 2112;
      v44 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@, fetched trip bundle count, %lu, error, %@", buf, 0x20u);

    }
    v15 = -[MOEventBundleFetchOptions initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:interfaceType:]([MOEventBundleFetchOptions alloc], "initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:interfaceType:", 0, 1, 0, 0, 1, 10);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "eventBundleStore"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke_302;
    v24[3] = &unk_1002B1FF0;
    v17 = *(_QWORD *)(a1 + 112);
    v36 = *(_QWORD *)(a1 + 128);
    v34 = v17;
    v33 = *(id *)(a1 + 96);
    v18 = *(id *)(a1 + 48);
    v19 = *(_QWORD *)(a1 + 40);
    v25 = v18;
    v26 = v19;
    v20 = *(id *)(a1 + 56);
    v21 = *(_QWORD *)(a1 + 136);
    v27 = v20;
    v37 = v21;
    v28 = *(id *)(a1 + 64);
    v22 = *(id *)(a1 + 72);
    v23 = *(_QWORD *)(a1 + 120);
    v29 = v22;
    v35 = v23;
    v30 = *(id *)(a1 + 80);
    v31 = *(id *)(a1 + 88);
    v32 = v6;
    v38 = *(_BYTE *)(a1 + 144);
    objc_msgSend(v16, "fetchEventBundleWithOptions:CompletionHandler:", v15, v24);

  }
}

void __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke_302(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSString *v9;
  void *v10;
  void (*v11)(void);
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  MOPerformanceMeasurement *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  MOPerformanceMeasurement *v43;
  id v44;
  NSObject *v45;
  NSString *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  __int128 v51;
  int8x16_t v52;
  id v53;
  _QWORD v54[4];
  MOPerformanceMeasurement *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  int8x16_t v60;
  id v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  id v73;
  __int16 v74;
  id v75;
  __int16 v76;
  void *v77;
  _BYTE v78[128];

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = NSStringFromSelector(*(SEL *)(a1 + 120));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 138412802;
    v71 = v10;
    v72 = 2048;
    v73 = objc_msgSend(v5, "count");
    v74 = 2112;
    v75 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@, fetched photo memory bundle count, %lu, error, %@", buf, 0x20u);

  }
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), a3);
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 96) + 16);
LABEL_5:
    v11();
    goto LABEL_25;
  }
  if (objc_msgSend(v5, "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v5);
  v53 = v5;
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v12 = *(id *)(a1 + 32);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v67 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_concatenatedEventIdentifierForBundle:", v17));
        if (v18)
        {
          v19 = *(void **)(a1 + 48);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bundleIdentifier"));
          objc_msgSend(v19, "setObject:forKey:", v20, v18);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
    }
    while (v14);
  }

  if ((*(_QWORD *)(a1 + 128) | 0x100) != 0x300)
    goto LABEL_20;
  if (objc_msgSend(*(id *)(a1 + 56), "isBeforeDate:", *(_QWORD *)(a1 + 64)))
  {
    v21 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

LABEL_20:
    v24 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = NSStringFromSelector(*(SEL *)(a1 + 120));
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v28 = *(void **)(a1 + 56);
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8)
                                                                         + 40), "startDate"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8)
                                                                         + 40), "endDate"));
      *(_DWORD *)buf = 138413058;
      v71 = v27;
      v72 = 2112;
      v73 = v28;
      v74 = 2112;
      v75 = v29;
      v76 = 2112;
      v77 = v30;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%@, bundling startDate, %@, adjusted startDate, %@, endDate, %@", buf, 0x2Au);

    }
    v31 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundles", ", buf, 2u);
    }

    v33 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsDeepAnnotateEventBundles"), 0);
    -[MOPerformanceMeasurement startSession](v33, "startSession");
    v34 = *(void **)(a1 + 40);
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "startDate"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "endDate"));
    v38 = *(_QWORD *)(a1 + 80);
    v37 = *(_QWORD *)(a1 + 88);
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke_307;
    v54[3] = &unk_1002B1FC8;
    v55 = v33;
    v56 = *(id *)(a1 + 72);
    v57 = *(id *)(a1 + 80);
    v58 = *(id *)(a1 + 56);
    v59 = *(id *)(a1 + 64);
    v51 = *(_OWORD *)(a1 + 96);
    v39 = (id)v51;
    v62 = v51;
    v52 = *(int8x16_t *)(a1 + 32);
    v40 = (id)v52.i64[0];
    v60 = vextq_s8(v52, v52, 8uLL);
    v63 = *(_QWORD *)(a1 + 112);
    v41 = *(id *)(a1 + 48);
    v65 = *(_BYTE *)(a1 + 136);
    v42 = *(_QWORD *)(a1 + 128);
    v61 = v41;
    v64 = v42;
    v43 = v33;
    objc_msgSend(v34, "_annotateEventBundlesWithStartDate:endDate:allEvents:eventBundles:handler:", v35, v36, v38, v37, v54);

    v5 = v53;
    goto LABEL_25;
  }
  v44 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v45 = objc_claimAutoreleasedReturnValue(v44);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    v46 = NSStringFromSelector(*(SEL *)(a1 + 120));
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
    *(_DWORD *)buf = 138412290;
    v71 = v47;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "%@, skip bundling due to no valid startDate!", buf, 0xCu);

  }
  v48 = *(void **)(a1 + 72);
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 80), "count")));
  objc_msgSend(v48, "setObject:forKey:", v49, CFSTR("resultNumberOfEvents"));

  objc_msgSend(*(id *)(a1 + 72), "setObject:forKey:", &off_1002D8F90, CFSTR("resultNumberOfBundleEvents"));
  v50 = *(_QWORD *)(a1 + 96);
  v5 = v53;
  if (v50)
  {
    v11 = *(void (**)(void))(v50 + 16);
    goto LABEL_5;
  }
LABEL_25:

}

void __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke_307(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  id v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  MOPerformanceMeasurement *v23;
  MOSummarizationManager *v24;
  id v25;
  NSObject *v26;
  MOPerformanceMeasurement *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  MOPerformanceMeasurement *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  uint64_t v37;
  _QWORD v38[5];
  id v39;
  id v40;
  MOPerformanceMeasurement *v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  _BYTE *v46;
  uint64_t v47;
  char v48;
  _BYTE buf[24];
  uint64_t (*v50)(uint64_t, uint64_t);
  __int128 v51;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundles", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  v9 = *(void **)(a1 + 40);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "count")));
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("resultNumberOfEvents"));

  v11 = *(void **)(a1 + 40);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count")));
  objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("resultNumberOfBundleEvents"));

  v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = *(_QWORD *)(a1 + 56);
    v16 = *(_QWORD *)(a1 + 64);
    v17 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 40);
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2112;
    v50 = v17;
    LOWORD(v51) = 2112;
    *(_QWORD *)((char *)&v51 + 2) = v6;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "_annotateEventBundlesWithStartDate, startDate, %@, endDate, %@, results, %@, error, %@", buf, 0x2Au);
  }

  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), a3);
    v18 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v35 = *(_QWORD *)(a1 + 56);
      v34 = *(_QWORD *)(a1 + 64);
      v36 = (uint64_t (*)(uint64_t, uint64_t))objc_msgSend(*(id *)(a1 + 48), "count");
      v37 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v35;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v34;
      *(_WORD *)&buf[22] = 2048;
      v50 = v36;
      LOWORD(v51) = 2112;
      *(_QWORD *)((char *)&v51 + 2) = v37;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "annotate bundle error, startDate, %@, endDate, %@, events, %lu, error, %@", buf, 0x2Au);
    }

    v20 = *(_QWORD *)(a1 + 96);
    if (v20)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v20 + 16))(v20, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v21 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepSummarization", ", buf, 2u);
    }

    v23 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsDeepSummarization"), 0);
    -[MOPerformanceMeasurement startSession](v23, "startSession");
    v24 = -[MOSummarizationManager initWithUniverse:]([MOSummarizationManager alloc], "initWithUniverse:", *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8));
    v25 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepSummarizationAggregation", ", buf, 2u);
    }

    v27 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsDeepSummarizationAggregation"), 0);
    -[MOPerformanceMeasurement startSession](v27, "startSession");
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v50 = __Block_byref_object_copy__19;
    *(_QWORD *)&v51 = __Block_byref_object_dispose__19;
    *((_QWORD *)&v51 + 1) = 0;
    objc_msgSend(*(id *)(a1 + 72), "updateSuggestionIDAndFirstCreationDateForNewEventBundles:previousEventBundles:", v5, *(_QWORD *)(a1 + 80));
    v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke_313;
    v38[3] = &unk_1002B1FA0;
    v38[4] = *(_QWORD *)(a1 + 72);
    v39 = *(id *)(a1 + 88);
    v29 = *(id *)(a1 + 80);
    v30 = *(_QWORD *)(a1 + 112);
    v40 = v29;
    v45 = v30;
    v31 = v27;
    v41 = v31;
    v42 = *(id *)(a1 + 48);
    v46 = buf;
    v32 = *(id *)(a1 + 96);
    v48 = *(_BYTE *)(a1 + 128);
    v33 = *(_QWORD *)(a1 + 120);
    v44 = v32;
    v47 = v33;
    v43 = *(id *)(a1 + 40);
    -[MOSummarizationManager aggregateEventBundles:withAggregtaionDateInterval:handler:](v24, "aggregateEventBundles:withAggregtaionDateInterval:handler:", v5, v28, v38);

    _Block_object_dispose(buf, 8);
  }

}

void __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke_313(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id os_log;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  MOPerformanceMeasurement *v27;
  void *v28;
  __int128 v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  id v35;
  MOPerformanceMeasurement *v36;
  uint64_t v37;
  _QWORD v38[4];
  MOPerformanceMeasurement *v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  id v44;
  __int128 v45;
  uint64_t v46;
  char v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;
  _BYTE v60[128];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "updateMetaDataForRankInEventBundles:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_updateIdentifiersForEventBundles:eventIDsToBundleIDMapping:", v4, *(_QWORD *)(a1 + 40)));

  objc_msgSend(*(id *)(a1 + 32), "updateSuggestionIDAndFirstCreationDateForNewEventBundles:previousEventBundles:", v5, *(_QWORD *)(a1 + 48));
  v37 = a1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_updateIdentifiersForEvergreenBundles:", v5));

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v14 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v53 = v12;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "After summarization Bundles : %@", buf, 0xCu);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
    }
    while (v9);
  }

  objc_msgSend(*(id *)(v37 + 32), "associateEventBundles:effectiveInterval:", v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v37 + 88) + 8) + 40));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v37 + 32), "eventBundleRanking"));
  v16 = objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v15, "generateBundleRanking:withMinRecommendedBundleCountRequirement:", v16, 0);

  v17 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepSummarizationAggregation", ", buf, 2u);
  }

  objc_msgSend(*(id *)(v37 + 56), "endSession");
  v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v37 + 88) + 8) + 40), "startDate"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v37 + 88) + 8) + 40), "endDate"));
    v23 = objc_msgSend(*(id *)(v37 + 64), "count");
    v24 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 138413058;
    v53 = v21;
    v54 = 2112;
    v55 = v22;
    v56 = 2048;
    v57 = v23;
    v58 = 2048;
    v59 = v24;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "after associateEventBundles, startDate, %@, endDate, %@, events, %lu, bundles, %lu", buf, 0x2Au);

  }
  v25 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepSummarizationRemoveEventBundles", ", buf, 2u);
  }

  v27 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsDeepSummarizationRemoveEventBundles"), 0);
  -[MOPerformanceMeasurement startSession](v27, "startSession");
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v37 + 32), "eventBundleStore"));
  v38[0] = _NSConcreteStackBlock;
  v29 = *(_OWORD *)(v37 + 88);
  v30 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v37 + 88) + 8) + 40);
  v38[1] = 3221225472;
  v38[2] = __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke_316;
  v38[3] = &unk_1002B1F78;
  v45 = v29;
  v31 = *(id *)(v37 + 80);
  v32 = *(_QWORD *)(v37 + 32);
  v39 = v27;
  v40 = v32;
  v44 = v31;
  v41 = v7;
  v33 = *(id *)(v37 + 64);
  v47 = *(_BYTE *)(v37 + 112);
  v34 = *(_QWORD *)(v37 + 104);
  v42 = v33;
  v46 = v34;
  v43 = *(id *)(v37 + 72);
  v35 = v7;
  v36 = v27;
  objc_msgSend(v28, "removeEventBundlesStartedWithinInterval:CompletionHandler:", v30, v38);

}

void __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke_316(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  MOPerformanceMeasurement *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  MOPerformanceMeasurement *v25;
  __int128 v26;
  _QWORD v27[4];
  MOPerformanceMeasurement *v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;

  v6 = a2;
  v7 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "startDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "endDate"));
    *(_DWORD *)buf = 138413058;
    v38 = v10;
    v39 = 2112;
    v40 = v11;
    v41 = 2112;
    v42 = v7;
    v43 = 2112;
    v44 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "removeEventBundlesStartedWithinInterval, startDate, %@, endDate, %@, results, %@, error, %@", buf, 0x2Au);

  }
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepSummarizationRemoveEventBundles", ", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "endSession");
  }
  else
  {
    v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepSummarizationRemoveEventBundles", ", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "endSession");
    v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepSummarizationPurgeEventBundles", ", buf, 2u);
    }

    v18 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsDeepSummarizationPurgeEventBundles"), 0);
    -[MOPerformanceMeasurement startSession](v18, "startSession");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "eventBundleStore"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke_319;
    v27[3] = &unk_1002B1F78;
    v34 = *(_QWORD *)(a1 + 88);
    v26 = *(_OWORD *)(a1 + 72);
    v20 = (id)v26;
    v33 = v26;
    v21 = *(_QWORD *)(a1 + 40);
    v22 = *(void **)(a1 + 48);
    v28 = v18;
    v29 = v21;
    v30 = v22;
    v23 = *(id *)(a1 + 56);
    v36 = *(_BYTE *)(a1 + 104);
    v24 = *(_QWORD *)(a1 + 96);
    v31 = v23;
    v35 = v24;
    v32 = *(id *)(a1 + 64);
    v25 = v18;
    objc_msgSend(v19, "purgeDeletedEventBundlesWithCompletionHandler:", v27);

  }
}

void __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke_319(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  MOPerformanceMeasurement *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  MOPerformanceMeasurement *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  MOPerformanceMeasurement *v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;

  v6 = a2;
  v7 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "startDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "endDate"));
    *(_DWORD *)buf = 138413058;
    v36 = v10;
    v37 = 2112;
    v38 = v11;
    v39 = 2112;
    v40 = v7;
    v41 = 2112;
    v42 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "purgeDeletedEventBundlesWithCompletionHandler, startDate, %@, endDate, %@, results, %@, error, %@", buf, 0x2Au);

  }
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepSummarizationPurgeEventBundles", ", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "endSession");
  }
  else
  {
    v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepSummarizationPurgeEventBundles", ", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "endSession");
    v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepSummarizationSaveEventBundles", ", buf, 2u);
    }

    v18 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsDeepSummarizationSaveEventBundles"), 0);
    -[MOPerformanceMeasurement startSession](v18, "startSession");
    v19 = *(void **)(a1 + 40);
    v20 = *(_QWORD *)(a1 + 48);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke_322;
    v24[3] = &unk_1002B1F50;
    v31 = *(_QWORD *)(a1 + 80);
    v25 = *(id *)(a1 + 56);
    v26 = *(id *)(a1 + 48);
    v27 = v18;
    v34 = *(_BYTE *)(a1 + 104);
    v21 = *(_QWORD *)(a1 + 40);
    v22 = *(_QWORD *)(a1 + 96);
    v32 = *(_QWORD *)(a1 + 88);
    v33 = v22;
    v28 = v21;
    v30 = *(id *)(a1 + 72);
    v29 = *(id *)(a1 + 64);
    v23 = v18;
    objc_msgSend(v19, "saveEventBundles:handler:", v20, v24);

  }
}

void __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke_322(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  MOPerformanceMeasurement *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  NSObject *v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  MOPerformanceMeasurement *v36;
  int v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;

  v6 = a2;
  v7 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "startDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "endDate"));
    v12 = objc_msgSend(*(id *)(a1 + 32), "count");
    v13 = objc_msgSend(*(id *)(a1 + 40), "count");
    v37 = 138413570;
    v38 = v10;
    v39 = 2112;
    v40 = v11;
    v41 = 2048;
    v42 = v12;
    v43 = 2048;
    v44 = v13;
    v45 = 2112;
    v46 = v6;
    v47 = 2112;
    v48 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "saveEventBundles, startDate, %@, endDate, %@, events, %lu, bundles, %lu, error, %@, results, %@", (uint8_t *)&v37, 0x3Eu);

  }
  v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_signpost_enabled(v15))
  {
    LOWORD(v37) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepSummarizationSaveEventBundles", ", (uint8_t *)&v37, 2u);
  }

  objc_msgSend(*(id *)(a1 + 48), "endSession");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), a2);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
  {
    v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_signpost_enabled(v17))
    {
      LOWORD(v37) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepSummarizationSubmitMetrics", ", (uint8_t *)&v37, 2u);
    }

    v18 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsDeepSummarizationSubmitMetrics"), 0);
    -[MOPerformanceMeasurement startSession](v18, "startSession");
    if (*(_BYTE *)(a1 + 104))
    {
      if (+[MOPlatformInfo isInternalBuild](MOPlatformInfo, "isInternalBuild"))
      {
        v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          LOWORD(v37) = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Submit internal eventBundle analytics", (uint8_t *)&v37, 2u);
        }

        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        objc_msgSend(*(id *)(a1 + 56), "submitEventBundleInternalAnalytics:withSubmissionDate:withRefreshVariant:", *(_QWORD *)(a1 + 40), v21, *(_QWORD *)(a1 + 96));

      }
      v22 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LOWORD(v37) = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "starting biome donation.", (uint8_t *)&v37, 2u);
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "onboardingAndSettingsPersistence"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "getSnapshotDictionaryForAnalytics"));

      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "biomeManager"));
      objc_msgSend(v26, "donateEvents:andBundles:andOnboardingStatus:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v25);

      v27 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = objc_msgSend(*(id *)(a1 + 32), "count");
        v30 = objc_msgSend(*(id *)(a1 + 40), "count");
        v37 = 134218240;
        v38 = v29;
        v39 = 2048;
        v40 = v30;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "finished biome donation with %lu event candidates, and %lu bundle candidates.", (uint8_t *)&v37, 0x16u);
      }

      v31 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_signpost_enabled(v32))
      {
        LOWORD(v37) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepSummarizationSubmitMetrics", ", (uint8_t *)&v37, 2u);
      }

      -[MOPerformanceMeasurement endSession](v18, "endSession");
    }

  }
  v33 = *(_QWORD *)(a1 + 72);
  if (v33)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v33 + 16))(v33, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), *(_QWORD *)(a1 + 64));
  v34 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v35 = objc_claimAutoreleasedReturnValue(v34);
  if (os_signpost_enabled(v35))
  {
    LOWORD(v37) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepSummarization", ", (uint8_t *)&v37, 2u);
  }

  v36 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsDeepSummarization"), 0);
  -[MOPerformanceMeasurement startSession](v36, "startSession");

}

- (void)_fetchPreviousBundlesWithDateInterval:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  MOEventBundleFetchOptions *v8;
  id os_log;
  NSObject *v10;
  MOPerformanceMeasurement *v11;
  void *v12;
  MOEventBundleFetchOptions *v13;
  id v14;
  MOPerformanceMeasurement *v15;
  _QWORD v16[4];
  MOPerformanceMeasurement *v17;
  MOEventBundleFetchOptions *v18;
  MOEventBundleManager *v19;
  id v20;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  v8 = -[MOEventBundleFetchOptions initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:]([MOEventBundleFetchOptions alloc], "initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:", v7, 1, 0, 1, 1);

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v10 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepFetchPreviousBundlesFetchWithOptions", ", buf, 2u);
  }

  v11 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsDeepFetchPreviousBundlesFetchWithOptions"), 0);
  -[MOPerformanceMeasurement startSession](v11, "startSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager eventBundleStore](self, "eventBundleStore"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __70__MOEventBundleManager__fetchPreviousBundlesWithDateInterval_handler___block_invoke;
  v16[3] = &unk_1002AECB8;
  v17 = v11;
  v18 = v8;
  v19 = self;
  v20 = v6;
  v13 = v8;
  v14 = v6;
  v15 = v11;
  objc_msgSend(v12, "fetchEventBundleWithOptions:CompletionHandler:", v13, v16);

}

void __70__MOEventBundleManager__fetchPreviousBundlesWithDateInterval_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  void (*v9)(void);
  void *v10;
  double v11;
  double v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  MOPerformanceMeasurement *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  MOPerformanceMeasurement *v24;
  _QWORD v25[4];
  MOPerformanceMeasurement *v26;
  id v27;
  uint64_t v28;
  id v29;
  uint8_t buf[4];
  id v31;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepFetchPreviousBundlesFetchWithOptions", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  if (v6)
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_9:
    v9();
    goto LABEL_10;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "dateInterval"));
  objc_msgSend(v10, "duration");
  v12 = v11;

  if (v12 < 604800.0)
  {
    v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 134217984;
      v31 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "total number of previous bundle fetched, %lu", buf, 0xCu);
    }

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_9;
  }
  v16 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", &off_1002D8FA8, &off_1002D8FC0, &off_1002D8FD8, 0);
  v17 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepFetchPreviousBundlesFetchWithGranularity", ", buf, 2u);
  }

  v19 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsDeepFetchPreviousBundlesFetchWithGranularity"), 0);
  -[MOPerformanceMeasurement startSession](v19, "startSession");
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "eventBundleStore"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = __70__MOEventBundleManager__fetchPreviousBundlesWithDateInterval_handler___block_invoke_334;
  v25[3] = &unk_1002B2090;
  v26 = v19;
  v21 = v5;
  v22 = *(_QWORD *)(a1 + 48);
  v23 = *(void **)(a1 + 56);
  v27 = v21;
  v28 = v22;
  v29 = v23;
  v24 = v19;
  objc_msgSend(v20, "fetchEventBundleWithGranularity:interfaceTypes:CompletionHandler:", 2, v16, v25);

LABEL_10:
}

void __70__MOEventBundleManager__fetchPreviousBundlesWithDateInterval_handler___block_invoke_334(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  MOPerformanceMeasurement *v20;
  void *v21;
  void *v22;
  NSMutableSet *v23;
  MOPerformanceMeasurement *v24;
  NSMutableSet *v25;
  uint64_t v26;
  _QWORD v27[4];
  MOPerformanceMeasurement *v28;
  NSMutableSet *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepFetchPreviousBundlesFetchWithGranularity", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  v6 = objc_opt_new(NSMutableSet);
  v7 = objc_opt_new(NSMutableSet);
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
    -[NSMutableSet addObjectsFromArray:](v6, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  v25 = v6;
  v26 = a1;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "action", v25));
        v15 = objc_msgSend(v14, "actionType");

        if (v15 != (id)2)
        {
          v16 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v36 = v13;
            _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "previous summary bundle fetched, %@", buf, 0xCu);
          }

          -[NSMutableSet addObject:](v7, "addObject:", v13);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v10);
  }

  -[NSMutableSet minusSet:](v25, "minusSet:", v7);
  v18 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepFetchPreviousBundlesRemoveEventBundle", ", buf, 2u);
  }

  v20 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsDeepFetchPreviousBundlesRemoveEventBundle"), 0);
  -[MOPerformanceMeasurement startSession](v20, "startSession");
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v26 + 48), "eventBundleStore"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v7, "allObjects"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = __70__MOEventBundleManager__fetchPreviousBundlesWithDateInterval_handler___block_invoke_338;
  v27[3] = &unk_1002B2068;
  v28 = v20;
  v29 = v25;
  v30 = *(id *)(v26 + 56);
  v23 = v25;
  v24 = v20;
  objc_msgSend(v21, "removeEventBundles:CompletionHandler:", v22, v27);

}

void __70__MOEventBundleManager__fetchPreviousBundlesWithDateInterval_handler___block_invoke_338(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v3))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepFetchPreviousBundlesRemoveEventBundle", ", (uint8_t *)&v9, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  v4 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_msgSend(*(id *)(a1 + 40), "count");
    v9 = 134217984;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "total number of previous bundle fetched (removing media, wokout and contact summary bundles), %lu", (uint8_t *)&v9, 0xCu);
  }

  v7 = *(_QWORD *)(a1 + 48);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "allObjects"));
  (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);

}

- (void)_filterPreOnboardedVisitEvents:(id)a3 handler:(id)a4
{
  id v5;
  void (**v6)(id, void *, void *);
  NSMutableArray *v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id os_log;
  NSObject *v18;
  _BOOL4 v19;
  NSMutableArray *v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  void (**v29)(id, void *, void *);
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  id v36;
  char v37[16];
  char v38[16];
  char v39[16];
  _BYTE v40[128];

  v5 = a3;
  v6 = (void (**)(id, void *, void *))a4;
  if (!objc_msgSend(v5, "count"))
  {
    v6[2](v6, &__NSArray0__struct, &__NSArray0__struct);
    goto LABEL_28;
  }
  v29 = v6;
  v7 = objc_opt_new(NSMutableArray);
  v8 = objc_opt_new(NSMutableArray);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v30 = v5;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (!v10)
    goto LABEL_22;
  v11 = v10;
  v12 = *(_QWORD *)v32;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v32 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v13);
      if (objc_msgSend(v14, "category") == (id)1)
      {
        if (objc_msgSend(v14, "category") != (id)1)
          goto LABEL_17;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "routineEvent"));
        v16 = objc_msgSend(v15, "isPreOnboardedVisit");

        os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v18 = objc_claimAutoreleasedReturnValue(os_log);
        v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
        if (v16)
        {
          if (v19)
            -[MOEventBundleManager _filterPreOnboardedVisitEvents:handler:].cold.1((uint64_t)v38, (uint64_t)v14);
          v20 = v7;
          goto LABEL_16;
        }
        if (v19)
          -[MOEventBundleManager _filterPreOnboardedVisitEvents:handler:].cold.2((uint64_t)v37, (uint64_t)v14);
      }
      else
      {
        v21 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v18 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[MOEventBundleManager _filterPreOnboardedVisitEvents:handler:].cold.3((uint64_t)v39, (uint64_t)v14);
      }
      v20 = v8;
LABEL_16:

      -[NSMutableArray addObject:](v20, "addObject:", v14);
LABEL_17:
      v13 = (char *)v13 + 1;
    }
    while (v11 != v13);
    v22 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    v11 = v22;
  }
  while (v22);
LABEL_22:

  v23 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = -[NSMutableArray count](v7, "count");
    *(_DWORD *)buf = 134217984;
    v36 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, " Found %lu pre onboarded visit events", buf, 0xCu);
  }

  v26 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  v5 = v30;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v28 = -[NSMutableArray count](v8, "count");
    *(_DWORD *)buf = 134217984;
    v36 = v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, " Found %lu rest events", buf, 0xCu);
  }

  v6 = v29;
  v29[2](v29, v7, v8);

LABEL_28:
}

- (void)_annotateEventBundlesWithStartDate:(id)a3 endDate:(id)a4 allEvents:(id)a5 eventBundles:(id)a6 handler:(id)a7
{
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id os_log;
  NSObject *v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *i;
  void *v31;
  id v32;
  NSObject *v33;
  NSString *v34;
  id v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *j;
  void *v45;
  id v46;
  NSObject *v47;
  NSString *v48;
  id v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void *v51;
  id v52;
  void *v53;
  MODaemonUniverse *fUniverse;
  uint64_t v55;
  objc_class *v56;
  NSString *v57;
  void *v58;
  id v59;
  NSObject *v60;
  id v61;
  id v62;
  NSObject *v63;
  MOPerformanceMeasurement *v64;
  MOPreOnboardedVisitAnnotationManager *v65;
  NSArray *v66;
  NSObject *v67;
  MOPerformanceMeasurement *v68;
  id v69;
  NSObject *v70;
  MOPerformanceMeasurement *v71;
  MOVisitAnnotationManager *v72;
  NSObject *v73;
  MOPerformanceMeasurement *v74;
  id v75;
  NSObject *v76;
  MOPerformanceMeasurement *v77;
  MOTripAnnotationManager *v78;
  NSObject *v79;
  MOPerformanceMeasurement *v80;
  id v81;
  NSObject *v82;
  MOPerformanceMeasurement *v83;
  MOWorkoutAnnotationManager *v84;
  NSObject *v85;
  MOPerformanceMeasurement *v86;
  id v87;
  NSObject *v88;
  MOPerformanceMeasurement *v89;
  MOStateOfMindAnnotationManager *v90;
  NSObject *v91;
  MOPerformanceMeasurement *v92;
  id v93;
  NSObject *v94;
  MOPerformanceMeasurement *v95;
  MOConversationAnnotationManager *v96;
  NSObject *v97;
  id v98;
  NSObject *v99;
  MOPerformanceMeasurement *v100;
  MOMediaPlayAnnotationManager *v101;
  NSObject *v102;
  id v103;
  NSObject *v104;
  MOPerformanceMeasurement *v105;
  MOTrendAnnotationManager *v106;
  NSObject *v107;
  id v108;
  NSObject *v109;
  MOPerformanceMeasurement *v110;
  MOTimeAtHomeAnomalyManager *v111;
  NSObject *v112;
  id v113;
  NSObject *v114;
  MOPerformanceMeasurement *v115;
  MOPhotosAtHomeManager *v116;
  NSObject *v117;
  id v118;
  NSObject *v119;
  MOPerformanceMeasurement *v120;
  MOHostingAtHomeManager *v121;
  NSObject *v122;
  id v123;
  NSObject *v124;
  MOPerformanceMeasurement *v125;
  MOSharedContentAnnotationManager *v126;
  NSObject *v127;
  id v128;
  NSObject *v129;
  MOPerformanceMeasurement *v130;
  MOPhotoMemoryAnnotationManager *v131;
  NSObject *v132;
  id v133;
  NSObject *v134;
  MOHostingAtHomeManager *v135;
  MOPerformanceMeasurement *v136;
  MOPhotosAtHomeManager *v137;
  id v138;
  MOEvergreenAnnotationManager *v139;
  NSObject *v140;
  MOPerformanceMeasurement *v141;
  NSObject *v142;
  MOPerformanceMeasurement *v143;
  MOPhotoMemoryAnnotationManager *v144;
  MOPerformanceMeasurement *v145;
  MOPerformanceMeasurement *v146;
  MOPerformanceMeasurement *v147;
  MOSharedContentAnnotationManager *v148;
  MOPerformanceMeasurement *v149;
  MOTimeAtHomeAnomalyManager *v150;
  MOPerformanceMeasurement *v151;
  MOTrendAnnotationManager *v152;
  MOPerformanceMeasurement *v153;
  MOMediaPlayAnnotationManager *v154;
  MOPerformanceMeasurement *v155;
  MOConversationAnnotationManager *v156;
  MOPerformanceMeasurement *v157;
  MOStateOfMindAnnotationManager *v158;
  MOPerformanceMeasurement *v159;
  MOWorkoutAnnotationManager *v160;
  MOPerformanceMeasurement *v161;
  MOTripAnnotationManager *v162;
  MOPerformanceMeasurement *v163;
  MOVisitAnnotationManager *v164;
  MOPerformanceMeasurement *v165;
  void *v166;
  void *v167;
  void *v168;
  NSMutableArray *v169;
  id v170;
  NSMutableArray *v171;
  NSObject *group;
  dispatch_group_t groupa;
  id v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  id v180;
  uint64_t (*v181)(uint64_t, uint64_t);
  id v182;
  void *v183;
  void *v184;
  id v186;
  char *aSelectora;
  id obj;
  _QWORD block[4];
  NSMutableArray *v191;
  id v192;
  _BYTE *v193;
  uint8_t *v194;
  uint8_t *v195;
  uint8_t *v196;
  uint8_t *v197;
  uint8_t *v198;
  uint8_t *v199;
  uint8_t *v200;
  uint8_t *v201;
  uint8_t *v202;
  uint8_t *v203;
  uint8_t *v204;
  uint8_t *v205;
  uint8_t *v206;
  _QWORD *v207;
  _QWORD *v208;
  _QWORD v209[4];
  NSObject *v210;
  MOPerformanceMeasurement *v211;
  uint8_t *v212;
  uint8_t v213[8];
  uint8_t *v214;
  uint64_t v215;
  uint64_t (*v216)(uint64_t, uint64_t);
  void (*v217)(uint64_t);
  id v218;
  _QWORD v219[4];
  NSObject *v220;
  MOPerformanceMeasurement *v221;
  uint8_t *v222;
  uint8_t v223[8];
  uint8_t *v224;
  uint64_t v225;
  uint64_t (*v226)(uint64_t, uint64_t);
  void (*v227)(uint64_t);
  id v228;
  _QWORD v229[4];
  NSObject *v230;
  MOPerformanceMeasurement *v231;
  uint8_t *v232;
  uint8_t v233[8];
  uint8_t *v234;
  uint64_t v235;
  uint64_t (*v236)(uint64_t, uint64_t);
  void (*v237)(uint64_t);
  id v238;
  _QWORD v239[4];
  NSObject *v240;
  MOPerformanceMeasurement *v241;
  uint8_t *v242;
  _QWORD *v243;
  _QWORD v244[3];
  char v245;
  uint8_t v246[8];
  uint8_t *v247;
  uint64_t v248;
  uint64_t (*v249)(uint64_t, uint64_t);
  void (*v250)(uint64_t);
  id v251;
  _QWORD v252[4];
  NSObject *v253;
  MOPerformanceMeasurement *v254;
  uint8_t *v255;
  uint8_t v256[8];
  uint8_t *v257;
  uint64_t v258;
  uint64_t (*v259)(uint64_t, uint64_t);
  void (*v260)(uint64_t);
  id v261;
  _QWORD v262[4];
  NSObject *v263;
  MOPerformanceMeasurement *v264;
  uint8_t *v265;
  _QWORD *v266;
  _QWORD v267[3];
  char v268;
  uint8_t v269[8];
  uint8_t *v270;
  uint64_t v271;
  uint64_t (*v272)(uint64_t, uint64_t);
  void (*v273)(uint64_t);
  id v274;
  _QWORD v275[4];
  NSObject *v276;
  MOPerformanceMeasurement *v277;
  uint8_t *v278;
  uint8_t v279[8];
  uint8_t *v280;
  uint64_t v281;
  uint64_t (*v282)(uint64_t, uint64_t);
  void (*v283)(uint64_t);
  id v284;
  _QWORD v285[4];
  NSObject *v286;
  MOPerformanceMeasurement *v287;
  uint8_t *v288;
  uint8_t v289[8];
  uint8_t *v290;
  uint64_t v291;
  uint64_t (*v292)(uint64_t, uint64_t);
  void (*v293)(uint64_t);
  id v294;
  _QWORD v295[4];
  NSObject *v296;
  MOPerformanceMeasurement *v297;
  uint8_t *v298;
  uint8_t v299[8];
  uint8_t *v300;
  uint64_t v301;
  uint64_t (*v302)(uint64_t, uint64_t);
  void (*v303)(uint64_t);
  id v304;
  _QWORD v305[4];
  NSObject *v306;
  MOPerformanceMeasurement *v307;
  uint8_t *v308;
  uint8_t v309[8];
  uint8_t *v310;
  uint64_t v311;
  uint64_t (*v312)(uint64_t, uint64_t);
  void (*v313)(uint64_t);
  id v314;
  _QWORD v315[4];
  NSObject *v316;
  MOPerformanceMeasurement *v317;
  uint8_t *v318;
  uint8_t v319[8];
  uint8_t *v320;
  uint64_t v321;
  uint64_t (*v322)(uint64_t, uint64_t);
  void (*v323)(uint64_t);
  id v324;
  _QWORD v325[4];
  NSObject *v326;
  MOPerformanceMeasurement *v327;
  uint8_t *v328;
  uint8_t v329[8];
  uint8_t *v330;
  uint64_t v331;
  uint64_t (*v332)(uint64_t, uint64_t);
  void (*v333)(uint64_t);
  id v334;
  _QWORD v335[4];
  NSObject *v336;
  MOPerformanceMeasurement *v337;
  uint8_t *v338;
  uint8_t v339[8];
  uint8_t *v340;
  uint64_t v341;
  uint64_t (*v342)(uint64_t, uint64_t);
  void (*v343)(uint64_t);
  id v344;
  _QWORD v345[4];
  NSObject *v346;
  MOPerformanceMeasurement *v347;
  _BYTE *v348;
  __int128 v349;
  __int128 v350;
  __int128 v351;
  __int128 v352;
  __int128 v353;
  __int128 v354;
  __int128 v355;
  __int128 v356;
  _QWORD v357[6];
  uint64_t v358;
  uint64_t *v359;
  uint64_t v360;
  uint64_t (*v361)(uint64_t, uint64_t);
  void (*v362)(uint64_t);
  NSMutableArray *v363;
  uint64_t v364;
  uint64_t *v365;
  uint64_t v366;
  uint64_t (*v367)(uint64_t, uint64_t);
  void (*v368)(uint64_t);
  NSMutableArray *v369;
  id v370;
  _BYTE v371[128];
  _QWORD v372[2];
  uint8_t v373[128];
  _BYTE buf[24];
  uint64_t (*v375)(uint64_t, uint64_t);
  _BYTE v376[20];
  _QWORD v377[2];
  id v378;
  _QWORD v379[2];

  v182 = a3;
  v181 = (uint64_t (*)(uint64_t, uint64_t))a4;
  v180 = a5;
  v174 = a6;
  v170 = a7;
  v169 = objc_opt_new(NSMutableArray);
  group = dispatch_group_create();
  v364 = 0;
  v365 = &v364;
  v366 = 0x3032000000;
  v367 = __Block_byref_object_copy__19;
  v368 = __Block_byref_object_dispose__19;
  v369 = objc_opt_new(NSMutableArray);
  v358 = 0;
  v359 = &v358;
  v360 = 0x3032000000;
  v361 = __Block_byref_object_copy__19;
  v362 = __Block_byref_object_dispose__19;
  v363 = objc_opt_new(NSMutableArray);
  v357[0] = _NSConcreteStackBlock;
  v357[1] = 3221225472;
  v357[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke;
  v357[3] = &unk_1002B20B8;
  v357[4] = &v364;
  v357[5] = &v358;
  -[MOEventBundleManager _filterPreOnboardedVisitEvents:handler:](self, "_filterPreOnboardedVisitEvents:handler:", v180, v357);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v359[5]));
  v175 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v365[5]));
  v12 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("startDate >= %@"), v182));
  v13 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("provider"), 5));
  v178 = (void *)v12;
  v379[0] = v12;
  v379[1] = v13;
  v168 = (void *)v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v379, 2));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filteredArrayUsingPredicate:", v15));

  v17 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
  v378 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v378, 1));
  v184 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sortedArrayUsingDescriptors:", v18));
  v167 = v17;

  v176 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("provider != %lu"), 5));
  v177 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("endDate >= %@"), v182));
  v377[0] = v177;
  v377[1] = v176;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v377, 2));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v19));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filteredArrayUsingPredicate:", v20));

  v179 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "filteredArrayUsingPredicate:", v178));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v23 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = (uint64_t (*)(uint64_t, uint64_t))objc_msgSend(v179, "count");
    v25 = objc_msgSend(v184, "count");
    v26 = objc_msgSend(v21, "count");
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)&buf[4] = v182;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v181;
    *(_WORD *)&buf[22] = 2048;
    v375 = v24;
    *(_WORD *)v376 = 2048;
    *(_QWORD *)&v376[2] = v25;
    *(_WORD *)&v376[10] = 2048;
    *(_QWORD *)&v376[12] = v26;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "annotateEventBundles startDate, %@, endDate, %@, event count, %lu, pattern event count, %lu, eventsForTimeAtHomeManager count, %lu", buf, 0x34u);
  }

  v355 = 0u;
  v356 = 0u;
  v353 = 0u;
  v354 = 0u;
  obj = v21;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v353, v373, 16);
  v28 = 0;
  if (v27)
  {
    v29 = *(_QWORD *)v354;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(_QWORD *)v354 != v29)
          objc_enumerationMutation(obj);
        v31 = *(void **)(*((_QWORD *)&v353 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v31, "category") == (id)1 && objc_msgSend(v31, "placeUserType") == (id)1)
        {
          v32 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v33 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            v34 = NSStringFromSelector(a2);
            v35 = (id)objc_claimAutoreleasedReturnValue(v34);
            v36 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "startDate"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "endDate"));
            *(_DWORD *)buf = 138413058;
            *(_QWORD *)&buf[4] = v35;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v28;
            *(_WORD *)&buf[22] = 2112;
            v375 = v36;
            *(_WORD *)v376 = 2112;
            *(_QWORD *)&v376[2] = v37;
            _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "%@,TAH home visit idx, %lu, startDate, %@, endDate, %@", buf, 0x2Au);

          }
          ++v28;
        }
      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v353, v373, 16);
    }
    while (v27);
  }

  v372[0] = v177;
  v372[1] = v176;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v372, 2));
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v38));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v180, "filteredArrayUsingPredicate:", v39));

  v351 = 0u;
  v352 = 0u;
  v349 = 0u;
  v350 = 0u;
  v41 = v40;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v349, v371, 16);
  if (v42)
  {
    v43 = *(_QWORD *)v350;
    do
    {
      for (j = 0; j != v42; j = (char *)j + 1)
      {
        if (*(_QWORD *)v350 != v43)
          objc_enumerationMutation(v41);
        v45 = *(void **)(*((_QWORD *)&v349 + 1) + 8 * (_QWORD)j);
        if (objc_msgSend(v45, "category") == (id)1 && objc_msgSend(v45, "placeUserType") == (id)1)
        {
          v46 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v47 = objc_claimAutoreleasedReturnValue(v46);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            v48 = NSStringFromSelector(a2);
            v49 = (id)objc_claimAutoreleasedReturnValue(v48);
            v50 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "startDate"));
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "endDate"));
            *(_DWORD *)buf = 138413058;
            *(_QWORD *)&buf[4] = v49;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v28;
            *(_WORD *)&buf[22] = 2112;
            v375 = v50;
            *(_WORD *)v376 = 2112;
            *(_QWORD *)&v376[2] = v51;
            _os_log_debug_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "%@, PAH home visit idx, %lu, startDate, %@, endDate, %@", buf, 0x2Au);

          }
        }
      }
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v349, v371, 16);
    }
    while (v42);
  }

  v52 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
  v370 = v52;
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v370, 1));
  aSelectora = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v179, "sortedArrayUsingDescriptors:", v53));
  v166 = v52;

  fUniverse = self->fUniverse;
  v56 = (objc_class *)objc_opt_class(MOTimeZoneManager, v55);
  v57 = NSStringFromClass(v56);
  v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
  v183 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse getService:](fUniverse, "getService:", v58));

  objc_msgSend(v183, "processTimeZoneEvents:", aSelectora);
  v59 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v60 = objc_claimAutoreleasedReturnValue(v59);
  if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
  {
    v61 = objc_msgSend(aSelectora, "count");
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v183;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v182;
    *(_WORD *)&buf[22] = 2112;
    v375 = v181;
    *(_WORD *)v376 = 2048;
    *(_QWORD *)&v376[2] = v61;
    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "timeZoneManager, %@, startDate, %@, endDate, %@, events, %lu", buf, 0x2Au);
  }

  v62 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v63 = objc_claimAutoreleasedReturnValue(v62);
  if (os_signpost_enabled(v63))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v63, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesPreOnboardedVisit", ", buf, 2u);
  }

  v64 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsDeepAnnotateEventBundlesPreOnboardedVisit"), 0);
  -[MOPerformanceMeasurement startSession](v64, "startSession");
  dispatch_group_enter(group);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v375 = __Block_byref_object_copy__19;
  *(_QWORD *)v376 = __Block_byref_object_dispose__19;
  *(_QWORD *)&v376[8] = 0;
  v65 = -[MOPreOnboardedVisitAnnotationManager initWithUniverse:]([MOPreOnboardedVisitAnnotationManager alloc], "initWithUniverse:", self->fUniverse);
  v66 = objc_opt_new(NSArray);
  v345[0] = _NSConcreteStackBlock;
  v345[1] = 3221225472;
  v345[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_355;
  v345[3] = &unk_1002AE1E8;
  v348 = buf;
  v67 = group;
  v346 = v67;
  v68 = v64;
  v347 = v68;
  -[MOTimeContextAnnotationManager performAnnotationWithEvents:withPatternEvents:handler:](v65, "performAnnotationWithEvents:withPatternEvents:handler:", v175, v66, v345);
  v69 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v70 = objc_claimAutoreleasedReturnValue(v69);
  v165 = v68;
  groupa = &v65->super.super.super;
  if (os_signpost_enabled(v70))
  {
    *(_WORD *)v339 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v70, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesVisit", ", v339, 2u);
  }

  v71 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsDeepAnnotateEventBundlesVisit"), 0);
  -[MOPerformanceMeasurement startSession](v71, "startSession");
  dispatch_group_enter(v67);
  *(_QWORD *)v339 = 0;
  v340 = v339;
  v341 = 0x3032000000;
  v342 = __Block_byref_object_copy__19;
  v343 = __Block_byref_object_dispose__19;
  v344 = 0;
  v72 = -[MOVisitAnnotationManager initWithUniverse:]([MOVisitAnnotationManager alloc], "initWithUniverse:", self->fUniverse);
  v335[0] = _NSConcreteStackBlock;
  v335[1] = 3221225472;
  v335[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_359;
  v335[3] = &unk_1002AE1E8;
  v338 = v339;
  v73 = v67;
  v336 = v73;
  v74 = v71;
  v337 = v74;
  -[MOTimeContextAnnotationManager performAnnotationWithEvents:withPatternEvents:handler:](v72, "performAnnotationWithEvents:withPatternEvents:handler:", aSelectora, v184, v335);
  v75 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v76 = objc_claimAutoreleasedReturnValue(v75);
  v163 = v74;
  v164 = v72;
  if (os_signpost_enabled(v76))
  {
    *(_WORD *)v329 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v76, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesTrips", ", v329, 2u);
  }

  v77 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsDeepAnnotateEventBundlesTrips"), 0);
  -[MOPerformanceMeasurement startSession](v77, "startSession");
  dispatch_group_enter(v73);
  *(_QWORD *)v329 = 0;
  v330 = v329;
  v331 = 0x3032000000;
  v332 = __Block_byref_object_copy__19;
  v333 = __Block_byref_object_dispose__19;
  v334 = 0;
  v78 = -[MOTripAnnotationManager initWithUniverse:]([MOTripAnnotationManager alloc], "initWithUniverse:", self->fUniverse);
  v325[0] = _NSConcreteStackBlock;
  v325[1] = 3221225472;
  v325[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_363;
  v325[3] = &unk_1002AE1E8;
  v328 = v329;
  v79 = v73;
  v326 = v79;
  v80 = v77;
  v327 = v80;
  -[MOTripAnnotationManager performAnnotationWithEvents:withPatternEvents:eventBundles:handler:](v78, "performAnnotationWithEvents:withPatternEvents:eventBundles:handler:", aSelectora, v184, v174, v325);
  v81 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v82 = objc_claimAutoreleasedReturnValue(v81);
  v161 = v80;
  v162 = v78;
  if (os_signpost_enabled(v82))
  {
    *(_WORD *)v319 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v82, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesWorkout", ", v319, 2u);
  }

  v83 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsDeepAnnotateEventBundlesWorkout"), 0);
  -[MOPerformanceMeasurement startSession](v83, "startSession");
  dispatch_group_enter(v79);
  *(_QWORD *)v319 = 0;
  v320 = v319;
  v321 = 0x3032000000;
  v322 = __Block_byref_object_copy__19;
  v323 = __Block_byref_object_dispose__19;
  v324 = 0;
  v84 = -[MOWorkoutAnnotationManager initWithUniverse:]([MOWorkoutAnnotationManager alloc], "initWithUniverse:", self->fUniverse);
  v315[0] = _NSConcreteStackBlock;
  v315[1] = 3221225472;
  v315[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_367;
  v315[3] = &unk_1002AE1E8;
  v318 = v319;
  v85 = v79;
  v316 = v85;
  v86 = v83;
  v317 = v86;
  -[MOTimeContextAnnotationManager performAnnotationWithEvents:withPatternEvents:handler:](v84, "performAnnotationWithEvents:withPatternEvents:handler:", aSelectora, v184, v315);
  v87 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v88 = objc_claimAutoreleasedReturnValue(v87);
  v159 = v86;
  v160 = v84;
  if (os_signpost_enabled(v88))
  {
    *(_WORD *)v309 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v88, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesState of Mind", ", v309, 2u);
  }

  v89 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsDeepAnnotateEventBundlesMood"), 0);
  -[MOPerformanceMeasurement startSession](v89, "startSession");
  dispatch_group_enter(v85);
  *(_QWORD *)v309 = 0;
  v310 = v309;
  v311 = 0x3032000000;
  v312 = __Block_byref_object_copy__19;
  v313 = __Block_byref_object_dispose__19;
  v314 = 0;
  v90 = -[MOStateOfMindAnnotationManager initWithUniverse:]([MOStateOfMindAnnotationManager alloc], "initWithUniverse:", self->fUniverse);
  v305[0] = _NSConcreteStackBlock;
  v305[1] = 3221225472;
  v305[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_371;
  v305[3] = &unk_1002AE1E8;
  v308 = v309;
  v91 = v85;
  v306 = v91;
  v92 = v89;
  v307 = v92;
  -[MOTimeContextAnnotationManager performAnnotationWithEvents:withPatternEvents:handler:](v90, "performAnnotationWithEvents:withPatternEvents:handler:", aSelectora, v184, v305);
  v93 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v94 = objc_claimAutoreleasedReturnValue(v93);
  v157 = v92;
  v158 = v90;
  if (os_signpost_enabled(v94))
  {
    *(_WORD *)v299 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v94, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesSignificantContact", ", v299, 2u);
  }

  v95 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsDeepAnnotateEventBundlesSignificantContact"), 0);
  -[MOPerformanceMeasurement startSession](v95, "startSession");
  dispatch_group_enter(v91);
  *(_QWORD *)v299 = 0;
  v300 = v299;
  v301 = 0x3032000000;
  v302 = __Block_byref_object_copy__19;
  v303 = __Block_byref_object_dispose__19;
  v304 = 0;
  v96 = -[MOConversationAnnotationManager initWithUniverse:]([MOConversationAnnotationManager alloc], "initWithUniverse:", self->fUniverse);
  v295[0] = _NSConcreteStackBlock;
  v295[1] = 3221225472;
  v295[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_375;
  v295[3] = &unk_1002AE1E8;
  v298 = v299;
  v97 = v91;
  v296 = v97;
  v155 = v95;
  v297 = v155;
  -[MOConversationAnnotationManager performAnnotationWithEvents:withPatternEvents:handler:](v96, "performAnnotationWithEvents:withPatternEvents:handler:", aSelectora, v184, v295);
  v156 = v96;
  v98 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v99 = objc_claimAutoreleasedReturnValue(v98);
  if (os_signpost_enabled(v99))
  {
    *(_WORD *)v289 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v99, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesMedia", ", v289, 2u);
  }

  v100 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsDeepAnnotateEventBundlesMedia"), 0);
  -[MOPerformanceMeasurement startSession](v100, "startSession");
  dispatch_group_enter(v97);
  *(_QWORD *)v289 = 0;
  v290 = v289;
  v291 = 0x3032000000;
  v292 = __Block_byref_object_copy__19;
  v293 = __Block_byref_object_dispose__19;
  v294 = 0;
  v101 = -[MOMediaPlayAnnotationManager initWithUniverse:]([MOMediaPlayAnnotationManager alloc], "initWithUniverse:", self->fUniverse);
  v285[0] = _NSConcreteStackBlock;
  v285[1] = 3221225472;
  v285[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_379;
  v285[3] = &unk_1002AE1E8;
  v288 = v289;
  v102 = v97;
  v286 = v102;
  v153 = v100;
  v287 = v153;
  -[MOMediaPlayAnnotationManager performAnnotationWithEvents:withPatternEvents:handler:](v101, "performAnnotationWithEvents:withPatternEvents:handler:", aSelectora, v184, v285);
  v154 = v101;
  v103 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v104 = objc_claimAutoreleasedReturnValue(v103);
  if (os_signpost_enabled(v104))
  {
    *(_WORD *)v279 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v104, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesTrends", ", v279, 2u);
  }

  v105 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsDeepAnnotateEventBundlesTrends"), 0);
  -[MOPerformanceMeasurement startSession](v105, "startSession");
  dispatch_group_enter(v102);
  *(_QWORD *)v279 = 0;
  v280 = v279;
  v281 = 0x3032000000;
  v282 = __Block_byref_object_copy__19;
  v283 = __Block_byref_object_dispose__19;
  v284 = 0;
  v106 = -[MOTrendAnnotationManager initWithUniverse:]([MOTrendAnnotationManager alloc], "initWithUniverse:", self->fUniverse);
  v275[0] = _NSConcreteStackBlock;
  v275[1] = 3221225472;
  v275[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_383;
  v275[3] = &unk_1002AE1E8;
  v278 = v279;
  v107 = v102;
  v276 = v107;
  v151 = v105;
  v277 = v151;
  -[MOTrendAnnotationManager performAnnotationWithEvents:withPatternEvents:handler:](v106, "performAnnotationWithEvents:withPatternEvents:handler:", aSelectora, v184, v275);
  v152 = v106;
  v108 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v109 = objc_claimAutoreleasedReturnValue(v108);
  if (os_signpost_enabled(v109))
  {
    *(_WORD *)v269 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v109, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesTimeHome", ", v269, 2u);
  }

  v110 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsDeepAnnotateEventBundlesTimeHome"), 0);
  -[MOPerformanceMeasurement startSession](v110, "startSession");
  dispatch_group_enter(v107);
  *(_QWORD *)v269 = 0;
  v270 = v269;
  v271 = 0x3032000000;
  v272 = __Block_byref_object_copy__19;
  v273 = __Block_byref_object_dispose__19;
  v274 = 0;
  v267[0] = 0;
  v267[1] = v267;
  v267[2] = 0x2020000000;
  v268 = 0;
  v111 = -[MOTimeAtHomeAnomalyManager initWithUniverse:]([MOTimeAtHomeAnomalyManager alloc], "initWithUniverse:", self->fUniverse);
  v262[0] = _NSConcreteStackBlock;
  v262[1] = 3221225472;
  v262[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_387;
  v262[3] = &unk_1002B20E0;
  v265 = v269;
  v266 = v267;
  v112 = v107;
  v263 = v112;
  v149 = v110;
  v264 = v149;
  -[MOTimeAtHomeAnomalyManager performAnnotationWithEvents:withPatternEvents:withBundleWindowStart:withBundleWindowEnd:handler:](v111, "performAnnotationWithEvents:withPatternEvents:withBundleWindowStart:withBundleWindowEnd:handler:", obj, v184, v182, v181, v262);
  v150 = v111;
  v113 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v114 = objc_claimAutoreleasedReturnValue(v113);
  if (os_signpost_enabled(v114))
  {
    *(_WORD *)v256 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v114, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesPhotoHome", ", v256, 2u);
  }

  v115 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsDeepAnnotateEventBundlesPhotoHome"), 0);
  -[MOPerformanceMeasurement startSession](v115, "startSession");
  dispatch_group_enter(v112);
  *(_QWORD *)v256 = 0;
  v257 = v256;
  v258 = 0x3032000000;
  v259 = __Block_byref_object_copy__19;
  v260 = __Block_byref_object_dispose__19;
  v261 = 0;
  v116 = -[MOPhotosAtHomeManager initWithUniverse:]([MOPhotosAtHomeManager alloc], "initWithUniverse:", self->fUniverse);
  v252[0] = _NSConcreteStackBlock;
  v252[1] = 3221225472;
  v252[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_391;
  v252[3] = &unk_1002AE1E8;
  v255 = v256;
  v117 = v112;
  v253 = v117;
  v147 = v115;
  v254 = v147;
  -[MOPhotosAtHomeManager performAnnotationWithEvents:withPatternEvents:withBundleWindowStart:withBundleWindowEnd:handler:](v116, "performAnnotationWithEvents:withPatternEvents:withBundleWindowStart:withBundleWindowEnd:handler:", v41, v184, v182, v181, v252);
  v118 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v119 = objc_claimAutoreleasedReturnValue(v118);
  if (os_signpost_enabled(v119))
  {
    *(_WORD *)v246 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v119, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesHostingHome", ", v246, 2u);
  }

  v120 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsDeepAnnotateEventBundlesHostingHome"), 0);
  -[MOPerformanceMeasurement startSession](v120, "startSession");
  dispatch_group_enter(v117);
  *(_QWORD *)v246 = 0;
  v247 = v246;
  v248 = 0x3032000000;
  v249 = __Block_byref_object_copy__19;
  v250 = __Block_byref_object_dispose__19;
  v251 = 0;
  v244[0] = 0;
  v244[1] = v244;
  v244[2] = 0x2020000000;
  v245 = 0;
  v121 = -[MOHostingAtHomeManager initWithUniverse:]([MOHostingAtHomeManager alloc], "initWithUniverse:", self->fUniverse);
  v239[0] = _NSConcreteStackBlock;
  v239[1] = 3221225472;
  v239[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_395;
  v239[3] = &unk_1002B20E0;
  v242 = v246;
  v243 = v244;
  v122 = v117;
  v240 = v122;
  v146 = v120;
  v241 = v146;
  -[MOHostingAtHomeManager performAnnotationWithEvents:withPatternEvents:withBundleWindowStart:withBundleWindowEnd:handler:](v121, "performAnnotationWithEvents:withPatternEvents:withBundleWindowStart:withBundleWindowEnd:handler:", obj, v184, v182, v181, v239);
  v123 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v124 = objc_claimAutoreleasedReturnValue(v123);
  if (os_signpost_enabled(v124))
  {
    *(_WORD *)v233 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v124, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesSharedContent", ", v233, 2u);
  }

  v125 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsDeepAnnotateEventBundlesSharedContent"), 0);
  -[MOPerformanceMeasurement startSession](v125, "startSession");
  dispatch_group_enter(v122);
  *(_QWORD *)v233 = 0;
  v234 = v233;
  v235 = 0x3032000000;
  v236 = __Block_byref_object_copy__19;
  v237 = __Block_byref_object_dispose__19;
  v238 = 0;
  v126 = -[MOSharedContentAnnotationManager initWithUniverse:]([MOSharedContentAnnotationManager alloc], "initWithUniverse:", self->fUniverse);
  v229[0] = _NSConcreteStackBlock;
  v229[1] = 3221225472;
  v229[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_399;
  v229[3] = &unk_1002AE1E8;
  v232 = v233;
  v127 = v122;
  v230 = v127;
  v145 = v125;
  v231 = v145;
  -[MOSharedContentAnnotationManager performAnnotationWithEvents:handler:](v126, "performAnnotationWithEvents:handler:", aSelectora, v229);
  v128 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v129 = objc_claimAutoreleasedReturnValue(v128);
  if (os_signpost_enabled(v129))
  {
    *(_WORD *)v223 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v129, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesPhotoMemory", ", v223, 2u);
  }

  v130 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsDeepAnnotateEventBundlesPhotoMemory"), 0);
  -[MOPerformanceMeasurement startSession](v130, "startSession");
  dispatch_group_enter(v127);
  *(_QWORD *)v223 = 0;
  v224 = v223;
  v225 = 0x3032000000;
  v226 = __Block_byref_object_copy__19;
  v227 = __Block_byref_object_dispose__19;
  v228 = 0;
  v131 = -[MOPhotoMemoryAnnotationManager initWithUniverse:]([MOPhotoMemoryAnnotationManager alloc], "initWithUniverse:", self->fUniverse);
  v219[0] = _NSConcreteStackBlock;
  v219[1] = 3221225472;
  v219[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_403;
  v219[3] = &unk_1002AE1E8;
  v222 = v223;
  v132 = v127;
  v220 = v132;
  v143 = v130;
  v221 = v143;
  -[MOPhotoMemoryAnnotationManager performAnnotationWithEvents:handler:](v131, "performAnnotationWithEvents:handler:", aSelectora, v219);
  v144 = v131;
  v133 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v134 = objc_claimAutoreleasedReturnValue(v133);
  if (os_signpost_enabled(v134))
  {
    *(_WORD *)v213 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v134, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesEvergreen", ", v213, 2u);
  }

  v148 = v126;
  v135 = v121;
  v136 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("BundleEventsDeepAnnotateEventBundlesEvergreen"), 0);
  -[MOPerformanceMeasurement startSession](v136, "startSession");
  v137 = v116;
  dispatch_group_enter(v132);
  v138 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v182, v181);
  *(_QWORD *)v213 = 0;
  v214 = v213;
  v215 = 0x3032000000;
  v216 = __Block_byref_object_copy__19;
  v217 = __Block_byref_object_dispose__19;
  v218 = 0;
  v139 = -[MOEvergreenAnnotationManager initWithUniverse:]([MOEvergreenAnnotationManager alloc], "initWithUniverse:", self->fUniverse);
  v209[0] = _NSConcreteStackBlock;
  v209[1] = 3221225472;
  v209[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_407;
  v209[3] = &unk_1002AE1E8;
  v212 = v213;
  v140 = v132;
  v210 = v140;
  v141 = v136;
  v211 = v141;
  -[MOEvergreenAnnotationManager performAnnotationWithEvents:withPatternEvents:dateInterval:handler:](v139, "performAnnotationWithEvents:withPatternEvents:dateInterval:handler:", aSelectora, v184, v138, v209);
  v142 = objc_claimAutoreleasedReturnValue(-[MOEventBundleManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_409;
  block[3] = &unk_1002B2108;
  v193 = buf;
  v194 = v339;
  v195 = v329;
  v196 = v319;
  v197 = v309;
  v198 = v299;
  v199 = v289;
  v200 = v279;
  v201 = v269;
  v202 = v256;
  v203 = v246;
  v204 = v233;
  v205 = v223;
  v206 = v213;
  v207 = v244;
  v208 = v267;
  v191 = v169;
  v192 = v170;
  v186 = v170;
  v171 = v169;
  dispatch_group_notify(v140, v142, block);

  _Block_object_dispose(v213, 8);
  _Block_object_dispose(v223, 8);

  _Block_object_dispose(v233, 8);
  _Block_object_dispose(v244, 8);
  _Block_object_dispose(v246, 8);

  _Block_object_dispose(v256, 8);
  _Block_object_dispose(v267, 8);
  _Block_object_dispose(v269, 8);

  _Block_object_dispose(v279, 8);
  _Block_object_dispose(v289, 8);

  _Block_object_dispose(v299, 8);
  _Block_object_dispose(v309, 8);

  _Block_object_dispose(v319, 8);
  _Block_object_dispose(v329, 8);

  _Block_object_dispose(v339, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v358, 8);
  _Block_object_dispose(&v364, 8);

}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  int v12;
  id v13;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v12 = 134217984;
      v13 = objc_msgSend(v5, "count");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, " Found %lu pre onboarded visit events", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObjectsFromArray:", v5);
  }
  if (objc_msgSend(v6, "count"))
  {
    v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = objc_msgSend(v6, "count");
      v12 = 134217984;
      v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, " Found %lu rest events", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObjectsFromArray:", v6);
  }

}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_355(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id os_log;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;

  v4 = a2;
  v5 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v27 = objc_msgSend(v4, "count");
    v28 = 2112;
    v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "preOnboardedVisit manager event bundles, %lu, error, %@", buf, 0x16u);
  }
  v19 = v5;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
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
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v12);
        v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v13;
          _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "preOnboardedVisit manager event bundle, %@", buf, 0xCu);
        }

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesPreOnboardedVisit", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "endSession");
}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_359(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id os_log;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;

  v4 = a2;
  v5 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v27 = objc_msgSend(v4, "count");
    v28 = 2112;
    v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "visit manager event bundles, %lu, error, %@", buf, 0x16u);
  }
  v19 = v5;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v13;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "visit manager event bundle, %@", buf, 0xCu);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesVisit", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "endSession");
}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_363(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id os_log;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;

  v4 = a2;
  v5 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v27 = objc_msgSend(v4, "count");
    v28 = 2112;
    v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "trip manager event bundles, %lu, error, %@", buf, 0x16u);
  }
  v19 = v5;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v13;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "trip manager event bundle, %@", buf, 0xCu);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesTrips", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "endSession");
}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_367(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id os_log;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;

  v4 = a2;
  v5 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v27 = objc_msgSend(v4, "count");
    v28 = 2112;
    v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "workout manager event bundles, %lu, error, %@", buf, 0x16u);
  }
  v19 = v5;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v13;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "workout manager event bundle, %@", buf, 0xCu);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesWorkout", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "endSession");
}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_371(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id os_log;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;

  v4 = a2;
  v5 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v27 = objc_msgSend(v4, "count");
    v28 = 2112;
    v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "state of mind manager event bundles, %lu, error, %@", buf, 0x16u);
  }
  v19 = v5;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v13;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "state of mind manager event bundle, %@", buf, 0xCu);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesMood", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "endSession");
}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_375(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id os_log;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;

  v4 = a2;
  v5 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v27 = objc_msgSend(v4, "count");
    v28 = 2112;
    v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "conversation bundle count, %lu, error, %@", buf, 0x16u);
  }
  v19 = v5;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v13;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "conversation event bundle, %@", buf, 0xCu);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesSignificantContact", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "endSession");
}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_379(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id os_log;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;

  v4 = a2;
  v5 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v27 = objc_msgSend(v4, "count");
    v28 = 2112;
    v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "media bundle count, %lu, error, %@", buf, 0x16u);
  }
  v19 = v5;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v13;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "media event bundle, %@", buf, 0xCu);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesMedia", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "endSession");
}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_383(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;

  v6 = a2;
  v7 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v12 = 134218242;
    v13 = objc_msgSend(v6, "count");
    v14 = 2112;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "trend bundle count, %lu, error, %@", (uint8_t *)&v12, 0x16u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_signpost_enabled(v11))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesTrends", ", (uint8_t *)&v12, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "endSession");
}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_387(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id os_log;
  NSObject *v7;
  NSDate *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  id v25;
  NSObject *v26;
  void *v27;
  NSMutableArray *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;

  v4 = a2;
  v5 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v36 = objc_msgSend(v4, "count");
    v37 = 2112;
    v38 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "::: time at home manager event bundles, %lu, error, %@", buf, 0x16u);
  }

  v29 = objc_opt_new(NSMutableArray);
  v8 = -[NSDate initWithTimeIntervalSinceReferenceDate:](objc_opt_new(NSDate), "initWithTimeIntervalSinceReferenceDate:", 0.0);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  v27 = v5;
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v15 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v14;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "time at home event bundle, %@", buf, 0xCu);
        }

        if (objc_msgSend(v14, "bundleSubType", v27) == (id)504)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startDate"));
          v18 = objc_msgSend(v17, "isOnOrAfter:", v8);

          if (v18)
          {
            v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startDate"));

            v8 = (NSDate *)v19;
          }
        }
        else
        {
          -[NSMutableArray addObject:](v29, "addObject:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v11);
  }

  v20 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v29));
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v20;

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[NSDate timeIntervalSinceDate:](v8, "timeIntervalSinceDate:", v23);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = fabs(v24) <= 172800.0;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v25 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesTimeHome", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "endSession");
}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_391(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id os_log;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint8_t v38[128];
  uint8_t buf[4];
  id v40;
  __int16 v41;
  id v42;

  v4 = a2;
  v5 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v40 = objc_msgSend(v4, "count");
    v41 = 2112;
    v42 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "::: photos at home manager event bundles, %lu, error, %@", buf, 0x16u);
  }
  v27 = v5;

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v13;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "::: Event Bundle, %@", buf, 0xCu);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v10);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(_QWORD *)v30 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j);
        v22 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v21;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "time at home event bundle, %@", buf, 0xCu);
        }

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v18);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v24 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesPhotoHome", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "endSession");
}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_395(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id os_log;
  NSObject *v7;
  NSMutableArray *v8;
  NSDate *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  id v26;
  NSObject *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;

  v4 = a2;
  v5 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v36 = objc_msgSend(v4, "count");
    v37 = 2112;
    v38 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "::: hosting at home manager event bundles, %lu, error, %@", buf, 0x16u);
  }

  v8 = objc_opt_new(NSMutableArray);
  v9 = -[NSDate initWithTimeIntervalSinceReferenceDate:](objc_opt_new(NSDate), "initWithTimeIntervalSinceReferenceDate:", 0.0);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  v28 = v5;
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v31;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v14);
        v16 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v15;
          _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "::: Event Bundle, %@", buf, 0xCu);
        }

        if (objc_msgSend(v15, "bundleSubType", v28) == (id)504)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));
          v19 = objc_msgSend(v18, "isOnOrAfter:", v9);

          if (v19)
          {
            v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));

            v9 = (NSDate *)v20;
          }
        }
        else
        {
          -[NSMutableArray addObject:](v8, "addObject:", v15);
        }
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v12);
  }

  v21 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v8));
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v23 = *(void **)(v22 + 40);
  *(_QWORD *)(v22 + 40) = v21;

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[NSDate timeIntervalSinceDate:](v9, "timeIntervalSinceDate:", v24);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = fabs(v25) <= 172800.0;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v26 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesHostingHome", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "endSession");
}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_399(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id os_log;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;

  v4 = a2;
  v5 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v27 = objc_msgSend(v4, "count");
    v28 = 2112;
    v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "shared content annotation manager event bundles, %lu, error, %@", buf, 0x16u);
  }
  v19 = v5;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v13;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "shared content bundle, %@", buf, 0xCu);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesSharedContent", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "endSession");
}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_403(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id os_log;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;

  v4 = a2;
  v5 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v27 = objc_msgSend(v4, "count");
    v28 = 2112;
    v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "photo memory annotation manager event bundles, %lu, error, %@", buf, 0x16u);
  }
  v19 = v5;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
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
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v12);
        v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v13;
          _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "photo memory bundle, %@", buf, 0xCu);
        }

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesPhotoMemory", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "endSession");
}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_407(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;

  v6 = a2;
  v7 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v12 = 134218242;
    v13 = objc_msgSend(v6, "count");
    v14 = 2112;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "evergreen annotation manager event bundles, %lu, error, %@", (uint8_t *)&v12, 0x16u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_signpost_enabled(v11))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesEvergreen", ", (uint8_t *)&v12, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "endSession");
}

uint64_t __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_409(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id os_log;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  _BYTE v59[128];

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40));
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40));
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40), "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40));
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40), "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40));
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40));
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 40), "count"))
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 24)
      || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 24))
    {
      +[MOEvergreenAnnotationManager replacePromptIndicesOfEvergreen:isTah:](MOEvergreenAnnotationManager, "replacePromptIndicesOfEvergreen:isTah:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 40), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 24) == 0);
    }
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 40));
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v27, v59, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v28;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v28 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v6);
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v9 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v7;
          _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "annotateEventBundles, event bundle, %@", buf, 0xCu);
        }

        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v27, v59, 16);
    }
    while (v4);
  }

  v10 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v26 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
    v25 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count");
    v24 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count");
    v23 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count");
    v22 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "count");
    v21 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "count");
    v12 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "count");
    v13 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "count");
    v14 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), "count");
    v15 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40), "count");
    v16 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40), "count");
    v17 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "count");
    v18 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 40), "count");
    v19 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134221312;
    v32 = v26;
    v33 = 2048;
    v34 = v25;
    v35 = 2048;
    v36 = v24;
    v37 = 2048;
    v38 = v23;
    v39 = 2048;
    v40 = v22;
    v41 = 2048;
    v42 = v21;
    v43 = 2048;
    v44 = v12;
    v45 = 2048;
    v46 = v13;
    v47 = 2048;
    v48 = v14;
    v49 = 2048;
    v50 = v15;
    v51 = 2048;
    v52 = v16;
    v53 = 2048;
    v54 = v17;
    v55 = 2048;
    v56 = v18;
    v57 = 2048;
    v58 = v19;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "annotateEventBundles summary: preOnboardedVisit, %lu, visit, %lu, trip, %lu, workout, %lu, conversation, %lu, media, %lu, trend, %lu, home, %lu, pah, %lu, hah, %lu, shared content, %lu, photo memory, %lu, evergreen, %lu, total, %lu", buf, 0x8Eu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)updateMetaDataForRankInEventBundles:(id)a3
{
  id v3;
  id v4;
  __int128 v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  id os_log;
  NSMutableDictionary *v19;
  double v20;
  double v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  double v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];

  v3 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v31;
    *(_QWORD *)&v5 = 138412290;
    v29 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metaDataForRank", v29));
        if (v10
          && (v11 = (void *)v10,
              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metaDataForRank")),
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("LabelConfidence"))),
              v13,
              v12,
              v11,
              v13))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metaDataForRank"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("LabelConfidence")));
          objc_msgSend(v15, "doubleValue");
          v17 = v16;

          os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v19 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(&v19->super.super, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218242;
            v35 = v17;
            v36 = 2112;
            v37 = v9;
            _os_log_impl((void *)&_mh_execute_header, &v19->super.super, OS_LOG_TYPE_INFO, "label confidence, label confidence, %f, event bundle, %@", buf, 0x16u);
          }
        }
        else
        {
          v19 = objc_opt_new(NSMutableDictionary);
          +[MOContextAnnotationUtilities labelConfidenceForEventBundle:](MOContextAnnotationUtilities, "labelConfidenceForEventBundle:", v9);
          v21 = v20;
          v22 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v23 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218242;
            v35 = v21;
            v36 = 2112;
            v37 = v9;
            _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "label confidence, label confidence (update), %f, event bundle, %@", buf, 0x16u);
          }

          if (v21 > 0.0)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v21));
            -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v24, CFSTR("LabelConfidence"));

            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metaDataForRank"));
            if (v25)
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metaDataForRank"));
              -[NSMutableDictionary addEntriesFromDictionary:](v19, "addEntriesFromDictionary:", v26);

            }
            objc_msgSend(v9, "setMetaDataForRank:", v19);
          }
        }

        v27 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v29;
          v35 = *(double *)&v9;
          _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "annotateEventBundles, event bundle, %@", buf, 0xCu);
        }

      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v6);
  }

}

- (id)_concatenatedEventIdentifierForBundle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id os_log;
  NSObject *v28;
  NSString *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  void *v44;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "events"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = objc_opt_new(NSMutableArray);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v4, "interfaceType")));
    -[NSMutableArray addObject:](v7, "addObject:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v4, "summarizationGranularity")));
    -[NSMutableArray addObject:](v7, "addObject:", v9);

    if (objc_msgSend(v4, "interfaceType") == (id)7)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "action"));
      v11 = objc_msgSend(v10, "actionSubtype");

      if (v11 == (id)8)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
        objc_msgSend(v12, "timeIntervalSinceReferenceDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f"), v13));
        -[NSMutableArray addObject:](v7, "addObject:", v14);

      }
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "events"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("eventIdentifier"), 1));
    v44 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v44, 1));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sortedArrayUsingDescriptors:", v17));

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v34;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v34 != v22)
            objc_enumerationMutation(v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v23), "eventIdentifier"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "UUIDString"));
          -[NSMutableArray addObject:](v7, "addObject:", v25);

          v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
      }
      while (v21);
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v7, "componentsJoinedByString:", CFSTR(":")));
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v28 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v30 = NSStringFromSelector(a2);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
      *(_DWORD *)buf = 138412802;
      v38 = v31;
      v39 = 2112;
      v40 = v32;
      v41 = 2112;
      v42 = v26;
      _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%@, bundleID, %@, concatenated eventID, %@", buf, 0x20u);

    }
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)_updateIdentifiersForEventBundles:(id)a3 eventIDsToBundleIDMapping:(id)a4
{
  id v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  dispatch_once_t *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id os_log;
  NSObject *v16;
  NSMutableArray *v17;
  dispatch_once_t *v18;
  NSString *v19;
  id v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  MOEventBundle *v24;
  id v26;
  void *v27;
  id v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];

  v5 = a3;
  v26 = a4;
  v6 = objc_opt_new(NSMutableArray);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    v10 = &MOLogFacilityEventBundleManager;
    do
    {
      v11 = 0;
      v30 = v8;
      do
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v11);
        if (objc_msgSend(v12, "interfaceType", v26) == (id)11)
        {
          v13 = 0;
        }
        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager _concatenatedEventIdentifierForBundle:](self, "_concatenatedEventIdentifierForBundle:", v12));
          if (v14)
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKey:", v14));
          else
            v13 = 0;

        }
        os_log = _mo_log_facility_get_os_log(v10);
        v16 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = v6;
          v18 = v10;
          v19 = NSStringFromSelector(a2);
          v20 = (id)objc_claimAutoreleasedReturnValue(v19);
          if (v13)
            v21 = CFSTR("YES");
          else
            v21 = CFSTR("NO");
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleIdentifier"));
          v23 = v13;
          if (!v13)
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleIdentifier"));
            v23 = v27;
          }
          *(_DWORD *)buf = 138413058;
          v37 = v20;
          v38 = 2112;
          v39 = v21;
          v40 = 2112;
          v41 = v22;
          v42 = 2112;
          v43 = v23;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%@, update bundleID, %@, bundleID, %@, updated bundleID, %@", buf, 0x2Au);
          if (!v13)

          v10 = v18;
          v6 = v17;
          v8 = v30;
        }

        if (v13)
        {
          v24 = -[MOEventBundle initWithBundleIdentifier:usingBundle:]([MOEventBundle alloc], "initWithBundleIdentifier:usingBundle:", v13, v12);
          -[NSMutableArray addObject:](v6, "addObject:", v24);

        }
        else
        {
          -[NSMutableArray addObject:](v6, "addObject:", v12);
        }

        v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    }
    while (v8);
  }

  return v6;
}

- (id)_updateIdentifiersForEvergreenBundles:(id)a3
{
  id v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  dispatch_once_t *v8;
  void *v9;
  void *v10;
  void *v11;
  id os_log;
  NSObject *v13;
  uint64_t v14;
  NSMutableArray *v15;
  dispatch_once_t *v16;
  NSString *v17;
  id v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  MOEventBundle *v22;
  void *v24;
  id v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    v8 = &MOLogFacilityEventBundleManager;
    do
    {
      v9 = 0;
      v26 = v6;
      do
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v9);
        if (objc_msgSend(v10, "interfaceType") == (id)11)
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "suggestionID"));
        else
          v11 = 0;
        os_log = _mo_log_facility_get_os_log(v8);
        v13 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = v7;
          v15 = v4;
          v16 = v8;
          v17 = NSStringFromSelector(a2);
          v18 = (id)objc_claimAutoreleasedReturnValue(v17);
          if (v11)
            v19 = CFSTR("YES");
          else
            v19 = CFSTR("NO");
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
          v21 = v11;
          if (!v11)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
            v21 = v24;
          }
          *(_DWORD *)buf = 138413058;
          v33 = v18;
          v34 = 2112;
          v35 = v19;
          v36 = 2112;
          v37 = v20;
          v38 = 2112;
          v39 = v21;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@, update bundleID for Evergreen bundle, %@, bundleID, %@, updated bundleID, %@", buf, 0x2Au);
          if (!v11)

          v8 = v16;
          v4 = v15;
          v7 = v14;
          v6 = v26;
        }

        if (v11)
        {
          v22 = -[MOEventBundle initWithBundleIdentifier:usingBundle:]([MOEventBundle alloc], "initWithBundleIdentifier:usingBundle:", v11, v10);
          -[NSMutableArray addObject:](v4, "addObject:", v22);

        }
        else
        {
          -[NSMutableArray addObject:](v4, "addObject:", v10);
        }

        v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v6);
  }

  return v4;
}

- (void)_collectTimeCorrelatedEventsWithStartDate:(id)a3 endDate:(id)a4 events:(id)a5 submitMetricsFlg:(BOOL)a6 handler:(id)a7
{
  _BOOL4 v8;
  id v13;
  __CFString *v14;
  id v15;
  void (**v16)(id, _QWORD, NSMutableDictionary *);
  id os_log;
  NSObject *v18;
  NSString *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  NSMutableDictionary *v23;
  id v24;
  NSObject *v25;
  MOEventBundler *v26;
  id v27;
  NSObject *v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  _BOOL4 enableSemanticPruning;
  id v34;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  NSObject *v41;
  MOPromptMetrics *v42;
  id v43;
  NSObject *v44;
  id v45;
  NSObject *v46;
  id v47;
  NSObject *v48;
  id v49;
  NSObject *v50;
  MOEventBundler *v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  const __CFString *v55;

  v8 = a6;
  v13 = a3;
  v14 = (__CFString *)a4;
  v15 = a5;
  v16 = (void (**)(id, _QWORD, NSMutableDictionary *))a7;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v18 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = NSStringFromSelector(a2);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = (void *)v20;
    v22 = CFSTR("NO");
    if (v8)
      v22 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v53 = v20;
    v54 = 2112;
    v55 = v22;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%@, submitMetricsFlg, %@", buf, 0x16u);

  }
  v23 = objc_opt_new(NSMutableDictionary);
  if (v8)
  {
    v24 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v53 = (uint64_t)v13;
      v54 = 2112;
      v55 = v14;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "initiate bundler with startDate: %@, endDate:  %@", buf, 0x16u);
    }

    v26 = -[MOEventBundler initWithStartDate:endDate:]([MOEventBundler alloc], "initWithStartDate:endDate:", v13, v14);
    v27 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "bundle events", buf, 2u);
    }

    v51 = v26;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundler calculateEventBundlesFromEvents:](v26, "calculateEventBundlesFromEvents:", v15));
    v30 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = objc_msgSend(v29, "count");
      *(_DWORD *)buf = 134217984;
      v53 = (uint64_t)v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "there are %lu event bundles.", buf, 0xCu);
    }

    enableSemanticPruning = self->_enableSemanticPruning;
    v34 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    v36 = os_log_type_enabled(v35, OS_LOG_TYPE_INFO);
    if (enableSemanticPruning)
    {
      if (v36)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "prune events based on semantic filter", buf, 2u);
      }

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundler pruneEventBundles:](v51, "pruneEventBundles:", v29));
      v38 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v35 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v39 = objc_msgSend(v37, "count");
        *(_DWORD *)buf = 134217984;
        v53 = (uint64_t)v39;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "there are %lu pruned event bundles.", buf, 0xCu);
      }
    }
    else
    {
      if (v36)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "did not prune events based on semantic filter since it's disabled", buf, 2u);
      }
      v37 = 0;
    }

    v40 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v53 = (uint64_t)v13;
      v54 = 2112;
      v55 = v14;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "initiate metrics with startDate: %@, endDate:  %@", buf, 0x16u);
    }

    v42 = -[MOPromptMetrics initWithStartDate:endDate:EventManager:]([MOPromptMetrics alloc], "initWithStartDate:endDate:EventManager:", v13, v14, self->_eventManager);
    v43 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v44 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "calculate metrics for raw events", buf, 2u);
    }

    -[MOPromptMetrics calculateAndSetMetricsForRawEvents:](v42, "calculateAndSetMetricsForRawEvents:", v15);
    v45 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "calculate metrics on pre-bundles", buf, 2u);
    }

    -[MOPromptMetrics calculateAndSetMetricsForCorrelatedEvents:](v42, "calculateAndSetMetricsForCorrelatedEvents:", v29);
    if (self->_enableSemanticPruning)
    {
      v47 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "calculate metrics on semantically pruned bundles", buf, 2u);
      }

      -[MOPromptMetrics calculateAndSetMetricsForSemanticallyBundledEvents:](v42, "calculateAndSetMetricsForSemanticallyBundledEvents:", v37);
    }
    v49 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "submit metrics", buf, 2u);
    }

    -[MOEventBundleManager submitMetricForEventBundleWithPromptMetrics:](self, "submitMetricForEventBundleWithPromptMetrics:", v42);
    if (v16)
      v16[2](v16, 0, v23);

  }
  else if (v16)
  {
    v16[2](v16, 0, v23);
  }

}

- (void)updateSuggestionIDAndFirstCreationDateForNewEventBundles:(id)a3 previousEventBundles:(id)a4
{
  id v6;
  void *v7;
  id v8;
  __int128 v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id os_log;
  NSObject *v22;
  void *v23;
  void *v24;
  __int128 v25;
  MOEventBundleManager *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager partitionedEventBundles:](self, "partitionedEventBundles:", a4));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v29;
    *(_QWORD *)&v9 = 138413058;
    v25 = v9;
    v26 = self;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager matchedEventBundleForEventBundle:otherEventBundles:](self, "matchedEventBundleForEventBundle:otherEventBundles:", v13, v7, v25));
        v15 = v14;
        if (v14)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "suggestionID"));
          if (!v16)
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bundleIdentifier"));
          objc_msgSend(v13, "setSuggestionID:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstCreationDate"));
          if (v17)
            v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstCreationDate"));
          else
            v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "creationDate"));
          v20 = (void *)v18;
          objc_msgSend(v13, "setFirstCreationDate:", v18);

          os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v22 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "suggestionID"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstCreationDate"));
            *(_DWORD *)buf = v25;
            v33 = v23;
            v34 = 2112;
            v35 = v24;
            v36 = 2112;
            v37 = v15;
            v38 = 2112;
            v39 = v13;
            _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Suggestion ID matched, suggestion ID, %@, first creation date, %@, prev, %@, new, %@", buf, 0x2Au);

            self = v26;
          }

        }
        else
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleIdentifier"));
          objc_msgSend(v13, "setSuggestionID:", v19);

          self = v26;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "creationDate"));
          objc_msgSend(v13, "setFirstCreationDate:", v16);
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v10);
  }

}

- (void)associateEventBundles:(id)a3 effectiveInterval:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id os_log;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
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
  id v34;
  MOObjectZipper *v35;
  MOTripAnnotationManager *v36;
  id v37;
  id v38;
  void *i;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  MOTripAnnotationManager *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  MOObjectZipper *v65;
  MOTripAnnotationManager *v66;
  unsigned __int8 v67;
  NSObject *v68;
  id v69;
  id v70;
  id v71;
  MOObjectZipper *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  id obj;
  MOEventBundleManager *v87;
  uint64_t v88;
  _QWORD v89[4];
  MOTripAnnotationManager *v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD v95[4];
  id v96;
  NSObject *v97;
  uint8_t buf[4];
  id v99;
  __int16 v100;
  id v101;
  __int16 v102;
  id v103;
  _BYTE v104[128];
  void *v105;
  _QWORD v106[2];
  void *v107;

  v85 = a4;
  v6 = objc_msgSend(a3, "mutableCopy");
  v87 = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager eventBundleRanking](self, "eventBundleRanking"));
  objc_msgSend(v7, "generateBundleRanking:withMinRecommendedBundleCountRequirement:", v6, 0);

  v83 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v6));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v10 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v99 = objc_msgSend(v8, "count");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Raw input bundle count for trip bundle update: %lu", buf, 0xCu);
  }

  v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("rankingDictionary.isEligibleForTripSummarization == %@"), &__kCFBooleanTrue));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:"));

  v12 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = objc_msgSend(v11, "count");
    *(_DWORD *)buf = 134217984;
    v99 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Filtered input bundle count for trip by isEligibleForTripSummarization: %lu.", buf, 0xCu);
  }

  v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %lu"), CFSTR("interfaceType"), 13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filteredArrayUsingPredicate:"));
  v84 = v11;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("endDate"), 1));
  v107 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v107, 1));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sortedArrayUsingDescriptors:", v17));

  v19 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K.%K <= %lu"), CFSTR("place"), CFSTR("placeType"), 100));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "filteredArrayUsingPredicate:", v19));
  v80 = (void *)v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate notPredicateWithSubpredicate:](NSCompoundPredicate, "notPredicateWithSubpredicate:", v19));
  v79 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "filteredArrayUsingPredicate:", v21));

  v22 = v84;
  v23 = v20;

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %lu AND %K != %lu"), CFSTR("bundleSuperType"), 1, CFSTR("bundleSubType"), 105));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %lu AND NOT (%K IN %@)"), CFSTR("bundleSuperType"), 2, CFSTR("bundleSubType"), &off_1002DC6F8));
  v106[0] = v24;
  v106[1] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v106, 2));
  v27 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v26));

  v78 = (void *)v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "filteredArrayUsingPredicate:", v27));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("endDate"), 1));
  v105 = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v105, 1));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "sortedArrayUsingDescriptors:", v30));

  if (objc_msgSend(v31, "count") && objc_msgSend(v23, "count"))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "startDate"));
    if (v32
      || (v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "firstObject")),
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "startDate")),
          v33,
          v32))
    {
      v95[0] = _NSConcreteStackBlock;
      v95[1] = 3221225472;
      v95[2] = __64__MOEventBundleManager_associateEventBundles_effectiveInterval___block_invoke;
      v95[3] = &unk_1002AD580;
      v96 = (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K < %@"), CFSTR("startDate"), v32));
      v73 = v32;
      v97 = v73;
      v34 = v96;
      objc_msgSend(v23, "enumerateObjectsUsingBlock:", v95);

    }
    else
    {
      v73 = 0;
    }
    v76 = v24;
    v74 = v31;
    v35 = -[MOObjectZipper initWithObjects:others:comparator:]([MOObjectZipper alloc], "initWithObjects:others:comparator:", v31, v23, &__block_literal_global_448);
    while (-[MOObjectZipper nextObjectPairWithHandler:](v35, "nextObjectPairWithHandler:", &__block_literal_global_450))
      ;
    v72 = v35;
    v75 = v25;
    v36 = -[MOTripAnnotationManager initWithUniverse:]([MOTripAnnotationManager alloc], "initWithUniverse:", v87->fUniverse);
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v77 = v23;
    obj = v23;
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
    if (v37)
    {
      v38 = v37;
      v88 = *(_QWORD *)v92;
      do
      {
        for (i = 0; i != v38; i = (char *)i + 1)
        {
          if (*(_QWORD *)v92 != v88)
            objc_enumerationMutation(obj);
          v40 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * (_QWORD)i);
          v41 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          v42 = objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "startDate"));
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "endDate"));
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "events"));
            v46 = objc_msgSend(v45, "count");
            *(_DWORD *)buf = 138412802;
            v99 = v43;
            v100 = 2112;
            v101 = v44;
            v102 = 2048;
            v103 = v46;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Update trip bundle between %@ and %@, events, %lu", buf, 0x20u);

          }
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "subBundleIDs"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v47));

          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "allObjects"));
          objc_msgSend(v40, "setSubBundleIDs:", v49);

          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "events"));
          v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v50));

          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "allObjects"));
          objc_msgSend(v40, "setEvents:", v52);

          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "action"));
          if (v53)
          {
            v54 = v36;
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "events"));
            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "firstObject"));
            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "eventIdentifier"));
            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "action"));
            objc_msgSend(v58, "setSourceEventIdentifier:", v57);

            v59 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            v60 = objc_claimAutoreleasedReturnValue(v59);
            if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
            {
              v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "action"));
              v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "sourceEventIdentifier"));
              *(_DWORD *)buf = 138412290;
              v99 = v62;
              _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "associateEventBundles: setting container bundle action as %@ from updating event bundles", buf, 0xCu);

            }
            v36 = v54;
          }
          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "events"));
          -[MOTripAnnotationManager materializeTripBundle:contextEvents:updateWithFilteredEvents:](v36, "materializeTripBundle:contextEvents:updateWithFilteredEvents:", v40, v63, 1);

        }
        v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
      }
      while (v38);
    }

    v64 = (void *)v79;
    v65 = -[MOObjectZipper initWithObjects:others:comparator:]([MOObjectZipper alloc], "initWithObjects:others:comparator:", obj, v79, &__block_literal_global_453);

    do
    {
      v89[0] = _NSConcreteStackBlock;
      v89[1] = 3221225472;
      v89[2] = __64__MOEventBundleManager_associateEventBundles_effectiveInterval___block_invoke_2_454;
      v89[3] = &unk_1002B21B0;
      v66 = v36;
      v90 = v66;
      v67 = -[MOObjectZipper nextObjectPairWithHandler:](v65, "nextObjectPairWithHandler:", v89);

    }
    while ((v67 & 1) != 0);

    v22 = v84;
    v24 = v76;
    v23 = v77;
    v31 = v74;
    v25 = v75;
    v68 = v73;
  }
  else
  {
    v69 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v68 = objc_claimAutoreleasedReturnValue(v69);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      v70 = objc_msgSend(v23, "count");
      v71 = objc_msgSend(v31, "count");
      *(_DWORD *)buf = 134218240;
      v99 = v70;
      v100 = 2048;
      v101 = v71;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_INFO, "Trip bundle association: Either container or element bundle array is empty. trip bundle count: %lu, element bundle count: %lu", buf, 0x16u);
    }
    v64 = (void *)v79;
  }

}

void __64__MOEventBundleManager_associateEventBundles_effectiveInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id os_log;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "events"));
  v5 = objc_msgSend(v4, "count");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "events"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filteredArrayUsingPredicate:", *(_QWORD *)(a1 + 32)));
  objc_msgSend(v3, "setEvents:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "events"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "eventIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
    objc_msgSend(v12, "setSourceEventIdentifier:", v11);

    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v14 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sourceEventIdentifier"));
      *(_DWORD *)buf = 138412290;
      v31 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "associateEventBundles: setting container bundle action as %@ from first event after applying effectiveWindowPredicate", buf, 0xCu);

    }
  }
  v17 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = *(void **)(a1 + 40);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "events"));
    v20 = objc_msgSend(v29, "count");
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "events"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstObject"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "startDate"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "events"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "lastObject"));
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "startDate"));
    v27 = v5;
    v28 = (void *)v26;
    *(_DWORD *)buf = 138413314;
    v31 = v19;
    v32 = 2048;
    v33 = v27;
    v34 = 2048;
    v35 = v20;
    v36 = 2112;
    v37 = v23;
    v38 = 2112;
    v39 = v26;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "associateEventBundles: event pruning, date, %@, before, %lu, after, %lu, first event, %@, last event, %@", buf, 0x34u);

  }
}

int64_t __64__MOEventBundleManager_associateEventBundles_effectiveInterval___block_invoke_446(id a1, MOEventBundle *a2, MOEventBundle *a3)
{
  MOEventBundle *v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](a2, "endDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](v4, "endDate"));

  LODWORD(v4) = objc_msgSend(v5, "isBeforeDate:", v6);
  if ((_DWORD)v4)
    return -1;
  else
    return 1;
}

void __64__MOEventBundleManager_associateEventBundles_effectiveInterval___block_invoke_2(id a1, MOEventBundle *a2, MOEventBundle *a3)
{
  MOEventBundle *v4;
  MOEventBundle *v5;
  id os_log;
  NSObject *v7;
  id v8;
  NSObject *v9;
  MOEventBundle *v10;
  MOEventBundle *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  MOEventBundle *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  MOEventBundle *v44;
  MOEventBundle *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  NSObject *v54;
  uint8_t buf[4];
  MOEventBundle *v56;
  __int16 v57;
  MOEventBundle *v58;
  __int16 v59;
  double v60;
  __int16 v61;
  void *v62;

  v4 = a2;
  v5 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v56 = v4;
    v57 = 2112;
    v58 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "associateEventBundles: bundle, %@, container bundles, %@", buf, 0x16u);
  }

  v8 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (MOEventBundle *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v4, "startDate"));
    v11 = (MOEventBundle *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](v4, "endDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v5, "startDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](v5, "endDate"));
    *(_DWORD *)buf = 138413058;
    v56 = v10;
    v57 = 2112;
    v58 = v11;
    v59 = 2112;
    v60 = *(double *)&v12;
    v61 = 2112;
    v62 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "associateEventBundles: bundle, start, %@, end, %@, container bundles, start, %@, end, %@", buf, 0x2Au);

  }
  +[MOSummarizationUtilities overlappingTimeIntervalBetween:andOtherBundle:](MOSummarizationUtilities, "overlappingTimeIntervalBetween:andOtherBundle:", v4, v5);
  if (v14 > 0.0)
  {
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle dateInterval](v4, "dateInterval"));
    objc_msgSend(v16, "duration");
    if (v17 <= 0.0)
    {
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend(v16, "duration");
    v19 = v15 / v18;
    if (v19 <= 0.2)
    {
      v27 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v21 = objc_claimAutoreleasedReturnValue(v27);
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
LABEL_28:

        goto LABEL_29;
      }
      v28 = objc_claimAutoreleasedReturnValue(-[MOEventBundle suggestionID](v5, "suggestionID"));
      v29 = (MOEventBundle *)objc_claimAutoreleasedReturnValue(-[MOEventBundle suggestionID](v4, "suggestionID"));
      *(_DWORD *)buf = 138412802;
      v56 = (MOEventBundle *)v28;
      v57 = 2112;
      v58 = v29;
      v59 = 2048;
      v60 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "associateEventBundles, partially overlappend bundle, container bundle, %@, child bundle, %@, ratio, %f", buf, 0x20u);

LABEL_27:
      goto LABEL_28;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle suggestionID](v4, "suggestionID"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "UUIDString"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle subBundleIDs](v5, "subBundleIDs"));
    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle subBundleIDs](v5, "subBundleIDs"));
      v24 = objc_msgSend(v23, "containsObject:", v21);

      if ((v24 & 1) != 0)
        goto LABEL_15;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle subBundleIDs](v5, "subBundleIDs"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "arrayByAddingObject:", v21));
      -[MOEventBundle setSubBundleIDs:](v5, "setSubBundleIDs:", v26);

    }
    else
    {
      v54 = v21;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v54, 1));
      -[MOEventBundle setSubBundleIDs:](v5, "setSubBundleIDs:", v25);
    }

LABEL_15:
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v4, "place"));
    objc_msgSend(v30, "setLocationMode:", 2);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v5, "events"));
    if (v31)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v5, "events"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v4, "events"));
      v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "arrayByAddingObjectsFromArray:", v33));

      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v34));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "allObjects"));
      -[MOEventBundle setEvents:](v5, "setEvents:", v36);

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v5, "action"));
      if (v37)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v5, "events"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "firstObject"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "eventIdentifier"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v5, "action"));
        objc_msgSend(v41, "setSourceEventIdentifier:", v40);

        v42 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        v43 = objc_claimAutoreleasedReturnValue(v42);
        if (!os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
LABEL_23:

          goto LABEL_24;
        }
        v44 = (MOEventBundle *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v5, "action"));
        v45 = (MOEventBundle *)objc_claimAutoreleasedReturnValue(-[MOEventBundle sourceEventIdentifier](v44, "sourceEventIdentifier"));
        *(_DWORD *)buf = 138412290;
        v56 = v45;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "associateEventBundles: setting container bundle action as %@ from first event for overlapping ratio > 0.2 and container bundle had events originally", buf, 0xCu);

LABEL_22:
        goto LABEL_23;
      }
    }
    else
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v4, "events"));
      -[MOEventBundle setEvents:](v5, "setEvents:", v46);

      v47 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v5, "action"));
      if (!v47)
        goto LABEL_25;
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](v5, "events"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "firstObject"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "eventIdentifier"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v5, "action"));
      objc_msgSend(v51, "setSourceEventIdentifier:", v50);

      v52 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      v34 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v43 = objc_claimAutoreleasedReturnValue(-[MOEventBundle action](v5, "action"));
        v44 = (MOEventBundle *)objc_claimAutoreleasedReturnValue(-[NSObject sourceEventIdentifier](v43, "sourceEventIdentifier"));
        *(_DWORD *)buf = 138412290;
        v56 = v44;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "associateEventBundles: setting container bundle action as %@ from first event for overlapping ratio > 0.2 and container bundle had no events originally", buf, 0xCu);
        goto LABEL_22;
      }
    }
LABEL_24:

LABEL_25:
    v53 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    v28 = objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v56 = v4;
      v57 = 2112;
      v58 = v5;
      v59 = 2048;
      v60 = v19;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "associateEventBundles: merge, bundle %@, container bundle, %@, ratio, %f", buf, 0x20u);
    }
    goto LABEL_27;
  }
LABEL_30:

}

int64_t __64__MOEventBundleManager_associateEventBundles_effectiveInterval___block_invoke_452(id a1, MOEventBundle *a2, MOEventBundle *a3)
{
  MOEventBundle *v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](a2, "endDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](v4, "endDate"));

  LODWORD(v4) = objc_msgSend(v5, "isBeforeDate:", v6);
  if ((_DWORD)v4)
    return -1;
  else
    return 1;
}

void __64__MOEventBundleManager_associateEventBundles_effectiveInterval___block_invoke_2_454(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
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
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSMutableArray *v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  void *i;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t buf[4];
  id v87;
  __int16 v88;
  id v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  void *v93;
  __int16 v94;
  id v95;
  __int16 v96;
  id v97;
  __int16 v98;
  id v99;
  _BYTE v100[128];
  void *v101;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v87 = v5;
    v88 = 2112;
    v89 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "associateEventBundles: daily trip bundle, %@, container bundles, %@", buf, 0x16u);
  }

  v9 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endDate"));
    *(_DWORD *)buf = 138413058;
    v87 = v11;
    v88 = 2112;
    v89 = v12;
    v90 = 2112;
    v91 = v13;
    v92 = 2112;
    v93 = v14;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "associateEventBundles: summary trip bundle, start, %@, end, %@, container bundles, start, %@, end, %@", buf, 0x2Au);

  }
  +[MOSummarizationUtilities overlappingTimeIntervalBetween:andOtherBundle:](MOSummarizationUtilities, "overlappingTimeIntervalBetween:andOtherBundle:", v5, v6);
  if (v15 > 0.0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "suggestionID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subBundleIDs"));
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subBundleIDs"));
      v20 = objc_msgSend(v19, "containsObject:", v17);

      if ((v20 & 1) != 0)
        goto LABEL_11;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subBundleIDs"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "arrayByAddingObject:", v17));
      objc_msgSend(v6, "setSubBundleIDs:", v22);

    }
    else
    {
      v101 = v17;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v101, 1));
      objc_msgSend(v6, "setSubBundleIDs:", v21);
    }

LABEL_11:
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resources"));

    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resources"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resources"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "arrayByAddingObjectsFromArray:", v25));

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v26));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "allObjects"));
      objc_msgSend(v6, "setResources:", v28);

    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resources"));
      objc_msgSend(v6, "setResources:", v26);
    }

    v29 = *(void **)(a1 + 32);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resources"));
    objc_msgSend(v29, "_assignPriorityScoreForPhotoResources:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "events"));
    if (v31)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "events"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "events"));
      v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "arrayByAddingObjectsFromArray:", v33));

      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v34));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "allObjects"));
      objc_msgSend(v6, "setEvents:", v36);

      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "action"));
      if (v37)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "events"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "firstObject"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "eventIdentifier"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "action"));
        objc_msgSend(v41, "setSourceEventIdentifier:", v40);

        v42 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        v43 = objc_claimAutoreleasedReturnValue(v42);
        if (!os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
LABEL_22:

          goto LABEL_23;
        }
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "action"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "sourceEventIdentifier"));
        *(_DWORD *)buf = 138412290;
        v87 = v45;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "associateEventBundles: setting container bundle action as %@ from second round of association and container bundle had events orignally", buf, 0xCu);

LABEL_21:
        goto LABEL_22;
      }
    }
    else
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "events"));
      objc_msgSend(v6, "setEvents:", v46);

      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "action"));
      if (!v47)
      {
LABEL_24:
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "places"));

        if (v53)
        {
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "places"));
          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "places"));
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "arrayByAddingObjectsFromArray:", v55));

          v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v56));
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "allObjects"));

        }
        else
        {
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "places"));
        }
        v59 = objc_opt_new(NSMutableArray);
        v82 = 0u;
        v83 = 0u;
        v84 = 0u;
        v85 = 0u;
        v60 = v58;
        v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v82, v100, 16);
        if (v61)
        {
          v62 = v61;
          v63 = *(_QWORD *)v83;
          do
          {
            for (i = 0; i != v62; i = (char *)i + 1)
            {
              if (*(_QWORD *)v83 != v63)
                objc_enumerationMutation(v60);
              v65 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)i);
              if ((unint64_t)objc_msgSend(v65, "placeType") <= 5)
                -[NSMutableArray addObject:](v59, "addObject:", v65);
            }
            v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v82, v100, 16);
          }
          while (v62);
        }

        objc_msgSend(v6, "setPlaces:", v59);
        v66 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v59, "lastObject"));
        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "location"));
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "place"));
        objc_msgSend(v68, "setLocation:", v67);

        goto LABEL_37;
      }
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "events"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "firstObject"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "eventIdentifier"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "action"));
      objc_msgSend(v51, "setSourceEventIdentifier:", v50);

      v52 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      v34 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "action"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject sourceEventIdentifier](v43, "sourceEventIdentifier"));
        *(_DWORD *)buf = 138412290;
        v87 = v44;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "associateEventBundles: setting container bundle action as %@ from second round of association and container bundle had no events orignally", buf, 0xCu);
        goto LABEL_21;
      }
    }
LABEL_23:

    goto LABEL_24;
  }
LABEL_37:
  v69 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v70 = objc_claimAutoreleasedReturnValue(v69);
  if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
  {
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDate"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endDate"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endDate"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subBundleIDs"));
    v75 = objc_msgSend(v80, "count");
    v81 = v5;
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subSuggestionIDs"));
    v77 = objc_msgSend(v76, "count");
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "events"));
    v79 = objc_msgSend(v78, "count");
    *(_DWORD *)buf = 138413826;
    v87 = v71;
    v88 = 2112;
    v89 = v72;
    v90 = 2112;
    v91 = v73;
    v92 = 2112;
    v93 = v74;
    v94 = 2048;
    v95 = v75;
    v96 = 2048;
    v97 = v77;
    v98 = 2048;
    v99 = v79;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "associateEventBundles: summary trip bundle, start, %@, end, %@, container bundles, start, %@, end, %@, container.subBundleIDs, %lu, container.subSuggstionIDs, %lu, container.events, %lu", buf, 0x48u);

    v5 = v81;
  }

}

+ (id)dateFormatterForKeyword
{
  if (dateFormatterForKeyword_onceToken != -1)
    dispatch_once(&dateFormatterForKeyword_onceToken, &__block_literal_global_455);
  return (id)dateFormatterForKeyword_dateFormatter;
}

void __47__MOEventBundleManager_dateFormatterForKeyword__block_invoke(id a1)
{
  NSDateFormatter *v1;
  void *v2;
  void *v3;
  id v4;

  v1 = objc_opt_new(NSDateFormatter);
  v2 = (void *)dateFormatterForKeyword_dateFormatter;
  dateFormatterForKeyword_dateFormatter = (uint64_t)v1;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX")));
  objc_msgSend((id)dateFormatterForKeyword_dateFormatter, "setLocale:", v3);

  objc_msgSend((id)dateFormatterForKeyword_dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneForSecondsFromGMT:](NSTimeZone, "timeZoneForSecondsFromGMT:", 0));
  objc_msgSend((id)dateFormatterForKeyword_dateFormatter, "setTimeZone:", v4);

}

- (id)keywordForEventBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "bundleManagementPolicy") == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v3, "interfaceType")));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleManager dateFormatterForKeyword](MOEventBundleManager, "dateFormatterForKeyword"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromDate:", v6));

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu-%@"), objc_msgSend(v3, "interfaceType"), v7));
  }

  return v4;
}

- (id)adjacentKeywordsForEventBundle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSMutableArray *v7;
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
  void *v20;

  v4 = a3;
  if (objc_msgSend(v4, "bundleManagementPolicy") == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager keywordForEventBundle:](self, "keywordForEventBundle:", v4));
    v20 = v5;
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleManager dateFormatterForKeyword](MOEventBundleManager, "dateFormatterForKeyword"));
    v7 = objc_opt_new(NSMutableArray);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateByAddingTimeInterval:", -86400.0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromDate:", v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu-%@"), objc_msgSend(v4, "interfaceType"), v10));
    -[NSMutableArray addObject:](v7, "addObject:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromDate:", v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu-%@"), objc_msgSend(v4, "interfaceType"), v13));
    -[NSMutableArray addObject:](v7, "addObject:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dateByAddingTimeInterval:", 86400.0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromDate:", v16));

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu-%@"), objc_msgSend(v4, "interfaceType"), v17));
    -[NSMutableArray addObject:](v7, "addObject:", v18);

    v6 = -[NSMutableArray copy](v7, "copy");
  }

  return v6;
}

- (id)partitionedEventBundles:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  NSMutableDictionary *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  void *v35;
  _BYTE v36[128];
  _BYTE v37[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableDictionary);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager keywordForEventBundle:](self, "keywordForEventBundle:", v10));
        v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5, "objectForKey:", v11));
        if (!v12)
          v12 = objc_opt_new(NSMutableArray);
        -[NSMutableArray addObject:](v12, "addObject:", v10);
        -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v12, v11);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v7);
  }

  v13 = objc_opt_new(NSMutableDictionary);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v25 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v5, "allKeys"));
  v14 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v25);
        v18 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)j);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5, "objectForKey:", v18));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0));
        v35 = v20;
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sortedArrayUsingDescriptors:", v21));

        -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v22, v18);
      }
      v15 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v15);
  }

  v23 = -[NSMutableDictionary copy](v13, "copy");
  return v23;
}

- (id)matchedEventBundleForEventBundle:(id)a3 otherEventBundles:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  void *v46;
  _BYTE v47[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager adjacentKeywordsForEventBundle:](self, "adjacentKeywordsForEventBundle:", v6));
  v9 = objc_opt_new(NSMutableArray);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v41 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i)));
        -[NSMutableArray addObjectsFromArray:](v9, "addObjectsFromArray:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    }
    while (v12);
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0));
  v46 = v31;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v46, 1));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingDescriptors:](v9, "sortedArrayUsingDescriptors:", v16));

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v18 = v17;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v37;
LABEL_10:
    v22 = 0;
    while (1)
    {
      if (*(_QWORD *)v37 != v21)
        objc_enumerationMutation(v18);
      v23 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v22);
      if ((objc_msgSend(v23, "filtered") & 1) == 0
        && (objc_msgSend(v6, "isEqualToEventBundle:", v23) & 1) != 0)
      {
        break;
      }
      if (v20 == (id)++v22)
      {
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
        if (v20)
          goto LABEL_10;
        goto LABEL_17;
      }
    }
  }
  else
  {
LABEL_17:

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v24 = v18;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    if (!v25)
    {
      v29 = 0;
      goto LABEL_28;
    }
    v26 = v25;
    v27 = *(_QWORD *)v33;
LABEL_19:
    v28 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v27)
        objc_enumerationMutation(v24);
      v23 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v28);
      if (objc_msgSend(v23, "filtered"))
      {
        if ((objc_msgSend(v6, "isEqualToEventBundle:", v23) & 1) != 0)
          break;
      }
      if (v26 == (id)++v28)
      {
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
        v29 = 0;
        if (v26)
          goto LABEL_19;
        goto LABEL_28;
      }
    }
  }
  v29 = v23;
LABEL_28:

  return v29;
}

- (void)submitMetricForEventBundleWithPromptMetrics:(id)a3
{
  id v3;
  id os_log;
  NSObject *v5;
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  id v13;
  uint8_t buf[4];
  id v15;

  v3 = a3;
  objc_msgSend(v3, "getAndSetAgeGender");
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Start submission of bundling CA metrics.", buf, 2u);
  }

  v13 = 0;
  objc_msgSend(v3, "submitMetricsWithError:", &v13);

  v6 = v13;
  v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      v10 = "Error was issued during metrics submission for MOPromptMetrics. Error: %@";
      v11 = v8;
      v12 = 12;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v10, buf, v12);
    }
  }
  else if (v9)
  {
    *(_WORD *)buf = 0;
    v10 = "Finished submission of bundling CA metrics.";
    v11 = v8;
    v12 = 2;
    goto LABEL_8;
  }

}

- (void)submitMOEventData:(id)a3 startDate:(id)a4 endDate:(id)a5 subDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id os_log;
  NSObject *v15;
  MOEventBundler *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  uint64_t v29;
  int v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  int v48;
  uint64_t v49;
  void *j;
  void *v51;
  void *v52;
  unsigned int v53;
  MOEventData *v54;
  id v55;
  NSObject *v56;
  id v57;
  id v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  NSObject *v65;
  uint64_t v66;
  id v67;
  void *v68;
  MOUserData *v69;
  id v70;
  id v71;
  id v72;
  MOEventBundler *v73;
  void *v74;
  NSObject *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint8_t buf[4];
  _BYTE v96[14];
  __int16 v97;
  void *v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v15 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v96 = objc_msgSend(v10, "count");
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "We have %lu raw events to submit.", buf, 0xCu);
  }

  v16 = -[MOEventBundler initWithStartDate:endDate:]([MOEventBundler alloc], "initWithStartDate:endDate:", v11, v12);
  v17 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Bundle events to find co-occuring events before submission.", buf, 2u);
  }
  v78 = v13;
  v70 = v12;
  v71 = v11;

  v72 = v10;
  v73 = v16;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundler calculateEventBundlesFromEvents:](v16, "calculateEventBundlesFromEvents:", v10));
  v20 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = objc_msgSend(v19, "count");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v96 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "We have %lu event bundles.", buf, 0xCu);
  }

  v69 = -[MOUserData initWithEventManager:]([MOUserData alloc], "initWithEventManager:", self->_eventManager);
  -[MOUserData submitUserDataWithCompletionHandler:](v69, "submitUserDataWithCompletionHandler:", &__block_literal_global_468);
  v81 = objc_alloc_init((Class)NSMutableArray);
  v23 = objc_alloc_init((Class)NSMutableArray);
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v76 = v19;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allKeys"));
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v92;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(_QWORD *)v92 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(v81, "addObject:", *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * (_QWORD)i));
        v29 = arc4random_uniform(0x1388u) + 1;
        v30 = 10;
        do
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v29));
          v32 = objc_msgSend(v23, "containsObject:", v31);

          if (!v32)
            break;
          v29 = arc4random_uniform(0x1388u) + 1;
          --v30;
        }
        while (v30);
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v29));
        objc_msgSend(v23, "addObject:", v33);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
    }
    while (v26);
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:](NSDictionary, "dictionaryWithObjects:forKeys:", v23, v81));
  v35 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v36 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v96 = v34;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "islandID random map: %@", buf, 0xCu);
  }

  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1002D9020, &off_1002D9038, &off_1002D9050, &off_1002D8FC0, 0));
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v37 = v76;
  v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "allKeys"));
  v39 = -[NSObject countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v87, v100, 16);
  v74 = v34;
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v88;
    v75 = v38;
    v66 = *(_QWORD *)v88;
    do
    {
      v42 = 0;
      v67 = v40;
      do
      {
        if (*(_QWORD *)v88 != v41)
          objc_enumerationMutation(v38);
        v43 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)v42);
        v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", v43));
        if (v79)
        {
          v68 = v42;
          v77 = v43;
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", v43));
          v83 = 0u;
          v84 = 0u;
          v85 = 0u;
          v86 = 0u;
          v45 = v44;
          v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
          if (v46)
          {
            v47 = v46;
            v48 = 0;
            v49 = *(_QWORD *)v84;
            while (2)
            {
              for (j = 0; j != v47; j = (char *)j + 1)
              {
                if (*(_QWORD *)v84 != v49)
                  objc_enumerationMutation(v45);
                v51 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)j);
                v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v51, "provider")));
                v53 = objc_msgSend(v80, "containsObject:", v52);

                if (v53)
                {
                  v54 = -[MOEventData initWithEvent:islandID:subDate:]([MOEventData alloc], "initWithEvent:islandID:subDate:", v51, v79, v78);
                  v55 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                  v56 = objc_claimAutoreleasedReturnValue(v55);
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)v96 = v48;
                    *(_WORD *)&v96[4] = 2112;
                    *(_QWORD *)&v96[6] = v77;
                    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "Submitting raw event with index: %d and islandID: %@.", buf, 0x12u);
                  }

                  v82 = 0;
                  -[MOEventData submitMetricsWithError:](v54, "submitMetricsWithError:", &v82);
                  v57 = v82;
                  if (v57)
                  {
                    v63 = v57;
                    v64 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                    v65 = objc_claimAutoreleasedReturnValue(v64);
                    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 67109634;
                      *(_DWORD *)v96 = v48;
                      *(_WORD *)&v96[4] = 2112;
                      *(_QWORD *)&v96[6] = v77;
                      v97 = 2112;
                      v98 = v63;
                      _os_log_error_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "Error was issued during raw event submission with event index: %d and islandID: %@. Error: %@", buf, 0x1Cu);
                    }

                    v61 = v71;
                    v60 = v72;
                    v62 = v70;
                    v37 = v76;
                    goto LABEL_46;
                  }
                  ++v48;

                }
              }
              v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
              if (v47)
                continue;
              break;
            }
          }

          v38 = v75;
          v37 = v76;
          v34 = v74;
          v41 = v66;
          v40 = v67;
          v42 = v68;
        }
        v42 = (char *)v42 + 1;
      }
      while (v42 != v40);
      v40 = -[NSObject countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v87, v100, 16);
    }
    while (v40);
  }

  v58 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v59 = objc_claimAutoreleasedReturnValue(v58);
  v75 = v59;
  if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "Finished submission of raw events.", buf, 2u);
  }
  v61 = v71;
  v60 = v72;
  v62 = v12;
LABEL_46:

}

void __68__MOEventBundleManager_submitMOEventData_startDate_endDate_subDate___block_invoke(id a1, NSError *a2, NSError *a3, NSError *a4)
{
  NSError *v6;
  NSError *v7;
  NSError *v8;
  id os_log;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  if (v6)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v10 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __68__MOEventBundleManager_submitMOEventData_startDate_endDate_subDate___block_invoke_cold_3();

  }
  if (v7)
  {
    v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __68__MOEventBundleManager_submitMOEventData_startDate_endDate_subDate___block_invoke_cold_2();

  }
  if (v8)
  {
    v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __68__MOEventBundleManager_submitMOEventData_startDate_endDate_subDate___block_invoke_cold_1();

  }
}

- (void)submitEventBundleInternalAnalytics:(id)a3 withSubmissionDate:(id)a4 withRefreshVariant:(unint64_t)a5
{
  id v7;
  id os_log;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  NSObject *v84;
  NSMutableDictionary *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  NSMutableDictionary *v99;
  id v100;
  NSObject *v101;
  void *v102;
  NSObject *p_super;
  id v104;
  id v105;
  NSObject *v106;
  void *v107;
  void *v108;
  id obj;
  uint64_t v110;
  void *v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  void *v118;
  id v119;
  id v120;
  id v121;
  void *v122;
  void *v123;
  void *v124;
  _QWORD v125[4];
  NSMutableDictionary *v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  uint8_t v131[4];
  uint64_t v132;
  uint8_t v133[128];
  uint8_t buf[4];
  NSMutableDictionary *v135;

  v7 = a3;
  v119 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v135 = (NSMutableDictionary *)objc_msgSend(v7, "count");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%lu bundles are passed to be submitted to CoreAnalytics.", buf, 0xCu);
  }

  v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "components:fromDate:", 764, v119));
  v116 = objc_msgSend(v10, "year");
  v115 = objc_msgSend(v10, "month");
  v114 = objc_msgSend(v10, "day");
  v113 = objc_msgSend(v10, "hour");
  v107 = v10;
  v112 = objc_msgSend(v10, "minute");
  v118 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binsFromStart:toEnd:gap:](MOMetric, "binsFromStart:toEnd:gap:", &off_1002D8F90, &off_1002DCFE8, &off_1002DD068));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getTrialExperimentIdentifiers"));

  v129 = 0u;
  v130 = 0u;
  v127 = 0u;
  v128 = 0u;
  obj = v7;
  v120 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v133, 16);
  if (v120)
  {
    v110 = *(_QWORD *)v128;
    v111 = v12;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v128 != v110)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * (_QWORD)v13);
        v124 = objc_autoreleasePoolPush();
        v15 = objc_opt_new(NSMutableDictionary);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v116));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v16, CFSTR("submissionTimeYear"));

        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v115));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v17, CFSTR("submissionTimeMonth"));

        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v114));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v18, CFSTR("submissionTimeDay"));

        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v113));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v19, CFSTR("submissionTimeHour"));

        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v112));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v20, CFSTR("submissionTimeMinute"));

        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v21, CFSTR("refreshVariant"));

        if (v12)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "experimentId"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v22, CFSTR("trialExperimentId"));

          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v12, "deploymentId")));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringValue"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v24, CFSTR("trialDeploymentId"));

          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "treatmentId"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v25, CFSTR("trialTreatmentId"));

        }
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleIdentifier"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v26, "hash")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v27, CFSTR("bundleId"));

        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "suggestionID"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v28, "hash")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v29, CFSTR("suggestionId"));

        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "interfaceType")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v30, CFSTR("interfaceType"));

        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "source")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v31, CFSTR("bundleSource"));

        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v14, "filtered")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v32, CFSTR("isFiltered"));

        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "bundleSubType")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v33, CFSTR("bundleSubType"));

        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "bundleSuperType")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v34, CFSTR("bundleSuperType"));

        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startDate"));
        objc_msgSend(v119, "timeIntervalSinceDate:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v36, v118));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v37, CFSTR("startTimeBucketed"));

        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endDate"));
        objc_msgSend(v119, "timeIntervalSinceDate:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v39, v118));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v40, CFSTR("endTimeBucketed"));

        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "events"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v41, "count")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v42, CFSTR("numTotalEvents"));

        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "events"));
        v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "valueForKeyPath:", CFSTR("@distinctUnionOfObjects.category")));

        v123 = (void *)v44;
        v45 = objc_msgSend(objc_alloc((Class)NSCountedSet), "initWithArray:", v44);
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v45, "countForObject:", &off_1002D8F60)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v46, CFSTR("numUnknownEvents"));

        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v45, "countForObject:", &off_1002D9020)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v47, CFSTR("numVisitEvents"));

        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v45, "countForObject:", &off_1002D9038)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v48, CFSTR("numWorkoutEvents"));

        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v45, "countForObject:", &off_1002D9050)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v49, CFSTR("numMediaOnRepeatEvents"));

        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v45, "countForObject:", &off_1002D8FC0)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v50, CFSTR("numLeisureMediaEvents"));

        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v45, "countForObject:", &off_1002D8FD8)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v51, CFSTR("numPhotoMomentEvents"));

        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v45, "countForObject:", &off_1002D9068)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v52, CFSTR("numMediaPlaySessionEvents"));

        v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v45, "countForObject:", &off_1002D9080)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v53, CFSTR("numTopicEvents"));

        v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v45, "countForObject:", &off_1002D9098)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v54, CFSTR("numTravelEvents"));

        v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v45, "countForObject:", &off_1002D90B0)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v55, CFSTR("numSharedWithYouEvents"));

        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v45, "countForObject:", &off_1002D90C8)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v56, CFSTR("numSignificantContactEvents"));

        v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v45, "countForObject:", &off_1002D8F78)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v57, CFSTR("numStructuredEvents"));

        v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v45, "countForObject:", &off_1002D8FA8)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v58, CFSTR("numNLEvents"));

        v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v45, "countForObject:", &off_1002D90E0)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v59, CFSTR("numMindfulSessionEvents"));

        v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v45, "countForObject:", &off_1002D90F8)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v60, CFSTR("numSharedPhotoEvents"));

        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "events"));
        v62 = objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "valueForKeyPath:", CFSTR("@distinctUnionOfObjects.provider")));

        v122 = (void *)v62;
        v121 = objc_msgSend(objc_alloc((Class)NSCountedSet), "initWithArray:", v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v121, "countForObject:", &off_1002D8FD8)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v63, CFSTR("numPatternEvents"));

        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allResources"));
        v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v64, "count")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v65, CFSTR("numTotalResources"));

        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "valueForKeyPath:", CFSTR("@distinctUnionOfObjects.type")));
        v67 = objc_msgSend(objc_alloc((Class)NSCountedSet), "initWithArray:", v66);
        v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v67, "countForObject:", &off_1002D8F60)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v68, CFSTR("numUnknownResourceTypes"));

        v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v67, "countForObject:", &off_1002D9020)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v69, CFSTR("numValueResourceTypes"));

        v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v67, "countForObject:", &off_1002D9038)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v70, CFSTR("numPhotoAssetResourceTypes"));

        v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v67, "countForObject:", &off_1002D9050)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v71, CFSTR("numMediaResourceTypes"));

        v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v67, "countForObject:", &off_1002D8FC0)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v72, CFSTR("numWebLinkResourceTypes"));

        v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v67, "countForObject:", &off_1002D8FD8)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v73, CFSTR("numInferenceTagResourceTypes"));

        v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v67, "countForObject:", &off_1002D9068)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v74, CFSTR("numMapItemResourceTypes"));

        v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v67, "countForObject:", &off_1002D9080)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v75, CFSTR("numAppResourceTypes"));

        v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v67, "countForObject:", &off_1002D9098)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v76, CFSTR("numTopicResourceTypes"));

        v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v67, "countForObject:", &off_1002D90B0)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v77, CFSTR("numEvergreenResourceTypes"));

        v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v67, "countForObject:", &off_1002D90C8)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v78, CFSTR("numWorkoutResourceTypes"));

        v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v67, "countForObject:", &off_1002D8F78)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v79, CFSTR("numPersonResourceTypes"));

        v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v67, "countForObject:", &off_1002D8FA8)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v80, CFSTR("numPlaceResourceTypes"));

        v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v67, "countForObject:", &off_1002D90E0)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v81, CFSTR("numMotionActivityResourceTypes"));

        v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v67, "countForObject:", &off_1002D90F8)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v82, CFSTR("numWeatherResourceTypes"));

        if (objc_msgSend(v14, "interfaceType") == (id)2
          || objc_msgSend(v14, "interfaceType") == (id)1
          || objc_msgSend(v14, "interfaceType") == (id)7
          || objc_msgSend(v14, "interfaceType") == (id)10)
        {
          v83 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v84 = objc_claimAutoreleasedReturnValue(v83);
          if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
          {
            v85 = (NSMutableDictionary *)objc_msgSend(v14, "photoSource");
            *(_DWORD *)buf = 134217984;
            v135 = v85;
            _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_INFO, "photoSource set in ca,%lu", buf, 0xCu);
          }

          v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "photoSource")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v86, CFSTR("photoSource"));

        }
        v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "action"));
        v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v87, "actionType")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v88, CFSTR("actionType"));

        v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "persons"));
        v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v89, "count")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v90, CFSTR("numPersons"));

        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "place"));
        v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v91, "placeUserType") != 0));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v92, CFSTR("isPlaceUserTypeKnown"));

        v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "place"));
        v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v93, "placeType") != 0));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v94, CFSTR("isPlaceTypeKnown"));

        v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "place"));
        v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v95, "proposition") != 0));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v96, CFSTR("isPlacePropositionSet"));

        v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "time"));
        v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v97, "timeTag") != 0));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v98, CFSTR("isTimeTagSet"));

        if (v15)
        {
          v125[0] = _NSConcreteStackBlock;
          v125[1] = 3221225472;
          v125[2] = __97__MOEventBundleManager_submitEventBundleInternalAnalytics_withSubmissionDate_withRefreshVariant___block_invoke;
          v125[3] = &unk_1002B2238;
          v99 = v15;
          v126 = v99;
          AnalyticsSendEventLazy(CFSTR("com.apple.Moments.MOEventBundle"), v125);
          v100 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
          v101 = objc_claimAutoreleasedReturnValue(v100);
          v102 = v124;
          if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v135 = v99;
            _os_log_debug_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEBUG, "Submitted coreAnalytics message: %@", buf, 0xCu);
          }

          p_super = &v126->super.super;
        }
        else
        {
          v104 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
          p_super = objc_claimAutoreleasedReturnValue(v104);
          v102 = v124;
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
            -[MOEventBundleManager submitEventBundleInternalAnalytics:withSubmissionDate:withRefreshVariant:].cold.1(v131, &v132, p_super);
        }
        v12 = v111;

        objc_autoreleasePoolPop(v102);
        v13 = (char *)v13 + 1;
      }
      while (v120 != v13);
      v120 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v133, 16);
    }
    while (v120);
  }

  v105 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v106 = objc_claimAutoreleasedReturnValue(v105);
  if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_INFO, "Completed Bundle CoreAnalytics submission.", buf, 2u);
  }

}

id __97__MOEventBundleManager_submitEventBundleInternalAnalytics_withSubmissionDate_withRefreshVariant___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)saveEventBundles:(id)a3 withStartDate:(id)a4 endDate:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, uint64_t, _QWORD);
  NSMutableSet *v14;
  MOEventBundleFetchOptions *v15;
  void *v16;
  id v17;
  NSMutableSet *v18;
  MOEventBundleStore *eventBundleStore;
  id v20;
  MOEventBundleStore *v21;
  id v22;
  NSMutableSet *v23;
  uint64_t v24;
  id v25;
  _QWORD v26[4];
  NSMutableSet *v27;
  uint64_t *v28;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  NSMutableDictionary *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _QWORD v51[4];
  id v52;
  NSMutableSet *v53;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, uint64_t, _QWORD))a6;
  v14 = objc_opt_new(NSMutableSet);
  v25 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v11, v12);
  v15 = -[MOEventBundleFetchOptions initWithDateInterval:ascending:limit:filterBundle:]([MOEventBundleFetchOptions alloc], "initWithDateInterval:ascending:limit:filterBundle:", v25, 1, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager eventBundleStore](self, "eventBundleStore"));
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = __71__MOEventBundleManager_saveEventBundles_withStartDate_endDate_handler___block_invoke;
  v51[3] = &unk_1002B2260;
  v17 = v10;
  v52 = v17;
  v18 = v14;
  v53 = v18;
  objc_msgSend(v16, "fetchEventBundleWithOptions:CompletionHandler:", v15, v51);

  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__19;
  v49 = __Block_byref_object_dispose__19;
  v50 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__19;
  v43 = __Block_byref_object_dispose__19;
  v44 = objc_opt_new(NSMutableDictionary);
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__19;
  v37 = __Block_byref_object_dispose__19;
  v38 = 0;
  eventBundleStore = self->_eventBundleStore;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = __71__MOEventBundleManager_saveEventBundles_withStartDate_endDate_handler___block_invoke_490;
  v29[3] = &unk_1002B2288;
  v31 = &v45;
  v32 = &v39;
  v20 = v17;
  v30 = v20;
  -[MOEventBundleStore storeEventBundles:CompletionHandler:](eventBundleStore, "storeEventBundles:CompletionHandler:", v20, v29);
  v21 = self->_eventBundleStore;
  v22 = -[NSMutableSet copy](v18, "copy");
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = __71__MOEventBundleManager_saveEventBundles_withStartDate_endDate_handler___block_invoke_491;
  v26[3] = &unk_1002B22B0;
  v28 = &v33;
  v23 = v18;
  v27 = v23;
  -[MOEventBundleStore removeEventBundles:CompletionHandler:](v21, "removeEventBundles:CompletionHandler:", v22, v26);

  if (v13)
  {
    v24 = v46[5];
    if (v24)
      v13[2](v13, v24, v40[5]);
    else
      v13[2](v13, v34[5], v40[5]);
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
}

void __71__MOEventBundleManager_saveEventBundles_withStartDate_endDate_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  id os_log;
  NSObject *v12;
  id obj;
  uint64_t v14;
  id v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a2;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
  if (v15)
  {
    v14 = *(_QWORD *)v22;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(obj);
        v16 = v3;
        v4 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v3);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v5 = *(id *)(a1 + 32);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v18;
          do
          {
            for (i = 0; i != v7; i = (char *)i + 1)
            {
              if (*(_QWORD *)v18 != v8)
                objc_enumerationMutation(v5);
              v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
              if (objc_msgSend(v4, "shareEvents:", v10))
              {
                os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                v12 = objc_claimAutoreleasedReturnValue(os_log);
                if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412546;
                  v26 = v4;
                  v27 = 2112;
                  v28 = v10;
                  _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "found old event bundle which share events with new event bundle, old bundle, %@, new bundle, %@", buf, 0x16u);
                }

                if (objc_msgSend(v4, "interfaceType") != (id)13)
                  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
              }
            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
          }
          while (v7);
        }

        v3 = v16 + 1;
      }
      while ((id)(v16 + 1) != v15);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
    }
    while (v15);
  }

}

void __71__MOEventBundleManager_saveEventBundles_withStartDate_endDate_handler___block_invoke_490(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  id v13;
  int v14;
  id v15;

  v6 = a2;
  v7 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __71__MOEventBundleManager_saveEventBundles_withStartDate_endDate_handler___block_invoke_490_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v11 = objc_msgSend(v7, "mutableCopy");
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(NSObject **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v13 = objc_msgSend(*(id *)(a1 + 32), "count");
    v14 = 134217984;
    v15 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "saved %lu new event bundles from bundling process", (uint8_t *)&v14, 0xCu);
  }

}

void __71__MOEventBundleManager_saveEventBundles_withStartDate_endDate_handler___block_invoke_491(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  id v9;
  int v10;
  id v11;

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __71__MOEventBundleManager_saveEventBundles_withStartDate_endDate_handler___block_invoke_491_cold_1();

    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = v3;
    v6 = *(NSObject **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v8;
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "count");
    v10 = 134217984;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "removed %lu old event bundles from bundling process", (uint8_t *)&v10, 0xCu);
  }

}

- (id)getUnfilteredEventBundleFrom:(id)a3 with:(id)a4
{
  id v5;
  id v6;
  NSMutableDictionary *v7;
  id v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  _QWORD v12[4];
  id v13;
  NSMutableDictionary *v14;

  v5 = a4;
  v6 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __58__MOEventBundleManager_getUnfilteredEventBundleFrom_with___block_invoke;
  v12[3] = &unk_1002B22D8;
  v13 = v5;
  v7 = objc_opt_new(NSMutableDictionary);
  v14 = v7;
  v8 = v5;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);

  v9 = v14;
  v10 = v7;

  return v10;
}

void __58__MOEventBundleManager_getUnfilteredEventBundleFrom_with___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  MOEventBundle *v7;
  void *v8;
  id v9;
  id v10;
  int v11;
  uint64_t v12;
  void *i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = a2;
  v6 = a3;
  v7 = -[MOEventBundle initWithEventSet:filtered:]([MOEventBundle alloc], "initWithEventSet:filtered:", v6, 0);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "allValues", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v9)
  {

LABEL_11:
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v7, v5);
    goto LABEL_12;
  }
  v10 = v9;
  v11 = 0;
  v12 = *(_QWORD *)v15;
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(_QWORD *)v15 != v12)
        objc_enumerationMutation(v8);
      v11 |= -[MOEventBundle containTheSameEventSet:](v7, "containTheSameEventSet:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i));
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  }
  while (v10);

  if ((v11 & 1) == 0)
    goto LABEL_11;
LABEL_12:

}

- (void)saveEventBundles:(id)a3 handler:(id)a4
{
  id v6;
  MOEventBundleStore *eventBundleStore;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  eventBundleStore = self->_eventBundleStore;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __49__MOEventBundleManager_saveEventBundles_handler___block_invoke;
  v9[3] = &unk_1002ADA40;
  v10 = v6;
  v8 = v6;
  -[MOEventBundleStore storeEventBundles:CompletionHandler:](eventBundleStore, "storeEventBundles:CompletionHandler:", a3, v9);

}

void __49__MOEventBundleManager_saveEventBundles_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __71__MOEventBundleManager_saveEventBundles_withStartDate_endDate_handler___block_invoke_490_cold_1();
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "save event bundles succeed", v11, 2u);
  }

  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);

}

- (void)saveEventBundleDictionary:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allValues"));
  -[MOEventBundleStore storeEventBundles:CompletionHandler:](self->_eventBundleStore, "storeEventBundles:CompletionHandler:", v4, &__block_literal_global_493);

}

void __50__MOEventBundleManager_saveEventBundleDictionary___block_invoke(id a1, NSError *a2, NSDictionary *a3)
{
  NSError *v3;
  id os_log;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __71__MOEventBundleManager_saveEventBundles_withStartDate_endDate_handler___block_invoke_490_cold_1();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "save event bundles succeed", v7, 2u);
  }

}

- (void)fetchRehydratedEventBundlesWithOptions:(id)a3 CompletionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  MOEventBundleManager *v10;
  id v11;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __81__MOEventBundleManager_fetchRehydratedEventBundlesWithOptions_CompletionHandler___block_invoke;
  v8[3] = &unk_1002B2320;
  v9 = a3;
  v10 = self;
  v11 = a4;
  v6 = v11;
  v7 = v9;
  -[MOEventBundleManager fetchEventBundlesWithOptions:CompletionHandler:](self, "fetchEventBundlesWithOptions:CompletionHandler:", v7, v8);

}

void __81__MOEventBundleManager_fetchRehydratedEventBundlesWithOptions_CompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id os_log;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v18 = v12;
    v19 = 2048;
    v20 = objc_msgSend(v7, "count");
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "fetchRehydratedEventBundlesWithOptions, options, %@, bundles, %lu", buf, 0x16u);
  }

  if (objc_msgSend(v7, "count"))
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __81__MOEventBundleManager_fetchRehydratedEventBundlesWithOptions_CompletionHandler___block_invoke_494;
    v14[3] = &unk_1002AEB80;
    v13 = *(void **)(a1 + 40);
    v16 = *(id *)(a1 + 48);
    v15 = v9;
    objc_msgSend(v13, "_rehydrateEventBundles:withHandler:", v7, v14);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __81__MOEventBundleManager_fetchRehydratedEventBundlesWithOptions_CompletionHandler___block_invoke_494(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, a3, *(_QWORD *)(a1 + 32));
}

- (void)fetchEventBundlesWithOptions:(id)a3 CompletionHandler:(id)a4
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  MOPerformanceMeasurement *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  MOPerformanceMeasurement *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];
  MOPerformanceMeasurement *v23;
  id v24;
  uint8_t buf[8];
  const __CFString *v26;
  void *v27;
  NSErrorUserInfoKey v28;
  const __CFString *v29;

  v6 = a3;
  v7 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerFetchEventBundlesWrapper", ", buf, 2u);
  }

  v10 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("FetchEventBundlesWrapper"), 0);
  -[MOPerformanceMeasurement startSession](v10, "startSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager eventBundleStore](self, "eventBundleStore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "persistenceManager"));
  v13 = objc_msgSend(v12, "availability");

  v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if (v13 == (id)2)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "fetch event bundles since datastore is available", buf, 2u);
    }

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = __71__MOEventBundleManager_fetchEventBundlesWithOptions_CompletionHandler___block_invoke;
    v22[3] = &unk_1002B2348;
    v23 = v10;
    v24 = v7;
    -[MOEventBundleManager _fetchEventBundlesWithOptions:CompletionHandler:](self, "_fetchEventBundlesWithOptions:CompletionHandler:", v6, v22);

    v17 = v23;
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MOEventBundleManager fetchEventBundlesWithOptions:CompletionHandler:].cold.1();

    v28 = NSLocalizedDescriptionKey;
    v29 = CFSTR("database is not available");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
    v17 = (MOPerformanceMeasurement *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 16, v18));

    v19 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerFetchEventBundlesWrapper", ", buf, 2u);
    }

    -[MOPerformanceMeasurement endSession](v10, "endSession");
    v26 = CFSTR("stateDatabaseAvailable");
    v27 = &__kCFBooleanFalse;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
    (*((void (**)(id, void *, MOPerformanceMeasurement *, void *))v7 + 2))(v7, &__NSArray0__struct, v17, v21);

  }
}

void __71__MOEventBundleManager_fetchEventBundlesWithOptions_CompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id os_log;
  NSObject *v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v7, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("stateDatabaseAvailable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count")));
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("resultNumberOfBundleEvents"));

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v10 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerFetchEventBundlesWrapper", ", v11, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_fetchEventBundlesWithOptions:(id)a3 CompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MOEventBundleFetchOptions *v9;
  MOEventBundleFetchOptions *v10;
  void *v11;
  void *v12;
  id os_log;
  NSObject *v14;
  MOPerformanceMeasurement *v15;
  id v16;
  NSObject *v17;
  MOEventBundleStore *eventBundleStore;
  MOPerformanceMeasurement *v19;
  id v20;
  _QWORD v21[4];
  MOPerformanceMeasurement *v22;
  MOEventBundleManager *v23;
  id v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[4];
  MOEventBundleFetchOptions *v29;

  v6 = a3;
  v7 = a4;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__19;
  v26[4] = __Block_byref_object_dispose__19;
  v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "limit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifiers"));
  if (v8)
  {
    v9 = (MOEventBundleFetchOptions *)v6;
  }
  else
  {
    v10 = [MOEventBundleFetchOptions alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "categories"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateInterval"));
    v9 = -[MOEventBundleFetchOptions initWithAllowedCategories:dateInterval:ascending:limit:includeDeletedBundles:skipRanking:interfaceType:](v10, "initWithAllowedCategories:dateInterval:ascending:limit:includeDeletedBundles:skipRanking:interfaceType:", v11, v12, objc_msgSend(v6, "ascending"), 0, objc_msgSend(v6, "includeDeletedBundles"), objc_msgSend(v6, "skipRanking"), objc_msgSend(v6, "interfaceType"));

  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v14 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerFetchEventBundlesFetch", ", buf, 2u);
  }

  v15 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("FetchEventBundlesFetch"), 0);
  -[MOPerformanceMeasurement startSession](v15, "startSession");
  v16 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v9;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "fetched event bundles options, %@", buf, 0xCu);
  }

  eventBundleStore = self->_eventBundleStore;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __72__MOEventBundleManager__fetchEventBundlesWithOptions_CompletionHandler___block_invoke;
  v21[3] = &unk_1002B2398;
  v19 = v15;
  v22 = v19;
  v23 = self;
  v20 = v7;
  v24 = v20;
  v25 = v26;
  -[MOEventBundleStore fetchEventBundleWithOptions:CompletionHandler:](eventBundleStore, "fetchEventBundleWithOptions:CompletionHandler:", v9, v21);

  _Block_object_dispose(v26, 8);
}

void __72__MOEventBundleManager__fetchEventBundlesWithOptions_CompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerFetchEventBundlesFetch", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "queue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __72__MOEventBundleManager__fetchEventBundlesWithOptions_CompletionHandler___block_invoke_501;
  v13[3] = &unk_1002B2370;
  v14 = v6;
  v10 = *(id *)(a1 + 48);
  v15 = v5;
  v16 = v10;
  v17 = *(_QWORD *)(a1 + 56);
  v11 = v5;
  v12 = v6;
  dispatch_async(v9, v13);

}

void __72__MOEventBundleManager__fetchEventBundlesWithOptions_CompletionHandler___block_invoke_501(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  id os_log;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  id v17;

  v2 = (_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 32);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __72__MOEventBundleManager__fetchEventBundlesWithOptions_CompletionHandler___block_invoke_501_cold_1();

    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
      (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, &__NSArray0__struct, *v2);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = objc_msgSend(*(id *)(a1 + 40), "count");
      v16 = 134217984;
      v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "fetched event bundles count, %lu", (uint8_t *)&v16, 0xCu);
    }

    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v10 = *(void **)(a1 + 40);
    if (v9)
    {
      v11 = objc_msgSend(v9, "integerValue");
      v12 = objc_msgSend(*(id *)(a1 + 40), "count");
      if (v11 >= v12)
        v13 = v12;
      else
        v13 = v11;
      v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subarrayWithRange:", 0, v13));
    }
    else
    {
      v14 = v10;
    }
    v15 = v14;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

- (void)_rehydrateEventBundles:(id)a3 withHandler:(id)a4
{
  id v5;
  NSMutableDictionary *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id os_log;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  MOPerformanceMeasurement *v26;
  void *v27;
  id v28;
  id v29;
  NSMutableArray *v30;
  id v31;
  MOPerformanceMeasurement *v32;
  id v33;
  id v34;
  NSMutableArray *v35;
  id obj;
  _QWORD v38[4];
  MOPerformanceMeasurement *v39;
  MOEventBundleManager *v40;
  id v41;
  NSMutableArray *v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  id v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];

  v5 = a3;
  v34 = a4;
  v35 = objc_opt_new(NSMutableArray);
  v33 = objc_msgSend(v5, "mutableCopy");
  v6 = objc_opt_new(NSMutableDictionary);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v50 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v13 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "events"));
          v22 = objc_msgSend(v21, "count");
          *(_DWORD *)buf = 134218242;
          v55 = v22;
          v56 = 2112;
          v57 = v11;
          _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "_rehydrateEventBundles, bundle.events, %lu, bundle, %@", buf, 0x16u);

        }
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "events"));
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v46;
          do
          {
            for (j = 0; j != v16; j = (char *)j + 1)
            {
              if (*(_QWORD *)v46 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)j);
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "eventIdentifier", v33));
              -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v19, v20);

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
          }
          while (v16);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    }
    while (v8);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v6, "allValues"));
  v24 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerFetchEventBundlesRehydrateEvents", ", buf, 2u);
  }

  v26 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("FetchEventBundlesRehydrateEvents"), 0);
  -[MOPerformanceMeasurement startSession](v26, "startSession");
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager eventManager](self, "eventManager"));
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = __59__MOEventBundleManager__rehydrateEventBundles_withHandler___block_invoke;
  v38[3] = &unk_1002B23E8;
  v39 = v26;
  v40 = self;
  v41 = obj;
  v42 = v35;
  v43 = v33;
  v44 = v34;
  v28 = v34;
  v29 = v33;
  v30 = v35;
  v31 = obj;
  v32 = v26;
  objc_msgSend(v27, "rehydrateEvents:withHandler:", v23, v38);

}

void __59__MOEventBundleManager__rehydrateEventBundles_withHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerFetchEventBundlesRehydrateEvents", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __59__MOEventBundleManager__rehydrateEventBundles_withHandler___block_invoke_504;
  block[3] = &unk_1002B23C0;
  v10 = *(void **)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 40);
  v15 = v10;
  v16 = v5;
  v17 = *(id *)(a1 + 56);
  v18 = *(id *)(a1 + 64);
  v11 = *(id *)(a1 + 72);
  v19 = v6;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v9, block);

}

void __59__MOEventBundleManager__rehydrateEventBundles_withHandler___block_invoke_504(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  dispatch_once_t *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  dispatch_once_t *v28;
  void *v29;
  MOAction *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  id v42;
  id v43;
  id v44;
  NSObject *v45;
  void *v46;
  id v47;
  id v48;
  NSObject *v49;
  uint64_t v50;
  MOPerformanceMeasurement *v51;
  id v52;
  unsigned __int8 v53;
  uint64_t v54;
  void *v55;
  MOAction *v56;
  void *v57;
  uint64_t v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  id v65;
  _BYTE v66[128];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerFetchEventBundlesRehydrateEventsPostProcessing", ", buf, 2u);
  }

  v51 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("FetchEventBundlesRehydrateEventsPostProcessing"), 0);
  -[MOPerformanceMeasurement startSession](v51, "startSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "configurationManager"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "configurationManager"));
    v6 = objc_msgSend(v5, "getBoolSettingForKey:withFallback:", CFSTR("EventBundleManagerOverrideEnableLifeEvent"), 1);

  }
  else
  {
    v6 = 1;
  }
  v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __59__MOEventBundleManager__rehydrateEventBundles_withHandler___block_invoke_504_cold_1();

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v9 = *(id *)(a1 + 40);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
  if (v10)
  {
    v11 = v10;
    v12 = &MOLogFacilityEventBundleManager;
    v13 = *(_QWORD *)v61;
    v58 = *(_QWORD *)v61;
    v54 = a1;
    v53 = v6;
    v52 = v9;
    do
    {
      v14 = 0;
      v59 = v11;
      do
      {
        if (*(_QWORD *)v61 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)v14);
        if (objc_msgSend(v15, "interfaceType") == (id)11)
        {
          v16 = _mo_log_facility_get_os_log(v12);
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v65 = v15;
            _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "eventBundle skips event rehydration, %@", buf, 0xCu);
          }
          goto LABEL_32;
        }
        if ((v6 & 1) == 0)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "action"));
          if (objc_msgSend(v18, "actionType") == (id)9)
          {

LABEL_20:
            v56 = [MOAction alloc];
            v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "action"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "actionName"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "action"));
            v23 = objc_msgSend(v22, "actionSubtype");
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "action"));
            objc_msgSend(v24, "actionNameConfidence");
            v26 = v25;
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "action"));
            v28 = v12;
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "actionMetaData"));
            v30 = -[MOAction initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:](v56, "initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:", v55, v21, 2, v23, v29, v26);
            objc_msgSend(v15, "setAction:", v30);

            v12 = v28;
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("category != %lu"), 22));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "events"));
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "filteredArrayUsingPredicate:", v31));
            objc_msgSend(v15, "setEvents:", v33);

            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "events"));
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "firstObject"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "eventIdentifier"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "action"));
            objc_msgSend(v37, "setSourceEventIdentifier:", v36);

            v38 = _mo_log_facility_get_os_log(v28);
            v39 = objc_claimAutoreleasedReturnValue(v38);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v65 = v15;
              _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "eventBundle skips life events (fetch), bundle, %@", buf, 0xCu);
            }

            a1 = v54;
            v6 = v53;
            v9 = v52;
            v13 = v58;
            goto LABEL_23;
          }
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "action"));
          v20 = objc_msgSend(v19, "actionType");

          if (v20 == (id)10)
            goto LABEL_20;
        }
LABEL_23:
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "findRehydrateEvents:forBundle:", *(_QWORD *)(a1 + 48), v15));
        v40 = _mo_log_facility_get_os_log(v12);
        v41 = objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          v42 = -[NSObject count](v17, "count");
          *(_DWORD *)buf = 134217984;
          v65 = v42;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "eventBundle with rehydrated events count: , %lu", buf, 0xCu);
        }

        if (-[NSObject count](v17, "count"))
        {
          v43 = objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:", v17);
          objc_msgSend(v15, "setEvents:", v43);

          v44 = _mo_log_facility_get_os_log(v12);
          v45 = objc_claimAutoreleasedReturnValue(v44);
          v11 = v59;
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "description"));
            *(_DWORD *)buf = 138412290;
            v65 = v46;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "eventBundle with rehydrated events: , %@", buf, 0xCu);

          }
          v13 = v58;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v15);
          v47 = _mo_log_facility_get_os_log(v12);
          v45 = objc_claimAutoreleasedReturnValue(v47);
          v11 = v59;
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v65 = v15;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "eventBundle is removed in the SPI output after rehydration failure, %@", buf, 0xCu);
          }
        }

LABEL_32:
        v14 = (char *)v14 + 1;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    }
    while (v11);
  }

  objc_msgSend(*(id *)(a1 + 64), "removeObjectsInArray:", *(_QWORD *)(a1 + 56));
  v48 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v49 = objc_claimAutoreleasedReturnValue(v48);
  if (os_signpost_enabled(v49))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v49, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerFetchEventBundlesRehydrateEventsPostProcessing", ", buf, 2u);
  }

  -[MOPerformanceMeasurement endSession](v51, "endSession");
  v50 = *(_QWORD *)(a1 + 80);
  if (v50)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v50 + 16))(v50, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

}

- (id)findRehydrateEvents:(id)a3 forBundle:(id)a4
{
  id v5;
  id v6;
  NSMutableSet *v7;
  NSMutableSet *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_new(NSMutableSet);
  v8 = objc_opt_new(NSMutableSet);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "events"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i), "eventIdentifier"));
        -[NSMutableSet addObject:](v8, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v11);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v15 = v5;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "eventIdentifier", (_QWORD)v26));
        v22 = -[NSMutableSet containsObject:](v8, "containsObject:", v21);

        if (v22)
          -[NSMutableSet addObject:](v7, "addObject:", v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v17);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v7, "allObjects"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v23));

  return v24;
}

- (void)cleanUpEventBundlesWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4
{
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  unint64_t v10;
  MOPerformanceMeasurement *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  MOPerformanceMeasurement *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  _QWORD v30[4];
  MOPerformanceMeasurement *v31;
  id v32;
  unint64_t v33;
  uint8_t buf[8];
  NSErrorUserInfoKey v35;
  const __CFString *v36;

  v6 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  v10 = a3 - 1;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventBundleManagerCleanUpEventBundlesWrapper", ", buf, 2u);
  }

  v11 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CleanUpEventBundlesWrapper"), 0);
  -[MOPerformanceMeasurement startSession](v11, "startSession");
  v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventBundleManagerCleanUpEventBundles", ", buf, 2u);
  }

  v15 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CleanUpEventBundles"), 0);
  -[MOPerformanceMeasurement startSession](v15, "startSession");
  v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = v17;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, a3, "EventBundleManagerCleanUpEventBundles", ", buf, 2u);
  }

  -[MOPerformanceMeasurement endSession](v15, "endSession");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager eventBundleStore](self, "eventBundleStore"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "persistenceManager"));
  v21 = objc_msgSend(v20, "availability");

  v22 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  v24 = v23;
  if (v21 == (id)2)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "purge eventBundles since datastore is available", buf, 2u);
    }

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = __73__MOEventBundleManager_cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke;
    v30[3] = &unk_1002B2410;
    v32 = v6;
    v33 = a3;
    v31 = v11;
    -[MOEventBundleManager _cleanUpEventBundlesWithRefreshVariant:andHandler:](self, "_cleanUpEventBundlesWithRefreshVariant:andHandler:", a3, v30);

  }
  else
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[MOEventBundleManager cleanUpEventBundlesWithRefreshVariant:andHandler:].cold.1();

    if (v6)
    {
      v35 = NSLocalizedDescriptionKey;
      v36 = CFSTR("[cleanUpEventBundlesWithRefreshVariant] database is not available");
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 16, v25));

      (*((void (**)(id, void *, void *))v6 + 2))(v6, v26, &__NSDictionary0__struct);
    }
    v27 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    v29 = v28;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_END, a3, "EventBundleManagerCleanUpEventBundlesWrapper", ", buf, 2u);
    }

    -[MOPerformanceMeasurement endSession](v11, "endSession");
  }

}

void __73__MOEventBundleManager_cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id os_log;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint8_t v12[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 48);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, v11, "EventBundleManagerCleanUpEventBundlesWrapper", ", v12, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
}

- (void)_cleanUpEventBundlesWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id os_log;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  MOPerformanceMeasurement *v12;
  MOEventBundleStore *eventBundleStore;
  MOPerformanceMeasurement *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  MOPerformanceMeasurement *v19;
  MOEventBundleStore *v20;
  MOPerformanceMeasurement *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  MOPerformanceMeasurement *v27;
  MOEventBundleStore *v28;
  MOPerformanceMeasurement *v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  MOPerformanceMeasurement *v34;
  void *v35;
  id v36;
  MOEventBundleStore *v37;
  MOPerformanceMeasurement *v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  NSObject *v42;
  MOPerformanceMeasurement *v43;
  MOEventBundleStore *v44;
  MOPerformanceMeasurement *v45;
  NSObject *v46;
  NSObject *v47;
  id v48;
  MOPerformanceMeasurement *v49;
  _QWORD block[4];
  id v51;
  _QWORD *v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD *v55;
  _QWORD *v56;
  _QWORD *v57;
  _QWORD *v58;
  _QWORD *v59;
  _QWORD *v60;
  _QWORD v61[4];
  MOPerformanceMeasurement *v62;
  NSObject *v63;
  _QWORD *v64;
  _QWORD *v65;
  unint64_t v66;
  _QWORD v67[4];
  MOPerformanceMeasurement *v68;
  NSObject *v69;
  _QWORD *v70;
  _QWORD *v71;
  unint64_t v72;
  _QWORD v73[4];
  MOPerformanceMeasurement *v74;
  NSObject *v75;
  _QWORD *v76;
  _QWORD *v77;
  unint64_t v78;
  _QWORD v79[4];
  MOPerformanceMeasurement *v80;
  NSObject *v81;
  _QWORD *v82;
  _QWORD *v83;
  unint64_t v84;
  _QWORD v85[4];
  MOPerformanceMeasurement *v86;
  NSObject *v87;
  _QWORD *v88;
  _QWORD *v89;
  unint64_t v90;
  uint8_t buf[8];
  _QWORD v92[5];
  id v93;
  _QWORD v94[5];
  id v95;
  _QWORD v96[5];
  id v97;
  _QWORD v98[5];
  id v99;
  _QWORD v100[5];
  id v101;
  _QWORD v102[5];
  id v103;
  _QWORD v104[5];
  id v105;
  _QWORD v106[5];
  id v107;
  _QWORD v108[5];
  id v109;
  _QWORD v110[5];
  id v111;
  _QWORD v112[5];
  id v113;

  v6 = a4;
  v7 = dispatch_group_create();
  v112[0] = 0;
  v112[1] = v112;
  v112[2] = 0x3032000000;
  v112[3] = __Block_byref_object_copy__19;
  v112[4] = __Block_byref_object_dispose__19;
  v113 = objc_alloc_init((Class)NSMutableDictionary);
  v110[0] = 0;
  v110[1] = v110;
  v110[2] = 0x3032000000;
  v110[3] = __Block_byref_object_copy__19;
  v110[4] = __Block_byref_object_dispose__19;
  v111 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
  v108[0] = 0;
  v108[1] = v108;
  v108[2] = 0x3032000000;
  v108[3] = __Block_byref_object_copy__19;
  v108[4] = __Block_byref_object_dispose__19;
  v109 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
  v106[0] = 0;
  v106[1] = v106;
  v106[2] = 0x3032000000;
  v106[3] = __Block_byref_object_copy__19;
  v106[4] = __Block_byref_object_dispose__19;
  v107 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
  v104[0] = 0;
  v104[1] = v104;
  v104[2] = 0x3032000000;
  v104[3] = __Block_byref_object_copy__19;
  v104[4] = __Block_byref_object_dispose__19;
  v105 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
  v102[0] = 0;
  v102[1] = v102;
  v102[2] = 0x3032000000;
  v102[3] = __Block_byref_object_copy__19;
  v102[4] = __Block_byref_object_dispose__19;
  v103 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
  v100[0] = 0;
  v100[1] = v100;
  v100[2] = 0x3032000000;
  v100[3] = __Block_byref_object_copy__19;
  v100[4] = __Block_byref_object_dispose__19;
  v101 = 0;
  v98[0] = 0;
  v98[1] = v98;
  v98[2] = 0x3032000000;
  v98[3] = __Block_byref_object_copy__19;
  v98[4] = __Block_byref_object_dispose__19;
  v99 = 0;
  v96[0] = 0;
  v96[1] = v96;
  v96[2] = 0x3032000000;
  v96[3] = __Block_byref_object_copy__19;
  v96[4] = __Block_byref_object_dispose__19;
  v97 = 0;
  v94[0] = 0;
  v94[1] = v94;
  v94[2] = 0x3032000000;
  v94[3] = __Block_byref_object_copy__19;
  v94[4] = __Block_byref_object_dispose__19;
  v95 = 0;
  v92[0] = 0;
  v92[1] = v92;
  v92[2] = 0x3032000000;
  v92[3] = __Block_byref_object_copy__19;
  v92[4] = __Block_byref_object_dispose__19;
  v93 = 0;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  v10 = v9;
  v11 = a3 - 1;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventBundleManagerCleanUpEventBundlesPurgeExpired", ", buf, 2u);
  }

  v12 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CleanUpEventBundlesPurgeExpired"), 0);
  -[MOPerformanceMeasurement startSession](v12, "startSession");
  dispatch_group_enter(v7);
  eventBundleStore = self->_eventBundleStore;
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472;
  v85[2] = __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke;
  v85[3] = &unk_1002B2438;
  v90 = a3;
  v14 = v12;
  v86 = v14;
  v88 = v100;
  v89 = v110;
  v15 = v7;
  v87 = v15;
  -[MOEventBundleStore purgeExpiredEventBundlesWithCompletionHandler:](eventBundleStore, "purgeExpiredEventBundlesWithCompletionHandler:", v85);
  v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = v17;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventBundleManagerCleanUpEventBundlesPurgeNoEvents", ", buf, 2u);
  }

  v19 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CleanUpEventBundlesPurgeNoEvents"), 0);
  -[MOPerformanceMeasurement startSession](v19, "startSession");
  dispatch_group_enter(v15);
  v20 = self->_eventBundleStore;
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_523;
  v79[3] = &unk_1002B2438;
  v84 = a3;
  v21 = v19;
  v80 = v21;
  v82 = v98;
  v83 = v108;
  v22 = v15;
  v81 = v22;
  -[MOEventBundleStore purgeEventBundlesWithNoEventsAssociatedWithCompletionHandler:](v20, "purgeEventBundlesWithNoEventsAssociatedWithCompletionHandler:", v79);
  v23 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  v25 = v24;
  v49 = v14;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventBundleManagerCleanUpEventBundlesPurgeInvalidEvergreeen", ", buf, 2u);
  }
  v26 = v6;

  v27 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CleanUpEventBundlesPurgeInvalidEvergreen"), 0);
  -[MOPerformanceMeasurement startSession](v27, "startSession");
  dispatch_group_enter(v22);
  v28 = self->_eventBundleStore;
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_526;
  v73[3] = &unk_1002B2438;
  v78 = a3;
  v29 = v27;
  v74 = v29;
  v76 = v96;
  v77 = v106;
  v30 = v22;
  v75 = v30;
  -[MOEventBundleStore purgeInvalidEvergreenBundlesWithCompletionHandler:](v28, "purgeInvalidEvergreenBundlesWithCompletionHandler:", v73);
  v31 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v32 = objc_claimAutoreleasedReturnValue(v31);
  v33 = v32;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventBundleManagerCleanUpEventBundlesPurgeRehydrationFailure", ", buf, 2u);
  }

  v34 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CleanUpEventBundlesPurgeRehydrationFailure"), 0);
  -[MOPerformanceMeasurement startSession](v34, "startSession");
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
  v36 = objc_msgSend(v35, "getIntegerSettingForKey:withFallback:", CFSTR("EventManagerOverrideEventsRehydrationFailureCountThreshold"), 10);

  dispatch_group_enter(v30);
  v37 = self->_eventBundleStore;
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_531;
  v67[3] = &unk_1002B2438;
  v72 = a3;
  v38 = v34;
  v68 = v38;
  v70 = v94;
  v71 = v104;
  v39 = v30;
  v69 = v39;
  -[MOEventBundleStore purgeEventBundlesWithRehydrationFailureCount:andHandler:](v37, "purgeEventBundlesWithRehydrationFailureCount:andHandler:", v36, v67);
  v40 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v41 = objc_claimAutoreleasedReturnValue(v40);
  v42 = v41;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v42, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventBundleManagerCleanUpEventBundlesPurgeDangling", ", buf, 2u);
  }

  v43 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CleanUpEventBundlesPurgeDangling"), 0);
  -[MOPerformanceMeasurement startSession](v43, "startSession");
  dispatch_group_enter(v39);
  v44 = self->_eventBundleStore;
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_534;
  v61[3] = &unk_1002B2438;
  v66 = a3;
  v45 = v43;
  v62 = v45;
  v64 = v92;
  v65 = v102;
  v46 = v39;
  v63 = v46;
  -[MOEventBundleStore purgeDanglingEventBundlesWithHandler:](v44, "purgeDanglingEventBundlesWithHandler:", v61);
  v47 = objc_claimAutoreleasedReturnValue(-[MOEventBundleManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_535;
  block[3] = &unk_1002B2460;
  v53 = v108;
  v54 = v104;
  v55 = v102;
  v56 = v112;
  v51 = v26;
  v52 = v110;
  v57 = v100;
  v58 = v98;
  v59 = v94;
  v60 = v92;
  v48 = v26;
  dispatch_group_notify(v46, v47, block);

  _Block_object_dispose(v92, 8);
  _Block_object_dispose(v94, 8);

  _Block_object_dispose(v96, 8);
  _Block_object_dispose(v98, 8);

  _Block_object_dispose(v100, 8);
  _Block_object_dispose(v102, 8);

  _Block_object_dispose(v104, 8);
  _Block_object_dispose(v106, 8);

  _Block_object_dispose(v108, 8);
  _Block_object_dispose(v110, 8);

  _Block_object_dispose(v112, 8);
}

void __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  unsigned int v20;
  _DWORD v21[2];

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 64);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v21[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "EventBundleManagerCleanUpEventBundlesPurgeExpired", ", (uint8_t *)v21, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  if (v5)
  {
    v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_cold_1();

    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = v5;
    v15 = *(NSObject **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v14;
  }
  else
  {
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfBundleEvents")));
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v15 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v20 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "intValue");
      v21[0] = 67109120;
      v21[1] = v20;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "purge expired event bundles succeeded, count %i", (uint8_t *)v21, 8u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_523(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  unsigned int v20;
  _DWORD v21[2];

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 64);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v21[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "EventBundleManagerCleanUpEventBundlesPurgeNoEvents", ", (uint8_t *)v21, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  if (v5)
  {
    v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_523_cold_1();

    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = v5;
    v15 = *(NSObject **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v14;
  }
  else
  {
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfBundleEvents")));
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v15 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v20 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "intValue");
      v21[0] = 67109120;
      v21[1] = v20;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "purge non-evergreen event bundles with no events succeeded, count %i", (uint8_t *)v21, 8u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_526(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  unsigned int v20;
  _DWORD v21[2];

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 64);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v21[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "EventBundleManagerCleanUpEventBundlesPurgeInvalidEvergreeen", ", (uint8_t *)v21, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  if (v5)
  {
    v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_526_cold_1();

    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = v5;
    v15 = *(NSObject **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v14;
  }
  else
  {
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfBundleEvents")));
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v15 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v20 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "intValue");
      v21[0] = 67109120;
      v21[1] = v20;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "purge evergreen event bundles with no events succeeded, count %i", (uint8_t *)v21, 8u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_531(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  unsigned int v20;
  _DWORD v21[2];

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 64);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v21[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "EventBundleManagerCleanUpEventBundlesPurgeRehydrationFailure", ", (uint8_t *)v21, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  if (v5)
  {
    v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_531_cold_1();

    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = v5;
    v15 = *(NSObject **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v14;
  }
  else
  {
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfBundleEvents")));
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v15 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v20 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "intValue");
      v21[0] = 67109120;
      v21[1] = v20;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "purge bundles with rehydration failures succeeded, count %d", (uint8_t *)v21, 8u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_534(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  unsigned int v20;
  _DWORD v21[2];

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 64);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v21[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "EventBundleManagerCleanUpEventBundlesPurgeDangling", ", (uint8_t *)v21, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  if (v5)
  {
    v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_534_cold_1();

    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = v5;
    v15 = *(NSObject **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v14;
  }
  else
  {
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfBundleEvents")));
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v15 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v20 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "intValue");
      v21[0] = 67109120;
      v21[1] = v20;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "purge dangling bundles succeeded, count %d", (uint8_t *)v21, 8u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_535(_QWORD *a1)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id os_log;
  NSObject *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  id v16;
  _DWORD v17[2];
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  int v25;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "intValue");
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "intValue") + v2;
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "intValue");
  v5 = v3 + v4 + objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "intValue");
  v6 = *(void **)(*(_QWORD *)(a1[9] + 8) + 40);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5));
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("resultNumberOfEvents"));

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "intValue");
    v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "intValue");
    v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "intValue");
    v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "intValue");
    v17[0] = 67110144;
    v17[1] = v10;
    v18 = 1024;
    v19 = v11;
    v20 = 1024;
    v21 = v12;
    v22 = 1024;
    v23 = v13;
    v24 = 1024;
    v25 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "clean up event bundles completed with %d+%d+%d+%d = total %d", (uint8_t *)v17, 0x20u);
  }

  v14 = a1[4];
  if (v14)
  {
    v15 = *(void **)(*(_QWORD *)(a1[10] + 8) + 40);
    if (v15)
      goto LABEL_10;
    v15 = *(void **)(*(_QWORD *)(a1[11] + 8) + 40);
    if (v15)
      goto LABEL_10;
    if (!*(_QWORD *)(*(_QWORD *)(a1[12] + 8) + 40) && !*(_QWORD *)(*(_QWORD *)(a1[13] + 8) + 40))
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v14 + 16))(v14, 0, *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40));
      return;
    }
    v15 = *(void **)(*(_QWORD *)(a1[12] + 8) + 40);
    if (v15 || (v15 = *(void **)(*(_QWORD *)(a1[13] + 8) + 40)) != 0)
LABEL_10:
      v16 = v15;
    else
      v16 = 0;
    (*(void (**)(void))(a1[4] + 16))();

  }
}

- (void)clearEventBundlesWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  id os_log;
  NSObject *v8;
  NSObject *v9;
  unint64_t v10;
  MOPerformanceMeasurement *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  MOPerformanceMeasurement *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  uint8_t v34[8];
  NSErrorUserInfoKey v35;
  const __CFString *v36;

  v6 = (void (**)(id, _QWORD, void *))a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  v10 = a3 - 1;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v34 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventBundleManagerClearEventBundlesWrapper", ", v34, 2u);
  }

  v11 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("ClearEventBundlesWrapper"), 0);
  -[MOPerformanceMeasurement startSession](v11, "startSession");
  if (a3 == 0xFFFF)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager fsmStore](self, "fsmStore"));
    objc_msgSend(v12, "removeAllFSMsWithCompletionHandler:", &__block_literal_global_539);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager eventBundleStore](self, "eventBundleStore"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "persistenceManager"));
  v15 = objc_msgSend(v14, "availability");

  v16 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = v17;
  if (v15 == (id)2)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "clear event bundles since datastore is available", v34, 2u);
    }

    v19 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = v20;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)v34 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventBundleManagerClearEventBundles", ", v34, 2u);
    }

    v22 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("ClearEventBundles"), 0);
    -[MOPerformanceMeasurement startSession](v22, "startSession");
    -[MOEventBundleManager _clearEventBundles](self, "_clearEventBundles");
    -[MOEventBundleManager _clearFSMs](self, "_clearFSMs");
    v23 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v25 = v24;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)v34 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_END, a3, "EventBundleManagerClearEventBundles", ", v34, 2u);
    }

    -[MOPerformanceMeasurement endSession](v22, "endSession");
    if (v6)
      v6[2](v6, 0, &__NSDictionary0__struct);
    v26 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    v28 = v27;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)v34 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, a3, "EventBundleManagerClearEventBundlesWrapper", ", v34, 2u);
    }

    -[MOPerformanceMeasurement endSession](v11, "endSession");
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MOEventBundleManager clearEventBundlesWithRefreshVariant:andHandler:].cold.1();

    if (v6)
    {
      v35 = NSLocalizedDescriptionKey;
      v36 = CFSTR("database is not available");
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 16, v29));

      ((void (**)(id, void *, void *))v6)[2](v6, v30, &__NSDictionary0__struct);
    }
    v31 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    v33 = v32;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)v34 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_END, a3, "EventBundleManagerClearEventBundlesWrapper", ", v34, 2u);
    }

    -[MOPerformanceMeasurement endSession](v11, "endSession");
  }

}

void __71__MOEventBundleManager_clearEventBundlesWithRefreshVariant_andHandler___block_invoke(id a1, NSError *a2)
{
  NSError *v2;
  id os_log;
  NSObject *v4;
  int v5;
  NSError *v6;

  v2 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v4 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "remove all FSM since the variant is reset, error, %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)_clearEventBundles
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager eventBundleStore](self, "eventBundleStore"));
  objc_msgSend(v2, "removeAllBundlesWithCompletionHandler:", &__block_literal_global_542);

}

void __42__MOEventBundleManager__clearEventBundles__block_invoke(id a1, NSError *a2)
{
  id os_log;
  NSObject *v3;
  uint8_t v4[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "cleared bundle db", v4, 2u);
  }

}

- (void)_clearFSMs
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager fsmStore](self, "fsmStore"));
  objc_msgSend(v2, "removeAllFSMsWithCompletionHandler:", &__block_literal_global_543);

}

void __34__MOEventBundleManager__clearFSMs__block_invoke(id a1, NSError *a2)
{
  id os_log;
  NSObject *v3;
  uint8_t v4[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "cleared FMS db", v4, 2u);
  }

}

- (BOOL)isDataDumpEnabledForTrigger:(unint64_t)a3
{
  unsigned int v5;
  _BOOL4 v6;

  v5 = -[MOConfigurationManagerBase getBoolSettingForKey:withFallback:](self->_configurationManager, "getBoolSettingForKey:withFallback:", CFSTR("BundlingDataCollectionEnabled"), 0);
  if (-[MOConfigurationManagerBase getBoolSettingForKey:withFallback:](self->_configurationManager, "getBoolSettingForKey:withFallback:", CFSTR("BundlingDataUploadEnabled"), 0))
  {
    if (a3 - 1 >= 5)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (!v5)
  {
    if (a3 == 3)
    {
LABEL_8:
      LOBYTE(v6) = 1;
      return v6;
    }
LABEL_9:
    LOBYTE(v6) = 0;
    return v6;
  }
  if (a3 >= 5)
    goto LABEL_9;
  return (0x1Au >> a3) & 1;
}

- (void)captureCurrentDBStateForTrigger:(unint64_t)a3 withFeedback:(id)a4 additionalMetadata:(id)a5 shouldUpload:(BOOL)a6 andHandler:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  unsigned int v15;
  id os_log;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  const __CFString *v21;
  void *v22;

  v8 = a6;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = -[MOEventBundleManager isDataDumpEnabledForTrigger:](self, "isDataDumpEnabledForTrigger:", a3);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v17 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[MOEventBundleManager captureCurrentDBStateForTrigger:withFeedback:additionalMetadata:shouldUpload:andHandler:].cold.1();

  if (v15)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __112__MOEventBundleManager_captureCurrentDBStateForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke;
    v19[3] = &unk_1002ADA40;
    v20 = v14;
    -[MOEventBundleManager fetchAndSaveBundlingDataForTrigger:withFeedback:additionalMetadata:shouldUpload:andHandler:](self, "fetchAndSaveBundlingDataForTrigger:withFeedback:additionalMetadata:shouldUpload:andHandler:", a3, v12, v13, v8, v19);
    v18 = v20;
LABEL_7:

    goto LABEL_8;
  }
  if (v14)
  {
    v21 = CFSTR("kMODataDumpEnabled");
    v22 = &__kCFBooleanFalse;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    (*((void (**)(id, _QWORD, void *))v14 + 2))(v14, 0, v18);
    goto LABEL_7;
  }
LABEL_8:

}

void __112__MOEventBundleManager_captureCurrentDBStateForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  if (*(_QWORD *)(a1 + 32))
  {
    v5 = a2;
    v6 = objc_msgSend(a3, "mutableCopy");
    objc_msgSend(v6, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("kMODataDumpEnabled"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (id)_getMetadataForTrigger:(unint64_t)a3
{
  id os_log;
  NSObject *v6;
  MOPerformanceMeasurement *v7;
  NSMutableDictionary *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t v31[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)v31 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerGetMetadata", ", v31, 2u);
  }

  v7 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("GetMetadata"), 0);
  -[MOPerformanceMeasurement startSession](v7, "startSession");
  v8 = objc_opt_new(NSMutableDictionary);
  v9 = objc_autoreleasePoolPush();
  v10 = objc_claimAutoreleasedReturnValue(-[MOEventBundleManager getAllowedToPromptConfiguration](self, "getAllowedToPromptConfiguration"));
  v11 = (void *)v10;
  if (v10)
    v12 = (void *)v10;
  else
    v12 = &__NSDictionary0__struct;
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v12, CFSTR("kMODataPermissions"));
  v13 = objc_claimAutoreleasedReturnValue(+[MOPlatformInfo extractHardwareAndSoftwareMetadata](MOPlatformInfo, "extractHardwareAndSoftwareMetadata"));
  v14 = (void *)v13;
  if (v13)
    v15 = (void *)v13;
  else
    v15 = &__NSDictionary0__struct;
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v15, CFSTR("kMODeviceMetadata"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v16, "timeIntervalSinceReferenceDate");
  v18 = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v18));
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v19, CFSTR("kMODataDumpTimestamp"));

  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", &off_1002DD078, CFSTR("kMOBundlingCollectionVersionNumber"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v20, CFSTR("kMODataDumpTrigger"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
  v22 = objc_msgSend(v21, "getIntegerSettingForKey:withFallback:", CFSTR("OnboardingStatus"), 0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v22));
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v23, CFSTR("kMODataOnboardingStatus"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager defaultManager](self, "defaultManager"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", CFSTR("OnboardingDate")));

  if (v25)
  {
    objc_msgSend(v25, "timeIntervalSinceReferenceDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v26, CFSTR("kMODataOnboardingDate"));

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOEventBundleManager persistBundlingDataWithoutRandomization](self, "persistBundlingDataWithoutRandomization")));
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v27, CFSTR("kMODataWithoutRandomization"));

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager defaultManager](self, "defaultManager"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyWithoutLog:", CFSTR("MODataServerUploaderSubjectUUID")));

  if (v29)
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v29, CFSTR("kMOSubjectUUID"));

  objc_autoreleasePoolPop(v9);
  return v8;
}

- (void)fetchAndSaveBundlingDataForTrigger:(unint64_t)a3 withFeedback:(id)a4 additionalMetadata:(id)a5 shouldUpload:(BOOL)a6 andHandler:(id)a7
{
  id v10;
  id v11;
  id os_log;
  NSObject *v13;
  MOPerformanceMeasurement *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  id v26;
  void *v27;
  NSObject *v28;
  MOPerformanceMeasurement *v29;
  id v30;
  id v31;
  id v33;
  _QWORD v35[5];
  MOPerformanceMeasurement *v36;
  id v37;
  BOOL v38;
  _QWORD v39[5];
  id v40;
  id v41;
  NSObject *v42;
  unint64_t v43;
  _QWORD block[5];
  id v45;
  NSObject *v46;
  uint8_t buf[16];

  v10 = a4;
  v11 = a5;
  v33 = a7;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v13 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerCaptureCurrentDB", ", buf, 2u);
  }

  v14 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CaptureCurrentDB"), 0);
  -[MOPerformanceMeasurement startSession](v14, "startSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager configurationManager](self, "configurationManager"));
  v16 = objc_msgSend(v15, "getIntegerSettingForKey:withFallback:", CFSTR("EventBundleManagerOverrideRefreshDataExportMaxLookBackWindowSecs"), 2419200);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dateByAddingTimeInterval:", (double)-v16));
  v19 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v18, v17);
  v20 = dispatch_group_create();
  -[MOEventBundleManager beginDataExport](self, "beginDataExport");
  dispatch_group_enter(v20);
  v21 = objc_claimAutoreleasedReturnValue(-[MOEventBundleManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke;
  block[3] = &unk_1002B17D8;
  block[4] = self;
  v45 = v19;
  v22 = v20;
  v46 = v22;
  v31 = v19;
  dispatch_async(v21, block);

  dispatch_group_enter(v22);
  v23 = objc_claimAutoreleasedReturnValue(-[MOEventBundleManager queue](self, "queue"));
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_5;
  v39[3] = &unk_1002B2588;
  v42 = v22;
  v43 = a3;
  v39[4] = self;
  v40 = v11;
  v41 = v10;
  v24 = v22;
  v25 = v10;
  v26 = v11;
  dispatch_async(v23, v39);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleManager eventBundleRanking](self, "eventBundleRanking"));
  -[MOEventBundleManager persistRankingModel:](self, "persistRankingModel:", v27);

  v28 = objc_claimAutoreleasedReturnValue(-[MOEventBundleManager queue](self, "queue"));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_572;
  v35[3] = &unk_1002B25D8;
  v38 = a6;
  v36 = v14;
  v37 = v33;
  v35[4] = self;
  v29 = v14;
  v30 = v33;
  dispatch_group_notify(v24, v28, v35);

}

void __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_2;
  v4[3] = &unk_1002B2510;
  v4[4] = v3;
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "fetchAndPersistEventsForTimeInterval:withHandler:", v5, v4);

}

void __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventManager"));
  objc_msgSend(v6, "clearCache");

  if (a2)
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_3;
    v9[3] = &unk_1002B24E8;
    v8 = *(void **)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v8;
    v11 = v5;
    v12 = *(id *)(a1 + 48);
    dispatch_async(v7, v9);

  }
}

void __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_4;
  v4[3] = &unk_1002AD8A8;
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v1, "fetchAndPersistBundlesForTimeInterval:eventsIdsToDrop:withHandler:", v2, v3, v4);

}

void __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_5(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  MOPerformanceMeasurement *v4;
  void *v5;
  id v6;
  uint64_t v7;
  MOPerformanceMeasurement *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  MOPerformanceMeasurement *v13;
  id v14;
  _QWORD *v15;
  uint8_t buf[16];
  _QWORD v17[5];
  id v18;

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__19;
  v17[4] = __Block_byref_object_dispose__19;
  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_getMetadataForTrigger:", *(_QWORD *)(a1 + 64)));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerCaptureCurrentDBFetchBundleTypeDistribution", ", buf, 2u);
  }

  v4 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CaptureCurrentDBFetchBundleTypeDistribution"), 0);
  -[MOPerformanceMeasurement startSession](v4, "startSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventBundleStore"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_566;
  v9[3] = &unk_1002B2560;
  v15 = v17;
  v10 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v8 = v4;
  v13 = v8;
  v14 = *(id *)(a1 + 56);
  objc_msgSend(v5, "fetchBundleTypeDistributionFromStoreWithHandler:", v9);

  _Block_object_dispose(v17, 8);
}

void __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_566(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id os_log;
  NSObject *v8;
  uint8_t v9[16];
  _QWORD v10[4];
  __CFString *v11;
  uint64_t v12;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_2_569;
  v10[3] = &unk_1002B2538;
  v3 = *(_QWORD *)(a1 + 72);
  v11 = CFSTR("BundleInterfaceTypeCount");
  v12 = v3;
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v10);
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addEntriesFromDictionary:");
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setObject:forKey:", v4, CFSTR("kMOBundleFeedback"));
  objc_msgSend(*(id *)(a1 + 48), "persistMetadata:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerCaptureCurrentDBFetchBundleTypeDistribution", ", v9, 2u);
  }

  objc_msgSend(*(id *)(a1 + 56), "endSession");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

void __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_2_569(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "stringValue"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", v7));

  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));

  objc_msgSend(v8, "setObject:forKey:", v9, v10);
}

void __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_572(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(unsigned __int8 *)(a1 + 56);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_2_573;
  v4[3] = &unk_1002B25B0;
  v6 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "finalizeDataExportWithUpload:handler:", v3, v4);

}

void __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_2_573(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_2_573_cold_1();
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "JSON data dump complete.", buf, 2u);
  }

  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  v11 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerCaptureCurrentDB", ", v13, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
}

- (void)_generateClusterAndAnomalyBundlesWithHandler:(id)a3
{
  id v4;
  id os_log;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  MOEventBundleFetchOptions *v10;
  id v11;
  NSObject *v12;
  MOPerformanceMeasurement *v13;
  id v14;
  MOPerformanceMeasurement *v15;
  _QWORD v16[4];
  MOPerformanceMeasurement *v17;
  MOEventBundleManager *v18;
  id v19;
  uint8_t buf[16];

  v4 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Start bundle clustering", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingTimeInterval:", -2419200.0));
  v9 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v8, v7);
  v10 = -[MOEventBundleFetchOptions initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:]([MOEventBundleFetchOptions alloc], "initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:", v9, 1, 0, 0, 0);
  v11 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerGenerateClusterAndAnomalyBundlesFetchBundles", ", buf, 2u);
  }

  v13 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("GenerateClusterBundlesFetchBundles"), 0);
  -[MOPerformanceMeasurement startSession](v13, "startSession");
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke;
  v16[3] = &unk_1002B26A0;
  v18 = self;
  v19 = v4;
  v17 = v13;
  v14 = v4;
  v15 = v13;
  -[MOEventBundleManager fetchEventBundlesWithOptions:CompletionHandler:](self, "fetchEventBundlesWithOptions:CompletionHandler:", v10, v16);

}

void __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id os_log;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  void (**v27)(id, _QWORD, void *);
  _QWORD *v28;
  _QWORD *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  id v35;
  void *v36;
  void *v37;
  unsigned int v38;
  id v39;
  NSObject *v40;
  _BOOL4 v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  NSObject *v47;
  id v48;
  void (**v49)(id, _QWORD, void *);
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[5];
  id v54;
  id v55;
  id v56;
  _QWORD v57[4];
  _QWORD v58[4];
  _QWORD v59[4];
  _QWORD v60[4];
  uint8_t buf[4];
  id v62;
  __int16 v63;
  id v64;
  _QWORD v65[4];
  _QWORD v66[4];
  _QWORD v67[2];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerGenerateClusterAndAnomalyBundlesFetchBundles", ", buf, 2u);
  }

  objc_msgSend(a1[4], "endSession");
  v12 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (!v8)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_cold_2(v7, v14);

    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1002D9020, &off_1002D9038, &off_1002D9050, &off_1002D8FD8, 0));
    v15 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bundleSuperType in %@"), v52));
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isAggregatedAndSuppressed == NO AND summarizationGranularity != %lu"), 2));
    v51 = (void *)v15;
    v67[0] = v15;
    v67[1] = v50;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v67, 2));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v16));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filteredArrayUsingPredicate:", v17));
    v19 = objc_msgSend(v18, "count");
    v20 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_cold_1();

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "bundleClusteringManager"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "getClusteringParams"));

    if ((unint64_t)objc_msgSend(v18, "count") < 0x1F5)
    {
      if (v23)
      {
        v30 = objc_msgSend(v18, "count");
        if (v30 > objc_msgSend(v23, "minClusterSize"))
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "bundleClusteringManager"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "getEmbeddingsFromBundles:forEmbeddingType:", v18, 1));

          v33 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v34 = objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            v35 = objc_msgSend(v32, "count");
            *(_DWORD *)buf = 134217984;
            v62 = v35;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Embedding extraction completed. embedding count=%lu. Attempting to run clustering alg", buf, 0xCu);
          }

          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "bundleClusteringManager"));
          objc_msgSend(v36, "runHDBSCANClusteringOn:", v32);

          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "bundleClusteringManager"));
          v38 = objc_msgSend(v37, "isClusteringResultValid");

          v39 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v40 = objc_claimAutoreleasedReturnValue(v39);
          v41 = os_log_type_enabled(v40, OS_LOG_TYPE_INFO);
          if (v38)
          {
            if (v41)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Valid cluster labels were generated. Attempting to generate cluster bundles and annotate anomaly bundles", buf, 2u);
            }

            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "bundleClusteringManager"));
            v53[0] = _NSConcreteStackBlock;
            v53[1] = 3221225472;
            v53[2] = __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_584;
            v53[3] = &unk_1002B2678;
            v43 = a1[6];
            v44 = a1[5];
            v56 = v43;
            v53[4] = v44;
            v54 = v18;
            v55 = v32;
            objc_msgSend(v42, "annotateAnomalyBundles:withEmbeddings:handler:", v54, v55, v53);

            v45 = v56;
          }
          else
          {
            if (v41)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Cluster labels are invalid: It is either not generated from HDBSCAN or all the inputs are clustered into one group. Skipping cluster & anomaly bundle generation", buf, 2u);
            }

            v49 = (void (**)(id, _QWORD, void *))a1[6];
            v57[0] = CFSTR("resultClusterBundleGenerationSuccess");
            v57[1] = CFSTR("resultNumberOfClusterBundles");
            v58[0] = &off_1002D8F90;
            v58[1] = &off_1002D8F90;
            v57[2] = CFSTR("resultOutlierBundleGenerationSuccess");
            v57[3] = CFSTR("resultNumberOfOutlierBundles");
            v58[2] = &off_1002D8F90;
            v58[3] = &off_1002D8F90;
            v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v58, v57, 4));
            v49[2](v49, 0, v45);
          }

          goto LABEL_27;
        }
      }
      v46 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v47 = objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        v48 = objc_msgSend(v23, "minClusterSize");
        *(_DWORD *)buf = 134218240;
        v62 = v19;
        v63 = 2048;
        v64 = v48;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "[GenerateClusterBundles] Clustering params are not set or Filtered bundle count (%lu) is less than minClusterSize (%lu). Skip clustering", buf, 0x16u);
      }

      v27 = (void (**)(id, _QWORD, void *))a1[6];
      v59[0] = CFSTR("resultClusterBundleGenerationSuccess");
      v59[1] = CFSTR("resultNumberOfClusterBundles");
      v60[0] = &off_1002D8F90;
      v60[1] = &off_1002D8F90;
      v59[2] = CFSTR("resultOutlierBundleGenerationSuccess");
      v59[3] = CFSTR("resultNumberOfOutlierBundles");
      v60[2] = &off_1002D8F90;
      v60[3] = &off_1002D8F90;
      v28 = v60;
      v29 = v59;
    }
    else
    {
      v24 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = objc_msgSend(v18, "count");
        *(_DWORD *)buf = 134218240;
        v62 = v26;
        v63 = 1024;
        LODWORD(v64) = 500;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "[GenerateClusterBundles] Clustering input count (%lu) is more than max limit (%u). Skip clustering", buf, 0x12u);
      }

      v27 = (void (**)(id, _QWORD, void *))a1[6];
      v65[0] = CFSTR("resultClusterBundleGenerationSuccess");
      v65[1] = CFSTR("resultNumberOfClusterBundles");
      v66[0] = &off_1002D8F90;
      v66[1] = &off_1002D8F90;
      v65[2] = CFSTR("resultOutlierBundleGenerationSuccess");
      v65[3] = CFSTR("resultNumberOfOutlierBundles");
      v66[2] = &off_1002D8F90;
      v66[3] = &off_1002D8F90;
      v28 = v66;
      v29 = v65;
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v29, 4));
    v27[2](v27, 0, v32);
LABEL_27:

    goto LABEL_28;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_cold_3();

  (*((void (**)(void))a1[6] + 2))();
LABEL_28:

}

void __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_584(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  _QWORD v24[4];
  uint8_t buf[4];
  id v26;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v26 = objc_msgSend(v5, "count");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Annotated %lu bundles as anomaly", buf, 0xCu);
  }

  if (v6)
  {
    v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Error while annotating anomaly bundles, error, %@", buf, 0xCu);
    }

    v11 = *(_QWORD *)(a1 + 56);
    v23[0] = CFSTR("resultClusterBundleGenerationSuccess");
    v23[1] = CFSTR("resultNumberOfClusterBundles");
    v24[0] = &off_1002D8F90;
    v24[1] = &off_1002D8F90;
    v23[2] = CFSTR("resultOutlierBundleGenerationSuccess");
    v23[3] = CFSTR("resultNumberOfOutlierBundles");
    v24[2] = &off_1002D8F90;
    v24[3] = &off_1002D8F90;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 4));
    (*(void (**)(uint64_t, id, void *))(v11 + 16))(v11, v6, v12);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventBundleStore"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_585;
    v17[3] = &unk_1002B2650;
    v22 = *(id *)(a1 + 56);
    v14 = v5;
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(a1 + 40);
    v18 = v14;
    v19 = v15;
    v20 = v16;
    v21 = *(id *)(a1 + 48);
    objc_msgSend(v13, "updateEventBundles:CompletionHandler:", v14, v17);

    v12 = v22;
  }

}

void __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_585(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  NSMutableDictionary *v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  _QWORD v23[4];
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412546;
      v25 = v6;
      v26 = 2112;
      v27 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Error while updating annotated anomaly bundles, result, %@, error, %@", buf, 0x16u);
    }

    v10 = *(_QWORD *)(a1 + 64);
    v22[0] = CFSTR("resultClusterBundleGenerationSuccess");
    v22[1] = CFSTR("resultNumberOfClusterBundles");
    v23[0] = &off_1002D8F90;
    v23[1] = &off_1002D8F90;
    v22[2] = CFSTR("resultOutlierBundleGenerationSuccess");
    v22[3] = CFSTR("resultNumberOfOutlierBundles");
    v23[2] = &off_1002D8F90;
    v23[3] = &off_1002D8F90;
    v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 4));
    (*(void (**)(uint64_t, id, NSMutableDictionary *))(v10 + 16))(v10, v5, v11);
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412546;
      v25 = v6;
      v26 = 2112;
      v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Annomaly bundles are annotated and saved. result, %@, error, %@", buf, 0x16u);
    }

    v12 = objc_opt_new(NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", &off_1002D9110, CFSTR("resultOutlierBundleGenerationSuccess"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v13, CFSTR("resultNumberOfOutlierBundles"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "bundleClusteringManager"));
    v15 = *(_QWORD *)(a1 + 48);
    v16 = *(_QWORD *)(a1 + 56);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_587;
    v18[3] = &unk_1002B2628;
    v19 = v12;
    v17 = *(id *)(a1 + 64);
    v20 = *(_QWORD *)(a1 + 40);
    v21 = v17;
    v11 = v12;
    objc_msgSend(v14, "generateClusterBundles:withEmbeddings:handler:", v15, v16, v18);

  }
}

void __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_587(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  MOEventBundleFetchOptions *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  void (**v16)(id, _QWORD, void *);
  void *v17;
  id v18;
  id v19;
  int8x16_t v20;
  _QWORD v21[4];
  int8x16_t v22;
  id v23;
  id v24;
  _QWORD v25[4];
  _QWORD v26[4];
  uint8_t buf[4];
  id v28;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      v28 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Error while generating cluster bundles %@", buf, 0xCu);
    }

    objc_msgSend(a1[4], "setObject:forKeyedSubscript:", &off_1002D8F90, CFSTR("resultClusterBundleGenerationSuccess"));
    objc_msgSend(a1[4], "setObject:forKeyedSubscript:", &off_1002D8F90, CFSTR("resultNumberOfClusterBundles"));
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 134217984;
      v28 = objc_msgSend(v5, "count");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Generated %lu cluster bundles", buf, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count")));
    objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v10, CFSTR("resultNumberOfClusterBundles"));

    if (objc_msgSend(v5, "count"))
    {
      v11 = -[MOEventBundleFetchOptions initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:interfaceType:]([MOEventBundleFetchOptions alloc], "initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:interfaceType:", 0, 1, 0, 1, 1, 15);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "eventBundleStore"));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_588;
      v21[3] = &unk_1002AEC40;
      v20 = *((int8x16_t *)a1 + 2);
      v13 = (id)v20.i64[0];
      v22 = vextq_s8(v20, v20, 8uLL);
      v24 = a1[6];
      v23 = v5;
      objc_msgSend(v12, "fetchEventBundleWithOptions:CompletionHandler:", v11, v21);

    }
    else
    {
      v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] cluster bundle count is zero.", buf, 2u);
      }

      v16 = (void (**)(id, _QWORD, void *))a1[6];
      v25[0] = CFSTR("resultClusterBundleGenerationSuccess");
      v25[1] = CFSTR("resultNumberOfClusterBundles");
      v26[0] = &off_1002D8F90;
      v26[1] = &off_1002D8F90;
      v25[2] = CFSTR("resultOutlierBundleGenerationSuccess");
      v25[3] = CFSTR("resultNumberOfOutlierBundles");
      v26[2] = &off_1002D8F90;
      v26[3] = &off_1002D8F90;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 4));
      v16[2](v16, 0, v17);

      v18 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v11 = (MOEventBundleFetchOptions *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_INFO))
      {
        v19 = a1[4];
        *(_DWORD *)buf = 138412290;
        v28 = v19;
        _os_log_impl((void *)&_mh_execute_header, &v11->super, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Process completed. Result:%@", buf, 0xCu);
      }
    }

  }
}

void __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_588(id *a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  id v6;
  NSObject *v7;
  MOPerformanceMeasurement *v8;
  void *v9;
  id *v10;
  id *v11;
  id *v12;
  id v13;
  id v14;
  id *v15;
  MOPerformanceMeasurement *v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  MOPerformanceMeasurement *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  MOPerformanceMeasurement *v27;
  _QWORD v28[2];
  id v29;
  id v30;
  _QWORD v31[4];
  MOPerformanceMeasurement *v32;
  _QWORD v33[2];
  id v34;
  id v35;
  uint8_t buf[16];

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_588_cold_1(v3, v5);

  if (objc_msgSend(v3, "count"))
  {
    v6 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerGenerateClusterAndAnomalyBundlesRemoveExistingClusterBundles", ", buf, 2u);
    }

    v8 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("GenerateClusterBundlesRemoveEventBundles"), 0);
    -[MOPerformanceMeasurement startSession](v8, "startSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "eventBundleStore"));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_591;
    v31[3] = &unk_1002B2600;
    v10 = (id *)&v32;
    v32 = v8;
    v11 = (id *)v33;
    v33[0] = a1[5];
    v12 = &v35;
    v13 = a1[7];
    v14 = a1[4];
    v35 = v13;
    v33[1] = v14;
    v15 = &v34;
    v34 = a1[6];
    v16 = v8;
    objc_msgSend(v9, "removeEventBundles:CompletionHandler:", v3, v31);

  }
  else
  {
    v17 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] no existing bundles in current DB. saving new cluster bundles", buf, 2u);
    }

    v19 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerGenerateClusterAndAnomalyBundlesSaveClusterBundles", ", buf, 2u);
    }

    v21 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("GenerateClusterBundlesSaveEventBundles"), 0);
    -[MOPerformanceMeasurement startSession](v21, "startSession");
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_600;
    v26[3] = &unk_1002B2600;
    v10 = (id *)&v27;
    v27 = v21;
    v11 = (id *)v28;
    v22 = a1[4];
    v23 = a1[6];
    v28[0] = a1[5];
    v12 = &v30;
    v24 = a1[7];
    v25 = a1[4];
    v30 = v24;
    v28[1] = v25;
    v15 = &v29;
    v29 = a1[6];
    v16 = v21;
    objc_msgSend(v22, "saveEventBundles:handler:", v23, v26);
  }

}

void __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_591(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  MOPerformanceMeasurement *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  MOPerformanceMeasurement *v19;
  _QWORD v20[4];
  MOPerformanceMeasurement *v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerGenerateClusterAndAnomalyBundlesRemoveExistingClusterBundles", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412546;
      v27 = v6;
      v28 = 2112;
      v29 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Error while removing existing cluster bundles. result, %@ error, %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", &off_1002D8F90, CFSTR("resultClusterBundleGenerationSuccess"));
    objc_msgSend(*(id *)(a1 + 40), "addEntriesFromDictionary:", v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      v27 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Removed existing cluster bundles. Result, %@", buf, 0xCu);
    }

    v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerGenerateClusterAndAnomalyBundlesPurgeExistingClusterBundles", ", buf, 2u);
    }

    v14 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("GenerateClusterBundlesPurgeEventBundles"), 0);
    -[MOPerformanceMeasurement startSession](v14, "startSession");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "eventBundleStore"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_594;
    v20[3] = &unk_1002B2600;
    v21 = v14;
    v22 = *(id *)(a1 + 40);
    v16 = *(id *)(a1 + 64);
    v17 = *(_QWORD *)(a1 + 48);
    v18 = *(void **)(a1 + 56);
    v25 = v16;
    v23 = v17;
    v24 = v18;
    v19 = v14;
    objc_msgSend(v15, "purgeDeletedEventBundlesWithCompletionHandler:", v20);

  }
}

void __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_594(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  MOPerformanceMeasurement *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  MOPerformanceMeasurement *v20;
  _QWORD v21[4];
  MOPerformanceMeasurement *v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerGenerateClusterAndAnomalyBundlesPurgeExistingClusterBundles", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412546;
      v28 = v6;
      v29 = 2112;
      v30 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Error while purging existing cluster bundles. result, %@ error, %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", &off_1002D8F90, CFSTR("resultClusterBundleGenerationSuccess"));
    objc_msgSend(*(id *)(a1 + 40), "addEntriesFromDictionary:", v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      v28 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Purged existing cluster bundles. Result, %@", buf, 0xCu);
    }

    v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerGenerateClusterAndAnomalyBundlesSaveClusterBundles", ", buf, 2u);
    }

    v14 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("GenerateClusterBundlesSaveEventBundles"), 0);
    -[MOPerformanceMeasurement startSession](v14, "startSession");
    v16 = *(void **)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 56);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_597;
    v21[3] = &unk_1002B2600;
    v22 = v14;
    v23 = *(id *)(a1 + 40);
    v17 = *(id *)(a1 + 64);
    v18 = *(_QWORD *)(a1 + 48);
    v19 = *(void **)(a1 + 56);
    v26 = v17;
    v24 = v18;
    v25 = v19;
    v20 = v14;
    objc_msgSend(v16, "saveEventBundles:handler:", v15, v21);

  }
}

void __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_597(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  MOPerformanceMeasurement *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  int v27;
  id v28;
  __int16 v29;
  id v30;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v8))
  {
    LOWORD(v27) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerGenerateClusterAndAnomalyBundlesSaveClusterBundles", ", (uint8_t *)&v27, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v11)
    {
      v27 = 138412546;
      v28 = v6;
      v29 = 2112;
      v30 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Error while saving cluster bundles, result, %@, error, %@", (uint8_t *)&v27, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", &off_1002D8F90, CFSTR("resultClusterBundleGenerationSuccess"));
    objc_msgSend(*(id *)(a1 + 40), "addEntriesFromDictionary:", v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    if (v11)
    {
      v27 = 138412546;
      v28 = v6;
      v29 = 2112;
      v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Cluster bundle saved. result, %@, error, %@", (uint8_t *)&v27, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", &off_1002D9110, CFSTR("resultClusterBundleGenerationSuccess"));
    v12 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = *(void **)(a1 + 40);
      v27 = 138412290;
      v28 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Process completed. Result: %@", (uint8_t *)&v27, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v15 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_signpost_enabled(v16))
    {
      LOWORD(v27) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerGenerateClusterAndAnomalyBundlesSubmitClusterBundleAnalytics", ", (uint8_t *)&v27, 2u);
    }

    v17 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("GenerateClusterBundlesSubmitClusterBundleAnalytics"), 0);
    -[MOPerformanceMeasurement startSession](v17, "startSession");
    v18 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LOWORD(v27) = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Biome donation for cluster bundles", (uint8_t *)&v27, 2u);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "onboardingAndSettingsPersistence"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "getSnapshotDictionaryForAnalytics"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "biomeManager"));
    objc_msgSend(v22, "donateEvents:andBundles:andOnboardingStatus:", 0, *(_QWORD *)(a1 + 56), v21);

    v23 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      LOWORD(v27) = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "finished biome donation for cluster bundles.", (uint8_t *)&v27, 2u);
    }

    v25 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_signpost_enabled(v26))
    {
      LOWORD(v27) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerGenerateClusterAndAnomalyBundlesSubmitClusterBundleAnalytics", ", (uint8_t *)&v27, 2u);
    }

    -[MOPerformanceMeasurement endSession](v17, "endSession");
  }

}

void __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_600(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  MOPerformanceMeasurement *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  int v27;
  id v28;
  __int16 v29;
  id v30;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v8))
  {
    LOWORD(v27) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerGenerateClusterAndAnomalyBundlesSaveClusterBundles", ", (uint8_t *)&v27, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
  v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v11)
    {
      v27 = 138412546;
      v28 = v6;
      v29 = 2112;
      v30 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Error while saving cluster bundles, result, %@, error, %@", (uint8_t *)&v27, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", &off_1002D8F90, CFSTR("resultClusterBundleGenerationSuccess"));
    objc_msgSend(*(id *)(a1 + 40), "addEntriesFromDictionary:", v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    if (v11)
    {
      v27 = 138412546;
      v28 = v6;
      v29 = 2112;
      v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Cluster bundle saved. result, %@, error, %@", (uint8_t *)&v27, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", &off_1002D9110, CFSTR("resultClusterBundleGenerationSuccess"));
    v12 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = *(void **)(a1 + 40);
      v27 = 138412290;
      v28 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Process completed. Result:%@", (uint8_t *)&v27, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v15 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_signpost_enabled(v16))
    {
      LOWORD(v27) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerGenerateClusterAndAnomalyBundlesSubmitClusterBundleAnalytics", ", (uint8_t *)&v27, 2u);
    }

    v17 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("GenerateClusterBundlesSubmitClusterBundleAnalytics"), 0);
    -[MOPerformanceMeasurement startSession](v17, "startSession");
    v18 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LOWORD(v27) = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Biome donation for cluster bundles", (uint8_t *)&v27, 2u);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "onboardingAndSettingsPersistence"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "getSnapshotDictionaryForAnalytics"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "biomeManager"));
    objc_msgSend(v22, "donateEvents:andBundles:andOnboardingStatus:", 0, *(_QWORD *)(a1 + 56), v21);

    v23 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      LOWORD(v27) = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "finished biome donation for cluster bundles.", (uint8_t *)&v27, 2u);
    }

    v25 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_signpost_enabled(v26))
    {
      LOWORD(v27) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerGenerateClusterAndAnomalyBundlesSubmitClusterBundleAnalytics", ", (uint8_t *)&v27, 2u);
    }

    -[MOPerformanceMeasurement endSession](v17, "endSession");
  }

}

- (MOEventManager)eventManager
{
  return self->_eventManager;
}

- (void)setEventManager:(id)a3
{
  objc_storeStrong((id *)&self->_eventManager, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MOEventBundleStore)eventBundleStore
{
  return self->_eventBundleStore;
}

- (void)setEventBundleStore:(id)a3
{
  objc_storeStrong((id *)&self->_eventBundleStore, a3);
}

- (MOFSMStore)fsmStore
{
  return self->_fsmStore;
}

- (void)setFsmStore:(id)a3
{
  objc_storeStrong((id *)&self->_fsmStore, a3);
}

- (BOOL)enableSemanticPruning
{
  return self->_enableSemanticPruning;
}

- (void)setEnableSemanticPruning:(BOOL)a3
{
  self->_enableSemanticPruning = a3;
}

- (MODefaultsManager)defaultManager
{
  return self->_defaultManager;
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (MOEngagementHistoryManager)engagementHistoryManager
{
  return self->_engagementHistoryManager;
}

- (void)setEngagementHistoryManager:(id)a3
{
  objc_storeStrong((id *)&self->_engagementHistoryManager, a3);
}

- (MOEventBundleRanking)eventBundleRanking
{
  return self->_eventBundleRanking;
}

- (void)setEventBundleRanking:(id)a3
{
  objc_storeStrong((id *)&self->_eventBundleRanking, a3);
}

- (MODataExportManager)exportManager
{
  return self->_exportManager;
}

- (void)setExportManager:(id)a3
{
  objc_storeStrong((id *)&self->_exportManager, a3);
}

- (MOBundleClusteringManager)bundleClusteringManager
{
  return self->_bundleClusteringManager;
}

- (void)setBundleClusteringManager:(id)a3
{
  objc_storeStrong((id *)&self->_bundleClusteringManager, a3);
}

- (MOOnboardingAndSettingsPersistence)onboardingAndSettingsPersistence
{
  return self->_onboardingAndSettingsPersistence;
}

- (MOBiomeManager)biomeManager
{
  return self->_biomeManager;
}

- (void)setBiomeManager:(id)a3
{
  objc_storeStrong((id *)&self->_biomeManager, a3);
}

- (MOEngagementAndSuggestionAnalyticsManager)engagementAndSuggestionAnalyticsManager
{
  return self->_engagementAndSuggestionAnalyticsManager;
}

- (void)setEngagementAndSuggestionAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_engagementAndSuggestionAnalyticsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagementAndSuggestionAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_biomeManager, 0);
  objc_storeStrong((id *)&self->_onboardingAndSettingsPersistence, 0);
  objc_storeStrong((id *)&self->_bundleClusteringManager, 0);
  objc_storeStrong((id *)&self->_exportManager, 0);
  objc_storeStrong((id *)&self->_eventBundleRanking, 0);
  objc_storeStrong((id *)&self->_engagementHistoryManager, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_defaultManager, 0);
  objc_storeStrong((id *)&self->_fsmStore, 0);
  objc_storeStrong((id *)&self->_eventBundleStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_eventManager, 0);
  objc_storeStrong((id *)&self->fUniverse, 0);
}

- (void)initWithUniverse:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: eventBundleStore", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)initWithUniverse:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: defaultManager", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)bundleEventsWithRefreshVariant:andHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "unable to bundle event since datastore is not available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __67__MOEventBundleManager__bundleEventsWithRefreshVariant_andHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Fetching events for bundling failed. reason, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_filterPreOnboardedVisitEvents:(uint64_t)a1 handler:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  unsigned int *v2;
  _DWORD *v3;
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;

  v4 = objc_msgSend((id)OUTLINED_FUNCTION_4_0(a1, a2), "routineEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v5, "isPreOnboardedVisit");
  *v3 = 67109120;
  *v2 = v6;
  OUTLINED_FUNCTION_8_1((void *)&_mh_execute_header, v7, v8, "filterPreOnboardedVisitEvents, adding event visit to PreOnboardedVisit event array,isPreOnboarded,%d");

  OUTLINED_FUNCTION_7_1();
}

- (void)_filterPreOnboardedVisitEvents:(uint64_t)a1 handler:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  unsigned int *v2;
  _DWORD *v3;
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;

  v4 = objc_msgSend((id)OUTLINED_FUNCTION_4_0(a1, a2), "routineEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v5, "isPreOnboardedVisit");
  *v3 = 67109120;
  *v2 = v6;
  OUTLINED_FUNCTION_8_1((void *)&_mh_execute_header, v7, v8, "filterPreOnboardedVisitEvents, adding event visit to rest event array,isPreOnboarded,%d");

  OUTLINED_FUNCTION_7_1();
}

- (void)_filterPreOnboardedVisitEvents:(uint64_t)a1 handler:(uint64_t)a2 .cold.3(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD *v3;
  uint8_t *v4;
  id v5;

  v5 = objc_msgSend((id)OUTLINED_FUNCTION_4_0(a1, a2), "category");
  *(_DWORD *)v4 = 134217984;
  *v3 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "filterPreOnboardedVisitEvents, adding event category %lu, to rest event array", v4, 0xCu);
  OUTLINED_FUNCTION_7_1();
}

void __68__MOEventBundleManager_submitMOEventData_startDate_endDate_subDate___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Error was issued during CA submission of user age and gender. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__MOEventBundleManager_submitMOEventData_startDate_endDate_subDate___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Error was issued during fetching of age. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__MOEventBundleManager_submitMOEventData_startDate_endDate_subDate___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Error was issued during fetching of gender. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)submitEventBundleInternalAnalytics:(uint8_t *)buf withSubmissionDate:(_QWORD *)a2 withRefreshVariant:(os_log_t)log .cold.1(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a2 = CFSTR("com.apple.Moments.MOEventBundle");
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "CA payload (%@) is nil. Skip submission", buf, 0xCu);
}

void __71__MOEventBundleManager_saveEventBundles_withStartDate_endDate_handler___block_invoke_490_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "save event bundles hit error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __71__MOEventBundleManager_saveEventBundles_withStartDate_endDate_handler___block_invoke_491_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "remove event bundles hit error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)fetchEventBundlesWithOptions:CompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "unable to fetch event bundles since datastore is not available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __72__MOEventBundleManager__fetchEventBundlesWithOptions_CompletionHandler___block_invoke_501_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetch event bundles hit error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __59__MOEventBundleManager__rehydrateEventBundles_withHandler___block_invoke_504_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "eventBundle enable life events (rehydrate events), %lu", v2);
  OUTLINED_FUNCTION_1();
}

- (void)cleanUpEventBundlesWithRefreshVariant:andHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "unable to purge eventBundles since datastore is not available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "purge expired event bundles hit error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_523_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "purge non-evergreen event bundles with no events hit error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_526_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "purge evergreen event bundles with no events hit error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_531_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "purge bundles with rehydration failures hit error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_534_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "purge dangling bundles hit error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)clearEventBundlesWithRefreshVariant:andHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "unable to clear event bundles since datastore is not available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)captureCurrentDBStateForTrigger:withFeedback:additionalMetadata:shouldUpload:andHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Bundling input/output data collection is %s", v2);
  OUTLINED_FUNCTION_1();
}

void __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_2_573_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "JSON data dump error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "[GenerateClusterBundles] Filtered bundle count for embedding extraction: %lu", v2);
  OUTLINED_FUNCTION_1();
}

void __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_cold_2(void *a1, NSObject *a2)
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;

  v4 = objc_msgSend(a1, "count");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "valueForKeyPath:", CFSTR("@min.startDate")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "valueForKeyPath:", CFSTR("@max.startDate")));
  v7 = 134218498;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[GenerateClusterAndAnomalyBundles] Fetched input bundle: count=%lu, date range=%@-%@", (uint8_t *)&v7, 0x20u);

}

void __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "[GenerateClusterAndAnomalyBundles] Error occurred while fetching input bundles. Error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_588_cold_1(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, a2, v3, "[GenerateClusterAndAnomalyBundles] Existing cluster Bundle count:%lu", v4);
}

@end
