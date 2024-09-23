@implementation MIBUHCESession

- (MIBUHCESession)initWithDelegate:(id)a3
{
  id v4;
  MIBUHCESession *v5;
  MIBUHCESession *v6;
  NSCondition *v7;
  NSMutableData *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MIBUHCESession;
  v5 = -[MIBUHCESession init](&v14, "init");
  v6 = v5;
  if (v5)
  {
    -[MIBUHCESession setDelegate:](v5, "setDelegate:", v4);
    -[MIBUHCESession setSession:](v6, "setSession:", 0);
    v7 = objc_opt_new(NSCondition);
    -[MIBUHCESession setSessionLock:](v6, "setSessionLock:", v7);

    -[MIBUHCESession setSessionState:](v6, "setSessionState:", 0);
    v8 = objc_opt_new(NSMutableData);
    -[MIBUHCESession setPendingAPDU:](v6, "setPendingAPDU:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NFHardwareManager sharedHardwareManagerWithNoUI](NFHardwareManager, "sharedHardwareManagerWithNoUI"));
    -[MIBUHCESession setManager:](v6, "setManager:", v9);

    v10 = objc_alloc_init((Class)NSOperationQueue);
    -[MIBUHCESession setQueue:](v6, "setQueue:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession queue](v6, "queue"));
    objc_msgSend(v11, "setMaxConcurrentOperationCount:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession queue](v6, "queue"));
    objc_msgSend(v12, "setName:", CFSTR("com.apple.mobileinboxupdate.session_queue"));

  }
  return v6;
}

- (void)startHCESessionWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  unint64_t v10;

  v4 = (void (**)(id, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession sessionLock](self, "sessionLock"));
  objc_msgSend(v5, "lock");

  if (-[MIBUHCESession sessionState](self, "sessionState"))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100054970);
    v6 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v9 = 134217984;
      v10 = -[MIBUHCESession sessionState](self, "sessionState");
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "HCE Session state: %ld, session already active", (uint8_t *)&v9, 0xCu);

    }
    if (v4)
      v4[2](v4, 0);
  }
  else
  {
    -[MIBUHCESession _startHCESessionWithCompletion:](self, "_startHCESessionWithCompletion:", v4);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession sessionLock](self, "sessionLock"));
  objc_msgSend(v8, "unlock");

}

- (void)endHCESession:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  unint64_t v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession sessionLock](self, "sessionLock"));
  objc_msgSend(v5, "lock");

  if (-[MIBUHCESession sessionState](self, "sessionState"))
  {
    v10 = 0;
    -[MIBUHCESession _endHCESession:expected:](self, "_endHCESession:expected:", &v10, 1);
    v6 = v10;
    if (a3)
LABEL_3:
      *a3 = objc_retainAutorelease(v6);
  }
  else
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100054990);
    v8 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      *(_DWORD *)buf = 134217984;
      v12 = -[MIBUHCESession sessionState](self, "sessionState");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "HCE Session state: %ld, session already ended", buf, 0xCu);

    }
    v6 = 0;
    if (a3)
      goto LABEL_3;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession sessionLock](self, "sessionLock"));
  objc_msgSend(v7, "unlock");

}

- (void)startListening:(id *)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  MIBUHCESession *v23;
  id v24;
  id v25;
  id location;
  uint8_t buf[4];
  unint64_t v28;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession sessionLock](self, "sessionLock"));
  objc_msgSend(v5, "lock");

  objc_initWeak(&location, self);
  if ((id)-[MIBUHCESession sessionState](self, "sessionState") == (id)2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession queue](self, "queue"));
    v7 = objc_msgSend(v6, "operationCount") == 0;

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession queue](self, "queue"));
      v19 = _NSConcreteStackBlock;
      v20 = 3221225472;
      v21 = sub_100002DC0;
      v22 = &unk_100054A18;
      v23 = self;
      objc_copyWeak(&v24, &location);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v19));
      objc_msgSend(v8, "addOperation:", v9, v19, v20, v21, v22, v23);

      objc_destroyWeak(&v24);
    }
    else
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_1000549D0);
      v18 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "HCE Session already listening", buf, 2u);
      }
    }
    v10 = 0;
    if (a3)
