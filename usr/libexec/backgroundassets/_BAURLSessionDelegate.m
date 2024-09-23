@implementation _BAURLSessionDelegate

- (_BAURLSessionDelegate)initWithNotifyQueue:(id)a3 withDestinationDirectory:(id)a4 uniqueFileName:(BOOL)a5 inBackground:(BOOL)a6 withAuthenticationHandler:(id)a7 withRedirectResponseHandler:(id)a8 withBytesReceivedHandler:(id)a9 usingBlock:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _BAURLSessionDelegate *v22;
  OS_dispatch_queue *v23;
  NSObject *notifyQueue;
  qos_class_t v25;
  dispatch_queue_attr_t v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *v28;
  NSString *v29;
  NSString *destinationDirectory;
  id v31;
  id notifyBlock;
  id v33;
  id challengeBlock;
  id v35;
  id redirectResponseBlock;
  id v37;
  id bytesReceivedBlock;
  objc_super v40;

  v16 = a3;
  v17 = a4;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v40.receiver = self;
  v40.super_class = (Class)_BAURLSessionDelegate;
  v22 = -[_BAURLSessionDelegate init](&v40, "init");
  if (v22)
  {
    if (v16)
    {
      v23 = (OS_dispatch_queue *)v16;
      notifyQueue = v22->_notifyQueue;
      v22->_notifyQueue = v23;
    }
    else
    {
      v25 = qos_class_self();
      v26 = dispatch_queue_attr_make_with_qos_class(0, v25, 0);
      notifyQueue = objc_claimAutoreleasedReturnValue(v26);
      v27 = dispatch_queue_create("com.apple.BackgroundAssets.BAURLSession.DefaultNotifyQueue", notifyQueue);
      v28 = v22->_notifyQueue;
      v22->_notifyQueue = (OS_dispatch_queue *)v27;

    }
    v22->_stateLock._os_unfair_lock_opaque = 0;
    v29 = (NSString *)objc_msgSend(v17, "copy");
    destinationDirectory = v22->_destinationDirectory;
    v22->_destinationDirectory = v29;

    v22->_uniqueFileName = a5;
    v31 = objc_msgSend(v21, "copy");
    notifyBlock = v22->_notifyBlock;
    v22->_notifyBlock = v31;

    v33 = objc_msgSend(v18, "copy");
    challengeBlock = v22->_challengeBlock;
    v22->_challengeBlock = v33;

    v35 = objc_msgSend(v19, "copy");
    redirectResponseBlock = v22->_redirectResponseBlock;
    v22->_redirectResponseBlock = v35;

    v37 = objc_msgSend(v20, "copy");
    bytesReceivedBlock = v22->_bytesReceivedBlock;
    v22->_bytesReceivedBlock = v37;

    v22->_inBackground = a6;
  }

  return v22;
}

- (void)cancel
{
  os_unfair_lock_s *p_stateLock;
  void *v4;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSURLErrorDomain, -999, 0));
  -[_BAURLSessionDelegate setMostRecentError:](self, "setMostRecentError:", v4);

  os_unfair_lock_unlock(p_stateLock);
}

- (void)cancelWithResumeData:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSURLErrorDomain, -999, 0));
  -[_BAURLSessionDelegate setMostRecentError:](self, "setMostRecentError:", v4);

  -[_BAURLSessionDelegate setResumeData:](self, "setResumeData:", v5);
  os_unfair_lock_unlock(&self->_stateLock);

}

