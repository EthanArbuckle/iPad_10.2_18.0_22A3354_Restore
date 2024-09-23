@implementation NRDUpdateDaemonServerImpl

+ (id)sharedInstance
{
  if (sharedInstance_pred != -1)
    dispatch_once(&sharedInstance_pred, &__block_literal_global_2);
  return (id)sharedInstance___instance;
}

void __43__NRDUpdateDaemonServerImpl_sharedInstance__block_invoke(id a1)
{
  void *v1;
  NRDUpdateDaemonServerImpl *v2;
  void *v3;

  v1 = objc_autoreleasePoolPush();
  v2 = objc_alloc_init(NRDUpdateDaemonServerImpl);
  v3 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v2;

  objc_autoreleasePoolPop(v1);
}

- (BOOL)allowBackgroundActivity
{
  int has_internal_content;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  has_internal_content = os_variant_has_internal_content("com.apple.NRDUpdated", a2);
  return edt_supports_recoveryos(has_internal_content, v3, v4, v5, v6, v7, v8, v9);
}

- (void)runUntilExit
{
  unsigned int v3;
  void *v4;
  dispatch_queue_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD *v11;
  id v12;
  dispatch_queue_global_t global_queue;
  NSObject *v14;
  _QWORD *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  __CFString *v23;
  _QWORD *v24;
  _QWORD v25[4];
  id v26;
  __CFString *v27;
  _QWORD v28[5];
  char v29;

  v3 = -[NRDUpdateDaemonServerImpl allowBackgroundActivity](self, "allowBackgroundActivity");
  v4 = objc_autoreleasePoolPush();
  +[NSXPCListener enableTransactions](NSXPCListener, "enableTransactions");
  v5 = dispatch_queue_create("com.apple.NRDUpdated.connectionQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  v6 = (void *)__connectionQueue;
  __connectionQueue = (uint64_t)v5;

  v7 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.mobile.NRDUpdated"));
  v8 = (void *)__listener;
  __listener = (uint64_t)v7;

  objc_msgSend((id)__listener, "setDelegate:", self);
  objc_msgSend((id)__listener, "_setQueue:", __connectionQueue);
  v9 = objc_msgSend(objc_alloc((Class)NSBackgroundActivityScheduler), "initWithIdentifier:", CFSTR("com.apple.mobile.NRDUpdated-RecoveryOSUpdateBrain_download"));
  objc_msgSend(v9, "setPreregistered:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke;
  v28[3] = &unk_100014878;
  v29 = v3;
  v28[4] = self;
  v11 = objc_retainBlock(v28);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_198;
  v25[3] = &unk_1000148A0;
  v12 = v10;
  v26 = v12;
  v27 = CFSTR("com.apple.mobile.NRDUpdated-RecoveryOSUpdateBrain_download");
  objc_msgSend(v9, "setCheckInHandler:", v25);
  if (v3)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_199;
    v21[3] = &unk_1000148C8;
    v22 = v12;
    v23 = CFSTR("com.apple.mobile.NRDUpdated-RecoveryOSUpdateBrain_download");
    v24 = v11;
    objc_msgSend(v9, "scheduleWithBlock:", v21);

  }
  global_queue = dispatch_get_global_queue(17, 0);
  v14 = objc_claimAutoreleasedReturnValue(global_queue);
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_201;
  v19 = &unk_1000148F0;
  v20 = v11;
  v15 = v11;
  dispatch_async(v14, &v16);

  objc_autoreleasePoolPop(v4);
  -[NRDUpdateDaemonServerImpl _run](self, "_run", v16, v17, v18, v19);

}

void __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke(uint64_t a1)
{
  _QWORD v1[5];
  char v2;

  v1[0] = _NSConcreteStackBlock;
  v1[1] = 3221225472;
  v1[2] = __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_2;
  v1[3] = &unk_100014878;
  v2 = *(_BYTE *)(a1 + 40);
  v1[4] = *(_QWORD *)(a1 + 32);
  if (__listener_block_invoke_onceToken != -1)
    dispatch_once(&__listener_block_invoke_onceToken, v1);
}

id __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_2(uint64_t a1)
{
  const __CFBoolean *v2;
  _BYTE *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  const char *v13;
  id v14;
  NSObject *v15;
  char *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  size_t v22;
  uint8_t buf[16];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  v2 = (const __CFBoolean *)MGCopyAnswer(CFSTR("SigningFuse"), 0);
  if (v2 != kCFBooleanFalse)
    goto LABEL_3;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  *(_OWORD *)buf = 0u;
  v24 = 0u;
  v22 = 256;
  if (sysctlbyname("kern.bootargs", buf, &v22, 0, 0))
  {
LABEL_3:
    CFRelease(v2);
    v3 = (_BYTE *)(a1 + 40);
    if (*(_BYTE *)(a1 + 40))
      goto LABEL_4;
LABEL_18:
    v18 = nrdSharedLogger();
    v12 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "Skipping RecoveryOSUpdateBrain launch on startup because background activity is not allowed.";
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  v16 = strstr((char *)buf, "msu_nrd_brain_no_launch=1");
  CFRelease(v2);
  v3 = (_BYTE *)(a1 + 40);
  if (!*(_BYTE *)(a1 + 40))
    goto LABEL_18;
  if (v16)
  {
    v17 = nrdSharedLogger();
    v12 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "Skipping RecoveryOSUpdateBrain launch on startup due to nvram boot-arg msu_nrd_brain_no_launch=1";
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
    }
LABEL_21:

    goto LABEL_22;
  }
LABEL_4:
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("EnableUpdateOnLaunch")));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("EnableUpdateOnLaunch"));

    if (!v8)
    {
      v9 = nrdSharedLogger();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Skipping RecoveryOSUpdateBrain launch on startup", buf, 2u);
      }

      v11 = nrdSharedLogger();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      *(_WORD *)buf = 0;
      v13 = "To enable RecoveryOSUpdateBrain launch on startup set the following for the 'mobile' user: defaults write co"
            "m.apple.mobile.NRDUpdated EnableUpdateOnLaunch -BOOL YES";
      goto LABEL_20;
    }
  }
  else
  {

  }
  v14 = nrdSharedLogger();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Attempting RecoveryOSUpdateBrain download/launch on startup", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "update:", &__block_literal_global_197);
