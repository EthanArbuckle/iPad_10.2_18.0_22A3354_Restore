@implementation _DASBackgroundAppKillDemo

+ (id)sharedInstance
{
  if (qword_1001AB9D8 != -1)
    dispatch_once(&qword_1001AB9D8, &stru_10015E8F0);
  return (id)qword_1001AB9E0;
}

- (_DASBackgroundAppKillDemo)init
{
  _DASBackgroundAppKillDemo *v2;
  os_log_t v3;
  OS_os_log *log;
  NSObject *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  NSMutableDictionary *appNameToTerminationRequestDict;
  NSObject *v12;
  _DASBackgroundAppKillDemo *v13;
  _QWORD handler[4];
  _DASBackgroundAppKillDemo *v16;
  uint8_t buf[16];
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_DASBackgroundAppKillDemo;
  v2 = -[_DASBackgroundAppKillDemo init](&v18, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.duetactivityscheduler", "bgappkilldemo");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = v2->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Created BGAppKillDemo instance", buf, 2u);
    }
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_create("com.apple.dasd.BGAppKillDemo", v7);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    appNameToTerminationRequestDict = v2->_appNameToTerminationRequestDict;
    v2->_appNameToTerminationRequestDict = (NSMutableDictionary *)v10;

    v12 = v2->_queue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10006AA8C;
    handler[3] = &unk_10015D9B8;
    v13 = v2;
    v16 = v13;
    notify_register_dispatch("com.apple.dasd.BGAppKillDemo.statusChanged", (int *)&unk_1001AB9E8, v12, handler);
    -[_DASBackgroundAppKillDemo handleNotification](v13, "handleNotification");

  }
  return v2;
}

- (id)createTerminationRequestForProcessHandle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  NSObject *log;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc_init((Class)RBSTerminateContext), "initWithExplanation:", CFSTR("BG Kill Demo"));
  objc_msgSend(v5, "setMaximumTerminationResistance:", 40);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingHandle:](RBSProcessPredicate, "predicateMatchingHandle:", v4));
  v7 = objc_msgSend(objc_alloc((Class)RBSTerminateRequest), "initWithPredicate:context:", v6, v5);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v9 = log;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "debugDescription"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    v14 = 138412546;
    v15 = v10;
    v16 = 2112;
    v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Termination request %@ created for %@", (uint8_t *)&v14, 0x16u);

  }
  return v7;
}

- (void)handleNotification
{
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.dasd.appResume"));
  if (objc_msgSend(v3, "BOOLForKey:", CFSTR("BGAppKillDemo")))
    -[_DASBackgroundAppKillDemo startKilling](self, "startKilling");
  else
    -[_DASBackgroundAppKillDemo stopKilling](self, "stopKilling");

}

- (void)startKilling
{
  NSObject *log;
  void *v4;
  void *v5;
  _QWORD *v6;
  id v7;
  id v8;
  RBSProcessMonitor *v9;
  RBSProcessMonitor *processMonitor;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[5];
  uint8_t buf[16];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Starting killing apps in the background", buf, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingLaunchServicesProcesses](RBSProcessPredicate, "predicateMatchingLaunchServicesProcesses"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessStateDescriptor descriptor](RBSProcessStateDescriptor, "descriptor"));
  objc_msgSend(v5, "setValues:", 1);
  objc_msgSend(v5, "setEndowmentNamespaces:", &off_10016F470);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10006ADE0;
  v15[3] = &unk_10015E7C8;
  v15[4] = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10006AEBC;
  v11[3] = &unk_10015E918;
  v12 = v4;
  v13 = v5;
  v14 = objc_retainBlock(v15);
  v6 = v14;
  v7 = v5;
  v8 = v4;
  v9 = (RBSProcessMonitor *)objc_claimAutoreleasedReturnValue(+[RBSProcessMonitor monitorWithConfiguration:](RBSProcessMonitor, "monitorWithConfiguration:", v11));
  processMonitor = self->_processMonitor;
  self->_processMonitor = v9;

}

