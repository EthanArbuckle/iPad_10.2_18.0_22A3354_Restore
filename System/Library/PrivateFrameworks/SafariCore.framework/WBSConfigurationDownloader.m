@implementation WBSConfigurationDownloader

- (WBSConfigurationDownloader)init
{

  return 0;
}

+ (id)new
{
  return 0;
}

- (WBSConfigurationDownloader)initWithFileName:(id)a3 dataTransformer:(id)a4
{
  id v6;
  id v7;
  WBSConfigurationDownloader *v8;
  WBSConfigurationDownloader *v9;
  uint64_t v10;
  NSURL *baseURL;
  uint64_t v12;
  NSString *fileName;
  WBSConfigurationDownloader *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WBSConfigurationDownloader;
  v8 = -[WBSConfigurationDownloader init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_transformer, a4);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://configuration.apple.com/configurations/internetservices/safari/"));
    v10 = objc_claimAutoreleasedReturnValue();
    baseURL = v9->_baseURL;
    v9->_baseURL = (NSURL *)v10;

    v12 = objc_msgSend(v6, "copy");
    fileName = v9->_fileName;
    v9->_fileName = (NSString *)v12;

    v14 = v9;
  }

  return v9;
}

- (void)downloadConfigurationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSURL *baseURL;
  void *v7;
  void *v8;
  id v9;
  NSURLSessionDataTask *v10;
  NSURLSessionDataTask *dataTask;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0C92C98], "sharedSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  baseURL = self->_baseURL;
  -[NSString stringByAppendingPathExtension:](self->_fileName, "stringByAppendingPathExtension:", CFSTR("plist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:](baseURL, "URLByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__WBSConfigurationDownloader_downloadConfigurationWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E649BB50;
  objc_copyWeak(&v14, &location);
  v9 = v4;
  v13 = v9;
  objc_msgSend(v5, "dataTaskWithURL:completionHandler:", v8, v12);
  v10 = (NSURLSessionDataTask *)objc_claimAutoreleasedReturnValue();
  dataTask = self->_dataTask;
  self->_dataTask = v10;

  -[NSURLSessionDataTask resume](self->_dataTask, "resume");
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __73__WBSConfigurationDownloader_downloadConfigurationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained && !*((_BYTE *)WeakRetained + 40))
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (v7)
    {
      objc_msgSend(WeakRetained[1], "objectFromData:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);
    }
  }

}

- (void)cancel
{
  self->_isCancelled = 1;
  -[NSURLSessionDataTask cancel](self->_dataTask, "cancel");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_transformer, 0);
}

@end
