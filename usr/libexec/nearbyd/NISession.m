@implementation NISession

+ (id)_localDeviceLogger
{
  if (qword_10085A9C8 != -1)
    dispatch_once(&qword_10085A9C8, &stru_100810DD8);
  return (id)qword_10085A9C0;
}

+ (void)setAsyncLocalDeviceInteractableDiscoveryTokens:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  unsigned int v20;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "copy");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NISession _localDeviceLogger](NISession, "_localDeviceLogger"));
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v9 = v8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v20 = objc_msgSend(v7, "count");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "setAsyncLocalDeviceInteractableDiscoveryTokens:completion: with %d tokens", buf, 8u);
    }

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerConnection createOneShotConnectionAndResume:](NIServerConnection, "createOneShotConnectionAndResume:", 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "remoteObjectProxy"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100269978;
  v15[3] = &unk_100810E00;
  v12 = v8;
  v16 = v12;
  v13 = v6;
  v18 = v13;
  v14 = v10;
  v17 = v14;
  objc_msgSend(v11, "setLocalDeviceInteractableDiscoveryTokens:reply:", v7, v15);

}

+ (void)getAsyncInteractableDiscoveryTokens:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  NSObject *v11;
  id v12;
  id v13;
  uint8_t buf[16];

  v3 = a3;
  v4 = objc_claimAutoreleasedReturnValue(+[NISession _localDeviceLogger](NISession, "_localDeviceLogger"));
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "getAsyncInteractableDiscoveryTokens:", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerConnection createOneShotConnectionAndResume:](NIServerConnection, "createOneShotConnectionAndResume:", 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxy"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100269BFC;
  v10[3] = &unk_100810E28;
  v7 = v4;
  v11 = v7;
  v8 = v3;
  v13 = v8;
  v9 = v5;
  v12 = v9;
  objc_msgSend(v6, "getInteractableDiscoveryTokens:", v10);

}

+ (void)getAsyncActivelyInteractingDiscoveryTokens:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  NSObject *v11;
  id v12;
  id v13;
  uint8_t buf[16];

  v3 = a3;
  v4 = objc_claimAutoreleasedReturnValue(+[NISession _localDeviceLogger](NISession, "_localDeviceLogger"));
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "getAsyncActivelyInteractingDiscoveryTokens:", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerConnection createOneShotConnectionAndResume:](NIServerConnection, "createOneShotConnectionAndResume:", 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxy"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100269EC0;
  v10[3] = &unk_100810E28;
  v7 = v4;
  v11 = v7;
  v8 = v3;
  v13 = v8;
  v9 = v5;
  v12 = v9;
  objc_msgSend(v6, "getActivelyInteractingDiscoveryTokens:", v10);

}

+ (id)setLocalDeviceCanInteract:(BOOL)a3 withDiscoveryTokens:(id)a4
{
  _BOOL8 v4;
  id v5;
  id v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  dispatch_time_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v20[4];
  NSObject *v21;
  uint64_t *v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint8_t v28[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  NSErrorUserInfoKey v32;
  const __CFString *v33;
  _BYTE buf[24];
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v4 = a3;
  v5 = a4;
  v6 = objc_msgSend(v5, "copy");
  v7 = objc_claimAutoreleasedReturnValue(+[NISession _localDeviceLogger](NISession, "_localDeviceLogger"));
  if (v4)
    v8 = "YES";
  else
    v8 = "NO";
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v9 = v7;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = objc_msgSend(v6, "count");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "setLocalDeviceCanInteract:%s with %d tokens", buf, 0x12u);
    }

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerConnection createOneShotConnectionAndResume:](NIServerConnection, "createOneShotConnectionAndResume:", 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "remoteObjectProxy"));
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v35 = sub_10026A3C8;
  v36 = sub_10026A3D8;
  v37 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10026A3E0;
  v20[3] = &unk_100810E50;
  v22 = &v24;
  v23 = buf;
  v12 = dispatch_semaphore_create(0);
  v21 = v12;
  objc_msgSend(v11, "setLocalDeviceCanInteract:withDiscoveryTokens:reply:", v4, v6, v20);
  v13 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v12, v13);
  objc_msgSend(v10, "invalidate");
  if (!*((_BYTE *)v25 + 24))
  {
    v32 = NSLocalizedDescriptionKey;
    v33 = CFSTR("Server did not reply.");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
    v15 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v14));
    v16 = *(void **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v15;

  }
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    *(_DWORD *)v28 = 136315394;
    v29 = v8;
    v30 = 2112;
    v31 = v17;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "setLocalDeviceCanInteract:%s return error: %@", v28, 0x16u);
  }
  v18 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v24, 8);

  return v18;
}

+ (id)setLocalDeviceDebugParameters:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  __int128 *p_buf;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t v24[4];
  uint64_t v25;
  NSErrorUserInfoKey v26;
  const __CFString *v27;
  __int128 buf;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v3 = a3;
  v4 = objc_msgSend(v3, "copy");
  v5 = objc_claimAutoreleasedReturnValue(+[NISession _localDeviceLogger](NISession, "_localDeviceLogger"));
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setLocalDeviceDebugParameters:%@", (uint8_t *)&buf, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerConnection createOneShotConnectionAndResume:](NIServerConnection, "createOneShotConnectionAndResume:", 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteObjectProxy"));
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v29 = 0x3032000000;
  v30 = sub_10026A3C8;
  v31 = sub_10026A3D8;
  v32 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10026A7BC;
  v16[3] = &unk_100810E50;
  v18 = &v20;
  p_buf = &buf;
  v8 = dispatch_semaphore_create(0);
  v17 = v8;
  objc_msgSend(v7, "setLocalDeviceDebugParameters:reply:", v4, v16);
  v9 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v8, v9);
  objc_msgSend(v6, "invalidate");
  if (!*((_BYTE *)v21 + 24))
  {
    v26 = NSLocalizedDescriptionKey;
    v27 = CFSTR("Server did not reply.");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
    v11 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v10));
    v12 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v11;

  }
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v24 = 138412290;
    v25 = v13;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setLocalDeviceDebugParameters return error: %@", v24, 0xCu);
  }
  v14 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v20, 8);

  return v14;
}

+ (id)setLocalDeviceInteractableDiscoveryTokens:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  dispatch_time_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint8_t v25[4];
  uint64_t v26;
  NSErrorUserInfoKey v27;
  const __CFString *v28;
  uint8_t buf[8];
  uint8_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v3 = a3;
  v4 = objc_msgSend(v3, "copy");
  v5 = objc_claimAutoreleasedReturnValue(+[NISession _localDeviceLogger](NISession, "_localDeviceLogger"));
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = objc_msgSend(v4, "count");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "setLocalDeviceInteractableDiscoveryTokens with %d tokens", buf, 8u);
    }

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerConnection createOneShotConnectionAndResume:](NIServerConnection, "createOneShotConnectionAndResume:", 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "remoteObjectProxy"));
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  *(_QWORD *)buf = 0;
  v30 = buf;
  v31 = 0x3032000000;
  v32 = sub_10026A3C8;
  v33 = sub_10026A3D8;
  v34 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10026ABB4;
  v17[3] = &unk_100810E50;
  v19 = &v21;
  v20 = buf;
  v9 = dispatch_semaphore_create(0);
  v18 = v9;
  objc_msgSend(v8, "setLocalDeviceInteractableDiscoveryTokens:reply:", v4, v17);
  v10 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v9, v10);
  objc_msgSend(v7, "invalidate");
  if (!*((_BYTE *)v22 + 24))
  {
    v27 = NSLocalizedDescriptionKey;
    v28 = CFSTR("Server did not reply.");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
    v12 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v11));
    v13 = (void *)*((_QWORD *)v30 + 5);
    *((_QWORD *)v30 + 5) = v12;

  }
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *((_QWORD *)v30 + 5);
    *(_DWORD *)v25 = 138412290;
    v26 = v14;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setLocalDeviceInteractableDiscoveryTokens return error: %@", v25, 0xCu);
  }
  v15 = *((id *)v30 + 5);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v21, 8);

  return v15;
}

+ (NSArray)interactableDiscoveryTokens
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  unsigned int v12;
  uint64_t v13;
  id v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  NSObject *v20;
  uint64_t *v21;
  uint8_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[8];
  uint8_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint8_t v40[4];
  unsigned int v41;
  __int16 v42;
  uint64_t v43;
  NSErrorUserInfoKey v44;
  const __CFString *v45;

  v2 = objc_claimAutoreleasedReturnValue(+[NISession _localDeviceLogger](NISession, "_localDeviceLogger"));
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "interactableDiscoveryTokens", buf, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerConnection createOneShotConnectionAndResume:](NIServerConnection, "createOneShotConnectionAndResume:", 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remoteObjectProxy"));
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  *(_QWORD *)buf = 0;
  v31 = buf;
  v32 = 0x3032000000;
  v33 = sub_10026A3C8;
  v34 = sub_10026A3D8;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_10026A3C8;
  v28 = sub_10026A3D8;
  v29 = 0;
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_10026AFC8;
  v19 = &unk_100810E78;
  v21 = &v36;
  v22 = buf;
  v23 = &v24;
  v5 = dispatch_semaphore_create(0);
  v20 = v5;
  objc_msgSend(v4, "getInteractableDiscoveryTokens:", &v16);
  v6 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v5, v6);
  objc_msgSend(v3, "invalidate", v16, v17, v18, v19);
  if (!*((_BYTE *)v37 + 24))
  {
    v7 = (void *)*((_QWORD *)v31 + 5);
    *((_QWORD *)v31 + 5) = 0;

    v44 = NSLocalizedDescriptionKey;
    v45 = CFSTR("Server did not reply.");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
    v9 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v8));
    v10 = (void *)v25[5];
    v25[5] = v9;

  }
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v11 = v2;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(*((id *)v31 + 5), "count");
      v13 = v25[5];
      *(_DWORD *)v40 = 67109378;
      v41 = v12;
      v42 = 2112;
      v43 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "interactableDiscoveryTokens return %d tokens. Server error: %@", v40, 0x12u);
    }

  }
  v14 = *((id *)v31 + 5);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v36, 8);
  return (NSArray *)v14;
}

+ (NSArray)activelyInteractingDiscoveryTokens
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  unsigned int v12;
  uint64_t v13;
  id v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  NSObject *v20;
  uint64_t *v21;
  uint8_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[8];
  uint8_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint8_t v40[4];
  unsigned int v41;
  __int16 v42;
  uint64_t v43;
  NSErrorUserInfoKey v44;
  const __CFString *v45;

  v2 = objc_claimAutoreleasedReturnValue(+[NISession _localDeviceLogger](NISession, "_localDeviceLogger"));
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "activelyInteractingDiscoveryTokens", buf, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerConnection createOneShotConnectionAndResume:](NIServerConnection, "createOneShotConnectionAndResume:", 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remoteObjectProxy"));
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  *(_QWORD *)buf = 0;
  v31 = buf;
  v32 = 0x3032000000;
  v33 = sub_10026A3C8;
  v34 = sub_10026A3D8;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_10026A3C8;
  v28 = sub_10026A3D8;
  v29 = 0;
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_10026B418;
  v19 = &unk_100810E78;
  v21 = &v36;
  v22 = buf;
  v23 = &v24;
  v5 = dispatch_semaphore_create(0);
  v20 = v5;
  objc_msgSend(v4, "getActivelyInteractingDiscoveryTokens:", &v16);
  v6 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v5, v6);
  objc_msgSend(v3, "invalidate", v16, v17, v18, v19);
  if (!*((_BYTE *)v37 + 24))
  {
    v7 = (void *)*((_QWORD *)v31 + 5);
    *((_QWORD *)v31 + 5) = 0;

    v44 = NSLocalizedDescriptionKey;
    v45 = CFSTR("Server did not reply.");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
    v9 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v8));
    v10 = (void *)v25[5];
    v25[5] = v9;

  }
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v11 = v2;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(*((id *)v31 + 5), "count");
      v13 = v25[5];
      *(_DWORD *)v40 = 67109378;
      v41 = v12;
      v42 = 2112;
      v43 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "activelyInteractingDiscoveryTokens return %d tokens. Server error: %@", v40, 0x12u);
    }

  }
  v14 = *((id *)v31 + 5);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v36, 8);
  return (NSArray *)v14;
}

