@implementation WeatherDiagnosticExtensionExtension

- (WeatherDiagnosticExtensionExtension)init
{
  WeatherDiagnosticExtensionExtension *v2;
  WDEDiagnosticFileProvider *v3;
  WDEDiagnosticFileProvider *fileProvider;
  WDEDatabaseManager *v5;
  WDEDatabaseManager *databaseManager;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WeatherDiagnosticExtensionExtension;
  v2 = -[WeatherDiagnosticExtensionExtension init](&v8, "init");
  if (v2)
  {
    v3 = objc_opt_new(WDEDiagnosticFileProvider);
    fileProvider = v2->_fileProvider;
    v2->_fileProvider = v3;

    v5 = objc_opt_new(WDEDatabaseManager);
    databaseManager = v2->_databaseManager;
    v2->_databaseManager = v5;

  }
  return v2;
}

- (id)attachmentList
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  id v23;
  uint8_t v24[128];
  uint8_t buf[4];
  id v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherDiagnosticExtensionExtension databaseManager](self, "databaseManager"));
  objc_msgSend(v3, "checkpoint");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WeatherDiagnosticExtensionExtension fileProvider](self, "fileProvider"));
  v23 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "exportDirectoryAndReturnError:", &v23));
  v6 = v23;

  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[WeatherDiagnosticExtensionExtension log](WeatherDiagnosticExtensionExtension, "log"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to create export directory with error: %@", buf, 0xCu);
    }
    v8 = &__NSArray0__struct;
  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v22 = 0;
    v17 = v5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:](v7, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v5, 0, 4, &v22));
    v6 = v22;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[DEAttachmentItem attachmentWithPathURL:](DEAttachmentItem, "attachmentWithPathURL:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v14)));
          objc_msgSend(v15, "setDeleteOnAttach:", &__kCFBooleanTrue);
          objc_msgSend(v8, "addObject:", v15);

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v12);
    }

    v5 = v17;
  }

  return v8;
}

- (id)attachmentsForParameters:(id)a3
{
  return -[WeatherDiagnosticExtensionExtension attachmentList](self, "attachmentList", a3);
}

+ (id)log
{
  if (qword_10000C488 != -1)
    dispatch_once(&qword_10000C488, &stru_100008470);
  return (id)qword_10000C490;
}

- (WDEDiagnosticFileProvider)fileProvider
{
  return self->_fileProvider;
}

- (WDEDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_fileProvider, 0);
}

@end
