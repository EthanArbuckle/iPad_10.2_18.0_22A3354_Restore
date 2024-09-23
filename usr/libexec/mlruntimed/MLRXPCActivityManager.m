@implementation MLRXPCActivityManager

- (MLRXPCActivityManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MLRXPCActivityManager;
  return -[MLRXPCActivityManager init](&v3, "init");
}

- (void)handleCompleteActivityTask:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  void *v14;
  _BYTE v15[24];

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (!v9)
      goto LABEL_7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    *(_DWORD *)v15 = 138543618;
    *(_QWORD *)&v15[4] = v10;
    *(_WORD *)&v15[12] = 2114;
    *(_QWORD *)&v15[14] = v7;
    v11 = "%{public}@ failed: %{public}@.";
    v12 = v8;
    v13 = 22;
  }
  else
  {
    if (!v9)
      goto LABEL_7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    *(_DWORD *)v15 = 138543362;
    *(_QWORD *)&v15[4] = v10;
    v11 = "%{public}@ completed successfully.";
    v12 = v8;
    v13 = 12;
  }
  _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, v15, v13);

LABEL_7:
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activity"));
  objc_msgSend(v6, "setActivity:", 0);
  if (objc_msgSend(v6, "eligibilityHandler"))
  {
    -[MLRXPCActivityManager removeEligibilityChangedHandler:](self, "removeEligibilityChangedHandler:", objc_msgSend(v6, "eligibilityHandler"));
    objc_msgSend(v6, "setEligibilityHandler:", 0);
  }
  if (objc_msgSend(v6, "activityDeferred", *(_OWORD *)v15, *(_QWORD *)&v15[16]))
  {
    -[MLRXPCActivityManager setStateForXPCActivity:state:](self, "setStateForXPCActivity:state:", v14, 3);
  }
  else
  {
    +[DESUserDefaultsStoreRecord purgeObsoleted](DESUserDefaultsStoreRecord, "purgeObsoleted");
    -[MLRXPCActivityManager setStateForXPCActivity:state:](self, "setStateForXPCActivity:state:", v14, 5);
    if (objc_msgSend(v6, "dynamicallyRegistered"))
      objc_msgSend(v6, "setShouldRegister:", 0);
  }

}

- (void)handleDeferActivityTask:(id)a3 withStartTime:(double)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  int v15;
  void *v16;

  v5 = a3;
  if (objc_msgSend(v5, "activityDeferred"))
  {
    v6 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
      v15 = 138412290;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DAS request to defer activity=%@ again. Ignoring.", (uint8_t *)&v15, 0xCu);

    }
  }
  else
  {
    objc_msgSend(v5, "setActivityDeferred:", 1);
    v8 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
      v15 = 138412290;
      v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DAS request to defer activity: %@.", (uint8_t *)&v15, 0xCu);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    objc_msgSend(v10, "systemUptime");
    v12 = v11 - a4;

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    *(float *)&v14 = v12;
    +[DESCoreAnalyticsEventManager sendEventActivityShouldDeferWithActivityID:connectionDuration:](DESCoreAnalyticsEventManager, "sendEventActivityShouldDeferWithActivityID:connectionDuration:", v13, v14);

    objc_msgSend(v5, "stop");
  }

}

- (void)runActivityTask:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22[2];
  uint8_t buf[4];
  void *v24;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    *(_DWORD *)buf = 138543362;
    v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting %{public}@.", buf, 0xCu);

  }
  objc_msgSend(v4, "setActivityDeferred:", 0);
  if (-[MLRXPCActivityManager submissionAllowed](self, "submissionAllowed"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    +[DESCoreAnalyticsEventManager sendEventMaintenanceWithActivityID:intervalSincePostedEvent:shouldSkip:lockState:](DESCoreAnalyticsEventManager, "sendEventMaintenanceWithActivityID:intervalSincePostedEvent:shouldSkip:lockState:", v7, 0, MKBGetDeviceLockState(0), 0.0);

LABEL_6:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    objc_msgSend(v10, "systemUptime");
    v12 = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activity"));
    -[MLRXPCActivityManager setStateForXPCActivity:state:](self, "setStateForXPCActivity:state:", v13, 4);

    objc_initWeak((id *)buf, self);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activity"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000EFC0;
    v20[3] = &unk_100018AC0;
    objc_copyWeak(v22, (id *)buf);
    v15 = v4;
    v21 = v15;
    v22[1] = v12;
    objc_msgSend(v15, "setEligibilityHandler:", -[MLRXPCActivityManager addEligibilityChangedHandlerForActivity:handler:](self, "addEligibilityChangedHandlerForActivity:handler:", v14, v20));

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000F058;
    v18[3] = &unk_100018AE8;
    v18[4] = self;
    v19 = v15;
    objc_msgSend(v19, "startTaskWithCompletion:", v18);

    objc_destroyWeak(v22);
    objc_destroyWeak((id *)buf);
    goto LABEL_10;
  }
  v8 = objc_msgSend(v4, "bypassDiagnosticsUsage");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  +[DESCoreAnalyticsEventManager sendEventMaintenanceWithActivityID:intervalSincePostedEvent:shouldSkip:lockState:](DESCoreAnalyticsEventManager, "sendEventMaintenanceWithActivityID:intervalSincePostedEvent:shouldSkip:lockState:", v9, v8 ^ 1, MKBGetDeviceLockState(0), 0.0);

  if ((v8 & 1) != 0)
    goto LABEL_6;
  v16 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    *(_DWORD *)buf = 138543362;
    v24 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Skipping %{public}@ because D&U is not allowed.", buf, 0xCu);

  }
  -[MLRXPCActivityManager handleCompleteActivityTask:withError:](self, "handleCompleteActivityTask:withError:", v4, 0);
