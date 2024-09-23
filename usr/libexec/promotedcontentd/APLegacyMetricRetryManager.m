@implementation APLegacyMetricRetryManager

- (APLegacyMetricRetryManager)init
{
  id v3;
  APLegacyMetricRetryManager *v4;

  v3 = objc_msgSend(objc_alloc((Class)APStorageManager), "initWithPathPrefix:", CFSTR("l"));
  v4 = -[APLegacyMetricRetryManager initWithSecureFileManager:](self, "initWithSecureFileManager:", v3);

  return v4;
}

- (APLegacyMetricRetryManager)initWithSecureFileManager:(id)a3
{
  id v5;
  APLegacyMetricRetryManager *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  NSSet *v9;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *failedRequests;
  APBackoffTimer *v13;
  APBackoffTimer *backoffLevels;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)APLegacyMetricRetryManager;
  v6 = -[APLegacyMetricRetryManager init](&v16, "init");
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.ap.legacyRetryManager.queue", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(APServerRequest));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    +[APSupportedSecureEncodedClass addClasses:](APSupportedSecureEncodedClass, "addClasses:", v10);
    objc_storeStrong((id *)&v6->_secureFileManager, a3);
    v11 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 10);
    failedRequests = v6->_failedRequests;
    v6->_failedRequests = v11;

    v13 = (APBackoffTimer *)objc_msgSend(objc_alloc((Class)APBackoffTimer), "initWithSchedule:name:", 0, CFSTR("LegacyRetryManager"));
    backoffLevels = v6->_backoffLevels;
    v6->_backoffLevels = v13;

    -[APBackoffTimer setDelegate:](v6->_backoffLevels, "setDelegate:", v6);
  }

  return v6;
}

