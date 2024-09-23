@implementation AAS3DownloadRequest

- (AAS3DownloadRequest)initWithSession:(id)a3 size:(unint64_t)a4 atOffset:(int64_t)a5 destinationBuffer:(char *)a6 destinationStream:(AAAsyncByteStream_impl *)a7 completionSemaphore:(id)a8
{
  id v14;
  id v15;
  AAS3DownloadRequest *v16;
  AAS3DownloadRequest *v17;
  id v18;
  id v19;
  NSMutableURLRequest *v20;
  NSMutableURLRequest *urlRequest;
  float v22;
  NSMutableURLRequest *v23;
  NSString *v24;
  AAS3DownloadRequest *v25;
  objc_super v27;
  char __str[200];

  v14 = a3;
  v15 = a8;
  v27.receiver = self;
  v27.super_class = (Class)AAS3DownloadRequest;
  v16 = -[AAS3DownloadRequest init](&v27, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_downloadSession, v14);
    v18 = objc_alloc((Class)NSMutableURLRequest);
    v19 = objc_msgSend(v14, "url");
    v20 = (NSMutableURLRequest *)objc_msgSend(v18, "initWithURL:", v19);
    urlRequest = v17->_urlRequest;
    v17->_urlRequest = v20;

    v17->_nbyte = a4;
    v17->_offset = a5;
    v17->_buf = a6;
    v17->_stream = a7;
    objc_storeWeak((id *)&v17->_sem, v15);
    v17->_remainingAttempts = objc_msgSend(v14, "maxAttempts");
    objc_msgSend(v14, "pauseInterval");
    v17->_pauseInterval = v22;
    v17->_status = 0;
    snprintf(__str, 0xC8uLL, "bytes=%llu-%llu", a5, a4 + a5 - 1);
    v23 = v17->_urlRequest;
    v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", __str);
    -[NSMutableURLRequest addValue:forHTTPHeaderField:](v23, "addValue:forHTTPHeaderField:", v24, CFSTR("Range"));

    v25 = v17;
  }

  return v17;
}

- (int)createAndResumeTask
{
  uint64_t v3;
  uint64_t v4;
  AAS3DownloadSession *v5;
  NSURLSession *v6;
  NSMutableURLRequest *v7;
  NSURLSessionDataTask *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *, id);
  void *v16;
  id v17;
  id location;

  if (-[AAS3DownloadRequest remainingAttempts](self, "remainingAttempts"))
  {
    -[AAS3DownloadRequest setRemainingAttempts:](self, "setRemainingAttempts:", -[AAS3DownloadRequest remainingAttempts](self, "remainingAttempts") - 1);
    objc_initWeak(&location, self);
    v5 = -[AAS3DownloadRequest downloadSession](self, "downloadSession");
    v6 = -[AAS3DownloadSession urlSession](v5, "urlSession");
    v7 = -[AAS3DownloadRequest urlRequest](self, "urlRequest");
    v13 = _NSConcreteStackBlock;
    v14 = 3254779904;
    v15 = sub_100020794;
    v16 = &unk_10016F498;
    objc_copyWeak(&v17, &location);
    v8 = -[NSURLSession dataTaskWithRequest:completionHandler:](v6, "dataTaskWithRequest:completionHandler:", v7, &v13);

    if (v8)
    {
      -[NSURLSessionDataTask resume](v8, "resume", v13, v14, v15, v16);
      v11 = 0;
    }
    else
    {
      sub_100024658((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m", (uint64_t)"-[AAS3DownloadRequest createAndResumeTask]", 164, 121, 0, "dataTaskWithRequest", v9, v10, (char)v13);
      v11 = -1;
    }

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    sub_100024658((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m", (uint64_t)"-[AAS3DownloadRequest createAndResumeTask]", 150, 121, 0, "no more attempts allowed", v3, v4, (char)v13);
    return -1;
  }
  return v11;
}

- (AAS3DownloadSession)downloadSession
{
  return (AAS3DownloadSession *)objc_loadWeakRetained((id *)&self->_downloadSession);
}

- (void)setDownloadSession:(id)a3
{
  objc_storeWeak((id *)&self->_downloadSession, a3);
}

- (NSMutableURLRequest)urlRequest
{
  return (NSMutableURLRequest *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUrlRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (unint64_t)nbyte
{
  return self->_nbyte;
}

- (void)setNbyte:(unint64_t)a3
{
  self->_nbyte = a3;
}

- (int64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(int64_t)a3
{
  self->_offset = a3;
}

- (char)buf
{
  return self->_buf;
}

- (void)setBuf:(char *)a3
{
  self->_buf = a3;
}

- (AAAsyncByteStream_impl)stream
{
  return self->_stream;
}

- (void)setStream:(AAAsyncByteStream_impl *)a3
{
  self->_stream = a3;
}

- (OS_dispatch_semaphore)sem
{
  return (OS_dispatch_semaphore *)objc_loadWeakRetained((id *)&self->_sem);
}

- (void)setSem:(id)a3
{
  objc_storeWeak((id *)&self->_sem, a3);
}

- (unsigned)remainingAttempts
{
  return self->_remainingAttempts;
}

- (void)setRemainingAttempts:(unsigned int)a3
{
  self->_remainingAttempts = a3;
}

- (float)pauseInterval
{
  return self->_pauseInterval;
}

- (void)setPauseInterval:(float)a3
{
  self->_pauseInterval = a3;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sem);
  objc_storeStrong((id *)&self->_urlRequest, 0);
  objc_destroyWeak((id *)&self->_downloadSession);
}

@end
