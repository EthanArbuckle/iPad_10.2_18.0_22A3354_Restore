@implementation MODaemonAnalyticsManager

- (MODaemonAnalyticsManager)initWithUniverse:(id)a3
{
  id v5;
  MODaemonAnalyticsManager *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  void *v11;
  void *v12;
  id v13;
  MODaemonAnalyticsManager *v14;
  void *v15;
  NSNumber *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  MODispatcher *v26;
  MODispatcher *v27;
  MODaemonAnalyticsManager *v28;
  _QWORD *v29;
  MODaemonAnalyticsManager *v30;
  _QWORD *v31;
  id v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  id os_log;
  NSObject *v37;
  void *v39;
  void *v40;
  void *v41;
  MODispatcher *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  MODaemonAnalyticsManager *v47;
  id v48;
  uint64_t *v49;
  _QWORD v50[4];
  MODaemonAnalyticsManager *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  objc_super v58;

  v5 = a3;
  v58.receiver = self;
  v58.super_class = (Class)MODaemonAnalyticsManager;
  v6 = -[MODaemonAnalyticsManager init](&v58, "init");
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("MODaemonAnalyticsQueue", v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    v52 = 0;
    v53 = &v52;
    v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__20;
    v56 = __Block_byref_object_dispose__20;
    v57 = (id)objc_claimAutoreleasedReturnValue(-[MODaemonAnalyticsManager getDaemonPlistFileURL](v6, "getDaemonPlistFileURL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonAnalyticsManager readPersistenceTable:](v6, "readPersistenceTable:", v53[5]));
    v12 = v11;
    if (v11)
      v13 = objc_msgSend(v11, "mutableCopy");
    else
      v13 = objc_alloc_init((Class)NSMutableDictionary);
    v15 = v13;
    v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CFAbsoluteTimeGetCurrent());
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("lastLaunch"));

    -[MODaemonAnalyticsManager persistDaemonMetrics:withData:](v6, "persistDaemonMetrics:withData:", v53[5], v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binsFromStart:toEnd:gap:](MOMetric, "binsFromStart:toEnd:gap:", &off_1002D9128, &off_1002DD088, &off_1002DD098));
    v19 = objc_claimAutoreleasedReturnValue(+[MOMetric binsFromStart:toEnd:gap:](MOMetric, "binsFromStart:toEnd:gap:", &off_1002DD0A8, &off_1002DD0B8, &off_1002DD0C8));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "arrayByAddingObjectsFromArray:", v19));
    v43 = (void *)v19;
    v21 = (objc_class *)objc_opt_class(MODarwinNotifier, v20);
    v22 = NSStringFromClass(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v23));

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", CFSTR("EventRefreshSchedulerNotifier")));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", CFSTR("DaemonClientNotifier")));
    if (v24)
    {
      if (v25)
      {
        if (v45)
        {
          v26 = -[MODispatcher initWithNotifier:]([MODispatcher alloc], "initWithNotifier:", v24);
          v41 = v12;
          v42 = -[MODispatcher initWithNotifier:]([MODispatcher alloc], "initWithNotifier:", v25);
          v40 = v18;
          v27 = -[MODispatcher initWithNotifier:]([MODispatcher alloc], "initWithNotifier:", v45);
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472;
          v50[2] = __45__MODaemonAnalyticsManager_initWithUniverse___block_invoke;
          v50[3] = &unk_1002B26F0;
          v28 = v6;
          v51 = v28;
          v29 = objc_retainBlock(v50);
          -[MODispatcher registerForNotification:withHandler:](v26, "registerForNotification:withHandler:", 4, v29);
          -[MODispatcher registerForNotification:withHandler:](v26, "registerForNotification:withHandler:", 1, v29);
          -[MODispatcher registerForNotification:withHandler:](v26, "registerForNotification:withHandler:", 3, v29);
          -[MODispatcher registerForNotification:withHandler:](v26, "registerForNotification:withHandler:", 2, v29);
          v39 = v25;
          v46[0] = _NSConcreteStackBlock;
          v46[1] = 3221225472;
          v46[2] = __45__MODaemonAnalyticsManager_initWithUniverse___block_invoke_58;
          v46[3] = &unk_1002B2760;
          v30 = v28;
          v47 = v30;
          v49 = &v52;
          v48 = v44;
          v31 = objc_retainBlock(v46);
          -[MODispatcher registerForNotification:withHandler:](v42, "registerForNotification:withHandler:", 2, v31);
          -[MODispatcher registerForNotification:withHandler:](v42, "registerForNotification:withHandler:", 3, v31);
          -[MODispatcher registerForNotification:withHandler:](v42, "registerForNotification:withHandler:", 5, v31);
          -[MODispatcher registerForNotification:withHandler:](v42, "registerForNotification:withHandler:", 4, v31);
          -[MODispatcher registerForNotification:withHandler:](v27, "registerForNotification:withHandler:", 0, v31);
          -[MODispatcher registerForNotification:withHandler:](v27, "registerForNotification:withHandler:", 1, v31);
          -[MODispatcher registerForNotification:withHandler:](v27, "registerForNotification:withHandler:", 2, v31);
          -[MODispatcher registerForNotification:withHandler:](v27, "registerForNotification:withHandler:", 3, v31);
          -[MODispatcher registerForNotification:withHandler:](v27, "registerForNotification:withHandler:", 4, v31);
          -[MODispatcher registerForNotification:withHandler:](v27, "registerForNotification:withHandler:", 5, v31);
          v14 = v30;

          v18 = v40;
          v12 = v41;
          v25 = v39;
LABEL_20:

          _Block_object_dispose(&v52, 8);
          goto LABEL_21;
        }
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
        v37 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          -[MODaemonAnalyticsManager initWithUniverse:].cold.3();

        v26 = (MODispatcher *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        -[MODispatcher handleFailureInMethod:object:file:lineNumber:description:](v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("MODaemonAnalyticsManager.m"), 82, CFSTR("Invalid parameter not satisfying: daemonClientNotifier"));
      }
      else
      {
        v34 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          -[MODaemonAnalyticsManager initWithUniverse:].cold.2();

        v26 = (MODispatcher *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        -[MODispatcher handleFailureInMethod:object:file:lineNumber:description:](v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("MODaemonAnalyticsManager.m"), 81, CFSTR("Invalid parameter not satisfying: eventRefreshSchedulerNotifier"));
      }
    }
    else
    {
      v32 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        -[MODaemonAnalyticsManager initWithUniverse:].cold.1();

      v26 = (MODispatcher *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      -[MODispatcher handleFailureInMethod:object:file:lineNumber:description:](v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("MODaemonAnalyticsManager.m"), 80, CFSTR("Invalid parameter not satisfying: darwinNotifier"));
    }
    v14 = 0;
    goto LABEL_20;
  }
  v14 = 0;
LABEL_21:

  return v14;
}

void __45__MODaemonAnalyticsManager_initWithUniverse___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id os_log;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  NSObject *v16;
  int v17;
  id v18;

  v5 = a3;
  v7 = (void *)os_transaction_create("com.apple.moments.daemon-analytics.darwin-handler", v6);
  switch(a2)
  {
    case 1:
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
      v9 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v17 = 138412290;
        v18 = v5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Managed configuration changed %@", (uint8_t *)&v17, 0xCu);
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("optInDNU")));
      objc_msgSend(*(id *)(a1 + 32), "setOptInDNU:", v10);

      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("optInIHA")));
      objc_msgSend(*(id *)(a1 + 32), "setOptInIHA:", v11);
      goto LABEL_13;
    case 2:
      v12 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v17 = 138412290;
        v18 = v5;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Locked status changed %@", (uint8_t *)&v17, 0xCu);
      }

      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("stateUnlocked")));
      objc_msgSend(*(id *)(a1 + 32), "setStateUnlocked:", v11);
      goto LABEL_13;
    case 3:
      v14 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
      v11 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "First unlock triggered", (uint8_t *)&v17, 2u);
      }
      goto LABEL_13;
    case 4:
      v15 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = 138412290;
        v18 = v5;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Battery status changed %@", (uint8_t *)&v17, 0xCu);
      }

      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("stateOnCharger")));
      objc_msgSend(*(id *)(a1 + 32), "setStateOnCharger:", v11);
