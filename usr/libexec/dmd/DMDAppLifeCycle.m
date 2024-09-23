@implementation DMDAppLifeCycle

+ (id)lifeCycleForBundleIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  int v22;
  id v23;
  __int16 v24;
  id v25;

  v4 = a3;
  v5 = a1;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_lifeCycleByBundleIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v4));
  v8 = objc_msgSend(v7, "_isStale");
  if ((_DWORD)v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "observers"));
    v12 = DMFAppLog(v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 134218242;
      v23 = objc_msgSend(v10, "count");
      v24 = 2114;
      v25 = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Preserving %lu observers for bundle ID: %{public}@", (uint8_t *)&v22, 0x16u);
    }

    v16 = DMFAppLog(v14, v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138543362;
      v23 = v4;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Discard stale app lifecycle for bundle ID: %{public}@", (uint8_t *)&v22, 0xCu);
    }

LABEL_10:
    v20 = objc_msgSend(objc_alloc((Class)objc_opt_class(DMDiphoneOSAppLifeCycle)), "initWithBundleIdentifier:", v4);
    v7 = v20;
    if (v10)
      objc_msgSend(v20, "setObservers:", v10);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, v4);
    objc_msgSend(v7, "didResetState");
    goto LABEL_13;
  }
  v18 = DMFAppLog(v8, v9);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138543362;
    v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Lifecycle is not stale for bundle ID: %{public}@", (uint8_t *)&v22, 0xCu);
  }

  v10 = 0;
  if (!v7)
    goto LABEL_10;
LABEL_13:

  objc_sync_exit(v5);
  return v7;
}

+ (void)_removeLifeCycleForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = a1;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_lifeCycleByBundleIdentifier"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v6);

  objc_sync_exit(v4);
}

+ (id)_lifeCycleByBundleIdentifier
{
  if (qword_1000EB760 != -1)
    dispatch_once(&qword_1000EB760, &stru_1000BA418);
  return (id)qword_1000EB758;
}

- (DMDAppLifeCycle)initWithBundleIdentifier:(id)a3
{
  void *v5;
  NSString *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3));
  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppLifeCycle.m"), 88, CFSTR("%@ must implement %@"), self, v7);

  return 0;
}

