@implementation VUILayeredImageProxy

- (VUILayeredImageProxy)initWithURL:(id)a3
{
  return -[VUILayeredImageProxy initWithURL:groupType:](self, "initWithURL:groupType:", a3, 0);
}

- (VUILayeredImageProxy)initWithURL:(id)a3 groupType:(int64_t)a4
{
  return -[VUILayeredImageProxy initWithURL:groupType:assetKey:](self, "initWithURL:groupType:assetKey:", a3, 0, 0);
}

- (VUILayeredImageProxy)initWithURL:(id)a3 groupType:(int64_t)a4 assetKey:(id)a5
{
  id v8;
  id v9;
  VUILayeredImageProxy *v10;
  uint64_t v11;
  NSURL *url;
  uint64_t v13;
  NSString *assetKey;
  void *v15;
  uint64_t v16;
  NSString *v17;
  _TVURLSessionDownloadTaskWrapper *v18;
  _TVURLSessionDownloadTaskWrapper *downloadTaskWrapper;
  objc_super v21;

  v8 = a3;
  v9 = a5;
  v21.receiver = self;
  v21.super_class = (Class)VUILayeredImageProxy;
  v10 = -[VUILayeredImageProxy init](&v21, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    url = v10->_url;
    v10->_url = (NSURL *)v11;

    v10->_groupType = a4;
    v13 = objc_msgSend(v9, "copy");
    assetKey = v10->_assetKey;
    v10->_assetKey = (NSString *)v13;

    if (!v10->_assetKey)
    {
      -[NSURL absoluteString](v10->_url, "absoluteString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "vui_SHA256String");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v10->_assetKey;
      v10->_assetKey = (NSString *)v16;

    }
    v18 = -[_TVURLSessionDownloadTaskWrapper initWithURL:]([_TVURLSessionDownloadTaskWrapper alloc], "initWithURL:", v10->_url);
    downloadTaskWrapper = v10->_downloadTaskWrapper;
    v10->_downloadTaskWrapper = v18;

    v10->_cancelled = 0;
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[VUILayeredImageProxy cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)VUILayeredImageProxy;
  -[VUILayeredImageProxy dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)VUILayeredImageProxy;
  -[VUILayeredImageProxy description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILayeredImageProxy url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[VUILayeredImageProxy url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILayeredImageProxy url](self, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v4, "url");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUILayeredImageProxy url](self, "url");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)cancel
{
  if (-[VUILayeredImageProxy isLoading](self, "isLoading"))
    -[_TVURLSessionDownloadTaskWrapper cancel](self->_downloadTaskWrapper, "cancel");
  -[VUILayeredImageProxy setCancelled:](self, "setCancelled:", 1);
}

- (BOOL)isLoading
{
  return -[_TVURLSessionDownloadTaskWrapper state](self->_downloadTaskWrapper, "state") == 0;
}

- (BOOL)isImageAvailable
{
  void *v3;
  void *v4;
  BOOL v5;

  -[VUILayeredImageProxy assetKey](self, "assetKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILayeredImageProxy _assetPathWithAssetKey:](self, "_assetPathWithAssetKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length") != 0;

  return v5;
}

- (void)loadWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  int v10;
  _TVURLSessionDownloadTaskWrapper *downloadTaskWrapper;
  _QWORD v12[4];
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  id v15;
  id from;
  _QWORD v17[5];
  id v18;
  id v19;
  id location;

  v4 = a3;
  if (-[VUILayeredImageProxy isLoading](self, "isLoading"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-loadWithCompletion: called on an already loading VUILayeredImageProxy"));
  }
  else
  {
    -[VUILayeredImageProxy setCancelled:](self, "setCancelled:", 0);
    objc_initWeak(&location, self);
    v5 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __43__VUILayeredImageProxy_loadWithCompletion___block_invoke;
    v17[3] = &unk_1E9F2C918;
    objc_copyWeak(&v19, &location);
    v17[4] = self;
    v18 = v4;
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1DF08E588](v17);
    +[VUIPagePerformanceController postNotificationForImageProxy:withLoadingStatus:withError:](VUIPagePerformanceController, "postNotificationForImageProxy:withLoadingStatus:withError:", self, 1, 0);
    -[VUILayeredImageProxy assetKey](self, "assetKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILayeredImageProxy _assetPathWithAssetKey:](self, "_assetPathWithAssetKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "fileExistsAtPath:", v8),
          v9,
          v10))
    {
      ((void (**)(_QWORD, void *, _QWORD))v6)[2](v6, v8, 0);
    }
    else
    {
      objc_initWeak(&from, self);
      downloadTaskWrapper = self->_downloadTaskWrapper;
      v12[0] = v5;
      v12[1] = 3221225472;
      v12[2] = __43__VUILayeredImageProxy_loadWithCompletion___block_invoke_3;
      v12[3] = &unk_1E9F2C940;
      objc_copyWeak(&v15, &from);
      v13 = v7;
      v14 = v6;
      -[_TVURLSessionDownloadTaskWrapper resumeWithCompletionHandler:](downloadTaskWrapper, "resumeWithCompletionHandler:", v12);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&from);
    }

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

}

