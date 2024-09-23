@implementation MODaemonUniverse

- (void)setupServices
{
  id os_log;
  NSObject *v4;
  void *v5;
  void *v6;
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
  void *v21;
  uint64_t v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  objc_class *v28;
  NSString *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  objc_class *v33;
  NSString *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  objc_class *v38;
  NSString *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  objc_class *v43;
  NSString *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  objc_class *v48;
  NSString *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  objc_class *v53;
  NSString *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  objc_class *v58;
  NSString *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  objc_class *v63;
  NSString *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  objc_class *v68;
  NSString *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  objc_class *v73;
  NSString *v74;
  void *v75;
  MOBundleClusteringManager *v76;
  void *v77;
  uint64_t v78;
  objc_class *v79;
  NSString *v80;
  void *v81;
  MOOnboardingAndSettingsPersistence *v82;
  void *v83;
  uint64_t v84;
  objc_class *v85;
  NSString *v86;
  void *v87;
  MOManageServer *v88;
  void *v89;
  uint64_t v90;
  objc_class *v91;
  NSString *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  MOEventRefreshScheduler *v98;
  void *v99;
  uint64_t v100;
  objc_class *v101;
  NSString *v102;
  void *v103;
  void *v104;
  void *v105;
  MODaemonAnalyticsManager *v106;
  void *v107;
  uint64_t v108;
  objc_class *v109;
  NSString *v110;
  void *v111;
  MOEngagementAndSuggestionAnalyticsManager *v112;
  void *v113;
  uint64_t v114;
  objc_class *v115;
  NSString *v116;
  void *v117;
  MOEventPatternManager *v118;
  void *v119;
  uint64_t v120;
  objc_class *v121;
  NSString *v122;
  void *v123;
  void *v124;
  dispatch_queue_attr_t v125;
  NSObject *v126;
  NSObject *v127;
  id v128;
  NSObject *v129;
  dispatch_time_t v130;
  MONotificationsManager *v131;
  MOEventBundleManager *v132;
  MOEventBundleRanking *v133;
  MOEngagementHistoryManager *v134;
  MOEventManager *v135;
  MOEventStore *v136;
  MOFSMStore *v137;
  MOEventBundleStore *v138;
  MOTimeZoneManager *v139;
  MODataAccessManager *v140;
  MOPersistenceManager *v141;
  MODarwinNotifier *v142;
  MOConfigurationManager *v143;
  MODefaultsManager *v144;
  _QWORD block[5];
  _QWORD v146[5];
  id v147;
  uint8_t buf[4];
  uint64_t v149;

  v146[0] = 0;
  v146[1] = v146;
  v146[2] = 0x3032000000;
  v146[3] = __Block_byref_object_copy__9;
  v146[4] = __Block_byref_object_dispose__9;
  v147 = (id)os_transaction_create("com.apple.moments.universe-initialize", a2);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v4 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Daemon initialized, Lock", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse serviceDictLock](self, "serviceDictLock"));
  objc_msgSend(v5, "lock");

  v144 = -[MODefaultsManager initWithUniverse:]([MODefaultsManager alloc], "initWithUniverse:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse universe](self, "universe"));
  v8 = (objc_class *)objc_opt_class(MODefaultsManager, v7);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v144, v10);

  v143 = -[MOConfigurationManager initWithUniverse:]([MOConfigurationManager alloc], "initWithUniverse:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse universe](self, "universe"));
  v13 = (objc_class *)objc_opt_class(MOConfigurationManager, v12);
  v14 = NSStringFromClass(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v143, v15);

  v142 = -[MODarwinNotifier initWithUniverse:]([MODarwinNotifier alloc], "initWithUniverse:", self);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse universe](self, "universe"));
  v18 = (objc_class *)objc_opt_class(MODarwinNotifier, v17);
  v19 = NSStringFromClass(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v142, v20);

  v141 = -[MOPersistenceManager initWithUniverse:]([MOPersistenceManager alloc], "initWithUniverse:", self);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse universe](self, "universe"));
  v23 = (objc_class *)objc_opt_class(MOPersistenceManager, v22);
  v24 = NSStringFromClass(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v141, v25);

  v140 = -[MODataAccessManager initWithUniverse:]([MODataAccessManager alloc], "initWithUniverse:", self);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse universe](self, "universe"));
  v28 = (objc_class *)objc_opt_class(MODataAccessManager, v27);
  v29 = NSStringFromClass(v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v140, v30);

  v139 = -[MOTimeZoneManager initWithUniverse:]([MOTimeZoneManager alloc], "initWithUniverse:", self);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse universe](self, "universe"));
  v33 = (objc_class *)objc_opt_class(MOTimeZoneManager, v32);
  v34 = NSStringFromClass(v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v139, v35);

  v138 = -[MOEventBundleStore initWithUniverse:]([MOEventBundleStore alloc], "initWithUniverse:", self);
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse universe](self, "universe"));
  v38 = (objc_class *)objc_opt_class(MOEventBundleStore, v37);
  v39 = NSStringFromClass(v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v138, v40);

  v137 = -[MOFSMStore initWithUniverse:]([MOFSMStore alloc], "initWithUniverse:", self);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse universe](self, "universe"));
  v43 = (objc_class *)objc_opt_class(MOFSMStore, v42);
  v44 = NSStringFromClass(v43);
  v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  objc_msgSend(v41, "setObject:forKeyedSubscript:", v137, v45);

  v136 = -[MOEventStore initWithUniverse:]([MOEventStore alloc], "initWithUniverse:", self);
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse universe](self, "universe"));
  v48 = (objc_class *)objc_opt_class(MOEventStore, v47);
  v49 = NSStringFromClass(v48);
  v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
  objc_msgSend(v46, "setObject:forKeyedSubscript:", v136, v50);

  v135 = -[MOEventManager initWithUniverse:]([MOEventManager alloc], "initWithUniverse:", self);
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse universe](self, "universe"));
  v53 = (objc_class *)objc_opt_class(MOEventManager, v52);
  v54 = NSStringFromClass(v53);
  v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
  objc_msgSend(v51, "setObject:forKeyedSubscript:", v135, v55);

  v134 = -[MOEngagementHistoryManager initWithUniverse:]([MOEngagementHistoryManager alloc], "initWithUniverse:", self);
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse universe](self, "universe"));
  v58 = (objc_class *)objc_opt_class(MOEngagementHistoryManager, v57);
  v59 = NSStringFromClass(v58);
  v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
  objc_msgSend(v56, "setObject:forKeyedSubscript:", v134, v60);

  v133 = -[MOEventBundleRanking initWithUniverse:]([MOEventBundleRanking alloc], "initWithUniverse:", self);
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse universe](self, "universe"));
  v63 = (objc_class *)objc_opt_class(MOEventBundleRanking, v62);
  v64 = NSStringFromClass(v63);
  v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v133, v65);

  v132 = -[MOEventBundleManager initWithUniverse:]([MOEventBundleManager alloc], "initWithUniverse:", self);
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse universe](self, "universe"));
  v68 = (objc_class *)objc_opt_class(MOEventBundleManager, v67);
  v69 = NSStringFromClass(v68);
  v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
  objc_msgSend(v66, "setObject:forKeyedSubscript:", v132, v70);

  v131 = -[MONotificationsManager initWithUniverse:]([MONotificationsManager alloc], "initWithUniverse:", self);
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse universe](self, "universe"));
  v73 = (objc_class *)objc_opt_class(MONotificationsManager, v72);
  v74 = NSStringFromClass(v73);
  v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v131, v75);

  v76 = -[MOBundleClusteringManager initWithUniverse:]([MOBundleClusteringManager alloc], "initWithUniverse:", self);
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse universe](self, "universe"));
  v79 = (objc_class *)objc_opt_class(MOBundleClusteringManager, v78);
  v80 = NSStringFromClass(v79);
  v81 = (void *)objc_claimAutoreleasedReturnValue(v80);
  objc_msgSend(v77, "setObject:forKeyedSubscript:", v76, v81);

  v82 = -[MOOnboardingAndSettingsPersistence initWithUniverse:]([MOOnboardingAndSettingsPersistence alloc], "initWithUniverse:", self);
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse universe](self, "universe"));
  v85 = (objc_class *)objc_opt_class(MOOnboardingAndSettingsPersistence, v84);
  v86 = NSStringFromClass(v85);
  v87 = (void *)objc_claimAutoreleasedReturnValue(v86);
  objc_msgSend(v83, "setObject:forKeyedSubscript:", v82, v87);

  v88 = -[MOManageServer initWithUniverse:]([MOManageServer alloc], "initWithUniverse:", self);
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse universe](self, "universe"));
  v91 = (objc_class *)objc_opt_class(MOManageServer, v90);
  v92 = NSStringFromClass(v91);
  v93 = (void *)objc_claimAutoreleasedReturnValue(v92);
  objc_msgSend(v89, "setObject:forKeyedSubscript:", v88, v93);

  v94 = (void *)objc_claimAutoreleasedReturnValue(-[MOManageServer client](v88, "client"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse universe](self, "universe"));
  objc_msgSend(v95, "setObject:forKeyedSubscript:", v94, CFSTR("DaemonClient"));

  v96 = (void *)objc_claimAutoreleasedReturnValue(-[MOManageServer getNotifier](v88, "getNotifier"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse universe](self, "universe"));
  objc_msgSend(v97, "setObject:forKeyedSubscript:", v96, CFSTR("DaemonClientNotifier"));

  v98 = -[MOEventRefreshScheduler initWithUniverse:]([MOEventRefreshScheduler alloc], "initWithUniverse:", self);
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse universe](self, "universe"));
  v101 = (objc_class *)objc_opt_class(MOEventRefreshScheduler, v100);
  v102 = NSStringFromClass(v101);
  v103 = (void *)objc_claimAutoreleasedReturnValue(v102);
  objc_msgSend(v99, "setObject:forKeyedSubscript:", v98, v103);

  v104 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventRefreshScheduler notifier](v98, "notifier"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse universe](self, "universe"));
  objc_msgSend(v105, "setObject:forKeyedSubscript:", v104, CFSTR("EventRefreshSchedulerNotifier"));

  v106 = -[MODaemonAnalyticsManager initWithUniverse:]([MODaemonAnalyticsManager alloc], "initWithUniverse:", self);
  v107 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse universe](self, "universe"));
  v109 = (objc_class *)objc_opt_class(MODaemonAnalyticsManager, v108);
  v110 = NSStringFromClass(v109);
  v111 = (void *)objc_claimAutoreleasedReturnValue(v110);
  objc_msgSend(v107, "setObject:forKeyedSubscript:", v106, v111);

  v112 = -[MOEngagementAndSuggestionAnalyticsManager initWithUniverse:]([MOEngagementAndSuggestionAnalyticsManager alloc], "initWithUniverse:", self);
  v113 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse universe](self, "universe"));
  v115 = (objc_class *)objc_opt_class(MOEngagementAndSuggestionAnalyticsManager, v114);
  v116 = NSStringFromClass(v115);
  v117 = (void *)objc_claimAutoreleasedReturnValue(v116);
  objc_msgSend(v113, "setObject:forKeyedSubscript:", v112, v117);

  v118 = -[MOEventPatternManager initWithUniverse:]([MOEventPatternManager alloc], "initWithUniverse:", self);
  v119 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse universe](self, "universe"));
  v121 = (objc_class *)objc_opt_class(MOEventPatternManager, v120);
  v122 = NSStringFromClass(v121);
  v123 = (void *)objc_claimAutoreleasedReturnValue(v122);
  objc_msgSend(v119, "setObject:forKeyedSubscript:", v118, v123);

  v124 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse serviceDictLock](self, "serviceDictLock"));
  objc_msgSend(v124, "unlock");

  v125 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v126 = objc_claimAutoreleasedReturnValue(v125);
  v127 = dispatch_queue_create("MOFeatureDisabledExit", v126);

  v128 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v129 = objc_claimAutoreleasedReturnValue(v128);
  if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v149 = 10;
    _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_DEFAULT, "Daemon initialized, will release transaction in %llu seconds...", buf, 0xCu);
  }

  v130 = dispatch_time(0, 10000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __48__MODaemonUniverse_SetupServices__setupServices__block_invoke;
  block[3] = &unk_1002AF360;
  block[4] = v146;
  dispatch_after(v130, v127, block);

  _Block_object_dispose(v146, 8);
}

