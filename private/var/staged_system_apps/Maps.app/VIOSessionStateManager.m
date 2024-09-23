@implementation VIOSessionStateManager

- (VIOSessionStateManager)initWithSession:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  VIOSessionStateManager *v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  NSString *v12;
  char *v13;
  uint64_t v14;
  NSMutableDictionary *stateEnteredThrottleEventTimers;
  uint64_t v16;
  NSMutableSet *activeDisableEvents;
  GEOObserverHashTable *v18;
  GEOObserverHashTable *observers;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  char *v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  char *v30;
  objc_super v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  const char *v39;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v21 = sub_1004318FC();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v33 = "-[VIOSessionStateManager initWithSession:configuration:]";
      v34 = 2080;
      v35 = "VIOSessionStateManager.m";
      v36 = 1024;
      v37 = 48;
      v38 = 2080;
      v39 = "session != nil";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v23 = sub_1004318FC();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v33 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v7)
  {
    v26 = sub_1004318FC();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v33 = "-[VIOSessionStateManager initWithSession:configuration:]";
      v34 = 2080;
      v35 = "VIOSessionStateManager.m";
      v36 = 1024;
      v37 = 49;
      v38 = 2080;
      v39 = "configuration != nil";
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v28 = sub_1004318FC();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v33 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v31.receiver = self;
  v31.super_class = (Class)VIOSessionStateManager;
  v8 = -[VIOSessionStateManager init](&v31, "init");
  if (v8)
  {
    v9 = sub_1008F0F04();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (objc_class *)objc_opt_class(v8);
      v12 = NSStringFromClass(v11);
      v13 = (char *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 134349314;
      v33 = (const char *)v8;
      v34 = 2112;
      v35 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Enabling %@", buf, 0x16u);

    }
    objc_storeWeak((id *)&v8->_session, v6);
    objc_storeStrong((id *)&v8->_configuration, a4);
    v14 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    stateEnteredThrottleEventTimers = v8->_stateEnteredThrottleEventTimers;
    v8->_stateEnteredThrottleEventTimers = (NSMutableDictionary *)v14;

    v16 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    activeDisableEvents = v8->_activeDisableEvents;
    v8->_activeDisableEvents = (NSMutableSet *)v16;

    v18 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___VIOSessionStateManagerObserver, 0);
    observers = v8->_observers;
    v8->_observers = v18;

  }
  return v8;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  VIOSessionStateManager *v12;
  __int16 v13;
  void *v14;

  v3 = sub_1008F0F04();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class(self);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    *(_DWORD *)buf = 134349314;
    v12 = self;
    v13 = 2112;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Disabling %@", buf, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "technique"));
  objc_msgSend(v9, "setVioThrottled:", 0);

  v10.receiver = self;
  v10.super_class = (Class)VIOSessionStateManager;
  -[VIOSessionStateManager dealloc](&v10, "dealloc");
}