+ (id)localDevicePrintableState
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  NSObject *v18;
  uint64_t *v19;
  uint8_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[8];
  uint8_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint8_t v38[4];
  uint64_t v39;
  NSErrorUserInfoKey v40;
  const __CFString *v41;

  v2 = objc_claimAutoreleasedReturnValue(+[NISession _localDeviceLogger](NISession, "_localDeviceLogger"));
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "localDevicePrintableState", buf, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerConnection createOneShotConnectionAndResume:](NIServerConnection, "createOneShotConnectionAndResume:", 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remoteObjectProxy"));
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  *(_QWORD *)buf = 0;
  v29 = buf;
  v30 = 0x3032000000;
  v31 = sub_10026A3C8;
  v32 = sub_10026A3D8;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_10026A3C8;
  v26 = sub_10026A3D8;
  v27 = 0;
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_10026B838;
  v17 = &unk_100810EA0;
  v19 = &v34;
  v20 = buf;
  v21 = &v22;
  v5 = dispatch_semaphore_create(0);
  v18 = v5;
  objc_msgSend(v4, "getLocalDevicePrintableState:", &v14);
  v6 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v5, v6);
  objc_msgSend(v3, "invalidate", v14, v15, v16, v17);
  if (!*((_BYTE *)v35 + 24))
  {
    v7 = (void *)*((_QWORD *)v29 + 5);
    *((_QWORD *)v29 + 5) = 0;

    v40 = NSLocalizedDescriptionKey;
    v41 = CFSTR("Server did not reply.");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
    v9 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v8));
    v10 = (void *)v23[5];
    v23[5] = v9;

  }
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v23[5];
    *(_DWORD *)v38 = 138412290;
    v39 = v11;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "localDevicePrintableState error: %@", v38, 0xCu);
  }
  v12 = *((id *)v29 + 5);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v34, 8);
  return v12;
}

+ (NSDictionary)cachedPlatformCapabilities
{
  return (NSDictionary *)(id)qword_10085B8A8;
}

+ (void)setCachedPlatformCapabilities:(id)a3
{
  objc_storeStrong((id *)&qword_10085B8A8, a3);
}

- (int64_t)motionState
{
  OS_dispatch_queue *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002B862C;
  v5[3] = &unk_10080A8F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_initAndConnectToServerWithOptions:(unint64_t)a3
{
  NISession *v4;
  NISession *v5;
  uint64_t v6;
  NSUUID *internalID;
  os_log_t v8;
  OS_os_log *log;
  NISessionVisionContext *v10;
  NISessionVisionContext *visionContext;
  dispatch_queue_attr_t v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  NIExportedObjectForwarder *v16;
  NIExportedObjectForwarder *exportedObjectForwarder;
  NIServerConnection *v18;
  NIServerConnection *connection;
  dispatch_semaphore_t v20;
  OS_dispatch_semaphore *discoveryTokenSemaphore;
  NIServerConnection *v22;
  NIServerConnection *v23;
  NSObject *v24;
  NSUUID *v25;
  void *v26;
  _QWORD v28[4];
  NISession *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id location;
  objc_super v35;
  uint8_t buf[4];
  NSUUID *v37;

  v35.receiver = self;
  v35.super_class = (Class)NISession;
  v4 = -[NISession init](&v35, "init");
  v5 = v4;
  if (v4)
  {
    v4->_connectionOptions = a3;
    v6 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    internalID = v5->_internalID;
    v5->_internalID = (NSUUID *)v6;

    atomic_store(0, (unsigned __int8 *)&v5->_readyForCallbacks);
    v5->_startTime = 0.0;
    v5->_duration = 0.0;
    v5->_updatedNearbyObjects = 0;
    v8 = os_log_create("com.apple.NearbyInteraction", "NISession");
    log = v5->_log;
    v5->_log = (OS_os_log *)v8;

    v10 = objc_alloc_init(NISessionVisionContext);
    visionContext = v5->_visionContext;
    v5->_visionContext = v10;

    -[NISession setInternalState:](v5, "setInternalState:", 0);
    -[NISession setInvalidationError:](v5, "setInvalidationError:", 0);
    v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = dispatch_queue_create("com.apple.NearbyInteraction", v13);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v5->_delegateQueue, &_dispatch_main_q);
    v16 = -[NIExportedObjectForwarder initWithExportedObject:]([NIExportedObjectForwarder alloc], "initWithExportedObject:", v5);
    exportedObjectForwarder = v5->_exportedObjectForwarder;
    v5->_exportedObjectForwarder = v16;

    atomic_store(a3 & 1, (unsigned __int8 *)&v5->_isObserverSession);
    v18 = -[NIServerConnection initWithSessionID:queue:exportedObject:options:]([NIServerConnection alloc], "initWithSessionID:queue:exportedObject:options:", v5->_internalID, v5->_queue, v5->_exportedObjectForwarder, a3);
    connection = v5->_connection;
    v5->_connection = v18;

    v20 = dispatch_semaphore_create(0);
    discoveryTokenSemaphore = v5->_discoveryTokenSemaphore;
    v5->_discoveryTokenSemaphore = (OS_dispatch_semaphore *)v20;

    objc_initWeak(&location, v5);
    v22 = v5->_connection;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1002B89E4;
    v32[3] = &unk_1007FA078;
    objc_copyWeak(&v33, &location);
    -[NIServerConnection setInterruptionHandler:](v22, "setInterruptionHandler:", v32);
    v23 = v5->_connection;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1002B8A2C;
    v30[3] = &unk_1007FA078;
    objc_copyWeak(&v31, &location);
    -[NIServerConnection setInvalidationHandler:](v23, "setInvalidationHandler:", v30);
    -[NIServerConnection resume](v5->_connection, "resume");
    if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
    {
      v24 = v5->_log;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = v5->_internalID;
        *(_DWORD *)buf = 138412290;
        v37 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "NISession init [%@]", buf, 0xCu);
      }
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NISession _remoteObject](v5, "_remoteObject"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1002B8A74;
    v28[3] = &unk_1008130C8;
    v29 = v5;
    objc_msgSend(v26, "activate:", v28);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);

  }
  return v5;
}

+ (BOOL)_supportedPlatform:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", CFSTR("SupportedPlatform")));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (void)_queryAndCacheCapabilities
{
  void *v2;
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerConnection createOneShotConnectionAndResume:](NIServerConnection, "createOneShotConnectionAndResume:", 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "remoteObjectProxy"));
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1002B8CA4;
  v16 = sub_1002B8CB4;
  v17 = 0;
  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_1002B8CBC;
  v9 = &unk_1008130F0;
  v11 = &v12;
  v4 = dispatch_semaphore_create(0);
  v10 = v4;
  objc_msgSend(v3, "queryDeviceCapabilities:", &v6);
  v5 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v4, v5);
  objc_msgSend(v2, "invalidate", v6, v7, v8, v9);
  +[NISession setCachedPlatformCapabilities:](NISession, "setCachedPlatformCapabilities:", v13[5]);

  _Block_object_dispose(&v12, 8);
}

- (void)_osLogNearbyObjectUpdate:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  NSObject *log;
  float *v11;
  float v12;
  float32x4_t v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  ++self->_objectUpdateLogging.totalUpdates;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1002B8F78;
  v14[3] = &unk_10080E188;
  v14[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v14);
  if (self->_lastObjectUpdateLogTime)
  {
    objc_msgSend(v5, "timeIntervalSinceDate:");
    v7 = v6;
    if (v6 < 5.0)
      goto LABEL_13;
  }
  else
  {
    v7 = 0.0;
  }
  objc_storeStrong((id *)&self->_lastObjectUpdateLogTime, v5);
  v8 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithFormat:", CFSTR("DelegateProxy: nearbyObjectUpdates [last %0.1f s]. Updates %d, objects %d, w/dist %d, w/HA %d."), *(_QWORD *)&v7, self->_objectUpdateLogging.totalUpdates, self->_objectUpdateLogging.totalObjects, self->_objectUpdateLogging.objectsWithDistance, self->_objectUpdateLogging.objectsWithHorizontalAngle);
  v9 = v8;
  if (self->_objectUpdateLogging.objectsWithDistance >= 1)
    objc_msgSend(v8, "appendFormat:", CFSTR(" Distance: first %0.2f m, last %0.2f m, min %0.2f m, max %0.2f m."), self->_objectUpdateLogging.firstDistance, self->_objectUpdateLogging.lastDistance, self->_objectUpdateLogging.minDistance, self->_objectUpdateLogging.maxDistance);
  if (self->_objectUpdateLogging.objectsWithHorizontalAngle >= 1)
    objc_msgSend(v9, "appendFormat:", CFSTR(" HA: first %0.1f deg, last %0.1f deg."), self->_objectUpdateLogging.firstHorizontalAngleRad * 57.2957795, self->_objectUpdateLogging.lastHorizontalAngleRad * 57.2957795);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);
    }
  }
  v11 = &NINearbyObjectDistanceNotAvailable;
  v12 = NINearbyObjectAngleNotAvailable;
  *(_QWORD *)&self->_objectUpdateLogging.totalUpdates = 0;
  *(_QWORD *)&self->_objectUpdateLogging.objectsWithDistance = 0;
  v13 = vld1q_dup_f32(v11);
  *(float32x4_t *)&self->_objectUpdateLogging.firstDistance = v13;
  self->_objectUpdateLogging.firstHorizontalAngleRad = v12;
  self->_objectUpdateLogging.lastHorizontalAngleRad = v12;

LABEL_13:
}

- (void)_logTime
{
  double v3;
  double v4;
  double startTime;
  _QWORD v6[5];

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v4 = v3;
  startTime = self->_startTime;
  if (startTime != 0.0)
  {
    self->_duration = v4 - startTime + self->_duration;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1002B9138;
    v6[3] = &unk_1007FA568;
    v6[4] = self;
    AnalyticsSendEventLazy(CFSTR("com.apple.nearbyinteraction.session.duration"), v6);
  }
  self->_startTime = v4;
}

- (void)_logDurationAndSubmit:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  _QWORD v6[5];

  v3 = a3;
  if (self->_startTime != 0.0)
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    self->_duration = self->_duration + v5 - self->_startTime;
    self->_startTime = 0.0;
  }
  if (v3)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1002B9290;
    v6[3] = &unk_1007FA568;
    v6[4] = self;
    AnalyticsSendEventLazy(CFSTR("com.apple.nearbyinteraction.session.duration"), v6);
  }
}

- (void)_submitErrorMetric:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  _QWORD v10[4];
  id v11;
  __CFString *v12;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", NSLocalizedFailureReasonErrorKey));

      if (!v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", NSLocalizedDescriptionKey));

        if (!v7)
          v7 = &stru_10081D5E0;
      }
    }
    else
    {
      v7 = &stru_10081D5E0;
    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1002B94E0;
    v10[3] = &unk_100813118;
    v11 = v4;
    v12 = v7;
    v9 = v7;
    AnalyticsSendEventLazy(CFSTR("com.apple.nearbyinteraction.error"), v10);

  }
}

- (void)setDelegate:(id)delegate
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = delegate;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002B966C;
  block[3] = &unk_1007FA518;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)setDelegateQueue:(dispatch_queue_t)delegateQueue
{
  NSObject *v5;
  OS_dispatch_queue *queue;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  NSObject *v10;

  v5 = delegateQueue;
  if (!v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 509, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegateQueue"));

  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002B9810;
  block[3] = &unk_1007FA518;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync((dispatch_queue_t)queue, block);

}

+ (BOOL)isSupported
{
  BOOL v2;
  void *v3;
  void *v4;

  if (+[NIPlatformInfo supportsUWB](NIPlatformInfo, "supportsUWB"))
    return 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NISession cachedPlatformCapabilities](NISession, "cachedPlatformCapabilities"));

  if (!v3)
    +[NISession _queryAndCacheCapabilities](NISession, "_queryAndCacheCapabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NISession cachedPlatformCapabilities](NISession, "cachedPlatformCapabilities"));
  v2 = +[NISession _supportedPlatform:](NISession, "_supportedPlatform:", v4);

  return v2;
}

