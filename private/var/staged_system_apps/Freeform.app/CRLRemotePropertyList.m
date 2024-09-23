@implementation CRLRemotePropertyList

- (CRLRemotePropertyList)init
{
  unsigned int v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  unsigned int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;

  v2 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101260B60);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLRemotePropertyList init]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLRemoteDefaults.m";
    v17 = 1024;
    v18 = 41;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101260B80);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v12 = v2;
    v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLRemotePropertyList init]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLRemoteDefaults.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 41, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLRemotePropertyList init]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (CRLRemotePropertyList)initWithRemoteURL:(id)a3 localURL:(id)a4
{
  id v6;
  id v7;
  CRLRemotePropertyList *v8;
  NSURL *v9;
  NSURL *remoteURL;
  NSURL *v11;
  NSURL *localURL;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSDictionary *v17;
  NSDictionary *propertyList;
  Class v19;
  NSString *v20;
  void *v21;
  void *v22;
  id v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *accessQueue;
  uint64_t v26;
  Class v27;
  NSString *v28;
  void *v29;
  void *v30;
  id v31;
  dispatch_queue_t v32;
  OS_dispatch_queue *checkQueue;
  void *v34;
  objc_super v36;

  v6 = a3;
  v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)CRLRemotePropertyList;
  v8 = -[CRLRemotePropertyList init](&v36, "init");
  if (v8)
  {
    v9 = (NSURL *)objc_msgSend(v6, "copy");
    remoteURL = v8->_remoteURL;
    v8->_remoteURL = v9;

    v11 = (NSURL *)objc_msgSend(v7, "copy");
    localURL = v8->_localURL;
    v8->_localURL = v11;

    if (v7)
    {
      if ((objc_msgSend(v7, "isFileURL") & 1) == 0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101260BA0);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E3890C();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101260BC0);
        v14 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLRemotePropertyList initWithRemoteURL:localURL:]"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLRemoteDefaults.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 52, 0, "Local URL should be a file URL.");

      }
      v17 = (NSDictionary *)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfURL:", v7);
      propertyList = v8->_propertyList;
      v8->_propertyList = v17;

    }
    objc_opt_class(v8, v13);
    v20 = NSStringFromClass(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByAppendingString:", CFSTR(".Access")));

    v23 = objc_retainAutorelease(v22);
    v24 = dispatch_queue_create((const char *)objc_msgSend(v23, "UTF8String"), 0);
    accessQueue = v8->_accessQueue;
    v8->_accessQueue = (OS_dispatch_queue *)v24;

    objc_opt_class(v8, v26);
    v28 = NSStringFromClass(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringByAppendingString:", CFSTR(".Check")));

    v31 = objc_retainAutorelease(v30);
    v32 = dispatch_queue_create((const char *)objc_msgSend(v31, "UTF8String"), 0);
    checkQueue = v8->_checkQueue;
    v8->_checkQueue = (OS_dispatch_queue *)v32;

    -[CRLRemotePropertyList startUpdateTimer](v8, "startUpdateTimer");
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v34, "addObserver:selector:name:object:", v8, "processWillSuspend:", UIApplicationWillResignActiveNotification, 0);
    objc_msgSend(v34, "addObserver:selector:name:object:", v8, "processDidResume:", UIApplicationDidBecomeActiveNotification, 0);

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  NSObject *updateTimer;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  updateTimer = self->_updateTimer;
  if (updateTimer)
    dispatch_source_cancel(updateTimer);
  v5.receiver = self;
  v5.super_class = (Class)CRLRemotePropertyList;
  -[CRLRemotePropertyList dealloc](&v5, "dealloc");
}

- (void)startUpdateTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *updateTimer;
  double v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_checkQueue);
  updateTimer = self->_updateTimer;
  self->_updateTimer = v3;

  -[CRLRemotePropertyList timeIntervalUntilNextUpdate](self, "timeIntervalUntilNextUpdate");
  dispatch_source_set_timer((dispatch_source_t)self->_updateTimer, (unint64_t)(v5 * 1000000000.0), 0x4E94914F0000uLL, 0x34630B8A000uLL);
  objc_initWeak(&location, self);
  v6 = self->_updateTimer;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10047CA04;
  v7[3] = &unk_10122D4C0;
  objc_copyWeak(&v8, &location);
  dispatch_source_set_event_handler(v6, v7);
  dispatch_resume((dispatch_object_t)self->_updateTimer);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)processWillSuspend:(id)a3
{
  NSObject *updateTimer;
  OS_dispatch_source *v5;

  updateTimer = self->_updateTimer;
  if (updateTimer)
  {
    dispatch_source_cancel(updateTimer);
    v5 = self->_updateTimer;
    self->_updateTimer = 0;

  }
}

- (void)processDidResume:(id)a3
{
  if (!self->_updateTimer)
    -[CRLRemotePropertyList startUpdateTimer](self, "startUpdateTimer", a3);
}

- (void)updateIfNeededWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *checkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  checkQueue = self->_checkQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10047CAFC;
  v7[3] = &unk_101231F00;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(checkQueue, v7);

}

- (id)objectForKey:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_10047CC00;
  v16 = sub_10047CC10;
  v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10047CC18;
  block[3] = &unk_101230370;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)stringForKey:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(NSString, v5).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLRemotePropertyList objectForKey:](self, "objectForKey:", v4, v6));

  v10 = sub_100221D0C(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

- (id)URLForKey:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  id v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLRemotePropertyList objectForKey:](self, "objectForKey:", a3));
  objc_opt_class(NSURL, v4);
  v6 = sub_100221D0C(v5, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v8)
    v9 = 1;
  else
    v9 = v3 == 0;
  if (!v9)
  {
    objc_opt_class(NSString, v7);
    v11 = sub_100221D0C(v10, v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (v12)
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v12));
    else
      v8 = 0;

  }
  return v8;
}