- (void)recordStateEnteredThrottleEvent:(int64_t)a3
{
  const char *label;
  const char *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  const __CFString *v15;
  const __CFString *v16;
  double Double;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  VIOSessionStateManager *v25;
  _QWORD v26[4];
  id v27[3];
  uint8_t buf[4];
  VIOSessionStateManager *v29;
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
      v21 = sub_1004318FC();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v29 = (VIOSessionStateManager *)"-[VIOSessionStateManager recordStateEnteredThrottleEvent:]";
        v30 = 2080;
        v31 = "VIOSessionStateManager.m";
        v32 = 1024;
        v33 = 78;
        v34 = 2080;
        v35 = "dispatch_get_main_queue()";
        v36 = 2080;
        v37 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v38 = 2080;
        v39 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v23 = sub_1004318FC();
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = (VIOSessionStateManager *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v29 = v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  if (!-[VIOSessionStateManager isThrottlingOrDisabled](self, "isThrottlingOrDisabled"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateManager stateEnteredThrottleEventTimers](self, "stateEnteredThrottleEventTimers"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v9));
    v11 = v10 == 0;

    v12 = sub_1008F0F04();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = v13;
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v16 = CFSTR("VIOSessionThrottleEventDeviceMotion");
        if (!a3)
          v16 = CFSTR("VIOSessionThrottleEventARTrackingState");
        *(_DWORD *)buf = 134349314;
        v29 = self;
        v30 = 2112;
        v31 = (const char *)v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%{public}p] Recording a new consecutive throttle event of type %@", buf, 0x16u);
      }

      Double = GEOConfigGetDouble(MapsConfig_OpticalHeadingSessionThrottlerConsecutiveEventTimeout, off_1014B3438);
      objc_initWeak((id *)buf, self);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1008F147C;
      v26[3] = &unk_1011BF1C8;
      objc_copyWeak(v27, (id *)buf);
      v27[1] = (id)a3;
      v27[2] = *(id *)&Double;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v26, Double));

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateManager stateEnteredThrottleEventTimers](self, "stateEnteredThrottleEventTimers"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
      objc_msgSend(v19, "setObject:forKey:", v18, v20);

      objc_destroyWeak(v27);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v15 = CFSTR("VIOSessionThrottleEventDeviceMotion");
        if (!a3)
          v15 = CFSTR("VIOSessionThrottleEventARTrackingState");
        *(_DWORD *)buf = 134349314;
        v29 = self;
        v30 = 2112;
        v31 = (const char *)v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[%{public}p] Recording another consecutive throttle event of type %@", buf, 0x16u);
      }

    }
  }
}

- (void)resetStateEnteredThrottleEvent:(int64_t)a3
{
  const char *label;
  const char *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  VIOSessionStateManager *v20;
  int v21;
  VIOSessionStateManager *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v16 = sub_1004318FC();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v21 = 136316418;
        v22 = (VIOSessionStateManager *)"-[VIOSessionStateManager resetStateEnteredThrottleEvent:]";
        v23 = 2080;
        v24 = "VIOSessionStateManager.m";
        v25 = 1024;
        v26 = 102;
        v27 = 2080;
        v28 = "dispatch_get_main_queue()";
        v29 = 2080;
        v30 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v31 = 2080;
        v32 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v21,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v18 = sub_1004318FC();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = (VIOSessionStateManager *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v21 = 138412290;
          v22 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v21, 0xCu);

        }
      }
    }
  }
  if (!-[VIOSessionStateManager isThrottlingOrDisabled](self, "isThrottlingOrDisabled"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateManager stateEnteredThrottleEventTimers](self, "stateEnteredThrottleEventTimers"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v9));

    if (v10)
    {
      v11 = sub_1008F0F04();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = CFSTR("VIOSessionThrottleEventDeviceMotion");
        if (!a3)
          v13 = CFSTR("VIOSessionThrottleEventARTrackingState");
        v21 = 134349314;
        v22 = self;
        v23 = 2112;
        v24 = (const char *)v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] Resetting consecutive throttle event timeout timer for event of type %@", (uint8_t *)&v21, 0x16u);
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateManager stateEnteredThrottleEventTimers](self, "stateEnteredThrottleEventTimers"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
      objc_msgSend(v14, "removeObjectForKey:", v15);

    }
  }
}