- (DMDAppLifeCycle)initWithBundleIdentifier:(id)a3 currentState:(unint64_t)a4
{
  id v6;
  DMDAppLifeCycle *v7;
  NSString *v8;
  NSString *bundleIdentifier;
  uint64_t v10;
  NSDate *lastModified;
  uint64_t v12;
  NSPointerArray *observers;
  NSOperationQueue *v14;
  NSOperationQueue *queue;
  NSString *v16;
  void *v17;
  CATStateMachine *v18;
  CATStateMachine *stateMachine;
  CATStateMachine *v20;
  void *v21;
  void *v22;
  CATStateMachine *v23;
  void *v24;
  CATStateMachine *v25;
  void *v26;
  void *v27;
  CATStateMachine *v28;
  void *v29;
  void *v30;
  CATStateMachine *v31;
  void *v32;
  void *v33;
  CATStateMachine *v34;
  void *v35;
  void *v36;
  CATStateMachine *v37;
  void *v38;
  void *v39;
  CATStateMachine *v40;
  void *v41;
  CATStateMachine *v42;
  void *v43;
  void *v44;
  CATStateMachine *v45;
  void *v46;
  void *v47;
  void *v49;
  unint64_t v50;
  id v51;
  void *v52;
  objc_super v53;

  v6 = a3;
  v53.receiver = self;
  v53.super_class = (Class)DMDAppLifeCycle;
  v7 = -[DMDAppLifeCycle init](&v53, "init");
  if (v7)
  {
    v8 = (NSString *)objc_msgSend(v6, "copy");
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = v8;

    v10 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    lastModified = v7->_lastModified;
    v7->_lastModified = (NSDate *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[NSPointerArray weakObjectsPointerArray](NSPointerArray, "weakObjectsPointerArray"));
    observers = v7->_observers;
    v7->_observers = (NSPointerArray *)v12;

    v14 = objc_opt_new(NSOperationQueue);
    queue = v7->_queue;
    v7->_queue = v14;

    v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.dmd.%@.%p(%@).queue"), objc_opt_class(v7), v7, v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[NSOperationQueue setName:](v7->_queue, "setName:", v17);

    -[NSOperationQueue setMaxConcurrentOperationCount:](v7->_queue, "setMaxConcurrentOperationCount:", 1);
    v18 = (CATStateMachine *)objc_msgSend(objc_alloc((Class)CATStateMachine), "initWithTarget:", v7);
    stateMachine = v7->_stateMachine;
    v7->_stateMachine = v18;

    v20 = v7->_stateMachine;
    v51 = v6;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](DMFApp, "stringForInstallationState:", 0));
    v50 = a4;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CATStateMachine addStateWithName:](v20, "addStateWithName:", v21));

    v23 = v7->_stateMachine;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](DMFApp, "stringForInstallationState:", 1));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[CATStateMachine addStateWithName:](v23, "addStateWithName:", v24));

    v25 = v7->_stateMachine;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](DMFApp, "stringForInstallationState:", 2));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CATStateMachine addStateWithName:](v25, "addStateWithName:", v26));

    v28 = v7->_stateMachine;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](DMFApp, "stringForInstallationState:", 3));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CATStateMachine addStateWithName:](v28, "addStateWithName:", v29));

    v31 = v7->_stateMachine;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](DMFApp, "stringForInstallationState:", 4));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CATStateMachine addStateWithName:](v31, "addStateWithName:", v32));

    v34 = v7->_stateMachine;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](DMFApp, "stringForInstallationState:", 5));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CATStateMachine addStateWithName:](v34, "addStateWithName:", v35));

    v37 = v7->_stateMachine;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](DMFApp, "stringForInstallationState:", 6));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CATStateMachine addStateWithName:](v37, "addStateWithName:", v38));

    v40 = v7->_stateMachine;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](DMFApp, "stringForInstallationState:", 7));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[CATStateMachine addStateWithName:](v40, "addStateWithName:", v41));

    v42 = v7->_stateMachine;
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](DMFApp, "stringForInstallationState:", 8));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[CATStateMachine addStateWithName:](v42, "addStateWithName:", v43));

    objc_msgSend(v22, "addTransitionToState:triggeringEvent:", v52, CFSTR("willStartInstalling"));
    objc_msgSend(v52, "addTransitionToState:triggeringEvent:", v27, CFSTR("didStartInstalling"));
    objc_msgSend(v52, "addTransitionToState:triggeringEvent:", v22, CFSTR("didCancelInstalling"));
    objc_msgSend(v27, "addTransitionToState:triggeringEvent:", v30, CFSTR("didPauseInstalling"));
    objc_msgSend(v27, "addTransitionToState:triggeringEvent:", v22, CFSTR("didCancelInstalling"));
    objc_msgSend(v27, "addTransitionToState:triggeringEvent:", v22, CFSTR("didFailInstalling"));
    objc_msgSend(v27, "addTransitionToState:triggeringEvent:", v33, CFSTR("didFinishInstalling"));
    objc_msgSend(v30, "addTransitionToState:triggeringEvent:", v27, CFSTR("didResumeInstalling"));
    objc_msgSend(v30, "addTransitionToState:triggeringEvent:", v22, CFSTR("didCancelInstalling"));
    objc_msgSend(v33, "addTransitionToState:triggeringEvent:", v36, CFSTR("willStartUpdating"));
    objc_msgSend(v33, "addTransitionToState:triggeringEvent:", v44, CFSTR("willStartUninstalling"));
    objc_msgSend(v36, "addTransitionToState:triggeringEvent:", v39, CFSTR("didStartUpdating"));
    objc_msgSend(v36, "addTransitionToState:triggeringEvent:", v33, CFSTR("didCancelUpdating"));
    objc_msgSend(v39, "addTransitionToState:triggeringEvent:", v49, CFSTR("didPauseUpdating"));
    objc_msgSend(v39, "addTransitionToState:triggeringEvent:", v33, CFSTR("didCancelUpdating"));
    objc_msgSend(v39, "addTransitionToState:triggeringEvent:", v33, CFSTR("didFailUpdating"));
    objc_msgSend(v39, "addTransitionToState:triggeringEvent:", v33, CFSTR("didFinishUpdating"));
    objc_msgSend(v44, "addTransitionToState:triggeringEvent:", v33, CFSTR("didFailUninstalling"));
    objc_msgSend(v44, "addTransitionToState:triggeringEvent:", v22, CFSTR("didFinishUninstalling"));
    v45 = v7->_stateMachine;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](DMFApp, "stringForInstallationState:", v50));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[CATStateMachine stateWithName:](v45, "stateWithName:", v46));
    -[CATStateMachine setInitialState:](v7->_stateMachine, "setInitialState:", v47);

    v6 = v51;
    -[CATStateMachine setLogLevel:](v7->_stateMachine, "setLogLevel:", 2);
    -[CATStateMachine start](v7->_stateMachine, "start");

  }
  return v7;
}