LABEL_13:

      break;
    default:
      break;
  }

}

void __45__MODaemonAnalyticsManager_initWithUniverse___block_invoke_58(uint64_t a1, int a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  double Current;
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
  NSObject *v36;
  void *v37;
  void *v38;
  id os_log;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
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
  void *v62;
  void *v63;
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
  void *v75;
  void *v76;
  void *v77;
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
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  _QWORD *v108;
  _QWORD *v109;
  void *v110;
  id v111;
  void *v112;
  id v113;
  _QWORD v114[4];
  id v115;
  id v116;
  _QWORD *v117;
  _QWORD *v118;
  _QWORD *v119;
  uint64_t *v120;
  _QWORD *v121;
  _QWORD *v122;
  _QWORD v123[3];
  uint32_t v124;
  uint64_t v125;
  uint64_t *v126;
  uint64_t v127;
  id (*v128)(uint64_t, uint64_t);
  void (*v129)(uint64_t);
  Block_layout *v130;
  _QWORD v131[3];
  int v132;
  _QWORD v133[3];
  int v134;
  _QWORD v135[3];
  int v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _QWORD v141[5];
  id v142;
  _BYTE v143[128];
  _QWORD v144[18];

  v111 = a3;
  v141[0] = 0;
  v141[1] = v141;
  v141[2] = 0x3032000000;
  v141[3] = __Block_byref_object_copy__20;
  v141[4] = __Block_byref_object_dispose__20;
  v142 = (id)os_transaction_create("com.apple.moments.daemon-analytics.trigger-dispatcher-handler", v5);
  if (v111)
    v6 = objc_msgSend(v111, "mutableCopy");
  else
    v6 = objc_alloc_init((Class)NSMutableDictionary);
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys", v111));
  v144[0] = CFSTR("stateDatabaseAvailable");
  v144[1] = CFSTR("resultWorkoutsSuccess");
  v144[2] = CFSTR("resultMindfulSessionsSuccess");
  v144[3] = CFSTR("resultPeopleDiscoverySuccess");
  v144[4] = CFSTR("resultPeopleCountSuccess");
  v144[5] = CFSTR("resultPeopleDensitySuccess");
  v144[6] = CFSTR("resultVisitsSuccess");
  v144[7] = CFSTR("resultVisitsTrainingSuccess");
  v144[8] = CFSTR("resultPhotosSuccess");
  v144[9] = CFSTR("resultSharedPhotosSuccess");
  v144[10] = CFSTR("resultTopicsSuccess");
  v144[11] = CFSTR("resultSharedSuccess");
  v144[12] = CFSTR("resultSuggestedSuccess");
  v144[13] = CFSTR("resultTripsSuccess");
  v144[14] = CFSTR("resultMusicSuccess");
  v144[15] = CFSTR("resultContactsSuccess");
  v144[16] = CFSTR("resultMotionSuccess");
  v144[17] = CFSTR("resultLifeEventsSuccess");
  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v144, 18));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v137, v143, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v138;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v138 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v8, "containsObject:", v13) & 1) == 0)
          objc_msgSend(v7, "setObject:forKey:", &__kCFBooleanTrue, v13);
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v137, v143, 16);
    }
    while (v10);
  }

  if ((objc_msgSend(v8, "containsObject:", CFSTR("resultOverallSuccess")) & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "checkTriggerSuccess:", v7));
    objc_msgSend(v7, "setObject:forKey:", v14, CFSTR("resultOverallSuccess"));

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("resultNumberOfEvents")));
  v16 = v15 == 0;

  if (v16)
    objc_msgSend(v7, "setObject:forKey:", &off_1002D9128, CFSTR("resultNumberOfEvents"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("resultNumberOfBundleEvents")));
  v18 = v17 == 0;

  if (v18)
    objc_msgSend(v7, "setObject:forKey:", &off_1002D9128, CFSTR("resultNumberOfBundleEvents"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "readPersistenceTable:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)));
  v113 = objc_msgSend(v19, "mutableCopy");
  Current = CFAbsoluteTimeGetCurrent();
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("resultOverallSuccess")));

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastTrigger")));
  if (v22)
  {
    v23 = *(void **)(a1 + 32);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastTrigger")));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "calculateDeltaTime:fromPreviousTime:withBinArray:", v24, v25, *(_QWORD *)(a1 + 40)));
    objc_msgSend(v7, "setObject:forKey:", v26, CFSTR("triggerTimeSinceLastTrigger"));

  }
  else
  {
    objc_msgSend(v7, "setObject:forKey:", &off_1002D9140, CFSTR("triggerTimeSinceLastTrigger"));
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
  objc_msgSend(v113, "setObject:forKey:", v27, CFSTR("lastTrigger"));

  if (v21)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastSuccessfulTrigger")));

    if (v28)
    {
      v29 = *(void **)(a1 + 32);
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastSuccessfulTrigger")));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "calculateDeltaTime:fromPreviousTime:withBinArray:", v30, v31, *(_QWORD *)(a1 + 40)));
      objc_msgSend(v7, "setObject:forKey:", v32, CFSTR("triggerTimeSinceLastSuccessfulTrigger"));

    }
    else
    {
      objc_msgSend(v7, "setObject:forKey:", &off_1002D9140, CFSTR("triggerTimeSinceLastSuccessfulTrigger"));
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
    objc_msgSend(v113, "setObject:forKey:", v33, CFSTR("lastSuccessfulTrigger"));

  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastLaunch")));

  if (v34)
  {
    v35 = *(void **)(a1 + 32);
    v36 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastLaunch")));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "calculateDeltaTime:fromPreviousTime:withBinArray:", v36, v37, *(_QWORD *)(a1 + 40)));
    objc_msgSend(v7, "setObject:forKey:", v38, CFSTR("triggerTimeSinceLastLaunch"));

  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
    v36 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      __45__MODaemonAnalyticsManager_initWithUniverse___block_invoke_58_cold_1();
  }

  switch(a2)
  {
    case 0:
      objc_msgSend(v7, "setObject:forKey:", CFSTR("fetch"), CFSTR("triggerReason"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastFetchTrigger")));

      if (v40)
      {
        v41 = *(void **)(a1 + 32);
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastFetchTrigger")));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "calculateDeltaTime:fromPreviousTime:withBinArray:", v42, v43, *(_QWORD *)(a1 + 40)));
        objc_msgSend(v7, "setObject:forKey:", v44, CFSTR("triggerTimeSinceLastSimilarTrigger"));

      }
      else
      {
        objc_msgSend(v7, "setObject:forKey:", &off_1002D9140, CFSTR("triggerTimeSinceLastSimilarTrigger"));
        objc_msgSend(v7, "setObject:forKey:", &off_1002D9140, CFSTR("triggerTimeSinceLastSuccessfulSimilarTrigger"));
      }
      if (v21)
      {
        v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastSuccessfulFetchTrigger")));

        if (v70)
        {
          v71 = *(void **)(a1 + 32);
          v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
          v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastSuccessfulFetchTrigger")));
          v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "calculateDeltaTime:fromPreviousTime:withBinArray:", v72, v73, *(_QWORD *)(a1 + 40)));
          objc_msgSend(v7, "setObject:forKey:", v74, CFSTR("triggerTimeSinceLastSuccessfulSimilarTrigger"));

        }
        v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
        objc_msgSend(v113, "setObject:forKey:", v75, CFSTR("lastSuccessfulFetchTrigger"));

      }
      v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
      objc_msgSend(v113, "setObject:forKey:", v76, CFSTR("lastFetchTrigger"));
      goto LABEL_80;
    case 1:
      objc_msgSend(v7, "setObject:forKey:", CFSTR("fetchBundle"), CFSTR("triggerReason"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastFetchBundleTrigger")));

      if (v60)
      {
        v61 = *(void **)(a1 + 32);
        v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastFetchBundleTrigger")));
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "calculateDeltaTime:fromPreviousTime:withBinArray:", v62, v63, *(_QWORD *)(a1 + 40)));
        objc_msgSend(v7, "setObject:forKey:", v64, CFSTR("triggerTimeSinceLastSimilarTrigger"));

      }
      else
      {
        objc_msgSend(v7, "setObject:forKey:", &off_1002D9140, CFSTR("triggerTimeSinceLastSimilarTrigger"));
        objc_msgSend(v7, "setObject:forKey:", &off_1002D9140, CFSTR("triggerTimeSinceLastSuccessfulSimilarTrigger"));
      }
      if (v21)
      {
        v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastSuccessfulFetchBundleTrigger")));

        if (v95)
        {
          v96 = *(void **)(a1 + 32);
          v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
          v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastSuccessfulFetchBundleTrigger")));
          v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "calculateDeltaTime:fromPreviousTime:withBinArray:", v97, v98, *(_QWORD *)(a1 + 40)));
          objc_msgSend(v7, "setObject:forKey:", v99, CFSTR("triggerTimeSinceLastSuccessfulSimilarTrigger"));

        }
        v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
        objc_msgSend(v113, "setObject:forKey:", v100, CFSTR("lastSuccessfulFetchBundleTrigger"));

      }
      v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
      objc_msgSend(v113, "setObject:forKey:", v76, CFSTR("lastFetchBundleTrigger"));
      goto LABEL_80;
    case 2:
      objc_msgSend(v7, "setObject:forKey:", CFSTR("collect"), CFSTR("triggerReason"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastCollectTrigger")));

      if (v45)
      {
        v46 = *(void **)(a1 + 32);
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastCollectTrigger")));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "calculateDeltaTime:fromPreviousTime:withBinArray:", v47, v48, *(_QWORD *)(a1 + 40)));
        objc_msgSend(v7, "setObject:forKey:", v49, CFSTR("triggerTimeSinceLastSimilarTrigger"));

      }
      else
      {
        objc_msgSend(v7, "setObject:forKey:", &off_1002D9140, CFSTR("triggerTimeSinceLastSimilarTrigger"));
        objc_msgSend(v7, "setObject:forKey:", &off_1002D9140, CFSTR("triggerTimeSinceLastSuccessfulSimilarTrigger"));
      }
      if (v21)
      {
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastCollectSuccessfulTrigger")));

        if (v77)
        {
          v78 = *(void **)(a1 + 32);
          v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
          v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastCollectSuccessfulTrigger")));
          v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "calculateDeltaTime:fromPreviousTime:withBinArray:", v79, v80, *(_QWORD *)(a1 + 40)));
          objc_msgSend(v7, "setObject:forKey:", v81, CFSTR("triggerTimeSinceLastSuccessfulSimilarTrigger"));

        }
        v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
        objc_msgSend(v113, "setObject:forKey:", v82, CFSTR("lastCollectSuccessfulTrigger"));

      }
      v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
      objc_msgSend(v113, "setObject:forKey:", v76, CFSTR("lastCollectTrigger"));
      goto LABEL_80;
    case 3:
      objc_msgSend(v7, "setObject:forKey:", CFSTR("compute"), CFSTR("triggerReason"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastComputeTrigger")));

      if (v50)
      {
        v51 = *(void **)(a1 + 32);
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastComputeTrigger")));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "calculateDeltaTime:fromPreviousTime:withBinArray:", v52, v53, *(_QWORD *)(a1 + 40)));
        objc_msgSend(v7, "setObject:forKey:", v54, CFSTR("triggerTimeSinceLastSimilarTrigger"));

      }
      else
      {
        objc_msgSend(v7, "setObject:forKey:", &off_1002D9140, CFSTR("triggerTimeSinceLastSimilarTrigger"));
        objc_msgSend(v7, "setObject:forKey:", &off_1002D9140, CFSTR("triggerTimeSinceLastSuccessfulSimilarTrigger"));
      }
      if (v21)
      {
        v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastComputeSuccessfulTrigger")));

        if (v83)
        {
          v84 = *(void **)(a1 + 32);
          v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
          v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastComputeSuccessfulTrigger")));
          v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "calculateDeltaTime:fromPreviousTime:withBinArray:", v85, v86, *(_QWORD *)(a1 + 40)));
          objc_msgSend(v7, "setObject:forKey:", v87, CFSTR("triggerTimeSinceLastSuccessfulSimilarTrigger"));

        }
        v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
        objc_msgSend(v113, "setObject:forKey:", v88, CFSTR("lastComputeSuccessfulTrigger"));

      }
      v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
      objc_msgSend(v113, "setObject:forKey:", v76, CFSTR("lastComputeTrigger"));
      goto LABEL_80;
    case 4:
      objc_msgSend(v7, "setObject:forKey:", CFSTR("purge"), CFSTR("triggerReason"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastPurgeTrigger")));

      if (v55)
      {
        v56 = *(void **)(a1 + 32);
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastPurgeTrigger")));
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "calculateDeltaTime:fromPreviousTime:withBinArray:", v57, v58, *(_QWORD *)(a1 + 40)));
        objc_msgSend(v7, "setObject:forKey:", v59, CFSTR("triggerTimeSinceLastSimilarTrigger"));

      }
      else
      {
        objc_msgSend(v7, "setObject:forKey:", &off_1002D9140, CFSTR("triggerTimeSinceLastSimilarTrigger"));
        objc_msgSend(v7, "setObject:forKey:", &off_1002D9140, CFSTR("triggerTimeSinceLastSuccessfulSimilarTrigger"));
      }
      if (v21)
      {
        v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastPurgeSuccessfulTrigger")));

        if (v89)
        {
          v90 = *(void **)(a1 + 32);
          v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
          v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastPurgeSuccessfulTrigger")));
          v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "calculateDeltaTime:fromPreviousTime:withBinArray:", v91, v92, *(_QWORD *)(a1 + 40)));
          objc_msgSend(v7, "setObject:forKey:", v93, CFSTR("triggerTimeSinceLastSuccessfulSimilarTrigger"));

        }
        v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
        objc_msgSend(v113, "setObject:forKey:", v94, CFSTR("lastPurgeSuccessfulTrigger"));

      }
      v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
      objc_msgSend(v113, "setObject:forKey:", v76, CFSTR("lastPurgeTrigger"));
      goto LABEL_80;
    case 5:
      objc_msgSend(v7, "setObject:forKey:", CFSTR("trends"), CFSTR("triggerReason"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastTrendsTrigger")));

      if (v65)
      {
        v66 = *(void **)(a1 + 32);
        v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastTrendsTrigger")));
        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "calculateDeltaTime:fromPreviousTime:withBinArray:", v67, v68, *(_QWORD *)(a1 + 40)));
        objc_msgSend(v7, "setObject:forKey:", v69, CFSTR("triggerTimeSinceLastSimilarTrigger"));

      }
      else
      {
        objc_msgSend(v7, "setObject:forKey:", &off_1002D9140, CFSTR("triggerTimeSinceLastSimilarTrigger"));
        objc_msgSend(v7, "setObject:forKey:", &off_1002D9140, CFSTR("triggerTimeSinceLastSuccessfulSimilarTrigger"));
      }
      if (v21)
      {
        v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastTrendsSuccessfulTrigger")));

        if (v101)
        {
          v102 = *(void **)(a1 + 32);
          v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
          v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("lastTrendsSuccessfulTrigger")));
          v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "calculateDeltaTime:fromPreviousTime:withBinArray:", v103, v104, *(_QWORD *)(a1 + 40)));
          objc_msgSend(v7, "setObject:forKey:", v105, CFSTR("triggerTimeSinceLastSuccessfulSimilarTrigger"));

        }
        v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
        objc_msgSend(v113, "setObject:forKey:", v106, CFSTR("lastTrendsSuccessfulTrigger"));

      }
      v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
      objc_msgSend(v113, "setObject:forKey:", v76, CFSTR("lastTrendsTrigger"));