- (void)recordSessionDisableEvent:(int64_t)a3
{
  const char *label;
  const char *v6;
  BOOL v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  const __CFString *v14;
  const __CFString *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  void *v28;
  _BYTE v29[24];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v24 = sub_1004318FC();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v29 = 136316418;
        *(_QWORD *)&v29[4] = "-[VIOSessionStateManager recordSessionDisableEvent:]";
        *(_WORD *)&v29[12] = 2080;
        *(_QWORD *)&v29[14] = "VIOSessionStateManager.m";
        *(_WORD *)&v29[22] = 1024;
        v30 = 117;
        v31 = 2080;
        v32 = "dispatch_get_main_queue()";
        v33 = 2080;
        v34 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v35 = 2080;
        v36 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          v29,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v26 = sub_1004318FC();
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)v29 = 138412290;
          *(_QWORD *)&v29[4] = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@", v29, 0xCu);

        }
      }
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateManager activeDisableEvents](self, "activeDisableEvents"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v10 = objc_msgSend(v8, "containsObject:", v9);

  v11 = sub_1008F0F04();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if ((v10 & 1) != 0)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      goto LABEL_19;
    if ((unint64_t)(a3 - 1) > 9)
      v14 = CFSTR("VIOSessionDisableEventLowPowerMode");
    else
      v14 = off_1011DB728[a3 - 1];
    *(_DWORD *)v29 = 134349314;
    *(_QWORD *)&v29[4] = self;
    *(_WORD *)&v29[12] = 2112;
    *(_QWORD *)&v29[14] = v14;
    v16 = "[%{public}p] Recording another disable event of type %@";
    v17 = v13;
    v18 = OS_LOG_TYPE_DEBUG;
  }
  else
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      goto LABEL_19;
    if ((unint64_t)(a3 - 1) > 9)
      v15 = CFSTR("VIOSessionDisableEventLowPowerMode");
    else
      v15 = off_1011DB728[a3 - 1];
    *(_DWORD *)v29 = 134349314;
    *(_QWORD *)&v29[4] = self;
    *(_WORD *)&v29[12] = 2112;
    *(_QWORD *)&v29[14] = v15;
    v16 = "[%{public}p] Recording the first disable event of type %@";
    v17 = v13;
    v18 = OS_LOG_TYPE_INFO;
  }
  _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, v29, 0x16u);
LABEL_19:

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateManager activeDisableEvents](self, "activeDisableEvents"));
  v20 = objc_msgSend(v19, "count");

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateManager activeDisableEvents](self, "activeDisableEvents"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  objc_msgSend(v21, "addObject:", v22);

  if (!v20)
    -[VIOSessionStateManager disableSession](self, "disableSession");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateManager observers](self, "observers", *(_OWORD *)v29, *(_QWORD *)&v29[16]));
  objc_msgSend(v23, "disableEventReceived:", a3);

}

- (void)resetSessionDisableEvent:(int64_t)a3
{
  const char *label;
  const char *v6;
  BOOL v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  VIOSessionStateManager *v27;
  int v28;
  VIOSessionStateManager *v29;
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
      v23 = sub_1004318FC();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v28 = 136316418;
        v29 = (VIOSessionStateManager *)"-[VIOSessionStateManager resetSessionDisableEvent:]";
        v30 = 2080;
        v31 = "VIOSessionStateManager.m";
        v32 = 1024;
        v33 = 137;
        v34 = 2080;
        v35 = "dispatch_get_main_queue()";
        v36 = 2080;
        v37 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v38 = 2080;
        v39 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v28,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v25 = sub_1004318FC();
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = (VIOSessionStateManager *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v28 = 138412290;
          v29 = v27;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v28, 0xCu);

        }
      }
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateManager activeDisableEvents](self, "activeDisableEvents"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v10 = objc_msgSend(v8, "containsObject:", v9);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateManager activeDisableEvents](self, "activeDisableEvents"));
    v12 = objc_msgSend(v11, "count");

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateManager activeDisableEvents](self, "activeDisableEvents"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    objc_msgSend(v13, "removeObject:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateManager activeDisableEvents](self, "activeDisableEvents"));
    v16 = objc_msgSend(v15, "count");

    v17 = sub_1008F0F04();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = v18;
    if (v16 || !v12)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        if ((unint64_t)(a3 - 1) > 9)
          v21 = CFSTR("VIOSessionDisableEventLowPowerMode");
        else
          v21 = off_1011DB728[a3 - 1];
        v28 = 134349314;
        v29 = self;
        v30 = 2112;
        v31 = (const char *)v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "[%{public}p] Resetting disable event of type %@", (uint8_t *)&v28, 0x16u);
      }

    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        if ((unint64_t)(a3 - 1) > 9)
          v20 = CFSTR("VIOSessionDisableEventLowPowerMode");
        else
          v20 = off_1011DB728[a3 - 1];
        v28 = 134349314;
        v29 = self;
        v30 = 2112;
        v31 = (const char *)v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{public}p] Resetting the last disable event after type %@", (uint8_t *)&v28, 0x16u);
      }

      -[VIOSessionStateManager resumeSession](self, "resumeSession");
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateManager observers](self, "observers"));
    objc_msgSend(v22, "disableEventReset:", a3);

  }
}

