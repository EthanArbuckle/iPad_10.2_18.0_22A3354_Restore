@implementation SMReceiverCacheManager

- (SMReceiverCacheManager)initWithSessionID:(id)a3 initiatorHandle:(id)a4 safetyCacheStore:(id)a5 defaultsManager:(id)a6 queue:(id)a7 messagingService:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  SMReceiverCacheManager *v24;
  NSObject *v25;
  const char *v26;
  uint8_t *v27;
  uint8_t buf[2];
  __int16 v30;
  __int16 v31;
  __int16 v32;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v32 = 0;
    v26 = "Invalid parameter not satisfying: sessionID";
    v27 = (uint8_t *)&v32;
LABEL_14:
    _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, v26, v27, 2u);
    goto LABEL_15;
  }
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v31 = 0;
    v26 = "Invalid parameter not satisfying: initiatorHandle";
    v27 = (uint8_t *)&v31;
    goto LABEL_14;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v30 = 0;
    v26 = "Invalid parameter not satisfying: safetyCacheStore";
    v27 = (uint8_t *)&v30;
    goto LABEL_14;
  }
  if (!v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v26 = "Invalid parameter not satisfying: queue";
      v27 = buf;
      goto LABEL_14;
    }
LABEL_15:

    v24 = 0;
    goto LABEL_16;
  }
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8B9C8]), "initWithIdentifier:sessionID:initiatorHandle:", 0, v14, v15);
  objc_msgSend(v20, "setSessionState:", 1);
  v21 = objc_alloc(MEMORY[0x1E0D8B9B8]);
  v22 = (void *)objc_opt_new();
  v23 = (void *)objc_msgSend(v21, "initWithIdentifier:syncDate:phoneCache:watchCache:sessionStatus:allowReadToken:safetyCacheKey:shareURL:participantID:sharingInvitationData:numCacheDownloads:numSuccessfulCacheDownloads:maxPhoneCacheSize:maxWatchCacheSize:maxLocationsInPhoneCacheTrace:maxLocationsInWatchCacheTrace:timeTillCacheRelease:timeTillFirstSuccessfulCacheDownload:sessionID:firstDetailViewSessionState:lastDetailViewSessionState:phoneMaxWorkoutEvents:watchMaxWorkoutEvents:", v22, 0, 0, 0, v20, 0, 0.0, -1.0, 0, 0, 0, 0, 0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  v14,
                  0,
                  0,
                  0,
                  0);

  self = -[SMReceiverCacheManager initWithReceiverContact:safetyCacheStore:defaultsManager:queue:messagingService:](self, "initWithReceiverContact:safetyCacheStore:defaultsManager:queue:messagingService:", v23, v16, v17, v18, v19);
  v24 = self;
LABEL_16:

  return v24;
}

- (SMReceiverCacheManager)initWithReceiverContact:(id)a3 safetyCacheStore:(id)a4 defaultsManager:(id)a5 queue:(id)a6 messagingService:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SMReceiverCacheManager *v18;
  id *p_isa;
  SMReceiverCacheManager *v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  id v26;
  objc_super v27;
  uint8_t buf[16];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (!v13)
  {
    v21 = v17;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      v20 = 0;
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: receiverContact";
LABEL_17:
    _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, v23, buf, 2u);
    goto LABEL_10;
  }
  if (!v14)
  {
    v21 = v17;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: safetyCacheStore";
    goto LABEL_17;
  }
  v26 = v17;
  if (v16)
  {
    v27.receiver = self;
    v27.super_class = (Class)SMReceiverCacheManager;
    v18 = -[SMReceiverCacheManager init](&v27, sel_init);
    p_isa = (id *)&v18->super.isa;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_receiverContact, a3);
      objc_storeStrong(p_isa + 8, a4);
      objc_storeStrong(p_isa + 9, a5);
      objc_storeStrong(p_isa + 10, a6);
      objc_msgSend(p_isa, "_setupCloudKitFunction");
      objc_storeStrong(p_isa + 14, a7);
    }
    self = p_isa;
    v20 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue", buf, 2u);
    }

    v20 = 0;
  }
  v21 = v26;
LABEL_15:

  return v20;
}

- (NSUUID)sessionID
{
  void *v2;
  void *v3;

  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (SMReceiverSessionStatus)sessionStatus
{
  void *v2;
  void *v3;

  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SMReceiverSessionStatus *)v3;
}

- (SMCache)phoneCache
{
  void *v2;
  void *v3;

  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "phoneCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SMCache *)v3;
}

- (SMCache)watchCache
{
  void *v2;
  void *v3;

  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "watchCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SMCache *)v3;
}

- (void)onSessionStatusLoadedFromDisk
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  objc_class *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  int v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  -[SMReceiverCacheManager setReceiverContactStored:](self, "setReceiverContactStored:", 1);
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceNow");
  if (fabs(v7) > 604800.0)
  {
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sessionStatus");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "sessionState");

    if (v10 == 5)
      goto LABEL_15;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 138412802;
      v49 = v31;
      v50 = 2112;
      v51 = v33;
      v52 = 2112;
      v53 = v34;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,forcefully cleanup lingering session", (uint8_t *)&v48, 0x20u);

    }
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sessionStatus");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "sessionState") == 4)
    {
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "phoneCache");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {

LABEL_12:
        -[SMReceiverCacheManager receiverContact](self, "receiverContact");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "sessionStatus");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v16;
        v17 = 5;
        goto LABEL_13;
      }
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "watchCache");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        goto LABEL_12;
    }
    else
    {

    }
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionStatus");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v16;
    v17 = 6;
LABEL_13:
    objc_msgSend(v16, "setSessionState:", v17);
    goto LABEL_14;
  }

LABEL_14:
LABEL_15:
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sessionStatus");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "sessionState");

  objc_msgSend(MEMORY[0x1E0D8B9C8], "convertSessionStateToString:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    -[SMReceiverCacheManager sessionID](self, "sessionID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 138413058;
    v49 = v25;
    v50 = 2112;
    v51 = v27;
    v52 = 2112;
    v53 = v28;
    v54 = 2112;
    v55 = v23;
    _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,transitioning to state:%@", (uint8_t *)&v48, 0x2Au);

  }
  switch(v22)
  {
    case 2:
      -[SMReceiverCacheManager transitionFromInitializingToActiveDueToEvent:](self, "transitionFromInitializingToActiveDueToEvent:", 1);
      break;
    case 3:
      -[SMReceiverCacheManager transitionFromInitializingToTriggeredDueToEvent:](self, "transitionFromInitializingToTriggeredDueToEvent:", 1);
      break;
    case 4:
      -[SMReceiverCacheManager transitionFromInitializingToCacheReleasedDueToEvent:](self, "transitionFromInitializingToCacheReleasedDueToEvent:", 1);
      break;
    case 5:
      -[SMReceiverCacheManager transitionFromInitializingToCachePersistenceDueToEvent:](self, "transitionFromInitializingToCachePersistenceDueToEvent:", 1);
      break;
    case 6:
      -[SMReceiverCacheManager transitionFromInitializingToCleanupDueToEvent:](self, "transitionFromInitializingToCleanupDueToEvent:", 1);
      break;
    case 7:
      -[SMReceiverCacheManager transitionFromInitializingToMissingSessionInfoDueToEvent:](self, "transitionFromInitializingToMissingSessionInfoDueToEvent:", 1);
      break;
    case 8:
      -[SMReceiverCacheManager transitionFromInitializingToMissingKeyReleaseInfoDueToEvent:](self, "transitionFromInitializingToMissingKeyReleaseInfoDueToEvent:", 1);
      break;
    case 9:
      -[SMReceiverCacheManager transitionFromInitializingToCacheDownloadFailedDueToEvent:](self, "transitionFromInitializingToCacheDownloadFailedDueToEvent:", 1);
      break;
    default:
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        -[SMReceiverCacheManager sessionID](self, "sessionID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (objc_class *)objc_opt_class();
        NSStringFromClass(v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMReceiverCacheManager receiverContact](self, "receiverContact");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "sessionStatus");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "sessionState");
        v48 = 138413058;
        v49 = v35;
        v50 = 2112;
        v51 = v37;
        v52 = 2112;
        v53 = v38;
        v54 = 1024;
        LODWORD(v55) = v41;
        _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,unknown or unhandled cached state %d", (uint8_t *)&v48, 0x26u);

      }
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        v42 = (objc_class *)objc_opt_class();
        NSStringFromClass(v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMReceiverCacheManager receiverContact](self, "receiverContact");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "sessionStatus");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "sessionState");
        v48 = 138412802;
        v49 = v43;
        v50 = 2112;
        v51 = v44;
        v52 = 1024;
        LODWORD(v53) = v47;
        _os_log_fault_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_FAULT, "#SafetyCache,Receiver,%@,%@,unknown or unhandled cached state %d", (uint8_t *)&v48, 0x1Cu);

      }
      break;
  }

}

- (void)onSessionStartMessageReceived:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startMessage", (uint8_t *)&v18, 2u);
    }
    goto LABEL_8;
  }
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sessionStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "sessionState");

  if (v8 != 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0D8B9C8];
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sessionStatus");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "convertSessionStateToString:", objc_msgSend(v16, "sessionState"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138413058;
      v19 = v10;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      v23 = v13;
      v24 = 2112;
      v25 = v17;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,received start message outside of Initializing state,state,%@", (uint8_t *)&v18, 0x2Au);

    }
LABEL_8:

    goto LABEL_9;
  }
  -[SMReceiverCacheManager copySessionStartMessageParameters:](self, "copySessionStartMessageParameters:", v5);
  -[SMReceiverCacheManager transitionToState:event:](self, "transitionToState:event:", 2, 2);
LABEL_9:

}

- (void)onSessionStartInfoMessageReceived:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "sessionState");

    if (v8 == 7)
    {
      -[SMReceiverCacheManager copySessionStartMessageParameters:](self, "copySessionStartMessageParameters:", v5);
      -[SMReceiverCacheManager transitionToState:event:](self, "transitionToState:event:", 3, 11);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        -[SMReceiverCacheManager sessionID](self, "sessionID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412802;
        v16 = v11;
        v17 = 2112;
        v18 = v13;
        v19 = 2112;
        v20 = v14;
        _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,received SMSessionStartInfoMessage without requesting for it", (uint8_t *)&v15, 0x20u);

      }
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startInfoMessage", (uint8_t *)&v15, 2u);
    }

  }
}

- (void)copySessionStartMessageParameters:(id)a3
{
  id v5;
  void *v6;
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
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  int v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[5];
  id v47;
  SEL v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  int v62;
  __int16 v63;
  int v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "sessionType");
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sessionStatus");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSessionType:", v7);

    objc_msgSend(v6, "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sessionStatus");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSessionStartDate:", v10);

    objc_msgSend(v6, "estimatedEndTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sessionStatus");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEstimatedEndDate:", v13);

    objc_msgSend(v6, "coarseEstimatedEndTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (!v16)
    {
      objc_msgSend(v6, "estimatedEndTime");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sessionStatus");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCoarseEstimatedEndDate:", v17);

    if (!v16)
    v20 = objc_msgSend(v6, "destinationType");
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sessionStatus");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDestinationType:", v20);

    objc_msgSend(v6, "destinationMapItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sessionStatus");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDestinationMapItem:", v23);

    v26 = objc_msgSend(v6, "lowPowerModeWarningState");
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "sessionStatus");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setLowPowerModeWarningState:", v26);

    -[SMReceiverCacheManager messagingService](self, "messagingService");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invitationTokenDict");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __60__SMReceiverCacheManager_copySessionStartMessageParameters___block_invoke;
    v46[3] = &unk_1E92A0340;
    v46[4] = self;
    v48 = a2;
    v31 = v6;
    v47 = v31;
    objc_msgSend(v29, "findObjectForMyAccountFromDict:withHandler:", v30, v46);

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "date");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "stringFromDate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "estimatedEndTime");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringFromDate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "coarseEstimatedEndTime");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringFromDate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v31, "sessionType");
      v40 = objc_msgSend(v31, "destinationType");
      *(_DWORD *)buf = 138414082;
      v50 = v42;
      v51 = 2112;
      v52 = v44;
      v53 = 2112;
      v54 = v43;
      v55 = 2112;
      v56 = v34;
      v57 = 2112;
      v58 = v36;
      v59 = 2112;
      v60 = v38;
      v61 = 1024;
      v62 = v39;
      v63 = 1024;
      v64 = v40;
      _os_log_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,sessionStartDate,%@,estimatedEndDate,%@,coarseEstimatedEndDate,%@,sessionType,%d,destinationType,%d", buf, 0x4Au);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startMessage", buf, 2u);
    }

  }
}

void __60__SMReceiverCacheManager_copySessionStartMessageParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  NSObject *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "receiverContact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sessionStatus");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setReceiverHandle:", v5);

    v10 = v7;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138413314;
      v31 = v12;
      v32 = 2112;
      v33 = v14;
      v34 = 2112;
      v35 = v15;
      v36 = 2112;
      v37 = v5;
      v38 = 2112;
      v39 = v10;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,found handle %@ with invitationToken %@", (uint8_t *)&v30, 0x34u);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "invitationTokenDict");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "invitationTokenDict");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", v11);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138413314;
      v31 = v26;
      v32 = 2112;
      v33 = v28;
      v34 = 2112;
      v35 = v29;
      v36 = 2112;
      v37 = v11;
      v38 = 2112;
      v39 = v10;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,unable to find handle for my account,assuming first entry is for me with handle %@ and invitationToken %@", (uint8_t *)&v30, 0x34u);

    }
  }

  objc_msgSend(v10, "sharingInvitationData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "receiverContact");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSharingInvitationData:", v20);

  objc_msgSend(v10, "shareURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "receiverContact");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setShareURL:", v22);

  objc_msgSend(v10, "participantID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "receiverContact");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setParticipantID:", v24);

}

- (void)onShareInvitationAcceptenceResult:(BOOL)a3 withError:(id)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  objc_class *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  _BOOL4 v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v4 = a3;
  v56 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sessionStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isSessionOngoing");

  if ((v10 & 1) != 0)
  {
    if (v4)
    {
      -[SMReceiverCacheManager setZoneShareRetryCount:](self, "setZoneShareRetryCount:", 0);
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[SMReceiverCacheManager sessionID](self, "sessionID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 138412802;
        v45 = v12;
        v46 = 2112;
        v47 = v14;
        v48 = 2112;
        v49 = v15;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,successfully accepted zone share", (uint8_t *)&v44, 0x20u);

      }
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "sessionStatus");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setZoneShareAccepted:", 1);

      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sessionStatus");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setLastUpdateDate:", v18);

      if (-[SMReceiverCacheManager safetyCacheFetchPending](self, "safetyCacheFetchPending"))
        -[SMReceiverCacheManager fetchSafetyCacheData:](self, "fetchSafetyCacheData:", 3);
      -[SMReceiverCacheManager delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverCacheManager sessionStatus](self, "sessionStatus");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sessionStatusChanged:status:", v22, v23);

      -[SMReceiverCacheManager updateReceiverContactInStore](self, "updateReceiverContactInStore");
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        -[SMReceiverCacheManager sessionID](self, "sessionID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (objc_class *)objc_opt_class();
        NSStringFromClass(v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 138413058;
        v45 = v40;
        v46 = 2112;
        v47 = v42;
        v48 = 2112;
        v49 = v43;
        v50 = 2112;
        v51 = v7;
        _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,failed to accept zone share with error %@", (uint8_t *)&v44, 0x2Au);

      }
      if (-[SMReceiverCacheManager zoneShareRetryCount](self, "zoneShareRetryCount") <= 1
        && -[SMReceiverCacheManager shouldRetryZoneShareAcceptanceForError:](self, "shouldRetryZoneShareAcceptanceForError:", v7))
      {
        -[SMReceiverCacheManager setZoneShareRetryCount:](self, "setZoneShareRetryCount:", -[SMReceiverCacheManager zoneShareRetryCount](self, "zoneShareRetryCount") + 1);
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          -[SMReceiverCacheManager sessionID](self, "sessionID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = (objc_class *)objc_opt_class();
          NSStringFromClass(v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = -[SMReceiverCacheManager zoneShareRetryCount](self, "zoneShareRetryCount");
          v44 = 138413058;
          v45 = v35;
          v46 = 2112;
          v47 = v37;
          v48 = 2112;
          v49 = v38;
          v50 = 1024;
          LODWORD(v51) = v39;
          _os_log_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,retry accept zone share,attempt:%d", (uint8_t *)&v44, 0x26u);

        }
        -[SMReceiverCacheManager acceptShareInvitation:](self, "acceptShareInvitation:", 14);
      }
      else
      {
        -[SMReceiverCacheManager setZoneShareRetryCount:](self, "setZoneShareRetryCount:", 0);
      }
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)MEMORY[0x1E0D8B9C8];
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "sessionStatus");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "convertSessionStateToString:", objc_msgSend(v31, "sessionState"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 138413570;
      v45 = v25;
      v46 = 2112;
      v47 = v27;
      v48 = 2112;
      v49 = v28;
      v50 = 2112;
      v51 = v32;
      v52 = 1024;
      v53 = v4;
      v54 = 2112;
      v55 = v7;
      _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,zone acceptence result returned outside of session,state,%@,success,%d,error,%@", (uint8_t *)&v44, 0x3Au);

    }
  }

}

