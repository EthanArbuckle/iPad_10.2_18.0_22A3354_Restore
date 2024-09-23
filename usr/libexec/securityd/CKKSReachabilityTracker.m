@implementation CKKSReachabilityTracker

- (CKKSReachabilityTracker)init
{
  id v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD *v10;
  nw_path_monitor_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD update_handler[4];
  id v18;
  id location;
  _QWORD block[4];
  id v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CKKSReachabilityTracker;
  v2 = -[CKKSReachabilityTracker init](&v22, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("reachabiltity-tracker", v4);
    v6 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v5;

    v7 = objc_alloc_init((Class)NSOperationQueue);
    v8 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v7;

    v9 = *((_QWORD *)v2 + 3);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10011494C;
    block[3] = &unk_1002EC350;
    v10 = v2;
    v21 = v10;
    dispatch_sync(v9, block);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v10);
    v11 = nw_path_monitor_create();
    v12 = (void *)v10[5];
    v10[5] = v11;

    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "networkMonitor"));
    nw_path_monitor_set_queue(v13, *((dispatch_queue_t *)v2 + 3));

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "networkMonitor"));
    update_handler[0] = _NSConcreteStackBlock;
    update_handler[1] = 3221225472;
    update_handler[2] = sub_100114954;
    update_handler[3] = &unk_1002DE598;
    objc_copyWeak(&v18, &location);
    nw_path_monitor_set_update_handler(v14, update_handler);

    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "networkMonitor"));
    nw_path_monitor_start(v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
  return (CKKSReachabilityTracker *)v2;
}

- (id)description
{
  unsigned int v2;
  const __CFString *v3;

  v2 = -[CKKSReachabilityTracker haveNetwork](self, "haveNetwork");
  v3 = CFSTR("offline");
  if (v2)
    v3 = CFSTR("online");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CKKSReachabilityTracker: %@>"), v3);
}

- (BOOL)currentReachability
{
  CKKSReachabilityTracker *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[CKKSReachabilityTracker queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10011491C;
  v5[3] = &unk_1002EB140;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)_onQueueRunReachabilityDependency
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v3 = objc_claimAutoreleasedReturnValue(-[CKKSReachabilityTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSReachabilityTracker reachabilityDependency](self, "reachabilityDependency"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSReachabilityTracker operationQueue](self, "operationQueue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSReachabilityTracker reachabilityDependency](self, "reachabilityDependency"));
    objc_msgSend(v5, "addOperation:", v6);

    -[CKKSReachabilityTracker setReachabilityDependency:](self, "setReachabilityDependency:", 0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSReachabilityTracker timer](self, "timer"));

  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[CKKSReachabilityTracker timer](self, "timer"));
    dispatch_source_cancel(v8);

    -[CKKSReachabilityTracker setTimer:](self, "setTimer:", 0);
  }
}

- (void)_onQueueResetReachabilityDependency
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  dispatch_source_t v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_time_t v15;
  NSObject *v16;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[8];
  id location;

  v3 = objc_claimAutoreleasedReturnValue(-[CKKSReachabilityTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = objc_claimAutoreleasedReturnValue(-[CKKSReachabilityTracker reachabilityDependency](self, "reachabilityDependency"));
  if (!v4
    || (v5 = (void *)v4,
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSReachabilityTracker reachabilityDependency](self, "reachabilityDependency")),
        v7 = objc_msgSend(v6, "isPending"),
        v6,
        v5,
        (v7 & 1) == 0))
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v8 = sub_10000BDF4(CFSTR("network"), 0);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Network unavailable", buf, 2u);
    }

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100114720;
    v22[3] = &unk_1002EB598;
    objc_copyWeak(&v23, &location);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("network-available-dependency"), v22));
    -[CKKSReachabilityTracker setReachabilityDependency:](self, "setReachabilityDependency:", v10);

    v11 = objc_claimAutoreleasedReturnValue(-[CKKSReachabilityTracker queue](self, "queue"));
    v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v11);
    -[CKKSReachabilityTracker setTimer:](self, "setTimer:", v12);

    v13 = objc_claimAutoreleasedReturnValue(-[CKKSReachabilityTracker timer](self, "timer"));
    v17 = _NSConcreteStackBlock;
    v18 = 3221225472;
    v19 = sub_1001147A0;
    v20 = &unk_1002EB598;
    objc_copyWeak(&v21, &location);
    dispatch_source_set_event_handler(v13, &v17);

    v14 = objc_claimAutoreleasedReturnValue(-[CKKSReachabilityTracker timer](self, "timer", v17, v18, v19, v20));
    v15 = dispatch_time(0, 43200000000000);
    dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0x6FC23AC00uLL);

    v16 = objc_claimAutoreleasedReturnValue(-[CKKSReachabilityTracker timer](self, "timer"));
    dispatch_resume(v16);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
}

