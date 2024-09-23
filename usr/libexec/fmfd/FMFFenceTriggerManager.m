@implementation FMFFenceTriggerManager

- (FMFFenceTriggerManager)initWithDelegate:(id)a3
{
  id v4;
  FMFFenceTriggerManager *v5;
  FMFFenceTriggerManager *v6;
  FMFScheduler *v7;
  FMFScheduler *scheduler;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMFFenceTriggerManager;
  v5 = -[FMFFenceTriggerManager init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (FMFScheduler *)objc_msgSend(objc_alloc((Class)FMFScheduler), "initWithDelegate:", v6);
    scheduler = v6->_scheduler;
    v6->_scheduler = v7;

    -[FMFFenceTriggerManager registerAlarms](v6, "registerAlarms");
  }

  return v6;
}

- (void)setFences:(id)a3
{
  NSArray *v4;
  NSArray *fences;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (NSArray *)a3;
  -[FMFFenceTriggerManager checkForChangedFencesPastInviteDate:](self, "checkForChangedFencesPastInviteDate:", v4);
  fences = self->_fences;
  self->_fences = v4;

  v6 = objc_claimAutoreleasedReturnValue(-[FMFFenceTriggerManager scheduledFences](self, "scheduledFences"));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceTriggerManager scheduledFences](self, "scheduledFences"));
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceTriggerManager scheduledFences](self, "scheduledFences"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fm_map:", &stru_10009ACA0));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceTriggerManager scheduler](self, "scheduler"));
      objc_msgSend(v12, "setSchedules:", v11);

    }
  }
  -[FMFFenceTriggerManager _updateInviteTimer](self, "_updateInviteTimer");
}

- (id)firstFutureStartDateFromHiddenScheduledFences:(id)a3 order:(int64_t)a4
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v18 = 0;
    v7 = *(_QWORD *)v22;
    v8 = FMFFenceAcceptanceStatusPendingHidden;
    while (1)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "inviteDate"));
        v12 = v11;
        if (!v6 || objc_msgSend(v11, "compare:", v6) == (id)a4)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "acceptanceStatus"));
          if (objc_msgSend(v13, "isEqualToString:", v8))
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
            v15 = objc_msgSend(v14, "compare:", v12);

            if (v15 != (id)-1)
              goto LABEL_12;
            v16 = v10;

            v13 = v6;
            v6 = v12;
            v18 = v16;
          }

        }
LABEL_12:

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (!v5)
        goto LABEL_16;
    }
  }
  v6 = 0;
  v18 = 0;
LABEL_16:

  return v18;
}