LABEL_80:

      objc_msgSend(*(id *)(a1 + 32), "persistDaemonMetrics:withData:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v113);
      break;
    default:
      break;
  }
  v135[0] = 0;
  v135[1] = v135;
  v135[2] = 0x2020000000;
  v136 = 0;
  v133[0] = 0;
  v133[1] = v133;
  v133[2] = 0x2020000000;
  v134 = 5;
  v131[0] = 0;
  v131[1] = v131;
  v131[2] = 0x2020000000;
  v132 = 3;
  v125 = 0;
  v126 = &v125;
  v127 = 0x3032000000;
  v128 = __Block_byref_object_copy__62;
  v129 = __Block_byref_object_dispose__63;
  v130 = &__block_literal_global_23;
  v123[0] = 0;
  v123[1] = v123;
  v123[2] = 0x2020000000;
  v124 = 0;
  v124 = arc4random_uniform(0x64u);
  v114[0] = _NSConcreteStackBlock;
  v114[1] = 3221225472;
  v114[2] = __45__MODaemonAnalyticsManager_initWithUniverse___block_invoke_2;
  v114[3] = &unk_1002B2738;
  v117 = v135;
  v118 = v133;
  v115 = *(id *)(a1 + 32);
  v119 = v123;
  v107 = v7;
  v116 = v107;
  v120 = &v125;
  v121 = v141;
  v122 = v131;
  v108 = objc_retainBlock(v114);
  v109 = objc_retainBlock(v108);
  v110 = (void *)v126[5];
  v126[5] = (uint64_t)v109;

  if (v108)
    ((void (*)(_QWORD *))v108[2])(v108);

  _Block_object_dispose(v123, 8);
  _Block_object_dispose(&v125, 8);

  _Block_object_dispose(v131, 8);
  _Block_object_dispose(v133, 8);
  _Block_object_dispose(v135, 8);

  _Block_object_dispose(v141, 8);
}

