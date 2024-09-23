@implementation KTOctagonActualOperations

- (KTOctagonActualOperations)initWithDistributedNotificationCenter:(id)a3 octagonControl:(id)a4 ckksControl:(id)a5 logger:(id)a6
{
  id v10;
  KTOctagonActualOperations *v11;
  id v12;
  id v13;
  KTOctagonActualOperations *v14;
  void *v15;
  dispatch_queue_t v16;
  KTNearFutureScheduler *v17;
  KTNearFutureScheduler *v18;
  void *v19;
  KTNearFutureScheduler *v20;
  KTNearFutureScheduler *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  KTOctagonActualOperations *v25;
  KTOctagonActualOperations *v26;
  id *v28;
  void **handler;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id location;
  objc_super v39;

  v10 = a3;
  v11 = (KTOctagonActualOperations *)a4;
  v12 = a5;
  v13 = a6;
  v39.receiver = self;
  v39.super_class = (Class)KTOctagonActualOperations;
  v14 = -[KTOctagonActualOperations init](&v39, "init");
  if (v14)
  {
    location = 0;
    objc_initWeak(&location, v14);
    -[KTOctagonActualOperations setCkksTimeout:](v14, "setCkksTimeout:", 2.0);
    -[KTOctagonActualOperations setOctagonToken:](v14, "setOctagonToken:", 0xFFFFFFFFLL);
    -[KTOctagonActualOperations setOctagonTrusted:](v14, "setOctagonTrusted:", 2);
    -[KTOctagonActualOperations setLogger:](v14, "setLogger:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[KTOctagonActualOperations setViews:](v14, "setViews:", v15);

    v16 = dispatch_queue_create("KTOctagonActualOperations", 0);
    -[KTOctagonActualOperations setQueue:](v14, "setQueue:", v16);

    v17 = [KTNearFutureScheduler alloc];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10015C424;
    v36[3] = &unk_10023A970;
    objc_copyWeak(&v37, &location);
    v18 = -[KTNearFutureScheduler initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:](v17, "initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("OctagonPoller"), 1000000000, 0, 0, v36);
    -[KTOctagonActualOperations setNfs:](v14, "setNfs:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations nfs](v14, "nfs"));
    objc_msgSend(v13, "addNFSReporting:", v19);

    v20 = [KTNearFutureScheduler alloc];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10015C450;
    v34[3] = &unk_10023A970;
    objc_copyWeak(&v35, &location);
    v21 = -[KTNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:](v20, "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("ckksCheckerNFS"), 2000000000, 3600000000000, 0, 0, v34, 1.5);
    -[KTOctagonActualOperations setCkksCheckerNFS:](v14, "setCkksCheckerNFS:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations ckksCheckerNFS](v14, "ckksCheckerNFS"));
    objc_msgSend(v13, "addNFSReporting:", v22);

    -[KTOctagonActualOperations setNotificationCenter:](v14, "setNotificationCenter:", v10);
    v23 = objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations queue](v14, "queue"));
    handler = _NSConcreteStackBlock;
    v30 = 3221225472;
    v31 = sub_10015C47C;
    v32 = &unk_10023D170;
    objc_copyWeak(&v33, &location);
    notify_register_dispatch("com.apple.security.octagon.trust-status-change", &v14->_octagonToken, v23, &handler);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations notificationCenter](v14, "notificationCenter"));
    objc_msgSend(v24, "addObserver:selector:name:object:", v14, "ckksNotify:", CFSTR("com.apple.security.view-become-ready"), 0);

    if (v11)
      v25 = v11;
    else
      v25 = v14;
    -[KTOctagonActualOperations setOctagonControl:](v14, "setOctagonControl:", v25, &v37, handler, v30, v31, v32);
    -[KTOctagonActualOperations setCkksControlInterface:](v14, "setCkksControlInterface:", v12);
    v26 = v14;
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
    objc_destroyWeak(v28);
    objc_destroyWeak(&location);
  }

  return v14;
}

- (void)shutdown
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations nfs](self, "nfs"));
  objc_msgSend(v3, "cancel");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations ckksCheckerNFS](self, "ckksCheckerNFS"));
  objc_msgSend(v4, "cancel");

  if (-[KTOctagonActualOperations octagonToken](self, "octagonToken") != -1)
  {
    notify_cancel(-[KTOctagonActualOperations octagonToken](self, "octagonToken"));
    -[KTOctagonActualOperations setOctagonToken:](self, "setOctagonToken:", 0xFFFFFFFFLL);
  }
  v5 = (id)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations notificationCenter](self, "notificationCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("com.apple.security.view-become-ready"), 0);

}