- (void)start
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)os_transaction_create("com.apple.ap.promotedcontentd.retry-init");
  v4 = objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C680C;
  block[3] = &unk_100213F40;
  objc_copyWeak(&v8, &location);
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)registerMetricRequest:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;

  v4 = a3;
  v5 = APLogForCategory(22);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = sub_100103434((uint64_t)v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
    *(_DWORD *)buf = 138543362;
    v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Registering server request %{public}@.", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  v10 = (void *)os_transaction_create("com.apple.ap.promotedcontentd.retry-register-request");
  v11 = objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C6A38;
  block[3] = &unk_10020DF88;
  objc_copyWeak(&v17, (id *)buf);
  v15 = v4;
  v16 = v10;
  v12 = v10;
  v13 = v4;
  dispatch_async(v11, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

- (void)completeServerRequestId:(id)a3 result:(int64_t)a4
{
  -[APLegacyMetricRetryManager completeServerRequestId:serverFailureCount:result:](self, "completeServerRequestId:serverFailureCount:result:", a3, 0, a4);
}

- (void)completeServerRequestId:(id)a3 serverFailureCount:(int64_t)a4 result:(int64_t)a5
{
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18[3];
  uint8_t buf[4];
  id v20;
  __int16 v21;
  int64_t v22;

  v8 = a3;
  v9 = APLogForCategory(22);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v20 = v8;
    v21 = 2048;
    v22 = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Completed server request %{public}@ with result '%ld'", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v11 = (void *)os_transaction_create("com.apple.ap.promotedcontentd.retry-complete-request");
  v12 = objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C6C44;
  block[3] = &unk_100214528;
  objc_copyWeak(v18, (id *)buf);
  v18[1] = (id)a4;
  v18[2] = (id)a5;
  v16 = v8;
  v17 = v11;
  v13 = v11;
  v14 = v8;
  dispatch_async(v12, block);

  objc_destroyWeak(v18);
  objc_destroyWeak((id *)buf);
}

- (id)_pendingPath:(id)a3
{
  return objc_msgSend(CFSTR("p"), "stringByAppendingPathComponent:", a3);
}

- (id)_failedPath:(id)a3
{
  return objc_msgSend(CFSTR("f"), "stringByAppendingPathComponent:", a3);
}

- (void)_registerMetricRequest:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;

  v4 = a3;
  v5 = sub_100103434((uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager _pendingPath:](self, "_pendingPath:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager secureFileManager](self, "secureFileManager"));
  v16 = 0;
  LODWORD(v7) = objc_msgSend(v9, "storeObject:atPath:error:", v4, v8, &v16);
  v10 = v16;

  if (!(_DWORD)v7 || v10)
  {
    v11 = APLogForCategory(22);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = sub_100103434((uint64_t)v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
      *(_DWORD *)buf = 138543618;
      v18 = v15;
      v19 = 2114;
      v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unable to save server request %{public}@. %{public}@", buf, 0x16u);

    }
  }

}

- (void)_completeServerRequestId:(id)a3 serverFailureCount:(int64_t)a4 result:(int64_t)a5
{
  id v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  uint64_t v25;
  int v26;
  id v27;

  v8 = a3;
  if (a5 == 1)
  {
    v11 = objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager _findPotentiallyDeliverableRequest](self, "_findPotentiallyDeliverableRequest"));
    if (a4 < 2)
    {
      -[APLegacyMetricRetryManager _markRequestAsFailed:](self, "_markRequestAsFailed:", v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager failedRequests](self, "failedRequests"));
      v19 = objc_msgSend(v18, "count");

      if ((unint64_t)v19 <= 9)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4 + 1));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager failedRequests](self, "failedRequests"));
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v8);

      }
    }
    else
    {
      v12 = APLogForCategory(22);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v26 = 138543362;
        v27 = v8;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Giving up on request %{public}@. Exceeded maximum retry attempts.", (uint8_t *)&v26, 0xCu);
      }

      -[APLegacyMetricRetryManager _removePendingRequest:](self, "_removePendingRequest:", v8);
    }
    if (v11)
    {
      -[APLegacyMetricRetryManager _sendRequest:responseCallback:](self, "_sendRequest:responseCallback:", v11, 0);
LABEL_19:

      goto LABEL_20;
    }
  }
  else
  {
    if (a5 == 2)
    {
      -[APLegacyMetricRetryManager _markRequestsAsSucceeded:](self, "_markRequestsAsSucceeded:", v8);
      v9 = APLogForCategory(22);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v26 = 138543362;
        v27 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Detected a successful transmission %{public}@.", (uint8_t *)&v26, 0xCu);
      }

      -[APLegacyMetricRetryManager _retryFailedIfAvailable](self, "_retryFailedIfAvailable");
      v11 = objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager backoffLevels](self, "backoffLevels"));
      -[NSObject reset](v11, "reset");
      goto LABEL_19;
    }
    -[APLegacyMetricRetryManager _markRequestAsFailed:](self, "_markRequestAsFailed:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager failedRequests](self, "failedRequests"));
    v15 = objc_msgSend(v14, "count");

    if ((unint64_t)v15 <= 9)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager failedRequests](self, "failedRequests"));
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v8);

    }
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager backoffLevels](self, "backoffLevels"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager queue](self, "queue"));
  v24 = objc_msgSend(v22, "scheduleNextLevelWithQueue:", v23);

  if ((v24 & 1) == 0)
  {
    v25 = APLogForCategory(22);
    v11 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v26) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error: Couldn't schedule Backoff Timer for Legacy Metric Retry Manager.", (uint8_t *)&v26, 2u);
    }
    goto LABEL_19;
  }
LABEL_20:

}

- (id)_findPotentiallyDeliverableRequest
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_10002D390;
  v10 = sub_10002D358;
  v11 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager failedRequests](self, "failedRequests"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C71D4;
  v5[3] = &unk_100214550;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_retryFailedIfAvailable
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager failedRequests](self, "failedRequests"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager failedRequests](self, "failedRequests"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "keyEnumerator"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextObject"));

    -[APLegacyMetricRetryManager _sendRequest:responseCallback:](self, "_sendRequest:responseCallback:", v7, 0);
  }
}

