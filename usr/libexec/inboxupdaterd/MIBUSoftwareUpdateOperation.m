@implementation MIBUSoftwareUpdateOperation

- (MIBUSoftwareUpdateOperation)initWithDelegate:(id)a3
{
  MIBUSoftwareUpdateOperation *v3;
  MIBUSoftwareUpdateOperation *v4;
  NSError *error;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MIBUSoftwareUpdateOperation;
  v3 = -[MIBUOperation initWithDelegate:](&v10, "initWithDelegate:", a3);
  v4 = v3;
  if (v3)
  {
    -[MIBUOperation setOpCode:](v3, "setOpCode:", 1);
    -[MIBUSoftwareUpdateOperation setState:](v4, "setState:", 0);
    -[MIBUSoftwareUpdateOperation setIdleTimeInterval:](v4, "setIdleTimeInterval:", 300.0);
    -[MIBUSoftwareUpdateOperation setInstallTimer:](v4, "setInstallTimer:", 0);
    -[MIBUSoftwareUpdateOperation setSuController:](v4, "setSuController:", 0);
    error = v4->_error;
    v4->_error = 0;

    -[MIBUSoftwareUpdateOperation setTargetBuildVersion:](v4, "setTargetBuildVersion:", 0);
    -[MIBUSoftwareUpdateOperation setTargetOSVersion:](v4, "setTargetOSVersion:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUDeviceController sharedInstance](MIBUDeviceController, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "buildVersion"));
    -[MIBUSoftwareUpdateOperation setCurrentBuildVersion:](v4, "setCurrentBuildVersion:", v7);

    -[MIBUSoftwareUpdateOperation setTargetSUBundleSize:](v4, "setTargetSUBundleSize:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSoftwareUpdateOperation _getStateTransitionTable](v4, "_getStateTransitionTable"));
    -[MIBUSoftwareUpdateOperation setStateTransitionTable:](v4, "setStateTransitionTable:", v8);

  }
  return v4;
}

- (void)_resume
{
  MIBUSUController *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSError *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSError *error;
  NSError *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  uint8_t buf[4];
  MIBUSoftwareUpdateOperation *v50;
  __int16 v51;
  void *v52;

  v3 = -[MIBUSUController initWithDelegate:]([MIBUSUController alloc], "initWithDelegate:", self);
  -[MIBUSoftwareUpdateOperation setSuController:](self, "setSuController:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUOperation delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nfcController"));
  objc_msgSend(v5, "addObserver:", self);

  if (-[MIBUOperation inProgress](self, "inProgress"))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100058568);
    v6 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("already in progress; resuming...")));
      *(_DWORD *)buf = 138543618;
      v50 = self;
      v51 = 2114;
      v52 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUDefaultPreferences objectForKey:](MIBUDefaultPreferences, "objectForKey:", CFSTR("PreviousOSVersion")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUDefaultPreferences objectForKey:](MIBUDefaultPreferences, "objectForKey:", CFSTR("TargetOSVersion")));
    -[MIBUSoftwareUpdateOperation setTargetBuildVersion:](self, "setTargetBuildVersion:", v10);

    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100058588);
    v11 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSoftwareUpdateOperation currentBuildVersion](self, "currentBuildVersion"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSoftwareUpdateOperation targetBuildVersion](self, "targetBuildVersion"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Current build version: %@; target version: %@")));
      *(_DWORD *)buf = 138543618;
      v50 = self;
      v51 = 2114;
      v52 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);

    }
    if (v9
      && (v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSoftwareUpdateOperation targetBuildVersion](self, "targetBuildVersion")),
          v14,
          v14))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSoftwareUpdateOperation currentBuildVersion](self, "currentBuildVersion"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSoftwareUpdateOperation targetBuildVersion](self, "targetBuildVersion"));
      v17 = objc_msgSend(v15, "isEqualToString:", v16);

      if (v17)
      {
        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_1000585A8);
        v18 = (void *)qword_100068950;
        if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
        {
          v19 = v18;
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSoftwareUpdateOperation currentBuildVersion](self, "currentBuildVersion"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("OS updated from %@ to %@, update successful"), v9, v20));
          *(_DWORD *)buf = 138543618;
          v50 = self;
          v51 = 2114;
          v52 = v21;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);

        }
        v22 = 0;
      }
      else
      {
        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_1000585C8);
        v36 = (void *)qword_100068950;
        if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
          sub_10003E304(self, v36);
        v48 = 0;
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSoftwareUpdateOperation currentBuildVersion](self, "currentBuildVersion"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSoftwareUpdateOperation targetBuildVersion](self, "targetBuildVersion"));
        sub_10000D680(&v48, 0x4000000, 0, CFSTR("Current os version %@ != %@, update failed"), v38, v39, v40, v41, (uint64_t)v37);
        v22 = (NSError *)v48;

      }
    }
    else
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_1000585E8);
      v28 = (void *)qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      {
        v29 = v28;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cancelling previously started operation...")));
        *(_DWORD *)buf = 138543618;
        v50 = self;
        v51 = 2114;
        v52 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);

      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSoftwareUpdateOperation suController](self, "suController"));
      objc_msgSend(v31, "forcePurge");

      v47 = 0;
      sub_10000D680(&v47, 67108870, 0, CFSTR("Software update operation cancelled"), v32, v33, v34, v35, (uint64_t)v44);
      v22 = (NSError *)v47;
    }

    v27 = 4;
  }
  else
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100058608);
    v23 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSoftwareUpdateOperation currentBuildVersion](self, "currentBuildVersion"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("starting operation from %@..."), v25));
      *(_DWORD *)buf = 138543618;
      v50 = self;
      v51 = 2114;
      v52 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);

    }
    v22 = 0;
    v27 = 1;
  }
  error = self->_error;
  self->_error = v22;
  v43 = v22;

  -[MIBUSoftwareUpdateOperation _transitionToState:error:](self, "_transitionToState:error:", v27, 0);
}