void __45__MODaemonAnalyticsManager_initWithUniverse___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id os_log;
  NSObject *v15;
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
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  int v34;
  int v35;
  int v36;
  dispatch_time_t v37;
  _QWORD block[5];
  uint8_t buf[4];
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;

  if (*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) > 4)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
    v15 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      __45__MODaemonAnalyticsManager_initWithUniverse___block_invoke_2_cold_1(a1, v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "optInDNU"));
    if (v16)
    {
      v17 = *(void **)(a1 + 40);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "optInDNU"));
      objc_msgSend(v17, "setObject:forKey:", v18, CFSTR("optInDNU"));

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "optInIHA"));

    if (v19)
    {
      v20 = *(void **)(a1 + 40);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "optInIHA"));
      objc_msgSend(v20, "setObject:forKey:", v21, CFSTR("optInIHA"));

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateOnCharger"));

    if (!v22)
      goto LABEL_16;
    goto LABEL_15;
  }
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "optInDNU"));
  if (v2)
  {
    v3 = (void *)v2;
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "optInIHA"));
    if (v4)
    {
      v5 = (void *)v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateOnCharger"));

      if (v6)
      {
        v7 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
        v8 = objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v9 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
          *(_DWORD *)buf = 67109120;
          v40 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Darwin properties are all set for block ID: %u. Sending payload to CoreAnalytics!", buf, 8u);
        }

        v10 = *(void **)(a1 + 40);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "optInDNU"));
        objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("optInDNU"));

        v12 = *(void **)(a1 + 40);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "optInIHA"));
        objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("optInIHA"));

