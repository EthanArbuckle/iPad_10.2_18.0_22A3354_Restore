@implementation SAServiceManager

- (void)ingestTAEvent:(id)a3
{
  id v4;
  SAService *service;
  BOOL v6;
  char isKindOfClass;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  service = self->_service;
  v18 = v4;
  if (service)
  {
    -[SAService ingestTAEvent:](service, "ingestTAEvent:", v4);
    v6 = -[SAServiceManager hasAttemptedToIngestLastVisitAtStartup](self, "hasAttemptedToIngestLastVisitAtStartup");
    v4 = v18;
    if (!v6)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v4 = v18;
      if ((isKindOfClass & 1) != 0)
      {
        v8 = v18;
        if (objc_msgSend(v8, "systemStateType") == 11 && objc_msgSend(v8, "isOn"))
        {
          -[SAServiceManager _fetchAndIngestLastVisit](self, "_fetchAndIngestLastVisit");
          -[SAServiceManager setHasAttemptedToIngestLastVisitAtStartup:](self, "setHasAttemptedToIngestLastVisitAtStartup:", 1);
        }

        v4 = v18;
      }
    }
  }
  objc_msgSend(v4, "getDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAServiceManager nextAnalyticsSubmission](self, "nextAnalyticsSubmission");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", v10);
  v12 = v11;

  if (v12 >= 0.0)
  {
    -[SAServiceManager analytics](self, "analytics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "submitDefaultAlertRateEvent");

    -[SAServiceManager analytics](self, "analytics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "publishAndResetAggregation");

    v15 = objc_alloc(MEMORY[0x1E0C99D68]);
    -[SAServiceManager analytics](self, "analytics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "publishingInterval");
    v17 = (void *)objc_msgSend(v15, "initWithTimeIntervalSinceNow:");
    -[SAServiceManager setNextAnalyticsSubmission:](self, "setNextAnalyticsSubmission:", v17);

  }
}

- (NSDate)nextAnalyticsSubmission
{
  return self->_nextAnalyticsSubmission;
}

- (BOOL)hasAttemptedToIngestLastVisitAtStartup
{
  return self->_hasAttemptedToIngestLastVisitAtStartup;
}

- (SAServiceManager)initWithQueue:(id)a3
{
  id v5;
  SAServiceManager *v6;
  SAAudioAccessory *v7;
  SAAudioAccessory *audioAcccessory;
  uint64_t v9;
  NSHashTable *clients;
  SAAnalytics *v11;
  SAAnalyticsSettings *v12;
  uint64_t v13;
  SAAnalytics *analytics;
  id v15;
  void *v16;
  uint64_t v17;
  NSDate *nextAnalyticsSubmission;
  SAService *v19;
  void *v20;
  uint64_t v21;
  SAService *service;
  RTRoutineManager *v23;
  RTRoutineManager *routineManager;
  id scheduledMetricSubmissionBlock;
  uint64_t v26;
  SPOwnerSession *ownerSession;
  id v28;
  uint64_t v29;
  SPSeparationMonitoringProtocol *separationMonitoringSession;
  uint64_t v31;
  SAServiceManager *v32;
  void *v33;
  void *v34;
  SPSeparationMonitoringProtocol *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  SPSeparationMonitoringProtocol *v40;
  void *v41;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, void *);
  void *v46;
  SAServiceManager *v47;
  _QWORD v48[4];
  SAServiceManager *v49;
  objc_super v50;

  v5 = a3;
  v50.receiver = self;
  v50.super_class = (Class)SAServiceManager;
  v6 = -[SAServiceManager init](&v50, sel_init);
  if (v6)
  {
    TARegisterLogs();
    objc_storeStrong((id *)&v6->_queue, a3);
    v7 = -[SAAudioAccessory initWithQueue:]([SAAudioAccessory alloc], "initWithQueue:", v5);
    audioAcccessory = v6->_audioAcccessory;
    v6->_audioAcccessory = v7;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v9 = objc_claimAutoreleasedReturnValue();
    clients = v6->_clients;
    v6->_clients = (NSHashTable *)v9;

    v11 = [SAAnalytics alloc];
    v12 = -[SAAnalyticsSettings initWithEnableSubmission:]([SAAnalyticsSettings alloc], "initWithEnableSubmission:", 1);
    v13 = -[SAAnalytics initWithSettings:](v11, "initWithSettings:", v12);
    analytics = v6->_analytics;
    v6->_analytics = (SAAnalytics *)v13;

    v15 = objc_alloc(MEMORY[0x1E0C99D68]);
    -[SAServiceManager analytics](v6, "analytics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "publishingInterval");
    v17 = objc_msgSend(v15, "initWithTimeIntervalSinceNow:");
    nextAnalyticsSubmission = v6->_nextAnalyticsSubmission;
    v6->_nextAnalyticsSubmission = (NSDate *)v17;

    v19 = [SAService alloc];
    -[SAServiceManager analytics](v6, "analytics");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[SAService initWithAnalytics:isReplay:audioAccessoryManager:](v19, "initWithAnalytics:isReplay:audioAccessoryManager:", v20, 0, v6->_audioAcccessory);
    service = v6->_service;
    v6->_service = (SAService *)v21;

    -[SAService addClient:](v6->_service, "addClient:", v6);
    v23 = (RTRoutineManager *)objc_alloc_init(MEMORY[0x1E0D18460]);
    routineManager = v6->_routineManager;
    v6->_routineManager = v23;

    *(_WORD *)&v6->_hasAttemptedToIngestLastVisitAtStartup = 256;
    v6->_beaconGroupSafeLocationsMatch = 1;
    scheduledMetricSubmissionBlock = v6->_scheduledMetricSubmissionBlock;
    v6->_scheduledMetricSubmissionBlock = 0;

    v26 = objc_opt_new();
    ownerSession = v6->_ownerSession;
    v6->_ownerSession = (SPOwnerSession *)v26;

    v28 = objc_alloc_init(MEMORY[0x1E0D89920]);
    objc_msgSend(v28, "performSelector:", sel_separationMonitoringSession);
    v29 = objc_claimAutoreleasedReturnValue();
    separationMonitoringSession = v6->_separationMonitoringSession;
    v6->_separationMonitoringSession = (SPSeparationMonitoringProtocol *)v29;

    v31 = MEMORY[0x1E0C809B0];
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __34__SAServiceManager_initWithQueue___block_invoke;
    v48[3] = &unk_1E83D11C0;
    v32 = v6;
    v49 = v32;
    v33 = (void *)MEMORY[0x1CAA498D4](v48);
    v43 = v31;
    v44 = 3221225472;
    v45 = __34__SAServiceManager_initWithQueue___block_invoke_3;
    v46 = &unk_1E83D11C0;
    v47 = v32;
    v34 = (void *)MEMORY[0x1CAA498D4](&v43);
    v35 = v6->_separationMonitoringSession;
    v39 = (void *)MEMORY[0x1CAA498D4](v34, v36, v37, v38);
    -[SPSeparationMonitoringProtocol performSelector:withObject:](v35, "performSelector:withObject:", sel_startRefreshingSafeLocationWithBlock_, v39, v43, v44, v45, v46);

    v40 = v6->_separationMonitoringSession;
    v41 = (void *)MEMORY[0x1CAA498D4](v33);
    -[SPSeparationMonitoringProtocol performSelector:withObject:](v40, "performSelector:withObject:", sel_startRefreshingBeaconsForSeparationMonitoringWithBlock_, v41);

  }
  return v6;
}

void __34__SAServiceManager_initWithQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__SAServiceManager_initWithQueue___block_invoke_2;
  v6[3] = &unk_1E83D1198;
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __34__SAServiceManager_initWithQueue___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didFetchAllDevices:", *(_QWORD *)(a1 + 40));
}

void __34__SAServiceManager_initWithQueue___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__SAServiceManager_initWithQueue___block_invoke_4;
  v6[3] = &unk_1E83D1198;
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __34__SAServiceManager_initWithQueue___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didFetchAllSafeLocations:", *(_QWORD *)(a1 + 40));
}