- (void)installConnectivityTimerWithTimeout:(double)a3 task:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_time_t v11;
  id v12;
  NSObject *v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  _BAURLSessionDelegate *v18;
  NSObject *v19;
  id v20;
  double v21;

  v6 = a4;
  os_unfair_lock_lock(&self->_stateLock);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate awaitingConnectivityTimer](self, "awaitingConnectivityTimer"));

  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate awaitingConnectivityTimer](self, "awaitingConnectivityTimer"));
    dispatch_source_cancel(v8);

    -[_BAURLSessionDelegate setAwaitingConnectivityTimer:](self, "setAwaitingConnectivityTimer:", 0);
  }
  v9 = dispatch_queue_create("com.apple.BAURLSession.TimeOutQueue", 0);
  v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v9);
  v11 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_10000F090;
  v17 = &unk_100058C48;
  v18 = self;
  v19 = v10;
  v20 = v6;
  v21 = a3;
  v12 = v6;
  v13 = v10;
  dispatch_source_set_event_handler(v13, &v14);
  -[_BAURLSessionDelegate setAwaitingConnectivityTimeout:](self, "setAwaitingConnectivityTimeout:", a3, v14, v15, v16, v17, v18);
  -[_BAURLSessionDelegate setAwaitingConnectivityTimer:](self, "setAwaitingConnectivityTimer:", v13);
  dispatch_resume(v13);
  os_unfair_lock_unlock(&self->_stateLock);

}

- (id)_combineExistingError:(id)a3 newError:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v5 = a4;
  v6 = v5;
  if (a3)
  {
    v7 = a3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
    v9 = objc_msgSend(v8, "mutableCopy");

    if (v6)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, NSUnderlyingErrorKey);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
    v11 = objc_msgSend(v7, "code");

    v12 = objc_msgSend(v9, "copy");
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v10, v11, v12));

  }
  else
  {
    v13 = v5;
  }

  return v13;
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *notifyQueue;
  id v27;
  _QWORD block[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v27 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_stateLock);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate awaitingConnectivityTimer](self, "awaitingConnectivityTimer"));

  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate awaitingConnectivityTimer](self, "awaitingConnectivityTimer"));
    dispatch_source_cancel(v8);

    -[_BAURLSessionDelegate setAwaitingConnectivityTimer:](self, "setAwaitingConnectivityTimer:", 0);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate mostRecentError](self, "mostRecentError"));
  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate mostRecentError](self, "mostRecentError"));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate mostRecentError](self, "mostRecentError"));
      if (!v11)
      {
LABEL_8:

        goto LABEL_9;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate mostRecentError](self, "mostRecentError"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userInfo"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", NSUnderlyingErrorKey));

      if (v14)
        goto LABEL_9;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate mostRecentError](self, "mostRecentError"));
    v15 = objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate _combineExistingError:newError:](self, "_combineExistingError:newError:", v10, v6));

    v9 = (void *)v15;
    goto LABEL_8;
  }