LABEL_15:
        v23 = *(void **)(a1 + 40);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateOnCharger"));
        objc_msgSend(v23, "setObject:forKey:", v24, CFSTR("stateOnCharger"));

LABEL_16:
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateUnlocked"));

        if (v25)
        {
          v26 = *(void **)(a1 + 40);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateUnlocked"));
          objc_msgSend(v26, "setObject:forKey:", v27, CFSTR("stateUnlocked"));

        }
        objc_msgSend(*(id *)(a1 + 32), "sendDataToCoreAnalytics:", *(_QWORD *)(a1 + 40));
        v28 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v29 = *(void **)(v28 + 40);
        *(_QWORD *)(v28 + 40) = 0;

        v30 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
        v31 = *(NSObject **)(v30 + 40);
        *(_QWORD *)(v30 + 40) = 0;
        goto LABEL_23;
      }
    }
    else
    {

    }
  }
  v32 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    v34 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    v35 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v36 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    *(_DWORD *)buf = 67109632;
    v40 = v34;
    v41 = 1024;
    v42 = v35;
    v43 = 1024;
    v44 = v36;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Darwin properties are not all set, scheduling a delay for %i seconds. This happened %i time(s) before for block ID: %u.", buf, 0x14u);
  }

  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v37 = dispatch_time(0, 1000000000 * *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24));
  v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __45__MODaemonAnalyticsManager_initWithUniverse___block_invoke_66;
  block[3] = &unk_1002AF360;
  block[4] = *(_QWORD *)(a1 + 72);
  dispatch_after(v37, v31, block);