- (BOOL)isThrottling
{
  const char *label;
  const char *v4;
  BOOL v5;
  void *v6;
  BOOL v7;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  char *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v14 = 136316418;
        v15 = "-[VIOSessionStateManager isThrottling]";
        v16 = 2080;
        v17 = "VIOSessionStateManager.m";
        v18 = 1024;
        v19 = 159;
        v20 = 2080;
        v21 = "dispatch_get_main_queue()";
        v22 = 2080;
        v23 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v24 = 2080;
        v25 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v14,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v11 = sub_1004318FC();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v14 = 138412290;
          v15 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);

        }
      }
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateManager sessionRestartTimer](self, "sessionRestartTimer"));
  v7 = v6 != 0;

  return v7;
}

- (double)remainingThrottleTime
{
  const char *label;
  const char *v4;
  BOOL v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
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

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v11 = sub_1004318FC();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v16 = 136316418;
        v17 = "-[VIOSessionStateManager remainingThrottleTime]";
        v18 = 2080;
        v19 = "VIOSessionStateManager.m";
        v20 = 1024;
        v21 = 166;
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
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateManager sessionRestartTimer](self, "sessionRestartTimer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fireDate"));
  objc_msgSend(v7, "timeIntervalSinceNow");
  v9 = v8;

  return v9;
}

- (BOOL)isDisabled
{
  const char *label;
  const char *v4;
  BOOL v5;
  void *v6;
  BOOL v7;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  char *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v14 = 136316418;
        v15 = "-[VIOSessionStateManager isDisabled]";
        v16 = 2080;
        v17 = "VIOSessionStateManager.m";
        v18 = 1024;
        v19 = 173;
        v20 = 2080;
        v21 = "dispatch_get_main_queue()";
        v22 = 2080;
        v23 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v24 = 2080;
        v25 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v14,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v11 = sub_1004318FC();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v14 = 138412290;
          v15 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);

        }
      }
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateManager activeDisableEvents](self, "activeDisableEvents"));
  v7 = objc_msgSend(v6, "count") != 0;

  return v7;
}

- (NSSet)disableEventReasons
{
  const char *label;
  const char *v4;
  BOOL v5;
  void *v6;
  id v7;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  char *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v14 = 136316418;
        v15 = "-[VIOSessionStateManager disableEventReasons]";
        v16 = 2080;
        v17 = "VIOSessionStateManager.m";
        v18 = 1024;
        v19 = 180;
        v20 = 2080;
        v21 = "dispatch_get_main_queue()";
        v22 = 2080;
        v23 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v24 = 2080;
        v25 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v14,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v11 = sub_1004318FC();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v14 = 138412290;
          v15 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);

        }
      }
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateManager activeDisableEvents](self, "activeDisableEvents"));
  v7 = objc_msgSend(v6, "copy");

  return (NSSet *)v7;
}