LABEL_9:
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate data](self, "data"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate response](self, "response"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate resumeData](self, "resumeData"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate fileHandle](self, "fileHandle"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate fileHandle](self, "fileHandle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "filePath"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v21));

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate fileHandle](self, "fileHandle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "handle"));
    v34 = 0;
    objc_msgSend(v24, "synchronizeAndReturnError:", &v34);
    v25 = v34;

    -[_BAURLSessionDelegate setFileHandle:](self, "setFileHandle:", 0);
  }
  else
  {
    v22 = 0;
  }
  if (self->_notifyBlock)
  {
    notifyQueue = self->_notifyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000F5E0;
    block[3] = &unk_100058C70;
    block[4] = self;
    v29 = v22;
    v30 = v16;
    v31 = v17;
    v32 = v18;
    v33 = v9;
    dispatch_async(notifyQueue, block);

  }
  os_unfair_lock_unlock(&self->_stateLock);

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a4;
  v8 = a5;
  v9 = a3;
  os_unfair_lock_lock(&self->_stateLock);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "response"));
  -[_BAURLSessionDelegate setResponse:](self, "setResponse:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate awaitingConnectivityTimer](self, "awaitingConnectivityTimer"));
  if (v11)
  {
    v12 = objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate awaitingConnectivityTimer](self, "awaitingConnectivityTimer"));
    dispatch_source_cancel(v12);

    -[_BAURLSessionDelegate setAwaitingConnectivityTimer:](self, "setAwaitingConnectivityTimer:", 0);
  }
  if (v8)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate mostRecentError](self, "mostRecentError"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate _combineExistingError:newError:](self, "_combineExistingError:newError:", v13, v8));
    -[_BAURLSessionDelegate setMostRecentError:](self, "setMostRecentError:", v14);

    v16 = objc_opt_class(NSURLSessionDownloadTask, v15);
    if ((objc_opt_isKindOfClass(v19, v16) & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", NSURLSessionDownloadTaskResumeData));

      if (v18)
        -[_BAURLSessionDelegate setResumeData:](self, "setResumeData:", v18);

    }
  }
  os_unfair_lock_unlock(&self->_stateLock);
  objc_msgSend(v9, "finishTasksAndInvalidate");

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  uint64_t v14;
  uint64_t v15;
  NSString *v16;
  uint64_t v17;
  os_unfair_lock_s *p_stateLock;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void (**v35)(id, _QWORD);
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  BAFileHandle *v40;
  void *v41;
  os_unfair_lock_t lock;
  id v43;
  id v44;
  id v45;
  stat v46;
  _QWORD v47[3];
  _QWORD v48[3];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD))a6;
  v15 = objc_opt_class(NSHTTPURLResponse, v14);
  if ((objc_opt_isKindOfClass(v12, v15) & 1) != 0)
  {
    v16 = (NSString *)v12;
    v17 = (uint64_t)-[NSString statusCode](v16, "statusCode");
    if (v17 >= 400)
    {
      v31 = v17;
      v45 = v10;
      os_unfair_lock_lock(&self->_stateLock);
      -[_BAURLSessionDelegate setResponse:](self, "setResponse:", v16);
      v47[0] = NSURLErrorFailingURLStringErrorKey;
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSString URL](v16, "URL"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "absoluteString"));
      v48[0] = v33;
      v47[1] = CFSTR("ResponseStatusCode");
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v31));
      v48[1] = v34;
      v47[2] = CFSTR("ResponseHTTPHeaders");
      v35 = v13;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSString allHeaderFields](v16, "allHeaderFields"));
      v48[2] = v36;
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v47, 3));

      v13 = v35;
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BAURLSessionErrorDomain"), 100, v37));
      -[_BAURLSessionDelegate setMostRecentError:](self, "setMostRecentError:", v38);

      v10 = v45;
      os_unfair_lock_unlock(&self->_stateLock);
      v13[2](v13, 0);

      goto LABEL_20;
    }

  }
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  -[_BAURLSessionDelegate setResponse:](self, "setResponse:", v12);
  -[_BAURLSessionDelegate setFullDownloadSize:](self, "setFullDownloadSize:", objc_msgSend(v12, "expectedContentLength"));
  v16 = self->_destinationDirectory;
  if (v16)
  {
    lock = &self->_stateLock;
    v43 = v12;
    v44 = v10;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentRequest"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "URL"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastPathComponent"));
    v22 = (id)v21;
    while (1)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](v16, "stringByAppendingPathComponent:", v21));

      v24 = -[_BAURLSessionDelegate uniqueFileName](self, "uniqueFileName") ? 3586 : 1538;
      v22 = objc_retainAutorelease(v23);
      v25 = open((const char *)objc_msgSend(v22, "fileSystemRepresentation"), v24, 420);
      if ((v25 & 0x80000000) == 0)
        break;
      if (*__error() != 17 || !-[_BAURLSessionDelegate uniqueFileName](self, "uniqueFileName"))
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BAURLSessionErrorDomain"), 101, 0));
        -[_BAURLSessionDelegate setMostRecentError:](self, "setMostRecentError:", v29);

        os_unfair_lock_unlock(lock);
        v13[2](v13, 0);
        v10 = v44;