+ (id)deviceCapabilities
{
  return -[NIDeviceCapabilities initWithFineRangingSupport:aoaSupport:extendedDistanceMeasurementSupport:syntheticApertureSupport:]([NIDeviceCapabilities alloc], "initWithFineRangingSupport:aoaSupport:extendedDistanceMeasurementSupport:syntheticApertureSupport:", +[NIPlatformInfo supportsUWB](NIPlatformInfo, "supportsUWB"), +[NIPlatformInfo supportsAoA](NIPlatformInfo, "supportsAoA"), +[NIPlatformInfo supportsNBAMMS](NIPlatformInfo, "supportsNBAMMS"), +[NIPlatformInfo supportsSyntheticAperture](NIPlatformInfo, "supportsSyntheticAperture"));
}

- (NIConfiguration)configuration
{
  OS_dispatch_queue *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1002B8CA4;
  v10 = sub_1002B8CB4;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002B9A90;
  v5[3] = &unk_10080A8F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NIConfiguration *)v3;
}

- (NIDiscoveryToken)discoveryToken
{
  OS_dispatch_queue *queue;
  void *v4;
  OS_dispatch_queue *v5;
  NSObject *discoveryTokenSemaphore;
  dispatch_time_t v7;
  OS_dispatch_queue *v8;
  id v9;
  _QWORD v11[6];
  _QWORD v12[5];
  _QWORD block[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1002B8CA4;
  v18 = sub_1002B8CB4;
  v19 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002B9C4C;
  block[3] = &unk_10080A8F0;
  block[4] = self;
  block[5] = &v14;
  dispatch_sync((dispatch_queue_t)queue, block);
  v4 = (void *)v15[5];
  if (!v4)
  {
    v5 = self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1002B9C60;
    v12[3] = &unk_1007FB340;
    v12[4] = self;
    dispatch_sync((dispatch_queue_t)v5, v12);
    discoveryTokenSemaphore = self->_discoveryTokenSemaphore;
    v7 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(discoveryTokenSemaphore, v7);
    v8 = self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1002B9CAC;
    v11[3] = &unk_10080A8F0;
    v11[4] = self;
    v11[5] = &v14;
    dispatch_sync((dispatch_queue_t)v8, v11);
    if (!v15[5]
      && +[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
      && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1003E728C();
    }
    v4 = (void *)v15[5];
  }
  v9 = v4;
  _Block_object_dispose(&v14, 8);

  return (NIDiscoveryToken *)v9;
}

- (BOOL)_isInternalClient
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NISession activationResponse](self, "activationResponse"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("InternalClient")));

  v6 = 0;
  if (v3)
  {
    v5 = objc_opt_class(NSNumber, v4);
    if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0 && (objc_msgSend(v3, "BOOLValue") & 1) != 0)
      v6 = 1;
  }

  return v6;
}

- (NISession)init
{
  return (NISession *)-[NISession _initAndConnectToServerWithOptions:](self, "_initAndConnectToServerWithOptions:", 0);
}

- (void)runWithConfiguration:(NIConfiguration *)configuration
{
  NIConfiguration *v5;
  OS_dispatch_queue *queue;
  void *v7;
  NIConfiguration *v8;
  _QWORD block[5];
  NIConfiguration *v10;

  v5 = configuration;
  if (!v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 626, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002B9E50;
  block[3] = &unk_1007FA518;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)pause
{
  OS_dispatch_queue *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002BA288;
  block[3] = &unk_1007FB340;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)invalidate
{
  OS_dispatch_queue *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002BA54C;
  block[3] = &unk_1007FB340;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)dealloc
{
  NSObject *log;
  NSUUID *internalID;
  objc_super v5;
  uint8_t buf[4];
  NSUUID *v7;

  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      *(_DWORD *)buf = 138412290;
      v7 = internalID;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Client: dealloc [%@]", buf, 0xCu);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)NISession;
  -[NISession dealloc](&v5, "dealloc");
}

- (void)setARSession:(ARSession *)session
{
  ARSession *v4;
  NSObject *log;
  OS_dispatch_queue *queue;
  ARSession *v7;
  _QWORD v8[5];
  ARSession *v9;
  uint8_t buf[16];

  v4 = session;
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "setARSession", buf, 2u);
    }
  }
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002BA854;
  v8[3] = &unk_1007FA518;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync((dispatch_queue_t)queue, v8);

}

- (void)_setARSessionInternal:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NIConfiguration *currentConfiguration;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *log;
  void *v12;
  uint8_t v13[16];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v4, "state") == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
    -[NISession _handleARSession:willRunWithConfiguration:](self, "_handleARSession:willRunWithConfiguration:", v4, v6);

  }
  currentConfiguration = self->_currentConfiguration;
  v8 = objc_opt_class(NIFindingConfiguration, v5);
  if ((objc_opt_isKindOfClass(currentConfiguration, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NISessionVisionContext arSession](self->_visionContext, "arSession"));
    if (objc_msgSend(v9, "state") == (id)2)
    {
      v10 = objc_msgSend(v4, "state");

      if (v10 != (id)2)
      {
        if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v13 = 0;
            _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "_setARSessionInternal: ARSession was interrupted, new ARSession created in uninterrupted state.", v13, 2u);
          }
        }
        -[NISession _handleARSessionInterruptionEnded](self, "_handleARSessionInterruptionEnded");
      }
    }
    else
    {

    }
  }
  -[NISessionVisionContext setArSession:](self->_visionContext, "setArSession:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NISessionVisionContext arSession](self->_visionContext, "arSession"));
  objc_msgSend(v12, "_addObserver:", self);

}

- (simd_float4x4)worldTransformForObject:(NINearbyObject *)object
{
  NINearbyObject *v4;
  OS_dispatch_queue *queue;
  NINearbyObject *v6;
  simd_float4 v7;
  simd_float4 v8;
  simd_float4 v9;
  simd_float4 v10;
  simd_float4 v11;
  simd_float4 v12;
  simd_float4 v13;
  simd_float4 v14;
  _QWORD block[5];
  NINearbyObject *v16;
  uint64_t *v17;
  uint64_t v18;
  simd_float4 *v19;
  uint64_t v20;
  __n128 (*v21)(uint64_t, uint64_t);
  uint64_t (*v22)();
  void *v23;
  simd_float4x4 v24;
  simd_float4x4 result;

  v4 = object;
  v18 = 0;
  v19 = (simd_float4 *)&v18;
  v20 = 0x7012000000;
  v21 = sub_1002BAAD4;
  v22 = nullsub_127;
  v23 = &unk_1007C3407;
  v24 = NINearbyObjectWorldTransformNotAvailable;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002BAAEC;
  block[3] = &unk_10080CAF0;
  block[4] = self;
  v16 = v4;
  v17 = &v18;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  v13 = v19[5];
  v14 = v19[6];
  v11 = v19[3];
  v12 = v19[4];

  _Block_object_dispose(&v18, 8);
  v7 = v11;
  v8 = v12;
  v9 = v13;
  v10 = v14;
  result.columns[3] = v10;
  result.columns[2] = v9;
  result.columns[1] = v8;
  result.columns[0] = v7;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  NISession *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;

  v4 = (NISession *)a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    if (v4 == self)
      v7 = 1;
    else
      v7 = -[NSUUID isEqual:](self->_internalID, "isEqual:", v4->_internalID);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSUUID hash](self->_internalID, "hash");
}

- (NSString)description
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  OS_dispatch_queue *queue;
  id v16;
  _QWORD block[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1002B8CA4;
  v23 = sub_1002B8CB4;
  v3 = objc_alloc((Class)NSMutableString);
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v24 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@"), v7, self->_internalID);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NISession deviceCapabilities](NISession, "deviceCapabilities"));
  v9 = (void *)v20[5];
  if (objc_msgSend(v8, "supportsPreciseDistanceMeasurement"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v9, "appendFormat:", CFSTR(", preciseDistance: %@"), v10);
  v11 = (void *)v20[5];
  if (objc_msgSend(v8, "supportsDirectionMeasurement"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v11, "appendFormat:", CFSTR(", direction: %@"), v12);
  v13 = (void *)v20[5];
  if (objc_msgSend(v8, "supportsCameraAssistance"))
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  objc_msgSend(v13, "appendFormat:", CFSTR(", cameraAssistance: %@"), v14);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002BAE64;
  block[3] = &unk_10080A8F0;
  block[4] = self;
  block[5] = &v19;
  dispatch_sync((dispatch_queue_t)queue, block);
  objc_msgSend((id)v20[5], "appendString:", CFSTR(">"));
  v16 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return (NSString *)v16;
}

- (void)setConfigurationForTesting:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002BAF80;
  block[3] = &unk_1007FA518;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (id)getInternalIdentifier
{
  return self->_internalID;
}

- (id)getInternalLogObject
{
  return self->_log;
}

- (id)getInternalConnectionQueue
{
  return self->_queue;
}

- (void)_serverConnectionInvalidated
{
  unsigned int v3;
  NSObject *log;
  NSUUID *internalID;
  const __CFString *v6;
  NSObject *v7;
  void *v8;
  _BYTE v9[24];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = -[NISession internalState](self, "internalState");
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      if (v3 - 1 > 7)
        v6 = CFSTR("Activating");
      else
        v6 = off_100813558[v3 - 1];
      *(_DWORD *)v9 = 138412546;
      *(_QWORD *)&v9[4] = internalID;
      *(_WORD *)&v9[12] = 2112;
      *(_QWORD *)&v9[14] = v6;
      v7 = log;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Server connection invalidated [%@]. State: %@.", v9, 0x16u);

    }
  }
  -[NISession setInternalState:](self, "setInternalState:", 8, *(_OWORD *)v9, *(_QWORD *)&v9[16]);
  if (v3 != 7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NISession _getSessionFailureError](self, "_getSessionFailureError"));
    -[NISession _notifyDidInvalidateWithError:](self, "_notifyDidInvalidateWithError:", v8);

  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_discoveryTokenSemaphore);
}

- (void)_serverConnectionInterrupted
{
  OS_os_log *v3;
  NSUUID *internalID;
  unsigned int v5;
  const __CFString *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];
  uint8_t buf[4];
  NSUUID *v13;
  __int16 v14;
  const __CFString *v15;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v3 = self->_log;
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      v5 = -[NISession internalState](self, "internalState") - 1;
      if (v5 > 7)
        v6 = CFSTR("Activating");
      else
        v6 = off_100813558[v5];
      *(_DWORD *)buf = 138412546;
      v13 = internalID;
      v14 = 2112;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "Server connection interrupted [%@]. State: %@.", buf, 0x16u);
    }

  }
  v10[0] = NSLocalizedFailureReasonErrorKey;
  v10[1] = NSLocalizedRecoverySuggestionErrorKey;
  v11[0] = CFSTR("The session token has been invalidated. This session cannot be restarted.");
  v11[1] = CFSTR("Create a new session and exchange token again.");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
  v8 = sub_1001B9D34(-5887, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  -[NISession _invalidateSessionAndNotifyError:](self, "_invalidateSessionAndNotifyError:", v9);
}

