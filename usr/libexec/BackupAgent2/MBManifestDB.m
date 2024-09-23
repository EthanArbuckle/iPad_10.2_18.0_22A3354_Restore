@implementation MBManifestDB

+ (MBManifestDB)manifestDBWithDrive:(id)a3 sourcePath:(id)a4 properties:(id)a5 domainManager:(id)a6 keybag:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  MBManifestDB *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  MBManifestDBDownloadHelper *v33;
  unsigned __int8 v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;
  const __CFString *v49;
  MBManifestDBDownloadHelper *v50;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v19 = MBTemporaryPath(v17, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  if (objc_msgSend(v15, "encrypted")
    && (v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "manifestEncryptionKey")),
        v21,
        !v17)
    && v21)
  {
    v24 = MBGetDefaultLog(v22, v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "No keybag available to decrypt manifest", buf, 2u);
      _MBLog(CFSTR("ERROR"), "No keybag available to decrypt manifest");
    }

    v26 = 0;
    if (a8)
      *a8 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("No keybag available to decrypt encrypted manifest")));
  }
  else
  {
    if (objc_msgSend(v15, "encrypted"))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "manifestEncryptionKey"));

      v30 = &__NSDictionary0__struct;
      if (v17 && v27)
      {
        v31 = MBGetDefaultLog(v28, v29);
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Decrypting manifest database", buf, 2u);
          _MBLog(CFSTR("DEFAULT"), "Decrypting manifest database");
        }

        v33 = objc_alloc_init(MBManifestDBDownloadHelper);
        -[MBManifestDBDownloadHelper setKeybag:](v33, "setKeybag:", v17);
        -[MBManifestDBDownloadHelper setProperties:](v33, "setProperties:", v15);
        v49 = CFSTR("FileHandleFactory");
        v50 = v33;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1));

      }
    }
    else
    {
      v30 = &__NSDictionary0__struct;
    }
    v44 = 0;
    v34 = objc_msgSend(v13, "downloadFileAtPath:toPath:options:error:", v14, v20, v30, &v44);
    v35 = v44;
    v37 = v35;
    if ((v34 & 1) == 0)
    {
      v38 = MBGetDefaultLog(v35, v36);
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v37;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Failed to download manifest db from backup: %@", buf, 0xCu);
        _MBLog(CFSTR("ERROR"), "Failed to download manifest db from backup: %@", v37);
      }

      if (a8)
        *a8 = objc_retainAutorelease(v37);
    }
    v26 = -[MBManifestDB initWithPath:properties:domainManager:]([MBManifestDB alloc], "initWithPath:properties:domainManager:", v20, v15, v16);
    v41 = MBGetDefaultLog(v26, v40);
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v46 = v14;
      v47 = 2112;
      v48 = v20;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "ManifestDB: downloading %@ to %@", buf, 0x16u);
      _MBLog(CFSTR("DEFAULT"), "ManifestDB: downloading %@ to %@", v14, v20);
    }

  }
  return v26;
}

+ (MBManifestDB)manifestDBWithDrive:(id)a3 sourcePath:(id)a4 properties:(id)a5 domainManager:(id)a6 error:(id *)a7
{
  return (MBManifestDB *)objc_msgSend(a1, "manifestDBWithDrive:sourcePath:properties:domainManager:keybag:error:", a3, a4, a5, a6, 0, a7);
}

+ (MBManifestDB)manifestDBWithDrive:(id)a3 sourcePath:(id)a4 domainManager:(id)a5 error:(id *)a6
{
  return +[MBManifestDB manifestDBWithDrive:sourcePath:properties:domainManager:error:](MBManifestDB, "manifestDBWithDrive:sourcePath:properties:domainManager:error:", a3, a4, 0, a5, a6);
}

- (MBManifestDB)initWithPath:(id)a3 domainManager:(id)a4
{
  return -[MBManifestDB initWithPath:properties:domainManager:](self, "initWithPath:properties:domainManager:", a3, 0, a4);
}

- (MBManifestDB)initWithPath:(id)a3 properties:(id)a4 domainManager:(id)a5
{
  id v10;
  id v11;
  id v12;
  MBManifestDB *v13;
  MBManifestDB *v14;
  void **p_properties;
  id v16;
  void *v17;
  MBEncryptedFileHandle *encryptedFileHandle;
  dispatch_queue_t v19;
  OS_dispatch_queue *callbackQueue;
  void *v22;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v23.receiver = self;
  v23.super_class = (Class)MBManifestDB;
  v13 = -[MBManifestDB init](&v23, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_path, a3);
    objc_storeStrong((id *)&v14->_domainManager, a5);
    p_properties = (void **)&v14->_properties;
    objc_storeStrong((id *)&v14->_properties, a4);
    if (!v14->_properties)
    {
      v16 = objc_alloc_init((Class)MBProperties);
      v17 = *p_properties;
      *p_properties = v16;

    }
    encryptedFileHandle = v14->_encryptedFileHandle;
    v14->_encryptedFileHandle = 0;

    if (!v14->_domainManager)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("MBManifestDB.m"), 160, CFSTR("DomainManager must not be nil"));

    }
    v19 = dispatch_queue_create("com.apple.MobileBackup.MBManifestDBCallback", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    callbackQueue = v14->_callbackQueue;
    v14->_callbackQueue = (OS_dispatch_queue *)v19;

  }
  return v14;
}

