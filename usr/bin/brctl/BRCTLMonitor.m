@implementation BRCTLMonitor

- (BRCTLMonitor)init
{
  BRCTLMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BRCTLMonitor;
  result = -[BRCTLMonitor init](&v3, "init");
  if (result)
    result->_scopes = 7;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  +[NSProgress _removeSubscriber:](NSProgress, "_removeSubscriber:", self);
  v3.receiver = self;
  v3.super_class = (Class)BRCTLMonitor;
  -[BRCTLMonitor dealloc](&v3, "dealloc");
}

- (void)parseOption:(int)a3 arg:(const char *)a4
{
  NSNumber *v6;
  NSNumber *v7;
  NSNumber *requestedTime;
  NSNumber *v9;

  if (a3 > 111)
  {
    switch(a3)
    {
      case 'p':
        self->_isStaticGathering = 1;
        break;
      case 't':
        if (a4)
        {
          v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", atoi(a4));
          v7 = (NSNumber *)objc_claimAutoreleasedReturnValue(v6);
          requestedTime = self->_requestedTime;
          self->_requestedTime = v7;

        }
        else
        {
          v9 = self->_requestedTime;
          self->_requestedTime = 0;

        }
        break;
      case 'w':
        self->_waitForAllUploaded = 1;
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 'S':
        if (!strcasecmp(a4, "docs"))
          self->_scopes = 1;
        if (!strcasecmp(a4, "data"))
          self->_scopes = 2;
        if (!strcasecmp(a4, "ext"))
          self->_scopes = 4;
        break;
      case 'g':
        self->_isGlobal = 1;
        break;
      case 'i':
        self->_incremental = 1;
        break;
    }
  }
}

- (void)monitorGlobalActivity
{
  _QWORD *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[5];

  puts("monitoring global activity...");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008554;
  v7[3] = &unk_100024F48;
  v7[4] = self;
  v3 = objc_retainBlock(v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BRDaemonConnection mobileDocumentsURL](BRDaemonConnection, "mobileDocumentsURL"));
  v5 = +[NSProgress _addSubscriberForFileURL:withPublishingHandler:](NSProgress, "_addSubscriberForFileURL:withPublishingHandler:", v4, v3);

  while (1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
    objc_msgSend(v6, "run");

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  __CFString *v32;
  void *v33;
  unsigned int v34;
  objc_super v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v14 = objc_opt_class(NSProgress, v13);
  if ((objc_opt_isKindOfClass(v11, v14) & 1) != 0)
  {
    v15 = v11;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTLMonitor progressObserved](self, "progressObserved"));
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedAdditionalDescription"));
      v21 = objc_msgSend(v20, "length");

      if (v21)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedDescription"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedAdditionalDescription"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@)"), v22, v23));

      }
      else
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedDescription"));
      }
      v25 = objc_retainAutorelease(v24);
      v26 = objc_msgSend(v25, "UTF8String");
      objc_msgSend(v15, "fractionCompleted");
      objc_msgSend(v18, "appendFormat:", CFSTR("%-45s %5.1f%% "), v26, v27 * 100.0);

      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "userInfo"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", NSProgressFileTotalCountKey));
      objc_msgSend(v18, "appendFormat:", CFSTR("[fileCount: %@] "), v29);

      if (objc_msgSend(v15, "isFinished"))
        objc_msgSend(v19, "addObject:", CFSTR("finished"));
      if (objc_msgSend(v15, "isIndeterminate"))
        objc_msgSend(v19, "addObject:", CFSTR("indeterminate"));
      if (objc_msgSend(v15, "isCancelled"))
        objc_msgSend(v19, "addObject:", CFSTR("cancelled"));
      if (objc_msgSend(v15, "isPaused"))
        objc_msgSend(v19, "addObject:", CFSTR("paused"));
      if (objc_msgSend(v19, "count"))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "componentsJoinedByString:", CFSTR(", ")));
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%@]"), v30));

      }
      else
      {
        v31 = &stru_100026330;
      }
      v32 = objc_retainAutorelease(v31);
      objc_msgSend(v18, "appendFormat:", CFSTR("%-25s "), -[__CFString UTF8String](v32, "UTF8String"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[BRCTLMonitor previousDescription](self, "previousDescription"));
      v34 = objc_msgSend(v33, "isEqualToString:", v18);

      if (v34)
      {
        objc_msgSend(v18, "length");
        objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
        printf("%*s (%s)\n");
      }
      else
      {
        objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
        objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
        printf("%s (%s)\n");
      }
      -[BRCTLMonitor setPreviousDescription:](self, "setPreviousDescription:", v18);

    }
  }
  else
  {
    v35.receiver = self;
    v35.super_class = (Class)BRCTLMonitor;
    -[BRCTLMonitor observeValueForKeyPath:ofObject:change:context:](&v35, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (id)_prettyDescriptionFromError:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  __CFString *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  v5 = objc_msgSend(v4, "isEqualToString:", NSCocoaErrorDomain);

  if (!v5)
    goto LABEL_6;
  if (objc_msgSend(v3, "code") != (id)4354)
  {
    if (objc_msgSend(v3, "code") == (id)4355)
    {
      v6 = CFSTR("offline");
      goto LABEL_7;
    }
LABEL_6:
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));
    goto LABEL_7;
  }
  v6 = CFSTR("pending-quota");
LABEL_7:

  return v6;
}

