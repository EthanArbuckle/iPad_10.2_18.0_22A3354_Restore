@implementation CLIndoorMaintenance

- (id)remoteObjectProtocol
{
  return &OBJC_PROTOCOL___CLIndoorMaintenanceProtocol;
}

- (id)endpointName
{
  return CFSTR("com.apple.pipelined.maintenance");
}

- (id)withinQueuePermanentShutdownReason
{
  return 0;
}

- (BOOL)withinQueueCanReinitializeRemoteState
{
  return 0;
}

- (void)withinQueueReinitializeRemoteState
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, CFSTR("Cannot re-initialize remote state"), 0));
  objc_exception_throw(v2);
}

- (void)retrieveLocationRelevancyDurationWithCompletionHandler:(id)a3
{
  NSObject *frameworkQueue;
  CLIndoorMaintenance *v5;
  id v6;
  CLIndoorMaintenance *v7;
  _QWORD v8[4];
  CLIndoorMaintenance *v9;
  id v10;

  frameworkQueue = self->super._frameworkQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3321888768;
  v8[2] = sub_1000DA270;
  v8[3] = &unk_1003EE4B8;
  v5 = self;
  v6 = objc_retainBlock(a3);
  v9 = v5;
  v7 = v5;
  v10 = objc_retainBlock(v6);
  dispatch_async(frameworkQueue, v8);

}

- (void)prefetch:(id)a3
{
  id v4;
  NSObject *v5;
  CLIndoorMaintenance *v6;
  id v7;
  CLIndoorMaintenance *v8;
  NSObject *v9;
  _QWORD v10[4];
  CLIndoorMaintenance *v11;
  id v12;
  uint8_t buf[4];
  id v14;

  v4 = a3;
  if (qword_100417EE8 != -1)
    dispatch_once(&qword_100417EE8, &stru_1003EE630);
  v5 = (id)qword_100417EF0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v14 = objc_msgSend(v4, "count");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Sending request to prefetch %{public}zu venues", buf, 0xCu);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3321888768;
  v10[2] = sub_1000DA578;
  v10[3] = &unk_1003EE4E8;
  v6 = self;
  v7 = v4;
  v8 = v6;
  v11 = v8;
  v12 = v7;
  -[CLIndoorMaintenance doSynchronousXPC:description:waitForever:](v8, "doSynchronousXPC:description:waitForever:", v10, "prefetch:", 0);

  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE630);
    v9 = qword_100417EF0;
    if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEBUG))
      goto LABEL_8;
    goto LABEL_7;
  }
  v9 = qword_100417EF0;
  if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEBUG))
  {
LABEL_7:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Prefetch request finished", buf, 2u);
  }
LABEL_8:

}

- (void)onQueuePrefetch:(id)a3 callback:(id)a4 when:(unsigned __int8)a5
{
  uint64_t v5;
  id v8;
  const __CFString *v9;
  NSXPCConnection *connection;
  void *v11;
  void *v12;
  id v13;

  v5 = a5;
  v13 = a3;
  v8 = a4;
  if ((_DWORD)v5 == 1)
    v9 = CFSTR("prefetchSynchronous:");
  else
    v9 = CFSTR("prefetch:");
  connection = self->super._connection;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorXPCProvider _defaultErrHandler:forCaller:](self, "_defaultErrHandler:forCaller:", v8, v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v11));
  objc_msgSend(v12, "prefetch:callback:when:", v13, v8, v5);

}

- (void)prefetchSynchronous:(id)a3
{
  id v4;
  NSObject *v5;
  CLIndoorMaintenance *v6;
  id v7;
  CLIndoorMaintenance *v8;
  NSObject *v9;
  _QWORD v10[4];
  CLIndoorMaintenance *v11;
  id v12;
  uint8_t buf[4];
  id v14;

  v4 = a3;
  if (qword_100417EE8 != -1)
    dispatch_once(&qword_100417EE8, &stru_1003EE630);
  v5 = (id)qword_100417EF0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v14 = objc_msgSend(v4, "count");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Sending request to prefetch %zu venues synchronously", buf, 0xCu);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3321888768;
  v10[2] = sub_1000DA8EC;
  v10[3] = &unk_1003EE518;
  v6 = self;
  v7 = v4;
  v8 = v6;
  v11 = v8;
  v12 = v7;
  -[CLIndoorMaintenance doSynchronousXPC:description:waitForever:](v8, "doSynchronousXPC:description:waitForever:", v10, "prefetch:", 1);

  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE630);
    v9 = qword_100417EF0;
    if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEBUG))
      goto LABEL_8;
    goto LABEL_7;
  }
  v9 = qword_100417EF0;
  if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEBUG))
  {
LABEL_7:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Synchronous prefetch request finished", buf, 2u);
  }
LABEL_8:

}