- (void)dealloc
{
  PQLConnection *v3;
  PQLConnection *pdb;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSString *path;
  NSObject *v10;
  objc_super v11;
  _QWORD block[4];
  PQLConnection *v13;
  uint8_t buf[4];
  NSString *v15;

  v3 = self->_pdb;
  pdb = self->_pdb;
  self->_pdb = 0;

  if (v3)
  {
    v7 = MBGetDefaultLog(v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      path = self->_path;
      *(_DWORD *)buf = 138412290;
      v15 = path;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Database (%@) should be closed before dealloc", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), "Database (%@) should be closed before dealloc", self->_path);
    }

    v10 = objc_claimAutoreleasedReturnValue(-[PQLConnection serialQueue](v3, "serialQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100041E24;
    block[3] = &unk_1000D9890;
    v13 = v3;
    dispatch_async(v10, block);

  }
  v11.receiver = self;
  v11.super_class = (Class)MBManifestDB;
  -[MBManifestDB dealloc](&v11, "dealloc");
}

- (BOOL)openWithError:(id *)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v10;
  void *v11;
  PQLConnection *v12;
  PQLConnection *pdb;
  unsigned int v14;
  id v15;
  PQLConnection *v16;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];

  if (!self->_pdb)
  {
    v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("ManifestDB-%lu"), -[MBManifestDB hash](self, "hash"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByDeletingLastPathComponent](self->_path, "stringByDeletingLastPathComponent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v22[0] = NSFileOwnerAccountName;
    v22[1] = NSFileGroupOwnerAccountName;
    v23[0] = CFSTR("mobile");
    v23[1] = CFSTR("mobile");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 2));
    LODWORD(a3) = objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, v11, a3);

    if ((_DWORD)a3)
    {
      v12 = -[MBManifestDB _newConnection:](self, "_newConnection:", v5);
      pdb = self->_pdb;
      self->_pdb = v12;

      v19 = 0;
      v14 = -[MBManifestDB _setupCacheWithError:](self, "_setupCacheWithError:", &v19);
      v15 = v19;
      if (v14)
      {
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1000420A0;
        v18[3] = &unk_1000D9890;
        v18[4] = self;
        -[MBManifestDB _performOnDBQueue:](self, "_performOnDBQueue:", v18);

        goto LABEL_2;
      }
      v16 = self->_pdb;
      self->_pdb = 0;

    }
    v8 = 0;
    goto LABEL_10;
  }
LABEL_2:
  v4 = MBGetDefaultLog(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB path](self, "path"));
    *(_DWORD *)buf = 138412290;
    v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ManifestDB: opening %@", buf, 0xCu);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB path](self, "path"));
    _MBLog(CFSTR("DEFAULT"), "ManifestDB: opening %@", v7);
    v8 = 1;
LABEL_10:

    goto LABEL_11;
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (BOOL)closeWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  PQLConnection *pdb;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;
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
  uint8_t buf[4];
  void *v32;

  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_100042378;
  v25 = sub_100042388;
  v26 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB pql_database](self, "pql_database"));

  if (v5)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100042390;
    v20[3] = &unk_1000D98B8;
    v20[4] = self;
    v20[5] = &v27;
    v20[6] = &v21;
    -[MBManifestDB _performOnDBQueue:](self, "_performOnDBQueue:", v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB path](self, "path"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", CFSTR("-shm")));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v10, "removeItemAtPath:error:", v9, 0);

    pdb = self->_pdb;
    self->_pdb = 0;

  }
  v12 = MBGetDefaultLog(v6, v7);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB path](self, "path"));
      *(_DWORD *)buf = 138412290;
      v32 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "ManifestDB: closing %@", buf, 0xCu);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB path](self, "path"));
    _MBLog(CFSTR("DEFAULT"), "ManifestDB: closing %@", v16);

  }
  v17 = *((unsigned __int8 *)v28 + 24);
  if (a3 && !*((_BYTE *)v28 + 24))
  {
    *a3 = objc_retainAutorelease((id)v22[5]);
    v17 = *((unsigned __int8 *)v28 + 24);
  }
  v18 = v17 != 0;
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v18;
}

- (BOOL)closeAndRemoveFileWithError:(id *)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  unsigned int v8;
  MBEncryptedFileHandle *encryptedFileHandle;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v18;

  v5 = -[MBManifestDB closeWithError:](self, "closeWithError:");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB path](self, "path"));
    v8 = objc_msgSend(v6, "removeItemAtPath:error:", v7, a3);

    if (v8)
    {
      encryptedFileHandle = self->_encryptedFileHandle;
      self->_encryptedFileHandle = 0;

      v12 = MBGetDefaultLog(v10, v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB path](self, "path"));
        *(_DWORD *)buf = 138412290;
        v18 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ManifestDB: removing %@", buf, 0xCu);

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB path](self, "path"));
        _MBLog(CFSTR("DEFAULT"), "ManifestDB: removing %@", v15);

      }
      LOBYTE(v5) = 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)checkWithError:(id *)a3
{
  int v4;
  BOOL v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_100042378;
  v16 = sub_100042388;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000426B8;
  v7[3] = &unk_1000D98B8;
  v7[4] = self;
  v7[5] = &v12;
  v7[6] = &v8;
  -[MBManifestDB _performOnDBQueue:](self, "_performOnDBQueue:", v7);
  v4 = *((unsigned __int8 *)v9 + 24);
  if (a3 && !*((_BYTE *)v9 + 24))
  {
    *a3 = objc_retainAutorelease((id)v13[5]);
    v4 = *((unsigned __int8 *)v9 + 24);
  }
  v5 = v4 != 0;
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);

  return v5;
}

- (void)flush
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100042790;
  v2[3] = &unk_1000D9890;
  v2[4] = self;
  -[MBManifestDB _performOnDBQueue:](self, "_performOnDBQueue:", v2);
}