LABEL_5:
      *a3 = objc_retainAutorelease(v10);
  }
  else
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000549B0);
    v12 = (id)qword_100068950;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = -[MIBUHCESession sessionState](self, "sessionState");
      *(_DWORD *)buf = 134217984;
      v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "HCE Session state: %ld, session cannot start listening", buf, 0xCu);
    }

    v25 = 0;
    sub_10000D680(&v25, 83886080, 0, CFSTR("Cannot start listening for NFC commands"), v14, v15, v16, v17, (uint64_t)v19);
    v10 = v25;
    if (a3)
      goto LABEL_5;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession sessionLock](self, "sessionLock"));
  objc_msgSend(v11, "unlock");

  objc_destroyWeak(&location);
}

- (void)stopListening
{
  void *v3;
  unint64_t v4;
  unsigned __int8 v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession sessionLock](self, "sessionLock"));
  objc_msgSend(v3, "lock");

  v4 = -[MIBUHCESession sessionState](self, "sessionState");
  v5 = -[MIBUHCESession suppressLogging](self, "suppressLogging");
  if (v4 < 2)
  {
    if ((v5 & 1) == 0)
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100054A58);
      v7 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Session is already terminated or cancelling, do nothing", v9, 2u);
      }
    }
  }
  else
  {
    if ((v5 & 1) == 0)
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100054A38);
      v6 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Signaling session thread to stop...", buf, 2u);
      }
    }
    -[MIBUHCESession _changeSessionState:](self, "_changeSessionState:", 1);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession sessionLock](self, "sessionLock"));
  objc_msgSend(v8, "unlock");

}

- (BOOL)running
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession sessionLock](self, "sessionLock"));
  objc_msgSend(v3, "lock");

  LOBYTE(v3) = -[MIBUHCESession sessionState](self, "sessionState") != 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession sessionLock](self, "sessionLock"));
  objc_msgSend(v4, "unlock");

  return (char)v3;
}

- (void)waitForTermination:(id *)a3
{
  void *v4;
  __int128 v5;
  void *v6;
  NSObject *v7;
  unint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  __int128 v12;
  uint8_t buf[4];
  unint64_t v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession sessionLock](self, "sessionLock", a3));
  objc_msgSend(v4, "lock");

  if (-[MIBUHCESession sessionState](self, "sessionState"))
  {
    *(_QWORD *)&v5 = 134217984;
    v12 = v5;
    do
    {
      if (!-[MIBUHCESession suppressLogging](self, "suppressLogging", v12))
      {
        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_100054A78);
        v6 = (void *)qword_100068950;
        if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
        {
          v7 = v6;
          v8 = -[MIBUHCESession sessionState](self, "sessionState");
          *(_DWORD *)buf = v12;
          v14 = v8;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Current session state is %ld; waiting for session to terminate...",
            buf,
            0xCu);

        }
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession sessionLock](self, "sessionLock"));
      objc_msgSend(v9, "wait");

    }
    while (-[MIBUHCESession sessionState](self, "sessionState"));
  }
  if (!-[MIBUHCESession suppressLogging](self, "suppressLogging"))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100054A98);
    v10 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "HCE session termination wait successful", buf, 2u);
    }
  }
  -[MIBUHCESession setSession:](self, "setSession:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession sessionLock](self, "sessionLock"));
  objc_msgSend(v11, "unlock");

}

- (void)hceSessionDidEndUnexpectedly:(id)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession sessionLock](self, "sessionLock", a3));
  objc_msgSend(v4, "lock");

  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100054AB8);
  v5 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
    sub_10003A590(v5, v6, v7, v8, v9, v10, v11, v12);
  -[MIBUHCESession _changeSessionState:](self, "_changeSessionState:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession delegate](self, "delegate"));
  v14 = objc_opt_respondsToSelector(v13, "sessionDidEndUnexpectedly:");

  if ((v14 & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession delegate](self, "delegate"));
    objc_msgSend(v15, "sessionDidEndUnexpectedly:", self);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession sessionLock](self, "sessionLock"));
  objc_msgSend(v16, "unlock");

}