- (void)_markRequestsAsSucceeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager _pendingPath:](self, "_pendingPath:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager secureFileManager](self, "secureFileManager"));
  v11 = 0;
  v7 = objc_msgSend(v6, "removeObjectAtPath:error:", v5, &v11);
  v8 = v11;

  if (!v7 || v8)
  {
    v9 = APLogForCategory(22);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v13 = v4;
      v14 = 2114;
      v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unable to complete a request %{public}@. %{public}@", buf, 0x16u);
    }

  }
}

- (void)_markRequestAsFailed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager secureFileManager](self, "secureFileManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager _pendingPath:](self, "_pendingPath:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager _failedPath:](self, "_failedPath:", v4));
  v12 = 0;
  v8 = objc_msgSend(v5, "moveItemAtPath:toPath:error:", v6, v7, &v12);
  v9 = v12;

  if (!v8 || v9)
  {
    v10 = APLogForCategory(22);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v14 = v4;
      v15 = 2114;
      v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unable to fail a request %{public}@. %{public}@", buf, 0x16u);
    }

  }
}

- (void)_removePendingRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager secureFileManager](self, "secureFileManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager _pendingPath:](self, "_pendingPath:", v4));
  v11 = 0;
  v7 = objc_msgSend(v5, "removeObjectAtPath:error:", v6, &v11);
  v8 = v11;

  if (!v7 || v8)
  {
    v9 = APLogForCategory(22);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v13 = v4;
      v14 = 2114;
      v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unable to remove pending request %{public}@. %{public}@", buf, 0x16u);
    }

  }
}

- (void)_moveAllPendingRequestsToFailed
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  id v16;
  uint8_t v17[128];
  uint8_t buf[4];
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager secureFileManager](self, "secureFileManager"));
  v16 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", CFSTR("p"), &v16));
  v5 = v16;

  if (!v4 || v5)
  {
    v11 = APLogForCategory(22);
    v6 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Unable list pending requests. %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v4;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          -[APLegacyMetricRetryManager _markRequestAsFailed:](self, "_markRequestAsFailed:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), (_QWORD)v12);
        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v8);
    }
  }

}

- (void)_loadFailedRequestsCache
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  uint8_t buf[4];
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager secureFileManager](self, "secureFileManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", CFSTR("f"), 0));

  if (objc_msgSend(v4, "count"))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000C7938;
    v9[3] = &unk_100214578;
    v9[4] = self;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
    v5 = APLogForCategory(22);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager failedRequests](self, "failedRequests"));
      v8 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 134217984;
      v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Loaded %lu failed items.", buf, 0xCu);

    }
  }

}

- (void)_sendRequest:(id)a3 responseCallback:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  unsigned __int8 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  NSObject *v41;

  v6 = a3;
  v7 = a4;
  v8 = APLogForCategory(22);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v39 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Retrying request %{public}@.", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager failedRequests](self, "failedRequests"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v6));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager _pendingPath:](self, "_pendingPath:", v6));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager secureFileManager](self, "secureFileManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager _failedPath:](self, "_failedPath:", v6));
    v37 = 0;
    v15 = objc_msgSend(v13, "moveItemAtPath:toPath:error:", v14, v12, &v37);
    v16 = v37;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager failedRequests](self, "failedRequests"));
    v18 = objc_msgSend(v17, "count");

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager failedRequests](self, "failedRequests"));
    v20 = v19;
    if (v18 == (id)1)
    {
      objc_msgSend(v19, "removeAllObjects");

      -[APLegacyMetricRetryManager _loadFailedRequestsCache](self, "_loadFailedRequestsCache");
    }
    else
    {
      objc_msgSend(v19, "removeObjectForKey:", v6);

    }
    if (v16)
      v23 = 0;
    else
      v23 = v15;
    if ((v23 & 1) != 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager secureFileManager](self, "secureFileManager"));
      v35 = 0;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectStoredAtPath:error:", v12, &v35));
      v22 = v35;

      if (v25
        && !v22
        && (v26 = sub_100103440((uint64_t)v25),
            v27 = (void *)objc_claimAutoreleasedReturnValue(v26),
            v27,
            v27))
      {
        -[APLegacyMetricRetryManager _makeRequest:serverFailureCount:responseCallback:](self, "_makeRequest:serverFailureCount:responseCallback:", v25, objc_msgSend(v11, "longValue"), v7);
      }
      else
      {
        v33 = APLogForCategory(22);
        v34 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v39 = v6;
          v40 = 2114;
          v41 = v22;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Unable to restore a request %{public}@. %{public}@", buf, 0x16u);
        }

        -[APLegacyMetricRetryManager _removePendingRequest:](self, "_removePendingRequest:", v6);
        -[APLegacyMetricRetryManager _retryFailedIfAvailable](self, "_retryFailedIfAvailable");
      }

    }
    else
    {
      v28 = APLogForCategory(22);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v39 = v6;
        v40 = 2114;
        v41 = v16;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Unable to queue a request %{public}@. %{public}@", buf, 0x16u);
      }

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager secureFileManager](self, "secureFileManager"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager _failedPath:](self, "_failedPath:", v6));
      v36 = v16;
      objc_msgSend(v30, "removeObjectAtPath:error:", v31, &v36);
      v22 = v36;

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRetryManager failedRequests](self, "failedRequests"));
      objc_msgSend(v32, "removeObjectForKey:", v6);

      -[APLegacyMetricRetryManager _retryFailedIfAvailable](self, "_retryFailedIfAvailable");
    }

  }
  else
  {
    v21 = APLogForCategory(22);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v39 = v6;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Trying to send a request %{public}@ which is not in a list of failed requests.", buf, 0xCu);
    }
  }

}