void __48__MODaemonUniverse_SetupServices__setupServices__block_invoke(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint8_t v6[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Daemon initialized, transaction released", v6, 2u);
  }

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

- (MODaemonUniverse)init
{
  return -[MODaemonUniverse initWithUniverseDictionary:](self, "initWithUniverseDictionary:", 0);
}

- (MODaemonUniverse)initWithUniverseDictionary:(id)a3
{
  id v4;
  MODaemonUniverse *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *universe;
  NSRecursiveLock *v8;
  NSRecursiveLock *serviceDictLock;
  MODaemonUniverse *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MODaemonUniverse;
  v5 = -[MODaemonUniverse init](&v12, "init");
  if (v5)
  {
    if (v4)
      v6 = (NSMutableDictionary *)objc_msgSend(v4, "mutableCopy");
    else
      v6 = objc_opt_new(NSMutableDictionary);
    universe = v5->_universe;
    v5->_universe = v6;

    v8 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    serviceDictLock = v5->_serviceDictLock;
    v5->_serviceDictLock = v8;

    v10 = v5;
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse universe](self, "universe"));
  objc_msgSend(v3, "removeAllObjects");

  v4.receiver = self;
  v4.super_class = (Class)MODaemonUniverse;
  -[MODaemonUniverse dealloc](&v4, "dealloc");
}

