@implementation BAURLSession

- (BAURLSession)init
{

  return 0;
}

- (BAURLSession)initWithURLRequest:(id)a3 withDestinationDirectory:(id)a4 inBackground:(BOOL)a5
{
  return -[BAURLSession initWithURLRequest:withDestinationDirectory:inBackground:withAuthenticationHandler:withRedirectResponseHandler:](self, "initWithURLRequest:withDestinationDirectory:inBackground:withAuthenticationHandler:withRedirectResponseHandler:", a3, a4, a5, 0, 0);
}

- (BAURLSession)initWithURLRequest:(id)a3 withDestinationDirectory:(id)a4 inBackground:(BOOL)a5 withAuthenticationHandler:(id)a6
{
  return -[BAURLSession initWithURLRequest:withDestinationDirectory:inBackground:withAuthenticationHandler:withRedirectResponseHandler:](self, "initWithURLRequest:withDestinationDirectory:inBackground:withAuthenticationHandler:withRedirectResponseHandler:", a3, a4, a5, a6, 0);
}

- (BAURLSession)initWithURLRequest:(id)a3 withDestinationDirectory:(id)a4 inBackground:(BOOL)a5 withAuthenticationHandler:(id)a6 withRedirectResponseHandler:(id)a7
{
  return (BAURLSession *)-[BAURLSession _initWithURLRequest:withResumeData:withDestinationDirectory:inBackground:withAuthenticationHandler:withRedirectResponseHandler:](self, "_initWithURLRequest:withResumeData:withDestinationDirectory:inBackground:withAuthenticationHandler:withRedirectResponseHandler:", a3, 0, a4, a5, a6, a7);
}

- (BAURLSession)initWithResumeData:(id)a3 withDestinationDirectory:(id)a4 inBackground:(BOOL)a5 withAuthenticationHandler:(id)a6 withRedirectResponseHandler:(id)a7
{
  return (BAURLSession *)-[BAURLSession _initWithURLRequest:withResumeData:withDestinationDirectory:inBackground:withAuthenticationHandler:withRedirectResponseHandler:](self, "_initWithURLRequest:withResumeData:withDestinationDirectory:inBackground:withAuthenticationHandler:withRedirectResponseHandler:", 0, a3, a4, a5, a6, a7);
}

- (id)_initWithURLRequest:(id)a3 withResumeData:(id)a4 withDestinationDirectory:(id)a5 inBackground:(BOOL)a6 withAuthenticationHandler:(id)a7 withRedirectResponseHandler:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  BAURLSession *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  void *v34;
  uint64_t v35;
  NSString *destinationDirectory;
  id v37;
  void *v38;
  uint64_t v39;
  NSString *v40;
  id v41;
  NSObject *v42;
  NSLock *v43;
  NSLock *connectionLock;
  id v45;
  id challengeBlock;
  id v47;
  id redirectResponseBlock;
  id v50;
  BOOL v51;
  id v52;
  id v53;
  id v54;
  id v55;
  unsigned __int8 v56;
  objc_super v57;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v57.receiver = self;
  v57.super_class = (Class)BAURLSession;
  v21 = -[BAURLSession init](&v57, "init");
  if (v21)
  {
    v22 = objc_opt_class(NSURL, v20);
    if ((objc_opt_isKindOfClass(v17, v22) & 1) != 0)
    {
      v51 = a6;
      v52 = a4;
      v53 = v16;
      v54 = v15;
      if ((objc_msgSend(v17, "isFileURL") & 1) == 0)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, CFSTR("Destination directory must be a file URL."), 0));
        objc_msgSend(v23, "raise");

      }
      v56 = 0;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "path"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stringByStandardizingPath"));
      v27 = objc_msgSend(v24, "fileExistsAtPath:isDirectory:", v26, &v56);
      v28 = v56;

      if (!v27 || v28)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "path"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stringByStandardizingPath"));
        v55 = 0;
        v33 = objc_msgSend(v30, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v32, 1, 0, &v55);
        v50 = v55;

        if ((v33 & 1) != 0)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "path"));
          v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "stringByStandardizingPath"));
          destinationDirectory = v21->_destinationDirectory;
          v21->_destinationDirectory = (NSString *)v35;

          v16 = v53;
          v15 = v54;
          a4 = v52;
        }
        else
        {
          v37 = sub_100017F60();
          v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
          v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "stringByAppendingPathComponent:", CFSTR("BAURLSessionStaging")));
          v40 = v21->_destinationDirectory;
          v21->_destinationDirectory = (NSString *)v39;

          v41 = sub_100012A44();
          v42 = objc_claimAutoreleasedReturnValue(v41);
          a4 = v52;
          v16 = v53;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            sub_1000357FC((uint64_t)v50, v42);

          v15 = v54;
        }
        a6 = v51;
        v29 = v50;
      }
      else
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, CFSTR("Destination directory must exist and be a valid directory."), 0));
        objc_msgSend(v29, "raise");
        v16 = v53;
        v15 = v54;
        a4 = v52;
        a6 = v51;
      }

    }
    v43 = objc_opt_new(NSLock);
    connectionLock = v21->_connectionLock;
    v21->_connectionLock = v43;

    objc_storeStrong((id *)&v21->_urlRequest, a3);
    v45 = objc_msgSend(v18, "copy");
    challengeBlock = v21->_challengeBlock;
    v21->_challengeBlock = v45;

    v47 = objc_msgSend(v19, "copy");
    redirectResponseBlock = v21->_redirectResponseBlock;
    v21->_redirectResponseBlock = v47;

    v21->_inBackground = a6;
    objc_storeStrong((id *)&v21->_resumeData, a4);
  }

  return v21;
}

