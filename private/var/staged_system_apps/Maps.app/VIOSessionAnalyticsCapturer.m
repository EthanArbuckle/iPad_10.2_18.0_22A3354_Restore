@implementation VIOSessionAnalyticsCapturer

- (VIOSessionAnalyticsCapturer)init
{
  VIOSessionAnalyticsCapturer *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VIOSessionAnalyticsCapturer;
  v2 = -[VIOSessionAnalyticsCapturer init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("MapsWalkingEnableImageBasedHeading"), 1, 0);

  }
  return v2;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  objc_super v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_stateManager);
  objc_msgSend(WeakRetained, "removeObserver:", self);

  -[ARSession _removeObserver:](self->_session, "_removeObserver:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("MapsWalkingEnableImageBasedHeading"));

  v5.receiver = self;
  v5.super_class = (Class)VIOSessionAnalyticsCapturer;
  -[VIOSessionAnalyticsCapturer dealloc](&v5, "dealloc");
}

- (void)setStateManager:(id)a3
{
  id v4;
  const char *label;
  const char *v6;
  BOOL v7;
  id WeakRetained;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  char *v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  char *v27;
  id v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  char *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  const char *v49;

  v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v18 = sub_1004318FC();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v39 = "-[VIOSessionAnalyticsCapturer setStateManager:]";
        v40 = 2080;
        v41 = "VIOSessionAnalyticsCapturer.m";
        v42 = 1024;
        v43 = 153;
        v44 = 2080;
        v45 = "dispatch_get_main_queue()";
        v46 = 2080;
        v47 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v48 = 2080;
        v49 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v20 = sub_1004318FC();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v39 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_stateManager);

  if (WeakRetained != v4)
  {
    v9 = sub_10082A4A4();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v39 = "-[VIOSessionAnalyticsCapturer setStateManager:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }

    v11 = objc_loadWeakRetained((id *)&self->_stateManager);
    objc_msgSend(v11, "removeObserver:", self);

    v12 = objc_storeWeak((id *)&self->_stateManager, v4);
    objc_msgSend(v4, "addObserver:", self);

    if (!-[VIOSessionAnalyticsCapturer isRecording](self, "isRecording"))
    {
      v23 = sub_1004318FC();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v39 = "-[VIOSessionAnalyticsCapturer setStateManager:]";
        v40 = 2080;
        v41 = "VIOSessionAnalyticsCapturer.m";
        v42 = 1024;
        v43 = 165;
        v44 = 2080;
        v45 = "self.isRecording";
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
      }

      if (sub_100A70734())
      {
        v25 = sub_1004318FC();
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v39 = v27;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
    if (objc_msgSend(v4, "isDisabled"))
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "disableEventReasons", 0));
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v34 != v16)
              objc_enumerationMutation(v13);
            -[VIOSessionAnalyticsCapturer disableEventReceived:](self, "disableEventReceived:", objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i), "integerValue"));
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v15);
      }

    }
    if (objc_msgSend(v4, "isThrottling"))
    {
      v28 = sub_1004318FC();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v39 = "-[VIOSessionAnalyticsCapturer setStateManager:]";
        v40 = 2080;
        v41 = "VIOSessionAnalyticsCapturer.m";
        v42 = 1024;
        v43 = 173;
        v44 = 2080;
        v45 = "!stateManager.isThrottling";
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
      }

      if (sub_100A70734())
      {
        v30 = sub_1004318FC();
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v32 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v39 = v32;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }

}

