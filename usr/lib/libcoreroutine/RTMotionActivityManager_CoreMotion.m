@implementation RTMotionActivityManager_CoreMotion

+ (int64_t)activityAlarmTriggerFromCMActivityAlarmTrigger:(unsigned int)a3
{
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a3 < 0xB && ((0x41Fu >> a3) & 1) != 0)
    return qword_1D1EEE670[a3];
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6[0] = 67109120;
    v6[1] = a3;
    _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "unsupported trigger for description %d", (uint8_t *)v6, 8u);
  }

  return -1;
}

- (NSMutableDictionary)activityAlarms
{
  NSMutableDictionary *activityAlarms;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  activityAlarms = self->_activityAlarms;
  if (!activityAlarms)
  {
    v4 = (NSMutableDictionary *)objc_opt_new();
    v5 = self->_activityAlarms;
    self->_activityAlarms = v4;

    activityAlarms = self->_activityAlarms;
  }
  return activityAlarms;
}

- (RTMotionActivityManager_CoreMotion)initWithPlatform:(id)a3 vehicleStore:(id)a4
{
  char *v5;
  id v6;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  dispatch_source_t v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  NSObject *v33;
  void *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  int v41;
  const char *v42;
  NSObject *v43;
  const char *v44;
  NSObject *v45;
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD handler[4];
  id v54;
  id location;
  objc_super v56;
  uint8_t buf[4];
  const __CFString *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v56.receiver = self;
  v56.super_class = (Class)RTMotionActivityManager_CoreMotion;
  v47 = a3;
  v48 = a4;
  v5 = -[RTMotionActivityManager initWithPlatform:vehicleStore:](&v56, sel_initWithPlatform_vehicleStore_, v47);
  if (!v5)
    goto LABEL_21;
  v6 = objc_alloc_init(MEMORY[0x1E0CA5660]);
  v7 = (void *)*((_QWORD *)v5 + 13);
  *((_QWORD *)v5 + 13) = v6;

  v5[49] = objc_msgSend(MEMORY[0x1E0CA5660], "isActivityAvailable");
  _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    if (v5[49])
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v58 = v9;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "activity available, %@", buf, 0xCu);
  }

  v10 = objc_opt_new();
  v11 = (void *)*((_QWORD *)v5 + 14);
  *((_QWORD *)v5 + 14) = v10;

  objc_msgSend(v5, "queue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)v5 + 14), "setUnderlyingQueue:", v12);

  v13 = objc_opt_new();
  v14 = (void *)*((_QWORD *)v5 + 7);
  *((_QWORD *)v5 + 7) = v13;

  v15 = v5 + 72;
  *((_QWORD *)v5 + 9) = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -30.0);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)*((_QWORD *)v5 + 16);
  *((_QWORD *)v5 + 16) = v16;

  v18 = objc_opt_new();
  v19 = (void *)*((_QWORD *)v5 + 17);
  *((_QWORD *)v5 + 17) = v18;

  objc_msgSend(v5, "queue");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v20);
  v22 = (void *)*((_QWORD *)v5 + 15);
  *((_QWORD *)v5 + 15) = v21;

  dispatch_source_set_timer(*((dispatch_source_t *)v5 + 15), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);
  objc_initWeak(&location, v5);
  v23 = *((_QWORD *)v5 + 15);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __68__RTMotionActivityManager_CoreMotion_initWithPlatform_vehicleStore___block_invoke;
  handler[3] = &unk_1E92983E8;
  objc_copyWeak(&v54, &location);
  dispatch_source_set_event_handler(v23, handler);
  dispatch_resume(*((dispatch_object_t *)v5 + 15));
  if (!objc_msgSend(MEMORY[0x1E0CA5700], "isAvailable"))
  {
    *((_QWORD *)v5 + 12) = 0;
    _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "CMVehicleState is unavailable, initializing vehicle connected state to unknown.", buf, 2u);
    }
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CA5700], "mostRecentVehicleConnection");
  v24 = objc_claimAutoreleasedReturnValue();
  -[NSObject timeRange](v24, "timeRange");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "startDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "timeIntervalSinceReferenceDate");
  if (v27 <= 0.0)
  {

    goto LABEL_14;
  }
  -[NSObject timeRange](v24, "timeRange");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "endDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject timeRange](v24, "timeRange");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "startDate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v29, "compare:", v31) == -1;

  if (!v32)
  {
LABEL_14:
    v15 = v5 + 96;
    goto LABEL_15;
  }
  *((_QWORD *)v5 + 12) = 2;
LABEL_15:
  *v15 = 1;
  _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    -[NSObject timeRange](v24, "timeRange");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "startDate");
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[NSObject timeRange](v24, "timeRange");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "endDate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject deviceId](v24, "deviceId");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = *((_QWORD *)v5 + 12);
    *(_DWORD *)buf = 138413058;
    v58 = v35;
    v59 = 2112;
    v60 = v37;
    v61 = 2112;
    v62 = v38;
    v63 = 2048;
    v64 = v39;
    _os_log_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_INFO, "fetched vehicleStateData, startDate, %@, endDate, %@, deviceId, %@, vehicleConnectedState, %lu", buf, 0x2Au);

  }
LABEL_18:

  objc_msgSend(v5, "platform");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "internalInstall");

  if (v41)
  {
    *(_DWORD *)buf = 0;
    v42 = (const char *)objc_msgSend(CFSTR("MotionActivityVehicleConnected"), "UTF8String");
    objc_msgSend(v5, "queue");
    v43 = objc_claimAutoreleasedReturnValue();
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __68__RTMotionActivityManager_CoreMotion_initWithPlatform_vehicleStore___block_invoke_69;
    v51[3] = &unk_1E929C650;
    objc_copyWeak(&v52, &location);
    notify_register_dispatch(v42, (int *)buf, v43, v51);

    v44 = (const char *)objc_msgSend(CFSTR("MotionActivityVehicleDisconnected"), "UTF8String");
    objc_msgSend(v5, "queue");
    v45 = objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __68__RTMotionActivityManager_CoreMotion_initWithPlatform_vehicleStore___block_invoke_2;
    v49[3] = &unk_1E929C650;
    objc_copyWeak(&v50, &location);
    notify_register_dispatch(v44, (int *)buf, v45, v49);

    objc_destroyWeak(&v50);
    objc_destroyWeak(&v52);
  }
  objc_destroyWeak(&v54);
  objc_destroyWeak(&location);
LABEL_21:

  return (RTMotionActivityManager_CoreMotion *)v5;
}

