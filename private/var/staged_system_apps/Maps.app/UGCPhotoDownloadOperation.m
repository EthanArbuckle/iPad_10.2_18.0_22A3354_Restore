@implementation UGCPhotoDownloadOperation

- (UGCPhotoDownloadOperation)initWithPhotoInfo:(id)a3 completionQueue:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  UGCPhotoDownloadOperation *v12;
  UGCPhotoDownloadOperation *v13;
  id v14;
  id completionBlock;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)UGCPhotoDownloadOperation;
  v12 = -[UGCPhotoDownloadOperation init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_photoInfo, a3);
    v13->_finished = 0;
    v13->_executing = 0;
    v14 = objc_msgSend(v11, "copy");
    completionBlock = v13->_completionBlock;
    v13->_completionBlock = v14;

    objc_storeStrong((id *)&v13->_completionQueue, a4);
  }

  return v13;
}

- (void)start
{
  if (-[UGCPhotoDownloadOperation isCancelled](self, "isCancelled"))
  {
    -[UGCPhotoDownloadOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    self->_finished = 1;
    -[UGCPhotoDownloadOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  }
  else
  {
    -[UGCPhotoDownloadOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    self->_executing = 1;
    -[UGCPhotoDownloadOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
    -[UGCPhotoDownloadOperation main](self, "main");
  }
}

- (void)main
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSURLSessionDataTask *v7;
  NSURLSessionDataTask *downloadTask;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, uint64_t, void *);
  void *v12;
  id v13;
  id location;

  v3 = objc_alloc((Class)NSURLRequest);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCDownloadablePhotoInfo url](self->_photoInfo, "url"));
  -[UGCDownloadablePhotoInfo timeoutInterval](self->_photoInfo, "timeoutInterval");
  v5 = objc_msgSend(v3, "initWithURL:cachePolicy:timeoutInterval:", v4, 2);

  objc_initWeak(&location, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sharedSession](NSURLSession, "sharedSession"));
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_100318324;
  v12 = &unk_1011B1700;
  objc_copyWeak(&v13, &location);
  v7 = (NSURLSessionDataTask *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataTaskWithRequest:completionHandler:", v5, &v9));
  downloadTask = self->_downloadTask;
  self->_downloadTask = v7;

  -[NSURLSessionDataTask resume](self->_downloadTask, "resume", v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)_completeOperation
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = sub_10043317C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoDownloadOperation name](self, "name"));
    v6 = 138412290;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Download operation finished %@", (uint8_t *)&v6, 0xCu);

  }
  -[UGCPhotoDownloadOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  -[UGCPhotoDownloadOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  self->_executing = 0;
  self->_finished = 1;
  -[UGCPhotoDownloadOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  -[UGCPhotoDownloadOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)cancel
{
  objc_super v3;

  -[NSURLSessionDataTask cancel](self->_downloadTask, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)UGCPhotoDownloadOperation;
  -[UGCPhotoDownloadOperation cancel](&v3, "cancel");
}

- (NSError)downloadError
{
  return self->_downloadError;
}

- (NSData)downloadedImageData
{
  return self->_downloadedImageData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadedImageData, 0);
  objc_storeStrong((id *)&self->_downloadError, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_downloadTask, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_photoInfo, 0);
}

@end
