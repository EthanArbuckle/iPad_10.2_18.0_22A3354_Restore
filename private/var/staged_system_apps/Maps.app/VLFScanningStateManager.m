@implementation VLFScanningStateManager

- (VLFScanningStateManager)initWithSession:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  VLFScanningStateManager *v9;
  os_activity_t v10;
  NSObject *v11;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  objc_super v25;
  _BYTE state[22];
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    v13 = sub_1004318FC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)state = 136315906;
      *(_QWORD *)&state[4] = "-[VLFScanningStateManager initWithSession:delegate:]";
      *(_WORD *)&state[12] = 2080;
      *(_QWORD *)&state[14] = "VLFScanningStateManager.m";
      v27 = 1024;
      v28 = 46;
      v29 = 2080;
      v30 = "session != nil";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", state, 0x26u);
    }

    if (sub_100A70734())
    {
      v15 = sub_1004318FC();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)state = 138412290;
        *(_QWORD *)&state[4] = v17;
        v18 = (void *)v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", state, 0xCu);

      }
    }
  }
  if (!v8)
  {
    v19 = sub_1004318FC();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)state = 136315906;
      *(_QWORD *)&state[4] = "-[VLFScanningStateManager initWithSession:delegate:]";
      *(_WORD *)&state[12] = 2080;
      *(_QWORD *)&state[14] = "VLFScanningStateManager.m";
      v27 = 1024;
      v28 = 47;
      v29 = 2080;
      v30 = "delegate != nil";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", state, 0x26u);
    }

    if (sub_100A70734())
    {
      v21 = sub_1004318FC();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)state = 138412290;
        *(_QWORD *)&state[4] = v23;
        v24 = (void *)v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", state, 0xCu);

      }
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)VLFScanningStateManager;
  v9 = -[VLFScanningStateManager init](&v25, "init");
  if (v9)
  {
    v10 = _os_activity_create((void *)&_mh_execute_header, "Visual Localization", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
    -[VLFScanningStateManager setActivity:](v9, "setActivity:", v10);

    *(_QWORD *)state = 0;
    *(_QWORD *)&state[8] = 0;
    v11 = objc_claimAutoreleasedReturnValue(-[VLFScanningStateManager activity](v9, "activity"));
    os_activity_scope_enter(v11, (os_activity_scope_state_t)state);

    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v9->_session, a3);
    v9->_currentState = 1;
    -[VLFScanningStateManager _createMonitors](v9, "_createMonitors");
    -[VLFScanningStateManager _start](v9, "_start");
    os_activity_scope_leave((os_activity_scope_state_t)state);
  }

  return v9;
}

- (void)_createMonitors
{
  NSObject *v3;
  void *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  VLFScanningStateCameraMotionMonitor *v9;
  VLFScanningStateCameraMotionMonitor *v10;
  id v11;
  NSObject *v12;
  VLFScanningStateCameraPitchMonitor *v13;
  void *v14;
  VLFScanningStateCameraPitchMonitor *v15;
  uint8_t v16[16];
  os_activity_scope_state_s state;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[VLFScanningStateManager activity](self, "activity"));
  os_activity_scope_enter(v3, &state);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("VLFSessionScanningEnableCameraMotionMonitorKey"));

  v6 = sub_100608B6C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v8)
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Creating camera motion monitor", v16, 2u);
    }

    v9 = [VLFScanningStateCameraMotionMonitor alloc];
    v7 = objc_claimAutoreleasedReturnValue(-[VLFScanningStateManager session](self, "session"));
    v10 = -[VLFScanningStateMonitor initWithDelegate:session:](v9, "initWithDelegate:session:", self, v7);
    -[VLFScanningStateManager setCameraMotionMonitor:](self, "setCameraMotionMonitor:", v10);

  }
  else if (v8)
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Not creating camera motion monitor", v16, 2u);
  }

  v11 = sub_100608B6C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Creating camera pitch monitor", v16, 2u);
  }

  v13 = [VLFScanningStateCameraPitchMonitor alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningStateManager session](self, "session"));
  v15 = -[VLFScanningStateCameraPitchMonitor initWithDelegate:session:](v13, "initWithDelegate:session:", self, v14);
  -[VLFScanningStateManager setCameraPitchMonitor:](self, "setCameraPitchMonitor:", v15);

  os_activity_scope_leave(&state);
}

