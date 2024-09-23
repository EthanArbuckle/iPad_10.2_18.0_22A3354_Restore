@implementation _DASDaemonClient

- (void)cancelAllTaskRequestsWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = (void (**)(_QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemonClient mainApplicationBundleIdentifier](self, "mainApplicationBundleIdentifier"));
  if (v5)
  {
    -[_DASDaemon cancelAllTaskRequestsForApplication:](self->_daemon, "cancelAllTaskRequestsForApplication:", v5);
  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("BackgroundTasks")));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "App missing application-identifier", v7, 2u);
    }

  }
  v4[2](v4);

}

- (void)getPendingTaskRequestsWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = (void (**)(id, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemonClient mainApplicationBundleIdentifier](self, "mainApplicationBundleIdentifier"));
  if (v5)
  {
    -[_DASDaemon getPendingTaskRequestsForApplication:withCompletionHandler:](self->_daemon, "getPendingTaskRequestsForApplication:withCompletionHandler:", v5, v4);
  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("BackgroundTasks")));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "App missing application-identifier", v7, 2u);
    }

    v4[2](v4, &__NSArray0__struct);
  }

}

- (id)bundleIdentifierFromTeamAppTuple:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t i;
  int v7;
  NSObject *v9;
  _BYTE v11[40];

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.")))
  {
    v4 = v3;
  }
  else if ((unint64_t)objc_msgSend(v3, "length") > 0xA)
  {
    __chkstk_darwin();
    objc_msgSend(v3, "getCharacters:range:", v11, 0, 10);
    for (i = 0; i != 20; i += 2)
    {
      v7 = *(unsigned __int16 *)&v11[i];
      if ((v7 - 65) >= 0x1A && (v7 - 48) >= 0xA)
      {
        v9 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("BackgroundTasks")));
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          sub_1000EAAD8();
        goto LABEL_19;
      }
    }
    if (objc_msgSend(v3, "characterAtIndex:", 10) == 46)
    {
      v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", 11));
      goto LABEL_20;
    }
    v9 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("BackgroundTasks")));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000EAA98(v9);
LABEL_19:

    v4 = 0;
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("BackgroundTasks")));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000EAA34();

    v4 = 0;
  }
LABEL_20:

  return v4;
}

+ (id)clientForDaemon:(id)a3 withConnection:(id)a4 isRestricted:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  _DASDaemonClient *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[_DASDaemonClient initWithDaemon:withConnection:isRestricted:]([_DASDaemonClient alloc], "initWithDaemon:withConnection:isRestricted:", v8, v7, v5);

  return v9;
}

- (void)submitActivity:(id)a3
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (self->_restricted)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemonClient submitActivityInternal:](self, "submitActivityInternal:", v5);
    -[_DASDaemon submitActivity:](self->_daemon, "submitActivity:", v5);
  }

}

- (void)establishConnection:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  _DASDaemonClient *v7;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("BackgroundTasks")));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Establishing connection from client: %@", (uint8_t *)&v6, 0xCu);
  }

  -[_DASDaemon establishConnectionFromClient:withCompletionHandler:](self->_daemon, "establishConnectionFromClient:withCompletionHandler:", self, v4);
}

- (id)unsafe_applicationBundleIdentifier
{
  NSString *applicationBundleIdentifier;
  NSString **p_applicationBundleIdentifier;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  NSString *v9;

  p_applicationBundleIdentifier = &self->_applicationBundleIdentifier;
  applicationBundleIdentifier = self->_applicationBundleIdentifier;
  if (!applicationBundleIdentifier)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection valueForEntitlement:](self->_connection, "valueForEntitlement:", CFSTR("application-identifier")));
    v6 = objc_claimAutoreleasedReturnValue(-[_DASDaemonClient bundleIdentifierFromTeamAppTuple:](self, "bundleIdentifierFromTeamAppTuple:", v5));
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = &stru_1001617C8;
    objc_storeStrong((id *)p_applicationBundleIdentifier, v8);

    applicationBundleIdentifier = self->_applicationBundleIdentifier;
  }
  v9 = -[NSString length](applicationBundleIdentifier, "length");
  if (v9)
    v9 = *p_applicationBundleIdentifier;
  return v9;
}

- (void)activityCanceled:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  NSMutableSet *v9;
  NSMutableSet *v10;
  NSMutableSet *v11;
  _DASDaemonClient *v12;
  NSObject *v13;

  v5 = a3;
  v6 = v5;
  if (self->_restricted
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "launchReason")),
        v8 = objc_msgSend(v7, "hasPrefix:", _DASLaunchReasonContinuedProcessing),
        v7,
        (v8 & 1) == 0))
  {
    v13 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000EA9B8(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    v9 = self->_startedTasks;
    objc_sync_enter(v9);
    -[NSMutableSet removeObject:](self->_startedTasks, "removeObject:", v6);
    objc_sync_exit(v9);

    v10 = self->_submittedTasks;
    objc_sync_enter(v10);
    -[NSMutableSet removeObject:](self->_submittedTasks, "removeObject:", v6);
    objc_sync_exit(v10);

    v11 = self->_delayedStartTasks;
    objc_sync_enter(v11);
    -[NSMutableSet removeObject:](self->_delayedStartTasks, "removeObject:", v6);
    objc_sync_exit(v11);

    v12 = self;
    objc_sync_enter(v12);
    -[_DASDaemon activityCanceled:](v12->_daemon, "activityCanceled:", v6);
    objc_sync_exit(v12);

  }
}

- (void)activityCompleted:(id)a3
{
  id v5;
  NSObject *v6;
  NSMutableSet *v7;
  unsigned int v8;
  NSObject *v9;
  void *v10;
  NSMutableSet *v11;
  NSMutableSet *v12;
  _DASDaemonClient *v13;
  _DASDaemon *daemon;
  int v15;
  void *v16;

  v5 = a3;
  if (self->_restricted)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000EA93C(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    v7 = self->_startedTasks;
    objc_sync_enter(v7);
    v8 = -[NSMutableSet containsObject:](self->_startedTasks, "containsObject:", v5);
    if (v8)
    {
      -[NSMutableSet removeObject:](self->_startedTasks, "removeObject:", v5);
    }
    else
    {
      v9 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shortDescription"));
        v15 = 138412290;
        v16 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Can't complete, %@ - not running, cancelling instead!", (uint8_t *)&v15, 0xCu);

      }
    }
    objc_sync_exit(v7);

    v11 = self->_submittedTasks;
    objc_sync_enter(v11);
    -[NSMutableSet removeObject:](self->_submittedTasks, "removeObject:", v5);
    objc_sync_exit(v11);

    v12 = self->_delayedStartTasks;
    objc_sync_enter(v12);
    -[NSMutableSet removeObject:](self->_delayedStartTasks, "removeObject:", v5);
    objc_sync_exit(v12);

    v13 = self;
    objc_sync_enter(v13);
    daemon = v13->_daemon;
    if (v8)
      -[_DASDaemon activityCompleted:](daemon, "activityCompleted:", v5);
    else
      -[_DASDaemon activityCanceled:](daemon, "activityCanceled:", v5);
    objc_sync_exit(v13);

  }
}

