@implementation SWCDownloadScheduler

- (SWCDownloadScheduler)initWithDownloader:(id)a3 database:(id)a4
{
  id v7;
  id v8;
  SWCDownloadScheduler *v9;
  SWCDownloadScheduler *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SWCDownloadScheduler;
  v9 = -[SWCDownloadScheduler init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_downloader, a3);
    objc_storeStrong((id *)&v10->_database, a4);
    v10->_enabled = 1;
  }

  return v10;
}

+ (id)new
{
  abort();
}

- (SWCDownloadScheduler)init
{
  abort();
}

- (void)update
{
  id v3;

  v3 = (id)os_transaction_create("com.apple.swc.update.explicit");
  -[SWCDownloadScheduler _performUpdatesWithTransaction:](self, "_performUpdatesWithTransaction:");

}

- (SWCDownloader)downloader
{
  return (SWCDownloader *)objc_getProperty(self, a2, 16, 1);
}

- (SWCDatabase)database
{
  return (SWCDatabase *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_downloader, 0);
}

- (id)_init
{
  SWCDownloadScheduler *v2;
  SWCDownloadScheduler *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SWCDownloadScheduler;
  v2 = -[SWCDownloadScheduler init](&v5, "init");
  v3 = v2;
  if (v2)
    -[SWCDownloadScheduler _scheduleUpdateTimer](v2, "_scheduleUpdateTimer");
  return v3;
}

- (void)_scheduleUpdateTimer
{
  xpc_object_t v3;
  void *v4;
  _QWORD handler[5];

  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = v3;
  if (v3)
  {
    xpc_dictionary_set_string(v3, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
    xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
    xpc_dictionary_set_int64(v4, XPC_ACTIVITY_INTERVAL, 3600);
    xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
    xpc_dictionary_set_string(v4, XPC_ACTIVITY_NETWORK_TRANSFER_DIRECTION, XPC_ACTIVITY_NETWORK_TRANSFER_DIRECTION_DOWNLOAD);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100012D98;
    handler[3] = &unk_100030DA0;
    handler[4] = self;
    xpc_activity_register("com.apple.SharedWebCredentials.recheck", v4, handler);
  }

}

- (void)_performUpdateWithActivity:(id)a3
{
  _xpc_activity_s *v4;
  void *v5;
  xpc_activity_state_t state;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  _xpc_activity_s *v14;
  uint8_t buf[4];
  xpc_activity_state_t v16;

  v4 = (_xpc_activity_s *)a3;
  v5 = (void *)os_transaction_create("com.apple.swc.update.scheduled");
  state = xpc_activity_get_state(v4);
  if (qword_100037260 != -1)
    dispatch_once(&qword_100037260, &stru_100030DE8);
  v7 = qword_100037258;
  if (os_log_type_enabled((os_log_t)qword_100037258, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v16 = state;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Update activity state: %lli", buf, 0xCu);
    if (state == 2)
    {
      if (qword_100037260 != -1)
        dispatch_once(&qword_100037260, &stru_100030DE8);
      goto LABEL_8;
    }
    if (qword_100037260 != -1)
      dispatch_once(&qword_100037260, &stru_100030DE8);
  }
  else if (state == 2)
  {
LABEL_8:
    v8 = qword_100037258;
    if (os_log_type_enabled((os_log_t)qword_100037258, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Performing SWC update.", buf, 2u);
    }
    if (xpc_activity_set_state(v4, 4))
    {
      v9 = objc_claimAutoreleasedReturnValue(+[SWCDatabase queue](SWCDatabase, "queue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000130F8;
      block[3] = &unk_100030DC8;
      block[4] = self;
      v13 = v5;
      v14 = v4;
      dispatch_async(v9, block);

    }
    else
    {
      if (qword_100037260 != -1)
        dispatch_once(&qword_100037260, &stru_100030DE8);
      v11 = qword_100037258;
      if (os_log_type_enabled((os_log_t)qword_100037258, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Continue activity state failed; downloads will not proceed at this time.",
          buf,
          2u);
      }
    }
    goto LABEL_20;
  }
  v10 = qword_100037258;
  if (os_log_type_enabled((os_log_t)qword_100037258, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v16 = state;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Activity block was fired with state %lli; not running now.",
      buf,
      0xCu);
  }
LABEL_20:

}

- (id)_updateableEntries
{
  id v3;
  void *v4;
  SWCDatabase *database;
  id v6;
  id v7;
  void *v8;
  id v9;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;

  v3 = objc_alloc_init((Class)NSMutableOrderedSet);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  database = self->_database;
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_100013234;
  v14 = &unk_100030CE0;
  v6 = v4;
  v15 = v6;
  v7 = v3;
  v16 = v7;
  -[SWCDatabase enumerateEntriesWithBlock:](database, "enumerateEntriesWithBlock:", &v11);
  if (!objc_msgSend(v7, "count", v11, v12, v13, v14))
  {

    v7 = 0;
  }
  v8 = v16;
  v9 = v7;

  return v9;
}

- (void)_performUpdatesWithTransaction:(id)a3
{
  void *v4;
  id v5;
  __int128 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  SWCDownloader *downloader;
  void *v11;
  void *v12;
  NSObject *v13;
  SWCDownloader *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];

  if (-[SWCDownloadScheduler isEnabled](self, "isEnabled", a3))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDownloadScheduler _updateableEntries](self, "_updateableEntries"));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v5)
    {
      v7 = *(_QWORD *)v18;
      *(_QWORD *)&v6 = 138412290;
      v16 = v6;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v8);
          if (objc_msgSend(v9, "needsFirstDownload", v16))
          {
            downloader = self->_downloader;
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "applicationIdentifier"));
            -[SWCDownloader downloadAASAFileForDomain:applicationIdentifier:completionHandler:](downloader, "downloadAASAFileForDomain:applicationIdentifier:completionHandler:", v11, v12, 0);
          }
          else
          {
            if (qword_100037260 != -1)
              dispatch_once(&qword_100037260, &stru_100030DE8);
            v13 = qword_100037258;
            if (os_log_type_enabled((os_log_t)qword_100037258, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v16;
              v22 = v9;
              _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Updating entry %@", buf, 0xCu);
            }
            v14 = self->_downloader;
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "applicationIdentifier"));
            -[SWCDownloader updateAASAFileForDomain:applicationIdentifier:completionHandler:](v14, "updateAASAFileForDomain:applicationIdentifier:completionHandler:", v11, v12, 0);
          }

          v8 = (char *)v8 + 1;
        }
        while (v5 != v8);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v5);
    }

  }
  else
  {
    if (qword_100037260 != -1)
      dispatch_once(&qword_100037260, &stru_100030DE8);
    v15 = qword_100037258;
    if (os_log_type_enabled((os_log_t)qword_100037258, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Ignoring call to schedule downloads because the scheduler is disabled", buf, 2u);
    }
  }
}

@end