- (BOOL)uploadToPath:(id)a3 withDrive:(id)a4 keybag:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSString *path;
  MBManifestDBUploadHelper *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  NSString *v27;
  NSString *v28;
  unsigned __int8 v29;
  id v30;
  BOOL v31;
  uint64_t v32;
  NSObject *v33;
  id v35;
  uint8_t buf[4];
  NSString *v37;
  __int16 v38;
  id v39;
  const __CFString *v40;
  MBManifestDBUploadHelper *v41;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB properties](self, "properties"));
  v14 = objc_msgSend(v13, "encrypted");

  if (!v14)
  {
    v24 = &__NSDictionary0__struct;
    goto LABEL_7;
  }
  v17 = MBGetDefaultLog(v15, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    path = self->_path;
    *(_DWORD *)buf = 138412290;
    v37 = path;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Setting up the upload of an encrypted manifest database located at %@", buf, 0xCu);
    _MBLog(CFSTR("INFO"), "Setting up the upload of an encrypted manifest database located at %@", self->_path);
  }

  v20 = objc_alloc_init(MBManifestDBUploadHelper);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB getEncryptedFileHandleWithKeybag:error:](self, "getEncryptedFileHandleWithKeybag:error:", v12, a6));
  -[MBManifestDBUploadHelper setFileHandle:](v20, "setFileHandle:", v21);

  if (self->_encryptedFileHandle)
  {
    v40 = CFSTR("FileHandleFactory");
    v41 = v20;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));

LABEL_7:
    v25 = MBGetDefaultLog(v15, v16);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = self->_path;
      *(_DWORD *)buf = 138412546;
      v37 = v27;
      v38 = 2112;
      v39 = v10;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "ManifestDB: uploading manifest database from path %@ to path %@", buf, 0x16u);
      _MBLog(CFSTR("INFO"), "ManifestDB: uploading manifest database from path %@ to path %@", self->_path, v10);
    }

    v28 = self->_path;
    v35 = 0;
    v29 = objc_msgSend(v11, "uploadFileAtPath:toPath:options:error:", v28, v10, v24, &v35);
    v30 = v35;
    if ((v29 & 1) != 0)
    {
      v31 = 1;
    }
    else if (a6)
    {
      v30 = objc_retainAutorelease(v30);
      v31 = 0;
      *a6 = v30;
    }
    else
    {
      v31 = 0;
    }
    goto LABEL_17;
  }
  v32 = MBGetDefaultLog(v22, v23);
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Can't upload without a file handle to the db", buf, 2u);
    _MBLog(CFSTR("ERROR"), "Can't upload without a file handle to the db");
  }

  v30 = 0;
  v31 = 0;
  v24 = &__NSDictionary0__struct;
LABEL_17:

  return v31;
}

- (id)getEncryptedFileHandleWithKeybag:(id)a3 error:(id *)a4
{
  uint64_t v5;
  NSObject *v6;
  NSString *path;
  NSString **p_path;
  MBEncryptedFileHandle *v9;
  MBEncryptedFileHandle *encryptedFileHandle;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSString *v14;
  uint8_t buf[4];
  NSString *v17;

  if (self->_encryptedFileHandle)
  {
    v5 = MBGetDefaultLog(self, a2);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      path = self->_path;
      *(_DWORD *)buf = 138412290;
      v17 = path;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Using existing cached file handle for manifest DB at path %@", buf, 0xCu);
      _MBLog(CFSTR("INFO"), "Using existing cached file handle for manifest DB at path %@", self->_path);
    }
  }
  else
  {
    p_path = &self->_path;
    v9 = (MBEncryptedFileHandle *)objc_claimAutoreleasedReturnValue(+[MBEncryptedFileHandle encryptedFileHandleForBackupWithPath:keybag:error:](MBEncryptedFileHandle, "encryptedFileHandleForBackupWithPath:keybag:error:", self->_path, a3, a4));
    encryptedFileHandle = self->_encryptedFileHandle;
    self->_encryptedFileHandle = v9;

    v13 = MBGetDefaultLog(v11, v12);
    v6 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v14 = *p_path;
      *(_DWORD *)buf = 138412290;
      v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Acquiring and caching a new encrypted file handle for manifest DB at path %@", buf, 0xCu);
      _MBLog(CFSTR("INFO"), "Acquiring and caching a new encrypted file handle for manifest DB at path %@", *p_path);
    }
  }

  return self->_encryptedFileHandle;
}

- (id)_newConnection:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init((Class)PQLConnection);
  objc_msgSend(v4, "setSqliteErrorHandler:", &stru_1000D98F8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sqliteErrorHandler"));
  objc_msgSend(v4, "setAutoRollbackHandler:", v5);

  objc_msgSend(v4, "setLabel:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MBBehaviorOptions sharedOptions](MBBehaviorOptions, "sharedOptions"));
  objc_msgSend(v4, "setTraced:", objc_msgSend(v6, "sqlTrace"));

  objc_msgSend(v4, "setCrashIfUsedAfterClose:", 1);
  objc_msgSend(v4, "setStatementCacheMaxCount:", 30);
  return v4;
}

- (BOOL)_setupConnectionWithError:(id *)a3
{
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned __int8 v9;
  void *v11;
  PQLConnection *pdb;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB pql_database](self, "pql_database"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", self->_path));
  v7 = objc_msgSend(v5, "openAtURL:withFlags:error:", v6, 6, a3);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB pql_database](self, "pql_database"));
    v9 = objc_msgSend(v8, "setupPragmas");

    if ((v9 & 1) != 0)
      return 1;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB pql_database](self, "pql_database"));
    objc_msgSend(v11, "close:", a3);

  }
  pdb = self->_pdb;
  self->_pdb = 0;

  return 0;
}

