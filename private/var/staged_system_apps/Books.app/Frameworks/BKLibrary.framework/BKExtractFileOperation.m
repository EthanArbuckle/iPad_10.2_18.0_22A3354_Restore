@implementation BKExtractFileOperation

- (void)main
{
  uint64_t v3;
  NSObject *v4;
  unsigned int v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  id *v10;
  id *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 success;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  unsigned int v23;
  void *v24;
  id WeakRetained;
  char **v26;
  id v27;
  _QWORD v28[5];
  _QWORD *v29;
  uint64_t v30;
  _QWORD v31[5];
  _QWORD *v32;
  uint64_t v33;
  _QWORD v34[5];
  uint8_t buf[4];
  unsigned int v36;
  __int16 v37;
  void *v38;

  v3 = BCIMLog(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = -[BKExtractFileOperation sourceFileType](self, "sourceFileType");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKExtractFileOperation sourceFilePath](self, "sourceFilePath"));
    *(_DWORD *)buf = 67109378;
    v36 = v5;
    v37 = 2112;
    v38 = v6;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "BKExtractFileOperation main: Starting operation: (type: %d, path: %@)", buf, 0x12u);

  }
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_2E10;
  v34[3] = &unk_C1268;
  v34[4] = self;
  v7 = objc_retainBlock(v34);
  if (-[BKExtractFileOperation useFileCoordination](self, "useFileCoordination"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKExtractFileOperation sourceFilePath](self, "sourceFilePath"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v8));

    if (-[BKExtractFileOperation sourceFileType](self, "sourceFileType") == 2)
    {
      v33 = 0;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_2FC0;
      v31[3] = &unk_C1290;
      v10 = (id *)&v32;
      v31[4] = self;
      v32 = v7;
      v11 = (id *)&v33;
      +[NSURL coordinateWritingItemAtURL:options:error:byAccessor:](NSURL, "coordinateWritingItemAtURL:options:error:byAccessor:", v9, 2, &v33, v31);
    }
    else
    {
      v30 = 0;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_3024;
      v28[3] = &unk_C1290;
      v10 = (id *)&v29;
      v28[4] = self;
      v29 = v7;
      v11 = (id *)&v30;
      +[NSURL coordinateReadingItemAtURL:options:error:byAccessor:](NSURL, "coordinateReadingItemAtURL:options:error:byAccessor:", v9, 0, &v30, v28);
    }
    v12 = *v11;

    if (v12)
    {
      v15 = BCIMLog(v13, v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_7FB78(self);

    }
  }
  else
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[BKExtractFileOperation sourceFilePath](self, "sourceFilePath"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKExtractFileOperation destinationFilePath](self, "destinationFilePath"));
    ((void (*)(_QWORD *, id, void *))v7[2])(v7, v12, v9);
  }

  success = self->_success;
  v20 = BCIMLog(v18, v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  v22 = v21;
  if (success)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v23 = -[BKExtractFileOperation sourceFileType](self, "sourceFileType");
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKExtractFileOperation sourceFilePath](self, "sourceFilePath"));
      *(_DWORD *)buf = 67109378;
      v36 = v23;
      v37 = 2112;
      v38 = v24;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "BKExtractFileOperation main: Success: (type: %d, path: %@)", buf, 0x12u);

    }
    if (-[BKExtractFileOperation _reportingProgress](self, "_reportingProgress"))
    {
      self->_progressBytes = self->_totalBytes;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "performSelectorOnMainThread:withObject:waitUntilDone:", "extractOperationDidUpdateProgress:", self, 1);

    }
    v26 = &selRef_extractOperationDidFinish_;
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_7FAC8(self);

    v26 = &selRef_extractOperationDidFail_;
  }
  v27 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v27, "performSelectorOnMainThread:withObject:waitUntilDone:", *v26, self, 1);

}

- (void)setSourceFilePath:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_sourceFilePath != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_sourceFilePath, a3);
    -[BKExtractFileOperation _initializeProgress](self, "_initializeProgress");
    v5 = v6;
  }

}