- (void)addObserver:(id)a3
{
  id v4;
  const char *label;
  const char *v6;
  BOOL v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  char *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;

  v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v14 = 136316418;
        v15 = "-[VIOSessionStateManager addObserver:]";
        v16 = 2080;
        v17 = "VIOSessionStateManager.m";
        v18 = 1024;
        v19 = 187;
        v20 = 2080;
        v21 = "dispatch_get_main_queue()";
        v22 = 2080;
        v23 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v24 = 2080;
        v25 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v14,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v11 = sub_1004318FC();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v14 = 138412290;
          v15 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);

        }
      }
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateManager observers](self, "observers"));
  objc_msgSend(v8, "registerObserver:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  const char *label;
  const char *v6;
  BOOL v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  char *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;

  v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v14 = 136316418;
        v15 = "-[VIOSessionStateManager removeObserver:]";
        v16 = 2080;
        v17 = "VIOSessionStateManager.m";
        v18 = 1024;
        v19 = 194;
        v20 = 2080;
        v21 = "dispatch_get_main_queue()";
        v22 = 2080;
        v23 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v24 = 2080;
        v25 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v14,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v11 = sub_1004318FC();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v14 = 138412290;
          v15 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);

        }
      }
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateManager observers](self, "observers"));
  objc_msgSend(v8, "unregisterObserver:", v4);

}

- (BOOL)isThrottlingOrDisabled
{
  const char *label;
  const char *v4;
  BOOL v5;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v7 = sub_1004318FC();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v12 = 136316418;
        v13 = "-[VIOSessionStateManager isThrottlingOrDisabled]";
        v14 = 2080;
        v15 = "VIOSessionStateManager.m";
        v16 = 1024;
        v17 = 203;
        v18 = 2080;
        v19 = "dispatch_get_main_queue()";
        v20 = 2080;
        v21 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v22 = 2080;
        v23 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v12,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v9 = sub_1004318FC();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v12 = 138412290;
          v13 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);

        }
      }
    }
  }
  if (-[VIOSessionStateManager isThrottling](self, "isThrottling"))
    return 1;
  else
    return -[VIOSessionStateManager isDisabled](self, "isDisabled");
}

- (void)throttleSessionWithEventReason:(int64_t)a3
{
  const char *label;
  const char *v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double Double;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  VIOSessionStateManager *v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  VIOSessionStateManager *v28;
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
      v20 = sub_1004318FC();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v28 = (VIOSessionStateManager *)"-[VIOSessionStateManager throttleSessionWithEventReason:]";
        v29 = 2080;
        v30 = "VIOSessionStateManager.m";
        v31 = 1024;
        v32 = 210;
        v33 = 2080;
        v34 = "dispatch_get_main_queue()";
        v35 = 2080;
        v36 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v37 = 2080;
        v38 = dispatch_queue_get_label(0);
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
          v24 = (VIOSessionStateManager *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v28 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  v8 = sub_1008F0F04();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = CFSTR("VIOSessionThrottleEventDeviceMotion");
    if (!a3)
      v10 = CFSTR("VIOSessionThrottleEventARTrackingState");
    *(_DWORD *)buf = 134349314;
    v28 = self;
    v29 = 2112;
    v30 = (const char *)v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Pausing VIO session with event reason: %@", buf, 0x16u);
  }

  -[VIOSessionStateManager setThrottleEventReason:](self, "setThrottleEventReason:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateManager stateEnteredThrottleEventTimers](self, "stateEnteredThrottleEventTimers"));
  objc_msgSend(v11, "removeAllObjects");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateManager session](self, "session"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "technique"));
  objc_msgSend(v13, "setVioThrottled:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateManager session](self, "session"));
  objc_msgSend(v14, "pause");

  Double = GEOConfigGetDouble(MapsConfig_OpticalHeadingSessionThrottlerRetryTimeInterval, off_1014B3428);
  v16 = sub_1008F0F04();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    v28 = self;
    v29 = 2048;
    v30 = *(const char **)&Double;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}p] Starting retry timer with interval: %f", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1008F30F8;
  v25[3] = &unk_1011AE190;
  objc_copyWeak(&v26, (id *)buf);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v25, Double));
  -[VIOSessionStateManager setSessionRestartTimer:](self, "setSessionRestartTimer:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateManager observers](self, "observers"));
  objc_msgSend(v19, "throttleDidBeginWithEvent:", a3);

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);
}