- (BOOL)_setupCacheWithError:(id *)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  int v28;
  int *v29;
  unsigned int v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  unsigned __int8 v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  NSObject *v56;
  uint64_t v57;
  void *v58;
  _QWORD v60[6];
  int v61;
  int v62;
  int v63;
  uint8_t v64[4];
  int v65;
  __int16 v66;
  int v67;
  __int16 v68;
  uint64_t v69;
  _BYTE buf[24];
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;

  v5 = -[MBManifestDB _setupConnectionWithError:](self, "_setupConnectionWithError:");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB pql_database](self, "pql_database"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userVersion"));
    v8 = objc_msgSend(v7, "unsignedIntValue");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB pql_database](self, "pql_database"));
    v10 = v9;
    if (v8 < 2)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "url"));

      *(_DWORD *)v64 = 61;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB pql_database](self, "pql_database"));
      v13 = sqlite3_file_control((sqlite3 *)objc_msgSend(v12, "dbHandle"), 0, 101, v64);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB pql_database](self, "pql_database"));
      v15 = objc_msgSend(v14, "close:", a3);

      if ((v15 & 1) == 0)
      {
        v18 = MBGetDefaultLog(v16, v17);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = *a3;
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Can't close db: %@", buf, 0xCu);
          _MBLog(CFSTR("ERROR"), "Can't close db: %@", *a3);
        }

      }
      if ((_DWORD)v13)
      {
        v21 = MBGetDefaultLog(v16, v17);
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v11;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v13;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to truncate database at %@: %d", buf, 0x12u);
          _MBLog(CFSTR("ERROR"), "Failed to truncate database at %@: %d", v11, v13);
        }

        v23 = objc_retainAutorelease(v11);
        v24 = unlink((const char *)objc_msgSend(v23, "fileSystemRepresentation"));
        if ((v24 & 0x80000000) != 0)
        {
          v26 = MBGetDefaultLog(v24, v25);
          v27 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v28 = *__error();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v23;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v28;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to unlink %@: %{errno}d", buf, 0x12u);
            v29 = __error();
            _MBLog(CFSTR("ERROR"), "Failed to unlink %@: %{errno}d", v23, *v29);
          }

        }
      }
      v30 = -[MBManifestDB _setupConnectionWithError:](self, "_setupConnectionWithError:", a3);

      if (v30)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB pql_database](self, "pql_database"));
        objc_msgSend(v31, "execute:", CFSTR("PRAGMA cache_size = 250"));

        v34 = MBGetDefaultLog(v32, v33);
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)&buf[4] = (_DWORD)v8;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = 2;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Migrating manifest database from version %d to %d", buf, 0xEu);
          _MBLog(CFSTR("INFO"), "Migrating manifest database from version %d to %d", (_DWORD)v8, 2);
        }

        v38 = MBGetDefaultLog(v36, v37);
        v39 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)&buf[4] = (_DWORD)v8;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = 2;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Migrating database from version %d to %d", buf, 0xEu);
          _MBLog(CFSTR("INFO"), "Migrating database from version %d to %d", (_DWORD)v8, 2);
        }

        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v71 = sub_100042378;
        v72 = sub_100042388;
        v73 = 0;
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB pql_database](self, "pql_database"));
        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472;
        v60[2] = sub_1000436D0;
        v60[3] = &unk_1000D9950;
        v61 = 0;
        v62 = (int)v8;
        v63 = 2;
        v60[4] = self;
        v60[5] = buf;
        v41 = objc_msgSend(v40, "performWithFlags:action:", 10, v60);

        if ((v41 & 1) != 0)
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB pql_database](self, "pql_database"));
          objc_msgSend(v44, "setUserVersion:", 2);

          v45 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB pql_database](self, "pql_database"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "userVersion"));
          objc_msgSend(v46, "unsignedIntValue");

          _Block_object_dispose(buf, 8);
LABEL_22:
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB pql_database](self, "pql_database"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[MBBehaviorOptions sharedOptions](MBBehaviorOptions, "sharedOptions"));
          objc_msgSend(v48, "sqlBatchTime");
          v50 = v49;
          v51 = (void *)objc_claimAutoreleasedReturnValue(+[MBBehaviorOptions sharedOptions](MBBehaviorOptions, "sharedOptions"));
          objc_msgSend(v47, "useBatchingWithDelay:changeCount:", objc_msgSend(v51, "sqlBatchCount"), v50);

          v52 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB pql_database](self, "pql_database"));
          objc_msgSend(v52, "useSerialQueue");

          v53 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB pql_database](self, "pql_database"));
          v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "serialQueue"));
          dispatch_queue_set_specific(v54, self, self, 0);

          LOBYTE(v5) = 1;
          return v5;
        }
        v55 = MBGetDefaultLog(v42, v43);
        v56 = objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          v57 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          *(_DWORD *)v64 = 67109634;
          v65 = (int)v8;
          v66 = 1024;
          v67 = 2;
          v68 = 2112;
          v69 = v57;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Migration from version %d to %d failed, error:%@", v64, 0x18u);
          _MBLog(CFSTR("ERROR"), "Migration from version %d to %d failed, error:%@", v8, 2, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
        }

        v58 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB pql_database](self, "pql_database"));
        objc_msgSend(v58, "close:", 0);

        if (a3)
          *a3 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
        _Block_object_dispose(buf, 8);

      }
      LOBYTE(v5) = 0;
      return v5;
    }
    objc_msgSend(v9, "execute:", CFSTR("PRAGMA cache_size = 250"));

    goto LABEL_22;
  }
  return v5;
}

- (void)_performOnDBQueue:(id)a3
{
  MBManifestDB *v4;
  NSObject *v5;
  void *v6;
  void (**v7)(void);
  _QWORD block[4];
  void (**v9)(void);

  v7 = (void (**)(void))a3;
  if (dispatch_get_specific(self) == self)
  {
    v6 = objc_autoreleasePoolPush();
    v7[2]();
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    v4 = self;
    objc_sync_enter(v4);
    v5 = objc_claimAutoreleasedReturnValue(-[PQLConnection serialQueue](v4->_pdb, "serialQueue"));
    dispatch_assert_queue_not_V2(v5);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100043950;
    block[3] = &unk_1000D9978;
    v9 = v7;
    dispatch_sync(v5, block);

    objc_sync_exit(v4);
  }

}