LABEL_14:
        v12 = v43;

        goto LABEL_20;
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "UUIDString"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "substringToIndex:", 8));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BAUnique-%@"), v28));

      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByAppendingPathExtension:", CFSTR("dat")));
      v20 = (void *)v21;
    }
    v39 = v25;
    memset(&v46, 0, sizeof(v46));
    v10 = v44;
    if (fstat(v25, &v46) < 0)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BAURLSessionErrorDomain"), 102, 0));
      -[_BAURLSessionDelegate setMostRecentError:](self, "setMostRecentError:", v41);

      os_unfair_lock_unlock(lock);
      close(v39);
      v13[2](v13, 0);
      goto LABEL_14;
    }
    v40 = -[BAFileHandle initWithFileDescriptor:originalPath:closeOnDealloc:]([BAFileHandle alloc], "initWithFileDescriptor:originalPath:closeOnDealloc:", v39, v22, 1);
    -[_BAURLSessionDelegate setFileHandle:](self, "setFileHandle:", v40);

    v12 = v43;
    p_stateLock = &self->_stateLock;
  }
  else
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
    -[_BAURLSessionDelegate setData:](self, "setData:", v30);

  }
  os_unfair_lock_unlock(p_stateLock);
  v13[2](v13, 1);
LABEL_20:

}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v8;
  id v9;
  NSString *v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  unsigned __int8 v23;
  id v24;
  const char *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  BAFileHandle *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSString *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  stat v61;
  id v62;
  NSErrorUserInfoKey v63;
  void *v64;
  NSErrorUserInfoKey v65;
  id v66;
  _QWORD v67[3];
  _QWORD v68[3];

  v57 = a3;
  v8 = a4;
  v9 = a5;
  v58 = v8;
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "response"));
  os_unfair_lock_lock(&self->_stateLock);
  -[_BAURLSessionDelegate setResponse:](self, "setResponse:", v59);
  v10 = self->_destinationDirectory;
  v11 = -[_BAURLSessionDelegate uniqueFileName](self, "uniqueFileName");
  v13 = objc_opt_class(NSHTTPURLResponse, v12);
  if ((objc_opt_isKindOfClass(v59, v13) & 1) != 0)
  {
    v14 = v59;
    v15 = (uint64_t)objc_msgSend(v14, "statusCode");
    if (v15 >= 400)
    {
      v37 = v15;
      v56 = v10;
      v67[0] = NSURLErrorFailingURLStringErrorKey;
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "URL"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "absoluteString"));
      v68[0] = v39;
      v67[1] = CFSTR("ResponseStatusCode");
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v37));
      v68[1] = v40;
      v67[2] = CFSTR("ResponseHTTPHeaders");
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allHeaderFields"));
      v68[2] = v41;
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v68, v67, 3));

      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BAURLSessionErrorDomain"), 100, v42));
      -[_BAURLSessionDelegate setMostRecentError:](self, "setMostRecentError:", v43);

      os_unfair_lock_unlock(&self->_stateLock);
      goto LABEL_30;
    }

  }
  os_unfair_lock_unlock(&self->_stateLock);
  if (!v9 || !v10)
  {
    if (v9)
    {
      v60 = 0;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v9, 8, &v60));
      v35 = v60;
      if (v34)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        objc_msgSend(v36, "removeItemAtURL:error:", v9, 0);

        os_unfair_lock_lock(&self->_stateLock);
        -[_BAURLSessionDelegate setData:](self, "setData:", v34);
      }
      else
      {
        os_unfair_lock_lock(&self->_stateLock);
        -[_BAURLSessionDelegate setMostRecentError:](self, "setMostRecentError:", v35);
      }
      os_unfair_lock_unlock(&self->_stateLock);

    }
    else
    {
      os_unfair_lock_lock(&self->_stateLock);
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BAURLSessionErrorDomain"), 105, 0));
      -[_BAURLSessionDelegate setMostRecentError:](self, "setMostRecentError:", v51);

      os_unfair_lock_unlock(&self->_stateLock);
    }
    goto LABEL_31;
  }
  v56 = v10;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "currentRequest"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "URL"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastPathComponent"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](v56, "stringByAppendingPathComponent:", v18));

  while (1)
  {
    while (1)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v21 = objc_msgSend(v20, "fileExistsAtPath:", v19);

      if (!v21)
        goto LABEL_11;
      if (!v11)
        break;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "UUIDString"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "substringToIndex:", 8));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BAUnique-%@"), v30));

      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stringByAppendingPathExtension:", CFSTR("dat")));
      v33 = objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](v56, "stringByAppendingPathComponent:", v32));

      v19 = (void *)v33;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v62 = 0;
    v23 = objc_msgSend(v22, "removeItemAtPath:error:", v19, &v62);
    v24 = v62;

    if ((v23 & 1) == 0)
    {
      os_unfair_lock_lock(&self->_stateLock);
      v65 = NSUnderlyingErrorKey;
      v66 = v24;
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1));
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BAURLSessionErrorDomain"), 104, v52));
      -[_BAURLSessionDelegate setMostRecentError:](self, "setMostRecentError:", v53);

      os_unfair_lock_unlock(&self->_stateLock);
      goto LABEL_29;
    }