LABEL_23:

}

void __45__MODaemonAnalyticsManager_initWithUniverse___block_invoke_66(uint64_t a1)
{
  void (**v1)(void);
  void (**v2)(void);

  v1 = (void (**)(void))objc_retainBlock(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  if (v1)
  {
    v2 = v1;
    v1[2]();
    v1 = v2;
  }

}

- (id)checkTriggerSuccess:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("resultWorkoutsSuccess")));
  if (!objc_msgSend(v4, "BOOLValue"))
    goto LABEL_24;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("resultMindfulSessionsSuccess")));
  if (!objc_msgSend(v5, "BOOLValue"))
  {
LABEL_23:

LABEL_24:
    goto LABEL_25;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("resultVisitsSuccess")));
  if (!objc_msgSend(v6, "BOOLValue"))
  {
LABEL_22:

    goto LABEL_23;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("resultVisitsTrainingSuccess")));
  if (!objc_msgSend(v7, "BOOLValue"))
  {
LABEL_21:

    goto LABEL_22;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("resultPhotosSuccess")));
  if (!objc_msgSend(v8, "BOOLValue"))
  {
LABEL_20:

    goto LABEL_21;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("resultSharedPhotosSuccess")));
  if (!objc_msgSend(v9, "BOOLValue"))
  {
LABEL_19:

    goto LABEL_20;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("resultTopicsSuccess")));
  if (!objc_msgSend(v10, "BOOLValue"))
  {
LABEL_18:

    goto LABEL_19;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("resultSharedSuccess")));
  if (!objc_msgSend(v11, "BOOLValue"))
  {
LABEL_17:

    goto LABEL_18;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("resultSuggestedSuccess")));
  if (!objc_msgSend(v12, "BOOLValue"))
  {
LABEL_16:

    goto LABEL_17;
  }
  v22 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("resultTripsSuccess")));
  if (!objc_msgSend(v13, "BOOLValue"))
  {

    v12 = v22;
    goto LABEL_16;
  }
  v21 = v13;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("resultMusicSuccess")));
  if (objc_msgSend(v20, "BOOLValue"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("resultContactsSuccess")));
    if (objc_msgSend(v19, "BOOLValue"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("stateDatabaseAvailable")));
      if (objc_msgSend(v18, "BOOLValue"))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("resultLifeEventsSuccess")));
        v14 = objc_msgSend(v17, "BOOLValue");

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  if ((v14 & 1) != 0)
  {
    v15 = &__kCFBooleanTrue;
    goto LABEL_26;
  }