- (void)performCallbackOnQueue:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (BOOL)_isNotFoundError:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  if (objc_msgSend(v3, "code") == (id)12)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    v5 = objc_msgSend(v4, "isEqualToString:", PQLSqliteErrorDomain);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_executeSQL:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[4];
  MBManifestDB *v7;
  id v8;
  uint64_t *v9;
  uint64_t **v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_100042378;
  v16 = sub_100042388;
  v17 = 0;
  v11 = &v18;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100043AFC;
  v6[3] = &unk_1000D96D8;
  v7 = self;
  v3 = a3;
  v9 = &v12;
  v10 = &v11;
  v8 = v3;
  -[MBManifestDB _performOnDBQueue:](v7, "_performOnDBQueue:", v6);
  v4 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v4;
}

- (id)_enumerateObjectsOfClass:(Class)a3 withCallback:(id)a4 format:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t **v17;
  Class v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v8 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_100042378;
  v24 = sub_100042388;
  v25 = 0;
  v19 = &v26;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100043CC8;
  v13[3] = &unk_1000D99C8;
  v13[4] = self;
  v9 = a5;
  v14 = v9;
  v17 = &v19;
  v18 = a3;
  v10 = v8;
  v15 = v10;
  v16 = &v20;
  -[MBManifestDB _performOnDBQueue:](self, "_performOnDBQueue:", v13);
  v11 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v11;
}

- (id)_fetchObjectOfClass:(Class)a3 withError:(id *)a4 format:(id)a5
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  MBManifestDB *v11;
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  Class v15;
  uint64_t **v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_100042378;
  v28 = sub_100042388;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_100042378;
  v22 = sub_100042388;
  v23 = 0;
  v17 = &v30;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000440C8;
  v10[3] = &unk_1000D99F0;
  v13 = &v18;
  v11 = self;
  v15 = a3;
  v6 = a5;
  v16 = &v17;
  v12 = v6;
  v14 = &v24;
  -[MBManifestDB _performOnDBQueue:](v11, "_performOnDBQueue:", v10);
  v7 = (void *)v19[5];
  if (a4 && !v7)
  {
    *a4 = objc_retainAutorelease((id)v25[5]);
    v7 = (void *)v19[5];
  }
  v8 = v7;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v8;
}

- (void)_checkEncryption
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  const __CFString *v8;
  uint64_t v9;

  if (-[MBManifestDB encrypted](self, "encrypted"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB passwordData](self, "passwordData"));

    if (!v3)
    {
      v7 = objc_alloc((Class)MBException);
      v8 = CFSTR("Manifest is encrypted but no password set");
      v9 = 207;
LABEL_8:
      objc_exception_throw(objc_msgSend(v7, "initWithCode:format:", v9, v8));
    }
  }
  v4 = objc_claimAutoreleasedReturnValue(-[MBManifestDB passwordData](self, "passwordData"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB passwordHash](self, "passwordHash"));

    if (!v6)
    {
      v7 = objc_alloc((Class)MBException);
      v8 = CFSTR("Password is set but no password hash available");
      v9 = 1;
      goto LABEL_8;
    }
  }
}

- (BOOL)_checkPassword:(id)a3 withPasswordHash:(id)a4 andSalt:(id)a5
{
  unint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  BOOL v15;
  uint64_t v16;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;

  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  v10 = a5;
  v12 = v10;
  if (v8 | v9)
  {
    if (!v8 || v9)
    {
      if (v8 || !v9)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v8, "dataUsingEncoding:", 4));
        v14 = objc_claimAutoreleasedReturnValue(-[MBManifestDB _passwordHashWithPassword:salt:](self, "_passwordHashWithPassword:salt:", v18, v12));

        v19 = objc_msgSend((id)v9, "isEqualToData:", v14);
        v15 = (char)v19;
        if ((v19 & 1) == 0)
        {
          v21 = MBGetDefaultLog(v19, v20);
          v22 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v9, "base64EncodedStringWithOptions:", 0));
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject base64EncodedStringWithOptions:](v14, "base64EncodedStringWithOptions:", 0));
            *(_DWORD *)buf = 138412546;
            v28 = v23;
            v29 = 2112;
            v30 = v24;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Password does not match password hash (%@ != %@)", buf, 0x16u);

            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v9, "base64EncodedStringWithOptions:", 0));
            v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject base64EncodedStringWithOptions:](v14, "base64EncodedStringWithOptions:", 0));
            _MBLog(CFSTR("INFO"), "Password does not match password hash (%@ != %@)", v25, v26);

          }
        }
        goto LABEL_12;
      }
      v16 = MBGetDefaultLog(v10, v11);
      v14 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Password not set but there is a password hash", buf, 2u);
        _MBLog(CFSTR("INFO"), "Password not set but there is a password hash");
      }
    }
    else
    {
      v13 = MBGetDefaultLog(v10, v11);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Password set but no available password hash", buf, 2u);
        _MBLog(CFSTR("INFO"), "Password set but no available password hash");
      }
    }
    v15 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v15 = 1;
LABEL_13:

  return v15;
}

- (id)_passwordHashWithPassword:(id)a3 salt:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v6, "appendData:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MBDigest sha256](MBDigest, "sha256"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "digestForData:", v6));

  return v8;
}