- (id)_remoteObject
{
  return -[NIServerConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
}

- (id)_synchronousRemoteObject
{
  return -[NIServerConnection synchronousRemoteObjectProxy](self->_connection, "synchronousRemoteObjectProxy");
}

- (void)didRemoveNearbyObjects:(id)a3 withReason:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  NSObject *log;
  NIConfiguration *currentConfiguration;
  uint64_t v10;
  uint64_t v11;
  NIConfiguration *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD v15[5];
  _QWORD v16[6];
  _QWORD v17[6];
  uint8_t buf[4];
  int v19;
  __int16 v20;
  id v21;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109379;
      v19 = a4;
      v20 = 2113;
      v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: removed objects with reason: %d. Objects: %{private}@", buf, 0x12u);
    }
  }
  currentConfiguration = self->_currentConfiguration;
  v10 = objc_opt_class(NINearbyPeerConfiguration, v7);
  if ((objc_opt_isKindOfClass(currentConfiguration, v10) & 1) != 0
    || (v12 = self->_currentConfiguration,
        v13 = objc_opt_class(NINearbyAccessoryConfiguration, v11),
        (objc_opt_isKindOfClass(v12, v13) & 1) != 0))
  {
    -[NISession _pauseInternalARSessionIfNeeded](self, "_pauseInternalARSessionIfNeeded");
    -[NISession setInternalState:](self, "setInternalState:", 5);
  }
  if (a4 == 1)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1002BB554;
    v16[3] = &unk_1007FA518;
    v14 = v16;
    v16[4] = self;
    v16[5] = v6;
    -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v16, "session:didRemoveNearbyObjects:withReason:");
    goto LABEL_11;
  }
  if (!a4)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1002BB4FC;
    v17[3] = &unk_1007FA518;
    v14 = v17;
    v17[4] = self;
    v17[5] = v6;
    -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v17, "session:didRemoveNearbyObjects:withReason:");
LABEL_11:

  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002BB5AC;
  v15[3] = &unk_10080E458;
  v15[4] = a4;
  AnalyticsSendEventLazy(CFSTR("com.apple.nearbyinteraction.peerRemoved"), v15);

}

- (void)didUpdateNearbyObjects:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *log;
  void *v12;
  void *v13;
  void *v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  NISession *v19;
  id v20;
  uint8_t buf[4];
  _BOOL4 v22;
  __int16 v23;
  _BOOL4 v24;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_1002BB8D4;
  v18 = &unk_1007FA518;
  v19 = self;
  v5 = v4;
  v20 = v5;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", &v15, "session:didUpdateNearbyObjects:");
  self->_updatedNearbyObjects = 1;
  -[NISession _osLogNearbyObjectUpdate:](self, "_osLogNearbyObjectUpdate:", v5, v15, v16, v17, v18, v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v7 = objc_msgSend(v6, "resetARSession");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NISessionVisionContext arSession](self->_visionContext, "arSession"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NISessionVisionContext arSession](self->_visionContext, "arSession"));
    v10 = objc_msgSend(v9, "state");

    if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        v22 = v8 != 0;
        v23 = 1024;
        v24 = v10 == (id)1;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: reset ARSession (Exists: %d. Running: %d)", buf, 0xEu);
      }
    }
    if (v8 && v10 == (id)1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NISessionVisionContext arSession](self->_visionContext, "arSession"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NISessionVisionContext arSession](self->_visionContext, "arSession"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "configuration"));
      objc_msgSend(v12, "runWithConfiguration:options:", v14, 15);

    }
  }

}

- (void)uwbSessionDidFailWithError:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_1003E72B8();
  }
  -[NISession _invalidateSessionAndNotifyError:](self, "_invalidateSessionAndNotifyError:", v4);

}

- (void)uwbSessionDidInvalidateWithError:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_1003E7318();
  }
  -[NISession _invalidateSessionAndNotifyError:](self, "_invalidateSessionAndNotifyError:", v4);

}

- (void)uwbSessionInterruptedWithReason:(int64_t)a3 timestamp:(double)a4
{
  OS_os_log *v7;
  unsigned int v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  vector<UWBSessionInterruptionBookkeeping, std::allocator<UWBSessionInterruptionBookkeeping>> *p_interruptions;
  unint64_t *begin;
  UWBSessionInterruptionBookkeeping *end;
  const __CFString *v15;
  __CFString *v16;
  UWBSessionInterruptionBookkeeping *v17;
  UWBSessionInterruptionBookkeeping *value;
  UWBSessionInterruptionBookkeeping *v19;
  UWBSessionInterruptionBookkeeping *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  char *v26;
  UWBSessionInterruptionBookkeeping *v27;
  __CFString *v28;
  _QWORD v29[4];
  __CFString *v30;
  int64_t v31;
  BOOL v32;
  uint8_t buf[4];
  const __CFString *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  double v38;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v7 = self->_log;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = -[NISession internalState](self, "internalState") - 1;
      if (v8 > 7)
        v9 = CFSTR("Activating");
      else
        v9 = off_100813558[v8];
      v10 = sub_1002D7610(a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)buf = 138478339;
      v34 = v9;
      v35 = 2113;
      v36 = v11;
      v37 = 2048;
      v38 = a4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "DelegateProxy: suspension reason started. State: %{private}@. Reason: %{private}@. Timestamp: %f", buf, 0x20u);

    }
  }
  begin = (unint64_t *)self->_interruptions.__begin_;
  end = self->_interruptions.__end_;
  p_interruptions = &self->_interruptions;
  if (begin == (unint64_t *)end)
  {
    v16 = &stru_10081D5E0;
    v17 = self->_interruptions.__begin_;
  }
  else
  {
    v15 = sub_1002D7610(*begin);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(v15);
    v17 = self->_interruptions.__end_;
  }
  value = self->_interruptions.__end_cap_.__value_;
  if (v17 >= value)
  {
    v20 = p_interruptions->__begin_;
    v21 = (v17 - p_interruptions->__begin_) >> 4;
    v22 = v21 + 1;
    if ((unint64_t)(v21 + 1) >> 60)
      sub_100026E7C();
    v23 = value - v20;
    if (v23 >> 3 > v22)
      v22 = v23 >> 3;
    if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF0)
      v24 = 0xFFFFFFFFFFFFFFFLL;
    else
      v24 = v22;
    if (v24)
    {
      v25 = (char *)sub_10013A59C((uint64_t)&self->_interruptions.__end_cap_, v24);
      v20 = self->_interruptions.__begin_;
      v17 = self->_interruptions.__end_;
    }
    else
    {
      v25 = 0;
    }
    v26 = &v25[16 * v21];
    v27 = (UWBSessionInterruptionBookkeeping *)&v25[16 * v24];
    *(_QWORD *)v26 = a3;
    *((double *)v26 + 1) = a4;
    v19 = (UWBSessionInterruptionBookkeeping *)(v26 + 16);
    if (v17 != v20)
    {
      do
      {
        *((_OWORD *)v26 - 1) = *((_OWORD *)v17 - 1);
        v26 -= 16;
        v17 = (UWBSessionInterruptionBookkeeping *)((char *)v17 - 16);
      }
      while (v17 != v20);
      v20 = p_interruptions->__begin_;
    }
    self->_interruptions.__begin_ = (UWBSessionInterruptionBookkeeping *)v26;
    self->_interruptions.__end_ = v19;
    self->_interruptions.__end_cap_.__value_ = v27;
    if (v20)
      operator delete(v20);
  }
  else
  {
    *(_QWORD *)v17 = a3;
    *((double *)v17 + 1) = a4;
    v19 = (UWBSessionInterruptionBookkeeping *)((char *)v17 + 16);
  }
  self->_interruptions.__end_ = v19;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1002BBD40;
  v29[3] = &unk_100813168;
  v31 = a3;
  v32 = begin != (unint64_t *)end;
  v28 = v16;
  v30 = v28;
  AnalyticsSendEventLazy(CFSTR("com.apple.nearbyinteraction.session.interruptionStart"), v29);
  -[NISession _interruptSessionWithInternalReason:cachedInterruption:](self, "_interruptSessionWithInternalReason:cachedInterruption:", a3, 0);

}

- (void)uwbSessionInterruptionReasonEnded:(int64_t)a3 timestamp:(double)a4
{
  OS_os_log *v7;
  unsigned int v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  UWBSessionInterruptionBookkeeping *begin;
  UWBSessionInterruptionBookkeeping *end;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  UWBSessionInterruptionBookkeeping *v17;
  int64_t v18;
  _BOOL4 v19;
  NSObject *log;
  NSUUID *internalID;
  uint64_t v22;
  _QWORD v23[6];
  BOOL v24;
  _QWORD v25[5];
  _QWORD v26[7];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  double v32;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v7 = self->_log;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = -[NISession internalState](self, "internalState") - 1;
      if (v8 > 7)
        v9 = CFSTR("Activating");
      else
        v9 = off_100813558[v8];
      v10 = sub_1002D7610(a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)buf = 138478339;
      v28 = (void *)v9;
      v29 = 2113;
      v30 = v11;
      v31 = 2048;
      v32 = a4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "DelegateProxy: suspension reason ended. State: %{private}@. Reason: %{private}@. Timestamp: %f", buf, 0x20u);

    }
  }
  begin = self->_interruptions.__begin_;
  end = self->_interruptions.__end_;
  if (begin == end)
  {
LABEL_12:
    if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        sub_1003E7378();
    }
  }
  else
  {
    v14 = 0;
    while (*(_QWORD *)((char *)begin + v14) != a3)
    {
      v14 += 16;
      if ((UWBSessionInterruptionBookkeeping *)((char *)begin + v14) == end)
        goto LABEL_12;
    }
    v15 = (char *)begin + v14;
    v16 = *(_QWORD *)((char *)begin + v14 + 8);
    v17 = (UWBSessionInterruptionBookkeeping *)((char *)begin + v14 + 16);
    v18 = end - v17;
    if (end != v17)
    {
      memmove((char *)begin + v14, v17, end - v17);
      begin = self->_interruptions.__begin_;
    }
    self->_interruptions.__end_ = (UWBSessionInterruptionBookkeeping *)&v15[v18];
    v19 = begin == (UWBSessionInterruptionBookkeeping *)&v15[v18];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1002BC16C;
    v26[3] = &unk_1007FA7B8;
    v26[4] = a3;
    *(double *)&v26[5] = a4;
    v26[6] = v16;
    AnalyticsSendEventLazy(CFSTR("com.apple.nearbyinteraction.session.interruptionEnd"), v26);
    if (v19)
    {
      -[NISession setInternalState:](self, "setInternalState:", 5);
      if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          internalID = self->_internalID;
          *(_DWORD *)buf = 138412290;
          v28 = internalID;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Delegate: notify suspension ended [%@]", buf, 0xCu);
        }
      }
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1002BC260;
      v25[3] = &unk_1007FB340;
      v25[4] = self;
      -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v25, "sessionSuspensionEnded:");
    }
    if ((unint64_t)(a3 - 1) > 6)
      v22 = 0;
    else
      v22 = qword_100475ED8[a3 - 1];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1002BC2B4;
    v23[3] = &unk_100813190;
    v23[4] = self;
    v23[5] = v22;
    v24 = v19;
    -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v23, "session:suspensionReasonEnded:isNoLongerSuspended:");
  }
}

- (void)didUpdateLocalDiscoveryToken:(id)a3
{
  id v5;
  NSObject *log;
  _QWORD v7[5];
  uint8_t buf[4];
  id v9;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: updated token %{private}@", buf, 0xCu);
    }
  }
  objc_storeStrong((id *)&self->_discoveryToken, a3);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_discoveryTokenSemaphore);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002BC448;
  v7[3] = &unk_1007FB340;
  v7[4] = self;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v7, "sessionDidUpdateDiscoveryToken:");

}

- (void)didReceiveRangingAuthRecommendation:(BOOL)a3 forObject:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002BC55C;
  v8[3] = &unk_100809E88;
  v8[4] = self;
  v10 = a3;
  v7 = v6;
  v9 = v7;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v8, "session:didReceiveRangingAuthRecommendation:forObject:");

}

- (void)didDiscoverNearbyObject:(id)a3
{
  id v4;
  NSObject *log;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: discovered object: %{private}@", buf, 0xCu);
    }
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002BC6F8;
  v7[3] = &unk_1007FA518;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v7, "session:didDiscoverNearbyObject:");

}