- (void)disableSession
{
  const char *label;
  const char *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  char *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  VIOSessionStateManager *v15;
  int v16;
  VIOSessionStateManager *v17;
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

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v11 = sub_1004318FC();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v16 = 136316418;
        v17 = (VIOSessionStateManager *)"-[VIOSessionStateManager disableSession]";
        v18 = 2080;
        v19 = "VIOSessionStateManager.m";
        v20 = 1024;
        v21 = 236;
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
          v15 = (VIOSessionStateManager *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v16 = 138412290;
          v17 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);

        }
      }
    }
  }
  v6 = sub_1008F0F04();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (char *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateManager disableEventReasons](self, "disableEventReasons"));
    v16 = 134349314;
    v17 = self;
    v18 = 2112;
    v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Disabling VIO session with event reasons: %@", (uint8_t *)&v16, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateManager stateEnteredThrottleEventTimers](self, "stateEnteredThrottleEventTimers"));
  objc_msgSend(v9, "removeAllObjects");

  -[VIOSessionStateManager setSessionRestartTimer:](self, "setSessionRestartTimer:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateManager session](self, "session"));
  objc_msgSend(v10, "pause");

}

- (void)resumeSession
{
  const char *label;
  const char *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  VIOSessionStateManager *v16;
  int v17;
  VIOSessionStateManager *v18;
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
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v12 = sub_1004318FC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v17 = 136316418;
        v18 = (VIOSessionStateManager *)"-[VIOSessionStateManager resumeSession]";
        v19 = 2080;
        v20 = "VIOSessionStateManager.m";
        v21 = 1024;
        v22 = 248;
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
          v16 = (VIOSessionStateManager *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v17 = 138412290;
          v18 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);

        }
      }
    }
  }
  v6 = sub_1008F0F04();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v17 = 134349056;
    v18 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Resuming VIO session", (uint8_t *)&v17, 0xCu);
  }

  -[VIOSessionStateManager setSessionRestartTimer:](self, "setSessionRestartTimer:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateManager session](self, "session"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateManager configuration](self, "configuration"));
  objc_msgSend(v8, "runWithConfiguration:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionStateManager session](self, "session"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "technique"));
  objc_msgSend(v11, "setVioThrottled:", 0);

}

- (ARSession)session
{
  return (ARSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (ARConfiguration)configuration
{
  return self->_configuration;
}

- (int64_t)throttleEventReason
{
  return self->_throttleEventReason;
}

- (void)setThrottleEventReason:(int64_t)a3
{
  self->_throttleEventReason = a3;
}

- (GCDTimer)sessionRestartTimer
{
  return self->_sessionRestartTimer;
}

- (void)setSessionRestartTimer:(id)a3
{
  objc_storeStrong((id *)&self->_sessionRestartTimer, a3);
}

- (NSMutableDictionary)stateEnteredThrottleEventTimers
{
  return self->_stateEnteredThrottleEventTimers;
}

- (void)setStateEnteredThrottleEventTimers:(id)a3
{
  objc_storeStrong((id *)&self->_stateEnteredThrottleEventTimers, a3);
}

- (NSMutableSet)activeDisableEvents
{
  return self->_activeDisableEvents;
}

- (void)setActiveDisableEvents:(id)a3
{
  objc_storeStrong((id *)&self->_activeDisableEvents, a3);
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_activeDisableEvents, 0);
  objc_storeStrong((id *)&self->_stateEnteredThrottleEventTimers, 0);
  objc_storeStrong((id *)&self->_sessionRestartTimer, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_session);
}

@end