LABEL_11:
    v25 = (const char *)objc_msgSend(objc_retainAutorelease(v9), "fileSystemRepresentation");
    v26 = objc_retainAutorelease(v19);
    if (!renamex_np(v25, (const char *)objc_msgSend(v26, "fileSystemRepresentation"), 4u))
      break;
    v27 = *__error();
    if ((_DWORD)v27 != 17)
    {
      os_unfair_lock_lock(&self->_stateLock);
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v27, 0));
      v63 = NSUnderlyingErrorKey;
      v64 = v48;
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1));
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BAURLSessionErrorDomain"), 103, v49));
      -[_BAURLSessionDelegate setMostRecentError:](self, "setMostRecentError:", v50);

      goto LABEL_28;
    }
  }
  v44 = objc_retainAutorelease(v26);
  v45 = open((const char *)objc_msgSend(v44, "fileSystemRepresentation"), 0, 420);
  v46 = v45;
  if ((v45 & 0x80000000) != 0)
  {
    os_unfair_lock_lock(&self->_stateLock);
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BAURLSessionErrorDomain"), 101, 0));
    -[_BAURLSessionDelegate setMostRecentError:](self, "setMostRecentError:", v54);

  }
  else
  {
    memset(&v61, 0, sizeof(v61));
    if ((fstat(v45, &v61) & 0x80000000) == 0)
    {
      os_unfair_lock_lock(&self->_stateLock);
      v47 = -[BAFileHandle initWithFileDescriptor:originalPath:closeOnDealloc:]([BAFileHandle alloc], "initWithFileDescriptor:originalPath:closeOnDealloc:", v46, v44, 1);
      -[_BAURLSessionDelegate setFileHandle:](self, "setFileHandle:", v47);

      os_unfair_lock_unlock(&self->_stateLock);
      goto LABEL_30;
    }
    close(v46);
    os_unfair_lock_lock(&self->_stateLock);
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BAURLSessionErrorDomain"), 102, 0));
    -[_BAURLSessionDelegate setMostRecentError:](self, "setMostRecentError:", v55);

  }
LABEL_28:
  os_unfair_lock_unlock(&self->_stateLock);
LABEL_29:

LABEL_30:
  v10 = v56;