- (void)_terminateNow
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  MIBUSoftwareUpdateOperation *v10;
  __int16 v11;
  void *v12;

  if ((id)-[MIBUSoftwareUpdateOperation state](self, "state") == (id)4)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100058628);
    v3 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("already terminated")));
      v9 = 138543618;
      v10 = self;
      v11 = 2114;
      v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", (uint8_t *)&v9, 0x16u);

    }
  }
  else
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100058648);
    v6 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("terminating...")));
      v9 = 138543618;
      v10 = self;
      v11 = 2114;
      v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", (uint8_t *)&v9, 0x16u);

    }
    -[MIBUSoftwareUpdateOperation _transitionToState:error:](self, "_transitionToState:error:", 4, 0);
  }
}

- (id)details
{
  NSMutableDictionary *v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSoftwareUpdateOperation suController](self, "suController"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSoftwareUpdateOperation suController](self, "suController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "phase")));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v6, CFSTR("SoftwareUpdatePhase"));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSoftwareUpdateOperation targetOSVersion](self, "targetOSVersion"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSoftwareUpdateOperation targetOSVersion](self, "targetOSVersion"));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v8, CFSTR("TargetOSVersion"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSoftwareUpdateOperation targetBuildVersion](self, "targetBuildVersion"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSoftwareUpdateOperation targetBuildVersion](self, "targetBuildVersion"));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v10, CFSTR("TargetBuildVersion"));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSoftwareUpdateOperation suController](self, "suController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "progress"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSoftwareUpdateOperation suController](self, "suController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "progress"));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v14, CFSTR("Progress"));

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSoftwareUpdateOperation suController](self, "suController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "timeRemaining"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSoftwareUpdateOperation suController](self, "suController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "timeRemaining"));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v18, CFSTR("TimeRemaining"));

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSoftwareUpdateOperation targetSUBundleSize](self, "targetSUBundleSize"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSoftwareUpdateOperation targetSUBundleSize](self, "targetSUBundleSize"));
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v20, CFSTR("TargetSUBundleSize"));

  }
  return v3;
}