- (void)onEstimatedEndTimeUpdateMessageReceived:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
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
  NSObject *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "sessionState");

    if (v8 == 2)
    {
      objc_msgSend(v5, "estimatedEndTime");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sessionStatus");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setEstimatedEndDate:", v9);

      objc_msgSend(v5, "coarseEstimatedEndTime");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (!v12)
      {
        objc_msgSend(v5, "estimatedEndTime");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sessionStatus");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setCoarseEstimatedEndDate:", v13);

      if (!v12)
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sessionStatus");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setLastUpdateDate:", v16);

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        -[SMReceiverCacheManager sessionID](self, "sessionID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "estimatedEndTime");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringFromDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "coarseEstimatedEndTime");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringFromDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 138413314;
        v42 = v20;
        v43 = 2112;
        v44 = v22;
        v45 = 2112;
        v46 = v23;
        v47 = 2112;
        v48 = v25;
        v49 = 2112;
        v50 = v27;
        _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,estimatedEndDate,%@,coarseEstimatedEndDate,%@", (uint8_t *)&v41, 0x34u);

      }
      -[SMReceiverCacheManager delegate](self, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverCacheManager sessionStatus](self, "sessionStatus");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "sessionStatusChanged:status:", v29, v30);

      -[SMReceiverCacheManager updateReceiverContactInStore](self, "updateReceiverContactInStore");
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        -[SMReceiverCacheManager sessionID](self, "sessionID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)MEMORY[0x1E0D8B9C8];
        -[SMReceiverCacheManager receiverContact](self, "receiverContact");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "sessionStatus");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "convertSessionStateToString:", objc_msgSend(v39, "sessionState"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 138413058;
        v42 = v33;
        v43 = 2112;
        v44 = v35;
        v45 = 2112;
        v46 = v36;
        v47 = 2112;
        v48 = v40;
        _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,received estimated end time update message outside of Active state,state,%@", (uint8_t *)&v41, 0x2Au);

      }
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v41) = 0;
      _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: estimatedEndTimeUpdateMessage", (uint8_t *)&v41, 2u);
    }

  }
}

- (void)onLowPowerModeWarningStateUpdateMessageReceived:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sessionStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "sessionState");

  if (v8 == 2)
  {
    v9 = objc_msgSend(v5, "lowPowerModeWarningState");
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sessionStatus");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLowPowerModeWarningState:", v9);

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D8B928], "convertLowPowerModeWarningStateToString:", objc_msgSend(v5, "lowPowerModeWarningState"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138413058;
      v31 = v13;
      v32 = 2112;
      v33 = v15;
      v34 = 2112;
      v35 = v16;
      v36 = 2112;
      v37 = v17;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,message.lowPowerModeWarningState %@", (uint8_t *)&v30, 0x2Au);

    }
    -[SMReceiverCacheManager delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverCacheManager sessionID](self, "sessionID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverCacheManager sessionStatus](self, "sessionStatus");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sessionStatusChanged:status:", v19, v20);

    -[SMReceiverCacheManager updateReceiverContactInStore](self, "updateReceiverContactInStore");
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0D8B9C8];
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "sessionStatus");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "convertSessionStateToString:", objc_msgSend(v28, "sessionState"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138413058;
      v31 = v22;
      v32 = 2112;
      v33 = v24;
      v34 = 2112;
      v35 = v25;
      v36 = 2112;
      v37 = v29;
      _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,received low power mode warning state update message outside of Active state,state,%@", (uint8_t *)&v30, 0x2Au);

    }
  }

}

- (void)onKeyReleaseMessageReceived:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
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
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  SMReceiverCacheManager *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  objc_class *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v52) = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: keyReleaseMessage", (uint8_t *)&v52, 2u);
    }

    goto LABEL_30;
  }
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sessionStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "sessionState") != 3)
  {
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sessionStatus");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "sessionState") != 4)
    {

      goto LABEL_12;
    }
    v12 = objc_msgSend(v5, "isSOSTrigger");

    if ((v12 & 1) == 0)
      goto LABEL_12;
LABEL_10:
    -[SMReceiverCacheManager copyKeyReleaseMessageParameters:](self, "copyKeyReleaseMessageParameters:", v5);
    -[SMReceiverCacheManager delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverCacheManager sessionID](self, "sessionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverCacheManager sessionStatus](self, "sessionStatus");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sessionStatusChanged:status:", v14, v15);

    -[SMReceiverCacheManager updateReceiverContactInStore](self, "updateReceiverContactInStore");
    goto LABEL_30;
  }
  v8 = objc_msgSend(v5, "isSOSTrigger");

  if (v8)
    goto LABEL_10;
LABEL_12:
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sessionStatus");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "sessionState") != 2)
  {
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sessionStatus");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "sessionState") != 1)
    {
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "sessionStatus");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "sessionState");

      if (v39 != 8)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          -[SMReceiverCacheManager sessionID](self, "sessionID");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (objc_class *)objc_opt_class();
          NSStringFromClass(v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = (void *)MEMORY[0x1E0D8B9C8];
          -[SMReceiverCacheManager receiverContact](self, "receiverContact");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "sessionStatus");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "convertSessionStateToString:", objc_msgSend(v50, "sessionState"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = 138413058;
          v53 = v44;
          v54 = 2112;
          v55 = v46;
          v56 = 2112;
          v57 = v47;
          v58 = 2112;
          v59 = v51;
          _os_log_error_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,received key release message outside of Active/Initializing/MissingKeyReleaseInfo state,state,%@", (uint8_t *)&v52, 0x2Au);

        }
        goto LABEL_30;
      }
      goto LABEL_16;
    }

  }
LABEL_16:
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sessionStatus");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sessionStartDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sessionStatus");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sessionStartDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "timeIntervalSinceDate:", v26);
    v28 = v27 / 60.0;
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTimeTillCacheRelease:", v28);

  }
  else
  {
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTimeTillCacheRelease:", 0.0);
  }

  -[SMReceiverCacheManager copyKeyReleaseMessageParameters:](self, "copyKeyReleaseMessageParameters:", v5);
  -[SMReceiverCacheManager stopMissingKeyReleaseTimer](self, "stopMissingKeyReleaseTimer");
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sessionStatus");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "sessionState");

  if (v32 == 1)
  {
    v33 = self;
    v34 = 7;
LABEL_29:
    -[SMReceiverCacheManager transitionToState:event:](v33, "transitionToState:event:", v34, 5);
    goto LABEL_30;
  }
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sessionStatus");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v36, "sessionState") == 2)
  {

LABEL_28:
    v33 = self;
    v34 = 3;
    goto LABEL_29;
  }
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "sessionStatus");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "sessionState");

  if (v43 == 8)
    goto LABEL_28;
LABEL_30:

}

- (void)onKeyReleaseInfoMessageReceived:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "sessionState");

    if (v8 == 8)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sessionStatus");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sessionStartDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceDate:", v12);
      v14 = v13 / 60.0;
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTimeTillCacheRelease:", v14);

      -[SMReceiverCacheManager copyKeyReleaseMessageParameters:](self, "copyKeyReleaseMessageParameters:", v5);
      -[SMReceiverCacheManager transitionToState:event:](self, "transitionToState:event:", 3, 12);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        -[SMReceiverCacheManager sessionID](self, "sessionID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412802;
        v23 = v18;
        v24 = 2112;
        v25 = v20;
        v26 = 2112;
        v27 = v21;
        _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,received SMKeyReleaseInfoMessage without requesting for it", (uint8_t *)&v22, 0x20u);

      }
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22) = 0;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: keyReleaseInfoMessage", (uint8_t *)&v22, 2u);
    }

  }
}

- (void)copyKeyReleaseMessageParameters:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "triggerDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sessionStatus");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTriggerDate:", v7);

    objc_msgSend(v6, "locationOfTrigger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sessionStatus");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLocationOfTrigger:", v10);

    v13 = objc_msgSend(v6, "triggerType");
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sessionStatus");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTriggerType:", v13);

    v16 = objc_msgSend(v6, "isSOSTrigger");
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sessionStatus");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setIsSOSTrigger:", v16);

    v19 = objc_msgSend(v6, "lowPowerModeWarningState");
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sessionStatus");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLowPowerModeWarningState:", v19);

    objc_msgSend(v6, "safetyCacheKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setSafetyCacheKey:", v22);

    objc_msgSend(v6, "safetyCacheToken");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAllowReadToken:", v24);

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "triggerDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringFromDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138413314;
      v34 = v27;
      v35 = 2112;
      v36 = v29;
      v37 = 2112;
      v38 = v30;
      v39 = 2112;
      v40 = v32;
      v41 = 1024;
      v42 = objc_msgSend(v6, "triggerType");
      _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,triggerDate,%@,triggerType,%d", (uint8_t *)&v33, 0x30u);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v33) = 0;
      _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: keyReleaseMessage", (uint8_t *)&v33, 2u);
    }
  }

}

- (void)onUserCacheDownloadRequest
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "sessionState") == 3)
    goto LABEL_4;
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sessionStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "sessionState") == 4)
  {

LABEL_4:
LABEL_5:
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138412802;
      v35 = v9;
      v36 = 2112;
      v37 = v11;
      v38 = 2112;
      v39 = v12;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@", (uint8_t *)&v34, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sessionStatus");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCacheRequestDate:", v13);

    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sessionStatus");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "sessionState");

    if (v18 == 4)
    {
      -[SMReceiverCacheManager fetchSafetyCacheData:](self, "fetchSafetyCacheData:", 6);
      -[SMReceiverCacheManager delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverCacheManager sessionStatus](self, "sessionStatus");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sessionStatusChanged:status:", v20, v21);

    }
    else
    {
      -[SMReceiverCacheManager transitionToState:event:](self, "transitionToState:event:", 4, 6);
    }
    return;
  }
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sessionStatus");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "sessionState");

  if (v24 == 9)
    goto LABEL_5;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    -[SMReceiverCacheManager sessionID](self, "sessionID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x1E0D8B9C8];
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sessionStatus");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "convertSessionStateToString:", objc_msgSend(v32, "sessionState"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138413058;
    v35 = v26;
    v36 = 2112;
    v37 = v28;
    v38 = 2112;
    v39 = v29;
    v40 = 2112;
    v41 = v33;
    _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,received user cache download request outside of Triggered and CacheReleased states,state,%@", (uint8_t *)&v34, 0x2Au);

  }
}

- (void)onCacheDownloadResult:(BOOL)a3 userInitiatedDownload:(BOOL)a4 withError:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  NSObject *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  objc_class *v45;
  void *v46;
  void *v47;
  int v48;
  uint64_t v49;
  int64_t v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  objc_class *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  objc_class *v64;
  void *v65;
  void *v66;
  int v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  _BOOL4 v76;
  __int16 v77;
  id v78;
  uint64_t v79;

  v5 = a4;
  v6 = a3;
  v79 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  -[SMReceiverCacheManager defaultsManager](self, "defaultsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("RTDefaultsMockTimeoutNextReceiverSafetyCacheDownload"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if ((v12 & 1) == 0)
    -[SMReceiverCacheManager stopCacheDownloadTimeoutTimer](self, "stopCacheDownloadTimeoutTimer");
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sessionStatus");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isSessionOngoing"))
  {

  }
  else
  {
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sessionStatus");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "sessionState");

    if (v17 != 5)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        -[SMReceiverCacheManager sessionID](self, "sessionID");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (objc_class *)objc_opt_class();
        NSStringFromClass(v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = (void *)MEMORY[0x1E0D8B9C8];
        -[SMReceiverCacheManager receiverContact](self, "receiverContact");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "sessionStatus");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "convertSessionStateToString:", objc_msgSend(v61, "sessionState"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = 138413570;
        v68 = v55;
        v69 = 2112;
        v70 = v57;
        v71 = 2112;
        v72 = v58;
        v73 = 2112;
        v74 = v62;
        v75 = 1024;
        v76 = v6;
        v77 = 2112;
        v78 = v9;
        _os_log_impl(&dword_1D1A22000, v54, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,cache download result returned outside of session and Cache Persistence,state,%@,success,%d,error,%@", (uint8_t *)&v67, 0x3Au);

      }
      goto LABEL_30;
    }
  }
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setNumCacheDownloads:", objc_msgSend(v18, "numCacheDownloads") + 1);

  if (v6)
  {
    -[SMReceiverCacheManager setCacheDownloadRetryCount:](self, "setCacheDownloadRetryCount:", 0);
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setNumSuccessfulCacheDownloads:", objc_msgSend(v19, "numSuccessfulCacheDownloads") + 1);

    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timeTillFirstSuccessfulCacheDownload");
    if (v21 == -1.0)
    {
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sessionStatus");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "sessionStartDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
      {
LABEL_11:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          -[SMReceiverCacheManager sessionID](self, "sessionID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (objc_class *)objc_opt_class();
          NSStringFromClass(v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = 138412802;
          v68 = v32;
          v69 = 2112;
          v70 = v34;
          v71 = 2112;
          v72 = v35;
          _os_log_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,successfully downloaded cache", (uint8_t *)&v67, 0x20u);

        }
        -[SMReceiverCacheManager delegate](self, "delegate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMReceiverCacheManager sessionID](self, "sessionID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMReceiverCacheManager receiverContact](self, "receiverContact");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "phoneCache");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMReceiverCacheManager receiverContact](self, "receiverContact");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "watchCache");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "safetyCacheChanged:phoneCache:watchCache:", v37, v39, v41);

        -[SMReceiverCacheManager updateReceiverContactInStore](self, "updateReceiverContactInStore");
        goto LABEL_30;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "sessionStatus");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "sessionStartDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timeIntervalSinceDate:", v27);
      v29 = v28 / 60.0;
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setTimeTillFirstSuccessfulCacheDownload:", v29);

    }
    goto LABEL_11;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    -[SMReceiverCacheManager sessionID](self, "sessionID");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = (objc_class *)objc_opt_class();
    NSStringFromClass(v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = 138412802;
    v68 = v63;
    v69 = 2112;
    v70 = v65;
    v71 = 2112;
    v72 = v66;
    _os_log_error_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,failed to download cache", (uint8_t *)&v67, 0x20u);

  }
  -[SMReceiverCacheManager updateReceiverContactInStore](self, "updateReceiverContactInStore");
  if (-[SMReceiverCacheManager cacheDownloadRetryCount](self, "cacheDownloadRetryCount") <= 1
    && -[SMReceiverCacheManager shouldRetryCacheDownloadForError:](self, "shouldRetryCacheDownloadForError:", v9))
  {
    -[SMReceiverCacheManager setCacheDownloadRetryCount:](self, "setCacheDownloadRetryCount:", -[SMReceiverCacheManager cacheDownloadRetryCount](self, "cacheDownloadRetryCount") + 1);
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (objc_class *)objc_opt_class();
      NSStringFromClass(v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = -[SMReceiverCacheManager cacheDownloadRetryCount](self, "cacheDownloadRetryCount");
      v67 = 138413058;
      v68 = v44;
      v69 = 2112;
      v70 = v46;
      v71 = 2112;
      v72 = v47;
      v73 = 1024;
      LODWORD(v74) = v48;
      _os_log_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,retry cache download,attempt:%d", (uint8_t *)&v67, 0x26u);

    }
    if (v5)
      v49 = 15;
    else
      v49 = 13;
    -[SMReceiverCacheManager fetchSafetyCacheData:](self, "fetchSafetyCacheData:", v49);
  }
  else
  {
    -[SMReceiverCacheManager setCacheDownloadRetryCount:](self, "setCacheDownloadRetryCount:", 0);
    if (v5)
      -[SMReceiverCacheManager transitionToState:event:](self, "transitionToState:event:", 9, 7);
    v50 = -[SMReceiverCacheManager normalizedSMErrorForCacheDownloadError:](self, "normalizedSMErrorForCacheDownloadError:", v9);
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "sessionStatus");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setCacheDownloadError:", v50);

    -[SMReceiverCacheManager defaultsManager](self, "defaultsManager");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("RTDefaultsMockFailNextReceiverSafetyCacheDownload"));

  }
LABEL_30:

}