LABEL_31:

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int64_t v17;
  NSObject *notifyQueue;
  _QWORD v19[8];

  v6 = a5;
  os_unfair_lock_lock(&self->_stateLock);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate awaitingConnectivityTimer](self, "awaitingConnectivityTimer"));

  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate awaitingConnectivityTimer](self, "awaitingConnectivityTimer"));
    dispatch_source_cancel(v8);

    -[_BAURLSessionDelegate setAwaitingConnectivityTimer:](self, "setAwaitingConnectivityTimer:", 0);
  }
  v9 = objc_msgSend(v6, "length");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate fileHandle](self, "fileHandle"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate fileHandle](self, "fileHandle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "handle"));
    objc_msgSend(v12, "writeData:", v6);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate fileHandle](self, "fileHandle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "handle"));
    v15 = objc_msgSend(v14, "offsetInFile");

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate data](self, "data"));
    objc_msgSend(v16, "appendData:", v6);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate data](self, "data"));
    v15 = objc_msgSend(v13, "length");
  }

  v17 = -[_BAURLSessionDelegate fullDownloadSize](self, "fullDownloadSize");
  os_unfair_lock_unlock(&self->_stateLock);
  if (self->_bytesReceivedBlock)
  {
    notifyQueue = self->_notifyQueue;
    if (notifyQueue)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10001056C;
      v19[3] = &unk_100058C98;
      v19[4] = self;
      v19[5] = v9;
      v19[6] = v15;
      v19[7] = v17;
      dispatch_async(notifyQueue, v19);
    }
  }

}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  os_unfair_lock_s *p_stateLock;
  void *v12;
  NSObject *v13;
  NSObject *notifyQueue;
  _QWORD v15[8];

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate awaitingConnectivityTimer](self, "awaitingConnectivityTimer"));

  if (v12)
  {
    v13 = objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate awaitingConnectivityTimer](self, "awaitingConnectivityTimer"));
    dispatch_source_cancel(v13);

    -[_BAURLSessionDelegate setAwaitingConnectivityTimer:](self, "setAwaitingConnectivityTimer:", 0);
  }
  os_unfair_lock_unlock(p_stateLock);
  if (self->_bytesReceivedBlock)
  {
    notifyQueue = self->_notifyQueue;
    if (notifyQueue)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100010688;
      v15[3] = &unk_100058C98;
      v15[4] = self;
      v15[5] = a5;
      v15[6] = a6;
      v15[7] = a7;
      dispatch_async(notifyQueue, v15);
    }
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didResumeAtOffset:(int64_t)a5 expectedTotalBytes:(int64_t)a6
{
  NSObject *notifyQueue;
  _QWORD block[7];

  if (self->_bytesReceivedBlock)
  {
    notifyQueue = self->_notifyQueue;
    if (notifyQueue)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100010730;
      block[3] = &unk_100058CC0;
      block[4] = self;
      block[5] = a5;
      block[6] = a6;
      dispatch_async(notifyQueue, block);
    }
  }
}

- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a4;
  v5 = sub_100012A44();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "BAURLSession: Task %{public}@ is awaiting connectivity.", (uint8_t *)&v7, 0xCu);
  }

}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, void *);
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void (**challengeBlock)(id, id, _QWORD *);
  id v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  void (**v26)(id, uint64_t, void *);
  id v27[2];
  id location;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, void *))a5;
  v11 = objc_autoreleasePoolPush();
  if (!self->_challengeBlock)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "protectionSpace"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "authenticationMethod"));
    if (objc_msgSend(v17, "isEqualToString:", NSURLAuthenticationMethodServerTrust))
    {
      v18 = objc_msgSend(v9, "previousFailureCount");

      if (!v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "protectionSpace"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", objc_msgSend(v19, "serverTrust")));

        goto LABEL_13;
      }
    }
    else
    {

    }
    if (objc_msgSend(v9, "previousFailureCount"))
    {
      v20 = 0;
      v23 = 1;
LABEL_14:
      v10[2](v10, v23, v20);

      goto LABEL_15;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "proposedCredential"));