LABEL_22:
  if (*v3)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "core"));
    objc_msgSend(v19, "scheduleNRDUpdateBrainReScan:", 1);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "core"));
    objc_msgSend(v20, "scheduleNRDUpdateBrainPeriodicScan");

  }
  return objc_msgSend((id)__listener, "resume");
}

void __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_195(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12[16];

  v2 = a2;
  v3 = nrdSharedLogger();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_195_cold_1((uint64_t)v2, v5, v6, v7, v8, v9, v10, v11);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "RecoveryOSUpdateBrain launch completed successfully", v12, 2u);
  }

}

void __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_198(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;

  v2 = nrdSharedLogger();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v10 = 138412546;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Activity %@ \"%@\" check-in.", (uint8_t *)&v10, 0x16u);
  }

  v6 = nrdSharedLogger();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Activity %@ \"%@\" check-in complete.", (uint8_t *)&v10, 0x16u);
  }

}

void __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_199(_QWORD *a1, void *a2)
{
  void (**v3)(id, uint64_t);
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;

  v3 = a2;
  v4 = nrdSharedLogger();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v7 = a1[5];
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Activity %@ \"%@\" fired.", (uint8_t *)&v12, 0x16u);
  }

  (*(void (**)(void))(a1[6] + 16))();
  v8 = nrdSharedLogger();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = a1[4];
    v11 = a1[5];
    v12 = 138412546;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Activity %@ \"%@\" completed.", (uint8_t *)&v12, 0x16u);
  }

  v3[2](v3, 1);
}

void __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_201(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v2 = nrdSharedLogger();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Startup task executing", buf, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = nrdSharedLogger();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Startup task execution complete.", v6, 2u);
  }

}

- (NRDUpdateDaemonServerImpl)init
{
  NRDUpdateDaemonServerImpl *v2;
  NRDUpdateDCore *v3;
  dispatch_queue_t v4;
  dispatch_semaphore_t v5;
  OS_dispatch_semaphore *updateSemaphore;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NRDUpdateDaemonServerImpl;
  v2 = -[NRDUpdateDaemonServerImpl init](&v8, "init");
  if (v2)
  {
    v3 = -[NRDUpdateDCore initWithDelegate:](objc_opt_new(NRDUpdateDCore), "initWithDelegate:", v2);
    -[NRDUpdateDaemonServerImpl setCore:](v2, "setCore:", v3);
    v4 = dispatch_queue_create("com.apple.NRDUpdateDServer.update", 0);
    -[NRDUpdateDaemonServerImpl setUpdateQueue:](v2, "setUpdateQueue:", v4);

    v5 = dispatch_semaphore_create(0);
    updateSemaphore = v2->_updateSemaphore;
    v2->_updateSemaphore = (OS_dispatch_semaphore *)v5;

  }
  return v2;
}