- (void)_initializeProgress
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  unint64_t v13;

  v13 = 0;
  v3 = 0;
  if (-[BKExtractFileOperation sourceFileType](self, "sourceFileType") != 1)
  {
LABEL_9:
    self->_totalBytes = 0;
    goto LABEL_10;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKExtractFileOperation sourceFilePath](self, "sourceFilePath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v4));

  v12 = 0;
  v6 = objc_msgSend(objc_alloc((Class)BUUnarchivingFileCopier), "initWithURL:options:error:", v5, 5, &v12);
  v7 = v12;
  v3 = v7;
  if (!v6)
  {
    v10 = BKLibraryLog(v7);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_7FC28();

    goto LABEL_9;
  }

  v8 = BKLibraryLog(objc_msgSend(v6, "countTotalFileSize:totalFileCount:", &v13, 0));
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_7FC88((uint64_t *)&v13, v9);

  self->_totalBytes = v13;
  self->_progressBytes = 0;
  self->_lastSnapshotTime = -1.79769313e308;

LABEL_10:
}

- (BOOL)_reportingProgress
{
  return self->_totalBytes != 0;
}

- (double)progress
{
  unint64_t totalBytes;
  double result;

  totalBytes = self->_totalBytes;
  if (totalBytes)
    result = (double)self->_progressBytes / (double)totalBytes;
  else
    result = 0.0;
  if (result > 1.0)
    return 1.0;
  return result;
}

- (void)_updateProgressWithByteCount:(int64_t)a3
{
  unint64_t progressBytes;
  unint64_t totalBytes;
  CFAbsoluteTime Current;
  id WeakRetained;

  progressBytes = self->_progressBytes;
  totalBytes = progressBytes + a3;
  if (progressBytes + a3 >= self->_totalBytes)
    totalBytes = self->_totalBytes;
  if (totalBytes != progressBytes)
    self->_progressBytes = totalBytes;
  Current = CFAbsoluteTimeGetCurrent();
  if (self->_lastSnapshotTime + 0.2 < Current)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "performSelectorOnMainThread:withObject:waitUntilDone:", "extractOperationDidUpdateProgress:", self, 1);

    self->_lastSnapshotTime = Current;
  }
}

- (BOOL)_forceFileProtectionOnItemAtPath:(id)a3 usingFileManager:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  NSFileAttributeKey v14;
  NSFileProtectionType v15;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKExtractFileOperation forcedFileProtection](self, "forcedFileProtection"));

  if (v10)
  {
    v14 = NSFileProtectionKey;
    v15 = NSFileProtectionCompleteUntilFirstUserAuthentication;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    v12 = objc_msgSend(v9, "setAttributes:ofItemAtPath:error:", v11, v8, a5);

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (void)_performCopyFromPath:(id)a3 toPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  unsigned int v9;
  id v10;
  uint64_t v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)NSFileManager);
  v28 = 0;
  v9 = objc_msgSend(v8, "copyItemAtPath:toPath:error:", v7, v6, &v28);

  v10 = v28;
  v12 = v10;
  if (!v9)
  {
    v18 = BCIMLog(v10, v11);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_7FD5C((uint64_t)v12, v19, v20, v21, v22, v23, v24, v25);
    v14 = v12;
    goto LABEL_9;
  }
  v27 = v10;
  v13 = -[BKExtractFileOperation _forceFileProtectionOnItemAtPath:usingFileManager:error:](self, "_forceFileProtectionOnItemAtPath:usingFileManager:error:", v6, v8, &v27);
  v14 = v27;

  if ((v13 & 1) == 0)
  {
    v26 = BCIMLog(v15, v16);
    v19 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_7FCFC();
LABEL_9:

    v17 = 0;
    goto LABEL_10;
  }
  v17 = 1;
LABEL_10:
  self->_success = v17;

}