- (void)dealloc
{
  SPSeparationMonitoringProtocol *separationMonitoringSession;
  SPOwnerSession *ownerSession;
  objc_super v5;

  -[SAService removeClient:](self->_service, "removeClient:", self);
  separationMonitoringSession = self->_separationMonitoringSession;
  self->_separationMonitoringSession = 0;

  ownerSession = self->_ownerSession;
  self->_ownerSession = 0;

  v5.receiver = self;
  v5.super_class = (Class)SAServiceManager;
  -[SAServiceManager dealloc](&v5, sel_dealloc);
}

- (void)addClient:(id)a3
{
  -[NSHashTable addObject:](self->_clients, "addObject:", a3);
}

- (void)removeClient:(id)a3
{
  -[NSHashTable removeObject:](self->_clients, "removeObject:", a3);
}

+ (unint64_t)convertBeaconToDeviceType:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  char v7;
  NSObject *v8;

  v3 = a3;
  objc_msgSend(v3, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0D89A68]) & 1) != 0)
  {
    v5 = 2;
  }
  else if ((objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0D89A60]) & 1) != 0)
  {
    v5 = 4;
  }
  else if ((objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0D89A70]) & 1) != 0)
  {
    v5 = 16;
  }
  else
  {
    objc_msgSend(v3, "model");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("Watch"));

    if ((v7 & 1) != 0)
    {
      v5 = 8;
    }
    else if ((objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0D89A88]) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      v8 = TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT))
        +[SAServiceManager convertBeaconToDeviceType:].cold.1((uint64_t)v4, v8);
      v5 = 0;
    }
  }

  return v5;
}

+ (unint64_t)convertCLReferenceFrameToSAReferenceFrame:(int)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

- (void)didFetchAllSafeLocations:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  SASafeLocation *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  SASafeLocationsEvent *v37;
  void *v38;
  SASafeLocationsEvent *v39;
  void *v40;
  NSObject *v41;
  int v42;
  void *v43;
  uint64_t v45;
  id v46;
  id v47;
  uint64_t v48;
  SASafeLocation *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  int v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v47 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v50, v70, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v51;
    v45 = *(_QWORD *)v51;
    v46 = v4;
    do
    {
      v8 = 0;
      v48 = v6;
      do
      {
        if (*(_QWORD *)v51 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v8);
        if (objc_msgSend(v9, "approvalState") == 1)
        {
          v49 = [SASafeLocation alloc];
          objc_msgSend(v9, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "location");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "coordinate");
          v13 = v12;
          objc_msgSend(v9, "location");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "coordinate");
          v16 = v15;
          objc_msgSend(v9, "location");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "horizontalAccuracy");
          v19 = v18;
          objc_msgSend(v9, "location");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = +[SAServiceManager convertCLReferenceFrameToSAReferenceFrame:](SAServiceManager, "convertCLReferenceFrameToSAReferenceFrame:", objc_msgSend(v20, "referenceFrame"));
          objc_msgSend(v9, "name");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[SASafeLocation initWithLocationUUID:latitude:longitude:radius:referenceFrame:name:date:](v49, "initWithLocationUUID:latitude:longitude:radius:referenceFrame:name:date:", v10, v21, v22, v23, v13, v16, v19);

          objc_msgSend(v9, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setObject:forKeyedSubscript:", v24, v25);

          v26 = (void *)TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
          {
            v27 = v26;
            -[SASafeLocation identifier](v24, "identifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[SASafeLocation name](v24, "name");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[SASafeLocation latitude](v24, "latitude");
            v31 = v30;
            -[SASafeLocation longitude](v24, "longitude");
            v33 = v32;
            -[SASafeLocation radius](v24, "radius");
            v35 = v34;
            v36 = -[SASafeLocation referenceFrame](v24, "referenceFrame");
            *(_DWORD *)buf = 68290563;
            v55 = 0;
            v56 = 2082;
            v57 = "";
            v58 = 2113;
            v59 = v28;
            v60 = 2113;
            v61 = v29;
            v62 = 2049;
            v63 = v31;
            v64 = 2049;
            v65 = v33;
            v66 = 2050;
            v67 = v35;
            v68 = 2049;
            v69 = v36;
            _os_log_impl(&dword_1CA04F000, v27, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa ServiceMgr FetchSafe\", \"uuid\":\"%{private}@\", \"name\":\"%{private}@\", \"lat\":\"%{private}f\", \"lon\":\"%{private}f\", \"radius\":\"%{public}f\", \"refFrame\":%{private}lu}", buf, 0x4Eu);

          }
          v7 = v45;
          v4 = v46;
          v6 = v48;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v50, v70, 16);
    }
    while (v6);
  }

  v37 = [SASafeLocationsEvent alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[SASafeLocationsEvent initWithSafeLocations:date:](v37, "initWithSafeLocations:date:", v47, v38);

  -[SAServiceManager ingestTAEvent:](self, "ingestTAEvent:", v39);
  v40 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v41 = v40;
    v42 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 67240192;
    v55 = v42;
    _os_log_impl(&dword_1CA04F000, v41, OS_LOG_TYPE_DEFAULT, "#sa ServiceMgr endFetchSafe, %{public}d", buf, 8u);

  }
  -[SAServiceManager analytics](self, "analytics");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addSafeLocationFetchResultCount:", objc_msgSend(v4, "count"));

}

