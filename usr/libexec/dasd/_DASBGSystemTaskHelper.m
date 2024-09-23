@implementation _DASBGSystemTaskHelper

+ (_DASBGSystemTaskHelper)sharedInstance
{
  if (qword_1001ABC48 != -1)
    dispatch_once(&qword_1001ABC48, &stru_10015F4D0);
  return (_DASBGSystemTaskHelper *)(id)qword_1001ABC40;
}

+ (OS_dispatch_queue)activityQueue
{
  return (OS_dispatch_queue *)(id)qword_1001ABC50;
}

- (_DASBGSystemTaskHelper)init
{
  _DASBGSystemTaskHelper *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  uint64_t v11;
  NSDate *currentBootupDate;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_DASBGSystemTaskHelper;
  v2 = -[_DASBGSystemTaskHelper init](&v14, "init");
  v3 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("BGSTHelper")));
  v4 = (void *)qword_1001ABC58;
  qword_1001ABC58 = v3;

  v5 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = (void *)qword_1001ABC60;
  qword_1001ABC60 = (uint64_t)v5;

  v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = dispatch_queue_create("com.apple.bg.system.task", v8);
  v10 = (void *)qword_1001ABC50;
  qword_1001ABC50 = (uint64_t)v9;

  -[_DASBGSystemTaskHelper setupPublisher](v2, "setupPublisher");
  v11 = objc_claimAutoreleasedReturnValue(-[_DASBGSystemTaskHelper bootupDate](v2, "bootupDate"));
  currentBootupDate = v2->_currentBootupDate;
  v2->_currentBootupDate = (NSDate *)v11;

  -[_DASBGSystemTaskHelper registerTimeChangeNotification](v2, "registerTimeChangeNotification");
  return v2;
}

- (id)serviceNameFromToken:(unint64_t)a3
{
  __CFString *v3;
  void *v4;
  _OWORD v6[8];

  memset(v6, 0, sizeof(v6));
  if (xpc_get_service_identifier_for_token(a3, v6))
  {
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v6));
    if (-[__CFString hasPrefix:](v3, "hasPrefix:", CFSTR("com.apple.")))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByReplacingOccurrencesOfString:withString:](v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("com.apple."), &stru_1001617C8));

      return v4;
    }
  }
  else
  {
    v3 = &stru_1001617C8;
  }
  return v3;
}

- (void)setupPublisher
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  _QWORD v7[5];

  v3 = xpc_event_publisher_create("com.apple.bg.system.task", qword_1001ABC50);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)qword_1001ABC68;
  qword_1001ABC68 = v4;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100092C40;
  v7[3] = &unk_10015F4F8;
  v7[4] = self;
  v6 = objc_retainBlock(v7);
  xpc_event_publisher_set_handler(qword_1001ABC68, v6);

}

- (void)startWithListener:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = a3;
  v4 = qword_1001ABC58;
  if (os_log_type_enabled((os_log_t)qword_1001ABC58, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Creating scheduler with endpoint to listener by DAS", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endpoint"));
  v6 = objc_claimAutoreleasedReturnValue(+[_DASScheduler schedulerWithEndpoint:withClientName:](_DASScheduler, "schedulerWithEndpoint:withClientName:", v5, _DASClientNameBGST));
  v7 = (void *)qword_1001ABC70;
  qword_1001ABC70 = v6;

  v8 = qword_1001ABC58;
  if (os_log_type_enabled((os_log_t)qword_1001ABC58, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Activating listener sent by DAS", v12, 2u);
  }
  objc_msgSend(v3, "activate");
  v9 = qword_1001ABC58;
  if (os_log_type_enabled((os_log_t)qword_1001ABC58, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Activating publisher", v11, 2u);
  }
  xpc_event_publisher_activate(qword_1001ABC68);
  v10 = dispatch_time(0, 10000000000);
  dispatch_after(v10, (dispatch_queue_t)qword_1001ABC50, &stru_10015F518);

}

- (BOOL)dasSubmitActivity:(id)a3 withClientOffset:(double)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivity activityWithDASBGSystemTask:withClientOffset:](_DASActivity, "activityWithDASBGSystemTask:withClientOffset:", v7, a4));
  objc_msgSend(v7, "setScheduler_activity:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "group_name"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "group_name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityGroup groupWithName:maxConcurrent:](_DASActivityGroup, "groupWithName:maxConcurrent:", v10, objc_msgSend(v7, "group_concurrency_limit")));

  }
  v11 = (void *)qword_1001ABC70;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scheduler_activity"));
  v21 = 0;
  v13 = objc_msgSend(v11, "submitActivity:inGroup:error:", v12, v9, &v21);
  v14 = v21;

  if (!v13)
  {
    v19 = (void *)qword_1001ABC58;
    if (os_log_type_enabled((os_log_t)qword_1001ABC58, OS_LOG_TYPE_ERROR))
    {
      sub_1000E7AB0(v19);
      if (!a5)
        goto LABEL_9;
    }
    else if (!a5)
    {
      goto LABEL_9;
    }
    *a5 = objc_retainAutorelease(v14);
    goto LABEL_9;
  }
  objc_msgSend(v7, "setState:", 1);
  v15 = (void *)qword_1001ABC58;
  if (os_log_type_enabled((os_log_t)qword_1001ABC58, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scheduler_activity"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "debugDescription"));
    *(_DWORD *)buf = 138543618;
    v23 = v18;
    v24 = 2048;
    v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Submitted %{public}@ (BGST %p)", buf, 0x16u);

  }
LABEL_9:

  return v13;
}

