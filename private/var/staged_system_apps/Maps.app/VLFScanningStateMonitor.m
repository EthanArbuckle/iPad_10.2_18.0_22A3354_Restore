@implementation VLFScanningStateMonitor

- (VLFScanningStateMonitor)initWithDelegate:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  VLFScanningStateMonitor *v8;
  VLFScanningStateMonitor *v9;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  char *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  char *v20;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v11 = sub_1004318FC();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v23 = "-[VLFScanningStateMonitor initWithDelegate:session:]";
      v24 = 2080;
      v25 = "VLFScanningStateMonitor.m";
      v26 = 1024;
      v27 = 30;
      v28 = 2080;
      v29 = "delegate != nil";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v13 = sub_1004318FC();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v23 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v7)
  {
    v16 = sub_1004318FC();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v23 = "-[VLFScanningStateMonitor initWithDelegate:session:]";
      v24 = 2080;
      v25 = "VLFScanningStateMonitor.m";
      v26 = 1024;
      v27 = 31;
      v28 = 2080;
      v29 = "session != nil";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v18 = sub_1004318FC();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v23 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)VLFScanningStateMonitor;
  v8 = -[VLFScanningStateMonitor init](&v21, "init");
  v9 = v8;
  if (v8)
  {
    v8->_currentState = 1;
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_session, a4);
    -[ARSession _addObserver:](v9->_session, "_addObserver:", v9);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[ARSession _removeObserver:](self->_session, "_removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)VLFScanningStateMonitor;
  -[VLFScanningStateMonitor dealloc](&v3, "dealloc");
}

- (void)setCurrentState:(int64_t)a3
{
  NSObject *v4;
  objc_class *v5;
  NSString *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  const __CFString *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;

  if (self->_currentState != a3)
  {
    self->_currentState = a3;
    if (qword_1014D2FF8 != -1)
      dispatch_once(&qword_1014D2FF8, &stru_1011C52B0);
    v4 = (id)qword_1014D2FF0;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (objc_class *)objc_opt_class(self);
      v6 = NSStringFromClass(v5);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      v8 = (void *)v7;
      v9 = self->_currentState - 2;
      if (v9 > 3)
        v10 = CFSTR("VLFScanningStateInitializing");
      else
        v10 = *(&off_1011C52D0 + v9);
      v12 = 138412546;
      v13 = v7;
      v14 = 2112;
      v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ changing state to: %@", (uint8_t *)&v12, 0x16u);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningStateMonitor delegate](self, "delegate"));
    objc_msgSend(v11, "scanningStateMonitor:didChangeState:", self, self->_currentState);

  }
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (VLFScanningStateMonitorDelegate)delegate
{
  return (VLFScanningStateMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ARSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
