@implementation APReachability

- (APReachability)initWithDelegate:(id)a3
{
  id v4;
  APReachability *v5;
  APReachability *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)APReachability;
  v5 = -[APReachability init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (APUnfairRecursiveLock)lock
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AD67C;
  block[3] = &unk_100212FE0;
  block[4] = self;
  if (qword_1002695D0 != -1)
    dispatch_once(&qword_1002695D0, block);
  return self->_lock;
}

- (int64_t)currentStatus
{
  void *v3;
  int64_t currentStatus;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APReachability lock](self, "lock"));
  objc_msgSend(v3, "lock");

  currentStatus = self->_currentStatus;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APReachability lock](self, "lock"));
  objc_msgSend(v5, "unlock");

  return currentStatus;
}

- (void)startMonitoring
{
  void *v3;
  id v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *monitorQueue;
  uint64_t v7;
  NSObject *v8;
  OS_nw_path_monitor *v9;
  OS_nw_path_monitor *monitor;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  _QWORD update_handler[5];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APReachability lock](self, "lock"));
  objc_msgSend(v3, "lock");

  if (!self->_monitorQueue)
  {
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.ap.deviceinfo.reachability.%p"), self)));
    v5 = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v4, "UTF8String"), 0);
    monitorQueue = self->_monitorQueue;
    self->_monitorQueue = v5;

  }
  if (!self->_monitor)
  {
    v7 = APLogForCategory(12);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Initializing reachability", buf, 2u);
    }

    self->_currentStatus = 0;
    v9 = (OS_nw_path_monitor *)nw_path_monitor_create();
    monitor = self->_monitor;
    self->_monitor = v9;

    v11 = objc_claimAutoreleasedReturnValue(-[APReachability monitor](self, "monitor"));
    v12 = objc_claimAutoreleasedReturnValue(-[APReachability monitorQueue](self, "monitorQueue"));
    nw_path_monitor_set_queue(v11, v12);

    v13 = self->_monitor;
    update_handler[0] = _NSConcreteStackBlock;
    update_handler[1] = 3221225472;
    update_handler[2] = sub_1000AD88C;
    update_handler[3] = &unk_100213EA8;
    update_handler[4] = self;
    nw_path_monitor_set_update_handler(v13, update_handler);
    v14 = objc_claimAutoreleasedReturnValue(-[APReachability monitor](self, "monitor"));
    nw_path_monitor_start(v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[APReachability lock](self, "lock"));
  objc_msgSend(v15, "unlock");

}

- (void)stopMonitoring
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  OS_nw_path_monitor *monitor;
  OS_nw_path *currentPath;
  void *v9;
  uint8_t v10[16];

  v3 = APLogForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Tearing down reachability", v10, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APReachability lock](self, "lock"));
  objc_msgSend(v5, "lock");

  v6 = objc_claimAutoreleasedReturnValue(-[APReachability monitor](self, "monitor"));
  nw_path_monitor_cancel(v6);

  monitor = self->_monitor;
  self->_monitor = 0;

  currentPath = self->_currentPath;
  self->_currentStatus = 0;
  self->_currentPath = 0;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APReachability lock](self, "lock"));
  objc_msgSend(v9, "unlock");

}

- (void)_updateNetwork:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  OS_nw_path **p_currentPath;
  nw_path_status_t status;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;

  v5 = a3;
  v6 = APLogForCategory(12);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v25) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Received network update from nw_path_monitor", (uint8_t *)&v25, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APReachability lock](self, "lock"));
  objc_msgSend(v8, "lock");

  p_currentPath = &self->_currentPath;
  if (!nw_path_is_equal(v5, (nw_path_t)self->_currentPath))
  {
    objc_storeStrong((id *)&self->_currentPath, a3);
    status = nw_path_get_status((nw_path_t)*p_currentPath);
    v11 = 0;
    switch(status)
    {
      case nw_path_status_invalid:
      case nw_path_status_unsatisfied:
        break;
      case nw_path_status_satisfied:
      case nw_path_status_satisfiable:
        if (nw_path_uses_interface_type((nw_path_t)*p_currentPath, nw_interface_type_wifi)
          || nw_path_uses_interface_type((nw_path_t)*p_currentPath, nw_interface_type_wired)
          || nw_path_uses_interface_type((nw_path_t)*p_currentPath, nw_interface_type_other))
        {
          v12 = 2;
        }
        else
        {
          v12 = 0;
        }
        if (nw_path_uses_interface_type((nw_path_t)*p_currentPath, nw_interface_type_cellular))
          v11 = v12 | 4;
        else
          v11 = v12;
        break;
      default:
        v13 = APLogForCategory(12);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v25 = 67109120;
          LODWORD(v26) = status;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Unknown network status flags: %u", (uint8_t *)&v25, 8u);
        }

        v11 = 0;
        break;
    }
    if (nw_path_is_expensive((nw_path_t)self->_currentPath))
      v15 = v11 | 8;
    else
      v15 = v11;
    if (nw_path_is_constrained((nw_path_t)self->_currentPath))
      v15 |= 0x10uLL;
    if (self->_currentStatus != v15)
    {
      v16 = APLogForCategory(12);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = _statusToString(self->_currentStatus);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v20 = _statusToString(v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        v25 = 138412546;
        v26 = v19;
        v27 = 2112;
        v28 = v21;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Updating network status from (%@) to (%@)", (uint8_t *)&v25, 0x16u);

      }
      self->_currentStatus = v15;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[APReachability delegate](self, "delegate"));

      if (v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[APReachability delegate](self, "delegate"));
        objc_msgSend(v23, "reachabilityChanged:", -[APReachability currentStatus](self, "currentStatus"));

      }
    }
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[APReachability lock](self, "lock"));
  objc_msgSend(v24, "unlock");

}

- (void)setCurrentStatus:(int64_t)a3
{
  self->_currentStatus = a3;
}

- (OS_nw_path)currentPath
{
  return self->_currentPath;
}

- (void)setCurrentPath:(id)a3
{
  objc_storeStrong((id *)&self->_currentPath, a3);
}

- (OS_nw_path_monitor)monitor
{
  return self->_monitor;
}

- (void)setMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_monitor, a3);
}

- (OS_dispatch_queue)monitorQueue
{
  return self->_monitorQueue;
}

- (void)setMonitorQueue:(id)a3
{
  objc_storeStrong((id *)&self->_monitorQueue, a3);
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (APReachabilityMonitoring)delegate
{
  return (APReachabilityMonitoring *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_monitorQueue, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_currentPath, 0);
}

@end