LABEL_10:

}

- (void)_registerXPCActivityTasks:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;
  id v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  __int128 v21;
  _QWORD v22[6];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  _BYTE v29[128];

  v4 = a3;
  v5 = -[MLRXPCActivityManager submissionAllowed](self, "submissionAllowed");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v24;
    *(_QWORD *)&v8 = 138412290;
    v21 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v11);
        if ((v5 & 1) != 0
          || (objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v11), "bypassDiagnosticsUsage") & 1) != 0)
        {
          v13 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel", v21));
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
            *(_DWORD *)buf = v21;
            v28 = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Registering xpc activity %@.", buf, 0xCu);

          }
          v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier")));
          v16 = objc_msgSend(v15, "UTF8String");
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_10000F31C;
          v22[3] = &unk_100018B10;
          v22[4] = self;
          v22[5] = v12;
          -[MLRXPCActivityManager registerWithIdentifier:criteria:handler:](self, "registerWithIdentifier:criteria:handler:", v16, XPC_ACTIVITY_CHECK_IN, v22);

        }
        else
        {
          v17 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
            *(_DWORD *)buf = v21;
            v28 = v18;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Unregistering xpc activity %@ because D&U is not allowed.", buf, 0xCu);

          }
          v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier")));
          -[MLRXPCActivityManager unregisterXPCActivityWithIdentifier:](self, "unregisterXPCActivityWithIdentifier:", objc_msgSend(v19, "UTF8String"));

          if (objc_msgSend(v12, "dynamicallyRegistered"))
            objc_msgSend(v12, "setShouldRegister:", 0);
        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v20 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      v9 = v20;
    }
    while (v20);
  }

}

- (id)createXPCActivityTasks
{
  MLRXPCActivityTaskWithLockedDevice *v2;
  MLRXPCActivityTaskFedStatsWithLockedDevice *v3;
  void *v4;
  void *v5;
  MLRXPCActivityTaskWithClassB *v6;
  _QWORD v8[2];

  v2 = objc_opt_new(MLRXPCActivityTaskWithLockedDevice);
  v8[0] = v2;
  v3 = objc_opt_new(MLRXPCActivityTaskFedStatsWithLockedDevice);
  v8[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v4));

  v6 = objc_opt_new(MLRXPCActivityTaskWithClassB);
  objc_msgSend(v5, "addObject:", v6);

  return v5;
}

- (void)registerIfNeeded
{
  unsigned int v3;
  int submissionWasAllowed;
  NSObject *v6;
  id v7;
  uint8_t buf[16];

  v3 = -[MLRXPCActivityManager submissionAllowed](self, "submissionAllowed");
  submissionWasAllowed = self->_submissionWasAllowed;
  self->_submissionWasAllowed = v3;
  if (self->_hasRegistered && submissionWasAllowed == v3)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Not re-registering because we have registered and D&U has not changed", buf, 2u);
    }

  }
  else
  {
    self->_hasRegistered = 1;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MLRXPCActivityManager createXPCActivityTasks](self, "createXPCActivityTasks"));
    -[MLRXPCActivityManager _registerXPCActivityTasks:](self, "_registerXPCActivityTasks:", v7);

  }
}

- (BOOL)setStateForXPCActivity:(id)a3 state:(int64_t)a4
{
  _xpc_activity_s *v5;
  BOOL v6;
  NSObject *v7;

  v5 = (_xpc_activity_s *)a3;
  v6 = xpc_activity_set_state(v5, a4);
  if (!v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10000F7F4(v5, a4, v7);

  }
  return v6;
}

- (int64_t)getStateForForXPCActivity:(id)a3
{
  return xpc_activity_get_state((xpc_activity_t)a3);
}

- (_xpc_activity_eligibility_changed_handler_s)addEligibilityChangedHandlerForActivity:(id)a3 handler:(id)a4
{
  return (_xpc_activity_eligibility_changed_handler_s *)xpc_activity_add_eligibility_changed_handler(a3, a4);
}

- (void)removeEligibilityChangedHandler:(_xpc_activity_eligibility_changed_handler_s *)a3
{
  xpc_activity_remove_eligibility_changed_handler(a3, a2);
}

- (BOOL)shouldDeferForXPCActivity:(id)a3
{
  return xpc_activity_should_defer((xpc_activity_t)a3);
}

- (void)unregisterXPCActivityWithIdentifier:(const char *)a3
{
  xpc_activity_unregister(a3);
}

- (void)registerWithIdentifier:(const char *)a3 criteria:(id)a4 handler:(id)a5
{
  xpc_activity_register(a3, a4, a5);
}

- (void)setCriteriaForXPCActivityIfNeeded:(id)a3 criteria:(id)a4
{
  _xpc_activity_s *v5;
  id v6;
  xpc_object_t v7;
  int64_t int64;
  NSObject *v9;
  int v10;
  int64_t v11;
  __int16 v12;
  _xpc_activity_s *v13;

  v5 = (_xpc_activity_s *)a3;
  v6 = a4;
  v7 = xpc_activity_copy_criteria(v5);
  int64 = xpc_dictionary_get_int64(v6, XPC_ACTIVITY_INTERVAL);
  if (!v7 || xpc_dictionary_get_int64(v7, XPC_ACTIVITY_INTERVAL) != int64)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134349314;
      v11 = int64;
      v12 = 2114;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Set new activity interval to %{public}lld seconds for %{public}@", (uint8_t *)&v10, 0x16u);
    }

    xpc_activity_set_criteria(v5, v6);
  }

}

@end