- (void)triggerWithUUID:(id)a3 forFence:(id)a4 withStatus:(id)a5 atDate:(id)a6 triggerLocation:(id)a7 clientSession:(id)a8 completion:(id)a9
{
  id v15;
  char *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void (**v21)(id, _QWORD);
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  unsigned __int8 v31;
  void *v32;
  unsigned int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  unsigned __int8 v37;
  void *v38;
  unsigned __int8 v39;
  _QWORD v40[4];
  char *v41;
  id v42;
  id v43;
  void (**v44)(id, _QWORD);
  _QWORD v45[2];
  _QWORD v46[2];
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  __int16 v55;
  char *v56;

  v15 = a3;
  v16 = (char *)a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = (void (**)(id, _QWORD))a9;
  v22 = sub_100011D0C();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v48 = "-[FMFFenceTriggerManager triggerWithUUID:forFence:withStatus:atDate:triggerLocation:clientSession:completion:]";
    v49 = 2112;
    v50 = v15;
    v51 = 2112;
    v52 = v17;
    v53 = 2112;
    v54 = v18;
    v55 = 2112;
    v56 = v16;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s: uuid: %@ withStatus: %@ forDate: %@ fence: %@", buf, 0x34u);
  }

  if ((objc_msgSend(v16, "isMuted") & 1) != 0)
  {
    v24 = sub_100011D0C();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v16;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Triggered fence %@ is muted", buf, 0xCu);
    }

    v45[0] = CFSTR("fenceTriggerIsMuted");
    v45[1] = CFSTR("fenceTriggerType");
    v46[0] = &off_1000A0FC0;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trigger"));
    v46[1] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 2));
    AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.ReliabilityMetric"), v27);

    v21[2](v21, 0);
  }
  else
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "acceptanceStatus"));
    v29 = objc_msgSend(v28, "isEqualToString:", FMFFenceAcceptanceStatusAccepted);

    if (v29)
    {
      objc_msgSend(v16, "triggerWithUUID:status:atDate:triggerLocation:completion:", v15, v17, v18, v19, v21);
    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "acceptanceStatus"));
      if (objc_msgSend(v30, "isEqualToString:", FMFFenceAcceptanceStatusPendingHidden))
      {
        v31 = objc_msgSend(v17, "isEqualToString:", FMFFenceTriggerStatusIn);

        if ((v31 & 1) == 0)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
          v33 = objc_msgSend(v32, "BOOLForKey:", CFSTR("FMFScheduledFenceInviteOnTrigger"));

          if (v33)
          {
            v34 = FMFFenceTriggerScheduled;
          }
          else
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trigger"));
            v34 = FMFFenceTriggerScheduled;
            v39 = objc_msgSend(v35, "isEqualToString:", FMFFenceTriggerScheduled);

            if ((v39 & 1) != 0)
              goto LABEL_18;
          }
          objc_msgSend(v16, "setAcceptanceStatus:", FMFFenceAcceptanceStatusPending);
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trigger"));
          v37 = objc_msgSend(v36, "isEqualToString:", v34);

          if ((v37 & 1) == 0)
            objc_msgSend(v16, "setTriggerForRepeatedFenceBeforeAccpetanceWithTriggerStatus:date:location:", v17, v18, v19);
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceTriggerManager delegate](self, "delegate"));
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_10004A350;
          v40[3] = &unk_10009ACC8;
          v41 = v16;
          v42 = v15;
          v43 = v18;
          v44 = v21;
          objc_msgSend(v38, "triggerManager:didModifyFence:clientSession:withCompletion:", self, v41, v20, v40);

        }
      }
      else
      {

      }
    }
  }
LABEL_18:

}

- (void)receiveTriggerWithUUID:(id)a3 forFence:(id)a4 withStatus:(id)a5 atDate:(id)a6 triggerLocation:(id)a7 completion:(id)a8
{
  id v13;
  char *v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, _QWORD);
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  char *v36;

  v13 = a3;
  v14 = (char *)a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = (void (**)(id, _QWORD))a8;
  v19 = sub_100011D0C();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v28 = "-[FMFFenceTriggerManager receiveTriggerWithUUID:forFence:withStatus:atDate:triggerLocation:completion:]";
    v29 = 2112;
    v30 = v13;
    v31 = 2112;
    v32 = v15;
    v33 = 2112;
    v34 = v16;
    v35 = 2112;
    v36 = v14;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: uuid: %@ withStatus: %@ forDate: %@ fence: %@", buf, 0x34u);
  }

  if ((objc_msgSend(v14, "isMuted") & 1) != 0)
  {
    v21 = sub_100011D0C();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v14;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Triggered fence %@ is muted", buf, 0xCu);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trigger", CFSTR("fenceTriggerIsMuted"), CFSTR("fenceTriggerType"), &off_1000A0FC0));
    v26[1] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, &v25, 2));
    AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.ReliabilityMetric"), v24);

    v18[2](v18, 0);
  }
  else
  {
    objc_msgSend(v14, "receiveTriggerWithUUID:status:atDate:triggerLocation:completion:", v13, v15, v16, v17, v18);
  }

}