- (BOOL)dasSubmitActivity:(id)a3 error:(id *)a4
{
  return -[_DASBGSystemTaskHelper dasSubmitActivity:withClientOffset:error:](self, "dasSubmitActivity:withClientOffset:error:", a3, a4, 0.0);
}

- (void)dasCancelActivity:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dispatchSourceProcessExit"));

  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dispatchSourceProcessExit"));
    dispatch_source_cancel(v5);

    objc_msgSend(v3, "setDispatchSourceProcessExit:", 0);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scheduler_activity"));

  if (v6)
  {
    v7 = (void *)qword_1001ABC58;
    if (os_log_type_enabled((os_log_t)qword_1001ABC58, OS_LOG_TYPE_INFO))
    {
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scheduler_activity"));
      v12 = 138543618;
      v13 = v9;
      v14 = 2048;
      v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Canceling %{public}@ (BGST %p)", (uint8_t *)&v12, 0x16u);

    }
    v10 = (void *)qword_1001ABC70;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scheduler_activity"));
    objc_msgSend(v10, "activityCanceled:", v11);

    objc_msgSend(v3, "setScheduler_activity:", 0);
  }
  objc_msgSend(v3, "setSuspensionReason:", -1);

}

- (void)dasCompleteActivity:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dispatchSourceProcessExit"));

  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dispatchSourceProcessExit"));
    dispatch_source_cancel(v6);

    objc_msgSend(v4, "setDispatchSourceProcessExit:", 0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheduler_activity"));

  if (v7)
  {
    if (objc_msgSend(v4, "state") == (id)8 || !objc_msgSend(v4, "state"))
    {
      v12 = (void *)qword_1001ABC58;
      if (os_log_type_enabled((os_log_t)qword_1001ABC58, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v12;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
        v19 = 138543618;
        v20 = v14;
        v21 = 2048;
        v22 = v4;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Trying to complete DASActivity for \"%{public}@\" (BGST %p) but it is completed / not scheduled", (uint8_t *)&v19, 0x16u);

      }
    }
    else
    {
      v8 = objc_msgSend(v4, "state");
      v9 = (void *)qword_1001ABC58;
      if (v8 == (id)2)
      {
        if (os_log_type_enabled((os_log_t)qword_1001ABC58, OS_LOG_TYPE_DEFAULT))
        {
          v10 = v9;
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
          v19 = 138543618;
          v20 = v11;
          v21 = 2048;
          v22 = v4;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Trying to complete DASActivity for \"%{public}@\" (BGST %p) but it never started, likely forced. Canceling instead.", (uint8_t *)&v19, 0x16u);

        }
        -[_DASBGSystemTaskHelper dasCancelActivity:](self, "dasCancelActivity:", v4);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)qword_1001ABC58, OS_LOG_TYPE_INFO))
        {
          v15 = v9;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheduler_activity"));
          v19 = 138543618;
          v20 = v16;
          v21 = 2048;
          v22 = v4;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Completing %{public}@ (BGST %p)", (uint8_t *)&v19, 0x16u);

        }
        v17 = (void *)qword_1001ABC70;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheduler_activity"));
        objc_msgSend(v17, "activityCompleted:", v18);

        objc_msgSend(v4, "setScheduler_activity:", 0);
      }
    }
  }
  objc_msgSend(v4, "setState:", 8);
  objc_msgSend(v4, "setSuspensionReason:", -1);

}