- (void)setSession:(id)a3
{
  ARSession *v5;
  const char *label;
  const char *v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  char *v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;

  v5 = (ARSession *)a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v7 = dispatch_queue_get_label(0);
  if (label != v7)
  {
    v8 = !label || v7 == 0;
    if (v8 || strcmp(label, v7))
    {
      v11 = sub_1004318FC();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v16 = 136316418;
        v17 = "-[VIOSessionAnalyticsCapturer setSession:]";
        v18 = 2080;
        v19 = "VIOSessionAnalyticsCapturer.m";
        v20 = 1024;
        v21 = 181;
        v22 = 2080;
        v23 = "dispatch_get_main_queue()";
        v24 = 2080;
        v25 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v26 = 2080;
        v27 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v16,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v13 = sub_1004318FC();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v16 = 138412290;
          v17 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);

        }
      }
    }
  }
  if (self->_session != v5)
  {
    v9 = sub_10082A4A4();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v16 = 136315138;
      v17 = "-[VIOSessionAnalyticsCapturer setSession:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v16, 0xCu);
    }

    -[ARSession _removeObserver:](self->_session, "_removeObserver:", self);
    objc_storeStrong((id *)&self->_session, a3);
    -[ARSession _addObserver:](self->_session, "_addObserver:", self);
  }

}

- (void)startRecording
{
  const char *label;
  const char *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  char *v19;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v15 = sub_1004318FC();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v20 = 136316418;
        v21 = "-[VIOSessionAnalyticsCapturer startRecording]";
        v22 = 2080;
        v23 = "VIOSessionAnalyticsCapturer.m";
        v24 = 1024;
        v25 = 198;
        v26 = 2080;
        v27 = "dispatch_get_main_queue()";
        v28 = 2080;
        v29 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v30 = 2080;
        v31 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v20,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v17 = sub_1004318FC();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v20 = 138412290;
          v21 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v20, 0xCu);

        }
      }
    }
  }
  v6 = sub_10082A4A4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v20 = 136315138;
    v21 = "-[VIOSessionAnalyticsCapturer startRecording]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v20, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionAnalyticsCapturer lastRecordingStartDate](self, "lastRecordingStartDate"));
  if (v8)
  {
    v9 = sub_10082A4A4();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Tried to start recording when we're already recording; ignoring",
        (uint8_t *)&v20,
        2u);
    }

  }
  else
  {
    -[VIOSessionAnalyticsCapturer setShouldBeRecording:](self, "setShouldBeRecording:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[VIOSessionAnalyticsCapturer setLastRecordingStartDate:](self, "setLastRecordingStartDate:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[VIOSessionAnalyticsCapturer setRecordedEntries:](self, "setRecordedEntries:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v14 = objc_msgSend(v13, "BOOLForKey:", CFSTR("MapsWalkingEnableImageBasedHeading"));

    if ((v14 & 1) != 0)
    {
      -[VIOSessionAnalyticsCapturer setIsInitializing:](self, "setIsInitializing:", 1);
      -[VIOSessionAnalyticsCapturer setDidRecordInitializing:](self, "setDidRecordInitializing:", 0);
    }
    else
    {
      -[VIOSessionAnalyticsCapturer createEntryForUsageType:value:](self, "createEntryForUsageType:value:", 5, 0);
    }
  }
}

- (void)pauseRecording
{
  const char *label;
  const char *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  char *v12;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v8 = sub_1004318FC();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v13 = 136316418;
        v14 = "-[VIOSessionAnalyticsCapturer pauseRecording]";
        v15 = 2080;
        v16 = "VIOSessionAnalyticsCapturer.m";
        v17 = 1024;
        v18 = 222;
        v19 = 2080;
        v20 = "dispatch_get_main_queue()";
        v21 = 2080;
        v22 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v23 = 2080;
        v24 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v13,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v10 = sub_1004318FC();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v13 = 138412290;
          v14 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);

        }
      }
    }
  }
  v6 = sub_10082A4A4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v13 = 136315138;
    v14 = "-[VIOSessionAnalyticsCapturer pauseRecording]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v13, 0xCu);
  }

  if (-[VIOSessionAnalyticsCapturer isRecording](self, "isRecording"))
  {
    if (!-[VIOSessionAnalyticsCapturer isPaused](self, "isPaused"))
    {
      -[VIOSessionAnalyticsCapturer setPaused:](self, "setPaused:", 1);
      -[VIOSessionAnalyticsCapturer stopRecordingWithExitReason:](self, "stopRecordingWithExitReason:", 18);
    }
  }
}