- (BOOL)isCommandAllowed:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_10005D178));
  if (objc_msgSend(v4, "intValue") == 8)
    v6 = (id)-[MIBUSoftwareUpdateOperation state](self, "state") == (id)2;
  else
    v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)scanDidFinishWithResults:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MIBUSoftwareUpdateOperation *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MIBUOperation syncQueue](self, "syncQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002C510;
  v7[3] = &unk_100056400;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)downloadDidFinishForUpdate:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = objc_claimAutoreleasedReturnValue(-[MIBUOperation syncQueue](self, "syncQueue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C640;
  block[3] = &unk_100055CF0;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)installDidStartForUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MIBUOperation syncQueue](self, "syncQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002C6E8;
  v7[3] = &unk_100056400;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)updateDidFinishWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MIBUOperation syncQueue](self, "syncQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002C998;
  v7[3] = &unk_100056400;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)didHandleCommand:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  MIBUSoftwareUpdateOperation *v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[MIBUOperation syncQueue](self, "syncQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002CC10;
  block[3] = &unk_1000586F0;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)handleInstallTimer:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = objc_claimAutoreleasedReturnValue(-[MIBUOperation syncQueue](self, "syncQueue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002CF10;
  block[3] = &unk_100055CF0;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_transitionToState:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  NSObject *v12;
  void *v13;
  dispatch_queue_global_t global_queue;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD block[4];
  id v30;
  id location;
  uint8_t buf[4];
  MIBUSoftwareUpdateOperation *v33;
  __int16 v34;
  void *v35;

  objc_initWeak(&location, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSoftwareUpdateOperation stateTransitionTable](self, "stateTransitionTable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MIBUSoftwareUpdateOperation state](self, "state")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v8));

  if (-[MIBUSoftwareUpdateOperation state](self, "state") == a3)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100058750);
    v24 = (id)qword_100068950;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("already in state %lu"), -[MIBUSoftwareUpdateOperation state](self, "state")));
      *(_DWORD *)buf = 138543618;
      v33 = self;
      v34 = 2114;
      v35 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);

    }
    goto LABEL_41;
  }
  if (!v9)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100058770);
    v24 = (id)qword_100068950;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unrecognized device state %lu; cannot transition to %lu"),
          -[MIBUSoftwareUpdateOperation state](self, "state"),
          a3));
      sub_10003E568();
    }
    goto LABEL_41;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v11 = objc_msgSend(v9, "containsObject:", v10);

  if ((v11 & 1) == 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100058790);
    v24 = (id)qword_100068950;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Not allowed to transition from state %lu to state %lu"), -[MIBUSoftwareUpdateOperation state](self, "state"), a3));
      sub_10003E568();
    }
LABEL_41:
    v19 = 0;
    goto LABEL_23;
  }
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_1000587B0);
  v12 = (id)qword_100068950;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("changing state from %lu to %lu"), -[MIBUSoftwareUpdateOperation state](self, "state"), a3));
    *(_DWORD *)buf = 138543618;
    v33 = self;
    v34 = 2114;
    v35 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);

  }
  switch(a3)
  {
    case 1uLL:
      -[MIBUOperation saveOpCode](self, "saveOpCode");
      global_queue = dispatch_get_global_queue(33, 0);
      v15 = objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10002DA54;
      block[3] = &unk_1000587D8;
      objc_copyWeak(&v30, &location);
      dispatch_async(v15, block);

      objc_destroyWeak(&v30);
      goto LABEL_12;
    case 2uLL:
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUOperation delegate](self, "delegate"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "nfcController"));
      v28 = 0;
      objc_msgSend(v21, "start:", &v28);
      v19 = v28;

      -[MIBUSoftwareUpdateOperation _startInstallTimer](self, "_startInstallTimer");
      goto LABEL_14;
    case 3uLL:
      -[MIBUSoftwareUpdateOperation _stopInstallTimer](self, "_stopInstallTimer");
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUOperation delegate](self, "delegate"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "nfcController"));
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10002DA98;
      v26[3] = &unk_100058800;
      objc_copyWeak(&v27, &location);
      objc_msgSend(v17, "terminateWithCompletion:", v26);

      objc_destroyWeak(&v27);
      goto LABEL_12;
    case 4uLL:
      -[MIBUSoftwareUpdateOperation _cleanup](self, "_cleanup");
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUOperation delegate](self, "delegate"));
      objc_msgSend(v18, "operationFinishedWithError:", self->_error);

LABEL_12:
      v19 = 0;
LABEL_14:
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100058820);
      v22 = (id)qword_100068950;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("state changed from %lu to %lu"), -[MIBUSoftwareUpdateOperation state](self, "state"), a3));
        *(_DWORD *)buf = 138543618;
        v33 = self;
        v34 = 2114;
        v35 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);

      }
      -[MIBUSoftwareUpdateOperation setState:](self, "setState:", a3);
      if (!v19)
        goto LABEL_24;
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100058840);
      v24 = (id)qword_100068950;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to transition to state: %ld; current device state is: %ld; error: %@"),
            a3,
            -[MIBUSoftwareUpdateOperation state](self, "state"),
            v19));
        sub_10003E568();
      }
      break;
    default:
      v19 = 0;
      if (a4)
        goto LABEL_25;
      goto LABEL_26;
  }
LABEL_23:

LABEL_24:
  if (a4)
LABEL_25:
    *a4 = objc_retainAutorelease(v19);
LABEL_26:

  objc_destroyWeak(&location);
}