- (void)onCacheUpdatedMessageReceived:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "sessionState");

    if (v8 == 2)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[SMReceiverCacheManager sessionID](self, "sessionID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138412802;
        v33 = v10;
        v34 = 2112;
        v35 = v12;
        v36 = 2112;
        v37 = v13;
        _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,missing key release message", (uint8_t *)&v32, 0x20u);

      }
      -[SMReceiverCacheManager startMissingKeyReleaseTimer](self, "startMissingKeyReleaseTimer");
    }
    else
    {
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sessionStatus");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "sessionState");

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v17 == 4)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          -[SMReceiverCacheManager sessionID](self, "sessionID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 138412802;
          v33 = v20;
          v34 = 2112;
          v35 = v22;
          v36 = 2112;
          v37 = v23;
          _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,fetching updated Safety Cache data", (uint8_t *)&v32, 0x20u);

        }
        -[SMReceiverCacheManager fetchSafetyCacheData:](self, "fetchSafetyCacheData:", 8);
      }
      else
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          -[SMReceiverCacheManager sessionID](self, "sessionID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (objc_class *)objc_opt_class();
          NSStringFromClass(v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)MEMORY[0x1E0D8B9C8];
          -[SMReceiverCacheManager receiverContact](self, "receiverContact");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "sessionStatus");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "convertSessionStateToString:", objc_msgSend(v30, "sessionState"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 138413058;
          v33 = v24;
          v34 = 2112;
          v35 = v26;
          v36 = 2112;
          v37 = v27;
          v38 = 2112;
          v39 = v31;
          _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,ignore cache updated message in state,%@", (uint8_t *)&v32, 0x2Au);

        }
      }
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v32) = 0;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: cacheUpdatedMessage", (uint8_t *)&v32, 2u);
    }

  }
}

- (void)onSessionEndMessageReceived:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  NSObject *v17;
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
  uint64_t v38;
  void *v39;
  void *v40;
  float v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  objc_class *v46;
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
  double v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
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
  double v96;
  double v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  int v107;
  void *v108;
  __int16 v109;
  void *v110;
  __int16 v111;
  void *v112;
  __int16 v113;
  void *v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isSessionOngoing");

    if ((v8 & 1) != 0)
    {
      v9 = objc_msgSend(v5, "sessionEndReason");
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sessionStatus");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSessionEndReason:", v9);

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        -[SMReceiverCacheManager sessionID](self, "sessionID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = 138413058;
        v108 = v13;
        v109 = 2112;
        v110 = v15;
        v111 = 2112;
        v112 = v16;
        v113 = 1024;
        LODWORD(v114) = objc_msgSend(v5, "sessionEndReason");
        _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,sessionEndReason,%d", (uint8_t *)&v107, 0x26u);

      }
      v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v18 = (void *)MEMORY[0x1E0CB37E8];
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sessionStatus");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v20, "sessionType"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setValue:forKey:](v17, "setValue:forKey:", v21, CFSTR("sessionType"));

      v22 = (void *)MEMORY[0x1E0CB37E8];
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "sessionStatus");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v24, "triggerType"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setValue:forKey:](v17, "setValue:forKey:", v25, CFSTR("triggerType"));

      v26 = (void *)MEMORY[0x1E0CB37E8];
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "sessionStatus");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v28, "sessionEndReason"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setValue:forKey:](v17, "setValue:forKey:", v29, CFSTR("sessionEndReason"));

      v30 = (void *)MEMORY[0x1E0CB37E8];
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "safetyCacheKey");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "numberWithInt:", v32 != 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setValue:forKey:](v17, "setValue:forKey:", v33, CFSTR("wasCacheReleased"));

      v34 = (void *)MEMORY[0x1E0CB37E8];
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "numberWithLongLong:", objc_msgSend(v35, "numCacheDownloads"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setValue:forKey:](v17, "setValue:forKey:", v36, CFSTR("numCacheDownloads"));

      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "numCacheDownloads");

      if (v38 < 1)
      {
        -[NSObject setValue:forKey:](v17, "setValue:forKey:", &unk_1E93284D8, CFSTR("percentageOfSuccessfulCacheDownloads"));
      }
      else
      {
        v39 = (void *)MEMORY[0x1E0CB37E8];
        -[SMReceiverCacheManager receiverContact](self, "receiverContact");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (float)objc_msgSend(v40, "numSuccessfulCacheDownloads");
        -[SMReceiverCacheManager receiverContact](self, "receiverContact");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v43 = (float)(v41 / (float)objc_msgSend(v42, "numCacheDownloads")) * 100.0;
        objc_msgSend(v39, "numberWithFloat:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setValue:forKey:](v17, "setValue:forKey:", v44, CFSTR("percentageOfSuccessfulCacheDownloads"));

      }
      v53 = (void *)MEMORY[0x1E0CB37E8];
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "timeTillCacheRelease");
      objc_msgSend(v53, "numberWithDouble:");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setValue:forKey:](v17, "setValue:forKey:", v55, CFSTR("timeTilCacheRelease"));

      v56 = (void *)MEMORY[0x1E0CB37E8];
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v58 = (float)objc_msgSend(v57, "maxPhoneCacheSize") * 0.00097656;
      objc_msgSend(v56, "numberWithFloat:", v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setValue:forKey:](v17, "setValue:forKey:", v59, CFSTR("phoneMaxCacheSize"));

      v60 = (void *)MEMORY[0x1E0CB37E8];
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v62 = (float)objc_msgSend(v61, "maxWatchCacheSize") * 0.00097656;
      objc_msgSend(v60, "numberWithFloat:", v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setValue:forKey:](v17, "setValue:forKey:", v63, CFSTR("watchMaxCacheSize"));

      v64 = (void *)MEMORY[0x1E0CB37E8];
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "numberWithLongLong:", objc_msgSend(v65, "maxLocationsInPhoneCacheTrace"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setValue:forKey:](v17, "setValue:forKey:", v66, CFSTR("phoneMaxLocationsInTrace"));

      v67 = (void *)MEMORY[0x1E0CB37E8];
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "numberWithLongLong:", objc_msgSend(v68, "maxLocationsInWatchCacheTrace"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setValue:forKey:](v17, "setValue:forKey:", v69, CFSTR("watchMaxLocationsInTrace"));

      v70 = (void *)MEMORY[0x1E0CB37E8];
      -[SMReceiverCacheManager phoneCache](self, "phoneCache");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "locationsDuringSession");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "numberWithInt:", objc_msgSend(v72, "count") != 0);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setValue:forKey:](v17, "setValue:forKey:", v73, CFSTR("phoneLocationHistoryAvailable"));

      v74 = (void *)MEMORY[0x1E0CB37E8];
      -[SMReceiverCacheManager watchCache](self, "watchCache");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "locationsDuringSession");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "numberWithInt:", objc_msgSend(v76, "count") != 0);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setValue:forKey:](v17, "setValue:forKey:", v77, CFSTR("watchLocationHistoryAvailable"));

      v78 = (void *)MEMORY[0x1E0CB37E8];
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "sessionStatus");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "numberWithInt:", objc_msgSend(v80, "triggerType") == 15);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setValue:forKey:](v17, "setValue:forKey:", v81, CFSTR("wasScheduledSendTriggered"));

      v82 = (void *)MEMORY[0x1E0CB37E8];
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "numberWithLongLong:", objc_msgSend(v83, "phoneMaxWorkoutEvents"));
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setValue:forKey:](v17, "setValue:forKey:", v84, CFSTR("phoneMaxWorkoutEvents"));

      v85 = (void *)MEMORY[0x1E0CB37E8];
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "numberWithLongLong:", objc_msgSend(v86, "watchMaxWorkoutEvents"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setValue:forKey:](v17, "setValue:forKey:", v87, CFSTR("watchMaxWorkoutEvents"));

      v88 = (void *)MEMORY[0x1E0CB37E8];
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "sessionStatus");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "numberWithInt:", objc_msgSend(v90, "lowPowerModeWarningState") == 2);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setValue:forKey:](v17, "setValue:forKey:", v91, CFSTR("wasInLPM"));

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "sessionStatus");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "sessionStartDate");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "timeIntervalSinceDate:", v95);
      v97 = v96 / 60.0;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v97);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setValue:forKey:](v17, "setValue:forKey:", v98, CFSTR("sessionDuration"));

      AnalyticsSendEvent();
      -[SMReceiverCacheManager computeReceiverSessionMetrics](self, "computeReceiverSessionMetrics");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverCacheManager computeResponseModality:completionHandler:](self, "computeResponseModality:completionHandler:", v99, &__block_literal_global_71);
      if (objc_msgSend(v5, "sessionEndReason") == 3)
      {
        -[SMReceiverCacheManager receiverContact](self, "receiverContact");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "sessionStatus");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v101, "sessionState") == 4)
        {
          -[SMReceiverCacheManager receiverContact](self, "receiverContact");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "phoneCache");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          if (v103)
          {

LABEL_19:
            v104 = 5;
            goto LABEL_20;
          }
          -[SMReceiverCacheManager receiverContact](self, "receiverContact");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "watchCache");
          v106 = (void *)objc_claimAutoreleasedReturnValue();

          if (v106)
            goto LABEL_19;
        }
        else
        {

        }
      }
      v104 = 6;
LABEL_20:
      -[SMReceiverCacheManager transitionToState:event:](self, "transitionToState:event:", v104, 9);

      goto LABEL_21;
    }
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (objc_class *)objc_opt_class();
      NSStringFromClass(v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (void *)MEMORY[0x1E0D8B9C8];
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "sessionStatus");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "convertSessionStateToString:", objc_msgSend(v51, "sessionState"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = 138413058;
      v108 = v45;
      v109 = 2112;
      v110 = v47;
      v111 = 2112;
      v112 = v48;
      v113 = 2112;
      v114 = v52;
      _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,received session end message outside of session,state,%@", (uint8_t *)&v107, 0x2Au);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v107) = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endMessage", (uint8_t *)&v107, 2u);
    }
  }
LABEL_21:

}

void __54__SMReceiverCacheManager_onSessionEndMessageReceived___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v2 = (objc_class *)MEMORY[0x1E0CB3940];
  v3 = a2;
  v4 = [v2 alloc];
  v6 = (id)objc_msgSend(v4, "initWithCString:encoding:", RTAnalyticsEventSafetyMonitorReceiverSession, 1);
  log_analytics_submission(v6, v3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (void)onCachePersistenceExpiry
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[SMReceiverCacheManager cachePersistenceStopTimer](self, "cachePersistenceStopTimer");
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sessionState");

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 == 5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412802;
      v22 = v9;
      v23 = 2112;
      v24 = v11;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@", (uint8_t *)&v21, 0x20u);

    }
    -[SMReceiverCacheManager transitionToState:event:](self, "transitionToState:event:", 6, 10);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0D8B9C8];
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sessionStatus");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "convertSessionStateToString:", objc_msgSend(v19, "sessionState"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138413058;
      v22 = v13;
      v23 = 2112;
      v24 = v15;
      v25 = 2112;
      v26 = v16;
      v27 = 2112;
      v28 = v20;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,received Cache Persistence Expiry when outside of Cache Persistence state,state,%@", (uint8_t *)&v21, 0x2Au);

    }
  }
}

- (void)onViewingSessionDetails
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "firstDetailViewSessionState");

  if (!v5)
  {
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "sessionState");
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFirstDetailViewSessionState:", v8);

  }
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sessionStatus");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "sessionState");
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLastDetailViewSessionState:", v12);

  -[SMReceiverCacheManager updateReceiverContactInStore](self, "updateReceiverContactInStore");
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[SMReceiverCacheManager sessionID](self, "sessionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "firstDetailViewSessionState");
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138413314;
    v23 = v15;
    v24 = 2112;
    v25 = v17;
    v26 = 2112;
    v27 = v18;
    v28 = 1024;
    v29 = v20;
    v30 = 1024;
    v31 = objc_msgSend(v21, "lastDetailViewSessionState");
    _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@, SMReceiverTelemetry firstDetailViewSessionState %d, lastDetailViewSessionState %d", (uint8_t *)&v22, 0x2Cu);

  }
}

- (void)startCacheDownloadTimeoutTimer
{
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  RTXPCTimerAlarm *v10;
  void *v11;
  id v12;
  id v13;
  RTXPCTimerAlarm *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  objc_class *v20;
  id v21;
  id v22;
  void *v23;
  objc_class *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  SMReceiverCacheManager *v34;
  id v35[2];
  id location;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  -[SMReceiverCacheManager stopCacheDownloadTimeoutTimer](self, "stopCacheDownloadTimeoutTimer");
  objc_initWeak(&location, self);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMReceiverCacheManager sessionID](self, "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[SMReceiverCacheManager sessionID](self, "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.routined.SMReceiverCacheManager.cacheDownloadTimeoutTimerIdentifierBase"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [RTXPCTimerAlarm alloc];
  -[SMReceiverCacheManager queue](self, "queue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __56__SMReceiverCacheManager_startCacheDownloadTimeoutTimer__block_invoke;
  v31[3] = &unk_1E92A03A8;
  objc_copyWeak(v35, &location);
  v12 = v6;
  v32 = v12;
  v13 = v5;
  v35[1] = (id)a2;
  v33 = v13;
  v34 = self;
  v14 = -[RTXPCTimerAlarm initWithIdentifier:queue:handler:](v10, "initWithIdentifier:queue:handler:", v9, v11, v31);
  -[SMReceiverCacheManager setCacheDownloadTimeoutTimerAlarm:](self, "setCacheDownloadTimeoutTimerAlarm:", v14);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 60.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMReceiverCacheManager cacheDownloadTimeoutTimerAlarm](self, "cacheDownloadTimeoutTimerAlarm");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v16, "fireWithDate:error:", v15, &v30);
  v17 = v30;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v38 = v28;
      v39 = 2112;
      v40 = v21;
      v41 = 2112;
      v42 = v22;
      v43 = 2112;
      v44 = v23;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,cacheDownloadTimeoutTimerAlarm fireWithDate hit error: %@", buf, 0x2Au);

    }
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    -[SMReceiverCacheManager sessionID](self, "sessionID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringFromDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v38 = v29;
    v39 = 2112;
    v40 = v25;
    v41 = 2112;
    v42 = v26;
    v43 = 2112;
    v44 = v27;
    _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,missingKeyReleaseTimerAlarm scheduled for: %@", buf, 0x2Au);

  }
  objc_destroyWeak(v35);

  objc_destroyWeak(&location);
}

void __56__SMReceiverCacheManager_startCacheDownloadTimeoutTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!WeakRetained)
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = v16;
    v20 = 2112;
    v21 = v17;
    v22 = 2112;
    v23 = v15;
    _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,self not found", (uint8_t *)&v18, 0x20u);
LABEL_13:

    goto LABEL_7;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = v5;
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,cache download timer timeout fired", (uint8_t *)&v18, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 48), "defaultsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("RTDefaultsMockTimeoutNextReceiverSafetyCacheDownload"));

  objc_msgSend(*(id *)(a1 + 48), "receiverContact");
  v4 = objc_claimAutoreleasedReturnValue();
  -[NSObject phoneCache](v4, "phoneCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

LABEL_7:
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 48), "receiverContact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "watchCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(WeakRetained, "receiverContact");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sessionStatus");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "sessionState");

    if (v14 == 4)
    {
      objc_msgSend(WeakRetained, "transitionToState:event:", 9, 7);
      objc_msgSend(*(id *)(a1 + 48), "receiverContact");
      v4 = objc_claimAutoreleasedReturnValue();
      -[NSObject sessionStatus](v4, "sessionStatus");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setCacheDownloadError:", 15);
      goto LABEL_13;
    }
  }
LABEL_8:

}

- (void)stopCacheDownloadTimeoutTimer
{
  void *v3;
  void *v4;

  -[SMReceiverCacheManager cacheDownloadTimeoutTimerAlarm](self, "cacheDownloadTimeoutTimerAlarm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SMReceiverCacheManager cacheDownloadTimeoutTimerAlarm](self, "cacheDownloadTimeoutTimerAlarm");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[SMReceiverCacheManager setCacheDownloadTimeoutTimerAlarm:](self, "setCacheDownloadTimeoutTimerAlarm:", 0);
  }
}

- (void)startMissingKeyReleaseTimer
{
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  RTXPCTimerAlarm *v10;
  void *v11;
  id v12;
  id v13;
  RTXPCTimerAlarm *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  objc_class *v20;
  id v21;
  id v22;
  void *v23;
  objc_class *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34[2];
  id location;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[SMReceiverCacheManager stopMissingKeyReleaseTimer](self, "stopMissingKeyReleaseTimer");
  objc_initWeak(&location, self);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMReceiverCacheManager sessionID](self, "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[SMReceiverCacheManager sessionID](self, "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.routined.SMReceiverCacheManager.missingKeyReleaseTimerIdentifierBase"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [RTXPCTimerAlarm alloc];
  -[SMReceiverCacheManager queue](self, "queue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __53__SMReceiverCacheManager_startMissingKeyReleaseTimer__block_invoke;
  v31[3] = &unk_1E929F9C0;
  objc_copyWeak(v34, &location);
  v12 = v6;
  v32 = v12;
  v13 = v5;
  v33 = v13;
  v34[1] = (id)a2;
  v14 = -[RTXPCTimerAlarm initWithIdentifier:queue:handler:](v10, "initWithIdentifier:queue:handler:", v9, v11, v31);
  -[SMReceiverCacheManager setMissingKeyReleaseTimerAlarm:](self, "setMissingKeyReleaseTimerAlarm:", v14);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 30.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMReceiverCacheManager missingKeyReleaseTimerAlarm](self, "missingKeyReleaseTimerAlarm");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v16, "fireWithDate:error:", v15, &v30);
  v17 = v30;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v37 = v28;
      v38 = 2112;
      v39 = v21;
      v40 = 2112;
      v41 = v22;
      v42 = 2112;
      v43 = v23;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,missingKeyReleaseTimerAlarm fireWithDate hit error: %@", buf, 0x2Au);

    }
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    -[SMReceiverCacheManager sessionID](self, "sessionID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringFromDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v37 = v29;
    v38 = 2112;
    v39 = v25;
    v40 = 2112;
    v41 = v26;
    v42 = 2112;
    v43 = v27;
    _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,missingKeyReleaseTimerAlarm scheduled for: %@", buf, 0x2Au);

  }
  objc_destroyWeak(v34);

  objc_destroyWeak(&location);
}