- (void)didFetchAllDevices:(id)a3
{
  id v3;
  id v4;
  BOOL v5;
  uint64_t v6;
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
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  void *v27;
  void *v28;
  SPOwnerSession *ownerSession;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  SASafeLocation *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  unint64_t v49;
  void *v50;
  void *v51;
  SASafeLocation *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  char *v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  char *v72;
  id v73;
  uint64_t v74;
  void *v75;
  int v76;
  void *v77;
  int v78;
  void *v79;
  int v80;
  void *v81;
  int v82;
  void *v83;
  int v84;
  uint64_t v85;
  SASafeLocationsEvent *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  NSObject *v90;
  int v91;
  void *v92;
  SADevicesWithSafeLocationsEvent *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  NSObject *v97;
  int v98;
  void *v99;
  uint64_t i;
  void *v101;
  void *v102;
  NSObject *v103;
  uint64_t v104;
  char *v105;
  const char *v106;
  _BOOL4 v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  int v112;
  void *v113;
  const char *v114;
  void *v115;
  NSObject *v116;
  char *v117;
  uint64_t v118;
  void *v119;
  id v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t j;
  void *v125;
  void *v126;
  void *v127;
  NSObject *v128;
  char *v129;
  void *v130;
  NSObject *v131;
  const char *v132;
  _BOOL4 v133;
  const char *v134;
  uint64_t v135;
  int v136;
  int v137;
  int v138;
  int v139;
  uint64_t v140;
  int v141;
  int v142;
  int v143;
  uint64_t v144;
  id obj;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  int v150;
  id v151;
  id v152;
  uint64_t v153;
  id v154;
  uint64_t v155;
  void *v156;
  BOOL v157;
  SADevice *v158;
  void *v159;
  void *v160;
  id v161;
  uint64_t v162;
  uint64_t v163;
  id v164;
  uint64_t v165;
  id v166;
  id v167;
  id v168;
  id v169;
  id v170;
  id v171;
  SADevice *v172;
  void *v173;
  void *v174;
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
  _QWORD v187[5];
  SADevice *v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  _BYTE v193[128];
  uint8_t v194[128];
  uint8_t buf[4];
  int v196;
  __int16 v197;
  const char *v198;
  __int16 v199;
  void *v200;
  __int16 v201;
  uint64_t v202;
  __int16 v203;
  const char *v204;
  __int16 v205;
  const char *v206;
  __int16 v207;
  uint64_t v208;
  __int16 v209;
  uint64_t v210;
  __int16 v211;
  uint64_t v212;
  _BYTE v213[128];
  _BYTE v214[128];
  uint64_t v215;

  v215 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v152 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v161 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v154 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v151 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v189 = 0u;
  v190 = 0u;
  v191 = 0u;
  v192 = 0u;
  obj = v3;
  v149 = v4;
  v153 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v189, v214, 16);
  if (v153)
  {
    v141 = 0;
    v142 = 0;
    v136 = 0;
    v137 = 0;
    v138 = 0;
    v139 = 0;
    v143 = 0;
    v150 = 0;
    v148 = *(_QWORD *)v190;
    v147 = *MEMORY[0x1E0D89A68];
    v144 = *MEMORY[0x1E0D89A60];
    v140 = *MEMORY[0x1E0D89A70];
    v5 = 1;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v190 != v148)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v189 + 1) + 8 * v6);
        objc_msgSend(v7, "groupIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v160 = v7;
        if (v8)
        {
          objc_msgSend(v7, "groupIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            objc_msgSend(v7, "groupIdentifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "objectForKeyedSubscript:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v7, "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v13);

          }
          else
          {
            v14 = (void *)MEMORY[0x1E0C99E20];
            objc_msgSend(v7, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setWithObject:", v15);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v7, "groupIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v16);

        }
        objc_msgSend(v7, "type");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqual:", v147);

        v157 = v5;
        v155 = v6;
        if (v18)
        {
          ++v150;
        }
        else
        {
          objc_msgSend(v7, "type");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = objc_msgSend(v75, "isEqual:", v144);

          if (v76)
          {
            if (objc_msgSend(v7, "isAppleAudioAccessory"))
              ++v141;
            else
              ++v142;
          }
          else
          {
            objc_msgSend(v7, "type");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = objc_msgSend(v77, "isEqual:", v140);

            if (v78)
            {
              ++v143;
            }
            else
            {
              objc_msgSend(v7, "model");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              v80 = objc_msgSend(v79, "hasPrefix:", CFSTR("iPhone"));

              if (v80)
              {
                ++v139;
              }
              else
              {
                objc_msgSend(v7, "model");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                v82 = objc_msgSend(v81, "hasPrefix:", CFSTR("iPad"));

                if (v82)
                {
                  ++v138;
                }
                else
                {
                  objc_msgSend(v7, "model");
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  v84 = objc_msgSend(v83, "hasPrefix:", CFSTR("MacBook"));

                  if (v84)
                    ++v136;
                  else
                    ++v137;
                }
              }
            }
          }
        }
        v172 = [SADevice alloc];
        objc_msgSend(v7, "identifier");
        v169 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "groupIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v166 = (id)objc_msgSend(v7, "partIdentifier");
        objc_msgSend(v7, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "model");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "systemVersion");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v7, "vendorId");
        v24 = objc_msgSend(v7, "productId");
        v25 = +[SAServiceManager convertBeaconToDeviceType:](SAServiceManager, "convertBeaconToDeviceType:", v7);
        v26 = objc_msgSend(v7, "isAppleAudioAccessory");
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        BYTE1(v135) = v26;
        LOBYTE(v135) = 1;
        v158 = -[SADevice initWithDeviceUUID:groupIdentifier:macAddress:partIdentifier:name:model:systemVersion:vendorId:productId:deviceType:notifyEnabled:isAppleAudioAccessory:date:](v172, "initWithDeviceUUID:groupIdentifier:macAddress:partIdentifier:name:model:systemVersion:vendorId:productId:deviceType:notifyEnabled:isAppleAudioAccessory:date:", v169, v19, 0, v166, v20, v21, v22, v23, v24, v25, v135, v27);

        if (objc_msgSend(v7, "isAppleAudioAccessory"))
        {
          objc_msgSend(v7, "groupIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            ownerSession = self->_ownerSession;
            objc_msgSend(v7, "groupIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v187[0] = MEMORY[0x1E0C809B0];
            v187[1] = 3221225472;
            v187[2] = __39__SAServiceManager_didFetchAllDevices___block_invoke;
            v187[3] = &unk_1E83D11E8;
            v187[4] = self;
            v188 = v158;
            -[SPOwnerSession beaconGroupForIdentifier:completion:](ownerSession, "beaconGroupForIdentifier:completion:", v30, v187);

          }
        }
        v31 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v183 = 0u;
        v184 = 0u;
        v185 = 0u;
        v186 = 0u;
        objc_msgSend(v7, "safeLocations");
        v170 = (id)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v183, v213, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v184;
          v162 = *(_QWORD *)v184;
          v164 = v31;
          do
          {
            v35 = 0;
            v167 = (id)v33;
            do
            {
              if (*(_QWORD *)v184 != v34)
                objc_enumerationMutation(v170);
              v36 = *(void **)(*((_QWORD *)&v183 + 1) + 8 * v35);
              objc_msgSend(v36, "identifier");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "addObject:", v37);

              if (objc_msgSend(v36, "approvalState") == 1)
              {
                v38 = [SASafeLocation alloc];
                objc_msgSend(v36, "identifier");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "location");
                v173 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v173, "coordinate");
                v41 = v40;
                objc_msgSend(v36, "location");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "coordinate");
                v44 = v43;
                objc_msgSend(v36, "location");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "horizontalAccuracy");
                v47 = v46;
                objc_msgSend(v36, "location");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v49 = +[SAServiceManager convertCLReferenceFrameToSAReferenceFrame:](SAServiceManager, "convertCLReferenceFrameToSAReferenceFrame:", objc_msgSend(v48, "referenceFrame"));
                objc_msgSend(v36, "name");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99D68], "now");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = -[SASafeLocation initWithLocationUUID:latitude:longitude:radius:referenceFrame:name:date:](v38, "initWithLocationUUID:latitude:longitude:radius:referenceFrame:name:date:", v39, v49, v50, v51, v41, v44, v47);

                objc_msgSend(v36, "identifier");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v161, "setObject:forKeyedSubscript:", v52, v53);

                v54 = (void *)TASALog;
                if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
                {
                  v55 = v54;
                  objc_msgSend(v160, "identifier");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SASafeLocation identifier](v52, "identifier");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SASafeLocation name](v52, "name");
                  v58 = (char *)objc_claimAutoreleasedReturnValue();
                  -[SASafeLocation latitude](v52, "latitude");
                  v60 = v59;
                  -[SASafeLocation longitude](v52, "longitude");
                  v62 = v61;
                  -[SASafeLocation radius](v52, "radius");
                  v64 = v63;
                  v65 = -[SASafeLocation referenceFrame](v52, "referenceFrame");
                  *(_DWORD *)buf = 68290819;
                  v196 = 0;
                  v197 = 2082;
                  v198 = "";
                  v199 = 2113;
                  v200 = v56;
                  v201 = 2113;
                  v202 = (uint64_t)v57;
                  v203 = 2113;
                  v204 = v58;
                  v205 = 2049;
                  v206 = v60;
                  v207 = 2049;
                  v208 = v62;
                  v209 = 2050;
                  v210 = v64;
                  v211 = 2049;
                  v212 = v65;
                  _os_log_impl(&dword_1CA04F000, v55, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa ServiceMgr FetchSafeForBeacon\", \"device\":\"%{private}@\", \"uuid\":\"%{private}@\", \"name\":\"%{private}@\", \"lat\":\"%{private}f\", \"lon\":\"%{private}f\", \"radius\":\"%{public}f\", \"refFrame\":%{private}lu}", buf, 0x58u);

                }
                v34 = v162;
                v31 = v164;
                v33 = (uint64_t)v167;
              }
              ++v35;
            }
            while (v33 != v35);
            v33 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v183, v213, 16);
          }
          while (v33);
        }

        objc_msgSend(v160, "identifier");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v152, "setObject:forKeyedSubscript:", v158, v66);

        objc_msgSend(v160, "identifier");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v154, "setObject:forKeyedSubscript:", v31, v67);

        v68 = (void *)TASALog;
        if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
        {
          v69 = v68;
          objc_msgSend(v160, "name");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v160, "identifier");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v160, "type");
          v72 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 68290051;
          v196 = 0;
          v197 = 2082;
          v198 = "";
          v199 = 2113;
          v200 = v70;
          v201 = 2113;
          v202 = (uint64_t)v71;
          v203 = 2113;
          v204 = v72;
          v205 = 2113;
          v206 = (const char *)v31;
          _os_log_impl(&dword_1CA04F000, v69, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa ServiceMgr FetchAll\", \"name\":\"%{private}@\", \"device\":\"%{private}@\", \"type\":\"%{private}@\", \"safes\":\"%{private}@\"}", buf, 0x3Au);

        }
        v73 = (id)objc_msgSend(v151, "setByAddingObjectsFromSet:", v31);
        v4 = v149;
        if (v157)
        {
          v74 = objc_msgSend(v151, "count");
          v5 = v74 == objc_msgSend(v31, "count");
        }
        else
        {
          v5 = 0;
        }

        v6 = v155 + 1;
      }
      while (v155 + 1 != v153);
      v85 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v189, v214, 16);
      v153 = v85;
    }
    while (v85);
  }
  else
  {
    v141 = 0;
    v142 = 0;
    v136 = 0;
    v137 = 0;
    v138 = 0;
    v139 = 0;
    v143 = 0;
    v150 = 0;
    v5 = 1;
  }

  v86 = [SASafeLocationsEvent alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = -[SASafeLocationsEvent initWithSafeLocations:date:](v86, "initWithSafeLocations:date:", v161, v87);

  v159 = (void *)v88;
  -[SAServiceManager ingestTAEvent:](self, "ingestTAEvent:", v88);
  v89 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v90 = v89;
    v91 = objc_msgSend(v161, "count");
    *(_DWORD *)buf = 67240192;
    v196 = v91;
    _os_log_impl(&dword_1CA04F000, v90, OS_LOG_TYPE_DEFAULT, "#sa ServiceMgr endFetchBeaconsSafe, %{public}d", buf, 8u);

  }
  -[SAServiceManager analytics](self, "analytics");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "addSafeLocationFetchResultCount:", objc_msgSend(v161, "count"));

  v93 = [SADevicesWithSafeLocationsEvent alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = -[SADevicesWithSafeLocationsEvent initWithDevices:safeLocationUUIDs:date:](v93, "initWithDevices:safeLocationUUIDs:date:", v152, v154, v94);

  v156 = (void *)v95;
  -[SAServiceManager ingestTAEvent:](self, "ingestTAEvent:", v95);
  v96 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v97 = v96;
    v98 = objc_msgSend(obj, "count");
    *(_DWORD *)buf = 67240448;
    v196 = v98;
    v197 = 1026;
    LODWORD(v198) = 100 * v142 + 10000 * (v143 + v137) + v150;
    _os_log_impl(&dword_1CA04F000, v97, OS_LOG_TYPE_DEFAULT, "#sa ServiceMgr endFetchAll %{public}d, types, %{public}d", buf, 0xEu);

  }
  -[SAServiceManager analytics](self, "analytics");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v135) = v5;
  objc_msgSend(v99, "addDeviceFetchResultCount:type1count:type2count:type3count:type4count:type5count:type6count:type7count:type8count:safeCount:usingSameSafe:", objc_msgSend(obj, "count"), v150, v142, v143, v137, v139, v138, v136, v141, objc_msgSend(v151, "count"), v135);

  -[SAServiceManager setBeaconGroupComplete:](self, "setBeaconGroupComplete:", 1);
  -[SAServiceManager setBeaconGroupSafeLocationsMatch:](self, "setBeaconGroupSafeLocationsMatch:", 1);
  v181 = 0u;
  v182 = 0u;
  v179 = 0u;
  v180 = 0u;
  v168 = v149;
  v165 = objc_msgSend(v168, "countByEnumeratingWithState:objects:count:", &v179, v194, 16);
  if (v165)
  {
    v163 = *(_QWORD *)v180;
    while (2)
    {
      for (i = 0; i != v165; ++i)
      {
        if (*(_QWORD *)v180 != v163)
          objc_enumerationMutation(v168);
        v174 = *(void **)(*((_QWORD *)&v179 + 1) + 8 * i);
        objc_msgSend(v168, "objectForKeyedSubscript:");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = (void *)TASALog;
        if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
        {
          v103 = v102;
          v104 = objc_msgSend(v101, "count");
          objc_msgSend(v101, "description");
          v105 = (char *)objc_claimAutoreleasedReturnValue();
          if (-[SAServiceManager beaconGroupComplete](self, "beaconGroupComplete"))
            v106 = "YES";
          else
            v106 = "NO";
          v107 = -[SAServiceManager beaconGroupSafeLocationsMatch](self, "beaconGroupSafeLocationsMatch");
          *(_DWORD *)buf = 68290307;
          if (v107)
            v108 = "YES";
          else
            v108 = "NO";
          v196 = 0;
          v197 = 2082;
          v198 = "";
          v199 = 2113;
          v200 = v174;
          v201 = 2050;
          v202 = v104;
          v203 = 2113;
          v204 = v105;
          v205 = 2082;
          v206 = v106;
          v207 = 2082;
          v208 = (uint64_t)v108;
          _os_log_impl(&dword_1CA04F000, v103, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #beaconMonitoring for group\", \"groupIdentifier\":\"%{private}@\", \"beaconGroup.count\":%{public}lu, \"beacons\":\"%{private}@\", \"beaconGroupCompletePartialResult\":\"%{public}s\", \"safeLocationsMatchPartialResult\":\"%{public}s\"}", buf, 0x44u);

        }
        if (!-[SAServiceManager beaconGroupComplete](self, "beaconGroupComplete")
          && !-[SAServiceManager beaconGroupSafeLocationsMatch](self, "beaconGroupSafeLocationsMatch"))
        {
          goto LABEL_97;
        }
        objc_msgSend(v101, "anyObject");
        v109 = objc_claimAutoreleasedReturnValue();
        if (!v109)
        {
          -[SAServiceManager setBeaconGroupComplete:](self, "setBeaconGroupComplete:", 0);
          -[SAServiceManager setBeaconGroupSafeLocationsMatch:](self, "setBeaconGroupSafeLocationsMatch:", 0);
          v130 = (void *)TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
          {
            v131 = v130;
            if (-[SAServiceManager beaconGroupComplete](self, "beaconGroupComplete"))
              v132 = "YES";
            else
              v132 = "NO";
            v133 = -[SAServiceManager beaconGroupSafeLocationsMatch](self, "beaconGroupSafeLocationsMatch");
            *(_DWORD *)buf = 68289795;
            if (v133)
              v134 = "YES";
            else
              v134 = "NO";
            v196 = 0;
            v197 = 2082;
            v198 = "";
            v199 = 2113;
            v200 = v174;
            v201 = 2082;
            v202 = (uint64_t)v132;
            v203 = 2082;
            v204 = v134;
            _os_log_impl(&dword_1CA04F000, v131, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#sa #beaconMonitoring beacon group is empty\", \"groupIdentifier\":\"%{private}@\", \"beaconGroupComplete\":\"%{public}s\", \"safeLocationsMatch\":\"%{public}s\"}", buf, 0x30u);

          }
LABEL_97:

          goto LABEL_98;
        }
        v110 = (void *)v109;
        objc_msgSend(v152, "objectForKeyedSubscript:", v109);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = -[SAServiceManager beaconGroupSizeForDeviceType:isAppleAudioAccessory:](self, "beaconGroupSizeForDeviceType:isAppleAudioAccessory:", objc_msgSend(v111, "deviceType"), objc_msgSend(v111, "isAppleAudioAccessory"));
        if (objc_msgSend(v101, "count") != v112)
        {
          v113 = (void *)TASALog;
          if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
          {
            v114 = (const char *)v112;
            v115 = (void *)MEMORY[0x1E0CB37E8];
            v116 = v113;
            objc_msgSend(v115, "numberWithInteger:", objc_msgSend(v111, "deviceType"));
            v117 = (char *)objc_claimAutoreleasedReturnValue();
            v118 = objc_msgSend(v101, "count");
            *(_DWORD *)buf = 68290307;
            v196 = 0;
            v197 = 2082;
            v198 = "";
            v199 = 2113;
            v200 = v174;
            v201 = 2113;
            v202 = (uint64_t)v110;
            v203 = 2114;
            v204 = v117;
            v205 = 2050;
            v206 = v114;
            v207 = 2050;
            v208 = v118;
            _os_log_impl(&dword_1CA04F000, v116, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa #beaconMonitoring incorrect beacon group size\", \"groupIdentifier\":\"%{private}@\", \"beaconIdentifier\":\"%{private}@\", \"deviceType\":\"%{public}@\", \"expectedBeaconGroupSize\":%{public}lu, \"beaconGroup.count\":%{public}lu}", buf, 0x44u);

          }
          -[SAServiceManager setBeaconGroupComplete:](self, "setBeaconGroupComplete:", 0);
        }
        v171 = v111;
        objc_msgSend(v154, "objectForKeyedSubscript:", v110);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        v175 = 0u;
        v176 = 0u;
        v177 = 0u;
        v178 = 0u;
        v120 = v101;
        v121 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v175, v193, 16);
        if (v121)
        {
          v122 = v121;
          v123 = *(_QWORD *)v176;
          while (2)
          {
            for (j = 0; j != v122; ++j)
            {
              if (*(_QWORD *)v176 != v123)
                objc_enumerationMutation(v120);
              v125 = *(void **)(*((_QWORD *)&v175 + 1) + 8 * j);
              if (v125 != v110)
              {
                objc_msgSend(v154, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v175 + 1) + 8 * j));
                v126 = (void *)objc_claimAutoreleasedReturnValue();
                -[SAServiceManager setBeaconGroupSafeLocationsMatch:](self, "setBeaconGroupSafeLocationsMatch:", objc_msgSend(v119, "isEqualToSet:", v126));

                if (!-[SAServiceManager beaconGroupSafeLocationsMatch](self, "beaconGroupSafeLocationsMatch"))
                {
                  v127 = (void *)TASALog;
                  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
                  {
                    v128 = v127;
                    objc_msgSend(v154, "objectForKeyedSubscript:", v125);
                    v129 = (char *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 68290051;
                    v196 = 0;
                    v197 = 2082;
                    v198 = "";
                    v199 = 2113;
                    v200 = v174;
                    v201 = 2113;
                    v202 = (uint64_t)v125;
                    v203 = 2114;
                    v204 = (const char *)v119;
                    v205 = 2114;
                    v206 = v129;
                    _os_log_impl(&dword_1CA04F000, v128, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#sa #beaconMonitoring safe location mismatch\", \"groupIdentifier\":\"%{private}@\", \"beaconIdentifier\":\"%{private}@\", \"safelocationsBaseline\":\"%{public}@\", \"safelocationsCompared\":\"%{public}@\"}", buf, 0x3Au);

                  }
                  goto LABEL_86;
                }
              }
            }
            v122 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v175, v193, 16);
            if (v122)
              continue;
            break;
          }
        }
LABEL_86:

      }
      v165 = objc_msgSend(v168, "countByEnumeratingWithState:objects:count:", &v179, v194, 16);
      if (v165)
        continue;
      break;
    }
  }
LABEL_98:

  -[SAServiceManager scheduleBeaconGroupMetricSubmission](self, "scheduleBeaconGroupMetricSubmission");
}