- (void)runActivity:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  xpc_object_t v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;

  v4 = a3;
  v5 = (unint64_t)objc_msgSend(v4, "state");
  if (v5 <= 8)
  {
    if (((1 << v5) & 0x11D) != 0)
    {
      v6 = (void *)qword_1001ABC58;
      if (os_log_type_enabled((os_log_t)qword_1001ABC58, OS_LOG_TYPE_INFO))
      {
        v7 = v6;
        v15 = 138543618;
        v16 = v4;
        v17 = 2048;
        v18 = objc_msgSend(v4, "state");
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Invalid state to run task %{public}@: %ld, Cancelling", (uint8_t *)&v15, 0x16u);

      }
      -[_DASBGSystemTaskHelper dasCancelActivity:](self, "dasCancelActivity:", v4);
    }
    else if (((1 << v5) & 0xA2) != 0)
    {
      v8 = (void *)qword_1001ABC58;
      if (os_log_type_enabled((os_log_t)qword_1001ABC58, OS_LOG_TYPE_INFO))
      {
        v9 = v8;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
        v15 = 138543874;
        v16 = v10;
        v17 = 2048;
        v18 = objc_msgSend(v4, "state");
        v19 = 2048;
        v20 = 2;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@ state change %ld -> %ld", (uint8_t *)&v15, 0x20u);

      }
      v11 = qword_1001ABC58;
      if (os_log_type_enabled((os_log_t)qword_1001ABC58, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138543362;
        v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Initiating BGST: %{public}@", (uint8_t *)&v15, 0xCu);
      }
      objc_msgSend(v4, "setState:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v4, "markStarted:", v12);

      v13 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_BOOL(v13, "run", 1);
      if (xpc_event_publisher_fire(qword_1001ABC68, objc_msgSend(v4, "token"), v13))
      {
        v14 = (void *)qword_1001ABC58;
        if (os_log_type_enabled((os_log_t)qword_1001ABC58, OS_LOG_TYPE_ERROR))
          sub_1000E7B58(v14);
      }

    }
  }

}

- (void)suspendActivity:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  xpc_object_t v12;
  void *v13;
  int64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;

  v4 = a3;
  v5 = (unint64_t)objc_msgSend(v4, "state");
  if (v5 <= 8)
  {
    if (((1 << v5) & 0x1B7) != 0)
    {
      v6 = (void *)qword_1001ABC58;
      if (os_log_type_enabled((os_log_t)qword_1001ABC58, OS_LOG_TYPE_INFO))
      {
        v7 = v6;
        v19 = 138543618;
        v20 = v4;
        v21 = 2048;
        v22 = objc_msgSend(v4, "state");
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Invalid state to suspend task %{public}@: %ld, Cancelling", (uint8_t *)&v19, 0x16u);

      }
      -[_DASBGSystemTaskHelper dasCancelActivity:](self, "dasCancelActivity:", v4);
    }
    else if (v5 == 3)
    {
      v8 = (void *)qword_1001ABC58;
      if (os_log_type_enabled((os_log_t)qword_1001ABC58, OS_LOG_TYPE_INFO))
      {
        v9 = v8;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
        v19 = 138543874;
        v20 = v10;
        v21 = 2048;
        v22 = objc_msgSend(v4, "state");
        v23 = 2048;
        v24 = 4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@ state change %ld -> %ld", (uint8_t *)&v19, 0x20u);

      }
      v11 = qword_1001ABC58;
      if (os_log_type_enabled((os_log_t)qword_1001ABC58, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138543362;
        v20 = v4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Suspending BGST: %{public}@", (uint8_t *)&v19, 0xCu);
      }
      objc_msgSend(v4, "setState:", 4);
      v12 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_BOOL(v12, "run", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheduler_activity"));
      v14 = -[_DASBGSystemTaskHelper reasonForActivitySuspension:](self, "reasonForActivitySuspension:", v13);

      objc_msgSend(v4, "setSuspensionReason:", v14);
      v15 = (void *)qword_1001ABC58;
      if (os_log_type_enabled((os_log_t)qword_1001ABC58, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheduler_activity"));
        v19 = 138412546;
        v20 = v17;
        v21 = 2048;
        v22 = (id)v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Suspending %@ with reason: %lu", (uint8_t *)&v19, 0x16u);

      }
      if (v14)
        xpc_dictionary_set_int64(v12, "expirationReason", v14);
      if (xpc_event_publisher_fire(qword_1001ABC68, objc_msgSend(v4, "token"), v12))
      {
        v18 = (void *)qword_1001ABC58;
        if (os_log_type_enabled((os_log_t)qword_1001ABC58, OS_LOG_TYPE_ERROR))
          sub_1000E7BE0(v18);
      }

    }
  }

}

- (void)acknowledgeSystemTaskLaunchWithIdentifier:(id)a3 withPID:(int)a4 withUID:(unsigned int)a5 completionHandler:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD, uint64_t);
  NSObject *v12;
  id v13;
  _QWORD block[4];
  id v15;
  _DASBGSystemTaskHelper *v16;
  uint64_t *v17;
  uint64_t *v18;
  unsigned int v19;
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v10 = a3;
  v11 = (void (**)(id, _QWORD, uint64_t))a6;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_100094010;
  v25 = sub_100094020;
  v26 = 0;
  v12 = qword_1001ABC50;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100094028;
  block[3] = &unk_10015F568;
  v13 = v10;
  v17 = &v21;
  v18 = &v27;
  v19 = a5;
  v20 = a4;
  v15 = v13;
  v16 = self;
  dispatch_sync(v12, block);
  v11[2](v11, *((unsigned __int8 *)v28 + 24), v22[5]);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

}

- (void)acknowledgeSystemTaskSuspensionWithIdentifier:(id)a3 withPID:(int)a4 withUID:(unsigned int)a5 retryAfter:(double)a6 completionHandler:(id)a7
{
  id v12;
  void (**v13)(_QWORD);
  NSObject *v14;
  id v15;
  _QWORD block[4];
  id v17;
  _DASBGSystemTaskHelper *v18;
  _QWORD *v19;
  double v20;
  unsigned int v21;
  int v22;
  _QWORD v23[4];

  v12 = a3;
  v13 = (void (**)(_QWORD))a7;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  *(double *)&v23[3] = a6;
  v14 = qword_1001ABC50;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009478C;
  block[3] = &unk_10015F590;
  v15 = v12;
  v21 = a5;
  v22 = a4;
  v20 = a6;
  v18 = self;
  v19 = v23;
  v17 = v15;
  dispatch_sync(v14, block);
  v13[2](v13);

  _Block_object_dispose(v23, 8);
}

- (void)handleClientLedSystemTaskExpirationWithIdentifier:(id)a3 withPID:(int)a4 withUID:(unsigned int)a5 retryAfter:(double)a6 completionHandler:(id)a7
{
  id v12;
  void (**v13)(id, _QWORD);
  NSObject *v14;
  id v15;
  _QWORD block[4];
  id v17;
  _DASBGSystemTaskHelper *v18;
  uint64_t *v19;
  double v20;
  unsigned int v21;
  int v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v12 = a3;
  v13 = (void (**)(id, _QWORD))a7;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 1;
  v14 = qword_1001ABC50;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100094BB8;
  block[3] = &unk_10015F590;
  v15 = v12;
  v21 = a5;
  v22 = a4;
  v18 = self;
  v19 = &v23;
  v17 = v15;
  v20 = a6;
  dispatch_sync(v14, block);
  v13[2](v13, *((unsigned __int8 *)v24 + 24));

  _Block_object_dispose(&v23, 8);
}

- (void)submitTaskRequestWithIdentifier:(id)a3 descriptor:(id)a4 withPID:(int)a5 withUID:(unsigned int)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, _QWORD);
  NSObject *v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  _DASBGSystemTaskHelper *v21;
  uint64_t *v22;
  unsigned int v23;
  int v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v12 = a3;
  v13 = a4;
  v14 = (void (**)(id, _QWORD))a7;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  v15 = qword_1001ABC50;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100094F10;
  block[3] = &unk_10015F5E0;
  v16 = v12;
  v23 = a6;
  v24 = a5;
  v19 = v16;
  v22 = &v25;
  v17 = v13;
  v20 = v17;
  v21 = self;
  dispatch_sync(v15, block);
  v14[2](v14, *((unsigned __int8 *)v26 + 24));

  _Block_object_dispose(&v25, 8);
}