- (void)_start
{
  NSObject *v3;
  double Double;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  double v14;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[VLFScanningStateManager activity](self, "activity"));
  os_activity_scope_enter(v3, &state);

  Double = GEOConfigGetDouble(MapsConfig_VLFSessionKeepScanningDelay, off_1014B3918);
  v5 = sub_100608B6C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (Double <= 0.0)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Initialization delay is 0 seconds; going straight to .Scanning state",
        buf,
        2u);
    }

    -[VLFScanningStateManager setCurrentState:](self, "setCurrentState:", 2);
    -[VLFScanningStateManager _recalculateState](self, "_recalculateState");
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 134217984;
      v14 = Double;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Starting initializing timer with delay %f", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v8 = &_dispatch_main_q;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100608DC8;
    v10[3] = &unk_1011AE190;
    objc_copyWeak(&v11, (id *)buf);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v10, Double));
    -[VLFScanningStateManager setInitializingTimer:](self, "setInitializingTimer:", v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
  os_activity_scope_leave(&state);
}

- (void)_recalculateState
{
  const char *label;
  const char *v4;
  BOOL v5;
  NSObject *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint8_t v26[16];
  _BYTE state[22];
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v20 = sub_1004318FC();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)state = 136316418;
        *(_QWORD *)&state[4] = "-[VLFScanningStateManager _recalculateState]";
        *(_WORD *)&state[12] = 2080;
        *(_QWORD *)&state[14] = "VLFScanningStateManager.m";
        v28 = 1024;
        v29 = 110;
        v30 = 2080;
        v31 = "dispatch_get_main_queue()";
        v32 = 2080;
        v33 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v34 = 2080;
        v35 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          state,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v22 = sub_1004318FC();
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)state = 138412290;
          *(_QWORD *)&state[4] = v24;
          v25 = (void *)v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", state, 0xCu);

        }
      }
    }
  }
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = 0;
  v6 = objc_claimAutoreleasedReturnValue(-[VLFScanningStateManager activity](self, "activity"));
  os_activity_scope_enter(v6, (os_activity_scope_state_t)state);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningStateManager cameraMotionMonitor](self, "cameraMotionMonitor"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningStateManager cameraMotionMonitor](self, "cameraMotionMonitor"));
    v9 = objc_msgSend(v8, "currentState") == (id)2;

    if (!v9)
    {
      v16 = sub_100608B6C();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Camera motion monitor detected device is moving too fast; updating state",
          v26,
          2u);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningStateManager cameraMotionMonitor](self, "cameraMotionMonitor"));
      -[VLFScanningStateManager setCurrentState:](self, "setCurrentState:", objc_msgSend(v15, "currentState"));
      goto LABEL_18;
    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningStateManager cameraPitchMonitor](self, "cameraPitchMonitor"));
  if (objc_msgSend(v10, "currentState") == (id)5)
  {

LABEL_12:
    v13 = sub_100608B6C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Camera pitch monitor detected device is tilted too much; updating state",
        v26,
        2u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningStateManager cameraPitchMonitor](self, "cameraPitchMonitor"));
    -[VLFScanningStateManager setCurrentState:](self, "setCurrentState:", objc_msgSend(v15, "currentState"));
LABEL_18:

    goto LABEL_19;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningStateManager cameraPitchMonitor](self, "cameraPitchMonitor"));
  v12 = objc_msgSend(v11, "currentState") == (id)4;

  if (v12)
    goto LABEL_12;
  v18 = sub_100608B6C();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "None of the monitors detected anything; updating state",
      v26,
      2u);
  }

  -[VLFScanningStateManager setCurrentState:](self, "setCurrentState:", 2);
LABEL_19:
  os_activity_scope_leave((os_activity_scope_state_t)state);
}