- (id)getService:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id os_log;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint8_t buf[4];
  id v20;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse serviceDictLock](self, "serviceDictLock"));
  objc_msgSend(v6, "lock");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse universe](self, "universe"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", v5));

  if (!v8)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No service named [%@] is not initiated, look for it in classes", buf, 0xCu);
    }

    v11 = objc_claimAutoreleasedReturnValue(-[MODaemonUniverse createService:](self, "createService:", v5));
    if (v11)
    {
      v8 = (void *)v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse universe](self, "universe"));
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, v5);
    }
    else
    {
      v13 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[MODaemonUniverse getService:].cold.1();

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MODaemonUniverse.m"), 51, CFSTR("service named [%@] failed to be initiated (in %s:%d)"), v5, "-[MODaemonUniverse getService:]", 51);
      v8 = 0;
    }

  }
  v15 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "get service named [%@] release lock", buf, 0xCu);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse serviceDictLock](self, "serviceDictLock"));
  objc_msgSend(v17, "unlock");

  return v8;
}

- (id)createService:(id)a3
{
  NSString *v5;
  objc_class *v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  const char *v15;
  id v16;
  NSObject *v17;
  uint8_t buf[4];
  NSString *v20;

  v5 = (NSString *)a3;
  v6 = NSClassFromString(v5);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Find corresponding class and will initiate the service [%@]", buf, 0xCu);
    }

    v10 = [v6 alloc];
    if ((objc_opt_respondsToSelector(v10, "initWithUniverse:") & 1) == 0)
    {
      v16 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[MODaemonUniverse createService:].cold.2();

      v13 = objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MODaemonUniverse.m"), 79, CFSTR("service named [%@] does not conform the protocol. (in %s:%d)"), v5, "-[MODaemonUniverse createService:]", 79);
      v11 = 0;
      goto LABEL_17;
    }
    v11 = objc_msgSend(v10, "initWithUniverse:", self);
    v12 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v14)
      {
        *(_DWORD *)buf = 138412290;
        v20 = v5;
        v15 = "successfully initiated the service [%@]";
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
      }
    }
    else if (v14)
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      v15 = "failed to initiate the service [%@]";
      goto LABEL_16;
    }