- (void)object:(id)a3 didUpdateRegion:(id)a4 previousRegion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *log;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478339;
      v20 = v9;
      v21 = 2113;
      v22 = v10;
      v23 = 2113;
      v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: updated region %{private}@ (previous: %{private}@). Object: %{private}@", buf, 0x20u);
    }
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002BC914;
  v15[3] = &unk_10080A2B8;
  v15[4] = self;
  v12 = v8;
  v16 = v12;
  v13 = v9;
  v17 = v13;
  v14 = v10;
  v18 = v14;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v15, "session:object:didUpdateRegion:previousRegion:");

}

- (void)didUpdateMotionState:(int64_t)a3
{
  _QWORD v5[6];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_motionState = a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002BC9E8;
  v5[3] = &unk_100809CD8;
  v5[4] = self;
  v5[5] = a3;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v5, "session:didUpdateLocalMotionState:");
}

- (void)didUpdateHomeDeviceUWBRangingAvailability:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002BCAB8;
  v5[3] = &unk_1008131B8;
  v5[4] = self;
  v6 = a3;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v5, "session:didUpdateHomeDeviceUWBRangingAvailability:");
}

- (void)relayDCKMessage:(id)a3
{
  id v3;
  _QWORD v4[4];
  NISession *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002BCBB4;
  v4[3] = &unk_1007FA518;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](v5, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v4, "session:relayDCKMessage:");

}

- (void)didUpdateHealthStatus:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1002BCC64;
  v3[3] = &unk_100809CD8;
  v3[4] = self;
  v3[5] = a3;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v3, "session:didUpdateHealthStatus:");
}

- (void)didProcessAcwgM1MsgWithResponse:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  NISession *v8;
  id v9;
  id v10;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002BCD94;
  v7[3] = &unk_100809CB0;
  v8 = self;
  v9 = a3;
  v10 = a4;
  v5 = v10;
  v6 = v9;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](v8, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v7, "session:didProcessAcwgM1MsgWithResponse:error:");

}

- (void)didProcessAcwgM3MsgWithResponse:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  NISession *v8;
  id v9;
  id v10;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002BCEC8;
  v7[3] = &unk_100809CB0;
  v8 = self;
  v9 = a3;
  v10 = a4;
  v5 = v10;
  v6 = v9;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](v8, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v7, "session:didProcessAcwgM3MsgWithResponse:error:");

}

- (void)didProcessAcwgRangingSessionResumeRequestMsgWithResponse:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  NISession *v8;
  id v9;
  id v10;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002BCFFC;
  v7[3] = &unk_100809CB0;
  v8 = self;
  v9 = a3;
  v10 = a4;
  v5 = v10;
  v6 = v9;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](v8, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v7, "session:didProcessAcwgRangingSessionResumeRequestMsgWithResponse:error:");

}

- (void)requestAcwgRangingSessionSuspend:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4
{
  _QWORD v4[6];
  unsigned int v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002BD0B4;
  v4[3] = &unk_10080B8C0;
  v5 = a3;
  v4[4] = self;
  v4[5] = a4;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v4, "session:requestAcwgRangingSessionSuspend:withSuspendTriggerReason:");
}

- (void)didStartAcwgRanging:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1002BD168;
  v3[3] = &unk_100809CD8;
  v3[4] = self;
  v3[5] = a3;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v3, "session:didStartAcwgRanging:");
}

- (void)didSuspendAcwgRanging:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1002BD218;
  v3[3] = &unk_100809CD8;
  v3[4] = self;
  v3[5] = a3;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v3, "session:didSuspendAcwgRanging:");
}

- (void)didPrefetchAcwgUrsk:(unsigned int)a3 error:(id)a4
{
  id v4;
  _QWORD v5[4];
  NISession *v6;
  id v7;
  unsigned int v8;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002BD318;
  v5[3] = &unk_10080F4A8;
  v8 = a3;
  v6 = self;
  v7 = a4;
  v4 = v7;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](v6, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v5, "session:didPrefetchAcwgUrsk:error:");

}

- (void)didGenerateShareableConfigurationData:(id)a3 forObject:(id)a4
{
  id v6;
  id v7;
  NSObject *log;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478083;
      v15 = v6;
      v16 = 2113;
      v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: generated shareable config: %{private}@. Object: %{private}@", buf, 0x16u);
    }
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002BD4F0;
  v11[3] = &unk_100809CB0;
  v11[4] = self;
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v11, "session:didGenerateShareableConfigurationData:forObject:");

}

- (void)systemDidUpdateState:(id)a3
{
  id v4;
  NSObject *log;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;

  v4 = a3;
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: system updated state: %{private}@", buf, 0xCu);
    }
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002BD684;
  v7[3] = &unk_1007FA518;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v7, "systemConfigurator:didUpdateState:");

}

- (void)systemDidUpdateResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationTypeWithName:(id)a4
{
  _BOOL4 v4;
  NSString *v6;
  NSObject *log;
  Class v8;
  _QWORD v9[6];
  BOOL v10;
  uint8_t buf[4];
  _BOOL4 v12;
  __int16 v13;
  NSString *v14;

  v4 = a3;
  v6 = (NSString *)a4;
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67174915;
      v12 = v4;
      v13 = 2113;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: system updated resource usage limit exceeded: %{private}d. Configuration type: %{private}@", buf, 0x12u);
    }
  }
  v8 = NSClassFromString(v6);
  if (v8)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1002BD818;
    v9[3] = &unk_10080C288;
    v10 = v4;
    v9[4] = self;
    v9[5] = v8;
    -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v9, "systemConfigurator:didUpdateResourceUsageLimitExceeded:forSessionConfigurationType:");
  }

}

- (void)didUpdateAlgorithmState:(id)a3 forObject:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSMutableArray *v9;
  NSObject *log;
  NSMutableArray *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[5];
  NSMutableArray *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  id v25;
  __int16 v26;
  NSMutableArray *v27;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "convergence");
  v9 = objc_opt_new(NSMutableArray);
  if (objc_msgSend(v6, "insufficientSignalStrength"))
    -[NSMutableArray addObject:](v9, "addObject:", CFSTR("insufficientSignalStrength"));
  if (objc_msgSend(v6, "insufficientHorizontalSweep"))
    -[NSMutableArray addObject:](v9, "addObject:", CFSTR("insufficientHorizontalSweep"));
  if (objc_msgSend(v6, "insufficientVerticalSweep"))
    -[NSMutableArray addObject:](v9, "addObject:", CFSTR("insufficientVerticalSweep"));
  if (objc_msgSend(v6, "insufficientMovement"))
    -[NSMutableArray addObject:](v9, "addObject:", CFSTR("insufficientMovement"));
  if (objc_msgSend(v6, "insufficientLighting"))
    -[NSMutableArray addObject:](v9, "addObject:", CFSTR("insufficientLighting"));
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109635;
      v23 = (int)v8;
      v24 = 2113;
      v25 = v7;
      v26 = 2113;
      v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: algorithm convergence status: %d. Object: %{private}@. Reasons: %{private}@", buf, 0x1Cu);
    }
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1002BDB50;
  v18[3] = &unk_1008131E0;
  v18[4] = self;
  v21 = v8;
  v11 = v9;
  v19 = v11;
  v12 = v7;
  v20 = v12;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v18, "session:didUpdateAlgorithmConvergence:forObject:");
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002BDBE8;
  v15[3] = &unk_100809CB0;
  v15[4] = self;
  v13 = v6;
  v16 = v13;
  v14 = v12;
  v17 = v14;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v15, "session:didUpdateAlgorithmState:forObject:");

}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v5;
  OS_dispatch_queue *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002BDCBC;
  v8[3] = &unk_1007FA518;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async((dispatch_queue_t)queue, v8);

}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v5;
  OS_dispatch_queue *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002BDD44;
  v8[3] = &unk_1007FA518;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async((dispatch_queue_t)queue, v8);

}

- (void)sessionWasInterrupted:(id)a3
{
  OS_dispatch_queue *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002BDDA8;
  block[3] = &unk_1007FB340;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)sessionInterruptionEnded:(id)a3
{
  OS_dispatch_queue *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002BDE08;
  block[3] = &unk_1007FB340;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  OS_dispatch_queue *queue;
  _QWORD v5[6];

  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002BDE68;
  v5[3] = &unk_100809CD8;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async((dispatch_queue_t)queue, v5);
}

- (void)session:(id)a3 willRunWithConfiguration:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002BDF20;
  block[3] = &unk_100809CB0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);

}

- (void)sessionShouldAttemptRelocalization:(id)a3 completion:(id)a4
{
  id v6;
  OS_dispatch_queue *queue;
  id v8;
  void *v9;
  _QWORD block[5];
  id v11;

  v6 = a4;
  if (!v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 1407, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002BE018;
  block[3] = &unk_100813208;
  block[4] = self;
  v11 = v6;
  v8 = v6;
  dispatch_async((dispatch_queue_t)queue, block);

}

- (void)_handleARSessionDidUpdateFrame:(id)a3
{
  void *v4;
  int64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NIVisionInput *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  NIVisionInput *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;

  v26 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NISession internalState](self, "internalState") == 3)
  {
    -[NISessionVisionContext setLatestARFrame:](self->_visionContext, "setLatestARFrame:", v26);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "camera"));
    v5 = -[NISession niVisionInputTrackingStateFromARTRackingState:](self, "niVisionInputTrackingStateFromARTRackingState:", objc_msgSend(v4, "trackingState"));

    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "worldTrackingState"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "worldTrackingState"));
      v6 = objc_msgSend(v7, "majorRelocalization");

      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "worldTrackingState"));
      v9 = objc_msgSend(v8, "minorRelocalization");

    }
    else
    {
      v9 = 0;
    }
    v10 = [NIVisionInput alloc];
    objc_msgSend(v26, "timestamp");
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "camera"));
    objc_msgSend(v13, "transform");
    v24 = v15;
    v25 = v14;
    v22 = v17;
    v23 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lightEstimate"));
    -[NISession lightEstimateFromARLightEstimate:](self, "lightEstimateFromARLightEstimate:", v18);
    v20 = -[NIVisionInput initWithTimestamp:devicePose:trackingState:lightEstimate:majorRelocalization:minorRelocalization:](v10, "initWithTimestamp:devicePose:trackingState:lightEstimate:majorRelocalization:minorRelocalization:", v5, v6, v9, v12, v25, v24, v23, v22, v19);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NISession _remoteObject](self, "_remoteObject"));
    objc_msgSend(v21, "processVisionInput:", v20);

  }
}

- (void)_handleARSessionDidFailWithError:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_1003E73A4();
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NISession _remoteObject](self, "_remoteObject"));
  objc_msgSend(v5, "arSessionDidFailWithError:", v4);

}

- (void)_handleARSessionWasInterrupted
{
  NSObject *log;
  void *v4;
  uint8_t v5[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "ARSession: interrupted", v5, 2u);
    }
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NISession _remoteObject](self, "_remoteObject"));
  objc_msgSend(v4, "arSessionWasInterrupted");

}

- (void)_handleARSessionInterruptionEnded
{
  NSObject *log;
  void *v4;
  uint8_t v5[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "ARSession: interruption ended", v5, 2u);
    }
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NISession _remoteObject](self, "_remoteObject"));
  objc_msgSend(v4, "arSessionInterruptionEnded");

}

- (void)_handleARSessionDidChangeState:(unint64_t)a3
{
  NSObject *log;
  _DWORD v6[2];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = a3;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "ARSession: changed state: %d", (uint8_t *)v6, 8u);
    }
  }
  -[NISessionVisionContext setArSessionState:](self->_visionContext, "setArSessionState:", a3);
}

