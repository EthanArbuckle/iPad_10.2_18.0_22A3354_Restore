@implementation MCBackgroundActivityManager

- (void)start
{
  const char *v3;
  OS_dispatch_queue *workQueue;
  const char *v5;
  OS_dispatch_queue *v6;
  void *v7;
  const char *v8;
  OS_dispatch_queue *v9;
  const char *v10;
  OS_dispatch_queue *v11;
  OS_dispatch_queue *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD handler[5];
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D374;
  block[3] = &unk_1000E2C50;
  block[4] = self;
  if (qword_1000FD820 != -1)
    dispatch_once(&qword_1000FD820, block);
  v3 = (const char *)objc_msgSend(MCProfileListChangedNotification, "UTF8String");
  workQueue = self->_workQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001D3D4;
  handler[3] = &unk_1000E36C8;
  handler[4] = self;
  notify_register_dispatch(v3, &self->_profileChangeNotificationToken, (dispatch_queue_t)workQueue, handler);
  v5 = (const char *)objc_msgSend(MCManagedAppsChangedNotification, "UTF8String");
  v6 = self->_workQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001D598;
  v16[3] = &unk_1000E36C8;
  v16[4] = self;
  notify_register_dispatch(v5, &self->_managedAppChangeNotificationToken, (dispatch_queue_t)v6, v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "activationLockBypassCodeWasStored:", MCActivationLockBypassCodeWasStoredNotification, 0);

  v8 = (const char *)objc_msgSend(MCPasscodeChangedNotification, "UTF8String");
  v9 = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001D698;
  v15[3] = &unk_1000E36C8;
  v15[4] = self;
  notify_register_dispatch(v8, &self->_passcodeChangedNotificationToken, (dispatch_queue_t)v9, v15);
  v10 = (const char *)objc_msgSend(MCPasscodePolicyChangedNotification, "UTF8String");
  v11 = self->_workQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001D710;
  v14[3] = &unk_1000E36C8;
  v14[4] = self;
  notify_register_dispatch(v10, &self->_passcodePolicyChangedNotificationToken, (dispatch_queue_t)v11, v14);
  v12 = self->_workQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001D780;
  v13[3] = &unk_1000E2C50;
  v13[4] = self;
  dispatch_async((dispatch_queue_t)v12, v13);
}

- (void)stop
{
  id v3;

  notify_cancel(-[MCBackgroundActivityManager profileChangeNotificationToken](self, "profileChangeNotificationToken"));
  notify_cancel(-[MCBackgroundActivityManager managedAppChangeNotificationToken](self, "managedAppChangeNotificationToken"));
  notify_cancel(-[MCBackgroundActivityManager passcodeChangedNotificationToken](self, "passcodeChangedNotificationToken"));
  notify_cancel(-[MCBackgroundActivityManager passcodePolicyChangedNotificationToken](self, "passcodePolicyChangedNotificationToken"));
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)activationLockBypassCodeWasStored:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v4 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Activation lock bypass code was stored. Rescheduling activation lock cleanup.", v7, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCBackgroundActivityManager _nextActivationLockCleanupDate](self, "_nextActivationLockCleanupDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", 40 * XPC_ACTIVITY_INTERVAL_1_MIN));
  -[MCBackgroundActivityManager _rescheduleBackgroundActivity:startDate:gracePeriod:priority:repeatingInterval:](self, "_rescheduleBackgroundActivity:startDate:gracePeriod:priority:repeatingInterval:", 2, v5, v6, 0, 0);

}

- (id)_nextRegularDate
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  char *v8;
  char *v9;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "components:fromDate:", 2097212, v3));

  v5 = (uint64_t)objc_msgSend(v4, "hour");
  v6 = objc_alloc_init((Class)NSDateComponents);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timeZone"));
  objc_msgSend(v6, "setTimeZone:", v7);

  objc_msgSend(v6, "setYear:", objc_msgSend(v4, "year"));
  objc_msgSend(v6, "setMonth:", objc_msgSend(v4, "month"));
  v8 = (char *)objc_msgSend(v4, "day");
  if (v5 <= 2)
    v9 = v8;
  else
    v9 = v8 + 1;
  objc_msgSend(v6, "setDay:", v9);
  objc_msgSend(v6, "setHour:", 3);
  objc_msgSend(v6, "setMinute:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dateFromComponents:", v6));

  return v10;
}