- (void)resumeRecording
{
  const char *label;
  const char *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  char *v12;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v8 = sub_1004318FC();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v13 = 136316418;
        v14 = "-[VIOSessionAnalyticsCapturer resumeRecording]";
        v15 = 2080;
        v16 = "VIOSessionAnalyticsCapturer.m";
        v17 = 1024;
        v18 = 241;
        v19 = 2080;
        v20 = "dispatch_get_main_queue()";
        v21 = 2080;
        v22 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v23 = 2080;
        v24 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v13,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v10 = sub_1004318FC();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v13 = 138412290;
          v14 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);

        }
      }
    }
  }
  v6 = sub_10082A4A4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v13 = 136315138;
    v14 = "-[VIOSessionAnalyticsCapturer resumeRecording]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v13, 0xCu);
  }

  if (-[VIOSessionAnalyticsCapturer isPaused](self, "isPaused")
    && !-[VIOSessionAnalyticsCapturer isRecording](self, "isRecording"))
  {
    -[VIOSessionAnalyticsCapturer setPaused:](self, "setPaused:", 0);
    if (-[VIOSessionAnalyticsCapturer shouldBeRecording](self, "shouldBeRecording"))
      -[VIOSessionAnalyticsCapturer startRecording](self, "startRecording");
  }
}

- (void)stopRecording
{
  -[VIOSessionAnalyticsCapturer stopRecordingWithExitReason:](self, "stopRecordingWithExitReason:", 15);
  -[VIOSessionAnalyticsCapturer setShouldBeRecording:](self, "setShouldBeRecording:", 0);
}

- (void)stopRecordingWithExitReason:(int)a3
{
  uint64_t v3;
  const char *label;
  const char *v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  char *v19;
  id v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  id v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  char *v33;
  int v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  const char *v45;

  v3 = *(_QWORD *)&a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v29 = sub_1004318FC();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v34 = 136316418;
        v35 = "-[VIOSessionAnalyticsCapturer stopRecordingWithExitReason:]";
        v36 = 2080;
        v37 = "VIOSessionAnalyticsCapturer.m";
        v38 = 1024;
        v39 = 271;
        v40 = 2080;
        v41 = "dispatch_get_main_queue()";
        v42 = 2080;
        v43 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v44 = 2080;
        v45 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v34,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v31 = sub_1004318FC();
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v34 = 138412290;
          v35 = v33;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v34, 0xCu);

        }
      }
    }
  }
  v8 = sub_10082A4A4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v34 = 136315138;
    v35 = "-[VIOSessionAnalyticsCapturer stopRecordingWithExitReason:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v34, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionAnalyticsCapturer session](self, "session"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "configuration"));
  v12 = objc_msgSend(v11, "isVLF");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionAnalyticsCapturer stateManager](self, "stateManager"));
  objc_msgSend(v13, "removeObserver:", self);

  -[VIOSessionAnalyticsCapturer setStateManager:](self, "setStateManager:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionAnalyticsCapturer session](self, "session"));
  objc_msgSend(v14, "_removeObserver:", self);

  -[VIOSessionAnalyticsCapturer setSession:](self, "setSession:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionAnalyticsCapturer recordedEntries](self, "recordedEntries"));
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    -[VIOSessionAnalyticsCapturer completeInFlightEntriesWithExitReason:](self, "completeInFlightEntriesWithExitReason:", v3);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionAnalyticsCapturer recordedEntries](self, "recordedEntries"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allObjects"));
    v19 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "sortedArrayUsingComparator:", &stru_1011D8850));

    v20 = sub_10082A4A4();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v34 = 138477827;
      v35 = v19;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Captured entries: %{private}@", (uint8_t *)&v34, 0xCu);
    }

    v22 = sub_10039DCD4(v19, &stru_1011D8890);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionAnalyticsCapturer lastRecordingStartDate](self, "lastRecordingStartDate"));
    objc_msgSend(v24, "timeIntervalSinceDate:", v25);
    v27 = ceil(v26);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v27));
    +[GEOAPPortal captureMarcoLiteWithTotalNavTime:usageStates:vioTrigger:](GEOAPPortal, "captureMarcoLiteWithTotalNavTime:usageStates:vioTrigger:", v28, v23, v12);

  }
  -[VIOSessionAnalyticsCapturer setLastRecordingStartDate:](self, "setLastRecordingStartDate:", 0);
  -[VIOSessionAnalyticsCapturer setRecordedEntries:](self, "setRecordedEntries:", 0);
  -[VIOSessionAnalyticsCapturer setIsInitializing:](self, "setIsInitializing:", 0);
  -[VIOSessionAnalyticsCapturer setDidRecordInitializing:](self, "setDidRecordInitializing:", 0);
}

