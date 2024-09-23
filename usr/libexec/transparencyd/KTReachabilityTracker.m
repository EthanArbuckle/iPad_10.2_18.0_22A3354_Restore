@implementation KTReachabilityTracker

- (KTReachabilityTracker)init
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
  v22.super_class = (Class)KTReachabilityTracker;
  v2 = -[KTReachabilityTracker init](&v22, "init");
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
    block[2] = sub_1001620E0;
    block[3] = &unk_10023A390;
    v10 = v2;
    v21 = v10;
    dispatch_sync(v9, block);
    location = 0;
    objc_initWeak(&location, v10);
    v11 = nw_path_monitor_create();
    v12 = (void *)v10[5];
    v10[5] = v11;

    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "networkMonitor"));
    nw_path_monitor_set_queue(v13, *((dispatch_queue_t *)v2 + 3));

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "networkMonitor"));
    update_handler[0] = _NSConcreteStackBlock;
    update_handler[1] = 3221225472;
    update_handler[2] = sub_1001620E8;
    update_handler[3] = &unk_1002493F0;
    objc_copyWeak(&v18, &location);
    nw_path_monitor_set_update_handler(v14, update_handler);

    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "networkMonitor"));
    nw_path_monitor_start(v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
  return (KTReachabilityTracker *)v2;
}

- (id)description
{
  unsigned int v2;
  const __CFString *v3;

  v2 = -[KTReachabilityTracker haveNetwork](self, "haveNetwork");
  v3 = CFSTR("offline");
  if (v2)
    v3 = CFSTR("online");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<KTReachabilityTracker: %@>"), v3);
}

- (BOOL)currentReachability
{
  KTReachabilityTracker *v2;
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
  v3 = objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001622F0;
  v5[3] = &unk_100246758;
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

  v3 = objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker reachabilityDependency](self, "reachabilityDependency"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker operationQueue](self, "operationQueue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker reachabilityDependency](self, "reachabilityDependency"));
    objc_msgSend(v5, "addOperation:", v6);

    -[KTReachabilityTracker setReachabilityDependency:](self, "setReachabilityDependency:", 0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker timer](self, "timer"));

  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker timer](self, "timer"));
    dispatch_source_cancel(v8);

    -[KTReachabilityTracker setTimer:](self, "setTimer:", 0);
  }
}

- (void)_onQueueResetReachabilityDependency
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  NSObject *v9;
  dispatch_source_t v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[8];
  id location;

  v3 = objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker reachabilityDependency](self, "reachabilityDependency"));
  if (!v4
    || (v5 = (void *)v4,
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker reachabilityDependency](self, "reachabilityDependency")),
        v7 = objc_msgSend(v6, "isPending"),
        v6,
        v5,
        (v7 & 1) == 0))
  {
    location = 0;
    objc_initWeak(&location, self);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Network unavailable", buf, 2u);
    }
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100162670;
    v20[3] = &unk_10023A970;
    objc_copyWeak(&v21, &location);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[KTResultOperation named:withBlock:](KTResultOperation, "named:withBlock:", CFSTR("network-available-dependency"), v20));
    -[KTReachabilityTracker setReachabilityDependency:](self, "setReachabilityDependency:", v8);

    v9 = objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker queue](self, "queue"));
    v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v9);
    -[KTReachabilityTracker setTimer:](self, "setTimer:", v10);

    v11 = objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker timer](self, "timer"));
    v15 = _NSConcreteStackBlock;
    v16 = 3221225472;
    v17 = sub_1001627B0;
    v18 = &unk_10023A970;
    objc_copyWeak(&v19, &location);
    dispatch_source_set_event_handler(v11, &v15);

    v12 = objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker timer](self, "timer", v15, v16, v17, v18));
    v13 = dispatch_time(0, 43200000000000);
    dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0x6FC23AC00uLL);

    v14 = objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker timer](self, "timer"));
    dispatch_resume(v14);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

- (void)_onqueueSetNetworkReachability:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;

  v3 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  LODWORD(v5) = -[KTReachabilityTracker haveNetwork](self, "haveNetwork");
  -[KTReachabilityTracker setHaveNetwork:](self, "setHaveNetwork:", v3);
  if ((_DWORD)v5 != -[KTReachabilityTracker haveNetwork](self, "haveNetwork"))
  {
    if (-[KTReachabilityTracker haveNetwork](self, "haveNetwork"))
      -[KTReachabilityTracker _onQueueRunReachabilityDependency](self, "_onQueueRunReachabilityDependency");
    else
      -[KTReachabilityTracker _onQueueResetReachabilityDependency](self, "_onQueueResetReachabilityDependency");
  }
}

- (void)setNetworkReachability:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  v5 = objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100162918;
  v6[3] = &unk_100248190;
  v6[4] = self;
  v7 = a3;
  dispatch_sync(v5, v6);

}

- (BOOL)isNetworkError:(id)a3
{
  return +[KTReachabilityTracker isNetworkError:](KTReachabilityTracker, "isNetworkError:", a3);
}

+ (BOOL)isNetworkError:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = a3;
  if (!v3)
    goto LABEL_12;
  if (!+[KTReachabilityTracker isNetworkFailureError:](KTReachabilityTracker, "isNetworkFailureError:", v3))
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
      v8 = objc_msgSend(v3, "code");

      if (v8 == (id)-1001)
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

- (KTResultOperation)reachabilityDependency
{
  return (KTResultOperation *)objc_getProperty(self, a2, 16, 1);
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

@end