- (_DASDaemonClient)initWithDaemon:(id)a3 withConnection:(id)a4 isRestricted:(BOOL)a5
{
  id v9;
  id v10;
  _DASDaemonClient *v11;
  _DASDaemonClient *v12;
  NSXPCConnection *connection;
  uint64_t v14;
  NSMutableSet *submittedTasks;
  uint64_t v16;
  NSMutableSet *startedTasks;
  uint64_t v18;
  NSMutableSet *delayedStartTasks;
  uint64_t v20;
  NSMutableSet *runningBGTasks;
  void **v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id location;
  objc_super v29;

  v9 = a3;
  v10 = a4;
  v29.receiver = self;
  v29.super_class = (Class)_DASDaemonClient;
  v11 = -[_DASDaemonClient init](&v29, "init");
  v12 = v11;
  if (v11)
  {
    v11->_restricted = a5;
    objc_storeStrong((id *)&v11->_daemon, a3);
    objc_storeStrong((id *)&v12->_connection, a4);
    if (qword_1001ABD58 != -1)
      dispatch_once(&qword_1001ABD58, &stru_100160048);
    -[NSXPCConnection setRemoteObjectInterface:](v12->_connection, "setRemoteObjectInterface:", qword_1001ABD60);
    if (qword_1001ABD68 != -1)
      dispatch_once(&qword_1001ABD68, &stru_100160068);
    -[NSXPCConnection setExportedInterface:](v12->_connection, "setExportedInterface:", qword_1001ABD70);
    -[NSXPCConnection setExportedObject:](v12->_connection, "setExportedObject:", v12);
    -[NSXPCConnection resume](v12->_connection, "resume");
    objc_initWeak(&location, v12);
    connection = v12->_connection;
    v23 = _NSConcreteStackBlock;
    v24 = 3221225472;
    v25 = sub_1000C3D40;
    v26 = &unk_10015D9E0;
    objc_copyWeak(&v27, &location);
    -[NSXPCConnection setInvalidationHandler:](connection, "setInvalidationHandler:", &v23);
    v14 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set", v23, v24, v25, v26));
    submittedTasks = v12->_submittedTasks;
    v12->_submittedTasks = (NSMutableSet *)v14;

    v16 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    startedTasks = v12->_startedTasks;
    v12->_startedTasks = (NSMutableSet *)v16;

    v18 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    delayedStartTasks = v12->_delayedStartTasks;
    v12->_delayedStartTasks = (NSMutableSet *)v18;

    v20 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    runningBGTasks = v12->_runningBGTasks;
    v12->_runningBGTasks = (NSMutableSet *)v20;

    v12->_lock._os_unfair_lock_opaque = 0;
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (void)submitTaskRequest:(id)a3 withHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  unsigned __int8 v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  _DASDaemon *daemon;
  unsigned __int8 v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  id v39;
  uint8_t buf[16];
  void *v41;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivity validateBGTaskRequestWithActivity:](_DASActivity, "validateBGTaskRequestWithActivity:", v6));
  if (!v8)
  {
    v21 = _DASActivitySchedulerErrorDomain;
    v22 = 3;
LABEL_52:
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v21, v22, 0));
    v7[2](v7, v38);

    goto LABEL_53;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "launchReason"));
  v10 = objc_msgSend(v9, "isEqualToString:", _DASLaunchReasonHealthResearch);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection valueForEntitlement:](self->_connection, "valueForEntitlement:", CFSTR("com.apple.developer.backgroundtasks.healthresearch")));
    v12 = v11;
    if (!v11 || (objc_msgSend(v11, "BOOLValue") & 1) == 0)
    {
      v23 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("BackgroundTasks")));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_1000EABD0();

      v24 = _DASActivitySchedulerErrorDomain;
      v25 = 0;
      goto LABEL_17;
    }

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "launchReason"));
  v14 = objc_msgSend(v13, "hasPrefix:", _DASLaunchReasonContinuedProcessing);

  if (!v14)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemonClient mainApplicationBundleIdentifier](self, "mainApplicationBundleIdentifier"));
    v27 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("BackgroundTasks")));
    v19 = v27;
    if (!v12)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "App missing application-identifier", buf, 2u);
      }

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", _DASActivitySchedulerErrorDomain, 1, 0));
      v7[2](v7, v12);
      goto LABEL_48;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      sub_1000EAE68();
    goto LABEL_21;
  }
  if (!-[_DASDaemonClient hasEntitlementForProgressTask](self, "hasEntitlementForProgressTask"))
  {
    v31 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("BackgroundTasks")));
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      goto LABEL_50;
    goto LABEL_51;
  }
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "clientProvidedIconBundleIdentifier"));
  if (v15)
  {
    v16 = (void *)v15;
    v17 = -[_DASDaemonClient hasEntitlementForCustomIconBundleIdentifier](self, "hasEntitlementForCustomIconBundleIdentifier");

    if ((v17 & 1) == 0)
    {
      v31 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("BackgroundTasks")));
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
LABEL_50:
        sub_1000EADEC();
LABEL_51:

      v21 = _DASActivitySchedulerErrorDomain;
      v22 = 0;
      goto LABEL_52;
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemonClient mainApplicationBundleIdentifier](self, "mainApplicationBundleIdentifier"));
  if (!v12)
    goto LABEL_22;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon context](self->_daemon, "context"));
  v19 = objc_claimAutoreleasedReturnValue(+[_DASApplicationPolicy focalApplicationsWithContext:](_DASApplicationPolicy, "focalApplicationsWithContext:", v18));

  if ((-[NSObject containsObject:](v19, "containsObject:", v12) & 1) == 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", _DASActivitySchedulerErrorDomain, 0, 0));
    v7[2](v7, v20);

LABEL_47:
    goto LABEL_48;
  }
LABEL_21:

LABEL_22:
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientProvidedIdentifier"));
  if (!objc_msgSend(v28, "hasPrefix:", CFSTR("com.apple.")))
  {

    goto LABEL_30;
  }
  v29 = objc_msgSend(v12, "hasPrefix:", CFSTR("com.apple."));

  if ((v29 & 1) != 0)
  {
LABEL_30:
    if (v12)
    {
      v41 = v12;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v41, 1));
      objc_msgSend(v8, "setRelatedApplications:", v32);

    }
    if ((v14 & 1) == 0)
      objc_msgSend(v8, "setRequestsApplicationLaunch:", 1);
    objc_msgSend(v8, "setUserIdentifier:", -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"));
    -[_DASDaemonClient validateCTBGTaskRequestWithActivity:](self, "validateCTBGTaskRequestWithActivity:", v8);
    daemon = self->_daemon;
    v39 = 0;
    v34 = -[_DASDaemon canSubmitValidatedTaskRequest:withError:](daemon, "canSubmitValidatedTaskRequest:withError:", v8, &v39);
    v19 = v39;
    v35 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("BackgroundTasks")));
    v36 = v35;
    if ((v34 & 1) != 0)
    {
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        sub_1000EAC54();

      if (v14)
        -[_DASDaemonClient submitActivityInternal:](self, "submitActivityInternal:", v8);
      -[_DASDaemon submitActivity:](self->_daemon, "submitActivity:", v8);
      v37 = 0;
    }
    else
    {
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        sub_1000EACC4();

      v37 = v19;
    }
    v7[2](v7, v37);
    goto LABEL_47;
  }
  v30 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("BackgroundTasks")));
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    sub_1000EAD2C((uint64_t)v12, v8, v30);

  v24 = _DASActivitySchedulerErrorDomain;
  v25 = 3;