void __39__SAServiceManager_didFetchAllDevices___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__SAServiceManager_didFetchAllDevices___block_invoke_2;
  v6[3] = &unk_1E83D1198;
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

void __39__SAServiceManager_didFetchAllDevices___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "macAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fm_hexString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = 68289539;
    v11[1] = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2113;
    v15 = v5;
    v16 = 2113;
    v17 = v7;
    _os_log_impl(&dword_1CA04F000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa ServiceMgr FetchBeaconGroup\", \"device\":\"%{private}@\", \"macAddress\":\"%{private}@\"}", (uint8_t *)v11, 0x26u);

  }
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "macAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fm_hexString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMacAddress:", v10);

}

- (void)scheduleBeaconGroupMetricSubmission
{
  void *v3;
  void *v4;
  dispatch_time_t v5;
  dispatch_block_t v6;
  id v7;
  _QWORD block[5];

  -[SAServiceManager scheduledMetricSubmissionBlock](self, "scheduledMetricSubmissionBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SAServiceManager scheduledMetricSubmissionBlock](self, "scheduledMetricSubmissionBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_block_cancel(v4);

    -[SAServiceManager setScheduledMetricSubmissionBlock:](self, "setScheduledMetricSubmissionBlock:", 0);
  }
  v5 = dispatch_time(0, 60000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__SAServiceManager_scheduleBeaconGroupMetricSubmission__block_invoke;
  block[3] = &unk_1E83D1210;
  block[4] = self;
  v6 = dispatch_block_create((dispatch_block_flags_t)0, block);
  dispatch_after(v5, (dispatch_queue_t)self->_queue, v6);
  -[SAServiceManager setScheduledMetricSubmissionBlock:](self, "setScheduledMetricSubmissionBlock:", v6);
  v7 = (id)MEMORY[0x1CAA498D4](v6);
  _Block_release(v7);

}

uint64_t __55__SAServiceManager_scheduleBeaconGroupMetricSubmission__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  const char *v5;
  int v6;
  const char *v7;
  void *v8;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    if (objc_msgSend(v3, "beaconGroupComplete"))
      v5 = "YES";
    else
      v5 = "NO";
    v6 = objc_msgSend(*(id *)(a1 + 32), "beaconGroupSafeLocationsMatch");
    LODWORD(v10) = 68289538;
    if (v6)
      v7 = "YES";
    else
      v7 = "NO";
    HIDWORD(v10) = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2082;
    v14 = v5;
    v15 = 2082;
    v16 = v7;
    _os_log_impl(&dword_1CA04F000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #beaconMonitoring timed-out submitting metrics\", \"beaconGroupComplete\":\"%{public}s\", \"beaconGroupSafeLocationsMatch\":\"%{public}s\"}", (uint8_t *)&v10, 0x26u);

  }
  objc_msgSend(*(id *)(a1 + 32), "analytics", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "submitBeaconMonitoringEvent:safeLocationsMatch:", objc_msgSend(*(id *)(a1 + 32), "beaconGroupComplete"), objc_msgSend(*(id *)(a1 + 32), "beaconGroupSafeLocationsMatch"));

  return objc_msgSend(*(id *)(a1 + 32), "setScheduledMetricSubmissionBlock:", 0);
}