- (void)_makeRequest:(id)a3 serverFailureCount:(int64_t)a4 responseCallback:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21[2];
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  v10 = (void *)os_transaction_create("com.apple.ap.promotedcontentd.retry-make-request");
  v11 = -[APServerRetryRequester initFromServerRequest:]([APServerRetryRequester alloc], "initFromServerRequest:", v8);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000C7F34;
  v16[3] = &unk_1002145A0;
  objc_copyWeak(v21, &location);
  v12 = v8;
  v17 = v12;
  v21[1] = (id)a4;
  v13 = v11;
  v18 = v13;
  v14 = v9;
  v20 = v14;
  v15 = v10;
  v19 = v15;
  objc_msgSend(v13, "makeRequest:", v16);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

}

- (void)backoffTimerFired
{
  id v3;

  v3 = (id)os_transaction_create("com.apple.ap.promotedcontentd.retry-backoff-timer");
  -[APLegacyMetricRetryManager _retryFailedIfAvailable](self, "_retryFailedIfAvailable");

}

+ (int64_t)resultForResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = objc_msgSend(a1, "_resultForResponseStatusCode:error:", objc_msgSend(a3, "responseStatusCode"), v6);

  return (int64_t)v7;
}

+ (int64_t)_resultForResponseStatusCode:(int64_t)a3 error:(id)a4
{
  void *v6;
  unsigned __int8 v7;
  int64_t v9;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "domain"));
  v7 = objc_msgSend(v6, "isEqualToString:", NSURLErrorDomain);

  if ((v7 & 1) != 0)
    return 0;
  v9 = 1;
  if (!a4)
    v9 = 2;
  if ((unint64_t)(a3 - 300) >= 0xFFFFFFFFFFFFFF9CLL)
    return v9;
  else
    return 1;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (APStorageManager)secureFileManager
{
  return self->_secureFileManager;
}

- (void)setSecureFileManager:(id)a3
{
  objc_storeStrong((id *)&self->_secureFileManager, a3);
}

- (APBackoffTimer)backoffLevels
{
  return self->_backoffLevels;
}

- (void)setBackoffLevels:(id)a3
{
  objc_storeStrong((id *)&self->_backoffLevels, a3);
}

- (NSMutableDictionary)failedRequests
{
  return self->_failedRequests;
}

- (void)setFailedRequests:(id)a3
{
  objc_storeStrong((id *)&self->_failedRequests, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedRequests, 0);
  objc_storeStrong((id *)&self->_backoffLevels, 0);
  objc_storeStrong((id *)&self->_secureFileManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