- (void)updateTaskRequestWithIdentifier:(id)a3 descriptor:(id)a4 withPID:(int)a5 withUID:(unsigned int)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, _QWORD);
  NSObject *v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  _DASBGSystemTaskHelper *v21;
  uint64_t *v22;
  unsigned int v23;
  int v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v12 = a3;
  v13 = a4;
  v14 = (void (**)(id, _QWORD))a7;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v15 = qword_1001ABC50;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009549C;
  block[3] = &unk_10015F608;
  v16 = v12;
  v19 = v16;
  v23 = a6;
  v24 = a5;
  v17 = v13;
  v20 = v17;
  v21 = self;
  v22 = &v25;
  dispatch_sync(v15, block);
  v14[2](v14, *((unsigned __int8 *)v26 + 24));

  _Block_object_dispose(&v25, 8);
}

- (void)completeSystemTaskWithIdentifier:(id)a3 withPID:(int)a4 withUID:(unsigned int)a5 completionHandler:(id)a6
{
  id v10;
  NSObject *v11;
  void (**v12)(_QWORD);
  id v13;
  _QWORD block[4];
  id v15;
  _DASBGSystemTaskHelper *v16;
  unsigned int v17;
  int v18;

  v10 = a3;
  v11 = qword_1001ABC50;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000958A0;
  block[3] = &unk_10015DB68;
  v17 = a5;
  v18 = a4;
  v15 = v10;
  v16 = self;
  v13 = v10;
  v12 = (void (**)(_QWORD))a6;
  dispatch_sync(v11, block);
  v12[2](v12);

}

