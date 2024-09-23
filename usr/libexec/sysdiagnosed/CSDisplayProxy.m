@implementation CSDisplayProxy

+ (BOOL)isHost
{
  if (qword_1000B9790 != -1)
    dispatch_once(&qword_1000B9790, &stru_100099348);
  return byte_1000B9788;
}

+ (id)description
{
  if (+[CSDisplayProxy isHost](CSDisplayProxy, "isHost"))
    return CFSTR("DisplayProxyRemote");
  else
    return CFSTR("DisplayProxyHost");
}

+ (void)browseDevices:(id)a3
{
  id v3;
  uint64_t v4;
  dispatch_semaphore_t v5;
  dispatch_queue_global_t global_queue;
  void *v7;
  NSObject *v8;
  id v9;
  dispatch_time_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t description;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, int);
  void *v21;
  NSObject *v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;

  v3 = a3;
  if (+[CSDisplayProxy isHost](CSDisplayProxy, "isHost"))
    v4 = 11;
  else
    v4 = 12;
  v5 = dispatch_semaphore_create(0);
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  global_queue = dispatch_get_global_queue(0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v18 = _NSConcreteStackBlock;
  v19 = 3221225472;
  v20 = sub_100022170;
  v21 = &unk_100099370;
  v8 = v5;
  v22 = v8;
  v24 = &v30;
  v25 = &v26;
  v9 = v3;
  v23 = v9;
  remote_device_browse_present(v4, v7, &v18);

  v10 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v8, v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance", v18, v19, v20, v21, v22));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "logSubsystem"));

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10005F3E0(v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance", v18, v19, v20, v21));
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "logSubsystem"));

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v31[3];
    v16 = v27[3];
    description = remote_device_type_get_description(v4);
    *(_DWORD *)buf = 134218498;
    v35 = v15;
    v36 = 2048;
    v37 = v16;
    v38 = 2080;
    v39 = description;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "CSDisplayProxy: Finished browsing. Found %lu devices (%lu usable) of type %s", buf, 0x20u);
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

}

+ (BOOL)isAutomaticCoSysdiagnosePossible
{
  void *v2;
  NSObject *v3;
  const char *v4;
  char v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint8_t buf[4];
  const char *v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100022470;
  v7[3] = &unk_100099398;
  v7[4] = &v8;
  +[CSDisplayProxy browseDevices:](CSDisplayProxy, "browseDevices:", v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "logSubsystem"));

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (*((_BYTE *)v9 + 24))
      v4 = "";
    else
      v4 = " not";
    *(_DWORD *)buf = 136315138;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CSDisplayProxy: Automatic co-sysdiagnose is%s possible", buf, 0xCu);
  }

  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

+ (id)getProxiesForDiagnosticID:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v9;
  NSObject *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  uint8_t *v16;
  uint8_t v17[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  id v24;

  v3 = a3;
  if ((sub_100046438() & 1) != 0 || (sub_1000463D4() & 1) != 0 || (sub_10004649C() & 1) != 0)
  {
    *(_QWORD *)v17 = 0;
    v18 = v17;
    v19 = 0x3032000000;
    v20 = sub_1000226BC;
    v21 = sub_1000226CC;
    v22 = objc_alloc_init((Class)NSMutableArray);
    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = sub_1000226D4;
    v14 = &unk_1000993C0;
    v15 = v3;
    v16 = v17;
    +[CSDisplayProxy browseDevices:](CSDisplayProxy, "browseDevices:", &v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance", v11, v12, v13, v14));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "logSubsystem"));

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(*((id *)v18 + 5), "count");
      *(_DWORD *)buf = 134217984;
      v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CSDisplayProxy: getProxies found total: %lu", buf, 0xCu);
    }

    v7 = objc_msgSend(*((id *)v18 + 5), "copy");
    _Block_object_dispose(v17, 8);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "logSubsystem"));

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CSDisplayProxy: On iOS, but not iPhone, iPad, or darwinOS. Returning no proxies", v17, 2u);
    }

    v7 = &__NSArray0__struct;
  }

  return v7;
}

- (unint64_t)getTimeoutSec
{
  void *v2;
  NSObject *v3;
  int v5;
  uint64_t v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "logSubsystem"));

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = 60;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CSDisplayProxy: timeout target requested. Using %lus", (uint8_t *)&v5, 0xCu);
  }

  return 60;
}

@end