- (BOOL)isRecording
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionAnalyticsCapturer lastRecordingStartDate](self, "lastRecordingStartDate"));
  v3 = v2 != 0;

  return v3;
}

- (void)createEntryForUsageType:(int)a3 value:(id)a4
{
  uint64_t v4;
  id v6;
  const char *label;
  const char *v8;
  BOOL v9;
  void *v10;
  id v11;
  VIOSessionAnalyticsEntry *v12;
  id v13;
  NSObject *v14;
  __CFString *v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  void *v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v8 = dispatch_queue_get_label(0);
  if (label != v8)
  {
    v9 = !label || v8 == 0;
    if (v9 || strcmp(label, v8))
    {
      v17 = sub_1004318FC();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v28 = (uint64_t)"-[VIOSessionAnalyticsCapturer createEntryForUsageType:value:]";
        v29 = 2080;
        v30 = "VIOSessionAnalyticsCapturer.m";
        v31 = 1024;
        v32 = 317;
        v33 = 2080;
        v34 = "dispatch_get_main_queue()";
        v35 = 2080;
        v36 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v37 = 2080;
        v38 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v19 = sub_1004318FC();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v28 = (uint64_t)v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  if (!-[VIOSessionAnalyticsCapturer isRecording](self, "isRecording"))
  {
    v22 = sub_1004318FC();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v28 = (uint64_t)"-[VIOSessionAnalyticsCapturer createEntryForUsageType:value:]";
      v29 = 2080;
      v30 = "VIOSessionAnalyticsCapturer.m";
      v31 = 1024;
      v32 = 319;
      v33 = 2080;
      v34 = "self.isRecording";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v24 = sub_1004318FC();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v28 = (uint64_t)v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionAnalyticsCapturer recordedEntries](self, "recordedEntries"));
  v11 = objc_msgSend(v10, "count");

  if ((unint64_t)v11 <= 0xF9)
  {
    v12 = -[VIOSessionAnalyticsEntry initWithUsageType:value:]([VIOSessionAnalyticsEntry alloc], "initWithUsageType:value:", v4, v6);
    v13 = sub_10082A4A4();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      v28 = (uint64_t)v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Creating new entry: %{private}@", buf, 0xCu);
    }

    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(-[VIOSessionAnalyticsCapturer recordedEntries](self, "recordedEntries"));
    -[__CFString addObject:](v15, "addObject:", v12);
    goto LABEL_17;
  }
  v16 = sub_10082A4A4();
  v12 = (VIOSessionAnalyticsEntry *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_DEBUG))
  {
    if (v4 >= 0x1A)
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v4));
    else
      v15 = off_1011D88D0[(int)v4];
    *(_DWORD *)buf = 134218242;
    v28 = 250;
    v29 = 2112;
    v30 = (const char *)v15;
    _os_log_impl((void *)&_mh_execute_header, &v12->super, OS_LOG_TYPE_DEBUG, "Reached entry limit (%lu) for a single nav session. Ignoring entry of type: %@", buf, 0x16u);
LABEL_17:

  }
}