- (void)resumeTaskSchedulingWithIdentifier:(id)a3 withPID:(int)a4 withUID:(unsigned int)a5 completionHandler:(id)a6
{
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _DASBGSystemTaskHelper *v15;
  uint64_t *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v9 = a3;
  v10 = (void (**)(id, _QWORD))a6;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v11 = qword_1001ABC50;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100095CE8;
  v13[3] = &unk_10015F630;
  v12 = v9;
  v17 = a5;
  v14 = v12;
  v15 = self;
  v16 = &v18;
  dispatch_sync(v11, v13);
  v10[2](v10, *((unsigned __int8 *)v19 + 24));

  _Block_object_dispose(&v18, 8);
}

- (void)unregisterSystemTaskWithIdentifier:(id)a3 withPID:(int)a4 withUID:(unsigned int)a5 completionHandler:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD);
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _DASBGSystemTaskHelper *v16;
  uint64_t *v17;
  unsigned int v18;
  int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v10 = a3;
  v11 = (void (**)(id, _QWORD))a6;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  v12 = qword_1001ABC50;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100095F30;
  v14[3] = &unk_10015F658;
  v13 = v10;
  v18 = a5;
  v19 = a4;
  v16 = self;
  v17 = &v20;
  v15 = v13;
  dispatch_sync(v12, v14);
  v11[2](v11, *((unsigned __int8 *)v21 + 24));

  _Block_object_dispose(&v20, 8);
}

- (void)resetFastPassActivities:(id)a3 resetAll:(BOOL)a4 withHandler:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD);
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v7 = a3;
  v8 = (void (**)(id, _QWORD))a5;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_100094010;
  v19 = sub_100094020;
  v20 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v9 = qword_1001ABC50;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100096230;
  block[3] = &unk_10015F680;
  v10 = v7;
  v14 = a4;
  v12 = v10;
  v13 = &v15;
  dispatch_sync(v9, block);
  v8[2](v8, v16[5]);

  _Block_object_dispose(&v15, 8);
}