- (int)beaconGroupSizeForDeviceType:(unint64_t)a3 isAppleAudioAccessory:(BOOL)a4
{
  int v4;
  int v5;

  if (a4)
    v4 = 3;
  else
    v4 = 1;
  if (a3 != 4)
    v4 = 0;
  if (a3 == 16)
    v5 = 2;
  else
    v5 = v4;
  if (a3 - 1 >= 2)
    return v5;
  else
    return 1;
}

- (void)_ingestVisit:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  CLLocationDegrees v8;
  void *v9;
  CLLocationDegrees v10;
  CLLocationCoordinate2D v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _DWORD v22[2];
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SAServiceManager service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "latitude");
    v8 = v7;
    objc_msgSend(v4, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "longitude");
    v11 = CLLocationCoordinate2DMake(v8, v10);

    v12 = objc_alloc(MEMORY[0x1E0DC0840]);
    objc_msgSend(v4, "location");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "horizontalUncertainty");
    v15 = v14;
    objc_msgSend(v4, "entry");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "exit");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v12, "initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:confidence:", v16, v17, v18, 2, v11.latitude, v11.longitude, v15);

    -[SAServiceManager service](self, "service");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "ingestTAEvent:", v19);

  }
  else
  {
    v21 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
      v22[0] = 68289026;
      v22[1] = 0;
      v23 = 2082;
      v24 = "";
      _os_log_impl(&dword_1CA04F000, v21, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#manager:visit not ingesting TAEvent as SA service is down\"}", (uint8_t *)v22, 0x12u);
    }
  }

}

