@implementation MSDContentServer

- (MSDContentServer)init
{
  MSDContentServer *v2;
  MSDContentServer *v3;
  uint64_t v4;
  MSDCDNSession *v5;
  void *v6;
  id v7;
  MSDContentServer *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MSDContentServer;
  v2 = -[MSDContentServer init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    -[MSDContentServer initServer](v2, "initServer");
    if (-[MSDContentServer concurrentSession](v3, "concurrentSession") >= 1)
    {
      v4 = 0;
      do
      {
        v5 = objc_alloc_init(MSDCDNSession);
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer sessionTable](v3, "sessionTable"));
        v7 = objc_alloc_init((Class)NSMutableArray);
        objc_msgSend(v6, "setObject:forKey:", v7, v5);

        ++v4;
      }
      while (v4 < -[MSDContentServer concurrentSession](v3, "concurrentSession"));
    }
    v8 = v3;
  }

  return v3;
}

- (MSDContentServer)initWithCellularAccess:(BOOL)a3
{
  _BOOL8 v3;
  MSDContentServer *v4;
  MSDContentServer *v5;
  uint64_t v6;
  MSDCDNSession *v7;
  void *v8;
  id v9;
  MSDContentServer *v10;
  objc_super v12;

  v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MSDContentServer;
  v4 = -[MSDContentServer init](&v12, "init");
  v5 = v4;
  if (v4)
  {
    -[MSDContentServer initServer](v4, "initServer");
    if (-[MSDContentServer concurrentSession](v5, "concurrentSession") >= 1)
    {
      v6 = 0;
      do
      {
        v7 = -[MSDSession initWithCellularAccess:]([MSDCDNSession alloc], "initWithCellularAccess:", v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer sessionTable](v5, "sessionTable"));
        v9 = objc_alloc_init((Class)NSMutableArray);
        objc_msgSend(v8, "setObject:forKey:", v9, v7);

        ++v6;
      }
      while (v6 < -[MSDContentServer concurrentSession](v5, "concurrentSession"));
    }
    v10 = v5;
  }

  return v5;
}

- (void)downloadFile:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer getSessionForRequest:](self, "getSessionForRequest:"));
  if (v4)
    -[MSDContentServer launchRequest:toSession:](self, "launchRequest:toSession:", v5, v4);

}

- (void)launchRequest:(id)a3 toSession:(id)a4
{
  id v6;
  id v7;
  MSDServerRetryPolicyContext *v8;
  void *v9;
  void *v10;
  void *v11;
  MSDCDNSessionTaskInfo *v12;
  void *v13;
  void *v14;
  void *v15;
  MSDContentServerURLRetryPolicy *v16;
  void *v17;
  id v18;
  MSDContentServerURLRetryPolicy *v19;
  MSDCDNSessionTaskInfo *v20;
  id v21;
  MSDServerRetryPolicyContext *v22;
  void ***v23;
  void **v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, void *);
  void *v27;
  MSDContentServer *v28;
  id v29;
  MSDContentServerURLRetryPolicy *v30;
  MSDCDNSessionTaskInfo *v31;
  id v32;
  MSDServerRetryPolicyContext *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[5];
  id v45;

  v6 = a3;
  v7 = a4;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = sub_1000B4EB8;
  v44[4] = sub_1000B4EC8;
  v45 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = sub_1000B4EB8;
  v42[4] = sub_1000B4EC8;
  v43 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = sub_1000B4EB8;
  v40[4] = sub_1000B4EC8;
  v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = sub_1000B4EB8;
  v38[4] = sub_1000B4EC8;
  v39 = 0;
  v8 = objc_alloc_init(MSDServerRetryPolicyContext);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "downloadCredentials"));
  -[MSDServerRetryPolicyContext setFdc:](v8, "setFdc:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "originServer"));
  -[MSDServerRetryPolicyContext setOriginServer:](v8, "setOriginServer:", v10);

  -[MSDServerRetryPolicyContext setTryCachingHub:](v8, "setTryCachingHub:", -[MSDContentServer shouldTryLocalHub:](self, "shouldTryLocalHub:", v6));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer localHubURLSchema](self, "localHubURLSchema"));
  -[MSDServerRetryPolicyContext setCachedLocalURL:](v8, "setCachedLocalURL:", v11);

  v12 = objc_alloc_init(MSDCDNSessionTaskInfo);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fileHash"));
  -[MSDCDNSessionTaskInfo setFileHash:](v12, "setFileHash:", v14);

  -[MSDSessionTaskInfo setMaxRetry:](v12, "setMaxRetry:", 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "savePath"));
  -[MSDSessionTaskInfo setSavePath:](v12, "setSavePath:", v15);

  v16 = -[MSDContentServerURLRetryPolicy initWithContext:]([MSDContentServerURLRetryPolicy alloc], "initWithContext:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v17, "timeIntervalSince1970");
  objc_msgSend(v6, "setDispatchTime:");

  v24 = _NSConcreteStackBlock;
  v25 = 3221225472;
  v26 = sub_1000B4ED0;
  v27 = &unk_100140000;
  v34 = v44;
  v28 = self;
  v18 = v6;
  v29 = v18;
  v35 = v40;
  v36 = v42;
  v19 = v16;
  v30 = v19;
  v20 = v12;
  v31 = v20;
  v21 = v7;
  v32 = v21;
  v37 = v38;
  v22 = v8;
  v33 = v22;
  v23 = objc_retainBlock(&v24);
  -[MSDSessionTaskInfo setHandler:](v20, "setHandler:", v23, v24, v25, v26, v27, v28);
  ((void (*)(void ***, _QWORD, _QWORD))v23[2])(v23, 0, 0);

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v44, 8);

}