- (void)inspect:(id)a3 withHandler:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_100094010;
  v16 = sub_100094020;
  v17 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = qword_1001ABC50;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000964B8;
  v9[3] = &unk_10015D8E0;
  v8 = v5;
  v10 = v8;
  v11 = &v12;
  dispatch_sync(v7, v9);
  v6[2](v6, v13[5]);

  _Block_object_dispose(&v12, 8);
}

- (void)resubmitRunningTasks:(id)a3 withPID:(int)a4 withUID:(unsigned int)a5
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  _QWORD *v12;
  unsigned int v13;
  int v14;
  _QWORD v15[5];
  id v16;

  v7 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = sub_100094010;
  v15[4] = sub_100094020;
  v16 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = qword_1001ABC50;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000966F4;
  block[3] = &unk_10015F6A8;
  v13 = a5;
  v14 = a4;
  v11 = v7;
  v12 = v15;
  v9 = v7;
  dispatch_sync(v8, block);

  _Block_object_dispose(v15, 8);
}

- (void)reportSystemTaskWithIdentifier:(id)a3 producedResults:(id)a4 withPID:(int)a5 withUID:(unsigned int)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  void (**v13)(id, _QWORD, uint64_t);
  NSObject *v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  unsigned int v22;
  int v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v11 = a3;
  v12 = a4;
  v13 = (void (**)(id, _QWORD, uint64_t))a7;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 1;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_100094010;
  v28 = sub_100094020;
  v29 = 0;
  v14 = qword_1001ABC50;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100096B64;
  block[3] = &unk_10015F568;
  v15 = v11;
  v22 = a6;
  v23 = a5;
  v18 = v15;
  v20 = &v24;
  v21 = &v30;
  v16 = v12;
  v19 = v16;
  dispatch_sync(v14, block);
  v13[2](v13, *((unsigned __int8 *)v31 + 24), v25[5]);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

}

- (void)reportSystemTaskWithIdentifier:(id)a3 consumedResults:(id)a4 withPID:(int)a5 withUID:(unsigned int)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  void (**v13)(id, _QWORD, uint64_t);
  NSObject *v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  unsigned int v22;
  int v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v11 = a3;
  v12 = a4;
  v13 = (void (**)(id, _QWORD, uint64_t))a7;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 1;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_100094010;
  v28 = sub_100094020;
  v29 = 0;
  v14 = qword_1001ABC50;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100096F08;
  block[3] = &unk_10015F568;
  v15 = v11;
  v22 = a6;
  v23 = a5;
  v18 = v15;
  v20 = &v24;
  v21 = &v30;
  v16 = v12;
  v19 = v16;
  dispatch_sync(v14, block);
  v13[2](v13, *((unsigned __int8 *)v31 + 24), v25[5]);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

}

- (void)resetResultsForIdentifier:(id)a3 byTaskWithIdentifier:(id)a4 withPID:(int)a5 withUID:(unsigned int)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  void (**v13)(id, _QWORD, uint64_t);
  NSObject *v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  unsigned int v22;
  int v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v11 = a3;
  v12 = a4;
  v13 = (void (**)(id, _QWORD, uint64_t))a7;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 1;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_100094010;
  v28 = sub_100094020;
  v29 = 0;
  v14 = qword_1001ABC50;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000972A4;
  block[3] = &unk_10015F568;
  v15 = v12;
  v22 = a6;
  v23 = a5;
  v18 = v15;
  v20 = &v24;
  v21 = &v30;
  v16 = v11;
  v19 = v16;
  dispatch_sync(v14, block);
  v13[2](v13, *((unsigned __int8 *)v31 + 24), v25[5]);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

}