- (id)triggerForRepeatedFenceBeforeAcceptanceWithFence:(id)a3
{
  return _objc_msgSend(a3, "triggerForRepeatedFenceBeforeAcceptance");
}

- (void)clearStaleFenceTriggerForFence:(id)a3
{
  _objc_msgSend(a3, "clearStaleFenceTrigger");
}

- (void)clearStaleFenceStatusForFenceID:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = a3;
  v4 = objc_msgSend((id)objc_opt_class(FMFFence), "statusByWindowStartDateByFenceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v5, "removeObjectForKey:", v3);

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = objc_msgSend((id)objc_opt_class(FMFFence), "statusByWindowStartDateByFenceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("FMFScheduledFenceStatus"));

}

- (NSArray)scheduledFences
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceTriggerManager fences](self, "fences"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fm_filter:", &stru_10009AD08));

  return (NSArray *)v3;
}

- (void)checkForChangedFencesPastInviteDate:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v4, "removeObjectsInArray:", self->_fences);
  -[FMFFenceTriggerManager inviteFencesPastInviteDate:](self, "inviteFencesPastInviteDate:", v4);

}

- (void)inviteFencesPastInviteDate:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  FMFFenceTriggerManager *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004A7DC;
  v5[3] = &unk_100099348;
  v6 = a3;
  v7 = self;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)registerAlarms
{
  _QWORD handler[5];

  if ((_os_feature_enabled_impl("FindMy", "Fences_Migration") & 1) == 0)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10004AB30;
    handler[3] = &unk_10009A0F8;
    handler[4] = self;
    xpc_set_event_stream_handler(FMFFenceTimerAlarmStream, (dispatch_queue_t)&_dispatch_main_q, handler);
  }
}

- (void)handleAlarmForAlarmName:(int64_t)a3
{
  id v3;

  switch(a3)
  {
    case 2:
      -[FMFFenceTriggerManager _graceTimerFired](self, "_graceTimerFired");
      break;
    case 1:
      v3 = (id)objc_claimAutoreleasedReturnValue(-[FMFFenceTriggerManager scheduler](self, "scheduler"));
      objc_msgSend(v3, "scheduleTimerFired");

      break;
    case 0:
      -[FMFFenceTriggerManager _inviteTimerFired](self, "_inviteTimerFired");
      break;
  }
}

- (void)_updateInviteTimer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  xpc_object_t v11;
  double v12;
  double v13;
  time_t v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceTriggerManager scheduledFences](self, "scheduledFences"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceTriggerManager firstFutureStartDateFromHiddenScheduledFences:order:](self, "firstFutureStartDateFromHiddenScheduledFences:order:", v3, -1));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "inviteDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceTriggerManager cachedFirstInvitedDate](self, "cachedFirstInvitedDate"));
  v7 = objc_msgSend(v5, "isEqualToDate:", v6);

  if (v4 && v5 && (v7 & 1) == 0)
  {
    -[FMFFenceTriggerManager setCachedFirstInvitedDate:](self, "setCachedFirstInvitedDate:", v5);
    v8 = sub_100011D0C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v5;
      v17 = 2112;
      v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "UpdateInviteTimer for date: %@ fence: %@ ", (uint8_t *)&v15, 0x16u);
    }

    v10 = FMFFenceTimerAlarmStream;
    xpc_set_event(FMFFenceTimerAlarmStream, "com.apple.icloud.fmf.FMFFenceInviteTimer", 0);
    v11 = xpc_dictionary_create(0, 0, 0);
    objc_msgSend(v5, "timeIntervalSinceNow");
    v13 = v12;
    v14 = time(0);
    xpc_dictionary_set_date(v11, FMFFenceTimerAlarmDateKey, (uint64_t)((ceil(v13) + (double)v14) * 1000000000.0));
    xpc_dictionary_set_BOOL(v11, FMFFenceTimerAlarmUserVisible, 1);
    xpc_set_event(v10, "com.apple.icloud.fmf.FMFFenceInviteTimer", v11);

  }
}