- (void)_fetchAndIngestLastVisit
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = objc_alloc(MEMORY[0x1E0D18508]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D185C8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithAscending:confidence:dateInterval:labelVisit:limit:", 0, v4, 0, 1, &unk_1E83DB1D0);

  -[SAServiceManager routineManager](self, "routineManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SAServiceManager__fetchAndIngestLastVisit__block_invoke;
  v7[3] = &unk_1E83D1288;
  v7[4] = self;
  objc_msgSend(v6, "fetchStoredVisitsWithOptions:handler:", v5, v7);

}

void __44__SAServiceManager__fetchAndIngestLastVisit__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SAServiceManager__fetchAndIngestLastVisit__block_invoke_2;
  v7[3] = &unk_1E83D1198;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

void __44__SAServiceManager__fetchAndIngestLastVisit__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2 && objc_msgSend(v2, "count"))
  {
    v3 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 68289283;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v24 = 2113;
      v25 = v4;
      _os_log_impl(&dword_1CA04F000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:visit got last visit\", \"visits\":\"%{private}@\"}", buf, 0x1Cu);
    }
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
      goto LABEL_16;
    objc_msgSend(v5, "entry");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_16;
    v8 = (void *)v7;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v10);
    if (v11 <= 0.0)
    {

    }
    else
    {
      objc_msgSend(v6, "location");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
LABEL_16:

        return;
      }
      objc_msgSend(v6, "placeInference");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "loiIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 && (objc_msgSend(v6, "exit"), v14 = (void *)objc_claimAutoreleasedReturnValue(), v14, !v14))
      {
        objc_msgSend(*(id *)(a1 + 40), "routineManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __44__SAServiceManager__fetchAndIngestLastVisit__block_invoke_40;
        v17[3] = &unk_1E83D1260;
        v17[4] = *(_QWORD *)(a1 + 40);
        v18 = v6;
        v19 = v8;
        objc_msgSend(v16, "fetchLocationOfInterestWithIdentifier:withHandler:", v19, v17);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "_ingestVisit:", v6);
      }
    }

    goto LABEL_16;
  }
  v15 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v21 = 0;
    v22 = 2082;
    v23 = "";
    _os_log_impl(&dword_1CA04F000, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:visit no last visit to bootstrap onto\"}", buf, 0x12u);
  }
}

