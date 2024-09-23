@implementation BKDisplayRenderOverlayPersistenceCoordinator

- (BKDisplayRenderOverlayPersistenceCoordinator)init
{
  BKDisplayRenderOverlayPersistenceCoordinator *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *rootPersistencePath;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKDisplayRenderOverlayPersistenceCoordinator;
  v2 = -[BKDisplayRenderOverlayPersistenceCoordinator init](&v9, "init");
  if (v2)
  {
    v3 = BSSystemSharedDirectoryForCurrentProcess();
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("RenderOverlay")));
    v6 = (NSString *)objc_msgSend(v5, "copy");
    rootPersistencePath = v2->_rootPersistencePath;
    v2->_rootPersistencePath = v6;

  }
  return v2;
}

- (id)rebuildPersistentOverlays
{
  void *v3;
  void *v4;
  id v5;
  __int128 v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  __int128 v25;
  id v26;
  BKDisplayRenderOverlayPersistenceCoordinator *v27;
  id obj;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];

  v26 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v27 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enumeratorAtPath:", self->_rootPersistencePath));

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v31;
    *(_QWORD *)&v6 = 138543618;
    v25 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "hasSuffix:", CFSTR("libitmap"), v25))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](v27->_rootPersistencePath, "stringByAppendingPathComponent:", v10));
          v12 = objc_alloc((Class)NSData);
          v29 = 0;
          v13 = objc_msgSend(v12, "initWithContentsOfFile:options:error:", v11, 8, &v29);
          v14 = v29;
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[_BKDisplayRenderOverlayPersistenceData classesRequiredToDecode](_BKDisplayRenderOverlayPersistenceData, "classesRequiredToDecode"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[_BKDisplayRenderOverlayPersistenceData bs_secureDecodedFromData:withAdditionalClasses:](_BKDisplayRenderOverlayPersistenceData, "bs_secureDecodedFromData:withAdditionalClasses:", v13, v15));

          v17 = (unint64_t)objc_msgSend(v16, "overlayType");
          if (v17 <= 4)
          {
            v19 = objc_opt_class(*(&off_1000EB5E8)[v17], v18);
            v17 = objc_claimAutoreleasedReturnValue(v19);
          }
          v20 = objc_msgSend(objc_alloc((Class)(id)v17), "_initWithPersistenceData:", v16);
          v21 = v20;
          if (v20)
          {
            v22 = BKLogDisplay(v20);
            v23 = objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v25;
              v35 = v21;
              v36 = 2114;
              v37 = v11;
              _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "[BKDisplayRenderOverlayPersistenceCoordinator] Loaded overlay from persistence: %{public}@ from location: %{public}@", buf, 0x16u);
            }

            objc_msgSend(v26, "addObject:", v21);
          }

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v7);
  }

  return v26;
}