- (BOOL)_isStale
{
  unsigned int v3;
  double v4;

  v3 = -[DMDAppLifeCycle _isInTransitoryState](self, "_isInTransitoryState");
  v4 = 60.0;
  if (v3)
    v4 = 10.0;
  return -[DMDAppLifeCycle _isUnchangedForInterval:](self, "_isUnchangedForInterval:", v4);
}

- (BOOL)_isInTransitoryState
{
  return (-[DMDAppLifeCycle currentState](self, "currentState") & 0xFFFFFFFFFFFFFFFBLL) != 0;
}

- (BOOL)_isUnchangedForInterval:(double)a3
{
  void *v4;
  double v5;
  double v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle lastModified](self, "lastModified"));
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = -v5;

  return v6 >= a3;
}

- (void)_updateLastModified
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  -[DMDAppLifeCycle setLastModified:](self, "setLastModified:", v3);

}

- (unint64_t)currentState
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  if (qword_1000EB770 != -1)
    dispatch_once(&qword_1000EB770, &stru_1000BA438);
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001EFD4;
  v8[3] = &unk_1000BA460;
  v8[4] = self;
  v8[5] = &v9;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v8));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v13 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  objc_msgSend(v4, "addOperations:waitUntilFinished:", v5, 1);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (NSString)currentStateName
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  void *v15;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_10001F1C4;
  v13 = sub_10001F1D4;
  v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001F1DC;
  v8[3] = &unk_1000BA460;
  v8[4] = self;
  v8[5] = &v9;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v8));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v15 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  objc_msgSend(v4, "addOperations:waitUntilFinished:", v5, 1);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSString *)v6;
}

- (void)willStartInstalling
{
  void *v4;
  _QWORD v5[6];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001F2B8;
  v5[3] = &unk_1000BA488;
  v5[4] = self;
  v5[5] = a2;
  objc_msgSend(v4, "addOperationWithBlock:", v5);

}

- (void)didStartInstalling
{
  void *v4;
  _QWORD v5[6];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001F4CC;
  v5[3] = &unk_1000BA488;
  v5[4] = self;
  v5[5] = a2;
  objc_msgSend(v4, "addOperationWithBlock:", v5);

}

- (void)didPauseInstalling
{
  void *v4;
  _QWORD v5[6];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001F6E0;
  v5[3] = &unk_1000BA488;
  v5[4] = self;
  v5[5] = a2;
  objc_msgSend(v4, "addOperationWithBlock:", v5);

}

- (void)didResumeInstalling
{
  void *v4;
  _QWORD v5[6];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001F8F4;
  v5[3] = &unk_1000BA488;
  v5[4] = self;
  v5[5] = a2;
  objc_msgSend(v4, "addOperationWithBlock:", v5);

}

- (void)didCancelInstalling
{
  void *v4;
  _QWORD v5[6];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001FB08;
  v5[3] = &unk_1000BA488;
  v5[4] = self;
  v5[5] = a2;
  objc_msgSend(v4, "addOperationWithBlock:", v5);

}

- (void)didFailInstalling
{
  void *v4;
  _QWORD v5[6];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001FD1C;
  v5[3] = &unk_1000BA488;
  v5[4] = self;
  v5[5] = a2;
  objc_msgSend(v4, "addOperationWithBlock:", v5);

}

- (void)didFinishInstalling
{
  void *v4;
  _QWORD v5[6];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001FF30;
  v5[3] = &unk_1000BA488;
  v5[4] = self;
  v5[5] = a2;
  objc_msgSend(v4, "addOperationWithBlock:", v5);

}

- (void)willStartUpdating
{
  void *v4;
  _QWORD v5[6];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100020144;
  v5[3] = &unk_1000BA488;
  v5[4] = self;
  v5[5] = a2;
  objc_msgSend(v4, "addOperationWithBlock:", v5);

}