- (id)_nextActivationLockCleanupDate
{
  void *v2;
  double v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "doubleForKey:", CFSTR("ActivationLockCleanupJobInterval"));
  v4 = v3;

  v5 = 1296000.0;
  if (v4 != 0.0)
    v5 = v4;
  return +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", v5);
}

- (id)_nextManagedAppValidationDateWithOverride:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProvisioningProfileJanitor sharedJanitor](MCProvisioningProfileJanitor, "sharedJanitor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "earliestRequiredManagedAppValidationDate"));

  if (v3 && v5)
  {
    v6 = v3;

    v5 = v6;
  }

  return v5;
}

- (const)_jobNameForBackgroundActivityType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7)
    return "com.apple.profiled.profileJanitor";
  else
    return off_1000E3758[a3 - 1];
}

- (id)_jobDescriptionForBackgroundActivityType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7)
    return CFSTR("profile janitor cleanup");
  else
    return off_1000E3798[a3 - 1];
}

- (void)_handleXPCActivity:(int64_t)a3 proposedStartDate:(id)a4 normalizeStartDate:(BOOL)a5 proposedGracePeriod:(id)a6 proposedPriority:(const char *)a7 repeatingInterval:(id)a8 requireNetwork:(BOOL)a9 requireUnlock:(BOOL)a10
{
  _BOOL4 v13;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  xpc_object_t v22;
  double v23;
  __CFString *v24;
  NSObject *v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  char *identifier;
  id v34;
  void *v35;
  id v36;
  _QWORD handler[4];
  id v38;
  id v39;
  MCBackgroundActivityManager *v40;
  id v41[4];
  uint8_t buf[4];
  void *v43;

  v13 = a5;
  v16 = a4;
  v36 = a6;
  v34 = a8;
  identifier = -[MCBackgroundActivityManager _jobNameForBackgroundActivityType:](self, "_jobNameForBackgroundActivityType:", a3);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MCBackgroundActivityManager _jobDescriptionForBackgroundActivityType:](self, "_jobDescriptionForBackgroundActivityType:", a3));
  if (v16)
  {
    if (v13)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCBackgroundActivityManager _nextRegularDate](self, "_nextRegularDate"));
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "earlierDate:", v17));

      v16 = (id)v18;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 10.0));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "laterDate:", v19));

    v20 = v36;
    if (!v36)
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", 2 * XPC_ACTIVITY_INTERVAL_1_HOUR));
    if (a7)
      v21 = a7;
    else
      v21 = XPC_ACTIVITY_PRIORITY_MAINTENANCE;
    v22 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v22, XPC_ACTIVITY_GRACE_PERIOD, (int64_t)objc_msgSend(v20, "longValue"));
    objc_msgSend(v32, "timeIntervalSinceNow");
    xpc_dictionary_set_int64(v22, XPC_ACTIVITY_DELAY, (uint64_t)v23);
    xpc_dictionary_set_string(v22, XPC_ACTIVITY_PRIORITY, v21);
    if (v34)
    {
      xpc_dictionary_set_BOOL(v22, XPC_ACTIVITY_REPEATING, 1);
      xpc_dictionary_set_int64(v22, XPC_ACTIVITY_INTERVAL, (int64_t)objc_msgSend(v34, "longValue"));
      if (!a9)
      {
LABEL_12:
        v36 = v20;
        if (a10)
          xpc_dictionary_set_BOOL(v22, XPC_ACTIVITY_REQUIRES_CLASS_A, 1);
        if (v34)
          v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(", Repeat Interval: %@"), v34));
        else
          v24 = &stru_1000E4AA0;
        v26 = CFSTR(", Require Network: true");
        if (!a9)
          v26 = &stru_1000E4AA0;
        v27 = v26;
        v28 = CFSTR(", Require Unlock: true");
        if (!a10)
          v28 = &stru_1000E4AA0;
        v29 = v28;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Scheduling %@ at %@. Priority: %s, Grace Period: %@%@%@%@"), v35, v32, v21, v36, v24, v27, v29));
        v31 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v43 = v30;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
        objc_initWeak((id *)buf, self);
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_10001E0A0;
        handler[3] = &unk_1000E3710;
        v41[1] = identifier;
        objc_copyWeak(v41, (id *)buf);
        v38 = v35;
        v41[2] = (id)a3;
        v39 = v34;
        v40 = self;
        v41[3] = (id)v21;
        xpc_activity_register(identifier, v22, handler);

        objc_destroyWeak(v41);
        objc_destroyWeak((id *)buf);

        goto LABEL_29;
      }
    }
    else
    {
      xpc_dictionary_set_BOOL(v22, XPC_ACTIVITY_REPEATING, 0);
      if (!a9)
        goto LABEL_12;
    }
    xpc_dictionary_set_BOOL(v22, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
    goto LABEL_12;
  }
  v25 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v43 = v35;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Cancelling %{public}@", buf, 0xCu);
  }
  xpc_activity_unregister(identifier);
