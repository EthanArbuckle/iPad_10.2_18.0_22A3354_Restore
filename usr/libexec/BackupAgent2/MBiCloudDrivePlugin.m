@implementation MBiCloudDrivePlugin

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
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBiCloudDrivePlugin.m"), 23, CFSTR("Absolute path doesn't have domain root %@ as prefix: %@"), v15, v8);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootPath"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringFromIndex:", (char *)objc_msgSend(v11, "length") + 1));

    v8 = (void *)v12;
  }

  return v8;
}

- (id)endingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  _QWORD v14[4];
  dispatch_semaphore_t v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "persona", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userIncompleteRestoreDirectory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v5, 1));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("var/mobile"), 1));
  v9 = MBGetDefaultLog(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "=iCloudDrive= restoreDirectoryURL:%@, userURL:%@", buf, 0x16u);
    _MBLog(CFSTR("DEFAULT"), "=iCloudDrive= restoreDirectoryURL:%@, userURL:%@", v6, v7);
  }

  v11 = objc_msgSend(objc_alloc((Class)BRCDatabaseRestoreManager), "initWithUserURL:", v7);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100075594;
  v14[3] = &unk_1000D9818;
  v15 = dispatch_semaphore_create(0);
  v12 = v15;
  objc_msgSend(v11, "restoreWithCompletionBlock:", v14);
  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

  return 0;
}

+ (id)backUpiCloudDriveDatabaseManifestForUserVolume:(id)a3 snapshotMountPoint:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  dispatch_semaphore_t v15;
  id v16;
  NSObject *v17;
  intptr_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v27[4];
  NSObject *v28;
  _QWORD *v29;
  _BYTE *v30;
  _QWORD v31[5];
  id v32;
  uint8_t v33[4];
  uint64_t v34;
  _BYTE buf[24];
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v5 = a3;
  v6 = a4;
  v7 = FPIsCloudDocsWithFPFSEnabled();
  if ((_DWORD)v7)
  {
    v9 = MBGetDefaultLog(v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "=iCloudDrive= FPFS is enabled for iCloud Drive, no need to do legacy backup.", buf, 2u);
      _MBLog(CFSTR("DEFAULT"), "=iCloudDrive= FPFS is enabled for iCloud Drive, no need to do legacy backup.");
    }
LABEL_16:
    v23 = 0;
    goto LABEL_17;
  }
  if (!v5)
  {
    v24 = MBGetDefaultLog(v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "=iCloudDrive= Missing userVolumeMountPount for iCloud Drive Database", buf, 2u);
      _MBLog(CFSTR("FAULT"), "=iCloudDrive= Missing userVolumeMountPount for iCloud Drive Database");
    }
    goto LABEL_16;
  }
  if (!v6)
  {
    v25 = MBGetDefaultLog(v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "=iCloudDrive= Missing snapshotMountPoint for iCloud Drive Database", buf, 2u);
      _MBLog(CFSTR("FAULT"), "=iCloudDrive= Missing snapshotMountPoint for iCloud Drive Database");
    }
    goto LABEL_16;
  }
  v10 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v6, 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v5, 1));
  v13 = MBGetDefaultLog(v11, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "=iCloudDrive= userFolderURLInSnapshot:%@, userFolderURLInLiveFS:%@", buf, 0x16u);
    _MBLog(CFSTR("DEFAULT"), "=iCloudDrive= userFolderURLInSnapshot:%@, userFolderURLInLiveFS:%@", v10, v11);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v36 = sub_100075A8C;
  v37 = sub_100075A9C;
  v38 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = sub_100075A8C;
  v31[4] = sub_100075A9C;
  v32 = 0;
  v15 = dispatch_semaphore_create(0);
  v16 = objc_msgSend(objc_alloc((Class)BRCDatabaseBackupManager), "initWithUserURL:outputUserURL:", v10, v11);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100075AA4;
  v27[3] = &unk_1000DA090;
  v29 = v31;
  v30 = buf;
  v17 = v15;
  v28 = v17;
  objc_msgSend(v16, "backUpWithCompletionBlock:", v27);
  v18 = dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    v20 = MBGetDefaultLog(v18, v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v33 = 138412290;
      v34 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "=iCloudDrive= BRCDatabaseBackupManager failed: %@", v33, 0xCu);
      _MBLog(CFSTR("ERROR"), "=iCloudDrive= BRCDatabaseBackupManager failed: %@", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    }

    v23 = *(id *)(*(_QWORD *)&buf[8] + 40);
  }
  else
  {
    v23 = 0;
  }

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(buf, 8);

LABEL_17:
  return v23;
}

+ (id)backUpFPFSDatabaseManifestForUserVolume:(id)a3 snapshotMountPoint:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  dispatch_semaphore_t v12;
  void *v13;
  NSObject *v14;
  intptr_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  NSObject *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;

  v5 = a3;
  v6 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_100075A8C;
  v29 = sub_100075A9C;
  v30 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v6, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v5, 1));
  v10 = MBGetDefaultLog(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v32 = v7;
    v33 = 2112;
    v34 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "=iCloudDrive= FPFS: userFolderURLInSnapshot:%@, userFolderURLInLiveFS:%@", buf, 0x16u);
    _MBLog(CFSTR("DEFAULT"), "=iCloudDrive= FPFS: userFolderURLInSnapshot:%@, userFolderURLInLiveFS:%@", v7, v8);
  }

  v12 = dispatch_semaphore_create(0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[FPDaemonConnection sharedConnection](FPDaemonConnection, "sharedConnection"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100075DFC;
  v22[3] = &unk_1000DA0B8;
  v24 = &v25;
  v14 = v12;
  v23 = v14;
  objc_msgSend(v13, "backUpUserURL:outputUserURL:completionHandler:", v7, v8, v22);

  v15 = dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  if (v26[5])
  {
    v17 = MBGetDefaultLog(v15, v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)v26[5];
      *(_DWORD *)buf = 138412290;
      v32 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "=iCloudDrive= FPFSSQLBackupManager failed: %@", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), "=iCloudDrive= FPFSSQLBackupManager failed: %@", v26[5]);
    }

    v20 = (id)v26[5];
  }
  else
  {
    v20 = 0;
  }

  _Block_object_dispose(&v25, 8);
  return v20;
}

@end