- (void)initServer
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  NSObject *v19;
  int v20;
  double v21;

  -[MSDContentServer setLocalHubReachable:](self, "setLocalHubReachable:", 1);
  -[MSDContentServer setLocalHubURLSchema:](self, "setLocalHubURLSchema:", 0);
  -[MSDContentServer setCachedFDC:](self, "setCachedFDC:", 0);
  -[MSDContentServer setNextRetryTime:](self, "setNextRetryTime:", 0.0);
  -[MSDContentServer setReachabilityLastUpdatedTime:](self, "setReachabilityLastUpdatedTime:", 0.0);
  -[MSDContentServer setCachingHubRequest:](self, "setCachingHubRequest:", 0);
  -[MSDContentServer setRequestDispatchLock:](self, "setRequestDispatchLock:", 0);
  -[MSDContentServer setCachingHubRetryLock:](self, "setCachingHubRetryLock:", 0);
  -[MSDContentServer setCachingHubRetryInterval:](self, "setCachingHubRetryInterval:", 600.0);
  -[MSDContentServer setConcurrentSession:](self, "setConcurrentSession:", 2);
  -[MSDContentServer setRequestPerSession:](self, "setRequestPerSession:", 6);
  -[MSDContentServer setNumConcurrentRequests:](self, "setNumConcurrentRequests:", 0);
  v3 = objc_alloc_init((Class)NSMutableArray);
  -[MSDContentServer setPendingRequests:](self, "setPendingRequests:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
  -[MSDContentServer setSessionTable:](self, "setSessionTable:", v4);

  v5 = sub_100060640();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  -[MSDContentServer setSignpostId:](self, "setSignpostId:", os_signpost_id_generate(v6));

  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance"));
    v8 = (uint64_t)objc_msgSend(v7, "concurrentSession");

    if (v8 >= 1)
    {
      v9 = sub_1000604F0();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 134217984;
        v21 = *(double *)&v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Override default number of concurrent download session: %ld", (uint8_t *)&v20, 0xCu);
      }

      -[MSDContentServer setConcurrentSession:](self, "setConcurrentSession:", v8);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance"));
    v12 = (uint64_t)objc_msgSend(v11, "concurrentDownloadRequest");

    if (v12 >= 1)
    {
      v13 = sub_1000604F0();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 134217984;
        v21 = *(double *)&v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Override default number of concurrent requests per session: %ld", (uint8_t *)&v20, 0xCu);
      }

      -[MSDContentServer setRequestPerSession:](self, "setRequestPerSession:", v12);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance"));
    objc_msgSend(v15, "cachingHubRetryInterval");
    v17 = v16;

    if (v17 > 0.0)
    {
      v18 = sub_1000604F0();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 134217984;
        v21 = v17;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Override default caching hub retry interval: %lf", (uint8_t *)&v20, 0xCu);
      }

      -[MSDContentServer setCachingHubRetryInterval:](self, "setCachingHubRetryInterval:", v17);
    }
  }
  -[MSDContentServer setMaxConcurrentRequests:](self, "setMaxConcurrentRequests:", -[MSDContentServer requestPerSession](self, "requestPerSession")* -[MSDContentServer concurrentSession](self, "concurrentSession"));
}

