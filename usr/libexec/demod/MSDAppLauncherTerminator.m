@implementation MSDAppLauncherTerminator

+ (BOOL)launchApp:(id)a3 withOptions:(id)a4 outError:(id *)a5
{
  id v7;
  id v8;
  dispatch_semaphore_t v9;
  dispatch_time_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  BOOL v23;
  _QWORD v25[4];
  id v26;
  NSObject *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint8_t buf[4];
  id v41;
  uint64_t v42;
  void *v43;

  v7 = a3;
  v8 = a4;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_10001541C;
  v34 = sub_10001542C;
  v35 = 0;
  v9 = dispatch_semaphore_create(0);
  v10 = dispatch_time(0, 5000000000);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationService serviceWithDefaultShellEndpoint](FBSOpenApplicationService, "serviceWithDefaultShellEndpoint"));
  v42 = FBSOpenApplicationOptionKeyUnlockDevice;
  v43 = &__kCFBooleanTrue;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v12));

  if (v8)
    objc_msgSend(v13, "addEntriesFromDictionary:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationOptions optionsWithDictionary:](FBSOpenApplicationOptions, "optionsWithDictionary:", v13));
  v15 = sub_1000604F0();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v41 = v7;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Launching app: %{public}@", buf, 0xCu);
  }

  v17 = sub_1000604F0();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    sub_1000B96B8((uint64_t)v13, v18);

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100015434;
  v25[3] = &unk_10013DCF8;
  v28 = &v30;
  v19 = v7;
  v26 = v19;
  v29 = &v36;
  v20 = v9;
  v27 = v20;
  objc_msgSend(v11, "openApplication:withOptions:completion:", v19, v14, v25);
  if (dispatch_semaphore_wait(v20, v10))
  {
    v21 = sub_1000604F0();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_1000B9678(v22);

  }
  if (a5)
    *a5 = objc_retainAutorelease((id)v31[5]);
  v23 = *((_BYTE *)v37 + 24) != 0;

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v23;
}

+ (BOOL)terminateApp:(id)a3 outError:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  unsigned __int8 v11;
  id v12;
  id v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  id v18;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingBundleIdentifier:](RBSProcessPredicate, "predicateMatchingBundleIdentifier:", v5));
  v7 = objc_msgSend(objc_alloc((Class)RBSTerminateContext), "initWithExplanation:", CFSTR("Terminated by demod"));
  v8 = objc_msgSend(objc_alloc((Class)RBSTerminateRequest), "initWithPredicate:context:", v6, v7);
  v9 = sub_1000604F0();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Terminating app: %{public}@", buf, 0xCu);
  }

  v16 = 0;
  v11 = objc_msgSend(v8, "execute:", &v16);
  v12 = v16;
  if ((v11 & 1) != 0)
  {
    if (a4)
LABEL_5:
      *a4 = objc_retainAutorelease(v12);
  }
  else
  {
    v14 = sub_1000604F0();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1000B97C0((uint64_t)v5, v12);

    if (a4)
      goto LABEL_5;
  }

  return v11;
}

@end