LABEL_25:
  v15 = &__kCFBooleanFalse;
LABEL_26:

  return v15;
}

- (id)calculateDeltaTime:(id)a3 fromPreviousTime:(id)a4 withBinArray:(id)a5
{
  id v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id os_log;
  NSObject *v21;
  void *v22;
  const __CFString *v23;
  SEL v24;
  MODaemonAnalyticsManager *v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  uint8_t v30[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[MODaemonAnalyticsManager calculateDeltaTime:fromPreviousTime:withBinArray:].cold.1();

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v18 = v22;
    v23 = CFSTR("Invalid parameter not satisfying: currentTime != nil");
    v24 = a2;
    v25 = self;
    v26 = 400;
    goto LABEL_14;
  }
  if (!v10)
  {
    v27 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[MODaemonAnalyticsManager calculateDeltaTime:fromPreviousTime:withBinArray:].cold.2();

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v18 = v22;
    v23 = CFSTR("Invalid parameter not satisfying: lastTime != nil");
    v24 = a2;
    v25 = self;
    v26 = 401;
LABEL_14:
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", v24, v25, CFSTR("MODaemonAnalyticsManager.m"), v26, v23);
    v19 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v9, "doubleValue");
  v13 = v12;
  objc_msgSend(v10, "doubleValue");
  v15 = v13 - v14;
  if (v15 < 0.0)
  {
    v16 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Time of previous trigger is after the current time.", v30, 2u);
    }

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v18, v11));
LABEL_15:

  return v19;
}