- (BOOL)setupEncryptionWithPassword:(id)a3 withError:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  const __CFString *v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  id v44;
  id v45;
  uint8_t buf[4];
  id v47;

  v6 = a3;
  v8 = MBGetDefaultLog(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Setting up encryption for manifest database", buf, 2u);
    _MBLog(CFSTR("INFO"), "Setting up encryption for manifest database");
  }

  v10 = objc_claimAutoreleasedReturnValue(-[MBManifestDB passwordData](self, "passwordData"));
  if (!v10)
  {
LABEL_8:
    v45 = 0;
    v16 = -[MBManifestDB fetchPropertyWithName:class:error:](self, "fetchPropertyWithName:class:error:", CFSTR("passwordHash"), objc_opt_class(NSData), &v45);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = v45;
    if (v18)
    {
      v20 = v18;
      v21 = MBGetDefaultLog(v18, v19);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v20;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to fetch password hash from database: %@", buf, 0xCu);
        _MBLog(CFSTR("ERROR"), "Failed to fetch password hash from database: %@", v20);
      }

      if (a4)
      {
        v20 = objc_retainAutorelease(v20);
        v15 = 0;
        *a4 = v20;
      }
      else
      {
        v15 = 0;
      }
      goto LABEL_44;
    }
    v44 = 0;
    v23 = -[MBManifestDB fetchPropertyWithName:class:error:](self, "fetchPropertyWithName:class:error:", CFSTR("salt"), objc_opt_class(NSData), &v44);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = v44;
    v20 = v25;
    if (v25)
    {
      v27 = MBGetDefaultLog(v25, v26);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v20;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to fetch salt from database: %@", buf, 0xCu);
        _MBLog(CFSTR("ERROR"), "Failed to fetch salt from database: %@", v20);
      }

      if (a4)
      {
        v29 = objc_retainAutorelease(v20);
LABEL_41:
        v15 = 0;
        *a4 = v29;
LABEL_43:

LABEL_44:
        goto LABEL_45;
      }
LABEL_42:
      v15 = 0;
      goto LABEL_43;
    }
    if (!v17 || v24)
    {
      if (!v17
        || !v24
        || (v34 = -[MBManifestDB _checkPassword:withPasswordHash:andSalt:](self, "_checkPassword:withPasswordHash:andSalt:", v6, v17, v24)))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataUsingEncoding:", 4));
        v15 = v37 != 0;
        if (v37)
        {
          -[MBManifestDB setSalt:](self, "setSalt:", v24);
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB salt](self, "salt"));

          if (v38)
            -[MBManifestDB setPasswordData:](self, "setPasswordData:", v37);
        }
        else
        {
          v39 = MBGetDefaultLog(0, v36);
          v40 = objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Failed to encode password", buf, 2u);
            _MBLog(CFSTR("ERROR"), "Failed to encode password");
          }

          if (a4)
            *a4 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 207, CFSTR("Failed to encode password")));
        }

        goto LABEL_43;
      }
      v41 = MBGetDefaultLog(v34, v35);
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Password does not match existing manifest password hash", buf, 2u);
        _MBLog(CFSTR("ERROR"), "Password does not match existing manifest password hash");
      }

      if (!a4)
        goto LABEL_42;
      v32 = CFSTR("Password does not match existing manifest password hash");
      v33 = 207;
    }
    else
    {
      v30 = MBGetDefaultLog(0, v26);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Inconsistent encryption settings in database: password hash without salt", buf, 2u);
        _MBLog(CFSTR("ERROR"), "Inconsistent encryption settings in database: password hash without salt");
      }

      if (!a4)
        goto LABEL_42;
      v32 = CFSTR("Inconsistent encryption settings in manifest database");
      v33 = 205;
    }
    v29 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", v33, v32));
    goto LABEL_41;
  }
  v11 = (void *)v10;
  v12 = objc_claimAutoreleasedReturnValue(-[MBManifestDB passwordHash](self, "passwordHash"));
  if (!v12)
  {

    goto LABEL_8;
  }
  v13 = (void *)v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB salt](self, "salt"));

  if (!v14)
    goto LABEL_8;
  v15 = 1;
LABEL_45:

  return v15;
}

- (BOOL)setPasswordHashForPassword:(id)a3 salt:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint8_t buf[4];
  void *v22;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB _passwordHashWithPassword:salt:](self, "_passwordHashWithPassword:salt:", v8, v9));
    if (v11)
    {
      v12 = objc_claimAutoreleasedReturnValue(-[MBManifestDB setPropertyWithName:value:](self, "setPropertyWithName:value:", CFSTR("passwordHash"), v11));
      v14 = (void *)v12;
      v15 = v12 == 0;
      if (v12)
      {
        v16 = MBGetDefaultLog(v12, v13);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v22 = v14;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to store password hash in database: %@", buf, 0xCu);
          _MBLog(CFSTR("ERROR"), "Failed to store password hash in database: %@", v14);
        }

        if (a5)
          *a5 = objc_retainAutorelease(v14);
      }
      else
      {
        -[MBManifestDB setPasswordHash:](self, "setPasswordHash:", v11);
      }

    }
    else
    {
      v18 = MBGetDefaultLog(0, v10);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to generate password hash", buf, 2u);
        _MBLog(CFSTR("ERROR"), "Failed to generate password hash");
      }

      v15 = 0;
      if (a5)
        *a5 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Failed to generate password hash")));
    }

  }
  else
  {
    v15 = 0;
    if (a5)
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 207, CFSTR("Cannot set password hash without a password")));
  }

  return v15;
}

- (BOOL)encrypted
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB passwordData](self, "passwordData"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB salt](self, "salt"));
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)addFile:(id)a3 flags:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = +[MBDatabaseIndex flagsForMode:](MBDatabaseIndex, "flagsForMode:", objc_msgSend(v6, "mode")) | a4;
  v8 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fileID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "string"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relativePath"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB _executeSQL:](self, "_executeSQL:", CFSTR("INSERT OR REPLACE INTO Files (fileID, domain, relativePath, flags, file) VALUES (%@, %@, %@, %lu, %@)"), v10, v12, v13, v7, v8));

  return v14;
}