LABEL_17:
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v24, v25, 0));
  v7[2](v7, v26);

LABEL_48:
LABEL_53:

}

- (void)validateCTBGTaskRequestWithActivity:(id)a3
{
  _DASDaemon *daemon;
  id v4;
  id v5;

  daemon = self->_daemon;
  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[_DASDaemon enManager](daemon, "enManager"));
  objc_msgSend(v5, "setIsENActivity:", v4);

}

- (void)submitActivityInternal:(id)a3
{
  NSMutableSet *v4;
  id v5;

  v5 = a3;
  v4 = self->_submittedTasks;
  objc_sync_enter(v4);
  objc_msgSend(v5, "setUserIdentifier:", -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"));
  objc_msgSend(v5, "setPid:", -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"));
  -[_DASDaemonClient setApplicationURLForActivity:](self, "setApplicationURLForActivity:", v5);
  -[NSMutableSet _DAS_addOrReplaceObject:](self->_submittedTasks, "_DAS_addOrReplaceObject:", v5);
  objc_sync_exit(v4);

}

- (NSString)mainApplicationBundleIdentifier
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemonClient unsafe_mainApplicationBundleIdentifier](self, "unsafe_mainApplicationBundleIdentifier"));
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (id)unsafe_mainApplicationBundleIdentifier
{
  NSString *mainApplicationBundleIdentifier;
  NSString **p_mainApplicationBundleIdentifier;
  void *v5;
  int is_extension;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  NSString *v15;
  id v17;

  p_mainApplicationBundleIdentifier = &self->_mainApplicationBundleIdentifier;
  mainApplicationBundleIdentifier = self->_mainApplicationBundleIdentifier;
  if (!mainApplicationBundleIdentifier)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection _xpcConnection](self->_connection, "_xpcConnection"));
    is_extension = xpc_connection_is_extension();

    if (is_extension)
    {
      v7 = objc_alloc((Class)LSApplicationExtensionRecord);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemonClient unsafe_applicationBundleIdentifier](self, "unsafe_applicationBundleIdentifier"));
      v17 = 0;
      v9 = objc_msgSend(v7, "initWithBundleIdentifier:error:", v8, &v17);
      v10 = v17;

      if (v10)
      {
        v11 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          sub_1000EAB3C();

      }
      if (v9)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "containingBundleRecord"));
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleIdentifier"));

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue(-[_DASDaemonClient unsafe_applicationBundleIdentifier](self, "unsafe_applicationBundleIdentifier"));
    }
    if (v13)
      v14 = v13;
    else
      v14 = &stru_1001617C8;
    objc_storeStrong((id *)p_mainApplicationBundleIdentifier, v14);

    mainApplicationBundleIdentifier = *p_mainApplicationBundleIdentifier;
  }
  v15 = -[NSString length](mainApplicationBundleIdentifier, "length");
  if (v15)
    v15 = *p_mainApplicationBundleIdentifier;
  return v15;
}

- (void)cancelActivities:(id)a3
{
  id v4;
  void *v5;
  NSMutableSet *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  NSMutableSet *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v6 = self->_submittedTasks;
  objc_sync_enter(v6);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        if (-[NSMutableSet containsObject:](self->_submittedTasks, "containsObject:", v11))
        {
          objc_msgSend(v5, "addObject:", v11);
          -[NSMutableSet removeObject:](self->_submittedTasks, "removeObject:", v11);
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v8);
  }

  objc_sync_exit(v6);
  v12 = self->_delayedStartTasks;
  objc_sync_enter(v12);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v13);
        v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)j);
        if (-[NSMutableSet containsObject:](self->_delayedStartTasks, "containsObject:", v17, (_QWORD)v20))
        {
          objc_msgSend(v5, "addObject:", v17);
          -[NSMutableSet removeObject:](self->_delayedStartTasks, "removeObject:", v17);
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v14);
  }

  objc_sync_exit(v12);
  if (objc_msgSend(v5, "count"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v13));
    objc_msgSend(v18, "cancelActivities:", v19);

  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)submitActivity:(id)a3 inGroup:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;

  v7 = a3;
  v8 = a4;
  if (self->_restricted)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemonClient submitActivityInternal:](self, "submitActivityInternal:", v7);
    -[_DASDaemon submitActivity:inGroup:](self->_daemon, "submitActivity:inGroup:", v7, v8);
  }

}

- (void)setMinimumBackgroundFetchInterval:(double)a3 forApp:(id)a4
{
  -[_DASDaemon setMinimumBackgroundFetchInterval:forApp:](self->_daemon, "setMinimumBackgroundFetchInterval:forApp:", a4, a3);
}

- (void)cancelTaskRequestWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemonClient mainApplicationBundleIdentifier](self, "mainApplicationBundleIdentifier"));
  if (v8)
  {
    -[_DASDaemon cancelTaskRequestWithIdentifier:forApplication:](self->_daemon, "cancelTaskRequestWithIdentifier:forApplication:", v6, v8);
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("BackgroundTasks")));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "App missing application-identifier", v10, 2u);
    }

  }
  v7[2](v7);

}

- (void)removeKnownActivitiesFromSet:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v5 = self->_submittedTasks;
  objc_sync_enter(v5);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_submittedTasks;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(v4, "removeObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (id)unlockedActivitiesWithNames:(id)a3 inSet:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  id v14;
  _QWORD v15[4];

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000C3F9C;
  v11[3] = &unk_100160000;
  v8 = v5;
  v12 = v8;
  v13 = v15;
  v14 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectsPassingTest:", v11));

  _Block_object_dispose(v15, 8);
  return v9;
}

- (void)handleClientInterruption
{
  id v3;

  -[_DASDaemonClient cancelAllActivities](self, "cancelAllActivities");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[_DASDaemonClient daemon](self, "daemon"));
  objc_msgSend(v3, "removeClient:", self);

}

- (id)activityNamesFromActivities:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), "name", (_QWORD)v13));
          objc_msgSend(v4, "addObject:", v10);

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v4));
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)runActivitiesWithDelayedStart:(id)a3
{
  id v4;
  void *v5;
  NSMutableSet *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  NSMutableSet *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v6 = self->_submittedTasks;
  objc_sync_enter(v6);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (-[NSMutableSet containsObject:](self->_submittedTasks, "containsObject:", v11, (_QWORD)v15))
        {
          objc_msgSend(v5, "addObject:", v11);
          -[NSMutableSet removeObject:](self->_submittedTasks, "removeObject:", v11);
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  objc_sync_exit(v6);
  if (objc_msgSend(v5, "count"))
  {
    v12 = self->_delayedStartTasks;
    objc_sync_enter(v12);
    -[NSMutableSet _DAS_unionSetOverridingExisting:](self->_delayedStartTasks, "_DAS_unionSetOverridingExisting:", v5);
    objc_sync_exit(v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v5));
    objc_msgSend(v13, "runActivitiesWithDelayedStart:", v14);

  }
}