void __53__SMReceiverCacheManager_startMissingKeyReleaseTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v5;
      v16 = 2112;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,missing key release wait timer fired", (uint8_t *)&v14, 0x20u);

    }
    objc_msgSend(WeakRetained, "receiverContact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sessionStatus");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "sessionState");

    if (v10 == 2)
      objc_msgSend(WeakRetained, "transitionToState:event:", 8, 8);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,self not found", (uint8_t *)&v14, 0x20u);

    }
  }

}

- (void)stopMissingKeyReleaseTimer
{
  void *v3;
  void *v4;

  -[SMReceiverCacheManager missingKeyReleaseTimerAlarm](self, "missingKeyReleaseTimerAlarm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SMReceiverCacheManager missingKeyReleaseTimerAlarm](self, "missingKeyReleaseTimerAlarm");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[SMReceiverCacheManager setMissingKeyReleaseTimerAlarm:](self, "setMissingKeyReleaseTimerAlarm:", 0);
  }
}

- (BOOL)shouldRetryZoneShareAcceptanceForError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  unint64_t v6;
  unsigned int v7;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if (v5)
  {
    v6 = objc_msgSend(v3, "code");
    if (v6 <= 0x1A)
      v7 = (0x3FFE1FDu >> v6) & 1;
    else
      LOBYTE(v7) = 1;
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (BOOL)shouldRetryCacheDownloadForError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  unint64_t v6;
  BOOL v7;
  void *v8;
  int v9;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D8BB18]);

  if (v5)
  {
    v6 = objc_msgSend(v3, "code");
    if (v6 >= 9)
      v7 = 1;
    else
      v7 = (0x103u >> v6) & 1;
  }
  else
  {
    objc_msgSend(v3, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C947D8]);

    if (v9)
      v7 = objc_msgSend(v3, "code") != 7;
    else
      v7 = 1;
  }

  return v7;
}

- (int64_t)normalizedSMErrorForCacheDownloadError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  int64_t v6;
  void *v7;
  int v8;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if (v5)
  {
    if (objc_msgSend(v3, "code") == 3)
    {
      v6 = 46;
    }
    else if (objc_msgSend(v3, "code") == 7)
    {
      v6 = 12;
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    objc_msgSend(v3, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D8BB70]);

    if (v8)
      v6 = objc_msgSend(v3, "code");
    else
      v6 = 0;
  }

  return v6;
}

- (void)transitionToState:(int64_t)a3 event:(int64_t)a4
{
  SMReceiverCacheManager *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  SMReceiverCacheManager *v25;
  const char *v26;
  void *v27;
  const char *v28;
  NSObject *v29;
  NSObject *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  const char *v37;
  NSObject *v38;
  const char *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  objc_class *v49;
  int v50;
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
  uint64_t v61;
  void *v62;
  objc_class *v63;
  void *v64;
  void *v65;
  void *v66;
  objc_class *v67;
  void *v68;
  void *v69;
  objc_class *v70;
  int v71;
  objc_class *v72;
  void *v73;
  void *v74;
  int v75;
  objc_class *v76;
  void *v77;
  void *v78;
  int v79;
  objc_class *v80;
  void *v81;
  void *v82;
  int v83;
  objc_class *v84;
  void *v85;
  void *v86;
  int v87;
  objc_class *v88;
  void *v89;
  void *v90;
  int v91;
  objc_class *v92;
  void *v93;
  void *v94;
  int v95;
  objc_class *v96;
  void *v97;
  void *v98;
  int v99;
  objc_class *v100;
  void *v101;
  void *v102;
  int64_t v103;
  int64_t v104;
  uint8_t buf[4];
  int64_t v106;
  __int16 v107;
  void *v108;
  __int16 v109;
  _BYTE v110[28];
  __int16 v111;
  void *v112;
  uint64_t v113;

  v7 = self;
  v113 = *MEMORY[0x1E0C80C00];
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sessionStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "sessionState");

  objc_msgSend(MEMORY[0x1E0D8B9C8], "convertSessionStateToString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[SMReceiverCacheManager sessionID](v7, "sessionID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v106 = (int64_t)v13;
      v107 = 2112;
      v108 = v15;
      v109 = 2112;
      *(_QWORD *)v110 = v16;
      *(_WORD *)&v110[8] = 2112;
      *(_QWORD *)&v110[10] = v11;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,attempted state transition when already in that state,%@", buf, 0x2Au);

    }
    goto LABEL_92;
  }
  objc_msgSend(MEMORY[0x1E0D8B9C8], "convertSessionStateToString:", a3);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "receiverEventToString:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    -[SMReceiverCacheManager sessionID](v7, "sessionID");
    v103 = a4;
    v19 = v12;
    v20 = v11;
    v21 = v17;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v104 = a3;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v25 = v7;
    v26 = a2;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v106 = (int64_t)v22;
    v107 = 2112;
    v108 = v24;
    v109 = 2112;
    *(_QWORD *)v110 = v27;
    *(_WORD *)&v110[8] = 2112;
    *(_QWORD *)&v110[10] = v20;
    *(_WORD *)&v110[18] = 2112;
    *(_QWORD *)&v110[20] = v19;
    v111 = 2112;
    v112 = v21;
    _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,fromState:%@,toState:%@,event:%@", buf, 0x3Eu);

    v17 = v21;
    v11 = v20;
    v12 = v19;
    a4 = v103;

    a2 = v26;
    v7 = v25;

    a3 = v104;
  }

  switch(v10)
  {
    case 1:
      switch(a3)
      {
        case 2:
          -[SMReceiverCacheManager transitionFromInitializingToActiveDueToEvent:](v7, "transitionFromInitializingToActiveDueToEvent:", a4);
          goto LABEL_89;
        case 3:
          -[SMReceiverCacheManager transitionFromInitializingToTriggeredDueToEvent:](v7, "transitionFromInitializingToTriggeredDueToEvent:", a4);
          goto LABEL_89;
        case 4:
          -[SMReceiverCacheManager transitionFromInitializingToCacheReleasedDueToEvent:](v7, "transitionFromInitializingToCacheReleasedDueToEvent:", a4);
          goto LABEL_89;
        case 5:
          -[SMReceiverCacheManager transitionFromInitializingToCachePersistenceDueToEvent:](v7, "transitionFromInitializingToCachePersistenceDueToEvent:", a4);
          goto LABEL_89;
        case 6:
          -[SMReceiverCacheManager transitionFromInitializingToCleanupDueToEvent:](v7, "transitionFromInitializingToCleanupDueToEvent:", a4);
          goto LABEL_89;
        case 7:
          -[SMReceiverCacheManager transitionFromInitializingToMissingSessionInfoDueToEvent:](v7, "transitionFromInitializingToMissingSessionInfoDueToEvent:", a4);
          goto LABEL_89;
        case 8:
          -[SMReceiverCacheManager transitionFromInitializingToMissingKeyReleaseInfoDueToEvent:](v7, "transitionFromInitializingToMissingKeyReleaseInfoDueToEvent:", a4);
          goto LABEL_89;
        case 9:
          -[SMReceiverCacheManager transitionFromInitializingToCacheDownloadFailedDueToEvent:](v7, "transitionFromInitializingToCacheDownloadFailedDueToEvent:", a4);
          goto LABEL_89;
        default:
          v39 = a2;
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            -[SMReceiverCacheManager sessionID](v7, "sessionID");
            v99 = a3;
            a3 = objc_claimAutoreleasedReturnValue();
            v100 = (objc_class *)objc_opt_class();
            NSStringFromClass(v100);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(v39);
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v106 = a3;
            v107 = 2112;
            v108 = v101;
            v109 = 2112;
            *(_QWORD *)v110 = v102;
            *(_WORD *)&v110[8] = 1024;
            *(_DWORD *)&v110[10] = v99;
            *(_WORD *)&v110[14] = 2112;
            *(_QWORD *)&v110[16] = v11;
            _os_log_error_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,unknown or unhandled toState:%d for fromState:%@", buf, 0x30u);

            LODWORD(a3) = v99;
          }

          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
            goto LABEL_80;
          goto LABEL_81;
      }
    case 2:
      switch(a3)
      {
        case 8:
          -[SMReceiverCacheManager transitionFromActiveToMissingKeyReleaseInfoDueToEvent:](v7, "transitionFromActiveToMissingKeyReleaseInfoDueToEvent:", a4);
          goto LABEL_89;
        case 6:
          -[SMReceiverCacheManager transitionFromActiveToCleanupDueToEvent:](v7, "transitionFromActiveToCleanupDueToEvent:", a4);
          goto LABEL_89;
        case 3:
          -[SMReceiverCacheManager transitionFromActiveToTriggeredDueToEvent:](v7, "transitionFromActiveToTriggeredDueToEvent:", a4);
          goto LABEL_89;
      }
      v39 = a2;
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        -[SMReceiverCacheManager sessionID](v7, "sessionID");
        v87 = a3;
        a3 = objc_claimAutoreleasedReturnValue();
        v88 = (objc_class *)objc_opt_class();
        NSStringFromClass(v88);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(v39);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v106 = a3;
        v107 = 2112;
        v108 = v89;
        v109 = 2112;
        *(_QWORD *)v110 = v90;
        *(_WORD *)&v110[8] = 1024;
        *(_DWORD *)&v110[10] = v87;
        *(_WORD *)&v110[14] = 2112;
        *(_QWORD *)&v110[16] = v11;
        _os_log_error_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,unknown or unhandled toState:%d for fromState:%@", buf, 0x30u);

        LODWORD(a3) = v87;
      }

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
        goto LABEL_80;
      goto LABEL_81;
    case 3:
      if (a3 == 6)
      {
        -[SMReceiverCacheManager transitionFromTriggeredToCleanupDueToEvent:](v7, "transitionFromTriggeredToCleanupDueToEvent:", a4);
        goto LABEL_89;
      }
      if (a3 == 4)
      {
        -[SMReceiverCacheManager transitionFromTriggeredToCacheReleasedDueToEvent:](v7, "transitionFromTriggeredToCacheReleasedDueToEvent:", a4);
        goto LABEL_89;
      }
      v39 = a2;
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        -[SMReceiverCacheManager sessionID](v7, "sessionID");
        v75 = a3;
        a3 = objc_claimAutoreleasedReturnValue();
        v76 = (objc_class *)objc_opt_class();
        NSStringFromClass(v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(v39);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v106 = a3;
        v107 = 2112;
        v108 = v77;
        v109 = 2112;
        *(_QWORD *)v110 = v78;
        *(_WORD *)&v110[8] = 1024;
        *(_DWORD *)&v110[10] = v75;
        *(_WORD *)&v110[14] = 2112;
        *(_QWORD *)&v110[16] = v11;
        _os_log_error_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,unknown or unhandled toState:%d for fromState:%@", buf, 0x30u);

        LODWORD(a3) = v75;
      }

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
        goto LABEL_80;
      goto LABEL_81;
    case 4:
      switch(a3)
      {
        case 5:
          -[SMReceiverCacheManager transitionFromCacheReleasedToCachePersistenceDueToEvent:](v7, "transitionFromCacheReleasedToCachePersistenceDueToEvent:", a4);
          goto LABEL_89;
        case 6:
          -[SMReceiverCacheManager transitionFromCacheReleasedToCleanupDueToEvent:](v7, "transitionFromCacheReleasedToCleanupDueToEvent:", a4);
          goto LABEL_89;
        case 9:
          -[SMReceiverCacheManager transitionFromCacheReleasedToCacheDownloadFailedDueToEvent:](v7, "transitionFromCacheReleasedToCacheDownloadFailedDueToEvent:", a4);
          goto LABEL_89;
      }
      v39 = a2;
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        -[SMReceiverCacheManager sessionID](v7, "sessionID");
        v91 = a3;
        a3 = objc_claimAutoreleasedReturnValue();
        v92 = (objc_class *)objc_opt_class();
        NSStringFromClass(v92);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(v39);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v106 = a3;
        v107 = 2112;
        v108 = v93;
        v109 = 2112;
        *(_QWORD *)v110 = v94;
        *(_WORD *)&v110[8] = 1024;
        *(_DWORD *)&v110[10] = v91;
        *(_WORD *)&v110[14] = 2112;
        *(_QWORD *)&v110[16] = v11;
        _os_log_error_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,unknown or unhandled toState:%d for fromState:%@", buf, 0x30u);

        LODWORD(a3) = v91;
      }

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
        goto LABEL_80;
      goto LABEL_81;
    case 5:
      if (a3 == 6)
      {
        -[SMReceiverCacheManager transitionFromCachePersistenceToCleanupDueToEvent:](v7, "transitionFromCachePersistenceToCleanupDueToEvent:", a4);
        goto LABEL_89;
      }
      v39 = a2;
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        -[SMReceiverCacheManager sessionID](v7, "sessionID");
        v71 = a3;
        a3 = objc_claimAutoreleasedReturnValue();
        v72 = (objc_class *)objc_opt_class();
        NSStringFromClass(v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(v39);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v106 = a3;
        v107 = 2112;
        v108 = v73;
        v109 = 2112;
        *(_QWORD *)v110 = v74;
        *(_WORD *)&v110[8] = 1024;
        *(_DWORD *)&v110[10] = v71;
        *(_WORD *)&v110[14] = 2112;
        *(_QWORD *)&v110[16] = v11;
        _os_log_error_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,unknown or unhandled toState:%d for fromState:%@", buf, 0x30u);

        LODWORD(a3) = v71;
      }

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
        goto LABEL_80;
      goto LABEL_81;
    case 6:
      v37 = a2;
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        -[SMReceiverCacheManager sessionID](v7, "sessionID");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = (objc_class *)objc_opt_class();
        NSStringFromClass(v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(v37);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v106 = (int64_t)v66;
        v107 = 2112;
        v108 = v68;
        v109 = 2112;
        *(_QWORD *)v110 = v69;
        _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,tried to transition out of Cleanup state", buf, 0x20u);

      }
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v30 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
        goto LABEL_29;
      v70 = (objc_class *)objc_opt_class();
      NSStringFromClass(v70);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(v37);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v106 = (int64_t)v32;
      v107 = 2112;
      v108 = v33;
      v34 = "#SafetyCache,Receiver,%@,%@,tried to transition out of Cleanup state";
      v35 = v30;
      v36 = 22;
      goto LABEL_94;
    case 7:
      if (a3 == 3)
      {
        -[SMReceiverCacheManager transitionFromMissingSessionInfoToTriggeredDueToEvent:](v7, "transitionFromMissingSessionInfoToTriggeredDueToEvent:", a4);
        goto LABEL_89;
      }
      if (a3 == 6)
      {
        -[SMReceiverCacheManager transitionFromMissingSessionInfoToCleanupDueToEvent:](v7, "transitionFromMissingSessionInfoToCleanupDueToEvent:", a4);
        goto LABEL_89;
      }
      v39 = a2;
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        -[SMReceiverCacheManager sessionID](v7, "sessionID");
        v79 = a3;
        a3 = objc_claimAutoreleasedReturnValue();
        v80 = (objc_class *)objc_opt_class();
        NSStringFromClass(v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(v39);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v106 = a3;
        v107 = 2112;
        v108 = v81;
        v109 = 2112;
        *(_QWORD *)v110 = v82;
        *(_WORD *)&v110[8] = 1024;
        *(_DWORD *)&v110[10] = v79;
        *(_WORD *)&v110[14] = 2112;
        *(_QWORD *)&v110[16] = v11;
        _os_log_error_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,unknown or unhandled toState:%d for fromState:%@", buf, 0x30u);

        LODWORD(a3) = v79;
      }

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
        goto LABEL_80;
      goto LABEL_81;
    case 8:
      if (a3 == 3)
      {
        -[SMReceiverCacheManager transitionFromMissingKeyReleaseInfoToTriggeredDueToEvent:](v7, "transitionFromMissingKeyReleaseInfoToTriggeredDueToEvent:", a4);
        goto LABEL_89;
      }
      if (a3 == 6)
      {
        -[SMReceiverCacheManager transitionFromMissingKeyReleaseInfoToCleanupDueToEvent:](v7, "transitionFromMissingKeyReleaseInfoToCleanupDueToEvent:", a4);
        goto LABEL_89;
      }
      v39 = a2;
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        -[SMReceiverCacheManager sessionID](v7, "sessionID");
        v83 = a3;
        a3 = objc_claimAutoreleasedReturnValue();
        v84 = (objc_class *)objc_opt_class();
        NSStringFromClass(v84);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(v39);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v106 = a3;
        v107 = 2112;
        v108 = v85;
        v109 = 2112;
        *(_QWORD *)v110 = v86;
        *(_WORD *)&v110[8] = 1024;
        *(_DWORD *)&v110[10] = v83;
        *(_WORD *)&v110[14] = 2112;
        *(_QWORD *)&v110[16] = v11;
        _os_log_error_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,unknown or unhandled toState:%d for fromState:%@", buf, 0x30u);

        LODWORD(a3) = v83;
      }

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
        goto LABEL_80;
      goto LABEL_81;
    case 9:
      switch(a3)
      {
        case 6:
          -[SMReceiverCacheManager transitionFromCacheDownloadFailedToCleanupDueToEvent:](v7, "transitionFromCacheDownloadFailedToCleanupDueToEvent:", a4);
          goto LABEL_89;
        case 5:
          -[SMReceiverCacheManager transitionFromCacheDownloadFailedToCachePersistenceDueToEvent:](v7, "transitionFromCacheDownloadFailedToCachePersistenceDueToEvent:", a4);
LABEL_89:
          objc_msgSend(MEMORY[0x1E0C99D68], "now", v103);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[SMReceiverCacheManager receiverContact](v7, "receiverContact");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "sessionStatus");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "setLastUpdateDate:", v53);

          -[SMReceiverCacheManager delegate](v7, "delegate");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[SMReceiverCacheManager sessionID](v7, "sessionID");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[SMReceiverCacheManager sessionStatus](v7, "sessionStatus");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "sessionStatusChanged:status:", v57, v58);

          -[SMReceiverCacheManager receiverContact](v7, "receiverContact");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "sessionStatus");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend(v60, "sessionState");

          if (v61 != 6)
            -[SMReceiverCacheManager updateReceiverContactInStore](v7, "updateReceiverContactInStore");
          goto LABEL_91;
        case 4:
          -[SMReceiverCacheManager transitionFromCacheDownloadFailedToCacheReleasedDueToEvent:](v7, "transitionFromCacheDownloadFailedToCacheReleasedDueToEvent:", a4);
          goto LABEL_89;
      }
      v39 = a2;
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        -[SMReceiverCacheManager sessionID](v7, "sessionID");
        v95 = a3;
        a3 = objc_claimAutoreleasedReturnValue();
        v96 = (objc_class *)objc_opt_class();
        NSStringFromClass(v96);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(v39);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v106 = a3;
        v107 = 2112;
        v108 = v97;
        v109 = 2112;
        *(_QWORD *)v110 = v98;
        *(_WORD *)&v110[8] = 1024;
        *(_DWORD *)&v110[10] = v95;
        *(_WORD *)&v110[14] = 2112;
        *(_QWORD *)&v110[16] = v11;
        _os_log_error_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,unknown or unhandled toState:%d for fromState:%@", buf, 0x30u);

        LODWORD(a3) = v95;
      }

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
      {
LABEL_80:
        v49 = (objc_class *)objc_opt_class();
        NSStringFromClass(v49);
        v50 = a3;
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(v39);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v106 = (int64_t)v51;
        v107 = 2112;
        v108 = v52;
        v109 = 1024;
        *(_DWORD *)v110 = v50;
        *(_WORD *)&v110[4] = 2112;
        *(_QWORD *)&v110[6] = v11;
        _os_log_fault_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_FAULT, "#SafetyCache,Receiver,%@,%@,unknown or unhandled toState:%d for fromState:%@", buf, 0x26u);

      }