- (void)hceSessionDidConnect:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession sessionLock](self, "sessionLock", a3));
  objc_msgSend(v4, "lock");

  if (-[MIBUHCESession sessionState](self, "sessionState") >= 2)
  {
    if (!-[MIBUHCESession suppressLogging](self, "suppressLogging"))
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100054AD8);
      v5 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "HCE session connected!", v10, 2u);
      }
    }
    -[MIBUHCESession _changeSessionState:](self, "_changeSessionState:", 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession delegate](self, "delegate"));
    v7 = objc_opt_respondsToSelector(v6, "sessionDidConnect:");

    if ((v7 & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession delegate](self, "delegate"));
      objc_msgSend(v8, "sessionDidConnect:", self);

    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession sessionLock](self, "sessionLock"));
  objc_msgSend(v9, "unlock");

}

- (void)hceSessionDidDisconnect:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession sessionLock](self, "sessionLock", a3));
  objc_msgSend(v4, "lock");

  if (-[MIBUHCESession sessionState](self, "sessionState") >= 2)
  {
    if (!-[MIBUHCESession suppressLogging](self, "suppressLogging"))
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100054AF8);
      v5 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "HCE session disconnected", v10, 2u);
      }
    }
    -[MIBUHCESession _changeSessionState:](self, "_changeSessionState:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession delegate](self, "delegate"));
    v7 = objc_opt_respondsToSelector(v6, "sessionDidDisconnect:");

    if ((v7 & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession delegate](self, "delegate"));
      objc_msgSend(v8, "sessionDidDisconnect:", self);

    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession sessionLock](self, "sessionLock"));
  objc_msgSend(v9, "unlock");

}

- (void)_hceSessionDidStart:(id)a3 error:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession sessionLock](self, "sessionLock"));
  objc_msgSend(v6, "lock");

  if (!v5)
  {
    if (!-[MIBUHCESession suppressLogging](self, "suppressLogging"))
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100054B18);
      v7 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "HCE Session started!", v12, 2u);
      }
    }
    -[MIBUHCESession _changeSessionState:](self, "_changeSessionState:", 2);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession delegate](self, "delegate"));
  v9 = objc_opt_respondsToSelector(v8, "sessionDidStart:withError:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession delegate](self, "delegate"));
    objc_msgSend(v10, "sessionDidStart:withError:", self, v5);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession sessionLock](self, "sessionLock"));
  objc_msgSend(v11, "unlock");

}

- (void)_hceSessionDidEnd:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession sessionLock](self, "sessionLock", a3));
  objc_msgSend(v4, "lock");

  -[MIBUHCESession _changeSessionState:](self, "_changeSessionState:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "sessionDidEnd:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession delegate](self, "delegate"));
    objc_msgSend(v7, "sessionDidEnd:", self);

  }
  v8 = (id)objc_claimAutoreleasedReturnValue(-[MIBUHCESession sessionLock](self, "sessionLock"));
  objc_msgSend(v8, "unlock");

}

- (void)_changeSessionState:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  unint64_t v9;
  __int16 v10;
  unint64_t v11;

  if (!-[MIBUHCESession suppressLogging](self, "suppressLogging"))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100054B38);
    v5 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      v8 = 134218240;
      v9 = -[MIBUHCESession sessionState](self, "sessionState");
      v10 = 2048;
      v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Changing HCE session state from: %ld to: %ld", (uint8_t *)&v8, 0x16u);

    }
  }
  -[MIBUHCESession setSessionState:](self, "setSessionState:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession sessionLock](self, "sessionLock"));
  objc_msgSend(v7, "signal");

}

