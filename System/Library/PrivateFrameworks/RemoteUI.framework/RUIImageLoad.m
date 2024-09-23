@implementation RUIImageLoad

- (void)dealloc
{
  objc_super v3;

  -[NSURLSession invalidateAndCancel](self->_urlSession, "invalidateAndCancel");
  v3.receiver = self;
  v3.super_class = (Class)RUIImageLoad;
  -[RUIImageLoad dealloc](&v3, sel_dealloc);
}

- (BOOL)receivedValidResponse:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  objc_opt_class();
  v4 = (objc_opt_isKindOfClass() & 1) == 0
    || (unint64_t)(objc_msgSend(v3, "statusCode") / 100 - 6) < 0xFFFFFFFFFFFFFFFELL;

  return v4;
}

- (void)start
{
  void *v3;
  NSURLSession *urlSession;
  void *v5;
  void *v6;
  NSURLSession *v7;
  NSURLSession *v8;
  NSURLSessionDataTask *v9;
  NSURLSessionDataTask *dataTask;
  _QWORD v11[5];

  objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:", self->_URL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  urlSession = self->_urlSession;
  if (!urlSession)
  {
    v5 = (void *)MEMORY[0x24BDD1850];
    objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sessionWithConfiguration:", v6);
    v7 = (NSURLSession *)objc_claimAutoreleasedReturnValue();
    v8 = self->_urlSession;
    self->_urlSession = v7;

    urlSession = self->_urlSession;
  }
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __21__RUIImageLoad_start__block_invoke;
  v11[3] = &unk_24C297810;
  v11[4] = self;
  -[NSURLSession dataTaskWithRequest:completionHandler:](urlSession, "dataTaskWithRequest:completionHandler:", v3, v11);
  v9 = (NSURLSessionDataTask *)objc_claimAutoreleasedReturnValue();
  dataTask = self->_dataTask;
  self->_dataTask = v9;

  -[NSURLSessionDataTask resume](self->_dataTask, "resume");
}

void __21__RUIImageLoad_start__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = *(void **)(a1 + 32);
  v10 = a4;
  if ((objc_msgSend(v9, "receivedValidResponse:", v8) & 1) == 0)
  {
    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138412290;
        v17 = v8;
        _os_log_impl(&dword_209E87000, v11, OS_LOG_TYPE_DEFAULT, "RUIImageLoad received invalid response: %@", (uint8_t *)&v16, 0xCu);
      }

    }
    v7 = 0;
  }
  +[RUIImageLoader sharedImageLoader](RUIImageLoader, "sharedImageLoader");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_setImageData:forURL:error:", v7, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v10);

  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 16);
  *(_QWORD *)(v13 + 16) = 0;

  +[RUIImageLoader sharedImageLoader](RUIImageLoader, "sharedImageLoader");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_imageLoadFinished:", *(_QWORD *)(a1 + 32));

}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
}

@end