- (void)_handleARSession:(id)a3 willRunWithConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!-[NISession _isValidARSession:andConfiguration:](self, "_isValidARSession:andConfiguration:", v6, v7))
  {
    if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
      && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1003E7404();
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NISession _remoteObject](self, "_remoteObject"));
    objc_msgSend(v8, "arSessionWillRunWithInvalidConfiguration");

  }
}

- (void)_configureAndRunInternalARSession
{
  void *v3;
  unsigned int v4;
  unsigned int v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *log;
  id v9;
  OS_dispatch_queue *queue;
  void *v11;
  OS_dispatch_queue *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  _QWORD block[5];
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NISessionVisionContext arSession](self->_visionContext, "arSession"));

  v4 = -[NIConfiguration _internalIsCameraAssistanceInClientProcess](self->_currentConfiguration, "_internalIsCameraAssistanceInClientProcess");
  v5 = +[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild");
  if (!v3)
  {
    if (v4)
    {
      if (v5)
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Created new internal ARSession in client process", buf, 2u);
        }
      }
      v9 = objc_alloc_init((Class)ARSession);
      -[NISession _setARSessionInternal:](self, "_setARSessionInternal:", v9);

      queue = self->_queue;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NISessionVisionContext arSession](self->_visionContext, "arSession"));
      objc_msgSend(v11, "setDelegateQueue:", queue);

      v7 = 1;
      -[NISessionVisionContext setCameraAssistanceEnabled:](self->_visionContext, "setCameraAssistanceEnabled:", 1);
      -[NISessionVisionContext setArSessionInternal:](self->_visionContext, "setArSessionInternal:", 1);
    }
    else
    {
      if (v5)
      {
        v13 = self->_log;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Internal ARSession will be created in server process", buf, 2u);
        }
      }
      -[NISessionVisionContext setCameraAssistanceEnabled:](self->_visionContext, "setCameraAssistanceEnabled:", 1);
      -[NISessionVisionContext setArSessionInternal:](self->_visionContext, "setArSessionInternal:", 1);
      v7 = 0;
    }
    goto LABEL_20;
  }
  if (v4)
  {
    if (v5)
    {
      v6 = self->_log;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Using external ARSession", buf, 2u);
      }
    }
    v7 = 1;
LABEL_20:
    -[NISessionVisionContext setArSessionInClientProcess:](self->_visionContext, "setArSessionInClientProcess:", v7);
    if (-[NISessionVisionContext isARSessionInternal](self->_visionContext, "isARSessionInternal")
      && -[NISessionVisionContext isARSessionInClientProcess](self->_visionContext, "isARSessionInClientProcess")
      && (-[NISessionVisionContext arSessionState](self->_visionContext, "arSessionState") & 0xFFFFFFFFFFFFFFFDLL) == 0)
    {
      if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
      {
        v14 = self->_log;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Run internal ARSession", buf, 2u);
        }
      }
      v15 = objc_alloc_init((Class)ARWorldTrackingConfiguration);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NISessionVisionContext arSession](self->_visionContext, "arSession"));
      objc_msgSend(v16, "runWithConfiguration:options:", v15, 1);

    }
    return;
  }
  if (v5 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    sub_1003E7464();
  v12 = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002BE904;
  block[3] = &unk_1007FB340;
  block[4] = self;
  dispatch_async((dispatch_queue_t)v12, block);
}

- (BOOL)_isValidARSession:(id)a3 andConfiguration:(id)a4
{
  id v6;
  id v7;
  NISessionVisionContext *visionContext;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  BOOL v14;
  const char *v15;
  NSObject *log;
  const char *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  OS_os_log *v23;
  unsigned int v24;
  const char *v25;
  void *v26;
  BOOL v27;
  _QWORD v28[5];
  uint8_t buf[4];
  const char *v30;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v6)
  {
    if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
    {
      log = self->_log;
      v14 = 0;
      if (!os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        goto LABEL_34;
      *(_WORD *)buf = 0;
      v17 = "_isValidARSession returning NO: session is nil";
LABEL_32:
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
    }
LABEL_33:
    v14 = 0;
    goto LABEL_34;
  }
  visionContext = self->_visionContext;
  if (!visionContext
    || !-[NISessionVisionContext isARSessionInClientProcess](visionContext, "isARSessionInClientProcess"))
  {
    __assert_rtn("-[NISession _isValidARSession:andConfiguration:]", "NISession.mm", 1541, "_visionContext && _visionContext.isARSessionInClientProcess");
  }
  if (-[NISessionVisionContext isARSessionInternal](self->_visionContext, "isARSessionInternal"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NISessionVisionContext arSession](self->_visionContext, "arSession"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1002BEECC;
    v28[3] = &unk_100813230;
    v28[4] = self;
    -[NISession sessionShouldAttemptRelocalization:completion:](self, "sessionShouldAttemptRelocalization:completion:", v9, v28);

    goto LABEL_6;
  }
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
  v19 = (void *)v18;
  if (!v18)
  {
    if (!+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
      goto LABEL_28;
    v20 = self->_log;
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    *(_WORD *)buf = 0;
    v21 = "_isValidARSession returning NO: session.delegate is nil";
    goto LABEL_27;
  }
  if ((objc_opt_respondsToSelector(v18, "sessionShouldAttemptRelocalization:") & 1) == 0
    || objc_msgSend(v19, "sessionShouldAttemptRelocalization:", v6))
  {
    if (!+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
      goto LABEL_28;
    v20 = self->_log;
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    *(_WORD *)buf = 0;
    v21 = "_isValidARSession returning NO: attempting relocalization is not disabled";
LABEL_27:
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
LABEL_28:

    goto LABEL_33;
  }
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v23 = self->_log;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_msgSend(v19, "sessionShouldAttemptRelocalization:", v6);
      v25 = "NO";
      if (v24)
        v25 = "YES";
      *(_DWORD *)buf = 136315138;
      v30 = v25;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_DEFAULT, "_isValidARSession got %s from sessionShouldAttemptRelocalization", buf, 0xCu);
    }

  }
LABEL_6:
  if (!v7)
  {
    if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
    {
      log = self->_log;
      v14 = 0;
      if (!os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        goto LABEL_34;
      *(_WORD *)buf = 0;
      v17 = "_isValidARSession returning NO: configuration is nil";
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  v11 = objc_opt_class(ARWorldTrackingConfiguration, v10);
  if ((objc_opt_isKindOfClass(v7, v11) & 1) != 0)
  {
    v12 = v7;
    if (objc_msgSend(v12, "worldAlignment"))
    {
      if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
      {
        v13 = self->_log;
        v14 = 0;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v15 = "_isValidARSession returning NO: world alignment is not gravity";
LABEL_50:
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
          goto LABEL_51;
        }
        goto LABEL_52;
      }
    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "initialWorldMap"));
      v27 = v26 == 0;

      if (v27)
      {
        if (!objc_msgSend(v12, "isCollaborationEnabled"))
        {
          v14 = 1;
          goto LABEL_52;
        }
        if (!+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
          goto LABEL_51;
        v13 = self->_log;
        v14 = 0;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v15 = "_isValidARSession returning NO: collaboration is not disabled";
          goto LABEL_50;
        }
        goto LABEL_52;
      }
      if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
      {
        v13 = self->_log;
        v14 = 0;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v15 = "_isValidARSession returning NO: initial world map is non-nil";
          goto LABEL_50;
        }
LABEL_52:

        goto LABEL_34;
      }
    }
LABEL_51:
    v14 = 0;
    goto LABEL_52;
  }
  if (!+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
    goto LABEL_33;
  log = self->_log;
  v14 = 0;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v17 = "_isValidARSession returning NO: configuration is not ARWorldTrackingConfiguration";
    goto LABEL_32;
  }
LABEL_34:

  return v14;
}

- (void)_pauseInternalARSessionIfNeeded
{
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NISessionVisionContext isARSessionInternal](self->_visionContext, "isARSessionInternal"))
  {
    if (-[NISessionVisionContext isARSessionInClientProcess](self->_visionContext, "isARSessionInClientProcess"))
    {
      v3 = (id)objc_claimAutoreleasedReturnValue(-[NISessionVisionContext arSession](self->_visionContext, "arSession"));
      objc_msgSend(v3, "pause");

    }
  }
}

- (void)_invalidateInternalARSessionIfNeeded
{
  void *v3;
  void *v4;
  NISessionVisionContext *visionContext;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NISessionVisionContext isARSessionInternal](self->_visionContext, "isARSessionInternal"))
  {
    if (-[NISessionVisionContext isARSessionInClientProcess](self->_visionContext, "isARSessionInClientProcess"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[NISessionVisionContext arSession](self->_visionContext, "arSession"));
      objc_msgSend(v3, "pause");

      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NISessionVisionContext arSession](self->_visionContext, "arSession"));
      objc_msgSend(v4, "_removeObserver:", self);

      visionContext = self->_visionContext;
      self->_visionContext = 0;

    }
  }
}

- (int64_t)niVisionInputTrackingStateFromARTRackingState:(int64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

- (double)lightEstimateFromARLightEstimate:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "ambientIntensity");
    v6 = v5;
  }
  else
  {
    v6 = *(double *)&NIARLightEstimateNotAvailable;
  }

  return v6;
}

- (void)_invalidateSessionAndNotifyError:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NISession _notifyDidInvalidateWithError:](self, "_notifyDidInvalidateWithError:", v4);
  -[NISession _invalidateInternal](self, "_invalidateInternal");

}

- (void)_interruptSessionWithInternalReason:(int64_t)a3 cachedInterruption:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *log;
  NSUUID *internalID;
  uint64_t v9;
  _QWORD v10[6];
  _QWORD v11[5];
  uint8_t buf[4];
  NSUUID *v13;

  v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NISession internalState](self, "internalState") != 6 || v4)
  {
    -[NISession setInternalState:](self, "setInternalState:", 6);
    if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        internalID = self->_internalID;
        *(_DWORD *)buf = 138412290;
        v13 = internalID;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Delegate: notify suspension started [%@]", buf, 0xCu);
      }
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1002BF2E4;
    v11[3] = &unk_1007FB340;
    v11[4] = self;
    -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v11, "sessionWasSuspended:");
  }
  if ((unint64_t)(a3 - 1) > 6)
    v9 = 0;
  else
    v9 = qword_100475ED8[a3 - 1];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002BF338;
  v10[3] = &unk_100809CD8;
  v10[4] = self;
  v10[5] = v9;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v10, "session:suspendedWithReason:");
}

- (void)_reinterruptSessionWithCachedInterruption
{
  NSObject *log;
  NSUUID *internalID;
  UWBSessionInterruptionBookkeeping *begin;
  int v6;
  NSUUID *v7;

  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      v6 = 138412290;
      v7 = internalID;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Reinterrupting session [%@]", (uint8_t *)&v6, 0xCu);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  begin = self->_interruptions.__begin_;
  if (begin == self->_interruptions.__end_)
  {
    if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        sub_1003E7490();
    }
  }
  else
  {
    -[NISession _interruptSessionWithInternalReason:cachedInterruption:](self, "_interruptSessionWithInternalReason:cachedInterruption:", *(_QWORD *)begin, 1);
  }
}

- (void)_invalidateInternal
{
  unsigned int v3;
  NSObject *log;
  NSUUID *internalID;
  const __CFString *v6;
  NSObject *v7;
  NIConfiguration *currentConfiguration;
  int v9;
  NSUUID *v10;
  __int16 v11;
  const __CFString *v12;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = -[NISession internalState](self, "internalState");
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      if (v3 - 1 > 7)
        v6 = CFSTR("Activating");
      else
        v6 = off_100813558[v3 - 1];
      v9 = 138412546;
      v10 = internalID;
      v11 = 2112;
      v12 = v6;
      v7 = log;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "invalidateInternal [%@]. State: %@.", (uint8_t *)&v9, 0x16u);

    }
  }
  if (v3 <= 6)
  {
    -[NISession _logDurationAndSubmit:](self, "_logDurationAndSubmit:", self->_updatedNearbyObjects);
    -[NISession setInternalState:](self, "setInternalState:", 7);
    -[NIServerConnection invalidate](self->_connection, "invalidate");
    currentConfiguration = self->_currentConfiguration;
    self->_currentConfiguration = 0;

    -[NISession _invalidateInternalARSessionIfNeeded](self, "_invalidateInternalARSessionIfNeeded");
  }
}

