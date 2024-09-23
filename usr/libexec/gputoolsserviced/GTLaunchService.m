@implementation GTLaunchService

- (GTLaunchService)initWithServiceProvider:(id)a3
{
  id v5;
  GTLaunchService *v6;
  os_log_t v7;
  OS_os_log *log;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTLaunchService;
  v6 = -[GTLaunchService init](&v10, "init");
  if (v6)
  {
    v7 = os_log_create("com.apple.gputools.transport", "GTLaunchService");
    log = v6->_log;
    v6->_log = (OS_os_log *)v7;

    objc_storeStrong((id *)&v6->_serviceProvider, a3);
  }

  return v6;
}

- (void)symbolicatorSignatureForPid:(int)a3 completionHandler:(id)a4
{
  id v5;
  dispatch_queue_global_t global_queue;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  int v11;

  v5 = a4;
  global_queue = dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue(global_queue);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001BDDC;
  v9[3] = &unk_100030F00;
  v11 = a3;
  v10 = v5;
  v8 = v5;
  dispatch_async(v7, v9);

}

- (void)launchReplayerLocallyWithConfigurationEmbedded:(id)a3 competionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[3];
  _QWORD v23[3];

  v6 = a4;
  v22[0] = FBSOpenApplicationOptionKeyDebuggingOptions;
  v20[0] = FBSDebugOptionKeyArguments;
  v7 = a3;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("arguments")));
  v9 = (void *)v8;
  v10 = &__NSArray0__struct;
  if (v8)
    v10 = (void *)v8;
  v21[0] = v10;
  v20[1] = FBSDebugOptionKeyEnvironment;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("environment")));

  v12 = &__NSDictionary0__struct;
  if (v11)
    v12 = v11;
  v21[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
  v23[0] = v13;
  v23[1] = &__kCFBooleanTrue;
  v22[1] = FBSOpenApplicationOptionKeyUnlockDevice;
  v22[2] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v23[2] = &__kCFBooleanTrue;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 3));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationService serviceWithDefaultShellEndpoint](FBSOpenApplicationService, "serviceWithDefaultShellEndpoint"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationOptions optionsWithDictionary:](FBSOpenApplicationOptions, "optionsWithDictionary:", v14));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001BCC4;
  v18[3] = &unk_100030F28;
  v18[4] = self;
  v19 = v6;
  v17 = v6;
  objc_msgSend(v15, "openApplication:withOptions:completion:", CFSTR("com.apple.MTLReplayer"), v16, v18);

}

- (void)launchReplayerLocallyWithConfiguration:(id)a3 competionHandler:(id)a4
{
  -[GTLaunchService launchReplayerLocallyWithConfigurationEmbedded:competionHandler:](self, "launchReplayerLocallyWithConfigurationEmbedded:competionHandler:", a3, a4);
}

- (BOOL)resumeTaskForPid:(int)a3 error:(id *)a4
{
  uint64_t v5;
  OS_os_log *log;
  mach_error_t v8;
  NSString *v9;
  void *v10;
  void *v11;
  OS_os_log *v12;
  _BOOL4 v13;
  id v14;
  NSObject *v15;
  void *v16;
  mach_error_t v17;
  mach_error_t v18;
  NSString *v19;
  void *v20;
  OS_os_log *v21;
  NSString *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  void *v28;
  task_read_t target_task;
  NSErrorUserInfoKey v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  NSErrorUserInfoKey v35;
  void *v36;

  v5 = *(_QWORD *)&a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v34) = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "resumeTaskForPid:%d", buf, 8u);
  }
  if ((int)v5 < 1)
    goto LABEL_14;
  target_task = 0;
  v8 = task_read_for_pid(mach_task_self_, v5, &target_task);
  if (!v8)
  {
    v17 = task_resume(target_task);
    if (!v17)
    {
      LOBYTE(v13) = 1;
      return v13;
    }
    v18 = v17;
    v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("failed resume task for process %d: %s"), v5, mach_error_string(v17));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = self->_log;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      if (a4)
      {
LABEL_11:
        v31 = NSLocalizedDescriptionKey;
        v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("failed resume task for process %d: %s"), v5, mach_error_string(v18));
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        v32 = v23;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.LaunchService"), 5, v24));

        v25 = self->_log;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = *a4;
          v27 = v25;
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedDescription"));
          *(_DWORD *)buf = 138412290;
          v34 = v28;
          _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
    else if (a4)
    {
      goto LABEL_11;
    }

    goto LABEL_14;
  }
  if (!a4)
  {
LABEL_14:
    LOBYTE(v13) = 0;
    return v13;
  }
  v35 = NSLocalizedDescriptionKey;
  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("failed to get task port for process %d: %s"), v5, mach_error_string(v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v36 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
  *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.LaunchService"), 4, v11));

  v12 = self->_log;
  v13 = os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR);
  if (v13)
  {
    v14 = *a4;
    v15 = v12;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedDescription"));
    *(_DWORD *)buf = 138412290;
    v34 = v16;
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    goto LABEL_14;
  }
  return v13;
}