- (void)doSynchronousXPC:(id)a3 description:(const char *)a4 waitForever:(BOOL)a5
{
  id v8;
  dispatch_semaphore_t v9;
  NSObject *frameworkQueue;
  id v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  _QWORD v15[4];
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;

  v8 = a3;
  v9 = dispatch_semaphore_create(0);
  frameworkQueue = self->super._frameworkQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000DAB1C;
  v15[3] = &unk_1003EE580;
  v11 = v8;
  v17 = v11;
  v12 = v9;
  v16 = v12;
  dispatch_async(frameworkQueue, v15);
  if (a5)
  {
    if (!dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL))
      goto LABEL_8;
  }
  else
  {
    v13 = dispatch_time(0, 3000000000);
    if (!dispatch_semaphore_wait(v12, v13))
      goto LABEL_8;
  }
  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE630);
    v14 = qword_100417EF0;
    if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    goto LABEL_7;
  }
  v14 = qword_100417EF0;
  if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_ERROR))
  {
LABEL_7:
    *(_DWORD *)buf = 136315138;
    v19 = a4;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Timeout trying to do XPC %{publci}s", buf, 0xCu);
  }
LABEL_8:

}

- (void)eraseEverything
{
  NSObject *v3;
  CLIndoorMaintenance *v4;
  NSObject *v5;
  _QWORD v6[4];
  CLIndoorMaintenance *v7;
  uint8_t buf[16];

  if (qword_100417EE8 == -1)
  {
    v3 = qword_100417EF0;
    if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_100417EE8, &stru_1003EE630);
  v3 = qword_100417EF0;
  if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Erasing all indoor tiles", buf, 2u);
  }
LABEL_4:
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3321888768;
  v6[2] = sub_1000DAD7C;
  v6[3] = &unk_1003EE5A0;
  v4 = self;
  v7 = v4;
  -[CLIndoorMaintenance doSynchronousXPC:description:waitForever:](v4, "doSynchronousXPC:description:waitForever:", v6, "eraseEverything", 0);

  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE630);
    v5 = qword_100417EF0;
    if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    goto LABEL_6;
  }
  v5 = qword_100417EF0;
  if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_INFO))
  {
LABEL_6:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Erase all indoor tile request finished", buf, 2u);
  }
LABEL_7:

}

- (void)onQueueEraseEverything:(id)a3
{
  id v4;
  NSObject *v5;
  NSXPCConnection *connection;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE630);
    v5 = qword_100417EF0;
    if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEBUG))
      goto LABEL_4;
    goto LABEL_3;
  }
  v5 = qword_100417EF0;
  if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Sending request to erase all indoor tiles", v9, 2u);
  }
LABEL_4:
  connection = self->super._connection;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorXPCProvider _defaultErrHandlerForCaller:](self, "_defaultErrHandlerForCaller:", CFSTR("eraseAllData")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v7));
  objc_msgSend(v8, "eraseAllData:", v4);

}

- (void)shutdown
{
  NSObject *v3;
  NSObject *frameworkQueue;
  CLIndoorMaintenance *v5;
  _QWORD block[4];
  CLIndoorMaintenance *v7;
  uint8_t buf[16];

  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE630);
    v3 = qword_100417EF0;
    if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  v3 = qword_100417EF0;
  if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Requesting shutdown of daemon", buf, 2u);
  }
LABEL_4:
  frameworkQueue = self->super._frameworkQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_1000DAFF8;
  block[3] = &unk_1003EE5D0;
  v7 = self;
  v5 = v7;
  dispatch_sync(frameworkQueue, block);

}

- (void)onQueueShutdown
{
  NSObject *v3;
  NSXPCConnection *connection;
  void *v5;
  void *v6;
  uint8_t v7[16];

  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE630);
    v3 = qword_100417EF0;
    if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEBUG))
      goto LABEL_4;
    goto LABEL_3;
  }
  v3 = qword_100417EF0;
  if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Sending shutdown request to daemon", v7, 2u);
  }
LABEL_4:
  connection = self->super._connection;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorXPCProvider _defaultErrHandlerForCaller:](self, "_defaultErrHandlerForCaller:", CFSTR("shutdown")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v5));
  objc_msgSend(v6, "shutdown");

}

- (void)numFloors:(id)a3
{
  id v4;
  NSObject *v5;
  CLIndoorMaintenance *v6;
  id v7;
  CLIndoorMaintenance *v8;
  _QWORD v9[4];
  CLIndoorMaintenance *v10;
  id v11;
  uint8_t buf[16];

  v4 = a3;
  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE630);
    v5 = qword_100417EF0;
    if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  v5 = qword_100417EF0;
  if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Requesting number of floors from daemon", buf, 2u);
  }
LABEL_4:
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3321888768;
  v9[2] = sub_1000DB2B0;
  v9[3] = &unk_1003EE600;
  v6 = self;
  v7 = objc_retainBlock(v4);
  v8 = v6;
  v10 = v8;
  v11 = objc_retainBlock(v7);
  -[CLIndoorMaintenance doSynchronousXPC:description:waitForever:](v8, "doSynchronousXPC:description:waitForever:", v9, "numFloors", 0);

}

- (void)onQueueNumFloors:(id)a3
{
  id v4;
  NSObject *v5;
  NSXPCConnection *connection;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE630);
    v5 = qword_100417EF0;
    if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEBUG))
      goto LABEL_4;
    goto LABEL_3;
  }
  v5 = qword_100417EF0;
  if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Sending request to find the number of floors in the Db", v9, 2u);
  }
LABEL_4:
  connection = self->super._connection;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorXPCProvider _defaultErrHandlerForCaller:](self, "_defaultErrHandlerForCaller:", CFSTR("numFloors")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v7));
  objc_msgSend(v8, "numFloors:", v4);

}

@end