- (id)dictionaryForKey:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(NSDictionary, v5).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLRemotePropertyList objectForKey:](self, "objectForKey:", v4, v6));

  v10 = sub_100221D0C(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

- (id)arrayForKey:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(NSArray, v5).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLRemotePropertyList objectForKey:](self, "objectForKey:", v4, v6));

  v10 = sub_100221D0C(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

- (void)checkForUpdateWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void ***v8;
  void *v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *, void *);
  void *v14;
  CRLRemotePropertyList *v15;
  id v16;
  id v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLRemotePropertyList URLRequest](self, "URLRequest"));
  dispatch_suspend((dispatch_object_t)self->_checkQueue);
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_10047CF64;
  v14 = &unk_101260BE8;
  v15 = self;
  v16 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v17 = v4;
  v18 = objc_msgSend(v16, "beginBackgroundTaskWithExpirationHandler:", 0);
  v6 = v4;
  v7 = v16;
  v8 = objc_retainBlock(&v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sharedSession](NSURLSession, "sharedSession", v11, v12, v13, v14, v15));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataTaskWithRequest:completionHandler:", v5, v8));

  objc_msgSend(v10, "resume");
}

- (id)validateUserDefaultsDownloadURL:(id)a3
{
  return a3;
}

- (double)timeIntervalUntilNextUpdate
{
  void *v3;
  uint64_t v4;
  Class v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  objc_class *v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", CFSTR("NextUpdate")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v8));

  v11 = 0.0;
  if (v9)
  {
    objc_opt_class(NSDate, v10);
    v13 = sub_1002223BC(v12, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v9, "timeIntervalSinceDate:", v15);
      v17 = v16;

      v11 = fmax(v17, 0.0);
    }
  }

  return v11;
}

- (id)URLRequest
{
  void *v3;
  uint64_t v4;
  Class v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSURL *v12;
  id v13;
  uint64_t v14;
  Class v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", CFSTR("DownloadURL")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringForKey:", v8));

  if (!objc_msgSend(v9, "length")
    || (v10 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v9))) == 0
    || (v11 = (void *)v10,
        v12 = (NSURL *)objc_claimAutoreleasedReturnValue(-[CRLRemotePropertyList validateUserDefaultsDownloadURL:](self, "validateUserDefaultsDownloadURL:", v10)), v11, !v12))
  {
    v12 = self->_remoteURL;
  }
  v13 = objc_msgSend(objc_alloc((Class)NSMutableURLRequest), "initWithURL:", v12);
  objc_msgSend(v13, "setTimeoutInterval:", 20.0);
  objc_msgSend(v13, "setCachePolicy:", 1);
  objc_opt_class(self, v14);
  v16 = NSStringFromClass(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingString:", CFSTR("ETag")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringForKey:", v18));

  if (objc_msgSend(v19, "length"))
    objc_msgSend(v13, "setValue:forHTTPHeaderField:", v19, CFSTR("If-None-Match"));

  return v13;
}

- (void)processResponse:(id)a3 data:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  Class v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  Class v27;
  NSString *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "statusCode");
  v12 = v11;
  if (v11 == (id)304 || v11 == (id)200)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 86400.0));
    objc_opt_class(self, v15);
    v17 = NSStringFromClass(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingString:", CFSTR("NextUpdate")));
    objc_msgSend(v13, "setObject:forKey:", v14, v19);

    if (v12 == (id)200 && objc_msgSend(v9, "length"))
    {
      v32 = 0;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLRemotePropertyList deserializePropertyListData:error:](self, "deserializePropertyListData:error:", v9, &v32));
      v21 = v32;

      if (v20 && (objc_opt_class(NSDictionary, v22), (objc_opt_isKindOfClass(v20, v23) & 1) != 0))
      {
        -[CRLRemotePropertyList processPropertyList:](self, "processPropertyList:", v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allHeaderFields"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", CFSTR("Etag")));

        objc_opt_class(self, v26);
        v28 = NSStringFromClass(v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringByAppendingString:", CFSTR("ETag")));
        objc_msgSend(v13, "setObject:forKey:", v25, v30);

        self->_didUpdateAtLeastOnce = 1;
      }
      else
      {
        if (qword_10147E368 != -1)
          dispatch_once(&qword_10147E368, &stru_101260C08);
        v31 = off_1013D9068;
        if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
          sub_100E3898C(v31, v21);
      }

    }
    else
    {
      v21 = v10;
    }

    v10 = v21;
  }

}

- (id)deserializePropertyListData:(id)a3 error:(id *)a4
{
  return +[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", a3, 0, 0, a4);
}

- (void)processPropertyList:(id)a3
{
  id v4;
  void *v5;
  NSURL *localURL;
  void *v7;
  NSObject *accessQueue;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = v4;
  localURL = self->_localURL;
  if (localURL && (objc_msgSend(v4, "writeToURL:atomically:", localURL, 0) & 1) == 0)
  {
    if (qword_10147E368 != -1)
      dispatch_once(&qword_10147E368, &stru_101260C28);
    v7 = off_1013D9068;
    if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
      sub_100E38A78((void **)&self->_localURL, v7);
  }
  accessQueue = self->_accessQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10047D668;
  v10[3] = &unk_10122D3D8;
  v10[4] = self;
  v11 = v5;
  v9 = v5;
  dispatch_async(accessQueue, v10);

}

- (NSURL)remoteURL
{
  return self->_remoteURL;
}

- (NSURL)localURL
{
  return self->_localURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localURL, 0);
  objc_storeStrong((id *)&self->_remoteURL, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_checkQueue, 0);
  objc_storeStrong((id *)&self->_propertyList, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