LABEL_29:

}

- (void)rescheduleProfileJanitorJob
{
  MCProfileJanitor *v3;
  void *v4;
  void *v5;
  MCProfileEventsManager *v6;
  void *v7;
  id v8;

  v3 = objc_opt_new(MCProfileJanitor);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileJanitor earliestExpiryDate](v3, "earliestExpiryDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", XPC_ACTIVITY_INTERVAL_5_MIN));
  -[MCBackgroundActivityManager _rescheduleBackgroundActivity:startDate:gracePeriod:priority:repeatingInterval:](self, "_rescheduleBackgroundActivity:startDate:gracePeriod:priority:repeatingInterval:", 0, v4, v5, XPC_ACTIVITY_PRIORITY_UTILITY, 0);

  v6 = objc_opt_new(MCProfileEventsManager);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[MCProfileEventsManager earlistProfileEventExpiry](v6, "earlistProfileEventExpiry"));

  if (v8)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", XPC_ACTIVITY_INTERVAL_5_MIN));
    -[MCBackgroundActivityManager _rescheduleBackgroundActivity:startDate:gracePeriod:priority:repeatingInterval:](self, "_rescheduleBackgroundActivity:startDate:gracePeriod:priority:repeatingInterval:", 1, v8, v7, XPC_ACTIVITY_PRIORITY_UTILITY, 0);

  }
}

- (void)rescheduleManagedAppValidationJob
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 86400.0));
  -[MCBackgroundActivityManager _rescheduleBackgroundActivity:startDate:gracePeriod:priority:repeatingInterval:](self, "_rescheduleBackgroundActivity:startDate:gracePeriod:priority:repeatingInterval:", 3, v3, 0, 0, 0);

}

- (void)rescheduleManagedAppValidationJob:(id)a3
{
  -[MCBackgroundActivityManager _rescheduleBackgroundActivity:startDate:gracePeriod:priority:repeatingInterval:](self, "_rescheduleBackgroundActivity:startDate:gracePeriod:priority:repeatingInterval:", 3, a3, 0, 0, 0);
}

- (void)reschedulePasscodeExpiryJob
{
  OS_dispatch_queue *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E604;
  block[3] = &unk_1000E2C50;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)_workQueueReschedulePasscodeExpiryJob
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "passcodeExpiryDate"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", XPC_ACTIVITY_INTERVAL_1_MIN));
  -[MCBackgroundActivityManager _workQueueReschedule:startDate:gracePeriod:priority:repeatingInterval:](self, "_workQueueReschedule:startDate:gracePeriod:priority:repeatingInterval:", 5, v5, v4, XPC_ACTIVITY_PRIORITY_UTILITY, 0);

}

