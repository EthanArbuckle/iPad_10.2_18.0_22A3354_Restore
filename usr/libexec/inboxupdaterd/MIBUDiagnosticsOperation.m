@implementation MIBUDiagnosticsOperation

- (MIBUDiagnosticsOperation)initWithDelegate:(id)a3
{
  MIBUDiagnosticsOperation *v3;
  MIBUDiagnosticsOperation *v4;
  NSError *error;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MIBUDiagnosticsOperation;
  v3 = -[MIBUOperation initWithDelegate:](&v7, "initWithDelegate:", a3);
  v4 = v3;
  if (v3)
  {
    -[MIBUOperation setOpCode:](v3, "setOpCode:", 2);
    -[MIBUDiagnosticsOperation setDiagController:](v4, "setDiagController:", 0);
    error = v4->_error;
    v4->_error = 0;

  }
  return v4;
}

- (void)_resume
{
  MIBUDiagnosticsController *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  dispatch_queue_global_t global_queue;
  _QWORD block[5];
  uint8_t buf[4];
  MIBUDiagnosticsOperation *v13;
  __int16 v14;
  void *v15;

  v3 = -[MIBUDiagnosticsController initWithDelegate:]([MIBUDiagnosticsController alloc], "initWithDelegate:", self);
  -[MIBUDiagnosticsOperation setDiagController:](self, "setDiagController:", v3);

  if (!-[MIBUOperation inProgress](self, "inProgress"))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000563B8);
    v7 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Starting Diagnostics operation")));
      *(_DWORD *)buf = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);

    }
    -[MIBUOperation saveOpCode](self, "saveOpCode");
    global_queue = dispatch_get_global_queue(33, 0);
    v5 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000158C8;
    block[3] = &unk_100055CF0;
    block[4] = self;
    dispatch_async(v5, block);
    goto LABEL_11;
  }
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100056398);
  v4 = (void *)qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Diagnostics operation already in progress; resuming...")));
    *(_DWORD *)buf = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);

LABEL_11:
  }
}

- (BOOL)isCommandAllowed:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_10005CFE0));
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (void)appDidLaunchWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  MIBUDiagnosticsOperation *v12;
  __int16 v13;
  void *v14;

  v4 = a3;
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[MIBUOperation syncQueue](self, "syncQueue"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100015AE0;
    v9[3] = &unk_100056400;
    v9[4] = self;
    v10 = v4;
    dispatch_async(v5, v9);

  }
  else
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056420);
    v6 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Diagnostic app successfully launched!")));
      *(_DWORD *)buf = 138543618;
      v12 = self;
      v13 = 2114;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);

    }
  }

}

- (void)appDidExitWithError:(id)a3
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
  v7[2] = sub_100015D90;
  v7[3] = &unk_100056400;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

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
  unsigned __int8 v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  MIBUDiagnosticsOperation *v17;
  __int16 v18;
  void *v19;

  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100056460);
  v3 = (void *)qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("removing default preference keys...")));
    *(_DWORD *)buf = 138543618;
    v17 = self;
    v18 = 2114;
    v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);

  }
  +[MIBUDefaultPreferences removeObjectForKey:](MIBUDefaultPreferences, "removeObjectForKey:", CFSTR("CurrentOperation"));
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100056480);
  v6 = (void *)qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Terminating diag controller...")));
    *(_DWORD *)buf = 138543618;
    v17 = self;
    v18 = 2114;
    v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDiagnosticsOperation diagController](self, "diagController"));
  v15 = 0;
  v10 = objc_msgSend(v9, "terminate:", &v15);
  v11 = v15;

  if ((v10 & 1) == 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000564A0);
    v12 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to terminate Diagnostics App. err: %@"), v11));
      *(_DWORD *)buf = 138543618;
      v17 = self;
      v18 = 2114;
      v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);

    }
  }

}

- (void)_operationDone
{
  id v3;

  -[MIBUDiagnosticsOperation _cleanup](self, "_cleanup");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[MIBUOperation delegate](self, "delegate"));
  objc_msgSend(v3, "operationFinishedWithError:", self->_error);

}

- (id)error
{
  return self->_error;
}

- (MIBUDiagnosticsController)diagController
{
  return self->_diagController;
}

- (void)setDiagController:(id)a3
{
  objc_storeStrong((id *)&self->_diagController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagController, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