- (void)setCurrentState:(int64_t)a3
{
  const char *label;
  const char *v6;
  BOOL v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  unint64_t v11;
  const __CFString *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  int v20;
  const __CFString *v21;
  _BYTE state[22];
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v14 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)state = 136316418;
        *(_QWORD *)&state[4] = "-[VLFScanningStateManager setCurrentState:]";
        *(_WORD *)&state[12] = 2080;
        *(_QWORD *)&state[14] = "VLFScanningStateManager.m";
        v23 = 1024;
        v24 = 128;
        v25 = 2080;
        v26 = "dispatch_get_main_queue()";
        v27 = 2080;
        v28 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v29 = 2080;
        v30 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          state,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v16 = sub_1004318FC();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)state = 138412290;
          *(_QWORD *)&state[4] = v18;
          v19 = (void *)v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", state, 0xCu);

        }
      }
    }
  }
  if (self->_currentState != a3)
  {
    *(_QWORD *)state = 0;
    *(_QWORD *)&state[8] = 0;
    v8 = objc_claimAutoreleasedReturnValue(-[VLFScanningStateManager activity](self, "activity"));
    os_activity_scope_enter(v8, (os_activity_scope_state_t)state);

    self->_currentState = a3;
    v9 = sub_100608B6C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = self->_currentState - 2;
      if (v11 > 3)
        v12 = CFSTR("VLFScanningStateInitializing");
      else
        v12 = *(&off_1011BE028 + v11);
      v20 = 138412290;
      v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Changing state to: %@", (uint8_t *)&v20, 0xCu);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningStateManager delegate](self, "delegate"));
    objc_msgSend(v13, "scanningStateManager:didChangeState:", self, self->_currentState);

    os_activity_scope_leave((os_activity_scope_state_t)state);
  }
}

- (void)scanningStateMonitor:(id)a3 didChangeState:(int64_t)a4
{
  char *v6;
  const char *label;
  const char *v8;
  BOOL v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  const __CFString *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  os_activity_scope_state_s v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;

  v6 = (char *)a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v8 = dispatch_queue_get_label(0);
  if (label != v8)
  {
    v9 = !label || v8 == 0;
    if (v9 || strcmp(label, v8))
    {
      v16 = sub_1004318FC();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v24 = "-[VLFScanningStateManager scanningStateMonitor:didChangeState:]";
        v25 = 2080;
        v26 = "VLFScanningStateManager.m";
        v27 = 1024;
        v28 = 147;
        v29 = 2080;
        v30 = "dispatch_get_main_queue()";
        v31 = 2080;
        v32 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v33 = 2080;
        v34 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v18 = sub_1004318FC();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v24 = (const char *)v20;
          v21 = (void *)v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  v10 = objc_claimAutoreleasedReturnValue(-[VLFScanningStateManager activity](self, "activity", 0, 0));
  os_activity_scope_enter(v10, &v22);

  v11 = sub_100608B6C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a4 - 2) > 3)
      v13 = CFSTR("VLFScanningStateInitializing");
    else
      v13 = *(&off_1011BE028 + a4 - 2);
    *(_DWORD *)buf = 138412546;
    v24 = v6;
    v25 = 2112;
    v26 = (const char *)v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@ changed its state to %@", buf, 0x16u);
  }

  if ((id)-[VLFScanningStateManager currentState](self, "currentState") == (id)1)
  {
    v14 = sub_100608B6C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "We haven't finished initializing yet; delaying state update",
        buf,
        2u);
    }

  }
  else
  {
    -[VLFScanningStateManager _recalculateState](self, "_recalculateState");
  }
  os_activity_scope_leave(&v22);

}

- (int64_t)currentState
{
  return self->_currentState;
}

- (GCDTimer)initializingTimer
{
  return self->_initializingTimer;
}

- (void)setInitializingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_initializingTimer, a3);
}

- (ARSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (VLFScanningStateManagerDelegate)delegate
{
  return (VLFScanningStateManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VLFScanningStateCameraMotionMonitor)cameraMotionMonitor
{
  return self->_cameraMotionMonitor;
}

- (void)setCameraMotionMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_cameraMotionMonitor, a3);
}

- (VLFScanningStateCameraPitchMonitor)cameraPitchMonitor
{
  return self->_cameraPitchMonitor;
}

- (void)setCameraPitchMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_cameraPitchMonitor, a3);
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_cameraPitchMonitor, 0);
  objc_storeStrong((id *)&self->_cameraMotionMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_initializingTimer, 0);
}

@end