- (void)completeInFlightEntriesWithExitReason:(int)a3
{
  uint64_t v3;
  const char *label;
  const char *v6;
  BOOL v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  char *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;

  v3 = *(_QWORD *)&a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v18 = sub_1004318FC();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v30 = "-[VIOSessionAnalyticsCapturer completeInFlightEntriesWithExitReason:]";
        v31 = 2080;
        v32 = "VIOSessionAnalyticsCapturer.m";
        v33 = 1024;
        v34 = 332;
        v35 = 2080;
        v36 = "dispatch_get_main_queue()";
        v37 = 2080;
        v38 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v39 = 2080;
        v40 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v20 = sub_1004318FC();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v30 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionAnalyticsCapturer recordedEntries](self, "recordedEntries"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v25;
    *(_QWORD *)&v11 = 138477827;
    v23 = v11;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v15, "isComplete", v23) & 1) == 0)
        {
          objc_msgSend(v15, "completeEntryWithReason:", v3);
          v16 = sub_10082A4A4();
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v23;
            v30 = (const char *)v15;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Completing entry: %{private}@", buf, 0xCu);
          }

        }
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v12);
  }

}

- (void)completeInFlightEntriesForUsageType:(int)a3 withExitReason:(int)a4
{
  uint64_t v4;
  const char *label;
  const char *v8;
  BOOL v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  char *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  const char *v42;

  v4 = *(_QWORD *)&a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v8 = dispatch_queue_get_label(0);
  if (label != v8)
  {
    v9 = !label || v8 == 0;
    if (v9 || strcmp(label, v8))
    {
      v20 = sub_1004318FC();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v32 = "-[VIOSessionAnalyticsCapturer completeInFlightEntriesForUsageType:withExitReason:]";
        v33 = 2080;
        v34 = "VIOSessionAnalyticsCapturer.m";
        v35 = 1024;
        v36 = 344;
        v37 = 2080;
        v38 = "dispatch_get_main_queue()";
        v39 = 2080;
        v40 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v41 = 2080;
        v42 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v22 = sub_1004318FC();
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v32 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionAnalyticsCapturer recordedEntries](self, "recordedEntries"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allObjects"));

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v27;
    *(_QWORD *)&v13 = 138477827;
    v25 = v13;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v17, "isComplete", v25) & 1) == 0
          && objc_msgSend(v17, "usageType") == a3)
        {
          objc_msgSend(v17, "completeEntryWithReason:", v4);
          v18 = sub_10082A4A4();
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v25;
            v32 = (const char *)v17;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Completing entry: %{private}@", buf, 0xCu);
          }

        }
      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v14);
  }

}

- (void)completeInFlightEntriesExcluding:(id)a3 withExitReason:(int)a4
{
  uint64_t v4;
  id v6;
  const char *label;
  const char *v8;
  BOOL v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  char *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  const char *v44;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v8 = dispatch_queue_get_label(0);
  if (label != v8)
  {
    v9 = !label || v8 == 0;
    if (v9 || strcmp(label, v8))
    {
      v22 = sub_1004318FC();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v34 = "-[VIOSessionAnalyticsCapturer completeInFlightEntriesExcluding:withExitReason:]";
        v35 = 2080;
        v36 = "VIOSessionAnalyticsCapturer.m";
        v37 = 1024;
        v38 = 356;
        v39 = 2080;
        v40 = "dispatch_get_main_queue()";
        v41 = 2080;
        v42 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v43 = 2080;
        v44 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v24 = sub_1004318FC();
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v34 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionAnalyticsCapturer recordedEntries](self, "recordedEntries"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allObjects"));

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v29;
    *(_QWORD *)&v13 = 138477827;
    v27 = v13;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v17, "isComplete", v27) & 1) == 0)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v17, "usageType")));
          v19 = objc_msgSend(v6, "containsObject:", v18);

          if ((v19 & 1) == 0)
          {
            objc_msgSend(v17, "completeEntryWithReason:", v4);
            v20 = sub_10082A4A4();
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v27;
              v34 = (const char *)v17;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Completing entry: %{private}@", buf, 0xCu);
            }

          }
        }
      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v14);
  }

}