- (void)handleCompletionForDownloadRequest:(id)a3 withResponse:(id)a4 forSession:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  os_unfair_lock_lock(&self->_requestDispatchLock);
  -[MSDContentServer freeRequest:forSession:](self, "freeRequest:forSession:", v17, v9);
  v10 = -[MSDContentServer numConcurrentRequests](self, "numConcurrentRequests");
  if (v10 < -[MSDContentServer maxConcurrentRequests](self, "maxConcurrentRequests")
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer pendingRequests](self, "pendingRequests")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject")),
        v11,
        v12))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer pendingRequests](self, "pendingRequests"));
    objc_msgSend(v13, "removeObjectAtIndex:", 0);

    -[MSDContentServer allocateRequest:forSession:](self, "allocateRequest:forSession:", v12, v9);
    os_unfair_lock_unlock(&self->_requestDispatchLock);
    -[MSDContentServer launchRequest:toSession:](self, "launchRequest:toSession:", v12, v9);

  }
  else
  {
    os_unfair_lock_unlock(&self->_requestDispatchLock);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer observer](self, "observer"));

  if (v14)
  {
    v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MSDContentServer observer](self, "observer"));
    objc_msgSend(v15, "requestComplete:withResponse:", v17, v8);
LABEL_9:

    goto LABEL_10;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "completion"));

  if (v16)
  {
    v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "completion"));
    ((void (**)(_QWORD, id))v15)[2](v15, v8);
    goto LABEL_9;
  }
LABEL_10:

}

- (id)getSessionForRequest:(id)a3
{
  os_unfair_lock_s *p_requestDispatchLock;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  p_requestDispatchLock = &self->_requestDispatchLock;
  v5 = a3;
  os_unfair_lock_lock(p_requestDispatchLock);
  v6 = -[MSDContentServer numConcurrentRequests](self, "numConcurrentRequests");
  if (v6 >= -[MSDContentServer maxConcurrentRequests](self, "maxConcurrentRequests"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer pendingRequests](self, "pendingRequests"));
    objc_msgSend(v8, "addObject:", v5);

    v7 = 0;
    v5 = v8;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer getSessionWithMinRequestLoad](self, "getSessionWithMinRequestLoad"));
    -[MSDContentServer allocateRequest:forSession:](self, "allocateRequest:forSession:", v5, v7);
  }

  os_unfair_lock_unlock(p_requestDispatchLock);
  return v7;
}

- (void)allocateRequest:(id)a3 forSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer sessionTable](self, "sessionTable"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v6));

  objc_msgSend(v9, "addObject:", v7);
  -[MSDContentServer setNumConcurrentRequests:](self, "setNumConcurrentRequests:", (char *)-[MSDContentServer numConcurrentRequests](self, "numConcurrentRequests") + 1);

}

- (void)freeRequest:(id)a3 forSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer sessionTable](self, "sessionTable"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v6));

  objc_msgSend(v9, "removeObject:", v7);
  -[MSDContentServer setNumConcurrentRequests:](self, "setNumConcurrentRequests:", (char *)-[MSDContentServer numConcurrentRequests](self, "numConcurrentRequests") - 1);

}

- (id)getSessionWithMinRequestLoad
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer sessionTable](self, "sessionTable", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v16;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer sessionTable](self, "sessionTable"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v10));

        if ((unint64_t)objc_msgSend(v12, "count") < v8)
        {
          v8 = (unint64_t)objc_msgSend(v12, "count");
          v13 = v10;

          v6 = v13;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)limitConcurrentRequests
{
  os_unfair_lock_s *p_requestDispatchLock;
  id v4;
  NSObject *v5;

  p_requestDispatchLock = &self->_requestDispatchLock;
  os_unfair_lock_lock(&self->_requestDispatchLock);
  if (-[MSDContentServer requestPerSession](self, "requestPerSession") >= 2)
  {
    -[MSDContentServer setRequestPerSession:](self, "setRequestPerSession:", (char *)-[MSDContentServer requestPerSession](self, "requestPerSession") - 1);
    -[MSDContentServer setMaxConcurrentRequests:](self, "setMaxConcurrentRequests:", -[MSDContentServer requestPerSession](self, "requestPerSession")* -[MSDContentServer concurrentSession](self, "concurrentSession"));
    v4 = sub_1000604F0();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_1000CCAB0(self, v5);

  }
  os_unfair_lock_unlock(p_requestDispatchLock);
}