- (void)_startHCESessionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id *v18;
  uint64_t v19[5];
  id v20;
  uint64_t *v21;
  id v22;
  uint8_t buf[16];
  id obj;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_100003EFC;
  v29 = sub_100003F0C;
  v30 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession manager](self, "manager"));
  v6 = objc_msgSend(v5, "getHwSupport");

  if (v6 == 2)
  {
    if (!-[MIBUHCESession suppressLogging](self, "suppressLogging"))
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100054B78);
      v7 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting HCE Session ...", buf, 2u);
      }
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NFHardwareManager sharedHardwareManagerWithNoUI](NFHardwareManager, "sharedHardwareManagerWithNoUI"));
    v19[0] = (uint64_t)_NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = (uint64_t)sub_100003FDC;
    v19[3] = (uint64_t)&unk_100054C20;
    objc_copyWeak(&v22, &location);
    v21 = &v25;
    v19[4] = (uint64_t)self;
    v20 = v4;
    v9 = objc_msgSend(v8, "startHCESession:", v19);

    objc_destroyWeak(&v22);
  }
  else
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100054B58);
    v10 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003A5C0(v10, v11, v12, v13, v14, v15, v16, v17);
    v18 = (id *)(v26 + 5);
    obj = (id)v26[5];
    sub_10000D680(&obj, 83886085, 0, CFSTR("Device does not support NearField"), v14, v15, v16, v17, v19[0]);
    objc_storeStrong(v18, obj);
    if (v4)
      (*((void (**)(id, uint64_t))v4 + 2))(v4, v26[5]);
  }
  _Block_object_dispose(&v25, 8);

  objc_destroyWeak(&location);
}

- (BOOL)_endHCESession:(id *)a3 expected:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v13[5];
  BOOL v14;
  uint8_t buf[4];
  _BOOL4 v16;

  v4 = a4;
  if (!-[MIBUHCESession suppressLogging](self, "suppressLogging"))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100054C40);
    v7 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Stopping Emulation...", buf, 2u);
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession session](self, "session"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stopEmulation"));

  if (!-[MIBUHCESession suppressLogging](self, "suppressLogging"))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100054C60);
    v10 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Ending HCE Session; expected=%d...", buf, 8u);
    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession session](self, "session"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000478C;
  v13[3] = &unk_100054C88;
  v14 = v4;
  v13[4] = self;
  objc_msgSend(v11, "endSessionWithCompletion:", v13);

  if (a3)
    *a3 = objc_retainAutorelease(v9);

  return v9 == 0;
}

- (void)_listenToCommand
{
  dispatch_time_t v3;
  id v4;
  void *v5;
  unint64_t v6;
  _BOOL8 v7;
  NSObject *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  id *v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  dispatch_semaphore_t v31;
  id obj;
  _QWORD v33[4];
  NSObject *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint8_t v46[4];
  uint64_t v47;
  uint8_t buf[4];
  id v49;

  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = sub_100003EFC;
  v44 = sub_100003F0C;
  v45 = 0;
  v37 = 0;
  v38[0] = &v37;
  v38[1] = 0x3032000000;
  v38[2] = sub_100003EFC;
  v38[3] = sub_100003F0C;
  v39 = 0;
  v31 = dispatch_semaphore_create(0);
  v3 = dispatch_time(0, 55000000000);
  v4 = 0;
  while (1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession sessionLock](self, "sessionLock"));
    objc_msgSend(v5, "lock");
    while (1)
    {

      v6 = -[MIBUHCESession sessionState](self, "sessionState");
      v7 = v6 != 2;
      if (v6 != 2)
        break;
      if (!-[MIBUHCESession suppressLogging](self, "suppressLogging"))
      {
        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_100054CA8);
        v8 = qword_100068950;
        if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Waiting to connect to reader ...", buf, 2u);
        }
      }
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 55.0));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession sessionLock](self, "sessionLock"));
      v10 = objc_msgSend(v9, "waitUntilDate:", v5);

      if ((v10 & 1) == 0)
      {
        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_100054CC8);
        v22 = qword_100068950;
        if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v49) = 55;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Wait reader connection timed out after %ds", buf, 8u);
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession sessionLock](self, "sessionLock"));
        objc_msgSend(v23, "unlock");

        goto LABEL_53;
      }
      v3 = dispatch_time(0, 55000000000);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession sessionLock](self, "sessionLock"));
    objc_msgSend(v11, "unlock");

    if (-[MIBUHCESession sessionState](self, "sessionState") <= 1)
    {
      if (!-[MIBUHCESession suppressLogging](self, "suppressLogging"))
      {
        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_100054CE8);
        v29 = qword_100068950;
        if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "HCE Listening Thread: quit listening loop...", buf, 2u);
        }
      }