- (void)runActivities:(id)a3
{
  id v4;
  void *v5;
  NSMutableSet *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v6 = self->_submittedTasks;
  objc_sync_enter(v6);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (-[NSMutableSet containsObject:](self->_submittedTasks, "containsObject:", v11, (_QWORD)v14))
        {
          objc_msgSend(v5, "addObject:", v11);
          -[NSMutableSet removeObject:](self->_submittedTasks, "removeObject:", v11);
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_sync_exit(v6);
  if (objc_msgSend(v5, "count"))
  {
    -[_DASDaemonClient handleRunningActivities:](self, "handleRunningActivities:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v5));
    objc_msgSend(v12, "runActivities:", v13);

  }
}

- (void)suspendActivities:(id)a3
{
  id v4;
  void *v5;
  NSMutableSet *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v6 = self->_startedTasks;
  objc_sync_enter(v6);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (-[NSMutableSet containsObject:](self->_startedTasks, "containsObject:", v11, (_QWORD)v14))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_sync_exit(v6);
  if (objc_msgSend(v5, "count"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v7));
    objc_msgSend(v12, "suspendActivities:", v13);

  }
}

- (void)activity:(id)a3 blockedOnPolicies:(id)a4
{
  NSXPCConnection *connection;
  id v6;
  id v7;
  id v8;

  connection = self->_connection;
  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy"));
  objc_msgSend(v8, "activity:blockedOnPolicies:", v7, v6);

}

- (void)activity:(id)a3 runWithoutHonoringPolicies:(id)a4
{
  NSXPCConnection *connection;
  id v6;
  id v7;
  id v8;

  connection = self->_connection;
  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy"));
  objc_msgSend(v8, "activity:runWithoutHonoringPolicies:", v7, v6);

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_DASDaemonClient;
  -[_DASDaemonClient dealloc](&v3, "dealloc");
}

- (void)submitActivitiesInternal:(id)a3
{
  id v4;
  NSMutableSet *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v5 = self->_submittedTasks;
  objc_sync_enter(v5);
  v6 = objc_autoreleasePoolPush();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10);
        objc_msgSend(v11, "setUserIdentifier:", -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier", (_QWORD)v12));
        objc_msgSend(v11, "setPid:", -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"));
        -[_DASDaemonClient setApplicationURLForActivity:](self, "setApplicationURLForActivity:", v11);
        -[NSMutableSet _DAS_addOrReplaceObject:](self->_submittedTasks, "_DAS_addOrReplaceObject:", v11);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  objc_autoreleasePoolPop(v6);
  objc_sync_exit(v5);

}

- (void)submitActivities:(id)a3
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (self->_restricted)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemonClient submitActivitiesInternal:](self, "submitActivitiesInternal:", v5);
    -[_DASDaemon submitActivities:](self->_daemon, "submitActivities:", v5);
  }

}

- (void)handleEligibleActivities:(id)a3
{
  -[_DASDaemon handleEligibleActivities:](self->_daemon, "handleEligibleActivities:", a3);
}

- (void)handleRunningActivities:(id)a3
{
  NSMutableSet *v4;
  id v5;

  v5 = a3;
  v4 = self->_startedTasks;
  objc_sync_enter(v4);
  -[NSMutableSet _DAS_unionSetOverridingExisting:](self->_startedTasks, "_DAS_unionSetOverridingExisting:", v5);
  objc_sync_exit(v4);

  -[_DASDaemon handleRunningActivities:](self->_daemon, "handleRunningActivities:", v5);
}

- (void)startedActivities:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSMutableSet *v8;
  _DASDaemonClient *v9;

  v5 = a3;
  if (self->_restricted)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000EA7C8(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));
    v8 = self->_startedTasks;
    objc_sync_enter(v8);
    -[NSMutableSet unionSet:](self->_startedTasks, "unionSet:", v7);
    objc_sync_exit(v8);

    v9 = self;
    objc_sync_enter(v9);
    -[_DASDaemon startedActivities:](v9->_daemon, "startedActivities:", v7);
    objc_sync_exit(v9);

  }
}

- (void)delayedStartActivities:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSMutableSet *v8;

  v5 = a3;
  if (self->_restricted)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000EA844(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));
    v8 = self->_delayedStartTasks;
    objc_sync_enter(v8);
    -[NSMutableSet unionSet:](self->_delayedStartTasks, "unionSet:", v7);
    objc_sync_exit(v8);

  }
}

- (void)activityStarted:(id)a3
{
  id v5;
  NSObject *v6;
  NSMutableSet *v7;
  NSMutableSet *v8;
  _DASDaemonClient *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;

  v5 = a3;
  if (self->_restricted)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000EA8C0(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    v7 = self->_delayedStartTasks;
    objc_sync_enter(v7);
    if (-[NSMutableSet containsObject:](self->_delayedStartTasks, "containsObject:", v5))
    {
      -[NSMutableSet removeObject:](self->_delayedStartTasks, "removeObject:", v5);
      objc_sync_exit(v7);

      v8 = self->_startedTasks;
      objc_sync_enter(v8);
      -[NSMutableSet _DAS_addOrReplaceObject:](self->_startedTasks, "_DAS_addOrReplaceObject:", v5);
      objc_sync_exit(v8);

      v9 = self;
      objc_sync_enter(v9);
      -[_DASDaemon activityStarted:](v9->_daemon, "activityStarted:", v5);
      objc_sync_exit(v9);

    }
    else
    {
      v10 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shortDescription"));
        v12 = 138412290;
        v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Can't start %@!,not scheduled to run!", (uint8_t *)&v12, 0xCu);

      }
      objc_sync_exit(v7);

    }
  }

}

- (void)cancelAllActivities
{
  void *v3;
  NSMutableSet *v4;
  NSMutableSet *v5;
  NSMutableSet *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v4 = self->_submittedTasks;
  objc_sync_enter(v4);
  objc_msgSend(v3, "unionSet:", self->_submittedTasks);
  -[NSMutableSet removeAllObjects](self->_submittedTasks, "removeAllObjects");
  objc_sync_exit(v4);

  v5 = self->_startedTasks;
  objc_sync_enter(v5);
  objc_msgSend(v3, "unionSet:", self->_startedTasks);
  -[NSMutableSet removeAllObjects](self->_startedTasks, "removeAllObjects");
  objc_sync_exit(v5);

  v6 = self->_delayedStartTasks;
  objc_sync_enter(v6);
  objc_msgSend(v3, "unionSet:", self->_delayedStartTasks);
  -[NSMutableSet removeAllObjects](self->_delayedStartTasks, "removeAllObjects");
  objc_sync_exit(v6);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v11, "requestsApplicationLaunch", (_QWORD)v12)
          || (objc_msgSend(v11, "shouldBePersisted") & 1) == 0)
        {
          -[_DASDaemon activityCanceled:](self->_daemon, "activityCanceled:", v11);
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)updateActivity:(id)a3 withParameters:(id)a4
{
  id v6;
  _DASDaemonClient *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[_DASDaemon updateActivity:withParameters:](v7->_daemon, "updateActivity:withParameters:", v8, v6);
  objc_sync_exit(v7);

}