- (id)_getStateTransitionTable
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[0] = &off_10005CA90;
  v3[1] = &off_10005CAA8;
  v4[0] = &off_10005D190;
  v4[1] = &off_10005D1A8;
  v3[2] = &off_10005CAD8;
  v3[3] = &off_10005CAF0;
  v4[2] = &off_10005D1C0;
  v4[3] = &off_10005D1D8;
  v3[4] = &off_10005CAC0;
  v4[4] = &__NSArray0__struct;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 5));
}

- (void)_startInstallTimer
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002DD5C;
  block[3] = &unk_100055CF0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_stopInstallTimer
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  MIBUSoftwareUpdateOperation *v9;
  __int16 v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSoftwareUpdateOperation installTimer](self, "installTimer"));

  if (v3)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100058880);
    v4 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Stopping Install Timer...")));
      v8 = 138543618;
      v9 = self;
      v10 = 2114;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", (uint8_t *)&v8, 0x16u);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSoftwareUpdateOperation installTimer](self, "installTimer"));
    objc_msgSend(v7, "invalidate");

    -[MIBUSoftwareUpdateOperation setInstallTimer:](self, "setInstallTimer:", 0);
  }
}

- (void)_cleanup
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  MIBUSoftwareUpdateOperation *v16;
  __int16 v17;
  void *v18;

  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_1000588A0);
  v3 = (void *)qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("removing default preference keys...")));
    v15 = 138543618;
    v16 = self;
    v17 = 2114;
    v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", (uint8_t *)&v15, 0x16u);

  }
  +[MIBUDefaultPreferences removeObjectForKey:](MIBUDefaultPreferences, "removeObjectForKey:", CFSTR("CurrentOperation"));
  +[MIBUDefaultPreferences removeObjectForKey:](MIBUDefaultPreferences, "removeObjectForKey:", CFSTR("PreviousOSVersion"));
  +[MIBUDefaultPreferences removeObjectForKey:](MIBUDefaultPreferences, "removeObjectForKey:", CFSTR("TargetOSVersion"));
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_1000588C0);
  v6 = (void *)qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("removing nfc observer...")));
    v15 = 138543618;
    v16 = self;
    v17 = 2114;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", (uint8_t *)&v15, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUOperation delegate](self, "delegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nfcController"));
  objc_msgSend(v10, "removeObserver:", self);

  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_1000588E0);
  v11 = (void *)qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("termination SU controller...")));
    v15 = 138543618;
    v16 = self;
    v17 = 2114;
    v18 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", (uint8_t *)&v15, 0x16u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSoftwareUpdateOperation suController](self, "suController"));
  objc_msgSend(v14, "terminate");

}

- (id)error
{
  return self->_error;
}

- (MIBUSUController)suController
{
  return self->_suController;
}

- (void)setSuController:(id)a3
{
  objc_storeStrong((id *)&self->_suController, a3);
}

- (PCPersistentTimer)installTimer
{
  return self->_installTimer;
}

- (void)setInstallTimer:(id)a3
{
  objc_storeStrong((id *)&self->_installTimer, a3);
}

- (double)idleTimeInterval
{
  return self->_idleTimeInterval;
}

- (void)setIdleTimeInterval:(double)a3
{
  self->_idleTimeInterval = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSString)targetBuildVersion
{
  return self->_targetBuildVersion;
}

- (void)setTargetBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_targetBuildVersion, a3);
}

- (NSString)targetOSVersion
{
  return self->_targetOSVersion;
}

- (void)setTargetOSVersion:(id)a3
{
  objc_storeStrong((id *)&self->_targetOSVersion, a3);
}

- (NSString)currentBuildVersion
{
  return self->_currentBuildVersion;
}

- (void)setCurrentBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_currentBuildVersion, a3);
}

- (NSNumber)targetSUBundleSize
{
  return self->_targetSUBundleSize;
}

- (void)setTargetSUBundleSize:(id)a3
{
  objc_storeStrong((id *)&self->_targetSUBundleSize, a3);
}

- (NSDictionary)stateTransitionTable
{
  return self->_stateTransitionTable;
}

- (void)setStateTransitionTable:(id)a3
{
  objc_storeStrong((id *)&self->_stateTransitionTable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateTransitionTable, 0);
  objc_storeStrong((id *)&self->_targetSUBundleSize, 0);
  objc_storeStrong((id *)&self->_currentBuildVersion, 0);
  objc_storeStrong((id *)&self->_targetOSVersion, 0);
  objc_storeStrong((id *)&self->_targetBuildVersion, 0);
  objc_storeStrong((id *)&self->_installTimer, 0);
  objc_storeStrong((id *)&self->_suController, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