- (id)addPlaceholderForFile:(id)a3 flags:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "fileID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "string"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB _executeSQL:](self, "_executeSQL:", CFSTR("INSERT OR IGNORE INTO Files (fileID, flags) VALUES (%@, %lu)"), v7, a4));

  return v8;
}

- (id)removeFileWithID:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "string"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB _executeSQL:](self, "_executeSQL:", CFSTR("DELETE FROM Files WHERE fileID = %@"), v4));

  return v5;
}

- (id)setFlags:(unint64_t)a3 mask:(unint64_t)a4 forFileID:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "string"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB _executeSQL:](self, "_executeSQL:", CFSTR("INSERT OR IGNORE INTO Files (fileID, flags) VALUES (%@, %lu)"), v9, a3));

  if (v10)
  {
    v11 = v10;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "string"));
    v11 = (id)objc_claimAutoreleasedReturnValue(-[MBManifestDB _executeSQL:](self, "_executeSQL:", CFSTR("UPDATE Files SET flags = ((flags & %lu) | %lu) WHERE fileID = %@"), a4, a3, v12));

  }
  return v11;
}

- (id)setFlags:(unint64_t)a3 forFileID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "string"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB _executeSQL:](self, "_executeSQL:", CFSTR("INSERT OR IGNORE INTO Files (fileID, flags) VALUES (%@, %lu)"), v7, a3));

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "string"));
    v9 = (id)objc_claimAutoreleasedReturnValue(-[MBManifestDB _executeSQL:](self, "_executeSQL:", CFSTR("UPDATE Files SET flags = (flags | %lu) WHERE fileID = %@"), a3, v10));

  }
  return v9;
}

- (unint64_t)flagsForFileID:(id)a3 error:(id *)a4
{
  id v4;
  unint64_t v5;
  _QWORD v7[4];
  MBManifestDB *v8;
  id v9;
  uint64_t *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;

  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_100042378;
  v16[4] = sub_100042388;
  v17 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004509C;
  v7[3] = &unk_1000D9A18;
  v8 = self;
  v4 = a3;
  v9 = v4;
  v10 = &v12;
  v11 = v16;
  -[MBManifestDB _performOnDBQueue:](v8, "_performOnDBQueue:", v7);
  v5 = v13[3];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(v16, 8);

  return v5;
}

- (BOOL)containsFileID:(id)a3 error:(id *)a4
{
  id v5;
  char v6;
  _QWORD v8[4];
  MBManifestDB *v9;
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_100042378;
  v21 = sub_100042388;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000452CC;
  v8[3] = &unk_1000D9A18;
  v9 = self;
  v5 = a3;
  v10 = v5;
  v11 = &v13;
  v12 = &v17;
  -[MBManifestDB _performOnDBQueue:](v9, "_performOnDBQueue:", v8);
  if (a4)
    *a4 = objc_retainAutorelease((id)v18[5]);
  v6 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v6;
}

- (BOOL)containsPlaceholderForFileID:(id)a3 error:(id *)a4
{
  id v5;
  char v6;
  _QWORD v8[4];
  MBManifestDB *v9;
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_100042378;
  v21 = sub_100042388;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100045500;
  v8[3] = &unk_1000D9A18;
  v9 = self;
  v5 = a3;
  v10 = v5;
  v11 = &v13;
  v12 = &v17;
  -[MBManifestDB _performOnDBQueue:](v9, "_performOnDBQueue:", v8);
  if (a4)
    *a4 = objc_retainAutorelease((id)v18[5]);
  v6 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v6;
}

- (BOOL)containsRegularFileForFileID:(id)a3 error:(id *)a4
{
  id v5;
  char v6;
  _QWORD v8[4];
  MBManifestDB *v9;
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_100042378;
  v21 = sub_100042388;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100045734;
  v8[3] = &unk_1000D9A18;
  v9 = self;
  v5 = a3;
  v10 = v5;
  v11 = &v13;
  v12 = &v17;
  -[MBManifestDB _performOnDBQueue:](v9, "_performOnDBQueue:", v8);
  if (a4)
    *a4 = objc_retainAutorelease((id)v18[5]);
  v6 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v6;
}

- (id)fetchFileWithID:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  _QWORD v7[4];
  MBManifestDB *v8;
  id v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[5];
  id v19;

  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_100042378;
  v18[4] = sub_100042388;
  v19 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_100042378;
  v16 = sub_100042388;
  v17 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100045958;
  v7[3] = &unk_1000D9A18;
  v8 = self;
  v4 = a3;
  v9 = v4;
  v10 = v18;
  v11 = &v12;
  -[MBManifestDB _performOnDBQueue:](v8, "_performOnDBQueue:", v7);
  v5 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(v18, 8);

  return v5;
}

- (BOOL)hasUnverifiedFilesWithError:(id *)a3
{
  char v5;
  _QWORD v7[5];
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_100042378;
  v17 = sub_100042388;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100045E4C;
  v8[3] = &unk_1000D98B8;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = &v13;
  -[MBManifestDB _performOnDBQueue:](self, "_performOnDBQueue:", v8);
  if (*((_BYTE *)v10 + 24))
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100045F3C;
    v7[3] = &unk_1000D9890;
    v7[4] = self;
    -[MBManifestDB _performOnDBQueue:](self, "_performOnDBQueue:", v7);
  }
  if (a3)
    *a3 = objc_retainAutorelease((id)v14[5]);
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);

  return v5;
}

- (id)unsetVerifiedFlags
{
  uint64_t v3;
  NSObject *v4;
  uint8_t buf[16];

  v3 = MBGetDefaultLog(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Unsetting all verified file flags", buf, 2u);
    _MBLog(CFSTR("INFO"), "Unsetting all verified file flags");
  }

  return objc_autoreleaseReturnValue((id)objc_claimAutoreleasedReturnValue(-[MBManifestDB _executeSQL:](self, "_executeSQL:", CFSTR("UPDATE Files SET flags = (flags & ~%lu) WHERE flags & %lu != 0;"),
                                             32,
                                             32)));
}

