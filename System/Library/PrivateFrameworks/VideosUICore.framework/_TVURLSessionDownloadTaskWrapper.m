@implementation _TVURLSessionDownloadTaskWrapper

- (_TVURLSessionDownloadTaskWrapper)initWithURL:(id)a3
{
  id v4;
  _TVURLSessionDownloadTaskWrapper *v5;
  uint64_t v6;
  NSURL *url;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TVURLSessionDownloadTaskWrapper;
  v5 = -[_TVURLSessionDownloadTaskWrapper init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    v5->_state = 1;
  }

  return v5;
}

- (int64_t)state
{
  return self->_state;
}

- (void)resumeWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12[2];
  id location;

  v4 = a3;
  if (self->_state == 1)
  {
    v5 = (void *)(self->_downloadTaskID + 1);
    self->_downloadTaskID = (int64_t)v5;
    self->_state = 0;
    objc_initWeak(&location, self);
    v6 = (void *)-[NSURL copy](self->_url, "copy");
    dispatch_get_global_queue(21, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64___TVURLSessionDownloadTaskWrapper_resumeWithCompletionHandler___block_invoke;
    block[3] = &unk_1E9F2C8C8;
    v10 = v6;
    v8 = v6;
    objc_copyWeak(v12, &location);
    v12[1] = v5;
    v11 = v4;
    dispatch_async(v7, block);

    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }

}

- (void)cancel
{
  NSURLSessionDownloadTask *downloadTask;

  self->_state = 1;
  -[NSURLSessionDownloadTask cancel](self->_downloadTask, "cancel");
  downloadTask = self->_downloadTask;
  self->_downloadTask = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadTask, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