- (void)_checkIfQueryShouldStop:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  int v12;
  const char *v13;

  v4 = a3;
  v5 = brc_bread_crumbs("-[BRCTLMonitor _checkIfQueryShouldStop:]", 223);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = brc_default_log(1);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_100017028((uint64_t)v6, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v9, "timeIntervalSinceDate:", self->_startDate);
  v11 = v10;

  if (self->_allUploaded && self->_waitForAllUploaded && self->_gatheringFinished)
  {
    v12 = 0;
    v13 = "Stopping the query because all items are now uploaded";
LABEL_10:
    puts(v13);
    -[NSMetadataQuery stopQuery](self->_currentWatchedQuery, "stopQuery");
    objc_msgSend(v4, "invalidate");
    exit(v12);
  }
  if (v11 > (double)-[NSNumber unsignedLongLongValue](self->_requestedTime, "unsignedLongLongValue"))
  {
    v12 = 1;
    v13 = "Stopping the query since the specified time has elapsed";
    goto LABEL_10;
  }

}

- (void)monitorQuery:(id)a3 rootPath:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSDate *v13;
  NSDate *startDate;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  _QWORD *v21;
  void *v22;
  _QWORD *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  NSNumber *requestedTime;
  _QWORD v35[7];
  _QWORD v36[5];
  _QWORD v37[10];
  uint8_t buf[4];
  NSNumber *v39;
  __int16 v40;
  void *v41;
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(objc_alloc((Class)BRCTermDumper), "initWithFd:forceColor:", 1, 0);
  v10 = objc_alloc_init((Class)NSOperationQueue);
  objc_msgSend(v10, "setMaxConcurrentOperationCount:", 1);
  objc_msgSend(v7, "_setExternalDocumentsBundleIdentifier:", 0);
  objc_msgSend(v7, "setOperationQueue:", v10);
  objc_storeStrong((id *)&self->_currentWatchedQuery, a3);
  v44[0] = NSMetadataUbiquitousItemDownloadingStatusNotDownloaded;
  v44[1] = NSMetadataUbiquitousItemDownloadingStatusDownloaded;
  v45[0] = CFSTR("not downloaded");
  v45[1] = CFSTR("server edit to download");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v45, v44, 2));
  v42[0] = NSMetadataUbiquitousSharedItemPermissionsReadOnly;
  v42[1] = NSMetadataUbiquitousSharedItemPermissionsReadWrite;
  v43[0] = CFSTR("r");
  v43[1] = CFSTR("rw");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 2));
  v13 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  startDate = self->_startDate;
  self->_startDate = v13;

  v15 = objc_retainAutorelease(v8);
  v16 = objc_msgSend(v15, "fileSystemRepresentation");
  v17 = BRCPrettyPrintBitmap(self->_scopes, &unk_100024EF0);
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v17));
  objc_msgSend(v9, "write:", "observing in %s for the %s scope(s)\n", v16, objc_msgSend(v18, "UTF8String"));

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000090D8;
  v37[3] = &unk_100024F70;
  v19 = v7;
  v37[4] = v19;
  v20 = v9;
  v37[5] = v20;
  v37[6] = self;
  v37[7] = v15;
  v37[8] = v11;
  v37[9] = v12;
  v21 = objc_retainBlock(v37);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100009F14;
  v36[3] = &unk_100024F98;
  v23 = v21;
  v36[4] = v23;
  v24 = objc_msgSend(v22, "addObserverForName:object:queue:usingBlock:", NSMetadataQueryDidUpdateNotification, v19, v10, v36);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100009F5C;
  v35[3] = &unk_100024FC0;
  v35[4] = self;
  v35[6] = v23;
  v35[5] = v20;
  v26 = objc_msgSend(v25, "addObserverForName:object:queue:usingBlock:", NSMetadataQueryDidFinishGatheringNotification, v19, v10, v35);

  if (!objc_msgSend(v19, "startQuery"))
    errx(1, "can't start query");
  while (1)
  {
    if (self->_requestedTime)
    {
      v27 = brc_bread_crumbs("-[BRCTLMonitor monitorQuery:rootPath:]", 483);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v29 = brc_default_log(1);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        requestedTime = self->_requestedTime;
        *(_DWORD *)buf = 138412546;
        v39 = requestedTime;
        v40 = 2112;
        v41 = v28;
        _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] The user has requested to run the query for %@%@", buf, 0x16u);
      }

    }
    else if (!self->_waitForAllUploaded)
    {
      goto LABEL_8;
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "timerWithTimeInterval:target:selector:userInfo:repeats:", self, "_checkIfQueryShouldStop:", 0, 1, 1.0));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
    objc_msgSend(v32, "addTimer:forMode:", v31, NSRunLoopCommonModes);

LABEL_8:
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
    objc_msgSend(v33, "run");

  }
}

- (int)scopes
{
  return self->_scopes;
}

- (void)setScopes:(int)a3
{
  self->_scopes = a3;
}

- (BOOL)isGlobal
{
  return self->_isGlobal;
}

- (NSProgress)progressObserved
{
  return (NSProgress *)objc_loadWeakRetained((id *)&self->_progressObserved);
}

- (void)setProgressObserved:(id)a3
{
  objc_storeWeak((id *)&self->_progressObserved, a3);
}

- (NSString)previousDescription
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPreviousDescription:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousDescription, 0);
  objc_destroyWeak((id *)&self->_progressObserved);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_currentWatchedQuery, 0);
  objc_storeStrong((id *)&self->_requestedTime, 0);
}

@end