- (void)_resetWidgetBudgets
{
  void *v3;
  void *v4;
  unsigned int v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForEntitlement:", CFSTR("com.apple.dasd.widgetBudgetReset")));
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    -[_DASDaemon _resetWidgetBudgets](self->_daemon, "_resetWidgetBudgets");
  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("misuse")));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
      v8 = 138543362;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Please file a bug for – client %{public}@ attempted to reset widget budgets but lacked appropriate entitlement", (uint8_t *)&v8, 0xCu);

    }
  }
}

- (void)updateSystemConstraintsWithParameters:(id)a3
{
  -[_DASDaemon updateSystemConstraintsWithParameters:](self->_daemon, "updateSystemConstraintsWithParameters:", a3);
}

- (void)createActivityGroup:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v5 = a3;
  if (self->_restricted)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection valueForEntitlement:](self->_connection, "valueForEntitlement:", CFSTR("com.apple.networkd.configure_connection_pool")));
    if ((objc_msgSend(v7, "BOOLValue") & 1) != 0)
    {
      -[_DASDaemon createActivityGroup:](self->_daemon, "createActivityGroup:", v5);
    }
    else
    {
      v8 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unentitled client tried to create an Activity Group. Dropping on the floor", v9, 2u);
      }

    }
  }

}

- (void)submitActivity:(id)a3 inGroupWithName:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;

  v7 = a3;
  v8 = a4;
  if (self->_restricted)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemonClient submitActivityInternal:](self, "submitActivityInternal:", v7);
    -[_DASDaemon submitActivity:inGroupWithName:](self->_daemon, "submitActivity:inGroupWithName:", v7, v8);
  }

}

- (void)submitActivity:(id)a3 inGroup:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _BOOL8, _QWORD);
  NSMutableSet *v11;
  _DASDaemon *daemon;
  _BOOL8 v13;
  _DASDaemonClient *v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _BOOL8, _QWORD))a5;
  objc_msgSend(v8, "setUserIdentifier:", -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"));
  objc_msgSend(v8, "setPid:", -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"));
  -[_DASDaemonClient setApplicationURLForActivity:](self, "setApplicationURLForActivity:", v8);
  v11 = self->_submittedTasks;
  objc_sync_enter(v11);
  -[NSMutableSet _DAS_addOrReplaceObject:](self->_submittedTasks, "_DAS_addOrReplaceObject:", v8);
  objc_sync_exit(v11);

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1000C563C;
  v20 = sub_1000C564C;
  v21 = 0;
  daemon = self->_daemon;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000C5654;
  v15[3] = &unk_100160028;
  v15[4] = &v22;
  v15[5] = &v16;
  -[_DASDaemon submitActivity:inGroup:withHandler:](daemon, "submitActivity:inGroup:withHandler:", v8, v9, v15);
  if (*((_BYTE *)v23 + 24))
  {
    v13 = 1;
  }
  else
  {
    v14 = self;
    objc_sync_enter(v14);
    -[NSMutableSet removeObject:](self->_submittedTasks, "removeObject:", v8);
    objc_sync_exit(v14);

    v13 = *((_BYTE *)v23 + 24) != 0;
  }
  v10[2](v10, v13, v17[5]);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
}

- (void)endLaunchWithReason:(id)a3 forApp:(id)a4
{
  NSObject *v6;

  if (self->_restricted)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar"), a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon endLaunchWithReason:forApp:](self->_daemon, "endLaunchWithReason:forApp:", a3, a4);
  }
}

- (void)backgroundAppRefreshEnabledForApp:(id)a3 withHandler:(id)a4
{
  NSObject *v6;

  if (self->_restricted)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar"), a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon backgroundAppRefreshEnabledForApp:withHandler:](self->_daemon, "backgroundAppRefreshEnabledForApp:withHandler:", a3, a4);
  }
}

- (void)disableAppRefreshForApps:(id)a3
{
  NSObject *v5;

  if (self->_restricted)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon disableAppRefreshForApps:](self->_daemon, "disableAppRefreshForApps:", a3);
  }
}

- (NSString)applicationBundleIdentifier
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemonClient unsafe_applicationBundleIdentifier](self, "unsafe_applicationBundleIdentifier"));
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (BOOL)hasEntitlementForProgressTask
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection valueForEntitlement:](self->_connection, "valueForEntitlement:", CFSTR("com.apple.das.private.bgtask.continuedprocessing")));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)hasEntitlementForCustomIconBundleIdentifier
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection valueForEntitlement:](self->_connection, "valueForEntitlement:", CFSTR("com.apple.das.private.bgtask.continuedprocessing.iconBundleIdentifier")));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)handleLaunchFromDaemonForActivities:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableSet *v6;
  void *v7;
  int v8;
  _DASDaemonClient *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("BackgroundTasks")));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Telling client %@ to handle activities: %@", (uint8_t *)&v8, 0x16u);
  }

  v6 = self->_runningBGTasks;
  objc_sync_enter(v6);
  -[NSMutableSet unionSet:](self->_runningBGTasks, "unionSet:", v4);
  objc_sync_exit(v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
  objc_msgSend(v7, "handleLaunchFromDaemonForActivities:", v4);

}

- (void)willExpireBGTaskActivities:(id)a3
{
  id v4;
  void *v5;
  NSMutableSet *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  _DASDaemonClient *v19;
  __int16 v20;
  void *v21;
  _BYTE v22[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v6 = self->_runningBGTasks;
  objc_sync_enter(v6);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (-[NSMutableSet containsObject:](self->_runningBGTasks, "containsObject:", v11, (_QWORD)v14))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v8);
  }

  objc_sync_exit(v6);
  if (objc_msgSend(v5, "count"))
  {
    v12 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("BackgroundTasks")));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v19 = self;
      v20 = 2112;
      v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Warning client %@ for activities about to expire: %@", buf, 0x16u);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
    objc_msgSend(v13, "willExpireBGTaskActivities:", v5);

  }
}

- (void)completeTaskRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  NSMutableSet *v12;
  NSObject *v13;
  int v14;
  _DASDaemonClient *v15;
  __int16 v16;
  id v17;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("BackgroundTasks")));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = self;
    v16 = 2112;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Completing for client %@ task request %@", (uint8_t *)&v14, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemonClient mainApplicationBundleIdentifier](self, "mainApplicationBundleIdentifier"));
  if (v9
    || (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "launchReason")),
        v11 = objc_msgSend(v10, "hasPrefix:", _DASLaunchReasonContinuedProcessing),
        v10,
        (v11 & 1) != 0))
  {
    v12 = self->_runningBGTasks;
    objc_sync_enter(v12);
    -[NSMutableSet removeObject:](self->_runningBGTasks, "removeObject:", v6);
    objc_sync_exit(v12);

    -[_DASDaemon completeTaskRequest:forApplication:](self->_daemon, "completeTaskRequest:forApplication:", v6, v9);
  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("BackgroundTasks")));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "App missing application-identifier", (uint8_t *)&v14, 2u);
    }

  }
  v7[2](v7);

}

- (void)updateOngoingTask:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  NSObject *v9;
  int v10;
  id v11;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("BackgroundTasks")));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Updating task request %@", (uint8_t *)&v10, 0xCu);
  }

  if (-[_DASDaemonClient hasEntitlementForProgressTask](self, "hasEntitlementForProgressTask"))
  {
    -[_DASDaemon updateOngoingTask:completionHandler:](self->_daemon, "updateOngoingTask:completionHandler:", v6, v7);
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("BackgroundTasks")));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Missing valid entitlement", (uint8_t *)&v10, 2u);
    }

    v7[2](v7);
  }

}