- (void)_performMoveFromPath:(id)a3 toPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  unsigned int v9;
  id v10;
  uint64_t v11;
  id v12;
  unsigned int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)NSFileManager);
  v33 = 0;
  v9 = objc_msgSend(v8, "moveItemAtPath:toPath:error:", v7, v6, &v33);

  v10 = v33;
  v12 = v10;
  if (!v9)
  {
    v21 = BCIMLog(v10, v11);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_7FE80((uint64_t)v12, v22, v23, v24, v25, v26, v27, v28);
    goto LABEL_12;
  }
  v32 = v10;
  v13 = -[BKExtractFileOperation _forceFileProtectionOnItemAtPath:usingFileManager:error:](self, "_forceFileProtectionOnItemAtPath:usingFileManager:error:", v6, v8, &v32);
  v14 = v32;

  if (!v13)
  {
    v29 = BCIMLog(v15, v16);
    v22 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_7FE20();
    v12 = v14;
    goto LABEL_12;
  }
  v31 = v14;
  v17 = -[BKExtractFileOperation _ensureBackupAttributeOnItemAtPath:error:](self, "_ensureBackupAttributeOnItemAtPath:error:", v6, &v31);
  v12 = v31;

  if ((v17 & 1) == 0)
  {
    v30 = BCIMLog(v18, v19);
    v22 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_7FDC0();
LABEL_12:

    v20 = 0;
    goto LABEL_13;
  }
  v20 = 1;
LABEL_13:
  self->_success = v20;

}

- (BOOL)_ensureBackupAttributeOnItemAtPath:(id)a3 error:(id *)a4
{
  void *v5;
  unsigned int v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  id v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", a3));
  v11 = 0;
  v6 = objc_msgSend(v5, "getResourceValue:forKey:error:", &v11, NSURLIsExcludedFromBackupKey, a4);
  v7 = v11;
  v8 = v7;
  if (v6)
  {
    if (v7 && !objc_msgSend(v7, "BOOLValue"))
      v9 = 1;
    else
      v9 = objc_msgSend(v5, "setResourceValue:forKey:error:", &__kCFBooleanFalse, NSURLIsExcludedFromBackupKey, a4);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_fixFilePermissions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  _QWORD v35[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  sub_3A34((uint64_t)v4, v3);
  v35[0] = NSURLIsDirectoryKey;
  v35[1] = NSURLIsSymbolicLinkKey;
  v20 = v4;
  v21 = v3;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v3));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v9);
        v22 = 0;
        v23 = 0;
        v11 = objc_msgSend(v10, "getResourceValue:forKey:error:", &v23, NSURLIsSymbolicLinkKey, &v22);
        v12 = v23;
        v13 = v22;
        v15 = v13;
        if (v11)
        {
          if (v12)
          {
            v16 = (uint64_t)objc_msgSend(v12, "BOOLValue");
            if ((v16 & 1) == 0)
              sub_3A34(v16, v10);
          }
        }
        else
        {
          v17 = BCIMLog(v13, v14);
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 141558530;
            v29 = 1752392040;
            v30 = 2112;
            v31 = v10;
            v32 = 2112;
            v33 = v15;
            _os_log_error_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "BKExtractFileOperation _fixFilePermissions: getResourceValue failed. key: NSURLIsSymbolicLinkKey url: %{mask.hash}@ error: %@", buf, 0x20u);
          }

        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v7);
  }

}