- (BOOL)hasInFlightEntryWithUsageType:(int)a3
{
  const char *label;
  const char *v6;
  BOOL v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  BOOL v15;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  char *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v17 = sub_1004318FC();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v28 = "-[VIOSessionAnalyticsCapturer hasInFlightEntryWithUsageType:]";
        v29 = 2080;
        v30 = "VIOSessionAnalyticsCapturer.m";
        v31 = 1024;
        v32 = 368;
        v33 = 2080;
        v34 = "dispatch_get_main_queue()";
        v35 = 2080;
        v36 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v37 = 2080;
        v38 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v19 = sub_1004318FC();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v28 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionAnalyticsCapturer recordedEntries](self, "recordedEntries", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v14, "usageType") == a3 && !objc_msgSend(v14, "isComplete"))
        {
          v15 = 1;
          goto LABEL_18;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v11)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_18:

  return v15;
}

- (void)throttleDidBeginWithEvent:(int64_t)a3
{
  const char *label;
  const char *v6;
  BOOL v7;
  double Double;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  int v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v12 = sub_1004318FC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v17 = 136316418;
        v18 = "-[VIOSessionAnalyticsCapturer throttleDidBeginWithEvent:]";
        v19 = 2080;
        v20 = "VIOSessionAnalyticsCapturer.m";
        v21 = 1024;
        v22 = 383;
        v23 = 2080;
        v24 = "dispatch_get_main_queue()";
        v25 = 2080;
        v26 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v27 = 2080;
        v28 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v17,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v14 = sub_1004318FC();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v17 = 138412290;
          v18 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);

        }
      }
    }
  }
  Double = GEOConfigGetDouble(MapsConfig_OpticalHeadingSessionThrottlerConsecutiveEventTimeout, off_1014B3438);
  if (a3)
    v9 = 1;
  else
    v9 = 2;
  if (-[VIOSessionAnalyticsCapturer isInitializing](self, "isInitializing"))
    v10 = 16;
  else
    v10 = v9;
  -[VIOSessionAnalyticsCapturer completeInFlightEntriesWithExitReason:](self, "completeInFlightEntriesWithExitReason:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Double));
  -[VIOSessionAnalyticsCapturer createEntryForUsageType:value:](self, "createEntryForUsageType:value:", v9, v11);

}

- (void)throttleDidEnd
{
  const char *label;
  const char *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  char *v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v6 = sub_1004318FC();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v11 = 136316418;
        v12 = "-[VIOSessionAnalyticsCapturer throttleDidEnd]";
        v13 = 2080;
        v14 = "VIOSessionAnalyticsCapturer.m";
        v15 = 1024;
        v16 = 399;
        v17 = 2080;
        v18 = "dispatch_get_main_queue()";
        v19 = 2080;
        v20 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v21 = 2080;
        v22 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v11,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v8 = sub_1004318FC();
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v11 = 138412290;
          v12 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v11, 0xCu);

        }
      }
    }
  }
  -[VIOSessionAnalyticsCapturer completeInFlightEntriesWithExitReason:](self, "completeInFlightEntriesWithExitReason:", 13);
  -[VIOSessionAnalyticsCapturer setIsInitializing:](self, "setIsInitializing:", 1);
  -[VIOSessionAnalyticsCapturer setDidRecordInitializing:](self, "setDidRecordInitializing:", 0);
}