- (void)_shutdownWithHandler:(id)a3
{
  NSObject *dominantMotionActivityTimer;
  OS_dispatch_source *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  dominantMotionActivityTimer = self->_dominantMotionActivityTimer;
  if (dominantMotionActivityTimer)
  {
    dispatch_source_cancel(dominantMotionActivityTimer);
    v5 = self->_dominantMotionActivityTimer;
    self->_dominantMotionActivityTimer = 0;

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  -[RTMotionActivityManager_CoreMotion _invalidateActivityAlarms](self, "_invalidateActivityAlarms");
  v7 = v8;
  if (v8)
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
    v7 = v8;
  }

}

- (void)_fetchMotionActivitiesIfNeeded
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[5];

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMotionActivityManager_CoreMotion lastQueryForMotionActivity](self, "lastQueryForMotionActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  if (v6 >= 15.3)
  {
    objc_msgSend(v3, "dateByAddingTimeInterval:", -30.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMotionActivityManager_CoreMotion motionActivities](self, "motionActivities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateByAddingTimeInterval:", 15.3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "laterDate:", v7);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = v7;
    }
    v13 = v12;
    if (objc_msgSend(v12, "compare:", v3) == -1)
    {
      -[RTMotionActivityManager_CoreMotion setLastQueryForMotionActivity:](self, "setLastQueryForMotionActivity:", v3);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __68__RTMotionActivityManager_CoreMotion__fetchMotionActivitiesIfNeeded__block_invoke;
      v14[3] = &unk_1E9299DA0;
      v14[4] = self;
      -[RTMotionActivityManager_CoreMotion _fetchMotionActivitiesFromStartDate:endDate:handler:](self, "_fetchMotionActivitiesFromStartDate:endDate:handler:", v13, v3, v14);
    }

  }
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  char *v18;
  _QWORD *v19;
  void *v20;
  int v21;
  objc_super v22;

  v6 = a4;
  v22.receiver = self;
  v22.super_class = (Class)RTMotionActivityManager_CoreMotion;
  -[RTMotionActivityManager internalAddObserver:name:](&v22, sel_internalAddObserver_name_, a3, v6);
  if (-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v6) == 1)
  {
    +[RTNotification notificationName](RTMotionActivityManagerNotificationActivity, "notificationName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v6);

    if (v8)
    {
      -[RTMotionActivityManager_CoreMotion setInterestedInActivity:](self, "setInterestedInActivity:", -[RTMotionActivityManager_CoreMotion interestedInActivity](self, "interestedInActivity") + 1);
      goto LABEL_9;
    }
    +[RTNotification notificationName](RTMotionActivityManagerNotificationMotionSettledStateChange, "notificationName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", v6) & 1) == 0)
    {
      +[RTNotification notificationName](RTMotionActivityManagerNotificationActivityAlarm, "notificationName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "isEqualToString:", v6))
      {
        +[RTNotification notificationName](RTMotionActivityManagerNotificationDominantMotionActivityChange, "notificationName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v6);

        if ((v12 & 1) == 0)
        {
          +[RTNotification notificationName](RTMotionActivityManagerNotificationVehicleConnected, "notificationName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v6);

          if (v14)
          {
            -[RTMotionActivityManager_CoreMotion setInterestedInActivity:](self, "setInterestedInActivity:", -[RTMotionActivityManager_CoreMotion interestedInActivity](self, "interestedInActivity") + 1);
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObserver:selector:name:object:", self, sel_onVehicleConnectedNotification, *MEMORY[0x1E0CA5740], 0);

            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16;
            v18 = sel_onVehicleDisconnectedNotification;
            v19 = (_QWORD *)MEMORY[0x1E0CA5748];
          }
          else
          {
            +[RTNotification notificationName](RTMotionActivityManagerNotificationVehicleExit, "notificationName");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "isEqualToString:", v6);

            if (!v21)
              goto LABEL_9;
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16;
            v18 = sel_onVehicleExitNotification;
            v19 = (_QWORD *)MEMORY[0x1E0CA5750];
          }
          objc_msgSend(v16, "addObserver:selector:name:object:", self, v18, *v19, 0);

          goto LABEL_9;
        }
        goto LABEL_8;
      }

    }
LABEL_8:
    -[RTMotionActivityManager_CoreMotion _fetchMotionActivitiesIfNeeded](self, "_fetchMotionActivitiesIfNeeded");
    -[RTMotionActivityManager_CoreMotion setInterestedInActivity:](self, "setInterestedInActivity:", -[RTMotionActivityManager_CoreMotion interestedInActivity](self, "interestedInActivity") + 1);
    -[RTMotionActivityManager_CoreMotion _resubscribeForActivityAlarms](self, "_resubscribeForActivityAlarms");
  }
LABEL_9:

}