- (void)stopKilling
{
  RBSProcessMonitor *processMonitor;
  NSObject *log;
  uint8_t v5[16];

  -[NSMutableDictionary removeAllObjects](self->_appNameToTerminationRequestDict, "removeAllObjects");
  processMonitor = self->_processMonitor;
  if (processMonitor)
    -[RBSProcessMonitor invalidate](processMonitor, "invalidate");
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Stopped killing apps in the background", v5, 2u);
  }
}

- (void)processUpdateHandlerWithMonitor:(id)a3 withHandle:(id)a4 withUpdate:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  NSObject *log;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *appNameToTerminationRequestDict;
  id v19;
  void *v20;
  void *v21;
  unsigned int v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSMutableDictionary *v27;
  void *v28;
  void *v29;
  void *v30;
  NSMutableDictionary *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  unsigned int v35;
  NSObject *v36;
  _BOOL4 v37;
  NSObject *v38;
  void *v39;
  void *v40;
  const char *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  NSMutableDictionary *v45;
  void *v46;
  id v47;
  uint8_t buf[4];
  void *v49;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "state"));
  if (objc_msgSend(v9, "taskState") == 4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "state"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "endowmentNamespaces"));
    v12 = objc_msgSend(v11, "containsObject:", CFSTR("com.apple.frontboard.visibility"));

    if (v12)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v14 = log;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundle"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
        *(_DWORD *)buf = 138412290;
        v49 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "App %@ foregrounded, creating a termination request", buf, 0xCu);

      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBackgroundAppKillDemo createTerminationRequestForProcessHandle:](self, "createTerminationRequestForProcessHandle:", v7));
      appNameToTerminationRequestDict = self->_appNameToTerminationRequestDict;
      v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundle"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](appNameToTerminationRequestDict, "setObject:forKeyedSubscript:", v17, v20);
      goto LABEL_22;
    }
  }
  else
  {

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "state"));
  v22 = objc_msgSend(v21, "taskState");

  if (v22 == 3)
  {
    v23 = self->_log;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundle"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "identifier"));
      *(_DWORD *)buf = 138412290;
      v49 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "App %@ suspended", buf, 0xCu);

    }
    v27 = self->_appNameToTerminationRequestDict;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundle"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "identifier"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", v29));

    if (v30)
    {
      v31 = self->_appNameToTerminationRequestDict;
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundle"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "identifier"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v31, "objectForKeyedSubscript:", v33));

      v34 = self->_log;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v17;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Executing termination request %@", buf, 0xCu);
      }
      v47 = 0;
      v35 = objc_msgSend(v17, "execute:", &v47);
      v19 = v47;
      v36 = self->_log;
      v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
      if (v35)
      {
        if (v37)
        {
          v38 = v36;
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundle"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "identifier"));
          *(_DWORD *)buf = 138412290;
          v49 = v40;
          v41 = "App %@ should be killed";
LABEL_20:
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, v41, buf, 0xCu);

        }
      }
      else if (v37)
      {
        v38 = v36;
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundle"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "identifier"));
        *(_DWORD *)buf = 138412290;
        v49 = v40;
        v41 = "App %@ couldn't be killed";
        goto LABEL_20;
      }
      v45 = self->_appNameToTerminationRequestDict;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundle"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));
      -[NSMutableDictionary removeObjectForKey:](v45, "removeObjectForKey:", v46);

LABEL_22:
      goto LABEL_23;
    }
    v42 = self->_log;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = v42;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundle"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
      *(_DWORD *)buf = 138412290;
      v49 = v44;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Termination request wasn't created for %@", buf, 0xCu);

LABEL_23:
    }
  }

}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSMutableDictionary)appNameToTerminationRequestDict
{
  return self->_appNameToTerminationRequestDict;
}

- (void)setAppNameToTerminationRequestDict:(id)a3
{
  objc_storeStrong((id *)&self->_appNameToTerminationRequestDict, a3);
}

- (RBSProcessMonitor)processMonitor
{
  return self->_processMonitor;
}

- (void)setProcessMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_processMonitor, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_appNameToTerminationRequestDict, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