LABEL_81:

LABEL_91:
LABEL_92:

      return;
    default:
      v28 = a2;
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        -[SMReceiverCacheManager sessionID](v7, "sessionID");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = (objc_class *)objc_opt_class();
        NSStringFromClass(v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(v28);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v106 = (int64_t)v62;
        v107 = 2112;
        v108 = v64;
        v109 = 2112;
        *(_QWORD *)v110 = v65;
        *(_WORD *)&v110[8] = 1024;
        *(_DWORD *)&v110[10] = v10;
        _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,unknown or unhandled fromState:%d", buf, 0x26u);

      }
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v30 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
        goto LABEL_29;
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(v28);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v106 = (int64_t)v32;
      v107 = 2112;
      v108 = v33;
      v109 = 1024;
      *(_DWORD *)v110 = v10;
      v34 = "#SafetyCache,Receiver,%@,%@,unknown or unhandled fromState:%d";
      v35 = v30;
      v36 = 28;
LABEL_94:
      _os_log_fault_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_FAULT, v34, buf, v36);

LABEL_29:
      goto LABEL_91;
  }
}

- (void)transitionFromInitializingToActiveDueToEvent:(int64_t)a3
{
  void *v5;
  void *v6;

  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSessionState:", 2);

  -[SMReceiverCacheManager acceptShareInvitation:](self, "acceptShareInvitation:", a3);
}

- (void)transitionFromInitializingToTriggeredDueToEvent:(int64_t)a3
{
  void *v5;
  void *v6;

  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSessionState:", 3);

  -[SMReceiverCacheManager acceptShareInvitation:](self, "acceptShareInvitation:", a3);
}

- (void)transitionFromInitializingToCacheReleasedDueToEvent:(int64_t)a3
{
  void *v5;
  void *v6;

  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSessionState:", 4);

  -[SMReceiverCacheManager fetchSafetyCacheData:](self, "fetchSafetyCacheData:", a3);
}

- (void)transitionFromInitializingToCacheDownloadFailedDueToEvent:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SMReceiverCacheManager receiverContact](self, "receiverContact", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSessionState:", 4);

  -[SMReceiverCacheManager fetchSafetyCacheData:](self, "fetchSafetyCacheData:", 15);
}

- (void)transitionFromInitializingToCachePersistenceDueToEvent:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SMReceiverCacheManager receiverContact](self, "receiverContact", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSessionState:", 5);

  -[SMReceiverCacheManager cachePersistenceStartTimer](self, "cachePersistenceStartTimer");
}

- (void)transitionFromInitializingToCleanupDueToEvent:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SMReceiverCacheManager receiverContact](self, "receiverContact", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSessionState:", 6);

  -[SMReceiverCacheManager deleteReceiverContactFromStore:](self, "deleteReceiverContactFromStore:", 2);
}

- (void)transitionFromActiveToTriggeredDueToEvent:(int64_t)a3
{
  void *v5;
  void *v6;

  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSessionState:", 3);

  -[SMReceiverCacheManager acceptShareInvitation:](self, "acceptShareInvitation:", a3);
}

- (void)transitionFromInitializingToMissingSessionInfoDueToEvent:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  const char *v40;
  _QWORD v41[4];
  id v42;
  SMReceiverCacheManager *v43;
  const char *v44;
  void *v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  -[SMReceiverCacheManager receiverContact](self, "receiverContact", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sessionStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "sessionStartInfoRequestCount");
  if (v10 < 1)
  {
    v40 = a2;
  }
  else
  {
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sessionStatus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastSessionStartInfoRequestDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceNow");
    if (v11 > -60.0)
    {

LABEL_9:
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        -[SMReceiverCacheManager sessionID](self, "sessionID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v47 = v17;
        v48 = 2112;
        v49 = v19;
        v50 = 2112;
        v51 = v20;
        _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,repeated attempts to request SMSessionStartInfo, drop request", buf, 0x20u);

      }
      goto LABEL_14;
    }
    v40 = a2;
  }
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sessionStatus");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "sessionStartInfoRequestCount");

  if (v10 >= 1)
  {

  }
  v15 = v14 <= 5;
  a2 = v40;
  if (!v15)
    goto LABEL_9;
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sessionStatus");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSessionState:", 7);

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    -[SMReceiverCacheManager sessionID](self, "sessionID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(v40);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v47 = v24;
    v48 = 2112;
    v49 = v26;
    v50 = 2112;
    v51 = v27;
    _os_log_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,send sessionStartInfoRequestMessage", buf, 0x20u);

  }
  v28 = objc_alloc(MEMORY[0x1E0D8BA60]);
  -[SMReceiverCacheManager sessionID](self, "sessionID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sessionStatus");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "receiverHandle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v28, "initWithSessionID:receiverHandle:", v29, v32);

  -[SMReceiverCacheManager messagingService](self, "messagingService");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_alloc(MEMORY[0x1E0D8B918]);
  -[SMReceiverCacheManager sessionStatus](self, "sessionStatus");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "initiatorHandle");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v35, "initWithReceiverHandles:identifier:displayName:", v38, 0, 0);
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __83__SMReceiverCacheManager_transitionFromInitializingToMissingSessionInfoDueToEvent___block_invoke;
  v41[3] = &unk_1E929F5E8;
  v42 = v33;
  v43 = self;
  v44 = v40;
  v16 = v33;
  objc_msgSend(v34, "sendIDSMessage:toConversation:completion:", v16, v39, v41);

LABEL_14:
}

void __83__SMReceiverCacheManager_transitionFromInitializingToMissingSessionInfoDueToEvent___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138413314;
    v20 = v7;
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    v25 = 1024;
    v26 = a2;
    v27 = 2112;
    v28 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,SMMessageTypeSessionStartInfoRequest, sent with status:%d error:%@", (uint8_t *)&v19, 0x30u);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "receiverContact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sessionStatus");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLastSessionStartInfoRequestDate:", v11);

  objc_msgSend(*(id *)(a1 + 40), "receiverContact");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sessionStatus");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "sessionStartInfoRequestCount") + 1;
  objc_msgSend(*(id *)(a1 + 40), "receiverContact");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sessionStatus");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSessionStartInfoRequestCount:", v16);

  objc_msgSend(*(id *)(a1 + 40), "updateReceiverContactInStore");
}

- (void)transitionFromInitializingToMissingKeyReleaseInfoDueToEvent:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SMReceiverCacheManager receiverContact](self, "receiverContact", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSessionState:", 8);

  -[SMReceiverCacheManager requestMissingKeyReleaseInfo](self, "requestMissingKeyReleaseInfo");
}

- (void)transitionFromActiveToMissingKeyReleaseInfoDueToEvent:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SMReceiverCacheManager receiverContact](self, "receiverContact", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSessionState:", 8);

  -[SMReceiverCacheManager requestMissingKeyReleaseInfo](self, "requestMissingKeyReleaseInfo");
}

- (void)requestMissingKeyReleaseInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  NSObject *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  const char *v34;
  _QWORD v35[4];
  id v36;
  SMReceiverCacheManager *v37;
  const char *v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sessionStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "keyReleaseInfoRequestCount");
  if (v9 < 1)
  {
    v34 = a2;
  }
  else
  {
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sessionStatus");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastKeyReleaseInfoRequestDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceNow");
    if (v10 > -60.0)
    {

LABEL_9:
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        -[SMReceiverCacheManager sessionID](self, "sessionID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v41 = v16;
        v42 = 2112;
        v43 = v18;
        v44 = 2112;
        v45 = v19;
        _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,repeated attempts to request KeyReleaseInfo, drop request", buf, 0x20u);

      }
      goto LABEL_14;
    }
    v34 = a2;
  }
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sessionStatus");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "keyReleaseInfoRequestCount");

  if (v9 >= 1)
  {

  }
  v14 = v13 <= 5;
  a2 = v34;
  if (!v14)
    goto LABEL_9;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    -[SMReceiverCacheManager sessionID](self, "sessionID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(v34);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v41 = v21;
    v42 = 2112;
    v43 = v23;
    v44 = 2112;
    v45 = v24;
    _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,send keyReleaseInfoRequestMessage", buf, 0x20u);

  }
  v25 = objc_alloc(MEMORY[0x1E0D8B980]);
  -[SMReceiverCacheManager sessionID](self, "sessionID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v25, "initWithSessionID:", v26);

  -[SMReceiverCacheManager messagingService](self, "messagingService");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_alloc(MEMORY[0x1E0D8B918]);
  -[SMReceiverCacheManager sessionStatus](self, "sessionStatus");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "initiatorHandle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v29, "initWithReceiverHandles:identifier:displayName:", v32, 0, 0);
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __54__SMReceiverCacheManager_requestMissingKeyReleaseInfo__block_invoke;
  v35[3] = &unk_1E929F5E8;
  v36 = v27;
  v37 = self;
  v38 = v34;
  v15 = v27;
  objc_msgSend(v28, "sendIDSMessage:toConversation:completion:", v15, v33, v35);

LABEL_14:
}

void __54__SMReceiverCacheManager_requestMissingKeyReleaseInfo__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138413314;
    v20 = v7;
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    v25 = 1024;
    v26 = a2;
    v27 = 2112;
    v28 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,SMMessageTypeKeyReleaseInfoRequest, sent with status:%d error:%@", (uint8_t *)&v19, 0x30u);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "receiverContact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sessionStatus");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLastKeyReleaseInfoRequestDate:", v11);

  objc_msgSend(*(id *)(a1 + 40), "receiverContact");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sessionStatus");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "keyReleaseInfoRequestCount") + 1;
  objc_msgSend(*(id *)(a1 + 40), "receiverContact");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sessionStatus");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setKeyReleaseInfoRequestCount:", v16);

  objc_msgSend(*(id *)(a1 + 40), "updateReceiverContactInStore");
}

- (void)transitionFromActiveToCleanupDueToEvent:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SMReceiverCacheManager receiverContact](self, "receiverContact", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSessionState:", 6);

  -[SMReceiverCacheManager deleteReceiverContactFromStore:](self, "deleteReceiverContactFromStore:", 2);
}

- (void)transitionFromTriggeredToCacheReleasedDueToEvent:(int64_t)a3
{
  void *v5;
  void *v6;

  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSessionState:", 4);

  -[SMReceiverCacheManager fetchSafetyCacheData:](self, "fetchSafetyCacheData:", a3);
}

- (void)transitionFromCacheReleasedToCacheDownloadFailedDueToEvent:(int64_t)a3
{
  void *v3;
  id v4;

  -[SMReceiverCacheManager receiverContact](self, "receiverContact", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSessionState:", 9);

}

- (void)transitionFromCacheDownloadFailedToCacheReleasedDueToEvent:(int64_t)a3
{
  void *v5;
  void *v6;

  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSessionState:", 4);

  -[SMReceiverCacheManager fetchSafetyCacheData:](self, "fetchSafetyCacheData:", a3);
}

- (void)transitionFromCacheDownloadFailedToCachePersistenceDueToEvent:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SMReceiverCacheManager receiverContact](self, "receiverContact", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSessionState:", 5);

  -[SMReceiverCacheManager cachePersistenceStartTimer](self, "cachePersistenceStartTimer");
}

- (void)transitionFromCacheDownloadFailedToCleanupDueToEvent:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SMReceiverCacheManager receiverContact](self, "receiverContact", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSessionState:", 6);

  -[SMReceiverCacheManager deleteReceiverContactFromStore:](self, "deleteReceiverContactFromStore:", 2);
}

- (void)transitionFromTriggeredToCleanupDueToEvent:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SMReceiverCacheManager receiverContact](self, "receiverContact", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSessionState:", 6);

  -[SMReceiverCacheManager deleteReceiverContactFromStore:](self, "deleteReceiverContactFromStore:", 2);
}

- (void)transitionFromCacheReleasedToCachePersistenceDueToEvent:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SMReceiverCacheManager receiverContact](self, "receiverContact", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSessionState:", 5);

  -[SMReceiverCacheManager cachePersistenceStartTimer](self, "cachePersistenceStartTimer");
}

- (void)transitionFromCacheReleasedToCleanupDueToEvent:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SMReceiverCacheManager receiverContact](self, "receiverContact", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSessionState:", 6);

  -[SMReceiverCacheManager deleteReceiverContactFromStore:](self, "deleteReceiverContactFromStore:", 2);
}

- (void)transitionFromCachePersistenceToCleanupDueToEvent:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SMReceiverCacheManager receiverContact](self, "receiverContact", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSessionState:", 6);

  -[SMReceiverCacheManager cachePersistenceStopTimer](self, "cachePersistenceStopTimer");
  -[SMReceiverCacheManager deleteReceiverContactFromStore:](self, "deleteReceiverContactFromStore:", 2);
}

- (void)transitionFromMissingSessionInfoToTriggeredDueToEvent:(int64_t)a3
{
  void *v5;
  void *v6;

  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSessionState:", 3);

  -[SMReceiverCacheManager acceptShareInvitation:](self, "acceptShareInvitation:", a3);
}