- (void)_resetMotionActivitiesIfNeeded
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;

  +[RTNotification notificationName](RTMotionActivityManagerNotificationMotionSettledStateChange, "notificationName");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:"))
    goto LABEL_4;
  +[RTNotification notificationName](RTMotionActivityManagerNotificationActivityAlarm, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v3))
  {

LABEL_4:
    return;
  }
  +[RTNotification notificationName](RTMotionActivityManagerNotificationDominantMotionActivityChange, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v4);

  if (!v5)
  {
    -[RTMotionActivityManager_CoreMotion setSettledState:](self, "setSettledState:", 0);
    -[RTMotionActivityManager_CoreMotion setDominantMotionActivityBootstrapped:](self, "setDominantMotionActivityBootstrapped:", 0);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -30.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMotionActivityManager_CoreMotion setLastQueryForMotionActivity:](self, "setLastQueryForMotionActivity:", v6);

    -[RTMotionActivityManager_CoreMotion motionActivities](self, "motionActivities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeAllObjects");

    -[RTMotionActivityManager_CoreMotion setDominantMotionActivity:](self, "setDominantMotionActivity:", 0);
    -[RTMotionActivityManager_CoreMotion dominantMotionActivityTimer](self, "dominantMotionActivityTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[RTMotionActivityManager_CoreMotion dominantMotionActivityTimer](self, "dominantMotionActivityTimer");
      v9 = objc_claimAutoreleasedReturnValue();
      dispatch_source_set_timer(v9, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);

    }
    -[RTMotionActivityManager_CoreMotion _invalidateActivityAlarms](self, "_invalidateActivityAlarms");
  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  int v20;
  objc_super v21;

  v6 = a4;
  v21.receiver = self;
  v21.super_class = (Class)RTMotionActivityManager_CoreMotion;
  -[RTMotionActivityManager internalRemoveObserver:name:](&v21, sel_internalRemoveObserver_name_, a3, v6);
  if (!-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v6))
  {
    +[RTNotification notificationName](RTMotionActivityManagerNotificationActivity, "notificationName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v6);

    if (v8)
    {
      -[RTMotionActivityManager_CoreMotion setInterestedInActivity:](self, "setInterestedInActivity:", -[RTMotionActivityManager_CoreMotion interestedInActivity](self, "interestedInActivity") - 1);
      goto LABEL_9;
    }
    +[RTNotification notificationName](RTMotionActivityManagerNotificationMotionSettledStateChange, "notificationName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", v6) & 1) == 0)
    {
      +[RTNotification notificationName](RTMotionActivityManagerNotificationActivityAlarm, "notificationName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "isEqualToString:", v6))
      {
        +[RTNotification notificationName](RTMotionActivityManagerNotificationDominantMotionActivityChange, "notificationName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v6);

        if ((v12 & 1) == 0)
        {
          +[RTNotification notificationName](RTMotionActivityManagerNotificationVehicleConnected, "notificationName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v6);

          if (v14)
          {
            -[RTMotionActivityManager_CoreMotion setInterestedInActivity:](self, "setInterestedInActivity:", -[RTMotionActivityManager_CoreMotion interestedInActivity](self, "interestedInActivity") - 1);
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "removeObserver:name:object:", self, *MEMORY[0x1E0CA5740], 0);

            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16;
            v18 = (_QWORD *)MEMORY[0x1E0CA5748];
          }
          else
          {
            +[RTNotification notificationName](RTMotionActivityManagerNotificationVehicleExit, "notificationName");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "isEqualToString:", v6);

            if (!v20)
              goto LABEL_9;
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16;
            v18 = (_QWORD *)MEMORY[0x1E0CA5750];
          }
          objc_msgSend(v16, "removeObserver:name:object:", self, *v18, 0);

          goto LABEL_9;
        }
        goto LABEL_8;
      }

    }
LABEL_8:
    -[RTMotionActivityManager_CoreMotion setInterestedInActivity:](self, "setInterestedInActivity:", -[RTMotionActivityManager_CoreMotion interestedInActivity](self, "interestedInActivity") - 1);
    -[RTMotionActivityManager_CoreMotion _resetMotionActivitiesIfNeeded](self, "_resetMotionActivitiesIfNeeded");
  }
LABEL_9:

}

- (void)_fetchMotionActivitiesFromStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
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
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  RTMotionActivityManager_CoreMotion *v25;
  void *v26;
  RTMotionActivityManager_CoreMotion *v27;
  NSObject *v28;
  const char *v29;
  id v30;
  dispatch_queue_t v31;
  void *v32;
  id v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  dispatch_semaphore_t v38;
  void *v39;
  id v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  dispatch_time_t v44;
  id v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  BOOL v59;
  uint64_t *v60;
  id v61;
  void *v62;
  id v63;
  NSObject *v64;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void (**v78)(id, _QWORD, void *);
  RTMotionActivityManager_CoreMotion *v79;
  void *v80;
  void *context;
  id v82;
  id v83;
  _QWORD v84[4];
  id v85;
  id v86;
  NSObject *v87;
  uint64_t *v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t (*v93)(uint64_t, uint64_t);
  void (*v94)(uint64_t);
  id v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;
  _BYTE buf[12];
  __int16 v103;
  id v104;
  __int16 v105;
  uint64_t v106;
  __int16 v107;
  uint64_t v108;
  __int16 v109;
  uint64_t v110;
  __int16 v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  const __CFString *v116;
  _QWORD v117[4];

  v117[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v83 = a4;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))v9;
  v80 = v8;
  if (!v9)
    goto LABEL_8;
  v78 = (void (**)(id, _QWORD, void *))v9;
  if (!v8 || !v83)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v115 = *MEMORY[0x1E0CB2D50];
    v116 = CFSTR("requires valid dates.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v78[2](v78, 0, v20);

    goto LABEL_7;
  }
  if (objc_msgSend(v8, "compare:", v83) == 1)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v113 = *MEMORY[0x1E0CB2D50];
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "stringFromDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "stringFromDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("startDate, %@, postdates endDate, %@"), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v78[2](v78, 0, v17);

    goto LABEL_7;
  }
  if (!-[RTMotionActivityManager_CoreMotion motionActivityAvailable](self, "motionActivityAvailable"))
  {
    v10[2](v10, 0, 0);
    goto LABEL_8;
  }
  _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "stringFromDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "stringFromDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTRuntime footprint](RTRuntime, "footprint");
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v22;
    v103 = 2112;
    v104 = v23;
    v105 = 2048;
    v106 = v24;
    _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_INFO, "Query CoreMotion for motionActivity between, startDate, %@, endDate, %@, footprint, %.2f MB", buf, 0x20u);

  }
  v74 = v80;
  v96 = 0;
  v97 = &v96;
  v98 = 0x3032000000;
  v99 = __Block_byref_object_copy__166;
  v100 = __Block_byref_object_dispose__166;
  v101 = (id)objc_opt_new();
  v90 = 0;
  v91 = &v90;
  v92 = 0x3032000000;
  v93 = __Block_byref_object_copy__166;
  v94 = __Block_byref_object_dispose__166;
  v95 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = (void *)objc_opt_new();
  v25 = self;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v25;
  v28 = v26;
  v79 = v27;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = (const char *)-[RTMotionActivityManager_CoreMotion UTF8String](objc_retainAutorelease(v79), "UTF8String");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v79);
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v29 = (const char *)objc_msgSend(v30, "UTF8String");

  }
  v31 = dispatch_queue_create(v29, v28);

  objc_msgSend(v77, "setUnderlyingQueue:", v31);
  v32 = 0;
  v75 = *MEMORY[0x1E0D18598];
  v76 = *MEMORY[0x1E0CB2D50];
  v33 = v74;
  v82 = v74;
  while (1)
  {
    objc_msgSend(v83, "earlierDate:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "isEqualToDate:", v83);

    if ((v35 & 1) != 0)
      break;
    context = (void *)MEMORY[0x1D8231EA8]();
    objc_msgSend(v82, "dateByAddingTimeInterval:", 3600.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v83, "earlierDate:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = dispatch_semaphore_create(0);
    -[RTMotionActivityManager_CoreMotion motionActivityManager](v79, "motionActivityManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = MEMORY[0x1E0C809B0];
    v84[1] = 3221225472;
    v84[2] = __90__RTMotionActivityManager_CoreMotion__fetchMotionActivitiesFromStartDate_endDate_handler___block_invoke;
    v84[3] = &unk_1E92A0C78;
    v40 = v82;
    v85 = v40;
    v33 = v37;
    v86 = v33;
    v88 = &v90;
    v89 = &v96;
    v41 = v38;
    v87 = v41;
    v82 = v40;
    objc_msgSend(v39, "queryActivityStartingFromDate:toDate:toQueue:withHandler:", v40, v33, v77, v84);

    v42 = v41;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = dispatch_time(0, 3600000000000);
    v45 = v32;
    if (dispatch_semaphore_wait(v42, v44))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "timeIntervalSinceDate:", v43);
      v48 = v47;
      v49 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_254);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "filteredArrayUsingPredicate:", v50);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "firstObject");
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v49, "submitToCoreAnalytics:type:duration:", v53, 1, v48);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v54, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v55 = (void *)MEMORY[0x1E0CB35C8];
      v117[0] = v76;
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v117, 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "errorWithDomain:code:userInfo:", v75, 15, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = v32;
      if (v57)
      {
        v45 = objc_retainAutorelease(v57);

      }
    }

    v58 = v45;
    v59 = v58 == 0;
    v60 = v91;
    if (v58)
    {
      v61 = v58;
      v62 = (void *)v60[5];
      v60[5] = (uint64_t)v61;
    }
    else
    {
      if (v91[5])
      {
        v59 = 0;
        goto LABEL_28;
      }
      v63 = v33;
      v62 = v82;
      v82 = v63;
    }

