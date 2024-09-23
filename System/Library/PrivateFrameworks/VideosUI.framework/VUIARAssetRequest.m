@implementation VUIARAssetRequest

- (VUIARAssetRequest)initWithRemoteURL:(id)a3 shareURL:(id)a4 fileName:(id)a5
{
  id v8;
  id v9;
  id v10;
  VUIARAssetRequest *v11;
  VUIARAssetRequest *v12;
  void *v13;
  void *v14;
  NSString *fileName;
  BOOL v16;
  NSString *v17;
  NSString *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)VUIARAssetRequest;
  v11 = -[VUIARAssetRequest init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    -[VUIARAssetRequest setFileName:](v11, "setFileName:", v10);
    -[VUIARAssetRequest setRemoteURL:](v12, "setRemoteURL:", v8);
    -[VUIARAssetRequest setShareURL:](v12, "setShareURL:", v9);
    objc_msgSend(v8, "relativePath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIARAssetRequest _prefixForString:](v12, "_prefixForString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    fileName = v12->_fileName;
    if (fileName)
      v16 = v14 == 0;
    else
      v16 = 1;
    if (v16)
    {
      v17 = fileName;
    }
    else
    {
      objc_msgSend(v14, "stringByAppendingString:");
      v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;
    -[VUIARAssetRequest setCacheKey:](v12, "setCacheKey:", v17);

  }
  return v12;
}

- (void)startDownloadWithSession:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[VUIARAssetRequest setCompletionHandler:](self, "setCompletionHandler:", a4);
  objc_msgSend(v6, "downloadTaskWithURL:", self->_remoteURL);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[VUIARAssetRequest setTask:](self, "setTask:", v7);
  -[VUIARAssetRequest setIsDownloading:](self, "setIsDownloading:", 1);
  objc_msgSend(v7, "resume");

}

- (void)cancelDownload
{
  id v3;

  -[VUIARAssetRequest setIsDownloading:](self, "setIsDownloading:", 0);
  -[VUIARAssetRequest task](self, "task");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

}

- (id)cachePath
{
  void *v3;
  void *v4;

  VUIRequireMainThread();
  objc_msgSend(MEMORY[0x1E0DC6970], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetPathForKey:inGroupOfType:", self->_cacheKey, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)cacheDownloadedFileFromLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  NSString *cacheKey;
  int v13;
  NSString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VUIRequireMainThread();
  if (v4 && self->_cacheKey)
  {
    objc_msgSend(MEMORY[0x1E0DC6970], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "relativePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImageAssetFromPath:forKey:inGroupOfType:expiryDate:", v6, self->_cacheKey, 3, 0);

    objc_msgSend(v5, "assetPathForKey:inGroupOfType:", self->_cacheKey, 3);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        v13 = 138412290;
        v14 = v7;
        _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIARAssetRequest - Downloaded file is successfully cached: %@", (uint8_t *)&v13, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v9)
      {
        cacheKey = self->_cacheKey;
        v13 = 138412546;
        v14 = cacheKey;
        v15 = 2112;
        v16 = v4;
        _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIARAssetRequest - Unable to cache the downloaded file with VUIAssetLibrary: %@, %@", (uint8_t *)&v13, 0x16u);
      }

      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)recordLog:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v13[0] = CFSTR("AR download failure");
    v12[0] = CFSTR("message");
    v12[1] = CFSTR("errorCode");
    v3 = (void *)MEMORY[0x1E0CB37E8];
    v4 = a3;
    objc_msgSend(v3, "numberWithLong:", objc_msgSend(v4, "code"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = (const __CFString *)v5;
    else
      v7 = &stru_1E9FF3598;
    v13[1] = v7;
    v12[2] = CFSTR("errorDomain");
    objc_msgSend(v4, "domain");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v9 = v8;
    else
      v9 = &stru_1E9FF3598;
    v13[2] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "recordLog:", v10);

  }
}

- (id)_prefixForString:(id)a3
{
  id v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    if (objc_msgSend(v3, "length"))
    {
      v4 = 0;
      v5 = 1;
      v6 = 0x7FFFFFFFLL;
      do
      {
        v6 ^= objc_msgSend(v3, "characterAtIndex:", v4);
        v4 = v5;
      }
      while (objc_msgSend(v3, "length") > (unint64_t)v5++);
    }
    else
    {
      v6 = 0x7FFFFFFFLL;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld_"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isDownloading
{
  return self->_isDownloading;
}

- (void)setIsDownloading:(BOOL)a3
{
  self->_isDownloading = a3;
}

- (NSURL)remoteURL
{
  return self->_remoteURL;
}

- (void)setRemoteURL:(id)a3
{
  objc_storeStrong((id *)&self->_remoteURL, a3);
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (void)setShareURL:(id)a3
{
  objc_storeStrong((id *)&self->_shareURL, a3);
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
  objc_storeStrong((id *)&self->_fileName, a3);
}

- (NSURLSessionDownloadTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

- (void)setCacheKey:(id)a3
{
  objc_storeStrong((id *)&self->_cacheKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_remoteURL, 0);
}

@end