LABEL_17:

    goto LABEL_18;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[MODaemonUniverse createService:].cold.1();

  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MODaemonUniverse.m"), 66, CFSTR("No class named [%@] (in %s:%d)"), v5, "-[MODaemonUniverse createService:]", 66);
  v11 = 0;
LABEL_18:

  return v11;
}

- (void)setService:(id)a3 forName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  if (a4)
  {
    v6 = a4;
    v7 = a3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse serviceDictLock](self, "serviceDictLock"));
    objc_msgSend(v8, "lock");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse universe](self, "universe"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v6);

    v10 = (id)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse serviceDictLock](self, "serviceDictLock"));
    objc_msgSend(v10, "unlock");

  }
}

- (void)run
{
  dispatch_queue_attr_t v2;
  NSObject *v3;
  NSObject *v4;
  id os_log;
  NSObject *v6;
  dispatch_time_t v7;
  dispatch_time_t v8;
  int v9;
  uint64_t v10;

  if (!self)
  {
    v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue(v2);
    v4 = dispatch_queue_create("MOFeatureDisabledExit", v3);

    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      v10 = 10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Nothing to be enabled, scheduling exit in %llu seconds...", (uint8_t *)&v9, 0xCu);
    }

    v7 = dispatch_time(0, 10000000000);
    dispatch_after(v7, v4, &__block_literal_global_41);

  }
  v8 = dispatch_time(0, 0);
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, &__block_literal_global_16);
  dispatch_main();
}

void __23__MODaemonUniverse_run__block_invoke(id a1)
{
  id os_log;
  NSObject *v2;
  uint8_t v3[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v2 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Nothing to be enabled and grace delay elapsed, exiting...", v3, 2u);
  }

  exit(0);
}

- (NSMutableDictionary)universe
{
  return self->_universe;
}

- (void)setUniverse:(id)a3
{
  objc_storeStrong((id *)&self->_universe, a3);
}

- (NSRecursiveLock)serviceDictLock
{
  return self->_serviceDictLock;
}

- (void)setServiceDictLock:(id)a3
{
  objc_storeStrong((id *)&self->_serviceDictLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceDictLock, 0);
  objc_storeStrong((id *)&self->_universe, 0);
}

- (void)getService:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2((void *)&_mh_execute_header, v0, v1, "service named [%@] failed to be initiated (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

- (void)createService:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2((void *)&_mh_execute_header, v0, v1, "No class named [%@] (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

- (void)createService:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2((void *)&_mh_execute_header, v0, v1, "service named [%@] does not conform the protocol. (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

@end