- (BOOL)shouldTryLocalHub:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  NSObject *v28;
  int v30;
  id v31;
  __int16 v32;
  uint64_t v33;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "downloadCredentials"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originServer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localCredentialForOriginServer:", v6));

  os_unfair_lock_lock(&self->_cachingHubRetryLock);
  v8 = -[MSDContentServer localHubReachable](self, "localHubReachable");
  v9 = v8;
  if (v7 && (v8 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer cachingHubRequest](self, "cachingHubRequest"));

    if (v10)
    {
LABEL_4:
      LOBYTE(v9) = 0;
      goto LABEL_18;
    }
    v11 = objc_claimAutoreleasedReturnValue(-[MSDContentServer cachedFDC](self, "cachedFDC"));
    if (v11
      && (v12 = (void *)v11,
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer cachedFDC](self, "cachedFDC")),
          v14 = objc_msgSend(v7, "isEqualToDictionary:", v13),
          v13,
          v12,
          (v14 & 1) != 0))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v15, "timeIntervalSince1970");
      v17 = v16;
      -[MSDContentServer nextRetryTime](self, "nextRetryTime");
      v19 = v18;

      if (v17 <= v19)
        goto LABEL_4;
      v20 = sub_1000604F0();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        objc_msgSend(v22, "timeIntervalSince1970");
        v24 = v23;
        -[MSDContentServer cachingHubRetryInterval](self, "cachingHubRetryInterval");
        v30 = 134218240;
        v31 = v24;
        v32 = 2048;
        v33 = v25;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Trying local caching hub at %lf after %lf s", (uint8_t *)&v30, 0x16u);

      }
    }
    else
    {
      v26 = sub_1000604F0();
      v21 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v30) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Request local FDC is new, retrying local caching hub", (uint8_t *)&v30, 2u);
      }
    }

    -[MSDContentServer setCachingHubRequest:](self, "setCachingHubRequest:", v4);
    v27 = sub_1000604F0();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 138543362;
      v31 = v4;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Launching request %{public}@ to retry caching hub", (uint8_t *)&v30, 0xCu);
    }

    v9 = 1;
  }
  if (v7 && v9)
    -[MSDContentServer setCachedFDC:](self, "setCachedFDC:", v7);
LABEL_18:
  os_unfair_lock_unlock(&self->_cachingHubRetryLock);

  return v9;
}

- (void)updateLocalHubReachability:(BOOL)a3 withRequest:(id)a4 andResponse:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  id v16;
  _BOOL4 v17;
  id v18;
  NSObject *v19;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  int v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  _BOOL4 v41;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  os_unfair_lock_lock(&self->_cachingHubRetryLock);
  objc_msgSend(v8, "dispatchTime");
  v11 = v10;
  -[MSDContentServer reachabilityLastUpdatedTime](self, "reachabilityLastUpdatedTime");
  v13 = v12;
  v14 = objc_claimAutoreleasedReturnValue(-[MSDContentServer cachingHubRequest](self, "cachingHubRequest"));
  if (v14
    && (v15 = (void *)v14,
        v16 = (id)objc_claimAutoreleasedReturnValue(-[MSDContentServer cachingHubRequest](self, "cachingHubRequest")),
        v16,
        v15,
        v16 == v8))
  {
    v18 = sub_1000604F0();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v34 = 138543618;
      v35 = v8;
      v36 = 1024;
      LODWORD(v37) = v6;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Request %{public}@ complete with local hub reachability=%d", (uint8_t *)&v34, 0x12u);
    }

    -[MSDContentServer setCachingHubRequest:](self, "setCachingHubRequest:", 0);
    v17 = v6;
  }
  else
  {
    v17 = !v6;
  }
  if (v11 > v13 && v17)
  {
    v21 = sub_1000604F0();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[MSDContentServer reachabilityLastUpdatedTime](self, "reachabilityLastUpdatedTime");
      v24 = v23;
      objc_msgSend(v8, "dispatchTime");
      v34 = 134218754;
      v35 = v24;
      v36 = 2114;
      v37 = v8;
      v38 = 2048;
      v39 = v25;
      v40 = 1024;
      v41 = v6;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Reachability last updated by request dispatched at: %lf; request %{public}@ dispatched at %lf changing local hub"
        " reachability={public}%d",
        (uint8_t *)&v34,
        0x26u);
    }

    -[MSDContentServer setLocalHubReachable:](self, "setLocalHubReachable:", v6);
    objc_msgSend(v8, "dispatchTime");
    -[MSDContentServer setReachabilityLastUpdatedTime:](self, "setReachabilityLastUpdatedTime:");
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localHubError"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedDescription"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
    objc_msgSend(v28, "setLocalHubFailureReason:", v27);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[MSDMailProcessor sharedInstance](MSDMailProcessor, "sharedInstance"));
    objc_msgSend(v29, "reportCachingHubFailed");

  }
  if (!-[MSDContentServer localHubReachable](self, "localHubReachable"))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v30, "timeIntervalSince1970");
    v32 = v31;
    -[MSDContentServer cachingHubRetryInterval](self, "cachingHubRetryInterval");
    -[MSDContentServer setNextRetryTime:](self, "setNextRetryTime:", v32 + v33);

  }
  os_unfair_lock_unlock(&self->_cachingHubRetryLock);

}