- (void)transitionFromMissingSessionInfoToCleanupDueToEvent:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SMReceiverCacheManager receiverContact](self, "receiverContact", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSessionState:", 6);

  -[SMReceiverCacheManager deleteReceiverContactFromStore:](self, "deleteReceiverContactFromStore:", 2);
}

- (void)transitionFromMissingKeyReleaseInfoToTriggeredDueToEvent:(int64_t)a3
{
  void *v5;
  void *v6;

  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSessionState:", 3);

  -[SMReceiverCacheManager acceptShareInvitation:](self, "acceptShareInvitation:", a3);
}

- (void)transitionFromMissingKeyReleaseInfoToCleanupDueToEvent:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SMReceiverCacheManager receiverContact](self, "receiverContact", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSessionState:", 6);

  -[SMReceiverCacheManager deleteReceiverContactFromStore:](self, "deleteReceiverContactFromStore:", 2);
}

- (void)cachePersistenceStartTimer
{
  void *v4;
  double v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  RTXPCTimerAlarm *v12;
  void *v13;
  id v14;
  id v15;
  RTXPCTimerAlarm *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  objc_class *v21;
  id v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40[2];
  id location;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  -[SMReceiverCacheManager cachePersistenceStopTimer](self, "cachePersistenceStopTimer");
  -[SMReceiverCacheManager getCachePersistenceAlarmDate](self, "getCachePersistenceAlarmDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceNow");
  if (v5 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v43 = v26;
      v44 = 2112;
      v45 = v28;
      v46 = 2112;
      v47 = v29;
      _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,cache persistence timer expired in the past", buf, 0x20u);

    }
    -[SMReceiverCacheManager onCachePersistenceExpiry](self, "onCachePersistenceExpiry");
  }
  else
  {
    objc_initWeak(&location, self);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverCacheManager sessionID](self, "sessionID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    -[SMReceiverCacheManager sessionID](self, "sessionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.routined.SMReceiverCacheManager.cachePersistenceTimerIdentifierBase"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = [RTXPCTimerAlarm alloc];
    -[SMReceiverCacheManager queue](self, "queue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __52__SMReceiverCacheManager_cachePersistenceStartTimer__block_invoke;
    v37[3] = &unk_1E929F9C0;
    objc_copyWeak(v40, &location);
    v14 = v8;
    v38 = v14;
    v15 = v7;
    v39 = v15;
    v40[1] = (id)a2;
    v16 = -[RTXPCTimerAlarm initWithIdentifier:queue:handler:](v12, "initWithIdentifier:queue:handler:", v11, v13, v37);
    -[SMReceiverCacheManager setCachePersistenceTimerAlarm:](self, "setCachePersistenceTimerAlarm:", v16);

    -[SMReceiverCacheManager cachePersistenceTimerAlarm](self, "cachePersistenceTimerAlarm");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    objc_msgSend(v17, "fireWithDate:error:", v4, &v36);
    v18 = v36;

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        -[SMReceiverCacheManager sessionID](self, "sessionID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v43 = v34;
        v44 = 2112;
        v45 = v22;
        v46 = 2112;
        v47 = v23;
        v48 = 2112;
        v49 = v24;
        _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,cachePersistenceTimerAlarm fireWithDate hit error: %@", buf, 0x2Au);

      }
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringFromDate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v43 = v35;
      v44 = 2112;
      v45 = v31;
      v46 = 2112;
      v47 = v32;
      v48 = 2112;
      v49 = v33;
      _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,cachePersistenceTimerAlarm scheduled for: %@", buf, 0x2Au);

    }
    objc_destroyWeak(v40);

    objc_destroyWeak(&location);
  }

}

void __52__SMReceiverCacheManager_cachePersistenceStartTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,cache persistence timer fired", (uint8_t *)&v11, 0x20u);

    }
    objc_msgSend(WeakRetained, "onCachePersistenceExpiry");
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,self not found", (uint8_t *)&v11, 0x20u);

    }
  }

}

- (id)getCachePersistenceAlarmDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sessionStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacheExpiryDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0C99D68];
    -[SMReceiverCacheManager cachePersistenceTime](self, "cachePersistenceTime");
    objc_msgSend(v6, "dateWithTimeIntervalSinceNow:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sessionStatus");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCacheExpiryDate:", v7);

  }
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sessionStatus");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cacheExpiryDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)cachePersistenceStopTimer
{
  void *v3;
  void *v4;

  -[SMReceiverCacheManager cachePersistenceTimerAlarm](self, "cachePersistenceTimerAlarm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SMReceiverCacheManager cachePersistenceTimerAlarm](self, "cachePersistenceTimerAlarm");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[SMReceiverCacheManager setCachePersistenceTimerAlarm:](self, "setCachePersistenceTimerAlarm:", 0);
  }
}

- (void)_setupCloudKitFunction
{
  CKContainer *v3;
  CKContainer *container;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  id v9;
  void *v10;
  SMCloudKitFunction *v11;
  SMCloudKitFunction *cloudKitFunction;
  void *v13;
  void *v14;
  double v15;
  NSObject *v16;
  double cachePersistenceTime;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  double v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  +[SMCloudKitZone getContainer](SMCloudKitZone, "getContainer");
  v3 = (CKContainer *)objc_claimAutoreleasedReturnValue();
  container = self->_container;
  self->_container = v3;

  -[SMReceiverCacheManager defaultsManager](self, "defaultsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsSafetyCacheUseDevEnvForCloudKitFunction"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  v8 = v7;
  v9 = objc_alloc(MEMORY[0x1E0D8B908]);
  -[SMReceiverCacheManager queue](self, "queue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (SMCloudKitFunction *)objc_msgSend(v9, "initWithEnvironment:version:queue:", v8, 0, v10);
  cloudKitFunction = self->_cloudKitFunction;
  self->_cloudKitFunction = v11;

  -[SMReceiverCacheManager defaultsManager](self, "defaultsManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:value:", CFSTR("RTDefaultsSafetyCachePersistenceTimeKey"), &unk_1E932D040);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  self->_cachePersistenceTime = v15;

  if (self->_cachePersistenceTime != 604800.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      cachePersistenceTime = self->_cachePersistenceTime;
      v18 = 136316162;
      v19 = "-[SMReceiverCacheManager _setupCloudKitFunction]";
      v20 = 2080;
      v21 = "overriding cache persistence time";
      v22 = 2048;
      v23 = 0x4122750000000000;
      v24 = 2048;
      v25 = cachePersistenceTime;
      v26 = 2112;
      v27 = CFSTR("RTDefaultsSafetyCachePersistenceTimeKey");
      _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", (uint8_t *)&v18, 0x34u);
    }

  }
}

- (void)acceptShareInvitation:(int64_t)a3
{
  NSObject *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void *v11;
  void *v12;
  int v13;
  void *v14;
  objc_class *v15;
  void *v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  NSObject *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  objc_class *v23;
  id v24;
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
  SMCloudKitQosOptions *v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  const char *aSelector;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  _BYTE *v53;
  id v54[2];
  id location;
  _BYTE buf[24];
  uint64_t (*v57)(uint64_t, uint64_t);
  __int128 v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (-[SMReceiverCacheManager acceptShareInvitationInProgress](self, "acceptShareInvitationInProgress"))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v10 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      v57 = v10;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,zone share accept operation already in progress", buf, 0x20u);

    }
  }
  else
  {
    aSelector = a2;
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sessionStatus");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "zoneShareAccepted");

    if (v13)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        -[SMReceiverCacheManager sessionID](self, "sessionID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v17 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v16;
        *(_WORD *)&buf[22] = 2112;
        v57 = v17;
        _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,zone share already accepted", buf, 0x20u);

      }
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "receiverEventToString:", a3);
      v6 = objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        -[SMReceiverCacheManager sessionID](self, "sessionID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v22 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v21;
        *(_WORD *)&buf[22] = 2112;
        v57 = v22;
        LOWORD(v58) = 2112;
        *(_QWORD *)((char *)&v58 + 2) = v6;
        _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,event:%@,attempting to accept the zone share", buf, 0x2Au);

      }
      -[SMReceiverCacheManager setAcceptShareInvitationInProgress:](self, "setAcceptShareInvitationInProgress:", 1);
      objc_initWeak(&location, self);
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_alloc(MEMORY[0x1E0C94CE0]);
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "sharingInvitationData");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "shareURL");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "participantID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)objc_msgSend(v24, "initWithSharingInvitationData:shareURL:participantID:", v26, v28, v30);

      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v57 = __Block_byref_object_copy__89;
      *(_QWORD *)&v58 = __Block_byref_object_dispose__89;
      *((_QWORD *)&v58 + 1) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v32 = *(void **)(*(_QWORD *)&buf[8] + 40);
      v33 = (void *)MEMORY[0x1E0CB37E8];
      -[SMReceiverCacheManager sessionStatus](self, "sessionStatus");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "numberWithInteger:", objc_msgSend(v34, "sessionState"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setValue:forKey:", v35, CFSTR("receiverSessionState"));

      v36 = *(void **)(*(_QWORD *)&buf[8] + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setValue:forKey:", v37, CFSTR("responseToEvent"));

      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverCacheManager container](self, "container");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverCacheManager queue](self, "queue");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[SMCloudKitQosOptions initWithDefaultQos:masqueradeBundleID:xpcActivity:]([SMCloudKitQosOptions alloc], "initWithDefaultQos:masqueradeBundleID:xpcActivity:", 1, 0, 0);
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __48__SMReceiverCacheManager_acceptShareInvitation___block_invoke;
      v49[3] = &unk_1E92A03D0;
      v53 = buf;
      v42 = v31;
      v50 = v42;
      objc_copyWeak(v54, &location);
      v43 = v46;
      v51 = v43;
      v44 = v45;
      v52 = v44;
      v54[1] = (id)aSelector;
      +[SMCloudKitZone acceptShareWithInvitationToken:sessionID:container:queue:qos:withCompletion:](SMCloudKitZone, "acceptShareWithInvitationToken:sessionID:container:queue:qos:withCompletion:", v47, v38, v39, v40, v41, v49);

      objc_destroyWeak(v54);
      _Block_object_dispose(buf, 8);

      objc_destroyWeak(&location);
    }
  }

}

void __48__SMReceiverCacheManager_acceptShareInvitation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("wasSuccessful"));

  if (v5)
  {
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@:%d"), v10, objc_msgSend(v5, "code"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v11, CFSTR("shareAcceptanceError"));

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v14 = v13;

  v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setValue:forKey:", v16, CFSTR("timeToAcceptShare"));

  AnalyticsSendEvent();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v18 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setAcceptShareInvitationInProgress:", 0);
    objc_msgSend(v18, "onShareInvitationAcceptenceResult:withError:", a2, v5);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(a1 + 40);
      v21 = *(_QWORD *)(a1 + 48);
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v24 = v20;
      v25 = 2112;
      v26 = v21;
      v27 = 2112;
      v28 = v22;
      v29 = 1024;
      v30 = a2;
      v31 = 2112;
      v32 = v5;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,cache manager released before zone share acceptence returned,success,%d,error,%@", buf, 0x30u);

    }
  }

}

- (void)fetchSafetyCacheData:(int64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  void *v22;
  objc_class *v23;
  id v24;
  uint64_t (*v25)(uint64_t, uint64_t);
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
  id v40;
  id v41;
  id v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  objc_class *v47;
  void *v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void *v50;
  objc_class *v51;
  void *v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  objc_class *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  BOOL v65;
  void *v66;
  void *v67;
  _QWORD v68[4];
  id v69;
  id v70;
  id v71;
  SMReceiverCacheManager *v72;
  _BYTE *v73;
  id v74[2];
  BOOL v75;
  id location;
  _BYTE buf[24];
  uint64_t (*v78)(uint64_t, uint64_t);
  __int128 v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sessionStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCacheDownloadError:", 0);

  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sessionStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "sessionState");

  if (v10 == 4)
  {
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sessionStatus");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "zoneShareAccepted");

    if ((v13 & 1) != 0)
    {
      -[SMReceiverCacheManager setSafetyCacheFetchPending:](self, "setSafetyCacheFetchPending:", 0);
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "allowReadToken");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "base64EncodedStringWithOptions:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "receiverEventToString:", a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = a3 == 15 || a3 == 6;
      if (a3 == 15 || a3 == 6)
        -[SMReceiverCacheManager startCacheDownloadTimeoutTimer](self, "startCacheDownloadTimeoutTimer");
      v65 = v20;
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        -[SMReceiverCacheManager sessionID](self, "sessionID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v25 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v22;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v24;
        *(_WORD *)&buf[22] = 2112;
        v78 = v25;
        LOWORD(v79) = 2112;
        *(_QWORD *)((char *)&v79 + 2) = v19;
        _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,event:%@,requesting Safety Cache", buf, 0x2Au);

      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v78 = __Block_byref_object_copy__89;
      *(_QWORD *)&v79 = __Block_byref_object_dispose__89;
      *((_QWORD *)&v79 + 1) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v26 = *(void **)(*(_QWORD *)&buf[8] + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setValue:forKey:", v27, CFSTR("responseToEvent"));

      v28 = *(void **)(*(_QWORD *)&buf[8] + 40);
      v29 = (void *)MEMORY[0x1E0CB37E8];
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "allowReadToken");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "numberWithInt:", v31 != 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setValue:forKey:", v32, CFSTR("tokenAvailable"));

      v33 = *(void **)(*(_QWORD *)&buf[8] + 40);
      v34 = (void *)MEMORY[0x1E0CB37E8];
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "sessionStatus");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "numberWithInt:", objc_msgSend(v36, "triggerType") == 15);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setValue:forKey:", v37, CFSTR("cacheReleasedViaScheduledSend"));

      -[SMReceiverCacheManager cloudKitFunction](self, "cloudKitFunction");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = MEMORY[0x1E0C809B0];
      v68[1] = 3221225472;
      v68[2] = __47__SMReceiverCacheManager_fetchSafetyCacheData___block_invoke;
      v68[3] = &unk_1E92A03F8;
      v40 = v67;
      v69 = v40;
      v73 = buf;
      objc_copyWeak(v74, &location);
      v41 = v14;
      v70 = v41;
      v42 = v66;
      v74[1] = (id)a2;
      v71 = v42;
      v72 = self;
      v75 = v65;
      objc_msgSend(v38, "requestSafetyCacheRecordFromZone:withToken:completion:", v39, v18, v68);

      objc_destroyWeak(v74);
      _Block_object_dispose(buf, 8);

      objc_destroyWeak(&location);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        -[SMReceiverCacheManager sessionID](self, "sessionID");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = (objc_class *)objc_opt_class();
        NSStringFromClass(v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v49 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v46;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v48;
        *(_WORD *)&buf[22] = 2112;
        v78 = v49;
        _os_log_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,initiate zone share accept process", buf, 0x20u);

      }
      -[SMReceiverCacheManager setSafetyCacheFetchPending:](self, "setSafetyCacheFetchPending:", 1);
      -[SMReceiverCacheManager acceptShareInvitation:](self, "acceptShareInvitation:", a3);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (objc_class *)objc_opt_class();
      NSStringFromClass(v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v53 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      v54 = (void *)MEMORY[0x1E0D8B9C8];
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "sessionStatus");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "convertSessionStateToString:", objc_msgSend(v56, "sessionState"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v50;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v52;
      *(_WORD *)&buf[22] = 2112;
      v78 = v53;
      LOWORD(v79) = 2112;
      *(_QWORD *)((char *)&v79 + 2) = v57;
      _os_log_error_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,tried to fetch safety cache in state: %@", buf, 0x2Au);

    }
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
    {
      v58 = (objc_class *)objc_opt_class();
      NSStringFromClass(v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = (void *)MEMORY[0x1E0D8B9C8];
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "sessionStatus");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "convertSessionStateToString:", objc_msgSend(v63, "sessionState"));
      v64 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v59;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v60;
      *(_WORD *)&buf[22] = 2112;
      v78 = v64;
      _os_log_fault_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_FAULT, "#SafetyCache,Receiver,%@,%@,tried to fetch safety cache in state: %@", buf, 0x20u);

    }
  }
}