- (BOOL)saveOverlay:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  NSString *rootPersistencePath;
  id v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSString *v21;
  void *v22;
  unsigned __int8 v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  NSString *v27;
  void *v28;
  NSString *v29;
  __CFString *v30;
  __CFString *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  const char *v39;
  NSObject *v40;
  uint32_t v41;
  uint64_t v42;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  id v56;
  NSFileAttributeKey v57;
  _UNKNOWN **v58;
  NSFileAttributeKey v59;
  _UNKNOWN **v60;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = BKLogDisplay(v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
      *(_DWORD *)buf = 138543362;
      v52 = (uint64_t)v44;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[BKDisplayRenderOverlayPersistenceCoordinator] Persisting overlay: %{public}@", buf, 0xCu);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_persistenceData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bs_secureEncoded"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlayPersistenceCoordinator _fileNameForOverlay:](self, "_fileNameForOverlay:", v5));
    v47 = objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlayPersistenceCoordinator _filePathForOverlay:](self, "_filePathForOverlay:", v5));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v59 = NSFilePosixPermissions;
    v60 = &off_1000F75D0;
    v12 = 1;
    v13 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1));
    v46 = (void *)v13;
    if ((objc_msgSend(v11, "fileExistsAtPath:isDirectory:", self->_rootPersistencePath, 0) & 1) != 0)
    {
      v14 = 0;
    }
    else
    {
      rootPersistencePath = self->_rootPersistencePath;
      v50 = 0;
      v12 = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", rootPersistencePath, 1, v13, &v50);
      v17 = v50;
      v18 = v17;
      if ((v12 & 1) == 0)
      {
        v19 = BKLogCommon(v17);
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = self->_rootPersistencePath;
          *(_DWORD *)buf = 138543618;
          v52 = (uint64_t)v21;
          v53 = 2114;
          v54 = (uint64_t)v18;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[BKDisplayRenderOverlayPersistenceCoordinator] Unable to create path: %{public}@: %{public}@", buf, 0x16u);
        }

      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", self->_rootPersistencePath, 1));
      v49 = 0;
      v23 = objc_msgSend(v22, "setResourceValue:forKey:error:", &__kCFBooleanTrue, NSURLIsExcludedFromBackupKey, &v49);
      v24 = v49;
      v14 = v24;
      if ((v23 & 1) == 0)
      {
        v25 = BKLogCommon(v24);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = self->_rootPersistencePath;
          *(_DWORD *)buf = 138543618;
          v52 = (uint64_t)v27;
          v53 = 2114;
          v54 = (uint64_t)v14;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[BKDisplayRenderOverlayPersistenceCoordinator] Unable to exclude path from backups: %{public}@: %{public}@", buf, 0x16u);
        }

      }
    }
    v57 = NSFilePosixPermissions;
    v58 = &off_1000F75E8;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1));
    v29 = NSTemporaryDirectory();
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue(v29);
    v31 = v30;
    if (!v30)
      v30 = CFSTR("/tmp");
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingPathComponent:](v30, "stringByAppendingPathComponent:", v10));

    if (!v12)
    {
      LOBYTE(v15) = 0;
      v34 = (void *)v47;
LABEL_33:

      goto LABEL_34;
    }
    v33 = objc_msgSend(v11, "createFileAtPath:contents:attributes:", v32, v9, v28);
    v34 = (void *)v47;
    if ((v33 & 1) != 0)
    {
      v48 = v14;
      v15 = objc_msgSend(v11, "moveItemAtPath:toPath:error:", v32, v47, &v48);
      v45 = v48;

      if (v15)
      {
        v36 = BKLogDisplay(v35);
        v37 = objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v52 = v47;
          _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "[BKDisplayRenderOverlayPersistenceCoordinator] Wrote overlay to file: %{public}@", buf, 0xCu);
        }
        LOBYTE(v15) = 1;
        goto LABEL_31;
      }
      v42 = BKLogCommon(v35);
      v37 = objc_claimAutoreleasedReturnValue(v42);
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
LABEL_31:
        v14 = v45;
        goto LABEL_32;
      }
      *(_DWORD *)buf = 138543874;
      v52 = (uint64_t)v32;
      v53 = 2114;
      v54 = v47;
      v55 = 2114;
      v14 = v45;
      v56 = v45;
      v39 = "[BKDisplayRenderOverlayPersistenceCoordinator] Unable to move temporary file (%{public}@) to real location i"
            "n the shared container (%{public}@): %{public}@";
      v40 = v37;
      v41 = 32;
    }
    else
    {
      v38 = BKLogCommon(v33);
      v37 = objc_claimAutoreleasedReturnValue(v38);
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
LABEL_30:
        LOBYTE(v15) = 0;
LABEL_32:

        goto LABEL_33;
      }
      *(_DWORD *)buf = 138543362;
      v52 = (uint64_t)v32;
      v39 = "[BKDisplayRenderOverlayPersistenceCoordinator] Unable to save temporary snapshot to disk at %{public}@";
      v40 = v37;
      v41 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, v39, buf, v41);
    goto LABEL_30;
  }
  LOBYTE(v15) = 0;
LABEL_34:

  return v15;
}

- (BOOL)destroyOverlay:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlayPersistenceCoordinator _filePathForOverlay:](self, "_filePathForOverlay:", a3));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v5 = objc_msgSend(v4, "removeItemAtPath:error:", v3, 0);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_filePathForOverlay:(id)a3
{
  void *v4;
  NSString *rootPersistencePath;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlayPersistenceCoordinator _fileNameForOverlay:](self, "_fileNameForOverlay:", a3));
  rootPersistencePath = self->_rootPersistencePath;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathExtension:", CFSTR("libitmap")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](rootPersistencePath, "stringByAppendingPathComponent:", v6));

  return v7;
}

- (id)_fileNameForOverlay:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "descriptor"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayUUID"));
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("main");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@|%@"), v7, v8));
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootPersistencePath, 0);
}

+ (BKDisplayRenderOverlayPersistenceCoordinator)sharedInstance
{
  if (qword_1001175D8 != -1)
    dispatch_once(&qword_1001175D8, &stru_1000ECC60);
  return (BKDisplayRenderOverlayPersistenceCoordinator *)(id)qword_1001175D0;
}

@end