- (void)didStartUpdating
{
  void *v4;
  _QWORD v5[6];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100020358;
  v5[3] = &unk_1000BA488;
  v5[4] = self;
  v5[5] = a2;
  objc_msgSend(v4, "addOperationWithBlock:", v5);

}

- (void)didPauseUpdating
{
  void *v4;
  _QWORD v5[6];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002056C;
  v5[3] = &unk_1000BA488;
  v5[4] = self;
  v5[5] = a2;
  objc_msgSend(v4, "addOperationWithBlock:", v5);

}

- (void)didResumeUpdating
{
  void *v4;
  _QWORD v5[6];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100020780;
  v5[3] = &unk_1000BA488;
  v5[4] = self;
  v5[5] = a2;
  objc_msgSend(v4, "addOperationWithBlock:", v5);

}

- (void)didCancelUpdating
{
  void *v4;
  _QWORD v5[6];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100020994;
  v5[3] = &unk_1000BA488;
  v5[4] = self;
  v5[5] = a2;
  objc_msgSend(v4, "addOperationWithBlock:", v5);

}

- (void)didFailUpdating
{
  void *v4;
  _QWORD v5[6];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100020BA8;
  v5[3] = &unk_1000BA488;
  v5[4] = self;
  v5[5] = a2;
  objc_msgSend(v4, "addOperationWithBlock:", v5);

}

- (void)didFinishUpdating
{
  void *v4;
  _QWORD v5[6];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100020DBC;
  v5[3] = &unk_1000BA488;
  v5[4] = self;
  v5[5] = a2;
  objc_msgSend(v4, "addOperationWithBlock:", v5);

}

- (void)willStartUninstalling
{
  void *v4;
  _QWORD v5[6];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100020FD0;
  v5[3] = &unk_1000BA488;
  v5[4] = self;
  v5[5] = a2;
  objc_msgSend(v4, "addOperationWithBlock:", v5);

}

- (void)didFailUninstalling
{
  void *v4;
  _QWORD v5[6];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000211E4;
  v5[3] = &unk_1000BA488;
  v5[4] = self;
  v5[5] = a2;
  objc_msgSend(v4, "addOperationWithBlock:", v5);

}

- (void)didFinishUninstalling
{
  void *v4;
  _QWORD v5[6];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000213F8;
  v5[3] = &unk_1000BA488;
  v5[4] = self;
  v5[5] = a2;
  objc_msgSend(v4, "addOperationWithBlock:", v5);

}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002162C;
  v7[3] = &unk_1000B9BA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "addOperationWithBlock:", v7);

}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100021704;
  v7[3] = &unk_1000B9BA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "addOperationWithBlock:", v7);

}

- (void)didChangeInstallingProgress
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002182C;
  v4[3] = &unk_1000BA4B0;
  v4[4] = self;
  objc_msgSend(v3, "addOperationWithBlock:", v4);

}

- (void)didChangeUpdatingProgress
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000219B8;
  v4[3] = &unk_1000BA4B0;
  v4[4] = self;
  objc_msgSend(v3, "addOperationWithBlock:", v4);

}

- (void)didResetState
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  _QWORD v9[6];
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;

  v3 = DMFAppLog(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle bundleIdentifier](self, "bundleIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle observers](self, "observers"));
    *(_DWORD *)buf = 138543618;
    v11 = v5;
    v12 = 2048;
    v13 = objc_msgSend(v6, "count");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Did reset state for lifecycle for bundle ID: %{public}@, observer count = %lu", buf, 0x16u);

  }
  v7 = -[DMDAppLifeCycle currentState](self, "currentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100021C10;
  v9[3] = &unk_1000BA488;
  v9[4] = self;
  v9[5] = v7;
  objc_msgSend(v8, "addOperationWithBlock:", v9);

}

- (void)cancelAndWaitUntilAllOperationsAreFinished
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  objc_msgSend(v2, "cancelAllOperations");
  objc_msgSend(v2, "waitUntilAllOperationsAreFinished");

}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (NSPointerArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CATStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (NSDate)lastModified
{
  return self->_lastModified;
}

- (void)setLastModified:(id)a3
{
  objc_storeStrong((id *)&self->_lastModified, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