- (void)disableEventReceived:(int64_t)a3
{
  const char *label;
  const char *v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  __CFString *v13;
  uint64_t v14;
  uint64_t *v15;
  NSNumber *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  char *v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  char *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v18 = sub_1004318FC();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v29 = "-[VIOSessionAnalyticsCapturer disableEventReceived:]";
        v30 = 2080;
        v31 = "VIOSessionAnalyticsCapturer.m";
        v32 = 1024;
        v33 = 409;
        v34 = 2080;
        v35 = "dispatch_get_main_queue()";
        v36 = 2080;
        v37 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v38 = 2080;
        v39 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v20 = sub_1004318FC();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v29 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  if ((unint64_t)(a3 - 1) > 9)
    v8 = 0;
  else
    v8 = dword_100E3C080[a3 - 1];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v8));
  v10 = objc_msgSend(&off_101273E00, "containsObject:", v9);

  if ((v10 & 1) == 0)
  {
    v23 = sub_1004318FC();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v29 = "-[VIOSessionAnalyticsCapturer disableEventReceived:]";
      v30 = 2080;
      v31 = "VIOSessionAnalyticsCapturer.m";
      v32 = 1024;
      v33 = 427;
      v34 = 2080;
      v35 = "[allDisableEvents containsObject:@(usageType)]";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v25 = sub_1004318FC();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v29 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (-[VIOSessionAnalyticsCapturer hasInFlightEntryWithUsageType:](self, "hasInFlightEntryWithUsageType:", v8))
  {
    v11 = sub_10082A4A4();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      if (v8 >= 0x19)
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v8));
      else
        v13 = off_1011D89A0[(int)v8];
      *(_DWORD *)buf = 138477827;
      v29 = (const char *)v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Already tracking an in-flight disable event entry with usage type: %{private}@; ignoring event",
        buf,
        0xCu);

    }
  }
  else
  {
    if (-[VIOSessionAnalyticsCapturer isInitializing](self, "isInitializing"))
      v14 = 16;
    else
      v14 = v8;
    -[VIOSessionAnalyticsCapturer completeInFlightEntriesExcluding:withExitReason:](self, "completeInFlightEntriesExcluding:withExitReason:", &off_101273E00, v14);
    switch(a3)
    {
      case 0:
      case 4:
      case 5:
      case 7:
      case 10:
        -[VIOSessionAnalyticsCapturer createEntryForUsageType:value:](self, "createEntryForUsageType:value:", v8, 0);
        return;
      case 1:
        v15 = &MapsConfig_OpticalHeadingSessionThrottlerBatteryLevelThreshold;
        goto LABEL_29;
      case 2:
        v15 = &MapsConfig_OpticalHeadingSessionThrottlerDailyUsageLimit;
        goto LABEL_29;
      case 3:
        v15 = &MapsConfig_OpticalHeadingSessionThrottlerSunsetSunriseOffsetThreshold;
        goto LABEL_29;
      case 6:
        v15 = &MapsConfig_VLFVIOTeardownLocationAccuracyThreshold;
        goto LABEL_29;
      case 8:
        v15 = &MapsConfig_VLFVIOTeardownTimeout;
        goto LABEL_29;
      case 9:
        v15 = &MapsConfig_VLFVIOTeardownDistanceThreshold;
LABEL_29:
        v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", GEOConfigGetDouble(*v15, v15[1]));
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        -[VIOSessionAnalyticsCapturer createEntryForUsageType:value:](self, "createEntryForUsageType:value:", v8, v17);

        break;
      default:
        return;
    }
  }
}

- (void)disableEventReset:(int64_t)a3
{
  const char *label;
  const char *v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  char *v17;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v13 = sub_1004318FC();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v18 = 136316418;
        v19 = "-[VIOSessionAnalyticsCapturer disableEventReset:]";
        v20 = 2080;
        v21 = "VIOSessionAnalyticsCapturer.m";
        v22 = 1024;
        v23 = 492;
        v24 = 2080;
        v25 = "dispatch_get_main_queue()";
        v26 = 2080;
        v27 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v28 = 2080;
        v29 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v18,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v15 = sub_1004318FC();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v18 = 138412290;
          v19 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v18, 0xCu);

        }
      }
    }
  }
  if ((unint64_t)(a3 - 1) > 9)
    v8 = 0;
  else
    v8 = dword_100E3C080[a3 - 1];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionAnalyticsCapturer stateManager](self, "stateManager"));
  if (objc_msgSend(v9, "isDisabled"))
    v10 = v8;
  else
    v10 = 13;

  -[VIOSessionAnalyticsCapturer completeInFlightEntriesForUsageType:withExitReason:](self, "completeInFlightEntriesForUsageType:withExitReason:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionAnalyticsCapturer stateManager](self, "stateManager"));
  v12 = objc_msgSend(v11, "isDisabled");

  if ((v12 & 1) == 0)
  {
    -[VIOSessionAnalyticsCapturer setIsInitializing:](self, "setIsInitializing:", 1);
    -[VIOSessionAnalyticsCapturer setDidRecordInitializing:](self, "setDidRecordInitializing:", 0);
  }
}

- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  char *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;

  v5 = a4;
  if (-[VIOSessionAnalyticsCapturer isPaused](self, "isPaused"))
  {
    v7 = sub_1004318FC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v15 = "-[VIOSessionAnalyticsCapturer session:cameraDidChangeTrackingState:]";
      v16 = 2080;
      v17 = "VIOSessionAnalyticsCapturer.m";
      v18 = 1024;
      v19 = 512;
      v20 = 2080;
      v21 = "!self.isPaused";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10082D120;
  v12[3] = &unk_1011AC8B0;
  v12[4] = self;
  v13 = v5;
  v6 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);

}

- (void)sessionWasInterrupted:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10082D4D8;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)sessionInterruptionEnded:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10082D564;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  _QWORD v4[6];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10082D5CC;
  v4[3] = &unk_1011AD518;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  if (v13 != v11)
  {

LABEL_6:
    v17.receiver = self;
    v17.super_class = (Class)VIOSessionAnalyticsCapturer;
    -[VIOSessionAnalyticsCapturer observeValueForKeyPath:ofObject:change:context:](&v17, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
    goto LABEL_7;
  }
  v14 = objc_msgSend(v10, "isEqualToString:", CFSTR("MapsWalkingEnableImageBasedHeading"));

  if (!v14)
    goto LABEL_6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", NSKeyValueChangeNewKey));
  v16 = objc_msgSend(v15, "BOOLValue");

  if (v16)
    -[VIOSessionAnalyticsCapturer createEntryForUsageType:value:](self, "createEntryForUsageType:value:", 5, 0);
  else
    -[VIOSessionAnalyticsCapturer completeInFlightEntriesForUsageType:withExitReason:](self, "completeInFlightEntriesForUsageType:withExitReason:", 5, 5);
LABEL_7:

}

- (VIOSessionStateManager)stateManager
{
  return (VIOSessionStateManager *)objc_loadWeakRetained((id *)&self->_stateManager);
}

- (ARSession)session
{
  return self->_session;
}

- (RoutePlanningSession)currentRoutePlanningSession
{
  return self->_currentRoutePlanningSession;
}

- (void)setCurrentRoutePlanningSession:(id)a3
{
  objc_storeStrong((id *)&self->_currentRoutePlanningSession, a3);
}

- (NavigationSession)currentNavigationSession
{
  return self->_currentNavigationSession;
}

- (void)setCurrentNavigationSession:(id)a3
{
  objc_storeStrong((id *)&self->_currentNavigationSession, a3);
}

- (NSMutableSet)recordedEntries
{
  return self->_recordedEntries;
}

- (void)setRecordedEntries:(id)a3
{
  objc_storeStrong((id *)&self->_recordedEntries, a3);
}

- (NSDate)lastRecordingStartDate
{
  return self->_lastRecordingStartDate;
}

- (void)setLastRecordingStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastRecordingStartDate, a3);
}

- (BOOL)isInitializing
{
  return self->_isInitializing;
}

- (void)setIsInitializing:(BOOL)a3
{
  self->_isInitializing = a3;
}

- (BOOL)didRecordInitializing
{
  return self->_didRecordInitializing;
}

- (void)setDidRecordInitializing:(BOOL)a3
{
  self->_didRecordInitializing = a3;
}

- (BOOL)shouldBeRecording
{
  return self->_shouldBeRecording;
}

- (void)setShouldBeRecording:(BOOL)a3
{
  self->_shouldBeRecording = a3;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRecordingStartDate, 0);
  objc_storeStrong((id *)&self->_recordedEntries, 0);
  objc_storeStrong((id *)&self->_currentNavigationSession, 0);
  objc_storeStrong((id *)&self->_currentRoutePlanningSession, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_stateManager);
}

@end
