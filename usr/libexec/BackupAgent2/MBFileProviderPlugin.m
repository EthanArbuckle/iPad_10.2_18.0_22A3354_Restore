@implementation MBFileProviderPlugin

- (id)_standardizePath:(id)a3 fromDomain:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  uint64_t v12;
  void *v14;
  void *v15;

  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByStandardizingPath"));
  if (objc_msgSend(v8, "isAbsolutePath"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootPath"));
    v10 = objc_msgSend(v8, "hasPrefix:", v9);

    if ((v10 & 1) == 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootPath"));
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBFileProviderPlugin.m"), 20, CFSTR("Absolute path doesn't have domain root %@ as prefix: %@"), v15, v8);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootPath"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringFromIndex:", (char *)objc_msgSend(v11, "length") + 1));

    v8 = (void *)v12;
  }

  return v8;
}

- (id)endingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  dispatch_semaphore_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _QWORD v26[4];
  dispatch_semaphore_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "persona"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userIncompleteRestoreDirectory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v7, 1));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", CFSTR("var/mobile"), 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileProviderPlugin _policyElementsForEngine:](self, "_policyElementsForEngine:", v5));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentsJoinedByString:", CFSTR("-")));

  v14 = MBGetDefaultLog(v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "properties"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "buildVersion"));
    *(_DWORD *)buf = 138412802;
    v29 = v9;
    v30 = 2112;
    v31 = v17;
    v32 = 2112;
    v33 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "userURL:%@, buildVersion:%@, restorePolicy:%@", buf, 0x20u);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "properties"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "buildVersion"));
    _MBLog(CFSTR("DEFAULT"), "userURL:%@, buildVersion:%@, restorePolicy:%@", v9, v19, v11);

  }
  v20 = dispatch_semaphore_create(0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[FPDaemonConnection sharedConnection](FPDaemonConnection, "sharedConnection"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "properties"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "buildVersion"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10003BF88;
  v26[3] = &unk_1000D9818;
  v27 = v20;
  v24 = v20;
  objc_msgSend(v21, "restoreUserURL:fromBuild:restoreType:completionHandler:", v9, v23, v11, v26);

  dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
  return 0;
}

- (id)_policyElementsForEngine:(id)a3
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_msgSend(a3, "enginePolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "addObject:", CFSTR("cloudKitEngine"));
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v5, "addObject:", CFSTR("driveEngine"));
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(v5, "addObject:", CFSTR("deviceTransferEngine"));
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v5, "addObject:", CFSTR("serviceEngine"));
  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0)
      goto LABEL_7;
LABEL_15:
    objc_msgSend(v5, "addObject:", CFSTR("megaBackup"));
    if ((v3 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  objc_msgSend(v5, "addObject:", CFSTR("encryptedBackup"));
  if ((v3 & 0x20) != 0)
    goto LABEL_15;
LABEL_7:
  if ((v3 & 0x40) != 0)
LABEL_8:
    objc_msgSend(v5, "addObject:", CFSTR("shouldCommit"));
LABEL_9:
  v6 = objc_msgSend(v5, "copy");

  return v6;
}

@end