- (void)recordTaskWorkloadProgress:(id)a3 target:(unint64_t)a4 completed:(unint64_t)a5 category:(unint64_t)a6 subCategory:(id)a7 withPID:(int)a8 withUID:(unsigned int)a9 completionHandler:(id)a10
{
  id v15;
  id v16;
  void (**v17)(id, _QWORD);
  NSObject *v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  _DASBGSystemTaskHelper *v24;
  uint64_t *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v15 = a3;
  v16 = a7;
  v17 = (void (**)(id, _QWORD))a10;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 1;
  v18 = qword_1001ABC50;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000975F0;
  block[3] = &unk_10015F6D0;
  v19 = v15;
  v22 = v19;
  v26 = a4;
  v27 = a5;
  v28 = a6;
  v20 = v16;
  v24 = self;
  v25 = &v29;
  v23 = v20;
  dispatch_sync(v18, block);
  v17[2](v17, *((unsigned __int8 *)v30 + 24));

  _Block_object_dispose(&v29, 8);
}

- (BOOL)sendToPPS:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](_DASPPSDataManager, "sharedInstance"));
  v5 = objc_msgSend(v4, "sendDataToPPS:subsystem:category:", v3, CFSTR("BackgroundProcessing"), CFSTR("TaskWorkload"));

  return v5;
}

- (void)registerTimeChangeNotification
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "significantTimeChangeHandler:", NSSystemTimeZoneDidChangeNotification, 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "significantTimeChangeHandler:", NSSystemClockDidChangeNotification, 0);

}

- (void)significantTimeChangeHandler:(id)a3
{
  void *v4;
  double v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  double v9;
  double v10;
  NSObject *v11;
  _BOOL4 v12;
  _QWORD v13[6];
  uint8_t buf[4];
  double v15;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTaskHelper bootupDate](self, "bootupDate", a3));
  objc_msgSend(v4, "timeIntervalSinceDate:", self->_currentBootupDate);
  if (v5 == 0.0)
  {
    v6 = qword_1001ABC58;
    if (os_log_type_enabled((os_log_t)qword_1001ABC58, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Time change: No clock shift observed";
      v8 = v6;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
    }
  }
  else
  {
    v9 = v5;
    v10 = fabs(v5);
    v11 = qword_1001ABC58;
    v12 = os_log_type_enabled((os_log_t)qword_1001ABC58, OS_LOG_TYPE_DEFAULT);
    if (v10 >= 30.0)
    {
      if (v12)
      {
        *(_DWORD *)buf = 134217984;
        v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Time change: Clock shifted by %lf secs", buf, 0xCu);
      }
      objc_storeStrong((id *)&self->_currentBootupDate, v4);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100097A10;
      v13[3] = &unk_10015DF50;
      *(double *)&v13[5] = v9;
      v13[4] = self;
      dispatch_async((dispatch_queue_t)qword_1001ABC50, v13);
    }
    else if (v12)
    {
      *(_WORD *)buf = 0;
      v7 = "Time change: Accumulated clock shift is less than 30 sec";
      v8 = v11;
      goto LABEL_7;
    }
  }

}

- (unint64_t)reasonForActivitySuspension:(id)a3
{
  unint64_t v3;

  v3 = (unint64_t)objc_msgSend(a3, "lastDenialValue");
  return (+[_DASPolicyManager bitmaskForPolicy:](_DASPolicyManager, "bitmaskForPolicy:", CFSTR("Limitations")) & v3) != 0;
}

- (double)uptimeSeconds
{
  timeval v3;
  size_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7[2];

  *(_QWORD *)v7 = 0x1500000001;
  v5 = 0;
  v6 = 0;
  v4 = 16;
  sysctl(v7, 2u, &v5, &v4, 0, 0);
  v3.tv_sec = 0;
  *(_QWORD *)&v3.tv_usec = 0;
  gettimeofday(&v3, 0);
  return ((double)(v3.tv_usec - (int)v6) + (double)(v3.tv_sec - v5) * 1000000.0) / 1000000.0;
}

- (id)bootupDate
{
  double v2;

  -[_DASBGSystemTaskHelper uptimeSeconds](self, "uptimeSeconds");
  return +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -v2);
}

- (NSDate)currentBootupDate
{
  return self->_currentBootupDate;
}

- (void)setCurrentBootupDate:(id)a3
{
  objc_storeStrong((id *)&self->_currentBootupDate, a3);
}

- (PPSTelemetryIdentifier)ppsID
{
  return self->_ppsID;
}

- (void)setPpsID:(PPSTelemetryIdentifier *)a3
{
  self->_ppsID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentBootupDate, 0);
}

@end