- (void)_handleActivationError:(id)a3
{
  id v4;
  OS_os_log *v5;
  NSUUID *internalID;
  unsigned int v7;
  const __CFString *v8;
  int v9;
  NSUUID *v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  id v14;

  v4 = a3;
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v5 = self->_log;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      v7 = -[NISession internalState](self, "internalState") - 1;
      if (v7 > 7)
        v8 = CFSTR("Activating");
      else
        v8 = off_100813558[v7];
      v9 = 138412802;
      v10 = internalID;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Activation error [%@]. State: %@. Error: %@", (uint8_t *)&v9, 0x20u);
    }

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NISession _invalidateSessionAndNotifyError:](self, "_invalidateSessionAndNotifyError:", v4);

}

- (void)_handleActivationSuccess:(id)a3
{
  id v4;
  OS_os_log *v5;
  NSUUID *internalID;
  unsigned int v7;
  const __CFString *v8;
  int v9;
  NSUUID *v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  id v14;

  v4 = a3;
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v5 = self->_log;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      v7 = -[NISession internalState](self, "internalState") - 1;
      if (v7 > 7)
        v8 = CFSTR("Activating");
      else
        v8 = off_100813558[v7];
      v9 = 138412802;
      v10 = internalID;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Activation success [%@]. State: %@. Response: %@", (uint8_t *)&v9, 0x20u);
    }

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!-[NISession internalState](self, "internalState"))
    -[NISession setInternalState:](self, "setInternalState:", 1);
  if (!v4)
    __assert_rtn("-[NISession _handleActivationSuccess:]", "NISession.mm", 1740, "activationResponse != nil");
  -[NISession setActivationResponse:](self, "setActivationResponse:", v4);

}

- (void)_handleRunSessionError:(id)a3
{
  id v4;
  OS_os_log *v5;
  NSUUID *internalID;
  unsigned int v7;
  const __CFString *v8;
  int v9;
  NSUUID *v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  id v14;

  v4 = a3;
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v5 = self->_log;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      v7 = -[NISession internalState](self, "internalState") - 1;
      if (v7 > 7)
        v8 = CFSTR("Activating");
      else
        v8 = off_100813558[v7];
      v9 = 138412802;
      v10 = internalID;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Run session error [%@]. State: %@. Error: %@", (uint8_t *)&v9, 0x20u);
    }

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NISession _invalidateSessionAndNotifyError:](self, "_invalidateSessionAndNotifyError:", v4);

}

- (void)_handleRunSessionSuccess
{
  OS_os_log *v3;
  NSUUID *internalID;
  unsigned int v5;
  const __CFString *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  NSUUID *v9;
  __int16 v10;
  const __CFString *v11;

  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v3 = self->_log;
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      v5 = -[NISession internalState](self, "internalState") - 1;
      if (v5 > 7)
        v6 = CFSTR("Activating");
      else
        v6 = off_100813558[v5];
      *(_DWORD *)buf = 138412546;
      v9 = internalID;
      v10 = 2112;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "Run session succeeded [%@]. State: %@", buf, 0x16u);
    }

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NISession internalState](self, "internalState") == 2)
  {
    -[NISession setInternalState:](self, "setInternalState:", 3);
    if (-[NIConfiguration _internalIsCameraAssistanceEnabled](self->_currentConfiguration, "_internalIsCameraAssistanceEnabled"))
    {
      -[NISession _configureAndRunInternalARSession](self, "_configureAndRunInternalARSession");
    }
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002BFB64;
    v7[3] = &unk_1007FB340;
    v7[4] = self;
    -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", v7, "sessionDidStartRunning:");
  }
}

- (void)_handlePauseSessionError:(id)a3
{
  id v4;
  OS_os_log *v5;
  NSUUID *internalID;
  unsigned int v7;
  const __CFString *v8;
  int v9;
  NSUUID *v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  id v14;

  v4 = a3;
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v5 = self->_log;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      v7 = -[NISession internalState](self, "internalState") - 1;
      if (v7 > 7)
        v8 = CFSTR("Activating");
      else
        v8 = off_100813558[v7];
      v9 = 138412802;
      v10 = internalID;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Pause session error [%@]. State: %@. Error: %@", (uint8_t *)&v9, 0x20u);
    }

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NISession _invalidateSessionAndNotifyError:](self, "_invalidateSessionAndNotifyError:", v4);

}

- (void)_handlePauseSessionSuccess
{
  OS_os_log *v3;
  NSUUID *internalID;
  unsigned int v5;
  const __CFString *v6;
  int v7;
  NSUUID *v8;
  __int16 v9;
  const __CFString *v10;

  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v3 = self->_log;
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      v5 = -[NISession internalState](self, "internalState") - 1;
      if (v5 > 7)
        v6 = CFSTR("Activating");
      else
        v6 = off_100813558[v5];
      v7 = 138412546;
      v8 = internalID;
      v9 = 2112;
      v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "Pause session success [%@]. State: %@", (uint8_t *)&v7, 0x16u);
    }

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NISession internalState](self, "internalState") == 4)
  {
    -[NISession setInternalState:](self, "setInternalState:", 5);
    -[NISession _logDurationAndSubmit:](self, "_logDurationAndSubmit:", 0);
  }
}

- (void)_performBlockOnDelegateQueue:(id)a3 ifRespondsToSelector:(SEL)a4
{
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:evenIfNotRunning:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:evenIfNotRunning:", a3, a4, 0);
}

- (void)_performBlockOnDelegateQueue:(id)a3 ifRespondsToSelector:(SEL)a4 evenIfNotRunning:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  unsigned __int8 v10;
  id WeakRetained;
  OS_dispatch_queue *delegateQueue;
  OS_dispatch_queue *v13;
  dispatch_block_t block;

  v5 = a5;
  v8 = a3;
  v9 = v8;
  v10 = atomic_load((unsigned __int8 *)&self->_readyForCallbacks);
  if ((v10 & 1) != 0 || v5)
  {
    block = v8;
    if (a4)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector(WeakRetained, a4) & 1) == 0)
      {

        goto LABEL_10;
      }
      delegateQueue = self->_delegateQueue;

      v9 = block;
      if (delegateQueue)
      {
        v13 = self->_delegateQueue;
LABEL_8:
        dispatch_async((dispatch_queue_t)v13, block);
LABEL_10:
        v9 = block;
      }
    }
    else
    {
      v13 = self->_delegateQueue;
      if (v13)
        goto LABEL_8;
    }
  }

}

- (id)_verifyError:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  OS_os_log *v13;
  void *v14;
  id v15;
  uint8_t buf[24];

  v4 = a3;
  v5 = objc_msgSend(v4, "code");
  if ((unint64_t)v5 + 5889 < 8)
  {
    v6 = objc_msgSend(v4, "code");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v8 = sub_1001B9D34((uint64_t)v6, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
LABEL_5:
    v11 = (void *)v9;

    goto LABEL_6;
  }
  if ((unint64_t)v5 + 10017 < 2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v10 = sub_1001B9D34(-5887, v7);
    v9 = objc_claimAutoreleasedReturnValue(v10);
    goto LABEL_5;
  }
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v13 = self->_log;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid error code blocked from being sent to NISessionDelegate.  Error: %@"), v4));
      sub_1003E74BC(v14, buf, (os_log_t)v13);
    }

  }
  v15 = sub_1001B9D34(-5887, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v15);
LABEL_6:

  return v11;
}

- (void)_notifyDidInvalidateWithError:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  NISession *v12;
  id v13;

  v4 = a3;
  if (-[NISession _isInternalClient](self, "_isInternalClient"))
    v5 = v4;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(-[NISession _verifyError:](self, "_verifyError:", v4));
  v6 = v5;
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
    && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_1003E7510();
  }
  -[NISession setInvalidationError:](self, "setInvalidationError:", v6);
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_1002C01AC;
  v11 = &unk_1007FA518;
  v12 = self;
  v7 = v6;
  v13 = v7;
  -[NISession _performBlockOnDelegateQueue:ifRespondsToSelector:](self, "_performBlockOnDelegateQueue:ifRespondsToSelector:", &v8, "session:didInvalidateWithError:");
  -[NISession _submitErrorMetric:](self, "_submitErrorMetric:", v4, v8, v9, v10, v11, v12);

}

- (id)_getSessionFailureError
{
  void *v2;
  id v3;
  void *v4;
  NSErrorUserInfoKey v6;
  const __CFString *v7;

  v6 = NSLocalizedFailureReasonErrorKey;
  v7 = CFSTR("This session object is invalidated. Dispose of it and create a new one instead.");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  v3 = sub_1001B9D34(-5887, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (dispatch_queue_t)delegateQueue
{
  return (dispatch_queue_t)self->_delegateQueue;
}

- (int)internalState
{
  return self->_internalState;
}

- (void)setInternalState:(int)a3
{
  self->_internalState = a3;
}

- (NSError)invalidationError
{
  return (NSError *)objc_getProperty(self, a2, 272, 1);
}

- (void)setInvalidationError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (NSDictionary)activationResponse
{
  return (NSDictionary *)objc_getProperty(self, a2, 280, 1);
}

- (void)setActivationResponse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (NIInternalSessionDelegate)internalDelegate
{
  return (NIInternalSessionDelegate *)objc_loadWeakRetained((id *)&self->_internalDelegate);
}

- (void)setInternalDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_internalDelegate, a3);
}

- (void).cxx_destruct
{
  UWBSessionInterruptionBookkeeping *begin;

  objc_destroyWeak((id *)&self->_internalDelegate);
  objc_storeStrong((id *)&self->_activationResponse, 0);
  objc_storeStrong((id *)&self->_invalidationError, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastObjectUpdateLogTime, 0);
  objc_storeStrong((id *)&self->_visionContext, 0);
  objc_storeStrong((id *)&self->_systemEventNotifier, 0);
  objc_storeStrong((id *)&self->_findingNotifier, 0);
  objc_storeStrong((id *)&self->_devicePresenceNotifier, 0);
  objc_storeStrong((id *)&self->_acwgEventNotifier, 0);
  objc_storeStrong((id *)&self->_carKeyEventNotifier, 0);
  objc_storeStrong((id *)&self->_discoveryToken, 0);
  objc_storeStrong((id *)&self->_log, 0);
  begin = self->_interruptions.__begin_;
  if (begin)
  {
    self->_interruptions.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_discoveryTokenSemaphore, 0);
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_storeStrong((id *)&self->_exportedObjectForwarder, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_internalID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  float *v2;
  float32x4_t v3;

  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 26) = 0;
  *((_QWORD *)self + 27) = 0;
  v2 = &NINearbyObjectDistanceNotAvailable;
  v3 = vld1q_dup_f32(v2);
  *((float32x4_t *)self + 14) = v3;
  v3.f32[0] = NINearbyObjectAngleNotAvailable;
  *((float *)self + 60) = NINearbyObjectAngleNotAvailable;
  *((_DWORD *)self + 61) = v3.i32[0];
  return self;
}

