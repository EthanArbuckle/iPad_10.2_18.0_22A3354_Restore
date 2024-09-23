@implementation RouteLoadingNavigationServiceTask

- (RouteLoadingNavigationServiceTask)initWithNavigationService:(id)a3 routeRequestDetailsBuilder:(id)a4
{
  id v7;
  id v8;
  RouteLoadingNavigationServiceTask *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  id v14;
  const char *v15;
  dispatch_queue_attr_t v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *isolationQueue;
  dispatch_queue_attr_t v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *callbackQueue;
  objc_super v25;

  v7 = a3;
  v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)RouteLoadingNavigationServiceTask;
  v9 = -[RouteLoadingNavigationServiceTask init](&v25, "init");
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.isolationQueue.%p"), v11, objc_opt_class(v9), v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    v14 = objc_retainAutorelease(v13);
    v15 = (const char *)objc_msgSend(v14, "UTF8String");
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = dispatch_queue_create(v15, v17);
    isolationQueue = v9->_isolationQueue;
    v9->_isolationQueue = (OS_dispatch_queue *)v18;

    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = dispatch_queue_create("com.apple.Maps.RouteLoadingNavigationServiceTask.callback", v21);
    callbackQueue = v9->_callbackQueue;
    v9->_callbackQueue = (OS_dispatch_queue *)v22;

    objc_storeStrong((id *)&v9->_navigationService, a3);
    objc_storeStrong((id *)&v9->_routeRequestBuilder, a4);

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingNavigationServiceTask navigationService](self, "navigationService"));
  objc_msgSend(v3, "closeForClient:", self);

  v4.receiver = self;
  v4.super_class = (Class)RouteLoadingNavigationServiceTask;
  -[RouteLoadingNavigationServiceTask dealloc](&v4, "dealloc");
}

- (BOOL)inProgress
{
  RouteLoadingNavigationServiceTask *v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v2 = self;
  v3 = objc_claimAutoreleasedReturnValue(-[RouteLoadingNavigationServiceTask isolationQueue](self, "isolationQueue"));
  dispatch_assert_queue_not_V2(v3);

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v4 = objc_claimAutoreleasedReturnValue(-[RouteLoadingNavigationServiceTask isolationQueue](v2, "isolationQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1008457B0;
  v6[3] = &unk_1011ADF48;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

- (Result)result
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = objc_claimAutoreleasedReturnValue(-[RouteLoadingNavigationServiceTask isolationQueue](self, "isolationQueue"));
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1008458E0;
  v12 = sub_1008458F0;
  v13 = 0;
  v4 = objc_claimAutoreleasedReturnValue(-[RouteLoadingNavigationServiceTask isolationQueue](self, "isolationQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1008458F8;
  v7[3] = &unk_1011ADF48;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (Result *)v5;
}

- (void)cancel
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[RouteLoadingNavigationServiceTask isolationQueue](self, "isolationQueue"));
  dispatch_assert_queue_not_V2(v3);

  v4 = objc_claimAutoreleasedReturnValue(-[RouteLoadingNavigationServiceTask isolationQueue](self, "isolationQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008459B4;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_sync(v4, block);

}

- (void)startWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t Log;
  NSObject *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  _QWORD block[6];
  _BYTE buf[24];
  char v14;

  v4 = a3;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RouteLoadingTask");
  v6 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = objc_retainBlock(v4);
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "-[RouteLoadingNavigationServiceTask startWithCompletionHandler:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}s %{public}@", buf, 0x16u);

  }
  if (v4)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v14 = 0;
    v8 = objc_claimAutoreleasedReturnValue(-[RouteLoadingNavigationServiceTask isolationQueue](self, "isolationQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100845C84;
    block[3] = &unk_1011ADF48;
    block[4] = self;
    block[5] = buf;
    dispatch_sync(v8, block);

    if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      v9 = objc_claimAutoreleasedReturnValue(-[RouteLoadingNavigationServiceTask isolationQueue](self, "isolationQueue"));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100845CE0;
      v10[3] = &unk_1011AE240;
      v10[4] = self;
      v11 = v4;
      dispatch_async(v9, v10);

    }
    _Block_object_dispose(buf, 8);
  }

}

- (void)_createNavigationServiceTicketOnIsolationQueueWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _MapsCustomRouteDirectionsRequestTicket *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t Log;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  RouteLoadingNavigationServiceTask *v21;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[RouteLoadingNavigationServiceTask isolationQueue](self, "isolationQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingNavigationServiceTask routeRequestBuilder](self, "routeRequestBuilder"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "buildDirectionsRequestDetails"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "persistentData"));
  if (v8)
  {
    v9 = -[_MapsCustomRouteDirectionsRequestTicket initWithRequestDetails:]([_MapsCustomRouteDirectionsRequestTicket alloc], "initWithRequestDetails:", v7);
    -[RouteLoadingNavigationServiceTask setTicket:](self, "setTicket:", v9);
  }
  else
  {
    v9 = (_MapsCustomRouteDirectionsRequestTicket *)objc_claimAutoreleasedReturnValue(-[RouteLoadingNavigationServiceTask navigationService](self, "navigationService"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_MapsCustomRouteDirectionsRequestTicket ticketForDirectionsRequest:](v9, "ticketForDirectionsRequest:", v7));
    -[RouteLoadingNavigationServiceTask setTicket:](self, "setTicket:", v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingNavigationServiceTask ticket](self, "ticket"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingNavigationServiceTask navigationService](self, "navigationService"));
    objc_msgSend(v12, "openForClient:", self);

    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RouteLoadingTask");
    v14 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = self;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@ - Submitting MNNavigationServiceDirectionsRequestTicket", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingNavigationServiceTask ticket](self, "ticket"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100845F78;
    v16[3] = &unk_1011D8F78;
    objc_copyWeak(&v19, (id *)buf);
    v17 = v7;
    v18 = v4;
    objc_msgSend(v15, "submitWithHandler:", v16);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    -[RouteLoadingNavigationServiceTask _handleNilNavdTicketOnIsolationQueueWithCompletionHandler:](self, "_handleNilNavdTicketOnIsolationQueueWithCompletionHandler:", v4);
  }

}