- (void)bringGuestAppToForeground:(int)a3 completionHandler:(id)a4
{
  uint64_t v4;
  id v6;
  OS_os_log *log;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v23) = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "bringGuestAppToForeground:%d", buf, 8u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingIdentifier:](RBSProcessPredicate, "predicateMatchingIdentifier:", v8));

  v21 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessHandle handleForPredicate:error:](RBSProcessHandle, "handleForPredicate:error:", v9, &v21));
  v11 = v21;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationService serviceWithDefaultShellEndpoint](FBSOpenApplicationService, "serviceWithDefaultShellEndpoint"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10001BBA0;
    v19[3] = &unk_100030F28;
    v19[4] = self;
    v20 = v6;
    objc_msgSend(v14, "openApplication:withOptions:completion:", v13, 0, v19);

  }
  else
  {
    v15 = self->_log;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = v15;
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description")));
      v18 = objc_msgSend(v17, "UTF8String");
      *(_DWORD *)buf = 136315138;
      v23 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Cannot bring app to foreground: error = %s", buf, 0xCu);

    }
    (*((void (**)(id, _QWORD, id))v6 + 2))(v6, 0, v11);
  }

}

- (BOOL)launchReplayService:(id)a3 error:(id *)a4
{
  id v6;
  NSMutableDictionary *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  dispatch_time_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  _QWORD v20[7];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  dispatch_semaphore_t v36;
  NSErrorUserInfoKey v37;
  void *v38;

  v6 = a3;
  v7 = objc_opt_new(NSMutableDictionary);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "environment"));
  v9 = modifyReplayerEnvironment(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v10, CFSTR("environment"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "arguments"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v11, CFSTR("arguments"));

  v12 = qword_10003DCE8;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_10001BAB8;
  v35 = sub_10001BAC8;
  v36 = dispatch_semaphore_create(0);
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_10001BAB8;
  v25 = sub_10001BAC8;
  v26 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10001BB2C;
  v20[3] = &unk_100030F50;
  v20[4] = &v27;
  v20[5] = &v21;
  v20[6] = &v31;
  -[GTLaunchService launchReplayerLocallyWithConfiguration:competionHandler:](self, "launchReplayerLocallyWithConfiguration:competionHandler:", v7, v20);
  v13 = v32[5];
  v14 = dispatch_time(0, 1000000000 * v12);
  if (dispatch_semaphore_wait(v13, v14))
  {
    if (a4)
    {
      v37 = NSLocalizedDescriptionKey;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Replayer launch timed out")));
      v38 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.LaunchService"), 8, v16));

    }
  }
  else if (a4)
  {
    v17 = (void *)v22[5];
    if (v17)
      *a4 = objc_retainAutorelease(v17);
  }
  v18 = *((_BYTE *)v28 + 24);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v18;
}

- (BOOL)foregroundService:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void ***v12;
  void *v13;
  id v14;
  dispatch_time_t v15;
  void *v16;
  void *v17;
  void *v18;
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t, char, id);
  void *v23;
  NSObject *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  NSErrorUserInfoKey v37;
  void *v38;
  NSErrorUserInfoKey v39;
  void *v40;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GTServiceProvider allServices](self->_serviceProvider, "allServices"));
  v8 = filteredArrayByPort(v7, (id)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (objc_msgSend(v9, "count") == (id)1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = sub_10001BAB8;
    v35 = sub_10001BAC8;
    v36 = 0;
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v20 = _NSConcreteStackBlock;
    v21 = 3221225472;
    v22 = sub_10001BAD0;
    v23 = &unk_100030F78;
    v25 = &v27;
    v26 = &v31;
    v11 = dispatch_semaphore_create(0);
    v24 = v11;
    v12 = objc_retainBlock(&v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "processInfo", v20, v21, v22, v23));
    v14 = objc_msgSend(v13, "processIdentifier");

    -[GTLaunchService bringGuestAppToForeground:completionHandler:](self, "bringGuestAppToForeground:completionHandler:", v14, v12);
    v15 = dispatch_time(0, 1000000000 * qword_10003DCE8);
    if (dispatch_semaphore_wait(v11, v15))
    {
      if (a4)
      {
        v37 = NSLocalizedDescriptionKey;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Foreground service timed out")));
        v38 = v16;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.LaunchService"), 7, v17));

      }
    }
    else if (a4)
    {
      *a4 = objc_retainAutorelease((id)v32[5]);
    }
    LOBYTE(a4) = *((_BYTE *)v28 + 24) != 0;

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);

    goto LABEL_10;
  }
  if (a4)
  {
    v39 = NSLocalizedDescriptionKey;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid service port")));
    v40 = v10;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.LaunchService"), 6, v18));

    LOBYTE(a4) = 0;
LABEL_10:

  }
  return (char)a4;
}