LABEL_28:
    objc_autoreleasePoolPop(context);
    v32 = v58;
    if (!v59)
      goto LABEL_32;
  }
  v58 = v32;
LABEL_32:
  _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  v64 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v74, "stringFromDate");
    v65 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "stringFromDate");
    v66 = (id)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend((id)v97[5], "count");
    v68 = v91[5];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "timeIntervalSinceDate:", v73);
    v71 = v70;
    +[RTRuntime footprint](RTRuntime, "footprint");
    *(_DWORD *)buf = 138413570;
    *(_QWORD *)&buf[4] = v65;
    v103 = 2112;
    v104 = v66;
    v105 = 2048;
    v106 = v67;
    v107 = 2112;
    v108 = v68;
    v109 = 2048;
    v110 = v71;
    v111 = 2048;
    v112 = v72;
    _os_log_impl(&dword_1D1A22000, v64, OS_LOG_TYPE_INFO, "Queried CoreMotion for motionActivity between, startDate, %@, endDate, %@, activities count, %lu, error, %@, latency, %.4f sec, footprint, %.2f MB", buf, 0x3Eu);

  }
  v78[2](v78, v97[5], (void *)v91[5]);

  _Block_object_dispose(&v90, 8);
  _Block_object_dispose(&v96, 8);

LABEL_7:
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))v78;
LABEL_8:

}

- (void)_fetchPredominantMotionActivityTypeFromStartDate:(id)a3 toEndDate:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __109__RTMotionActivityManager_CoreMotion__fetchPredominantMotionActivityTypeFromStartDate_toEndDate_withHandler___block_invoke;
  v14[3] = &unk_1E9297F30;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[RTMotionActivityManager_CoreMotion _fetchMotionActivitiesFromStartDate:endDate:handler:](self, "_fetchMotionActivitiesFromStartDate:endDate:handler:", v13, v12, v14);

}

- (void)_fetchPredominantMotionActivityWithHandler:(id)a3
{
  void (**v4)(id, RTMotionActivity *, _QWORD);
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, RTMotionActivity *, _QWORD))a3;
  _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (self->_dominantMotionActivityBootstrapped)
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    v7 = 136315394;
    v8 = "-[RTMotionActivityManager_CoreMotion _fetchPredominantMotionActivityWithHandler:]";
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, _dominantMotionActivityBootstrapped, %@", (uint8_t *)&v7, 0x16u);
  }

  v4[2](v4, self->_dominantMotionActivity, 0);
}

- (void)setDominantMotionActivity:(id)a3
{
  id v5;
  RTMotionActivity **p_dominantMotionActivity;
  RTMotionActivity *v7;
  void *v8;
  unint64_t v9;
  RTMotionActivityManagerNotificationDominantMotionActivityChange *v10;
  NSObject *v11;
  RTMotionActivity *v12;
  int v13;
  RTMotionActivity *v14;
  __int16 v15;
  RTMotionActivity *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_dominantMotionActivity = &self->_dominantMotionActivity;
  if ((-[RTMotionActivity isEqual:](self->_dominantMotionActivity, "isEqual:", v5) & 1) == 0
    && (-[RTMotionActivity type](*p_dominantMotionActivity, "type") != 4 || objc_msgSend(v5, "type") != 6))
  {
    v7 = *p_dominantMotionActivity;
    objc_storeStrong((id *)&self->_dominantMotionActivity, a3);
    +[RTNotification notificationName](RTMotionActivityManagerNotificationDominantMotionActivityChange, "notificationName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v8);

    if (v9)
    {
      v10 = -[RTMotionActivityManagerNotificationDominantMotionActivityChange initWithDominantMotionActivity:]([RTMotionActivityManagerNotificationDominantMotionActivityChange alloc], "initWithDominantMotionActivity:", v5);
      -[RTNotifier postNotification:](self, "postNotification:", v10);

    }
    _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = *p_dominantMotionActivity;
      v13 = 138412546;
      v14 = v7;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "dominant motion activity change from, %@, to, %@", (uint8_t *)&v13, 0x16u);
    }

    if (*p_dominantMotionActivity)
      -[RTMotionActivityManager_CoreMotion _processSettledState](self, "_processSettledState");

  }
}

- (void)setSettledState:(unint64_t)a3
{
  unint64_t settledState;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  RTMotionActivityManagerNotificationMotionSettledStateChange *v11;
  unint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  settledState = self->_settledState;
  if (settledState == a3)
  {
    if (a3 == 1)
    {
      -[RTMotionActivityManager_CoreMotion dominantMotionActivity](self, "dominantMotionActivity");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "type") == 4)
      {

LABEL_12:
        -[RTMotionActivityManager_CoreMotion _resubscribeForActivityAlarms](self, "_resubscribeForActivityAlarms");
        return;
      }
      v12 = -[RTMotionActivityManager_CoreMotion vehicleConnectedState](self, "vehicleConnectedState");

      if (v12 == 2)
        goto LABEL_12;
    }
  }
  else
  {
    self->_settledState = a3;
    _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      +[RTMotionActivityManager motionSettledStateToString:](RTMotionActivityManager, "motionSettledStateToString:", settledState);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTMotionActivityManager motionSettledStateToString:](RTMotionActivityManager, "motionSettledStateToString:", self->_settledState);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v7;
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "settled state change from, %@, to, %@", (uint8_t *)&v13, 0x16u);

    }
    +[RTNotification notificationName](RTMotionActivityManagerNotificationMotionSettledStateChange, "notificationName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v9);

    if (v10)
    {
      v11 = -[RTMotionActivityManagerNotificationMotionSettledStateChange initWithSettledState:]([RTMotionActivityManagerNotificationMotionSettledStateChange alloc], "initWithSettledState:", self->_settledState);
      -[RTNotifier postNotification:](self, "postNotification:", v11);

    }
    -[RTMotionActivityManager_CoreMotion _resubscribeForActivityAlarms](self, "_resubscribeForActivityAlarms");
  }
}