- (id)readPersistenceTable:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id os_log;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  uint64_t v25;
  id v26;
  uint8_t buf[4];
  const __CFString *v28;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      v28 = CFSTR("daemonTriggerPersistence.plist");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "File %@ found.", buf, 0xCu);
    }

    v26 = 0;
    v10 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfURL:error:", v3, &v26);
    v11 = v26;
    if (v11)
    {
      v12 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[MODaemonAnalyticsManager readPersistenceTable:].cold.2((uint64_t)v11, v13, v14, v15, v16, v17, v18, v19);

      v25 = 0;
      objc_msgSend(v4, "removeItemAtURL:error:", v3, &v25);
      if (v25)
      {
        v20 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[MODaemonAnalyticsManager readPersistenceTable:].cold.1();

      }
      v22 = objc_alloc_init((Class)NSDictionary);
    }
    else
    {
      v22 = v10;
    }
    v23 = v22;

  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "No plist found at path.", buf, 2u);
    }

    v23 = objc_alloc_init((Class)NSDictionary);
  }

  return v23;
}

- (void)persistDaemonMetrics:(id)a3 withData:(id)a4
{
  unsigned __int8 v4;
  NSObject *v5;
  id os_log;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t v16[8];
  id v17;

  if (a3)
  {
    v17 = 0;
    v4 = objc_msgSend(a4, "writeToURL:error:", a3, &v17);
    v5 = v17;
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
    v7 = objc_claimAutoreleasedReturnValue(os_log);
    v8 = v7;
    if (v5 || (v4 & 1) == 0)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[MODaemonAnalyticsManager persistDaemonMetrics:withData:].cold.2((uint64_t)v5, v8, v10, v11, v12, v13, v14, v15);
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "daemon metrics were successfully written to plist.", v16, 2u);
    }

  }
  else
  {
    v9 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
    v5 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[MODaemonAnalyticsManager persistDaemonMetrics:withData:].cold.1();
  }

}

- (id)getDaemonPlistFileURL
{
  void *v2;
  void *v3;
  void *v4;
  id os_log;
  NSObject *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MOPersistenceManager userCacheDirectoryPath](MOPersistenceManager, "userCacheDirectoryPath"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v2, 1));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("daemonTriggerPersistence.plist")));

  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MODaemonAnalyticsManager getDaemonPlistFileURL].cold.1();

    v4 = 0;
  }

  return v4;
}

- (void)sendDataToCoreAnalytics:(id)a3
{
  id v3;
  _QWORD v4[4];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __52__MODaemonAnalyticsManager_sendDataToCoreAnalytics___block_invoke;
  v4[3] = &unk_1002B2788;
  v5 = a3;
  v3 = v5;
  AnalyticsSendEventLazy(CFSTR("com.apple.Moments.Daemon"), v4);

}

id __52__MODaemonAnalyticsManager_sendDataToCoreAnalytics___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSNumber)optInDNU
{
  return self->_optInDNU;
}

- (void)setOptInDNU:(id)a3
{
  objc_storeStrong((id *)&self->_optInDNU, a3);
}

- (NSNumber)optInIHA
{
  return self->_optInIHA;
}

- (void)setOptInIHA:(id)a3
{
  objc_storeStrong((id *)&self->_optInIHA, a3);
}

- (NSNumber)stateOnCharger
{
  return self->_stateOnCharger;
}

- (void)setStateOnCharger:(id)a3
{
  objc_storeStrong((id *)&self->_stateOnCharger, a3);
}

- (NSNumber)stateUnlocked
{
  return self->_stateUnlocked;
}

- (void)setStateUnlocked:(id)a3
{
  objc_storeStrong((id *)&self->_stateUnlocked, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateUnlocked, 0);
  objc_storeStrong((id *)&self->_stateOnCharger, 0);
  objc_storeStrong((id *)&self->_optInIHA, 0);
  objc_storeStrong((id *)&self->_optInDNU, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithUniverse:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: darwinNotifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
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
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: eventRefreshSchedulerNotifier", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: daemonClientNotifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __45__MODaemonAnalyticsManager_initWithUniverse___block_invoke_58_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Unexpected error: plist did not have last launch time.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __45__MODaemonAnalyticsManager_initWithUniverse___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];

  v2 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Giving up waiting - darwin property(s) not set for block ID: %u. Sending to CoreAnalytics with missing field(s)", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_2_2();
}

- (void)calculateDeltaTime:fromPreviousTime:withBinArray:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: currentTime != nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)calculateDeltaTime:fromPreviousTime:withBinArray:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: lastTime != nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)readPersistenceTable:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Could not delete plist file.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)readPersistenceTable:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "Could not read to the daemon analytics plist file, error: %@", a5, a6, a7, a8, 2u);
}

- (void)persistDaemonMetrics:withData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "invalid path for daemon plist file.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)persistDaemonMetrics:(uint64_t)a3 withData:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "couldn't write to the daemon metrics plist file, %@", a5, a6, a7, a8, 2u);
}

- (void)getDaemonPlistFileURL
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "failed to get cache directory to store collection date plist file, nil cache directory.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

@end