- (void)ckksNotify:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v13;
  char v14;

  v4 = a3;
  if (qword_1002A7900 != -1)
    dispatch_once(&qword_1002A7900, &stru_100248E28);
  v5 = qword_1002A7908;
  if (os_log_type_enabled((os_log_t)qword_1002A7908, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "View become ready: %@", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v13 = 0x2020000000;
  v14 = 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("view")));

  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10015C76C;
    block[3] = &unk_10023CDE8;
    p_buf = &buf;
    block[4] = self;
    v10 = v7;
    dispatch_sync(v8, block);

  }
  if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    -[KTOctagonActualOperations checkAllCKKSMonitoredViews](self, "checkAllCKKSMonitoredViews");

  _Block_object_dispose(&buf, 8);
}

- (void)dealloc
{
  objc_super v3;

  -[KTOctagonActualOperations shutdown](self, "shutdown");
  v3.receiver = self;
  v3.super_class = (Class)KTOctagonActualOperations;
  -[KTOctagonActualOperations dealloc](&v3, "dealloc");
}

- (void)manateeChanged
{
  void *v3;
  id v4;
  NSObject *v5;
  _QWORD v6[6];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations octagonControl](self, "octagonControl"));
  v4 = objc_msgSend(v3, "octagonStatus:", 0);

  v5 = objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10015C89C;
  v6[3] = &unk_10023D240;
  v6[4] = self;
  v6[5] = v4;
  dispatch_sync(v5, v6);

  if (v4)
    -[KTOctagonActualOperations checkAllCKKSMonitoredViews](self, "checkAllCKKSMonitoredViews");
}

- (BOOL)getCachedOctagonStatus
{
  dispatch_semaphore_t v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  unint64_t v8;
  uint8_t v10[16];
  _QWORD block[5];
  NSObject *v12;

  if ((id)-[KTOctagonActualOperations octagonTrusted](self, "octagonTrusted") == (id)2)
  {
    v3 = dispatch_semaphore_create(0);
    global_queue = dispatch_get_global_queue(25, 0);
    v5 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10015CB84;
    block[3] = &unk_10023B3A8;
    block[4] = self;
    v6 = v3;
    v12 = v6;
    dispatch_async(v5, block);

    if (dispatch_semaphore_wait(v6, 0x3B9ACA00uLL))
    {
      if (qword_1002A7900 != -1)
        dispatch_once(&qword_1002A7900, &stru_100248E68);
      v7 = qword_1002A7908;
      if (os_log_type_enabled((os_log_t)qword_1002A7908, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "getCachedOctagonStatus: Fetching octagon status timed out", v10, 2u);
      }
    }
    v8 = -[KTOctagonActualOperations octagonTrusted](self, "octagonTrusted");

  }
  else
  {
    v8 = -[KTOctagonActualOperations octagonTrusted](self, "octagonTrusted");
  }
  return v8 == 1;
}

- (unint64_t)octagonStatus:(id *)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  _BOOL4 v12;
  __int16 v13;
  id v14;

  v3 = objc_alloc_init((Class)OTConfigurationContext);
  objc_msgSend(v3, "setContext:", OTDefaultContext);
  v4 = objc_msgSend(objc_alloc((Class)OTClique), "initWithContextData:", v3);
  v5 = objc_alloc_init((Class)OTOperationConfiguration);
  objc_msgSend(v5, "setTimeoutWaitForCKAccount:", 2000000000);
  v10 = 0;
  v6 = objc_msgSend(v4, "fetchCliqueStatus:error:", v5, &v10);
  v7 = v10;
  if (qword_1002A7900 != -1)
    dispatch_once(&qword_1002A7900, &stru_100248E88);
  v8 = qword_1002A7908;
  if (os_log_type_enabled((os_log_t)qword_1002A7908, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v12 = v6 == 0;
    v13 = 2112;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Manatee status is: %{BOOL}d: %@", buf, 0x12u);
  }

  return v6 == 0;
}

- (id)ckksControl:(id *)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v11;
  uint8_t buf[4];
  id v13;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1002A7910);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations ckksControlInterface](self, "ckksControlInterface"));

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v11 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSControl controlObject:](CKKSControl, "controlObject:", &v11));
    v5 = v11;
    -[KTOctagonActualOperations setCkksControlInterface:](self, "setCkksControlInterface:", v6);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002A7910);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations ckksControlInterface](self, "ckksControlInterface"));

  if (!v7)
  {
    if (qword_1002A7900 != -1)
      dispatch_once(&qword_1002A7900, &stru_100248EA8);
    v8 = qword_1002A7908;
    if (os_log_type_enabled((os_log_t)qword_1002A7908, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CKKS have no control: %@", buf, 0xCu);
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations ckksControlInterface](self, "ckksControlInterface"));

  return v9;
}