void __47__SMReceiverCacheManager_fetchSafetyCacheData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  unint64_t v40;
  void *v41;
  unint64_t v42;
  void *v43;
  unint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
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
  uint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  id v84;
  id obj;
  uint8_t buf[4];
  uint64_t v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  id v93;
  __int16 v94;
  id v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v9 = v8;

  v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v11, CFSTR("timeToRequestCache"));

  v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6 == 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forKey:", v13, CFSTR("wasRequestSuccessful"));

  if (v6)
  {
    v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@:%d"), v16, objc_msgSend(v6, "code"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forKey:", v17, CFSTR("cacheRequestError"));

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (!WeakRetained)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v78 = *(_QWORD *)(a1 + 40);
      v79 = *(_QWORD *)(a1 + 48);
      NSStringFromSelector(*(SEL *)(a1 + 80));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v87 = v78;
      v88 = 2112;
      v89 = v79;
      v90 = 2112;
      v91 = v80;
      v92 = 2112;
      v93 = v6;
      v94 = 2112;
      v95 = v5;
      _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,cache manager released before request Safety Cache returned,error,%@,record,%@", buf, 0x34u);

    }
    goto LABEL_23;
  }
  objc_msgSend(*(id *)(a1 + 56), "defaultsManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", CFSTR("RTDefaultsMockTimeoutNextReceiverSafetyCacheDownload"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "BOOLValue");

  if (!v21)
  {
    objc_msgSend(*(id *)(a1 + 56), "defaultsManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKey:", CFSTR("RTDefaultsMockFailNextReceiverSafetyCacheDownload"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "BOOLValue");

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (!v6 && !v29)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v32 = *(_QWORD *)(a1 + 40);
        v33 = *(_QWORD *)(a1 + 48);
        NSStringFromSelector(*(SEL *)(a1 + 80));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v87 = v32;
        v88 = 2112;
        v89 = v33;
        v90 = 2112;
        v91 = v34;
        v92 = 2112;
        v93 = v5;
        _os_log_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,request for safety cache record successful,record,%@", buf, 0x2Au);

      }
      objc_msgSend(v5, "encryptedValues");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("PhoneSafetyCacheEncryptedData"));
      v22 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "encryptedValues");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("WatchSafetyCacheEncryptedData"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = -[NSObject length](v22, "length");
      objc_msgSend(*(id *)(a1 + 56), "receiverContact");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = v5;
      v40 = objc_msgSend(v39, "maxPhoneCacheSize");

      if (v38 <= v40)
        v38 = v40;
      objc_msgSend(*(id *)(a1 + 56), "receiverContact");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setMaxPhoneCacheSize:", v38);

      v42 = objc_msgSend(v37, "length");
      objc_msgSend(*(id *)(a1 + 56), "receiverContact");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "maxWatchCacheSize");

      if (v42 <= v44)
        v42 = v44;
      objc_msgSend(*(id *)(a1 + 56), "receiverContact");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setMaxWatchCacheSize:", v42);

      v46 = *(unsigned __int8 *)(a1 + 88);
      v47 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      obj = *(id *)(v47 + 40);
      objc_msgSend(WeakRetained, "decryptAndStoreSafetyCacheDataWithPhoneCacheData:watchCacheData:userInitiatedDownload:metricsDict:", v22, v37, v46, &obj);
      objc_storeStrong((id *)(v47 + 40), obj);
      v48 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)-[NSObject length](v22, "length") >> 10);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setValue:forKey:", v49, CFSTR("phoneCacheSize"));

      v50 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)objc_msgSend(v37, "length") >> 10);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setValue:forKey:", v51, CFSTR("watchCacheSize"));

      v52 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v53 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(WeakRetained, "phoneCache");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "locationsDuringSession");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "numberWithUnsignedInteger:", objc_msgSend(v55, "count"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setValue:forKey:", v56, CFSTR("phoneNumLocationsInTrace"));

      v57 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v58 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(WeakRetained, "watchCache");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "locationsDuringSession");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "numberWithUnsignedInteger:", objc_msgSend(v60, "count"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setValue:forKey:", v61, CFSTR("watchNumLocationsInTrace"));

      v62 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v63 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(WeakRetained, "phoneCache");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "locationsDuringSession");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "numberWithInt:", objc_msgSend(v65, "count") != 0);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setValue:forKey:", v66, CFSTR("phoneLocationHistoryAvailable"));

      v67 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v68 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(WeakRetained, "watchCache");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "locationsDuringSession");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "numberWithInt:", objc_msgSend(v70, "count") != 0);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setValue:forKey:", v71, CFSTR("watchLocationHistoryAvailable"));

      v5 = v84;
      v72 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v73 = (void *)MEMORY[0x1E0CB37E8];
      +[RTRuntime footprint](RTRuntime, "footprint");
      objc_msgSend(v73, "numberWithDouble:");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "setValue:forKey:", v74, CFSTR("processFootprint"));

      AnalyticsSendEvent();
      goto LABEL_19;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v81 = *(_QWORD *)(a1 + 40);
      v82 = *(_QWORD *)(a1 + 48);
      NSStringFromSelector(*(SEL *)(a1 + 80));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v87 = v81;
      v88 = 2112;
      v89 = v82;
      v90 = 2112;
      v91 = v83;
      v92 = 2112;
      v93 = v6;
      _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,request cache failed with error %@", buf, 0x2Au);

    }
    objc_msgSend(WeakRetained, "onCacheDownloadResult:userInitiatedDownload:withError:", 0, *(unsigned __int8 *)(a1 + 88), v6);
LABEL_23:
    v75 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v76 = (void *)MEMORY[0x1E0CB37E8];
    +[RTRuntime footprint](RTRuntime, "footprint");
    objc_msgSend(v76, "numberWithDouble:");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setValue:forKey:", v77, CFSTR("processFootprint"));

    AnalyticsSendEvent();
    goto LABEL_24;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = *(_QWORD *)(a1 + 40);
    v24 = *(_QWORD *)(a1 + 48);
    NSStringFromSelector(*(SEL *)(a1 + 80));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v87 = v23;
    v88 = 2112;
    v89 = v24;
    v90 = 2112;
    v91 = v25;
    v92 = 2112;
    v93 = v5;
    _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,mock timing out safety cache record request,%@", buf, 0x2Au);

  }
LABEL_19:

LABEL_24:
}

- (void)decryptAndStoreSafetyCacheDataWithPhoneCacheData:(id)a3 watchCacheData:(id)a4 userInitiatedDownload:(BOOL)a5 metricsDict:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  id v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  unint64_t v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  _BOOL4 v50;
  void *v51;
  objc_class *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  id v60;
  void *v61;
  unint64_t v62;
  void *v63;
  unint64_t v64;
  unint64_t v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  unint64_t v72;
  void *v73;
  unint64_t v74;
  unint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  objc_class *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  NSObject *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  objc_class *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  NSObject *v99;
  void *v100;
  void *v101;
  void *v102;
  objc_class *v103;
  void *v104;
  void *v105;
  void *v106;
  objc_class *v107;
  void *v108;
  void *v109;
  void *v110;
  _BOOL4 v111;
  void *v113;
  id v114;
  id v115;
  uint8_t buf[4];
  void *v117;
  __int16 v118;
  void *v119;
  __int16 v120;
  void *v121;
  __int16 v122;
  _BOOL4 v123;
  __int16 v124;
  _BOOL4 v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  _QWORD v129[3];

  v111 = a5;
  v129[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_opt_new();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  v113 = v9;
  if (v9)
  {
    v14 = v11;
    v15 = v10;
    if (v13)
    {
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v117 = v16;
      v118 = 2112;
      v119 = v18;
      v120 = 2112;
      v121 = v19;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,decrypting phone safety cache data", buf, 0x20u);

    }
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "safetyCacheKey");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverCacheManager sessionID](self, "sessionID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = 0;
    +[SMCryptoUtilities decryptSafetyCache:key:sessionID:role:device:metricsDict:hashString:](SMCryptoUtilities, "decryptSafetyCache:key:sessionID:role:device:metricsDict:hashString:", v113, v21, v22, CFSTR("Receiver"), 1, a6, &v115);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v115;

    v25 = *a6;
    v26 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend((id)v23, "workoutEvents");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setValue:forKey:", v28, CFSTR("phoneNumWorkoutEvents"));

    objc_msgSend((id)v23, "locationsDuringSession");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "count");

    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "maxLocationsInPhoneCacheTrace");

    if (v30 <= v32)
      v33 = v32;
    else
      v33 = v30;
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setMaxLocationsInPhoneCacheTrace:", v33);

    objc_msgSend((id)v23, "workoutEvents");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count");

    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "phoneMaxWorkoutEvents");

    if (v36 <= v38)
      v39 = v38;
    else
      v39 = v36;
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setPhoneMaxWorkoutEvents:", v39);

    if (v23)
    {
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v14;
      objc_msgSend((id)v23, "logCacheForSessionID:role:deviceType:transaction:hashString:", v41, CFSTR("Receiver"), CFSTR("phone"), v14, v24);
    }
    else
    {
      v48 = (void *)MEMORY[0x1E0D8B8F8];
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v14;
      objc_msgSend(v48, "logNoCacheDataForSessionID:role:deviceType:transaction:", v41, CFSTR("Receiver"), CFSTR("phone"), v14);
    }

    v10 = v15;
  }
  else
  {
    if (v13)
    {
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (objc_class *)objc_opt_class();
      NSStringFromClass(v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v45 = v11;
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v117 = v42;
      v118 = 2112;
      v119 = v44;
      v120 = 2112;
      v121 = v46;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,no phone safety cache data", buf, 0x20u);

      v11 = v45;
    }

    objc_msgSend(*a6, "setValue:forKey:", &unk_1E93284F0, CFSTR("phoneCacheDecryptionResult"));
    v47 = (void *)MEMORY[0x1E0D8B8F8];
    -[SMReceiverCacheManager sessionID](self, "sessionID");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "logNoCacheDataForSessionID:role:deviceType:transaction:", v24, CFSTR("Receiver"), CFSTR("phone"), v11);
    v23 = 0;
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v49 = objc_claimAutoreleasedReturnValue();
  v50 = os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    v110 = v11;
    if (v50)
    {
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = (objc_class *)objc_opt_class();
      NSStringFromClass(v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v117 = v51;
      v118 = 2112;
      v119 = v53;
      v120 = 2112;
      v121 = v54;
      _os_log_impl(&dword_1D1A22000, v49, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,decrypting watch safety cache data", buf, 0x20u);

    }
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "safetyCacheKey");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverCacheManager sessionID](self, "sessionID");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = 0;
    v58 = v10;
    +[SMCryptoUtilities decryptSafetyCache:key:sessionID:role:device:metricsDict:hashString:](SMCryptoUtilities, "decryptSafetyCache:key:sessionID:role:device:metricsDict:hashString:", v10, v56, v57, CFSTR("Receiver"), 2, a6, &v114);
    v59 = objc_claimAutoreleasedReturnValue();
    v60 = v114;

    objc_msgSend((id)v59, "locationsDuringSession");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "count");

    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "maxLocationsInWatchCacheTrace");

    if (v62 <= v64)
      v65 = v64;
    else
      v65 = v62;
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setMaxLocationsInWatchCacheTrace:", v65);

    v67 = *a6;
    v68 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend((id)v59, "workoutEvents");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "numberWithUnsignedInteger:", objc_msgSend(v69, "count"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setValue:forKey:", v70, CFSTR("watchNumWorkoutEvents"));

    objc_msgSend((id)v59, "workoutEvents");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v71, "count");

    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v73, "watchMaxWorkoutEvents");

    if (v72 <= v74)
      v75 = v74;
    else
      v75 = v72;
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setWatchMaxWorkoutEvents:", v75);

    if (v59)
    {
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v110;
      objc_msgSend((id)v59, "logCacheForSessionID:role:deviceType:transaction:hashString:", v77, CFSTR("Receiver"), CFSTR("watch"), v110, v60);
    }
    else
    {
      v84 = (void *)MEMORY[0x1E0D8B8F8];
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v110;
      objc_msgSend(v84, "logNoCacheDataForSessionID:role:deviceType:transaction:", v77, CFSTR("Receiver"), CFSTR("watch"), v110);
    }

    -[SMReceiverCacheManager updateReceiverContactInStore](self, "updateReceiverContactInStore");
    v10 = v58;
  }
  else
  {
    if (v50)
    {
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = (objc_class *)objc_opt_class();
      NSStringFromClass(v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v117 = v78;
      v118 = 2112;
      v119 = v80;
      v120 = 2112;
      v121 = v81;
      _os_log_impl(&dword_1D1A22000, v49, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,no watch safety cache data", buf, 0x20u);

    }
    objc_msgSend(*a6, "setValue:forKey:", &unk_1E93284F0, CFSTR("watchCacheDecryptionResult"));
    v82 = (void *)MEMORY[0x1E0D8B8F8];
    -[SMReceiverCacheManager sessionID](self, "sessionID");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "logNoCacheDataForSessionID:role:deviceType:transaction:", v83, CFSTR("Receiver"), CFSTR("watch"), v11);

    -[SMReceiverCacheManager updateReceiverContactInStore](self, "updateReceiverContactInStore");
    if (!v113)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v99 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
      {
        -[SMReceiverCacheManager sessionID](self, "sessionID");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = (objc_class *)objc_opt_class();
        NSStringFromClass(v107);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v117 = v106;
        v118 = 2112;
        v119 = v108;
        v120 = 2112;
        v121 = v109;
        _os_log_error_impl(&dword_1D1A22000, v99, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,no safety cache data present", buf, 0x20u);

      }
      v128 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no safety cache data"));
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v129[0] = v100;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v129, &v128, 1);
      v59 = objc_claimAutoreleasedReturnValue();

      v88 = (void *)MEMORY[0x1E0CB35C8];
      v89 = *MEMORY[0x1E0D8BB70];
      v90 = 47;
      goto LABEL_44;
    }
    v59 = 0;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v85 = objc_claimAutoreleasedReturnValue();
  v86 = v85;
  if (!(v23 | v59))
  {
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
    {
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = (objc_class *)objc_opt_class();
      NSStringFromClass(v103);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v117 = v102;
      v118 = 2112;
      v119 = v104;
      v120 = 2112;
      v121 = v105;
      _os_log_error_impl(&dword_1D1A22000, v86, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,no decrypted safety cache data present", buf, 0x20u);

    }
    v126 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no decrypted safety cache data"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = v87;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v127, &v126, 1);
    v59 = objc_claimAutoreleasedReturnValue();

    v88 = (void *)MEMORY[0x1E0CB35C8];
    v89 = *MEMORY[0x1E0D8BB70];
    v90 = 48;
LABEL_44:
    objc_msgSend(v88, "errorWithDomain:code:userInfo:", v89, v90, v59);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverCacheManager onCacheDownloadResult:userInitiatedDownload:withError:](self, "onCacheDownloadResult:userInitiatedDownload:withError:", 0, v111, v101);

    goto LABEL_45;
  }
  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
  {
    -[SMReceiverCacheManager sessionID](self, "sessionID");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = (objc_class *)objc_opt_class();
    NSStringFromClass(v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v117 = v91;
    v118 = 2112;
    v119 = v93;
    v120 = 2112;
    v121 = v94;
    v122 = 1024;
    v123 = v23 != 0;
    v124 = 1024;
    v125 = v59 != 0;
    _os_log_impl(&dword_1D1A22000, v86, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,successfully decrypted safety cache data for,phone,%d,watch,%d", buf, 0x2Cu);

  }
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setPhoneCache:", v23);

  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "setWatchCache:", v59);

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "setSyncDate:", v97);

  -[SMReceiverCacheManager onCacheDownloadResult:userInitiatedDownload:withError:](self, "onCacheDownloadResult:userInitiatedDownload:withError:", 1, v111, 0);
LABEL_45:

}

- (void)storeReceiverContactInStore:(unint64_t)a3
{
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[7];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = -[SMReceiverCacheManager receiverContactStoreInProgress](self, "receiverContactStoreInProgress");
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v21 = v9;
      v22 = 2112;
      v23 = v11;
      v24 = 2112;
      v25 = v12;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,SMReceiverContact store operation already in progress", buf, 0x20u);

    }
    -[SMReceiverCacheManager setReceiverContactUpdatePending:](self, "setReceiverContactUpdatePending:", 1);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v21 = v13;
      v22 = 2112;
      v23 = v15;
      v24 = 2112;
      v25 = v16;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,storing SMReceiverContact in store", buf, 0x20u);

    }
    -[SMReceiverCacheManager setReceiverContactStoreInProgress:](self, "setReceiverContactStoreInProgress:", 1);
    -[SMReceiverCacheManager safetyCacheStore](self, "safetyCacheStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __54__SMReceiverCacheManager_storeReceiverContactInStore___block_invoke;
    v19[3] = &unk_1E92A0420;
    v19[4] = self;
    v19[5] = a2;
    v19[6] = a3;
    objc_msgSend(v17, "storeReceiverContact:handler:", v18, v19);

  }
}

void __54__SMReceiverCacheManager_storeReceiverContactInStore___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__SMReceiverCacheManager_storeReceiverContactInStore___block_invoke_2;
  v8[3] = &unk_1E929F6D8;
  v5 = *(_QWORD *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v6 = *(_QWORD *)(a1 + 48);
  v10 = v5;
  v11 = v6;
  v7 = v3;
  dispatch_async(v4, v8);

}