- (void)setDominantMotionActivityBootstrapped:(BOOL)a3
{
  if (self->_dominantMotionActivityBootstrapped != a3)
  {
    self->_dominantMotionActivityBootstrapped = a3;
    if (a3)
      -[RTMotionActivityManager_CoreMotion _processDominantActivity](self, "_processDominantActivity");
  }
}

- (void)_bootstrapDominantActivityWithMotionActivites:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  +[RTNotification notificationName](RTMotionActivityManagerNotificationMotionSettledStateChange, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v4))
  {

  }
  else
  {
    +[RTNotification notificationName](RTMotionActivityManagerNotificationDominantMotionActivityChange, "notificationName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v5);

    if (!v6)
      goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", &__block_literal_global_110_0);
  if (objc_msgSend(v8, "count"))
  {
    -[RTMotionActivityManager_CoreMotion motionActivities](self, "motionActivities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v8);

  }
  -[RTMotionActivityManager_CoreMotion setDominantMotionActivityBootstrapped:](self, "setDominantMotionActivityBootstrapped:", 1);
LABEL_9:

}

- (void)_onVehicleConnectedNotification
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *MEMORY[0x1E0CA5740];
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "received darwin notification, %@", (uint8_t *)&v5, 0xCu);
  }

  -[RTMotionActivityManager_CoreMotion setVehicleConnectedState:](self, "setVehicleConnectedState:", 2);
}

- (void)onVehicleConnectedNotification
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__RTMotionActivityManager_CoreMotion_onVehicleConnectedNotification__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_onVehicleDisconnectedNotification
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (void *)*MEMORY[0x1E0CA5748];
    *(_DWORD *)buf = 138412290;
    v34 = v4;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "received darwin notification, %@", buf, 0xCu);
  }

  -[RTMotionActivityManager_CoreMotion setVehicleConnectedState:](self, "setVehicleConnectedState:", 1);
  if (objc_msgSend(MEMORY[0x1E0CA5700], "isAvailable"))
  {
    objc_msgSend(MEMORY[0x1E0CA5700], "mostRecentVehicleConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "timeRange");
      v7 = objc_claimAutoreleasedReturnValue();
      if (!v7)
        goto LABEL_7;
      v8 = (void *)v7;
      objc_msgSend(v6, "timeRange");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeRange");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "endDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "isAfterDate:", v12);

      if (!v13)
      {
        v16 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(v6, "timeRange");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "startDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "timeRange");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "endDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v16, "initWithStartDate:endDate:", v18, v20);

        v21 = objc_alloc(MEMORY[0x1E0D18568]);
        objc_msgSend(v6, "vehicleName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "vehicleModelName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "vehicleBluetoothAddress");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v21, "initWithDateInterval:vehicleName:vehicleModelName:bluetoothAddress:", v14, v22, v23, v24);

        _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v25;
          _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "vehicle disconnected, %@", buf, 0xCu);
        }

        -[RTMotionActivityManager vehicleStore](self, "vehicleStore");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v25, "description");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v34 = v30;
            _os_log_debug_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_DEBUG, "Storing Vehicle: %@", buf, 0xCu);

          }
          -[RTMotionActivityManager vehicleStore](self, "vehicleStore");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __72__RTMotionActivityManager_CoreMotion__onVehicleDisconnectedNotification__block_invoke;
          v31[3] = &unk_1E9297150;
          v32 = v25;
          objc_msgSend(v29, "storeVehicle:handler:", v32, v31);

        }
      }
      else
      {
LABEL_7:
        _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v6, "description");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v34 = v15;
          _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Vehicle state data received with invalid date interval: %@", buf, 0xCu);

        }
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Error retrieving most recent vehicle connection", buf, 2u);
      }
    }

  }
}

- (void)onVehicleDisconnectedNotification
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__RTMotionActivityManager_CoreMotion_onVehicleDisconnectedNotification__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)setVehicleConnectedState:(unint64_t)a3
{
  unint64_t vehicleConnectedState;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  RTMotionActivityManagerNotificationVehicleConnected *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  vehicleConnectedState = self->_vehicleConnectedState;
  if (vehicleConnectedState != a3)
  {
    self->_vehicleConnectedState = a3;
    _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      +[RTMotionActivityManager motionActivityVehicleConnectedStateToString:](RTMotionActivityManager, "motionActivityVehicleConnectedStateToString:", vehicleConnectedState);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTMotionActivityManager motionActivityVehicleConnectedStateToString:](RTMotionActivityManager, "motionActivityVehicleConnectedStateToString:", self->_vehicleConnectedState);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v6;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "vehicle connected state changed from, %@, to %@", (uint8_t *)&v11, 0x16u);

    }
    if (vehicleConnectedState && self->_vehicleConnectedState)
    {
      if (objc_msgSend(MEMORY[0x1E0CA5700], "isAvailable"))
      {
        objc_msgSend(MEMORY[0x1E0CA5700], "mostRecentVehicleConnection");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "deviceId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v9 = 0;
      }
      v10 = -[RTMotionActivityManagerNotificationVehicleConnected initWithVehicleConnectedState:deviceId:]([RTMotionActivityManagerNotificationVehicleConnected alloc], "initWithVehicleConnectedState:deviceId:", self->_vehicleConnectedState, v9);
      -[RTNotifier postNotification:](self, "postNotification:", v10);
      -[RTMotionActivityManager_CoreMotion _processSettledState](self, "_processSettledState");

    }
  }
}

