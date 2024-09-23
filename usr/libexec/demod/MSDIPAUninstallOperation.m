@implementation MSDIPAUninstallOperation

- (id)methodSelectors
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_IXUninstallAppIPA"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v2, 0));

  return v3;
}

- (int64_t)type
{
  return 4;
}

- (BOOL)_IXUninstallAppIPA
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  dispatch_semaphore_t v6;
  id v7;
  NSObject *v8;
  dispatch_time_t v9;
  id v10;
  NSObject *v11;
  int v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  NSObject *v18;
  uint8_t v20[8];
  _QWORD v21[4];
  id v22;
  NSObject *v23;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v26;
  char v27;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifier"));

  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Uninstallig app: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v6 = dispatch_semaphore_create(0);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v26 = 0x2020000000;
  v27 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10007C318;
  v21[3] = &unk_10013F358;
  v7 = v3;
  v22 = v7;
  p_buf = &buf;
  v8 = v6;
  v23 = v8;
  +[IXAppInstallCoordinator uninstallAppWithBundleID:requestUserConfirmation:completion:](IXAppInstallCoordinator, "uninstallAppWithBundleID:requestUserConfirmation:completion:", v7, 0, v21);
  v9 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    v10 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Timed out waiting for app removal to finish.", v20, 2u);
    }

  }
  v12 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
  if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCache sharedInstance](MSDCache, "sharedInstance"));
    v14 = objc_msgSend(v13, "containerExist:", v7);

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCache sharedInstance](MSDCache, "sharedInstance"));
      v16 = objc_msgSend(v15, "deleteContainer:", v7);

      if ((v16 & 1) == 0)
      {
        v17 = sub_1000604F0();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          sub_1000C4E08((uint64_t)v7, v18);

      }
    }
  }

  _Block_object_dispose(&buf, 8);
  return v12 != 0;
}

@end