- (void)_onqueueSetNetworkReachability:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;

  v3 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CKKSReachabilityTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  LODWORD(v5) = -[CKKSReachabilityTracker haveNetwork](self, "haveNetwork");
  -[CKKSReachabilityTracker setHaveNetwork:](self, "setHaveNetwork:", v3);
  if ((_DWORD)v5 != -[CKKSReachabilityTracker haveNetwork](self, "haveNetwork"))
  {
    if (-[CKKSReachabilityTracker haveNetwork](self, "haveNetwork"))
      -[CKKSReachabilityTracker _onQueueRunReachabilityDependency](self, "_onQueueRunReachabilityDependency");
    else
      -[CKKSReachabilityTracker _onQueueResetReachabilityDependency](self, "_onQueueResetReachabilityDependency");
  }
}

- (void)setNetworkReachability:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  v5 = objc_claimAutoreleasedReturnValue(-[CKKSReachabilityTracker queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100114710;
  v6[3] = &unk_1002E9358;
  v6[4] = self;
  v7 = a3;
  dispatch_sync(v5, v6);

}

- (BOOL)isNetworkError:(id)a3
{
  return +[CKKSReachabilityTracker isNetworkError:](CKKSReachabilityTracker, "isNetworkError:", a3);
}

- (CKKSResultOperation)reachabilityDependency
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 16, 1);
}

- (void)setReachabilityDependency:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)haveNetwork
{
  return self->_haveNetwork;
}

- (void)setHaveNetwork:(BOOL)a3
{
  self->_haveNetwork = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOperationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OS_nw_path_monitor)networkMonitor
{
  return (OS_nw_path_monitor *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNetworkMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (OS_dispatch_source)timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_reachabilityDependency, 0);
}

+ (BOOL)isNetworkError:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  id v6;
  void *v7;
  id v9;

  v3 = a3;
  if (!v3)
    goto LABEL_12;
  if (!+[CKKSReachabilityTracker isNetworkFailureError:](CKKSReachabilityTracker, "isNetworkFailureError:", v3))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    if (objc_msgSend(v5, "isEqualToString:", CKErrorDomain))
    {
      v6 = objc_msgSend(v3, "code");

      if (v6 == (id)3)
        goto LABEL_3;
    }
    else
    {

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    if (objc_msgSend(v7, "isEqualToString:", NSURLErrorDomain))
    {
      if (objc_msgSend(v3, "code") == (id)-1001)
      {

        goto LABEL_3;
      }
      v9 = objc_msgSend(v3, "code");

      if (v9 == (id)-1009)
        goto LABEL_3;
    }
    else
    {

    }
LABEL_12:
    v4 = 0;
    goto LABEL_13;
  }
LABEL_3:
  v4 = 1;
LABEL_13:

  return v4;
}

+ (BOOL)isNetworkFailureError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  BOOL v7;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_6;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  if (!objc_msgSend(v5, "isEqualToString:", CKErrorDomain))
  {

    goto LABEL_6;
  }
  v6 = objc_msgSend(v4, "code");

  if (v6 != (id)4)
  {
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  v7 = 1;
LABEL_7:

  return v7;
}

@end