+ (NIInternalDeviceCapability)internalDeviceCapabilities
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NISession cachedPlatformCapabilities](NISession, "cachedPlatformCapabilities"));

  if (!v2)
    +[NISession _queryAndCacheCapabilities](NISession, "_queryAndCacheCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NISession cachedPlatformCapabilities](NISession, "cachedPlatformCapabilities"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("UWBSupportedPlatform")));
  v5 = objc_msgSend(v4, "BOOLValue");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NISession cachedPlatformCapabilities](NISession, "cachedPlatformCapabilities"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("WifiSupportedPlatform")));
  v8 = objc_msgSend(v7, "BOOLValue");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NISession cachedPlatformCapabilities](NISession, "cachedPlatformCapabilities"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("UWBSupportedPlatformPDOA")));
  v11 = objc_msgSend(v10, "BOOLValue");

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NISession cachedPlatformCapabilities](NISession, "cachedPlatformCapabilities"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("UWBSupportedPlatformSyntheticAperture")));
  v14 = objc_msgSend(v13, "BOOLValue");

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NISession cachedPlatformCapabilities](NISession, "cachedPlatformCapabilities"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("UWBSupportedPlatformExtendedDistance")));
  v17 = objc_msgSend(v16, "BOOLValue");

  return (NIInternalDeviceCapability *)-[NIDeviceCapabilities initWithFineRangingSupport:coarseRangingSupport:aoaSupport:extendedDistanceMeasurementSupport:syntheticApertureSupport:]([NIDeviceCapabilities alloc], "initWithFineRangingSupport:coarseRangingSupport:aoaSupport:extendedDistanceMeasurementSupport:syntheticApertureSupport:", v5, v8, v11, v17, v14);
}

- (void)_addObject:(id)a3
{
  id v5;
  OS_dispatch_queue *queue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 1950, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("discoveryToken"));

  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002C0BFC;
  block[3] = &unk_1007FA518;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)_removeObject:(id)a3
{
  id v5;
  OS_dispatch_queue *queue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 1964, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("discoveryToken"));

  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002C0E6C;
  block[3] = &unk_1007FA518;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)_addRegionPredicate:(id)a3
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3));
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 1978, CFSTR("_addRegionPredicate is deprecated"));

}

- (void)_removeRegionPredicate:(id)a3
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3));
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 1982, CFSTR("_removeRegionPredicate is deprecated"));

}

+ (id)observerSession
{
  return -[NISession _initAndConnectToServerWithOptions:]([NISession alloc], "_initAndConnectToServerWithOptions:", 1);
}

- (BOOL)isPreciseRangingAllowed
{
  OS_dispatch_queue *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002C1190;
  v5[3] = &unk_100813280;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isExtendedDistanceMeasurementAllowed
{
  OS_dispatch_queue *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002C1310;
  v5[3] = &unk_100813280;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)processBluetoothHostTimeSyncWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4 eventCounter:(unint64_t)a5
{
  OS_dispatch_queue *queue;
  _QWORD v6[8];

  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1002C145C;
  v6[3] = &unk_1008132D0;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_sync((dispatch_queue_t)queue, v6);
}

- (void)processDCKMessage:(id)a3 responseCallback:(id)a4
{
  id v7;
  id v8;
  void *v9;
  OS_dispatch_queue *queue;
  id v11;
  void *v12;
  OS_dispatch_queue *delegateQueue;
  id v14;
  void *v15;
  void *v16;
  _QWORD block[5];
  id v18;
  id v19;
  _QWORD v20[4];
  void *v21;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2150, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dckMessage"));

    if (v9)
      goto LABEL_3;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("responseCallback"));

LABEL_3:
  if (objc_msgSend(v7, "length"))
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002C2608;
    block[3] = &unk_100813408;
    block[4] = self;
    v18 = v7;
    v19 = v9;
    v11 = v9;
    dispatch_sync((dispatch_queue_t)queue, block);

    v12 = v18;
  }
  else
  {
    delegateQueue = self->_delegateQueue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1002C250C;
    v20[3] = &unk_10080AC38;
    v21 = v9;
    v14 = v9;
    dispatch_async((dispatch_queue_t)delegateQueue, v20);
    v12 = v21;
  }

}

- (void)processBluetoothEventWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4 eventCounter:(unint64_t)a5
{
  -[NISession processBluetoothHostTimeSyncWithType:btcClockTicks:eventCounter:](self, "processBluetoothHostTimeSyncWithType:btcClockTicks:eventCounter:", a3, a4, a5);
}

- (void)processBluetoothEventWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4
{
  -[NISession processBluetoothEventWithType:btcClockTicks:eventCounter:](self, "processBluetoothEventWithType:btcClockTicks:eventCounter:");
}

- (id)deleteURSKs
{
  OS_dispatch_queue *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1002B8CA4;
  v10 = sub_1002B8CB4;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002C284C;
  v5[3] = &unk_100813280;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_setDebugURSK:(id)a3 transactionIdentifier:(unsigned int)a4
{
  id v6;
  void *v7;
  OS_dispatch_queue *queue;
  id v9;
  void *v10;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  NSErrorUserInfoKey v22;
  const __CFString *v23;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = sub_1002B8CA4;
    v20 = sub_1002B8CB4;
    v21 = 0;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002C2A84;
    block[3] = &unk_100813430;
    block[4] = self;
    v15 = a4;
    v13 = v6;
    v14 = &v16;
    dispatch_sync((dispatch_queue_t)queue, block);
    v9 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v22 = NSLocalizedDescriptionKey;
    v23 = CFSTR("Given nil URSK.");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -19886, v10));

  }
  return v9;
}

- (BOOL)isRangingLimitExceeded
{
  OS_dispatch_queue *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002C2BAC;
  v5[3] = &unk_100813280;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NICarKeyEventNotifier)carKeyEventNotifier
{
  NICarKeyEventNotifier *carKeyEventNotifier;
  NICarKeyEventNotifier *v4;
  NICarKeyEventNotifier *v5;

  carKeyEventNotifier = self->_carKeyEventNotifier;
  if (!carKeyEventNotifier)
  {
    v4 = -[NICarKeyEventNotifier initWithParentSession:]([NICarKeyEventNotifier alloc], "initWithParentSession:", self);
    v5 = self->_carKeyEventNotifier;
    self->_carKeyEventNotifier = v4;

    carKeyEventNotifier = self->_carKeyEventNotifier;
  }
  return carKeyEventNotifier;
}

- (id)_setURSKTTL:(unint64_t)a3
{
  OS_dispatch_queue *queue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1002B8CA4;
  v11 = sub_1002B8CB4;
  v12 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002C2D9C;
  block[3] = &unk_100813458;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (NIAcwgEventNotifier)acwgEventNotifier
{
  NIAcwgEventNotifier *acwgEventNotifier;
  NIAcwgEventNotifier *v4;
  NIAcwgEventNotifier *v5;

  acwgEventNotifier = self->_acwgEventNotifier;
  if (!acwgEventNotifier)
  {
    v4 = -[NIAcwgEventNotifier initWithParentSession:]([NIAcwgEventNotifier alloc], "initWithParentSession:", self);
    v5 = self->_acwgEventNotifier;
    self->_acwgEventNotifier = v4;

    acwgEventNotifier = self->_acwgEventNotifier;
  }
  return acwgEventNotifier;
}

- (void)processAcwgM1Msg:(id)a3 withSessionTriggerReason:(int64_t)a4
{
  id v7;
  OS_dispatch_queue *queue;
  void *v9;
  id v10;
  _QWORD block[5];
  id v12;
  int64_t v13;

  v7 = a3;
  if (!v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2318, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("m1Msg"));

  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002C309C;
  block[3] = &unk_10080F290;
  block[4] = self;
  v12 = v7;
  v13 = a4;
  v10 = v7;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)processAcwgM3Msg:(id)a3
{
  id v5;
  OS_dispatch_queue *queue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2328, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("m3Msg"));

  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002C31D8;
  block[3] = &unk_1007FA518;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)suspendAcwgRanging:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4
{
  OS_dispatch_queue *queue;
  _QWORD block[6];
  unsigned int v6;

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002C3288;
  block[3] = &unk_10080B8C0;
  v6 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)processAcwgRangingSessionResumeRequestMsg:(unsigned int)a3 withResumeTriggerReason:(int64_t)a4
{
  OS_dispatch_queue *queue;
  _QWORD block[6];
  unsigned int v6;

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002C333C;
  block[3] = &unk_10080B8C0;
  v6 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)prefetchAcwgUrsk:(unsigned int)a3
{
  OS_dispatch_queue *queue;
  _QWORD v4[5];
  unsigned int v5;

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002C33F0;
  v4[3] = &unk_10080B978;
  v4[4] = self;
  v5 = a3;
  dispatch_sync((dispatch_queue_t)queue, v4);
}

- (void)updateResponderDeviceIdentifier:(id)a3 completionHandler:(id)a4
{
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  if (!v10)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2366, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deviceIdentifier"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2367, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v7[2](v7, 1, 0);

}

- (void)processVisionInput:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002C35E4;
  block[3] = &unk_1007FA518;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (NIDevicePresenceNotifier)devicePresenceNotifier
{
  NIDevicePresenceNotifier *devicePresenceNotifier;
  NIDevicePresenceNotifier *v4;
  NIDevicePresenceNotifier *v5;

  devicePresenceNotifier = self->_devicePresenceNotifier;
  if (!devicePresenceNotifier)
  {
    v4 = -[NIDevicePresenceNotifier initWithParentSession:]([NIDevicePresenceNotifier alloc], "initWithParentSession:", self);
    v5 = self->_devicePresenceNotifier;
    self->_devicePresenceNotifier = v4;

    devicePresenceNotifier = self->_devicePresenceNotifier;
  }
  return devicePresenceNotifier;
}

+ (id)generateBluetoothDeviceTokenWithPublicAddress:(id)a3 IRK:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *Data;
  NIDiscoveryToken *v11;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[2];

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NISession.mm"), 2427, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("IRK"));

  }
  if (objc_msgSend(v8, "length") != (id)16)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NISession.mm"), 2428, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[IRK length] == NIDiscoveryTokenIRKLengthBytes"));

  }
  v16[0] = &off_10082C1C0;
  v16[1] = &off_10082C1D8;
  v17[0] = v8;
  v17[1] = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 2));
  Data = (void *)OPACKEncoderCreateData(v9, 8, 0);
  if (!Data)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NISession.mm"), 2434, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tokenData"));

  }
  v11 = -[NIDiscoveryToken initWithBytes:]([NIDiscoveryToken alloc], "initWithBytes:", Data);

  return v11;
}

+ (id)generateFindingDiscoveryToken
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = NSRandomData(16, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NIDiscoveryToken generateFindingTokenWithIRK:](NIDiscoveryToken, "generateFindingTokenWithIRK:", v3));

  return v4;
}

+ (id)generateFindingDiscoveryTokenWithSharedSecret:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "length") == (id)16)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NIDiscoveryToken generateFindingTokenWithIRK:](NIDiscoveryToken, "generateFindingTokenWithIRK:", v3));
  else
    v4 = 0;

  return v4;
}

+ (id)generateFindingDiscoveryTokenWithIdentityResolvingKey:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(+[NISession generateFindingDiscoveryTokenWithSharedSecret:](NISession, "generateFindingDiscoveryTokenWithSharedSecret:", a3));
}

- (NIFindingNotifier)findingNotifier
{
  NIFindingNotifier *findingNotifier;
  NIFindingNotifier *v4;
  NIFindingNotifier *v5;

  findingNotifier = self->_findingNotifier;
  if (!findingNotifier)
  {
    v4 = -[NIFindingNotifier initWithParentSession:]([NIFindingNotifier alloc], "initWithParentSession:", self);
    v5 = self->_findingNotifier;
    self->_findingNotifier = v4;

    findingNotifier = self->_findingNotifier;
  }
  return findingNotifier;
}

- (void)_provideTruthTag:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002C4D38;
  block[3] = &unk_1007FA518;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (NISystemEventNotifier)systemEventNotifier
{
  NISystemEventNotifier *systemEventNotifier;
  NISystemEventNotifier *v4;
  NISystemEventNotifier *v5;

  systemEventNotifier = self->_systemEventNotifier;
  if (!systemEventNotifier)
  {
    v4 = -[NISystemEventNotifier initWithParentSession:]([NISystemEventNotifier alloc], "initWithParentSession:", self);
    v5 = self->_systemEventNotifier;
    self->_systemEventNotifier = v4;

    systemEventNotifier = self->_systemEventNotifier;
  }
  return systemEventNotifier;
}

@end
