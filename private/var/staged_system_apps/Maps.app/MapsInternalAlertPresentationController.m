@implementation MapsInternalAlertPresentationController

+ (id)sharedInstance
{
  if (qword_1014D2728 != -1)
    dispatch_once(&qword_1014D2728, &stru_1011B95D8);
  return (id)qword_1014D2720;
}

- (MapsInternalAlertPresentationController)init
{
  MapsInternalAlertPresentationController *v2;
  uint64_t v3;
  NSMapTable *windowMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MapsInternalAlertPresentationController;
  v2 = -[MapsInternalAlertPresentationController init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    windowMap = v2->_windowMap;
    v2->_windowMap = (NSMapTable *)v3;

  }
  return v2;
}

- (void)presentAlertController:(id)a3 fromWindowScene:(id)a4
{
  id v6;
  id v7;
  const char *label;
  const char *v9;
  BOOL v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  char *v18;
  id v19;
  NSObject *v20;
  id v21;
  int v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;

  v6 = a3;
  v7 = a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      v14 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v22 = 136316418;
        v23 = "-[MapsInternalAlertPresentationController presentAlertController:fromWindowScene:]";
        v24 = 2080;
        v25 = "MapsInternalAlertPresentationController.m";
        v26 = 1024;
        v27 = 52;
        v28 = 2080;
        v29 = "dispatch_get_main_queue()";
        v30 = 2080;
        v31 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v32 = 2080;
        v33 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v22,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v16 = sub_1004318FC();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v22 = 138412290;
          v23 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v22, 0xCu);

        }
      }
    }
  }
  if (v7)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", self, "_dismissalTransitionDidEndNotification:", UIPresentationControllerDismissalTransitionDidEndNotification, v6);

    v12 = objc_claimAutoreleasedReturnValue(-[MapsInternalAlertPresentationController _windowForScene:](self, "_windowForScene:", v7));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject rootViewController](v12, "rootViewController"));
    objc_msgSend(v13, "_maps_topMostPresentViewController:animated:completion:", v6, 1, 0);
    goto LABEL_9;
  }
  v19 = sub_1004318FC();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v22 = 136315906;
    v23 = "-[MapsInternalAlertPresentationController presentAlertController:fromWindowScene:]";
    v24 = 2080;
    v25 = "MapsInternalAlertPresentationController.m";
    v26 = 1024;
    v27 = 53;
    v28 = 2080;
    v29 = "windowScene != nil";
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v22, 0x26u);
  }

  if (sub_100A70734())
  {
    v21 = sub_1004318FC();
    v12 = objc_claimAutoreleasedReturnValue(v21);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v22 = 138412290;
    v23 = (const char *)v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v22, 0xCu);
LABEL_9:

LABEL_10:
  }

}

- (id)_windowForScene:(id)a3
{
  id v4;
  const char *label;
  const char *v6;
  BOOL v7;
  PassThroughWindow *v8;
  id v9;
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
  int v21;
  const char *v22;
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

  v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v11 = sub_1004318FC();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v21 = 136316418;
        v22 = "-[MapsInternalAlertPresentationController _windowForScene:]";
        v23 = 2080;
        v24 = "MapsInternalAlertPresentationController.m";
        v25 = 1024;
        v26 = 69;
        v27 = 2080;
        v28 = "dispatch_get_main_queue()";
        v29 = 2080;
        v30 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v31 = 2080;
        v32 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v21,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v13 = sub_1004318FC();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v21 = 138412290;
          v22 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v21, 0xCu);

        }
      }
    }
  }
  if (!v4)
  {
    v16 = sub_1004318FC();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v21 = 136315906;
      v22 = "-[MapsInternalAlertPresentationController _windowForScene:]";
      v23 = 2080;
      v24 = "MapsInternalAlertPresentationController.m";
      v25 = 1024;
      v26 = 70;
      v27 = 2080;
      v28 = "windowScene != nil";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v21, 0x26u);
    }

    if (sub_100A70734())
    {
      v18 = sub_1004318FC();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v21 = 138412290;
        v22 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v21, 0xCu);

      }
    }
  }
  v8 = (PassThroughWindow *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_windowMap, "objectForKey:", v4));
  if (!v8)
  {
    v8 = -[PassThroughWindow initWithWindowScene:]([PassThroughWindow alloc], "initWithWindowScene:", v4);
    -[PassThroughWindow setWindowLevel:](v8, "setWindowLevel:", UIWindowLevelAlert);
    v9 = objc_alloc_init((Class)UIApplicationRotationFollowingController);
    objc_msgSend(v9, "setSizesWindowToScene:", 1);
    -[PassThroughWindow setRootViewController:](v8, "setRootViewController:", v9);
    -[PassThroughWindow setHidden:](v8, "setHidden:", 0);
    -[NSMapTable setObject:forKey:](self->_windowMap, "setObject:forKey:", v8, v4);

  }
  return v8;
}

- (void)_dismissalTransitionDidEndNotification:(id)a3
{
  id v4;
  const char *label;
  const char *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  char *v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  char *v23;
  _QWORD block[4];
  id v25;
  MapsInternalAlertPresentationController *v26;
  id v27;
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

  v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v19 = sub_1004318FC();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v29 = "-[MapsInternalAlertPresentationController _dismissalTransitionDidEndNotification:]";
        v30 = 2080;
        v31 = "MapsInternalAlertPresentationController.m";
        v32 = 1024;
        v33 = 88;
        v34 = 2080;
        v35 = "dispatch_get_main_queue()";
        v36 = 2080;
        v37 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v38 = 2080;
        v39 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v21 = sub_1004318FC();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v29 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "removeObserver:name:object:", self, UIPresentationControllerDismissalTransitionDidEndNotification, v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "windowScene"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_windowMap, "objectForKey:", v12));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004F9718;
    block[3] = &unk_1011AD238;
    v25 = v13;
    v26 = self;
    v27 = v12;
    v14 = v13;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

LABEL_9:
    goto LABEL_10;
  }
  v15 = sub_1004318FC();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v29 = "-[MapsInternalAlertPresentationController _dismissalTransitionDidEndNotification:]";
    v30 = 2080;
    v31 = "MapsInternalAlertPresentationController.m";
    v32 = 1024;
    v33 = 93;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v17 = sub_1004318FC();
    v14 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      *(_DWORD *)buf = 138412290;
      v29 = v18;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
    goto LABEL_9;
  }
LABEL_10:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowMap, 0);
}

@end