LABEL_13:
    v23 = 0;
    goto LABEL_14;
  }
  os_unfair_lock_lock(&self->_stateLock);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate awaitingConnectivityTimer](self, "awaitingConnectivityTimer"));

  if (v12)
  {
    v13 = objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate awaitingConnectivityTimer](self, "awaitingConnectivityTimer"));
    dispatch_suspend(v13);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_BAURLSessionDelegate awaitingConnectivityTimer](self, "awaitingConnectivityTimer"));
    -[_BAURLSessionDelegate awaitingConnectivityTimeout](self, "awaitingConnectivityTimeout");
    v15 = v14;
    -[_BAURLSessionDelegate setAwaitingConnectivityTimer:](self, "setAwaitingConnectivityTimer:", 0);
  }
  else
  {
    v15 = 0;
  }
  os_unfair_lock_unlock(&self->_stateLock);
  objc_initWeak(&location, self);
  challengeBlock = (void (**)(id, id, _QWORD *))self->_challengeBlock;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100010AA0;
  v24[3] = &unk_100058CE8;
  objc_copyWeak(v27, &location);
  v22 = v12;
  v25 = v22;
  v27[1] = v15;
  v26 = v10;
  challengeBlock[2](challengeBlock, v9, v24);

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);

LABEL_15:
  objc_autoreleasePoolPop(v11);

}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(_QWORD, _QWORD);
  NSObject *notifyQueue;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void (**)(_QWORD, _QWORD))v16;
  if (self->_redirectResponseBlock)
  {
    notifyQueue = self->_notifyQueue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100010CE4;
    v20[3] = &unk_100058D10;
    v23 = v16;
    v20[4] = self;
    v21 = v15;
    v22 = v14;
    dispatch_async(notifyQueue, v20);

  }
  else
  {
    v19 = objc_autoreleasePoolPush();
    ((void (**)(_QWORD, id))v17)[2](v17, v15);
    objc_autoreleasePoolPop(v19);
  }

}

- (NSURLResponse)response
{
  return (NSURLResponse *)objc_getProperty(self, a2, 72, 1);
}

- (void)setResponse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSMutableData)data
{
  return (NSMutableData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BAFileHandle)fileHandle
{
  return (BAFileHandle *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFileHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BOOL)uniqueFileName
{
  return self->_uniqueFileName;
}

- (void)setUniqueFileName:(BOOL)a3
{
  self->_uniqueFileName = a3;
}

- (int64_t)fullDownloadSize
{
  return self->_fullDownloadSize;
}

- (void)setFullDownloadSize:(int64_t)a3
{
  self->_fullDownloadSize = a3;
}

- (NSData)resumeData
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setResumeData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSError)mostRecentError
{
  return self->_mostRecentError;
}

- (void)setMostRecentError:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentError, a3);
}

- (BOOL)taskCompleted
{
  return self->_taskCompleted;
}

- (void)setTaskCompleted:(BOOL)a3
{
  self->_taskCompleted = a3;
}

- (BOOL)inBackground
{
  return self->_inBackground;
}

- (void)setInBackground:(BOOL)a3
{
  self->_inBackground = a3;
}

- (OS_dispatch_source)awaitingConnectivityTimer
{
  return self->_awaitingConnectivityTimer;
}

- (void)setAwaitingConnectivityTimer:(id)a3
{
  objc_storeStrong((id *)&self->_awaitingConnectivityTimer, a3);
}

- (double)awaitingConnectivityTimeout
{
  return self->_awaitingConnectivityTimeout;
}

- (void)setAwaitingConnectivityTimeout:(double)a3
{
  self->_awaitingConnectivityTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_awaitingConnectivityTimer, 0);
  objc_storeStrong((id *)&self->_mostRecentError, 0);
  objc_storeStrong((id *)&self->_resumeData, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong(&self->_bytesReceivedBlock, 0);
  objc_storeStrong(&self->_redirectResponseBlock, 0);
  objc_storeStrong(&self->_challengeBlock, 0);
  objc_storeStrong(&self->_notifyBlock, 0);
  objc_storeStrong((id *)&self->_destinationDirectory, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
}

@end