void __43__VUILayeredImageProxy_loadWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
    +[VUIPagePerformanceController postNotificationForImageProxy:withLoadingStatus:withError:](VUIPagePerformanceController, "postNotificationForImageProxy:withLoadingStatus:withError:", WeakRetained, 0, v6);
  objc_msgSend((id)objc_opt_class(), "_loadingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__VUILayeredImageProxy_loadWithCompletion___block_invoke_2;
  v12[3] = &unk_1E9F2C8F0;
  objc_copyWeak(&v16, (id *)(a1 + 48));
  v9 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = v9;
  v13 = v6;
  v10 = v5;
  v11 = v6;
  dispatch_async(v8, v12);

  objc_destroyWeak(&v16);
}

void __43__VUILayeredImageProxy_loadWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && *(_QWORD *)(a1 + 48))
  {
    v7 = WeakRetained;
    v3 = *(void **)(a1 + 32);
    if (v3 || (objc_msgSend(WeakRetained, "isCancelled") & 1) == 0)
    {
      v4 = v3;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -999, 0);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;
    v6 = 0;
    if (*(_QWORD *)(a1 + 40) && !v4)
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithContentsOfFile:", *(_QWORD *)(a1 + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    WeakRetained = v7;
  }

}

void __43__VUILayeredImageProxy_loadWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_opt_class();
    v10 = (objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v7, "statusCode") == 200;
    objc_msgSend(v16, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = 0;
    if (v11 && v10)
    {
      +[VUIAssetLibrary sharedInstance](VUIAssetLibrary, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "assetExpiryDateForKey:inGroupOfType:", *(_QWORD *)(a1 + 32), objc_msgSend(WeakRetained, "groupType"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setImageAssetFromPath:forKey:inGroupOfType:expiryDate:", v15, *(_QWORD *)(a1 + 32), 0, v14);

      objc_msgSend(v13, "assetPathForKey:inGroupOfType:", *(_QWORD *)(a1 + 32), objc_msgSend(WeakRetained, "groupType"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

+ (id)_loadingQueue
{
  if (_loadingQueue___once != -1)
    dispatch_once(&_loadingQueue___once, &__block_literal_global_19);
  return (id)_loadingQueue___loadingQueue;
}

void __37__VUILayeredImageProxy__loadingQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;
  NSObject *v3;

  v0 = dispatch_queue_create("com.apple.videosuicore.VUILayeredImageProxy", 0);
  v1 = (void *)_loadingQueue___loadingQueue;
  _loadingQueue___loadingQueue = (uint64_t)v0;

  v2 = _loadingQueue___loadingQueue;
  dispatch_get_global_queue(17, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v2, v3);

}

- (id)_assetPathWithAssetKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    +[VUIAssetLibrary sharedInstance](VUIAssetLibrary, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetPathForKey:inGroupOfType:", v4, self->_groupType);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSURL)url
{
  return self->_url;
}

- (int64_t)groupType
{
  return self->_groupType;
}

- (NSString)assetKey
{
  return self->_assetKey;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetKey, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_downloadTaskWrapper, 0);
}

@end