- (BOOL)ckksViewReady:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  double v10;
  dispatch_time_t v11;
  NSObject *v12;
  BOOL v13;
  NSObject *v14;
  NSObject *v15;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, uint64_t);
  void *v20;
  NSObject *v21;
  id v22;
  _BYTE *v23;
  id v24;
  uint8_t buf[4];
  id v26;
  _BYTE v27[24];
  char v28;

  v5 = a3;
  v24 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations ckksControl:](self, "ckksControl:", &v24));
  v7 = v24;
  if (v6)
  {
    *(_QWORD *)v27 = 0;
    *(_QWORD *)&v27[8] = v27;
    *(_QWORD *)&v27[16] = 0x2020000000;
    v28 = 0;
    v17 = _NSConcreteStackBlock;
    v18 = 3221225472;
    v19 = sub_10015D280;
    v20 = &unk_100248F10;
    v8 = dispatch_semaphore_create(0);
    v21 = v8;
    v23 = v27;
    v9 = v5;
    v22 = v9;
    objc_msgSend(v6, "rpcFastStatus:reply:", v9, &v17);
    -[KTOctagonActualOperations ckksTimeout](self, "ckksTimeout", v17, v18, v19, v20);
    v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
    if (dispatch_semaphore_wait(v8, v11))
    {
      if (qword_1002A7900 != -1)
        dispatch_once(&qword_1002A7900, &stru_100248F30);
      v12 = qword_1002A7908;
      if (os_log_type_enabled((os_log_t)qword_1002A7908, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CKKS query timed out", buf, 2u);
      }
    }
    if (*(_BYTE *)(*(_QWORD *)&v27[8] + 24))
    {
      v13 = 1;
    }
    else
    {
      if (qword_1002A7900 != -1)
        dispatch_once(&qword_1002A7900, &stru_100248F50);
      v15 = qword_1002A7908;
      if (os_log_type_enabled((os_log_t)qword_1002A7908, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v9;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Setting up a new monitor for CKKS: %@", buf, 0xCu);
      }
      -[KTOctagonActualOperations triggerActiveMonitorForView:](self, "triggerActiveMonitorForView:", v9);
      v13 = *(_BYTE *)(*(_QWORD *)&v27[8] + 24) != 0;
    }

    _Block_object_dispose(v27, 8);
  }
  else
  {
    if (qword_1002A7900 != -1)
      dispatch_once(&qword_1002A7900, &stru_100248EC8);
    v14 = qword_1002A7908;
    if (os_log_type_enabled((os_log_t)qword_1002A7908, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v27 = 138412546;
      *(_QWORD *)&v27[4] = v5;
      *(_WORD *)&v27[12] = 2112;
      *(_QWORD *)&v27[14] = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "CKKS have no control, starting watcher: %@: %@", v27, 0x16u);
    }
    -[KTOctagonActualOperations triggerActiveMonitorForView:](self, "triggerActiveMonitorForView:", v5);
    v13 = 0;
  }

  return v13;
}

- (void)addPassiveMonitorForView:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015D5B8;
  block[3] = &unk_10023B3A8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)triggerActiveMonitorForView:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015D6A8;
  block[3] = &unk_10023B3A8;
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v5, block);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations ckksCheckerNFS](self, "ckksCheckerNFS"));
  objc_msgSend(v6, "trigger");

}

- (void)checkAllCKKSMonitoredViews
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD block[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_10015D940;
  v20 = sub_10015D950;
  v21 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015D958;
  block[3] = &unk_100246758;
  block[4] = self;
  block[5] = &v16;
  dispatch_sync(v3, block);

  if (qword_1002A7900 != -1)
    dispatch_once(&qword_1002A7900, &stru_100248F70);
  v4 = (id)qword_1002A7908;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v17[5], "allObjects"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsJoinedByString:", CFSTR(",")));
    *(_DWORD *)buf = 138412290;
    v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CKKS checking if views are now available %@", buf, 0xCu);

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = (id)v17[5];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        -[KTOctagonActualOperations checkCKKSAvailable:](self, "checkCKKSAvailable:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
    }
    while (v8);
  }

  _Block_object_dispose(&v16, 8);
}