- (void)_inviteTimerFired
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  __int128 v24;
  uint64_t v25;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  void *v34;

  v2 = sub_100011D0C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    *(_DWORD *)buf = 138412290;
    v34 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "inviteTimer called for date: %@", buf, 0xCu);

  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceTriggerManager fences](self, "fences"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v29;
    v10 = FMFFenceAcceptanceStatusPendingHidden;
    v25 = FMFFenceAcceptanceStatusPending;
    *(_QWORD *)&v7 = 138412290;
    v24 = v7;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now", v24));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "inviteDate"));
        v15 = objc_msgSend(v13, "compare:", v14);

        if (v15 == (id)1)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "acceptanceStatus"));
          if ((objc_msgSend(v16, "isEqualToString:", v10) & 1) == 0)
            goto LABEL_16;
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "schedule"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          if ((objc_msgSend(v17, "isCurrentAt:", v18) & 1) == 0)
          {

LABEL_16:
            goto LABEL_17;
          }
          v19 = objc_msgSend(v12, "isOnMe");

          if (v19)
          {
            v20 = sub_100011D0C();
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
              *(_DWORD *)buf = v24;
              v34 = v22;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "inviteTimer invite valid fence: %@", buf, 0xCu);

            }
            objc_msgSend(v12, "setAcceptanceStatus:", v25);
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceTriggerManager delegate](self, "delegate"));
            v27[0] = _NSConcreteStackBlock;
            v27[1] = 3221225472;
            v27[2] = sub_10004B210;
            v27[3] = &unk_10009AD30;
            v27[4] = v12;
            objc_msgSend(v23, "triggerManager:didModifyFence:withCompletion:", self, v12, v27);

          }
        }
LABEL_17:
        v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v8);
  }

  -[FMFFenceTriggerManager _updateInviteTimer](self, "_updateInviteTimer");
}

- (void)_graceTimerFired
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[5];
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceTriggerManager scheduledFences](self, "scheduledFences"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10004B438;
  v18[3] = &unk_10009A850;
  v18[4] = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fm_filter:", v18));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    v9 = FMFFenceTriggerStatusUndetermined;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10);
        AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.ReliabilityMetric"), &off_1000A1208);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
        objc_msgSend(v11, "triggerWithUUID:status:atDate:triggerLocation:completion:", v12, v9, v3, 0, 0);

        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v7);
  }

}

- (void)schedulerCurrentSchedulesDidChange:(id)a3
{
  time_t v3;
  xpc_object_t xdict;

  xdict = xpc_dictionary_create(0, 0, 0);
  v3 = time(0);
  xpc_dictionary_set_date(xdict, FMFFenceTimerAlarmDateKey, (uint64_t)(((double)v3 + 90.0) * 1000000000.0));
  xpc_dictionary_set_BOOL(xdict, FMFFenceTimerAlarmUserVisible, 1);
  xpc_set_event(FMFFenceTimerAlarmStream, "com.apple.icloud.fmf.FMFFenceTriggerManager.GraceTimer", xdict);

}

- (FMFFenceTriggerManagerDelegate)delegate
{
  return (FMFFenceTriggerManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSArray)fences
{
  return self->_fences;
}

- (NSMutableDictionary)statusByWindowStartDateByFenceID
{
  return self->_statusByWindowStartDateByFenceID;
}

- (FMFScheduler)scheduler
{
  return self->_scheduler;
}

- (NSDate)cachedFirstInvitedDate
{
  return self->_cachedFirstInvitedDate;
}

- (void)setCachedFirstInvitedDate:(id)a3
{
  objc_storeStrong((id *)&self->_cachedFirstInvitedDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedFirstInvitedDate, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_statusByWindowStartDateByFenceID, 0);
  objc_storeStrong((id *)&self->_fences, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