- (BOOL)resumeService:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSErrorUserInfoKey v16;
  void *v17;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GTServiceProvider allServices](self->_serviceProvider, "allServices"));
  v8 = filteredArrayByPort(v7, (id)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (objc_msgSend(v9, "count") == (id)1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "processInfo"));
    v12 = objc_msgSend(v11, "processIdentifier");

    LOBYTE(a4) = -[GTLaunchService resumeTaskForPid:error:](self, "resumeTaskForPid:error:", v12, a4);
  }
  else if (a4)
  {
    v16 = NSLocalizedDescriptionKey;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid service port")));
    v17 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.LaunchService"), 6, v14));

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (void)symbolicatorForService:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GTServiceProvider allServices](self->_serviceProvider, "allServices"));
  v8 = filteredArrayByPort(v7, (id)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (objc_msgSend(v9, "count") == (id)1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "processInfo"));
    v12 = objc_msgSend(v11, "processIdentifier");

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001BAAC;
    v13[3] = &unk_100030FA0;
    v14 = v6;
    -[GTLaunchService symbolicatorSignatureForPid:completionHandler:](self, "symbolicatorSignatureForPid:completionHandler:", v12, v13);

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

- (void)processStateForService:(unint64_t)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD, id);
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  kern_return_t v13;
  kern_return_t v14;
  void *v15;
  void *v16;
  id v17;
  _BOOL8 v18;
  BOOL v19;
  void *v20;
  void *v21;
  id v22;
  kern_return_t v23;
  kern_return_t v24;
  NSString *v25;
  void *v26;
  GTProcessState *v27;
  mach_msg_type_number_t task_info_outCnt;
  mach_port_name_t tn;
  NSErrorUserInfoKey v30;
  void *v31;
  NSErrorUserInfoKey v32;
  integer_t task_info_out[4];
  __int128 v34;
  __int128 v35;
  NSErrorUserInfoKey v36;

  v6 = (void (**)(id, _QWORD, id))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GTServiceProvider allServices](self->_serviceProvider, "allServices"));
  v8 = filteredArrayByPort(v7, (id)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (objc_msgSend(v9, "count") != (id)1)
  {
    v30 = NSLocalizedDescriptionKey;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid service port")));
    v31 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
    v22 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.LaunchService"), 6, v21));

LABEL_10:
    v6[2](v6, 0, v22);
    goto LABEL_11;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "processInfo"));
  v12 = objc_msgSend(v11, "processIdentifier");
  tn = 0;
  v13 = task_name_for_pid(mach_task_self_, v12, &tn);
  if (v13)
  {
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to get name port for message destination pid %ld"), v12));
    v36 = NSLocalizedDescriptionKey;
    *(_QWORD *)task_info_out = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", task_info_out, &v36, 1));
    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSMachErrorDomain, v14, v16));

    v18 = 0;
    v19 = 0;
  }
  else
  {
    v34 = 0u;
    v35 = 0u;
    *(_OWORD *)task_info_out = 0u;
    task_info_outCnt = 12;
    v23 = task_info(tn, 0x14u, task_info_out, &task_info_outCnt);
    v19 = v23 == 0;
    if (v23)
    {
      v24 = v23;
      v25 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to get task basic info for pid %ld"), v12));
      v32 = NSLocalizedDescriptionKey;
      v36 = v25;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v32, 1));
      v17 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSMachErrorDomain, v24, v26));

      v18 = 0;
    }
    else
    {
      v17 = 0;
      v18 = HIDWORD(v35) != 0;
    }
  }
  v22 = v17;

  if (!v19)
    goto LABEL_10;
  v27 = objc_alloc_init(GTProcessState);
  -[GTProcessState setIsSuspended:](v27, "setIsSuspended:", v18);
  ((void (**)(id, GTProcessState *, id))v6)[2](v6, v27, 0);

LABEL_11:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProvider, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