void __44__SAServiceManager__fetchAndIngestLastVisit__block_invoke_40(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SAServiceManager__fetchAndIngestLastVisit__block_invoke_2_41;
  block[3] = &unk_1E83D1238;
  v13 = v6;
  v8 = a1[5];
  v9 = a1[4];
  v14 = v8;
  v15 = v9;
  v16 = v5;
  v17 = a1[6];
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, block);

}

void __44__SAServiceManager__fetchAndIngestLastVisit__block_invoke_2_41(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  NSObject *v6;
  os_log_type_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE v32[32];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = TASALog;
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
    {
LABEL_5:
      objc_msgSend(*(id *)(a1 + 48), "_ingestVisit:", *(_QWORD *)(a1 + 40), v31, *(_OWORD *)v32, *(_OWORD *)&v32[16], v33);
      return;
    }
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v31 = 68289539;
    *(_WORD *)v32 = 2082;
    *(_QWORD *)&v32[2] = "";
    *(_WORD *)&v32[10] = 2113;
    *(_QWORD *)&v32[12] = v3;
    *(_WORD *)&v32[20] = 2114;
    *(_QWORD *)&v32[22] = v4;
    v5 = "{\"msg%{public}.0s\":\"#sa #loi error fetching LOI\", \"visit\":\"%{private}@\", \"error\":\"%{public}@\"}";
    v6 = v2;
    v7 = OS_LOG_TYPE_ERROR;
LABEL_4:
    _os_log_impl(&dword_1CA04F000, v6, v7, v5, (uint8_t *)&v31, 0x26u);
    goto LABEL_5;
  }
  v8 = TASALog;
  if (!*(_QWORD *)(a1 + 56))
  {
    if (!os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_FAULT))
      goto LABEL_5;
    v29 = *(_QWORD *)(a1 + 40);
    v30 = *(_QWORD *)(a1 + 64);
    v31 = 68289539;
    *(_WORD *)v32 = 2082;
    *(_QWORD *)&v32[2] = "";
    *(_WORD *)&v32[10] = 2113;
    *(_QWORD *)&v32[12] = v29;
    *(_WORD *)&v32[20] = 2113;
    *(_QWORD *)&v32[22] = v30;
    v5 = "{\"msg%{public}.0s\":\"#sa #loi received nil in return when fetching LOI\", \"visit\":\"%{private}@\", \"loiIde"
         "ntifier\":\"%{private}@\"}";
    v6 = v8;
    v7 = OS_LOG_TYPE_FAULT;
    goto LABEL_4;
  }
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 64);
    v31 = 68289539;
    *(_WORD *)v32 = 2082;
    *(_QWORD *)&v32[2] = "";
    *(_WORD *)&v32[10] = 2113;
    *(_QWORD *)&v32[12] = v9;
    *(_WORD *)&v32[20] = 2113;
    *(_QWORD *)&v32[22] = v10;
    _os_log_impl(&dword_1CA04F000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa #loi received LOI\", \"loi\":\"%{private}@\", \"loiIdentifier\":\"%{private}@\"}", (uint8_t *)&v31, 0x26u);
  }
  v11 = objc_msgSend(*(id *)(a1 + 56), "type");
  objc_msgSend(*(id *)(a1 + 48), "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (v11)
      v13 = 2 * (v11 == 1);
    else
      v13 = 1;
    v14 = objc_alloc(MEMORY[0x1E0DC0860]);
    objc_msgSend(*(id *)(a1 + 56), "location");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "latitude");
    v17 = v16;
    objc_msgSend(*(id *)(a1 + 56), "location");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "longitude");
    v20 = v19;
    objc_msgSend(*(id *)(a1 + 56), "location");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "horizontalUncertainty");
    v23 = v22;
    objc_msgSend(*(id *)(a1 + 56), "location");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "referenceFrame");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v14, "initWithType:latitude:longitude:horizontalAccuracy:referenceFrame:date:", v13, v25, v26, v17, v20, v23);

    objc_msgSend(*(id *)(a1 + 48), "service");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "ingestTAEvent:", v27);

  }
}

- (void)separationAlertsService:(id)a3 enableMonitoringForSeparations:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  _BOOL4 v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    v20 = v4;
    _os_log_impl(&dword_1CA04F000, v7, OS_LOG_TYPE_DEFAULT, "#sa ServiceMgr enableMonitoringForSeparations: %{public}d", buf, 8u);
  }
  -[NSHashTable allObjects](self->_clients, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "separationAlertsServiceManager:enableMonitoringForSeparations:", self, v4);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)separationAlertsService:(id)a3 notifySeparationsForDevices:(id)a4 withLocation:(id)a5 withContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[SAServiceManager service](self, "service");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v11 && (id)v14 == v10 && objc_msgSend(v11, "count"))
  {

    if (v13)
    {
      v16 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v16;
        *(_DWORD *)buf = 134283521;
        v33 = objc_msgSend(v11, "count");
        _os_log_impl(&dword_1CA04F000, v17, OS_LOG_TYPE_DEFAULT, "#sa ServiceMgr notifyAboutDevices:%{private}ld", buf, 0xCu);

      }
      v26 = v10;
      if (objc_msgSend(v11, "count"))
      {
        v18 = 0;
        do
        {
          -[SAServiceManager analytics](self, "analytics");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addAlertWithContext:", v13);

          ++v18;
        }
        while (v18 < objc_msgSend(v11, "count"));
      }
      -[NSHashTable allObjects](self->_clients, "allObjects");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v28;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v28 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v24);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v25, "separationAlertsServiceManager:notifySeparationsForDevices:withLocation:withContext:", self, v11, v12, v13);
            ++v24;
          }
          while (v22 != v24);
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v22);
      }

      v10 = v26;
    }
  }
  else
  {

  }
}

- (void)separationAlertsService:(id)a3 requestBluetoothScanForTypes:(unint64_t)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SAServiceManager service](self, "service");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    v8 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134283521;
      v22 = a4;
      _os_log_impl(&dword_1CA04F000, v8, OS_LOG_TYPE_DEFAULT, "#sa ServiceMgr requestBluetoothScan:%{private}#lx", buf, 0xCu);
    }
    -[SAServiceManager analytics](self, "analytics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAggressiveScanRequest:", a4 == 1);

    -[NSHashTable allObjects](self->_clients, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v14);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v15, "separationAlertsServiceManager:requestBluetoothScanForTypes:", self, a4);
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
}

- (void)separationAlertsService:(id)a3 requestLocationForType:(unint64_t)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SAServiceManager service](self, "service");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    v8 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134283521;
      v23 = a4;
      _os_log_impl(&dword_1CA04F000, v8, OS_LOG_TYPE_DEFAULT, "#sa ServiceMgr requestLocationForType:%{private}#lx", buf, 0xCu);
    }
    -[SAServiceManager analytics](self, "analytics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a4)
      objc_msgSend(v9, "addWifiLocationRequest:", 1);
    else
      objc_msgSend(v9, "addGpsLocationRequest:", 1);

    -[NSHashTable allObjects](self->_clients, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v16, "separationAlertsServiceManager:requestLocationForType:", self, a4);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v13);
    }

  }
}