- (void)_handleNilNavdTicketOnIsolationQueueWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t Log;
  NSObject *v9;
  void *v10;
  NSObject *callbackQueue;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  RouteLoadingNavigationServiceTask *v17;
  __int16 v18;
  void *v19;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[RouteLoadingNavigationServiceTask isolationQueue](self, "isolationQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingNavigationServiceTask ticket](self, "ticket"));
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.RouteLoadingNavigationServiceTask.Error"), 1, &off_101274840));
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RouteLoadingTask");
    v9 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v17 = self;
      v18 = 2114;
      v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@ – NavigationService returned a nil MNNavigationServiceDirectionsRequestTicket. Creating a error (%{public}@ and failing the route loading task", buf, 0x16u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[Result resultWithError:](Result, "resultWithError:", v7));
    -[RouteLoadingNavigationServiceTask setResultOnIsolationQueue:](self, "setResultOnIsolationQueue:", v10);
    -[RouteLoadingNavigationServiceTask setTaskState:](self, "setTaskState:", 2);
    callbackQueue = self->_callbackQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1008464DC;
    block[3] = &unk_1011AECC0;
    block[4] = self;
    v14 = v10;
    v15 = v4;
    v12 = v10;
    dispatch_async(callbackQueue, block);

  }
}

- (void)_createResultOnIsolationQueueWithRoutes:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t Log;
  NSObject *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *callbackQueue;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  id v27;
  uint8_t buf[4];
  RouteLoadingNavigationServiceTask *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[RouteLoadingNavigationServiceTask isolationQueue](self, "isolationQueue"));
  dispatch_assert_queue_V2(v11);

  v12 = objc_msgSend(v8, "count");
  if (v9 && v12)
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RouteLoadingTask");
    v14 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v29 = self;
      v30 = 2114;
      v31 = v9;
      v32 = 2112;
      v33 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@ – MNNavigationServiceDirectionsRequestTicket callback invoked with both an error %{public}@ and routes (%@) ", buf, 0x20u);
    }

  }
  v15 = objc_msgSend(v8, "count");
  if (!v9 && !v15)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.RouteLoadingNavigationServiceTask.Error"), 2, &off_101274868));
    v16 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RouteLoadingTask");
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v29 = self;
      v30 = 2114;
      v31 = v9;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@ – No Routes could be constructed from the MNNavigationServiceDirectionsRequestTicket's routes and no error was returned. Creating an error %{public}@ to send in completion handler", buf, 0x16u);
    }

  }
  if (v9)
    v18 = objc_claimAutoreleasedReturnValue(+[Result resultWithError:](Result, "resultWithError:", v9));
  else
    v18 = objc_claimAutoreleasedReturnValue(+[Result resultWithValue:](Result, "resultWithValue:", v8));
  v19 = (void *)v18;
  v20 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RouteLoadingTask");
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    v29 = (RouteLoadingNavigationServiceTask *)"-[RouteLoadingNavigationServiceTask _createResultOnIsolationQueueWithRout"
                                               "es:error:completionHandler:]";
    v30 = 2112;
    v31 = v19;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%{public}s created result: %@", buf, 0x16u);
  }

  -[RouteLoadingNavigationServiceTask setTaskState:](self, "setTaskState:", 2);
  -[RouteLoadingNavigationServiceTask setResultOnIsolationQueue:](self, "setResultOnIsolationQueue:", v19);
  callbackQueue = self->_callbackQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10084689C;
  block[3] = &unk_1011AECC0;
  block[4] = self;
  v26 = v19;
  v27 = v10;
  v23 = v10;
  v24 = v19;
  dispatch_async(callbackQueue, block);

}

- (NSString)description
{
  uint64_t v3;
  unint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_opt_class(self);
  v4 = -[RouteLoadingNavigationServiceTask taskState](self, "taskState");
  v5 = CFSTR("TaskStateNotStarted");
  if (v4 == 1)
    v5 = CFSTR("TaskStateRunning");
  if (v4 == 2)
    v6 = CFSTR("TaskStateFinished");
  else
    v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingNavigationServiceTask ticket](self, "ticket"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingNavigationServiceTask resultOnIsolationQueue](self, "resultOnIsolationQueue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p state=%@ ticket=%@ result=%@>"), v3, self, v6, v7, v8));

  return (NSString *)v9;
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (MNRouteRequestBuilder)routeRequestBuilder
{
  return self->_routeRequestBuilder;
}

- (OS_dispatch_queue)isolationQueue
{
  return self->_isolationQueue;
}

- (unint64_t)taskState
{
  return self->_taskState;
}

- (void)setTaskState:(unint64_t)a3
{
  self->_taskState = a3;
}

- (MNNavigationServiceDirectionsRequestTicket)ticket
{
  return self->_ticket;
}

- (void)setTicket:(id)a3
{
  objc_storeStrong((id *)&self->_ticket, a3);
}

- (Result)resultOnIsolationQueue
{
  return self->_resultOnIsolationQueue;
}

- (void)setResultOnIsolationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_resultOnIsolationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultOnIsolationQueue, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_routeRequestBuilder, 0);
  objc_storeStrong((id *)&self->_navigationService, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

@end