uint64_t __54__SMReceiverCacheManager_storeReceiverContactInStore___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t result;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setReceiverContactStoreInProgress:", 0);
  v2 = *(_QWORD *)(a1 + 40);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 40);
      v17 = *(_QWORD *)(a1 + 56);
      v18 = 138413314;
      v19 = v12;
      v20 = 2112;
      v21 = v14;
      v22 = 2112;
      v23 = v15;
      v24 = 2112;
      v25 = v16;
      v26 = 1024;
      v27 = v17;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,failed to store receiver contact with error %@, retries left %d", (uint8_t *)&v18, 0x30u);

    }
    v5 = *(_QWORD *)(a1 + 56);
    v6 = *(void **)(a1 + 32);
    if (v5)
      return objc_msgSend(v6, "storeReceiverContactInStore:", v5 - 1);
    else
      return objc_msgSend(v6, "setReceiverContactUpdatePending:", 0);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v8;
      v20 = 2112;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,successfully stored receiver contact", (uint8_t *)&v18, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "setReceiverContactStored:", 1);
    result = objc_msgSend(*(id *)(a1 + 32), "receiverContactUpdatePending");
    if ((_DWORD)result)
    {
      objc_msgSend(*(id *)(a1 + 32), "setReceiverContactUpdatePending:", 0);
      return objc_msgSend(*(id *)(a1 + 32), "updateReceiverContactInStore");
    }
  }
  return result;
}

- (void)updateReceiverContactInStore
{
  void *v4;
  NSObject *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  SEL v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (-[SMReceiverCacheManager receiverContactStored](self, "receiverContactStored"))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v22 = v6;
      v23 = 2112;
      v24 = v8;
      v25 = 2112;
      v26 = v9;
      v27 = 2112;
      v28 = v4;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,updating SMReceiverContact in store,transaction,%@", buf, 0x2Au);

    }
    -[SMReceiverCacheManager safetyCacheStore](self, "safetyCacheStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __54__SMReceiverCacheManager_updateReceiverContactInStore__block_invoke;
    v18[3] = &unk_1E929B1E0;
    v19 = v4;
    v20 = a2;
    v18[4] = self;
    v12 = v4;
    objc_msgSend(v10, "updateReceiverContact:handler:", v11, v18);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      -[SMReceiverCacheManager sessionID](self, "sessionID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v22 = v14;
      v23 = 2112;
      v24 = v16;
      v25 = 2112;
      v26 = v17;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,SMReceiverContact not yet stored", buf, 0x20u);

    }
    -[SMReceiverCacheManager storeReceiverContactInStore:](self, "storeReceiverContactInStore:", 2);
  }
}

void __54__SMReceiverCacheManager_updateReceiverContactInStore__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      v13 = 138413314;
      v14 = v6;
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      v21 = 2112;
      v22 = v3;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,failed to update SMReceiverContact in store,transaction,%@,error,%@", (uint8_t *)&v13, 0x34u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    v13 = 138413058;
    v14 = v6;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,successfully updated SMReceiverContact in store,transaction,%@", (uint8_t *)&v13, 0x2Au);
    goto LABEL_6;
  }

}

- (void)deleteReceiverContactFromStore:(unint64_t)a3
{
  NSObject *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[7];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[SMReceiverCacheManager sessionID](self, "sessionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v17 = v7;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    v22 = 2112;
    v23 = v12;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,deleting SMReceiverContact from store with identifier %@", buf, 0x2Au);

  }
  -[SMReceiverCacheManager safetyCacheStore](self, "safetyCacheStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__SMReceiverCacheManager_deleteReceiverContactFromStore___block_invoke;
  v15[3] = &unk_1E92A0420;
  v15[4] = self;
  v15[5] = a2;
  v15[6] = a3;
  objc_msgSend(v13, "removeReceiverContact:handler:", v14, v15);

}

void __57__SMReceiverCacheManager_deleteReceiverContactFromStore___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "receiverContact");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 48);
      v22 = 138413570;
      v23 = v15;
      v24 = 2112;
      v25 = v17;
      v26 = 2112;
      v27 = v18;
      v28 = 2112;
      v29 = v20;
      v30 = 2112;
      v31 = v3;
      v32 = 1024;
      v33 = v21;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,failed to delete SMReceiverContact from store with identifier %@ and error %@ retries left %d", (uint8_t *)&v22, 0x3Au);

    }
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
      objc_msgSend(*(id *)(a1 + 32), "deleteReceiverContactFromStore:", v6 - 1);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "receiverContact");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138413058;
      v23 = v7;
      v24 = 2112;
      v25 = v9;
      v26 = 2112;
      v27 = v10;
      v28 = 2112;
      v29 = v12;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,successfully deleted SMReceiverContact from store with identifier %@", (uint8_t *)&v22, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 32), "setReceiverContactStored:", 0);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cacheManagerDidCompleteCleanupForSessionId:", v14);

  }
}

+ (id)receiverEventToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xE)
    return CFSTR("Unknown");
  else
    return off_1E92A04D0[a3 - 1];
}

- (id)computeReceiverSessionMetrics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
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
  double v37;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  unint64_t v53;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -1.0;
  v8 = -1.0;
  v9 = -1.0;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sessionStatus");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sessionStartDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", v13);
    v8 = v14 / 60.0;

    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sessionStatus");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "estimatedEndDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sessionStatus");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "estimatedEndDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverCacheManager receiverContact](self, "receiverContact");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sessionStatus");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sessionStartDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timeIntervalSinceDate:", v23);
      v9 = v24 / 60.0;

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v25, CFSTR("actualDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v26, CFSTR("expectedDuration"));

  v27 = (void *)MEMORY[0x1E0CB37E8];
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "timeTillFirstSuccessfulCacheDownload");
  objc_msgSend(v27, "numberWithDouble:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v29, CFSTR("cacheAge"));

  v30 = (void *)MEMORY[0x1E0CB37E8];
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "numberWithLongLong:", objc_msgSend(v31, "numCacheDownloads"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v32, CFSTR("cacheDownloadAttemptCount"));

  v33 = (void *)MEMORY[0x1E0CB37E8];
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "numberWithLongLong:", objc_msgSend(v34, "numSuccessfulCacheDownloads"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v35, CFSTR("cacheDownloadSuccessCount"));

  if (v8 > 0.0)
  {
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "timeTillCacheRelease");
    v7 = v37 / v8 * 100.0;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v38, CFSTR("triggerTimePercent"));

  v39 = (void *)MEMORY[0x1E0CB37E8];
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "sessionStatus");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "numberWithUnsignedInteger:", objc_msgSend(v41, "sessionEndReason"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v42, CFSTR("endReason"));

  v43 = (void *)MEMORY[0x1E0CB37E8];
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "sessionStatus");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "numberWithInteger:", objc_msgSend(v45, "sessionState"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v46, CFSTR("maxSessionState"));

  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "sessionStatus");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "sessionStartDate");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    -[SMReceiverCacheManager receiverContact](self, "receiverContact");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "sessionStatus");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "sessionStartDate");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 6 * (objc_msgSend(v52, "hour") / 6uLL);

  }
  else
  {
    v53 = -1;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v54, CFSTR("partOfDay"));

  v55 = (void *)MEMORY[0x1E0CB37E8];
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "sessionStatus");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "numberWithUnsignedInteger:", objc_msgSend(v57, "sessionType"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v58, CFSTR("sessionType"));

  v59 = (void *)MEMORY[0x1E0CB37E8];
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "sessionStatus");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "numberWithUnsignedInteger:", objc_msgSend(v61, "triggerType"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v62, CFSTR("triggerCategory"));

  v63 = (void *)MEMORY[0x1E0CB37E8];
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "numberWithInteger:", objc_msgSend(v64, "firstDetailViewSessionState"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v65, CFSTR("firstDetailViewSessionState"));

  v66 = (void *)MEMORY[0x1E0CB37E8];
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "numberWithInteger:", objc_msgSend(v67, "lastDetailViewSessionState"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v68, CFSTR("lastDetailViewSessionState"));

  return v3;
}

- (void)computeResponseModality:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  id v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  _QWORD v28[9];
  _QWORD v29[4];
  id v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t *v33;
  SEL v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v7 = a3;
  v8 = a4;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__89;
  v45 = __Block_byref_object_dispose__89;
  v9 = v7;
  v46 = v9;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__89;
  v39[4] = __Block_byref_object_dispose__89;
  -[SMReceiverCacheManager sessionID](self, "sessionID");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__89;
  v37[4] = __Block_byref_object_dispose__89;
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v38 = (id)objc_claimAutoreleasedReturnValue();
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__89;
  v35[4] = __Block_byref_object_dispose__89;
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sessionStatus");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "initiatorHandle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "primaryHandle");
  v36 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)v42[5], "setValue:forKey:", &unk_1E9328508, CFSTR("firstResponseModality"));
  objc_msgSend((id)v42[5], "setValue:forKey:", &unk_1E9328508, CFSTR("lastResponseModality"));
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[SMReceiverCacheManager receiverContact](self, "receiverContact");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sessionStatus");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sessionStartDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSinceReferenceDate");
  objc_msgSend(v14, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "timeIntervalSinceReferenceDate");
  objc_msgSend(v19, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D027B8], "intent");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "publisherWithStartTime:endTime:maxEvents:lastN:reversed:", v18, v21, 0, 0, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "filterWithIsIncluded:", &__block_literal_global_205);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __68__SMReceiverCacheManager_computeResponseModality_completionHandler___block_invoke_2;
  v29[3] = &unk_1E92A0488;
  v31 = v39;
  v32 = v37;
  v34 = a2;
  v26 = v8;
  v30 = v26;
  v33 = &v41;
  v28[0] = v25;
  v28[1] = 3221225472;
  v28[2] = __68__SMReceiverCacheManager_computeResponseModality_completionHandler___block_invoke_209;
  v28[3] = &unk_1E92A04B0;
  v28[4] = v39;
  v28[5] = v37;
  v28[7] = &v41;
  v28[8] = a2;
  v28[6] = v35;
  v27 = (id)objc_msgSend(v24, "sinkWithCompletion:receiveInput:", v29, v28);

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v37, 8);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(&v41, 8);

}

BOOL __68__SMReceiverCacheManager_computeResponseModality_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;

  v2 = a2;
  objc_msgSend(v2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "eventBody");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentClass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", v7) & 1) != 0 || objc_msgSend(v5, "isEqualToString:", v9))
    {
      objc_msgSend(v2, "eventBody");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "interactionDirection") == 2;

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __68__SMReceiverCacheManager_computeResponseModality_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "description");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = 138413058;
      v15 = v7;
      v16 = 2112;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      v20 = 2080;
      v21 = objc_msgSend(v11, "UTF8String");
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@, SMReceiverTelemetry failed to hit Biome completion hanlder with error %s", (uint8_t *)&v14, 0x2Au);

LABEL_6:
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = v12;
    v16 = 2112;
    v17 = v13;
    v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@, SMReceiverTelemetry successfully looped through biome events phone & messages.", (uint8_t *)&v14, 0x20u);
    goto LABEL_6;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__SMReceiverCacheManager_computeResponseModality_completionHandler___block_invoke_209(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char isKindOfClass;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  _BYTE v54[10];
  __int16 v55;
  NSObject *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CB3710];
  v5 = objc_opt_class();
  objc_msgSend(v3, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", v5, v7, &v46);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v46;

  if (!v9)
  {
    v16 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v3, "eventBody");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "absoluteTimestamp");
    objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("personHandle.value ==[c] %@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "intent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    objc_msgSend(v8, "intent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v21, "recipients");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "filteredArrayUsingPredicate:", v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = objc_msgSend(v24, "count");
      if (v25)
      {
        v26 = 1;
LABEL_10:
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "valueForKey:", CFSTR("firstResponseModality"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v32, "integerValue"))
        {
          v33 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v26);
          v44 = v18;
          v34 = v32;
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setValue:forKey:", v35, CFSTR("firstResponseModality"));

          v32 = v34;
          v18 = v44;
        }
        v36 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v26);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setValue:forKey:", v37, CFSTR("lastResponseModality"));

        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v39 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
          v43 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          NSStringFromSelector(*(SEL *)(a1 + 64));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "valueForKey:", CFSTR("firstResponseModality"));
          v45 = v32;
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "valueForKey:", CFSTR("lastResponseModality"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413570;
          v48 = v39;
          v49 = 2112;
          v50 = v43;
          v51 = 2112;
          v52 = v40;
          v53 = 1024;
          *(_DWORD *)v54 = (_DWORD)v41;
          *(_WORD *)&v54[4] = 1024;
          *(_DWORD *)&v54[6] = (_DWORD)v42;
          v55 = 2112;
          v56 = v10;
          _os_log_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@ firstResponseModality: %d, lastResponseModality: %d, timestamp: %@", buf, 0x36u);

          v32 = v45;
        }

      }
    }
    else
    {
      objc_opt_class();
      v27 = objc_opt_isKindOfClass();

      if ((v27 & 1) != 0)
      {
        objc_msgSend(v8, "intent");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "contacts");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "filteredArrayUsingPredicate:", v18);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = objc_msgSend(v30, "count");
        if (v31)
        {
          v26 = 2;
          goto LABEL_10;
        }
      }
    }

    goto LABEL_16;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = objc_msgSend(v14, "UTF8String");
    *(_DWORD *)buf = 138413058;
    v48 = v11;
    v49 = 2112;
    v50 = v12;
    v51 = 2112;
    v52 = v13;
    v53 = 2080;
    *(_QWORD *)v54 = v15;
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@, SMReceiverTelemetry failed to convert BMIntentEvent --> INInteraction. Error %s", buf, 0x2Au);

  }
LABEL_16:

}

- (SMReceiverCacheManagerDelegateProtocol)delegate
{
  return (SMReceiverCacheManagerDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SMReceiverContact)receiverContact
{
  return self->_receiverContact;
}

- (void)setReceiverContact:(id)a3
{
  objc_storeStrong((id *)&self->_receiverContact, a3);
}

- (void)setSessionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStatus, a3);
}

- (RTXPCTimerAlarm)cachePersistenceTimerAlarm
{
  return self->_cachePersistenceTimerAlarm;
}

- (void)setCachePersistenceTimerAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_cachePersistenceTimerAlarm, a3);
}

- (RTXPCTimerAlarm)missingKeyReleaseTimerAlarm
{
  return self->_missingKeyReleaseTimerAlarm;
}

- (void)setMissingKeyReleaseTimerAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_missingKeyReleaseTimerAlarm, a3);
}

- (RTXPCTimerAlarm)cacheDownloadTimeoutTimerAlarm
{
  return self->_cacheDownloadTimeoutTimerAlarm;
}

- (void)setCacheDownloadTimeoutTimerAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_cacheDownloadTimeoutTimerAlarm, a3);
}

- (BOOL)receiverContactStored
{
  return self->_receiverContactStored;
}

- (void)setReceiverContactStored:(BOOL)a3
{
  self->_receiverContactStored = a3;
}

- (BOOL)receiverContactStoreInProgress
{
  return self->_receiverContactStoreInProgress;
}

- (void)setReceiverContactStoreInProgress:(BOOL)a3
{
  self->_receiverContactStoreInProgress = a3;
}

- (BOOL)receiverContactUpdatePending
{
  return self->_receiverContactUpdatePending;
}

- (void)setReceiverContactUpdatePending:(BOOL)a3
{
  self->_receiverContactUpdatePending = a3;
}

- (BOOL)acceptShareInvitationInProgress
{
  return self->_acceptShareInvitationInProgress;
}

- (void)setAcceptShareInvitationInProgress:(BOOL)a3
{
  self->_acceptShareInvitationInProgress = a3;
}

- (BOOL)safetyCacheFetchPending
{
  return self->_safetyCacheFetchPending;
}

- (void)setSafetyCacheFetchPending:(BOOL)a3
{
  self->_safetyCacheFetchPending = a3;
}

- (SMSafetyCacheStore)safetyCacheStore
{
  return self->_safetyCacheStore;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CKContainer)container
{
  return self->_container;
}

- (SMCloudKitFunction)cloudKitFunction
{
  return self->_cloudKitFunction;
}

- (void)setCloudKitFunction:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitFunction, a3);
}

- (double)cachePersistenceTime
{
  return self->_cachePersistenceTime;
}

- (SMMessagingService)messagingService
{
  return self->_messagingService;
}

- (int64_t)cacheDownloadRetryCount
{
  return self->_cacheDownloadRetryCount;
}

- (void)setCacheDownloadRetryCount:(int64_t)a3
{
  self->_cacheDownloadRetryCount = a3;
}

- (int64_t)zoneShareRetryCount
{
  return self->_zoneShareRetryCount;
}

- (void)setZoneShareRetryCount:(int64_t)a3
{
  self->_zoneShareRetryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagingService, 0);
  objc_storeStrong((id *)&self->_cloudKitFunction, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_safetyCacheStore, 0);
  objc_storeStrong((id *)&self->_cacheDownloadTimeoutTimerAlarm, 0);
  objc_storeStrong((id *)&self->_missingKeyReleaseTimerAlarm, 0);
  objc_storeStrong((id *)&self->_cachePersistenceTimerAlarm, 0);
  objc_storeStrong((id *)&self->_sessionStatus, 0);
  objc_storeStrong((id *)&self->_receiverContact, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