- (void)onVehicleExitNotification
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__RTMotionActivityManager_CoreMotion_onVehicleExitNotification__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)setInterestedInActivity:(int64_t)a3
{
  int64_t interestedInActivity;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id buf[2];

  interestedInActivity = self->_interestedInActivity;
  if (interestedInActivity != a3)
  {
    self->_interestedInActivity = a3;
    if (a3 < 1 || interestedInActivity)
    {
      if (!a3 && interestedInActivity >= 1)
      {
        _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "stopping activity updates", (uint8_t *)buf, 2u);
        }

        -[RTMotionActivityManager_CoreMotion motionActivityManager](self, "motionActivityManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stopActivityUpdates");

      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "starting activity updates", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, self);
      -[RTMotionActivityManager_CoreMotion motionActivityManager](self, "motionActivityManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMotionActivityManager_CoreMotion operationQueue](self, "operationQueue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __62__RTMotionActivityManager_CoreMotion_setInterestedInActivity___block_invoke;
      v10[3] = &unk_1E92A56E8;
      objc_copyWeak(&v11, buf);
      objc_msgSend(v6, "startActivityUpdatesToQueue:withHandler:", v7, v10);

      objc_destroyWeak(&v11);
      objc_destroyWeak(buf);
    }
  }
}

- (void)_processDominantActivity
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  RTMotionActivityHistogram *v8;
  void *v9;
  RTMotionActivityHistogram *v10;
  void *v11;
  NSObject *v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  NSObject *v20;
  double v21;
  dispatch_time_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  NSObject *v33;
  double v34;
  dispatch_time_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (-[RTMotionActivityManager_CoreMotion dominantMotionActivityBootstrapped](self, "dominantMotionActivityBootstrapped"))
  {
    -[RTMotionActivityManager_CoreMotion motionActivities](self, "motionActivities");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v5, -30.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMotionActivityManager_CoreMotion motionActivities](self, "motionActivities");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTMotionActivityManager removeActivities:stoppedBeforeDate:](RTMotionActivityManager_CoreMotion, "removeActivities:stoppedBeforeDate:", v7, v6);

      v8 = [RTMotionActivityHistogram alloc];
      -[RTMotionActivityManager_CoreMotion motionActivities](self, "motionActivities");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[RTMotionActivityHistogram initWithActivites:betweenDate:andDate:](v8, "initWithActivites:betweenDate:andDate:", v9, v6, v5);

      -[RTMotionActivityHistogram binsSortedByInterval](v10, "binsSortedByInterval");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          v36 = objc_msgSend(v11, "count");
          -[RTMotionActivityHistogram totalInterval](v10, "totalInterval");
          v38 = 134218240;
          v39 = v36;
          v40 = 2048;
          v41 = v37;
          _os_log_debug_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEBUG, "%lu activites in the last %.2f seconds", (uint8_t *)&v38, 0x16u);
        }

        objc_msgSend(v11, "enumerateObjectsUsingBlock:", &__block_literal_global_117_0);
      }
      -[RTMotionActivityHistogram totalInterval](v10, "totalInterval");
      if (v13 >= 30.0)
      {
        objc_msgSend(v11, "firstObject");
        v20 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18400]), "initWithType:confidence:startDate:", -[NSObject type](v20, "type"), -[NSObject confidence](v20, "confidence"), v6);
        -[RTMotionActivityManager_CoreMotion setDominantMotionActivity:](self, "setDominantMotionActivity:", v23);

        -[RTMotionActivityManager_CoreMotion motionActivities](self, "motionActivities");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "lastObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = objc_msgSend(v25, "type");
        -[RTMotionActivityManager_CoreMotion dominantMotionActivity](self, "dominantMotionActivity");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "type");

        if (v26 != v28)
        {
          -[RTMotionActivityHistogram binForType:](v10, "binForType:", objc_msgSend(v25, "type"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "interval");
          v31 = v30;
          -[RTMotionActivityManager_CoreMotion dominantMotionActivityTimer](self, "dominantMotionActivityTimer");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
          {
            -[RTMotionActivityManager_CoreMotion dominantMotionActivityTimer](self, "dominantMotionActivityTimer");
            v33 = objc_claimAutoreleasedReturnValue();
            v34 = ((30.0 - v31) * 0.5 + 1.0) * 1000000000.0;
            v35 = dispatch_time(0, (uint64_t)v34);
            dispatch_source_set_timer(v33, v35, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v34 * 0.02));

          }
        }

      }
      else
      {
        v14 = objc_alloc(MEMORY[0x1E0D18400]);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v14, "initWithType:confidence:startDate:", 0, 0, v15);
        -[RTMotionActivityManager_CoreMotion setDominantMotionActivity:](self, "setDominantMotionActivity:", v16);

        -[RTMotionActivityHistogram totalInterval](v10, "totalInterval");
        v18 = v17;
        -[RTMotionActivityManager_CoreMotion dominantMotionActivityTimer](self, "dominantMotionActivityTimer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
LABEL_16:

          return;
        }
        -[RTMotionActivityManager_CoreMotion dominantMotionActivityTimer](self, "dominantMotionActivityTimer");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (30.0 - v18) * 1000000000.0;
        v22 = dispatch_time(0, (uint64_t)v21);
        dispatch_source_set_timer(v20, v22, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v21 * 0.02));
      }

      goto LABEL_16;
    }
  }
}

- (void)_processSettledState
{
  uint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;

  if (-[RTMotionActivityManager_CoreMotion vehicleConnectedState](self, "vehicleConnectedState") == 2)
  {
    v3 = 1;
LABEL_8:
    -[RTMotionActivityManager_CoreMotion setSettledState:](self, "setSettledState:", v3);
    return;
  }
  -[RTMotionActivityManager_CoreMotion dominantMotionActivity](self, "dominantMotionActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "confidence");

  if (v5 >= 2)
  {
    -[RTMotionActivityManager_CoreMotion dominantMotionActivity](self, "dominantMotionActivity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "type");

    if ((unint64_t)(v7 - 1) > 4)
      v3 = 0;
    else
      v3 = qword_1D1EEE6C8[v7 - 1];
    goto LABEL_8;
  }
}

- (void)_onActivity:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  RTMotionActivityManagerNotificationActivity *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[RTNotification notificationName](RTMotionActivityManagerNotificationActivity, "notificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v5);

  if (v6)
  {
    v7 = -[RTMotionActivityManagerNotificationActivity initWithActivity:]([RTMotionActivityManagerNotificationActivity alloc], "initWithActivity:", v4);
    -[RTNotifier postNotification:](self, "postNotification:", v7);

  }
  +[RTNotification notificationName](RTMotionActivityManagerNotificationMotionSettledStateChange, "notificationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v8))
  {

  }
  else
  {
    +[RTNotification notificationName](RTMotionActivityManagerNotificationDominantMotionActivityChange, "notificationName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v9);

    if (!v10)
      goto LABEL_9;
  }
  _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "caching RTMotionActivity, %@", (uint8_t *)&v13, 0xCu);
  }

  -[RTMotionActivityManager_CoreMotion motionActivities](self, "motionActivities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v4);

  -[RTMotionActivityManager_CoreMotion _processDominantActivity](self, "_processDominantActivity");
LABEL_9:

}

- (void)onActivity:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__RTMotionActivityManager_CoreMotion_onActivity___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_resubscribeForActivityAlarms
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint8_t buf[16];

  if (-[RTMotionActivityManager_CoreMotion interestedInActivity](self, "interestedInActivity")
    && (objc_msgSend(MEMORY[0x1E0CA55D0], "activityAlarmAvailable") & 1) != 0)
  {
    v3 = -[RTMotionActivityManager_CoreMotion settledState](self, "settledState");
    if (v3)
    {
      if (v3 != 2)
      {
        if (v3 == 1)
        {
          v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", &unk_1E9329708, 0);
          if (-[RTMotionActivityManager_CoreMotion vehicleConnectedState](self, "vehicleConnectedState") == 2
            || (-[RTMotionActivityManager_CoreMotion dominantMotionActivity](self, "dominantMotionActivity"),
                v4 = (void *)objc_claimAutoreleasedReturnValue(),
                v5 = objc_msgSend(v4, "type"),
                v4,
                v5 == 4))
          {
            objc_msgSend(v8, "addObject:", &unk_1E9329720);
          }
          -[RTMotionActivityManager_CoreMotion _subscribeForMotionAlarmTypes:](self, "_subscribeForMotionAlarmTypes:", v8);

        }
        return;
      }
      v7 = &unk_1E932CCB8;
    }
    else
    {
      v7 = &unk_1E932CCD0;
    }
    -[RTMotionActivityManager_CoreMotion _subscribeForMotionAlarmTypes:](self, "_subscribeForMotionAlarmTypes:", v7);
    return;
  }
  _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "Bail from resubscribing to motion alarms", buf, 2u);
  }

}