- (void)updateProgressForOngoingTask:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("BackgroundTasks")));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "progress"));
    v11 = 138412546;
    v12 = v9;
    v13 = 2112;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Updating progress %@ for task request %@", (uint8_t *)&v11, 0x16u);

  }
  if (-[_DASDaemonClient hasEntitlementForProgressTask](self, "hasEntitlementForProgressTask"))
  {
    -[_DASDaemon updateProgressForOngoingTask:completionHandler:](self->_daemon, "updateProgressForOngoingTask:completionHandler:", v6, v7);
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("BackgroundTasks")));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Missing valid entitlement", (uint8_t *)&v11, 2u);
    }

    v7[2](v7);
  }

}

- (void)acknowledgeSystemTaskLaunchWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](_DASBGSystemTaskHelper, "sharedInstance"));
  objc_msgSend(v8, "acknowledgeSystemTaskLaunchWithIdentifier:withPID:withUID:completionHandler:", v7, -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"), -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"), v6);

}

- (void)acknowledgeSystemTaskSuspensionWithIdentifier:(id)a3 retryAfter:(double)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](_DASBGSystemTaskHelper, "sharedInstance"));
  objc_msgSend(v10, "acknowledgeSystemTaskSuspensionWithIdentifier:withPID:withUID:retryAfter:completionHandler:", v9, -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"), -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"), v8, a4);

}

- (void)handleClientLedSystemTaskExpirationWithIdentifier:(id)a3 retryAfter:(double)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](_DASBGSystemTaskHelper, "sharedInstance"));
  objc_msgSend(v10, "handleClientLedSystemTaskExpirationWithIdentifier:withPID:withUID:retryAfter:completionHandler:", v9, -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"), -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"), v8, a4);

}

- (void)submitTaskRequestWithIdentifier:(id)a3 descriptor:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](_DASBGSystemTaskHelper, "sharedInstance"));
  objc_msgSend(v11, "submitTaskRequestWithIdentifier:descriptor:withPID:withUID:completionHandler:", v10, v9, -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"), -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"), v8);

}

- (void)updateTaskRequestWithIdentifier:(id)a3 descriptor:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](_DASBGSystemTaskHelper, "sharedInstance"));
  objc_msgSend(v11, "updateTaskRequestWithIdentifier:descriptor:withPID:withUID:completionHandler:", v10, v9, -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"), -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"), v8);

}

- (void)completeSystemTaskWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](_DASBGSystemTaskHelper, "sharedInstance"));
  objc_msgSend(v8, "completeSystemTaskWithIdentifier:withPID:withUID:completionHandler:", v7, -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"), -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"), v6);

}

- (void)resumeTaskSchedulingWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](_DASBGSystemTaskHelper, "sharedInstance"));
  objc_msgSend(v8, "resumeTaskSchedulingWithIdentifier:withPID:withUID:completionHandler:", v7, -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"), -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"), v6);

}

- (void)unregisterSystemTaskWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](_DASBGSystemTaskHelper, "sharedInstance"));
  objc_msgSend(v8, "unregisterSystemTaskWithIdentifier:withPID:withUID:completionHandler:", v7, -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"), -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"), v6);

}

- (void)reportSystemTaskWithIdentifier:(id)a3 producedResults:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](_DASBGSystemTaskHelper, "sharedInstance"));
  objc_msgSend(v11, "reportSystemTaskWithIdentifier:producedResults:withPID:withUID:completionHandler:", v10, v9, -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"), -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"), v8);

}

- (void)reportSystemTaskWithIdentifier:(id)a3 consumedResults:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](_DASBGSystemTaskHelper, "sharedInstance"));
  objc_msgSend(v11, "reportSystemTaskWithIdentifier:consumedResults:withPID:withUID:completionHandler:", v10, v9, -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"), -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"), v8);

}

- (void)resetResultsForIdentifier:(id)a3 byTaskWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](_DASBGSystemTaskHelper, "sharedInstance"));
  objc_msgSend(v11, "resetResultsForIdentifier:byTaskWithIdentifier:withPID:withUID:completionHandler:", v10, v9, -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"), -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"), v8);

}

- (void)reportTaskWorkloadProgress:(id)a3 target:(unint64_t)a4 completed:(unint64_t)a5 category:(unint64_t)a6 subCategory:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v14 = a8;
  v15 = a7;
  v16 = a3;
  v19 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](_DASBGSystemTaskHelper, "sharedInstance"));
  v17 = -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier");
  LODWORD(v18) = -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier");
  objc_msgSend(v19, "recordTaskWorkloadProgress:target:completed:category:subCategory:withPID:withUID:completionHandler:", v16, a4, a5, a6, v15, v17, v18, v14);

}

- (void)resetFastPassActivities:(id)a3 resetAll:(BOOL)a4 withHandler:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  id v9;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](_DASBGSystemTaskHelper, "sharedInstance"));
  objc_msgSend(v9, "resetFastPassActivities:resetAll:withHandler:", v8, v5, v7);

}

- (void)inspect:(id)a3 withHandler:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](_DASBGSystemTaskHelper, "sharedInstance"));
  objc_msgSend(v7, "inspect:withHandler:", v6, v5);

}

- (void)resubmitRunningTasks:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](_DASBGSystemTaskHelper, "sharedInstance"));
  objc_msgSend(v5, "resubmitRunningTasks:withPID:withUID:", v4, -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"), -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"));

}

- (void)submittedActivitiesWithHandler:(id)a3
{
  NSObject *v5;

  if (self->_restricted)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon submittedActivitiesWithHandler:](self->_daemon, "submittedActivitiesWithHandler:", a3);
  }
}

- (void)delayedRunningActivitiesWithHandler:(id)a3
{
  NSObject *v5;

  if (self->_restricted)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon delayedRunningActivitiesWithHandler:](self->_daemon, "delayedRunningActivitiesWithHandler:", a3);
  }
}

- (void)runningActivitiesWithHandler:(id)a3
{
  NSObject *v5;

  if (self->_restricted)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon runningActivitiesWithHandler:](self->_daemon, "runningActivitiesWithHandler:", a3);
  }
}

- (void)runningGroupActivitiesWithHandler:(id)a3
{
  NSObject *v5;

  if (self->_restricted)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon runningGroupActivitiesWithHandler:](self->_daemon, "runningGroupActivitiesWithHandler:", a3);
  }
}

- (void)scoresForActivityWithName:(id)a3 withHandler:(id)a4
{
  NSObject *v6;

  if (self->_restricted)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar"), a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon scoresForActivityWithName:withHandler:](self->_daemon, "scoresForActivityWithName:withHandler:", a3, a4);
  }
}

- (void)activityRunStatisticsWithHandler:(id)a3
{
  NSObject *v5;

  if (self->_restricted)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon activityRunStatisticsWithHandler:](self->_daemon, "activityRunStatisticsWithHandler:", a3);
  }
}