- (void)checkCKKSAvailable:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  NSObject *v14;
  NSObject *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  KTOctagonActualOperations *v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations octagonControl](self, "octagonControl"));
  v23 = 0;
  v6 = objc_msgSend(v5, "octagonStatus:", &v23);
  v7 = v23;

  if (v6)
  {
    v22 = 0;
    v8 = -[KTOctagonActualOperations ckksViewReady:error:](self, "ckksViewReady:error:", v4, &v22);
    v9 = v22;
    if ((v8 & 1) != 0)
    {
      v10 = objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations queue](self, "queue"));
      v16 = _NSConcreteStackBlock;
      v17 = 3221225472;
      v18 = sub_10015DC94;
      v19 = &unk_10023B3A8;
      v20 = self;
      v11 = v4;
      v21 = v11;
      dispatch_sync(v10, &v16);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations ckksViewObserver](self, "ckksViewObserver", v16, v17, v18, v19, v20));
      if (v12)
      {
        v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations ckksViewObserver](self, "ckksViewObserver"));
        ((void (**)(_QWORD, id))v13)[2](v13, v11);

      }
    }
    else
    {
      if (qword_1002A7900 != -1)
        dispatch_once(&qword_1002A7900, &stru_100248FB0);
      v15 = qword_1002A7908;
      if (os_log_type_enabled((os_log_t)qword_1002A7908, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v9;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "CKKS not available: %@", buf, 0xCu);
      }
    }

  }
  else
  {
    if (qword_1002A7900 != -1)
      dispatch_once(&qword_1002A7900, &stru_100248F90);
    v14 = qword_1002A7908;
    if (os_log_type_enabled((os_log_t)qword_1002A7908, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Octagon no longer available, stopping to monitor: %@", buf, 0xCu);
    }
  }

}

- (void)ckksRequestViewSync:(id)a3 complete:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v12 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations ckksControl:](self, "ckksControl:", &v12));
  v9 = v12;
  if (v8)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10015DDB4;
    v10[3] = &unk_10023D268;
    v11 = v7;
    objc_msgSend(v8, "rpcFetchAndProcessChanges:reply:", v6, v10);

  }
  else
  {
    (*((void (**)(id, id, double))v7 + 2))(v7, v9, 600.0);
  }

}

- (unint64_t)ckksGetKnownBadState:(id)a3
{
  id v4;
  void *v5;
  id v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  double v9;
  dispatch_time_t v10;
  NSObject *v11;
  unint64_t v12;
  uint8_t v14[16];
  _QWORD v15[4];
  id v16;
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v4 = a3;
  v23 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations ckksControl:](self, "ckksControl:", &v23));
  v6 = v23;
  if (v5)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    v7 = dispatch_semaphore_create(0);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10015E0B4;
    v15[3] = &unk_100249018;
    v18 = &v19;
    v16 = v4;
    v8 = v7;
    v17 = v8;
    objc_msgSend(v5, "rpcKnownBadState:reply:", v16, v15);
    -[KTOctagonActualOperations ckksTimeout](self, "ckksTimeout");
    v10 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
    if (dispatch_semaphore_wait(v8, v10))
    {
      if (qword_1002A7900 != -1)
        dispatch_once(&qword_1002A7900, &stru_100249038);
      v11 = qword_1002A7908;
      if (os_log_type_enabled((os_log_t)qword_1002A7908, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CKKS query timed out", v14, 2u);
      }
    }
    v12 = v20[3];

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (double)ckksTimeout
{
  return self->ckksTimeout;
}

- (void)setCkksTimeout:(double)a3
{
  self->ckksTimeout = a3;
}

- (id)octagonObserver
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setOctagonObserver:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (id)ckksViewObserver
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setCkksViewObserver:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (KTNSDistributedNotificationCenter)notificationCenter
{
  return (KTNSDistributedNotificationCenter *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNotificationCenter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (KTNearFutureScheduler)nfs
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNfs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (KTNearFutureScheduler)ckksCheckerNFS
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCkksCheckerNFS:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableSet)views
{
  return (NSMutableSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setViews:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (KTOctagonProtocol)octagonControl
{
  return (KTOctagonProtocol *)objc_loadWeakRetained((id *)&self->_octagonControl);
}

- (void)setOctagonControl:(id)a3
{
  objc_storeWeak((id *)&self->_octagonControl, a3);
}

- (KTCKKSProtocol)ckksControlInterface
{
  return (KTCKKSProtocol *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCkksControlInterface:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (int)octagonToken
{
  return self->_octagonToken;
}

- (void)setOctagonToken:(int)a3
{
  self->_octagonToken = a3;
}

- (TransparencyAnalytics)logger
{
  return (TransparencyAnalytics *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLogger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (unint64_t)octagonTrusted
{
  return self->_octagonTrusted;
}

- (void)setOctagonTrusted:(unint64_t)a3
{
  self->_octagonTrusted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_ckksControlInterface, 0);
  objc_destroyWeak((id *)&self->_octagonControl);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_views, 0);
  objc_storeStrong((id *)&self->_ckksCheckerNFS, 0);
  objc_storeStrong((id *)&self->_nfs, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong(&self->ckksViewObserver, 0);
  objc_storeStrong(&self->octagonObserver, 0);
}

@end