- (void)invalidate
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLSession connectionLock](self, "connectionLock"));
  objc_msgSend(v3, "lock");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLSession urlSession](self, "urlSession"));
  objc_msgSend(v4, "finishTasksAndInvalidate");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[BAURLSession connectionLock](self, "connectionLock"));
  objc_msgSend(v5, "unlock");

}

- (void)cancel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLSession connectionLock](self, "connectionLock"));
  objc_msgSend(v3, "lock");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLSession downloadTask](self, "downloadTask"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLSession downloadTask](self, "downloadTask"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000113A0;
    v8[3] = &unk_100058D38;
    v8[4] = self;
    objc_msgSend(v5, "cancelByProducingResumeData:", v8);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLSession baURLSessionDelegate](self, "baURLSessionDelegate"));
    objc_msgSend(v5, "cancel");
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLSession urlSession](self, "urlSession"));
  objc_msgSend(v6, "invalidateAndCancel");

  -[BAURLSession setUrlSession:](self, "setUrlSession:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLSession connectionLock](self, "connectionLock"));
  objc_msgSend(v7, "unlock");

}

- (void)startAsyncDownloadNotifyingOnQueue:(id)a3 sessionConfiguration:(id)a4 bytesReceivedHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BAURLSessionDelegate *v18;
  void *v19;
  _BAURLSessionDelegate *v20;
  _BAURLSessionDelegate *baURLSessionDelegate;
  void *v22;
  NSURLSession *v23;
  NSURLSession *urlSession;
  void *v25;
  id v26;
  void *v27;
  id v28;
  _QWORD *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSURLSessionDownloadTask *v35;
  NSURLSessionDownloadTask *downloadTask;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSURLSessionDownloadTask *v42;
  NSURLSessionDownloadTask *v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  unsigned int v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char v62;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_autoreleasePoolPush();
  v15 = v14;
  if (v10)
  {
    v53 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLSession connectionLock](self, "connectionLock"));
    objc_msgSend(v16, "lock");

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLSession urlSession](self, "urlSession"));
    objc_msgSend(v17, "invalidateAndCancel");

    -[BAURLSession setUrlSession:](self, "setUrlSession:", 0);
    -[BAURLSession setBaURLSessionDelegate:](self, "setBaURLSessionDelegate:", 0);
    -[BAURLSession setDownloadTask:](self, "setDownloadTask:", 0);
    v18 = [_BAURLSessionDelegate alloc];
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLSession destinationDirectory](self, "destinationDirectory"));
    v20 = -[_BAURLSessionDelegate initWithNotifyQueue:withDestinationDirectory:uniqueFileName:inBackground:withAuthenticationHandler:withRedirectResponseHandler:withBytesReceivedHandler:usingBlock:](v18, "initWithNotifyQueue:withDestinationDirectory:uniqueFileName:inBackground:withAuthenticationHandler:withRedirectResponseHandler:withBytesReceivedHandler:usingBlock:", v10, v19, -[BAURLSession useUniqueFileName](self, "useUniqueFileName"), self->_inBackground, self->_challengeBlock, self->_redirectResponseBlock, v12, v13);
    baURLSessionDelegate = self->_baURLSessionDelegate;
    self->_baURLSessionDelegate = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLSession baURLSessionDelegate](self, "baURLSessionDelegate"));
    v23 = (NSURLSession *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v11, v22, 0));
    urlSession = self->_urlSession;
    self->_urlSession = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLSession urlRequest](self, "urlRequest"));
    v26 = objc_msgSend(v25, "copy");

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLSession connectionLock](self, "connectionLock"));
    objc_msgSend(v27, "unlock");

    v59 = 0;
    v60 = &v59;
    v61 = 0x2020000000;
    v62 = 0;
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_1000118F8;
    v54[3] = &unk_100058D88;
    v28 = v26;
    v55 = v28;
    v58 = &v59;
    v56 = v10;
    v57 = v13;
    v29 = objc_retainBlock(v54);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLSession urlSession](self, "urlSession"));

    if (v30)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLSession connectionLock](self, "connectionLock"));
      objc_msgSend(v31, "lock");
      v52 = v11;

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLSession resumeData](self, "resumeData"));
      if (v32)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLSession urlSession](self, "urlSession"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLSession resumeData](self, "resumeData"));
        v35 = (NSURLSessionDownloadTask *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "downloadTaskWithResumeData:", v34));
        downloadTask = self->_downloadTask;
        self->_downloadTask = v35;

        v37 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLSession downloadTask](self, "downloadTask"));
        if (!v37)
        {
          *((_BYTE *)v60 + 24) = 1;
          ((void (*)(_QWORD *))v29[2])(v29);
        }
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLSession downloadTask](self, "downloadTask"));
        -[BAURLSession setResumeData:](self, "setResumeData:", 0);
      }
      else if (self->_inBackground
             || (v40 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLSession destinationDirectory](self, "destinationDirectory")),
                 v40,
                 v40))
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLSession urlSession](self, "urlSession"));
        v42 = (NSURLSessionDownloadTask *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "downloadTaskWithRequest:", v28));
        v43 = self->_downloadTask;
        self->_downloadTask = v42;

        v44 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLSession downloadTask](self, "downloadTask"));
        if (!v44)
        {
          *((_BYTE *)v60 + 24) = 1;
          ((void (*)(_QWORD *))v29[2])(v29);
        }
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLSession downloadTask](self, "downloadTask"));
      }
      else
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLSession urlSession](self, "urlSession"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "dataTaskWithRequest:", v28));

        if (!v38)
        {
          *((_BYTE *)v60 + 24) = 1;
          ((void (*)(_QWORD *))v29[2])(v29);
        }
      }
      -[BAURLSession initialConnectivityTimeout](self, "initialConnectivityTimeout");
      if (v45 >= 0.0)
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLSession urlSession](self, "urlSession"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "configuration"));
        v48 = objc_msgSend(v47, "waitsForConnectivity");

        if (v48)
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLSession baURLSessionDelegate](self, "baURLSessionDelegate"));
          -[BAURLSession initialConnectivityTimeout](self, "initialConnectivityTimeout");
          objc_msgSend(v49, "installConnectivityTimerWithTimeout:task:", v38);

        }
      }
      objc_msgSend(v38, "resume");
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[BAURLSession connectionLock](self, "connectionLock"));
      objc_msgSend(v50, "unlock");

      v11 = v52;
    }
    else
    {
      -[BAURLSession setBaURLSessionDelegate:](self, "setBaURLSessionDelegate:", 0);
      ((void (*)(_QWORD *))v29[2])(v29);
    }

    _Block_object_dispose(&v59, 8);
    v15 = v53;
  }
  else
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, CFSTR("A queue must be passed to _startAsyncDownloadNotifyingOnQueue:"), 0));
    objc_msgSend(v39, "raise");

  }
  objc_autoreleasePoolPop(v15);

}

