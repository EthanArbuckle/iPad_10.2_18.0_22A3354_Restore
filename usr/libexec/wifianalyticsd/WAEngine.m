@implementation WAEngine

- (WAEngine)init
{
  char *v2;
  id v3;
  void *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  CADataTransformEngine *v22;
  void *v23;
  RecommendationEngine *v24;
  void *v25;
  WACoreCapture *v26;
  void *v27;
  dispatch_queue_attr_t v28;
  NSObject *v29;
  dispatch_queue_t v30;
  void *v31;
  dispatch_queue_attr_t v32;
  NSObject *v33;
  dispatch_queue_t v34;
  void *v35;
  dispatch_queue_attr_t v36;
  NSObject *v37;
  dispatch_queue_t v38;
  void *v39;
  dispatch_queue_attr_t v40;
  NSObject *v41;
  dispatch_queue_t v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  SCDynamicStoreRef v63;
  void *v64;
  dispatch_queue_attr_t v65;
  NSObject *v66;
  dispatch_queue_t v67;
  void *v68;
  id v69;
  NSObject *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  dispatch_queue_attr_t v79;
  NSObject *v80;
  dispatch_queue_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  NSObject *v92;
  char *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  id v100;
  NSObject *v101;
  NSObject *v102;
  int v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  WAEngine *v109;
  void *v110;
  id v112;
  const char *v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  NSObject *v120;
  uint64_t v121;
  WAEngine *v122;
  _QWORD handler[4];
  char *v124;
  objc_super v125;
  uint8_t buf[4];
  const char *v127;
  __int16 v128;
  int v129;
  __int16 v130;
  int v131;
  __int16 v132;
  void *v133;

  v125.receiver = self;
  v125.super_class = (Class)WAEngine;
  v2 = -[WAEngine init](&v125, "init");
  if (!v2)
    goto LABEL_37;
  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)*((_QWORD *)v2 + 9);
  *((_QWORD *)v2 + 9) = v3;

  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = dispatch_queue_create("com.apple.wifi.analytics.engineQ", v6);
  v8 = (void *)*((_QWORD *)v2 + 11);
  *((_QWORD *)v2 + 11) = v7;

  v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = dispatch_queue_create(0, v10);
  v12 = (void *)*((_QWORD *)v2 + 74);
  *((_QWORD *)v2 + 74) = v11;

  v13 = objc_alloc_init((Class)NSMutableDictionary);
  v14 = (void *)*((_QWORD *)v2 + 15);
  *((_QWORD *)v2 + 15) = v13;

  v15 = objc_alloc_init((Class)NSMutableDictionary);
  v16 = (void *)*((_QWORD *)v2 + 17);
  *((_QWORD *)v2 + 17) = v15;

  v17 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.wifianalyticsd"));
  v18 = (void *)*((_QWORD *)v2 + 14);
  *((_QWORD *)v2 + 14) = v17;

  v19 = (void *)*((_QWORD *)v2 + 14);
  if (!v19)
    goto LABEL_37;
  objc_msgSend(v19, "setDelegate:", v2);
  v2[53] = 0;
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "wifianalyticsTmpDirectory"));
  v21 = (void *)*((_QWORD *)v2 + 73);
  *((_QWORD *)v2 + 73) = v20;

  if (!*((_QWORD *)v2 + 73))
    goto LABEL_37;
  v2[32] = 0;
  v2[42] = 0;
  v2[35] = 0;
  v22 = objc_alloc_init(CADataTransformEngine);
  v23 = (void *)*((_QWORD *)v2 + 20);
  *((_QWORD *)v2 + 20) = v22;

  if (!*((_QWORD *)v2 + 20))
  {
    v112 = WALogCategoryDefaultHandle();
    v102 = objc_claimAutoreleasedReturnValue(v112);
    if (!os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
      goto LABEL_36;
    *(_DWORD *)buf = 136446466;
    v127 = "-[WAEngine init]";
    v128 = 1024;
    v129 = 419;
    v113 = "%{public}s::%d:Error creating _transformEngine";
LABEL_35:
    _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_ERROR, v113, buf, 0x12u);
    goto LABEL_36;
  }
  v24 = objc_alloc_init(RecommendationEngine);
  v25 = (void *)*((_QWORD *)v2 + 22);
  *((_QWORD *)v2 + 22) = v24;

  if (!*((_QWORD *)v2 + 22))
  {
    v114 = WALogCategoryDefaultHandle();
    v102 = objc_claimAutoreleasedReturnValue(v114);
    if (!os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
      goto LABEL_36;
    *(_DWORD *)buf = 136446466;
    v127 = "-[WAEngine init]";
    v128 = 1024;
    v129 = 422;
    v113 = "%{public}s::%d:Error creating _recommendationEngine";
    goto LABEL_35;
  }
  v26 = objc_alloc_init(WACoreCapture);
  v27 = (void *)*((_QWORD *)v2 + 63);
  *((_QWORD *)v2 + 63) = v26;

  if (!*((_QWORD *)v2 + 63))
  {
    v115 = WALogCategoryDefaultHandle();
    v102 = objc_claimAutoreleasedReturnValue(v115);
    if (!os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
      goto LABEL_36;
    *(_DWORD *)buf = 136446466;
    v127 = "-[WAEngine init]";
    v128 = 1024;
    v129 = 425;
    v113 = "%{public}s::%d:Error creating _coreCaptureControl";
    goto LABEL_35;
  }
  v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v29 = objc_claimAutoreleasedReturnValue(v28);
  v30 = dispatch_queue_create("com.apple.wifi.analytics.dpsQ", v29);
  v31 = (void *)*((_QWORD *)v2 + 64);
  *((_QWORD *)v2 + 64) = v30;

  v32 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v33 = objc_claimAutoreleasedReturnValue(v32);
  v34 = dispatch_queue_create("com.apple.wifi.analytics.dpsReadWriteQ", v33);
  v35 = (void *)*((_QWORD *)v2 + 65);
  *((_QWORD *)v2 + 65) = v34;

  v36 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v37 = objc_claimAutoreleasedReturnValue(v36);
  v38 = dispatch_queue_create("com.apple.wifi.analytics.peerDiagnosticsQ", v37);
  v39 = (void *)*((_QWORD *)v2 + 66);
  *((_QWORD *)v2 + 66) = v38;

  v40 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v41 = objc_claimAutoreleasedReturnValue(v40);
  v42 = dispatch_queue_create("com.apple.wifi.analytics.dnsQ", v41);
  v43 = (void *)*((_QWORD *)v2 + 61);
  *((_QWORD *)v2 + 61) = v42;

  v44 = objc_alloc_init((Class)NSMutableArray);
  v45 = (void *)*((_QWORD *)v2 + 67);
  *((_QWORD *)v2 + 67) = v44;

  v46 = objc_alloc_init((Class)NSMutableArray);
  v47 = (void *)*((_QWORD *)v2 + 68);
  *((_QWORD *)v2 + 68) = v46;

  v48 = objc_alloc_init((Class)NSMutableArray);
  v49 = (void *)*((_QWORD *)v2 + 69);
  *((_QWORD *)v2 + 69) = v48;

  v50 = objc_alloc_init((Class)NSMutableArray);
  v51 = (void *)*((_QWORD *)v2 + 70);
  *((_QWORD *)v2 + 70) = v50;

  v52 = objc_alloc_init((Class)NSMutableArray);
  v53 = (void *)*((_QWORD *)v2 + 60);
  *((_QWORD *)v2 + 60) = v52;

  v54 = objc_alloc_init((Class)NSMutableArray);
  v55 = (void *)*((_QWORD *)v2 + 62);
  *((_QWORD *)v2 + 62) = v54;

  v56 = objc_alloc_init((Class)NSMutableDictionary);
  v57 = (void *)*((_QWORD *)v2 + 21);
  *((_QWORD *)v2 + 21) = v56;

  *((_DWORD *)v2 + 15) = 0;
  v58 = objc_alloc_init((Class)NSMutableArray);
  v59 = (void *)*((_QWORD *)v2 + 71);
  *((_QWORD *)v2 + 71) = v58;

  v60 = objc_msgSend(objc_alloc((Class)CWFInterface), "initWithServiceType:", 1);
  v61 = (void *)*((_QWORD *)v2 + 1);
  *((_QWORD *)v2 + 1) = v60;

  v62 = (void *)*((_QWORD *)v2 + 1);
  if (!v62)
  {
    v116 = WALogCategoryDefaultHandle();
    v102 = objc_claimAutoreleasedReturnValue(v116);
    if (!os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
      goto LABEL_36;
    *(_DWORD *)buf = 136446466;
    v127 = "-[WAEngine init]";
    v128 = 1024;
    v129 = 444;
    v113 = "%{public}s::%d:Error creating _corewifi";
    goto LABEL_35;
  }
  objc_msgSend(v62, "resume");
  v63 = SCDynamicStoreCreate(kCFAllocatorDefault, CFSTR("com.apple.wifianalyticsd.wifi.intf"), 0, 0);
  *((_QWORD *)v2 + 2) = v63;
  if (!v63)
  {
    v117 = WALogCategoryDefaultHandle();
    v102 = objc_claimAutoreleasedReturnValue(v117);
    if (!os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
      goto LABEL_36;
    *(_DWORD *)buf = 136446466;
    v127 = "-[WAEngine init]";
    v128 = 1024;
    v129 = 451;
    v113 = "%{public}s::%d:Error creating _storeRef";
    goto LABEL_35;
  }
  v64 = (void *)*((_QWORD *)v2 + 59);
  *((_QWORD *)v2 + 59) = 0;

  v2[36] = MGGetBoolAnswer(CFSTR("apple-internal-install"));
  v65 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v66 = objc_claimAutoreleasedReturnValue(v65);
  v67 = dispatch_queue_create("com.apple.wifi.analytics.fileHandlingQ", v66);
  v68 = (void *)*((_QWORD *)v2 + 72);
  *((_QWORD *)v2 + 72) = v67;

  *((_OWORD *)v2 + 38) = xmmword_100092980;
  if (+[WAUtil isKeyBagUnlocked](WAUtil, "isKeyBagUnlocked"))
  {
    v69 = WALogCategoryDefaultHandle();
    v70 = objc_claimAutoreleasedReturnValue(v69);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v127 = "-[WAEngine init]";
      v128 = 1024;
      v129 = 467;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:isKeyBagUnlocked is true, attempting setup setupAnalyticsProcessorWithCompletionBlock", buf, 0x12u);
    }

    objc_msgSend(v2, "setupAnalyticsProcessorWithCompletionBlock:", 0);
  }
  objc_msgSend(v2, "createAndStartJsonReaderTimer");
  v2[52] = 0;
  v71 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v72 = (void *)*((_QWORD *)v2 + 18);
  *((_QWORD *)v2 + 18) = v71;

  if (*((_QWORD *)v2 + 18))
  {
    v73 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("dunno")));
    v74 = (void *)*((_QWORD *)v2 + 19);
    *((_QWORD *)v2 + 19) = v73;

    v75 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", &stru_1000CF640));
    v76 = (void *)*((_QWORD *)v2 + 24);
    *((_QWORD *)v2 + 24) = v75;

    *((_QWORD *)v2 + 97) = 0;
    v77 = objc_claimAutoreleasedReturnValue(+[ManagedConfiguration sharedInstance](ManagedConfiguration, "sharedInstance"));
    v78 = (void *)*((_QWORD *)v2 + 80);
    *((_QWORD *)v2 + 80) = v77;

    v79 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v80 = objc_claimAutoreleasedReturnValue(v79);
    v81 = dispatch_queue_create("com.apple.wifi.analytics.config", v80);
    v82 = (void *)*((_QWORD *)v2 + 79);
    *((_QWORD *)v2 + 79) = v81;

    objc_msgSend(*((id *)v2 + 80), "scheduleWithQueue:", *((_QWORD *)v2 + 79));
    objc_msgSend(*((id *)v2 + 80), "setDbDelegate:", v2);
    v83 = objc_claimAutoreleasedReturnValue(+[DatapathMetricStream sharedInstance](DatapathMetricStream, "sharedInstance"));
    v84 = (void *)*((_QWORD *)v2 + 81);
    *((_QWORD *)v2 + 81) = v83;

    objc_msgSend(v2, "initDatapathMetricGetterAndFetcher");
    v85 = (void *)*((_QWORD *)v2 + 81);
    v86 = *((_QWORD *)v2 + 79);
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "DatapathMetricGetter"));
    objc_msgSend(v85, "setDispatchQueueAndAddObservers:withGetter:", v86, v87);

    objc_msgSend(*((id *)v2 + 81), "setDbDelegate:", v2);
    v88 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    v89 = (void *)*((_QWORD *)v2 + 83);
    *((_QWORD *)v2 + 83) = v88;

    v90 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    v91 = (void *)*((_QWORD *)v2 + 84);
    *((_QWORD *)v2 + 84) = v90;

    v2[54] = 0;
    *(_WORD *)(v2 + 49) = 0;
    v2[51] = 0;
    v92 = *((_QWORD *)v2 + 72);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100042F4C;
    handler[3] = &unk_1000CCFC0;
    v93 = v2;
    v124 = v93;
    notify_register_dispatch("com.apple.mobile.keybagd.lock_status", (int *)v2 + 16, v92, handler);
    objc_msgSend(v93, "keyBagLockStateChangeNotification");

    v93[37] = 0;
    v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    *((_DWORD *)v93 + 17) = objc_msgSend(v94, "processIdentifier");

    v95 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v96 = (void *)*((_QWORD *)v93 + 87);
    *((_QWORD *)v93 + 87) = v95;

    v97 = objc_claimAutoreleasedReturnValue(+[RecommendationPreferences sharedObject](RecommendationPreferences, "sharedObject"));
    v98 = (void *)*((_QWORD *)v93 + 85);
    *((_QWORD *)v93 + 85) = v97;

    v99 = *((_QWORD *)v93 + 85);
    v100 = WALogCategoryDefaultHandle();
    v101 = objc_claimAutoreleasedReturnValue(v100);
    v102 = v101;
    if (v99)
    {
      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
      {
        v103 = *((_DWORD *)v93 + 17);
        v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
        v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "globallyUniqueString"));
        *(_DWORD *)buf = 136446978;
        v127 = "-[WAEngine init]";
        v128 = 1024;
        v129 = 520;
        v130 = 1024;
        v131 = v103;
        v132 = 2112;
        v133 = v105;
        _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEBUG, "%{public}s::%d:WAEngine init with pid %d uniqueString %@", buf, 0x22u);

      }
      v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "managedConfiguration"));
      objc_msgSend(v106, "addObserver:forKeyPath:options:context:", v93, CFSTR("megawifiprofile_diagnostic_metrics_enabled"), 5, 0);

      *((_QWORD *)v93 + 91) = arc4random_uniform(0x18u);
      *((_QWORD *)v93 + 92) = arc4random_uniform(0x90u) + 24;
      objc_msgSend(v93, "_enableWorkReportRecurringTimer");
      v107 = (void *)objc_claimAutoreleasedReturnValue(+[WAApple80211Manager sharedObject](WAApple80211Manager, "sharedObject"));
      v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "getInfraApple80211"));

      if (v108)
        objc_msgSend(v108, "setDbDelegate:", v93);

      v109 = v93;
      v122 = v109;
      v110 = (void *)objc_claimAutoreleasedReturnValue(+[WAActivityManager sharedActivityManager](WAActivityManager, "sharedActivityManager", _NSConcreteStackBlock, 3221225472, sub_100042F54, &unk_1000CCDB0));
      objc_msgSend(v110, "setExecuteBeforePossibleEagerExit:", &v121);

      v2 = (char *)v122;
      goto LABEL_20;
    }
    if (!os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
      goto LABEL_36;
    *(_DWORD *)buf = 136446466;
    v127 = "-[WAEngine init]";
    v128 = 1024;
    v129 = 518;
    v113 = "%{public}s::%d:Error RecommendationPreferences init";
    goto LABEL_35;
  }
  v118 = WALogCategoryDefaultHandle();
  v102 = objc_claimAutoreleasedReturnValue(v118);
  if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v127 = "-[WAEngine init]";
    v128 = 1024;
    v129 = 477;
    v113 = "%{public}s::%d:Error creating _interfaceNameToApple80211InstanceMap";
    goto LABEL_35;
  }
LABEL_36:

LABEL_37:
  v119 = WALogCategoryDefaultHandle();
  v120 = objc_claimAutoreleasedReturnValue(v119);
  if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v127 = "-[WAEngine init]";
    v128 = 1024;
    v129 = 551;
    _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_ERROR, "%{public}s::%d:FAILED to initialize!", buf, 0x12u);
  }

  v109 = 0;
LABEL_20:

  return v109;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("megawifiprofile_diagnostic_metrics_enabled"));

  v4.receiver = self;
  v4.super_class = (Class)WAEngine;
  -[WAEngine dealloc](&v4, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  OS_dispatch_queue *engineQ;
  id v14;
  id v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  WAEngine *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
  v10 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    v11 = v9;
  else
    v11 = 0;
  v12 = v11;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("megawifiprofile_diagnostic_metrics_enabled")) && v12)
  {
    engineQ = self->_engineQ;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100043164;
    v17[3] = &unk_1000CD178;
    v14 = v12;
    v18 = v14;
    v19 = self;
    dispatch_async((dispatch_queue_t)engineQ, v17);
    v15 = WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      v21 = "-[WAEngine observeValueForKeyPath:ofObject:change:context:]";
      v22 = 1024;
      v23 = 576;
      v24 = 2112;
      v25 = v8;
      v26 = 2112;
      v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%@ Preference is %@", buf, 0x26u);
    }

  }
}

- (id)_DPSQuickRecoveryEngineObj
{
  DPSQuickRecoveryRecommendationEngine *dpsQuickRecoveryEngine;
  DPSQuickRecoveryRecommendationEngine *v4;
  DPSQuickRecoveryRecommendationEngine *v5;
  id v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;

  dpsQuickRecoveryEngine = self->_dpsQuickRecoveryEngine;
  if (dpsQuickRecoveryEngine)
    return dpsQuickRecoveryEngine;
  if (!-[WAEngine _isDPSQuickRecoveryEngineUsed](self, "_isDPSQuickRecoveryEngineUsed"))
  {
    dpsQuickRecoveryEngine = self->_dpsQuickRecoveryEngine;
    return dpsQuickRecoveryEngine;
  }
  v4 = objc_alloc_init(DPSQuickRecoveryRecommendationEngine);
  v5 = self->_dpsQuickRecoveryEngine;
  self->_dpsQuickRecoveryEngine = v4;

  dpsQuickRecoveryEngine = self->_dpsQuickRecoveryEngine;
  if (dpsQuickRecoveryEngine)
    return dpsQuickRecoveryEngine;
  v6 = WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v9 = 136446466;
    v10 = "-[WAEngine _DPSQuickRecoveryEngineObj]";
    v11 = 1024;
    v12 = 588;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to alloc DPSQuickRecoveryRecommendationEngine", (uint8_t *)&v9, 0x12u);
  }

  return 0;
}

- (id)getW5Client
{
  W5Client *velocityClient;
  W5Client *v4;
  W5Client *v5;

  velocityClient = self->_velocityClient;
  if (!velocityClient)
  {
    v4 = (W5Client *)objc_alloc_init((Class)sub_1000432C4());
    v5 = self->_velocityClient;
    self->_velocityClient = v4;

    velocityClient = self->_velocityClient;
  }
  return velocityClient;
}

- (BOOL)_isDPSQuickRecoveryEngineUsed
{
  void *v3;
  void *v4;
  id v5;
  id v7;
  NSObject *v8;
  const char *v9;
  id v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;

  if (self->_driverType)
    return 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[WAApple80211Manager sharedObject](WAApple80211Manager, "sharedObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getInfraApple80211"));

  if (!v4)
  {
    v7 = WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = 136446466;
      v12 = "-[WAEngine _isDPSQuickRecoveryEngineUsed]";
      v13 = 1024;
      v14 = 616;
      v9 = "%{public}s::%d:invalid apple80211API";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v11, 0x12u);
    }
LABEL_12:

    return 0;
  }
  v5 = objc_msgSend(v4, "getDriverType");
  self->_driverType = (int64_t)v5;
  if (!v5)
  {
    v10 = WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = 136446466;
      v12 = "-[WAEngine _isDPSQuickRecoveryEngineUsed]";
      v13 = 1024;
      v14 = 619;
      v9 = "%{public}s::%d:invalid _driverType kWAWIFIDriverUnknown";
      goto LABEL_11;
    }
    goto LABEL_12;
  }

  return 1;
}

- (void)_updateProfileStateDate:(unsigned __int8)a3
{
  int v3;
  void *v5;
  unint64_t v6;
  objc_class *v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSDate *profileMegaEnabledDate;
  NSDate *profileMegaDisabledDate;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  NSDate *v18;
  NSDate *v19;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  unint64_t v29;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v6 = -[WAEngine _getTimeInProfileState:](self, "_getTimeInProfileState:", 1);
  v7 = -[WAEngine _getTimeInProfileState:](self, "_getTimeInProfileState:", 0);
  v8 = WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 136446978;
    v21 = "-[WAEngine _updateProfileStateDate:]";
    v22 = 1024;
    v23 = 642;
    v24 = 2048;
    v25 = v6;
    v26 = 2048;
    v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:MegaWiFi Profile state change: currentEnabledSeconds %lu currentDisabledSeconds %lu", (uint8_t *)&v20, 0x26u);
  }

  if (v3 == 1 && !self->_isMegaEnabled)
  {
    v10 = WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      profileMegaEnabledDate = self->_profileMegaEnabledDate;
      profileMegaDisabledDate = self->_profileMegaDisabledDate;
      v20 = 136447234;
      v21 = "-[WAEngine _updateProfileStateDate:]";
      v22 = 1024;
      v23 = 645;
      v24 = 2112;
      v25 = (unint64_t)profileMegaEnabledDate;
      v26 = 2112;
      v27 = profileMegaDisabledDate;
      v28 = 2048;
      v29 = (unint64_t)v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:MegaWiFi Profile Installed: profileMegaEnabledDate %@ profileMegaDisabledDate %@ - was disabled for %lu seconds", (uint8_t *)&v20, 0x30u);
    }
    v14 = 1;
    v15 = 744;
    v16 = 768;
LABEL_13:

    *(Class *)((char *)&self->super.isa + v16) = v7;
    objc_storeStrong((id *)((char *)&self->super.isa + v15), v5);
    self->_isMegaEnabled = v14;
    goto LABEL_14;
  }
  if (!v3 && self->_isMegaEnabled == 1)
  {
    v17 = WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v18 = self->_profileMegaEnabledDate;
      v19 = self->_profileMegaDisabledDate;
      v20 = 136447234;
      v21 = "-[WAEngine _updateProfileStateDate:]";
      v22 = 1024;
      v23 = 653;
      v24 = 2112;
      v25 = (unint64_t)v18;
      v26 = 2112;
      v27 = v19;
      v28 = 2048;
      v29 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:MegaWiFi Profile Removed: profileMegaEnabledDate %@ profileMegaDisabledDate %@ - was enabled for %lu seconds", (uint8_t *)&v20, 0x30u);
    }
    v14 = 0;
    v15 = 752;
    v16 = 760;
    v7 = (objc_class *)v6;
    goto LABEL_13;
  }
LABEL_14:

}

- (unint64_t)_getTimeInProfileState:(unsigned __int8)a3
{
  int v3;
  void *v5;
  double v6;
  NSDate *profileMegaEnabledDate;
  unint64_t profileMegaEnabledSeconds;
  double v9;
  double v10;
  double v11;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  -[NSDate timeIntervalSinceDate:](self->_pidLaunchDate, "timeIntervalSinceDate:", v5);
  if (v6 < 0.0)
    v6 = -v6;
  profileMegaEnabledDate = self->_profileMegaEnabledDate;
  if (v3)
  {
    if (!profileMegaEnabledDate)
    {
      profileMegaEnabledSeconds = 0;
      goto LABEL_22;
    }
    if (self->_profileMegaDisabledDate)
    {
      profileMegaEnabledSeconds = self->_profileMegaEnabledSeconds;
      if (!self->_isMegaEnabled)
        goto LABEL_22;
LABEL_12:
      -[NSDate timeIntervalSinceDate:](profileMegaEnabledDate, "timeIntervalSinceDate:", v5, v6);
      if (v9 < 0.0)
        v9 = -v9;
      profileMegaEnabledSeconds += (unint64_t)v9;
      goto LABEL_22;
    }
    -[NSDate timeIntervalSinceDate:](profileMegaEnabledDate, "timeIntervalSinceDate:", v5, v6);
    if (v10 < 0.0)
      v10 = -v10;
    profileMegaEnabledSeconds = (unint64_t)v10;
  }
  else
  {
    profileMegaEnabledSeconds = (unint64_t)v6;
    if (!profileMegaEnabledDate)
      goto LABEL_22;
    if (self->_profileMegaDisabledDate)
    {
      profileMegaEnabledSeconds = self->_profileMegaDisabledSeconds;
      if (self->_isMegaEnabled)
        goto LABEL_22;
      profileMegaEnabledDate = self->_profileMegaDisabledDate;
      goto LABEL_12;
    }
    -[NSDate timeIntervalSinceDate:](profileMegaEnabledDate, "timeIntervalSinceDate:", v5);
    if (v11 < 0.0)
      v11 = -v11;
    profileMegaEnabledSeconds -= (unint64_t)v11;
  }
LABEL_22:

  return profileMegaEnabledSeconds;
}

- (void)initDatapathMetricGetterAndFetcher
{
  _QWORD v3[5];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10004391C;
  v3[3] = &unk_1000CD1C8;
  objc_copyWeak(&v4, &location);
  v3[4] = self;
  -[WAEngine setDatapathMetricGetter:](self, "setDatapathMetricGetter:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)setupAnalyticsProcessorWithCompletionBlock:(id)a3
{
  _BOOL8 v4;
  void *v5;
  id v6;
  id v7;
  void **block;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  WAEngine *v12;

  v6 = a3;
  block = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_100043E30;
  v11 = &unk_1000CCDB0;
  v12 = self;
  if (qword_1000ED080 != -1)
    dispatch_once(&qword_1000ED080, &block);
  v4 = -[WAEngine analyticsProcessorIsReady](self, "analyticsProcessorIsReady", v6, block, v9, v10, v11, v12);
  v5 = v7;
  if (v7)
  {
    (*((void (**)(id, _BOOL8))v7 + 2))(v7, v4);
    v5 = v7;
  }

}

- (void)_triggerDeviceAnalyticsStoreMigrationAndReply:(id)a3
{
  void (**v4)(id, id, _QWORD);
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  _QWORD v13[4];
  void (**v14)(id, id, _QWORD);
  NSErrorUserInfoKey v15;
  const __CFString *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;

  v4 = (void (**)(id, id, _QWORD))a3;
  if (-[WAEngine analyticsProcessorIsReady](self, "analyticsProcessorIsReady"))
  {
    v5 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithBool:", 1);
    v6 = WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v18 = "-[WAEngine _triggerDeviceAnalyticsStoreMigrationAndReply:]";
      v19 = 1024;
      v20 = 818;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Result for triggerDeviceAnalyticsStoreMigrationAndReply via XPC - AnalyticsProcessor ready", buf, 0x12u);
    }

    if (v4)
      v4[2](v4, v5, 0);
  }
  else
  {
    v8 = WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v18 = "-[WAEngine _triggerDeviceAnalyticsStoreMigrationAndReply:]";
      v19 = 1024;
      v20 = 801;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AnalyticsProcessor not ready yet", buf, 0x12u);
    }

    if (+[WAUtil isKeyBagUnlocked](WAUtil, "isKeyBagUnlocked"))
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000443B0;
      v13[3] = &unk_1000CD1F0;
      v14 = v4;
      -[WAEngine setupAnalyticsProcessorWithCompletionBlock:](self, "setupAnalyticsProcessorWithCompletionBlock:", v13);
      v5 = v14;
    }
    else
    {
      v15 = NSLocalizedFailureReasonErrorKey;
      v16 = CFSTR("WAErrorCodeKeyBagLocked");
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
      v5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9016, v10));

      v11 = WALogCategoryDefaultHandle();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v18 = "-[WAEngine _triggerDeviceAnalyticsStoreMigrationAndReply:]";
        v19 = 1024;
        v20 = 813;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Result for triggerDeviceAnalyticsStoreMigrationAndReply via XPC - Error: WAErrorCodeKeyBagLocked. KeyBag not unlocked", buf, 0x12u);
      }

      if (v4)
        ((void (**)(id, id, id))v4)[2](v4, 0, v5);
    }
  }

}

- (void)keyBagLockStateChangeNotification
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;

  v3 = WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136446466;
    v8 = "-[WAEngine keyBagLockStateChangeNotification]";
    v9 = 1024;
    v10 = 825;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Received keyBagLockStateChangeNotification", (uint8_t *)&v7, 0x12u);
  }

  if (+[WAUtil isKeyBagUnlocked](WAUtil, "isKeyBagUnlocked"))
  {
    v5 = WALogCategoryDefaultHandle();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136446466;
      v8 = "-[WAEngine keyBagLockStateChangeNotification]";
      v9 = 1024;
      v10 = 828;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Got keyBagLockStateChangeNotification isKeyBagUnlocked is true, attempting setup setupAnalyticsProcessorWithCompletionBlock", (uint8_t *)&v7, 0x12u);
    }

    -[WAEngine setupAnalyticsProcessorWithCompletionBlock:](self, "setupAnalyticsProcessorWithCompletionBlock:", 0);
  }
}

- (id)wifianalyticsTmpDirectory
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  NSObject *v22;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "temporaryDirectory"));

  if (!v3)
  {
    v13 = WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v18 = "-[WAEngine wifianalyticsTmpDirectory]";
      v19 = 1024;
      v20 = 841;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:NULL tmpDirectory", buf, 0x12u);
    }
    goto LABEL_14;
  }
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("wifianalytics")));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](v4, "path"));
    v7 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, 0);

    if ((v7 & 1) != 0
      || (v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager")),
          v16 = 0,
          objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v16),
          v9 = v16,
          v8,
          !v9))
    {
      v10 = WALogCategoryDefaultHandle();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v18 = "-[WAEngine wifianalyticsTmpDirectory]";
        v19 = 1024;
        v20 = 854;
        v21 = 2112;
        v22 = v4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:wifianalyticsDirectory: %@", buf, 0x1Cu);
      }
      goto LABEL_7;
    }
    v14 = WALogCategoryDefaultHandle();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v18 = "-[WAEngine wifianalyticsTmpDirectory]";
      v19 = 1024;
      v20 = 852;
      v21 = 2112;
      v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to create wifianalytics tmp directory with error %@", buf, 0x1Cu);
    }

    v11 = v4;
LABEL_14:
    v4 = 0;
LABEL_7:

  }
  return v4;
}

- (void)createAndStartJsonReaderTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *jsonFilerReaderTimer;
  NSObject *v5;
  id v6;
  NSObject *v7;
  unint64_t analyticsProcessingTimeIntervalSecs;
  NSObject *v9;
  double v10;
  dispatch_time_t v11;
  double v12;
  id v13;
  NSObject *v14;
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  unint64_t v21;

  v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_fileHandlingQ);
  jsonFilerReaderTimer = self->_jsonFilerReaderTimer;
  self->_jsonFilerReaderTimer = v3;

  v5 = self->_jsonFilerReaderTimer;
  if (v5)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100044A70;
    handler[3] = &unk_1000CCDB0;
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    v6 = WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      analyticsProcessingTimeIntervalSecs = (unint64_t)self->_analyticsProcessingTimeIntervalSecs;
      *(_DWORD *)buf = 136446722;
      v17 = "-[WAEngine createAndStartJsonReaderTimer]";
      v18 = 1024;
      v19 = 872;
      v20 = 2048;
      v21 = analyticsProcessingTimeIntervalSecs;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Starting _jsonFilerReaderTimer to fire in %llu s", buf, 0x1Cu);
    }

    v9 = self->_jsonFilerReaderTimer;
    -[WAEngine analyticsProcessingTimeIntervalSecs](self, "analyticsProcessingTimeIntervalSecs");
    v11 = dispatch_time(0xFFFFFFFFFFFFFFFELL, (uint64_t)(v10 * 1000000000.0));
    -[WAEngine analyticsProcessingTimeIntervalSecs](self, "analyticsProcessingTimeIntervalSecs");
    dispatch_source_set_timer(v9, v11, 1000000000 * (unint64_t)v12, 0x3B9ACA00uLL);
    dispatch_resume((dispatch_object_t)self->_jsonFilerReaderTimer);
  }
  else
  {
    v13 = WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v17 = "-[WAEngine createAndStartJsonReaderTimer]";
      v18 = 1024;
      v19 = 865;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to create _jsonFilerReaderTimer", buf, 0x12u);
    }

  }
}

- (void)run
{
  id v3;
  NSObject *v4;
  OS_dispatch_queue *engineQ;
  void *v6;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;

  v3 = WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[WAEngine run]";
    v10 = 1024;
    v11 = 881;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Starting...", buf, 0x12u);
  }

  engineQ = self->_engineQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044C40;
  block[3] = &unk_1000CCDB0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)engineQ, block);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine listener](self, "listener"));
  objc_msgSend(v6, "resume");

}

- (BOOL)queryInfraInterfaceInstanceAndChip
{
  void *v3;
  void *v4;
  NSString *infraInterfaceName;
  NSString *v6;
  NSString *v7;
  id v8;
  NSObject *v9;
  NSString *v10;
  NSString *v11;
  void *v12;
  NSString *wifiChipSet;
  NSString *v14;
  NSString *v15;
  id v16;
  NSObject *v17;
  BOOL v18;
  id v20;
  const char *v21;
  id v22;
  id v23;
  int v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  NSString *v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[WAApple80211Manager sharedObject](WAApple80211Manager, "sharedObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getInfraApple80211"));

  if (!v4)
  {
    v22 = WALogCategoryDefaultHandle();
    v17 = objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    v24 = 136446466;
    v25 = "-[WAEngine queryInfraInterfaceInstanceAndChip]";
    v26 = 1024;
    v27 = 894;
    v21 = "%{public}s::%d:invalid apple80211API";
    goto LABEL_25;
  }
  objc_msgSend(v4, "setDbDelegate:", self);
  infraInterfaceName = self->_infraInterfaceName;
  if (!infraInterfaceName || -[NSString isEqualToString:](infraInterfaceName, "isEqualToString:", CFSTR("dunno")))
  {
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ifName"));
    v7 = self->_infraInterfaceName;
    self->_infraInterfaceName = v6;

    v8 = WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = self->_infraInterfaceName;
      v24 = 136446722;
      v25 = "-[WAEngine queryInfraInterfaceInstanceAndChip]";
      v26 = 1024;
      v27 = 900;
      v28 = 2112;
      v29 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{public}s::%d:[apple80211 ifName]%@", (uint8_t *)&v24, 0x1Cu);
    }

  }
  v11 = self->_infraInterfaceName;
  if (!v11 || -[NSString isEqualToString:](v11, "isEqualToString:", CFSTR("dunno")))
  {
    v20 = WALogCategoryDefaultHandle();
    v17 = objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    v24 = 136446466;
    v25 = "-[WAEngine queryInfraInterfaceInstanceAndChip]";
    v26 = 1024;
    v27 = 903;
    v21 = "%{public}s::%d:failed to find _infraInterfaceName";
LABEL_25:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v24, 0x12u);
    goto LABEL_26;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_interfaceNameToApple80211InstanceMap, "objectForKeyedSubscript:", self->_infraInterfaceName));

  if (!v12)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_interfaceNameToApple80211InstanceMap, "setObject:forKeyedSubscript:", v4, self->_infraInterfaceName);
  wifiChipSet = self->_wifiChipSet;
  if (!wifiChipSet || -[NSString isEqualToString:](wifiChipSet, "isEqualToString:", &stru_1000CF640))
  {
    v14 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getChipSet"));
    v15 = self->_wifiChipSet;
    self->_wifiChipSet = v14;

  }
  if (!self->_wifiChipSet && objc_msgSend(0, "isEqualToString:", &stru_1000CF640))
  {
    v23 = WALogCategoryDefaultHandle();
    v17 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v24 = 136446466;
      v25 = "-[WAEngine queryInfraInterfaceInstanceAndChip]";
      v26 = 1024;
      v27 = 913;
      v21 = "%{public}s::%d:failed to find _wifiChipSet";
      goto LABEL_25;
    }
LABEL_26:
    v18 = 0;
    goto LABEL_18;
  }
  v16 = WALogCategoryDefaultHandle();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = 1;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 136446722;
    v25 = "-[WAEngine queryInfraInterfaceInstanceAndChip]";
    v26 = 1024;
    v27 = 917;
    v28 = 1024;
    LODWORD(v29) = 1;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:queryInfraInterfaceInstanceAndChip returning %d", (uint8_t *)&v24, 0x18u);
  }
LABEL_18:

  return v18;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  unsigned int v24;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.wifianalytics")));
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) != 0)
  {
    v8 = objc_msgSend(objc_alloc((Class)WAXPCConnection), "initWithXPCConnection:", v5);
    v9 = WAXPCRequestDelegateInterface(-[NSObject setDelegate:](v8, "setDelegate:", self));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_msgSend(v5, "setExportedInterface:", v10);

    objc_msgSend(v5, "setExportedObject:", v8);
    objc_msgSend(v5, "resume");
    v11 = WALogCategoryDefaultHandle();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136447234;
      v16 = "-[WAEngine listener:shouldAcceptNewConnection:]";
      v17 = 1024;
      v18 = 943;
      v19 = 1024;
      v20 = objc_msgSend(v5, "processIdentifier");
      v21 = 1024;
      v22 = objc_msgSend(v5, "effectiveUserIdentifier");
      v23 = 1024;
      v24 = objc_msgSend(v5, "effectiveGroupIdentifier");
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:XPC: ADDED XPC CONNECTION [pid=%d, euid=%d, egid=%d]", (uint8_t *)&v15, 0x24u);
    }

  }
  else
  {
    v14 = WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v15 = 136446466;
      v16 = "-[WAEngine listener:shouldAcceptNewConnection:]";
      v17 = 1024;
      v18 = 933;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: Connection from client not entitled, will not accept", (uint8_t *)&v15, 0x12u);
    }
  }

  return v7;
}

- (void)xpcConnection:(id)a3 establishConnectionWithToken:(id)a4 andReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  unsigned int v30;
  void *v31;
  unsigned int v32;
  void *v33;
  unsigned int v34;
  id v35;
  id v36;
  void *v37;
  _QWORD block[4];
  id v39;
  id v40;
  id v41;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id from;
  id v50;
  id location;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  id v57;
  __int16 v58;
  unsigned int v59;
  __int16 v60;
  unsigned int v61;
  __int16 v62;
  unsigned int v63;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, v8);
  objc_initWeak(&v50, self);
  v11 = v9;
  v12 = objc_loadWeakRetained(&location);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "connection"));
  objc_initWeak(&from, v13);

  if (v11)
  {
    v37 = 0;
    v19 = v11;
  }
  else
  {
    v14 = WALogCategoryDefaultHandle();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connection"));
      v17 = objc_msgSend(v16, "processIdentifier");
      *(_DWORD *)buf = 136446722;
      v53 = "-[WAEngine xpcConnection:establishConnectionWithToken:andReply:]";
      v54 = 1024;
      v55 = 962;
      v56 = 1024;
      LODWORD(v57) = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Connection from pid=%d without token. Generating a token for the reply", buf, 0x18u);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "UUIDString"));

    v37 = v19;
  }
  objc_msgSend(v8, "setToken:", v19);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1000456C4;
  v46[3] = &unk_1000CD218;
  objc_copyWeak(&v47, &location);
  objc_copyWeak(&v48, &from);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connection"));
  objc_msgSend(v20, "setInterruptionHandler:", v46);

  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_10004582C;
  v42[3] = &unk_1000CD268;
  v42[4] = self;
  objc_copyWeak(&v43, &location);
  objc_copyWeak(&v44, &from);
  objc_copyWeak(&v45, &v50);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connection"));
  objc_msgSend(v21, "setInvalidationHandler:", v42);

  v22 = objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045AF4;
  block[3] = &unk_1000CD290;
  objc_copyWeak(&v41, &v50);
  v23 = v19;
  v39 = v23;
  v24 = v8;
  v40 = v24;
  dispatch_async(v22, block);

  objc_destroyWeak(&v41);
  v25 = WALogCategoryDefaultHandle();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v36 = v10;
    v35 = v11;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "token"));
    v28 = (id)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](WAUtil, "trimTokenForLogging:", v27));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "connection"));
    v30 = objc_msgSend(v29, "processIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "connection"));
    v32 = objc_msgSend(v31, "effectiveUserIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "connection"));
    v34 = objc_msgSend(v33, "effectiveGroupIdentifier");
    *(_DWORD *)buf = 136447490;
    v53 = "-[WAEngine xpcConnection:establishConnectionWithToken:andReply:]";
    v54 = 1024;
    v55 = 996;
    v56 = 2112;
    v57 = v28;
    v58 = 1024;
    v59 = v30;
    v60 = 1024;
    v61 = v32;
    v62 = 1024;
    v63 = v34;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:XPC: Token: %@ is for: [pid=%d, euid=%d, egid=%d]", buf, 0x2Eu);

    v11 = v35;
    v10 = v36;

  }
  if (v10)
    (*((void (**)(id, void *, _QWORD))v10 + 2))(v10, v37, 0);
  objc_destroyWeak(&v45);
  objc_destroyWeak(&v44);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&v48);
  objc_destroyWeak(&v47);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v50);
  objc_destroyWeak(&location);

}

- (void)xpcConnection:(id)a3 submitMessage:(id)a4 groupType:(int64_t)a5 andReply:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21[2];
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_initWeak(&location, self);
  v13 = objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100045CAC;
  v17[3] = &unk_1000CD2B8;
  objc_copyWeak(v21, &location);
  v18 = v10;
  v19 = v11;
  v21[1] = (id)a5;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 submitWiFiAnalyticsMessageAdvanced:(id)a4 andReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11 = objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100046064;
  block[3] = &unk_1000CD330;
  objc_copyWeak(&v19, &location);
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 getMessagesModelForGroupType:(int64_t)a4 andReply:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  v10 = objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000463D8;
  block[3] = &unk_1000CD1A0;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 registerMessageGroup:(int64_t)a4 andReply:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  v10 = objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000466C0;
  block[3] = &unk_1000CD1A0;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 getNewMessageForKey:(id)a4 groupType:(int64_t)a5 withCopy:(id)a6 andReply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26[2];
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  objc_initWeak(&location, self);
  v16 = objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100046DA0;
  block[3] = &unk_1000CD308;
  objc_copyWeak(v26, &location);
  v26[1] = (id)a5;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v25 = v15;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  dispatch_async(v16, block);

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 killDaemonAndReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  unsigned int v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id location;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  const __CFString *v33;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForEntitlement:", CFSTR("com.apple.private.wifianalytics.test")));
  v10 = objc_msgSend(v9, "BOOLValue");

  v11 = WALogCategoryDefaultHandle();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if ((v10 & 1) != 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v25 = "-[WAEngine xpcConnection:killDaemonAndReply:]";
      v26 = 1024;
      v27 = 1127;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Received killDaemon via XPC - this shouldn't happen outside of unit tests", buf, 0x12u);
    }

    v14 = objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100047380;
    block[3] = &unk_1000CD330;
    block[4] = self;
    objc_copyWeak(&v22, &location);
    v20 = v6;
    v21 = v7;
    dispatch_async(v14, block);

    objc_destroyWeak(&v22);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "token"));
      v16 = (id)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](WAUtil, "trimTokenForLogging:", v15));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connection"));
      v18 = objc_msgSend(v17, "processIdentifier");
      *(_DWORD *)buf = 136447234;
      v25 = "-[WAEngine xpcConnection:killDaemonAndReply:]";
      v26 = 1024;
      v27 = 1125;
      v28 = 2112;
      v29 = v16;
      v30 = 1024;
      v31 = v18;
      v32 = 2112;
      v33 = CFSTR("com.apple.private.wifianalytics");
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: ERROR: %@ (%d) is not entitled with WA_XPC_ENTITLEMENT_TEST  for %@, rejecting connection!!!", buf, 0x2Cu);

    }
  }
  objc_destroyWeak(&location);

}

- (void)xpcConnection:(id)a3 clearMessageStoreAndReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  unsigned int v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id location;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  const __CFString *v33;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForEntitlement:", CFSTR("com.apple.private.wifianalytics.test")));
  v10 = objc_msgSend(v9, "BOOLValue");

  v11 = WALogCategoryDefaultHandle();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if ((v10 & 1) != 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v25 = "-[WAEngine xpcConnection:clearMessageStoreAndReply:]";
      v26 = 1024;
      v27 = 1151;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Received clearMessageStoreAndReply via XPC - this shouldn't happen outside of unit tests", buf, 0x12u);
    }

    v14 = objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100047788;
    v19[3] = &unk_1000CD358;
    objc_copyWeak(&v22, &location);
    v20 = v6;
    v21 = v7;
    dispatch_async(v14, v19);

    objc_destroyWeak(&v22);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "token"));
      v16 = (id)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](WAUtil, "trimTokenForLogging:", v15));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connection"));
      v18 = objc_msgSend(v17, "processIdentifier");
      *(_DWORD *)buf = 136447234;
      v25 = "-[WAEngine xpcConnection:clearMessageStoreAndReply:]";
      v26 = 1024;
      v27 = 1149;
      v28 = 2112;
      v29 = v16;
      v30 = 1024;
      v31 = v18;
      v32 = 2112;
      v33 = CFSTR("com.apple.private.wifianalytics");
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: ERROR: %@ (%d) is not entitled with WA_XPC_ENTITLEMENT_TEST  for %@, rejecting connection!!!", buf, 0x2Cu);

    }
  }
  objc_destroyWeak(&location);

}

- (void)xpcConnection:(id)a3 trapCrashMiniTracerDumpReadyForInterfaceWithName:(id)a4 andReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  unsigned int v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id location;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  id v33;
  __int16 v34;
  unsigned int v35;
  __int16 v36;
  const __CFString *v37;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connection"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForEntitlement:", CFSTR("com.apple.private.wifianalytics.fw-trap")));
  v13 = objc_msgSend(v12, "BOOLValue");

  v14 = WALogCategoryDefaultHandle();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if ((v13 & 1) != 0)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v29 = "-[WAEngine xpcConnection:trapCrashMiniTracerDumpReadyForInterfaceWithName:andReply:]";
      v30 = 1024;
      v31 = 1174;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Received trapCrashMiniTracerDumpReady via XPC, usually this due to wifid detecting the kApple80211DriverAvailabilityFlagHasTrapCrashTracerMiniDump flag in a driver availability message", buf, 0x12u);
    }

    v17 = objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100047BA4;
    block[3] = &unk_1000CD330;
    objc_copyWeak(&v26, &location);
    v23 = v8;
    v24 = v9;
    v25 = v10;
    dispatch_async(v17, block);

    objc_destroyWeak(&v26);
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "token"));
      v19 = (id)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](WAUtil, "trimTokenForLogging:", v18));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connection"));
      v21 = objc_msgSend(v20, "processIdentifier");
      *(_DWORD *)buf = 136447234;
      v29 = "-[WAEngine xpcConnection:trapCrashMiniTracerDumpReadyForInterfaceWithName:andReply:]";
      v30 = 1024;
      v31 = 1172;
      v32 = 2112;
      v33 = v19;
      v34 = 1024;
      v35 = v21;
      v36 = 2112;
      v37 = CFSTR("com.apple.private.wifianalytics");
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: ERROR: %@ (%d) is not entitled with WA_XPC_ENTITLEMENT_FW_TRAP  for %@, rejecting connection!!!", buf, 0x2Cu);

    }
  }
  objc_destroyWeak(&location);

}

- (void)xpcConnection:(id)a3 lqmCrashTracerNotifyForInterfaceWithName:(id)a4 andReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  unsigned int v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id location;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  id v33;
  __int16 v34;
  unsigned int v35;
  __int16 v36;
  const __CFString *v37;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connection"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForEntitlement:", CFSTR("com.apple.private.wifianalytics.fw-trap")));
  v13 = objc_msgSend(v12, "BOOLValue");

  v14 = WALogCategoryDefaultHandle();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if ((v13 & 1) != 0)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v29 = "-[WAEngine xpcConnection:lqmCrashTracerNotifyForInterfaceWithName:andReply:]";
      v30 = 1024;
      v31 = 1197;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Received lqmCrashTracerNotify via XPC", buf, 0x12u);
    }

    v17 = objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100047FC0;
    block[3] = &unk_1000CD330;
    objc_copyWeak(&v26, &location);
    v23 = v8;
    v24 = v9;
    v25 = v10;
    dispatch_async(v17, block);

    objc_destroyWeak(&v26);
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "token"));
      v19 = (id)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](WAUtil, "trimTokenForLogging:", v18));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connection"));
      v21 = objc_msgSend(v20, "processIdentifier");
      *(_DWORD *)buf = 136447234;
      v29 = "-[WAEngine xpcConnection:lqmCrashTracerNotifyForInterfaceWithName:andReply:]";
      v30 = 1024;
      v31 = 1195;
      v32 = 2112;
      v33 = v19;
      v34 = 1024;
      v35 = v21;
      v36 = 2112;
      v37 = CFSTR("com.apple.private.wifianalytics");
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: ERROR: %@ (%d) is not entitled with WA_XPC_ENTITLEMENT_FW_TRAP  for %@, rejecting connection!!!", buf, 0x2Cu);

    }
  }
  objc_destroyWeak(&location);

}

- (void)xpcConnection:(id)a3 lqmCrashTracerReceiveBlock:(id)a4 forInterfaceWithName:(id)a5 andReply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  unsigned int v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id location;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  id v37;
  __int16 v38;
  unsigned int v39;
  __int16 v40;
  const __CFString *v41;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "connection"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForEntitlement:", CFSTR("com.apple.private.wifianalytics.fw-trap")));
  v16 = objc_msgSend(v15, "BOOLValue");

  v17 = WALogCategoryDefaultHandle();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  v19 = v18;
  if ((v16 & 1) != 0)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v33 = "-[WAEngine xpcConnection:lqmCrashTracerReceiveBlock:forInterfaceWithName:andReply:]";
      v34 = 1024;
      v35 = 1219;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Received lqmCrashTracerReceiveBlock via XPC", buf, 0x12u);
    }

    v20 = objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100048400;
    v25[3] = &unk_1000CD380;
    objc_copyWeak(&v30, &location);
    v26 = v10;
    v27 = v11;
    v28 = v12;
    v29 = v13;
    dispatch_async(v20, v25);

    objc_destroyWeak(&v30);
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "token"));
      v22 = (id)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](WAUtil, "trimTokenForLogging:", v21));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "connection"));
      v24 = objc_msgSend(v23, "processIdentifier");
      *(_DWORD *)buf = 136447234;
      v33 = "-[WAEngine xpcConnection:lqmCrashTracerReceiveBlock:forInterfaceWithName:andReply:]";
      v34 = 1024;
      v35 = 1217;
      v36 = 2112;
      v37 = v22;
      v38 = 1024;
      v39 = v24;
      v40 = 2112;
      v41 = CFSTR("com.apple.private.wifianalytics");
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: ERROR: %@ (%d) is not entitled with WA_XPC_ENTITLEMENT_FW_TRAP  for %@, rejecting connection!!!", buf, 0x2Cu);

    }
  }
  objc_destroyWeak(&location);

}

- (void)xpcConnection:(id)a3 triggerQueryForNWActivity:(int64_t)a4 andReply:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  v10 = objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100048648;
  block[3] = &unk_1000CD1A0;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 convertWiFiStatsIntoPercentile:(id)a4 analysisGroup:(int64_t)a5 groupTarget:(id)a6 andReply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26[2];
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  objc_initWeak(&location, self);
  v16 = objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100048B7C;
  block[3] = &unk_1000CD308;
  objc_copyWeak(v26, &location);
  v22 = v12;
  v23 = v13;
  v26[1] = (id)a5;
  v24 = v14;
  v25 = v15;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  dispatch_async(v16, block);

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 triggerDatapathDiagnosticsAndCollectUpdates:(int64_t)a4 waMessage:(id)a5 andReply:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21[2];
  id location;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_initWeak(&location, self);
  v13 = objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100048F90;
  v17[3] = &unk_1000CD2B8;
  objc_copyWeak(v21, &location);
  v18 = v10;
  v19 = v11;
  v21[1] = (id)a4;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 getDpsStatsandReply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004936C;
  v11[3] = &unk_1000CD358;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 getUsageStatsandReply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  WAEngine *v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004977C;
  block[3] = &unk_1000CD330;
  objc_copyWeak(&v15, &location);
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 setDeviceAnalyticsConfiguration:(id)a4 andReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11 = objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100049BE0;
  block[3] = &unk_1000CD330;
  objc_copyWeak(&v19, &location);
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 getDeviceAnalyticsConfigurationAndReply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100049F44;
  v11[3] = &unk_1000CD358;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 summarizeDeviceAnalyticsForNetwork:(id)a4 maxAgeInDays:(unint64_t)a5 andReply:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21[2];
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_initWeak(&location, self);
  v13 = objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10004A2EC;
  v17[3] = &unk_1000CD2B8;
  objc_copyWeak(v21, &location);
  v18 = v10;
  v19 = v11;
  v21[1] = (id)a5;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 triggerDeviceAnalyticsStoreMigrationAndReply:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v19 = "-[WAEngine xpcConnection:triggerDeviceAnalyticsStoreMigrationAndReply:]";
    v20 = 1024;
    v21 = 1486;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Received triggerDeviceAnalyticsStoreMigrationAndReply via XPC", buf, 0x12u);
  }

  v10 = objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004A714;
  v13[3] = &unk_1000CD358;
  objc_copyWeak(&v16, &location);
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(v10, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)xpcConnection:(id)a3 sendMemoryPressureRequestAndReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  unsigned int v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id location;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  const __CFString *v33;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForEntitlement:", CFSTR("com.apple.private.wifianalytics.test")));
  v10 = objc_msgSend(v9, "BOOLValue");

  v11 = WALogCategoryDefaultHandle();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if ((v10 & 1) != 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v25 = "-[WAEngine xpcConnection:sendMemoryPressureRequestAndReply:]";
      v26 = 1024;
      v27 = 1522;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Received MemoryPressure request via XPC - this shouldn't happen outside of unit tests", buf, 0x12u);
    }

    v14 = objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10004AC90;
    v19[3] = &unk_1000CD358;
    objc_copyWeak(&v22, &location);
    v20 = v6;
    v21 = v7;
    dispatch_async(v14, v19);

    objc_destroyWeak(&v22);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "token"));
      v16 = (id)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](WAUtil, "trimTokenForLogging:", v15));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connection"));
      v18 = objc_msgSend(v17, "processIdentifier");
      *(_DWORD *)buf = 136447234;
      v25 = "-[WAEngine xpcConnection:sendMemoryPressureRequestAndReply:]";
      v26 = 1024;
      v27 = 1519;
      v28 = 2112;
      v29 = v16;
      v30 = 1024;
      v31 = v18;
      v32 = 2112;
      v33 = CFSTR("com.apple.private.wifianalytics");
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: ERROR: %@ (%d) is not entitled with WA_XPC_ENTITLEMENT_TEST  for %@, rejecting connection!!!", buf, 0x2Cu);

    }
  }
  objc_destroyWeak(&location);

}

- (void)xpcConnection:(id)a3 issueIOReportManagementCommand:(unint64_t)a4 andReply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  unsigned int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t *v27;
  id v28[2];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  id location;
  NSErrorUserInfoKey v36;
  const __CFString *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  id v43;
  __int16 v44;
  unsigned int v45;
  __int16 v46;
  const __CFString *v47;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_10004B174;
  v33 = sub_10004B184;
  v34 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connection"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForEntitlement:", CFSTR("com.apple.private.wifianalytics.test")));
  v12 = objc_msgSend(v11, "BOOLValue");

  v13 = WALogCategoryDefaultHandle();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if ((v12 & 1) != 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v39 = "-[WAEngine xpcConnection:issueIOReportManagementCommand:andReply:]";
      v40 = 1024;
      v41 = 1548;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Received issueIOReportManagementCommand request via XPC - this shouldn't happen outside of unit tests", buf, 0x12u);
    }

    v16 = objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10004B18C;
    v24[3] = &unk_1000CD3A8;
    objc_copyWeak(v28, &location);
    v25 = v8;
    v27 = &v29;
    v28[1] = (id)a4;
    v26 = v9;
    dispatch_async(v16, v24);

    objc_destroyWeak(v28);
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "token"));
      v18 = (id)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](WAUtil, "trimTokenForLogging:", v17));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connection"));
      v20 = objc_msgSend(v19, "processIdentifier");
      *(_DWORD *)buf = 136447234;
      v39 = "-[WAEngine xpcConnection:issueIOReportManagementCommand:andReply:]";
      v40 = 1024;
      v41 = 1546;
      v42 = 2112;
      v43 = v18;
      v44 = 1024;
      v45 = v20;
      v46 = 2112;
      v47 = CFSTR("com.apple.private.wifianalytics");
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: ERROR: %@ (%d) is not entitled with WA_XPC_ENTITLEMENT_TEST  for %@, rejecting connection!!!", buf, 0x2Cu);

    }
    v36 = NSLocalizedFailureReasonErrorKey;
    v37 = CFSTR("WAErrorCodeClientNotEntitled");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
    v22 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9030, v21));
    v23 = (void *)v30[5];
    v30[5] = v22;

  }
  if (v9)
    (*((void (**)(id, _QWORD, uint64_t))v9 + 2))(v9, 0, v30[5]);
  _Block_object_dispose(&v29, 8);

  objc_destroyWeak(&location);
}

- (BOOL)submitterMapCheck:(id)a3 group:(int64_t)a4
{
  id v6;
  NSMutableDictionary *submitterMap;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  int64_t v31;

  v6 = a3;
  submitterMap = self->_submitterMap;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "token"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](submitterMap, "objectForKeyedSubscript:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v10));

  if (!v11)
  {
    v12 = WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connection"));
      v15 = objc_msgSend(v14, "processIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connection"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "serviceName"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[WAUtil groupTypeToString:](WAUtil, "groupTypeToString:", a4));
      v20 = 136447490;
      v21 = "-[WAEngine submitterMapCheck:group:]";
      v22 = 1024;
      v23 = 1584;
      v24 = 1024;
      v25 = v15;
      v26 = 2112;
      v27 = v17;
      v28 = 2112;
      v29 = v18;
      v30 = 2048;
      v31 = a4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:pid %d proc %@ group %@(%ld) not in submitterMap", (uint8_t *)&v20, 0x36u);

    }
  }

  return v11 != 0;
}

- (id)getXPCConnectionForProcessToken:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_10004B174;
  v16 = sub_10004B184;
  v17 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B7BC;
  block[3] = &unk_1000CD3D0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)sendWakeUpNotificationForProcessWithName:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004B8A0;
  v7[3] = &unk_1000CD178;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)prepareToTerminateViaEagerExit
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004BA8C;
  v4[3] = &unk_1000CCE48;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_prepareToTerminateViaEagerExit
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;

  +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Terminations - Try Eager Exit"), self->_cachedUsage, self->_engineQ);
  v3 = WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136446466;
    v8 = "-[WAEngine _prepareToTerminateViaEagerExit]";
    v9 = 1024;
    v10 = 1632;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:prepareToTerminate...", (uint8_t *)&v7, 0x12u);
  }

  -[WAEngine _prepareToTerminate](self, "_prepareToTerminate");
  v5 = WALogCategoryDefaultHandle();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136446466;
    v8 = "-[WAEngine _prepareToTerminateViaEagerExit]";
    v9 = 1024;
    v10 = 1634;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Done", (uint8_t *)&v7, 0x12u);
  }

}

- (void)prepareToTerminateAnyReply:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004BD90;
  block[3] = &unk_1000CD3F8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_prepareToTerminate
{
  NSMutableDictionary *cachedUsage;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;

  +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Terminations - Graceful"), self->_cachedUsage, self->_engineQ);
  -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", CFSTR("Last Graceful Termination Date"));
  cachedUsage = self->_cachedUsage;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[NSMutableDictionary setObject:forKey:](cachedUsage, "setObject:forKey:", v4, CFSTR("Last Graceful Termination Date"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine listener](self, "listener"));
  objc_msgSend(v5, "suspend");

  v6 = WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136446466;
    v14 = "-[WAEngine _prepareToTerminate]";
    v15 = 1024;
    v16 = 1655;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_persist", (uint8_t *)&v13, 0x12u);
  }

  -[WAEngine _persist](self, "_persist");
  v8 = WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136446466;
    v14 = "-[WAEngine _prepareToTerminate]";
    v15 = 1024;
    v16 = 1657;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:persistIORObjects", (uint8_t *)&v13, 0x12u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator"));
  objc_msgSend(v10, "persistIORObjects:", 1);

  v11 = WALogCategoryDefaultHandle();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136446466;
    v14 = "-[WAEngine _prepareToTerminate]";
    v15 = 1024;
    v16 = 1659;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Done", (uint8_t *)&v13, 0x12u);
  }

}

- (void)handleMemoryWarning:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  BOOL v10;
  id location;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  _BOOL4 v19;

  v3 = a3;
  objc_initWeak(&location, self);
  v5 = WALogCategoryDefaultHandle();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v13 = "-[WAEngine handleMemoryWarning:]";
    v14 = 1024;
    v15 = 1666;
    v16 = 2080;
    v17 = "-[WAEngine handleMemoryWarning:]";
    v18 = 1024;
    v19 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s: critical=%d", buf, 0x22u);
  }

  v7 = objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004C214;
  block[3] = &unk_1000CCE70;
  objc_copyWeak(&v9, &location);
  v10 = v3;
  dispatch_async(v7, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)_getBasePersistenceKeychainQuery
{
  void *v2;
  id v3;
  _QWORD v5[4];
  _QWORD v6[4];

  v5[0] = kSecAttrAccount;
  v5[1] = kSecAttrService;
  v6[0] = CFSTR("com.apple.wifi.analytics.persistence");
  v6[1] = CFSTR("WiFiAnalytics");
  v5[2] = kSecAttrAccessGroup;
  v5[3] = kSecClass;
  v6[2] = CFSTR("apple");
  v6[3] = kSecClassGenericPassword;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 4));
  v3 = objc_msgSend(v2, "mutableCopy");

  return v3;
}

- (id)_rotateObscureKey
{
  void *v3;
  void *v4;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  void *v7;
  OSStatus v8;
  void *v9;
  id v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  OSStatus v16;
  id v17;
  _BYTE v18[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));

  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(-[WAEngine _getBasePersistenceKeychainQuery](self, "_getBasePersistenceKeychainQuery"));
  v6 = v5;
  if (!v5)
  {
    v11 = WALogCategoryDefaultHandle();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v18 = 136446466;
      *(_QWORD *)&v18[4] = "-[WAEngine _rotateObscureKey]";
      *(_WORD *)&v18[12] = 1024;
      *(_DWORD *)&v18[14] = 1712;
      v13 = "%{public}s::%d:Failed to get base keychain query for write op";
      v14 = v12;
      v15 = 18;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v13, v18, v15);
    }
LABEL_9:

    goto LABEL_3;
  }
  SecItemDelete(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataUsingEncoding:", 4));
  -[__CFDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v7, kSecValueData);

  -[__CFDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", kSecAttrAccessibleAlways, kSecAttrAccessible);
  v8 = SecItemAdd(v6, 0);
  if (v8)
  {
    v16 = v8;
    v17 = WALogCategoryDefaultHandle();
    v12 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v18 = 136446722;
      *(_QWORD *)&v18[4] = "-[WAEngine _rotateObscureKey]";
      *(_WORD *)&v18[12] = 1024;
      *(_DWORD *)&v18[14] = 1723;
      *(_WORD *)&v18[18] = 1024;
      *(_DWORD *)&v18[20] = v16;
      v13 = "%{public}s::%d:Error back from SecItemUpdate()/SecItemAdd(): %d";
      v14 = v12;
      v15 = 24;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
LABEL_3:
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine _getObscureKey](self, "_getObscureKey", *(_OWORD *)v18, *(_QWORD *)&v18[16]));

  return v9;
}

- (id)_getObscureKey
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  OSStatus v4;
  id v5;
  NSObject *v6;
  id v7;
  id v9;
  const char *v10;
  OSStatus v11;
  id v12;
  NSObject *v13;
  uint32_t v14;
  id v15;
  CFTypeRef result;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  OSStatus v22;

  result = 0;
  v2 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(-[WAEngine _getBasePersistenceKeychainQuery](self, "_getBasePersistenceKeychainQuery"));
  v3 = v2;
  if (!v2)
  {
    v9 = WALogCategoryDefaultHandle();
    v6 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v18 = "-[WAEngine _getObscureKey]";
      v19 = 1024;
      v20 = 1736;
      v10 = "%{public}s::%d:Failed to get base keychain query for read op";
LABEL_12:
      v13 = v6;
      v14 = 18;
      goto LABEL_13;
    }
LABEL_14:
    v7 = 0;
    goto LABEL_5;
  }
  -[__CFDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSecReturnData);
  v4 = SecItemCopyMatching(v3, &result);
  if (v4)
  {
    v11 = v4;
    v12 = WALogCategoryDefaultHandle();
    v6 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v18 = "-[WAEngine _getObscureKey]";
      v19 = 1024;
      v20 = 1741;
      v21 = 1024;
      v22 = v11;
      v10 = "%{public}s::%d:Error back from SecItemCopyMatching(): %d";
      v13 = v6;
      v14 = 24;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v10, buf, v14);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (!result)
  {
    v15 = WALogCategoryDefaultHandle();
    v6 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v18 = "-[WAEngine _getObscureKey]";
      v19 = 1024;
      v20 = 1742;
      v10 = "%{public}s::%d:Keychain didn't return any key data";
      goto LABEL_12;
    }
    goto LABEL_14;
  }
  v5 = objc_alloc((Class)NSString);
  v6 = result;
  v7 = objc_msgSend(v5, "initWithData:encoding:", result, 4);
LABEL_5:

  return v7;
}

- (void)_saveKeyIVData:(id)a3 andTagData:(id)a4
{
  id v5;
  void *v6;
  const __CFDictionary *v7;
  void *v8;
  const __CFDictionary *v9;
  OSStatus v10;
  OSStatus v11;
  OSStatus v12;
  id v13;
  NSObject *v14;
  const char *v15;
  OSStatus v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  OSStatus v24;
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];

  v27[0] = kSecAttrAccount;
  v27[1] = kSecAttrService;
  v28[0] = CFSTR("com.apple.wifi.analytics.persistence-iv");
  v28[1] = CFSTR("WiFiAnalytics");
  v27[2] = kSecAttrAccessGroup;
  v27[3] = kSecAttrAccessible;
  v28[2] = CFSTR("apple");
  v28[3] = kSecAttrAccessibleAlways;
  v27[4] = kSecClass;
  v28[4] = kSecClassGenericPassword;
  v18 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 5));
  v7 = (const __CFDictionary *)objc_msgSend(v6, "mutableCopy");

  v25[0] = kSecAttrAccount;
  v25[1] = kSecAttrService;
  v26[0] = CFSTR("com.apple.wifi.analytics.persistence-tag");
  v26[1] = CFSTR("WiFiAnalytics");
  v25[2] = kSecAttrAccessGroup;
  v25[3] = kSecAttrAccessible;
  v26[2] = CFSTR("apple");
  v26[3] = kSecAttrAccessibleAlways;
  v25[4] = kSecClass;
  v26[4] = kSecClassGenericPassword;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 5));
  v9 = (const __CFDictionary *)objc_msgSend(v8, "mutableCopy");

  SecItemDelete(v7);
  SecItemDelete(v9);
  -[__CFDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v5, kSecValueData);

  -[__CFDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v18, kSecValueData);
  v10 = SecItemAdd(v7, 0);
  if (v10)
  {
    v12 = v10;
    v13 = WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v20 = "-[WAEngine _saveKeyIVData:andTagData:]";
      v21 = 1024;
      v22 = 1779;
      v23 = 1024;
      v24 = v12;
      v15 = "%{public}s::%d:Error back from SecItemUpdate()/SecItemAdd(): %d for IV data";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v15, buf, 0x18u);
    }
LABEL_9:

    goto LABEL_3;
  }
  v11 = SecItemAdd(v9, 0);
  if (v11)
  {
    v16 = v11;
    v17 = WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v20 = "-[WAEngine _saveKeyIVData:andTagData:]";
      v21 = 1024;
      v22 = 1782;
      v23 = 1024;
      v24 = v16;
      v15 = "%{public}s::%d:Error back from SecItemUpdate()/SecItemAdd(): %d for Tag data";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
LABEL_3:

}

- (id)_getDataFromKeychain:(id)a3
{
  id v3;
  void *v4;
  const __CFDictionary *v5;
  OSStatus v6;
  void *v7;
  OSStatus v9;
  id v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  id v15;
  CFTypeRef result;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  _QWORD v22[2];
  _QWORD v23[5];
  _QWORD v24[5];

  v3 = a3;
  result = 0;
  v23[0] = kSecAttrAccount;
  v23[1] = kSecAttrService;
  v24[0] = v3;
  v24[1] = CFSTR("WiFiAnalytics");
  v23[2] = kSecAttrAccessGroup;
  v23[3] = kSecReturnData;
  v24[2] = CFSTR("apple");
  v24[3] = &__kCFBooleanTrue;
  v23[4] = kSecClass;
  v24[4] = kSecClassGenericPassword;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 5));
  v5 = (const __CFDictionary *)objc_msgSend(v4, "mutableCopy");

  v6 = SecItemCopyMatching(v5, &result);
  if (v6)
  {
    v9 = v6;
    v10 = WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v18 = "-[WAEngine _getDataFromKeychain:]";
      v19 = 1024;
      v20 = 1802;
      v21 = 1024;
      LODWORD(v22[0]) = v9;
      WORD2(v22[0]) = 2080;
      *(_QWORD *)((char *)v22 + 6) = "-[WAEngine _getDataFromKeychain:]";
      v12 = "%{public}s::%d:Error back from SecItemCopyMatching(): %d in %s";
      v13 = v11;
      v14 = 34;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
    }
LABEL_9:

    v7 = 0;
    goto LABEL_3;
  }
  v7 = (void *)result;
  if (!result)
  {
    v15 = WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v18 = "-[WAEngine _getDataFromKeychain:]";
      v19 = 1024;
      v20 = 1803;
      v21 = 2112;
      v22[0] = v3;
      v12 = "%{public}s::%d:Keychain didn't return any key data for %@";
      v13 = v11;
      v14 = 28;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
LABEL_3:

  return v7;
}

- (void)_persist
{
  id v3;
  NSObject *v4;
  void *v5;
  int *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t description;
  id v12;
  NSObject *v13;
  const __CFString *v14;
  _BOOL4 readingPersistFile;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  const char *v24;
  NSMutableDictionary *cachedUsage;
  void *v26;
  NSMutableDictionary *v27;
  void *v28;
  void *v29;
  NSString *v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  id v34;
  NSObject *v35;
  NSString *v36;
  void *v37;
  char *v38;
  NSMutableDictionary *v39;
  void *v40;
  void *v41;
  NSString *v42;
  void *v43;
  void *v44;
  unsigned __int8 v45;
  id v46;
  NSObject *v47;
  id v48;
  void *v49;
  NSString *v50;
  void *v51;
  void *v52;
  unsigned __int8 v53;
  id v54;
  NSObject *v55;
  const char *v56;
  NSObject *v57;
  os_log_type_t v58;
  void *v59;
  void *v60;
  void *v61;
  char *v62;
  id v63;
  NSObject *v64;
  id v65;
  NSObject *v66;
  const char *v67;
  void *v68;
  void *v69;
  char *v70;
  id v71;
  NSObject *v72;
  id v73;
  NSObject *v74;
  const char *v75;
  void *v76;
  uint64_t v77;
  char *v78;
  id v79;
  NSObject *v80;
  void *v81;
  void *v82;
  char *v83;
  id v84;
  NSObject *v85;
  id v86;
  NSObject *v87;
  const char *v88;
  id v89;
  NSObject *v90;
  void *v91;
  char *v92;
  void *v93;
  void *v94;
  char *v95;
  id v96;
  NSObject *v97;
  NSString *appleCaptiveServerIP;
  void *v99;
  char *v100;
  id v101;
  NSObject *v102;
  NSString *v103;
  id v104;
  NSObject *v105;
  void *v106;
  id v107;
  NSObject *v108;
  void *v109;
  char *v110;
  void *v111;
  void *v112;
  void *v113;
  char *v114;
  id v115;
  NSObject *v116;
  void *v117;
  id v118;
  NSObject *v119;
  void *v120;
  char *v121;
  void *v122;
  void *v123;
  void *v124;
  char *v125;
  id v126;
  NSObject *v127;
  void *v128;
  unsigned int v129;
  id v130;
  NSObject *v131;
  char *v132;
  void *v133;
  NSObject *v134;
  char *v135;
  id v136;
  NSObject *v137;
  id v138;
  char *v139;
  id v140;
  NSObject *v141;
  char *v142;
  void *v143;
  uint64_t v144;
  char *v145;
  id v146;
  NSObject *v147;
  id v148;
  void *v149;
  char *v150;
  char *v151;
  id v152;
  NSObject *v153;
  void *v154;
  id v155;
  void *v156;
  void *dataOut;
  id v158;
  int v159;
  int v160;
  id v161;
  NSObject *v162;
  id v163;
  NSObject *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  id v169;
  NSObject *v170;
  id v171;
  id v172;
  NSString *v173;
  void *v174;
  void *v175;
  unsigned __int8 v176;
  id v177;
  NSObject *v178;
  NSObject *v179;
  NSString *v180;
  void *v181;
  char *v182;
  const char *v183;
  NSObject *v184;
  os_log_type_t v185;
  NSString *v186;
  id v187;
  NSObject *v188;
  uint64_t v189;
  void *v190;
  id v191;
  id v192;
  NSObject *v193;
  id v194;
  NSObject *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *context;
  void *v204;
  id dataOutMoved;
  id v206;
  id v207;
  id v208;
  id v209;
  id v210;
  id v211;
  id v212;
  id v213;
  id v214;
  id v215;
  id v216;
  id v217;
  char v218;
  uint8_t buf[4];
  const char *v220;
  __int16 v221;
  int v222;
  __int16 v223;
  const char *v224;
  __int16 v225;
  int v226;
  size_t v227[2];
  _BYTE bytes[12];
  _OWORD key[2];
  char v230;

  v3 = WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WAEngine Persist", ", buf, 2u);
  }

  v5 = (void *)os_transaction_create("com.apple.wifianalytics.persist");
  v6 = &OBJC_IVAR___RecommendationPreferences__ior_rescan_new_phy_delay_seconds;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[WAActivityManager sharedActivityManager](WAActivityManager, "sharedActivityManager"));
  objc_msgSend(v7, "osTransactionCreate:transaction:", "com.apple.wifianalytics.persist", v5);

  v8 = v5;
  v9 = WALogCategoryDefaultHandle();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    description = os_transaction_get_description(v8);
    *(_DWORD *)buf = 136446722;
    v220 = "-[WAEngine _persist]";
    v221 = 1024;
    v222 = 1814;
    v223 = 2080;
    v224 = (const char *)description;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Started transaction %s", buf, 0x1Cu);
  }

  v218 = 0;
  if (self->_readingPersistFile || self->_writingPersistFile)
  {
    v12 = WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = CFSTR("reading");
      readingPersistFile = self->_readingPersistFile;
      v220 = "-[WAEngine _persist]";
      *(_DWORD *)buf = 136446722;
      if (!readingPersistFile)
        v14 = CFSTR("writing");
      v221 = 1024;
      v222 = 1820;
      v223 = 2112;
      v224 = (const char *)v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}s::%d:Cannot persist, we're currenlty %@ the persistence file", buf, 0x1Cu);
    }

LABEL_12:
    v16 = WALogCategoryDefaultHandle();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = os_transaction_get_description(v8);
      *(_DWORD *)buf = 136446722;
      v220 = "-[WAEngine _persist]";
      v221 = 1024;
      v222 = 2042;
      v223 = 2080;
      v224 = (const char *)v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Ending transaction %s", buf, 0x1Cu);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6 + 492, "sharedActivityManager"));
    objc_msgSend(v19, "osTransactionComplete:", v8);

    v20 = WALogCategoryDefaultHandle();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v220 = "-[WAEngine _persist]";
      v221 = 1024;
      v222 = 2044;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to persist!", buf, 0x12u);
    }

    v22 = WALogCategoryDefaultHandle();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      v24 = "Failed";
LABEL_18:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WAEngine Persist", v24, buf, 2u);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Persist Calls"), self->_cachedUsage, self->_engineQ);
  -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", CFSTR("Last Persisted Date"));
  cachedUsage = self->_cachedUsage;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[NSMutableDictionary setObject:forKey:](cachedUsage, "setObject:forKey:", v26, CFSTR("Last Persisted Date"));

  -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", CFSTR("Last Persisted PID"));
  v27 = self->_cachedUsage;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", self->_pid));
  -[NSMutableDictionary setObject:forKey:](v27, "setObject:forKey:", v28, CFSTR("Last Persisted PID"));

  -[WAEngine _calculateEstimatedUptime](self, "_calculateEstimatedUptime");
  -[WAEngine _calculateProfileUptime](self, "_calculateProfileUptime");
  -[WAEngine _calculateProcessUsage](self, "_calculateProcessUsage");
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v30 = NSHomeDirectory();
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@t.out"), v31, CFSTR("/Library/com.apple.wifianalyticsd/.wa/")));
  v33 = objc_msgSend(v29, "fileExistsAtPath:", v32);

  if ((v33 & 1) == 0)
  {
    v34 = WALogCategoryDefaultHandle();
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = NSHomeDirectory();
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      v38 = (char *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@t.out"), v37, CFSTR("/Library/com.apple.wifianalyticsd/.wa/")));
      *(_DWORD *)buf = 136446722;
      v220 = "-[WAEngine _persist]";
      v221 = 1024;
      v222 = 1835;
      v223 = 2112;
      v224 = v38;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Persistence file doesnt yet exist %@", buf, 0x1Cu);

    }
    -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", CFSTR("Persist file creation Date"));
    v39 = self->_cachedUsage;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[NSMutableDictionary setObject:forKey:](v39, "setObject:forKey:", v40, CFSTR("Persist file creation Date"));

  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v42 = NSHomeDirectory();
  v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v43, CFSTR("/Library/com.apple.wifianalyticsd/.wa/")));
  v45 = objc_msgSend(v41, "fileExistsAtPath:isDirectory:", v44, &v218);

  if ((v45 & 1) != 0)
  {
    v46 = WALogCategoryDefaultHandle();
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v220 = "-[WAEngine _persist]";
      v221 = 1024;
      v222 = 1849;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Directory for persistence exists...", buf, 0x12u);
    }
    v48 = 0;
  }
  else
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v50 = NSHomeDirectory();
    v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v51, CFSTR("/Library/com.apple.wifianalyticsd/.wa/")));
    v217 = 0;
    v53 = objc_msgSend(v49, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v52, 1, 0, &v217);
    v48 = v217;

    v54 = WALogCategoryDefaultHandle();
    v55 = objc_claimAutoreleasedReturnValue(v54);
    v47 = v55;
    if ((v53 & 1) != 0)
    {
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
        goto LABEL_34;
      *(_DWORD *)buf = 136446466;
      v220 = "-[WAEngine _persist]";
      v221 = 1024;
      v222 = 1845;
      v56 = "%{public}s::%d:Directory for persistence created...";
      v57 = v47;
      v58 = OS_LOG_TYPE_DEBUG;
    }
    else
    {
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        goto LABEL_34;
      *(_DWORD *)buf = 136446466;
      v220 = "-[WAEngine _persist]";
      v221 = 1024;
      v222 = 1843;
      v56 = "%{public}s::%d:Failed to create directory for persistence file";
      v57 = v47;
      v58 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl((void *)&_mh_execute_header, v57, v58, v56, buf, 0x12u);
  }
LABEL_34:

  context = objc_autoreleasePoolPush();
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine cachedUsage](self, "cachedUsage"));
  v216 = v48;
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v60, 1, &v216));
  v62 = (char *)v216;

  if (v62)
  {
    v63 = WALogCategoryDefaultHandle();
    v64 = objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v220 = "-[WAEngine _persist]";
      v221 = 1024;
      v222 = 1858;
      v223 = 2112;
      v224 = v62;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to archive cachedUsage: %@", buf, 0x1Cu);
    }

  }
  if (v61)
  {
    v65 = WALogCategoryDefaultHandle();
    v66 = objc_claimAutoreleasedReturnValue(v65);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
      v67 = (const char *)objc_msgSend(v61, "length");
      *(_DWORD *)buf = 136446722;
      v220 = "-[WAEngine _persist]";
      v221 = 1024;
      v222 = 1862;
      v223 = 2048;
      v224 = v67;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEBUG, "%{public}s::%d:cachedUsage archive size %lu", buf, 0x1Cu);
    }

    objc_msgSend(v59, "setObject:forKey:", v61, CFSTR("WA_PERSIST_USAGE"));
  }
  v201 = v61;
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine messageStore](self, "messageStore"));
  v215 = 0;
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v68, 1, &v215));
  v70 = (char *)v215;

  if (v70)
  {
    v71 = WALogCategoryDefaultHandle();
    v72 = objc_claimAutoreleasedReturnValue(v71);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v220 = "-[WAEngine _persist]";
      v221 = 1024;
      v222 = 1869;
      v223 = 2112;
      v224 = v70;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to archive WAMessageStore: %@", buf, 0x1Cu);
    }

  }
  if (v69)
  {
    v73 = WALogCategoryDefaultHandle();
    v74 = objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
    {
      v75 = (const char *)objc_msgSend(v69, "length");
      *(_DWORD *)buf = 136446722;
      v220 = "-[WAEngine _persist]";
      v221 = 1024;
      v222 = 1874;
      v223 = 2048;
      v224 = v75;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEBUG, "%{public}s::%d:messageStoreData size: %lu", buf, 0x1Cu);
    }

    objc_msgSend(v59, "setObject:forKey:", v69, CFSTR("WA_PERSIST_MESSAGE_STORE"));
  }
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
  v214 = 0;
  v77 = objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v76, 1, &v214));
  v78 = (char *)v214;

  if (v78)
  {
    v79 = WALogCategoryDefaultHandle();
    v80 = objc_claimAutoreleasedReturnValue(v79);
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v220 = "-[WAEngine _persist]";
      v221 = 1024;
      v222 = 1881;
      v223 = 2112;
      v224 = v78;
      _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to archive process registration: %@", buf, 0x1Cu);
    }

  }
  if (v77)
    objc_msgSend(v59, "setObject:forKey:", v77, CFSTR("WA_PERSIST_PROCESS_REGISTRATION"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator"));
  v213 = 0;
  v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v81, 1, &v213));
  v83 = (char *)v213;

  if (v83)
  {
    v84 = WALogCategoryDefaultHandle();
    v85 = objc_claimAutoreleasedReturnValue(v84);
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v220 = "-[WAEngine _persist]";
      v221 = 1024;
      v222 = 1891;
      v223 = 2112;
      v224 = v83;
      _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to archive WAIOReporterPopuator: %@", buf, 0x1Cu);
    }

  }
  if (v82)
  {
    v86 = WALogCategoryDefaultHandle();
    v87 = objc_claimAutoreleasedReturnValue(v86);
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
    {
      v88 = (const char *)objc_msgSend(v82, "length");
      *(_DWORD *)buf = 136446722;
      v220 = "-[WAEngine _persist]";
      v221 = 1024;
      v222 = 1895;
      v223 = 2048;
      v224 = v88;
      _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEBUG, "%{public}s::%d:WAIOReporterPopuator archive size %lu", buf, 0x1Cu);
    }

    objc_msgSend(v59, "setObject:forKey:", v82, CFSTR("WA_PERSIST_IOREPORTER_REGISTRATIONS"));
  }
  v200 = v69;
  v89 = WALogCategoryDefaultHandle();
  v90 = objc_claimAutoreleasedReturnValue(v89);
  if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
  {
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine recommendationEngine](self, "recommendationEngine"));
    v92 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "dpsWDBudgetDict"));
    *(_DWORD *)buf = 136446722;
    v220 = "-[WAEngine _persist]";
    v221 = 1024;
    v222 = 1900;
    v223 = 2112;
    v224 = v92;
    _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:self.recommendationEngine.dpsWDBudgetDict %@", buf, 0x1Cu);

  }
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine recommendationEngine](self, "recommendationEngine"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "dpsWDBudgetDict"));
  v212 = 0;
  v204 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v94, 1, &v212));
  v95 = (char *)v212;

  if (v95)
  {
    v96 = WALogCategoryDefaultHandle();
    v97 = objc_claimAutoreleasedReturnValue(v96);
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v220 = "-[WAEngine _persist]";
      v221 = 1024;
      v222 = 1903;
      v223 = 2112;
      v224 = v95;
      _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to archive dpsWDBudgetData: %@", buf, 0x1Cu);
    }

  }
  if (v204)
    objc_msgSend(v59, "setObject:forKey:", v204, CFSTR("WA_PERSIST_DPS_WD_BUDGET"));
  appleCaptiveServerIP = self->_appleCaptiveServerIP;
  if (appleCaptiveServerIP)
  {
    v211 = 0;
    v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", appleCaptiveServerIP, 1, &v211));
    v100 = (char *)v211;
    v101 = WALogCategoryDefaultHandle();
    v102 = objc_claimAutoreleasedReturnValue(v101);
    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
    {
      v103 = self->_appleCaptiveServerIP;
      *(_DWORD *)buf = 136446722;
      v220 = "-[WAEngine _persist]";
      v221 = 1024;
      v222 = 1912;
      v223 = 2112;
      v224 = (const char *)v103;
      _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:dps/dns: persisting self->_appleCaptiveServerIP %@", buf, 0x1Cu);
    }

    if (v100)
    {
      v104 = WALogCategoryDefaultHandle();
      v105 = objc_claimAutoreleasedReturnValue(v104);
      if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v220 = "-[WAEngine _persist]";
        v221 = 1024;
        v222 = 1914;
        v223 = 2112;
        v224 = v100;
        _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_ERROR, "%{public}s::%d:dps/dns: Failed to archive dnsPersistenceData: %@", buf, 0x1Cu);
      }

    }
    if (v99)
      objc_msgSend(v59, "setObject:forKey:", v99, CFSTR("WA_PERSIST_DNS_PERSISTDATA"));

  }
  v106 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine dpsQuickRecoveryEngine](self, "dpsQuickRecoveryEngine"));

  v198 = v82;
  v199 = (void *)v77;
  if (v106)
  {
    v107 = WALogCategoryDefaultHandle();
    v108 = objc_claimAutoreleasedReturnValue(v107);
    if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
    {
      v109 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine dpsQuickRecoveryEngine](self, "dpsQuickRecoveryEngine"));
      v110 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "dpsQuickRecoveryWDBudgetDict"));
      *(_DWORD *)buf = 136446722;
      v220 = "-[WAEngine _persist]";
      v221 = 1024;
      v222 = 1923;
      v223 = 2112;
      v224 = v110;
      _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:self.dpsQuickRecoveryEngine.dpsQuickRecoveryWDBudgetDict %@", buf, 0x1Cu);

    }
    v111 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine dpsQuickRecoveryEngine](self, "dpsQuickRecoveryEngine"));
    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "dpsQuickRecoveryWDBudgetDict"));
    v210 = 0;
    v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v112, 1, &v210));
    v114 = (char *)v210;

    if (v114)
    {
      v115 = WALogCategoryDefaultHandle();
      v116 = objc_claimAutoreleasedReturnValue(v115);
      if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v220 = "-[WAEngine _persist]";
        v221 = 1024;
        v222 = 1926;
        v223 = 2112;
        v224 = v114;
        _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to archive dpsQuickRecoveryWDBudgetDict: %@", buf, 0x1Cu);
      }

    }
    if (v113)
      objc_msgSend(v59, "setObject:forKey:", v113, CFSTR("WA_PERSIST_DPS_QUICK_RECOVERY_WD_BUDGET"));
    v117 = v59;
    v118 = WALogCategoryDefaultHandle();
    v119 = objc_claimAutoreleasedReturnValue(v118);
    if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
    {
      v120 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine dpsQuickRecoveryEngine](self, "dpsQuickRecoveryEngine"));
      v121 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "dpsStats"));
      *(_DWORD *)buf = 136446722;
      v220 = "-[WAEngine _persist]";
      v221 = 1024;
      v222 = 1934;
      v223 = 2112;
      v224 = v121;
      _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:self.dpsQuickRecoveryEngine.dpsStats %@", buf, 0x1Cu);

    }
    v122 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine dpsQuickRecoveryEngine](self, "dpsQuickRecoveryEngine"));
    v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "dpsStats"));
    v209 = 0;
    v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v123, 1, &v209));
    v125 = (char *)v209;

    v59 = v117;
    if (v125)
    {
      v126 = WALogCategoryDefaultHandle();
      v127 = objc_claimAutoreleasedReturnValue(v126);
      if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v220 = "-[WAEngine _persist]";
        v221 = 1024;
        v222 = 1937;
        v223 = 2112;
        v224 = v125;
        _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to archive dpsStats: %@", buf, 0x1Cu);
      }

    }
    if (v124)
      objc_msgSend(v117, "setObject:forKey:", v124, CFSTR("WA_PERSIST_DPS_QUICK_RECOVERY_STATS"));

  }
  if (self->_infraInterfaceName
    && (v128 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine infraInterfaceName](self, "infraInterfaceName")),
        v129 = objc_msgSend(v128, "isEqualToString:", CFSTR("dunno")),
        v128,
        v129))
  {
    v130 = WALogCategoryDefaultHandle();
    v131 = objc_claimAutoreleasedReturnValue(v130);
    if (os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG))
    {
      v132 = (char *)objc_claimAutoreleasedReturnValue(-[WAEngine infraInterfaceName](self, "infraInterfaceName"));
      *(_DWORD *)buf = 136446722;
      v220 = "-[WAEngine _persist]";
      v221 = 1024;
      v222 = 1947;
      v223 = 2112;
      v224 = v132;
      _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_DEBUG, "%{public}s::%d:self.infrainterfacename %@", buf, 0x1Cu);

    }
    v133 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine infraInterfaceName](self, "infraInterfaceName"));
    v208 = 0;
    v134 = objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v133, 1, &v208));
    v135 = (char *)v208;

    if (v135)
    {
      v136 = WALogCategoryDefaultHandle();
      v137 = objc_claimAutoreleasedReturnValue(v136);
      if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v220 = "-[WAEngine _persist]";
        v221 = 1024;
        v222 = 1950;
        v223 = 2112;
        v224 = v135;
        _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to archive infraInterfaceName: %@", buf, 0x1Cu);
      }

    }
    if (v134)
      objc_msgSend(v59, "setObject:forKey:", v134, CFSTR("WA_PERSIST_INFRA_INTERFACE"));
  }
  else
  {
    v138 = WALogCategoryDefaultHandle();
    v134 = objc_claimAutoreleasedReturnValue(v138);
    if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
    {
      v139 = (char *)objc_claimAutoreleasedReturnValue(-[WAEngine infraInterfaceName](self, "infraInterfaceName"));
      *(_DWORD *)buf = 136446722;
      v220 = "-[WAEngine _persist]";
      v221 = 1024;
      v222 = 1957;
      v223 = 2112;
      v224 = v139;
      _os_log_impl((void *)&_mh_execute_header, v134, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:self.infrainterfacename is %@, not persisting", buf, 0x1Cu);

    }
  }

  v140 = WALogCategoryDefaultHandle();
  v141 = objc_claimAutoreleasedReturnValue(v140);
  if (os_log_type_enabled(v141, OS_LOG_TYPE_DEBUG))
  {
    v142 = (char *)objc_claimAutoreleasedReturnValue(-[WAEngine wifiChipSet](self, "wifiChipSet"));
    *(_DWORD *)buf = 136446722;
    v220 = "-[WAEngine _persist]";
    v221 = 1024;
    v222 = 1961;
    v223 = 2112;
    v224 = v142;
    _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_DEBUG, "%{public}s::%d:self.wifiChipSet %@", buf, 0x1Cu);

  }
  v143 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine wifiChipSet](self, "wifiChipSet"));
  v207 = 0;
  v144 = objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v143, 1, &v207));
  v145 = (char *)v207;

  if (v145)
  {
    v146 = WALogCategoryDefaultHandle();
    v147 = objc_claimAutoreleasedReturnValue(v146);
    if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v220 = "-[WAEngine _persist]";
      v221 = 1024;
      v222 = 1964;
      v223 = 2112;
      v224 = v145;
      _os_log_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to archive wifiChipSet: %@", buf, 0x1Cu);
    }

  }
  if (v144)
    objc_msgSend(v59, "setObject:forKey:", v144, CFSTR("WA_PERSIST_CHIPSET"));
  v148 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s%s%s"), "WiFiAnalytics_executables-605.84", "\"WiFiAnalytics_executables-605.84\", "Aug 13 2024 20:10:36");
  objc_msgSend(v59, "setObject:forKey:", v148, CFSTR("WA_BUILD_VERSION_PERSIST_KEY"));

  v206 = 0;
  v202 = v59;
  v149 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v59, 1, &v206));
  v150 = (char *)v206;
  if (v150)
  {
    v151 = v150;
    v152 = WALogCategoryDefaultHandle();
    v153 = objc_claimAutoreleasedReturnValue(v152);
    if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v220 = "-[WAEngine _persist]";
      v221 = 1024;
      v222 = 1976;
      v223 = 2112;
      v224 = v151;
      _os_log_impl((void *)&_mh_execute_header, v153, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to archive root persistence dictionary: %@", buf, 0x1Cu);
    }

  }
  v154 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine _rotateObscureKey](self, "_rotateObscureKey"));
  memset(key, 0, sizeof(key));
  v230 = 0;
  objc_msgSend(v154, "getCString:maxLength:encoding:", key, 33, 4);
  v155 = objc_msgSend(v149, "length");
  dataOutMoved = 0;
  v156 = malloc_type_malloc((size_t)v155 + 16, 0x7FCA02F4uLL);
  v197 = (void *)v144;
  if (!v156)
  {
    v192 = WALogCategoryDefaultHandle();
    v193 = objc_claimAutoreleasedReturnValue(v192);
    if (os_log_type_enabled(v193, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v220 = "-[WAEngine _persist]";
      v221 = 1024;
      v222 = 1994;
      _os_log_impl((void *)&_mh_execute_header, v193, OS_LOG_TYPE_ERROR, "%{public}s::%d:malloc failed during persistence", buf, 0x12u);
    }

    goto LABEL_152;
  }
  dataOut = v156;
  if (CCRandomGenerateBytes(bytes, 0xCuLL))
  {
    v194 = WALogCategoryDefaultHandle();
    v195 = objc_claimAutoreleasedReturnValue(v194);
    if (os_log_type_enabled(v195, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v220 = "-[WAEngine _persist]";
      v221 = 1024;
      v222 = 1999;
      v223 = 2080;
      v224 = "-[WAEngine _persist]";
      _os_log_impl((void *)&_mh_execute_header, v195, OS_LOG_TYPE_ERROR, "%{public}s::%d:CCRandomGenerateBytes failed in %s", buf, 0x1Cu);
    }

    free(dataOut);
LABEL_152:
    v165 = v201;
    v166 = v198;
LABEL_153:

    objc_autoreleasePoolPop(context);
    goto LABEL_12;
  }
  v196 = v154;
  v158 = objc_retainAutorelease(v149);
  v159 = CCCryptorGCMOneshotEncrypt(0, key, 32, bytes, 12, 0, 0, objc_msgSend(v158, "bytes"), v155, dataOut, v227, 16);
  if (v159)
  {
    v160 = v159;
    v161 = WALogCategoryDefaultHandle();
    v162 = objc_claimAutoreleasedReturnValue(v161);
    if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v220 = "-[WAEngine _persist]";
      v221 = 1024;
      v222 = 2014;
      v223 = 2080;
      v224 = "-[WAEngine _persist]";
      v225 = 1024;
      v226 = v160;
      _os_log_impl((void *)&_mh_execute_header, v162, OS_LOG_TYPE_ERROR, "%{public}s::%d:%s: CCCryptorGCMOneshotEncrypt failed with error %d", buf, 0x22u);
    }

    v6 = &OBJC_IVAR___RecommendationPreferences__ior_rescan_new_phy_delay_seconds;
    if (CCCrypt(0, 0, 1u, key, 0x20uLL, 0, objc_msgSend(objc_retainAutorelease(v158), "bytes"), (size_t)v155, dataOut, (size_t)v155 + 16, (size_t *)&dataOutMoved))
    {
      v163 = WALogCategoryDefaultHandle();
      v164 = objc_claimAutoreleasedReturnValue(v163);
      if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v220 = "-[WAEngine _persist]";
        v221 = 1024;
        v222 = 2019;
        _os_log_impl((void *)&_mh_execute_header, v164, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to obscure file", buf, 0x12u);
      }

      free(dataOut);
      v165 = v201;
      v166 = v198;
      v154 = v196;
      goto LABEL_153;
    }
  }
  else
  {
    v167 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", bytes, 12));
    v168 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v227, 16));
    v169 = WALogCategoryDefaultHandle();
    v170 = objc_claimAutoreleasedReturnValue(v169);
    if (os_log_type_enabled(v170, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v220 = "-[WAEngine _persist]";
      v221 = 1024;
      v222 = 2007;
      v223 = 2080;
      v224 = "-[WAEngine _persist]";
      _os_log_impl((void *)&_mh_execute_header, v170, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s: writing IV and tag data", buf, 0x1Cu);
    }

    -[WAEngine _saveKeyIVData:andTagData:](self, "_saveKeyIVData:andTagData:", v167, v168);
    dataOutMoved = v155;

  }
  v171 = objc_alloc((Class)NSData);
  v172 = objc_msgSend(v171, "initWithBytes:length:", dataOut, dataOutMoved);
  free(dataOut);
  self->_writingPersistFile = 1;
  v173 = NSHomeDirectory();
  v174 = (void *)objc_claimAutoreleasedReturnValue(v173);
  v175 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@t.out"), v174, CFSTR("/Library/com.apple.wifianalyticsd/.wa/")));
  v176 = objc_msgSend(v172, "writeToFile:atomically:", v175, 1);

  v177 = WALogCategoryDefaultHandle();
  v178 = objc_claimAutoreleasedReturnValue(v177);
  v179 = v178;
  if ((v176 & 1) != 0)
  {
    if (!os_log_type_enabled(v178, OS_LOG_TYPE_DEFAULT))
      goto LABEL_142;
    v180 = NSHomeDirectory();
    v181 = (void *)objc_claimAutoreleasedReturnValue(v180);
    v182 = (char *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@t.out"), v181, CFSTR("/Library/com.apple.wifianalyticsd/.wa/")));
    *(_DWORD *)buf = 136446722;
    v220 = "-[WAEngine _persist]";
    v221 = 1024;
    v222 = 2030;
    v223 = 2112;
    v224 = v182;
    v183 = "%{public}s::%d:Wrote persistence file %@";
    v184 = v179;
    v185 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    if (!os_log_type_enabled(v178, OS_LOG_TYPE_ERROR))
      goto LABEL_142;
    v186 = NSHomeDirectory();
    v181 = (void *)objc_claimAutoreleasedReturnValue(v186);
    v182 = (char *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@t.out"), v181, CFSTR("/Library/com.apple.wifianalyticsd/.wa/")));
    *(_DWORD *)buf = 136446722;
    v220 = "-[WAEngine _persist]";
    v221 = 1024;
    v222 = 2028;
    v223 = 2112;
    v224 = v182;
    v183 = "%{public}s::%d:Failed to write persistence file %@";
    v184 = v179;
    v185 = OS_LOG_TYPE_ERROR;
  }
  _os_log_impl((void *)&_mh_execute_header, v184, v185, v183, buf, 0x1Cu);

LABEL_142:
  self->_writingPersistFile = 0;

  objc_autoreleasePoolPop(context);
  v187 = WALogCategoryDefaultHandle();
  v188 = objc_claimAutoreleasedReturnValue(v187);
  if (os_log_type_enabled(v188, OS_LOG_TYPE_DEBUG))
  {
    v189 = os_transaction_get_description(v8);
    *(_DWORD *)buf = 136446722;
    v220 = "-[WAEngine _persist]";
    v221 = 1024;
    v222 = 2035;
    v223 = 2080;
    v224 = (const char *)v189;
    _os_log_impl((void *)&_mh_execute_header, v188, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Ending transaction %s", buf, 0x1Cu);
  }

  v190 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6 + 492, "sharedActivityManager"));
  objc_msgSend(v190, "osTransactionComplete:", v8);

  v191 = WALogCategoryDefaultHandle();
  v23 = objc_claimAutoreleasedReturnValue(v191);
  if (os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    v24 = "";
    goto LABEL_18;
  }
LABEL_19:

}

- (void)_unpersist
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t description;
  void *v11;
  id v12;
  NSObject *v13;
  NSString *v14;
  void *v15;
  char *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  char *v21;
  void *v22;
  id v23;
  _UNKNOWN **v24;
  void *v25;
  size_t v26;
  size_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _DWORD *v31;
  int v32;
  void *v33;
  CCCryptorStatus v34;
  id v35;
  NSObject *v36;
  void *v37;
  id v38;
  NSObject *v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSSet *v50;
  void *v51;
  char *v52;
  id v53;
  NSObject *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  unsigned __int8 v60;
  void *v61;
  id v62;
  NSObject *v63;
  void *v64;
  id v65;
  NSObject *v66;
  const char *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSSet *v72;
  void *v73;
  id v74;
  char *v75;
  id v76;
  NSObject *v77;
  void *v78;
  id v79;
  NSObject *v80;
  const char *v81;
  void *v82;
  NSSet *v83;
  void *v84;
  void *v85;
  char *v86;
  id v87;
  NSObject *v88;
  id v89;
  NSObject *v90;
  char *v91;
  void *v92;
  id v93;
  NSObject *v94;
  const char *v95;
  void *v96;
  NSSet *v97;
  void *v98;
  void *v99;
  char *v100;
  id v101;
  NSObject *v102;
  id v103;
  NSObject *v104;
  char *v105;
  void *v106;
  id v107;
  NSObject *v108;
  const char *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  NSSet *v114;
  void *v115;
  uint64_t v116;
  char *v117;
  id v118;
  NSObject *v119;
  int v120;
  id v121;
  void *v122;
  id v123;
  NSObject *v124;
  void *v125;
  char *v126;
  void *v127;
  id v128;
  NSObject *v129;
  const char *v130;
  void *v131;
  NSSet *v132;
  void *v133;
  char *v134;
  id v135;
  NSObject *v136;
  id v137;
  NSObject *v138;
  NSString *appleCaptiveServerIP;
  void *v140;
  void *v141;
  id v142;
  NSObject *v143;
  const char *v144;
  void *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  NSSet *v149;
  void *v150;
  void *v151;
  char *v152;
  id v153;
  NSObject *v154;
  id v155;
  void *v156;
  id v157;
  NSObject *v158;
  void *v159;
  char *v160;
  void *v161;
  id v162;
  NSObject *v163;
  const char *v164;
  void *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  NSSet *v169;
  void *v170;
  char *v171;
  id v172;
  NSObject *v173;
  id v174;
  int v175;
  void *v176;
  id v177;
  NSObject *v178;
  void *v179;
  char *v180;
  void *v181;
  id v182;
  NSObject *v183;
  const char *v184;
  void *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  NSSet *v191;
  void *v192;
  WAMessageAWDStore *v193;
  char *v194;
  id v195;
  NSObject *v196;
  void *v197;
  id v198;
  NSObject *v199;
  const char *v200;
  void *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  NSSet *v207;
  void *v208;
  id v209;
  char *v210;
  id v211;
  NSObject *v212;
  void *v213;
  id v214;
  NSObject *v215;
  const char *v216;
  void *v217;
  id v218;
  WAIOReporterMessagePopulator *v219;
  char *v220;
  char *v221;
  id v222;
  NSObject *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  id v228;
  id v229;
  uint64_t v230;
  void *i;
  uint64_t v232;
  void *v233;
  void *v234;
  id v235;
  id v236;
  uint64_t v237;
  void *j;
  id v239;
  NSObject *v240;
  uint64_t v241;
  void *v242;
  id v243;
  NSObject *v244;
  id v245;
  NSObject *v246;
  id v247;
  NSObject *v248;
  id v249;
  NSObject *v250;
  size_t dataOutAvailable;
  uint64_t v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  uint64_t v258;
  void *v259;
  void *v260;
  id obj;
  id obja;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *dataOut;
  void *v272;
  void *v273;
  void *v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  id v283;
  id v284;
  id v285;
  id v286;
  id v287;
  id v288;
  id v289;
  id v290;
  id v291;
  id v292;
  id v293;
  id v294;
  size_t v295;
  _BYTE v296[128];
  _BYTE v297[128];
  _BYTE buf[18];
  __int16 v299;
  const char *v300;
  __int16 v301;
  CCCryptorStatus v302;
  uint64_t v303;
  int v304;
  _OWORD key[2];
  char v306;

  v3 = WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WAEngine Unpersist", ", buf, 2u);
  }

  v5 = (void *)os_transaction_create("com.apple.wifianalytics.unpersist");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[WAActivityManager sharedActivityManager](WAActivityManager, "sharedActivityManager"));
  objc_msgSend(v6, "osTransactionCreate:transaction:", "com.apple.wifianalytics.unpersist", v5);

  v7 = v5;
  v8 = WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    description = os_transaction_get_description(v7);
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2052;
    v299 = 2080;
    v300 = (const char *)description;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Started transaction %s", buf, 0x1Cu);
  }
  v257 = v7;

  v11 = objc_autoreleasePoolPush();
  v295 = 0;
  v273 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine _getObscureKey](self, "_getObscureKey"));
  self->_readingPersistFile = 1;
  v12 = WALogCategoryDefaultHandle();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = NSHomeDirectory();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (char *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@t.out"), v15, CFSTR("/Library/com.apple.wifianalyticsd/.wa/")));
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2083;
    v299 = 2112;
    v300 = v16;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Reading persistence file %@", buf, 0x1Cu);

  }
  v17 = NSHomeDirectory();
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@t.out"), v18, CFSTR("/Library/com.apple.wifianalyticsd/.wa/")));
  v294 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v19, 1, &v294));
  v21 = (char *)v294;

  v22 = v20;
  v23 = objc_msgSend(v20, "length");
  v306 = 0;
  v24 = &AnalyticsSendEventLazy_ptr;
  memset(key, 0, sizeof(key));
  if (!v20)
  {
    self->_persistFileExistedAtPIDLoad = 0;
    v35 = WALogCategoryDefaultHandle();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2097;
      v299 = 2112;
      v300 = v21;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:No persistence file, likely first run after boot (err:%@)", buf, 0x1Cu);
    }

    v25 = v273;
    goto LABEL_16;
  }
  self->_persistFileExistedAtPIDLoad = 1;
  v25 = v273;
  if (!v273)
  {
    v245 = WALogCategoryDefaultHandle();
    v246 = objc_claimAutoreleasedReturnValue(v245);
    if (os_log_type_enabled(v246, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2098;
      _os_log_impl((void *)&_mh_execute_header, v246, OS_LOG_TYPE_ERROR, "%{public}s::%d:Couldn't get key to unobscure persistence file...", buf, 0x12u);
    }

    -[WAEngine _removePersistenceFile](self, "_removePersistenceFile");
    goto LABEL_16;
  }
  v26 = (size_t)v23;
  v269 = v11;
  v27 = (size_t)v23 + 16;
  objc_msgSend(v273, "getCString:maxLength:encoding:", key, 33, 4);
  dataOut = malloc_type_malloc(v27, 0xD432CFF6uLL);
  if (!dataOut)
  {
    v247 = WALogCategoryDefaultHandle();
    v248 = objc_claimAutoreleasedReturnValue(v247);
    v11 = v269;
    if (os_log_type_enabled(v248, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2102;
      _os_log_impl((void *)&_mh_execute_header, v248, OS_LOG_TYPE_ERROR, "%{public}s::%d:Couldn't allocate buffer to unobscure persistence data", buf, 0x12u);
    }

LABEL_16:
    v37 = 0;
    v253 = 0;
    v254 = 0;
    goto LABEL_38;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine _getDataFromKeychain:](self, "_getDataFromKeychain:", CFSTR("com.apple.wifi.analytics.persistence-iv")));
  v29 = objc_claimAutoreleasedReturnValue(-[WAEngine _getDataFromKeychain:](self, "_getDataFromKeychain:", CFSTR("com.apple.wifi.analytics.persistence-tag")));
  v263 = v28;
  v267 = (void *)v29;
  if (v28 && v29)
  {
    v30 = (void *)v29;
    v31 = objc_msgSend(objc_retainAutorelease(v28), "bytes");
    v32 = v31[2];
    v303 = *(_QWORD *)v31;
    v304 = v32;
    *(_OWORD *)buf = *(_OWORD *)objc_msgSend(objc_retainAutorelease(v30), "bytes");
    v33 = dataOut;
    v34 = CCCryptorGCMOneshotDecrypt(0, key, 32, &v303, 12, 0, 0, objc_msgSend(objc_retainAutorelease(v22), "bytes"), v26, dataOut, buf, 16);
    v295 = v26;
  }
  else
  {
    v38 = WALogCategoryDefaultHandle();
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2120;
      v299 = 2080;
      v300 = "-[WAEngine _unpersist]";
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s: IV and tag not found", buf, 0x1Cu);
    }

    dataOutAvailable = v27;
    v33 = dataOut;
    v34 = CCCrypt(1u, 0, 1u, key, 0x20uLL, 0, objc_msgSend(objc_retainAutorelease(v22), "bytes"), v26, dataOut, dataOutAvailable, &v295);
  }
  self->_readingPersistFile = 0;
  if (v34)
  {
    v249 = WALogCategoryDefaultHandle();
    v250 = objc_claimAutoreleasedReturnValue(v249);
    if (os_log_type_enabled(v250, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2127;
      v299 = 2080;
      v300 = "-[WAEngine _unpersist]";
      v301 = 1024;
      v302 = v34;
      _os_log_impl((void *)&_mh_execute_header, v250, OS_LOG_TYPE_ERROR, "%{public}s::%d:%s: Failed to unobscure: %d", buf, 0x22u);
    }

    free(v33);
    v265 = 0;
    v253 = 0;
    v254 = 0;
    v37 = 0;
    v11 = v269;
  }
  else
  {
    obj = v22;
    v40 = objc_alloc((Class)NSData);
    v41 = objc_msgSend(v40, "initWithBytes:length:", v33, v295);
    v258 = objc_opt_class(WAMessageAWD);
    v42 = objc_opt_class(NSError);
    v43 = objc_opt_class(NSString);
    v44 = v21;
    v45 = objc_opt_class(WAField);
    v46 = objc_opt_class(NSMutableDictionary);
    v47 = objc_opt_class(NSDictionary);
    v48 = objc_opt_class(NSData);
    v49 = objc_opt_class(NSMutableArray);
    v252 = v45;
    v21 = v44;
    v50 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v258, v42, v43, v252, v46, v47, v48, v49, objc_opt_class(NSNumber), 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
    v293 = 0;
    v265 = v41;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v51, v41, &v293));
    v52 = (char *)v293;

    v11 = v269;
    if (v52)
    {
      v53 = WALogCategoryDefaultHandle();
      v54 = objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2133;
        v299 = 2112;
        v300 = v52;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive root persistence dict: %@", buf, 0x1Cu);
      }

    }
    free(dataOut);
    v22 = obj;
    if (v37)
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("WA_BUILD_VERSION_PERSIST_KEY")));

      if (v55)
      {
        v56 = objc_alloc((Class)NSString);
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("WA_BUILD_VERSION_PERSIST_KEY")));
        v58 = objc_msgSend(v56, "initWithFormat:", CFSTR("%@"), v57);

        v59 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s%s%s"), "WiFiAnalytics_executables-605.84", "\"WiFiAnalytics_executables-605.84\", "Aug 13 2024 20:10:36");
        v254 = v59;
        if (v58)
        {
          v253 = v58;
          v60 = objc_msgSend(v58, "isEqual:", v59);
          v24 = &AnalyticsSendEventLazy_ptr;
          v25 = v273;
          v61 = v263;
          if ((v60 & 1) != 0)
            goto LABEL_37;
LABEL_34:
          -[WAEngine _removePersistenceFile](self, "_removePersistenceFile");

          v62 = WALogCategoryDefaultHandle();
          v63 = objc_claimAutoreleasedReturnValue(v62);
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 2148;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "%{public}s::%d:Detected out of date persistence file, removing it and abandoning unpersist attempt...", buf, 0x12u);
          }

          v37 = 0;
          goto LABEL_37;
        }
      }
      else
      {
        v254 = 0;
      }
      v253 = 0;
      v24 = &AnalyticsSendEventLazy_ptr;
      v25 = v273;
      v61 = v263;
      goto LABEL_34;
    }
    v253 = 0;
    v254 = 0;
    v24 = &AnalyticsSendEventLazy_ptr;
    v25 = v273;
  }
  v61 = v263;
LABEL_37:

LABEL_38:
  objc_autoreleasePoolPop(v11);
  self->_readingPersistFile = 0;
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("WA_PERSIST_USAGE")));
  v65 = WALogCategoryDefaultHandle();
  v66 = objc_claimAutoreleasedReturnValue(v65);
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
  {
    v67 = (const char *)objc_msgSend(v64, "length");
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2157;
    v299 = 2048;
    v300 = v67;
    _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEBUG, "%{public}s::%d:usageData size: %lu", buf, 0x1Cu);
  }

  v274 = v37;
  v270 = v64;
  if (!v64)
    goto LABEL_46;
  v68 = v24[103];
  v69 = objc_opt_class(NSMutableDictionary);
  v70 = objc_opt_class(NSNumber);
  v71 = objc_opt_class(NSDate);
  v72 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v69, v70, v71, objc_opt_class(NSString), 0);
  v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
  v292 = 0;
  v74 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "unarchivedObjectOfClasses:fromData:error:", v73, v64, &v292));
  v75 = (char *)v292;

  if (v75)
  {
    v76 = WALogCategoryDefaultHandle();
    v77 = objc_claimAutoreleasedReturnValue(v76);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2161;
      v299 = 2112;
      v300 = v75;
      _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive usageData: %@", buf, 0x1Cu);
    }

  }
  v37 = v274;
  if (!v74)
LABEL_46:
    v74 = objc_alloc_init((Class)NSMutableDictionary);
  -[WAEngine setCachedUsage:](self, "setCachedUsage:", v74);

  -[WAEngine _handleUnpersistForUsageData](self, "_handleUnpersistForUsageData");
  +[WAUtil logNestedDictionary:indent:prefix:](WAUtil, "logNestedDictionary:indent:prefix:", self->_cachedUsage, 0, CFSTR("Unpersist engine _cachedUsage"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("WA_PERSIST_CHIPSET")));
  v79 = WALogCategoryDefaultHandle();
  v80 = objc_claimAutoreleasedReturnValue(v79);
  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
  {
    v81 = (const char *)objc_msgSend(v78, "length");
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2174;
    v299 = 2048;
    v300 = v81;
    _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEBUG, "%{public}s::%d:wifiChipSetData size: %lu", buf, 0x1Cu);
  }

  v268 = v78;
  if (!v78)
    goto LABEL_55;
  v82 = v24[103];
  v83 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSString), 0);
  v84 = (void *)objc_claimAutoreleasedReturnValue(v83);
  v291 = 0;
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "unarchivedObjectOfClasses:fromData:error:", v84, v78, &v291));
  v86 = (char *)v291;

  if (v86)
  {
    v87 = WALogCategoryDefaultHandle();
    v88 = objc_claimAutoreleasedReturnValue(v87);
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2178;
      v299 = 2112;
      v300 = v86;
      _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive wifiChipSet: %@", buf, 0x1Cu);
    }

  }
  if (!v85)
LABEL_55:
    v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", &stru_1000CF640));
  -[WAEngine setWifiChipSet:](self, "setWifiChipSet:", v85);

  v89 = WALogCategoryDefaultHandle();
  v90 = objc_claimAutoreleasedReturnValue(v89);
  if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
  {
    v91 = (char *)objc_claimAutoreleasedReturnValue(-[WAEngine wifiChipSet](self, "wifiChipSet"));
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2184;
    v299 = 2112;
    v300 = v91;
    _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:self.wifiChipSet %@", buf, 0x1Cu);

  }
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("WA_PERSIST_INFRA_INTERFACE")));
  v93 = WALogCategoryDefaultHandle();
  v94 = objc_claimAutoreleasedReturnValue(v93);
  if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
  {
    v95 = (const char *)objc_msgSend(v92, "length");
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2187;
    v299 = 2048;
    v300 = v95;
    _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEBUG, "%{public}s::%d:infraInterfaceNameData size: %lu", buf, 0x1Cu);
  }

  v266 = v92;
  if (!v92)
    goto LABEL_66;
  v96 = v24[103];
  v97 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSString), 0);
  v98 = (void *)objc_claimAutoreleasedReturnValue(v97);
  v290 = 0;
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "unarchivedObjectOfClasses:fromData:error:", v98, v92, &v290));
  v100 = (char *)v290;

  if (v100)
  {
    v101 = WALogCategoryDefaultHandle();
    v102 = objc_claimAutoreleasedReturnValue(v101);
    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2191;
      v299 = 2112;
      v300 = v100;
      _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive infraInterfaceName: %@", buf, 0x1Cu);
    }

  }
  if (!v99)
LABEL_66:
    v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("dunno")));
  -[WAEngine setInfraInterfaceName:](self, "setInfraInterfaceName:", v99);

  v103 = WALogCategoryDefaultHandle();
  v104 = objc_claimAutoreleasedReturnValue(v103);
  if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
  {
    v105 = (char *)objc_claimAutoreleasedReturnValue(-[WAEngine infraInterfaceName](self, "infraInterfaceName"));
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2197;
    v299 = 2112;
    v300 = v105;
    _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:self.infraInterfaceName %@", buf, 0x1Cu);

  }
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("WA_PERSIST_DPS_WD_BUDGET")));
  v107 = WALogCategoryDefaultHandle();
  v108 = objc_claimAutoreleasedReturnValue(v107);
  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
  {
    v109 = (const char *)objc_msgSend(v106, "length");
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2201;
    v299 = 2048;
    v300 = v109;
    _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEBUG, "%{public}s::%d:dpsWDBudgetData size: %lu", buf, 0x1Cu);
  }

  v264 = v106;
  if (!v106)
    goto LABEL_78;
  v110 = v24[103];
  v111 = objc_opt_class(NSMutableDictionary);
  v112 = objc_opt_class(NSNumber);
  v113 = objc_opt_class(NSDate);
  v114 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v111, v112, v113, objc_opt_class(NSString), 0);
  v115 = (void *)objc_claimAutoreleasedReturnValue(v114);
  v289 = 0;
  v116 = objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "unarchivedObjectOfClasses:fromData:error:", v115, v264, &v289));
  v117 = (char *)v289;

  if (v117)
  {
    v118 = WALogCategoryDefaultHandle();
    v119 = objc_claimAutoreleasedReturnValue(v118);
    if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2205;
      v299 = 2112;
      v300 = v117;
      _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive dpsWDBudgetData: %@", buf, 0x1Cu);
    }

  }
  v37 = v274;
  if (v116)
  {
    v120 = 0;
    v121 = (id)v116;
  }
  else
  {
LABEL_78:
    v121 = objc_alloc_init((Class)NSMutableDictionary);
    v116 = 0;
    v120 = 1;
  }
  v272 = (void *)v116;
  v122 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine recommendationEngine](self, "recommendationEngine"));
  objc_msgSend(v122, "setDpsWDBudgetDict:", v121);

  if (v120)
  v123 = WALogCategoryDefaultHandle();
  v124 = objc_claimAutoreleasedReturnValue(v123);
  if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
  {
    v125 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine recommendationEngine](self, "recommendationEngine"));
    v126 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "dpsWDBudgetDict"));
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2212;
    v299 = 2112;
    v300 = v126;
    _os_log_impl((void *)&_mh_execute_header, v124, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:self.recommendationEngine.dpsWDBudgetDict %@", buf, 0x1Cu);

  }
  v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("WA_PERSIST_DNS_PERSISTDATA")));
  v128 = WALogCategoryDefaultHandle();
  v129 = objc_claimAutoreleasedReturnValue(v128);
  if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
  {
    v130 = (const char *)objc_msgSend(v127, "length");
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2215;
    v299 = 2048;
    v300 = v130;
    _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:dps/dns: unpersisting dnsPersistenceData size: %lu", buf, 0x1Cu);
  }

  if (v127)
  {
    v131 = v24[103];
    v132 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSString), 0);
    v133 = (void *)objc_claimAutoreleasedReturnValue(v132);
    v288 = 0;
    obja = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "unarchivedObjectOfClasses:fromData:error:", v133, v127, &v288));
    v134 = (char *)v288;

    if (v134)
    {
      v135 = WALogCategoryDefaultHandle();
      v136 = objc_claimAutoreleasedReturnValue(v135);
      if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2219;
        v299 = 2112;
        v300 = v134;
        _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_ERROR, "%{public}s::%d:dps/dns: Failed to unarchive captiveServerIP: %@", buf, 0x1Cu);
      }

    }
    objc_storeStrong((id *)&self->_appleCaptiveServerIP, obja);
    v137 = WALogCategoryDefaultHandle();
    v138 = objc_claimAutoreleasedReturnValue(v137);
    if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
    {
      appleCaptiveServerIP = self->_appleCaptiveServerIP;
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2223;
      v299 = 2112;
      v300 = (const char *)appleCaptiveServerIP;
      _os_log_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:dps/dns: setting self->_appleCaptiveServerIP:%@", buf, 0x1Cu);
    }

  }
  else
  {
    -[WAEngine resolveAppleCaptiveServer](self, "resolveAppleCaptiveServer");
    obja = 0;
  }
  v140 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine dpsQuickRecoveryEngine](self, "dpsQuickRecoveryEngine"));

  v256 = v127;
  if (v140)
  {
    v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("WA_PERSIST_DPS_QUICK_RECOVERY_WD_BUDGET")));
    v142 = WALogCategoryDefaultHandle();
    v143 = objc_claimAutoreleasedReturnValue(v142);
    if (os_log_type_enabled(v143, OS_LOG_TYPE_DEBUG))
    {
      v144 = (const char *)objc_msgSend(v141, "length");
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2232;
      v299 = 2048;
      v300 = v144;
      _os_log_impl((void *)&_mh_execute_header, v143, OS_LOG_TYPE_DEBUG, "%{public}s::%d:dpsQuickRecoveryWDBudgetData size: %lu", buf, 0x1Cu);
    }

    if (v141)
    {
      v145 = v24[103];
      v146 = objc_opt_class(NSMutableDictionary);
      v147 = objc_opt_class(NSNumber);
      v148 = objc_opt_class(NSDate);
      v149 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v146, v147, v148, objc_opt_class(NSString), 0);
      v150 = (void *)objc_claimAutoreleasedReturnValue(v149);
      v287 = 0;
      v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "unarchivedObjectOfClasses:fromData:error:", v150, v141, &v287));
      v152 = (char *)v287;

      if (v152)
      {
        v153 = WALogCategoryDefaultHandle();
        v154 = objc_claimAutoreleasedReturnValue(v153);
        if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 2236;
          v299 = 2112;
          v300 = v152;
          _os_log_impl((void *)&_mh_execute_header, v154, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive dpsQuickRecoveryWDBudgetData: %@", buf, 0x1Cu);
        }

      }
      v24 = &AnalyticsSendEventLazy_ptr;
    }
    else
    {
      v151 = v272;
    }
    v155 = v151;
    if (!v151)
      v155 = objc_alloc_init((Class)NSMutableDictionary);
    v156 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine dpsQuickRecoveryEngine](self, "dpsQuickRecoveryEngine"));
    objc_msgSend(v156, "setDpsQuickRecoveryWDBudgetDict:", v155);

    if (!v151)
    v157 = WALogCategoryDefaultHandle();
    v158 = objc_claimAutoreleasedReturnValue(v157);
    if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
    {
      v159 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine dpsQuickRecoveryEngine](self, "dpsQuickRecoveryEngine"));
      v160 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "dpsQuickRecoveryWDBudgetDict"));
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2242;
      v299 = 2112;
      v300 = v160;
      _os_log_impl((void *)&_mh_execute_header, v158, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:self.dpsQuickRecoveryEngine.dpsQuickRecoveryWDBudgetDict %@", buf, 0x1Cu);

    }
    v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v274, "objectForKeyedSubscript:", CFSTR("WA_PERSIST_DPS_QUICK_RECOVERY_STATS")));
    v162 = WALogCategoryDefaultHandle();
    v163 = objc_claimAutoreleasedReturnValue(v162);
    if (os_log_type_enabled(v163, OS_LOG_TYPE_DEBUG))
    {
      v164 = (const char *)objc_msgSend(v161, "length");
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2245;
      v299 = 2048;
      v300 = v164;
      _os_log_impl((void *)&_mh_execute_header, v163, OS_LOG_TYPE_DEBUG, "%{public}s::%d:dpsStatsData size: %lu", buf, 0x1Cu);
    }

    if (!v151)
      goto LABEL_119;
    v165 = v24[103];
    v166 = objc_opt_class(NSMutableDictionary);
    v167 = objc_opt_class(NSNumber);
    v168 = objc_opt_class(NSDate);
    v169 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v166, v167, v168, objc_opt_class(NSString), 0);
    v170 = (void *)objc_claimAutoreleasedReturnValue(v169);
    v286 = 0;
    v272 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v165, "unarchivedObjectOfClasses:fromData:error:", v170, v161, &v286));
    v171 = (char *)v286;

    if (v171)
    {
      v172 = WALogCategoryDefaultHandle();
      v173 = objc_claimAutoreleasedReturnValue(v172);
      if (os_log_type_enabled(v173, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2249;
        v299 = 2112;
        v300 = v171;
        _os_log_impl((void *)&_mh_execute_header, v173, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive dpsStats: %@", buf, 0x1Cu);
      }

    }
    v24 = &AnalyticsSendEventLazy_ptr;
    v174 = v272;
    if (v272)
    {
      v175 = 0;
    }
    else
    {
LABEL_119:
      v174 = objc_alloc_init((Class)NSMutableDictionary);
      v272 = 0;
      v175 = 1;
    }
    v176 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine dpsQuickRecoveryEngine](self, "dpsQuickRecoveryEngine"));
    objc_msgSend(v176, "setDpsStats:", v174);

    if (v175)
    v177 = WALogCategoryDefaultHandle();
    v178 = objc_claimAutoreleasedReturnValue(v177);
    if (os_log_type_enabled(v178, OS_LOG_TYPE_DEFAULT))
    {
      v179 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine dpsQuickRecoveryEngine](self, "dpsQuickRecoveryEngine"));
      v180 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v179, "dpsStats"));
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2255;
      v299 = 2112;
      v300 = v180;
      _os_log_impl((void *)&_mh_execute_header, v178, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:self.dpsQuickRecoveryEngine.dpsStats %@", buf, 0x1Cu);

    }
    v37 = v274;
  }
  v181 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("WA_PERSIST_MESSAGE_STORE")));
  v182 = WALogCategoryDefaultHandle();
  v183 = objc_claimAutoreleasedReturnValue(v182);
  if (os_log_type_enabled(v183, OS_LOG_TYPE_DEBUG))
  {
    v184 = (const char *)objc_msgSend(v181, "length");
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2259;
    v299 = 2048;
    v300 = v184;
    _os_log_impl((void *)&_mh_execute_header, v183, OS_LOG_TYPE_DEBUG, "%{public}s::%d:messageStoreData size: %lu", buf, 0x1Cu);
  }

  v260 = v181;
  if (!v181)
    goto LABEL_133;
  v185 = v24[103];
  v186 = objc_opt_class(WAMessageAWDStoreEntry);
  v187 = objc_opt_class(WAMessageAWDStore);
  v188 = objc_opt_class(NSMutableArray);
  v189 = objc_opt_class(NSNumber);
  v190 = objc_opt_class(WAMessageAWD);
  v191 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v186, v187, v188, v189, v190, objc_opt_class(WAField), 0);
  v192 = (void *)objc_claimAutoreleasedReturnValue(v191);
  v285 = 0;
  v193 = (WAMessageAWDStore *)objc_claimAutoreleasedReturnValue(objc_msgSend(v185, "unarchivedObjectOfClasses:fromData:error:", v192, v260, &v285));
  v194 = (char *)v285;

  if (v194)
  {
    v195 = WALogCategoryDefaultHandle();
    v196 = objc_claimAutoreleasedReturnValue(v195);
    if (os_log_type_enabled(v196, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2263;
      v299 = 2112;
      v300 = v194;
      _os_log_impl((void *)&_mh_execute_header, v196, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive WAMessageAWDStore: %@", buf, 0x1Cu);
    }

  }
  v24 = &AnalyticsSendEventLazy_ptr;
  v37 = v274;
  if (!v193)
LABEL_133:
    v193 = objc_alloc_init(WAMessageAWDStore);
  -[WAEngine setMessageStore:](self, "setMessageStore:", v193);

  v197 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("WA_PERSIST_PROCESS_REGISTRATION")));
  v198 = WALogCategoryDefaultHandle();
  v199 = objc_claimAutoreleasedReturnValue(v198);
  if (os_log_type_enabled(v199, OS_LOG_TYPE_DEBUG))
  {
    v200 = (const char *)objc_msgSend(v197, "length");
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2271;
    v299 = 2048;
    v300 = v200;
    _os_log_impl((void *)&_mh_execute_header, v199, OS_LOG_TYPE_DEBUG, "%{public}s::%d:processRegistrationData size: %lu", buf, 0x1Cu);
  }

  v259 = v197;
  if (!v197)
    goto LABEL_142;
  v201 = v24[103];
  v202 = objc_opt_class(NSDictionary);
  v203 = objc_opt_class(NSMutableDictionary);
  v204 = objc_opt_class(NSMutableSet);
  v205 = objc_opt_class(NSSet);
  v206 = objc_opt_class(NSNumber);
  v207 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v202, v203, v204, v205, v206, objc_opt_class(NSString), 0);
  v208 = (void *)objc_claimAutoreleasedReturnValue(v207);
  v284 = 0;
  v209 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v201, "unarchivedObjectOfClasses:fromData:error:", v208, v259, &v284));
  v210 = (char *)v284;

  if (v210)
  {
    v211 = WALogCategoryDefaultHandle();
    v212 = objc_claimAutoreleasedReturnValue(v211);
    if (os_log_type_enabled(v212, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2275;
      v299 = 2112;
      v300 = v210;
      _os_log_impl((void *)&_mh_execute_header, v212, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive process registration map: %@", buf, 0x1Cu);
    }

  }
  v24 = &AnalyticsSendEventLazy_ptr;
  if (!v209)
LABEL_142:
    v209 = objc_alloc_init((Class)NSMutableDictionary);
  -[WAEngine setProcessTokenToGroupTypeMap:](self, "setProcessTokenToGroupTypeMap:", v209);

  v213 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("WA_PERSIST_IOREPORTER_REGISTRATIONS")));
  v214 = WALogCategoryDefaultHandle();
  v215 = objc_claimAutoreleasedReturnValue(v214);
  if (os_log_type_enabled(v215, OS_LOG_TYPE_DEBUG))
  {
    v216 = (const char *)objc_msgSend(v213, "length");
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2284;
    v299 = 2048;
    v300 = v216;
    _os_log_impl((void *)&_mh_execute_header, v215, OS_LOG_TYPE_DEBUG, "%{public}s::%d:iorReporterWrapperData size: %lu", buf, 0x1Cu);
  }

  v255 = v213;
  if (!v213)
    goto LABEL_151;
  v217 = v24[103];
  v283 = 0;
  v218 = objc_msgSend(v217, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(WAIOReporterMessagePopulator), v213, &v283);
  v219 = (WAIOReporterMessagePopulator *)objc_claimAutoreleasedReturnValue(v218);
  v220 = (char *)v283;
  if (v220)
  {
    v221 = v220;
    v222 = WALogCategoryDefaultHandle();
    v223 = objc_claimAutoreleasedReturnValue(v222);
    if (os_log_type_enabled(v223, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2288;
      v299 = 2112;
      v300 = v221;
      _os_log_impl((void *)&_mh_execute_header, v223, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive WAIOReporterMessagePopulator: %@", buf, 0x1Cu);
    }

  }
  if (!v219)
LABEL_151:
    v219 = objc_alloc_init(WAIOReporterMessagePopulator);
  -[WAEngine setIorMessagePopulator:](self, "setIorMessagePopulator:", v219);

  v224 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator"));
  objc_msgSend(v224, "setMessageDelegate:", self);

  v225 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator"));
  objc_msgSend(v225, "setPersistenceDelegate:", self);

  v281 = 0u;
  v282 = 0u;
  v279 = 0u;
  v280 = 0u;
  v226 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
  v227 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v226, "allKeys"));

  v228 = objc_msgSend(v227, "countByEnumeratingWithState:objects:count:", &v279, v297, 16);
  if (v228)
  {
    v229 = v228;
    v230 = *(_QWORD *)v280;
    do
    {
      for (i = 0; i != v229; i = (char *)i + 1)
      {
        if (*(_QWORD *)v280 != v230)
          objc_enumerationMutation(v227);
        v232 = *(_QWORD *)(*((_QWORD *)&v279 + 1) + 8 * (_QWORD)i);
        v275 = 0u;
        v276 = 0u;
        v277 = 0u;
        v278 = 0u;
        v233 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
        v234 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v233, "objectForKeyedSubscript:", v232));

        v235 = objc_msgSend(v234, "countByEnumeratingWithState:objects:count:", &v275, v296, 16);
        if (v235)
        {
          v236 = v235;
          v237 = *(_QWORD *)v276;
          do
          {
            for (j = 0; j != v236; j = (char *)j + 1)
            {
              if (*(_QWORD *)v276 != v237)
                objc_enumerationMutation(v234);
              -[WAEngine _initSubmitterAndQueryableRegistrationForProcessToken:andGroupType:](self, "_initSubmitterAndQueryableRegistrationForProcessToken:andGroupType:", v232, objc_msgSend(*(id *)(*((_QWORD *)&v275 + 1) + 8 * (_QWORD)j), "integerValue"));
            }
            v236 = objc_msgSend(v234, "countByEnumeratingWithState:objects:count:", &v275, v296, 16);
          }
          while (v236);
        }

      }
      v229 = objc_msgSend(v227, "countByEnumeratingWithState:objects:count:", &v279, v297, 16);
    }
    while (v229);
  }

  v239 = WALogCategoryDefaultHandle();
  v240 = objc_claimAutoreleasedReturnValue(v239);
  if (os_log_type_enabled(v240, OS_LOG_TYPE_DEBUG))
  {
    v241 = os_transaction_get_description(v257);
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "-[WAEngine _unpersist]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2303;
    v299 = 2080;
    v300 = (const char *)v241;
    _os_log_impl((void *)&_mh_execute_header, v240, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Ending transaction %s", buf, 0x1Cu);
  }

  v242 = (void *)objc_claimAutoreleasedReturnValue(+[WAActivityManager sharedActivityManager](WAActivityManager, "sharedActivityManager"));
  objc_msgSend(v242, "osTransactionComplete:", v257);

  v243 = WALogCategoryDefaultHandle();
  v244 = objc_claimAutoreleasedReturnValue(v243);
  if (os_signpost_enabled(v244))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v244, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WAEngine Unpersist", ", buf, 2u);
  }

}

- (void)_removePersistenceFile
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  const __CFString *v7;
  _BOOL4 readingPersistFile;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  NSString *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  id v24;
  NSObject *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  id v33;
  id v34;
  NSObject *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  void *v41;
  unsigned __int8 v42;
  id v43;
  NSObject *v44;
  __CFString *v45;
  void *v46;
  void *v47;
  unsigned int v48;
  void *v49;
  void *v50;
  unsigned __int8 v51;
  id v52;
  __CFString *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  const __CFString *v63;

  v3 = WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WAEngine RemovePersistenceFile", ", buf, 2u);
  }

  if (self->_readingPersistFile || self->_writingPersistFile)
  {
    v5 = WALogCategoryDefaultHandle();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = CFSTR("reading");
      readingPersistFile = self->_readingPersistFile;
      v59 = "-[WAEngine _removePersistenceFile]";
      *(_DWORD *)buf = 136446722;
      if (!readingPersistFile)
        v7 = CFSTR("writing");
      v60 = 1024;
      v61 = 2314;
      v62 = 2112;
      v63 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:Cannot remove persistence file, we're currenlty %@ it", buf, 0x1Cu);
    }
    v9 = 0;
    goto LABEL_10;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v14 = NSHomeDirectory();
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@t.out"), v15, CFSTR("/Library/com.apple.wifianalyticsd/.wa/")));
  v17 = objc_msgSend(v13, "isDeletableFileAtPath:", v16);

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v19 = NSHomeDirectory();
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@t.out"), v20, CFSTR("/Library/com.apple.wifianalyticsd/.wa/")));
    v57 = 0;
    v22 = objc_msgSend(v18, "removeItemAtPath:error:", v21, &v57);
    v23 = v57;

    if ((v22 & 1) == 0)
    {
      v24 = WALogCategoryDefaultHandle();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedDescription"));
        *(_DWORD *)buf = 136446722;
        v59 = "-[WAEngine _removePersistenceFile]";
        v60 = 1024;
        v61 = 2321;
        v62 = 2112;
        v63 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error removing file at path: %@", buf, 0x1Cu);

      }
    }
  }
  else
  {
    v23 = 0;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[WAIOReporterMessagePopulator getIORPopAvailabeIOReportersTempFile](WAIOReporterMessagePopulator, "getIORPopAvailabeIOReportersTempFile"));
  v29 = objc_msgSend(v27, "isDeletableFileAtPath:", v28);

  if (v29)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[WAIOReporterMessagePopulator getIORPopAvailabeIOReportersTempFile](WAIOReporterMessagePopulator, "getIORPopAvailabeIOReportersTempFile"));
    v56 = v23;
    v32 = objc_msgSend(v30, "removeItemAtPath:error:", v31, &v56);
    v33 = v56;

    if ((v32 & 1) == 0)
    {
      v34 = WALogCategoryDefaultHandle();
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedDescription"));
        *(_DWORD *)buf = 136446722;
        v59 = "-[WAEngine _removePersistenceFile]";
        v60 = 1024;
        v61 = 2328;
        v62 = 2112;
        v63 = v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error removing file getIORPopAvailabeIOReportersTempFile at path: %@", buf, 0x1Cu);

      }
    }
  }
  else
  {
    v33 = v23;
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[WAIOReporterMessagePopulator getUnavailablePredTempFile](WAIOReporterMessagePopulator, "getUnavailablePredTempFile"));
  v39 = objc_msgSend(v37, "isDeletableFileAtPath:", v38);

  if (v39)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[WAIOReporterMessagePopulator getUnavailablePredTempFile](WAIOReporterMessagePopulator, "getUnavailablePredTempFile"));
    v55 = v33;
    v42 = objc_msgSend(v40, "removeItemAtPath:error:", v41, &v55);
    v10 = v55;

    if ((v42 & 1) == 0)
    {
      v43 = WALogCategoryDefaultHandle();
      v44 = objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v45 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedDescription"));
        *(_DWORD *)buf = 136446722;
        v59 = "-[WAEngine _removePersistenceFile]";
        v60 = 1024;
        v61 = 2335;
        v62 = 2112;
        v63 = v45;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error removing file getUnavailablePredTempFile at path: %@", buf, 0x1Cu);

      }
    }
  }
  else
  {
    v10 = v33;
  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[WAIOReporterMessagePopulator getUsageTempFile](WAIOReporterMessagePopulator, "getUsageTempFile"));
  v48 = objc_msgSend(v46, "isDeletableFileAtPath:", v47);

  if (v48)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[WAIOReporterMessagePopulator getUsageTempFile](WAIOReporterMessagePopulator, "getUsageTempFile"));
    v54 = v10;
    v51 = objc_msgSend(v49, "removeItemAtPath:error:", v50, &v54);
    v9 = v54;

    if ((v51 & 1) != 0)
      goto LABEL_11;
    v52 = WALogCategoryDefaultHandle();
    v6 = objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v53 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedDescription"));
      *(_DWORD *)buf = 136446722;
      v59 = "-[WAEngine _removePersistenceFile]";
      v60 = 1024;
      v61 = 2342;
      v62 = 2112;
      v63 = v53;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error removing file getUsageTempFile at path: %@", buf, 0x1Cu);

    }
LABEL_10:

LABEL_11:
    v10 = v9;
  }
  v11 = WALogCategoryDefaultHandle();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WAEngine RemovePersistenceFile", ", buf, 2u);
  }

}

- (void)_handleUnpersistForUsageData
{
  const __CFString *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  const __CFString *v9;
  uint64_t v10;
  void *i;
  __CFString *v12;
  id v13;
  NSObject *v14;
  const __CFString *v15;
  id v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  id v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  char isKindOfClass;
  id v39;
  NSObject *v40;
  NSObject *v41;
  const char *v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  char v47;
  id v48;
  _BOOL4 v49;
  void *v50;
  __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  __CFString *v57;
  __CFString *v58;
  id v59;
  NSMutableDictionary *cachedUsage;
  void *v61;
  id v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t buf[4];
  const char *v75;
  __int16 v76;
  int v77;
  __int16 v78;
  const __CFString *v79;
  __int16 v80;
  __CFString *v81;
  __int16 v82;
  void *v83;
  _BYTE v84[128];
  _BYTE v85[128];

  v3 = CFSTR("Work Bin: Last PID Work");
  -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", CFSTR("Work Bin: Last PID Work"));
  v62 = objc_alloc_init((Class)NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedUsage, "setObject:forKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Previous PIDs Work")));

  if (!v4)
  {
    v5 = objc_alloc_init((Class)NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedUsage, "setObject:forKeyedSubscript:", v5, CFSTR("Work Bin: Previous PIDs Work"));

  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v6 = -[NSMutableDictionary copy](self->_cachedUsage, "copy");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v70, v85, 16);
  if (v7)
  {
    v8 = v7;
    v9 = CFSTR("Work Bin: Previous PIDs Work");
    v10 = *(_QWORD *)v71;
    v64 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v71 != v10)
          objc_enumerationMutation(v6);
        v12 = *(__CFString **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)i);
        if ((-[__CFString isEqualToString:](v12, "isEqualToString:", v9) & 1) != 0
          || -[__CFString isEqualToString:](v12, "isEqualToString:", v3))
        {
          v13 = WALogCategoryDefaultHandle();
          v14 = objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136446978;
            v75 = "-[WAEngine _handleUnpersistForUsageData]";
            v76 = 1024;
            v77 = 2369;
            v78 = 2112;
            v79 = v3;
            v80 = 2112;
            v81 = v12;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Skipping copying key to %@: %@", buf, 0x26u);
          }
        }
        else
        {
          v15 = v9;
          v16 = v6;
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_cachedUsage, "objectForKey:", v12));
          v18 = v3;
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", v3));
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, v12);

          -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", v12);
          v20 = WALogCategoryDefaultHandle();
          v14 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", v18));
            v22 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v12));
            *(_DWORD *)buf = 136446978;
            v75 = "-[WAEngine _handleUnpersistForUsageData]";
            v76 = 1024;
            v77 = 2376;
            v78 = 2112;
            v79 = v12;
            v80 = 2112;
            v81 = v22;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%{public}s::%d:_cachedUsage[kLastPIDBin] now contains key %@ with value %@", buf, 0x26u);

          }
          v3 = v18;
          v6 = v16;
          v9 = v15;
          v10 = v64;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v70, v85, 16);
    }
    while (v8);
  }

  if (self->_persistFileExistedAtPIDLoad)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Last PID Work")));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("Terminations - Graceful")));

    if (!v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Last PID Work")));
      +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Terminations - Unknown"), v25, self->_engineQ);

    }
  }
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Last PID Work")));
  v27 = objc_msgSend(v26, "copy");

  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v66, v84, 16);
  if (v28)
  {
    v29 = v28;
    v65 = *(_QWORD *)v67;
    v63 = v27;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v67 != v65)
          objc_enumerationMutation(v27);
        v31 = *(__CFString **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)v30);
        if (-[__CFString isEqualToString:](v31, "isEqualToString:", CFSTR("Persist file creation Date")))
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Last PID Work")));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", v31));
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Previous PIDs Work")));
          objc_msgSend(v34, "setObject:forKeyedSubscript:", v33, v31);

        }
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Last PID Work")));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", v31));
        v37 = objc_opt_class(NSDate);
        isKindOfClass = objc_opt_isKindOfClass(v36, v37);

        if ((isKindOfClass & 1) != 0)
        {
          v39 = WALogCategoryDefaultHandle();
          v40 = objc_claimAutoreleasedReturnValue(v39);
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            goto LABEL_35;
          *(_DWORD *)buf = 136446722;
          v75 = "-[WAEngine _handleUnpersistForUsageData]";
          v76 = 1024;
          v77 = 2393;
          v78 = 2112;
          v79 = v31;
          v41 = v40;
          v42 = "%{public}s::%d:Skipping copying to _cachedUsage[kPreviousPIDsBin] key %@: NSDate";
LABEL_34:
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, v42, buf, 0x1Cu);
          goto LABEL_35;
        }
        if ((-[__CFString isEqualToString:](v31, "isEqualToString:", CFSTR("Last Persisted PID")) & 1) != 0
          || -[__CFString isEqualToString:](v31, "isEqualToString:", CFSTR("Last Terminated PID")))
        {
          v43 = WALogCategoryDefaultHandle();
          v40 = objc_claimAutoreleasedReturnValue(v43);
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            goto LABEL_35;
          *(_DWORD *)buf = 136446722;
          v75 = "-[WAEngine _handleUnpersistForUsageData]";
          v76 = 1024;
          v77 = 2397;
          v78 = 2112;
          v79 = v31;
          v41 = v40;
          v42 = "%{public}s::%d:Skipping copying to _cachedUsage[kPreviousPIDsBin] key %@: kWAPersistedPidKey or kWATerminationPidKey";
          goto LABEL_34;
        }
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Last PID Work")));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", v31));
        v46 = objc_opt_class(NSNumber);
        v47 = objc_opt_isKindOfClass(v45, v46);

        v48 = WALogCategoryDefaultHandle();
        v40 = objc_claimAutoreleasedReturnValue(v48);
        v49 = os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG);
        if ((v47 & 1) != 0)
        {
          if (v49)
          {
            v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Last PID Work")));
            v51 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", v31));
            v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Previous PIDs Work")));
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKeyedSubscript:", v31));
            *(_DWORD *)buf = 136447234;
            v75 = "-[WAEngine _handleUnpersistForUsageData]";
            v76 = 1024;
            v77 = 2402;
            v78 = 2112;
            v79 = v31;
            v80 = 2112;
            v81 = v51;
            v82 = 2112;
            v83 = v53;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Summing key %@ of kLastPIDBin %@ to kPreviousPIDsBin %@", buf, 0x30u);

          }
          v40 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Previous PIDs Work")));
          v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Last PID Work")));
          +[WAUtil sumNSNumberForKey:dstDict:otherDict:](WAUtil, "sumNSNumberForKey:dstDict:otherDict:", v31, v40, v54);

          v27 = v63;
        }
        else if (v49)
        {
          v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Work Bin: Last PID Work")));
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKeyedSubscript:", v31));
          v57 = (__CFString *)objc_opt_class(v56);
          *(_DWORD *)buf = 136446978;
          v75 = "-[WAEngine _handleUnpersistForUsageData]";
          v76 = 1024;
          v77 = 2405;
          v78 = 2112;
          v79 = v31;
          v80 = 2112;
          v81 = v57;
          v58 = v57;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Skipping copying to _cachedUsage[kPreviousPIDsBin] key %@: unknown class %@", buf, 0x26u);

          v27 = v63;
        }
LABEL_35:

        v30 = (char *)v30 + 1;
      }
      while (v29 != v30);
      v59 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v66, v84, 16);
      v29 = v59;
    }
    while (v59);
  }

  +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Unpersisted Count"), self->_cachedUsage, self->_engineQ);
  cachedUsage = self->_cachedUsage;
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[NSMutableDictionary setObject:forKey:](cachedUsage, "setObject:forKey:", v61, CFSTR("PID Unpersisted Date"));

  +[WAUtil logNestedDictionary:indent:prefix:](WAUtil, "logNestedDictionary:indent:prefix:", self->_cachedUsage, 0, CFSTR("Handle Unpersist Engine _cachedUsage"));
}

- (void)_calculateEstimatedUptime
{
  void *v3;
  id v4;
  NSObject *v5;
  NSDate *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  NSMutableDictionary *cachedUsage;
  void *v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  NSMutableDictionary *v18;
  NSDate *pidLaunchDate;
  id v20;
  NSObject *v21;
  NSDate *v22;
  void *v23;
  double v24;
  NSMutableDictionary *v25;
  double v26;
  _BYTE v27[18];
  __int16 v28;
  NSDate *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  double v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("PID Unpersisted Date")));

  if (v3)
  {
    v4 = WALogCategoryDefaultHandle();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("PID Unpersisted Date")));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("PID Unpersisted Date")));
      objc_msgSend(v8, "timeIntervalSinceNow");
      v10 = v9;

      *(_DWORD *)v27 = 136447234;
      v11 = -v10;
      *(_QWORD *)&v27[4] = "-[WAEngine _calculateEstimatedUptime]";
      if (v10 >= 0.0)
        v11 = v10;
      *(_WORD *)&v27[12] = 1024;
      *(_DWORD *)&v27[14] = 2421;
      v28 = 2112;
      v29 = v6;
      v30 = 2112;
      v31 = v7;
      v32 = 2048;
      v33 = v11;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%{public}s::%d:_cachedUsage[kWAUnpersistedDateKey] %@ now %@ interval %f", v27, 0x30u);

    }
    -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", CFSTR("Estimated Uptime (s)"));
    cachedUsage = self->_cachedUsage;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](cachedUsage, "objectForKeyedSubscript:", CFSTR("PID Unpersisted Date")));
    objc_msgSend(v13, "timeIntervalSinceNow");
    v15 = v14;

    v16 = -v15;
    if (v15 >= 0.0)
      v16 = v15;
    v17 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", (unint64_t)v16, *(_OWORD *)v27));
    v18 = cachedUsage;
LABEL_17:
    -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v17, CFSTR("Estimated Uptime (s)"));
    goto LABEL_18;
  }
  pidLaunchDate = self->_pidLaunchDate;
  v20 = WALogCategoryDefaultHandle();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  v17 = v21;
  if (pidLaunchDate)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = self->_pidLaunchDate;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      -[NSDate timeIntervalSinceNow](self->_pidLaunchDate, "timeIntervalSinceNow");
      *(_DWORD *)v27 = 136447234;
      *(_QWORD *)&v27[4] = "-[WAEngine _calculateEstimatedUptime]";
      *(_WORD *)&v27[12] = 1024;
      if (v24 < 0.0)
        v24 = -v24;
      *(_DWORD *)&v27[14] = 2426;
      v28 = 2112;
      v29 = v22;
      v30 = 2112;
      v31 = v23;
      v32 = 2048;
      v33 = v24;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%{public}s::%d:_pidLaunchDate %@ now %@ interval %f", v27, 0x30u);

    }
    -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", CFSTR("Estimated Uptime (s)"));
    v25 = self->_cachedUsage;
    -[NSDate timeIntervalSinceNow](self->_pidLaunchDate, "timeIntervalSinceNow");
    if (v26 < 0.0)
      v26 = -v26;
    v17 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", (unint64_t)v26, *(_QWORD *)v27, *(_QWORD *)&v27[8]));
    v18 = v25;
    goto LABEL_17;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v27 = 136446466;
    *(_QWORD *)&v27[4] = "-[WAEngine _calculateEstimatedUptime]";
    *(_WORD *)&v27[12] = 1024;
    *(_DWORD *)&v27[14] = 2431;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d: calculating kWACumulativeUptimeKey unavailable", v27, 0x12u);
  }
LABEL_18:

}

- (void)_calculateProfileUptime
{
  NSMutableDictionary *cachedUsage;
  void *v4;
  NSMutableDictionary *v5;
  id v6;

  -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", CFSTR("Profile: MegaWiFi Enabled (s)"));
  cachedUsage = self->_cachedUsage;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", -[WAEngine _getTimeInProfileState:](self, "_getTimeInProfileState:", 1)));
  -[NSMutableDictionary setObject:forKey:](cachedUsage, "setObject:forKey:", v4, CFSTR("Profile: MegaWiFi Enabled (s)"));

  -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", CFSTR("Profile: MegaWiFi Uninstalled (s)"));
  v5 = self->_cachedUsage;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", -[WAEngine _getTimeInProfileState:](self, "_getTimeInProfileState:", 0)));
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v6, CFSTR("Profile: MegaWiFi Uninstalled (s)"));

}

- (unint64_t)abstime_to_ns:(unint64_t)a3
{
  if (qword_1000ED088 != -1)
    dispatch_once(&qword_1000ED088, &stru_1000CD418);
  return (unint64_t)(*(double *)&qword_1000ECC00 * (double)a3);
}

- (void)_calculateProcessUsage
{
  NSMutableDictionary *cachedUsage;
  void *v4;
  NSMutableDictionary *v5;
  void *v6;
  NSMutableDictionary *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = 0;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  if (!proc_pid_rusage(self->_pid, 4, (rusage_info_t *)&v11))
  {
    -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", CFSTR("Process: current_mem kB"));
    cachedUsage = self->_cachedUsage;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", *((_QWORD *)&v15 + 1) >> 10));
    -[NSMutableDictionary setObject:forKey:](cachedUsage, "setObject:forKey:", v4, CFSTR("Process: current_mem kB"));

    -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", CFSTR("Process: lifetime_peak kB"));
    v5 = self->_cachedUsage;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", (unint64_t)v26 >> 10));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v6, CFSTR("Process: lifetime_peak kB"));

    -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", CFSTR("Process: cpu_time ns"));
    v7 = self->_cachedUsage;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", -[WAEngine abstime_to_ns:](self, "abstime_to_ns:", *((_QWORD *)&v12 + 1) + (_QWORD)v12)));
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v8, CFSTR("Process: cpu_time ns"));

    -[NSMutableDictionary removeObjectForKey:](self->_cachedUsage, "removeObjectForKey:", CFSTR("Process: storage_dirtied kB"));
    v9 = self->_cachedUsage;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", *((_QWORD *)&v25 + 1) >> 10));
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, CFSTR("Process: storage_dirtied kB"));

  }
}

- (void)_cancelWorkReportRecurringTimer
{
  NSObject *workReportTimer;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  _BOOL4 workReportTimerRunning;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  _BOOL4 v14;

  if (self->_workReportTimerRunning)
  {
    workReportTimer = self->_workReportTimer;
    if (workReportTimer)
    {
      if (!dispatch_source_testcancel(workReportTimer))
      {
        v4 = WALogCategoryDefaultHandle();
        v5 = objc_claimAutoreleasedReturnValue(v4);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v9 = 136446466;
          v10 = "-[WAEngine _cancelWorkReportRecurringTimer]";
          v11 = 1024;
          v12 = 2482;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Timer exists and is valid, Suspending", (uint8_t *)&v9, 0x12u);
        }

        dispatch_suspend((dispatch_object_t)self->_workReportTimer);
        self->_workReportTimerRunning = 0;
        v6 = WALogCategoryDefaultHandle();
        v7 = objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          workReportTimerRunning = self->_workReportTimerRunning;
          v9 = 136446722;
          v10 = "-[WAEngine _cancelWorkReportRecurringTimer]";
          v11 = 1024;
          v12 = 2485;
          v13 = 1024;
          v14 = workReportTimerRunning;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:setting _workReportTimerRunning %d", (uint8_t *)&v9, 0x18u);
        }

      }
    }
  }
}

- (void)_enableWorkReportRecurringTimer
{
  _BOOL4 workReportTimerRunning;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  _BOOL4 v10;
  unint64_t v11;
  NSObject *workReportTimer;
  _BOOL4 v13;
  _BOOL4 v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  OS_dispatch_source *v20;
  OS_dispatch_source *v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  unint64_t v31;
  NSObject *v32;
  dispatch_time_t v33;
  id v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  _BOOL4 v40;
  id v41;
  _BOOL4 v42;
  unint64_t v43;
  NSObject *v44;
  _BOOL4 v45;
  id v46;
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  _BYTE v53[14];
  __int16 v54;
  _BOOL4 v55;
  __int16 v56;
  _BOOL4 v57;

  workReportTimerRunning = self->_workReportTimerRunning;
  v4 = WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (workReportTimerRunning)
  {
    if (v6)
    {
      *(_DWORD *)buf = 136446466;
      v49 = "-[WAEngine _enableWorkReportRecurringTimer]";
      v50 = 1024;
      v51 = 2492;
      v7 = "%{public}s::%d:Persist is already scheduled, ignoring additional request";
      v8 = v5;
      v9 = 18;
LABEL_39:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      goto LABEL_40;
    }
    goto LABEL_40;
  }
  if (v6)
  {
    v10 = self->_workReportTimerRunning;
    v11 = -[RecommendationPreferences work_report_seconds](self->_preferences, "work_report_seconds");
    workReportTimer = self->_workReportTimer;
    v13 = workReportTimer != 0;
    if (workReportTimer)
      v14 = dispatch_source_testcancel(workReportTimer) != 0;
    else
      v14 = 0;
    *(_DWORD *)buf = 136447490;
    v49 = "-[WAEngine _enableWorkReportRecurringTimer]";
    v50 = 1024;
    v51 = 2496;
    v52 = 1024;
    *(_DWORD *)v53 = v10;
    *(_WORD *)&v53[4] = 2048;
    *(_QWORD *)&v53[6] = v11;
    v54 = 1024;
    v55 = v13;
    v56 = 1024;
    v57 = v14;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_workReportTimerRunning is %d work_report_seconds is %lu _workReportTimer exists %d testcancel is %d", buf, 0x2Eu);
  }

  if (!self->_workReportTimerRunning)
  {
    v15 = WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v49 = "-[WAEngine _enableWorkReportRecurringTimer]";
      v50 = 1024;
      v51 = 2499;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Setting timer", buf, 0x12u);
    }

    v17 = self->_workReportTimer;
    if (v17)
    {
      if (!dispatch_source_testcancel(v17))
      {
LABEL_25:
        v29 = WALogCategoryDefaultHandle();
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = -[RecommendationPreferences work_report_seconds](self->_preferences, "work_report_seconds");
          *(_DWORD *)buf = 136446722;
          v49 = "-[WAEngine _enableWorkReportRecurringTimer]";
          v50 = 1024;
          v51 = 2520;
          v52 = 2048;
          *(_QWORD *)v53 = v31;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Starting dispatch_source_set_timer fire in %lu s", buf, 0x1Cu);
        }

        v32 = self->_workReportTimer;
        v33 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 1000000000 * -[RecommendationPreferences work_report_seconds](self->_preferences, "work_report_seconds"));
        dispatch_source_set_timer(v32, v33, 1000000000 * -[RecommendationPreferences work_report_seconds](self->_preferences, "work_report_seconds"), 0x3B9ACA00uLL);
        v34 = WALogCategoryDefaultHandle();
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v49 = "-[WAEngine _enableWorkReportRecurringTimer]";
          v50 = 1024;
          v51 = 2522;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Starting dispatch_source_set_timer Done", buf, 0x12u);
        }

        v36 = WALogCategoryDefaultHandle();
        v37 = objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v49 = "-[WAEngine _enableWorkReportRecurringTimer]";
          v50 = 1024;
          v51 = 2524;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:dispatch_resume _workReportTimer", buf, 0x12u);
        }

        dispatch_resume((dispatch_object_t)self->_workReportTimer);
        self->_workReportTimerRunning = 1;
        v38 = WALogCategoryDefaultHandle();
        v39 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v40 = self->_workReportTimerRunning;
          *(_DWORD *)buf = 136446722;
          v49 = "-[WAEngine _enableWorkReportRecurringTimer]";
          v50 = 1024;
          v51 = 2528;
          v52 = 1024;
          *(_DWORD *)v53 = v40;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:setting _workReportTimerRunning %d", buf, 0x18u);
        }

        goto LABEL_34;
      }
    }
    else
    {
      v18 = WALogCategoryDefaultHandle();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v49 = "-[WAEngine _enableWorkReportRecurringTimer]";
        v50 = 1024;
        v51 = 2505;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Creating _workReportTimer", buf, 0x12u);
      }

      v20 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_engineQ);
      v21 = self->_workReportTimer;
      self->_workReportTimer = v20;

      v22 = WALogCategoryDefaultHandle();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        v49 = "-[WAEngine _enableWorkReportRecurringTimer]";
        v50 = 1024;
        v51 = 2507;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Creating _workReportTimer Done", buf, 0x12u);
      }

      if (!self->_workReportTimer)
      {
        v46 = WALogCategoryDefaultHandle();
        v5 = objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "Failed to create _workReportTimer", buf, 2u);
        }
        goto LABEL_40;
      }
    }
    v24 = WALogCategoryDefaultHandle();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v49 = "-[WAEngine _enableWorkReportRecurringTimer]";
      v50 = 1024;
      v51 = 2511;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Setting dispatch_source_set_event_handler", buf, 0x12u);
    }

    v26 = self->_workReportTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100052E00;
    handler[3] = &unk_1000CCDB0;
    handler[4] = self;
    dispatch_source_set_event_handler(v26, handler);
    v27 = WALogCategoryDefaultHandle();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v49 = "-[WAEngine _enableWorkReportRecurringTimer]";
      v50 = 1024;
      v51 = 2517;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Setting block Done", buf, 0x12u);
    }

    goto LABEL_25;
  }
LABEL_34:
  v41 = WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v42 = self->_workReportTimerRunning;
    v43 = -[RecommendationPreferences work_report_seconds](self->_preferences, "work_report_seconds");
    v44 = self->_workReportTimer;
    if (v44)
      v45 = dispatch_source_testcancel(v44) == 0;
    else
      v45 = 0;
    *(_DWORD *)buf = 136447234;
    v49 = "-[WAEngine _enableWorkReportRecurringTimer]";
    v50 = 1024;
    v51 = 2532;
    v52 = 1024;
    *(_DWORD *)v53 = v42;
    *(_WORD *)&v53[4] = 2048;
    *(_QWORD *)&v53[6] = v43;
    v54 = 1024;
    v55 = v45;
    v7 = "%{public}s::%d:Timer State : Enabled %d Period(ms) %lu valid %d";
    v8 = v5;
    v9 = 40;
    goto LABEL_39;
  }
LABEL_40:

}

- (id)_createNextWorkReportSnapshot
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  const __CFString *v12;
  id v13;
  _QWORD v14[2];
  _QWORD v15[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine cachedUsage](self, "cachedUsage"));
  +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Telemetry: Work Report Window"), v3, self->_engineQ);

  -[WAEngine _calculateEstimatedUptime](self, "_calculateEstimatedUptime");
  -[WAEngine _calculateProcessUsage](self, "_calculateProcessUsage");
  -[WAEngine _calculateProfileUptime](self, "_calculateProfileUptime");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine cachedUsage](self, "cachedUsage"));

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getCachedUsage"));
  v7 = objc_msgSend(v6, "copy");

  if (v7)
  {
    v14[0] = CFSTR("Module_Engine");
    v8 = (id)objc_claimAutoreleasedReturnValue(-[WAEngine cachedUsage](self, "cachedUsage"));
    v9 = objc_msgSend(v8, "copy");
    v14[1] = CFSTR("Module_IOR");
    v15[0] = v9;
    v15[1] = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));

  }
  else
  {
    v12 = CFSTR("Module_Engine");
    v7 = (id)objc_claimAutoreleasedReturnValue(-[WAEngine cachedUsage](self, "cachedUsage"));
    v8 = objc_msgSend(v7, "copy");
    v13 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  }

  return v10;
}

- (id)_createWorkReportDictionaryForTelemetryAndRollBucket
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  unint64_t workReportSelectingSingleWithinFirstDay;
  void *v23;
  id v24;
  void *v25;
  unint64_t workReportSelectingSingleWithinFirstWeek;
  void *v27;
  id v28;
  void *v29;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine nowCacheUsageForTelemetry](self, "nowCacheUsageForTelemetry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine oldCacheUsageForTelemetry](self, "oldCacheUsageForTelemetry"));
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ap_AgeOutAnalytics"), CFSTR("AnalyticsProcessor: Age Out Analytics"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ap_ApProfileForBSSID"), CFSTR("AnalyticsProcessor: AP Profile For BSSID"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ap_ProcessDatapathMetricsStream"), CFSTR("AnalyticsProcessor: Datapath Metrics Stream"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ap_ProcessWAM"), CFSTR("AnalyticsProcessor: Process WAM File"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ap_ProcessWAMessageMetric"), CFSTR("AnalyticsProcessor: Process WA Message Metric"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ap_Prune"), CFSTR("AnalyticsProcessor: Prune"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ap_SummarizeForNetwork"), CFSTR("AnalyticsProcessor: Summarize Analytics For Network"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("client_ClearMessageStore"), CFSTR("Client: Clear Message Store"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("client_ClientConfigChangeDelegate"), CFSTR("Client: Client Config Change Deligate"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("client_ConvertWiFiStatsIntoPercentile"), CFSTR("Client: Convert WiFi Stats into Percentile"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("client_EstablishConnection"), CFSTR("Client: Establish Connection"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("client_GetDeviceAnalyticsConfiguration"), CFSTR("Client: Get Device Analytics Config"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("client_GetDpsStats"), CFSTR("Client: Get DPS Stats"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("client_GetMessageModelForGroup"), CFSTR("Client: Get Message Model For Group"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("client_GetNewMessageForKey"), CFSTR("Client: Get New Message For Key"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("client_GetUsageStats"), CFSTR("Client: Get Usage Stats"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("client_IssueIOReportManagementCommand"), CFSTR("Client: Issue IOReport Managemen Command"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("client_KillDaemon"), CFSTR("Client: Kill Daemon"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("client_lqmCrashTracerNotify"), CFSTR("Client: LQM Crash Tracer Notify"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("client_lqmCrashTracerReceive"), CFSTR("Client: LQM Crash Tracer Receive"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("client_RegisterMessageGroup"), CFSTR("Client: Register Message Group"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("client_SendMemoryPressureRequest"), CFSTR("Client: Send Memory Pressure Request"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("client_SetDeviceAnalyticsConfiguration"), CFSTR("Client: Set Device Analytics Config"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("client_SubmitMessage"), CFSTR("Client: Submit Message"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("client_SubmitWiFiAnalayticsMessage"), CFSTR("Client: Submit WiFi Analytics Message"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("client_SubmitWiFiAnalayticsMessageAdvanced"), CFSTR("Client: Submit WiFi Analytics Message Advanced"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("client_SummarizeDeviceAnalyticsForNetwork"), CFSTR("Client: Summarize Device Analytics For Network"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("client_TrapCrashMiniTracerDump"), CFSTR("Client: Trap Crash Mini Tracer Dump"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("client_Trigger11axPerfStudy"), CFSTR("Client: Trigger 11ax Perf Study"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("client_TriggerDatapathDiagnostic"), CFSTR("Client: Trigger Datapath Diagnostic"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("client_TriggerDeviceAnalyticsStoreMigration"), CFSTR("Client: Trigger Device Analytics Store Migration"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("client_TriggerQueryForNWActivity"), CFSTR("Client: Trigger Query for NW Activity"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("debug_profileUptime"), CFSTR("Profile: MegaWiFi Enabled (s)"), CFSTR("Module_Engine"), v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("debug_profileUptime")));
  v7 = objc_msgSend(v6, "unsignedLongValue");

  if (v7)
    v8 = &__kCFBooleanTrue;
  else
    v8 = &__kCFBooleanFalse;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("debug_profileInstalled"));
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("dispatch_RxMemoryCritical"), CFSTR("Dispatch: Received Memory Critical"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("dispatch_RxMemoryWarning"), CFSTR("Dispatch: Received Memory Warning"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("engine_PersistCalls"), CFSTR("Persist Calls"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("engine_TerminationGraceful"), CFSTR("Terminations - Graceful"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("engine_TerminationUnknown"), CFSTR("Terminations - Unknown"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("engine_TerminationTryEagerExit"), CFSTR("Terminations - Try Eager Exit"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("engine_UnpersistedCalls"), CFSTR("Unpersisted Count"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("engine_Uptime"), CFSTR("Estimated Uptime (s)"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_BuildStructuredDict"), CFSTR("Build Structured Dict Calls"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_CreateSamples"), CFSTR("CreateSamples Calls"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_CreateSamplesFailed"), CFSTR("CreateSamples Failed Calls"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_CreateSubscription"), CFSTR("CreateSubscription Calls"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_CreateSubscriptionFailed"), CFSTR("CreateSubscription Failed Calls"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_FindChannels"), CFSTR("Find Channels Calls"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_FullTeardown"), CFSTR("IOR Full Teardown Count"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_FullTeardownFailed"), CFSTR("IOR Full Teardown Failed Count"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_FullTeardownRecovered"), CFSTR("IOR Full Teardown Recovered Count"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_LegendQuery"), CFSTR("Legend Query Calls"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_LegendQueryFailed"), CFSTR("Legend Query Failed"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_PersistCalls"), CFSTR("Persist Calls"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_PopulationFailed"), CFSTR("IOR Population Failed Count"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_PopulationSuccess"), CFSTR("IOR Population Success Count"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_PopulationViaIterator"), CFSTR("IOR Population via Iterate"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_PopulationViaDictionary"), CFSTR("IOR Population via Dict"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_RequestDetermine"), CFSTR("External: Determine Channels Calls"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_RequestPopulate"), CFSTR("Populate IOReporter Calls"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_RescanDenied"), CFSTR("Rescan Denied"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_RescanExplore"), CFSTR("Rescan Reason: Explore Count"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_RescanHintSignals"), CFSTR("Rescan Signal Count"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_RescanLowChannel"), CFSTR("Rescan Reason: Low Channel Count"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_RescanNewPhy"), CFSTR("IOR Unprepared For Sample Count"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_RescanPerformed"), CFSTR("Rescan Permitted: Last Rescan Count"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_StaleDriverID"), CFSTR("Fault Detection: Stale DriverID Count"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_TerminationGraceful"), CFSTR("Terminations - Graceful"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_TerminationUnknown"), CFSTR("Terminations - Unknown"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_UnpersistedCalls"), CFSTR("Unpersisted Count"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_Unprepared"), CFSTR("IOR Unprepared For Sample Count"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_UpdateSamples"), CFSTR("UpdateSamples Calls"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_UpdateSamplesFailed"), CFSTR("UpdateSamples Failed Calls"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("ior_Uptime"), CFSTR("Estimated Uptime (s)"), CFSTR("Module_IOR"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("log_Datapath"), CFSTR("Log: DatapathMetricStream Trigger"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("log_WorkReport"), CFSTR("Log: Work Report"), CFSTR("Module_Engine"), v3, v4, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Module_Engine")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Process: current_mem kB")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("process_CurrentMemory"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Module_Engine")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Process: lifetime_peak kB")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("process_PeakMemory"));

  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("process_StorageDirtied"), CFSTR("Process: storage_dirtied kB"), CFSTR("Module_Engine"), v3, v4, v5);
  +[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:](WAUtil, "addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:", CFSTR("process_CPUTime"), CFSTR("Process: cpu_time ns"), CFSTR("Module_Engine"), v3, v4, v5);
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("process_CPUTime")));
  if (v13)
  {
    v14 = (void *)v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("engine_Uptime")));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("process_CPUTime")));
      v17 = (float)(unint64_t)objc_msgSend(v16, "unsignedLongValue") / 1000000.0;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("engine_Uptime")));
      *(float *)&v19 = v17 / (float)(unint64_t)objc_msgSend(v18, "unsignedLongValue");
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v19));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("process_RunningDuty_ms_per_s"));

    }
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", -[RecommendationPreferences work_report_seconds](self->_preferences, "work_report_seconds")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("reportingInterval"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("build_Debug"));
  workReportSelectingSingleWithinFirstDay = self->_workReportSelectingSingleWithinFirstDay;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Telemetry: Work Report Window")));
  v24 = objc_msgSend(v23, "unsignedIntegerValue");

  if ((id)workReportSelectingSingleWithinFirstDay == v24)
    v25 = &__kCFBooleanTrue;
  else
    v25 = &__kCFBooleanFalse;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("singleAgg_InFirstDay"));
  workReportSelectingSingleWithinFirstWeek = self->_workReportSelectingSingleWithinFirstWeek;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedUsage, "objectForKeyedSubscript:", CFSTR("Telemetry: Work Report Window")));
  v28 = objc_msgSend(v27, "unsignedIntegerValue");

  if ((id)workReportSelectingSingleWithinFirstWeek == v28)
    v29 = &__kCFBooleanTrue;
  else
    v29 = &__kCFBooleanFalse;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("singleAgg_InFirstWeek"));

  return v3;
}

- (void)_logWorkReport:(id)a3 indent:(int)a4 prefix:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  char isKindOfClass;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  char v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  id v31;
  uint64_t v32;
  char v33;
  id v34;
  id v35;
  id v36;
  const char *v37;
  NSObject *v38;
  os_log_type_t v39;
  uint32_t v40;
  id v41;
  id v42;
  NSObject *v43;
  void *v44;
  id v45;
  NSObject *obj;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  _BYTE v54[14];
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  id v62;

  v7 = a3;
  v48 = a5;
  v8 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", 0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
  v10 = v9;
  if (!v8)
  {
    v36 = WALogCategoryDefaultHandle();
    v12 = objc_claimAutoreleasedReturnValue(v36);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)v54 = "-[WAEngine _logWorkReport:indent:prefix:]";
    *(_WORD *)&v54[8] = 1024;
    *(_DWORD *)&v54[10] = 2695;
    v37 = "%{public}s::%d:Failed to create NSSortDescriptor";
    v38 = v12;
    v39 = OS_LOG_TYPE_ERROR;
    v40 = 18;
LABEL_31:
    _os_log_impl((void *)&_mh_execute_header, v38, v39, v37, buf, v40);
    goto LABEL_26;
  }
  if (!objc_msgSend(v9, "count"))
  {
    v41 = WALogCategoryDefaultHandle();
    v12 = objc_claimAutoreleasedReturnValue(v41);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)v54 = "-[WAEngine _logWorkReport:indent:prefix:]";
    *(_WORD *)&v54[8] = 1024;
    *(_DWORD *)&v54[10] = 2696;
    v55 = 2112;
    v56 = v48;
    v37 = "%{public}s::%d:Zero keys found in dictionary entry %@";
    v38 = v12;
    v39 = OS_LOG_TYPE_DEFAULT;
    v40 = 28;
    goto LABEL_31;
  }
  v62 = v8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v62, 1));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sortedArrayUsingDescriptors:", v11));

  if (-[NSObject count](v12, "count"))
  {
    v44 = v10;
    v45 = v8;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = v12;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
    if (!v13)
      goto LABEL_25;
    v14 = v13;
    v15 = *(_QWORD *)v50;
    while (1)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v50 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v17));
        v19 = objc_opt_class(NSMutableDictionary);
        if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
        {

LABEL_12:
          v23 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v48, v17));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v17));
          -[WAEngine _logWorkReport:indent:prefix:](self, "_logWorkReport:indent:prefix:", v24, (a4 + 4), v23);
LABEL_13:

          goto LABEL_14;
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v17));
        v21 = objc_opt_class(NSDictionary);
        isKindOfClass = objc_opt_isKindOfClass(v20, v21);

        if ((isKindOfClass & 1) != 0)
          goto LABEL_12;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v17));
        v26 = objc_opt_class(NSNumber);
        v27 = objc_opt_isKindOfClass(v25, v26);

        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v17));
        v29 = v28;
        if ((v27 & 1) != 0)
        {
          v30 = objc_msgSend(v28, "isEqualToNumber:", &off_1000E0368);

          if ((v30 & 1) == 0)
          {
            v31 = WALogWorkReportHandle();
            v23 = objc_claimAutoreleasedReturnValue(v31);
            if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              goto LABEL_14;
LABEL_23:
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v17));
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)v54 = a4;
            *(_WORD *)&v54[4] = 2080;
            *(_QWORD *)&v54[6] = "";
            v55 = 2112;
            v56 = v48;
            v57 = 2112;
            v58 = v17;
            v59 = 2112;
            v60 = v24;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%*s%@ %@ : %@", buf, 0x30u);
            goto LABEL_13;
          }
        }
        else
        {
          v32 = objc_opt_class(NSDate);
          v33 = objc_opt_isKindOfClass(v29, v32);

          if ((v33 & 1) != 0)
          {
            v34 = WALogWorkReportHandle();
            v23 = objc_claimAutoreleasedReturnValue(v34);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              goto LABEL_23;
LABEL_14:

          }
        }
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v35 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
      v14 = v35;
      if (!v35)
      {
LABEL_25:
        v12 = obj;

        v10 = v44;
        v8 = v45;
        goto LABEL_26;
      }
    }
  }
  v42 = WALogCategoryDefaultHandle();
  v43 = objc_claimAutoreleasedReturnValue(v42);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    *(_QWORD *)v54 = "-[WAEngine _logWorkReport:indent:prefix:]";
    *(_WORD *)&v54[8] = 1024;
    *(_DWORD *)&v54[10] = 2699;
    v55 = 2112;
    v56 = v48;
    v57 = 2112;
    v58 = v10;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to create sortedKeys on entry %@ keys %@", buf, 0x26u);
  }

LABEL_26:
}

- (void)_reportWorkReportInterval
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint8_t v13[16];
  _QWORD v14[5];
  id v15;
  id buf[2];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_10004B174;
  v21 = sub_10004B184;
  v22 = 0;
  -[WAEngine setOldCacheUsageForTelemetry:](self, "setOldCacheUsageForTelemetry:", 0);
  v3 = WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_signpost_enabled(v4))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Engine reportWorkReportInterval", ", (uint8_t *)buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine nowCacheUsageForTelemetry](self, "nowCacheUsageForTelemetry"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Module_IOR")));
  -[WAEngine setOldCacheUsageForTelemetry:](self, "setOldCacheUsageForTelemetry:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine _createNextWorkReportSnapshot](self, "_createNextWorkReportSnapshot"));
  -[WAEngine setNowCacheUsageForTelemetry:](self, "setNowCacheUsageForTelemetry:", v7);

  if (-[RecommendationPreferences work_report_logs_enabled](self->_preferences, "work_report_logs_enabled"))
  {
    +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Log: Work Report"), self->_cachedUsage, self->_engineQ);
    v8 = objc_claimAutoreleasedReturnValue(-[WAEngine _createWorkReportDictionaryForTelemetryAndRollBucket](self, "_createWorkReportDictionaryForTelemetryAndRollBucket"));
    v9 = (void *)v18[5];
    v18[5] = v8;

    -[WAEngine _logWorkReport:indent:prefix:](self, "_logWorkReport:indent:prefix:", v18[5], 0, CFSTR("Interval Work Report"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine nowCacheUsageForTelemetry](self, "nowCacheUsageForTelemetry"));
    -[WAEngine _logWorkReport:indent:prefix:](self, "_logWorkReport:indent:prefix:", v10, 0, CFSTR("Current Accumulation"));

  }
  objc_initWeak(buf, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000547BC;
  v14[3] = &unk_1000CD440;
  objc_copyWeak(&v15, buf);
  v14[4] = &v17;
  AnalyticsSendEventLazy(CFSTR("com.apple.wifianalyticsd.workreport"), v14);
  v11 = WALogCategoryDefaultHandle();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Engine reportWorkReportInterval", ", v13, 2u);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(buf);
  _Block_object_dispose(&v17, 8);

}

- (void)_initSubmitterAndQueryableRegistrationForProcessToken:(id)a3 andGroupType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  WAGeoServicesMessageSubmitter *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  WANWActivityMessageSubmitter *v21;
  void *v22;
  void *v23;
  void *v24;
  WADatapathDiagnosticsMessageSubmitter *v25;
  void *v26;
  void *v27;
  void *v28;
  WAMessageSubmitter *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  int v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  int64_t v46;
  __int16 v47;
  void *v48;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));

  if (!v8)
  {
    v9 = objc_alloc_init((Class)NSMutableDictionary);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v6);

  }
  switch(a4)
  {
    case 0:
    case 6:
      v11 = WALogCategoryDefaultHandle();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v39 = 136446466;
        v40 = "-[WAEngine _initSubmitterAndQueryableRegistrationForProcessToken:andGroupType:]";
        v41 = 1024;
        v42 = 2785;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:Unhandled WAGroupType trying to init submitter", (uint8_t *)&v39, 0x12u);
      }

      break;
    case 2:
      v13 = -[WAGeoServicesMessageSubmitter initWithMessageGroupType:]([WAGeoServicesMessageSubmitter alloc], "initWithMessageGroupType:", 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v6));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 2));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine messageStore](self, "messageStore"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v6));
      v20 = 2;
      goto LABEL_11;
    case 3:
      v21 = -[WANWActivityMessageSubmitter initWithMessageGroupType:]([WANWActivityMessageSubmitter alloc], "initWithMessageGroupType:", 3);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v6));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 3));
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v21, v24);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine messageStore](self, "messageStore"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v6));
      v20 = 3;
      goto LABEL_11;
    case 4:
      v25 = -[WADatapathDiagnosticsMessageSubmitter initWithMessageGroupType:]([WADatapathDiagnosticsMessageSubmitter alloc], "initWithMessageGroupType:", 4);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v6));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 4));
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v25, v28);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine messageStore](self, "messageStore"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v6));
      v20 = 4;
      goto LABEL_11;
    case 5:
      v29 = -[WAMessageSubmitter initWithMessageGroupType:]([WAMessageSubmitter alloc], "initWithMessageGroupType:", 5);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", v6));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 5));
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v29, v32);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine messageStore](self, "messageStore"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v6));
      v20 = 5;
LABEL_11:
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v20));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v33));
      objc_msgSend(v34, "setSubmissionDelegate:", v17);

      break;
    default:
      break;
  }
  v35 = WALogCategoryDefaultHandle();
  v36 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[WAUtil groupTypeToString:](WAUtil, "groupTypeToString:", a4));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](WAUtil, "trimTokenForLogging:", v6));
    v39 = 136447234;
    v40 = "-[WAEngine _initSubmitterAndQueryableRegistrationForProcessToken:andGroupType:]";
    v41 = 1024;
    v42 = 2789;
    v43 = 2112;
    v44 = v37;
    v45 = 2048;
    v46 = a4;
    v47 = 2112;
    v48 = v38;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Registered group %@(%lu) for token %@", (uint8_t *)&v39, 0x30u);

  }
}

- (id)_getMessagesModelForProcessToken:(id)a3 groupType:(int64_t)a4 andError:(id *)a5
{
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v32;
  NSObject *v33;
  id *v35;
  id obj;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;
  _BYTE v53[128];
  NSErrorUserInfoKey v54;
  const __CFString *v55;
  NSErrorUserInfoKey v56;
  const __CFString *v57;

  v39 = objc_alloc_init((Class)NSMutableDictionary);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[WAUtil resourcePath](WAUtil, "resourcePath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%ld/"), v7, a4));

  v9 = WALogCategoryDefaultHandle();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v46 = "-[WAEngine _getMessagesModelForProcessToken:groupType:andError:]";
    v47 = 1024;
    v48 = 2801;
    v49 = 2112;
    v50 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:pathForGrouppathForGroup %@", buf, 0x1Cu);
  }

  if (v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentsOfDirectoryAtPath:error:", v8, 0));

    if (objc_msgSend(v12, "count"))
    {
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
      if (!v14)
      {

        v18 = 0;
        v17 = 0;
        v16 = 0;
        goto LABEL_27;
      }
      v15 = v14;
      v35 = a5;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v37 = *(_QWORD *)v42;
      v38 = v8;
      obj = v13;
      while (2)
      {
        v19 = 0;
        v20 = v16;
        v21 = v17;
        v22 = v18;
        do
        {
          if (*(_QWORD *)v42 != v37)
            objc_enumerationMutation(obj);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v19), "componentsSeparatedByString:", CFSTR(".")));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstObject"));

          v25 = objc_alloc((Class)NSData);
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@.wam"), v38, v24));
          v27 = objc_msgSend(v25, "initWithContentsOfFile:options:error:", v26, 8, 0);

          v17 = v27;
          v28 = objc_opt_class(WAMessageAWD);
          v40 = v22;
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v28, v17, &v40));
          v18 = v40;

          if (v18)
          {
            v29 = WALogCategoryDefaultHandle();
            v30 = objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              v46 = "-[WAEngine _getMessagesModelForProcessToken:groupType:andError:]";
              v47 = 1024;
              v48 = 2812;
              v49 = 2112;
              v50 = v24;
              v51 = 2112;
              v52 = v18;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive a WAMessageAWD instance with key of %@. Error: %@", buf, 0x26u);
            }

          }
          if (!v16)
          {
            v32 = WALogCategoryDefaultHandle();
            v33 = objc_claimAutoreleasedReturnValue(v32);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              v46 = "-[WAEngine _getMessagesModelForProcessToken:groupType:andError:]";
              v47 = 1024;
              v48 = 2814;
              v49 = 2112;
              v50 = v24;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unobscure message for key: %@", buf, 0x1Cu);
            }

            v16 = 0;
            v31 = obj;
            goto LABEL_22;
          }
          objc_msgSend(v39, "setObject:forKeyedSubscript:", v16, v24);

          v19 = (char *)v19 + 1;
          v20 = v16;
          v21 = v17;
          v22 = v18;
        }
        while (v15 != v19);
        v31 = obj;
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
        if (v15)
          continue;
        break;
      }
LABEL_22:
      v12 = v31;
      v8 = v38;
      a5 = v35;
    }
    else
    {
      v54 = NSLocalizedFailureReasonErrorKey;
      v55 = CFSTR("WAErrorCodeFileSystemError");
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1));
      v18 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9015, v31));
      v16 = 0;
      v17 = 0;
    }
  }
  else
  {
    v56 = NSLocalizedFailureReasonErrorKey;
    v57 = CFSTR("WAErrorCodeFileSystemError");
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1));
    v18 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9015, v31));
    v16 = 0;
    v17 = 0;
    v12 = 0;
  }

  if (a5 && v18)
    *a5 = objc_msgSend(v18, "copy");
  v13 = v12;
LABEL_27:

  return v39;
}

- (id)_cachedModelObjectsMessageForGroupType:(int64_t)a3 key:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  OS_dispatch_queue *mutexQueue;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  int64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a4;
  v7 = v6;
  v8 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_10004B174;
  v20 = sub_10004B184;
  v21 = 0;
  if (a3 >= 1 && v6)
  {
    mutexQueue = self->_mutexQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100055440;
    v12[3] = &unk_1000CD468;
    v14 = &v16;
    v15 = a3;
    v12[4] = self;
    v13 = v6;
    dispatch_sync((dispatch_queue_t)mutexQueue, v12);

    v8 = (void *)v17[5];
  }
  v10 = v8;
  _Block_object_dispose(&v16, 8);

  return v10;
}

- (void)_getNewMessageForKey:(id)a3 groupType:(int64_t)a4 forProcessToken:(id)a5 shouldCheckForPrePopulation:(BOOL)a6 andReply:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  void (**v14)(id, void *, _QWORD);
  void *v15;
  id v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  void (**v30)(id, void *, _QWORD);
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;

  v8 = a6;
  v12 = a3;
  v13 = a5;
  v14 = (void (**)(id, void *, _QWORD))a7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine _cachedModelObjectsMessageForGroupType:key:](self, "_cachedModelObjectsMessageForGroupType:key:", a4, v12));
  v16 = +[WAUtil rotateUUIDsForMessage:](WAUtil, "rotateUUIDsForMessage:", v15);
  if (!v15)
  {
    v26 = WALogCategoryDefaultHandle();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v32 = "-[WAEngine _getNewMessageForKey:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:]";
      v33 = 1024;
      v34 = 2853;
      v35 = 2112;
      v36 = v12;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}s::%d:No model class found for key: %@. This is a CRITICAL error", buf, 0x1Cu);
    }

    goto LABEL_11;
  }
  if (!v8
    || (v17 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator")),
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "originalClassName")),
        v19 = objc_msgSend(v17, "doesMessageNeedPrepopulation:", v18),
        v18,
        v17,
        !v19))
  {
LABEL_11:
    v14[2](v14, v15, 0);
    goto LABEL_7;
  }
  v20 = WALogCategoryDefaultHandle();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "key"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "originalClassName"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](WAUtil, "trimTokenForLogging:", v13));
    *(_DWORD *)buf = 136447234;
    v32 = "-[WAEngine _getNewMessageForKey:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:]";
    v33 = 1024;
    v34 = 2856;
    v35 = 2112;
    v36 = v22;
    v37 = 2112;
    v38 = v23;
    v39 = 2112;
    v40 = v24;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%{public}s::%d:WAMessageAWD with key: %@ and original classname: %@ requires IOReporter population... (proc token: %@)", buf, 0x30u);

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000558F4;
  v28[3] = &unk_1000CD490;
  v30 = v14;
  v29 = v15;
  objc_msgSend(v25, "prepopulateMessage:forProcess:groupType:andReply:", v29, v13, a4, v28);

LABEL_7:
}

- (void)_getNewMessageForKeyWithinPopulatorBlock:(id)a3 groupType:(int64_t)a4 forProcessToken:(id)a5 shouldCheckForPrePopulation:(BOOL)a6 andReply:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  void (**v14)(id, void *, _QWORD);
  void *v15;
  id v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  void (**v30)(id, void *, _QWORD);
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;

  v8 = a6;
  v12 = a3;
  v13 = a5;
  v14 = (void (**)(id, void *, _QWORD))a7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine _cachedModelObjectsMessageForGroupType:key:](self, "_cachedModelObjectsMessageForGroupType:key:", a4, v12));
  v16 = +[WAUtil rotateUUIDsForMessage:](WAUtil, "rotateUUIDsForMessage:", v15);
  if (!v15)
  {
    v26 = WALogCategoryDefaultHandle();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v32 = "-[WAEngine _getNewMessageForKeyWithinPopulatorBlock:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:]";
      v33 = 1024;
      v34 = 2874;
      v35 = 2112;
      v36 = v12;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}s::%d:No model class found for key: %@. This is a CRITICAL error", buf, 0x1Cu);
    }

    goto LABEL_11;
  }
  if (!v8
    || (v17 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator")),
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "originalClassName")),
        v19 = objc_msgSend(v17, "doesMessageNeedPrepopulation:", v18),
        v18,
        v17,
        !v19))
  {
LABEL_11:
    v14[2](v14, v15, 0);
    goto LABEL_7;
  }
  v20 = WALogCategoryDefaultHandle();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "key"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "originalClassName"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](WAUtil, "trimTokenForLogging:", v13));
    *(_DWORD *)buf = 136447234;
    v32 = "-[WAEngine _getNewMessageForKeyWithinPopulatorBlock:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:]";
    v33 = 1024;
    v34 = 2877;
    v35 = 2112;
    v36 = v22;
    v37 = 2112;
    v38 = v23;
    v39 = 2112;
    v40 = v24;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%{public}s::%d:WAMessageAWD with key: %@ and original classname: %@ requires IOReporter population... (proc token: %@)", buf, 0x30u);

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100055BE8;
  v28[3] = &unk_1000CD490;
  v30 = v14;
  v29 = v15;
  objc_msgSend(v25, "prepopulateMessageWithinPopulatorBlock:forProcess:groupType:andReply:", v29, v13, a4, v28);

LABEL_7:
}

- (void)_getNewMessageForKey:(id)a3 groupType:(int64_t)a4 withCopy:(BOOL)a5 forProcessToken:(id)a6 shouldCheckForPrePopulation:(BOOL)a7 andReply:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v11;
  id v14;
  id v15;
  void (**v16)(id, void *, _QWORD);
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  unsigned int v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  _QWORD v32[4];
  id v33;
  void (**v34)(id, void *, _QWORD);
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;

  v9 = a7;
  v11 = a5;
  v14 = a3;
  v15 = a6;
  v16 = (void (**)(id, void *, _QWORD))a8;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine _cachedModelObjectsMessageForGroupType:key:](self, "_cachedModelObjectsMessageForGroupType:key:", a4, v14));
  v18 = v17;
  if (v11)
  {
    v19 = objc_msgSend(v17, "copy");

    v18 = v19;
  }
  v20 = +[WAUtil rotateUUIDsForMessage:](WAUtil, "rotateUUIDsForMessage:", v18);
  if (!v18)
  {
    v30 = WALogCategoryDefaultHandle();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v36 = "-[WAEngine _getNewMessageForKey:groupType:withCopy:forProcessToken:shouldCheckForPrePopulation:andReply:]";
      v37 = 1024;
      v38 = 2900;
      v39 = 2112;
      v40 = v14;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%{public}s::%d:No model class found for key: %@. This is a CRITICAL error", buf, 0x1Cu);
    }

    goto LABEL_13;
  }
  if (!v9
    || (v21 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator")),
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "originalClassName")),
        v23 = objc_msgSend(v21, "doesMessageNeedPrepopulation:", v22),
        v22,
        v21,
        !v23))
  {
LABEL_13:
    v16[2](v16, v18, 0);
    goto LABEL_9;
  }
  v24 = WALogCategoryDefaultHandle();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "key"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "originalClassName"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](WAUtil, "trimTokenForLogging:", v15));
    *(_DWORD *)buf = 136447234;
    v36 = "-[WAEngine _getNewMessageForKey:groupType:withCopy:forProcessToken:shouldCheckForPrePopulation:andReply:]";
    v37 = 1024;
    v38 = 2903;
    v39 = 2112;
    v40 = v26;
    v41 = 2112;
    v42 = v27;
    v43 = 2112;
    v44 = v28;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%{public}s::%d:WAMessageAWD with key: %@ and original classname: %@ requires IOReporter population... (proc token: %@)", buf, 0x30u);

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator"));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100055EF8;
  v32[3] = &unk_1000CD490;
  v34 = v16;
  v33 = v18;
  objc_msgSend(v29, "prepopulateMessage:forProcess:groupType:andReply:", v33, v15, a4, v32);

LABEL_9:
}

- (id)_ingestMessage:(id)a3 forProcessToken:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  NSErrorUserInfoKey v11;
  const __CFString *v12;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine messageStore](self, "messageStore"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine messageStore](self, "messageStore"));
    objc_msgSend(v7, "updateMessage:", v5);

    -[WAEngine _persist](self, "_persist");
    v8 = 0;
  }
  else
  {
    v11 = NSLocalizedFailureReasonErrorKey;
    v12 = CFSTR("WAErrorCodeInternalError");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9003, v10));

  }
  return v8;
}

- (id)_submitMessage:(id)a3 groupType:(int64_t)a4 forProcessToken:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  NSErrorUserInfoKey v25;
  const __CFString *v26;
  NSErrorUserInfoKey v27;
  const __CFString *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  id v34;
  __int16 v35;
  int64_t v36;

  v8 = a3;
  v9 = a5;
  if (!v8)
  {
    v20 = WALogCategoryDefaultHandle();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v30 = "-[WAEngine _submitMessage:groupType:forProcessToken:]";
      v31 = 1024;
      v32 = 2927;
      v33 = 2112;
      v34 = v9;
      v35 = 2048;
      v36 = a4;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}s::%d:Process with token: %@ for grouptype: %ld tried to submit a NULL message ", buf, 0x26u);
    }

    v27 = NSLocalizedFailureReasonErrorKey;
    v28 = CFSTR("WAErrorCodeLacksRequiredArgument");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
    v22 = 9010;
    goto LABEL_11;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v12));

  if (!v13)
  {
    v23 = WALogCategoryDefaultHandle();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v30 = "-[WAEngine _submitMessage:groupType:forProcessToken:]";
      v31 = 1024;
      v32 = 2928;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}s::%d:no submitter to submit to, has this WAGroupType been registered? ", buf, 0x12u);
    }

    v25 = NSLocalizedFailureReasonErrorKey;
    v26 = CFSTR("WAErrorCodeMessageNotRegistered");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
    v22 = 9005;
LABEL_11:
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), v22, v14));
    goto LABEL_4;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v9));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "submitMessage:", v8));

LABEL_4:
  return v18;
}

- (void)_writeWiFiAnalyticsMessageToJSONFile:(id)a3 metricInfo:(id)a4
{
  id v6;
  id v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;

  v6 = a3;
  v7 = a4;
  v8 = +[NSJSONSerialization isValidJSONObject:](NSJSONSerialization, "isValidJSONObject:", v7);
  v9 = WALogCategoryDefaultHandle();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if ((v8 & 1) == 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v27 = "-[WAEngine _writeWiFiAnalyticsMessageToJSONFile:metricInfo:]";
      v28 = 1024;
      v29 = 2949;
      v30 = 2112;
      v31 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:Invalid data passed to JSON serialization for %@", buf, 0x1Cu);
    }
    v17 = 0;
    v19 = 0;
    v18 = 0;
    v14 = 0;
    v12 = 0;
    v15 = 0;
    goto LABEL_8;
  }
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_writeWiFiAnalyticsMessageToJSONFile", ", buf, 2u);
  }

  v12 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v12, "setDateFormat:", CFSTR("yyyy'-'MM'-'dd-HHmmssSSS"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringFromDate:", v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("wifianalytics_%@.json"), v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine wifianalyticsTmpDir](self, "wifianalyticsTmpDir"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "URLByAppendingPathComponent:isDirectory:", v15, 0));

  v25 = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v7, 3, &v25));
  v19 = v25;
  if (v19
    || (v20 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v18, 4),
        v24 = 0,
        objc_msgSend(v20, "writeToURL:atomically:encoding:error:", v17, 1, 4, &v24),
        v19 = v24,
        v20,
        v19))
  {
    v21 = WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v27 = "-[WAEngine _writeWiFiAnalyticsMessageToJSONFile:metricInfo:]";
      v28 = 1024;
      v29 = 2969;
      v30 = 2112;
      v31 = v15;
      v32 = 2112;
      v33 = v19;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to write to file %@ error %@", buf, 0x26u);
    }
LABEL_8:

  }
  v22 = WALogCategoryDefaultHandle();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_writeWiFiAnalyticsMessageToJSONFile", ", buf, 2u);
  }

}

- (void)_processWAMessageForLogging:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];

  v26 = a3;
  v3 = WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_processWAMessageForLogging", ", buf, 2u);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (!v25)
  {
    v24 = WALogCategoryDefaultHandle();
    v20 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v32 = "-[WAEngine _processWAMessageForLogging:]";
      v33 = 1024;
      v34 = 2986;
      v35 = 2080;
      v36 = "-[WAEngine _processWAMessageForLogging:]";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}s::%d:%s: Null logDict", buf, 0x1Cu);
    }
    goto LABEL_16;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "metricInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    v10 = kWAMessageOptions;
    v11 = kWAMessageValue;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "metricInfo", v25));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v13));

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v10));
        v17 = objc_msgSend(v16, "integerValue");

        if ((v17 & 4) != 0)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v11));
          objc_msgSend(v25, "setObject:forKey:", v18, v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v25, "count"))
  {
    v19 = WALogCategoryDefaultHandle();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "metricName"));
      *(_DWORD *)buf = 136447234;
      v32 = "-[WAEngine _processWAMessageForLogging:]";
      v33 = 1024;
      v34 = 2998;
      v35 = 2080;
      v36 = "-[WAEngine _processWAMessageForLogging:]";
      v37 = 2112;
      v38 = v21;
      v39 = 2112;
      v40 = v25;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s: metricName %@ with metricInfo %@", buf, 0x30u);

    }
LABEL_16:

  }
  v22 = WALogCategoryDefaultHandle();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_processWAMessageForLogging", ", buf, 2u);
  }

}

- (void)_processWAMessageForNewIORPossibility:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(v8, "options") & 8) != 0)
    goto LABEL_5;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metricName"));
  if (objc_msgSend(v4, "isEqualToString:", kWAMessageMetricNameLinkChange))
  {

LABEL_5:
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator"));
    objc_msgSend(v7, "signalPotentialNewIORChannels");

    goto LABEL_6;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metricName"));
  v6 = objc_msgSend(v5, "isEqualToString:", kWAMessageMetricNameClientAssociation);

  if (v6)
    goto LABEL_5;
LABEL_6:

}

- (id)_submitWiFiAnalyticsMessageAdvanced:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  NSObject *v16;
  const __CFString **v17;
  NSErrorUserInfoKey *v18;
  void *v19;
  void *v20;
  double v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  id v33;
  NSObject *v34;
  _QWORD block[5];
  NSErrorUserInfoKey v36;
  const __CFString *v37;
  NSErrorUserInfoKey v38;
  const __CFString *v39;
  NSErrorUserInfoKey v40;
  const __CFString *v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  uint64_t v47;

  v4 = a3;
  v5 = WALogCategoryDefaultHandle();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metricName"));
    *(_DWORD *)buf = 136446722;
    v43 = "-[WAEngine _submitWiFiAnalyticsMessageAdvanced:]";
    v44 = 1024;
    v45 = 3021;
    v46 = 2112;
    v47 = (uint64_t)v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Received message %@", buf, 0x1Cu);

  }
  if (!v4)
  {
    v33 = WALogCategoryDefaultHandle();
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v43 = "-[WAEngine _submitWiFiAnalyticsMessageAdvanced:]";
      v44 = 1024;
      v45 = 3023;
      v46 = 2048;
      v47 = 5;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%{public}s::%d:for grouptype: %ld tried to submit a NULL message ", buf, 0x1Cu);
    }

    v40 = NSLocalizedFailureReasonErrorKey;
    v41 = CFSTR("WAErrorCodeLacksRequiredArgument");
    v17 = &v41;
    v18 = &v40;
    goto LABEL_11;
  }
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metricName"));
  if (!v8
    || (v9 = (void *)v8,
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metricInfo")),
        v10,
        v9,
        !v10))
  {
    v15 = WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v43 = "-[WAEngine _submitWiFiAnalyticsMessageAdvanced:]";
      v44 = 1024;
      v45 = 3024;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:NULL metricName or NULL metricInfo", buf, 0x12u);
    }

    v38 = NSLocalizedFailureReasonErrorKey;
    v39 = CFSTR("WAErrorCodeLacksRequiredArgument");
    v17 = &v39;
    v18 = &v38;
LABEL_11:
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v18, 1));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9010, v19));

    v12 = 0;
    goto LABEL_30;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metricInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kWAMessageKeyMetricProcessImmediately));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", kWAMessageValue));
    v14 = objc_msgSend(v13, "BOOLValue");

  }
  else
  {
    v14 = 0;
  }
  if ((objc_msgSend(v4, "options") & 0x10) != 0)
  {
    v25 = WALogCategoryDefaultHandle();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metricName"));
      *(_DWORD *)buf = 136446722;
      v43 = "-[WAEngine _submitWiFiAnalyticsMessageAdvanced:]";
      v44 = 1024;
      v45 = 3032;
      v46 = 2112;
      v47 = (uint64_t)v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Message has option WiFiAnalyticsMessageTypeManagedFault, processing immediately %@", buf, 0x1Cu);

    }
    -[WAEngine _processWAMessageForNewIORPossibility:](self, "_processWAMessageForNewIORPossibility:", v4);
  }
  else
  {
    -[WAEngine _processWAMessageForNewIORPossibility:](self, "_processWAMessageForNewIORPossibility:", v4);
    if ((v14 & 1) == 0)
    {
      -[WAEngine analyticsProcessingTimeIntervalSecs](self, "analyticsProcessingTimeIntervalSecs");
      if (v21 >= 1.0)
      {
        v22 = WALogCategoryDefaultHandle();
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v43 = "-[WAEngine _submitWiFiAnalyticsMessageAdvanced:]";
          v44 = 1024;
          v45 = 3038;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error! Journals are not intended to be processed Immediately", buf, 0x12u);
        }

        v36 = NSLocalizedFailureReasonErrorKey;
        v37 = CFSTR("WAErrorCodeLacksRequiredArgument");
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9010, v24));

        goto LABEL_30;
      }
    }
  }
  v28 = WALogCategoryDefaultHandle();
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metricName"));
    *(_DWORD *)buf = 136446722;
    v43 = "-[WAEngine _submitWiFiAnalyticsMessageAdvanced:]";
    v44 = 1024;
    v45 = 3040;
    v46 = 2112;
    v47 = (uint64_t)v30;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%@ Process Immediately: read JSON files", buf, 0x1Cu);

  }
  if (+[WAUtil isWritingWAMessageToJsonAllowed](WAUtil, "isWritingWAMessageToJsonAllowed")
    && +[WAUtil isAnalyticsProcessorAllowed](WAUtil, "isAnalyticsProcessorAllowed"))
  {
    v31 = objc_claimAutoreleasedReturnValue(-[WAEngine fileHandlingQ](self, "fileHandlingQ"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100057074;
    block[3] = &unk_1000CCDB0;
    block[4] = self;
    dispatch_async(v31, block);

  }
  if ((objc_msgSend(v4, "options") & 0x10) != 0)
    -[WAEngine processWiFiAnalyticsManagedFault:](self, "processWiFiAnalyticsManagedFault:", v4);
  v20 = 0;
LABEL_30:

  return v20;
}

- (id)_getMessageByUUID:(id)a3 forProcessToken:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSErrorUserInfoKey v19;
  const __CFString *v20;
  NSErrorUserInfoKey v21;
  const __CFString *v22;
  NSErrorUserInfoKey v23;
  const __CFString *v24;

  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    v23 = NSLocalizedFailureReasonErrorKey;
    v24 = CFSTR("WAErrorCodeInternalError");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    v16 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9003, v15);

    v13 = 0;
    v12 = 0;
    goto LABEL_5;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine messageStore](self, "messageStore"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine messageStore](self, "messageStore"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "messageForUUID:", v8));

    if (v12)
    {
      v13 = 0;
      goto LABEL_5;
    }
    v19 = NSLocalizedFailureReasonErrorKey;
    v20 = CFSTR("WAErrorCodeMessageNoMessageForUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v18 = 9004;
  }
  else
  {
    v21 = NSLocalizedFailureReasonErrorKey;
    v22 = CFSTR("WAErrorCodeInternalError");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    v18 = 9003;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), v18, v17));

  v12 = 0;
  if (a5 && v13)
  {
    v12 = 0;
    *a5 = objc_msgSend(v13, "copy");
  }
LABEL_5:

  return v12;
}

- (void)_killDaemonAndReply:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  -[WAEngine _prepareToTerminate](self, "_prepareToTerminate");
  exit(143);
}

- (void)_clearMessageStoreAndReply:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine messageStore](self, "messageStore"));
  objc_msgSend(v4, "clearMessageStore");

  -[WAEngine _persist](self, "_persist");
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
    v5 = v6;
  }

}

- (void)_purgeGroupTypeIfNecessary:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  NSObject *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int64_t v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  _BYTE v45[128];

  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v33;
    obj = v5;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap", obj));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v11));

        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v29;
          while (2)
          {
            for (j = 0; j != v15; j = (char *)j + 1)
            {
              if (*(_QWORD *)v29 != v16)
                objc_enumerationMutation(v13);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j), "integerValue") == (id)a3)
              {
                v18 = v11;

                v8 = v18;
                goto LABEL_16;
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
            if (v15)
              continue;
            break;
          }
        }
LABEL_16:

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
    }
    while (v7);

    if (v8)
    {
      v19 = WALogCategoryDefaultHandle();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](WAUtil, "trimTokenForLogging:", v8));
        *(_DWORD *)buf = 136446978;
        v37 = "-[WAEngine _purgeGroupTypeIfNecessary:]";
        v38 = 1024;
        v39 = 3099;
        v40 = 2048;
        v41 = a3;
        v42 = 2112;
        v43 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:XPC: Found an old token for WAGroupType: %ld (%@). Purging it now as a process is trying to register for the same group type", buf, 0x26u);

      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
      objc_msgSend(v22, "removeObjectForKey:", v8);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
      objc_msgSend(v23, "removeObjectForKey:", v8);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToXPCConnectionMap](self, "processTokenToXPCConnectionMap"));
      objc_msgSend(v24, "removeObjectForKey:", v8);

      goto LABEL_25;
    }
  }
  else
  {

  }
  v25 = WALogCategoryDefaultHandle();
  v8 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    v37 = "-[WAEngine _purgeGroupTypeIfNecessary:]";
    v38 = 1024;
    v39 = 3098;
    v40 = 2048;
    v41 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: No old tokens for newly registered WAGroupType: %ld - no purge necessary.", buf, 0x1Cu);
  }
LABEL_25:

}

- (void)_sendMemoryPressureRequestAndReply:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[WAEngine handleMemoryWarning:](self, "handleMemoryWarning:", 1);
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);
    v4 = v5;
  }

}

- (void)_issueIOReportManagementCommand:(unint64_t)a3 forProcessToken:(id)a4 andReply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  id v34;
  NSString *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  size_t dataOutAvailable;
  id v41;
  NSObject *v42;
  id v43;
  void *v44;
  id v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  _DWORD *v51;
  int v52;
  void *v53;
  void *v54;
  CCCryptorStatus v55;
  id v56;
  NSObject *v57;
  const char *v58;
  NSObject *v59;
  os_log_type_t v60;
  id v61;
  NSObject *v62;
  id v63;
  NSObject *v64;
  void (**v65)(_QWORD, _QWORD, _QWORD);
  void *v66;
  id v67;
  NSObject *v68;
  const char *v69;
  id v70;
  NSObject *v71;
  id v72;
  NSObject *v73;
  void *v74;
  id v75;
  id v76;
  NSObject *v77;
  id v78;
  NSObject *v79;
  id v80;
  NSObject *v81;
  void *v82;
  id v83;
  id v84;
  NSObject *v85;
  id v86;
  NSObject *v87;
  void *v88;
  id v89;
  id v90;
  NSObject *v91;
  id v92;
  NSObject *v93;
  id v94;
  id v95;
  NSObject *v96;
  id v97;
  NSObject *v98;
  void *v99;
  unsigned __int8 v100;
  void *v101;
  void *v102;
  id v103;
  NSObject *v104;
  id v105;
  NSObject *v106;
  void *v107;
  id v108;
  id v109;
  NSObject *v110;
  id v111;
  NSObject *v112;
  id v113;
  void *v114;
  id v115;
  NSObject *v116;
  id v117;
  NSObject *v118;
  NSString *v119;
  void *v120;
  void *v121;
  void *v122;
  const __CFString *v123;
  id v124;
  NSObject *v125;
  void *v126;
  void *v127;
  id v128;
  NSObject *v129;
  id v130;
  NSObject *v131;
  void *v132;
  void *v133;
  id v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  NSSet *v140;
  void *v141;
  void *v142;
  id v143;
  id v144;
  NSObject *v145;
  void *v146;
  id v147;
  NSObject *v148;
  void *v149;
  id v150;
  NSObject *v151;
  id v152;
  void *v153;
  void *v154;
  id v155;
  WAIOReporterMessagePopulator *v156;
  id v157;
  void *v158;
  id v159;
  NSObject *v160;
  void *v161;
  uint64_t v162;
  id v163;
  NSObject *v164;
  id v165;
  NSObject *v166;
  void *v167;
  void *v168;
  id v169;
  NSObject *v170;
  id v171;
  NSObject *v172;
  id v173;
  NSObject *v174;
  NSErrorUserInfoKey v175;
  void *v176;
  void *v177;
  id v178;
  NSObject *v179;
  void *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  void *v186;
  void *v187;
  size_t v188;
  void *v189;
  void *dataOut;
  void *v191;
  id v192;
  id v193;
  id v194;
  id v195;
  size_t v196;
  NSErrorUserInfoKey v197;
  const __CFString *v198;
  NSErrorUserInfoKey v199;
  const __CFString *v200;
  NSErrorUserInfoKey v201;
  const __CFString *v202;
  NSErrorUserInfoKey v203;
  const __CFString *v204;
  NSErrorUserInfoKey v205;
  const __CFString *v206;
  uint64_t v207;
  int v208;
  NSErrorUserInfoKey v209;
  const __CFString *v210;
  NSErrorUserInfoKey v211;
  const __CFString *v212;
  NSErrorUserInfoKey v213;
  const __CFString *v214;
  _BYTE key[48];
  _BYTE buf[18];
  __int16 v217;
  uint64_t v218;
  __int16 v219;
  void *v220;
  NSErrorUserInfoKey v221;
  const __CFString *v222;

  v8 = a4;
  v193 = a5;
  v9 = objc_alloc_init((Class)NSMutableDictionary);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("Command"));

  objc_msgSend(v9, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("Success"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v8));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 3));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v13));

  if (!v14)
  {
    v15 = WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3127;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:Caller did not register", buf, 0x12u);
    }

    if (v8)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v8));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 3));
      v20 = objc_msgSend(v18, "containsObject:", v19);

      if (!v20)
      {
        -[WAEngine _purgeGroupTypeIfNecessary:](self, "_purgeGroupTypeIfNecessary:", 3);
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v8));

        if (!v22)
        {
          v23 = objc_alloc_init((Class)NSMutableSet);
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, v8);

        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", v8));
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 3));
        objc_msgSend(v26, "addObject:", v27);

        -[WAEngine _persist](self, "_persist");
        v28 = WALogCategoryDefaultHandle();
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](WAUtil, "trimTokenForLogging:", v8));
          *(_DWORD *)buf = 136446978;
          *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3139;
          v217 = 2048;
          v218 = 3;
          v219 = 2112;
          v220 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: registering message group type: %ld for process: %@", buf, 0x26u);

        }
        goto LABEL_11;
      }
      v178 = WALogCategoryDefaultHandle();
      v179 = objc_claimAutoreleasedReturnValue(v178);
      if (os_log_type_enabled(v179, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3129;
        v217 = 2048;
        v218 = 3;
        _os_log_impl((void *)&_mh_execute_header, v179, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: processTokenToGroupTypeMap seems to think this process token has already registered group type: %ld", buf, 0x1Cu);
      }

      v175 = NSLocalizedFailureReasonErrorKey;
    }
    else
    {
      v173 = WALogCategoryDefaultHandle();
      v174 = objc_claimAutoreleasedReturnValue(v173);
      if (os_log_type_enabled(v174, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3128;
        _os_log_impl((void *)&_mh_execute_header, v174, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:couldn't get process name for connection", buf, 0x12u);
      }

      v175 = NSLocalizedFailureReasonErrorKey;
      v221 = NSLocalizedFailureReasonErrorKey;
      v222 = CFSTR("WAErrorCodeInternalError");
      v176 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v222, &v221, 1));
      v177 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9003, v176));

    }
    v197 = v175;
    v198 = CFSTR("WAErrorCodeInternalError");
    v180 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v198, &v197, 1));
    v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9003, v180));

    v65 = (void (**)(_QWORD, _QWORD, _QWORD))v193;
    (*((void (**)(id, _QWORD, void *))v193 + 2))(v193, 0, v101);
    goto LABEL_133;
  }
LABEL_11:
  switch(a3)
  {
    case 0uLL:
      v31 = WALogCategoryDefaultHandle();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3144;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandReloadViaUnpersist start", buf, 0x12u);
      }

      -[WAEngine setIorMessagePopulator:](self, "setIorMessagePopulator:", 0);
      v196 = 0;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine _getObscureKey](self, "_getObscureKey"));
      self->_readingPersistFile = 1;
      v34 = objc_alloc((Class)NSData);
      v35 = NSHomeDirectory();
      v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@t.out"), v36, CFSTR("/Library/com.apple.wifianalyticsd/.wa/")));
      v38 = objc_msgSend(v34, "initWithContentsOfFile:options:error:", v37, 1, 0);

      v39 = objc_msgSend(v38, "length");
      memset(key, 0, 33);
      v192 = v38;
      if (!v38)
      {
        v117 = WALogCategoryDefaultHandle();
        v118 = objc_claimAutoreleasedReturnValue(v117);
        if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
        {
          v119 = NSHomeDirectory();
          v120 = (void *)objc_claimAutoreleasedReturnValue(v119);
          v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@t.out"), v120, CFSTR("/Library/com.apple.wifianalyticsd/.wa/")));
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3163;
          v217 = 2112;
          v218 = (uint64_t)v121;
          _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_ERROR, "%{public}s::%d:No persistence file %@", buf, 0x1Cu);

        }
        v213 = NSLocalizedFailureReasonErrorKey;
        v214 = CFSTR("WAErrorCodeNoPersistenceFile");
        v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v214, &v213, 1));
        v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9031, v122));

        v123 = CFSTR("No persistence file");
        goto LABEL_93;
      }
      if (!v33)
      {
        v124 = WALogCategoryDefaultHandle();
        v125 = objc_claimAutoreleasedReturnValue(v124);
        if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3170;
          _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_ERROR, "%{public}s::%d:Couldn't get key to unobscure persistence file, triggering removal of persistence file", buf, 0x12u);
        }

        -[WAEngine _removePersistenceFile](self, "_removePersistenceFile");
        v211 = NSLocalizedFailureReasonErrorKey;
        v212 = CFSTR("WAErrorCodeNoObscureKeyFile");
        v126 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v212, &v211, 1));
        v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9032, v126));

        v123 = CFSTR("No unobscure persistence file");
        goto LABEL_93;
      }
      v188 = (size_t)v39;
      dataOutAvailable = (size_t)v39 + 16;
      objc_msgSend(v33, "getCString:maxLength:encoding:", key, 33, 4);
      v41 = WALogCategoryDefaultHandle();
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v43 = objc_msgSend(v33, "length");
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3179;
        v217 = 2048;
        v218 = (uint64_t)v43;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:kWAIORCommandReloadViaUnpersist got unobscuring key %lu bytes", buf, 0x1Cu);
      }

      v44 = malloc_type_malloc(dataOutAvailable, 0x371F6E8CuLL);
      v45 = WALogCategoryDefaultHandle();
      v46 = objc_claimAutoreleasedReturnValue(v45);
      v47 = v46;
      dataOut = v44;
      if (!v44)
      {
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3183;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%{public}s::%d:Couldn't allocate buffer to unobscure persistence data", buf, 0x12u);
        }

        v209 = NSLocalizedFailureReasonErrorKey;
        v210 = CFSTR("WAErrorCodeInternalError");
        v127 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v210, &v209, 1));
        v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9003, v127));

        v123 = CFSTR("malloc failed");
LABEL_93:
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v123, CFSTR("Details"));
        v53 = v192;
        v65 = (void (**)(_QWORD, _QWORD, _QWORD))v193;
        goto LABEL_128;
      }
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3189;
        v217 = 2048;
        v218 = dataOutAvailable;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:kWAIORCommandReloadViaUnpersist malloced %lu bytes", buf, 0x1Cu);
      }

      v48 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine _getDataFromKeychain:](self, "_getDataFromKeychain:", CFSTR("com.apple.wifi.analytics.persistence-iv")));
      v49 = objc_claimAutoreleasedReturnValue(-[WAEngine _getDataFromKeychain:](self, "_getDataFromKeychain:", CFSTR("com.apple.wifi.analytics.persistence-tag")));
      v186 = (void *)v49;
      v187 = v48;
      if (v48 && (v50 = (void *)v49) != 0)
      {
        v51 = objc_msgSend(objc_retainAutorelease(v48), "bytes");
        v52 = v51[2];
        v207 = *(_QWORD *)v51;
        v208 = v52;
        *(_OWORD *)buf = *(_OWORD *)objc_msgSend(objc_retainAutorelease(v50), "bytes");
        v53 = v192;
        v54 = dataOut;
        v55 = CCCryptorGCMOneshotDecrypt(0, key, 32, &v207, 12, 0, 0, objc_msgSend(objc_retainAutorelease(v192), "bytes"), v188, dataOut, buf, 16);
        v196 = v188;
      }
      else
      {
        v128 = WALogCategoryDefaultHandle();
        v129 = objc_claimAutoreleasedReturnValue(v128);
        if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3207;
          v217 = 2080;
          v218 = (uint64_t)"-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
          _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s: IV and tag not found", buf, 0x1Cu);
        }

        v53 = v192;
        v54 = dataOut;
        v55 = CCCrypt(1u, 0, 1u, key, 0x20uLL, 0, objc_msgSend(objc_retainAutorelease(v192), "bytes"), v188, dataOut, dataOutAvailable, &v196);
      }
      self->_readingPersistFile = 0;
      if (v55)
      {
        v130 = WALogCategoryDefaultHandle();
        v131 = objc_claimAutoreleasedReturnValue(v130);
        if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446978;
          *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3215;
          v217 = 2080;
          v218 = (uint64_t)"-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
          v219 = 1024;
          LODWORD(v220) = v55;
          _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_ERROR, "%{public}s::%d:%s: Failed to unobscure: %d", buf, 0x22u);
        }

        free(v54);
        v205 = NSLocalizedFailureReasonErrorKey;
        v206 = CFSTR("WAErrorCodeInternalError");
        v132 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v206, &v205, 1));
        v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9003, v132));

        objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("CCCrypt failed"), CFSTR("Details"));
        v65 = (void (**)(_QWORD, _QWORD, _QWORD))v193;
        v133 = v186;
        goto LABEL_127;
      }
      v189 = v33;
      v134 = objc_alloc((Class)NSData);
      v135 = objc_msgSend(v134, "initWithBytes:length:", v54, v196);
      v184 = objc_opt_class(WAMessageAWD);
      v183 = objc_opt_class(NSError);
      v182 = objc_opt_class(NSString);
      v181 = objc_opt_class(WAField);
      v136 = objc_opt_class(NSMutableDictionary);
      v137 = objc_opt_class(NSDictionary);
      v138 = objc_opt_class(NSData);
      v139 = objc_opt_class(NSMutableArray);
      v140 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v184, v183, v182, v181, v136, v137, v138, v139, objc_opt_class(NSNumber), 0);
      v141 = (void *)objc_claimAutoreleasedReturnValue(v140);
      v195 = 0;
      v185 = v135;
      v142 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v141, v135, &v195));
      v143 = v195;

      if (v143)
      {
        v144 = WALogCategoryDefaultHandle();
        v145 = objc_claimAutoreleasedReturnValue(v144);
        if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3226;
          v217 = 2112;
          v218 = (uint64_t)v143;
          _os_log_impl((void *)&_mh_execute_header, v145, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive root persistence dict: %@", buf, 0x1Cu);
        }

        v203 = NSLocalizedFailureReasonErrorKey;
        v204 = CFSTR("WAErrorCodeInternalError");
        v146 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v204, &v203, 1));
        v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9003, v146));

        objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("Failed to unarchive root persistence"), CFSTR("Details"));
      }
      else
      {
        v101 = 0;
      }
      free(dataOut);
      v147 = WALogCategoryDefaultHandle();
      v148 = objc_claimAutoreleasedReturnValue(v147);
      if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3234;
        _os_log_impl((void *)&_mh_execute_header, v148, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:kWAIORCommandReloadViaUnpersist NSKeyedUnarchiver complete", buf, 0x12u);
      }

      v191 = v142;
      v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "objectForKeyedSubscript:", CFSTR("WA_PERSIST_IOREPORTER_REGISTRATIONS")));
      if (!v149)
        goto LABEL_121;
      v150 = WALogCategoryDefaultHandle();
      v151 = objc_claimAutoreleasedReturnValue(v150);
      if (os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT))
      {
        v152 = objc_msgSend(v149, "length");
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3239;
        v217 = 2048;
        v218 = (uint64_t)v152;
        _os_log_impl((void *)&_mh_execute_header, v151, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:iorReporterWrapperData size: %lu", buf, 0x1Cu);
      }

      v153 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v149, "length")));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v153, CFSTR("iorReporterWrapperData size"));

      v194 = 0;
      v154 = v149;
      v155 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(WAIOReporterMessagePopulator), v149, &v194);
      v156 = (WAIOReporterMessagePopulator *)objc_claimAutoreleasedReturnValue(v155);
      v157 = v194;
      if (v157)
      {
        v158 = v157;
        v159 = WALogCategoryDefaultHandle();
        v160 = objc_claimAutoreleasedReturnValue(v159);
        if (os_log_type_enabled(v160, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3244;
          v217 = 2112;
          v218 = (uint64_t)v158;
          _os_log_impl((void *)&_mh_execute_header, v160, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive WAIOReporterMessagePopulator: %@", buf, 0x1Cu);
        }

        v201 = NSLocalizedFailureReasonErrorKey;
        v202 = CFSTR("WAErrorCodeInternalError");
        v161 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v202, &v201, 1));
        v162 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9003, v161));

        objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("Failed to unarchive WAIOReporterMessagePopulator"), CFSTR("Details"));
        v101 = (void *)v162;
      }
      if (!v156)
      {
        v149 = v154;
LABEL_121:
        v154 = v149;
        v165 = WALogCategoryDefaultHandle();
        v166 = objc_claimAutoreleasedReturnValue(v165);
        if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3256;
          _os_log_impl((void *)&_mh_execute_header, v166, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unpersist, alloc new WAIOReporterMessagePopulator", buf, 0x12u);
        }

        v156 = objc_alloc_init(WAIOReporterMessagePopulator);
        -[WAEngine setIorMessagePopulator:](self, "setIorMessagePopulator:", v156);
        goto LABEL_124;
      }
      v163 = WALogCategoryDefaultHandle();
      v164 = objc_claimAutoreleasedReturnValue(v163);
      if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3252;
        _os_log_impl((void *)&_mh_execute_header, v164, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Unpersisting Success", buf, 0x12u);
      }

      -[WAEngine setIorMessagePopulator:](self, "setIorMessagePopulator:", v156);
      objc_msgSend(v9, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("Success"));
LABEL_124:
      v65 = (void (**)(_QWORD, _QWORD, _QWORD))v193;

      v167 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator"));
      objc_msgSend(v167, "setMessageDelegate:", self);

      v168 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator"));
      objc_msgSend(v168, "setPersistenceDelegate:", self);

      v169 = WALogCategoryDefaultHandle();
      v170 = objc_claimAutoreleasedReturnValue(v169);
      v133 = v186;
      if (os_log_type_enabled(v170, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3263;
        _os_log_impl((void *)&_mh_execute_header, v170, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:kWAIORCommandReloadViaUnpersist end", buf, 0x12u);
      }

      v33 = v189;
      v53 = v192;
LABEL_127:

LABEL_128:
LABEL_129:
      v171 = WALogCategoryDefaultHandle();
      v172 = objc_claimAutoreleasedReturnValue(v171);
      if (os_log_type_enabled(v172, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3361;
        v217 = 2112;
        v218 = (uint64_t)v9;
        _os_log_impl((void *)&_mh_execute_header, v172, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Replying Now msg %@", buf, 0x1Cu);
      }

      if (v65)
        ((void (**)(_QWORD, id, void *))v65)[2](v65, v9, v101);
LABEL_133:

      return;
    case 1uLL:
      v61 = WALogCategoryDefaultHandle();
      v62 = objc_claimAutoreleasedReturnValue(v61);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3267;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandBuildSubscription start", buf, 0x12u);
      }

      v63 = WALogCategoryDefaultHandle();
      v64 = objc_claimAutoreleasedReturnValue(v63);
      v65 = (void (**)(_QWORD, _QWORD, _QWORD))v193;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3269;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandBuildSubscription running [self.iorMessagePopulator determineChannelsPerIORPopulatable];",
          buf,
          0x12u);
      }

      v66 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator"));
      objc_msgSend(v66, "determineChannelsPerIORPopulatable");

      objc_msgSend(v9, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("Success"));
      v67 = WALogCategoryDefaultHandle();
      v68 = objc_claimAutoreleasedReturnValue(v67);
      if (!os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
        goto LABEL_71;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3273;
      v69 = "%{public}s::%d:kWAIORCommandBuildSubscription end";
      goto LABEL_70;
    case 2uLL:
      v70 = WALogCategoryDefaultHandle();
      v71 = objc_claimAutoreleasedReturnValue(v70);
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3277;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandErrorNextCreateOrUpdateSample start", buf, 0x12u);
      }

      v72 = WALogCategoryDefaultHandle();
      v73 = objc_claimAutoreleasedReturnValue(v72);
      v65 = (void (**)(_QWORD, _QWORD, _QWORD))v193;
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3279;
        _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandErrorNextCreateOrUpdateSample running [self.iorMessagePopulator injectErrorOnNextCreateOrUpdateSample];",
          buf,
          0x12u);
      }

      v74 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator"));
      objc_msgSend(v74, "injectErrorOnNextCreateOrUpdateSample");

      objc_msgSend(v9, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("Success"));
      v75 = WALogCategoryDefaultHandle();
      v68 = objc_claimAutoreleasedReturnValue(v75);
      if (!os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
        goto LABEL_71;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3283;
      v69 = "%{public}s::%d:kWAIORCommandErrorNextCreateOrUpdateSample end";
      goto LABEL_70;
    case 3uLL:
      v76 = WALogCategoryDefaultHandle();
      v77 = objc_claimAutoreleasedReturnValue(v76);
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3287;
        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandPersist start", buf, 0x12u);
      }

      v78 = WALogCategoryDefaultHandle();
      v79 = objc_claimAutoreleasedReturnValue(v78);
      v65 = (void (**)(_QWORD, _QWORD, _QWORD))v193;
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3289;
        _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandPersist running [self _persist];",
          buf,
          0x12u);
      }

      -[WAEngine _persist](self, "_persist");
      v80 = WALogCategoryDefaultHandle();
      v81 = objc_claimAutoreleasedReturnValue(v80);
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3292;
        _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandPersist running [self.iorMessagePopulator persistIORObjects];",
          buf,
          0x12u);
      }

      v82 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator"));
      objc_msgSend(v82, "persistIORObjects:", 0);

      objc_msgSend(v9, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("Success"));
      v83 = WALogCategoryDefaultHandle();
      v68 = objc_claimAutoreleasedReturnValue(v83);
      if (!os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
        goto LABEL_71;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3296;
      v69 = "%{public}s::%d:kWAIORCommandPersist end";
      goto LABEL_70;
    case 4uLL:
      v84 = WALogCategoryDefaultHandle();
      v85 = objc_claimAutoreleasedReturnValue(v84);
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3300;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandClearCaches start", buf, 0x12u);
      }

      v86 = WALogCategoryDefaultHandle();
      v87 = objc_claimAutoreleasedReturnValue(v86);
      v65 = (void (**)(_QWORD, _QWORD, _QWORD))v193;
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3302;
        _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandClearCaches running [self.iorMessagePopulator freeIORCaches];",
          buf,
          0x12u);
      }

      v88 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator"));
      objc_msgSend(v88, "freeIORCaches");

      objc_msgSend(v9, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("Success"));
      v89 = WALogCategoryDefaultHandle();
      v68 = objc_claimAutoreleasedReturnValue(v89);
      if (!os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
        goto LABEL_71;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3306;
      v69 = "%{public}s::%d:kWAIORCommandClearCaches end";
      goto LABEL_70;
    case 5uLL:
      v90 = WALogCategoryDefaultHandle();
      v91 = objc_claimAutoreleasedReturnValue(v90);
      if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3310;
        _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandRemovePersistFiles start", buf, 0x12u);
      }

      v92 = WALogCategoryDefaultHandle();
      v93 = objc_claimAutoreleasedReturnValue(v92);
      v65 = (void (**)(_QWORD, _QWORD, _QWORD))v193;
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3312;
        _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandClearCaches running [self _removePersistenceFile];",
          buf,
          0x12u);
      }

      -[WAEngine _removePersistenceFile](self, "_removePersistenceFile");
      objc_msgSend(v9, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("Success"));
      v94 = WALogCategoryDefaultHandle();
      v68 = objc_claimAutoreleasedReturnValue(v94);
      if (!os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
        goto LABEL_71;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3316;
      v69 = "%{public}s::%d:kWAIORCommandRemovePersistFiles end";
      goto LABEL_70;
    case 6uLL:
      v95 = WALogCategoryDefaultHandle();
      v96 = objc_claimAutoreleasedReturnValue(v95);
      if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3320;
        _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandRunIOLegendTest start", buf, 0x12u);
      }

      v97 = WALogCategoryDefaultHandle();
      v98 = objc_claimAutoreleasedReturnValue(v97);
      v65 = (void (**)(_QWORD, _QWORD, _QWORD))v193;
      if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3322;
        _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandRunIOLegendTest running [self.iorMessagePopulator runIOLegendTest];",
          buf,
          0x12u);
      }

      v99 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator"));
      v100 = objc_msgSend(v99, "runIOLegendTest");

      if ((v100 & 1) != 0)
      {
        v101 = 0;
        v102 = &__kCFBooleanTrue;
      }
      else
      {
        v199 = NSLocalizedFailureReasonErrorKey;
        v200 = CFSTR("WAErrorCodeInternalError");
        v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v200, &v199, 1));
        v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9003, v114));

        v102 = &__kCFBooleanFalse;
      }
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v102, CFSTR("Success"));
      v115 = WALogCategoryDefaultHandle();
      v116 = objc_claimAutoreleasedReturnValue(v115);
      if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3330;
        _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandRunIOLegendTest end", buf, 0x12u);
      }

      goto LABEL_129;
    case 7uLL:
      v103 = WALogCategoryDefaultHandle();
      v104 = objc_claimAutoreleasedReturnValue(v103);
      if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3334;
        _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandScanPredicatesNotYetFound start", buf, 0x12u);
      }

      v105 = WALogCategoryDefaultHandle();
      v106 = objc_claimAutoreleasedReturnValue(v105);
      v65 = (void (**)(_QWORD, _QWORD, _QWORD))v193;
      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3336;
        _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandScanPredicatesNotYetFound running [self.iorMessagePopulator scanPredicatesNotYetFound];",
          buf,
          0x12u);
      }

      v107 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator"));
      objc_msgSend(v107, "scanPredicatesNotYetFoundAndMutable");

      objc_msgSend(v9, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("Success"));
      v108 = WALogCategoryDefaultHandle();
      v68 = objc_claimAutoreleasedReturnValue(v108);
      if (!os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
        goto LABEL_71;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3341;
      v69 = "%{public}s::%d:kWAIORCommandScanPredicatesNotYetFound end";
LABEL_70:
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEBUG, v69, buf, 0x12u);
LABEL_71:

      v101 = 0;
      goto LABEL_129;
    case 8uLL:
      v109 = WALogCategoryDefaultHandle();
      v110 = objc_claimAutoreleasedReturnValue(v109);
      if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3345;
        _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandForceStudyErrorFromMsg start", buf, 0x12u);
      }

      v111 = WALogCategoryDefaultHandle();
      v112 = objc_claimAutoreleasedReturnValue(v111);
      if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3347;
        _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEBUG, "%{public}s::%d:kWAIORCommandForceStudyErrorFromMsg seetting _forceStudyErrorFromMsg true", buf, 0x12u);
      }

      self->_forceStudyErrorFromMsg = 1;
      objc_msgSend(v9, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("Success"));
      v113 = WALogCategoryDefaultHandle();
      v57 = objc_claimAutoreleasedReturnValue(v113);
      if (!os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
        goto LABEL_79;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3352;
      v58 = "%{public}s::%d:kWAIORCommandForceStudyErrorFromMsg end";
      v59 = v57;
      v60 = OS_LOG_TYPE_DEBUG;
      goto LABEL_78;
    default:
      v56 = WALogCategoryDefaultHandle();
      v57 = objc_claimAutoreleasedReturnValue(v56);
      if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        goto LABEL_79;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "-[WAEngine _issueIOReportManagementCommand:forProcessToken:andReply:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3356;
      v58 = "%{public}s::%d:Unknown command";
      v59 = v57;
      v60 = OS_LOG_TYPE_ERROR;
LABEL_78:
      _os_log_impl((void *)&_mh_execute_header, v59, v60, v58, buf, 0x12u);
LABEL_79:

      v101 = 0;
      v65 = (void (**)(_QWORD, _QWORD, _QWORD))v193;
      goto LABEL_129;
  }
}

- (void)_trapCrashMiniTracerDumpReadyForInterfaceWithName:(id)a3 andReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  WAApple80211 *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));

  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[WAEngine setInterfaceNameToApple80211InstanceMap:](self, "setInterfaceNameToApple80211InstanceMap:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v6));

  if (!v11)
  {
    v12 = -[WAApple80211 initWithInterfaceName:]([WAApple80211 alloc], "initWithInterfaceName:", v6);
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v6);

    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v6));

  if (v15)
  {
    v16 = objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v6));
    objc_msgSend(v17, "grabAndSubmitFWTrapInfo");

  }
  else
  {
    v18 = WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = 136446466;
      v20 = "-[WAEngine _trapCrashMiniTracerDumpReadyForInterfaceWithName:andReply:]";
      v21 = 1024;
      v22 = 3386;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:No Apple80211 wrapper to process trap crash mini tracer dump with!", (uint8_t *)&v19, 0x12u);
    }
  }

  if (v7)
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);

}

- (void)_lqmCrashTracerNotifyForInterfaceWithName:(id)a3 andReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  WAApple80211 *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));

  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[WAEngine setInterfaceNameToApple80211InstanceMap:](self, "setInterfaceNameToApple80211InstanceMap:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v6));

  if (!v11)
  {
    v12 = -[WAApple80211 initWithInterfaceName:]([WAApple80211 alloc], "initWithInterfaceName:", v6);
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v6);

    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v6));

  if (v15)
  {
    v16 = objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v6));
    objc_msgSend(v17, "grabAndSubmitLqmMetrics");

  }
  else
  {
    v18 = WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = 136446466;
      v20 = "-[WAEngine _lqmCrashTracerNotifyForInterfaceWithName:andReply:]";
      v21 = 1024;
      v22 = 3405;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:No Apple80211 wrapper to process lqmCrashTracer with!", (uint8_t *)&v19, 0x12u);
    }
  }

  if (v7)
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);

}

- (void)_lqmCrashTracerReceiveBlock:(id)a3 forInterfaceWithName:(id)a4 andReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  WAApple80211 *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));

  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[WAEngine setInterfaceNameToApple80211InstanceMap:](self, "setInterfaceNameToApple80211InstanceMap:", v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v9));

  if (!v14)
  {
    v15 = -[WAApple80211 initWithInterfaceName:]([WAApple80211 alloc], "initWithInterfaceName:", v9);
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v9);

    }
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v9));

  if (v18)
  {
    v19 = objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v19, "objectForKeyedSubscript:", v9));
    objc_msgSend(v20, "submitLqmMetrics:", v8);

  }
  else
  {
    v21 = WALogCategoryDefaultHandle();
    v19 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v22 = 136446466;
      v23 = "-[WAEngine _lqmCrashTracerReceiveBlock:forInterfaceWithName:andReply:]";
      v24 = 1024;
      v25 = 3424;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:No Apple80211 wrapper to process lqmCrashTracer with!", (uint8_t *)&v22, 0x12u);
    }
  }

  if (v10)
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);

}

- (void)_trapFWWithReason:(id)a3 andReply:(id)a4
{
  char *v6;
  id v7;
  NSString *infraInterfaceName;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSString *v21;
  int v22;
  const char *v23;
  __int16 v24;
  NSString *v25;

  v6 = (char *)a3;
  v7 = a4;
  infraInterfaceName = self->_infraInterfaceName;
  if (!infraInterfaceName
    || -[NSString isEqualToString:](infraInterfaceName, "isEqualToString:", CFSTR("dunno"))
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine infraInterfaceName](self, "infraInterfaceName")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v10)),
        v11,
        v10,
        v9,
        !v11))
  {
    -[WAEngine queryInfraInterfaceInstanceAndChip](self, "queryInfraInterfaceInstanceAndChip");
  }
  if (-[NSString isEqualToString:](self->_infraInterfaceName, "isEqualToString:", CFSTR("dunno"))
    || (v12 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap")),
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine infraInterfaceName](self, "infraInterfaceName")),
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v13)),
        v14,
        v13,
        v12,
        !v14))
  {
    v18 = WALogCategoryDefaultHandle();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v22 = 136446466;
      v23 = "-[WAEngine _trapFWWithReason:andReply:]";
      v24 = 1024;
      LODWORD(v25) = 3443;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to find _infraInterfaceName", (uint8_t *)&v22, 0x12u);
    }

    v20 = WALogCategoryDefaultHandle();
    v15 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      v21 = self->_infraInterfaceName;
      v22 = 138412546;
      v23 = v6;
      v24 = 2112;
      v25 = v21;
      _os_log_fault_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "Failed to initiate FW trap reason %@, interface %@", (uint8_t *)&v22, 0x16u);
    }
  }
  else
  {
    v15 = objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine infraInterfaceName](self, "infraInterfaceName"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v16));
    objc_msgSend(v17, "triggerDpsReset:", CFSTR("TrapOnSlowDPS"));

  }
  if (v7)
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);

}

- (void)_examinePeerMessageForIntegrity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  char *v12;
  char *v13;
  char *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  char v36;
  void *v37;
  void *v38;
  char *v39;
  char *v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  char *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  char *v50;
  __int16 v51;
  void *v52;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fieldForKey:", CFSTR("NWAPS_txLatencyBEs")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "repeatableValues"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fieldForKey:", CFSTR("NWAPS_txLatencyBEs")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "repeatableValues"));
    v40 = (char *)objc_msgSend(v7, "count");

  }
  else
  {
    v40 = 0;
  }
  v8 = WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    v42 = "-[WAEngine _examinePeerMessageForIntegrity:]";
    v43 = 1024;
    v44 = 3464;
    v45 = 2048;
    v46 = v40;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{public}s::%d:NWAPS_txLatencyBEs bincount %lu", buf, 0x1Cu);
  }

  if ((unint64_t)v40 < 0x10)
  {
    if (!v40)
      goto LABEL_32;
  }
  else
  {
    v10 = WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v42 = "-[WAEngine _examinePeerMessageForIntegrity:]";
      v43 = 1024;
      v44 = 3467;
      v45 = 2048;
      v46 = v40;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:bin count for NWAPS_txLatencyBEs exceeds expected count %lu", buf, 0x1Cu);
    }

  }
  v12 = 0;
  v38 = v3;
  while (2)
  {
    v36 = 0;
    v13 = 0;
    v39 = v12;
LABEL_13:
    v14 = v13;
    do
    {
      if (v12 != v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fieldForKey:", CFSTR("NWAPS_txLatencyBEs")));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "repeatableValues"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndex:", v12));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fieldForKey:", CFSTR("NWAHB_bin")));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fieldForKey:", CFSTR("NWAPS_txLatencyBEs")));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "repeatableValues"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndex:", v14));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "fieldForKey:", CFSTR("NWAHB_bin")));

        v3 = v38;
        v12 = v39;

        if (v18 == v22)
        {
          v23 = WALogCategoryDefaultHandle();
          v24 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "fieldForKey:", CFSTR("NWAPS_txLatencyBEs")));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "repeatableValues"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndex:", v39));
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "fieldForKey:", CFSTR("NWAHB_bin")));
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "fieldForKey:", CFSTR("NWAPS_txLatencyBEs")));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "repeatableValues"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndex:", v14));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "fieldForKey:", CFSTR("NWAHB_bin")));
            *(_DWORD *)buf = 136447490;
            v42 = "-[WAEngine _examinePeerMessageForIntegrity:]";
            v43 = 1024;
            v44 = 3475;
            v45 = 2048;
            v46 = v39;
            v47 = 2112;
            v48 = v27;
            v49 = 2048;
            v50 = v14;
            v51 = 2112;
            v52 = v31;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}s::%d:Duplicate bin name: i %lu %@ j %lu %@", buf, 0x3Au);

            v12 = v39;
            v3 = v38;

          }
          v13 = v14 + 1;
          v36 = 1;
          if (v40 - 1 == v14)
            goto LABEL_25;
          goto LABEL_13;
        }
      }
      ++v14;
    }
    while (v40 != v14);
    if ((v36 & 1) != 0)
    {
LABEL_25:
      v32 = WALogCategoryDefaultHandle();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_FAULT, "Malformed PeerMessage", buf, 2u);
      }

      break;
    }
    if (++v12 != v40)
      continue;
    break;
  }
  if ((unint64_t)v40 >= 0x10)
  {
    v34 = WALogCategoryDefaultHandle();
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_FAULT, "Too many txLatencyBE bins in PeerMessage", buf, 2u);
    }

  }
LABEL_32:

}

- (void)_triggerQueryForNWActivity:(int64_t)a3 forProcessToken:(id)a4 andReply:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, uint64_t);
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  id v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  unsigned __int8 v47;
  id v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  uint64_t v55;
  id v56;
  NSObject *v57;
  id v58;
  NSObject *v59;
  uint64_t v60;
  void *v61;
  id v62;
  NSObject *v63;
  id v64;
  id v65;
  NSObject *v66;
  uint64_t v67;
  void *v68;
  id v69;
  _QWORD v70[5];
  id v71;
  void (**v72)(id, _QWORD, uint64_t);
  uint64_t *v73;
  uint64_t *v74;
  uint64_t v75;
  int64_t v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  NSErrorUserInfoKey v89;
  const __CFString *v90;
  uint8_t buf[4];
  const char *v92;
  __int16 v93;
  int v94;
  __int16 v95;
  uint64_t v96;
  __int16 v97;
  void *v98;
  NSErrorUserInfoKey v99;
  const __CFString *v100;

  v8 = a4;
  v9 = (void (**)(id, _QWORD, uint64_t))a5;
  v83 = 0;
  v84 = &v83;
  v85 = 0x3032000000;
  v86 = sub_10004B174;
  v87 = sub_10004B184;
  v88 = 0;
  v77 = 0;
  v78 = &v77;
  v79 = 0x3032000000;
  v80 = sub_10004B174;
  v81 = sub_10004B184;
  v82 = 0;
  if (!a3)
  {
    v10 = WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Engine NWActivity reply style 0", ", buf, 2u);
    }

    v9[2](v9, 0, v78[5]);
    v12 = WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Engine NWActivity reply style 0", ", buf, 2u);
    }

  }
  v14 = WALogCategoryDefaultHandle();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Engine NWActivity", ", buf, 2u);
  }

  self->_isNWActivityInProgress = 1;
  if (!a3)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v8));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 3));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v18));
    v20 = v19 == 0;

    if (v20)
    {
      v21 = WALogCategoryDefaultHandle();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v92 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]";
        v93 = 1024;
        v94 = 3512;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}s::%d:Caller did not register", buf, 0x12u);
      }

      if (!v8)
      {
        v65 = WALogCategoryDefaultHandle();
        v66 = objc_claimAutoreleasedReturnValue(v65);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v92 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]";
          v93 = 1024;
          v94 = 3513;
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:couldn't get process name for connection", buf, 0x12u);
        }

        v99 = NSLocalizedFailureReasonErrorKey;
        v100 = CFSTR("WAErrorCodeInternalError");
        v29 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1));
        v67 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9003, v29));
        v68 = (void *)v78[5];
        v78[5] = v67;

        goto LABEL_49;
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", v8));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 3));
      v26 = objc_msgSend(v24, "containsObject:", v25);

      v27 = WALogCategoryDefaultHandle();
      v28 = objc_claimAutoreleasedReturnValue(v27);
      v29 = v28;
      if (v26)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v92 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]";
          v93 = 1024;
          v94 = 3514;
          v95 = 2048;
          v96 = 3;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: processTokenToGroupTypeMap seems to think this process token has already registered group type: %ld", buf, 0x1Cu);
        }
        goto LABEL_49;
      }
      if (os_signpost_enabled(v28))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Engine NWActivity notRegisteredPath", ", buf, 2u);
      }

      -[WAEngine _purgeGroupTypeIfNecessary:](self, "_purgeGroupTypeIfNecessary:", 3);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", v8));
      v32 = v31 == 0;

      if (v32)
      {
        v33 = objc_alloc_init((Class)NSMutableSet);
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v33, v8);

      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", v8));
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 3));
      objc_msgSend(v36, "addObject:", v37);

      -[WAEngine _initSubmitterAndQueryableRegistrationForProcessToken:andGroupType:](self, "_initSubmitterAndQueryableRegistrationForProcessToken:andGroupType:", v8, 3);
      -[WAEngine _persist](self, "_persist");
      v38 = WALogCategoryDefaultHandle();
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](WAUtil, "trimTokenForLogging:", v8));
        *(_DWORD *)buf = 136446978;
        v92 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]";
        v93 = 1024;
        v94 = 3527;
        v95 = 2048;
        v96 = 3;
        v97 = 2112;
        v98 = v40;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: registering message group type: %ld for process: %@", buf, 0x26u);

      }
      v41 = WALogCategoryDefaultHandle();
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_signpost_enabled(v42))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v42, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Engine NWActivity notRegisteredPath", ", buf, 2u);
      }

    }
  }
  v43 = objc_claimAutoreleasedReturnValue(-[WAEngine _cachedModelObjectsMessageForGroupType:key:](self, "_cachedModelObjectsMessageForGroupType:key:", 3, CFSTR("NWA")));
  v44 = (void *)v84[5];
  v84[5] = v43;

  if (!v84[5])
  {
    v58 = WALogCategoryDefaultHandle();
    v59 = objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v92 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]";
      v93 = 1024;
      v94 = 3533;
      v95 = 2112;
      v96 = (uint64_t)CFSTR("NWA");
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "%{public}s::%d:No model class found for key: %@. This is a CRITICAL error", buf, 0x1Cu);
    }

    v89 = NSLocalizedFailureReasonErrorKey;
    v90 = CFSTR("WAErrorCodeNotRegistered");
    v50 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1));
    v60 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9009, v50));
    v61 = (void *)v78[5];
    v78[5] = v60;

    goto LABEL_39;
  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v84[5], "originalClassName"));
  v47 = objc_msgSend(v45, "doesMessageNeedPrepopulation:", v46);

  v48 = WALogCategoryDefaultHandle();
  v49 = objc_claimAutoreleasedReturnValue(v48);
  v50 = v49;
  if ((v47 & 1) == 0)
  {
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v92 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]";
      v93 = 1024;
      v94 = 3535;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%{public}s::%d:doesMessageNeedPrepopulation returned false", buf, 0x12u);
    }
LABEL_39:

    if (a3 != 1)
    {
LABEL_50:
      self->_isNWActivityInProgress = 0;
      v69 = WALogCategoryDefaultHandle();
      v57 = objc_claimAutoreleasedReturnValue(v69);
      if (!os_signpost_enabled(v57))
        goto LABEL_33;
      *(_WORD *)buf = 0;
      goto LABEL_32;
    }
    v62 = WALogCategoryDefaultHandle();
    v63 = objc_claimAutoreleasedReturnValue(v62);
    if (os_signpost_enabled(v63))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v63, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Engine NWActivity Reply", ", buf, 2u);
    }

    v9[2](v9, v84[5], v78[5]);
    v64 = WALogCategoryDefaultHandle();
    v29 = objc_claimAutoreleasedReturnValue(v64);
    if (os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Engine NWActivity Reply", ", buf, 2u);
    }
LABEL_49:

    goto LABEL_50;
  }
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v84[5], "key"));
    *(_DWORD *)buf = 136446722;
    v92 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]";
    v93 = 1024;
    v94 = 3536;
    v95 = 2112;
    v96 = (uint64_t)v51;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Send WAMessageAWD %@ for population... ", buf, 0x1Cu);

  }
  v52 = WALogCategoryDefaultHandle();
  v53 = objc_claimAutoreleasedReturnValue(v52);
  if (os_signpost_enabled(v53))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v53, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Engine NWActivity Poplulate", ", buf, 2u);
  }

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine iorMessagePopulator](self, "iorMessagePopulator"));
  v55 = v84[5];
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_10005B0D8;
  v70[3] = &unk_1000CD4E0;
  v73 = &v83;
  v70[4] = self;
  v74 = &v77;
  v71 = v8;
  v75 = 3;
  v76 = a3;
  v72 = v9;
  objc_msgSend(v54, "prepopulateMessage:forProcess:groupType:andReply:", v55, v71, 3, v70);

  self->_isNWActivityInProgress = 0;
  v56 = WALogCategoryDefaultHandle();
  v57 = objc_claimAutoreleasedReturnValue(v56);
  if (os_signpost_enabled(v57))
  {
    *(_WORD *)buf = 0;
LABEL_32:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v57, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Engine NWActivity", ", buf, 2u);
  }
LABEL_33:

  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v83, 8);

}

- (void)_convertWiFiStatsIntoPercentile:(id)a3 analysisGroup:(int64_t)a4 groupTarget:(id)a5 forProcessToken:(id)a6 andReply:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, _QWORD, uint64_t);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  id v37;
  id v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  NSObject *v44;
  NSErrorUserInfoKey v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  NSObject *v50;
  id v51;
  _QWORD v52[4];
  void (**v53)(id, _QWORD, uint64_t);
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  NSErrorUserInfoKey v61;
  const __CFString *v62;
  NSErrorUserInfoKey v63;
  const __CFString *v64;
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  void *v72;
  NSErrorUserInfoKey v73;
  const __CFString *v74;

  v51 = a3;
  v12 = a5;
  v13 = a6;
  v14 = (void (**)(id, _QWORD, uint64_t))a7;
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = sub_10004B174;
  v59 = sub_10004B184;
  v60 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine submitterMap](self, "submitterMap"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v13));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 3));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v17));
  v19 = v18 == 0;

  if (!v19)
    goto LABEL_11;
  v20 = WALogCategoryDefaultHandle();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v66 = "-[WAEngine _convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:forProcessToken:andReply:]";
    v67 = 1024;
    v68 = 3749;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}s::%d:Caller did not register", buf, 0x12u);
  }

  if (!v13)
  {
    v43 = WALogCategoryDefaultHandle();
    v44 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v66 = "-[WAEngine _convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:forProcessToken:andReply:]";
      v67 = 1024;
      v68 = 3750;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:couldn't get process name for connection", buf, 0x12u);
    }

    v45 = NSLocalizedFailureReasonErrorKey;
    v73 = NSLocalizedFailureReasonErrorKey;
    v74 = CFSTR("WAErrorCodeInternalError");
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1));
    v47 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9003, v46));
    v48 = (void *)v56[5];
    v56[5] = v47;

    goto LABEL_24;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v13));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 3));
  v25 = objc_msgSend(v23, "containsObject:", v24);

  if (v25)
  {
    v49 = WALogCategoryDefaultHandle();
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v66 = "-[WAEngine _convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:forProcessToken:andReply:]";
      v67 = 1024;
      v68 = 3751;
      v69 = 2048;
      v70 = 3;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: processTokenToGroupTypeMap seems to think this process token has already registered group type: %ld", buf, 0x1Cu);
    }

    v45 = NSLocalizedFailureReasonErrorKey;
LABEL_24:
    v61 = v45;
    v62 = CFSTR("WAErrorCodeInternalError");
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1));
    v41 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9003, v40));
LABEL_16:
    v42 = (void *)v56[5];
    v56[5] = v41;

    v14[2](v14, 0, v56[5]);
    goto LABEL_17;
  }
  -[WAEngine _purgeGroupTypeIfNecessary:](self, "_purgeGroupTypeIfNecessary:", 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v13));
  v28 = v27 == 0;

  if (v28)
  {
    v29 = objc_alloc_init((Class)NSMutableSet);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, v13);

  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine processTokenToGroupTypeMap](self, "processTokenToGroupTypeMap"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", v13));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 3));
  objc_msgSend(v32, "addObject:", v33);

  -[WAEngine _initSubmitterAndQueryableRegistrationForProcessToken:andGroupType:](self, "_initSubmitterAndQueryableRegistrationForProcessToken:andGroupType:", v13, 3);
  -[WAEngine _persist](self, "_persist");
  v34 = WALogCategoryDefaultHandle();
  v35 = objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[WAUtil trimTokenForLogging:](WAUtil, "trimTokenForLogging:", v13));
    *(_DWORD *)buf = 136446978;
    v66 = "-[WAEngine _convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:forProcessToken:andReply:]";
    v67 = 1024;
    v68 = 3762;
    v69 = 2048;
    v70 = 3;
    v71 = 2112;
    v72 = v36;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: registering message group type: %ld for process: %@", buf, 0x26u);

  }
LABEL_11:
  v37 = -[NWActivityDistributionStoreDescriptor _initWithGroupAndOptions:groupTarget:]([NWActivityDistributionStoreDescriptor alloc], "_initWithGroupAndOptions:groupTarget:", a4, v12);
  if (!v37)
  {
    v38 = WALogCategoryDefaultHandle();
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v66 = "-[WAEngine _convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:forProcessToken:andReply:]";
      v67 = 1024;
      v68 = 3778;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to create NWActivityDistributionStoreDescriptor", buf, 0x12u);
    }

    v63 = NSLocalizedFailureReasonErrorKey;
    v64 = CFSTR("WAErrorCodeInternalError");
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1));
    v41 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9003, v40));
    goto LABEL_16;
  }
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_10005D114;
  v52[3] = &unk_1000CD508;
  v53 = v14;
  v54 = &v55;
  objc_msgSend(v37, "findInterpolatedPercentileFromWiFiStats:andReply:", v51, v52);

LABEL_17:
  _Block_object_dispose(&v55, 8);

}

- (void)populateChannelInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  int v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;

  v20 = 0;
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[WAApple80211Manager sharedObject](WAApple80211Manager, "sharedObject", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getInfraApple80211"));

  if (!v5)
  {
    v18 = WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue(v18);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_DWORD *)buf = 136446466;
    v22 = "-[WAEngine populateChannelInfo:]";
    v23 = 1024;
    v24 = 3802;
    v11 = "%{public}s::%d:invalid apple80211API";
    v12 = v10;
    v13 = OS_LOG_TYPE_ERROR;
    goto LABEL_14;
  }
  if ((objc_msgSend(v5, "currentChannelInfo:", &v19) & 1) != 0)
  {
    if ((v20 & 0x400) != 0)
      v6 = 80;
    else
      v6 = (v20 << 20 >> 31) & 0xA0;
    if ((v20 & 4) != 0)
      v7 = 40;
    else
      v7 = v6;
    if ((v20 & 2) != 0)
      v8 = 20;
    else
      v8 = v7;
    goto LABEL_16;
  }
  v9 = WALogCategoryDefaultHandle();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v22 = "-[WAEngine populateChannelInfo:]";
    v23 = 1024;
    v24 = 3805;
    v11 = "%{public}s::%d:Error getting channel Info for dpsCounterSample";
    v12 = v10;
    v13 = OS_LOG_TYPE_DEFAULT;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, buf, 0x12u);
  }
LABEL_15:

  v8 = 0;
LABEL_16:
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fieldForKey:", CFSTR("NWACS_channel")));
  objc_msgSend(v14, "setUint32Value:", HIDWORD(v19));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fieldForKey:", CFSTR("NWACS_channelBandwidth")));
  objc_msgSend(v15, "setUint32Value:", v8);

  v16 = WALogCategoryDefaultHandle();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v22 = "-[WAEngine populateChannelInfo:]";
    v23 = 1024;
    v24 = 3819;
    v25 = 1024;
    v26 = HIDWORD(v19);
    v27 = 1024;
    v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:channel: %u channelBandwidth: %u", buf, 0x1Eu);
  }

}

- (BOOL)populateApProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  BOOL v17;
  id v19;
  NSObject *v20;
  const char *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  int v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fieldForKey:", CFSTR("NWA_apProfile")));
  objc_msgSend(v5, "setStringValue:", &stru_1000CF640);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[WAApple80211Manager sharedObject](WAApple80211Manager, "sharedObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getInfraApple80211"));

  if (!v7)
  {
    v19 = WALogCategoryDefaultHandle();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v26 = 136446466;
      v27 = "-[WAEngine populateApProfile:]";
      v28 = 1024;
      v29 = 3837;
      v21 = "%{public}s::%d:invalid apple80211API";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v26, 0x12u);
    }
LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentBSSIDandSSID"));
  if (!v8)
  {
    v22 = WALogCategoryDefaultHandle();
    v20 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v26 = 136446466;
      v27 = "-[WAEngine populateApProfile:]";
      v28 = 1024;
      v29 = 3843;
      v21 = "%{public}s::%d:currentBSSIDandSSID gave nil";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v9 = (void *)v8;
  +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("AnalyticsProcessor: AP Profile For BSSID"), self->_cachedUsage, self->_engineQ);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine analyticsProcessor](self, "analyticsProcessor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("bssid")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ssid")));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "apProfileForBssid:andSSID:", v11, v12));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fieldForKey:", CFSTR("NWA_apProfile")));
    objc_msgSend(v14, "setStringValue:", v13);

    v15 = WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 136446722;
      v27 = "-[WAEngine populateApProfile:]";
      v28 = 1024;
      v29 = 3854;
      v30 = 1024;
      LODWORD(v31) = 1;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:returning %d", (uint8_t *)&v26, 0x18u);
    }

    v17 = 1;
    goto LABEL_7;
  }
  v24 = WALogCategoryDefaultHandle();
  v20 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("bssid")));
    v26 = 136446722;
    v27 = "-[WAEngine populateApProfile:]";
    v28 = 1024;
    v29 = 3847;
    v30 = 2112;
    v31 = v25;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}s::%d:profile for %@ is nil", (uint8_t *)&v26, 0x1Cu);

  }
LABEL_14:

  v23 = WALogCategoryDefaultHandle();
  v13 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v26 = 136446722;
    v27 = "-[WAEngine populateApProfile:]";
    v28 = 1024;
    v29 = 3860;
    v30 = 1024;
    LODWORD(v31) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}s::%d:returning %d", (uint8_t *)&v26, 0x18u);
  }
  v17 = 0;
LABEL_7:

  return v17;
}

- (BOOL)everAssociated:(BOOL)a3 assocDoneSuccess:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  unsigned __int8 v8;
  id v9;
  id v11;
  NSObject *v12;
  id v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  _BOOL4 v21;

  v4 = a4;
  v5 = a3;
  if (a3 || a4)
  {
    v9 = WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136446978;
      v15 = "-[WAEngine everAssociated:assocDoneSuccess:]";
      v16 = 1024;
      v17 = 3869;
      v18 = 1024;
      v19 = v5;
      v20 = 1024;
      v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:everAssociated true due to hasLinkChanged %d hasAssocDoneSuccess %d", (uint8_t *)&v14, 0x1Eu);
    }
    v8 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[WAApple80211Manager sharedObject](WAApple80211Manager, "sharedObject"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getInfraApple80211"));

    if (v7)
    {
      v8 = -[NSObject everAssociated](v7, "everAssociated");
    }
    else
    {
      v11 = WALogCategoryDefaultHandle();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v14 = 136446466;
        v15 = "-[WAEngine everAssociated:assocDoneSuccess:]";
        v16 = 1024;
        v17 = 3874;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:invalid apple80211API", (uint8_t *)&v14, 0x12u);
      }

      v13 = WALogCategoryDefaultHandle();
      v7 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v14 = 136446466;
        v15 = "-[WAEngine everAssociated:assocDoneSuccess:]";
        v16 = 1024;
        v17 = 3883;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:everAssociated failed", (uint8_t *)&v14, 0x12u);
      }
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)isAssociated
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[WAApple80211Manager sharedObject](WAApple80211Manager, "sharedObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getInfraApple80211"));

  if (v3)
  {
    v4 = objc_msgSend(v3, "isAssociated");
  }
  else
  {
    v6 = WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446466;
      v11 = "-[WAEngine isAssociated]";
      v12 = 1024;
      v13 = 3893;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:invalid apple80211API", (uint8_t *)&v10, 0x12u);
    }

    v8 = WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446466;
      v11 = "-[WAEngine isAssociated]";
      v12 = 1024;
      v13 = 3901;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:everAssociated failed", (uint8_t *)&v10, 0x12u);
    }

    v4 = 0;
  }

  return v4;
}

- (BOOL)isAXAssociatoin
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[WAApple80211Manager sharedObject](WAApple80211Manager, "sharedObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getInfraApple80211"));

  if (v3)
  {
    v4 = objc_msgSend(v3, "isAXAssociatoin");
  }
  else
  {
    v6 = WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446466;
      v11 = "-[WAEngine isAXAssociatoin]";
      v12 = 1024;
      v13 = 3911;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:invalid apple80211API", (uint8_t *)&v10, 0x12u);
    }

    v8 = WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446466;
      v11 = "-[WAEngine isAXAssociatoin]";
      v12 = 1024;
      v13 = 3919;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:isAXAssociatoin failed", (uint8_t *)&v10, 0x12u);
    }

    v4 = 0;
  }

  return v4;
}

- (void)gatherConsecutiveDatapathReadings:(int64_t)a3 forProcessToken:(id)a4 andReply:(id)a5
{
  id v7;
  dispatch_semaphore_t v8;
  dispatch_time_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  dispatch_time_t v19;
  OS_dispatch_queue *dpsReadWriteSerialQueue;
  id v21;
  NSObject *v22;
  void *v23;
  RecommendationEngine *recommendationEngine;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  unint64_t v31;
  unsigned int v32;
  dispatch_semaphore_t v33;
  void *v34;
  BOOL v35;
  void *v36;
  id v37;
  NSObject *v38;
  dispatch_time_t v39;
  OS_dispatch_queue *v40;
  NSObject *v41;
  dispatch_time_t v42;
  OS_dispatch_queue *v43;
  id v45;
  NSObject *v46;
  id v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  dispatch_time_t v52;
  id v53;
  NSObject *v54;
  const char *v55;
  id v56;
  id v57;
  NSObject *v58;
  uint64_t v59;
  void *v60;
  dispatch_group_t v61;
  dispatch_semaphore_t v63;
  dispatch_semaphore_t dsema;
  NSObject *group;
  uint64_t v66;
  unsigned __int8 v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  char *v72;
  _QWORD v73[5];
  id v74;
  NSObject *v75;
  uint64_t *v76;
  uint64_t *v77;
  _QWORD *v78;
  char *v79;
  uint64_t v80;
  _QWORD v81[5];
  id v82;
  id v83;
  uint64_t *v84;
  _QWORD *v85;
  _QWORD *v86;
  _QWORD *v87;
  unsigned int v88;
  unsigned __int8 v89;
  _QWORD v90[5];
  id v91;
  NSObject *v92;
  _QWORD *v93;
  _QWORD *v94;
  _QWORD *v95;
  uint64_t *v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  unsigned int v100;
  _QWORD v101[3];
  char v102;
  _QWORD v103[3];
  char v104;
  _QWORD block[4];
  dispatch_group_t v106;
  _QWORD v107[4];
  dispatch_semaphore_t v108;
  uint64_t *v109;
  _QWORD v110[5];
  id v111;
  uint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t (*v115)(uint64_t, uint64_t);
  void (*v116)(uint64_t);
  id v117;
  _QWORD v118[5];
  id v119;
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t (*v123)(uint64_t, uint64_t);
  void (*v124)(uint64_t);
  id v125;
  uint8_t buf[4];
  const char *v127;
  __int16 v128;
  int v129;
  __int16 v130;
  _BYTE v131[14];
  NSErrorUserInfoKey v132;
  const __CFString *v133;

  v7 = a4;
  v70 = a5;
  group = dispatch_group_create();
  v63 = dispatch_semaphore_create(0);
  v8 = dispatch_semaphore_create(0);
  v120 = 0;
  v121 = &v120;
  v122 = 0x3032000000;
  v123 = sub_10004B174;
  v124 = sub_10004B184;
  v125 = 0;
  v118[0] = 0;
  v118[1] = v118;
  v118[2] = 0x3032000000;
  v118[3] = sub_10004B174;
  v118[4] = sub_10004B184;
  v119 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v112 = 0;
  v113 = &v112;
  v114 = 0x3032000000;
  v115 = sub_10004B174;
  v116 = sub_10004B184;
  v117 = 0;
  v110[0] = 0;
  v110[1] = v110;
  v110[2] = 0x3032000000;
  v110[3] = sub_10004B174;
  v110[4] = sub_10004B184;
  v111 = 0;
  v107[0] = _NSConcreteStackBlock;
  v107[1] = 3221225472;
  v107[2] = sub_10005EA38;
  v107[3] = &unk_1000CD530;
  v109 = &v120;
  dsema = v8;
  v108 = dsema;
  v68 = v7;
  -[WAEngine _getNewMessageForKey:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:](self, "_getNewMessageForKey:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:", CFSTR("DPSR"), 4, v7, 0, v107);
  v9 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(dsema, v9);
  v10 = WALogCategoryDefaultHandle();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v127 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]";
    v128 = 1024;
    v129 = 3945;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:ensureDPSRexists done", buf, 0x12u);
  }

  if (v121[5])
  {
    if (self->_dnsStudyInProgress)
    {
      v67 = -[WAEngine fetchConfiguredDnsInfo](self, "fetchConfiguredDnsInfo");
      -[WAEngine triggerPeerDiscovery](self, "triggerPeerDiscovery");
    }
    else
    {
      v67 = 1;
    }
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine _DPSQuickRecoveryEngineObj](self, "_DPSQuickRecoveryEngineObj"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v121[5], "fieldForKey:", CFSTR("DPSR_dpsEpiloge")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "subMessageValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fieldForKey:", CFSTR("DPSE_qDpsStats")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "subMessageValue"));
    objc_msgSend(v69, "updateTimeSincePreviousTriggerForQuickDps:", v15);

    v16 = WALogCategoryDefaultHandle();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v127 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]";
      v128 = 1024;
      v129 = 3959;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_dpsStudyInProgress Start", buf, 0x12u);
    }

    dispatch_group_enter(group);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
    v19 = dispatch_time(0, 1000000000 * (_QWORD)objc_msgSend(v18, "dps_report_sent_after"));
    dpsReadWriteSerialQueue = self->_dpsReadWriteSerialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005EB34;
    block[3] = &unk_1000CCDB0;
    v61 = group;
    v106 = v61;
    dispatch_after(v19, (dispatch_queue_t)dpsReadWriteSerialQueue, block);

    v21 = WALogCategoryDefaultHandle();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v127 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]";
      v128 = 1024;
      v129 = 3968;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_dpsCurrentlyGatheringConsecutiveSamples TRUE", buf, 0x12u);
    }

    self->_dpsCurrentlyGatheringConsecutiveSamples = 1;
    v103[0] = 0;
    v103[1] = v103;
    v103[2] = 0x2020000000;
    v104 = 1;
    v101[0] = 0;
    v101[1] = v101;
    v101[2] = 0x2020000000;
    v102 = 1;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
    v71 = objc_msgSend(v23, "dps_duration_between_samples");

    recommendationEngine = self->_recommendationEngine;
    if (self->_dnsStudyInProgress)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](recommendationEngine, "preferences"));
      v72 = (char *)objc_msgSend(v25, "dns_symptoms_interrogation_sample_count");

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
      v71 = objc_msgSend(v26, "dns_symptoms_duration_between_samples_before_trap");

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
      v28 = (uint64_t)objc_msgSend(v27, "dns_symptoms_trap_evaluated_at_sample") - 1;
    }
    else
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](recommendationEngine, "preferences"));
      v72 = (char *)objc_msgSend(v27, "dps_interrogation_sample_count");
      v28 = 1;
    }
    v66 = v28;

    v29 = WALogCategoryDefaultHandle();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v127 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]";
      v128 = 1024;
      v129 = 3984;
      v130 = 2048;
      *(_QWORD *)v131 = v72;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPS: interrogationCount: %lu", buf, 0x1Cu);
    }

    if (v72)
    {
      v31 = 0;
      v32 = 1;
      while (1)
      {
        v33 = dispatch_semaphore_create(0);
        if (self->_dnsStudyInProgress)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
          v35 = (unint64_t)objc_msgSend(v34, "dns_symptoms_trap_evaluated_at_sample") > v31;

          if (!v35)
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
            v71 = objc_msgSend(v36, "dns_symptoms_duration_between_samples_after_trap");

          }
        }
        v37 = WALogCategoryDefaultHandle();
        v38 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446978;
          v127 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]";
          v128 = 1024;
          v129 = 3993;
          v130 = 1024;
          *(_DWORD *)v131 = v32 - 1;
          *(_WORD *)&v131[4] = 2048;
          *(_QWORD *)&v131[6] = v71;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPS: sample:%u durationBetweenSamples: %lu", buf, 0x22u);
        }

        v39 = dispatch_time(0, 1000000 * (_QWORD)v71);
        v40 = self->_dpsReadWriteSerialQueue;
        v90[0] = _NSConcreteStackBlock;
        v90[1] = 3221225472;
        v90[2] = sub_10005EBF4;
        v90[3] = &unk_1000CD5D0;
        v100 = v32 - 1;
        v90[4] = self;
        v93 = v101;
        v94 = v103;
        v97 = v66;
        v98 = v72;
        v99 = 4;
        v91 = v68;
        v95 = v110;
        v41 = v33;
        v92 = v41;
        v96 = &v120;
        dispatch_after(v39, (dispatch_queue_t)v40, v90);
        v42 = dispatch_time(0, 20000000000);
        dispatch_semaphore_wait(v41, v42);
        v43 = self->_dpsReadWriteSerialQueue;
        v81[0] = _NSConcreteStackBlock;
        v81[1] = 3221225472;
        v81[2] = sub_10005FF0C;
        v81[3] = &unk_1000CD620;
        v84 = &v120;
        v81[4] = self;
        v88 = v32 - 1;
        v82 = v69;
        v85 = v101;
        v86 = v118;
        v83 = v70;
        v87 = v103;
        v89 = v67;
        dispatch_async((dispatch_queue_t)v43, v81);

        if (v72 - 1 == (char *)v31)
          break;

        v31 = v32;
        if ((unint64_t)v72 <= v32++)
          goto LABEL_31;
      }
      v45 = WALogCategoryDefaultHandle();
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v127 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]";
        v128 = 1024;
        v129 = 4319;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:kDatapathInterrogationCountMax hit", buf, 0x12u);
      }

      v47 = WALogCategoryDefaultHandle();
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v127 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]";
        v128 = 1024;
        v129 = 4320;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_dpsCurrentlyGatheringConsecutiveSamples FALSE", buf, 0x12u);
      }

      self->_dpsCurrentlyGatheringConsecutiveSamples = 0;
    }
LABEL_31:
    v49 = objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_100061AD4;
    v73[3] = &unk_1000CD670;
    v76 = &v120;
    v73[4] = self;
    v79 = v72;
    v74 = v68;
    v77 = &v112;
    v80 = 4;
    v78 = v118;
    v50 = v63;
    v75 = v50;
    dispatch_group_notify(v61, v49, v73);

    _Block_object_dispose(v101, 8);
    _Block_object_dispose(v103, 8);

    if (a3 == 1)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
      v52 = dispatch_time(0, 1000000000 * (_QWORD)objc_msgSend(v51, "dps_report_sent_after") + 5000000000);
      dispatch_semaphore_wait(v50, v52);

      v53 = WALogCategoryDefaultHandle();
      v54 = objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v127 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]";
        v128 = 1024;
        v129 = 4506;
        v55 = "%{public}s::%d:unblocking is complete... returning";
LABEL_36:
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, v55, buf, 0x12u);
      }
    }
    else
    {
      v56 = WALogCategoryDefaultHandle();
      v54 = objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v127 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]";
        v128 = 1024;
        v129 = 4508;
        v55 = "%{public}s::%d:returning immediatley";
        goto LABEL_36;
      }
    }
  }
  else
  {
    v57 = WALogCategoryDefaultHandle();
    v58 = objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v127 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]";
      v128 = 1024;
      v129 = 3947;
      v130 = 2112;
      *(_QWORD *)v131 = CFSTR("DPSR");
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "%{public}s::%d:No model class found for key: %@. This is a CRITICAL error", buf, 0x1Cu);
    }

    v132 = NSLocalizedFailureReasonErrorKey;
    v133 = CFSTR("WAErrorCodeNotRegistered");
    v54 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v133, &v132, 1));
    v59 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9009, v54));
    v60 = (void *)v113[5];
    v113[5] = v59;

    v69 = 0;
  }

  (*((void (**)(id, uint64_t, uint64_t))v70 + 2))(v70, v121[5], v113[5]);
  _Block_object_dispose(v110, 8);

  _Block_object_dispose(&v112, 8);
  _Block_object_dispose(v118, 8);

  _Block_object_dispose(&v120, 8);
}

- (void)_triggerDPSStudy:(int64_t)a3 forProcessToken:(id)a4 waMessage:(id)a5 andReply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  _BOOL4 dpsStudyInProgress;
  id v16;
  NSObject *v17;
  void *v18;
  unsigned int v19;
  id v20;
  _BOOL4 v21;
  _BOOL4 dpsCurrentlyGatheringConsecutiveSamples;
  id v23;
  NSObject *v24;
  _BOOL4 v25;
  _BOOL4 v26;
  id v27;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  os_log_type_t v31;
  id v32;
  void *v33;
  unsigned int v34;
  int64_t v35;
  void *v36;
  unsigned int v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  OS_dispatch_queue *dnsStudyQueue;
  id v43;
  NSObject *v44;
  int64_t v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  OS_dispatch_queue *peerDiagnosticsStudyQueue;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _BOOL4 v58;
  void *v59;
  unsigned int v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _BOOL4 dnsStudyInProgress;
  id v75;
  NSObject *v76;
  void *v77;
  unsigned int v78;
  void *v79;
  id v80;
  NSObject *v81;
  _BOOL4 v82;
  id v83;
  NSObject *v84;
  _BOOL4 v85;
  id v86;
  void *v87;
  _BOOL4 v88;
  void *v89;
  unsigned int v90;
  void *v91;
  id v92;
  NSObject *v93;
  void *v94;
  _BOOL4 v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  _BOOL4 v101;
  id v102;
  NSObject *v103;
  _BOOL4 v104;
  void *v105;
  unsigned int v106;
  id v107;
  NSObject *v108;
  void *v109;
  unsigned int v110;
  id v111;
  NSObject *v112;
  OS_dispatch_queue *studyQueue;
  NSObject *v114;
  void *v115;
  dispatch_time_t v116;
  id v117;
  id v118;
  void *v119;
  void *v120;
  unsigned int v121;
  unsigned int v122;
  _BOOL4 v123;
  dispatch_semaphore_t v124;
  _QWORD v125[5];
  id v126;
  NSObject *v127;
  _QWORD v128[5];
  _QWORD v129[5];
  _QWORD v130[5];
  _QWORD v131[6];
  _QWORD block[5];
  uint8_t buf[4];
  const char *v134;
  __int16 v135;
  int v136;
  __int16 v137;
  id v138;
  __int16 v139;
  _BOOL4 v140;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v124 = dispatch_semaphore_create(0);
  v13 = WALogCategoryDefaultHandle();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    dpsStudyInProgress = self->_dpsStudyInProgress;
    *(_DWORD *)buf = 136446722;
    v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
    v135 = 1024;
    v136 = 4528;
    v137 = 1024;
    LODWORD(v138) = dpsStudyInProgress;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_dpsStudyInProgress is %d", buf, 0x18u);
  }

  v16 = WALogCategoryDefaultHandle();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
    v135 = 1024;
    v136 = 4529;
    v137 = 2112;
    v138 = v11;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Got WAMessage %@ ", buf, 0x1Cu);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "key"));
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("DPSN"));

  if (!v19)
  {
    v26 = 0;
    goto LABEL_63;
  }
  v20 = +[WAUtil getAWDTimestamp](WAUtil, "getAWDTimestamp");
  v21 = !self->_dpsStudyInProgress;
  if (self->_dpsStudyInProgress)
  {
    dpsCurrentlyGatheringConsecutiveSamples = self->_dpsCurrentlyGatheringConsecutiveSamples;
    v23 = WALogCategoryDefaultHandle();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (dpsCurrentlyGatheringConsecutiveSamples)
    {
      if (v25)
      {
        *(_DWORD *)buf = 136446466;
        v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        v135 = 1024;
        v136 = 4599;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Not adding dpsStatsContainer while _dpsCurrentlyGatheringConsecutiveSamples", buf, 0x12u);
      }

    }
    else
    {
      if (v25)
      {
        *(_DWORD *)buf = 136446466;
        v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        v135 = 1024;
        v136 = 4588;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Sampling another dpsStatsContainer", buf, 0x12u);
      }

      v130[0] = _NSConcreteStackBlock;
      v130[1] = 3221225472;
      v130[2] = sub_100065450;
      v130[3] = &unk_1000CD6C0;
      v130[4] = self;
      -[WAEngine _getNewMessageForKey:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:](self, "_getNewMessageForKey:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:", CFSTR("DPSCS"), 4, v10, 1, v130);
    }
  }
  else
  {
    if (self->_slowWiFiStudyInProgress)
    {
      v27 = WALogCategoryDefaultHandle();
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        v135 = 1024;
        v136 = 4536;
        v29 = "%{public}s::%d:Got Stall Notification when slowWiFiStudyInProgress, exiting";
        v30 = v28;
        v31 = OS_LOG_TYPE_DEBUG;
LABEL_106:
        _os_log_impl((void *)&_mh_execute_header, v30, v31, v29, buf, 0x12u);
        goto LABEL_107;
      }
      goto LABEL_107;
    }
    v32 = v20;
    v123 = !self->_dpsStudyInProgress;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fieldForKey:", CFSTR("DPSN_symptom")));
    v34 = objc_msgSend(v33, "int32Value");

    v122 = v34;
    if (v34)
    {
      v35 = a3;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fieldForKey:", CFSTR("DPSN_symptom")));
      v37 = objc_msgSend(v36, "int32Value");

      v38 = WALogCategoryDefaultHandle();
      v39 = objc_claimAutoreleasedReturnValue(v38);
      v28 = v39;
      if (v37 != 4)
      {
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fieldForKey:", CFSTR("DPSN_symptom")));
          v121 = objc_msgSend(v120, "int32Value");
          *(_DWORD *)buf = 136446722;
          v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
          v135 = 1024;
          v136 = 4562;
          v137 = 1024;
          LODWORD(v138) = v121;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Got Stall Notification for symptom:%d when not currently in study, so ignore..", buf, 0x18u);

        }
        goto LABEL_107;
      }
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        v135 = 1024;
        v136 = 4546;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DNS Study triggered by Symptoms DNS trigger", buf, 0x12u);
      }

      *(_WORD *)&self->_dpsNotificationDuringDnsStudy = 0;
      self->_dnsStudyInProgress = 1;
      v40 = (void *)os_transaction_create("com.apple.wifianalytics.dnsStudyTransaction");
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[WAActivityManager sharedActivityManager](WAActivityManager, "sharedActivityManager"));
      objc_msgSend(v41, "osTransactionCreate:transaction:", "com.apple.wifianalytics.dnsStudyTransaction", v40);

      -[WAEngine setDnsStudyTransaction:](self, "setDnsStudyTransaction:", v40);
      -[WAEngine clearDnsStudyVariables](self, "clearDnsStudyVariables");
      dnsStudyQueue = self->_dnsStudyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000653EC;
      block[3] = &unk_1000CCDB0;
      block[4] = self;
      dispatch_sync((dispatch_queue_t)dnsStudyQueue, block);
      a3 = v35;
    }
    else
    {
      v43 = WALogCategoryDefaultHandle();
      v44 = objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        v135 = 1024;
        v136 = 4543;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPS Study triggered by stall", buf, 0x12u);
      }

    }
    v45 = a3;
    v46 = WALogCategoryDefaultHandle();
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
      v135 = 1024;
      v136 = 4566;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Got Stall Notification when not currently in study, kicking off DPS Study", buf, 0x12u);
    }

    self->_dpsStudyInProgress = 1;
    v48 = (void *)os_transaction_create("com.apple.wifianalytics.dpsStudyTransaction");
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[WAActivityManager sharedActivityManager](WAActivityManager, "sharedActivityManager"));
    objc_msgSend(v49, "osTransactionCreate:transaction:", "com.apple.wifianalytics.dpsStudyTransaction", v48);

    v50 = v48;
    -[WAEngine setDpsStudyTransaction:](self, "setDpsStudyTransaction:", v50);

    self->_dpsAction = 0;
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fieldForKey:", CFSTR("DPSN_timestamp")));
    self->_dpsNotificationTimeInSeconds = (unint64_t)objc_msgSend(v51, "uint64Value") / 0x3E8;

    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fieldForKey:", CFSTR("DPSN_cca")));
    self->_dpsNotificationCCA = objc_msgSend(v52, "uint32Value");

    if (!v122)
    {
      peerDiagnosticsStudyQueue = self->_peerDiagnosticsStudyQueue;
      v131[0] = _NSConcreteStackBlock;
      v131[1] = 3221225472;
      v131[2] = sub_10006541C;
      v131[3] = &unk_1000CD698;
      v131[4] = self;
      v131[5] = 1;
      dispatch_async((dispatch_queue_t)peerDiagnosticsStudyQueue, v131);
    }
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fieldForKey:", CFSTR("DPSN_facetimeCallInProgress")));
    self->_isCriticalAppInUse = objc_msgSend(v54, "BOOLValue");

    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_studyTimeStamps, "setObject:forKeyedSubscript:", v55, CFSTR("start"));

    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fieldForKey:", CFSTR("DPSN_timestamp")));
    objc_msgSend(v56, "setUint64Value:", v32);

    a3 = v45;
    v21 = v123;
  }
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fieldForKey:", CFSTR("DPSN_symptom")));
  v58 = v21;
  if (objc_msgSend(v57, "int32Value") == 2)
  {

  }
  else
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fieldForKey:", CFSTR("DPSN_symptom")));
    v60 = objc_msgSend(v59, "int32Value");

    if (v60 != 3)
      goto LABEL_35;
  }
  self->_dpsAction |= 0x20u;
LABEL_35:
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fieldForKey:", CFSTR("DPSN_symptom")));
  if (objc_msgSend(v61, "int32Value") == 2)
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_studyTimeStamps, "objectForKeyedSubscript:", CFSTR("userToggle")));

    if (v62)
      goto LABEL_39;
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_studyTimeStamps, "setObject:forKeyedSubscript:", v61, CFSTR("userToggle"));
  }

LABEL_39:
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fieldForKey:", CFSTR("DPSN_symptom")));
  if (objc_msgSend(v63, "int32Value") == 2)
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_studyTimeStamps, "objectForKeyedSubscript:", CFSTR("decisionInstance")));
    if (!v64)
    {
      v119 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_studyTimeStamps, "objectForKeyedSubscript:", CFSTR("UserToggleBeforeDecision")));

      if (!v119)
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_studyTimeStamps, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("UserToggleBeforeDecision"));
      goto LABEL_43;
    }

  }
LABEL_43:
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fieldForKey:", CFSTR("DPSN_symptom")));
  if (objc_msgSend(v65, "int32Value") == 2
    && (v66 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_studyTimeStamps, "objectForKeyedSubscript:", CFSTR("decisionInstance")))) != 0)
  {
    v67 = (void *)v66;
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_studyTimeStamps, "objectForKeyedSubscript:", CFSTR("UserToggleBeforeDecision")));

    if (!v68)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_studyTimeStamps, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("UserToggleBeforeDecision"));
  }
  else
  {

  }
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fieldForKey:", CFSTR("DPSN_symptom")));
  if (objc_msgSend(v69, "int32Value") == 3)
  {
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_studyTimeStamps, "objectForKeyedSubscript:", CFSTR("decisionInstance")));

    v26 = v58;
    if (!v70)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_studyTimeStamps, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("LinkUpBeforeDecision"));
  }
  else
  {

    v26 = v58;
  }
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fieldForKey:", CFSTR("DPSN_symptom")));
  if (objc_msgSend(v71, "int32Value") == 3)
  {
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_studyTimeStamps, "objectForKeyedSubscript:", CFSTR("decisionInstance")));

    if (v72)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_studyTimeStamps, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("LinkUpAfterDecision"));
  }
  else
  {

  }
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fieldForKey:", CFSTR("DPSN_symptom")));
  if (objc_msgSend(v73, "int32Value"))
  {

  }
  else
  {
    dnsStudyInProgress = self->_dnsStudyInProgress;

    if (dnsStudyInProgress)
      self->_dpsNotificationDuringDnsStudy = 1;
  }
  v75 = WALogCategoryDefaultHandle();
  v76 = objc_claimAutoreleasedReturnValue(v75);
  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
    v135 = 1024;
    v136 = 4636;
    _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding DPSR_stallNotifications", buf, 0x12u);
  }

  -[NSMutableArray addObject:](self->_dpsnToAppend, "addObject:", v11);
LABEL_63:
  if (!self->_dpsStudyInProgress)
  {
    v86 = WALogCategoryDefaultHandle();
    v28 = objc_claimAutoreleasedReturnValue(v86);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "key"));
      v88 = self->_dpsStudyInProgress;
      *(_DWORD *)buf = 136446978;
      v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
      v135 = 1024;
      v136 = 4641;
      v137 = 2112;
      v138 = v87;
      v139 = 1024;
      v140 = v88;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Dropping incomming key %@ because _dpsStudyInProgress is %d", buf, 0x22u);

    }
    goto LABEL_107;
  }
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "key"));
  v78 = objc_msgSend(v77, "isEqualToString:", CFSTR("DPSAPS"));

  if (v78)
  {
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fieldForKey:", CFSTR("DPSAPS_timestamp")));
    objc_msgSend(v79, "setUint64Value:", +[WAUtil getAWDTimestamp](WAUtil, "getAWDTimestamp"));

    v80 = WALogCategoryDefaultHandle();
    v81 = objc_claimAutoreleasedReturnValue(v80);
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
      v135 = 1024;
      v136 = 4648;
      v137 = 2112;
      v138 = v11;
      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding DPSR_probeResults %@", buf, 0x1Cu);
    }

    -[NSMutableArray addObject:](self->_dpsapToAppend, "addObject:", v11);
    v82 = self->_dpsCurrentlyGatheringConsecutiveSamples;
    v83 = WALogCategoryDefaultHandle();
    v84 = objc_claimAutoreleasedReturnValue(v83);
    v85 = os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT);
    if (v82)
    {
      if (v85)
      {
        *(_DWORD *)buf = 136446466;
        v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        v135 = 1024;
        v136 = 4662;
        _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Not adding dpsStatsContainer while _dpsCurrentlyGatheringConsecutiveSamples", buf, 0x12u);
      }

    }
    else
    {
      if (v85)
      {
        *(_DWORD *)buf = 136446466;
        v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        v135 = 1024;
        v136 = 4652;
        _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Sampling another dpsStatsContainer", buf, 0x12u);
      }

      v129[0] = _NSConcreteStackBlock;
      v129[1] = 3221225472;
      v129[2] = sub_10006559C;
      v129[3] = &unk_1000CD6C0;
      v129[4] = self;
      -[WAEngine _getNewMessageForKey:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:](self, "_getNewMessageForKey:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:", CFSTR("DPSCS"), 4, v10, 1, v129);
    }
  }
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "key"));
  v90 = objc_msgSend(v89, "isEqualToString:", CFSTR("WFAAWDWADAAD"));

  if (v90)
  {
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fieldForKey:", CFSTR("WFAAWDWADAAD_timestamp")));
    objc_msgSend(v91, "setUint64Value:", +[WAUtil getAWDTimestamp](WAUtil, "getAWDTimestamp"));

    v92 = WALogCategoryDefaultHandle();
    v93 = objc_claimAutoreleasedReturnValue(v92);
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
      v135 = 1024;
      v136 = 4669;
      v137 = 2112;
      v138 = v11;
      _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding DPSE_associationChanges %@", buf, 0x1Cu);
    }

    -[NSMutableArray addObject:](self->_assocDiffToAppend, "addObject:", v11);
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fieldForKey:", CFSTR("WFAAWDWADAAD_eventType")));
    v95 = v26;
    if (objc_msgSend(v94, "int32Value") == 5)
    {
      v96 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_studyTimeStamps, "objectForKeyedSubscript:", CFSTR("decisionInstance")));
      if (v96)
      {
        v97 = (void *)v96;
        v98 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_studyTimeStamps, "objectForKeyedSubscript:", CFSTR("IPConfiguredEventTimeStamp")));

        if (v98)
          goto LABEL_84;
        v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_studyTimeStamps, "setObject:forKeyedSubscript:", v99, CFSTR("IPConfiguredEventTimeStamp"));

        v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fieldForKey:", CFSTR("WFAAWDWADAAD_additionalInfo")));
        v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v94, "uint32Value")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_studyTimeStamps, "setObject:forKeyedSubscript:", v100, CFSTR("IPAddressTypeOnInterface"));

      }
    }

LABEL_84:
    v101 = self->_dpsCurrentlyGatheringConsecutiveSamples;
    v102 = WALogCategoryDefaultHandle();
    v103 = objc_claimAutoreleasedReturnValue(v102);
    v104 = os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT);
    v26 = v95;
    if (v101)
    {
      if (v104)
      {
        *(_DWORD *)buf = 136446466;
        v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        v135 = 1024;
        v136 = 4690;
        _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Not adding dpsStatsContainer while _dpsCurrentlyGatheringConsecutiveSamples", buf, 0x12u);
      }

    }
    else
    {
      if (v104)
      {
        *(_DWORD *)buf = 136446466;
        v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        v135 = 1024;
        v136 = 4680;
        _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Sampling another dpsStatsContainer", buf, 0x12u);
      }

      v128[0] = _NSConcreteStackBlock;
      v128[1] = 3221225472;
      v128[2] = sub_1000656B8;
      v128[3] = &unk_1000CD6C0;
      v128[4] = self;
      -[WAEngine _getNewMessageForKey:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:](self, "_getNewMessageForKey:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:", CFSTR("DPSCS"), 4, v10, 1, v128);
    }
  }
  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "key"));
  v106 = objc_msgSend(v105, "isEqualToString:", CFSTR("WFAAWDWAAAPI"));

  if (v106)
  {
    v107 = WALogCategoryDefaultHandle();
    v108 = objc_claimAutoreleasedReturnValue(v107);
    if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
      v135 = 1024;
      v136 = 4695;
      v137 = 2112;
      v138 = v11;
      _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding DPSE_accessPointInfo %@", buf, 0x1Cu);
    }

    -[NSMutableArray addObject:](self->_accessPointInfoToAppend, "addObject:", v11);
  }
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "key"));
  v110 = objc_msgSend(v109, "isEqualToString:", CFSTR("USBEN"));

  if (v110)
  {
    v111 = WALogCategoryDefaultHandle();
    v112 = objc_claimAutoreleasedReturnValue(v111);
    if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
      v135 = 1024;
      v136 = 4700;
      v137 = 2112;
      v138 = v11;
      _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding DPSR_usbEvent %@", buf, 0x1Cu);
    }

    -[NSMutableArray addObject:](self->_usbEventNotificationToAppend, "addObject:", v11);
  }
  if (v26)
  {
    studyQueue = self->_studyQueue;
    v125[0] = _NSConcreteStackBlock;
    v125[1] = 3221225472;
    v125[2] = sub_1000657D4;
    v125[3] = &unk_1000CD6E8;
    v125[4] = self;
    v126 = v10;
    v114 = v124;
    v127 = v114;
    dispatch_async((dispatch_queue_t)studyQueue, v125);

    if (a3 == 1)
    {
      v115 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
      v116 = dispatch_time(0, 1000000000 * (_QWORD)objc_msgSend(v115, "dps_report_sent_after") + 5000000000);
      dispatch_semaphore_wait(v114, v116);

      v117 = WALogCategoryDefaultHandle();
      v28 = objc_claimAutoreleasedReturnValue(v117);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        v135 = 1024;
        v136 = 4717;
        v29 = "%{public}s::%d:unblocking is complete... returning";
LABEL_105:
        v30 = v28;
        v31 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_106;
      }
    }
    else
    {
      v118 = WALogCategoryDefaultHandle();
      v28 = objc_claimAutoreleasedReturnValue(v118);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v134 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]";
        v135 = 1024;
        v136 = 4719;
        v29 = "%{public}s::%d:returning immediatley";
        goto LABEL_105;
      }
    }
LABEL_107:

  }
  (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);

}

- (BOOL)isInternalScenario
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;

  v3 = sub_1000432C4();
  if (!objc_opt_class(v3))
    return 0;
  v4 = objc_alloc_init((Class)sub_1000432C4());
  v11 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "queryDebugConfigurationForPeer:error:", 0, &v11));
  v6 = v11;
  v7 = WALogCategoryDefaultHandle();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v13 = "-[WAEngine isInternalScenario]";
    v14 = 1024;
    v15 = 4734;
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Logging:: %@ \n error:%@", buf, 0x26u);
  }

  v9 = v5 && objc_msgSend(v5, "megaWiFiProfile") == (id)1 || self->_isInternalInstall;
  return v9;
}

- (void)triggerPeerDiagnosticsStudy:(unint64_t)a3 symptomsDnsStats:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  unsigned __int8 v9;
  char v10;
  dispatch_semaphore_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  dispatch_time_t v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  uint64_t v48;
  _QWORD v49[4];
  NSObject *v50;
  _BYTE *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint8_t v59[4];
  const char *v60;
  __int16 v61;
  int v62;
  __int16 v63;
  uint64_t v64;
  void *v65;
  _BYTE buf[24];
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;

  v6 = a4;
  v7 = WALogCategoryDefaultHandle();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "-[WAEngine triggerPeerDiagnosticsStudy:symptomsDnsStats:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 4741;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: triggerPeerDiagnosticsStudy with type:%d", buf, 0x18u);
  }

  v9 = -[WAEngine isInternalScenario](self, "isInternalScenario");
  if (a3)
    v10 = v9;
  else
    v10 = 1;
  if ((v10 & 1) != 0)
  {
    v11 = dispatch_semaphore_create(0);
    v12 = (void *)os_transaction_create("com.apple.wifianalytics.triggerPeerDiagnosticsStudy");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[WAActivityManager sharedActivityManager](WAActivityManager, "sharedActivityManager"));
    objc_msgSend(v13, "osTransactionCreate:transaction:", "com.apple.wifianalytics.triggerPeerDiagnosticsStudy", v12);

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v67 = sub_10004B174;
    v68 = sub_10004B184;
    v69 = 0;
    v53 = 0;
    v54 = &v53;
    v55 = 0x3032000000;
    v56 = sub_10004B174;
    v57 = sub_10004B184;
    v58 = 0;
    if (-[WAEngine isWiFiAssociatedToNetwork](self, "isWiFiAssociatedToNetwork"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine _DPSQuickRecoveryEngineObj](self, "_DPSQuickRecoveryEngineObj"));
      v15 = v14;
      if (v14)
      {
        if (objc_msgSend(v14, "isPeerDiagnosticsTriggerAllowed:", a3))
        {
          v16 = sub_10006620C();
          if (objc_opt_class(v16))
          {
            v17 = sub_1000432C4();
            if (objc_opt_class(v17))
            {
              v18 = objc_alloc_init((Class)sub_1000432C4());
              if (v18)
              {
                v19 = objc_msgSend(sub_10006620C(), "requestWithTestID:configuration:", 60, 0);
                v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
                v65 = v20;
                v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v65, 1));

                v49[0] = _NSConcreteStackBlock;
                v49[1] = 3221225472;
                v49[2] = sub_1000662C4;
                v49[3] = &unk_1000CD710;
                v51 = buf;
                v52 = &v53;
                v50 = v11;
                v22 = objc_msgSend(v18, "runDiagnostics:configuration:update:reply:", v21, 0, 0, v49);

              }
              v23 = dispatch_time(0, 6000000000);
              dispatch_semaphore_wait(v11, v23);
              if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
              {
                v24 = WALogCategoryDefaultHandle();
                v25 = objc_claimAutoreleasedReturnValue(v24);
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  v26 = v54[5];
                  *(_DWORD *)v59 = 136446722;
                  v60 = "-[WAEngine triggerPeerDiagnosticsStudy:symptomsDnsStats:]";
                  v61 = 1024;
                  v62 = 4774;
                  v63 = 2112;
                  v64 = v26;
                  _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%{public}s::%d:PeerDiagnostics: Data collection failed with err:%@", v59, 0x1Cu);
                }

              }
            }
          }
        }
      }
      if (a3)
        goto LABEL_35;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fieldForKey:", CFSTR("DPSR_dpsEpiloge")));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "subMessageValue"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "fieldForKey:", CFSTR("DPSE_symptomsDnsStats")));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "subMessageValue"));
      LODWORD(v48) = self->_cumulativeAverageCcaSinceStudyStart;
      v31 = objc_msgSend(v15, "recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:currentSymptomsCondition:isLANPingSuccessful:appUsage:averageCCA:", 0, v30, self->_isAWDLActivitySuspected, self->_isPoorSymptomsDnsConditions, self->_isGatewayReachable, self->_isCriticalAppInUse, v48);

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine infraInterfaceName](self, "infraInterfaceName"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", v33));
      LODWORD(v29) = v34 == 0;

      if ((_DWORD)v29)
        -[WAEngine queryInfraInterfaceInstanceAndChip](self, "queryInfraInterfaceInstanceAndChip");
      -[WAEngine _persist](self, "_persist");
      if (v31 == (id)2)
      {
        v41 = WALogCategoryDefaultHandle();
        v42 = objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v59 = 136446466;
          v60 = "-[WAEngine triggerPeerDiagnosticsStudy:symptomsDnsStats:]";
          v61 = 1024;
          v62 = 4797;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: Triggering Reassoc for symptoms-dps", v59, 0x12u);
        }

        self->_dpsAction |= 0x80u;
        v37 = objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine infraInterfaceName](self, "infraInterfaceName"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v37, "objectForKeyedSubscript:", v43));
        objc_msgSend(v44, "triggerReassociation:", CFSTR("ReassociateOnDNSSymptoms"));

      }
      else if (v31 == (id)1)
      {
        v35 = WALogCategoryDefaultHandle();
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v59 = 136446466;
          v60 = "-[WAEngine triggerPeerDiagnosticsStudy:symptomsDnsStats:]";
          v61 = 1024;
          v62 = 4793;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: Triggering Trap for symptoms-dps", v59, 0x12u);
        }

        self->_dpsAction |= 0x40u;
        v37 = objc_claimAutoreleasedReturnValue(-[WAEngine interfaceNameToApple80211InstanceMap](self, "interfaceNameToApple80211InstanceMap"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine infraInterfaceName](self, "infraInterfaceName"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v37, "objectForKeyedSubscript:", v38));
        objc_msgSend(v39, "triggerDpsReset:", CFSTR("TrapOnDNSSymptoms"));

      }
      else
      {
        v45 = WALogCategoryDefaultHandle();
        v37 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v59 = 136446466;
          v60 = "-[WAEngine triggerPeerDiagnosticsStudy:symptomsDnsStats:]";
          v61 = 1024;
          v62 = 4801;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: No Recovery Action recommended for symptoms-dps", v59, 0x12u);
        }
      }
    }
    else
    {
      v47 = WALogCategoryDefaultHandle();
      v37 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v59 = 136446466;
        v60 = "-[WAEngine triggerPeerDiagnosticsStudy:symptomsDnsStats:]";
        v61 = 1024;
        v62 = 4754;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%{public}s::%d:WiFi disassocited during study so not continuing...", v59, 0x12u);
      }
      v15 = 0;
    }

LABEL_35:
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[WAActivityManager sharedActivityManager](WAActivityManager, "sharedActivityManager"));
    objc_msgSend(v46, "osTransactionComplete:", v12);

    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(buf, 8);

    goto LABEL_36;
  }
  v40 = WALogCategoryDefaultHandle();
  v11 = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "-[WAEngine triggerPeerDiagnosticsStudy:symptomsDnsStats:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 4743;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: peerDiagnosticsStudy disabled", buf, 0x12u);
  }
LABEL_36:

}

- (void)gatherConsecutiveLinkQualitySamples:(int64_t)a3 forProcessToken:(id)a4 andReply:(id)a5
{
  void *v5;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  dispatch_time_t v14;
  OS_dispatch_queue *dpsReadWriteSerialQueue;
  unsigned int i;
  void *v17;
  unint64_t v18;
  BOOL v19;
  void *v20;
  dispatch_semaphore_t v21;
  int64_t v22;
  dispatch_time_t v23;
  OS_dispatch_queue *v24;
  NSObject *v25;
  void *v26;
  _BOOL4 v27;
  id v28;
  NSObject *v29;
  dispatch_time_t v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  dispatch_time_t v34;
  id v35;
  NSObject *v36;
  const char *v37;
  id v38;
  id v39;
  NSObject *v40;
  const __CFString *v41;
  id v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  dispatch_group_t v46;
  dispatch_semaphore_t v48;
  void (**v49)(id, uint64_t, uint64_t);
  NSObject *group;
  id v51;
  _QWORD v52[5];
  id v53;
  NSObject *v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t v58;
  _QWORD v59[5];
  id v60;
  NSObject *v61;
  uint64_t *v62;
  uint64_t *v63;
  uint64_t v64;
  _QWORD block[4];
  dispatch_group_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  NSErrorUserInfoKey v85;
  const __CFString *v86;
  uint8_t buf[4];
  const char *v88;
  __int16 v89;
  int v90;
  __int16 v91;
  const __CFString *v92;

  v51 = a4;
  v49 = (void (**)(id, uint64_t, uint64_t))a5;
  v79 = 0;
  v80 = &v79;
  v81 = 0x3032000000;
  v82 = sub_10004B174;
  v83 = sub_10004B184;
  v84 = 0;
  group = dispatch_group_create();
  v48 = dispatch_semaphore_create(0);
  v73 = 0;
  v74 = &v73;
  v75 = 0x3032000000;
  v76 = sub_10004B174;
  v77 = sub_10004B184;
  v78 = 0;
  v67 = 0;
  v68 = &v67;
  v69 = 0x3032000000;
  v70 = sub_10004B174;
  v71 = sub_10004B184;
  v72 = 0;
  v8 = objc_claimAutoreleasedReturnValue(-[WAEngine _cachedModelObjectsMessageForGroupType:key:](self, "_cachedModelObjectsMessageForGroupType:key:", 4, CFSTR("SWFR")));
  v9 = (void *)v74[5];
  v74[5] = v8;

  v10 = +[WAUtil rotateUUIDsForMessage:](WAUtil, "rotateUUIDsForMessage:", v74[5]);
  v11 = (void *)v74[5];
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fieldForKey:", CFSTR("SWFR_timestamp")));
    objc_msgSend(v12, "setUint64Value:", +[WAUtil getAWDTimestamp](WAUtil, "getAWDTimestamp"));

    dispatch_group_enter(group);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
    v14 = dispatch_time(0, 1000000000 * (_QWORD)objc_msgSend(v13, "slow_wifi_report_sent_after"));
    dpsReadWriteSerialQueue = self->_dpsReadWriteSerialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100066AE8;
    block[3] = &unk_1000CCDB0;
    v46 = group;
    v66 = v46;
    dispatch_after(v14, (dispatch_queue_t)dpsReadWriteSerialQueue, block);

    for (i = 0; ; i = v18 + 1)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
      v18 = i;
      v19 = (unint64_t)objc_msgSend(v17, "slow_wifi_interrogation_sample_count") > i;

      if (!v19)
        break;
      v20 = objc_autoreleasePoolPush();
      v21 = dispatch_semaphore_create(0);
      if ((_DWORD)v18)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
        v22 = 1000000 * (_QWORD)objc_msgSend(v5, "slow_wifi_duration_between_samples");
      }
      else
      {
        v22 = 0;
      }
      v23 = dispatch_time(0, v22);
      v24 = self->_dpsReadWriteSerialQueue;
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_100066BA8;
      v59[3] = &unk_1000CD7B0;
      v59[4] = self;
      v64 = 4;
      v60 = v51;
      v62 = &v79;
      v25 = v21;
      v61 = v25;
      v63 = &v73;
      dispatch_after(v23, (dispatch_queue_t)v24, v59);
      if ((_DWORD)v18)

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
      v27 = (char *)objc_msgSend(v26, "slow_wifi_interrogation_sample_count") - 1 == (_BYTE *)v18;

      if (v27)
      {
        v28 = WALogCategoryDefaultHandle();
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v88 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]";
          v89 = 1024;
          v90 = 4928;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:slow_wifi_interrogation_sample_count hit", buf, 0x12u);
        }

      }
      v30 = dispatch_time(0, 20000000000);
      dispatch_semaphore_wait(v25, v30);

      objc_autoreleasePoolPop(v20);
    }
    v31 = objc_claimAutoreleasedReturnValue(-[WAEngine engineQ](self, "engineQ"));
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_1000678F8;
    v52[3] = &unk_1000CD7D8;
    v52[4] = self;
    v55 = &v73;
    v53 = v51;
    v56 = &v67;
    v57 = &v79;
    v58 = 4;
    v32 = v48;
    v54 = v32;
    dispatch_group_notify(v46, v31, v52);

    if (a3 == 1)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
      v34 = dispatch_time(0, 1000000000 * (_QWORD)objc_msgSend(v33, "slow_wifi_report_sent_after") + 5000000000);
      dispatch_semaphore_wait(v32, v34);

      v35 = WALogCategoryDefaultHandle();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      *(_DWORD *)buf = 136446466;
      v88 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]";
      v89 = 1024;
      v90 = 5015;
      v37 = "%{public}s::%d:unblocking is complete... returning";
    }
    else
    {
      v38 = WALogCategoryDefaultHandle();
      v36 = objc_claimAutoreleasedReturnValue(v38);
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      *(_DWORD *)buf = 136446466;
      v88 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]";
      v89 = 1024;
      v90 = 5017;
      v37 = "%{public}s::%d:returning immediatley";
    }
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, v37, buf, 0x12u);
  }
  else
  {
    v42 = WALogCategoryDefaultHandle();
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v88 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]";
      v89 = 1024;
      v90 = 4820;
      v91 = 2112;
      v92 = CFSTR("SWFR");
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%{public}s::%d:No model class found for key: %@. This is a CRITICAL error", buf, 0x1Cu);
    }

    v85 = NSLocalizedFailureReasonErrorKey;
    v86 = CFSTR("WAErrorCodeNotRegistered");
    v36 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1));
    v44 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9009, v36));
    v45 = (void *)v68[5];
    v68[5] = v44;

  }
LABEL_20:

  v39 = WALogCategoryDefaultHandle();
  v40 = objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    v41 = (const __CFString *)v80[5];
    *(_DWORD *)buf = 136446722;
    v88 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]";
    v89 = 1024;
    v90 = 5021;
    v91 = 2112;
    v92 = v41;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:retErr will return %@", buf, 0x1Cu);
  }

  v49[2](v49, v74[5], v80[5]);
  _Block_object_dispose(&v67, 8);

  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v79, 8);

}

- (void)_triggerSlowWiFiStudy:(int64_t)a3 forProcessToken:(id)a4 waMessage:(id)a5 andReply:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, uint64_t);
  dispatch_semaphore_t v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  id v20;
  NSObject *v21;
  _BOOL4 slowWiFiStudyInProgress;
  _BOOL4 v23;
  id v24;
  NSObject *v25;
  void *v26;
  unsigned int v27;
  id v28;
  NSObject *v29;
  OS_dispatch_queue *studyQueue;
  NSObject *v31;
  void *v32;
  dispatch_time_t v33;
  id v34;
  NSObject *v35;
  const char *v36;
  id v37;
  NSObject *v38;
  os_log_type_t v39;
  id v40;
  NSObject *v41;
  void *v42;
  _BOOL4 dpsStudyInProgress;
  id v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  OS_dispatch_queue *peerDiagnosticsStudyQueue;
  _QWORD block[5];
  id v50;
  NSObject *v51;
  uint64_t *v52;
  _QWORD v53[5];
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  int v63;
  __int16 v64;
  id v65;

  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD, uint64_t))a6;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = sub_10004B174;
  v58 = sub_10004B184;
  v59 = 0;
  v13 = dispatch_semaphore_create(0);
  v14 = WALogCategoryDefaultHandle();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "key"));
    *(_DWORD *)buf = 136446722;
    v61 = "-[WAEngine _triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:]";
    v62 = 1024;
    v63 = 5035;
    v64 = 2112;
    v65 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Got WAMessageAWD%@ ", buf, 0x1Cu);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "key"));
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("WFAAWDSWFN"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fieldForKey:", CFSTR("WFAAWDSWFN_timestamp")));
    objc_msgSend(v19, "setUint64Value:", +[WAUtil getAWDTimestamp](WAUtil, "getAWDTimestamp"));

    v20 = WALogCategoryDefaultHandle();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      slowWiFiStudyInProgress = self->_slowWiFiStudyInProgress;
      *(_DWORD *)buf = 136446722;
      v61 = "-[WAEngine _triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:]";
      v62 = 1024;
      v63 = 5039;
      v64 = 1024;
      LODWORD(v65) = slowWiFiStudyInProgress;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_slowWiFiStudyInProgress is %d", buf, 0x18u);
    }

    v23 = !self->_slowWiFiStudyInProgress;
    if (!self->_slowWiFiStudyInProgress)
    {
      if (self->_dnsStudyInProgress)
        self->_slowWiFiNotificationDuringDnsStudy = 1;
      dpsStudyInProgress = self->_dpsStudyInProgress;
      v44 = WALogCategoryDefaultHandle();
      v35 = objc_claimAutoreleasedReturnValue(v44);
      v45 = os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG);
      if (dpsStudyInProgress)
      {
        if (!v45)
          goto LABEL_24;
        *(_DWORD *)buf = 136446466;
        v61 = "-[WAEngine _triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:]";
        v62 = 1024;
        v63 = 5047;
        v36 = "%{public}s::%d:Got Slow WiFi Notification when dpsStudyInProgress, exiting";
        v38 = v35;
        v39 = OS_LOG_TYPE_DEBUG;
        goto LABEL_23;
      }
      if (v45)
      {
        *(_DWORD *)buf = 136446466;
        v61 = "-[WAEngine _triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:]";
        v62 = 1024;
        v63 = 5051;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Got Slow WiFi Notification when not currently in study, kicking off Study", buf, 0x12u);
      }

      self->_slowWiFiStudyInProgress = 1;
      v46 = (void *)os_transaction_create("com.apple.wifianalytics.slowwifiStudyTransaction");
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[WAActivityManager sharedActivityManager](WAActivityManager, "sharedActivityManager"));
      objc_msgSend(v47, "osTransactionCreate:transaction:", "com.apple.wifianalytics.slowwifiStudyTransaction", v46);

      -[WAEngine setSlowwifiStudyTransaction:](self, "setSlowwifiStudyTransaction:", v46);
      peerDiagnosticsStudyQueue = self->_peerDiagnosticsStudyQueue;
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_100068ED0;
      v53[3] = &unk_1000CCDB0;
      v53[4] = self;
      dispatch_async((dispatch_queue_t)peerDiagnosticsStudyQueue, v53);
    }
    v24 = WALogCategoryDefaultHandle();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v61 = "-[WAEngine _triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:]";
      v62 = 1024;
      v63 = 5064;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding _swfnToAppend", buf, 0x12u);
    }

    -[NSMutableArray addObject:](self->_swfnToAppend, "addObject:", v11);
  }
  else
  {
    v23 = 0;
  }
  if (self->_slowWiFiStudyInProgress)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "key"));
    v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("USBEN"));

    if (v27)
    {
      v28 = WALogCategoryDefaultHandle();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v61 = "-[WAEngine _triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:]";
        v62 = 1024;
        v63 = 5069;
        v64 = 2112;
        v65 = v11;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding _usbEvent %@", buf, 0x1Cu);
      }

      -[NSMutableArray addObject:](self->_usbEventNotificationToAppend, "addObject:", v11);
    }
  }
  if (v23)
  {
    studyQueue = self->_studyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100068F08;
    block[3] = &unk_1000CD828;
    block[4] = self;
    v50 = v10;
    v52 = &v54;
    v31 = v13;
    v51 = v31;
    dispatch_async((dispatch_queue_t)studyQueue, block);

    if (a3 == 1)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
      v33 = dispatch_time(0, 1000000000 * (_QWORD)objc_msgSend(v32, "slow_wifi_report_sent_after") + 5000000000);
      dispatch_semaphore_wait(v31, v33);

      v34 = WALogCategoryDefaultHandle();
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v61 = "-[WAEngine _triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:]";
        v62 = 1024;
        v63 = 5089;
        v36 = "%{public}s::%d:unblocking is complete... returning";
LABEL_22:
        v38 = v35;
        v39 = OS_LOG_TYPE_DEFAULT;
LABEL_23:
        _os_log_impl((void *)&_mh_execute_header, v38, v39, v36, buf, 0x12u);
      }
    }
    else
    {
      v37 = WALogCategoryDefaultHandle();
      v35 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v61 = "-[WAEngine _triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:]";
        v62 = 1024;
        v63 = 5091;
        v36 = "%{public}s::%d:returning immediatley";
        goto LABEL_22;
      }
    }
LABEL_24:

  }
  v40 = WALogCategoryDefaultHandle();
  v41 = objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = (void *)v55[5];
    *(_DWORD *)buf = 136446722;
    v61 = "-[WAEngine _triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:]";
    v62 = 1024;
    v63 = 5095;
    v64 = 2112;
    v65 = v42;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:gatherConsecutiveLinkQualitySamples reply err %@", buf, 0x1Cu);
  }

  v12[2](v12, 0, v55[5]);
  _Block_object_dispose(&v54, 8);

}

- (void)_triggerDatapathDiagnosticsAndCollectUpdates:(int64_t)a3 forProcessToken:(id)a4 waMessage:(id)a5 andReply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  unsigned __int8 v22;
  _QWORD v23[6];
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_10004B174;
  v29 = sub_10004B184;
  v30 = 0;
  if (!self->_appleCaptiveServerIP)
    -[WAEngine resolveAppleCaptiveServer](self, "resolveAppleCaptiveServer");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "key"));
  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("DPSN")) & 1) != 0)
    goto LABEL_10;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "key"));
  if ((objc_msgSend(v14, "isEqualToString:", CFSTR("DPSAPS")) & 1) != 0)
  {
LABEL_9:

LABEL_10:
LABEL_11:
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100069378;
    v24[3] = &unk_1000CD850;
    v24[5] = &v25;
    v17 = v24;
    v24[4] = v12;
    -[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:](self, "_triggerDPSStudy:forProcessToken:waMessage:andReply:", a3, v10, v11, v24);
    goto LABEL_12;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "key"));
  if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WFAAWDWADAAD")) & 1) != 0)
  {
LABEL_8:

    goto LABEL_9;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "key"));
  if ((objc_msgSend(v16, "isEqualToString:", CFSTR("WFAAWDWAAAPI")) & 1) != 0)
  {

    goto LABEL_8;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "key"));
  v22 = objc_msgSend(v18, "isEqualToString:", CFSTR("USBEN"));

  if ((v22 & 1) != 0)
    goto LABEL_11;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "key"));
  if (objc_msgSend(v19, "isEqualToString:", CFSTR("WFAAWDSWFN")))
  {

  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "key"));
    v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("USBEN"));

    if (!v21)
      goto LABEL_13;
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000693EC;
  v23[3] = &unk_1000CD850;
  v23[5] = &v25;
  v17 = v23;
  v23[4] = v12;
  -[WAEngine _triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:](self, "_triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:", a3, v10, v11, v23);
LABEL_12:

LABEL_13:
  (*((void (**)(id, _QWORD, uint64_t))v12 + 2))(v12, 0, v26[5]);
  _Block_object_dispose(&v25, 8);

}

- (id)getNewMessageForKey:(id)a3 groupType:(int64_t)a4 forProcessWithToken:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_time_t v13;
  id v14;
  NSObject *v15;
  id v16;
  uint8_t v18[16];
  _QWORD v19[4];
  NSObject *v20;
  uint8_t *v21;
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a5;
  v10 = WALogCategoryDefaultHandle();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "getNewMessageForKey", ", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v23 = buf;
  v24 = 0x3032000000;
  v25 = sub_10004B174;
  v26 = sub_10004B184;
  v27 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100069654;
  v19[3] = &unk_1000CD800;
  v21 = buf;
  v12 = dispatch_semaphore_create(0);
  v20 = v12;
  -[WAEngine _getNewMessageForKey:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:](self, "_getNewMessageForKey:groupType:forProcessToken:shouldCheckForPrePopulation:andReply:", v8, a4, v9, 0, v19);
  v13 = dispatch_time(0, 15000000000);
  dispatch_semaphore_wait(v12, v13);
  v14 = WALogCategoryDefaultHandle();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)v18 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "getNewMessageForKey", ", v18, 2u);
  }

  v16 = *((id *)v23 + 5);
  _Block_object_dispose(buf, 8);

  return v16;
}

- (id)getNewMessageForKey:(id)a3 groupType:(int64_t)a4 withCopy:(BOOL)a5 forProcessWithToken:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_time_t v15;
  id v16;
  NSObject *v17;
  id v18;
  uint8_t v20[16];
  _QWORD v21[4];
  NSObject *v22;
  uint8_t *v23;
  uint8_t buf[8];
  uint8_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  v12 = WALogCategoryDefaultHandle();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "getNewMessageForKey withCopy", ", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v25 = buf;
  v26 = 0x3032000000;
  v27 = sub_10004B174;
  v28 = sub_10004B184;
  v29 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10006989C;
  v21[3] = &unk_1000CD800;
  v23 = buf;
  v14 = dispatch_semaphore_create(0);
  v22 = v14;
  -[WAEngine _getNewMessageForKey:groupType:withCopy:forProcessToken:shouldCheckForPrePopulation:andReply:](self, "_getNewMessageForKey:groupType:withCopy:forProcessToken:shouldCheckForPrePopulation:andReply:", v10, a4, v7, v11, 0, v21);
  v15 = dispatch_time(0, 15000000000);
  dispatch_semaphore_wait(v14, v15);
  v16 = WALogCategoryDefaultHandle();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)v20 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "getNewMessageForKey withCopy", ", v20, 2u);
  }

  v18 = *((id *)v25 + 5);
  _Block_object_dispose(buf, 8);

  return v18;
}

- (void)persist
{
  OS_dispatch_queue *engineQ;
  _QWORD block[5];

  engineQ = self->_engineQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100069940;
  block[3] = &unk_1000CCDB0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)engineQ, block);
}

- (id)_setDeviceAnalyticsConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  NSObject *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v40;
  id v41;
  NSObject *v42;
  NSErrorUserInfoKey v43;
  const __CFString *v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  uint64_t v50;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_33;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WA_DEVICE_ANALYTICS_PROCESSING_INTERVAL")));
  if (!v6)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WA_DEVICE_ANALYTICS_AGE_OUT_INTERVAL")));
    if (!v6)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WA_DEVICE_ANALYTICS_CONFIG_AGE_OUT_TEST_DAYS_DIFF")));
      if (!v6)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WA_DEVICE_ANALYTICS_CONFIG_DEPLOYMENT_METRIC_DAYS_DIFF")));
        if (!v6)
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WA_DEVICE_ANALYTICS_CONFIG_ROAM_SAMPLES")));

          if (v40)
            goto LABEL_7;
LABEL_33:
          v41 = WALogCategoryDefaultHandle();
          v42 = objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446722;
            v46 = "-[WAEngine _setDeviceAnalyticsConfiguration:]";
            v47 = 1024;
            v48 = 5194;
            v49 = 2048;
            v50 = 5;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%{public}s::%d:For grouptype: %ld invalid configuration", buf, 0x1Cu);
          }

          v43 = NSLocalizedFailureReasonErrorKey;
          v44 = CFSTR("WAErrorCodeLacksRequiredArgument");
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9010, v37));
          v32 = 0;
          goto LABEL_29;
        }
      }
    }
  }

LABEL_7:
  v7 = WALogCategoryDefaultHandle();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    v46 = "-[WAEngine _setDeviceAnalyticsConfiguration:]";
    v47 = 1024;
    v48 = 5196;
    v49 = 2112;
    v50 = (uint64_t)v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Received configuration: %@", buf, 0x1Cu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WA_DEVICE_ANALYTICS_PROCESSING_INTERVAL")));
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "doubleValue");
    -[WAEngine setAnalyticsProcessingTimeIntervalSecs:](self, "setAnalyticsProcessingTimeIntervalSecs:");
    v11 = WALogCategoryDefaultHandle();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      -[WAEngine analyticsProcessingTimeIntervalSecs](self, "analyticsProcessingTimeIntervalSecs");
      *(_DWORD *)buf = 136446722;
      v46 = "-[WAEngine _setDeviceAnalyticsConfiguration:]";
      v47 = 1024;
      v48 = 5200;
      v49 = 2048;
      v50 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Updated analyticsProcessingTimeInterval to %2.2f seconds", buf, 0x1Cu);
    }

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WA_DEVICE_ANALYTICS_AGE_OUT_INTERVAL")));

  if (v14)
  {
    objc_msgSend(v14, "doubleValue");
    -[WAEngine setAnalyticsAgeOutTimeIntervalSecs:](self, "setAnalyticsAgeOutTimeIntervalSecs:");
    v15 = WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      -[WAEngine analyticsAgeOutTimeIntervalSecs](self, "analyticsAgeOutTimeIntervalSecs");
      *(_DWORD *)buf = 136446722;
      v46 = "-[WAEngine _setDeviceAnalyticsConfiguration:]";
      v47 = 1024;
      v48 = 5206;
      v49 = 2048;
      v50 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Updated analyticsAgeOutTimeInterval to %2.2f seconds", buf, 0x1Cu);
    }

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WA_DEVICE_ANALYTICS_CONFIG_AGE_OUT_TEST_DAYS_DIFF")));

  if (v18)
  {
    v19 = objc_msgSend(v18, "unsignedLongValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine analyticsProcessor](self, "analyticsProcessor"));
    objc_msgSend(v20, "setTestDateDiffDays:", v19);

    v21 = WALogCategoryDefaultHandle();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine analyticsProcessor](self, "analyticsProcessor"));
      v24 = objc_msgSend(v23, "testDateDiffDays");
      *(_DWORD *)buf = 136446722;
      v46 = "-[WAEngine _setDeviceAnalyticsConfiguration:]";
      v47 = 1024;
      v48 = 5212;
      v49 = 2048;
      v50 = (uint64_t)v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Updated testDateDiffDays to %lu days", buf, 0x1Cu);

    }
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WA_DEVICE_ANALYTICS_CONFIG_DEPLOYMENT_METRIC_DAYS_DIFF")));

  if (v25)
  {
    v26 = objc_msgSend(v25, "unsignedLongValue");
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine analyticsProcessor](self, "analyticsProcessor"));
    objc_msgSend(v27, "setDeploymentMetricDiffDays:", v26);

    v28 = WALogCategoryDefaultHandle();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine analyticsProcessor](self, "analyticsProcessor"));
      v31 = objc_msgSend(v30, "deploymentMetricDiffDays");
      *(_DWORD *)buf = 136446722;
      v46 = "-[WAEngine _setDeviceAnalyticsConfiguration:]";
      v47 = 1024;
      v48 = 5218;
      v49 = 2048;
      v50 = (uint64_t)v31;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Updated deploymentMetricDiffDays to %lu days", buf, 0x1Cu);

    }
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WA_DEVICE_ANALYTICS_CONFIG_ROAM_SAMPLES")));

  if (!v32)
  {
    v38 = 0;
    goto LABEL_31;
  }
  v33 = WALogCategoryDefaultHandle();
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    v35 = objc_msgSend(v32, "unsignedLongValue");
    *(_DWORD *)buf = 136446722;
    v46 = "-[WAEngine _setDeviceAnalyticsConfiguration:]";
    v47 = 1024;
    v48 = 5223;
    v49 = 2048;
    v50 = (uint64_t)v35;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Roam Samples %lu ", buf, 0x1Cu);
  }

  v36 = objc_msgSend(v32, "unsignedLongValue");
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine analyticsProcessor](self, "analyticsProcessor"));
  objc_msgSend(v37, "setNumRoamSamples:", v36);
  v38 = 0;
LABEL_29:

LABEL_31:
  return v38;
}

- (id)_getDeviceAnalyticsConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[4];

  v11[0] = CFSTR("WA_DEVICE_ANALYTICS_PROCESSING_INTERVAL");
  -[WAEngine analyticsProcessingTimeIntervalSecs](self, "analyticsProcessingTimeIntervalSecs");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v12[0] = v3;
  v11[1] = CFSTR("WA_DEVICE_ANALYTICS_AGE_OUT_INTERVAL");
  -[WAEngine analyticsAgeOutTimeIntervalSecs](self, "analyticsAgeOutTimeIntervalSecs");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v12[1] = v4;
  v11[2] = CFSTR("WA_DEVICE_ANALYTICS_CONFIG_AGE_OUT_TEST_DAYS_DIFF");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine analyticsProcessor](self, "analyticsProcessor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "testDateDiffDays")));
  v12[2] = v6;
  v11[3] = CFSTR("WA_DEVICE_ANALYTICS_CONFIG_DEPLOYMENT_METRIC_DAYS_DIFF");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine analyticsProcessor](self, "analyticsProcessor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "deploymentMetricDiffDays")));
  v12[3] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 4));

  return v9;
}

- (void)triggerDeviceAnalyticsStoreMigrationAndReply:(id)a3
{
  -[WAEngine _triggerDeviceAnalyticsStoreMigrationAndReply:](self, "_triggerDeviceAnalyticsStoreMigrationAndReply:", a3);
}

- (void)setValueForKeyToUserDefaults:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;

  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    v9 = WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446466;
      v11 = "-[WAEngine setValueForKeyToUserDefaults:forKey:]";
      v12 = 1024;
      v13 = 5251;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:key is nil", (uint8_t *)&v10, 0x12u);
    }
    goto LABEL_4;
  }
  v7 = objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  if (v7)
  {
    v8 = v7;
    -[NSObject setObject:forKey:](v7, "setObject:forKey:", v5, v6);
    -[NSObject synchronize](v8, "synchronize");
LABEL_4:

  }
}

- (id)getValueForKeyFromUserDefaults:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", v3));

  }
  else
  {
    v7 = WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136446466;
      v10 = "-[WAEngine getValueForKeyFromUserDefaults:]";
      v11 = 1024;
      v12 = 5266;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:key is nil", (uint8_t *)&v9, 0x12u);
    }

    v5 = 0;
  }

  return v5;
}

- (void)storeWAMessageToDB:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  OS_dispatch_queue *engineQ;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;

  v4 = a3;
  if (!-[WAEngine analyticsProcessorIsReady](self, "analyticsProcessorIsReady"))
  {
    v15 = WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_6;
    *(_DWORD *)buf = 136446466;
    v21 = "-[WAEngine storeWAMessageToDB:]";
    v22 = 1024;
    v23 = 5276;
    v16 = "%{public}s::%d:AnalyticsProcessor not ready";
    v17 = v8;
    v18 = OS_LOG_TYPE_DEFAULT;
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, buf, 0x12u);
    goto LABEL_6;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine analyticsProcessor](self, "analyticsProcessor"));

  v6 = WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (!v5)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    *(_DWORD *)buf = 136446466;
    v21 = "-[WAEngine storeWAMessageToDB:]";
    v22 = 1024;
    v23 = 5277;
    v16 = "%{public}s::%d:analyticsProcessor nil";
    v17 = v8;
    v18 = OS_LOG_TYPE_ERROR;
    goto LABEL_13;
  }
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "storeWAMessageToDB", ", buf, 2u);
  }

  engineQ = self->_engineQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006A580;
  block[3] = &unk_1000CCDB0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)engineQ, block);
  v8 = objc_claimAutoreleasedReturnValue(-[WAEngine analyticsProcessor](self, "analyticsProcessor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metricName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metricInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kWAMessageValue));
  -[NSObject processWAMessageMetric:data:](v8, "processWAMessageMetric:data:", v10, v12);

LABEL_6:
  v13 = WALogCategoryDefaultHandle();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "storeWAMessageToDB", ", buf, 2u);
  }

}

- (void)processMetricDictOffEngine:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *engineQ;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_engineQ);
  engineQ = self->_engineQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006A658;
  block[3] = &unk_1000CD6E8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync((dispatch_queue_t)engineQ, block);

}

- (void)processMetricDictOnEngine:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  id v18;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_engineQ);
  v8 = WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_signpost_enabled(v9))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "processMetricDictOnEngine", ", (uint8_t *)&v19, 2u);
  }

  if (-[WAEngine analyticsProcessorIsReady](self, "analyticsProcessorIsReady"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine analyticsProcessor](self, "analyticsProcessor"));

    if (v10)
    {
      +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("AnalyticsProcessor: Process Metric"), self->_cachedUsage, self->_engineQ);
      -[AnalyticsProcessor processWAMessageMetric:data:](self->_analyticsProcessor, "processWAMessageMetric:data:", v6, v7);
      goto LABEL_6;
    }
    v18 = WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v19 = 136446466;
      v20 = "-[WAEngine processMetricDictOnEngine:data:]";
      v21 = 1024;
      v22 = 5313;
      v15 = "%{public}s::%d:AnalyticsProcessor nil";
      v16 = v14;
      v17 = OS_LOG_TYPE_ERROR;
      goto LABEL_13;
    }
  }
  else
  {
    v13 = WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136446466;
      v20 = "-[WAEngine processMetricDictOnEngine:data:]";
      v21 = 1024;
      v22 = 5312;
      v15 = "%{public}s::%d:AnalyticsProcessor not ready";
      v16 = v14;
      v17 = OS_LOG_TYPE_DEFAULT;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v16, v17, v15, (uint8_t *)&v19, 0x12u);
    }
  }

LABEL_6:
  v11 = WALogCategoryDefaultHandle();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_signpost_enabled(v12))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "processMetricDictOnEngine", ", (uint8_t *)&v19, 2u);
  }

}

- (id)_summarizeDeviceAnalyticsForNetwork:(id)a3 maxAgeInDays:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD block[5];

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[WAEngine fileHandlingQ](self, "fileHandlingQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006A978;
  block[3] = &unk_1000CCDB0;
  block[4] = self;
  dispatch_sync(v7, block);

  +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("AnalyticsProcessor: Summarize Analytics For Network"), self->_cachedUsage, self->_engineQ);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine analyticsProcessor](self, "analyticsProcessor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "summarizeAnalyticsForNetwork:maxAgeInDays:", v6, a4));

  return v9;
}

- (void)processWiFiAnalyticsManagedFault:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  char *v31;
  id v32;
  NSObject *v33;
  id v34;
  const char *v35;
  NSObject *v36;
  os_log_type_t v37;
  id v38;
  id v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  char *v45;
  __int16 v46;
  id v47;
  const __CFString *v48;
  void *v49;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metricInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kWAMessageKeyFaultName));
  v7 = kWAMessageValue;
  v8 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kWAMessageValue));

  v9 = WALogCategoryDefaultHandle();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v41 = "-[WAEngine processWiFiAnalyticsManagedFault:]";
    v42 = 1024;
    v43 = 5342;
    v44 = 2112;
    v45 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:processWiFiAnalyticsManagedFault: FaultName %@", buf, 0x1Cu);
  }

  if (!-[WAEngine analyticsProcessorIsReady](self, "analyticsProcessorIsReady"))
  {
    v34 = WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue(v34);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_30;
    *(_DWORD *)buf = 136446466;
    v41 = "-[WAEngine processWiFiAnalyticsManagedFault:]";
    v42 = 1024;
    v43 = 5344;
    v35 = "%{public}s::%d:AnalyticsProcessor not ready";
    v36 = v14;
    v37 = OS_LOG_TYPE_DEFAULT;
LABEL_37:
    _os_log_impl((void *)&_mh_execute_header, v36, v37, v35, buf, 0x12u);
    goto LABEL_30;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine analyticsProcessor](self, "analyticsProcessor"));

  v12 = WALogCategoryDefaultHandle();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (!v11)
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    *(_DWORD *)buf = 136446466;
    v41 = "-[WAEngine processWiFiAnalyticsManagedFault:]";
    v42 = 1024;
    v43 = 5345;
    v35 = "%{public}s::%d:analyticsProcessor nil";
    v36 = v14;
    v37 = OS_LOG_TYPE_ERROR;
    goto LABEL_37;
  }
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "processWiFiAnalyticsManagedFault", ", buf, 2u);
  }

  +[WAUtil incrementValueForKey:inMutableDict:onQueue:](WAUtil, "incrementValueForKey:inMutableDict:onQueue:", CFSTR("Operation: Forwarded Fault"), self->_cachedUsage, self->_engineQ);
  v14 = objc_claimAutoreleasedReturnValue(-[WAEngine getW5Client](self, "getW5Client"));
  if (v14)
  {
    if ((objc_msgSend(v8, "containsString:", CFSTR("FaultReasonSiriTimedOut")) & 1) != 0)
    {
      v15 = 3;
    }
    else if ((objc_msgSend(v8, "containsString:", CFSTR("FaultReasonAirplayRealtimeAudioUnderrun")) & 1) != 0)
    {
      v15 = 1;
    }
    else if ((objc_msgSend(v8, "containsString:", CFSTR("FaultReasonAirplayBufferedAudioUnderrun")) & 1) != 0)
    {
      v15 = 2;
    }
    else if ((objc_msgSend(v8, "containsString:", CFSTR("FaultReasonHomeKitFault")) & 1) != 0)
    {
      v15 = 4;
    }
    else if ((objc_msgSend(v8, "containsString:", CFSTR("FaultReasonAirplayConnectionStall")) & 1) != 0)
    {
      v15 = 6;
    }
    else
    {
      v16 = WALogCategoryDefaultHandle();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v41 = "-[WAEngine processWiFiAnalyticsManagedFault:]";
        v42 = 1024;
        v43 = 5373;
        v44 = 2112;
        v45 = v8;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:processWiFiAnalyticsManagedFault: Unhnandled FaultName %@", buf, 0x1Cu);
      }

      v18 = WALogCategoryDefaultHandle();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v8;
        _os_log_fault_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "processWiFiAnalyticsManagedFault: Unhnandled FaultName %@", buf, 0xCu);
      }

      v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v20 = objc_alloc_init((Class)W5Event);
    objc_msgSend(v20, "setEventID:", 38);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metricInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", kWAMessageKeyFaultDate));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v7));
    objc_msgSend(v23, "timeIntervalSinceReferenceDate");
    objc_msgSend(v20, "setTimestamp:");

    v48 = CFSTR("FaultType");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v15));
    v49 = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));
    objc_msgSend(v20, "setInfo:", v25);

    v39 = 0;
    -[NSObject submitFaultEvent:error:](v14, "submitFaultEvent:error:", v20, &v39);
    v26 = v39;
    v27 = WALogCategoryDefaultHandle();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    v29 = v28;
    if (v26)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSObject description](v26, "description")));
        v31 = (char *)objc_msgSend(v30, "UTF8String");
        *(_DWORD *)buf = 136446722;
        v41 = "-[WAEngine processWiFiAnalyticsManagedFault:]";
        v42 = 1024;
        v43 = 5385;
        v44 = 2080;
        v45 = v31;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%{public}s::%d:[W5Client submitFaultEvent:error:] failed, (error=%s)", buf, 0x1Cu);

      }
    }
    else if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      v41 = "-[WAEngine processWiFiAnalyticsManagedFault:]";
      v42 = 1024;
      v43 = 5387;
      v44 = 2112;
      v45 = v8;
      v46 = 2112;
      v47 = v20;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:[W5Client submitFaultEvent:error:] FaultName: %@ FaultEventDescription %@", buf, 0x26u);
    }

  }
  else
  {
    v38 = WALogCategoryDefaultHandle();
    v26 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v41 = "-[WAEngine processWiFiAnalyticsManagedFault:]";
      v42 = 1024;
      v43 = 5357;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}s::%d:Unable to create velocity client", buf, 0x12u);
    }
  }

LABEL_30:
  v32 = WALogCategoryDefaultHandle();
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_signpost_enabled(v33))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "processWiFiAnalyticsManagedFault", ", buf, 2u);
  }

}

- (BOOL)canProcessWiFiAnalyticsMessageJSONFiles:(id)a3
{
  id v4;
  double v5;
  _BOOL4 v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  NSObject *v26;
  __int16 v27;
  double v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;

  v4 = a3;
  if (!v4)
  {
    LOBYTE(v6) = 0;
    goto LABEL_20;
  }
  -[WAEngine analyticsProcessingTimeIntervalSecs](self, "analyticsProcessingTimeIntervalSecs");
  if (v5 != 0.0
    && (+[WAUtil shouldProcessAnalyticsImmediately](WAUtil, "shouldProcessAnalyticsImmediately") & 1) == 0)
  {
    if ((unint64_t)objc_msgSend(v4, "count") >= 0x32)
    {
      v7 = WALogCategoryDefaultHandle();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v19 = 136446466;
        v20 = "-[WAEngine canProcessWiFiAnalyticsMessageJSONFiles:]";
        v21 = 1024;
        v22 = 5417;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Unprocessed file count crossed the threshold. Should process them.", (uint8_t *)&v19, 0x12u);
      }
      LOBYTE(v6) = 1;
LABEL_19:

      goto LABEL_20;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine getValueForKeyFromUserDefaults:](self, "getValueForKeyFromUserDefaults:", CFSTR("WA_LAST_JSON_PROCESSED_DATE")));
    v11 = 0.0;
    if (v10 && (v12 = objc_opt_class(NSDate), (objc_opt_isKindOfClass(v10, v12) & 1) != 0))
    {
      v8 = v10;
      objc_msgSend(v9, "timeIntervalSinceDate:", v8);
      v11 = v13;
      -[WAEngine analyticsProcessingTimeIntervalSecs](self, "analyticsProcessingTimeIntervalSecs");
      if (v11 < v14)
      {
        v6 = 0;
LABEL_16:
        v15 = WALogCategoryDefaultHandle();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          -[WAEngine analyticsProcessingTimeIntervalSecs](self, "analyticsProcessingTimeIntervalSecs");
          v19 = 136447746;
          v20 = "-[WAEngine canProcessWiFiAnalyticsMessageJSONFiles:]";
          v21 = 1024;
          v22 = 5441;
          v23 = 1024;
          v24 = v6;
          v25 = 2112;
          v26 = v8;
          v27 = 2048;
          v28 = v11;
          v29 = 2048;
          v30 = v17;
          v31 = 2048;
          v32 = objc_msgSend(v4, "count");
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:canProcess: %d lastProcessedDate: %@ secondsBetween:%2.2f interval:%2.2f pendingJSONs:%lu", (uint8_t *)&v19, 0x40u);
        }

        goto LABEL_19;
      }
    }
    else
    {
      v8 = 0;
    }
    -[WAEngine setValueForKeyToUserDefaults:forKey:](self, "setValueForKeyToUserDefaults:forKey:", v9, CFSTR("WA_LAST_JSON_PROCESSED_DATE"));
    v6 = 1;
    goto LABEL_16;
  }
  LOBYTE(v6) = 1;
LABEL_20:

  return v6;
}

- (void)processWiFiAnalyticsMessageJSONFilesInTmpDir:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  OS_dispatch_queue *engineQ;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  id v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  NSObject *v51;
  id v52;
  id v53;
  NSObject *v54;
  id v55;
  id v56;
  id v57;
  NSObject *v58;
  id v59;
  NSObject *v60;
  void *v61;
  id v62;
  NSObject *v63;
  id v64;
  const char *v65;
  NSObject *v66;
  os_log_type_t v67;
  uint32_t v68;
  id v69;
  NSObject *v70;
  id v71;
  NSObject *v72;
  void *v73;
  void *v74;
  WAEngine *v75;
  id v76;
  void *v77;
  id obj;
  uint64_t v79;
  _QWORD v80[5];
  id v81;
  _QWORD v82[5];
  id v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v91;
  __int16 v92;
  int v93;
  __int16 v94;
  NSObject *v95;
  __int16 v96;
  void *v97;
  _BYTE v98[128];

  v3 = a3;
  if (!-[WAEngine analyticsProcessorIsReady](self, "analyticsProcessorIsReady"))
  {
    v64 = WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue(v64);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_67;
    *(_DWORD *)buf = 136446466;
    v91 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
    v92 = 1024;
    v93 = 5453;
    v65 = "%{public}s::%d:AnalyticsProcessor not ready";
    v66 = v8;
    v67 = OS_LOG_TYPE_DEFAULT;
    v68 = 18;
LABEL_74:
    _os_log_impl((void *)&_mh_execute_header, v66, v67, v65, buf, v68);
    goto LABEL_67;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine analyticsProcessor](self, "analyticsProcessor"));

  v6 = WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (!v5)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    *(_DWORD *)buf = 136446722;
    v91 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
    v92 = 1024;
    v93 = 5454;
    v94 = 1024;
    LODWORD(v95) = v3;
    v65 = "%{public}s::%d:analyticsProcessor nil. processImmediately=%d";
    v66 = v8;
    v67 = OS_LOG_TYPE_ERROR;
    v68 = 24;
    goto LABEL_74;
  }
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "processWiFiAnalyticsMessageJSONFilesInTmpDir", ", buf, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine wifianalyticsTmpDir](self, "wifianalyticsTmpDir"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));

  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "contentsOfDirectoryAtPath:error:", v8, 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF EndsWith '.json'")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "filteredArrayUsingPredicate:", v11));

  if (v12)
  {
    if (v3
      || -[WAEngine canProcessWiFiAnalyticsMessageJSONFiles:](self, "canProcessWiFiAnalyticsMessageJSONFiles:", v12))
    {
      v74 = v11;
      engineQ = self->_engineQ;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10006C0E8;
      block[3] = &unk_1000CCDB0;
      block[4] = self;
      dispatch_sync((dispatch_queue_t)engineQ, block);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine analyticsProcessor](self, "analyticsProcessor"));
      v75 = self;
      -[WAEngine analyticsAgeOutTimeIntervalSecs](self, "analyticsAgeOutTimeIntervalSecs");
      objc_msgSend(v14, "ageOutAnalytics:");

      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      v73 = v12;
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sortedArrayUsingSelector:", "compare:"));
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
      if (!v15)
        goto LABEL_63;
      v16 = v15;
      v79 = *(_QWORD *)v86;
      while (1)
      {
        v17 = 0;
        v76 = v16;
        do
        {
          if (*(_QWORD *)v86 != v79)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)v17);
          v19 = objc_claimAutoreleasedReturnValue(-[NSObject stringByAppendingPathComponent:](v8, "stringByAppendingPathComponent:", v18));
          v20 = WALogCategoryDefaultHandle();
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446722;
            v91 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
            v92 = 1024;
            v93 = 5484;
            v94 = 2112;
            v95 = v19;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Reading %@", buf, 0x1Cu);
          }

          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v19));
          if (!v22)
          {
            v52 = WALogCategoryDefaultHandle();
            v23 = objc_claimAutoreleasedReturnValue(v52);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              v91 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
              v92 = 1024;
              v93 = 5487;
              v94 = 2112;
              v95 = v19;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}s::%d:fileData nil: %@", buf, 0x1Cu);
            }
            goto LABEL_40;
          }
          v84 = 0;
          v23 = objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v22, 0, &v84));
          v24 = v84;
          if (v24)
          {
            v44 = v24;
            v53 = WALogCategoryDefaultHandle();
            v54 = objc_claimAutoreleasedReturnValue(v53);
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              v91 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
              v92 = 1024;
              v93 = 5490;
              v94 = 2112;
              v95 = v19;
              _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%{public}s::%d:Malformed json from file: %@", buf, 0x1Cu);
            }

          }
          else
          {
            if (!v23 || (v25 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v23, v25) & 1) == 0))
            {
              v42 = WALogCategoryDefaultHandle();
              v43 = objc_claimAutoreleasedReturnValue(v42);
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136446722;
                v91 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
                v92 = 1024;
                v93 = 5533;
                v94 = 2112;
                v95 = v19;
                _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%{public}s::%d:Cannot get dict from json file: %@", buf, 0x1Cu);
              }

LABEL_40:
              v44 = 0;
              goto LABEL_50;
            }
            v23 = v23;
            v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject allKeys](v23, "allKeys"));
            v27 = v26;
            if (v26 && objc_msgSend(v26, "count") == (id)1)
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectAtIndex:", 0));
              if (v28 && (v29 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v28, v29) & 1) != 0))
              {
                v30 = v8;
                v31 = WALogCategoryDefaultHandle();
                v32 = objc_claimAutoreleasedReturnValue(v31);
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136446978;
                  v91 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
                  v92 = 1024;
                  v93 = 5501;
                  v94 = 2112;
                  v95 = v19;
                  v96 = 2112;
                  v97 = v28;
                  _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%@ contains %@", buf, 0x26u);
                }

                if (objc_msgSend(v28, "isEqualToString:", CFSTR("WA_DEVICE_ANALYTICS_DATAPATH_METRIC_STREAM")))
                {
                  v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", v28));
                  v34 = objc_claimAutoreleasedReturnValue(-[NSObject stringByAppendingPathComponent:](v30, "stringByAppendingPathComponent:", v33));

                  if (v34)
                  {
                    v35 = WALogCategoryDefaultHandle();
                    v36 = objc_claimAutoreleasedReturnValue(v35);
                    if (os_signpost_enabled(v36))
                    {
                      *(_WORD *)buf = 0;
                      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v36, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "processWiFiAnalyticsMessageWAMFile", ", buf, 2u);
                    }

                    -[WAEngine processWiFiAnalyticsMessageWAMFile:file:](v75, "processWiFiAnalyticsMessageWAMFile:file:", v34, v18);
                    v37 = WALogCategoryDefaultHandle();
                    v38 = objc_claimAutoreleasedReturnValue(v37);
                    if (os_signpost_enabled(v38))
                    {
                      *(_WORD *)buf = 0;
                      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "processWiFiAnalyticsMessageWAMFile", ", buf, 2u);
                    }

                  }
                  v83 = 0;
                  objc_msgSend(v77, "removeItemAtPath:error:", v34, &v83);
                  v39 = v83;
                  if (v39)
                  {
                    v40 = WALogCategoryDefaultHandle();
                    v41 = objc_claimAutoreleasedReturnValue(v40);
                    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136446722;
                      v91 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
                      v92 = 1024;
                      v93 = 5513;
                      v94 = 2112;
                      v95 = v34;
                      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to remove file at path: %@", buf, 0x1Cu);
                    }

                  }
                  v8 = v30;
                }
                else
                {
                  v45 = WALogCategoryDefault;
                  if (os_signpost_enabled((os_log_t)WALogCategoryDefault))
                  {
                    *(_WORD *)buf = 0;
                    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v45, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "processWAMessageMetric", ", buf, 2u);
                  }
                  v46 = v75->_engineQ;
                  v82[0] = _NSConcreteStackBlock;
                  v82[1] = 3221225472;
                  v82[2] = sub_10006C10C;
                  v82[3] = &unk_1000CCDB0;
                  v82[4] = v75;
                  dispatch_sync(v46, v82);
                  v47 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine analyticsProcessor](v75, "analyticsProcessor"));
                  v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject valueForKey:](v23, "valueForKey:", v28));
                  objc_msgSend(v47, "processWAMessageMetric:data:", v28, v48);

                  v49 = WALogCategoryDefaultHandle();
                  v39 = objc_claimAutoreleasedReturnValue(v49);
                  if (os_signpost_enabled(v39))
                  {
                    *(_WORD *)buf = 0;
                    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "processWAMessageMetric", ", buf, 2u);
                  }
                }
              }
              else
              {
                v56 = WALogCategoryDefaultHandle();
                v39 = objc_claimAutoreleasedReturnValue(v56);
                if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136446722;
                  v91 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
                  v92 = 1024;
                  v93 = 5500;
                  v94 = 2112;
                  v95 = v23;
                  _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%{public}s::%d:Object for metricName not NSString %@", buf, 0x1Cu);
                }
              }
            }
            else
            {
              v55 = WALogCategoryDefaultHandle();
              v39 = objc_claimAutoreleasedReturnValue(v55);
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136446722;
                v91 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
                v92 = 1024;
                v93 = 5497;
                v94 = 2112;
                v95 = v23;
                _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%{public}s::%d:Unexpected metric dict %@", buf, 0x1Cu);
              }
              v28 = 0;
            }

            v81 = 0;
            objc_msgSend(v77, "removeItemAtPath:error:", v19, &v81);
            v44 = v81;
            if (v44)
            {
              v50 = WALogCategoryDefaultHandle();
              v51 = objc_claimAutoreleasedReturnValue(v50);
              if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136446722;
                v91 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
                v92 = 1024;
                v93 = 5530;
                v94 = 2112;
                v95 = v19;
                _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to remove file at path: %@", buf, 0x1Cu);
              }

            }
            v16 = v76;
          }
LABEL_50:

          v17 = (char *)v17 + 1;
        }
        while (v16 != v17);
        v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
        v16 = v57;
        if (!v57)
        {
LABEL_63:

          v58 = v75->_engineQ;
          v80[0] = _NSConcreteStackBlock;
          v80[1] = 3221225472;
          v80[2] = sub_10006C130;
          v80[3] = &unk_1000CCDB0;
          v80[4] = v75;
          dispatch_sync(v58, v80);
          v59 = WALogCategoryDefaultHandle();
          v60 = objc_claimAutoreleasedReturnValue(v59);
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v91 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
            v92 = 1024;
            v93 = 5545;
            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:performPruneBasedOnStoreSizeAndSave", buf, 0x12u);
          }

          v61 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine analyticsProcessor](v75, "analyticsProcessor"));
          objc_msgSend(v61, "performPruneBasedOnStoreSizeAndSave");

          goto LABEL_66;
        }
      }
    }
    v71 = WALogCategoryDefaultHandle();
    v72 = objc_claimAutoreleasedReturnValue(v71);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v91 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
      v92 = 1024;
      v93 = 5469;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "%{public}s::%d:Cannot process the files", buf, 0x12u);
    }

  }
  else
  {
    v69 = WALogCategoryDefaultHandle();
    v70 = objc_claimAutoreleasedReturnValue(v69);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v91 = "-[WAEngine processWiFiAnalyticsMessageJSONFilesInTmpDir:]";
      v92 = 1024;
      v93 = 5466;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "%{public}s::%d:No files to process", buf, 0x12u);
    }

  }
LABEL_66:

LABEL_67:
  v62 = WALogCategoryDefaultHandle();
  v63 = objc_claimAutoreleasedReturnValue(v62);
  if (os_signpost_enabled(v63))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v63, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "processWiFiAnalyticsMessageJSONFilesInTmpDir", ", buf, 2u);
  }

}

- (void)processWiFiAnalyticsMessageWAMFile:(id)a3 file:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  OS_dispatch_queue *engineQ;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  _QWORD block[5];
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;

  v6 = a3;
  v7 = a4;
  v8 = WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "processWiFiAnalyticsMessageWAMFile", ", buf, 2u);
  }

  v10 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v10, "setDateFormat:", CFSTR("yyyy'-'MM'-'dd-HHmmssSSS"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringFromIndex:", objc_msgSend(CFSTR("wifianalytics_"), "length")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringToIndex:", objc_msgSend(CFSTR("yyyy-MM-dd-HHmmssSSS"), "length")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateFromString:", v12));

  v14 = objc_autoreleasePoolPush();
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v6));
  v16 = v15;
  if (v15)
  {
    engineQ = self->_engineQ;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006C3FC;
    block[3] = &unk_1000CD6E8;
    block[4] = self;
    v23 = v15;
    v24 = v13;
    dispatch_async((dispatch_queue_t)engineQ, block);

  }
  else
  {
    v18 = WALogCategoryDefaultHandle();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v26 = "-[WAEngine processWiFiAnalyticsMessageWAMFile:file:]";
      v27 = 1024;
      v28 = 5576;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to dataWithContentsOfFile", buf, 0x12u);
    }

  }
  objc_autoreleasePoolPop(v14);
  v20 = WALogCategoryDefaultHandle();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "processWiFiAnalyticsMessageWAMFile", ", buf, 2u);
  }

}

- (void)clearDnsStudyVariables
{
  void *v3;
  _BYTE *v4;
  void *v5;

  *(_WORD *)&self->_isAWDLActivitySuspected = 256;
  *(_DWORD *)&self->_isCaptiveServerIPResolved = 256;
  self->_isPingEnqueueFailing = 0;
  *(_OWORD *)&self->_cumulativeAverageCcaSinceStudyStart = 0u;
  *(_OWORD *)&self->_totalLANPingSuccessBeforeTrap = 0u;
  *(_OWORD *)&self->_totalWANPingSuccessBeforeTrap = 0u;
  *(_OWORD *)&self->_totalLANPingSuccessAfterTrap = 0u;
  *(_OWORD *)&self->_totalWANPingSuccessAfterTrap = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
  v4 = objc_msgSend(v3, "dns_symptoms_interrogation_sample_count");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
  self->_numNetScoreBelowThresholdAfterTrap = v4 - (_BYTE *)objc_msgSend(v5, "dns_symptoms_trap_evaluated_at_sample");

  *(_OWORD *)&self->_impactedServersAtStudyStart = 0u;
  *(_OWORD *)&self->_stallscoreAtStudyEnd = 0u;
  *(_OWORD *)&self->_numRemoteDnsServers = 0u;
  *(_OWORD *)&self->_netscoreAtStudyStart = 0u;
  *(_OWORD *)&self->_totalDnsServers = 0u;
  *(_OWORD *)&self->_numIPv6DnsServers = 0u;
  *(_OWORD *)&self->_numDataStallScoreBelowThresholdBeforeTrap = 0u;
}

- (id)__ipv4SetupConfig
{
  __CFString *v3;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  void *v6;
  const void *v7;
  id v8;

  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CWFInterface networkServiceID](self->_corewifi, "networkServiceID"));
  if (v3
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainSetup, v3, kSCEntNetIPv4)) != 0)
  {
    v5 = NetworkServiceEntity;
    v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      v7 = v6;
      v8 = objc_msgSend(v6, "copy");
      CFRelease(v7);
    }
    else
    {
      v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)__IPv4StateConfig
{
  __CFString *v3;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  void *v6;
  const void *v7;
  id v8;

  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CWFInterface networkServiceID](self->_corewifi, "networkServiceID"));
  if (v3
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, v3, kSCEntNetIPv4)) != 0)
  {
    v5 = NetworkServiceEntity;
    v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      v7 = v6;
      v8 = objc_msgSend(v6, "copy");
      CFRelease(v7);
    }
    else
    {
      v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)__IPv6StateConfig
{
  __CFString *v3;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  void *v6;
  const void *v7;
  id v8;

  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CWFInterface networkServiceID](self->_corewifi, "networkServiceID"));
  if (v3
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, v3, kSCEntNetIPv6)) != 0)
  {
    v5 = NetworkServiceEntity;
    v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      v7 = v6;
      v8 = objc_msgSend(v6, "copy");
      CFRelease(v7);
    }
    else
    {
      v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)__dnsStateConfig
{
  __CFString *v3;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  void *v6;
  const void *v7;
  id v8;

  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CWFInterface networkServiceID](self->_corewifi, "networkServiceID"));
  if (v3
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, v3, kSCEntNetDNS)) != 0)
  {
    v5 = NetworkServiceEntity;
    v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      v7 = v6;
      v8 = objc_msgSend(v6, "copy");
      CFRelease(v7);
    }
    else
    {
      v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)__dnsSetupConfig
{
  __CFString *v3;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  void *v6;
  const void *v7;
  id v8;

  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CWFInterface networkServiceID](self->_corewifi, "networkServiceID"));
  if (v3
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainSetup, v3, kSCEntNetDNS)) != 0)
  {
    v5 = NetworkServiceEntity;
    v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      v7 = v6;
      v8 = objc_msgSend(v6, "copy");
      CFRelease(v7);
    }
    else
    {
      v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isUsingCustomDNSSettings
{
  OS_dispatch_queue *dnsStudyQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dnsStudyQueue = self->_dnsStudyQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006C9C8;
  v5[3] = &unk_1000CD878;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dnsStudyQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)fetchConfiguredDnsInfo
{
  void *v3;
  uint64_t v4;
  void *v5;
  OS_dispatch_queue *dnsStudyQueue;
  void *v7;
  char *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  __int32 v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  unsigned int v32;
  id v33;
  NSObject *v34;
  BOOL v35;
  int v36;
  id v37;
  NSObject *v38;
  BOOL v39;
  id v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  id v45;
  NSObject *v46;
  const char *v47;
  __int128 v49;
  char *v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  char v54;
  unint64_t v55;
  unint64_t v56;
  id obj;
  WAEngine *v58;
  int8x16_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD block[6];
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  _BYTE buf[48];
  __int16 v72;
  unint64_t v73;
  __int16 v74;
  unint64_t v75;
  __int16 v76;
  char *v77;
  uint8_t v78[4];
  const char *v79;
  __int16 v80;
  int v81;
  __int16 v82;
  __int32 v83;
  __int16 v84;
  __int32 v85;
  __int16 v86;
  __int32 v87;
  __int16 v88;
  __int32 v89;
  int8x16_t v90;
  _BYTE v91[128];
  uint64_t v92;
  uint64_t v93;

  v92 = 0;
  v93 = 0;
  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = sub_10004B174;
  v69 = sub_10004B184;
  v70 = 0;
  if (-[WAEngine isUsingCustomDNSSettings](self, "isUsingCustomDNSSettings"))
  {
    self->_dnsServerConfigType = 2;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine __dnsSetupConfig](self, "__dnsSetupConfig"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kSCPropNetDNSServerAddresses));
    v5 = (void *)v66[5];
    v66[5] = v4;

  }
  else
  {
    self->_dnsServerConfigType = 1;
  }
  dnsStudyQueue = self->_dnsStudyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D3AC;
  block[3] = &unk_1000CCF50;
  block[4] = self;
  block[5] = &v65;
  dispatch_sync((dispatch_queue_t)dnsStudyQueue, block);
  v7 = (void *)v66[5];
  if (v7)
    v8 = (char *)objc_msgSend(v7, "count");
  else
    v8 = 0;
  v53 = -[WAEngine getIPv4InterfaceSubnet](self, "getIPv4InterfaceSubnet");
  v52 = -[WAEngine getIPv4InterfaceNetwork:](self, "getIPv4InterfaceNetwork:", v53);
  v9 = -[WAEngine getIPv6InterfacePrefix](self, "getIPv6InterfacePrefix");
  -[WAEngine getIPv6InterfaceNetwork:prefixLength:](self, "getIPv6InterfaceNetwork:prefixLength:", &v92, v9);
  v51 = v9;
  v50 = v8;
  v58 = self;
  v10 = WALogCategoryDefaultHandle();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "-[WAEngine fetchConfiguredDnsInfo]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 5823;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v52;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DNS-config: interface IPv4 Network: %08x", buf, 0x18u);
  }

  v12 = WALogCategoryDefaultHandle();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447490;
    *(_QWORD *)&buf[4] = "-[WAEngine fetchConfiguredDnsInfo]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 5824;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v92;
    *(_WORD *)&buf[24] = 1024;
    *(_DWORD *)&buf[26] = HIDWORD(v92);
    *(_WORD *)&buf[30] = 1024;
    *(_DWORD *)&buf[32] = v93;
    *(_WORD *)&buf[36] = 1024;
    *(_DWORD *)&buf[38] = HIDWORD(v93);
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DNS-config: interface IPv6 Network: %08x %08x %08x %08x", buf, 0x2Au);
  }

  v14 = WALogCategoryDefaultHandle();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v66[5];
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "-[WAEngine fetchConfiguredDnsInfo]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 5825;
    *(_WORD *)&buf[18] = 2112;
    *(_QWORD *)&buf[20] = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DNS-config: dnsServers: %@", buf, 0x1Cu);
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = (id)v66[5];
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v91, 16);
  if (v17)
  {
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v19 = 0;
    v20 = 0;
    v21 = *(_QWORD *)v61;
    *(_QWORD *)&v18 = 136447490;
    v49 = v18;
    for (i = *(_QWORD *)v61; ; i = *(_QWORD *)v61)
    {
      if (i != v21)
        objc_enumerationMutation(obj);
      v23 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v20);
      if (-[WAEngine isIPv4Address:](v58, "isIPv4Address:", v23, v49))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "componentsSeparatedByString:", CFSTR(".")));
        *(_DWORD *)v78 = 0;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", 0));
        if (objc_msgSend(v25, "integerValue") == (id)127)
        {

          goto LABEL_20;
        }
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", 0));
        if (objc_msgSend(v29, "integerValue") == (id)169)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", 1));
          v31 = objc_msgSend(v30, "integerValue") == (id)254;

          if (!v31)
            goto LABEL_36;
LABEL_20:
          ++v19;
          v54 = 1;
        }
        else
        {

LABEL_36:
          if (inet_aton((const char *)objc_msgSend(objc_retainAutorelease(v23), "UTF8String"), (in_addr *)v78))
          {
            v32 = bswap32(*(unsigned int *)v78);
            v33 = WALogCategoryDefaultHandle();
            v34 = objc_claimAutoreleasedReturnValue(v33);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446722;
              *(_QWORD *)&buf[4] = "-[WAEngine fetchConfiguredDnsInfo]";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 5839;
              *(_WORD *)&buf[18] = 1024;
              *(_DWORD *)&buf[20] = v32;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DNS-config: IPv4 DNS address:%08x", buf, 0x18u);
            }

            v35 = v32 - 1 < 0xFFFFFFFE;
            v36 = v32 & v53;
            v37 = WALogCategoryDefaultHandle();
            v38 = objc_claimAutoreleasedReturnValue(v37);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446722;
              *(_QWORD *)&buf[4] = "-[WAEngine fetchConfiguredDnsInfo]";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 5846;
              *(_WORD *)&buf[18] = 1024;
              *(_DWORD *)&buf[20] = v36;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DNS-config: IPv4 DNS network:%08x", buf, 0x18u);
            }

            v54 |= v35;
            if (v36 == v52)
              ++v19;
          }
        }

        ++v55;
        goto LABEL_59;
      }
      v90 = 0uLL;
      v59 = 0uLL;
      memset(buf, 0, 47);
      if ((objc_msgSend(v23, "getCString:maxLength:encoding:", buf, 47, 4) & 1) == 0)
      {
        v27 = WALogCategoryDefaultHandle();
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v78 = 136446466;
          v79 = "-[WAEngine fetchConfiguredDnsInfo]";
          v80 = 1024;
          v81 = 5861;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}s::%d:DNS-config: encoding failed!", v78, 0x12u);
        }

        goto LABEL_58;
      }
      if (inet_pton(30, buf, &v59))
      {
        if (v59.u8[0] == 254 && (v59.u8[1] > 0xBFu || (v59.i8[1] & 0xC0) == 0x80)
          || (v26 = v59.i32[0] | v59.i32[1] | v59.i32[2]) == 0 && v59.i32[3] == 0x1000000)
        {
          ++v19;
        }
        else
        {
          if (v59.i32[3])
            v39 = 0;
          else
            v39 = v26 == 0;
          if (v39)
            goto LABEL_58;
          v90 = vrev32q_s8(v59);
          v40 = WALogCategoryDefaultHandle();
          v41 = objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v78 = v49;
            v79 = "-[WAEngine fetchConfiguredDnsInfo]";
            v80 = 1024;
            v81 = 5878;
            v82 = 1024;
            v83 = v90.i32[0];
            v84 = 1024;
            v85 = v90.i32[1];
            v86 = 1024;
            v87 = v90.i32[2];
            v88 = 1024;
            v89 = v90.i32[3];
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DNS-config: IPv6 DNS address:%08x %08x %08x %08x", v78, 0x2Au);
          }

          -[WAEngine convertToIPv6Network:prefixLength:](v58, "convertToIPv6Network:prefixLength:", &v90, v51);
          v42 = WALogCategoryDefaultHandle();
          v43 = objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v78 = v49;
            v79 = "-[WAEngine fetchConfiguredDnsInfo]";
            v80 = 1024;
            v81 = 5880;
            v82 = 1024;
            v83 = v90.i32[0];
            v84 = 1024;
            v85 = v90.i32[1];
            v86 = 1024;
            v87 = v90.i32[2];
            v88 = 1024;
            v89 = v90.i32[3];
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DNS-config: IPv6 DNS network:%08x %08x %08x %08x", v78, 0x2Au);
          }

          if (v90.i64[0] == v92 && v90.i64[1] == v93)
            ++v19;
        }
        v54 = 1;
      }
LABEL_58:
      ++v56;
LABEL_59:
      if (++v20 >= (unint64_t)v17)
      {
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v91, 16);
        if (!v17)
          goto LABEL_64;
        v20 = 0;
      }
    }
  }
  v54 = 0;
  v55 = 0;
  v56 = 0;
  v19 = 0;
LABEL_64:

  v58->_totalDnsServers = (unint64_t)v50;
  v58->_numIPv4DnsServers = v55;
  v58->_numIPv6DnsServers = v56;
  v58->_numLocalDnsServers = v19;
  v58->_numRemoteDnsServers = (unint64_t)&v50[-v19];
  v45 = WALogCategoryDefaultHandle();
  v46 = objc_claimAutoreleasedReturnValue(v45);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    v47 = "NO";
    *(_DWORD *)buf = 136448002;
    *(_QWORD *)&buf[4] = "-[WAEngine fetchConfiguredDnsInfo]";
    *(_WORD *)&buf[12] = 1024;
    if ((v54 & 1) != 0)
      v47 = "YES";
    *(_DWORD *)&buf[14] = 5897;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = v47;
    *(_WORD *)&buf[28] = 2048;
    *(_QWORD *)&buf[30] = v50;
    *(_WORD *)&buf[38] = 2048;
    *(_QWORD *)&buf[40] = v55;
    v72 = 2048;
    v73 = v56;
    v74 = 2048;
    v75 = v19;
    v76 = 2048;
    v77 = &v50[-v19];
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DNS-config: validDNSConfig:%s totalDnsServers:%lu numv4DnsServers:%lu numv6DnsServers:%lu numLocalDnsServers:%lu numRemoteDnsServers:%lu", buf, 0x4Eu);
  }

  _Block_object_dispose(&v65, 8);
  return v54 & 1;
}

- (unsigned)getIPv4InterfaceSubnet
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  id v8;
  in_addr v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  unsigned int v16;

  v10.s_addr = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine IPv4SubnetMasks](self, "IPv4SubnetMasks"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));
  v4 = v3;
  if (v3)
  {
    v10.s_addr = 0;
    if (inet_aton((const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"), &v10))
    {
      v5 = bswap32(v10.s_addr);
      v6 = WALogCategoryDefaultHandle();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v12 = "-[WAEngine getIPv4InterfaceSubnet]";
        v13 = 1024;
        v14 = 5910;
        v15 = 1024;
        v16 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DNS-config: interface IPv4 subnet: %08x", buf, 0x18u);
      }
    }
    else
    {
      v8 = WALogCategoryDefaultHandle();
      v7 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v12 = "-[WAEngine getIPv4InterfaceSubnet]";
        v13 = 1024;
        v14 = 5912;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:DNS-config: interface IPv4 subnet: invalid conversion logic", buf, 0x12u);
      }
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unsigned)getIPv4InterfaceNetwork:(unsigned int)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  id v10;
  in_addr v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  unsigned int v18;

  v12.s_addr = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface IPv4Addresses](self->_corewifi, "IPv4Addresses"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = v5;
  if (v5)
  {
    v12.s_addr = 0;
    if (inet_aton((const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), &v12))
    {
      v7 = bswap32(v12.s_addr);
      v8 = WALogCategoryDefaultHandle();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v14 = "-[WAEngine getIPv4InterfaceNetwork:]";
        v15 = 1024;
        v16 = 5927;
        v17 = 1024;
        v18 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DNS-config: interface IPv4 Address: %08x", buf, 0x18u);
      }
    }
    else
    {
      v10 = WALogCategoryDefaultHandle();
      v9 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v14 = "-[WAEngine getIPv4InterfaceNetwork:]";
        v15 = 1024;
        v16 = 5929;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:DNS-config: interface IPv4 Address: invalid conversion logic", buf, 0x12u);
      }
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7 & a3;
}

- (unsigned)getIPv6InterfacePrefix
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  unsigned int v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine IPv6PrefixLengths](self, "IPv6PrefixLengths"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "unsignedIntValue");
    v6 = WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136446722;
      v10 = "-[WAEngine getIPv6InterfacePrefix]";
      v11 = 1024;
      v12 = 5941;
      v13 = 1024;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DNS-config: interface IPv6 prefix length: %u", (uint8_t *)&v9, 0x18u);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)getIPv6InterfaceNetwork:(unsigned int *)a3 prefixLength:(unsigned int)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  id v20;
  id v21;
  NSObject *v22;
  int8x16_t v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  unsigned int v35;
  uint8_t v36[56];

  v4 = *(_QWORD *)&a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface IPv6Addresses](self->_corewifi, "IPv6Addresses", 0, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v9 = v8;
  if (v8)
  {
    *(_QWORD *)a3 = 0;
    *((_QWORD *)a3 + 1) = 0;
    v23 = 0uLL;
    memset(v36, 0, 47);
    if ((objc_msgSend(v8, "getCString:maxLength:encoding:", v36, 47, 4) & 1) != 0)
    {
      if (!inet_pton(30, (const char *)v36, &v23))
      {
LABEL_10:
        -[WAEngine convertToIPv6Network:prefixLength:](self, "convertToIPv6Network:prefixLength:", a3, v4);
        goto LABEL_11;
      }
      *(int8x16_t *)a3 = vrev32q_s8(v23);
      v10 = WALogCategoryDefaultHandle();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *a3;
        v13 = a3[1];
        v14 = a3[2];
        v15 = a3[3];
        *(_DWORD *)buf = 136447490;
        v25 = "-[WAEngine getIPv6InterfaceNetwork:prefixLength:]";
        v26 = 1024;
        v27 = 5964;
        v28 = 1024;
        v29 = v12;
        v30 = 1024;
        v31 = v13;
        v32 = 1024;
        v33 = v14;
        v34 = 1024;
        v35 = v15;
        v16 = "%{public}s::%d:DNS-config: interface IPv6 Address:%08x %08x %08x %08x";
        v17 = v11;
        v18 = OS_LOG_TYPE_DEFAULT;
        v19 = 42;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, buf, v19);
      }
    }
    else
    {
      v20 = WALogCategoryDefaultHandle();
      v11 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v25 = "-[WAEngine getIPv6InterfaceNetwork:prefixLength:]";
        v26 = 1024;
        v27 = 5959;
        v16 = "%{public}s::%d:DNS-config: encoding failed!";
        v17 = v11;
        v18 = OS_LOG_TYPE_ERROR;
        v19 = 18;
        goto LABEL_8;
      }
    }

    goto LABEL_10;
  }
  v21 = WALogCategoryDefaultHandle();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v36 = 136446466;
    *(_QWORD *)&v36[4] = "-[WAEngine getIPv6InterfaceNetwork:prefixLength:]";
    *(_WORD *)&v36[12] = 1024;
    *(_DWORD *)&v36[14] = 5952;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}s::%d:DNS-config: No IPv6 address found", v36, 0x12u);
  }

LABEL_11:
}

- (void)convertToIPv6Network:(unsigned int *)a3 prefixLength:(unsigned int)a4
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  BOOL v8;

  if (a4)
  {
    v4 = 3;
    do
    {
      if (a4 <= 0x1F)
      {
        v5 = a3[v4];
        if (v5)
        {
          v6 = a4;
          do
          {
            v7 = v5;
            v5 >>= 1;
            a4 = v6 - 1;
            if (v7 < 2)
              break;
            --v6;
          }
          while (v6);
        }
      }
      else
      {
        v5 = 0;
        a4 -= 32;
      }
      a3[v4] = v5;
      v8 = v4-- != 0;
    }
    while (v8 && a4);
  }
}

- (BOOL)isIPv4Address:(id)a3
{
  return objc_msgSend(a3, "rangeOfString:", CFSTR(".")) != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (id)IPv4SubnetMasks
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine __IPv4StateConfig](self, "__IPv4StateConfig"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", kSCPropNetIPv4SubnetMasks));

  return v3;
}

- (id)IPv6PrefixLengths
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WAEngine __IPv6StateConfig](self, "__IPv6StateConfig"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", kSCPropNetIPv6PrefixLength));

  return v3;
}

- (void)triggerPeerDiscovery
{
  id v2;
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;

  if (!-[WAEngine isWiFiAssociatedToNetwork](self, "isWiFiAssociatedToNetwork"))
  {
    v9 = WALogCategoryDefaultHandle();
    v4 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v12 = "-[WAEngine triggerPeerDiscovery]";
      v13 = 1024;
      v14 = 6005;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:WiFi disassocited during study so not continuing...", buf, 0x12u);
    }
    goto LABEL_6;
  }
  v2 = sub_10006620C();
  if (objc_opt_class(v2))
  {
    v3 = sub_1000432C4();
    if (objc_opt_class(v3))
    {
      v4 = objc_alloc_init((Class)sub_1000432C4());
      if (v4)
      {
        v5 = objc_msgSend(sub_10006620C(), "requestWithTestID:configuration:", 62, 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
        v10 = v6;
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

        v8 = -[NSObject runDiagnostics:configuration:update:reply:](v4, "runDiagnostics:configuration:update:reply:", v7, 0, 0, &stru_1000CD8B8);
      }
LABEL_6:

    }
  }
}

- (void)gatherDiscoveredPeerInfo:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  dispatch_time_t v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  double v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  unsigned int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  dispatch_semaphore_t v48;
  _QWORD v49[4];
  NSObject *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  NSObject *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  uint64_t v74;
  void *v75;

  v4 = a3;
  v48 = dispatch_semaphore_create(0);
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = sub_10004B174;
  v63 = sub_10004B184;
  v64 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = sub_10004B174;
  v57 = sub_10004B184;
  v58 = 0;
  if (!-[WAEngine isWiFiAssociatedToNetwork](self, "isWiFiAssociatedToNetwork"))
  {
    v47 = WALogCategoryDefaultHandle();
    v19 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v66 = "-[WAEngine gatherDiscoveredPeerInfo:]";
      v67 = 1024;
      v68 = 6033;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:WiFi disassocited during study so not continuing...", buf, 0x12u);
    }
    goto LABEL_36;
  }
  v5 = sub_10006620C();
  if (objc_opt_class(v5))
  {
    v6 = sub_1000432C4();
    if (objc_opt_class(v6))
    {
      v7 = objc_alloc_init((Class)sub_1000432C4());
      if (v7)
      {
        v8 = objc_msgSend(sub_10006620C(), "requestWithTestID:configuration:", 61, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        v75 = v9;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v75, 1));

        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = sub_10006E540;
        v49[3] = &unk_1000CD710;
        v51 = &v59;
        v52 = &v53;
        v11 = v48;
        v50 = v11;
        v12 = objc_msgSend(v7, "runDiagnostics:configuration:update:reply:", v10, 0, 0, v49);
        v13 = dispatch_time(0, 5000000000);
        dispatch_semaphore_wait(v11, v13);
        if (!v60[5])
        {
          v14 = WALogCategoryDefaultHandle();
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v16 = v54[5];
            *(_DWORD *)buf = 136446722;
            v66 = "-[WAEngine gatherDiscoveredPeerInfo:]";
            v67 = 1024;
            v68 = 6047;
            v69 = 2112;
            v70 = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:PeerDiscovery: Data collection failed with err:%@", buf, 0x1Cu);
          }

        }
      }

    }
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v60[5], "firstObject"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "info"));
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PeerDevicesInfo")));

  v20 = WALogCategoryDefaultHandle();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v66 = "-[WAEngine gatherDiscoveredPeerInfo:]";
    v67 = 1024;
    v68 = 6052;
    v69 = 2112;
    v70 = v19;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiscovery: parsed result:%@", buf, 0x1Cu);
  }

  if (v19)
  {
    v22 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject allKeys](v19, "allKeys"));
    if (objc_msgSend(v23, "containsObject:", CFSTR("Timestamp")))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject valueForKey:](v19, "valueForKey:", CFSTR("Timestamp")));

      if (v24)
      {
        -[NSObject timeIntervalSinceDate:](v22, "timeIntervalSinceDate:", v24);
        v26 = (int)(v25 / 60.0);
LABEL_19:
        v27 = WALogCategoryDefaultHandle();
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136447234;
          v66 = "-[WAEngine gatherDiscoveredPeerInfo:]";
          v67 = 1024;
          v68 = 6061;
          v69 = 2112;
          v70 = v22;
          v71 = 2112;
          v72 = v24;
          v73 = 2048;
          v74 = v26;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiscovery: current_time:%@ update_time:%@ minutesBetweenDates:%ld", buf, 0x30u);
        }

        v29 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
        v30 = v26 < (int)((unint64_t)objc_msgSend(v29, "dps_report_sent_after") / 0x3C);

        if (v30)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject allKeys](v19, "allKeys"));
          if (objc_msgSend(v31, "containsObject:", CFSTR("numberOfIOSDevices")))
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject valueForKey:](v19, "valueForKey:", CFSTR("numberOfIOSDevices")));
            v33 = objc_msgSend(v32, "unsignedIntValue");

          }
          else
          {
            v33 = 0;
          }

          v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject allKeys](v19, "allKeys"));
          if (objc_msgSend(v34, "containsObject:", CFSTR("numberOfMacOSDevices")))
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject valueForKey:](v19, "valueForKey:", CFSTR("numberOfMacOSDevices")));
            v36 = objc_msgSend(v35, "unsignedIntValue");

          }
          else
          {
            v36 = 0;
          }

          v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject allKeys](v19, "allKeys"));
          if (objc_msgSend(v37, "containsObject:", CFSTR("numberOfTVOSDevices")))
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject valueForKey:](v19, "valueForKey:", CFSTR("numberOfTVOSDevices")));
            v39 = objc_msgSend(v38, "unsignedIntValue");

          }
          else
          {
            v39 = 0;
          }

          v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject allKeys](v19, "allKeys"));
          if (objc_msgSend(v40, "containsObject:", CFSTR("numberOfWatchOSDevices")))
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject valueForKey:](v19, "valueForKey:", CFSTR("numberOfTVOSDevices")));
            v42 = objc_msgSend(v41, "unsignedIntValue");

          }
          else
          {
            v42 = 0;
          }

          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fieldForKey:", CFSTR("WFAAWDWAPDI_numPeersDiscovered")));
          objc_msgSend(v43, "setUint32Value:", (_DWORD)v36 + (_DWORD)v33 + v39 + v42);

          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fieldForKey:", CFSTR("WFAAWDWAPDI_iOSPeers")));
          objc_msgSend(v44, "setUint32Value:", v33);

          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fieldForKey:", CFSTR("WFAAWDWAPDI_tvOSPeers")));
          objc_msgSend(v45, "setUint32Value:", v39);

          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fieldForKey:", CFSTR("WFAAWDWAPDI_macOSPeers")));
          objc_msgSend(v46, "setUint32Value:", v36);

        }
LABEL_36:

        goto LABEL_37;
      }
    }
    else
    {

      v24 = 0;
    }
    v26 = 0x7FFFFFFFLL;
    goto LABEL_19;
  }
LABEL_37:
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
}

- (void)resolveAppleCaptiveServer
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id location;
  void *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;

  objc_initWeak(&location, self);
  if (!-[WAEngine isWiFiInterfacePrimary](self, "isWiFiInterfacePrimary"))
  {
    v12 = WALogCategoryDefaultHandle();
    v5 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v18 = "-[WAEngine resolveAppleCaptiveServer]";
      v19 = 1024;
      v20 = 6084;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:WiFi interface not primary...aborting DNS resolution", buf, 0x12u);
    }
    goto LABEL_8;
  }
  v3 = sub_10006620C();
  if (objc_opt_class(v3))
  {
    v4 = sub_1000432C4();
    if (objc_opt_class(v4))
    {
      v5 = objc_alloc_init((Class)sub_1000432C4());
      if (v5)
      {
        v6 = objc_msgSend(sub_10006620C(), "requestWithTestID:configuration:", 7, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
        v16 = v7;
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));

        v9 = WALogCategoryDefaultHandle();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v18 = "-[WAEngine resolveAppleCaptiveServer]";
          v19 = 1024;
          v20 = 6091;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DNSResolution: enqueuing", buf, 0x12u);
        }

        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10006E8D0;
        v13[3] = &unk_1000CD8E0;
        objc_copyWeak(&v14, &location);
        v11 = -[NSObject runDiagnostics:configuration:update:reply:](v5, "runDiagnostics:configuration:update:reply:", v8, 0, 0, v13);
        objc_destroyWeak(&v14);

      }
LABEL_8:

    }
  }
  objc_destroyWeak(&location);
}

- (void)initializeProbeCxt
{
  id v3;
  NSObject *v4;
  NSString *appleCaptiveServerIP;
  NSMutableDictionary *v6;
  NSMutableDictionary *probeContextBE;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *probeContextBK;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *probeContextVI;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableDictionary *v24;
  NSMutableDictionary *probeContextVO;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  NSString *v35;

  v3 = WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    appleCaptiveServerIP = self->_appleCaptiveServerIP;
    v30 = 136446722;
    v31 = "-[WAEngine initializeProbeCxt]";
    v32 = 1024;
    v33 = 6119;
    v34 = 2112;
    v35 = appleCaptiveServerIP;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:initializing ProbeCxt self->_appleCaptiveServerIP:%@", (uint8_t *)&v30, 0x1Cu);
  }

  if (!self->_probeContextBE)
  {
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    probeContextBE = self->_probeContextBE;
    self->_probeContextBE = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_probeContextBE, "setObject:forKeyedSubscript:", v8, CFSTR("PingCount"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1300));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_probeContextBE, "setObject:forKeyedSubscript:", v9, CFSTR("PingDataLength"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_probeContextBE, "setObject:forKeyedSubscript:", v10, CFSTR("PingTimeout"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_probeContextBE, "setObject:forKeyedSubscript:", v11, CFSTR("PingTrafficClass"));

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_probeContextBE, "setObject:forKeyedSubscript:", self->_appleCaptiveServerIP, CFSTR("IPAddress"));
  }
  if (!self->_probeContextBK)
  {
    v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    probeContextBK = self->_probeContextBK;
    self->_probeContextBK = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_probeContextBK, "setObject:forKeyedSubscript:", v14, CFSTR("PingCount"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1300));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_probeContextBK, "setObject:forKeyedSubscript:", v15, CFSTR("PingDataLength"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_probeContextBK, "setObject:forKeyedSubscript:", v16, CFSTR("PingTimeout"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 200));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_probeContextBK, "setObject:forKeyedSubscript:", v17, CFSTR("PingTrafficClass"));

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_probeContextBK, "setObject:forKeyedSubscript:", self->_appleCaptiveServerIP, CFSTR("IPAddress"));
  }
  if (!self->_probeContextVI)
  {
    v18 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    probeContextVI = self->_probeContextVI;
    self->_probeContextVI = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_probeContextVI, "setObject:forKeyedSubscript:", v20, CFSTR("PingCount"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1300));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_probeContextVI, "setObject:forKeyedSubscript:", v21, CFSTR("PingDataLength"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_probeContextVI, "setObject:forKeyedSubscript:", v22, CFSTR("PingTimeout"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 700));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_probeContextVI, "setObject:forKeyedSubscript:", v23, CFSTR("PingTrafficClass"));

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_probeContextVI, "setObject:forKeyedSubscript:", self->_appleCaptiveServerIP, CFSTR("IPAddress"));
  }
  if (!self->_probeContextVO)
  {
    v24 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    probeContextVO = self->_probeContextVO;
    self->_probeContextVO = v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_probeContextVO, "setObject:forKeyedSubscript:", v26, CFSTR("PingCount"));

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1300));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_probeContextVO, "setObject:forKeyedSubscript:", v27, CFSTR("PingDataLength"));

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_probeContextVO, "setObject:forKeyedSubscript:", v28, CFSTR("PingTimeout"));

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 800));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_probeContextVO, "setObject:forKeyedSubscript:", v29, CFSTR("PingTrafficClass"));

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_probeContextVO, "setObject:forKeyedSubscript:", self->_appleCaptiveServerIP, CFSTR("IPAddress"));
  }
}

- (void)triggerDiagnosticPingWithrequestId:(unsigned int)a3
{
  id v5;
  id v6;
  NSObject *v7;
  OS_dispatch_queue *dnsStudyQueue;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  NSObject *v30;
  NSString *appleCaptiveServerIP;
  void *v32;
  _BOOL4 v33;
  uint64_t v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  unsigned int v39;
  _QWORD block[9];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  id location;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  int v63;
  __int16 v64;
  unsigned int v65;
  __int16 v66;
  NSString *v67;
  _QWORD v68[4];
  _QWORD v69[4];
  _BYTE v70[24];
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;

  objc_initWeak(&location, self);
  if (!-[WAEngine isWiFiInterfacePrimary](self, "isWiFiInterfacePrimary"))
  {
    v36 = WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v70 = 136446722;
      *(_QWORD *)&v70[4] = "-[WAEngine triggerDiagnosticPingWithrequestId:]";
      *(_WORD *)&v70[12] = 1024;
      *(_DWORD *)&v70[14] = 6156;
      *(_WORD *)&v70[18] = 1024;
      *(_DWORD *)&v70[20] = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:WiFi interface not primary...aborting ping instance:%d", v70, 0x18u);
    }
    goto LABEL_20;
  }
  v5 = sub_10006620C();
  if (objc_opt_class(v5))
  {
    v6 = sub_1000432C4();
    if (objc_opt_class(v6))
    {
      v7 = objc_alloc_init((Class)sub_1000432C4());
      *(_QWORD *)v70 = 0;
      *(_QWORD *)&v70[8] = v70;
      *(_QWORD *)&v70[16] = 0x3032000000;
      v71 = sub_10004B174;
      v72 = sub_10004B184;
      v73 = 0;
      v53 = 0;
      v54 = &v53;
      v55 = 0x3032000000;
      v56 = sub_10004B174;
      v57 = sub_10004B184;
      v58 = 0;
      v47 = 0;
      v48 = &v47;
      v49 = 0x3032000000;
      v50 = sub_10004B174;
      v51 = sub_10004B184;
      v52 = 0;
      v41 = 0;
      v42 = &v41;
      v43 = 0x3032000000;
      v44 = sub_10004B174;
      v45 = sub_10004B184;
      v46 = 0;
      dnsStudyQueue = self->_dnsStudyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10006F5D8;
      block[3] = &unk_1000CD908;
      block[4] = self;
      block[5] = v70;
      block[6] = &v53;
      block[7] = &v47;
      block[8] = &v41;
      dispatch_sync((dispatch_queue_t)dnsStudyQueue, block);
      if (!v7)
      {
LABEL_19:
        _Block_object_dispose(&v41, 8);

        _Block_object_dispose(&v47, 8);
        _Block_object_dispose(&v53, 8);

        _Block_object_dispose(v70, 8);
LABEL_20:

        goto LABEL_21;
      }
      v9 = objc_msgSend(sub_10006620C(), "requestWithTestID:configuration:", 3, *(_QWORD *)(*(_QWORD *)&v70[8] + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v69[0] = v10;
      v11 = objc_msgSend(sub_10006620C(), "requestWithTestID:configuration:", 3, v54[5]);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v69[1] = v12;
      v13 = objc_msgSend(sub_10006620C(), "requestWithTestID:configuration:", 3, v42[5]);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v69[2] = v14;
      v15 = objc_msgSend(sub_10006620C(), "requestWithTestID:configuration:", 3, v48[5]);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v69[3] = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v69, 4));

      v18 = objc_msgSend(sub_10006620C(), "requestWithTestID:configuration:", 6, *(_QWORD *)(*(_QWORD *)&v70[8] + 40));
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v68[0] = v19;
      v20 = objc_msgSend(sub_10006620C(), "requestWithTestID:configuration:", 6, v54[5]);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v68[1] = v21;
      v22 = objc_msgSend(sub_10006620C(), "requestWithTestID:configuration:", 6, v42[5]);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v68[2] = v23;
      v24 = objc_msgSend(sub_10006620C(), "requestWithTestID:configuration:", 6, v48[5]);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v68[3] = v25;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v68, 4));

      if (self->_appleCaptiveServerIP)
        v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v26));
      else
        v27 = v17;
      v28 = v27;
      if (!a3)
        self->_isCaptiveServerIPResolved = self->_appleCaptiveServerIP != 0;
      v29 = WALogCategoryDefaultHandle();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        appleCaptiveServerIP = self->_appleCaptiveServerIP;
        *(_DWORD *)buf = 136446978;
        v61 = "-[WAEngine triggerDiagnosticPingWithrequestId:]";
        v62 = 1024;
        v63 = 6184;
        v64 = 1024;
        v65 = a3;
        v66 = 2112;
        v67 = appleCaptiveServerIP;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Ping: instanceId:%u equeueing...  CaptiveServerIP:%@", buf, 0x22u);
      }

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
      v33 = (unint64_t)objc_msgSend(v32, "dns_symptoms_trap_evaluated_at_sample") > a3;

      if (v33)
      {
        self->_totalLANPingsBeforeTrap += 4;
        if (self->_appleCaptiveServerIP)
        {
          v34 = 264;
LABEL_17:
          *(Class *)((char *)&self->super.isa + v34) = (Class)(*(char **)((char *)&self->super.isa + v34) + 4);
        }
      }
      else
      {
        self->_totalLANPingsAfterTrap += 4;
        if (self->_appleCaptiveServerIP)
        {
          v34 = 296;
          goto LABEL_17;
        }
      }
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10006F6AC;
      v37[3] = &unk_1000CD958;
      objc_copyWeak(&v38, &location);
      v39 = a3;
      v35 = -[NSObject runDiagnostics:configuration:update:reply:](v7, "runDiagnostics:configuration:update:reply:", v28, 0, 0, v37);
      objc_destroyWeak(&v38);

      goto LABEL_19;
    }
  }
LABEL_21:
  objc_destroyWeak(&location);
}

- (void)fetchSymptomsScores:(unsigned int)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  unsigned int v12;
  id location;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  unsigned int v19;

  v5 = WALogCategoryDefaultHandle();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (&_managed_event_fetch)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v15 = "-[WAEngine fetchSymptomsScores:]";
      v16 = 1024;
      v17 = 6252;
      v18 = 1024;
      v19 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Netscore: instanceId:%u enqueuing...", buf, 0x18u);
    }

    objc_initWeak(&location, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10006FEF0;
    v10[3] = &unk_1000CD9A8;
    objc_copyWeak(&v11, &location);
    v12 = a3;
    if ((managed_event_fetch(1, v10) & 1) == 0)
    {
      v8 = WALogCategoryDefaultHandle();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v15 = "-[WAEngine fetchSymptomsScores:]";
        v16 = 1024;
        v17 = 6298;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:managed_event_fetch failed", buf, 0x12u);
      }

    }
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v15 = "-[WAEngine fetchSymptomsScores:]";
      v16 = 1024;
      v17 = 6248;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:managed_event_fetch not available", buf, 0x12u);
    }

  }
}

- (BOOL)isScoreBelowThreshold:(id)a3 type:(unint64_t)a4 instanceId:(unsigned int)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  void *v17;
  char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  unsigned int v24;
  void *v25;
  id v26;
  NSObject *v27;
  const char *v28;
  int v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  unsigned int v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  unsigned int v39;
  __int16 v40;
  unsigned int v41;
  __int16 v42;
  unsigned int v43;
  __int16 v44;
  const char *v45;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AWD-info")));
  v10 = v9;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dns-total")));
    v12 = objc_msgSend(v11, "intValue");

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("dns-impacted")));
    v14 = objc_msgSend(v13, "intValue");

    if (a4)
      goto LABEL_3;
  }
  else
  {
    v14 = 0;
    v12 = 0;
    if (a4)
    {
LABEL_3:
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("data-stalls-score")));
      v16 = objc_msgSend(v15, "intValue");

      if (a5)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
        v18 = (char *)objc_msgSend(v17, "dns_symptoms_interrogation_sample_count") - 1;

        if (v18 != (char *)a5)
        {
LABEL_17:
          v24 = v12;
LABEL_18:
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[RecommendationEngine preferences](self->_recommendationEngine, "preferences"));
          v23 = (int)v16 <= (int)objc_msgSend(v25, "reset_score_threshold");

          v12 = v24;
          goto LABEL_19;
        }
        v19 = 424;
      }
      else
      {
        v19 = 400;
      }
      *(Class *)((char *)&self->super.isa + v19) = (Class)v16;
      goto LABEL_17;
    }
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("net-score")));
  v16 = objc_msgSend(v20, "intValue");

  v21 = 416;
  if (!a5)
    v21 = 392;
  v22 = 432;
  if (!a5)
    v22 = 408;
  *(Class *)((char *)&self->super.isa + v21) = (Class)v16;
  *(Class *)((char *)&self->super.isa + v22) = (Class)v14;
  if (v12)
  {
    v23 = 0;
    if (v14)
    {
      v24 = v14;
      if (v12 == v14)
        goto LABEL_18;
    }
  }
  else
  {
    v23 = 1;
  }
LABEL_19:
  v26 = WALogCategoryDefaultHandle();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = "NO";
    v30 = 136448002;
    v31 = "-[WAEngine isScoreBelowThreshold:type:instanceId:]";
    v33 = 6337;
    v32 = 1024;
    if (v23)
      v28 = "YES";
    v34 = 1024;
    v35 = a5;
    v36 = 2048;
    v37 = a4;
    v38 = 1024;
    v39 = v16;
    v40 = 1024;
    v41 = v12;
    v42 = 1024;
    v43 = v14;
    v44 = 2080;
    v45 = v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:InstanceId:%u scoreType:%lu score:%d totalServers:%d impactedDnsServers:%d isBelowThreshold-result:%s", (uint8_t *)&v30, 0x3Eu);
  }

  return v23;
}

- (BOOL)isWiFiAssociatedToNetwork
{
  void *v2;
  id v3;
  NSObject *v4;
  const char *v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface networkName](self->_corewifi, "networkName"));
  v3 = WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "Not Associated";
    v8 = "-[WAEngine isWiFiAssociatedToNetwork]";
    v7 = 136446722;
    if (v2)
      v5 = "Associated";
    v9 = 1024;
    v10 = 6353;
    v11 = 2080;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:isWiFiAssociatedToNetwork result: %s", (uint8_t *)&v7, 0x1Cu);
  }

  return v2 != 0;
}

- (void)computeAverageCcaSinceStudyStart:(id)a3
{
  void *v3;
  void *v4;
  char *v5;
  char *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  id v22;
  NSObject *v23;
  double v24;
  id v25;
  NSObject *v26;
  char *i;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  _BYTE v35[10];
  _BYTE v36[10];

  v29 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "fieldForKey:", CFSTR("DPSR_dpsCounterSamples")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "repeatableValues"));
  v5 = (char *)objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    v7 = 0.0;
    for (i = v5; i != v6; v5 = i)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "fieldForKey:", CFSTR("DPSR_dpsCounterSamples")));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "repeatableValues"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v6));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fieldForKey:", CFSTR("DPSCS_peerStats")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subMessageValue"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fieldForKey:", CFSTR("NWAPS_obssCCA")));
      v14 = objc_msgSend(v13, "uint32Value");

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "fieldForKey:", CFSTR("DPSR_dpsCounterSamples")));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "repeatableValues"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndex:", v6));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fieldForKey:", CFSTR("DPSCS_peerStats")));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "subMessageValue"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "fieldForKey:", CFSTR("NWAPS_interferenceCCA")));
      v21 = objc_msgSend(v20, "uint32Value");

      v22 = WALogCategoryDefaultHandle();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136447234;
        v31 = "-[WAEngine computeAverageCcaSinceStudyStart:]";
        v32 = 1024;
        v33 = 6369;
        v34 = 2048;
        *(_QWORD *)v35 = v6;
        *(_WORD *)&v35[8] = 1024;
        *(_DWORD *)v36 = v14;
        *(_WORD *)&v36[4] = 1024;
        *(_DWORD *)&v36[6] = v21;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AvgCCAComputation: instance:%lu obssCCA:%d interferenceCCA:%d", buf, 0x28u);
      }
      v7 = v7 + (double)(v21 + v14);

      ++v6;
    }
  }
  else
  {
    v7 = 0.0;
  }
  v24 = v7 / (double)(unint64_t)v5;
  v25 = WALogCategoryDefaultHandle();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447234;
    v31 = "-[WAEngine computeAverageCcaSinceStudyStart:]";
    v32 = 1024;
    v33 = 6372;
    v34 = 1024;
    *(_DWORD *)v35 = (int)v24;
    *(_WORD *)&v35[4] = 1024;
    *(_DWORD *)&v35[6] = (int)v7;
    *(_WORD *)v36 = 2048;
    *(_QWORD *)&v36[2] = v5;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AvgCCAComputation: result:%d sumCCA:%d count:%lu", buf, 0x28u);
  }

  self->_cumulativeAverageCcaSinceStudyStart = v24;
}

- (BOOL)isWiFiInterfacePrimary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  id v9;
  NSObject *v10;
  const char *v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface globalIPv4InterfaceName](self->_corewifi, "globalIPv4InterfaceName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface globalIPv4NetworkServiceID](self->_corewifi, "globalIPv4NetworkServiceID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface globalIPv4InterfaceName](self->_corewifi, "globalIPv4InterfaceName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface globalIPv6NetworkServiceID](self->_corewifi, "globalIPv6NetworkServiceID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface networkServiceID](self->_corewifi, "networkServiceID"));
  v8 = (objc_msgSend(v7, "isEqualToString:", v4) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", v6);
  v9 = WALogCategoryDefaultHandle();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v14 = "-[WAEngine isWiFiInterfacePrimary]";
    v15 = 1024;
    v11 = "NO";
    v16 = 6391;
    v17 = 2080;
    v13 = 136447234;
    if (v8)
      v11 = "YES";
    v18 = v11;
    v19 = 2112;
    v20 = v3;
    v21 = 2112;
    v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:isWiFiInterfacePrimary result:%s IPv4interface:%@ IPv6Interface:%@ ", (uint8_t *)&v13, 0x30u);
  }

  return v8;
}

- (BOOL)isWiFiNetworkCaptive
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface currentKnownNetworkProfile](self->_corewifi, "currentKnownNetworkProfile"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isCaptive");
  else
    v4 = 0;

  return v4;
}

- (NSMutableDictionary)submitterMap
{
  return self->_submitterMap;
}

- (void)setSubmitterMap:(id)a3
{
  objc_storeStrong((id *)&self->_submitterMap, a3);
}

- (NSMutableDictionary)processTokenToGroupTypeMap
{
  return self->_processTokenToGroupTypeMap;
}

- (void)setProcessTokenToGroupTypeMap:(id)a3
{
  objc_storeStrong((id *)&self->_processTokenToGroupTypeMap, a3);
}

- (OS_dispatch_queue)engineQ
{
  return self->_engineQ;
}

- (void)setEngineQ:(id)a3
{
  objc_storeStrong((id *)&self->_engineQ, a3);
}

- (WAMessageAWDStore)messageStore
{
  return self->_messageStore;
}

- (void)setMessageStore:(id)a3
{
  objc_storeStrong((id *)&self->_messageStore, a3);
}

- (WAIOReporterMessagePopulator)iorMessagePopulator
{
  return self->_iorMessagePopulator;
}

- (void)setIorMessagePopulator:(id)a3
{
  objc_storeStrong((id *)&self->_iorMessagePopulator, a3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (NSMutableDictionary)processTokenToXPCConnectionMap
{
  return self->_processTokenToXPCConnectionMap;
}

- (void)setProcessTokenToXPCConnectionMap:(id)a3
{
  objc_storeStrong((id *)&self->_processTokenToXPCConnectionMap, a3);
}

- (NSMutableArray)pendingUntokenedConnections
{
  return self->_pendingUntokenedConnections;
}

- (void)setPendingUntokenedConnections:(id)a3
{
  objc_storeStrong((id *)&self->_pendingUntokenedConnections, a3);
}

- (NSMutableDictionary)cachedModelObjectsKeyToMessageMap
{
  return self->_cachedModelObjectsKeyToMessageMap;
}

- (void)setCachedModelObjectsKeyToMessageMap:(id)a3
{
  objc_storeStrong((id *)&self->_cachedModelObjectsKeyToMessageMap, a3);
}

- (NSMutableDictionary)interfaceNameToApple80211InstanceMap
{
  return self->_interfaceNameToApple80211InstanceMap;
}

- (void)setInterfaceNameToApple80211InstanceMap:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceNameToApple80211InstanceMap, a3);
}

- (NSString)infraInterfaceName
{
  return self->_infraInterfaceName;
}

- (void)setInfraInterfaceName:(id)a3
{
  objc_storeStrong((id *)&self->_infraInterfaceName, a3);
}

- (CADataTransformEngine)transformEngine
{
  return self->_transformEngine;
}

- (void)setTransformEngine:(id)a3
{
  objc_storeStrong((id *)&self->_transformEngine, a3);
}

- (NSMutableDictionary)studyTimeStamps
{
  return self->_studyTimeStamps;
}

- (void)setStudyTimeStamps:(id)a3
{
  objc_storeStrong((id *)&self->_studyTimeStamps, a3);
}

- (RecommendationEngine)recommendationEngine
{
  return self->_recommendationEngine;
}

- (void)setRecommendationEngine:(id)a3
{
  objc_storeStrong((id *)&self->_recommendationEngine, a3);
}

- (BOOL)dpsStudyInProgress
{
  return self->_dpsStudyInProgress;
}

- (void)setDpsStudyInProgress:(BOOL)a3
{
  self->_dpsStudyInProgress = a3;
}

- (BOOL)dpsCurrentlyGatheringConsecutiveSamples
{
  return self->_dpsCurrentlyGatheringConsecutiveSamples;
}

- (void)setDpsCurrentlyGatheringConsecutiveSamples:(BOOL)a3
{
  self->_dpsCurrentlyGatheringConsecutiveSamples = a3;
}

- (BOOL)slowWiFiStudyInProgress
{
  return self->_slowWiFiStudyInProgress;
}

- (void)setSlowWiFiStudyInProgress:(BOOL)a3
{
  self->_slowWiFiStudyInProgress = a3;
}

- (BOOL)isNWActivityInProgress
{
  return self->_isNWActivityInProgress;
}

- (void)setIsNWActivityInProgress:(BOOL)a3
{
  self->_isNWActivityInProgress = a3;
}

- (DPSQuickRecoveryRecommendationEngine)dpsQuickRecoveryEngine
{
  return self->_dpsQuickRecoveryEngine;
}

- (void)setDpsQuickRecoveryEngine:(id)a3
{
  objc_storeStrong((id *)&self->_dpsQuickRecoveryEngine, a3);
}

- (NSString)wifiChipSet
{
  return self->_wifiChipSet;
}

- (void)setWifiChipSet:(id)a3
{
  objc_storeStrong((id *)&self->_wifiChipSet, a3);
}

- (unint64_t)dpsNotificationTimeInSeconds
{
  return self->_dpsNotificationTimeInSeconds;
}

- (void)setDpsNotificationTimeInSeconds:(unint64_t)a3
{
  self->_dpsNotificationTimeInSeconds = a3;
}

- (unint64_t)dpsNotificationCCA
{
  return self->_dpsNotificationCCA;
}

- (void)setDpsNotificationCCA:(unint64_t)a3
{
  self->_dpsNotificationCCA = a3;
}

- (BOOL)isInternalInstall
{
  return self->_isInternalInstall;
}

- (void)setIsInternalInstall:(BOOL)a3
{
  self->_isInternalInstall = a3;
}

- (BOOL)isMemoryPressureRequestDeferred
{
  return self->_isMemoryPressureRequestDeferred;
}

- (void)setIsMemoryPressureRequestDeferred:(BOOL)a3
{
  self->_isMemoryPressureRequestDeferred = a3;
}

- (OS_os_transaction)dpsStudyTransaction
{
  return self->_dpsStudyTransaction;
}

- (void)setDpsStudyTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_dpsStudyTransaction, a3);
}

- (OS_os_transaction)dnsStudyTransaction
{
  return self->_dnsStudyTransaction;
}

- (void)setDnsStudyTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_dnsStudyTransaction, a3);
}

- (OS_os_transaction)slowwifiStudyTransaction
{
  return self->_slowwifiStudyTransaction;
}

- (void)setSlowwifiStudyTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_slowwifiStudyTransaction, a3);
}

- (BOOL)dpsNotificationDuringDnsStudy
{
  return self->_dpsNotificationDuringDnsStudy;
}

- (void)setDpsNotificationDuringDnsStudy:(BOOL)a3
{
  self->_dpsNotificationDuringDnsStudy = a3;
}

- (BOOL)slowWiFiNotificationDuringDnsStudy
{
  return self->_slowWiFiNotificationDuringDnsStudy;
}

- (void)setSlowWiFiNotificationDuringDnsStudy:(BOOL)a3
{
  self->_slowWiFiNotificationDuringDnsStudy = a3;
}

- (BOOL)isPingEnqueueFailing
{
  return self->_isPingEnqueueFailing;
}

- (void)setIsPingEnqueueFailing:(BOOL)a3
{
  self->_isPingEnqueueFailing = a3;
}

- (BOOL)isCriticalAppInUse
{
  return self->_isCriticalAppInUse;
}

- (void)setIsCriticalAppInUse:(BOOL)a3
{
  self->_isCriticalAppInUse = a3;
}

- (BOOL)dnsStudyInProgress
{
  return self->_dnsStudyInProgress;
}

- (void)setDnsStudyInProgress:(BOOL)a3
{
  self->_dnsStudyInProgress = a3;
}

- (BOOL)isCaptiveServerIPResolved
{
  return self->_isCaptiveServerIPResolved;
}

- (void)setIsCaptiveServerIPResolved:(BOOL)a3
{
  self->_isCaptiveServerIPResolved = a3;
}

- (BOOL)isPoorSymptomsDnsConditions
{
  return self->_isPoorSymptomsDnsConditions;
}

- (void)setIsPoorSymptomsDnsConditions:(BOOL)a3
{
  self->_isPoorSymptomsDnsConditions = a3;
}

- (BOOL)didSymptomsConditionRecoverAfterDecision
{
  return self->_didSymptomsConditionRecoverAfterDecision;
}

- (void)setDidSymptomsConditionRecoverAfterDecision:(BOOL)a3
{
  self->_didSymptomsConditionRecoverAfterDecision = a3;
}

- (BOOL)isGatewayReachable
{
  return self->_isGatewayReachable;
}

- (void)setIsGatewayReachable:(BOOL)a3
{
  self->_isGatewayReachable = a3;
}

- (BOOL)isAWDLActivitySuspected
{
  return self->_isAWDLActivitySuspected;
}

- (void)setIsAWDLActivitySuspected:(BOOL)a3
{
  self->_isAWDLActivitySuspected = a3;
}

- (BOOL)isAssociatedSinceStudyStart
{
  return self->_isAssociatedSinceStudyStart;
}

- (void)setIsAssociatedSinceStudyStart:(BOOL)a3
{
  self->_isAssociatedSinceStudyStart = a3;
}

- (BOOL)isAssociatedStateKnown
{
  return self->_isAssociatedStateKnown;
}

- (void)setIsAssociatedStateKnown:(BOOL)a3
{
  self->_isAssociatedStateKnown = a3;
}

- (void)setIsAssociated:(BOOL)a3
{
  self->_isAssociated = a3;
}

- (BOOL)forceStudyErrorFromMsg
{
  return self->_forceStudyErrorFromMsg;
}

- (void)setForceStudyErrorFromMsg:(BOOL)a3
{
  self->_forceStudyErrorFromMsg = a3;
}

- (unint64_t)cumulativeAverageCcaSinceStudyStart
{
  return self->_cumulativeAverageCcaSinceStudyStart;
}

- (void)setCumulativeAverageCcaSinceStudyStart:(unint64_t)a3
{
  self->_cumulativeAverageCcaSinceStudyStart = a3;
}

- (unint64_t)totalLANPingsBeforeTrap
{
  return self->_totalLANPingsBeforeTrap;
}

- (void)setTotalLANPingsBeforeTrap:(unint64_t)a3
{
  self->_totalLANPingsBeforeTrap = a3;
}

- (unint64_t)totalLANPingSuccessBeforeTrap
{
  return self->_totalLANPingSuccessBeforeTrap;
}

- (void)setTotalLANPingSuccessBeforeTrap:(unint64_t)a3
{
  self->_totalLANPingSuccessBeforeTrap = a3;
}

- (unint64_t)totalWANPingsBeforeTrap
{
  return self->_totalWANPingsBeforeTrap;
}

- (void)setTotalWANPingsBeforeTrap:(unint64_t)a3
{
  self->_totalWANPingsBeforeTrap = a3;
}

- (unint64_t)totalWANPingSuccessBeforeTrap
{
  return self->_totalWANPingSuccessBeforeTrap;
}

- (void)setTotalWANPingSuccessBeforeTrap:(unint64_t)a3
{
  self->_totalWANPingSuccessBeforeTrap = a3;
}

- (unint64_t)totalLANPingsAfterTrap
{
  return self->_totalLANPingsAfterTrap;
}

- (void)setTotalLANPingsAfterTrap:(unint64_t)a3
{
  self->_totalLANPingsAfterTrap = a3;
}

- (unint64_t)totalLANPingSuccessAfterTrap
{
  return self->_totalLANPingSuccessAfterTrap;
}

- (void)setTotalLANPingSuccessAfterTrap:(unint64_t)a3
{
  self->_totalLANPingSuccessAfterTrap = a3;
}

- (unint64_t)totalWANPingsAfterTrap
{
  return self->_totalWANPingsAfterTrap;
}

- (void)setTotalWANPingsAfterTrap:(unint64_t)a3
{
  self->_totalWANPingsAfterTrap = a3;
}

- (unint64_t)totalWANPingSuccessAfterTrap
{
  return self->_totalWANPingSuccessAfterTrap;
}

- (void)setTotalWANPingSuccessAfterTrap:(unint64_t)a3
{
  self->_totalWANPingSuccessAfterTrap = a3;
}

- (unint64_t)numNetScoreBelowThresholdBeforeTrap
{
  return self->_numNetScoreBelowThresholdBeforeTrap;
}

- (void)setNumNetScoreBelowThresholdBeforeTrap:(unint64_t)a3
{
  self->_numNetScoreBelowThresholdBeforeTrap = a3;
}

- (unint64_t)numNetScoreBelowThresholdAfterTrap
{
  return self->_numNetScoreBelowThresholdAfterTrap;
}

- (void)setNumNetScoreBelowThresholdAfterTrap:(unint64_t)a3
{
  self->_numNetScoreBelowThresholdAfterTrap = a3;
}

- (unint64_t)numDataStallScoreBelowThresholdBeforeTrap
{
  return self->_numDataStallScoreBelowThresholdBeforeTrap;
}

- (void)setNumDataStallScoreBelowThresholdBeforeTrap:(unint64_t)a3
{
  self->_numDataStallScoreBelowThresholdBeforeTrap = a3;
}

- (unint64_t)numDataStallScoreBelowThresholdAfterTrap
{
  return self->_numDataStallScoreBelowThresholdAfterTrap;
}

- (void)setNumDataStallScoreBelowThresholdAfterTrap:(unint64_t)a3
{
  self->_numDataStallScoreBelowThresholdAfterTrap = a3;
}

- (unint64_t)totalDnsServers
{
  return self->_totalDnsServers;
}

- (void)setTotalDnsServers:(unint64_t)a3
{
  self->_totalDnsServers = a3;
}

- (unint64_t)numIPv4DnsServers
{
  return self->_numIPv4DnsServers;
}

- (void)setNumIPv4DnsServers:(unint64_t)a3
{
  self->_numIPv4DnsServers = a3;
}

- (unint64_t)numIPv6DnsServers
{
  return self->_numIPv6DnsServers;
}

- (void)setNumIPv6DnsServers:(unint64_t)a3
{
  self->_numIPv6DnsServers = a3;
}

- (unint64_t)numLocalDnsServers
{
  return self->_numLocalDnsServers;
}

- (void)setNumLocalDnsServers:(unint64_t)a3
{
  self->_numLocalDnsServers = a3;
}

- (unint64_t)numRemoteDnsServers
{
  return self->_numRemoteDnsServers;
}

- (void)setNumRemoteDnsServers:(unint64_t)a3
{
  self->_numRemoteDnsServers = a3;
}

- (int64_t)dnsServerConfigType
{
  return self->_dnsServerConfigType;
}

- (void)setDnsServerConfigType:(int64_t)a3
{
  self->_dnsServerConfigType = a3;
}

- (unint64_t)netscoreAtStudyStart
{
  return self->_netscoreAtStudyStart;
}

- (void)setNetscoreAtStudyStart:(unint64_t)a3
{
  self->_netscoreAtStudyStart = a3;
}

- (unint64_t)stallscoreAtStudyStart
{
  return self->_stallscoreAtStudyStart;
}

- (void)setStallscoreAtStudyStart:(unint64_t)a3
{
  self->_stallscoreAtStudyStart = a3;
}

- (unint64_t)impactedServersAtStudyStart
{
  return self->_impactedServersAtStudyStart;
}

- (void)setImpactedServersAtStudyStart:(unint64_t)a3
{
  self->_impactedServersAtStudyStart = a3;
}

- (unint64_t)netscoreAtStudyEnd
{
  return self->_netscoreAtStudyEnd;
}

- (void)setNetscoreAtStudyEnd:(unint64_t)a3
{
  self->_netscoreAtStudyEnd = a3;
}

- (unint64_t)stallscoreAtStudyEnd
{
  return self->_stallscoreAtStudyEnd;
}

- (void)setStallscoreAtStudyEnd:(unint64_t)a3
{
  self->_stallscoreAtStudyEnd = a3;
}

- (unint64_t)impactedServersAtStudyEnd
{
  return self->_impactedServersAtStudyEnd;
}

- (void)setImpactedServersAtStudyEnd:(unint64_t)a3
{
  self->_impactedServersAtStudyEnd = a3;
}

- (NSMutableDictionary)probeContextBE
{
  return self->_probeContextBE;
}

- (void)setProbeContextBE:(id)a3
{
  objc_storeStrong((id *)&self->_probeContextBE, a3);
}

- (NSMutableDictionary)probeContextBK
{
  return self->_probeContextBK;
}

- (void)setProbeContextBK:(id)a3
{
  objc_storeStrong((id *)&self->_probeContextBK, a3);
}

- (NSMutableDictionary)probeContextVI
{
  return self->_probeContextVI;
}

- (void)setProbeContextVI:(id)a3
{
  objc_storeStrong((id *)&self->_probeContextVI, a3);
}

- (NSMutableDictionary)probeContextVO
{
  return self->_probeContextVO;
}

- (void)setProbeContextVO:(id)a3
{
  objc_storeStrong((id *)&self->_probeContextVO, a3);
}

- (NSString)appleCaptiveServerIP
{
  return self->_appleCaptiveServerIP;
}

- (void)setAppleCaptiveServerIP:(id)a3
{
  objc_storeStrong((id *)&self->_appleCaptiveServerIP, a3);
}

- (NSMutableArray)accessPointInfoToAppend
{
  return self->_accessPointInfoToAppend;
}

- (void)setAccessPointInfoToAppend:(id)a3
{
  objc_storeStrong((id *)&self->_accessPointInfoToAppend, a3);
}

- (OS_dispatch_queue)dnsStudyQueue
{
  return self->_dnsStudyQueue;
}

- (void)setDnsStudyQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dnsStudyQueue, a3);
}

- (NSMutableArray)usbEventNotificationToAppend
{
  return self->_usbEventNotificationToAppend;
}

- (void)setUsbEventNotificationToAppend:(id)a3
{
  objc_storeStrong((id *)&self->_usbEventNotificationToAppend, a3);
}

- (WACoreCapture)coreCaptureControl
{
  return self->_coreCaptureControl;
}

- (void)setCoreCaptureControl:(id)a3
{
  objc_storeStrong((id *)&self->_coreCaptureControl, a3);
}

- (OS_dispatch_queue)studyQueue
{
  return self->_studyQueue;
}

- (void)setStudyQueue:(id)a3
{
  objc_storeStrong((id *)&self->_studyQueue, a3);
}

- (OS_dispatch_queue)dpsReadWriteSerialQueue
{
  return self->_dpsReadWriteSerialQueue;
}

- (void)setDpsReadWriteSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dpsReadWriteSerialQueue, a3);
}

- (OS_dispatch_queue)peerDiagnosticsStudyQueue
{
  return self->_peerDiagnosticsStudyQueue;
}

- (void)setPeerDiagnosticsStudyQueue:(id)a3
{
  objc_storeStrong((id *)&self->_peerDiagnosticsStudyQueue, a3);
}

- (NSMutableArray)dpsnToAppend
{
  return self->_dpsnToAppend;
}

- (void)setDpsnToAppend:(id)a3
{
  objc_storeStrong((id *)&self->_dpsnToAppend, a3);
}

- (NSMutableArray)dpsapToAppend
{
  return self->_dpsapToAppend;
}

- (void)setDpsapToAppend:(id)a3
{
  objc_storeStrong((id *)&self->_dpsapToAppend, a3);
}

- (NSMutableArray)dpscsToAppend
{
  return self->_dpscsToAppend;
}

- (void)setDpscsToAppend:(id)a3
{
  objc_storeStrong((id *)&self->_dpscsToAppend, a3);
}

- (NSMutableArray)assocDiffToAppend
{
  return self->_assocDiffToAppend;
}

- (void)setAssocDiffToAppend:(id)a3
{
  objc_storeStrong((id *)&self->_assocDiffToAppend, a3);
}

- (NSMutableArray)swfnToAppend
{
  return self->_swfnToAppend;
}

- (void)setSwfnToAppend:(id)a3
{
  objc_storeStrong((id *)&self->_swfnToAppend, a3);
}

- (int)dpsAction
{
  return self->_dpsAction;
}

- (void)setDpsAction:(int)a3
{
  self->_dpsAction = a3;
}

- (BOOL)tmpFilesHaveAttemptedProcessingInDataStreamPath
{
  return self->_tmpFilesHaveAttemptedProcessingInDataStreamPath;
}

- (void)setTmpFilesHaveAttemptedProcessingInDataStreamPath:(BOOL)a3
{
  self->_tmpFilesHaveAttemptedProcessingInDataStreamPath = a3;
}

- (OS_dispatch_queue)fileHandlingQ
{
  return self->_fileHandlingQ;
}

- (void)setFileHandlingQ:(id)a3
{
  objc_storeStrong((id *)&self->_fileHandlingQ, a3);
}

- (NSURL)wifianalyticsTmpDir
{
  return self->_wifianalyticsTmpDir;
}

- (void)setWifianalyticsTmpDir:(id)a3
{
  objc_storeStrong((id *)&self->_wifianalyticsTmpDir, a3);
}

- (OS_dispatch_queue)mutexQueue
{
  return self->_mutexQueue;
}

- (void)setMutexQueue:(id)a3
{
  objc_storeStrong((id *)&self->_mutexQueue, a3);
}

- (AnalyticsProcessor)analyticsProcessor
{
  return self->_analyticsProcessor;
}

- (void)setAnalyticsProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsProcessor, a3);
}

- (double)analyticsProcessingTimeIntervalSecs
{
  return self->_analyticsProcessingTimeIntervalSecs;
}

- (void)setAnalyticsProcessingTimeIntervalSecs:(double)a3
{
  self->_analyticsProcessingTimeIntervalSecs = a3;
}

- (double)analyticsAgeOutTimeIntervalSecs
{
  return self->_analyticsAgeOutTimeIntervalSecs;
}

- (void)setAnalyticsAgeOutTimeIntervalSecs:(double)a3
{
  self->_analyticsAgeOutTimeIntervalSecs = a3;
}

- (BOOL)analyticsProcessorIsReady
{
  return self->_analyticsProcessorIsReady;
}

- (void)setAnalyticsProcessorIsReady:(BOOL)a3
{
  self->_analyticsProcessorIsReady = a3;
}

- (int)keybagToken
{
  return self->_keybagToken;
}

- (void)setKeybagToken:(int)a3
{
  self->_keybagToken = a3;
}

- (OS_dispatch_source)jsonFilerReaderTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 624, 1);
}

- (void)setJsonFilerReaderTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 624);
}

- (OS_dispatch_queue)manageConfigQueue
{
  return self->_manageConfigQueue;
}

- (void)setManageConfigQueue:(id)a3
{
  objc_storeStrong((id *)&self->_manageConfigQueue, a3);
}

- (ManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (DatapathMetricStream)datapathMetricStream
{
  return self->_datapathMetricStream;
}

- (void)setDatapathMetricStream:(id)a3
{
  objc_storeStrong((id *)&self->_datapathMetricStream, a3);
}

- (id)DatapathMetricGetter
{
  return self->_DatapathMetricGetter;
}

- (void)setDatapathMetricGetter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 656);
}

- (NSDate)lastDateDetermineChannelsPerIORPopulatableQueried
{
  return self->_lastDateDetermineChannelsPerIORPopulatableQueried;
}

- (void)setLastDateDetermineChannelsPerIORPopulatableQueried:(id)a3
{
  objc_storeStrong((id *)&self->_lastDateDetermineChannelsPerIORPopulatableQueried, a3);
}

- (NSDate)lastDateWiFiAppInstalledQueried
{
  return self->_lastDateWiFiAppInstalledQueried;
}

- (void)setLastDateWiFiAppInstalledQueried:(id)a3
{
  objc_storeStrong((id *)&self->_lastDateWiFiAppInstalledQueried, a3);
}

- (BOOL)isWiFiAppInstalled
{
  return self->_isWiFiAppInstalled;
}

- (void)setIsWiFiAppInstalled:(BOOL)a3
{
  self->_isWiFiAppInstalled = a3;
}

- (RecommendationPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (NSMutableDictionary)cachedUsage
{
  return self->_cachedUsage;
}

- (void)setCachedUsage:(id)a3
{
  objc_storeStrong((id *)&self->_cachedUsage, a3);
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSDate)pidLaunchDate
{
  return (NSDate *)objc_getProperty(self, a2, 696, 1);
}

- (void)setPidLaunchDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 696);
}

- (BOOL)persistFileExistedAtPIDLoad
{
  return self->_persistFileExistedAtPIDLoad;
}

- (void)setPersistFileExistedAtPIDLoad:(BOOL)a3
{
  self->_persistFileExistedAtPIDLoad = a3;
}

- (BOOL)readingPersistFile
{
  return self->_readingPersistFile;
}

- (void)setReadingPersistFile:(BOOL)a3
{
  self->_readingPersistFile = a3;
}

- (BOOL)writingPersistFile
{
  return self->_writingPersistFile;
}

- (void)setWritingPersistFile:(BOOL)a3
{
  self->_writingPersistFile = a3;
}

- (NSDictionary)nowCacheUsageForTelemetry
{
  return self->_nowCacheUsageForTelemetry;
}

- (void)setNowCacheUsageForTelemetry:(id)a3
{
  objc_storeStrong((id *)&self->_nowCacheUsageForTelemetry, a3);
}

- (NSDictionary)oldCacheUsageForTelemetry
{
  return self->_oldCacheUsageForTelemetry;
}

- (void)setOldCacheUsageForTelemetry:(id)a3
{
  objc_storeStrong((id *)&self->_oldCacheUsageForTelemetry, a3);
}

- (OS_dispatch_source)workReportTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 720, 1);
}

- (void)setWorkReportTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 720);
}

- (BOOL)workReportTimerRunning
{
  return self->_workReportTimerRunning;
}

- (void)setWorkReportTimerRunning:(BOOL)a3
{
  self->_workReportTimerRunning = a3;
}

- (unint64_t)workReportSelectingSingleWithinFirstDay
{
  return self->_workReportSelectingSingleWithinFirstDay;
}

- (void)setWorkReportSelectingSingleWithinFirstDay:(unint64_t)a3
{
  self->_workReportSelectingSingleWithinFirstDay = a3;
}

- (unint64_t)workReportSelectingSingleWithinFirstWeek
{
  return self->_workReportSelectingSingleWithinFirstWeek;
}

- (void)setWorkReportSelectingSingleWithinFirstWeek:(unint64_t)a3
{
  self->_workReportSelectingSingleWithinFirstWeek = a3;
}

- (unsigned)isMegaEnabled
{
  return self->_isMegaEnabled;
}

- (void)setIsMegaEnabled:(unsigned __int8)a3
{
  self->_isMegaEnabled = a3;
}

- (NSDate)profileMegaEnabledDate
{
  return (NSDate *)objc_getProperty(self, a2, 744, 1);
}

- (void)setProfileMegaEnabledDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 744);
}

- (NSDate)profileMegaDisabledDate
{
  return (NSDate *)objc_getProperty(self, a2, 752, 1);
}

- (void)setProfileMegaDisabledDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 752);
}

- (unint64_t)profileMegaEnabledSeconds
{
  return self->_profileMegaEnabledSeconds;
}

- (void)setProfileMegaEnabledSeconds:(unint64_t)a3
{
  self->_profileMegaEnabledSeconds = a3;
}

- (unint64_t)profileMegaDisabledSeconds
{
  return self->_profileMegaDisabledSeconds;
}

- (void)setProfileMegaDisabledSeconds:(unint64_t)a3
{
  self->_profileMegaDisabledSeconds = a3;
}

- (int64_t)driverType
{
  return self->_driverType;
}

- (void)setDriverType:(int64_t)a3
{
  self->_driverType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileMegaDisabledDate, 0);
  objc_storeStrong((id *)&self->_profileMegaEnabledDate, 0);
  objc_storeStrong((id *)&self->_workReportTimer, 0);
  objc_storeStrong((id *)&self->_oldCacheUsageForTelemetry, 0);
  objc_storeStrong((id *)&self->_nowCacheUsageForTelemetry, 0);
  objc_storeStrong((id *)&self->_pidLaunchDate, 0);
  objc_storeStrong((id *)&self->_cachedUsage, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_lastDateWiFiAppInstalledQueried, 0);
  objc_storeStrong((id *)&self->_lastDateDetermineChannelsPerIORPopulatableQueried, 0);
  objc_storeStrong(&self->_DatapathMetricGetter, 0);
  objc_storeStrong((id *)&self->_datapathMetricStream, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_manageConfigQueue, 0);
  objc_storeStrong((id *)&self->_jsonFilerReaderTimer, 0);
  objc_storeStrong((id *)&self->_analyticsProcessor, 0);
  objc_storeStrong((id *)&self->_mutexQueue, 0);
  objc_storeStrong((id *)&self->_wifianalyticsTmpDir, 0);
  objc_storeStrong((id *)&self->_fileHandlingQ, 0);
  objc_storeStrong((id *)&self->_swfnToAppend, 0);
  objc_storeStrong((id *)&self->_assocDiffToAppend, 0);
  objc_storeStrong((id *)&self->_dpscsToAppend, 0);
  objc_storeStrong((id *)&self->_dpsapToAppend, 0);
  objc_storeStrong((id *)&self->_dpsnToAppend, 0);
  objc_storeStrong((id *)&self->_peerDiagnosticsStudyQueue, 0);
  objc_storeStrong((id *)&self->_dpsReadWriteSerialQueue, 0);
  objc_storeStrong((id *)&self->_studyQueue, 0);
  objc_storeStrong((id *)&self->_coreCaptureControl, 0);
  objc_storeStrong((id *)&self->_usbEventNotificationToAppend, 0);
  objc_storeStrong((id *)&self->_dnsStudyQueue, 0);
  objc_storeStrong((id *)&self->_accessPointInfoToAppend, 0);
  objc_storeStrong((id *)&self->_appleCaptiveServerIP, 0);
  objc_storeStrong((id *)&self->_probeContextVO, 0);
  objc_storeStrong((id *)&self->_probeContextVI, 0);
  objc_storeStrong((id *)&self->_probeContextBK, 0);
  objc_storeStrong((id *)&self->_probeContextBE, 0);
  objc_storeStrong((id *)&self->_slowwifiStudyTransaction, 0);
  objc_storeStrong((id *)&self->_dnsStudyTransaction, 0);
  objc_storeStrong((id *)&self->_dpsStudyTransaction, 0);
  objc_storeStrong((id *)&self->_wifiChipSet, 0);
  objc_storeStrong((id *)&self->_dpsQuickRecoveryEngine, 0);
  objc_storeStrong((id *)&self->_recommendationEngine, 0);
  objc_storeStrong((id *)&self->_studyTimeStamps, 0);
  objc_storeStrong((id *)&self->_transformEngine, 0);
  objc_storeStrong((id *)&self->_infraInterfaceName, 0);
  objc_storeStrong((id *)&self->_interfaceNameToApple80211InstanceMap, 0);
  objc_storeStrong((id *)&self->_cachedModelObjectsKeyToMessageMap, 0);
  objc_storeStrong((id *)&self->_pendingUntokenedConnections, 0);
  objc_storeStrong((id *)&self->_processTokenToXPCConnectionMap, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_iorMessagePopulator, 0);
  objc_storeStrong((id *)&self->_messageStore, 0);
  objc_storeStrong((id *)&self->_engineQ, 0);
  objc_storeStrong((id *)&self->_processTokenToGroupTypeMap, 0);
  objc_storeStrong((id *)&self->_submitterMap, 0);
  objc_storeStrong((id *)&self->_velocityClient, 0);
  objc_storeStrong((id *)&self->_corewifi, 0);
}

@end