- (void)rescheduleRecoveryPasscodeExpiryJob
{
  OS_dispatch_queue *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E6F8;
  block[3] = &unk_1000E2C50;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)_workQueueRescheduleRecoveryPasscodeExpiryJob
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  unsigned int v7;
  id v8;
  os_log_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManager sharedManager](MCPasscodeManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recoveryPasscodeExpiryDate"));

  if (!v4)
  {
    v5 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No recovery passcode, clearing associated data if necessary", buf, 2u);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](MCPasscodeManagerWriter, "sharedManager"));
    v13 = 0;
    v7 = objc_msgSend(v6, "clearRecoveryPasscodeOpaqueDataWithOutError:", &v13);
    v8 = v13;

    if (v7)
    {
      +[MCPasscodeAnalytics sendRecoveryPasscodeClearedEventWithReason:](MCPasscodeAnalytics, "sendRecoveryPasscodeClearedEventWithReason:", 7);
    }
    else if (v8)
    {
      v9 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v10 = v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "MCVerboseDescription"));
        *(_DWORD *)buf = 138543362;
        v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to clear recovery passcode opaque data: %{public}@", buf, 0xCu);

      }
    }

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", XPC_ACTIVITY_INTERVAL_1_MIN));
  -[MCBackgroundActivityManager _workQueueReschedule:startDate:gracePeriod:priority:repeatingInterval:](self, "_workQueueReschedule:startDate:gracePeriod:priority:repeatingInterval:", 6, v4, v12, XPC_ACTIVITY_PRIORITY_UTILITY, 0);

}

- (void)scheduleRecomputeNagMetadataJob
{
  OS_dispatch_queue *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E92C;
  block[3] = &unk_1000E2C50;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)_rescheduleBackgroundActivity:(int64_t)a3 startDate:(id)a4 gracePeriod:(id)a5 priority:(const char *)a6 repeatingInterval:(id)a7
{
  id v12;
  id v13;
  id v14;
  OS_dispatch_queue *workQueue;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  int64_t v23;
  const char *v24;

  v12 = a4;
  v13 = a5;
  v14 = a7;
  workQueue = self->_workQueue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001EA8C;
  v19[3] = &unk_1000E3738;
  v19[4] = self;
  v20 = v12;
  v23 = a3;
  v24 = a6;
  v21 = v13;
  v22 = v14;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  dispatch_async((dispatch_queue_t)workQueue, v19);

}

- (void)_workQueueReschedule:(int64_t)a3 startDate:(id)a4 gracePeriod:(id)a5 priority:(const char *)a6 repeatingInterval:(id)a7
{
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;

  v17 = a4;
  v12 = a5;
  v13 = a7;
  if (a3 == 3)
  {
    v14 = objc_claimAutoreleasedReturnValue(-[MCBackgroundActivityManager _nextManagedAppValidationDateWithOverride:](self, "_nextManagedAppValidationDateWithOverride:", v17));

    v15 = (id)v14;
  }
  else
  {
    v15 = v17;
  }
  LOBYTE(v16) = a3 == 3;
  BYTE1(v16) = (unint64_t)(a3 - 7) < 2;
  v18 = v15;
  -[MCBackgroundActivityManager _handleXPCActivity:proposedStartDate:normalizeStartDate:proposedGracePeriod:proposedPriority:repeatingInterval:requireNetwork:requireUnlock:](self, "_handleXPCActivity:proposedStartDate:normalizeStartDate:proposedGracePeriod:proposedPriority:repeatingInterval:requireNetwork:requireUnlock:", a3, v15, ((unint64_t)a3 > 8) | (0x9Bu >> a3) & 1, v12, a6, v13, v16);

}

- (MCProfileServiceServer)server
{
  return (MCProfileServiceServer *)objc_loadWeakRetained((id *)&self->_server);
}

- (void)setServer:(id)a3
{
  objc_storeWeak((id *)&self->_server, a3);
}

- (int)profileChangeNotificationToken
{
  return self->_profileChangeNotificationToken;
}

- (void)setProfileChangeNotificationToken:(int)a3
{
  self->_profileChangeNotificationToken = a3;
}

- (int)managedAppChangeNotificationToken
{
  return self->_managedAppChangeNotificationToken;
}

- (void)setManagedAppChangeNotificationToken:(int)a3
{
  self->_managedAppChangeNotificationToken = a3;
}

- (int)passcodeChangedNotificationToken
{
  return self->_passcodeChangedNotificationToken;
}

- (void)setPasscodeChangedNotificationToken:(int)a3
{
  self->_passcodeChangedNotificationToken = a3;
}

- (int)passcodePolicyChangedNotificationToken
{
  return self->_passcodePolicyChangedNotificationToken;
}

- (void)setPasscodePolicyChangedNotificationToken:(int)a3
{
  self->_passcodePolicyChangedNotificationToken = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_server);
}

@end