- (MSDContentServerObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
  objc_storeStrong((id *)&self->_observer, a3);
}

- (NSString)localHubURLSchema
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLocalHubURLSchema:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)localHubReachable
{
  return self->_localHubReachable;
}

- (void)setLocalHubReachable:(BOOL)a3
{
  self->_localHubReachable = a3;
}

- (NSDictionary)cachedFDC
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCachedFDC:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (double)nextRetryTime
{
  return self->_nextRetryTime;
}

- (void)setNextRetryTime:(double)a3
{
  self->_nextRetryTime = a3;
}

- (double)reachabilityLastUpdatedTime
{
  return self->_reachabilityLastUpdatedTime;
}

- (void)setReachabilityLastUpdatedTime:(double)a3
{
  self->_reachabilityLastUpdatedTime = a3;
}

- (double)cachingHubRetryInterval
{
  return self->_cachingHubRetryInterval;
}

- (void)setCachingHubRetryInterval:(double)a3
{
  self->_cachingHubRetryInterval = a3;
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (void)setSignpostId:(unint64_t)a3
{
  self->_signpostId = a3;
}

- (MSDDownloadFileRequest)cachingHubRequest
{
  return self->_cachingHubRequest;
}

- (void)setCachingHubRequest:(id)a3
{
  objc_storeStrong((id *)&self->_cachingHubRequest, a3);
}

- (os_unfair_lock_s)cachingHubRetryLock
{
  return self->_cachingHubRetryLock;
}

- (void)setCachingHubRetryLock:(os_unfair_lock_s)a3
{
  self->_cachingHubRetryLock = a3;
}

- (os_unfair_lock_s)requestDispatchLock
{
  return self->_requestDispatchLock;
}

- (void)setRequestDispatchLock:(os_unfair_lock_s)a3
{
  self->_requestDispatchLock = a3;
}

- (int64_t)requestPerSession
{
  return self->_requestPerSession;
}

- (void)setRequestPerSession:(int64_t)a3
{
  self->_requestPerSession = a3;
}

- (int64_t)concurrentSession
{
  return self->_concurrentSession;
}

- (void)setConcurrentSession:(int64_t)a3
{
  self->_concurrentSession = a3;
}

- (int64_t)maxConcurrentRequests
{
  return self->_maxConcurrentRequests;
}

- (void)setMaxConcurrentRequests:(int64_t)a3
{
  self->_maxConcurrentRequests = a3;
}

- (int64_t)numConcurrentRequests
{
  return self->_numConcurrentRequests;
}

- (void)setNumConcurrentRequests:(int64_t)a3
{
  self->_numConcurrentRequests = a3;
}

- (NSMapTable)sessionTable
{
  return self->_sessionTable;
}

- (void)setSessionTable:(id)a3
{
  objc_storeStrong((id *)&self->_sessionTable, a3);
}

- (NSMutableArray)pendingRequests
{
  return self->_pendingRequests;
}

- (void)setPendingRequests:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRequests, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_sessionTable, 0);
  objc_storeStrong((id *)&self->_cachingHubRequest, 0);
  objc_storeStrong((id *)&self->_cachedFDC, 0);
  objc_storeStrong((id *)&self->_localHubURLSchema, 0);
  objc_storeStrong((id *)&self->_observer, 0);
}

@end