- (void)forceRunActivities:(id)a3
{
  NSObject *v5;

  if (self->_restricted)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon forceRunActivities:](self->_daemon, "forceRunActivities:", a3);
  }
}

- (void)runActivitiesWithUrgency:(int64_t)a3 activities:(id)a4
{
  NSObject *v6;

  if (self->_restricted)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar"), a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon runActivitiesWithUrgency:activities:](self->_daemon, "runActivitiesWithUrgency:activities:", a3, a4);
  }
}

- (void)deferActivities:(id)a3 withHandler:(id)a4
{
  NSObject *v6;

  if (self->_restricted)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar"), a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon deferActivities:withHandler:](self->_daemon, "deferActivities:withHandler:", a3, a4);
  }
}

- (void)currentPredictionsWithHandler:(id)a3
{
  NSObject *v5;

  if (self->_restricted)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon currentPredictionsWithHandler:](self->_daemon, "currentPredictionsWithHandler:", a3);
  }
}

- (void)statisticsWithHandler:(id)a3
{
  NSObject *v5;

  if (self->_restricted)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon statisticsWithHandler:](self->_daemon, "statisticsWithHandler:", a3);
  }
}

- (void)forceResetOfResultIdentifier:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;

  v5 = a3;
  if (self->_restricted)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("dependencies")));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityDependencyManager sharedInstance](_DASActivityDependencyManager, "sharedInstance"));
    objc_msgSend(v7, "dastool_forceResetOfResultIdentifier:", v5);

  }
}

- (void)queryStatusOfResultIdentifier:(id)a3 withHandler:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  NSObject *v9;
  void *v10;
  void *v11;

  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  if (self->_restricted)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("dependencies")));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityDependencyManager sharedInstance](_DASActivityDependencyManager, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dastool_queryStatusOfResultIdentifier:", v7));

    v8[2](v8, v11);
  }

}

- (void)queryDependenciesOfTaskIdentifier:(id)a3 withHandler:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[2];
  _QWORD v29[2];
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];

  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  if (self->_restricted)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("dependencies")));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon getActivityWithName:](self->_daemon, "getActivityWithName:", v7));
    if (v10)
    {
      v23 = v7;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dependencies"));
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v25 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
            v18 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("dependencies")));
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v31 = v17;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "dependency: %@", buf, 0xCu);
            }

            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dictionary"));
            objc_msgSend(v11, "addEntriesFromDictionary:", v19);

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        }
        while (v14);
      }

      v28[0] = CFSTR("activityIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
      v28[1] = CFSTR("dependencies");
      v29[0] = v20;
      v29[1] = v11;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 2));
      v8[2](v8, v21);

      v7 = v23;
    }
    else
    {
      v22 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("dependencies")));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_1000EAED4();

      v8[2](v8, 0);
    }

  }
}

- (void)deleteLimitForActivity:(id)a3 forLimiterWithName:(id)a4 handler:(id)a5
{
  NSObject *v7;

  if (self->_restricted)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("budgeting"), a4, a5));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon deleteLimitForActivity:forLimiterWithName:handler:](self->_daemon, "deleteLimitForActivity:forLimiterWithName:handler:", a3, a4, a5);
  }
}

- (void)updateLimit:(double)a3 forActivity:(id)a4 forLimiterWithName:(id)a5 handler:(id)a6
{
  NSObject *v8;

  if (self->_restricted)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("budgeting"), a5, a6, a3));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon updateLimit:forActivity:forLimiterWithName:handler:](self->_daemon, "updateLimit:forActivity:forLimiterWithName:handler:", a4, a5, a6, a3);
  }
}

- (void)getLimiterResponseForActivity:(id)a3 handler:(id)a4
{
  NSObject *v6;

  if (self->_restricted)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("budgeting"), a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon getLimiterResponseForActivity:handler:](self->_daemon, "getLimiterResponseForActivity:handler:", a3, a4);
  }
}

- (void)getRuntimeLimit:(id)a3 handler:(id)a4
{
  NSObject *v6;

  if (self->_restricted)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("budgeting"), a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon getRuntimeLimit:handler:](self->_daemon, "getRuntimeLimit:handler:", a3, a4);
  }
}

- (void)getElapsedRuntimes:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  NSObject *v8;

  if (self->_restricted)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("latency"), a4, a5, a6));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon getElapsedRuntimes:timeFilter:bgsqlData:handler:](self->_daemon, "getElapsedRuntimes:timeFilter:bgsqlData:handler:", a3, a4, a5, a6);
  }
}

- (void)getEstimatedRuntimes:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  NSObject *v8;

  if (self->_restricted)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("latency"), a4, a5, a6));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon getEstimatedRuntimes:timeFilter:bgsqlData:handler:](self->_daemon, "getEstimatedRuntimes:timeFilter:bgsqlData:handler:", a3, a4, a5, a6);
  }
}

- (void)getConditionsPenalties:(id)a3 handler:(id)a4
{
  NSObject *v6;

  if (self->_restricted)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("latency"), a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon getConditionsPenalties:handler:](self->_daemon, "getConditionsPenalties:handler:", a3, a4);
  }
}

- (void)getFeatureTimelines:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  NSObject *v8;

  if (self->_restricted)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("latency"), a4, a5, a6));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon getFeatureTimelines:timeFilter:bgsqlData:handler:](self->_daemon, "getFeatureTimelines:timeFilter:bgsqlData:handler:", a3, a4, a5, a6);
  }
}

- (void)getActivityTimelines:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  NSObject *v8;

  if (self->_restricted)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("latency"), a4, a5, a6));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon getActivityTimelines:timeFilter:bgsqlData:handler:](self->_daemon, "getActivityTimelines:timeFilter:bgsqlData:handler:", a3, a4, a5, a6);
  }
}

- (void)getDeviceConditionTimelines:(id)a3 bgsqlData:(id)a4 handler:(id)a5
{
  NSObject *v7;

  if (self->_restricted)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("latency"), a4, a5));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon getDeviceConditionTimelines:bgsqlData:handler:](self->_daemon, "getDeviceConditionTimelines:bgsqlData:handler:", a3, a4, a5);
  }
}

- (void)getEstimatedMADCompletionTimes:(id)a3 endDate:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  NSObject *v8;

  if (self->_restricted)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("latency"), a4, a5, a6));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon getEstimatedMADCompletionTimes:endDate:bgsqlData:handler:](self->_daemon, "getEstimatedMADCompletionTimes:endDate:bgsqlData:handler:", a3, a4, a5, a6);
  }
}

- (void)allBudgetsWithHandler:(id)a3
{
  NSObject *v5;

  if (self->_restricted)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("budgeting")));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon allBudgetsWithHandler:](self->_daemon, "allBudgetsWithHandler:", a3);
  }
}

- (void)balanceForBudgetWithName:(id)a3 withHandler:(id)a4
{
  NSObject *v6;

  if (self->_restricted)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("budgeting"), a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon balanceForBudgetWithName:withHandler:](self->_daemon, "balanceForBudgetWithName:withHandler:", a3, a4);
  }
}

- (void)setBalance:(double)a3 forBudgetWithName:(id)a4
{
  NSObject *v6;

  if (self->_restricted)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("budgeting"), a3));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon setBalance:forBudgetWithName:](self->_daemon, "setBalance:forBudgetWithName:", a4, a3);
  }
}