- (void)updateHelper:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[NRDUpdateDaemonServerImpl updateQueue](self, "updateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __51__NRDUpdateDaemonServerImpl_updateHelper_callback___block_invoke;
  block[3] = &unk_100014918;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __51__NRDUpdateDaemonServerImpl_updateHelper_callback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "needsRelaunchError"));
  if (v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "core"));
    objc_msgSend(v3, "setUpdateOptions:", v2);

    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "core"));
    objc_msgSend(v4, "performUpdate:", 0);

    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 8), 0xFFFFFFFFFFFFFFFFLL);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "completedWithError"));
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
}

- (void)update:(id)a3
{
  -[NRDUpdateDaemonServerImpl updateHelper:callback:](self, "updateHelper:callback:", 0, a3);
}

- (BOOL)_isBrainRelaunchRequired:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  v3 = a3;
  if (!v3)
    return 0;
  v4 = v3;
  do
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("NRDUpdateErrorDomain")))
    {
      v6 = objc_msgSend(v4, "code");

      if (v6 == (id)112)
      {
        v9 = 1;
        goto LABEL_10;
      }
    }
    else
    {

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

    v4 = (void *)v8;
  }
  while (v8);
  v9 = 0;
LABEL_10:

  return v9;
}

- (void)updateCompleted:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14[16];

  v4 = a3;
  -[NRDUpdateDaemonServerImpl setCompletedWithError:](self, "setCompletedWithError:", v4);
  v5 = nrdSharedLogger();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[NRDUpdateDaemonServerImpl updateCompleted:].cold.1((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "update completed successfully", v14, 2u);
  }

  if (-[NRDUpdateDaemonServerImpl _isBrainRelaunchRequired:](self, "_isBrainRelaunchRequired:", v4))
    -[NRDUpdateDaemonServerImpl requestExit:reason:relaunchError:](self, "requestExit:reason:relaunchError:", 0, CFSTR("NRD brain has downloaded a new brain (via NSError)"), v4);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_updateSemaphore);

}

- (void)requestExit:(int)a3 reason:(id)a4
{
  -[NRDUpdateDaemonServerImpl requestExit:reason:relaunchError:](self, "requestExit:reason:relaunchError:", *(_QWORD *)&a3, a4, 0);
}

- (void)requestExit:(int)a3 reason:(id)a4 relaunchError:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  int v16;
  uint8_t buf[4];
  id v18;

  v8 = a4;
  v9 = a5;
  v10 = nrdSharedLogger();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Daemon exit requested for reason: %@", buf, 0xCu);
  }

  if (v9)
    -[NRDUpdateDaemonServerImpl setNeedsRelaunchError:](self, "setNeedsRelaunchError:", v9);
  v12 = objc_claimAutoreleasedReturnValue(-[NRDUpdateDaemonServerImpl updateQueue](self, "updateQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __62__NRDUpdateDaemonServerImpl_requestExit_reason_relaunchError___block_invoke;
  v14[3] = &unk_100014940;
  v16 = a3;
  v15 = v8;
  v13 = v8;
  dispatch_async(v12, v14);

}

void __62__NRDUpdateDaemonServerImpl_requestExit_reason_relaunchError___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  _DWORD v6[2];
  __int16 v7;
  uint64_t v8;

  sleep(1u);
  v2 = nrdSharedLogger();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_DWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 32);
    v6[0] = 67109378;
    v6[1] = v4;
    v7 = 2112;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Exiting with status:%d for reason:%@", (uint8_t *)v6, 0x12u);
  }

  exit(*(_DWORD *)(a1 + 40));
}

- (void)getNRDUpdateBrainEndpoint:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSErrorUserInfoKey v13;
  const __CFString *v14;
  NSErrorUserInfoKey v15;
  const __CFString *v16;

  v4 = (void (**)(id, _QWORD, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDaemonServerImpl core](self, "core"));

  if (!v5)
  {
    v15 = NSDebugDescriptionErrorKey;
    v16 = CFSTR("core is not initialized");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    v11 = 604;
LABEL_6:
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NRDUpdatedDomain"), v11, v10));
    v4[2](v4, 0, v12);

    goto LABEL_7;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDaemonServerImpl core](self, "core"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "runningBrain"));

  if (!v7)
  {
    v13 = NSDebugDescriptionErrorKey;
    v14 = CFSTR("no running brain");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    v11 = 605;
    goto LABEL_6;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDaemonServerImpl core](self, "core"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "runningBrain"));
  objc_msgSend(v9, "getListenerEndpoint:", v4);