- (BOOL)useUniqueFileName
{
  return self->_useUniqueFileName;
}

- (void)setUseUniqueFileName:(BOOL)a3
{
  self->_useUniqueFileName = a3;
}

- (double)initialConnectivityTimeout
{
  return self->_initialConnectivityTimeout;
}

- (void)setInitialConnectivityTimeout:(double)a3
{
  self->_initialConnectivityTimeout = a3;
}

- (NSLock)connectionLock
{
  return (NSLock *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConnectionLock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSURLSession)urlSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUrlSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSURLSessionDownloadTask)downloadTask
{
  return (NSURLSessionDownloadTask *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDownloadTask:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (_BAURLSessionDelegate)baURLSessionDelegate
{
  return (_BAURLSessionDelegate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBaURLSessionDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSData)resumeData
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setResumeData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSURLRequest)urlRequest
{
  return self->_urlRequest;
}

- (void)setUrlRequest:(id)a3
{
  objc_storeStrong((id *)&self->_urlRequest, a3);
}

- (NSString)destinationDirectory
{
  return self->_destinationDirectory;
}

- (void)setDestinationDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_destinationDirectory, a3);
}

- (BOOL)inBackground
{
  return self->_inBackground;
}

- (void)setInBackground:(BOOL)a3
{
  self->_inBackground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationDirectory, 0);
  objc_storeStrong((id *)&self->_urlRequest, 0);
  objc_storeStrong((id *)&self->_resumeData, 0);
  objc_storeStrong((id *)&self->_baURLSessionDelegate, 0);
  objc_storeStrong((id *)&self->_downloadTask, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_connectionLock, 0);
  objc_storeStrong(&self->_redirectResponseBlock, 0);
  objc_storeStrong(&self->_challengeBlock, 0);
}

@end