- (id)removeEphemeralRetriedFiles
{
  return -[MBManifestDB _executeSQL:](self, "_executeSQL:", CFSTR("DELETE FROM Files WHERE (flags & %lu) = %lu"), 64, 64);
}

- (id)removeFilesNotAlreadyUploaded
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint8_t buf[16];

  v3 = MBGetDefaultLog(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Removing files not already uploaded from manifest", buf, 2u);
    _MBLog(CFSTR("INFO"), "Removing files not already uploaded from manifest");
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB _executeSQL:](self, "_executeSQL:", CFSTR("DELETE FROM Files WHERE (flags & %lu) = 0 AND (flags & %lu) = 0"), 8, 128));
  if (!v5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB _executeSQL:](self, "_executeSQL:", CFSTR("DELETE FROM Files WHERE (flags & %lu) = %lu"), 16, 16));
    if (!v5)
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB _executeSQL:](self, "_executeSQL:", CFSTR("DELETE FROM Files WHERE file IS NULL")));
  }
  v6 = v5;

  return v6;
}

- (id)unsetAlreadyUploadedFlags
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t buf[16];

  v3 = MBGetDefaultLog(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Unsetting all already uploaded file flags", buf, 2u);
    _MBLog(CFSTR("INFO"), "Unsetting all already uploaded file flags");
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB _executeSQL:](self, "_executeSQL:", CFSTR("UPDATE Files SET flags = (flags & ~%lu) WHERE flags & %lu != 0;"),
                   8,
                   8));
  if (!v5)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB _executeSQL:](self, "_executeSQL:", CFSTR("UPDATE Files SET flags = (flags & ~%lu) WHERE flags & %lu != 0;"),
                     128,
                     128));
  return v5;
}

- (id)enumerateFiles:(id)a3
{
  return -[MBManifestDB enumerateFiles:includeUninstalled:](self, "enumerateFiles:includeUninstalled:", a3, 0);
}

- (id)enumerateFiles:(id)a3 includeUninstalled:(BOOL)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id *v9;
  unsigned __int8 v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  _QWORD block[4];
  id v20;
  MBManifestDB *v21;
  id v22;
  uint64_t *v23;
  id obj;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v5 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_100042378;
  v29 = sub_100042388;
  v30 = 0;
  -[MBManifestDB flush](self, "flush");
  v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("ManifestDB-%lu-enumerator"), -[MBManifestDB hash](self, "hash"));
  v7 = -[MBManifestDB _newConnection:](self, "_newConnection:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", self->_path));
  v9 = (id *)(v26 + 5);
  obj = (id)v26[5];
  v10 = objc_msgSend(v7, "openAtURL:withFlags:error:", v8, 1, &obj);
  objc_storeStrong(v9, obj);

  if ((v10 & 1) != 0)
  {
    objc_msgSend(v7, "useSerialQueue");
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serialQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100046600;
    block[3] = &unk_1000D9A40;
    v12 = v7;
    v20 = v12;
    v21 = self;
    v23 = &v25;
    v22 = v5;
    dispatch_sync(v11, block);

    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "serialQueue"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100046B50;
    v16[3] = &unk_1000D9A68;
    v17 = v12;
    v18 = &v25;
    dispatch_sync(v13, v16);

    v14 = (id)v26[5];
  }
  else
  {
    v14 = (id)v26[5];
  }

  _Block_object_dispose(&v25, 8);
  return v14;
}

- (id)setPropertyWithName:(id)a3 value:(id)a4
{
  return -[MBManifestDB _executeSQL:](self, "_executeSQL:", CFSTR("INSERT OR REPLACE INTO Properties (key, value) VALUES (%@, %@);"),
           a3,
           a4);
}

- (id)fetchPropertyWithName:(id)a3 class:(Class)a4 error:(id *)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD block[5];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  Class v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v8 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_100042378;
  v30 = sub_100042388;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_100042378;
  v24 = sub_100042388;
  v25 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBManifestDB pql_database](self, "pql_database"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100046E08;
  block[3] = &unk_1000D9A90;
  block[4] = self;
  v11 = v8;
  v16 = v11;
  v17 = &v20;
  v18 = &v26;
  v19 = a4;
  dispatch_sync(v10, block);

  v12 = (void *)v21[5];
  if (a5 && !v12)
  {
    *a5 = objc_retainAutorelease((id)v27[5]);
    v12 = (void *)v21[5];
  }
  v13 = v12;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (PQLConnection)pql_database
{
  return self->_pdb;
}

- (NSString)path
{
  return self->_path;
}

- (MBDomainManager)domainManager
{
  return self->_domainManager;
}

- (MBProperties)properties
{
  return self->_properties;
}

- (BOOL)domainRedirects
{
  return self->_domainRedirects;
}

- (void)setDomainRedirects:(BOOL)a3
{
  self->_domainRedirects = a3;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (NSData)passwordHash
{
  return self->_passwordHash;
}

- (void)setPasswordHash:(id)a3
{
  objc_storeStrong((id *)&self->_passwordHash, a3);
}

- (NSData)passwordData
{
  return self->_passwordData;
}

- (void)setPasswordData:(id)a3
{
  objc_storeStrong((id *)&self->_passwordData, a3);
}

- (NSData)salt
{
  return self->_salt;
}

- (void)setSalt:(id)a3
{
  objc_storeStrong((id *)&self->_salt, a3);
}

- (MBEncryptedFileHandle)encryptedFileHandle
{
  return self->_encryptedFileHandle;
}

- (void)setEncryptedFileHandle:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedFileHandle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedFileHandle, 0);
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_passwordData, 0);
  objc_storeStrong((id *)&self->_passwordHash, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_domainManager, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_pdb, 0);
}

@end