- (void)_performZipExtractionFromPath:(id)a3 toPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  unsigned __int8 v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  unsigned __int8 v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  unsigned __int8 v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  id v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  id v44;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length") && objc_msgSend(v7, "length"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKExtractFileOperation _zipExtractionPathFromSourcePath:](self, "_zipExtractionPathFromSourcePath:", v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v6));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v8));
    v11 = BKLibraryLog(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 141558786;
      v38 = 1752392040;
      v39 = 2112;
      v40 = v6;
      v41 = 2160;
      v42 = 1752392040;
      v43 = 2112;
      v44 = v8;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Extracting %{mask.hash}@ to immediate path %{mask.hash}@", buf, 0x2Au);
    }

    self->_skipCleanupDestinationFile = 1;
    v36 = 0;
    v13 = objc_msgSend(objc_alloc((Class)BUUnarchivingFileCopier), "initWithURL:options:error:", v9, 5, &v36);
    v14 = v36;
    v15 = objc_msgSend(v13, "setDelegate:", self);
    self->_skipCleanupDestinationFile = 0;
    if (v14)
    {
      v16 = BKLibraryLog(v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_8011C();

    }
    else
    {
      v35 = 0;
      v18 = objc_msgSend(v13, "copyToURL:error:", v10, &v35);
      v14 = v35;
      self->_success = v18;
    }

    v19 = objc_alloc_init((Class)NSFileManager);
    v20 = v19;
    if (self->_success)
    {
      v21 = BKLibraryLog(v19);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 141558786;
        v38 = 1752392040;
        v39 = 2112;
        v40 = v8;
        v41 = 2160;
        v42 = 1752392040;
        v43 = 2112;
        v44 = v7;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "Moving from immediate path %{mask.hash}@ to destination %{mask.hash}@", buf, 0x2Au);
      }

      v34 = 0;
      v23 = objc_msgSend(v20, "moveItemAtPath:toPath:error:", v8, v7, &v34);
      v24 = v34;
      v26 = v24;
      self->_success = v23;
      if ((v23 & 1) != 0)
        goto LABEL_23;
      v27 = BCIMLog(v24, v25);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        sub_8005C();
    }
    else
    {
      if (!objc_msgSend(v19, "fileExistsAtPath:", v8))
      {
        v26 = 0;
        goto LABEL_23;
      }
      v33 = 0;
      v29 = objc_msgSend(v20, "removeItemAtPath:error:", v8, &v33);
      v30 = v33;
      v26 = v30;
      if ((v29 & 1) != 0)
      {
LABEL_23:

        goto LABEL_24;
      }
      v32 = BCIMLog(v30, v31);
      v28 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        sub_7FFFC();
    }

    goto LABEL_23;
  }
  self->_success = 0;
LABEL_24:

}

- (id)_zipExtractionPathFromSourcePath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication applicationCacheDirectory](UIApplication, "applicationCacheDirectory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("tmp")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", v6));
  return v7;
}

- (void)didCopyItemToURL:(id)a3 fileSize:(unint64_t)a4
{
  -[BKExtractFileOperation _updateProgressWithByteCount:](self, "_updateProgressWithByteCount:", a4);
}

- (BKExtractFileOperationDelegate)delegate
{
  return (BKExtractFileOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)destinationFilePath
{
  return self->_destinationFilePath;
}

- (void)setDestinationFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_destinationFilePath, a3);
}

- (NSString)sourceFilePath
{
  return self->_sourceFilePath;
}

- (id)userContext
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setUserContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (int)sourceFileType
{
  return self->_sourceFileType;
}

- (void)setSourceFileType:(int)a3
{
  self->_sourceFileType = a3;
}

- (BOOL)skipCleanupDestinationFile
{
  return self->_skipCleanupDestinationFile;
}

- (BOOL)useFileCoordination
{
  return self->_useFileCoordination;
}

- (void)setUseFileCoordination:(BOOL)a3
{
  self->_useFileCoordination = a3;
}

- (NSString)forcedFileProtection
{
  return self->_forcedFileProtection;
}

- (void)setForcedFileProtection:(id)a3
{
  objc_storeStrong((id *)&self->_forcedFileProtection, a3);
}

- (BOOL)fixFilePermissions
{
  return self->_fixFilePermissions;
}

- (void)setFixFilePermissions:(BOOL)a3
{
  self->_fixFilePermissions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forcedFileProtection, 0);
  objc_storeStrong((id *)&self->_sourceFilePath, 0);
  objc_storeStrong((id *)&self->_destinationFilePath, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_userContext, 0);
}

@end