- (void)_subscribeForMotionAlarmTypes:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  __int128 v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  const char *aSelector;
  SEL aSelectora;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CA55D0], "activityAlarmAvailable") & 1) != 0)
  {
    aSelector = a2;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v9 = 0;
      *(_QWORD *)&v8 = 138412290;
      v38 = v8;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v9, v38);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "unsignedIntValue");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v12);

        -[RTMotionActivityManager_CoreMotion activityAlarms](self, "activityAlarms");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(MEMORY[0x1E0CA55D0], "triggerToString:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v16);
        }
        else
        {
          -[RTMotionActivityManager_CoreMotion _rtAlarmForTrigger:](self, "_rtAlarmForTrigger:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            -[RTMotionActivityManager_CoreMotion activityAlarms](self, "activityAlarms");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v18);

            objc_msgSend(MEMORY[0x1E0CA55D0], "triggerToString:", v11);
            v19 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v19);
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(MEMORY[0x1E0CA55D0], "triggerToString:", v11);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v38;
              v47 = v20;
              _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "failed to subscribe for motion activity alarm %@", buf, 0xCu);

            }
          }

        }
        ++v9;
      }
      while (v9 < objc_msgSend(v5, "count"));
    }
    _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(aSelector);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v47 = v23;
      v48 = 2112;
      v49 = v24;
      _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%@, subscribed for motion activity alarms, %@", buf, 0x16u);

    }
    aSelectora = (SEL)v6;

    v25 = (void *)MEMORY[0x1E0C99E20];
    -[RTMotionActivityManager_CoreMotion activityAlarms](self, "activityAlarms");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "allKeys");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setWithArray:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "minusSet:", v7);
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v29 = v28;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v42 != v32)
            objc_enumerationMutation(v29);
          v34 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
          -[RTMotionActivityManager_CoreMotion activityAlarms](self, "activityAlarms");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectForKeyedSubscript:", v34);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTMotionActivityManager_CoreMotion _invalidateAlarm:](self, "_invalidateAlarm:", v36);

          -[RTMotionActivityManager_CoreMotion activityAlarms](self, "activityAlarms");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setObject:forKeyedSubscript:", 0, v34);

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v31);
    }

    v21 = aSelectora;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_DEBUG, "Bail from subscribing to motion alarms", buf, 2u);
    }
  }

}

+ (double)durationForTrigger:(unsigned int)a3
{
  double result;
  double v4;

  result = 180.0;
  v4 = 60.0;
  if (a3 == 3)
    v4 = 10.0;
  if (a3 != 4)
    result = v4;
  if (a3 == 10)
    return 10.0;
  return result;
}

- (id)_rtAlarmForTrigger:(unsigned int)a3
{
  uint64_t v3;
  double v5;
  double v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v3 = *(_QWORD *)&a3;
  objc_msgSend((id)objc_opt_class(), "durationForTrigger:", *(_QWORD *)&a3);
  v6 = v5;
  v7 = objc_alloc(MEMORY[0x1E0CA55D0]);
  -[RTNotifier queue](self, "queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__RTMotionActivityManager_CoreMotion__rtAlarmForTrigger___block_invoke;
  v11[3] = &unk_1E92A5730;
  v11[4] = self;
  v9 = (void *)objc_msgSend(v7, "initWithTrigger:duration:onQueue:withHandler:", v3, v8, v11, v6);

  return v9;
}

- (void)_processActivityAlarm:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  RTMotionActivityManagerNotificationActivityAlarm *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    v9 = (RTMotionActivityManagerNotificationActivityAlarm *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super.super, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412290;
      v17 = v8;
      _os_log_error_impl(&dword_1D1A22000, &v9->super.super, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_4;
  }
  if (v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v11;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, received %@", (uint8_t *)&v16, 0x16u);

    }
    -[RTMotionActivityManager_CoreMotion _invalidateAlarm:](self, "_invalidateAlarm:", v7);
    -[RTMotionActivityManager_CoreMotion activityAlarms](self, "activityAlarms");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "trigger"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v13);

    -[RTMotionActivityManager_CoreMotion _fetchMotionActivitiesIfNeeded](self, "_fetchMotionActivitiesIfNeeded");
    +[RTNotification notificationName](RTMotionActivityManagerNotificationActivityAlarm, "notificationName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v14);

    if (v15)
    {
      v9 = -[RTMotionActivityManagerNotificationActivityAlarm initWithActivityAlarmTrigger:]([RTMotionActivityManagerNotificationActivityAlarm alloc], "initWithActivityAlarmTrigger:", objc_msgSend((id)objc_opt_class(), "activityAlarmTriggerFromCMActivityAlarmTrigger:", objc_msgSend(v7, "trigger")));
      -[RTNotifier postNotification:](self, "postNotification:", v9);
LABEL_4:

    }
  }

}