LABEL_53:
      if (v4)
      {
        if (!-[MIBUHCESession suppressLogging](self, "suppressLogging"))
        {
          if (qword_100068958 != -1)
            dispatch_once(&qword_100068958, &stru_100054E10);
          v24 = qword_100068950;
          if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v49) = 3;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Waiting %ds before stopping HCE listening thread...", buf, 8u);
          }
        }
        sleep(3u);
      }
      goto LABEL_60;
    }

    if (!-[MIBUHCESession suppressLogging](self, "suppressLogging"))
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100054D08);
      v12 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Reading APDU from reader...", buf, 2u);
      }
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession session](self, "session"));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100005284;
    v33[3] = &unk_100054D30;
    v35 = &v40;
    v36 = &v37;
    v14 = v31;
    v34 = v14;
    objc_msgSend(v13, "readAPDUWithCompletion:", v33);

    if (dispatch_semaphore_wait(v14, v3))
      break;
    if (*(_QWORD *)(v38[0] + 40))
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100054D70);
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
        sub_10003A7B0();
      v4 = 0;
    }
    else
    {
      if (!-[MIBUHCESession suppressLogging](self, "suppressLogging"))
      {
        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_100054D90);
        v15 = qword_100068950;
        if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
        {
          v16 = (void *)v41[5];
          *(_DWORD *)buf = 138543362;
          v49 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Got APDU: %{public}@", buf, 0xCu);
        }
      }
      v4 = (id)objc_claimAutoreleasedReturnValue(-[MIBUHCESession _handleAPDU:](self, "_handleAPDU:", v41[5]));
      if (!v4)
      {
        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_100054DB0);
        v17 = qword_100068950;
        if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
          sub_10003A774(v46, &v47, v17);
        v4 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_10004CB62, 2);
      }
      if (!-[MIBUHCESession suppressLogging](self, "suppressLogging"))
      {
        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_100054DD0);
        v18 = qword_100068950;
        if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v49 = v4;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Sending APDU response: %@", buf, 0xCu);
        }
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession session](self, "session"));
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sendAPDU:", v4));
      v21 = *(void **)(v38[0] + 40);
      *(_QWORD *)(v38[0] + 40) = v20;

      if (*(_QWORD *)(v38[0] + 40))
      {
        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_100054DF0);
        if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
          sub_10003A738();
      }
    }

    if (-[MIBUHCESession sessionState](self, "sessionState") <= 1)
      goto LABEL_53;
  }
  if (!-[MIBUHCESession suppressLogging](self, "suppressLogging"))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100054D50);
    v30 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v49) = 55;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Reading APDU timed out after %ds", buf, 8u);
    }
  }

  v4 = 0;
  v7 = 0;
LABEL_60:
  if (-[MIBUHCESession sessionState](self, "sessionState"))
  {
    if (!-[MIBUHCESession suppressLogging](self, "suppressLogging"))
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100054E30);
      v25 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "HCE Listening Thread: ending HCE session...", buf, 2u);
      }
    }
    v26 = (id *)(v38[0] + 40);
    obj = *(id *)(v38[0] + 40);
    -[MIBUHCESession _endHCESession:expected:](self, "_endHCESession:expected:", &obj, v7);
    objc_storeStrong(v26, obj);
    if (*(_QWORD *)(v38[0] + 40))
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100054E50);
      v27 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
        sub_10003A6C8((uint64_t)v38, v27, v28);
    }
  }

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v40, 8);

}