- (void)decrementBy:(double)a3 forBudgetWithName:(id)a4
{
  NSObject *v6;

  if (self->_restricted)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("budgeting"), a3));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon decrementBy:forBudgetWithName:](self->_daemon, "decrementBy:forBudgetWithName:", a4, a3);
  }
}

- (void)setCapacity:(double)a3 forBudgetWithName:(id)a4
{
  NSObject *v6;

  if (self->_restricted)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("budgeting"), a3));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon setCapacity:forBudgetWithName:](self->_daemon, "setCapacity:forBudgetWithName:", a4, a3);
  }
}

- (void)policiesWithHandler:(id)a3
{
  NSObject *v5;

  if (self->_restricted)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon policiesWithHandler:](self->_daemon, "policiesWithHandler:", a3);
  }
}

- (void)clasStatusWithHandler:(id)a3
{
  NSObject *v5;

  if (self->_restricted)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("clas")));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon clasStatusWithHandler:](self->_daemon, "clasStatusWithHandler:", a3);
  }
}

- (void)evaluatePolicies:(id)a3 handler:(id)a4
{
  NSObject *v6;

  if (self->_restricted)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar"), a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon evaluatePolicies:handler:](self->_daemon, "evaluatePolicies:handler:", a3, a4);
  }
}

- (void)evaluateAllActivities:(id)a3 handler:(id)a4
{
  NSObject *v6;

  if (self->_restricted)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar"), a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon evaluateAllActivities:handler:](self->_daemon, "evaluateAllActivities:handler:", a3, a4);
  }
}

- (void)runProceedableActivities:(id)a3 handler:(id)a4
{
  NSObject *v6;

  if (self->_restricted)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar"), a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon runProceedableActivities:handler:](self->_daemon, "runProceedableActivities:handler:", a3, a4);
  }
}

- (void)activityContainsOverrides:(id)a3 handler:(id)a4
{
  NSObject *v6;

  if (self->_restricted)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar"), a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon activityContainsOverrides:handler:](self->_daemon, "activityContainsOverrides:handler:", a3, a4);
  }
}

- (void)blockingPoliciesWithParameters:(id)a3 handler:(id)a4
{
  NSObject *v6;

  if (self->_restricted)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar"), a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon blockingPoliciesWithParameters:handler:](self->_daemon, "blockingPoliciesWithParameters:handler:", a3, a4);
  }
}

- (void)enterTestModeWithParameters:(id)a3 reset:(BOOL)a4 handler:(id)a5
{
  NSObject *v7;

  if (self->_restricted)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar"), a4, a5));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon enterTestModeWithParameters:reset:handler:](self->_daemon, "enterTestModeWithParameters:reset:handler:", a3, a4, a5);
  }
}

- (void)enableTaskRegistryMode:(BOOL)a3 processes:(id)a4 handler:(id)a5
{
  NSObject *v7;

  if (self->_restricted)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar"), a4, a5));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon enableTaskRegistryMode:processes:handler:](self->_daemon, "enableTaskRegistryMode:processes:handler:", a3, a4, a5);
  }
}

- (void)submitRateLimitConfiguration:(id)a3 handler:(id)a4
{
  NSObject *v6;

  if (self->_restricted)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar"), a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon submitRateLimitConfiguration:handler:](self->_daemon, "submitRateLimitConfiguration:handler:", a3, a4);
  }
}

- (void)pauseWithParameters:(id)a3 handler:(id)a4
{
  NSObject *v6;

  if (self->_restricted)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar"), a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon pauseWithParameters:handler:](self->_daemon, "pauseWithParameters:handler:", a3, a4);
  }
}

- (void)addPauseExceptParameter:(id)a3 handler:(id)a4
{
  NSObject *v6;

  if (self->_restricted)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar"), a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon addPauseExceptParameter:handler:](self->_daemon, "addPauseExceptParameter:handler:", a3, a4);
  }
}

- (void)reportSystemWorkload:(unint64_t)a3 ofCategory:(unint64_t)a4 withHandler:(id)a5
{
  -[_DASDaemon reportSystemWorkload:ofCategory:withHandler:](self->_daemon, "reportSystemWorkload:ofCategory:withHandler:", a3, a4, a5);
}

- (void)reportFeatureCheckpoint:(unint64_t)a3 forFeature:(unint64_t)a4 withHandler:(id)a5
{
  -[_DASDaemon reportFeatureCheckpoint:forFeature:withHandler:](self->_daemon, "reportFeatureCheckpoint:forFeature:withHandler:", a3, a4, a5);
}

- (void)reportCustomCheckpoint:(unint64_t)a3 forTask:(id)a4 withHandler:(id)a5
{
  -[_DASDaemon reportCustomCheckpoint:forTask:withHandler:](self->_daemon, "reportCustomCheckpoint:forTask:withHandler:", a3, a4, a5);
}

- (void)activityStartedWithParameters:(id)a3
{
  -[_DASDaemon activityStartedWithParameters:](self->_daemon, "activityStartedWithParameters:", a3);
}

- (void)activityStoppedWithParameters:(id)a3
{
  -[_DASDaemon activityStoppedWithParameters:](self->_daemon, "activityStoppedWithParameters:", a3);
}

- (void)prewarmApplication:(id)a3
{
  NSObject *v5;

  if (self->_restricted)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000EA750(a2);

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  else
  {
    -[_DASDaemon prewarmApplication:](self->_daemon, "prewarmApplication:", a3);
  }
}

- (void)prewarmSuspendWithHandler:(id)a3
{
  void *v4;
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemonClient mainApplicationBundleIdentifier](self, "mainApplicationBundleIdentifier"));
  if (!v4)
    v5[2](v5, 0);
  -[_DASDaemon prewarmSuspendApplication:withHandler:](self->_daemon, "prewarmSuspendApplication:withHandler:", v4, v5);

}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSMutableSet)submittedTasks
{
  return self->_submittedTasks;
}

- (void)setSubmittedTasks:(id)a3
{
  objc_storeStrong((id *)&self->_submittedTasks, a3);
}

- (NSMutableSet)delayedStartTasks
{
  return self->_delayedStartTasks;
}

- (void)setDelayedStartTasks:(id)a3
{
  objc_storeStrong((id *)&self->_delayedStartTasks, a3);
}

- (NSMutableSet)startedTasks
{
  return self->_startedTasks;
}

- (void)setStartedTasks:(id)a3
{
  objc_storeStrong((id *)&self->_startedTasks, a3);
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, a3);
}

- (void)setMainApplicationBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_mainApplicationBundleIdentifier, a3);
}

- (_DASDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
  objc_storeStrong((id *)&self->_daemon, a3);
}

- (NSMutableSet)runningBGTasks
{
  return self->_runningBGTasks;
}

- (void)setRunningBGTasks:(id)a3
{
  objc_storeStrong((id *)&self->_runningBGTasks, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (BOOL)restricted
{
  return self->_restricted;
}

- (void)setRestricted:(BOOL)a3
{
  self->_restricted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningBGTasks, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_mainApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_startedTasks, 0);
  objc_storeStrong((id *)&self->_delayedStartTasks, 0);
  objc_storeStrong((id *)&self->_submittedTasks, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