- (void)_invalidateAlarm:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CA55D0], "triggerToString:", objc_msgSend(v3, "trigger"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "invalidate alarm type %@", (uint8_t *)&v8, 0xCu);

    }
    objc_msgSend(v3, "invalidate");
    _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CA55D0], "triggerToString:", objc_msgSend(v3, "trigger"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "invalidated alarm type %@", (uint8_t *)&v8, 0xCu);

    }
  }

}

- (void)_invalidateActivityAlarms
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[RTMotionActivityManager_CoreMotion activityAlarms](self, "activityAlarms", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        -[RTMotionActivityManager_CoreMotion activityAlarms](self, "activityAlarms");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTMotionActivityManager_CoreMotion _invalidateAlarm:](self, "_invalidateAlarm:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  -[RTMotionActivityManager_CoreMotion setActivityAlarms:](self, "setActivityAlarms:", 0);
}

- (void)_subscribeForPedometerDataWithStartDate:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  id v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  _BYTE *v35;
  SEL v36;
  uint8_t v37[4];
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  _BYTE buf[24];
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (v7)
    {
      _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(MEMORY[0x1E0CA5698], "isStepCountingAvailable");
        v14 = CFSTR("NO");
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2112;
        if (v13)
          v14 = CFSTR("YES");
        *(_QWORD *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2112;
        v46 = (uint64_t (*)(uint64_t, uint64_t))v14;
        _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, %@, isStepCountingAvailable, %@", buf, 0x20u);

      }
      if ((objc_msgSend(MEMORY[0x1E0CA5698], "isStepCountingAvailable") & 1) != 0)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v46 = __Block_byref_object_copy__166;
        v47 = __Block_byref_object_dispose__166;
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v48 = (id)objc_claimAutoreleasedReturnValue();
        v15 = objc_alloc_init(MEMORY[0x1E0CA5698]);
        -[RTMotionActivityManager_CoreMotion uuidToPedometersMap](self, "uuidToPedometersMap");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

        _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = (objc_class *)objc_opt_class();
          NSStringFromClass(v18);
          v19 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v20 = (id)objc_claimAutoreleasedReturnValue();
          v21 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          objc_msgSend(v7, "stringFromDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v37 = 138413058;
          v38 = v19;
          v39 = 2112;
          v40 = v20;
          v41 = 2112;
          v42 = v21;
          v43 = 2112;
          v44 = v22;
          _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "%@, %@, starting pedometer updates with UUID, %@, startDate, %@", v37, 0x2Au);

        }
        v23 = (void *)MEMORY[0x1D8231EA8]();
        -[RTMotionActivityManager_CoreMotion uuidToPedometersMap](self, "uuidToPedometersMap");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __86__RTMotionActivityManager_CoreMotion__subscribeForPedometerDataWithStartDate_handler___block_invoke;
        v33[3] = &unk_1E92A5758;
        v33[4] = self;
        v36 = a2;
        v26 = v8;
        v34 = v26;
        v35 = buf;
        objc_msgSend(v25, "startPedometerUpdatesFromDate:withHandler:", v7, v33);

        objc_autoreleasePoolPop(v23);
        (*((void (**)(id, _QWORD, _QWORD, _QWORD))v26 + 2))(v26, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), 0, 0);
        _Block_object_dispose(buf, 8);

      }
      else
      {
        v30 = (void *)MEMORY[0x1E0CB35C8];
        v49 = *MEMORY[0x1E0CB2D50];
        v50 = CFSTR("step counting is not supported");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 1, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        (*((void (**)(id, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, v32);
      }
    }
    else
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v51 = *MEMORY[0x1E0CB2D50];
      v52[0] = CFSTR("startDate is nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, v29);
    }
  }

}

- (void)_unsubscribeForPedometerData:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = v8;
    v20 = 2112;
    v21 = v9;
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, %@, stopping pedometer updates for UUID, %@", (uint8_t *)&v18, 0x20u);

  }
  if (v5
    && (-[RTMotionActivityManager_CoreMotion uuidToPedometersMap](self, "uuidToPedometersMap"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "objectForKeyedSubscript:", v5),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    -[RTMotionActivityManager_CoreMotion uuidToPedometersMap](self, "uuidToPedometersMap");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stopPedometerUpdates");

    -[RTMotionActivityManager_CoreMotion uuidToPedometersMap](self, "uuidToPedometersMap");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", 0, v5);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v16;
      v20 = 2112;
      v21 = v17;
      v22 = 2112;
      v23 = v5;
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%@, %@, pedometer for UUID, %@, not found in dictionary", (uint8_t *)&v18, 0x20u);

    }
  }

}

- (BOOL)dominantMotionActivityBootstrapped
{
  return self->_dominantMotionActivityBootstrapped;
}

- (NSMutableArray)motionActivities
{
  return self->_motionActivities;
}

- (void)setMotionActivities:(id)a3
{
  objc_storeStrong((id *)&self->_motionActivities, a3);
}

- (RTMotionActivity)dominantMotionActivity
{
  return self->_dominantMotionActivity;
}

- (unint64_t)settledState
{
  return self->_settledState;
}

- (void)setActivityAlarms:(id)a3
{
  objc_storeStrong((id *)&self->_activityAlarms, a3);
}

- (int64_t)interestedInActivity
{
  return self->_interestedInActivity;
}

- (unint64_t)vehicleConnectedState
{
  return self->_vehicleConnectedState;
}

- (CMMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_motionActivityManager, a3);
}

- (BOOL)motionActivityAvailable
{
  return self->_motionActivityAvailable;
}

- (void)setMotionActivityAvailable:(BOOL)a3
{
  self->_motionActivityAvailable = a3;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (OS_dispatch_source)dominantMotionActivityTimer
{
  return self->_dominantMotionActivityTimer;
}

- (void)setDominantMotionActivityTimer:(id)a3
{
  objc_storeStrong((id *)&self->_dominantMotionActivityTimer, a3);
}

- (NSDate)lastQueryForMotionActivity
{
  return self->_lastQueryForMotionActivity;
}

- (void)setLastQueryForMotionActivity:(id)a3
{
  objc_storeStrong((id *)&self->_lastQueryForMotionActivity, a3);
}

- (NSMutableDictionary)uuidToPedometersMap
{
  return self->_uuidToPedometersMap;
}

- (void)setUuidToPedometersMap:(id)a3
{
  objc_storeStrong((id *)&self->_uuidToPedometersMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidToPedometersMap, 0);
  objc_storeStrong((id *)&self->_lastQueryForMotionActivity, 0);
  objc_storeStrong((id *)&self->_dominantMotionActivityTimer, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_activityAlarms, 0);
  objc_storeStrong((id *)&self->_dominantMotionActivity, 0);
  objc_storeStrong((id *)&self->_motionActivities, 0);
}

@end