- (id)_handleAPDU:(id)a3
{
  id v4;
  NSMutableData *v5;
  MIBUNFCCommand *v6;
  MIBUNFCCommand *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSMutableData *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSMutableData *v25;
  uint64_t v26;
  id v27;
  void *v28;
  int v30;
  id v31;

  v4 = a3;
  v5 = objc_opt_new(NSMutableData);
  v6 = -[MIBUNFCCommand initWithAPDU:]([MIBUNFCCommand alloc], "initWithAPDU:", v4);
  v7 = v6;
  if (v6)
  {
    if (-[MIBUNFCCommand code](v6, "code"))
    {
      if ((id)-[MIBUNFCCommand code](v7, "code") == (id)5)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCCommand payload](v7, "payload"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("EvelopedAPDU")));

        if (v9 && objc_msgSend(v9, "length"))
        {
          if (!-[MIBUHCESession suppressLogging](self, "suppressLogging"))
          {
            if (qword_100068958 != -1)
              dispatch_once(&qword_100068958, &stru_100054EB0);
            v10 = qword_100068950;
            if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
            {
              v30 = 138543362;
              v31 = v9;
              _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Saving enveloped data: %{public}@ to pending apdu", (uint8_t *)&v30, 0xCu);
            }
          }
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession pendingAPDU](self, "pendingAPDU"));
          objc_msgSend(v11, "appendData:", v9);

          v12 = (NSMutableData *)objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_10004CB60, 2);
        }
        else
        {
          if (!-[MIBUHCESession suppressLogging](self, "suppressLogging"))
          {
            if (qword_100068958 != -1)
              dispatch_once(&qword_100068958, &stru_100054ED0);
            v21 = (void *)qword_100068950;
            if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
            {
              v22 = v21;
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession pendingAPDU](self, "pendingAPDU"));
              v30 = 138543362;
              v31 = v23;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "ENVELOPE command chain ends; processing pending APDU: %{public}@",
                (uint8_t *)&v30,
                0xCu);

            }
          }
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession pendingAPDU](self, "pendingAPDU"));
          v12 = (NSMutableData *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession _handleAPDU:](self, "_handleAPDU:", v24));

          v25 = objc_opt_new(NSMutableData);
          -[MIBUHCESession setPendingAPDU:](self, "setPendingAPDU:", v25);

        }
        goto LABEL_37;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUHCESession delegate](self, "delegate"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "handleCommand:", v7));

      if (objc_msgSend(v17, "rejected"))
      {
        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_100054EF0);
        v18 = (void *)qword_100068950;
        if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
          sub_10003A850(v18);
        v19 = objc_alloc((Class)NSData);
        v20 = &unk_10004CB64;
      }
      else
      {
        v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "serialize"));
        if (v26)
        {
          v9 = (void *)v26;
          -[NSMutableData appendData:](v5, "appendData:", v26);
          v27 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_10004CB60, 2);
          -[NSMutableData appendData:](v5, "appendData:", v27);

          v12 = v5;
LABEL_37:

          goto LABEL_44;
        }
        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_100054F10);
        v28 = (void *)qword_100068950;
        if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
          sub_10003A8CC(v28);
        v19 = objc_alloc((Class)NSData);
        v20 = &unk_10004CB62;
      }
      v12 = (NSMutableData *)objc_msgSend(v19, "initWithBytes:length:", v20, 2);

      goto LABEL_44;
    }
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100054E90);
    v15 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 138543362;
      v31 = v4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Unsupported APDU command: %{public}@", (uint8_t *)&v30, 0xCu);
    }
    v13 = objc_alloc((Class)NSData);
    v14 = &unk_10004CB64;
  }
  else
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100054E70);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003A7EC();
    v13 = objc_alloc((Class)NSData);
    v14 = &unk_10004CB66;
  }
  v12 = (NSMutableData *)objc_msgSend(v13, "initWithBytes:length:", v14, 2);
LABEL_44:

  return v12;
}

- (BOOL)suppressLogging
{
  return self->_suppressLogging;
}

- (void)setSuppressLogging:(BOOL)a3
{
  self->_suppressLogging = a3;
}

- (NFHCESession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (unint64_t)sessionState
{
  return self->_sessionState;
}

- (void)setSessionState:(unint64_t)a3
{
  self->_sessionState = a3;
}

- (NSCondition)sessionLock
{
  return self->_sessionLock;
}

- (void)setSessionLock:(id)a3
{
  objc_storeStrong((id *)&self->_sessionLock, a3);
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NFHardwareManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (MIBUHCESessionDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (NSMutableData)pendingAPDU
{
  return self->_pendingAPDU;
}

- (void)setPendingAPDU:(id)a3
{
  objc_storeStrong((id *)&self->_pendingAPDU, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingAPDU, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sessionLock, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