LABEL_7:
}

- (BOOL)isConnectionEntitled:(id)a3
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForEntitlement:", CFSTR("com.apple.private.allow-NRDUpdated")));
  if (!v3)
  {
    v6 = nrdSharedLogger();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[NRDUpdateDaemonServerImpl isConnectionEntitled:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    goto LABEL_11;
  }
  v4 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
  {
    v15 = nrdSharedLogger();
    v7 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[NRDUpdateDaemonServerImpl isConnectionEntitled:].cold.3(v7, v16, v17, v18, v19, v20, v21, v22);
    goto LABEL_11;
  }
  if ((objc_msgSend(v3, "BOOLValue") & 1) == 0)
  {
    v23 = nrdSharedLogger();
    v7 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[NRDUpdateDaemonServerImpl isConnectionEntitled:].cold.2(v7, v24, v25, v26, v27, v28, v29, v30);
LABEL_11:

    v5 = 0;
    goto LABEL_12;
  }
  v5 = 1;
LABEL_12:

  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t v22[16];
  uint8_t buf[16];

  v5 = a4;
  v6 = nrdSharedLogger();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "shouldAcceptNewConnection", buf, 2u);
  }

  v8 = -[NRDUpdateDaemonServerImpl isConnectionEntitled:](self, "isConnectionEntitled:", v5);
  if (v8)
  {
    objc_msgSend(v5, "_setQueue:", __connectionQueue);
    objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_219);
    objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_221);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NRDUpdatedProtocol));
    objc_msgSend(v5, "setExportedInterface:", v9);
    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(v5, "resume");
    v10 = nrdSharedLogger();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "shouldAcceptNewConnection resumed", v22, 2u);
    }

  }
  else
  {
    v12 = nrdSharedLogger();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[NRDUpdateDaemonServerImpl listener:shouldAcceptNewConnection:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

    objc_msgSend(v5, "invalidate");
  }

  return v8;
}

void __64__NRDUpdateDaemonServerImpl_listener_shouldAcceptNewConnection___block_invoke(id a1)
{
  id v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = nrdSharedLogger();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __64__NRDUpdateDaemonServerImpl_listener_shouldAcceptNewConnection___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

}

void __64__NRDUpdateDaemonServerImpl_listener_shouldAcceptNewConnection___block_invoke_220(id a1)
{
  id v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = nrdSharedLogger();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __64__NRDUpdateDaemonServerImpl_listener_shouldAcceptNewConnection___block_invoke_220_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

}

- (NRDUpdateDCore)core
{
  return self->_core;
}

- (void)setCore:(id)a3
{
  objc_storeStrong((id *)&self->_core, a3);
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_updateQueue, a3);
}

- (NSError)completedWithError
{
  return self->_completedWithError;
}

- (void)setCompletedWithError:(id)a3
{
  objc_storeStrong((id *)&self->_completedWithError, a3);
}

- (NSError)needsRelaunchError
{
  return self->_needsRelaunchError;
}

- (void)setNeedsRelaunchError:(id)a3
{
  objc_storeStrong((id *)&self->_needsRelaunchError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_needsRelaunchError, 0);
  objc_storeStrong((id *)&self->_completedWithError, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_core, 0);
  objc_storeStrong((id *)&self->_updateSemaphore, 0);
}

void __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_195_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, a2, a3, "RecoveryOSUpdateBrain launch completed with error:%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)updateCompleted:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, a2, a3, "update completed with error:%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)isConnectionEntitled:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, a1, a3, "Client process does not have the '%@' entitlement", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)isConnectionEntitled:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, a1, a3, "Value for entitlement %@ is false", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)isConnectionEntitled:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, a1, a3, "Entitlement '%@' is not a BOOLean", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)listener:(uint64_t)a3 shouldAcceptNewConnection:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a1, a3, "Rejecting connection - not entitled", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __64__NRDUpdateDaemonServerImpl_listener_shouldAcceptNewConnection___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a1, a3, "client connection interrupted.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __64__NRDUpdateDaemonServerImpl_listener_shouldAcceptNewConnection___block_invoke_220_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a1, a3, "client connection invalidated.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

@end