- (void)separationAlertsService:(id)a3 addGeofence:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[16];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SAServiceManager service](self, "service");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 && v8 == v6)
  {
    v9 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA04F000, v9, OS_LOG_TYPE_DEFAULT, "#sa ServiceMgr addGeofence", buf, 2u);
    }
    -[NSHashTable allObjects](self->_clients, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v14);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v15, "separationAlertsServiceManager:addGeofence:", self, v7);
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v12);
    }

  }
}

- (void)separationAlertsService:(id)a3 removeGeofence:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[16];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SAServiceManager service](self, "service");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 && v8 == v6)
  {
    v9 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA04F000, v9, OS_LOG_TYPE_DEFAULT, "#sa ServiceMgr removeGeofence", buf, 2u);
    }
    -[NSHashTable allObjects](self->_clients, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v14);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v15, "separationAlertsServiceManager:removeGeofence:", self, v7);
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v12);
    }

  }
}

- (void)separationAlertsService:(id)a3 requestStateForRegion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[16];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SAServiceManager service](self, "service");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 && v8 == v6)
  {
    v9 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA04F000, v9, OS_LOG_TYPE_DEFAULT, "#sa ServiceMgr requestStateForRegion", buf, 2u);
    }
    -[NSHashTable allObjects](self->_clients, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v14);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v15, "separationAlertsServiceManager:requestStateForRegion:", self, v7);
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v12);
    }

  }
}

- (void)separationAlertsService:(id)a3 scheduleSATimeEvent:(double)a4 forAlarm:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[SAServiceManager service](self, "service");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v8)
  {
    v11 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      v25 = a4;
      _os_log_impl(&dword_1CA04F000, v11, OS_LOG_TYPE_DEFAULT, "#sa ServiceMgr scheduleSATimeEvent:%{public}#lf", buf, 0xCu);
    }
    -[SAServiceManager analytics](self, "analytics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addWakeTimerRequest");

    -[NSHashTable allObjects](self->_clients, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v17);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v18, "separationAlertsServiceManager:scheduleSATimeEvent:forAlarm:", self, v9, a4);
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v15);
    }

  }
}

- (void)separationAlertsService:(id)a3 cancelSATimeEventForAlarm:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t buf;
  __int16 v22;
  const char *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SAServiceManager service](self, "service");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    v9 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      buf = 68289282;
      v22 = 2082;
      v23 = "";
      v24 = 2114;
      v25 = v7;
      _os_log_impl(&dword_1CA04F000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa ServiceMgr cancelSATimeEventForAlarm\", \"uuid\":\"%{public}@\"}", (uint8_t *)&buf, 0x1Cu);
    }
    -[NSHashTable allObjects](self->_clients, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v14);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v15, "separationAlertsServiceManager:cancelSATimeEventForAlarm:", self, v7);
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
}

- (void)separationAlertsServiceStartBackgroundScanning:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t buf;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SAServiceManager service](self, "service");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v6 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      buf = 68289026;
      v19 = 2082;
      v20 = "";
      _os_log_impl(&dword_1CA04F000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa ServiceMgr startBackgroundScanning\"}", (uint8_t *)&buf, 0x12u);
    }
    -[NSHashTable allObjects](self->_clients, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v12, "separationAlertsServiceManagerStartBackgroundScanning:", self);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
}

- (void)separationAlertsServiceStopBackgroundScanning:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t buf;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SAServiceManager service](self, "service");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v6 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      buf = 68289026;
      v19 = 2082;
      v20 = "";
      _os_log_impl(&dword_1CA04F000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa ServiceMgr stopBackgroundScanning\"}", (uint8_t *)&buf, 0x12u);
    }
    -[NSHashTable allObjects](self->_clients, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v12, "separationAlertsServiceManagerStopBackgroundScanning:", self);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
}

- (void)separationAlertsServiceStopLongAggressiveScan:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t buf;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SAServiceManager service](self, "service");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v6 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      buf = 68289026;
      v19 = 2082;
      v20 = "";
      _os_log_impl(&dword_1CA04F000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa ServiceMgr stopLongAggressiveScan\"}", (uint8_t *)&buf, 0x12u);
    }
    -[NSHashTable allObjects](self->_clients, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v12, "separationAlertsServiceManagerStopLongAggressiveScan:", self);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
}

- (void)separationAlertsServiceFetchLastVisit:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SAServiceManager service](self, "service");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v6 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 68289026;
      v7[1] = 0;
      v8 = 2082;
      v9 = "";
      _os_log_impl(&dword_1CA04F000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa ServiceMgr fetchLastVisit\"}", (uint8_t *)v7, 0x12u);
    }
    -[SAServiceManager _fetchAndIngestLastVisit](self, "_fetchAndIngestLastVisit");
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSHashTable)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_storeStrong((id *)&self->_clients, a3);
}

- (SAService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (SAAnalytics)analytics
{
  return self->_analytics;
}

- (void)setAnalytics:(id)a3
{
  objc_storeStrong((id *)&self->_analytics, a3);
}

- (SAAudioAccessory)audioAcccessory
{
  return self->_audioAcccessory;
}

- (void)setAudioAcccessory:(id)a3
{
  objc_storeStrong((id *)&self->_audioAcccessory, a3);
}

- (void)setNextAnalyticsSubmission:(id)a3
{
  objc_storeStrong((id *)&self->_nextAnalyticsSubmission, a3);
}

- (RTRoutineManager)routineManager
{
  return self->_routineManager;
}

- (void)setRoutineManager:(id)a3
{
  objc_storeStrong((id *)&self->_routineManager, a3);
}

- (void)setHasAttemptedToIngestLastVisitAtStartup:(BOOL)a3
{
  self->_hasAttemptedToIngestLastVisitAtStartup = a3;
}

- (BOOL)beaconGroupComplete
{
  return self->_beaconGroupComplete;
}

- (void)setBeaconGroupComplete:(BOOL)a3
{
  self->_beaconGroupComplete = a3;
}

- (BOOL)beaconGroupSafeLocationsMatch
{
  return self->_beaconGroupSafeLocationsMatch;
}

- (void)setBeaconGroupSafeLocationsMatch:(BOOL)a3
{
  self->_beaconGroupSafeLocationsMatch = a3;
}

- (id)scheduledMetricSubmissionBlock
{
  return self->_scheduledMetricSubmissionBlock;
}

- (void)setScheduledMetricSubmissionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_scheduledMetricSubmissionBlock, 0);
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_nextAnalyticsSubmission, 0);
  objc_storeStrong((id *)&self->_audioAcccessory, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_separationMonitoringSession, 0);
  objc_storeStrong((id *)&self->_ownerSession, 0);
  objc_storeStrong((id *)&self->_beaconManager, 0);
}

+ (void)convertBeaconToDeviceType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138477827;
  v3 = a1;
  _os_log_fault_impl(&dword_1CA04F000, a2, OS_LOG_TYPE_FAULT, "#sa ServiceMgr received unknown device type, %{private}@", (uint8_t *)&v2, 0xCu);
}

@end
